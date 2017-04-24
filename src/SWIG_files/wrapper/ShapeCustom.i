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
%module (package="OCC") ShapeCustom

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


%include ShapeCustom_headers.i


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

%rename(shapecustom) ShapeCustom;
class ShapeCustom {
	public:
		%feature("compactdefaultargs") ApplyModifier;
		%feature("autodoc", "	* Applies modifier to shape and checks sharing in the case assemblies.

	:param S:
	:type S: TopoDS_Shape &
	:param M:
	:type M: Handle_BRepTools_Modification &
	:param context:
	:type context: TopTools_DataMapOfShapeShape &
	:param MD:
	:type MD: BRepTools_Modifier &
	:param aProgress: default value is NULL
	:type aProgress: Handle_Message_ProgressIndicator &
	:param aReShape: default value is NULL
	:type aReShape: Handle_ShapeBuild_ReShape &
	:rtype: TopoDS_Shape
") ApplyModifier;
		static TopoDS_Shape ApplyModifier (const TopoDS_Shape & S,const Handle_BRepTools_Modification & M,TopTools_DataMapOfShapeShape & context,BRepTools_Modifier & MD,const Handle_Message_ProgressIndicator & aProgress = NULL,const Handle_ShapeBuild_ReShape & aReShape = NULL);
		%feature("compactdefaultargs") DirectFaces;
		%feature("autodoc", "	* Returns a new shape without indirect surfaces.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") DirectFaces;
		static TopoDS_Shape DirectFaces (const TopoDS_Shape & S);
		%feature("compactdefaultargs") ScaleShape;
		%feature("autodoc", "	* Returns a new shape which is scaled original

	:param S:
	:type S: TopoDS_Shape &
	:param scale:
	:type scale: float
	:rtype: TopoDS_Shape
") ScaleShape;
		static TopoDS_Shape ScaleShape (const TopoDS_Shape & S,const Standard_Real scale);
		%feature("compactdefaultargs") BSplineRestriction;
		%feature("autodoc", "	* Returns a new shape with all surfaces, curves and pcurves which type is BSpline/Bezier or based on them converted having Degree less than <MaxDegree> or number of spans less than <NbMaxSegment> in dependence on parameter priority <Degree>. <GmaxDegree> and <GMaxSegments> are maximum possible degree and number of spans correspondingly. These values will be used in those cases when approximation with specified parameters is impossible and one of GmaxDegree or GMaxSegments is selected in dependence on priority. Note that even if approximation is impossible with <GMaxDegree> then number of spans can exceed specified <GMaxSegment> <Rational> specifies if to convert Rational BSpline/Bezier into polynomial B-Spline. If flags ConvOffSurf,ConvOffCurve3d,ConvOffCurve2d are Standard_True there are means that Offset surfaces , Offset curves 3d and Offset curves 2d are converted to BSPline correspondingly.

	:param S:
	:type S: TopoDS_Shape &
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param MaxDegree:
	:type MaxDegree: int
	:param MaxNbSegment:
	:type MaxNbSegment: int
	:param Continuity3d:
	:type Continuity3d: GeomAbs_Shape
	:param Continuity2d:
	:type Continuity2d: GeomAbs_Shape
	:param Degree:
	:type Degree: bool
	:param Rational:
	:type Rational: bool
	:param aParameters:
	:type aParameters: Handle_ShapeCustom_RestrictionParameters &
	:rtype: TopoDS_Shape
") BSplineRestriction;
		static TopoDS_Shape BSplineRestriction (const TopoDS_Shape & S,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer MaxDegree,const Standard_Integer MaxNbSegment,const GeomAbs_Shape Continuity3d,const GeomAbs_Shape Continuity2d,const Standard_Boolean Degree,const Standard_Boolean Rational,const Handle_ShapeCustom_RestrictionParameters & aParameters);
		%feature("compactdefaultargs") ConvertToRevolution;
		%feature("autodoc", "	* Returns a new shape with all elementary periodic surfaces converted to Geom_SurfaceOfRevolution

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") ConvertToRevolution;
		static TopoDS_Shape ConvertToRevolution (const TopoDS_Shape & S);
		%feature("compactdefaultargs") SweptToElementary;
		%feature("autodoc", "	* Returns a new shape with all surfaces of revolution and linear extrusion convert to elementary periodic surfaces

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") SweptToElementary;
		static TopoDS_Shape SweptToElementary (const TopoDS_Shape & S);
		%feature("compactdefaultargs") ConvertToBSpline;
		%feature("autodoc", "	* Returns a new shape with all surfaces of linear extrusion, revolution, offset, and planar surfaces converted according to flags to Geom_BSplineSurface (with same parameterisation).

	:param S:
	:type S: TopoDS_Shape &
	:param extrMode:
	:type extrMode: bool
	:param revolMode:
	:type revolMode: bool
	:param offsetMode:
	:type offsetMode: bool
	:param planeMode: default value is Standard_False
	:type planeMode: bool
	:rtype: TopoDS_Shape
") ConvertToBSpline;
		static TopoDS_Shape ConvertToBSpline (const TopoDS_Shape & S,const Standard_Boolean extrMode,const Standard_Boolean revolMode,const Standard_Boolean offsetMode,const Standard_Boolean planeMode = Standard_False);
};


%extend ShapeCustom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeCustom_Curve;
class ShapeCustom_Curve {
	public:
		%feature("compactdefaultargs") ShapeCustom_Curve;
		%feature("autodoc", "	:rtype: None
") ShapeCustom_Curve;
		 ShapeCustom_Curve ();
		%feature("compactdefaultargs") ShapeCustom_Curve;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: None
") ShapeCustom_Curve;
		 ShapeCustom_Curve (const Handle_Geom_Curve & C);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C);
		%feature("compactdefaultargs") ConvertToPeriodic;
		%feature("autodoc", "	* Tries to convert the Curve to the Periodic form Returns the resulting curve Works only if the Curve is BSpline and is closed with Precision::Confusion() Else, or in case of failure, returns a Null Handle

	:param substitute:
	:type substitute: bool
	:param preci: default value is -1
	:type preci: float
	:rtype: Handle_Geom_Curve
") ConvertToPeriodic;
		Handle_Geom_Curve ConvertToPeriodic (const Standard_Boolean substitute,const Standard_Real preci = -1);
};


%extend ShapeCustom_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class ShapeCustom_Curve2d {
	public:
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "	* Check if poleses is in the plane with given precision Returns false if no.

	:param thePoles:
	:type thePoles: TColgp_Array1OfPnt2d
	:param theTolerance:
	:type theTolerance: float
	:param theDeviation:
	:type theDeviation: float &
	:rtype: bool
") IsLinear;
		static Standard_Boolean IsLinear (const TColgp_Array1OfPnt2d & thePoles,const Standard_Real theTolerance,Standard_Real &OutValue);
		%feature("compactdefaultargs") ConvertToLine2d;
		%feature("autodoc", "	* Try to convert BSpline2d or Bezier2d to line 2d only if it is linear. Recalculate first and last parameters. Returns line2d or null curve2d.

	:param theCurve:
	:type theCurve: Handle_Geom2d_Curve &
	:param theFirstIn:
	:type theFirstIn: float
	:param theLastIn:
	:type theLastIn: float
	:param theTolerance:
	:type theTolerance: float
	:param theNewFirst:
	:type theNewFirst: float &
	:param theNewLast:
	:type theNewLast: float &
	:param theDeviation:
	:type theDeviation: float &
	:rtype: Handle_Geom2d_Line
") ConvertToLine2d;
		static Handle_Geom2d_Line ConvertToLine2d (const Handle_Geom2d_Curve & theCurve,const Standard_Real theFirstIn,const Standard_Real theLastIn,const Standard_Real theTolerance,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SimplifyBSpline2d;
		%feature("autodoc", "	* Try to remove knots from bspline where local derivatives are the same. Remove knots with given precision. Returns false if Bsplien was not modified

	:param theBSpline2d:
	:type theBSpline2d: Handle_Geom2d_BSplineCurve &
	:param theTolerance:
	:type theTolerance: float
	:rtype: bool
") SimplifyBSpline2d;
		static Standard_Boolean SimplifyBSpline2d (Handle_Geom2d_BSplineCurve & theBSpline2d,const Standard_Real theTolerance);
};


%extend ShapeCustom_Curve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeCustom_Modification;
class ShapeCustom_Modification : public BRepTools_Modification {
	public:
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "	* Sets message registrator

	:param msgreg:
	:type msgreg: Handle_ShapeExtend_BasicMsgRegistrator &
	:rtype: void
") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const Handle_ShapeExtend_BasicMsgRegistrator & msgreg);
		%feature("compactdefaultargs") MsgRegistrator;
		%feature("autodoc", "	* Returns message registrator

	:rtype: Handle_ShapeExtend_BasicMsgRegistrator
") MsgRegistrator;
		Handle_ShapeExtend_BasicMsgRegistrator MsgRegistrator ();
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "	* Sends a message to be attached to the shape. Calls corresponding message of message registrator.

	:param shape:
	:type shape: TopoDS_Shape &
	:param message:
	:type message: Message_Msg &
	:param gravity: default value is Message_Info
	:type gravity: Message_Gravity
	:rtype: None
") SendMsg;
		void SendMsg (const TopoDS_Shape & shape,const Message_Msg & message,const Message_Gravity gravity = Message_Info);
};


%extend ShapeCustom_Modification {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeCustom_Modification(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeCustom_Modification::Handle_ShapeCustom_Modification %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeCustom_Modification;
class Handle_ShapeCustom_Modification : public Handle_BRepTools_Modification {

    public:
        // constructors
        Handle_ShapeCustom_Modification();
        Handle_ShapeCustom_Modification(const Handle_ShapeCustom_Modification &aHandle);
        Handle_ShapeCustom_Modification(const ShapeCustom_Modification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeCustom_Modification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeCustom_Modification {
    ShapeCustom_Modification* _get_reference() {
    return (ShapeCustom_Modification*)$self->Access();
    }
};

%extend Handle_ShapeCustom_Modification {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeCustom_Modification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeCustom_RestrictionParameters;
class ShapeCustom_RestrictionParameters : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ShapeCustom_RestrictionParameters;
		%feature("autodoc", "	* Sets default parameters.

	:rtype: None
") ShapeCustom_RestrictionParameters;
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


%extend ShapeCustom_RestrictionParameters {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeCustom_RestrictionParameters(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeCustom_RestrictionParameters::Handle_ShapeCustom_RestrictionParameters %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    ShapeCustom_RestrictionParameters* _get_reference() {
    return (ShapeCustom_RestrictionParameters*)$self->Access();
    }
};

%extend Handle_ShapeCustom_RestrictionParameters {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeCustom_RestrictionParameters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeCustom_Surface;
class ShapeCustom_Surface {
	public:
		%feature("compactdefaultargs") ShapeCustom_Surface;
		%feature("autodoc", "	:rtype: None
") ShapeCustom_Surface;
		 ShapeCustom_Surface ();
		%feature("compactdefaultargs") ShapeCustom_Surface;
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") ShapeCustom_Surface;
		 ShapeCustom_Surface (const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "	* Returns maximal deviation of converted surface from the original one computed by last call to ConvertToAnalytical

	:rtype: float
") Gap;
		Standard_Real Gap ();
		%feature("compactdefaultargs") ConvertToAnalytical;
		%feature("autodoc", "	* Tries to convert the Surface to an Analytic form Returns the result Works only if the Surface is BSpline or Bezier. Else, or in case of failure, returns a Null Handle //! If <substitute> is True, the new surface replaces the actual one in <self> //! It works by analysing the case which can apply, creating the corresponding analytic surface, then checking coincidence Warning: Parameter laws are not kept, hence PCurves should be redone

	:param tol:
	:type tol: float
	:param substitute:
	:type substitute: bool
	:rtype: Handle_Geom_Surface
") ConvertToAnalytical;
		Handle_Geom_Surface ConvertToAnalytical (const Standard_Real tol,const Standard_Boolean substitute);
		%feature("compactdefaultargs") ConvertToPeriodic;
		%feature("autodoc", "	* Tries to convert the Surface to the Periodic form Returns the resulting surface Works only if the Surface is BSpline and is closed with Precision::Confusion() Else, or in case of failure, returns a Null Handle

	:param substitute:
	:type substitute: bool
	:param preci: default value is -1
	:type preci: float
	:rtype: Handle_Geom_Surface
") ConvertToPeriodic;
		Handle_Geom_Surface ConvertToPeriodic (const Standard_Boolean substitute,const Standard_Real preci = -1);
};


%extend ShapeCustom_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeCustom_TrsfModification;
class ShapeCustom_TrsfModification : public BRepTools_TrsfModification {
	public:
		%feature("compactdefaultargs") ShapeCustom_TrsfModification;
		%feature("autodoc", "	* Empty constructor

	:param T:
	:type T: gp_Trsf
	:rtype: None
") ShapeCustom_TrsfModification;
		 ShapeCustom_TrsfModification (const gp_Trsf & T);
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "	* Calls inherited method. Sets <Tol> as actual tolerance of <F> multiplied with scale factor.

	:param F:
	:type F: TopoDS_Face &
	:param S:
	:type S: Handle_Geom_Surface &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:param RevWires:
	:type RevWires: bool
	:param RevFace:
	:type RevFace: bool
	:rtype: bool
") NewSurface;
		Standard_Boolean NewSurface (const TopoDS_Face & F,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "	* Calls inherited method. Sets <Tol> as actual tolerance of <E> multiplied with scale factor.

	:param E:
	:type E: TopoDS_Edge &
	:param C:
	:type C: Handle_Geom_Curve &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve;
		Standard_Boolean NewCurve (const TopoDS_Edge & E,Handle_Geom_Curve & C,TopLoc_Location & L,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "	* Calls inherited method. Sets <Tol> as actual tolerance of <V> multiplied with scale factor.

	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewPoint;
		Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "	* Calls inherited method. Sets <Tol> as actual tolerance of <E> multiplied with scale factor.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF:
	:type NewF: TopoDS_Face &
	:param C:
	:type C: Handle_Geom2d_Curve &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve2d;
		Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,Handle_Geom2d_Curve & C,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "	* Calls inherited method. Sets <Tol> as actual tolerance of <V> multiplied with scale factor.

	:param V:
	:type V: TopoDS_Vertex &
	:param E:
	:type E: TopoDS_Edge &
	:param P:
	:type P: float &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewParameter;
		Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend ShapeCustom_TrsfModification {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeCustom_TrsfModification(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeCustom_TrsfModification::Handle_ShapeCustom_TrsfModification %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    ShapeCustom_TrsfModification* _get_reference() {
    return (ShapeCustom_TrsfModification*)$self->Access();
    }
};

%extend Handle_ShapeCustom_TrsfModification {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeCustom_TrsfModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeCustom_ConvertToBSpline;
class ShapeCustom_ConvertToBSpline : public ShapeCustom_Modification {
	public:
		%feature("compactdefaultargs") ShapeCustom_ConvertToBSpline;
		%feature("autodoc", "	:rtype: None
") ShapeCustom_ConvertToBSpline;
		 ShapeCustom_ConvertToBSpline ();
		%feature("compactdefaultargs") SetExtrusionMode;
		%feature("autodoc", "	* Sets mode for convertion of Surfaces of Linear extrusion.

	:param extrMode:
	:type extrMode: bool
	:rtype: None
") SetExtrusionMode;
		void SetExtrusionMode (const Standard_Boolean extrMode);
		%feature("compactdefaultargs") SetRevolutionMode;
		%feature("autodoc", "	* Sets mode for convertion of Surfaces of Revolution.

	:param revolMode:
	:type revolMode: bool
	:rtype: None
") SetRevolutionMode;
		void SetRevolutionMode (const Standard_Boolean revolMode);
		%feature("compactdefaultargs") SetOffsetMode;
		%feature("autodoc", "	* Sets mode for convertion of Offset surfaces.

	:param offsetMode:
	:type offsetMode: bool
	:rtype: None
") SetOffsetMode;
		void SetOffsetMode (const Standard_Boolean offsetMode);
		%feature("compactdefaultargs") SetPlaneMode;
		%feature("autodoc", "	* Sets mode for convertion of Plane surfaces.

	:param planeMode:
	:type planeMode: bool
	:rtype: None
") SetPlaneMode;
		void SetPlaneMode (const Standard_Boolean planeMode);
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "	* Returns Standard_True if the face <F> has been modified. In this case, <S> is the new geometric support of the face, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <S>, <L>, <Tol> are not significant.

	:param F:
	:type F: TopoDS_Face &
	:param S:
	:type S: Handle_Geom_Surface &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:param RevWires:
	:type RevWires: bool
	:param RevFace:
	:type RevFace: bool
	:rtype: bool
") NewSurface;
		Standard_Boolean NewSurface (const TopoDS_Face & F,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "	* Returns Standard_True if the edge <E> has been modified. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.

	:param E:
	:type E: TopoDS_Edge &
	:param C:
	:type C: Handle_Geom_Curve &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve;
		Standard_Boolean NewCurve (const TopoDS_Edge & E,Handle_Geom_Curve & C,TopLoc_Location & L,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "	* Returns Standard_True if the vertex <V> has been modified. In this case, <P> is the new geometric support of the vertex, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.

	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewPoint;
		Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "	* Returns Standard_True if the edge <E> has a new curve on surface on the face <F>.In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. //! Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant. //! <NewE> is the new edge created from <E>. <NewF> is the new face created from <F>. They may be usefull.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF:
	:type NewF: TopoDS_Face &
	:param C:
	:type C: Handle_Geom2d_Curve &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve2d;
		Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,Handle_Geom2d_Curve & C,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "	* Returns Standard_True if the Vertex <V> has a new parameter on the edge <E>. In this case, <P> is the parameter, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.

	:param V:
	:type V: TopoDS_Vertex &
	:param E:
	:type E: TopoDS_Edge &
	:param P:
	:type P: float &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewParameter;
		Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	* Returns the continuity of <NewE> between <NewF1> and <NewF2>. //! <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).

	:param E:
	:type E: TopoDS_Edge &
	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF1:
	:type NewF1: TopoDS_Face &
	:param NewF2:
	:type NewF2: TopoDS_Face &
	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const TopoDS_Edge & NewE,const TopoDS_Face & NewF1,const TopoDS_Face & NewF2);
};


%extend ShapeCustom_ConvertToBSpline {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeCustom_ConvertToBSpline(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeCustom_ConvertToBSpline::Handle_ShapeCustom_ConvertToBSpline %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeCustom_ConvertToBSpline;
class Handle_ShapeCustom_ConvertToBSpline : public Handle_ShapeCustom_Modification {

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
    ShapeCustom_ConvertToBSpline* _get_reference() {
    return (ShapeCustom_ConvertToBSpline*)$self->Access();
    }
};

%extend Handle_ShapeCustom_ConvertToBSpline {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeCustom_ConvertToBSpline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeCustom_DirectModification;
class ShapeCustom_DirectModification : public ShapeCustom_Modification {
	public:
		%feature("compactdefaultargs") ShapeCustom_DirectModification;
		%feature("autodoc", "	:rtype: None
") ShapeCustom_DirectModification;
		 ShapeCustom_DirectModification ();
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "	* Returns Standard_True if the face <F> has been modified. In this case, <S> is the new geometric support of the face, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <S>, <L>, <Tol> are not significant.

	:param F:
	:type F: TopoDS_Face &
	:param S:
	:type S: Handle_Geom_Surface &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:param RevWires:
	:type RevWires: bool
	:param RevFace:
	:type RevFace: bool
	:rtype: bool
") NewSurface;
		Standard_Boolean NewSurface (const TopoDS_Face & F,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "	* Returns Standard_True if the edge <E> has been modified. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.

	:param E:
	:type E: TopoDS_Edge &
	:param C:
	:type C: Handle_Geom_Curve &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve;
		Standard_Boolean NewCurve (const TopoDS_Edge & E,Handle_Geom_Curve & C,TopLoc_Location & L,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "	* Returns Standard_True if the vertex <V> has been modified. In this case, <P> is the new geometric support of the vertex, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.

	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewPoint;
		Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "	* Returns Standard_True if the edge <E> has a new curve on surface on the face <F>.In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. //! Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant. //! <NewE> is the new edge created from <E>. <NewF> is the new face created from <F>. They may be usefull.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF:
	:type NewF: TopoDS_Face &
	:param C:
	:type C: Handle_Geom2d_Curve &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve2d;
		Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,Handle_Geom2d_Curve & C,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "	* Returns Standard_True if the Vertex <V> has a new parameter on the edge <E>. In this case, <P> is the parameter, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.

	:param V:
	:type V: TopoDS_Vertex &
	:param E:
	:type E: TopoDS_Edge &
	:param P:
	:type P: float &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewParameter;
		Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	* Returns the continuity of <NewE> between <NewF1> and <NewF2>. //! <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).

	:param E:
	:type E: TopoDS_Edge &
	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF1:
	:type NewF1: TopoDS_Face &
	:param NewF2:
	:type NewF2: TopoDS_Face &
	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const TopoDS_Edge & NewE,const TopoDS_Face & NewF1,const TopoDS_Face & NewF2);
};


%extend ShapeCustom_DirectModification {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeCustom_DirectModification(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeCustom_DirectModification::Handle_ShapeCustom_DirectModification %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeCustom_DirectModification;
class Handle_ShapeCustom_DirectModification : public Handle_ShapeCustom_Modification {

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
    ShapeCustom_DirectModification* _get_reference() {
    return (ShapeCustom_DirectModification*)$self->Access();
    }
};

%extend Handle_ShapeCustom_DirectModification {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeCustom_DirectModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
