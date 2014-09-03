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
%module (package="OCC") ShapeCustom

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

%include ShapeCustom_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(shapecustom) ShapeCustom;
%nodefaultctor ShapeCustom;
class ShapeCustom {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	M(Handle_BRepTools_Modification)
	context(TopTools_DataMapOfShapeShape)
	MD(BRepTools_Modifier)

Returns:
	static TopoDS_Shape

Applies modifier to shape and checks sharing in the case assemblies.") ApplyModifier;
		static TopoDS_Shape ApplyModifier (const TopoDS_Shape & S,const Handle_BRepTools_Modification & M,TopTools_DataMapOfShapeShape & context,BRepTools_Modifier & MD);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static TopoDS_Shape

Returns a new shape without indirect surfaces.") DirectFaces;
		static TopoDS_Shape DirectFaces (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	scale(Standard_Real)

Returns:
	static TopoDS_Shape

Returns a new shape which is scaled original") ScaleShape;
		static TopoDS_Shape ScaleShape (const TopoDS_Shape & S,const Standard_Real scale);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)
	MaxDegree(Standard_Integer)
	MaxNbSegment(Standard_Integer)
	Continuity3d(GeomAbs_Shape)
	Continuity2d(GeomAbs_Shape)
	Degree(Standard_Boolean)
	Rational(Standard_Boolean)
	aParameters(Handle_ShapeCustom_RestrictionParameters)

Returns:
	static TopoDS_Shape

Returns a new shape with all surfaces, curves and pcurves  
         which type is BSpline/Bezier or based on them converted  
         having Degree less than <MaxDegree> or number of spans less  
         than <NbMaxSegment> in dependence on parameter priority <Degree>.  
         <GmaxDegree> and <GMaxSegments> are maximum possible degree  
         and number of spans correspondingly.  
         These values will be used in those cases when approximation with  
         specified parameters is impossible and one of GmaxDegree or  
         GMaxSegments is selected in dependence on priority.  
         Note that even if approximation is impossible with <GMaxDegree>  
         then number of spans can exceed specified <GMaxSegment>  
         <Rational> specifies if to convert Rational BSpline/Bezier into  
         polynomial B-Spline.  
         If flags ConvOffSurf,ConvOffCurve3d,ConvOffCurve2d are Standard_True there are means  
         that Offset surfaces , Offset curves 3d and Offset curves 2d are converted to BSPline  
         correspondingly.") BSplineRestriction;
		static TopoDS_Shape BSplineRestriction (const TopoDS_Shape & S,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer MaxDegree,const Standard_Integer MaxNbSegment,const GeomAbs_Shape Continuity3d,const GeomAbs_Shape Continuity2d,const Standard_Boolean Degree,const Standard_Boolean Rational,const Handle_ShapeCustom_RestrictionParameters & aParameters);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static TopoDS_Shape

Returns a new shape with all elementary periodic surfaces converted  
         to Geom_SurfaceOfRevolution") ConvertToRevolution;
		static TopoDS_Shape ConvertToRevolution (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static TopoDS_Shape

Returns a new shape with all surfaces of revolution and linear extrusion  
         convert to elementary periodic surfaces") SweptToElementary;
		static TopoDS_Shape SweptToElementary (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	extrMode(Standard_Boolean)
	revolMode(Standard_Boolean)
	offsetMode(Standard_Boolean)
	planeMode(Standard_Boolean)=Standard_False

Returns:
	static TopoDS_Shape

Returns a new shape with all surfaces of linear extrusion, revolution,  
         offset, and planar surfaces converted according to flags to  
         Geom_BSplineSurface (with same parameterisation).") ConvertToBSpline;
		static TopoDS_Shape ConvertToBSpline (const TopoDS_Shape & S,const Standard_Boolean extrMode,const Standard_Boolean revolMode,const Standard_Boolean offsetMode,const Standard_Boolean planeMode = Standard_False);
};


%feature("shadow") ShapeCustom::~ShapeCustom %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeCustom {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeCustom_ConvertToBSpline;
class ShapeCustom_ConvertToBSpline : public BRepTools_Modification {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeCustom_ConvertToBSpline;
		 ShapeCustom_ConvertToBSpline ();
		%feature("autodoc", "Args:
	extrMode(Standard_Boolean)

Returns:
	None

Sets mode for convertion of Surfaces of Linear  
         extrusion.") SetExtrusionMode;
		void SetExtrusionMode (const Standard_Boolean extrMode);
		%feature("autodoc", "Args:
	revolMode(Standard_Boolean)

Returns:
	None

Sets mode for convertion of Surfaces of Revolution.") SetRevolutionMode;
		void SetRevolutionMode (const Standard_Boolean revolMode);
		%feature("autodoc", "Args:
	offsetMode(Standard_Boolean)

Returns:
	None

Sets mode for convertion of Offset surfaces.") SetOffsetMode;
		void SetOffsetMode (const Standard_Boolean offsetMode);
		%feature("autodoc", "Args:
	planeMode(Standard_Boolean)

Returns:
	None

Sets mode for convertion of Plane surfaces.") SetPlaneMode;
		void SetPlaneMode (const Standard_Boolean planeMode);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	Tol(Standard_Real)
	RevWires(Standard_Boolean)
	RevFace(Standard_Boolean)

Returns:
	Standard_Boolean

Returns Standard_True if the face <F> has  been  
         modified. In this case, <S> is the new geometric  
         support of the face, <L> the new location,  <Tol>  
         the new tolerance.  Otherwise, returns  
         Standard_False, and <S>, <L>, <Tol> are  not  
         significant.") NewSurface;
		Standard_Boolean NewSurface (const TopoDS_Face & F,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean & RevWires,Standard_Boolean & RevFace);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Geom_Curve)
	L(TopLoc_Location)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns Standard_True  if  the edge  <E> has  been  
         modified.  In this case,  <C> is the new geometric  
         support of the  edge, <L> the  new location, <Tol>  
         the         new    tolerance.   Otherwise, returns  
         Standard_False,    and  <C>,  <L>,   <Tol> are not  
         significant.") NewCurve;
		Standard_Boolean NewCurve (const TopoDS_Edge & E,Handle_Geom_Curve & C,TopLoc_Location & L,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	P(gp_Pnt)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns  Standard_True if the  vertex <V> has been  
         modified.  In this  case, <P> is the new geometric  
         support of the vertex,   <Tol> the new  tolerance.  
         Otherwise, returns Standard_False, and <P>,  <Tol>  
         are not significant.") NewPoint;
		Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	NewE(TopoDS_Edge)
	NewF(TopoDS_Face)
	C(Handle_Geom2d_Curve)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns Standard_True if  the edge  <E> has a  new  
         curve on surface on the face <F>.In this case, <C>  
         is the new geometric support of  the edge, <L> the  
         new location, <Tol> the new tolerance.  
 
         Otherwise, returns  Standard_False, and <C>,  <L>,  
         <Tol> are not significant.  
 
         <NewE> is the new  edge created from  <E>.  <NewF>  
         is the new face created from <F>. They may be usefull.") NewCurve2d;
		Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,Handle_Geom2d_Curve & C,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	E(TopoDS_Edge)
	P(Standard_Real)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns Standard_True if the Vertex  <V> has a new  
         parameter on the  edge <E>. In  this case,  <P> is  
         the parameter,    <Tol>  the     new    tolerance.  
         Otherwise, returns Standard_False, and <P>,  <Tol>  
         are not significant.") NewParameter;
		Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F1(TopoDS_Face)
	F2(TopoDS_Face)
	NewE(TopoDS_Edge)
	NewF1(TopoDS_Face)
	NewF2(TopoDS_Face)

Returns:
	GeomAbs_Shape

Returns the  continuity of  <NewE> between <NewF1>  
         and <NewF2>.  
 
         <NewE> is the new  edge created from <E>.  <NewF1>  
         (resp. <NewF2>) is the new  face created from <F1>  
         (resp. <F2>).") Continuity;
		GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const TopoDS_Edge & NewE,const TopoDS_Face & NewF1,const TopoDS_Face & NewF2);
};


%feature("shadow") ShapeCustom_ConvertToBSpline::~ShapeCustom_ConvertToBSpline %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeCustom_ConvertToBSpline {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeCustom_ConvertToBSpline {
	Handle_ShapeCustom_ConvertToBSpline GetHandle() {
	return *(Handle_ShapeCustom_ConvertToBSpline*) &$self;
	}
};

%nodefaultctor Handle_ShapeCustom_ConvertToBSpline;
class Handle_ShapeCustom_ConvertToBSpline : public Handle_BRepTools_Modification {

    public:
        // constructors
        Handle_ShapeCustom_ConvertToBSpline();
        Handle_ShapeCustom_ConvertToBSpline(const Handle_ShapeCustom_ConvertToBSpline &aHandle);
        Handle_ShapeCustom_ConvertToBSpline(const ShapeCustom_ConvertToBSpline *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeCustom_ConvertToBSpline DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeCustom_ConvertToBSpline {
    ShapeCustom_ConvertToBSpline* GetObject() {
    return (ShapeCustom_ConvertToBSpline*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeCustom_ConvertToBSpline::~Handle_ShapeCustom_ConvertToBSpline %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeCustom_ConvertToBSpline {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeCustom_Curve;
class ShapeCustom_Curve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeCustom_Curve;
		 ShapeCustom_Curve ();
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") ShapeCustom_Curve;
		 ShapeCustom_Curve (const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	substitute(Standard_Boolean)
	preci(Standard_Real)=- 1

Returns:
	Handle_Geom_Curve

Tries to convert the Curve to the Periodic form  
         Returns the resulting curve  
         Works only if the Curve is BSpline and is closed with  
         Precision::Confusion()  
         Else, or in case of failure, returns a Null Handle") ConvertToPeriodic;
		Handle_Geom_Curve ConvertToPeriodic (const Standard_Boolean substitute,const Standard_Real preci = - 1);
};


%feature("shadow") ShapeCustom_Curve::~ShapeCustom_Curve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeCustom_Curve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeCustom_Curve2d;
class ShapeCustom_Curve2d {
	public:
		%feature("autodoc", "Args:
	thePoles(TColgp_Array1OfPnt2d)
	theTolerance(Standard_Real)
	theDeviation(Standard_Real)

Returns:
	static Standard_Boolean

Check if poleses is in the plane with given precision  
         Returns false if no.") IsLinear;
		static Standard_Boolean IsLinear (const TColgp_Array1OfPnt2d & thePoles,const Standard_Real theTolerance,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	theCurve(Handle_Geom2d_Curve)
	theFirstIn(Standard_Real)
	theLastIn(Standard_Real)
	theTolerance(Standard_Real)
	theNewFirst(Standard_Real)
	theNewLast(Standard_Real)
	theDeviation(Standard_Real)

Returns:
	static Handle_Geom2d_Line

Try to convert BSpline2d or Bezier2d to line 2d  
         only if it is linear. Recalculate first and last parameters.  
         Returns line2d or null curve2d.") ConvertToLine2d;
		static Handle_Geom2d_Line ConvertToLine2d (const Handle_Geom2d_Curve & theCurve,const Standard_Real theFirstIn,const Standard_Real theLastIn,const Standard_Real theTolerance,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	theBSpline2d(Handle_Geom2d_BSplineCurve)
	theTolerance(Standard_Real)

Returns:
	static Standard_Boolean

Try to remove knots from bspline where local derivatives are the same.  
         Remove knots with given precision.  
         Returns false if Bsplien was not modified") SimplifyBSpline2d;
		static Standard_Boolean SimplifyBSpline2d (Handle_Geom2d_BSplineCurve & theBSpline2d,const Standard_Real theTolerance);
};


%feature("shadow") ShapeCustom_Curve2d::~ShapeCustom_Curve2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeCustom_Curve2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeCustom_DirectModification;
class ShapeCustom_DirectModification : public BRepTools_Modification {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeCustom_DirectModification;
		 ShapeCustom_DirectModification ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	Tol(Standard_Real)
	RevWires(Standard_Boolean)
	RevFace(Standard_Boolean)

Returns:
	Standard_Boolean

Returns Standard_True if the face <F> has  been  
         modified. In this case, <S> is the new geometric  
         support of the face, <L> the new location,  <Tol>  
         the new tolerance.  Otherwise, returns  
         Standard_False, and <S>, <L>, <Tol> are  not  
         significant.") NewSurface;
		Standard_Boolean NewSurface (const TopoDS_Face & F,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean & RevWires,Standard_Boolean & RevFace);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Geom_Curve)
	L(TopLoc_Location)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns Standard_True  if  the edge  <E> has  been  
         modified.  In this case,  <C> is the new geometric  
         support of the  edge, <L> the  new location, <Tol>  
         the         new    tolerance.   Otherwise, returns  
         Standard_False,    and  <C>,  <L>,   <Tol> are not  
         significant.") NewCurve;
		Standard_Boolean NewCurve (const TopoDS_Edge & E,Handle_Geom_Curve & C,TopLoc_Location & L,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	P(gp_Pnt)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns  Standard_True if the  vertex <V> has been  
         modified.  In this  case, <P> is the new geometric  
         support of the vertex,   <Tol> the new  tolerance.  
         Otherwise, returns Standard_False, and <P>,  <Tol>  
         are not significant.") NewPoint;
		Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	NewE(TopoDS_Edge)
	NewF(TopoDS_Face)
	C(Handle_Geom2d_Curve)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns Standard_True if  the edge  <E> has a  new  
         curve on surface on the face <F>.In this case, <C>  
         is the new geometric support of  the edge, <L> the  
         new location, <Tol> the new tolerance.  
 
         Otherwise, returns  Standard_False, and <C>,  <L>,  
         <Tol> are not significant.  
 
         <NewE> is the new  edge created from  <E>.  <NewF>  
         is the new face created from <F>. They may be usefull.") NewCurve2d;
		Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,Handle_Geom2d_Curve & C,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	E(TopoDS_Edge)
	P(Standard_Real)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns Standard_True if the Vertex  <V> has a new  
         parameter on the  edge <E>. In  this case,  <P> is  
         the parameter,    <Tol>  the     new    tolerance.  
         Otherwise, returns Standard_False, and <P>,  <Tol>  
         are not significant.") NewParameter;
		Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F1(TopoDS_Face)
	F2(TopoDS_Face)
	NewE(TopoDS_Edge)
	NewF1(TopoDS_Face)
	NewF2(TopoDS_Face)

Returns:
	GeomAbs_Shape

Returns the  continuity of  <NewE> between <NewF1>  
         and <NewF2>.  
 
         <NewE> is the new  edge created from <E>.  <NewF1>  
         (resp. <NewF2>) is the new  face created from <F1>  
         (resp. <F2>).") Continuity;
		GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const TopoDS_Edge & NewE,const TopoDS_Face & NewF1,const TopoDS_Face & NewF2);
};


%feature("shadow") ShapeCustom_DirectModification::~ShapeCustom_DirectModification %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeCustom_DirectModification {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeCustom_DirectModification {
	Handle_ShapeCustom_DirectModification GetHandle() {
	return *(Handle_ShapeCustom_DirectModification*) &$self;
	}
};

%nodefaultctor Handle_ShapeCustom_DirectModification;
class Handle_ShapeCustom_DirectModification : public Handle_BRepTools_Modification {

    public:
        // constructors
        Handle_ShapeCustom_DirectModification();
        Handle_ShapeCustom_DirectModification(const Handle_ShapeCustom_DirectModification &aHandle);
        Handle_ShapeCustom_DirectModification(const ShapeCustom_DirectModification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeCustom_DirectModification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeCustom_DirectModification {
    ShapeCustom_DirectModification* GetObject() {
    return (ShapeCustom_DirectModification*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeCustom_DirectModification::~Handle_ShapeCustom_DirectModification %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeCustom_DirectModification {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeCustom_RestrictionParameters;
class ShapeCustom_RestrictionParameters : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets default parameters.") ShapeCustom_RestrictionParameters;
		 ShapeCustom_RestrictionParameters ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetGMaxDegree() {
                return (Standard_Integer) $self->GMaxDegree();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetGMaxDegree(Standard_Integer value ) {
                $self->GMaxDegree()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetGMaxSeg() {
                return (Standard_Integer) $self->GMaxSeg();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetGMaxSeg(Standard_Integer value ) {
                $self->GMaxSeg()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetConvertPlane() {
                return (Standard_Boolean) $self->ConvertPlane();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetConvertPlane(Standard_Boolean value ) {
                $self->ConvertPlane()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetConvertBezierSurf() {
                return (Standard_Boolean) $self->ConvertBezierSurf();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetConvertBezierSurf(Standard_Boolean value ) {
                $self->ConvertBezierSurf()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetConvertRevolutionSurf() {
                return (Standard_Boolean) $self->ConvertRevolutionSurf();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetConvertRevolutionSurf(Standard_Boolean value ) {
                $self->ConvertRevolutionSurf()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetConvertExtrusionSurf() {
                return (Standard_Boolean) $self->ConvertExtrusionSurf();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetConvertExtrusionSurf(Standard_Boolean value ) {
                $self->ConvertExtrusionSurf()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetConvertOffsetSurf() {
                return (Standard_Boolean) $self->ConvertOffsetSurf();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetConvertOffsetSurf(Standard_Boolean value ) {
                $self->ConvertOffsetSurf()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetConvertCylindricalSurf() {
                return (Standard_Boolean) $self->ConvertCylindricalSurf();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetConvertCylindricalSurf(Standard_Boolean value ) {
                $self->ConvertCylindricalSurf()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetConvertConicalSurf() {
                return (Standard_Boolean) $self->ConvertConicalSurf();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetConvertConicalSurf(Standard_Boolean value ) {
                $self->ConvertConicalSurf()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetConvertToroidalSurf() {
                return (Standard_Boolean) $self->ConvertToroidalSurf();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetConvertToroidalSurf(Standard_Boolean value ) {
                $self->ConvertToroidalSurf()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetConvertSphericalSurf() {
                return (Standard_Boolean) $self->ConvertSphericalSurf();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetConvertSphericalSurf(Standard_Boolean value ) {
                $self->ConvertSphericalSurf()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetSegmentSurfaceMode() {
                return (Standard_Boolean) $self->SegmentSurfaceMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetSegmentSurfaceMode(Standard_Boolean value ) {
                $self->SegmentSurfaceMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetConvertCurve3d() {
                return (Standard_Boolean) $self->ConvertCurve3d();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetConvertCurve3d(Standard_Boolean value ) {
                $self->ConvertCurve3d()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetConvertOffsetCurv3d() {
                return (Standard_Boolean) $self->ConvertOffsetCurv3d();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetConvertOffsetCurv3d(Standard_Boolean value ) {
                $self->ConvertOffsetCurv3d()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetConvertCurve2d() {
                return (Standard_Boolean) $self->ConvertCurve2d();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetConvertCurve2d(Standard_Boolean value ) {
                $self->ConvertCurve2d()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetConvertOffsetCurv2d() {
                return (Standard_Boolean) $self->ConvertOffsetCurv2d();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetConvertOffsetCurv2d(Standard_Boolean value ) {
                $self->ConvertOffsetCurv2d()=value;
                }
            };
            };


%feature("shadow") ShapeCustom_RestrictionParameters::~ShapeCustom_RestrictionParameters %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeCustom_RestrictionParameters {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeCustom_RestrictionParameters {
	Handle_ShapeCustom_RestrictionParameters GetHandle() {
	return *(Handle_ShapeCustom_RestrictionParameters*) &$self;
	}
};

%nodefaultctor Handle_ShapeCustom_RestrictionParameters;
class Handle_ShapeCustom_RestrictionParameters : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeCustom_RestrictionParameters();
        Handle_ShapeCustom_RestrictionParameters(const Handle_ShapeCustom_RestrictionParameters &aHandle);
        Handle_ShapeCustom_RestrictionParameters(const ShapeCustom_RestrictionParameters *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeCustom_RestrictionParameters DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeCustom_RestrictionParameters {
    ShapeCustom_RestrictionParameters* GetObject() {
    return (ShapeCustom_RestrictionParameters*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeCustom_RestrictionParameters::~Handle_ShapeCustom_RestrictionParameters %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeCustom_RestrictionParameters {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeCustom_Surface;
class ShapeCustom_Surface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeCustom_Surface;
		 ShapeCustom_Surface ();
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") ShapeCustom_Surface;
		 ShapeCustom_Surface (const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns maximal deviation of converted surface from the original  
         one computed by last call to ConvertToAnalytical") Gap;
		Standard_Real Gap ();
		%feature("autodoc", "Args:
	tol(Standard_Real)
	substitute(Standard_Boolean)

Returns:
	Handle_Geom_Surface

Tries to convert the Surface to an Analytic form  
         Returns the result  
         Works only if the Surface is BSpline or Bezier.  
         Else, or in case of failure, returns a Null Handle  
 
         If <substitute> is True, the new surface replaces the actual  
         one in <self>  
 
         It works by analysing the case which can apply, creating the  
         corresponding analytic surface, then checking coincidence  
 Warning: Parameter laws are not kept, hence PCurves should be redone") ConvertToAnalytical;
		Handle_Geom_Surface ConvertToAnalytical (const Standard_Real tol,const Standard_Boolean substitute);
		%feature("autodoc", "Args:
	substitute(Standard_Boolean)
	preci(Standard_Real)=- 1

Returns:
	Handle_Geom_Surface

Tries to convert the Surface to the Periodic form  
         Returns the resulting surface  
         Works only if the Surface is BSpline and is closed with  
         Precision::Confusion()  
         Else, or in case of failure, returns a Null Handle") ConvertToPeriodic;
		Handle_Geom_Surface ConvertToPeriodic (const Standard_Boolean substitute,const Standard_Real preci = - 1);
};


%feature("shadow") ShapeCustom_Surface::~ShapeCustom_Surface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeCustom_Surface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeCustom_TrsfModification;
class ShapeCustom_TrsfModification : public BRepTools_TrsfModification {
	public:
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Empty constructor") ShapeCustom_TrsfModification;
		 ShapeCustom_TrsfModification (const gp_Trsf & T);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	Tol(Standard_Real)
	RevWires(Standard_Boolean)
	RevFace(Standard_Boolean)

Returns:
	Standard_Boolean

Calls inherited method.  
         Sets <Tol> as actual tolerance of <F> multiplied with scale  
         factor.") NewSurface;
		Standard_Boolean NewSurface (const TopoDS_Face & F,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean & RevWires,Standard_Boolean & RevFace);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Geom_Curve)
	L(TopLoc_Location)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Calls inherited method.  
         Sets <Tol> as actual tolerance of <E> multiplied with scale  
         factor.") NewCurve;
		Standard_Boolean NewCurve (const TopoDS_Edge & E,Handle_Geom_Curve & C,TopLoc_Location & L,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	P(gp_Pnt)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Calls inherited method.  
         Sets <Tol> as actual tolerance of <V> multiplied with scale  
         factor.") NewPoint;
		Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	NewE(TopoDS_Edge)
	NewF(TopoDS_Face)
	C(Handle_Geom2d_Curve)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Calls inherited method.  
         Sets <Tol> as actual tolerance of <E> multiplied with scale  
         factor.") NewCurve2d;
		Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,Handle_Geom2d_Curve & C,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	E(TopoDS_Edge)
	P(Standard_Real)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Calls inherited method.  
         Sets <Tol> as actual tolerance of <V> multiplied with scale  
         factor.") NewParameter;
		Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") ShapeCustom_TrsfModification::~ShapeCustom_TrsfModification %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeCustom_TrsfModification {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeCustom_TrsfModification {
	Handle_ShapeCustom_TrsfModification GetHandle() {
	return *(Handle_ShapeCustom_TrsfModification*) &$self;
	}
};

%nodefaultctor Handle_ShapeCustom_TrsfModification;
class Handle_ShapeCustom_TrsfModification : public Handle_BRepTools_TrsfModification {

    public:
        // constructors
        Handle_ShapeCustom_TrsfModification();
        Handle_ShapeCustom_TrsfModification(const Handle_ShapeCustom_TrsfModification &aHandle);
        Handle_ShapeCustom_TrsfModification(const ShapeCustom_TrsfModification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeCustom_TrsfModification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeCustom_TrsfModification {
    ShapeCustom_TrsfModification* GetObject() {
    return (ShapeCustom_TrsfModification*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeCustom_TrsfModification::~Handle_ShapeCustom_TrsfModification %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeCustom_TrsfModification {
    void _kill_pointed() {
        delete $self;
    }
};

