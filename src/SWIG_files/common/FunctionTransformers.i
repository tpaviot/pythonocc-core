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

/*
FairCurve_Analysis & function transformation
*/
%typemap(argout) FairCurve_AnalysisCode &OutValue {
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

%typemap(in,numinputs=0) FairCurve_AnalysisCode &OutValue(FairCurve_AnalysisCode temp) {
    $1 = &temp;
}

%typemap(out) TopoDS_Shape {
    PyObject *resultobj = 0;
    if(!$1.IsNull()){
        TopAbs_ShapeEnum shape_type = $1.ShapeType();
        switch (shape_type)
        {
          case TopAbs_COMPOUND:
            resultobj = SWIG_NewPointerObj((new TopoDS_Compound(static_cast< const TopoDS_Compound& >($1))),
                                            SWIGTYPE_p_TopoDS_Compound, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_COMPSOLID:
            resultobj = SWIG_NewPointerObj((new TopoDS_CompSolid(static_cast< const TopoDS_CompSolid& >($1))),
                                            SWIGTYPE_p_TopoDS_CompSolid, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_SOLID:
            resultobj = SWIG_NewPointerObj((new TopoDS_Solid(static_cast< const TopoDS_Solid& >($1))),
                                            SWIGTYPE_p_TopoDS_Solid, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_SHELL:
            resultobj = SWIG_NewPointerObj((new TopoDS_Shell(static_cast< const TopoDS_Shell& >($1))),
                                            SWIGTYPE_p_TopoDS_Shell, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_FACE:
            resultobj = SWIG_NewPointerObj((new TopoDS_Face(static_cast< const TopoDS_Face& >($1))),
                                            SWIGTYPE_p_TopoDS_Face, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_WIRE:
            resultobj = SWIG_NewPointerObj((new TopoDS_Wire(static_cast< const TopoDS_Wire& >($1))),
                                            SWIGTYPE_p_TopoDS_Wire, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_EDGE:
            resultobj = SWIG_NewPointerObj((new TopoDS_Edge(static_cast< const TopoDS_Edge& >($1))),
                                            SWIGTYPE_p_TopoDS_Edge, SWIG_POINTER_OWN |  0 );
            break;
          case TopAbs_VERTEX:
            resultobj = SWIG_NewPointerObj((new TopoDS_Vertex(static_cast< const TopoDS_Vertex& >($1))),
                                            SWIGTYPE_p_TopoDS_Vertex, SWIG_POINTER_OWN |  0 );
            break;
          default:
            break;
        }
    }
    return resultobj;
}
