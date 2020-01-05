/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(ChFiKPart_RstMap) NCollection_DataMap <Standard_Integer , opencascade::handle <Adaptor2d_HCurve2d>, TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , opencascade::handle <Adaptor2d_HCurve2d>, TColStd_MapIntegerHasher> {
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
typedef NCollection_DataMap <Standard_Integer , opencascade::handle <Adaptor2d_HCurve2d>, TColStd_MapIntegerHasher> ChFiKPart_RstMap;
typedef NCollection_DataMap <Standard_Integer , opencascade::handle <Adaptor2d_HCurve2d>, TColStd_MapIntegerHasher>::Iterator ChFiKPart_DataMapIteratorOfRstMap;
/* end typedefs declaration */

/******************************
* class ChFiKPart_ComputeData *
******************************/
class ChFiKPart_ComputeData {
	public:
		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Computes a simple fillet in several particular cases.
	:param DStr:
	:type DStr: TopOpeBRepDS_DataStructure
	:param Data:
	:type Data: ChFiDS_SurfData
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param Or2:
	:type Or2: TopAbs_Orientation
	:param Sp:
	:type Sp: ChFiDS_Spine
	:param Iedge:
	:type Iedge: int
	:rtype: bool") Compute;
		static Standard_Boolean Compute (TopOpeBRepDS_DataStructure & DStr,opencascade::handle<ChFiDS_SurfData> & Data,const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_HSurface> & S2,const TopAbs_Orientation Or1,const TopAbs_Orientation Or2,const opencascade::handle<ChFiDS_Spine> & Sp,const Standard_Integer Iedge);

		/****************** ComputeCorner ******************/
		%feature("compactdefaultargs") ComputeCorner;
		%feature("autodoc", "* Computes a toric or spheric corner fillet.
	:param DStr:
	:type DStr: TopOpeBRepDS_DataStructure
	:param Data:
	:type Data: ChFiDS_SurfData
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param OrFace1:
	:type OrFace1: TopAbs_Orientation
	:param OrFace2:
	:type OrFace2: TopAbs_Orientation
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param Or2:
	:type Or2: TopAbs_Orientation
	:param minRad:
	:type minRad: float
	:param majRad:
	:type majRad: float
	:param P1S1:
	:type P1S1: gp_Pnt2d
	:param P2S1:
	:type P2S1: gp_Pnt2d
	:param P1S2:
	:type P1S2: gp_Pnt2d
	:param P2S2:
	:type P2S2: gp_Pnt2d
	:rtype: bool") ComputeCorner;
		static Standard_Boolean ComputeCorner (TopOpeBRepDS_DataStructure & DStr,const opencascade::handle<ChFiDS_SurfData> & Data,const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_HSurface> & S2,const TopAbs_Orientation OrFace1,const TopAbs_Orientation OrFace2,const TopAbs_Orientation Or1,const TopAbs_Orientation Or2,const Standard_Real minRad,const Standard_Real majRad,const gp_Pnt2d & P1S1,const gp_Pnt2d & P2S1,const gp_Pnt2d & P1S2,const gp_Pnt2d & P2S2);

		/****************** ComputeCorner ******************/
		%feature("compactdefaultargs") ComputeCorner;
		%feature("autodoc", "* Computes spheric corner fillet with non iso pcurve on S2.
	:param DStr:
	:type DStr: TopOpeBRepDS_DataStructure
	:param Data:
	:type Data: ChFiDS_SurfData
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param OrFace1:
	:type OrFace1: TopAbs_Orientation
	:param OrFace2:
	:type OrFace2: TopAbs_Orientation
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param Or2:
	:type Or2: TopAbs_Orientation
	:param Rad:
	:type Rad: float
	:param PS1:
	:type PS1: gp_Pnt2d
	:param P1S2:
	:type P1S2: gp_Pnt2d
	:param P2S2:
	:type P2S2: gp_Pnt2d
	:rtype: bool") ComputeCorner;
		static Standard_Boolean ComputeCorner (TopOpeBRepDS_DataStructure & DStr,const opencascade::handle<ChFiDS_SurfData> & Data,const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_HSurface> & S2,const TopAbs_Orientation OrFace1,const TopAbs_Orientation OrFace2,const TopAbs_Orientation Or1,const TopAbs_Orientation Or2,const Standard_Real Rad,const gp_Pnt2d & PS1,const gp_Pnt2d & P1S2,const gp_Pnt2d & P2S2);

		/****************** ComputeCorner ******************/
		%feature("compactdefaultargs") ComputeCorner;
		%feature("autodoc", "* Computes a toric corner rotule.
	:param DStr:
	:type DStr: TopOpeBRepDS_DataStructure
	:param Data:
	:type Data: ChFiDS_SurfData
	:param S:
	:type S: Adaptor3d_HSurface
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param OfS:
	:type OfS: TopAbs_Orientation
	:param OS:
	:type OS: TopAbs_Orientation
	:param OS1:
	:type OS1: TopAbs_Orientation
	:param OS2:
	:type OS2: TopAbs_Orientation
	:param Radius:
	:type Radius: float
	:rtype: bool") ComputeCorner;
		static Standard_Boolean ComputeCorner (TopOpeBRepDS_DataStructure & DStr,const opencascade::handle<ChFiDS_SurfData> & Data,const opencascade::handle<Adaptor3d_HSurface> & S,const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_HSurface> & S2,const TopAbs_Orientation OfS,const TopAbs_Orientation OS,const TopAbs_Orientation OS1,const TopAbs_Orientation OS2,const Standard_Real Radius);

};


%extend ChFiKPart_ComputeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
