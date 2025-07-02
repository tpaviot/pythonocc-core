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
#include <Standard_TypeMismatch.hxx>
#include <Standard_DimensionError.hxx>
#include <Standard_DomainError.hxx>
#include <Standard_MultiplyDefined.hxx>
#include <Standard_NoSuchObject.hxx>
#include <Standard_NotImplemented.hxx>
#include <Standard_NullObject.hxx>
#include <Standard_NullValue.hxx>
#include <Standard_NumericError.hxx>
#include <Standard_OutOfMemory.hxx>
#include <Standard_OutOfRange.hxx>
#include <Standard_Overflow.hxx>
#include <Standard_RangeError.hxx>
#include <Standard_Underflow.hxx>
#include <sstream>
#include <iostream>
#include <typeinfo>
%}

%inline %{

// Configuration for debugging (can be enabled/disabled)
#ifndef PYTHONOCC_DEBUG_EXCEPTIONS
#define PYTHONOCC_DEBUG_EXCEPTIONS 0
#endif

// Utility function to get a readable class name
const char* get_readable_class_name(const char* class_name) noexcept {
    if (!class_name || strcmp(class_name, "$parentclassname") == 0 || class_name[0] == '\0') {
        return "Unknown";
    }
    return class_name;
}

// Utility function to get a readable method name
const char* get_readable_method_name(const char* method_name) noexcept {
    if (!method_name || strcmp(method_name, "$name") == 0 || method_name[0] == '\0') {
        return "Unknown";
    }
    return method_name;
}

// Mapping OpenCASCADE exceptions to appropriate Python exceptions
PyObject* get_exception_type(const Standard_Failure& error) {
    static const std::vector<std::pair<std::string_view, PyObject*>> exception_map = {
        {"OutOfRange",     PyExc_IndexError},
        {"RangeError",     PyExc_IndexError},
        {"OutOfMemory",    PyExc_MemoryError},
        {"NullObject",     PyExc_ValueError},
        {"NullValue",      PyExc_ValueError},
        {"TypeMismatch",   PyExc_TypeError},
        {"NotImplemented", PyExc_NotImplementedError},
        {"NoSuchObject",   PyExc_KeyError},
        {"DimensionError", PyExc_ValueError},
        {"DomainError",    PyExc_ValueError},
        {"NumericError",   PyExc_ArithmeticError},
        {"Overflow",       PyExc_ArithmeticError},
        {"Underflow",      PyExc_ArithmeticError},
        {"TooManyUsers",   PyExc_ResourceWarning}
    };

    const char* type_name = error.DynamicType()->Name();

    // Iterate over the table to find the mapping
    for (const auto& mapping : exception_map) {
        if (type_name.find(mapping.first) != std::string_view::npos) {
            return mapping.second;
        }
    }

    // Valeur par défaut si aucune correspondance n'est trouvée.
    return PyExc_RuntimeError;
}

// Main function for processing OpenCASCADE exceptions
void process_opencascade_exception(const Standard_Failure& error, 
                                  const std::string& method_name, 
                                  const std::string& class_name) {
    std::ostringstream oss;

    // Basic error information
    const char * error_type = error.DynamicType()->Name();
    const char * error_message = error.GetMessageString();
    const char * readable_class = get_readable_class_name(class_name);
    const char * readable_method = get_readable_method_name(method_name);

    // Error message construction
    oss << "OpenCASCADE Error [" << error_type << "]";

    if (error_message && *error_message) { // check c sttring is not empty or null
        oss << ": " << error_message;
    }

    oss << " (in " << readable_class;
    if (readable_method != "Unknown") {
        oss << "::" << readable_method;
    }
    oss << ")";

    // Debug information if enabled
    #if PYTHONOCC_DEBUG_EXCEPTIONS
    std::cerr << "[pythonOCC Debug] " << oss.str() << std::endl;
    #endif

    // Set Python exception with appropriate type
    PyObject* exception_type = get_exception_type(error);
    PyErr_SetString(exception_type, oss.str().c_str());
}

%}

// Enhanced exception macro with hierarchical exception handling
%exception
{
    try
    {
        // Capture system signals if macro is defined
        OCC_CATCH_SIGNALS
        $action
    }
    catch(const Standard_Failure& error)
    {
        process_opencascade_exception(error, "$name", "$parentclassname");
        SWIG_fail;
    }
    catch(const std::bad_alloc& e)
    {
        PyErr_SetString(PyExc_MemoryError, "Memory allocation failed in OpenCASCADE operation");
        SWIG_fail;
    }
}
