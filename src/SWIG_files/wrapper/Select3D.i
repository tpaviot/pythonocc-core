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
%module (package="OCC") Select3D

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

%include Select3D_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum Select3D_TypeOfSensitivity {
	Select3D_TOS_INTERIOR = 0,
	Select3D_TOS_BOUNDARY = 1,
};

/* end public enums declaration */

%nodefaultctor Select3D_Box2d;
class Select3D_Box2d {
	public:
		%feature("autodoc", "	:rtype: None
") Select3D_Box2d;
		 Select3D_Box2d ();
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_Box2d &
	:rtype: None
") Select3D_Box2d;
		 Select3D_Box2d (const Bnd_Box2d & theBox);
		%feature("autodoc", "	:rtype: inline
") operatorBnd_Box2d;
		inline operator Bnd_Box2d ();
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_Box2d &
	:rtype: inline Select3D_Box2d
") operator=;
		inline Select3D_Box2d operator = (const Bnd_Box2d & theBox);
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_Pnt2d
	:rtype: inline void
") Update;
		inline void Update (const gp_Pnt2d & thePnt);
		%feature("autodoc", "	:rtype: inline void
") SetVoid;
		inline void SetVoid ();
		%feature("autodoc", "	:rtype: inline bool
") IsVoid;
		inline Standard_Boolean IsVoid ();
};


%feature("shadow") Select3D_Box2d::~Select3D_Box2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_Box2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Select3D_ListIteratorOfListOfSensitive;
class Select3D_ListIteratorOfListOfSensitive {
	public:
		%feature("autodoc", "	:rtype: None
") Select3D_ListIteratorOfListOfSensitive;
		 Select3D_ListIteratorOfListOfSensitive ();
		%feature("autodoc", "	:param L:
	:type L: Select3D_ListOfSensitive &
	:rtype: None
") Select3D_ListIteratorOfListOfSensitive;
		 Select3D_ListIteratorOfListOfSensitive (const Select3D_ListOfSensitive & L);
		%feature("autodoc", "	:param L:
	:type L: Select3D_ListOfSensitive &
	:rtype: None
") Initialize;
		void Initialize (const Select3D_ListOfSensitive & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") Value;
		Handle_Select3D_SensitiveEntity & Value ();
};


%feature("shadow") Select3D_ListIteratorOfListOfSensitive::~Select3D_ListIteratorOfListOfSensitive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_ListIteratorOfListOfSensitive {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Select3D_ListIteratorOfListOfSensitiveTriangle;
class Select3D_ListIteratorOfListOfSensitiveTriangle {
	public:
		%feature("autodoc", "	:rtype: None
") Select3D_ListIteratorOfListOfSensitiveTriangle;
		 Select3D_ListIteratorOfListOfSensitiveTriangle ();
		%feature("autodoc", "	:param L:
	:type L: Select3D_ListOfSensitiveTriangle &
	:rtype: None
") Select3D_ListIteratorOfListOfSensitiveTriangle;
		 Select3D_ListIteratorOfListOfSensitiveTriangle (const Select3D_ListOfSensitiveTriangle & L);
		%feature("autodoc", "	:param L:
	:type L: Select3D_ListOfSensitiveTriangle &
	:rtype: None
") Initialize;
		void Initialize (const Select3D_ListOfSensitiveTriangle & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveTriangle
") Value;
		Handle_Select3D_SensitiveTriangle & Value ();
};


%feature("shadow") Select3D_ListIteratorOfListOfSensitiveTriangle::~Select3D_ListIteratorOfListOfSensitiveTriangle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_ListIteratorOfListOfSensitiveTriangle {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Select3D_ListNodeOfListOfSensitive;
class Select3D_ListNodeOfListOfSensitive : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Select3D_ListNodeOfListOfSensitive;
		 Select3D_ListNodeOfListOfSensitive (const Handle_Select3D_SensitiveEntity & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") Value;
		Handle_Select3D_SensitiveEntity & Value ();
};


%feature("shadow") Select3D_ListNodeOfListOfSensitive::~Select3D_ListNodeOfListOfSensitive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_ListNodeOfListOfSensitive {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Select3D_ListNodeOfListOfSensitive {
	Handle_Select3D_ListNodeOfListOfSensitive GetHandle() {
	return *(Handle_Select3D_ListNodeOfListOfSensitive*) &$self;
	}
};

%nodefaultctor Handle_Select3D_ListNodeOfListOfSensitive;
class Handle_Select3D_ListNodeOfListOfSensitive : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Select3D_ListNodeOfListOfSensitive();
        Handle_Select3D_ListNodeOfListOfSensitive(const Handle_Select3D_ListNodeOfListOfSensitive &aHandle);
        Handle_Select3D_ListNodeOfListOfSensitive(const Select3D_ListNodeOfListOfSensitive *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_ListNodeOfListOfSensitive DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_ListNodeOfListOfSensitive {
    Select3D_ListNodeOfListOfSensitive* GetObject() {
    return (Select3D_ListNodeOfListOfSensitive*)$self->Access();
    }
};
%feature("shadow") Handle_Select3D_ListNodeOfListOfSensitive::~Handle_Select3D_ListNodeOfListOfSensitive %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Select3D_ListNodeOfListOfSensitive {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Select3D_ListNodeOfListOfSensitiveTriangle;
class Select3D_ListNodeOfListOfSensitiveTriangle : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveTriangle &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Select3D_ListNodeOfListOfSensitiveTriangle;
		 Select3D_ListNodeOfListOfSensitiveTriangle (const Handle_Select3D_SensitiveTriangle & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveTriangle
") Value;
		Handle_Select3D_SensitiveTriangle & Value ();
};


%feature("shadow") Select3D_ListNodeOfListOfSensitiveTriangle::~Select3D_ListNodeOfListOfSensitiveTriangle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_ListNodeOfListOfSensitiveTriangle {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Select3D_ListNodeOfListOfSensitiveTriangle {
	Handle_Select3D_ListNodeOfListOfSensitiveTriangle GetHandle() {
	return *(Handle_Select3D_ListNodeOfListOfSensitiveTriangle*) &$self;
	}
};

%nodefaultctor Handle_Select3D_ListNodeOfListOfSensitiveTriangle;
class Handle_Select3D_ListNodeOfListOfSensitiveTriangle : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Select3D_ListNodeOfListOfSensitiveTriangle();
        Handle_Select3D_ListNodeOfListOfSensitiveTriangle(const Handle_Select3D_ListNodeOfListOfSensitiveTriangle &aHandle);
        Handle_Select3D_ListNodeOfListOfSensitiveTriangle(const Select3D_ListNodeOfListOfSensitiveTriangle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_ListNodeOfListOfSensitiveTriangle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_ListNodeOfListOfSensitiveTriangle {
    Select3D_ListNodeOfListOfSensitiveTriangle* GetObject() {
    return (Select3D_ListNodeOfListOfSensitiveTriangle*)$self->Access();
    }
};
%feature("shadow") Handle_Select3D_ListNodeOfListOfSensitiveTriangle::~Handle_Select3D_ListNodeOfListOfSensitiveTriangle %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Select3D_ListNodeOfListOfSensitiveTriangle {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Select3D_ListOfSensitive;
class Select3D_ListOfSensitive {
	public:
		%feature("autodoc", "	:rtype: None
") Select3D_ListOfSensitive;
		 Select3D_ListOfSensitive ();
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitive &
	:rtype: None
") Assign;
		void Assign (const Select3D_ListOfSensitive & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitive &
	:rtype: None
") operator=;
		void operator = (const Select3D_ListOfSensitive & Other);
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
	:type I: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Select3D_SensitiveEntity & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:param theIt:
	:type theIt: Select3D_ListIteratorOfListOfSensitive &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Select3D_SensitiveEntity & I,Select3D_ListIteratorOfListOfSensitive & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitive &
	:rtype: None
") Prepend;
		void Prepend (Select3D_ListOfSensitive & Other);
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Append;
		void Append (const Handle_Select3D_SensitiveEntity & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:param theIt:
	:type theIt: Select3D_ListIteratorOfListOfSensitive &
	:rtype: None
") Append;
		void Append (const Handle_Select3D_SensitiveEntity & I,Select3D_ListIteratorOfListOfSensitive & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitive &
	:rtype: None
") Append;
		void Append (Select3D_ListOfSensitive & Other);
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") First;
		Handle_Select3D_SensitiveEntity & First ();
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") Last;
		Handle_Select3D_SensitiveEntity & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitive &
	:rtype: None
") Remove;
		void Remove (Select3D_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitive &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_Select3D_SensitiveEntity & I,Select3D_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitive &
	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitive &
	:rtype: None
") InsertBefore;
		void InsertBefore (Select3D_ListOfSensitive & Other,Select3D_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitive &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_Select3D_SensitiveEntity & I,Select3D_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitive &
	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitive &
	:rtype: None
") InsertAfter;
		void InsertAfter (Select3D_ListOfSensitive & Other,Select3D_ListIteratorOfListOfSensitive & It);
};


%feature("shadow") Select3D_ListOfSensitive::~Select3D_ListOfSensitive %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_ListOfSensitive {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Select3D_ListOfSensitiveTriangle;
class Select3D_ListOfSensitiveTriangle {
	public:
		%feature("autodoc", "	:rtype: None
") Select3D_ListOfSensitiveTriangle;
		 Select3D_ListOfSensitiveTriangle ();
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitiveTriangle &
	:rtype: None
") Assign;
		void Assign (const Select3D_ListOfSensitiveTriangle & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitiveTriangle &
	:rtype: None
") operator=;
		void operator = (const Select3D_ListOfSensitiveTriangle & Other);
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
	:type I: Handle_Select3D_SensitiveTriangle &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Select3D_SensitiveTriangle & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveTriangle &
	:param theIt:
	:type theIt: Select3D_ListIteratorOfListOfSensitiveTriangle &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Select3D_SensitiveTriangle & I,Select3D_ListIteratorOfListOfSensitiveTriangle & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitiveTriangle &
	:rtype: None
") Prepend;
		void Prepend (Select3D_ListOfSensitiveTriangle & Other);
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveTriangle &
	:rtype: None
") Append;
		void Append (const Handle_Select3D_SensitiveTriangle & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveTriangle &
	:param theIt:
	:type theIt: Select3D_ListIteratorOfListOfSensitiveTriangle &
	:rtype: None
") Append;
		void Append (const Handle_Select3D_SensitiveTriangle & I,Select3D_ListIteratorOfListOfSensitiveTriangle & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitiveTriangle &
	:rtype: None
") Append;
		void Append (Select3D_ListOfSensitiveTriangle & Other);
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveTriangle
") First;
		Handle_Select3D_SensitiveTriangle & First ();
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveTriangle
") Last;
		Handle_Select3D_SensitiveTriangle & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitiveTriangle &
	:rtype: None
") Remove;
		void Remove (Select3D_ListIteratorOfListOfSensitiveTriangle & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveTriangle &
	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitiveTriangle &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_Select3D_SensitiveTriangle & I,Select3D_ListIteratorOfListOfSensitiveTriangle & It);
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitiveTriangle &
	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitiveTriangle &
	:rtype: None
") InsertBefore;
		void InsertBefore (Select3D_ListOfSensitiveTriangle & Other,Select3D_ListIteratorOfListOfSensitiveTriangle & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveTriangle &
	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitiveTriangle &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_Select3D_SensitiveTriangle & I,Select3D_ListIteratorOfListOfSensitiveTriangle & It);
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_ListOfSensitiveTriangle &
	:param It:
	:type It: Select3D_ListIteratorOfListOfSensitiveTriangle &
	:rtype: None
") InsertAfter;
		void InsertAfter (Select3D_ListOfSensitiveTriangle & Other,Select3D_ListIteratorOfListOfSensitiveTriangle & It);
};


%feature("shadow") Select3D_ListOfSensitiveTriangle::~Select3D_ListOfSensitiveTriangle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_ListOfSensitiveTriangle {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Select3D_Pnt;
class Select3D_Pnt {
	public:
		%feature("autodoc", "	:rtype: inline
") operatorgp_Pnt;
		inline operator gp_Pnt ();
		%feature("autodoc", "	:rtype: inline
") operatorgp_XYZ;
		inline operator gp_XYZ ();
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: inline gp_Pnt
") operator=;
		inline gp_Pnt operator = (const gp_Pnt & thePnt);
};


%feature("shadow") Select3D_Pnt::~Select3D_Pnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_Pnt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Select3D_Pnt2d;
class Select3D_Pnt2d {
	public:
		%feature("autodoc", "	:rtype: inline
") operatorgp_Pnt2d;
		inline operator gp_Pnt2d ();
		%feature("autodoc", "	:rtype: inline
") operatorgp_XY;
		inline operator gp_XY ();
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_Pnt2d
	:rtype: inline gp_Pnt2d
") operator=;
		inline gp_Pnt2d operator = (const gp_Pnt2d & thePnt);
};


%feature("shadow") Select3D_Pnt2d::~Select3D_Pnt2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_Pnt2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Select3D_PointData;
class Select3D_PointData {
	public:
		%feature("autodoc", "	:param theNbPoints:
	:type theNbPoints: Standard_Integer
	:rtype: None
") Select3D_PointData;
		 Select3D_PointData (const Standard_Integer theNbPoints);
		%feature("autodoc", "	:param theIndex:
	:type theIndex: Standard_Integer
	:param theValue:
	:type theValue: Select3D_Pnt &
	:rtype: None
") SetPnt;
		void SetPnt (const Standard_Integer theIndex,const Select3D_Pnt & theValue);
		%feature("autodoc", "	:param theIndex:
	:type theIndex: Standard_Integer
	:param theValue:
	:type theValue: gp_Pnt
	:rtype: None
") SetPnt;
		void SetPnt (const Standard_Integer theIndex,const gp_Pnt & theValue);
		%feature("autodoc", "	:param theIndex:
	:type theIndex: Standard_Integer
	:param theValue:
	:type theValue: Select3D_Pnt2d &
	:rtype: None
") SetPnt2d;
		void SetPnt2d (const Standard_Integer theIndex,const Select3D_Pnt2d & theValue);
		%feature("autodoc", "	:param theIndex:
	:type theIndex: Standard_Integer
	:param theValue:
	:type theValue: gp_Pnt2d
	:rtype: None
") SetPnt2d;
		void SetPnt2d (const Standard_Integer theIndex,const gp_Pnt2d & theValue);
		%feature("autodoc", "	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: Select3D_Pnt
") Pnt;
		Select3D_Pnt Pnt (const Standard_Integer theIndex);
		%feature("autodoc", "	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: Select3D_Pnt2d
") Pnt2d;
		Select3D_Pnt2d Pnt2d (const Standard_Integer theIndex);
		%feature("autodoc", "	:rtype: int
") Size;
		Standard_Integer Size ();
};


%feature("shadow") Select3D_PointData::~Select3D_PointData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_PointData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Select3D_Projector;
class Select3D_Projector : public Standard_Transient {
	public:
		%feature("autodoc", "	* Constructs the 3D projector object defined by the 3D view aView.

	:param aView:
	:type aView: Handle_V3d_View &
	:rtype: None
") Select3D_Projector;
		 Select3D_Projector (const Handle_V3d_View & aView);
		%feature("autodoc", "	:rtype: None
") Select3D_Projector;
		 Select3D_Projector ();
		%feature("autodoc", "	* Creates an axonometric projector. <CS> represents viewing coordinate system and could be constructed from x direction, view plane normal direction, and view point location in world-coordinate space.

	:param CS:
	:type CS: gp_Ax2
	:rtype: None
") Select3D_Projector;
		 Select3D_Projector (const gp_Ax2 & CS);
		%feature("autodoc", "	* Creates a perspective projector. <CS> represents viewing coordinate system and could be constructed from x direction, view plane normal direction, and focal point location in world-coordinate space. <Focus> should represent distance of an eye from view plane in world-coordinate space (focal distance).

	:param CS:
	:type CS: gp_Ax2
	:param Focus:
	:type Focus: float
	:rtype: None
") Select3D_Projector;
		 Select3D_Projector (const gp_Ax2 & CS,const Standard_Real Focus);
		%feature("autodoc", "	* build a Projector from the given transformation. In case, when <T> transformation should represent custom view projection, it could be constructed from two separate components: transposed view orientation matrix and translation of focal point in view-coordiante system. <T> could be built up from x direction, up direction, view plane normal direction vectors and translation with SetValues(...) method, where first row arguments (a11, a12, a13, a14) are x, y, z component of x direction vector, and x value of reversed translation vector. Second row arguments, are x y z for up direction and y value of reversed translation, and the third row defined in the same manner. This also suits for simple perspective view, where <Focus> is the focale distance of an eye from view plane in world-space coordiantes. Note, that in that case amount of perspective distortion (perspective angle) should be defined through focal distance.

	:param T:
	:type T: gp_Trsf
	:param Persp:
	:type Persp: bool
	:param Focus:
	:type Focus: float
	:rtype: None
") Select3D_Projector;
		 Select3D_Projector (const gp_Trsf & T,const Standard_Boolean Persp,const Standard_Real Focus);
		%feature("autodoc", "	* build a Projector from the given transformation. In case, when <GT> transformation should represent custom view projection, it could be constructed from two separate components: transposed view orientation matrix and translation of a focal point in view-coordinate system. This also suits for perspective view, with <Focus> that could be equal to distance from an eye to a view plane in world-coordinates (focal distance). The 3x3 transformation matrix is built up from three vectors: x direction, up direction and view plane normal vectors, where each vector is a matrix row. Then <GT> is constructed from matrix and reversed translation with methods SetTranslationPart(..) and SetVectorialPart(..). Note, that in that case amount of perspective distortion (perspective angle) should be defined through focal distance.

	:param GT:
	:type GT: gp_GTrsf
	:param Persp:
	:type Persp: bool
	:param Focus:
	:type Focus: float
	:rtype: None
") Select3D_Projector;
		 Select3D_Projector (const gp_GTrsf & GT,const Standard_Boolean Persp,const Standard_Real Focus);
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:param Persp:
	:type Persp: bool
	:param Focus:
	:type Focus: float
	:rtype: None
") Set;
		void Set (const gp_Trsf & T,const Standard_Boolean Persp,const Standard_Real Focus);
		%feature("autodoc", "	* Sets the 3D view V used at the time of construction.

	:param V:
	:type V: Handle_V3d_View &
	:rtype: None
") SetView;
		void SetView (const Handle_V3d_View & V);
		%feature("autodoc", "	* Returns the 3D view used at the time of construction.

	:rtype: Handle_V3d_View
") View;
		const Handle_V3d_View & View ();
		%feature("autodoc", "	* to compute with the given scale and translation.

	:param On: default value is Standard_False
	:type On: bool
	:rtype: void
") Scaled;
		virtual void Scaled (const Standard_Boolean On = Standard_False);
		%feature("autodoc", "	* Returns True if there is a perspective transformation.

	:rtype: bool
") Perspective;
		Standard_Boolean Perspective ();
		%feature("autodoc", "	* Returns the active transformation.

	:rtype: gp_GTrsf
") Transformation;
		const gp_GTrsf  Transformation ();
		%feature("autodoc", "	* Returns the active inverted transformation.

	:rtype: gp_GTrsf
") InvertedTransformation;
		const gp_GTrsf  InvertedTransformation ();
		%feature("autodoc", "	* Returns the original transformation.

	:rtype: gp_Trsf
") FullTransformation;
		const gp_Trsf  FullTransformation ();
		%feature("autodoc", "	* Returns the focal length.

	:rtype: float
") Focus;
		Standard_Real Focus ();
		%feature("autodoc", "	:param D:
	:type D: gp_Vec
	:rtype: None
") Transform;
		void Transform (gp_Vec & D);
		%feature("autodoc", "	:param Pnt:
	:type Pnt: gp_Pnt
	:rtype: None
") Transform;
		void Transform (gp_Pnt & Pnt);
		%feature("autodoc", "	* Transform and apply perspective if needed.

	:param P:
	:type P: gp_Pnt
	:param Pout:
	:type Pout: gp_Pnt2d
	:rtype: void
") Project;
		virtual void Project (const gp_Pnt & P,gp_Pnt2d & Pout);
		%feature("autodoc", "	* Transform and apply perspective if needed.

	:param P:
	:type P: gp_Pnt
	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None
") Project;
		void Project (const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Transform and apply perspective if needed.

	:param P:
	:type P: gp_Pnt
	:param D1:
	:type D1: gp_Vec
	:param Pout:
	:type Pout: gp_Pnt2d
	:param D1out:
	:type D1out: gp_Vec2d
	:rtype: void
") Project;
		virtual void Project (const gp_Pnt & P,const gp_Vec & D1,gp_Pnt2d & Pout,gp_Vec2d & D1out);
		%feature("autodoc", "	* return a line going through the eye towards the 2d point <X,Y>.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: gp_Lin
") Shoot;
		virtual gp_Lin Shoot (const Standard_Real X,const Standard_Real Y);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param T:
	:type T: gp_GTrsf
	:rtype: None
") Transform;
		void Transform (gp_Pnt & P,const gp_GTrsf & T);
		%feature("autodoc", "	:param D:
	:type D: gp_Lin
	:param T:
	:type T: gp_GTrsf
	:rtype: None
") Transform;
		void Transform (gp_Lin & D,const gp_GTrsf & T);
};


%feature("shadow") Select3D_Projector::~Select3D_Projector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_Projector {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Select3D_Projector {
	Handle_Select3D_Projector GetHandle() {
	return *(Handle_Select3D_Projector*) &$self;
	}
};

%nodefaultctor Handle_Select3D_Projector;
class Handle_Select3D_Projector : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Select3D_Projector();
        Handle_Select3D_Projector(const Handle_Select3D_Projector &aHandle);
        Handle_Select3D_Projector(const Select3D_Projector *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_Projector DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_Projector {
    Select3D_Projector* GetObject() {
    return (Select3D_Projector*)$self->Access();
    }
};
%feature("shadow") Handle_Select3D_Projector::~Handle_Select3D_Projector %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Select3D_Projector {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Select3D_SensitiveEntity;
class Select3D_SensitiveEntity : public SelectBasics_SensitiveEntity {
	public:
		%feature("autodoc", "	* Returns true if this framework needs conversion.

	:rtype: bool
") NeedsConversion;
		Standard_Boolean NeedsConversion ();
		%feature("autodoc", "	* Returns true if this framework provides 3D information.

	:rtype: bool
") Is3D;
		Standard_Boolean Is3D ();
		%feature("autodoc", "	* In classes inheriting this framework, you must redefine this function in order to get a sensitive 2D rectangle from a 3D entity. This rectangle is the sensitive zone which makes the 3D entity selectable.

	:param aProjector:
	:type aProjector: Handle_Select3D_Projector &
	:rtype: void
") Project;
		virtual void Project (const Handle_Select3D_Projector & aProjector);
		%feature("autodoc", "	* Returns the max number of sensitive areas returned by this class is 1 by default. Else on must redefine this method.

	:rtype: int
") MaxBoxes;
		virtual Standard_Integer MaxBoxes ();
		%feature("autodoc", "	* Originally this method intended to return sensitive entity with new location aLocation, but currently sensitive entities do not hold a location, instead HasLocation() and Location() methods call corresponding entity owner's methods. Thus all entities returned by GetConnected() share the same location propagated from corresponding selectable object. You must redefine this function for any type of sensitive entity which can accept another connected sensitive entity.//can be connected to another sensitive entity.

	:param aLocation:
	:type aLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("autodoc", "	* Matches the box defined by the coordinates Xmin, Ymin, Xmax, Ymax with the entity found at that point within the tolerance aTol. Xmin, YMin define the minimum point in the lower left hand corner of the box, and XMax, YMax define the maximum point in the upper right hand corner of the box. You must redefine this function for every inheriting entity. You will have to call this framework inside the redefined function.

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
		%feature("autodoc", "	* prevents from hiding virtual methods...

	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "	* Returns true if this framework has a location defined.

	:rtype: bool
") HasLocation;
		virtual Standard_Boolean HasLocation ();
		%feature("autodoc", "	:rtype: TopLoc_Location
") Location;
		virtual const TopLoc_Location & Location ();
		%feature("autodoc", "	* sets the location to Identity

	:rtype: void
") ResetLocation;
		virtual void ResetLocation ();
		%feature("autodoc", "	:param aLoc:
	:type aLoc: TopLoc_Location &
	:rtype: void
") SetLocation;
		virtual void SetLocation (const TopLoc_Location & aLoc);
		%feature("autodoc", "	* 2 options : <FullDump> = False -> general information //!	 <FullDump> = True -> whole informtion 3D +2d ...

	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param abox:
	:type abox: Bnd_Box2d &
	:rtype: void
") DumpBox;
		static void DumpBox (Standard_OStream & S,const Bnd_Box2d & abox);
		%feature("autodoc", "	:param aLoc:
	:type aLoc: TopLoc_Location &
	:rtype: None
") UpdateLocation;
		void UpdateLocation (const TopLoc_Location & aLoc);
};


%feature("shadow") Select3D_SensitiveEntity::~Select3D_SensitiveEntity %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_SensitiveEntity {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Select3D_SensitiveEntity {
	Handle_Select3D_SensitiveEntity GetHandle() {
	return *(Handle_Select3D_SensitiveEntity*) &$self;
	}
};

%nodefaultctor Handle_Select3D_SensitiveEntity;
class Handle_Select3D_SensitiveEntity : public Handle_SelectBasics_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitiveEntity();
        Handle_Select3D_SensitiveEntity(const Handle_Select3D_SensitiveEntity &aHandle);
        Handle_Select3D_SensitiveEntity(const Select3D_SensitiveEntity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveEntity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveEntity {
    Select3D_SensitiveEntity* GetObject() {
    return (Select3D_SensitiveEntity*)$self->Access();
    }
};
%feature("shadow") Handle_Select3D_SensitiveEntity::~Handle_Select3D_SensitiveEntity %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Select3D_SensitiveEntity {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Select3D_SensitiveEntitySequence;
class Select3D_SensitiveEntitySequence : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Select3D_SensitiveEntitySequence;
		 Select3D_SensitiveEntitySequence ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_SensitiveEntitySequence &
	:rtype: Select3D_SensitiveEntitySequence
") Assign;
		const Select3D_SensitiveEntitySequence & Assign (const Select3D_SensitiveEntitySequence & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Select3D_SensitiveEntitySequence &
	:rtype: Select3D_SensitiveEntitySequence
") operator=;
		const Select3D_SensitiveEntitySequence & operator = (const Select3D_SensitiveEntitySequence & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Append;
		void Append (const Handle_Select3D_SensitiveEntity & T);
		%feature("autodoc", "	:param S:
	:type S: Select3D_SensitiveEntitySequence &
	:rtype: None
") Append;
		void Append (Select3D_SensitiveEntitySequence & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Select3D_SensitiveEntity & T);
		%feature("autodoc", "	:param S:
	:type S: Select3D_SensitiveEntitySequence &
	:rtype: None
") Prepend;
		void Prepend (Select3D_SensitiveEntitySequence & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Select3D_SensitiveEntity &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Select3D_SensitiveEntity & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Select3D_SensitiveEntitySequence &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Select3D_SensitiveEntitySequence & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Select3D_SensitiveEntity &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Select3D_SensitiveEntity & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Select3D_SensitiveEntitySequence &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Select3D_SensitiveEntitySequence & S);
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") First;
		const Handle_Select3D_SensitiveEntity & First ();
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") Last;
		const Handle_Select3D_SensitiveEntity & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Select3D_SensitiveEntitySequence &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Select3D_SensitiveEntitySequence & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Select3D_SensitiveEntity
") Value;
		const Handle_Select3D_SensitiveEntity & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Select3D_SensitiveEntity & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Select3D_SensitiveEntity
") ChangeValue;
		Handle_Select3D_SensitiveEntity & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Select3D_SensitiveEntitySequence::~Select3D_SensitiveEntitySequence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_SensitiveEntitySequence {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Select3D_SequenceNodeOfSensitiveEntitySequence;
class Select3D_SequenceNodeOfSensitiveEntitySequence : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Select3D_SensitiveEntity &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Select3D_SequenceNodeOfSensitiveEntitySequence;
		 Select3D_SequenceNodeOfSensitiveEntitySequence (const Handle_Select3D_SensitiveEntity & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") Value;
		Handle_Select3D_SensitiveEntity & Value ();
};


%feature("shadow") Select3D_SequenceNodeOfSensitiveEntitySequence::~Select3D_SequenceNodeOfSensitiveEntitySequence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_SequenceNodeOfSensitiveEntitySequence {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Select3D_SequenceNodeOfSensitiveEntitySequence {
	Handle_Select3D_SequenceNodeOfSensitiveEntitySequence GetHandle() {
	return *(Handle_Select3D_SequenceNodeOfSensitiveEntitySequence*) &$self;
	}
};

%nodefaultctor Handle_Select3D_SequenceNodeOfSensitiveEntitySequence;
class Handle_Select3D_SequenceNodeOfSensitiveEntitySequence : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Select3D_SequenceNodeOfSensitiveEntitySequence();
        Handle_Select3D_SequenceNodeOfSensitiveEntitySequence(const Handle_Select3D_SequenceNodeOfSensitiveEntitySequence &aHandle);
        Handle_Select3D_SequenceNodeOfSensitiveEntitySequence(const Select3D_SequenceNodeOfSensitiveEntitySequence *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SequenceNodeOfSensitiveEntitySequence DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SequenceNodeOfSensitiveEntitySequence {
    Select3D_SequenceNodeOfSensitiveEntitySequence* GetObject() {
    return (Select3D_SequenceNodeOfSensitiveEntitySequence*)$self->Access();
    }
};
%feature("shadow") Handle_Select3D_SequenceNodeOfSensitiveEntitySequence::~Handle_Select3D_SequenceNodeOfSensitiveEntitySequence %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Select3D_SequenceNodeOfSensitiveEntitySequence {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Select3D_SensitiveBox;
class Select3D_SensitiveBox : public Select3D_SensitiveEntity {
	public:
		%feature("autodoc", "	* Constructs a sensitive box object defined by the owner OwnerId, and the bounding box BoundingBox.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param BoundingBox:
	:type BoundingBox: Bnd_Box &
	:rtype: None
") Select3D_SensitiveBox;
		 Select3D_SensitiveBox (const Handle_SelectBasics_EntityOwner & OwnerId,const Bnd_Box & BoundingBox);
		%feature("autodoc", "	* Constructs a sensitive box object defined by the owner OwnerId, and the coordinates Xmin, YMin, ZMin, XMax, YMax, ZMax. Xmin, YMin and ZMin define the minimum point in the front lower left hand corner of the box, and XMax, YMax and ZMax define the maximum point in the back upper right hand corner of the box.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param ZMin:
	:type ZMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param ZMax:
	:type ZMax: float
	:rtype: None
") Select3D_SensitiveBox;
		 Select3D_SensitiveBox (const Handle_SelectBasics_EntityOwner & OwnerId,const Standard_Real XMin,const Standard_Real YMin,const Standard_Real ZMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real ZMax);
		%feature("autodoc", "	* projection of the sensitive primitive in order to get 2D boxes for the Sort Algorithm

	:param aProjector:
	:type aProjector: Handle_Select3D_Projector &
	:rtype: None
") Project;
		void Project (const Handle_Select3D_Projector & aProjector);
		%feature("autodoc", "	* gives the 2D boxes which represent the Box in the selection process...

	:param boxes:
	:type boxes: SelectBasics_ListOfBox2d &
	:rtype: None
") Areas;
		void Areas (SelectBasics_ListOfBox2d & boxes);
		%feature("autodoc", "	:param aLocation:
	:type aLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param XMin:
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
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "	:param EyeLine:
	:type EyeLine: gp_Lin
	:rtype: float
") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & EyeLine);
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("autodoc", "	* Returns the sensitive 3D box used at the time of construction.

	:rtype: Bnd_Box
") Box;
		const Bnd_Box & Box ();
};


%feature("shadow") Select3D_SensitiveBox::~Select3D_SensitiveBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_SensitiveBox {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Select3D_SensitiveBox {
	Handle_Select3D_SensitiveBox GetHandle() {
	return *(Handle_Select3D_SensitiveBox*) &$self;
	}
};

%nodefaultctor Handle_Select3D_SensitiveBox;
class Handle_Select3D_SensitiveBox : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitiveBox();
        Handle_Select3D_SensitiveBox(const Handle_Select3D_SensitiveBox &aHandle);
        Handle_Select3D_SensitiveBox(const Select3D_SensitiveBox *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveBox DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveBox {
    Select3D_SensitiveBox* GetObject() {
    return (Select3D_SensitiveBox*)$self->Access();
    }
};
%feature("shadow") Handle_Select3D_SensitiveBox::~Handle_Select3D_SensitiveBox %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Select3D_SensitiveBox {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Select3D_SensitiveGroup;
class Select3D_SensitiveGroup : public Select3D_SensitiveEntity {
	public:
		%feature("autodoc", "	* Constructs an empty sensitive group object. This is a set of sensitive 3D entities. The sensitive entities will be defined using the function Add to fill the entity owner OwnerId. If MatchAll is false, nothing can be added.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param MatchAll: default value is Standard_True
	:type MatchAll: bool
	:rtype: None
") Select3D_SensitiveGroup;
		 Select3D_SensitiveGroup (const Handle_SelectBasics_EntityOwner & OwnerId,const Standard_Boolean MatchAll = Standard_True);
		%feature("autodoc", "	* Constructs a sensitive group object defined by the list TheList and the entity owner OwnerId. If MatchAll is false, nothing is done.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param TheList:
	:type TheList: Select3D_ListOfSensitive &
	:param MatchAll: default value is Standard_True
	:type MatchAll: bool
	:rtype: None
") Select3D_SensitiveGroup;
		 Select3D_SensitiveGroup (const Handle_SelectBasics_EntityOwner & OwnerId,Select3D_ListOfSensitive & TheList,const Standard_Boolean MatchAll = Standard_True);
		%feature("autodoc", "	* Adds the list of sensitive entities LL to the empty sensitive group object created at construction time.

	:param LL:
	:type LL: Select3D_ListOfSensitive &
	:rtype: None
") Add;
		void Add (Select3D_ListOfSensitive & LL);
		%feature("autodoc", "	* Adds the sensitive entity aSensitive to the non-empty sensitive group object created at construction time.

	:param aSensitive:
	:type aSensitive: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Add;
		void Add (const Handle_Select3D_SensitiveEntity & aSensitive);
		%feature("autodoc", "	:param aSensitive:
	:type aSensitive: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Remove;
		void Remove (const Handle_Select3D_SensitiveEntity & aSensitive);
		%feature("autodoc", "	* Removes all sensitive entities from the list used at the time of construction, or added using the function Add.

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Returns true if the sensitive entity aSensitive is in the list used at the time of construction, or added using the function Add.

	:param aSensitive:
	:type aSensitive: Handle_Select3D_SensitiveEntity &
	:rtype: bool
") IsIn;
		Standard_Boolean IsIn (const Handle_Select3D_SensitiveEntity & aSensitive);
		%feature("autodoc", "	* Sets the requirement that all sensitive entities in the list used at the time of construction, or added using the function Add must be matched.

	:param MustMatchAllEntities:
	:type MustMatchAllEntities: bool
	:rtype: None
") Set;
		void Set (const Standard_Boolean MustMatchAllEntities);
		%feature("autodoc", "	* Returns true if all sensitive entities in the list used at the time of construction, or added using the function Add must be matched.

	:rtype: bool
") MustMatchAll;
		Standard_Boolean MustMatchAll ();
		%feature("autodoc", "	* projection of the sensitive primitive in order to get 2D boxes for the Sort Algorithm

	:param aProjector:
	:type aProjector: Handle_Select3D_Projector &
	:rtype: None
") Project;
		void Project (const Handle_Select3D_Projector & aProjector);
		%feature("autodoc", "	* gives the 2D boxes which represent the segment in the selection process...

	:param boxes:
	:type boxes: SelectBasics_ListOfBox2d &
	:rtype: None
") Areas;
		void Areas (SelectBasics_ListOfBox2d & boxes);
		%feature("autodoc", "	:rtype: int
") MaxBoxes;
		Standard_Integer MaxBoxes ();
		%feature("autodoc", "	:param aLocation:
	:type aLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("autodoc", "	* propagation of location on all the sensitive inside...

	:param aLoc:
	:type aLoc: TopLoc_Location &
	:rtype: None
") SetLocation;
		void SetLocation (const TopLoc_Location & aLoc);
		%feature("autodoc", "	* propagation of location on all the sensitive inside...

	:rtype: None
") ResetLocation;
		void ResetLocation ();
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param XMin:
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
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "	* Sets the owner for all entities in group

	:param TheOwnerId:
	:type TheOwnerId: Handle_SelectBasics_EntityOwner &
	:rtype: None
") Set;
		void Set (const Handle_SelectBasics_EntityOwner & TheOwnerId);
		%feature("autodoc", "	* Gets group content

	:rtype: Select3D_ListOfSensitive
") GetEntities;
		const Select3D_ListOfSensitive & GetEntities ();
};


%feature("shadow") Select3D_SensitiveGroup::~Select3D_SensitiveGroup %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_SensitiveGroup {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Select3D_SensitiveGroup {
	Handle_Select3D_SensitiveGroup GetHandle() {
	return *(Handle_Select3D_SensitiveGroup*) &$self;
	}
};

%nodefaultctor Handle_Select3D_SensitiveGroup;
class Handle_Select3D_SensitiveGroup : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitiveGroup();
        Handle_Select3D_SensitiveGroup(const Handle_Select3D_SensitiveGroup &aHandle);
        Handle_Select3D_SensitiveGroup(const Select3D_SensitiveGroup *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveGroup DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveGroup {
    Select3D_SensitiveGroup* GetObject() {
    return (Select3D_SensitiveGroup*)$self->Access();
    }
};
%feature("shadow") Handle_Select3D_SensitiveGroup::~Handle_Select3D_SensitiveGroup %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Select3D_SensitiveGroup {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Select3D_SensitivePoint;
class Select3D_SensitivePoint : public Select3D_SensitiveEntity {
	public:
		%feature("autodoc", "	* Constructs a sensitive point object defined by the owner OwnerId and the point Point.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param Point:
	:type Point: gp_Pnt
	:rtype: None
") Select3D_SensitivePoint;
		 Select3D_SensitivePoint (const Handle_SelectBasics_EntityOwner & OwnerId,const gp_Pnt & Point);
		%feature("autodoc", "	* //!Converts the stored 3D point into a 2D point according  to <aProjector> ; this method is called by the selection Manager.

	:param aProjector:
	:type aProjector: Handle_Select3D_Projector &
	:rtype: None
") Project;
		void Project (const Handle_Select3D_Projector & aProjector);
		%feature("autodoc", "	* stores in <aresult> the 2D sensitive box which represents the point area in the selection process.

	:param aresult:
	:type aresult: SelectBasics_ListOfBox2d &
	:rtype: None
") Areas;
		void Areas (SelectBasics_ListOfBox2d & aresult);
		%feature("autodoc", "	:param aLocation:
	:type aLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param XMin:
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
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "	:param EyeLine:
	:type EyeLine: gp_Lin
	:rtype: float
") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & EyeLine);
		%feature("autodoc", "	* Returns the point used at the time of construction.

	:rtype: gp_Pnt
") Point;
		gp_Pnt Point ();
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
};


%feature("shadow") Select3D_SensitivePoint::~Select3D_SensitivePoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_SensitivePoint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Select3D_SensitivePoint {
	Handle_Select3D_SensitivePoint GetHandle() {
	return *(Handle_Select3D_SensitivePoint*) &$self;
	}
};

%nodefaultctor Handle_Select3D_SensitivePoint;
class Handle_Select3D_SensitivePoint : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitivePoint();
        Handle_Select3D_SensitivePoint(const Handle_Select3D_SensitivePoint &aHandle);
        Handle_Select3D_SensitivePoint(const Select3D_SensitivePoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitivePoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitivePoint {
    Select3D_SensitivePoint* GetObject() {
    return (Select3D_SensitivePoint*)$self->Access();
    }
};
%feature("shadow") Handle_Select3D_SensitivePoint::~Handle_Select3D_SensitivePoint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Select3D_SensitivePoint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Select3D_SensitivePoly;
class Select3D_SensitivePoly : public Select3D_SensitiveEntity {
	public:
		%feature("autodoc", "	* projection of the sensitive primitive in order to get 2D boxes for the Sort Algorithm

	:param aProjector:
	:type aProjector: Handle_Select3D_Projector &
	:rtype: void
") Project;
		virtual void Project (const Handle_Select3D_Projector & aProjector);
		%feature("autodoc", "	* stores in <boxes> the 2D Boxes which represent the sensitive face in the selection algorithm.

	:param boxes:
	:type boxes: SelectBasics_ListOfBox2d &
	:rtype: None
") Areas;
		void Areas (SelectBasics_ListOfBox2d & boxes);
		%feature("autodoc", "	* Returns the 3D points of the array used at construction time.

	:param theHArrayOfPnt:
	:type theHArrayOfPnt: Handle_TColgp_HArray1OfPnt
	:rtype: None
") Points3D;
		void Points3D (Handle_TColgp_HArray1OfPnt & theHArrayOfPnt);
		%feature("autodoc", "	* Returns the 2D points of the array used at construction time.

	:param theArrayOfPnt2d:
	:type theArrayOfPnt2d: TColgp_Array1OfPnt2d
	:rtype: None
") Points2D;
		void Points2D (TColgp_Array1OfPnt2d & theArrayOfPnt2d);
};


%feature("shadow") Select3D_SensitivePoly::~Select3D_SensitivePoly %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_SensitivePoly {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Select3D_SensitivePoly {
	Handle_Select3D_SensitivePoly GetHandle() {
	return *(Handle_Select3D_SensitivePoly*) &$self;
	}
};

%nodefaultctor Handle_Select3D_SensitivePoly;
class Handle_Select3D_SensitivePoly : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitivePoly();
        Handle_Select3D_SensitivePoly(const Handle_Select3D_SensitivePoly &aHandle);
        Handle_Select3D_SensitivePoly(const Select3D_SensitivePoly *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitivePoly DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitivePoly {
    Select3D_SensitivePoly* GetObject() {
    return (Select3D_SensitivePoly*)$self->Access();
    }
};
%feature("shadow") Handle_Select3D_SensitivePoly::~Handle_Select3D_SensitivePoly %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Select3D_SensitivePoly {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Select3D_SensitiveSegment;
class Select3D_SensitiveSegment : public Select3D_SensitiveEntity {
	public:
		%feature("autodoc", "	* Constructs the sensitive segment object defined by the owner OwnerId, the points FirstP, LastP and the maximum number of sensitive bounding boxes MaxRect.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param FirstP:
	:type FirstP: gp_Pnt
	:param LastP:
	:type LastP: gp_Pnt
	:param MaxRect: default value is 1
	:type MaxRect: Standard_Integer
	:rtype: None
") Select3D_SensitiveSegment;
		 Select3D_SensitiveSegment (const Handle_SelectBasics_EntityOwner & OwnerId,const gp_Pnt & FirstP,const gp_Pnt & LastP,const Standard_Integer MaxRect = 1);
		%feature("autodoc", "	* Sets the maximum number of sensitive rectangles MaxRect.

	:param MaxRect:
	:type MaxRect: Standard_Integer
	:rtype: None
") Set;
		void Set (const Standard_Integer MaxRect);
		%feature("autodoc", "	* changes the start Point of the Segment;

	:param aPt:
	:type aPt: gp_Pnt
	:rtype: None
") StartPoint;
		void StartPoint (const gp_Pnt & aPt);
		%feature("autodoc", "	* changes the end point of the segment

	:param aPt:
	:type aPt: gp_Pnt
	:rtype: None
") EndPoint;
		void EndPoint (const gp_Pnt & aPt);
		%feature("autodoc", "	* gives the 3D start Point of the Segment

	:rtype: gp_Pnt
") StartPoint;
		gp_Pnt StartPoint ();
		%feature("autodoc", "	* gives the 3D End Point of the Segment

	:rtype: gp_Pnt
") EndPoint;
		gp_Pnt EndPoint ();
		%feature("autodoc", "	* gives the 3D start Point of the Segment

	:rtype: gp_Pnt2d
") StartPoint2d;
		gp_Pnt2d StartPoint2d ();
		%feature("autodoc", "	* gives the 3D End Point of the Segment

	:rtype: gp_Pnt2d
") EndPoint2d;
		gp_Pnt2d EndPoint2d ();
		%feature("autodoc", "	* projection of the sensitive primitive in order to get 2D boxes for the Sort Algorithm

	:param aProjector:
	:type aProjector: Handle_Select3D_Projector &
	:rtype: void
") Project;
		virtual void Project (const Handle_Select3D_Projector & aProjector);
		%feature("autodoc", "	* gives the 2D boxes which represent the segment in the selection process...

	:param boxes:
	:type boxes: SelectBasics_ListOfBox2d &
	:rtype: None
") Areas;
		void Areas (SelectBasics_ListOfBox2d & boxes);
		%feature("autodoc", "	:param aLocation:
	:type aLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param XMin:
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
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "	:param EyeLine:
	:type EyeLine: gp_Lin
	:rtype: float
") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & EyeLine);
		%feature("autodoc", "	* //!returns <mymaxrect>

	:rtype: int
") MaxBoxes;
		Standard_Integer MaxBoxes ();
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
};


%feature("shadow") Select3D_SensitiveSegment::~Select3D_SensitiveSegment %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_SensitiveSegment {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Select3D_SensitiveSegment {
	Handle_Select3D_SensitiveSegment GetHandle() {
	return *(Handle_Select3D_SensitiveSegment*) &$self;
	}
};

%nodefaultctor Handle_Select3D_SensitiveSegment;
class Handle_Select3D_SensitiveSegment : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitiveSegment();
        Handle_Select3D_SensitiveSegment(const Handle_Select3D_SensitiveSegment &aHandle);
        Handle_Select3D_SensitiveSegment(const Select3D_SensitiveSegment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveSegment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveSegment {
    Select3D_SensitiveSegment* GetObject() {
    return (Select3D_SensitiveSegment*)$self->Access();
    }
};
%feature("shadow") Handle_Select3D_SensitiveSegment::~Handle_Select3D_SensitiveSegment %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Select3D_SensitiveSegment {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Select3D_SensitiveWire;
class Select3D_SensitiveWire : public Select3D_SensitiveEntity {
	public:
		%feature("autodoc", "	* Constructs a sensitive wire object defined by the owner OwnerId, and the maximum number of sensitive rectangles MaxRect.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param MaxRect: default value is 1
	:type MaxRect: Standard_Integer
	:rtype: None
") Select3D_SensitiveWire;
		 Select3D_SensitiveWire (const Handle_SelectBasics_EntityOwner & OwnerId,const Standard_Integer MaxRect = 1);
		%feature("autodoc", "	* Adds the sensitive entity aSensitive to this framework.

	:param aSensitive:
	:type aSensitive: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Add;
		void Add (const Handle_Select3D_SensitiveEntity & aSensitive);
		%feature("autodoc", "	* projection of the sensitive primitive in order to get 2D boxes for the Sort Algorithm

	:param aProjector:
	:type aProjector: Handle_Select3D_Projector &
	:rtype: None
") Project;
		void Project (const Handle_Select3D_Projector & aProjector);
		%feature("autodoc", "	* gives the 2D boxes which represent the segment in the selection process...

	:param boxes:
	:type boxes: SelectBasics_ListOfBox2d &
	:rtype: None
") Areas;
		void Areas (SelectBasics_ListOfBox2d & boxes);
		%feature("autodoc", "	:param aLocation:
	:type aLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("autodoc", "	* returns the sensitive edges stored in this wire

	:param theEdges:
	:type theEdges: Select3D_SensitiveEntitySequence &
	:rtype: None
") GetEdges;
		void GetEdges (Select3D_SensitiveEntitySequence & theEdges);
		%feature("autodoc", "	* propagation of location on all the sensitive inside...

	:param aLoc:
	:type aLoc: TopLoc_Location &
	:rtype: None
") SetLocation;
		void SetLocation (const TopLoc_Location & aLoc);
		%feature("autodoc", "	* propagation of location on all the sensitive inside...

	:rtype: None
") ResetLocation;
		void ResetLocation ();
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param XMin:
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
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "	* //!returns <mymaxrect>

	:rtype: int
") MaxBoxes;
		Standard_Integer MaxBoxes ();
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("autodoc", "	* Sets the owner for all entities in wire

	:param TheOwnerId:
	:type TheOwnerId: Handle_SelectBasics_EntityOwner &
	:rtype: None
") Set;
		void Set (const Handle_SelectBasics_EntityOwner & TheOwnerId);
		%feature("autodoc", "	* //!returns <mymaxrect>

	:rtype: Handle_Select3D_SensitiveEntity
") GetLastDetected;
		Handle_Select3D_SensitiveEntity GetLastDetected ();
};


%feature("shadow") Select3D_SensitiveWire::~Select3D_SensitiveWire %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_SensitiveWire {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Select3D_SensitiveWire {
	Handle_Select3D_SensitiveWire GetHandle() {
	return *(Handle_Select3D_SensitiveWire*) &$self;
	}
};

%nodefaultctor Handle_Select3D_SensitiveWire;
class Handle_Select3D_SensitiveWire : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitiveWire();
        Handle_Select3D_SensitiveWire(const Handle_Select3D_SensitiveWire &aHandle);
        Handle_Select3D_SensitiveWire(const Select3D_SensitiveWire *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveWire DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveWire {
    Select3D_SensitiveWire* GetObject() {
    return (Select3D_SensitiveWire*)$self->Access();
    }
};
%feature("shadow") Handle_Select3D_SensitiveWire::~Handle_Select3D_SensitiveWire %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Select3D_SensitiveWire {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Select3D_SensitiveCircle;
class Select3D_SensitiveCircle : public Select3D_SensitivePoly {
	public:
		%feature("autodoc", "	* Constructs the sensitive circle object defined by the owner OwnerId, the circle Circle, the Boolean FilledCircle and the number of points NbOfPoints.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param TheCircle:
	:type TheCircle: Handle_Geom_Circle &
	:param FilledCircle: default value is Standard_False
	:type FilledCircle: bool
	:param NbOfPoints: default value is 6
	:type NbOfPoints: Standard_Integer
	:rtype: None
") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_Geom_Circle & TheCircle,const Standard_Boolean FilledCircle = Standard_False,const Standard_Integer NbOfPoints = 6);
		%feature("autodoc", "	* Constructs the sensitive arc object defined by the owner OwnerId, the circle Circle, the parameters u1 and u2, the Boolean FilledCircle and the number of points NbOfPoints. u1 and u2 define the first and last points of the arc on Circle.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param TheCircle:
	:type TheCircle: Handle_Geom_Circle &
	:param u1:
	:type u1: float
	:param u2:
	:type u2: float
	:param FilledCircle: default value is Standard_False
	:type FilledCircle: bool
	:param NbOfPoints: default value is 6
	:type NbOfPoints: Standard_Integer
	:rtype: None
") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_Geom_Circle & TheCircle,const Standard_Real u1,const Standard_Real u2,const Standard_Boolean FilledCircle = Standard_False,const Standard_Integer NbOfPoints = 6);
		%feature("autodoc", "	* Constructs the sensitive circle object defined by the owner OwnerId, the array of triangles apolyg3d, and the Boolean FilledCircle. apolyg3d is an array of consecutive triangles on the circle. The triangle i+1 lies on the intersection of the tangents to the circle of i and i+2. Note, that the first point of apolyg3d must be equal to the last point of apolyg3d.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param apolyg3d:
	:type apolyg3d: Handle_TColgp_HArray1OfPnt
	:param FilledCircle: default value is Standard_False
	:type FilledCircle: bool
	:rtype: None
") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_TColgp_HArray1OfPnt & apolyg3d,const Standard_Boolean FilledCircle = Standard_False);
		%feature("autodoc", "	* Constructs the sensitive circle object defined by the owner OwnerId, the array of points apolyg3d, and the Boolean FilledCircle. If the length of apolyg3d is more then 1, the first point of apolyg3d must be equal to the last point of apolyg3d.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param apolyg3d:
	:type apolyg3d: TColgp_Array1OfPnt
	:param FilledCircle: default value is Standard_False
	:type FilledCircle: bool
	:rtype: None
") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const Handle_SelectBasics_EntityOwner & OwnerId,const TColgp_Array1OfPnt & apolyg3d,const Standard_Boolean FilledCircle = Standard_False);
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param XMin:
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
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "	* Compute depth of sensitive circle for the detected sub-part. @param thePickLine [in] the picking line. @param theDetectedIndex [in] index of the detected sub-part. returns depth on the picking line.

	:param thePickLine:
	:type thePickLine: gp_Lin
	:param theDetectedIndex:
	:type theDetectedIndex: Standard_Integer
	:rtype: float
") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & thePickLine,const Standard_Integer theDetectedIndex);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer &
	:param Up:
	:type Up: Standard_Integer &
	:rtype: None
") ArrayBounds;
		void ArrayBounds (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param rank:
	:type rank: Standard_Integer
	:rtype: gp_Pnt
") GetPoint3d;
		gp_Pnt GetPoint3d (const Standard_Integer rank);
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("autodoc", "	* Returns the copy of this.

	:param theLocation:
	:type theLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & theLocation);
		%feature("autodoc", "	:param aProjector:
	:type aProjector: Handle_Select3D_Projector &
	:rtype: void
") Project;
		virtual void Project (const Handle_Select3D_Projector & aProjector);
};


%feature("shadow") Select3D_SensitiveCircle::~Select3D_SensitiveCircle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_SensitiveCircle {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Select3D_SensitiveCircle {
	Handle_Select3D_SensitiveCircle GetHandle() {
	return *(Handle_Select3D_SensitiveCircle*) &$self;
	}
};

%nodefaultctor Handle_Select3D_SensitiveCircle;
class Handle_Select3D_SensitiveCircle : public Handle_Select3D_SensitivePoly {

    public:
        // constructors
        Handle_Select3D_SensitiveCircle();
        Handle_Select3D_SensitiveCircle(const Handle_Select3D_SensitiveCircle &aHandle);
        Handle_Select3D_SensitiveCircle(const Select3D_SensitiveCircle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveCircle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveCircle {
    Select3D_SensitiveCircle* GetObject() {
    return (Select3D_SensitiveCircle*)$self->Access();
    }
};
%feature("shadow") Handle_Select3D_SensitiveCircle::~Handle_Select3D_SensitiveCircle %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Select3D_SensitiveCircle {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Select3D_SensitiveCurve;
class Select3D_SensitiveCurve : public Select3D_SensitivePoly {
	public:
		%feature("autodoc", "	* Constructs a sensitive curve object defined by the owner OwnerId, the curve TheCurve, and the maximum number of points on the curve: MaxPoints.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param TheCurve:
	:type TheCurve: Handle_Geom_Curve &
	:param MaxPoints: default value is 17
	:type MaxPoints: Standard_Integer
	:rtype: None
") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_Geom_Curve & TheCurve,const Standard_Integer MaxPoints = 17);
		%feature("autodoc", "	* Constructs a sensitive curve object defined by the owner OwnerId and the set of points ThePoints.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param ThePoints:
	:type ThePoints: Handle_TColgp_HArray1OfPnt
	:rtype: None
") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_TColgp_HArray1OfPnt & ThePoints);
		%feature("autodoc", "	* Creation of Sensitive Curve from Points. Warning : This Method should disappear in the next version...

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param ThePoints:
	:type ThePoints: TColgp_Array1OfPnt
	:rtype: None
") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve (const Handle_SelectBasics_EntityOwner & OwnerId,const TColgp_Array1OfPnt & ThePoints);
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param XMin:
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
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "	* Compute depth of sensitive circle for the detected sub-part. @param thePickLine [in] the picking line. @param theDetectedIndex [in] index of the detected sub-part. returns depth on the picking line.

	:param thePickLine:
	:type thePickLine: gp_Lin
	:param theDetectedIndex:
	:type theDetectedIndex: Standard_Integer
	:rtype: float
") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & thePickLine,const Standard_Integer theDetectedIndex);
		%feature("autodoc", "	* Gets index of last detected segment

	:rtype: int
") GetLastDetected;
		Standard_Integer GetLastDetected ();
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("autodoc", "	* Returns the copy of this

	:param theLocation:
	:type theLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & theLocation);
};


%feature("shadow") Select3D_SensitiveCurve::~Select3D_SensitiveCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_SensitiveCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Select3D_SensitiveCurve {
	Handle_Select3D_SensitiveCurve GetHandle() {
	return *(Handle_Select3D_SensitiveCurve*) &$self;
	}
};

%nodefaultctor Handle_Select3D_SensitiveCurve;
class Handle_Select3D_SensitiveCurve : public Handle_Select3D_SensitivePoly {

    public:
        // constructors
        Handle_Select3D_SensitiveCurve();
        Handle_Select3D_SensitiveCurve(const Handle_Select3D_SensitiveCurve &aHandle);
        Handle_Select3D_SensitiveCurve(const Select3D_SensitiveCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveCurve {
    Select3D_SensitiveCurve* GetObject() {
    return (Select3D_SensitiveCurve*)$self->Access();
    }
};
%feature("shadow") Handle_Select3D_SensitiveCurve::~Handle_Select3D_SensitiveCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Select3D_SensitiveCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Select3D_SensitiveFace;
class Select3D_SensitiveFace : public Select3D_SensitivePoly {
	public:
		%feature("autodoc", "	* Constructs a sensitive face object defined by the owner OwnerId, the array of points ThePoints, and the sensitivity type Sensitivity. The array of points is the outer polygon of the geometric face.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param ThePoints:
	:type ThePoints: TColgp_Array1OfPnt
	:param Sensitivity: default value is Select3D_TOS_INTERIOR
	:type Sensitivity: Select3D_TypeOfSensitivity
	:rtype: None
") Select3D_SensitiveFace;
		 Select3D_SensitiveFace (const Handle_SelectBasics_EntityOwner & OwnerId,const TColgp_Array1OfPnt & ThePoints,const Select3D_TypeOfSensitivity Sensitivity = Select3D_TOS_INTERIOR);
		%feature("autodoc", "	* Constructs a sensitive face object defined by the owner OwnerId, the array of points ThePoints, and the sensitivity type Sensitivity. The array of points is the outer polygon of the geometric face.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param ThePoints:
	:type ThePoints: Handle_TColgp_HArray1OfPnt
	:param Sensitivity: default value is Select3D_TOS_INTERIOR
	:type Sensitivity: Select3D_TypeOfSensitivity
	:rtype: None
") Select3D_SensitiveFace;
		 Select3D_SensitiveFace (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_TColgp_HArray1OfPnt & ThePoints,const Select3D_TypeOfSensitivity Sensitivity = Select3D_TOS_INTERIOR);
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param XMin:
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
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "	* Computes the depth values for all 3D points defining this face and returns the minimal value among them. If the 'minimal depth' approach is not suitable and gives wrong detection results in some particular case, a custom sensitive face class can redefine this method.

	:param thePickLine:
	:type thePickLine: gp_Lin
	:param theDepthMin:
	:type theDepthMin: float
	:param theDepthMax:
	:type theDepthMax: float
	:rtype: float
") ComputeDepth;
		virtual Standard_Real ComputeDepth (const gp_Lin & thePickLine,const Standard_Real theDepthMin,const Standard_Real theDepthMax);
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("autodoc", "	* Returns the copy of this

	:param theLocation:
	:type theLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & theLocation);
};


%feature("shadow") Select3D_SensitiveFace::~Select3D_SensitiveFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_SensitiveFace {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Select3D_SensitiveFace {
	Handle_Select3D_SensitiveFace GetHandle() {
	return *(Handle_Select3D_SensitiveFace*) &$self;
	}
};

%nodefaultctor Handle_Select3D_SensitiveFace;
class Handle_Select3D_SensitiveFace : public Handle_Select3D_SensitivePoly {

    public:
        // constructors
        Handle_Select3D_SensitiveFace();
        Handle_Select3D_SensitiveFace(const Handle_Select3D_SensitiveFace &aHandle);
        Handle_Select3D_SensitiveFace(const Select3D_SensitiveFace *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveFace DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveFace {
    Select3D_SensitiveFace* GetObject() {
    return (Select3D_SensitiveFace*)$self->Access();
    }
};
%feature("shadow") Handle_Select3D_SensitiveFace::~Handle_Select3D_SensitiveFace %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Select3D_SensitiveFace {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Select3D_SensitiveTriangle;
class Select3D_SensitiveTriangle : public Select3D_SensitivePoly {
	public:
		%feature("autodoc", "	* Constructs a sensitive triangle object defined by the owner OwnerId, the points P1, P2, P3, and the type of sensitivity Sensitivity.

	:param OwnerId:
	:type OwnerId: Handle_SelectBasics_EntityOwner &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:param Sensitivity: default value is Select3D_TOS_INTERIOR
	:type Sensitivity: Select3D_TypeOfSensitivity
	:rtype: None
") Select3D_SensitiveTriangle;
		 Select3D_SensitiveTriangle (const Handle_SelectBasics_EntityOwner & OwnerId,const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const Select3D_TypeOfSensitivity Sensitivity = Select3D_TOS_INTERIOR);
		%feature("autodoc", "	* Checks whether the sensitive entity matches the picking detection area (close to the picking line). For details please refer to base class declaration.

	:param thePickArgs:
	:type thePickArgs: SelectBasics_PickArgs &
	:param theMatchDMin:
	:type theMatchDMin: float &
	:param theMatchDepth:
	:type theMatchDepth: float &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param XMin:
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
		%feature("autodoc", "	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d &
	:param aTol:
	:type aTol: float
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "	:param EyeLine:
	:type EyeLine: gp_Lin
	:rtype: float
") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & EyeLine);
		%feature("autodoc", "	* Returns the 3D points P1, P2, P3 used at the time of construction.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:rtype: None
") Points3D;
		void Points3D (gp_Pnt & P1,gp_Pnt & P2,gp_Pnt & P3);
		%feature("autodoc", "	* Returns the center point of the sensitive triangle created at construction time.

	:rtype: gp_Pnt
") Center3D;
		gp_Pnt Center3D ();
		%feature("autodoc", "	* WARNING : the returned Values are the original values without the stored location (if there's one). To get the genuine value, One must apply this location (Method Location() )

	:rtype: gp_XY
") Center2D;
		gp_XY Center2D ();
		%feature("autodoc", "	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param aTol:
	:type aTol: float
	:param Dmin:
	:type Dmin: float &
	:rtype: int
") Status;
		Standard_Integer Status (const Standard_Real X,const Standard_Real Y,const Standard_Real aTol,Standard_Real &OutValue);
		%feature("autodoc", "	* Dmin gives the distance between the cdg and aPoint return

	:param p0:
	:type p0: gp_XY
	:param p1:
	:type p1: gp_XY
	:param p2:
	:type p2: gp_XY
	:param aPoint:
	:type aPoint: gp_XY
	:param aTol:
	:type aTol: float
	:param Dmin:
	:type Dmin: float &
	:rtype: int
") Status;
		static Standard_Integer Status (const gp_XY & p0,const gp_XY & p1,const gp_XY & p2,const gp_XY & aPoint,const Standard_Real aTol,Standard_Real &OutValue);
		%feature("autodoc", "	:param S:
	:type S: Standard_OStream &
	:param FullDump: default value is Standard_True
	:type FullDump: bool
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("autodoc", "	* Returns the copy of this

	:param theLocation:
	:type theLocation: TopLoc_Location &
	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & theLocation);
};


%feature("shadow") Select3D_SensitiveTriangle::~Select3D_SensitiveTriangle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Select3D_SensitiveTriangle {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Select3D_SensitiveTriangle {
	Handle_Select3D_SensitiveTriangle GetHandle() {
	return *(Handle_Select3D_SensitiveTriangle*) &$self;
	}
};

%nodefaultctor Handle_Select3D_SensitiveTriangle;
class Handle_Select3D_SensitiveTriangle : public Handle_Select3D_SensitivePoly {

    public:
        // constructors
        Handle_Select3D_SensitiveTriangle();
        Handle_Select3D_SensitiveTriangle(const Handle_Select3D_SensitiveTriangle &aHandle);
        Handle_Select3D_SensitiveTriangle(const Select3D_SensitiveTriangle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveTriangle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveTriangle {
    Select3D_SensitiveTriangle* GetObject() {
    return (Select3D_SensitiveTriangle*)$self->Access();
    }
};
%feature("shadow") Handle_Select3D_SensitiveTriangle::~Handle_Select3D_SensitiveTriangle %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Select3D_SensitiveTriangle {
    void _kill_pointed() {
        delete $self;
    }
};

