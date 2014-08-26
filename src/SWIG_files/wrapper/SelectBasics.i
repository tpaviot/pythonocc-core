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
%module SelectBasics

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

%include SelectBasics_required_python_modules.i
%include SelectBasics_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(selectbasics) SelectBasics;
%nodefaultctor SelectBasics;
class SelectBasics {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

Structure to provide all-in-one information on picking arguments  
for 'Matches' method of SelectBasics_SensitiveEntity.") MaxOwnerPriority;
		static Standard_Integer MaxOwnerPriority ();
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

No detailed docstring for this function.") MinOwnerPriority;
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
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)
	P3(gp_Pnt2d)
	P4(gp_Pnt2d)

Returns:
	static Standard_Boolean

returns True if The Segment {P1P2} is  
         intersected by the segment {P3P4}") MatchSegments;
		static Standard_Boolean MatchSegments (const gp_Pnt2d & P1,const gp_Pnt2d & P2,const gp_Pnt2d & P3,const gp_Pnt2d & P4);
		%feature("autodoc", "Args:
	pBegin(gp_Pnt2d)
	pEnd(gp_Pnt2d)
	X(Standard_Real)
	Y(Standard_Real)
	aTol(Standard_Real)
	DMin(Standard_Real)

Returns:
	static Standard_Boolean

return True if Segment(pBegin, pEnd) is Selected") MatchSegment;
		static Standard_Boolean MatchSegment (const gp_Pnt2d & pBegin,const gp_Pnt2d & pEnd,const Standard_Real X,const Standard_Real Y,const Standard_Real aTol,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aPolyg2d(TColgp_Array1OfPnt2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") AutoInter;
		static Standard_Boolean AutoInter (const TColgp_Array1OfPnt2d & aPolyg2d);
		%feature("autodoc", "Args:
	tabpoint(TColgp_Array1OfPnt2d)
	X(Standard_Real)
	Y(Standard_Real)
	aTol(Standard_Real)
	DMin(Standard_Real)
	Rank(Standard_Integer)

Returns:
	static Standard_Boolean

package method used to find if a point  
         is close enough to a polygon of 2D points  
         to be Used by Primitives like curves or faces...  
         Rank gives the index of the touched  
         segment") MatchPolyg2d;
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
		%feature("autodoc", "Args:
	aPriority(Standard_Integer)

Returns:
	None

sets the selectable priority of the owner") Set;
		void Set (const Standard_Integer aPriority);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Priority;
		Standard_Integer Priority ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") HasLocation;
		virtual Standard_Boolean HasLocation ();
		%feature("autodoc", "Args:
	aLoc(TopLoc_Location)

Returns:
	virtual void

No detailed docstring for this function.") SetLocation;
		virtual void SetLocation (const TopLoc_Location & aLoc);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") ResetLocation;
		virtual void ResetLocation ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TopLoc_Location

No detailed docstring for this function.") Location;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SelectBasics_ListIteratorOfListOfBox2d;
		 SelectBasics_ListIteratorOfListOfBox2d ();
		%feature("autodoc", "Args:
	L(SelectBasics_ListOfBox2d)

Returns:
	None

No detailed docstring for this function.") SelectBasics_ListIteratorOfListOfBox2d;
		 SelectBasics_ListIteratorOfListOfBox2d (const SelectBasics_ListOfBox2d & L);
		%feature("autodoc", "Args:
	L(SelectBasics_ListOfBox2d)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const SelectBasics_ListOfBox2d & L);
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
	Bnd_Box2d

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SelectBasics_ListIteratorOfListOfSensitive;
		 SelectBasics_ListIteratorOfListOfSensitive ();
		%feature("autodoc", "Args:
	L(SelectBasics_ListOfSensitive)

Returns:
	None

No detailed docstring for this function.") SelectBasics_ListIteratorOfListOfSensitive;
		 SelectBasics_ListIteratorOfListOfSensitive (const SelectBasics_ListOfSensitive & L);
		%feature("autodoc", "Args:
	L(SelectBasics_ListOfSensitive)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const SelectBasics_ListOfSensitive & L);
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
	Handle_SelectBasics_SensitiveEntity

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Bnd_Box2d)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") SelectBasics_ListNodeOfListOfBox2d;
		 SelectBasics_ListNodeOfListOfBox2d (const Bnd_Box2d & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box2d

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_SelectBasics_SensitiveEntity)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") SelectBasics_ListNodeOfListOfSensitive;
		 SelectBasics_ListNodeOfListOfSensitive (const Handle_SelectBasics_SensitiveEntity & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_SelectBasics_SensitiveEntity

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SelectBasics_ListOfBox2d;
		 SelectBasics_ListOfBox2d ();
		%feature("autodoc", "Args:
	Other(SelectBasics_ListOfBox2d)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const SelectBasics_ListOfBox2d & Other);
		%feature("autodoc", "Args:
	Other(SelectBasics_ListOfBox2d)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const SelectBasics_ListOfBox2d & Other);
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
	I(Bnd_Box2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Bnd_Box2d & I);
		%feature("autodoc", "Args:
	I(Bnd_Box2d)
	theIt(SelectBasics_ListIteratorOfListOfBox2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Bnd_Box2d & I,SelectBasics_ListIteratorOfListOfBox2d & theIt);
		%feature("autodoc", "Args:
	Other(SelectBasics_ListOfBox2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (SelectBasics_ListOfBox2d & Other);
		%feature("autodoc", "Args:
	I(Bnd_Box2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Bnd_Box2d & I);
		%feature("autodoc", "Args:
	I(Bnd_Box2d)
	theIt(SelectBasics_ListIteratorOfListOfBox2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Bnd_Box2d & I,SelectBasics_ListIteratorOfListOfBox2d & theIt);
		%feature("autodoc", "Args:
	Other(SelectBasics_ListOfBox2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (SelectBasics_ListOfBox2d & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box2d

No detailed docstring for this function.") First;
		Bnd_Box2d & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box2d

No detailed docstring for this function.") Last;
		Bnd_Box2d & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(SelectBasics_ListIteratorOfListOfBox2d)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (SelectBasics_ListIteratorOfListOfBox2d & It);
		%feature("autodoc", "Args:
	I(Bnd_Box2d)
	It(SelectBasics_ListIteratorOfListOfBox2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Bnd_Box2d & I,SelectBasics_ListIteratorOfListOfBox2d & It);
		%feature("autodoc", "Args:
	Other(SelectBasics_ListOfBox2d)
	It(SelectBasics_ListIteratorOfListOfBox2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (SelectBasics_ListOfBox2d & Other,SelectBasics_ListIteratorOfListOfBox2d & It);
		%feature("autodoc", "Args:
	I(Bnd_Box2d)
	It(SelectBasics_ListIteratorOfListOfBox2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Bnd_Box2d & I,SelectBasics_ListIteratorOfListOfBox2d & It);
		%feature("autodoc", "Args:
	Other(SelectBasics_ListOfBox2d)
	It(SelectBasics_ListIteratorOfListOfBox2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SelectBasics_ListOfSensitive;
		 SelectBasics_ListOfSensitive ();
		%feature("autodoc", "Args:
	Other(SelectBasics_ListOfSensitive)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const SelectBasics_ListOfSensitive & Other);
		%feature("autodoc", "Args:
	Other(SelectBasics_ListOfSensitive)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const SelectBasics_ListOfSensitive & Other);
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
	I(Handle_SelectBasics_SensitiveEntity)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_SelectBasics_SensitiveEntity & I);
		%feature("autodoc", "Args:
	I(Handle_SelectBasics_SensitiveEntity)
	theIt(SelectBasics_ListIteratorOfListOfSensitive)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_SelectBasics_SensitiveEntity & I,SelectBasics_ListIteratorOfListOfSensitive & theIt);
		%feature("autodoc", "Args:
	Other(SelectBasics_ListOfSensitive)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (SelectBasics_ListOfSensitive & Other);
		%feature("autodoc", "Args:
	I(Handle_SelectBasics_SensitiveEntity)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_SelectBasics_SensitiveEntity & I);
		%feature("autodoc", "Args:
	I(Handle_SelectBasics_SensitiveEntity)
	theIt(SelectBasics_ListIteratorOfListOfSensitive)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_SelectBasics_SensitiveEntity & I,SelectBasics_ListIteratorOfListOfSensitive & theIt);
		%feature("autodoc", "Args:
	Other(SelectBasics_ListOfSensitive)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (SelectBasics_ListOfSensitive & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_SelectBasics_SensitiveEntity

No detailed docstring for this function.") First;
		Handle_SelectBasics_SensitiveEntity & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_SelectBasics_SensitiveEntity

No detailed docstring for this function.") Last;
		Handle_SelectBasics_SensitiveEntity & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(SelectBasics_ListIteratorOfListOfSensitive)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (SelectBasics_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "Args:
	I(Handle_SelectBasics_SensitiveEntity)
	It(SelectBasics_ListIteratorOfListOfSensitive)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_SelectBasics_SensitiveEntity & I,SelectBasics_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "Args:
	Other(SelectBasics_ListOfSensitive)
	It(SelectBasics_ListIteratorOfListOfSensitive)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (SelectBasics_ListOfSensitive & Other,SelectBasics_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "Args:
	I(Handle_SelectBasics_SensitiveEntity)
	It(SelectBasics_ListIteratorOfListOfSensitive)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_SelectBasics_SensitiveEntity & I,SelectBasics_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "Args:
	Other(SelectBasics_ListOfSensitive)
	It(SelectBasics_ListIteratorOfListOfSensitive)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
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
		%feature("autodoc", "Args:
	theX(Standard_Real)
	theY(Standard_Real)
	theTolerance(Standard_Real)
	theDepthMin(Standard_Real)
	theDepthMax(Standard_Real)
	thePickingLine(gp_Lin)

Returns:
	None

Constructor.
@param theX mouse picking coordinate on x-axis of selection coord space.
@param theY mouse picking coordinate on y-axis of selection coord space.
@param theTolerance x, y coordinate tolerance.
@param theDepthMin minimum picking depth in selection coord space.
@param theDepthMax maximum picking depth in selection coord space.
@param thePickingLine line going through picking point.") SelectBasics_PickArgs;
		 SelectBasics_PickArgs (const Standard_Real theX,const Standard_Real theY,const Standard_Real theTolerance,const Standard_Real theDepthMin,const Standard_Real theDepthMax,const gp_Lin & thePickingLine);
		%feature("autodoc", "Args:
	None
Returns:
	inline Standard_Real

No detailed docstring for this function.") X;
		inline Standard_Real X ();
		%feature("autodoc", "Args:
	None
Returns:
	inline Standard_Real

No detailed docstring for this function.") Y;
		inline Standard_Real Y ();
		%feature("autodoc", "Args:
	None
Returns:
	inline Standard_Real

No detailed docstring for this function.") Tolerance;
		inline Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	None
Returns:
	inline Standard_Real

No detailed docstring for this function.") DepthMin;
		inline Standard_Real DepthMin ();
		%feature("autodoc", "Args:
	None
Returns:
	inline Standard_Real

No detailed docstring for this function.") DepthMax;
		inline Standard_Real DepthMax ();
		%feature("autodoc", "Args:
	None
Returns:
	inline  gp_Lin

No detailed docstring for this function.") PickLine;
		inline const gp_Lin & PickLine ();
		%feature("autodoc", "Args:
	theDepth(Standard_Real)

Returns:
	inline Standard_Boolean

@return True if passed depth lies outside valid depth range.") IsClipped;
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
		%feature("autodoc", "Args:
	TheOwnerId(Handle_SelectBasics_EntityOwner)

Returns:
	virtual void

No detailed docstring for this function.") Set;
		virtual void Set (const Handle_SelectBasics_EntityOwner & TheOwnerId);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_SelectBasics_EntityOwner

No detailed docstring for this function.") OwnerId;
		const Handle_SelectBasics_EntityOwner & OwnerId ();
		%feature("autodoc", "Args:
	aresult(SelectBasics_ListOfBox2d)

Returns:
	virtual void

to be implemented specifically by each type of  
         sensitive  primitive .") Areas;
		virtual void Areas (SelectBasics_ListOfBox2d & aresult);
		%feature("autodoc", "Args:
	thePickArgs(SelectBasics_PickArgs)
	theMatchDMin(Standard_Real)
	theMatchDepth(Standard_Real)

Returns:
	virtual Standard_Boolean

Checks whether the sensitive entity matches the picking detection  
area (close to the picking line). This method takes into account depth  
limits produced by abstract view: far/near planes, clippings.  
Please port existing implementations of your picking detection, which  
were done at Matches (X, Y, Tol, DMin) method to this one, introducing  
the depth checks. Please note that the previous method is suppressed  
and the virtual implementations are not used by OCC selection framework.  
The porting procedure for simple sensitives (or if you are not interested  
in implementing full scale depth checks) can be simplified to writing the  
following code snippet:  
@code  
{ // example code for porting descendants of Select3D_SensitiveEntity  
 
  // invoke implementation of obsolete matches method (if implemented)...  
  if (!Matches (thePickArgs.X(), thePickArgs.Y(), thePickArgs.Tolerance(), theMatchDMin))  
    return Standard_False;  
 
  // invoke your implementation of computing depth (if implemented)...  
  Standard_Real aDetectDepth = ComputeDepth (thePickArgs.PickLine());  
 
  return !thePickArgs.IsClipped(aDetectDepth);  
}  
@endcode  
@param thePickArgs [in] the picking arguments.  
@param theMatchDMin [out] the minimum distance on xy plane from point  
of picking to center of gravity of the detected sub-part of sensitive  
entity or the whole sensitive (e.g. used for resolving selection of  
coinciding circles, selection will be set to the one whose center is  
closest to the picking point).  
@param theMatchDepth [out] the minimum detected depth: depth of the  
closest detected sub-part of sensitive entity (or the whole sensitive).  
@return True if the sensitive matches the detection area.  
This method is an entry point for picking detection framework.  
The method is triggered when it is required to compose list of  
detected sensitive entities. The sensitives are filtered out from  
detection result if returned value is False. The passed entities are  
then can be sorted by 'theDetectDist', 'theDetectDepth' parameters.") Matches;
		virtual Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	aTol(Standard_Real)

Returns:
	virtual Standard_Boolean

returns True if the box (Xmin,YMin)------(Xmax,Ymax)  
         contains the SensitiveEntity.  
         Necessary for selection using elastic boxes,or segments.") Matches;
		virtual Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "Args:
	Polyline(TColgp_Array1OfPnt2d)
	aBox(Bnd_Box2d)
	aTol(Standard_Real)

Returns:
	virtual Standard_Boolean

returns True if the polyline xi,yi  
         contains the SensitiveEntity.  
         Necessary for selection using polyline selection") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") NeedsConversion;
		virtual Standard_Boolean NeedsConversion ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

returns True if able to give 3D information  
         (Depth,...). See Select3D") Is3D;
		virtual Standard_Boolean Is3D ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the max number of boxes the entity is able to give  
         at a time") MaxBoxes;
		virtual Standard_Integer MaxBoxes ();
		%feature("autodoc", "Args:
	aFactor(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") SetSensitivityFactor;
		void SetSensitivityFactor (const Standard_ShortReal aFactor);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

allows a better sensitivity for  
         a specific entity in selection algorithms  
         useful for small sized entities.") SensitivityFactor;
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
		%feature("autodoc", "Args:
	I(Handle_SelectBasics_EntityOwner)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") SelectBasics_SequenceNodeOfSequenceOfOwner;
		 SelectBasics_SequenceNodeOfSequenceOfOwner (const Handle_SelectBasics_EntityOwner & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_SelectBasics_EntityOwner

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SelectBasics_SequenceOfOwner;
		 SelectBasics_SequenceOfOwner ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(SelectBasics_SequenceOfOwner)

Returns:
	SelectBasics_SequenceOfOwner

No detailed docstring for this function.") Assign;
		const SelectBasics_SequenceOfOwner & Assign (const SelectBasics_SequenceOfOwner & Other);
		%feature("autodoc", "Args:
	Other(SelectBasics_SequenceOfOwner)

Returns:
	SelectBasics_SequenceOfOwner

No detailed docstring for this function.") operator=;
		const SelectBasics_SequenceOfOwner & operator = (const SelectBasics_SequenceOfOwner & Other);
		%feature("autodoc", "Args:
	T(Handle_SelectBasics_EntityOwner)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_SelectBasics_EntityOwner & T);
		%feature("autodoc", "Args:
	S(SelectBasics_SequenceOfOwner)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (SelectBasics_SequenceOfOwner & S);
		%feature("autodoc", "Args:
	T(Handle_SelectBasics_EntityOwner)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_SelectBasics_EntityOwner & T);
		%feature("autodoc", "Args:
	S(SelectBasics_SequenceOfOwner)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (SelectBasics_SequenceOfOwner & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_SelectBasics_EntityOwner)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_SelectBasics_EntityOwner & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(SelectBasics_SequenceOfOwner)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,SelectBasics_SequenceOfOwner & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_SelectBasics_EntityOwner)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_SelectBasics_EntityOwner & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(SelectBasics_SequenceOfOwner)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,SelectBasics_SequenceOfOwner & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_SelectBasics_EntityOwner

No detailed docstring for this function.") First;
		const Handle_SelectBasics_EntityOwner & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_SelectBasics_EntityOwner

No detailed docstring for this function.") Last;
		const Handle_SelectBasics_EntityOwner & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(SelectBasics_SequenceOfOwner)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,SelectBasics_SequenceOfOwner & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_SelectBasics_EntityOwner

No detailed docstring for this function.") Value;
		const Handle_SelectBasics_EntityOwner & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_SelectBasics_EntityOwner)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_SelectBasics_EntityOwner & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_SelectBasics_EntityOwner

No detailed docstring for this function.") ChangeValue;
		Handle_SelectBasics_EntityOwner & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty rectangle selector.") SelectBasics_SortAlgo;
		 SelectBasics_SortAlgo ();
		%feature("autodoc", "Args:
	ClippingRectangle(Bnd_Box2d)
	sizeOfSensitiveArea(Standard_Real)
	theRectangles(Handle_Bnd_HArray1OfBox2d)

Returns:
	None

Creates a initialized selector.") SelectBasics_SortAlgo;
		 SelectBasics_SortAlgo (const Bnd_Box2d & ClippingRectangle,const Standard_Real sizeOfSensitiveArea,const Handle_Bnd_HArray1OfBox2d & theRectangles);
		%feature("autodoc", "Args:
	ClippingRectangle(Bnd_Box2d)
	sizeOfSensitiveArea(Standard_Real)
	theRectangles(Handle_Bnd_HArray1OfBox2d)

Returns:
	None

Clears and initializes the selector.") Initialize;
		void Initialize (const Bnd_Box2d & ClippingRectangle,const Standard_Real sizeOfSensitiveArea,const Handle_Bnd_HArray1OfBox2d & theRectangles);
		%feature("autodoc", "Args:
	x(Standard_Real)
	y(Standard_Real)

Returns:
	None

Searchs the items on this position.") InitSelect;
		void InitSelect (const Standard_Real x,const Standard_Real y);
		%feature("autodoc", "Args:
	rect(Bnd_Box2d)

Returns:
	None

Searchs the items in this rectangle.") InitSelect;
		void InitSelect (const Bnd_Box2d & rect);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there is something selected.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets value on the next selected item.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the index of the selected rectangle.") Value;
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
