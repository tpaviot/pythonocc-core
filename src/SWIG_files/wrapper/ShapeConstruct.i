/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_shapeconstruct.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
%import ShapeAnalysis.i
%import ShapeExtend.i
/* public enums */
/* end public enums declaration */

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
		/****************** ConvertCurveToBSpline ******************/
		%feature("compactdefaultargs") ConvertCurveToBSpline;
		%feature("autodoc", "* Tool for wire triangulation
	:param C3D:
	:type C3D: Geom_Curve
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol3d:
	:type Tol3d: float
	:param Continuity:
	:type Continuity: GeomAbs_Shape
	:param MaxSegments:
	:type MaxSegments: int
	:param MaxDegree:
	:type MaxDegree: int
	:rtype: opencascade::handle<Geom_BSplineCurve>") ConvertCurveToBSpline;
		static opencascade::handle<Geom_BSplineCurve> ConvertCurveToBSpline (const opencascade::handle<Geom_Curve> & C3D,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol3d,const GeomAbs_Shape Continuity,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);

		/****************** ConvertCurveToBSpline ******************/
		%feature("compactdefaultargs") ConvertCurveToBSpline;
		%feature("autodoc", ":param C2D:
	:type C2D: Geom2d_Curve
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol2d:
	:type Tol2d: float
	:param Continuity:
	:type Continuity: GeomAbs_Shape
	:param MaxSegments:
	:type MaxSegments: int
	:param MaxDegree:
	:type MaxDegree: int
	:rtype: opencascade::handle<Geom2d_BSplineCurve>") ConvertCurveToBSpline;
		static opencascade::handle<Geom2d_BSplineCurve> ConvertCurveToBSpline (const opencascade::handle<Geom2d_Curve> & C2D,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol2d,const GeomAbs_Shape Continuity,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);

		/****************** ConvertSurfaceToBSpline ******************/
		%feature("compactdefaultargs") ConvertSurfaceToBSpline;
		%feature("autodoc", ":param surf:
	:type surf: Geom_Surface
	:param UF:
	:type UF: float
	:param UL:
	:type UL: float
	:param VF:
	:type VF: float
	:param VL:
	:type VL: float
	:param Tol3d:
	:type Tol3d: float
	:param Continuity:
	:type Continuity: GeomAbs_Shape
	:param MaxSegments:
	:type MaxSegments: int
	:param MaxDegree:
	:type MaxDegree: int
	:rtype: opencascade::handle<Geom_BSplineSurface>") ConvertSurfaceToBSpline;
		static opencascade::handle<Geom_BSplineSurface> ConvertSurfaceToBSpline (const opencascade::handle<Geom_Surface> & surf,const Standard_Real UF,const Standard_Real UL,const Standard_Real VF,const Standard_Real VL,const Standard_Real Tol3d,const GeomAbs_Shape Continuity,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);

		/****************** JoinCurves ******************/
		%feature("compactdefaultargs") JoinCurves;
		%feature("autodoc", "* Method for joininig curves 3D. Parameters : c3d1,ac3d2 - initial curves Orient1, Orient2 - initial edges orientations. first1,last1,first2,last2 - parameters for trimming curves (re-calculate with account of orientation edges) c3dOut - result curve isRev1,isRev2 - out parameters indicative on possible errors. Return value : True - if curves were joined successfully, else - False.
	:param c3d1:
	:type c3d1: Geom_Curve
	:param ac3d2:
	:type ac3d2: Geom_Curve
	:param Orient1:
	:type Orient1: TopAbs_Orientation
	:param Orient2:
	:type Orient2: TopAbs_Orientation
	:param first1:
	:type first1: float
	:param last1:
	:type last1: float
	:param first2:
	:type first2: float
	:param last2:
	:type last2: float
	:param c3dOut:
	:type c3dOut: Geom_Curve
	:param isRev1:
	:type isRev1: bool
	:param isRev2:
	:type isRev2: bool
	:rtype: bool") JoinCurves;
		static Standard_Boolean JoinCurves (const opencascade::handle<Geom_Curve> & c3d1,const opencascade::handle<Geom_Curve> & ac3d2,const TopAbs_Orientation Orient1,const TopAbs_Orientation Orient2,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,opencascade::handle<Geom_Curve> & c3dOut,Standard_Boolean &OutValue,Standard_Boolean &OutValue);

		/****************** JoinCurves ******************/
		%feature("compactdefaultargs") JoinCurves;
		%feature("autodoc", "* Method for joininig curves 3D. Parameters : c3d1,ac3d2 - initial curves Orient1, Orient2 - initial edges orientations. first1,last1,first2,last2 - parameters for trimming curves (re-calculate with account of orientation edges) c3dOut - result curve isRev1,isRev2 - out parameters indicative on possible errors. isError - input parameter indicative possible errors due to that one from edges have one vertex Return value : True - if curves were joined successfully, else - False.
	:param c2d1:
	:type c2d1: Geom2d_Curve
	:param ac2d2:
	:type ac2d2: Geom2d_Curve
	:param Orient1:
	:type Orient1: TopAbs_Orientation
	:param Orient2:
	:type Orient2: TopAbs_Orientation
	:param first1:
	:type first1: float
	:param last1:
	:type last1: float
	:param first2:
	:type first2: float
	:param last2:
	:type last2: float
	:param c2dOut:
	:type c2dOut: Geom2d_Curve
	:param isRev1:
	:type isRev1: bool
	:param isRev2:
	:type isRev2: bool
	:param isError: default value is Standard_False
	:type isError: bool
	:rtype: bool") JoinCurves;
		static Standard_Boolean JoinCurves (const opencascade::handle<Geom2d_Curve> & c2d1,const opencascade::handle<Geom2d_Curve> & ac2d2,const TopAbs_Orientation Orient1,const TopAbs_Orientation Orient2,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,opencascade::handle<Geom2d_Curve> & c2dOut,Standard_Boolean &OutValue,Standard_Boolean &OutValue,const Standard_Boolean isError = Standard_False);

		/****************** JoinPCurves ******************/
		%feature("compactdefaultargs") JoinPCurves;
		%feature("autodoc", "* join pcurves of the <theEdge> on the <theFace> try to use pcurves from originas edges <theEdges> Returns false if cannot join pcurves
	:param theEdges:
	:type theEdges: TopTools_HSequenceOfShape
	:param theFace:
	:type theFace: TopoDS_Face
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:rtype: bool") JoinPCurves;
		static Standard_Boolean JoinPCurves (const opencascade::handle<TopTools_HSequenceOfShape> & theEdges,const TopoDS_Face & theFace,TopoDS_Edge & theEdge);

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
		/****************** AdjustCurve ******************/
		%feature("compactdefaultargs") AdjustCurve;
		%feature("autodoc", "* Modifies a curve in order to make its bounds confused with given points. Works only on lines and B-Splines, returns True in this case, else returns False. For line considers both bounding points, for B-Splines only specified. //! Warning : Does not check if curve should be reversed
	:param C3D:
	:type C3D: Geom_Curve
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param take1: default value is Standard_True
	:type take1: bool
	:param take2: default value is Standard_True
	:type take2: bool
	:rtype: bool") AdjustCurve;
		Standard_Boolean AdjustCurve (const opencascade::handle<Geom_Curve> & C3D,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Boolean take1 = Standard_True,const Standard_Boolean take2 = Standard_True);

		/****************** AdjustCurve2d ******************/
		%feature("compactdefaultargs") AdjustCurve2d;
		%feature("autodoc", "* Modifies a curve in order to make its bounds confused with given points. Works only on lines and B-Splines, returns True in this case, else returns False. //! For line considers both bounding points, for B-Splines only specified. //! Warning : Does not check if curve should be reversed
	:param C2D:
	:type C2D: Geom2d_Curve
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:param take1: default value is Standard_True
	:type take1: bool
	:param take2: default value is Standard_True
	:type take2: bool
	:rtype: bool") AdjustCurve2d;
		Standard_Boolean AdjustCurve2d (const opencascade::handle<Geom2d_Curve> & C2D,const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Boolean take1 = Standard_True,const Standard_Boolean take2 = Standard_True);

		/****************** AdjustCurveSegment ******************/
		%feature("compactdefaultargs") AdjustCurveSegment;
		%feature("autodoc", "* Modifies a curve in order to make its bounds confused with given points. Works only on lines and B-Splines. //! For lines works as previous method, B-Splines are segmented at the given values and then are adjusted to the points.
	:param C3D:
	:type C3D: Geom_Curve
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: bool") AdjustCurveSegment;
		Standard_Boolean AdjustCurveSegment (const opencascade::handle<Geom_Curve> & C3D,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real U1,const Standard_Real U2);

		/****************** ConvertToBSpline ******************/
		%feature("compactdefaultargs") ConvertToBSpline;
		%feature("autodoc", "* Converts a curve of any type (only part from first to last) to bspline. The method of conversion depends on the type of original curve: BSpline -> C.Segment(first,last) Bezier and Line -> GeomConvert::CurveToBSplineCurve(C).Segment(first,last) Conic and Other -> Approx_Curve3d(C[first,last],prec,C1,9,1000)
	:param C:
	:type C: Geom_Curve
	:param first:
	:type first: float
	:param last:
	:type last: float
	:param prec:
	:type prec: float
	:rtype: opencascade::handle<Geom_BSplineCurve>") ConvertToBSpline;
		opencascade::handle<Geom_BSplineCurve> ConvertToBSpline (const opencascade::handle<Geom_Curve> & C,const Standard_Real first,const Standard_Real last,const Standard_Real prec);

		/****************** ConvertToBSpline ******************/
		%feature("compactdefaultargs") ConvertToBSpline;
		%feature("autodoc", "* Converts a curve of any type (only part from first to last) to bspline. The method of conversion depends on the type of original curve: BSpline -> C.Segment(first,last) Bezier and Line -> GeomConvert::CurveToBSplineCurve(C).Segment(first,last) Conic and Other -> Approx_Curve2d(C[first,last],prec,C1,9,1000)
	:param C:
	:type C: Geom2d_Curve
	:param first:
	:type first: float
	:param last:
	:type last: float
	:param prec:
	:type prec: float
	:rtype: opencascade::handle<Geom2d_BSplineCurve>") ConvertToBSpline;
		opencascade::handle<Geom2d_BSplineCurve> ConvertToBSpline (const opencascade::handle<Geom2d_Curve> & C,const Standard_Real first,const Standard_Real last,const Standard_Real prec);

		/****************** FixKnots ******************/
		%feature("compactdefaultargs") FixKnots;
		%feature("autodoc", ":param knots:
	:type knots: TColStd_HArray1OfReal
	:rtype: bool") FixKnots;
		static Standard_Boolean FixKnots (opencascade::handle<TColStd_HArray1OfReal> & knots);

		/****************** FixKnots ******************/
		%feature("compactdefaultargs") FixKnots;
		%feature("autodoc", "* Fix bspline knots to ensure that there is enough gap between neighbouring values Returns True if something fixed (by shifting knot)
	:param knots:
	:type knots: TColStd_Array1OfReal
	:rtype: bool") FixKnots;
		static Standard_Boolean FixKnots (TColStd_Array1OfReal & knots);

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
		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", ":rtype: void") Build;
		virtual void Build ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		virtual Standard_Boolean IsDone ();

		/****************** ShapeConstruct_MakeTriangulation ******************/
		%feature("compactdefaultargs") ShapeConstruct_MakeTriangulation;
		%feature("autodoc", ":param pnts:
	:type pnts: TColgp_Array1OfPnt
	:param prec: default value is 0.0
	:type prec: float
	:rtype: None") ShapeConstruct_MakeTriangulation;
		 ShapeConstruct_MakeTriangulation (const TColgp_Array1OfPnt & pnts,const Standard_Real prec = 0.0);

		/****************** ShapeConstruct_MakeTriangulation ******************/
		%feature("compactdefaultargs") ShapeConstruct_MakeTriangulation;
		%feature("autodoc", ":param wire:
	:type wire: TopoDS_Wire
	:param prec: default value is 0.0
	:type prec: float
	:rtype: None") ShapeConstruct_MakeTriangulation;
		 ShapeConstruct_MakeTriangulation (const TopoDS_Wire & wire,const Standard_Real prec = 0.0);

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the object with all necessary parameters, i.e. surface and precision
	:param surf:
	:type surf: Geom_Surface
	:param preci:
	:type preci: float
	:rtype: void") Init;
		virtual void Init (const opencascade::handle<Geom_Surface> & surf,const Standard_Real preci);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the object with all necessary parameters, i.e. surface and precision
	:param surf:
	:type surf: ShapeAnalysis_Surface
	:param preci:
	:type preci: float
	:rtype: void") Init;
		virtual void Init (const opencascade::handle<ShapeAnalysis_Surface> & surf,const Standard_Real preci);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes the projection of 3d curve onto a surface using the specialized algorithm. Returns False if projector fails, otherwise, if pcurve computed successfully, returns True. The output curve 2D is guaranteed to be same-parameter with input curve 3D on the interval [First, Last]. If the output curve lies on a direct line the infinite line is returned, in the case same-parameter condition is satisfied. TolFirst and TolLast are the tolerances at the ends of input curve 3D.
	:param c3d:
	:type c3d: Geom_Curve
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param c2d:
	:type c2d: Geom2d_Curve
	:param TolFirst: default value is -1
	:type TolFirst: float
	:param TolLast: default value is -1
	:type TolLast: float
	:rtype: bool") Perform;
		virtual Standard_Boolean Perform (opencascade::handle<Geom_Curve> & c3d,const Standard_Real First,const Standard_Real Last,opencascade::handle<Geom2d_Curve> & c2d,const Standard_Real TolFirst = -1,const Standard_Real TolLast = -1);

		/****************** PerformByProjLib ******************/
		%feature("compactdefaultargs") PerformByProjLib;
		%feature("autodoc", "* Computes the projection of 3d curve onto a surface using the standard algorithm from ProjLib. Returns False if standard projector fails or raises an exception or cuts the curve by parametrical bounds of the surface. Else, if pcurve computed successfully, returns True. The continuity, maxdeg and nbinterval are parameters of call to Approx_CurveOnSurface. If nbinterval is equal to -1 (default), this value is computed depending on source 3d curve and surface.
	:param c3d:
	:type c3d: Geom_Curve
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param c2d:
	:type c2d: Geom2d_Curve
	:param continuity: default value is GeomAbs_C1
	:type continuity: GeomAbs_Shape
	:param maxdeg: default value is 12
	:type maxdeg: int
	:param nbinterval: default value is -1
	:type nbinterval: int
	:rtype: bool") PerformByProjLib;
		Standard_Boolean PerformByProjLib (opencascade::handle<Geom_Curve> & c3d,const Standard_Real First,const Standard_Real Last,opencascade::handle<Geom2d_Curve> & c2d,const GeomAbs_Shape continuity = GeomAbs_C1,const Standard_Integer maxdeg = 12,const Standard_Integer nbinterval = -1);

		/****************** SetPrecision ******************/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "* Sets value for current precision
	:param preci:
	:type preci: float
	:rtype: None") SetPrecision;
		void SetPrecision (const Standard_Real preci);

		/****************** SetSurface ******************/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "* Loads a surface (in the form of Geom_Surface) to project on
	:param surf:
	:type surf: Geom_Surface
	:rtype: None") SetSurface;
		void SetSurface (const opencascade::handle<Geom_Surface> & surf);

		/****************** SetSurface ******************/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "* Loads a surface (in the form of ShapeAnalysis_Surface) to project on
	:param surf:
	:type surf: ShapeAnalysis_Surface
	:rtype: None") SetSurface;
		void SetSurface (const opencascade::handle<ShapeAnalysis_Surface> & surf);

		/****************** ShapeConstruct_ProjectCurveOnSurface ******************/
		%feature("compactdefaultargs") ShapeConstruct_ProjectCurveOnSurface;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") ShapeConstruct_ProjectCurveOnSurface;
		 ShapeConstruct_ProjectCurveOnSurface ();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns the status of last Peform
	:param theStatus:
	:type theStatus: ShapeExtend_Status
	:rtype: bool") Status;
		Standard_Boolean Status (const ShapeExtend_Status theStatus);

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
