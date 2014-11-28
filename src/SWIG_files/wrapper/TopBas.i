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
%module (package="OCC") TopBas

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

%include TopBas_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor TopBas_ListIteratorOfListOfTestInterference;
class TopBas_ListIteratorOfListOfTestInterference {
	public:
		%feature("autodoc", "	:rtype: None
") TopBas_ListIteratorOfListOfTestInterference;
		 TopBas_ListIteratorOfListOfTestInterference ();
		%feature("autodoc", "	:param L:
	:type L: TopBas_ListOfTestInterference &
	:rtype: None
") TopBas_ListIteratorOfListOfTestInterference;
		 TopBas_ListIteratorOfListOfTestInterference (const TopBas_ListOfTestInterference & L);
		%feature("autodoc", "	:param L:
	:type L: TopBas_ListOfTestInterference &
	:rtype: None
") Initialize;
		void Initialize (const TopBas_ListOfTestInterference & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: TopBas_TestInterference
") Value;
		TopBas_TestInterference & Value ();
};


%feature("shadow") TopBas_ListIteratorOfListOfTestInterference::~TopBas_ListIteratorOfListOfTestInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopBas_ListIteratorOfListOfTestInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopBas_ListNodeOfListOfTestInterference;
class TopBas_ListNodeOfListOfTestInterference : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: TopBas_TestInterference &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopBas_ListNodeOfListOfTestInterference;
		 TopBas_ListNodeOfListOfTestInterference (const TopBas_TestInterference & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopBas_TestInterference
") Value;
		TopBas_TestInterference & Value ();
};


%feature("shadow") TopBas_ListNodeOfListOfTestInterference::~TopBas_ListNodeOfListOfTestInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopBas_ListNodeOfListOfTestInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopBas_ListNodeOfListOfTestInterference {
	Handle_TopBas_ListNodeOfListOfTestInterference GetHandle() {
	return *(Handle_TopBas_ListNodeOfListOfTestInterference*) &$self;
	}
};

%nodefaultctor Handle_TopBas_ListNodeOfListOfTestInterference;
class Handle_TopBas_ListNodeOfListOfTestInterference : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopBas_ListNodeOfListOfTestInterference();
        Handle_TopBas_ListNodeOfListOfTestInterference(const Handle_TopBas_ListNodeOfListOfTestInterference &aHandle);
        Handle_TopBas_ListNodeOfListOfTestInterference(const TopBas_ListNodeOfListOfTestInterference *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopBas_ListNodeOfListOfTestInterference DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopBas_ListNodeOfListOfTestInterference {
    TopBas_ListNodeOfListOfTestInterference* GetObject() {
    return (TopBas_ListNodeOfListOfTestInterference*)$self->Access();
    }
};
%feature("shadow") Handle_TopBas_ListNodeOfListOfTestInterference::~Handle_TopBas_ListNodeOfListOfTestInterference %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopBas_ListNodeOfListOfTestInterference {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopBas_ListOfTestInterference;
class TopBas_ListOfTestInterference {
	public:
		%feature("autodoc", "	:rtype: None
") TopBas_ListOfTestInterference;
		 TopBas_ListOfTestInterference ();
		%feature("autodoc", "	:param Other:
	:type Other: TopBas_ListOfTestInterference &
	:rtype: None
") Assign;
		void Assign (const TopBas_ListOfTestInterference & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopBas_ListOfTestInterference &
	:rtype: None
") operator=;
		void operator = (const TopBas_ListOfTestInterference & Other);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param I:
	:type I: TopBas_TestInterference &
	:rtype: None
") Prepend;
		void Prepend (const TopBas_TestInterference & I);
		%feature("autodoc", "	:param I:
	:type I: TopBas_TestInterference &
	:param theIt:
	:type theIt: TopBas_ListIteratorOfListOfTestInterference &
	:rtype: None
") Prepend;
		void Prepend (const TopBas_TestInterference & I,TopBas_ListIteratorOfListOfTestInterference & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: TopBas_ListOfTestInterference &
	:rtype: None
") Prepend;
		void Prepend (TopBas_ListOfTestInterference & Other);
		%feature("autodoc", "	:param I:
	:type I: TopBas_TestInterference &
	:rtype: None
") Append;
		void Append (const TopBas_TestInterference & I);
		%feature("autodoc", "	:param I:
	:type I: TopBas_TestInterference &
	:param theIt:
	:type theIt: TopBas_ListIteratorOfListOfTestInterference &
	:rtype: None
") Append;
		void Append (const TopBas_TestInterference & I,TopBas_ListIteratorOfListOfTestInterference & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: TopBas_ListOfTestInterference &
	:rtype: None
") Append;
		void Append (TopBas_ListOfTestInterference & Other);
		%feature("autodoc", "	:rtype: TopBas_TestInterference
") First;
		TopBas_TestInterference & First ();
		%feature("autodoc", "	:rtype: TopBas_TestInterference
") Last;
		TopBas_TestInterference & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: TopBas_ListIteratorOfListOfTestInterference &
	:rtype: None
") Remove;
		void Remove (TopBas_ListIteratorOfListOfTestInterference & It);
		%feature("autodoc", "	:param I:
	:type I: TopBas_TestInterference &
	:param It:
	:type It: TopBas_ListIteratorOfListOfTestInterference &
	:rtype: None
") InsertBefore;
		void InsertBefore (const TopBas_TestInterference & I,TopBas_ListIteratorOfListOfTestInterference & It);
		%feature("autodoc", "	:param Other:
	:type Other: TopBas_ListOfTestInterference &
	:param It:
	:type It: TopBas_ListIteratorOfListOfTestInterference &
	:rtype: None
") InsertBefore;
		void InsertBefore (TopBas_ListOfTestInterference & Other,TopBas_ListIteratorOfListOfTestInterference & It);
		%feature("autodoc", "	:param I:
	:type I: TopBas_TestInterference &
	:param It:
	:type It: TopBas_ListIteratorOfListOfTestInterference &
	:rtype: None
") InsertAfter;
		void InsertAfter (const TopBas_TestInterference & I,TopBas_ListIteratorOfListOfTestInterference & It);
		%feature("autodoc", "	:param Other:
	:type Other: TopBas_ListOfTestInterference &
	:param It:
	:type It: TopBas_ListIteratorOfListOfTestInterference &
	:rtype: None
") InsertAfter;
		void InsertAfter (TopBas_ListOfTestInterference & Other,TopBas_ListIteratorOfListOfTestInterference & It);
};


%feature("shadow") TopBas_ListOfTestInterference::~TopBas_ListOfTestInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopBas_ListOfTestInterference {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopBas_TestInterference;
class TopBas_TestInterference {
	public:
		%feature("autodoc", "	:rtype: None
") TopBas_TestInterference;
		 TopBas_TestInterference ();
		%feature("autodoc", "	:param Inters:
	:type Inters: float &
	:param Bound:
	:type Bound: Standard_Integer &
	:param Orient:
	:type Orient: TopAbs_Orientation
	:param Trans:
	:type Trans: TopAbs_Orientation
	:param BTrans:
	:type BTrans: TopAbs_Orientation
	:rtype: None
") TopBas_TestInterference;
		 TopBas_TestInterference (const Standard_Real & Inters,const Standard_Integer & Bound,const TopAbs_Orientation Orient,const TopAbs_Orientation Trans,const TopAbs_Orientation BTrans);
		%feature("autodoc", "	:param I:
	:type I: float &
	:rtype: None
") Intersection;
		void Intersection (const Standard_Real & I);
		%feature("autodoc", "	:param B:
	:type B: Standard_Integer &
	:rtype: None
") Boundary;
		void Boundary (const Standard_Integer & B);
		%feature("autodoc", "	:param O:
	:type O: TopAbs_Orientation
	:rtype: None
") Orientation;
		void Orientation (const TopAbs_Orientation O);
		%feature("autodoc", "	:param Tr:
	:type Tr: TopAbs_Orientation
	:rtype: None
") Transition;
		void Transition (const TopAbs_Orientation Tr);
		%feature("autodoc", "	:param BTr:
	:type BTr: TopAbs_Orientation
	:rtype: None
") BoundaryTransition;
		void BoundaryTransition (const TopAbs_Orientation BTr);
		%feature("autodoc", "	:rtype: float
") Intersection;
		const Standard_Real & Intersection ();

            %feature("autodoc","1");
            %extend {
                Standard_Real GetChangeIntersection() {
                return (Standard_Real) $self->ChangeIntersection();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetChangeIntersection(Standard_Real value ) {
                $self->ChangeIntersection()=value;
                }
            };
            		%feature("autodoc", "	:rtype: int
") Boundary;
		const Standard_Integer & Boundary ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetChangeBoundary() {
                return (Standard_Integer) $self->ChangeBoundary();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetChangeBoundary(Standard_Integer value ) {
                $self->ChangeBoundary()=value;
                }
            };
            		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Transition;
		TopAbs_Orientation Transition ();
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition ();
};


%feature("shadow") TopBas_TestInterference::~TopBas_TestInterference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopBas_TestInterference {
	void _kill_pointed() {
		delete $self;
	}
};
