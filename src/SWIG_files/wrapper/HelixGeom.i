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
%define HELIXGEOMDOCSTRING
"HelixGeom module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_helixgeom.html"
%enddef
%module (package="OCC.Core", docstring=HELIXGEOMDOCSTRING) HelixGeom


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
#include<HelixGeom_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<GeomAbs_module.hxx>
#include<Adaptor3d_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<TColStd_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<TColGeom_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
#include<OSD_module.hxx>
#include<Bnd_module.hxx>
#include<TopTools_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import GeomAbs.i
%import Adaptor3d.i
%import gp.i
%import Geom.i
%import TColStd.i

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
%wrap_handle(HelixGeom_HelixCurve)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*************************************
* class HelixGeom_BuilderApproxCurve *
*************************************/
%nodefaultctor HelixGeom_BuilderApproxCurve;
%ignore HelixGeom_BuilderApproxCurve::~HelixGeom_BuilderApproxCurve();
class HelixGeom_BuilderApproxCurve {
	public:
		/****** HelixGeom_BuilderApproxCurve::ApproxParameters ******/
		/****** md5 signature: faa580c25874c9b18c9263e2f60e429b ******/
		%feature("compactdefaultargs") ApproxParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
aCont: GeomAbs_Shape
aMaxDegree: int
aMaxSeg: int

Description
-----------
Gets approximation parameters.
") ApproxParameters;
		void ApproxParameters(GeomAbs_Shape &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** HelixGeom_BuilderApproxCurve::Curves ******/
		/****** md5 signature: 23ca390659281677cc9ad186a51e93bc ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "Return
-------
TColGeom_SequenceOfCurve

Description
-----------
Gets sequence of BSpline curves representing helix coils.
") Curves;
		TColGeom_SequenceOfCurve Curves();

		/****** HelixGeom_BuilderApproxCurve::ErrorStatus ******/
		/****** md5 signature: 13481d2945af376391a643c48d6d5825 ******/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns error status of algorithm.
") ErrorStatus;
		int ErrorStatus();

		/****** HelixGeom_BuilderApproxCurve::Perform ******/
		/****** md5 signature: e23b98e5ba6fc1b2692a5d6fc76fd990 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs calculations. Must be redefined.
") Perform;
		virtual void Perform();

		/****** HelixGeom_BuilderApproxCurve::SetApproxParameters ******/
		/****** md5 signature: 77c2c03deb7f7f8fe1e39fb4d03c1fbb ******/
		%feature("compactdefaultargs") SetApproxParameters;
		%feature("autodoc", "
Parameters
----------
aCont: GeomAbs_Shape
aMaxDegree: int
aMaxSeg: int

Return
-------
None

Description
-----------
Sets approximation parameters.
") SetApproxParameters;
		void SetApproxParameters(const GeomAbs_Shape aCont, const int aMaxDegree, const int aMaxSeg);

		/****** HelixGeom_BuilderApproxCurve::SetTolerance ******/
		/****** md5 signature: ffb3e8fe1dfa954818f206ce2ec582e9 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
aTolerance: double

Return
-------
None

Description
-----------
Sets approximation tolerance.
") SetTolerance;
		void SetTolerance(const double aTolerance);

		/****** HelixGeom_BuilderApproxCurve::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Gets approximation tolerance.
") Tolerance;
		double Tolerance();

		/****** HelixGeom_BuilderApproxCurve::ToleranceReached ******/
		/****** md5 signature: 30e9580d438abb6d0f78978f7bdbf804 ******/
		%feature("compactdefaultargs") ToleranceReached;
		%feature("autodoc", "Return
-------
double

Description
-----------
Gets actual tolerance reached by approximation algorithm.
") ToleranceReached;
		double ToleranceReached();

		/****** HelixGeom_BuilderApproxCurve::WarningStatus ******/
		/****** md5 signature: 414b0a191f67a5ee9c6e55a6a0bd7e86 ******/
		%feature("compactdefaultargs") WarningStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns warning status of algorithm.
") WarningStatus;
		int WarningStatus();

};


%extend HelixGeom_BuilderApproxCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class HelixGeom_HelixCurve *
*****************************/
class HelixGeom_HelixCurve : public Adaptor3d_Curve {
	public:
		/****** HelixGeom_HelixCurve::HelixGeom_HelixCurve ******/
		/****** md5 signature: 5a42e6ecee975e5d79be2392d2a59147 ******/
		%feature("compactdefaultargs") HelixGeom_HelixCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
implementation of analytical expressions.
") HelixGeom_HelixCurve;
		 HelixGeom_HelixCurve();

		/****** HelixGeom_HelixCurve::Continuity ******/
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Gets continuity.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** HelixGeom_HelixCurve::EvalD0 ******/
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

		/****** HelixGeom_HelixCurve::EvalD1 ******/
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
Computes the point and first derivative at parameter theU.
") EvalD1;
		Geom_Curve::ResD1 EvalD1(const double theU);

		/****** HelixGeom_HelixCurve::EvalD2 ******/
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
Computes the point and first two derivatives at parameter theU.
") EvalD2;
		Geom_Curve::ResD2 EvalD2(const double theU);

		/****** HelixGeom_HelixCurve::EvalDN ******/
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
Returns the derivative of order theN at parameter theU.
") EvalDN;
		gp_Vec EvalDN(const double theU, const int theN);

		/****** HelixGeom_HelixCurve::FirstParameter ******/
		/****** md5 signature: a030fd3ced91f50691075634ae7b49fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Gets first parameter.
") FirstParameter;
		double FirstParameter();

		/****** HelixGeom_HelixCurve::Intervals ******/
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
Gets parametric intervals.
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** HelixGeom_HelixCurve::IsClosed ******/
		/****** md5 signature: e10ee7204b25ff2ff849146f37c83359 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsClosed;
		bool IsClosed();

		/****** HelixGeom_HelixCurve::IsPeriodic ******/
		/****** md5 signature: c33341d130b25859848a016acbcaf4dd ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsPeriodic;
		bool IsPeriodic();

		/****** HelixGeom_HelixCurve::LastParameter ******/
		/****** md5 signature: dd6d522a80d5537086a8d1fbe2265300 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Gets last parameter.
") LastParameter;
		double LastParameter();

		/****** HelixGeom_HelixCurve::Load ******/
		/****** md5 signature: 14bc79a16a4ba0fe93224560bb579cb0 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets default values for parameters.
") Load;
		void Load();

		/****** HelixGeom_HelixCurve::Load ******/
		/****** md5 signature: b726a4f1a12d006c5111f918e46f4088 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
aT1: double
aT2: double
aPitch: double
aRStart: double
aTaperAngle: double
aIsCW: bool

Return
-------
None

Description
-----------
Sets helix parameters.
") Load;
		void Load(const double aT1, const double aT2, const double aPitch, const double aRStart, const double aTaperAngle, const bool aIsCW);

		/****** HelixGeom_HelixCurve::NbIntervals ******/
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
Gets number of intervals.
") NbIntervals;
		int NbIntervals(const GeomAbs_Shape S);

		/****** HelixGeom_HelixCurve::Period ******/
		/****** md5 signature: 1f089b3595450d6c97092473e379f329 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns 2*PI.
") Period;
		double Period();

		/****** HelixGeom_HelixCurve::Resolution ******/
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
Gets parametric resolution.
") Resolution;
		double Resolution(const double R3d);

};


%make_alias(HelixGeom_HelixCurve)

%extend HelixGeom_HelixCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class HelixGeom_Tools *
************************/
class HelixGeom_Tools {
	public:
		/****** HelixGeom_Tools::ApprCurve3D ******/
		/****** md5 signature: cd298aff9d1f761439e932012d61f7ae ******/
		%feature("compactdefaultargs") ApprCurve3D;
		%feature("autodoc", "
Parameters
----------
theHC: Adaptor3d_Curve
theTol: double
theCont: GeomAbs_Shape
theMaxSeg: int
theMaxDeg: int
theBSpl: Geom_BSplineCurve

Return
-------
theMaxError: double

Description
-----------
Approximates a generic 3D curve using B-spline representation. 
Parameter theHC [in] Handle to the curve adaptor to approximate 
Parameter theTol [in] Approximation tolerance 
Parameter theCont [in] Required continuity (C0, C1, C2) 
Parameter theMaxSeg [in] Maximum number of curve segments 
Parameter theMaxDeg [in] Maximum degree of B-spline curve 
Parameter theBSpl [out] Resulting B-spline curve 
Parameter theMaxError [out] Maximum approximation error achieved 
Return: 0 on success, error code otherwise.
") ApprCurve3D;
		static int ApprCurve3D(const opencascade::handle<Adaptor3d_Curve> & theHC, const double theTol, const GeomAbs_Shape theCont, const int theMaxSeg, const int theMaxDeg, opencascade::handle<Geom_BSplineCurve> & theBSpl, Standard_Real &OutValue);

		/****** HelixGeom_Tools::ApprHelix ******/
		/****** md5 signature: c88dede085e38dc9e1fe079e6f90553b ******/
		%feature("compactdefaultargs") ApprHelix;
		%feature("autodoc", "
Parameters
----------
aT1: double
aT2: double
aPitch: double
aRStart: double
aTaperAngle: double
aIsCW: bool
aTol: double
theBSpl: Geom_BSplineCurve

Return
-------
theMaxError: double

Description
-----------
Approximates a parametric helix curve using B-spline representation. 
Parameter aT1 [in] Start parameter (angular position in radians) 
Parameter aT2 [in] End parameter (angular position in radians) 
Parameter aPitch [in] Helix pitch (vertical distance per 2*PI radians) 
Parameter aRStart [in] Starting radius at parameter aT1 
Parameter aTaperAngle [in] Taper angle in radians (0 = cylindrical helix) 
Parameter aIsCW [in] True for clockwise, false for counter-clockwise 
Parameter aTol [in] Approximation tolerance 
Parameter theBSpl [out] Resulting B-spline curve 
Parameter theMaxError [out] Maximum approximation error achieved 
Return: 0 on success, error code otherwise.
") ApprHelix;
		static int ApprHelix(const double aT1, const double aT2, const double aPitch, const double aRStart, const double aTaperAngle, const bool aIsCW, const double aTol, opencascade::handle<Geom_BSplineCurve> & theBSpl, Standard_Real &OutValue);

};


%extend HelixGeom_Tools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class HelixGeom_BuilderHelixGen *
**********************************/
%nodefaultctor HelixGeom_BuilderHelixGen;
%ignore HelixGeom_BuilderHelixGen::~HelixGeom_BuilderHelixGen();
class HelixGeom_BuilderHelixGen : public HelixGeom_BuilderApproxCurve {
	public:
		/****** HelixGeom_BuilderHelixGen::CurveParameters ******/
		/****** md5 signature: 678cda91b9d46bae7dbfed67d4c92dcf ******/
		%feature("compactdefaultargs") CurveParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
aT1: double
aT2: double
aPitch: double
aRStart: double
aTaperAngle: double
bIsClockwise: bool

Description
-----------
Gets parameters for building helix curves.
") CurveParameters;
		void CurveParameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Boolean &OutValue);

		/****** HelixGeom_BuilderHelixGen::SetCurveParameters ******/
		/****** md5 signature: 301a4cc8102d8b1f3b14ca8a277b916b ******/
		%feature("compactdefaultargs") SetCurveParameters;
		%feature("autodoc", "
Parameters
----------
aT1: double
aT2: double
aPitch: double
aRStart: double
aTaperAngle: double
bIsClockwise: bool

Return
-------
None

Description
-----------
Sets parameters for building helix curves.
") SetCurveParameters;
		void SetCurveParameters(const double aT1, const double aT2, const double aPitch, const double aRStart, const double aTaperAngle, const bool bIsClockwise);

};


%extend HelixGeom_BuilderHelixGen {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class HelixGeom_BuilderHelix *
*******************************/
class HelixGeom_BuilderHelix : public HelixGeom_BuilderHelixGen {
	public:
		/****** HelixGeom_BuilderHelix::HelixGeom_BuilderHelix ******/
		/****** md5 signature: dd2c5e481b20698906f8e96eb45bf7a5 ******/
		%feature("compactdefaultargs") HelixGeom_BuilderHelix;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") HelixGeom_BuilderHelix;
		 HelixGeom_BuilderHelix();

		/****** HelixGeom_BuilderHelix::Perform ******/
		/****** md5 signature: fac23874c1d7d815e28cd1859ff265a0 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs calculations.
") Perform;
		void Perform();

		/****** HelixGeom_BuilderHelix::Position ******/
		/****** md5 signature: 4998eb006d0dfaf45366e64da028e2d8 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Gets coordinate axes for helix.
") Position;
		const gp_Ax2 Position();

		/****** HelixGeom_BuilderHelix::SetPosition ******/
		/****** md5 signature: 082e654d9577a7b77e530e25b75a8974 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
aAx2: gp_Ax2

Return
-------
None

Description
-----------
Sets coordinate axes for helix.
") SetPosition;
		void SetPosition(const gp_Ax2 & aAx2);

};


%extend HelixGeom_BuilderHelix {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class HelixGeom_BuilderHelixCoil *
***********************************/
class HelixGeom_BuilderHelixCoil : public HelixGeom_BuilderHelixGen {
	public:
		/****** HelixGeom_BuilderHelixCoil::HelixGeom_BuilderHelixCoil ******/
		/****** md5 signature: 9454269dcbba7a26b4c4050b18cd73af ******/
		%feature("compactdefaultargs") HelixGeom_BuilderHelixCoil;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") HelixGeom_BuilderHelixCoil;
		 HelixGeom_BuilderHelixCoil();

		/****** HelixGeom_BuilderHelixCoil::Perform ******/
		/****** md5 signature: fac23874c1d7d815e28cd1859ff265a0 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs calculations.
") Perform;
		void Perform();

};


%extend HelixGeom_BuilderHelixCoil {
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
def HelixGeom_Tools_ApprCurve3D(*args):
	return HelixGeom_Tools.ApprCurve3D(*args)

@deprecated
def HelixGeom_Tools_ApprHelix(*args):
	return HelixGeom_Tools.ApprHelix(*args)

}
