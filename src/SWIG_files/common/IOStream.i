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

*/

%include <python/std_iostream.i>
%include <python/std_string.i>

// Standard_IStream
%typemap(in) std::istream& {
  PyObject* temp_bytes = PyUnicode_AsEncodedString($input, "UTF-8", "strict");
  std::string data(PyBytes_AsString(temp_bytes));
  std::stringstream* ss = new std::stringstream(data);
  $1 = ss;
}

%typemap(freearg) std::istream& {
  delete $1;
}

// Standard_SStream
%typemap(in) std::stringstream & {
  PyObject* temp_bytes = PyUnicode_AsEncodedString($input, "UTF-8", "strict");
  std::string data(PyBytes_AsString(temp_bytes));
  std::stringstream* ss = new std::stringstream(data);
  $1 = ss;
}

%typemap(freearg) std::stringstream & {
  delete $1;
}

%typemap(argout) std::ostream &OutValue {
    PyObject *o, *o2, *o3;
    
    std::string str = ((std::stringstream*)$1)->str();
    o = PyUnicode_FromString(str.c_str());
    
    if ((!$result) || ($result == Py_None)) {
        $result = o;
    } else {
        if (!PyTuple_Check($result)) {
            PyObject *o2 = $result;
            $result = PyTuple_New(1);
            PyTuple_SetItem($result,0,o2);
        }
        o3 = PyTuple_New(1);
        PyTuple_SetItem(o3,0,o);
        o2 = $result;
        $result = PySequence_Concat(o2,o3);
        Py_DECREF(o2);
        Py_DECREF(o3);
    }
}

%typemap(in, numinputs=0) std::ostream &OutValue (std::stringstream temp) {
    $1 = &temp;
}

