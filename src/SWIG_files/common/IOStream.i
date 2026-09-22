/*
Copyright 2020 Thomas Paviot (tpaviot@gmail.com)
This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

Refactored for Python 3 only - No Python 2 support
*/

// The std::ostream/std::istream parameters are converted by the typemaps
// below: python/std_iostream.i is not included, it would wrap the ios_base,
// ostream, istream... classes and the cout/cerr variables in every module,
// and they can't be used from python.
%include <python/std_string.i>

//=============================================================================
// Python str/bytes data, as a C buffer
//=============================================================================
%fragment("pythonocc_stream_data", "header") {
#include <istream>
#include <sstream>
#include <streambuf>

// Returns the data of a str (UTF-8 encoded) or bytes object, without copy.
// The buffer is owned by the python object. Returns false and sets a
// TypeError if the object is neither a str nor a bytes.
static bool pythonocc_get_stream_data(PyObject* obj, const char** data, Py_ssize_t* size) {
    if (PyUnicode_Check(obj)) {
        *data = PyUnicode_AsUTF8AndSize(obj, size);
        return *data != nullptr;
    }
    if (PyBytes_Check(obj)) {
        char* bytes_data = nullptr;
        if (PyBytes_AsStringAndSize(obj, &bytes_data, size) != 0) {
            return false;
        }
        *data = bytes_data;
        return true;
    }
    PyErr_SetString(PyExc_TypeError, "Expected str or bytes object");
    return false;
}

// Read-only, seekable stream buffer over memory it doesn't own
class pythonocc_memory_streambuf : public std::streambuf {
public:
    pythonocc_memory_streambuf(const char* data, size_t size) {
        char* begin = const_cast<char*>(data);
        setg(begin, begin, begin + size);
    }

protected:
    pos_type seekoff(off_type off, std::ios_base::seekdir dir,
                     std::ios_base::openmode which = std::ios_base::in) override {
        if (!(which & std::ios_base::in)) {
            return pos_type(off_type(-1));
        }
        off_type base = 0;
        if (dir == std::ios_base::cur) {
            base = gptr() - eback();
        } else if (dir == std::ios_base::end) {
            base = egptr() - eback();
        }
        const off_type target = base + off;
        if (target < 0 || target > egptr() - eback()) {
            return pos_type(off_type(-1));
        }
        setg(eback(), eback() + target, egptr());
        return pos_type(target);
    }

    pos_type seekpos(pos_type pos, std::ios_base::openmode which = std::ios_base::in) override {
        return seekoff(off_type(pos), std::ios_base::beg, which);
    }
};

// Input stream reading the data of a python object without copying it: the
// object must be kept alive while the stream is used (the argument of the
// wrapped function is, during the call)
class pythonocc_memory_istream : public std::istream {
public:
    pythonocc_memory_istream(const char* data, size_t size)
        : std::istream(nullptr), myBuffer(data, size) {
        rdbuf(&myBuffer);
    }

private:
    pythonocc_memory_streambuf myBuffer;
};
}

//=============================================================================
// Input stream conversion: Python str/bytes -> std::istream&
//=============================================================================
%typemap(in, fragment="pythonocc_stream_data") std::istream& {
    const char* data_ptr = nullptr;
    Py_ssize_t data_size = 0;
    if (!pythonocc_get_stream_data($input, &data_ptr, &data_size)) {
        SWIG_fail;
    }
    $1 = new pythonocc_memory_istream(data_ptr, static_cast<size_t>(data_size));
}

%typemap(freearg) std::istream& {
    delete static_cast<pythonocc_memory_istream*>($1);
}

// Overload resolution, e.g. BinTools::Read(shape, stream) or (shape, filename).
// The precedence is lower than the one of the char* typecheck: a str is a
// file name if there is such an overload, a bytes is the stream data
%typemap(typecheck, precedence=SWIG_TYPECHECK_STRING_ARRAY) std::istream&, std::stringstream& {
    $1 = (PyUnicode_Check($input) || PyBytes_Check($input)) ? 1 : 0;
}

//=============================================================================
// String stream conversion: Python str/bytes -> std::stringstream&
//=============================================================================
%typemap(in, fragment="pythonocc_stream_data") std::stringstream& {
    const char* data_ptr = nullptr;
    Py_ssize_t data_size = 0;
    if (!pythonocc_get_stream_data($input, &data_ptr, &data_size)) {
        SWIG_fail;
    }
    std::stringstream* stream = new std::stringstream();
    stream->write(data_ptr, static_cast<std::streamsize>(data_size));
    $1 = stream;
}

%typemap(freearg) std::stringstream& {
    delete static_cast<std::stringstream*>($1);
}

//=============================================================================
// Output stream conversion: std::ostream& -> Python str or bytes (as return
// value)
//=============================================================================
%fragment("pythonocc_ostream", "header") {
#include <cstring>
#include <ostream>
#include <sstream>

// String buffer giving access to the written data without copying it
// (std::stringbuf::str() returns a copy)
class pythonocc_ostringbuf : public std::stringbuf {
public:
    void written_data(const char** data, size_t* size) {
        // seek to the high water mark, pptr may be before it if the writer
        // moved back with seekp
        pubseekoff(0, std::ios_base::end, std::ios_base::out);
        *data = pbase();
        *size = pbase() ? static_cast<size_t>(pptr() - pbase()) : 0;
    }
};

class pythonocc_ostringstream : public std::ostream {
public:
    pythonocc_ostringstream() : std::ostream(nullptr) {
        rdbuf(&myBuffer);
    }

    // Returns the written data as a str if it is text, i.e. valid UTF-8
    // without null character, else as a bytes. The data written by the
    // modules of the Bin* packages (BinTools, BinLDrivers...) is always
    // returned as a bytes: a short binary output can be valid UTF-8
    PyObject* to_python(const char* module_name) {
        const char* data = nullptr;
        size_t size = 0;
        myBuffer.written_data(&data, &size);
        if (!data) {
            data = "";
        }
        const bool binary_module = std::strncmp(module_name, "_Bin", 4) == 0;
        if (!binary_module && std::memchr(data, '\0', size) == nullptr) {
            PyObject* text = PyUnicode_DecodeUTF8(data, static_cast<Py_ssize_t>(size), nullptr);
            if (text) {
                return text;
            }
            if (!PyErr_ExceptionMatches(PyExc_UnicodeDecodeError)) {
                return nullptr;
            }
            PyErr_Clear();
        }
        return PyBytes_FromStringAndSize(data, static_cast<Py_ssize_t>(size));
    }

private:
    pythonocc_ostringbuf myBuffer;
};

// Adds the stream data to the result of the wrapped function: replaces None,
// else makes a tuple. Steals the reference to data. Returns nullptr on error
static PyObject* pythonocc_append_stream_output(PyObject* result, PyObject* data) {
    if (!result || result == Py_None) {
        Py_XDECREF(result);
        return data;
    }
    const Py_ssize_t old_size = PyTuple_Check(result) ? PyTuple_GET_SIZE(result) : 1;
    PyObject* new_tuple = PyTuple_New(old_size + 1);
    if (!new_tuple) {
        Py_DECREF(data);
        Py_DECREF(result);
        return nullptr;
    }
    if (PyTuple_Check(result)) {
        for (Py_ssize_t i = 0; i < old_size; ++i) {
            PyObject* item = PyTuple_GET_ITEM(result, i);
            Py_INCREF(item);
            PyTuple_SET_ITEM(new_tuple, i, item);
        }
        Py_DECREF(result);
    } else {
        PyTuple_SET_ITEM(new_tuple, 0, result);
    }
    PyTuple_SET_ITEM(new_tuple, old_size, data);
    return new_tuple;
}
}

%typemap(argout, fragment="pythonocc_ostream") std::ostream& OutValue {
    PyObject* stream_data = static_cast<pythonocc_ostringstream*>($1)->to_python(SWIG_name);
    if (!stream_data) {
        SWIG_fail;
    }
    $result = pythonocc_append_stream_output($result, stream_data);
    if (!$result) {
        SWIG_fail;
    }
}

//=============================================================================
// Output stream input parameter: Create temporary string stream
//=============================================================================
%typemap(in, numinputs=0, fragment="pythonocc_ostream") std::ostream& OutValue (pythonocc_ostringstream temp_stream) {
    $1 = &temp_stream;
}

// A returned stream (e.g. BinTools::PutReal returns its argument) can't be
// used from python, the std::ostream class is not wrapped: return None, which
// the argout typemap above replaces with the stream data
%typemap(out) std::ostream& {
    $result = SWIG_Py_Void();
}
