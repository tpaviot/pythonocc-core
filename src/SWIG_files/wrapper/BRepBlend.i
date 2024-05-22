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
%define BREPBLENDDOCSTRING
"BRepBlend module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_brepblend.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i


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
#include<Adaptor2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<IntSurf_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
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
%import Adaptor2d.i
%import Adaptor3d.i
%import IntSurf.i
%import Geom2d.i
%import Geom.i
%import Law.i
%import ChFiDS.i
%import TopAbs.i

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
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get the barycentre of surface. an very poor estimation is sufficient. this information is useful to perform well conditioned rational approximation.
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****************** D0 ******************/
		/**** md5 signature: 6e91f38f7b850db44626fcacae37aa41 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Compute the section for v = param.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** D1 ******************/
		/**** md5 signature: 2393309f0bc419006f62cbad28865129 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
Compute the first derivative in v direction of the section for v = param.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** D2 ******************/
		/**** md5 signature: 4cdf4be928174877f3da59b3bf48c192 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
Compute the second derivative in v direction of the section for v = param.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: 36fb20110448cba55b750bc7db93d222 ****/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections. this information is useful to perform well conditioned rational approximation.
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetTolerance ******************/
		/**** md5 signature: 3f6ec4398981d416a51435f14d7cee22 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary (in radian) surftol error inside the surface.
") GetTolerance;
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, TColStd_Array1OfReal & Tol3d);

		/****************** Intervals ******************/
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accommodate for the parameters. i.e. t.length() > nbintervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		/**** md5 signature: 2a6f0ec7e4a129780b654d163e7e3b1c ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rationnal or not.
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** Knots ******************/
		/**** md5 signature: 25dbe24e24c953c2c68b0d008e63e5d6 ****/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Get the knots of the section.
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****************** MaximalSection ******************/
		/**** md5 signature: b8f0d759fcd21b95d400b3aae3c12cfc ****/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section. this information is useful to perform well conditioned rational approximation.
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****************** Mults ******************/
		/**** md5 signature: 033dc1fab9e10e705c796ffc1e03a44d ****/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
Get the multplicities of the section.
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****************** Nb2dCurves ******************/
		/**** md5 signature: a7d69b59dcf4f7a28533481bfba32ffb ****/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
Get the number of 2d curves to approximate.
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves();

		/****************** NbIntervals ******************/
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Point ******************/
		/**** md5 signature: afc5d5ba96bac3b7421329782521d7aa ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Func: Blend_AppFunction
Param: float
Sol: math_Vector
Pnt: Blend_Point

Return
-------
None

Description
-----------
No available documentation.
") Point;
		virtual void Point(const Blend_AppFunction & Func, const Standard_Real Param, const math_Vector & Sol, Blend_Point & Pnt);

		/****************** Resolution ******************/
		/**** md5 signature: ed5d1e3e2211bf035576b0c56d934522 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Index: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
Returns the resolutions in the sub-space 2d <index> -- this information is usfull to find an good tolerance in 2d approximation.
") Resolution;
		virtual void Resolution(const Standard_Integer Index, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SectionShape ******************/
		/**** md5 signature: 4b057291e9e338f8d299ce252e7fb36b ****/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int

Description
-----------
Get the format of an section.
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SetInterval ******************/
		/**** md5 signature: 09d00fda8057705f50d4a0bf656696ed ****/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the fonction this determines the derivatives in these values if the function is not cn.
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****************** SetTolerance ******************/
		/**** md5 signature: bf0b5b1b4d35ebad7b1b81b0b9b8ba2c ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: float
Tol2d: float

Return
-------
None

Description
-----------
Is usfull, if (me) have to be run numerical algorithme to perform d0, d1 or d2.
") SetTolerance;
		virtual void SetTolerance(const Standard_Real Tol3d, const Standard_Real Tol2d);

		/****************** Vec ******************/
		/**** md5 signature: 8e423ef956801f23a2aa4f8ca11e9907 ****/
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Pnt: Blend_Point

Return
-------
None

Description
-----------
No available documentation.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_AppSurf;
		 BRepBlend_AppSurf();

		/****************** BRepBlend_AppSurf ******************/
		/**** md5 signature: f90d822c69ef6411865bdcb2388b117c ****/
		%feature("compactdefaultargs") BRepBlend_AppSurf;
		%feature("autodoc", "
Parameters
----------
Degmin: int
Degmax: int
Tol3d: float
Tol2d: float
NbIt: int
KnownParameters: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_AppSurf;
		 BRepBlend_AppSurf(const Standard_Integer Degmin, const Standard_Integer Degmax, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIt, const Standard_Boolean KnownParameters = Standard_False);

		/****************** Continuity ******************/
		/**** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns the continuity used in the approximation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** CriteriumWeight ******************/
		/**** md5 signature: 4b68323f3c03d233f69e27404a58a42c ****/
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "
Parameters
----------

Return
-------
W1: float
W2: float
W3: float

Description
-----------
Returns the weights (as percent) associed to the criterium used in the optimization.
") CriteriumWeight;
		void CriteriumWeight(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Curve2d ******************/
		/**** md5 signature: 45f5fb41b7daba7a20d1fb56ead05f0f ****/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
Index: int
TPoles: TColgp_Array1OfPnt2d
TKnots: TColStd_Array1OfReal
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Curve2d;
		void Curve2d(const Standard_Integer Index, TColgp_Array1OfPnt2d & TPoles, TColStd_Array1OfReal & TKnots, TColStd_Array1OfInteger & TMults);

		/****************** Curve2dPoles ******************/
		/**** md5 signature: 8df321abd16a4651f96229eab1c5f048 ****/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TColgp_Array1OfPnt2d

Description
-----------
No available documentation.
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles(const Standard_Integer Index);

		/****************** Curves2dDegree ******************/
		/**** md5 signature: 85ba31033da623d05ad75c9b051842b3 ****/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Curves2dDegree;
		Standard_Integer Curves2dDegree();

		/****************** Curves2dKnots ******************/
		/**** md5 signature: cd12725d88c425f3fe1ebccf9467256f ****/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots();

		/****************** Curves2dMults ******************/
		/**** md5 signature: d4f1ca5a39a589bb289460010c5bbf39 ****/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults();

		/****************** Curves2dShape ******************/
		/**** md5 signature: 28bf2faa4b8e811f12223cb99d1721ea ****/
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
Degree: int
NbPoles: int
NbKnots: int

Description
-----------
No available documentation.
") Curves2dShape;
		void Curves2dShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Init ******************/
		/**** md5 signature: 44a81349dbd1c40eccbaf3f763903054 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Degmin: int
Degmax: int
Tol3d: float
Tol2d: float
NbIt: int
KnownParameters: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Integer Degmin, const Standard_Integer Degmax, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIt, const Standard_Boolean KnownParameters = Standard_False);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbCurves2d ******************/
		/**** md5 signature: 91ae967daa54efe7d38afad4a5698e5b ****/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****************** ParType ******************/
		/**** md5 signature: 97fa11d31bc8075ba4a84bf8b926a855 ****/
		%feature("compactdefaultargs") ParType;
		%feature("autodoc", "Return
-------
Approx_ParametrizationType

Description
-----------
Returns the type of parametrization used in the approximation.
") ParType;
		Approx_ParametrizationType ParType();

		/****************** Perform ******************/
		/**** md5 signature: a9a9e9c5bf9d1337764cca2e172749d2 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Lin: BRepBlend_Line
SecGen: Blend_AppFunction
SpApprox: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<BRepBlend_Line> & Lin, Blend_AppFunction & SecGen, const Standard_Boolean SpApprox = Standard_False);

		/****************** Perform ******************/
		/**** md5 signature: 7a55171e878a876862465555307e6bd3 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Lin: BRepBlend_Line
SecGen: Blend_AppFunction
NbMaxP: int

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<BRepBlend_Line> & Lin, Blend_AppFunction & SecGen, const Standard_Integer NbMaxP);

		/****************** PerformSmoothing ******************/
		/**** md5 signature: 7cb77d9dda0f081d8efd1da8d7d4b09d ****/
		%feature("compactdefaultargs") PerformSmoothing;
		%feature("autodoc", "
Parameters
----------
Lin: BRepBlend_Line
SecGen: Blend_AppFunction

Return
-------
None

Description
-----------
No available documentation.
") PerformSmoothing;
		void PerformSmoothing(const opencascade::handle<BRepBlend_Line> & Lin, Blend_AppFunction & SecGen);

		/****************** SetContinuity ******************/
		/**** md5 signature: 41a91b0ea6e9b248a1b48c05882f4281 ****/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "
Parameters
----------
C: GeomAbs_Shape

Return
-------
None

Description
-----------
Define the continuity used in the approximation.
") SetContinuity;
		void SetContinuity(const GeomAbs_Shape C);

		/****************** SetCriteriumWeight ******************/
		/**** md5 signature: f8c7045bd0e7f781a0984d023e8b1268 ****/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "
Parameters
----------
W1: float
W2: float
W3: float

Return
-------
None

Description
-----------
Define the weights associed to the criterium used in the optimization. //! if wi <= 0.
") SetCriteriumWeight;
		void SetCriteriumWeight(const Standard_Real W1, const Standard_Real W2, const Standard_Real W3);

		/****************** SetParType ******************/
		/**** md5 signature: ff343d7833ad3cc796439eb5cefa88ba ****/
		%feature("compactdefaultargs") SetParType;
		%feature("autodoc", "
Parameters
----------
ParType: Approx_ParametrizationType

Return
-------
None

Description
-----------
Define the type of parametrization used in the approximation.
") SetParType;
		void SetParType(const Approx_ParametrizationType ParType);

		/****************** SurfPoles ******************/
		/**** md5 signature: 33be5d08621b237fcd73b5b9accd2338 ****/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "Return
-------
TColgp_Array2OfPnt

Description
-----------
No available documentation.
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles();

		/****************** SurfShape ******************/
		/**** md5 signature: 6dbc9c018a92aabb9f9d1988ac20cb43 ****/
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
UDegree: int
VDegree: int
NbUPoles: int
NbVPoles: int
NbUKnots: int
NbVKnots: int

Description
-----------
No available documentation.
") SurfShape;
		void SurfShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SurfUKnots ******************/
		/**** md5 signature: 30cf4dd9deaf04a1c77052e14ae7392b ****/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots();

		/****************** SurfUMults ******************/
		/**** md5 signature: ef046447df8e4b2931da90e1475e731f ****/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults();

		/****************** SurfVKnots ******************/
		/**** md5 signature: 52c9dafc43c5e3713c77d7aa4381da5c ****/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots();

		/****************** SurfVMults ******************/
		/**** md5 signature: 589e6536c77c512e7a37f99faf0fa21c ****/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults();

		/****************** SurfWeights ******************/
		/**** md5 signature: 894d2a3f2c33f7d641aef9c7f9e3fa57 ****/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "Return
-------
TColStd_Array2OfReal

Description
-----------
No available documentation.
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights();

		/****************** Surface ******************/
		/**** md5 signature: 49bb9dd6da49966f0010e14dd0ffef04 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
TPoles: TColgp_Array2OfPnt
TWeights: TColStd_Array2OfReal
TUKnots: TColStd_Array1OfReal
TVKnots: TColStd_Array1OfReal
TUMults: TColStd_Array1OfInteger
TVMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Surface;
		void Surface(TColgp_Array2OfPnt & TPoles, TColStd_Array2OfReal & TWeights, TColStd_Array1OfReal & TUKnots, TColStd_Array1OfReal & TVKnots, TColStd_Array1OfInteger & TUMults, TColStd_Array1OfInteger & TVMults);

		/****************** TolCurveOnSurf ******************/
		/**** md5 signature: f21f0f877b35cf67581fa59260f72857 ****/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
No available documentation.
") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf(const Standard_Integer Index);

		/****************** TolReached ******************/
		/**** md5 signature: c8d3e7f26c4ee8a50f4eca5274d79e63 ****/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "
Parameters
----------

Return
-------
Tol3d: float
Tol2d: float

Description
-----------
No available documentation.
") TolReached;
		void TolReached(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** UDegree ******************/
		/**** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ****/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		Standard_Integer UDegree();

		/****************** VDegree ******************/
		/**** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ****/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
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
		%feature("autodoc", "
Parameters
----------
Funct: Approx_SweepFunction
First: float
Last: float
Tol3d: float
Tol2d: float
TolAngular: float
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C0)
Degmax: int (optional, default to 11)
Segmax: int (optional, default to 50)

Return
-------
None

Description
-----------
Approximation of the new surface (and eventually the 2d curves on the support surfaces). normally the 2d curve are approximated with an tolerance given by the resolution on support surfaces, but if this tolerance is too large tol2d is used.
") BRepBlend_AppSurface;
		 BRepBlend_AppSurface(const opencascade::handle<Approx_SweepFunction> & Funct, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Real TolAngular, const GeomAbs_Shape Continuity = GeomAbs_C0, const Standard_Integer Degmax = 11, const Standard_Integer Segmax = 50);

		/****************** Curve2d ******************/
		/**** md5 signature: 45f5fb41b7daba7a20d1fb56ead05f0f ****/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
Index: int
TPoles: TColgp_Array1OfPnt2d
TKnots: TColStd_Array1OfReal
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Curve2d;
		void Curve2d(const Standard_Integer Index, TColgp_Array1OfPnt2d & TPoles, TColStd_Array1OfReal & TKnots, TColStd_Array1OfInteger & TMults);

		/****************** Curve2dPoles ******************/
		/**** md5 signature: 8df321abd16a4651f96229eab1c5f048 ****/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TColgp_Array1OfPnt2d

Description
-----------
No available documentation.
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles(const Standard_Integer Index);

		/****************** Curves2dDegree ******************/
		/**** md5 signature: 85ba31033da623d05ad75c9b051842b3 ****/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Curves2dDegree;
		Standard_Integer Curves2dDegree();

		/****************** Curves2dKnots ******************/
		/**** md5 signature: cd12725d88c425f3fe1ebccf9467256f ****/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots();

		/****************** Curves2dMults ******************/
		/**** md5 signature: d4f1ca5a39a589bb289460010c5bbf39 ****/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults();

		/****************** Curves2dShape ******************/
		/**** md5 signature: 28bf2faa4b8e811f12223cb99d1721ea ****/
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
Degree: int
NbPoles: int
NbKnots: int

Description
-----------
No available documentation.
") Curves2dShape;
		void Curves2dShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Dump ******************/
		/**** md5 signature: d37b43e0b2386dc096d5d707876db157 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Display information on approximation.
") Dump;
		void Dump(std::ostream &OutValue);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** Max2dError ******************/
		/**** md5 signature: bb3f56b4b55e0d91b8620b3ad4fad758 ****/
		%feature("compactdefaultargs") Max2dError;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the maximum error in the <index> 2d curve approximation.
") Max2dError;
		Standard_Real Max2dError(const Standard_Integer Index);

		/****************** MaxErrorOnSurf ******************/
		/**** md5 signature: e42290da593c42adaac24f68c51ecbda ****/
		%feature("compactdefaultargs") MaxErrorOnSurf;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the maximum error in the surface approximation.
") MaxErrorOnSurf;
		Standard_Real MaxErrorOnSurf();

		/****************** NbCurves2d ******************/
		/**** md5 signature: 91ae967daa54efe7d38afad4a5698e5b ****/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****************** SurfPoles ******************/
		/**** md5 signature: 33be5d08621b237fcd73b5b9accd2338 ****/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "Return
-------
TColgp_Array2OfPnt

Description
-----------
No available documentation.
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles();

		/****************** SurfShape ******************/
		/**** md5 signature: 6dbc9c018a92aabb9f9d1988ac20cb43 ****/
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
UDegree: int
VDegree: int
NbUPoles: int
NbVPoles: int
NbUKnots: int
NbVKnots: int

Description
-----------
No available documentation.
") SurfShape;
		void SurfShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SurfUKnots ******************/
		/**** md5 signature: 30cf4dd9deaf04a1c77052e14ae7392b ****/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots();

		/****************** SurfUMults ******************/
		/**** md5 signature: ef046447df8e4b2931da90e1475e731f ****/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults();

		/****************** SurfVKnots ******************/
		/**** md5 signature: 52c9dafc43c5e3713c77d7aa4381da5c ****/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots();

		/****************** SurfVMults ******************/
		/**** md5 signature: 589e6536c77c512e7a37f99faf0fa21c ****/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults();

		/****************** SurfWeights ******************/
		/**** md5 signature: 894d2a3f2c33f7d641aef9c7f9e3fa57 ****/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "Return
-------
TColStd_Array2OfReal

Description
-----------
No available documentation.
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights();

		/****************** Surface ******************/
		/**** md5 signature: 49bb9dd6da49966f0010e14dd0ffef04 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
TPoles: TColgp_Array2OfPnt
TWeights: TColStd_Array2OfReal
TUKnots: TColStd_Array1OfReal
TVKnots: TColStd_Array1OfReal
TUMults: TColStd_Array1OfInteger
TVMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Surface;
		void Surface(TColgp_Array2OfPnt & TPoles, TColStd_Array2OfReal & TWeights, TColStd_Array1OfReal & TUKnots, TColStd_Array1OfReal & TVKnots, TColStd_Array1OfInteger & TUMults, TColStd_Array1OfInteger & TVMults);

		/****************** TolCurveOnSurf ******************/
		/**** md5 signature: f21f0f877b35cf67581fa59260f72857 ****/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
No available documentation.
") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf(const Standard_Integer Index);

		/****************** UDegree ******************/
		/**** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ****/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		Standard_Integer UDegree();

		/****************** VDegree ******************/
		/**** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ****/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
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
* class BRepBlend_BlendTool *
****************************/
class BRepBlend_BlendTool {
	public:
		/****************** Bounds ******************/
		/**** md5 signature: 14979ddc3175e995d5548477ac5bcd4b ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
Ufirst: float
Ulast: float

Description
-----------
Returns the parametric limits on the arc c. these limits must be finite: they are either the real limits of the arc, for a finite arc, or a bounding box for an infinite arc.
") Bounds;
		static void Bounds(const opencascade::handle<Adaptor2d_Curve2d> & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CurveOnSurf ******************/
		/**** md5 signature: 42ed509a86edeb73002d5f1d07860770 ****/
		%feature("compactdefaultargs") CurveOnSurf;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
S: Adaptor3d_Surface

Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") CurveOnSurf;
		static opencascade::handle<Adaptor2d_Curve2d> CurveOnSurf(const opencascade::handle<Adaptor2d_Curve2d> & C, const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** Inters ******************/
		/**** md5 signature: 170d1a316434301ae883f401f1afc1a5 ****/
		%feature("compactdefaultargs") Inters;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d
S: Adaptor3d_Surface
C: Adaptor2d_Curve2d

Return
-------
Param: float
Dist: float

Description
-----------
No available documentation.
") Inters;
		static Standard_Boolean Inters(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor2d_Curve2d> & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NbSamplesU ******************/
		/**** md5 signature: 7ffe816252db97bdbf2950cea2ca2037 ****/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
u1: float
u2: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesU;
		static Standard_Integer NbSamplesU(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real u1, const Standard_Real u2);

		/****************** NbSamplesV ******************/
		/**** md5 signature: 183861bdb84cb1597bd3a1324a097e8e ****/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
v1: float
v2: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesV;
		static Standard_Integer NbSamplesV(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real v1, const Standard_Real v2);

		/****************** Parameter ******************/
		/**** md5 signature: 7ae5064afa9b94fba3ac6ba29690d05a ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex
A: Adaptor2d_Curve2d

Return
-------
float

Description
-----------
Returns the parameter of the vertex v on the edge a.
") Parameter;
		static Standard_Real Parameter(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****************** Project ******************/
		/**** md5 signature: dd03f29497bf175b89cbdb0eb69337ae ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
S: Adaptor3d_Surface
C: Adaptor2d_Curve2d

Return
-------
Paramproj: float
Dist: float

Description
-----------
Projects the point p on the arc c. if the methods returns standard_true, the projection is successful, and paramproj is the parameter on the arc of the projected point, dist is the distance between p and the curve.. if the method returns standard_false, param proj and dist are not significant.
") Project;
		static Standard_Boolean Project(const gp_Pnt2d & P, const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor2d_Curve2d> & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SingularOnUMax ******************/
		/**** md5 signature: d3ce7701aebe6c17d8a630ca024b7a67 ****/
		%feature("compactdefaultargs") SingularOnUMax;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
bool

Description
-----------
No available documentation.
") SingularOnUMax;
		static Standard_Boolean SingularOnUMax(const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** SingularOnUMin ******************/
		/**** md5 signature: d59a1ea9f83cedfe3b3c10bf7d368a33 ****/
		%feature("compactdefaultargs") SingularOnUMin;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
bool

Description
-----------
No available documentation.
") SingularOnUMin;
		static Standard_Boolean SingularOnUMin(const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** SingularOnVMax ******************/
		/**** md5 signature: 5f37482ceddffdf31349f166be64affd ****/
		%feature("compactdefaultargs") SingularOnVMax;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
bool

Description
-----------
No available documentation.
") SingularOnVMax;
		static Standard_Boolean SingularOnVMax(const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** SingularOnVMin ******************/
		/**** md5 signature: 25ae497959e941075dff65a069de3c75 ****/
		%feature("compactdefaultargs") SingularOnVMin;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
bool

Description
-----------
No available documentation.
") SingularOnVMin;
		static Standard_Boolean SingularOnVMin(const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** Tolerance ******************/
		/**** md5 signature: d0ef038126a2ceb42adeb04bacf780f0 ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex
A: Adaptor2d_Curve2d

Return
-------
float

Description
-----------
Returns the parametric tolerance on the arc a used to consider that the vertex and another point meet, i-e if abs(parameter(vertex)-parameter(otherpnt))<= tolerance, the points are 'merged'.
") Tolerance;
		static Standard_Real Tolerance(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & A);

};


%extend BRepBlend_BlendTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepBlend_CSWalking *
****************************/
/**********************************
* class BRepBlend_CurvPointRadInv *
**********************************/
class BRepBlend_CurvPointRadInv : public Blend_CurvPointFuncInv {
	public:
		/****************** BRepBlend_CurvPointRadInv ******************/
		/**** md5 signature: 07adfa2c83f449c99a58faec4122a065 ****/
		%feature("compactdefaultargs") BRepBlend_CurvPointRadInv;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_CurvPointRadInv;
		 BRepBlend_CurvPointRadInv(const opencascade::handle<Adaptor3d_Curve> & C1, const opencascade::handle<Adaptor3d_Curve> & C2);

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
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
Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: 73d101c74e718085b2fc8de28383bce3 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
Returns in the vector infbound the lowest values allowed for each of the 3 variables. returns in the vector supbound the greatest values allowed for each of the 3 variables.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		/**** md5 signature: 463e2084f8f6e4a4f87c36de6e9fd9c6 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
Returns in the vector tolerance the parametric tolerance for each of the 3 variables; tol is the tolerance used in 3d space.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		/**** md5 signature: 0884df902635922234b529dc88a260b5 ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 2.
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		/**** md5 signature: d73c9c4058c0955fc8cd59888660f750 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Integer Choix);

		/****************** Set ******************/
		/**** md5 signature: db883cf63ff497749765a1588d5f0509 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Set the point on which a solution has to be found.
") Set;
		void Set(const gp_Pnt & P);

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
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
Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
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
Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_Extremity;
		 BRepBlend_Extremity();

		/****************** BRepBlend_Extremity ******************/
		/**** md5 signature: ee5708baa54062a6870f496f8287be89 ****/
		%feature("compactdefaultargs") BRepBlend_Extremity;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
U: float
V: float
Param: float
Tol: float

Return
-------
None

Description
-----------
Creates an extremity on a surface.
") BRepBlend_Extremity;
		 BRepBlend_Extremity(const gp_Pnt & P, const Standard_Real U, const Standard_Real V, const Standard_Real Param, const Standard_Real Tol);

		/****************** BRepBlend_Extremity ******************/
		/**** md5 signature: f530cc4b46ea55af8e69fe6333e2fe76 ****/
		%feature("compactdefaultargs") BRepBlend_Extremity;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
U: float
V: float
Param: float
Tol: float
Vtx: Adaptor3d_HVertex

Return
-------
None

Description
-----------
Creates an extremity on a surface. this extremity matches the vertex <vtx>.
") BRepBlend_Extremity;
		 BRepBlend_Extremity(const gp_Pnt & P, const Standard_Real U, const Standard_Real V, const Standard_Real Param, const Standard_Real Tol, const opencascade::handle<Adaptor3d_HVertex> & Vtx);

		/****************** BRepBlend_Extremity ******************/
		/**** md5 signature: ede94a8bfb71acf447a0bfd63c98b8eb ****/
		%feature("compactdefaultargs") BRepBlend_Extremity;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
W: float
Param: float
Tol: float

Return
-------
None

Description
-----------
Creates an extremity on a curve.
") BRepBlend_Extremity;
		 BRepBlend_Extremity(const gp_Pnt & P, const Standard_Real W, const Standard_Real Param, const Standard_Real Tol);

		/****************** AddArc ******************/
		/**** md5 signature: 1bd1958509e7b4b472a6df84023e3729 ****/
		%feature("compactdefaultargs") AddArc;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d
Param: float
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Return
-------
None

Description
-----------
Sets the values of a point which is on the arc a, at parameter param.
") AddArc;
		void AddArc(const opencascade::handle<Adaptor2d_Curve2d> & A, const Standard_Real Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****************** HasTangent ******************/
		/**** md5 signature: 8ce1fe7a81869f6f1baf5bc37a4f78bd ****/
		%feature("compactdefaultargs") HasTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the tangent is stored.
") HasTangent;
		Standard_Boolean HasTangent();

		/****************** IsVertex ******************/
		/**** md5 signature: 7dbb6189450b7f2ae76146c6d5d6e875 ****/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns standard_true when the point coincide with an existing vertex.
") IsVertex;
		Standard_Boolean IsVertex();

		/****************** NbPointOnRst ******************/
		/**** md5 signature: 6b0e2365804848717d5b6d7f5c1786eb ****/
		%feature("compactdefaultargs") NbPointOnRst;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of arc containing the extremity. if the method returns 0, the point is inside the surface. otherwise, the extremity lies on at least 1 arc, and all the information (arc, parameter, transitions) are given by the point on restriction (pointonrst) returned by the next method.
") NbPointOnRst;
		Standard_Integer NbPointOnRst();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter();

		/****************** ParameterOnGuide ******************/
		/**** md5 signature: ce20260292837a847e6ed56fcbdde050 ****/
		%feature("compactdefaultargs") ParameterOnGuide;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParameterOnGuide;
		Standard_Real ParameterOnGuide();

		/****************** Parameters ******************/
		/**** md5 signature: 24a2c71191423d4e30ed72f58cb5de87 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

Description
-----------
This method returns the parameters of the point on the concerned surface.
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** PointOnRst ******************/
		/**** md5 signature: d16a6b22823a7de41836e454c6562498 ****/
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
BRepBlend_PointOnRst

Description
-----------
No available documentation.
") PointOnRst;
		const BRepBlend_PointOnRst & PointOnRst(const Standard_Integer Index);

		/****************** SetTangent ******************/
		/**** md5 signature: fe6479f29924454154642419383f0e06 ****/
		%feature("compactdefaultargs") SetTangent;
		%feature("autodoc", "
Parameters
----------
Tangent: gp_Vec

Return
-------
None

Description
-----------
Set the tangent vector for an extremity on a surface.
") SetTangent;
		void SetTangent(const gp_Vec & Tangent);

		/****************** SetValue ******************/
		/**** md5 signature: df27ebf7b09becfcab08bed6af474b36 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
U: float
V: float
Param: float
Tol: float

Return
-------
None

Description
-----------
Set the values for an extremity on a surface.
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real U, const Standard_Real V, const Standard_Real Param, const Standard_Real Tol);

		/****************** SetValue ******************/
		/**** md5 signature: 2f52a225a20b1c127cd792dc347f9deb ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
U: float
V: float
Param: float
Tol: float
Vtx: Adaptor3d_HVertex

Return
-------
None

Description
-----------
Set the values for an extremity on a surface.this extremity matches the vertex <vtx>.
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real U, const Standard_Real V, const Standard_Real Param, const Standard_Real Tol, const opencascade::handle<Adaptor3d_HVertex> & Vtx);

		/****************** SetValue ******************/
		/**** md5 signature: 20935a61f170d6589ea40791f00aa5f3 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
W: float
Param: float
Tol: float

Return
-------
None

Description
-----------
Set the values for an extremity on curve.
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real W, const Standard_Real Param, const Standard_Real Tol);

		/****************** SetVertex ******************/
		/**** md5 signature: 1c2d847f9895dadcabe6f5a142550e35 ****/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex

Return
-------
None

Description
-----------
Set the values for an extremity on a curve.
") SetVertex;
		void SetVertex(const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** Tangent ******************/
		/**** md5 signature: 00df3077d87c39a1282b20005486cd6f ****/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
This method returns the value of tangent in 3d space.
") Tangent;
		const gp_Vec Tangent();

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
This method returns the fuzziness on the point in 3d space.
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
This method returns the value of the point in 3d space.
") Value;
		const gp_Pnt Value();

		/****************** Vertex ******************/
		/**** md5 signature: 7213fb18dc3be1f48818ab739bb98dfa ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_HVertex>

Description
-----------
Returns the vertex when isvertex returns standard_true.
") Vertex;
		const opencascade::handle<Adaptor3d_HVertex> & Vertex();

};


%extend BRepBlend_Extremity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepBlend_HCurve2dTool *
*******************************/
class BRepBlend_HCurve2dTool {
	public:
		/****************** BSpline ******************/
		/**** md5 signature: 1151b84776305bc0a5c8aaee6f50252d ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Bezier ******************/
		/**** md5 signature: 55afc4c0fc79e07de6077214558af461 ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
opencascade::handle<Geom2d_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Circle ******************/
		/**** md5 signature: 3e4b216e090c5747e712418f4fa66d2c ****/
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
No available documentation.
") Circle;
		static gp_Circ2d Circle(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Continuity ******************/
		/**** md5 signature: 93cd5f75c1ce867aba7a7f12421275f0 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		static GeomAbs_Shape Continuity(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** D0 ******************/
		/**** md5 signature: 54c6bd0c456279db2610c0ff0808eb84 ****/
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
Computes the point of parameter u on the curve.
") D0;
		static void D0(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 918bee38d3c31b02180315ab8bd4beb7 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.
") D1;
		static void D1(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		/**** md5 signature: d9e326efa98865a213fce49a3626a678 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.
") D2;
		static void D2(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 4951d7379750f8dbc9e426361fa2b365 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.
") D3;
		static void D3(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: edb6f0f7cc5bdd7864a248db788f4d84 ****/
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
The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.
") DN;
		static gp_Vec2d DN(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U, const Standard_Integer N);

		/****************** Ellipse ******************/
		/**** md5 signature: 9ddecf68838c4598b17a43e7ee186e6e ****/
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
No available documentation.
") Ellipse;
		static gp_Elips2d Ellipse(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** FirstParameter ******************/
		/**** md5 signature: a4d9a6241f0c3cafc57f60a68d9c9127 ****/
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
		static Standard_Real FirstParameter(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** GetType ******************/
		/**** md5 signature: 29ec5067d7e913f214c553444ec99b6a ****/
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
Returns the type of the curve in the current interval: line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.
") GetType;
		static GeomAbs_CurveType GetType(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Hyperbola ******************/
		/**** md5 signature: d710d90c07a9bd6c6e8e1ba3fc1c92bf ****/
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
No available documentation.
") Hyperbola;
		static gp_Hypr2d Hyperbola(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Intervals ******************/
		/**** md5 signature: 7f25b6c48f712ccc9ec416d83eb97ef8 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accommodate for the parameters. i.e. t.length() > nbintervals().
") Intervals;
		static void Intervals(const opencascade::handle<Adaptor2d_Curve2d> & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: e2e4c5d0ae21ac59c815ef761d7e7eb0 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		static Standard_Boolean IsClosed(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** IsPeriodic ******************/
		/**** md5 signature: 343c2522f84a0271d505fb5a7b6123ee ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** LastParameter ******************/
		/**** md5 signature: a84c73d5efee27b935b3bc64eba5e8ab ****/
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
		static Standard_Real LastParameter(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Line ******************/
		/**** md5 signature: cc50bf5bbcfff1340d1951ad804f481d ****/
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
No available documentation.
") Line;
		static gp_Lin2d Line(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** NbIntervals ******************/
		/**** md5 signature: 296d2d406ae6365ab4187665e47f6beb ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <s>. may be one if continuity(myclass) >= <s>.
") NbIntervals;
		static Standard_Integer NbIntervals(const opencascade::handle<Adaptor2d_Curve2d> & C, const GeomAbs_Shape S);

		/****************** NbSamples ******************/
		/**** md5 signature: 4846c46ec026f7e5cf2080eb1601445a ****/
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
		static Standard_Integer NbSamples(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U0, const Standard_Real U1);

		/****************** Parabola ******************/
		/**** md5 signature: 638d7ecde6dd9f67180eadf45347f22e ****/
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
No available documentation.
") Parabola;
		static gp_Parab2d Parabola(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Period ******************/
		/**** md5 signature: 2a78d8fc20cccabaa0fb7d52397ae7ba ****/
		%feature("compactdefaultargs") Period;
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
") Period;
		static Standard_Real Period(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Resolution ******************/
		/**** md5 signature: 1567f92dacdcdb24e1f4d21710c525e2 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
R3d: float

Return
-------
float

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <r3d>.
") Resolution;
		static Standard_Real Resolution(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real R3d);

		/****************** Value ******************/
		/**** md5 signature: f88e121e984f9cbec46065eb86a1e379 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter u on the curve.
") Value;
		static gp_Pnt2d Value(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U);

};


%extend BRepBlend_HCurve2dTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepBlend_HCurveTool *
*****************************/
class BRepBlend_HCurveTool {
	public:
		/****************** BSpline ******************/
		/**** md5 signature: 73295d8773f31004aa0bf55b549ab48f ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom_BSplineCurve> BSpline(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Bezier ******************/
		/**** md5 signature: f306f8462315905af8e276236266123d ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom_BezierCurve> Bezier(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Circle ******************/
		/**** md5 signature: 7b6731a5a54fc11dc51059ac04fa7d96 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		static gp_Circ Circle(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Continuity ******************/
		/**** md5 signature: 36a22861c63402bce70a44cade7cd4e2 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		static GeomAbs_Shape Continuity(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** D0 ******************/
		/**** md5 signature: 8132d18251425c9a08facd1890d4dc14 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameter u on the curve.
") D0;
		static void D0(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: e2eff93238cd61643a22155760ca87e7 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.
") D1;
		static void D1(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** D2 ******************/
		/**** md5 signature: a03fec54dc9fb384b49128be1eeb6ab5 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.
") D2;
		static void D2(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		/**** md5 signature: daf7fd27ce53952002a95005add4c7db ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.
") D3;
		static void D3(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		/**** md5 signature: 19abd9a6442d6a3469d8f9590507387e ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.
") DN;
		static gp_Vec DN(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, const Standard_Integer N);

		/****************** Ellipse ******************/
		/**** md5 signature: c32c615877d264a7d9a959c38c10dac5 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		static gp_Elips Ellipse(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** FirstParameter ******************/
		/**** md5 signature: 25c42492a02c6ff0b57c4cf91fb40f86 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		static Standard_Real FirstParameter(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** GetType ******************/
		/**** md5 signature: a686bd836352e7b0b82151881246c5a7 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.
") GetType;
		static GeomAbs_CurveType GetType(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Hyperbola ******************/
		/**** md5 signature: d833c49b900f354e019cfd82c1b21d0e ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Hyperbola;
		static gp_Hypr Hyperbola(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Intervals ******************/
		/**** md5 signature: ba9ef7becad6f3e6ee434061971db40d ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accommodate for the parameters. i.e. t.length() > nbintervals().
") Intervals;
		static void Intervals(const opencascade::handle<Adaptor3d_Curve> & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: 178cf2cfae4002c04a5499797f8bd656 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		static Standard_Boolean IsClosed(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** IsPeriodic ******************/
		/**** md5 signature: d48777dd4aacf834a3350873acc52ff6 ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** LastParameter ******************/
		/**** md5 signature: c00409255c9efae31d007ea0f35327b6 ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		static Standard_Real LastParameter(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Line ******************/
		/**** md5 signature: 5d669526ea2c83636bcd5abea25c7993 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		static gp_Lin Line(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** NbIntervals ******************/
		/**** md5 signature: 14a07173bd3c33d26deeb9707ee34cb3 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <s>. may be one if continuity(myclass) >= <s>.
") NbIntervals;
		static Standard_Integer NbIntervals(const opencascade::handle<Adaptor3d_Curve> & C, const GeomAbs_Shape S);

		/****************** NbSamples ******************/
		/**** md5 signature: b050222a5e2dbdd07a79f2aec3a93db5 ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U0: float
U1: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static Standard_Integer NbSamples(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U0, const Standard_Real U1);

		/****************** Parabola ******************/
		/**** md5 signature: cc30b6b7d2e5eb272de9d92bc65e5ba5 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
gp_Parab

Description
-----------
No available documentation.
") Parabola;
		static gp_Parab Parabola(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Period ******************/
		/**** md5 signature: f7986452fbb7b824f9223306a3748bb0 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
float

Description
-----------
No available documentation.
") Period;
		static Standard_Real Period(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Resolution ******************/
		/**** md5 signature: 5b1954ce6b6bbeec3732ad23161bfe7f ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
R3d: float

Return
-------
float

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <r3d>.
") Resolution;
		static Standard_Real Resolution(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real R3d);

		/****************** Value ******************/
		/**** md5 signature: 2a733041fbe29fa56e33746589b73c76 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter u on the curve.
") Value;
		static gp_Pnt Value(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U);

};


%extend BRepBlend_HCurveTool {
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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_Line;
		 BRepBlend_Line();

		/****************** Append ******************/
		/**** md5 signature: 112809d39d79c49d6bb13a4922e5b5f5 ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point

Return
-------
None

Description
-----------
Adds a point in the line.
") Append;
		void Append(const Blend_Point & P);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the line.
") Clear;
		void Clear();

		/****************** EndPointOnFirst ******************/
		/**** md5 signature: c529fd184b9e50e1b6ee45bff61b3c9b ****/
		%feature("compactdefaultargs") EndPointOnFirst;
		%feature("autodoc", "Return
-------
BRepBlend_Extremity

Description
-----------
Returns the end point on s1.
") EndPointOnFirst;
		const BRepBlend_Extremity & EndPointOnFirst();

		/****************** EndPointOnSecond ******************/
		/**** md5 signature: f1a00edceae5b932c1068ab023d5ec57 ****/
		%feature("compactdefaultargs") EndPointOnSecond;
		%feature("autodoc", "Return
-------
BRepBlend_Extremity

Description
-----------
Returns the point on s2.
") EndPointOnSecond;
		const BRepBlend_Extremity & EndPointOnSecond();

		/****************** InsertBefore ******************/
		/**** md5 signature: d3fd33dd9ac7a98f0ee2bf360431c1c4 ****/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
Index: int
P: Blend_Point

Return
-------
None

Description
-----------
Adds a point in the line at the first place.
") InsertBefore;
		void InsertBefore(const Standard_Integer Index, const Blend_Point & P);

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points in the line.
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		/**** md5 signature: f9ecb741c9f8196ebb5c0c795ecf9f95 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Blend_Point

Description
-----------
Returns the point of range index.
") Point;
		const Blend_Point & Point(const Standard_Integer Index);

		/****************** Prepend ******************/
		/**** md5 signature: 8ea9df6ce05089f4fae42845b69291ef ****/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point

Return
-------
None

Description
-----------
Adds a point in the line at the first place.
") Prepend;
		void Prepend(const Blend_Point & P);

		/****************** Remove ******************/
		/**** md5 signature: af46d5b5d8f27ae951629b321df10b36 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
FromIndex: int
ToIndex: int

Return
-------
None

Description
-----------
Removes from <self> all the items of positions between <fromindex> and <toindex>. raises an exception if the indices are out of bounds.
") Remove;
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

		/****************** Set ******************/
		/**** md5 signature: 467e8a8ca95b56d13e0b5d0ef5daa15d ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
TranS1: IntSurf_TypeTrans
TranS2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Sets the value of the transition of the line on s1 and the line on s2.
") Set;
		void Set(const IntSurf_TypeTrans TranS1, const IntSurf_TypeTrans TranS2);

		/****************** Set ******************/
		/**** md5 signature: 02e3bdb87daf70bb37bf9aaefbeafc93 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Trans: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Sets the value of the transition of the line on a surface.
") Set;
		void Set(const IntSurf_TypeTrans Trans);

		/****************** SetEndPoints ******************/
		/**** md5 signature: 65a8d0dfaf022584d756eabf06874704 ****/
		%feature("compactdefaultargs") SetEndPoints;
		%feature("autodoc", "
Parameters
----------
EndPt1: BRepBlend_Extremity
EndPt2: BRepBlend_Extremity

Return
-------
None

Description
-----------
Sets tne values of the end points for the line.
") SetEndPoints;
		void SetEndPoints(const BRepBlend_Extremity & EndPt1, const BRepBlend_Extremity & EndPt2);

		/****************** SetStartPoints ******************/
		/**** md5 signature: 855f4d4c44344953d7a9de9123e71157 ****/
		%feature("compactdefaultargs") SetStartPoints;
		%feature("autodoc", "
Parameters
----------
StartPt1: BRepBlend_Extremity
StartPt2: BRepBlend_Extremity

Return
-------
None

Description
-----------
Sets the values of the start points for the line.
") SetStartPoints;
		void SetStartPoints(const BRepBlend_Extremity & StartPt1, const BRepBlend_Extremity & StartPt2);

		/****************** StartPointOnFirst ******************/
		/**** md5 signature: eb6cbb694252afa50c3045ff6839418c ****/
		%feature("compactdefaultargs") StartPointOnFirst;
		%feature("autodoc", "Return
-------
BRepBlend_Extremity

Description
-----------
Returns the start point on s1.
") StartPointOnFirst;
		const BRepBlend_Extremity & StartPointOnFirst();

		/****************** StartPointOnSecond ******************/
		/**** md5 signature: 152e6eaee5b76910bd5605ccb0d2a63a ****/
		%feature("compactdefaultargs") StartPointOnSecond;
		%feature("autodoc", "Return
-------
BRepBlend_Extremity

Description
-----------
Returns the start point on s2.
") StartPointOnSecond;
		const BRepBlend_Extremity & StartPointOnSecond();

		/****************** TransitionOnS ******************/
		/**** md5 signature: ac2f27afdd16ab93ea1f959cb2bf6e33 ****/
		%feature("compactdefaultargs") TransitionOnS;
		%feature("autodoc", "Return
-------
IntSurf_TypeTrans

Description
-----------
Returns the type of the transition of the line defined on the surface.
") TransitionOnS;
		IntSurf_TypeTrans TransitionOnS();

		/****************** TransitionOnS1 ******************/
		/**** md5 signature: 9de184f3b47c2902be7de5eb10743898 ****/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "Return
-------
IntSurf_TypeTrans

Description
-----------
Returns the type of the transition of the line defined on the first surface. the transition is 'constant' along the line. the transition is in if the line is oriented in such a way that the system of vectors (n,drac,t) is right-handed, where n is the normal to the first surface at a point p, drac is a vector tangent to the blending patch, oriented towards the valid part of this patch, t is the tangent to the line on s1 at p. the transitioon is out when the system of vectors is left-handed.
") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1();

		/****************** TransitionOnS2 ******************/
		/**** md5 signature: aafa064949332278d0d49be3da4c6df2 ****/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "Return
-------
IntSurf_TypeTrans

Description
-----------
Returns the type of the transition of the line defined on the second surface. the transition is 'constant' along the line.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepBlend_PointOnRst;
		 BRepBlend_PointOnRst();

		/****************** BRepBlend_PointOnRst ******************/
		/**** md5 signature: 8111ef27057565050ebf55e9c0cf6987 ****/
		%feature("compactdefaultargs") BRepBlend_PointOnRst;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d
Param: float
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Return
-------
None

Description
-----------
Creates the pointonrst on the arc a, at parameter param, with the transition tline on the walking line, and tarc on the arc a.
") BRepBlend_PointOnRst;
		 BRepBlend_PointOnRst(const opencascade::handle<Adaptor2d_Curve2d> & A, const Standard_Real Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****************** Arc ******************/
		/**** md5 signature: de8e47510fc50811ee5a3e0bc98029e6 ****/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the arc of restriction containing the vertex.
") Arc;
		const opencascade::handle<Adaptor2d_Curve2d> & Arc();

		/****************** ParameterOnArc ******************/
		/**** md5 signature: 53d2051734836b1f3c7d9edd7c3c1884 ****/
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter of the point on the arc returned by the method arc().
") ParameterOnArc;
		Standard_Real ParameterOnArc();

		/****************** SetArc ******************/
		/**** md5 signature: ceabf78102f113c25de4b4f678682f05 ****/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d
Param: float
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Return
-------
None

Description
-----------
Sets the values of a point which is on the arc a, at parameter param.
") SetArc;
		void SetArc(const opencascade::handle<Adaptor2d_Curve2d> & A, const Standard_Real Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****************** TransitionOnArc ******************/
		/**** md5 signature: adc9ee508ec8cbe59ce8b05248cd454a ****/
		%feature("compactdefaultargs") TransitionOnArc;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
Returns the transition of the point on the arc returned by arc().
") TransitionOnArc;
		const IntSurf_Transition & TransitionOnArc();

		/****************** TransitionOnLine ******************/
		/**** md5 signature: 1ffbcf064eb110daaac7ceebff0fcde5 ****/
		%feature("compactdefaultargs") TransitionOnLine;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
Returns the transition of the point on the line on surface.
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
		/**** md5 signature: 074ead157514803251d86880fa21933a ****/
		%feature("compactdefaultargs") BRepBlend_RstRstConstRad;
		%feature("autodoc", "
Parameters
----------
Surf1: Adaptor3d_Surface
Rst1: Adaptor2d_Curve2d
Surf2: Adaptor3d_Surface
Rst2: Adaptor2d_Curve2d
CGuide: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_RstRstConstRad;
		 BRepBlend_RstRstConstRad(const opencascade::handle<Adaptor3d_Surface> & Surf1, const opencascade::handle<Adaptor2d_Curve2d> & Rst1, const opencascade::handle<Adaptor3d_Surface> & Surf2, const opencascade::handle<Adaptor2d_Curve2d> & Rst2, const opencascade::handle<Adaptor3d_Curve> & CGuide);

		/****************** CenterCircleRst1Rst2 ******************/
		/**** md5 signature: 78a3b5ae21381e7c60ec45458e50cd49 ****/
		%feature("compactdefaultargs") CenterCircleRst1Rst2;
		%feature("autodoc", "
Parameters
----------
PtRst1: gp_Pnt
PtRst2: gp_Pnt
np: gp_Vec
Center: gp_Pnt
VdMed: gp_Vec

Return
-------
bool

Description
-----------
Give the center of circle define by ptrst1, ptrst2 and radius ray.
") CenterCircleRst1Rst2;
		Standard_Boolean CenterCircleRst1Rst2(const gp_Pnt & PtRst1, const gp_Pnt & PtRst2, const gp_Vec & np, gp_Pnt & Center, gp_Vec & VdMed);

		/****************** Decroch ******************/
		/**** md5 signature: 4fb28916dc7b56fca32714bd732ca6a6 ****/
		%feature("compactdefaultargs") Decroch;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
NRst1: gp_Vec
TgRst1: gp_Vec
NRst2: gp_Vec
TgRst2: gp_Vec

Return
-------
Blend_DecrochStatus

Description
-----------
Permet d ' implementer un critere de decrochage specifique a la fonction.
") Decroch;
		Blend_DecrochStatus Decroch(const math_Vector & Sol, gp_Vec & NRst1, gp_Vec & TgRst1, gp_Vec & NRst2, gp_Vec & TgRst2);

		/****************** Derivatives ******************/
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		/**** md5 signature: b7112b2680da59932f7cc20412f85fda ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimal distance between two extremities of calculated sections.
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ****/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ****/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int

Description
-----------
No available documentation.
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		/**** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary surftol error inside the surface.
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <t> the parameters bounding the intervals of continuity <s>. the array must provide enough room to accommodate for the parameters. i.e. t.length() > nbintervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rationnal.
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		/**** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: a226854cd9eac08cbe4282feaa46c20d ****/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		/**** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ****/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 2.
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbVariables ******************/
		/**** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 2.
") NbVariables;
		Standard_Integer NbVariables();

		/****************** ParameterOnRst1 ******************/
		/**** md5 signature: 284ae0a0f8af30bf10c1a23ce2f6a2b9 ****/
		%feature("compactdefaultargs") ParameterOnRst1;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst1;
		Standard_Real ParameterOnRst1();

		/****************** ParameterOnRst2 ******************/
		/**** md5 signature: 9bf0d1865174810cd35d339e1b11149f ****/
		%feature("compactdefaultargs") ParameterOnRst2;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst2;
		Standard_Real ParameterOnRst2();

		/****************** Pnt2dOnRst1 ******************/
		/**** md5 signature: 8af792b525778d9f7163716d45fcb20c ****/
		%feature("compactdefaultargs") Pnt2dOnRst1;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns u,v coordinates of the point on the surface.
") Pnt2dOnRst1;
		const gp_Pnt2d Pnt2dOnRst1();

		/****************** Pnt2dOnRst2 ******************/
		/**** md5 signature: b5f740f46476c4024b7987481feaf13c ****/
		%feature("compactdefaultargs") Pnt2dOnRst2;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns u,v coordinates of the point on the curve on surface.
") Pnt2dOnRst2;
		const gp_Pnt2d Pnt2dOnRst2();

		/****************** PointOnRst1 ******************/
		/**** md5 signature: 762cc38df03d874429dc79602cf45538 ****/
		%feature("compactdefaultargs") PointOnRst1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnRst1;
		const gp_Pnt PointOnRst1();

		/****************** PointOnRst2 ******************/
		/**** md5 signature: 2b807e562845e47d1e518bf057be180a ****/
		%feature("compactdefaultargs") PointOnRst2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnRst2;
		const gp_Pnt PointOnRst2();

		/****************** Resolution ******************/
		/**** md5 signature: 1f885646df74c72ec13d37a113377aaa ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
		/**** md5 signature: 5902809a8ef9b0367b5849f8615d68f9 ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: float
U: float
V: float
C: gp_Circ

Return
-------
Pdeb: float
Pfin: float

Description
-----------
No available documentation.
") Section;
		void Section(const Standard_Real Param, const Standard_Real U, const Standard_Real V, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****************** Section ******************/
		/**** md5 signature: 906e6a4bef3056546e496b945ff8d788 ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** Section ******************/
		/**** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Section ******************/
		/**** md5 signature: b6f1107f21a9bc6524bdd8152abaed5f ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
Used for the first and last section the method returns standard_true if the derivatives are computed, otherwise it returns standard_false.
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** Set ******************/
		/**** md5 signature: 1d39a94f99a01338cb8afa4a49c68510 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
SurfRef1: Adaptor3d_Surface
RstRef1: Adaptor2d_Curve2d
SurfRef2: Adaptor3d_Surface
RstRef2: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<Adaptor3d_Surface> & SurfRef1, const opencascade::handle<Adaptor2d_Curve2d> & RstRef1, const opencascade::handle<Adaptor3d_Surface> & SurfRef2, const opencascade::handle<Adaptor2d_Curve2d> & RstRef2);

		/****************** Set ******************/
		/**** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		/**** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the guide line. this determines the derivatives in these values if the function is not cn.
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Set ******************/
		/**** md5 signature: 99fe75aea7947575eb6b646d1797f9da ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Radius: float
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Radius, const Standard_Integer Choix);

		/****************** Set ******************/
		/**** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
TypeSection: BlendFunc_SectionShape

Return
-------
None

Description
-----------
Sets the type of section generation for the approximations.
") Set;
		void Set(const BlendFunc_SectionShape TypeSection);

		/****************** Tangent2dOnRst1 ******************/
		/**** md5 signature: 8853e0bdcfc4c7ae918b4ce4afe10bf7 ****/
		%feature("compactdefaultargs") Tangent2dOnRst1;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnRst1;
		const gp_Vec2d Tangent2dOnRst1();

		/****************** Tangent2dOnRst2 ******************/
		/**** md5 signature: 7efc7e62e5cd2cb55222b8f92787707b ****/
		%feature("compactdefaultargs") Tangent2dOnRst2;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnRst2;
		const gp_Vec2d Tangent2dOnRst2();

		/****************** TangentOnRst1 ******************/
		/**** md5 signature: 1e84fceeab2344ba6b579f62eddd47b2 ****/
		%feature("compactdefaultargs") TangentOnRst1;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnRst1;
		const gp_Vec TangentOnRst1();

		/****************** TangentOnRst2 ******************/
		/**** md5 signature: 3441edf62ea8bd65204990029d82b25d ****/
		%feature("compactdefaultargs") TangentOnRst2;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnRst2;
		const gp_Vec TangentOnRst2();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.
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
		/**** md5 signature: d79d517ef0e965cc32a0fc12487d3855 ****/
		%feature("compactdefaultargs") BRepBlend_RstRstEvolRad;
		%feature("autodoc", "
Parameters
----------
Surf1: Adaptor3d_Surface
Rst1: Adaptor2d_Curve2d
Surf2: Adaptor3d_Surface
Rst2: Adaptor2d_Curve2d
CGuide: Adaptor3d_Curve
Evol: Law_Function

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_RstRstEvolRad;
		 BRepBlend_RstRstEvolRad(const opencascade::handle<Adaptor3d_Surface> & Surf1, const opencascade::handle<Adaptor2d_Curve2d> & Rst1, const opencascade::handle<Adaptor3d_Surface> & Surf2, const opencascade::handle<Adaptor2d_Curve2d> & Rst2, const opencascade::handle<Adaptor3d_Curve> & CGuide, const opencascade::handle<Law_Function> & Evol);

		/****************** CenterCircleRst1Rst2 ******************/
		/**** md5 signature: 78a3b5ae21381e7c60ec45458e50cd49 ****/
		%feature("compactdefaultargs") CenterCircleRst1Rst2;
		%feature("autodoc", "
Parameters
----------
PtRst1: gp_Pnt
PtRst2: gp_Pnt
np: gp_Vec
Center: gp_Pnt
VdMed: gp_Vec

Return
-------
bool

Description
-----------
Gives the center of circle defined by ptrst1, ptrst2 and radius ray.
") CenterCircleRst1Rst2;
		Standard_Boolean CenterCircleRst1Rst2(const gp_Pnt & PtRst1, const gp_Pnt & PtRst2, const gp_Vec & np, gp_Pnt & Center, gp_Vec & VdMed);

		/****************** Decroch ******************/
		/**** md5 signature: 4fb28916dc7b56fca32714bd732ca6a6 ****/
		%feature("compactdefaultargs") Decroch;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
NRst1: gp_Vec
TgRst1: gp_Vec
NRst2: gp_Vec
TgRst2: gp_Vec

Return
-------
Blend_DecrochStatus

Description
-----------
Enables implementation of a criterion of decrochage specific to the function.
") Decroch;
		Blend_DecrochStatus Decroch(const math_Vector & Sol, gp_Vec & NRst1, gp_Vec & TgRst1, gp_Vec & NRst2, gp_Vec & TgRst2);

		/****************** Derivatives ******************/
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		/**** md5 signature: b7112b2680da59932f7cc20412f85fda ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimal distance between two extremities of calculated sections.
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ****/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ****/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int

Description
-----------
No available documentation.
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		/**** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary surftol error inside the surface.
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <t> the parameters bounding the intervals of continuity <s>. the array must provide enough room to accommodate for the parameters. i.e. t.length() > nbintervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rationnal.
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		/**** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: a226854cd9eac08cbe4282feaa46c20d ****/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		/**** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ****/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 2.
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbVariables ******************/
		/**** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 2.
") NbVariables;
		Standard_Integer NbVariables();

		/****************** ParameterOnRst1 ******************/
		/**** md5 signature: 284ae0a0f8af30bf10c1a23ce2f6a2b9 ****/
		%feature("compactdefaultargs") ParameterOnRst1;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst1;
		Standard_Real ParameterOnRst1();

		/****************** ParameterOnRst2 ******************/
		/**** md5 signature: 9bf0d1865174810cd35d339e1b11149f ****/
		%feature("compactdefaultargs") ParameterOnRst2;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst2;
		Standard_Real ParameterOnRst2();

		/****************** Pnt2dOnRst1 ******************/
		/**** md5 signature: 8af792b525778d9f7163716d45fcb20c ****/
		%feature("compactdefaultargs") Pnt2dOnRst1;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns u,v coordinates of the point on the surface.
") Pnt2dOnRst1;
		const gp_Pnt2d Pnt2dOnRst1();

		/****************** Pnt2dOnRst2 ******************/
		/**** md5 signature: b5f740f46476c4024b7987481feaf13c ****/
		%feature("compactdefaultargs") Pnt2dOnRst2;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns u,v coordinates of the point on the curve on surface.
") Pnt2dOnRst2;
		const gp_Pnt2d Pnt2dOnRst2();

		/****************** PointOnRst1 ******************/
		/**** md5 signature: 762cc38df03d874429dc79602cf45538 ****/
		%feature("compactdefaultargs") PointOnRst1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnRst1;
		const gp_Pnt PointOnRst1();

		/****************** PointOnRst2 ******************/
		/**** md5 signature: 2b807e562845e47d1e518bf057be180a ****/
		%feature("compactdefaultargs") PointOnRst2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnRst2;
		const gp_Pnt PointOnRst2();

		/****************** Resolution ******************/
		/**** md5 signature: 1f885646df74c72ec13d37a113377aaa ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
		/**** md5 signature: 5902809a8ef9b0367b5849f8615d68f9 ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: float
U: float
V: float
C: gp_Circ

Return
-------
Pdeb: float
Pfin: float

Description
-----------
No available documentation.
") Section;
		void Section(const Standard_Real Param, const Standard_Real U, const Standard_Real V, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****************** Section ******************/
		/**** md5 signature: 906e6a4bef3056546e496b945ff8d788 ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** Section ******************/
		/**** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Section ******************/
		/**** md5 signature: b6f1107f21a9bc6524bdd8152abaed5f ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
Used for the first and last section the method returns standard_true if the derivatives are computed, otherwise it returns standard_false.
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** Set ******************/
		/**** md5 signature: 1d39a94f99a01338cb8afa4a49c68510 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
SurfRef1: Adaptor3d_Surface
RstRef1: Adaptor2d_Curve2d
SurfRef2: Adaptor3d_Surface
RstRef2: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<Adaptor3d_Surface> & SurfRef1, const opencascade::handle<Adaptor2d_Curve2d> & RstRef1, const opencascade::handle<Adaptor3d_Surface> & SurfRef2, const opencascade::handle<Adaptor2d_Curve2d> & RstRef2);

		/****************** Set ******************/
		/**** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		/**** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the guide line. this determines the derivatives in these values if the function is not cn.
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Set ******************/
		/**** md5 signature: d73c9c4058c0955fc8cd59888660f750 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Integer Choix);

		/****************** Set ******************/
		/**** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
TypeSection: BlendFunc_SectionShape

Return
-------
None

Description
-----------
Sets the type of section generation for the approximations.
") Set;
		void Set(const BlendFunc_SectionShape TypeSection);

		/****************** Tangent2dOnRst1 ******************/
		/**** md5 signature: 8853e0bdcfc4c7ae918b4ce4afe10bf7 ****/
		%feature("compactdefaultargs") Tangent2dOnRst1;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnRst1;
		const gp_Vec2d Tangent2dOnRst1();

		/****************** Tangent2dOnRst2 ******************/
		/**** md5 signature: 7efc7e62e5cd2cb55222b8f92787707b ****/
		%feature("compactdefaultargs") Tangent2dOnRst2;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnRst2;
		const gp_Vec2d Tangent2dOnRst2();

		/****************** TangentOnRst1 ******************/
		/**** md5 signature: 1e84fceeab2344ba6b579f62eddd47b2 ****/
		%feature("compactdefaultargs") TangentOnRst1;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnRst1;
		const gp_Vec TangentOnRst1();

		/****************** TangentOnRst2 ******************/
		/**** md5 signature: 3441edf62ea8bd65204990029d82b25d ****/
		%feature("compactdefaultargs") TangentOnRst2;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnRst2;
		const gp_Vec TangentOnRst2();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.
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
		/**** md5 signature: 0fa89a48d67b7f761c8ed2cee361f92f ****/
		%feature("compactdefaultargs") BRepBlend_RstRstLineBuilder;
		%feature("autodoc", "
Parameters
----------
Surf1: Adaptor3d_Surface
Rst1: Adaptor2d_Curve2d
Domain1: Adaptor3d_TopolTool
Surf2: Adaptor3d_Surface
Rst2: Adaptor2d_Curve2d
Domain2: Adaptor3d_TopolTool

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_RstRstLineBuilder;
		 BRepBlend_RstRstLineBuilder(const opencascade::handle<Adaptor3d_Surface> & Surf1, const opencascade::handle<Adaptor2d_Curve2d> & Rst1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_Surface> & Surf2, const opencascade::handle<Adaptor2d_Curve2d> & Rst2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2);

		/****************** Complete ******************/
		/**** md5 signature: 826dcd81a620ed85f35c4d4dbd7bd8a7 ****/
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "
Parameters
----------
Func: Blend_RstRstFunction
Finv1: Blend_SurfCurvFuncInv
FinvP1: Blend_CurvPointFuncInv
Finv2: Blend_SurfCurvFuncInv
FinvP2: Blend_CurvPointFuncInv
Pmin: float

Return
-------
bool

Description
-----------
No available documentation.
") Complete;
		Standard_Boolean Complete(Blend_RstRstFunction & Func, Blend_SurfCurvFuncInv & Finv1, Blend_CurvPointFuncInv & FinvP1, Blend_SurfCurvFuncInv & Finv2, Blend_CurvPointFuncInv & FinvP2, const Standard_Real Pmin);

		/****************** Decroch1End ******************/
		/**** md5 signature: f6913d316d5accdf3a84bcfda7bb27e1 ****/
		%feature("compactdefaultargs") Decroch1End;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Decroch1End;
		Standard_Boolean Decroch1End();

		/****************** Decroch1Start ******************/
		/**** md5 signature: 85d7bc2d23e235ee8c224332022e89d2 ****/
		%feature("compactdefaultargs") Decroch1Start;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Decroch1Start;
		Standard_Boolean Decroch1Start();

		/****************** Decroch2End ******************/
		/**** md5 signature: 598323a82cc53d7940e82a44b6268b22 ****/
		%feature("compactdefaultargs") Decroch2End;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Decroch2End;
		Standard_Boolean Decroch2End();

		/****************** Decroch2Start ******************/
		/**** md5 signature: 933f9277fcaba02302f7dbc9d24a34c4 ****/
		%feature("compactdefaultargs") Decroch2Start;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Decroch2Start;
		Standard_Boolean Decroch2Start();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		/**** md5 signature: 9bbdb2164431d955d7a3a08a37fd239f ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepBlend_Line>

Description
-----------
No available documentation.
") Line;
		const opencascade::handle<BRepBlend_Line> & Line();

		/****************** Perform ******************/
		/**** md5 signature: 5c6445d58f45808f7c3defd1db894a35 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
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
Tol3d: float
TolGuide: float
Soldep: math_Vector
Fleche: float
Appro: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(Blend_RstRstFunction & Func, Blend_SurfCurvFuncInv & Finv1, Blend_CurvPointFuncInv & FinvP1, Blend_SurfCurvFuncInv & Finv2, Blend_CurvPointFuncInv & FinvP2, const Standard_Real Pdep, const Standard_Real Pmax, const Standard_Real MaxStep, const Standard_Real Tol3d, const Standard_Real TolGuide, const math_Vector & Soldep, const Standard_Real Fleche, const Standard_Boolean Appro = Standard_False);

		/****************** PerformFirstSection ******************/
		/**** md5 signature: 452fb9b79df54fb801f2f70d066f611b ****/
		%feature("compactdefaultargs") PerformFirstSection;
		%feature("autodoc", "
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
Tol3d: float
TolGuide: float
RecRst1: bool
RecP1: bool
RecRst2: bool
RecP2: bool
ParSol: math_Vector

Return
-------
Psol: float

Description
-----------
No available documentation.
") PerformFirstSection;
		Standard_Boolean PerformFirstSection(Blend_RstRstFunction & Func, Blend_SurfCurvFuncInv & Finv1, Blend_CurvPointFuncInv & FinvP1, Blend_SurfCurvFuncInv & Finv2, Blend_CurvPointFuncInv & FinvP2, const Standard_Real Pdep, const Standard_Real Pmax, const math_Vector & Soldep, const Standard_Real Tol3d, const Standard_Real TolGuide, const Standard_Boolean RecRst1, const Standard_Boolean RecP1, const Standard_Boolean RecRst2, const Standard_Boolean RecP2, Standard_Real &OutValue, math_Vector & ParSol);

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
		/**** md5 signature: 413667a5e3be555bb1567d000f5c37ac ****/
		%feature("compactdefaultargs") BRepBlend_SurfCurvConstRadInv;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
C: Adaptor3d_Curve
Cg: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_SurfCurvConstRadInv;
		 BRepBlend_SurfCurvConstRadInv(const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Curve> & C, const opencascade::handle<Adaptor3d_Curve> & Cg);

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
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
Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: 73d101c74e718085b2fc8de28383bce3 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
Returns in the vector infbound the lowest values allowed for each of the 3 variables. returns in the vector supbound the greatest values allowed for each of the 3 variables.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		/**** md5 signature: 463e2084f8f6e4a4f87c36de6e9fd9c6 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
Returns in the vector tolerance the parametric tolerance for each of the 3 variables; tol is the tolerance used in 3d space.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		/**** md5 signature: 0884df902635922234b529dc88a260b5 ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		/**** md5 signature: 941166ee1a941569b8be371b05e6b601 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
R: float
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real R, const Standard_Integer Choix);

		/****************** Set ******************/
		/**** md5 signature: 1568bac490950a9b21e695223201919a ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Rst: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
Set the restriction on which a solution has to be found.
") Set;
		void Set(const opencascade::handle<Adaptor2d_Curve2d> & Rst);

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
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
Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
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
Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.
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
		/**** md5 signature: f4c992f2047ba724a04cb63a1497cb15 ****/
		%feature("compactdefaultargs") BRepBlend_SurfCurvEvolRadInv;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
C: Adaptor3d_Curve
Cg: Adaptor3d_Curve
Evol: Law_Function

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_SurfCurvEvolRadInv;
		 BRepBlend_SurfCurvEvolRadInv(const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Curve> & C, const opencascade::handle<Adaptor3d_Curve> & Cg, const opencascade::handle<Law_Function> & Evol);

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
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
Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: 73d101c74e718085b2fc8de28383bce3 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
Returns in the vector infbound the lowest values allowed for each of the 3 variables. returns in the vector supbound the greatest values allowed for each of the 3 variables.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		/**** md5 signature: 463e2084f8f6e4a4f87c36de6e9fd9c6 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
Returns in the vector tolerance the parametric tolerance for each of the 3 variables; tol is the tolerance used in 3d space.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		/**** md5 signature: 0884df902635922234b529dc88a260b5 ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		/**** md5 signature: d73c9c4058c0955fc8cd59888660f750 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Integer Choix);

		/****************** Set ******************/
		/**** md5 signature: 1568bac490950a9b21e695223201919a ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Rst: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
Set the restriction on which a solution has to be found.
") Set;
		void Set(const opencascade::handle<Adaptor2d_Curve2d> & Rst);

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
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
Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
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
Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.
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
		/**** md5 signature: 993f0d82d4c56cde29f6ef73aee3531d ****/
		%feature("compactdefaultargs") BRepBlend_SurfPointConstRadInv;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_SurfPointConstRadInv;
		 BRepBlend_SurfPointConstRadInv(const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
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
Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: 73d101c74e718085b2fc8de28383bce3 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
Returns in the vector infbound the lowest values allowed for each of the 3 variables. returns in the vector supbound the greatest values allowed for each of the 3 variables.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		/**** md5 signature: 463e2084f8f6e4a4f87c36de6e9fd9c6 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
Returns in the vector tolerance the parametric tolerance for each of the 3 variables; tol is the tolerance used in 3d space.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		/**** md5 signature: 0884df902635922234b529dc88a260b5 ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		/**** md5 signature: 941166ee1a941569b8be371b05e6b601 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
R: float
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real R, const Standard_Integer Choix);

		/****************** Set ******************/
		/**** md5 signature: db883cf63ff497749765a1588d5f0509 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Set the point on which a solution has to be found.
") Set;
		void Set(const gp_Pnt & P);

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
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
Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
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
Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.
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
		/**** md5 signature: f3eea577ae1852a9a7135e6772c85ac4 ****/
		%feature("compactdefaultargs") BRepBlend_SurfPointEvolRadInv;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
C: Adaptor3d_Curve
Evol: Law_Function

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_SurfPointEvolRadInv;
		 BRepBlend_SurfPointEvolRadInv(const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Curve> & C, const opencascade::handle<Law_Function> & Evol);

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
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
Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: 73d101c74e718085b2fc8de28383bce3 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
Returns in the vector infbound the lowest values allowed for each of the 3 variables. returns in the vector supbound the greatest values allowed for each of the 3 variables.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetTolerance ******************/
		/**** md5 signature: 463e2084f8f6e4a4f87c36de6e9fd9c6 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
Returns in the vector tolerance the parametric tolerance for each of the 3 variables; tol is the tolerance used in 3d space.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** IsSolution ******************/
		/**** md5 signature: 0884df902635922234b529dc88a260b5 ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
Returns standard_true if sol is a zero of the function. tol is the tolerance used in 3d space.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** NbEquations ******************/
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbEquations;
		Standard_Integer NbEquations();

		/****************** Set ******************/
		/**** md5 signature: d73c9c4058c0955fc8cd59888660f750 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Integer Choix);

		/****************** Set ******************/
		/**** md5 signature: db883cf63ff497749765a1588d5f0509 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Set the point on which a solution has to be found.
") Set;
		void Set(const gp_Pnt & P);

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
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
Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
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
Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.
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
		/**** md5 signature: 61178a969de9578c5b02b8a945a3f459 ****/
		%feature("compactdefaultargs") BRepBlend_SurfRstConstRad;
		%feature("autodoc", "
Parameters
----------
Surf: Adaptor3d_Surface
SurfRst: Adaptor3d_Surface
Rst: Adaptor2d_Curve2d
CGuide: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_SurfRstConstRad;
		 BRepBlend_SurfRstConstRad(const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_Surface> & SurfRst, const opencascade::handle<Adaptor2d_Curve2d> & Rst, const opencascade::handle<Adaptor3d_Curve> & CGuide);

		/****************** Decroch ******************/
		/**** md5 signature: 7b97fab9290fe599257ab8ce84870242 ****/
		%feature("compactdefaultargs") Decroch;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
NS: gp_Vec
TgS: gp_Vec

Return
-------
bool

Description
-----------
Enables implementation of a criterion of decrochage specific to the function. warning: can be called without previous call of issolution but the values calculated can be senseless.
") Decroch;
		Standard_Boolean Decroch(const math_Vector & Sol, gp_Vec & NS, gp_Vec & TgS);

		/****************** Derivatives ******************/
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		/**** md5 signature: b7112b2680da59932f7cc20412f85fda ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimal distance between two extremities of calculated sections.
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ****/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ****/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int

Description
-----------
No available documentation.
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		/**** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary surftol error inside the surface.
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <t> the parameters bounding the intervals of continuity <s>. the array must provide enough room to accommodate for the parameters. i.e. t.length() > nbintervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rationnal.
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		/**** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: a226854cd9eac08cbe4282feaa46c20d ****/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		/**** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ****/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbVariables ******************/
		/**** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbVariables;
		Standard_Integer NbVariables();

		/****************** ParameterOnRst ******************/
		/**** md5 signature: 7e31a9a50b0e16d757ff5e9a2545014c ****/
		%feature("compactdefaultargs") ParameterOnRst;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst;
		Standard_Real ParameterOnRst();

		/****************** Pnt2dOnRst ******************/
		/**** md5 signature: be6301599a2805e86c2f189218545e8d ****/
		%feature("compactdefaultargs") Pnt2dOnRst;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns u,v coordinates of the point on the curve on surface.
") Pnt2dOnRst;
		const gp_Pnt2d Pnt2dOnRst();

		/****************** Pnt2dOnS ******************/
		/**** md5 signature: 17442813aa59649b001e1e639324e582 ****/
		%feature("compactdefaultargs") Pnt2dOnS;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns u,v coordinates of the point on the surface.
") Pnt2dOnS;
		const gp_Pnt2d Pnt2dOnS();

		/****************** PointOnRst ******************/
		/**** md5 signature: 8bca30b1c57a5ca26f02cdaf7dbf609a ****/
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnRst;
		const gp_Pnt PointOnRst();

		/****************** PointOnS ******************/
		/**** md5 signature: d0ce1246a72267935632a60d95848390 ****/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS;
		const gp_Pnt PointOnS();

		/****************** Resolution ******************/
		/**** md5 signature: 1f885646df74c72ec13d37a113377aaa ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
		/**** md5 signature: c6f45fdc6c5dce2cea7b90328e5e99d9 ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: float
U: float
V: float
W: float
C: gp_Circ

Return
-------
Pdeb: float
Pfin: float

Description
-----------
No available documentation.
") Section;
		void Section(const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****************** Section ******************/
		/**** md5 signature: 906e6a4bef3056546e496b945ff8d788 ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** Section ******************/
		/**** md5 signature: b6f1107f21a9bc6524bdd8152abaed5f ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
Used for the first and last section the method returns standard_true if the derivatives are computed, otherwise it returns standard_false.
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** Section ******************/
		/**** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Set ******************/
		/**** md5 signature: 51edc1a46f9014e3188bd66241af17c6 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
SurfRef: Adaptor3d_Surface
RstRef: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<Adaptor3d_Surface> & SurfRef, const opencascade::handle<Adaptor2d_Curve2d> & RstRef);

		/****************** Set ******************/
		/**** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		/**** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the guide line. this determines the derivatives in these values if the function is not cn.
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Set ******************/
		/**** md5 signature: 99fe75aea7947575eb6b646d1797f9da ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Radius: float
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Radius, const Standard_Integer Choix);

		/****************** Set ******************/
		/**** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
TypeSection: BlendFunc_SectionShape

Return
-------
None

Description
-----------
Sets the type of section generation for the approximations.
") Set;
		void Set(const BlendFunc_SectionShape TypeSection);

		/****************** Tangent2dOnRst ******************/
		/**** md5 signature: a67df95e06afdcf2e410ba7d891bdc53 ****/
		%feature("compactdefaultargs") Tangent2dOnRst;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnRst;
		const gp_Vec2d Tangent2dOnRst();

		/****************** Tangent2dOnS ******************/
		/**** md5 signature: e102a4d332cc3b92c9252bebc7ca2a2f ****/
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS;
		const gp_Vec2d Tangent2dOnS();

		/****************** TangentOnRst ******************/
		/**** md5 signature: ee94795e8a03889a76a13b1b2ac6b614 ****/
		%feature("compactdefaultargs") TangentOnRst;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnRst;
		const gp_Vec TangentOnRst();

		/****************** TangentOnS ******************/
		/**** md5 signature: 48a27063e2cf1be2b2c56ad8f774bd84 ****/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS;
		const gp_Vec TangentOnS();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.
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
		/**** md5 signature: 06cb46291f703c140349a3b88ec0c690 ****/
		%feature("compactdefaultargs") BRepBlend_SurfRstEvolRad;
		%feature("autodoc", "
Parameters
----------
Surf: Adaptor3d_Surface
SurfRst: Adaptor3d_Surface
Rst: Adaptor2d_Curve2d
CGuide: Adaptor3d_Curve
Evol: Law_Function

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_SurfRstEvolRad;
		 BRepBlend_SurfRstEvolRad(const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_Surface> & SurfRst, const opencascade::handle<Adaptor2d_Curve2d> & Rst, const opencascade::handle<Adaptor3d_Curve> & CGuide, const opencascade::handle<Law_Function> & Evol);

		/****************** Decroch ******************/
		/**** md5 signature: 7b97fab9290fe599257ab8ce84870242 ****/
		%feature("compactdefaultargs") Decroch;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
NS: gp_Vec
TgS: gp_Vec

Return
-------
bool

Description
-----------
Permet d ' implementer un critere de decrochage specifique a la fonction.
") Decroch;
		Standard_Boolean Decroch(const math_Vector & Sol, gp_Vec & NS, gp_Vec & TgS);

		/****************** Derivatives ******************/
		/**** md5 signature: 940fde1549012c9025c437a16f7d8c18 ****/
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
Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** GetBounds ******************/
		/**** md5 signature: 7f39b43072461a3f70a63d3178e97743 ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
InfBound: math_Vector
SupBound: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****************** GetMinimalDistance ******************/
		/**** md5 signature: b7112b2680da59932f7cc20412f85fda ****/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimal distance between two extremities of calculated sections.
") GetMinimalDistance;
		virtual Standard_Real GetMinimalDistance();

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: f84aaf80601cfa818dfe6e9dd3bec152 ****/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetSectionSize ******************/
		/**** md5 signature: bf1917f305e490b557c33ddc30e16dc7 ****/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		Standard_Real GetSectionSize();

		/****************** GetShape ******************/
		/**** md5 signature: 6b9d3e113e9e6721b2abf4c094cdd226 ****/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int

Description
-----------
No available documentation.
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetTolerance ******************/
		/**** md5 signature: db57a1b1119c0b1280472660909013c2 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const Standard_Real Tol);

		/****************** GetTolerance ******************/
		/**** md5 signature: be5e2f2cb95c7dbdff402ed78245d7d7 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary surftol error inside the surface.
") GetTolerance;
		void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****************** Intervals ******************/
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <t> the parameters bounding the intervals of continuity <s>. the array must provide enough room to accommodate for the parameters. i.e. t.length() > nbintervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rationnal.
") IsRational;
		Standard_Boolean IsRational();

		/****************** IsSolution ******************/
		/**** md5 signature: 89ff6b5b0ad96a1e505d615e14235bad ****/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: float

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		Standard_Boolean IsSolution(const math_Vector & Sol, const Standard_Real Tol);

		/****************** IsTangencyPoint ******************/
		/**** md5 signature: 6f3e518ba9796f381f39631e22124ef0 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** Knots ******************/
		/**** md5 signature: a226854cd9eac08cbe4282feaa46c20d ****/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		/**** md5 signature: 36c77711e4160fb27b24b90b8fa7c6de ****/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbEquations ******************/
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbVariables ******************/
		/**** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbVariables;
		Standard_Integer NbVariables();

		/****************** ParameterOnRst ******************/
		/**** md5 signature: 7e31a9a50b0e16d757ff5e9a2545014c ****/
		%feature("compactdefaultargs") ParameterOnRst;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst;
		Standard_Real ParameterOnRst();

		/****************** Pnt2dOnRst ******************/
		/**** md5 signature: be6301599a2805e86c2f189218545e8d ****/
		%feature("compactdefaultargs") Pnt2dOnRst;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns u,v coordinates of the point on the curve on surface.
") Pnt2dOnRst;
		const gp_Pnt2d Pnt2dOnRst();

		/****************** Pnt2dOnS ******************/
		/**** md5 signature: 17442813aa59649b001e1e639324e582 ****/
		%feature("compactdefaultargs") Pnt2dOnS;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns u,v coordinates of the point on the surface.
") Pnt2dOnS;
		const gp_Pnt2d Pnt2dOnS();

		/****************** PointOnRst ******************/
		/**** md5 signature: 8bca30b1c57a5ca26f02cdaf7dbf609a ****/
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnRst;
		const gp_Pnt PointOnRst();

		/****************** PointOnS ******************/
		/**** md5 signature: d0ce1246a72267935632a60d95848390 ****/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS;
		const gp_Pnt PointOnS();

		/****************** Resolution ******************/
		/**** md5 signature: 1f885646df74c72ec13d37a113377aaa ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const Standard_Integer IC2d, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Section ******************/
		/**** md5 signature: c6f45fdc6c5dce2cea7b90328e5e99d9 ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: float
U: float
V: float
W: float
C: gp_Circ

Return
-------
Pdeb: float
Pfin: float

Description
-----------
No available documentation.
") Section;
		void Section(const Standard_Real Param, const Standard_Real U, const Standard_Real V, const Standard_Real W, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****************** Section ******************/
		/**** md5 signature: 906e6a4bef3056546e496b945ff8d788 ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** Section ******************/
		/**** md5 signature: b6f1107f21a9bc6524bdd8152abaed5f ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
Used for the first and last section the method returns standard_true if the derivatives are computed, otherwise it returns standard_false.
") Section;
		Standard_Boolean Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** Section ******************/
		/**** md5 signature: 50af689ba5abf11bb271a06ac70b2d69 ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** Set ******************/
		/**** md5 signature: 51edc1a46f9014e3188bd66241af17c6 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
SurfRef: Adaptor3d_Surface
RstRef: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<Adaptor3d_Surface> & SurfRef, const opencascade::handle<Adaptor2d_Curve2d> & RstRef);

		/****************** Set ******************/
		/**** md5 signature: a955f35e9076d1c844b9a2aa89b226bf ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Param);

		/****************** Set ******************/
		/**** md5 signature: 7d0982b9e2ba9cb3c696f620150f4f9c ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the guide line. this determines the derivatives in these values if the function is not cn.
") Set;
		void Set(const Standard_Real First, const Standard_Real Last);

		/****************** Set ******************/
		/**** md5 signature: d73c9c4058c0955fc8cd59888660f750 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Integer Choix);

		/****************** Set ******************/
		/**** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
TypeSection: BlendFunc_SectionShape

Return
-------
None

Description
-----------
Sets the type of section generation for the approximations.
") Set;
		void Set(const BlendFunc_SectionShape TypeSection);

		/****************** Tangent2dOnRst ******************/
		/**** md5 signature: a67df95e06afdcf2e410ba7d891bdc53 ****/
		%feature("compactdefaultargs") Tangent2dOnRst;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnRst;
		const gp_Vec2d Tangent2dOnRst();

		/****************** Tangent2dOnS ******************/
		/**** md5 signature: e102a4d332cc3b92c9252bebc7ca2a2f ****/
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS;
		const gp_Vec2d Tangent2dOnS();

		/****************** TangentOnRst ******************/
		/**** md5 signature: ee94795e8a03889a76a13b1b2ac6b614 ****/
		%feature("compactdefaultargs") TangentOnRst;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnRst;
		const gp_Vec TangentOnRst();

		/****************** TangentOnS ******************/
		/**** md5 signature: 48a27063e2cf1be2b2c56ad8f774bd84 ****/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS;
		const gp_Vec TangentOnS();

		/****************** Value ******************/
		/**** md5 signature: 1b689850305d8b13f289849027f0887b ****/
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
Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: cb66193525cc0a7235a2cde2a228308b ****/
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
Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.
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
		/**** md5 signature: d6a0ad1ce9ef95abcda88a808971a42f ****/
		%feature("compactdefaultargs") BRepBlend_SurfRstLineBuilder;
		%feature("autodoc", "
Parameters
----------
Surf1: Adaptor3d_Surface
Domain1: Adaptor3d_TopolTool
Surf2: Adaptor3d_Surface
Rst: Adaptor2d_Curve2d
Domain2: Adaptor3d_TopolTool

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_SurfRstLineBuilder;
		 BRepBlend_SurfRstLineBuilder(const opencascade::handle<Adaptor3d_Surface> & Surf1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_Surface> & Surf2, const opencascade::handle<Adaptor2d_Curve2d> & Rst, const opencascade::handle<Adaptor3d_TopolTool> & Domain2);

		/****************** ArcToRecadre ******************/
		/**** md5 signature: f9d5cffa9a03b0a3c58f32741f4a8c9a ****/
		%feature("compactdefaultargs") ArcToRecadre;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
PrevIndex: int
pt2d: gp_Pnt2d
lastpt2d: gp_Pnt2d

Return
-------
ponarc: float

Description
-----------
No available documentation.
") ArcToRecadre;
		Standard_Integer ArcToRecadre(const math_Vector & Sol, const Standard_Integer PrevIndex, gp_Pnt2d & pt2d, gp_Pnt2d & lastpt2d, Standard_Real &OutValue);

		/****************** Complete ******************/
		/**** md5 signature: 8afbad6ca438fb5bf221347cf65278f9 ****/
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "
Parameters
----------
Func: Blend_SurfRstFunction
Finv: Blend_FuncInv
FinvP: Blend_SurfPointFuncInv
FinvC: Blend_SurfCurvFuncInv
Pmin: float

Return
-------
bool

Description
-----------
No available documentation.
") Complete;
		Standard_Boolean Complete(Blend_SurfRstFunction & Func, Blend_FuncInv & Finv, Blend_SurfPointFuncInv & FinvP, Blend_SurfCurvFuncInv & FinvC, const Standard_Real Pmin);

		/****************** DecrochEnd ******************/
		/**** md5 signature: 9670fa97a635898b96c8e6af24b5f104 ****/
		%feature("compactdefaultargs") DecrochEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") DecrochEnd;
		Standard_Boolean DecrochEnd();

		/****************** DecrochStart ******************/
		/**** md5 signature: 223f9062baf694444e41dd2120766443 ****/
		%feature("compactdefaultargs") DecrochStart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") DecrochStart;
		Standard_Boolean DecrochStart();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		/**** md5 signature: 9bbdb2164431d955d7a3a08a37fd239f ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepBlend_Line>

Description
-----------
No available documentation.
") Line;
		const opencascade::handle<BRepBlend_Line> & Line();

		/****************** Perform ******************/
		/**** md5 signature: 86cf3650fa597d7655c244c1866126f2 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Func: Blend_SurfRstFunction
Finv: Blend_FuncInv
FinvP: Blend_SurfPointFuncInv
FinvC: Blend_SurfCurvFuncInv
Pdep: float
Pmax: float
MaxStep: float
Tol3d: float
Tol2d: float
TolGuide: float
Soldep: math_Vector
Fleche: float
Appro: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(Blend_SurfRstFunction & Func, Blend_FuncInv & Finv, Blend_SurfPointFuncInv & FinvP, Blend_SurfCurvFuncInv & FinvC, const Standard_Real Pdep, const Standard_Real Pmax, const Standard_Real MaxStep, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Real TolGuide, const math_Vector & Soldep, const Standard_Real Fleche, const Standard_Boolean Appro = Standard_False);

		/****************** PerformFirstSection ******************/
		/**** md5 signature: 429fbdc03f84a4a14fbebef94ad27ee5 ****/
		%feature("compactdefaultargs") PerformFirstSection;
		%feature("autodoc", "
Parameters
----------
Func: Blend_SurfRstFunction
Finv: Blend_FuncInv
FinvP: Blend_SurfPointFuncInv
FinvC: Blend_SurfCurvFuncInv
Pdep: float
Pmax: float
Soldep: math_Vector
Tol3d: float
Tol2d: float
TolGuide: float
RecRst: bool
RecP: bool
RecS: bool
ParSol: math_Vector

Return
-------
Psol: float

Description
-----------
No available documentation.
") PerformFirstSection;
		Standard_Boolean PerformFirstSection(Blend_SurfRstFunction & Func, Blend_FuncInv & Finv, Blend_SurfPointFuncInv & FinvP, Blend_SurfCurvFuncInv & FinvC, const Standard_Real Pdep, const Standard_Real Pmax, const math_Vector & Soldep, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Real TolGuide, const Standard_Boolean RecRst, const Standard_Boolean RecP, const Standard_Boolean RecS, Standard_Real &OutValue, math_Vector & ParSol);

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
		/**** md5 signature: 3e60e6b4956db8469ccd4414f4eddcf1 ****/
		%feature("compactdefaultargs") BRepBlend_Walking;
		%feature("autodoc", "
Parameters
----------
Surf1: Adaptor3d_Surface
Surf2: Adaptor3d_Surface
Domain1: Adaptor3d_TopolTool
Domain2: Adaptor3d_TopolTool
HGuide: ChFiDS_ElSpine

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_Walking;
		 BRepBlend_Walking(const opencascade::handle<Adaptor3d_Surface> & Surf1, const opencascade::handle<Adaptor3d_Surface> & Surf2, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const opencascade::handle<ChFiDS_ElSpine> & HGuide);

		/****************** AddSingularPoint ******************/
		/**** md5 signature: 0ea0295b6724aa8af8ca3b784b4bc60a ****/
		%feature("compactdefaultargs") AddSingularPoint;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point

Return
-------
None

Description
-----------
To define singular points computed before walking.
") AddSingularPoint;
		void AddSingularPoint(const Blend_Point & P);

		/****************** Check ******************/
		/**** md5 signature: 7d8efb01ff65c2d30fe479ee5510d837 ****/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
C: bool

Return
-------
None

Description
-----------
No available documentation.
") Check;
		void Check(const Standard_Boolean C);

		/****************** Check2d ******************/
		/**** md5 signature: 71403ff4a3ccda5a85656094466d7bab ****/
		%feature("compactdefaultargs") Check2d;
		%feature("autodoc", "
Parameters
----------
C: bool

Return
-------
None

Description
-----------
No available documentation.
") Check2d;
		void Check2d(const Standard_Boolean C);

		/****************** ClassificationOnS1 ******************/
		/**** md5 signature: 2b2955a3ba803ab46041189579530527 ****/
		%feature("compactdefaultargs") ClassificationOnS1;
		%feature("autodoc", "
Parameters
----------
C: bool

Return
-------
None

Description
-----------
No available documentation.
") ClassificationOnS1;
		void ClassificationOnS1(const Standard_Boolean C);

		/****************** ClassificationOnS2 ******************/
		/**** md5 signature: bc20933ea1d896b847c2a86545020181 ****/
		%feature("compactdefaultargs") ClassificationOnS2;
		%feature("autodoc", "
Parameters
----------
C: bool

Return
-------
None

Description
-----------
No available documentation.
") ClassificationOnS2;
		void ClassificationOnS2(const Standard_Boolean C);

		/****************** Complete ******************/
		/**** md5 signature: 5885fcb1eae17266768e978b25dda475 ****/
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "
Parameters
----------
F: Blend_Function
FInv: Blend_FuncInv
Pmin: float

Return
-------
bool

Description
-----------
No available documentation.
") Complete;
		Standard_Boolean Complete(Blend_Function & F, Blend_FuncInv & FInv, const Standard_Real Pmin);

		/****************** Continu ******************/
		/**** md5 signature: e1fb178a0cc6b5d457359b43b1a7c823 ****/
		%feature("compactdefaultargs") Continu;
		%feature("autodoc", "
Parameters
----------
F: Blend_Function
FInv: Blend_FuncInv
P: float

Return
-------
bool

Description
-----------
No available documentation.
") Continu;
		Standard_Boolean Continu(Blend_Function & F, Blend_FuncInv & FInv, const Standard_Real P);

		/****************** Continu ******************/
		/**** md5 signature: 02a9e3404b651f5bcee39d40728c4c7b ****/
		%feature("compactdefaultargs") Continu;
		%feature("autodoc", "
Parameters
----------
F: Blend_Function
FInv: Blend_FuncInv
P: float
OnS1: bool

Return
-------
bool

Description
-----------
No available documentation.
") Continu;
		Standard_Boolean Continu(Blend_Function & F, Blend_FuncInv & FInv, const Standard_Real P, const Standard_Boolean OnS1);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		/**** md5 signature: 9bbdb2164431d955d7a3a08a37fd239f ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepBlend_Line>

Description
-----------
No available documentation.
") Line;
		const opencascade::handle<BRepBlend_Line> & Line();

		/****************** Perform ******************/
		/**** md5 signature: 6d94e3dcc7c71857d2c24ced3358703f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: Blend_Function
FInv: Blend_FuncInv
Pdep: float
Pmax: float
MaxStep: float
Tol3d: float
TolGuide: float
Soldep: math_Vector
Fleche: float
Appro: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(Blend_Function & F, Blend_FuncInv & FInv, const Standard_Real Pdep, const Standard_Real Pmax, const Standard_Real MaxStep, const Standard_Real Tol3d, const Standard_Real TolGuide, const math_Vector & Soldep, const Standard_Real Fleche, const Standard_Boolean Appro = Standard_False);

		/****************** PerformFirstSection ******************/
		/**** md5 signature: 92db8d0914da0712dd54b302697b3aa3 ****/
		%feature("compactdefaultargs") PerformFirstSection;
		%feature("autodoc", "
Parameters
----------
F: Blend_Function
Pdep: float
ParDep: math_Vector
Tol3d: float
TolGuide: float
Pos1: TopAbs_State
Pos2: TopAbs_State

Return
-------
bool

Description
-----------
No available documentation.
") PerformFirstSection;
		Standard_Boolean PerformFirstSection(Blend_Function & F, const Standard_Real Pdep, math_Vector & ParDep, const Standard_Real Tol3d, const Standard_Real TolGuide, TopAbs_State & Pos1, TopAbs_State & Pos2);

		/****************** PerformFirstSection ******************/
		/**** md5 signature: 7464aaa5cedcb060541546a3a1ff5540 ****/
		%feature("compactdefaultargs") PerformFirstSection;
		%feature("autodoc", "
Parameters
----------
F: Blend_Function
FInv: Blend_FuncInv
Pdep: float
Pmax: float
ParDep: math_Vector
Tol3d: float
TolGuide: float
RecOnS1: bool
RecOnS2: bool
ParSol: math_Vector

Return
-------
Psol: float

Description
-----------
No available documentation.
") PerformFirstSection;
		Standard_Boolean PerformFirstSection(Blend_Function & F, Blend_FuncInv & FInv, const Standard_Real Pdep, const Standard_Real Pmax, const math_Vector & ParDep, const Standard_Real Tol3d, const Standard_Real TolGuide, const Standard_Boolean RecOnS1, const Standard_Boolean RecOnS2, Standard_Real &OutValue, math_Vector & ParSol);

		/****************** SetDomainsToRecadre ******************/
		/**** md5 signature: 10664ebffbd6ed784502d7d4acfa5a93 ****/
		%feature("compactdefaultargs") SetDomainsToRecadre;
		%feature("autodoc", "
Parameters
----------
RecDomain1: Adaptor3d_TopolTool
RecDomain2: Adaptor3d_TopolTool

Return
-------
None

Description
-----------
To define different domains for control and clipping.
") SetDomainsToRecadre;
		void SetDomainsToRecadre(const opencascade::handle<Adaptor3d_TopolTool> & RecDomain1, const opencascade::handle<Adaptor3d_TopolTool> & RecDomain2);

		/****************** TwistOnS1 ******************/
		/**** md5 signature: 9e7cba134041c48814f8e911bc7ceb7d ****/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS1;
		Standard_Boolean TwistOnS1();

		/****************** TwistOnS2 ******************/
		/**** md5 signature: d09d14bd26a5c6922f795ecb44cf2f66 ****/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
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
		%feature("autodoc", "
Parameters
----------
Line: BRepBlend_Line
Func: Blend_Function
Tol3d: float
Tol2d: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_AppFunc;
		 BRepBlend_AppFunc(opencascade::handle<BRepBlend_Line> & Line, Blend_Function & Func, const Standard_Real Tol3d, const Standard_Real Tol2d);

		/****************** Point ******************/
		/**** md5 signature: 1f64768686e0fd1268e07e05fcaa4c86 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Func: Blend_AppFunction
Param: float
Sol: math_Vector
Pnt: Blend_Point

Return
-------
None

Description
-----------
No available documentation.
") Point;
		void Point(const Blend_AppFunction & Func, const Standard_Real Param, const math_Vector & Sol, Blend_Point & Pnt);

		/****************** Vec ******************/
		/**** md5 signature: f98635405dfb2bd7c7d7c0586657d180 ****/
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Pnt: Blend_Point

Return
-------
None

Description
-----------
No available documentation.
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
		%feature("autodoc", "
Parameters
----------
Line: BRepBlend_Line
Func: Blend_SurfRstFunction
Tol3d: float
Tol2d: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_AppFuncRst;
		 BRepBlend_AppFuncRst(opencascade::handle<BRepBlend_Line> & Line, Blend_SurfRstFunction & Func, const Standard_Real Tol3d, const Standard_Real Tol2d);

		/****************** Point ******************/
		/**** md5 signature: 1f64768686e0fd1268e07e05fcaa4c86 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Func: Blend_AppFunction
Param: float
Sol: math_Vector
Pnt: Blend_Point

Return
-------
None

Description
-----------
No available documentation.
") Point;
		void Point(const Blend_AppFunction & Func, const Standard_Real Param, const math_Vector & Sol, Blend_Point & Pnt);

		/****************** Vec ******************/
		/**** md5 signature: f98635405dfb2bd7c7d7c0586657d180 ****/
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Pnt: Blend_Point

Return
-------
None

Description
-----------
No available documentation.
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
		%feature("autodoc", "
Parameters
----------
Line: BRepBlend_Line
Func: Blend_RstRstFunction
Tol3d: float
Tol2d: float

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_AppFuncRstRst;
		 BRepBlend_AppFuncRstRst(opencascade::handle<BRepBlend_Line> & Line, Blend_RstRstFunction & Func, const Standard_Real Tol3d, const Standard_Real Tol2d);

		/****************** Point ******************/
		/**** md5 signature: 1f64768686e0fd1268e07e05fcaa4c86 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Func: Blend_AppFunction
Param: float
Sol: math_Vector
Pnt: Blend_Point

Return
-------
None

Description
-----------
No available documentation.
") Point;
		void Point(const Blend_AppFunction & Func, const Standard_Real Param, const math_Vector & Sol, Blend_Point & Pnt);

		/****************** Vec ******************/
		/**** md5 signature: f98635405dfb2bd7c7d7c0586657d180 ****/
		%feature("compactdefaultargs") Vec;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Pnt: Blend_Point

Return
-------
None

Description
-----------
No available documentation.
") Vec;
		void Vec(math_Vector & Sol, const Blend_Point & Pnt);

};


%make_alias(BRepBlend_AppFuncRstRst)

%extend BRepBlend_AppFuncRstRst {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BRepBlend_CSWalking:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
BRepBlend_CSCircular=OCC.Core.BlendFunc.BlendFunc_CSCircular
BRepBlend_CSConstRad=OCC.Core.BlendFunc.BlendFunc_CSConstRad
BRepBlend_ChAsym=OCC.Core.BlendFunc.BlendFunc_ChAsym
BRepBlend_ChAsymInv=OCC.Core.BlendFunc.BlendFunc_ChAsymInv
BRepBlend_ChamfInv=OCC.Core.BlendFunc.BlendFunc_ChamfInv
BRepBlend_Chamfer=OCC.Core.BlendFunc.BlendFunc_Chamfer
BRepBlend_ConstRad=OCC.Core.BlendFunc.BlendFunc_ConstRad
BRepBlend_ConstRadInv=OCC.Core.BlendFunc.BlendFunc_ConstRadInv
BRepBlend_ConstThroat=OCC.Core.BlendFunc.BlendFunc_ConstThroat
BRepBlend_ConstThroatInv=OCC.Core.BlendFunc.BlendFunc_ConstThroatInv
BRepBlend_ConstThroatWithPenetration=OCC.Core.BlendFunc.BlendFunc_ConstThroatWithPenetration
BRepBlend_ConstThroatWithPenetrationInv=OCC.Core.BlendFunc.BlendFunc_ConstThroatWithPenetrationInv
BRepBlend_EvolRad=OCC.Core.BlendFunc.BlendFunc_EvolRad
BRepBlend_EvolRadInv=OCC.Core.BlendFunc.BlendFunc_EvolRadInv
BRepBlend_Ruled=OCC.Core.BlendFunc.BlendFunc_Ruled
BRepBlend_RuledInv=OCC.Core.BlendFunc.BlendFunc_RuledInv
}
/* deprecated methods */
%pythoncode {
@deprecated
def BRepBlend_BlendTool_Bounds(*args):
	return BRepBlend_BlendTool.Bounds(*args)

@deprecated
def BRepBlend_BlendTool_CurveOnSurf(*args):
	return BRepBlend_BlendTool.CurveOnSurf(*args)

@deprecated
def BRepBlend_BlendTool_Inters(*args):
	return BRepBlend_BlendTool.Inters(*args)

@deprecated
def BRepBlend_BlendTool_NbSamplesU(*args):
	return BRepBlend_BlendTool.NbSamplesU(*args)

@deprecated
def BRepBlend_BlendTool_NbSamplesV(*args):
	return BRepBlend_BlendTool.NbSamplesV(*args)

@deprecated
def BRepBlend_BlendTool_Parameter(*args):
	return BRepBlend_BlendTool.Parameter(*args)

@deprecated
def BRepBlend_BlendTool_Project(*args):
	return BRepBlend_BlendTool.Project(*args)

@deprecated
def BRepBlend_BlendTool_SingularOnUMax(*args):
	return BRepBlend_BlendTool.SingularOnUMax(*args)

@deprecated
def BRepBlend_BlendTool_SingularOnUMin(*args):
	return BRepBlend_BlendTool.SingularOnUMin(*args)

@deprecated
def BRepBlend_BlendTool_SingularOnVMax(*args):
	return BRepBlend_BlendTool.SingularOnVMax(*args)

@deprecated
def BRepBlend_BlendTool_SingularOnVMin(*args):
	return BRepBlend_BlendTool.SingularOnVMin(*args)

@deprecated
def BRepBlend_BlendTool_Tolerance(*args):
	return BRepBlend_BlendTool.Tolerance(*args)

@deprecated
def BRepBlend_HCurve2dTool_BSpline(*args):
	return BRepBlend_HCurve2dTool.BSpline(*args)

@deprecated
def BRepBlend_HCurve2dTool_Bezier(*args):
	return BRepBlend_HCurve2dTool.Bezier(*args)

@deprecated
def BRepBlend_HCurve2dTool_Circle(*args):
	return BRepBlend_HCurve2dTool.Circle(*args)

@deprecated
def BRepBlend_HCurve2dTool_Continuity(*args):
	return BRepBlend_HCurve2dTool.Continuity(*args)

@deprecated
def BRepBlend_HCurve2dTool_D0(*args):
	return BRepBlend_HCurve2dTool.D0(*args)

@deprecated
def BRepBlend_HCurve2dTool_D1(*args):
	return BRepBlend_HCurve2dTool.D1(*args)

@deprecated
def BRepBlend_HCurve2dTool_D2(*args):
	return BRepBlend_HCurve2dTool.D2(*args)

@deprecated
def BRepBlend_HCurve2dTool_D3(*args):
	return BRepBlend_HCurve2dTool.D3(*args)

@deprecated
def BRepBlend_HCurve2dTool_DN(*args):
	return BRepBlend_HCurve2dTool.DN(*args)

@deprecated
def BRepBlend_HCurve2dTool_Ellipse(*args):
	return BRepBlend_HCurve2dTool.Ellipse(*args)

@deprecated
def BRepBlend_HCurve2dTool_FirstParameter(*args):
	return BRepBlend_HCurve2dTool.FirstParameter(*args)

@deprecated
def BRepBlend_HCurve2dTool_GetType(*args):
	return BRepBlend_HCurve2dTool.GetType(*args)

@deprecated
def BRepBlend_HCurve2dTool_Hyperbola(*args):
	return BRepBlend_HCurve2dTool.Hyperbola(*args)

@deprecated
def BRepBlend_HCurve2dTool_Intervals(*args):
	return BRepBlend_HCurve2dTool.Intervals(*args)

@deprecated
def BRepBlend_HCurve2dTool_IsClosed(*args):
	return BRepBlend_HCurve2dTool.IsClosed(*args)

@deprecated
def BRepBlend_HCurve2dTool_IsPeriodic(*args):
	return BRepBlend_HCurve2dTool.IsPeriodic(*args)

@deprecated
def BRepBlend_HCurve2dTool_LastParameter(*args):
	return BRepBlend_HCurve2dTool.LastParameter(*args)

@deprecated
def BRepBlend_HCurve2dTool_Line(*args):
	return BRepBlend_HCurve2dTool.Line(*args)

@deprecated
def BRepBlend_HCurve2dTool_NbIntervals(*args):
	return BRepBlend_HCurve2dTool.NbIntervals(*args)

@deprecated
def BRepBlend_HCurve2dTool_NbSamples(*args):
	return BRepBlend_HCurve2dTool.NbSamples(*args)

@deprecated
def BRepBlend_HCurve2dTool_Parabola(*args):
	return BRepBlend_HCurve2dTool.Parabola(*args)

@deprecated
def BRepBlend_HCurve2dTool_Period(*args):
	return BRepBlend_HCurve2dTool.Period(*args)

@deprecated
def BRepBlend_HCurve2dTool_Resolution(*args):
	return BRepBlend_HCurve2dTool.Resolution(*args)

@deprecated
def BRepBlend_HCurve2dTool_Value(*args):
	return BRepBlend_HCurve2dTool.Value(*args)

@deprecated
def BRepBlend_HCurveTool_BSpline(*args):
	return BRepBlend_HCurveTool.BSpline(*args)

@deprecated
def BRepBlend_HCurveTool_Bezier(*args):
	return BRepBlend_HCurveTool.Bezier(*args)

@deprecated
def BRepBlend_HCurveTool_Circle(*args):
	return BRepBlend_HCurveTool.Circle(*args)

@deprecated
def BRepBlend_HCurveTool_Continuity(*args):
	return BRepBlend_HCurveTool.Continuity(*args)

@deprecated
def BRepBlend_HCurveTool_D0(*args):
	return BRepBlend_HCurveTool.D0(*args)

@deprecated
def BRepBlend_HCurveTool_D1(*args):
	return BRepBlend_HCurveTool.D1(*args)

@deprecated
def BRepBlend_HCurveTool_D2(*args):
	return BRepBlend_HCurveTool.D2(*args)

@deprecated
def BRepBlend_HCurveTool_D3(*args):
	return BRepBlend_HCurveTool.D3(*args)

@deprecated
def BRepBlend_HCurveTool_DN(*args):
	return BRepBlend_HCurveTool.DN(*args)

@deprecated
def BRepBlend_HCurveTool_Ellipse(*args):
	return BRepBlend_HCurveTool.Ellipse(*args)

@deprecated
def BRepBlend_HCurveTool_FirstParameter(*args):
	return BRepBlend_HCurveTool.FirstParameter(*args)

@deprecated
def BRepBlend_HCurveTool_GetType(*args):
	return BRepBlend_HCurveTool.GetType(*args)

@deprecated
def BRepBlend_HCurveTool_Hyperbola(*args):
	return BRepBlend_HCurveTool.Hyperbola(*args)

@deprecated
def BRepBlend_HCurveTool_Intervals(*args):
	return BRepBlend_HCurveTool.Intervals(*args)

@deprecated
def BRepBlend_HCurveTool_IsClosed(*args):
	return BRepBlend_HCurveTool.IsClosed(*args)

@deprecated
def BRepBlend_HCurveTool_IsPeriodic(*args):
	return BRepBlend_HCurveTool.IsPeriodic(*args)

@deprecated
def BRepBlend_HCurveTool_LastParameter(*args):
	return BRepBlend_HCurveTool.LastParameter(*args)

@deprecated
def BRepBlend_HCurveTool_Line(*args):
	return BRepBlend_HCurveTool.Line(*args)

@deprecated
def BRepBlend_HCurveTool_NbIntervals(*args):
	return BRepBlend_HCurveTool.NbIntervals(*args)

@deprecated
def BRepBlend_HCurveTool_NbSamples(*args):
	return BRepBlend_HCurveTool.NbSamples(*args)

@deprecated
def BRepBlend_HCurveTool_Parabola(*args):
	return BRepBlend_HCurveTool.Parabola(*args)

@deprecated
def BRepBlend_HCurveTool_Period(*args):
	return BRepBlend_HCurveTool.Period(*args)

@deprecated
def BRepBlend_HCurveTool_Resolution(*args):
	return BRepBlend_HCurveTool.Resolution(*args)

@deprecated
def BRepBlend_HCurveTool_Value(*args):
	return BRepBlend_HCurveTool.Value(*args)

}
