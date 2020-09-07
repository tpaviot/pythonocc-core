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

%extend NCollection_Sequence<opencascade::handle<BRepBlend_Line>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(BRepBlend_SequenceOfPointOnRst) NCollection_Sequence<BRepBlend_PointOnRst>;

%extend NCollection_Sequence<BRepBlend_PointOnRst> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/**** md5 signature: a691940df52b45c198f3414d0790e091 ****/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Get the barycentre of surface. an very poor estimation is sufficent. this information is usefull to perform well conditionned rational approximation.

Returns
-------
gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****************** D0 ******************/
		/**** md5 signature: 6e91f38f7b850db44626fcacae37aa41 ****/
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
		/**** md5 signature: 2393309f0bc419006f62cbad28865129 ****/
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
		/**** md5 signature: 4cdf4be928174877f3da59b3bf48c192 ****/
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
		/**** md5 signature: 36fb20110448cba55b750bc7db93d222 ****/
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
		/**** md5 signature: 3f6ec4398981d416a51435f14d7cee22 ****/
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
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: 2a6f0ec7e4a129780b654d163e7e3b1c ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal or not.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** Knots ******************/
		/**** md5 signature: 25dbe24e24c953c2c68b0d008e63e5d6 ****/
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
		/**** md5 signature: b8f0d759fcd21b95d400b3aae3c12cfc ****/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Returns the length of the maximum section. this information is usefull to perform well conditionned rational approximation.

Returns
-------
float
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****************** Mults ******************/
		/**** md5 signature: 033dc1fab9e10e705c796ffc1e03a44d ****/
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
		/**** md5 signature: a7d69b59dcf4f7a28533481bfba32ffb ****/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Get the number of 2d curves to approximate.

Returns
-------
int
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves();

		/****************** NbIntervals ******************/
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: afc5d5ba96bac3b7421329782521d7aa ****/
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
		/**** md5 signature: ed5d1e3e2211bf035576b0c56d934522 ****/
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
		/**** md5 signature: 4b057291e9e338f8d299ce252e7fb36b ****/
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
		/**** md5 signature: 09d00fda8057705f50d4a0bf656696ed ****/
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
		/**** md5 signature: bf0b5b1b4d35ebad7b1b81b0b9b8ba2c ****/
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
		/**** md5 signature: 8e423ef956801f23a2aa4f8ca11e9907 ****/
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
		/**** md5 signature: 3d853e22ecc3f684cf3f625ffa444684 ****/
		%feature("compactdefaultargs") BRepBlend_AppSurf;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepBlend_AppSurf;
		 BRepBlend_AppSurf();

		/****************** BRepBlend_AppSurf ******************/
		/**** md5 signature: f90d822c69ef6411865bdcb2388b117c ****/
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
		/**** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity used in the approximation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** CriteriumWeight ******************/
		/**** md5 signature: 4b68323f3c03d233f69e27404a58a42c ****/
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
		/**** md5 signature: 45f5fb41b7daba7a20d1fb56ead05f0f ****/
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
		/**** md5 signature: 8df321abd16a4651f96229eab1c5f048 ****/
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
		/**** md5 signature: 85ba31033da623d05ad75c9b051842b3 ****/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Curves2dDegree;
		Standard_Integer Curves2dDegree();

		/****************** Curves2dKnots ******************/
		/**** md5 signature: cd12725d88c425f3fe1ebccf9467256f ****/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots();

		/****************** Curves2dMults ******************/
		/**** md5 signature: d4f1ca5a39a589bb289460010c5bbf39 ****/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults();

		/****************** Curves2dShape ******************/
		/**** md5 signature: 28bf2faa4b8e811f12223cb99d1721ea ****/
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
		/**** md5 signature: 44a81349dbd1c40eccbaf3f763903054 ****/
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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbCurves2d ******************/
		/**** md5 signature: 91ae967daa54efe7d38afad4a5698e5b ****/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****************** ParType ******************/
		/**** md5 signature: 97fa11d31bc8075ba4a84bf8b926a855 ****/
		%feature("compactdefaultargs") ParType;
		%feature("autodoc", "Returns the type of parametrization used in the approximation.

Returns
-------
Approx_ParametrizationType
") ParType;
		Approx_ParametrizationType ParType();

		/****************** Perform ******************/
		/**** md5 signature: a9a9e9c5bf9d1337764cca2e172749d2 ****/
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
		/**** md5 signature: 7a55171e878a876862465555307e6bd3 ****/
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
		/**** md5 signature: 7cb77d9dda0f081d8efd1da8d7d4b09d ****/
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
		/**** md5 signature: 41a91b0ea6e9b248a1b48c05882f4281 ****/
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
		/**** md5 signature: f8c7045bd0e7f781a0984d023e8b1268 ****/
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
		/**** md5 signature: ff343d7833ad3cc796439eb5cefa88ba ****/
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
		/**** md5 signature: 33be5d08621b237fcd73b5b9accd2338 ****/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles();

		/****************** SurfShape ******************/
		/**** md5 signature: 6dbc9c018a92aabb9f9d1988ac20cb43 ****/
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
		/**** md5 signature: 30cf4dd9deaf04a1c77052e14ae7392b ****/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots();

		/****************** SurfUMults ******************/
		/**** md5 signature: ef046447df8e4b2931da90e1475e731f ****/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults();

		/****************** SurfVKnots ******************/
		/**** md5 signature: 52c9dafc43c5e3713c77d7aa4381da5c ****/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots();

		/****************** SurfVMults ******************/
		/**** md5 signature: 589e6536c77c512e7a37f99faf0fa21c ****/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults();

		/****************** SurfWeights ******************/
		/**** md5 signature: 894d2a3f2c33f7d641aef9c7f9e3fa57 ****/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights();

		/****************** Surface ******************/
		/**** md5 signature: 49bb9dd6da49966f0010e14dd0ffef04 ****/
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
		/**** md5 signature: f21f0f877b35cf67581fa59260f72857 ****/
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
		/**** md5 signature: c8d3e7f26c4ee8a50f4eca5274d79e63 ****/
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
		/**** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ****/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** VDegree ******************/
		/**** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ****/
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
		/**** md5 signature: 4c9fa38ef52401b9399050fa7e75f465 ****/
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
		/**** md5 signature: 45f5fb41b7daba7a20d1fb56ead05f0f ****/
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
		/**** md5 signature: 8df321abd16a4651f96229eab1c5f048 ****/
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
		/**** md5 signature: 85ba31033da623d05ad75c9b051842b3 ****/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Curves2dDegree;
		Standard_Integer Curves2dDegree();

		/****************** Curves2dKnots ******************/
		/**** md5 signature: cd12725d88c425f3fe1ebccf9467256f ****/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots();

		/****************** Curves2dMults ******************/
		/**** md5 signature: d4f1ca5a39a589bb289460010c5bbf39 ****/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults();

		/****************** Curves2dShape ******************/
		/**** md5 signature: 28bf2faa4b8e811f12223cb99d1721ea ****/
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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Max2dError ******************/
		/**** md5 signature: bb3f56b4b55e0d91b8620b3ad4fad758 ****/
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
		/**** md5 signature: e42290da593c42adaac24f68c51ecbda ****/
		%feature("compactdefaultargs") MaxErrorOnSurf;
		%feature("autodoc", "Returns the maximum error in the suface approximation.

Returns
-------
float
") MaxErrorOnSurf;
		Standard_Real MaxErrorOnSurf();

		/****************** NbCurves2d ******************/
		/**** md5 signature: 91ae967daa54efe7d38afad4a5698e5b ****/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****************** SurfPoles ******************/
		/**** md5 signature: 33be5d08621b237fcd73b5b9accd2338 ****/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles();

		/****************** SurfShape ******************/
		/**** md5 signature: 6dbc9c018a92aabb9f9d1988ac20cb43 ****/
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
		/**** md5 signature: 30cf4dd9deaf04a1c77052e14ae7392b ****/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots();

		/****************** SurfUMults ******************/
		/**** md5 signature: ef046447df8e4b2931da90e1475e731f ****/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults();

		/****************** SurfVKnots ******************/
		/**** md5 signature: 52c9dafc43c5e3713c77d7aa4381da5c ****/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots();

		/****************** SurfVMults ******************/
		/**** md5 signature: 589e6536c77c512e7a37f99faf0fa21c ****/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults();

		/****************** SurfWeights ******************/
		/**** md5 signature: 894d2a3f2c33f7d641aef9c7f9e3fa57 ****/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights();

		/****************** Surface ******************/
		/**** md5 signature: 49bb9dd6da49966f0010e14dd0ffef04 ****/
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
		/**** md5 signature: f21f0f877b35cf67581fa59260f72857 ****/
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
		/**** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ****/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** VDegree ******************/
		/**** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ****/
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
		/**** md5 signature: e134d88e0a8d54d9b285cd0fdf218776 ****/
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
		/**** md5 signature: 8a1bdd17921ba51464cb2900597d7f15 ****/
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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		/**** md5 signature: 9bbdb2164431d955d7a3a08a37fd239f ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<BRepBlend_Line>
") Line;
		const opencascade::handle<BRepBlend_Line> & Line();

		/****************** Perform ******************/
		/**** md5 signature: a361649c1733aab22de8bce76b7d94ae ****/
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
		/**** md5 signature: e46ba43122269d3ee289beea00e78af7 ****/
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

		/****************** GetBounds ******************/
		/**** md5 signature: 73d101c74e718085b2fc8de28383bce3 ****/
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
		/**** md5 signature: 463e2084f8f6e4a4f87c36de6e9fd9c6 ****/
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
		/**** md5 signature: 0884df902635922234b529dc88a260b5 ****/
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
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		/**** md5 signature: d73c9c4058c0955fc8cd59888660f750 ****/
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
		/**** md5 signature: db883cf63ff497749765a1588d5f0509 ****/
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
		/**** md5 signature: 2f152b6238552d4eda1d4eae96bb18d4 ****/
		%feature("compactdefaultargs") BRepBlend_Extremity;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepBlend_Extremity;
		 BRepBlend_Extremity();

		/****************** BRepBlend_Extremity ******************/
		/**** md5 signature: ee5708baa54062a6870f496f8287be89 ****/
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
		/**** md5 signature: f530cc4b46ea55af8e69fe6333e2fe76 ****/
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
		/**** md5 signature: ede94a8bfb71acf447a0bfd63c98b8eb ****/
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
		/**** md5 signature: 76f766390f6d0b768f744948ab0c4ddb ****/
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
		/**** md5 signature: 8ce1fe7a81869f6f1baf5bc37a4f78bd ****/
		%feature("compactdefaultargs") HasTangent;
		%feature("autodoc", "Returns true if the tangent is stored.

Returns
-------
bool
") HasTangent;
		Standard_Boolean HasTangent();

		/****************** IsVertex ******************/
		/**** md5 signature: 7dbb6189450b7f2ae76146c6d5d6e875 ****/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Returns standard_true when the point coincide with an existing vertex.

Returns
-------
bool
") IsVertex;
		Standard_Boolean IsVertex();

		/****************** NbPointOnRst ******************/
		/**** md5 signature: 6b0e2365804848717d5b6d7f5c1786eb ****/
		%feature("compactdefaultargs") NbPointOnRst;
		%feature("autodoc", "Returns the number of arc containing the extremity. if the method returns 0, the point is inside the surface. otherwise, the extremity lies on at least 1 arc, and all the information (arc, parameter, transitions) are given by the point on restriction (pointonrst) returned by the next method.

Returns
-------
int
") NbPointOnRst;
		Standard_Integer NbPointOnRst();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** ParameterOnGuide ******************/
		/**** md5 signature: ce20260292837a847e6ed56fcbdde050 ****/
		%feature("compactdefaultargs") ParameterOnGuide;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnGuide;
		Standard_Real ParameterOnGuide();

		/****************** Parameters ******************/
		/**** md5 signature: 24a2c71191423d4e30ed72f58cb5de87 ****/
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
		/**** md5 signature: d16a6b22823a7de41836e454c6562498 ****/
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
		/**** md5 signature: fe6479f29924454154642419383f0e06 ****/
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
		/**** md5 signature: df27ebf7b09becfcab08bed6af474b36 ****/
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
		/**** md5 signature: 2f52a225a20b1c127cd792dc347f9deb ****/
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
		/**** md5 signature: 20935a61f170d6589ea40791f00aa5f3 ****/
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
		/**** md5 signature: 1c2d847f9895dadcabe6f5a142550e35 ****/
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
		/**** md5 signature: 00df3077d87c39a1282b20005486cd6f ****/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "This method returns the value of tangent in 3d space.

Returns
-------
gp_Vec
") Tangent;
		const gp_Vec Tangent();

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "This method returns the fuzziness on the point in 3d space.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "This method returns the value of the point in 3d space.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** Vertex ******************/
		/**** md5 signature: 7213fb18dc3be1f48818ab739bb98dfa ****/
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
		/**** md5 signature: 57590f6f2b26126cc4d3122e12289624 ****/
		%feature("compactdefaultargs") BRepBlend_Line;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepBlend_Line;
		 BRepBlend_Line();

		/****************** Append ******************/
		/**** md5 signature: 112809d39d79c49d6bb13a4922e5b5f5 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the content of the line.

Returns
-------
None
") Clear;
		void Clear();

		/****************** EndPointOnFirst ******************/
		/**** md5 signature: c529fd184b9e50e1b6ee45bff61b3c9b ****/
		%feature("compactdefaultargs") EndPointOnFirst;
		%feature("autodoc", "Returns the end point on s1.

Returns
-------
BRepBlend_Extremity
") EndPointOnFirst;
		const BRepBlend_Extremity & EndPointOnFirst();

		/****************** EndPointOnSecond ******************/
		/**** md5 signature: f1a00edceae5b932c1068ab023d5ec57 ****/
		%feature("compactdefaultargs") EndPointOnSecond;
		%feature("autodoc", "Returns the point on s2.

Returns
-------
BRepBlend_Extremity
") EndPointOnSecond;
		const BRepBlend_Extremity & EndPointOnSecond();

		/****************** InsertBefore ******************/
		/**** md5 signature: d3fd33dd9ac7a98f0ee2bf360431c1c4 ****/
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
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points in the line.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		/**** md5 signature: f9ecb741c9f8196ebb5c0c795ecf9f95 ****/
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
		/**** md5 signature: 8ea9df6ce05089f4fae42845b69291ef ****/
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
		/**** md5 signature: af46d5b5d8f27ae951629b321df10b36 ****/
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
		/**** md5 signature: 467e8a8ca95b56d13e0b5d0ef5daa15d ****/
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
		/**** md5 signature: 02e3bdb87daf70bb37bf9aaefbeafc93 ****/
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
		/**** md5 signature: 65a8d0dfaf022584d756eabf06874704 ****/
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
		/**** md5 signature: 855f4d4c44344953d7a9de9123e71157 ****/
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
		/**** md5 signature: eb6cbb694252afa50c3045ff6839418c ****/
		%feature("compactdefaultargs") StartPointOnFirst;
		%feature("autodoc", "Returns the start point on s1.

Returns
-------
BRepBlend_Extremity
") StartPointOnFirst;
		const BRepBlend_Extremity & StartPointOnFirst();

		/****************** StartPointOnSecond ******************/
		/**** md5 signature: 152e6eaee5b76910bd5605ccb0d2a63a ****/
		%feature("compactdefaultargs") StartPointOnSecond;
		%feature("autodoc", "Returns the start point on s2.

Returns
-------
BRepBlend_Extremity
") StartPointOnSecond;
		const BRepBlend_Extremity & StartPointOnSecond();

		/****************** TransitionOnS ******************/
		/**** md5 signature: ac2f27afdd16ab93ea1f959cb2bf6e33 ****/
		%feature("compactdefaultargs") TransitionOnS;
		%feature("autodoc", "Returns the type of the transition of the line defined on the surface.

Returns
-------
IntSurf_TypeTrans
") TransitionOnS;
		IntSurf_TypeTrans TransitionOnS();

		/****************** TransitionOnS1 ******************/
		/**** md5 signature: 9de184f3b47c2902be7de5eb10743898 ****/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "Returns the type of the transition of the line defined on the first surface. the transition is 'constant' along the line. the transition is in if the line is oriented in such a way that the system of vectors (n,drac,t) is right-handed, where n is the normal to the first surface at a point p, drac is a vector tangent to the blending patch, oriented towards the valid part of this patch, t is the tangent to the line on s1 at p. the transitioon is out when the system of vectors is left-handed.

Returns
-------
IntSurf_TypeTrans
") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1();

		/****************** TransitionOnS2 ******************/
		/**** md5 signature: aafa064949332278d0d49be3da4c6df2 ****/
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
		/**** md5 signature: 090e4894ad074e2741323f5dc694aebc ****/
		%feature("compactdefaultargs") BRepBlend_PointOnRst;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepBlend_PointOnRst;
		 BRepBlend_PointOnRst();

		/****************** BRepBlend_PointOnRst ******************/
		/**** md5 signature: 1f640570b26a68373b999a68490ca37f ****/
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
		/**** md5 signature: b2e2a2b000ebbda9cef9186aeead5385 ****/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Returns the arc of restriction containing the vertex.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc();

		/****************** ParameterOnArc ******************/
		/**** md5 signature: 53d2051734836b1f3c7d9edd7c3c1884 ****/
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "Returns the parameter of the point on the arc returned by the method arc().

Returns
-------
float
") ParameterOnArc;
		Standard_Real ParameterOnArc();

		/****************** SetArc ******************/
		/**** md5 signature: ef419e28df8105759150b9a6c4afee00 ****/
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
		/**** md5 signature: adc9ee508ec8cbe59ce8b05248cd454a ****/
		%feature("compactdefaultargs") TransitionOnArc;
		%feature("autodoc", "Returns the transition of the point on the arc returned by arc().

Returns
-------
IntSurf_Transition
") TransitionOnArc;
		const IntSurf_Transition & TransitionOnArc();

		/****************** TransitionOnLine ******************/
		/**** md5 signature: 1ffbcf064eb110daaac7ceebff0fcde5 ****/
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
		/**** md5 signature: 1b83fa703abda9bd2fe3a9caa52745e6 ****/
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
		/**** md5 signature: 78a3b5ae21381e7c60ec45458e50cd49 ****/
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
		/**** md5 signature: 4fb28916dc7b56fca32714bd732ca6a6 ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
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
		/**** md5 signature: b7112b2680da59932f7cc20412f85fda ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ****/
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
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ****/
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
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
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
		/**** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ****/
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
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: a226854cd9eac08cbe4282feaa46c20d ****/
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
		/**** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ****/
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
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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
		/**** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** ParameterOnRst1 ******************/
		/**** md5 signature: 284ae0a0f8af30bf10c1a23ce2f6a2b9 ****/
		%feature("compactdefaultargs") ParameterOnRst1;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst1;
		Standard_Real ParameterOnRst1();

		/****************** ParameterOnRst2 ******************/
		/**** md5 signature: 9bf0d1865174810cd35d339e1b11149f ****/
		%feature("compactdefaultargs") ParameterOnRst2;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst2;
		Standard_Real ParameterOnRst2();

		/****************** Pnt2dOnRst1 ******************/
		/**** md5 signature: 8af792b525778d9f7163716d45fcb20c ****/
		%feature("compactdefaultargs") Pnt2dOnRst1;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst1;
		const gp_Pnt2d Pnt2dOnRst1();

		/****************** Pnt2dOnRst2 ******************/
		/**** md5 signature: b5f740f46476c4024b7987481feaf13c ****/
		%feature("compactdefaultargs") Pnt2dOnRst2;
		%feature("autodoc", "Returns u,v coordinates of the point on the curve on surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst2;
		const gp_Pnt2d Pnt2dOnRst2();

		/****************** PointOnRst1 ******************/
		/**** md5 signature: 762cc38df03d874429dc79602cf45538 ****/
		%feature("compactdefaultargs") PointOnRst1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnRst1;
		const gp_Pnt PointOnRst1();

		/****************** PointOnRst2 ******************/
		/**** md5 signature: 2b807e562845e47d1e518bf057be180a ****/
		%feature("compactdefaultargs") PointOnRst2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnRst2;
		const gp_Pnt PointOnRst2();

		/****************** Resolution ******************/
		/**** md5 signature: 1f885646df74c72ec13d37a113377aaa ****/
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
		/**** md5 signature: 5902809a8ef9b0367b5849f8615d68f9 ****/
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
		/**** md5 signature: 906e6a4bef3056546e496b945ff8d788 ****/
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
		/**** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ****/
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
		/**** md5 signature: b6f1107f21a9bc6524bdd8152abaed5f ****/
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
		/**** md5 signature: 8feefe3a830da630caff2fb979f4ebff ****/
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
		/**** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ****/
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
		/**** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ****/
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
		/**** md5 signature: 99fe75aea7947575eb6b646d1797f9da ****/
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
		/**** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ****/
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
		/**** md5 signature: 8853e0bdcfc4c7ae918b4ce4afe10bf7 ****/
		%feature("compactdefaultargs") Tangent2dOnRst1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnRst1;
		const gp_Vec2d Tangent2dOnRst1();

		/****************** Tangent2dOnRst2 ******************/
		/**** md5 signature: 7efc7e62e5cd2cb55222b8f92787707b ****/
		%feature("compactdefaultargs") Tangent2dOnRst2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnRst2;
		const gp_Vec2d Tangent2dOnRst2();

		/****************** TangentOnRst1 ******************/
		/**** md5 signature: 1e84fceeab2344ba6b579f62eddd47b2 ****/
		%feature("compactdefaultargs") TangentOnRst1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnRst1;
		const gp_Vec TangentOnRst1();

		/****************** TangentOnRst2 ******************/
		/**** md5 signature: 3441edf62ea8bd65204990029d82b25d ****/
		%feature("compactdefaultargs") TangentOnRst2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnRst2;
		const gp_Vec TangentOnRst2();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
		/**** md5 signature: 8606df301777879e7316e5ef9599f728 ****/
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
		/**** md5 signature: 78a3b5ae21381e7c60ec45458e50cd49 ****/
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
		/**** md5 signature: 4fb28916dc7b56fca32714bd732ca6a6 ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
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
		/**** md5 signature: b7112b2680da59932f7cc20412f85fda ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ****/
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
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ****/
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
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
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
		/**** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ****/
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
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: a226854cd9eac08cbe4282feaa46c20d ****/
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
		/**** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ****/
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
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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
		/**** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** ParameterOnRst1 ******************/
		/**** md5 signature: 284ae0a0f8af30bf10c1a23ce2f6a2b9 ****/
		%feature("compactdefaultargs") ParameterOnRst1;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst1;
		Standard_Real ParameterOnRst1();

		/****************** ParameterOnRst2 ******************/
		/**** md5 signature: 9bf0d1865174810cd35d339e1b11149f ****/
		%feature("compactdefaultargs") ParameterOnRst2;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst2;
		Standard_Real ParameterOnRst2();

		/****************** Pnt2dOnRst1 ******************/
		/**** md5 signature: 8af792b525778d9f7163716d45fcb20c ****/
		%feature("compactdefaultargs") Pnt2dOnRst1;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst1;
		const gp_Pnt2d Pnt2dOnRst1();

		/****************** Pnt2dOnRst2 ******************/
		/**** md5 signature: b5f740f46476c4024b7987481feaf13c ****/
		%feature("compactdefaultargs") Pnt2dOnRst2;
		%feature("autodoc", "Returns u,v coordinates of the point on the curve on surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst2;
		const gp_Pnt2d Pnt2dOnRst2();

		/****************** PointOnRst1 ******************/
		/**** md5 signature: 762cc38df03d874429dc79602cf45538 ****/
		%feature("compactdefaultargs") PointOnRst1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnRst1;
		const gp_Pnt PointOnRst1();

		/****************** PointOnRst2 ******************/
		/**** md5 signature: 2b807e562845e47d1e518bf057be180a ****/
		%feature("compactdefaultargs") PointOnRst2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnRst2;
		const gp_Pnt PointOnRst2();

		/****************** Resolution ******************/
		/**** md5 signature: 1f885646df74c72ec13d37a113377aaa ****/
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
		/**** md5 signature: 5902809a8ef9b0367b5849f8615d68f9 ****/
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
		/**** md5 signature: 906e6a4bef3056546e496b945ff8d788 ****/
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
		/**** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ****/
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
		/**** md5 signature: b6f1107f21a9bc6524bdd8152abaed5f ****/
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
		/**** md5 signature: 8feefe3a830da630caff2fb979f4ebff ****/
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
		/**** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ****/
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
		/**** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ****/
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
		/**** md5 signature: d73c9c4058c0955fc8cd59888660f750 ****/
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
		/**** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ****/
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
		/**** md5 signature: 8853e0bdcfc4c7ae918b4ce4afe10bf7 ****/
		%feature("compactdefaultargs") Tangent2dOnRst1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnRst1;
		const gp_Vec2d Tangent2dOnRst1();

		/****************** Tangent2dOnRst2 ******************/
		/**** md5 signature: 7efc7e62e5cd2cb55222b8f92787707b ****/
		%feature("compactdefaultargs") Tangent2dOnRst2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnRst2;
		const gp_Vec2d Tangent2dOnRst2();

		/****************** TangentOnRst1 ******************/
		/**** md5 signature: 1e84fceeab2344ba6b579f62eddd47b2 ****/
		%feature("compactdefaultargs") TangentOnRst1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnRst1;
		const gp_Vec TangentOnRst1();

		/****************** TangentOnRst2 ******************/
		/**** md5 signature: 3441edf62ea8bd65204990029d82b25d ****/
		%feature("compactdefaultargs") TangentOnRst2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnRst2;
		const gp_Vec TangentOnRst2();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
		/**** md5 signature: 4298cff32af6f187e303261f177d3486 ****/
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
		/**** md5 signature: 826dcd81a620ed85f35c4d4dbd7bd8a7 ****/
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
		/**** md5 signature: f6913d316d5accdf3a84bcfda7bb27e1 ****/
		%feature("compactdefaultargs") Decroch1End;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Decroch1End;
		Standard_Boolean Decroch1End();

		/****************** Decroch1Start ******************/
		/**** md5 signature: 85d7bc2d23e235ee8c224332022e89d2 ****/
		%feature("compactdefaultargs") Decroch1Start;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Decroch1Start;
		Standard_Boolean Decroch1Start();

		/****************** Decroch2End ******************/
		/**** md5 signature: 598323a82cc53d7940e82a44b6268b22 ****/
		%feature("compactdefaultargs") Decroch2End;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Decroch2End;
		Standard_Boolean Decroch2End();

		/****************** Decroch2Start ******************/
		/**** md5 signature: 933f9277fcaba02302f7dbc9d24a34c4 ****/
		%feature("compactdefaultargs") Decroch2Start;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Decroch2Start;
		Standard_Boolean Decroch2Start();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		/**** md5 signature: 9bbdb2164431d955d7a3a08a37fd239f ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<BRepBlend_Line>
") Line;
		const opencascade::handle<BRepBlend_Line> & Line();

		/****************** Perform ******************/
		/**** md5 signature: e410fc1bc97982de557150e942b13c80 ****/
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
		/**** md5 signature: 78e8905aafd910d0fa3a7b23c096467b ****/
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
		/**** md5 signature: dd8173527764ca4c24a4c7f33ba4d87a ****/
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

		/****************** GetBounds ******************/
		/**** md5 signature: 73d101c74e718085b2fc8de28383bce3 ****/
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
		/**** md5 signature: 463e2084f8f6e4a4f87c36de6e9fd9c6 ****/
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
		/**** md5 signature: 0884df902635922234b529dc88a260b5 ****/
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
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		/**** md5 signature: 941166ee1a941569b8be371b05e6b601 ****/
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
		/**** md5 signature: 7f8b456aa3e7d8d6579c1f7d3144efc8 ****/
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
		/**** md5 signature: cdd2af0c9686051d434c5a2bc65db59b ****/
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

		/****************** GetBounds ******************/
		/**** md5 signature: 73d101c74e718085b2fc8de28383bce3 ****/
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
		/**** md5 signature: 463e2084f8f6e4a4f87c36de6e9fd9c6 ****/
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
		/**** md5 signature: 0884df902635922234b529dc88a260b5 ****/
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
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		/**** md5 signature: d73c9c4058c0955fc8cd59888660f750 ****/
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
		/**** md5 signature: 7f8b456aa3e7d8d6579c1f7d3144efc8 ****/
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
		/**** md5 signature: a92478616365f23e2ac95b28299eff0e ****/
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

		/****************** GetBounds ******************/
		/**** md5 signature: 73d101c74e718085b2fc8de28383bce3 ****/
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
		/**** md5 signature: 463e2084f8f6e4a4f87c36de6e9fd9c6 ****/
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
		/**** md5 signature: 0884df902635922234b529dc88a260b5 ****/
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
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		/**** md5 signature: 941166ee1a941569b8be371b05e6b601 ****/
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
		/**** md5 signature: db883cf63ff497749765a1588d5f0509 ****/
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
		/**** md5 signature: e1a872f2bf36c0f7fa4261ef950f62f3 ****/
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

		/****************** GetBounds ******************/
		/**** md5 signature: 73d101c74e718085b2fc8de28383bce3 ****/
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
		/**** md5 signature: 463e2084f8f6e4a4f87c36de6e9fd9c6 ****/
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
		/**** md5 signature: 0884df902635922234b529dc88a260b5 ****/
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
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		/**** md5 signature: d73c9c4058c0955fc8cd59888660f750 ****/
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
		/**** md5 signature: db883cf63ff497749765a1588d5f0509 ****/
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
		/**** md5 signature: 43cb2559b69d5e498ec597fa336346ec ****/
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
		/**** md5 signature: 7b97fab9290fe599257ab8ce84870242 ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
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
		/**** md5 signature: b7112b2680da59932f7cc20412f85fda ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ****/
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
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ****/
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
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
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
		/**** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ****/
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
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: a226854cd9eac08cbe4282feaa46c20d ****/
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
		/**** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ****/
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
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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
		/**** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** ParameterOnRst ******************/
		/**** md5 signature: 7e31a9a50b0e16d757ff5e9a2545014c ****/
		%feature("compactdefaultargs") ParameterOnRst;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst;
		Standard_Real ParameterOnRst();

		/****************** Pnt2dOnRst ******************/
		/**** md5 signature: be6301599a2805e86c2f189218545e8d ****/
		%feature("compactdefaultargs") Pnt2dOnRst;
		%feature("autodoc", "Returns u,v coordinates of the point on the curve on surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst;
		const gp_Pnt2d Pnt2dOnRst();

		/****************** Pnt2dOnS ******************/
		/**** md5 signature: 17442813aa59649b001e1e639324e582 ****/
		%feature("compactdefaultargs") Pnt2dOnS;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnS;
		const gp_Pnt2d Pnt2dOnS();

		/****************** PointOnRst ******************/
		/**** md5 signature: 8bca30b1c57a5ca26f02cdaf7dbf609a ****/
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnRst;
		const gp_Pnt PointOnRst();

		/****************** PointOnS ******************/
		/**** md5 signature: d0ce1246a72267935632a60d95848390 ****/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS;
		const gp_Pnt PointOnS();

		/****************** Resolution ******************/
		/**** md5 signature: 1f885646df74c72ec13d37a113377aaa ****/
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
		/**** md5 signature: c6f45fdc6c5dce2cea7b90328e5e99d9 ****/
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
		/**** md5 signature: 906e6a4bef3056546e496b945ff8d788 ****/
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
		/**** md5 signature: b6f1107f21a9bc6524bdd8152abaed5f ****/
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
		/**** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ****/
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
		/**** md5 signature: 45827773e540a48ed043070ebdcad334 ****/
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
		/**** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ****/
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
		/**** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ****/
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
		/**** md5 signature: 99fe75aea7947575eb6b646d1797f9da ****/
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
		/**** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ****/
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
		/**** md5 signature: a67df95e06afdcf2e410ba7d891bdc53 ****/
		%feature("compactdefaultargs") Tangent2dOnRst;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnRst;
		const gp_Vec2d Tangent2dOnRst();

		/****************** Tangent2dOnS ******************/
		/**** md5 signature: e102a4d332cc3b92c9252bebc7ca2a2f ****/
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS;
		const gp_Vec2d Tangent2dOnS();

		/****************** TangentOnRst ******************/
		/**** md5 signature: ee94795e8a03889a76a13b1b2ac6b614 ****/
		%feature("compactdefaultargs") TangentOnRst;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnRst;
		const gp_Vec TangentOnRst();

		/****************** TangentOnS ******************/
		/**** md5 signature: 48a27063e2cf1be2b2c56ad8f774bd84 ****/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS;
		const gp_Vec TangentOnS();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
		/**** md5 signature: a900f3bd8b402a53ff306bb2d36fda91 ****/
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
		/**** md5 signature: 7b97fab9290fe599257ab8ce84870242 ****/
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
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
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
		/**** md5 signature: b7112b2680da59932f7cc20412f85fda ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Returns the minimal distance beetween two extremitys of calculed sections.

Returns
-------
float
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ****/
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
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Returns the length of the maximum section.

Returns
-------
float
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ****/
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
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
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
		/**** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ****/
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
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
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
		/**** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: a226854cd9eac08cbe4282feaa46c20d ****/
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
		/**** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ****/
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
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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
		/**** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 3.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** ParameterOnRst ******************/
		/**** md5 signature: 7e31a9a50b0e16d757ff5e9a2545014c ****/
		%feature("compactdefaultargs") ParameterOnRst;
		%feature("autodoc", "Returns parameter of the point on the curve.

Returns
-------
float
") ParameterOnRst;
		Standard_Real ParameterOnRst();

		/****************** Pnt2dOnRst ******************/
		/**** md5 signature: be6301599a2805e86c2f189218545e8d ****/
		%feature("compactdefaultargs") Pnt2dOnRst;
		%feature("autodoc", "Returns u,v coordinates of the point on the curve on surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnRst;
		const gp_Pnt2d Pnt2dOnRst();

		/****************** Pnt2dOnS ******************/
		/**** md5 signature: 17442813aa59649b001e1e639324e582 ****/
		%feature("compactdefaultargs") Pnt2dOnS;
		%feature("autodoc", "Returns u,v coordinates of the point on the surface.

Returns
-------
gp_Pnt2d
") Pnt2dOnS;
		const gp_Pnt2d Pnt2dOnS();

		/****************** PointOnRst ******************/
		/**** md5 signature: 8bca30b1c57a5ca26f02cdaf7dbf609a ****/
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnRst;
		const gp_Pnt PointOnRst();

		/****************** PointOnS ******************/
		/**** md5 signature: d0ce1246a72267935632a60d95848390 ****/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") PointOnS;
		const gp_Pnt PointOnS();

		/****************** Resolution ******************/
		/**** md5 signature: 1f885646df74c72ec13d37a113377aaa ****/
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
		/**** md5 signature: c6f45fdc6c5dce2cea7b90328e5e99d9 ****/
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
		/**** md5 signature: 906e6a4bef3056546e496b945ff8d788 ****/
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
		/**** md5 signature: b6f1107f21a9bc6524bdd8152abaed5f ****/
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
		/**** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ****/
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
		/**** md5 signature: 45827773e540a48ed043070ebdcad334 ****/
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
		/**** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ****/
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
		/**** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ****/
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
		/**** md5 signature: d73c9c4058c0955fc8cd59888660f750 ****/
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
		/**** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ****/
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
		/**** md5 signature: a67df95e06afdcf2e410ba7d891bdc53 ****/
		%feature("compactdefaultargs") Tangent2dOnRst;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnRst;
		const gp_Vec2d Tangent2dOnRst();

		/****************** Tangent2dOnS ******************/
		/**** md5 signature: e102a4d332cc3b92c9252bebc7ca2a2f ****/
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec2d
") Tangent2dOnS;
		const gp_Vec2d Tangent2dOnS();

		/****************** TangentOnRst ******************/
		/**** md5 signature: ee94795e8a03889a76a13b1b2ac6b614 ****/
		%feature("compactdefaultargs") TangentOnRst;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnRst;
		const gp_Vec TangentOnRst();

		/****************** TangentOnS ******************/
		/**** md5 signature: 48a27063e2cf1be2b2c56ad8f774bd84 ****/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") TangentOnS;
		const gp_Vec TangentOnS();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
		/**** md5 signature: 98ef58092f384b62e54eded9c9002be2 ****/
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
		/**** md5 signature: f9d5cffa9a03b0a3c58f32741f4a8c9a ****/
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
		/**** md5 signature: 8afbad6ca438fb5bf221347cf65278f9 ****/
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
		/**** md5 signature: 9670fa97a635898b96c8e6af24b5f104 ****/
		%feature("compactdefaultargs") DecrochEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") DecrochEnd;
		Standard_Boolean DecrochEnd();

		/****************** DecrochStart ******************/
		/**** md5 signature: 223f9062baf694444e41dd2120766443 ****/
		%feature("compactdefaultargs") DecrochStart;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") DecrochStart;
		Standard_Boolean DecrochStart();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		/**** md5 signature: 9bbdb2164431d955d7a3a08a37fd239f ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<BRepBlend_Line>
") Line;
		const opencascade::handle<BRepBlend_Line> & Line();

		/****************** Perform ******************/
		/**** md5 signature: 3ebeca31e507208cd42bab74df3ed6e3 ****/
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
		/**** md5 signature: 691664aa4fe132192d2ccf25ba05720a ****/
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
		/**** md5 signature: 248726a17ab5bcfae0913cbe25564d9d ****/
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
		/**** md5 signature: 0ea0295b6724aa8af8ca3b784b4bc60a ****/
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
		/**** md5 signature: 7d8efb01ff65c2d30fe479ee5510d837 ****/
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
		/**** md5 signature: 71403ff4a3ccda5a85656094466d7bab ****/
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
		/**** md5 signature: 2b2955a3ba803ab46041189579530527 ****/
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
		/**** md5 signature: bc20933ea1d896b847c2a86545020181 ****/
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
		/**** md5 signature: 5885fcb1eae17266768e978b25dda475 ****/
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
		/**** md5 signature: e1fb178a0cc6b5d457359b43b1a7c823 ****/
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
		/**** md5 signature: 02a9e3404b651f5bcee39d40728c4c7b ****/
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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		/**** md5 signature: 9bbdb2164431d955d7a3a08a37fd239f ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<BRepBlend_Line>
") Line;
		const opencascade::handle<BRepBlend_Line> & Line();

		/****************** Perform ******************/
		/**** md5 signature: ef3b3700f467db4ea875b65f539d9955 ****/
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
		/**** md5 signature: a2bca51a10d7f020b86504fe9860626e ****/
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
		/**** md5 signature: 39c72a7c59d31a28e720252eee26feee ****/
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
		/**** md5 signature: 10664ebffbd6ed784502d7d4acfa5a93 ****/
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
		/**** md5 signature: 9e7cba134041c48814f8e911bc7ceb7d ****/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") TwistOnS1;
		Standard_Boolean TwistOnS1();

		/****************** TwistOnS2 ******************/
		/**** md5 signature: d09d14bd26a5c6922f795ecb44cf2f66 ****/
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
		/**** md5 signature: e8bf5d422d7c3522897eff28c0d69e41 ****/
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
		/**** md5 signature: 1f64768686e0fd1268e07e05fcaa4c86 ****/
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
		/**** md5 signature: f98635405dfb2bd7c7d7c0586657d180 ****/
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
		/**** md5 signature: 3afb1cfb110bf596041a7a577f7e1ef2 ****/
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
		/**** md5 signature: 1f64768686e0fd1268e07e05fcaa4c86 ****/
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
		/**** md5 signature: f98635405dfb2bd7c7d7c0586657d180 ****/
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
		/**** md5 signature: f07240c831038948a4079ef9673c5be0 ****/
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
		/**** md5 signature: 1f64768686e0fd1268e07e05fcaa4c86 ****/
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
		/**** md5 signature: f98635405dfb2bd7c7d7c0586657d180 ****/
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
