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
%define GEOMLIBDOCSTRING
"GeomLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geomlib.html"
%enddef
%module (package="OCC.Core", docstring=GEOMLIBDOCSTRING) GeomLib


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
#include<GeomLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<math_module.hxx>
#include<AdvApprox_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<PLib_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Precision_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import gp.i
%import Adaptor3d.i
%import GeomAbs.i
%import Geom2d.i
%import Adaptor2d.i
%import math.i
%import AdvApprox.i
%import Geom2dAdaptor.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum GeomLib_InterpolationErrors {
	GeomLib_NoError = 0,
	GeomLib_NotEnoughtPoints = 1,
	GeomLib_DegreeSmallerThan3 = 2,
	GeomLib_InversionProblem = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class GeomLib_InterpolationErrors(IntEnum):
	GeomLib_NoError = 0
	GeomLib_NotEnoughtPoints = 1
	GeomLib_DegreeSmallerThan3 = 2
	GeomLib_InversionProblem = 3
GeomLib_NoError = GeomLib_InterpolationErrors.GeomLib_NoError
GeomLib_NotEnoughtPoints = GeomLib_InterpolationErrors.GeomLib_NotEnoughtPoints
GeomLib_DegreeSmallerThan3 = GeomLib_InterpolationErrors.GeomLib_DegreeSmallerThan3
GeomLib_InversionProblem = GeomLib_InterpolationErrors.GeomLib_InversionProblem
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(GeomLib_Array1OfMat) NCollection_Array1<gp_Mat>;
Array1ExtendIter(gp_Mat)

/* end templates declaration */

/* typedefs */
typedef class Adaptor2d_Curve2d Adaptor2d_Curve2d;
typedef NCollection_Array1<gp_Mat> GeomLib_Array1OfMat;
/* end typedefs declaration */

/****************
* class GeomLib *
****************/
%rename(geomlib) GeomLib;
class GeomLib {
	public:
		/****** GeomLib::AdjustExtremity ******/
		/****** md5 signature: 9a3ee1a8642d7491cdc212f08decd57b ******/
		%feature("compactdefaultargs") AdjustExtremity;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_BoundedCurve
P1: gp_Pnt
P2: gp_Pnt
T1: gp_Vec
T2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") AdjustExtremity;
		static void AdjustExtremity(opencascade::handle<Geom_BoundedCurve> & Curve, const gp_Pnt & P1, const gp_Pnt & P2, const gp_Vec & T1, const gp_Vec & T2);

		/****** GeomLib::AxeOfInertia ******/
		/****** md5 signature: 13901cda0dd7d3d75b65f50ebf141a6e ******/
		%feature("compactdefaultargs") AxeOfInertia;
		%feature("autodoc", "
Parameters
----------
Points: NCollection_Array1<gp_Pnt>
Axe: gp_Ax2
Tol: double (optional, default to 1.0e-7)

Return
-------
IsSingular: bool

Description
-----------
Compute axes of inertia, of some points <Axe>.Location() is the BaryCentre <Axe>.XDirection is the axe of upper inertia <Axe>.Direction is the Normal to the average plane IsSingular is True if points are on line Tol is used to determine singular cases.
") AxeOfInertia;
		static void AxeOfInertia(const NCollection_Array1<gp_Pnt> & Points, gp_Ax2 & Axe, Standard_Boolean &OutValue, const double Tol = 1.0e-7);

		/****** GeomLib::BuildCurve3d ******/
		/****** md5 signature: 4b59251c965685bfe3031cc183f828b6 ******/
		%feature("compactdefaultargs") BuildCurve3d;
		%feature("autodoc", "
Parameters
----------
Tolerance: double
CurvePtr: Adaptor3d_CurveOnSurface
FirstParameter: double
LastParameter: double
NewCurvePtr: Geom_Curve
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C1)
MaxDegree: int (optional, default to 14)
MaxSegment: int (optional, default to 30)

Return
-------
MaxDeviation: double
AverageDeviation: double

Description
-----------
No available documentation.
") BuildCurve3d;
		static void BuildCurve3d(const double Tolerance, Adaptor3d_CurveOnSurface & CurvePtr, const double FirstParameter, const double LastParameter, opencascade::handle<Geom_Curve> & NewCurvePtr, Standard_Real &OutValue, Standard_Real &OutValue, const GeomAbs_Shape Continuity = GeomAbs_C1, const int MaxDegree = 14, const int MaxSegment = 30);

		/****** GeomLib::CancelDenominatorDerivative ******/
		/****** md5 signature: 0d141f2935fb54f1ec11be155dc3e507 ******/
		%feature("compactdefaultargs") CancelDenominatorDerivative;
		%feature("autodoc", "
Parameters
----------
BSurf: Geom_BSplineSurface
UDirection: bool
VDirection: bool

Return
-------
None

Description
-----------
Cancel,on the boundaries,the denominator first derivative in the directions wished by the user and set its value to 1.
") CancelDenominatorDerivative;
		static void CancelDenominatorDerivative(opencascade::handle<Geom_BSplineSurface> & BSurf, const bool UDirection, const bool VDirection);

		/****** GeomLib::DensifyArray1OfReal ******/
		/****** md5 signature: b19650e227d957106c87a62279a82fa3 ******/
		%feature("compactdefaultargs") DensifyArray1OfReal;
		%feature("autodoc", "
Parameters
----------
MinNumPoints: int
InParameters: NCollection_Array1<double>
OutParameters: NCollection_HArray1<double

Return
-------
None

Description
-----------
this makes sure that there is at least MinNumPoints in OutParameters taking into account the parameters in the InParameters array provided those are in order, that is the sequence of real in the InParameter is strictly non decreasing.
") DensifyArray1OfReal;
		static void DensifyArray1OfReal(const int MinNumPoints, const NCollection_Array1<double> & InParameters, opencascade::handle<NCollection_HArray1<double> > & OutParameters);

		/****** GeomLib::EvalMaxDistanceAlongParameter ******/
		/****** md5 signature: bde436fd772795869d3e23cfef5799e3 ******/
		%feature("compactdefaultargs") EvalMaxDistanceAlongParameter;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
AReferenceCurve: Adaptor3d_Curve
Tolerance: double
Parameters: NCollection_Array1<double>

Return
-------
MaxDistance: double

Description
-----------
this will compute the maximum distance at the parameters given in the Parameters array by projecting from the Curve to the reference curve and taking the minimum distance Than the maximum will be taken on those minimas.
") EvalMaxDistanceAlongParameter;
		static void EvalMaxDistanceAlongParameter(const Adaptor3d_Curve & Curve, const Adaptor3d_Curve & AReferenceCurve, const double Tolerance, const NCollection_Array1<double> & Parameters, Standard_Real &OutValue);

		/****** GeomLib::EvalMaxParametricDistance ******/
		/****** md5 signature: 5af8f94185282602a25cee11a24a076d ******/
		%feature("compactdefaultargs") EvalMaxParametricDistance;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
AReferenceCurve: Adaptor3d_Curve
Tolerance: double
Parameters: NCollection_Array1<double>

Return
-------
MaxDistance: double

Description
-----------
this will compute the maximum distance at the parameters given in the Parameters array by evaluating each parameter the two curves and taking the maximum of the evaluated distance.
") EvalMaxParametricDistance;
		static void EvalMaxParametricDistance(const Adaptor3d_Curve & Curve, const Adaptor3d_Curve & AReferenceCurve, const double Tolerance, const NCollection_Array1<double> & Parameters, Standard_Real &OutValue);

		/****** GeomLib::ExtendCurveToPoint ******/
		/****** md5 signature: 7e19a56bb5a96f5f1058b7b5fe1edbed ******/
		%feature("compactdefaultargs") ExtendCurveToPoint;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_BoundedCurve
Point: gp_Pnt
Cont: int
After: bool

Return
-------
None

Description
-----------
Extends the bounded curve Curve to the point Point. The extension is built: - at the end of the curve if After equals true, or - at the beginning of the curve if After equals false. The extension is performed according to a degree of continuity equal to Cont, which in its turn must be equal to 1, 2 or 3. This function converts the bounded curve Curve into a BSpline curve. Warning - Nothing is done, and Curve is not modified if Cont is not equal to 1, 2 or 3. - It is recommended that the extension should not be too large with respect to the size of the bounded curve Curve: Point must not be located too far from one of the extremities of Curve.
") ExtendCurveToPoint;
		static void ExtendCurveToPoint(opencascade::handle<Geom_BoundedCurve> & Curve, const gp_Pnt & Point, const int Cont, const bool After);

		/****** GeomLib::ExtendSurfByLength ******/
		/****** md5 signature: f4df7c6acbfd8c17d83ed1288632f810 ******/
		%feature("compactdefaultargs") ExtendSurfByLength;
		%feature("autodoc", "
Parameters
----------
Surf: Geom_BoundedSurface
Length: double
Cont: int
InU: bool
After: bool

Return
-------
None

Description
-----------
Extends the bounded surface Surf along one of its boundaries. The chord length of the extension is equal to Length. The direction of the extension is given as: - the u parametric direction of Surf, if InU equals true, or - the v parametric direction of Surf, if InU equals false. In this parametric direction, the extension is built on the side of: - the last parameter of Surf, if After equals true, or - the first parameter of Surf, if After equals false. The extension is performed according to a degree of continuity equal to Cont, which in its turn must be equal to 1, 2 or 3. This function converts the bounded surface Surf into a BSpline surface. Warning - Nothing is done, and Surf is not modified if Cont is not equal to 1, 2 or 3. - It is recommended that Length, the size of the extension should not be too large with respect to the size of the bounded surface Surf. - Surf must not be a periodic BSpline surface in the parametric direction corresponding to the direction of extension.
") ExtendSurfByLength;
		static void ExtendSurfByLength(opencascade::handle<Geom_BoundedSurface> & Surf, const double Length, const int Cont, const bool InU, const bool After);

		/****** GeomLib::FuseIntervals ******/
		/****** md5 signature: 3c1c2b3ffad00284f0145ad6c3e9628f ******/
		%feature("compactdefaultargs") FuseIntervals;
		%feature("autodoc", "
Parameters
----------
Interval1: NCollection_Array1<double>
Interval2: NCollection_Array1<double>
Fusion: NCollection_Sequence<double>
Confusion: double (optional, default to 1.0e-9)
IsAdjustToFirstInterval: bool (optional, default to false)

Return
-------
None

Description
-----------
This method fuse intervals Interval1 and Interval2 with specified Confusion 
Input parameter: Interval1 first interval to fuse 
Input parameter: Interval2 second interval to fuse 
Input parameter: Confision tolerance to compare intervals 
Input parameter: IsAdjustToFirstInterval flag to set method of fusion, if intervals are close  if false, intervals are fusing by half-division method  if true, intervals are fusing by selecting value from Interval1 @param[out] Fusion output interval.
") FuseIntervals;
		static void FuseIntervals(const NCollection_Array1<double> & Interval1, const NCollection_Array1<double> & Interval2, NCollection_Sequence<double> & Fusion, const double Confusion = 1.0e-9, const bool IsAdjustToFirstInterval = false);

		/****** GeomLib::GTransform ******/
		/****** md5 signature: 8e793303845ac7edd4a76bb5abc12d5f ******/
		%feature("compactdefaultargs") GTransform;
		%feature("autodoc", "
Parameters
----------
Curve: Geom2d_Curve
GTrsf: gp_GTrsf2d

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Computes the curve 3d from package Geom corresponding to the curve 3d from package Geom, transformed with the transformation <GTrsf> WARNING: this method may return a null Handle if it's impossible to compute the transformation of a curve. It's not implemented when: 1) the curve is an infinite parabola or hyperbola 2) the curve is an offsetcurve.
") GTransform;
		static opencascade::handle<Geom2d_Curve> GTransform(const opencascade::handle<Geom2d_Curve> & Curve, const gp_GTrsf2d & GTrsf);

		/****** GeomLib::Inertia ******/
		/****** md5 signature: e0003ee6ee4ec7c72c03c7b431499a2b ******/
		%feature("compactdefaultargs") Inertia;
		%feature("autodoc", "
Parameters
----------
Points: NCollection_Array1<gp_Pnt>
Bary: gp_Pnt
XDir: gp_Dir
YDir: gp_Dir

Return
-------
Xgap: double
YGap: double
ZGap: double

Description
-----------
Compute principale axes of inertia, and dispersion value of some points.
") Inertia;
		static void Inertia(const NCollection_Array1<gp_Pnt> & Points, gp_Pnt & Bary, gp_Dir & XDir, gp_Dir & YDir, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomLib::IsBSplUClosed ******/
		/****** md5 signature: c17be61e25d616d5eaf0a6e43f9f9af3 ******/
		%feature("compactdefaultargs") IsBSplUClosed;
		%feature("autodoc", "
Parameters
----------
S: Geom_BSplineSurface
U1: double
U2: double
Tol: double

Return
-------
bool

Description
-----------
Returns true if the poles of U1 isoline and the poles of U2 isoline of surface are identical according to tolerance criterion. For rational surfaces Weights(i)*Poles(i) are checked.
") IsBSplUClosed;
		static bool IsBSplUClosed(const opencascade::handle<Geom_BSplineSurface> & S, const double U1, const double U2, const double Tol);

		/****** GeomLib::IsBSplVClosed ******/
		/****** md5 signature: bf4f3426cb88cd8ed2b4d65231f98f0a ******/
		%feature("compactdefaultargs") IsBSplVClosed;
		%feature("autodoc", "
Parameters
----------
S: Geom_BSplineSurface
V1: double
V2: double
Tol: double

Return
-------
bool

Description
-----------
Returns true if the poles of V1 isoline and the poles of V2 isoline of surface are identical according to tolerance criterion. For rational surfaces Weights(i)*Poles(i) are checked.
") IsBSplVClosed;
		static bool IsBSplVClosed(const opencascade::handle<Geom_BSplineSurface> & S, const double V1, const double V2, const double Tol);

		/****** GeomLib::IsBzUClosed ******/
		/****** md5 signature: a43ac67401d55f2bb62c4405ab4dedfa ******/
		%feature("compactdefaultargs") IsBzUClosed;
		%feature("autodoc", "
Parameters
----------
S: Geom_BezierSurface
U1: double
U2: double
Tol: double

Return
-------
bool

Description
-----------
Returns true if the poles of U1 isoline and the poles of U2 isoline of surface are identical according to tolerance criterion.
") IsBzUClosed;
		static bool IsBzUClosed(const opencascade::handle<Geom_BezierSurface> & S, const double U1, const double U2, const double Tol);

		/****** GeomLib::IsBzVClosed ******/
		/****** md5 signature: 540e443bd2dcbc89cb7f26d7f8aa7fcb ******/
		%feature("compactdefaultargs") IsBzVClosed;
		%feature("autodoc", "
Parameters
----------
S: Geom_BezierSurface
V1: double
V2: double
Tol: double

Return
-------
bool

Description
-----------
Returns true if the poles of V1 isoline and the poles of V2 isoline of surface are identical according to tolerance criterion.
") IsBzVClosed;
		static bool IsBzVClosed(const opencascade::handle<Geom_BezierSurface> & S, const double V1, const double V2, const double Tol);

		/****** GeomLib::IsClosed ******/
		/****** md5 signature: 7649bbe1cf991b0fd11695ea0ad7deea ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
Tol: double

Return
-------
isUClosed: bool
isVClosed: bool

Description
-----------
This method defines if opposite boundaries of surface coincide with given tolerance.
") IsClosed;
		static void IsClosed(const opencascade::handle<Geom_Surface> & S, const double Tol, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** GeomLib::NormEstim ******/
		/****** md5 signature: 9dffd49ce632f8c857633f5fd901b24b ******/
		%feature("compactdefaultargs") NormEstim;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_Surface
theUV: gp_Pnt2d
theTol: double
theNorm: gp_Dir

Return
-------
int

Description
-----------
Estimate surface normal at the given (U, V) point. 
Input parameter: theSurf input surface 
Input parameter: theUV (U, V) point coordinates on the surface 
Input parameter: theTol estimation tolerance @param[out] theNorm computed normal 
Return: 0 if normal estimated from D1, 1 if estimated from D2 (quasysingular), >=2 in case of failure (undefined or infinite solutions).
") NormEstim;
		static int NormEstim(const opencascade::handle<Geom_Surface> & theSurf, const gp_Pnt2d & theUV, const double theTol, gp_Dir & theNorm);

		/****** GeomLib::RemovePointsFromArray ******/
		/****** md5 signature: 82a6e3dd40b88e7ebd2894bc194e8d40 ******/
		%feature("compactdefaultargs") RemovePointsFromArray;
		%feature("autodoc", "
Parameters
----------
NumPoints: int
InParameters: NCollection_Array1<double>
OutParameters: NCollection_HArray1<double

Return
-------
None

Description
-----------
Warning! This assume that the InParameter is an increasing sequence of real number and it will not check for that: Unpredictable result can happen if this is not satisfied. It is the caller responsibility to check for that property. //! This method makes uniform NumPoints segments S1,...SNumPoints out of the segment defined by the first parameter and the last parameter of the InParameter ; keeps only one point of the InParameters set of parameter in each of the uniform segments taking care of the first and the last parameters. For the ith segment the element of the InParameter is the one that is the first to exceed the midpoint of the segment and to fall before the midpoint of the next segment There will be at the end at most NumPoints + 1 if NumPoints > 2 in the OutParameters Array.
") RemovePointsFromArray;
		static void RemovePointsFromArray(const int NumPoints, const NCollection_Array1<double> & InParameters, opencascade::handle<NCollection_HArray1<double> > & OutParameters);

		/****** GeomLib::SameRange ******/
		/****** md5 signature: 4e0795fefde8c0dd0e660054d814b13e ******/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "
Parameters
----------
Tolerance: double
Curve2dPtr: Geom2d_Curve
First: double
Last: double
RequestedFirst: double
RequestedLast: double
NewCurve2dPtr: Geom2d_Curve

Return
-------
None

Description
-----------
Make the curve Curve2dPtr have the imposed range First to List the most economic way, that is if it can change the range without changing the nature of the curve it will try to do that. Otherwise it will produce a Bspline curve that has the required range.
") SameRange;
		static void SameRange(const double Tolerance, const opencascade::handle<Geom2d_Curve> & Curve2dPtr, const double First, const double Last, const double RequestedFirst, const double RequestedLast, opencascade::handle<Geom2d_Curve> & NewCurve2dPtr);

		/****** GeomLib::To3d ******/
		/****** md5 signature: 78eb89724aa4a24596b24e79e15854e5 ******/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "
Parameters
----------
Position: gp_Ax2
Curve2d: Geom2d_Curve

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the curve 3d from package Geom corresponding to curve 2d from package Geom2d, on the plan defined with the local coordinate system Position.
") To3d;
		static opencascade::handle<Geom_Curve> To3d(const gp_Ax2 & Position, const opencascade::handle<Geom2d_Curve> & Curve2d);

		/****** GeomLib::buildC3dOnIsoLine ******/
		/****** md5 signature: 20778bc2ae78f56c15b560e0233037d4 ******/
		%feature("compactdefaultargs") buildC3dOnIsoLine;
		%feature("autodoc", "
Parameters
----------
theC2D: Adaptor2d_Curve2d
theSurf: Adaptor3d_Surface
theFirst: double
theLast: double
theTolerance: double
theIsU: bool
theParam: double
theIsForward: bool

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Builds 3D curve for a isoline. This method takes corresponding isoline from the input surface. 
Parameter theC2D Trimmed curve to be approximated. 
Parameter theIsU Flag indicating that line is u const. 
Parameter theParam Line parameter. 
Parameter theIsForward Flag indicating forward parameterization on a isoline. 
Return: true when 3d curve is built and false otherwise.
") buildC3dOnIsoLine;
		static opencascade::handle<Geom_Curve> buildC3dOnIsoLine(const opencascade::handle<Adaptor2d_Curve2d> & theC2D, const opencascade::handle<Adaptor3d_Surface> & theSurf, const double theFirst, const double theLast, const double theTolerance, const bool theIsU, const double theParam, const bool theIsForward);

		/****** GeomLib::isIsoLine ******/
		/****** md5 signature: 7f25455933a9e35cc06b55270bf0db08 ******/
		%feature("compactdefaultargs") isIsoLine;
		%feature("autodoc", "
Parameters
----------
theC2D: Adaptor2d_Curve2d

Return
-------
theIsU: bool
theParam: double
theIsForward: bool

Description
-----------
Checks whether the 2d curve is a isoline. It can be represented by b-spline, bezier, or geometric line. This line should have natural parameterization. 
Parameter theC2D Trimmed curve to be checked. 
Parameter theIsU Flag indicating that line is u const. 
Parameter theParam Line parameter. 
Parameter theIsForward Flag indicating forward parameterization on a isoline. 
Return: true when 2d curve is a line and false otherwise.
") isIsoLine;
		static bool isIsoLine(const opencascade::handle<Adaptor2d_Curve2d> & theC2D, Standard_Boolean &OutValue, Standard_Real &OutValue, Standard_Boolean &OutValue);

};


%extend GeomLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomLib_Check2dBSplineCurve *
************************************/
class GeomLib_Check2dBSplineCurve {
	public:
		/****** GeomLib_Check2dBSplineCurve::GeomLib_Check2dBSplineCurve ******/
		/****** md5 signature: 2086dcb04b60f4e9623805ee2ed49ab2 ******/
		%feature("compactdefaultargs") GeomLib_Check2dBSplineCurve;
		%feature("autodoc", "
Parameters
----------
Curve: Geom2d_BSplineCurve
Tolerance: double
AngularTolerance: double

Return
-------
None

Description
-----------
No available documentation.
") GeomLib_Check2dBSplineCurve;
		 GeomLib_Check2dBSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & Curve, const double Tolerance, const double AngularTolerance);

		/****** GeomLib_Check2dBSplineCurve::FixTangent ******/
		/****** md5 signature: d1f6d70e3bbc1c743a622671f42af6f1 ******/
		%feature("compactdefaultargs") FixTangent;
		%feature("autodoc", "
Parameters
----------
FirstFlag: bool
LastFlag: bool

Return
-------
None

Description
-----------
No available documentation.
") FixTangent;
		void FixTangent(const bool FirstFlag, const bool LastFlag);

		/****** GeomLib_Check2dBSplineCurve::FixedTangent ******/
		/****** md5 signature: 89d5b74ed2452b0a1e75a68efe0ec716 ******/
		%feature("compactdefaultargs") FixedTangent;
		%feature("autodoc", "
Parameters
----------
FirstFlag: bool
LastFlag: bool

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
modifies the curve by fixing the first or the last tangencies //! if Index3D not in the Range [1,Nb3dSpaces] if the Approx is not Done.
") FixedTangent;
		opencascade::handle<Geom2d_BSplineCurve> FixedTangent(const bool FirstFlag, const bool LastFlag);

		/****** GeomLib_Check2dBSplineCurve::IsDone ******/
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

		/****** GeomLib_Check2dBSplineCurve::NeedTangentFix ******/
		/****** md5 signature: 42d5b6f4ca1c87c2d0b56088ff6731fd ******/
		%feature("compactdefaultargs") NeedTangentFix;
		%feature("autodoc", "
Parameters
----------

Return
-------
FirstFlag: bool
SecondFlag: bool

Description
-----------
No available documentation.
") NeedTangentFix;
		void NeedTangentFix(Standard_Boolean &OutValue, Standard_Boolean &OutValue);

};


%extend GeomLib_Check2dBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomLib_CheckBSplineCurve *
**********************************/
class GeomLib_CheckBSplineCurve {
	public:
		/****** GeomLib_CheckBSplineCurve::GeomLib_CheckBSplineCurve ******/
		/****** md5 signature: afcc075ce89943f74cefdbad30fe2818 ******/
		%feature("compactdefaultargs") GeomLib_CheckBSplineCurve;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_BSplineCurve
Tolerance: double
AngularTolerance: double

Return
-------
None

Description
-----------
No available documentation.
") GeomLib_CheckBSplineCurve;
		 GeomLib_CheckBSplineCurve(const opencascade::handle<Geom_BSplineCurve> & Curve, const double Tolerance, const double AngularTolerance);

		/****** GeomLib_CheckBSplineCurve::FixTangent ******/
		/****** md5 signature: d1f6d70e3bbc1c743a622671f42af6f1 ******/
		%feature("compactdefaultargs") FixTangent;
		%feature("autodoc", "
Parameters
----------
FirstFlag: bool
LastFlag: bool

Return
-------
None

Description
-----------
No available documentation.
") FixTangent;
		void FixTangent(const bool FirstFlag, const bool LastFlag);

		/****** GeomLib_CheckBSplineCurve::FixedTangent ******/
		/****** md5 signature: 9f4fe33b1502a5ab6efb0e89ac6cc417 ******/
		%feature("compactdefaultargs") FixedTangent;
		%feature("autodoc", "
Parameters
----------
FirstFlag: bool
LastFlag: bool

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
modifies the curve by fixing the first or the last tangencies //! if Index3D not in the Range [1,Nb3dSpaces] if the Approx is not Done.
") FixedTangent;
		opencascade::handle<Geom_BSplineCurve> FixedTangent(const bool FirstFlag, const bool LastFlag);

		/****** GeomLib_CheckBSplineCurve::IsDone ******/
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

		/****** GeomLib_CheckBSplineCurve::NeedTangentFix ******/
		/****** md5 signature: 42d5b6f4ca1c87c2d0b56088ff6731fd ******/
		%feature("compactdefaultargs") NeedTangentFix;
		%feature("autodoc", "
Parameters
----------

Return
-------
FirstFlag: bool
SecondFlag: bool

Description
-----------
No available documentation.
") NeedTangentFix;
		void NeedTangentFix(Standard_Boolean &OutValue, Standard_Boolean &OutValue);

};


%extend GeomLib_CheckBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomLib_CheckCurveOnSurface *
************************************/
class GeomLib_CheckCurveOnSurface {
	public:
		/****** GeomLib_CheckCurveOnSurface::GeomLib_CheckCurveOnSurface ******/
		/****** md5 signature: bb9e9ff784f8d27c9ad7ad4495119f72 ******/
		%feature("compactdefaultargs") GeomLib_CheckCurveOnSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") GeomLib_CheckCurveOnSurface;
		 GeomLib_CheckCurveOnSurface();

		/****** GeomLib_CheckCurveOnSurface::GeomLib_CheckCurveOnSurface ******/
		/****** md5 signature: 32d27de4cb360999daad082b70c9bb41 ******/
		%feature("compactdefaultargs") GeomLib_CheckCurveOnSurface;
		%feature("autodoc", "
Parameters
----------
theCurve: Adaptor3d_Curve
theTolRange: double (optional, default to Precision::PConfusion())

Return
-------
None

Description
-----------
Constructor.
") GeomLib_CheckCurveOnSurface;
		 GeomLib_CheckCurveOnSurface(const opencascade::handle<Adaptor3d_Curve> & theCurve, const double theTolRange = Precision::PConfusion());

		/****** GeomLib_CheckCurveOnSurface::ErrorStatus ******/
		/****** md5 signature: d9fcbadbff0953c639e060241b086dec ******/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns error status The possible values are: 0 - OK; 1 - null curve or surface or 2d curve; 2 - invalid parametric range; 3 - error in calculations.
") ErrorStatus;
		int ErrorStatus();

		/****** GeomLib_CheckCurveOnSurface::Init ******/
		/****** md5 signature: 37e3c3517ec8ba984a815763b73b5c43 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theCurve: Adaptor3d_Curve
theTolRange: double (optional, default to Precision::PConfusion())

Return
-------
None

Description
-----------
Sets the data for the algorithm.
") Init;
		void Init(const opencascade::handle<Adaptor3d_Curve> & theCurve, const double theTolRange = Precision::PConfusion());

		/****** GeomLib_CheckCurveOnSurface::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes all members by default values.
") Init;
		void Init();

		/****** GeomLib_CheckCurveOnSurface::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the max distance has been found.
") IsDone;
		bool IsDone();

		/****** GeomLib_CheckCurveOnSurface::IsParallel ******/
		/****** md5 signature: b5dec32788c4cabf441ea364e8b4616c ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if parallel flag is set.
") IsParallel;
		bool IsParallel();

		/****** GeomLib_CheckCurveOnSurface::MaxDistance ******/
		/****** md5 signature: e99afdda005d648d0eb2efaa1f1e2e1b ******/
		%feature("compactdefaultargs") MaxDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns max distance.
") MaxDistance;
		double MaxDistance();

		/****** GeomLib_CheckCurveOnSurface::MaxParameter ******/
		/****** md5 signature: 6206e00ea5d2de4bb7d2e735b3d64893 ******/
		%feature("compactdefaultargs") MaxParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns parameter in which the distance is maximal.
") MaxParameter;
		double MaxParameter();

		/****** GeomLib_CheckCurveOnSurface::Perform ******/
		/****** md5 signature: c9a9d63797e176cee0499468eb03150c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theCurveOnSurface: Adaptor3d_CurveOnSurface

Return
-------
None

Description
-----------
Computes the max distance for the 3d curve <myCurve> and 2d curve <theCurveOnSurface> If isMultiThread == true then computation will be performed in parallel.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_CurveOnSurface> & theCurveOnSurface);

		/****** GeomLib_CheckCurveOnSurface::SetParallel ******/
		/****** md5 signature: 255bd129e77b56c0dddef79b343deb4b ******/
		%feature("compactdefaultargs") SetParallel;
		%feature("autodoc", "
Parameters
----------
theIsParallel: bool

Return
-------
None

Description
-----------
Sets parallel flag.
") SetParallel;
		void SetParallel(const bool theIsParallel);

};


%extend GeomLib_CheckCurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class GeomLib_DenominatorMultiplier *
**************************************/
class GeomLib_DenominatorMultiplier {
	public:
		/****** GeomLib_DenominatorMultiplier::GeomLib_DenominatorMultiplier ******/
		/****** md5 signature: e770a180f3c8251dbe3bbde7aae57991 ******/
		%feature("compactdefaultargs") GeomLib_DenominatorMultiplier;
		%feature("autodoc", "
Parameters
----------
Surface: Geom_BSplineSurface
KnotVector: NCollection_Array1<double>

Return
-------
None

Description
-----------
if the surface is rational this will define the evaluator of a real function of 2 variables a(u,v) such that if we define a new surface by: a(u,v) * N(u,v) NewF(u,v) = ---------------- a(u,v) * D(u,v).
") GeomLib_DenominatorMultiplier;
		 GeomLib_DenominatorMultiplier(const opencascade::handle<Geom_BSplineSurface> & Surface, const NCollection_Array1<double> & KnotVector);

		/****** GeomLib_DenominatorMultiplier::Value ******/
		/****** md5 signature: 4b9c8272e43a536cbf5b89c3101964d1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
UParameter: double
VParameter: double

Return
-------
double

Description
-----------
Returns the value of a(UParameter,VParameter)= //! H0(UParameter)/Denominator(Umin,Vparameter) //! D Denominator(Umin,Vparameter) - ------------------------------[H1(u)]/(Denominator(Umin,Vparameter)^2) D U //! + H3(UParameter)/Denominator(Umax,Vparameter) //! D Denominator(Umax,Vparameter) - ------------------------------[H2(u)]/(Denominator(Umax,Vparameter)^2) D U.
") Value;
		double Value(const double UParameter, const double VParameter);

};


%extend GeomLib_DenominatorMultiplier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomLib_Interpolate *
****************************/
class GeomLib_Interpolate {
	public:
		/****** GeomLib_Interpolate::GeomLib_Interpolate ******/
		/****** md5 signature: 3bd947fb8557f7828beec046e15ba0a4 ******/
		%feature("compactdefaultargs") GeomLib_Interpolate;
		%feature("autodoc", "
Parameters
----------
Degree: int
NumPoints: int
Points: NCollection_Array1<gp_Pnt>
Parameters: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") GeomLib_Interpolate;
		 GeomLib_Interpolate(const int Degree, const int NumPoints, const NCollection_Array1<gp_Pnt> & Points, const NCollection_Array1<double> & Parameters);

		/****** GeomLib_Interpolate::Curve ******/
		/****** md5 signature: 8f61eb8bebb31bbd1fd75a7da450accd ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
returns the interpolated curve of the requested degree.
") Curve;
		opencascade::handle<Geom_BSplineCurve> Curve();

		/****** GeomLib_Interpolate::Error ******/
		/****** md5 signature: 53080d5e62dd98fe7c343b04a4237efb ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
GeomLib_InterpolationErrors

Description
-----------
returns the error type if any.
") Error;
		GeomLib_InterpolationErrors Error();

		/****** GeomLib_Interpolate::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns if everything went OK.
") IsDone;
		bool IsDone();

};


%extend GeomLib_Interpolate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomLib_IsPlanarSurface *
********************************/
class GeomLib_IsPlanarSurface {
	public:
		/****** GeomLib_IsPlanarSurface::GeomLib_IsPlanarSurface ******/
		/****** md5 signature: 5d2ebeae028dbcdb64cfb2e149b15f34 ******/
		%feature("compactdefaultargs") GeomLib_IsPlanarSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
Tol: double (optional, default to 1.0e-7)

Return
-------
None

Description
-----------
No available documentation.
") GeomLib_IsPlanarSurface;
		 GeomLib_IsPlanarSurface(const opencascade::handle<Geom_Surface> & S, const double Tol = 1.0e-7);

		/****** GeomLib_IsPlanarSurface::IsPlanar ******/
		/****** md5 signature: c03409b1e65292924072df1474949f2b ******/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return if the Surface is a plan.
") IsPlanar;
		bool IsPlanar();

		/****** GeomLib_IsPlanarSurface::Plan ******/
		/****** md5 signature: 8661274665886e6b8fffe3482c12561c ******/
		%feature("compactdefaultargs") Plan;
		%feature("autodoc", "Return
-------
gp_Pln

Description
-----------
Return the plan definition.
") Plan;
		const gp_Pln Plan();

};


%extend GeomLib_IsPlanarSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomLib_LogSample *
**************************/
class GeomLib_LogSample : public math_FunctionSample {
	public:
		/****** GeomLib_LogSample::GeomLib_LogSample ******/
		/****** md5 signature: eebe89f7049d67e40c99207e5055277c ******/
		%feature("compactdefaultargs") GeomLib_LogSample;
		%feature("autodoc", "
Parameters
----------
A: double
B: double
N: int

Return
-------
None

Description
-----------
No available documentation.
") GeomLib_LogSample;
		 GeomLib_LogSample(const double A, const double B, const int N);

		/****** GeomLib_LogSample::GetParameter ******/
		/****** md5 signature: 3430167683107f375473c40d357bd878 ******/
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
Returns the value of parameter of the point of range Index: A + ((Index-1)/(NbPoints-1))*B. An exception is raised if Index<=0 or Index>NbPoints.
") GetParameter;
		double GetParameter(const int Index);

};


%extend GeomLib_LogSample {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomLib_MakeCurvefromApprox *
************************************/
class GeomLib_MakeCurvefromApprox {
	public:
		/****** GeomLib_MakeCurvefromApprox::GeomLib_MakeCurvefromApprox ******/
		/****** md5 signature: c60e5ef4c2db5758751274de0fbd9c5b ******/
		%feature("compactdefaultargs") GeomLib_MakeCurvefromApprox;
		%feature("autodoc", "
Parameters
----------
Approx: AdvApprox_ApproxAFunction

Return
-------
None

Description
-----------
No available documentation.
") GeomLib_MakeCurvefromApprox;
		 GeomLib_MakeCurvefromApprox(const AdvApprox_ApproxAFunction & Approx);

		/****** GeomLib_MakeCurvefromApprox::Curve ******/
		/****** md5 signature: 88d6fe7ef69e6adce262f5f907ce61b2 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
Index3d: int

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
returns a polynomial curve whose poles correspond to the Index3D 3D space if Index3D not in the Range [1,Nb3dSpaces] if the Approx is not Done.
") Curve;
		opencascade::handle<Geom_BSplineCurve> Curve(const int Index3d);

		/****** GeomLib_MakeCurvefromApprox::Curve ******/
		/****** md5 signature: 9ea7f88a2cf0d457c4cd25b9b54278a1 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
Index1D: int
Index3D: int

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
returns a rational curve whose poles correspond to the index3D of the 3D space and whose weights correspond to the index1d 1D space. if Index1D not in the Range [1,Nb1dSpaces] if Index3D not in the Range [1,Nb3dSpaces] if the Approx is not Done.
") Curve;
		opencascade::handle<Geom_BSplineCurve> Curve(const int Index1D, const int Index3D);

		/****** GeomLib_MakeCurvefromApprox::Curve2d ******/
		/****** md5 signature: a0837bd86d2571bd086f42413ddd289b ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
Index2d: int

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
returns a polynomial curve whose poles correspond to the Index2d 2D space if Index2d not in the Range [1,Nb2dSpaces] if the Approx is not Done.
") Curve2d;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d(const int Index2d);

		/****** GeomLib_MakeCurvefromApprox::Curve2d ******/
		/****** md5 signature: b007dc9e9c9d6aad652d52e7c0cfd9a5 ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
Index1d: int
Index2d: int

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
returns a rational curve whose poles correspond to the index2d of the 2D space and whose weights correspond to one dimensional space of index 1d if Index1d not in the Range [1,Nb1dSpaces] if Index2d not in the Range [1,Nb2dSpaces] if the Approx is not Done.
") Curve2d;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d(const int Index1d, const int Index2d);

		/****** GeomLib_MakeCurvefromApprox::Curve2dFromTwo1d ******/
		/****** md5 signature: fb0b7d87df17f9ad0e393009e4d4acae ******/
		%feature("compactdefaultargs") Curve2dFromTwo1d;
		%feature("autodoc", "
Parameters
----------
Index1d: int
Index2d: int

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
returns a 2D curve building it from the 1D curve in x at Index1d and y at Index2d amongst the 1D curves if Index1d not in the Range [1,Nb1dSpaces] if Index2d not in the Range [1,Nb1dSpaces] if the Approx is not Done.
") Curve2dFromTwo1d;
		opencascade::handle<Geom2d_BSplineCurve> Curve2dFromTwo1d(const int Index1d, const int Index2d);

		/****** GeomLib_MakeCurvefromApprox::IsDone ******/
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

		/****** GeomLib_MakeCurvefromApprox::Nb1DSpaces ******/
		/****** md5 signature: 92d314fd58d78e85bc210067825e2003 ******/
		%feature("compactdefaultargs") Nb1DSpaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of 1D spaces of the Approx.
") Nb1DSpaces;
		int Nb1DSpaces();

		/****** GeomLib_MakeCurvefromApprox::Nb2DSpaces ******/
		/****** md5 signature: 3403625a6e99a1382bdc6db66a77c259 ******/
		%feature("compactdefaultargs") Nb2DSpaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of 3D spaces of the Approx.
") Nb2DSpaces;
		int Nb2DSpaces();

		/****** GeomLib_MakeCurvefromApprox::Nb3DSpaces ******/
		/****** md5 signature: 628b85193aefde1ea0f2170349714373 ******/
		%feature("compactdefaultargs") Nb3DSpaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of 3D spaces of the Approx.
") Nb3DSpaces;
		int Nb3DSpaces();

};


%extend GeomLib_MakeCurvefromApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GeomLib_PolyFunc *
*************************/
class GeomLib_PolyFunc : public math_FunctionWithDerivative {
	public:
		/****** GeomLib_PolyFunc::GeomLib_PolyFunc ******/
		/****** md5 signature: 1f1b47ba96c9af6c23cce7ddb96d7c9e ******/
		%feature("compactdefaultargs") GeomLib_PolyFunc;
		%feature("autodoc", "
Parameters
----------
Coeffs: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") GeomLib_PolyFunc;
		 GeomLib_PolyFunc(const math_Vector & Coeffs);

		/****** GeomLib_PolyFunc::Derivative ******/
		/****** md5 signature: 5b661e723f14c67a734d7bc68bb6cabf ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
D: double

Description
-----------
computes the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Derivative;
		bool Derivative(const double X, Standard_Real &OutValue);

		/****** GeomLib_PolyFunc::Value ******/
		/****** md5 signature: 2fdd0f48acb4882f76bbbe432a18ac3a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double

Description
-----------
computes the value <F>of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Value;
		bool Value(const double X, Standard_Real &OutValue);

		/****** GeomLib_PolyFunc::Values ******/
		/****** md5 signature: 44ea1ebbd1c996779e93f28435817e28 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double

Description
-----------
computes the value <F> and the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Values;
		bool Values(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend GeomLib_PolyFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class GeomLib_Tool *
*********************/
class GeomLib_Tool {
	public:
		/****** GeomLib_Tool::ComputeDeviation ******/
		/****** md5 signature: 9063019abecc56b314a461bd2f8251b6 ******/
		%feature("compactdefaultargs") ComputeDeviation;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2dAdaptor_Curve
theFPar: double
theLPar: double
theStartParameter: double
theNbIters: int (optional, default to 100)
thePrmOnCurve: double * (optional, default to nullptr)
thePtOnCurve: gp_Pnt2d * (optional, default to nullptr)
theVecCurvLine: gp_Vec2d * (optional, default to nullptr)
theLine: gp_Lin2d * (optional, default to nullptr)

Return
-------
double

Description
-----------
Computes parameter in theCurve (*thePrmOnCurve) where maximal deviation between theCurve and the linear segment joining its points with the parameters theFPar and theLPar is obtained. Returns the (positive) value of deviation. Returns negative value if the deviation cannot be computed. The returned parameter (in case of successful) will always be in the range [theFPar, theLPar]. Iterative method is used for computation. So, theStartParameter is needed to be set. Recommend value of theStartParameter can be found with the overloaded method. Additionally, following values can be returned (optionally): 
Parameter thePtOnCurve - the point on curve where maximal deviation is achieved; 
Parameter thePrmOnCurve - the parameter of thePtOnCurve; 
Parameter theVecCurvLine - the vector along which is computed (this vector is always  perpendicular theLine); 
Parameter theLine - the linear segment joining the point of theCurve having parameters theFPar and theLPar.
") ComputeDeviation;
		static double ComputeDeviation(const Geom2dAdaptor_Curve & theCurve, const double theFPar, const double theLPar, const double theStartParameter, const int theNbIters = 100, double * const thePrmOnCurve = nullptr, gp_Pnt2d * const thePtOnCurve = nullptr, gp_Vec2d * const theVecCurvLine = nullptr, gp_Lin2d * const theLine = nullptr);

		/****** GeomLib_Tool::ComputeDeviation ******/
		/****** md5 signature: 69ce88d7a1cc10d9ffb6d2e7549cde46 ******/
		%feature("compactdefaultargs") ComputeDeviation;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2dAdaptor_Curve
theFPar: double
theLPar: double
theNbSubIntervals: int
theNbIters: int (optional, default to 10)
thePrmOnCurve: double * (optional, default to nullptr)

Return
-------
double

Description
-----------
Computes parameter in theCurve (*thePrmOnCurve) where maximal deviation between theCurve and the linear segment joining its points with the parameters theFPar and theLPar is obtained. Returns the (positive) value of deviation. Returns negative value if the deviation cannot be computed. The returned parameter (in case of successful) will always be in the range [theFPar, theLPar]. theNbSubIntervals defines discretization of the given interval [theFPar, theLPar] to provide better search condition. This value should be chosen taking into account complexity of the curve in considered interval. E.g. if there are many oscillations of the curve in the interval then theNbSubIntervals mus be great number. However, the greater value of theNbSubIntervals the slower the algorithm will compute. theNbIters sets number of iterations. ATTENTION!!! This algorithm cannot compute deviation precisely (so, there is no point in setting big value of theNbIters). But it can give some start point for the overloaded method.
") ComputeDeviation;
		static double ComputeDeviation(const Geom2dAdaptor_Curve & theCurve, const double theFPar, const double theLPar, const int theNbSubIntervals, const int theNbIters = 10, double * const thePrmOnCurve = nullptr);

		/****** GeomLib_Tool::Parameter ******/
		/****** md5 signature: 85c8b8303e1b74f220a379cb22edea3b ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_Curve
Point: gp_Pnt
MaxDist: double

Return
-------
U: double

Description
-----------
Extracts the parameter of a 3D point lying on a 3D curve or at a distance less than the MaxDist value.
") Parameter;
		static bool Parameter(const opencascade::handle<Geom_Curve> & Curve, const gp_Pnt & Point, const double MaxDist, Standard_Real &OutValue);

		/****** GeomLib_Tool::Parameter ******/
		/****** md5 signature: fa0916740a8bf54249b4dcb58550b073 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Curve: Geom2d_Curve
Point: gp_Pnt2d
MaxDist: double

Return
-------
U: double

Description
-----------
Extracts the parameter of a 2D point lying on a 2D curve or at a distance less than the MaxDist value.
") Parameter;
		static bool Parameter(const opencascade::handle<Geom2d_Curve> & Curve, const gp_Pnt2d & Point, const double MaxDist, Standard_Real &OutValue);

		/****** GeomLib_Tool::Parameters ******/
		/****** md5 signature: db5016517687a40d61ae9c6d9942a200 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Surface: Geom_Surface
Point: gp_Pnt
MaxDist: double

Return
-------
U: double
V: double

Description
-----------
Extracts the parameter of a 3D point lying on a surface or at a distance less than the MaxDist value.
") Parameters;
		static bool Parameters(const opencascade::handle<Geom_Surface> & Surface, const gp_Pnt & Point, const double MaxDist, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend GeomLib_Tool {
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
def geomlib_AdjustExtremity(*args):
	return geomlib.AdjustExtremity(*args)

@deprecated
def geomlib_AxeOfInertia(*args):
	return geomlib.AxeOfInertia(*args)

@deprecated
def geomlib_BuildCurve3d(*args):
	return geomlib.BuildCurve3d(*args)

@deprecated
def geomlib_CancelDenominatorDerivative(*args):
	return geomlib.CancelDenominatorDerivative(*args)

@deprecated
def geomlib_DensifyArray1OfReal(*args):
	return geomlib.DensifyArray1OfReal(*args)

@deprecated
def geomlib_EvalMaxDistanceAlongParameter(*args):
	return geomlib.EvalMaxDistanceAlongParameter(*args)

@deprecated
def geomlib_EvalMaxParametricDistance(*args):
	return geomlib.EvalMaxParametricDistance(*args)

@deprecated
def geomlib_ExtendCurveToPoint(*args):
	return geomlib.ExtendCurveToPoint(*args)

@deprecated
def geomlib_ExtendSurfByLength(*args):
	return geomlib.ExtendSurfByLength(*args)

@deprecated
def geomlib_FuseIntervals(*args):
	return geomlib.FuseIntervals(*args)

@deprecated
def geomlib_GTransform(*args):
	return geomlib.GTransform(*args)

@deprecated
def geomlib_Inertia(*args):
	return geomlib.Inertia(*args)

@deprecated
def geomlib_IsBSplUClosed(*args):
	return geomlib.IsBSplUClosed(*args)

@deprecated
def geomlib_IsBSplVClosed(*args):
	return geomlib.IsBSplVClosed(*args)

@deprecated
def geomlib_IsBzUClosed(*args):
	return geomlib.IsBzUClosed(*args)

@deprecated
def geomlib_IsBzVClosed(*args):
	return geomlib.IsBzVClosed(*args)

@deprecated
def geomlib_IsClosed(*args):
	return geomlib.IsClosed(*args)

@deprecated
def geomlib_NormEstim(*args):
	return geomlib.NormEstim(*args)

@deprecated
def geomlib_RemovePointsFromArray(*args):
	return geomlib.RemovePointsFromArray(*args)

@deprecated
def geomlib_SameRange(*args):
	return geomlib.SameRange(*args)

@deprecated
def geomlib_To3d(*args):
	return geomlib.To3d(*args)

@deprecated
def geomlib_buildC3dOnIsoLine(*args):
	return geomlib.buildC3dOnIsoLine(*args)

@deprecated
def geomlib_isIsoLine(*args):
	return geomlib.isIsoLine(*args)

@deprecated
def GeomLib_Tool_ComputeDeviation(*args):
	return GeomLib_Tool.ComputeDeviation(*args)

@deprecated
def GeomLib_Tool_ComputeDeviation(*args):
	return GeomLib_Tool.ComputeDeviation(*args)

@deprecated
def GeomLib_Tool_Parameter(*args):
	return GeomLib_Tool.Parameter(*args)

@deprecated
def GeomLib_Tool_Parameter(*args):
	return GeomLib_Tool.Parameter(*args)

@deprecated
def GeomLib_Tool_Parameters(*args):
	return GeomLib_Tool.Parameters(*args)

}
