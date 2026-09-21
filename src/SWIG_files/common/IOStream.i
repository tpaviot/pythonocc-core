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
// Output stream conversion: std::ostream& -> Python str (as return value)
//=============================================================================
%typemap(argout) std::ostream& OutValue {
    // Extract content from the stringstream
    std::stringstream* ss = static_cast<std::stringstream*>($1);
    std::string content = ss->str();
    
    // Convert to Python Unicode string
    PyObject* py_str = PyUnicode_FromStringAndSize(content.c_str(), content.size());
    if (!py_str) {
        PyErr_SetString(PyExc_UnicodeError, "Failed to create Python string from stream content");
        SWIG_fail;
    }
    
    // Handle return value combination
    if (!$result || $result == Py_None) {
        // No existing return value or None - use our string as the result
        Py_XDECREF($result);
        $result = py_str;
    } else {
        // Existing return value - combine into tuple
        PyObject* current_result = $result;
        
        if (!PyTuple_Check(current_result)) {
            // Convert single value to tuple
            $result = PyTuple_New(1);
            if (!$result) {
                Py_DECREF(py_str);
                Py_DECREF(current_result);
                SWIG_fail;
            }
            PyTuple_SET_ITEM($result, 0, current_result);
            current_result = $result;
        }
        
        // Create new tuple with additional string
        Py_ssize_t old_size = PyTuple_GET_SIZE(current_result);
        PyObject* new_tuple = PyTuple_New(old_size + 1);
        if (!new_tuple) {
            Py_DECREF(py_str);
            Py_DECREF(current_result);
            SWIG_fail;
        }
        
        // Copy existing items
        for (Py_ssize_t i = 0; i < old_size; ++i) {
            PyObject* item = PyTuple_GET_ITEM(current_result, i);
            Py_INCREF(item);
            PyTuple_SET_ITEM(new_tuple, i, item);
        }
        
        // Add our string
        PyTuple_SET_ITEM(new_tuple, old_size, py_str);
        
        Py_DECREF(current_result);
        $result = new_tuple;
    }
}

//=============================================================================
// Output stream input parameter: Create temporary stringstream
//=============================================================================
%typemap(in, numinputs=0) std::ostream& OutValue (std::stringstream temp_stream) {
    $1 = &temp_stream;
}
