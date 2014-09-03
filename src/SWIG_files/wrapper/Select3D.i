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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Select3D_Box2d;
		 Select3D_Box2d ();
		%feature("autodoc", "Args:
	theBox(Bnd_Box2d)

Returns:
	None

No detailed docstring for this function.") Select3D_Box2d;
		 Select3D_Box2d (const Bnd_Box2d & theBox);
		%feature("autodoc", "Args:
	None
Returns:
	inline

No detailed docstring for this function.") operatorBnd_Box2d;
		inline operator Bnd_Box2d ();
		%feature("autodoc", "Args:
	theBox(Bnd_Box2d)

Returns:
	inline Select3D_Box2d

No detailed docstring for this function.") operator=;
		inline Select3D_Box2d operator = (const Bnd_Box2d & theBox);
		%feature("autodoc", "Args:
	thePnt(gp_Pnt2d)

Returns:
	inline void

No detailed docstring for this function.") Update;
		inline void Update (const gp_Pnt2d & thePnt);
		%feature("autodoc", "Args:
	None
Returns:
	inline void

No detailed docstring for this function.") SetVoid;
		inline void SetVoid ();
		%feature("autodoc", "Args:
	None
Returns:
	inline Standard_Boolean

No detailed docstring for this function.") IsVoid;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Select3D_ListIteratorOfListOfSensitive;
		 Select3D_ListIteratorOfListOfSensitive ();
		%feature("autodoc", "Args:
	L(Select3D_ListOfSensitive)

Returns:
	None

No detailed docstring for this function.") Select3D_ListIteratorOfListOfSensitive;
		 Select3D_ListIteratorOfListOfSensitive (const Select3D_ListOfSensitive & L);
		%feature("autodoc", "Args:
	L(Select3D_ListOfSensitive)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Select3D_ListOfSensitive & L);
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
	Handle_Select3D_SensitiveEntity

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Select3D_ListIteratorOfListOfSensitiveTriangle;
		 Select3D_ListIteratorOfListOfSensitiveTriangle ();
		%feature("autodoc", "Args:
	L(Select3D_ListOfSensitiveTriangle)

Returns:
	None

No detailed docstring for this function.") Select3D_ListIteratorOfListOfSensitiveTriangle;
		 Select3D_ListIteratorOfListOfSensitiveTriangle (const Select3D_ListOfSensitiveTriangle & L);
		%feature("autodoc", "Args:
	L(Select3D_ListOfSensitiveTriangle)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Select3D_ListOfSensitiveTriangle & L);
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
	Handle_Select3D_SensitiveTriangle

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_Select3D_SensitiveEntity)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Select3D_ListNodeOfListOfSensitive;
		 Select3D_ListNodeOfListOfSensitive (const Handle_Select3D_SensitiveEntity & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Select3D_SensitiveEntity

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Handle_Select3D_SensitiveTriangle)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Select3D_ListNodeOfListOfSensitiveTriangle;
		 Select3D_ListNodeOfListOfSensitiveTriangle (const Handle_Select3D_SensitiveTriangle & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Select3D_SensitiveTriangle

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Select3D_ListOfSensitive;
		 Select3D_ListOfSensitive ();
		%feature("autodoc", "Args:
	Other(Select3D_ListOfSensitive)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const Select3D_ListOfSensitive & Other);
		%feature("autodoc", "Args:
	Other(Select3D_ListOfSensitive)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const Select3D_ListOfSensitive & Other);
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
	I(Handle_Select3D_SensitiveEntity)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Select3D_SensitiveEntity & I);
		%feature("autodoc", "Args:
	I(Handle_Select3D_SensitiveEntity)
	theIt(Select3D_ListIteratorOfListOfSensitive)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Select3D_SensitiveEntity & I,Select3D_ListIteratorOfListOfSensitive & theIt);
		%feature("autodoc", "Args:
	Other(Select3D_ListOfSensitive)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Select3D_ListOfSensitive & Other);
		%feature("autodoc", "Args:
	I(Handle_Select3D_SensitiveEntity)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Select3D_SensitiveEntity & I);
		%feature("autodoc", "Args:
	I(Handle_Select3D_SensitiveEntity)
	theIt(Select3D_ListIteratorOfListOfSensitive)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Select3D_SensitiveEntity & I,Select3D_ListIteratorOfListOfSensitive & theIt);
		%feature("autodoc", "Args:
	Other(Select3D_ListOfSensitive)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Select3D_ListOfSensitive & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Select3D_SensitiveEntity

No detailed docstring for this function.") First;
		Handle_Select3D_SensitiveEntity & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Select3D_SensitiveEntity

No detailed docstring for this function.") Last;
		Handle_Select3D_SensitiveEntity & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(Select3D_ListIteratorOfListOfSensitive)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (Select3D_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "Args:
	I(Handle_Select3D_SensitiveEntity)
	It(Select3D_ListIteratorOfListOfSensitive)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_Select3D_SensitiveEntity & I,Select3D_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "Args:
	Other(Select3D_ListOfSensitive)
	It(Select3D_ListIteratorOfListOfSensitive)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (Select3D_ListOfSensitive & Other,Select3D_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "Args:
	I(Handle_Select3D_SensitiveEntity)
	It(Select3D_ListIteratorOfListOfSensitive)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_Select3D_SensitiveEntity & I,Select3D_ListIteratorOfListOfSensitive & It);
		%feature("autodoc", "Args:
	Other(Select3D_ListOfSensitive)
	It(Select3D_ListIteratorOfListOfSensitive)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Select3D_ListOfSensitiveTriangle;
		 Select3D_ListOfSensitiveTriangle ();
		%feature("autodoc", "Args:
	Other(Select3D_ListOfSensitiveTriangle)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const Select3D_ListOfSensitiveTriangle & Other);
		%feature("autodoc", "Args:
	Other(Select3D_ListOfSensitiveTriangle)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const Select3D_ListOfSensitiveTriangle & Other);
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
	I(Handle_Select3D_SensitiveTriangle)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Select3D_SensitiveTriangle & I);
		%feature("autodoc", "Args:
	I(Handle_Select3D_SensitiveTriangle)
	theIt(Select3D_ListIteratorOfListOfSensitiveTriangle)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Select3D_SensitiveTriangle & I,Select3D_ListIteratorOfListOfSensitiveTriangle & theIt);
		%feature("autodoc", "Args:
	Other(Select3D_ListOfSensitiveTriangle)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Select3D_ListOfSensitiveTriangle & Other);
		%feature("autodoc", "Args:
	I(Handle_Select3D_SensitiveTriangle)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Select3D_SensitiveTriangle & I);
		%feature("autodoc", "Args:
	I(Handle_Select3D_SensitiveTriangle)
	theIt(Select3D_ListIteratorOfListOfSensitiveTriangle)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Select3D_SensitiveTriangle & I,Select3D_ListIteratorOfListOfSensitiveTriangle & theIt);
		%feature("autodoc", "Args:
	Other(Select3D_ListOfSensitiveTriangle)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Select3D_ListOfSensitiveTriangle & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Select3D_SensitiveTriangle

No detailed docstring for this function.") First;
		Handle_Select3D_SensitiveTriangle & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Select3D_SensitiveTriangle

No detailed docstring for this function.") Last;
		Handle_Select3D_SensitiveTriangle & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(Select3D_ListIteratorOfListOfSensitiveTriangle)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (Select3D_ListIteratorOfListOfSensitiveTriangle & It);
		%feature("autodoc", "Args:
	I(Handle_Select3D_SensitiveTriangle)
	It(Select3D_ListIteratorOfListOfSensitiveTriangle)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_Select3D_SensitiveTriangle & I,Select3D_ListIteratorOfListOfSensitiveTriangle & It);
		%feature("autodoc", "Args:
	Other(Select3D_ListOfSensitiveTriangle)
	It(Select3D_ListIteratorOfListOfSensitiveTriangle)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (Select3D_ListOfSensitiveTriangle & Other,Select3D_ListIteratorOfListOfSensitiveTriangle & It);
		%feature("autodoc", "Args:
	I(Handle_Select3D_SensitiveTriangle)
	It(Select3D_ListIteratorOfListOfSensitiveTriangle)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_Select3D_SensitiveTriangle & I,Select3D_ListIteratorOfListOfSensitiveTriangle & It);
		%feature("autodoc", "Args:
	Other(Select3D_ListOfSensitiveTriangle)
	It(Select3D_ListIteratorOfListOfSensitiveTriangle)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
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
		%feature("autodoc", "Args:
	None
Returns:
	inline

No detailed docstring for this function.") operatorgp_Pnt;
		inline operator gp_Pnt ();
		%feature("autodoc", "Args:
	None
Returns:
	inline

No detailed docstring for this function.") operatorgp_XYZ;
		inline operator gp_XYZ ();
		%feature("autodoc", "Args:
	thePnt(gp_Pnt)

Returns:
	inline gp_Pnt

No detailed docstring for this function.") operator=;
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
		%feature("autodoc", "Args:
	None
Returns:
	inline

No detailed docstring for this function.") operatorgp_Pnt2d;
		inline operator gp_Pnt2d ();
		%feature("autodoc", "Args:
	None
Returns:
	inline

No detailed docstring for this function.") operatorgp_XY;
		inline operator gp_XY ();
		%feature("autodoc", "Args:
	thePnt(gp_Pnt2d)

Returns:
	inline gp_Pnt2d

No detailed docstring for this function.") operator=;
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
		%feature("autodoc", "Args:
	theNbPoints(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Select3D_PointData;
		 Select3D_PointData (const Standard_Integer theNbPoints);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theValue(Select3D_Pnt)

Returns:
	None

No detailed docstring for this function.") SetPnt;
		void SetPnt (const Standard_Integer theIndex,const Select3D_Pnt & theValue);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theValue(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") SetPnt;
		void SetPnt (const Standard_Integer theIndex,const gp_Pnt & theValue);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theValue(Select3D_Pnt2d)

Returns:
	None

No detailed docstring for this function.") SetPnt2d;
		void SetPnt2d (const Standard_Integer theIndex,const Select3D_Pnt2d & theValue);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theValue(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") SetPnt2d;
		void SetPnt2d (const Standard_Integer theIndex,const gp_Pnt2d & theValue);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Select3D_Pnt

No detailed docstring for this function.") Pnt;
		Select3D_Pnt Pnt (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Select3D_Pnt2d

No detailed docstring for this function.") Pnt2d;
		Select3D_Pnt2d Pnt2d (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Size;
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
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)

Returns:
	None

Constructs the 3D projector object defined by the 3D view aView.") Select3D_Projector;
		 Select3D_Projector (const Handle_V3d_View & aView);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Select3D_Projector;
		 Select3D_Projector ();
		%feature("autodoc", "Args:
	CS(gp_Ax2)

Returns:
	None

Creates an axonometric projector. <CS> represents viewing coordinate  
system and could be constructed from x direction, view plane normal direction,  
and view point location in world-coordinate space.") Select3D_Projector;
		 Select3D_Projector (const gp_Ax2 & CS);
		%feature("autodoc", "Args:
	CS(gp_Ax2)
	Focus(Standard_Real)

Returns:
	None

Creates  a  perspective  projector. <CS> represents viewing  
coordinate system and could be constructed from x direction,  
view plane normal direction, and focal point location in world-coordinate  
space. <Focus> should represent distance of an eye from view plane  
in world-coordinate space (focal distance).") Select3D_Projector;
		 Select3D_Projector (const gp_Ax2 & CS,const Standard_Real Focus);
		%feature("autodoc", "Args:
	T(gp_Trsf)
	Persp(Standard_Boolean)
	Focus(Standard_Real)

Returns:
	None

build a Projector from the given transformation.  
In case, when <T> transformation should represent custom view projection,  
it could be constructed from two separate components: transposed view  
orientation matrix and translation of focal point in view-coordiante  
system. <T> could be built up from x direction, up direction,  
view plane normal direction vectors and translation with SetValues(...)  
method, where first row arguments (a11, a12, a13, a14)  are x, y, z  
component of x direction vector, and x value of reversed translation  
vector. Second row arguments, are x y z for up direction and y value of  
reversed translation, and the third row defined in the same manner.  
This also suits for simple perspective view, where <Focus> is the focale  
distance of an eye from view plane in world-space coordiantes.  
Note, that in that case amount of perspective distortion (perspective  
angle) should be defined through focal distance.") Select3D_Projector;
		 Select3D_Projector (const gp_Trsf & T,const Standard_Boolean Persp,const Standard_Real Focus);
		%feature("autodoc", "Args:
	GT(gp_GTrsf)
	Persp(Standard_Boolean)
	Focus(Standard_Real)

Returns:
	None

build a Projector from the given transformation.  
In case, when <GT> transformation should represent custom view  
projection, it could be constructed from two separate components:  
transposed view orientation matrix and translation of a focal point  
in view-coordinate system.  
This also suits for perspective view, with <Focus> that could be  
equal to distance from an eye to a view plane in  
world-coordinates (focal distance).  
The 3x3 transformation matrix is built up from three vectors:  
x direction, up direction and view plane normal vectors, where each  
vector is a matrix row. Then <GT> is constructed from matrix and  
reversed translation with methods SetTranslationPart(..) and  
SetVectorialPart(..).  
Note, that in that case amount of perspective distortion (perspective  
angle) should be defined through focal distance.") Select3D_Projector;
		 Select3D_Projector (const gp_GTrsf & GT,const Standard_Boolean Persp,const Standard_Real Focus);
		%feature("autodoc", "Args:
	T(gp_Trsf)
	Persp(Standard_Boolean)
	Focus(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const gp_Trsf & T,const Standard_Boolean Persp,const Standard_Real Focus);
		%feature("autodoc", "Args:
	V(Handle_V3d_View)

Returns:
	None

Sets the 3D view V used at the time of construction.") SetView;
		void SetView (const Handle_V3d_View & V);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_V3d_View

Returns the 3D view used at the time of construction.") View;
		const Handle_V3d_View & View ();
		%feature("autodoc", "Args:
	On(Standard_Boolean)=Standard_False

Returns:
	virtual void

to compute with the given scale and translation.") Scaled;
		virtual void Scaled (const Standard_Boolean On = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there is a perspective transformation.") Perspective;
		Standard_Boolean Perspective ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_GTrsf

Returns the active transformation.") Transformation;
		const gp_GTrsf & Transformation ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_GTrsf

Returns the active inverted transformation.") InvertedTransformation;
		const gp_GTrsf & InvertedTransformation ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

Returns the original transformation.") FullTransformation;
		const gp_Trsf & FullTransformation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the focal length.") Focus;
		Standard_Real Focus ();
		%feature("autodoc", "Args:
	D(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (gp_Vec & D);
		%feature("autodoc", "Args:
	Pnt(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (gp_Pnt & Pnt);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Pout(gp_Pnt2d)

Returns:
	virtual void

Transform and apply perspective if needed.") Project;
		virtual void Project (const gp_Pnt & P,gp_Pnt2d & Pout);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

Transform and apply perspective if needed.") Project;
		void Project (const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	D1(gp_Vec)
	Pout(gp_Pnt2d)
	D1out(gp_Vec2d)

Returns:
	virtual void

Transform and apply perspective if needed.") Project;
		virtual void Project (const gp_Pnt & P,const gp_Vec & D1,gp_Pnt2d & Pout,gp_Vec2d & D1out);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)

Returns:
	virtual gp_Lin

return a line going through the eye towards the  
         2d point <X,Y>.") Shoot;
		virtual gp_Lin Shoot (const Standard_Real X,const Standard_Real Y);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	T(gp_GTrsf)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (gp_Pnt & P,const gp_GTrsf & T);
		%feature("autodoc", "Args:
	D(gp_Lin)
	T(gp_GTrsf)

Returns:
	None

No detailed docstring for this function.") Transform;
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
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this framework needs conversion.") NeedsConversion;
		Standard_Boolean NeedsConversion ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this framework provides 3D information.") Is3D;
		Standard_Boolean Is3D ();
		%feature("autodoc", "Args:
	aProjector(Handle_Select3D_Projector)

Returns:
	virtual void

In classes inheriting this framework, you must  
redefine this function in order to get a sensitive 2D  
rectangle from a 3D entity. This rectangle is the  
sensitive zone which makes the 3D entity selectable.") Project;
		virtual void Project (const Handle_Select3D_Projector & aProjector);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns the max number of sensitive areas returned  
         by this class is 1 by default.  
         Else on must redefine this method.") MaxBoxes;
		virtual Standard_Integer MaxBoxes ();
		%feature("autodoc", "Args:
	aLocation(TopLoc_Location)

Returns:
	virtual Handle_Select3D_SensitiveEntity

Originally this method intended to return sensitive  
entity with new location aLocation, but currently sensitive  
entities do not hold a location, instead HasLocation() and  
Location() methods call corresponding entity owner's methods.  
Thus all entities returned by GetConnected() share the same  
location propagated from corresponding selectable object.  
You must redefine this function for any type of  
sensitive entity which can accept another connected  
sensitive entity.//can be connected to another sensitive entity.") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	aTol(Standard_Real)

Returns:
	virtual Standard_Boolean

Matches the box defined by the coordinates Xmin,  
Ymin, Xmax, Ymax with the entity found at that point  
within the tolerance aTol.  
Xmin, YMin define the minimum point in the lower left  
hand corner of the box, and   XMax, YMax define the  
maximum point in the upper right hand corner of the box.  
You must redefine this function for every inheriting entity.  
You will have to call this framework inside the redefined function.") Matches;
		virtual Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "Args:
	Polyline(TColgp_Array1OfPnt2d)
	aBox(Bnd_Box2d)
	aTol(Standard_Real)

Returns:
	virtual Standard_Boolean

prevents from hiding virtual methods...") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true if this framework has a location defined.") HasLocation;
		virtual Standard_Boolean HasLocation ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TopLoc_Location

No detailed docstring for this function.") Location;
		virtual const TopLoc_Location & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

sets the location to Identity") ResetLocation;
		virtual void ResetLocation ();
		%feature("autodoc", "Args:
	aLoc(TopLoc_Location)

Returns:
	virtual void

No detailed docstring for this function.") SetLocation;
		virtual void SetLocation (const TopLoc_Location & aLoc);
		%feature("autodoc", "Args:
	S(Standard_OStream)
	FullDump(Standard_Boolean)=Standard_True

Returns:
	virtual void

2 options :  
         <FullDump> = False -> general information  
//!	        <FullDump> = True  -> whole informtion 3D +2d ...") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("autodoc", "Args:
	S(Standard_OStream)
	abox(Bnd_Box2d)

Returns:
	static void

No detailed docstring for this function.") DumpBox;
		static void DumpBox (Standard_OStream & S,const Bnd_Box2d & abox);
		%feature("autodoc", "Args:
	aLoc(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") UpdateLocation;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Select3D_SensitiveEntitySequence;
		 Select3D_SensitiveEntitySequence ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Select3D_SensitiveEntitySequence)

Returns:
	Select3D_SensitiveEntitySequence

No detailed docstring for this function.") Assign;
		const Select3D_SensitiveEntitySequence & Assign (const Select3D_SensitiveEntitySequence & Other);
		%feature("autodoc", "Args:
	Other(Select3D_SensitiveEntitySequence)

Returns:
	Select3D_SensitiveEntitySequence

No detailed docstring for this function.") operator=;
		const Select3D_SensitiveEntitySequence & operator = (const Select3D_SensitiveEntitySequence & Other);
		%feature("autodoc", "Args:
	T(Handle_Select3D_SensitiveEntity)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Select3D_SensitiveEntity & T);
		%feature("autodoc", "Args:
	S(Select3D_SensitiveEntitySequence)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Select3D_SensitiveEntitySequence & S);
		%feature("autodoc", "Args:
	T(Handle_Select3D_SensitiveEntity)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Select3D_SensitiveEntity & T);
		%feature("autodoc", "Args:
	S(Select3D_SensitiveEntitySequence)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Select3D_SensitiveEntitySequence & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Select3D_SensitiveEntity)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Select3D_SensitiveEntity & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Select3D_SensitiveEntitySequence)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Select3D_SensitiveEntitySequence & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Select3D_SensitiveEntity)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Select3D_SensitiveEntity & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Select3D_SensitiveEntitySequence)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Select3D_SensitiveEntitySequence & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Select3D_SensitiveEntity

No detailed docstring for this function.") First;
		const Handle_Select3D_SensitiveEntity & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Select3D_SensitiveEntity

No detailed docstring for this function.") Last;
		const Handle_Select3D_SensitiveEntity & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Select3D_SensitiveEntitySequence)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Select3D_SensitiveEntitySequence & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Select3D_SensitiveEntity

No detailed docstring for this function.") Value;
		const Handle_Select3D_SensitiveEntity & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Select3D_SensitiveEntity)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Select3D_SensitiveEntity & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Select3D_SensitiveEntity

No detailed docstring for this function.") ChangeValue;
		Handle_Select3D_SensitiveEntity & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "Args:
	I(Handle_Select3D_SensitiveEntity)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Select3D_SequenceNodeOfSensitiveEntitySequence;
		 Select3D_SequenceNodeOfSensitiveEntitySequence (const Handle_Select3D_SensitiveEntity & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Select3D_SensitiveEntity

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	BoundingBox(Bnd_Box)

Returns:
	None

Constructs a sensitive box object defined by the  
owner OwnerId, and the bounding box BoundingBox.") Select3D_SensitiveBox;
		 Select3D_SensitiveBox (const Handle_SelectBasics_EntityOwner & OwnerId,const Bnd_Box & BoundingBox);
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	XMin(Standard_Real)
	YMin(Standard_Real)
	ZMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	ZMax(Standard_Real)

Returns:
	None

Constructs a sensitive box object defined by the  
owner OwnerId, and the coordinates Xmin, YMin, ZMin, XMax, YMax, ZMax.  
Xmin, YMin and ZMin define the minimum point in  
the front lower left hand corner of the box,  
and   XMax, YMax   and ZMax define the maximum  
point in the back upper right hand corner of the box.") Select3D_SensitiveBox;
		 Select3D_SensitiveBox (const Handle_SelectBasics_EntityOwner & OwnerId,const Standard_Real XMin,const Standard_Real YMin,const Standard_Real ZMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real ZMax);
		%feature("autodoc", "Args:
	aProjector(Handle_Select3D_Projector)

Returns:
	None

projection of the sensitive primitive in order to  
         get 2D boxes for the Sort Algorithm") Project;
		void Project (const Handle_Select3D_Projector & aProjector);
		%feature("autodoc", "Args:
	boxes(SelectBasics_ListOfBox2d)

Returns:
	None

gives the 2D boxes which represent the Box in the  
         selection process...") Areas;
		void Areas (SelectBasics_ListOfBox2d & boxes);
		%feature("autodoc", "Args:
	aLocation(TopLoc_Location)

Returns:
	Handle_Select3D_SensitiveEntity

No detailed docstring for this function.") GetConnected;
		Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("autodoc", "Args:
	thePickArgs(SelectBasics_PickArgs)
	theMatchDMin(Standard_Real)
	theMatchDepth(Standard_Real)

Returns:
	Standard_Boolean

Checks whether the sensitive entity matches the picking  
detection area (close to the picking line).  
For details please refer to base class declaration.") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	aTol(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Matches;
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "Args:
	Polyline(TColgp_Array1OfPnt2d)
	aBox(Bnd_Box2d)
	aTol(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "Args:
	EyeLine(gp_Lin)

Returns:
	Standard_Real

No detailed docstring for this function.") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & EyeLine);
		%feature("autodoc", "Args:
	S(Standard_OStream)
	FullDump(Standard_Boolean)=Standard_True

Returns:
	virtual void

No detailed docstring for this function.") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

Returns the sensitive 3D box used at the time of construction.") Box;
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
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	MatchAll(Standard_Boolean)=Standard_True

Returns:
	None

Constructs an empty sensitive group object.  
This is a set of sensitive 3D entities. The sensitive  
entities will be defined using the function Add to fill  
the entity owner OwnerId. If MatchAll is false, nothing can be added.") Select3D_SensitiveGroup;
		 Select3D_SensitiveGroup (const Handle_SelectBasics_EntityOwner & OwnerId,const Standard_Boolean MatchAll = Standard_True);
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	TheList(Select3D_ListOfSensitive)
	MatchAll(Standard_Boolean)=Standard_True

Returns:
	None

Constructs a sensitive group object defined by the list  
TheList and the entity owner OwnerId. If MatchAll is false, nothing is done.") Select3D_SensitiveGroup;
		 Select3D_SensitiveGroup (const Handle_SelectBasics_EntityOwner & OwnerId,Select3D_ListOfSensitive & TheList,const Standard_Boolean MatchAll = Standard_True);
		%feature("autodoc", "Args:
	LL(Select3D_ListOfSensitive)

Returns:
	None

Adds the list of sensitive entities LL to the empty  
sensitive group object created at construction time.") Add;
		void Add (Select3D_ListOfSensitive & LL);
		%feature("autodoc", "Args:
	aSensitive(Handle_Select3D_SensitiveEntity)

Returns:
	None

Adds the sensitive entity aSensitive to the non-empty  
sensitive group object created at construction time.") Add;
		void Add (const Handle_Select3D_SensitiveEntity & aSensitive);
		%feature("autodoc", "Args:
	aSensitive(Handle_Select3D_SensitiveEntity)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Handle_Select3D_SensitiveEntity & aSensitive);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all sensitive entities from the list used at the  
time of construction, or added using the function Add.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	aSensitive(Handle_Select3D_SensitiveEntity)

Returns:
	Standard_Boolean

Returns true if the sensitive entity aSensitive is in  
the list used at the time of construction, or added using the function Add.") IsIn;
		Standard_Boolean IsIn (const Handle_Select3D_SensitiveEntity & aSensitive);
		%feature("autodoc", "Args:
	MustMatchAllEntities(Standard_Boolean)

Returns:
	None

Sets the requirement that all sensitive entities in the  
list used at the time of construction, or added using  
the function Add must be matched.") Set;
		void Set (const Standard_Boolean MustMatchAllEntities);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if all sensitive entities in the list used  
at the time of construction, or added using the function Add must be matched.") MustMatchAll;
		Standard_Boolean MustMatchAll ();
		%feature("autodoc", "Args:
	aProjector(Handle_Select3D_Projector)

Returns:
	None

projection of the sensitive primitive in order to  
         get 2D boxes for the Sort Algorithm") Project;
		void Project (const Handle_Select3D_Projector & aProjector);
		%feature("autodoc", "Args:
	boxes(SelectBasics_ListOfBox2d)

Returns:
	None

gives the 2D boxes which represent the segment in the  
         selection process...") Areas;
		void Areas (SelectBasics_ListOfBox2d & boxes);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") MaxBoxes;
		Standard_Integer MaxBoxes ();
		%feature("autodoc", "Args:
	aLocation(TopLoc_Location)

Returns:
	Handle_Select3D_SensitiveEntity

No detailed docstring for this function.") GetConnected;
		Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("autodoc", "Args:
	aLoc(TopLoc_Location)

Returns:
	None

propagation of location on all the sensitive inside...") SetLocation;
		void SetLocation (const TopLoc_Location & aLoc);
		%feature("autodoc", "Args:
	None
Returns:
	None

propagation of location on all the sensitive inside...") ResetLocation;
		void ResetLocation ();
		%feature("autodoc", "Args:
	thePickArgs(SelectBasics_PickArgs)
	theMatchDMin(Standard_Real)
	theMatchDepth(Standard_Real)

Returns:
	Standard_Boolean

Checks whether the sensitive entity matches the picking  
detection area (close to the picking line).  
For details please refer to base class declaration.") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	aTol(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Matches;
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "Args:
	Polyline(TColgp_Array1OfPnt2d)
	aBox(Bnd_Box2d)
	aTol(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "Args:
	TheOwnerId(Handle_SelectBasics_EntityOwner)

Returns:
	None

Sets the owner for all entities in group") Set;
		void Set (const Handle_SelectBasics_EntityOwner & TheOwnerId);
		%feature("autodoc", "Args:
	None
Returns:
	Select3D_ListOfSensitive

Gets group content") GetEntities;
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
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	Point(gp_Pnt)

Returns:
	None

Constructs a sensitive point object defined by the  
owner OwnerId and the point Point.") Select3D_SensitivePoint;
		 Select3D_SensitivePoint (const Handle_SelectBasics_EntityOwner & OwnerId,const gp_Pnt & Point);
		%feature("autodoc", "Args:
	aProjector(Handle_Select3D_Projector)

Returns:
	None

//!Converts the stored 3D point into a 2D point according  
        to <aProjector> ; this method is called by the selection Manager.") Project;
		void Project (const Handle_Select3D_Projector & aProjector);
		%feature("autodoc", "Args:
	aresult(SelectBasics_ListOfBox2d)

Returns:
	None

stores in <aresult> the 2D sensitive box which represents  
         the point area in the selection process.") Areas;
		void Areas (SelectBasics_ListOfBox2d & aresult);
		%feature("autodoc", "Args:
	aLocation(TopLoc_Location)

Returns:
	Handle_Select3D_SensitiveEntity

No detailed docstring for this function.") GetConnected;
		Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("autodoc", "Args:
	thePickArgs(SelectBasics_PickArgs)
	theMatchDMin(Standard_Real)
	theMatchDepth(Standard_Real)

Returns:
	Standard_Boolean

Checks whether the sensitive entity matches the picking  
detection area (close to the picking line).  
For details please refer to base class declaration.") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	aTol(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Matches;
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "Args:
	Polyline(TColgp_Array1OfPnt2d)
	aBox(Bnd_Box2d)
	aTol(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "Args:
	EyeLine(gp_Lin)

Returns:
	Standard_Real

No detailed docstring for this function.") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & EyeLine);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the point used at the time of construction.") Point;
		gp_Pnt Point ();
		%feature("autodoc", "Args:
	S(Standard_OStream)
	FullDump(Standard_Boolean)=Standard_True

Returns:
	virtual void

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	aProjector(Handle_Select3D_Projector)

Returns:
	virtual void

projection of the sensitive primitive in order to  
         get 2D boxes for the Sort Algorithm") Project;
		virtual void Project (const Handle_Select3D_Projector & aProjector);
		%feature("autodoc", "Args:
	boxes(SelectBasics_ListOfBox2d)

Returns:
	None

stores in <boxes> the 2D Boxes which represent the sensitive face  
         in the selection algorithm.") Areas;
		void Areas (SelectBasics_ListOfBox2d & boxes);
		%feature("autodoc", "Args:
	theHArrayOfPnt(Handle_TColgp_HArray1OfPnt)

Returns:
	None

Returns the 3D points of the array used at construction time.") Points3D;
		void Points3D (Handle_TColgp_HArray1OfPnt & theHArrayOfPnt);
		%feature("autodoc", "Args:
	theArrayOfPnt2d(TColgp_Array1OfPnt2d)

Returns:
	None

Returns the 2D points of the array used at construction time.") Points2D;
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
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	FirstP(gp_Pnt)
	LastP(gp_Pnt)
	MaxRect(Standard_Integer)=1

Returns:
	None

Constructs the sensitive segment object defined by  
the owner OwnerId, the points FirstP, LastP and the  
maximum number of sensitive bounding boxes MaxRect.") Select3D_SensitiveSegment;
		 Select3D_SensitiveSegment (const Handle_SelectBasics_EntityOwner & OwnerId,const gp_Pnt & FirstP,const gp_Pnt & LastP,const Standard_Integer MaxRect = 1);
		%feature("autodoc", "Args:
	MaxRect(Standard_Integer)

Returns:
	None

Sets the maximum number of sensitive rectangles MaxRect.") Set;
		void Set (const Standard_Integer MaxRect);
		%feature("autodoc", "Args:
	aPt(gp_Pnt)

Returns:
	None

changes the start Point of the Segment;") StartPoint;
		void StartPoint (const gp_Pnt & aPt);
		%feature("autodoc", "Args:
	aPt(gp_Pnt)

Returns:
	None

changes the end point of the segment") EndPoint;
		void EndPoint (const gp_Pnt & aPt);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

gives the 3D start Point of the Segment") StartPoint;
		gp_Pnt StartPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

gives the 3D End Point of the Segment") EndPoint;
		gp_Pnt EndPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

gives the 3D start Point of the Segment") StartPoint2d;
		gp_Pnt2d StartPoint2d ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

gives the 3D End Point of the Segment") EndPoint2d;
		gp_Pnt2d EndPoint2d ();
		%feature("autodoc", "Args:
	aProjector(Handle_Select3D_Projector)

Returns:
	virtual void

projection of the sensitive primitive in order to  
         get 2D boxes for the Sort Algorithm") Project;
		virtual void Project (const Handle_Select3D_Projector & aProjector);
		%feature("autodoc", "Args:
	boxes(SelectBasics_ListOfBox2d)

Returns:
	None

gives the 2D boxes which represent the segment in the  
         selection process...") Areas;
		void Areas (SelectBasics_ListOfBox2d & boxes);
		%feature("autodoc", "Args:
	aLocation(TopLoc_Location)

Returns:
	Handle_Select3D_SensitiveEntity

No detailed docstring for this function.") GetConnected;
		Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("autodoc", "Args:
	thePickArgs(SelectBasics_PickArgs)
	theMatchDMin(Standard_Real)
	theMatchDepth(Standard_Real)

Returns:
	Standard_Boolean

Checks whether the sensitive entity matches the picking  
detection area (close to the picking line).  
For details please refer to base class declaration.") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	aTol(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Matches;
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "Args:
	Polyline(TColgp_Array1OfPnt2d)
	aBox(Bnd_Box2d)
	aTol(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "Args:
	EyeLine(gp_Lin)

Returns:
	Standard_Real

No detailed docstring for this function.") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & EyeLine);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

//!returns <mymaxrect>") MaxBoxes;
		Standard_Integer MaxBoxes ();
		%feature("autodoc", "Args:
	S(Standard_OStream)
	FullDump(Standard_Boolean)=Standard_True

Returns:
	virtual void

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	MaxRect(Standard_Integer)=1

Returns:
	None

Constructs a sensitive wire object defined by the  
owner OwnerId, and the maximum number of  
sensitive rectangles MaxRect.") Select3D_SensitiveWire;
		 Select3D_SensitiveWire (const Handle_SelectBasics_EntityOwner & OwnerId,const Standard_Integer MaxRect = 1);
		%feature("autodoc", "Args:
	aSensitive(Handle_Select3D_SensitiveEntity)

Returns:
	None

Adds the sensitive entity aSensitive to this framework.") Add;
		void Add (const Handle_Select3D_SensitiveEntity & aSensitive);
		%feature("autodoc", "Args:
	aProjector(Handle_Select3D_Projector)

Returns:
	None

projection of the sensitive primitive in order to  
         get 2D boxes for the Sort Algorithm") Project;
		void Project (const Handle_Select3D_Projector & aProjector);
		%feature("autodoc", "Args:
	boxes(SelectBasics_ListOfBox2d)

Returns:
	None

gives the 2D boxes which represent the segment in the  
         selection process...") Areas;
		void Areas (SelectBasics_ListOfBox2d & boxes);
		%feature("autodoc", "Args:
	aLocation(TopLoc_Location)

Returns:
	Handle_Select3D_SensitiveEntity

No detailed docstring for this function.") GetConnected;
		Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & aLocation);
		%feature("autodoc", "Args:
	theEdges(Select3D_SensitiveEntitySequence)

Returns:
	None

returns the sensitive edges stored in this wire") GetEdges;
		void GetEdges (Select3D_SensitiveEntitySequence & theEdges);
		%feature("autodoc", "Args:
	aLoc(TopLoc_Location)

Returns:
	None

propagation of location on all the sensitive inside...") SetLocation;
		void SetLocation (const TopLoc_Location & aLoc);
		%feature("autodoc", "Args:
	None
Returns:
	None

propagation of location on all the sensitive inside...") ResetLocation;
		void ResetLocation ();
		%feature("autodoc", "Args:
	thePickArgs(SelectBasics_PickArgs)
	theMatchDMin(Standard_Real)
	theMatchDepth(Standard_Real)

Returns:
	Standard_Boolean

Checks whether the sensitive entity matches the picking  
detection area (close to the picking line).  
For details please refer to base class declaration.") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	aTol(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Matches;
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "Args:
	Polyline(TColgp_Array1OfPnt2d)
	aBox(Bnd_Box2d)
	aTol(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

//!returns <mymaxrect>") MaxBoxes;
		Standard_Integer MaxBoxes ();
		%feature("autodoc", "Args:
	S(Standard_OStream)
	FullDump(Standard_Boolean)=Standard_True

Returns:
	virtual void

No detailed docstring for this function.") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("autodoc", "Args:
	TheOwnerId(Handle_SelectBasics_EntityOwner)

Returns:
	None

Sets the owner for all entities in wire") Set;
		void Set (const Handle_SelectBasics_EntityOwner & TheOwnerId);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Select3D_SensitiveEntity

//!returns <mymaxrect>") GetLastDetected;
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
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	TheCircle(Handle_Geom_Circle)
	FilledCircle(Standard_Boolean)=Standard_False
	NbOfPoints(Standard_Integer)=6

Returns:
	None

Constructs the sensitive circle object defined by the  
owner OwnerId, the circle Circle, the Boolean  
FilledCircle and the number of points NbOfPoints.") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_Geom_Circle & TheCircle,const Standard_Boolean FilledCircle = Standard_False,const Standard_Integer NbOfPoints = 6);
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	TheCircle(Handle_Geom_Circle)
	u1(Standard_Real)
	u2(Standard_Real)
	FilledCircle(Standard_Boolean)=Standard_False
	NbOfPoints(Standard_Integer)=6

Returns:
	None

Constructs the sensitive arc object defined by the  
owner OwnerId, the circle Circle, the parameters u1  
and u2, the Boolean FilledCircle and the number of points NbOfPoints.  
u1 and u2 define the first and last points of the arc on Circle.") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_Geom_Circle & TheCircle,const Standard_Real u1,const Standard_Real u2,const Standard_Boolean FilledCircle = Standard_False,const Standard_Integer NbOfPoints = 6);
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	apolyg3d(Handle_TColgp_HArray1OfPnt)
	FilledCircle(Standard_Boolean)=Standard_False

Returns:
	None

Constructs the sensitive circle object defined by the  
owner OwnerId, the array of triangles apolyg3d, and the Boolean FilledCircle.  
apolyg3d is an array of consecutive triangles on the  
circle. The triangle i+1 lies on the intersection of the  
tangents to the circle of i and i+2. Note, that the first point of apolyg3d  
must be equal to the last point of apolyg3d.") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_TColgp_HArray1OfPnt & apolyg3d,const Standard_Boolean FilledCircle = Standard_False);
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	apolyg3d(TColgp_Array1OfPnt)
	FilledCircle(Standard_Boolean)=Standard_False

Returns:
	None

Constructs the sensitive circle object defined by the  
owner OwnerId, the array of points apolyg3d, and the Boolean FilledCircle.  
If the length of apolyg3d is more then 1, the first point of apolyg3d  
must be equal to the last point of apolyg3d.") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const Handle_SelectBasics_EntityOwner & OwnerId,const TColgp_Array1OfPnt & apolyg3d,const Standard_Boolean FilledCircle = Standard_False);
		%feature("autodoc", "Args:
	thePickArgs(SelectBasics_PickArgs)
	theMatchDMin(Standard_Real)
	theMatchDepth(Standard_Real)

Returns:
	Standard_Boolean

Checks whether the sensitive entity matches the picking  
detection area (close to the picking line).  
For details please refer to base class declaration.") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	aTol(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Matches;
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "Args:
	Polyline(TColgp_Array1OfPnt2d)
	aBox(Bnd_Box2d)
	aTol(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "Args:
	thePickLine(gp_Lin)
	theDetectedIndex(Standard_Integer)

Returns:
	Standard_Real

Compute depth of sensitive circle for the detected sub-part.  
@param thePickLine [in] the picking line.  
@param theDetectedIndex [in] index of the detected sub-part.  
@return depth on the picking line.") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & thePickLine,const Standard_Integer theDetectedIndex);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ArrayBounds;
		void ArrayBounds (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	rank(Standard_Integer)

Returns:
	gp_Pnt

No detailed docstring for this function.") GetPoint3d;
		gp_Pnt GetPoint3d (const Standard_Integer rank);
		%feature("autodoc", "Args:
	S(Standard_OStream)
	FullDump(Standard_Boolean)=Standard_True

Returns:
	virtual void

No detailed docstring for this function.") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("autodoc", "Args:
	theLocation(TopLoc_Location)

Returns:
	virtual Handle_Select3D_SensitiveEntity

Returns the copy of this.") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected (const TopLoc_Location & theLocation);
		%feature("autodoc", "Args:
	aProjector(Handle_Select3D_Projector)

Returns:
	virtual void

No detailed docstring for this function.") Project;
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
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	TheCurve(Handle_Geom_Curve)
	MaxPoints(Standard_Integer)=17

Returns:
	None

Constructs a sensitive curve object defined by the  
owner OwnerId, the curve TheCurve, and the  
maximum number of points on the curve: MaxPoints.") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_Geom_Curve & TheCurve,const Standard_Integer MaxPoints = 17);
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	ThePoints(Handle_TColgp_HArray1OfPnt)

Returns:
	None

Constructs a sensitive curve object defined by the  
owner OwnerId and the set of points ThePoints.") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_TColgp_HArray1OfPnt & ThePoints);
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	ThePoints(TColgp_Array1OfPnt)

Returns:
	None

Creation of Sensitive Curve from Points.  
         Warning : This Method should disappear in the next version...") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve (const Handle_SelectBasics_EntityOwner & OwnerId,const TColgp_Array1OfPnt & ThePoints);
		%feature("autodoc", "Args:
	thePickArgs(SelectBasics_PickArgs)
	theMatchDMin(Standard_Real)
	theMatchDepth(Standard_Real)

Returns:
	Standard_Boolean

Checks whether the sensitive entity matches the picking  
detection area (close to the picking line).  
For details please refer to base class declaration.") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	aTol(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Matches;
		Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "Args:
	Polyline(TColgp_Array1OfPnt2d)
	aBox(Bnd_Box2d)
	aTol(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "Args:
	thePickLine(gp_Lin)
	theDetectedIndex(Standard_Integer)

Returns:
	Standard_Real

Compute depth of sensitive circle for the detected sub-part.  
@param thePickLine [in] the picking line.  
@param theDetectedIndex [in] index of the detected sub-part.  
@return depth on the picking line.") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & thePickLine,const Standard_Integer theDetectedIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gets index of last detected segment") GetLastDetected;
		Standard_Integer GetLastDetected ();
		%feature("autodoc", "Args:
	S(Standard_OStream)
	FullDump(Standard_Boolean)=Standard_True

Returns:
	virtual void

No detailed docstring for this function.") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("autodoc", "Args:
	theLocation(TopLoc_Location)

Returns:
	virtual Handle_Select3D_SensitiveEntity

Returns the copy of this") GetConnected;
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
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	ThePoints(TColgp_Array1OfPnt)
	Sensitivity(Select3D_TypeOfSensitivity)=Select3D_TOS_INTERIOR

Returns:
	None

Constructs a sensitive face object defined by the  
owner OwnerId, the array of points ThePoints, and  
the sensitivity type Sensitivity.  
The array of points is the outer polygon of the geometric face.") Select3D_SensitiveFace;
		 Select3D_SensitiveFace (const Handle_SelectBasics_EntityOwner & OwnerId,const TColgp_Array1OfPnt & ThePoints,const Select3D_TypeOfSensitivity Sensitivity = Select3D_TOS_INTERIOR);
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	ThePoints(Handle_TColgp_HArray1OfPnt)
	Sensitivity(Select3D_TypeOfSensitivity)=Select3D_TOS_INTERIOR

Returns:
	None

Constructs a sensitive face object defined by the  
owner OwnerId, the array of points ThePoints, and  
the sensitivity type Sensitivity.  
The array of points is the outer polygon of the geometric face.") Select3D_SensitiveFace;
		 Select3D_SensitiveFace (const Handle_SelectBasics_EntityOwner & OwnerId,const Handle_TColgp_HArray1OfPnt & ThePoints,const Select3D_TypeOfSensitivity Sensitivity = Select3D_TOS_INTERIOR);
		%feature("autodoc", "Args:
	thePickArgs(SelectBasics_PickArgs)
	theMatchDMin(Standard_Real)
	theMatchDepth(Standard_Real)

Returns:
	virtual Standard_Boolean

Checks whether the sensitive entity matches the picking  
detection area (close to the picking line).  
For details please refer to base class declaration.") Matches;
		virtual Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	aTol(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Matches;
		virtual Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "Args:
	Polyline(TColgp_Array1OfPnt2d)
	aBox(Bnd_Box2d)
	aTol(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "Args:
	thePickLine(gp_Lin)
	theDepthMin(Standard_Real)
	theDepthMax(Standard_Real)

Returns:
	virtual Standard_Real

Computes the depth values for all 3D points defining this face and returns  
the minimal value among them.  
If the 'minimal depth' approach is not suitable and gives wrong detection results  
in some particular case, a custom sensitive face class can redefine this method.") ComputeDepth;
		virtual Standard_Real ComputeDepth (const gp_Lin & thePickLine,const Standard_Real theDepthMin,const Standard_Real theDepthMax);
		%feature("autodoc", "Args:
	S(Standard_OStream)
	FullDump(Standard_Boolean)=Standard_True

Returns:
	virtual void

No detailed docstring for this function.") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("autodoc", "Args:
	theLocation(TopLoc_Location)

Returns:
	virtual Handle_Select3D_SensitiveEntity

Returns the copy of this") GetConnected;
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
		%feature("autodoc", "Args:
	OwnerId(Handle_SelectBasics_EntityOwner)
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)
	Sensitivity(Select3D_TypeOfSensitivity)=Select3D_TOS_INTERIOR

Returns:
	None

Constructs a sensitive triangle object defined by the  
owner OwnerId, the points P1, P2, P3, and the type of sensitivity Sensitivity.") Select3D_SensitiveTriangle;
		 Select3D_SensitiveTriangle (const Handle_SelectBasics_EntityOwner & OwnerId,const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const Select3D_TypeOfSensitivity Sensitivity = Select3D_TOS_INTERIOR);
		%feature("autodoc", "Args:
	thePickArgs(SelectBasics_PickArgs)
	theMatchDMin(Standard_Real)
	theMatchDepth(Standard_Real)

Returns:
	Standard_Boolean

Checks whether the sensitive entity matches the picking  
detection area (close to the picking line).  
For details please refer to base class declaration.") Matches;
		Standard_Boolean Matches (const SelectBasics_PickArgs & thePickArgs,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	XMin(Standard_Real)
	YMin(Standard_Real)
	XMax(Standard_Real)
	YMax(Standard_Real)
	aTol(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Matches;
		virtual Standard_Boolean Matches (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol);
		%feature("autodoc", "Args:
	Polyline(TColgp_Array1OfPnt2d)
	aBox(Bnd_Box2d)
	aTol(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Matches;
		virtual Standard_Boolean Matches (const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol);
		%feature("autodoc", "Args:
	EyeLine(gp_Lin)

Returns:
	Standard_Real

No detailed docstring for this function.") ComputeDepth;
		Standard_Real ComputeDepth (const gp_Lin & EyeLine);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)

Returns:
	None

Returns the 3D points P1, P2, P3 used at the time of construction.") Points3D;
		void Points3D (gp_Pnt & P1,gp_Pnt & P2,gp_Pnt & P3);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the center point of the sensitive triangle created at construction time.") Center3D;
		gp_Pnt Center3D ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

WARNING : the returned Values are the original values  
         without the stored  location (if there's one).  
         To get the genuine value, One must apply this location  
         (Method Location() )") Center2D;
		gp_XY Center2D ();
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	aTol(Standard_Real)
	Dmin(Standard_Real)

Returns:
	Standard_Integer

No detailed docstring for this function.") Status;
		Standard_Integer Status (const Standard_Real X,const Standard_Real Y,const Standard_Real aTol,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	p0(gp_XY)
	p1(gp_XY)
	p2(gp_XY)
	aPoint(gp_XY)
	aTol(Standard_Real)
	Dmin(Standard_Real)

Returns:
	static Standard_Integer

Dmin gives the distance between the cdg and aPoint return") Status;
		static Standard_Integer Status (const gp_XY & p0,const gp_XY & p1,const gp_XY & p2,const gp_XY & aPoint,const Standard_Real aTol,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	S(Standard_OStream)
	FullDump(Standard_Boolean)=Standard_True

Returns:
	virtual void

No detailed docstring for this function.") Dump;
		virtual void Dump (Standard_OStream & S,const Standard_Boolean FullDump = Standard_True);
		%feature("autodoc", "Args:
	theLocation(TopLoc_Location)

Returns:
	virtual Handle_Select3D_SensitiveEntity

Returns the copy of this") GetConnected;
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

