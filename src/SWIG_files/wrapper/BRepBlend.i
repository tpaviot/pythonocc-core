/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepblend.html"
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
%include ../common/ArrayMacros.i


%{
#include<BRepBlend_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BlendFunc_module.hxx>
#include<Approx_module.hxx>
#include<gp_module.hxx>
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
		/****** BRepBlend_AppFuncRoot::BarycentreOfSurf ******/
		/****** md5 signature: 1f25b0eb1d890895eb1250cc0c28882b ******/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get the barycentre of Surface. An very poor estimation is sufficient. This information is useful to perform well conditioned rational approximation.
") BarycentreOfSurf;
		gp_Pnt BarycentreOfSurf();

		/****** BRepBlend_AppFuncRoot::D0 ******/
		/****** md5 signature: d64f5fa0ee4cfd988fe34ce17e01e38b ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
First: double
Last: double
Poles: NCollection_Array1<gp_Pnt>
Poles2d: NCollection_Array1<gp_Pnt2d>
Weigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
compute the section for v = param.
") D0;
		bool D0(const double Param, const double First, const double Last, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<double> & Weigths);

		/****** BRepBlend_AppFuncRoot::D1 ******/
		/****** md5 signature: f122a00989a158b63aadd60916d6c393 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
First: double
Last: double
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
compute the first derivative in v direction of the section for v = param.
") D1;
		bool D1(const double Param, const double First, const double Last, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths);

		/****** BRepBlend_AppFuncRoot::D2 ******/
		/****** md5 signature: 7a1a70dd7a73b71015b51dcc133cc9d9 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
First: double
Last: double
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
D2Poles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
D2Poles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>
D2Weigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
compute the second derivative in v direction of the section for v = param.
") D2;
		bool D2(const double Param, const double First, const double Last, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Vec> & D2Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<gp_Vec2d> & D2Poles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths, NCollection_Array1<double> & D2Weigths);

		/****** BRepBlend_AppFuncRoot::GetMinimalWeight ******/
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections. This information is useful to perform well conditioned rational approximation.
") GetMinimalWeight;
		void GetMinimalWeight(NCollection_Array1<double> & Weigths);

		/****** BRepBlend_AppFuncRoot::GetTolerance ******/
		/****** md5 signature: 217050fdab79b8e071e91271c92a3488 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: NCollection_Array1<double>

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, NCollection_Array1<double> & Tol3d);

		/****** BRepBlend_AppFuncRoot::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** BRepBlend_AppFuncRoot::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational or not.
") IsRational;
		bool IsRational();

		/****** BRepBlend_AppFuncRoot::Knots ******/
		/****** md5 signature: 359ac10e91186ab2f75e6163036a99fe ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: NCollection_Array1<double>

Return
-------
None

Description
-----------
get the Knots of the section.
") Knots;
		void Knots(NCollection_Array1<double> & TKnots);

		/****** BRepBlend_AppFuncRoot::MaximalSection ******/
		/****** md5 signature: 1811db5e3dd550ab78611f3959bb8ecf ******/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section. This information is useful to perform well conditioned rational approximation.
") MaximalSection;
		double MaximalSection();

		/****** BRepBlend_AppFuncRoot::Mults ******/
		/****** md5 signature: 2c8f8c7780e1bd71859fc4a6b9500baf ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
get the Multplicities of the section.
") Mults;
		void Mults(NCollection_Array1<int> & TMults);

		/****** BRepBlend_AppFuncRoot::Nb2dCurves ******/
		/****** md5 signature: 4e7cc537ccba8267281b74444e5ffb1a ******/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
get the number of 2d curves to approximate.
") Nb2dCurves;
		int Nb2dCurves();

		/****** BRepBlend_AppFuncRoot::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		int NbIntervals(const GeomAbs_Shape S);

		/****** BRepBlend_AppFuncRoot::Point ******/
		/****** md5 signature: bff4f64594086b41e54882b00c097b15 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Func: Blend_AppFunction
Param: double
Sol: math_Vector
Pnt: Blend_Point

Return
-------
None

Description
-----------
No available documentation.
") Point;
		virtual void Point(const Blend_AppFunction & Func, const double Param, const math_Vector & Sol, Blend_Point & Pnt);

		/****** BRepBlend_AppFuncRoot::Resolution ******/
		/****** md5 signature: 985d57b7b05696a0ab1baaf83d307882 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Index: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
Returns the resolutions in the sub-space 2d <Index> -- This information is useful to find a good tolerance in 2d approximation.
") Resolution;
		void Resolution(const int Index, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepBlend_AppFuncRoot::SectionShape ******/
		/****** md5 signature: a753d69cb00f0b8439b79ce3401bb770 ******/
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
get the format of an section.
") SectionShape;
		void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BRepBlend_AppFuncRoot::SetInterval ******/
		/****** md5 signature: 56dbce7f545295f90d642a293e48bb2a ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the fonction This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		void SetInterval(const double First, const double Last);

		/****** BRepBlend_AppFuncRoot::SetTolerance ******/
		/****** md5 signature: 29c79f73c127702faa370cb75cf828a6 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: double
Tol2d: double

Return
-------
None

Description
-----------
Is useful, if (me) has to be run numerical algorithm to perform D0, D1 or D2.
") SetTolerance;
		void SetTolerance(const double Tol3d, const double Tol2d);

		/****** BRepBlend_AppFuncRoot::Vec ******/
		/****** md5 signature: 8e423ef956801f23a2aa4f8ca11e9907 ******/
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
		/****** BRepBlend_AppSurf::BRepBlend_AppSurf ******/
		/****** md5 signature: 3d853e22ecc3f684cf3f625ffa444684 ******/
		%feature("compactdefaultargs") BRepBlend_AppSurf;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_AppSurf;
		 BRepBlend_AppSurf();

		/****** BRepBlend_AppSurf::BRepBlend_AppSurf ******/
		/****** md5 signature: e596baa72e6b0b1871f8d341cc1f5e14 ******/
		%feature("compactdefaultargs") BRepBlend_AppSurf;
		%feature("autodoc", "
Parameters
----------
Degmin: int
Degmax: int
Tol3d: double
Tol2d: double
NbIt: int
KnownParameters: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_AppSurf;
		 BRepBlend_AppSurf(const int Degmin, const int Degmax, const double Tol3d, const double Tol2d, const int NbIt, const bool KnownParameters = false);

		/****** BRepBlend_AppSurf::Continuity ******/
		/****** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
returns the Continuity used in the approximation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** BRepBlend_AppSurf::CriteriumWeight ******/
		/****** md5 signature: 139386b2127d6614989017eba0879b6e ******/
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "
Parameters
----------

Return
-------
W1: double
W2: double
W3: double

Description
-----------
returns the Weights (as percent) associed to the criterium used in the optimization.
") CriteriumWeight;
		void CriteriumWeight(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepBlend_AppSurf::Curve2d ******/
		/****** md5 signature: 7ccf7011ebfd430185be7d33b0430b55 ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
Index: int
TPoles: NCollection_Array1<gp_Pnt2d>
TKnots: NCollection_Array1<double>
TMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Curve2d;
		void Curve2d(const int Index, NCollection_Array1<gp_Pnt2d> & TPoles, NCollection_Array1<double> & TKnots, NCollection_Array1<int> & TMults);

		/****** BRepBlend_AppSurf::Curve2dPoles ******/
		/****** md5 signature: fc2138bbb0ece5a2ec367b33ec9b43ac ******/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
NCollection_Array1<gp_Pnt2d>

Description
-----------
No available documentation.
") Curve2dPoles;
		const NCollection_Array1<gp_Pnt2d> Curve2dPoles(const int Index);

		/****** BRepBlend_AppSurf::Curves2dDegree ******/
		/****** md5 signature: fb4d118788312f8319247632ed2e7a3d ******/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Curves2dDegree;
		int Curves2dDegree();

		/****** BRepBlend_AppSurf::Curves2dKnots ******/
		/****** md5 signature: a44b03ca53ab6993c2a4d58ca6826417 ******/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "Return
-------
NCollection_Array1<double>

Description
-----------
No available documentation.
") Curves2dKnots;
		const NCollection_Array1<double> & Curves2dKnots();

		/****** BRepBlend_AppSurf::Curves2dMults ******/
		/****** md5 signature: d1414d8ce95849a2164808aafd909e37 ******/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "Return
-------
NCollection_Array1<int>

Description
-----------
No available documentation.
") Curves2dMults;
		const NCollection_Array1<int> & Curves2dMults();

		/****** BRepBlend_AppSurf::Curves2dShape ******/
		/****** md5 signature: c39c09b90dd3a7aec0bf05cddeea7de4 ******/
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

		/****** BRepBlend_AppSurf::Init ******/
		/****** md5 signature: d97434c03680761ee0e90ab9ca60964f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Degmin: int
Degmax: int
Tol3d: double
Tol2d: double
NbIt: int
KnownParameters: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const int Degmin, const int Degmax, const double Tol3d, const double Tol2d, const int NbIt, const bool KnownParameters = false);

		/****** BRepBlend_AppSurf::IsDone ******/
		/****** md5 signature: 2be114a985aea21262ebd32099ccc3a6 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** BRepBlend_AppSurf::NbCurves2d ******/
		/****** md5 signature: 29e9ed673844fb3782000214519b7fa1 ******/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCurves2d;
		int NbCurves2d();

		/****** BRepBlend_AppSurf::ParType ******/
		/****** md5 signature: 97fa11d31bc8075ba4a84bf8b926a855 ******/
		%feature("compactdefaultargs") ParType;
		%feature("autodoc", "Return
-------
Approx_ParametrizationType

Description
-----------
returns the type of parametrization used in the approximation.
") ParType;
		Approx_ParametrizationType ParType();

		/****** BRepBlend_AppSurf::Perform ******/
		/****** md5 signature: 28ce7fcf9c44ed82b5ef86b1a7ff2ef9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Lin: BRepBlend_Line
SecGen: Blend_AppFunction
SpApprox: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<BRepBlend_Line> & Lin, Blend_AppFunction & SecGen, const bool SpApprox = false);

		/****** BRepBlend_AppSurf::Perform ******/
		/****** md5 signature: 844d7c8403f8f61ef2c45e35128124e5 ******/
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
		void Perform(const opencascade::handle<BRepBlend_Line> & Lin, Blend_AppFunction & SecGen, const int NbMaxP);

		/****** BRepBlend_AppSurf::PerformSmoothing ******/
		/****** md5 signature: 7cb77d9dda0f081d8efd1da8d7d4b09d ******/
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

		/****** BRepBlend_AppSurf::SetContinuity ******/
		/****** md5 signature: 41a91b0ea6e9b248a1b48c05882f4281 ******/
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
Define the Continuity used in the approximation.
") SetContinuity;
		void SetContinuity(const GeomAbs_Shape C);

		/****** BRepBlend_AppSurf::SetCriteriumWeight ******/
		/****** md5 signature: 05101a83f2b5fa2243baf47e817e2437 ******/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "
Parameters
----------
W1: double
W2: double
W3: double

Return
-------
None

Description
-----------
define the Weights associed to the criterium used in the optimization. //! if Wi <= 0.
") SetCriteriumWeight;
		void SetCriteriumWeight(const double W1, const double W2, const double W3);

		/****** BRepBlend_AppSurf::SetParType ******/
		/****** md5 signature: ff343d7833ad3cc796439eb5cefa88ba ******/
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

		/****** BRepBlend_AppSurf::SurfPoles ******/
		/****** md5 signature: fa6137cc7cb8eb6c7f47a5bbea62ce4a ******/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "Return
-------
NCollection_Array2<gp_Pnt>

Description
-----------
No available documentation.
") SurfPoles;
		const NCollection_Array2<gp_Pnt> SurfPoles();

		/****** BRepBlend_AppSurf::SurfShape ******/
		/****** md5 signature: 969593833778f731db9ba7fd1c5ab62d ******/
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

		/****** BRepBlend_AppSurf::SurfUKnots ******/
		/****** md5 signature: 1027553c6b1dff236a0b8cb4928edc43 ******/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "Return
-------
NCollection_Array1<double>

Description
-----------
No available documentation.
") SurfUKnots;
		const NCollection_Array1<double> & SurfUKnots();

		/****** BRepBlend_AppSurf::SurfUMults ******/
		/****** md5 signature: 13e6afb95c6bae07d119ada538cec8a0 ******/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "Return
-------
NCollection_Array1<int>

Description
-----------
No available documentation.
") SurfUMults;
		const NCollection_Array1<int> & SurfUMults();

		/****** BRepBlend_AppSurf::SurfVKnots ******/
		/****** md5 signature: be8d511b070808100553277d9e3d961f ******/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "Return
-------
NCollection_Array1<double>

Description
-----------
No available documentation.
") SurfVKnots;
		const NCollection_Array1<double> & SurfVKnots();

		/****** BRepBlend_AppSurf::SurfVMults ******/
		/****** md5 signature: febf015332f02c022aa8c2a8f833c985 ******/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "Return
-------
NCollection_Array1<int>

Description
-----------
No available documentation.
") SurfVMults;
		const NCollection_Array1<int> & SurfVMults();

		/****** BRepBlend_AppSurf::SurfWeights ******/
		/****** md5 signature: 9ff1463ad6c8f0f062b0c068aeda1043 ******/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "Return
-------
NCollection_Array2<double>

Description
-----------
No available documentation.
") SurfWeights;
		const NCollection_Array2<double> & SurfWeights();

		/****** BRepBlend_AppSurf::Surface ******/
		/****** md5 signature: 671f369dee50862b8a0b7f6a973c380f ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
TPoles: NCollection_Array2<gp_Pnt>
TWeights: NCollection_Array2<double>
TUKnots: NCollection_Array1<double>
TVKnots: NCollection_Array1<double>
TUMults: NCollection_Array1<int>
TVMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Surface;
		void Surface(NCollection_Array2<gp_Pnt> & TPoles, NCollection_Array2<double> & TWeights, NCollection_Array1<double> & TUKnots, NCollection_Array1<double> & TVKnots, NCollection_Array1<int> & TUMults, NCollection_Array1<int> & TVMults);

		/****** BRepBlend_AppSurf::TolCurveOnSurf ******/
		/****** md5 signature: d6477b4bc85f93165a4bf73b1614f603 ******/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
No available documentation.
") TolCurveOnSurf;
		double TolCurveOnSurf(const int Index);

		/****** BRepBlend_AppSurf::TolReached ******/
		/****** md5 signature: fb5b2f0ee59c5fea9bfe8dc881f609c1 ******/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "
Parameters
----------

Return
-------
Tol3d: double
Tol2d: double

Description
-----------
No available documentation.
") TolReached;
		void TolReached(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepBlend_AppSurf::UDegree ******/
		/****** md5 signature: fca90e3f2f4c1ba6e7bc9cbc04110d23 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		int UDegree();

		/****** BRepBlend_AppSurf::VDegree ******/
		/****** md5 signature: c793f94fb8ca1e7cdd3fc97529f675d2 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		int VDegree();

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
		/****** BRepBlend_AppSurface::BRepBlend_AppSurface ******/
		/****** md5 signature: 655e2e637740f6b8c75436177379d3b1 ******/
		%feature("compactdefaultargs") BRepBlend_AppSurface;
		%feature("autodoc", "
Parameters
----------
Funct: Approx_SweepFunction
First: double
Last: double
Tol3d: double
Tol2d: double
TolAngular: double
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C0)
Degmax: int (optional, default to 11)
Segmax: int (optional, default to 50)

Return
-------
None

Description
-----------
Approximation of the new Surface (and eventually the 2d Curves on the support surfaces). Normally the 2d curve are approximated with a tolerance given by the resolution on support surfaces, but if this tolerance is too large Tol2d is used.
") BRepBlend_AppSurface;
		 BRepBlend_AppSurface(const opencascade::handle<Approx_SweepFunction> & Funct, const double First, const double Last, const double Tol3d, const double Tol2d, const double TolAngular, const GeomAbs_Shape Continuity = GeomAbs_C0, const int Degmax = 11, const int Segmax = 50);

		/****** BRepBlend_AppSurface::Curve2d ******/
		/****** md5 signature: 7ccf7011ebfd430185be7d33b0430b55 ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
Index: int
TPoles: NCollection_Array1<gp_Pnt2d>
TKnots: NCollection_Array1<double>
TMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Curve2d;
		void Curve2d(const int Index, NCollection_Array1<gp_Pnt2d> & TPoles, NCollection_Array1<double> & TKnots, NCollection_Array1<int> & TMults);

		/****** BRepBlend_AppSurface::Curve2dPoles ******/
		/****** md5 signature: fc2138bbb0ece5a2ec367b33ec9b43ac ******/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
NCollection_Array1<gp_Pnt2d>

Description
-----------
No available documentation.
") Curve2dPoles;
		const NCollection_Array1<gp_Pnt2d> Curve2dPoles(const int Index);

		/****** BRepBlend_AppSurface::Curves2dDegree ******/
		/****** md5 signature: fb4d118788312f8319247632ed2e7a3d ******/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Curves2dDegree;
		int Curves2dDegree();

		/****** BRepBlend_AppSurface::Curves2dKnots ******/
		/****** md5 signature: a44b03ca53ab6993c2a4d58ca6826417 ******/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "Return
-------
NCollection_Array1<double>

Description
-----------
No available documentation.
") Curves2dKnots;
		const NCollection_Array1<double> & Curves2dKnots();

		/****** BRepBlend_AppSurface::Curves2dMults ******/
		/****** md5 signature: d1414d8ce95849a2164808aafd909e37 ******/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "Return
-------
NCollection_Array1<int>

Description
-----------
No available documentation.
") Curves2dMults;
		const NCollection_Array1<int> & Curves2dMults();

		/****** BRepBlend_AppSurface::Curves2dShape ******/
		/****** md5 signature: c39c09b90dd3a7aec0bf05cddeea7de4 ******/
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

		/****** BRepBlend_AppSurface::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
display information on approximation.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** BRepBlend_AppSurface::IsDone ******/
		/****** md5 signature: 2be114a985aea21262ebd32099ccc3a6 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** BRepBlend_AppSurface::Max2dError ******/
		/****** md5 signature: e17bb792de5e7f2cf5dbaad973a8bc9d ******/
		%feature("compactdefaultargs") Max2dError;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
returns the maximum error in the <Index> 2d curve approximation.
") Max2dError;
		double Max2dError(const int Index);

		/****** BRepBlend_AppSurface::MaxErrorOnSurf ******/
		/****** md5 signature: ac629120066985404d9298b93cf6fad0 ******/
		%feature("compactdefaultargs") MaxErrorOnSurf;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum error in the surface approximation.
") MaxErrorOnSurf;
		double MaxErrorOnSurf();

		/****** BRepBlend_AppSurface::NbCurves2d ******/
		/****** md5 signature: 29e9ed673844fb3782000214519b7fa1 ******/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCurves2d;
		int NbCurves2d();

		/****** BRepBlend_AppSurface::SurfPoles ******/
		/****** md5 signature: fa6137cc7cb8eb6c7f47a5bbea62ce4a ******/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "Return
-------
NCollection_Array2<gp_Pnt>

Description
-----------
No available documentation.
") SurfPoles;
		const NCollection_Array2<gp_Pnt> SurfPoles();

		/****** BRepBlend_AppSurface::SurfShape ******/
		/****** md5 signature: 969593833778f731db9ba7fd1c5ab62d ******/
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

		/****** BRepBlend_AppSurface::SurfUKnots ******/
		/****** md5 signature: 1027553c6b1dff236a0b8cb4928edc43 ******/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "Return
-------
NCollection_Array1<double>

Description
-----------
No available documentation.
") SurfUKnots;
		const NCollection_Array1<double> & SurfUKnots();

		/****** BRepBlend_AppSurface::SurfUMults ******/
		/****** md5 signature: 13e6afb95c6bae07d119ada538cec8a0 ******/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "Return
-------
NCollection_Array1<int>

Description
-----------
No available documentation.
") SurfUMults;
		const NCollection_Array1<int> & SurfUMults();

		/****** BRepBlend_AppSurface::SurfVKnots ******/
		/****** md5 signature: be8d511b070808100553277d9e3d961f ******/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "Return
-------
NCollection_Array1<double>

Description
-----------
No available documentation.
") SurfVKnots;
		const NCollection_Array1<double> & SurfVKnots();

		/****** BRepBlend_AppSurface::SurfVMults ******/
		/****** md5 signature: febf015332f02c022aa8c2a8f833c985 ******/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "Return
-------
NCollection_Array1<int>

Description
-----------
No available documentation.
") SurfVMults;
		const NCollection_Array1<int> & SurfVMults();

		/****** BRepBlend_AppSurface::SurfWeights ******/
		/****** md5 signature: 9ff1463ad6c8f0f062b0c068aeda1043 ******/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "Return
-------
NCollection_Array2<double>

Description
-----------
No available documentation.
") SurfWeights;
		const NCollection_Array2<double> & SurfWeights();

		/****** BRepBlend_AppSurface::Surface ******/
		/****** md5 signature: 671f369dee50862b8a0b7f6a973c380f ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
TPoles: NCollection_Array2<gp_Pnt>
TWeights: NCollection_Array2<double>
TUKnots: NCollection_Array1<double>
TVKnots: NCollection_Array1<double>
TUMults: NCollection_Array1<int>
TVMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Surface;
		void Surface(NCollection_Array2<gp_Pnt> & TPoles, NCollection_Array2<double> & TWeights, NCollection_Array1<double> & TUKnots, NCollection_Array1<double> & TVKnots, NCollection_Array1<int> & TUMults, NCollection_Array1<int> & TVMults);

		/****** BRepBlend_AppSurface::TolCurveOnSurf ******/
		/****** md5 signature: d6477b4bc85f93165a4bf73b1614f603 ******/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
No available documentation.
") TolCurveOnSurf;
		double TolCurveOnSurf(const int Index);

		/****** BRepBlend_AppSurface::UDegree ******/
		/****** md5 signature: fca90e3f2f4c1ba6e7bc9cbc04110d23 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		int UDegree();

		/****** BRepBlend_AppSurface::VDegree ******/
		/****** md5 signature: c793f94fb8ca1e7cdd3fc97529f675d2 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		int VDegree();

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
		/****** BRepBlend_BlendTool::Bounds ******/
		/****** md5 signature: 07986cc0e0af847c43b39e0235c77229 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
Ufirst: double
Ulast: double

Description
-----------
Returns the parametric limits on the arc C. These limits must be finite: they are either the real limits of the arc, for a finite arc, or a bounding box for an infinite arc.
") Bounds;
		static void Bounds(const opencascade::handle<Adaptor2d_Curve2d> & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepBlend_BlendTool::CurveOnSurf ******/
		/****** md5 signature: 42ed509a86edeb73002d5f1d07860770 ******/
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

		/****** BRepBlend_BlendTool::Inters ******/
		/****** md5 signature: f79942c5101b03ec183db7a415d9fbdb ******/
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
Param: double
Dist: double

Description
-----------
No available documentation.
") Inters;
		static bool Inters(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor2d_Curve2d> & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepBlend_BlendTool::NbSamplesU ******/
		/****** md5 signature: 113907439d309bff36ab3cf1a00b7ae6 ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
u1: double
u2: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesU;
		static int NbSamplesU(const opencascade::handle<Adaptor3d_Surface> & S, const double u1, const double u2);

		/****** BRepBlend_BlendTool::NbSamplesV ******/
		/****** md5 signature: 42faef83bc52935522b9fdcc450fc180 ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
v1: double
v2: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesV;
		static int NbSamplesV(const opencascade::handle<Adaptor3d_Surface> & S, const double v1, const double v2);

		/****** BRepBlend_BlendTool::Parameter ******/
		/****** md5 signature: a4a1e345b90e0d76354f88288d2ac12b ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex
A: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
Returns the parameter of the vertex V on the edge A.
") Parameter;
		static double Parameter(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****** BRepBlend_BlendTool::Project ******/
		/****** md5 signature: 301d2e8f199a8fc1889817c33fff3216 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
S: Adaptor3d_Surface
C: Adaptor2d_Curve2d

Return
-------
Paramproj: double
Dist: double

Description
-----------
Projects the point P on the arc C. If the methods returns true, the projection is successful, and Paramproj is the parameter on the arc of the projected point, Dist is the distance between P and the curve.. If the method returns false, Param proj and Dist are not significant.
") Project;
		static bool Project(const gp_Pnt2d & P, const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor2d_Curve2d> & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepBlend_BlendTool::SingularOnUMax ******/
		/****** md5 signature: 4f54c43e05a022062f5dae59aa53b2a3 ******/
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
		static bool SingularOnUMax(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** BRepBlend_BlendTool::SingularOnUMin ******/
		/****** md5 signature: 4432145ebd8b7c72e21f91ef86429cd2 ******/
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
		static bool SingularOnUMin(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** BRepBlend_BlendTool::SingularOnVMax ******/
		/****** md5 signature: a104bdbc9f32212518d1a88ba798b15b ******/
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
		static bool SingularOnVMax(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** BRepBlend_BlendTool::SingularOnVMin ******/
		/****** md5 signature: 62f48f4556ef4706c851883d17d15447 ******/
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
		static bool SingularOnVMin(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** BRepBlend_BlendTool::Tolerance ******/
		/****** md5 signature: ee4f925def96a3458280e98ebd2e3cb6 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex
A: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
Returns the parametric tolerance on the arc A used to consider that the vertex and another point meet, i-e if std::abs(Parameter(Vertex)-Parameter(OtherPnt))<= Tolerance, the points are 'merged'.
") Tolerance;
		static double Tolerance(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & A);

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
		/****** BRepBlend_CurvPointRadInv::BRepBlend_CurvPointRadInv ******/
		/****** md5 signature: 07adfa2c83f449c99a58faec4122a065 ******/
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

		/****** BRepBlend_CurvPointRadInv::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BRepBlend_CurvPointRadInv::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BRepBlend_CurvPointRadInv::GetTolerance ******/
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BRepBlend_CurvPointRadInv::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
Returns true if Sol is a zero of the function. Tol is the tolerance used in 3d space.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BRepBlend_CurvPointRadInv::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 2.
") NbEquations;
		int NbEquations();

		/****** BRepBlend_CurvPointRadInv::Set ******/
		/****** md5 signature: d75662a126e12003d686ba0ef57f21dc ******/
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
		void Set(const int Choix);

		/****** BRepBlend_CurvPointRadInv::Set ******/
		/****** md5 signature: a447914d5d79866783a34f08d939fc6f ******/
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
Set the Point on which a solution has to be found.
") Set;
		void Set(const gp_Pnt & P);

		/****** BRepBlend_CurvPointRadInv::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BRepBlend_CurvPointRadInv::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** BRepBlend_Extremity::BRepBlend_Extremity ******/
		/****** md5 signature: 2f152b6238552d4eda1d4eae96bb18d4 ******/
		%feature("compactdefaultargs") BRepBlend_Extremity;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_Extremity;
		 BRepBlend_Extremity();

		/****** BRepBlend_Extremity::BRepBlend_Extremity ******/
		/****** md5 signature: c5349f6d74e80256eb78674528ed3e23 ******/
		%feature("compactdefaultargs") BRepBlend_Extremity;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
U: double
V: double
Param: double
Tol: double

Return
-------
None

Description
-----------
Creates an extremity on a surface.
") BRepBlend_Extremity;
		 BRepBlend_Extremity(const gp_Pnt & P, const double U, const double V, const double Param, const double Tol);

		/****** BRepBlend_Extremity::BRepBlend_Extremity ******/
		/****** md5 signature: 671654f1753252be784ff59d1114de71 ******/
		%feature("compactdefaultargs") BRepBlend_Extremity;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
U: double
V: double
Param: double
Tol: double
Vtx: Adaptor3d_HVertex

Return
-------
None

Description
-----------
Creates an extremity on a surface. This extremity matches the vertex <Vtx>.
") BRepBlend_Extremity;
		 BRepBlend_Extremity(const gp_Pnt & P, const double U, const double V, const double Param, const double Tol, const opencascade::handle<Adaptor3d_HVertex> & Vtx);

		/****** BRepBlend_Extremity::BRepBlend_Extremity ******/
		/****** md5 signature: 71548b0225d8f6b982c564f35a52f388 ******/
		%feature("compactdefaultargs") BRepBlend_Extremity;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
W: double
Param: double
Tol: double

Return
-------
None

Description
-----------
Creates an extremity on a curve.
") BRepBlend_Extremity;
		 BRepBlend_Extremity(const gp_Pnt & P, const double W, const double Param, const double Tol);

		/****** BRepBlend_Extremity::AddArc ******/
		/****** md5 signature: 4419535bc9088f414ccd4a8ab84b5e07 ******/
		%feature("compactdefaultargs") AddArc;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d
Param: double
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Return
-------
None

Description
-----------
Sets the values of a point which is on the arc A, at parameter Param.
") AddArc;
		void AddArc(const opencascade::handle<Adaptor2d_Curve2d> & A, const double Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****** BRepBlend_Extremity::HasTangent ******/
		/****** md5 signature: de508d9348cdca68daa430ba761c4959 ******/
		%feature("compactdefaultargs") HasTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the Tangent is stored.
") HasTangent;
		bool HasTangent();

		/****** BRepBlend_Extremity::IsVertex ******/
		/****** md5 signature: a2ec0345ec4add7e1d182223d626cf2f ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true when the point coincide with an existing vertex.
") IsVertex;
		bool IsVertex();

		/****** BRepBlend_Extremity::NbPointOnRst ******/
		/****** md5 signature: 2c9cedab78b8343f8dd92ad8ba173137 ******/
		%feature("compactdefaultargs") NbPointOnRst;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of arc containing the extremity. If the method returns 0, the point is inside the surface. Otherwise, the extremity lies on at least 1 arc, and all the information (arc, parameter, transitions) are given by the point on restriction (PointOnRst) returned by the next method.
") NbPointOnRst;
		int NbPointOnRst();

		/****** BRepBlend_Extremity::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter();

		/****** BRepBlend_Extremity::ParameterOnGuide ******/
		/****** md5 signature: 38ab9451a80775c6f3c8c9bd503ceabd ******/
		%feature("compactdefaultargs") ParameterOnGuide;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ParameterOnGuide;
		double ParameterOnGuide();

		/****** BRepBlend_Extremity::Parameters ******/
		/****** md5 signature: 36cd3391d4dcc137204d7c8d09b8d473 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: double
V: double

Description
-----------
This method returns the parameters of the point on the concerned surface.
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepBlend_Extremity::PointOnRst ******/
		/****** md5 signature: 4f5592b38ba1f2d4a58520b2330a85f7 ******/
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
		const BRepBlend_PointOnRst & PointOnRst(const int Index);

		/****** BRepBlend_Extremity::SetTangent ******/
		/****** md5 signature: fe6479f29924454154642419383f0e06 ******/
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

		/****** BRepBlend_Extremity::SetValue ******/
		/****** md5 signature: f0bd15c52544d2a1d1887e10319c0bb3 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
U: double
V: double
Param: double
Tol: double

Return
-------
None

Description
-----------
Set the values for an extremity on a surface.
") SetValue;
		void SetValue(const gp_Pnt & P, const double U, const double V, const double Param, const double Tol);

		/****** BRepBlend_Extremity::SetValue ******/
		/****** md5 signature: fd28fa041ed45d79a223674eba584e28 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
U: double
V: double
Param: double
Tol: double
Vtx: Adaptor3d_HVertex

Return
-------
None

Description
-----------
Set the values for an extremity on a surface.This extremity matches the vertex <Vtx>.
") SetValue;
		void SetValue(const gp_Pnt & P, const double U, const double V, const double Param, const double Tol, const opencascade::handle<Adaptor3d_HVertex> & Vtx);

		/****** BRepBlend_Extremity::SetValue ******/
		/****** md5 signature: 05b85a4a93c539e682d75ac1b4904ab0 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
W: double
Param: double
Tol: double

Return
-------
None

Description
-----------
Set the values for an extremity on curve.
") SetValue;
		void SetValue(const gp_Pnt & P, const double W, const double Param, const double Tol);

		/****** BRepBlend_Extremity::SetVertex ******/
		/****** md5 signature: 1c2d847f9895dadcabe6f5a142550e35 ******/
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

		/****** BRepBlend_Extremity::Tangent ******/
		/****** md5 signature: 00df3077d87c39a1282b20005486cd6f ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
This method returns the value of tangent in 3d space.
") Tangent;
		const gp_Vec Tangent();

		/****** BRepBlend_Extremity::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
This method returns the fuzziness on the point in 3d space.
") Tolerance;
		double Tolerance();

		/****** BRepBlend_Extremity::Value ******/
		/****** md5 signature: eddd2908948849b73f6d8aacab318652 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
This method returns the value of the point in 3d space.
") Value;
		const gp_Pnt Value();

		/****** BRepBlend_Extremity::Vertex ******/
		/****** md5 signature: 7213fb18dc3be1f48818ab739bb98dfa ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_HVertex>

Description
-----------
Returns the vertex when IsVertex returns true.
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
		/****** BRepBlend_HCurve2dTool::BSpline ******/
		/****** md5 signature: 1151b84776305bc0a5c8aaee6f50252d ******/
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

		/****** BRepBlend_HCurve2dTool::Bezier ******/
		/****** md5 signature: 55afc4c0fc79e07de6077214558af461 ******/
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

		/****** BRepBlend_HCurve2dTool::Circle ******/
		/****** md5 signature: 3e4b216e090c5747e712418f4fa66d2c ******/
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

		/****** BRepBlend_HCurve2dTool::Continuity ******/
		/****** md5 signature: 93cd5f75c1ce867aba7a7f12421275f0 ******/
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

		/****** BRepBlend_HCurve2dTool::D0 ******/
		/****** md5 signature: 647414f13617b3951aae630a40485c89 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double
P: gp_Pnt2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		static void D0(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U, gp_Pnt2d & P);

		/****** BRepBlend_HCurve2dTool::D1 ******/
		/****** md5 signature: 4cb67a5cf245485839e9a70d333c71a4 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		static void D1(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U, gp_Pnt2d & P, gp_Vec2d & V);

		/****** BRepBlend_HCurve2dTool::D2 ******/
		/****** md5 signature: 7c8af9f7178b95531f0269176827b3b6 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
") D2;
		static void D2(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** BRepBlend_HCurve2dTool::D3 ******/
		/****** md5 signature: 0d5beba8194fcecf902b3af0a6115ccc ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		static void D3(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** BRepBlend_HCurve2dTool::DN ******/
		/****** md5 signature: c6ea8b27aa6fb1aef473b0dca6417f7f ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		static gp_Vec2d DN(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U, const int N);

		/****** BRepBlend_HCurve2dTool::Ellipse ******/
		/****** md5 signature: 9ddecf68838c4598b17a43e7ee186e6e ******/
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

		/****** BRepBlend_HCurve2dTool::FirstParameter ******/
		/****** md5 signature: ba7dcc17bbcf3ad13ca428fccb4ee295 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		static double FirstParameter(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** BRepBlend_HCurve2dTool::GetType ******/
		/****** md5 signature: 29ec5067d7e913f214c553444ec99b6a ******/
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
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		static GeomAbs_CurveType GetType(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** BRepBlend_HCurve2dTool::Hyperbola ******/
		/****** md5 signature: d710d90c07a9bd6c6e8e1ba3fc1c92bf ******/
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

		/****** BRepBlend_HCurve2dTool::Intervals ******/
		/****** md5 signature: f078f296545d3dd38144048dfca10469 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		static void Intervals(const opencascade::handle<Adaptor2d_Curve2d> & C, NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** BRepBlend_HCurve2dTool::IsClosed ******/
		/****** md5 signature: 2e919d2de6d38bdb8500e5fc59dfa301 ******/
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
		static bool IsClosed(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** BRepBlend_HCurve2dTool::IsPeriodic ******/
		/****** md5 signature: 758f5d32a3e81a7d0cac59086cea6b55 ******/
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
		static bool IsPeriodic(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** BRepBlend_HCurve2dTool::LastParameter ******/
		/****** md5 signature: c3783a6df82a0f461b6597f54b9d3b85 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		static double LastParameter(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** BRepBlend_HCurve2dTool::Line ******/
		/****** md5 signature: cc50bf5bbcfff1340d1951ad804f481d ******/
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

		/****** BRepBlend_HCurve2dTool::NbIntervals ******/
		/****** md5 signature: f892a17175c7690de7e2ba8d55659419 ******/
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
Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>.
") NbIntervals;
		static int NbIntervals(const opencascade::handle<Adaptor2d_Curve2d> & C, const GeomAbs_Shape S);

		/****** BRepBlend_HCurve2dTool::NbSamples ******/
		/****** md5 signature: 1f8960c481dbbc037f35e98ce7810cf6 ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U0: double
U1: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static int NbSamples(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U0, const double U1);

		/****** BRepBlend_HCurve2dTool::Parabola ******/
		/****** md5 signature: 638d7ecde6dd9f67180eadf45347f22e ******/
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

		/****** BRepBlend_HCurve2dTool::Period ******/
		/****** md5 signature: d675e32257b292584f21996f45e5f086 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
No available documentation.
") Period;
		static double Period(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** BRepBlend_HCurve2dTool::Resolution ******/
		/****** md5 signature: cc00f63e5558970ed6d6f4b56109c915 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
R3d: double

Return
-------
double

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		static double Resolution(const opencascade::handle<Adaptor2d_Curve2d> & C, const double R3d);

		/****** BRepBlend_HCurve2dTool::Value ******/
		/****** md5 signature: 7945b3785f38356578b9cc7bd81af491 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		static gp_Pnt2d Value(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U);

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
		/****** BRepBlend_HCurveTool::BSpline ******/
		/****** md5 signature: 73295d8773f31004aa0bf55b549ab48f ******/
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

		/****** BRepBlend_HCurveTool::Bezier ******/
		/****** md5 signature: f306f8462315905af8e276236266123d ******/
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

		/****** BRepBlend_HCurveTool::Circle ******/
		/****** md5 signature: 7b6731a5a54fc11dc51059ac04fa7d96 ******/
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

		/****** BRepBlend_HCurveTool::Continuity ******/
		/****** md5 signature: 36a22861c63402bce70a44cade7cd4e2 ******/
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

		/****** BRepBlend_HCurveTool::D0 ******/
		/****** md5 signature: b151c3eec95a8b4684bbb7b46a6bd11c ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: double
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		static void D0(const opencascade::handle<Adaptor3d_Curve> & C, const double U, gp_Pnt & P);

		/****** BRepBlend_HCurveTool::D1 ******/
		/****** md5 signature: 735992acce8470d086b5d40aac822f46 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: double
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		static void D1(const opencascade::handle<Adaptor3d_Curve> & C, const double U, gp_Pnt & P, gp_Vec & V);

		/****** BRepBlend_HCurveTool::D2 ******/
		/****** md5 signature: e8235de99ba207b2d147efe57263c72f ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: double
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
") D2;
		static void D2(const opencascade::handle<Adaptor3d_Curve> & C, const double U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** BRepBlend_HCurveTool::D3 ******/
		/****** md5 signature: 305b0b4a8126abc519c4dd6a2fc8af16 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: double
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		static void D3(const opencascade::handle<Adaptor3d_Curve> & C, const double U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** BRepBlend_HCurveTool::DN ******/
		/****** md5 signature: d9ad3cebf41989c2145eada67f0495ba ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: double
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		static gp_Vec DN(const opencascade::handle<Adaptor3d_Curve> & C, const double U, const int N);

		/****** BRepBlend_HCurveTool::Ellipse ******/
		/****** md5 signature: c32c615877d264a7d9a959c38c10dac5 ******/
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

		/****** BRepBlend_HCurveTool::FirstParameter ******/
		/****** md5 signature: 90110e6d6bda4c479a5a9a3e2117798a ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		static double FirstParameter(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BRepBlend_HCurveTool::GetType ******/
		/****** md5 signature: a686bd836352e7b0b82151881246c5a7 ******/
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
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		static GeomAbs_CurveType GetType(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BRepBlend_HCurveTool::Hyperbola ******/
		/****** md5 signature: d833c49b900f354e019cfd82c1b21d0e ******/
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

		/****** BRepBlend_HCurveTool::Intervals ******/
		/****** md5 signature: 498f65084b4ea8038f62f2d2ee841e8b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		static void Intervals(const opencascade::handle<Adaptor3d_Curve> & C, NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** BRepBlend_HCurveTool::IsClosed ******/
		/****** md5 signature: 1623dea000941a4874cb03350d5e536d ******/
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
		static bool IsClosed(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BRepBlend_HCurveTool::IsPeriodic ******/
		/****** md5 signature: ee41c4052e7aa08fcd46d4be839f3612 ******/
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
		static bool IsPeriodic(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BRepBlend_HCurveTool::LastParameter ******/
		/****** md5 signature: 2f2b5abe3093075ce4b4810750666125 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		static double LastParameter(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BRepBlend_HCurveTool::Line ******/
		/****** md5 signature: 5d669526ea2c83636bcd5abea25c7993 ******/
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

		/****** BRepBlend_HCurveTool::NbIntervals ******/
		/****** md5 signature: a5a60ed3f6a4b9df58efcd596c1547af ******/
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
Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>.
") NbIntervals;
		static int NbIntervals(const opencascade::handle<Adaptor3d_Curve> & C, const GeomAbs_Shape S);

		/****** BRepBlend_HCurveTool::NbSamples ******/
		/****** md5 signature: 1cd7024b658dee50eb25704471421ead ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U0: double
U1: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static int NbSamples(const opencascade::handle<Adaptor3d_Curve> & C, const double U0, const double U1);

		/****** BRepBlend_HCurveTool::Parabola ******/
		/****** md5 signature: cc30b6b7d2e5eb272de9d92bc65e5ba5 ******/
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

		/****** BRepBlend_HCurveTool::Period ******/
		/****** md5 signature: 91e73e693101995eadd1b492e187d922 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
double

Description
-----------
No available documentation.
") Period;
		static double Period(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** BRepBlend_HCurveTool::Resolution ******/
		/****** md5 signature: ad2523d050badde10967327a041108c9 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
R3d: double

Return
-------
double

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		static double Resolution(const opencascade::handle<Adaptor3d_Curve> & C, const double R3d);

		/****** BRepBlend_HCurveTool::Value ******/
		/****** md5 signature: 7d4ace8ec8acb9ae29b7d65623b7dc72 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: double

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		static gp_Pnt Value(const opencascade::handle<Adaptor3d_Curve> & C, const double U);

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
		/****** BRepBlend_Line::BRepBlend_Line ******/
		/****** md5 signature: 57590f6f2b26126cc4d3122e12289624 ******/
		%feature("compactdefaultargs") BRepBlend_Line;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_Line;
		 BRepBlend_Line();

		/****** BRepBlend_Line::Append ******/
		/****** md5 signature: 112809d39d79c49d6bb13a4922e5b5f5 ******/
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

		/****** BRepBlend_Line::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the line.
") Clear;
		void Clear();

		/****** BRepBlend_Line::EndPointOnFirst ******/
		/****** md5 signature: c529fd184b9e50e1b6ee45bff61b3c9b ******/
		%feature("compactdefaultargs") EndPointOnFirst;
		%feature("autodoc", "Return
-------
BRepBlend_Extremity

Description
-----------
Returns the end point on S1.
") EndPointOnFirst;
		const BRepBlend_Extremity & EndPointOnFirst();

		/****** BRepBlend_Line::EndPointOnSecond ******/
		/****** md5 signature: f1a00edceae5b932c1068ab023d5ec57 ******/
		%feature("compactdefaultargs") EndPointOnSecond;
		%feature("autodoc", "Return
-------
BRepBlend_Extremity

Description
-----------
Returns the point on S2.
") EndPointOnSecond;
		const BRepBlend_Extremity & EndPointOnSecond();

		/****** BRepBlend_Line::InsertBefore ******/
		/****** md5 signature: e261177f9b79f7decdbe34da0964d10a ******/
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
		void InsertBefore(const int Index, const Blend_Point & P);

		/****** BRepBlend_Line::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points in the line.
") NbPoints;
		int NbPoints();

		/****** BRepBlend_Line::Point ******/
		/****** md5 signature: c537341306dbd850c3a4dd9034b56567 ******/
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
Returns the point of range Index.
") Point;
		const Blend_Point & Point(const int Index);

		/****** BRepBlend_Line::Prepend ******/
		/****** md5 signature: 8ea9df6ce05089f4fae42845b69291ef ******/
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

		/****** BRepBlend_Line::Remove ******/
		/****** md5 signature: 1c87ec61b5ae2154f5ff00e2e2957f30 ******/
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
Removes from <self> all the items of positions between <FromIndex> and <ToIndex>. Raises an exception if the indices are out of bounds.
") Remove;
		void Remove(const int FromIndex, const int ToIndex);

		/****** BRepBlend_Line::Set ******/
		/****** md5 signature: 467e8a8ca95b56d13e0b5d0ef5daa15d ******/
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
Sets the value of the transition of the line on S1 and the line on S2.
") Set;
		void Set(const IntSurf_TypeTrans TranS1, const IntSurf_TypeTrans TranS2);

		/****** BRepBlend_Line::Set ******/
		/****** md5 signature: 02e3bdb87daf70bb37bf9aaefbeafc93 ******/
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

		/****** BRepBlend_Line::SetEndPoints ******/
		/****** md5 signature: 65a8d0dfaf022584d756eabf06874704 ******/
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

		/****** BRepBlend_Line::SetStartPoints ******/
		/****** md5 signature: 855f4d4c44344953d7a9de9123e71157 ******/
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

		/****** BRepBlend_Line::StartPointOnFirst ******/
		/****** md5 signature: eb6cbb694252afa50c3045ff6839418c ******/
		%feature("compactdefaultargs") StartPointOnFirst;
		%feature("autodoc", "Return
-------
BRepBlend_Extremity

Description
-----------
Returns the start point on S1.
") StartPointOnFirst;
		const BRepBlend_Extremity & StartPointOnFirst();

		/****** BRepBlend_Line::StartPointOnSecond ******/
		/****** md5 signature: 152e6eaee5b76910bd5605ccb0d2a63a ******/
		%feature("compactdefaultargs") StartPointOnSecond;
		%feature("autodoc", "Return
-------
BRepBlend_Extremity

Description
-----------
Returns the start point on S2.
") StartPointOnSecond;
		const BRepBlend_Extremity & StartPointOnSecond();

		/****** BRepBlend_Line::TransitionOnS ******/
		/****** md5 signature: ac2f27afdd16ab93ea1f959cb2bf6e33 ******/
		%feature("compactdefaultargs") TransitionOnS;
		%feature("autodoc", "Return
-------
IntSurf_TypeTrans

Description
-----------
Returns the type of the transition of the line defined on the surface.
") TransitionOnS;
		IntSurf_TypeTrans TransitionOnS();

		/****** BRepBlend_Line::TransitionOnS1 ******/
		/****** md5 signature: 9de184f3b47c2902be7de5eb10743898 ******/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "Return
-------
IntSurf_TypeTrans

Description
-----------
Returns the type of the transition of the line defined on the first surface. The transition is 'constant' along the line. The transition is IN if the line is oriented in such a way that the system of vectors (N,DRac,T) is right-handed, where N is the normal to the first surface at a point P, DRac is a vector tangent to the blending patch, oriented towards the valid part of this patch, T is the tangent to the line on S1 at P. The transitioon is OUT when the system of vectors is left-handed.
") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1();

		/****** BRepBlend_Line::TransitionOnS2 ******/
		/****** md5 signature: aafa064949332278d0d49be3da4c6df2 ******/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "Return
-------
IntSurf_TypeTrans

Description
-----------
Returns the type of the transition of the line defined on the second surface. The transition is 'constant' along the line.
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
		/****** BRepBlend_PointOnRst::BRepBlend_PointOnRst ******/
		/****** md5 signature: 090e4894ad074e2741323f5dc694aebc ******/
		%feature("compactdefaultargs") BRepBlend_PointOnRst;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepBlend_PointOnRst;
		 BRepBlend_PointOnRst();

		/****** BRepBlend_PointOnRst::BRepBlend_PointOnRst ******/
		/****** md5 signature: b2f36a883beb1aaf25054c5e7feaad59 ******/
		%feature("compactdefaultargs") BRepBlend_PointOnRst;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d
Param: double
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Return
-------
None

Description
-----------
Creates the PointOnRst on the arc A, at parameter Param, with the transition TLine on the walking line, and TArc on the arc A.
") BRepBlend_PointOnRst;
		 BRepBlend_PointOnRst(const opencascade::handle<Adaptor2d_Curve2d> & A, const double Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****** BRepBlend_PointOnRst::Arc ******/
		/****** md5 signature: de8e47510fc50811ee5a3e0bc98029e6 ******/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the arc of restriction containing the vertex.
") Arc;
		const opencascade::handle<Adaptor2d_Curve2d> & Arc();

		/****** BRepBlend_PointOnRst::ParameterOnArc ******/
		/****** md5 signature: 325a1d6a3796b5402c690f182eda9fae ******/
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter of the point on the arc returned by the method Arc().
") ParameterOnArc;
		double ParameterOnArc();

		/****** BRepBlend_PointOnRst::SetArc ******/
		/****** md5 signature: 5c4699ae69e22b4401b79d28dab15578 ******/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d
Param: double
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Return
-------
None

Description
-----------
Sets the values of a point which is on the arc A, at parameter Param.
") SetArc;
		void SetArc(const opencascade::handle<Adaptor2d_Curve2d> & A, const double Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****** BRepBlend_PointOnRst::TransitionOnArc ******/
		/****** md5 signature: adc9ee508ec8cbe59ce8b05248cd454a ******/
		%feature("compactdefaultargs") TransitionOnArc;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
Returns the transition of the point on the arc returned by Arc().
") TransitionOnArc;
		const IntSurf_Transition & TransitionOnArc();

		/****** BRepBlend_PointOnRst::TransitionOnLine ******/
		/****** md5 signature: 1ffbcf064eb110daaac7ceebff0fcde5 ******/
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
		/****** BRepBlend_RstRstConstRad::BRepBlend_RstRstConstRad ******/
		/****** md5 signature: 074ead157514803251d86880fa21933a ******/
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

		/****** BRepBlend_RstRstConstRad::CenterCircleRst1Rst2 ******/
		/****** md5 signature: db99c4b162001626754a866a05deb241 ******/
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
Give the center of circle define by PtRst1, PtRst2 and radius ray.
") CenterCircleRst1Rst2;
		bool CenterCircleRst1Rst2(const gp_Pnt & PtRst1, const gp_Pnt & PtRst2, const gp_Vec & np, gp_Pnt & Center, gp_Vec & VdMed);

		/****** BRepBlend_RstRstConstRad::Decroch ******/
		/****** md5 signature: 1dabd2a2277204fc65b6e7cc4a532398 ******/
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
Allows implementing a specific termination criterion for the function.
") Decroch;
		Blend_DecrochStatus Decroch(const math_Vector & Sol, gp_Vec & NRst1, gp_Vec & TgRst1, gp_Vec & NRst2, gp_Vec & TgRst2);

		/****** BRepBlend_RstRstConstRad::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BRepBlend_RstRstConstRad::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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

		/****** BRepBlend_RstRstConstRad::GetMinimalDistance ******/
		/****** md5 signature: 5a18315a70b74cf958327e394dbfbb07 ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		double GetMinimalDistance();

		/****** BRepBlend_RstRstConstRad::GetMinimalWeight ******/
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(NCollection_Array1<double> & Weigths);

		/****** BRepBlend_RstRstConstRad::GetSectionSize ******/
		/****** md5 signature: 4b20b399dae9a40b81b614c46e43dbe0 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		double GetSectionSize();

		/****** BRepBlend_RstRstConstRad::GetShape ******/
		/****** md5 signature: 363e82c53157bdd080784e1e83b31277 ******/
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

		/****** BRepBlend_RstRstConstRad::GetTolerance ******/
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BRepBlend_RstRstConstRad::GetTolerance ******/
		/****** md5 signature: 33aef456d91269e49aa44741ceb0b619 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BRepBlend_RstRstConstRad::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** BRepBlend_RstRstConstRad::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		bool IsRational();

		/****** BRepBlend_RstRstConstRad::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BRepBlend_RstRstConstRad::IsTangencyPoint ******/
		/****** md5 signature: 774343cbd942c86b776fb9acb281a4b0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		bool IsTangencyPoint();

		/****** BRepBlend_RstRstConstRad::Knots ******/
		/****** md5 signature: 7b60038801b1119c8fec8ad932ddbd42 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(NCollection_Array1<double> & TKnots);

		/****** BRepBlend_RstRstConstRad::Mults ******/
		/****** md5 signature: 533abca17062c451e56616867e5ff1a2 ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(NCollection_Array1<int> & TMults);

		/****** BRepBlend_RstRstConstRad::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 2.
") NbEquations;
		int NbEquations();

		/****** BRepBlend_RstRstConstRad::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		int NbIntervals(const GeomAbs_Shape S);

		/****** BRepBlend_RstRstConstRad::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 2.
") NbVariables;
		int NbVariables();

		/****** BRepBlend_RstRstConstRad::ParameterOnRst1 ******/
		/****** md5 signature: aafcf7d42c452055ebf10f5af1551e29 ******/
		%feature("compactdefaultargs") ParameterOnRst1;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst1;
		double ParameterOnRst1();

		/****** BRepBlend_RstRstConstRad::ParameterOnRst2 ******/
		/****** md5 signature: 9616e375d3b92b4a33d66b7aee39e49a ******/
		%feature("compactdefaultargs") ParameterOnRst2;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst2;
		double ParameterOnRst2();

		/****** BRepBlend_RstRstConstRad::Pnt2dOnRst1 ******/
		/****** md5 signature: 5c131f9e260c7c0e48a04c9da8c2d851 ******/
		%feature("compactdefaultargs") Pnt2dOnRst1;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns U,V coordinates of the point on the surface.
") Pnt2dOnRst1;
		const gp_Pnt2d Pnt2dOnRst1();

		/****** BRepBlend_RstRstConstRad::Pnt2dOnRst2 ******/
		/****** md5 signature: 6a40f621ad0ff461030028e07f81fefb ******/
		%feature("compactdefaultargs") Pnt2dOnRst2;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns U,V coordinates of the point on the curve on surface.
") Pnt2dOnRst2;
		const gp_Pnt2d Pnt2dOnRst2();

		/****** BRepBlend_RstRstConstRad::PointOnRst1 ******/
		/****** md5 signature: 005873f06bc6542e2afcfc486880ad1e ******/
		%feature("compactdefaultargs") PointOnRst1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnRst1;
		const gp_Pnt PointOnRst1();

		/****** BRepBlend_RstRstConstRad::PointOnRst2 ******/
		/****** md5 signature: 08405441470645e4aa7ff546f8f6c79c ******/
		%feature("compactdefaultargs") PointOnRst2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnRst2;
		const gp_Pnt PointOnRst2();

		/****** BRepBlend_RstRstConstRad::Resolution ******/
		/****** md5 signature: 9158c53df983d12b6be8699963ad27aa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const int IC2d, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepBlend_RstRstConstRad::Section ******/
		/****** md5 signature: c4dbb3d215b9459d88d92e76947735ca ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: double
U: double
V: double
C: gp_Circ

Return
-------
Pdeb: double
Pfin: double

Description
-----------
No available documentation.
") Section;
		void Section(const double Param, const double U, const double V, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****** BRepBlend_RstRstConstRad::Section ******/
		/****** md5 signature: 8829facb3a5568465aca472419737777 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths);

		/****** BRepBlend_RstRstConstRad::Section ******/
		/****** md5 signature: 854a31f8dfe55e0672f7cd1dc2ed6b18 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
Poles2d: NCollection_Array1<gp_Pnt2d>
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<double> & Weigths);

		/****** BRepBlend_RstRstConstRad::Section ******/
		/****** md5 signature: 6f6f4c888ddceca92f3fa6c8fdae3e34 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
D2Poles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
D2Poles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>
D2Weigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section The method returns true if the derivatives are computed, otherwise it returns false.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Vec> & D2Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<gp_Vec2d> & D2Poles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths, NCollection_Array1<double> & D2Weigths);

		/****** BRepBlend_RstRstConstRad::Set ******/
		/****** md5 signature: 1d39a94f99a01338cb8afa4a49c68510 ******/
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

		/****** BRepBlend_RstRstConstRad::Set ******/
		/****** md5 signature: b605056efb3500b59398ce278f827e0a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Param);

		/****** BRepBlend_RstRstConstRad::Set ******/
		/****** md5 signature: a446b778eac4e0112e7c78eac5a7dfd6 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.
") Set;
		void Set(const double First, const double Last);

		/****** BRepBlend_RstRstConstRad::Set ******/
		/****** md5 signature: 8831783d575e11656545551bff3e87e3 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Radius: double
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Radius, const int Choix);

		/****** BRepBlend_RstRstConstRad::Set ******/
		/****** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ******/
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

		/****** BRepBlend_RstRstConstRad::Tangent2dOnRst1 ******/
		/****** md5 signature: d1643430b19439fbfc714f2958002902 ******/
		%feature("compactdefaultargs") Tangent2dOnRst1;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnRst1;
		const gp_Vec2d Tangent2dOnRst1();

		/****** BRepBlend_RstRstConstRad::Tangent2dOnRst2 ******/
		/****** md5 signature: cfe1633001c18ba5ce7a7259986adc45 ******/
		%feature("compactdefaultargs") Tangent2dOnRst2;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnRst2;
		const gp_Vec2d Tangent2dOnRst2();

		/****** BRepBlend_RstRstConstRad::TangentOnRst1 ******/
		/****** md5 signature: 0f79c42d131de66f4d1f20bf099f3cad ******/
		%feature("compactdefaultargs") TangentOnRst1;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnRst1;
		const gp_Vec TangentOnRst1();

		/****** BRepBlend_RstRstConstRad::TangentOnRst2 ******/
		/****** md5 signature: d935af29658dd88246abc647b7f0450b ******/
		%feature("compactdefaultargs") TangentOnRst2;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnRst2;
		const gp_Vec TangentOnRst2();

		/****** BRepBlend_RstRstConstRad::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BRepBlend_RstRstConstRad::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** BRepBlend_RstRstEvolRad::BRepBlend_RstRstEvolRad ******/
		/****** md5 signature: d79d517ef0e965cc32a0fc12487d3855 ******/
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

		/****** BRepBlend_RstRstEvolRad::CenterCircleRst1Rst2 ******/
		/****** md5 signature: db99c4b162001626754a866a05deb241 ******/
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
Gives the center of circle defined by PtRst1, PtRst2 and radius ray.
") CenterCircleRst1Rst2;
		bool CenterCircleRst1Rst2(const gp_Pnt & PtRst1, const gp_Pnt & PtRst2, const gp_Vec & np, gp_Pnt & Center, gp_Vec & VdMed);

		/****** BRepBlend_RstRstEvolRad::Decroch ******/
		/****** md5 signature: 1dabd2a2277204fc65b6e7cc4a532398 ******/
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

		/****** BRepBlend_RstRstEvolRad::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BRepBlend_RstRstEvolRad::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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

		/****** BRepBlend_RstRstEvolRad::GetMinimalDistance ******/
		/****** md5 signature: 5a18315a70b74cf958327e394dbfbb07 ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		double GetMinimalDistance();

		/****** BRepBlend_RstRstEvolRad::GetMinimalWeight ******/
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(NCollection_Array1<double> & Weigths);

		/****** BRepBlend_RstRstEvolRad::GetSectionSize ******/
		/****** md5 signature: 4b20b399dae9a40b81b614c46e43dbe0 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		double GetSectionSize();

		/****** BRepBlend_RstRstEvolRad::GetShape ******/
		/****** md5 signature: 363e82c53157bdd080784e1e83b31277 ******/
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

		/****** BRepBlend_RstRstEvolRad::GetTolerance ******/
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BRepBlend_RstRstEvolRad::GetTolerance ******/
		/****** md5 signature: 33aef456d91269e49aa44741ceb0b619 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BRepBlend_RstRstEvolRad::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** BRepBlend_RstRstEvolRad::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		bool IsRational();

		/****** BRepBlend_RstRstEvolRad::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BRepBlend_RstRstEvolRad::IsTangencyPoint ******/
		/****** md5 signature: 774343cbd942c86b776fb9acb281a4b0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		bool IsTangencyPoint();

		/****** BRepBlend_RstRstEvolRad::Knots ******/
		/****** md5 signature: 7b60038801b1119c8fec8ad932ddbd42 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(NCollection_Array1<double> & TKnots);

		/****** BRepBlend_RstRstEvolRad::Mults ******/
		/****** md5 signature: 533abca17062c451e56616867e5ff1a2 ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(NCollection_Array1<int> & TMults);

		/****** BRepBlend_RstRstEvolRad::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 2.
") NbEquations;
		int NbEquations();

		/****** BRepBlend_RstRstEvolRad::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		int NbIntervals(const GeomAbs_Shape S);

		/****** BRepBlend_RstRstEvolRad::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 2.
") NbVariables;
		int NbVariables();

		/****** BRepBlend_RstRstEvolRad::ParameterOnRst1 ******/
		/****** md5 signature: aafcf7d42c452055ebf10f5af1551e29 ******/
		%feature("compactdefaultargs") ParameterOnRst1;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst1;
		double ParameterOnRst1();

		/****** BRepBlend_RstRstEvolRad::ParameterOnRst2 ******/
		/****** md5 signature: 9616e375d3b92b4a33d66b7aee39e49a ******/
		%feature("compactdefaultargs") ParameterOnRst2;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst2;
		double ParameterOnRst2();

		/****** BRepBlend_RstRstEvolRad::Pnt2dOnRst1 ******/
		/****** md5 signature: 5c131f9e260c7c0e48a04c9da8c2d851 ******/
		%feature("compactdefaultargs") Pnt2dOnRst1;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns U,V coordinates of the point on the surface.
") Pnt2dOnRst1;
		const gp_Pnt2d Pnt2dOnRst1();

		/****** BRepBlend_RstRstEvolRad::Pnt2dOnRst2 ******/
		/****** md5 signature: 6a40f621ad0ff461030028e07f81fefb ******/
		%feature("compactdefaultargs") Pnt2dOnRst2;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns U,V coordinates of the point on the curve on surface.
") Pnt2dOnRst2;
		const gp_Pnt2d Pnt2dOnRst2();

		/****** BRepBlend_RstRstEvolRad::PointOnRst1 ******/
		/****** md5 signature: 005873f06bc6542e2afcfc486880ad1e ******/
		%feature("compactdefaultargs") PointOnRst1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnRst1;
		const gp_Pnt PointOnRst1();

		/****** BRepBlend_RstRstEvolRad::PointOnRst2 ******/
		/****** md5 signature: 08405441470645e4aa7ff546f8f6c79c ******/
		%feature("compactdefaultargs") PointOnRst2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnRst2;
		const gp_Pnt PointOnRst2();

		/****** BRepBlend_RstRstEvolRad::Resolution ******/
		/****** md5 signature: 9158c53df983d12b6be8699963ad27aa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const int IC2d, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepBlend_RstRstEvolRad::Section ******/
		/****** md5 signature: c4dbb3d215b9459d88d92e76947735ca ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: double
U: double
V: double
C: gp_Circ

Return
-------
Pdeb: double
Pfin: double

Description
-----------
No available documentation.
") Section;
		void Section(const double Param, const double U, const double V, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****** BRepBlend_RstRstEvolRad::Section ******/
		/****** md5 signature: 8829facb3a5568465aca472419737777 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths);

		/****** BRepBlend_RstRstEvolRad::Section ******/
		/****** md5 signature: 854a31f8dfe55e0672f7cd1dc2ed6b18 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
Poles2d: NCollection_Array1<gp_Pnt2d>
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<double> & Weigths);

		/****** BRepBlend_RstRstEvolRad::Section ******/
		/****** md5 signature: 6f6f4c888ddceca92f3fa6c8fdae3e34 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
D2Poles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
D2Poles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>
D2Weigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section The method returns true if the derivatives are computed, otherwise it returns false.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Vec> & D2Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<gp_Vec2d> & D2Poles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths, NCollection_Array1<double> & D2Weigths);

		/****** BRepBlend_RstRstEvolRad::Set ******/
		/****** md5 signature: 1d39a94f99a01338cb8afa4a49c68510 ******/
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

		/****** BRepBlend_RstRstEvolRad::Set ******/
		/****** md5 signature: b605056efb3500b59398ce278f827e0a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Param);

		/****** BRepBlend_RstRstEvolRad::Set ******/
		/****** md5 signature: a446b778eac4e0112e7c78eac5a7dfd6 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.
") Set;
		void Set(const double First, const double Last);

		/****** BRepBlend_RstRstEvolRad::Set ******/
		/****** md5 signature: d75662a126e12003d686ba0ef57f21dc ******/
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
		void Set(const int Choix);

		/****** BRepBlend_RstRstEvolRad::Set ******/
		/****** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ******/
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

		/****** BRepBlend_RstRstEvolRad::Tangent2dOnRst1 ******/
		/****** md5 signature: d1643430b19439fbfc714f2958002902 ******/
		%feature("compactdefaultargs") Tangent2dOnRst1;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnRst1;
		const gp_Vec2d Tangent2dOnRst1();

		/****** BRepBlend_RstRstEvolRad::Tangent2dOnRst2 ******/
		/****** md5 signature: cfe1633001c18ba5ce7a7259986adc45 ******/
		%feature("compactdefaultargs") Tangent2dOnRst2;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnRst2;
		const gp_Vec2d Tangent2dOnRst2();

		/****** BRepBlend_RstRstEvolRad::TangentOnRst1 ******/
		/****** md5 signature: 0f79c42d131de66f4d1f20bf099f3cad ******/
		%feature("compactdefaultargs") TangentOnRst1;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnRst1;
		const gp_Vec TangentOnRst1();

		/****** BRepBlend_RstRstEvolRad::TangentOnRst2 ******/
		/****** md5 signature: d935af29658dd88246abc647b7f0450b ******/
		%feature("compactdefaultargs") TangentOnRst2;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnRst2;
		const gp_Vec TangentOnRst2();

		/****** BRepBlend_RstRstEvolRad::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BRepBlend_RstRstEvolRad::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** BRepBlend_RstRstLineBuilder::BRepBlend_RstRstLineBuilder ******/
		/****** md5 signature: 0fa89a48d67b7f761c8ed2cee361f92f ******/
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

		/****** BRepBlend_RstRstLineBuilder::Complete ******/
		/****** md5 signature: 735ce6dc8760c465372b37831ea02796 ******/
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "
Parameters
----------
Func: Blend_RstRstFunction
Finv1: Blend_SurfCurvFuncInv
FinvP1: Blend_CurvPointFuncInv
Finv2: Blend_SurfCurvFuncInv
FinvP2: Blend_CurvPointFuncInv
Pmin: double

Return
-------
bool

Description
-----------
No available documentation.
") Complete;
		bool Complete(Blend_RstRstFunction & Func, Blend_SurfCurvFuncInv & Finv1, Blend_CurvPointFuncInv & FinvP1, Blend_SurfCurvFuncInv & Finv2, Blend_CurvPointFuncInv & FinvP2, const double Pmin);

		/****** BRepBlend_RstRstLineBuilder::Decroch1End ******/
		/****** md5 signature: 228022957933f90b8f2a77ab2cd6de09 ******/
		%feature("compactdefaultargs") Decroch1End;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Decroch1End;
		bool Decroch1End();

		/****** BRepBlend_RstRstLineBuilder::Decroch1Start ******/
		/****** md5 signature: 14ffb4e9f24b3d010d27ea70b5b589fb ******/
		%feature("compactdefaultargs") Decroch1Start;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Decroch1Start;
		bool Decroch1Start();

		/****** BRepBlend_RstRstLineBuilder::Decroch2End ******/
		/****** md5 signature: 59d54337c847628da338d80fa8a863de ******/
		%feature("compactdefaultargs") Decroch2End;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Decroch2End;
		bool Decroch2End();

		/****** BRepBlend_RstRstLineBuilder::Decroch2Start ******/
		/****** md5 signature: 46fa4dd357162b9d3201637ab5ed9f1e ******/
		%feature("compactdefaultargs") Decroch2Start;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Decroch2Start;
		bool Decroch2Start();

		/****** BRepBlend_RstRstLineBuilder::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** BRepBlend_RstRstLineBuilder::Line ******/
		/****** md5 signature: 9bbdb2164431d955d7a3a08a37fd239f ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepBlend_Line>

Description
-----------
No available documentation.
") Line;
		const opencascade::handle<BRepBlend_Line> & Line();

		/****** BRepBlend_RstRstLineBuilder::Perform ******/
		/****** md5 signature: 259d1baca77bbf82db313308c15b95d2 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Func: Blend_RstRstFunction
Finv1: Blend_SurfCurvFuncInv
FinvP1: Blend_CurvPointFuncInv
Finv2: Blend_SurfCurvFuncInv
FinvP2: Blend_CurvPointFuncInv
Pdep: double
Pmax: double
MaxStep: double
Tol3d: double
TolGuide: double
Soldep: math_Vector
Fleche: double
Appro: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(Blend_RstRstFunction & Func, Blend_SurfCurvFuncInv & Finv1, Blend_CurvPointFuncInv & FinvP1, Blend_SurfCurvFuncInv & Finv2, Blend_CurvPointFuncInv & FinvP2, const double Pdep, const double Pmax, const double MaxStep, const double Tol3d, const double TolGuide, const math_Vector & Soldep, const double Fleche, const bool Appro = false);

		/****** BRepBlend_RstRstLineBuilder::PerformFirstSection ******/
		/****** md5 signature: 70017e1f179453bfa4e3e3adf987027e ******/
		%feature("compactdefaultargs") PerformFirstSection;
		%feature("autodoc", "
Parameters
----------
Func: Blend_RstRstFunction
Finv1: Blend_SurfCurvFuncInv
FinvP1: Blend_CurvPointFuncInv
Finv2: Blend_SurfCurvFuncInv
FinvP2: Blend_CurvPointFuncInv
Pdep: double
Pmax: double
Soldep: math_Vector
Tol3d: double
TolGuide: double
RecRst1: bool
RecP1: bool
RecRst2: bool
RecP2: bool
ParSol: math_Vector

Return
-------
Psol: double

Description
-----------
No available documentation.
") PerformFirstSection;
		bool PerformFirstSection(Blend_RstRstFunction & Func, Blend_SurfCurvFuncInv & Finv1, Blend_CurvPointFuncInv & FinvP1, Blend_SurfCurvFuncInv & Finv2, Blend_CurvPointFuncInv & FinvP2, const double Pdep, const double Pmax, const math_Vector & Soldep, const double Tol3d, const double TolGuide, const bool RecRst1, const bool RecP1, const bool RecRst2, const bool RecP2, Standard_Real &OutValue, math_Vector & ParSol);

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
		/****** BRepBlend_SurfCurvConstRadInv::BRepBlend_SurfCurvConstRadInv ******/
		/****** md5 signature: 413667a5e3be555bb1567d000f5c37ac ******/
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

		/****** BRepBlend_SurfCurvConstRadInv::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BRepBlend_SurfCurvConstRadInv::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BRepBlend_SurfCurvConstRadInv::GetTolerance ******/
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BRepBlend_SurfCurvConstRadInv::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
Returns true if Sol is a zero of the function. Tol is the tolerance used in 3d space.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BRepBlend_SurfCurvConstRadInv::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 3.
") NbEquations;
		int NbEquations();

		/****** BRepBlend_SurfCurvConstRadInv::Set ******/
		/****** md5 signature: f34c5931b25cd1eff5ce4bd1b1986eb2 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
R: double
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double R, const int Choix);

		/****** BRepBlend_SurfCurvConstRadInv::Set ******/
		/****** md5 signature: 9dfc8209b85e083fe30dc4f3cba37428 ******/
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

		/****** BRepBlend_SurfCurvConstRadInv::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BRepBlend_SurfCurvConstRadInv::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** BRepBlend_SurfCurvEvolRadInv::BRepBlend_SurfCurvEvolRadInv ******/
		/****** md5 signature: f4c992f2047ba724a04cb63a1497cb15 ******/
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

		/****** BRepBlend_SurfCurvEvolRadInv::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BRepBlend_SurfCurvEvolRadInv::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BRepBlend_SurfCurvEvolRadInv::GetTolerance ******/
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BRepBlend_SurfCurvEvolRadInv::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
Returns true if Sol is a zero of the function. Tol is the tolerance used in 3d space.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BRepBlend_SurfCurvEvolRadInv::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 3.
") NbEquations;
		int NbEquations();

		/****** BRepBlend_SurfCurvEvolRadInv::Set ******/
		/****** md5 signature: d75662a126e12003d686ba0ef57f21dc ******/
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
		void Set(const int Choix);

		/****** BRepBlend_SurfCurvEvolRadInv::Set ******/
		/****** md5 signature: 9dfc8209b85e083fe30dc4f3cba37428 ******/
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

		/****** BRepBlend_SurfCurvEvolRadInv::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BRepBlend_SurfCurvEvolRadInv::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** BRepBlend_SurfPointConstRadInv::BRepBlend_SurfPointConstRadInv ******/
		/****** md5 signature: 993f0d82d4c56cde29f6ef73aee3531d ******/
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

		/****** BRepBlend_SurfPointConstRadInv::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BRepBlend_SurfPointConstRadInv::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BRepBlend_SurfPointConstRadInv::GetTolerance ******/
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BRepBlend_SurfPointConstRadInv::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
Returns true if Sol is a zero of the function. Tol is the tolerance used in 3d space.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BRepBlend_SurfPointConstRadInv::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 3.
") NbEquations;
		int NbEquations();

		/****** BRepBlend_SurfPointConstRadInv::Set ******/
		/****** md5 signature: f34c5931b25cd1eff5ce4bd1b1986eb2 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
R: double
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double R, const int Choix);

		/****** BRepBlend_SurfPointConstRadInv::Set ******/
		/****** md5 signature: a447914d5d79866783a34f08d939fc6f ******/
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
Set the Point on which a solution has to be found.
") Set;
		void Set(const gp_Pnt & P);

		/****** BRepBlend_SurfPointConstRadInv::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BRepBlend_SurfPointConstRadInv::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** BRepBlend_SurfPointEvolRadInv::BRepBlend_SurfPointEvolRadInv ******/
		/****** md5 signature: f3eea577ae1852a9a7135e6772c85ac4 ******/
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

		/****** BRepBlend_SurfPointEvolRadInv::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BRepBlend_SurfPointEvolRadInv::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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
Returns in the vector InfBound the lowest values allowed for each of the 3 variables. Returns in the vector SupBound the greatest values allowed for each of the 3 variables.
") GetBounds;
		void GetBounds(math_Vector & InfBound, math_Vector & SupBound);

		/****** BRepBlend_SurfPointEvolRadInv::GetTolerance ******/
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
Returns in the vector Tolerance the parametric tolerance for each of the 3 variables; Tol is the tolerance used in 3d space.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BRepBlend_SurfPointEvolRadInv::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
Returns true if Sol is a zero of the function. Tol is the tolerance used in 3d space.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BRepBlend_SurfPointEvolRadInv::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 3.
") NbEquations;
		int NbEquations();

		/****** BRepBlend_SurfPointEvolRadInv::Set ******/
		/****** md5 signature: d75662a126e12003d686ba0ef57f21dc ******/
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
		void Set(const int Choix);

		/****** BRepBlend_SurfPointEvolRadInv::Set ******/
		/****** md5 signature: a447914d5d79866783a34f08d939fc6f ******/
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
Set the Point on which a solution has to be found.
") Set;
		void Set(const gp_Pnt & P);

		/****** BRepBlend_SurfPointEvolRadInv::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BRepBlend_SurfPointEvolRadInv::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** BRepBlend_SurfRstConstRad::BRepBlend_SurfRstConstRad ******/
		/****** md5 signature: 61178a969de9578c5b02b8a945a3f459 ******/
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

		/****** BRepBlend_SurfRstConstRad::Decroch ******/
		/****** md5 signature: 7cafc012aa0fef16b46f50fac214824a ******/
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
Enables implementation of a criterion of decrochage specific to the function. Warning: Can be called without previous call of IsSolution but the values calculated can be senseless.
") Decroch;
		bool Decroch(const math_Vector & Sol, gp_Vec & NS, gp_Vec & TgS);

		/****** BRepBlend_SurfRstConstRad::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BRepBlend_SurfRstConstRad::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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

		/****** BRepBlend_SurfRstConstRad::GetMinimalDistance ******/
		/****** md5 signature: 5a18315a70b74cf958327e394dbfbb07 ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		double GetMinimalDistance();

		/****** BRepBlend_SurfRstConstRad::GetMinimalWeight ******/
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(NCollection_Array1<double> & Weigths);

		/****** BRepBlend_SurfRstConstRad::GetSectionSize ******/
		/****** md5 signature: 4b20b399dae9a40b81b614c46e43dbe0 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		double GetSectionSize();

		/****** BRepBlend_SurfRstConstRad::GetShape ******/
		/****** md5 signature: 363e82c53157bdd080784e1e83b31277 ******/
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

		/****** BRepBlend_SurfRstConstRad::GetTolerance ******/
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BRepBlend_SurfRstConstRad::GetTolerance ******/
		/****** md5 signature: 33aef456d91269e49aa44741ceb0b619 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BRepBlend_SurfRstConstRad::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** BRepBlend_SurfRstConstRad::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		bool IsRational();

		/****** BRepBlend_SurfRstConstRad::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BRepBlend_SurfRstConstRad::IsTangencyPoint ******/
		/****** md5 signature: 774343cbd942c86b776fb9acb281a4b0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		bool IsTangencyPoint();

		/****** BRepBlend_SurfRstConstRad::Knots ******/
		/****** md5 signature: 7b60038801b1119c8fec8ad932ddbd42 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(NCollection_Array1<double> & TKnots);

		/****** BRepBlend_SurfRstConstRad::Mults ******/
		/****** md5 signature: 533abca17062c451e56616867e5ff1a2 ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(NCollection_Array1<int> & TMults);

		/****** BRepBlend_SurfRstConstRad::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbEquations;
		int NbEquations();

		/****** BRepBlend_SurfRstConstRad::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		int NbIntervals(const GeomAbs_Shape S);

		/****** BRepBlend_SurfRstConstRad::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbVariables;
		int NbVariables();

		/****** BRepBlend_SurfRstConstRad::ParameterOnRst ******/
		/****** md5 signature: 988d9f4f658d273322feb505a2b37fbd ******/
		%feature("compactdefaultargs") ParameterOnRst;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst;
		double ParameterOnRst();

		/****** BRepBlend_SurfRstConstRad::Pnt2dOnRst ******/
		/****** md5 signature: ea11411911e52cd3fbfd82ea42ca483b ******/
		%feature("compactdefaultargs") Pnt2dOnRst;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns U,V coordinates of the point on the curve on surface.
") Pnt2dOnRst;
		const gp_Pnt2d Pnt2dOnRst();

		/****** BRepBlend_SurfRstConstRad::Pnt2dOnS ******/
		/****** md5 signature: fadb36be226684cb5ba0c4edd28a8d6f ******/
		%feature("compactdefaultargs") Pnt2dOnS;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns U,V coordinates of the point on the surface.
") Pnt2dOnS;
		const gp_Pnt2d Pnt2dOnS();

		/****** BRepBlend_SurfRstConstRad::PointOnRst ******/
		/****** md5 signature: 512c6fb352f147cfc0c4bf13d145c6fc ******/
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnRst;
		const gp_Pnt PointOnRst();

		/****** BRepBlend_SurfRstConstRad::PointOnS ******/
		/****** md5 signature: 05d46557ea4c8c09ee7501573b0d89a8 ******/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS;
		const gp_Pnt PointOnS();

		/****** BRepBlend_SurfRstConstRad::Resolution ******/
		/****** md5 signature: 9158c53df983d12b6be8699963ad27aa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const int IC2d, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepBlend_SurfRstConstRad::Section ******/
		/****** md5 signature: 56d60f49e7d3a8efd63b085758759bc0 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: double
U: double
V: double
W: double
C: gp_Circ

Return
-------
Pdeb: double
Pfin: double

Description
-----------
No available documentation.
") Section;
		void Section(const double Param, const double U, const double V, const double W, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****** BRepBlend_SurfRstConstRad::Section ******/
		/****** md5 signature: 8829facb3a5568465aca472419737777 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths);

		/****** BRepBlend_SurfRstConstRad::Section ******/
		/****** md5 signature: 6f6f4c888ddceca92f3fa6c8fdae3e34 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
D2Poles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
D2Poles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>
D2Weigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section The method returns true if the derivatives are computed, otherwise it returns false.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Vec> & D2Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<gp_Vec2d> & D2Poles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths, NCollection_Array1<double> & D2Weigths);

		/****** BRepBlend_SurfRstConstRad::Section ******/
		/****** md5 signature: 854a31f8dfe55e0672f7cd1dc2ed6b18 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
Poles2d: NCollection_Array1<gp_Pnt2d>
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<double> & Weigths);

		/****** BRepBlend_SurfRstConstRad::Set ******/
		/****** md5 signature: 51edc1a46f9014e3188bd66241af17c6 ******/
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

		/****** BRepBlend_SurfRstConstRad::Set ******/
		/****** md5 signature: b605056efb3500b59398ce278f827e0a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Param);

		/****** BRepBlend_SurfRstConstRad::Set ******/
		/****** md5 signature: a446b778eac4e0112e7c78eac5a7dfd6 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.
") Set;
		void Set(const double First, const double Last);

		/****** BRepBlend_SurfRstConstRad::Set ******/
		/****** md5 signature: 8831783d575e11656545551bff3e87e3 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Radius: double
Choix: int

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Radius, const int Choix);

		/****** BRepBlend_SurfRstConstRad::Set ******/
		/****** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ******/
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

		/****** BRepBlend_SurfRstConstRad::Tangent2dOnRst ******/
		/****** md5 signature: 9a7d068c72c670416aa93cfcce5f669e ******/
		%feature("compactdefaultargs") Tangent2dOnRst;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnRst;
		const gp_Vec2d Tangent2dOnRst();

		/****** BRepBlend_SurfRstConstRad::Tangent2dOnS ******/
		/****** md5 signature: 1f4c09e2c25037e4f19975d4eb568c42 ******/
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS;
		const gp_Vec2d Tangent2dOnS();

		/****** BRepBlend_SurfRstConstRad::TangentOnRst ******/
		/****** md5 signature: 5bbb9956956540c5a8556b32063c5459 ******/
		%feature("compactdefaultargs") TangentOnRst;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnRst;
		const gp_Vec TangentOnRst();

		/****** BRepBlend_SurfRstConstRad::TangentOnS ******/
		/****** md5 signature: 1d4670085d81923137537d4e87e1327d ******/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS;
		const gp_Vec TangentOnS();

		/****** BRepBlend_SurfRstConstRad::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BRepBlend_SurfRstConstRad::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** BRepBlend_SurfRstEvolRad::BRepBlend_SurfRstEvolRad ******/
		/****** md5 signature: 06cb46291f703c140349a3b88ec0c690 ******/
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

		/****** BRepBlend_SurfRstEvolRad::Decroch ******/
		/****** md5 signature: 7cafc012aa0fef16b46f50fac214824a ******/
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
Permet d'implementer un critere de decrochage specifique a la fonction.
") Decroch;
		bool Decroch(const math_Vector & Sol, gp_Vec & NS, gp_Vec & TgS);

		/****** BRepBlend_SurfRstEvolRad::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** BRepBlend_SurfRstEvolRad::GetBounds ******/
		/****** md5 signature: 8564d4d12ccb8ae62bb2f46e2d76f3ec ******/
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

		/****** BRepBlend_SurfRstEvolRad::GetMinimalDistance ******/
		/****** md5 signature: 5a18315a70b74cf958327e394dbfbb07 ******/
		%feature("compactdefaultargs") GetMinimalDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the minimal Distance between two extremities of calculated sections.
") GetMinimalDistance;
		double GetMinimalDistance();

		/****** BRepBlend_SurfRstEvolRad::GetMinimalWeight ******/
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections.
") GetMinimalWeight;
		void GetMinimalWeight(NCollection_Array1<double> & Weigths);

		/****** BRepBlend_SurfRstEvolRad::GetSectionSize ******/
		/****** md5 signature: 4b20b399dae9a40b81b614c46e43dbe0 ******/
		%feature("compactdefaultargs") GetSectionSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section.
") GetSectionSize;
		double GetSectionSize();

		/****** BRepBlend_SurfRstEvolRad::GetShape ******/
		/****** md5 signature: 363e82c53157bdd080784e1e83b31277 ******/
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

		/****** BRepBlend_SurfRstEvolRad::GetTolerance ******/
		/****** md5 signature: 751c95ec3ad003a05732d9b53ee1f7db ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
Tolerance: math_Vector
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(math_Vector & Tolerance, const double Tol);

		/****** BRepBlend_SurfRstEvolRad::GetTolerance ******/
		/****** md5 signature: 33aef456d91269e49aa44741ceb0b619 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: math_Vector
Tol1D: math_Vector

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, math_Vector & Tol3d, math_Vector & Tol1D);

		/****** BRepBlend_SurfRstEvolRad::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** BRepBlend_SurfRstEvolRad::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational.
") IsRational;
		bool IsRational();

		/****** BRepBlend_SurfRstEvolRad::IsSolution ******/
		/****** md5 signature: 375f3d9afe869cc721815e5924bd584a ******/
		%feature("compactdefaultargs") IsSolution;
		%feature("autodoc", "
Parameters
----------
Sol: math_Vector
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") IsSolution;
		bool IsSolution(const math_Vector & Sol, const double Tol);

		/****** BRepBlend_SurfRstEvolRad::IsTangencyPoint ******/
		/****** md5 signature: 774343cbd942c86b776fb9acb281a4b0 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangencyPoint;
		bool IsTangencyPoint();

		/****** BRepBlend_SurfRstEvolRad::Knots ******/
		/****** md5 signature: 7b60038801b1119c8fec8ad932ddbd42 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(NCollection_Array1<double> & TKnots);

		/****** BRepBlend_SurfRstEvolRad::Mults ******/
		/****** md5 signature: 533abca17062c451e56616867e5ff1a2 ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(NCollection_Array1<int> & TMults);

		/****** BRepBlend_SurfRstEvolRad::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbEquations;
		int NbEquations();

		/****** BRepBlend_SurfRstEvolRad::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		int NbIntervals(const GeomAbs_Shape S);

		/****** BRepBlend_SurfRstEvolRad::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 3.
") NbVariables;
		int NbVariables();

		/****** BRepBlend_SurfRstEvolRad::ParameterOnRst ******/
		/****** md5 signature: 988d9f4f658d273322feb505a2b37fbd ******/
		%feature("compactdefaultargs") ParameterOnRst;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns parameter of the point on the curve.
") ParameterOnRst;
		double ParameterOnRst();

		/****** BRepBlend_SurfRstEvolRad::Pnt2dOnRst ******/
		/****** md5 signature: ea11411911e52cd3fbfd82ea42ca483b ******/
		%feature("compactdefaultargs") Pnt2dOnRst;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns U,V coordinates of the point on the curve on surface.
") Pnt2dOnRst;
		const gp_Pnt2d Pnt2dOnRst();

		/****** BRepBlend_SurfRstEvolRad::Pnt2dOnS ******/
		/****** md5 signature: fadb36be226684cb5ba0c4edd28a8d6f ******/
		%feature("compactdefaultargs") Pnt2dOnS;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns U,V coordinates of the point on the surface.
") Pnt2dOnS;
		const gp_Pnt2d Pnt2dOnS();

		/****** BRepBlend_SurfRstEvolRad::PointOnRst ******/
		/****** md5 signature: 512c6fb352f147cfc0c4bf13d145c6fc ******/
		%feature("compactdefaultargs") PointOnRst;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnRst;
		const gp_Pnt PointOnRst();

		/****** BRepBlend_SurfRstEvolRad::PointOnS ******/
		/****** md5 signature: 05d46557ea4c8c09ee7501573b0d89a8 ******/
		%feature("compactdefaultargs") PointOnS;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") PointOnS;
		const gp_Pnt PointOnS();

		/****** BRepBlend_SurfRstEvolRad::Resolution ******/
		/****** md5 signature: 9158c53df983d12b6be8699963ad27aa ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
IC2d: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
No available documentation.
") Resolution;
		void Resolution(const int IC2d, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepBlend_SurfRstEvolRad::Section ******/
		/****** md5 signature: 56d60f49e7d3a8efd63b085758759bc0 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
Param: double
U: double
V: double
W: double
C: gp_Circ

Return
-------
Pdeb: double
Pfin: double

Description
-----------
No available documentation.
") Section;
		void Section(const double Param, const double U, const double V, const double W, Standard_Real &OutValue, Standard_Real &OutValue, gp_Circ & C);

		/****** BRepBlend_SurfRstEvolRad::Section ******/
		/****** md5 signature: 8829facb3a5568465aca472419737777 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths);

		/****** BRepBlend_SurfRstEvolRad::Section ******/
		/****** md5 signature: 6f6f4c888ddceca92f3fa6c8fdae3e34 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
D2Poles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
D2Poles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>
D2Weigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
Used for the first and last section The method returns true if the derivatives are computed, otherwise it returns false.
") Section;
		bool Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Vec> & D2Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<gp_Vec2d> & D2Poles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths, NCollection_Array1<double> & D2Weigths);

		/****** BRepBlend_SurfRstEvolRad::Section ******/
		/****** md5 signature: 854a31f8dfe55e0672f7cd1dc2ed6b18 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: Blend_Point
Poles: NCollection_Array1<gp_Pnt>
Poles2d: NCollection_Array1<gp_Pnt2d>
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Blend_Point & P, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<double> & Weigths);

		/****** BRepBlend_SurfRstEvolRad::Set ******/
		/****** md5 signature: 51edc1a46f9014e3188bd66241af17c6 ******/
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

		/****** BRepBlend_SurfRstEvolRad::Set ******/
		/****** md5 signature: b605056efb3500b59398ce278f827e0a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Param);

		/****** BRepBlend_SurfRstEvolRad::Set ******/
		/****** md5 signature: a446b778eac4e0112e7c78eac5a7dfd6 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the guide line. This determines the derivatives in these values if the function is not Cn.
") Set;
		void Set(const double First, const double Last);

		/****** BRepBlend_SurfRstEvolRad::Set ******/
		/****** md5 signature: d75662a126e12003d686ba0ef57f21dc ******/
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
		void Set(const int Choix);

		/****** BRepBlend_SurfRstEvolRad::Set ******/
		/****** md5 signature: 94cfe331c662a2ba190837b24fee3b95 ******/
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

		/****** BRepBlend_SurfRstEvolRad::Tangent2dOnRst ******/
		/****** md5 signature: 9a7d068c72c670416aa93cfcce5f669e ******/
		%feature("compactdefaultargs") Tangent2dOnRst;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnRst;
		const gp_Vec2d Tangent2dOnRst();

		/****** BRepBlend_SurfRstEvolRad::Tangent2dOnS ******/
		/****** md5 signature: 1f4c09e2c25037e4f19975d4eb568c42 ******/
		%feature("compactdefaultargs") Tangent2dOnS;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") Tangent2dOnS;
		const gp_Vec2d Tangent2dOnS();

		/****** BRepBlend_SurfRstEvolRad::TangentOnRst ******/
		/****** md5 signature: 5bbb9956956540c5a8556b32063c5459 ******/
		%feature("compactdefaultargs") TangentOnRst;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnRst;
		const gp_Vec TangentOnRst();

		/****** BRepBlend_SurfRstEvolRad::TangentOnS ******/
		/****** md5 signature: 1d4670085d81923137537d4e87e1327d ******/
		%feature("compactdefaultargs") TangentOnS;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") TangentOnS;
		const gp_Vec TangentOnS();

		/****** BRepBlend_SurfRstEvolRad::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** BRepBlend_SurfRstEvolRad::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** BRepBlend_SurfRstLineBuilder::BRepBlend_SurfRstLineBuilder ******/
		/****** md5 signature: d6a0ad1ce9ef95abcda88a808971a42f ******/
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

		/****** BRepBlend_SurfRstLineBuilder::ArcToRecadre ******/
		/****** md5 signature: 4a0e1ffe56cb26a99863d26d7c051d5e ******/
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
ponarc: double

Description
-----------
No available documentation.
") ArcToRecadre;
		int ArcToRecadre(const math_Vector & Sol, const int PrevIndex, gp_Pnt2d & pt2d, gp_Pnt2d & lastpt2d, Standard_Real &OutValue);

		/****** BRepBlend_SurfRstLineBuilder::Complete ******/
		/****** md5 signature: 85eba52d0d9e4b8d7d602eeaa80fc99c ******/
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "
Parameters
----------
Func: Blend_SurfRstFunction
Finv: Blend_FuncInv
FinvP: Blend_SurfPointFuncInv
FinvC: Blend_SurfCurvFuncInv
Pmin: double

Return
-------
bool

Description
-----------
No available documentation.
") Complete;
		bool Complete(Blend_SurfRstFunction & Func, Blend_FuncInv & Finv, Blend_SurfPointFuncInv & FinvP, Blend_SurfCurvFuncInv & FinvC, const double Pmin);

		/****** BRepBlend_SurfRstLineBuilder::DecrochEnd ******/
		/****** md5 signature: af5bddabb52938c4033e3c535f0e16aa ******/
		%feature("compactdefaultargs") DecrochEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") DecrochEnd;
		bool DecrochEnd();

		/****** BRepBlend_SurfRstLineBuilder::DecrochStart ******/
		/****** md5 signature: c4a7b5ed8410cedbba90e64bc36f3c1d ******/
		%feature("compactdefaultargs") DecrochStart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") DecrochStart;
		bool DecrochStart();

		/****** BRepBlend_SurfRstLineBuilder::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** BRepBlend_SurfRstLineBuilder::Line ******/
		/****** md5 signature: 9bbdb2164431d955d7a3a08a37fd239f ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepBlend_Line>

Description
-----------
No available documentation.
") Line;
		const opencascade::handle<BRepBlend_Line> & Line();

		/****** BRepBlend_SurfRstLineBuilder::Perform ******/
		/****** md5 signature: dda39e3e01b0350ce562947593645919 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Func: Blend_SurfRstFunction
Finv: Blend_FuncInv
FinvP: Blend_SurfPointFuncInv
FinvC: Blend_SurfCurvFuncInv
Pdep: double
Pmax: double
MaxStep: double
Tol3d: double
Tol2d: double
TolGuide: double
Soldep: math_Vector
Fleche: double
Appro: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(Blend_SurfRstFunction & Func, Blend_FuncInv & Finv, Blend_SurfPointFuncInv & FinvP, Blend_SurfCurvFuncInv & FinvC, const double Pdep, const double Pmax, const double MaxStep, const double Tol3d, const double Tol2d, const double TolGuide, const math_Vector & Soldep, const double Fleche, const bool Appro = false);

		/****** BRepBlend_SurfRstLineBuilder::PerformFirstSection ******/
		/****** md5 signature: 06637033e569ae868d6b0fc46b199228 ******/
		%feature("compactdefaultargs") PerformFirstSection;
		%feature("autodoc", "
Parameters
----------
Func: Blend_SurfRstFunction
Finv: Blend_FuncInv
FinvP: Blend_SurfPointFuncInv
FinvC: Blend_SurfCurvFuncInv
Pdep: double
Pmax: double
Soldep: math_Vector
Tol3d: double
Tol2d: double
TolGuide: double
RecRst: bool
RecP: bool
RecS: bool
ParSol: math_Vector

Return
-------
Psol: double

Description
-----------
No available documentation.
") PerformFirstSection;
		bool PerformFirstSection(Blend_SurfRstFunction & Func, Blend_FuncInv & Finv, Blend_SurfPointFuncInv & FinvP, Blend_SurfCurvFuncInv & FinvC, const double Pdep, const double Pmax, const math_Vector & Soldep, const double Tol3d, const double Tol2d, const double TolGuide, const bool RecRst, const bool RecP, const bool RecS, Standard_Real &OutValue, math_Vector & ParSol);

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
		/****** BRepBlend_Walking::BRepBlend_Walking ******/
		/****** md5 signature: 3e60e6b4956db8469ccd4414f4eddcf1 ******/
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

		/****** BRepBlend_Walking::AddSingularPoint ******/
		/****** md5 signature: 0ea0295b6724aa8af8ca3b784b4bc60a ******/
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

		/****** BRepBlend_Walking::Check ******/
		/****** md5 signature: e7cf59d6e9426acc23606b1a21c7b3a4 ******/
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
		void Check(const bool C);

		/****** BRepBlend_Walking::Check2d ******/
		/****** md5 signature: 7d802e08b49f0da07a494033f377d4b8 ******/
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
		void Check2d(const bool C);

		/****** BRepBlend_Walking::ClassificationOnS1 ******/
		/****** md5 signature: 3ac2c45b73c22c91448727f68067a732 ******/
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
		void ClassificationOnS1(const bool C);

		/****** BRepBlend_Walking::ClassificationOnS2 ******/
		/****** md5 signature: 837b759ca7378979f9cabd34a5cfd1e7 ******/
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
		void ClassificationOnS2(const bool C);

		/****** BRepBlend_Walking::Complete ******/
		/****** md5 signature: 49372c5b78a523c0c1aa28c15048ce44 ******/
		%feature("compactdefaultargs") Complete;
		%feature("autodoc", "
Parameters
----------
F: Blend_Function
FInv: Blend_FuncInv
Pmin: double

Return
-------
bool

Description
-----------
No available documentation.
") Complete;
		bool Complete(Blend_Function & F, Blend_FuncInv & FInv, const double Pmin);

		/****** BRepBlend_Walking::Continu ******/
		/****** md5 signature: 23f10a7807b7416e10065a41948d7f02 ******/
		%feature("compactdefaultargs") Continu;
		%feature("autodoc", "
Parameters
----------
F: Blend_Function
FInv: Blend_FuncInv
P: double

Return
-------
bool

Description
-----------
No available documentation.
") Continu;
		bool Continu(Blend_Function & F, Blend_FuncInv & FInv, const double P);

		/****** BRepBlend_Walking::Continu ******/
		/****** md5 signature: 656656682fb22069427cae6452779532 ******/
		%feature("compactdefaultargs") Continu;
		%feature("autodoc", "
Parameters
----------
F: Blend_Function
FInv: Blend_FuncInv
P: double
OnS1: bool

Return
-------
bool

Description
-----------
No available documentation.
") Continu;
		bool Continu(Blend_Function & F, Blend_FuncInv & FInv, const double P, const bool OnS1);

		/****** BRepBlend_Walking::IsDone ******/
		/****** md5 signature: 5ec90ec09c96cc3e3e0f31aaf399e740 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** BRepBlend_Walking::Line ******/
		/****** md5 signature: b1091aed695b71aa16f6f258d9818bca ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
opencascade::handle<BRepBlend_Line>

Description
-----------
No available documentation.
") Line;
		const opencascade::handle<BRepBlend_Line> & Line();

		/****** BRepBlend_Walking::Perform ******/
		/****** md5 signature: 168fd4c6f3c724e591cac602857c6afc ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: Blend_Function
FInv: Blend_FuncInv
Pdep: double
Pmax: double
MaxStep: double
Tol3d: double
TolGuide: double
Soldep: math_Vector
Fleche: double
Appro: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(Blend_Function & F, Blend_FuncInv & FInv, const double Pdep, const double Pmax, const double MaxStep, const double Tol3d, const double TolGuide, const math_Vector & Soldep, const double Fleche, const bool Appro = false);

		/****** BRepBlend_Walking::PerformFirstSection ******/
		/****** md5 signature: 6317a374f553e996f25b0ba7253eb6f7 ******/
		%feature("compactdefaultargs") PerformFirstSection;
		%feature("autodoc", "
Parameters
----------
F: Blend_Function
Pdep: double
ParDep: math_Vector
Tol3d: double
TolGuide: double

Return
-------
Pos1: TopAbs_State
Pos2: TopAbs_State

Description
-----------
No available documentation.
") PerformFirstSection;
		bool PerformFirstSection(Blend_Function & F, const double Pdep, math_Vector & ParDep, const double Tol3d, const double TolGuide, TopAbs_State &OutValue, TopAbs_State &OutValue);

		/****** BRepBlend_Walking::PerformFirstSection ******/
		/****** md5 signature: 7a5ebfb052aaffd06e1004dc6b36874a ******/
		%feature("compactdefaultargs") PerformFirstSection;
		%feature("autodoc", "
Parameters
----------
F: Blend_Function
FInv: Blend_FuncInv
Pdep: double
Pmax: double
ParDep: math_Vector
Tol3d: double
TolGuide: double
RecOnS1: bool
RecOnS2: bool
ParSol: math_Vector

Return
-------
Psol: double

Description
-----------
No available documentation.
") PerformFirstSection;
		bool PerformFirstSection(Blend_Function & F, Blend_FuncInv & FInv, const double Pdep, const double Pmax, const math_Vector & ParDep, const double Tol3d, const double TolGuide, const bool RecOnS1, const bool RecOnS2, Standard_Real &OutValue, math_Vector & ParSol);

		/****** BRepBlend_Walking::SetDomainsToRecadre ******/
		/****** md5 signature: 10664ebffbd6ed784502d7d4acfa5a93 ******/
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

		/****** BRepBlend_Walking::TwistOnS1 ******/
		/****** md5 signature: 41c95cb3240d457ae6390221f388d64d ******/
		%feature("compactdefaultargs") TwistOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS1;
		bool TwistOnS1();

		/****** BRepBlend_Walking::TwistOnS2 ******/
		/****** md5 signature: 09ac5ef25539f0c91a68308d0af53f8a ******/
		%feature("compactdefaultargs") TwistOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") TwistOnS2;
		bool TwistOnS2();

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
		/****** BRepBlend_AppFunc::BRepBlend_AppFunc ******/
		/****** md5 signature: 4a192290daf66f14d203d6cd71ad71cd ******/
		%feature("compactdefaultargs") BRepBlend_AppFunc;
		%feature("autodoc", "
Parameters
----------
Line: BRepBlend_Line
Func: Blend_Function
Tol3d: double
Tol2d: double

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_AppFunc;
		 BRepBlend_AppFunc(opencascade::handle<BRepBlend_Line> & Line, Blend_Function & Func, const double Tol3d, const double Tol2d);

		/****** BRepBlend_AppFunc::Point ******/
		/****** md5 signature: 80e46de98de46ca2be038e48737265c6 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Func: Blend_AppFunction
Param: double
Sol: math_Vector
Pnt: Blend_Point

Return
-------
None

Description
-----------
No available documentation.
") Point;
		void Point(const Blend_AppFunction & Func, const double Param, const math_Vector & Sol, Blend_Point & Pnt);

		/****** BRepBlend_AppFunc::Vec ******/
		/****** md5 signature: ad4caa4d755f3a17d586df4640621b42 ******/
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
		/****** BRepBlend_AppFuncRst::BRepBlend_AppFuncRst ******/
		/****** md5 signature: 78bc413cdd179d98b8dae4b4e6880607 ******/
		%feature("compactdefaultargs") BRepBlend_AppFuncRst;
		%feature("autodoc", "
Parameters
----------
Line: BRepBlend_Line
Func: Blend_SurfRstFunction
Tol3d: double
Tol2d: double

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_AppFuncRst;
		 BRepBlend_AppFuncRst(opencascade::handle<BRepBlend_Line> & Line, Blend_SurfRstFunction & Func, const double Tol3d, const double Tol2d);

		/****** BRepBlend_AppFuncRst::Point ******/
		/****** md5 signature: 80e46de98de46ca2be038e48737265c6 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Func: Blend_AppFunction
Param: double
Sol: math_Vector
Pnt: Blend_Point

Return
-------
None

Description
-----------
No available documentation.
") Point;
		void Point(const Blend_AppFunction & Func, const double Param, const math_Vector & Sol, Blend_Point & Pnt);

		/****** BRepBlend_AppFuncRst::Vec ******/
		/****** md5 signature: ad4caa4d755f3a17d586df4640621b42 ******/
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
		/****** BRepBlend_AppFuncRstRst::BRepBlend_AppFuncRstRst ******/
		/****** md5 signature: 32491e912f6cd1fc8d265a781ff458cb ******/
		%feature("compactdefaultargs") BRepBlend_AppFuncRstRst;
		%feature("autodoc", "
Parameters
----------
Line: BRepBlend_Line
Func: Blend_RstRstFunction
Tol3d: double
Tol2d: double

Return
-------
None

Description
-----------
No available documentation.
") BRepBlend_AppFuncRstRst;
		 BRepBlend_AppFuncRstRst(opencascade::handle<BRepBlend_Line> & Line, Blend_RstRstFunction & Func, const double Tol3d, const double Tol2d);

		/****** BRepBlend_AppFuncRstRst::Point ******/
		/****** md5 signature: 80e46de98de46ca2be038e48737265c6 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Func: Blend_AppFunction
Param: double
Sol: math_Vector
Pnt: Blend_Point

Return
-------
None

Description
-----------
No available documentation.
") Point;
		void Point(const Blend_AppFunction & Func, const double Param, const math_Vector & Sol, Blend_Point & Pnt);

		/****** BRepBlend_AppFuncRstRst::Vec ******/
		/****** md5 signature: ad4caa4d755f3a17d586df4640621b42 ******/
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
