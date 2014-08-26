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
%module ShapeUpgrade

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

%include ShapeUpgrade_required_python_modules.i
%include ShapeUpgrade_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(shapeupgrade) ShapeUpgrade;
%nodefaultctor ShapeUpgrade;
class ShapeUpgrade {
	public:
		%feature("autodoc", "Args:
	BS(Handle_Geom_BSplineCurve)
	seqBS(Handle_TColGeom_HSequenceOfBoundedCurve)

Returns:
	static Standard_Boolean

Unifies same domain faces and edges of specified shape") C0BSplineToSequenceOfC1BSplineCurve;
		static Standard_Boolean C0BSplineToSequenceOfC1BSplineCurve (const Handle_Geom_BSplineCurve & BS,Handle_TColGeom_HSequenceOfBoundedCurve & seqBS);
		%feature("autodoc", "Args:
	BS(Handle_Geom2d_BSplineCurve)
	seqBS(Handle_TColGeom2d_HSequenceOfBoundedCurve)

Returns:
	static Standard_Boolean

Converts C0 B-Spline curve into sequence of C1 B-Spline curves.  
          This method splits B-Spline at the knots with multiplicities  
          equal to degree, i.e. unlike method  
          GeomConvert::C0BSplineToArrayOfC1BSplineCurve this one does not  
          use any tolerance and therefore does not change the geometry of  
          B-Spline.  
          Returns True if C0 B-Spline was successfully splitted, else  
          returns False (if BS is C1 B-Spline).") C0BSplineToSequenceOfC1BSplineCurve;
		static Standard_Boolean C0BSplineToSequenceOfC1BSplineCurve (const Handle_Geom2d_BSplineCurve & BS,Handle_TColGeom2d_HSequenceOfBoundedCurve & seqBS);
};


%feature("shadow") ShapeUpgrade::~ShapeUpgrade %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeUpgrade_RemoveLocations;
class ShapeUpgrade_RemoveLocations : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

//!Empy constructor") ShapeUpgrade_RemoveLocations;
		 ShapeUpgrade_RemoveLocations ();
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	Standard_Boolean

//!Removes all location correspodingly to RemoveLevel.") Remove;
		Standard_Boolean Remove (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

//!Returns shape with removed locatins.") GetResult;
		TopoDS_Shape GetResult ();
		%feature("autodoc", "Args:
	theLevel(TopAbs_ShapeEnum)

Returns:
	None

//!sets level starting with that location will be removed,  
        by default TopAbs_SHAPE. In this case locations will be kept for specified shape  
        and if specified shape is TopAbs_COMPOUND for sub-shapes of first level.") SetRemoveLevel;
		void SetRemoveLevel (const TopAbs_ShapeEnum theLevel);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

//!sets level starting with that location will be removed.Value of level can be set to  
        TopAbs_SHAPE,TopAbs_COMPOUND,TopAbs_SOLID,TopAbs_SHELL,TopAbs_FACE.By default TopAbs_SHAPE.  
        In this case location will be removed for all shape types for exception of compound.") RemoveLevel;
		TopAbs_ShapeEnum RemoveLevel ();
		%feature("autodoc", "Args:
	theInitShape(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns modified shape obtained from initial shape.") ModifiedShape;
		TopoDS_Shape ModifiedShape (const TopoDS_Shape & theInitShape);
};


%feature("shadow") ShapeUpgrade_RemoveLocations::~ShapeUpgrade_RemoveLocations %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_RemoveLocations {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_RemoveLocations {
	Handle_ShapeUpgrade_RemoveLocations GetHandle() {
	return *(Handle_ShapeUpgrade_RemoveLocations*) &$self;
	}
};

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
    ShapeUpgrade_RemoveLocations* GetObject() {
    return (ShapeUpgrade_RemoveLocations*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_RemoveLocations::~Handle_ShapeUpgrade_RemoveLocations %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_RemoveLocations {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_ShapeDivide;
class ShapeUpgrade_ShapeDivide {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeUpgrade_ShapeDivide;
		 ShapeUpgrade_ShapeDivide ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initialize by a Shape.") ShapeUpgrade_ShapeDivide;
		 ShapeUpgrade_ShapeDivide (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initialize by a Shape.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	Prec(Standard_Real)

Returns:
	None

Defines the spatial precision used for splitting") SetPrecision;
		void SetPrecision (const Standard_Real Prec);
		%feature("autodoc", "Args:
	maxtol(Standard_Real)

Returns:
	None

Sets maximal allowed tolerance") SetMaxTolerance;
		void SetMaxTolerance (const Standard_Real maxtol);
		%feature("autodoc", "Args:
	mintol(Standard_Real)

Returns:
	None

Sets minimal allowed tolerance") SetMinTolerance;
		void SetMinTolerance (const Standard_Real mintol);
		%feature("autodoc", "Args:
	Segment(Standard_Boolean)

Returns:
	None

Purpose sets mode for trimming (segment) surface by  
         wire UV bounds.") SetSurfaceSegmentMode;
		void SetSurfaceSegmentMode (const Standard_Boolean Segment);
		%feature("autodoc", "Args:
	newContext(Standard_Boolean)=Standard_True

Returns:
	virtual Standard_Boolean

Performs splitting and computes the resulting shape  
         If newContext is True (default), the internal context  
         will be cleared at start, else previous substitutions  
         will be acting.") Perform;
		virtual Standard_Boolean Perform (const Standard_Boolean newContext = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Gives the resulting Shape, or Null shape if not done.") Result;
		TopoDS_Shape Result ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeBuild_ReShape

Returns context with all the modifications made during  
         last call(s) to Perform() recorded") GetContext;
		Handle_ShapeBuild_ReShape GetContext ();
		%feature("autodoc", "Args:
	context(Handle_ShapeBuild_ReShape)

Returns:
	None

Sets context with recorded modifications to be applied  
         during next call(s) to Perform(shape,Standard_False)") SetContext;
		void SetContext (const Handle_ShapeBuild_ReShape & context);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Queries the status of last call to Perform  
OK   : no splitting was done (or no call to Perform)  
DONE1: some edges were splitted  
DONE2: surface was splitted  
FAIL1: some errors occured") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	splitFaceTool(Handle_ShapeUpgrade_FaceDivide)

Returns:
	None

Sets the tool for splitting faces.") SetSplitFaceTool;
		void SetSplitFaceTool (const Handle_ShapeUpgrade_FaceDivide & splitFaceTool);
		%feature("autodoc", "Args:
	aEdgeMode(Standard_Integer)

Returns:
	None

//!Sets mode for splitting 3d curves from edges.  
0 - only curve 3d from free edges.  
1 - only curve 3d from shared edges.  
2 -  all curve 3d.") SetEdgeMode;
		void SetEdgeMode (const Standard_Integer aEdgeMode);
};


%feature("shadow") ShapeUpgrade_ShapeDivide::~ShapeUpgrade_ShapeDivide %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_ShapeDivide {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeUpgrade_ShellSewing;
class ShapeUpgrade_ShellSewing {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a ShellSewing, empty") ShapeUpgrade_ShellSewing;
		 ShapeUpgrade_ShellSewing ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	tol(Standard_Real)=0.0

Returns:
	TopoDS_Shape

Builds a new shape from a former one, by calling Sewing from  
         BRepOffsetAPI. Rebuilt solids are oriented to be 'not infinite'  
 
         If <tol> is not given (i.e. value 0. by default), it is  
         computed as the mean tolerance recorded in <shape>  
 
         If no shell has been sewed, this method returns the input  
         shape") ApplySewing;
		TopoDS_Shape ApplySewing (const TopoDS_Shape & shape,const Standard_Real tol = 0.0);
};


%feature("shadow") ShapeUpgrade_ShellSewing::~ShapeUpgrade_ShellSewing %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_ShellSewing {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeUpgrade_SplitCurve;
class ShapeUpgrade_SplitCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ShapeUpgrade_SplitCurve;
		 ShapeUpgrade_SplitCurve ();
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	None

Initializes with curve first and last parameters.") Init;
		void Init (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	SplitValues(Handle_TColStd_HSequenceOfReal)

Returns:
	None

Sets the parameters where splitting has to be done.") SetSplitValues;
		void SetSplitValues (const Handle_TColStd_HSequenceOfReal & SplitValues);
		%feature("autodoc", "Args:
	Segment(Standard_Boolean)

Returns:
	virtual void

If Segment is True, the result is composed with  
 segments of the curve bounded by the SplitValues.  If  
 Segment is False, the result is composed with trimmed  
 Curves all based on the same complete curve.") Build;
		virtual void Build (const Standard_Boolean Segment);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfReal

returns all the splitting values including the  
 First and Last parameters of the input curve  Merges input split values and new ones into myGlobalKnots") SplitValues;
		const Handle_TColStd_HSequenceOfReal & SplitValues ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Calculates points for correction/splitting of the curve") Compute;
		virtual void Compute ();
		%feature("autodoc", "Args:
	Segment(Standard_Boolean)=Standard_True

Returns:
	None

Performs correction/splitting of the curve.  
        First defines splitting values by method Compute(), then calls method Build().") Perform;
		void Perform (const Standard_Boolean Segment = Standard_True);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Returns the status  
OK    - no splitting is needed  
DONE1 - splitting required and gives more than one segment  
DONE2 - splitting is required, but gives only one segment (initial)  
DONE3 - geometric form of the curve or parametrisation is modified") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
};


%feature("shadow") ShapeUpgrade_SplitCurve::~ShapeUpgrade_SplitCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_SplitCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_SplitCurve {
	Handle_ShapeUpgrade_SplitCurve GetHandle() {
	return *(Handle_ShapeUpgrade_SplitCurve*) &$self;
	}
};

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
    ShapeUpgrade_SplitCurve* GetObject() {
    return (ShapeUpgrade_SplitCurve*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_SplitCurve::~Handle_ShapeUpgrade_SplitCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_SplitCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_SplitSurface;
class ShapeUpgrade_SplitSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ShapeUpgrade_SplitSurface;
		 ShapeUpgrade_SplitSurface ();
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)

Returns:
	None

Initializes with single supporting surface.") Init;
		void Init (const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	UFirst(Standard_Real)
	ULast(Standard_Real)
	VFirst(Standard_Real)
	VLast(Standard_Real)

Returns:
	None

Initializes with single supporting surface with bounding parameters.") Init;
		void Init (const Handle_Geom_Surface & S,const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real VFirst,const Standard_Real VLast);
		%feature("autodoc", "Args:
	UValues(Handle_TColStd_HSequenceOfReal)

Returns:
	None

Sets U parameters where splitting has to be done") SetUSplitValues;
		void SetUSplitValues (const Handle_TColStd_HSequenceOfReal & UValues);
		%feature("autodoc", "Args:
	VValues(Handle_TColStd_HSequenceOfReal)

Returns:
	None

Sets V parameters where splitting has to be done") SetVSplitValues;
		void SetVSplitValues (const Handle_TColStd_HSequenceOfReal & VValues);
		%feature("autodoc", "Args:
	Segment(Standard_Boolean)

Returns:
	virtual void

Performs splitting of the supporting surface.  
         If resulting surface is B-Spline and Segment is True,  
         the result is composed with segments of the surface bounded  
         by the U and V SplitValues (method Geom_BSplineSurface::Segment  
         is used).  
         If Segment is False, the result is composed with  
         Geom_RectangularTrimmedSurface all based on the same complete  
         surface.  
         Fields myNbResultingRow and myNbResultingCol must be set to  
         specify the size of resulting grid of surfaces.") Build;
		virtual void Build (const Standard_Boolean Segment);
		%feature("autodoc", "Args:
	Segment(Standard_Boolean)=Standard_True

Returns:
	virtual void

Calculates points for correction/splitting of the surface.") Compute;
		virtual void Compute (const Standard_Boolean Segment = Standard_True);
		%feature("autodoc", "Args:
	Segment(Standard_Boolean)=Standard_True

Returns:
	None

Performs correction/splitting of the surface.  
    First defines splitting values by method Compute(), then calls method Build().") Perform;
		void Perform (const Standard_Boolean Segment = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfReal

returns all the U splitting values including the  
 First and Last parameters of the input surface") USplitValues;
		const Handle_TColStd_HSequenceOfReal & USplitValues ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfReal

returns all the splitting V values including the  
 First and Last parameters of the input surface") VSplitValues;
		const Handle_TColStd_HSequenceOfReal & VSplitValues ();
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Returns the status  
OK    - no splitting is needed  
DONE1 - splitting required and gives more than one patch  
DONE2 - splitting is required, but gives only single patch (initial)  
DONE3 - geometric form of the surface or parametrisation is modified") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeExtend_CompositeSurface

Returns obtained surfaces after splitting as CompositeSurface") ResSurfaces;
		const Handle_ShapeExtend_CompositeSurface & ResSurfaces ();
};


%feature("shadow") ShapeUpgrade_SplitSurface::~ShapeUpgrade_SplitSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_SplitSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_SplitSurface {
	Handle_ShapeUpgrade_SplitSurface GetHandle() {
	return *(Handle_ShapeUpgrade_SplitSurface*) &$self;
	}
};

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
    ShapeUpgrade_SplitSurface* GetObject() {
    return (ShapeUpgrade_SplitSurface*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_SplitSurface::~Handle_ShapeUpgrade_SplitSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_SplitSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_Tool;
class ShapeUpgrade_Tool : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") ShapeUpgrade_Tool;
		 ShapeUpgrade_Tool ();
		%feature("autodoc", "Args:
	tool(Handle_ShapeUpgrade_Tool)

Returns:
	None

Copy all fields from another Root object") Set;
		void Set (const Handle_ShapeUpgrade_Tool & tool);
		%feature("autodoc", "Args:
	context(Handle_ShapeBuild_ReShape)

Returns:
	None

Sets context") SetContext;
		void SetContext (const Handle_ShapeBuild_ReShape & context);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeBuild_ReShape

Returns context") Context;
		Handle_ShapeBuild_ReShape Context ();
		%feature("autodoc", "Args:
	preci(Standard_Real)

Returns:
	None

Sets basic precision value") SetPrecision;
		void SetPrecision (const Standard_Real preci);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns basic precision value") Precision;
		Standard_Real Precision ();
		%feature("autodoc", "Args:
	mintol(Standard_Real)

Returns:
	None

Sets minimal allowed tolerance") SetMinTolerance;
		void SetMinTolerance (const Standard_Real mintol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns minimal allowed tolerance") MinTolerance;
		Standard_Real MinTolerance ();
		%feature("autodoc", "Args:
	maxtol(Standard_Real)

Returns:
	None

Sets maximal allowed tolerance") SetMaxTolerance;
		void SetMaxTolerance (const Standard_Real maxtol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns maximal allowed tolerance") MaxTolerance;
		Standard_Real MaxTolerance ();
		%feature("autodoc", "Args:
	toler(Standard_Real)

Returns:
	Standard_Real

Returns tolerance limited by [myMinTol,myMaxTol]") LimitTolerance;
		Standard_Real LimitTolerance (const Standard_Real toler);
};


%feature("shadow") ShapeUpgrade_Tool::~ShapeUpgrade_Tool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_Tool {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_Tool {
	Handle_ShapeUpgrade_Tool GetHandle() {
	return *(Handle_ShapeUpgrade_Tool*) &$self;
	}
};

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
    ShapeUpgrade_Tool* GetObject() {
    return (ShapeUpgrade_Tool*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_Tool::~Handle_ShapeUpgrade_Tool %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_Tool {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_UnifySameDomain;
class ShapeUpgrade_UnifySameDomain : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

empty constructor") ShapeUpgrade_UnifySameDomain;
		 ShapeUpgrade_UnifySameDomain ();
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	UnifyEdges(Standard_Boolean)=Standard_True
	UnifyFaces(Standard_Boolean)=Standard_True
	ConcatBSplines(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") ShapeUpgrade_UnifySameDomain;
		 ShapeUpgrade_UnifySameDomain (const TopoDS_Shape & aShape,const Standard_Boolean UnifyEdges = Standard_True,const Standard_Boolean UnifyFaces = Standard_True,const Standard_Boolean ConcatBSplines = Standard_False);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	UnifyEdges(Standard_Boolean)=Standard_True
	UnifyFaces(Standard_Boolean)=Standard_True
	ConcatBSplines(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopoDS_Shape & aShape,const Standard_Boolean UnifyEdges = Standard_True,const Standard_Boolean UnifyFaces = Standard_True,const Standard_Boolean ConcatBSplines = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	None

Builds the resulting shape") Build;
		void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Gives the resulting shape") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Generated;
		TopoDS_Shape Generated (const TopoDS_Shape & aShape);
		%feature("autodoc", "Args:
	None
Returns:
	None

this method makes if possible a common face from each  
         group of faces lying on coincident surfaces") UnifyFaces;
		void UnifyFaces ();
		%feature("autodoc", "Args:
	None
Returns:
	None

this method makes if possible a common edge from each  
         group of edges connecting common couple of faces") UnifyEdges;
		void UnifyEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	None

this method unifies same domain faces and edges") UnifyFacesAndEdges;
		void UnifyFacesAndEdges ();
};


%feature("shadow") ShapeUpgrade_UnifySameDomain::~ShapeUpgrade_UnifySameDomain %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_UnifySameDomain {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_UnifySameDomain {
	Handle_ShapeUpgrade_UnifySameDomain GetHandle() {
	return *(Handle_ShapeUpgrade_UnifySameDomain*) &$self;
	}
};

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
    ShapeUpgrade_UnifySameDomain* GetObject() {
    return (ShapeUpgrade_UnifySameDomain*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_UnifySameDomain::~Handle_ShapeUpgrade_UnifySameDomain %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_UnifySameDomain {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_ConvertSurfaceToBezierBasis;
class ShapeUpgrade_ConvertSurfaceToBezierBasis : public ShapeUpgrade_SplitSurface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ShapeUpgrade_ConvertSurfaceToBezierBasis;
		 ShapeUpgrade_ConvertSurfaceToBezierBasis ();
		%feature("autodoc", "Args:
	Segment(Standard_Boolean)

Returns:
	virtual void

Splits a list of beziers computed by Compute method according  
         the split values and splitting parameters.") Build;
		virtual void Build (const Standard_Boolean Segment);
		%feature("autodoc", "Args:
	Segment(Standard_Boolean)

Returns:
	virtual void

Converts surface into a grid of bezier based surfaces, and  
         stores this grid.") Compute;
		virtual void Compute (const Standard_Boolean Segment);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeExtend_CompositeSurface

Returns the grid of bezier based surfaces correspondent to  
         original surface.") Segments;
		Handle_ShapeExtend_CompositeSurface Segments ();
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets mode for conversion Geom_Plane to Bezier") SetPlaneMode;
		void SetPlaneMode (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Geom_Pline conversion mode.") GetPlaneMode;
		Standard_Boolean GetPlaneMode ();
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets mode for conversion Geom_SurfaceOfRevolution to Bezier") SetRevolutionMode;
		void SetRevolutionMode (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Geom_SurfaceOfRevolution conversion mode.") GetRevolutionMode;
		Standard_Boolean GetRevolutionMode ();
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets mode for conversion Geom_SurfaceOfLinearExtrusion to Bezier") SetExtrusionMode;
		void SetExtrusionMode (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Geom_SurfaceOfLinearExtrusion conversion mode.") GetExtrusionMode;
		Standard_Boolean GetExtrusionMode ();
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets mode for conversion Geom_BSplineSurface to Bezier") SetBSplineMode;
		void SetBSplineMode (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Geom_BSplineSurface conversion mode.") GetBSplineMode;
		Standard_Boolean GetBSplineMode ();
};


%feature("shadow") ShapeUpgrade_ConvertSurfaceToBezierBasis::~ShapeUpgrade_ConvertSurfaceToBezierBasis %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_ConvertSurfaceToBezierBasis {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_ConvertSurfaceToBezierBasis {
	Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis GetHandle() {
	return *(Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis*) &$self;
	}
};

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
    ShapeUpgrade_ConvertSurfaceToBezierBasis* GetObject() {
    return (ShapeUpgrade_ConvertSurfaceToBezierBasis*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis::~Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_ConvertSurfaceToBezierBasis {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_EdgeDivide;
class ShapeUpgrade_EdgeDivide : public ShapeUpgrade_Tool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") ShapeUpgrade_EdgeDivide;
		 ShapeUpgrade_EdgeDivide ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Sets supporting surface by face") SetFace;
		void SetFace (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Compute;
		virtual Standard_Boolean Compute (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasCurve2d;
		Standard_Boolean HasCurve2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasCurve3d;
		Standard_Boolean HasCurve3d ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfReal

No detailed docstring for this function.") Knots2d;
		Handle_TColStd_HSequenceOfReal Knots2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfReal

No detailed docstring for this function.") Knots3d;
		Handle_TColStd_HSequenceOfReal Knots3d ();
		%feature("autodoc", "Args:
	splitCurve2dTool(Handle_ShapeUpgrade_SplitCurve2d)

Returns:
	None

Sets the tool for splitting pcurves.") SetSplitCurve2dTool;
		void SetSplitCurve2dTool (const Handle_ShapeUpgrade_SplitCurve2d & splitCurve2dTool);
		%feature("autodoc", "Args:
	splitCurve3dTool(Handle_ShapeUpgrade_SplitCurve3d)

Returns:
	None

Sets the tool for splitting 3D curves.") SetSplitCurve3dTool;
		void SetSplitCurve3dTool (const Handle_ShapeUpgrade_SplitCurve3d & splitCurve3dTool);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_ShapeUpgrade_SplitCurve2d

Returns the tool for splitting pcurves.") GetSplitCurve2dTool;
		virtual Handle_ShapeUpgrade_SplitCurve2d GetSplitCurve2dTool ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_ShapeUpgrade_SplitCurve3d

Returns the tool for splitting 3D curves.") GetSplitCurve3dTool;
		virtual Handle_ShapeUpgrade_SplitCurve3d GetSplitCurve3dTool ();
};


%feature("shadow") ShapeUpgrade_EdgeDivide::~ShapeUpgrade_EdgeDivide %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_EdgeDivide {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_EdgeDivide {
	Handle_ShapeUpgrade_EdgeDivide GetHandle() {
	return *(Handle_ShapeUpgrade_EdgeDivide*) &$self;
	}
};

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
    ShapeUpgrade_EdgeDivide* GetObject() {
    return (ShapeUpgrade_EdgeDivide*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_EdgeDivide::~Handle_ShapeUpgrade_EdgeDivide %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_EdgeDivide {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_FaceDivide;
class ShapeUpgrade_FaceDivide : public ShapeUpgrade_Tool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates empty  constructor.") ShapeUpgrade_FaceDivide;
		 ShapeUpgrade_FaceDivide ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Initialize by a Face.") ShapeUpgrade_FaceDivide;
		 ShapeUpgrade_FaceDivide (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Initialize by a Face.") Init;
		void Init (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	Segment(Standard_Boolean)

Returns:
	None

Purpose sets mode for trimming (segment) surface by  
         wire UV bounds.") SetSurfaceSegmentMode;
		void SetSurfaceSegmentMode (const Standard_Boolean Segment);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Performs splitting and computes the resulting shell  
         The context is used to keep track of former splittings  
         in order to keep sharings. It is updated according to  
         modifications made.") Perform;
		virtual Standard_Boolean Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Performs splitting of surface and computes the shell  
         from source face.") SplitSurface;
		virtual Standard_Boolean SplitSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Performs splitting of curves of all the edges in the  
         shape and divides these edges.") SplitCurves;
		virtual Standard_Boolean SplitCurves ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Gives the resulting Shell, or Face, or Null shape if not done.") Result;
		TopoDS_Shape Result ();
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Queries the status of last call to Perform  
OK   : no splitting was done (or no call to Perform)  
DONE1: some edges were splitted  
DONE2: surface was splitted  
DONE3: surface was modified without splitting  
FAIL1: some fails encountered during splitting wires  
FAIL2: face cannot be splitted") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	splitSurfaceTool(Handle_ShapeUpgrade_SplitSurface)

Returns:
	None

Sets the tool for splitting surfaces.") SetSplitSurfaceTool;
		void SetSplitSurfaceTool (const Handle_ShapeUpgrade_SplitSurface & splitSurfaceTool);
		%feature("autodoc", "Args:
	wireDivideTool(Handle_ShapeUpgrade_WireDivide)

Returns:
	None

Sets the tool for dividing edges on Face.") SetWireDivideTool;
		void SetWireDivideTool (const Handle_ShapeUpgrade_WireDivide & wireDivideTool);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_ShapeUpgrade_WireDivide

Returns the tool for dividing edges on Face.  
         This tool must be already initialized.") GetWireDivideTool;
		virtual Handle_ShapeUpgrade_WireDivide GetWireDivideTool ();
};


%feature("shadow") ShapeUpgrade_FaceDivide::~ShapeUpgrade_FaceDivide %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_FaceDivide {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_FaceDivide {
	Handle_ShapeUpgrade_FaceDivide GetHandle() {
	return *(Handle_ShapeUpgrade_FaceDivide*) &$self;
	}
};

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
    ShapeUpgrade_FaceDivide* GetObject() {
    return (ShapeUpgrade_FaceDivide*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_FaceDivide::~Handle_ShapeUpgrade_FaceDivide %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_FaceDivide {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_FixSmallCurves;
class ShapeUpgrade_FixSmallCurves : public ShapeUpgrade_Tool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeUpgrade_FixSmallCurves;
		 ShapeUpgrade_FixSmallCurves ();
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)
	theFace(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace);
		%feature("autodoc", "Args:
	Curve3d(Handle_Geom_Curve)
	Curve2d(Handle_Geom2d_Curve)
	Curve2dR(Handle_Geom2d_Curve)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Approx;
		virtual Standard_Boolean Approx (Handle_Geom_Curve & Curve3d,Handle_Geom2d_Curve & Curve2d,Handle_Geom2d_Curve & Curve2dR,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	splitCurve3dTool(Handle_ShapeUpgrade_SplitCurve3d)

Returns:
	None

Sets the tool for splitting 3D curves.") SetSplitCurve3dTool;
		void SetSplitCurve3dTool (const Handle_ShapeUpgrade_SplitCurve3d & splitCurve3dTool);
		%feature("autodoc", "Args:
	splitCurve2dTool(Handle_ShapeUpgrade_SplitCurve2d)

Returns:
	None

Sets the tool for splitting pcurves.") SetSplitCurve2dTool;
		void SetSplitCurve2dTool (const Handle_ShapeUpgrade_SplitCurve2d & splitCurve2dTool);
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Queries the status of last call to Perform  
OK   :  
DONE1:  
DONE2:  
FAIL1:") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
};


%feature("shadow") ShapeUpgrade_FixSmallCurves::~ShapeUpgrade_FixSmallCurves %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_FixSmallCurves {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_FixSmallCurves {
	Handle_ShapeUpgrade_FixSmallCurves GetHandle() {
	return *(Handle_ShapeUpgrade_FixSmallCurves*) &$self;
	}
};

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
    ShapeUpgrade_FixSmallCurves* GetObject() {
    return (ShapeUpgrade_FixSmallCurves*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_FixSmallCurves::~Handle_ShapeUpgrade_FixSmallCurves %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_FixSmallCurves {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_RemoveInternalWires;
class ShapeUpgrade_RemoveInternalWires : public ShapeUpgrade_Tool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates empty  constructor.") ShapeUpgrade_RemoveInternalWires;
		 ShapeUpgrade_RemoveInternalWires ();
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") ShapeUpgrade_RemoveInternalWires;
		 ShapeUpgrade_RemoveInternalWires (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	None

Initialize by a Shape.") Init;
		void Init (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

//!Removes all internal wires having area less than area specified as minimal allowed area") Perform;
		Standard_Boolean Perform ();
		%feature("autodoc", "Args:
	theSeqShapes(TopTools_SequenceOfShape)

Returns:
	Standard_Boolean

//!If specified sequence of shape contains -  
//!	       1.wires then these wires will be removed if they have area less than allowed min area.  
        2.faces than internal wires from these faces will be removed if they have area less than allowed min area.") Perform;
		Standard_Boolean Perform (const TopTools_SequenceOfShape & theSeqShapes);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

//!Get result shape") GetResult;
		TopoDS_Shape GetResult ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

//!Set min area allowed for holes( all holes having area less than mi area will be removed)") MinArea;
		Standard_Real & MinArea ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

//!Set mode which manage removing faces which have outer wires consisting only from edges  
        belonginig to removed internal wires.  
      By default it is equal to true.") RemoveFaceMode;
		Standard_Boolean & RemoveFaceMode ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_SequenceOfShape

//!Returns sequence of removed faces.") RemovedFaces;
		const TopTools_SequenceOfShape & RemovedFaces ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_SequenceOfShape

//!Returns sequence of removed faces.") RemovedWires;
		const TopTools_SequenceOfShape & RemovedWires ();
		%feature("autodoc", "Args:
	theStatus(ShapeExtend_Status)

Returns:
	Standard_Boolean

//!Queries status of last call to Perform()  
       : OK - nothing was done  
       :DONE1 - internal wires were removed  
       :DONE2 - small faces were removed.  
       :FAIL1 - initial shape is not specified  
       :FAIL2 - specified sub-shape is not belonged to inotial shape.") Status;
		Standard_Boolean Status (const ShapeExtend_Status theStatus);
};


%feature("shadow") ShapeUpgrade_RemoveInternalWires::~ShapeUpgrade_RemoveInternalWires %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_RemoveInternalWires {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_RemoveInternalWires {
	Handle_ShapeUpgrade_RemoveInternalWires GetHandle() {
	return *(Handle_ShapeUpgrade_RemoveInternalWires*) &$self;
	}
};

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
    ShapeUpgrade_RemoveInternalWires* GetObject() {
    return (ShapeUpgrade_RemoveInternalWires*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_RemoveInternalWires::~Handle_ShapeUpgrade_RemoveInternalWires %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_RemoveInternalWires {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_ShapeConvertToBezier;
class ShapeUpgrade_ShapeConvertToBezier : public ShapeUpgrade_ShapeDivide {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ShapeUpgrade_ShapeConvertToBezier;
		 ShapeUpgrade_ShapeConvertToBezier ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initialize by a Shape.") ShapeUpgrade_ShapeConvertToBezier;
		 ShapeUpgrade_ShapeConvertToBezier (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets mode for conversion 2D curves to bezier.") Set2dConversion;
		void Set2dConversion (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the 2D conversion mode.") Get2dConversion;
		Standard_Boolean Get2dConversion ();
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets mode for conversion 3d curves to bezier.") Set3dConversion;
		void Set3dConversion (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the 3D conversion mode.") Get3dConversion;
		Standard_Boolean Get3dConversion ();
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets mode for conversion surfaces curves to  
         bezier basis.") SetSurfaceConversion;
		void SetSurfaceConversion (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the surface conversion mode.") GetSurfaceConversion;
		Standard_Boolean GetSurfaceConversion ();
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets mode for conversion Geom_Line to bezier.") Set3dLineConversion;
		void Set3dLineConversion (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Geom_Line conversion mode.") Get3dLineConversion;
		Standard_Boolean Get3dLineConversion ();
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets mode for conversion Geom_Circle to bezier.") Set3dCircleConversion;
		void Set3dCircleConversion (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Geom_Circle conversion mode.") Get3dCircleConversion;
		Standard_Boolean Get3dCircleConversion ();
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets mode for conversion Geom_Conic to bezier.") Set3dConicConversion;
		void Set3dConicConversion (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Geom_Conic conversion mode.") Get3dConicConversion;
		Standard_Boolean Get3dConicConversion ();
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets mode for conversion Geom_Plane to Bezier") SetPlaneMode;
		void SetPlaneMode (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Geom_Pline conversion mode.") GetPlaneMode;
		Standard_Boolean GetPlaneMode ();
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets mode for conversion Geom_SurfaceOfRevolution to Bezier") SetRevolutionMode;
		void SetRevolutionMode (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Geom_SurfaceOfRevolution conversion mode.") GetRevolutionMode;
		Standard_Boolean GetRevolutionMode ();
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets mode for conversion Geom_SurfaceOfLinearExtrusion to Bezier") SetExtrusionMode;
		void SetExtrusionMode (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Geom_SurfaceOfLinearExtrusion conversion mode.") GetExtrusionMode;
		Standard_Boolean GetExtrusionMode ();
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets mode for conversion Geom_BSplineSurface to Bezier") SetBSplineMode;
		void SetBSplineMode (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Geom_BSplineSurface conversion mode.") GetBSplineMode;
		Standard_Boolean GetBSplineMode ();
		%feature("autodoc", "Args:
	newContext(Standard_Boolean)=Standard_True

Returns:
	virtual Standard_Boolean

Performs converting and computes the resulting shape") Perform;
		virtual Standard_Boolean Perform (const Standard_Boolean newContext = Standard_True);
};


%feature("shadow") ShapeUpgrade_ShapeConvertToBezier::~ShapeUpgrade_ShapeConvertToBezier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_ShapeConvertToBezier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeUpgrade_ShapeDivideAngle;
class ShapeUpgrade_ShapeDivideAngle : public ShapeUpgrade_ShapeDivide {
	public:
		%feature("autodoc", "Args:
	MaxAngle(Standard_Real)

Returns:
	None

Empty constructor.") ShapeUpgrade_ShapeDivideAngle;
		 ShapeUpgrade_ShapeDivideAngle (const Standard_Real MaxAngle);
		%feature("autodoc", "Args:
	MaxAngle(Standard_Real)
	S(TopoDS_Shape)

Returns:
	None

Initialize by a Shape.") ShapeUpgrade_ShapeDivideAngle;
		 ShapeUpgrade_ShapeDivideAngle (const Standard_Real MaxAngle,const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	MaxAngle(Standard_Real)

Returns:
	None

Resets tool for splitting face with given angle") InitTool;
		void InitTool (const Standard_Real MaxAngle);
		%feature("autodoc", "Args:
	MaxAngle(Standard_Real)

Returns:
	None

Set maximal angle (calls InitTool)") SetMaxAngle;
		void SetMaxAngle (const Standard_Real MaxAngle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns maximal angle") MaxAngle;
		Standard_Real MaxAngle ();
};


%feature("shadow") ShapeUpgrade_ShapeDivideAngle::~ShapeUpgrade_ShapeDivideAngle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_ShapeDivideAngle {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeUpgrade_ShapeDivideArea;
class ShapeUpgrade_ShapeDivideArea : public ShapeUpgrade_ShapeDivide {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeUpgrade_ShapeDivideArea;
		 ShapeUpgrade_ShapeDivideArea ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initialize by a Shape.") ShapeUpgrade_ShapeDivideArea;
		 ShapeUpgrade_ShapeDivideArea (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

//!Set max area allowed for faces") MaxArea;
		Standard_Real & MaxArea ();
};


%feature("shadow") ShapeUpgrade_ShapeDivideArea::~ShapeUpgrade_ShapeDivideArea %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_ShapeDivideArea {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeUpgrade_ShapeDivideClosed;
class ShapeUpgrade_ShapeDivideClosed : public ShapeUpgrade_ShapeDivide {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initialises tool with shape and default parameter.") ShapeUpgrade_ShapeDivideClosed;
		 ShapeUpgrade_ShapeDivideClosed (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	None

Sets the number of cuts applied to divide closed faces.  
         The number of resulting faces will be num+1.") SetNbSplitPoints;
		void SetNbSplitPoints (const Standard_Integer num);
};


%feature("shadow") ShapeUpgrade_ShapeDivideClosed::~ShapeUpgrade_ShapeDivideClosed %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_ShapeDivideClosed {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeUpgrade_ShapeDivideClosedEdges;
class ShapeUpgrade_ShapeDivideClosedEdges : public ShapeUpgrade_ShapeDivide {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initialises tool with shape and default parameter.") ShapeUpgrade_ShapeDivideClosedEdges;
		 ShapeUpgrade_ShapeDivideClosedEdges (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	None

Sets the number of cuts applied to divide closed edges.  
         The number of resulting faces will be num+1.") SetNbSplitPoints;
		void SetNbSplitPoints (const Standard_Integer num);
};


%feature("shadow") ShapeUpgrade_ShapeDivideClosedEdges::~ShapeUpgrade_ShapeDivideClosedEdges %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_ShapeDivideClosedEdges {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeUpgrade_ShapeDivideContinuity;
class ShapeUpgrade_ShapeDivideContinuity : public ShapeUpgrade_ShapeDivide {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeUpgrade_ShapeDivideContinuity;
		 ShapeUpgrade_ShapeDivideContinuity ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initialize by a Shape.") ShapeUpgrade_ShapeDivideContinuity;
		 ShapeUpgrade_ShapeDivideContinuity (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

Sets tolerance.") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

Sets tolerance.") SetTolerance2d;
		void SetTolerance2d (const Standard_Real Tol);
		%feature("autodoc", "Args:
	Criterion(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

Defines a criterion of continuity for the boundary (all the  
 Wires)  
 
 The possible values are C0, G1, C1, G2, C2, C3, CN The  
 default is C1 to respect the Cas.Cade Shape Validity.  G1  
 and G2 are not authorized.") SetBoundaryCriterion;
		void SetBoundaryCriterion (const GeomAbs_Shape Criterion = GeomAbs_C1);
		%feature("autodoc", "Args:
	Criterion(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

Defines a criterion of continuity for the boundary (all the  
 pcurves of Wires)  
 
 The possible values are C0, G1, C1, G2, C2, C3, CN The  
 default is C1 to respect the Cas.Cade Shape Validity.  G1  
 and G2 are not authorized.") SetPCurveCriterion;
		void SetPCurveCriterion (const GeomAbs_Shape Criterion = GeomAbs_C1);
		%feature("autodoc", "Args:
	Criterion(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

Defines a criterion of continuity for the boundary (all the  
 Wires)  
 
 The possible values are C0, G1, C1, G2, C2, C3, CN The  
 default is C1 to respect the Cas.Cade Shape Validity.  G1  
 and G2 are not authorized.") SetSurfaceCriterion;
		void SetSurfaceCriterion (const GeomAbs_Shape Criterion = GeomAbs_C1);
};


%feature("shadow") ShapeUpgrade_ShapeDivideContinuity::~ShapeUpgrade_ShapeDivideContinuity %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_ShapeDivideContinuity {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ShapeUpgrade_SplitCurve2d;
class ShapeUpgrade_SplitCurve2d : public ShapeUpgrade_SplitCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ShapeUpgrade_SplitCurve2d;
		 ShapeUpgrade_SplitCurve2d ();
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	None

Initializes with pcurve with its first and last parameters.") Init;
		void Init (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	None

Initializes with pcurve with its parameters.") Init;
		void Init (const Handle_Geom2d_Curve & C,const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	Segment(Standard_Boolean)

Returns:
	virtual void

If Segment is True, the result is composed with  
 segments of the curve bounded by the SplitValues.  If  
 Segment is False, the result is composed with trimmed  
 Curves all based on the same complete curve.") Build;
		virtual void Build (const Standard_Boolean Segment);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColGeom2d_HArray1OfCurve

No detailed docstring for this function.") GetCurves;
		const Handle_TColGeom2d_HArray1OfCurve & GetCurves ();
};


%feature("shadow") ShapeUpgrade_SplitCurve2d::~ShapeUpgrade_SplitCurve2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_SplitCurve2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_SplitCurve2d {
	Handle_ShapeUpgrade_SplitCurve2d GetHandle() {
	return *(Handle_ShapeUpgrade_SplitCurve2d*) &$self;
	}
};

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
    ShapeUpgrade_SplitCurve2d* GetObject() {
    return (ShapeUpgrade_SplitCurve2d*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_SplitCurve2d::~Handle_ShapeUpgrade_SplitCurve2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_SplitCurve2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_SplitCurve3d;
class ShapeUpgrade_SplitCurve3d : public ShapeUpgrade_SplitCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ShapeUpgrade_SplitCurve3d;
		 ShapeUpgrade_SplitCurve3d ();
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	None

Initializes with curve with its first and last parameters.") Init;
		void Init (const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	None

Initializes with curve with its parameters.") Init;
		void Init (const Handle_Geom_Curve & C,const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	Segment(Standard_Boolean)

Returns:
	virtual void

If Segment is True, the result is composed with  
 segments of the curve bounded by the SplitValues.  If  
 Segment is False, the result is composed with trimmed  
 Curves all based on the same complete curve.") Build;
		virtual void Build (const Standard_Boolean Segment);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColGeom_HArray1OfCurve

No detailed docstring for this function.") GetCurves;
		const Handle_TColGeom_HArray1OfCurve & GetCurves ();
};


%feature("shadow") ShapeUpgrade_SplitCurve3d::~ShapeUpgrade_SplitCurve3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_SplitCurve3d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_SplitCurve3d {
	Handle_ShapeUpgrade_SplitCurve3d GetHandle() {
	return *(Handle_ShapeUpgrade_SplitCurve3d*) &$self;
	}
};

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
    ShapeUpgrade_SplitCurve3d* GetObject() {
    return (ShapeUpgrade_SplitCurve3d*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_SplitCurve3d::~Handle_ShapeUpgrade_SplitCurve3d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_SplitCurve3d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_SplitSurfaceAngle;
class ShapeUpgrade_SplitSurfaceAngle : public ShapeUpgrade_SplitSurface {
	public:
		%feature("autodoc", "Args:
	MaxAngle(Standard_Real)

Returns:
	None

Empty constructor.") ShapeUpgrade_SplitSurfaceAngle;
		 ShapeUpgrade_SplitSurfaceAngle (const Standard_Real MaxAngle);
		%feature("autodoc", "Args:
	MaxAngle(Standard_Real)

Returns:
	None

Set maximal angle") SetMaxAngle;
		void SetMaxAngle (const Standard_Real MaxAngle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns maximal angle") MaxAngle;
		Standard_Real MaxAngle ();
		%feature("autodoc", "Args:
	Segment(Standard_Boolean)

Returns:
	virtual void

Performs splitting of the supporting surface(s).  
        First defines splitting values, then calls inherited method.") Compute;
		virtual void Compute (const Standard_Boolean Segment);
};


%feature("shadow") ShapeUpgrade_SplitSurfaceAngle::~ShapeUpgrade_SplitSurfaceAngle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_SplitSurfaceAngle {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_SplitSurfaceAngle {
	Handle_ShapeUpgrade_SplitSurfaceAngle GetHandle() {
	return *(Handle_ShapeUpgrade_SplitSurfaceAngle*) &$self;
	}
};

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
    ShapeUpgrade_SplitSurfaceAngle* GetObject() {
    return (ShapeUpgrade_SplitSurfaceAngle*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_SplitSurfaceAngle::~Handle_ShapeUpgrade_SplitSurfaceAngle %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_SplitSurfaceAngle {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_SplitSurfaceArea;
class ShapeUpgrade_SplitSurfaceArea : public ShapeUpgrade_SplitSurface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ShapeUpgrade_SplitSurfaceArea;
		 ShapeUpgrade_SplitSurfaceArea ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

//!Set number of split for surfaces") NbParts;
		Standard_Integer & NbParts ();
		%feature("autodoc", "Args:
	Segment(Standard_Boolean)=Standard_True

Returns:
	virtual void

No detailed docstring for this function.") Compute;
		virtual void Compute (const Standard_Boolean Segment = Standard_True);
};


%feature("shadow") ShapeUpgrade_SplitSurfaceArea::~ShapeUpgrade_SplitSurfaceArea %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_SplitSurfaceArea {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_SplitSurfaceArea {
	Handle_ShapeUpgrade_SplitSurfaceArea GetHandle() {
	return *(Handle_ShapeUpgrade_SplitSurfaceArea*) &$self;
	}
};

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
    ShapeUpgrade_SplitSurfaceArea* GetObject() {
    return (ShapeUpgrade_SplitSurfaceArea*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_SplitSurfaceArea::~Handle_ShapeUpgrade_SplitSurfaceArea %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_SplitSurfaceArea {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_SplitSurfaceContinuity;
class ShapeUpgrade_SplitSurfaceContinuity : public ShapeUpgrade_SplitSurface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ShapeUpgrade_SplitSurfaceContinuity;
		 ShapeUpgrade_SplitSurfaceContinuity ();
		%feature("autodoc", "Args:
	Criterion(GeomAbs_Shape)

Returns:
	None

Sets criterion for splitting.") SetCriterion;
		void SetCriterion (const GeomAbs_Shape Criterion);
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

Sets tolerance.") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("autodoc", "Args:
	Segment(Standard_Boolean)

Returns:
	virtual void

No detailed docstring for this function.") Compute;
		virtual void Compute (const Standard_Boolean Segment);
};


%feature("shadow") ShapeUpgrade_SplitSurfaceContinuity::~ShapeUpgrade_SplitSurfaceContinuity %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_SplitSurfaceContinuity {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_SplitSurfaceContinuity {
	Handle_ShapeUpgrade_SplitSurfaceContinuity GetHandle() {
	return *(Handle_ShapeUpgrade_SplitSurfaceContinuity*) &$self;
	}
};

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
    ShapeUpgrade_SplitSurfaceContinuity* GetObject() {
    return (ShapeUpgrade_SplitSurfaceContinuity*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_SplitSurfaceContinuity::~Handle_ShapeUpgrade_SplitSurfaceContinuity %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_SplitSurfaceContinuity {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_WireDivide;
class ShapeUpgrade_WireDivide : public ShapeUpgrade_Tool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") ShapeUpgrade_WireDivide;
		 ShapeUpgrade_WireDivide ();
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	F(TopoDS_Face)

Returns:
	None

Initializes by wire and face") Init;
		void Init (const TopoDS_Wire & W,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	S(Handle_Geom_Surface)

Returns:
	None

Initializes by wire and surface") Init;
		void Init (const TopoDS_Wire & W,const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)

Returns:
	None

Loads working wire") Load;
		void Load (const TopoDS_Wire & W);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Creates wire of one edge and calls Load for wire") Load;
		void Load (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Sets supporting surface by face") SetFace;
		void SetFace (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)

Returns:
	None

Sets supporting surface") SetSurface;
		void SetSurface (const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	None

Sets supporting surface with location") SetSurface;
		void SetSurface (const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Computes the resulting wire by splitting all the edges  
         according to splitting criteria.  
         All the modifications made are recorded in context  
         (ShapeBuild_ReShape). This tool is applied to all edges  
         before splitting them in order to keep sharings.  
         If no supporting face or surface is defined, only 3d  
         splitting criteria are used.") Perform;
		virtual void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

Gives the resulting Wire (equal to initial one if not done  
         or Null if not loaded)") Wire;
		const TopoDS_Wire & Wire ();
		%feature("autodoc", "Args:
	status(ShapeExtend_Status)

Returns:
	Standard_Boolean

Queries status of last call to Perform()  
OK - no edges were splitted, wire left untouched  
DONE1 - some edges were splitted  
FAIL1 - some edges have no 3d curve (skipped)  
FAIL2 - some edges have no pcurve (skipped)") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("autodoc", "Args:
	splitCurve3dTool(Handle_ShapeUpgrade_SplitCurve3d)

Returns:
	None

Sets the tool for splitting 3D curves.") SetSplitCurve3dTool;
		void SetSplitCurve3dTool (const Handle_ShapeUpgrade_SplitCurve3d & splitCurve3dTool);
		%feature("autodoc", "Args:
	splitCurve2dTool(Handle_ShapeUpgrade_SplitCurve2d)

Returns:
	None

Sets the tool for splitting pcurves.") SetSplitCurve2dTool;
		void SetSplitCurve2dTool (const Handle_ShapeUpgrade_SplitCurve2d & splitCurve2dTool);
		%feature("autodoc", "Args:
	TransferParam(Handle_ShapeAnalysis_TransferParameters)

Returns:
	None

Sets the tool for Transfer parameters between curves and pcurves.") SetTransferParamTool;
		void SetTransferParamTool (const Handle_ShapeAnalysis_TransferParameters & TransferParam);
		%feature("autodoc", "Args:
	edgeDivideTool(Handle_ShapeUpgrade_EdgeDivide)

Returns:
	None

Sets tool for splitting edge") SetEdgeDivideTool;
		void SetEdgeDivideTool (const Handle_ShapeUpgrade_EdgeDivide & edgeDivideTool);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_ShapeUpgrade_EdgeDivide

returns tool for splitting edges") GetEdgeDivideTool;
		virtual Handle_ShapeUpgrade_EdgeDivide GetEdgeDivideTool ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_ShapeAnalysis_TransferParameters

Returns the tool for Transfer of parameters.") GetTransferParamTool;
		virtual Handle_ShapeAnalysis_TransferParameters GetTransferParamTool ();
		%feature("autodoc", "Args:
	EdgeMode(Standard_Integer)

Returns:
	None

//!Sets mode for splitting 3d curves from edges.  
0 - only curve 3d from free edges.  
1 - only curve 3d from shared edges.  
2 -  all curve 3d.") SetEdgeMode;
		void SetEdgeMode (const Standard_Integer EdgeMode);
		%feature("autodoc", "Args:
	FixSmallCurvesTool(Handle_ShapeUpgrade_FixSmallCurves)

Returns:
	None

//!Sets tool for fixing small curves with specified min tolerance;") SetFixSmallCurveTool;
		void SetFixSmallCurveTool (const Handle_ShapeUpgrade_FixSmallCurves & FixSmallCurvesTool);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeUpgrade_FixSmallCurves

//!Returns tool for fixing small curves") GetFixSmallCurveTool;
		Handle_ShapeUpgrade_FixSmallCurves GetFixSmallCurveTool ();
};


%feature("shadow") ShapeUpgrade_WireDivide::~ShapeUpgrade_WireDivide %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_WireDivide {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_WireDivide {
	Handle_ShapeUpgrade_WireDivide GetHandle() {
	return *(Handle_ShapeUpgrade_WireDivide*) &$self;
	}
};

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
    ShapeUpgrade_WireDivide* GetObject() {
    return (ShapeUpgrade_WireDivide*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_WireDivide::~Handle_ShapeUpgrade_WireDivide %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_WireDivide {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_ClosedEdgeDivide;
class ShapeUpgrade_ClosedEdgeDivide : public ShapeUpgrade_EdgeDivide {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ShapeUpgrade_ClosedEdgeDivide;
		 ShapeUpgrade_ClosedEdgeDivide ();
		%feature("autodoc", "Args:
	anEdge(TopoDS_Edge)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Compute;
		virtual Standard_Boolean Compute (const TopoDS_Edge & anEdge);
};


%feature("shadow") ShapeUpgrade_ClosedEdgeDivide::~ShapeUpgrade_ClosedEdgeDivide %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_ClosedEdgeDivide {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_ClosedEdgeDivide {
	Handle_ShapeUpgrade_ClosedEdgeDivide GetHandle() {
	return *(Handle_ShapeUpgrade_ClosedEdgeDivide*) &$self;
	}
};

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
    ShapeUpgrade_ClosedEdgeDivide* GetObject() {
    return (ShapeUpgrade_ClosedEdgeDivide*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_ClosedEdgeDivide::~Handle_ShapeUpgrade_ClosedEdgeDivide %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_ClosedEdgeDivide {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_ClosedFaceDivide;
class ShapeUpgrade_ClosedFaceDivide : public ShapeUpgrade_FaceDivide {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates empty  constructor.") ShapeUpgrade_ClosedFaceDivide;
		 ShapeUpgrade_ClosedFaceDivide ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Initialize by a Face.") ShapeUpgrade_ClosedFaceDivide;
		 ShapeUpgrade_ClosedFaceDivide (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Performs splitting of surface and computes the shell  
         from source face.") SplitSurface;
		virtual Standard_Boolean SplitSurface ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	None

Sets the number of cutting lines by which closed face  
         will be splitted. The resulting faces will be num+1.") SetNbSplitPoints;
		void SetNbSplitPoints (const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of splitting points") GetNbSplitPoints;
		Standard_Integer GetNbSplitPoints ();
};


%feature("shadow") ShapeUpgrade_ClosedFaceDivide::~ShapeUpgrade_ClosedFaceDivide %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_ClosedFaceDivide {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_ClosedFaceDivide {
	Handle_ShapeUpgrade_ClosedFaceDivide GetHandle() {
	return *(Handle_ShapeUpgrade_ClosedFaceDivide*) &$self;
	}
};

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
    ShapeUpgrade_ClosedFaceDivide* GetObject() {
    return (ShapeUpgrade_ClosedFaceDivide*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_ClosedFaceDivide::~Handle_ShapeUpgrade_ClosedFaceDivide %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_ClosedFaceDivide {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_ConvertCurve2dToBezier;
class ShapeUpgrade_ConvertCurve2dToBezier : public ShapeUpgrade_SplitCurve2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ShapeUpgrade_ConvertCurve2dToBezier;
		 ShapeUpgrade_ConvertCurve2dToBezier ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Converts curve into a list of beziers, and stores the  
         splitting parameters on original curve.") Compute;
		virtual void Compute ();
		%feature("autodoc", "Args:
	Segment(Standard_Boolean)

Returns:
	virtual void

Splits a list of beziers computed by Compute method according  
         the split values and splitting parameters.") Build;
		virtual void Build (const Standard_Boolean Segment);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfReal

Returns the list of splitted parameters in original curve  
         parametrisation.") SplitParams;
		Handle_TColStd_HSequenceOfReal SplitParams ();
};


%feature("shadow") ShapeUpgrade_ConvertCurve2dToBezier::~ShapeUpgrade_ConvertCurve2dToBezier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_ConvertCurve2dToBezier {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_ConvertCurve2dToBezier {
	Handle_ShapeUpgrade_ConvertCurve2dToBezier GetHandle() {
	return *(Handle_ShapeUpgrade_ConvertCurve2dToBezier*) &$self;
	}
};

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
    ShapeUpgrade_ConvertCurve2dToBezier* GetObject() {
    return (ShapeUpgrade_ConvertCurve2dToBezier*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_ConvertCurve2dToBezier::~Handle_ShapeUpgrade_ConvertCurve2dToBezier %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_ConvertCurve2dToBezier {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_ConvertCurve3dToBezier;
class ShapeUpgrade_ConvertCurve3dToBezier : public ShapeUpgrade_SplitCurve3d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") ShapeUpgrade_ConvertCurve3dToBezier;
		 ShapeUpgrade_ConvertCurve3dToBezier ();
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets mode for conversion Geom_Line to bezier.") SetLineMode;
		void SetLineMode (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Geom_Line conversion mode.") GetLineMode;
		Standard_Boolean GetLineMode ();
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets mode for conversion Geom_Circle to bezier.") SetCircleMode;
		void SetCircleMode (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Geom_Circle conversion mode.") GetCircleMode;
		Standard_Boolean GetCircleMode ();
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Returns the Geom_Conic conversion mode.") SetConicMode;
		void SetConicMode (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Performs converting and computes the resulting shape.") GetConicMode;
		Standard_Boolean GetConicMode ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Converts curve into a list of beziers, and stores the  
         splitting parameters on original curve.") Compute;
		virtual void Compute ();
		%feature("autodoc", "Args:
	Segment(Standard_Boolean)

Returns:
	virtual void

Splits a list of beziers computed by Compute method according  
         the split values and splitting parameters.") Build;
		virtual void Build (const Standard_Boolean Segment);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfReal

Returns the list of splitted parameters in original curve  
         parametrisation.") SplitParams;
		Handle_TColStd_HSequenceOfReal SplitParams ();
};


%feature("shadow") ShapeUpgrade_ConvertCurve3dToBezier::~ShapeUpgrade_ConvertCurve3dToBezier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_ConvertCurve3dToBezier {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_ConvertCurve3dToBezier {
	Handle_ShapeUpgrade_ConvertCurve3dToBezier GetHandle() {
	return *(Handle_ShapeUpgrade_ConvertCurve3dToBezier*) &$self;
	}
};

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
    ShapeUpgrade_ConvertCurve3dToBezier* GetObject() {
    return (ShapeUpgrade_ConvertCurve3dToBezier*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_ConvertCurve3dToBezier::~Handle_ShapeUpgrade_ConvertCurve3dToBezier %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_ConvertCurve3dToBezier {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_FaceDivideArea;
class ShapeUpgrade_FaceDivideArea : public ShapeUpgrade_FaceDivide {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates empty  constructor.") ShapeUpgrade_FaceDivideArea;
		 ShapeUpgrade_FaceDivideArea ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") ShapeUpgrade_FaceDivideArea;
		 ShapeUpgrade_FaceDivideArea (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Performs splitting and computes the resulting shell  
         The context is used to keep track of former splittings") Perform;
		virtual Standard_Boolean Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

//!Set max area allowed for faces") MaxArea;
		Standard_Real & MaxArea ();
};


%feature("shadow") ShapeUpgrade_FaceDivideArea::~ShapeUpgrade_FaceDivideArea %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_FaceDivideArea {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_FaceDivideArea {
	Handle_ShapeUpgrade_FaceDivideArea GetHandle() {
	return *(Handle_ShapeUpgrade_FaceDivideArea*) &$self;
	}
};

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
    ShapeUpgrade_FaceDivideArea* GetObject() {
    return (ShapeUpgrade_FaceDivideArea*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_FaceDivideArea::~Handle_ShapeUpgrade_FaceDivideArea %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_FaceDivideArea {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_FixSmallBezierCurves;
class ShapeUpgrade_FixSmallBezierCurves : public ShapeUpgrade_FixSmallCurves {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ShapeUpgrade_FixSmallBezierCurves;
		 ShapeUpgrade_FixSmallBezierCurves ();
		%feature("autodoc", "Args:
	Curve3d(Handle_Geom_Curve)
	Curve2d(Handle_Geom2d_Curve)
	Curve2dR(Handle_Geom2d_Curve)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Approx;
		virtual Standard_Boolean Approx (Handle_Geom_Curve & Curve3d,Handle_Geom2d_Curve & Curve2d,Handle_Geom2d_Curve & Curve2dR,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") ShapeUpgrade_FixSmallBezierCurves::~ShapeUpgrade_FixSmallBezierCurves %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_FixSmallBezierCurves {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_FixSmallBezierCurves {
	Handle_ShapeUpgrade_FixSmallBezierCurves GetHandle() {
	return *(Handle_ShapeUpgrade_FixSmallBezierCurves*) &$self;
	}
};

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
    ShapeUpgrade_FixSmallBezierCurves* GetObject() {
    return (ShapeUpgrade_FixSmallBezierCurves*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_FixSmallBezierCurves::~Handle_ShapeUpgrade_FixSmallBezierCurves %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_FixSmallBezierCurves {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_SplitCurve2dContinuity;
class ShapeUpgrade_SplitCurve2dContinuity : public ShapeUpgrade_SplitCurve2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ShapeUpgrade_SplitCurve2dContinuity;
		 ShapeUpgrade_SplitCurve2dContinuity ();
		%feature("autodoc", "Args:
	Criterion(GeomAbs_Shape)

Returns:
	None

Sets criterion for splitting.") SetCriterion;
		void SetCriterion (const GeomAbs_Shape Criterion);
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

Sets tolerance.") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Calculates points for correction/splitting of the curve") Compute;
		virtual void Compute ();
};


%feature("shadow") ShapeUpgrade_SplitCurve2dContinuity::~ShapeUpgrade_SplitCurve2dContinuity %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_SplitCurve2dContinuity {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_SplitCurve2dContinuity {
	Handle_ShapeUpgrade_SplitCurve2dContinuity GetHandle() {
	return *(Handle_ShapeUpgrade_SplitCurve2dContinuity*) &$self;
	}
};

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
    ShapeUpgrade_SplitCurve2dContinuity* GetObject() {
    return (ShapeUpgrade_SplitCurve2dContinuity*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_SplitCurve2dContinuity::~Handle_ShapeUpgrade_SplitCurve2dContinuity %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_SplitCurve2dContinuity {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ShapeUpgrade_SplitCurve3dContinuity;
class ShapeUpgrade_SplitCurve3dContinuity : public ShapeUpgrade_SplitCurve3d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ShapeUpgrade_SplitCurve3dContinuity;
		 ShapeUpgrade_SplitCurve3dContinuity ();
		%feature("autodoc", "Args:
	Criterion(GeomAbs_Shape)

Returns:
	None

Sets criterion for splitting.") SetCriterion;
		void SetCriterion (const GeomAbs_Shape Criterion);
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

Sets tolerance.") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Calculates points for correction/splitting of the curve") Compute;
		virtual void Compute ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") GetCurve;
		const Handle_Geom_Curve & GetCurve ();
};


%feature("shadow") ShapeUpgrade_SplitCurve3dContinuity::~ShapeUpgrade_SplitCurve3dContinuity %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeUpgrade_SplitCurve3dContinuity {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ShapeUpgrade_SplitCurve3dContinuity {
	Handle_ShapeUpgrade_SplitCurve3dContinuity GetHandle() {
	return *(Handle_ShapeUpgrade_SplitCurve3dContinuity*) &$self;
	}
};

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
    ShapeUpgrade_SplitCurve3dContinuity* GetObject() {
    return (ShapeUpgrade_SplitCurve3dContinuity*)$self->Access();
    }
};
%feature("shadow") Handle_ShapeUpgrade_SplitCurve3dContinuity::~Handle_ShapeUpgrade_SplitCurve3dContinuity %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ShapeUpgrade_SplitCurve3dContinuity {
    void _kill_pointed() {
        delete $self;
    }
};

