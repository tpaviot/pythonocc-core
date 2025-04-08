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
%define LOCALANALYSISDOCSTRING
"LocalAnalysis module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_localanalysis.html"
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
This class compute s and gives tools to check the local continuity between two points situated on 2 curves. //! This function gives information about a variable CurveContinuity.
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
		/****** md5 signature: 94a1acbbd7b45e6042dc7a2a5794ad5a ******/
		%feature("compactdefaultargs") LocalAnalysis_CurveContinuity;
		%feature("autodoc", "
Parameters
----------
Curv1: Geom_Curve
u1: float
Curv2: Geom_Curve
u2: float
Order: GeomAbs_Shape
EpsNul: float (optional, default to 0.001)
EpsC0: float (optional, default to 0.001)
EpsC1: float (optional, default to 0.001)
EpsC2: float (optional, default to 0.001)
EpsG1: float (optional, default to 0.001)
EpsG2: float (optional, default to 0.001)
Percent: float (optional, default to 0.01)
Maxlen: float (optional, default to 10000)

Return
-------
None

Description
-----------
-u1 is the parameter of the point on Curv1 -u2 is the parameter of the point on Curv2 -Order is the required continuity: GeomAbs_C0 GeomAbs_C1 GeomAbs_C2 GeomAbs_G1 GeomAbs_G2 //! -EpsNul is used to detect a a vector with nul magnitude (in mm) //! -EpsC0 is used for C0 continuity to confuse two points (in mm) //! -EpsC1 is an angular tolerance in radians used for C1 continuity to compare the angle between the first derivatives //! -EpsC2 is an angular tolerance in radians used for C2 continuity to compare the angle between the second derivatives //! -EpsG1 is an angular tolerance in radians used for G1 continuity to compare the angle between the tangents //! -EpsG2 is an angular tolerance in radians used for G2 continuity to compare the angle between the normals //! - percent: percentage of curvature variation (unitless) used for G2 continuity //! - Maxlen is the maximum length of Curv1 or Curv2 in meters used to detect nul curvature (in mm) //! the constructor computes the quantities which are necessary to check the continuity in the following cases: //! case C0 -------- - the distance between P1 and P2 with P1=Curv1 (u1) and P2=Curv2(u2) //! case C1 ------- //! - the angle between the first derivatives dCurv1(u1)  dCurv2(u2) -------- and --------- du  du //! - the ratio between the magnitudes of the first derivatives //! the angle value is between 0 and PI/2 //! case C2 ------- - the angle between the second derivatives 2  2 d Curv1(u1) d Curv2(u2) ---------- ---------- 2  2 du du //! the angle value is between 0 and PI/2 //! - the ratio between the magnitudes of the second derivatives //! case G1 ------- the angle between the tangents at each point //! the angle value is between 0 and PI/2 //! case G2 ------- -the angle between the normals at each point //! the angle value is between 0 and PI/2 //! - the relative variation of curvature: |curvat1-curvat2| ------------------ 1/2 (curvat1*curvat2) //! where curvat1 is the curvature at the first point and curvat2 the curvature at the second point.
") LocalAnalysis_CurveContinuity;
		 LocalAnalysis_CurveContinuity(const opencascade::handle<Geom_Curve> & Curv1, const Standard_Real u1, const opencascade::handle<Geom_Curve> & Curv2, const Standard_Real u2, const GeomAbs_Shape Order, const Standard_Real EpsNul = 0.001, const Standard_Real EpsC0 = 0.001, const Standard_Real EpsC1 = 0.001, const Standard_Real EpsC2 = 0.001, const Standard_Real EpsG1 = 0.001, const Standard_Real EpsG2 = 0.001, const Standard_Real Percent = 0.01, const Standard_Real Maxlen = 10000);

		/****** LocalAnalysis_CurveContinuity::C0Value ******/
		/****** md5 signature: 46447dbacb11e1eb2dbe14115e00dee1 ******/
		%feature("compactdefaultargs") C0Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") C0Value;
		Standard_Real C0Value();

		/****** LocalAnalysis_CurveContinuity::C1Angle ******/
		/****** md5 signature: 40564d624b1f758cd6e1b181645ae4c0 ******/
		%feature("compactdefaultargs") C1Angle;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") C1Angle;
		Standard_Real C1Angle();

		/****** LocalAnalysis_CurveContinuity::C1Ratio ******/
		/****** md5 signature: d87197e8d7bf80d1904b9e96ba8658fb ******/
		%feature("compactdefaultargs") C1Ratio;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") C1Ratio;
		Standard_Real C1Ratio();

		/****** LocalAnalysis_CurveContinuity::C2Angle ******/
		/****** md5 signature: a4cee893bfc8c0ae29db68b50409b230 ******/
		%feature("compactdefaultargs") C2Angle;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") C2Angle;
		Standard_Real C2Angle();

		/****** LocalAnalysis_CurveContinuity::C2Ratio ******/
		/****** md5 signature: bc0cc90e608ffcf8d9891d54a721db42 ******/
		%feature("compactdefaultargs") C2Ratio;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") C2Ratio;
		Standard_Real C2Ratio();

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
		/****** md5 signature: 514dc4ec8755ec550d58f20afe0d65e5 ******/
		%feature("compactdefaultargs") G1Angle;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") G1Angle;
		Standard_Real G1Angle();

		/****** LocalAnalysis_CurveContinuity::G2Angle ******/
		/****** md5 signature: a85bad56a8be3086a5f87082351ff295 ******/
		%feature("compactdefaultargs") G2Angle;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") G2Angle;
		Standard_Real G2Angle();

		/****** LocalAnalysis_CurveContinuity::G2CurvatureVariation ******/
		/****** md5 signature: 8191070609891353562e3b0e881cf333 ******/
		%feature("compactdefaultargs") G2CurvatureVariation;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") G2CurvatureVariation;
		Standard_Real G2CurvatureVariation();

		/****** LocalAnalysis_CurveContinuity::IsC0 ******/
		/****** md5 signature: a9c219b35c36d3fb15474a89d33aafef ******/
		%feature("compactdefaultargs") IsC0;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsC0;
		Standard_Boolean IsC0();

		/****** LocalAnalysis_CurveContinuity::IsC1 ******/
		/****** md5 signature: 6d355c55580dd93d6f235af07494f438 ******/
		%feature("compactdefaultargs") IsC1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsC1;
		Standard_Boolean IsC1();

		/****** LocalAnalysis_CurveContinuity::IsC2 ******/
		/****** md5 signature: a9641a88634e370fe83efb9e59bc30c3 ******/
		%feature("compactdefaultargs") IsC2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsC2;
		Standard_Boolean IsC2();

		/****** LocalAnalysis_CurveContinuity::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** LocalAnalysis_CurveContinuity::IsG1 ******/
		/****** md5 signature: 0f4f13bd2815462bc6621308cc24269a ******/
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsG1;
		Standard_Boolean IsG1();

		/****** LocalAnalysis_CurveContinuity::IsG2 ******/
		/****** md5 signature: 33a6bccf73c4fe3201add1f3a9e64150 ******/
		%feature("compactdefaultargs") IsG2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsG2;
		Standard_Boolean IsG2();

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
		/****** md5 signature: 27edcb9c05548dad6ce4c6a6b1ef9ac6 ******/
		%feature("compactdefaultargs") LocalAnalysis_SurfaceContinuity;
		%feature("autodoc", "
Parameters
----------
Surf1: Geom_Surface
u1: float
v1: float
Surf2: Geom_Surface
u2: float
v2: float
Order: GeomAbs_Shape
EpsNul: float (optional, default to 0.001)
EpsC0: float (optional, default to 0.001)
EpsC1: float (optional, default to 0.001)
EpsC2: float (optional, default to 0.001)
EpsG1: float (optional, default to 0.001)
Percent: float (optional, default to 0.01)
Maxlen: float (optional, default to 10000)

Return
-------
None

Description
-----------
-u1,v1 are the parameters of the point on Surf1 -u2,v2 are the parameters of the point on Surf2 -Order is the required continuity: GeomAbs_C0 GeomAbs_C1 GeomAbs_C2 GeomAbs_G1 GeomAbs_G2 //! -EpsNul is used to detect a a vector with nul magnitude //! -EpsC0 is used for C0 continuity to confuse two points (in mm) //! -EpsC1 is an angular tolerance in radians used for C1 continuity to compare the angle between the first derivatives //! -EpsC2 is an angular tolerance in radians used for C2 continuity to compare the angle between the second derivatives //! -EpsG1 is an angular tolerance in radians used for G1 continuity to compare the angle between the normals //! -Percent: percentage of curvature variation (unitless) used for G2 continuity //! - Maxlen is the maximum length of Surf1 or Surf2 in meters used to detect null curvature (in mm) //! the constructor computes the quantities which are necessary to check the continuity in the following cases: //! case C0 -------- - the distance between P1 and P2 with P1=Surf (u1,v1) and P2=Surfv2(u2,v2) //! case C1 ------- //! - the angle between the first derivatives in u: //! dSurf1(u1,v1) dSurf2(u2,v2) ----------- and --------- du  du //! the angle value is between 0 and PI/2 //! - the angle between the first derivatives in v: //! dSurf1(u1,v1) dSurf2(u2,v2) -------- and --------- dv  dv //! - the ratio between the magnitudes of the first derivatives in u - the ratio between the magnitudes of the first derivatives in v //! the angle value is between 0 and pi/2 //! case C2 ------- - the angle between the second derivatives in u 2 2 d Surf1(u1,v1) d Surf2(u2,v2) ---------- ---------- 2 2 d u d u //! - the ratio between the magnitudes of the second derivatives in u - the ratio between the magnitudes of the second derivatives in v //! the angle value is between 0 and PI/2 //! case G1 ------- -the angle between the normals at each point the angle value is between 0 and PI/2 //! case G2 ------- - the maximum normal curvature gap between the two points.
") LocalAnalysis_SurfaceContinuity;
		 LocalAnalysis_SurfaceContinuity(const opencascade::handle<Geom_Surface> & Surf1, const Standard_Real u1, const Standard_Real v1, const opencascade::handle<Geom_Surface> & Surf2, const Standard_Real u2, const Standard_Real v2, const GeomAbs_Shape Order, const Standard_Real EpsNul = 0.001, const Standard_Real EpsC0 = 0.001, const Standard_Real EpsC1 = 0.001, const Standard_Real EpsC2 = 0.001, const Standard_Real EpsG1 = 0.001, const Standard_Real Percent = 0.01, const Standard_Real Maxlen = 10000);

		/****** LocalAnalysis_SurfaceContinuity::LocalAnalysis_SurfaceContinuity ******/
		/****** md5 signature: 4aac4a7a370c01d5659bcf6c3ddc6ad6 ******/
		%feature("compactdefaultargs") LocalAnalysis_SurfaceContinuity;
		%feature("autodoc", "
Parameters
----------
curv1: Geom2d_Curve
curv2: Geom2d_Curve
U: float
Surf1: Geom_Surface
Surf2: Geom_Surface
Order: GeomAbs_Shape
EpsNul: float (optional, default to 0.001)
EpsC0: float (optional, default to 0.001)
EpsC1: float (optional, default to 0.001)
EpsC2: float (optional, default to 0.001)
EpsG1: float (optional, default to 0.001)
Percent: float (optional, default to 0.01)
Maxlen: float (optional, default to 10000)

Return
-------
None

Description
-----------
No available documentation.
") LocalAnalysis_SurfaceContinuity;
		 LocalAnalysis_SurfaceContinuity(const opencascade::handle<Geom2d_Curve> & curv1, const opencascade::handle<Geom2d_Curve> & curv2, const Standard_Real U, const opencascade::handle<Geom_Surface> & Surf1, const opencascade::handle<Geom_Surface> & Surf2, const GeomAbs_Shape Order, const Standard_Real EpsNul = 0.001, const Standard_Real EpsC0 = 0.001, const Standard_Real EpsC1 = 0.001, const Standard_Real EpsC2 = 0.001, const Standard_Real EpsG1 = 0.001, const Standard_Real Percent = 0.01, const Standard_Real Maxlen = 10000);

		/****** LocalAnalysis_SurfaceContinuity::LocalAnalysis_SurfaceContinuity ******/
		/****** md5 signature: d678aa4faa824046fd87d3b8cd502a34 ******/
		%feature("compactdefaultargs") LocalAnalysis_SurfaceContinuity;
		%feature("autodoc", "
Parameters
----------
EpsNul: float (optional, default to 0.001)
EpsC0: float (optional, default to 0.001)
EpsC1: float (optional, default to 0.001)
EpsC2: float (optional, default to 0.001)
EpsG1: float (optional, default to 0.001)
Percent: float (optional, default to 0.01)
Maxlen: float (optional, default to 10000)

Return
-------
None

Description
-----------
This constructor is used when we want to compute many analysis. After we use the method ComputeAnalysis.
") LocalAnalysis_SurfaceContinuity;
		 LocalAnalysis_SurfaceContinuity(const Standard_Real EpsNul = 0.001, const Standard_Real EpsC0 = 0.001, const Standard_Real EpsC1 = 0.001, const Standard_Real EpsC2 = 0.001, const Standard_Real EpsG1 = 0.001, const Standard_Real Percent = 0.01, const Standard_Real Maxlen = 10000);

		/****** LocalAnalysis_SurfaceContinuity::C0Value ******/
		/****** md5 signature: 46447dbacb11e1eb2dbe14115e00dee1 ******/
		%feature("compactdefaultargs") C0Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") C0Value;
		Standard_Real C0Value();

		/****** LocalAnalysis_SurfaceContinuity::C1UAngle ******/
		/****** md5 signature: 54e9b7ee8ad7fca54bedd8ddf82fb87b ******/
		%feature("compactdefaultargs") C1UAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") C1UAngle;
		Standard_Real C1UAngle();

		/****** LocalAnalysis_SurfaceContinuity::C1URatio ******/
		/****** md5 signature: 9ffee9bff23c9c429f98dc1af9e97f4d ******/
		%feature("compactdefaultargs") C1URatio;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") C1URatio;
		Standard_Real C1URatio();

		/****** LocalAnalysis_SurfaceContinuity::C1VAngle ******/
		/****** md5 signature: c074021ecfd172eb36ebcd7fac61c2bf ******/
		%feature("compactdefaultargs") C1VAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") C1VAngle;
		Standard_Real C1VAngle();

		/****** LocalAnalysis_SurfaceContinuity::C1VRatio ******/
		/****** md5 signature: 47cb60056b58cdf09b782bce283bbf3b ******/
		%feature("compactdefaultargs") C1VRatio;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") C1VRatio;
		Standard_Real C1VRatio();

		/****** LocalAnalysis_SurfaceContinuity::C2UAngle ******/
		/****** md5 signature: 7fda7be0d183500c933dd5d9e9fa60e0 ******/
		%feature("compactdefaultargs") C2UAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") C2UAngle;
		Standard_Real C2UAngle();

		/****** LocalAnalysis_SurfaceContinuity::C2URatio ******/
		/****** md5 signature: 010c23977fcd204576f994d7b6f35d9d ******/
		%feature("compactdefaultargs") C2URatio;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") C2URatio;
		Standard_Real C2URatio();

		/****** LocalAnalysis_SurfaceContinuity::C2VAngle ******/
		/****** md5 signature: ee92f8d19e56a43577961190f81581ff ******/
		%feature("compactdefaultargs") C2VAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") C2VAngle;
		Standard_Real C2VAngle();

		/****** LocalAnalysis_SurfaceContinuity::C2VRatio ******/
		/****** md5 signature: 7f423d130b80a176ecb31400f6f4170d ******/
		%feature("compactdefaultargs") C2VRatio;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") C2VRatio;
		Standard_Real C2VRatio();

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
		/****** md5 signature: 514dc4ec8755ec550d58f20afe0d65e5 ******/
		%feature("compactdefaultargs") G1Angle;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") G1Angle;
		Standard_Real G1Angle();

		/****** LocalAnalysis_SurfaceContinuity::G2CurvatureGap ******/
		/****** md5 signature: 27133eacf2483170ca61aeea54260460 ******/
		%feature("compactdefaultargs") G2CurvatureGap;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") G2CurvatureGap;
		Standard_Real G2CurvatureGap();

		/****** LocalAnalysis_SurfaceContinuity::IsC0 ******/
		/****** md5 signature: a9c219b35c36d3fb15474a89d33aafef ******/
		%feature("compactdefaultargs") IsC0;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsC0;
		Standard_Boolean IsC0();

		/****** LocalAnalysis_SurfaceContinuity::IsC1 ******/
		/****** md5 signature: 6d355c55580dd93d6f235af07494f438 ******/
		%feature("compactdefaultargs") IsC1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsC1;
		Standard_Boolean IsC1();

		/****** LocalAnalysis_SurfaceContinuity::IsC2 ******/
		/****** md5 signature: a9641a88634e370fe83efb9e59bc30c3 ******/
		%feature("compactdefaultargs") IsC2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsC2;
		Standard_Boolean IsC2();

		/****** LocalAnalysis_SurfaceContinuity::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** LocalAnalysis_SurfaceContinuity::IsG1 ******/
		/****** md5 signature: 0f4f13bd2815462bc6621308cc24269a ******/
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsG1;
		Standard_Boolean IsG1();

		/****** LocalAnalysis_SurfaceContinuity::IsG2 ******/
		/****** md5 signature: 33a6bccf73c4fe3201add1f3a9e64150 ******/
		%feature("compactdefaultargs") IsG2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsG2;
		Standard_Boolean IsG2();

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
