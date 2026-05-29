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
%define LOCALANALYSISDOCSTRING
"LocalAnalysis module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_localanalysis.html"
%enddef
%module (package="OCC.Core", docstring=LOCALANALYSISDOCSTRING) LocalAnalysis


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
#include<LocalAnalysis_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomLProp_module.hxx>
#include<Geom2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import GeomAbs.i
%import Geom2d.i
%import GeomLProp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum LocalAnalysis_StatusErrorType {
	LocalAnalysis_NullFirstDerivative = 0,
	LocalAnalysis_NullSecondDerivative = 1,
	LocalAnalysis_TangentNotDefined = 2,
	LocalAnalysis_NormalNotDefined = 3,
	LocalAnalysis_CurvatureNotDefined = 4,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class LocalAnalysis_StatusErrorType(IntEnum):
	LocalAnalysis_NullFirstDerivative = 0
	LocalAnalysis_NullSecondDerivative = 1
	LocalAnalysis_TangentNotDefined = 2
	LocalAnalysis_NormalNotDefined = 3
	LocalAnalysis_CurvatureNotDefined = 4
LocalAnalysis_NullFirstDerivative = LocalAnalysis_StatusErrorType.LocalAnalysis_NullFirstDerivative
LocalAnalysis_NullSecondDerivative = LocalAnalysis_StatusErrorType.LocalAnalysis_NullSecondDerivative
LocalAnalysis_TangentNotDefined = LocalAnalysis_StatusErrorType.LocalAnalysis_TangentNotDefined
LocalAnalysis_NormalNotDefined = LocalAnalysis_StatusErrorType.LocalAnalysis_NormalNotDefined
LocalAnalysis_CurvatureNotDefined = LocalAnalysis_StatusErrorType.LocalAnalysis_CurvatureNotDefined
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**********************
* class LocalAnalysis *
**********************/
%rename(localanalysis) LocalAnalysis;
class LocalAnalysis {
	public:
		/****** LocalAnalysis::Dump ******/
		/****** md5 signature: 0c461d717d7298d3576332c66a4c9d44 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
surfconti: LocalAnalysis_SurfaceContinuity

Return
-------
o: Standard_OStream

Description
-----------
This class computes and gives tools to check the local continuity between two points situated on 2 curves. //! This function gives information about a variable CurveContinuity.
") Dump;
		static void Dump(const LocalAnalysis_SurfaceContinuity & surfconti, std::ostream &OutValue);

		/****** LocalAnalysis::Dump ******/
		/****** md5 signature: 74ee8e149b67cec4713e41bac235b420 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
curvconti: LocalAnalysis_CurveContinuity

Return
-------
o: Standard_OStream

Description
-----------
This function gives information about a variable SurfaceContinuity.
") Dump;
		static void Dump(const LocalAnalysis_CurveContinuity & curvconti, std::ostream &OutValue);

};


%extend LocalAnalysis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class LocalAnalysis_CurveContinuity *
**************************************/
class LocalAnalysis_CurveContinuity {
	public:
		/****** LocalAnalysis_CurveContinuity::LocalAnalysis_CurveContinuity ******/
		/****** md5 signature: 91bbcb6d192415e7e1c83c73847c86c0 ******/
		%feature("compactdefaultargs") LocalAnalysis_CurveContinuity;
		%feature("autodoc", "
Parameters
----------
Curv1: Geom_Curve
u1: double
Curv2: Geom_Curve
u2: double
Order: GeomAbs_Shape
EpsNul: double (optional, default to 0.001)
EpsC0: double (optional, default to 0.001)
EpsC1: double (optional, default to 0.001)
EpsC2: double (optional, default to 0.001)
EpsG1: double (optional, default to 0.001)
EpsG2: double (optional, default to 0.001)
Percent: double (optional, default to 0.01)
Maxlen: double (optional, default to 10000)

Return
-------
None

Description
-----------
-u1 is the parameter of the point on Curv1 -u2 is the parameter of the point on Curv2 -Order is the required continuity: GeomAbs_C0 GeomAbs_C1 GeomAbs_C2 GeomAbs_G1 GeomAbs_G2 //! -EpsNul is used to detect a vector with null magnitude (in mm) //! -EpsC0 is used for C0 continuity to confuse two points (in mm) //! -EpsC1 is an angular tolerance in radians used for C1 continuity to compare the angle between the first derivatives //! -EpsC2 is an angular tolerance in radians used for C2 continuity to compare the angle between the second derivatives //! -EpsG1 is an angular tolerance in radians used for G1 continuity to compare the angle between the tangents //! -EpsG2 is an angular tolerance in radians used for G2 continuity to compare the angle between the normals //! - percent: percentage of curvature variation (unitless) used for G2 continuity //! - Maxlen is the maximum length of Curv1 or Curv2 in meters used to detect nul curvature (in mm) //! the constructor computes the quantities which are necessary to check the continuity in the following cases: //! case C0 ------- - the distance between P1 and P2 with P1=Curv1 (u1) and P2=Curv2(u2) //! case C1 ------- //! - the angle between the first derivatives dCurv1(u1)  dCurv2(u2) -------- and --------- du  du //! - the ratio between the magnitudes of the first derivatives //! the angle value is between 0 and PI/2 //! case C2 ------- - the angle between the second derivatives 2  2 d Curv1(u1) d Curv2(u2) ---------- ---------- 2  2 du du //! the angle value is between 0 and PI/2 //! - the ratio between the magnitudes of the second derivatives //! case G1 ------- the angle between the tangents at each point //! the angle value is between 0 and PI/2 //! case G2 ------- -the angle between the normals at each point //! the angle value is between 0 and PI/2 //! - the relative variation of curvature: |curvat1-curvat2| ------------------ 1/2 (curvat1*curvat2) //! where curvat1 is the curvature at the first point and curvat2 the curvature at the second point.
") LocalAnalysis_CurveContinuity;
		 LocalAnalysis_CurveContinuity(const opencascade::handle<Geom_Curve> & Curv1, const double u1, const opencascade::handle<Geom_Curve> & Curv2, const double u2, const GeomAbs_Shape Order, const double EpsNul = 0.001, const double EpsC0 = 0.001, const double EpsC1 = 0.001, const double EpsC2 = 0.001, const double EpsG1 = 0.001, const double EpsG2 = 0.001, const double Percent = 0.01, const double Maxlen = 10000);

		/****** LocalAnalysis_CurveContinuity::C0Value ******/
		/****** md5 signature: 58bac70443ef045a4ebae7ed74aec2ab ******/
		%feature("compactdefaultargs") C0Value;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") C0Value;
		double C0Value();

		/****** LocalAnalysis_CurveContinuity::C1Angle ******/
		/****** md5 signature: edb5680c2d938cf998eec53944925915 ******/
		%feature("compactdefaultargs") C1Angle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") C1Angle;
		double C1Angle();

		/****** LocalAnalysis_CurveContinuity::C1Ratio ******/
		/****** md5 signature: 50c2fb0ac6b2680b66a35088fe5198e5 ******/
		%feature("compactdefaultargs") C1Ratio;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") C1Ratio;
		double C1Ratio();

		/****** LocalAnalysis_CurveContinuity::C2Angle ******/
		/****** md5 signature: ebcce214b89e68960fa1beaa4babf011 ******/
		%feature("compactdefaultargs") C2Angle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") C2Angle;
		double C2Angle();

		/****** LocalAnalysis_CurveContinuity::C2Ratio ******/
		/****** md5 signature: c867a2f065bef6de6ac86039e9ee4a9a ******/
		%feature("compactdefaultargs") C2Ratio;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") C2Ratio;
		double C2Ratio();

		/****** LocalAnalysis_CurveContinuity::ContinuityStatus ******/
		/****** md5 signature: 87127ab6a1cd70cf71645c07c6c3ce3f ******/
		%feature("compactdefaultargs") ContinuityStatus;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") ContinuityStatus;
		GeomAbs_Shape ContinuityStatus();

		/****** LocalAnalysis_CurveContinuity::G1Angle ******/
		/****** md5 signature: 0fca012855f37c33bccc84652c66ef54 ******/
		%feature("compactdefaultargs") G1Angle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") G1Angle;
		double G1Angle();

		/****** LocalAnalysis_CurveContinuity::G2Angle ******/
		/****** md5 signature: 7f60782fd868fad890f4f3cd4038e454 ******/
		%feature("compactdefaultargs") G2Angle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") G2Angle;
		double G2Angle();

		/****** LocalAnalysis_CurveContinuity::G2CurvatureVariation ******/
		/****** md5 signature: 7eacbd1918832cb07a013d8e3256d6c9 ******/
		%feature("compactdefaultargs") G2CurvatureVariation;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") G2CurvatureVariation;
		double G2CurvatureVariation();

		/****** LocalAnalysis_CurveContinuity::IsC0 ******/
		/****** md5 signature: 07736b2cf134ad012e9d4ff051100311 ******/
		%feature("compactdefaultargs") IsC0;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsC0;
		bool IsC0();

		/****** LocalAnalysis_CurveContinuity::IsC1 ******/
		/****** md5 signature: aaa7051ff302e37cb75f4af35c86ea45 ******/
		%feature("compactdefaultargs") IsC1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsC1;
		bool IsC1();

		/****** LocalAnalysis_CurveContinuity::IsC2 ******/
		/****** md5 signature: 6d296de18ae8d08858a70eabb52f32f7 ******/
		%feature("compactdefaultargs") IsC2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsC2;
		bool IsC2();

		/****** LocalAnalysis_CurveContinuity::IsDone ******/
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

		/****** LocalAnalysis_CurveContinuity::IsG1 ******/
		/****** md5 signature: 7fc7e68ec62e03beedabdfab3168338e ******/
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsG1;
		bool IsG1();

		/****** LocalAnalysis_CurveContinuity::IsG2 ******/
		/****** md5 signature: 838126ac3fa03c9c8e6ff7e9052ae087 ******/
		%feature("compactdefaultargs") IsG2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsG2;
		bool IsG2();

		/****** LocalAnalysis_CurveContinuity::StatusError ******/
		/****** md5 signature: 9c303188071e5e401702a37606a9e25b ******/
		%feature("compactdefaultargs") StatusError;
		%feature("autodoc", "Return
-------
LocalAnalysis_StatusErrorType

Description
-----------
No available documentation.
") StatusError;
		LocalAnalysis_StatusErrorType StatusError();

};


%extend LocalAnalysis_CurveContinuity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class LocalAnalysis_SurfaceContinuity *
****************************************/
class LocalAnalysis_SurfaceContinuity {
	public:
		/****** LocalAnalysis_SurfaceContinuity::LocalAnalysis_SurfaceContinuity ******/
		/****** md5 signature: 6bd4d6e740c73bf7451c54cfd1fe05f0 ******/
		%feature("compactdefaultargs") LocalAnalysis_SurfaceContinuity;
		%feature("autodoc", "
Parameters
----------
Surf1: Geom_Surface
u1: double
v1: double
Surf2: Geom_Surface
u2: double
v2: double
Order: GeomAbs_Shape
EpsNul: double (optional, default to 0.001)
EpsC0: double (optional, default to 0.001)
EpsC1: double (optional, default to 0.001)
EpsC2: double (optional, default to 0.001)
EpsG1: double (optional, default to 0.001)
Percent: double (optional, default to 0.01)
Maxlen: double (optional, default to 10000)

Return
-------
None

Description
-----------
-u1,v1 are the parameters of the point on Surf1 -u2,v2 are the parameters of the point on Surf2 -Order is the required continuity: GeomAbs_C0 GeomAbs_C1 GeomAbs_C2 GeomAbs_G1 GeomAbs_G2 //! -EpsNul is used to detect a a vector with nul magnitude //! -EpsC0 is used for C0 continuity to confuse two points (in mm) //! -EpsC1 is an angular tolerance in radians used for C1 continuity to compare the angle between the first derivatives //! -EpsC2 is an angular tolerance in radians used for C2 continuity to compare the angle between the second derivatives //! -EpsG1 is an angular tolerance in radians used for G1 continuity to compare the angle between the normals //! -Percent: percentage of curvature variation (unitless) used for G2 continuity //! - Maxlen is the maximum length of Surf1 or Surf2 in meters used to detect null curvature (in mm) //! the constructor computes the quantities which are necessary to check the continuity in the following cases: //! case C0 -------- - the distance between P1 and P2 with P1=Surf (u1,v1) and P2=Surfv2(u2,v2) //! case C1 ------- //! - the angle between the first derivatives in u: //! dSurf1(u1,v1) dSurf2(u2,v2) ----------- and --------- du  du //! the angle value is between 0 and PI/2 //! - the angle between the first derivatives in v: //! dSurf1(u1,v1) dSurf2(u2,v2) -------- and --------- dv  dv //! - the ratio between the magnitudes of the first derivatives in u - the ratio between the magnitudes of the first derivatives in v //! the angle value is between 0 and pi/2 //! case C2 ------- - the angle between the second derivatives in u 2 2 d Surf1(u1,v1) d Surf2(u2,v2) ---------- ---------- 2 2 d u d u //! - the ratio between the magnitudes of the second derivatives in u - the ratio between the magnitudes of the second derivatives in v //! the angle value is between 0 and PI/2 //! case G1 ------- -the angle between the normals at each point the angle value is between 0 and PI/2 //! case G2 ------- - the maximum normal curvature gap between the two points.
") LocalAnalysis_SurfaceContinuity;
		 LocalAnalysis_SurfaceContinuity(const opencascade::handle<Geom_Surface> & Surf1, const double u1, const double v1, const opencascade::handle<Geom_Surface> & Surf2, const double u2, const double v2, const GeomAbs_Shape Order, const double EpsNul = 0.001, const double EpsC0 = 0.001, const double EpsC1 = 0.001, const double EpsC2 = 0.001, const double EpsG1 = 0.001, const double Percent = 0.01, const double Maxlen = 10000);

		/****** LocalAnalysis_SurfaceContinuity::LocalAnalysis_SurfaceContinuity ******/
		/****** md5 signature: d9aba56d57f162228f167f3b22c6233a ******/
		%feature("compactdefaultargs") LocalAnalysis_SurfaceContinuity;
		%feature("autodoc", "
Parameters
----------
curv1: Geom2d_Curve
curv2: Geom2d_Curve
U: double
Surf1: Geom_Surface
Surf2: Geom_Surface
Order: GeomAbs_Shape
EpsNul: double (optional, default to 0.001)
EpsC0: double (optional, default to 0.001)
EpsC1: double (optional, default to 0.001)
EpsC2: double (optional, default to 0.001)
EpsG1: double (optional, default to 0.001)
Percent: double (optional, default to 0.01)
Maxlen: double (optional, default to 10000)

Return
-------
None

Description
-----------
No available documentation.
") LocalAnalysis_SurfaceContinuity;
		 LocalAnalysis_SurfaceContinuity(const opencascade::handle<Geom2d_Curve> & curv1, const opencascade::handle<Geom2d_Curve> & curv2, const double U, const opencascade::handle<Geom_Surface> & Surf1, const opencascade::handle<Geom_Surface> & Surf2, const GeomAbs_Shape Order, const double EpsNul = 0.001, const double EpsC0 = 0.001, const double EpsC1 = 0.001, const double EpsC2 = 0.001, const double EpsG1 = 0.001, const double Percent = 0.01, const double Maxlen = 10000);

		/****** LocalAnalysis_SurfaceContinuity::LocalAnalysis_SurfaceContinuity ******/
		/****** md5 signature: 390e38ecabe416b8864b77f29a234c94 ******/
		%feature("compactdefaultargs") LocalAnalysis_SurfaceContinuity;
		%feature("autodoc", "
Parameters
----------
EpsNul: double (optional, default to 0.001)
EpsC0: double (optional, default to 0.001)
EpsC1: double (optional, default to 0.001)
EpsC2: double (optional, default to 0.001)
EpsG1: double (optional, default to 0.001)
Percent: double (optional, default to 0.01)
Maxlen: double (optional, default to 10000)

Return
-------
None

Description
-----------
This constructor is used when we want to compute many analysis. After we use the method ComputeAnalysis.
") LocalAnalysis_SurfaceContinuity;
		 LocalAnalysis_SurfaceContinuity(const double EpsNul = 0.001, const double EpsC0 = 0.001, const double EpsC1 = 0.001, const double EpsC2 = 0.001, const double EpsG1 = 0.001, const double Percent = 0.01, const double Maxlen = 10000);

		/****** LocalAnalysis_SurfaceContinuity::C0Value ******/
		/****** md5 signature: 58bac70443ef045a4ebae7ed74aec2ab ******/
		%feature("compactdefaultargs") C0Value;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") C0Value;
		double C0Value();

		/****** LocalAnalysis_SurfaceContinuity::C1UAngle ******/
		/****** md5 signature: 61bc74b2eb6ca47ff51eb201e5350305 ******/
		%feature("compactdefaultargs") C1UAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") C1UAngle;
		double C1UAngle();

		/****** LocalAnalysis_SurfaceContinuity::C1URatio ******/
		/****** md5 signature: 2fe57a3981aabb1a6d032e93974dc10f ******/
		%feature("compactdefaultargs") C1URatio;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") C1URatio;
		double C1URatio();

		/****** LocalAnalysis_SurfaceContinuity::C1VAngle ******/
		/****** md5 signature: 2b3b4bdcc523ed1940bd34e148eed666 ******/
		%feature("compactdefaultargs") C1VAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") C1VAngle;
		double C1VAngle();

		/****** LocalAnalysis_SurfaceContinuity::C1VRatio ******/
		/****** md5 signature: 512839dfd644f5f9bdc4cbc1e6acc4dd ******/
		%feature("compactdefaultargs") C1VRatio;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") C1VRatio;
		double C1VRatio();

		/****** LocalAnalysis_SurfaceContinuity::C2UAngle ******/
		/****** md5 signature: 21eaa391a143b047c0d3a18e458bd3bc ******/
		%feature("compactdefaultargs") C2UAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") C2UAngle;
		double C2UAngle();

		/****** LocalAnalysis_SurfaceContinuity::C2URatio ******/
		/****** md5 signature: 16cc90c1682e5ace67e665c099a3319d ******/
		%feature("compactdefaultargs") C2URatio;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") C2URatio;
		double C2URatio();

		/****** LocalAnalysis_SurfaceContinuity::C2VAngle ******/
		/****** md5 signature: 9c0b79d135d4af32fb6ca75395ff98f3 ******/
		%feature("compactdefaultargs") C2VAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") C2VAngle;
		double C2VAngle();

		/****** LocalAnalysis_SurfaceContinuity::C2VRatio ******/
		/****** md5 signature: 377db9245467858e5b764f391706ad05 ******/
		%feature("compactdefaultargs") C2VRatio;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") C2VRatio;
		double C2VRatio();

		/****** LocalAnalysis_SurfaceContinuity::ComputeAnalysis ******/
		/****** md5 signature: fd43bd9b6cbc4e7f06a8e4825cc0c692 ******/
		%feature("compactdefaultargs") ComputeAnalysis;
		%feature("autodoc", "
Parameters
----------
Surf1: GeomLProp_SLProps
Surf2: GeomLProp_SLProps
Order: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") ComputeAnalysis;
		void ComputeAnalysis(GeomLProp_SLProps & Surf1, GeomLProp_SLProps & Surf2, const GeomAbs_Shape Order);

		/****** LocalAnalysis_SurfaceContinuity::ContinuityStatus ******/
		/****** md5 signature: 87127ab6a1cd70cf71645c07c6c3ce3f ******/
		%feature("compactdefaultargs") ContinuityStatus;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") ContinuityStatus;
		GeomAbs_Shape ContinuityStatus();

		/****** LocalAnalysis_SurfaceContinuity::G1Angle ******/
		/****** md5 signature: 0fca012855f37c33bccc84652c66ef54 ******/
		%feature("compactdefaultargs") G1Angle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") G1Angle;
		double G1Angle();

		/****** LocalAnalysis_SurfaceContinuity::G2CurvatureGap ******/
		/****** md5 signature: 318ad4b3fac5679e2edb15927dc8cd16 ******/
		%feature("compactdefaultargs") G2CurvatureGap;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") G2CurvatureGap;
		double G2CurvatureGap();

		/****** LocalAnalysis_SurfaceContinuity::IsC0 ******/
		/****** md5 signature: 07736b2cf134ad012e9d4ff051100311 ******/
		%feature("compactdefaultargs") IsC0;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsC0;
		bool IsC0();

		/****** LocalAnalysis_SurfaceContinuity::IsC1 ******/
		/****** md5 signature: aaa7051ff302e37cb75f4af35c86ea45 ******/
		%feature("compactdefaultargs") IsC1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsC1;
		bool IsC1();

		/****** LocalAnalysis_SurfaceContinuity::IsC2 ******/
		/****** md5 signature: 6d296de18ae8d08858a70eabb52f32f7 ******/
		%feature("compactdefaultargs") IsC2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsC2;
		bool IsC2();

		/****** LocalAnalysis_SurfaceContinuity::IsDone ******/
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

		/****** LocalAnalysis_SurfaceContinuity::IsG1 ******/
		/****** md5 signature: 7fc7e68ec62e03beedabdfab3168338e ******/
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsG1;
		bool IsG1();

		/****** LocalAnalysis_SurfaceContinuity::IsG2 ******/
		/****** md5 signature: 838126ac3fa03c9c8e6ff7e9052ae087 ******/
		%feature("compactdefaultargs") IsG2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsG2;
		bool IsG2();

		/****** LocalAnalysis_SurfaceContinuity::StatusError ******/
		/****** md5 signature: 9c303188071e5e401702a37606a9e25b ******/
		%feature("compactdefaultargs") StatusError;
		%feature("autodoc", "Return
-------
LocalAnalysis_StatusErrorType

Description
-----------
No available documentation.
") StatusError;
		LocalAnalysis_StatusErrorType StatusError();

};


%extend LocalAnalysis_SurfaceContinuity {
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
def localanalysis_Dump(*args):
	return localanalysis.Dump(*args)

@deprecated
def localanalysis_Dump(*args):
	return localanalysis.Dump(*args)

}
