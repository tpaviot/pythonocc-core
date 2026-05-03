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
%define APPROXDOCSTRING
"Approx module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_approx.html"
%enddef
%module (package="OCC.Core", docstring=APPROXDOCSTRING) Approx


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
#include<Approx_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColStd_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<AppCont_module.hxx>
#include<AppParCurves_module.hxx>
#include<gp_module.hxx>
#include<FEmTool_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
%import TColStd.i
%import Geom.i
%import Adaptor2d.i
%import GeomAbs.i
%import Geom2d.i
%import AppCont.i
%import AppParCurves.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum Approx_ParametrizationType {
	Approx_ChordLength = 0,
	Approx_Centripetal = 1,
	Approx_IsoParametric = 2,
};

enum Approx_Status {
	Approx_PointsAdded = 0,
	Approx_NoPointsAdded = 1,
	Approx_NoApproximation = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Approx_ParametrizationType(IntEnum):
	Approx_ChordLength = 0
	Approx_Centripetal = 1
	Approx_IsoParametric = 2
Approx_ChordLength = Approx_ParametrizationType.Approx_ChordLength
Approx_Centripetal = Approx_ParametrizationType.Approx_Centripetal
Approx_IsoParametric = Approx_ParametrizationType.Approx_IsoParametric

class Approx_Status(IntEnum):
	Approx_PointsAdded = 0
	Approx_NoPointsAdded = 1
	Approx_NoApproximation = 2
Approx_PointsAdded = Approx_Status.Approx_PointsAdded
Approx_NoPointsAdded = Approx_Status.Approx_NoPointsAdded
Approx_NoApproximation = Approx_Status.Approx_NoApproximation
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Approx_CurvlinFunc)
%wrap_handle(Approx_SweepFunction)
/* end handles declaration */

/* templates */
%template(Approx_Array1OfAdHSurface) NCollection_Array1<opencascade::handle<Adaptor3d_Surface>>;
Array1ExtendIter(opencascade::handle<Adaptor3d_Surface>)

%template(Approx_Array1OfGTrsf2d) NCollection_Array1<gp_GTrsf2d>;
Array1ExtendIter(gp_GTrsf2d)

%template(Approx_SequenceOfHArray1OfReal) NCollection_Sequence<opencascade::handle<TColStd_HArray1OfReal>>;

%extend NCollection_Sequence<opencascade::handle<TColStd_HArray1OfReal>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<Adaptor3d_Surface>> Approx_Array1OfAdHSurface;
typedef NCollection_Array1<gp_GTrsf2d> Approx_Array1OfGTrsf2d;
typedef NCollection_HArray1<opencascade::handle<Adaptor3d_Surface>> Approx_HArray1OfAdHSurface;
typedef NCollection_HArray1<gp_GTrsf2d> Approx_HArray1OfGTrsf2d;
typedef NCollection_Sequence<opencascade::handle<TColStd_HArray1OfReal>> Approx_SequenceOfHArray1OfReal;
/* end typedefs declaration */

/***********************************
* class Approx_BSplineApproxInterp *
***********************************/
class Approx_BSplineApproxInterp {
	public:
		/****** Approx_BSplineApproxInterp::Approx_BSplineApproxInterp ******/
		/****** md5 signature: 327aa9c8cae4778ed421f8deffe06de7 ******/
		%feature("compactdefaultargs") Approx_BSplineApproxInterp;
		%feature("autodoc", "
Parameters
----------
thePoints: NCollection_Array1<gp_Pnt>
theNbControlPts: int
theDegree: int (optional, default to 3)
theContinuousIfClosed: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates a constrained approximation solver. 
Input parameter: thePoints array of 3D points to fit (1-based indexing) 
Input parameter: theNbControlPts desired number of control points for the B-spline 
Input parameter: theDegree degree of the B-spline (default 3) 
Input parameter: theContinuousIfClosed if true, enforces C2 continuity for closed curves.
") Approx_BSplineApproxInterp;
		 Approx_BSplineApproxInterp(const NCollection_Array1<gp_Pnt> & thePoints, int theNbControlPts, int theDegree = 3, bool theContinuousIfClosed = false);

		/****** Approx_BSplineApproxInterp::Curve ******/
		/****** md5 signature: c38eea3d03f43cd4ac9ae236a908e33c ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
Returns the resulting B-spline curve.
") Curve;
		const opencascade::handle<Geom_BSplineCurve> & Curve();

		/****** Approx_BSplineApproxInterp::InterpolatePoint ******/
		/****** md5 signature: 88cab115881f613dfba7ed44fe7f3eca ******/
		%feature("compactdefaultargs") InterpolatePoint;
		%feature("autodoc", "
Parameters
----------
thePointIndex: int
theWithKink: bool (optional, default to false)

Return
-------
None

Description
-----------
Marks a point to be exactly interpolated rather than approximated. 
Input parameter: thePointIndex 0-based index of the point 
Input parameter: theWithKink if true, a kink (C0 break) is inserted at this parameter.
") InterpolatePoint;
		void InterpolatePoint(int thePointIndex, bool theWithKink = false);

		/****** Approx_BSplineApproxInterp::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the fit was successfully computed.
") IsDone;
		bool IsDone();

		/****** Approx_BSplineApproxInterp::MaxError ******/
		/****** md5 signature: 48ec91e4ff08cef7b377cac5e0e8d40a ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the maximum approximation error (distance at approximated points).
") MaxError;
		double MaxError();

		/****** Approx_BSplineApproxInterp::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs the fit using automatically computed parameters. Parameters are computed from input points using current parametrization alpha.
") Perform;
		void Perform();

		/****** Approx_BSplineApproxInterp::Perform ******/
		/****** md5 signature: edd8da24abbeab549db6739ff7d86cac ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theParams: NCollection_Array1<double>

Return
-------
None

Description
-----------
Performs the fit with given parameters. 
Input parameter: theParams parameter values for each point (size must match point count).
") Perform;
		void Perform(const NCollection_Array1<double> & theParams);

		/****** Approx_BSplineApproxInterp::PerformOptimal ******/
		/****** md5 signature: 9208ad1faca7f61290cf24b3e701c16d ******/
		%feature("compactdefaultargs") PerformOptimal;
		%feature("autodoc", "
Parameters
----------
theMaxIter: int

Return
-------
None

Description
-----------
Performs the fit with iterative parameter optimization using automatically computed initial parameters. 
Input parameter: theMaxIter maximum number of optimization iterations.
") PerformOptimal;
		void PerformOptimal(int theMaxIter);

		/****** Approx_BSplineApproxInterp::PerformOptimal ******/
		/****** md5 signature: 39ed52935923f49d5478c48507e4540a ******/
		%feature("compactdefaultargs") PerformOptimal;
		%feature("autodoc", "
Parameters
----------
theParams: NCollection_Array1<double>
theMaxIter: int

Return
-------
None

Description
-----------
Performs the fit with iterative parameter optimization. Parameters of approximated points are re-projected onto the curve after each iteration to improve the fit. 
Input parameter: theParams initial parameter values 
Input parameter: theMaxIter maximum number of optimization iterations.
") PerformOptimal;
		void PerformOptimal(const NCollection_Array1<double> & theParams, int theMaxIter);

		/****** Approx_BSplineApproxInterp::SetClosedTolerance ******/
		/****** md5 signature: c8a4c45fa8db6f2cf7a3064333529aef ******/
		%feature("compactdefaultargs") SetClosedTolerance;
		%feature("autodoc", "
Parameters
----------
theRelTol: double

Return
-------
None

Description
-----------
Sets the relative tolerance for detecting closed curves. Closedness is detected when first/last points are within theRelTol * (bounding box diagonal). 
Input parameter: theRelTol relative tolerance (default 1e-12).
") SetClosedTolerance;
		void SetClosedTolerance(double theRelTol);

		/****** Approx_BSplineApproxInterp::SetConvergenceTolerance ******/
		/****** md5 signature: 32dd19fe3bd8a68a10704dfeaf23af3f ******/
		%feature("compactdefaultargs") SetConvergenceTolerance;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
None

Description
-----------
Sets the convergence tolerance for parameter optimization. Optimization stops when relative error reduction falls below this value. 
Input parameter: theTol convergence tolerance (default 1e-3).
") SetConvergenceTolerance;
		void SetConvergenceTolerance(double theTol);

		/****** Approx_BSplineApproxInterp::SetKnotInsertionTolerance ******/
		/****** md5 signature: fba00dbe4b829b430f2eca8881356d4f ******/
		%feature("compactdefaultargs") SetKnotInsertionTolerance;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
None

Description
-----------
Sets the tolerance for detecting duplicate knot positions during insertion. 
Input parameter: theTol knot matching tolerance (default 1e-4).
") SetKnotInsertionTolerance;
		void SetKnotInsertionTolerance(double theTol);

		/****** Approx_BSplineApproxInterp::SetMinPivot ******/
		/****** md5 signature: 76d4a0e19014e897215028588328ad63 ******/
		%feature("compactdefaultargs") SetMinPivot;
		%feature("autodoc", "
Parameters
----------
theMinPivot: double

Return
-------
None

Description
-----------
Sets the minimum pivot value for the Gauss solver. Matrices with pivots below this threshold are treated as singular. 
Input parameter: theMinPivot minimum pivot threshold (default 1e-20).
") SetMinPivot;
		void SetMinPivot(double theMinPivot);

		/****** Approx_BSplineApproxInterp::SetParametrizationAlpha ******/
		/****** md5 signature: ac54d445809a59b404b537fce3ccc531 ******/
		%feature("compactdefaultargs") SetParametrizationAlpha;
		%feature("autodoc", "
Parameters
----------
theAlpha: double

Return
-------
None

Description
-----------
Sets the parametrization power for automatic parameter computation. 0.0 = uniform, 0.5 = centripetal (default), 1.0 = chord-length. 
Input parameter: theAlpha parametrization exponent in [0, 1].
") SetParametrizationAlpha;
		void SetParametrizationAlpha(double theAlpha);

		/****** Approx_BSplineApproxInterp::SetProjectionTolerance ******/
		/****** md5 signature: a2d46914406443eccff22bac9af1d607 ******/
		%feature("compactdefaultargs") SetProjectionTolerance;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
None

Description
-----------
Sets the tolerance for point projection onto curve during optimization. 
Input parameter: theTol projection accuracy (default 1e-6).
") SetProjectionTolerance;
		void SetProjectionTolerance(double theTol);

};


%extend Approx_BSplineApproxInterp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Approx_Curve2d *
***********************/
class Approx_Curve2d {
	public:
		/****** Approx_Curve2d::Approx_Curve2d ******/
		/****** md5 signature: 115796e23eac57b72fd99400a6a9d23f ******/
		%feature("compactdefaultargs") Approx_Curve2d;
		%feature("autodoc", "
Parameters
----------
C2D: Adaptor2d_Curve2d
First: double
Last: double
TolU: double
TolV: double
Continuity: GeomAbs_Shape
MaxDegree: int
MaxSegments: int

Return
-------
None

Description
-----------
No available documentation.
") Approx_Curve2d;
		 Approx_Curve2d(const opencascade::handle<Adaptor2d_Curve2d> & C2D, const double First, const double Last, const double TolU, const double TolV, const GeomAbs_Shape Continuity, const int MaxDegree, const int MaxSegments);

		/****** Approx_Curve2d::Curve ******/
		/****** md5 signature: 1960069de54819d72fccc75ab85806ec ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") Curve;
		opencascade::handle<Geom2d_BSplineCurve> Curve();

		/****** Approx_Curve2d::HasResult ******/
		/****** md5 signature: 708adea9b732f6b7393066c26f957b86 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasResult;
		bool HasResult();

		/****** Approx_Curve2d::IsDone ******/
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

		/****** Approx_Curve2d::MaxError2dU ******/
		/****** md5 signature: 98eb0004a50b52dd12269025dfdce784 ******/
		%feature("compactdefaultargs") MaxError2dU;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") MaxError2dU;
		double MaxError2dU();

		/****** Approx_Curve2d::MaxError2dV ******/
		/****** md5 signature: 1df5f9369f4739e247fa4e977d2ce8ab ******/
		%feature("compactdefaultargs") MaxError2dV;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") MaxError2dV;
		double MaxError2dV();

};


%extend Approx_Curve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Approx_Curve3d *
***********************/
class Approx_Curve3d {
	public:
		/****** Approx_Curve3d::Approx_Curve3d ******/
		/****** md5 signature: 7856213a633a8a7c49b33eef7674c922 ******/
		%feature("compactdefaultargs") Approx_Curve3d;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
Tol3d: double
Order: GeomAbs_Shape
MaxSegments: int
MaxDegree: int

Return
-------
None

Description
-----------
Approximation of a curve with respect of the required tolerance Tol3D.
") Approx_Curve3d;
		 Approx_Curve3d(const opencascade::handle<Adaptor3d_Curve> & Curve, const double Tol3d, const GeomAbs_Shape Order, const int MaxSegments, const int MaxDegree);

		/****** Approx_Curve3d::Curve ******/
		/****** md5 signature: 8f61eb8bebb31bbd1fd75a7da450accd ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") Curve;
		opencascade::handle<Geom_BSplineCurve> Curve();

		/****** Approx_Curve3d::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Print on the stream 'o' information about the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** Approx_Curve3d::HasResult ******/
		/****** md5 signature: 708adea9b732f6b7393066c26f957b86 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the approximation did come out with a result that is not NECESSARILY within the required tolerance.
") HasResult;
		bool HasResult();

		/****** Approx_Curve3d::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the approximation has been done within required tolerance.
") IsDone;
		bool IsDone();

		/****** Approx_Curve3d::MaxError ******/
		/****** md5 signature: 4f47ae0b40baa70b5c95e40911df418d ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the Maximum Error (>0 when an approximation has been done, 0 if no approximation).
") MaxError;
		double MaxError();

};


%extend Approx_Curve3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Approx_CurveOnSurface *
******************************/
class Approx_CurveOnSurface {
	public:
		/****** Approx_CurveOnSurface::Approx_CurveOnSurface ******/
		/****** md5 signature: 0b5fc6af2748359333fadb94d4a486e8 ******/
		%feature("compactdefaultargs") Approx_CurveOnSurface;
		%feature("autodoc", "
Parameters
----------
C2D: Adaptor2d_Curve2d
Surf: Adaptor3d_Surface
First: double
Last: double
Tol: double
Continuity: GeomAbs_Shape
MaxDegree: int
MaxSegments: int
Only3d: bool (optional, default to false)
Only2d: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Approx_CurveOnSurface;
		 Approx_CurveOnSurface(const opencascade::handle<Adaptor2d_Curve2d> & C2D, const opencascade::handle<Adaptor3d_Surface> & Surf, const double First, const double Last, const double Tol, const GeomAbs_Shape Continuity, const int MaxDegree, const int MaxSegments, const bool Only3d = false, const bool Only2d = false);

		/****** Approx_CurveOnSurface::Approx_CurveOnSurface ******/
		/****** md5 signature: 61d610710c6355cdac42b5d75128122b ******/
		%feature("compactdefaultargs") Approx_CurveOnSurface;
		%feature("autodoc", "
Parameters
----------
theC2D: Adaptor2d_Curve2d
theSurf: Adaptor3d_Surface
theFirst: double
theLast: double
theTol: double

Return
-------
None

Description
-----------
This constructor does not call perform method. 
Parameter theC2D 2D Curve to be approximated in 3D. 
Parameter theSurf Surface where 2D curve is located. 
Parameter theFirst First parameter of resulting curve. 
Parameter theFirst Last parameter of resulting curve. 
Parameter theTol Computation tolerance.
") Approx_CurveOnSurface;
		 Approx_CurveOnSurface(const opencascade::handle<Adaptor2d_Curve2d> & theC2D, const opencascade::handle<Adaptor3d_Surface> & theSurf, const double theFirst, const double theLast, const double theTol);

		/****** Approx_CurveOnSurface::Curve2d ******/
		/****** md5 signature: a68a2dac2ad11e4da3864dc2433ead7f ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") Curve2d;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d();

		/****** Approx_CurveOnSurface::Curve3d ******/
		/****** md5 signature: 40af7069a21d4ba6c9b73d59c7d6dc50 ******/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") Curve3d;
		opencascade::handle<Geom_BSplineCurve> Curve3d();

		/****** Approx_CurveOnSurface::HasResult ******/
		/****** md5 signature: 708adea9b732f6b7393066c26f957b86 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasResult;
		bool HasResult();

		/****** Approx_CurveOnSurface::IsDone ******/
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

		/****** Approx_CurveOnSurface::MaxError2dU ******/
		/****** md5 signature: 98eb0004a50b52dd12269025dfdce784 ******/
		%feature("compactdefaultargs") MaxError2dU;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") MaxError2dU;
		double MaxError2dU();

		/****** Approx_CurveOnSurface::MaxError2dV ******/
		/****** md5 signature: 1df5f9369f4739e247fa4e977d2ce8ab ******/
		%feature("compactdefaultargs") MaxError2dV;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum errors relatively to the U component or the V component of the 2d Curve.
") MaxError2dV;
		double MaxError2dV();

		/****** Approx_CurveOnSurface::MaxError3d ******/
		/****** md5 signature: 852677885a5c66f2a41b7ad3bb519106 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") MaxError3d;
		double MaxError3d();

		/****** Approx_CurveOnSurface::Perform ******/
		/****** md5 signature: 50bbe94a207550025bc6e9cb5cee11bd ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theMaxSegments: int
theMaxDegree: int
theContinuity: GeomAbs_Shape
theOnly3d: bool (optional, default to false)
theOnly2d: bool (optional, default to false)

Return
-------
None

Description
-----------
Constructs the 3d curve. Input parameters are ignored when the input curve is U-isoline or V-isoline. 
Parameter theMaxSegments Maximal number of segments in the resulting spline. 
Parameter theMaxDegree Maximal degree of the result. 
Parameter theContinuity Resulting continuity. 
Parameter theOnly3d Determines building only 3D curve. 
Parameter theOnly2d Determines building only 2D curve.
") Perform;
		void Perform(const int theMaxSegments, const int theMaxDegree, const GeomAbs_Shape theContinuity, const bool theOnly3d = false, const bool theOnly2d = false);

};


%extend Approx_CurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Approx_CurvilinearParameter *
************************************/
class Approx_CurvilinearParameter {
	public:
		/****** Approx_CurvilinearParameter::Approx_CurvilinearParameter ******/
		/****** md5 signature: f03425720fb907d0f367a6898592d288 ******/
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
		%feature("autodoc", "
Parameters
----------
C3D: Adaptor3d_Curve
Tol: double
Order: GeomAbs_Shape
MaxDegree: int
MaxSegments: int

Return
-------
None

Description
-----------
case of a free 3D curve.
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter(const opencascade::handle<Adaptor3d_Curve> & C3D, const double Tol, const GeomAbs_Shape Order, const int MaxDegree, const int MaxSegments);

		/****** Approx_CurvilinearParameter::Approx_CurvilinearParameter ******/
		/****** md5 signature: e6667e39708ab13b109f2e5cc0f0bf2f ******/
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
		%feature("autodoc", "
Parameters
----------
C2D: Adaptor2d_Curve2d
Surf: Adaptor3d_Surface
Tol: double
Order: GeomAbs_Shape
MaxDegree: int
MaxSegments: int

Return
-------
None

Description
-----------
case of a curve on one surface.
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter(const opencascade::handle<Adaptor2d_Curve2d> & C2D, const opencascade::handle<Adaptor3d_Surface> & Surf, const double Tol, const GeomAbs_Shape Order, const int MaxDegree, const int MaxSegments);

		/****** Approx_CurvilinearParameter::Approx_CurvilinearParameter ******/
		/****** md5 signature: df1a8a8376b8257612ee70f2e463bf88 ******/
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
		%feature("autodoc", "
Parameters
----------
C2D1: Adaptor2d_Curve2d
Surf1: Adaptor3d_Surface
C2D2: Adaptor2d_Curve2d
Surf2: Adaptor3d_Surface
Tol: double
Order: GeomAbs_Shape
MaxDegree: int
MaxSegments: int

Return
-------
None

Description
-----------
case of a curve on two surfaces.
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter(const opencascade::handle<Adaptor2d_Curve2d> & C2D1, const opencascade::handle<Adaptor3d_Surface> & Surf1, const opencascade::handle<Adaptor2d_Curve2d> & C2D2, const opencascade::handle<Adaptor3d_Surface> & Surf2, const double Tol, const GeomAbs_Shape Order, const int MaxDegree, const int MaxSegments);

		/****** Approx_CurvilinearParameter::Curve2d1 ******/
		/****** md5 signature: 320386716849305473262b1fbe175d01 ******/
		%feature("compactdefaultargs") Curve2d1;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
returns the BsplineCurve representing the reparametrized 2D curve on the first surface (case of a curve on one or two surfaces).
") Curve2d1;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d1();

		/****** Approx_CurvilinearParameter::Curve2d2 ******/
		/****** md5 signature: c454b48582ae4e125bffbd0a7c1ecb65 ******/
		%feature("compactdefaultargs") Curve2d2;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
returns the BsplineCurve representing the reparametrized 2D curve on the second surface (case of a curve on two surfaces).
") Curve2d2;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d2();

		/****** Approx_CurvilinearParameter::Curve3d ******/
		/****** md5 signature: 40af7069a21d4ba6c9b73d59c7d6dc50 ******/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
returns the Bspline curve corresponding to the reparametrized 3D curve.
") Curve3d;
		opencascade::handle<Geom_BSplineCurve> Curve3d();

		/****** Approx_CurvilinearParameter::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
print the maximum errors(s).
") Dump;
		void Dump(std::ostream &OutValue);

		/****** Approx_CurvilinearParameter::HasResult ******/
		/****** md5 signature: 708adea9b732f6b7393066c26f957b86 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasResult;
		bool HasResult();

		/****** Approx_CurvilinearParameter::IsDone ******/
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

		/****** Approx_CurvilinearParameter::MaxError2d1 ******/
		/****** md5 signature: 884cea44987231cb316dcb8631c0d4ff ******/
		%feature("compactdefaultargs") MaxError2d1;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum error on the first reparametrized 2D curve.
") MaxError2d1;
		double MaxError2d1();

		/****** Approx_CurvilinearParameter::MaxError2d2 ******/
		/****** md5 signature: 0d9aca9cb0534146fb896918a91218a8 ******/
		%feature("compactdefaultargs") MaxError2d2;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum error on the second reparametrized 2D curve.
") MaxError2d2;
		double MaxError2d2();

		/****** Approx_CurvilinearParameter::MaxError3d ******/
		/****** md5 signature: 852677885a5c66f2a41b7ad3bb519106 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum error on the reparametrized 3D curve.
") MaxError3d;
		double MaxError3d();

};


%extend Approx_CurvilinearParameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Approx_CurvlinFunc *
***************************/
class Approx_CurvlinFunc : public Standard_Transient {
	public:
		/****** Approx_CurvlinFunc::Approx_CurvlinFunc ******/
		/****** md5 signature: 0dc94ca37e0c530d158f4508e45be648 ******/
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc(const opencascade::handle<Adaptor3d_Curve> & C, const double Tol);

		/****** Approx_CurvlinFunc::Approx_CurvlinFunc ******/
		/****** md5 signature: 6036802a76c38308ae1ee892a88fa673 ******/
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", "
Parameters
----------
C2D: Adaptor2d_Curve2d
S: Adaptor3d_Surface
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc(const opencascade::handle<Adaptor2d_Curve2d> & C2D, const opencascade::handle<Adaptor3d_Surface> & S, const double Tol);

		/****** Approx_CurvlinFunc::Approx_CurvlinFunc ******/
		/****** md5 signature: b50222a90d73cbdfc9ab45f2440c750f ******/
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", "
Parameters
----------
C2D1: Adaptor2d_Curve2d
C2D2: Adaptor2d_Curve2d
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc(const opencascade::handle<Adaptor2d_Curve2d> & C2D1, const opencascade::handle<Adaptor2d_Curve2d> & C2D2, const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const double Tol);

		/****** Approx_CurvlinFunc::EvalCase1 ******/
		/****** md5 signature: 56765baadd8b0d7010afde85b4d9bc2f ******/
		%feature("compactdefaultargs") EvalCase1;
		%feature("autodoc", "
Parameters
----------
S: double
Order: int
Result: NCollection_Array1<double>

Return
-------
bool

Description
-----------
if myCase != 1.
") EvalCase1;
		bool EvalCase1(const double S, const int Order, NCollection_Array1<double> & Result);

		/****** Approx_CurvlinFunc::EvalCase2 ******/
		/****** md5 signature: c2d108213c9f5d33c6ef5501f3bb4092 ******/
		%feature("compactdefaultargs") EvalCase2;
		%feature("autodoc", "
Parameters
----------
S: double
Order: int
Result: NCollection_Array1<double>

Return
-------
bool

Description
-----------
if myCase != 2.
") EvalCase2;
		bool EvalCase2(const double S, const int Order, NCollection_Array1<double> & Result);

		/****** Approx_CurvlinFunc::EvalCase3 ******/
		/****** md5 signature: ea9ecf8403211d53fd4b496855fedb45 ******/
		%feature("compactdefaultargs") EvalCase3;
		%feature("autodoc", "
Parameters
----------
S: double
Order: int
Result: NCollection_Array1<double>

Return
-------
bool

Description
-----------
if myCase != 3.
") EvalCase3;
		bool EvalCase3(const double S, const int Order, NCollection_Array1<double> & Result);

		/****** Approx_CurvlinFunc::FirstParameter ******/
		/****** md5 signature: 663a02fdcfecea2f8437f306e48dfc6b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		double FirstParameter();

		/****** Approx_CurvlinFunc::GetLength ******/
		/****** md5 signature: 11d25f6ae6c88d05783a64e3684ffaed ******/
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") GetLength;
		double GetLength();

		/****** Approx_CurvlinFunc::GetSParameter ******/
		/****** md5 signature: 371d997e46d8c581015fadd179027b34 ******/
		%feature("compactdefaultargs") GetSParameter;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
returns original parameter corresponding S.
") GetSParameter;
		double GetSParameter(const double U);

		/****** Approx_CurvlinFunc::GetUParameter ******/
		/****** md5 signature: 415551211dcadb5cc52c0586d35f8e26 ******/
		%feature("compactdefaultargs") GetUParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: double
NumberOfCurve: int

Return
-------
double

Description
-----------
returns original parameter corresponding S. if Case == 1 computation is performed on myC2D1 and mySurf1, otherwise it is done on myC2D2 and mySurf2.
") GetUParameter;
		double GetUParameter(Adaptor3d_Curve & C, const double S, const int NumberOfCurve);

		/****** Approx_CurvlinFunc::Intervals ******/
		/****** md5 signature: e4977c3906016e087e932448dc6271e5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** Approx_CurvlinFunc::LastParameter ******/
		/****** md5 signature: fca5164159fd9f44a10664b338b6e402 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		double LastParameter();

		/****** Approx_CurvlinFunc::Length ******/
		/****** md5 signature: 389864b782ecf5fea5b568ea6b4ee166 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes length of the curve.
") Length;
		void Length();

		/****** Approx_CurvlinFunc::Length ******/
		/****** md5 signature: 7b7492f60a84991760553acdf19e731d ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
FirstU: double
LasrU: double

Return
-------
double

Description
-----------
Computes length of the curve segment.
") Length;
		double Length(Adaptor3d_Curve & C, const double FirstU, const double LasrU);

		/****** Approx_CurvlinFunc::NbIntervals ******/
		/****** md5 signature: a8ba1446e056c10b55516babe8124726 ******/
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
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		int NbIntervals(const GeomAbs_Shape S);

		/****** Approx_CurvlinFunc::SetTol ******/
		/****** md5 signature: 4cd9aceaf0afa0f18fd2c4ac9683316a ******/
		%feature("compactdefaultargs") SetTol;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
---Purpose Update the tolerance to used.
") SetTol;
		void SetTol(const double Tol);

		/****** Approx_CurvlinFunc::Trim ******/
		/****** md5 signature: 3a25a051dcf017f84b9c67431358e8f9 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
None

Description
-----------
if First < 0 or Last > 1.
") Trim;
		void Trim(const double First, const double Last, const double Tol);

};


%make_alias(Approx_CurvlinFunc)

%extend Approx_CurvlinFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Approx_FitAndDivide *
****************************/
class Approx_FitAndDivide {
	public:
		/****** Approx_FitAndDivide::Approx_FitAndDivide ******/
		/****** md5 signature: d7f48e946aee6b5d05947ed5cf64daa7 ******/
		%feature("compactdefaultargs") Approx_FitAndDivide;
		%feature("autodoc", "
Parameters
----------
Line: AppCont_Function
degreemin: int (optional, default to 3)
degreemax: int (optional, default to 8)
Tolerance3d: double (optional, default to 1.0e-5)
Tolerance2d: double (optional, default to 1.0e-5)
cutting: bool (optional, default to false)
FirstC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)
LastC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)

Return
-------
None

Description
-----------
The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True.
") Approx_FitAndDivide;
		 Approx_FitAndDivide(const AppCont_Function & Line, const int degreemin = 3, const int degreemax = 8, const double Tolerance3d = 1.0e-5, const double Tolerance2d = 1.0e-5, const bool cutting = false, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****** Approx_FitAndDivide::Approx_FitAndDivide ******/
		/****** md5 signature: dcb61806d31c484df342e4d135fcd93a ******/
		%feature("compactdefaultargs") Approx_FitAndDivide;
		%feature("autodoc", "
Parameters
----------
degreemin: int (optional, default to 3)
degreemax: int (optional, default to 8)
Tolerance3d: double (optional, default to 1.0e-05)
Tolerance2d: double (optional, default to 1.0e-05)
cutting: bool (optional, default to false)
FirstC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)
LastC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Approx_FitAndDivide;
		 Approx_FitAndDivide(const int degreemin = 3, const int degreemax = 8, const double Tolerance3d = 1.0e-05, const double Tolerance2d = 1.0e-05, const bool cutting = false, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****** Approx_FitAndDivide::Error ******/
		/****** md5 signature: 16248cd92a25264d4b1676fa28492d15 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
tol3d: double
tol2d: double

Description
-----------
returns the tolerances 2d and 3d of the <Index> MultiCurve.
") Error;
		void Error(const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Approx_FitAndDivide::IsAllApproximated ******/
		/****** md5 signature: 097042183394c222ee066430113409dd ******/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.
") IsAllApproximated;
		bool IsAllApproximated();

		/****** Approx_FitAndDivide::IsToleranceReached ******/
		/****** md5 signature: e68ff79913f1e1cb017e363f76fc9fc2 ******/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if the status NoPointsAdded has been sent.
") IsToleranceReached;
		bool IsToleranceReached();

		/****** Approx_FitAndDivide::NbMultiCurves ******/
		/****** md5 signature: eed274d77446bf2416a954e7f34c2bf0 ******/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of MultiCurve doing the approximation of the MultiLine.
") NbMultiCurves;
		int NbMultiCurves();

		/****** Approx_FitAndDivide::Parameters ******/
		/****** md5 signature: 43d943f0a53a0d94942b221259fd1edc ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
firstp: double
lastp: double

Description
-----------
No available documentation.
") Parameters;
		void Parameters(const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Approx_FitAndDivide::Perform ******/
		/****** md5 signature: caf6a1aea817b16df8ee08ce9b993f4f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Line: AppCont_Function

Return
-------
None

Description
-----------
runs the algorithm after having initialized the fields.
") Perform;
		void Perform(const AppCont_Function & Line);

		/****** Approx_FitAndDivide::SetConstraints ******/
		/****** md5 signature: 99b92dc193142adf44568f800cd394dc ******/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "
Parameters
----------
FirstC: AppParCurves_Constraint
LastC: AppParCurves_Constraint

Return
-------
None

Description
-----------
Changes the constraints of the approximation.
") SetConstraints;
		void SetConstraints(const AppParCurves_Constraint FirstC, const AppParCurves_Constraint LastC);

		/****** Approx_FitAndDivide::SetDegrees ******/
		/****** md5 signature: 83fc53ce842bc5ef5957903d76f43a4a ******/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "
Parameters
----------
degreemin: int
degreemax: int

Return
-------
None

Description
-----------
changes the degrees of the approximation.
") SetDegrees;
		void SetDegrees(const int degreemin, const int degreemax);

		/****** Approx_FitAndDivide::SetHangChecking ******/
		/****** md5 signature: f50d24a25d7b523abdff4b1afcfa90d4 ******/
		%feature("compactdefaultargs") SetHangChecking;
		%feature("autodoc", "
Parameters
----------
theHangChecking: bool

Return
-------
None

Description
-----------
Set value of hang checking flag if this flag = true, possible hang of algorithm is checked and algorithm is forced to stop. By default hang checking is used.
") SetHangChecking;
		void SetHangChecking(const bool theHangChecking);

		/****** Approx_FitAndDivide::SetInvOrder ******/
		/****** md5 signature: bf1dbc61ceb30498f4595cd16c45fbc7 ******/
		%feature("compactdefaultargs") SetInvOrder;
		%feature("autodoc", "
Parameters
----------
theInvOrder: bool

Return
-------
None

Description
-----------
Set inverse order of degree selection: if theInvOrdr = true, current degree is chosen by inverse order - from maxdegree to mindegree. By default inverse order is used.
") SetInvOrder;
		void SetInvOrder(const bool theInvOrder);

		/****** Approx_FitAndDivide::SetMaxSegments ******/
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
Changes the max number of segments, which is allowed for cutting.
") SetMaxSegments;
		void SetMaxSegments(const int theMaxSegments);

		/****** Approx_FitAndDivide::SetTolerances ******/
		/****** md5 signature: 26249a86974aa99769435e28e43c6d33 ******/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "
Parameters
----------
Tolerance3d: double
Tolerance2d: double

Return
-------
None

Description
-----------
Changes the tolerances of the approximation.
") SetTolerances;
		void SetTolerances(const double Tolerance3d, const double Tolerance2d);

		/****** Approx_FitAndDivide::Value ******/
		/****** md5 signature: fd525ff9710e442c8013f9a14a9e5944 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int (optional, default to 1)

Return
-------
AppParCurves_MultiCurve

Description
-----------
returns the approximation MultiCurve of range <Index>.
") Value;
		AppParCurves_MultiCurve Value(const int Index = 1);

};


%extend Approx_FitAndDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Approx_FitAndDivide2d *
******************************/
class Approx_FitAndDivide2d {
	public:
		/****** Approx_FitAndDivide2d::Approx_FitAndDivide2d ******/
		/****** md5 signature: 0ad2fc202fb4a80764349c498d475744 ******/
		%feature("compactdefaultargs") Approx_FitAndDivide2d;
		%feature("autodoc", "
Parameters
----------
Line: AppCont_Function
degreemin: int (optional, default to 3)
degreemax: int (optional, default to 8)
Tolerance3d: double (optional, default to 1.0e-5)
Tolerance2d: double (optional, default to 1.0e-5)
cutting: bool (optional, default to false)
FirstC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)
LastC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)

Return
-------
None

Description
-----------
The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True.
") Approx_FitAndDivide2d;
		 Approx_FitAndDivide2d(const AppCont_Function & Line, const int degreemin = 3, const int degreemax = 8, const double Tolerance3d = 1.0e-5, const double Tolerance2d = 1.0e-5, const bool cutting = false, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****** Approx_FitAndDivide2d::Approx_FitAndDivide2d ******/
		/****** md5 signature: 46626852fc5dab90ebd5a3883fd5c841 ******/
		%feature("compactdefaultargs") Approx_FitAndDivide2d;
		%feature("autodoc", "
Parameters
----------
degreemin: int (optional, default to 3)
degreemax: int (optional, default to 8)
Tolerance3d: double (optional, default to 1.0e-05)
Tolerance2d: double (optional, default to 1.0e-05)
cutting: bool (optional, default to false)
FirstC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)
LastC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Approx_FitAndDivide2d;
		 Approx_FitAndDivide2d(const int degreemin = 3, const int degreemax = 8, const double Tolerance3d = 1.0e-05, const double Tolerance2d = 1.0e-05, const bool cutting = false, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****** Approx_FitAndDivide2d::Error ******/
		/****** md5 signature: 16248cd92a25264d4b1676fa28492d15 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
tol3d: double
tol2d: double

Description
-----------
returns the tolerances 2d and 3d of the <Index> MultiCurve.
") Error;
		void Error(const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Approx_FitAndDivide2d::IsAllApproximated ******/
		/****** md5 signature: 097042183394c222ee066430113409dd ******/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.
") IsAllApproximated;
		bool IsAllApproximated();

		/****** Approx_FitAndDivide2d::IsToleranceReached ******/
		/****** md5 signature: e68ff79913f1e1cb017e363f76fc9fc2 ******/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if the status NoPointsAdded has been sent.
") IsToleranceReached;
		bool IsToleranceReached();

		/****** Approx_FitAndDivide2d::NbMultiCurves ******/
		/****** md5 signature: eed274d77446bf2416a954e7f34c2bf0 ******/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of MultiCurve doing the approximation of the MultiLine.
") NbMultiCurves;
		int NbMultiCurves();

		/****** Approx_FitAndDivide2d::Parameters ******/
		/****** md5 signature: 43d943f0a53a0d94942b221259fd1edc ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
firstp: double
lastp: double

Description
-----------
No available documentation.
") Parameters;
		void Parameters(const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Approx_FitAndDivide2d::Perform ******/
		/****** md5 signature: caf6a1aea817b16df8ee08ce9b993f4f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Line: AppCont_Function

Return
-------
None

Description
-----------
runs the algorithm after having initialized the fields.
") Perform;
		void Perform(const AppCont_Function & Line);

		/****** Approx_FitAndDivide2d::SetConstraints ******/
		/****** md5 signature: 99b92dc193142adf44568f800cd394dc ******/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "
Parameters
----------
FirstC: AppParCurves_Constraint
LastC: AppParCurves_Constraint

Return
-------
None

Description
-----------
Changes the constraints of the approximation.
") SetConstraints;
		void SetConstraints(const AppParCurves_Constraint FirstC, const AppParCurves_Constraint LastC);

		/****** Approx_FitAndDivide2d::SetDegrees ******/
		/****** md5 signature: 83fc53ce842bc5ef5957903d76f43a4a ******/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "
Parameters
----------
degreemin: int
degreemax: int

Return
-------
None

Description
-----------
changes the degrees of the approximation.
") SetDegrees;
		void SetDegrees(const int degreemin, const int degreemax);

		/****** Approx_FitAndDivide2d::SetHangChecking ******/
		/****** md5 signature: f50d24a25d7b523abdff4b1afcfa90d4 ******/
		%feature("compactdefaultargs") SetHangChecking;
		%feature("autodoc", "
Parameters
----------
theHangChecking: bool

Return
-------
None

Description
-----------
Set value of hang checking flag if this flag = true, possible hang of algorithm is checked and algorithm is forced to stop. By default hang checking is used.
") SetHangChecking;
		void SetHangChecking(const bool theHangChecking);

		/****** Approx_FitAndDivide2d::SetInvOrder ******/
		/****** md5 signature: bf1dbc61ceb30498f4595cd16c45fbc7 ******/
		%feature("compactdefaultargs") SetInvOrder;
		%feature("autodoc", "
Parameters
----------
theInvOrder: bool

Return
-------
None

Description
-----------
Set inverse order of degree selection: if theInvOrdr = true, current degree is chosen by inverse order - from maxdegree to mindegree. By default inverse order is used.
") SetInvOrder;
		void SetInvOrder(const bool theInvOrder);

		/****** Approx_FitAndDivide2d::SetMaxSegments ******/
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
Changes the max number of segments, which is allowed for cutting.
") SetMaxSegments;
		void SetMaxSegments(const int theMaxSegments);

		/****** Approx_FitAndDivide2d::SetTolerances ******/
		/****** md5 signature: 26249a86974aa99769435e28e43c6d33 ******/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "
Parameters
----------
Tolerance3d: double
Tolerance2d: double

Return
-------
None

Description
-----------
Changes the tolerances of the approximation.
") SetTolerances;
		void SetTolerances(const double Tolerance3d, const double Tolerance2d);

		/****** Approx_FitAndDivide2d::Value ******/
		/****** md5 signature: fd525ff9710e442c8013f9a14a9e5944 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int (optional, default to 1)

Return
-------
AppParCurves_MultiCurve

Description
-----------
returns the approximation MultiCurve of range <Index>.
") Value;
		AppParCurves_MultiCurve Value(const int Index = 1);

};


%extend Approx_FitAndDivide2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Approx_MCurvesToBSpCurve *
*********************************/
class Approx_MCurvesToBSpCurve {
	public:
		/****** Approx_MCurvesToBSpCurve::Approx_MCurvesToBSpCurve ******/
		/****** md5 signature: f2ce6c1a8e6e0de7a78187ebdf09738b ******/
		%feature("compactdefaultargs") Approx_MCurvesToBSpCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Approx_MCurvesToBSpCurve;
		 Approx_MCurvesToBSpCurve();

		/****** Approx_MCurvesToBSpCurve::Append ******/
		/****** md5 signature: ffc631c7b8994b3171041a1a53a9ce0c ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
MC: AppParCurves_MultiCurve

Return
-------
None

Description
-----------
No available documentation.
") Append;
		void Append(const AppParCurves_MultiCurve & MC);

		/****** Approx_MCurvesToBSpCurve::ChangeValue ******/
		/****** md5 signature: 2275e53c2101f0a946b62e87720ec0a1 ******/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiBSpCurve

Description
-----------
return the composite MultiCurves as a MultiBSpCurve.
") ChangeValue;
		AppParCurves_MultiBSpCurve ChangeValue();

		/****** Approx_MCurvesToBSpCurve::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform();

		/****** Approx_MCurvesToBSpCurve::Perform ******/
		/****** md5 signature: a337bf269c85119b9aebee5cbbb214c4 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
TheSeq: NCollection_Sequence<AppParCurves_MultiCurve>

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const NCollection_Sequence<AppParCurves_MultiCurve> & TheSeq);

		/****** Approx_MCurvesToBSpCurve::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reset;
		void Reset();

		/****** Approx_MCurvesToBSpCurve::Value ******/
		/****** md5 signature: c818c96a9a832640b6267a997c4dbd3b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
AppParCurves_MultiBSpCurve

Description
-----------
return the composite MultiCurves as a MultiBSpCurve.
") Value;
		AppParCurves_MultiBSpCurve Value();

};


%extend Approx_MCurvesToBSpCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Approx_SameParameter *
*****************************/
class Approx_SameParameter {
	public:
		class Approx_SameParameter_Data {};
		/****** Approx_SameParameter::Approx_SameParameter ******/
		/****** md5 signature: fb2b13b6e12e763af7054f3d062e7ee0 ******/
		%feature("compactdefaultargs") Approx_SameParameter;
		%feature("autodoc", "
Parameters
----------
C3D: Geom_Curve
C2D: Geom2d_Curve
S: Geom_Surface
Tol: double

Return
-------
None

Description
-----------
Warning: the C3D and C2D must have the same parametric domain.
") Approx_SameParameter;
		 Approx_SameParameter(const opencascade::handle<Geom_Curve> & C3D, const opencascade::handle<Geom2d_Curve> & C2D, const opencascade::handle<Geom_Surface> & S, const double Tol);

		/****** Approx_SameParameter::Approx_SameParameter ******/
		/****** md5 signature: aadd69bd47323261c298c37366d3aed1 ******/
		%feature("compactdefaultargs") Approx_SameParameter;
		%feature("autodoc", "
Parameters
----------
C3D: Adaptor3d_Curve
C2D: Geom2d_Curve
S: Adaptor3d_Surface
Tol: double

Return
-------
None

Description
-----------
Warning: the C3D and C2D must have the same parametric domain.
") Approx_SameParameter;
		 Approx_SameParameter(const opencascade::handle<Adaptor3d_Curve> & C3D, const opencascade::handle<Geom2d_Curve> & C2D, const opencascade::handle<Adaptor3d_Surface> & S, const double Tol);

		/****** Approx_SameParameter::Approx_SameParameter ******/
		/****** md5 signature: 4dcea51d850c7ee18d3fc6d79d51ac50 ******/
		%feature("compactdefaultargs") Approx_SameParameter;
		%feature("autodoc", "
Parameters
----------
C3D: Adaptor3d_Curve
C2D: Adaptor2d_Curve2d
S: Adaptor3d_Surface
Tol: double

Return
-------
None

Description
-----------
Warning: the C3D and C2D must have the same parametric domain.
") Approx_SameParameter;
		 Approx_SameParameter(const opencascade::handle<Adaptor3d_Curve> & C3D, const opencascade::handle<Adaptor2d_Curve2d> & C2D, const opencascade::handle<Adaptor3d_Surface> & S, const double Tol);

		/****** Approx_SameParameter::Curve2d ******/
		/****** md5 signature: 5fab5e35541cfe36f16f0294e27855ba ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Returns the 2D curve that has the same parameter as the 3D curve once evaluated on the surface up to the specified tolerance.
") Curve2d;
		opencascade::handle<Geom2d_Curve> Curve2d();

		/****** Approx_SameParameter::Curve3d ******/
		/****** md5 signature: bf4d235dc27cc25572185a2b068878b7 ******/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Returns the 3D curve that has the same parameter as the 3D curve once evaluated on the surface up to the specified tolerance.
") Curve3d;
		opencascade::handle<Adaptor3d_Curve> Curve3d();

		/****** Approx_SameParameter::CurveOnSurface ******/
		/****** md5 signature: 4576c068b1d09f135c33c1fb035c3e4f ******/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_CurveOnSurface>

Description
-----------
Returns the 3D curve on surface that has the same parameter as the 3D curve up to the specified tolerance.
") CurveOnSurface;
		opencascade::handle<Adaptor3d_CurveOnSurface> CurveOnSurface();

		/****** Approx_SameParameter::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
//!@Returns .false. if calculations failed, .true. if calculations succeed.
") IsDone;
		bool IsDone();

		/****** Approx_SameParameter::IsSameParameter ******/
		/****** md5 signature: e9f3f4d91d93077bb5edf77f6c155b43 ******/
		%feature("compactdefaultargs") IsSameParameter;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells whether the original data had already the same parameter up to the tolerance: in that case nothing is done.
") IsSameParameter;
		bool IsSameParameter();

		/****** Approx_SameParameter::TolReached ******/
		/****** md5 signature: 1179506b40750c3e2bd5b3fa598d6518 ******/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "Return
-------
double

Description
-----------
//!@Returns tolerance (maximal distance) between 3d curve and curve on surface, generated by 2d curve and surface.
") TolReached;
		double TolReached();

};


%extend Approx_SameParameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Approx_SweepApproximation *
**********************************/
class Approx_SweepApproximation {
	public:
		/****** Approx_SweepApproximation::Approx_SweepApproximation ******/
		/****** md5 signature: 1e58ff1dd49473e8ec1efa55877921aa ******/
		%feature("compactdefaultargs") Approx_SweepApproximation;
		%feature("autodoc", "
Parameters
----------
Func: Approx_SweepFunction

Return
-------
None

Description
-----------
No available documentation.
") Approx_SweepApproximation;
		 Approx_SweepApproximation(const opencascade::handle<Approx_SweepFunction> & Func);

		/****** Approx_SweepApproximation::Average2dError ******/
		/****** md5 signature: 8612018a8c5bb0cc13f2e0bf1eeeedfb ******/
		%feature("compactdefaultargs") Average2dError;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
returns the average error of the <Index> 2d curve approximation.
") Average2dError;
		double Average2dError(const int Index);

		/****** Approx_SweepApproximation::AverageErrorOnSurf ******/
		/****** md5 signature: f471b7520ad320c9fd9d283d456bafed ******/
		%feature("compactdefaultargs") AverageErrorOnSurf;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the average error in the surface approximation.
") AverageErrorOnSurf;
		double AverageErrorOnSurf();

		/****** Approx_SweepApproximation::Curve2d ******/
		/****** md5 signature: 3cdfdaaa8adb8ff4d8bfe37710053f66 ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
Index: int
TPoles: NCollection_Array1<gp_Pnt2d>
TKnots: NCollection_Array1<double>
TMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Curve2d;
		void Curve2d(const int Index, NCollection_Array1<gp_Pnt2d> & TPoles, NCollection_Array1<double> & TKnots, NCollection_Array1<int> & TMults);

		/****** Approx_SweepApproximation::Curve2dPoles ******/
		/****** md5 signature: a94b7da160d08553423b9884961ce57f ******/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
NCollection_Array1<gp_Pnt2d>

Description
-----------
No available documentation.
") Curve2dPoles;
		const NCollection_Array1<gp_Pnt2d> Curve2dPoles(const int Index);

		/****** Approx_SweepApproximation::Curves2dDegree ******/
		/****** md5 signature: 741e492947964135d3b5538ab9a61c20 ******/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Curves2dDegree;
		int Curves2dDegree();

		/****** Approx_SweepApproximation::Curves2dKnots ******/
		/****** md5 signature: e5526430bc9b03b7f833d3aaa9213d05 ******/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "Return
-------
NCollection_Array1<double>

Description
-----------
No available documentation.
") Curves2dKnots;
		const NCollection_Array1<double> & Curves2dKnots();

		/****** Approx_SweepApproximation::Curves2dMults ******/
		/****** md5 signature: 741234b571aed45d97ebf38ae8a2aae0 ******/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "Return
-------
NCollection_Array1<int>

Description
-----------
No available documentation.
") Curves2dMults;
		const NCollection_Array1<int> & Curves2dMults();

		/****** Approx_SweepApproximation::Curves2dShape ******/
		/****** md5 signature: 10d5751926250c321b8a42eeb20ea4d9 ******/
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
Degree: int
NbPoles: int
NbKnots: int

Description
-----------
No available documentation.
") Curves2dShape;
		void Curves2dShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Approx_SweepApproximation::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
display information on approximation.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** Approx_SweepApproximation::Eval ******/
		/****** md5 signature: 60f7e627403ad4cf387382e8a1969eda ******/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "
Parameters
----------
Parameter: double
DerivativeRequest: int
First: double
Last: double

Return
-------
Result: double

Description
-----------
The EvaluatorFunction from AdvApprox;.
") Eval;
		int Eval(const double Parameter, const int DerivativeRequest, const double First, const double Last, Standard_Real &OutValue);

		/****** Approx_SweepApproximation::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns if we have an result.
") IsDone;
		bool IsDone();

		/****** Approx_SweepApproximation::Max2dError ******/
		/****** md5 signature: e17bb792de5e7f2cf5dbaad973a8bc9d ******/
		%feature("compactdefaultargs") Max2dError;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
returns the maximum error of the <Index> 2d curve approximation.
") Max2dError;
		double Max2dError(const int Index);

		/****** Approx_SweepApproximation::MaxErrorOnSurf ******/
		/****** md5 signature: ac629120066985404d9298b93cf6fad0 ******/
		%feature("compactdefaultargs") MaxErrorOnSurf;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximum error in the surface approximation.
") MaxErrorOnSurf;
		double MaxErrorOnSurf();

		/****** Approx_SweepApproximation::NbCurves2d ******/
		/****** md5 signature: 79b9be5191f7ebac028616f16947a5cc ******/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCurves2d;
		int NbCurves2d();

		/****** Approx_SweepApproximation::Perform ******/
		/****** md5 signature: 67df50d868fe531852a00aeaa2bf96ec ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol3d: double
BoundTol: double
Tol2d: double
TolAngular: double
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C0)
Degmax: int (optional, default to 11)
Segmax: int (optional, default to 50)

Return
-------
None

Description
-----------
Perform the Approximation [First, Last]: Approx_SweepApproximation.cdl Tol3d: Tolerance to surface approximation Tol2d: Tolerance used to perform curve approximation Normally the 2d curve are approximated with a tolerance given by the resolution on support surfaces, but if this tolerance is too large Tol2d is used. TolAngular: Tolerance (in radian) to control the angle between tangents on the section law and tangent of iso-v on approximated surface Continuity: The continuity in v waiting on the surface Degmax: The maximum degree in v required on the surface Segmax: The maximum number of span in v required on the surface Warning: The continuity ci can be obtained only if Ft is Ci.
") Perform;
		void Perform(const double First, const double Last, const double Tol3d, const double BoundTol, const double Tol2d, const double TolAngular, const GeomAbs_Shape Continuity = GeomAbs_C0, const int Degmax = 11, const int Segmax = 50);

		/****** Approx_SweepApproximation::SurfPoles ******/
		/****** md5 signature: 901b69a7e611035a6e05a71b9dd4147b ******/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "Return
-------
NCollection_Array2<gp_Pnt>

Description
-----------
No available documentation.
") SurfPoles;
		const NCollection_Array2<gp_Pnt> SurfPoles();

		/****** Approx_SweepApproximation::SurfShape ******/
		/****** md5 signature: 77a85efd3e7049fa349b785c707ab77e ******/
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
UDegree: int
VDegree: int
NbUPoles: int
NbVPoles: int
NbUKnots: int
NbVKnots: int

Description
-----------
No available documentation.
") SurfShape;
		void SurfShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Approx_SweepApproximation::SurfUKnots ******/
		/****** md5 signature: 32ff4a565003cc39ee69e13d0a022d4d ******/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "Return
-------
NCollection_Array1<double>

Description
-----------
No available documentation.
") SurfUKnots;
		const NCollection_Array1<double> & SurfUKnots();

		/****** Approx_SweepApproximation::SurfUMults ******/
		/****** md5 signature: b97af4fe33c7407a8824ab6ffcd000f4 ******/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "Return
-------
NCollection_Array1<int>

Description
-----------
No available documentation.
") SurfUMults;
		const NCollection_Array1<int> & SurfUMults();

		/****** Approx_SweepApproximation::SurfVKnots ******/
		/****** md5 signature: 44e1d2dd44feea0b504b7d583d36f2b4 ******/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "Return
-------
NCollection_Array1<double>

Description
-----------
No available documentation.
") SurfVKnots;
		const NCollection_Array1<double> & SurfVKnots();

		/****** Approx_SweepApproximation::SurfVMults ******/
		/****** md5 signature: 29d551b5820d4a88f391a2e1f6b715d0 ******/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "Return
-------
NCollection_Array1<int>

Description
-----------
No available documentation.
") SurfVMults;
		const NCollection_Array1<int> & SurfVMults();

		/****** Approx_SweepApproximation::SurfWeights ******/
		/****** md5 signature: eb6194e3a7c74d6cf9b4d2592e87c67a ******/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "Return
-------
NCollection_Array2<double>

Description
-----------
No available documentation.
") SurfWeights;
		const NCollection_Array2<double> & SurfWeights();

		/****** Approx_SweepApproximation::Surface ******/
		/****** md5 signature: d0c169cb929e549a376edcb2baa2684e ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
TPoles: NCollection_Array2<gp_Pnt>
TWeights: NCollection_Array2<double>
TUKnots: NCollection_Array1<double>
TVKnots: NCollection_Array1<double>
TUMults: NCollection_Array1<int>
TVMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Surface;
		void Surface(NCollection_Array2<gp_Pnt> & TPoles, NCollection_Array2<double> & TWeights, NCollection_Array1<double> & TUKnots, NCollection_Array1<double> & TVKnots, NCollection_Array1<int> & TUMults, NCollection_Array1<int> & TVMults);

		/****** Approx_SweepApproximation::TolCurveOnSurf ******/
		/****** md5 signature: b5567ef25273afb07eb16d77a94935ec ******/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
returns the maximum 3d error of the <Index> 2d curve approximation on the Surface.
") TolCurveOnSurf;
		double TolCurveOnSurf(const int Index);

		/****** Approx_SweepApproximation::UDegree ******/
		/****** md5 signature: 82316803b09fa91a345f15577c8b3c82 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		int UDegree();

		/****** Approx_SweepApproximation::VDegree ******/
		/****** md5 signature: 10a01c94db483e5b8afe43596e767a03 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		int VDegree();

};


%extend Approx_SweepApproximation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Approx_SweepFunction *
*****************************/
%nodefaultctor Approx_SweepFunction;
class Approx_SweepFunction : public Standard_Transient {
	public:
		/****** Approx_SweepFunction::BarycentreOfSurf ******/
		/****** md5 signature: cbc6eaf5619edbfc0f2839466f8de856 ******/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get the barycentre of Surface. An very poor estimation is sufficient. This information is useful to perform well conditioned rational approximation. Warning: Used only if <self> IsRational.
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****** Approx_SweepFunction::D0 ******/
		/****** md5 signature: 139972f49c94e362e86042c656141720 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
First: double
Last: double
Poles: NCollection_Array1<gp_Pnt>
Poles2d: NCollection_Array1<gp_Pnt2d>
Weigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
compute the section for v = param.
") D0;
		virtual bool D0(const double Param, const double First, const double Last, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<double> & Weigths);

		/****** Approx_SweepFunction::D1 ******/
		/****** md5 signature: 96b8426a937cc7c9d5c454d6c0f5b125 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
First: double
Last: double
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
compute the first derivative in v direction of the section for v = param Warning: It used only for C1 or C2 approximation.
") D1;
		virtual bool D1(const double Param, const double First, const double Last, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths);

		/****** Approx_SweepFunction::D2 ******/
		/****** md5 signature: 7ce74cf3fc67773f29426766bd94a96c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
First: double
Last: double
Poles: NCollection_Array1<gp_Pnt>
DPoles: NCollection_Array1<gp_Vec>
D2Poles: NCollection_Array1<gp_Vec>
Poles2d: NCollection_Array1<gp_Pnt2d>
DPoles2d: NCollection_Array1<gp_Vec2d>
D2Poles2d: NCollection_Array1<gp_Vec2d>
Weigths: NCollection_Array1<double>
DWeigths: NCollection_Array1<double>
D2Weigths: NCollection_Array1<double>

Return
-------
bool

Description
-----------
compute the second derivative in v direction of the section for v = param Warning: It used only for C2 approximation.
") D2;
		virtual bool D2(const double Param, const double First, const double Last, NCollection_Array1<gp_Pnt> & Poles, NCollection_Array1<gp_Vec> & DPoles, NCollection_Array1<gp_Vec> & D2Poles, NCollection_Array1<gp_Pnt2d> & Poles2d, NCollection_Array1<gp_Vec2d> & DPoles2d, NCollection_Array1<gp_Vec2d> & D2Poles2d, NCollection_Array1<double> & Weigths, NCollection_Array1<double> & DWeigths, NCollection_Array1<double> & D2Weigths);

		/****** Approx_SweepFunction::GetMinimalWeight ******/
		/****** md5 signature: 5fafe98ac27c4733d46e0d69feb7782c ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles in all sections. This information is useful to control error in rational approximation. Warning: Used only if <self> IsRational.
") GetMinimalWeight;
		virtual void GetMinimalWeight(NCollection_Array1<double> & Weigths);

		/****** Approx_SweepFunction::GetTolerance ******/
		/****** md5 signature: 445238f8780bb5bcf2c4e87841c8b27e ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: NCollection_Array1<double>

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to satisfy. BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.
") GetTolerance;
		virtual void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, NCollection_Array1<double> & Tol3d);

		/****** Approx_SweepFunction::Intervals ******/
		/****** md5 signature: 3d6a840a7f0f4eea65b38aa9a495c6b6 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** Approx_SweepFunction::IsRational ******/
		/****** md5 signature: de83bb68c1e76368c633eba18c70426f ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are rational or not.
") IsRational;
		virtual bool IsRational();

		/****** Approx_SweepFunction::Knots ******/
		/****** md5 signature: cfde313360c61a2796f89f68da12c4bf ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: NCollection_Array1<double>

Return
-------
None

Description
-----------
get the Knots of the section.
") Knots;
		virtual void Knots(NCollection_Array1<double> & TKnots);

		/****** Approx_SweepFunction::MaximalSection ******/
		/****** md5 signature: f27749b971d9772713d6afbaa10a7741 ******/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the greater section. This information is useful to G1's control. Warning: With an little value, approximation can be slower.
") MaximalSection;
		virtual double MaximalSection();

		/****** Approx_SweepFunction::Mults ******/
		/****** md5 signature: 1a3ca416f34aaec2bdd0fc29e01dbcf7 ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: NCollection_Array1<int>

Return
-------
None

Description
-----------
get the Multplicities of the section.
") Mults;
		virtual void Mults(NCollection_Array1<int> & TMults);

		/****** Approx_SweepFunction::Nb2dCurves ******/
		/****** md5 signature: 33b12d283b95a653c2a21a8d8f8578af ******/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
get the number of 2d curves to approximate.
") Nb2dCurves;
		virtual int Nb2dCurves();

		/****** Approx_SweepFunction::NbIntervals ******/
		/****** md5 signature: 9ac7bc3c23f26b850f256bf654af74c8 ******/
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
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual int NbIntervals(const GeomAbs_Shape S);

		/****** Approx_SweepFunction::Resolution ******/
		/****** md5 signature: c6fc35c8e86b98fabd3f783889c59162 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Index: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
Returns the resolutions in the sub-space 2d <Index> This information is useful to find a good tolerance in 2d approximation.
") Resolution;
		virtual void Resolution(const int Index, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Approx_SweepFunction::SectionShape ******/
		/****** md5 signature: 29608ae8e60b3ee57b1d164e74a17e92 ******/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int

Description
-----------
get the format of an section.
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Approx_SweepFunction::SetInterval ******/
		/****** md5 signature: e0781594541ee7a04601bba1b7835e6a ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const double First, const double Last);

		/****** Approx_SweepFunction::SetTolerance ******/
		/****** md5 signature: 4fcfaf45a678f1e9e0e3a8fa200c969b ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: double
Tol2d: double

Return
-------
None

Description
-----------
Is useful, if (me) have to run numerical algorithm to perform D0, D1 or D2.
") SetTolerance;
		virtual void SetTolerance(const double Tol3d, const double Tol2d);

};


%make_alias(Approx_SweepFunction)

%extend Approx_SweepFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class Approx_HArray1OfAdHSurface : public NCollection_Array1<opencascade::handle<Adaptor3d_Surface>>, public Standard_Transient {
  public:
    Approx_HArray1OfAdHSurface(const Standard_Integer theLower, const Standard_Integer theUpper);
    Approx_HArray1OfAdHSurface(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<Adaptor3d_Surface>>::value_type& theValue);
    Approx_HArray1OfAdHSurface(const NCollection_Array1<opencascade::handle<Adaptor3d_Surface>>& theOther);
    const NCollection_Array1<opencascade::handle<Adaptor3d_Surface>>& Array1();
    NCollection_Array1<opencascade::handle<Adaptor3d_Surface>>& ChangeArray1();
};
%make_alias(Approx_HArray1OfAdHSurface)


class Approx_HArray1OfGTrsf2d : public NCollection_Array1<gp_GTrsf2d>, public Standard_Transient {
  public:
    Approx_HArray1OfGTrsf2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    Approx_HArray1OfGTrsf2d(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<gp_GTrsf2d>::value_type& theValue);
    Approx_HArray1OfGTrsf2d(const NCollection_Array1<gp_GTrsf2d>& theOther);
    const NCollection_Array1<gp_GTrsf2d>& Array1();
    NCollection_Array1<gp_GTrsf2d>& ChangeArray1();
};
%make_alias(Approx_HArray1OfGTrsf2d)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
