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

%typemap(in) Standard_CString
{
    $1 = PyUnicode_AsUTF8($input);
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
    $1 = TCollection_ExtendedString(PyUnicode_AsUTF8($input), true);
}
%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) TCollection_ExtendedString {
    $1 = PyUnicode_Check($input) ? 1 : 0;
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
    $1 = TCollection_AsciiString(PyUnicode_AsUTF8($input));
}
%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) TCollection_AsciiString {
    $1 = PyUnicode_Check($input) ? 1 : 0;
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


%define ENUM_OUTPUT_TYPEMAPS(TYPE)

%typemap(in,numinputs=0) TYPE &OutValue(TYPE temp) {
    $1 = &temp;
}

%typemap(argout) TYPE &OutValue {
    PyObject *o = PyLong_FromLong(static_cast<long>(*$1));
    $result = SWIG_AppendOutput($result, o);
}
%enddef 
