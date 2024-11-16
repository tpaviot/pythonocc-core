/*

Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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

%{
#include <Standard_Failure.hxx>
#include <Standard_ErrorHandler.hxx>
#include <sstream>
%}

%inline %{
void process_exception(const Standard_Failure& error, const std::string& method_name, const std::string& class_name) {
    std::ostringstream oss;
    oss << error.DynamicType()->Name() << ": " << error.GetMessageString()
        << " raised from method " << method_name << " of class " << class_name;
    PyErr_SetString(PyExc_RuntimeError, oss.str().c_str());
}
%}

%exception
{
    try
    {
        OCC_CATCH_SIGNALS
        $action
    } 
    catch(const Standard_Failure& error)
    {
        process_exception(error, "$name", "$parentclassname");
        SWIG_fail;
    }
}
