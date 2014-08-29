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
%module ShapeConstruct

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

%include ShapeConstruct_required_python_modules.i
%include ShapeConstruct_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(shapeconstruct) ShapeConstruct;
%nodefaultctor ShapeConstruct;
class ShapeConstruct {
	public:
		%feature("autodoc", "Args:
	C3D(Handle_Geom_Curve)
	First(Standard_Real)
	Last(Standard_Real)
	Tol3d(Standard_Real)
	Continuity(GeomAbs_Shape)
	MaxSegments(Standard_Integer)
	MaxDegree(Standard_Integer)

Returns:
	static Handle_Geom_BSplineCurve

Tool for wire triangulation") ConvertCurveToBSpline;
		static Handle_Geom_BSplineCurve ConvertCurveToBSpline (const Handle_Geom_Curve & C3D,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol3d,const GeomAbs_Shape Continuity,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);
		%feature("autodoc", "Args:
	C2D(Handle_Geom2d_Curve)
	First(Standard_Real)
	Last(Standard_Real)
	Tol2d(Standard_Real)
	Continuity(GeomAbs_Shape)
	MaxSegments(Standard_Integer)
	MaxDegree(Standard_Integer)

Returns:
	static Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") ConvertCurveToBSpline;
		static Handle_Geom2d_BSplineCurve ConvertCurveToBSpline (const Handle_Geom2d_Curve & C2D,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol2d,const GeomAbs_Shape Continuity,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);
		%feature("autodoc", "Args:
	surf(Handle_Geom_Surface)
	UF(Standard_Real)
	UL(Standard_Real)
	VF(Standard_Real)
	VL(Standard_Real)
	Tol3d(Standard_Real)
	Continuity(GeomAbs_Shape)
	MaxSegments(Standard_Integer)
	MaxDegree(Standard_Integer)

Returns:
	static Handle_Geom_BSplineSurface

No detailed docstring for this function.") ConvertSurfaceToBSpline;
		static Handle_Geom_BSplineSurface ConvertSurfaceToBSpline (const Handle_Geom_Surface & surf,const Standard_Real UF,const Standard_Real UL,const Standard_Real VF,const Standard_Real VL,const Standard_Real Tol3d,const GeomAbs_Shape Continuity,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);
		%feature("autodoc", "Args:
	theEdges(Handle_TopTools_HSequenceOfShape)
	theFace(TopoDS_Face)
	theEdge(TopoDS_Edge)

Returns:
	static Standard_Boolean

join pcurves of the <theEdge> on the <theFace>  
   	    try to use pcurves from originas edges <theEdges>  
         Returns false if cannot join pcurves") JoinPCurves;
		static Standard_Boolean JoinPCurves (const Handle_TopTools_HSequenceOfShape & theEdges,const TopoDS_Face & theFace,TopoDS_Edge & theEdge);
		%feature("autodoc", "Args:
	c3d1(Handle_Geom_Curve)
	ac3d2(Handle_Geom_Curve)
	Orient1(TopAbs_Orientation)
	Orient2(TopAbs_Orientation)
	first1(Standard_Real)
	last1(Standard_Real)
	first2(Standard_Real)
	last2(Standard_Real)
	c3dOut(Handle_Geom_Curve)
	isRev1(Standard_Boolean)
	isRev2(Standard_Boolean)

Returns:
	static Standard_Boolean

//!Method for joininig curves 3D.  
         Parameters : c3d1,ac3d2 - initial curves  
//!	                     Orient1, Orient2 - initial edges orientations.  
                      first1,last1,first2,last2 - parameters for trimming curves  
//!	    	             (re-calculate with account of orientation edges)  
                      c3dOut - result curve  
                      isRev1,isRev2 - out parameters indicative on possible errors.  
         Return value : True - if curves were joined successfully,  
                              else - False.") JoinCurves;
		static Standard_Boolean JoinCurves (const Handle_Geom_Curve & c3d1,const Handle_Geom_Curve & ac3d2,const TopAbs_Orientation Orient1,const TopAbs_Orientation Orient2,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Handle_Geom_Curve & c3dOut,Standard_Boolean & isRev1,Standard_Boolean & isRev2);
		%feature("autodoc", "Args:
	c2d1(Handle_Geom2d_Curve)
	ac2d2(Handle_Geom2d_Curve)
	Orient1(TopAbs_Orientation)
	Orient2(TopAbs_Orientation)
	first1(Standard_Real)
	last1(Standard_Real)
	first2(Standard_Real)
	last2(Standard_Real)
	c2dOut(Handle_Geom2d_Curve)
	isRev1(Standard_Boolean)
	isRev2(Standard_Boolean)
	isError(Standard_Boolean)=Standard_False

Returns:
	static Standard_Boolean

//!Method for joininig curves 3D.  
         Parameters : c3d1,ac3d2 - initial curves  
//!	                     Orient1, Orient2 - initial edges orientations.  
                      first1,last1,first2,last2 - parameters for trimming curves  
//!	    	             (re-calculate with account of orientation edges)  
                      c3dOut - result curve  
                      isRev1,isRev2 - out parameters indicative on possible errors.  
                      isError - input parameter indicative possible errors due to that one from edges have one vertex  
        Return value : True - if curves were joined successfully,  
                              else - False.") JoinCurves;
		static Standard_Boolean JoinCurves (const Handle_Geom2d_Curve & c2d1,const Handle_Geom2d_Curve & ac2d2,const TopAbs_Orientation Orient1,const TopAbs_Orientation Orient2,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Handle_Geom2d_Curve & c2dOut,Standard_Boolean & isRev1,Standard_Boolean & isRev2,const Standard_Boolean isError = Standard_False);
};


%feature("shadow") ShapeConstruct::~ShapeConstruct %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeConstruct {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeConstruct_CompBezierCurves2dToBSplineCurve2d;
class ShapeConstruct_CompBezierCurves2dToBSplineCurve2d {
	public:
		%feature("autodoc", "Args:
	AngularTolerance(Standard_Real)=1.0e-4

Returns:
	None

No detailed docstring for this function.") ShapeConstruct_CompBezierCurves2dToBSplineCurve2d;
		 ShapeConstruct_CompBezierCurves2dToBSplineCurve2d (const Standard_Real AngularTolerance = 1.0e-4);
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt2d)

Returns:
	None

No detailed docstring for this function.") AddCurve;
		void AddCurve (const TColgp_Array1OfPnt2d & Poles);
		%feature("autodoc", "Args:
	None
Returns:
	None

Computes the algorithm.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt2d)

Returns:
	None

No detailed docstring for this function.") Poles;
		void Poles (TColgp_Array1OfPnt2d & Poles);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)

Returns:
	None

No detailed docstring for this function.") KnotsAndMults;
		void KnotsAndMults (TColStd_Array1OfReal & Knots,TColStd_Array1OfInteger & Mults);
};


%feature("shadow") ShapeConstruct_CompBezierCurves2dToBSplineCurve2d::~ShapeConstruct_CompBezierCurves2dToBSplineCurve2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeConstruct_CompBezierCurves2dToBSplineCurve2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeConstruct_CompBezierCurvesToBSplineCurve;
class ShapeConstruct_CompBezierCurvesToBSplineCurve {
	public:
		%feature("autodoc", "Args:
	AngularTolerance(Standard_Real)=1.0e-4

Returns:
	None

No detailed docstring for this function.") ShapeConstruct_CompBezierCurvesToBSplineCurve;
		 ShapeConstruct_CompBezierCurvesToBSplineCurve (const Standard_Real AngularTolerance = 1.0e-4);
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt)

Returns:
	None

No detailed docstring for this function.") AddCurve;
		void AddCurve (const TColgp_Array1OfPnt & Poles);
		%feature("autodoc", "Args:
	None
Returns:
	None

Computes the algorithm.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt)

Returns:
	None

No detailed docstring for this function.") Poles;
		void Poles (TColgp_Array1OfPnt & Poles);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)

Returns:
	None

No detailed docstring for this function.") KnotsAndMults;
		void KnotsAndMults (TColStd_Array1OfReal & Knots,TColStd_Array1OfInteger & Mults);
};


%feature("shadow") ShapeConstruct_CompBezierCurvesToBSplineCurve::~ShapeConstruct_CompBezierCurvesToBSplineCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeConstruct_CompBezierCurvesToBSplineCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeConstruct_Curve;
class ShapeConstruct_Curve {
	public:
		%feature("autodoc", "Args:
	C3D(Handle_Geom_Curve)
	P1(gp_Pnt)
	P2(gp_Pnt)
	take1(Standard_Boolean)=Standard_True
	take2(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

Modifies a curve in order to make its bounds confused with  
          given points.  
          Works only on lines and B-Splines, returns True in this case,  
          else returns False.  
          For line considers both bounding points, for B-Splines only  
          specified.  
 
 Warning : Does not check if curve should be reversed") AdjustCurve;
		Standard_Boolean AdjustCurve (const Handle_Geom_Curve & C3D,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Boolean take1 = Standard_True,const Standard_Boolean take2 = Standard_True);
		%feature("autodoc", "Args:
	C3D(Handle_Geom_Curve)
	P1(gp_Pnt)
	P2(gp_Pnt)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	Standard_Boolean

Modifies a curve in order to make its bounds confused with  
          given points.  
          Works only on lines and B-Splines.  
 
          For lines works as previous method, B-Splines are segmented  
          at the given values and then are adjusted to the points.") AdjustCurveSegment;
		Standard_Boolean AdjustCurveSegment (const Handle_Geom_Curve & C3D,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	C2D(Handle_Geom2d_Curve)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)
	take1(Standard_Boolean)=Standard_True
	take2(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

Modifies a curve in order to make its bounds confused with  
          given points.  
          Works only on lines and B-Splines, returns True in this case,  
          else returns False.  
 
          For line considers both bounding points, for B-Splines only  
          specified.  
 
 Warning : Does not check if curve should be reversed") AdjustCurve2d;
		Standard_Boolean AdjustCurve2d (const Handle_Geom2d_Curve & C2D,const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Boolean take1 = Standard_True,const Standard_Boolean take2 = Standard_True);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	first(Standard_Real)
	last(Standard_Real)
	prec(Standard_Real)

Returns:
	Handle_Geom_BSplineCurve

Converts a curve of any type (only part from first to last)  
         to bspline. The method of conversion depends on the type  
         of original curve:  
         BSpline -> C.Segment(first,last)  
         Bezier and Line -> GeomConvert::CurveToBSplineCurve(C).Segment(first,last)  
         Conic and Other -> Approx_Curve3d(C[first,last],prec,C1,9,1000)") ConvertToBSpline;
		Handle_Geom_BSplineCurve ConvertToBSpline (const Handle_Geom_Curve & C,const Standard_Real first,const Standard_Real last,const Standard_Real prec);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	first(Standard_Real)
	last(Standard_Real)
	prec(Standard_Real)

Returns:
	Handle_Geom2d_BSplineCurve

Converts a curve of any type (only part from first to last)  
         to bspline. The method of conversion depends on the type  
         of original curve:  
         BSpline -> C.Segment(first,last)  
         Bezier and Line -> GeomConvert::CurveToBSplineCurve(C).Segment(first,last)  
         Conic and Other -> Approx_Curve2d(C[first,last],prec,C1,9,1000)") ConvertToBSpline;
		Handle_Geom2d_BSplineCurve ConvertToBSpline (const Handle_Geom2d_Curve & C,const Standard_Real first,const Standard_Real last,const Standard_Real prec);
		%feature("autodoc", "Args:
	knots(Handle_TColStd_HArray1OfReal)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") FixKnots;
		static Standard_Boolean FixKnots (Handle_TColStd_HArray1OfReal & knots);
		%feature("autodoc", "Args:
	knots(TColStd_Array1OfReal)

Returns:
	static Standard_Boolean

Fix bspline knots to ensure that there is enough  
         gap between neighbouring values  
         Returns True if something fixed (by shifting knot)") FixKnots;
		static Standard_Boolean FixKnots (TColStd_Array1OfReal & knots);
};


%feature("shadow") ShapeConstruct_Curve::~ShapeConstruct_Curve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeConstruct_Curve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeConstruct_MakeTriangulation;
class ShapeConstruct_MakeTriangulation : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	pnts(TColgp_Array1OfPnt)
	prec(Standard_Real)=0.0

Returns:
	None

No detailed docstring for this function.") ShapeConstruct_MakeTriangulation;
		 ShapeConstruct_MakeTriangulation (const TColgp_Array1OfPnt & pnts,const Standard_Real prec = 0.0);
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)
	prec(Standard_Real)=0.0

Returns:
	None

No detailed docstring for this function.") ShapeConstruct_MakeTriangulation;
		 ShapeConstruct_MakeTriangulation (const TopoDS_Wire & wire,const Standard_Real prec = 0.0);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsDone;
		virtual Standard_Boolean IsDone ();
};


%feature("shadow") ShapeConstruct_MakeTriangulation::~ShapeConstruct_MakeTriangulation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeConstruct_MakeTriangulation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeConstruct_ProjectCurveOnSurface;
class ShapeConstruct_ProjectCurveOnSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ShapeConstruct_ProjectCurveOnSurface;
		 ShapeConstruct_ProjectCurveOnSurface ();
		%feature("autodoc", "Args:
	surf(Handle_Geom_Surface)
	preci(Standard_Real)

Returns:
	virtual void

Initializes the object with all necessary parameters,  
         i.e. surface and precision") Init;
		virtual void Init (const Handle_Geom_Surface & surf,const Standard_Real preci);
		%feature("autodoc", "Args:
	surf(Handle_ShapeAnalysis_Surface)
	preci(Standard_Real)

Returns:
	virtual void

Initializes the object with all necessary parameters,  
         i.e. surface and precision") Init;
		virtual void Init (const Handle_ShapeAnalysis_Surface & surf,const Standard_Real preci);
		%feature("autodoc", "Args:
	surf(Handle_Geom_Surface)

Returns:
	None

Loads a surface (in the form of Geom_Surface) to project on") SetSurface;
		void SetSurface (const Handle_Geom_Surface & surf);
		%feature("autodoc", "Args:
	surf(Handle_ShapeAnalysis_Surface)

Returns:
	None

Loads a surface (in the form of ShapeAnalysis_Surface) to project on") SetSurface;
		void SetSurface (const Handle_ShapeAnalysis_Surface & surf);
		%feature("autodoc", "Args:
	preci(Standard_Real)

Returns:
	None

Sets value for current precision") SetPrecision;
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
            		%feature("autodoc", "Args:
	Status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Returns the status of last Peform") Status;
		Standard_Boolean Status (const ShapeExtend_Status Status);
		%feature("autodoc", "Args:
	c3d(Handle_Geom_Curve)
	First(Standard_Real)
	Last(Standard_Real)
	c2d(Handle_Geom2d_Curve)
	continuity(GeomAbs_Shape)=GeomAbs_C1
	maxdeg(Standard_Integer)=12
	nbinterval(Standard_Integer)=- 1

Returns:
	virtual Standard_Boolean

Computes the projection of 3d curve onto a surface using the  
         standard algorithm from ProjLib. Returns False if standard  
         projector fails or raises an exception or cuts the curve by  
         parametrical bounds of the surface. Else, if pcurve computed  
         successfully, returns True.  
         The continuity, maxdeg and nbinterval are parameters of call  
         to Approx_CurveOnSurface. If nbinterval is equal to -1  
         (default), this value is computed depending on source 3d curve  
         and surface.") Perform;
		virtual Standard_Boolean Perform (Handle_Geom_Curve & c3d,const Standard_Real First,const Standard_Real Last,Handle_Geom2d_Curve & c2d,const GeomAbs_Shape continuity = GeomAbs_C1,const Standard_Integer maxdeg = 12,const Standard_Integer nbinterval = - 1);
		%feature("autodoc", "Args:
	c3d(Handle_Geom_Curve)
	First(Standard_Real)
	Last(Standard_Real)
	c2d(Handle_Geom2d_Curve)
	continuity(GeomAbs_Shape)=GeomAbs_C1
	maxdeg(Standard_Integer)=12
	nbinterval(Standard_Integer)=- 1

Returns:
	Standard_Boolean

Computes the projection of 3d curve onto a surface using the  
         standard algorithm from ProjLib. Returns False if standard  
         projector fails or raises an exception or cuts the curve by  
         parametrical bounds of the surface. Else, if pcurve computed  
         successfully, returns True.  
         The continuity, maxdeg and nbinterval are parameters of call  
         to Approx_CurveOnSurface. If nbinterval is equal to -1  
         (default), this value is computed depending on source 3d curve  
         and surface.") PerformByProjLib;
		Standard_Boolean PerformByProjLib (Handle_Geom_Curve & c3d,const Standard_Real First,const Standard_Real Last,Handle_Geom2d_Curve & c2d,const GeomAbs_Shape continuity = GeomAbs_C1,const Standard_Integer maxdeg = 12,const Standard_Integer nbinterval = - 1);
		%feature("autodoc", "Args:
	c3d(Handle_Geom_Curve)
	First(Standard_Real)
	Last(Standard_Real)
	c2d(Handle_Geom2d_Curve)

Returns:
	Standard_Boolean

Computes the projection of 3d curve onto a surface using  
         either standard projector (method PerformByStandard()) or  
         internal one (method Perform()). The selection is done by  
         analyzing the surface and 3d curve and is aimed to filter  
         the cases potentially dangerous for the standard projector.  
         If the standard projector fails, internal one is used.") PerformAdvanced;
		Standard_Boolean PerformAdvanced (Handle_Geom_Curve & c3d,const Standard_Real First,const Standard_Real Last,Handle_Geom2d_Curve & c2d);
};


%feature("shadow") ShapeConstruct_ProjectCurveOnSurface::~ShapeConstruct_ProjectCurveOnSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeConstruct_ProjectCurveOnSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeConstruct_ProjectCurveOnSurface {
	Handle_ShapeConstruct_ProjectCurveOnSurface GetHandle() {
	return *(Handle_ShapeConstruct_ProjectCurveOnSurface*) &$self;
	}
};

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
    ShapeConstruct_ProjectCurveOnSurface* GetObject() {
    return (ShapeConstruct_ProjectCurveOnSurface*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeConstruct_ProjectCurveOnSurface::~Handle_ShapeConstruct_ProjectCurveOnSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeConstruct_ProjectCurveOnSurface {
    void _kill_pointed() {
        delete $self;
    }
};

