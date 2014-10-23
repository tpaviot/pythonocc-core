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
%module (package="OCC") SelectBasics

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

%include SelectBasics_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(selectbasics) SelectBasics;
%nodefaultctor SelectBasics;
class SelectBasics {
	public:
		%feature("autodoc", "	* Structure to provide all-in-one information on picking arguments for 'Matches' method of SelectBasics_SensitiveEntity.

	:rtype: int
") MaxOwnerPriority;
		static Standard_Integer MaxOwnerPriority ();
		%feature("autodoc", "	:rtype: int
") MinOwnerPriority;
		static Standard_Integer MinOwnerPriority ();
};


%feature("shadow") SelectBasics::~SelectBasics %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SelectBasics {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SelectBasics_BasicTool;
class SelectBasics_BasicTool {
	public:
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
		%feature("autodoc", "	:param aPolyg2d:
	:type aPolyg2d: TColgp_Array1OfPnt2d
	:rtype: bool
") AutoInter;
		static Standard_Boolean AutoInter (const TColgp_Array1OfPnt2d & aPolyg2d);
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
	:type Rank: Standard_Integer &
	:rtype: bool
") MatchPolyg2d;
		static Standard_Boolean MatchPolyg2d (const TColgp_Array1OfPnt2d & tabpoint,const Standard_Real X,const Standard_Real Y,const Standard_Real aTol,Standard_Real &OutValue,Standard_Integer &OutValue);
};


%feature("shadow") SelectBasics_BasicTool::~SelectBasics_BasicTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SelectBasics_BasicTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SelectBasics_EntityOwner;
class SelectBasics_EntityOwner : public MMgt_TShared {
	public:
		%feature("autodoc", "	* sets the selectable priority of the owner

	:param aPriority:
	:type aPriority: Standard_Integer
	:rtype: None
") Set;
		void Set (const Standard_Integer aPriority);
		%feature("autodoc", "	:rtype: int
") Priority;
		Standard_Integer Priority ();
		%feature("autodoc", "	:rtype: bool
") HasLocation;
		virtual Standard_Boolean HasLocation ();
		%feature("autodoc", "	:param aLoc:
	:type aLoc: TopLoc_Location &
	:rtype: void
") SetLocation;
		virtual void SetLocation (const TopLoc_Location & aLoc);
		%feature("autodoc", "	:rtype: void
") ResetLocation;
		virtual void ResetLocation ();
		%feature("autodoc", "	:rtype: TopLoc_Location
") Location;
		virtual const TopLoc_Location & Location ();
};


%feature("shadow") SelectBasics_EntityOwner::~SelectBasics_EntityOwner %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SelectBasics_EntityOwner {
	void _kill_pointed() {
		delete $self;
	}
};
%extend SelectBasics_EntityOwner {
	Handle_SelectBasics_EntityOwner GetHandle() {
	return *(Handle_SelectBasics_EntityOwner*) &$self;
	}
};

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
%feature("shadow") Handle_SelectBasics_EntityOwner::~Handle_SelectBasics_EntityOwner %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_SelectBasics_EntityOwner {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor SelectBasics_ListIteratorOfListOfBox2d;
class SelectBasics_ListIteratorOfListOfBox2d {
	public:
		%feature("autodoc", "	:rtype: None
") SelectBasics_ListIteratorOfListOfBox2d;
		 SelectBasics_ListIteratorOfListOfBox2d ();
		%feature("autodoc", "	:param L:
	:type L: SelectBasics_ListOfBox2d &
	:rtype: None
") SelectBasics_ListIteratorOfListOfBox2d;
		 SelectBasics_ListIteratorOfListOfBox2d (const SelectBasics_ListOfBox2d & L);
		%feature("autodoc", "	:param L:
	:type L: SelectBasics_ListOfBox2d &
	:rtype: None
") Initialize;
		void Initialize (const SelectBasics_ListOfBox2d & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Bnd_Box2d
") Value;
		Bnd_Box2d & Value ();
};


%feature("shadow") SelectBasics_ListIteratorOfListOfBox2d::~SelectBasics_ListIteratorOfListOfBox2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SelectBasics_ListIteratorOfListOfBox2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SelectBasics_ListIteratorOfListOfSensitive;
class SelectBasics_ListIteratorOfListOfSensitive {
	public:
		%feature("autodoc", "	:rtype: None
") SelectBasics_ListIteratorOfListOfSensitive;
		 SelectBasics_ListIteratorOfListOfSensitive ();
		%feature("autodoc", "	:param L:
	:type L: SelectBasics_ListOfSensitive &
	:rtype: None
") SelectBasics_ListIteratorOfListOfSensitive;
		 SelectBasics_ListIteratorOfListOfSensitive (const SelectBasics_ListOfSensitive & L);
		%feature("autodoc", "	:param L:
	:type L: SelectBasics_ListOfSensitive &
	:rtype: None
") Initialize;
		void Initialize (const SelectBasics_ListOfSensitive & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_SelectBasics_SensitiveEntity
") Value;
		Handle_SelectBasics_SensitiveEntity & Value ();
};


%feature("shadow") SelectBasics_ListIteratorOfListOfSensitive::~SelectBasics_ListIteratorOfListOfSensitive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SelectBasics_ListIteratorOfListOfSensitive {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SelectBasics_ListNodeOfListOfBox2d;
class SelectBasics_ListNodeOfListOfBox2d : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box2d &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") SelectBasics_ListNodeOfListOfBox2d;
		 SelectBasics_ListNodeOfListOfBox2d (const Bnd_Box2d & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Bnd_Box2d
") Value;
		Bnd_Box2d & Value ();
};


%feature("shadow") SelectBasics_ListNodeOfListOfBox2d::~SelectBasics_ListNodeOfListOfBox2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SelectBasics_ListNodeOfListOfBox2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend SelectBasics_ListNodeOfListOfBox2d {
	Handle_SelectBasics_ListNodeOfListOfBox2d GetHandle() {
	return *(Handle_SelectBasics_ListNodeOfListOfBox2d*) &$self;
	}
};

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
%feature("shadow") Handle_SelectBasics_ListNodeOfListOfBox2d::~Handle_SelectBasics_ListNodeOfListOfBox2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_SelectBasics_ListNodeOfListOfBox2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor SelectBasics_ListNodeOfListOfSensitive;
class SelectBasics_ListNodeOfListOfSensitive : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectBasics_SensitiveEntity &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") SelectBasics_ListNodeOfListOfSensitive;
		 SelectBasics_ListNodeOfListOfSensitive (const Handle_SelectBasics_SensitiveEntity & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Handle_SelectBasics_SensitiveEntity
") Value;
		Handle_SelectBasics_SensitiveEntity & Value ();
};


%feature("shadow") SelectBasics_ListNodeOfListOfSensitive::~SelectBasics_ListNodeOfListOfSensitive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SelectBasics_ListNodeOfListOfSensitive {
	void _kill_pointed() {
		delete $self;
	}
};
%extend SelectBasics_ListNodeOfListOfSensitive {
	Handle_SelectBasics_ListNodeOfListOfSensitive GetHandle() {
	return *(Handle_SelectBasics_ListNodeOfListOfSensitive*) &$self;
	}
};

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
%feature("shadow") Handle_SelectBasics_ListNodeOfListOfSensitive::~Handle_SelectBasics_ListNodeOfListOfSensitive %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_SelectBasics_ListNodeOfListOfSensitive {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor SelectBasics_ListOfBox2d;
class SelectBasics_ListOfBox2d {
	public:
		%feature("autodoc", "	:rtype: None
") SelectBasics_ListOfBox2d;
		 SelectBasics_ListOfBox2d ();
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfBox2d &
	:rtype: None
") Assign;
		void Assign (const SelectBasics_ListOfBox2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfBox2d &
	:rtype: None
") operator=;
		void operator = (const SelectBasics_ListOfBox2d & Other);
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
	:type I: Bnd_Box2d &
	:rtype: None
") Prepend;
		void Prepend (const Bnd_Box2d & I);
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box2d &
	:param theIt:
	:type theIt: SelectBasics_ListIteratorOfListOfBox2d &
	:rtype: None
") Prepend;
		void Prepend (const Bnd_Box2d & I,SelectBasics_ListIteratorOfListOfBox2d & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfBox2d &
	:rtype: None
") Prepend;
		void Prepend (SelectBasics_ListOfBox2d & Other);
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box2d &
	:rtype: None
") Append;
		void Append (const Bnd_Box2d & I);
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box2d &
	:param theIt:
	:type theIt: SelectBasics_ListIteratorOfListOfBox2d &
	:rtype: None
") Append;
		void Append (const Bnd_Box2d & I,SelectBasics_ListIteratorOfListOfBox2d & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfBox2d &
	:rtype: None
") Append;
		void Append (SelectBasics_ListOfBox2d & Other);
		%feature("autodoc", "	:rtype: Bnd_Box2d
") First;
		Bnd_Box2d & First ();
		%feature("autodoc", "	:rtype: Bnd_Box2d
") Last;
		Bnd_Box2d & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: SelectBasics_ListIteratorOfListOfBox2d &
	:rtype: None
") Remove;
		void Remove (SelectBasics_ListIteratorOfListOfBox2d & It);
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box2d &
	:param It:
	:type It: SelectBasics_ListIteratorOfListOfBox2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Bnd_Box2d & I,SelectBasics_ListIteratorOfListOfBox2d & It);
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfBox2d &
	:param It:
	:type It: SelectBasics_ListIteratorOfListOfBox2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (SelectBasics_ListOfBox2d & Other,SelectBasics_ListIteratorOfListOfBox2d & It);
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box2d &
	:param It:
	:type It: SelectBasics_ListIteratorOfListOfBox2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Bnd_Box2d & I,SelectBasics_ListIteratorOfListOfBox2d & It);
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfBox2d &
	:param It:
	:type It: SelectBasics_ListIteratorOfListOfBox2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (SelectBasics_ListOfBox2d & Other,SelectBasics_ListIteratorOfListOfBox2d & It);
};


%feature("shadow") SelectBasics_ListOfBox2d::~SelectBasics_ListOfBox2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SelectBasics_ListOfBox2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SelectBasics_ListOfSensitive;
class SelectBasics_ListOfSensitive {
	public:
		%feature("autodoc", "	:rtype: None
") SelectBasics_ListOfSensitive;
		 SelectBasics_ListOfSensitive ();
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfSensitive &
	:rtype: None
") Assign;
		void Assign (const SelectBasics_ListOfSensitive & Other);
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfSensitive &
	:rtype: None
") operator=;
		void operator = (const SelectBasics_ListOfSensitive & Other);
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
	:type I: Handle_SelectBasics_SensitiveEntity &
	:rtype: None
") Prepend;
		void Prepend (const Handle_SelectBasics_SensitiveEntity & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectBasics_SensitiveEntity &
	:param theIt:
	:type theIt: SelectBasics_ListIteratorOfListOfSensitive &
	:rtype: None
") Prepend;
		void Prepend (const Handle_SelectBasics_SensitiveEntity & I,SelectBasics_ListIteratorOfListOfSensitive & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfSensitive &
	:rtype: None
") Prepend;
		void Prepend (SelectBasics_ListOfSensitive & Other);
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectBasics_SensitiveEntity &
	:rtype: None
") Append;
		void Append (const Handle_SelectBasics_SensitiveEntity & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectBasics_SensitiveEntity &
	:param theIt:
	:type theIt: SelectBasics_ListIteratorOfListOfSensitive &
	:rtype: None
") Append;
		void Append (const Handle_SelectBasics_SensitiveEntity & I,SelectBasics_ListIteratorOfListOfSensitive & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfSensitive &
	:rtype: None
") Append;
		void Append (SelectBasics_ListOfSensitive & Other);
		%feature("autodoc", "	:rtype: Handle_SelectBasics_SensitiveEntity
") First;
		Handle_SelectBasics_SensitiveEntity & First ();
		%feature("autodoc", "	:rtype: Handle_SelectBasics_SensitiveEntity
") Last;
		Handle_SelectBasics_SensitiveEntity & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: SelectBasics_ListIteratorOfListOfSensitive &
	:rtype: None
") Remove;
		void Remove (SelectBasics_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectBasics_SensitiveEntity &
	:param It:
	:type It: SelectBasics_ListIteratorOfListOfSensitive &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_SelectBasics_SensitiveEntity & I,SelectBasics_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfSensitive &
	:param It:
	:type It: SelectBasics_ListIteratorOfListOfSensitive &
	:rtype: None
") InsertBefore;
		void InsertBefore (SelectBasics_ListOfSensitive & Other,SelectBasics_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectBasics_SensitiveEntity &
	:param It:
	:type It: SelectBasics_ListIteratorOfListOfSensitive &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_SelectBasics_SensitiveEntity & I,SelectBasics_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_ListOfSensitive &
	:param It:
	:type It: SelectBasics_ListIteratorOfListOfSensitive &
	:rtype: None
") InsertAfter;
		void InsertAfter (SelectBasics_ListOfSensitive & Other,SelectBasics_ListIteratorOfListOfSensitive & It);
};


%feature("shadow") SelectBasics_ListOfSensitive::~SelectBasics_ListOfSensitive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SelectBasics_ListOfSensitive {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SelectBasics_PickArgs;
class SelectBasics_PickArgs {
	public:
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
		%feature("autodoc", "	:rtype: inline float
") X;
		inline Standard_Real X ();
		%feature("autodoc", "	:rtype: inline float
") Y;
		inline Standard_Real Y ();
		%feature("autodoc", "	:rtype: inline float
") Tolerance;
		inline Standard_Real Tolerance ();
		%feature("autodoc", "	:rtype: inline float
") DepthMin;
		inline Standard_Real DepthMin ();
		%feature("autodoc", "	:rtype: inline float
") DepthMax;
		inline Standard_Real DepthMax ();
		%feature("autodoc", "	:rtype: inline  gp_Lin
") PickLine;
		inline const gp_Lin  PickLine ();
		%feature("autodoc", "	* returns True if passed depth lies outside valid depth range.

	:param theDepth:
	:type theDepth: float
	:rtype: inline bool
") IsClipped;
		inline Standard_Boolean IsClipped (const Standard_Real theDepth);
};


%feature("shadow") SelectBasics_PickArgs::~SelectBasics_PickArgs %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SelectBasics_PickArgs {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SelectBasics_SensitiveEntity;
class SelectBasics_SensitiveEntity : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param TheOwnerId:
	:type TheOwnerId: Handle_SelectBasics_EntityOwner &
	:rtype: void
") Set;
		virtual void Set (const Handle_SelectBasics_EntityOwner & TheOwnerId);
		%feature("autodoc", "	:rtype: Handle_SelectBasics_EntityOwner
") OwnerId;
		const Handle_SelectBasics_EntityOwner & OwnerId ();
		%feature("autodoc", "	* to be implemented specifically by each type of sensitive primitive .

	:param aresult:
	:type aresult: SelectBasics_ListOfBox2d &
	:rtype: void
") Areas;
		virtual void Areas (SelectBasics_ListOfBox2d & aresult);
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
		%feature("autodoc", "	:rtype: bool
") NeedsConversion;
		virtual Standard_Boolean NeedsConversion ();
		%feature("autodoc", "	* returns True if able to give 3D information (Depth,...). See Select3D

	:rtype: bool
") Is3D;
		virtual Standard_Boolean Is3D ();
		%feature("autodoc", "	* returns the max number of boxes the entity is able to give at a time

	:rtype: int
") MaxBoxes;
		virtual Standard_Integer MaxBoxes ();
		%feature("autodoc", "	:param aFactor:
	:type aFactor: Standard_ShortReal
	:rtype: None
") SetSensitivityFactor;
		void SetSensitivityFactor (const Standard_ShortReal aFactor);
		%feature("autodoc", "	* allows a better sensitivity for a specific entity in selection algorithms useful for small sized entities.

	:rtype: Standard_ShortReal
") SensitivityFactor;
		Standard_ShortReal SensitivityFactor ();
};


%feature("shadow") SelectBasics_SensitiveEntity::~SelectBasics_SensitiveEntity %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SelectBasics_SensitiveEntity {
	void _kill_pointed() {
		delete $self;
	}
};
%extend SelectBasics_SensitiveEntity {
	Handle_SelectBasics_SensitiveEntity GetHandle() {
	return *(Handle_SelectBasics_SensitiveEntity*) &$self;
	}
};

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
%feature("shadow") Handle_SelectBasics_SensitiveEntity::~Handle_SelectBasics_SensitiveEntity %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_SelectBasics_SensitiveEntity {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor SelectBasics_SequenceNodeOfSequenceOfOwner;
class SelectBasics_SequenceNodeOfSequenceOfOwner : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_SelectBasics_EntityOwner &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") SelectBasics_SequenceNodeOfSequenceOfOwner;
		 SelectBasics_SequenceNodeOfSequenceOfOwner (const Handle_SelectBasics_EntityOwner & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_SelectBasics_EntityOwner
") Value;
		Handle_SelectBasics_EntityOwner & Value ();
};


%feature("shadow") SelectBasics_SequenceNodeOfSequenceOfOwner::~SelectBasics_SequenceNodeOfSequenceOfOwner %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SelectBasics_SequenceNodeOfSequenceOfOwner {
	void _kill_pointed() {
		delete $self;
	}
};
%extend SelectBasics_SequenceNodeOfSequenceOfOwner {
	Handle_SelectBasics_SequenceNodeOfSequenceOfOwner GetHandle() {
	return *(Handle_SelectBasics_SequenceNodeOfSequenceOfOwner*) &$self;
	}
};

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
%feature("shadow") Handle_SelectBasics_SequenceNodeOfSequenceOfOwner::~Handle_SelectBasics_SequenceNodeOfSequenceOfOwner %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_SelectBasics_SequenceNodeOfSequenceOfOwner {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor SelectBasics_SequenceOfOwner;
class SelectBasics_SequenceOfOwner : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") SelectBasics_SequenceOfOwner;
		 SelectBasics_SequenceOfOwner ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_SequenceOfOwner &
	:rtype: SelectBasics_SequenceOfOwner
") Assign;
		const SelectBasics_SequenceOfOwner & Assign (const SelectBasics_SequenceOfOwner & Other);
		%feature("autodoc", "	:param Other:
	:type Other: SelectBasics_SequenceOfOwner &
	:rtype: SelectBasics_SequenceOfOwner
") operator=;
		const SelectBasics_SequenceOfOwner & operator = (const SelectBasics_SequenceOfOwner & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_SelectBasics_EntityOwner &
	:rtype: None
") Append;
		void Append (const Handle_SelectBasics_EntityOwner & T);
		%feature("autodoc", "	:param S:
	:type S: SelectBasics_SequenceOfOwner &
	:rtype: None
") Append;
		void Append (SelectBasics_SequenceOfOwner & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_SelectBasics_EntityOwner &
	:rtype: None
") Prepend;
		void Prepend (const Handle_SelectBasics_EntityOwner & T);
		%feature("autodoc", "	:param S:
	:type S: SelectBasics_SequenceOfOwner &
	:rtype: None
") Prepend;
		void Prepend (SelectBasics_SequenceOfOwner & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_SelectBasics_EntityOwner &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_SelectBasics_EntityOwner & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: SelectBasics_SequenceOfOwner &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,SelectBasics_SequenceOfOwner & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_SelectBasics_EntityOwner &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_SelectBasics_EntityOwner & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: SelectBasics_SequenceOfOwner &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,SelectBasics_SequenceOfOwner & S);
		%feature("autodoc", "	:rtype: Handle_SelectBasics_EntityOwner
") First;
		const Handle_SelectBasics_EntityOwner & First ();
		%feature("autodoc", "	:rtype: Handle_SelectBasics_EntityOwner
") Last;
		const Handle_SelectBasics_EntityOwner & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: SelectBasics_SequenceOfOwner &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,SelectBasics_SequenceOfOwner & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_SelectBasics_EntityOwner
") Value;
		const Handle_SelectBasics_EntityOwner & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_SelectBasics_EntityOwner &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_SelectBasics_EntityOwner & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_SelectBasics_EntityOwner
") ChangeValue;
		Handle_SelectBasics_EntityOwner & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") SelectBasics_SequenceOfOwner::~SelectBasics_SequenceOfOwner %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SelectBasics_SequenceOfOwner {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SelectBasics_SortAlgo;
class SelectBasics_SortAlgo {
	public:
		%feature("autodoc", "	* Empty rectangle selector.

	:rtype: None
") SelectBasics_SortAlgo;
		 SelectBasics_SortAlgo ();
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
		%feature("autodoc", "	* Searchs the items on this position.

	:param x:
	:type x: float
	:param y:
	:type y: float
	:rtype: None
") InitSelect;
		void InitSelect (const Standard_Real x,const Standard_Real y);
		%feature("autodoc", "	* Searchs the items in this rectangle.

	:param rect:
	:type rect: Bnd_Box2d &
	:rtype: None
") InitSelect;
		void InitSelect (const Bnd_Box2d & rect);
		%feature("autodoc", "	* Returns true if there is something selected.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	* Sets value on the next selected item.

	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	* Returns the index of the selected rectangle.

	:rtype: int
") Value;
		Standard_Integer Value ();
};


%feature("shadow") SelectBasics_SortAlgo::~SelectBasics_SortAlgo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SelectBasics_SortAlgo {
	void _kill_pointed() {
		delete $self;
	}
};
