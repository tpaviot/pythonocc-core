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
%module BRepTopAdaptor

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

%include BRepTopAdaptor_required_python_modules.i
%include BRepTopAdaptor_headers.i

/* typedefs */
typedef TColStd_SequenceOfAddress BRepTopAdaptor_SeqOfPtr;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool;
class BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool;
		 BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool ();
		%feature("autodoc", "Args:
	aMap(BRepTopAdaptor_MapOfShapeTool)

Returns:
	None

No detailed docstring for this function.") BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool;
		 BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool (const BRepTopAdaptor_MapOfShapeTool & aMap);
		%feature("autodoc", "Args:
	aMap(BRepTopAdaptor_MapOfShapeTool)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepTopAdaptor_MapOfShapeTool & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepTopAdaptor_Tool

No detailed docstring for this function.") Value;
		const BRepTopAdaptor_Tool & Value ();
};


%feature("shadow") BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool::~BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepTopAdaptor_DataMapNodeOfMapOfShapeTool;
class BRepTopAdaptor_DataMapNodeOfMapOfShapeTool : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(BRepTopAdaptor_Tool)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepTopAdaptor_DataMapNodeOfMapOfShapeTool;
		 BRepTopAdaptor_DataMapNodeOfMapOfShapeTool (const TopoDS_Shape & K,const BRepTopAdaptor_Tool & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepTopAdaptor_Tool

No detailed docstring for this function.") Value;
		BRepTopAdaptor_Tool & Value ();
};


%feature("shadow") BRepTopAdaptor_DataMapNodeOfMapOfShapeTool::~BRepTopAdaptor_DataMapNodeOfMapOfShapeTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTopAdaptor_DataMapNodeOfMapOfShapeTool {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepTopAdaptor_DataMapNodeOfMapOfShapeTool {
	Handle_BRepTopAdaptor_DataMapNodeOfMapOfShapeTool GetHandle() {
	return *(Handle_BRepTopAdaptor_DataMapNodeOfMapOfShapeTool*) &$self;
	}
};

%nodefaultctor Handle_BRepTopAdaptor_DataMapNodeOfMapOfShapeTool;
class Handle_BRepTopAdaptor_DataMapNodeOfMapOfShapeTool : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepTopAdaptor_DataMapNodeOfMapOfShapeTool();
        Handle_BRepTopAdaptor_DataMapNodeOfMapOfShapeTool(const Handle_BRepTopAdaptor_DataMapNodeOfMapOfShapeTool &aHandle);
        Handle_BRepTopAdaptor_DataMapNodeOfMapOfShapeTool(const BRepTopAdaptor_DataMapNodeOfMapOfShapeTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepTopAdaptor_DataMapNodeOfMapOfShapeTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepTopAdaptor_DataMapNodeOfMapOfShapeTool {
    BRepTopAdaptor_DataMapNodeOfMapOfShapeTool* GetObject() {
    return (BRepTopAdaptor_DataMapNodeOfMapOfShapeTool*)$self->Access();
    }
};
%feature("shadow") Handle_BRepTopAdaptor_DataMapNodeOfMapOfShapeTool::~Handle_BRepTopAdaptor_DataMapNodeOfMapOfShapeTool %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepTopAdaptor_DataMapNodeOfMapOfShapeTool {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepTopAdaptor_FClass2d;
class BRepTopAdaptor_FClass2d {
	public:
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepTopAdaptor_FClass2d;
		 BRepTopAdaptor_FClass2d (const TopoDS_Face & F,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") PerformInfinitePoint;
		TopAbs_State PerformInfinitePoint ();
		%feature("autodoc", "Args:
	Puv(gp_Pnt2d)
	RecadreOnPeriodic(Standard_Boolean)=Standard_True

Returns:
	TopAbs_State

No detailed docstring for this function.") Perform;
		TopAbs_State Perform (const gp_Pnt2d & Puv,const Standard_Boolean RecadreOnPeriodic = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(BRepTopAdaptor_FClass2d)

Returns:
	BRepTopAdaptor_FClass2d

No detailed docstring for this function.") Copy;
		const BRepTopAdaptor_FClass2d & Copy (const BRepTopAdaptor_FClass2d & Other);
		%feature("autodoc", "Args:
	Other(BRepTopAdaptor_FClass2d)

Returns:
	BRepTopAdaptor_FClass2d

No detailed docstring for this function.") operator=;
		const BRepTopAdaptor_FClass2d & operator = (const BRepTopAdaptor_FClass2d & Other);
		%feature("autodoc", "Args:
	Puv(gp_Pnt2d)
	Tol(Standard_Real)
	RecadreOnPeriodic(Standard_Boolean)=Standard_True

Returns:
	TopAbs_State

Test a point with +- an offset (Tol) and returns  
         On if some points are OUT an some are IN  
         (Caution: Internal use . see the code for more details)") TestOnRestriction;
		TopAbs_State TestOnRestriction (const gp_Pnt2d & Puv,const Standard_Real Tol,const Standard_Boolean RecadreOnPeriodic = Standard_True);
};


%feature("shadow") BRepTopAdaptor_FClass2d::~BRepTopAdaptor_FClass2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTopAdaptor_FClass2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepTopAdaptor_HVertex;
class BRepTopAdaptor_HVertex : public Adaptor3d_HVertex {
	public:
		%feature("autodoc", "Args:
	Vtx(TopoDS_Vertex)
	Curve(Handle_BRepAdaptor_HCurve2d)

Returns:
	None

No detailed docstring for this function.") BRepTopAdaptor_HVertex;
		 BRepTopAdaptor_HVertex (const TopoDS_Vertex & Vtx,const Handle_BRepAdaptor_HCurve2d & Curve);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") Vertex;
		const TopoDS_Vertex & Vertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") ChangeVertex;
		TopoDS_Vertex & ChangeVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Pnt2d

No detailed docstring for this function.") Value;
		virtual gp_Pnt2d Value ();
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	virtual Standard_Real

No detailed docstring for this function.") Parameter;
		virtual Standard_Real Parameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	virtual Standard_Real

Parametric resolution (2d).") Resolution;
		virtual Standard_Real Resolution (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		virtual TopAbs_Orientation Orientation ();
		%feature("autodoc", "Args:
	Other(Handle_Adaptor3d_HVertex)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsSame;
		virtual Standard_Boolean IsSame (const Handle_Adaptor3d_HVertex & Other);
};


%feature("shadow") BRepTopAdaptor_HVertex::~BRepTopAdaptor_HVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTopAdaptor_HVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepTopAdaptor_HVertex {
	Handle_BRepTopAdaptor_HVertex GetHandle() {
	return *(Handle_BRepTopAdaptor_HVertex*) &$self;
	}
};

%nodefaultctor Handle_BRepTopAdaptor_HVertex;
class Handle_BRepTopAdaptor_HVertex : public Handle_Adaptor3d_HVertex {

    public:
        // constructors
        Handle_BRepTopAdaptor_HVertex();
        Handle_BRepTopAdaptor_HVertex(const Handle_BRepTopAdaptor_HVertex &aHandle);
        Handle_BRepTopAdaptor_HVertex(const BRepTopAdaptor_HVertex *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepTopAdaptor_HVertex DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepTopAdaptor_HVertex {
    BRepTopAdaptor_HVertex* GetObject() {
    return (BRepTopAdaptor_HVertex*)$self->Access();
    }
};
%feature("shadow") Handle_BRepTopAdaptor_HVertex::~Handle_BRepTopAdaptor_HVertex %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepTopAdaptor_HVertex {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepTopAdaptor_MapOfShapeTool;
class BRepTopAdaptor_MapOfShapeTool : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepTopAdaptor_MapOfShapeTool;
		 BRepTopAdaptor_MapOfShapeTool (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepTopAdaptor_MapOfShapeTool)

Returns:
	BRepTopAdaptor_MapOfShapeTool

No detailed docstring for this function.") Assign;
		BRepTopAdaptor_MapOfShapeTool & Assign (const BRepTopAdaptor_MapOfShapeTool & Other);
		%feature("autodoc", "Args:
	Other(BRepTopAdaptor_MapOfShapeTool)

Returns:
	BRepTopAdaptor_MapOfShapeTool

No detailed docstring for this function.") operator=;
		BRepTopAdaptor_MapOfShapeTool & operator = (const BRepTopAdaptor_MapOfShapeTool & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(BRepTopAdaptor_Tool)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const BRepTopAdaptor_Tool & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	BRepTopAdaptor_Tool

No detailed docstring for this function.") Find;
		const BRepTopAdaptor_Tool & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	BRepTopAdaptor_Tool

No detailed docstring for this function.") ChangeFind;
		BRepTopAdaptor_Tool & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") BRepTopAdaptor_MapOfShapeTool::~BRepTopAdaptor_MapOfShapeTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTopAdaptor_MapOfShapeTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepTopAdaptor_Tool;
class BRepTopAdaptor_Tool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Tol2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool (const TopoDS_Face & F,const Standard_Real Tol2d);
		%feature("autodoc", "Args:
	Surface(Handle_Adaptor3d_HSurface)
	Tol2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool (const Handle_Adaptor3d_HSurface & Surface,const Standard_Real Tol2d);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Tol2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Face & F,const Standard_Real Tol2d);
		%feature("autodoc", "Args:
	Surface(Handle_Adaptor3d_HSurface)
	Tol2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Adaptor3d_HSurface & Surface,const Standard_Real Tol2d);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepTopAdaptor_TopolTool

No detailed docstring for this function.") GetTopolTool;
		Handle_BRepTopAdaptor_TopolTool GetTopolTool ();
		%feature("autodoc", "Args:
	TT(Handle_BRepTopAdaptor_TopolTool)

Returns:
	None

No detailed docstring for this function.") SetTopolTool;
		void SetTopolTool (const Handle_BRepTopAdaptor_TopolTool & TT);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HSurface

No detailed docstring for this function.") GetSurface;
		Handle_Adaptor3d_HSurface GetSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
};


%feature("shadow") BRepTopAdaptor_Tool::~BRepTopAdaptor_Tool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTopAdaptor_Tool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepTopAdaptor_TopolTool;
class BRepTopAdaptor_TopolTool : public Adaptor3d_TopolTool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepTopAdaptor_TopolTool;
		 BRepTopAdaptor_TopolTool ();
		%feature("autodoc", "Args:
	Surface(Handle_Adaptor3d_HSurface)

Returns:
	None

No detailed docstring for this function.") BRepTopAdaptor_TopolTool;
		 BRepTopAdaptor_TopolTool (const Handle_Adaptor3d_HSurface & Surface);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Initialize;
		virtual void Initialize ();
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	virtual void

No detailed docstring for this function.") Initialize;
		virtual void Initialize (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	Curve(Handle_Adaptor2d_HCurve2d)

Returns:
	virtual void

No detailed docstring for this function.") Initialize;
		virtual void Initialize (const Handle_Adaptor2d_HCurve2d & Curve);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Init;
		virtual void Init ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") More;
		virtual Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Adaptor2d_HCurve2d

No detailed docstring for this function.") Value;
		virtual Handle_Adaptor2d_HCurve2d Value ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Next;
		virtual void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Address

No detailed docstring for this function.") Edge;
		virtual Standard_Address Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") InitVertexIterator;
		virtual void InitVertexIterator ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") MoreVertex;
		virtual Standard_Boolean MoreVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Adaptor3d_HVertex

No detailed docstring for this function.") Vertex;
		virtual Handle_Adaptor3d_HVertex Vertex ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") NextVertex;
		virtual void NextVertex ();
		%feature("autodoc", "Args:
	P2d(gp_Pnt2d)
	Tol(Standard_Real)
	RecadreOnPeriodic(Standard_Boolean)=Standard_True

Returns:
	virtual TopAbs_State

No detailed docstring for this function.") Classify;
		virtual TopAbs_State Classify (const gp_Pnt2d & P2d,const Standard_Real Tol,const Standard_Boolean RecadreOnPeriodic = Standard_True);
		%feature("autodoc", "Args:
	P2d(gp_Pnt2d)
	Tol(Standard_Real)
	RecadreOnPeriodic(Standard_Boolean)=Standard_True

Returns:
	virtual Standard_Boolean

see the code for specifications)") IsThePointOn;
		virtual Standard_Boolean IsThePointOn (const gp_Pnt2d & P2d,const Standard_Real Tol,const Standard_Boolean RecadreOnPeriodic = Standard_True);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	virtual TopAbs_Orientation

If the function returns the orientation of the arc.  
         If the orientation is FORWARD or REVERSED, the arc is  
         a 'real' limit of the surface.  
         If the orientation is INTERNAL or EXTERNAL, the arc is  
         considered as an arc on the surface.") Orientation;
		virtual TopAbs_Orientation Orientation (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HVertex)

Returns:
	virtual TopAbs_Orientation

If the function returns the orientation of the arc.  
         If the orientation is FORWARD or REVERSED, the arc is  
         a 'real' limit of the surface.  
         If the orientation is INTERNAL or EXTERNAL, the arc is  
         considered as an arc on the surface.") Orientation;
		virtual TopAbs_Orientation Orientation (const Handle_Adaptor3d_HVertex & C);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

answers if arcs and vertices may have 3d representations,  
         so that we could use Tol3d and Pnt methods.") Has3d;
		virtual Standard_Boolean Has3d ();
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	virtual Standard_Real

returns 3d tolerance of the arc C") Tol3d;
		virtual Standard_Real Tol3d (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	V(Handle_Adaptor3d_HVertex)

Returns:
	virtual Standard_Real

returns 3d tolerance of the vertex V") Tol3d;
		virtual Standard_Real Tol3d (const Handle_Adaptor3d_HVertex & V);
		%feature("autodoc", "Args:
	V(Handle_Adaptor3d_HVertex)

Returns:
	virtual gp_Pnt

returns 3d point of the vertex V") Pnt;
		virtual gp_Pnt Pnt (const Handle_Adaptor3d_HVertex & V);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") ComputeSamplePoints;
		virtual void ComputeSamplePoints ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

compute the sample-points for the intersections algorithms") NbSamplesU;
		virtual Standard_Integer NbSamplesU ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

compute the sample-points for the intersections algorithms") NbSamplesV;
		virtual Standard_Integer NbSamplesV ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

compute the sample-points for the intersections algorithms") NbSamples;
		virtual Standard_Integer NbSamples ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P2d(gp_Pnt2d)
	P3d(gp_Pnt)

Returns:
	virtual void

No detailed docstring for this function.") SamplePoint;
		virtual void SamplePoint (const Standard_Integer Index,gp_Pnt2d & P2d,gp_Pnt & P3d);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") DomainIsInfinite;
		virtual Standard_Boolean DomainIsInfinite ();
};


%feature("shadow") BRepTopAdaptor_TopolTool::~BRepTopAdaptor_TopolTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTopAdaptor_TopolTool {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepTopAdaptor_TopolTool {
	Handle_BRepTopAdaptor_TopolTool GetHandle() {
	return *(Handle_BRepTopAdaptor_TopolTool*) &$self;
	}
};

%nodefaultctor Handle_BRepTopAdaptor_TopolTool;
class Handle_BRepTopAdaptor_TopolTool : public Handle_Adaptor3d_TopolTool {

    public:
        // constructors
        Handle_BRepTopAdaptor_TopolTool();
        Handle_BRepTopAdaptor_TopolTool(const Handle_BRepTopAdaptor_TopolTool &aHandle);
        Handle_BRepTopAdaptor_TopolTool(const BRepTopAdaptor_TopolTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepTopAdaptor_TopolTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepTopAdaptor_TopolTool {
    BRepTopAdaptor_TopolTool* GetObject() {
    return (BRepTopAdaptor_TopolTool*)$self->Access();
    }
};
%feature("shadow") Handle_BRepTopAdaptor_TopolTool::~Handle_BRepTopAdaptor_TopolTool %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepTopAdaptor_TopolTool {
    void _kill_pointed() {
        delete $self;
    }
};

