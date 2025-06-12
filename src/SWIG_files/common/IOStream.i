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

%include <python/std_iostream.i>
%include <python/std_string.i>

//=============================================================================
// Input stream conversion: Python str/bytes -> std::istream&
//=============================================================================
%typemap(in) std::istream& {
    if (!PyUnicode_Check($input) && !PyBytes_Check($input)) {
        PyErr_SetString(PyExc_TypeError, "Expected str or bytes object");
        SWIG_fail;
    }
    
    PyObject* encoded_bytes = nullptr;
    const char* data_ptr = nullptr;
    
    if (PyUnicode_Check($input)) {
        encoded_bytes = PyUnicode_AsEncodedString($input, "UTF-8", "strict");
        if (!encoded_bytes) {
            PyErr_SetString(PyExc_UnicodeError, "Failed to encode string as UTF-8");
            SWIG_fail;
        }
        data_ptr = PyBytes_AsString(encoded_bytes);
    } else {
        // Input is already bytes
        data_ptr = PyBytes_AsString($input);
        encoded_bytes = $input;
        Py_INCREF(encoded_bytes);
    }
    
    if (!data_ptr) {
        Py_XDECREF(encoded_bytes);
        PyErr_SetString(PyExc_ValueError, "Failed to extract string data");
        SWIG_fail;
    }
    
    std::string cpp_data(data_ptr);
    Py_DECREF(encoded_bytes);
    
    std::stringstream* stream = new std::stringstream(cpp_data);
    $1 = stream;
}

%typemap(freearg) std::istream& {
    delete static_cast<std::stringstream*>($1);
}

//=============================================================================
// String stream conversion: Python str/bytes -> std::stringstream&
//=============================================================================
%typemap(in) std::stringstream& {
    if (!PyUnicode_Check($input) && !PyBytes_Check($input)) {
        PyErr_SetString(PyExc_TypeError, "Expected str or bytes object");
        SWIG_fail;
    }
    
    PyObject* encoded_bytes = nullptr;
    const char* data_ptr = nullptr;
    
    if (PyUnicode_Check($input)) {
        encoded_bytes = PyUnicode_AsEncodedString($input, "UTF-8", "strict");
        if (!encoded_bytes) {
            PyErr_SetString(PyExc_UnicodeError, "Failed to encode string as UTF-8");
            SWIG_fail;
        }
        data_ptr = PyBytes_AsString(encoded_bytes);
    } else {
        // Input is already bytes
        data_ptr = PyBytes_AsString($input);
        encoded_bytes = $input;
        Py_INCREF(encoded_bytes);
    }
    
    if (!data_ptr) {
        Py_XDECREF(encoded_bytes);
        PyErr_SetString(PyExc_ValueError, "Failed to extract string data");
        SWIG_fail;
    }
    
    std::string cpp_data(data_ptr);
    Py_DECREF(encoded_bytes);
    
    std::stringstream* stream = new std::stringstream(cpp_data);
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
