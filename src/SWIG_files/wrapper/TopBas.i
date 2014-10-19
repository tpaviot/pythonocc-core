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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopBas_ListIteratorOfListOfTestInterference;
		 TopBas_ListIteratorOfListOfTestInterference ();
		%feature("autodoc", "Args:
	L(TopBas_ListOfTestInterference)

Returns:
	None

No detailed docstring for this function.") TopBas_ListIteratorOfListOfTestInterference;
		 TopBas_ListIteratorOfListOfTestInterference (const TopBas_ListOfTestInterference & L);
		%feature("autodoc", "Args:
	L(TopBas_ListOfTestInterference)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopBas_ListOfTestInterference & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TopBas_TestInterference

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(TopBas_TestInterference)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopBas_ListNodeOfListOfTestInterference;
		 TopBas_ListNodeOfListOfTestInterference (const TopBas_TestInterference & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopBas_TestInterference

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopBas_ListOfTestInterference;
		 TopBas_ListOfTestInterference ();
		%feature("autodoc", "Args:
	Other(TopBas_ListOfTestInterference)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TopBas_ListOfTestInterference & Other);
		%feature("autodoc", "Args:
	Other(TopBas_ListOfTestInterference)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TopBas_ListOfTestInterference & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(TopBas_TestInterference)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopBas_TestInterference & I);
		%feature("autodoc", "Args:
	I(TopBas_TestInterference)
	theIt(TopBas_ListIteratorOfListOfTestInterference)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopBas_TestInterference & I,TopBas_ListIteratorOfListOfTestInterference & theIt);
		%feature("autodoc", "Args:
	Other(TopBas_ListOfTestInterference)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TopBas_ListOfTestInterference & Other);
		%feature("autodoc", "Args:
	I(TopBas_TestInterference)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopBas_TestInterference & I);
		%feature("autodoc", "Args:
	I(TopBas_TestInterference)
	theIt(TopBas_ListIteratorOfListOfTestInterference)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopBas_TestInterference & I,TopBas_ListIteratorOfListOfTestInterference & theIt);
		%feature("autodoc", "Args:
	Other(TopBas_ListOfTestInterference)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TopBas_ListOfTestInterference & Other);
		%feature("autodoc", "Args:
	None
Returns:
	TopBas_TestInterference

No detailed docstring for this function.") First;
		TopBas_TestInterference & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TopBas_TestInterference

No detailed docstring for this function.") Last;
		TopBas_TestInterference & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TopBas_ListIteratorOfListOfTestInterference)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TopBas_ListIteratorOfListOfTestInterference & It);
		%feature("autodoc", "Args:
	I(TopBas_TestInterference)
	It(TopBas_ListIteratorOfListOfTestInterference)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const TopBas_TestInterference & I,TopBas_ListIteratorOfListOfTestInterference & It);
		%feature("autodoc", "Args:
	Other(TopBas_ListOfTestInterference)
	It(TopBas_ListIteratorOfListOfTestInterference)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TopBas_ListOfTestInterference & Other,TopBas_ListIteratorOfListOfTestInterference & It);
		%feature("autodoc", "Args:
	I(TopBas_TestInterference)
	It(TopBas_ListIteratorOfListOfTestInterference)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const TopBas_TestInterference & I,TopBas_ListIteratorOfListOfTestInterference & It);
		%feature("autodoc", "Args:
	Other(TopBas_ListOfTestInterference)
	It(TopBas_ListIteratorOfListOfTestInterference)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopBas_TestInterference;
		 TopBas_TestInterference ();
		%feature("autodoc", "Args:
	Inters(Standard_Real)
	Bound(Standard_Integer)
	Orient(TopAbs_Orientation)
	Trans(TopAbs_Orientation)
	BTrans(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") TopBas_TestInterference;
		 TopBas_TestInterference (const Standard_Real & Inters,Standard_Integer &OutValue,const TopAbs_Orientation Orient,const TopAbs_Orientation Trans,const TopAbs_Orientation BTrans);
		%feature("autodoc", "Args:
	I(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Intersection;
		void Intersection (const Standard_Real & I);
		%feature("autodoc", "Args:
	B(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Boundary;
		void Boundary (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	O(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") Orientation;
		void Orientation (const TopAbs_Orientation O);
		%feature("autodoc", "Args:
	Tr(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") Transition;
		void Transition (const TopAbs_Orientation Tr);
		%feature("autodoc", "Args:
	BTr(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") BoundaryTransition;
		void BoundaryTransition (const TopAbs_Orientation BTr);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Intersection;
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
            		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Boundary;
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
            		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Transition;
		TopAbs_Orientation Transition ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") BoundaryTransition;
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
