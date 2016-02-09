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
%module (package="OCC") SelectBasics

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


%include SelectBasics_headers.i


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

%rename(selectbasics) SelectBasics;
class SelectBasics {
	public:
		%feature("compactdefaultargs") MaxOwnerPriority;
		%feature("autodoc", "	* Structure to provide all-in-one information on picking arguments for 'Matches' method of SelectBasics_SensitiveEntity.

	:rtype: int
") MaxOwnerPriority;
		static Standard_Integer MaxOwnerPriority ();
		%feature("compactdefaultargs") MinOwnerPriority;
		%feature("autodoc", "	:rtype: int
") MinOwnerPriority;
		static Standard_Integer MinOwnerPriority ();
};


class SelectBasics_BasicTool {
	public:
		%feature("compactdefaultargs") MatchSegments;
		%feature("autodoc", "	* returns True if The Segment {P1P2} is intersected by the segment {P3P4}

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:param P3:
	:type P3: gp_Pnt2d
	:param P4:
	:type P4: gp_Pnt2d
	:rtype: bool
") MatchSegments;
		static Standard_Boolean MatchSegments (const gp_Pnt2d & P1,const gp_Pnt2d & P2,const gp_Pnt2d & P3,const gp_Pnt2d & P4);
		%feature("compactdefaultargs") MatchSegment;
		%feature("autodoc", "	* return True if Segment(pBegin, pEnd) is Selected

	:param pBegin:
	:type pBegin: gp_Pnt2d
	:param pEnd:
	:type pEnd: gp_Pnt2d
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param aTol:
	:type aTol: float
	:param DMin:
	:type DMin: float &
	:rtype: bool
") MatchSegment;
		static Standard_Boolean MatchSegment (const gp_Pnt2d & pBegin,const gp_Pnt2d & pEnd,const Standard_Real X,const Standard_Real Y,const Standard_Real aTol,Standard_Real &OutValue);
		%feature("compactdefaultargs") AutoInter;
		%feature("autodoc", "	:param aPolyg2d:
	:type aPolyg2d: TColgp_Array1OfPnt2d
	:rtype: bool
") AutoInter;
		static Standard_Boolean AutoInter (const TColgp_Array1OfPnt2d & aPolyg2d);
		%feature("compactdefaultargs") MatchPolyg2d;
		%feature("autodoc", "	* package method used to find if a point is close enough to a polygon of 2D points to be Used by Primitives like curves or faces... Rank gives the index of the touched segment

	:param tabpoint:
	:type tabpoint: TColgp_Array1OfPnt2d
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param aTol:
	:type aTol: float
	:param DMin:
	:type DMin: float &
	:param Rank:
	:type Rank: int &
	:rtype: bool
") MatchPolyg2d;
		static Standard_Boolean MatchPolyg2d (const TColgp_Array1OfPnt2d & tabpoint,const Standard_Real X,const Standard_Real Y,const Standard_Real aTol,Standard_Real &OutValue,Standard_Integer &OutValue);
};


%nodefaultctor SelectBasics_EntityOwner;
class SelectBasics_EntityOwner : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* sets the selectable priority of the owner

	:param aPriority:
	:type aPriority: int
	:rtype: None
") Set;
		void Set (const Standard_Integer aPriority);
		%feature("compactdefaultargs") Priority;
		%feature("autodoc", "	:rtype: int
") Priority;
		Standard_Integer Priority ();
		%feature("compactdefaultargs") HasLocation;
		%feature("autodoc", "	:rtype: bool
") HasLocation;
		virtual Standard_Boolean HasLocation ();
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	:param aLoc:
	:type aLoc: TopLoc_Location &
	:rtype: void
") SetLocation;
		virtual void SetLocation (const TopLoc_Location & aLoc);
		%feature("compactdefaultargs") ResetLocation;
		%feature("autodoc", "	:rtype: void
") ResetLocation;
		virtual void ResetLocation ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	:rtype: TopLoc_Location
") Location;
		virtual const TopLoc_Location & Location ();
};


%extend SelectBasics_EntityOwner {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectBasics_EntityOwner(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectBasics_EntityOwner::Handle_SelectBasics_EntityOwner %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectBasics_EntityOwner;
class Handle_SelectBasics_EntityOwner : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_SelectBasics_EntityOwner();
        Handle_SelectBasics_EntityOwner(const Handle_SelectBasics_EntityOwner &aHandle);
        Handle_SelectBasics_EntityOwner(const SelectBasics_EntityOwner *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectBasics_EntityOwner DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectBasics_EntityOwner {
    SelectBasics_EntityOwner* GetObject() {
    return (SelectBasics_EntityOwner*)$self->Access();
    }
};

%nodefaultctor SelectBasics_ListIteratorOfListOfBox2d;
class SelectBasics_ListIteratorOfListOfBox2d {
	public:
		%feature("compactdefaultargs") SelectBasics_ListIteratorOfListOfBox2d;
		%feature("autodoc", "	:rtype: None
") SelectBasics_ListIteratorOfListOfBox2d;
		 SelectBasics_ListIteratorOfListOfBox2d ();
		%feature("compactdefaultargs") SelectBasics_ListIteratorOfListOfBox2d;
		%feature("autodoc", "	:param L:
	:type L: SelectBasics_ListOfBox2d &
	:rtype: None
") SelectBasics_ListIteratorOfListOfBox2d;
		 SelectBasics_ListIteratorOfListOfBox2d (const SelectBasics_ListOfBox2d & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: SelectBasics_ListOfBox2d &
	:rtype: None
") Initialize;
		void Initialize (const SelectBasics_ListOfBox2d & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Bnd_Box2d
") Value;
		Bnd_Box2d & Value ();
};


%nodefaultctor SelectBasics_ListIteratorOfListOfSensitive;
class SelectBasics_ListIteratorOfListOfSensitive {
	public:
		%feature("compactdefaultargs") SelectBasics_ListIteratorOfListOfSensitive;
		%feature("autodoc", "	:rtype: None
") SelectBasics_ListIteratorOfListOfSensitive;
		 SelectBasics_ListIteratorOfListOfSensitive ();
		%feature("compactdefaultargs") SelectBasics_ListIteratorOfListOfSensitive;
		%feature("autodoc", "	:param L:
	:type L: SelectBasics_ListOfSensitive &
	:rtype: None
") SelectBasics_ListIteratorOfListOfSensitive;
		 SelectBasics_ListIteratorOfListOfSensitive (const SelectBasics_ListOfSensitive & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: SelectBasics_ListOfSensitive &
	:rtype: None
") Initialize;
		void Initialize (const SelectBasics_ListOfSensitive & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_SelectBasics_SensitiveEntity
") Value;
		Handle_SelectBasics_SensitiveEntity Value ();
};


%nodefaultctor SelectBasics_ListNodeOfListOfBox2d;
class SelectBasics_ListNodeOfListOfBox2d : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") SelectBasics_ListNodeOfListOfBox2d;
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box2d &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") SelectBasics_ListNodeOfListOfBox2d;
		 SelectBasics_ListNodeOfListOfBox2d (const Bnd_Box2d & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Bnd_Box2d
") Value;
		Bnd_Box2d & Value ();
};


%extend SelectBasics_ListNodeOfListOfBox2d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectBasics_ListNodeOfListOfBox2d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectBasics_ListNodeOfListOfBox2d::Handle_SelectBasics_ListNodeOfListOfBox2d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectBasics_ListNodeOfListOfBox2d;
class Handle_SelectBasics_ListNodeOfListOfBox2d : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_SelectBasics_ListNodeOfListOfBox2d();
        Handle_SelectBasics_ListNodeOfListOfBox2d(const Handle_SelectBasics_ListNodeOfListOfBox2d &aHandle);
        Handle_SelectBasics_ListNodeOfListOfBox2d(const SelectBasics_ListNodeOfListOfBox2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectBasics_ListNodeOfListOfBox2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectBasics_ListNodeOfListOfBox2d {
    SelectBasics_ListNodeOfListOfBox2d* GetObject() {
    return (SelectBasics_ListNodeOfListOfBox2d*)$self->Access();
    }
};

%nodefaultctor SelectBasics_ListNodeOfListOfSensitive;
class SelectBasics_ListNodeOfListOfSensitive : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") SelectBasics_ListNodeOfListOfSensitive;
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectBasics_SensitiveEntity &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") SelectBasics_ListNodeOfListOfSensitive;
		 SelectBasics_ListNodeOfListOfSensitive (const Handle_SelectBasics_SensitiveEntity & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_SelectBasics_SensitiveEntity
") Value;
		Handle_SelectBasics_SensitiveEntity Value ();
};


%extend SelectBasics_ListNodeOfListOfSensitive {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectBasics_ListNodeOfListOfSensitive(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectBasics_ListNodeOfListOfSensitive::Handle_SelectBasics_ListNodeOfListOfSensitive %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectBasics_ListNodeOfListOfSensitive;
class Handle_SelectBasics_ListNodeOfListOfSensitive : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_SelectBasics_ListNodeOfListOfSensitive();
        Handle_SelectBasics_ListNodeOfListOfSensitive(const Handle_SelectBasics_ListNodeOfListOfSensitive &aHandle);
        Handle_SelectBasics_ListNodeOfListOfSensitive(const SelectBasics_ListNodeOfListOfSensitive *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectBasics_ListNodeOfListOfSensitive DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectBasics_ListNodeOfListOfSensitive {
    SelectBasics_ListNodeOfListOfSensitive* GetObject() {
    return (SelectBasics_ListNodeOfListOfSensitive*)$self->Access();
    }
};

%nodefaultctor SelectBasics_ListOfBox2d;
class SelectBasics_ListOfBox2d {
	public:
		%feature("compactdefaultargs") SelectBasics_ListOfBox2d;
		%feature("autodoc", "	:rtype: None
") SelectBasics_ListOfBox2d;
		 SelectBasics_ListOfBox2d ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfBox2d &
	:rtype: None
") Assign;
		void Assign (const SelectBasics_ListOfBox2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfBox2d &
	:rtype: None
") operator=;
		void operator = (const SelectBasics_ListOfBox2d & Other);
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
	:type I: Bnd_Box2d &
	:rtype: None
") Prepend;
		void Prepend (const Bnd_Box2d & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box2d &
	:param theIt:
	:type theIt: SelectBasics_ListIteratorOfListOfBox2d &
	:rtype: None
") Prepend;
		void Prepend (const Bnd_Box2d & I,SelectBasics_ListIteratorOfListOfBox2d & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfBox2d &
	:rtype: None
") Prepend;
		void Prepend (SelectBasics_ListOfBox2d & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box2d &
	:rtype: None
") Append;
		void Append (const Bnd_Box2d & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box2d &
	:param theIt:
	:type theIt: SelectBasics_ListIteratorOfListOfBox2d &
	:rtype: None
") Append;
		void Append (const Bnd_Box2d & I,SelectBasics_ListIteratorOfListOfBox2d & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfBox2d &
	:rtype: None
") Append;
		void Append (SelectBasics_ListOfBox2d & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Bnd_Box2d
") First;
		Bnd_Box2d & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Bnd_Box2d
") Last;
		Bnd_Box2d & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: SelectBasics_ListIteratorOfListOfBox2d &
	:rtype: None
") Remove;
		void Remove (SelectBasics_ListIteratorOfListOfBox2d & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box2d &
	:param It:
	:type It: SelectBasics_ListIteratorOfListOfBox2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Bnd_Box2d & I,SelectBasics_ListIteratorOfListOfBox2d & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfBox2d &
	:param It:
	:type It: SelectBasics_ListIteratorOfListOfBox2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (SelectBasics_ListOfBox2d & Other,SelectBasics_ListIteratorOfListOfBox2d & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box2d &
	:param It:
	:type It: SelectBasics_ListIteratorOfListOfBox2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Bnd_Box2d & I,SelectBasics_ListIteratorOfListOfBox2d & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfBox2d &
	:param It:
	:type It: SelectBasics_ListIteratorOfListOfBox2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (SelectBasics_ListOfBox2d & Other,SelectBasics_ListIteratorOfListOfBox2d & It);
};


%nodefaultctor SelectBasics_ListOfSensitive;
class SelectBasics_ListOfSensitive {
	public:
		%feature("compactdefaultargs") SelectBasics_ListOfSensitive;
		%feature("autodoc", "	:rtype: None
") SelectBasics_ListOfSensitive;
		 SelectBasics_ListOfSensitive ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfSensitive &
	:rtype: None
") Assign;
		void Assign (const SelectBasics_ListOfSensitive & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfSensitive &
	:rtype: None
") operator=;
		void operator = (const SelectBasics_ListOfSensitive & Other);
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
	:type I: Handle_SelectBasics_SensitiveEntity &
	:rtype: None
") Prepend;
		void Prepend (const Handle_SelectBasics_SensitiveEntity & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectBasics_SensitiveEntity &
	:param theIt:
	:type theIt: SelectBasics_ListIteratorOfListOfSensitive &
	:rtype: None
") Prepend;
		void Prepend (const Handle_SelectBasics_SensitiveEntity & I,SelectBasics_ListIteratorOfListOfSensitive & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfSensitive &
	:rtype: None
") Prepend;
		void Prepend (SelectBasics_ListOfSensitive & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectBasics_SensitiveEntity &
	:rtype: None
") Append;
		void Append (const Handle_SelectBasics_SensitiveEntity & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectBasics_SensitiveEntity &
	:param theIt:
	:type theIt: SelectBasics_ListIteratorOfListOfSensitive &
	:rtype: None
") Append;
		void Append (const Handle_SelectBasics_SensitiveEntity & I,SelectBasics_ListIteratorOfListOfSensitive & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfSensitive &
	:rtype: None
") Append;
		void Append (SelectBasics_ListOfSensitive & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_SelectBasics_SensitiveEntity
") First;
		Handle_SelectBasics_SensitiveEntity First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_SelectBasics_SensitiveEntity
") Last;
		Handle_SelectBasics_SensitiveEntity Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: SelectBasics_ListIteratorOfListOfSensitive &
	:rtype: None
") Remove;
		void Remove (SelectBasics_ListIteratorOfListOfSensitive & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectBasics_SensitiveEntity &
	:param It:
	:type It: SelectBasics_ListIteratorOfListOfSensitive &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_SelectBasics_SensitiveEntity & I,SelectBasics_ListIteratorOfListOfSensitive & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfSensitive &
	:param It:
	:type It: SelectBasics_ListIteratorOfListOfSensitive &
	:rtype: None
") InsertBefore;
		void InsertBefore (SelectBasics_ListOfSensitive & Other,SelectBasics_ListIteratorOfListOfSensitive & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectBasics_SensitiveEntity &
	:param It:
	:type It: SelectBasics_ListIteratorOfListOfSensitive &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_SelectBasics_SensitiveEntity & I,SelectBasics_ListIteratorOfListOfSensitive & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfSensitive &
	:param It:
	:type It: SelectBasics_ListIteratorOfListOfSensitive &
	:rtype: None
") InsertAfter;
		void InsertAfter (SelectBasics_ListOfSensitive & Other,SelectBasics_ListIteratorOfListOfSensitive & It);
};


%nodefaultctor SelectBasics_PickArgs;
class SelectBasics_PickArgs {
	public:
		%feature("compactdefaultargs") SelectBasics_PickArgs;
		%feature("autodoc", "	* Constructor. @param theX mouse picking coordinate on x-axis of selection coord space. @param theY mouse picking coordinate on y-axis of selection coord space. @param theTolerance x, y coordinate tolerance. @param theDepthMin minimum picking depth in selection coord space. @param theDepthMax maximum picking depth in selection coord space. @param thePickingLine line going through picking point.

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theTolerance:
	:type theTolerance: float
	:param theDepthMin:
	:type theDepthMin: float
	:param theDepthMax:
	:type theDepthMax: float
	:param thePickingLine:
	:type thePickingLine: gp_Lin
	:rtype: None
") SelectBasics_PickArgs;
		 SelectBasics_PickArgs (const Standard_Real theX,const Standard_Real theY,const Standard_Real theTolerance,const Standard_Real theDepthMin,const Standard_Real theDepthMax,const gp_Lin & thePickingLine);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	:rtype: inline float
") X;
		inline Standard_Real X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	:rtype: inline float
") Y;
		inline Standard_Real Y ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: inline float
") Tolerance;
		inline Standard_Real Tolerance ();
		%feature("compactdefaultargs") DepthMin;
		%feature("autodoc", "	:rtype: inline float
") DepthMin;
		inline Standard_Real DepthMin ();
		%feature("compactdefaultargs") DepthMax;
		%feature("autodoc", "	:rtype: inline float
") DepthMax;
		inline Standard_Real DepthMax ();
		%feature("compactdefaultargs") PickLine;
		%feature("autodoc", "	:rtype: inline  gp_Lin
") PickLine;
		inline const gp_Lin  PickLine ();
		%feature("compactdefaultargs") IsClipped;
		%feature("autodoc", "	* returns True if passed depth lies outside valid depth range.

	:param theDepth:
	:type theDepth: float
	:rtype: inline bool
") IsClipped;
		inline Standard_Boolean IsClipped (const Standard_Real theDepth);
};


%nodefaultctor SelectBasics_SensitiveEntity;
class SelectBasics_SensitiveEntity : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param TheOwnerId:
	:type TheOwnerId: Handle_SelectBasics_EntityOwner &
	:rtype: void
") Set;
		virtual void Set (const Handle_SelectBasics_EntityOwner & TheOwnerId);
		%feature("compactdefaultargs") OwnerId;
		%feature("autodoc", "	:rtype: Handle_SelectBasics_EntityOwner
") OwnerId;
		Handle_SelectBasics_EntityOwner OwnerId ();
		%feature("compactdefaultargs") Areas;
		%feature("autodoc", "	* to be implemented specifically by each type of sensitive primitive .

	:param aresult:
	:type aresult: SelectBasics_ListOfBox2d &
	:rtype: void
") Areas;
		virtual void Areas (SelectBasics_ListOfBox2d & aresult);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). This method takes into account depth limits produced by abstract view: far/near planes, clippings. Please port existing implementations of your picking detection, which were done at Matches (X, Y, Tol, DMin) method to this one, introducing the depth checks. Please note that the previous method is suppressed and the virtual implementations are not used by OCC selection framework. The porting procedure for simple sensitives (or if you are not interested in implementing full scale depth checks) can be simplified to writing the following code snippet: @code { // example code for porting descendants of Select3D_SensitiveEntity // invoke implementation of obsolete matches method (if implemented)... if (!Matches (thePickArgs.X(), thePickArgs.Y(), thePickArgs.Tolerance(), theMatchDMin)) return Standard_False; // invoke your implementation of computing depth (if implemented)... Standard_Real aDetectDepth = ComputeDepth (thePickArgs.PickLine()); return !thePickArgs.IsClipped(aDetectDepth); } @endcode @param thePickArgs [in] the picking arguments. @param theMatchDMin [out] the minimum distance on xy plane from point of picking to center of gravity of the detected sub-part of sensitive entity or the whole sensitive (e.g. used for resolving selection of coinciding circles, selection will be set to the one whose center is closest to the picking point). @param theMatchDepth [out] the minimum detected depth: depth of the closest detected sub-part of sensitive entity (or the whole sensitive). returns True if the sensitive matches the detection area. This method is an entry point for picking detection framework. The method is triggered when it is required to compose list of detected sensitive entities. The sensitives are filtered out from detection result if returned value is False. The passed entities are then can be sorted by 'theDetectDist', 'theDetectDepth' parameters.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* returns True if the box (Xmin,YMin)------(Xmax,Ymax) contains the SensitiveEntity. Necessary for selection using elastic boxes,or segments.

	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* returns True if the polyline xi,yi contains the SensitiveEntity. Necessary for selection using polyline selection

	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("compactdefaultargs") NeedsConversion;
		%feature("autodoc", "	:rtype: bool
") NeedsConversion;
		virtual Standard_Boolean NeedsConversion ();
		%feature("compactdefaultargs") Is3D;
		%feature("autodoc", "	* returns True if able to give 3D information (Depth,...). See Select3D

	:rtype: bool
") Is3D;
		virtual Standard_Boolean Is3D ();
		%feature("compactdefaultargs") MaxBoxes;
		%feature("autodoc", "	* returns the max number of boxes the entity is able to give at a time

	:rtype: int
") MaxBoxes;
		virtual Standard_Integer MaxBoxes ();
		%feature("compactdefaultargs") SetSensitivityFactor;
		%feature("autodoc", "	:param aFactor:
	:type aFactor: Standard_ShortReal
	:rtype: None
") SetSensitivityFactor;
		void SetSensitivityFactor (const Standard_ShortReal aFactor);
		%feature("compactdefaultargs") SensitivityFactor;
		%feature("autodoc", "	* allows a better sensitivity for a specific entity in selection algorithms useful for small sized entities.

	:rtype: Standard_ShortReal
") SensitivityFactor;
		Standard_ShortReal SensitivityFactor ();
};


%extend SelectBasics_SensitiveEntity {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectBasics_SensitiveEntity(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectBasics_SensitiveEntity::Handle_SelectBasics_SensitiveEntity %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectBasics_SensitiveEntity;
class Handle_SelectBasics_SensitiveEntity : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_SelectBasics_SensitiveEntity();
        Handle_SelectBasics_SensitiveEntity(const Handle_SelectBasics_SensitiveEntity &aHandle);
        Handle_SelectBasics_SensitiveEntity(const SelectBasics_SensitiveEntity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectBasics_SensitiveEntity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectBasics_SensitiveEntity {
    SelectBasics_SensitiveEntity* GetObject() {
    return (SelectBasics_SensitiveEntity*)$self->Access();
    }
};

%nodefaultctor SelectBasics_SequenceNodeOfSequenceOfOwner;
class SelectBasics_SequenceNodeOfSequenceOfOwner : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") SelectBasics_SequenceNodeOfSequenceOfOwner;
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectBasics_EntityOwner &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") SelectBasics_SequenceNodeOfSequenceOfOwner;
		 SelectBasics_SequenceNodeOfSequenceOfOwner (const Handle_SelectBasics_EntityOwner & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_SelectBasics_EntityOwner
") Value;
		Handle_SelectBasics_EntityOwner Value ();
};


%extend SelectBasics_SequenceNodeOfSequenceOfOwner {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectBasics_SequenceNodeOfSequenceOfOwner(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectBasics_SequenceNodeOfSequenceOfOwner::Handle_SelectBasics_SequenceNodeOfSequenceOfOwner %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectBasics_SequenceNodeOfSequenceOfOwner;
class Handle_SelectBasics_SequenceNodeOfSequenceOfOwner : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_SelectBasics_SequenceNodeOfSequenceOfOwner();
        Handle_SelectBasics_SequenceNodeOfSequenceOfOwner(const Handle_SelectBasics_SequenceNodeOfSequenceOfOwner &aHandle);
        Handle_SelectBasics_SequenceNodeOfSequenceOfOwner(const SelectBasics_SequenceNodeOfSequenceOfOwner *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectBasics_SequenceNodeOfSequenceOfOwner DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectBasics_SequenceNodeOfSequenceOfOwner {
    SelectBasics_SequenceNodeOfSequenceOfOwner* GetObject() {
    return (SelectBasics_SequenceNodeOfSequenceOfOwner*)$self->Access();
    }
};

%nodefaultctor SelectBasics_SequenceOfOwner;
class SelectBasics_SequenceOfOwner : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") SelectBasics_SequenceOfOwner;
		%feature("autodoc", "	:rtype: None
") SelectBasics_SequenceOfOwner;
		 SelectBasics_SequenceOfOwner ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_SequenceOfOwner &
	:rtype: SelectBasics_SequenceOfOwner
") Assign;
		const SelectBasics_SequenceOfOwner & Assign (const SelectBasics_SequenceOfOwner & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_SequenceOfOwner &
	:rtype: SelectBasics_SequenceOfOwner
") operator=;
		const SelectBasics_SequenceOfOwner & operator = (const SelectBasics_SequenceOfOwner & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_SelectBasics_EntityOwner &
	:rtype: None
") Append;
		void Append (const Handle_SelectBasics_EntityOwner & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: SelectBasics_SequenceOfOwner &
	:rtype: None
") Append;
		void Append (SelectBasics_SequenceOfOwner & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_SelectBasics_EntityOwner &
	:rtype: None
") Prepend;
		void Prepend (const Handle_SelectBasics_EntityOwner & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: SelectBasics_SequenceOfOwner &
	:rtype: None
") Prepend;
		void Prepend (SelectBasics_SequenceOfOwner & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_SelectBasics_EntityOwner &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_SelectBasics_EntityOwner & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: SelectBasics_SequenceOfOwner &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,SelectBasics_SequenceOfOwner & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_SelectBasics_EntityOwner &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_SelectBasics_EntityOwner & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: SelectBasics_SequenceOfOwner &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,SelectBasics_SequenceOfOwner & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_SelectBasics_EntityOwner
") First;
		Handle_SelectBasics_EntityOwner First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_SelectBasics_EntityOwner
") Last;
		Handle_SelectBasics_EntityOwner Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: SelectBasics_SequenceOfOwner &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,SelectBasics_SequenceOfOwner & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_SelectBasics_EntityOwner
") Value;
		Handle_SelectBasics_EntityOwner Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_SelectBasics_EntityOwner &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_SelectBasics_EntityOwner & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_SelectBasics_EntityOwner
") ChangeValue;
		Handle_SelectBasics_EntityOwner ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%nodefaultctor SelectBasics_SortAlgo;
class SelectBasics_SortAlgo {
	public:
		%feature("compactdefaultargs") SelectBasics_SortAlgo;
		%feature("autodoc", "	* Empty rectangle selector.

	:rtype: None
") SelectBasics_SortAlgo;
		 SelectBasics_SortAlgo ();
		%feature("compactdefaultargs") SelectBasics_SortAlgo;
		%feature("autodoc", "	* Creates a initialized selector.

	:param ClippingRectangle:
	:type ClippingRectangle: Bnd_Box2d &
	:param sizeOfSensitiveArea:
	:type sizeOfSensitiveArea: float
	:param theRectangles:
	:type theRectangles: Handle_Bnd_HArray1OfBox2d &
	:rtype: None
") SelectBasics_SortAlgo;
		 SelectBasics_SortAlgo (const Bnd_Box2d & ClippingRectangle,const Standard_Real sizeOfSensitiveArea,const Handle_Bnd_HArray1OfBox2d & theRectangles);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Clears and initializes the selector.

	:param ClippingRectangle:
	:type ClippingRectangle: Bnd_Box2d &
	:param sizeOfSensitiveArea:
	:type sizeOfSensitiveArea: float
	:param theRectangles:
	:type theRectangles: Handle_Bnd_HArray1OfBox2d &
	:rtype: None
") Initialize;
		void Initialize (const Bnd_Box2d & ClippingRectangle,const Standard_Real sizeOfSensitiveArea,const Handle_Bnd_HArray1OfBox2d & theRectangles);
		%feature("compactdefaultargs") InitSelect;
		%feature("autodoc", "	* Searchs the items on this position.

	:param x:
	:type x: float
	:param y:
	:type y: float
	:rtype: None
") InitSelect;
		void InitSelect (const Standard_Real x,const Standard_Real y);
		%feature("compactdefaultargs") InitSelect;
		%feature("autodoc", "	* Searchs the items in this rectangle.

	:param rect:
	:type rect: Bnd_Box2d &
	:rtype: None
") InitSelect;
		void InitSelect (const Bnd_Box2d & rect);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns true if there is something selected.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Sets value on the next selected item.

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the index of the selected rectangle.

	:rtype: int
") Value;
		Standard_Integer Value ();
};


