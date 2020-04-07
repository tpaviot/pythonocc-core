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
		%feature("compactdefaultargs") AnErrorOccurred;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") AnErrorOccurred;
		Standard_Boolean AnErrorOccurred();

		/****************** NbRoots ******************/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbRoots;
		Standard_Integer NbRoots();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Geom2dInt_GInter;
		 Geom2dInt_GInter();

		/****************** Geom2dInt_GInter ******************/
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
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetMinNbSamples;
		Standard_Integer GetMinNbSamples();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter();

		/****************** Geom2dInt_IntConicCurveOfGInter ******************/
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
		%feature("compactdefaultargs") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter();

		/****************** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter ******************/
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
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
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
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
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
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
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
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter();

		/****************** Geom2dInt_TheIntConicCurveOfGInter ******************/
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
		%feature("compactdefaultargs") Geom2dInt_TheIntPCurvePCurveOfGInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Geom2dInt_TheIntPCurvePCurveOfGInter;
		 Geom2dInt_TheIntPCurvePCurveOfGInter();

		/****************** GetMinNbSamples ******************/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetMinNbSamples;
		Standard_Integer GetMinNbSamples();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter();

		/****************** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter ******************/
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
		%feature("compactdefaultargs") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter();

		/****************** Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter ******************/
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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the extremum distance is a minimum.

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the extremum distance.

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point();

		/****************** SquareDistance ******************/
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
		%feature("compactdefaultargs") AutoIntersectionIsPossible;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") AutoIntersectionIsPossible;
		Standard_Boolean AutoIntersectionIsPossible();

		/****************** CalculRegion ******************/
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
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Returns true if the polyline is closed.

Returns
-------
bool
") Closed;
		virtual Standard_Boolean Closed();

		/****************** ComputeWithBox ******************/
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
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") DeflectionOverEstimation;
		virtual Standard_Real DeflectionOverEstimation();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** InfParameter ******************/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Returns the parameter (on the curve) of the first point of the polygon.

Returns
-------
float
") InfParameter;
		Standard_Real InfParameter();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Give the number of segments in the polyline.

Returns
-------
int
") NbSegments;
		virtual Standard_Integer NbSegments();

		/****************** Segment ******************/
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
