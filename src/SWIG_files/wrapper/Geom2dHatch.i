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
%module Geom2dHatch

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

%include Geom2dHatch_required_python_modules.i
%include Geom2dHatch_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor Geom2dHatch_ClassifierOfHatcher;
class Geom2dHatch_ClassifierOfHatcher {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dHatch_ClassifierOfHatcher;
		 Geom2dHatch_ClassifierOfHatcher ();
		%feature("autodoc", "Args:
	F(Geom2dHatch_ElementsOfHatcher)
	P(gp_Pnt2d)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dHatch_ClassifierOfHatcher;
		 Geom2dHatch_ClassifierOfHatcher (Geom2dHatch_ElementsOfHatcher & F,const gp_Pnt2d & P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	F(Geom2dHatch_ElementsOfHatcher)
	P(gp_Pnt2d)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (Geom2dHatch_ElementsOfHatcher & F,const gp_Pnt2d & P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") State;
		TopAbs_State State ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Rejected;
		Standard_Boolean Rejected ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") NoWires;
		Standard_Boolean NoWires ();
		%feature("autodoc", "Args:
	None
Returns:
	Geom2dAdaptor_Curve

No detailed docstring for this function.") Edge;
		const Geom2dAdaptor_Curve & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") EdgeParameter;
		Standard_Real EdgeParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_Position

No detailed docstring for this function.") Position;
		IntRes2d_Position Position ();
};


%feature("shadow") Geom2dHatch_ClassifierOfHatcher::~Geom2dHatch_ClassifierOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher;
		 Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher ();
		%feature("autodoc", "Args:
	aMap(Geom2dHatch_HatchingsOfHatcher)

Returns:
	None

No detailed docstring for this function.") Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher;
		 Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher (const Geom2dHatch_HatchingsOfHatcher & aMap);
		%feature("autodoc", "Args:
	aMap(Geom2dHatch_HatchingsOfHatcher)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Geom2dHatch_HatchingsOfHatcher & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Geom2dHatch_HatchingOfHatcher

No detailed docstring for this function.") Value;
		const Geom2dHatch_HatchingOfHatcher & Value ();
};


%feature("shadow") Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher::~Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher;
		 Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher ();
		%feature("autodoc", "Args:
	aMap(Geom2dHatch_MapOfElementsOfElementsOfHatcher)

Returns:
	None

No detailed docstring for this function.") Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher;
		 Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher (const Geom2dHatch_MapOfElementsOfElementsOfHatcher & aMap);
		%feature("autodoc", "Args:
	aMap(Geom2dHatch_MapOfElementsOfElementsOfHatcher)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Geom2dHatch_MapOfElementsOfElementsOfHatcher & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Geom2dHatch_ElementOfHatcher

No detailed docstring for this function.") Value;
		const Geom2dHatch_ElementOfHatcher & Value ();
};


%feature("shadow") Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher::~Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Geom2dHatch_HatchingOfHatcher)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Geom2dHatch_DataMapNodeOfHatchingsOfHatcher;
		 Geom2dHatch_DataMapNodeOfHatchingsOfHatcher (Standard_Integer &OutValue,const Geom2dHatch_HatchingOfHatcher & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Geom2dHatch_HatchingOfHatcher

No detailed docstring for this function.") Value;
		Geom2dHatch_HatchingOfHatcher & Value ();
};


%feature("shadow") Geom2dHatch_DataMapNodeOfHatchingsOfHatcher::~Geom2dHatch_DataMapNodeOfHatchingsOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Geom2dHatch_ElementOfHatcher)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher;
		 Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher (Standard_Integer &OutValue,const Geom2dHatch_ElementOfHatcher & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Geom2dHatch_ElementOfHatcher

No detailed docstring for this function.") Value;
		Geom2dHatch_ElementOfHatcher & Value ();
};


%feature("shadow") Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher::~Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dHatch_ElementOfHatcher;
		 Geom2dHatch_ElementOfHatcher ();
		%feature("autodoc", "Args:
	Other(Geom2dHatch_ElementOfHatcher)

Returns:
	None

No detailed docstring for this function.") Geom2dHatch_ElementOfHatcher;
		 Geom2dHatch_ElementOfHatcher (const Geom2dHatch_ElementOfHatcher & Other);
		%feature("autodoc", "Args:
	Curve(Geom2dAdaptor_Curve)
	Orientation(TopAbs_Orientation)=TopAbs_FORWARD

Returns:
	None

No detailed docstring for this function.") Geom2dHatch_ElementOfHatcher;
		 Geom2dHatch_ElementOfHatcher (const Geom2dAdaptor_Curve & Curve,const TopAbs_Orientation Orientation = TopAbs_FORWARD);
		%feature("autodoc", "Args:
	None
Returns:
	Geom2dAdaptor_Curve

No detailed docstring for this function.") Curve;
		const Geom2dAdaptor_Curve & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Geom2dAdaptor_Curve

No detailed docstring for this function.") ChangeCurve;
		Geom2dAdaptor_Curve & ChangeCurve ();
		%feature("autodoc", "Args:
	Orientation(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") Orientation;
		void Orientation (const TopAbs_Orientation Orientation);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		TopAbs_Orientation Orientation ();
};


%feature("shadow") Geom2dHatch_ElementOfHatcher::~Geom2dHatch_ElementOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dHatch_ElementsOfHatcher;
		 Geom2dHatch_ElementsOfHatcher ();
		%feature("autodoc", "Args:
	Other(Geom2dHatch_ElementsOfHatcher)

Returns:
	None

No detailed docstring for this function.") Geom2dHatch_ElementsOfHatcher;
		 Geom2dHatch_ElementsOfHatcher (const Geom2dHatch_ElementsOfHatcher & Other);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Geom2dHatch_ElementOfHatcher)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Geom2dHatch_ElementOfHatcher & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Geom2dHatch_ElementOfHatcher

No detailed docstring for this function.") Find;
		const Geom2dHatch_ElementOfHatcher & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Geom2dHatch_ElementOfHatcher

No detailed docstring for this function.") ChangeFind;
		Geom2dHatch_ElementOfHatcher & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Reject;
		Standard_Boolean Reject (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	L(gp_Lin2d)
	Par(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Segment;
		Standard_Boolean Segment (const gp_Pnt2d & P,gp_Lin2d & L,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	L(gp_Lin2d)
	Par(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") OtherSegment;
		Standard_Boolean OtherSegment (const gp_Pnt2d & P,gp_Lin2d & L,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitWires;
		void InitWires ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreWires;
		Standard_Boolean MoreWires ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextWire;
		void NextWire ();
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	Par(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") RejectWire;
		Standard_Boolean RejectWire (const gp_Lin2d & L,const Standard_Real Par);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitEdges;
		void InitEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreEdges;
		Standard_Boolean MoreEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextEdge;
		void NextEdge ();
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	Par(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") RejectEdge;
		Standard_Boolean RejectEdge (const gp_Lin2d & L,const Standard_Real Par);
		%feature("autodoc", "Args:
	E(Geom2dAdaptor_Curve)
	Or(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") CurrentEdge;
		void CurrentEdge (Geom2dAdaptor_Curve & E,TopAbs_Orientation & Or);
};


%feature("shadow") Geom2dHatch_ElementsOfHatcher::~Geom2dHatch_ElementsOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dHatch_FClass2dOfClassifierOfHatcher;
		 Geom2dHatch_FClass2dOfClassifierOfHatcher ();
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	P(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Reset;
		void Reset (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(Geom2dAdaptor_Curve)
	Or(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") Compare;
		void Compare (const Geom2dAdaptor_Curve & E,const TopAbs_Orientation Or);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Geom2dHatch_Intersector

No detailed docstring for this function.") Intersector;
		Geom2dHatch_Intersector & Intersector ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ClosestIntersection;
		Standard_Integer ClosestIntersection ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") State;
		TopAbs_State State ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsHeadOrEnd;
		Standard_Boolean IsHeadOrEnd ();
};


%feature("shadow") Geom2dHatch_FClass2dOfClassifierOfHatcher::~Geom2dHatch_FClass2dOfClassifierOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	Intersector(Geom2dHatch_Intersector)
	Confusion2d(Standard_Real)
	Confusion3d(Standard_Real)
	KeepPnt(Standard_Boolean)=Standard_False
	KeepSeg(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Geom2dHatch_Hatcher;
		 Geom2dHatch_Hatcher (const Geom2dHatch_Intersector & Intersector,const Standard_Real Confusion2d,const Standard_Real Confusion3d,const Standard_Boolean KeepPnt = Standard_False,const Standard_Boolean KeepSeg = Standard_False);
		%feature("autodoc", "Args:
	Intersector(Geom2dHatch_Intersector)

Returns:
	None

No detailed docstring for this function.") Intersector;
		void Intersector (const Geom2dHatch_Intersector & Intersector);
		%feature("autodoc", "Args:
	None
Returns:
	Geom2dHatch_Intersector

No detailed docstring for this function.") Intersector;
		const Geom2dHatch_Intersector & Intersector ();
		%feature("autodoc", "Args:
	None
Returns:
	Geom2dHatch_Intersector

No detailed docstring for this function.") ChangeIntersector;
		Geom2dHatch_Intersector & ChangeIntersector ();
		%feature("autodoc", "Args:
	Confusion(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Confusion2d;
		void Confusion2d (const Standard_Real Confusion);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Confusion2d;
		Standard_Real Confusion2d ();
		%feature("autodoc", "Args:
	Confusion(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Confusion3d;
		void Confusion3d (const Standard_Real Confusion);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Confusion3d;
		Standard_Real Confusion3d ();
		%feature("autodoc", "Args:
	Keep(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") KeepPoints;
		void KeepPoints (const Standard_Boolean Keep);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") KeepPoints;
		Standard_Boolean KeepPoints ();
		%feature("autodoc", "Args:
	Keep(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") KeepSegments;
		void KeepSegments (const Standard_Boolean Keep);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") KeepSegments;
		Standard_Boolean KeepSegments ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	IndE(Standard_Integer)

Returns:
	Geom2dAdaptor_Curve

No detailed docstring for this function.") ElementCurve;
		const Geom2dAdaptor_Curve & ElementCurve (const Standard_Integer IndE);
		%feature("autodoc", "Args:
	Curve(Geom2dAdaptor_Curve)
	Orientation(TopAbs_Orientation)=TopAbs_FORWARD

Returns:
	Standard_Integer

No detailed docstring for this function.") AddElement;
		Standard_Integer AddElement (const Geom2dAdaptor_Curve & Curve,const TopAbs_Orientation Orientation = TopAbs_FORWARD);
		%feature("autodoc", "Args:
	IndE(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") RemElement;
		void RemElement (const Standard_Integer IndE);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ClrElements;
		void ClrElements ();
		%feature("autodoc", "Args:
	IndH(Standard_Integer)

Returns:
	Geom2dAdaptor_Curve

No detailed docstring for this function.") HatchingCurve;
		const Geom2dAdaptor_Curve & HatchingCurve (const Standard_Integer IndH);
		%feature("autodoc", "Args:
	Curve(Geom2dAdaptor_Curve)

Returns:
	Standard_Integer

No detailed docstring for this function.") AddHatching;
		Standard_Integer AddHatching (const Geom2dAdaptor_Curve & Curve);
		%feature("autodoc", "Args:
	IndH(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") RemHatching;
		void RemHatching (const Standard_Integer IndH);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ClrHatchings;
		void ClrHatchings ();
		%feature("autodoc", "Args:
	IndH(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoints;
		Standard_Integer NbPoints (const Standard_Integer IndH);
		%feature("autodoc", "Args:
	IndH(Standard_Integer)
	IndP(Standard_Integer)

Returns:
	HatchGen_PointOnHatching

No detailed docstring for this function.") Point;
		const HatchGen_PointOnHatching & Point (const Standard_Integer IndH,const Standard_Integer IndP);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Trim;
		void Trim ();
		%feature("autodoc", "Args:
	Curve(Geom2dAdaptor_Curve)

Returns:
	Standard_Integer

No detailed docstring for this function.") Trim;
		Standard_Integer Trim (const Geom2dAdaptor_Curve & Curve);
		%feature("autodoc", "Args:
	IndH(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Trim;
		void Trim (const Standard_Integer IndH);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ComputeDomains;
		void ComputeDomains ();
		%feature("autodoc", "Args:
	IndH(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ComputeDomains;
		void ComputeDomains (const Standard_Integer IndH);
		%feature("autodoc", "Args:
	IndH(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") TrimDone;
		Standard_Boolean TrimDone (const Standard_Integer IndH);
		%feature("autodoc", "Args:
	IndH(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") TrimFailed;
		Standard_Boolean TrimFailed (const Standard_Integer IndH);
		%feature("autodoc", "Args:
	IndH(Standard_Integer)

Returns:
	HatchGen_ErrorStatus

No detailed docstring for this function.") Status;
		HatchGen_ErrorStatus Status (const Standard_Integer IndH);
		%feature("autodoc", "Args:
	IndH(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") NbDomains;
		Standard_Integer NbDomains (const Standard_Integer IndH);
		%feature("autodoc", "Args:
	IndH(Standard_Integer)
	IDom(Standard_Integer)

Returns:
	HatchGen_Domain

No detailed docstring for this function.") Domain;
		const HatchGen_Domain & Domain (const Standard_Integer IndH,const Standard_Integer IDom);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
};


%feature("shadow") Geom2dHatch_Hatcher::~Geom2dHatch_Hatcher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dHatch_HatchingOfHatcher;
		 Geom2dHatch_HatchingOfHatcher ();
		%feature("autodoc", "Args:
	Curve(Geom2dAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") Geom2dHatch_HatchingOfHatcher;
		 Geom2dHatch_HatchingOfHatcher (const Geom2dAdaptor_Curve & Curve);
		%feature("autodoc", "Args:
	None
Returns:
	Geom2dAdaptor_Curve

No detailed docstring for this function.") Curve;
		const Geom2dAdaptor_Curve & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Geom2dAdaptor_Curve

No detailed docstring for this function.") ChangeCurve;
		Geom2dAdaptor_Curve & ChangeCurve ();
		%feature("autodoc", "Args:
	Flag(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") TrimDone;
		void TrimDone (const Standard_Boolean Flag);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") TrimDone;
		Standard_Boolean TrimDone ();
		%feature("autodoc", "Args:
	Flag(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") TrimFailed;
		void TrimFailed (const Standard_Boolean Flag);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") TrimFailed;
		Standard_Boolean TrimFailed ();
		%feature("autodoc", "Args:
	Flag(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") IsDone;
		void IsDone (const Standard_Boolean Flag);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	Status(HatchGen_ErrorStatus)

Returns:
	None

No detailed docstring for this function.") Status;
		void Status (const HatchGen_ErrorStatus Status);
		%feature("autodoc", "Args:
	None
Returns:
	HatchGen_ErrorStatus

No detailed docstring for this function.") Status;
		HatchGen_ErrorStatus Status ();
		%feature("autodoc", "Args:
	Point(HatchGen_PointOnHatching)
	Confusion(Standard_Real)

Returns:
	None

No detailed docstring for this function.") AddPoint;
		void AddPoint (const HatchGen_PointOnHatching & Point,const Standard_Real Confusion);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HatchGen_PointOnHatching

No detailed docstring for this function.") Point;
		const HatchGen_PointOnHatching & Point (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HatchGen_PointOnHatching

No detailed docstring for this function.") ChangePoint;
		HatchGen_PointOnHatching & ChangePoint (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") RemPoint;
		void RemPoint (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ClrPoints;
		void ClrPoints ();
		%feature("autodoc", "Args:
	Domain(HatchGen_Domain)

Returns:
	None

No detailed docstring for this function.") AddDomain;
		void AddDomain (const HatchGen_Domain & Domain);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbDomains;
		Standard_Integer NbDomains ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HatchGen_Domain

No detailed docstring for this function.") Domain;
		const HatchGen_Domain & Domain (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") RemDomain;
		void RemDomain (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ClrDomains;
		void ClrDomains ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") ClassificationPoint;
		gp_Pnt2d ClassificationPoint ();
};


%feature("shadow") Geom2dHatch_HatchingOfHatcher::~Geom2dHatch_HatchingOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") Geom2dHatch_HatchingsOfHatcher;
		 Geom2dHatch_HatchingsOfHatcher (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(Geom2dHatch_HatchingsOfHatcher)

Returns:
	Geom2dHatch_HatchingsOfHatcher

No detailed docstring for this function.") Assign;
		Geom2dHatch_HatchingsOfHatcher & Assign (const Geom2dHatch_HatchingsOfHatcher & Other);
		%feature("autodoc", "Args:
	Other(Geom2dHatch_HatchingsOfHatcher)

Returns:
	Geom2dHatch_HatchingsOfHatcher

No detailed docstring for this function.") operator=;
		Geom2dHatch_HatchingsOfHatcher & operator = (const Geom2dHatch_HatchingsOfHatcher & Other);
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
	K(Standard_Integer)
	I(Geom2dHatch_HatchingOfHatcher)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Geom2dHatch_HatchingOfHatcher & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Geom2dHatch_HatchingOfHatcher

No detailed docstring for this function.") Find;
		const Geom2dHatch_HatchingOfHatcher & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Geom2dHatch_HatchingOfHatcher

No detailed docstring for this function.") ChangeFind;
		Geom2dHatch_HatchingOfHatcher & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") Geom2dHatch_HatchingsOfHatcher::~Geom2dHatch_HatchingsOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	Confusion(Standard_Real)
	Tangency(Standard_Real)

Returns:
	None

Creates an intersector.") Geom2dHatch_Intersector;
		 Geom2dHatch_Intersector (const Standard_Real Confusion,const Standard_Real Tangency);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the confusion tolerance of the  
         intersector.") ConfusionTolerance;
		Standard_Real ConfusionTolerance ();
		%feature("autodoc", "Args:
	Confusion(Standard_Real)

Returns:
	None

Sets the confusion tolerance of the intersector.") SetConfusionTolerance;
		void SetConfusionTolerance (const Standard_Real Confusion);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the tangency tolerance of the  
         intersector.") TangencyTolerance;
		Standard_Real TangencyTolerance ();
		%feature("autodoc", "Args:
	Tangency(Standard_Real)

Returns:
	None

Sets the tangency tolerance of the intersector.") SetTangencyTolerance;
		void SetTangencyTolerance (const Standard_Real Tangency);
		%feature("autodoc", "Args:
	C1(Geom2dAdaptor_Curve)
	C2(Geom2dAdaptor_Curve)

Returns:
	None

Intersects the curves C1 and C2.  
         The results are retreived by the usual methods  
         described in IntRes2d_Intersection.  Creates an intersector.") Intersect;
		void Intersect (const Geom2dAdaptor_Curve & C1,const Geom2dAdaptor_Curve & C2);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dHatch_Intersector;
		 Geom2dHatch_Intersector ();
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	P(Standard_Real)
	Tol(Standard_Real)
	E(Geom2dAdaptor_Curve)

Returns:
	None

Performs the intersection   between the  2d   line  
         segment (<L>, <P>) and  the  Curve <E>.  The  line  
         segment  is the  part  of  the  2d   line   <L> of  
         parameter range [0, <P>] (P is positive and can be  
         RealLast()). Tol is the  Tolerance on the segment.  
         The order  is relevant, the  first argument is the  
         segment, the second the Edge.") Perform;
		void Perform (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol,const Geom2dAdaptor_Curve & E);
		%feature("autodoc", "Args:
	E(Geom2dAdaptor_Curve)
	U(Standard_Real)
	T(gp_Dir2d)
	N(gp_Dir2d)
	C(Standard_Real)

Returns:
	None

Returns in <T>,  <N> and <C>  the tangent,  normal  
         and  curvature of the edge  <E> at parameter value  
         <U>.") LocalGeometry;
		void LocalGeometry (const Geom2dAdaptor_Curve & E,const Standard_Real U,gp_Dir2d & T,gp_Dir2d & N,Standard_Real &OutValue);
};


%feature("shadow") Geom2dHatch_Intersector::~Geom2dHatch_Intersector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") Geom2dHatch_MapOfElementsOfElementsOfHatcher;
		 Geom2dHatch_MapOfElementsOfElementsOfHatcher (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(Geom2dHatch_MapOfElementsOfElementsOfHatcher)

Returns:
	Geom2dHatch_MapOfElementsOfElementsOfHatcher

No detailed docstring for this function.") Assign;
		Geom2dHatch_MapOfElementsOfElementsOfHatcher & Assign (const Geom2dHatch_MapOfElementsOfElementsOfHatcher & Other);
		%feature("autodoc", "Args:
	Other(Geom2dHatch_MapOfElementsOfElementsOfHatcher)

Returns:
	Geom2dHatch_MapOfElementsOfElementsOfHatcher

No detailed docstring for this function.") operator=;
		Geom2dHatch_MapOfElementsOfElementsOfHatcher & operator = (const Geom2dHatch_MapOfElementsOfElementsOfHatcher & Other);
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
	K(Standard_Integer)
	I(Geom2dHatch_ElementOfHatcher)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Geom2dHatch_ElementOfHatcher & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Geom2dHatch_ElementOfHatcher

No detailed docstring for this function.") Find;
		const Geom2dHatch_ElementOfHatcher & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Geom2dHatch_ElementOfHatcher

No detailed docstring for this function.") ChangeFind;
		Geom2dHatch_ElementOfHatcher & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") Geom2dHatch_MapOfElementsOfElementsOfHatcher::~Geom2dHatch_MapOfElementsOfElementsOfHatcher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dHatch_MapOfElementsOfElementsOfHatcher {
	void _kill_pointed() {
		delete $self;
	}
};
