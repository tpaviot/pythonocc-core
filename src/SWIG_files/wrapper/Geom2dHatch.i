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


%include Geom2dHatch_headers.i


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

%nodefaultctor Geom2dHatch_Classifier;
class Geom2dHatch_Classifier {
	public:
		%feature("compactdefaultargs") Geom2dHatch_Classifier;
		%feature("autodoc", "	:rtype: None
") Geom2dHatch_Classifier;
		 Geom2dHatch_Classifier ();
		%feature("compactdefaultargs") Geom2dHatch_Classifier;
		%feature("autodoc", "	:param F:
	:type F: Geom2dHatch_Elements &
	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dHatch_Classifier;
		 Geom2dHatch_Classifier (Geom2dHatch_Elements & F,const gp_Pnt2d & P,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param F:
	:type F: Geom2dHatch_Elements &
	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (Geom2dHatch_Elements & F,const gp_Pnt2d & P,const Standard_Real Tol);
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


%extend Geom2dHatch_Classifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dHatch_DataMapIteratorOfHatchings;
class Geom2dHatch_DataMapIteratorOfHatchings : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") Geom2dHatch_DataMapIteratorOfHatchings;
		%feature("autodoc", "	:rtype: None
") Geom2dHatch_DataMapIteratorOfHatchings;
		 Geom2dHatch_DataMapIteratorOfHatchings ();
		%feature("compactdefaultargs") Geom2dHatch_DataMapIteratorOfHatchings;
		%feature("autodoc", "	:param aMap:
	:type aMap: Geom2dHatch_Hatchings &
	:rtype: None
") Geom2dHatch_DataMapIteratorOfHatchings;
		 Geom2dHatch_DataMapIteratorOfHatchings (const Geom2dHatch_Hatchings & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: Geom2dHatch_Hatchings &
	:rtype: None
") Initialize;
		void Initialize (const Geom2dHatch_Hatchings & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Geom2dHatch_Hatching
") Value;
		const Geom2dHatch_Hatching & Value ();
};


%extend Geom2dHatch_DataMapIteratorOfHatchings {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dHatch_DataMapIteratorOfMapOfElements;
class Geom2dHatch_DataMapIteratorOfMapOfElements : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") Geom2dHatch_DataMapIteratorOfMapOfElements;
		%feature("autodoc", "	:rtype: None
") Geom2dHatch_DataMapIteratorOfMapOfElements;
		 Geom2dHatch_DataMapIteratorOfMapOfElements ();
		%feature("compactdefaultargs") Geom2dHatch_DataMapIteratorOfMapOfElements;
		%feature("autodoc", "	:param aMap:
	:type aMap: Geom2dHatch_MapOfElements &
	:rtype: None
") Geom2dHatch_DataMapIteratorOfMapOfElements;
		 Geom2dHatch_DataMapIteratorOfMapOfElements (const Geom2dHatch_MapOfElements & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: Geom2dHatch_MapOfElements &
	:rtype: None
") Initialize;
		void Initialize (const Geom2dHatch_MapOfElements & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Geom2dHatch_Element
") Value;
		const Geom2dHatch_Element & Value ();
};


%extend Geom2dHatch_DataMapIteratorOfMapOfElements {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dHatch_DataMapNodeOfHatchings;
class Geom2dHatch_DataMapNodeOfHatchings : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Geom2dHatch_DataMapNodeOfHatchings;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Geom2dHatch_Hatching &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Geom2dHatch_DataMapNodeOfHatchings;
		 Geom2dHatch_DataMapNodeOfHatchings (const Standard_Integer & K,const Geom2dHatch_Hatching & I,const TCollection_MapNodePtr & n);

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
		%feature("autodoc", "	:rtype: Geom2dHatch_Hatching
") Value;
		Geom2dHatch_Hatching & Value ();
};


%extend Geom2dHatch_DataMapNodeOfHatchings {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Geom2dHatch_DataMapNodeOfHatchings(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Geom2dHatch_DataMapNodeOfHatchings::Handle_Geom2dHatch_DataMapNodeOfHatchings %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Geom2dHatch_DataMapNodeOfHatchings;
class Handle_Geom2dHatch_DataMapNodeOfHatchings : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Geom2dHatch_DataMapNodeOfHatchings();
        Handle_Geom2dHatch_DataMapNodeOfHatchings(const Handle_Geom2dHatch_DataMapNodeOfHatchings &aHandle);
        Handle_Geom2dHatch_DataMapNodeOfHatchings(const Geom2dHatch_DataMapNodeOfHatchings *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom2dHatch_DataMapNodeOfHatchings DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom2dHatch_DataMapNodeOfHatchings {
    Geom2dHatch_DataMapNodeOfHatchings* _get_reference() {
    return (Geom2dHatch_DataMapNodeOfHatchings*)$self->Access();
    }
};

%extend Handle_Geom2dHatch_DataMapNodeOfHatchings {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Geom2dHatch_DataMapNodeOfHatchings {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dHatch_DataMapNodeOfMapOfElements;
class Geom2dHatch_DataMapNodeOfMapOfElements : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Geom2dHatch_DataMapNodeOfMapOfElements;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: Geom2dHatch_Element &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Geom2dHatch_DataMapNodeOfMapOfElements;
		 Geom2dHatch_DataMapNodeOfMapOfElements (const Standard_Integer & K,const Geom2dHatch_Element & I,const TCollection_MapNodePtr & n);

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
		%feature("autodoc", "	:rtype: Geom2dHatch_Element
") Value;
		Geom2dHatch_Element & Value ();
};


%extend Geom2dHatch_DataMapNodeOfMapOfElements {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Geom2dHatch_DataMapNodeOfMapOfElements(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Geom2dHatch_DataMapNodeOfMapOfElements::Handle_Geom2dHatch_DataMapNodeOfMapOfElements %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Geom2dHatch_DataMapNodeOfMapOfElements;
class Handle_Geom2dHatch_DataMapNodeOfMapOfElements : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Geom2dHatch_DataMapNodeOfMapOfElements();
        Handle_Geom2dHatch_DataMapNodeOfMapOfElements(const Handle_Geom2dHatch_DataMapNodeOfMapOfElements &aHandle);
        Handle_Geom2dHatch_DataMapNodeOfMapOfElements(const Geom2dHatch_DataMapNodeOfMapOfElements *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom2dHatch_DataMapNodeOfMapOfElements DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom2dHatch_DataMapNodeOfMapOfElements {
    Geom2dHatch_DataMapNodeOfMapOfElements* _get_reference() {
    return (Geom2dHatch_DataMapNodeOfMapOfElements*)$self->Access();
    }
};

%extend Handle_Geom2dHatch_DataMapNodeOfMapOfElements {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Geom2dHatch_DataMapNodeOfMapOfElements {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dHatch_Element;
class Geom2dHatch_Element {
	public:
		%feature("compactdefaultargs") Geom2dHatch_Element;
		%feature("autodoc", "	:rtype: None
") Geom2dHatch_Element;
		 Geom2dHatch_Element ();
		%feature("compactdefaultargs") Geom2dHatch_Element;
		%feature("autodoc", "	* Magic constructor.

	:param Other:
	:type Other: Geom2dHatch_Element &
	:rtype: None
") Geom2dHatch_Element;
		 Geom2dHatch_Element (const Geom2dHatch_Element & Other);
		%feature("compactdefaultargs") Geom2dHatch_Element;
		%feature("autodoc", "	* Creates an element.

	:param Curve:
	:type Curve: Geom2dAdaptor_Curve &
	:param Orientation: default value is TopAbs_FORWARD
	:type Orientation: TopAbs_Orientation
	:rtype: None
") Geom2dHatch_Element;
		 Geom2dHatch_Element (const Geom2dAdaptor_Curve & Curve,const TopAbs_Orientation Orientation = TopAbs_FORWARD);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* Returns the curve associated to the element.

	:rtype: Geom2dAdaptor_Curve
") Curve;
		const Geom2dAdaptor_Curve & Curve ();
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "	* Returns the curve associated to the element.

	:rtype: Geom2dAdaptor_Curve
") ChangeCurve;
		Geom2dAdaptor_Curve & ChangeCurve ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	* Sets the orientation of the element.

	:param Orientation:
	:type Orientation: TopAbs_Orientation
	:rtype: None
") Orientation;
		void Orientation (const TopAbs_Orientation Orientation);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	* Returns the orientation of the element.

	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
};


%extend Geom2dHatch_Element {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dHatch_Elements;
class Geom2dHatch_Elements {
	public:
		%feature("compactdefaultargs") Geom2dHatch_Elements;
		%feature("autodoc", "	:rtype: None
") Geom2dHatch_Elements;
		 Geom2dHatch_Elements ();
		%feature("compactdefaultargs") Geom2dHatch_Elements;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2dHatch_Elements &
	:rtype: None
") Geom2dHatch_Elements;
		 Geom2dHatch_Elements (const Geom2dHatch_Elements & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int
	:param I:
	:type I: Geom2dHatch_Element &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer K,const Geom2dHatch_Element & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int
	:rtype: Geom2dHatch_Element
") Find;
		const Geom2dHatch_Element & Find (const Standard_Integer K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int
	:rtype: Geom2dHatch_Element
") ChangeFind;
		Geom2dHatch_Element & ChangeFind (const Standard_Integer K);
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


%extend Geom2dHatch_Elements {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dHatch_FClass2dOfClassifier;
class Geom2dHatch_FClass2dOfClassifier {
	public:
		%feature("compactdefaultargs") Geom2dHatch_FClass2dOfClassifier;
		%feature("autodoc", "	:rtype: None
") Geom2dHatch_FClass2dOfClassifier;
		 Geom2dHatch_FClass2dOfClassifier ();
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


%extend Geom2dHatch_FClass2dOfClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dHatch_Hatcher;
class Geom2dHatch_Hatcher {
	public:
		%feature("compactdefaultargs") Geom2dHatch_Hatcher;
		%feature("autodoc", "	* Returns an empty hatcher.

	:param Intersector:
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
		%feature("autodoc", "	* Sets the associated intersector.

	:param Intersector:
	:type Intersector: Geom2dHatch_Intersector &
	:rtype: None
") Intersector;
		void Intersector (const Geom2dHatch_Intersector & Intersector);
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "	* Returns the associated intersector.

	:rtype: Geom2dHatch_Intersector
") Intersector;
		const Geom2dHatch_Intersector & Intersector ();
		%feature("compactdefaultargs") ChangeIntersector;
		%feature("autodoc", "	* Returns the associated intersector.

	:rtype: Geom2dHatch_Intersector
") ChangeIntersector;
		Geom2dHatch_Intersector & ChangeIntersector ();
		%feature("compactdefaultargs") Confusion2d;
		%feature("autodoc", "	* Sets the confusion tolerance.

	:param Confusion:
	:type Confusion: float
	:rtype: None
") Confusion2d;
		void Confusion2d (const Standard_Real Confusion);
		%feature("compactdefaultargs") Confusion2d;
		%feature("autodoc", "	* Returns the 2d confusion tolerance, i.e. the value under which two points are considered identical in the parametric space of the hatching.

	:rtype: float
") Confusion2d;
		Standard_Real Confusion2d ();
		%feature("compactdefaultargs") Confusion3d;
		%feature("autodoc", "	* Sets the confusion tolerance.

	:param Confusion:
	:type Confusion: float
	:rtype: None
") Confusion3d;
		void Confusion3d (const Standard_Real Confusion);
		%feature("compactdefaultargs") Confusion3d;
		%feature("autodoc", "	* Returns the 3d confusion tolerance, i.e. the value under which two points are considered identical in the 3d space of the hatching.

	:rtype: float
") Confusion3d;
		Standard_Real Confusion3d ();
		%feature("compactdefaultargs") KeepPoints;
		%feature("autodoc", "	* Sets the above flag.

	:param Keep:
	:type Keep: bool
	:rtype: None
") KeepPoints;
		void KeepPoints (const Standard_Boolean Keep);
		%feature("compactdefaultargs") KeepPoints;
		%feature("autodoc", "	* Returns the flag about the points consideration.

	:rtype: bool
") KeepPoints;
		Standard_Boolean KeepPoints ();
		%feature("compactdefaultargs") KeepSegments;
		%feature("autodoc", "	* Sets the above flag.

	:param Keep:
	:type Keep: bool
	:rtype: None
") KeepSegments;
		void KeepSegments (const Standard_Boolean Keep);
		%feature("compactdefaultargs") KeepSegments;
		%feature("autodoc", "	* Returns the flag about the segments consideration.

	:rtype: bool
") KeepSegments;
		Standard_Boolean KeepSegments ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Removes all the hatchings and all the elements.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") ElementCurve;
		%feature("autodoc", "	* Returns the curve associated to the IndE-th element.

	:param IndE:
	:type IndE: int
	:rtype: Geom2dAdaptor_Curve
") ElementCurve;
		const Geom2dAdaptor_Curve & ElementCurve (const Standard_Integer IndE);
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "	* Adds an element to the hatcher and returns its index.

	:param Curve:
	:type Curve: Geom2dAdaptor_Curve &
	:param Orientation: default value is TopAbs_FORWARD
	:type Orientation: TopAbs_Orientation
	:rtype: int
") AddElement;
		Standard_Integer AddElement (const Geom2dAdaptor_Curve & Curve,const TopAbs_Orientation Orientation = TopAbs_FORWARD);
		%feature("compactdefaultargs") RemElement;
		%feature("autodoc", "	* Removes the IndE-th element from the hatcher.

	:param IndE:
	:type IndE: int
	:rtype: None
") RemElement;
		void RemElement (const Standard_Integer IndE);
		%feature("compactdefaultargs") ClrElements;
		%feature("autodoc", "	* Removes all the elements from the hatcher.

	:rtype: None
") ClrElements;
		void ClrElements ();
		%feature("compactdefaultargs") HatchingCurve;
		%feature("autodoc", "	* Returns the curve associated to the IndH-th hatching.

	:param IndH:
	:type IndH: int
	:rtype: Geom2dAdaptor_Curve
") HatchingCurve;
		const Geom2dAdaptor_Curve & HatchingCurve (const Standard_Integer IndH);
		%feature("compactdefaultargs") AddHatching;
		%feature("autodoc", "	* Adds a hatching to the hatcher and returns its index.

	:param Curve:
	:type Curve: Geom2dAdaptor_Curve &
	:rtype: int
") AddHatching;
		Standard_Integer AddHatching (const Geom2dAdaptor_Curve & Curve);
		%feature("compactdefaultargs") RemHatching;
		%feature("autodoc", "	* Removes the IndH-th hatching from the hatcher.

	:param IndH:
	:type IndH: int
	:rtype: None
") RemHatching;
		void RemHatching (const Standard_Integer IndH);
		%feature("compactdefaultargs") ClrHatchings;
		%feature("autodoc", "	* Removes all the hatchings from the hatcher.

	:rtype: None
") ClrHatchings;
		void ClrHatchings ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of intersection points of the IndH-th hatching.

	:param IndH:
	:type IndH: int
	:rtype: int
") NbPoints;
		Standard_Integer NbPoints (const Standard_Integer IndH);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the IndP-th intersection point of the IndH-th hatching.

	:param IndH:
	:type IndH: int
	:param IndP:
	:type IndP: int
	:rtype: HatchGen_PointOnHatching
") Point;
		const HatchGen_PointOnHatching & Point (const Standard_Integer IndH,const Standard_Integer IndP);
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	* Trims all the hatchings of the hatcher by all the elements of the hatcher.

	:rtype: None
") Trim;
		void Trim ();
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	* Adds a hatching to the hatcher and trims it by the elements already given and returns its index.

	:param Curve:
	:type Curve: Geom2dAdaptor_Curve &
	:rtype: int
") Trim;
		Standard_Integer Trim (const Geom2dAdaptor_Curve & Curve);
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	* Trims the IndH-th hatching by the elements already given.

	:param IndH:
	:type IndH: int
	:rtype: None
") Trim;
		void Trim (const Standard_Integer IndH);
		%feature("compactdefaultargs") ComputeDomains;
		%feature("autodoc", "	* Computes the domains of all the hatchings.

	:rtype: None
") ComputeDomains;
		void ComputeDomains ();
		%feature("compactdefaultargs") ComputeDomains;
		%feature("autodoc", "	* Computes the domains of the IndH-th hatching.

	:param IndH:
	:type IndH: int
	:rtype: None
") ComputeDomains;
		void ComputeDomains (const Standard_Integer IndH);
		%feature("compactdefaultargs") TrimDone;
		%feature("autodoc", "	* Returns the fact that the intersections were computed for the IndH-th hatching.

	:param IndH:
	:type IndH: int
	:rtype: bool
") TrimDone;
		Standard_Boolean TrimDone (const Standard_Integer IndH);
		%feature("compactdefaultargs") TrimFailed;
		%feature("autodoc", "	* Returns the fact that the intersections failed for the IndH-th hatching.

	:param IndH:
	:type IndH: int
	:rtype: bool
") TrimFailed;
		Standard_Boolean TrimFailed (const Standard_Integer IndH);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns the status about the IndH-th hatching.

	:param IndH:
	:type IndH: int
	:rtype: HatchGen_ErrorStatus
") Status;
		HatchGen_ErrorStatus Status (const Standard_Integer IndH);
		%feature("compactdefaultargs") NbDomains;
		%feature("autodoc", "	* Returns the number of domains of the IndH-th hatching. Only ONE 'INFINITE' domain means that the hatching is fully included in the contour defined by the elements.

	:param IndH:
	:type IndH: int
	:rtype: int
") NbDomains;
		Standard_Integer NbDomains (const Standard_Integer IndH);
		%feature("compactdefaultargs") Domain;
		%feature("autodoc", "	* Returns the IDom-th domain of the IndH-th hatching.

	:param IndH:
	:type IndH: int
	:param IDom:
	:type IDom: int
	:rtype: HatchGen_Domain
") Domain;
		const HatchGen_Domain & Domain (const Standard_Integer IndH,const Standard_Integer IDom);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dump the hatcher.

	:rtype: None
") Dump;
		void Dump ();
};


%extend Geom2dHatch_Hatcher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dHatch_Hatching;
class Geom2dHatch_Hatching {
	public:
		%feature("compactdefaultargs") Geom2dHatch_Hatching;
		%feature("autodoc", "	:rtype: None
") Geom2dHatch_Hatching;
		 Geom2dHatch_Hatching ();
		%feature("compactdefaultargs") Geom2dHatch_Hatching;
		%feature("autodoc", "	* Creates a hatching.

	:param Curve:
	:type Curve: Geom2dAdaptor_Curve &
	:rtype: None
") Geom2dHatch_Hatching;
		 Geom2dHatch_Hatching (const Geom2dAdaptor_Curve & Curve);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* Returns the curve associated to the hatching.

	:rtype: Geom2dAdaptor_Curve
") Curve;
		const Geom2dAdaptor_Curve & Curve ();
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "	* Returns the curve associated to the hatching.

	:rtype: Geom2dAdaptor_Curve
") ChangeCurve;
		Geom2dAdaptor_Curve & ChangeCurve ();
		%feature("compactdefaultargs") TrimDone;
		%feature("autodoc", "	* Sets the flag about the trimming computations to the given value.

	:param Flag:
	:type Flag: bool
	:rtype: None
") TrimDone;
		void TrimDone (const Standard_Boolean Flag);
		%feature("compactdefaultargs") TrimDone;
		%feature("autodoc", "	* Returns the flag about the trimming computations.

	:rtype: bool
") TrimDone;
		Standard_Boolean TrimDone ();
		%feature("compactdefaultargs") TrimFailed;
		%feature("autodoc", "	* Sets the flag about the trimming failure to the given value.

	:param Flag:
	:type Flag: bool
	:rtype: None
") TrimFailed;
		void TrimFailed (const Standard_Boolean Flag);
		%feature("compactdefaultargs") TrimFailed;
		%feature("autodoc", "	* Returns the flag about the trimming failure.

	:rtype: bool
") TrimFailed;
		Standard_Boolean TrimFailed ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Sets the flag about the domains computation to the given value.

	:param Flag:
	:type Flag: bool
	:rtype: None
") IsDone;
		void IsDone (const Standard_Boolean Flag);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns the flag about the domains computation.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Sets the error status.

	:param Status:
	:type Status: HatchGen_ErrorStatus
	:rtype: None
") Status;
		void Status (const HatchGen_ErrorStatus Status);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns the error status.

	:rtype: HatchGen_ErrorStatus
") Status;
		HatchGen_ErrorStatus Status ();
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "	* Adds an intersection point to the hatching.

	:param Point:
	:type Point: HatchGen_PointOnHatching &
	:param Confusion:
	:type Confusion: float
	:rtype: None
") AddPoint;
		void AddPoint (const HatchGen_PointOnHatching & Point,const Standard_Real Confusion);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of intersection points of the hatching.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the Index-th intersection point of the hatching. The exception OutOfRange is raised if Index < 1 or Index > NbPoints.

	:param Index:
	:type Index: int
	:rtype: HatchGen_PointOnHatching
") Point;
		const HatchGen_PointOnHatching & Point (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "	* Returns the Index-th intersection point of the hatching. The exception OutOfRange is raised if Index < 1 or Index > NbPoints.

	:param Index:
	:type Index: int
	:rtype: HatchGen_PointOnHatching
") ChangePoint;
		HatchGen_PointOnHatching & ChangePoint (const Standard_Integer Index);
		%feature("compactdefaultargs") RemPoint;
		%feature("autodoc", "	* Removes the Index-th intersection point of the hatching. The exception OutOfRange is raised if Index < 1 or Index > NbPoints.

	:param Index:
	:type Index: int
	:rtype: None
") RemPoint;
		void RemPoint (const Standard_Integer Index);
		%feature("compactdefaultargs") ClrPoints;
		%feature("autodoc", "	* Removes all the intersection points of the hatching.

	:rtype: None
") ClrPoints;
		void ClrPoints ();
		%feature("compactdefaultargs") AddDomain;
		%feature("autodoc", "	* Adds a domain to the hatching.

	:param Domain:
	:type Domain: HatchGen_Domain &
	:rtype: None
") AddDomain;
		void AddDomain (const HatchGen_Domain & Domain);
		%feature("compactdefaultargs") NbDomains;
		%feature("autodoc", "	* Returns the number of domains of the hatching.

	:rtype: int
") NbDomains;
		Standard_Integer NbDomains ();
		%feature("compactdefaultargs") Domain;
		%feature("autodoc", "	* Returns the Index-th domain of the hatching. The exception OutOfRange is raised if Index < 1 or Index > NbDomains.

	:param Index:
	:type Index: int
	:rtype: HatchGen_Domain
") Domain;
		const HatchGen_Domain & Domain (const Standard_Integer Index);
		%feature("compactdefaultargs") RemDomain;
		%feature("autodoc", "	* Removes the Index-th domain of the hatching. The exception OutOfRange is raised if Index < 1 or Index > NbDomains.

	:param Index:
	:type Index: int
	:rtype: None
") RemDomain;
		void RemDomain (const Standard_Integer Index);
		%feature("compactdefaultargs") ClrDomains;
		%feature("autodoc", "	* Removes all the domains of the hatching.

	:rtype: None
") ClrDomains;
		void ClrDomains ();
		%feature("compactdefaultargs") ClassificationPoint;
		%feature("autodoc", "	* Returns a point on the curve. This point will be used for the classification.

	:rtype: gp_Pnt2d
") ClassificationPoint;
		gp_Pnt2d ClassificationPoint ();
};


%extend Geom2dHatch_Hatching {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dHatch_Hatchings;
class Geom2dHatch_Hatchings : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") Geom2dHatch_Hatchings;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") Geom2dHatch_Hatchings;
		 Geom2dHatch_Hatchings (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2dHatch_Hatchings &
	:rtype: Geom2dHatch_Hatchings
") Assign;
		Geom2dHatch_Hatchings & Assign (const Geom2dHatch_Hatchings & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2dHatch_Hatchings &
	:rtype: Geom2dHatch_Hatchings
") operator =;
		Geom2dHatch_Hatchings & operator = (const Geom2dHatch_Hatchings & Other);
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
	:type I: Geom2dHatch_Hatching &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const Geom2dHatch_Hatching & I);
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
	:rtype: Geom2dHatch_Hatching
") Find;
		const Geom2dHatch_Hatching & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Geom2dHatch_Hatching
") ChangeFind;
		Geom2dHatch_Hatching & ChangeFind (const Standard_Integer & K);
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


%extend Geom2dHatch_Hatchings {
	%pythoncode {
	__repr__ = _dumps_object
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


%extend Geom2dHatch_Intersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dHatch_MapOfElements;
class Geom2dHatch_MapOfElements : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") Geom2dHatch_MapOfElements;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") Geom2dHatch_MapOfElements;
		 Geom2dHatch_MapOfElements (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2dHatch_MapOfElements &
	:rtype: Geom2dHatch_MapOfElements
") Assign;
		Geom2dHatch_MapOfElements & Assign (const Geom2dHatch_MapOfElements & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2dHatch_MapOfElements &
	:rtype: Geom2dHatch_MapOfElements
") operator =;
		Geom2dHatch_MapOfElements & operator = (const Geom2dHatch_MapOfElements & Other);
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
	:type I: Geom2dHatch_Element &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const Geom2dHatch_Element & I);
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
	:rtype: Geom2dHatch_Element
") Find;
		const Geom2dHatch_Element & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Geom2dHatch_Element
") ChangeFind;
		Geom2dHatch_Element & ChangeFind (const Standard_Integer & K);
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


%extend Geom2dHatch_MapOfElements {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
