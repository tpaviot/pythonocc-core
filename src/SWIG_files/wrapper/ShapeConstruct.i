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
%module (package="OCC") ShapeConstruct

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


%include ShapeConstruct_headers.i


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
/* end public enums declaration */

%rename(shapeconstruct) ShapeConstruct;
class ShapeConstruct {
	public:
		%feature("compactdefaultargs") ConvertCurveToBSpline;
		%feature("autodoc", "	* Tool for wire triangulation

	:param C3D:
	:type C3D: Handle_Geom_Curve &
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
	:rtype: Handle_Geom_BSplineCurve
") ConvertCurveToBSpline;
		static Handle_Geom_BSplineCurve ConvertCurveToBSpline (const Handle_Geom_Curve & C3D,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol3d,const GeomAbs_Shape Continuity,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);
		%feature("compactdefaultargs") ConvertCurveToBSpline;
		%feature("autodoc", "	:param C2D:
	:type C2D: Handle_Geom2d_Curve &
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
	:rtype: Handle_Geom2d_BSplineCurve
") ConvertCurveToBSpline;
		static Handle_Geom2d_BSplineCurve ConvertCurveToBSpline (const Handle_Geom2d_Curve & C2D,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol2d,const GeomAbs_Shape Continuity,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);
		%feature("compactdefaultargs") ConvertSurfaceToBSpline;
		%feature("autodoc", "	:param surf:
	:type surf: Handle_Geom_Surface &
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
	:rtype: Handle_Geom_BSplineSurface
") ConvertSurfaceToBSpline;
		static Handle_Geom_BSplineSurface ConvertSurfaceToBSpline (const Handle_Geom_Surface & surf,const Standard_Real UF,const Standard_Real UL,const Standard_Real VF,const Standard_Real VL,const Standard_Real Tol3d,const GeomAbs_Shape Continuity,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);
		%feature("compactdefaultargs") JoinPCurves;
		%feature("autodoc", "	* join pcurves of the <theEdge> on the <theFace> try to use pcurves from originas edges <theEdges> Returns false if cannot join pcurves

	:param theEdges:
	:type theEdges: Handle_TopTools_HSequenceOfShape &
	:param theFace:
	:type theFace: TopoDS_Face &
	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:rtype: bool
") JoinPCurves;
		static Standard_Boolean JoinPCurves (const Handle_TopTools_HSequenceOfShape & theEdges,const TopoDS_Face & theFace,TopoDS_Edge & theEdge);
		%feature("compactdefaultargs") JoinCurves;
		%feature("autodoc", "	* Method for joininig curves 3D. Parameters : c3d1,ac3d2 - initial curves Orient1, Orient2 - initial edges orientations. first1,last1,first2,last2 - parameters for trimming curves (re-calculate with account of orientation edges) c3dOut - result curve isRev1,isRev2 - out parameters indicative on possible errors. Return value : True - if curves were joined successfully, else - False.

	:param c3d1:
	:type c3d1: Handle_Geom_Curve &
	:param ac3d2:
	:type ac3d2: Handle_Geom_Curve &
	:param Orient1:
	:type Orient1: TopAbs_Orientation
	:param Orient2:
	:type Orient2: TopAbs_Orientation
	:param first1:
	:type first1: float &
	:param last1:
	:type last1: float &
	:param first2:
	:type first2: float &
	:param last2:
	:type last2: float &
	:param c3dOut:
	:type c3dOut: Handle_Geom_Curve &
	:param isRev1:
	:type isRev1: bool
	:param isRev2:
	:type isRev2: bool
	:rtype: bool
") JoinCurves;
		static Standard_Boolean JoinCurves (const Handle_Geom_Curve & c3d1,const Handle_Geom_Curve & ac3d2,const TopAbs_Orientation Orient1,const TopAbs_Orientation Orient2,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Handle_Geom_Curve & c3dOut,Standard_Boolean &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") JoinCurves;
		%feature("autodoc", "	* Method for joininig curves 3D. Parameters : c3d1,ac3d2 - initial curves Orient1, Orient2 - initial edges orientations. first1,last1,first2,last2 - parameters for trimming curves (re-calculate with account of orientation edges) c3dOut - result curve isRev1,isRev2 - out parameters indicative on possible errors. isError - input parameter indicative possible errors due to that one from edges have one vertex Return value : True - if curves were joined successfully, else - False.

	:param c2d1:
	:type c2d1: Handle_Geom2d_Curve &
	:param ac2d2:
	:type ac2d2: Handle_Geom2d_Curve &
	:param Orient1:
	:type Orient1: TopAbs_Orientation
	:param Orient2:
	:type Orient2: TopAbs_Orientation
	:param first1:
	:type first1: float &
	:param last1:
	:type last1: float &
	:param first2:
	:type first2: float &
	:param last2:
	:type last2: float &
	:param c2dOut:
	:type c2dOut: Handle_Geom2d_Curve &
	:param isRev1:
	:type isRev1: bool
	:param isRev2:
	:type isRev2: bool
	:param isError: default value is Standard_False
	:type isError: bool
	:rtype: bool
") JoinCurves;
		static Standard_Boolean JoinCurves (const Handle_Geom2d_Curve & c2d1,const Handle_Geom2d_Curve & ac2d2,const TopAbs_Orientation Orient1,const TopAbs_Orientation Orient2,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Handle_Geom2d_Curve & c2dOut,Standard_Boolean &OutValue,Standard_Boolean &OutValue,const Standard_Boolean isError = Standard_False);
};


%extend ShapeConstruct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeConstruct_CompBezierCurves2dToBSplineCurve2d;
class ShapeConstruct_CompBezierCurves2dToBSplineCurve2d {
	public:
		%feature("compactdefaultargs") ShapeConstruct_CompBezierCurves2dToBSplineCurve2d;
		%feature("autodoc", "	:param AngularTolerance: default value is 1.0e-4
	:type AngularTolerance: float
	:rtype: None
") ShapeConstruct_CompBezierCurves2dToBSplineCurve2d;
		 ShapeConstruct_CompBezierCurves2dToBSplineCurve2d (const Standard_Real AngularTolerance = 1.0e-4);
		%feature("compactdefaultargs") AddCurve;
		%feature("autodoc", "	:param Poles:
	:type Poles: TColgp_Array1OfPnt2d
	:rtype: None
") AddCurve;
		void AddCurve (const TColgp_Array1OfPnt2d & Poles);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the algorithm.

	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	:param Poles:
	:type Poles: TColgp_Array1OfPnt2d
	:rtype: None
") Poles;
		void Poles (TColgp_Array1OfPnt2d & Poles);
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") KnotsAndMults;
		%feature("autodoc", "	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:rtype: None
") KnotsAndMults;
		void KnotsAndMults (TColStd_Array1OfReal & Knots,TColStd_Array1OfInteger & Mults);
};


%extend ShapeConstruct_CompBezierCurves2dToBSplineCurve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeConstruct_CompBezierCurvesToBSplineCurve;
class ShapeConstruct_CompBezierCurvesToBSplineCurve {
	public:
		%feature("compactdefaultargs") ShapeConstruct_CompBezierCurvesToBSplineCurve;
		%feature("autodoc", "	:param AngularTolerance: default value is 1.0e-4
	:type AngularTolerance: float
	:rtype: None
") ShapeConstruct_CompBezierCurvesToBSplineCurve;
		 ShapeConstruct_CompBezierCurvesToBSplineCurve (const Standard_Real AngularTolerance = 1.0e-4);
		%feature("compactdefaultargs") AddCurve;
		%feature("autodoc", "	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:rtype: None
") AddCurve;
		void AddCurve (const TColgp_Array1OfPnt & Poles);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the algorithm.

	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:rtype: None
") Poles;
		void Poles (TColgp_Array1OfPnt & Poles);
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") KnotsAndMults;
		%feature("autodoc", "	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:rtype: None
") KnotsAndMults;
		void KnotsAndMults (TColStd_Array1OfReal & Knots,TColStd_Array1OfInteger & Mults);
};


%extend ShapeConstruct_CompBezierCurvesToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class ShapeConstruct_Curve {
	public:
		%feature("compactdefaultargs") AdjustCurve;
		%feature("autodoc", "	* Modifies a curve in order to make its bounds confused with given points. Works only on lines and B-Splines, returns True in this case, else returns False. For line considers both bounding points, for B-Splines only specified. //! Warning : Does not check if curve should be reversed

	:param C3D:
	:type C3D: Handle_Geom_Curve &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param take1: default value is Standard_True
	:type take1: bool
	:param take2: default value is Standard_True
	:type take2: bool
	:rtype: bool
") AdjustCurve;
		Standard_Boolean AdjustCurve (const Handle_Geom_Curve & C3D,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Boolean take1 = Standard_True,const Standard_Boolean take2 = Standard_True);
		%feature("compactdefaultargs") AdjustCurveSegment;
		%feature("autodoc", "	* Modifies a curve in order to make its bounds confused with given points. Works only on lines and B-Splines. //! For lines works as previous method, B-Splines are segmented at the given values and then are adjusted to the points.

	:param C3D:
	:type C3D: Handle_Geom_Curve &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: bool
") AdjustCurveSegment;
		Standard_Boolean AdjustCurveSegment (const Handle_Geom_Curve & C3D,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real U1,const Standard_Real U2);
		%feature("compactdefaultargs") AdjustCurve2d;
		%feature("autodoc", "	* Modifies a curve in order to make its bounds confused with given points. Works only on lines and B-Splines, returns True in this case, else returns False. //! For line considers both bounding points, for B-Splines only specified. //! Warning : Does not check if curve should be reversed

	:param C2D:
	:type C2D: Handle_Geom2d_Curve &
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:param take1: default value is Standard_True
	:type take1: bool
	:param take2: default value is Standard_True
	:type take2: bool
	:rtype: bool
") AdjustCurve2d;
		Standard_Boolean AdjustCurve2d (const Handle_Geom2d_Curve & C2D,const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Boolean take1 = Standard_True,const Standard_Boolean take2 = Standard_True);
		%feature("compactdefaultargs") ConvertToBSpline;
		%feature("autodoc", "	* Converts a curve of any type (only part from first to last) to bspline. The method of conversion depends on the type of original curve: BSpline -> C.Segment(first,last) Bezier and Line -> GeomConvert::CurveToBSplineCurve(C).Segment(first,last) Conic and Other -> Approx_Curve3d(C[first,last],prec,C1,9,1000)

	:param C:
	:type C: Handle_Geom_Curve &
	:param first:
	:type first: float
	:param last:
	:type last: float
	:param prec:
	:type prec: float
	:rtype: Handle_Geom_BSplineCurve
") ConvertToBSpline;
		Handle_Geom_BSplineCurve ConvertToBSpline (const Handle_Geom_Curve & C,const Standard_Real first,const Standard_Real last,const Standard_Real prec);
		%feature("compactdefaultargs") ConvertToBSpline;
		%feature("autodoc", "	* Converts a curve of any type (only part from first to last) to bspline. The method of conversion depends on the type of original curve: BSpline -> C.Segment(first,last) Bezier and Line -> GeomConvert::CurveToBSplineCurve(C).Segment(first,last) Conic and Other -> Approx_Curve2d(C[first,last],prec,C1,9,1000)

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param first:
	:type first: float
	:param last:
	:type last: float
	:param prec:
	:type prec: float
	:rtype: Handle_Geom2d_BSplineCurve
") ConvertToBSpline;
		Handle_Geom2d_BSplineCurve ConvertToBSpline (const Handle_Geom2d_Curve & C,const Standard_Real first,const Standard_Real last,const Standard_Real prec);
		%feature("compactdefaultargs") FixKnots;
		%feature("autodoc", "	:param knots:
	:type knots: Handle_TColStd_HArray1OfReal &
	:rtype: bool
") FixKnots;
		static Standard_Boolean FixKnots (Handle_TColStd_HArray1OfReal & knots);
		%feature("compactdefaultargs") FixKnots;
		%feature("autodoc", "	* Fix bspline knots to ensure that there is enough gap between neighbouring values Returns True if something fixed (by shifting knot)

	:param knots:
	:type knots: TColStd_Array1OfReal &
	:rtype: bool
") FixKnots;
		static Standard_Boolean FixKnots (TColStd_Array1OfReal & knots);
};


%extend ShapeConstruct_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeConstruct_MakeTriangulation;
class ShapeConstruct_MakeTriangulation : public BRepBuilderAPI_MakeShape {
	public:
		%feature("compactdefaultargs") ShapeConstruct_MakeTriangulation;
		%feature("autodoc", "	:param pnts:
	:type pnts: TColgp_Array1OfPnt
	:param prec: default value is 0.0
	:type prec: float
	:rtype: None
") ShapeConstruct_MakeTriangulation;
		 ShapeConstruct_MakeTriangulation (const TColgp_Array1OfPnt & pnts,const Standard_Real prec = 0.0);
		%feature("compactdefaultargs") ShapeConstruct_MakeTriangulation;
		%feature("autodoc", "	:param wire:
	:type wire: TopoDS_Wire &
	:param prec: default value is 0.0
	:type prec: float
	:rtype: None
") ShapeConstruct_MakeTriangulation;
		 ShapeConstruct_MakeTriangulation (const TopoDS_Wire & wire,const Standard_Real prec = 0.0);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	:rtype: void
") Build;
		virtual void Build ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
};


%extend ShapeConstruct_MakeTriangulation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeConstruct_ProjectCurveOnSurface;
class ShapeConstruct_ProjectCurveOnSurface : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ShapeConstruct_ProjectCurveOnSurface;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ShapeConstruct_ProjectCurveOnSurface;
		 ShapeConstruct_ProjectCurveOnSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the object with all necessary parameters, i.e. surface and precision

	:param surf:
	:type surf: Handle_Geom_Surface &
	:param preci:
	:type preci: float
	:rtype: void
") Init;
		virtual void Init (const Handle_Geom_Surface & surf,const Standard_Real preci);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the object with all necessary parameters, i.e. surface and precision

	:param surf:
	:type surf: Handle_ShapeAnalysis_Surface &
	:param preci:
	:type preci: float
	:rtype: void
") Init;
		virtual void Init (const Handle_ShapeAnalysis_Surface & surf,const Standard_Real preci);
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "	* Loads a surface (in the form of Geom_Surface) to project on

	:param surf:
	:type surf: Handle_Geom_Surface &
	:rtype: None
") SetSurface;
		void SetSurface (const Handle_Geom_Surface & surf);
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "	* Loads a surface (in the form of ShapeAnalysis_Surface) to project on

	:param surf:
	:type surf: Handle_ShapeAnalysis_Surface &
	:rtype: None
") SetSurface;
		void SetSurface (const Handle_ShapeAnalysis_Surface & surf);
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "	* Sets value for current precision

	:param preci:
	:type preci: float
	:rtype: None
") SetPrecision;
		void SetPrecision (const Standard_Real preci);

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetBuildCurveMode() {
                return (Standard_Boolean) $self->BuildCurveMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetBuildCurveMode(Standard_Boolean value ) {
                $self->BuildCurveMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetAdjustOverDegenMode() {
                return (Standard_Integer) $self->AdjustOverDegenMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetAdjustOverDegenMode(Standard_Integer value ) {
                $self->AdjustOverDegenMode()=value;
                }
            };
            		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns the status of last Peform

	:param Status:
	:type Status: ShapeExtend_Status
	:rtype: bool
") Status;
		Standard_Boolean Status (const ShapeExtend_Status Status);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the projection of 3d curve onto a surface using the specialized algorithm. Returns False if projector fails, otherwise, if pcurve computed successfully, returns True. The continuity, maxdeg and nbinterval are parameters of call to Approx_CurveOnSurface. If nbinterval is equal to -1 (default), this value is computed depending on source 3d curve and surface. The output curve 2D is guaranteed to be same-parameter with input curve 3D on the interval [First, Last]. If the output curve lies on a direct line the infinite line is returned, in the case same-parameter condition is satisfied.

	:param c3d:
	:type c3d: Handle_Geom_Curve &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param c2d:
	:type c2d: Handle_Geom2d_Curve &
	:param continuity: default value is GeomAbs_C1
	:type continuity: GeomAbs_Shape
	:param maxdeg: default value is 12
	:type maxdeg: int
	:param nbinterval: default value is -1
	:type nbinterval: int
	:rtype: bool
") Perform;
		virtual Standard_Boolean Perform (Handle_Geom_Curve & c3d,const Standard_Real First,const Standard_Real Last,Handle_Geom2d_Curve & c2d,const GeomAbs_Shape continuity = GeomAbs_C1,const Standard_Integer maxdeg = 12,const Standard_Integer nbinterval = -1);
		%feature("compactdefaultargs") PerformByProjLib;
		%feature("autodoc", "	* Computes the projection of 3d curve onto a surface using the standard algorithm from ProjLib. Returns False if standard projector fails or raises an exception or cuts the curve by parametrical bounds of the surface. Else, if pcurve computed successfully, returns True. The continuity, maxdeg and nbinterval are parameters of call to Approx_CurveOnSurface. If nbinterval is equal to -1 (default), this value is computed depending on source 3d curve and surface.

	:param c3d:
	:type c3d: Handle_Geom_Curve &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param c2d:
	:type c2d: Handle_Geom2d_Curve &
	:param continuity: default value is GeomAbs_C1
	:type continuity: GeomAbs_Shape
	:param maxdeg: default value is 12
	:type maxdeg: int
	:param nbinterval: default value is -1
	:type nbinterval: int
	:rtype: bool
") PerformByProjLib;
		Standard_Boolean PerformByProjLib (Handle_Geom_Curve & c3d,const Standard_Real First,const Standard_Real Last,Handle_Geom2d_Curve & c2d,const GeomAbs_Shape continuity = GeomAbs_C1,const Standard_Integer maxdeg = 12,const Standard_Integer nbinterval = -1);
		%feature("compactdefaultargs") PerformAdvanced;
		%feature("autodoc", "	* Computes the projection of 3d curve onto a surface using either standard projector (method PerformByProjLib()) or internal one (method Perform()). The selection is done by analyzing the surface and 3d curve and is aimed to filter the cases potentially dangerous for the standard projector. If the standard projector fails, internal one is used.

	:param c3d:
	:type c3d: Handle_Geom_Curve &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param c2d:
	:type c2d: Handle_Geom2d_Curve &
	:rtype: bool
") PerformAdvanced;
		Standard_Boolean PerformAdvanced (Handle_Geom_Curve & c3d,const Standard_Real First,const Standard_Real Last,Handle_Geom2d_Curve & c2d);
};


%extend ShapeConstruct_ProjectCurveOnSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeConstruct_ProjectCurveOnSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeConstruct_ProjectCurveOnSurface::Handle_ShapeConstruct_ProjectCurveOnSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeConstruct_ProjectCurveOnSurface;
class Handle_ShapeConstruct_ProjectCurveOnSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeConstruct_ProjectCurveOnSurface();
        Handle_ShapeConstruct_ProjectCurveOnSurface(const Handle_ShapeConstruct_ProjectCurveOnSurface &aHandle);
        Handle_ShapeConstruct_ProjectCurveOnSurface(const ShapeConstruct_ProjectCurveOnSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeConstruct_ProjectCurveOnSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeConstruct_ProjectCurveOnSurface {
    ShapeConstruct_ProjectCurveOnSurface* _get_reference() {
    return (ShapeConstruct_ProjectCurveOnSurface*)$self->Access();
    }
};

%extend Handle_ShapeConstruct_ProjectCurveOnSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeConstruct_ProjectCurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
