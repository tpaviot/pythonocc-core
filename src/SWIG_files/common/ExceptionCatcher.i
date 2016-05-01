/*

Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)

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

/*
Exception handling
*/
%{
#include <Standard_Failure.hxx>
#include <Standard_ErrorHandler.hxx>
%}

%exception
{
    try
    {
        OCC_CATCH_SIGNALS
        $action
    } 
    catch(Standard_Failure)
    {
	    Handle(Standard_Failure) error = Standard_Failure::Caught ();
	    char *error_name = (char*) error->DynamicType()->Name();
	    char *error_message = (char*) error->GetMessageString();
	    std::string message;
	    if (error_name) message += std::string(error_name) + "\n";
	    if (error_message) message += std::string(error_message);
	    // raise the python exception
	    PyErr_SetString(PyExc_RuntimeError, message.c_str());
	    return NULL;
    }
}
