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
%define GEOM2DINTDOCSTRING
"Geom2dInt module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geom2dint.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter ******************/
		/**** md5 signature: 0be040578dae1043c1adeeabc124ac95 ****/
		%feature("compactdefaultargs") Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
Tol: float

Returns
-------
None
") Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real Tol);

		/****************** AnErrorOccurred ******************/
		/**** md5 signature: 7f72d28f1d64c3e0ff5b578209701958 ****/
		%feature("compactdefaultargs") AnErrorOccurred;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") AnErrorOccurred;
		Standard_Boolean AnErrorOccurred();

		/****************** NbRoots ******************/
		/**** md5 signature: d23dc5b5f7fe61d6b998e72ba9eb27b3 ****/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbRoots;
		Standard_Integer NbRoots();

		/****************** Perform ******************/
		/**** md5 signature: e8a2249a838c55bb3e5f5411a23756a5 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Poly1: Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter
Poly2: Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter

Returns
-------
NumSegOn1: int
NumSegOn2: int
ParamOnSeg1: float
ParamOnSeg2: float
") Perform;
		void Perform(const Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter & Poly1, const Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter & Poly2, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: 95ca10966a8387b775958da0f1189e3d ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Uo: float
Vo: float
UInf: float
VInf: float
USup: float
VSup: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Real Uo, const Standard_Real Vo, const Standard_Real UInf, const Standard_Real VInf, const Standard_Real USup, const Standard_Real VSup);

		/****************** Roots ******************/
		/**** md5 signature: 8d4622811e04b4565f31efccbad15fef ****/
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
U: float
V: float
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
		/****************** Geom2dInt_GInter ******************/
		/**** md5 signature: 672e83162d340450c3b90f88abfc10a8 ****/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Geom2dInt_GInter;
		 Geom2dInt_GInter();

		/****************** Geom2dInt_GInter ******************/
		/**** md5 signature: 4fb484b267490747651932c8ec0acb86 ****/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Self intersection of a curve.

Parameters
----------
C: Adaptor2d_Curve2d
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_GInter ******************/
		/**** md5 signature: fea0eac3d7fd46de9794a7ec6d14b86e ****/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Self intersection of a curve with a domain.

Parameters
----------
C: Adaptor2d_Curve2d
D: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C, const IntRes2d_Domain & D, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_GInter ******************/
		/**** md5 signature: b9ae0e69063b2fd367c5e757e99a66ac ****/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_GInter ******************/
		/**** md5 signature: 325a809492e902d5d4658b8733385424 ****/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Adaptor2d_Curve2d
D1: IntRes2d_Domain
C2: Adaptor2d_Curve2d
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_GInter ******************/
		/**** md5 signature: 07f243fe9f9cd09985a7e4f9277a60e5 ****/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_GInter ******************/
		/**** md5 signature: 36327c316ba2b5d25d1733e75a7d3718 ****/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Adaptor2d_Curve2d
D1: IntRes2d_Domain
C2: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** ComputeDomain ******************/
		/**** md5 signature: 30dee687e5aac26c1fc0f8dead62030a ****/
		%feature("compactdefaultargs") ComputeDomain;
		%feature("autodoc", "Create a domain from a curve.

Parameters
----------
C1: Adaptor2d_Curve2d
TolDomain: float

Returns
-------
IntRes2d_Domain
") ComputeDomain;
		IntRes2d_Domain ComputeDomain(const Adaptor2d_Curve2d & C1, const Standard_Real TolDomain);

		/****************** GetMinNbSamples ******************/
		/**** md5 signature: 337038c4c6920a9f4b1d8efd60cf2219 ****/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetMinNbSamples;
		Standard_Integer GetMinNbSamples();

		/****************** Perform ******************/
		/**** md5 signature: 2c1b22db629766daef0fa0e20997d5cd ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Adaptor2d_Curve2d
D1: IntRes2d_Domain
C2: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: f8714ec760a9c2ae5dfb62d2c8bc3554 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 102d9ee0e7455bf921a0002f67c49b38 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Adaptor2d_Curve2d
D1: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 94e2b061c761851b5d98bbfe69bccf4d ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Adaptor2d_Curve2d
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: f761cd93db25b118693ba94b847675f3 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Adaptor2d_Curve2d
D1: IntRes2d_Domain
C2: Adaptor2d_Curve2d
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 36f90ae0b2d564b02d45c8763c52f25a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** SetMinNbSamples ******************/
		/**** md5 signature: 32ce254ec9cb1151513557c7a8edb457 ****/
		%feature("compactdefaultargs") SetMinNbSamples;
		%feature("autodoc", "Set / get minimum number of points in polygon intersection.

Parameters
----------
theMinNbSamples: int

Returns
-------
None
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
		/****************** Circle ******************/
		/**** md5 signature: f83d3b524bcebc84f76bd577a264bd65 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Returns the circ2d from gp corresponding to the curve c. this method is called only when thetype returns geomabs_circle.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
gp_Circ2d
") Circle;
		static gp_Circ2d Circle(const Adaptor2d_Curve2d & C);

		/****************** D0 ******************/
		/**** md5 signature: 2b0f7c6e7628378c5466f63173da2848 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		static void D0(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 0d4b95e50d0339c78a214bef2a48dd17 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
T: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & T);

		/****************** D2 ******************/
		/**** md5 signature: 61872ec93b4c314ded0188d21b9aa43a ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
T: gp_Vec2d
N: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & T, gp_Vec2d & N);

		/****************** D3 ******************/
		/**** md5 signature: a96f7d195ff5b987371b06533e7f27b2 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
T: gp_Vec2d
N: gp_Vec2d
V: gp_Vec2d

Returns
-------
None
") D3;
		static void D3(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & T, gp_Vec2d & N, gp_Vec2d & V);

		/****************** DN ******************/
		/**** md5 signature: 4678c9ac681caad59540990ee359a046 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		static gp_Vec2d DN(const Adaptor2d_Curve2d & C, const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: 9581ff0fc0c406a9427befca62ed1f81 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
int
") Degree;
		static Standard_Integer Degree(const Adaptor2d_Curve2d & C);

		/****************** Ellipse ******************/
		/**** md5 signature: 6b3d2146deb980d4d62eb8bafed2a0e1 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Returns the elips2d from gp corresponding to the curve c. this method is called only when thetype returns geomabs_ellipse.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse(const Adaptor2d_Curve2d & C);

		/****************** EpsX ******************/
		/**** md5 signature: 58ce0d047a9b04cc5fd0e01857501e0a ****/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
float
") EpsX;
		static Standard_Real EpsX(const Adaptor2d_Curve2d & C);

		/****************** EpsX ******************/
		/**** md5 signature: f1a6ce4f31eeec026643edd71f6c7ee7 ****/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d
Eps_XYZ: float

Returns
-------
float
") EpsX;
		static Standard_Real EpsX(const Adaptor2d_Curve2d & C, const Standard_Real Eps_XYZ);

		/****************** FirstParameter ******************/
		/**** md5 signature: 540078107c638c43eb2ce9ec567932d5 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const Adaptor2d_Curve2d & C);

		/****************** GetInterval ******************/
		/**** md5 signature: 3da0f9fc2d4eeb2be9c3ee920a1eb9d3 ****/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "Output the bounds of interval of index <index> used if type == composite.

Parameters
----------
C: Adaptor2d_Curve2d
Index: int
Tab: TColStd_Array1OfReal

Returns
-------
U1: float
U2: float
") GetInterval;
		static void GetInterval(const Adaptor2d_Curve2d & C, const Standard_Integer Index, const TColStd_Array1OfReal & Tab, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetType ******************/
		/**** md5 signature: 3307087cce71727ba86c3994c56d1dfd ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType(const Adaptor2d_Curve2d & C);

		/****************** Hyperbola ******************/
		/**** md5 signature: d765efdcf68c3ccb564b090d516d2f0c ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Returns the hypr2d from gp corresponding to the curve c. this method is called only when thetype returns geomabs_hyperbola.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola(const Adaptor2d_Curve2d & C);

		/****************** Intervals ******************/
		/**** md5 signature: 87431b8d0ca159bdab43a60cb219eeb5 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Compute tab.

Parameters
----------
C: Adaptor2d_Curve2d
Tab: TColStd_Array1OfReal

Returns
-------
None
") Intervals;
		static void Intervals(const Adaptor2d_Curve2d & C, TColStd_Array1OfReal & Tab);

		/****************** LastParameter ******************/
		/**** md5 signature: b0abc948bceff30cc6ea9b7b21deb71b ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const Adaptor2d_Curve2d & C);

		/****************** Line ******************/
		/**** md5 signature: 2ed473b8b806549a67acbbb8f7054334 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the lin2d from gp corresponding to the curve c. this method is called only when thetype returns geomabs_line.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
gp_Lin2d
") Line;
		static gp_Lin2d Line(const Adaptor2d_Curve2d & C);

		/****************** NbIntervals ******************/
		/**** md5 signature: 9810a9ff3dda2e840e4401689b41004b ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Output the number of interval of continuity c2 of the curve.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
int
") NbIntervals;
		static Standard_Integer NbIntervals(const Adaptor2d_Curve2d & C);

		/****************** NbSamples ******************/
		/**** md5 signature: a79778fe0904ebc85cecada27cadfa22 ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
int
") NbSamples;
		static Standard_Integer NbSamples(const Adaptor2d_Curve2d & C);

		/****************** NbSamples ******************/
		/**** md5 signature: 726ec14f33956677290f44d4612ba52c ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d
U0: float
U1: float

Returns
-------
int
") NbSamples;
		static Standard_Integer NbSamples(const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real U1);

		/****************** Parabola ******************/
		/**** md5 signature: 91ce2d6bffca5cc115a4e157ac689f40 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Returns the parab2d from gp corresponding to the curve c. this method is called only when thetype returns geomabs_parabola.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola(const Adaptor2d_Curve2d & C);

		/****************** Value ******************/
		/**** md5 signature: 25c43883b98c57ec983decf96bd4fd24 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d
X: float

Returns
-------
gp_Pnt2d
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
		/****************** Geom2dInt_IntConicCurveOfGInter ******************/
		/**** md5 signature: d326152ab7d26261f0a1b3e4f48a0ba6 ****/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter();

		/****************** Geom2dInt_IntConicCurveOfGInter ******************/
		/**** md5 signature: f0d55400793bb40b6dac4c1fa62a8504 ****/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "Intersection between a line and a parametric curve.

Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_IntConicCurveOfGInter ******************/
		/**** md5 signature: 49323f6f1e7cdbde1eeb7df4da2c0932 ****/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "Intersection between a line and a parametric curve.

Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_IntConicCurveOfGInter ******************/
		/**** md5 signature: 28202a760394e5853909c572e6840cfe ****/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "Intersection between an ellipse and a parametric curve.

Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_IntConicCurveOfGInter ******************/
		/**** md5 signature: e50e8ed95f3a8420233d828187da512e ****/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "Intersection between a parabola and a parametric curve.

Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_IntConicCurveOfGInter ******************/
		/**** md5 signature: d4ed103c34c1863ceba471ebbd4ec188 ****/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "Intersection between the main branch of an hyperbola and a parametric curve.

Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 15a884c185240a9a240bc5a54c0562fc ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and a parametric curve.

Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 8a759a82930284963483be21254c7ab8 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and a parametric curve.

Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 772c39bd5bcf8ac0d7a23731369a1f2d ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between an ellipse and a parametric curve.

Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: c8210a7676aec190cc51054f685dfc52 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a parabola and a parametric curve.

Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: f16dbfc90b0b2a0cec2c70faa1cdeeb2 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between the main branch of an hyperbola and a parametric curve.

Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
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
		/****************** Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter ******************/
		/**** md5 signature: 5773547517531f059b69ac71dcd61497 ****/
		%feature("compactdefaultargs") Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter;
		%feature("autodoc", "Constructor of the class.

Parameters
----------
IT: IntCurve_IConicTool
PC: Adaptor2d_Curve2d

Returns
-------
None
") Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter(const IntCurve_IConicTool & IT, const Adaptor2d_Curve2d & PC);

		/****************** Derivative ******************/
		/**** md5 signature: f61c873331fa555e182f1973e95f59da ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Computes the derivative of the previous function at parameter param.

Parameters
----------
Param: float

Returns
-------
D: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real Param, Standard_Real &OutValue);

		/****************** Value ******************/
		/**** md5 signature: 96999dda9fe43560f6ec0c3dc2a0f930 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value of the signed distance between the implicit curve and the point at parameter param on the parametrised curve.

Parameters
----------
Param: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real Param, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: 30b6c9e0ecc359e02c44e042b54e6b7c ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value and the derivative of the function.

Parameters
----------
Param: float

Returns
-------
F: float
D: float
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
		/****************** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter ******************/
		/**** md5 signature: 426902f7f259094919589b68c6a25cd8 ****/
		%feature("compactdefaultargs") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter();

		/****************** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter ******************/
		/**** md5 signature: 45b8a2eedb62eb54a572f8c8270f0f82 ****/
		%feature("compactdefaultargs") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d

Returns
-------
None
") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C);

		/****************** Derivative ******************/
		/**** md5 signature: 74e45b7ef1cb50395f459121235df2cd ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Calculation of f'(u).

Parameters
----------
U: float

Returns
-------
DF: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		/**** md5 signature: 295b46cc3c15eb5116b8523fecaa122c ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mycurve of the function.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Shows if the nth distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
		/**** md5 signature: 6123812027804044a54749cfa19bef5e ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SearchOfTolerance ******************/
		/**** md5 signature: 73a2a1f7b776ed3aaadf205798ee8767 ****/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
		/**** md5 signature: 0ad85ba084f338225cb11e827425ab5f ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field p of the function.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt2d & P);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		/**** md5 signature: 424565e975e565ea668d16ca9ce728b5 ****/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines boundaries of subinterval for find of root.

Parameters
----------
theUfirst: float
theUlast: float

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****************** Value ******************/
		/**** md5 signature: e3462efa1edccfd4021bca61bc42d936 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of f(u).

Parameters
----------
U: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: a9de0e54fbbad71406954eb825560b84 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of f(u) and f'(u).

Parameters
----------
U: float

Returns
-------
F: float
DF: float
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
		/****************** Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter ******************/
		/**** md5 signature: 89dc6631bcd06f3348bc4fcc91c073a6 ****/
		%feature("compactdefaultargs") Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter;
		%feature("autodoc", "No available documentation.

Parameters
----------
curve1: Adaptor2d_Curve2d
curve2: Adaptor2d_Curve2d

Returns
-------
None
") Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter(const Adaptor2d_Curve2d & curve1, const Adaptor2d_Curve2d & curve2);

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** NbEquations ******************/
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
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
		/****************** Geom2dInt_TheIntConicCurveOfGInter ******************/
		/**** md5 signature: 442235095cb83e65c4d163949e4b639f ****/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter();

		/****************** Geom2dInt_TheIntConicCurveOfGInter ******************/
		/**** md5 signature: 31c8b0a07e8faa7fea8fe3295a1da414 ****/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "Intersection between a line and a parametric curve.

Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_TheIntConicCurveOfGInter ******************/
		/**** md5 signature: 1bbb1d67396be0a01496649d383a3301 ****/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "Intersection between a line and a parametric curve.

Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_TheIntConicCurveOfGInter ******************/
		/**** md5 signature: a6ef32e4284008815c4243bbf2cc7159 ****/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "Intersection between an ellipse and a parametric curve.

Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_TheIntConicCurveOfGInter ******************/
		/**** md5 signature: 81374f2177e6c16b4b798b61b9a974d7 ****/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "Intersection between a parabola and a parametric curve.

Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_TheIntConicCurveOfGInter ******************/
		/**** md5 signature: ead6beeb7a7ccff34cbdec4f3c94afbc ****/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "Intersection between the main branch of an hyperbola and a parametric curve.

Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 15a884c185240a9a240bc5a54c0562fc ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and a parametric curve.

Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 8a759a82930284963483be21254c7ab8 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and a parametric curve.

Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 772c39bd5bcf8ac0d7a23731369a1f2d ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between an ellipse and a parametric curve.

Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: c8210a7676aec190cc51054f685dfc52 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a parabola and a parametric curve.

Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: f16dbfc90b0b2a0cec2c70faa1cdeeb2 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between the main branch of an hyperbola and a parametric curve.

Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
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
		/****************** Geom2dInt_TheIntPCurvePCurveOfGInter ******************/
		/**** md5 signature: 29b0f855a1d18b661dc904c525704e14 ****/
		%feature("compactdefaultargs") Geom2dInt_TheIntPCurvePCurveOfGInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Geom2dInt_TheIntPCurvePCurveOfGInter;
		 Geom2dInt_TheIntPCurvePCurveOfGInter();

		/****************** GetMinNbSamples ******************/
		/**** md5 signature: 337038c4c6920a9f4b1d8efd60cf2219 ****/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetMinNbSamples;
		Standard_Integer GetMinNbSamples();

		/****************** Perform ******************/
		/**** md5 signature: a005634660caeb34b480e7361aecd221 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve1: Adaptor2d_Curve2d
Domain1: IntRes2d_Domain
Curve2: Adaptor2d_Curve2d
Domain2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor2d_Curve2d & Curve1, const IntRes2d_Domain & Domain1, const Adaptor2d_Curve2d & Curve2, const IntRes2d_Domain & Domain2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 9bfa3fac9e615df81d9c6cd7f2d9d5c8 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve1: Adaptor2d_Curve2d
Domain1: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor2d_Curve2d & Curve1, const IntRes2d_Domain & Domain1, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** SetMinNbSamples ******************/
		/**** md5 signature: 32ce254ec9cb1151513557c7a8edb457 ****/
		%feature("compactdefaultargs") SetMinNbSamples;
		%feature("autodoc", "Set / get minimum number of points in polygon for intersection.

Parameters
----------
theMinNbSamples: int

Returns
-------
None
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
		/****************** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter ******************/
		/**** md5 signature: 8b50729718ad9c424b34e560a84ada54 ****/
		%feature("compactdefaultargs") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter();

		/****************** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter ******************/
		/**** md5 signature: 6f94af849ea66fd1655f6f808cbe61f8 ****/
		%feature("compactdefaultargs") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		%feature("autodoc", "Intersection between an implicit curve and a parametrised curve. the exception constructionerror is raised if the domain of the parametrised curve does not verify hasfirstpoint and haslastpoint return true.

Parameters
----------
ITool: IntCurve_IConicTool
Dom1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
Dom2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter(const IntCurve_IConicTool & ITool, const IntRes2d_Domain & Dom1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & Dom2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** And_Domaine_Objet1_Intersections ******************/
		/**** md5 signature: fe703f166d048c73377c7e3d2b1e5283 ****/
		%feature("compactdefaultargs") And_Domaine_Objet1_Intersections;
		%feature("autodoc", "No available documentation.

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

Returns
-------
NbResultats: int
") And_Domaine_Objet1_Intersections;
		void And_Domaine_Objet1_Intersections(const IntCurve_IConicTool & TheImpTool, const Adaptor2d_Curve2d & TheParCurve, const IntRes2d_Domain & TheImpCurveDomain, const IntRes2d_Domain & TheParCurveDomain, Standard_Integer &OutValue, TColStd_Array1OfReal & Inter2_And_Domain2, TColStd_Array1OfReal & Inter1, TColStd_Array1OfReal & Resultat1, TColStd_Array1OfReal & Resultat2, const Standard_Real EpsNul);

		/****************** FindU ******************/
		/**** md5 signature: 84a4f5eb2d39d95a27586aae724aed4d ****/
		%feature("compactdefaultargs") FindU;
		%feature("autodoc", "No available documentation.

Parameters
----------
parameter: float
point: gp_Pnt2d
TheParCurev: Adaptor2d_Curve2d
TheImpTool: IntCurve_IConicTool

Returns
-------
float
") FindU;
		Standard_Real FindU(const Standard_Real parameter, gp_Pnt2d & point, const Adaptor2d_Curve2d & TheParCurev, const IntCurve_IConicTool & TheImpTool);

		/****************** FindV ******************/
		/**** md5 signature: c194b380ff913201b56034452581c9cd ****/
		%feature("compactdefaultargs") FindV;
		%feature("autodoc", "No available documentation.

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

Returns
-------
float
") FindV;
		Standard_Real FindV(const Standard_Real parameter, gp_Pnt2d & point, const IntCurve_IConicTool & TheImpTool, const Adaptor2d_Curve2d & ParCurve, const IntRes2d_Domain & TheParCurveDomain, const Standard_Real V0, const Standard_Real V1, const Standard_Real Tolerance);

		/****************** Perform ******************/
		/**** md5 signature: 19e469495dca83aa458842e14cf6b595 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between an implicit curve and a parametrised curve. the exception constructionerror is raised if the domain of the parametrised curve does not verify hasfirstpoint and haslastpoint return true.

Parameters
----------
ITool: IntCurve_IConicTool
Dom1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
Dom2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
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
		/****************** Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter ******************/
		/**** md5 signature: 8d229e3249dc5a7f72237a268027ff1e ****/
		%feature("compactdefaultargs") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter();

		/****************** Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter ******************/
		/**** md5 signature: a971c67190a2ca3f6addaffb1bbdce56 ****/
		%feature("compactdefaultargs") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. tolu is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolu.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
U0: float
TolU: float

Returns
-------
None
") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real TolU);

		/****************** Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter ******************/
		/**** md5 signature: a8c07ef8b33afcd3aa84d7cbfb06958e ****/
		%feature("compactdefaultargs") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. zeros are searched between umin et usup. tolu is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolu.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
U0: float
Umin: float
Usup: float
TolU: float

Returns
-------
None
") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****************** Initialize ******************/
		/**** md5 signature: 673c63ed8f08af5bcfdd5ced5f979463 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
Umin: float
Usup: float
TolU: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: 1c0b1dbd0d0c10c93cbf9fefce4bad3b ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the extremum distance is a minimum.

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin();

		/****************** Perform ******************/
		/**** md5 signature: 572d96f228989fec803e5b8f273e32cd ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt2d
U0: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P, const Standard_Real U0);

		/****************** Point ******************/
		/**** md5 signature: 0b14be81c893f7916dafa40cecb53c69 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the extremum distance.

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point();

		/****************** SquareDistance ******************/
		/**** md5 signature: 2eba58521e0603c1ef0e683534b03956 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
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
		/****************** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter ******************/
		/**** md5 signature: a2a6dcebbbabae2dd0e37cf1d6c8e640 ****/
		%feature("compactdefaultargs") Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter;
		%feature("autodoc", "Compute a polygon on the domain of the curve.

Parameters
----------
Curve: Adaptor2d_Curve2d
NbPnt: int
Domain: IntRes2d_Domain
Tol: float

Returns
-------
None
") Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter(const Adaptor2d_Curve2d & Curve, const Standard_Integer NbPnt, const IntRes2d_Domain & Domain, const Standard_Real Tol);

		/****************** ApproxParamOnCurve ******************/
		/**** md5 signature: ea6b1c4f19abd104ce26cf986e38bc0b ****/
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "Give an approximation of the parameter on the curve according to the discretization of the curve.

Parameters
----------
Index: int
ParamOnLine: float

Returns
-------
float
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve(const Standard_Integer Index, const Standard_Real ParamOnLine);

		/****************** AutoIntersectionIsPossible ******************/
		/**** md5 signature: 461afa84e474b507672077d4d358a741 ****/
		%feature("compactdefaultargs") AutoIntersectionIsPossible;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") AutoIntersectionIsPossible;
		Standard_Boolean AutoIntersectionIsPossible();

		/****************** CalculRegion ******************/
		/**** md5 signature: 34769b0e402ed40fc1aa75180518eb35 ****/
		%feature("compactdefaultargs") CalculRegion;
		%feature("autodoc", "No available documentation.

Parameters
----------
x: float
y: float
x1: float
x2: float
y1: float
y2: float

Returns
-------
int
") CalculRegion;
		Standard_Integer CalculRegion(const Standard_Real x, const Standard_Real y, const Standard_Real x1, const Standard_Real x2, const Standard_Real y1, const Standard_Real y2);

		/****************** Closed ******************/
		/**** md5 signature: c5b0bafd47da29606481588a971270ce ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Parameters
----------
clos: bool

Returns
-------
None
") Closed;
		void Closed(const Standard_Boolean clos);

		/****************** Closed ******************/
		/**** md5 signature: fb3b1ea0f3831f02fc7dc8ae66caac7b ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Returns true if the polyline is closed.

Returns
-------
bool
") Closed;
		virtual Standard_Boolean Closed();

		/****************** ComputeWithBox ******************/
		/**** md5 signature: a2577e286c7447afd172b5be81ef7131 ****/
		%feature("compactdefaultargs") ComputeWithBox;
		%feature("autodoc", "The current polygon is modified if most of the points of the polygon are are outside the box <otherbox>. in this situation, bounds are computed to build a polygon inside or near the otherbox.

Parameters
----------
Curve: Adaptor2d_Curve2d
OtherBox: Bnd_Box2d

Returns
-------
None
") ComputeWithBox;
		void ComputeWithBox(const Adaptor2d_Curve2d & Curve, const Bnd_Box2d & OtherBox);

		/****************** DeflectionOverEstimation ******************/
		/**** md5 signature: 43f4e747867c1147de91dcc2fd648827 ****/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") DeflectionOverEstimation;
		virtual Standard_Real DeflectionOverEstimation();

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** InfParameter ******************/
		/**** md5 signature: 8559659cfaf88d25c04ace5dcdcbde32 ****/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Returns the parameter (on the curve) of the first point of the polygon.

Returns
-------
float
") InfParameter;
		Standard_Real InfParameter();

		/****************** NbSegments ******************/
		/**** md5 signature: 3964cbfa1f20d4814234f7fc3d204bbb ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Give the number of segments in the polyline.

Returns
-------
int
") NbSegments;
		virtual Standard_Integer NbSegments();

		/****************** Segment ******************/
		/**** md5 signature: 86ed8dcd5c63b8c7622186f373e5af81 ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns the points of the segment <index> in the polygon.

Parameters
----------
theIndex: int
theBegin: gp_Pnt2d
theEnd: gp_Pnt2d

Returns
-------
None
") Segment;
		virtual void Segment(const Standard_Integer theIndex, gp_Pnt2d & theBegin, gp_Pnt2d & theEnd);

		/****************** SetDeflectionOverEstimation ******************/
		/**** md5 signature: 310446258d4443a660c9cfe280519b05 ****/
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", "No available documentation.

Parameters
----------
x: float

Returns
-------
None
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation(const Standard_Real x);

		/****************** SupParameter ******************/
		/**** md5 signature: 67f72e7357fa61911c23a764d72614ea ****/
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "Returns the parameter (on the curve) of the last point of the polygon.

Returns
-------
float
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
		/****************** FindParameter ******************/
		/**** md5 signature: 09dfdffb4b5220d74013e1ecd50cdbd5 ****/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "Returns the parameter v of the point on the parametric curve corresponding to the point pnt. the correspondance between pnt and the point p(v) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. tol is the tolerance on the distance between a point and the parametrised curve. in that case, no bounds are given. the research of the rigth parameter has to be made on the natural parametric domain of the curve.

Parameters
----------
C: Adaptor2d_Curve2d
Pnt: gp_Pnt2d
Tol: float

Returns
-------
float
") FindParameter;
		static Standard_Real FindParameter(const Adaptor2d_Curve2d & C, const gp_Pnt2d & Pnt, const Standard_Real Tol);

		/****************** FindParameter ******************/
		/**** md5 signature: 62d40694d41fa21c773faec789a5ba56 ****/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "Returns the parameter v of the point on the parametric curve corresponding to the point pnt. the correspondance between pnt and the point p(v) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. tol is the tolerance on the distance between a point and the parametrised curve. lowparameter and highparameter give the boundaries of the interval in wich the parameter certainly lies. these parameters are given to implement a more efficient algoritm. so, it is not necessary to check that the returned value verifies lowparameter <= value <= highparameter.

Parameters
----------
C: Adaptor2d_Curve2d
Pnt: gp_Pnt2d
LowParameter: float
HighParameter: float
Tol: float

Returns
-------
float
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
