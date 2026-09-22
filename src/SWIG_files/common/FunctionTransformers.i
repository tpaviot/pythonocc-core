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

%{
#include <TopoDS.hxx>
#include <TCollection_AsciiString.hxx>
#include <TCollection_ExtendedString.hxx>
#include <TCollection_HAsciiString.hxx>
%}

%include <typemaps.i>

/*
Standard_CString parameter transformation
*/

/*
The string typemaps raise a TypeError if the argument is not a str (or, for
TCollection_ExtendedString/AsciiString, a wrapped object of that class): OCCT
must never get a NULL pointer. It throws Standard_NullObject outside of the
wrapper try/catch, which terminates the interpreter (issue #1494)
*/
%typemap(in) Standard_CString
{
    $1 = PyUnicode_AsUTF8($input);
    if (!$1) {
        SWIG_fail;
    }
}

%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) Standard_CString {
    $1 = PyUnicode_Check($input) ? 1 : 0;
}
%typemap(out) Standard_CString {
    $result = PyUnicode_FromString($1);
}

/*
TCollection_ExtendedString parameter transformation
*/

%typemap(in) TCollection_ExtendedString
{
    if (PyUnicode_Check($input)) {
        const char* utf8_string = PyUnicode_AsUTF8($input);
        if (!utf8_string) {
            SWIG_fail;
        }
        $1 = TCollection_ExtendedString(utf8_string, true);
    } else {
        void* argp = 0;
        if (!SWIG_IsOK(SWIG_ConvertPtr($input, &argp, $descriptor(TCollection_ExtendedString *), 0)) || !argp) {
            PyErr_SetString(PyExc_TypeError, "expected a str or a TCollection_ExtendedString");
            SWIG_fail;
        }
        $1 = *reinterpret_cast<TCollection_ExtendedString*>(argp);
    }
}
%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) TCollection_ExtendedString {
    void* argp = 0;
    $1 = (PyUnicode_Check($input) ||
          SWIG_IsOK(SWIG_ConvertPtr($input, &argp, $descriptor(TCollection_ExtendedString *), SWIG_POINTER_NO_NULL))) ? 1 : 0;
}
%typemap(out) TCollection_ExtendedString {
    // convert the TCollection_ExtendedString to TCollection_AsciiString
    $result = PyUnicode_FromString(TCollection_AsciiString($1).ToCString());
}

/*
TCollection_AsciiString parameter transformation
*/

%typemap(in) TCollection_AsciiString
{
    if (PyUnicode_Check($input)) {
        Py_ssize_t utf8_length = 0;
        const char* utf8_string = PyUnicode_AsUTF8AndSize($input, &utf8_length);
        if (!utf8_string) {
            SWIG_fail;
        }
        $1 = TCollection_AsciiString(utf8_string, static_cast<int>(utf8_length));
    } else {
        void* argp = 0;
        if (!SWIG_IsOK(SWIG_ConvertPtr($input, &argp, $descriptor(TCollection_AsciiString *), 0)) || !argp) {
            PyErr_SetString(PyExc_TypeError, "expected a str or a TCollection_AsciiString");
            SWIG_fail;
        }
        $1 = *reinterpret_cast<TCollection_AsciiString*>(argp);
    }
}
%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) TCollection_AsciiString {
    void* argp = 0;
    $1 = (PyUnicode_Check($input) ||
          SWIG_IsOK(SWIG_ConvertPtr($input, &argp, $descriptor(TCollection_AsciiString *), SWIG_POINTER_NO_NULL))) ? 1 : 0;
}
%typemap(out) TCollection_AsciiString {
    $result = PyUnicode_FromString($1.ToCString());
}

/*
TCollection_HAsciiString output by ref parameter transformation
*/
%typemap(argout) opencascade::handle<TCollection_HAsciiString> &OutValue {
    PyObject *o = PyUnicode_FromString((*$1)->ToCString());
    $result = SWIG_AppendOutput($result, o);
}

%typemap(in,numinputs=0) opencascade::handle<TCollection_HAsciiString>  &OutValue(opencascade::handle<TCollection_HAsciiString>  temp) {
    $1 = &temp;
}

/*
Standard_ShortReal & function transformation
*/
%typemap(argout) Standard_ShortReal &OutValue {
    PyObject *o = PyFloat_FromDouble(*$1);
    $result = SWIG_AppendOutput($result, o);
}

%typemap(in,numinputs=0) Standard_ShortReal &OutValue(Standard_ShortReal temp) {
    $1 = &temp;
}

/*
Standard_Real & function transformation
*/
%typemap(argout) Standard_Real &OutValue {
    PyObject *o = PyFloat_FromDouble(*$1);
    $result = SWIG_AppendOutput($result, o);
}

%typemap(in,numinputs=0) Standard_Real &OutValue(Standard_Real temp) {
    $1 = &temp;
}

/*
Standard_Integer & function transformation
*/
%typemap(argout) Standard_Integer &OutValue {
    PyObject *o = PyLong_FromLong(*$1);
    $result = SWIG_AppendOutput($result, o);
}

%typemap(in,numinputs=0) Standard_Integer &OutValue(Standard_Integer temp) {
    $1 = &temp;
}

/*
Standard_Boolean & function transformation
*/
%typemap(argout) Standard_Boolean &OutValue {
    PyObject *o = PyBool_FromLong(*$1);
    $result = SWIG_AppendOutput($result, o);
}

%typemap(in,numinputs=0) Standard_Boolean &OutValue(Standard_Boolean temp) {
    $1 = &temp;
}

%typemap(out) TopoDS_Shape {
    TopoDS_Shape* sh = &$1;
    if (!sh || sh->IsNull()) {
        // Use $result instead of Py_RETURN_NONE to allow SWIG cleanup code to run
        $result = Py_None;
        Py_INCREF(Py_None);
    }
    else {
        switch (sh->ShapeType())
        {
          case TopAbs_COMPOUND: {
            TopoDS_Compound* ptr = new TopoDS_Compound(TopoDS::Compound(*sh));
            $result = SWIG_NewPointerObj(ptr, SWIGTYPE_p_TopoDS_Compound, SWIG_POINTER_OWN |  0);
            if (!$result) delete ptr;
            break;
          }
          case TopAbs_COMPSOLID: {
            TopoDS_CompSolid* ptr = new TopoDS_CompSolid(TopoDS::CompSolid(*sh));
            $result = SWIG_NewPointerObj(ptr, SWIGTYPE_p_TopoDS_CompSolid, SWIG_POINTER_OWN |  0 );
            if (!$result) delete ptr;
            break;
          }
          case TopAbs_SOLID: {
            TopoDS_Solid* ptr = new TopoDS_Solid(TopoDS::Solid(*sh));
            $result = SWIG_NewPointerObj(ptr, SWIGTYPE_p_TopoDS_Solid, SWIG_POINTER_OWN |  0 );
            if (!$result) delete ptr;
            break;
          }
          case TopAbs_SHELL: {
            TopoDS_Shell* ptr = new TopoDS_Shell(TopoDS::Shell(*sh));
            $result = SWIG_NewPointerObj(ptr, SWIGTYPE_p_TopoDS_Shell, SWIG_POINTER_OWN |  0 );
            if (!$result) delete ptr;
            break;
          }
          case TopAbs_FACE: {
            TopoDS_Face* ptr = new TopoDS_Face(TopoDS::Face(*sh));
            $result = SWIG_NewPointerObj(ptr, SWIGTYPE_p_TopoDS_Face, SWIG_POINTER_OWN |  0 );
            if (!$result) delete ptr;
            break;
          }
          case TopAbs_WIRE: {
            TopoDS_Wire* ptr = new TopoDS_Wire(TopoDS::Wire(*sh));
            $result = SWIG_NewPointerObj(ptr, SWIGTYPE_p_TopoDS_Wire, SWIG_POINTER_OWN |  0 );
            if (!$result) delete ptr;
            break;
          }
          case TopAbs_EDGE: {
            TopoDS_Edge* ptr = new TopoDS_Edge(TopoDS::Edge(*sh));
            $result = SWIG_NewPointerObj(ptr, SWIGTYPE_p_TopoDS_Edge, SWIG_POINTER_OWN |  0 );
            if (!$result) delete ptr;
            break;
          }
          case TopAbs_VERTEX: {
            TopoDS_Vertex* ptr = new TopoDS_Vertex(TopoDS::Vertex(*sh));
            $result = SWIG_NewPointerObj(ptr, SWIGTYPE_p_TopoDS_Vertex, SWIG_POINTER_OWN |  0 );
            if (!$result) delete ptr;
            break;
          }
          default:
            break;
        }
    }
}

// Return TopoDS_Shapes by copy, as we could get lifetimes errors
%typemap(out) const TopoDS_Shape& {
    TopoDS_Shape* sh = $1;
    if (!sh || sh->IsNull()) {
        // Use $result instead of Py_RETURN_NONE to allow SWIG cleanup code to run
        $result = Py_None;
        Py_INCREF(Py_None);
    }
    else {
        switch (sh->ShapeType())
        {
          case TopAbs_COMPOUND: {
            TopoDS_Compound* ptr = new TopoDS_Compound(TopoDS::Compound(*sh));
            $result = SWIG_NewPointerObj(ptr, SWIGTYPE_p_TopoDS_Compound, SWIG_POINTER_OWN |  0);
            if (!$result) delete ptr;
            break;
          }
          case TopAbs_COMPSOLID: {
            TopoDS_CompSolid* ptr = new TopoDS_CompSolid(TopoDS::CompSolid(*sh));
            $result = SWIG_NewPointerObj(ptr, SWIGTYPE_p_TopoDS_CompSolid, SWIG_POINTER_OWN |  0 );
            if (!$result) delete ptr;
            break;
          }
          case TopAbs_SOLID: {
            TopoDS_Solid* ptr = new TopoDS_Solid(TopoDS::Solid(*sh));
            $result = SWIG_NewPointerObj(ptr, SWIGTYPE_p_TopoDS_Solid, SWIG_POINTER_OWN |  0 );
            if (!$result) delete ptr;
            break;
          }
          case TopAbs_SHELL: {
            TopoDS_Shell* ptr = new TopoDS_Shell(TopoDS::Shell(*sh));
            $result = SWIG_NewPointerObj(ptr, SWIGTYPE_p_TopoDS_Shell, SWIG_POINTER_OWN |  0 );
            if (!$result) delete ptr;
            break;
          }
          case TopAbs_FACE: {
            TopoDS_Face* ptr = new TopoDS_Face(TopoDS::Face(*sh));
            $result = SWIG_NewPointerObj(ptr, SWIGTYPE_p_TopoDS_Face, SWIG_POINTER_OWN |  0 );
            if (!$result) delete ptr;
            break;
          }
          case TopAbs_WIRE: {
            TopoDS_Wire* ptr = new TopoDS_Wire(TopoDS::Wire(*sh));
            $result = SWIG_NewPointerObj(ptr, SWIGTYPE_p_TopoDS_Wire, SWIG_POINTER_OWN |  0 );
            if (!$result) delete ptr;
            break;
          }
          case TopAbs_EDGE: {
            TopoDS_Edge* ptr = new TopoDS_Edge(TopoDS::Edge(*sh));
            $result = SWIG_NewPointerObj(ptr, SWIGTYPE_p_TopoDS_Edge, SWIG_POINTER_OWN |  0 );
            if (!$result) delete ptr;
            break;
          }
          case TopAbs_VERTEX: {
            TopoDS_Vertex* ptr = new TopoDS_Vertex(TopoDS::Vertex(*sh));
            $result = SWIG_NewPointerObj(ptr, SWIGTYPE_p_TopoDS_Vertex, SWIG_POINTER_OWN |  0 );
            if (!$result) delete ptr;
            break;
          }
          default:
            break;
        }
    }
}

/*
Return by copy the objects returned by const reference by the accessors of the
NCollection containers (NCollection_Array1::Value, NCollection_Sequence::First,
NCollection_DataMap::Find, ...), of their iterators and of the __getitem__
method added by ArrayMacros.i. By default the python
object points into the container storage and is invalid once the container is
deleted or resized (issue #1482). The more specific typemaps take precedence:
handles and Standard_Transient subclasses (reference counted), TopoDS_Shape
(already copied above), numbers and strings. The Change* accessors still
return a reference, to modify the container in place.
*/
%typemap(out) const SWIGTYPE & Value, const SWIGTYPE & First, const SWIGTYPE & Last,
              const SWIGTYPE & Find, const SWIGTYPE & Find1, const SWIGTYPE & Find2,
              const SWIGTYPE & FindKey, const SWIGTYPE & FindFromIndex,
              const SWIGTYPE & FindFromKey, const SWIGTYPE & Key,
              const SWIGTYPE & __getitem__ {
    $*1_ltype* copy = new $*1_ltype(*$1);
    $result = SWIG_NewPointerObj(SWIG_as_voidptr(copy), $descriptor, SWIG_POINTER_OWN);
    if (!$result) {
        delete copy;
        SWIG_fail;
    }
}


%define ENUM_OUTPUT_TYPEMAPS(TYPE)

%typemap(in,numinputs=0) TYPE &OutValue(TYPE temp) {
    $1 = &temp;
}

%typemap(argout) TYPE &OutValue {
    PyObject *o = PyLong_FromLong(static_cast<long>(*$1));
    $result = SWIG_AppendOutput($result, o);
}
%enddef 
