/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define GEOM2DINTDOCSTRING
"Geom2dInt module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_geom2dint.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DINTDOCSTRING) Geom2dInt


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
%include ../common/ArrayMacros.i


%{
#include<Geom2dInt_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor2d_module.hxx>
#include<IntRes2d_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAbs_module.hxx>
#include<math_module.hxx>
#include<IntCurve_module.hxx>
#include<Extrema_module.hxx>
#include<Intf_module.hxx>
#include<Bnd_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor2d.i
%import IntRes2d.i
%import gp.i
%import TColStd.i
%import GeomAbs.i
%import math.i
%import IntCurve.i
%import Extrema.i
%import Intf.i
%import Bnd.i

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
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************************************************************
* class Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter *
*********************************************************************/
class Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter {
	public:
		/****** Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter::Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter ******/
		/****** md5 signature: 0be040578dae1043c1adeeabc124ac95 ******/
		%feature("compactdefaultargs") Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real Tol);

		/****** Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter::AnErrorOccurred ******/
		/****** md5 signature: 7f72d28f1d64c3e0ff5b578209701958 ******/
		%feature("compactdefaultargs") AnErrorOccurred;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") AnErrorOccurred;
		Standard_Boolean AnErrorOccurred();

		/****** Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter::NbRoots ******/
		/****** md5 signature: d23dc5b5f7fe61d6b998e72ba9eb27b3 ******/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbRoots;
		Standard_Integer NbRoots();

		/****** Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter::Perform ******/
		/****** md5 signature: e8a2249a838c55bb3e5f5411a23756a5 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Poly1: Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter
Poly2: Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter

Return
-------
NumSegOn1: int
NumSegOn2: int
ParamOnSeg1: float
ParamOnSeg2: float

Description
-----------
No available documentation.
") Perform;
		void Perform(const Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter & Poly1, const Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter & Poly2, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter::Perform ******/
		/****** md5 signature: 95ca10966a8387b775958da0f1189e3d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Uo: float
Vo: float
UInf: float
VInf: float
USup: float
VSup: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Standard_Real Uo, const Standard_Real Vo, const Standard_Real UInf, const Standard_Real VInf, const Standard_Real USup, const Standard_Real VSup);

		/****** Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter::Roots ******/
		/****** md5 signature: 8d4622811e04b4565f31efccbad15fef ******/
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

Description
-----------
No available documentation.
") Roots;
		void Roots(Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Geom2dInt_GInter *
*************************/
class Geom2dInt_GInter : public IntRes2d_Intersection {
	public:
		/****** Geom2dInt_GInter::Geom2dInt_GInter ******/
		/****** md5 signature: 672e83162d340450c3b90f88abfc10a8 ******/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Geom2dInt_GInter;
		 Geom2dInt_GInter();

		/****** Geom2dInt_GInter::Geom2dInt_GInter ******/
		/****** md5 signature: 4fb484b267490747651932c8ec0acb86 ******/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Self Intersection of a curve.
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_GInter::Geom2dInt_GInter ******/
		/****** md5 signature: fea0eac3d7fd46de9794a7ec6d14b86e ******/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
D: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Self Intersection of a curve with a domain.
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C, const IntRes2d_Domain & D, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_GInter::Geom2dInt_GInter ******/
		/****** md5 signature: b9ae0e69063b2fd367c5e757e99a66ac ******/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_GInter::Geom2dInt_GInter ******/
		/****** md5 signature: 325a809492e902d5d4658b8733385424 ******/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
D1: IntRes2d_Domain
C2: Adaptor2d_Curve2d
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_GInter::Geom2dInt_GInter ******/
		/****** md5 signature: 07f243fe9f9cd09985a7e4f9277a60e5 ******/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_GInter::Geom2dInt_GInter ******/
		/****** md5 signature: 36327c316ba2b5d25d1733e75a7d3718 ******/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
D1: IntRes2d_Domain
C2: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_GInter::ComputeDomain ******/
		/****** md5 signature: 30dee687e5aac26c1fc0f8dead62030a ******/
		%feature("compactdefaultargs") ComputeDomain;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
TolDomain: float

Return
-------
IntRes2d_Domain

Description
-----------
Create a domain from a curve.
") ComputeDomain;
		IntRes2d_Domain ComputeDomain(const Adaptor2d_Curve2d & C1, const Standard_Real TolDomain);

		/****** Geom2dInt_GInter::GetMinNbSamples ******/
		/****** md5 signature: 337038c4c6920a9f4b1d8efd60cf2219 ******/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetMinNbSamples;
		Standard_Integer GetMinNbSamples();

		/****** Geom2dInt_GInter::Perform ******/
		/****** md5 signature: 2c1b22db629766daef0fa0e20997d5cd ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
D1: IntRes2d_Domain
C2: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_GInter::Perform ******/
		/****** md5 signature: f8714ec760a9c2ae5dfb62d2c8bc3554 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_GInter::Perform ******/
		/****** md5 signature: 102d9ee0e7455bf921a0002f67c49b38 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
D1: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_GInter::Perform ******/
		/****** md5 signature: 94e2b061c761851b5d98bbfe69bccf4d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_GInter::Perform ******/
		/****** md5 signature: f761cd93db25b118693ba94b847675f3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
D1: IntRes2d_Domain
C2: Adaptor2d_Curve2d
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_GInter::Perform ******/
		/****** md5 signature: 36f90ae0b2d564b02d45c8763c52f25a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_GInter::SetMinNbSamples ******/
		/****** md5 signature: 32ce254ec9cb1151513557c7a8edb457 ******/
		%feature("compactdefaultargs") SetMinNbSamples;
		%feature("autodoc", "
Parameters
----------
theMinNbSamples: int

Return
-------
None

Description
-----------
Set / get minimum number of points in polygon intersection.
") SetMinNbSamples;
		void SetMinNbSamples(const Standard_Integer theMinNbSamples);

};


%extend Geom2dInt_GInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Geom2dInt_Geom2dCurveTool *
**********************************/
class Geom2dInt_Geom2dCurveTool {
	public:
		/****** Geom2dInt_Geom2dCurveTool::Circle ******/
		/****** md5 signature: f83d3b524bcebc84f76bd577a264bd65 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Circ2d

Description
-----------
Returns the Circ2d from gp corresponding to the curve C. This method is called only when TheType returns GeomAbs_Circle.
") Circle;
		static gp_Circ2d Circle(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::D0 ******/
		/****** md5 signature: 2b0f7c6e7628378c5466f63173da2848 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P);

		/****** Geom2dInt_Geom2dCurveTool::D1 ******/
		/****** md5 signature: 0d4b95e50d0339c78a214bef2a48dd17 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
T: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & T);

		/****** Geom2dInt_Geom2dCurveTool::D2 ******/
		/****** md5 signature: 61872ec93b4c314ded0188d21b9aa43a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
T: gp_Vec2d
N: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & T, gp_Vec2d & N);

		/****** Geom2dInt_Geom2dCurveTool::D3 ******/
		/****** md5 signature: a96f7d195ff5b987371b06533e7f27b2 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
T: gp_Vec2d
N: gp_Vec2d
V: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & T, gp_Vec2d & N, gp_Vec2d & V);

		/****** Geom2dInt_Geom2dCurveTool::DN ******/
		/****** md5 signature: 4678c9ac681caad59540990ee359a046 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") DN;
		static gp_Vec2d DN(const Adaptor2d_Curve2d & C, const Standard_Real U, const Standard_Integer N);

		/****** Geom2dInt_Geom2dCurveTool::Degree ******/
		/****** md5 signature: 9581ff0fc0c406a9427befca62ed1f81 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
No available documentation.
") Degree;
		static Standard_Integer Degree(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::Ellipse ******/
		/****** md5 signature: 6b3d2146deb980d4d62eb8bafed2a0e1 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Elips2d

Description
-----------
Returns the Elips2d from gp corresponding to the curve C. This method is called only when TheType returns GeomAbs_Ellipse.
") Ellipse;
		static gp_Elips2d Ellipse(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::EpsX ******/
		/****** md5 signature: 58ce0d047a9b04cc5fd0e01857501e0a ******/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
float

Description
-----------
No available documentation.
") EpsX;
		static Standard_Real EpsX(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::EpsX ******/
		/****** md5 signature: f1a6ce4f31eeec026643edd71f6c7ee7 ******/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Eps_XYZ: float

Return
-------
float

Description
-----------
No available documentation.
") EpsX;
		static Standard_Real EpsX(const Adaptor2d_Curve2d & C, const Standard_Real Eps_XYZ);

		/****** Geom2dInt_Geom2dCurveTool::FirstParameter ******/
		/****** md5 signature: 540078107c638c43eb2ce9ec567932d5 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		static Standard_Real FirstParameter(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::GetInterval ******/
		/****** md5 signature: 3da0f9fc2d4eeb2be9c3ee920a1eb9d3 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int
Tab: TColStd_Array1OfReal

Return
-------
U1: float
U2: float

Description
-----------
output the bounds of interval of index <Index> used if Type == Composite.
") GetInterval;
		static void GetInterval(const Adaptor2d_Curve2d & C, const Standard_Integer Index, const TColStd_Array1OfReal & Tab, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom2dInt_Geom2dCurveTool::GetType ******/
		/****** md5 signature: 3307087cce71727ba86c3994c56d1dfd ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
GeomAbs_CurveType

Description
-----------
No available documentation.
") GetType;
		static GeomAbs_CurveType GetType(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::Hyperbola ******/
		/****** md5 signature: d765efdcf68c3ccb564b090d516d2f0c ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Hypr2d

Description
-----------
Returns the Hypr2d from gp corresponding to the curve C. This method is called only when TheType returns GeomAbs_Hyperbola.
") Hyperbola;
		static gp_Hypr2d Hyperbola(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::Intervals ******/
		/****** md5 signature: 87431b8d0ca159bdab43a60cb219eeb5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Tab: TColStd_Array1OfReal

Return
-------
None

Description
-----------
compute Tab.
") Intervals;
		static void Intervals(const Adaptor2d_Curve2d & C, TColStd_Array1OfReal & Tab);

		/****** Geom2dInt_Geom2dCurveTool::LastParameter ******/
		/****** md5 signature: b0abc948bceff30cc6ea9b7b21deb71b ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		static Standard_Real LastParameter(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::Line ******/
		/****** md5 signature: 2ed473b8b806549a67acbbb8f7054334 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Lin2d

Description
-----------
Returns the Lin2d from gp corresponding to the curve C. This method is called only when TheType returns GeomAbs_Line.
") Line;
		static gp_Lin2d Line(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::NbIntervals ******/
		/****** md5 signature: 9810a9ff3dda2e840e4401689b41004b ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
output the number of interval of continuity C2 of the curve.
") NbIntervals;
		static Standard_Integer NbIntervals(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::NbSamples ******/
		/****** md5 signature: a79778fe0904ebc85cecada27cadfa22 ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static Standard_Integer NbSamples(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::NbSamples ******/
		/****** md5 signature: 726ec14f33956677290f44d4612ba52c ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U0: float
U1: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static Standard_Integer NbSamples(const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real U1);

		/****** Geom2dInt_Geom2dCurveTool::Parabola ******/
		/****** md5 signature: 91ce2d6bffca5cc115a4e157ac689f40 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Parab2d

Description
-----------
Returns the Parab2d from gp corresponding to the curve C. This method is called only when TheType returns GeomAbs_Parabola.
") Parabola;
		static gp_Parab2d Parabola(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::Value ******/
		/****** md5 signature: 25c43883b98c57ec983decf96bd4fd24 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
X: float

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		static gp_Pnt2d Value(const Adaptor2d_Curve2d & C, const Standard_Real X);

};


%extend Geom2dInt_Geom2dCurveTool {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def IsComposite(self):
		pass
	}
};

/****************************************
* class Geom2dInt_IntConicCurveOfGInter *
****************************************/
class Geom2dInt_IntConicCurveOfGInter : public IntRes2d_Intersection {
	public:
		/****** Geom2dInt_IntConicCurveOfGInter::Geom2dInt_IntConicCurveOfGInter ******/
		/****** md5 signature: d326152ab7d26261f0a1b3e4f48a0ba6 ******/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter();

		/****** Geom2dInt_IntConicCurveOfGInter::Geom2dInt_IntConicCurveOfGInter ******/
		/****** md5 signature: f0d55400793bb40b6dac4c1fa62a8504 ******/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Geom2dInt_IntConicCurveOfGInter ******/
		/****** md5 signature: 49323f6f1e7cdbde1eeb7df4da2c0932 ******/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Geom2dInt_IntConicCurveOfGInter ******/
		/****** md5 signature: 28202a760394e5853909c572e6840cfe ******/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between an ellipse and a parametric curve.
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Geom2dInt_IntConicCurveOfGInter ******/
		/****** md5 signature: e50e8ed95f3a8420233d828187da512e ******/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a parabola and a parametric curve.
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Geom2dInt_IntConicCurveOfGInter ******/
		/****** md5 signature: d4ed103c34c1863ceba471ebbd4ec188 ******/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between the main branch of an hyperbola and a parametric curve.
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Perform ******/
		/****** md5 signature: 15a884c185240a9a240bc5a54c0562fc ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Perform ******/
		/****** md5 signature: 8a759a82930284963483be21254c7ab8 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Perform ******/
		/****** md5 signature: 772c39bd5bcf8ac0d7a23731369a1f2d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between an ellipse and a parametric curve.
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Perform ******/
		/****** md5 signature: c8210a7676aec190cc51054f685dfc52 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a parabola and a parametric curve.
") Perform;
		void Perform(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Perform ******/
		/****** md5 signature: f16dbfc90b0b2a0cec2c70faa1cdeeb2 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between the main branch of an hyperbola and a parametric curve.
") Perform;
		void Perform(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

};


%extend Geom2dInt_IntConicCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************************
* class Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter *
*************************************************************************/
class Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter : public math_FunctionWithDerivative {
	public:
		/****** Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter::Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter ******/
		/****** md5 signature: 5773547517531f059b69ac71dcd61497 ******/
		%feature("compactdefaultargs") Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
IT: IntCurve_IConicTool
PC: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
Constructor of the class.
") Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter(const IntCurve_IConicTool & IT, const Adaptor2d_Curve2d & PC);

		/****** Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter::Derivative ******/
		/****** md5 signature: f61c873331fa555e182f1973e95f59da ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
D: float

Description
-----------
Computes the derivative of the previous function at parameter Param.
") Derivative;
		Standard_Boolean Derivative(const Standard_Real Param, Standard_Real &OutValue);

		/****** Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter::Value ******/
		/****** md5 signature: 96999dda9fe43560f6ec0c3dc2a0f930 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
F: float

Description
-----------
Computes the value of the signed distance between the implicit curve and the point at parameter Param on the parametrised curve.
") Value;
		Standard_Boolean Value(const Standard_Real Param, Standard_Real &OutValue);

		/****** Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter::Values ******/
		/****** md5 signature: 30b6c9e0ecc359e02c44e042b54e6b7c ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
F: float
D: float

Description
-----------
Computes the value and the derivative of the function.
") Values;
		Standard_Boolean Values(const Standard_Real Param, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter *
**************************************************************/
class Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter : public math_FunctionWithDerivative {
	public:
		/****** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter ******/
		/****** md5 signature: 426902f7f259094919589b68c6a25cd8 ******/
		%feature("compactdefaultargs") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter();

		/****** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter ******/
		/****** md5 signature: 45b8a2eedb62eb54a572f8c8270f0f82 ******/
		%feature("compactdefaultargs") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::Derivative ******/
		/****** md5 signature: 74e45b7ef1cb50395f459121235df2cd ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
DF: float

Description
-----------
Calculation of F'(U).
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::GetStateNumber ******/
		/****** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Save the found extremum.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::Initialize ******/
		/****** md5 signature: 295b46cc3c15eb5116b8523fecaa122c ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
sets the field mycurve of the function.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Shows if the Nth distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of found extrema.
") NbExt;
		Standard_Integer NbExt();

		/****** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::Point ******/
		/****** md5 signature: 6123812027804044a54749cfa19bef5e ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv2d

Description
-----------
Returns the Nth extremum.
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::SearchOfTolerance ******/
		/****** md5 signature: 73a2a1f7b776ed3aaadf205798ee8767 ******/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::SetPoint ******/
		/****** md5 signature: 0ad85ba084f338225cb11e827425ab5f ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
sets the field P of the function.
") SetPoint;
		void SetPoint(const gp_Pnt2d & P);

		/****** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the Nth distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::SubIntervalInitialize ******/
		/****** md5 signature: 424565e975e565ea668d16ca9ce728b5 ******/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "
Parameters
----------
theUfirst: float
theUlast: float

Return
-------
None

Description
-----------
Determines boundaries of subinterval for find of root.
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::Value ******/
		/****** md5 signature: e3462efa1edccfd4021bca61bc42d936 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
F: float

Description
-----------
Calculation of F(U).
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::Values ******/
		/****** md5 signature: a9de0e54fbbad71406954eb825560b84 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
F: float
DF: float

Description
-----------
Calculation of F(U) and F'(U).
") Values;
		Standard_Boolean Values(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class Geom2dInt_TheCurveLocatorOfTheProjPCurOfGInter *
*******************************************************/
class Geom2dInt_TheCurveLocatorOfTheProjPCurOfGInter {
	public:
};


%extend Geom2dInt_TheCurveLocatorOfTheProjPCurOfGInter {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Locate(self):
		pass
	}
};

/********************************************************************
* class Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter *
********************************************************************/
class Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter : public math_FunctionSetWithDerivatives {
	public:
		/****** Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter::Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter ******/
		/****** md5 signature: 89dc6631bcd06f3348bc4fcc91c073a6 ******/
		%feature("compactdefaultargs") Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
curve1: Adaptor2d_Curve2d
curve2: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter(const Adaptor2d_Curve2d & curve1, const Adaptor2d_Curve2d & curve2);

		/****** Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter::Derivatives ******/
		/****** md5 signature: 80ee5f16e62731c095910ad60228848b ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. returns True if the computation was done successfully, False otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter::NbEquations ******/
		/****** md5 signature: 42be0dc2e32c8e563393e8490171707e ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 2.
") NbEquations;
		Standard_Integer NbEquations();

		/****** Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 2.
") NbVariables;
		Standard_Integer NbVariables();

		/****** Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter::Value ******/
		/****** md5 signature: 31f6ba581b8fae503400d98976418349 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. returns True if the computation was done successfully, False otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter::Values ******/
		/****** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. returns True if the computation was done successfully, False otherwise.
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class Geom2dInt_TheIntConicCurveOfGInter *
*******************************************/
class Geom2dInt_TheIntConicCurveOfGInter : public IntRes2d_Intersection {
	public:
		/****** Geom2dInt_TheIntConicCurveOfGInter::Geom2dInt_TheIntConicCurveOfGInter ******/
		/****** md5 signature: 442235095cb83e65c4d163949e4b639f ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter();

		/****** Geom2dInt_TheIntConicCurveOfGInter::Geom2dInt_TheIntConicCurveOfGInter ******/
		/****** md5 signature: 31c8b0a07e8faa7fea8fe3295a1da414 ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Geom2dInt_TheIntConicCurveOfGInter ******/
		/****** md5 signature: 1bbb1d67396be0a01496649d383a3301 ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Geom2dInt_TheIntConicCurveOfGInter ******/
		/****** md5 signature: a6ef32e4284008815c4243bbf2cc7159 ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between an ellipse and a parametric curve.
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Geom2dInt_TheIntConicCurveOfGInter ******/
		/****** md5 signature: 81374f2177e6c16b4b798b61b9a974d7 ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a parabola and a parametric curve.
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Geom2dInt_TheIntConicCurveOfGInter ******/
		/****** md5 signature: ead6beeb7a7ccff34cbdec4f3c94afbc ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between the main branch of an hyperbola and a parametric curve.
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Perform ******/
		/****** md5 signature: 15a884c185240a9a240bc5a54c0562fc ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Perform ******/
		/****** md5 signature: 8a759a82930284963483be21254c7ab8 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Perform ******/
		/****** md5 signature: 772c39bd5bcf8ac0d7a23731369a1f2d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between an ellipse and a parametric curve.
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Perform ******/
		/****** md5 signature: c8210a7676aec190cc51054f685dfc52 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a parabola and a parametric curve.
") Perform;
		void Perform(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Perform ******/
		/****** md5 signature: f16dbfc90b0b2a0cec2c70faa1cdeeb2 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between the main branch of an hyperbola and a parametric curve.
") Perform;
		void Perform(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

};


%extend Geom2dInt_TheIntConicCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class Geom2dInt_TheIntPCurvePCurveOfGInter *
*********************************************/
class Geom2dInt_TheIntPCurvePCurveOfGInter : public IntRes2d_Intersection {
	public:
		/****** Geom2dInt_TheIntPCurvePCurveOfGInter::Geom2dInt_TheIntPCurvePCurveOfGInter ******/
		/****** md5 signature: 29b0f855a1d18b661dc904c525704e14 ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntPCurvePCurveOfGInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Geom2dInt_TheIntPCurvePCurveOfGInter;
		 Geom2dInt_TheIntPCurvePCurveOfGInter();

		/****** Geom2dInt_TheIntPCurvePCurveOfGInter::GetMinNbSamples ******/
		/****** md5 signature: 337038c4c6920a9f4b1d8efd60cf2219 ******/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetMinNbSamples;
		Standard_Integer GetMinNbSamples();

		/****** Geom2dInt_TheIntPCurvePCurveOfGInter::Perform ******/
		/****** md5 signature: a005634660caeb34b480e7361aecd221 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve1: Adaptor2d_Curve2d
Domain1: IntRes2d_Domain
Curve2: Adaptor2d_Curve2d
Domain2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Adaptor2d_Curve2d & Curve1, const IntRes2d_Domain & Domain1, const Adaptor2d_Curve2d & Curve2, const IntRes2d_Domain & Domain2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_TheIntPCurvePCurveOfGInter::Perform ******/
		/****** md5 signature: 9bfa3fac9e615df81d9c6cd7f2d9d5c8 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve1: Adaptor2d_Curve2d
Domain1: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Adaptor2d_Curve2d & Curve1, const IntRes2d_Domain & Domain1, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_TheIntPCurvePCurveOfGInter::SetMinNbSamples ******/
		/****** md5 signature: 32ce254ec9cb1151513557c7a8edb457 ******/
		%feature("compactdefaultargs") SetMinNbSamples;
		%feature("autodoc", "
Parameters
----------
theMinNbSamples: int

Return
-------
None

Description
-----------
Set / get minimum number of points in polygon for intersection.
") SetMinNbSamples;
		void SetMinNbSamples(const Standard_Integer theMinNbSamples);

};


%extend Geom2dInt_TheIntPCurvePCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter *
***********************************************************/
class Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter : public IntRes2d_Intersection {
	public:
		/****** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter::Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter ******/
		/****** md5 signature: 8b50729718ad9c424b34e560a84ada54 ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter();

		/****** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter::Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter ******/
		/****** md5 signature: 6f94af849ea66fd1655f6f808cbe61f8 ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
ITool: IntCurve_IConicTool
Dom1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
Dom2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between an implicit curve and a parametrised curve. The exception ConstructionError is raised if the domain of the parametrised curve does not verify HasFirstPoint and HasLastPoint return True.
") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter(const IntCurve_IConicTool & ITool, const IntRes2d_Domain & Dom1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & Dom2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter::And_Domaine_Objet1_Intersections ******/
		/****** md5 signature: fe703f166d048c73377c7e3d2b1e5283 ******/
		%feature("compactdefaultargs") And_Domaine_Objet1_Intersections;
		%feature("autodoc", "
Parameters
----------
TheImpTool: IntCurve_IConicTool
TheParCurve: Adaptor2d_Curve2d
TheImpCurveDomain: IntRes2d_Domain
TheParCurveDomain: IntRes2d_Domain
Inter2_And_Domain2: TColStd_Array1OfReal
Inter1: TColStd_Array1OfReal
Resultat1: TColStd_Array1OfReal
Resultat2: TColStd_Array1OfReal
EpsNul: float

Return
-------
NbResultats: int

Description
-----------
No available documentation.
") And_Domaine_Objet1_Intersections;
		void And_Domaine_Objet1_Intersections(const IntCurve_IConicTool & TheImpTool, const Adaptor2d_Curve2d & TheParCurve, const IntRes2d_Domain & TheImpCurveDomain, const IntRes2d_Domain & TheParCurveDomain, Standard_Integer &OutValue, TColStd_Array1OfReal & Inter2_And_Domain2, TColStd_Array1OfReal & Inter1, TColStd_Array1OfReal & Resultat1, TColStd_Array1OfReal & Resultat2, const Standard_Real EpsNul);

		/****** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter::FindU ******/
		/****** md5 signature: 84a4f5eb2d39d95a27586aae724aed4d ******/
		%feature("compactdefaultargs") FindU;
		%feature("autodoc", "
Parameters
----------
parameter: float
point: gp_Pnt2d
TheParCurev: Adaptor2d_Curve2d
TheImpTool: IntCurve_IConicTool

Return
-------
float

Description
-----------
No available documentation.
") FindU;
		Standard_Real FindU(const Standard_Real parameter, gp_Pnt2d & point, const Adaptor2d_Curve2d & TheParCurev, const IntCurve_IConicTool & TheImpTool);

		/****** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter::FindV ******/
		/****** md5 signature: c194b380ff913201b56034452581c9cd ******/
		%feature("compactdefaultargs") FindV;
		%feature("autodoc", "
Parameters
----------
parameter: float
point: gp_Pnt2d
TheImpTool: IntCurve_IConicTool
ParCurve: Adaptor2d_Curve2d
TheParCurveDomain: IntRes2d_Domain
V0: float
V1: float
Tolerance: float

Return
-------
float

Description
-----------
No available documentation.
") FindV;
		Standard_Real FindV(const Standard_Real parameter, gp_Pnt2d & point, const IntCurve_IConicTool & TheImpTool, const Adaptor2d_Curve2d & ParCurve, const IntRes2d_Domain & TheParCurveDomain, const Standard_Real V0, const Standard_Real V1, const Standard_Real Tolerance);

		/****** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter::Perform ******/
		/****** md5 signature: 19e469495dca83aa458842e14cf6b595 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
ITool: IntCurve_IConicTool
Dom1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
Dom2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between an implicit curve and a parametrised curve. The exception ConstructionError is raised if the domain of the parametrised curve does not verify HasFirstPoint and HasLastPoint return True.
") Perform;
		void Perform(const IntCurve_IConicTool & ITool, const IntRes2d_Domain & Dom1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & Dom2, const Standard_Real TolConf, const Standard_Real Tol);

};


%extend Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter *
******************************************************/
class Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter {
	public:
		/****** Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter::Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter ******/
		/****** md5 signature: 8d229e3249dc5a7f72237a268027ff1e ******/
		%feature("compactdefaultargs") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter();

		/****** Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter::Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter ******/
		/****** md5 signature: a971c67190a2ca3f6addaffb1bbdce56 ******/
		%feature("compactdefaultargs") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
U0: float
TolU: float

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches a zero near the close point. TolU is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolU.
") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real TolU);

		/****** Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter::Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter ******/
		/****** md5 signature: a8c07ef8b33afcd3aa84d7cbfb06958e ******/
		%feature("compactdefaultargs") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
U0: float
Umin: float
Usup: float
TolU: float

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches a zero near the close point. Zeros are searched between Umin et Usup. TolU is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolU.
") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****** Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter::Initialize ******/
		/****** md5 signature: 673c63ed8f08af5bcfdd5ced5f979463 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Umin: float
Usup: float
TolU: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****** Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter::IsMin ******/
		/****** md5 signature: 1c0b1dbd0d0c10c93cbf9fefce4bad3b ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the extremum distance is a minimum.
") IsMin;
		Standard_Boolean IsMin();

		/****** Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter::Perform ******/
		/****** md5 signature: 572d96f228989fec803e5b8f273e32cd ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
U0: float

Return
-------
None

Description
-----------
the algorithm is done with the point P. An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const gp_Pnt2d & P, const Standard_Real U0);

		/****** Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter::Point ******/
		/****** md5 signature: 0b14be81c893f7916dafa40cecb53c69 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
Extrema_POnCurv2d

Description
-----------
Returns the point of the extremum distance.
") Point;
		const Extrema_POnCurv2d & Point();

		/****** Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter::SquareDistance ******/
		/****** md5 signature: 2eba58521e0603c1ef0e683534b03956 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter *
***********************************************************/
class Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter : public Intf_Polygon2d {
	public:
		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter ******/
		/****** md5 signature: a2a6dcebbbabae2dd0e37cf1d6c8e640 ******/
		%feature("compactdefaultargs") Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor2d_Curve2d
NbPnt: int
Domain: IntRes2d_Domain
Tol: float

Return
-------
None

Description
-----------
Compute a polygon on the domain of the curve.
") Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter(const Adaptor2d_Curve2d & Curve, const Standard_Integer NbPnt, const IntRes2d_Domain & Domain, const Standard_Real Tol);

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::ApproxParamOnCurve ******/
		/****** md5 signature: ea6b1c4f19abd104ce26cf986e38bc0b ******/
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "
Parameters
----------
Index: int
ParamOnLine: float

Return
-------
float

Description
-----------
Give an approximation of the parameter on the curve according to the discretization of the Curve.
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve(const Standard_Integer Index, const Standard_Real ParamOnLine);

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::AutoIntersectionIsPossible ******/
		/****** md5 signature: 461afa84e474b507672077d4d358a741 ******/
		%feature("compactdefaultargs") AutoIntersectionIsPossible;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") AutoIntersectionIsPossible;
		Standard_Boolean AutoIntersectionIsPossible();

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::CalculRegion ******/
		/****** md5 signature: 34769b0e402ed40fc1aa75180518eb35 ******/
		%feature("compactdefaultargs") CalculRegion;
		%feature("autodoc", "
Parameters
----------
x: float
y: float
x1: float
x2: float
y1: float
y2: float

Return
-------
int

Description
-----------
No available documentation.
") CalculRegion;
		Standard_Integer CalculRegion(const Standard_Real x, const Standard_Real y, const Standard_Real x1, const Standard_Real x2, const Standard_Real y1, const Standard_Real y2);

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::Closed ******/
		/****** md5 signature: c5b0bafd47da29606481588a971270ce ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "
Parameters
----------
clos: bool

Return
-------
None

Description
-----------
No available documentation.
") Closed;
		void Closed(const Standard_Boolean clos);

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::Closed ******/
		/****** md5 signature: fb3b1ea0f3831f02fc7dc8ae66caac7b ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the polyline is closed.
") Closed;
		virtual Standard_Boolean Closed();

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::ComputeWithBox ******/
		/****** md5 signature: a2577e286c7447afd172b5be81ef7131 ******/
		%feature("compactdefaultargs") ComputeWithBox;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor2d_Curve2d
OtherBox: Bnd_Box2d

Return
-------
None

Description
-----------
The current polygon is modified if most of the points of the polygon are outside the box <OtherBox>. In this situation, bounds are computed to build a polygon inside or near the OtherBox.
") ComputeWithBox;
		void ComputeWithBox(const Adaptor2d_Curve2d & Curve, const Bnd_Box2d & OtherBox);

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::DeflectionOverEstimation ******/
		/****** md5 signature: 43f4e747867c1147de91dcc2fd648827 ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") DeflectionOverEstimation;
		virtual Standard_Real DeflectionOverEstimation();

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::InfParameter ******/
		/****** md5 signature: 8559659cfaf88d25c04ace5dcdcbde32 ******/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter (On the curve) of the first point of the Polygon.
") InfParameter;
		Standard_Real InfParameter();

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::NbSegments ******/
		/****** md5 signature: 3964cbfa1f20d4814234f7fc3d204bbb ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of Segments in the polyline.
") NbSegments;
		virtual Standard_Integer NbSegments();

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::Segment ******/
		/****** md5 signature: 86ed8dcd5c63b8c7622186f373e5af81 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theBegin: gp_Pnt2d
theEnd: gp_Pnt2d

Return
-------
None

Description
-----------
Returns the points of the segment <Index> in the Polygon.
") Segment;
		virtual void Segment(const Standard_Integer theIndex, gp_Pnt2d & theBegin, gp_Pnt2d & theEnd);

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::SetDeflectionOverEstimation ******/
		/****** md5 signature: 310446258d4443a660c9cfe280519b05 ******/
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
x: float

Return
-------
None

Description
-----------
No available documentation.
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation(const Standard_Real x);

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::SupParameter ******/
		/****** md5 signature: 67f72e7357fa61911c23a764d72614ea ******/
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter (On the curve) of the last point of the Polygon.
") SupParameter;
		Standard_Real SupParameter();

};


%extend Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class Geom2dInt_TheProjPCurOfGInter *
**************************************/
class Geom2dInt_TheProjPCurOfGInter {
	public:
		/****** Geom2dInt_TheProjPCurOfGInter::FindParameter ******/
		/****** md5 signature: 09dfdffb4b5220d74013e1ecd50cdbd5 ******/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Pnt: gp_Pnt2d
Tol: float

Return
-------
float

Description
-----------
Returns the parameter V of the point on the parametric curve corresponding to the Point Pnt. The Correspondence between Pnt and the point P(V) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. Tol is the tolerance on the distance between a point and the parametrised curve. In that case, no bounds are given. The research of the right parameter has to be made on the natural parametric domain of the curve.
") FindParameter;
		static Standard_Real FindParameter(const Adaptor2d_Curve2d & C, const gp_Pnt2d & Pnt, const Standard_Real Tol);

		/****** Geom2dInt_TheProjPCurOfGInter::FindParameter ******/
		/****** md5 signature: 62d40694d41fa21c773faec789a5ba56 ******/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Pnt: gp_Pnt2d
LowParameter: float
HighParameter: float
Tol: float

Return
-------
float

Description
-----------
Returns the parameter V of the point on the parametric curve corresponding to the Point Pnt. The Correspondence between Pnt and the point P(V) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. Tol is the tolerance on the distance between a point and the parametrised curve. LowParameter and HighParameter give the boundaries of the interval in which the parameter certainly lies. These parameters are given to implement a more efficient algorithm. So, it is not necessary to check that the returned value verifies LowParameter <= Value <= HighParameter.
") FindParameter;
		static Standard_Real FindParameter(const Adaptor2d_Curve2d & C, const gp_Pnt2d & Pnt, const Standard_Real LowParameter, const Standard_Real HighParameter, const Standard_Real Tol);

};


%extend Geom2dInt_TheProjPCurOfGInter {
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
def Geom2dInt_Geom2dCurveTool_Circle(*args):
	return Geom2dInt_Geom2dCurveTool.Circle(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_D0(*args):
	return Geom2dInt_Geom2dCurveTool.D0(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_D1(*args):
	return Geom2dInt_Geom2dCurveTool.D1(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_D2(*args):
	return Geom2dInt_Geom2dCurveTool.D2(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_D3(*args):
	return Geom2dInt_Geom2dCurveTool.D3(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_DN(*args):
	return Geom2dInt_Geom2dCurveTool.DN(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_Degree(*args):
	return Geom2dInt_Geom2dCurveTool.Degree(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_Ellipse(*args):
	return Geom2dInt_Geom2dCurveTool.Ellipse(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_EpsX(*args):
	return Geom2dInt_Geom2dCurveTool.EpsX(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_EpsX(*args):
	return Geom2dInt_Geom2dCurveTool.EpsX(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_FirstParameter(*args):
	return Geom2dInt_Geom2dCurveTool.FirstParameter(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_GetInterval(*args):
	return Geom2dInt_Geom2dCurveTool.GetInterval(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_GetType(*args):
	return Geom2dInt_Geom2dCurveTool.GetType(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_Hyperbola(*args):
	return Geom2dInt_Geom2dCurveTool.Hyperbola(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_Intervals(*args):
	return Geom2dInt_Geom2dCurveTool.Intervals(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_LastParameter(*args):
	return Geom2dInt_Geom2dCurveTool.LastParameter(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_Line(*args):
	return Geom2dInt_Geom2dCurveTool.Line(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_NbIntervals(*args):
	return Geom2dInt_Geom2dCurveTool.NbIntervals(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_NbSamples(*args):
	return Geom2dInt_Geom2dCurveTool.NbSamples(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_NbSamples(*args):
	return Geom2dInt_Geom2dCurveTool.NbSamples(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_Parabola(*args):
	return Geom2dInt_Geom2dCurveTool.Parabola(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_Value(*args):
	return Geom2dInt_Geom2dCurveTool.Value(*args)

@deprecated
def Geom2dInt_TheProjPCurOfGInter_FindParameter(*args):
	return Geom2dInt_TheProjPCurOfGInter.FindParameter(*args)

@deprecated
def Geom2dInt_TheProjPCurOfGInter_FindParameter(*args):
	return Geom2dInt_TheProjPCurOfGInter.FindParameter(*args)

}
