/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/
%define CHFIKPARTDOCSTRING
"ChFiKPart module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_chfikpart.html"
%enddef
%module (package="OCC.Core", docstring=CHFIKPARTDOCSTRING) ChFiKPart


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<ChFiKPart_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TopOpeBRepDS_module.hxx>
#include<ChFiDS_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TopAbs_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TopTools_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<Bnd_module.hxx>
#include<BRepClass3d_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<TopLoc_module.hxx>
#include<Message_module.hxx>
#include<Intf_module.hxx>
#include<IntSurf_module.hxx>
#include<TopOpeBRepTool_module.hxx>
#include<Law_module.hxx>
#include<Extrema_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor2d.i
%import TopOpeBRepDS.i
%import ChFiDS.i
%import Adaptor3d.i
%import TopAbs.i
%import gp.i
%import Geom.i
%import Geom2d.i
%import GeomAdaptor.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(ChFiKPart_RstMap) NCollection_DataMap<Standard_Integer,opencascade::handle<Adaptor2d_HCurve2d>,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<Adaptor2d_HCurve2d>,TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (ChFiKPart_RstMap::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<Adaptor2d_HCurve2d>, TColStd_MapIntegerHasher>::Iterator ChFiKPart_DataMapIteratorOfRstMap;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<Adaptor2d_HCurve2d>, TColStd_MapIntegerHasher> ChFiKPart_RstMap;
/* end typedefs declaration */

/******************************
* class ChFiKPart_ComputeData *
******************************/
class ChFiKPart_ComputeData {
	public:
		/****************** Compute ******************/
		/**** md5 signature: 1167d77608a1449aee3092d8a823be80 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes a simple fillet in several particular cases.

Parameters
----------
DStr: TopOpeBRepDS_DataStructure
Data: ChFiDS_SurfData
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
Or1: TopAbs_Orientation
Or2: TopAbs_Orientation
Sp: ChFiDS_Spine
Iedge: int

Returns
-------
bool
") Compute;
		static Standard_Boolean Compute(TopOpeBRepDS_DataStructure & DStr, opencascade::handle<ChFiDS_SurfData> & Data, const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const TopAbs_Orientation Or1, const TopAbs_Orientation Or2, const opencascade::handle<ChFiDS_Spine> & Sp, const Standard_Integer Iedge);

		/****************** ComputeCorner ******************/
		/**** md5 signature: 4e661a9eb2006f7b6d6fb9b7c223ee31 ****/
		%feature("compactdefaultargs") ComputeCorner;
		%feature("autodoc", "Computes a toric or spheric corner fillet.

Parameters
----------
DStr: TopOpeBRepDS_DataStructure
Data: ChFiDS_SurfData
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
OrFace1: TopAbs_Orientation
OrFace2: TopAbs_Orientation
Or1: TopAbs_Orientation
Or2: TopAbs_Orientation
minRad: float
majRad: float
P1S1: gp_Pnt2d
P2S1: gp_Pnt2d
P1S2: gp_Pnt2d
P2S2: gp_Pnt2d

Returns
-------
bool
") ComputeCorner;
		static Standard_Boolean ComputeCorner(TopOpeBRepDS_DataStructure & DStr, const opencascade::handle<ChFiDS_SurfData> & Data, const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const TopAbs_Orientation OrFace1, const TopAbs_Orientation OrFace2, const TopAbs_Orientation Or1, const TopAbs_Orientation Or2, const Standard_Real minRad, const Standard_Real majRad, const gp_Pnt2d & P1S1, const gp_Pnt2d & P2S1, const gp_Pnt2d & P1S2, const gp_Pnt2d & P2S2);

		/****************** ComputeCorner ******************/
		/**** md5 signature: 7e17d6233f97f8c3d7241e4c6005f843 ****/
		%feature("compactdefaultargs") ComputeCorner;
		%feature("autodoc", "Computes spheric corner fillet with non iso pcurve on s2.

Parameters
----------
DStr: TopOpeBRepDS_DataStructure
Data: ChFiDS_SurfData
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
OrFace1: TopAbs_Orientation
OrFace2: TopAbs_Orientation
Or1: TopAbs_Orientation
Or2: TopAbs_Orientation
Rad: float
PS1: gp_Pnt2d
P1S2: gp_Pnt2d
P2S2: gp_Pnt2d

Returns
-------
bool
") ComputeCorner;
		static Standard_Boolean ComputeCorner(TopOpeBRepDS_DataStructure & DStr, const opencascade::handle<ChFiDS_SurfData> & Data, const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const TopAbs_Orientation OrFace1, const TopAbs_Orientation OrFace2, const TopAbs_Orientation Or1, const TopAbs_Orientation Or2, const Standard_Real Rad, const gp_Pnt2d & PS1, const gp_Pnt2d & P1S2, const gp_Pnt2d & P2S2);

		/****************** ComputeCorner ******************/
		/**** md5 signature: cbc142609e66adc363ea0e77e7b9cf21 ****/
		%feature("compactdefaultargs") ComputeCorner;
		%feature("autodoc", "Computes a toric corner rotule.

Parameters
----------
DStr: TopOpeBRepDS_DataStructure
Data: ChFiDS_SurfData
S: Adaptor3d_HSurface
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
OfS: TopAbs_Orientation
OS: TopAbs_Orientation
OS1: TopAbs_Orientation
OS2: TopAbs_Orientation
Radius: float

Returns
-------
bool
") ComputeCorner;
		static Standard_Boolean ComputeCorner(TopOpeBRepDS_DataStructure & DStr, const opencascade::handle<ChFiDS_SurfData> & Data, const opencascade::handle<Adaptor3d_HSurface> & S, const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const TopAbs_Orientation OfS, const TopAbs_Orientation OS, const TopAbs_Orientation OS1, const TopAbs_Orientation OS2, const Standard_Real Radius);

};


%extend ChFiKPart_ComputeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
