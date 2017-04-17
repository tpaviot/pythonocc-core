/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") LocalAnalysis

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include LocalAnalysis_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum LocalAnalysis_StatusErrorType {
	LocalAnalysis_NullFirstDerivative = 0,
	LocalAnalysis_NullSecondDerivative = 1,
	LocalAnalysis_TangentNotDefined = 2,
	LocalAnalysis_NormalNotDefined = 3,
	LocalAnalysis_CurvatureNotDefined = 4,
};

/* end public enums declaration */

%rename(localanalysis) LocalAnalysis;
class LocalAnalysis {
	public:
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* This class compute s and gives tools to check the local continuity between two points situated on 2 curves) //! This fonction gives informations about a variable CurveContinuity

	:param surfconti:
	:type surfconti: LocalAnalysis_SurfaceContinuity &
	:param o:
	:type o: Standard_OStream &
	:rtype: void
") Dump;
		static void Dump (const LocalAnalysis_SurfaceContinuity & surfconti,Standard_OStream & o);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* This fonction gives informations about a variable SurfaceContinuity

	:param curvconti:
	:type curvconti: LocalAnalysis_CurveContinuity &
	:param o:
	:type o: Standard_OStream &
	:rtype: void
") Dump;
		static void Dump (const LocalAnalysis_CurveContinuity & curvconti,Standard_OStream & o);
};


%extend LocalAnalysis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LocalAnalysis_CurveContinuity;
class LocalAnalysis_CurveContinuity {
	public:
		%feature("compactdefaultargs") LocalAnalysis_CurveContinuity;
		%feature("autodoc", "	* -u1 is the parameter of the point on Curv1 -u2 is the parameter of the point on Curv2 -Order is the required continuity: GeomAbs_C0 GeomAbs_C1 GeomAbs_C2 GeomAbs_G1 GeomAbs_G2 //! -EpsNul is used to detect a a vector with nul magnitude (in mm) //! -EpsC0 is used for C0 continuity to confuse two points (in mm) //! -EpsC1 is an angular tolerance in radians used for C1 continuity to compare the angle between the first derivatives //! -EpsC2 is an angular tolerance in radians used for C2 continuity to compare the angle between the second derivatives //! -EpsG1 is an angular tolerance in radians used for G1 continuity to compare the angle between the tangents //! -EpsG2 is an angular tolerance in radians used for G2 continuity to compare the angle between the normals //! - percent : percentage of curvature variation (unitless) used for G2 continuity //! - Maxlen is the maximum length of Curv1 or Curv2 in meters used to detect nul curvature (in mm) //! the constructor computes the quantities which are necessary to check the continuity in the following cases: //! case C0 -------- - the distance between P1 and P2 with P1=Curv1 (u1) and P2=Curv2(u2) //! case C1 ------- //! - the angle between the first derivatives dCurv1(u1)  dCurv2(u2) -------- and --------- du  du //! - the ratio between the magnitudes of the first derivatives //! the angle value is between 0 and PI/2 //! case C2 ------- - the angle between the second derivatives 2  2 d Curv1(u1) d Curv2(u2) ---------- ---------- 2  2 du du //! the angle value is between 0 and PI/2 //! - the ratio between the magnitudes of the second derivatives //! case G1 ------- the angle between the tangents at each point //! the angle value is between 0 and PI/2 //! case G2 ------- -the angle between the normals at each point //! the angle value is between 0 and PI/2 //! - the relative variation of curvature: |curvat1-curvat2| ------------------ 1/2 (curvat1*curvat2) //! where curvat1 is the curvature at the first point and curvat2 the curvature at the second point

	:param Curv1:
	:type Curv1: Handle_Geom_Curve &
	:param u1:
	:type u1: float
	:param Curv2:
	:type Curv2: Handle_Geom_Curve &
	:param u2:
	:type u2: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param EpsNul: default value is 0.001
	:type EpsNul: float
	:param EpsC0: default value is 0.001
	:type EpsC0: float
	:param EpsC1: default value is 0.001
	:type EpsC1: float
	:param EpsC2: default value is 0.001
	:type EpsC2: float
	:param EpsG1: default value is 0.001
	:type EpsG1: float
	:param EpsG2: default value is 0.001
	:type EpsG2: float
	:param Percent: default value is 0.01
	:type Percent: float
	:param Maxlen: default value is 10000
	:type Maxlen: float
	:rtype: None
") LocalAnalysis_CurveContinuity;
		 LocalAnalysis_CurveContinuity (const Handle_Geom_Curve & Curv1,const Standard_Real u1,const Handle_Geom_Curve & Curv2,const Standard_Real u2,const GeomAbs_Shape Order,const Standard_Real EpsNul = 0.001,const Standard_Real EpsC0 = 0.001,const Standard_Real EpsC1 = 0.001,const Standard_Real EpsC2 = 0.001,const Standard_Real EpsG1 = 0.001,const Standard_Real EpsG2 = 0.001,const Standard_Real Percent = 0.01,const Standard_Real Maxlen = 10000);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") StatusError;
		%feature("autodoc", "	:rtype: LocalAnalysis_StatusErrorType
") StatusError;
		LocalAnalysis_StatusErrorType StatusError ();
		%feature("compactdefaultargs") ContinuityStatus;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") ContinuityStatus;
		GeomAbs_Shape ContinuityStatus ();
		%feature("compactdefaultargs") C0Value;
		%feature("autodoc", "	:rtype: float
") C0Value;
		Standard_Real C0Value ();
		%feature("compactdefaultargs") C1Angle;
		%feature("autodoc", "	:rtype: float
") C1Angle;
		Standard_Real C1Angle ();
		%feature("compactdefaultargs") C1Ratio;
		%feature("autodoc", "	:rtype: float
") C1Ratio;
		Standard_Real C1Ratio ();
		%feature("compactdefaultargs") C2Angle;
		%feature("autodoc", "	:rtype: float
") C2Angle;
		Standard_Real C2Angle ();
		%feature("compactdefaultargs") C2Ratio;
		%feature("autodoc", "	:rtype: float
") C2Ratio;
		Standard_Real C2Ratio ();
		%feature("compactdefaultargs") G1Angle;
		%feature("autodoc", "	:rtype: float
") G1Angle;
		Standard_Real G1Angle ();
		%feature("compactdefaultargs") G2Angle;
		%feature("autodoc", "	:rtype: float
") G2Angle;
		Standard_Real G2Angle ();
		%feature("compactdefaultargs") G2CurvatureVariation;
		%feature("autodoc", "	:rtype: float
") G2CurvatureVariation;
		Standard_Real G2CurvatureVariation ();
		%feature("compactdefaultargs") IsC0;
		%feature("autodoc", "	:rtype: bool
") IsC0;
		Standard_Boolean IsC0 ();
		%feature("compactdefaultargs") IsC1;
		%feature("autodoc", "	:rtype: bool
") IsC1;
		Standard_Boolean IsC1 ();
		%feature("compactdefaultargs") IsC2;
		%feature("autodoc", "	:rtype: bool
") IsC2;
		Standard_Boolean IsC2 ();
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "	:rtype: bool
") IsG1;
		Standard_Boolean IsG1 ();
		%feature("compactdefaultargs") IsG2;
		%feature("autodoc", "	:rtype: bool
") IsG2;
		Standard_Boolean IsG2 ();
};


%extend LocalAnalysis_CurveContinuity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor LocalAnalysis_SurfaceContinuity;
class LocalAnalysis_SurfaceContinuity {
	public:
		%feature("compactdefaultargs") LocalAnalysis_SurfaceContinuity;
		%feature("autodoc", "	* -u1,v1 are the parameters of the point on Surf1 -u2,v2 are the parameters of the point on Surf2 -Order is the required continuity: GeomAbs_C0 GeomAbs_C1 GeomAbs_C2 GeomAbs_G1 GeomAbs_G2 //! -EpsNul is used to detect a a vector with nul magnitude //! -EpsC0 is used for C0 continuity to confuse two points (in mm) //! -EpsC1 is an angular tolerance in radians used for C1 continuity to compare the angle between the first derivatives //! -EpsC2 is an angular tolerance in radians used for C2 continuity to compare the angle between the second derivatives //! -EpsG1 is an angular tolerance in radians used for G1 continuity to compare the angle between the normals //! -Percent : percentage of curvature variation (unitless) used for G2 continuity //! - Maxlen is the maximum length of Surf1 or Surf2 in meters used to detect null curvature (in mm) //! the constructor computes the quantities which are necessary to check the continuity in the following cases: //! case C0 -------- - the distance between P1 and P2 with P1=Surf (u1,v1) and P2=Surfv2(u2,v2) //! case C1 ------- //! - the angle between the first derivatives in u : //! dSurf1(u1,v1) dSurf2(u2,v2) ----------- and --------- du  du //! the angle value is between 0 and PI/2 //! - the angle between the first derivatives in v : //! dSurf1(u1,v1) dSurf2(u2,v2) -------- and --------- dv  dv //! - the ratio between the magnitudes of the first derivatives in u - the ratio between the magnitudes of the first derivatives in v //! the angle value is between 0 and pi/2 //! case C2 ------- - the angle between the second derivatives in u 2 2 d Surf1(u1,v1) d Surf2(u2,v2) ---------- ---------- 2 2 d u d u //! - the ratio between the magnitudes of the second derivatives in u - the ratio between the magnitudes of the second derivatives in v //! the angle value is between 0 and PI/2 //! case G1 ------- -the angle between the normals at each point the angle value is between 0 and PI/2 //! case G2 ------- - the maximum normal curvature gap between the two points

	:param Surf1:
	:type Surf1: Handle_Geom_Surface &
	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param Surf2:
	:type Surf2: Handle_Geom_Surface &
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param EpsNul: default value is 0.001
	:type EpsNul: float
	:param EpsC0: default value is 0.001
	:type EpsC0: float
	:param EpsC1: default value is 0.001
	:type EpsC1: float
	:param EpsC2: default value is 0.001
	:type EpsC2: float
	:param EpsG1: default value is 0.001
	:type EpsG1: float
	:param Percent: default value is 0.01
	:type Percent: float
	:param Maxlen: default value is 10000
	:type Maxlen: float
	:rtype: None
") LocalAnalysis_SurfaceContinuity;
		 LocalAnalysis_SurfaceContinuity (const Handle_Geom_Surface & Surf1,const Standard_Real u1,const Standard_Real v1,const Handle_Geom_Surface & Surf2,const Standard_Real u2,const Standard_Real v2,const GeomAbs_Shape Order,const Standard_Real EpsNul = 0.001,const Standard_Real EpsC0 = 0.001,const Standard_Real EpsC1 = 0.001,const Standard_Real EpsC2 = 0.001,const Standard_Real EpsG1 = 0.001,const Standard_Real Percent = 0.01,const Standard_Real Maxlen = 10000);
		%feature("compactdefaultargs") LocalAnalysis_SurfaceContinuity;
		%feature("autodoc", "	:param curv1:
	:type curv1: Handle_Geom2d_Curve &
	:param curv2:
	:type curv2: Handle_Geom2d_Curve &
	:param U:
	:type U: float
	:param Surf1:
	:type Surf1: Handle_Geom_Surface &
	:param Surf2:
	:type Surf2: Handle_Geom_Surface &
	:param Order:
	:type Order: GeomAbs_Shape
	:param EpsNul: default value is 0.001
	:type EpsNul: float
	:param EpsC0: default value is 0.001
	:type EpsC0: float
	:param EpsC1: default value is 0.001
	:type EpsC1: float
	:param EpsC2: default value is 0.001
	:type EpsC2: float
	:param EpsG1: default value is 0.001
	:type EpsG1: float
	:param Percent: default value is 0.01
	:type Percent: float
	:param Maxlen: default value is 10000
	:type Maxlen: float
	:rtype: None
") LocalAnalysis_SurfaceContinuity;
		 LocalAnalysis_SurfaceContinuity (const Handle_Geom2d_Curve & curv1,const Handle_Geom2d_Curve & curv2,const Standard_Real U,const Handle_Geom_Surface & Surf1,const Handle_Geom_Surface & Surf2,const GeomAbs_Shape Order,const Standard_Real EpsNul = 0.001,const Standard_Real EpsC0 = 0.001,const Standard_Real EpsC1 = 0.001,const Standard_Real EpsC2 = 0.001,const Standard_Real EpsG1 = 0.001,const Standard_Real Percent = 0.01,const Standard_Real Maxlen = 10000);
		%feature("compactdefaultargs") LocalAnalysis_SurfaceContinuity;
		%feature("autodoc", "	* This constructor is used when we want to compute many analysis. After we use the method ComputeAnalysis

	:param EpsNul: default value is 0.001
	:type EpsNul: float
	:param EpsC0: default value is 0.001
	:type EpsC0: float
	:param EpsC1: default value is 0.001
	:type EpsC1: float
	:param EpsC2: default value is 0.001
	:type EpsC2: float
	:param EpsG1: default value is 0.001
	:type EpsG1: float
	:param Percent: default value is 0.01
	:type Percent: float
	:param Maxlen: default value is 10000
	:type Maxlen: float
	:rtype: None
") LocalAnalysis_SurfaceContinuity;
		 LocalAnalysis_SurfaceContinuity (const Standard_Real EpsNul = 0.001,const Standard_Real EpsC0 = 0.001,const Standard_Real EpsC1 = 0.001,const Standard_Real EpsC2 = 0.001,const Standard_Real EpsG1 = 0.001,const Standard_Real Percent = 0.01,const Standard_Real Maxlen = 10000);
		%feature("compactdefaultargs") ComputeAnalysis;
		%feature("autodoc", "	:param Surf1:
	:type Surf1: GeomLProp_SLProps &
	:param Surf2:
	:type Surf2: GeomLProp_SLProps &
	:param Order:
	:type Order: GeomAbs_Shape
	:rtype: None
") ComputeAnalysis;
		void ComputeAnalysis (GeomLProp_SLProps & Surf1,GeomLProp_SLProps & Surf2,const GeomAbs_Shape Order);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") ContinuityStatus;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") ContinuityStatus;
		GeomAbs_Shape ContinuityStatus ();
		%feature("compactdefaultargs") StatusError;
		%feature("autodoc", "	:rtype: LocalAnalysis_StatusErrorType
") StatusError;
		LocalAnalysis_StatusErrorType StatusError ();
		%feature("compactdefaultargs") C0Value;
		%feature("autodoc", "	:rtype: float
") C0Value;
		Standard_Real C0Value ();
		%feature("compactdefaultargs") C1UAngle;
		%feature("autodoc", "	:rtype: float
") C1UAngle;
		Standard_Real C1UAngle ();
		%feature("compactdefaultargs") C1URatio;
		%feature("autodoc", "	:rtype: float
") C1URatio;
		Standard_Real C1URatio ();
		%feature("compactdefaultargs") C1VAngle;
		%feature("autodoc", "	:rtype: float
") C1VAngle;
		Standard_Real C1VAngle ();
		%feature("compactdefaultargs") C1VRatio;
		%feature("autodoc", "	:rtype: float
") C1VRatio;
		Standard_Real C1VRatio ();
		%feature("compactdefaultargs") C2UAngle;
		%feature("autodoc", "	:rtype: float
") C2UAngle;
		Standard_Real C2UAngle ();
		%feature("compactdefaultargs") C2URatio;
		%feature("autodoc", "	:rtype: float
") C2URatio;
		Standard_Real C2URatio ();
		%feature("compactdefaultargs") C2VAngle;
		%feature("autodoc", "	:rtype: float
") C2VAngle;
		Standard_Real C2VAngle ();
		%feature("compactdefaultargs") C2VRatio;
		%feature("autodoc", "	:rtype: float
") C2VRatio;
		Standard_Real C2VRatio ();
		%feature("compactdefaultargs") G1Angle;
		%feature("autodoc", "	:rtype: float
") G1Angle;
		Standard_Real G1Angle ();
		%feature("compactdefaultargs") G2CurvatureGap;
		%feature("autodoc", "	:rtype: float
") G2CurvatureGap;
		Standard_Real G2CurvatureGap ();
		%feature("compactdefaultargs") IsC0;
		%feature("autodoc", "	:rtype: bool
") IsC0;
		Standard_Boolean IsC0 ();
		%feature("compactdefaultargs") IsC1;
		%feature("autodoc", "	:rtype: bool
") IsC1;
		Standard_Boolean IsC1 ();
		%feature("compactdefaultargs") IsC2;
		%feature("autodoc", "	:rtype: bool
") IsC2;
		Standard_Boolean IsC2 ();
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "	:rtype: bool
") IsG1;
		Standard_Boolean IsG1 ();
		%feature("compactdefaultargs") IsG2;
		%feature("autodoc", "	:rtype: bool
") IsG2;
		Standard_Boolean IsG2 ();
};


%extend LocalAnalysis_SurfaceContinuity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
