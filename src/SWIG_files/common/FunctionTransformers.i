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
    $result = PyString_FromString($1);
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
    $result = PyString_FromString($1.ToCString());
}

/*
TCollection_HAsciiString output by ref parameter transformation
*/
%typemap(argout) opencascade::handle<TCollection_HAsciiString> &OutValue {
    PyObject *o, *o2, *o3;
    opencascade::handle<TCollection_HAsciiString> thas = new TCollection_HAsciiString(*$1);
    o = PyString_FromString(thas->ToCString());
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

%typemap(in,numinputs=0) opencascade::handle<TCollection_HAsciiString>  &OutValue(opencascade::handle<TCollection_HAsciiString>  temp) {
    $1 = &temp;
}

/*
Standard_ShortReal & function transformation
*/
%typemap(argout) Standard_ShortReal &OutValue {
    PyObject *o, *o2, *o3;
    o = PyFloat_FromDouble(*$1);
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

%typemap(in,numinputs=0) Standard_ShortReal &OutValue(Standard_ShortReal temp) {
    $1 = &temp;
}

/*
Standard_Real & function transformation
*/
%typemap(argout) Standard_Real &OutValue {
    PyObject *o, *o2, *o3;
    o = PyFloat_FromDouble(*$1);
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

%typemap(in,numinputs=0) Standard_Real &OutValue(Standard_Real temp) {
    $1 = &temp;
}

/*
Standard_Integer & function transformation
*/
%typemap(argout) Standard_Integer &OutValue {
    PyObject *o, *o2, *o3;
    o = PyInt_FromLong(*$1);
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

%typemap(in,numinputs=0) Standard_Integer &OutValue(Standard_Integer temp) {
    $1 = &temp;
}

/*
Standard_Boolean & function transformation
*/
%typemap(argout) Standard_Boolean &OutValue {
    PyObject *o, *o2, *o3;
    o = PyBool_FromLong(*$1);
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

%typemap(in,numinputs=0) Standard_Boolean &OutValue(Standard_Boolean temp) {
    $1 = &temp;
}

%typemap(out) TopoDS_Shape {
    TopoDS_Shape* sh = &$1;
    PyObject *resultobj = 0;
    if (!sh || sh->IsNull()) {
        Py_RETURN_NONE;
    }
    else {
        TopAbs_ShapeEnum shape_type = sh->ShapeType();
        switch (shape_type)
        {
          case TopAbs_COMPOUND:
            resultobj = SWIG_NewPointerObj(new TopoDS_Compound(TopoDS::Compound(*sh)), SWIGTYPE_p_TopoDS_Compound, SWIG_POINTER_OWN |  0);
            break;
          case TopAbs_COMPSOLID:
            resultobj = SWIG_NewPointerObj(new TopoDS_CompSolid(TopoDS::CompSolid(*sh)), SWIGTYPE_p_TopoDS_CompSolid, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_SOLID:
            resultobj = SWIG_NewPointerObj(new TopoDS_Solid(TopoDS::Solid(*sh)), SWIGTYPE_p_TopoDS_Solid, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_SHELL:
            resultobj = SWIG_NewPointerObj(new TopoDS_Shell(TopoDS::Shell(*sh)), SWIGTYPE_p_TopoDS_Shell, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_FACE:
            resultobj = SWIG_NewPointerObj(new TopoDS_Face(TopoDS::Face(*sh)), SWIGTYPE_p_TopoDS_Face, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_WIRE:
            resultobj = SWIG_NewPointerObj(new TopoDS_Wire(TopoDS::Wire(*sh)), SWIGTYPE_p_TopoDS_Wire, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_EDGE:
            resultobj = SWIG_NewPointerObj(new TopoDS_Edge(TopoDS::Edge(*sh)), SWIGTYPE_p_TopoDS_Edge, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_VERTEX:
            resultobj = SWIG_NewPointerObj(new TopoDS_Vertex(TopoDS::Vertex(*sh)), SWIGTYPE_p_TopoDS_Vertex, SWIG_POINTER_OWN |  0 );
            break;
          default:
            break;
        }
    }
    return resultobj;
}

// Return TopoDS_Shapes by copy, as we could get lifetimes errors
%typemap(out) const TopoDS_Shape& {
    TopoDS_Shape* sh = $1;
    PyObject *resultobj = 0;
    if (!sh || sh->IsNull()) {
        Py_RETURN_NONE;
    }
    else {
        TopAbs_ShapeEnum shape_type = sh->ShapeType();
        switch (shape_type)
        {
          case TopAbs_COMPOUND:
            resultobj = SWIG_NewPointerObj(new TopoDS_Compound(TopoDS::Compound(*sh)), SWIGTYPE_p_TopoDS_Compound, SWIG_POINTER_OWN |  0);
            break;
          case TopAbs_COMPSOLID:
            resultobj = SWIG_NewPointerObj(new TopoDS_CompSolid(TopoDS::CompSolid(*sh)), SWIGTYPE_p_TopoDS_CompSolid, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_SOLID:
            resultobj = SWIG_NewPointerObj(new TopoDS_Solid(TopoDS::Solid(*sh)), SWIGTYPE_p_TopoDS_Solid, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_SHELL:
            resultobj = SWIG_NewPointerObj(new TopoDS_Shell(TopoDS::Shell(*sh)), SWIGTYPE_p_TopoDS_Shell, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_FACE:
            resultobj = SWIG_NewPointerObj(new TopoDS_Face(TopoDS::Face(*sh)), SWIGTYPE_p_TopoDS_Face, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_WIRE:
            resultobj = SWIG_NewPointerObj(new TopoDS_Wire(TopoDS::Wire(*sh)), SWIGTYPE_p_TopoDS_Wire, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_EDGE:
            resultobj = SWIG_NewPointerObj(new TopoDS_Edge(TopoDS::Edge(*sh)), SWIGTYPE_p_TopoDS_Edge, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_VERTEX:
            resultobj = SWIG_NewPointerObj(new TopoDS_Vertex(TopoDS::Vertex(*sh)), SWIGTYPE_p_TopoDS_Vertex, SWIG_POINTER_OWN |  0 );
            break;
          default:
            break;
        }
    }
    return resultobj;
}


%define ENUM_OUTPUT_TYPEMAPS(TYPE)

%typemap(in,numinputs=0) TYPE &OutValue(TYPE temp) {
    $1 = &temp;
}

%typemap(argout) TYPE &OutValue {
    PyObject *o, *o2, *o3;
    o = PyInt_FromLong(*$1);
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
%enddef 
