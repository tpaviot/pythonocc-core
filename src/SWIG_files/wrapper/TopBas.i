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
%module (package="OCC") TopBas

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


%include TopBas_headers.i


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

%nodefaultctor TopBas_ListIteratorOfListOfTestInterference;
class TopBas_ListIteratorOfListOfTestInterference {
	public:
		%feature("compactdefaultargs") TopBas_ListIteratorOfListOfTestInterference;
		%feature("autodoc", "	:rtype: None
") TopBas_ListIteratorOfListOfTestInterference;
		 TopBas_ListIteratorOfListOfTestInterference ();
		%feature("compactdefaultargs") TopBas_ListIteratorOfListOfTestInterference;
		%feature("autodoc", "	:param L:
	:type L: TopBas_ListOfTestInterference &
	:rtype: None
") TopBas_ListIteratorOfListOfTestInterference;
		 TopBas_ListIteratorOfListOfTestInterference (const TopBas_ListOfTestInterference & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TopBas_ListOfTestInterference &
	:rtype: None
") Initialize;
		void Initialize (const TopBas_ListOfTestInterference & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopBas_TestInterference
") Value;
		TopBas_TestInterference & Value ();
};


%extend TopBas_ListIteratorOfListOfTestInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopBas_ListNodeOfListOfTestInterference;
class TopBas_ListNodeOfListOfTestInterference : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopBas_ListNodeOfListOfTestInterference;
		%feature("autodoc", "	:param I:
	:type I: TopBas_TestInterference &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopBas_ListNodeOfListOfTestInterference;
		 TopBas_ListNodeOfListOfTestInterference (const TopBas_TestInterference & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopBas_TestInterference
") Value;
		TopBas_TestInterference & Value ();
};


%extend TopBas_ListNodeOfListOfTestInterference {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopBas_ListNodeOfListOfTestInterference(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopBas_ListNodeOfListOfTestInterference::Handle_TopBas_ListNodeOfListOfTestInterference %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopBas_ListNodeOfListOfTestInterference* _get_reference() {
    return (TopBas_ListNodeOfListOfTestInterference*)$self->Access();
    }
};

%extend Handle_TopBas_ListNodeOfListOfTestInterference {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopBas_ListNodeOfListOfTestInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopBas_ListOfTestInterference;
class TopBas_ListOfTestInterference {
	public:
		%feature("compactdefaultargs") TopBas_ListOfTestInterference;
		%feature("autodoc", "	:rtype: None
") TopBas_ListOfTestInterference;
		 TopBas_ListOfTestInterference ();
		%feature("compactdefaultargs") TopBas_ListOfTestInterference;
		%feature("autodoc", "	:param Other:
	:type Other: TopBas_ListOfTestInterference &
	:rtype: None
") TopBas_ListOfTestInterference;
		 TopBas_ListOfTestInterference (const TopBas_ListOfTestInterference & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopBas_ListOfTestInterference &
	:rtype: None
") Assign;
		void Assign (const TopBas_ListOfTestInterference & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopBas_ListOfTestInterference &
	:rtype: None
") operator =;
		void operator = (const TopBas_ListOfTestInterference & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TopBas_TestInterference &
	:rtype: None
") Prepend;
		void Prepend (const TopBas_TestInterference & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TopBas_TestInterference &
	:param theIt:
	:type theIt: TopBas_ListIteratorOfListOfTestInterference &
	:rtype: None
") Prepend;
		void Prepend (const TopBas_TestInterference & I,TopBas_ListIteratorOfListOfTestInterference & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TopBas_ListOfTestInterference &
	:rtype: None
") Prepend;
		void Prepend (TopBas_ListOfTestInterference & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TopBas_TestInterference &
	:rtype: None
") Append;
		void Append (const TopBas_TestInterference & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TopBas_TestInterference &
	:param theIt:
	:type theIt: TopBas_ListIteratorOfListOfTestInterference &
	:rtype: None
") Append;
		void Append (const TopBas_TestInterference & I,TopBas_ListIteratorOfListOfTestInterference & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TopBas_ListOfTestInterference &
	:rtype: None
") Append;
		void Append (TopBas_ListOfTestInterference & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TopBas_TestInterference
") First;
		TopBas_TestInterference & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TopBas_TestInterference
") Last;
		TopBas_TestInterference & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TopBas_ListIteratorOfListOfTestInterference &
	:rtype: None
") Remove;
		void Remove (TopBas_ListIteratorOfListOfTestInterference & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: TopBas_TestInterference &
	:param It:
	:type It: TopBas_ListIteratorOfListOfTestInterference &
	:rtype: None
") InsertBefore;
		void InsertBefore (const TopBas_TestInterference & I,TopBas_ListIteratorOfListOfTestInterference & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TopBas_ListOfTestInterference &
	:param It:
	:type It: TopBas_ListIteratorOfListOfTestInterference &
	:rtype: None
") InsertBefore;
		void InsertBefore (TopBas_ListOfTestInterference & Other,TopBas_ListIteratorOfListOfTestInterference & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: TopBas_TestInterference &
	:param It:
	:type It: TopBas_ListIteratorOfListOfTestInterference &
	:rtype: None
") InsertAfter;
		void InsertAfter (const TopBas_TestInterference & I,TopBas_ListIteratorOfListOfTestInterference & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TopBas_ListOfTestInterference &
	:param It:
	:type It: TopBas_ListIteratorOfListOfTestInterference &
	:rtype: None
") InsertAfter;
		void InsertAfter (TopBas_ListOfTestInterference & Other,TopBas_ListIteratorOfListOfTestInterference & It);
};


%extend TopBas_ListOfTestInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopBas_TestInterference;
class TopBas_TestInterference {
	public:
		%feature("compactdefaultargs") TopBas_TestInterference;
		%feature("autodoc", "	:rtype: None
") TopBas_TestInterference;
		 TopBas_TestInterference ();
		%feature("compactdefaultargs") TopBas_TestInterference;
		%feature("autodoc", "	:param Inters:
	:type Inters: float &
	:param Bound:
	:type Bound: int &
	:param Orient:
	:type Orient: TopAbs_Orientation
	:param Trans:
	:type Trans: TopAbs_Orientation
	:param BTrans:
	:type BTrans: TopAbs_Orientation
	:rtype: None
") TopBas_TestInterference;
		 TopBas_TestInterference (const Standard_Real & Inters,const Standard_Integer & Bound,const TopAbs_Orientation Orient,const TopAbs_Orientation Trans,const TopAbs_Orientation BTrans);
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "	:param I:
	:type I: float &
	:rtype: None
") Intersection;
		void Intersection (const Standard_Real & I);
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "	:param B:
	:type B: int &
	:rtype: None
") Boundary;
		void Boundary (const Standard_Integer & B);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:param O:
	:type O: TopAbs_Orientation
	:rtype: None
") Orientation;
		void Orientation (const TopAbs_Orientation O);
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	:param Tr:
	:type Tr: TopAbs_Orientation
	:rtype: None
") Transition;
		void Transition (const TopAbs_Orientation Tr);
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "	:param BTr:
	:type BTr: TopAbs_Orientation
	:rtype: None
") BoundaryTransition;
		void BoundaryTransition (const TopAbs_Orientation BTr);
		%feature("compactdefaultargs") Intersection;
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
            		%feature("compactdefaultargs") Boundary;
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
            		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Transition;
		TopAbs_Orientation Transition ();
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition ();
};


%extend TopBas_TestInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
