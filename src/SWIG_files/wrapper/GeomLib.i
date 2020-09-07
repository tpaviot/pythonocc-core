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
%define GEOMLIBDOCSTRING
"GeomLib module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geomlib.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<GeomLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<Geom2d_module.hxx>
#include<math_module.hxx>
#include<AdvApprox_module.hxx>
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
%import TColgp.i
%import Adaptor3d.i
%import GeomAbs.i
%import TColStd.i
%import Geom2d.i
%import math.i
%import AdvApprox.i

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

/* python proy classes for enums */
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

%extend NCollection_Array1<gp_Mat> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<gp_Mat> GeomLib_Array1OfMat;
typedef GeomLib_DenominatorMultiplier * GeomLib_DenominatorMultiplierPtr;
/* end typedefs declaration */

/****************
* class GeomLib *
****************/
%rename(geomlib) GeomLib;
class GeomLib {
	public:
		/****************** AdjustExtremity ******************/
		/**** md5 signature: 9a3ee1a8642d7491cdc212f08decd57b ****/
		%feature("compactdefaultargs") AdjustExtremity;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve: Geom_BoundedCurve
P1: gp_Pnt
P2: gp_Pnt
T1: gp_Vec
T2: gp_Vec

Returns
-------
None
") AdjustExtremity;
		static void AdjustExtremity(opencascade::handle<Geom_BoundedCurve> & Curve, const gp_Pnt & P1, const gp_Pnt & P2, const gp_Vec & T1, const gp_Vec & T2);

		/****************** AxeOfInertia ******************/
		/**** md5 signature: d1005fa9351323938f45502f282f13ad ****/
		%feature("compactdefaultargs") AxeOfInertia;
		%feature("autodoc", "Compute axes of inertia, of some points -- -- -- <axe>.location() is the barycentre -- -- -- -- -- <axe>.xdirection is the axe of upper inertia -- -- -- -- <axe>.direction is the normal to the average plane -- -- -- issingular is true if points are on line -- tol is used to determine singular cases.

Parameters
----------
Points: TColgp_Array1OfPnt
Axe: gp_Ax2
Tol: float,optional
	default value is 1.0e-7

Returns
-------
IsSingular: bool
") AxeOfInertia;
		static void AxeOfInertia(const TColgp_Array1OfPnt & Points, gp_Ax2 & Axe, Standard_Boolean &OutValue, const Standard_Real Tol = 1.0e-7);

		/****************** BuildCurve3d ******************/
		/**** md5 signature: 83a1a963be2cecc38bea1c9d7b4cd7f1 ****/
		%feature("compactdefaultargs") BuildCurve3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: float
CurvePtr: Adaptor3d_CurveOnSurface
FirstParameter: float
LastParameter: float
NewCurvePtr: Geom_Curve
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1
MaxDegree: int,optional
	default value is 14
MaxSegment: int,optional
	default value is 30

Returns
-------
MaxDeviation: float
AverageDeviation: float
") BuildCurve3d;
		static void BuildCurve3d(const Standard_Real Tolerance, Adaptor3d_CurveOnSurface & CurvePtr, const Standard_Real FirstParameter, const Standard_Real LastParameter, opencascade::handle<Geom_Curve> & NewCurvePtr, Standard_Real &OutValue, Standard_Real &OutValue, const GeomAbs_Shape Continuity = GeomAbs_C1, const Standard_Integer MaxDegree = 14, const Standard_Integer MaxSegment = 30);

		/****************** CancelDenominatorDerivative ******************/
		/**** md5 signature: b1394cc1fa88b83b1e70a1006cce9d30 ****/
		%feature("compactdefaultargs") CancelDenominatorDerivative;
		%feature("autodoc", "Cancel,on the boudaries,the denominator first derivative in the directions wished by the user and set its value to 1.

Parameters
----------
BSurf: Geom_BSplineSurface
UDirection: bool
VDirection: bool

Returns
-------
None
") CancelDenominatorDerivative;
		static void CancelDenominatorDerivative(opencascade::handle<Geom_BSplineSurface> & BSurf, const Standard_Boolean UDirection, const Standard_Boolean VDirection);

		/****************** DensifyArray1OfReal ******************/
		/**** md5 signature: 43f11ff73c38c46e4086373efbc332b9 ****/
		%feature("compactdefaultargs") DensifyArray1OfReal;
		%feature("autodoc", "This makes sure that there is at least minnumpoints in outparameters taking into account the parameters in the inparameters array provided those are in order, that is the sequence of real in the inparameter is strictly non decreasing.

Parameters
----------
MinNumPoints: int
InParameters: TColStd_Array1OfReal
OutParameters: TColStd_HArray1OfReal

Returns
-------
None
") DensifyArray1OfReal;
		static void DensifyArray1OfReal(const Standard_Integer MinNumPoints, const TColStd_Array1OfReal & InParameters, opencascade::handle<TColStd_HArray1OfReal> & OutParameters);

		/****************** EvalMaxDistanceAlongParameter ******************/
		/**** md5 signature: de42bb38ce6c9358ba871ec80228c62c ****/
		%feature("compactdefaultargs") EvalMaxDistanceAlongParameter;
		%feature("autodoc", "This will compute the maximum distancef at the parameters given in the parameters array by projecting from the curve to the reference curve and taking the minimum distance than the maximum will be taken on those minimas.

Parameters
----------
Curve: Adaptor3d_Curve
AReferenceCurve: Adaptor3d_Curve
Tolerance: float
Parameters: TColStd_Array1OfReal

Returns
-------
MaxDistance: float
") EvalMaxDistanceAlongParameter;
		static void EvalMaxDistanceAlongParameter(const Adaptor3d_Curve & Curve, const Adaptor3d_Curve & AReferenceCurve, const Standard_Real Tolerance, const TColStd_Array1OfReal & Parameters, Standard_Real &OutValue);

		/****************** EvalMaxParametricDistance ******************/
		/**** md5 signature: 61958b9521312ed5aa01cd3d4a2eb797 ****/
		%feature("compactdefaultargs") EvalMaxParametricDistance;
		%feature("autodoc", "This will compute the maximum distance at the parameters given in the parameters array by evaluating each parameter the two curves and taking the maximum of the evaluated distance.

Parameters
----------
Curve: Adaptor3d_Curve
AReferenceCurve: Adaptor3d_Curve
Tolerance: float
Parameters: TColStd_Array1OfReal

Returns
-------
MaxDistance: float
") EvalMaxParametricDistance;
		static void EvalMaxParametricDistance(const Adaptor3d_Curve & Curve, const Adaptor3d_Curve & AReferenceCurve, const Standard_Real Tolerance, const TColStd_Array1OfReal & Parameters, Standard_Real &OutValue);

		/****************** ExtendCurveToPoint ******************/
		/**** md5 signature: da917893f09b866ded14d5fbb4b8b091 ****/
		%feature("compactdefaultargs") ExtendCurveToPoint;
		%feature("autodoc", "Extends the bounded curve curve to the point point. the extension is built: - at the end of the curve if after equals true, or - at the beginning of the curve if after equals false. the extension is performed according to a degree of continuity equal to cont, which in its turn must be equal to 1, 2 or 3. this function converts the bounded curve curve into a bspline curve. warning - nothing is done, and curve is not modified if cont is not equal to 1, 2 or 3. - it is recommended that the extension should not be too large with respect to the size of the bounded curve curve: point must not be located too far from one of the extremities of curve.

Parameters
----------
Curve: Geom_BoundedCurve
Point: gp_Pnt
Cont: int
After: bool

Returns
-------
None
") ExtendCurveToPoint;
		static void ExtendCurveToPoint(opencascade::handle<Geom_BoundedCurve> & Curve, const gp_Pnt & Point, const Standard_Integer Cont, const Standard_Boolean After);

		/****************** ExtendSurfByLength ******************/
		/**** md5 signature: b0a546ee9afa07835a329d655769cce9 ****/
		%feature("compactdefaultargs") ExtendSurfByLength;
		%feature("autodoc", "Extends the bounded surface surf along one of its boundaries. the chord length of the extension is equal to length. the direction of the extension is given as: - the u parametric direction of surf, if inu equals true, or - the v parametric direction of surf, if inu equals false. in this parametric direction, the extension is built on the side of: - the last parameter of surf, if after equals true, or - the first parameter of surf, if after equals false. the extension is performed according to a degree of continuity equal to cont, which in its turn must be equal to 1, 2 or 3. this function converts the bounded surface surf into a bspline surface. warning - nothing is done, and surf is not modified if cont is not equal to 1, 2 or 3. - it is recommended that length, the size of the extension should not be too large with respect to the size of the bounded surface surf. - surf must not be a periodic bspline surface in the parametric direction corresponding to the direction of extension.

Parameters
----------
Surf: Geom_BoundedSurface
Length: float
Cont: int
InU: bool
After: bool

Returns
-------
None
") ExtendSurfByLength;
		static void ExtendSurfByLength(opencascade::handle<Geom_BoundedSurface> & Surf, const Standard_Real Length, const Standard_Integer Cont, const Standard_Boolean InU, const Standard_Boolean After);

		/****************** FuseIntervals ******************/
		/**** md5 signature: 0d91d2f1d60affb87ae86c35953c3655 ****/
		%feature("compactdefaultargs") FuseIntervals;
		%feature("autodoc", "No available documentation.

Parameters
----------
Interval1: TColStd_Array1OfReal
Interval2: TColStd_Array1OfReal
Fusion: TColStd_SequenceOfReal
Confusion: float,optional
	default value is 1.0e-9

Returns
-------
None
") FuseIntervals;
		static void FuseIntervals(const TColStd_Array1OfReal & Interval1, const TColStd_Array1OfReal & Interval2, TColStd_SequenceOfReal & Fusion, const Standard_Real Confusion = 1.0e-9);

		/****************** GTransform ******************/
		/**** md5 signature: 8e793303845ac7edd4a76bb5abc12d5f ****/
		%feature("compactdefaultargs") GTransform;
		%feature("autodoc", "Computes the curve 3d from package geom corresponding to the curve 3d from package geom, transformed with the transformation <gtrsf> warning : this method may return a null handle if it's impossible to compute the transformation of a curve. it's not implemented when : 1) the curve is an infinite parabola or hyperbola 2) the curve is an offsetcurve.

Parameters
----------
Curve: Geom2d_Curve
GTrsf: gp_GTrsf2d

Returns
-------
opencascade::handle<Geom2d_Curve>
") GTransform;
		static opencascade::handle<Geom2d_Curve> GTransform(const opencascade::handle<Geom2d_Curve> & Curve, const gp_GTrsf2d & GTrsf);

		/****************** Inertia ******************/
		/**** md5 signature: 0cfbab9df00372ef7059361fbb0e5866 ****/
		%feature("compactdefaultargs") Inertia;
		%feature("autodoc", "Compute principale axes of inertia, and dispertion value of some points.

Parameters
----------
Points: TColgp_Array1OfPnt
Bary: gp_Pnt
XDir: gp_Dir
YDir: gp_Dir

Returns
-------
Xgap: float
YGap: float
ZGap: float
") Inertia;
		static void Inertia(const TColgp_Array1OfPnt & Points, gp_Pnt & Bary, gp_Dir & XDir, gp_Dir & YDir, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsBSplUClosed ******************/
		/**** md5 signature: ff53cf2ed314b37ae0c8810e5f20c1db ****/
		%feature("compactdefaultargs") IsBSplUClosed;
		%feature("autodoc", "Returns true if the poles of u1 isoline and the poles of u2 isoline of surface are identical according to tolerance criterion. for rational surfaces weights(i)*poles(i) are checked.

Parameters
----------
S: Geom_BSplineSurface
U1: float
U2: float
Tol: float

Returns
-------
bool
") IsBSplUClosed;
		static Standard_Boolean IsBSplUClosed(const opencascade::handle<Geom_BSplineSurface> & S, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol);

		/****************** IsBSplVClosed ******************/
		/**** md5 signature: 27d3f9e218ca02cb67fbe5765b1e6e4d ****/
		%feature("compactdefaultargs") IsBSplVClosed;
		%feature("autodoc", "Returns true if the poles of v1 isoline and the poles of v2 isoline of surface are identical according to tolerance criterion. for rational surfaces weights(i)*poles(i) are checked.

Parameters
----------
S: Geom_BSplineSurface
V1: float
V2: float
Tol: float

Returns
-------
bool
") IsBSplVClosed;
		static Standard_Boolean IsBSplVClosed(const opencascade::handle<Geom_BSplineSurface> & S, const Standard_Real V1, const Standard_Real V2, const Standard_Real Tol);

		/****************** IsBzUClosed ******************/
		/**** md5 signature: 622a3ffc08d564a3d521505e9171bf7b ****/
		%feature("compactdefaultargs") IsBzUClosed;
		%feature("autodoc", "Returns true if the poles of u1 isoline and the poles of u2 isoline of surface are identical according to tolerance criterion.

Parameters
----------
S: Geom_BezierSurface
U1: float
U2: float
Tol: float

Returns
-------
bool
") IsBzUClosed;
		static Standard_Boolean IsBzUClosed(const opencascade::handle<Geom_BezierSurface> & S, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol);

		/****************** IsBzVClosed ******************/
		/**** md5 signature: f3942c28915b201c6d1f21053e42bc4a ****/
		%feature("compactdefaultargs") IsBzVClosed;
		%feature("autodoc", "Returns true if the poles of v1 isoline and the poles of v2 isoline of surface are identical according to tolerance criterion.

Parameters
----------
S: Geom_BezierSurface
V1: float
V2: float
Tol: float

Returns
-------
bool
") IsBzVClosed;
		static Standard_Boolean IsBzVClosed(const opencascade::handle<Geom_BezierSurface> & S, const Standard_Real V1, const Standard_Real V2, const Standard_Real Tol);

		/****************** IsClosed ******************/
		/**** md5 signature: 9d1b9e6c496f79dac31915c0b30131a1 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "This method defines if opposite boundaries of surface coincide with given tolerance.

Parameters
----------
S: Geom_Surface
Tol: float

Returns
-------
isUClosed: bool
isVClosed: bool
") IsClosed;
		static void IsClosed(const opencascade::handle<Geom_Surface> & S, const Standard_Real Tol, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** NormEstim ******************/
		/**** md5 signature: 6d05db75f095f2ef4b602f081da51ac2 ****/
		%feature("compactdefaultargs") NormEstim;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Surface
UV: gp_Pnt2d
Tol: float
N: gp_Dir

Returns
-------
int
") NormEstim;
		static Standard_Integer NormEstim(const opencascade::handle<Geom_Surface> & S, const gp_Pnt2d & UV, const Standard_Real Tol, gp_Dir & N);

		/****************** RemovePointsFromArray ******************/
		/**** md5 signature: 8ab10cabc9f24666f30aef7fc0f14871 ****/
		%feature("compactdefaultargs") RemovePointsFromArray;
		%feature("autodoc", "Warning! this assume that the inparameter is an increasing sequence of real number and it will not check for that : unpredictable result can happen if this is not satisfied. it is the caller responsability to check for that property. //! this method makes uniform numpoints segments s1,...snumpoints out of the segment defined by the first parameter and the last parameter ofthe inparameter ; keeps only one point of the inparameters set of parameter in each of the uniform segments taking care of the first and the last parameters. for the ith segment the element of the inparameter is the one that is the first to exceed the midpoint of the segment and to fall before the midpoint of the next segment there will be at the end at most numpoints + 1 if numpoints > 2 in the outparameters array.

Parameters
----------
NumPoints: int
InParameters: TColStd_Array1OfReal
OutParameters: TColStd_HArray1OfReal

Returns
-------
None
") RemovePointsFromArray;
		static void RemovePointsFromArray(const Standard_Integer NumPoints, const TColStd_Array1OfReal & InParameters, opencascade::handle<TColStd_HArray1OfReal> & OutParameters);

		/****************** SameRange ******************/
		/**** md5 signature: 5224cc3d504836cd2430879e51a366ed ****/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "Make the curve curve2dptr have the imposed range first to list the most economic way, that is if it can change the range without changing the nature of the curve it will try to do that. otherwise it will produce a bspline curve that has the required range.

Parameters
----------
Tolerance: float
Curve2dPtr: Geom2d_Curve
First: float
Last: float
RequestedFirst: float
RequestedLast: float
NewCurve2dPtr: Geom2d_Curve

Returns
-------
None
") SameRange;
		static void SameRange(const Standard_Real Tolerance, const opencascade::handle<Geom2d_Curve> & Curve2dPtr, const Standard_Real First, const Standard_Real Last, const Standard_Real RequestedFirst, const Standard_Real RequestedLast, opencascade::handle<Geom2d_Curve> & NewCurve2dPtr);

		/****************** To3d ******************/
		/**** md5 signature: 78eb89724aa4a24596b24e79e15854e5 ****/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "Computes the curve 3d from package geom corresponding to curve 2d from package geom2d, on the plan defined with the local coordinate system position.

Parameters
----------
Position: gp_Ax2
Curve2d: Geom2d_Curve

Returns
-------
opencascade::handle<Geom_Curve>
") To3d;
		static opencascade::handle<Geom_Curve> To3d(const gp_Ax2 & Position, const opencascade::handle<Geom2d_Curve> & Curve2d);

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
		/****************** GeomLib_Check2dBSplineCurve ******************/
		/**** md5 signature: e40a7c98ea15f40179291778f21678d8 ****/
		%feature("compactdefaultargs") GeomLib_Check2dBSplineCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve: Geom2d_BSplineCurve
Tolerance: float
AngularTolerance: float

Returns
-------
None
") GeomLib_Check2dBSplineCurve;
		 GeomLib_Check2dBSplineCurve(const opencascade::handle<Geom2d_BSplineCurve> & Curve, const Standard_Real Tolerance, const Standard_Real AngularTolerance);

		/****************** FixTangent ******************/
		/**** md5 signature: aba9c8b737c142e5e7fde1f0d372589b ****/
		%feature("compactdefaultargs") FixTangent;
		%feature("autodoc", "No available documentation.

Parameters
----------
FirstFlag: bool
LastFlag: bool

Returns
-------
None
") FixTangent;
		void FixTangent(const Standard_Boolean FirstFlag, const Standard_Boolean LastFlag);

		/****************** FixedTangent ******************/
		/**** md5 signature: 5dc05cb83b7c97b49b407c4343893b91 ****/
		%feature("compactdefaultargs") FixedTangent;
		%feature("autodoc", "Modifies the curve by fixing the first or the last tangencies //! if index3d not in the range [1,nb3dspaces] if the approx is not done.

Parameters
----------
FirstFlag: bool
LastFlag: bool

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") FixedTangent;
		opencascade::handle<Geom2d_BSplineCurve> FixedTangent(const Standard_Boolean FirstFlag, const Standard_Boolean LastFlag);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NeedTangentFix ******************/
		/**** md5 signature: 13f77634737df6d7a42a0d49fb74f641 ****/
		%feature("compactdefaultargs") NeedTangentFix;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
FirstFlag: bool
SecondFlag: bool
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
		/****************** GeomLib_CheckBSplineCurve ******************/
		/**** md5 signature: 9f45243dc9a3f3b8ce0bef4793d52f9f ****/
		%feature("compactdefaultargs") GeomLib_CheckBSplineCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve: Geom_BSplineCurve
Tolerance: float
AngularTolerance: float

Returns
-------
None
") GeomLib_CheckBSplineCurve;
		 GeomLib_CheckBSplineCurve(const opencascade::handle<Geom_BSplineCurve> & Curve, const Standard_Real Tolerance, const Standard_Real AngularTolerance);

		/****************** FixTangent ******************/
		/**** md5 signature: aba9c8b737c142e5e7fde1f0d372589b ****/
		%feature("compactdefaultargs") FixTangent;
		%feature("autodoc", "No available documentation.

Parameters
----------
FirstFlag: bool
LastFlag: bool

Returns
-------
None
") FixTangent;
		void FixTangent(const Standard_Boolean FirstFlag, const Standard_Boolean LastFlag);

		/****************** FixedTangent ******************/
		/**** md5 signature: ed8852a7619ceea7dcb33d8ad51d6808 ****/
		%feature("compactdefaultargs") FixedTangent;
		%feature("autodoc", "Modifies the curve by fixing the first or the last tangencies //! if index3d not in the range [1,nb3dspaces] if the approx is not done.

Parameters
----------
FirstFlag: bool
LastFlag: bool

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") FixedTangent;
		opencascade::handle<Geom_BSplineCurve> FixedTangent(const Standard_Boolean FirstFlag, const Standard_Boolean LastFlag);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NeedTangentFix ******************/
		/**** md5 signature: 13f77634737df6d7a42a0d49fb74f641 ****/
		%feature("compactdefaultargs") NeedTangentFix;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
FirstFlag: bool
SecondFlag: bool
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
		/****************** GeomLib_CheckCurveOnSurface ******************/
		/**** md5 signature: f411d7e872ddc970370879b04bbfec4d ****/
		%feature("compactdefaultargs") GeomLib_CheckCurveOnSurface;
		%feature("autodoc", "Default contructor.

Returns
-------
None
") GeomLib_CheckCurveOnSurface;
		 GeomLib_CheckCurveOnSurface();

		/****************** GeomLib_CheckCurveOnSurface ******************/
		/**** md5 signature: e25f5931a8aee45fd8e054ead1cdb2e5 ****/
		%feature("compactdefaultargs") GeomLib_CheckCurveOnSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
theCurve: Geom_Curve
theSurface: Geom_Surface
theFirst: float
theLast: float
theTolRange: float,optional
	default value is Precision::PConfusion()

Returns
-------
None
") GeomLib_CheckCurveOnSurface;
		 GeomLib_CheckCurveOnSurface(const opencascade::handle<Geom_Curve> & theCurve, const opencascade::handle<Geom_Surface> & theSurface, const Standard_Real theFirst, const Standard_Real theLast, const Standard_Real theTolRange = Precision::PConfusion());

		/****************** Curve ******************/
		/**** md5 signature: 62a16889fb975efa1b2de012099c169b ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns my3dcurve.

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****************** ErrorStatus ******************/
		/**** md5 signature: 23ccaf4f25108c0b871675cdf964cbf6 ****/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Returns error status the possible values are: 0 - ok; 1 - null curve or surface or 2d curve; 2 - invalid parametric range; 3 - error in calculations.

Returns
-------
int
") ErrorStatus;
		Standard_Integer ErrorStatus();

		/****************** Init ******************/
		/**** md5 signature: d34b6f83c0750724e05b69368151cd50 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Sets the data for the algorithm.

Parameters
----------
theCurve: Geom_Curve
theSurface: Geom_Surface
theFirst: float
theLast: float
theTolRange: float,optional
	default value is Precision::PConfusion()

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & theCurve, const opencascade::handle<Geom_Surface> & theSurface, const Standard_Real theFirst, const Standard_Real theLast, const Standard_Real theTolRange = Precision::PConfusion());

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes all members by dafault values.

Returns
-------
None
") Init;
		void Init();

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the max distance has been found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxDistance ******************/
		/**** md5 signature: eb56c1d1489e07dddfaf89c1bd00ff56 ****/
		%feature("compactdefaultargs") MaxDistance;
		%feature("autodoc", "Returns max distance.

Returns
-------
float
") MaxDistance;
		Standard_Real MaxDistance();

		/****************** MaxParameter ******************/
		/**** md5 signature: 23a45560d6d0376bf4b799705df1e0c0 ****/
		%feature("compactdefaultargs") MaxParameter;
		%feature("autodoc", "Returns parameter in which the distance is maximal.

Returns
-------
float
") MaxParameter;
		Standard_Real MaxParameter();

		/****************** Perform ******************/
		/**** md5 signature: c060bcfa81d9cdd3f37c79b90b7dee75 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the max distance for the 3d curve <mycurve> and 2d curve <thepcurve> if isthemultytheaddisabled == true then computation will be made without any parallelization.

Parameters
----------
thePCurve: Geom2d_Curve
isTheMultyTheradDisabled: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom2d_Curve> & thePCurve, const Standard_Boolean isTheMultyTheradDisabled = Standard_False);

		/****************** Range ******************/
		/**** md5 signature: d6d291eeedf26e22d25b030eceff7dfa ****/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Returns first and last parameter of the curves (2d- and 3d-curves are considered to have same range).

Parameters
----------

Returns
-------
theFirst: float
theLast: float
") Range;
		void Range(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Surface ******************/
		/**** md5 signature: 3aa31a6d63da8a25f018cf96599c0928 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns mysurface.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

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
		/****************** GeomLib_DenominatorMultiplier ******************/
		/**** md5 signature: 73e22a819881cb9911d7705448642fd5 ****/
		%feature("compactdefaultargs") GeomLib_DenominatorMultiplier;
		%feature("autodoc", "If the surface is rational this will define the evaluator of a real function of 2 variables a(u,v) such that if we define a new surface by : a(u,v) * n(u,v) newf(u,v) = ---------------- a(u,v) * d(u,v).

Parameters
----------
Surface: Geom_BSplineSurface
KnotVector: TColStd_Array1OfReal

Returns
-------
None
") GeomLib_DenominatorMultiplier;
		 GeomLib_DenominatorMultiplier(const opencascade::handle<Geom_BSplineSurface> & Surface, const TColStd_Array1OfReal & KnotVector);

		/****************** Value ******************/
		/**** md5 signature: 0339676d276c5c3d31d1d9d2fc252cf7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of a(uparameter,vparameter)= //! h0(uparameter)/denominator(umin,vparameter) //! d denominator(umin,vparameter) - ------------------------------[h1(u)]/(denominator(umin,vparameter)^2) d u //! + h3(uparameter)/denominator(umax,vparameter) //! d denominator(umax,vparameter) - ------------------------------[h2(u)]/(denominator(umax,vparameter)^2) d u.

Parameters
----------
UParameter: float
VParameter: float

Returns
-------
float
") Value;
		Standard_Real Value(const Standard_Real UParameter, const Standard_Real VParameter);

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
		/****************** GeomLib_Interpolate ******************/
		/**** md5 signature: c496f832abfbb89729f6a89aba639f4d ****/
		%feature("compactdefaultargs") GeomLib_Interpolate;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degree: int
NumPoints: int
Points: TColgp_Array1OfPnt
Parameters: TColStd_Array1OfReal

Returns
-------
None
") GeomLib_Interpolate;
		 GeomLib_Interpolate(const Standard_Integer Degree, const Standard_Integer NumPoints, const TColgp_Array1OfPnt & Points, const TColStd_Array1OfReal & Parameters);

		/****************** Curve ******************/
		/**** md5 signature: 8f61eb8bebb31bbd1fd75a7da450accd ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the interpolated curve of the requested degree.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") Curve;
		opencascade::handle<Geom_BSplineCurve> Curve();

		/****************** Error ******************/
		/**** md5 signature: 53080d5e62dd98fe7c343b04a4237efb ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the error type if any.

Returns
-------
GeomLib_InterpolationErrors
") Error;
		GeomLib_InterpolationErrors Error();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns if everything went ok.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

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
		/****************** GeomLib_IsPlanarSurface ******************/
		/**** md5 signature: 07855bbe7af975a9b55076d3f3c62078 ****/
		%feature("compactdefaultargs") GeomLib_IsPlanarSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Surface
Tol: float,optional
	default value is 1.0e-7

Returns
-------
None
") GeomLib_IsPlanarSurface;
		 GeomLib_IsPlanarSurface(const opencascade::handle<Geom_Surface> & S, const Standard_Real Tol = 1.0e-7);

		/****************** IsPlanar ******************/
		/**** md5 signature: c4cb6ad82acdd7a7d12e9af1bea21482 ****/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "Return if the surface is a plan.

Returns
-------
bool
") IsPlanar;
		Standard_Boolean IsPlanar();

		/****************** Plan ******************/
		/**** md5 signature: 8661274665886e6b8fffe3482c12561c ****/
		%feature("compactdefaultargs") Plan;
		%feature("autodoc", "Return the plan definition.

Returns
-------
gp_Pln
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
		/****************** GeomLib_LogSample ******************/
		/**** md5 signature: 94a57c7775103410d9195f25f3423791 ****/
		%feature("compactdefaultargs") GeomLib_LogSample;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: float
B: float
N: int

Returns
-------
None
") GeomLib_LogSample;
		 GeomLib_LogSample(const Standard_Real A, const Standard_Real B, const Standard_Integer N);

		/****************** GetParameter ******************/
		/**** md5 signature: 79fe4751892cd989f89d2195c56b4006 ****/
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "Returns the value of parameter of the point of range index : a + ((index-1)/(nbpoints-1))*b. an exception is raised if index<=0 or index>nbpoints.

Parameters
----------
Index: int

Returns
-------
float
") GetParameter;
		virtual Standard_Real GetParameter(const Standard_Integer Index);

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
		/****************** GeomLib_MakeCurvefromApprox ******************/
		/**** md5 signature: c60e5ef4c2db5758751274de0fbd9c5b ****/
		%feature("compactdefaultargs") GeomLib_MakeCurvefromApprox;
		%feature("autodoc", "No available documentation.

Parameters
----------
Approx: AdvApprox_ApproxAFunction

Returns
-------
None
") GeomLib_MakeCurvefromApprox;
		 GeomLib_MakeCurvefromApprox(const AdvApprox_ApproxAFunction & Approx);

		/****************** Curve ******************/
		/**** md5 signature: 0adbc1f1d9ee01063ad1d08469430891 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns a polynomial curve whose poles correspond to the index3d 3d space if index3d not in the range [1,nb3dspaces] if the approx is not done.

Parameters
----------
Index3d: int

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") Curve;
		opencascade::handle<Geom_BSplineCurve> Curve(const Standard_Integer Index3d);

		/****************** Curve ******************/
		/**** md5 signature: e80524fd6c782e74335ae7e1bbbbd0c9 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns a rational curve whose poles correspond to the index3d of the 3d space and whose weights correspond to the index1d 1d space. if index1d not in the range [1,nb1dspaces] if index3d not in the range [1,nb3dspaces] if the approx is not done.

Parameters
----------
Index1D: int
Index3D: int

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") Curve;
		opencascade::handle<Geom_BSplineCurve> Curve(const Standard_Integer Index1D, const Standard_Integer Index3D);

		/****************** Curve2d ******************/
		/**** md5 signature: 52c9a9ff227fd49316ad9acd8af2ca5c ****/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Returns a polynomial curve whose poles correspond to the index2d 2d space if index2d not in the range [1,nb2dspaces] if the approx is not done.

Parameters
----------
Index2d: int

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve2d;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d(const Standard_Integer Index2d);

		/****************** Curve2d ******************/
		/**** md5 signature: 34689ae7327a17862fcfa36503d561a5 ****/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Returns a rational curve whose poles correspond to the index2d of the 2d space and whose weights correspond to one dimensional space of index 1d if index1d not in the range [1,nb1dspaces] if index2d not in the range [1,nb2dspaces] if the approx is not done.

Parameters
----------
Index1d: int
Index2d: int

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve2d;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d(const Standard_Integer Index1d, const Standard_Integer Index2d);

		/****************** Curve2dFromTwo1d ******************/
		/**** md5 signature: 62adb876cd0bbeb40ba51592cfe27046 ****/
		%feature("compactdefaultargs") Curve2dFromTwo1d;
		%feature("autodoc", "Returns a 2d curve building it from the 1d curve in x at index1d and y at index2d amongst the 1d curves if index1d not in the range [1,nb1dspaces] if index2d not in the range [1,nb1dspaces] if the approx is not done.

Parameters
----------
Index1d: int
Index2d: int

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve2dFromTwo1d;
		opencascade::handle<Geom2d_BSplineCurve> Curve2dFromTwo1d(const Standard_Integer Index1d, const Standard_Integer Index2d);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Nb1DSpaces ******************/
		/**** md5 signature: 20e9c03c3e3894ae8182260f8e62ebe4 ****/
		%feature("compactdefaultargs") Nb1DSpaces;
		%feature("autodoc", "Returns the number of 1d spaces of the approx.

Returns
-------
int
") Nb1DSpaces;
		Standard_Integer Nb1DSpaces();

		/****************** Nb2DSpaces ******************/
		/**** md5 signature: eb40d73664d916039da3c040649e7f4f ****/
		%feature("compactdefaultargs") Nb2DSpaces;
		%feature("autodoc", "Returns the number of 3d spaces of the approx.

Returns
-------
int
") Nb2DSpaces;
		Standard_Integer Nb2DSpaces();

		/****************** Nb3DSpaces ******************/
		/**** md5 signature: 040275d26f13096ccf449e37d89095a6 ****/
		%feature("compactdefaultargs") Nb3DSpaces;
		%feature("autodoc", "Returns the number of 3d spaces of the approx.

Returns
-------
int
") Nb3DSpaces;
		Standard_Integer Nb3DSpaces();

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
		/****************** GeomLib_PolyFunc ******************/
		/**** md5 signature: 1f1b47ba96c9af6c23cce7ddb96d7c9e ****/
		%feature("compactdefaultargs") GeomLib_PolyFunc;
		%feature("autodoc", "No available documentation.

Parameters
----------
Coeffs: math_Vector

Returns
-------
None
") GeomLib_PolyFunc;
		 GeomLib_PolyFunc(const math_Vector & Coeffs);

		/****************** Derivative ******************/
		/**** md5 signature: db0dcd567f64073c6f81e974e7fd2624 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Computes the derivative <d> of the function for the variable <x>. returns true if the calculation were successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
D: float
") Derivative;
		virtual Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** Value ******************/
		/**** md5 signature: 15617dca721c4472bfb7ee7933f04bce ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value <f>of the function for the variable <x>. returns true if the calculation were successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		virtual Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: 6f2163d9b7f09d24e575a61101ce4492 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value <f> and the derivative <d> of the function for the variable <x>. returns true if the calculation were successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
F: float
D: float
") Values;
		virtual Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****************** Parameter ******************/
		/**** md5 signature: d9fbd7bbd865805d2fa18829af3689c1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Extracts the parameter of a 3d point lying on a 3d curve or at a distance less than the maxdist value.

Parameters
----------
Curve: Geom_Curve
Point: gp_Pnt
MaxDist: float

Returns
-------
U: float
") Parameter;
		static Standard_Boolean Parameter(const opencascade::handle<Geom_Curve> & Curve, const gp_Pnt & Point, const Standard_Real MaxDist, Standard_Real &OutValue);

		/****************** Parameter ******************/
		/**** md5 signature: b2fe60060067da100901feddb5a5475a ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Extracts the parameter of a 2d point lying on a 2d curve or at a distance less than the maxdist value.

Parameters
----------
Curve: Geom2d_Curve
Point: gp_Pnt2d
MaxDist: float

Returns
-------
U: float
") Parameter;
		static Standard_Boolean Parameter(const opencascade::handle<Geom2d_Curve> & Curve, const gp_Pnt2d & Point, const Standard_Real MaxDist, Standard_Real &OutValue);

		/****************** Parameters ******************/
		/**** md5 signature: d7a699c6350b3febd45e75c48db41718 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Extracts the parameter of a 3d point lying on a surface or at a distance less than the maxdist value.

Parameters
----------
Surface: Geom_Surface
Point: gp_Pnt
MaxDist: float

Returns
-------
U: float
V: float
") Parameters;
		static Standard_Boolean Parameters(const opencascade::handle<Geom_Surface> & Surface, const gp_Pnt & Point, const Standard_Real MaxDist, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend GeomLib_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
