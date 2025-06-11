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
std::string get_readable_class_name(const std::string& class_name) {
    if (class_name.empty() || class_name == "$parentclassname") {
        return "Unknown";
    }
    return class_name;
}

// Utility function to get a readable method name
std::string get_readable_method_name(const std::string& method_name) {
    if (method_name.empty() || method_name == "$name") {
        return "Unknown";
    }
    return method_name;
}

// Mapping OpenCASCADE exceptions to appropriate Python exceptions
PyObject* get_exception_type(const Standard_Failure& error) {
    const Handle(Standard_Type)& error_type = error.DynamicType();
    const std::string type_name = error_type->Name();
    
    // Specific error type mapping
    if (type_name.find("OutOfRange") != std::string::npos || 
        type_name.find("RangeError") != std::string::npos) {
        return PyExc_IndexError;
    }
    else if (type_name.find("OutOfMemory") != std::string::npos) {
        return PyExc_MemoryError;
    }
    else if (type_name.find("NullObject") != std::string::npos || 
             type_name.find("NullValue") != std::string::npos) {
        return PyExc_ValueError;
    }
    else if (type_name.find("TypeMismatch") != std::string::npos) {
        return PyExc_TypeError;
    }
    else if (type_name.find("NotImplemented") != std::string::npos) {
        return PyExc_NotImplementedError;
    }
    else if (type_name.find("NoSuchObject") != std::string::npos) {
        return PyExc_KeyError;
    }
    else if (type_name.find("DimensionError") != std::string::npos || 
             type_name.find("DomainError") != std::string::npos) {
        return PyExc_ValueError;
    }
    else if (type_name.find("NumericError") != std::string::npos || 
             type_name.find("Overflow") != std::string::npos || 
             type_name.find("Underflow") != std::string::npos) {
        return PyExc_ArithmeticError;
    }
    else if (type_name.find("TooManyUsers") != std::string::npos) {
        return PyExc_ResourceWarning;
    }
    
    // Default to RuntimeError
    return PyExc_RuntimeError;
}

// Main function for processing OpenCASCADE exceptions
void process_opencascade_exception(const Standard_Failure& error, 
                                  const std::string& method_name, 
                                  const std::string& class_name) {
    std::ostringstream oss;
    
    // Basic error information
    const std::string error_type = error.DynamicType()->Name();
    const std::string error_message = error.GetMessageString();
    const std::string readable_class = get_readable_class_name(class_name);
    const std::string readable_method = get_readable_method_name(method_name);
    
    // Error message construction
    oss << "OpenCASCADE Error [" << error_type << "]";
    
    if (!error_message.empty()) {
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

// Function to handle C++ standard exceptions
void process_std_exception(const std::exception& e, 
                          const std::string& method_name, 
                          const std::string& class_name) {
    std::ostringstream oss;
    const std::string readable_class = get_readable_class_name(class_name);
    const std::string readable_method = get_readable_method_name(method_name);
    
    oss << "C++ Standard Exception: " << e.what();
    oss << " (in " << readable_class;
    if (readable_method != "Unknown") {
        oss << "::" << readable_method;
    }
    oss << ")";
    
    #if PYTHONOCC_DEBUG_EXCEPTIONS
    std::cerr << "[pythonOCC Debug] " << oss.str() << std::endl;
    #endif
    
    // Try to determine the appropriate exception type
    PyObject* exception_type = PyExc_RuntimeError;
    
    // Use typeid to determine the exact type
    const std::type_info& ti = typeid(e);
    const std::string type_name = ti.name();
    
    if (type_name.find("bad_alloc") != std::string::npos) {
        exception_type = PyExc_MemoryError;
    }
    else if (type_name.find("out_of_range") != std::string::npos) {
        exception_type = PyExc_IndexError;
    }
    else if (type_name.find("invalid_argument") != std::string::npos) {
        exception_type = PyExc_ValueError;
    }
    
    PyErr_SetString(exception_type, oss.str().c_str());
}

// Function for unknown exceptions
void process_unknown_exception(const std::string& method_name, 
                              const std::string& class_name) {
    std::ostringstream oss;
    const std::string readable_class = get_readable_class_name(class_name);
    const std::string readable_method = get_readable_method_name(method_name);
    
    oss << "Unknown C++ Exception";
    oss << " (in " << readable_class;
    if (readable_method != "Unknown") {
        oss << "::" << readable_method;
    }
    oss << ")";
    
    #if PYTHONOCC_DEBUG_EXCEPTIONS
    std::cerr << "[pythonOCC Debug] " << oss.str() << std::endl;
    #endif
    
    PyErr_SetString(PyExc_RuntimeError, oss.str().c_str());
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
    catch(const std::out_of_range& e)
    {
        process_std_exception(e, "$name", "$parentclassname");
        SWIG_fail;
    }
    catch(const std::invalid_argument& e)
    {
        process_std_exception(e, "$name", "$parentclassname");
        SWIG_fail;
    }
    catch(const std::exception& e)
    {
        process_std_exception(e, "$name", "$parentclassname");
        SWIG_fail;
    }
    catch(...)
    {
        process_unknown_exception("$name", "$parentclassname");
        SWIG_fail;
    }
}
