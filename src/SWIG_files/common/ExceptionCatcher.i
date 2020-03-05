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
%}

%inline %{
void process_exception(Standard_Failure const& error, std::string method_name, std::string class_name) {
    std::string error_name = error.DynamicType()->Name();
	std::string error_message = error.GetMessageString();
	std::string message = error_name + error_message +
	                      " raised from method " + method_name + " of class " + class_name;
	PyErr_SetString(PyExc_RuntimeError, message.c_str());
}
%}

%exception
{
    try
    {
        OCC_CATCH_SIGNALS
        $action
    } 
    catch(Standard_Failure const& error)
    {
	    process_exception(error, "$name", "$parentclassname");
	    SWIG_fail;
    }
}
