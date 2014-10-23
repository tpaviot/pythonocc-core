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
%module (package="OCC") BRepTopAdaptor

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

%include BRepTopAdaptor_headers.i

/* typedefs */
typedef TColStd_SequenceOfAddress BRepTopAdaptor_SeqOfPtr;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool;
class BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool;
		 BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool ();
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepTopAdaptor_MapOfShapeTool &
	:rtype: None
") BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool;
		 BRepTopAdaptor_DataMapIteratorOfMapOfShapeTool (const BRepTopAdaptor_MapOfShapeTool & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepTopAdaptor_MapOfShapeTool &
	:rtype: None
") Initialize;
		void Initialize (const BRepTopAdaptor_MapOfShapeTool & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "	:rtype: BRepTopAdaptor_Tool
") Value;
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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: BRepTopAdaptor_Tool &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepTopAdaptor_DataMapNodeOfMapOfShapeTool;
		 BRepTopAdaptor_DataMapNodeOfMapOfShapeTool (const TopoDS_Shape & K,const BRepTopAdaptor_Tool & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "	:rtype: BRepTopAdaptor_Tool
") Value;
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
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param Tol:
	:type Tol: float
	:rtype: None
") BRepTopAdaptor_FClass2d;
		 BRepTopAdaptor_FClass2d (const TopoDS_Face & F,const Standard_Real Tol);
		%feature("autodoc", "	:rtype: TopAbs_State
") PerformInfinitePoint;
		TopAbs_State PerformInfinitePoint ();
		%feature("autodoc", "	:param Puv:
	:type Puv: gp_Pnt2d
	:param RecadreOnPeriodic: default value is Standard_True
	:type RecadreOnPeriodic: bool
	:rtype: TopAbs_State
") Perform;
		TopAbs_State Perform (const gp_Pnt2d & Puv,const Standard_Boolean RecadreOnPeriodic = Standard_True);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:param Other:
	:type Other: BRepTopAdaptor_FClass2d &
	:rtype: BRepTopAdaptor_FClass2d
") Copy;
		const BRepTopAdaptor_FClass2d & Copy (const BRepTopAdaptor_FClass2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: BRepTopAdaptor_FClass2d &
	:rtype: BRepTopAdaptor_FClass2d
") operator=;
		const BRepTopAdaptor_FClass2d & operator = (const BRepTopAdaptor_FClass2d & Other);
		%feature("autodoc", "	* Test a point with +- an offset (Tol) and returns On if some points are OUT an some are IN (Caution: Internal use . see the code for more details)

	:param Puv:
	:type Puv: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:param RecadreOnPeriodic: default value is Standard_True
	:type RecadreOnPeriodic: bool
	:rtype: TopAbs_State
") TestOnRestriction;
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
		%feature("autodoc", "	:param Vtx:
	:type Vtx: TopoDS_Vertex &
	:param Curve:
	:type Curve: Handle_BRepAdaptor_HCurve2d &
	:rtype: None
") BRepTopAdaptor_HVertex;
		 BRepTopAdaptor_HVertex (const TopoDS_Vertex & Vtx,const Handle_BRepAdaptor_HCurve2d & Curve);
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex & Vertex ();
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") ChangeVertex;
		TopoDS_Vertex & ChangeVertex ();
		%feature("autodoc", "	:rtype: gp_Pnt2d
") Value;
		virtual gp_Pnt2d Value ();
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Parameter;
		virtual Standard_Real Parameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	* Parametric resolution (2d).

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Resolution;
		virtual Standard_Real Resolution (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		virtual TopAbs_Orientation Orientation ();
		%feature("autodoc", "	:param Other:
	:type Other: Handle_Adaptor3d_HVertex &
	:rtype: bool
") IsSame;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") BRepTopAdaptor_MapOfShapeTool;
		 BRepTopAdaptor_MapOfShapeTool (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: BRepTopAdaptor_MapOfShapeTool &
	:rtype: BRepTopAdaptor_MapOfShapeTool
") Assign;
		BRepTopAdaptor_MapOfShapeTool & Assign (const BRepTopAdaptor_MapOfShapeTool & Other);
		%feature("autodoc", "	:param Other:
	:type Other: BRepTopAdaptor_MapOfShapeTool &
	:rtype: BRepTopAdaptor_MapOfShapeTool
") operator=;
		BRepTopAdaptor_MapOfShapeTool & operator = (const BRepTopAdaptor_MapOfShapeTool & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: BRepTopAdaptor_Tool &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const BRepTopAdaptor_Tool & I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: BRepTopAdaptor_Tool
") Find;
		const BRepTopAdaptor_Tool & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: BRepTopAdaptor_Tool
") ChangeFind;
		BRepTopAdaptor_Tool & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
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
		%feature("autodoc", "	:rtype: None
") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool ();
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param Tol2d:
	:type Tol2d: float
	:rtype: None
") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool (const TopoDS_Face & F,const Standard_Real Tol2d);
		%feature("autodoc", "	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:param Tol2d:
	:type Tol2d: float
	:rtype: None
") BRepTopAdaptor_Tool;
		 BRepTopAdaptor_Tool (const Handle_Adaptor3d_HSurface & Surface,const Standard_Real Tol2d);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param Tol2d:
	:type Tol2d: float
	:rtype: None
") Init;
		void Init (const TopoDS_Face & F,const Standard_Real Tol2d);
		%feature("autodoc", "	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:param Tol2d:
	:type Tol2d: float
	:rtype: None
") Init;
		void Init (const Handle_Adaptor3d_HSurface & Surface,const Standard_Real Tol2d);
		%feature("autodoc", "	:rtype: Handle_BRepTopAdaptor_TopolTool
") GetTopolTool;
		Handle_BRepTopAdaptor_TopolTool GetTopolTool ();
		%feature("autodoc", "	:param TT:
	:type TT: Handle_BRepTopAdaptor_TopolTool &
	:rtype: None
") SetTopolTool;
		void SetTopolTool (const Handle_BRepTopAdaptor_TopolTool & TT);
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") GetSurface;
		Handle_Adaptor3d_HSurface GetSurface ();
		%feature("autodoc", "	:rtype: None
") Destroy;
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
		%feature("autodoc", "	:rtype: None
") BRepTopAdaptor_TopolTool;
		 BRepTopAdaptor_TopolTool ();
		%feature("autodoc", "	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:rtype: None
") BRepTopAdaptor_TopolTool;
		 BRepTopAdaptor_TopolTool (const Handle_Adaptor3d_HSurface & Surface);
		%feature("autodoc", "	:rtype: void
") Initialize;
		virtual void Initialize ();
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: void
") Initialize;
		virtual void Initialize (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor2d_HCurve2d &
	:rtype: void
") Initialize;
		virtual void Initialize (const Handle_Adaptor2d_HCurve2d & Curve);
		%feature("autodoc", "	:rtype: void
") Init;
		virtual void Init ();
		%feature("autodoc", "	:rtype: bool
") More;
		virtual Standard_Boolean More ();
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Value;
		virtual Handle_Adaptor2d_HCurve2d Value ();
		%feature("autodoc", "	:rtype: void
") Next;
		virtual void Next ();
		%feature("autodoc", "	:rtype: Standard_Address
") Edge;
		virtual Standard_Address Edge ();
		%feature("autodoc", "	:rtype: void
") InitVertexIterator;
		virtual void InitVertexIterator ();
		%feature("autodoc", "	:rtype: bool
") MoreVertex;
		virtual Standard_Boolean MoreVertex ();
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HVertex
") Vertex;
		virtual Handle_Adaptor3d_HVertex Vertex ();
		%feature("autodoc", "	:rtype: void
") NextVertex;
		virtual void NextVertex ();
		%feature("autodoc", "	:param P2d:
	:type P2d: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:param RecadreOnPeriodic: default value is Standard_True
	:type RecadreOnPeriodic: bool
	:rtype: TopAbs_State
") Classify;
		virtual TopAbs_State Classify (const gp_Pnt2d & P2d,const Standard_Real Tol,const Standard_Boolean RecadreOnPeriodic = Standard_True);
		%feature("autodoc", "	* see the code for specifications)

	:param P2d:
	:type P2d: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:param RecadreOnPeriodic: default value is Standard_True
	:type RecadreOnPeriodic: bool
	:rtype: bool
") IsThePointOn;
		virtual Standard_Boolean IsThePointOn (const gp_Pnt2d & P2d,const Standard_Real Tol,const Standard_Boolean RecadreOnPeriodic = Standard_True);
		%feature("autodoc", "	* If the function returns the orientation of the arc. If the orientation is FORWARD or REVERSED, the arc is a 'real' limit of the surface. If the orientation is INTERNAL or EXTERNAL, the arc is considered as an arc on the surface.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: TopAbs_Orientation
") Orientation;
		virtual TopAbs_Orientation Orientation (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	* If the function returns the orientation of the arc. If the orientation is FORWARD or REVERSED, the arc is a 'real' limit of the surface. If the orientation is INTERNAL or EXTERNAL, the arc is considered as an arc on the surface.

	:param C:
	:type C: Handle_Adaptor3d_HVertex &
	:rtype: TopAbs_Orientation
") Orientation;
		virtual TopAbs_Orientation Orientation (const Handle_Adaptor3d_HVertex & C);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	* answers if arcs and vertices may have 3d representations, so that we could use Tol3d and Pnt methods.

	:rtype: bool
") Has3d;
		virtual Standard_Boolean Has3d ();
		%feature("autodoc", "	* returns 3d tolerance of the arc C

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Tol3d;
		virtual Standard_Real Tol3d (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	* returns 3d tolerance of the vertex V

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:rtype: float
") Tol3d;
		virtual Standard_Real Tol3d (const Handle_Adaptor3d_HVertex & V);
		%feature("autodoc", "	* returns 3d point of the vertex V

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:rtype: gp_Pnt
") Pnt;
		virtual gp_Pnt Pnt (const Handle_Adaptor3d_HVertex & V);
		%feature("autodoc", "	:rtype: void
") ComputeSamplePoints;
		virtual void ComputeSamplePoints ();
		%feature("autodoc", "	* compute the sample-points for the intersections algorithms

	:rtype: int
") NbSamplesU;
		virtual Standard_Integer NbSamplesU ();
		%feature("autodoc", "	* compute the sample-points for the intersections algorithms

	:rtype: int
") NbSamplesV;
		virtual Standard_Integer NbSamplesV ();
		%feature("autodoc", "	* compute the sample-points for the intersections algorithms

	:rtype: int
") NbSamples;
		virtual Standard_Integer NbSamples ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param P2d:
	:type P2d: gp_Pnt2d
	:param P3d:
	:type P3d: gp_Pnt
	:rtype: void
") SamplePoint;
		virtual void SamplePoint (const Standard_Integer Index,gp_Pnt2d & P2d,gp_Pnt & P3d);
		%feature("autodoc", "	:rtype: bool
") DomainIsInfinite;
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

