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
%define LOCALANALYSISDOCSTRING
"LocalAnalysis module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_localanalysis.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
%pythoncode {

class LocalAnalysis_StatusErrorType:
	LocalAnalysis_NullFirstDerivative = 0
	LocalAnalysis_NullSecondDerivative = 1
	LocalAnalysis_TangentNotDefined = 2
	LocalAnalysis_NormalNotDefined = 3
	LocalAnalysis_CurvatureNotDefined = 4
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
		/****************** LocalAnalysis_CurveContinuity ******************/
		%feature("compactdefaultargs") LocalAnalysis_CurveContinuity;
		%feature("autodoc", "-u1 is the parameter of the point on curv1 -u2 is the parameter of the point on curv2 -order is the required continuity: geomabs_c0 geomabs_c1 geomabs_c2 geomabs_g1 geomabs_g2 //! -epsnul is used to detect a a vector with nul magnitude (in mm) //! -epsc0 is used for c0 continuity to confuse two points (in mm) //! -epsc1 is an angular tolerance in radians used for c1 continuity to compare the angle between the first derivatives //! -epsc2 is an angular tolerance in radians used for c2 continuity to compare the angle between the second derivatives //! -epsg1 is an angular tolerance in radians used for g1 continuity to compare the angle between the tangents //! -epsg2 is an angular tolerance in radians used for g2 continuity to compare the angle between the normals //! - percent : percentage of curvature variation (unitless) used for g2 continuity //! - maxlen is the maximum length of curv1 or curv2 in meters used to detect nul curvature (in mm) //! the constructor computes the quantities which are necessary to check the continuity in the following cases: //! case c0 -------- - the distance between p1 and p2 with p1=curv1 (u1) and p2=curv2(u2) //! case c1 ------- //! - the angle between the first derivatives dcurv1(u1)  dcurv2(u2) -------- and --------- du  du //! - the ratio between the magnitudes of the first derivatives //! the angle value is between 0 and pi/2 //! case c2 ------- - the angle between the second derivatives 2  2 d curv1(u1) d curv2(u2) ---------- ---------- 2  2 du du //! the angle value is between 0 and pi/2 //! - the ratio between the magnitudes of the second derivatives //! case g1 ------- the angle between the tangents at each point //! the angle value is between 0 and pi/2 //! case g2 ------- -the angle between the normals at each point //! the angle value is between 0 and pi/2 //! - the relative variation of curvature: |curvat1-curvat2| ------------------ 1/2 (curvat1*curvat2) //! where curvat1 is the curvature at the first point and curvat2 the curvature at the second point.

Parameters
----------
Curv1: Geom_Curve
u1: float
Curv2: Geom_Curve
u2: float
Order: GeomAbs_Shape
EpsNul: float,optional
	default value is 0.001
EpsC0: float,optional
	default value is 0.001
EpsC1: float,optional
	default value is 0.001
EpsC2: float,optional
	default value is 0.001
EpsG1: float,optional
	default value is 0.001
EpsG2: float,optional
	default value is 0.001
Percent: float,optional
	default value is 0.01
Maxlen: float,optional
	default value is 10000

Returns
-------
None
") LocalAnalysis_CurveContinuity;
		 LocalAnalysis_CurveContinuity(const opencascade::handle<Geom_Curve> & Curv1, const Standard_Real u1, const opencascade::handle<Geom_Curve> & Curv2, const Standard_Real u2, const GeomAbs_Shape Order, const Standard_Real EpsNul = 0.001, const Standard_Real EpsC0 = 0.001, const Standard_Real EpsC1 = 0.001, const Standard_Real EpsC2 = 0.001, const Standard_Real EpsG1 = 0.001, const Standard_Real EpsG2 = 0.001, const Standard_Real Percent = 0.01, const Standard_Real Maxlen = 10000);

		/****************** C0Value ******************/
		%feature("compactdefaultargs") C0Value;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") C0Value;
		Standard_Real C0Value();

		/****************** C1Angle ******************/
		%feature("compactdefaultargs") C1Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") C1Angle;
		Standard_Real C1Angle();

		/****************** C1Ratio ******************/
		%feature("compactdefaultargs") C1Ratio;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") C1Ratio;
		Standard_Real C1Ratio();

		/****************** C2Angle ******************/
		%feature("compactdefaultargs") C2Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") C2Angle;
		Standard_Real C2Angle();

		/****************** C2Ratio ******************/
		%feature("compactdefaultargs") C2Ratio;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") C2Ratio;
		Standard_Real C2Ratio();

		/****************** ContinuityStatus ******************/
		%feature("compactdefaultargs") ContinuityStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") ContinuityStatus;
		GeomAbs_Shape ContinuityStatus();

		/****************** G1Angle ******************/
		%feature("compactdefaultargs") G1Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") G1Angle;
		Standard_Real G1Angle();

		/****************** G2Angle ******************/
		%feature("compactdefaultargs") G2Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") G2Angle;
		Standard_Real G2Angle();

		/****************** G2CurvatureVariation ******************/
		%feature("compactdefaultargs") G2CurvatureVariation;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") G2CurvatureVariation;
		Standard_Real G2CurvatureVariation();

		/****************** IsC0 ******************/
		%feature("compactdefaultargs") IsC0;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsC0;
		Standard_Boolean IsC0();

		/****************** IsC1 ******************/
		%feature("compactdefaultargs") IsC1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsC1;
		Standard_Boolean IsC1();

		/****************** IsC2 ******************/
		%feature("compactdefaultargs") IsC2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsC2;
		Standard_Boolean IsC2();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsG1 ******************/
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsG1;
		Standard_Boolean IsG1();

		/****************** IsG2 ******************/
		%feature("compactdefaultargs") IsG2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsG2;
		Standard_Boolean IsG2();

		/****************** StatusError ******************/
		%feature("compactdefaultargs") StatusError;
		%feature("autodoc", "No available documentation.

Returns
-------
LocalAnalysis_StatusErrorType
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
		/****************** LocalAnalysis_SurfaceContinuity ******************/
		%feature("compactdefaultargs") LocalAnalysis_SurfaceContinuity;
		%feature("autodoc", "-u1,v1 are the parameters of the point on surf1 -u2,v2 are the parameters of the point on surf2 -order is the required continuity: geomabs_c0 geomabs_c1 geomabs_c2 geomabs_g1 geomabs_g2 //! -epsnul is used to detect a a vector with nul magnitude //! -epsc0 is used for c0 continuity to confuse two points (in mm) //! -epsc1 is an angular tolerance in radians used for c1 continuity to compare the angle between the first derivatives //! -epsc2 is an angular tolerance in radians used for c2 continuity to compare the angle between the second derivatives //! -epsg1 is an angular tolerance in radians used for g1 continuity to compare the angle between the normals //! -percent : percentage of curvature variation (unitless) used for g2 continuity //! - maxlen is the maximum length of surf1 or surf2 in meters used to detect null curvature (in mm) //! the constructor computes the quantities which are necessary to check the continuity in the following cases: //! case c0 -------- - the distance between p1 and p2 with p1=surf (u1,v1) and p2=surfv2(u2,v2) //! case c1 ------- //! - the angle between the first derivatives in u : //! dsurf1(u1,v1) dsurf2(u2,v2) ----------- and --------- du  du //! the angle value is between 0 and pi/2 //! - the angle between the first derivatives in v : //! dsurf1(u1,v1) dsurf2(u2,v2) -------- and --------- dv  dv //! - the ratio between the magnitudes of the first derivatives in u - the ratio between the magnitudes of the first derivatives in v //! the angle value is between 0 and pi/2 //! case c2 ------- - the angle between the second derivatives in u 2 2 d surf1(u1,v1) d surf2(u2,v2) ---------- ---------- 2 2 d u d u //! - the ratio between the magnitudes of the second derivatives in u - the ratio between the magnitudes of the second derivatives in v //! the angle value is between 0 and pi/2 //! case g1 ------- -the angle between the normals at each point the angle value is between 0 and pi/2 //! case g2 ------- - the maximum normal curvature gap between the two points.

Parameters
----------
Surf1: Geom_Surface
u1: float
v1: float
Surf2: Geom_Surface
u2: float
v2: float
Order: GeomAbs_Shape
EpsNul: float,optional
	default value is 0.001
EpsC0: float,optional
	default value is 0.001
EpsC1: float,optional
	default value is 0.001
EpsC2: float,optional
	default value is 0.001
EpsG1: float,optional
	default value is 0.001
Percent: float,optional
	default value is 0.01
Maxlen: float,optional
	default value is 10000

Returns
-------
None
") LocalAnalysis_SurfaceContinuity;
		 LocalAnalysis_SurfaceContinuity(const opencascade::handle<Geom_Surface> & Surf1, const Standard_Real u1, const Standard_Real v1, const opencascade::handle<Geom_Surface> & Surf2, const Standard_Real u2, const Standard_Real v2, const GeomAbs_Shape Order, const Standard_Real EpsNul = 0.001, const Standard_Real EpsC0 = 0.001, const Standard_Real EpsC1 = 0.001, const Standard_Real EpsC2 = 0.001, const Standard_Real EpsG1 = 0.001, const Standard_Real Percent = 0.01, const Standard_Real Maxlen = 10000);

		/****************** LocalAnalysis_SurfaceContinuity ******************/
		%feature("compactdefaultargs") LocalAnalysis_SurfaceContinuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
curv1: Geom2d_Curve
curv2: Geom2d_Curve
U: float
Surf1: Geom_Surface
Surf2: Geom_Surface
Order: GeomAbs_Shape
EpsNul: float,optional
	default value is 0.001
EpsC0: float,optional
	default value is 0.001
EpsC1: float,optional
	default value is 0.001
EpsC2: float,optional
	default value is 0.001
EpsG1: float,optional
	default value is 0.001
Percent: float,optional
	default value is 0.01
Maxlen: float,optional
	default value is 10000

Returns
-------
None
") LocalAnalysis_SurfaceContinuity;
		 LocalAnalysis_SurfaceContinuity(const opencascade::handle<Geom2d_Curve> & curv1, const opencascade::handle<Geom2d_Curve> & curv2, const Standard_Real U, const opencascade::handle<Geom_Surface> & Surf1, const opencascade::handle<Geom_Surface> & Surf2, const GeomAbs_Shape Order, const Standard_Real EpsNul = 0.001, const Standard_Real EpsC0 = 0.001, const Standard_Real EpsC1 = 0.001, const Standard_Real EpsC2 = 0.001, const Standard_Real EpsG1 = 0.001, const Standard_Real Percent = 0.01, const Standard_Real Maxlen = 10000);

		/****************** LocalAnalysis_SurfaceContinuity ******************/
		%feature("compactdefaultargs") LocalAnalysis_SurfaceContinuity;
		%feature("autodoc", "This constructor is used when we want to compute many analysis. after we use the method computeanalysis.

Parameters
----------
EpsNul: float,optional
	default value is 0.001
EpsC0: float,optional
	default value is 0.001
EpsC1: float,optional
	default value is 0.001
EpsC2: float,optional
	default value is 0.001
EpsG1: float,optional
	default value is 0.001
Percent: float,optional
	default value is 0.01
Maxlen: float,optional
	default value is 10000

Returns
-------
None
") LocalAnalysis_SurfaceContinuity;
		 LocalAnalysis_SurfaceContinuity(const Standard_Real EpsNul = 0.001, const Standard_Real EpsC0 = 0.001, const Standard_Real EpsC1 = 0.001, const Standard_Real EpsC2 = 0.001, const Standard_Real EpsG1 = 0.001, const Standard_Real Percent = 0.01, const Standard_Real Maxlen = 10000);

		/****************** C0Value ******************/
		%feature("compactdefaultargs") C0Value;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") C0Value;
		Standard_Real C0Value();

		/****************** C1UAngle ******************/
		%feature("compactdefaultargs") C1UAngle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") C1UAngle;
		Standard_Real C1UAngle();

		/****************** C1URatio ******************/
		%feature("compactdefaultargs") C1URatio;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") C1URatio;
		Standard_Real C1URatio();

		/****************** C1VAngle ******************/
		%feature("compactdefaultargs") C1VAngle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") C1VAngle;
		Standard_Real C1VAngle();

		/****************** C1VRatio ******************/
		%feature("compactdefaultargs") C1VRatio;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") C1VRatio;
		Standard_Real C1VRatio();

		/****************** C2UAngle ******************/
		%feature("compactdefaultargs") C2UAngle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") C2UAngle;
		Standard_Real C2UAngle();

		/****************** C2URatio ******************/
		%feature("compactdefaultargs") C2URatio;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") C2URatio;
		Standard_Real C2URatio();

		/****************** C2VAngle ******************/
		%feature("compactdefaultargs") C2VAngle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") C2VAngle;
		Standard_Real C2VAngle();

		/****************** C2VRatio ******************/
		%feature("compactdefaultargs") C2VRatio;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") C2VRatio;
		Standard_Real C2VRatio();

		/****************** ComputeAnalysis ******************/
		%feature("compactdefaultargs") ComputeAnalysis;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf1: GeomLProp_SLProps
Surf2: GeomLProp_SLProps
Order: GeomAbs_Shape

Returns
-------
None
") ComputeAnalysis;
		void ComputeAnalysis(GeomLProp_SLProps & Surf1, GeomLProp_SLProps & Surf2, const GeomAbs_Shape Order);

		/****************** ContinuityStatus ******************/
		%feature("compactdefaultargs") ContinuityStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") ContinuityStatus;
		GeomAbs_Shape ContinuityStatus();

		/****************** G1Angle ******************/
		%feature("compactdefaultargs") G1Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") G1Angle;
		Standard_Real G1Angle();

		/****************** G2CurvatureGap ******************/
		%feature("compactdefaultargs") G2CurvatureGap;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") G2CurvatureGap;
		Standard_Real G2CurvatureGap();

		/****************** IsC0 ******************/
		%feature("compactdefaultargs") IsC0;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsC0;
		Standard_Boolean IsC0();

		/****************** IsC1 ******************/
		%feature("compactdefaultargs") IsC1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsC1;
		Standard_Boolean IsC1();

		/****************** IsC2 ******************/
		%feature("compactdefaultargs") IsC2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsC2;
		Standard_Boolean IsC2();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsG1 ******************/
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsG1;
		Standard_Boolean IsG1();

		/****************** IsG2 ******************/
		%feature("compactdefaultargs") IsG2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsG2;
		Standard_Boolean IsG2();

		/****************** StatusError ******************/
		%feature("compactdefaultargs") StatusError;
		%feature("autodoc", "No available documentation.

Returns
-------
LocalAnalysis_StatusErrorType
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
