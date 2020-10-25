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

/*
Standard_OStream & function transformation
The float number is returned in the output tuple
*/
%typemap(argout) Standard_OStream &OutValue {
    PyObject *o, *o2, *o3;
    std::ostringstream *output = static_cast<std::ostringstream *> ($1);
    o = PyString_FromString(output->str().c_str());
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

%typemap(in, numinputs=0) Standard_OStream &OutValue (std::ostringstream temp) {
    $1 = &temp;
}

/*
Standard_IStream & function transformation
takes a string as input
*/
%typemap(in) Standard_IStream & {
    char * in = PyString_AsString($input);
    std::istringstream ss(in);
    $1 = &ss;
}
