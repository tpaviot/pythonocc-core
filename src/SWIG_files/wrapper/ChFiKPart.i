/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.7.0/refman/html/package_chfikpart.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i


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

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(ChFiKPart_RstMap) NCollection_DataMap<Standard_Integer,opencascade::handle<Adaptor2d_Curve2d>>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<Adaptor2d_Curve2d>> {
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
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<Adaptor2d_Curve2d>>::Iterator ChFiKPart_DataMapIteratorOfRstMap;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<Adaptor2d_Curve2d>> ChFiKPart_RstMap;
/* end typedefs declaration */

/******************************
* class ChFiKPart_ComputeData *
******************************/
class ChFiKPart_ComputeData {
	public:
		/****************** Compute ******************/
		/**** md5 signature: a0c5d37c66ecc69b80c9407be109abee ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
DStr: TopOpeBRepDS_DataStructure
Data: ChFiDS_SurfData
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
Or1: TopAbs_Orientation
Or2: TopAbs_Orientation
Sp: ChFiDS_Spine
Iedge: int

Return
-------
bool

Description
-----------
Computes a simple fillet in several particular cases.
") Compute;
		static Standard_Boolean Compute(TopOpeBRepDS_DataStructure & DStr, opencascade::handle<ChFiDS_SurfData> & Data, const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const TopAbs_Orientation Or1, const TopAbs_Orientation Or2, const opencascade::handle<ChFiDS_Spine> & Sp, const Standard_Integer Iedge);

		/****************** ComputeCorner ******************/
		/**** md5 signature: 865640977aad8d495cda6b0205404703 ****/
		%feature("compactdefaultargs") ComputeCorner;
		%feature("autodoc", "
Parameters
----------
DStr: TopOpeBRepDS_DataStructure
Data: ChFiDS_SurfData
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
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

Return
-------
bool

Description
-----------
Computes a toric or spheric corner fillet.
") ComputeCorner;
		static Standard_Boolean ComputeCorner(TopOpeBRepDS_DataStructure & DStr, const opencascade::handle<ChFiDS_SurfData> & Data, const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const TopAbs_Orientation OrFace1, const TopAbs_Orientation OrFace2, const TopAbs_Orientation Or1, const TopAbs_Orientation Or2, const Standard_Real minRad, const Standard_Real majRad, const gp_Pnt2d & P1S1, const gp_Pnt2d & P2S1, const gp_Pnt2d & P1S2, const gp_Pnt2d & P2S2);

		/****************** ComputeCorner ******************/
		/**** md5 signature: 85d29cbe50ebb6a374a60f8829eb98a3 ****/
		%feature("compactdefaultargs") ComputeCorner;
		%feature("autodoc", "
Parameters
----------
DStr: TopOpeBRepDS_DataStructure
Data: ChFiDS_SurfData
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
OrFace1: TopAbs_Orientation
OrFace2: TopAbs_Orientation
Or1: TopAbs_Orientation
Or2: TopAbs_Orientation
Rad: float
PS1: gp_Pnt2d
P1S2: gp_Pnt2d
P2S2: gp_Pnt2d

Return
-------
bool

Description
-----------
Computes spheric corner fillet with non iso pcurve on s2.
") ComputeCorner;
		static Standard_Boolean ComputeCorner(TopOpeBRepDS_DataStructure & DStr, const opencascade::handle<ChFiDS_SurfData> & Data, const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const TopAbs_Orientation OrFace1, const TopAbs_Orientation OrFace2, const TopAbs_Orientation Or1, const TopAbs_Orientation Or2, const Standard_Real Rad, const gp_Pnt2d & PS1, const gp_Pnt2d & P1S2, const gp_Pnt2d & P2S2);

		/****************** ComputeCorner ******************/
		/**** md5 signature: bafab55c65e7ea7e93485d2309ea19e0 ****/
		%feature("compactdefaultargs") ComputeCorner;
		%feature("autodoc", "
Parameters
----------
DStr: TopOpeBRepDS_DataStructure
Data: ChFiDS_SurfData
S: Adaptor3d_Surface
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
OfS: TopAbs_Orientation
OS: TopAbs_Orientation
OS1: TopAbs_Orientation
OS2: TopAbs_Orientation
Radius: float

Return
-------
bool

Description
-----------
Computes a toric corner rotule.
") ComputeCorner;
		static Standard_Boolean ComputeCorner(TopOpeBRepDS_DataStructure & DStr, const opencascade::handle<ChFiDS_SurfData> & Data, const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const TopAbs_Orientation OfS, const TopAbs_Orientation OS, const TopAbs_Orientation OS1, const TopAbs_Orientation OS2, const Standard_Real Radius);

};


%extend ChFiKPart_ComputeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def ChFiKPart_ComputeData_Compute(*args):
	return ChFiKPart_ComputeData.Compute(*args)

@deprecated
def ChFiKPart_ComputeData_ComputeCorner(*args):
	return ChFiKPart_ComputeData.ComputeCorner(*args)

@deprecated
def ChFiKPart_ComputeData_ComputeCorner(*args):
	return ChFiKPart_ComputeData.ComputeCorner(*args)

@deprecated
def ChFiKPart_ComputeData_ComputeCorner(*args):
	return ChFiKPart_ComputeData.ComputeCorner(*args)

}
