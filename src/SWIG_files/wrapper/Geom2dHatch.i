/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") Geom2dHatch

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

%pythoncode {
import OCC.GarbageCollector
};

%include Geom2dHatch_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor Geom2dHatch_ClassifierOfHatcher;
class Geom2dHatch_ClassifierOfHatcher {
	public:
		%feature("compactdefaultargs") Geom2dHatch_ClassifierOfHatcher;
		%feature("autodoc", "	:rtype: None
") Geom2dHatch_ClassifierOfHatcher;
		 Geom2dHatch_ClassifierOfHatcher ();
		%feature("compactdefaultargs") Geom2dHatch_ClassifierOfHatcher;
		%feature("autodoc", "	:param F:
	:type F: Geom2dHatch_ElementsOfHatcher &
	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dHatch_ClassifierOfHatcher;
		 Geom2dHatch_ClassifierOfHatcher (Geom2dHatch_ElementsOfHatcher & F,const gp_Pnt2d & P,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param F:
	:type F: Geom2dHatch_ElementsOfHatcher &
	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (Geom2dHatch_ElementsOfHatcher & F,const gp_Pnt2d & P,const Standard_Real Tol);
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("compactdefaultargs") Rejected;
		%feature("autodoc", "	:rtype: bool
") Rejected;
		Standard_Boolean Rejected ();
		%feature("compactdefaultargs") NoWires;
		%feature("autodoc", "	:rtype: bool
") NoWires;
		Standard_Boolean NoWires ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: Geom2dAdaptor_Curve
") Edge;
		const Geom2dAdaptor_Curve & Edge ();
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "	:rtype: float
") EdgeParameter;
		Standard_Real EdgeParameter ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	:rtype: IntRes2d_Position
") Position;
		IntRes2d_Position Position ();
};


%feature("shadow") Geom2dHatch_ClassifierOfHatcher::~Geom2dHatch_ClassifierOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dHatch_ClassifierOfHatcher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher;
class Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher;
		%feature("autodoc", "	:rtype: None
") Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher;
		 Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher ();
		%feature("compactdefaultargs") Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher;
		%feature("autodoc", "	:param aMap:
	:type aMap: Geom2dHatch_HatchingsOfHatcher &
	:rtype: None
") Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher;
		 Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher (const Geom2dHatch_HatchingsOfHatcher & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: Geom2dHatch_HatchingsOfHatcher &
	:rtype: None
") Initialize;
		void Initialize (const Geom2dHatch_HatchingsOfHatcher & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Geom2dHatch_HatchingOfHatcher
") Value;
		const Geom2dHatch_HatchingOfHatcher & Value ();
};


%feature("shadow") Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher::~Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher;
class Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher;
		%feature("autodoc", "	:rtype: None
") Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher;
		 Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher ();
		%feature("compactdefaultargs") Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher;
		%feature("autodoc", "	:param aMap:
	:type aMap: Geom2dHatch_MapOfElementsOfElementsOfHatcher &
	:rtype: None
") Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher;
		 Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher (const Geom2dHatch_MapOfElementsOfElementsOfHatcher & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: Geom2dHatch_MapOfElementsOfElementsOfHatcher &
	:rtype: None
") Initialize;
		void Initialize (const Geom2dHatch_MapOfElementsOfElementsOfHatcher & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Geom2dHatch_ElementOfHatcher
") Value;
		const Geom2dHatch_ElementOfHatcher & Value ();
};


%feature("shadow") Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher::~Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dHatch_DataMapNodeOfHatchingsOfHatcher;
class Geom2dHatch_DataMapNodeOfHatchingsOfHatcher : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Geom2dHatch_DataMapNodeOfHatchingsOfHatcher;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Geom2dHatch_HatchingOfHatcher &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Geom2dHatch_DataMapNodeOfHatchingsOfHatcher;
		 Geom2dHatch_DataMapNodeOfHatchingsOfHatcher (const Standard_Integer & K,const Geom2dHatch_HatchingOfHatcher & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Geom2dHatch_HatchingOfHatcher
") Value;
		Geom2dHatch_HatchingOfHatcher & Value ();
};


%feature("shadow") Geom2dHatch_DataMapNodeOfHatchingsOfHatcher::~Geom2dHatch_DataMapNodeOfHatchingsOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dHatch_DataMapNodeOfHatchingsOfHatcher {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom2dHatch_DataMapNodeOfHatchingsOfHatcher {
	Handle_Geom2dHatch_DataMapNodeOfHatchingsOfHatcher GetHandle() {
	return *(Handle_Geom2dHatch_DataMapNodeOfHatchingsOfHatcher*) &$self;
	}
};

%nodefaultctor Handle_Geom2dHatch_DataMapNodeOfHatchingsOfHatcher;
class Handle_Geom2dHatch_DataMapNodeOfHatchingsOfHatcher : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Geom2dHatch_DataMapNodeOfHatchingsOfHatcher();
        Handle_Geom2dHatch_DataMapNodeOfHatchingsOfHatcher(const Handle_Geom2dHatch_DataMapNodeOfHatchingsOfHatcher &aHandle);
        Handle_Geom2dHatch_DataMapNodeOfHatchingsOfHatcher(const Geom2dHatch_DataMapNodeOfHatchingsOfHatcher *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom2dHatch_DataMapNodeOfHatchingsOfHatcher DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom2dHatch_DataMapNodeOfHatchingsOfHatcher {
    Geom2dHatch_DataMapNodeOfHatchingsOfHatcher* GetObject() {
    return (Geom2dHatch_DataMapNodeOfHatchingsOfHatcher*)$self->Access();
    }
};
%feature("shadow") Handle_Geom2dHatch_DataMapNodeOfHatchingsOfHatcher::~Handle_Geom2dHatch_DataMapNodeOfHatchingsOfHatcher %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom2dHatch_DataMapNodeOfHatchingsOfHatcher {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher;
class Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Geom2dHatch_ElementOfHatcher &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher;
		 Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher (const Standard_Integer & K,const Geom2dHatch_ElementOfHatcher & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Geom2dHatch_ElementOfHatcher
") Value;
		Geom2dHatch_ElementOfHatcher & Value ();
};


%feature("shadow") Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher::~Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher {
	Handle_Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher GetHandle() {
	return *(Handle_Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher*) &$self;
	}
};

%nodefaultctor Handle_Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher;
class Handle_Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher();
        Handle_Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher(const Handle_Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher &aHandle);
        Handle_Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher(const Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher {
    Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher* GetObject() {
    return (Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher*)$self->Access();
    }
};
%feature("shadow") Handle_Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher::~Handle_Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom2dHatch_ElementOfHatcher;
class Geom2dHatch_ElementOfHatcher {
	public:
		%feature("compactdefaultargs") Geom2dHatch_ElementOfHatcher;
		%feature("autodoc", "	:rtype: None
") Geom2dHatch_ElementOfHatcher;
		 Geom2dHatch_ElementOfHatcher ();
		%feature("compactdefaultargs") Geom2dHatch_ElementOfHatcher;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2dHatch_ElementOfHatcher &
	:rtype: None
") Geom2dHatch_ElementOfHatcher;
		 Geom2dHatch_ElementOfHatcher (const Geom2dHatch_ElementOfHatcher & Other);
		%feature("compactdefaultargs") Geom2dHatch_ElementOfHatcher;
		%feature("autodoc", "	:param Curve:
	:type Curve: Geom2dAdaptor_Curve &
	:param Orientation: default value is TopAbs_FORWARD
	:type Orientation: TopAbs_Orientation
	:rtype: None
") Geom2dHatch_ElementOfHatcher;
		 Geom2dHatch_ElementOfHatcher (const Geom2dAdaptor_Curve & Curve,const TopAbs_Orientation Orientation = TopAbs_FORWARD);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: Geom2dAdaptor_Curve
") Curve;
		const Geom2dAdaptor_Curve & Curve ();
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "	:rtype: Geom2dAdaptor_Curve
") ChangeCurve;
		Geom2dAdaptor_Curve & ChangeCurve ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:param Orientation:
	:type Orientation: TopAbs_Orientation
	:rtype: None
") Orientation;
		void Orientation (const TopAbs_Orientation Orientation);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
};


%feature("shadow") Geom2dHatch_ElementOfHatcher::~Geom2dHatch_ElementOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dHatch_ElementOfHatcher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dHatch_ElementsOfHatcher;
class Geom2dHatch_ElementsOfHatcher {
	public:
		%feature("compactdefaultargs") Geom2dHatch_ElementsOfHatcher;
		%feature("autodoc", "	:rtype: None
") Geom2dHatch_ElementsOfHatcher;
		 Geom2dHatch_ElementsOfHatcher ();
		%feature("compactdefaultargs") Geom2dHatch_ElementsOfHatcher;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2dHatch_ElementsOfHatcher &
	:rtype: None
") Geom2dHatch_ElementsOfHatcher;
		 Geom2dHatch_ElementsOfHatcher (const Geom2dHatch_ElementsOfHatcher & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Geom2dHatch_ElementOfHatcher &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const Geom2dHatch_ElementOfHatcher & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Geom2dHatch_ElementOfHatcher
") Find;
		const Geom2dHatch_ElementOfHatcher & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Geom2dHatch_ElementOfHatcher
") ChangeFind;
		Geom2dHatch_ElementOfHatcher & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: bool
") Reject;
		Standard_Boolean Reject (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float &
	:rtype: bool
") Segment;
		Standard_Boolean Segment (const gp_Pnt2d & P,gp_Lin2d & L,Standard_Real &OutValue);
		%feature("compactdefaultargs") OtherSegment;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float &
	:rtype: bool
") OtherSegment;
		Standard_Boolean OtherSegment (const gp_Pnt2d & P,gp_Lin2d & L,Standard_Real &OutValue);
		%feature("compactdefaultargs") InitWires;
		%feature("autodoc", "	:rtype: None
") InitWires;
		void InitWires ();
		%feature("compactdefaultargs") MoreWires;
		%feature("autodoc", "	:rtype: bool
") MoreWires;
		Standard_Boolean MoreWires ();
		%feature("compactdefaultargs") NextWire;
		%feature("autodoc", "	:rtype: None
") NextWire;
		void NextWire ();
		%feature("compactdefaultargs") RejectWire;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float
	:rtype: bool
") RejectWire;
		Standard_Boolean RejectWire (const gp_Lin2d & L,const Standard_Real Par);
		%feature("compactdefaultargs") InitEdges;
		%feature("autodoc", "	:rtype: None
") InitEdges;
		void InitEdges ();
		%feature("compactdefaultargs") MoreEdges;
		%feature("autodoc", "	:rtype: bool
") MoreEdges;
		Standard_Boolean MoreEdges ();
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "	:rtype: None
") NextEdge;
		void NextEdge ();
		%feature("compactdefaultargs") RejectEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float
	:rtype: bool
") RejectEdge;
		Standard_Boolean RejectEdge (const gp_Lin2d & L,const Standard_Real Par);
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", "	:param E:
	:type E: Geom2dAdaptor_Curve &
	:param Or:
	:type Or: TopAbs_Orientation &
	:rtype: None
") CurrentEdge;
		void CurrentEdge (Geom2dAdaptor_Curve & E,TopAbs_Orientation & Or);
};


%feature("shadow") Geom2dHatch_ElementsOfHatcher::~Geom2dHatch_ElementsOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dHatch_ElementsOfHatcher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dHatch_FClass2dOfClassifierOfHatcher;
class Geom2dHatch_FClass2dOfClassifierOfHatcher {
	public:
		%feature("compactdefaultargs") Geom2dHatch_FClass2dOfClassifierOfHatcher;
		%feature("autodoc", "	:rtype: None
") Geom2dHatch_FClass2dOfClassifierOfHatcher;
		 Geom2dHatch_FClass2dOfClassifierOfHatcher ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Reset;
		void Reset (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol);
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "	:param E:
	:type E: Geom2dAdaptor_Curve &
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None
") Compare;
		void Compare (const Geom2dAdaptor_Curve & E,const TopAbs_Orientation Or);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "	:rtype: Geom2dHatch_Intersector
") Intersector;
		Geom2dHatch_Intersector & Intersector ();
		%feature("compactdefaultargs") ClosestIntersection;
		%feature("autodoc", "	:rtype: int
") ClosestIntersection;
		Standard_Integer ClosestIntersection ();
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("compactdefaultargs") IsHeadOrEnd;
		%feature("autodoc", "	:rtype: bool
") IsHeadOrEnd;
		Standard_Boolean IsHeadOrEnd ();
};


%feature("shadow") Geom2dHatch_FClass2dOfClassifierOfHatcher::~Geom2dHatch_FClass2dOfClassifierOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dHatch_FClass2dOfClassifierOfHatcher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dHatch_Hatcher;
class Geom2dHatch_Hatcher {
	public:
		%feature("compactdefaultargs") Geom2dHatch_Hatcher;
		%feature("autodoc", "	:param Intersector:
	:type Intersector: Geom2dHatch_Intersector &
	:param Confusion2d:
	:type Confusion2d: float
	:param Confusion3d:
	:type Confusion3d: float
	:param KeepPnt: default value is Standard_False
	:type KeepPnt: bool
	:param KeepSeg: default value is Standard_False
	:type KeepSeg: bool
	:rtype: None
") Geom2dHatch_Hatcher;
		 Geom2dHatch_Hatcher (const Geom2dHatch_Intersector & Intersector,const Standard_Real Confusion2d,const Standard_Real Confusion3d,const Standard_Boolean KeepPnt = Standard_False,const Standard_Boolean KeepSeg = Standard_False);
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "	:param Intersector:
	:type Intersector: Geom2dHatch_Intersector &
	:rtype: None
") Intersector;
		void Intersector (const Geom2dHatch_Intersector & Intersector);
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "	:rtype: Geom2dHatch_Intersector
") Intersector;
		const Geom2dHatch_Intersector & Intersector ();
		%feature("compactdefaultargs") ChangeIntersector;
		%feature("autodoc", "	:rtype: Geom2dHatch_Intersector
") ChangeIntersector;
		Geom2dHatch_Intersector & ChangeIntersector ();
		%feature("compactdefaultargs") Confusion2d;
		%feature("autodoc", "	:param Confusion:
	:type Confusion: float
	:rtype: None
") Confusion2d;
		void Confusion2d (const Standard_Real Confusion);
		%feature("compactdefaultargs") Confusion2d;
		%feature("autodoc", "	:rtype: float
") Confusion2d;
		Standard_Real Confusion2d ();
		%feature("compactdefaultargs") Confusion3d;
		%feature("autodoc", "	:param Confusion:
	:type Confusion: float
	:rtype: None
") Confusion3d;
		void Confusion3d (const Standard_Real Confusion);
		%feature("compactdefaultargs") Confusion3d;
		%feature("autodoc", "	:rtype: float
") Confusion3d;
		Standard_Real Confusion3d ();
		%feature("compactdefaultargs") KeepPoints;
		%feature("autodoc", "	:param Keep:
	:type Keep: bool
	:rtype: None
") KeepPoints;
		void KeepPoints (const Standard_Boolean Keep);
		%feature("compactdefaultargs") KeepPoints;
		%feature("autodoc", "	:rtype: bool
") KeepPoints;
		Standard_Boolean KeepPoints ();
		%feature("compactdefaultargs") KeepSegments;
		%feature("autodoc", "	:param Keep:
	:type Keep: bool
	:rtype: None
") KeepSegments;
		void KeepSegments (const Standard_Boolean Keep);
		%feature("compactdefaultargs") KeepSegments;
		%feature("autodoc", "	:rtype: bool
") KeepSegments;
		Standard_Boolean KeepSegments ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") ElementCurve;
		%feature("autodoc", "	:param IndE:
	:type IndE: int
	:rtype: Geom2dAdaptor_Curve
") ElementCurve;
		const Geom2dAdaptor_Curve & ElementCurve (const Standard_Integer IndE);
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "	:param Curve:
	:type Curve: Geom2dAdaptor_Curve &
	:param Orientation: default value is TopAbs_FORWARD
	:type Orientation: TopAbs_Orientation
	:rtype: int
") AddElement;
		Standard_Integer AddElement (const Geom2dAdaptor_Curve & Curve,const TopAbs_Orientation Orientation = TopAbs_FORWARD);
		%feature("compactdefaultargs") RemElement;
		%feature("autodoc", "	:param IndE:
	:type IndE: int
	:rtype: None
") RemElement;
		void RemElement (const Standard_Integer IndE);
		%feature("compactdefaultargs") ClrElements;
		%feature("autodoc", "	:rtype: None
") ClrElements;
		void ClrElements ();
		%feature("compactdefaultargs") HatchingCurve;
		%feature("autodoc", "	:param IndH:
	:type IndH: int
	:rtype: Geom2dAdaptor_Curve
") HatchingCurve;
		const Geom2dAdaptor_Curve & HatchingCurve (const Standard_Integer IndH);
		%feature("compactdefaultargs") AddHatching;
		%feature("autodoc", "	:param Curve:
	:type Curve: Geom2dAdaptor_Curve &
	:rtype: int
") AddHatching;
		Standard_Integer AddHatching (const Geom2dAdaptor_Curve & Curve);
		%feature("compactdefaultargs") RemHatching;
		%feature("autodoc", "	:param IndH:
	:type IndH: int
	:rtype: None
") RemHatching;
		void RemHatching (const Standard_Integer IndH);
		%feature("compactdefaultargs") ClrHatchings;
		%feature("autodoc", "	:rtype: None
") ClrHatchings;
		void ClrHatchings ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:param IndH:
	:type IndH: int
	:rtype: int
") NbPoints;
		Standard_Integer NbPoints (const Standard_Integer IndH);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param IndH:
	:type IndH: int
	:param IndP:
	:type IndP: int
	:rtype: HatchGen_PointOnHatching
") Point;
		const HatchGen_PointOnHatching & Point (const Standard_Integer IndH,const Standard_Integer IndP);
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	:rtype: None
") Trim;
		void Trim ();
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	:param Curve:
	:type Curve: Geom2dAdaptor_Curve &
	:rtype: int
") Trim;
		Standard_Integer Trim (const Geom2dAdaptor_Curve & Curve);
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	:param IndH:
	:type IndH: int
	:rtype: None
") Trim;
		void Trim (const Standard_Integer IndH);
		%feature("compactdefaultargs") ComputeDomains;
		%feature("autodoc", "	:rtype: None
") ComputeDomains;
		void ComputeDomains ();
		%feature("compactdefaultargs") ComputeDomains;
		%feature("autodoc", "	:param IndH:
	:type IndH: int
	:rtype: None
") ComputeDomains;
		void ComputeDomains (const Standard_Integer IndH);
		%feature("compactdefaultargs") TrimDone;
		%feature("autodoc", "	:param IndH:
	:type IndH: int
	:rtype: bool
") TrimDone;
		Standard_Boolean TrimDone (const Standard_Integer IndH);
		%feature("compactdefaultargs") TrimFailed;
		%feature("autodoc", "	:param IndH:
	:type IndH: int
	:rtype: bool
") TrimFailed;
		Standard_Boolean TrimFailed (const Standard_Integer IndH);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	:param IndH:
	:type IndH: int
	:rtype: HatchGen_ErrorStatus
") Status;
		HatchGen_ErrorStatus Status (const Standard_Integer IndH);
		%feature("compactdefaultargs") NbDomains;
		%feature("autodoc", "	:param IndH:
	:type IndH: int
	:rtype: int
") NbDomains;
		Standard_Integer NbDomains (const Standard_Integer IndH);
		%feature("compactdefaultargs") Domain;
		%feature("autodoc", "	:param IndH:
	:type IndH: int
	:param IDom:
	:type IDom: int
	:rtype: HatchGen_Domain
") Domain;
		const HatchGen_Domain & Domain (const Standard_Integer IndH,const Standard_Integer IDom);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%feature("shadow") Geom2dHatch_Hatcher::~Geom2dHatch_Hatcher %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dHatch_Hatcher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dHatch_HatchingOfHatcher;
class Geom2dHatch_HatchingOfHatcher {
	public:
		%feature("compactdefaultargs") Geom2dHatch_HatchingOfHatcher;
		%feature("autodoc", "	:rtype: None
") Geom2dHatch_HatchingOfHatcher;
		 Geom2dHatch_HatchingOfHatcher ();
		%feature("compactdefaultargs") Geom2dHatch_HatchingOfHatcher;
		%feature("autodoc", "	:param Curve:
	:type Curve: Geom2dAdaptor_Curve &
	:rtype: None
") Geom2dHatch_HatchingOfHatcher;
		 Geom2dHatch_HatchingOfHatcher (const Geom2dAdaptor_Curve & Curve);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: Geom2dAdaptor_Curve
") Curve;
		const Geom2dAdaptor_Curve & Curve ();
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "	:rtype: Geom2dAdaptor_Curve
") ChangeCurve;
		Geom2dAdaptor_Curve & ChangeCurve ();
		%feature("compactdefaultargs") TrimDone;
		%feature("autodoc", "	:param Flag:
	:type Flag: bool
	:rtype: None
") TrimDone;
		void TrimDone (const Standard_Boolean Flag);
		%feature("compactdefaultargs") TrimDone;
		%feature("autodoc", "	:rtype: bool
") TrimDone;
		Standard_Boolean TrimDone ();
		%feature("compactdefaultargs") TrimFailed;
		%feature("autodoc", "	:param Flag:
	:type Flag: bool
	:rtype: None
") TrimFailed;
		void TrimFailed (const Standard_Boolean Flag);
		%feature("compactdefaultargs") TrimFailed;
		%feature("autodoc", "	:rtype: bool
") TrimFailed;
		Standard_Boolean TrimFailed ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:param Flag:
	:type Flag: bool
	:rtype: None
") IsDone;
		void IsDone (const Standard_Boolean Flag);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	:param Status:
	:type Status: HatchGen_ErrorStatus
	:rtype: None
") Status;
		void Status (const HatchGen_ErrorStatus Status);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	:rtype: HatchGen_ErrorStatus
") Status;
		HatchGen_ErrorStatus Status ();
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "	:param Point:
	:type Point: HatchGen_PointOnHatching &
	:param Confusion:
	:type Confusion: float
	:rtype: None
") AddPoint;
		void AddPoint (const HatchGen_PointOnHatching & Point,const Standard_Real Confusion);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: HatchGen_PointOnHatching
") Point;
		const HatchGen_PointOnHatching & Point (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: HatchGen_PointOnHatching
") ChangePoint;
		HatchGen_PointOnHatching & ChangePoint (const Standard_Integer Index);
		%feature("compactdefaultargs") RemPoint;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") RemPoint;
		void RemPoint (const Standard_Integer Index);
		%feature("compactdefaultargs") ClrPoints;
		%feature("autodoc", "	:rtype: None
") ClrPoints;
		void ClrPoints ();
		%feature("compactdefaultargs") AddDomain;
		%feature("autodoc", "	:param Domain:
	:type Domain: HatchGen_Domain &
	:rtype: None
") AddDomain;
		void AddDomain (const HatchGen_Domain & Domain);
		%feature("compactdefaultargs") NbDomains;
		%feature("autodoc", "	:rtype: int
") NbDomains;
		Standard_Integer NbDomains ();
		%feature("compactdefaultargs") Domain;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: HatchGen_Domain
") Domain;
		const HatchGen_Domain & Domain (const Standard_Integer Index);
		%feature("compactdefaultargs") RemDomain;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") RemDomain;
		void RemDomain (const Standard_Integer Index);
		%feature("compactdefaultargs") ClrDomains;
		%feature("autodoc", "	:rtype: None
") ClrDomains;
		void ClrDomains ();
		%feature("compactdefaultargs") ClassificationPoint;
		%feature("autodoc", "	:rtype: gp_Pnt2d
") ClassificationPoint;
		gp_Pnt2d ClassificationPoint ();
};


%feature("shadow") Geom2dHatch_HatchingOfHatcher::~Geom2dHatch_HatchingOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dHatch_HatchingOfHatcher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dHatch_HatchingsOfHatcher;
class Geom2dHatch_HatchingsOfHatcher : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") Geom2dHatch_HatchingsOfHatcher;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") Geom2dHatch_HatchingsOfHatcher;
		 Geom2dHatch_HatchingsOfHatcher (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2dHatch_HatchingsOfHatcher &
	:rtype: Geom2dHatch_HatchingsOfHatcher
") Assign;
		Geom2dHatch_HatchingsOfHatcher & Assign (const Geom2dHatch_HatchingsOfHatcher & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2dHatch_HatchingsOfHatcher &
	:rtype: Geom2dHatch_HatchingsOfHatcher
") operator=;
		Geom2dHatch_HatchingsOfHatcher & operator = (const Geom2dHatch_HatchingsOfHatcher & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Geom2dHatch_HatchingOfHatcher &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const Geom2dHatch_HatchingOfHatcher & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Geom2dHatch_HatchingOfHatcher
") Find;
		const Geom2dHatch_HatchingOfHatcher & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Geom2dHatch_HatchingOfHatcher
") ChangeFind;
		Geom2dHatch_HatchingOfHatcher & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%feature("shadow") Geom2dHatch_HatchingsOfHatcher::~Geom2dHatch_HatchingsOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dHatch_HatchingsOfHatcher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dHatch_Intersector;
class Geom2dHatch_Intersector : public Geom2dInt_GInter {
	public:
		%feature("compactdefaultargs") Geom2dHatch_Intersector;
		%feature("autodoc", "	* Creates an intersector.

	:param Confusion:
	:type Confusion: float
	:param Tangency:
	:type Tangency: float
	:rtype: None
") Geom2dHatch_Intersector;
		 Geom2dHatch_Intersector (const Standard_Real Confusion,const Standard_Real Tangency);
		%feature("compactdefaultargs") ConfusionTolerance;
		%feature("autodoc", "	* Returns the confusion tolerance of the intersector.

	:rtype: float
") ConfusionTolerance;
		Standard_Real ConfusionTolerance ();
		%feature("compactdefaultargs") SetConfusionTolerance;
		%feature("autodoc", "	* Sets the confusion tolerance of the intersector.

	:param Confusion:
	:type Confusion: float
	:rtype: None
") SetConfusionTolerance;
		void SetConfusionTolerance (const Standard_Real Confusion);
		%feature("compactdefaultargs") TangencyTolerance;
		%feature("autodoc", "	* Returns the tangency tolerance of the intersector.

	:rtype: float
") TangencyTolerance;
		Standard_Real TangencyTolerance ();
		%feature("compactdefaultargs") SetTangencyTolerance;
		%feature("autodoc", "	* Sets the tangency tolerance of the intersector.

	:param Tangency:
	:type Tangency: float
	:rtype: None
") SetTangencyTolerance;
		void SetTangencyTolerance (const Standard_Real Tangency);
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "	* Intersects the curves C1 and C2. The results are retreived by the usual methods described in IntRes2d_Intersection. Creates an intersector.

	:param C1:
	:type C1: Geom2dAdaptor_Curve &
	:param C2:
	:type C2: Geom2dAdaptor_Curve &
	:rtype: None
") Intersect;
		void Intersect (const Geom2dAdaptor_Curve & C1,const Geom2dAdaptor_Curve & C2);
		%feature("compactdefaultargs") Geom2dHatch_Intersector;
		%feature("autodoc", "	:rtype: None
") Geom2dHatch_Intersector;
		 Geom2dHatch_Intersector ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the intersection between the 2d line segment (<L>, <P>) and the Curve <E>. The line segment is the part of the 2d line <L> of parameter range [0, <P>] (P is positive and can be RealLast()). Tol is the Tolerance on the segment. The order is relevant, the first argument is the segment, the second the Edge.

	:param L:
	:type L: gp_Lin2d
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:param E:
	:type E: Geom2dAdaptor_Curve &
	:rtype: None
") Perform;
		void Perform (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol,const Geom2dAdaptor_Curve & E);
		%feature("compactdefaultargs") LocalGeometry;
		%feature("autodoc", "	* Returns in <T>, <N> and <C> the tangent, normal and curvature of the edge <E> at parameter value <U>.

	:param E:
	:type E: Geom2dAdaptor_Curve &
	:param U:
	:type U: float
	:param T:
	:type T: gp_Dir2d
	:param N:
	:type N: gp_Dir2d
	:param C:
	:type C: float &
	:rtype: None
") LocalGeometry;
		void LocalGeometry (const Geom2dAdaptor_Curve & E,const Standard_Real U,gp_Dir2d & T,gp_Dir2d & N,Standard_Real &OutValue);
};


%feature("shadow") Geom2dHatch_Intersector::~Geom2dHatch_Intersector %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dHatch_Intersector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dHatch_MapOfElementsOfElementsOfHatcher;
class Geom2dHatch_MapOfElementsOfElementsOfHatcher : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") Geom2dHatch_MapOfElementsOfElementsOfHatcher;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") Geom2dHatch_MapOfElementsOfElementsOfHatcher;
		 Geom2dHatch_MapOfElementsOfElementsOfHatcher (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2dHatch_MapOfElementsOfElementsOfHatcher &
	:rtype: Geom2dHatch_MapOfElementsOfElementsOfHatcher
") Assign;
		Geom2dHatch_MapOfElementsOfElementsOfHatcher & Assign (const Geom2dHatch_MapOfElementsOfElementsOfHatcher & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2dHatch_MapOfElementsOfElementsOfHatcher &
	:rtype: Geom2dHatch_MapOfElementsOfElementsOfHatcher
") operator=;
		Geom2dHatch_MapOfElementsOfElementsOfHatcher & operator = (const Geom2dHatch_MapOfElementsOfElementsOfHatcher & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Geom2dHatch_ElementOfHatcher &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const Geom2dHatch_ElementOfHatcher & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Geom2dHatch_ElementOfHatcher
") Find;
		const Geom2dHatch_ElementOfHatcher & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Geom2dHatch_ElementOfHatcher
") ChangeFind;
		Geom2dHatch_ElementOfHatcher & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%feature("shadow") Geom2dHatch_MapOfElementsOfElementsOfHatcher::~Geom2dHatch_MapOfElementsOfElementsOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dHatch_MapOfElementsOfElementsOfHatcher {
	void _kill_pointed() {
		delete $self;
	}
};
