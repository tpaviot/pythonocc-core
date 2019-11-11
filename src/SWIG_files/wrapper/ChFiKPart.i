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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define CHFIKPARTDOCSTRING
"ChFiKPart module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_ChFiKPart.html"
%enddef
%module (package="OCC.Core", docstring=CHFIKPARTDOCSTRING) ChFiKPart

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include ChFiKPart_headers.i

/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(ChFiKPart_RstMap) NCollection_DataMap <Standard_Integer , opencascade::handle <Adaptor2d_HCurve2d>, TColStd_MapIntegerHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <Standard_Integer , opencascade::handle <Adaptor2d_HCurve2d>, TColStd_MapIntegerHasher> ChFiKPart_RstMap;
typedef NCollection_DataMap <Standard_Integer , opencascade::handle <Adaptor2d_HCurve2d>, TColStd_MapIntegerHasher>::Iterator ChFiKPart_DataMapIteratorOfRstMap;
/* end typedefs declaration */

class ChFiKPart_ComputeData {
	public:
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes a simple fillet in several particular cases.

	:param DStr:
	:type DStr: TopOpeBRepDS_DataStructure &
	:param Data:
	:type Data: opencascade::handle<ChFiDS_SurfData> &
	:param S1:
	:type S1: opencascade::handle<Adaptor3d_HSurface> &
	:param S2:
	:type S2: opencascade::handle<Adaptor3d_HSurface> &
	:param Or1:
	:type Or1: TopAbs_Orientation
	:param Or2:
	:type Or2: TopAbs_Orientation
	:param Sp:
	:type Sp: opencascade::handle<ChFiDS_Spine> &
	:param Iedge:
	:type Iedge: int
	:rtype: bool
") Compute;
		static Standard_Boolean Compute (TopOpeBRepDS_DataStructure & DStr,opencascade::handle<ChFiDS_SurfData> & Data,const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_HSurface> & S2,const TopAbs_Orientation Or1,const TopAbs_Orientation Or2,const opencascade::handle<ChFiDS_Spine> & Sp,const Standard_Integer Iedge);
		%feature("compactdefaultargs") ComputeCorner;
		%feature("autodoc", "	* Computes a toric or spheric corner fillet.

	:param DStr:
	:type DStr: TopOpeBRepDS_DataStructure &
	:param Data:
	:type Data: opencascade::handle<ChFiDS_SurfData> &
	:param S1:
	:type S1: opencascade::handle<Adaptor3d_HSurface> &
	:param S2:
	:type S2: opencascade::handle<Adaptor3d_HSurface> &
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
	:rtype: bool
") ComputeCorner;
		static Standard_Boolean ComputeCorner (TopOpeBRepDS_DataStructure & DStr,const opencascade::handle<ChFiDS_SurfData> & Data,const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_HSurface> & S2,const TopAbs_Orientation OrFace1,const TopAbs_Orientation OrFace2,const TopAbs_Orientation Or1,const TopAbs_Orientation Or2,const Standard_Real minRad,const Standard_Real majRad,const gp_Pnt2d & P1S1,const gp_Pnt2d & P2S1,const gp_Pnt2d & P1S2,const gp_Pnt2d & P2S2);
		%feature("compactdefaultargs") ComputeCorner;
		%feature("autodoc", "	* Computes spheric corner fillet with non iso pcurve on S2.

	:param DStr:
	:type DStr: TopOpeBRepDS_DataStructure &
	:param Data:
	:type Data: opencascade::handle<ChFiDS_SurfData> &
	:param S1:
	:type S1: opencascade::handle<Adaptor3d_HSurface> &
	:param S2:
	:type S2: opencascade::handle<Adaptor3d_HSurface> &
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
	:rtype: bool
") ComputeCorner;
		static Standard_Boolean ComputeCorner (TopOpeBRepDS_DataStructure & DStr,const opencascade::handle<ChFiDS_SurfData> & Data,const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_HSurface> & S2,const TopAbs_Orientation OrFace1,const TopAbs_Orientation OrFace2,const TopAbs_Orientation Or1,const TopAbs_Orientation Or2,const Standard_Real Rad,const gp_Pnt2d & PS1,const gp_Pnt2d & P1S2,const gp_Pnt2d & P2S2);
		%feature("compactdefaultargs") ComputeCorner;
		%feature("autodoc", "	* Computes a toric corner rotule.

	:param DStr:
	:type DStr: TopOpeBRepDS_DataStructure &
	:param Data:
	:type Data: opencascade::handle<ChFiDS_SurfData> &
	:param S:
	:type S: opencascade::handle<Adaptor3d_HSurface> &
	:param S1:
	:type S1: opencascade::handle<Adaptor3d_HSurface> &
	:param S2:
	:type S2: opencascade::handle<Adaptor3d_HSurface> &
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
	:rtype: bool
") ComputeCorner;
		static Standard_Boolean ComputeCorner (TopOpeBRepDS_DataStructure & DStr,const opencascade::handle<ChFiDS_SurfData> & Data,const opencascade::handle<Adaptor3d_HSurface> & S,const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_HSurface> & S2,const TopAbs_Orientation OfS,const TopAbs_Orientation OS,const TopAbs_Orientation OS1,const TopAbs_Orientation OS2,const Standard_Real Radius);
};


%extend ChFiKPart_ComputeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
