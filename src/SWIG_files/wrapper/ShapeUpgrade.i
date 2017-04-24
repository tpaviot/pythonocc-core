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
%module (package="OCC") ShapeUpgrade

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


%include ShapeUpgrade_headers.i


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

%rename(shapeupgrade) ShapeUpgrade;
class ShapeUpgrade {
	public:
		%feature("compactdefaultargs") C0BSplineToSequenceOfC1BSplineCurve;
		%feature("autodoc", "	* Unifies same domain faces and edges of specified shape

	:param BS:
	:type BS: Handle_Geom_BSplineCurve &
	:param seqBS:
	:type seqBS: Handle_TColGeom_HSequenceOfBoundedCurve &
	:rtype: bool
") C0BSplineToSequenceOfC1BSplineCurve;
		static Standard_Boolean C0BSplineToSequenceOfC1BSplineCurve (const Handle_Geom_BSplineCurve & BS,Handle_TColGeom_HSequenceOfBoundedCurve & seqBS);
		%feature("compactdefaultargs") C0BSplineToSequenceOfC1BSplineCurve;
		%feature("autodoc", "	* Converts C0 B-Spline curve into sequence of C1 B-Spline curves. This method splits B-Spline at the knots with multiplicities equal to degree, i.e. unlike method GeomConvert::C0BSplineToArrayOfC1BSplineCurve this one does not use any tolerance and therefore does not change the geometry of B-Spline. Returns True if C0 B-Spline was successfully splitted, else returns False (if BS is C1 B-Spline).

	:param BS:
	:type BS: Handle_Geom2d_BSplineCurve &
	:param seqBS:
	:type seqBS: Handle_TColGeom2d_HSequenceOfBoundedCurve &
	:rtype: bool
") C0BSplineToSequenceOfC1BSplineCurve;
		static Standard_Boolean C0BSplineToSequenceOfC1BSplineCurve (const Handle_Geom2d_BSplineCurve & BS,Handle_TColGeom2d_HSequenceOfBoundedCurve & seqBS);
};


%extend ShapeUpgrade {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_RemoveLocations;
class ShapeUpgrade_RemoveLocations : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_RemoveLocations;
		%feature("autodoc", "	* Empy constructor

	:rtype: None
") ShapeUpgrade_RemoveLocations;
		 ShapeUpgrade_RemoveLocations ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes all location correspodingly to RemoveLevel.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "	* Returns shape with removed locatins.

	:rtype: TopoDS_Shape
") GetResult;
		TopoDS_Shape GetResult ();
		%feature("compactdefaultargs") SetRemoveLevel;
		%feature("autodoc", "	* sets level starting with that location will be removed, by default TopAbs_SHAPE. In this case locations will be kept for specified shape and if specified shape is TopAbs_COMPOUND for sub-shapes of first level.

	:param theLevel:
	:type theLevel: TopAbs_ShapeEnum
	:rtype: None
") SetRemoveLevel;
		void SetRemoveLevel (const TopAbs_ShapeEnum theLevel);
		%feature("compactdefaultargs") RemoveLevel;
		%feature("autodoc", "	* sets level starting with that location will be removed.Value of level can be set to TopAbs_SHAPE,TopAbs_COMPOUND,TopAbs_SOLID,TopAbs_SHELL,TopAbs_FACE.By default TopAbs_SHAPE. In this case location will be removed for all shape types for exception of compound.

	:rtype: TopAbs_ShapeEnum
") RemoveLevel;
		TopAbs_ShapeEnum RemoveLevel ();
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "	* Returns modified shape obtained from initial shape.

	:param theInitShape:
	:type theInitShape: TopoDS_Shape &
	:rtype: TopoDS_Shape
") ModifiedShape;
		TopoDS_Shape ModifiedShape (const TopoDS_Shape & theInitShape);
};


%extend ShapeUpgrade_RemoveLocations {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_RemoveLocations(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_RemoveLocations::Handle_ShapeUpgrade_RemoveLocations %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_RemoveLocations;
class Handle_ShapeUpgrade_RemoveLocations : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeUpgrade_RemoveLocations();
        Handle_ShapeUpgrade_RemoveLocations(const Handle_ShapeUpgrade_RemoveLocations &aHandle);
        Handle_ShapeUpgrade_RemoveLocations(const ShapeUpgrade_RemoveLocations *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_RemoveLocations DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_RemoveLocations {
    ShapeUpgrade_RemoveLocations* _get_reference() {
    return (ShapeUpgrade_RemoveLocations*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_RemoveLocations {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_RemoveLocations {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_ShapeDivide;
class ShapeUpgrade_ShapeDivide {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivide;
		%feature("autodoc", "	:rtype: None
") ShapeUpgrade_ShapeDivide;
		 ShapeUpgrade_ShapeDivide ();
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivide;
		%feature("autodoc", "	* Initialize by a Shape.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") ShapeUpgrade_ShapeDivide;
		 ShapeUpgrade_ShapeDivide (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize by a Shape.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "	* Defines the spatial precision used for splitting

	:param Prec:
	:type Prec: float
	:rtype: None
") SetPrecision;
		void SetPrecision (const Standard_Real Prec);
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "	* Sets maximal allowed tolerance

	:param maxtol:
	:type maxtol: float
	:rtype: None
") SetMaxTolerance;
		void SetMaxTolerance (const Standard_Real maxtol);
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "	* Sets minimal allowed tolerance

	:param mintol:
	:type mintol: float
	:rtype: None
") SetMinTolerance;
		void SetMinTolerance (const Standard_Real mintol);
		%feature("compactdefaultargs") SetSurfaceSegmentMode;
		%feature("autodoc", "	* Purpose sets mode for trimming (segment) surface by wire UV bounds.

	:param Segment:
	:type Segment: bool
	:rtype: None
") SetSurfaceSegmentMode;
		void SetSurfaceSegmentMode (const Standard_Boolean Segment);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs splitting and computes the resulting shape If newContext is True (default), the internal context will be cleared at start, else previous substitutions will be acting.

	:param newContext: default value is Standard_True
	:type newContext: bool
	:rtype: bool
") Perform;
		virtual Standard_Boolean Perform (const Standard_Boolean newContext = Standard_True);
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* Gives the resulting Shape, or Null shape if not done.

	:rtype: TopoDS_Shape
") Result;
		TopoDS_Shape Result ();
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "	* Returns context with all the modifications made during last call(s) to Perform() recorded

	:rtype: Handle_ShapeBuild_ReShape
") GetContext;
		Handle_ShapeBuild_ReShape GetContext ();
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	* Sets context with recorded modifications to be applied during next call(s) to Perform(shape,Standard_False)

	:param context:
	:type context: Handle_ShapeBuild_ReShape &
	:rtype: None
") SetContext;
		void SetContext (const Handle_ShapeBuild_ReShape & context);
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
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Queries the status of last call to Perform OK : no splitting was done (or no call to Perform) DONE1: some edges were splitted DONE2: surface was splitted FAIL1: some errors occured

	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("compactdefaultargs") SetSplitFaceTool;
		%feature("autodoc", "	* Sets the tool for splitting faces.

	:param splitFaceTool:
	:type splitFaceTool: Handle_ShapeUpgrade_FaceDivide &
	:rtype: None
") SetSplitFaceTool;
		void SetSplitFaceTool (const Handle_ShapeUpgrade_FaceDivide & splitFaceTool);
		%feature("compactdefaultargs") SetEdgeMode;
		%feature("autodoc", "	* Sets mode for splitting 3d curves from edges. 0 - only curve 3d from free edges. 1 - only curve 3d from shared edges. 2 - all curve 3d.

	:param aEdgeMode:
	:type aEdgeMode: int
	:rtype: None
") SetEdgeMode;
		void SetEdgeMode (const Standard_Integer aEdgeMode);
};


%extend ShapeUpgrade_ShapeDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_ShellSewing;
class ShapeUpgrade_ShellSewing {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_ShellSewing;
		%feature("autodoc", "	* Creates a ShellSewing, empty

	:rtype: None
") ShapeUpgrade_ShellSewing;
		 ShapeUpgrade_ShellSewing ();
		%feature("compactdefaultargs") ApplySewing;
		%feature("autodoc", "	* Builds a new shape from a former one, by calling Sewing from BRepBuilderAPI. Rebuilt solids are oriented to be 'not infinite' //! If <tol> is not given (i.e. value 0. by default), it is computed as the mean tolerance recorded in <shape> //! If no shell has been sewed, this method returns the input shape

	:param shape:
	:type shape: TopoDS_Shape &
	:param tol: default value is 0.0
	:type tol: float
	:rtype: TopoDS_Shape
") ApplySewing;
		TopoDS_Shape ApplySewing (const TopoDS_Shape & shape,const Standard_Real tol = 0.0);
};


%extend ShapeUpgrade_ShellSewing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_SplitCurve;
class ShapeUpgrade_SplitCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ShapeUpgrade_SplitCurve;
		 ShapeUpgrade_SplitCurve ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes with curve first and last parameters.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None
") Init;
		void Init (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") SetSplitValues;
		%feature("autodoc", "	* Sets the parameters where splitting has to be done.

	:param SplitValues:
	:type SplitValues: Handle_TColStd_HSequenceOfReal &
	:rtype: None
") SetSplitValues;
		void SetSplitValues (const Handle_TColStd_HSequenceOfReal & SplitValues);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* If Segment is True, the result is composed with segments of the curve bounded by the SplitValues. If Segment is False, the result is composed with trimmed Curves all based on the same complete curve.

	:param Segment:
	:type Segment: bool
	:rtype: void
") Build;
		virtual void Build (const Standard_Boolean Segment);
		%feature("compactdefaultargs") SplitValues;
		%feature("autodoc", "	* returns all the splitting values including the First and Last parameters of the input curve Merges input split values and new ones into myGlobalKnots

	:rtype: Handle_TColStd_HSequenceOfReal
") SplitValues;
		Handle_TColStd_HSequenceOfReal SplitValues ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Calculates points for correction/splitting of the curve

	:rtype: void
") Compute;
		virtual void Compute ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs correction/splitting of the curve. First defines splitting values by method Compute(), then calls method Build().

	:param Segment: default value is Standard_True
	:type Segment: bool
	:rtype: None
") Perform;
		void Perform (const Standard_Boolean Segment = Standard_True);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns the status OK - no splitting is needed DONE1 - splitting required and gives more than one segment DONE2 - splitting is required, but gives only one segment (initial) DONE3 - geometric form of the curve or parametrisation is modified

	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
};


%extend ShapeUpgrade_SplitCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_SplitCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_SplitCurve::Handle_ShapeUpgrade_SplitCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_SplitCurve;
class Handle_ShapeUpgrade_SplitCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeUpgrade_SplitCurve();
        Handle_ShapeUpgrade_SplitCurve(const Handle_ShapeUpgrade_SplitCurve &aHandle);
        Handle_ShapeUpgrade_SplitCurve(const ShapeUpgrade_SplitCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_SplitCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_SplitCurve {
    ShapeUpgrade_SplitCurve* _get_reference() {
    return (ShapeUpgrade_SplitCurve*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_SplitCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_SplitCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_SplitSurface;
class ShapeUpgrade_SplitSurface : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurface;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ShapeUpgrade_SplitSurface;
		 ShapeUpgrade_SplitSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes with single supporting surface.

	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes with single supporting surface with bounding parameters.

	:param S:
	:type S: Handle_Geom_Surface &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:param VFirst:
	:type VFirst: float
	:param VLast:
	:type VLast: float
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & S,const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real VFirst,const Standard_Real VLast);
		%feature("compactdefaultargs") SetUSplitValues;
		%feature("autodoc", "	* Sets U parameters where splitting has to be done

	:param UValues:
	:type UValues: Handle_TColStd_HSequenceOfReal &
	:rtype: None
") SetUSplitValues;
		void SetUSplitValues (const Handle_TColStd_HSequenceOfReal & UValues);
		%feature("compactdefaultargs") SetVSplitValues;
		%feature("autodoc", "	* Sets V parameters where splitting has to be done

	:param VValues:
	:type VValues: Handle_TColStd_HSequenceOfReal &
	:rtype: None
") SetVSplitValues;
		void SetVSplitValues (const Handle_TColStd_HSequenceOfReal & VValues);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Performs splitting of the supporting surface. If resulting surface is B-Spline and Segment is True, the result is composed with segments of the surface bounded by the U and V SplitValues (method Geom_BSplineSurface::Segment is used). If Segment is False, the result is composed with Geom_RectangularTrimmedSurface all based on the same complete surface. Fields myNbResultingRow and myNbResultingCol must be set to specify the size of resulting grid of surfaces.

	:param Segment:
	:type Segment: bool
	:rtype: void
") Build;
		virtual void Build (const Standard_Boolean Segment);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Calculates points for correction/splitting of the surface.

	:param Segment: default value is Standard_True
	:type Segment: bool
	:rtype: void
") Compute;
		virtual void Compute (const Standard_Boolean Segment = Standard_True);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs correction/splitting of the surface. First defines splitting values by method Compute(), then calls method Build().

	:param Segment: default value is Standard_True
	:type Segment: bool
	:rtype: None
") Perform;
		void Perform (const Standard_Boolean Segment = Standard_True);
		%feature("compactdefaultargs") USplitValues;
		%feature("autodoc", "	* returns all the U splitting values including the First and Last parameters of the input surface

	:rtype: Handle_TColStd_HSequenceOfReal
") USplitValues;
		Handle_TColStd_HSequenceOfReal USplitValues ();
		%feature("compactdefaultargs") VSplitValues;
		%feature("autodoc", "	* returns all the splitting V values including the First and Last parameters of the input surface

	:rtype: Handle_TColStd_HSequenceOfReal
") VSplitValues;
		Handle_TColStd_HSequenceOfReal VSplitValues ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns the status OK - no splitting is needed DONE1 - splitting required and gives more than one patch DONE2 - splitting is required, but gives only single patch (initial) DONE3 - geometric form of the surface or parametrisation is modified

	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("compactdefaultargs") ResSurfaces;
		%feature("autodoc", "	* Returns obtained surfaces after splitting as CompositeSurface

	:rtype: Handle_ShapeExtend_CompositeSurface
") ResSurfaces;
		Handle_ShapeExtend_CompositeSurface ResSurfaces ();
};


%extend ShapeUpgrade_SplitSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_SplitSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_SplitSurface::Handle_ShapeUpgrade_SplitSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_SplitSurface;
class Handle_ShapeUpgrade_SplitSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeUpgrade_SplitSurface();
        Handle_ShapeUpgrade_SplitSurface(const Handle_ShapeUpgrade_SplitSurface &aHandle);
        Handle_ShapeUpgrade_SplitSurface(const ShapeUpgrade_SplitSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_SplitSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_SplitSurface {
    ShapeUpgrade_SplitSurface* _get_reference() {
    return (ShapeUpgrade_SplitSurface*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_SplitSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_SplitSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_Tool;
class ShapeUpgrade_Tool : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_Tool;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") ShapeUpgrade_Tool;
		 ShapeUpgrade_Tool ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Copy all fields from another Root object

	:param tool:
	:type tool: Handle_ShapeUpgrade_Tool &
	:rtype: None
") Set;
		void Set (const Handle_ShapeUpgrade_Tool & tool);
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	* Sets context

	:param context:
	:type context: Handle_ShapeBuild_ReShape &
	:rtype: None
") SetContext;
		void SetContext (const Handle_ShapeBuild_ReShape & context);
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "	* Returns context

	:rtype: Handle_ShapeBuild_ReShape
") Context;
		Handle_ShapeBuild_ReShape Context ();
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "	* Sets basic precision value

	:param preci:
	:type preci: float
	:rtype: None
") SetPrecision;
		void SetPrecision (const Standard_Real preci);
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "	* Returns basic precision value

	:rtype: float
") Precision;
		Standard_Real Precision ();
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "	* Sets minimal allowed tolerance

	:param mintol:
	:type mintol: float
	:rtype: None
") SetMinTolerance;
		void SetMinTolerance (const Standard_Real mintol);
		%feature("compactdefaultargs") MinTolerance;
		%feature("autodoc", "	* Returns minimal allowed tolerance

	:rtype: float
") MinTolerance;
		Standard_Real MinTolerance ();
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "	* Sets maximal allowed tolerance

	:param maxtol:
	:type maxtol: float
	:rtype: None
") SetMaxTolerance;
		void SetMaxTolerance (const Standard_Real maxtol);
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "	* Returns maximal allowed tolerance

	:rtype: float
") MaxTolerance;
		Standard_Real MaxTolerance ();
		%feature("compactdefaultargs") LimitTolerance;
		%feature("autodoc", "	* Returns tolerance limited by [myMinTol,myMaxTol]

	:param toler:
	:type toler: float
	:rtype: float
") LimitTolerance;
		Standard_Real LimitTolerance (const Standard_Real toler);
};


%extend ShapeUpgrade_Tool {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_Tool(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_Tool::Handle_ShapeUpgrade_Tool %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_Tool;
class Handle_ShapeUpgrade_Tool : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeUpgrade_Tool();
        Handle_ShapeUpgrade_Tool(const Handle_ShapeUpgrade_Tool &aHandle);
        Handle_ShapeUpgrade_Tool(const ShapeUpgrade_Tool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_Tool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_Tool {
    ShapeUpgrade_Tool* _get_reference() {
    return (ShapeUpgrade_Tool*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_Tool {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_UnifySameDomain;
class ShapeUpgrade_UnifySameDomain : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_UnifySameDomain;
		%feature("autodoc", "	* empty constructor

	:rtype: None
") ShapeUpgrade_UnifySameDomain;
		 ShapeUpgrade_UnifySameDomain ();
		%feature("compactdefaultargs") ShapeUpgrade_UnifySameDomain;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:param UnifyEdges: default value is Standard_True
	:type UnifyEdges: bool
	:param UnifyFaces: default value is Standard_True
	:type UnifyFaces: bool
	:param ConcatBSplines: default value is Standard_False
	:type ConcatBSplines: bool
	:rtype: None
") ShapeUpgrade_UnifySameDomain;
		 ShapeUpgrade_UnifySameDomain (const TopoDS_Shape & aShape,const Standard_Boolean UnifyEdges = Standard_True,const Standard_Boolean UnifyFaces = Standard_True,const Standard_Boolean ConcatBSplines = Standard_False);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:param UnifyEdges: default value is Standard_True
	:type UnifyEdges: bool
	:param UnifyFaces: default value is Standard_True
	:type UnifyFaces: bool
	:param ConcatBSplines: default value is Standard_False
	:type ConcatBSplines: bool
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_Shape & aShape,const Standard_Boolean UnifyEdges = Standard_True,const Standard_Boolean UnifyFaces = Standard_True,const Standard_Boolean ConcatBSplines = Standard_False);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds the resulting shape

	:rtype: None
") Build;
		void Build ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Gives the resulting shape

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Generated;
		TopoDS_Shape Generated (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") UnifyFaces;
		%feature("autodoc", "	* this method makes if possible a common face from each group of faces lying on coincident surfaces

	:rtype: None
") UnifyFaces;
		void UnifyFaces ();
		%feature("compactdefaultargs") UnifyEdges;
		%feature("autodoc", "	* this method makes if possible a common edge from each group of edges connecting common couple of faces

	:rtype: None
") UnifyEdges;
		void UnifyEdges ();
		%feature("compactdefaultargs") UnifyFacesAndEdges;
		%feature("autodoc", "	* this method unifies same domain faces and edges

	:rtype: None
") UnifyFacesAndEdges;
		void UnifyFacesAndEdges ();
};


%extend ShapeUpgrade_UnifySameDomain {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_UnifySameDomain(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_UnifySameDomain::Handle_ShapeUpgrade_UnifySameDomain %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_UnifySameDomain;
class Handle_ShapeUpgrade_UnifySameDomain : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeUpgrade_UnifySameDomain();
        Handle_ShapeUpgrade_UnifySameDomain(const Handle_ShapeUpgrade_UnifySameDomain &aHandle);
        Handle_ShapeUpgrade_UnifySameDomain(const ShapeUpgrade_UnifySameDomain *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_UnifySameDomain DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_UnifySameDomain {
    ShapeUpgrade_UnifySameDomain* _get_reference() {
    return (ShapeUpgrade_UnifySameDomain*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_UnifySameDomain {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_UnifySameDomain {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_ConvertSurfaceToBezierBasis;
class ShapeUpgrade_ConvertSurfaceToBezierBasis : public ShapeUpgrade_SplitSurface {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_ConvertSurfaceToBezierBasis;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ShapeUpgrade_ConvertSurfaceToBezierBasis;
		 ShapeUpgrade_ConvertSurfaceToBezierBasis ();
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Splits a list of beziers computed by Compute method according the split values and splitting parameters.

	:param Segment:
	:type Segment: bool
	:rtype: void
") Build;
		virtual void Build (const Standard_Boolean Segment);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Converts surface into a grid of bezier based surfaces, and stores this grid.

	:param Segment:
	:type Segment: bool
	:rtype: void
") Compute;
		virtual void Compute (const Standard_Boolean Segment);
		%feature("compactdefaultargs") Segments;
		%feature("autodoc", "	* Returns the grid of bezier based surfaces correspondent to original surface.

	:rtype: Handle_ShapeExtend_CompositeSurface
") Segments;
		Handle_ShapeExtend_CompositeSurface Segments ();
		%feature("compactdefaultargs") SetPlaneMode;
		%feature("autodoc", "	* Sets mode for conversion Geom_Plane to Bezier

	:param mode:
	:type mode: bool
	:rtype: None
") SetPlaneMode;
		void SetPlaneMode (const Standard_Boolean mode);
		%feature("compactdefaultargs") GetPlaneMode;
		%feature("autodoc", "	* Returns the Geom_Pline conversion mode.

	:rtype: bool
") GetPlaneMode;
		Standard_Boolean GetPlaneMode ();
		%feature("compactdefaultargs") SetRevolutionMode;
		%feature("autodoc", "	* Sets mode for conversion Geom_SurfaceOfRevolution to Bezier

	:param mode:
	:type mode: bool
	:rtype: None
") SetRevolutionMode;
		void SetRevolutionMode (const Standard_Boolean mode);
		%feature("compactdefaultargs") GetRevolutionMode;
		%feature("autodoc", "	* Returns the Geom_SurfaceOfRevolution conversion mode.

	:rtype: bool
") GetRevolutionMode;
		Standard_Boolean GetRevolutionMode ();
		%feature("compactdefaultargs") SetExtrusionMode;
		%feature("autodoc", "	* Sets mode for conversion Geom_SurfaceOfLinearExtrusion to Bezier

	:param mode:
	:type mode: bool
	:rtype: None
") SetExtrusionMode;
		void SetExtrusionMode (const Standard_Boolean mode);
		%feature("compactdefaultargs") GetExtrusionMode;
		%feature("autodoc", "	* Returns the Geom_SurfaceOfLinearExtrusion conversion mode.

	:rtype: bool
") GetExtrusionMode;
		Standard_Boolean GetExtrusionMode ();
		%feature("compactdefaultargs") SetBSplineMode;
		%feature("autodoc", "	* Sets mode for conversion Geom_BSplineSurface to Bezier

	:param mode:
	:type mode: bool
	:rtype: None
") SetBSplineMode;
		void SetBSplineMode (const Standard_Boolean mode);
		%feature("compactdefaultargs") GetBSplineMode;
		%feature("autodoc", "	* Returns the Geom_BSplineSurface conversion mode.

	:rtype: bool
") GetBSplineMode;
		Standard_Boolean GetBSplineMode ();
};


%extend ShapeUpgrade_ConvertSurfaceToBezierBasis {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis::Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis;
class Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis : public Handle_ShapeUpgrade_SplitSurface {

    public:
        // constructors
        Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis();
        Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis(const Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis &aHandle);
        Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis(const ShapeUpgrade_ConvertSurfaceToBezierBasis *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis {
    ShapeUpgrade_ConvertSurfaceToBezierBasis* _get_reference() {
    return (ShapeUpgrade_ConvertSurfaceToBezierBasis*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_ConvertSurfaceToBezierBasis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_EdgeDivide;
class ShapeUpgrade_EdgeDivide : public ShapeUpgrade_Tool {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_EdgeDivide;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") ShapeUpgrade_EdgeDivide;
		 ShapeUpgrade_EdgeDivide ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "	* Sets supporting surface by face

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") SetFace;
		void SetFace (const TopoDS_Face & F);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") Compute;
		virtual Standard_Boolean Compute (const TopoDS_Edge & E);
		%feature("compactdefaultargs") HasCurve2d;
		%feature("autodoc", "	:rtype: bool
") HasCurve2d;
		Standard_Boolean HasCurve2d ();
		%feature("compactdefaultargs") HasCurve3d;
		%feature("autodoc", "	:rtype: bool
") HasCurve3d;
		Standard_Boolean HasCurve3d ();
		%feature("compactdefaultargs") Knots2d;
		%feature("autodoc", "	:rtype: Handle_TColStd_HSequenceOfReal
") Knots2d;
		Handle_TColStd_HSequenceOfReal Knots2d ();
		%feature("compactdefaultargs") Knots3d;
		%feature("autodoc", "	:rtype: Handle_TColStd_HSequenceOfReal
") Knots3d;
		Handle_TColStd_HSequenceOfReal Knots3d ();
		%feature("compactdefaultargs") SetSplitCurve2dTool;
		%feature("autodoc", "	* Sets the tool for splitting pcurves.

	:param splitCurve2dTool:
	:type splitCurve2dTool: Handle_ShapeUpgrade_SplitCurve2d &
	:rtype: None
") SetSplitCurve2dTool;
		void SetSplitCurve2dTool (const Handle_ShapeUpgrade_SplitCurve2d & splitCurve2dTool);
		%feature("compactdefaultargs") SetSplitCurve3dTool;
		%feature("autodoc", "	* Sets the tool for splitting 3D curves.

	:param splitCurve3dTool:
	:type splitCurve3dTool: Handle_ShapeUpgrade_SplitCurve3d &
	:rtype: None
") SetSplitCurve3dTool;
		void SetSplitCurve3dTool (const Handle_ShapeUpgrade_SplitCurve3d & splitCurve3dTool);
		%feature("compactdefaultargs") GetSplitCurve2dTool;
		%feature("autodoc", "	* Returns the tool for splitting pcurves.

	:rtype: Handle_ShapeUpgrade_SplitCurve2d
") GetSplitCurve2dTool;
		virtual Handle_ShapeUpgrade_SplitCurve2d GetSplitCurve2dTool ();
		%feature("compactdefaultargs") GetSplitCurve3dTool;
		%feature("autodoc", "	* Returns the tool for splitting 3D curves.

	:rtype: Handle_ShapeUpgrade_SplitCurve3d
") GetSplitCurve3dTool;
		virtual Handle_ShapeUpgrade_SplitCurve3d GetSplitCurve3dTool ();
};


%extend ShapeUpgrade_EdgeDivide {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_EdgeDivide(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_EdgeDivide::Handle_ShapeUpgrade_EdgeDivide %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_EdgeDivide;
class Handle_ShapeUpgrade_EdgeDivide : public Handle_ShapeUpgrade_Tool {

    public:
        // constructors
        Handle_ShapeUpgrade_EdgeDivide();
        Handle_ShapeUpgrade_EdgeDivide(const Handle_ShapeUpgrade_EdgeDivide &aHandle);
        Handle_ShapeUpgrade_EdgeDivide(const ShapeUpgrade_EdgeDivide *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_EdgeDivide DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_EdgeDivide {
    ShapeUpgrade_EdgeDivide* _get_reference() {
    return (ShapeUpgrade_EdgeDivide*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_EdgeDivide {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_EdgeDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_FaceDivide;
class ShapeUpgrade_FaceDivide : public ShapeUpgrade_Tool {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivide;
		%feature("autodoc", "	* Creates empty constructor.

	:rtype: None
") ShapeUpgrade_FaceDivide;
		 ShapeUpgrade_FaceDivide ();
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivide;
		%feature("autodoc", "	* Initialize by a Face.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") ShapeUpgrade_FaceDivide;
		 ShapeUpgrade_FaceDivide (const TopoDS_Face & F);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize by a Face.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Init;
		void Init (const TopoDS_Face & F);
		%feature("compactdefaultargs") SetSurfaceSegmentMode;
		%feature("autodoc", "	* Purpose sets mode for trimming (segment) surface by wire UV bounds.

	:param Segment:
	:type Segment: bool
	:rtype: None
") SetSurfaceSegmentMode;
		void SetSurfaceSegmentMode (const Standard_Boolean Segment);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs splitting and computes the resulting shell The context is used to keep track of former splittings in order to keep sharings. It is updated according to modifications made.

	:rtype: bool
") Perform;
		virtual Standard_Boolean Perform ();
		%feature("compactdefaultargs") SplitSurface;
		%feature("autodoc", "	* Performs splitting of surface and computes the shell from source face.

	:rtype: bool
") SplitSurface;
		virtual Standard_Boolean SplitSurface ();
		%feature("compactdefaultargs") SplitCurves;
		%feature("autodoc", "	* Performs splitting of curves of all the edges in the shape and divides these edges.

	:rtype: bool
") SplitCurves;
		virtual Standard_Boolean SplitCurves ();
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* Gives the resulting Shell, or Face, or Null shape if not done.

	:rtype: TopoDS_Shape
") Result;
		TopoDS_Shape Result ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Queries the status of last call to Perform OK : no splitting was done (or no call to Perform) DONE1: some edges were splitted DONE2: surface was splitted DONE3: surface was modified without splitting FAIL1: some fails encountered during splitting wires FAIL2: face cannot be splitted

	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("compactdefaultargs") SetSplitSurfaceTool;
		%feature("autodoc", "	* Sets the tool for splitting surfaces.

	:param splitSurfaceTool:
	:type splitSurfaceTool: Handle_ShapeUpgrade_SplitSurface &
	:rtype: None
") SetSplitSurfaceTool;
		void SetSplitSurfaceTool (const Handle_ShapeUpgrade_SplitSurface & splitSurfaceTool);
		%feature("compactdefaultargs") SetWireDivideTool;
		%feature("autodoc", "	* Sets the tool for dividing edges on Face.

	:param wireDivideTool:
	:type wireDivideTool: Handle_ShapeUpgrade_WireDivide &
	:rtype: None
") SetWireDivideTool;
		void SetWireDivideTool (const Handle_ShapeUpgrade_WireDivide & wireDivideTool);
		%feature("compactdefaultargs") GetSplitSurfaceTool;
		%feature("autodoc", "	* Returns the tool for splitting surfaces. This tool must be already initialized.

	:rtype: Handle_ShapeUpgrade_SplitSurface
") GetSplitSurfaceTool;
		virtual Handle_ShapeUpgrade_SplitSurface GetSplitSurfaceTool ();
		%feature("compactdefaultargs") GetWireDivideTool;
		%feature("autodoc", "	* Returns the tool for dividing edges on Face. This tool must be already initialized.

	:rtype: Handle_ShapeUpgrade_WireDivide
") GetWireDivideTool;
		virtual Handle_ShapeUpgrade_WireDivide GetWireDivideTool ();
};


%extend ShapeUpgrade_FaceDivide {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_FaceDivide(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_FaceDivide::Handle_ShapeUpgrade_FaceDivide %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_FaceDivide;
class Handle_ShapeUpgrade_FaceDivide : public Handle_ShapeUpgrade_Tool {

    public:
        // constructors
        Handle_ShapeUpgrade_FaceDivide();
        Handle_ShapeUpgrade_FaceDivide(const Handle_ShapeUpgrade_FaceDivide &aHandle);
        Handle_ShapeUpgrade_FaceDivide(const ShapeUpgrade_FaceDivide *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_FaceDivide DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_FaceDivide {
    ShapeUpgrade_FaceDivide* _get_reference() {
    return (ShapeUpgrade_FaceDivide*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_FaceDivide {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_FaceDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_FixSmallCurves;
class ShapeUpgrade_FixSmallCurves : public ShapeUpgrade_Tool {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_FixSmallCurves;
		%feature("autodoc", "	:rtype: None
") ShapeUpgrade_FixSmallCurves;
		 ShapeUpgrade_FixSmallCurves ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theFace:
	:type theFace: TopoDS_Face &
	:rtype: None
") Init;
		void Init (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace);
		%feature("compactdefaultargs") Approx;
		%feature("autodoc", "	:param Curve3d:
	:type Curve3d: Handle_Geom_Curve &
	:param Curve2d:
	:type Curve2d: Handle_Geom2d_Curve &
	:param Curve2dR:
	:type Curve2dR: Handle_Geom2d_Curve &
	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: bool
") Approx;
		virtual Standard_Boolean Approx (Handle_Geom_Curve & Curve3d,Handle_Geom2d_Curve & Curve2d,Handle_Geom2d_Curve & Curve2dR,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetSplitCurve3dTool;
		%feature("autodoc", "	* Sets the tool for splitting 3D curves.

	:param splitCurve3dTool:
	:type splitCurve3dTool: Handle_ShapeUpgrade_SplitCurve3d &
	:rtype: None
") SetSplitCurve3dTool;
		void SetSplitCurve3dTool (const Handle_ShapeUpgrade_SplitCurve3d & splitCurve3dTool);
		%feature("compactdefaultargs") SetSplitCurve2dTool;
		%feature("autodoc", "	* Sets the tool for splitting pcurves.

	:param splitCurve2dTool:
	:type splitCurve2dTool: Handle_ShapeUpgrade_SplitCurve2d &
	:rtype: None
") SetSplitCurve2dTool;
		void SetSplitCurve2dTool (const Handle_ShapeUpgrade_SplitCurve2d & splitCurve2dTool);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Queries the status of last call to Perform OK : DONE1: DONE2: FAIL1:

	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
};


%extend ShapeUpgrade_FixSmallCurves {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_FixSmallCurves(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_FixSmallCurves::Handle_ShapeUpgrade_FixSmallCurves %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_FixSmallCurves;
class Handle_ShapeUpgrade_FixSmallCurves : public Handle_ShapeUpgrade_Tool {

    public:
        // constructors
        Handle_ShapeUpgrade_FixSmallCurves();
        Handle_ShapeUpgrade_FixSmallCurves(const Handle_ShapeUpgrade_FixSmallCurves &aHandle);
        Handle_ShapeUpgrade_FixSmallCurves(const ShapeUpgrade_FixSmallCurves *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_FixSmallCurves DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_FixSmallCurves {
    ShapeUpgrade_FixSmallCurves* _get_reference() {
    return (ShapeUpgrade_FixSmallCurves*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_FixSmallCurves {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_FixSmallCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_RemoveInternalWires;
class ShapeUpgrade_RemoveInternalWires : public ShapeUpgrade_Tool {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_RemoveInternalWires;
		%feature("autodoc", "	* Creates empty constructor.

	:rtype: None
") ShapeUpgrade_RemoveInternalWires;
		 ShapeUpgrade_RemoveInternalWires ();
		%feature("compactdefaultargs") ShapeUpgrade_RemoveInternalWires;
		%feature("autodoc", "	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") ShapeUpgrade_RemoveInternalWires;
		 ShapeUpgrade_RemoveInternalWires (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize by a Shape.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Removes all internal wires having area less than area specified as minimal allowed area

	:rtype: bool
") Perform;
		Standard_Boolean Perform ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* If specified sequence of shape contains - 1.wires then these wires will be removed if they have area less than allowed min area. 2.faces than internal wires from these faces will be removed if they have area less than allowed min area.

	:param theSeqShapes:
	:type theSeqShapes: TopTools_SequenceOfShape &
	:rtype: bool
") Perform;
		Standard_Boolean Perform (const TopTools_SequenceOfShape & theSeqShapes);
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "	* Get result shape

	:rtype: TopoDS_Shape
") GetResult;
		TopoDS_Shape GetResult ();

            %feature("autodoc","1");
            %extend {
                Standard_Real GetMinArea() {
                return (Standard_Real) $self->MinArea();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetMinArea(Standard_Real value ) {
                $self->MinArea()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetRemoveFaceMode() {
                return (Standard_Boolean) $self->RemoveFaceMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetRemoveFaceMode(Standard_Boolean value ) {
                $self->RemoveFaceMode()=value;
                }
            };
            		%feature("compactdefaultargs") RemovedFaces;
		%feature("autodoc", "	* Returns sequence of removed faces.

	:rtype: TopTools_SequenceOfShape
") RemovedFaces;
		const TopTools_SequenceOfShape & RemovedFaces ();
		%feature("compactdefaultargs") RemovedWires;
		%feature("autodoc", "	* Returns sequence of removed faces.

	:rtype: TopTools_SequenceOfShape
") RemovedWires;
		const TopTools_SequenceOfShape & RemovedWires ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Queries status of last call to Perform() : OK - nothing was done :DONE1 - internal wires were removed :DONE2 - small faces were removed. :FAIL1 - initial shape is not specified :FAIL2 - specified sub-shape is not belonged to inotial shape.

	:param theStatus:
	:type theStatus: ShapeExtend_Status
	:rtype: bool
") Status;
		Standard_Boolean Status (const ShapeExtend_Status theStatus);
};


%extend ShapeUpgrade_RemoveInternalWires {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_RemoveInternalWires(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_RemoveInternalWires::Handle_ShapeUpgrade_RemoveInternalWires %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_RemoveInternalWires;
class Handle_ShapeUpgrade_RemoveInternalWires : public Handle_ShapeUpgrade_Tool {

    public:
        // constructors
        Handle_ShapeUpgrade_RemoveInternalWires();
        Handle_ShapeUpgrade_RemoveInternalWires(const Handle_ShapeUpgrade_RemoveInternalWires &aHandle);
        Handle_ShapeUpgrade_RemoveInternalWires(const ShapeUpgrade_RemoveInternalWires *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_RemoveInternalWires DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_RemoveInternalWires {
    ShapeUpgrade_RemoveInternalWires* _get_reference() {
    return (ShapeUpgrade_RemoveInternalWires*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_RemoveInternalWires {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_RemoveInternalWires {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_ShapeConvertToBezier;
class ShapeUpgrade_ShapeConvertToBezier : public ShapeUpgrade_ShapeDivide {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_ShapeConvertToBezier;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ShapeUpgrade_ShapeConvertToBezier;
		 ShapeUpgrade_ShapeConvertToBezier ();
		%feature("compactdefaultargs") ShapeUpgrade_ShapeConvertToBezier;
		%feature("autodoc", "	* Initialize by a Shape.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") ShapeUpgrade_ShapeConvertToBezier;
		 ShapeUpgrade_ShapeConvertToBezier (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Set2dConversion;
		%feature("autodoc", "	* Sets mode for conversion 2D curves to bezier.

	:param mode:
	:type mode: bool
	:rtype: None
") Set2dConversion;
		void Set2dConversion (const Standard_Boolean mode);
		%feature("compactdefaultargs") Get2dConversion;
		%feature("autodoc", "	* Returns the 2D conversion mode.

	:rtype: bool
") Get2dConversion;
		Standard_Boolean Get2dConversion ();
		%feature("compactdefaultargs") Set3dConversion;
		%feature("autodoc", "	* Sets mode for conversion 3d curves to bezier.

	:param mode:
	:type mode: bool
	:rtype: None
") Set3dConversion;
		void Set3dConversion (const Standard_Boolean mode);
		%feature("compactdefaultargs") Get3dConversion;
		%feature("autodoc", "	* Returns the 3D conversion mode.

	:rtype: bool
") Get3dConversion;
		Standard_Boolean Get3dConversion ();
		%feature("compactdefaultargs") SetSurfaceConversion;
		%feature("autodoc", "	* Sets mode for conversion surfaces curves to bezier basis.

	:param mode:
	:type mode: bool
	:rtype: None
") SetSurfaceConversion;
		void SetSurfaceConversion (const Standard_Boolean mode);
		%feature("compactdefaultargs") GetSurfaceConversion;
		%feature("autodoc", "	* Returns the surface conversion mode.

	:rtype: bool
") GetSurfaceConversion;
		Standard_Boolean GetSurfaceConversion ();
		%feature("compactdefaultargs") Set3dLineConversion;
		%feature("autodoc", "	* Sets mode for conversion Geom_Line to bezier.

	:param mode:
	:type mode: bool
	:rtype: None
") Set3dLineConversion;
		void Set3dLineConversion (const Standard_Boolean mode);
		%feature("compactdefaultargs") Get3dLineConversion;
		%feature("autodoc", "	* Returns the Geom_Line conversion mode.

	:rtype: bool
") Get3dLineConversion;
		Standard_Boolean Get3dLineConversion ();
		%feature("compactdefaultargs") Set3dCircleConversion;
		%feature("autodoc", "	* Sets mode for conversion Geom_Circle to bezier.

	:param mode:
	:type mode: bool
	:rtype: None
") Set3dCircleConversion;
		void Set3dCircleConversion (const Standard_Boolean mode);
		%feature("compactdefaultargs") Get3dCircleConversion;
		%feature("autodoc", "	* Returns the Geom_Circle conversion mode.

	:rtype: bool
") Get3dCircleConversion;
		Standard_Boolean Get3dCircleConversion ();
		%feature("compactdefaultargs") Set3dConicConversion;
		%feature("autodoc", "	* Sets mode for conversion Geom_Conic to bezier.

	:param mode:
	:type mode: bool
	:rtype: None
") Set3dConicConversion;
		void Set3dConicConversion (const Standard_Boolean mode);
		%feature("compactdefaultargs") Get3dConicConversion;
		%feature("autodoc", "	* Returns the Geom_Conic conversion mode.

	:rtype: bool
") Get3dConicConversion;
		Standard_Boolean Get3dConicConversion ();
		%feature("compactdefaultargs") SetPlaneMode;
		%feature("autodoc", "	* Sets mode for conversion Geom_Plane to Bezier

	:param mode:
	:type mode: bool
	:rtype: None
") SetPlaneMode;
		void SetPlaneMode (const Standard_Boolean mode);
		%feature("compactdefaultargs") GetPlaneMode;
		%feature("autodoc", "	* Returns the Geom_Pline conversion mode.

	:rtype: bool
") GetPlaneMode;
		Standard_Boolean GetPlaneMode ();
		%feature("compactdefaultargs") SetRevolutionMode;
		%feature("autodoc", "	* Sets mode for conversion Geom_SurfaceOfRevolution to Bezier

	:param mode:
	:type mode: bool
	:rtype: None
") SetRevolutionMode;
		void SetRevolutionMode (const Standard_Boolean mode);
		%feature("compactdefaultargs") GetRevolutionMode;
		%feature("autodoc", "	* Returns the Geom_SurfaceOfRevolution conversion mode.

	:rtype: bool
") GetRevolutionMode;
		Standard_Boolean GetRevolutionMode ();
		%feature("compactdefaultargs") SetExtrusionMode;
		%feature("autodoc", "	* Sets mode for conversion Geom_SurfaceOfLinearExtrusion to Bezier

	:param mode:
	:type mode: bool
	:rtype: None
") SetExtrusionMode;
		void SetExtrusionMode (const Standard_Boolean mode);
		%feature("compactdefaultargs") GetExtrusionMode;
		%feature("autodoc", "	* Returns the Geom_SurfaceOfLinearExtrusion conversion mode.

	:rtype: bool
") GetExtrusionMode;
		Standard_Boolean GetExtrusionMode ();
		%feature("compactdefaultargs") SetBSplineMode;
		%feature("autodoc", "	* Sets mode for conversion Geom_BSplineSurface to Bezier

	:param mode:
	:type mode: bool
	:rtype: None
") SetBSplineMode;
		void SetBSplineMode (const Standard_Boolean mode);
		%feature("compactdefaultargs") GetBSplineMode;
		%feature("autodoc", "	* Returns the Geom_BSplineSurface conversion mode.

	:rtype: bool
") GetBSplineMode;
		Standard_Boolean GetBSplineMode ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs converting and computes the resulting shape

	:param newContext: default value is Standard_True
	:type newContext: bool
	:rtype: bool
") Perform;
		virtual Standard_Boolean Perform (const Standard_Boolean newContext = Standard_True);
};


%extend ShapeUpgrade_ShapeConvertToBezier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_ShapeDivideAngle;
class ShapeUpgrade_ShapeDivideAngle : public ShapeUpgrade_ShapeDivide {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideAngle;
		%feature("autodoc", "	* Empty constructor.

	:param MaxAngle:
	:type MaxAngle: float
	:rtype: None
") ShapeUpgrade_ShapeDivideAngle;
		 ShapeUpgrade_ShapeDivideAngle (const Standard_Real MaxAngle);
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideAngle;
		%feature("autodoc", "	* Initialize by a Shape.

	:param MaxAngle:
	:type MaxAngle: float
	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") ShapeUpgrade_ShapeDivideAngle;
		 ShapeUpgrade_ShapeDivideAngle (const Standard_Real MaxAngle,const TopoDS_Shape & S);
		%feature("compactdefaultargs") InitTool;
		%feature("autodoc", "	* Resets tool for splitting face with given angle

	:param MaxAngle:
	:type MaxAngle: float
	:rtype: None
") InitTool;
		void InitTool (const Standard_Real MaxAngle);
		%feature("compactdefaultargs") SetMaxAngle;
		%feature("autodoc", "	* Set maximal angle (calls InitTool)

	:param MaxAngle:
	:type MaxAngle: float
	:rtype: None
") SetMaxAngle;
		void SetMaxAngle (const Standard_Real MaxAngle);
		%feature("compactdefaultargs") MaxAngle;
		%feature("autodoc", "	* Returns maximal angle

	:rtype: float
") MaxAngle;
		Standard_Real MaxAngle ();
};


%extend ShapeUpgrade_ShapeDivideAngle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_ShapeDivideArea;
class ShapeUpgrade_ShapeDivideArea : public ShapeUpgrade_ShapeDivide {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideArea;
		%feature("autodoc", "	:rtype: None
") ShapeUpgrade_ShapeDivideArea;
		 ShapeUpgrade_ShapeDivideArea ();
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideArea;
		%feature("autodoc", "	* Initialize by a Shape.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") ShapeUpgrade_ShapeDivideArea;
		 ShapeUpgrade_ShapeDivideArea (const TopoDS_Shape & S);

            %feature("autodoc","1");
            %extend {
                Standard_Real GetMaxArea() {
                return (Standard_Real) $self->MaxArea();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetMaxArea(Standard_Real value ) {
                $self->MaxArea()=value;
                }
            };
            };


%extend ShapeUpgrade_ShapeDivideArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_ShapeDivideClosed;
class ShapeUpgrade_ShapeDivideClosed : public ShapeUpgrade_ShapeDivide {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideClosed;
		%feature("autodoc", "	* Initialises tool with shape and default parameter.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") ShapeUpgrade_ShapeDivideClosed;
		 ShapeUpgrade_ShapeDivideClosed (const TopoDS_Shape & S);
		%feature("compactdefaultargs") SetNbSplitPoints;
		%feature("autodoc", "	* Sets the number of cuts applied to divide closed faces. The number of resulting faces will be num+1.

	:param num:
	:type num: int
	:rtype: None
") SetNbSplitPoints;
		void SetNbSplitPoints (const Standard_Integer num);
};


%extend ShapeUpgrade_ShapeDivideClosed {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_ShapeDivideClosedEdges;
class ShapeUpgrade_ShapeDivideClosedEdges : public ShapeUpgrade_ShapeDivide {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideClosedEdges;
		%feature("autodoc", "	* Initialises tool with shape and default parameter.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") ShapeUpgrade_ShapeDivideClosedEdges;
		 ShapeUpgrade_ShapeDivideClosedEdges (const TopoDS_Shape & S);
		%feature("compactdefaultargs") SetNbSplitPoints;
		%feature("autodoc", "	* Sets the number of cuts applied to divide closed edges. The number of resulting faces will be num+1.

	:param num:
	:type num: int
	:rtype: None
") SetNbSplitPoints;
		void SetNbSplitPoints (const Standard_Integer num);
};


%extend ShapeUpgrade_ShapeDivideClosedEdges {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_ShapeDivideContinuity;
class ShapeUpgrade_ShapeDivideContinuity : public ShapeUpgrade_ShapeDivide {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideContinuity;
		%feature("autodoc", "	:rtype: None
") ShapeUpgrade_ShapeDivideContinuity;
		 ShapeUpgrade_ShapeDivideContinuity ();
		%feature("compactdefaultargs") ShapeUpgrade_ShapeDivideContinuity;
		%feature("autodoc", "	* Initialize by a Shape.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") ShapeUpgrade_ShapeDivideContinuity;
		 ShapeUpgrade_ShapeDivideContinuity (const TopoDS_Shape & S);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets tolerance.

	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("compactdefaultargs") SetTolerance2d;
		%feature("autodoc", "	* Sets tolerance.

	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance2d;
		void SetTolerance2d (const Standard_Real Tol);
		%feature("compactdefaultargs") SetBoundaryCriterion;
		%feature("autodoc", "	* Defines a criterion of continuity for the boundary (all the Wires) //! The possible values are C0, G1, C1, G2, C2, C3, CN The default is C1 to respect the Cas.Cade Shape Validity. G1 and G2 are not authorized.

	:param Criterion: default value is GeomAbs_C1
	:type Criterion: GeomAbs_Shape
	:rtype: None
") SetBoundaryCriterion;
		void SetBoundaryCriterion (const GeomAbs_Shape Criterion = GeomAbs_C1);
		%feature("compactdefaultargs") SetPCurveCriterion;
		%feature("autodoc", "	* Defines a criterion of continuity for the boundary (all the pcurves of Wires) //! The possible values are C0, G1, C1, G2, C2, C3, CN The default is C1 to respect the Cas.Cade Shape Validity. G1 and G2 are not authorized.

	:param Criterion: default value is GeomAbs_C1
	:type Criterion: GeomAbs_Shape
	:rtype: None
") SetPCurveCriterion;
		void SetPCurveCriterion (const GeomAbs_Shape Criterion = GeomAbs_C1);
		%feature("compactdefaultargs") SetSurfaceCriterion;
		%feature("autodoc", "	* Defines a criterion of continuity for the boundary (all the Wires) //! The possible values are C0, G1, C1, G2, C2, C3, CN The default is C1 to respect the Cas.Cade Shape Validity. G1 and G2 are not authorized.

	:param Criterion: default value is GeomAbs_C1
	:type Criterion: GeomAbs_Shape
	:rtype: None
") SetSurfaceCriterion;
		void SetSurfaceCriterion (const GeomAbs_Shape Criterion = GeomAbs_C1);
};


%extend ShapeUpgrade_ShapeDivideContinuity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_SplitCurve2d;
class ShapeUpgrade_SplitCurve2d : public ShapeUpgrade_SplitCurve {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve2d;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ShapeUpgrade_SplitCurve2d;
		 ShapeUpgrade_SplitCurve2d ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes with pcurve with its first and last parameters.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes with pcurve with its parameters.

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* If Segment is True, the result is composed with segments of the curve bounded by the SplitValues. If Segment is False, the result is composed with trimmed Curves all based on the same complete curve.

	:param Segment:
	:type Segment: bool
	:rtype: void
") Build;
		virtual void Build (const Standard_Boolean Segment);
		%feature("compactdefaultargs") GetCurves;
		%feature("autodoc", "	:rtype: Handle_TColGeom2d_HArray1OfCurve
") GetCurves;
		Handle_TColGeom2d_HArray1OfCurve GetCurves ();
};


%extend ShapeUpgrade_SplitCurve2d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_SplitCurve2d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_SplitCurve2d::Handle_ShapeUpgrade_SplitCurve2d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_SplitCurve2d;
class Handle_ShapeUpgrade_SplitCurve2d : public Handle_ShapeUpgrade_SplitCurve {

    public:
        // constructors
        Handle_ShapeUpgrade_SplitCurve2d();
        Handle_ShapeUpgrade_SplitCurve2d(const Handle_ShapeUpgrade_SplitCurve2d &aHandle);
        Handle_ShapeUpgrade_SplitCurve2d(const ShapeUpgrade_SplitCurve2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_SplitCurve2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_SplitCurve2d {
    ShapeUpgrade_SplitCurve2d* _get_reference() {
    return (ShapeUpgrade_SplitCurve2d*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_SplitCurve2d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_SplitCurve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_SplitCurve3d;
class ShapeUpgrade_SplitCurve3d : public ShapeUpgrade_SplitCurve {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve3d;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ShapeUpgrade_SplitCurve3d;
		 ShapeUpgrade_SplitCurve3d ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes with curve with its first and last parameters.

	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes with curve with its parameters.

	:param C:
	:type C: Handle_Geom_Curve &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C,const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* If Segment is True, the result is composed with segments of the curve bounded by the SplitValues. If Segment is False, the result is composed with trimmed Curves all based on the same complete curve.

	:param Segment:
	:type Segment: bool
	:rtype: void
") Build;
		virtual void Build (const Standard_Boolean Segment);
		%feature("compactdefaultargs") GetCurves;
		%feature("autodoc", "	:rtype: Handle_TColGeom_HArray1OfCurve
") GetCurves;
		Handle_TColGeom_HArray1OfCurve GetCurves ();
};


%extend ShapeUpgrade_SplitCurve3d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_SplitCurve3d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_SplitCurve3d::Handle_ShapeUpgrade_SplitCurve3d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_SplitCurve3d;
class Handle_ShapeUpgrade_SplitCurve3d : public Handle_ShapeUpgrade_SplitCurve {

    public:
        // constructors
        Handle_ShapeUpgrade_SplitCurve3d();
        Handle_ShapeUpgrade_SplitCurve3d(const Handle_ShapeUpgrade_SplitCurve3d &aHandle);
        Handle_ShapeUpgrade_SplitCurve3d(const ShapeUpgrade_SplitCurve3d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_SplitCurve3d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_SplitCurve3d {
    ShapeUpgrade_SplitCurve3d* _get_reference() {
    return (ShapeUpgrade_SplitCurve3d*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_SplitCurve3d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_SplitCurve3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_SplitSurfaceAngle;
class ShapeUpgrade_SplitSurfaceAngle : public ShapeUpgrade_SplitSurface {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurfaceAngle;
		%feature("autodoc", "	* Empty constructor.

	:param MaxAngle:
	:type MaxAngle: float
	:rtype: None
") ShapeUpgrade_SplitSurfaceAngle;
		 ShapeUpgrade_SplitSurfaceAngle (const Standard_Real MaxAngle);
		%feature("compactdefaultargs") SetMaxAngle;
		%feature("autodoc", "	* Set maximal angle

	:param MaxAngle:
	:type MaxAngle: float
	:rtype: None
") SetMaxAngle;
		void SetMaxAngle (const Standard_Real MaxAngle);
		%feature("compactdefaultargs") MaxAngle;
		%feature("autodoc", "	* Returns maximal angle

	:rtype: float
") MaxAngle;
		Standard_Real MaxAngle ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Performs splitting of the supporting surface(s). First defines splitting values, then calls inherited method.

	:param Segment:
	:type Segment: bool
	:rtype: void
") Compute;
		virtual void Compute (const Standard_Boolean Segment);
};


%extend ShapeUpgrade_SplitSurfaceAngle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_SplitSurfaceAngle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_SplitSurfaceAngle::Handle_ShapeUpgrade_SplitSurfaceAngle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_SplitSurfaceAngle;
class Handle_ShapeUpgrade_SplitSurfaceAngle : public Handle_ShapeUpgrade_SplitSurface {

    public:
        // constructors
        Handle_ShapeUpgrade_SplitSurfaceAngle();
        Handle_ShapeUpgrade_SplitSurfaceAngle(const Handle_ShapeUpgrade_SplitSurfaceAngle &aHandle);
        Handle_ShapeUpgrade_SplitSurfaceAngle(const ShapeUpgrade_SplitSurfaceAngle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_SplitSurfaceAngle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_SplitSurfaceAngle {
    ShapeUpgrade_SplitSurfaceAngle* _get_reference() {
    return (ShapeUpgrade_SplitSurfaceAngle*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_SplitSurfaceAngle {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_SplitSurfaceAngle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_SplitSurfaceArea;
class ShapeUpgrade_SplitSurfaceArea : public ShapeUpgrade_SplitSurface {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurfaceArea;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ShapeUpgrade_SplitSurfaceArea;
		 ShapeUpgrade_SplitSurfaceArea ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetNbParts() {
                return (Standard_Integer) $self->NbParts();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetNbParts(Standard_Integer value ) {
                $self->NbParts()=value;
                }
            };
            		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param Segment: default value is Standard_True
	:type Segment: bool
	:rtype: void
") Compute;
		virtual void Compute (const Standard_Boolean Segment = Standard_True);
};


%extend ShapeUpgrade_SplitSurfaceArea {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_SplitSurfaceArea(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_SplitSurfaceArea::Handle_ShapeUpgrade_SplitSurfaceArea %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_SplitSurfaceArea;
class Handle_ShapeUpgrade_SplitSurfaceArea : public Handle_ShapeUpgrade_SplitSurface {

    public:
        // constructors
        Handle_ShapeUpgrade_SplitSurfaceArea();
        Handle_ShapeUpgrade_SplitSurfaceArea(const Handle_ShapeUpgrade_SplitSurfaceArea &aHandle);
        Handle_ShapeUpgrade_SplitSurfaceArea(const ShapeUpgrade_SplitSurfaceArea *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_SplitSurfaceArea DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_SplitSurfaceArea {
    ShapeUpgrade_SplitSurfaceArea* _get_reference() {
    return (ShapeUpgrade_SplitSurfaceArea*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_SplitSurfaceArea {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_SplitSurfaceArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_SplitSurfaceContinuity;
class ShapeUpgrade_SplitSurfaceContinuity : public ShapeUpgrade_SplitSurface {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_SplitSurfaceContinuity;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ShapeUpgrade_SplitSurfaceContinuity;
		 ShapeUpgrade_SplitSurfaceContinuity ();
		%feature("compactdefaultargs") SetCriterion;
		%feature("autodoc", "	* Sets criterion for splitting.

	:param Criterion:
	:type Criterion: GeomAbs_Shape
	:rtype: None
") SetCriterion;
		void SetCriterion (const GeomAbs_Shape Criterion);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets tolerance.

	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param Segment:
	:type Segment: bool
	:rtype: void
") Compute;
		virtual void Compute (const Standard_Boolean Segment);
};


%extend ShapeUpgrade_SplitSurfaceContinuity {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_SplitSurfaceContinuity(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_SplitSurfaceContinuity::Handle_ShapeUpgrade_SplitSurfaceContinuity %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_SplitSurfaceContinuity;
class Handle_ShapeUpgrade_SplitSurfaceContinuity : public Handle_ShapeUpgrade_SplitSurface {

    public:
        // constructors
        Handle_ShapeUpgrade_SplitSurfaceContinuity();
        Handle_ShapeUpgrade_SplitSurfaceContinuity(const Handle_ShapeUpgrade_SplitSurfaceContinuity &aHandle);
        Handle_ShapeUpgrade_SplitSurfaceContinuity(const ShapeUpgrade_SplitSurfaceContinuity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_SplitSurfaceContinuity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_SplitSurfaceContinuity {
    ShapeUpgrade_SplitSurfaceContinuity* _get_reference() {
    return (ShapeUpgrade_SplitSurfaceContinuity*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_SplitSurfaceContinuity {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_SplitSurfaceContinuity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_WireDivide;
class ShapeUpgrade_WireDivide : public ShapeUpgrade_Tool {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_WireDivide;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") ShapeUpgrade_WireDivide;
		 ShapeUpgrade_WireDivide ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes by wire and face

	:param W:
	:type W: TopoDS_Wire &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Init;
		void Init (const TopoDS_Wire & W,const TopoDS_Face & F);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes by wire and surface

	:param W:
	:type W: TopoDS_Wire &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const TopoDS_Wire & W,const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Loads working wire

	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") Load;
		void Load (const TopoDS_Wire & W);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Creates wire of one edge and calls Load for wire

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") Load;
		void Load (const TopoDS_Edge & E);
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "	* Sets supporting surface by face

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") SetFace;
		void SetFace (const TopoDS_Face & F);
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "	* Sets supporting surface

	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") SetSurface;
		void SetSurface (const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "	* Sets supporting surface with location

	:param S:
	:type S: Handle_Geom_Surface &
	:param L:
	:type L: TopLoc_Location &
	:rtype: None
") SetSurface;
		void SetSurface (const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the resulting wire by splitting all the edges according to splitting criteria. All the modifications made are recorded in context (ShapeBuild_ReShape). This tool is applied to all edges before splitting them in order to keep sharings. If no supporting face or surface is defined, only 3d splitting criteria are used.

	:rtype: void
") Perform;
		virtual void Perform ();
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "	* Gives the resulting Wire (equal to initial one if not done or Null if not loaded)

	:rtype: TopoDS_Wire
") Wire;
		const TopoDS_Wire  Wire ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Queries status of last call to Perform() OK - no edges were splitted, wire left untouched DONE1 - some edges were splitted FAIL1 - some edges have no 3d curve (skipped) FAIL2 - some edges have no pcurve (skipped)

	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("compactdefaultargs") SetSplitCurve3dTool;
		%feature("autodoc", "	* Sets the tool for splitting 3D curves.

	:param splitCurve3dTool:
	:type splitCurve3dTool: Handle_ShapeUpgrade_SplitCurve3d &
	:rtype: None
") SetSplitCurve3dTool;
		void SetSplitCurve3dTool (const Handle_ShapeUpgrade_SplitCurve3d & splitCurve3dTool);
		%feature("compactdefaultargs") SetSplitCurve2dTool;
		%feature("autodoc", "	* Sets the tool for splitting pcurves.

	:param splitCurve2dTool:
	:type splitCurve2dTool: Handle_ShapeUpgrade_SplitCurve2d &
	:rtype: None
") SetSplitCurve2dTool;
		void SetSplitCurve2dTool (const Handle_ShapeUpgrade_SplitCurve2d & splitCurve2dTool);
		%feature("compactdefaultargs") SetTransferParamTool;
		%feature("autodoc", "	* Sets the tool for Transfer parameters between curves and pcurves.

	:param TransferParam:
	:type TransferParam: Handle_ShapeAnalysis_TransferParameters &
	:rtype: None
") SetTransferParamTool;
		void SetTransferParamTool (const Handle_ShapeAnalysis_TransferParameters & TransferParam);
		%feature("compactdefaultargs") SetEdgeDivideTool;
		%feature("autodoc", "	* Sets tool for splitting edge

	:param edgeDivideTool:
	:type edgeDivideTool: Handle_ShapeUpgrade_EdgeDivide &
	:rtype: None
") SetEdgeDivideTool;
		void SetEdgeDivideTool (const Handle_ShapeUpgrade_EdgeDivide & edgeDivideTool);
		%feature("compactdefaultargs") GetEdgeDivideTool;
		%feature("autodoc", "	* returns tool for splitting edges

	:rtype: Handle_ShapeUpgrade_EdgeDivide
") GetEdgeDivideTool;
		virtual Handle_ShapeUpgrade_EdgeDivide GetEdgeDivideTool ();
		%feature("compactdefaultargs") GetTransferParamTool;
		%feature("autodoc", "	* Returns the tool for Transfer of parameters.

	:rtype: Handle_ShapeAnalysis_TransferParameters
") GetTransferParamTool;
		virtual Handle_ShapeAnalysis_TransferParameters GetTransferParamTool ();
		%feature("compactdefaultargs") SetEdgeMode;
		%feature("autodoc", "	* Sets mode for splitting 3d curves from edges. 0 - only curve 3d from free edges. 1 - only curve 3d from shared edges. 2 - all curve 3d.

	:param EdgeMode:
	:type EdgeMode: int
	:rtype: None
") SetEdgeMode;
		void SetEdgeMode (const Standard_Integer EdgeMode);
		%feature("compactdefaultargs") SetFixSmallCurveTool;
		%feature("autodoc", "	* Sets tool for fixing small curves with specified min tolerance;

	:param FixSmallCurvesTool:
	:type FixSmallCurvesTool: Handle_ShapeUpgrade_FixSmallCurves &
	:rtype: None
") SetFixSmallCurveTool;
		void SetFixSmallCurveTool (const Handle_ShapeUpgrade_FixSmallCurves & FixSmallCurvesTool);
		%feature("compactdefaultargs") GetFixSmallCurveTool;
		%feature("autodoc", "	* Returns tool for fixing small curves

	:rtype: Handle_ShapeUpgrade_FixSmallCurves
") GetFixSmallCurveTool;
		Handle_ShapeUpgrade_FixSmallCurves GetFixSmallCurveTool ();
};


%extend ShapeUpgrade_WireDivide {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_WireDivide(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_WireDivide::Handle_ShapeUpgrade_WireDivide %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_WireDivide;
class Handle_ShapeUpgrade_WireDivide : public Handle_ShapeUpgrade_Tool {

    public:
        // constructors
        Handle_ShapeUpgrade_WireDivide();
        Handle_ShapeUpgrade_WireDivide(const Handle_ShapeUpgrade_WireDivide &aHandle);
        Handle_ShapeUpgrade_WireDivide(const ShapeUpgrade_WireDivide *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_WireDivide DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_WireDivide {
    ShapeUpgrade_WireDivide* _get_reference() {
    return (ShapeUpgrade_WireDivide*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_WireDivide {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_WireDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_ClosedEdgeDivide;
class ShapeUpgrade_ClosedEdgeDivide : public ShapeUpgrade_EdgeDivide {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_ClosedEdgeDivide;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ShapeUpgrade_ClosedEdgeDivide;
		 ShapeUpgrade_ClosedEdgeDivide ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param anEdge:
	:type anEdge: TopoDS_Edge &
	:rtype: bool
") Compute;
		virtual Standard_Boolean Compute (const TopoDS_Edge & anEdge);
};


%extend ShapeUpgrade_ClosedEdgeDivide {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_ClosedEdgeDivide(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_ClosedEdgeDivide::Handle_ShapeUpgrade_ClosedEdgeDivide %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_ClosedEdgeDivide;
class Handle_ShapeUpgrade_ClosedEdgeDivide : public Handle_ShapeUpgrade_EdgeDivide {

    public:
        // constructors
        Handle_ShapeUpgrade_ClosedEdgeDivide();
        Handle_ShapeUpgrade_ClosedEdgeDivide(const Handle_ShapeUpgrade_ClosedEdgeDivide &aHandle);
        Handle_ShapeUpgrade_ClosedEdgeDivide(const ShapeUpgrade_ClosedEdgeDivide *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_ClosedEdgeDivide DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_ClosedEdgeDivide {
    ShapeUpgrade_ClosedEdgeDivide* _get_reference() {
    return (ShapeUpgrade_ClosedEdgeDivide*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_ClosedEdgeDivide {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_ClosedEdgeDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_ClosedFaceDivide;
class ShapeUpgrade_ClosedFaceDivide : public ShapeUpgrade_FaceDivide {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_ClosedFaceDivide;
		%feature("autodoc", "	* Creates empty constructor.

	:rtype: None
") ShapeUpgrade_ClosedFaceDivide;
		 ShapeUpgrade_ClosedFaceDivide ();
		%feature("compactdefaultargs") ShapeUpgrade_ClosedFaceDivide;
		%feature("autodoc", "	* Initialize by a Face.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") ShapeUpgrade_ClosedFaceDivide;
		 ShapeUpgrade_ClosedFaceDivide (const TopoDS_Face & F);
		%feature("compactdefaultargs") SplitSurface;
		%feature("autodoc", "	* Performs splitting of surface and computes the shell from source face.

	:rtype: bool
") SplitSurface;
		virtual Standard_Boolean SplitSurface ();
		%feature("compactdefaultargs") SetNbSplitPoints;
		%feature("autodoc", "	* Sets the number of cutting lines by which closed face will be splitted. The resulting faces will be num+1.

	:param num:
	:type num: int
	:rtype: None
") SetNbSplitPoints;
		void SetNbSplitPoints (const Standard_Integer num);
		%feature("compactdefaultargs") GetNbSplitPoints;
		%feature("autodoc", "	* Returns the number of splitting points

	:rtype: int
") GetNbSplitPoints;
		Standard_Integer GetNbSplitPoints ();
};


%extend ShapeUpgrade_ClosedFaceDivide {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_ClosedFaceDivide(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_ClosedFaceDivide::Handle_ShapeUpgrade_ClosedFaceDivide %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_ClosedFaceDivide;
class Handle_ShapeUpgrade_ClosedFaceDivide : public Handle_ShapeUpgrade_FaceDivide {

    public:
        // constructors
        Handle_ShapeUpgrade_ClosedFaceDivide();
        Handle_ShapeUpgrade_ClosedFaceDivide(const Handle_ShapeUpgrade_ClosedFaceDivide &aHandle);
        Handle_ShapeUpgrade_ClosedFaceDivide(const ShapeUpgrade_ClosedFaceDivide *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_ClosedFaceDivide DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_ClosedFaceDivide {
    ShapeUpgrade_ClosedFaceDivide* _get_reference() {
    return (ShapeUpgrade_ClosedFaceDivide*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_ClosedFaceDivide {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_ClosedFaceDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_ConvertCurve2dToBezier;
class ShapeUpgrade_ConvertCurve2dToBezier : public ShapeUpgrade_SplitCurve2d {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_ConvertCurve2dToBezier;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ShapeUpgrade_ConvertCurve2dToBezier;
		 ShapeUpgrade_ConvertCurve2dToBezier ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Converts curve into a list of beziers, and stores the splitting parameters on original curve.

	:rtype: void
") Compute;
		virtual void Compute ();
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Splits a list of beziers computed by Compute method according the split values and splitting parameters.

	:param Segment:
	:type Segment: bool
	:rtype: void
") Build;
		virtual void Build (const Standard_Boolean Segment);
		%feature("compactdefaultargs") SplitParams;
		%feature("autodoc", "	* Returns the list of splitted parameters in original curve parametrisation.

	:rtype: Handle_TColStd_HSequenceOfReal
") SplitParams;
		Handle_TColStd_HSequenceOfReal SplitParams ();
};


%extend ShapeUpgrade_ConvertCurve2dToBezier {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_ConvertCurve2dToBezier(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_ConvertCurve2dToBezier::Handle_ShapeUpgrade_ConvertCurve2dToBezier %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_ConvertCurve2dToBezier;
class Handle_ShapeUpgrade_ConvertCurve2dToBezier : public Handle_ShapeUpgrade_SplitCurve2d {

    public:
        // constructors
        Handle_ShapeUpgrade_ConvertCurve2dToBezier();
        Handle_ShapeUpgrade_ConvertCurve2dToBezier(const Handle_ShapeUpgrade_ConvertCurve2dToBezier &aHandle);
        Handle_ShapeUpgrade_ConvertCurve2dToBezier(const ShapeUpgrade_ConvertCurve2dToBezier *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_ConvertCurve2dToBezier DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_ConvertCurve2dToBezier {
    ShapeUpgrade_ConvertCurve2dToBezier* _get_reference() {
    return (ShapeUpgrade_ConvertCurve2dToBezier*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_ConvertCurve2dToBezier {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_ConvertCurve2dToBezier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_ConvertCurve3dToBezier;
class ShapeUpgrade_ConvertCurve3dToBezier : public ShapeUpgrade_SplitCurve3d {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_ConvertCurve3dToBezier;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") ShapeUpgrade_ConvertCurve3dToBezier;
		 ShapeUpgrade_ConvertCurve3dToBezier ();
		%feature("compactdefaultargs") SetLineMode;
		%feature("autodoc", "	* Sets mode for conversion Geom_Line to bezier.

	:param mode:
	:type mode: bool
	:rtype: None
") SetLineMode;
		void SetLineMode (const Standard_Boolean mode);
		%feature("compactdefaultargs") GetLineMode;
		%feature("autodoc", "	* Returns the Geom_Line conversion mode.

	:rtype: bool
") GetLineMode;
		Standard_Boolean GetLineMode ();
		%feature("compactdefaultargs") SetCircleMode;
		%feature("autodoc", "	* Sets mode for conversion Geom_Circle to bezier.

	:param mode:
	:type mode: bool
	:rtype: None
") SetCircleMode;
		void SetCircleMode (const Standard_Boolean mode);
		%feature("compactdefaultargs") GetCircleMode;
		%feature("autodoc", "	* Returns the Geom_Circle conversion mode.

	:rtype: bool
") GetCircleMode;
		Standard_Boolean GetCircleMode ();
		%feature("compactdefaultargs") SetConicMode;
		%feature("autodoc", "	* Returns the Geom_Conic conversion mode.

	:param mode:
	:type mode: bool
	:rtype: None
") SetConicMode;
		void SetConicMode (const Standard_Boolean mode);
		%feature("compactdefaultargs") GetConicMode;
		%feature("autodoc", "	* Performs converting and computes the resulting shape.

	:rtype: bool
") GetConicMode;
		Standard_Boolean GetConicMode ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Converts curve into a list of beziers, and stores the splitting parameters on original curve.

	:rtype: void
") Compute;
		virtual void Compute ();
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Splits a list of beziers computed by Compute method according the split values and splitting parameters.

	:param Segment:
	:type Segment: bool
	:rtype: void
") Build;
		virtual void Build (const Standard_Boolean Segment);
		%feature("compactdefaultargs") SplitParams;
		%feature("autodoc", "	* Returns the list of splitted parameters in original curve parametrisation.

	:rtype: Handle_TColStd_HSequenceOfReal
") SplitParams;
		Handle_TColStd_HSequenceOfReal SplitParams ();
};


%extend ShapeUpgrade_ConvertCurve3dToBezier {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_ConvertCurve3dToBezier(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_ConvertCurve3dToBezier::Handle_ShapeUpgrade_ConvertCurve3dToBezier %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_ConvertCurve3dToBezier;
class Handle_ShapeUpgrade_ConvertCurve3dToBezier : public Handle_ShapeUpgrade_SplitCurve3d {

    public:
        // constructors
        Handle_ShapeUpgrade_ConvertCurve3dToBezier();
        Handle_ShapeUpgrade_ConvertCurve3dToBezier(const Handle_ShapeUpgrade_ConvertCurve3dToBezier &aHandle);
        Handle_ShapeUpgrade_ConvertCurve3dToBezier(const ShapeUpgrade_ConvertCurve3dToBezier *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_ConvertCurve3dToBezier DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_ConvertCurve3dToBezier {
    ShapeUpgrade_ConvertCurve3dToBezier* _get_reference() {
    return (ShapeUpgrade_ConvertCurve3dToBezier*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_ConvertCurve3dToBezier {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_ConvertCurve3dToBezier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_FaceDivideArea;
class ShapeUpgrade_FaceDivideArea : public ShapeUpgrade_FaceDivide {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivideArea;
		%feature("autodoc", "	* Creates empty constructor.

	:rtype: None
") ShapeUpgrade_FaceDivideArea;
		 ShapeUpgrade_FaceDivideArea ();
		%feature("compactdefaultargs") ShapeUpgrade_FaceDivideArea;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") ShapeUpgrade_FaceDivideArea;
		 ShapeUpgrade_FaceDivideArea (const TopoDS_Face & F);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs splitting and computes the resulting shell The context is used to keep track of former splittings

	:rtype: bool
") Perform;
		virtual Standard_Boolean Perform ();

            %feature("autodoc","1");
            %extend {
                Standard_Real GetMaxArea() {
                return (Standard_Real) $self->MaxArea();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetMaxArea(Standard_Real value ) {
                $self->MaxArea()=value;
                }
            };
            };


%extend ShapeUpgrade_FaceDivideArea {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_FaceDivideArea(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_FaceDivideArea::Handle_ShapeUpgrade_FaceDivideArea %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_FaceDivideArea;
class Handle_ShapeUpgrade_FaceDivideArea : public Handle_ShapeUpgrade_FaceDivide {

    public:
        // constructors
        Handle_ShapeUpgrade_FaceDivideArea();
        Handle_ShapeUpgrade_FaceDivideArea(const Handle_ShapeUpgrade_FaceDivideArea &aHandle);
        Handle_ShapeUpgrade_FaceDivideArea(const ShapeUpgrade_FaceDivideArea *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_FaceDivideArea DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_FaceDivideArea {
    ShapeUpgrade_FaceDivideArea* _get_reference() {
    return (ShapeUpgrade_FaceDivideArea*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_FaceDivideArea {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_FaceDivideArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_FixSmallBezierCurves;
class ShapeUpgrade_FixSmallBezierCurves : public ShapeUpgrade_FixSmallCurves {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_FixSmallBezierCurves;
		%feature("autodoc", "	:rtype: None
") ShapeUpgrade_FixSmallBezierCurves;
		 ShapeUpgrade_FixSmallBezierCurves ();
		%feature("compactdefaultargs") Approx;
		%feature("autodoc", "	:param Curve3d:
	:type Curve3d: Handle_Geom_Curve &
	:param Curve2d:
	:type Curve2d: Handle_Geom2d_Curve &
	:param Curve2dR:
	:type Curve2dR: Handle_Geom2d_Curve &
	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: bool
") Approx;
		virtual Standard_Boolean Approx (Handle_Geom_Curve & Curve3d,Handle_Geom2d_Curve & Curve2d,Handle_Geom2d_Curve & Curve2dR,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend ShapeUpgrade_FixSmallBezierCurves {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_FixSmallBezierCurves(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_FixSmallBezierCurves::Handle_ShapeUpgrade_FixSmallBezierCurves %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_FixSmallBezierCurves;
class Handle_ShapeUpgrade_FixSmallBezierCurves : public Handle_ShapeUpgrade_FixSmallCurves {

    public:
        // constructors
        Handle_ShapeUpgrade_FixSmallBezierCurves();
        Handle_ShapeUpgrade_FixSmallBezierCurves(const Handle_ShapeUpgrade_FixSmallBezierCurves &aHandle);
        Handle_ShapeUpgrade_FixSmallBezierCurves(const ShapeUpgrade_FixSmallBezierCurves *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_FixSmallBezierCurves DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_FixSmallBezierCurves {
    ShapeUpgrade_FixSmallBezierCurves* _get_reference() {
    return (ShapeUpgrade_FixSmallBezierCurves*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_FixSmallBezierCurves {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_FixSmallBezierCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_SplitCurve2dContinuity;
class ShapeUpgrade_SplitCurve2dContinuity : public ShapeUpgrade_SplitCurve2d {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve2dContinuity;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ShapeUpgrade_SplitCurve2dContinuity;
		 ShapeUpgrade_SplitCurve2dContinuity ();
		%feature("compactdefaultargs") SetCriterion;
		%feature("autodoc", "	* Sets criterion for splitting.

	:param Criterion:
	:type Criterion: GeomAbs_Shape
	:rtype: None
") SetCriterion;
		void SetCriterion (const GeomAbs_Shape Criterion);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets tolerance.

	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Calculates points for correction/splitting of the curve

	:rtype: void
") Compute;
		virtual void Compute ();
};


%extend ShapeUpgrade_SplitCurve2dContinuity {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_SplitCurve2dContinuity(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_SplitCurve2dContinuity::Handle_ShapeUpgrade_SplitCurve2dContinuity %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_SplitCurve2dContinuity;
class Handle_ShapeUpgrade_SplitCurve2dContinuity : public Handle_ShapeUpgrade_SplitCurve2d {

    public:
        // constructors
        Handle_ShapeUpgrade_SplitCurve2dContinuity();
        Handle_ShapeUpgrade_SplitCurve2dContinuity(const Handle_ShapeUpgrade_SplitCurve2dContinuity &aHandle);
        Handle_ShapeUpgrade_SplitCurve2dContinuity(const ShapeUpgrade_SplitCurve2dContinuity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_SplitCurve2dContinuity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_SplitCurve2dContinuity {
    ShapeUpgrade_SplitCurve2dContinuity* _get_reference() {
    return (ShapeUpgrade_SplitCurve2dContinuity*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_SplitCurve2dContinuity {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_SplitCurve2dContinuity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeUpgrade_SplitCurve3dContinuity;
class ShapeUpgrade_SplitCurve3dContinuity : public ShapeUpgrade_SplitCurve3d {
	public:
		%feature("compactdefaultargs") ShapeUpgrade_SplitCurve3dContinuity;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ShapeUpgrade_SplitCurve3dContinuity;
		 ShapeUpgrade_SplitCurve3dContinuity ();
		%feature("compactdefaultargs") SetCriterion;
		%feature("autodoc", "	* Sets criterion for splitting.

	:param Criterion:
	:type Criterion: GeomAbs_Shape
	:rtype: None
") SetCriterion;
		void SetCriterion (const GeomAbs_Shape Criterion);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets tolerance.

	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Calculates points for correction/splitting of the curve

	:rtype: void
") Compute;
		virtual void Compute ();
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") GetCurve;
		Handle_Geom_Curve GetCurve ();
};


%extend ShapeUpgrade_SplitCurve3dContinuity {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeUpgrade_SplitCurve3dContinuity(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeUpgrade_SplitCurve3dContinuity::Handle_ShapeUpgrade_SplitCurve3dContinuity %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeUpgrade_SplitCurve3dContinuity;
class Handle_ShapeUpgrade_SplitCurve3dContinuity : public Handle_ShapeUpgrade_SplitCurve3d {

    public:
        // constructors
        Handle_ShapeUpgrade_SplitCurve3dContinuity();
        Handle_ShapeUpgrade_SplitCurve3dContinuity(const Handle_ShapeUpgrade_SplitCurve3dContinuity &aHandle);
        Handle_ShapeUpgrade_SplitCurve3dContinuity(const ShapeUpgrade_SplitCurve3dContinuity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeUpgrade_SplitCurve3dContinuity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeUpgrade_SplitCurve3dContinuity {
    ShapeUpgrade_SplitCurve3dContinuity* _get_reference() {
    return (ShapeUpgrade_SplitCurve3dContinuity*)$self->Access();
    }
};

%extend Handle_ShapeUpgrade_SplitCurve3dContinuity {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeUpgrade_SplitCurve3dContinuity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
