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
%define BREPBLENDDOCSTRING
"BRepBlend module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepblend.html"
%enddef
%module (package="OCC.Core", docstring=BREPBLENDDOCSTRING) BRepBlend


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
#include<BRepBlend_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BlendFunc_module.hxx>
#include<Approx_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAbs_module.hxx>
#include<Blend_module.hxx>
#include<math_module.hxx>
#include<AppBlend_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<IntSurf_module.hxx>
#include<Law_module.hxx>
#include<ChFiDS_module.hxx>
#include<TopAbs_module.hxx>
#include<AppParCurves_module.hxx>
#include<TCollection_module.hxx>
#include<PLib_module.hxx>
#include<FEmTool_module.hxx>
#include<Convert_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<TopLoc_module.hxx>
#include<TopoDS_module.hxx>
#include<TopTools_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BlendFunc.i
%import Approx.i
%import gp.i
%import TColgp.i
%import TColStd.i
%import GeomAbs.i
%import Blend.i
%import math.i
%import AppBlend.i
%import Adaptor3d.i
%import Adaptor2d.i
%import IntSurf.i
%import Law.i
%import ChFiDS.i
%import TopAbs.i

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
%wrap_handle(BRepBlend_AppFuncRoot)
%wrap_handle(BRepBlend_Line)
%wrap_handle(BRepBlend_AppFunc)
%wrap_handle(BRepBlend_AppFuncRst)
%wrap_handle(BRepBlend_AppFuncRstRst)
/* end handles declaration */

/* templates */
%template(BRepBlend_SequenceOfLine) NCollection_Sequence<opencascade::handle<BRepBlend_Line>>;
%template(BRepBlend_SequenceOfPointOnRst) NCollection_Sequence<BRepBlend_PointOnRst>;
/* end templates declaration */

/* typedefs */
typedef BlendFunc_CSCircular BRepBlend_CSCircular;
typedef BlendFunc_CSConstRad BRepBlend_CSConstRad;
typedef BlendFunc_ChAsym BRepBlend_ChAsym;
typedef BlendFunc_ChAsymInv BRepBlend_ChAsymInv;
typedef BlendFunc_ChamfInv BRepBlend_ChamfInv;
typedef BlendFunc_Chamfer BRepBlend_Chamfer;
typedef BlendFunc_ConstRad BRepBlend_ConstRad;
typedef BlendFunc_ConstRadInv BRepBlend_ConstRadInv;
typedef BlendFunc_ConstThroat BRepBlend_ConstThroat;
typedef BlendFunc_ConstThroatInv BRepBlend_ConstThroatInv;
typedef BlendFunc_ConstThroatWithPenetration BRepBlend_ConstThroatWithPenetration;
typedef BlendFunc_ConstThroatWithPenetrationInv BRepBlend_ConstThroatWithPenetrationInv;
typedef BlendFunc_EvolRad BRepBlend_EvolRad;
typedef BlendFunc_EvolRadInv BRepBlend_EvolRadInv;
typedef BlendFunc_Ruled BRepBlend_Ruled;
typedef BlendFunc_RuledInv BRepBlend_RuledInv;
typedef NCollection_Sequence<opencascade::handle<BRepBlend_Line>> BRepBlend_SequenceOfLine;
typedef NCollection_Sequence<BRepBlend_PointOnRst> BRepBlend_SequenceOfPointOnRst;
/* end typedefs declaration */

/******************************
* class BRepBlend_AppFuncRoot *
******************************/
%nodefaultctor BRepBlend_AppFuncRoot;
class BRepBlend_AppFuncRoot : public Approx_SweepFunction {
	public:
		/****************** BarycentreOfSurf ******************/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Get the barycentre of surface. an very poor estimation is sufficent. this information is usefull to perform well conditionned rational approximation.

Returns
-------
gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute the section for v = param.

Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute the first derivative in v direction of the section for v = param.

Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute the second derivative in v direction of the section for v = param.

Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections. this information is usefull to perform well conditionned rational approximation.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary (in radian) surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: TColStd_Array1OfReal

Returns
-------
None
") GetTolerance;
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, TColStd_Array1OfReal & Tol3d);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal or not.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Get the knots of the section.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****************** MaximalSection ******************/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Returns the length of the maximum section. this information is usefull to perform well conditionned rational approximation.

Returns
-------
float
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "Get the multplicities of the section.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****************** Nb2dCurves ******************/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Get the number of 2d curves to approximate.

Returns
-------
int
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
Func: Blend_AppFunction
Param: float
Sol: math_Vector
Pnt: Blend_Point

Returns
-------
None
") Point;
		virtual void Point(const Blend_AppFunction & Func, const Standard_Real Param, const math_Vector & Sol, Blend_Point & Pnt);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the resolutions in the sub-space 2d <index> -- this information is usfull to find an good tolerance in 2d approximation.

Parameters
----------
Index: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		virtual void Resolution(const Standard_Integer Index, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SectionShape ******************/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "Get the format of an section.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "Sets the bounds of the parametric interval on the fonction this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Is usfull, if (me) have to be run numerical algorithme to perform d0, d1 or d2.

Parameters
----------
Tol3d: float
Tol2d: float

Returns
-------
None
") SetTolerance;
		virtual void SetTolerance(const Standard_Real Tol3d, const Standard_Real Tol2d);

		/****************** Vec ******************/
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Pnt: Blend_Point

Returns
-------
None
") Vec;
		virtual void Vec(math_Vector & Sol, const Blend_Point & Pnt);

};


%make_alias(BRepBlend_AppFuncRoot)

%extend BRepBlend_AppFuncRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepBlend_AppSurf *
**************************/
class BRepBlend_AppSurf : public AppBlend_Approx {
	public:
		/****************** BRepBlend_AppSurf ******************/
		%feature("compactdefaultargs") BRepBlend_AppSurf;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepBlend_AppSurf;
		 BRepBlend_AppSurf();

		/****************** BRepBlend_AppSurf ******************/
		%feature("compactdefaultargs") BRepBlend_AppSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degmin: int
Degmax: int
Tol3d: float
Tol2d: float
NbIt: int
KnownParameters: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepBlend_AppSurf;
		 BRepBlend_AppSurf(const Standard_Integer Degmin, const Standard_Integer Degmax, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIt, const Standard_Boolean KnownParameters = Standard_False);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity used in the approximation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** CriteriumWeight ******************/
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "Returns the weights (as percent) associed to the criterium used in the optimization.

Parameters
----------

Returns
-------
W1: float
W2: float
W3: float
") CriteriumWeight;
		void CriteriumWeight(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
TPoles: TColgp_Array1OfPnt2d
TKnots: TColStd_Array1OfReal
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Curve2d;
		void Curve2d(const Standard_Integer Index, TColgp_Array1OfPnt2d & TPoles, TColStd_Array1OfReal & TKnots, TColStd_Array1OfInteger & TMults);

		/****************** Curve2dPoles ******************/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
TColgp_Array1OfPnt2d
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles(const Standard_Integer Index);

		/****************** Curves2dDegree ******************/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Curves2dDegree;
		Standard_Integer Curves2dDegree();

		/****************** Curves2dKnots ******************/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots();

		/****************** Curves2dMults ******************/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults();

		/****************** Curves2dShape ******************/
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Degree: int
NbPoles: int
NbKnots: int
") Curves2dShape;
		void Curves2dShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degmin: int
Degmax: int
Tol3d: float
Tol2d: float
NbIt: int
KnownParameters: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const Standard_Integer Degmin, const Standard_Integer Degmax, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIt, const Standard_Boolean KnownParameters = Standard_False);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbCurves2d ******************/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****************** ParType ******************/
		%feature("compactdefaultargs") ParType;
		%feature("autodoc", "Returns the type of parametrization used in the approximation.

Returns
-------
Approx_ParametrizationType
") ParType;
		Approx_ParametrizationType ParType();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lin: BRepBlend_Line
SecGen: Blend_AppFunction
SpApprox: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<BRepBlend_Line> & Lin, Blend_AppFunction & SecGen, const Standard_Boolean SpApprox = Standard_False);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lin: BRepBlend_Line
SecGen: Blend_AppFunction
NbMaxP: int

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<BRepBlend_Line> & Lin, Blend_AppFunction & SecGen, const Standard_Integer NbMaxP);

		/****************** PerformSmoothing ******************/
		%feature("compactdefaultargs") PerformSmoothing;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lin: BRepBlend_Line
SecGen: Blend_AppFunction

Returns
-------
None
") PerformSmoothing;
		void PerformSmoothing(const opencascade::handle<BRepBlend_Line> & Lin, Blend_AppFunction & SecGen);

		/****************** SetContinuity ******************/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "Define the continuity used in the approximation.

Parameters
----------
C: GeomAbs_Shape

Returns
-------
None
") SetContinuity;
		void SetContinuity(const GeomAbs_Shape C);

		/****************** SetCriteriumWeight ******************/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "Define the weights associed to the criterium used in the optimization. //! if wi <= 0.

Parameters
----------
W1: float
W2: float
W3: float

Returns
-------
None
") SetCriteriumWeight;
		void SetCriteriumWeight(const Standard_Real W1, const Standard_Real W2, const Standard_Real W3);

		/****************** SetParType ******************/
		%feature("compactdefaultargs") SetParType;
		%feature("autodoc", "Define the type of parametrization used in the approximation.

Parameters
----------
ParType: Approx_ParametrizationType

Returns
-------
None
") SetParType;
		void SetParType(const Approx_ParametrizationType ParType);

		/****************** SurfPoles ******************/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles();

		/****************** SurfShape ******************/
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
UDegree: int
VDegree: int
NbUPoles: int
NbVPoles: int
NbUKnots: int
NbVKnots: int
") SurfShape;
		void SurfShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SurfUKnots ******************/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots();

		/****************** SurfUMults ******************/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults();

		/****************** SurfVKnots ******************/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots();

		/****************** SurfVMults ******************/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults();

		/****************** SurfWeights ******************/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
TPoles: TColgp_Array2OfPnt
TWeights: TColStd_Array2OfReal
TUKnots: TColStd_Array1OfReal
TVKnots: TColStd_Array1OfReal
TUMults: TColStd_Array1OfInteger
TVMults: TColStd_Array1OfInteger

Returns
-------
None
") Surface;
		void Surface(TColgp_Array2OfPnt & TPoles, TColStd_Array2OfReal & TWeights, TColStd_Array1OfReal & TUKnots, TColStd_Array1OfReal & TVKnots, TColStd_Array1OfInteger & TUMults, TColStd_Array1OfInteger & TVMults);

		/****************** TolCurveOnSurf ******************/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
float
") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf(const Standard_Integer Index);

		/****************** TolReached ******************/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Tol3d: float
Tol2d: float
") TolReached;
		void TolReached(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VDegree;
		Standard_Integer VDegree();

};


%extend BRepBlend_AppSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepBlend_AppSurface *
*****************************/
class BRepBlend_AppSurface : public AppBlend_Approx {
	public:
		/****************** BRepBlend_AppSurface ******************/
		%feature("compactdefaultargs") BRepBlend_AppSurface;
		%feature("autodoc", "Approximation of the new surface (and eventually the 2d curves on the support surfaces). normaly the 2d curve are approximated with an tolerance given by the resolution on support surfaces, but if this tolerance is too large tol2d is used.

Parameters
----------
Funct: Approx_SweepFunction
First: float
Last: float
Tol3d: float
Tol2d: float
TolAngular: float
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C0
Degmax: int,optional
	default value is 11
Segmax: int,optional
	default value is 50

Returns
-------
None
") BRepBlend_AppSurface;
		 BRepBlend_AppSurface(const opencascade::handle<Approx_SweepFunction> & Funct, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Real TolAngular, const GeomAbs_Shape Continuity = GeomAbs_C0, const Standard_Integer Degmax = 11, const Standard_Integer Segmax = 50);

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
TPoles: TColgp_Array1OfPnt2d
TKnots: TColStd_Array1OfReal
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Curve2d;
		void Curve2d(const Standard_Integer Index, TColgp_Array1OfPnt2d & TPoles, TColStd_Array1OfReal & TKnots, TColStd_Array1OfInteger & TMults);

		/****************** Curve2dPoles ******************/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
TColgp_Array1OfPnt2d
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles(const Standard_Integer Index);

		/****************** Curves2dDegree ******************/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Curves2dDegree;
		Standard_Integer Curves2dDegree();

		/****************** Curves2dKnots ******************/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots();

		/****************** Curves2dMults ******************/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults();

		/****************** Curves2dShape ******************/
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Degree: int
NbPoles: int
NbKnots: int
") Curves2dShape;
		void Curves2dShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Max2dError ******************/
		%feature("compactdefaultargs") Max2dError;
		%feature("autodoc", "Returns the maximum error in the <index> 2d curve approximation.

Parameters
----------
Index: int

Returns
-------
float
") Max2dError;
		Standard_Real Max2dError(const Standard_Integer Index);

		/****************** MaxErrorOnSurf ******************/
		%feature("compactdefaultargs") MaxErrorOnSurf;
		%feature("autodoc", "Returns the maximum error in the suface approximation.

Returns
-------
float
") MaxErrorOnSurf;
		Standard_Real MaxErrorOnSurf();

		/****************** NbCurves2d ******************/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****************** SurfPoles ******************/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles();

		/****************** SurfShape ******************/
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
UDegree: int
VDegree: int
NbUPoles: int
NbVPoles: int
NbUKnots: int
NbVKnots: int
") SurfShape;
		void SurfShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SurfUKnots ******************/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots();

		/****************** SurfUMults ******************/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults();

		/****************** SurfVKnots ******************/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots();

		/****************** SurfVMults ******************/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults();

		/****************** SurfWeights ******************/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
TPoles: TColgp_Array2OfPnt
TWeights: TColStd_Array2OfReal
TUKnots: TColStd_Array1OfReal
TVKnots: TColStd_Array1OfReal
TUMults: TColStd_Array1OfInteger
TVMults: TColStd_Array1OfInteger

Returns
-------
None
") Surface;
		void Surface(TColgp_Array2OfPnt & TPoles, TColStd_Array2OfReal & TWeights, TColStd_Array1OfReal & TUKnots, TColStd_Array1OfReal & TVKnots, TColStd_Array1OfInteger & TUMults, TColStd_Array1OfInteger & TVMults);

		/****************** TolCurveOnSurf ******************/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
float
") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf(const Standard_Integer Index);

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VDegree;
		Standard_Integer VDegree();

};


%extend BRepBlend_AppSurface {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def TolReached(self):
		pass
	}
};

/****************************
* class BRepBlend_CSWalking *
****************************/
class BRepBlend_CSWalking {
	public:
		/****************** BRepBlend_CSWalking ******************/
		%feature("compactdefaultargs") BRepBlend_CSWalking;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curv: Adaptor3d_HCurve
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool

Returns
-------
None
") BRepBlend_CSWalking;
		 BRepBlend_CSWalking(const opencascade::handle<Adaptor3d_HCurve> & Curv, const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain);

		/****************** Complete ******************/
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Blend_CSFunction
Pmin: float

Returns
-------
bool
") Complete;
		Standard_Boolean Complete(Blend_CSFunction & F, const Standard_Real Pmin);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<BRepBlend_Line>
") Line;
		const opencascade::handle<BRepBlend_Line> & Line();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Blend_CSFunction
Pdep: float
Pmax: float
MaxStep: float
TolGuide: float
Soldep: math_Vector
Tolesp: float
Fleche: float
Appro: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(Blend_CSFunction & F, const Standard_Real Pdep, const Standard_Real Pmax, const Standard_Real MaxStep, const Standard_Real TolGuide, const math_Vector & Soldep, const Standard_Real Tolesp, const Standard_Real Fleche, const Standard_Boolean Appro = Standard_False);

};


%extend BRepBlend_CSWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepBlend_CurvPointRadInv *
**********************************/
class BRepBlend_CurvPointRadInv : public Blend_CurvPointFuncInv {
	public:
		/****************** BRepBlend_CurvPointRadInv ******************/
		%feature("compactdefaultargs") BRepBlend_CurvPointRadInv;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor3d_HCurve
C2: Adaptor3d_HCurve

Returns
-------
None
") BRepBlend_CurvPointRadInv;
		 BRepBlend_CurvPointRadInv(const opencascade::handle<Adaptor3d_HCurve> & C1, const opencascade::handle<Adaptor3d_HCurve> & C2);

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

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "Returns in the vector infbound the lowest values allowed for each of the 3 variables. returns in the vector supbound the greatest values allowed for each of the 3 variables.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns in the vector tolerance the parametric tolerance for each of the 3 variables; tol is the tolerance used in 3d space.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Integer Choix);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set the point on which a solution has to be found.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Set;
		void Set(const gp_Pnt & P);

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


%extend BRepBlend_CurvPointRadInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepBlend_Extremity *
****************************/
class BRepBlend_Extremity {
	public:
		/****************** BRepBlend_Extremity ******************/
		%feature("compactdefaultargs") BRepBlend_Extremity;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepBlend_Extremity;
		 BRepBlend_Extremity();

		/****************** BRepBlend_Extremity ******************/
		%feature("compactdefaultargs") BRepBlend_Extremity;
		%feature("autodoc", "Creates an extremity on a surface.

Parameters
----------
P: gp_Pnt
U: float
V: float
Param: float
Tol: float

Returns
-------
None
") BRepBlend_Extremity;
		 BRepBlend_Extremity(const gp_Pnt & P, const Standard_Real U, const Standard_Real V, const Standard_Real Param, const Standard_Real Tol);

		/****************** BRepBlend_Extremity ******************/
		%feature("compactdefaultargs") BRepBlend_Extremity;
		%feature("autodoc", "Creates an extremity on a surface. this extremity matches the vertex <vtx>.

Parameters
----------
P: gp_Pnt
U: float
V: float
Param: float
Tol: float
Vtx: Adaptor3d_HVertex

Returns
-------
None
") BRepBlend_Extremity;
		 BRepBlend_Extremity(const gp_Pnt & P, const Standard_Real U, const Standard_Real V, const Standard_Real Param, const Standard_Real Tol, const opencascade::handle<Adaptor3d_HVertex> & Vtx);

		/****************** BRepBlend_Extremity ******************/
		%feature("compactdefaultargs") BRepBlend_Extremity;
		%feature("autodoc", "Creates an extremity on a curve.

Parameters
----------
P: gp_Pnt
W: float
Param: float
Tol: float

Returns
-------
None
") BRepBlend_Extremity;
		 BRepBlend_Extremity(const gp_Pnt & P, const Standard_Real W, const Standard_Real Param, const Standard_Real Tol);

		/****************** AddArc ******************/
		%feature("compactdefaultargs") AddArc;
		%feature("autodoc", "Sets the values of a point which is on the arc a, at parameter param.

Parameters
----------
A: Adaptor2d_HCurve2d
Param: float
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Returns
-------
None
") AddArc;
		void AddArc(const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****************** HasTangent ******************/
		%feature("compactdefaultargs") HasTangent;
		%feature("autodoc", "Returns true if the tangent is stored.

Returns
-------
bool
") HasTangent;
		Standard_Boolean HasTangent();

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Returns standard_true when the point coincide with an existing vertex.

Returns
-------
bool
") IsVertex;
		Standard_Boolean IsVertex();

		/****************** NbPointOnRst ******************/
		%feature("compactdefaultargs") NbPointOnRst;
		%feature("autodoc", "Returns the number of arc containing the extremity. if the method returns 0, the point is inside the surface. otherwise, the extremity lies on at least 1 arc, and all the information (arc, parameter, transitions) are given by the point on restriction (pointonrst) returned by the next method.

Returns
-------
int
") NbPointOnRst;
		Standard_Integer NbPointOnRst();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** ParameterOnGuide ******************/
		%feature("compactdefaultargs") ParameterOnGuide;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnGuide;
		Standard_Real ParameterOnGuide();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "This method returns the parameters of the point on the concerned surface.

Parameters
----------

Returns
-------
U: float
V: float
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** PointOnRst ******************/
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
BRepBlend_PointOnRst
") PointOnRst;
		const BRepBlend_PointOnRst & PointOnRst(const Standard_Integer Index);

		/****************** SetTangent ******************/
		%feature("compactdefaultargs") SetTangent;
		%feature("autodoc", "Set the tangent vector for an extremity on a surface.

Parameters
----------
Tangent: gp_Vec

Returns
-------
None
") SetTangent;
		void SetTangent(const gp_Vec & Tangent);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Set the values for an extremity on a surface.

Parameters
----------
P: gp_Pnt
U: float
V: float
Param: float
Tol: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real U, const Standard_Real V, const Standard_Real Param, const Standard_Real Tol);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Set the values for an extremity on a surface.this extremity matches the vertex <vtx>.

Parameters
----------
P: gp_Pnt
U: float
V: float
Param: float
Tol: float
Vtx: Adaptor3d_HVertex

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real U, const Standard_Real V, const Standard_Real Param, const Standard_Real Tol, const opencascade::handle<Adaptor3d_HVertex> & Vtx);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Set the values for an extremity on curve.

Parameters
----------
P: gp_Pnt
W: float
Param: float
Tol: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real W, const Standard_Real Param, const Standard_Real Tol);

		/****************** SetVertex ******************/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "Set the values for an extremity on a curve.

Parameters
----------
V: Adaptor3d_HVertex

Returns
-------
None
") SetVertex;
		void SetVertex(const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "This method returns the value of tangent in 3d space.

Returns
-------
gp_Vec
") Tangent;
		const gp_Vec Tangent();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "This method returns the fuzziness on the point in 3d space.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "This method returns the value of the point in 3d space.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the vertex when isvertex returns standard_true.

Returns
-------
opencascade::handle<Adaptor3d_HVertex>
") Vertex;
		const opencascade::handle<Adaptor3d_HVertex> & Vertex();

};


%extend BRepBlend_Extremity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepBlend_Line *
***********************/
class BRepBlend_Line : public Standard_Transient {
	public:
		/****************** BRepBlend_Line ******************/
		%feature("compactdefaultargs") BRepBlend_Line;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepBlend_Line;
		 BRepBlend_Line();

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Adds a point in the line.

Parameters
----------
P: Blend_Point

Returns
-------
None
") Append;
		void Append(const Blend_Point & P);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the content of the line.

Returns
-------
None
") Clear;
		void Clear();

		/****************** EndPointOnFirst ******************/
		%feature("compactdefaultargs") EndPointOnFirst;
		%feature("autodoc", "Returns the end point on s1.

Returns
-------
BRepBlend_Extremity
") EndPointOnFirst;
		const BRepBlend_Extremity & EndPointOnFirst();

		/****************** EndPointOnSecond ******************/
		%feature("compactdefaultargs") EndPointOnSecond;
		%feature("autodoc", "Returns the point on s2.

Returns
-------
BRepBlend_Extremity
") EndPointOnSecond;
		const BRepBlend_Extremity & EndPointOnSecond();

		/****************** InsertBefore ******************/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "Adds a point in the line at the first place.

Parameters
----------
Index: int
P: Blend_Point

Returns
-------
None
") InsertBefore;
		void InsertBefore(const Standard_Integer Index, const Blend_Point & P);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points in the line.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of range index.

Parameters
----------
Index: int

Returns
-------
Blend_Point
") Point;
		const Blend_Point & Point(const Standard_Integer Index);

		/****************** Prepend ******************/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "Adds a point in the line at the first place.

Parameters
----------
P: Blend_Point

Returns
-------
None
") Prepend;
		void Prepend(const Blend_Point & P);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes from <self> all the items of positions between <fromindex> and <toindex>. raises an exception if the indices are out of bounds.

Parameters
----------
FromIndex: int
ToIndex: int

Returns
-------
None
") Remove;
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the value of the transition of the line on s1 and the line on s2.

Parameters
----------
TranS1: IntSurf_TypeTrans
TranS2: IntSurf_TypeTrans

Returns
-------
None
") Set;
		void Set(const IntSurf_TypeTrans TranS1, const IntSurf_TypeTrans TranS2);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the value of the transition of the line on a surface.

Parameters
----------
Trans: IntSurf_TypeTrans

Returns
-------
None
") Set;
		void Set(const IntSurf_TypeTrans Trans);

		/****************** SetEndPoints ******************/
		%feature("compactdefaultargs") SetEndPoints;
		%feature("autodoc", "Sets tne values of the end points for the line.

Parameters
----------
EndPt1: BRepBlend_Extremity
EndPt2: BRepBlend_Extremity

Returns
-------
None
") SetEndPoints;
		void SetEndPoints(const BRepBlend_Extremity & EndPt1, const BRepBlend_Extremity & EndPt2);

		/****************** SetStartPoints ******************/
		%feature("compactdefaultargs") SetStartPoints;
		%feature("autodoc", "Sets the values of the start points for the line.

Parameters
----------
StartPt1: BRepBlend_Extremity
StartPt2: BRepBlend_Extremity

Returns
-------
None
") SetStartPoints;
		void SetStartPoints(const BRepBlend_Extremity & StartPt1, const BRepBlend_Extremity & StartPt2);

		/****************** StartPointOnFirst ******************/
		%feature("compactdefaultargs") StartPointOnFirst;
		%feature("autodoc", "Returns the start point on s1.

Returns
-------
BRepBlend_Extremity
") StartPointOnFirst;
		const BRepBlend_Extremity & StartPointOnFirst();

		/****************** StartPointOnSecond ******************/
		%feature("compactdefaultargs") StartPointOnSecond;
		%feature("autodoc", "Returns the start point on s2.

Returns
-------
BRepBlend_Extremity
") StartPointOnSecond;
		const BRepBlend_Extremity & StartPointOnSecond();

		/****************** TransitionOnS ******************/
		%feature("compactdefaultargs") TransitionOnS;
		%feature("autodoc", "Returns the type of the transition of the line defined on the surface.

Returns
-------
IntSurf_TypeTrans
") TransitionOnS;
		IntSurf_TypeTrans TransitionOnS();

		/****************** TransitionOnS1 ******************/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "Returns the type of the transition of the line defined on the first surface. the transition is 'constant' along the line. the transition is in if the line is oriented in such a way that the system of vectors (n,drac,t) is right-handed, where n is the normal to the first surface at a point p, drac is a vector tangent to the blending patch, oriented towards the valid part of this patch, t is the tangent to the line on s1 at p. the transitioon is out when the system of vectors is left-handed.

Returns
-------
IntSurf_TypeTrans
") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1();

		/****************** TransitionOnS2 ******************/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "Returns the type of the transition of the line defined on the second surface. the transition is 'constant' along the line.

Returns
-------
IntSurf_TypeTrans
") TransitionOnS2;
		IntSurf_TypeTrans TransitionOnS2();

};


%make_alias(BRepBlend_Line)

%extend BRepBlend_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepBlend_PointOnRst *
*****************************/
class BRepBlend_PointOnRst {
	public:
		/****************** BRepBlend_PointOnRst ******************/
		%feature("compactdefaultargs") BRepBlend_PointOnRst;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepBlend_PointOnRst;
		 BRepBlend_PointOnRst();

		/****************** BRepBlend_PointOnRst ******************/
		%feature("compactdefaultargs") BRepBlend_PointOnRst;
		%feature("autodoc", "Creates the pointonrst on the arc a, at parameter param, with the transition tline on the walking line, and tarc on the arc a.

Parameters
----------
A: Adaptor2d_HCurve2d
Param: float
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Returns
-------
None
") BRepBlend_PointOnRst;
		 BRepBlend_PointOnRst(const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Returns the arc of restriction containing the vertex.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc();

		/****************** ParameterOnArc ******************/
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "Returns the parameter of the point on the arc returned by the method arc().

Returns
-------
float
") ParameterOnArc;
		Standard_Real ParameterOnArc();

		/****************** SetArc ******************/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "Sets the values of a point which is on the arc a, at parameter param.

Parameters
----------
A: Adaptor2d_HCurve2d
Param: float
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Returns
-------
None
") SetArc;
		void SetArc(const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****************** TransitionOnArc ******************/
		%feature("compactdefaultargs") TransitionOnArc;
		%feature("autodoc", "Returns the transition of the point on the arc returned by arc().

Returns
-------
IntSurf_Transition
") TransitionOnArc;
		const IntSurf_Transition & TransitionOnArc();

		/****************** TransitionOnLine ******************/
		%feature("compactdefaultargs") TransitionOnLine;
		%feature("autodoc", "Returns the transition of the point on the line on surface.

Returns
-------
IntSurf_Transition
") TransitionOnLine;
		const IntSurf_Transition & TransitionOnLine();

};


%extend BRepBlend_PointOnRst {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepBlend_RstRstConstRad *
*********************************/
class BRepBlend_RstRstConstRad : public Blend_RstRstFunction {
	public:
		/****************** BRepBlend_RstRstConstRad ******************/
		%feature("compactdefaultargs") BRepBlend_RstRstConstRad;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf1: Adaptor3d_HSurface
Rst1: Adaptor2d_HCurve2d
Surf2: Adaptor3d_HSurface
Rst2: Adaptor2d_HCurve2d
CGuide: Adaptor3d_HCurve

Returns
-------
None
") BRepBlend_RstRstConstRad;
		 BRepBlend_RstRstConstRad(const opencascade::handle<Adaptor3d_HSurface> & Surf1, const opencascade::handle<Adaptor2d_HCurve2d> & Rst1, const opencascade::handle<Adaptor3d_HSurface> & Surf2, const opencascade::handle<Adaptor2d_HCurve2d> & Rst2, const opencascade::handle<Adaptor3d_HCurve> & CGuide);

		/****************** CenterCircleRst1Rst2 ******************/
		%feature("compactdefaultargs") CenterCircleRst1Rst2;
		%feature("autodoc", "Give the center of circle define by ptrst1, ptrst2 and radius ray.

Parameters
----------
PtRst1: gp_Pnt
PtRst2: gp_Pnt
np: gp_Vec
Center: gp_Pnt
VdMed: gp_Vec

Returns
-------
bool
") CenterCircleRst1Rst2;
		Standard_Boolean CenterCircleRst1Rst2(const gp_Pnt & PtRst1, const gp_Pnt & PtRst2, const gp_Vec & np, gp_Pnt & Center, gp_Vec & VdMed);

		/****************** Decroch ******************/
		%feature("compactdefaultargs") Decroch;
		%feature("autodoc", "Permet d ' implementer un critere de decrochage specifique a la fonction.

Parameters
----------
Sol: math_Vector
NRst1: gp_Vec
TgRst1: gp_Vec
NRst2: gp_Vec
TgRst2: gp_Vec

Returns
-------
Blend_DecrochStatus
") Decroch;
		Blend_DecrochStatus Decroch(const math_Vector & Sol, gp_Vec & NRst1, gp_Vec & TgRst1, gp_Vec & NRst2, gp_Vec & TgRst2);

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

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Returns
-------
None
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** ParameterOnRst1 ******************/
		%feature("compactdefaultargs") ParameterOnRst1;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst1;
		Standard_Real ParameterOnRst1();

		/****************** ParameterOnRst2 ******************/
		%feature("compactdefaultargs") ParameterOnRst2;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst2;
		Standard_Real ParameterOnRst2();

		/****************** Pnt2dOnRst1 ******************/
		%feature("compactdefaultargs") Pnt2dOnRst1;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst1;
		const gp_Pnt2d Pnt2dOnRst1();

		/****************** Pnt2dOnRst2 ******************/
		%feature("compactdefaultargs") Pnt2dOnRst2;
		%feature("autodoc", "Returns u,v coordinates of the point on the curve on surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst2;
		const gp_Pnt2d Pnt2dOnRst2();

		/****************** PointOnRst1 ******************/
		%feature("compactdefaultargs") PointOnRst1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnRst1;
		const gp_Pnt PointOnRst1();

		/****************** PointOnRst2 ******************/
		%feature("compactdefaultargs") PointOnRst2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnRst2;
		const gp_Pnt PointOnRst2();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC2d: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
U: float
V: float
C: gp_Circ

Returns
-------
Pdeb: float
Pfin: float
") Section;
		void Section(const Standard_Real Param, const Standard_Real U, const Standard_Real V, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
None
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section the method returns standard_true if the derivatives are computed, otherwise it returns standard_false.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
SurfRef1: Adaptor3d_HSurface
RstRef1: Adaptor2d_HCurve2d
SurfRef2: Adaptor3d_HSurface
RstRef2: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor3d_HSurface> & SurfRef1, const opencascade::handle<Adaptor2d_HCurve2d> & RstRef1, const opencascade::handle<Adaptor3d_HSurface> & SurfRef2, const opencascade::handle<Adaptor2d_HCurve2d> & RstRef2);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the bounds of the parametric interval on the guide line. this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Radius: float
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Real Radius, const Standard_Integer Choix);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the type of section generation for the approximations.

Parameters
----------
TypeSection: BlendFunc_SectionShape

Returns
-------
None
") Set;
		void Set(const BlendFunc_SectionShape TypeSection);

		/****************** Tangent2dOnRst1 ******************/
		%feature("compactdefaultargs") Tangent2dOnRst1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnRst1;
		const gp_Vec2d Tangent2dOnRst1();

		/****************** Tangent2dOnRst2 ******************/
		%feature("compactdefaultargs") Tangent2dOnRst2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnRst2;
		const gp_Vec2d Tangent2dOnRst2();

		/****************** TangentOnRst1 ******************/
		%feature("compactdefaultargs") TangentOnRst1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnRst1;
		const gp_Vec TangentOnRst1();

		/****************** TangentOnRst2 ******************/
		%feature("compactdefaultargs") TangentOnRst2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnRst2;
		const gp_Vec TangentOnRst2();

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


%extend BRepBlend_RstRstConstRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepBlend_RstRstEvolRad *
********************************/
class BRepBlend_RstRstEvolRad : public Blend_RstRstFunction {
	public:
		/****************** BRepBlend_RstRstEvolRad ******************/
		%feature("compactdefaultargs") BRepBlend_RstRstEvolRad;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf1: Adaptor3d_HSurface
Rst1: Adaptor2d_HCurve2d
Surf2: Adaptor3d_HSurface
Rst2: Adaptor2d_HCurve2d
CGuide: Adaptor3d_HCurve
Evol: Law_Function

Returns
-------
None
") BRepBlend_RstRstEvolRad;
		 BRepBlend_RstRstEvolRad(const opencascade::handle<Adaptor3d_HSurface> & Surf1, const opencascade::handle<Adaptor2d_HCurve2d> & Rst1, const opencascade::handle<Adaptor3d_HSurface> & Surf2, const opencascade::handle<Adaptor2d_HCurve2d> & Rst2, const opencascade::handle<Adaptor3d_HCurve> & CGuide, const opencascade::handle<Law_Function> & Evol);

		/****************** CenterCircleRst1Rst2 ******************/
		%feature("compactdefaultargs") CenterCircleRst1Rst2;
		%feature("autodoc", "Gives the center of circle defined by ptrst1, ptrst2 and radius ray.

Parameters
----------
PtRst1: gp_Pnt
PtRst2: gp_Pnt
np: gp_Vec
Center: gp_Pnt
VdMed: gp_Vec

Returns
-------
bool
") CenterCircleRst1Rst2;
		Standard_Boolean CenterCircleRst1Rst2(const gp_Pnt & PtRst1, const gp_Pnt & PtRst2, const gp_Vec & np, gp_Pnt & Center, gp_Vec & VdMed);

		/****************** Decroch ******************/
		%feature("compactdefaultargs") Decroch;
		%feature("autodoc", "Enables implementation of a criterion of decrochage specific to the function.

Parameters
----------
Sol: math_Vector
NRst1: gp_Vec
TgRst1: gp_Vec
NRst2: gp_Vec
TgRst2: gp_Vec

Returns
-------
Blend_DecrochStatus
") Decroch;
		Blend_DecrochStatus Decroch(const math_Vector & Sol, gp_Vec & NRst1, gp_Vec & TgRst1, gp_Vec & NRst2, gp_Vec & TgRst2);

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

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Returns
-------
None
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** ParameterOnRst1 ******************/
		%feature("compactdefaultargs") ParameterOnRst1;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst1;
		Standard_Real ParameterOnRst1();

		/****************** ParameterOnRst2 ******************/
		%feature("compactdefaultargs") ParameterOnRst2;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst2;
		Standard_Real ParameterOnRst2();

		/****************** Pnt2dOnRst1 ******************/
		%feature("compactdefaultargs") Pnt2dOnRst1;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst1;
		const gp_Pnt2d Pnt2dOnRst1();

		/****************** Pnt2dOnRst2 ******************/
		%feature("compactdefaultargs") Pnt2dOnRst2;
		%feature("autodoc", "Returns u,v coordinates of the point on the curve on surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst2;
		const gp_Pnt2d Pnt2dOnRst2();

		/****************** PointOnRst1 ******************/
		%feature("compactdefaultargs") PointOnRst1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnRst1;
		const gp_Pnt PointOnRst1();

		/****************** PointOnRst2 ******************/
		%feature("compactdefaultargs") PointOnRst2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnRst2;
		const gp_Pnt PointOnRst2();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC2d: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
U: float
V: float
C: gp_Circ

Returns
-------
Pdeb: float
Pfin: float
") Section;
		void Section(const Standard_Real Param, const Standard_Real U, const Standard_Real V, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
None
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section the method returns standard_true if the derivatives are computed, otherwise it returns standard_false.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
SurfRef1: Adaptor3d_HSurface
RstRef1: Adaptor2d_HCurve2d
SurfRef2: Adaptor3d_HSurface
RstRef2: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor3d_HSurface> & SurfRef1, const opencascade::handle<Adaptor2d_HCurve2d> & RstRef1, const opencascade::handle<Adaptor3d_HSurface> & SurfRef2, const opencascade::handle<Adaptor2d_HCurve2d> & RstRef2);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the bounds of the parametric interval on the guide line. this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Integer Choix);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the type of section generation for the approximations.

Parameters
----------
TypeSection: BlendFunc_SectionShape

Returns
-------
None
") Set;
		void Set(const BlendFunc_SectionShape TypeSection);

		/****************** Tangent2dOnRst1 ******************/
		%feature("compactdefaultargs") Tangent2dOnRst1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnRst1;
		const gp_Vec2d Tangent2dOnRst1();

		/****************** Tangent2dOnRst2 ******************/
		%feature("compactdefaultargs") Tangent2dOnRst2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnRst2;
		const gp_Vec2d Tangent2dOnRst2();

		/****************** TangentOnRst1 ******************/
		%feature("compactdefaultargs") TangentOnRst1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnRst1;
		const gp_Vec TangentOnRst1();

		/****************** TangentOnRst2 ******************/
		%feature("compactdefaultargs") TangentOnRst2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnRst2;
		const gp_Vec TangentOnRst2();

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


%extend BRepBlend_RstRstEvolRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepBlend_RstRstLineBuilder *
************************************/
class BRepBlend_RstRstLineBuilder {
	public:
		/****************** BRepBlend_RstRstLineBuilder ******************/
		%feature("compactdefaultargs") BRepBlend_RstRstLineBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf1: Adaptor3d_HSurface
Rst1: Adaptor2d_HCurve2d
Domain1: Adaptor3d_TopolTool
Surf2: Adaptor3d_HSurface
Rst2: Adaptor2d_HCurve2d
Domain2: Adaptor3d_TopolTool

Returns
-------
None
") BRepBlend_RstRstLineBuilder;
		 BRepBlend_RstRstLineBuilder(const opencascade::handle<Adaptor3d_HSurface> & Surf1, const opencascade::handle<Adaptor2d_HCurve2d> & Rst1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_HSurface> & Surf2, const opencascade::handle<Adaptor2d_HCurve2d> & Rst2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2);

		/****************** Complete ******************/
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "No available documentation.

Parameters
----------
Func: Blend_RstRstFunction
Finv1: Blend_SurfCurvFuncInv
FinvP1: Blend_CurvPointFuncInv
Finv2: Blend_SurfCurvFuncInv
FinvP2: Blend_CurvPointFuncInv
Pmin: float

Returns
-------
bool
") Complete;
		Standard_Boolean Complete(Blend_RstRstFunction & Func, Blend_SurfCurvFuncInv & Finv1, Blend_CurvPointFuncInv & FinvP1, Blend_SurfCurvFuncInv & Finv2, Blend_CurvPointFuncInv & FinvP2, const Standard_Real Pmin);

		/****************** Decroch1End ******************/
		%feature("compactdefaultargs") Decroch1End;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Decroch1End;
		Standard_Boolean Decroch1End();

		/****************** Decroch1Start ******************/
		%feature("compactdefaultargs") Decroch1Start;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Decroch1Start;
		Standard_Boolean Decroch1Start();

		/****************** Decroch2End ******************/
		%feature("compactdefaultargs") Decroch2End;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Decroch2End;
		Standard_Boolean Decroch2End();

		/****************** Decroch2Start ******************/
		%feature("compactdefaultargs") Decroch2Start;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Decroch2Start;
		Standard_Boolean Decroch2Start();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<BRepBlend_Line>
") Line;
		const opencascade::handle<BRepBlend_Line> & Line();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Func: Blend_RstRstFunction
Finv1: Blend_SurfCurvFuncInv
FinvP1: Blend_CurvPointFuncInv
Finv2: Blend_SurfCurvFuncInv
FinvP2: Blend_CurvPointFuncInv
Pdep: float
Pmax: float
MaxStep: float
TolGuide: float
Soldep: math_Vector
Tolesp: float
Fleche: float
Appro: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(Blend_RstRstFunction & Func, Blend_SurfCurvFuncInv & Finv1, Blend_CurvPointFuncInv & FinvP1, Blend_SurfCurvFuncInv & Finv2, Blend_CurvPointFuncInv & FinvP2, const Standard_Real Pdep, const Standard_Real Pmax, const Standard_Real MaxStep, const Standard_Real TolGuide, const math_Vector & Soldep, const Standard_Real Tolesp, const Standard_Real Fleche, const Standard_Boolean Appro = Standard_False);

		/****************** PerformFirstSection ******************/
		%feature("compactdefaultargs") PerformFirstSection;
		%feature("autodoc", "No available documentation.

Parameters
----------
Func: Blend_RstRstFunction
Finv1: Blend_SurfCurvFuncInv
FinvP1: Blend_CurvPointFuncInv
Finv2: Blend_SurfCurvFuncInv
FinvP2: Blend_CurvPointFuncInv
Pdep: float
Pmax: float
Soldep: math_Vector
Tolesp: float
TolGuide: float
RecRst1: bool
RecP1: bool
RecRst2: bool
RecP2: bool
ParSol: math_Vector

Returns
-------
Psol: float
") PerformFirstSection;
		Standard_Boolean PerformFirstSection(Blend_RstRstFunction & Func, Blend_SurfCurvFuncInv & Finv1, Blend_CurvPointFuncInv & FinvP1, Blend_SurfCurvFuncInv & Finv2, Blend_CurvPointFuncInv & FinvP2, const Standard_Real Pdep, const Standard_Real Pmax, const math_Vector & Soldep, const Standard_Real Tolesp, const Standard_Real TolGuide, const Standard_Boolean RecRst1, const Standard_Boolean RecP1, const Standard_Boolean RecRst2, const Standard_Boolean RecP2, Standard_Real &OutValue, math_Vector & ParSol);

};


%extend BRepBlend_RstRstLineBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepBlend_SurfCurvConstRadInv *
**************************************/
class BRepBlend_SurfCurvConstRadInv : public Blend_SurfCurvFuncInv {
	public:
		/****************** BRepBlend_SurfCurvConstRadInv ******************/
		%feature("compactdefaultargs") BRepBlend_SurfCurvConstRadInv;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
C: Adaptor3d_HCurve
Cg: Adaptor3d_HCurve

Returns
-------
None
") BRepBlend_SurfCurvConstRadInv;
		 BRepBlend_SurfCurvConstRadInv(const opencascade::handle<Adaptor3d_HSurface> & S, const opencascade::handle<Adaptor3d_HCurve> & C, const opencascade::handle<Adaptor3d_HCurve> & Cg);

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

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "Returns in the vector infbound the lowest values allowed for each of the 3 variables. returns in the vector supbound the greatest values allowed for each of the 3 variables.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns in the vector tolerance the parametric tolerance for each of the 3 variables; tol is the tolerance used in 3d space.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
R: float
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Real R, const Standard_Integer Choix);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set the restriction on which a solution has to be found.

Parameters
----------
Rst: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor2d_HCurve2d> & Rst);

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


%extend BRepBlend_SurfCurvConstRadInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepBlend_SurfCurvEvolRadInv *
*************************************/
class BRepBlend_SurfCurvEvolRadInv : public Blend_SurfCurvFuncInv {
	public:
		/****************** BRepBlend_SurfCurvEvolRadInv ******************/
		%feature("compactdefaultargs") BRepBlend_SurfCurvEvolRadInv;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
C: Adaptor3d_HCurve
Cg: Adaptor3d_HCurve
Evol: Law_Function

Returns
-------
None
") BRepBlend_SurfCurvEvolRadInv;
		 BRepBlend_SurfCurvEvolRadInv(const opencascade::handle<Adaptor3d_HSurface> & S, const opencascade::handle<Adaptor3d_HCurve> & C, const opencascade::handle<Adaptor3d_HCurve> & Cg, const opencascade::handle<Law_Function> & Evol);

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

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "Returns in the vector infbound the lowest values allowed for each of the 3 variables. returns in the vector supbound the greatest values allowed for each of the 3 variables.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns in the vector tolerance the parametric tolerance for each of the 3 variables; tol is the tolerance used in 3d space.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Integer Choix);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set the restriction on which a solution has to be found.

Parameters
----------
Rst: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor2d_HCurve2d> & Rst);

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


%extend BRepBlend_SurfCurvEvolRadInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BRepBlend_SurfPointConstRadInv *
***************************************/
class BRepBlend_SurfPointConstRadInv : public Blend_SurfPointFuncInv {
	public:
		/****************** BRepBlend_SurfPointConstRadInv ******************/
		%feature("compactdefaultargs") BRepBlend_SurfPointConstRadInv;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
C: Adaptor3d_HCurve

Returns
-------
None
") BRepBlend_SurfPointConstRadInv;
		 BRepBlend_SurfPointConstRadInv(const opencascade::handle<Adaptor3d_HSurface> & S, const opencascade::handle<Adaptor3d_HCurve> & C);

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

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "Returns in the vector infbound the lowest values allowed for each of the 3 variables. returns in the vector supbound the greatest values allowed for each of the 3 variables.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns in the vector tolerance the parametric tolerance for each of the 3 variables; tol is the tolerance used in 3d space.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
R: float
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Real R, const Standard_Integer Choix);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set the point on which a solution has to be found.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Set;
		void Set(const gp_Pnt & P);

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


%extend BRepBlend_SurfPointConstRadInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BRepBlend_SurfPointEvolRadInv *
**************************************/
class BRepBlend_SurfPointEvolRadInv : public Blend_SurfPointFuncInv {
	public:
		/****************** BRepBlend_SurfPointEvolRadInv ******************/
		%feature("compactdefaultargs") BRepBlend_SurfPointEvolRadInv;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
C: Adaptor3d_HCurve
Evol: Law_Function

Returns
-------
None
") BRepBlend_SurfPointEvolRadInv;
		 BRepBlend_SurfPointEvolRadInv(const opencascade::handle<Adaptor3d_HSurface> & S, const opencascade::handle<Adaptor3d_HCurve> & C, const opencascade::handle<Law_Function> & Evol);

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

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "Returns in the vector infbound the lowest values allowed for each of the 3 variables. returns in the vector supbound the greatest values allowed for each of the 3 variables.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns in the vector tolerance the parametric tolerance for each of the 3 variables; tol is the tolerance used in 3d space.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Integer Choix);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set the point on which a solution has to be found.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Set;
		void Set(const gp_Pnt & P);

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


%extend BRepBlend_SurfPointEvolRadInv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepBlend_SurfRstConstRad *
**********************************/
class BRepBlend_SurfRstConstRad : public Blend_SurfRstFunction {
	public:
		/****************** BRepBlend_SurfRstConstRad ******************/
		%feature("compactdefaultargs") BRepBlend_SurfRstConstRad;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf: Adaptor3d_HSurface
SurfRst: Adaptor3d_HSurface
Rst: Adaptor2d_HCurve2d
CGuide: Adaptor3d_HCurve

Returns
-------
None
") BRepBlend_SurfRstConstRad;
		 BRepBlend_SurfRstConstRad(const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_HSurface> & SurfRst, const opencascade::handle<Adaptor2d_HCurve2d> & Rst, const opencascade::handle<Adaptor3d_HCurve> & CGuide);

		/****************** Decroch ******************/
		%feature("compactdefaultargs") Decroch;
		%feature("autodoc", "Enables implementation of a criterion of decrochage specific to the function. warning: can be called without previous call of issolution but the values calculated can be senseless.

Parameters
----------
Sol: math_Vector
NS: gp_Vec
TgS: gp_Vec

Returns
-------
bool
") Decroch;
		Standard_Boolean Decroch(const math_Vector & Sol, gp_Vec & NS, gp_Vec & TgS);

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

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Returns
-------
None
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** ParameterOnRst ******************/
		%feature("compactdefaultargs") ParameterOnRst;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst;
		Standard_Real ParameterOnRst();

		/****************** Pnt2dOnRst ******************/
		%feature("compactdefaultargs") Pnt2dOnRst;
		%feature("autodoc", "Returns u,v coordinates of the point on the curve on surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst;
		const gp_Pnt2d Pnt2dOnRst();

		/****************** Pnt2dOnS ******************/
		%feature("compactdefaultargs") Pnt2dOnS;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnS;
		const gp_Pnt2d Pnt2dOnS();

		/****************** PointOnRst ******************/
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnRst;
		const gp_Pnt PointOnRst();

		/****************** PointOnS ******************/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS;
		const gp_Pnt PointOnS();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC2d: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
U: float
V: float
W: float
C: gp_Circ

Returns
-------
Pdeb: float
Pfin: float
") Section;
		void Section(const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section the method returns standard_true if the derivatives are computed, otherwise it returns standard_false.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
None
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
SurfRef: Adaptor3d_HSurface
RstRef: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor3d_HSurface> & SurfRef, const opencascade::handle<Adaptor2d_HCurve2d> & RstRef);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the bounds of the parametric interval on the guide line. this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Radius: float
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Real Radius, const Standard_Integer Choix);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the type of section generation for the approximations.

Parameters
----------
TypeSection: BlendFunc_SectionShape

Returns
-------
None
") Set;
		void Set(const BlendFunc_SectionShape TypeSection);

		/****************** Tangent2dOnRst ******************/
		%feature("compactdefaultargs") Tangent2dOnRst;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnRst;
		const gp_Vec2d Tangent2dOnRst();

		/****************** Tangent2dOnS ******************/
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS;
		const gp_Vec2d Tangent2dOnS();

		/****************** TangentOnRst ******************/
		%feature("compactdefaultargs") TangentOnRst;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnRst;
		const gp_Vec TangentOnRst();

		/****************** TangentOnS ******************/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS;
		const gp_Vec TangentOnS();

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


%extend BRepBlend_SurfRstConstRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepBlend_SurfRstEvolRad *
*********************************/
class BRepBlend_SurfRstEvolRad : public Blend_SurfRstFunction {
	public:
		/****************** BRepBlend_SurfRstEvolRad ******************/
		%feature("compactdefaultargs") BRepBlend_SurfRstEvolRad;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf: Adaptor3d_HSurface
SurfRst: Adaptor3d_HSurface
Rst: Adaptor2d_HCurve2d
CGuide: Adaptor3d_HCurve
Evol: Law_Function

Returns
-------
None
") BRepBlend_SurfRstEvolRad;
		 BRepBlend_SurfRstEvolRad(const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_HSurface> & SurfRst, const opencascade::handle<Adaptor2d_HCurve2d> & Rst, const opencascade::handle<Adaptor3d_HCurve> & CGuide, const opencascade::handle<Law_Function> & Evol);

		/****************** Decroch ******************/
		%feature("compactdefaultargs") Decroch;
		%feature("autodoc", "Permet d ' implementer un critere de decrochage specifique a la fonction.

Parameters
----------
Sol: math_Vector
NS: gp_Vec
TgS: gp_Vec

Returns
-------
bool
") Decroch;
		Standard_Boolean Decroch(const math_Vector & Sol, gp_Vec & NS, gp_Vec & TgS);

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

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Returns
-------
None
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: math_Vector
Tol: float

Returns
-------
None
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Returns
-------
None
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Tol: float

Returns
-------
bool
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** ParameterOnRst ******************/
		%feature("compactdefaultargs") ParameterOnRst;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst;
		Standard_Real ParameterOnRst();

		/****************** Pnt2dOnRst ******************/
		%feature("compactdefaultargs") Pnt2dOnRst;
		%feature("autodoc", "Returns u,v coordinates of the point on the curve on surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst;
		const gp_Pnt2d Pnt2dOnRst();

		/****************** Pnt2dOnS ******************/
		%feature("compactdefaultargs") Pnt2dOnS;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnS;
		const gp_Pnt2d Pnt2dOnS();

		/****************** PointOnRst ******************/
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnRst;
		const gp_Pnt PointOnRst();

		/****************** PointOnS ******************/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS;
		const gp_Pnt PointOnS();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC2d: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
U: float
V: float
W: float
C: gp_Circ

Returns
-------
Pdeb: float
Pfin: float
") Section;
		void Section(const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section the method returns standard_true if the derivatives are computed, otherwise it returns standard_false.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
None
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
SurfRef: Adaptor3d_HSurface
RstRef: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor3d_HSurface> & SurfRef, const opencascade::handle<Adaptor2d_HCurve2d> & RstRef);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the bounds of the parametric interval on the guide line. this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Choix: int

Returns
-------
None
") Set;
		void Set(const Standard_Integer Choix);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the type of section generation for the approximations.

Parameters
----------
TypeSection: BlendFunc_SectionShape

Returns
-------
None
") Set;
		void Set(const BlendFunc_SectionShape TypeSection);

		/****************** Tangent2dOnRst ******************/
		%feature("compactdefaultargs") Tangent2dOnRst;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnRst;
		const gp_Vec2d Tangent2dOnRst();

		/****************** Tangent2dOnS ******************/
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS;
		const gp_Vec2d Tangent2dOnS();

		/****************** TangentOnRst ******************/
		%feature("compactdefaultargs") TangentOnRst;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnRst;
		const gp_Vec TangentOnRst();

		/****************** TangentOnS ******************/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS;
		const gp_Vec TangentOnS();

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


%extend BRepBlend_SurfRstEvolRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepBlend_SurfRstLineBuilder *
*************************************/
class BRepBlend_SurfRstLineBuilder {
	public:
		/****************** BRepBlend_SurfRstLineBuilder ******************/
		%feature("compactdefaultargs") BRepBlend_SurfRstLineBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf1: Adaptor3d_HSurface
Domain1: Adaptor3d_TopolTool
Surf2: Adaptor3d_HSurface
Rst: Adaptor2d_HCurve2d
Domain2: Adaptor3d_TopolTool

Returns
-------
None
") BRepBlend_SurfRstLineBuilder;
		 BRepBlend_SurfRstLineBuilder(const opencascade::handle<Adaptor3d_HSurface> & Surf1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_HSurface> & Surf2, const opencascade::handle<Adaptor2d_HCurve2d> & Rst, const opencascade::handle<Adaptor3d_TopolTool> & Domain2);

		/****************** ArcToRecadre ******************/
		%feature("compactdefaultargs") ArcToRecadre;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
PrevIndex: int
pt2d: gp_Pnt2d
lastpt2d: gp_Pnt2d

Returns
-------
ponarc: float
") ArcToRecadre;
		Standard_Integer ArcToRecadre(const math_Vector & Sol, const Standard_Integer PrevIndex, gp_Pnt2d & pt2d, gp_Pnt2d & lastpt2d, Standard_Real &OutValue);

		/****************** Complete ******************/
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "No available documentation.

Parameters
----------
Func: Blend_SurfRstFunction
Finv: Blend_FuncInv
FinvP: Blend_SurfPointFuncInv
FinvC: Blend_SurfCurvFuncInv
Pmin: float

Returns
-------
bool
") Complete;
		Standard_Boolean Complete(Blend_SurfRstFunction & Func, Blend_FuncInv & Finv, Blend_SurfPointFuncInv & FinvP, Blend_SurfCurvFuncInv & FinvC, const Standard_Real Pmin);

		/****************** DecrochEnd ******************/
		%feature("compactdefaultargs") DecrochEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") DecrochEnd;
		Standard_Boolean DecrochEnd();

		/****************** DecrochStart ******************/
		%feature("compactdefaultargs") DecrochStart;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") DecrochStart;
		Standard_Boolean DecrochStart();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<BRepBlend_Line>
") Line;
		const opencascade::handle<BRepBlend_Line> & Line();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Func: Blend_SurfRstFunction
Finv: Blend_FuncInv
FinvP: Blend_SurfPointFuncInv
FinvC: Blend_SurfCurvFuncInv
Pdep: float
Pmax: float
MaxStep: float
TolGuide: float
Soldep: math_Vector
Tolesp: float
Fleche: float
Appro: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(Blend_SurfRstFunction & Func, Blend_FuncInv & Finv, Blend_SurfPointFuncInv & FinvP, Blend_SurfCurvFuncInv & FinvC, const Standard_Real Pdep, const Standard_Real Pmax, const Standard_Real MaxStep, const Standard_Real TolGuide, const math_Vector & Soldep, const Standard_Real Tolesp, const Standard_Real Fleche, const Standard_Boolean Appro = Standard_False);

		/****************** PerformFirstSection ******************/
		%feature("compactdefaultargs") PerformFirstSection;
		%feature("autodoc", "No available documentation.

Parameters
----------
Func: Blend_SurfRstFunction
Finv: Blend_FuncInv
FinvP: Blend_SurfPointFuncInv
FinvC: Blend_SurfCurvFuncInv
Pdep: float
Pmax: float
Soldep: math_Vector
Tolesp: float
TolGuide: float
RecRst: bool
RecP: bool
RecS: bool
ParSol: math_Vector

Returns
-------
Psol: float
") PerformFirstSection;
		Standard_Boolean PerformFirstSection(Blend_SurfRstFunction & Func, Blend_FuncInv & Finv, Blend_SurfPointFuncInv & FinvP, Blend_SurfCurvFuncInv & FinvC, const Standard_Real Pdep, const Standard_Real Pmax, const math_Vector & Soldep, const Standard_Real Tolesp, const Standard_Real TolGuide, const Standard_Boolean RecRst, const Standard_Boolean RecP, const Standard_Boolean RecS, Standard_Real &OutValue, math_Vector & ParSol);

};


%extend BRepBlend_SurfRstLineBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepBlend_Walking *
**************************/
class BRepBlend_Walking {
	public:
		/****************** BRepBlend_Walking ******************/
		%feature("compactdefaultargs") BRepBlend_Walking;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf1: Adaptor3d_HSurface
Surf2: Adaptor3d_HSurface
Domain1: Adaptor3d_TopolTool
Domain2: Adaptor3d_TopolTool
HGuide: ChFiDS_HElSpine

Returns
-------
None
") BRepBlend_Walking;
		 BRepBlend_Walking(const opencascade::handle<Adaptor3d_HSurface> & Surf1, const opencascade::handle<Adaptor3d_HSurface> & Surf2, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const opencascade::handle<ChFiDS_HElSpine> & HGuide);

		/****************** AddSingularPoint ******************/
		%feature("compactdefaultargs") AddSingularPoint;
		%feature("autodoc", "To define singular points computed before walking.

Parameters
----------
P: Blend_Point

Returns
-------
None
") AddSingularPoint;
		void AddSingularPoint(const Blend_Point & P);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: bool

Returns
-------
None
") Check;
		void Check(const Standard_Boolean C);

		/****************** Check2d ******************/
		%feature("compactdefaultargs") Check2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: bool

Returns
-------
None
") Check2d;
		void Check2d(const Standard_Boolean C);

		/****************** ClassificationOnS1 ******************/
		%feature("compactdefaultargs") ClassificationOnS1;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: bool

Returns
-------
None
") ClassificationOnS1;
		void ClassificationOnS1(const Standard_Boolean C);

		/****************** ClassificationOnS2 ******************/
		%feature("compactdefaultargs") ClassificationOnS2;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: bool

Returns
-------
None
") ClassificationOnS2;
		void ClassificationOnS2(const Standard_Boolean C);

		/****************** Complete ******************/
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Blend_Function
FInv: Blend_FuncInv
Pmin: float

Returns
-------
bool
") Complete;
		Standard_Boolean Complete(Blend_Function & F, Blend_FuncInv & FInv, const Standard_Real Pmin);

		/****************** Continu ******************/
		%feature("compactdefaultargs") Continu;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Blend_Function
FInv: Blend_FuncInv
P: float

Returns
-------
bool
") Continu;
		Standard_Boolean Continu(Blend_Function & F, Blend_FuncInv & FInv, const Standard_Real P);

		/****************** Continu ******************/
		%feature("compactdefaultargs") Continu;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Blend_Function
FInv: Blend_FuncInv
P: float
OnS1: bool

Returns
-------
bool
") Continu;
		Standard_Boolean Continu(Blend_Function & F, Blend_FuncInv & FInv, const Standard_Real P, const Standard_Boolean OnS1);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<BRepBlend_Line>
") Line;
		const opencascade::handle<BRepBlend_Line> & Line();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Blend_Function
FInv: Blend_FuncInv
Pdep: float
Pmax: float
MaxStep: float
TolGuide: float
Soldep: math_Vector
Tolesp: float
Fleche: float
Appro: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(Blend_Function & F, Blend_FuncInv & FInv, const Standard_Real Pdep, const Standard_Real Pmax, const Standard_Real MaxStep, const Standard_Real TolGuide, const math_Vector & Soldep, const Standard_Real Tolesp, const Standard_Real Fleche, const Standard_Boolean Appro = Standard_False);

		/****************** PerformFirstSection ******************/
		%feature("compactdefaultargs") PerformFirstSection;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Blend_Function
Pdep: float
ParDep: math_Vector
Tolesp: float
TolGuide: float
Pos1: TopAbs_State
Pos2: TopAbs_State

Returns
-------
bool
") PerformFirstSection;
		Standard_Boolean PerformFirstSection(Blend_Function & F, const Standard_Real Pdep, math_Vector & ParDep, const Standard_Real Tolesp, const Standard_Real TolGuide, TopAbs_State & Pos1, TopAbs_State & Pos2);

		/****************** PerformFirstSection ******************/
		%feature("compactdefaultargs") PerformFirstSection;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Blend_Function
FInv: Blend_FuncInv
Pdep: float
Pmax: float
ParDep: math_Vector
Tolesp: float
TolGuide: float
RecOnS1: bool
RecOnS2: bool
ParSol: math_Vector

Returns
-------
Psol: float
") PerformFirstSection;
		Standard_Boolean PerformFirstSection(Blend_Function & F, Blend_FuncInv & FInv, const Standard_Real Pdep, const Standard_Real Pmax, const math_Vector & ParDep, const Standard_Real Tolesp, const Standard_Real TolGuide, const Standard_Boolean RecOnS1, const Standard_Boolean RecOnS2, Standard_Real &OutValue, math_Vector & ParSol);

		/****************** SetDomainsToRecadre ******************/
		%feature("compactdefaultargs") SetDomainsToRecadre;
		%feature("autodoc", "To define different domains for control and clipping.

Parameters
----------
RecDomain1: Adaptor3d_TopolTool
RecDomain2: Adaptor3d_TopolTool

Returns
-------
None
") SetDomainsToRecadre;
		void SetDomainsToRecadre(const opencascade::handle<Adaptor3d_TopolTool> & RecDomain1, const opencascade::handle<Adaptor3d_TopolTool> & RecDomain2);

		/****************** TwistOnS1 ******************/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS1;
		Standard_Boolean TwistOnS1();

		/****************** TwistOnS2 ******************/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS2;
		Standard_Boolean TwistOnS2();

};


%extend BRepBlend_Walking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepBlend_AppFunc *
**************************/
class BRepBlend_AppFunc : public BRepBlend_AppFuncRoot {
	public:
		/****************** BRepBlend_AppFunc ******************/
		%feature("compactdefaultargs") BRepBlend_AppFunc;
		%feature("autodoc", "No available documentation.

Parameters
----------
Line: BRepBlend_Line
Func: Blend_Function
Tol3d: float
Tol2d: float

Returns
-------
None
") BRepBlend_AppFunc;
		 BRepBlend_AppFunc(opencascade::handle<BRepBlend_Line> & Line, Blend_Function & Func, const Standard_Real Tol3d, const Standard_Real Tol2d);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
Func: Blend_AppFunction
Param: float
Sol: math_Vector
Pnt: Blend_Point

Returns
-------
None
") Point;
		void Point(const Blend_AppFunction & Func, const Standard_Real Param, const math_Vector & Sol, Blend_Point & Pnt);

		/****************** Vec ******************/
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Pnt: Blend_Point

Returns
-------
None
") Vec;
		void Vec(math_Vector & Sol, const Blend_Point & Pnt);

};


%make_alias(BRepBlend_AppFunc)

%extend BRepBlend_AppFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepBlend_AppFuncRst *
*****************************/
class BRepBlend_AppFuncRst : public BRepBlend_AppFuncRoot {
	public:
		/****************** BRepBlend_AppFuncRst ******************/
		%feature("compactdefaultargs") BRepBlend_AppFuncRst;
		%feature("autodoc", "No available documentation.

Parameters
----------
Line: BRepBlend_Line
Func: Blend_SurfRstFunction
Tol3d: float
Tol2d: float

Returns
-------
None
") BRepBlend_AppFuncRst;
		 BRepBlend_AppFuncRst(opencascade::handle<BRepBlend_Line> & Line, Blend_SurfRstFunction & Func, const Standard_Real Tol3d, const Standard_Real Tol2d);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
Func: Blend_AppFunction
Param: float
Sol: math_Vector
Pnt: Blend_Point

Returns
-------
None
") Point;
		void Point(const Blend_AppFunction & Func, const Standard_Real Param, const math_Vector & Sol, Blend_Point & Pnt);

		/****************** Vec ******************/
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Pnt: Blend_Point

Returns
-------
None
") Vec;
		void Vec(math_Vector & Sol, const Blend_Point & Pnt);

};


%make_alias(BRepBlend_AppFuncRst)

%extend BRepBlend_AppFuncRst {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepBlend_AppFuncRstRst *
********************************/
class BRepBlend_AppFuncRstRst : public BRepBlend_AppFuncRoot {
	public:
		/****************** BRepBlend_AppFuncRstRst ******************/
		%feature("compactdefaultargs") BRepBlend_AppFuncRstRst;
		%feature("autodoc", "No available documentation.

Parameters
----------
Line: BRepBlend_Line
Func: Blend_RstRstFunction
Tol3d: float
Tol2d: float

Returns
-------
None
") BRepBlend_AppFuncRstRst;
		 BRepBlend_AppFuncRstRst(opencascade::handle<BRepBlend_Line> & Line, Blend_RstRstFunction & Func, const Standard_Real Tol3d, const Standard_Real Tol2d);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
Func: Blend_AppFunction
Param: float
Sol: math_Vector
Pnt: Blend_Point

Returns
-------
None
") Point;
		void Point(const Blend_AppFunction & Func, const Standard_Real Param, const math_Vector & Sol, Blend_Point & Pnt);

		/****************** Vec ******************/
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sol: math_Vector
Pnt: Blend_Point

Returns
-------
None
") Vec;
		void Vec(math_Vector & Sol, const Blend_Point & Pnt);

};


%make_alias(BRepBlend_AppFuncRstRst)

%extend BRepBlend_AppFuncRstRst {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
