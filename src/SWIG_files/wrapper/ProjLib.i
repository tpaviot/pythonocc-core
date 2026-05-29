/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
%define PROJLIBDOCSTRING
"ProjLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_projlib.html"
%enddef
%module (package="OCC.Core", docstring=PROJLIBDOCSTRING) ProjLib


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
#include<ProjLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom_module.hxx>
#include<TColStd_module.hxx>
#include<AppParCurves_module.hxx>
#include<math_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColgp.i
%import Adaptor3d.i
%import Geom2d.i
%import gp.i
%import Adaptor2d.i
%import GeomAbs.i
%import Geom.i
%import TColStd.i
%import AppParCurves.i
%import math.i
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
%wrap_handle(ProjLib_CompProjectedCurve)
%wrap_handle(ProjLib_ProjectOnPlane)
%wrap_handle(ProjLib_ProjectedCurve)
/* end handles declaration */

/* templates */
%template(ProjLib_SequenceOfHSequenceOfPnt) NCollection_Sequence<opencascade::handle<TColgp_HSequenceOfPnt>>;

%extend NCollection_Sequence<opencascade::handle<TColgp_HSequenceOfPnt>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef ProjLib_CompProjectedCurve ProjLib_HCompProjectedCurve;
typedef ProjLib_ProjectedCurve ProjLib_HProjectedCurve;
typedef NCollection_HSequence<opencascade::handle<TColgp_HSequenceOfPnt>> ProjLib_HSequenceOfHSequenceOfPnt;
typedef NCollection_Sequence<opencascade::handle<TColgp_HSequenceOfPnt>> ProjLib_SequenceOfHSequenceOfPnt;
/* end typedefs declaration */

/****************
* class ProjLib *
****************/
%rename(projlib) ProjLib;
class ProjLib {
	public:
		/****** ProjLib::IsAnaSurf ******/
		/****** md5 signature: 502c6d51dedb1a63ad0dae42e1368425 ******/
		%feature("compactdefaultargs") IsAnaSurf;
		%feature("autodoc", "
Parameters
----------
theAS: Adaptor3d_Surface

Return
-------
bool

Description
-----------
Returns 'true' if surface is analytical, that is it can be Plane, Cylinder, Cone, Sphere, Torus. For all other types of surface method returns 'false'.
") IsAnaSurf;
		static bool IsAnaSurf(const opencascade::handle<Adaptor3d_Surface> & theAS);

		/****** ProjLib::MakePCurveOfType ******/
		/****** md5 signature: 874915f47cdfd90614a48c32012a43ce ******/
		%feature("compactdefaultargs") MakePCurveOfType;
		%feature("autodoc", "
Parameters
----------
PC: ProjLib_ProjectedCurve
aC: Geom2d_Curve

Return
-------
None

Description
-----------
Make empty P-Curve <aC> of relevant to <PC> type.
") MakePCurveOfType;
		static void MakePCurveOfType(const ProjLib_ProjectedCurve & PC, opencascade::handle<Geom2d_Curve> & aC);

		/****** ProjLib::Project ******/
		/****** md5 signature: 949c33d58d58c76d4868cb60c2ab256e ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln
P: gp_Pnt

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Project;
		static gp_Pnt2d Project(const gp_Pln & Pl, const gp_Pnt & P);

		/****** ProjLib::Project ******/
		/****** md5 signature: eca1016506f177503ec785690587dc69 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln
L: gp_Lin

Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Project;
		static gp_Lin2d Project(const gp_Pln & Pl, const gp_Lin & L);

		/****** ProjLib::Project ******/
		/****** md5 signature: 3f74e50ee12a439644b147fcfa0bc16d ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln
C: gp_Circ

Return
-------
gp_Circ2d

Description
-----------
No available documentation.
") Project;
		static gp_Circ2d Project(const gp_Pln & Pl, const gp_Circ & C);

		/****** ProjLib::Project ******/
		/****** md5 signature: 551df2158f2317754ff71e6035467a92 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln
E: gp_Elips

Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Project;
		static gp_Elips2d Project(const gp_Pln & Pl, const gp_Elips & E);

		/****** ProjLib::Project ******/
		/****** md5 signature: 973bf3782261f3d9d3b89aaf9fa4e866 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln
P: gp_Parab

Return
-------
gp_Parab2d

Description
-----------
No available documentation.
") Project;
		static gp_Parab2d Project(const gp_Pln & Pl, const gp_Parab & P);

		/****** ProjLib::Project ******/
		/****** md5 signature: fb027387de49af77632b9ec27c52d6d4 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln
H: gp_Hypr

Return
-------
gp_Hypr2d

Description
-----------
No available documentation.
") Project;
		static gp_Hypr2d Project(const gp_Pln & Pl, const gp_Hypr & H);

		/****** ProjLib::Project ******/
		/****** md5 signature: 7ebfddafd09602e7079b732d33848049 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
Cy: gp_Cylinder
P: gp_Pnt

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Project;
		static gp_Pnt2d Project(const gp_Cylinder & Cy, const gp_Pnt & P);

		/****** ProjLib::Project ******/
		/****** md5 signature: 3eb41f5296065715c9e98e5ceb5020b8 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
Cy: gp_Cylinder
L: gp_Lin

Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Project;
		static gp_Lin2d Project(const gp_Cylinder & Cy, const gp_Lin & L);

		/****** ProjLib::Project ******/
		/****** md5 signature: 135324ba07a47358fbcb648c5d8c8874 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
Cy: gp_Cylinder
Ci: gp_Circ

Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Project;
		static gp_Lin2d Project(const gp_Cylinder & Cy, const gp_Circ & Ci);

		/****** ProjLib::Project ******/
		/****** md5 signature: 8a8c39fd3c683267379509e086c7ff0c ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
Co: gp_Cone
P: gp_Pnt

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Project;
		static gp_Pnt2d Project(const gp_Cone & Co, const gp_Pnt & P);

		/****** ProjLib::Project ******/
		/****** md5 signature: 8068f828d68058faafd1b05d85dd3688 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
Co: gp_Cone
L: gp_Lin

Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Project;
		static gp_Lin2d Project(const gp_Cone & Co, const gp_Lin & L);

		/****** ProjLib::Project ******/
		/****** md5 signature: 13aa56d871d7506e0ec67ae1867a3def ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
Co: gp_Cone
Ci: gp_Circ

Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Project;
		static gp_Lin2d Project(const gp_Cone & Co, const gp_Circ & Ci);

		/****** ProjLib::Project ******/
		/****** md5 signature: b2c2b1472acdbe031769f69dccc727f1 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
Sp: gp_Sphere
P: gp_Pnt

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Project;
		static gp_Pnt2d Project(const gp_Sphere & Sp, const gp_Pnt & P);

		/****** ProjLib::Project ******/
		/****** md5 signature: f88c8dc389e17089da68568facc54b4a ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
Sp: gp_Sphere
Ci: gp_Circ

Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Project;
		static gp_Lin2d Project(const gp_Sphere & Sp, const gp_Circ & Ci);

		/****** ProjLib::Project ******/
		/****** md5 signature: 054ff1e48949731e2a6487b89c2d4440 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
To: gp_Torus
P: gp_Pnt

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Project;
		static gp_Pnt2d Project(const gp_Torus & To, const gp_Pnt & P);

		/****** ProjLib::Project ******/
		/****** md5 signature: 7fb7ca184b19a3fdf92d7f8f67ee6de5 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
To: gp_Torus
Ci: gp_Circ

Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Project;
		static gp_Lin2d Project(const gp_Torus & To, const gp_Circ & Ci);

};


%extend ProjLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class ProjLib_CompProjectedCurve *
***********************************/
class ProjLib_CompProjectedCurve : public Adaptor2d_Curve2d {
	public:
		/****** ProjLib_CompProjectedCurve::ProjLib_CompProjectedCurve ******/
		/****** md5 signature: f94fb89bf12d8a43fd90a7811e0cf449 ******/
		%feature("compactdefaultargs") ProjLib_CompProjectedCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve();

		/****** ProjLib_CompProjectedCurve::ProjLib_CompProjectedCurve ******/
		/****** md5 signature: f8131827de5d1bab47ca6aa83f007abc ******/
		%feature("compactdefaultargs") ProjLib_CompProjectedCurve;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
C: Adaptor3d_Curve
TolU: double
TolV: double

Return
-------
None

Description
-----------
try to find all solutions.
") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve(const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Curve> & C, const double TolU, const double TolV);

		/****** ProjLib_CompProjectedCurve::ProjLib_CompProjectedCurve ******/
		/****** md5 signature: f7dddc602bbcd1696fb9b58e2be75f4b ******/
		%feature("compactdefaultargs") ProjLib_CompProjectedCurve;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
C: Adaptor3d_Curve
TolU: double
TolV: double
MaxDist: double

Return
-------
None

Description
-----------
this constructor tries to optimize the search using the assumption that maximum distance between surface and curve less or equal then MaxDist. if MaxDist < 0 then algorithm works as above.
") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve(const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Curve> & C, const double TolU, const double TolV, const double MaxDist);

		/****** ProjLib_CompProjectedCurve::ProjLib_CompProjectedCurve ******/
		/****** md5 signature: bf06be2fb3a52d524dce330cdc4d633b ******/
		%feature("compactdefaultargs") ProjLib_CompProjectedCurve;
		%feature("autodoc", "
Parameters
----------
Tol3d: double
S: Adaptor3d_Surface
C: Adaptor3d_Curve
MaxDist: double (optional, default to -1.0)

Return
-------
None

Description
-----------
this constructor tries to optimize the search using the assumption that maximum distance between surface and curve less or equal then MaxDist. if MaxDist < 0 then algorithm try to find all solutions Tolerances of parameters are calculated automatically.
") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve(const double Tol3d, const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Curve> & C, const double MaxDist = -1.0);

		/****** ProjLib_CompProjectedCurve::Bounds ******/
		/****** md5 signature: 98e6cbde44f8509c5771556c85bb834e ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Udeb: double
Ufin: double

Description
-----------
returns the bounds of the continuous part corresponding to Index.
") Bounds;
		void Bounds(const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ProjLib_CompProjectedCurve::Continuity ******/
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns the Continuity used in the approximation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** ProjLib_CompProjectedCurve::D0 ******/
		/****** md5 signature: 28006337a032f857e56ae70cba70f8c3 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		void D0(const double U, gp_Pnt2d & P);

		/****** ProjLib_CompProjectedCurve::D1 ******/
		/****** md5 signature: 5f53adf29b471206c7186b2aee007b00 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
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
		void D1(const double U, gp_Pnt2d & P, gp_Vec2d & V);

		/****** ProjLib_CompProjectedCurve::D2 ******/
		/****** md5 signature: 159e151ac7b509d70da37104a08723f1 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
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
		void D2(const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ProjLib_CompProjectedCurve::DN ******/
		/****** md5 signature: ab59dc692256c89ec17f3f5c66c3a731 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if N < 1. Raised if N > 2.
") DN;
		gp_Vec2d DN(const double U, const int N);

		/****** ProjLib_CompProjectedCurve::FirstParameter ******/
		/****** md5 signature: a030fd3ced91f50691075634ae7b49fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the first parameter of the curve C which has a projection on S.
") FirstParameter;
		double FirstParameter();

		/****** ProjLib_CompProjectedCurve::GetCurve ******/
		/****** md5 signature: c4c186157bff8d4b55a9d0a19a63ce6d ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") GetCurve;
		const opencascade::handle<Adaptor3d_Curve> & GetCurve();

		/****** ProjLib_CompProjectedCurve::GetProj2d ******/
		/****** md5 signature: c5546299f8b5dfc05426baee6230221d ******/
		%feature("compactdefaultargs") GetProj2d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the parameter, which defines necessity of only 2d results.
") GetProj2d;
		bool GetProj2d();

		/****** ProjLib_CompProjectedCurve::GetProj3d ******/
		/****** md5 signature: 0c62dbd881e8cbe25f25f9a8c7141c56 ******/
		%feature("compactdefaultargs") GetProj3d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the parameter, which defines necessity of only 3d results.
") GetProj3d;
		bool GetProj3d();

		/****** ProjLib_CompProjectedCurve::GetResult2dC ******/
		/****** md5 signature: a753759705313eeed5185aeb0401fd28 ******/
		%feature("compactdefaultargs") GetResult2dC;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Returns the resulting 2d-curve of projecting of the curve interval with number Index.
") GetResult2dC;
		opencascade::handle<Geom2d_Curve> GetResult2dC(const int theIndex);

		/****** ProjLib_CompProjectedCurve::GetResult2dP ******/
		/****** md5 signature: d83d39ae87cbf3214603a4f70f623efc ******/
		%feature("compactdefaultargs") GetResult2dP;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt2d

Description
-----------
Returns the resulting 2d-point of projecting of the curve interval with number Index.
") GetResult2dP;
		gp_Pnt2d GetResult2dP(const int theIndex);

		/****** ProjLib_CompProjectedCurve::GetResult2dUApproxError ******/
		/****** md5 signature: d77fa279ec2a26ba0e0715d617fb17eb ******/
		%feature("compactdefaultargs") GetResult2dUApproxError;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Returns the error of approximation of U parameter 2d-curve as a result projecting of the curve interval with number Index.
") GetResult2dUApproxError;
		double GetResult2dUApproxError(const int theIndex);

		/****** ProjLib_CompProjectedCurve::GetResult2dVApproxError ******/
		/****** md5 signature: db3d7fcd27090b7e614d37eb3304b64a ******/
		%feature("compactdefaultargs") GetResult2dVApproxError;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Returns the error of approximation of V parameter 2d-curve as a result projecting of the curve interval with number Index.
") GetResult2dVApproxError;
		double GetResult2dVApproxError(const int theIndex);

		/****** ProjLib_CompProjectedCurve::GetResult3dApproxError ******/
		/****** md5 signature: b27ea3f2bf726738042923d586a81070 ******/
		%feature("compactdefaultargs") GetResult3dApproxError;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
double

Description
-----------
Returns the error of approximation of 3d-curve as a result projecting of the curve interval with number Index.
") GetResult3dApproxError;
		double GetResult3dApproxError(const int theIndex);

		/****** ProjLib_CompProjectedCurve::GetResult3dC ******/
		/****** md5 signature: 5fe4e2af26bf202a0bd8381e56f10b79 ******/
		%feature("compactdefaultargs") GetResult3dC;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns the resulting 3d-curve of projecting of the curve interval with number Index.
") GetResult3dC;
		opencascade::handle<Geom_Curve> GetResult3dC(const int theIndex);

		/****** ProjLib_CompProjectedCurve::GetResult3dP ******/
		/****** md5 signature: 8775afa61eb01484d7f22e3835deb829 ******/
		%feature("compactdefaultargs") GetResult3dP;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt

Description
-----------
Returns the resulting 3d-point of projecting of the curve interval with number Index.
") GetResult3dP;
		gp_Pnt GetResult3dP(const int theIndex);

		/****** ProjLib_CompProjectedCurve::GetSequence ******/
		/****** md5 signature: 79b5e4fd3ca7b36a2956613021030651 ******/
		%feature("compactdefaultargs") GetSequence;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<TColgp_HSequenceOfPnt>>>

Description
-----------
No available documentation.
") GetSequence;
		const opencascade::handle<NCollection_HSequence<opencascade::handle<TColgp_HSequenceOfPnt>>> & GetSequence();

		/****** ProjLib_CompProjectedCurve::GetSurface ******/
		/****** md5 signature: 56dff0248d5d8fc9e2bd341c8dad1556 ******/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") GetSurface;
		const opencascade::handle<Adaptor3d_Surface> & GetSurface();

		/****** ProjLib_CompProjectedCurve::GetTolerance ******/
		/****** md5 signature: ea3584626efd1d32cec72ccb401297ec ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------

Return
-------
TolU: double
TolV: double

Description
-----------
No available documentation.
") GetTolerance;
		void GetTolerance(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ProjLib_CompProjectedCurve::GetType ******/
		/****** md5 signature: 5a645f79981f2ae05742e39e35676600 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		GeomAbs_CurveType GetType();

		/****** ProjLib_CompProjectedCurve::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
computes a set of projected point and determine the continuous parts of the projected curves. The points corresponding to a projection on the bounds of the surface are included in this set of points.
") Init;
		void Init();

		/****** ProjLib_CompProjectedCurve::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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
Returns the parameters corresponding to S discontinuities. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** ProjLib_CompProjectedCurve::IsSinglePnt ******/
		/****** md5 signature: 2f66692f522981cb852053dc8a21bb9c ******/
		%feature("compactdefaultargs") IsSinglePnt;
		%feature("autodoc", "
Parameters
----------
Index: int
P: gp_Pnt2d

Return
-------
bool

Description
-----------
returns True if part of projection with number Index is a single point and writes its coordinates in P.
") IsSinglePnt;
		bool IsSinglePnt(const int Index, gp_Pnt2d & P);

		/****** ProjLib_CompProjectedCurve::IsUIso ******/
		/****** md5 signature: d65feff595456c50a184cab83eb5a96d ******/
		%feature("compactdefaultargs") IsUIso;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U: double

Description
-----------
returns True if part of projection with number Index is an u-isoparametric curve of input surface.
") IsUIso;
		bool IsUIso(const int Index, Standard_Real &OutValue);

		/****** ProjLib_CompProjectedCurve::IsVIso ******/
		/****** md5 signature: d90463f447de6109698a9db1fbcb39c4 ******/
		%feature("compactdefaultargs") IsVIso;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
V: double

Description
-----------
returns True if part of projection with number Index is an v-isoparametric curve of input surface.
") IsVIso;
		bool IsVIso(const int Index, Standard_Real &OutValue);

		/****** ProjLib_CompProjectedCurve::LastParameter ******/
		/****** md5 signature: dd6d522a80d5537086a8d1fbe2265300 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the last parameter of the curve C which has a projection on S.
") LastParameter;
		double LastParameter();

		/****** ProjLib_CompProjectedCurve::Load ******/
		/****** md5 signature: 5fdedc45f7f3e3286603c8152dd5d5ba ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
Changes the surface.
") Load;
		void Load(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** ProjLib_CompProjectedCurve::Load ******/
		/****** md5 signature: 01185c022b32d6c381a2144e2963295b ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
Changes the curve.
") Load;
		void Load(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** ProjLib_CompProjectedCurve::MaxDistance ******/
		/****** md5 signature: 9a68e162c2f0fec22c111643cac9ba9a ******/
		%feature("compactdefaultargs") MaxDistance;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
returns the maximum distance between curve to project and surface.
") MaxDistance;
		double MaxDistance(const int Index);

		/****** ProjLib_CompProjectedCurve::NbCurves ******/
		/****** md5 signature: 99661be16aa6b87a1ba6043e7f8f9943 ******/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of continuous part of the projected curve.
") NbCurves;
		int NbCurves();

		/****** ProjLib_CompProjectedCurve::NbIntervals ******/
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
Returns the number of intervals which define an S continuous part of the projected curve.
") NbIntervals;
		int NbIntervals(const GeomAbs_Shape S);

		/****** ProjLib_CompProjectedCurve::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs projecting for given curve. If projecting uses approximation, approximation parameters can be set before by corresponding methods SetTol3d(...), SeContinuity(...), SetMaxDegree(...), SetMaxSeg(...).
") Perform;
		void Perform();

		/****** ProjLib_CompProjectedCurve::ResultIsPoint ******/
		/****** md5 signature: 14313b1d67ef130f372f981ad56eaded ******/
		%feature("compactdefaultargs") ResultIsPoint;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
bool

Description
-----------
Returns true if result of projecting of the curve interval with number Index is point.
") ResultIsPoint;
		bool ResultIsPoint(const int theIndex);

		/****** ProjLib_CompProjectedCurve::SetContinuity ******/
		/****** md5 signature: 473faebb309a058577820ec9b582e0f6 ******/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "
Parameters
----------
theContinuity: GeomAbs_Shape

Return
-------
None

Description
-----------
Set the parameter, which defines curve continuity. Default value is GeomAbs_C2;.
") SetContinuity;
		void SetContinuity(const GeomAbs_Shape theContinuity);

		/****** ProjLib_CompProjectedCurve::SetMaxDegree ******/
		/****** md5 signature: fd1f9bffa95201627a5a97c5cfe9aacc ******/
		%feature("compactdefaultargs") SetMaxDegree;
		%feature("autodoc", "
Parameters
----------
theMaxDegree: int

Return
-------
None

Description
-----------
Set max possible degree of result BSpline curve2d, which is got by approximation. If MaxDegree < 0, algorithm uses values that are chosen depending of types curve 3d and surface.
") SetMaxDegree;
		void SetMaxDegree(const int theMaxDegree);

		/****** ProjLib_CompProjectedCurve::SetMaxSeg ******/
		/****** md5 signature: 3e9b113b3aa1a6b5e5f72bcc63c2a66f ******/
		%feature("compactdefaultargs") SetMaxSeg;
		%feature("autodoc", "
Parameters
----------
theMaxSeg: int

Return
-------
None

Description
-----------
Set the parameter, which defines maximal value of parametric intervals the projected curve can be cut for approximation. If MaxSeg < 0, algorithm uses default value = 16.
") SetMaxSeg;
		void SetMaxSeg(const int theMaxSeg);

		/****** ProjLib_CompProjectedCurve::SetProj2d ******/
		/****** md5 signature: c18e81b4b7334a82b6eaa122db395d0e ******/
		%feature("compactdefaultargs") SetProj2d;
		%feature("autodoc", "
Parameters
----------
theProj2d: bool

Return
-------
None

Description
-----------
Set the parameter, which defines necessity of 2d results.
") SetProj2d;
		void SetProj2d(const bool theProj2d);

		/****** ProjLib_CompProjectedCurve::SetProj3d ******/
		/****** md5 signature: 1b49511637a894b439d78d5d2df27698 ******/
		%feature("compactdefaultargs") SetProj3d;
		%feature("autodoc", "
Parameters
----------
theProj3d: bool

Return
-------
None

Description
-----------
Set the parameter, which defines necessity of 3d results.
") SetProj3d;
		void SetProj3d(const bool theProj3d);

		/****** ProjLib_CompProjectedCurve::SetTol3d ******/
		/****** md5 signature: 37d036ebe2510c9106044e53963a9ce8 ******/
		%feature("compactdefaultargs") SetTol3d;
		%feature("autodoc", "
Parameters
----------
theTol3d: double

Return
-------
None

Description
-----------
Set the parameter, which defines 3d tolerance of approximation.
") SetTol3d;
		void SetTol3d(const double theTol3d);

		/****** ProjLib_CompProjectedCurve::ShallowCopy ******/
		/****** md5 signature: 8a61349d8b017265b9f1e5017ac6a907 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		opencascade::handle<Adaptor2d_Curve2d> ShallowCopy();

		/****** ProjLib_CompProjectedCurve::Trim ******/
		/****** md5 signature: d24b735057ac64d6246a76d3fba16bb0 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
FirstParam: double
LastParam: double
Tol: double

Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 2d points confusion. If <First> >= <Last>.
") Trim;
		opencascade::handle<Adaptor2d_Curve2d> Trim(const double FirstParam, const double LastParam, const double Tol);

		/****** ProjLib_CompProjectedCurve::Value ******/
		/****** md5 signature: 287686c46f6da6400821b7738f682ad8 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		gp_Pnt2d Value(const double U);

};


%make_alias(ProjLib_CompProjectedCurve)

%extend ProjLib_CompProjectedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class ProjLib_ComputeApprox *
******************************/
class ProjLib_ComputeApprox {
	public:
		/****** ProjLib_ComputeApprox::ProjLib_ComputeApprox ******/
		/****** md5 signature: 95b9f22fbf7194a43c851f03bd43f05d ******/
		%feature("compactdefaultargs") ProjLib_ComputeApprox;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor, it only sets some initial values for class fields.
") ProjLib_ComputeApprox;
		 ProjLib_ComputeApprox();

		/****** ProjLib_ComputeApprox::ProjLib_ComputeApprox ******/
		/****** md5 signature: 46caae42c1f00ebd9ce4f2a5d2830085 ******/
		%feature("compactdefaultargs") ProjLib_ComputeApprox;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
Tol: double

Return
-------
None

Description
-----------
<Tol> is the tolerance with which the approximation is performed. Other parameters for approximation have default values.
") ProjLib_ComputeApprox;
		 ProjLib_ComputeApprox(const opencascade::handle<Adaptor3d_Curve> & C, const opencascade::handle<Adaptor3d_Surface> & S, const double Tol);

		/****** ProjLib_ComputeApprox::BSpline ******/
		/****** md5 signature: 990ef8e312bcecfd89dc4fcce5384c7d ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****** ProjLib_ComputeApprox::Bezier ******/
		/****** md5 signature: 41032442357596356ca52db8dddd69b1 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****** ProjLib_ComputeApprox::Perform ******/
		/****** md5 signature: 0c34f73535d2bab5ab08edde25a61f18 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
Performs projecting. In case of approximation current values of parameters are used: default values or set by corresponding methods Set...
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & C, const opencascade::handle<Adaptor3d_Surface> & S);

		/****** ProjLib_ComputeApprox::SetBndPnt ******/
		/****** md5 signature: 83e95ddb03e3f36471306d61ee8ca703 ******/
		%feature("compactdefaultargs") SetBndPnt;
		%feature("autodoc", "
Parameters
----------
theBndPnt: AppParCurves_Constraint

Return
-------
None

Description
-----------
Set the parameter, which defines type of boundary condition between segments during approximation. It can be AppParCurves_PassPoint or AppParCurves_TangencyPoint. Default value is AppParCurves_TangencyPoint;.
") SetBndPnt;
		void SetBndPnt(const AppParCurves_Constraint theBndPnt);

		/****** ProjLib_ComputeApprox::SetDegree ******/
		/****** md5 signature: b616028785a3744783350125fc10daf1 ******/
		%feature("compactdefaultargs") SetDegree;
		%feature("autodoc", "
Parameters
----------
theDegMin: int
theDegMax: int

Return
-------
None

Description
-----------
Set min and max possible degree of result BSpline curve2d, which is got by approximation. If theDegMin/Max < 0, algorithm uses values that are chosen depending of types curve 3d and surface.
") SetDegree;
		void SetDegree(const int theDegMin, const int theDegMax);

		/****** ProjLib_ComputeApprox::SetMaxSegments ******/
		/****** md5 signature: 5ffbce2bcee67b68e45c80186cc138d9 ******/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "
Parameters
----------
theMaxSegments: int

Return
-------
None

Description
-----------
Set the parameter, which defines maximal value of parametric intervals the projected curve can be cut for approximation. If theMaxSegments < 0, algorithm uses default value = 1000.
") SetMaxSegments;
		void SetMaxSegments(const int theMaxSegments);

		/****** ProjLib_ComputeApprox::SetTolerance ******/
		/****** md5 signature: b02c47579a0a5003194df1ca82290f2c ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTolerance: double

Return
-------
None

Description
-----------
Set tolerance of approximation. Default value is Precision::Confusion().
") SetTolerance;
		void SetTolerance(const double theTolerance);

		/****** ProjLib_ComputeApprox::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the reached Tolerance.
") Tolerance;
		double Tolerance();

};


%extend ProjLib_ComputeApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class ProjLib_ComputeApproxOnPolarSurface *
********************************************/
class ProjLib_ComputeApproxOnPolarSurface {
	public:
		/****** ProjLib_ComputeApproxOnPolarSurface::ProjLib_ComputeApproxOnPolarSurface ******/
		/****** md5 signature: 1ba35999e81175262f23f0c0f4654329 ******/
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor, it only sets some initial values for class fields.
") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface();

		/****** ProjLib_ComputeApproxOnPolarSurface::ProjLib_ComputeApproxOnPolarSurface ******/
		/****** md5 signature: b7a2686cec5cdcc98acd116ecebcf411 ******/
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
Tol: double (optional, default to 1.0e-4)

Return
-------
None

Description
-----------
Constructor, which performs projecting.
") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface(const opencascade::handle<Adaptor3d_Curve> & C, const opencascade::handle<Adaptor3d_Surface> & S, const double Tol = 1.0e-4);

		/****** ProjLib_ComputeApproxOnPolarSurface::ProjLib_ComputeApproxOnPolarSurface ******/
		/****** md5 signature: f1b94cfb7a57e1f2163cc189cee267a1 ******/
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "
Parameters
----------
InitCurve2d: Adaptor2d_Curve2d
C: Adaptor3d_Curve
S: Adaptor3d_Surface
Tol: double

Return
-------
None

Description
-----------
Constructor, which performs projecting, using initial curve 2d InitCurve2d, which is any rough approximation of result curve. Parameter Tol is 3d tolerance of approximation.
") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface(const opencascade::handle<Adaptor2d_Curve2d> & InitCurve2d, const opencascade::handle<Adaptor3d_Curve> & C, const opencascade::handle<Adaptor3d_Surface> & S, const double Tol);

		/****** ProjLib_ComputeApproxOnPolarSurface::ProjLib_ComputeApproxOnPolarSurface ******/
		/****** md5 signature: 247d4d2fa48daf2099b5c68b52268718 ******/
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "
Parameters
----------
InitCurve2d: Adaptor2d_Curve2d
InitCurve2dBis: Adaptor2d_Curve2d
C: Adaptor3d_Curve
S: Adaptor3d_Surface
Tol: double

Return
-------
None

Description
-----------
Constructor, which performs projecting, using two initial curves 2d: InitCurve2d and InitCurve2dBis that are any rough approximations of result curves. This constructor is used to get two pcurves for seem edge. Parameter Tol is 3d tolerance of approximation.
") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface(const opencascade::handle<Adaptor2d_Curve2d> & InitCurve2d, const opencascade::handle<Adaptor2d_Curve2d> & InitCurve2dBis, const opencascade::handle<Adaptor3d_Curve> & C, const opencascade::handle<Adaptor3d_Surface> & S, const double Tol);

		/****** ProjLib_ComputeApproxOnPolarSurface::BSpline ******/
		/****** md5 signature: 990ef8e312bcecfd89dc4fcce5384c7d ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
Returns result curve 2d.
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****** ProjLib_ComputeApproxOnPolarSurface::BuildInitialCurve2d ******/
		/****** md5 signature: 05adce7fea9e40e792f1212d9ed1cd2d ******/
		%feature("compactdefaultargs") BuildInitialCurve2d;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
S: Adaptor3d_Surface

Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Builds initial 2d curve as BSpline with degree = 1 using Extrema algorithm. Method is used in method Perform(...).
") BuildInitialCurve2d;
		opencascade::handle<Adaptor2d_Curve2d> BuildInitialCurve2d(const opencascade::handle<Adaptor3d_Curve> & Curve, const opencascade::handle<Adaptor3d_Surface> & S);

		/****** ProjLib_ComputeApproxOnPolarSurface::Curve2d ******/
		/****** md5 signature: 2238084fe0748f28af09927c40970ede ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Returns second 2d curve.
") Curve2d;
		opencascade::handle<Geom2d_Curve> Curve2d();

		/****** ProjLib_ComputeApproxOnPolarSurface::IsDone ******/
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

		/****** ProjLib_ComputeApproxOnPolarSurface::Perform ******/
		/****** md5 signature: 0c34f73535d2bab5ab08edde25a61f18 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
Method, which performs projecting, using default values of parameters or they must be set by corresponding methods before using.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & C, const opencascade::handle<Adaptor3d_Surface> & S);

		/****** ProjLib_ComputeApproxOnPolarSurface::Perform ******/
		/****** md5 signature: 96366b287f4e6016f04fb0468a888911 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
InitCurve2d: Adaptor2d_Curve2d
C: Adaptor3d_Curve
S: Adaptor3d_Surface

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
Method, which performs projecting, using default values of parameters or they must be set by corresponding methods before using. Parameter InitCurve2d is any rough estimation of 2d result curve.
") Perform;
		opencascade::handle<Geom2d_BSplineCurve> Perform(const opencascade::handle<Adaptor2d_Curve2d> & InitCurve2d, const opencascade::handle<Adaptor3d_Curve> & C, const opencascade::handle<Adaptor3d_Surface> & S);

		/****** ProjLib_ComputeApproxOnPolarSurface::ProjectUsingInitialCurve2d ******/
		/****** md5 signature: 3900b16638c8542857f0acb902b2c4f7 ******/
		%feature("compactdefaultargs") ProjectUsingInitialCurve2d;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
S: Adaptor3d_Surface
InitCurve2d: Adaptor2d_Curve2d

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
Method, which performs projecting. Method is used in method Perform(...).
") ProjectUsingInitialCurve2d;
		opencascade::handle<Geom2d_BSplineCurve> ProjectUsingInitialCurve2d(const opencascade::handle<Adaptor3d_Curve> & Curve, const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor2d_Curve2d> & InitCurve2d);

		/****** ProjLib_ComputeApproxOnPolarSurface::SetBndPnt ******/
		/****** md5 signature: 83e95ddb03e3f36471306d61ee8ca703 ******/
		%feature("compactdefaultargs") SetBndPnt;
		%feature("autodoc", "
Parameters
----------
theBndPnt: AppParCurves_Constraint

Return
-------
None

Description
-----------
Set the parameter, which defines type of boundary condition between segments during approximation. It can be AppParCurves_PassPoint or AppParCurves_TangencyPoint. Default value is AppParCurves_TangencyPoint.
") SetBndPnt;
		void SetBndPnt(const AppParCurves_Constraint theBndPnt);

		/****** ProjLib_ComputeApproxOnPolarSurface::SetDegree ******/
		/****** md5 signature: b616028785a3744783350125fc10daf1 ******/
		%feature("compactdefaultargs") SetDegree;
		%feature("autodoc", "
Parameters
----------
theDegMin: int
theDegMax: int

Return
-------
None

Description
-----------
Set min and max possible degree of result BSpline curve2d, which is got by approximation. If theDegMin/Max < 0, algorithm uses values min = 2, max = 8.
") SetDegree;
		void SetDegree(const int theDegMin, const int theDegMax);

		/****** ProjLib_ComputeApproxOnPolarSurface::SetMaxDist ******/
		/****** md5 signature: f6d8305702fb9011ea5c3cd2b3476605 ******/
		%feature("compactdefaultargs") SetMaxDist;
		%feature("autodoc", "
Parameters
----------
theMaxDist: double

Return
-------
None

Description
-----------
Set the parameter, which defines maximal possible distance between projected curve and surface. It is used only for projecting on not analytical surfaces. If theMaxDist < 0, algorithm uses default value 100.*Tolerance. If real distance between curve and surface more then theMaxDist, algorithm stops working.
") SetMaxDist;
		void SetMaxDist(const double theMaxDist);

		/****** ProjLib_ComputeApproxOnPolarSurface::SetMaxSegments ******/
		/****** md5 signature: 5ffbce2bcee67b68e45c80186cc138d9 ******/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "
Parameters
----------
theMaxSegments: int

Return
-------
None

Description
-----------
Set the parameter, which defines maximal value of parametric intervals the projected curve can be cut for approximation. If theMaxSegments < 0, algorithm uses default value = 1000.
") SetMaxSegments;
		void SetMaxSegments(const int theMaxSegments);

		/****** ProjLib_ComputeApproxOnPolarSurface::SetTolerance ******/
		/****** md5 signature: b02c47579a0a5003194df1ca82290f2c ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTolerance: double

Return
-------
None

Description
-----------
Set the tolerance used to project the curve on the surface. Default value is Precision::Approximation().
") SetTolerance;
		void SetTolerance(const double theTolerance);

		/****** ProjLib_ComputeApproxOnPolarSurface::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the reached Tolerance.
") Tolerance;
		double Tolerance();

};


%extend ProjLib_ComputeApproxOnPolarSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class ProjLib_PrjFunc *
************************/
class ProjLib_PrjFunc : public math_FunctionSetWithDerivatives {
	public:
		/****** ProjLib_PrjFunc::ProjLib_PrjFunc ******/
		/****** md5 signature: 9c0d83deb4bf373a582976ead6706ad6 ******/
		%feature("compactdefaultargs") ProjLib_PrjFunc;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve *
FixVal: double
S: Adaptor3d_Surface *
Fix: int

Return
-------
None

Description
-----------
No available documentation.
") ProjLib_PrjFunc;
		 ProjLib_PrjFunc(const Adaptor3d_Curve * C, const double FixVal, const Adaptor3d_Surface * S, const int Fix);

		/****** ProjLib_PrjFunc::Derivatives ******/
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

		/****** ProjLib_PrjFunc::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** ProjLib_PrjFunc::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function.
") NbVariables;
		int NbVariables();

		/****** ProjLib_PrjFunc::Solution ******/
		/****** md5 signature: 8e8f6cfa580b1ef36024e535e8e73ad6 ******/
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
returns point on surface.
") Solution;
		gp_Pnt2d Solution();

		/****** ProjLib_PrjFunc::Value ******/
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

		/****** ProjLib_PrjFunc::Values ******/
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


%extend ProjLib_PrjFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class ProjLib_PrjResolve *
***************************/
class ProjLib_PrjResolve {
	public:
		/****** ProjLib_PrjResolve::ProjLib_PrjResolve ******/
		/****** md5 signature: 93da950152add44db62f59dffc6fb0ef ******/
		%feature("compactdefaultargs") ProjLib_PrjResolve;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
Fix: int

Return
-------
None

Description
-----------
No available documentation.
") ProjLib_PrjResolve;
		 ProjLib_PrjResolve(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const int Fix);

		/****** ProjLib_PrjResolve::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		bool IsDone();

		/****** ProjLib_PrjResolve::Perform ******/
		/****** md5 signature: 2807cdd7c36189bfd04f8dc71727ade1 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
t: double
U: double
V: double
Tol: gp_Pnt2d
Inf: gp_Pnt2d
Sup: gp_Pnt2d
FTol: double (optional, default to -1)
StrictInside: bool (optional, default to false)

Return
-------
None

Description
-----------
Calculates the ort from C(t) to S with a close point. The close point is defined by the parameter values U0 and V0. The function F(u,v)=distance(S(u,v),C(t)) has an extremum when gradient(F)=0. The algorithm searches a zero near the close point.
") Perform;
		void Perform(const double t, const double U, const double V, const gp_Pnt2d & Tol, const gp_Pnt2d & Inf, const gp_Pnt2d & Sup, const double FTol = -1, const bool StrictInside = false);

		/****** ProjLib_PrjResolve::Solution ******/
		/****** md5 signature: 8e8f6cfa580b1ef36024e535e8e73ad6 ******/
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the point of the extremum distance.
") Solution;
		gp_Pnt2d Solution();

};


%extend ProjLib_PrjResolve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class ProjLib_ProjectOnPlane *
*******************************/
class ProjLib_ProjectOnPlane : public Adaptor3d_Curve {
	public:
		/****** ProjLib_ProjectOnPlane::ProjLib_ProjectOnPlane ******/
		/****** md5 signature: 9201f86bd4d28811ce8d433e700e3f47 ******/
		%feature("compactdefaultargs") ProjLib_ProjectOnPlane;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ProjLib_ProjectOnPlane;
		 ProjLib_ProjectOnPlane();

		/****** ProjLib_ProjectOnPlane::ProjLib_ProjectOnPlane ******/
		/****** md5 signature: 85fcf50ca50f2d204cae89c14211254f ******/
		%feature("compactdefaultargs") ProjLib_ProjectOnPlane;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Ax3

Return
-------
None

Description
-----------
The projection will be normal to the Plane defined by the Ax3 <Pl>.
") ProjLib_ProjectOnPlane;
		 ProjLib_ProjectOnPlane(const gp_Ax3 & Pl);

		/****** ProjLib_ProjectOnPlane::ProjLib_ProjectOnPlane ******/
		/****** md5 signature: b5fcc3f652b391960127c8513c231cd6 ******/
		%feature("compactdefaultargs") ProjLib_ProjectOnPlane;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Ax3
D: gp_Dir

Return
-------
None

Description
-----------
The projection will be along the direction <D> on the plane defined by the Ax3 <Pl>. raises if the direction <D> is parallel to the plane <Pl>.
") ProjLib_ProjectOnPlane;
		 ProjLib_ProjectOnPlane(const gp_Ax3 & Pl, const gp_Dir & D);

		/****** ProjLib_ProjectOnPlane::BSpline ******/
		/****** md5 signature: 7bed4aa4788773a8c748371dea2999b6 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
Warning ! this will NOT make a copy of the BSpline Curve: If you want to modify the Curve please make a copy yourself Also it will NOT trim the surface to myFirst/Last.
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****** ProjLib_ProjectOnPlane::Bezier ******/
		/****** md5 signature: 18c746ed347d210e28744f5b1c7eb527 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
Warning ! this will NOT make a copy of the Bezier Curve: If you want to modify the Curve please make a copy yourself Also it will NOT trim the surface to myFirst/Last.
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****** ProjLib_ProjectOnPlane::Circle ******/
		/****** md5 signature: 7475f3d2915ecc09ceb3114f02b43080 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		gp_Circ Circle();

		/****** ProjLib_ProjectOnPlane::Continuity ******/
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** ProjLib_ProjectOnPlane::Degree ******/
		/****** md5 signature: 6a99b61f429058b67ffcdab561815cfb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		int Degree();

		/****** ProjLib_ProjectOnPlane::Ellipse ******/
		/****** md5 signature: b7cf7020e3992d6d2378fd2118e8d198 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips Ellipse();

		/****** ProjLib_ProjectOnPlane::EvalD0 ******/
		/****** md5 signature: 534d5bf2fd8e92a6dcc7c1d53e829bc3 ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter theU on the curve.
") EvalD0;
		gp_Pnt EvalD0(const double theU);

		/****** ProjLib_ProjectOnPlane::EvalD1 ******/
		/****** md5 signature: 7afa7a9bd3f5047a6ef303b4732e48db ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD1

Description
-----------
Computes the point of parameter theU on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") EvalD1;
		Geom_Curve::ResD1 EvalD1(const double theU);

		/****** ProjLib_ProjectOnPlane::EvalD2 ******/
		/****** md5 signature: bdf34f9b5fb078dabb16e072337b36b5 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD2

Description
-----------
Returns the point and the first and second derivatives at parameter theU. Raised if the continuity of the current interval is not C2.
") EvalD2;
		Geom_Curve::ResD2 EvalD2(const double theU);

		/****** ProjLib_ProjectOnPlane::EvalD3 ******/
		/****** md5 signature: a6e2ea19f102d61c7a916bef9a895bcb ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD3

Description
-----------
Returns the point and the first, second and third derivatives at parameter theU. Raised if the continuity of the current interval is not C3.
") EvalD3;
		Geom_Curve::ResD3 EvalD3(const double theU);

		/****** ProjLib_ProjectOnPlane::EvalDN ******/
		/****** md5 signature: 77005f048bbfcdbbddaf4af5a7b6cef4 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
theU: double
theN: int

Return
-------
gp_Vec

Description
-----------
Returns the derivative of order theN at parameter theU. Raised if the continuity of the current interval is not CN. Raised if theN < 1.
") EvalDN;
		gp_Vec EvalDN(const double theU, const int theN);

		/****** ProjLib_ProjectOnPlane::FirstParameter ******/
		/****** md5 signature: a030fd3ced91f50691075634ae7b49fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		double FirstParameter();

		/****** ProjLib_ProjectOnPlane::GetCurve ******/
		/****** md5 signature: c4c186157bff8d4b55a9d0a19a63ce6d ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") GetCurve;
		const opencascade::handle<Adaptor3d_Curve> & GetCurve();

		/****** ProjLib_ProjectOnPlane::GetDirection ******/
		/****** md5 signature: b6eb17b51f95e3e399a1271a423f3532 ******/
		%feature("compactdefaultargs") GetDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") GetDirection;
		const gp_Dir GetDirection();

		/****** ProjLib_ProjectOnPlane::GetPlane ******/
		/****** md5 signature: 692d7c62e51fa3fab33cb1c73afb8b79 ******/
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
No available documentation.
") GetPlane;
		const gp_Ax3 GetPlane();

		/****** ProjLib_ProjectOnPlane::GetResult ******/
		/****** md5 signature: f6ba5b1ad08f0e4df5c78e461cf39633 ******/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomAdaptor_Curve>

Description
-----------
No available documentation.
") GetResult;
		const opencascade::handle<GeomAdaptor_Curve> & GetResult();

		/****** ProjLib_ProjectOnPlane::GetType ******/
		/****** md5 signature: 5a645f79981f2ae05742e39e35676600 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		GeomAbs_CurveType GetType();

		/****** ProjLib_ProjectOnPlane::Hyperbola ******/
		/****** md5 signature: 308d3b34f3aaba706261ba7e6cb1678e ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Hyperbola;
		gp_Hypr Hyperbola();

		/****** ProjLib_ProjectOnPlane::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** ProjLib_ProjectOnPlane::IsClosed ******/
		/****** md5 signature: e10ee7204b25ff2ff849146f37c83359 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		bool IsClosed();

		/****** ProjLib_ProjectOnPlane::IsPeriodic ******/
		/****** md5 signature: c33341d130b25859848a016acbcaf4dd ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** ProjLib_ProjectOnPlane::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		bool IsRational();

		/****** ProjLib_ProjectOnPlane::LastParameter ******/
		/****** md5 signature: dd6d522a80d5537086a8d1fbe2265300 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		double LastParameter();

		/****** ProjLib_ProjectOnPlane::Line ******/
		/****** md5 signature: acdc8f5fc99e967530fe196307d05538 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		gp_Lin Line();

		/****** ProjLib_ProjectOnPlane::Load ******/
		/****** md5 signature: e5caa473bb3fd589605e688af96fcb72 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Tolerance: double
KeepParametrization: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets the Curve and perform the projection. if <KeepParametrization> is true, the parametrization of the Projected Curve <PC> will be the same as the parametrization of the initial curve <C>. It means: proj(C(u)) = PC(u) for each u. Otherwise, the parametrization may change.
") Load;
		void Load(const opencascade::handle<Adaptor3d_Curve> & C, const double Tolerance, const bool KeepParametrization = true);

		/****** ProjLib_ProjectOnPlane::NbIntervals ******/
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
If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.
") NbIntervals;
		int NbIntervals(const GeomAbs_Shape S);

		/****** ProjLib_ProjectOnPlane::NbKnots ******/
		/****** md5 signature: d6bff4f2a244b781cf7c609ff1cddaf1 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		int NbKnots();

		/****** ProjLib_ProjectOnPlane::NbPoles ******/
		/****** md5 signature: bdb1092e5fcaeae9c85a332311d7f069 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		int NbPoles();

		/****** ProjLib_ProjectOnPlane::Parabola ******/
		/****** md5 signature: de70ebd3fa2d227512b9d0058ee94ca5 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
No available documentation.
") Parabola;
		gp_Parab Parabola();

		/****** ProjLib_ProjectOnPlane::Period ******/
		/****** md5 signature: 1f089b3595450d6c97092473e379f329 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Period;
		double Period();

		/****** ProjLib_ProjectOnPlane::Resolution ******/
		/****** md5 signature: 7cb383c1a004c01dc3f51b7088c4d899 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		double Resolution(const double R3d);

		/****** ProjLib_ProjectOnPlane::ShallowCopy ******/
		/****** md5 signature: 20e70b6ba2d95db55811b68454eb9003 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		opencascade::handle<Adaptor3d_Curve> ShallowCopy();

		/****** ProjLib_ProjectOnPlane::Trim ******/
		/****** md5 signature: 91538b497dfbccd564dbd54083e8e395 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") Trim;
		opencascade::handle<Adaptor3d_Curve> Trim(const double First, const double Last, const double Tol);

};


%make_alias(ProjLib_ProjectOnPlane)

%extend ProjLib_ProjectOnPlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class ProjLib_ProjectOnSurface *
*********************************/
class ProjLib_ProjectOnSurface {
	public:
		/****** ProjLib_ProjectOnSurface::ProjLib_ProjectOnSurface ******/
		/****** md5 signature: 0431a0901693272252901143109bd19e ******/
		%feature("compactdefaultargs") ProjLib_ProjectOnSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Create an empty projector.
") ProjLib_ProjectOnSurface;
		 ProjLib_ProjectOnSurface();

		/****** ProjLib_ProjectOnSurface::ProjLib_ProjectOnSurface ******/
		/****** md5 signature: e0f2fe05c79663cd563fd99d0aa83d9f ******/
		%feature("compactdefaultargs") ProjLib_ProjectOnSurface;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
Create a projector normally to the surface <S>.
") ProjLib_ProjectOnSurface;
		 ProjLib_ProjectOnSurface(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** ProjLib_ProjectOnSurface::BSpline ******/
		/****** md5 signature: 496d8648e54b9bba1acabb31d1b7a380 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****** ProjLib_ProjectOnSurface::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

};


%extend ProjLib_ProjectOnSurface {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Load(self):
		pass
	}
};

/*******************************
* class ProjLib_ProjectedCurve *
*******************************/
class ProjLib_ProjectedCurve : public Adaptor2d_Curve2d {
	public:
		/****** ProjLib_ProjectedCurve::ProjLib_ProjectedCurve ******/
		/****** md5 signature: ca7ef66025d5e35be37e8ddcf00640a5 ******/
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor, it only sets some initial values for class fields.
") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve();

		/****** ProjLib_ProjectedCurve::ProjLib_ProjectedCurve ******/
		/****** md5 signature: 806e5753a4ed213087d3260ea4e88cc4 ******/
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
Constructor with initialisation field mySurface.
") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** ProjLib_ProjectedCurve::ProjLib_ProjectedCurve ******/
		/****** md5 signature: 5d1c7eb5c22d6e037ea9b3c4462a649d ******/
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
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
Constructor, which performs projecting. If projecting uses approximation, default parameters are used, in particular, 3d tolerance of approximation is Precision::Confusion().
") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve(const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Curve> & C);

		/****** ProjLib_ProjectedCurve::ProjLib_ProjectedCurve ******/
		/****** md5 signature: abbe5e2a98a8fa9419759217773cd832 ******/
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
C: Adaptor3d_Curve
Tol: double

Return
-------
None

Description
-----------
Constructor, which performs projecting. If projecting uses approximation, 3d tolerance is Tol, default parameters are used,.
") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve(const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Curve> & C, const double Tol);

		/****** ProjLib_ProjectedCurve::BSpline ******/
		/****** md5 signature: c66055916af14afb8911637fc5e277d6 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
Warning! This will NOT make a copy of the BSpline Curve If you want to modify the Curve please make a copy yourself. Also it will NOT trim the surface to myFirst/Last.
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****** ProjLib_ProjectedCurve::Bezier ******/
		/****** md5 signature: 9e5f9691bdf3aa713aceb92eb8809a74 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BezierCurve>

Description
-----------
Warning! This will NOT make a copy of the Bezier Curve If you want to modify the Curve please make a copy yourself. Also it will NOT trim the surface to myFirst/Last.
") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****** ProjLib_ProjectedCurve::Circle ******/
		/****** md5 signature: c57212f487cf777aef6ef0b0153393bf ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
No available documentation.
") Circle;
		gp_Circ2d Circle();

		/****** ProjLib_ProjectedCurve::Continuity ******/
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** ProjLib_ProjectedCurve::D0 ******/
		/****** md5 signature: 28006337a032f857e56ae70cba70f8c3 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		void D0(const double U, gp_Pnt2d & P);

		/****** ProjLib_ProjectedCurve::D1 ******/
		/****** md5 signature: 5f53adf29b471206c7186b2aee007b00 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
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
		void D1(const double U, gp_Pnt2d & P, gp_Vec2d & V);

		/****** ProjLib_ProjectedCurve::D2 ******/
		/****** md5 signature: 159e151ac7b509d70da37104a08723f1 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
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
		void D2(const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** ProjLib_ProjectedCurve::D3 ******/
		/****** md5 signature: a39fa2e7cc382a5fc150aec6eef34ec5 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
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
		void D3(const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** ProjLib_ProjectedCurve::DN ******/
		/****** md5 signature: ab59dc692256c89ec17f3f5c66c3a731 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		gp_Vec2d DN(const double U, const int N);

		/****** ProjLib_ProjectedCurve::Degree ******/
		/****** md5 signature: 6a99b61f429058b67ffcdab561815cfb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		int Degree();

		/****** ProjLib_ProjectedCurve::Ellipse ******/
		/****** md5 signature: 578557aedadd7b6c95c4b18a4591b27d ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips2d Ellipse();

		/****** ProjLib_ProjectedCurve::FirstParameter ******/
		/****** md5 signature: a030fd3ced91f50691075634ae7b49fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		double FirstParameter();

		/****** ProjLib_ProjectedCurve::GetCurve ******/
		/****** md5 signature: c4c186157bff8d4b55a9d0a19a63ce6d ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") GetCurve;
		const opencascade::handle<Adaptor3d_Curve> & GetCurve();

		/****** ProjLib_ProjectedCurve::GetSurface ******/
		/****** md5 signature: 56dff0248d5d8fc9e2bd341c8dad1556 ******/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") GetSurface;
		const opencascade::handle<Adaptor3d_Surface> & GetSurface();

		/****** ProjLib_ProjectedCurve::GetTolerance ******/
		/****** md5 signature: 20360866d6338eb8a4e50f80a4bf35d3 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the tolerance reached if an approximation is Done.
") GetTolerance;
		double GetTolerance();

		/****** ProjLib_ProjectedCurve::GetType ******/
		/****** md5 signature: 5a645f79981f2ae05742e39e35676600 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		GeomAbs_CurveType GetType();

		/****** ProjLib_ProjectedCurve::Hyperbola ******/
		/****** md5 signature: 76c8d95163d451200f916b4c08eee717 ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
No available documentation.
") Hyperbola;
		gp_Hypr2d Hyperbola();

		/****** ProjLib_ProjectedCurve::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** ProjLib_ProjectedCurve::IsClosed ******/
		/****** md5 signature: e10ee7204b25ff2ff849146f37c83359 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		bool IsClosed();

		/****** ProjLib_ProjectedCurve::IsPeriodic ******/
		/****** md5 signature: c33341d130b25859848a016acbcaf4dd ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** ProjLib_ProjectedCurve::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		bool IsRational();

		/****** ProjLib_ProjectedCurve::LastParameter ******/
		/****** md5 signature: dd6d522a80d5537086a8d1fbe2265300 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		double LastParameter();

		/****** ProjLib_ProjectedCurve::Line ******/
		/****** md5 signature: e6ff57a9b7126056447e1c0678038f9b ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Line;
		gp_Lin2d Line();

		/****** ProjLib_ProjectedCurve::NbIntervals ******/
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
If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.
") NbIntervals;
		int NbIntervals(const GeomAbs_Shape S);

		/****** ProjLib_ProjectedCurve::NbKnots ******/
		/****** md5 signature: d6bff4f2a244b781cf7c609ff1cddaf1 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		int NbKnots();

		/****** ProjLib_ProjectedCurve::NbPoles ******/
		/****** md5 signature: bdb1092e5fcaeae9c85a332311d7f069 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		int NbPoles();

		/****** ProjLib_ProjectedCurve::Parabola ******/
		/****** md5 signature: 22adbf7e85ee0cd0635ddfca26c2c71c ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab2d

Description
-----------
No available documentation.
") Parabola;
		gp_Parab2d Parabola();

		/****** ProjLib_ProjectedCurve::Perform ******/
		/****** md5 signature: 9a095a38277b9f3df203b3cfa73b1f1d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
Performs projecting for given curve. If projecting uses approximation, approximation parameters can be set before by corresponding methods SetDegree(...), SetMaxSegmets(...), SetBndPnt(...), SetMaxDist(...).
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** ProjLib_ProjectedCurve::Period ******/
		/****** md5 signature: 1f089b3595450d6c97092473e379f329 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Period;
		double Period();

		/****** ProjLib_ProjectedCurve::Resolution ******/
		/****** md5 signature: 7cb383c1a004c01dc3f51b7088c4d899 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		double Resolution(const double R3d);

		/****** ProjLib_ProjectedCurve::SetBndPnt ******/
		/****** md5 signature: 83e95ddb03e3f36471306d61ee8ca703 ******/
		%feature("compactdefaultargs") SetBndPnt;
		%feature("autodoc", "
Parameters
----------
theBndPnt: AppParCurves_Constraint

Return
-------
None

Description
-----------
Set the parameter, which defines type of boundary condition between segments during approximation. It can be AppParCurves_PassPoint or AppParCurves_TangencyPoint. Default value is AppParCurves_TangencyPoint;.
") SetBndPnt;
		void SetBndPnt(const AppParCurves_Constraint theBndPnt);

		/****** ProjLib_ProjectedCurve::SetDegree ******/
		/****** md5 signature: b616028785a3744783350125fc10daf1 ******/
		%feature("compactdefaultargs") SetDegree;
		%feature("autodoc", "
Parameters
----------
theDegMin: int
theDegMax: int

Return
-------
None

Description
-----------
Set min and max possible degree of result BSpline curve2d, which is got by approximation. If theDegMin/Max < 0, algorithm uses values that are chosen depending of types curve 3d and surface.
") SetDegree;
		void SetDegree(const int theDegMin, const int theDegMax);

		/****** ProjLib_ProjectedCurve::SetMaxDist ******/
		/****** md5 signature: f6d8305702fb9011ea5c3cd2b3476605 ******/
		%feature("compactdefaultargs") SetMaxDist;
		%feature("autodoc", "
Parameters
----------
theMaxDist: double

Return
-------
None

Description
-----------
Set the parameter, which degines maximal possible distance between projected curve and surface. It uses only for projecting on not analytical surfaces. If theMaxDist < 0, algorithm uses default value 100.*Tolerance. If real distance between curve and surface more then theMaxDist, algorithm stops working.
") SetMaxDist;
		void SetMaxDist(const double theMaxDist);

		/****** ProjLib_ProjectedCurve::SetMaxSegments ******/
		/****** md5 signature: 5ffbce2bcee67b68e45c80186cc138d9 ******/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "
Parameters
----------
theMaxSegments: int

Return
-------
None

Description
-----------
Set the parameter, which defines maximal value of parametric intervals the projected curve can be cut for approximation. If theMaxSegments < 0, algorithm uses default value = 1000.
") SetMaxSegments;
		void SetMaxSegments(const int theMaxSegments);

		/****** ProjLib_ProjectedCurve::ShallowCopy ******/
		/****** md5 signature: 8a61349d8b017265b9f1e5017ac6a907 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		opencascade::handle<Adaptor2d_Curve2d> ShallowCopy();

		/****** ProjLib_ProjectedCurve::Trim ******/
		/****** md5 signature: 0abd427093454f28661226e589511811 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") Trim;
		opencascade::handle<Adaptor2d_Curve2d> Trim(const double First, const double Last, const double Tol);

		/****** ProjLib_ProjectedCurve::Value ******/
		/****** md5 signature: 287686c46f6da6400821b7738f682ad8 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		gp_Pnt2d Value(const double U);

};


%make_alias(ProjLib_ProjectedCurve)

%extend ProjLib_ProjectedCurve {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Load(self):
		pass
	}
};

/**************************
* class ProjLib_Projector *
**************************/
class ProjLib_Projector {
	public:
		/****** ProjLib_Projector::ProjLib_Projector ******/
		/****** md5 signature: ef9da8370e275855405698ebc84a82bc ******/
		%feature("compactdefaultargs") ProjLib_Projector;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the type to OtherCurve.
") ProjLib_Projector;
		 ProjLib_Projector();

		/****** ProjLib_Projector::BSpline ******/
		/****** md5 signature: 990ef8e312bcecfd89dc4fcce5384c7d ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****** ProjLib_Projector::Bezier ******/
		/****** md5 signature: 41032442357596356ca52db8dddd69b1 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****** ProjLib_Projector::Circle ******/
		/****** md5 signature: 09c4f90c70c84d6b1770b97835f72183 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
No available documentation.
") Circle;
		const gp_Circ2d Circle();

		/****** ProjLib_Projector::Done ******/
		/****** md5 signature: af7f5634e847c127c6559337ee40c13f ******/
		%feature("compactdefaultargs") Done;
		%feature("autodoc", "Return
-------
None

Description
-----------
Set isDone = true;.
") Done;
		void Done();

		/****** ProjLib_Projector::Ellipse ******/
		/****** md5 signature: 2afc5e25fd4a7ce70b625443ebc99b1f ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Ellipse;
		const gp_Elips2d Ellipse();

		/****** ProjLib_Projector::GetType ******/
		/****** md5 signature: 6d4e6ae7972633971ba343e8afc91aa1 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
No available documentation.
") GetType;
		GeomAbs_CurveType GetType();

		/****** ProjLib_Projector::Hyperbola ******/
		/****** md5 signature: c7404a34ed25db31394b937efbc73c1e ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
No available documentation.
") Hyperbola;
		const gp_Hypr2d Hyperbola();

		/****** ProjLib_Projector::IsDone ******/
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

		/****** ProjLib_Projector::IsPeriodic ******/
		/****** md5 signature: d36764d6f9b1283d23b2bfdabe28da79 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** ProjLib_Projector::Line ******/
		/****** md5 signature: 7beff572f0aed8d7624f49352434b697 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Line;
		const gp_Lin2d Line();

		/****** ProjLib_Projector::Parabola ******/
		/****** md5 signature: 3bb16ea93f13d5d8141b24e8b39a2eac ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab2d

Description
-----------
No available documentation.
") Parabola;
		const gp_Parab2d Parabola();

		/****** ProjLib_Projector::Project ******/
		/****** md5 signature: 589ee44f7bf5a85e88204a0bb711cba7 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin

Return
-------
None

Description
-----------
No available documentation.
") Project;
		virtual void Project(const gp_Lin & L);

		/****** ProjLib_Projector::Project ******/
		/****** md5 signature: 101c13716847ea1058a04e9f0da7a7cd ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ

Return
-------
None

Description
-----------
No available documentation.
") Project;
		virtual void Project(const gp_Circ & C);

		/****** ProjLib_Projector::Project ******/
		/****** md5 signature: e59d9bb51202167c4dcadc0195d09266 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips

Return
-------
None

Description
-----------
No available documentation.
") Project;
		virtual void Project(const gp_Elips & E);

		/****** ProjLib_Projector::Project ******/
		/****** md5 signature: 2f0881cd62edab08bd6dcfa095671634 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab

Return
-------
None

Description
-----------
No available documentation.
") Project;
		virtual void Project(const gp_Parab & P);

		/****** ProjLib_Projector::Project ******/
		/****** md5 signature: a8352b07b98c3f92ec5b8d139e4a20a9 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr

Return
-------
None

Description
-----------
No available documentation.
") Project;
		virtual void Project(const gp_Hypr & H);

		/****** ProjLib_Projector::SetBSpline ******/
		/****** md5 signature: 0a607edf94dcc9dee6e9ff6ca93aa898 ******/
		%feature("compactdefaultargs") SetBSpline;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_BSplineCurve

Return
-------
None

Description
-----------
No available documentation.
") SetBSpline;
		void SetBSpline(const opencascade::handle<Geom2d_BSplineCurve> & C);

		/****** ProjLib_Projector::SetBezier ******/
		/****** md5 signature: fc2d8fbf79e9e332676e8288abb4a245 ******/
		%feature("compactdefaultargs") SetBezier;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_BezierCurve

Return
-------
None

Description
-----------
No available documentation.
") SetBezier;
		void SetBezier(const opencascade::handle<Geom2d_BezierCurve> & C);

		/****** ProjLib_Projector::SetPeriodic ******/
		/****** md5 signature: 3d498279f2dd83a2ab9aa88181da253f ******/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SetPeriodic;
		void SetPeriodic();

		/****** ProjLib_Projector::SetType ******/
		/****** md5 signature: 394a28550243cb94c4f5414ac7dd76ff ******/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "
Parameters
----------
Type: GeomAbs_CurveType

Return
-------
None

Description
-----------
No available documentation.
") SetType;
		void SetType(const GeomAbs_CurveType Type);

		/****** ProjLib_Projector::UFrame ******/
		/****** md5 signature: 9f805abcb260c0d473d3a2c614c6e838 ******/
		%feature("compactdefaultargs") UFrame;
		%feature("autodoc", "
Parameters
----------
CFirst: double
CLast: double
UFirst: double
Period: double

Return
-------
None

Description
-----------
Translates the 2d curve to set the part of the curve [CFirst, CLast] in the range [ UFirst, UFirst + Period [.
") UFrame;
		void UFrame(const double CFirst, const double CLast, const double UFirst, const double Period);

		/****** ProjLib_Projector::VFrame ******/
		/****** md5 signature: 59c2446ebdd7737052e4f69610baa759 ******/
		%feature("compactdefaultargs") VFrame;
		%feature("autodoc", "
Parameters
----------
CFirst: double
CLast: double
VFirst: double
Period: double

Return
-------
None

Description
-----------
Translates the 2d curve to set the part of the curve [CFirst, CLast] in the range [ VFirst, VFirst + Period [.
") VFrame;
		void VFrame(const double CFirst, const double CLast, const double VFirst, const double Period);

};


%extend ProjLib_Projector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class ProjLib_Cone *
*********************/
class ProjLib_Cone : public ProjLib_Projector {
	public:
		/****** ProjLib_Cone::ProjLib_Cone ******/
		/****** md5 signature: 318441d137ac11496333e1f29935a8b9 ******/
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "Return
-------
None

Description
-----------
Undefined projection.
") ProjLib_Cone;
		 ProjLib_Cone();

		/****** ProjLib_Cone::ProjLib_Cone ******/
		/****** md5 signature: d1916293f69e698db2b1374de22255c0 ******/
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "
Parameters
----------
Co: gp_Cone

Return
-------
None

Description
-----------
Projection on the cone <Co>.
") ProjLib_Cone;
		 ProjLib_Cone(const gp_Cone & Co);

		/****** ProjLib_Cone::ProjLib_Cone ******/
		/****** md5 signature: f16d11de7ba5bb03904ee6ec5fcac21d ******/
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "
Parameters
----------
Co: gp_Cone
L: gp_Lin

Return
-------
None

Description
-----------
Projection of the line <L> on the cone <Co>.
") ProjLib_Cone;
		 ProjLib_Cone(const gp_Cone & Co, const gp_Lin & L);

		/****** ProjLib_Cone::ProjLib_Cone ******/
		/****** md5 signature: e180f918316453d58a071452a85cafec ******/
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "
Parameters
----------
Co: gp_Cone
C: gp_Circ

Return
-------
None

Description
-----------
Projection of the circle <C> on the cone <Co>.
") ProjLib_Cone;
		 ProjLib_Cone(const gp_Cone & Co, const gp_Circ & C);

		/****** ProjLib_Cone::Init ******/
		/****** md5 signature: c1043f134b1073d147138470ac71ee4e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Co: gp_Cone

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const gp_Cone & Co);

		/****** ProjLib_Cone::Project ******/
		/****** md5 signature: a7ef521c676d2216b650f4482acf1104 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Lin & L);

		/****** ProjLib_Cone::Project ******/
		/****** md5 signature: 4194e2198e8d2eae83ceb4b735d3cc1f ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Circ & C);

		/****** ProjLib_Cone::Project ******/
		/****** md5 signature: eb497995efa013df361b2dbd0e762578 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Elips & E);

		/****** ProjLib_Cone::Project ******/
		/****** md5 signature: d1949b56cf0487a91f4c923bc0f9e07a ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Parab & P);

		/****** ProjLib_Cone::Project ******/
		/****** md5 signature: 666b93d57942026c9faefa672231e686 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Hypr & H);

};


%extend ProjLib_Cone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class ProjLib_Cylinder *
*************************/
class ProjLib_Cylinder : public ProjLib_Projector {
	public:
		/****** ProjLib_Cylinder::ProjLib_Cylinder ******/
		/****** md5 signature: 8c9fb4119d72abe235c2c21571c25c2c ******/
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "Return
-------
None

Description
-----------
Undefined projection.
") ProjLib_Cylinder;
		 ProjLib_Cylinder();

		/****** ProjLib_Cylinder::ProjLib_Cylinder ******/
		/****** md5 signature: 522351ff432f6c61e373b02c95a99bd4 ******/
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder

Return
-------
None

Description
-----------
Projection on the cylinder <Cyl>.
") ProjLib_Cylinder;
		 ProjLib_Cylinder(const gp_Cylinder & Cyl);

		/****** ProjLib_Cylinder::ProjLib_Cylinder ******/
		/****** md5 signature: 4335f013c8ebbe6bf2a1aed7e6ced877 ******/
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
L: gp_Lin

Return
-------
None

Description
-----------
Projection of the line <L> on the cylinder <Cyl>.
") ProjLib_Cylinder;
		 ProjLib_Cylinder(const gp_Cylinder & Cyl, const gp_Lin & L);

		/****** ProjLib_Cylinder::ProjLib_Cylinder ******/
		/****** md5 signature: a5b4913fb36bb8d49020c1a5e52ef4cf ******/
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
C: gp_Circ

Return
-------
None

Description
-----------
Projection of the circle <C> on the cylinder <Cyl>.
") ProjLib_Cylinder;
		 ProjLib_Cylinder(const gp_Cylinder & Cyl, const gp_Circ & C);

		/****** ProjLib_Cylinder::ProjLib_Cylinder ******/
		/****** md5 signature: c4c73ec14dd4e897e4e5bca2656e1bfa ******/
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
E: gp_Elips

Return
-------
None

Description
-----------
Projection of the ellipse <E> on the cylinder <Cyl>.
") ProjLib_Cylinder;
		 ProjLib_Cylinder(const gp_Cylinder & Cyl, const gp_Elips & E);

		/****** ProjLib_Cylinder::Init ******/
		/****** md5 signature: 02301c42dd428bd83e333d3008036049 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const gp_Cylinder & Cyl);

		/****** ProjLib_Cylinder::Project ******/
		/****** md5 signature: a7ef521c676d2216b650f4482acf1104 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Lin & L);

		/****** ProjLib_Cylinder::Project ******/
		/****** md5 signature: 4194e2198e8d2eae83ceb4b735d3cc1f ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Circ & C);

		/****** ProjLib_Cylinder::Project ******/
		/****** md5 signature: eb497995efa013df361b2dbd0e762578 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Elips & E);

		/****** ProjLib_Cylinder::Project ******/
		/****** md5 signature: d1949b56cf0487a91f4c923bc0f9e07a ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Parab & P);

		/****** ProjLib_Cylinder::Project ******/
		/****** md5 signature: 666b93d57942026c9faefa672231e686 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Hypr & H);

};


%extend ProjLib_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class ProjLib_Plane *
**********************/
class ProjLib_Plane : public ProjLib_Projector {
	public:
		/****** ProjLib_Plane::ProjLib_Plane ******/
		/****** md5 signature: 2123655f29cdbd03fd79704583d969ca ******/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "Return
-------
None

Description
-----------
Undefined projection.
") ProjLib_Plane;
		 ProjLib_Plane();

		/****** ProjLib_Plane::ProjLib_Plane ******/
		/****** md5 signature: c5cb47712f425c642927a0e685db5552 ******/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln

Return
-------
None

Description
-----------
Projection on the plane <Pl>.
") ProjLib_Plane;
		 ProjLib_Plane(const gp_Pln & Pl);

		/****** ProjLib_Plane::ProjLib_Plane ******/
		/****** md5 signature: c9ffa4b372c0fe04dedd2d1d0add0c56 ******/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln
L: gp_Lin

Return
-------
None

Description
-----------
Projection of the line <L> on the plane <Pl>.
") ProjLib_Plane;
		 ProjLib_Plane(const gp_Pln & Pl, const gp_Lin & L);

		/****** ProjLib_Plane::ProjLib_Plane ******/
		/****** md5 signature: 0aa6dba36aa81c32c0d583b64d3e12f4 ******/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln
C: gp_Circ

Return
-------
None

Description
-----------
Projection of the circle <C> on the plane <Pl>.
") ProjLib_Plane;
		 ProjLib_Plane(const gp_Pln & Pl, const gp_Circ & C);

		/****** ProjLib_Plane::ProjLib_Plane ******/
		/****** md5 signature: 45b7d50f09033271bfa01a9245642943 ******/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln
E: gp_Elips

Return
-------
None

Description
-----------
Projection of the ellipse <E> on the plane <Pl>.
") ProjLib_Plane;
		 ProjLib_Plane(const gp_Pln & Pl, const gp_Elips & E);

		/****** ProjLib_Plane::ProjLib_Plane ******/
		/****** md5 signature: 73fb37b85d9e1eb8a4bc32262ab9b40e ******/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln
P: gp_Parab

Return
-------
None

Description
-----------
Projection of the parabola <P> on the plane <Pl>.
") ProjLib_Plane;
		 ProjLib_Plane(const gp_Pln & Pl, const gp_Parab & P);

		/****** ProjLib_Plane::ProjLib_Plane ******/
		/****** md5 signature: 4c8c2c1ab0154ba5dafc68eab0104929 ******/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln
H: gp_Hypr

Return
-------
None

Description
-----------
Projection of the hyperbola <H> on the plane <Pl>.
") ProjLib_Plane;
		 ProjLib_Plane(const gp_Pln & Pl, const gp_Hypr & H);

		/****** ProjLib_Plane::Init ******/
		/****** md5 signature: d22fb3f7cf80633a3c6360581c6658a8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const gp_Pln & Pl);

		/****** ProjLib_Plane::Project ******/
		/****** md5 signature: a7ef521c676d2216b650f4482acf1104 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Lin & L);

		/****** ProjLib_Plane::Project ******/
		/****** md5 signature: 4194e2198e8d2eae83ceb4b735d3cc1f ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Circ & C);

		/****** ProjLib_Plane::Project ******/
		/****** md5 signature: eb497995efa013df361b2dbd0e762578 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Elips & E);

		/****** ProjLib_Plane::Project ******/
		/****** md5 signature: d1949b56cf0487a91f4c923bc0f9e07a ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Parab & P);

		/****** ProjLib_Plane::Project ******/
		/****** md5 signature: 666b93d57942026c9faefa672231e686 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Hypr & H);

};


%extend ProjLib_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class ProjLib_Sphere *
***********************/
class ProjLib_Sphere : public ProjLib_Projector {
	public:
		/****** ProjLib_Sphere::ProjLib_Sphere ******/
		/****** md5 signature: 65d87ab72fb51cc0df6824780c1120a9 ******/
		%feature("compactdefaultargs") ProjLib_Sphere;
		%feature("autodoc", "Return
-------
None

Description
-----------
Undefined projection.
") ProjLib_Sphere;
		 ProjLib_Sphere();

		/****** ProjLib_Sphere::ProjLib_Sphere ******/
		/****** md5 signature: 0c808274c7ddfa25b7f11b70978a0869 ******/
		%feature("compactdefaultargs") ProjLib_Sphere;
		%feature("autodoc", "
Parameters
----------
Sp: gp_Sphere

Return
-------
None

Description
-----------
Projection on the sphere <Sp>.
") ProjLib_Sphere;
		 ProjLib_Sphere(const gp_Sphere & Sp);

		/****** ProjLib_Sphere::ProjLib_Sphere ******/
		/****** md5 signature: b3d4cc0ab23ea2a057043d19aa5bb8f7 ******/
		%feature("compactdefaultargs") ProjLib_Sphere;
		%feature("autodoc", "
Parameters
----------
Sp: gp_Sphere
C: gp_Circ

Return
-------
None

Description
-----------
Projection of the circle <C> on the sphere <Sp>.
") ProjLib_Sphere;
		 ProjLib_Sphere(const gp_Sphere & Sp, const gp_Circ & C);

		/****** ProjLib_Sphere::Init ******/
		/****** md5 signature: 13641f8402e5ca70065d5b7d4a856df4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Sp: gp_Sphere

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const gp_Sphere & Sp);

		/****** ProjLib_Sphere::Project ******/
		/****** md5 signature: a7ef521c676d2216b650f4482acf1104 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Lin & L);

		/****** ProjLib_Sphere::Project ******/
		/****** md5 signature: 4194e2198e8d2eae83ceb4b735d3cc1f ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Circ & C);

		/****** ProjLib_Sphere::Project ******/
		/****** md5 signature: eb497995efa013df361b2dbd0e762578 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Elips & E);

		/****** ProjLib_Sphere::Project ******/
		/****** md5 signature: d1949b56cf0487a91f4c923bc0f9e07a ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Parab & P);

		/****** ProjLib_Sphere::Project ******/
		/****** md5 signature: 666b93d57942026c9faefa672231e686 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Hypr & H);

		/****** ProjLib_Sphere::SetInBounds ******/
		/****** md5 signature: 62b6cc9b11b1a32855cd2f32c9741789 ******/
		%feature("compactdefaultargs") SetInBounds;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
None

Description
-----------
Set the point of parameter U on C in the natural restrictions of the sphere.
") SetInBounds;
		void SetInBounds(const double U);

};


%extend ProjLib_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class ProjLib_Torus *
**********************/
class ProjLib_Torus : public ProjLib_Projector {
	public:
		/****** ProjLib_Torus::ProjLib_Torus ******/
		/****** md5 signature: cd200df51ee199b49c6916e42c2c52cb ******/
		%feature("compactdefaultargs") ProjLib_Torus;
		%feature("autodoc", "Return
-------
None

Description
-----------
Undefined projection.
") ProjLib_Torus;
		 ProjLib_Torus();

		/****** ProjLib_Torus::ProjLib_Torus ******/
		/****** md5 signature: ec9ba76805e326a9bce5e3bb7d0c380d ******/
		%feature("compactdefaultargs") ProjLib_Torus;
		%feature("autodoc", "
Parameters
----------
To: gp_Torus

Return
-------
None

Description
-----------
Projection on the torus <To>.
") ProjLib_Torus;
		 ProjLib_Torus(const gp_Torus & To);

		/****** ProjLib_Torus::ProjLib_Torus ******/
		/****** md5 signature: ed940f0fba038b71db3618a86248ad96 ******/
		%feature("compactdefaultargs") ProjLib_Torus;
		%feature("autodoc", "
Parameters
----------
To: gp_Torus
C: gp_Circ

Return
-------
None

Description
-----------
Projection of the circle <C> on the torus <To>.
") ProjLib_Torus;
		 ProjLib_Torus(const gp_Torus & To, const gp_Circ & C);

		/****** ProjLib_Torus::Init ******/
		/****** md5 signature: a4e11b0f0f83959461719dc81f54474b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
To: gp_Torus

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const gp_Torus & To);

		/****** ProjLib_Torus::Project ******/
		/****** md5 signature: a7ef521c676d2216b650f4482acf1104 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Lin & L);

		/****** ProjLib_Torus::Project ******/
		/****** md5 signature: 4194e2198e8d2eae83ceb4b735d3cc1f ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Circ & C);

		/****** ProjLib_Torus::Project ******/
		/****** md5 signature: eb497995efa013df361b2dbd0e762578 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Elips & E);

		/****** ProjLib_Torus::Project ******/
		/****** md5 signature: d1949b56cf0487a91f4c923bc0f9e07a ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Parab & P);

		/****** ProjLib_Torus::Project ******/
		/****** md5 signature: 666b93d57942026c9faefa672231e686 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr

Return
-------
None

Description
-----------
No available documentation.
") Project;
		void Project(const gp_Hypr & H);

};


%extend ProjLib_Torus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class ProjLib_HSequenceOfHSequenceOfPnt : public NCollection_Sequence<opencascade::handle<TColgp_HSequenceOfPnt>>, public Standard_Transient {
  public:
    ProjLib_HSequenceOfHSequenceOfPnt();
    ProjLib_HSequenceOfHSequenceOfPnt(const NCollection_Sequence<opencascade::handle<TColgp_HSequenceOfPnt>>& theOther);
    const NCollection_Sequence<opencascade::handle<TColgp_HSequenceOfPnt>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<TColgp_HSequenceOfPnt>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<TColgp_HSequenceOfPnt>>& theSequence);
    NCollection_Sequence<opencascade::handle<TColgp_HSequenceOfPnt>>& ChangeSequence();
};
%make_alias(ProjLib_HSequenceOfHSequenceOfPnt)


/* class aliases */
%pythoncode {
ProjLib_HCompProjectedCurve=ProjLib_CompProjectedCurve
ProjLib_HProjectedCurve=ProjLib_ProjectedCurve
}
/* deprecated methods */
%pythoncode {
@deprecated
def projlib_IsAnaSurf(*args):
	return projlib.IsAnaSurf(*args)

@deprecated
def projlib_MakePCurveOfType(*args):
	return projlib.MakePCurveOfType(*args)

@deprecated
def projlib_Project(*args):
	return projlib.Project(*args)

@deprecated
def projlib_Project(*args):
	return projlib.Project(*args)

@deprecated
def projlib_Project(*args):
	return projlib.Project(*args)

@deprecated
def projlib_Project(*args):
	return projlib.Project(*args)

@deprecated
def projlib_Project(*args):
	return projlib.Project(*args)

@deprecated
def projlib_Project(*args):
	return projlib.Project(*args)

@deprecated
def projlib_Project(*args):
	return projlib.Project(*args)

@deprecated
def projlib_Project(*args):
	return projlib.Project(*args)

@deprecated
def projlib_Project(*args):
	return projlib.Project(*args)

@deprecated
def projlib_Project(*args):
	return projlib.Project(*args)

@deprecated
def projlib_Project(*args):
	return projlib.Project(*args)

@deprecated
def projlib_Project(*args):
	return projlib.Project(*args)

@deprecated
def projlib_Project(*args):
	return projlib.Project(*args)

@deprecated
def projlib_Project(*args):
	return projlib.Project(*args)

@deprecated
def projlib_Project(*args):
	return projlib.Project(*args)

@deprecated
def projlib_Project(*args):
	return projlib.Project(*args)

}
