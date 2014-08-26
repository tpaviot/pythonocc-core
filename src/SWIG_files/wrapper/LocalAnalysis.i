/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module LocalAnalysis

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include LocalAnalysis_required_python_modules.i
%include LocalAnalysis_headers.i

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
%nodefaultctor LocalAnalysis;
class LocalAnalysis {
	public:
		%feature("autodoc", "Args:
	surfconti(LocalAnalysis_SurfaceContinuity)
	o(Standard_OStream)

Returns:
	static void

This  class  compute  
s  and gives  tools to check  the  local  
continuity  between two points situated  on 2  curves)  
This fonction gives informations  about a  variable CurveContinuity") Dump;
		static void Dump (const LocalAnalysis_SurfaceContinuity & surfconti,Standard_OStream & o);
		%feature("autodoc", "Args:
	curvconti(LocalAnalysis_CurveContinuity)
	o(Standard_OStream)

Returns:
	static void

This fonction gives informations  about a variable SurfaceContinuity") Dump;
		static void Dump (const LocalAnalysis_CurveContinuity & curvconti,Standard_OStream & o);
};


%feature("shadow") LocalAnalysis::~LocalAnalysis %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocalAnalysis {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocalAnalysis_CurveContinuity;
class LocalAnalysis_CurveContinuity {
	public:
		%feature("autodoc", "Args:
	Curv1(Handle_Geom_Curve)
	u1(Standard_Real)
	Curv2(Handle_Geom_Curve)
	u2(Standard_Real)
	Order(GeomAbs_Shape)
	EpsNul(Standard_Real)=0.001
	EpsC0(Standard_Real)=0.001
	EpsC1(Standard_Real)=0.001
	EpsC2(Standard_Real)=0.001
	EpsG1(Standard_Real)=0.001
	EpsG2(Standard_Real)=0.001
	Percent(Standard_Real)=0.01
	Maxlen(Standard_Real)=10000

Returns:
	None

-u1 is the parameter of the point on Curv1  
          -u2 is the  parameter of the point on  Curv2  
          -Order is the required continuity:  
           GeomAbs_C0    GeomAbs_C1  GeomAbs_C2  
           GeomAbs_G1 GeomAbs_G2  
 
          -EpsNul  is  used to  detect a  a vector with nul  
          magnitude (in mm)  
 
          -EpsC0 is used for C0  continuity to confuse two  
           points (in mm)  
 
          -EpsC1 is  an angular  tolerance in radians  used  
           for C1 continuity  to compare the angle between  
           the first derivatives  
 
          -EpsC2 is an   angular tolerance in radians  used  
          for C2  continuity to  compare the angle  between  
          the second derivatives  
 
          -EpsG1 is an  angular  tolerance in radians  used  
          for G1  continuity to compare  the angle  between  
          the tangents  
 
          -EpsG2 is  an angular  tolerance in radians  used  
          for  G2 continuity to  compare  the angle between  
          the normals  
 
          - percent  : percentage of  curvature variation (unitless)  
          used for G2 continuity  
 
          - Maxlen is the maximum length of Curv1 or Curv2 in  
          meters used to detect nul curvature (in mm)  
 
 
 
 
         the constructor computes the quantities  which are  
         necessary to check the continuity in the following cases:  
 
          case  C0  
          --------  
          - the distance between P1 and P2  with P1=Curv1 (u1)  and  
          P2=Curv2(u2)  
 
          case C1  
          -------  
 
          - the angle  between  the first derivatives  
            dCurv1(u1)           dCurv2(u2)  
            --------     and     ---------  
            du                   du  
 
          - the ratio   between  the magnitudes  of the first  
            derivatives  
 
           the angle value is between 0 and PI/2  
 
          case  C2  
          -------  
          - the angle  between the second derivatives  
            2                   2  
           d  Curv1(u1)       d Curv2(u2)  
           ----------        ----------  
            2                   2  
           du                  du  
 
           the angle value is between 0 and PI/2  
 
          - the ratio between the magnitudes of  the second  
            derivatives  
 
          case G1  
          -------  
          the angle between  the tangents at each point  
 
          the angle value is between 0 and PI/2  
 
          case G2  
          -------  
          -the angle between the normals at each point  
 
           the angle value is between 0 and PI/2  
 
          - the relative variation of curvature:  
           |curvat1-curvat2|  
           ------------------  
                             1/2  
           (curvat1*curvat2)  
 
            where curvat1 is the curvature at the first point  
             and curvat2 the curvature at the second point") LocalAnalysis_CurveContinuity;
		 LocalAnalysis_CurveContinuity (const Handle_Geom_Curve & Curv1,const Standard_Real u1,const Handle_Geom_Curve & Curv2,const Standard_Real u2,const GeomAbs_Shape Order,const Standard_Real EpsNul = 0.001,const Standard_Real EpsC0 = 0.001,const Standard_Real EpsC1 = 0.001,const Standard_Real EpsC2 = 0.001,const Standard_Real EpsG1 = 0.001,const Standard_Real EpsG2 = 0.001,const Standard_Real Percent = 0.01,const Standard_Real Maxlen = 10000);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	LocalAnalysis_StatusErrorType

No detailed docstring for this function.") StatusError;
		LocalAnalysis_StatusErrorType StatusError ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") ContinuityStatus;
		GeomAbs_Shape ContinuityStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") C0Value;
		Standard_Real C0Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") C1Angle;
		Standard_Real C1Angle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") C1Ratio;
		Standard_Real C1Ratio ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") C2Angle;
		Standard_Real C2Angle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") C2Ratio;
		Standard_Real C2Ratio ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") G1Angle;
		Standard_Real G1Angle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") G2Angle;
		Standard_Real G2Angle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") G2CurvatureVariation;
		Standard_Real G2CurvatureVariation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsC0;
		Standard_Boolean IsC0 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsC1;
		Standard_Boolean IsC1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsC2;
		Standard_Boolean IsC2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsG1;
		Standard_Boolean IsG1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsG2;
		Standard_Boolean IsG2 ();
};


%feature("shadow") LocalAnalysis_CurveContinuity::~LocalAnalysis_CurveContinuity %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocalAnalysis_CurveContinuity {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocalAnalysis_SurfaceContinuity;
class LocalAnalysis_SurfaceContinuity {
	public:
		%feature("autodoc", "Args:
	Surf1(Handle_Geom_Surface)
	u1(Standard_Real)
	v1(Standard_Real)
	Surf2(Handle_Geom_Surface)
	u2(Standard_Real)
	v2(Standard_Real)
	Order(GeomAbs_Shape)
	EpsNul(Standard_Real)=0.001
	EpsC0(Standard_Real)=0.001
	EpsC1(Standard_Real)=0.001
	EpsC2(Standard_Real)=0.001
	EpsG1(Standard_Real)=0.001
	Percent(Standard_Real)=0.01
	Maxlen(Standard_Real)=10000

Returns:
	None

-u1,v1 are  the parameters of the point on Surf1  
          -u2,v2  are  the  parameters of the point on Surf2  
          -Order  is the required continuity:  
           GeomAbs_C0    GeomAbs_C1  GeomAbs_C2  
           GeomAbs_G1 GeomAbs_G2  
 
          -EpsNul  is  used to  detect a  a vector with nul  
          magnitude  
 
          -EpsC0 is used for C0  continuity to confuse two  
           points (in mm)  
 
          -EpsC1 is  an angular  tolerance in radians  used  
           for C1 continuity  to compare the angle between  
           the first derivatives  
 
          -EpsC2 is an   angular tolerance in radians  used  
          for C2  continuity to  compare the angle  between  
          the second derivatives  
 
          -EpsG1 is an  angular  tolerance in radians  used  
          for G1  continuity to compare  the angle  between  
          the  normals  
 
 
          -Percent  : percentage of  curvature variation (unitless)  
          used for G2 continuity  
 
          - Maxlen is the maximum length of Surf1 or Surf2  in  
          meters used to detect null curvature (in mm)  
 
 
 
          the constructor computes the quantities  which are  
          necessary to check the continuity in the following cases:  
 
          case  C0  
          --------  
          - the distance between P1 and P2  with P1=Surf (u1,v1)  and  
          P2=Surfv2(u2,v2)  
 
 
          case C1  
          -------  
 
          - the angle between the first derivatives in u :  
 
            dSurf1(u1,v1)               dSurf2(u2,v2)  
            -----------      and        ---------  
            du                           du  
 
            the angle value is between 0 and PI/2  
 
          - the angle between the first derivatives in v :  
 
            dSurf1(u1,v1)               dSurf2(u2,v2)  
            --------         and         ---------  
            dv                           dv  
 
          - the ratio between  the magnitudes of  the first derivatives  in  u  
          - the  ratio  between  the magnitudes of the first derivatives in v  
 
            the angle value is between  0 and pi/2  
 
          case  C2  
          -------  
          - the  angle  between the second derivatives in u  
               2                  2  
              d Surf1(u1,v1)    d  Surf2(u2,v2)  
              ----------        ----------  
               2                  2  
              d u               d  u  
 
         - the ratio between the  magnitudes of the second derivatives in  u  
         - the  ratio between the  magnitudes of the  second derivatives in v  
 
           the angle value is between 0 and PI/2  
 
          case G1  
          -------  
          -the angle between  the normals  at each point  
          the angle value is between 0 and PI/2  
 
          case  G2  
          -------  
          - the maximum  normal curvature gap between the two  
          points") LocalAnalysis_SurfaceContinuity;
		 LocalAnalysis_SurfaceContinuity (const Handle_Geom_Surface & Surf1,const Standard_Real u1,const Standard_Real v1,const Handle_Geom_Surface & Surf2,const Standard_Real u2,const Standard_Real v2,const GeomAbs_Shape Order,const Standard_Real EpsNul = 0.001,const Standard_Real EpsC0 = 0.001,const Standard_Real EpsC1 = 0.001,const Standard_Real EpsC2 = 0.001,const Standard_Real EpsG1 = 0.001,const Standard_Real Percent = 0.01,const Standard_Real Maxlen = 10000);
		%feature("autodoc", "Args:
	curv1(Handle_Geom2d_Curve)
	curv2(Handle_Geom2d_Curve)
	U(Standard_Real)
	Surf1(Handle_Geom_Surface)
	Surf2(Handle_Geom_Surface)
	Order(GeomAbs_Shape)
	EpsNul(Standard_Real)=0.001
	EpsC0(Standard_Real)=0.001
	EpsC1(Standard_Real)=0.001
	EpsC2(Standard_Real)=0.001
	EpsG1(Standard_Real)=0.001
	Percent(Standard_Real)=0.01
	Maxlen(Standard_Real)=10000

Returns:
	None

No detailed docstring for this function.") LocalAnalysis_SurfaceContinuity;
		 LocalAnalysis_SurfaceContinuity (const Handle_Geom2d_Curve & curv1,const Handle_Geom2d_Curve & curv2,const Standard_Real U,const Handle_Geom_Surface & Surf1,const Handle_Geom_Surface & Surf2,const GeomAbs_Shape Order,const Standard_Real EpsNul = 0.001,const Standard_Real EpsC0 = 0.001,const Standard_Real EpsC1 = 0.001,const Standard_Real EpsC2 = 0.001,const Standard_Real EpsG1 = 0.001,const Standard_Real Percent = 0.01,const Standard_Real Maxlen = 10000);
		%feature("autodoc", "Args:
	EpsNul(Standard_Real)=0.001
	EpsC0(Standard_Real)=0.001
	EpsC1(Standard_Real)=0.001
	EpsC2(Standard_Real)=0.001
	EpsG1(Standard_Real)=0.001
	Percent(Standard_Real)=0.01
	Maxlen(Standard_Real)=10000

Returns:
	None

This  constructor  is  used  when  we  want  to compute  many  analysis.  
After  we  use  the  method  ComputeAnalysis") LocalAnalysis_SurfaceContinuity;
		 LocalAnalysis_SurfaceContinuity (const Standard_Real EpsNul = 0.001,const Standard_Real EpsC0 = 0.001,const Standard_Real EpsC1 = 0.001,const Standard_Real EpsC2 = 0.001,const Standard_Real EpsG1 = 0.001,const Standard_Real Percent = 0.01,const Standard_Real Maxlen = 10000);
		%feature("autodoc", "Args:
	Surf1(GeomLProp_SLProps)
	Surf2(GeomLProp_SLProps)
	Order(GeomAbs_Shape)

Returns:
	None

No detailed docstring for this function.") ComputeAnalysis;
		void ComputeAnalysis (GeomLProp_SLProps & Surf1,GeomLProp_SLProps & Surf2,const GeomAbs_Shape Order);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") ContinuityStatus;
		GeomAbs_Shape ContinuityStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	LocalAnalysis_StatusErrorType

No detailed docstring for this function.") StatusError;
		LocalAnalysis_StatusErrorType StatusError ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") C0Value;
		Standard_Real C0Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") C1UAngle;
		Standard_Real C1UAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") C1URatio;
		Standard_Real C1URatio ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") C1VAngle;
		Standard_Real C1VAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") C1VRatio;
		Standard_Real C1VRatio ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") C2UAngle;
		Standard_Real C2UAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") C2URatio;
		Standard_Real C2URatio ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") C2VAngle;
		Standard_Real C2VAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") C2VRatio;
		Standard_Real C2VRatio ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") G1Angle;
		Standard_Real G1Angle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") G2CurvatureGap;
		Standard_Real G2CurvatureGap ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsC0;
		Standard_Boolean IsC0 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsC1;
		Standard_Boolean IsC1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsC2;
		Standard_Boolean IsC2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsG1;
		Standard_Boolean IsG1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsG2;
		Standard_Boolean IsG2 ();
};


%feature("shadow") LocalAnalysis_SurfaceContinuity::~LocalAnalysis_SurfaceContinuity %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocalAnalysis_SurfaceContinuity {
	void _kill_pointed() {
		delete $self;
	}
};
