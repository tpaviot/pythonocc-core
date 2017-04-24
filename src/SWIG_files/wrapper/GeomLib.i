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
%module (package="OCC") GeomLib

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


%include GeomLib_headers.i


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
typedef GeomLib_DenominatorMultiplier * GeomLib_DenominatorMultiplierPtr;
/* end typedefs declaration */

/* public enums */
enum GeomLib_InterpolationErrors {
	GeomLib_NoError = 0,
	GeomLib_NotEnoughtPoints = 1,
	GeomLib_DegreeSmallerThan3 = 2,
	GeomLib_InversionProblem = 3,
};

/* end public enums declaration */

%rename(geomlib) GeomLib;
class GeomLib {
	public:
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	* Computes the curve 3d from package Geom corresponding to curve 2d from package Geom2d, on the plan defined with the local coordinate system Position.

	:param Position:
	:type Position: gp_Ax2
	:param Curve2d:
	:type Curve2d: Handle_Geom2d_Curve &
	:rtype: Handle_Geom_Curve
") To3d;
		static Handle_Geom_Curve To3d (const gp_Ax2 & Position,const Handle_Geom2d_Curve & Curve2d);
		%feature("compactdefaultargs") GTransform;
		%feature("autodoc", "	* Computes the curve 3d from package Geom corresponding to the curve 3d from package Geom, transformed with the transformation <GTrsf> WARNING : this method may return a null Handle if it's impossible to compute the transformation of a curve. It's not implemented when : 1) the curve is an infinite parabola or hyperbola 2) the curve is an offsetcurve

	:param Curve:
	:type Curve: Handle_Geom2d_Curve &
	:param GTrsf:
	:type GTrsf: gp_GTrsf2d
	:rtype: Handle_Geom2d_Curve
") GTransform;
		static Handle_Geom2d_Curve GTransform (const Handle_Geom2d_Curve & Curve,const gp_GTrsf2d & GTrsf);
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "	* Make the curve Curve2dPtr have the imposed range First to List the most economic way, that is if it can change the range without changing the nature of the curve it will try to do that. Otherwise it will produce a Bspline curve that has the required range

	:param Tolerance:
	:type Tolerance: float
	:param Curve2dPtr:
	:type Curve2dPtr: Handle_Geom2d_Curve &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param RequestedFirst:
	:type RequestedFirst: float
	:param RequestedLast:
	:type RequestedLast: float
	:param NewCurve2dPtr:
	:type NewCurve2dPtr: Handle_Geom2d_Curve &
	:rtype: void
") SameRange;
		static void SameRange (const Standard_Real Tolerance,const Handle_Geom2d_Curve & Curve2dPtr,const Standard_Real First,const Standard_Real Last,const Standard_Real RequestedFirst,const Standard_Real RequestedLast,Handle_Geom2d_Curve & NewCurve2dPtr);
		%feature("compactdefaultargs") BuildCurve3d;
		%feature("autodoc", "	:param Tolerance:
	:type Tolerance: float
	:param CurvePtr:
	:type CurvePtr: Adaptor3d_CurveOnSurface &
	:param FirstParameter:
	:type FirstParameter: float
	:param LastParameter:
	:type LastParameter: float
	:param NewCurvePtr:
	:type NewCurvePtr: Handle_Geom_Curve &
	:param MaxDeviation:
	:type MaxDeviation: float &
	:param AverageDeviation:
	:type AverageDeviation: float &
	:param Continuity: default value is GeomAbs_C1
	:type Continuity: GeomAbs_Shape
	:param MaxDegree: default value is 14
	:type MaxDegree: int
	:param MaxSegment: default value is 30
	:type MaxSegment: int
	:rtype: void
") BuildCurve3d;
		static void BuildCurve3d (const Standard_Real Tolerance,Adaptor3d_CurveOnSurface & CurvePtr,const Standard_Real FirstParameter,const Standard_Real LastParameter,Handle_Geom_Curve & NewCurvePtr,Standard_Real &OutValue,Standard_Real &OutValue,const GeomAbs_Shape Continuity = GeomAbs_C1,const Standard_Integer MaxDegree = 14,const Standard_Integer MaxSegment = 30);
		%feature("compactdefaultargs") AdjustExtremity;
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Geom_BoundedCurve &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param T1:
	:type T1: gp_Vec
	:param T2:
	:type T2: gp_Vec
	:rtype: void
") AdjustExtremity;
		static void AdjustExtremity (Handle_Geom_BoundedCurve & Curve,const gp_Pnt & P1,const gp_Pnt & P2,const gp_Vec & T1,const gp_Vec & T2);
		%feature("compactdefaultargs") ExtendCurveToPoint;
		%feature("autodoc", "	* Extends the bounded curve Curve to the point Point. The extension is built: - at the end of the curve if After equals true, or - at the beginning of the curve if After equals false. The extension is performed according to a degree of continuity equal to Cont, which in its turn must be equal to 1, 2 or 3. This function converts the bounded curve Curve into a BSpline curve. Warning - Nothing is done, and Curve is not modified if Cont is not equal to 1, 2 or 3. - It is recommended that the extension should not be too large with respect to the size of the bounded curve Curve: Point must not be located too far from one of the extremities of Curve.

	:param Curve:
	:type Curve: Handle_Geom_BoundedCurve &
	:param Point:
	:type Point: gp_Pnt
	:param Cont:
	:type Cont: int
	:param After:
	:type After: bool
	:rtype: void
") ExtendCurveToPoint;
		static void ExtendCurveToPoint (Handle_Geom_BoundedCurve & Curve,const gp_Pnt & Point,const Standard_Integer Cont,const Standard_Boolean After);
		%feature("compactdefaultargs") ExtendSurfByLength;
		%feature("autodoc", "	* Extends the bounded surface Surf along one of its boundaries. The chord length of the extension is equal to Length. The direction of the extension is given as: - the u parametric direction of Surf, if InU equals true, or - the v parametric direction of Surf, if InU equals false. In this parametric direction, the extension is built on the side of: - the last parameter of Surf, if After equals true, or - the first parameter of Surf, if After equals false. The extension is performed according to a degree of continuity equal to Cont, which in its turn must be equal to 1, 2 or 3. This function converts the bounded surface Surf into a BSpline surface. Warning - Nothing is done, and Surf is not modified if Cont is not equal to 1, 2 or 3. - It is recommended that Length, the size of the extension should not be too large with respect to the size of the bounded surface Surf. - Surf must not be a periodic BSpline surface in the parametric direction corresponding to the direction of extension.

	:param Surf:
	:type Surf: Handle_Geom_BoundedSurface &
	:param Length:
	:type Length: float
	:param Cont:
	:type Cont: int
	:param InU:
	:type InU: bool
	:param After:
	:type After: bool
	:rtype: void
") ExtendSurfByLength;
		static void ExtendSurfByLength (Handle_Geom_BoundedSurface & Surf,const Standard_Real Length,const Standard_Integer Cont,const Standard_Boolean InU,const Standard_Boolean After);
		%feature("compactdefaultargs") AxeOfInertia;
		%feature("autodoc", "	* Compute axes of inertia, of some points -- -- -- <Axe>.Location() is the BaryCentre -- -- -- -- -- <Axe>.XDirection is the axe of upper inertia -- -- -- -- <Axe>.Direction is the Normal to the average plane -- -- -- IsSingular is True if points are on line -- Tol is used to determine singular cases.

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param Axe:
	:type Axe: gp_Ax2
	:param IsSingular:
	:type IsSingular: bool
	:param Tol: default value is 1.0e-7
	:type Tol: float
	:rtype: void
") AxeOfInertia;
		static void AxeOfInertia (const TColgp_Array1OfPnt & Points,gp_Ax2 & Axe,Standard_Boolean &OutValue,const Standard_Real Tol = 1.0e-7);
		%feature("compactdefaultargs") Inertia;
		%feature("autodoc", "	* Compute principale axes of inertia, and dispertion value of some points.

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param Bary:
	:type Bary: gp_Pnt
	:param XDir:
	:type XDir: gp_Dir
	:param YDir:
	:type YDir: gp_Dir
	:param Xgap:
	:type Xgap: float &
	:param YGap:
	:type YGap: float &
	:param ZGap:
	:type ZGap: float &
	:rtype: void
") Inertia;
		static void Inertia (const TColgp_Array1OfPnt & Points,gp_Pnt & Bary,gp_Dir & XDir,gp_Dir & YDir,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") RemovePointsFromArray;
		%feature("autodoc", "	* Warning! This assume that the InParameter is an increasing sequence of real number and it will not check for that : Unpredictable result can happen if this is not satisfied. It is the caller responsability to check for that property. //! This method makes uniform NumPoints segments S1,...SNumPoints out of the segment defined by the first parameter and the last parameter ofthe InParameter ; keeps only one point of the InParameters set of parameter in each of the uniform segments taking care of the first and the last parameters. For the ith segment the element of the InParameter is the one that is the first to exceed the midpoint of the segment and to fall before the midpoint of the next segment There will be at the end at most NumPoints + 1 if NumPoints > 2 in the OutParameters Array

	:param NumPoints:
	:type NumPoints: int
	:param InParameters:
	:type InParameters: TColStd_Array1OfReal &
	:param OutParameters:
	:type OutParameters: Handle_TColStd_HArray1OfReal &
	:rtype: void
") RemovePointsFromArray;
		static void RemovePointsFromArray (const Standard_Integer NumPoints,const TColStd_Array1OfReal & InParameters,Handle_TColStd_HArray1OfReal & OutParameters);
		%feature("compactdefaultargs") DensifyArray1OfReal;
		%feature("autodoc", "	* this makes sure that there is at least MinNumPoints in OutParameters taking into account the parameters in the InParameters array provided those are in order, that is the sequence of real in the InParameter is strictly non decreasing

	:param MinNumPoints:
	:type MinNumPoints: int
	:param InParameters:
	:type InParameters: TColStd_Array1OfReal &
	:param OutParameters:
	:type OutParameters: Handle_TColStd_HArray1OfReal &
	:rtype: void
") DensifyArray1OfReal;
		static void DensifyArray1OfReal (const Standard_Integer MinNumPoints,const TColStd_Array1OfReal & InParameters,Handle_TColStd_HArray1OfReal & OutParameters);
		%feature("compactdefaultargs") FuseIntervals;
		%feature("autodoc", "	:param Interval1:
	:type Interval1: TColStd_Array1OfReal &
	:param Interval2:
	:type Interval2: TColStd_Array1OfReal &
	:param Fusion:
	:type Fusion: TColStd_SequenceOfReal &
	:param Confusion: default value is 1.0e-9
	:type Confusion: float
	:rtype: void
") FuseIntervals;
		static void FuseIntervals (const TColStd_Array1OfReal & Interval1,const TColStd_Array1OfReal & Interval2,TColStd_SequenceOfReal & Fusion,const Standard_Real Confusion = 1.0e-9);
		%feature("compactdefaultargs") EvalMaxParametricDistance;
		%feature("autodoc", "	* this will compute the maximum distance at the parameters given in the Parameters array by evaluating each parameter the two curves and taking the maximum of the evaluated distance

	:param Curve:
	:type Curve: Adaptor3d_Curve &
	:param AReferenceCurve:
	:type AReferenceCurve: Adaptor3d_Curve &
	:param Tolerance:
	:type Tolerance: float
	:param Parameters:
	:type Parameters: TColStd_Array1OfReal &
	:param MaxDistance:
	:type MaxDistance: float &
	:rtype: void
") EvalMaxParametricDistance;
		static void EvalMaxParametricDistance (const Adaptor3d_Curve & Curve,const Adaptor3d_Curve & AReferenceCurve,const Standard_Real Tolerance,const TColStd_Array1OfReal & Parameters,Standard_Real &OutValue);
		%feature("compactdefaultargs") EvalMaxDistanceAlongParameter;
		%feature("autodoc", "	* this will compute the maximum distancef at the parameters given in the Parameters array by projecting from the Curve to the reference curve and taking the minimum distance Than the maximum will be taken on those minimas.

	:param Curve:
	:type Curve: Adaptor3d_Curve &
	:param AReferenceCurve:
	:type AReferenceCurve: Adaptor3d_Curve &
	:param Tolerance:
	:type Tolerance: float
	:param Parameters:
	:type Parameters: TColStd_Array1OfReal &
	:param MaxDistance:
	:type MaxDistance: float &
	:rtype: void
") EvalMaxDistanceAlongParameter;
		static void EvalMaxDistanceAlongParameter (const Adaptor3d_Curve & Curve,const Adaptor3d_Curve & AReferenceCurve,const Standard_Real Tolerance,const TColStd_Array1OfReal & Parameters,Standard_Real &OutValue);
		%feature("compactdefaultargs") CancelDenominatorDerivative;
		%feature("autodoc", "	* Cancel,on the boudaries,the denominator first derivative in the directions wished by the user and set its value to 1.

	:param BSurf:
	:type BSurf: Handle_Geom_BSplineSurface &
	:param UDirection:
	:type UDirection: bool
	:param VDirection:
	:type VDirection: bool
	:rtype: void
") CancelDenominatorDerivative;
		static void CancelDenominatorDerivative (Handle_Geom_BSplineSurface & BSurf,const Standard_Boolean UDirection,const Standard_Boolean VDirection);
		%feature("compactdefaultargs") NormEstim;
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:param UV:
	:type UV: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:param N:
	:type N: gp_Dir
	:rtype: int
") NormEstim;
		static Standard_Integer NormEstim (const Handle_Geom_Surface & S,const gp_Pnt2d & UV,const Standard_Real Tol,gp_Dir & N);
};


%extend GeomLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomLib_Array1OfMat;
class GeomLib_Array1OfMat {
	public:
		%feature("compactdefaultargs") GeomLib_Array1OfMat;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") GeomLib_Array1OfMat;
		 GeomLib_Array1OfMat (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") GeomLib_Array1OfMat;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Mat
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") GeomLib_Array1OfMat;
		 GeomLib_Array1OfMat (const gp_Mat & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Mat
	:rtype: None
") Init;
		void Init (const gp_Mat & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: GeomLib_Array1OfMat &
	:rtype: GeomLib_Array1OfMat
") Assign;
		const GeomLib_Array1OfMat & Assign (const GeomLib_Array1OfMat & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: GeomLib_Array1OfMat &
	:rtype: GeomLib_Array1OfMat
") operator =;
		const GeomLib_Array1OfMat & operator = (const GeomLib_Array1OfMat & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: gp_Mat
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Mat & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Mat
") Value;
		const gp_Mat  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Mat
") ChangeValue;
		gp_Mat  ChangeValue (const Standard_Integer Index);
};


%extend GeomLib_Array1OfMat {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomLib_Check2dBSplineCurve;
class GeomLib_Check2dBSplineCurve {
	public:
		%feature("compactdefaultargs") GeomLib_Check2dBSplineCurve;
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Geom2d_BSplineCurve &
	:param Tolerance:
	:type Tolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: None
") GeomLib_Check2dBSplineCurve;
		 GeomLib_Check2dBSplineCurve (const Handle_Geom2d_BSplineCurve & Curve,const Standard_Real Tolerance,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NeedTangentFix;
		%feature("autodoc", "	:param FirstFlag:
	:type FirstFlag: bool
	:param SecondFlag:
	:type SecondFlag: bool
	:rtype: None
") NeedTangentFix;
		void NeedTangentFix (Standard_Boolean &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") FixTangent;
		%feature("autodoc", "	:param FirstFlag:
	:type FirstFlag: bool
	:param LastFlag:
	:type LastFlag: bool
	:rtype: None
") FixTangent;
		void FixTangent (const Standard_Boolean FirstFlag,const Standard_Boolean LastFlag);
		%feature("compactdefaultargs") FixedTangent;
		%feature("autodoc", "	* modifies the curve by fixing the first or the last tangencies //! if Index3D not in the Range [1,Nb3dSpaces] if the Approx is not Done

	:param FirstFlag:
	:type FirstFlag: bool
	:param LastFlag:
	:type LastFlag: bool
	:rtype: Handle_Geom2d_BSplineCurve
") FixedTangent;
		Handle_Geom2d_BSplineCurve FixedTangent (const Standard_Boolean FirstFlag,const Standard_Boolean LastFlag);
};


%extend GeomLib_Check2dBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomLib_CheckBSplineCurve;
class GeomLib_CheckBSplineCurve {
	public:
		%feature("compactdefaultargs") GeomLib_CheckBSplineCurve;
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Geom_BSplineCurve &
	:param Tolerance:
	:type Tolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: None
") GeomLib_CheckBSplineCurve;
		 GeomLib_CheckBSplineCurve (const Handle_Geom_BSplineCurve & Curve,const Standard_Real Tolerance,const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NeedTangentFix;
		%feature("autodoc", "	:param FirstFlag:
	:type FirstFlag: bool
	:param SecondFlag:
	:type SecondFlag: bool
	:rtype: None
") NeedTangentFix;
		void NeedTangentFix (Standard_Boolean &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") FixTangent;
		%feature("autodoc", "	:param FirstFlag:
	:type FirstFlag: bool
	:param LastFlag:
	:type LastFlag: bool
	:rtype: None
") FixTangent;
		void FixTangent (const Standard_Boolean FirstFlag,const Standard_Boolean LastFlag);
		%feature("compactdefaultargs") FixedTangent;
		%feature("autodoc", "	* modifies the curve by fixing the first or the last tangencies //! if Index3D not in the Range [1,Nb3dSpaces] if the Approx is not Done

	:param FirstFlag:
	:type FirstFlag: bool
	:param LastFlag:
	:type LastFlag: bool
	:rtype: Handle_Geom_BSplineCurve
") FixedTangent;
		Handle_Geom_BSplineCurve FixedTangent (const Standard_Boolean FirstFlag,const Standard_Boolean LastFlag);
};


%extend GeomLib_CheckBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomLib_DenominatorMultiplier;
class GeomLib_DenominatorMultiplier {
	public:
		%feature("compactdefaultargs") GeomLib_DenominatorMultiplier;
		%feature("autodoc", "	* if the surface is rational this will define the evaluator of a real function of 2 variables a(u,v) such that if we define a new surface by : a(u,v) * N(u,v) NewF(u,v) = ---------------- a(u,v) * D(u,v)

	:param Surface:
	:type Surface: Handle_Geom_BSplineSurface &
	:param KnotVector:
	:type KnotVector: TColStd_Array1OfReal &
	:rtype: None
") GeomLib_DenominatorMultiplier;
		 GeomLib_DenominatorMultiplier (const Handle_Geom_BSplineSurface & Surface,const TColStd_Array1OfReal & KnotVector);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value of a(UParameter,VParameter)= //! H0(UParameter)/Denominator(Umin,Vparameter) //! D Denominator(Umin,Vparameter) - ------------------------------[H1(u)]/(Denominator(Umin,Vparameter)^2) D U //! + H3(UParameter)/Denominator(Umax,Vparameter) //! D Denominator(Umax,Vparameter) - ------------------------------[H2(u)]/(Denominator(Umax,Vparameter)^2) D U

	:param UParameter:
	:type UParameter: float
	:param VParameter:
	:type VParameter: float
	:rtype: float
") Value;
		Standard_Real Value (const Standard_Real UParameter,const Standard_Real VParameter);
};


%extend GeomLib_DenominatorMultiplier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomLib_Interpolate;
class GeomLib_Interpolate {
	public:
		%feature("compactdefaultargs") GeomLib_Interpolate;
		%feature("autodoc", "	:param Degree:
	:type Degree: int
	:param NumPoints:
	:type NumPoints: int
	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param Parameters:
	:type Parameters: TColStd_Array1OfReal &
	:rtype: None
") GeomLib_Interpolate;
		 GeomLib_Interpolate (const Standard_Integer Degree,const Standard_Integer NumPoints,const TColgp_Array1OfPnt & Points,const TColStd_Array1OfReal & Parameters);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns if everything went OK

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* returns the error type if any

	:rtype: GeomLib_InterpolationErrors
") Error;
		GeomLib_InterpolationErrors Error ();
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* returns the interpolated curve of the requested degree

	:rtype: Handle_Geom_BSplineCurve
") Curve;
		Handle_Geom_BSplineCurve Curve ();
};


%extend GeomLib_Interpolate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomLib_IsPlanarSurface;
class GeomLib_IsPlanarSurface {
	public:
		%feature("compactdefaultargs") GeomLib_IsPlanarSurface;
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:param Tol: default value is 1.0e-7
	:type Tol: float
	:rtype: None
") GeomLib_IsPlanarSurface;
		 GeomLib_IsPlanarSurface (const Handle_Geom_Surface & S,const Standard_Real Tol = 1.0e-7);
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "	* Return if the Surface is a plan

	:rtype: bool
") IsPlanar;
		Standard_Boolean IsPlanar ();
		%feature("compactdefaultargs") Plan;
		%feature("autodoc", "	* Return the plan definition

	:rtype: gp_Pln
") Plan;
		const gp_Pln  Plan ();
};


%extend GeomLib_IsPlanarSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomLib_LogSample;
class GeomLib_LogSample : public math_FunctionSample {
	public:
		%feature("compactdefaultargs") GeomLib_LogSample;
		%feature("autodoc", "	:param A:
	:type A: float
	:param B:
	:type B: float
	:param N:
	:type N: int
	:rtype: None
") GeomLib_LogSample;
		 GeomLib_LogSample (const Standard_Real A,const Standard_Real B,const Standard_Integer N);
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "	* Returns the value of parameter of the point of range Index : A + ((Index-1)/(NbPoints-1))*B. An exception is raised if Index<=0 or Index>NbPoints.

	:param Index:
	:type Index: int
	:rtype: float
") GetParameter;
		virtual Standard_Real GetParameter (const Standard_Integer Index);
};


%extend GeomLib_LogSample {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomLib_MakeCurvefromApprox;
class GeomLib_MakeCurvefromApprox {
	public:
		%feature("compactdefaultargs") GeomLib_MakeCurvefromApprox;
		%feature("autodoc", "	:param Approx:
	:type Approx: AdvApprox_ApproxAFunction &
	:rtype: None
") GeomLib_MakeCurvefromApprox;
		 GeomLib_MakeCurvefromApprox (const AdvApprox_ApproxAFunction & Approx);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Nb1DSpaces;
		%feature("autodoc", "	* returns the number of 1D spaces of the Approx

	:rtype: int
") Nb1DSpaces;
		Standard_Integer Nb1DSpaces ();
		%feature("compactdefaultargs") Nb2DSpaces;
		%feature("autodoc", "	* returns the number of 3D spaces of the Approx

	:rtype: int
") Nb2DSpaces;
		Standard_Integer Nb2DSpaces ();
		%feature("compactdefaultargs") Nb3DSpaces;
		%feature("autodoc", "	* returns the number of 3D spaces of the Approx

	:rtype: int
") Nb3DSpaces;
		Standard_Integer Nb3DSpaces ();
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	* returns a polynomial curve whose poles correspond to the Index2d 2D space if Index2d not in the Range [1,Nb2dSpaces] if the Approx is not Done

	:param Index2d:
	:type Index2d: int
	:rtype: Handle_Geom2d_BSplineCurve
") Curve2d;
		Handle_Geom2d_BSplineCurve Curve2d (const Standard_Integer Index2d);
		%feature("compactdefaultargs") Curve2dFromTwo1d;
		%feature("autodoc", "	* returns a 2D curve building it from the 1D curve in x at Index1d and y at Index2d amongst the 1D curves if Index1d not in the Range [1,Nb1dSpaces] if Index2d not in the Range [1,Nb1dSpaces] if the Approx is not Done

	:param Index1d:
	:type Index1d: int
	:param Index2d:
	:type Index2d: int
	:rtype: Handle_Geom2d_BSplineCurve
") Curve2dFromTwo1d;
		Handle_Geom2d_BSplineCurve Curve2dFromTwo1d (const Standard_Integer Index1d,const Standard_Integer Index2d);
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	* returns a rational curve whose poles correspond to the index2d of the 2D space and whose weights correspond to one dimensional space of index 1d if Index1d not in the Range [1,Nb1dSpaces] if Index2d not in the Range [1,Nb2dSpaces] if the Approx is not Done

	:param Index1d:
	:type Index1d: int
	:param Index2d:
	:type Index2d: int
	:rtype: Handle_Geom2d_BSplineCurve
") Curve2d;
		Handle_Geom2d_BSplineCurve Curve2d (const Standard_Integer Index1d,const Standard_Integer Index2d);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* returns a polynomial curve whose poles correspond to the Index3D 3D space if Index3D not in the Range [1,Nb3dSpaces] if the Approx is not Done

	:param Index3d:
	:type Index3d: int
	:rtype: Handle_Geom_BSplineCurve
") Curve;
		Handle_Geom_BSplineCurve Curve (const Standard_Integer Index3d);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* returns a rational curve whose poles correspond to the index3D of the 3D space and whose weights correspond to the index1d 1D space. if Index1D not in the Range [1,Nb1dSpaces] if Index3D not in the Range [1,Nb3dSpaces] if the Approx is not Done

	:param Index1D:
	:type Index1D: int
	:param Index3D:
	:type Index3D: int
	:rtype: Handle_Geom_BSplineCurve
") Curve;
		Handle_Geom_BSplineCurve Curve (const Standard_Integer Index1D,const Standard_Integer Index3D);
};


%extend GeomLib_MakeCurvefromApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomLib_PolyFunc;
class GeomLib_PolyFunc : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") GeomLib_PolyFunc;
		%feature("autodoc", "	:param Coeffs:
	:type Coeffs: math_Vector &
	:rtype: None
") GeomLib_PolyFunc;
		 GeomLib_PolyFunc (const math_Vector & Coeffs);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the value <F>of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* computes the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.

	:param X:
	:type X: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		virtual Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* computes the value <F> and the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend GeomLib_PolyFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class GeomLib_Tool {
	public:
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Extracts the parameter of a 3D point lying on a 3D curve or at a distance less than the tolerance value.

	:param Curve:
	:type Curve: Handle_Geom_Curve &
	:param Point:
	:type Point: gp_Pnt
	:param Tolerance:
	:type Tolerance: float
	:param U:
	:type U: float &
	:rtype: bool
") Parameter;
		static Standard_Boolean Parameter (const Handle_Geom_Curve & Curve,const gp_Pnt & Point,const Standard_Real Tolerance,Standard_Real &OutValue);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Extracts the parameter of a 3D point lying on a surface or at a distance less than the tolerance value.

	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param Point:
	:type Point: gp_Pnt
	:param Tolerance:
	:type Tolerance: float
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: bool
") Parameters;
		static Standard_Boolean Parameters (const Handle_Geom_Surface & Surface,const gp_Pnt & Point,const Standard_Real Tolerance,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Extracts the parameter of a 2D point lying on a 2D curve or at a distance less than the tolerance value.

	:param Curve:
	:type Curve: Handle_Geom2d_Curve &
	:param Point:
	:type Point: gp_Pnt2d
	:param Tolerance:
	:type Tolerance: float
	:param U:
	:type U: float &
	:rtype: bool
") Parameter;
		static Standard_Boolean Parameter (const Handle_Geom2d_Curve & Curve,const gp_Pnt2d & Point,const Standard_Real Tolerance,Standard_Real &OutValue);
};


%extend GeomLib_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
