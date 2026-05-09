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
%define SHAPECONSTRUCTDOCSTRING
"ShapeConstruct module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_shapeconstruct.html"
%enddef
%module (package="OCC.Core", docstring=SHAPECONSTRUCTDOCSTRING) ShapeConstruct


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
#include<ShapeConstruct_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<TopAbs_module.hxx>
#include<TopTools_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<TColgp_module.hxx>
#include<Message_module.hxx>
#include<ShapeAnalysis_module.hxx>
#include<ShapeExtend_module.hxx>
#include<TCollection_module.hxx>
#include<BRep_module.hxx>
#include<Bnd_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColGeom_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TopLoc_module.hxx>
#include<TShort_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<BRepTools_module.hxx>
#include<IntRes2d_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<ShapeAnalysis_module.hxx>
#include<Geom_module.hxx>
#include<TopTools_module.hxx>
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
%import TopAbs.i
%import TopTools.i
%import TopoDS.i
%import gp.i
%import TColStd.i
%import BRepBuilderAPI.i
%import TColgp.i
%import Message.i
%import ShapeAnalysis.i
%import ShapeExtend.i

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
%wrap_handle(ShapeConstruct_ProjectCurveOnSurface)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***********************
* class ShapeConstruct *
***********************/
%rename(shapeconstruct) ShapeConstruct;
class ShapeConstruct {
	public:
		/****** ShapeConstruct::ConvertCurveToBSpline ******/
		/****** md5 signature: a684b49495b736c0ec09e6694c0380ea ******/
		%feature("compactdefaultargs") ConvertCurveToBSpline;
		%feature("autodoc", "
Parameters
----------
C3D: Geom_Curve
First: double
Last: double
Tol3d: double
Continuity: GeomAbs_Shape
MaxSegments: int
MaxDegree: int

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
Tool for wire triangulation.
") ConvertCurveToBSpline;
		static opencascade::handle<Geom_BSplineCurve> ConvertCurveToBSpline(const opencascade::handle<Geom_Curve> & C3D, const double First, const double Last, const double Tol3d, const GeomAbs_Shape Continuity, const int MaxSegments, const int MaxDegree);

		/****** ShapeConstruct::ConvertCurveToBSpline ******/
		/****** md5 signature: 28db48cbcf09d71ece5abfe24a21a4e7 ******/
		%feature("compactdefaultargs") ConvertCurveToBSpline;
		%feature("autodoc", "
Parameters
----------
C2D: Geom2d_Curve
First: double
Last: double
Tol2d: double
Continuity: GeomAbs_Shape
MaxSegments: int
MaxDegree: int

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") ConvertCurveToBSpline;
		static opencascade::handle<Geom2d_BSplineCurve> ConvertCurveToBSpline(const opencascade::handle<Geom2d_Curve> & C2D, const double First, const double Last, const double Tol2d, const GeomAbs_Shape Continuity, const int MaxSegments, const int MaxDegree);

		/****** ShapeConstruct::ConvertSurfaceToBSpline ******/
		/****** md5 signature: 10f313851b1cf77d8ab6ef6e0f6d574d ******/
		%feature("compactdefaultargs") ConvertSurfaceToBSpline;
		%feature("autodoc", "
Parameters
----------
surf: Geom_Surface
UF: double
UL: double
VF: double
VL: double
Tol3d: double
Continuity: GeomAbs_Shape
MaxSegments: int
MaxDegree: int

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
No available documentation.
") ConvertSurfaceToBSpline;
		static opencascade::handle<Geom_BSplineSurface> ConvertSurfaceToBSpline(const opencascade::handle<Geom_Surface> & surf, const double UF, const double UL, const double VF, const double VL, const double Tol3d, const GeomAbs_Shape Continuity, const int MaxSegments, const int MaxDegree);

		/****** ShapeConstruct::JoinCurves ******/
		/****** md5 signature: c969c5eee634e2fc143b25902cee09d2 ******/
		%feature("compactdefaultargs") JoinCurves;
		%feature("autodoc", "
Parameters
----------
c3d1: Geom_Curve
ac3d2: Geom_Curve
Orient1: TopAbs_Orientation
Orient2: TopAbs_Orientation
c3dOut: Geom_Curve

Return
-------
first1: double
last1: double
first2: double
last2: double
isRev1: bool
isRev2: bool

Description
-----------
Method for joininig curves 3D. Parameters: c3d1,ac3d2 - initial curves Orient1, Orient2 - initial edges orientations. first1,last1,first2,last2 - parameters for trimming curves (re-calculate with account of orientation edges) c3dOut - result curve isRev1,isRev2 - out parameters indicative on possible errors. Return value: True - if curves were joined successfully, else - False.
") JoinCurves;
		static bool JoinCurves(const opencascade::handle<Geom_Curve> & c3d1, const opencascade::handle<Geom_Curve> & ac3d2, const TopAbs_Orientation Orient1, const TopAbs_Orientation Orient2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, opencascade::handle<Geom_Curve> & c3dOut, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** ShapeConstruct::JoinCurves ******/
		/****** md5 signature: 74b7596cf5f642c14ff6006b10d735a7 ******/
		%feature("compactdefaultargs") JoinCurves;
		%feature("autodoc", "
Parameters
----------
c2d1: Geom2d_Curve
ac2d2: Geom2d_Curve
Orient1: TopAbs_Orientation
Orient2: TopAbs_Orientation
c2dOut: Geom2d_Curve
isError: bool (optional, default to false)

Return
-------
first1: double
last1: double
first2: double
last2: double
isRev1: bool
isRev2: bool

Description
-----------
Method for joininig curves 3D. Parameters: c3d1,ac3d2 - initial curves Orient1, Orient2 - initial edges orientations. first1,last1,first2,last2 - parameters for trimming curves (re-calculate with account of orientation edges) c3dOut - result curve isRev1,isRev2 - out parameters indicative on possible errors. isError - input parameter indicative possible errors due to that one from edges have one vertex Return value: True - if curves were joined successfully, else - False.
") JoinCurves;
		static bool JoinCurves(const opencascade::handle<Geom2d_Curve> & c2d1, const opencascade::handle<Geom2d_Curve> & ac2d2, const TopAbs_Orientation Orient1, const TopAbs_Orientation Orient2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, opencascade::handle<Geom2d_Curve> & c2dOut, Standard_Boolean &OutValue, Standard_Boolean &OutValue, const bool isError = false);

		/****** ShapeConstruct::JoinPCurves ******/
		/****** md5 signature: c7703b35f077f2220961b0e897d1bf15 ******/
		%feature("compactdefaultargs") JoinPCurves;
		%feature("autodoc", "
Parameters
----------
theEdges: TopTools_HSequenceOfShape
theFace: TopoDS_Face
theEdge: TopoDS_Edge

Return
-------
bool

Description
-----------
join pcurves of the <theEdge> on the <theFace> try to use pcurves from originas edges <theEdges> Returns false if cannot join pcurves.
") JoinPCurves;
		static bool JoinPCurves(const opencascade::handle<TopTools_HSequenceOfShape> & theEdges, const TopoDS_Face & theFace, TopoDS_Edge & theEdge);

};


%extend ShapeConstruct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class ShapeConstruct_Curve *
*****************************/
class ShapeConstruct_Curve {
	public:
		/****** ShapeConstruct_Curve::AdjustCurve ******/
		/****** md5 signature: ab388f417b748d9ba7162a882f8ca6ad ******/
		%feature("compactdefaultargs") AdjustCurve;
		%feature("autodoc", "
Parameters
----------
C3D: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt
take1: bool (optional, default to true)
take2: bool (optional, default to true)

Return
-------
bool

Description
-----------
Modifies a curve in order to make its bounds confused with given points. Works only on lines and B-Splines, returns True in this case, else returns False. For line considers both bounding points, for B-Splines only specified. //! Warning: Does not check if curve should be reversed.
") AdjustCurve;
		bool AdjustCurve(const opencascade::handle<Geom_Curve> & C3D, const gp_Pnt & P1, const gp_Pnt & P2, const bool take1 = true, const bool take2 = true);

		/****** ShapeConstruct_Curve::AdjustCurve2d ******/
		/****** md5 signature: e810b541905dfb633f6c0a026bef0d90 ******/
		%feature("compactdefaultargs") AdjustCurve2d;
		%feature("autodoc", "
Parameters
----------
C2D: Geom2d_Curve
P1: gp_Pnt2d
P2: gp_Pnt2d
take1: bool (optional, default to true)
take2: bool (optional, default to true)

Return
-------
bool

Description
-----------
Modifies a curve in order to make its bounds confused with given points. Works only on lines and B-Splines, returns True in this case, else returns False. //! For line considers both bounding points, for B-Splines only specified. //! Warning: Does not check if curve should be reversed.
") AdjustCurve2d;
		bool AdjustCurve2d(const opencascade::handle<Geom2d_Curve> & C2D, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const bool take1 = true, const bool take2 = true);

		/****** ShapeConstruct_Curve::AdjustCurveSegment ******/
		/****** md5 signature: eb14bd262b240b42cca96f70ef035f1f ******/
		%feature("compactdefaultargs") AdjustCurveSegment;
		%feature("autodoc", "
Parameters
----------
C3D: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt
U1: double
U2: double

Return
-------
bool

Description
-----------
Modifies a curve in order to make its bounds confused with given points. Works only on lines and B-Splines. //! For lines works as previous method, B-Splines are segmented at the given values and then are adjusted to the points.
") AdjustCurveSegment;
		bool AdjustCurveSegment(const opencascade::handle<Geom_Curve> & C3D, const gp_Pnt & P1, const gp_Pnt & P2, const double U1, const double U2);

		/****** ShapeConstruct_Curve::ConvertToBSpline ******/
		/****** md5 signature: 3c4b4202e6f16cf630aa0845c9e9cb29 ******/
		%feature("compactdefaultargs") ConvertToBSpline;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
first: double
last: double
prec: double

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
Converts a curve of any type (only part from first to last) to bspline. The method of conversion depends on the type of original curve: BSpline -> C.Segment(first,last) Bezier and Line -> GeomConvert::CurveToBSplineCurve(C).Segment(first,last) Conic and Other -> Approx_Curve3d(C[first,last],prec,C1,9,1000).
") ConvertToBSpline;
		opencascade::handle<Geom_BSplineCurve> ConvertToBSpline(const opencascade::handle<Geom_Curve> & C, const double first, const double last, const double prec);

		/****** ShapeConstruct_Curve::ConvertToBSpline ******/
		/****** md5 signature: c7e37f125eda1fd4231071e51f61d4c6 ******/
		%feature("compactdefaultargs") ConvertToBSpline;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
first: double
last: double
prec: double

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
Converts a curve of any type (only part from first to last) to bspline. The method of conversion depends on the type of original curve: BSpline -> C.Segment(first,last) Bezier and Line -> GeomConvert::CurveToBSplineCurve(C).Segment(first,last) Conic and Other -> Approx_Curve2d(C[first,last],prec,C1,9,1000).
") ConvertToBSpline;
		opencascade::handle<Geom2d_BSplineCurve> ConvertToBSpline(const opencascade::handle<Geom2d_Curve> & C, const double first, const double last, const double prec);

		/****** ShapeConstruct_Curve::FixKnots ******/
		/****** md5 signature: 87c89b06fa03a615d52b860280597a39 ******/
		%feature("compactdefaultargs") FixKnots;
		%feature("autodoc", "
Parameters
----------
knots: TColStd_HArray1OfReal

Return
-------
bool

Description
-----------
No available documentation.
") FixKnots;
		static bool FixKnots(opencascade::handle<TColStd_HArray1OfReal> & knots);

		/****** ShapeConstruct_Curve::FixKnots ******/
		/****** md5 signature: dfe69e85e0d4e6505ec9de59f0bdcf22 ******/
		%feature("compactdefaultargs") FixKnots;
		%feature("autodoc", "
Parameters
----------
knots: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Fix bspline knots to ensure that there is enough gap between neighbouring values Returns True if something fixed (by shifting knot).
") FixKnots;
		static bool FixKnots(TColStd_Array1OfReal & knots);

};


%extend ShapeConstruct_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class ShapeConstruct_MakeTriangulation *
*****************************************/
class ShapeConstruct_MakeTriangulation : public BRepBuilderAPI_MakeShape {
	public:
		/****** ShapeConstruct_MakeTriangulation::ShapeConstruct_MakeTriangulation ******/
		/****** md5 signature: 4c23a99dbae26342fb8e8af09e1c2d75 ******/
		%feature("compactdefaultargs") ShapeConstruct_MakeTriangulation;
		%feature("autodoc", "
Parameters
----------
pnts: TColgp_Array1OfPnt
prec: double (optional, default to 0.0)

Return
-------
None

Description
-----------
No available documentation.
") ShapeConstruct_MakeTriangulation;
		 ShapeConstruct_MakeTriangulation(const TColgp_Array1OfPnt & pnts, const double prec = 0.0);

		/****** ShapeConstruct_MakeTriangulation::ShapeConstruct_MakeTriangulation ******/
		/****** md5 signature: e4be25e634dd3ca94a4ebc78ccecb6a3 ******/
		%feature("compactdefaultargs") ShapeConstruct_MakeTriangulation;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
prec: double (optional, default to 0.0)

Return
-------
None

Description
-----------
No available documentation.
") ShapeConstruct_MakeTriangulation;
		 ShapeConstruct_MakeTriangulation(const TopoDS_Wire & wire, const double prec = 0.0);

		/****** ShapeConstruct_MakeTriangulation::Build ******/
		/****** md5 signature: f3b0074314a23751c5565edb1d5f04f5 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") Build;
		void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** ShapeConstruct_MakeTriangulation::IsDone ******/
		/****** md5 signature: 2be114a985aea21262ebd32099ccc3a6 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

};


%extend ShapeConstruct_MakeTriangulation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class ShapeConstruct_ProjectCurveOnSurface *
*********************************************/
class ShapeConstruct_ProjectCurveOnSurface : public Standard_Transient {
	public:
		/****** ShapeConstruct_ProjectCurveOnSurface::ShapeConstruct_ProjectCurveOnSurface ******/
		/****** md5 signature: 4cb4d694dc4ad9b3f95b8440d3b8b9bc ******/
		%feature("compactdefaultargs") ShapeConstruct_ProjectCurveOnSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") ShapeConstruct_ProjectCurveOnSurface;
		 ShapeConstruct_ProjectCurveOnSurface();

		/****** ShapeConstruct_ProjectCurveOnSurface::AdjustOverDegenMode ******/
		/****** md5 signature: b9b4eb5b13b12ad35d5ce46689fe124b ******/
		%feature("compactdefaultargs") AdjustOverDegenMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (modifiable) the flag specifying to which side of parametrical space adjust part of pcurve which lies on seam. This is required in very rare case when 3d curve which is to be projected goes partly along the seam on the closed surface with singularity (e.g. sphere), goes through the degenerated point and partly lies on internal area of surface. //! If this flag is True, the seam part of such curve will be adjusted to the left side of parametric space (on sphere U=0), else to the right side (on sphere U=2*PI) Default value is True 
Return: modifiable reference to the adjustment flag.
") AdjustOverDegenMode;
		int & AdjustOverDegenMode();

		/****** ShapeConstruct_ProjectCurveOnSurface::Init ******/
		/****** md5 signature: 5e35524c6eecbe5f63342f4429b6f16f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_Surface
thePreci: double

Return
-------
None

Description
-----------
Initializes the object with all necessary parameters, i.e. surface and precision 
Input parameter: theSurf the surface to project on 
Input parameter: thePreci the precision for projection.
") Init;
		virtual void Init(const opencascade::handle<Geom_Surface> & theSurf, const double thePreci);

		/****** ShapeConstruct_ProjectCurveOnSurface::Init ******/
		/****** md5 signature: 7c3e8f7bcf310e1dae7b398aa3f887fb ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theSurf: ShapeAnalysis_Surface
thePreci: double

Return
-------
None

Description
-----------
Initializes the object with all necessary parameters, i.e. surface and precision 
Input parameter: theSurf the surface to project on (ShapeAnalysis_Surface) 
Input parameter: thePreci the precision for projection.
") Init;
		virtual void Init(const opencascade::handle<ShapeAnalysis_Surface> & theSurf, const double thePreci);

		/****** ShapeConstruct_ProjectCurveOnSurface::Perform ******/
		/****** md5 signature: 990bf59c43d852b1c8a278cdfb1f2b34 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theC3D: Geom_Curve
theFirst: double
theLast: double
theC2D: Geom2d_Curve
theTolFirst: double (optional, default to Precision::Confusion())
theTolLast: double (optional, default to Precision::Confusion())

Return
-------
bool

Description
-----------
Computes the projection of 3d curve onto a surface using the specialized algorithm. Returns False if projector fails, otherwise, if pcurve computed successfully, returns True. The output curve 2D is guaranteed to be same-parameter with input curve 3D on the interval [theFirst, theLast]. If the output curve lies on a direct line the infinite line is returned, in the case same-parameter condition is satisfied. 
Input parameter: theC3D the 3D curve to project 
Input parameter: theFirst the first parameter of the curve 
Input parameter: theLast the last parameter of the curve @param[out] theC2D the resulting 2D curve 
Input parameter: theTolFirst the tolerance at the first point (default: Precision::Confusion()) 
Input parameter: theTolLast the tolerance at the last point (default: Precision::Confusion()) 
Return: true if projection succeeded.
") Perform;
		virtual bool Perform(const opencascade::handle<Geom_Curve> & theC3D, const double theFirst, const double theLast, opencascade::handle<Geom2d_Curve> & theC2D, const double theTolFirst = Precision::Confusion(), const double theTolLast = Precision::Confusion());

		/****** ShapeConstruct_ProjectCurveOnSurface::SetPrecision ******/
		/****** md5 signature: b52083cca5e26b9625b008be55dce11a ******/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "
Parameters
----------
thePreci: double

Return
-------
None

Description
-----------
Sets value for current precision 
Input parameter: thePreci the precision value.
") SetPrecision;
		void SetPrecision(const double thePreci);

		/****** ShapeConstruct_ProjectCurveOnSurface::SetSurface ******/
		/****** md5 signature: 3ddeff6b55d475a067bfecfc41d52a9a ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_Surface

Return
-------
None

Description
-----------
Loads a surface (in the form of Geom_Surface) to project on 
Input parameter: theSurf the surface to project on.
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & theSurf);

		/****** ShapeConstruct_ProjectCurveOnSurface::SetSurface ******/
		/****** md5 signature: 0fffd7dbe2c230e007add83aa6d8be37 ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
theSurf: ShapeAnalysis_Surface

Return
-------
None

Description
-----------
Loads a surface (in the form of ShapeAnalysis_Surface) to project on 
Input parameter: theSurf the surface to project on.
") SetSurface;
		void SetSurface(const opencascade::handle<ShapeAnalysis_Surface> & theSurf);

		/****** ShapeConstruct_ProjectCurveOnSurface::Status ******/
		/****** md5 signature: d63ad8907bf1b94ad0798cc51997fd9f ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "
Parameters
----------
theStatus: ShapeExtend_Status

Return
-------
bool

Description
-----------
Returns the status of last Perform 
Input parameter: theStatus the status to query 
Return: true if the specified status is set.
") Status;
		bool Status(const ShapeExtend_Status theStatus);

		%extend{
			int GetAdjustOverDegenMode() { return self->AdjustOverDegenMode(); }
			void SetAdjustOverDegenMode(int value) { self->AdjustOverDegenMode() = value; }
		};
};


%make_alias(ShapeConstruct_ProjectCurveOnSurface)

%extend ShapeConstruct_ProjectCurveOnSurface {
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
def shapeconstruct_ConvertCurveToBSpline(*args):
	return shapeconstruct.ConvertCurveToBSpline(*args)

@deprecated
def shapeconstruct_ConvertCurveToBSpline(*args):
	return shapeconstruct.ConvertCurveToBSpline(*args)

@deprecated
def shapeconstruct_ConvertSurfaceToBSpline(*args):
	return shapeconstruct.ConvertSurfaceToBSpline(*args)

@deprecated
def shapeconstruct_JoinCurves(*args):
	return shapeconstruct.JoinCurves(*args)

@deprecated
def shapeconstruct_JoinCurves(*args):
	return shapeconstruct.JoinCurves(*args)

@deprecated
def shapeconstruct_JoinPCurves(*args):
	return shapeconstruct.JoinPCurves(*args)

@deprecated
def ShapeConstruct_Curve_FixKnots(*args):
	return ShapeConstruct_Curve.FixKnots(*args)

@deprecated
def ShapeConstruct_Curve_FixKnots(*args):
	return ShapeConstruct_Curve.FixKnots(*args)

}
