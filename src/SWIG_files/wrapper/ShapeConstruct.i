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
%define SHAPECONSTRUCTDOCSTRING
"ShapeConstruct module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_shapeconstruct.html"
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
		/****** md5 signature: e96a2bc2620f51a54c516074790b0c2a ******/
		%feature("compactdefaultargs") ConvertCurveToBSpline;
		%feature("autodoc", "
Parameters
----------
C3D: Geom_Curve
First: float
Last: float
Tol3d: float
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
		static opencascade::handle<Geom_BSplineCurve> ConvertCurveToBSpline(const opencascade::handle<Geom_Curve> & C3D, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol3d, const GeomAbs_Shape Continuity, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****** ShapeConstruct::ConvertCurveToBSpline ******/
		/****** md5 signature: 6affa3a8972ff115e6414cc34e8d7653 ******/
		%feature("compactdefaultargs") ConvertCurveToBSpline;
		%feature("autodoc", "
Parameters
----------
C2D: Geom2d_Curve
First: float
Last: float
Tol2d: float
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
		static opencascade::handle<Geom2d_BSplineCurve> ConvertCurveToBSpline(const opencascade::handle<Geom2d_Curve> & C2D, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol2d, const GeomAbs_Shape Continuity, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****** ShapeConstruct::ConvertSurfaceToBSpline ******/
		/****** md5 signature: 56c3fbc2fcbd52cf0207750979158da5 ******/
		%feature("compactdefaultargs") ConvertSurfaceToBSpline;
		%feature("autodoc", "
Parameters
----------
surf: Geom_Surface
UF: float
UL: float
VF: float
VL: float
Tol3d: float
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
		static opencascade::handle<Geom_BSplineSurface> ConvertSurfaceToBSpline(const opencascade::handle<Geom_Surface> & surf, const Standard_Real UF, const Standard_Real UL, const Standard_Real VF, const Standard_Real VL, const Standard_Real Tol3d, const GeomAbs_Shape Continuity, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****** ShapeConstruct::JoinCurves ******/
		/****** md5 signature: 42f6c6d994f5046d227e89efea81a64e ******/
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
first1: float
last1: float
first2: float
last2: float
isRev1: bool
isRev2: bool

Description
-----------
Method for joininig curves 3D. Parameters: c3d1,ac3d2 - initial curves Orient1, Orient2 - initial edges orientations. first1,last1,first2,last2 - parameters for trimming curves (re-calculate with account of orientation edges) c3dOut - result curve isRev1,isRev2 - out parameters indicative on possible errors. Return value: True - if curves were joined successfully, else - False.
") JoinCurves;
		static Standard_Boolean JoinCurves(const opencascade::handle<Geom_Curve> & c3d1, const opencascade::handle<Geom_Curve> & ac3d2, const TopAbs_Orientation Orient1, const TopAbs_Orientation Orient2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, opencascade::handle<Geom_Curve> & c3dOut, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** ShapeConstruct::JoinCurves ******/
		/****** md5 signature: b94c3f264bbba3ef8c7cb35ad5f19df9 ******/
		%feature("compactdefaultargs") JoinCurves;
		%feature("autodoc", "
Parameters
----------
c2d1: Geom2d_Curve
ac2d2: Geom2d_Curve
Orient1: TopAbs_Orientation
Orient2: TopAbs_Orientation
c2dOut: Geom2d_Curve
isError: bool (optional, default to Standard_False)

Return
-------
first1: float
last1: float
first2: float
last2: float
isRev1: bool
isRev2: bool

Description
-----------
Method for joininig curves 3D. Parameters: c3d1,ac3d2 - initial curves Orient1, Orient2 - initial edges orientations. first1,last1,first2,last2 - parameters for trimming curves (re-calculate with account of orientation edges) c3dOut - result curve isRev1,isRev2 - out parameters indicative on possible errors. isError - input parameter indicative possible errors due to that one from edges have one vertex Return value: True - if curves were joined successfully, else - False.
") JoinCurves;
		static Standard_Boolean JoinCurves(const opencascade::handle<Geom2d_Curve> & c2d1, const opencascade::handle<Geom2d_Curve> & ac2d2, const TopAbs_Orientation Orient1, const TopAbs_Orientation Orient2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, opencascade::handle<Geom2d_Curve> & c2dOut, Standard_Boolean &OutValue, Standard_Boolean &OutValue, const Standard_Boolean isError = Standard_False);

		/****** ShapeConstruct::JoinPCurves ******/
		/****** md5 signature: e9caa72c09cd9d39fbc1b7c2c547c6cd ******/
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
		static Standard_Boolean JoinPCurves(const opencascade::handle<TopTools_HSequenceOfShape> & theEdges, const TopoDS_Face & theFace, TopoDS_Edge & theEdge);

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
		/****** md5 signature: 1f7d7c10e6b8249c15e41e423ec5f10e ******/
		%feature("compactdefaultargs") AdjustCurve;
		%feature("autodoc", "
Parameters
----------
C3D: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt
take1: bool (optional, default to Standard_True)
take2: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Modifies a curve in order to make its bounds confused with given points. Works only on lines and B-Splines, returns True in this case, else returns False. For line considers both bounding points, for B-Splines only specified. //! Warning: Does not check if curve should be reversed.
") AdjustCurve;
		Standard_Boolean AdjustCurve(const opencascade::handle<Geom_Curve> & C3D, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Boolean take1 = Standard_True, const Standard_Boolean take2 = Standard_True);

		/****** ShapeConstruct_Curve::AdjustCurve2d ******/
		/****** md5 signature: 0ed4029b1e71b0f5f025a693259e9542 ******/
		%feature("compactdefaultargs") AdjustCurve2d;
		%feature("autodoc", "
Parameters
----------
C2D: Geom2d_Curve
P1: gp_Pnt2d
P2: gp_Pnt2d
take1: bool (optional, default to Standard_True)
take2: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Modifies a curve in order to make its bounds confused with given points. Works only on lines and B-Splines, returns True in this case, else returns False. //! For line considers both bounding points, for B-Splines only specified. //! Warning: Does not check if curve should be reversed.
") AdjustCurve2d;
		Standard_Boolean AdjustCurve2d(const opencascade::handle<Geom2d_Curve> & C2D, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Boolean take1 = Standard_True, const Standard_Boolean take2 = Standard_True);

		/****** ShapeConstruct_Curve::AdjustCurveSegment ******/
		/****** md5 signature: 55a46b78ba47eac061ad1db867f897d3 ******/
		%feature("compactdefaultargs") AdjustCurveSegment;
		%feature("autodoc", "
Parameters
----------
C3D: Geom_Curve
P1: gp_Pnt
P2: gp_Pnt
U1: float
U2: float

Return
-------
bool

Description
-----------
Modifies a curve in order to make its bounds confused with given points. Works only on lines and B-Splines. //! For lines works as previous method, B-Splines are segmented at the given values and then are adjusted to the points.
") AdjustCurveSegment;
		Standard_Boolean AdjustCurveSegment(const opencascade::handle<Geom_Curve> & C3D, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real U1, const Standard_Real U2);

		/****** ShapeConstruct_Curve::ConvertToBSpline ******/
		/****** md5 signature: 19376ff893525dcd6cf5e373ee85abb9 ******/
		%feature("compactdefaultargs") ConvertToBSpline;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
first: float
last: float
prec: float

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
Converts a curve of any type (only part from first to last) to bspline. The method of conversion depends on the type of original curve: BSpline -> C.Segment(first,last) Bezier and Line -> GeomConvert::CurveToBSplineCurve(C).Segment(first,last) Conic and Other -> Approx_Curve3d(C[first,last],prec,C1,9,1000).
") ConvertToBSpline;
		opencascade::handle<Geom_BSplineCurve> ConvertToBSpline(const opencascade::handle<Geom_Curve> & C, const Standard_Real first, const Standard_Real last, const Standard_Real prec);

		/****** ShapeConstruct_Curve::ConvertToBSpline ******/
		/****** md5 signature: 67e22df5c9b6aa1af20547791bd07c17 ******/
		%feature("compactdefaultargs") ConvertToBSpline;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
first: float
last: float
prec: float

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
Converts a curve of any type (only part from first to last) to bspline. The method of conversion depends on the type of original curve: BSpline -> C.Segment(first,last) Bezier and Line -> GeomConvert::CurveToBSplineCurve(C).Segment(first,last) Conic and Other -> Approx_Curve2d(C[first,last],prec,C1,9,1000).
") ConvertToBSpline;
		opencascade::handle<Geom2d_BSplineCurve> ConvertToBSpline(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real first, const Standard_Real last, const Standard_Real prec);

		/****** ShapeConstruct_Curve::FixKnots ******/
		/****** md5 signature: 2d6b81e7c20061f8b14bd4eab45dd379 ******/
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
		static Standard_Boolean FixKnots(opencascade::handle<TColStd_HArray1OfReal> & knots);

		/****** ShapeConstruct_Curve::FixKnots ******/
		/****** md5 signature: b95e53e8ec1c41f8c3c30eaff8ebc9e3 ******/
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
		static Standard_Boolean FixKnots(TColStd_Array1OfReal & knots);

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
		/****** md5 signature: a1d799816fdb6a068fe983d47396aaee ******/
		%feature("compactdefaultargs") ShapeConstruct_MakeTriangulation;
		%feature("autodoc", "
Parameters
----------
pnts: TColgp_Array1OfPnt
prec: float (optional, default to 0.0)

Return
-------
None

Description
-----------
No available documentation.
") ShapeConstruct_MakeTriangulation;
		 ShapeConstruct_MakeTriangulation(const TColgp_Array1OfPnt & pnts, const Standard_Real prec = 0.0);

		/****** ShapeConstruct_MakeTriangulation::ShapeConstruct_MakeTriangulation ******/
		/****** md5 signature: 268d8bbbc20b03fa4d66d26585d7d055 ******/
		%feature("compactdefaultargs") ShapeConstruct_MakeTriangulation;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
prec: float (optional, default to 0.0)

Return
-------
None

Description
-----------
No available documentation.
") ShapeConstruct_MakeTriangulation;
		 ShapeConstruct_MakeTriangulation(const TopoDS_Wire & wire, const Standard_Real prec = 0.0);

		/****** ShapeConstruct_MakeTriangulation::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
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
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** ShapeConstruct_MakeTriangulation::IsDone ******/
		/****** md5 signature: e2af43c18fdd9d21f5f5de9eae7fc9de ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		virtual Standard_Boolean IsDone();

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


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetAdjustOverDegenMode() {
            return (Standard_Integer) $self->AdjustOverDegenMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetAdjustOverDegenMode(Standard_Integer value) {
            $self->AdjustOverDegenMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetBuildCurveMode() {
            return (Standard_Boolean) $self->BuildCurveMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetBuildCurveMode(Standard_Boolean value) {
            $self->BuildCurveMode()=value;
            }
        };
		/****** ShapeConstruct_ProjectCurveOnSurface::Init ******/
		/****** md5 signature: 1f582cc2d24023b4359dab08f603d2dd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
surf: Geom_Surface
preci: float

Return
-------
None

Description
-----------
Initializes the object with all necessary parameters, i.e. surface and precision.
") Init;
		virtual void Init(const opencascade::handle<Geom_Surface> & surf, const Standard_Real preci);

		/****** ShapeConstruct_ProjectCurveOnSurface::Init ******/
		/****** md5 signature: bf33f56618306090b1bb182cce883fc5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
surf: ShapeAnalysis_Surface
preci: float

Return
-------
None

Description
-----------
Initializes the object with all necessary parameters, i.e. surface and precision.
") Init;
		virtual void Init(const opencascade::handle<ShapeAnalysis_Surface> & surf, const Standard_Real preci);

		/****** ShapeConstruct_ProjectCurveOnSurface::Perform ******/
		/****** md5 signature: 9d4fd560cded5434d94dcb5871e6e101 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
c3d: Geom_Curve
First: float
Last: float
c2d: Geom2d_Curve
TolFirst: float (optional, default to -1)
TolLast: float (optional, default to -1)

Return
-------
bool

Description
-----------
Computes the projection of 3d curve onto a surface using the specialized algorithm. Returns False if projector fails, otherwise, if pcurve computed successfully, returns True. The output curve 2D is guaranteed to be same-parameter with input curve 3D on the interval [First, Last]. If the output curve lies on a direct line the infinite line is returned, in the case same-parameter condition is satisfied. TolFirst and TolLast are the tolerances at the ends of input curve 3D.
") Perform;
		virtual Standard_Boolean Perform(opencascade::handle<Geom_Curve> & c3d, const Standard_Real First, const Standard_Real Last, opencascade::handle<Geom2d_Curve> & c2d, const Standard_Real TolFirst = -1, const Standard_Real TolLast = -1);

		/****** ShapeConstruct_ProjectCurveOnSurface::PerformByProjLib ******/
		/****** md5 signature: 90451a772b63955977e470cddd05bd72 ******/
		%feature("compactdefaultargs") PerformByProjLib;
		%feature("autodoc", "
Parameters
----------
c3d: Geom_Curve
First: float
Last: float
c2d: Geom2d_Curve
continuity: GeomAbs_Shape (optional, default to GeomAbs_C1)
maxdeg: int (optional, default to 12)
nbinterval: int (optional, default to -1)

Return
-------
bool

Description
-----------
Computes the projection of 3d curve onto a surface using the standard algorithm from ProjLib. Returns False if standard projector fails or raises an exception or cuts the curve by parametrical bounds of the surface. Else, if pcurve computed successfully, returns True. The continuity, maxdeg and nbinterval are parameters of call to Approx_CurveOnSurface. If nbinterval is equal to -1 (default), this value is computed depending on source 3d curve and surface.
") PerformByProjLib;
		Standard_Boolean PerformByProjLib(opencascade::handle<Geom_Curve> & c3d, const Standard_Real First, const Standard_Real Last, opencascade::handle<Geom2d_Curve> & c2d, const GeomAbs_Shape continuity = GeomAbs_C1, const Standard_Integer maxdeg = 12, const Standard_Integer nbinterval = -1);

		/****** ShapeConstruct_ProjectCurveOnSurface::SetPrecision ******/
		/****** md5 signature: a601cf881702916ad1a5bcd1fec314c4 ******/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "
Parameters
----------
preci: float

Return
-------
None

Description
-----------
Sets value for current precision.
") SetPrecision;
		void SetPrecision(const Standard_Real preci);

		/****** ShapeConstruct_ProjectCurveOnSurface::SetSurface ******/
		/****** md5 signature: ef3c30882af3f3cdd5459f6b9a1a3525 ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
surf: Geom_Surface

Return
-------
None

Description
-----------
Loads a surface (in the form of Geom_Surface) to project on.
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & surf);

		/****** ShapeConstruct_ProjectCurveOnSurface::SetSurface ******/
		/****** md5 signature: a6a6097a9a1f4fb18a1495928444e79b ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
surf: ShapeAnalysis_Surface

Return
-------
None

Description
-----------
Loads a surface (in the form of ShapeAnalysis_Surface) to project on.
") SetSurface;
		void SetSurface(const opencascade::handle<ShapeAnalysis_Surface> & surf);

		/****** ShapeConstruct_ProjectCurveOnSurface::Status ******/
		/****** md5 signature: 03f2df8a606eef2de1cd56a4ae73f0f0 ******/
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
Returns the status of last Perform.
") Status;
		Standard_Boolean Status(const ShapeExtend_Status theStatus);

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
