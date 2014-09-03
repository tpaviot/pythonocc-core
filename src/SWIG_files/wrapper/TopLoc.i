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
%module (package="OCC") TopLoc

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

%include TopLoc_headers.i

/* typedefs */
typedef gp_Trsf * TopLoc_TrsfPtr;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor TopLoc_Datum3D;
class TopLoc_Datum3D : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs a default Datum3D.") TopLoc_Datum3D;
		 TopLoc_Datum3D ();
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Constructs a Datum3D form a Trsf from gp. An error is  
         raised if the Trsf is not a rigid transformation.") TopLoc_Datum3D;
		 TopLoc_Datum3D (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

Returns a gp_Trsf which, when applied to this datum,  
produces the default datum.") Transformation;
		const gp_Trsf & Transformation ();
		%feature("autodoc", "Args:
	S(Standard_OStream)

Returns:
	None

Writes the contents of this Datum3D to the stream S.") ShallowDump;
		void ShallowDump (Standard_OStream & S);
};


%feature("shadow") TopLoc_Datum3D::~TopLoc_Datum3D %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopLoc_Datum3D {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopLoc_Datum3D {
	Handle_TopLoc_Datum3D GetHandle() {
	return *(Handle_TopLoc_Datum3D*) &$self;
	}
};

%nodefaultctor Handle_TopLoc_Datum3D;
class Handle_TopLoc_Datum3D : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopLoc_Datum3D();
        Handle_TopLoc_Datum3D(const Handle_TopLoc_Datum3D &aHandle);
        Handle_TopLoc_Datum3D(const TopLoc_Datum3D *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopLoc_Datum3D DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopLoc_Datum3D {
    TopLoc_Datum3D* GetObject() {
    return (TopLoc_Datum3D*)$self->Access();
    }
};
%feature("shadow") Handle_TopLoc_Datum3D::~Handle_TopLoc_Datum3D %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopLoc_Datum3D {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopLoc_IndexedMapNodeOfIndexedMapOfLocation;
class TopLoc_IndexedMapNodeOfIndexedMapOfLocation : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(TopLoc_Location)
	K2(Standard_Integer)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopLoc_IndexedMapNodeOfIndexedMapOfLocation;
		 TopLoc_IndexedMapNodeOfIndexedMapOfLocation (const TopLoc_Location & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_Location

No detailed docstring for this function.") Key1;
		TopLoc_Location & Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%feature("shadow") TopLoc_IndexedMapNodeOfIndexedMapOfLocation::~TopLoc_IndexedMapNodeOfIndexedMapOfLocation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopLoc_IndexedMapNodeOfIndexedMapOfLocation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopLoc_IndexedMapNodeOfIndexedMapOfLocation {
	Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation GetHandle() {
	return *(Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation*) &$self;
	}
};

%nodefaultctor Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation;
class Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation();
        Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation(const Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation &aHandle);
        Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation(const TopLoc_IndexedMapNodeOfIndexedMapOfLocation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation {
    TopLoc_IndexedMapNodeOfIndexedMapOfLocation* GetObject() {
    return (TopLoc_IndexedMapNodeOfIndexedMapOfLocation*)$self->Access();
    }
};
%feature("shadow") Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation::~Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopLoc_IndexedMapOfLocation;
class TopLoc_IndexedMapOfLocation : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopLoc_IndexedMapOfLocation;
		 TopLoc_IndexedMapOfLocation (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopLoc_IndexedMapOfLocation)

Returns:
	TopLoc_IndexedMapOfLocation

No detailed docstring for this function.") Assign;
		TopLoc_IndexedMapOfLocation & Assign (const TopLoc_IndexedMapOfLocation & Other);
		%feature("autodoc", "Args:
	Other(TopLoc_IndexedMapOfLocation)

Returns:
	TopLoc_IndexedMapOfLocation

No detailed docstring for this function.") operator=;
		TopLoc_IndexedMapOfLocation & operator = (const TopLoc_IndexedMapOfLocation & Other);
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
	K(TopLoc_Location)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TopLoc_Location & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TopLoc_Location & K);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TopLoc_Location)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopLoc_Location & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopLoc_Location

No detailed docstring for this function.") FindKey;
		const TopLoc_Location & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TopLoc_Location)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TopLoc_Location & K);
};


%feature("shadow") TopLoc_IndexedMapOfLocation::~TopLoc_IndexedMapOfLocation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopLoc_IndexedMapOfLocation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopLoc_ItemLocation;
class TopLoc_ItemLocation {
	public:
		%feature("autodoc", "Args:
	D(Handle_TopLoc_Datum3D)
	P(Standard_Integer)
	fromTrsf(Standard_Boolean)=Standard_False

Returns:
	None

Sets the elementary Datum to <D>  
         Sets the exponent to <P>") TopLoc_ItemLocation;
		 TopLoc_ItemLocation (const Handle_TopLoc_Datum3D & D,const Standard_Integer P,const Standard_Boolean fromTrsf = Standard_False);
		%feature("autodoc", "Args:
	anOther(TopLoc_ItemLocation)

Returns:
	None

No detailed docstring for this function.") TopLoc_ItemLocation;
		 TopLoc_ItemLocation (const TopLoc_ItemLocation & anOther);
		%feature("autodoc", "Args:
	anOther(TopLoc_ItemLocation)

Returns:
	TopLoc_ItemLocation

No detailed docstring for this function.") Assign;
		TopLoc_ItemLocation & Assign (const TopLoc_ItemLocation & anOther);
		%feature("autodoc", "Args:
	anOther(TopLoc_ItemLocation)

Returns:
	TopLoc_ItemLocation

No detailed docstring for this function.") operator=;
		TopLoc_ItemLocation & operator = (const TopLoc_ItemLocation & anOther);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
};


%feature("shadow") TopLoc_ItemLocation::~TopLoc_ItemLocation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopLoc_ItemLocation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopLoc_Location;
class TopLoc_Location {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty local coordinate system object.  
Note: A Location constructed from a default datum is said to be 'empty'.") TopLoc_Location;
		 TopLoc_Location ();
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Constructs the local coordinate system object defined  
by the transformation T. T invokes in turn, a TopLoc_Datum3D object.") TopLoc_Location;
		 TopLoc_Location (const gp_Trsf & T);
		%feature("autodoc", "Args:
	D(Handle_TopLoc_Datum3D)

Returns:
	None

Constructs the local coordinate system object defined by the 3D datum D.  
Exceptions  
Standard_ConstructionError if the transformation  
T does not represent a 3D coordinate system.") TopLoc_Location;
		 TopLoc_Location (const Handle_TopLoc_Datum3D & D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this location is equal to the Identity transformation.") IsIdentity;
		Standard_Boolean IsIdentity ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Resets this location to the Identity transformation.") Identity;
		void Identity ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopLoc_Datum3D

Returns    the  first   elementary  datum  of  the  
         Location.  Use the NextLocation function recursively to access  
the other data comprising this location.  
Exceptions  
Standard_NoSuchObject if this location is empty.") FirstDatum;
		const Handle_TopLoc_Datum3D & FirstDatum ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns   the  power  elevation  of    the   first  
         elementary datum.  
Exceptions  
Standard_NoSuchObject if this location is empty.") FirstPower;
		Standard_Integer FirstPower ();
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_Location

Returns  a Location representing  <self> without the  
         first datum. We have the relation :  
 
           <self> = NextLocation() * FirstDatum() ^ FirstPower()  
 Exceptions  
 Standard_NoSuchObject if this location is empty.") NextLocation;
		const TopLoc_Location & NextLocation ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

Returns  the transformation    associated  to  the  
         coordinate system.") Transformation;
		const gp_Trsf & Transformation ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Trsf;
		 operator gp_Trsf ();
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_Location

Returns the inverse of <self>.  
 
         <self> * Inverted() is an Identity.") Inverted;
		TopLoc_Location Inverted ();
		%feature("autodoc", "Args:
	Other(TopLoc_Location)

Returns:
	TopLoc_Location

Returns <self> * <Other>, the  elementary datums are  
         concatenated.") Multiplied;
		TopLoc_Location Multiplied (const TopLoc_Location & Other);
		%feature("autodoc", "Args:
	Other(TopLoc_Location)

Returns:
	TopLoc_Location

No detailed docstring for this function.") operator*;
		TopLoc_Location operator * (const TopLoc_Location & Other);
		%feature("autodoc", "Args:
	Other(TopLoc_Location)

Returns:
	TopLoc_Location

Returns  <self> / <Other>.") Divided;
		TopLoc_Location Divided (const TopLoc_Location & Other);
		%feature("autodoc", "Args:
	Other(TopLoc_Location)

Returns:
	TopLoc_Location

No detailed docstring for this function.") operator/;
		TopLoc_Location operator / (const TopLoc_Location & Other);
		%feature("autodoc", "Args:
	Other(TopLoc_Location)

Returns:
	TopLoc_Location

Returns <Other>.Inverted() * <self>.") Predivided;
		TopLoc_Location Predivided (const TopLoc_Location & Other);
		%feature("autodoc", "Args:
	pwr(Standard_Integer)

Returns:
	TopLoc_Location

Returns me at the power <pwr>.   If <pwr>  is zero  
         returns  Identity.  <pwr> can  be lower  than zero  
         (usual meaning for powers).") Powered;
		TopLoc_Location Powered (const Standard_Integer pwr);
		%feature("autodoc", "Args:
	Upper(Standard_Integer)

Returns:
	Standard_Integer

Returns a hashed value for this local coordinate system.  
This value is used, with map tables, to store and  
retrieve the object easily, and is in the range [ 1..Upper ].") HashCode;
		Standard_Integer HashCode (const Standard_Integer Upper);
		%feature("autodoc", "Args:
	Other(TopLoc_Location)

Returns:
	Standard_Boolean

Returns true if this location and the location Other  
have the same elementary data, i.e. contain the same  
series of TopLoc_Datum3D and respective powers.  
This method is an alias for operator ==.") IsEqual;
		Standard_Boolean IsEqual (const TopLoc_Location & Other);
		%feature("autodoc", "Args:
	Other(TopLoc_Location)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator==;
		Standard_Boolean operator == (const TopLoc_Location & Other);
		%feature("autodoc", "Args:
	Other(TopLoc_Location)

Returns:
	Standard_Boolean

Returns true if this location and the location Other do  
not have the same elementary data, i.e. do not  
contain the same series of TopLoc_Datum3D and respective powers.  
This method is an alias for operator !=.") IsDifferent;
		Standard_Boolean IsDifferent (const TopLoc_Location & Other);
		%feature("autodoc", "Args:
	Other(TopLoc_Location)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator!=;
		Standard_Boolean operator != (const TopLoc_Location & Other);
		%feature("autodoc", "Args:
	S(Standard_OStream)

Returns:
	None

Prints the contents of <self> on the stream <s>.") ShallowDump;
		void ShallowDump (Standard_OStream & S);
};


%feature("shadow") TopLoc_Location::~TopLoc_Location %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopLoc_Location {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopLoc_MapIteratorOfMapOfLocation;
class TopLoc_MapIteratorOfMapOfLocation : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopLoc_MapIteratorOfMapOfLocation;
		 TopLoc_MapIteratorOfMapOfLocation ();
		%feature("autodoc", "Args:
	aMap(TopLoc_MapOfLocation)

Returns:
	None

No detailed docstring for this function.") TopLoc_MapIteratorOfMapOfLocation;
		 TopLoc_MapIteratorOfMapOfLocation (const TopLoc_MapOfLocation & aMap);
		%feature("autodoc", "Args:
	aMap(TopLoc_MapOfLocation)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopLoc_MapOfLocation & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_Location

No detailed docstring for this function.") Key;
		const TopLoc_Location & Key ();
};


%feature("shadow") TopLoc_MapIteratorOfMapOfLocation::~TopLoc_MapIteratorOfMapOfLocation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopLoc_MapIteratorOfMapOfLocation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopLoc_MapLocationHasher;
class TopLoc_MapLocationHasher {
	public:
		%feature("autodoc", "Args:
	K(TopLoc_Location)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

No detailed docstring for this function.") HashCode;
		static Standard_Integer HashCode (const TopLoc_Location & K,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	K1(TopLoc_Location)
	K2(TopLoc_Location)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
		static Standard_Boolean IsEqual (const TopLoc_Location & K1,const TopLoc_Location & K2);
};


%feature("shadow") TopLoc_MapLocationHasher::~TopLoc_MapLocationHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopLoc_MapLocationHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopLoc_MapOfLocation;
class TopLoc_MapOfLocation : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopLoc_MapOfLocation;
		 TopLoc_MapOfLocation (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopLoc_MapOfLocation)

Returns:
	TopLoc_MapOfLocation

No detailed docstring for this function.") Assign;
		TopLoc_MapOfLocation & Assign (const TopLoc_MapOfLocation & Other);
		%feature("autodoc", "Args:
	Other(TopLoc_MapOfLocation)

Returns:
	TopLoc_MapOfLocation

No detailed docstring for this function.") operator=;
		TopLoc_MapOfLocation & operator = (const TopLoc_MapOfLocation & Other);
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
	aKey(TopLoc_Location)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const TopLoc_Location & aKey);
		%feature("autodoc", "Args:
	aKey(TopLoc_Location)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopLoc_Location & aKey);
		%feature("autodoc", "Args:
	aKey(TopLoc_Location)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const TopLoc_Location & aKey);
};


%feature("shadow") TopLoc_MapOfLocation::~TopLoc_MapOfLocation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopLoc_MapOfLocation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopLoc_SListNodeOfSListOfItemLocation;
class TopLoc_SListNodeOfSListOfItemLocation : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	I(TopLoc_ItemLocation)
	aTail(TopLoc_SListOfItemLocation)

Returns:
	None

No detailed docstring for this function.") TopLoc_SListNodeOfSListOfItemLocation;
		 TopLoc_SListNodeOfSListOfItemLocation (const TopLoc_ItemLocation & I,const TopLoc_SListOfItemLocation & aTail);
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_SListOfItemLocation

No detailed docstring for this function.") Tail;
		TopLoc_SListOfItemLocation & Tail ();
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_ItemLocation

No detailed docstring for this function.") Value;
		TopLoc_ItemLocation & Value ();
};


%feature("shadow") TopLoc_SListNodeOfSListOfItemLocation::~TopLoc_SListNodeOfSListOfItemLocation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopLoc_SListNodeOfSListOfItemLocation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopLoc_SListNodeOfSListOfItemLocation {
	Handle_TopLoc_SListNodeOfSListOfItemLocation GetHandle() {
	return *(Handle_TopLoc_SListNodeOfSListOfItemLocation*) &$self;
	}
};

%nodefaultctor Handle_TopLoc_SListNodeOfSListOfItemLocation;
class Handle_TopLoc_SListNodeOfSListOfItemLocation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopLoc_SListNodeOfSListOfItemLocation();
        Handle_TopLoc_SListNodeOfSListOfItemLocation(const Handle_TopLoc_SListNodeOfSListOfItemLocation &aHandle);
        Handle_TopLoc_SListNodeOfSListOfItemLocation(const TopLoc_SListNodeOfSListOfItemLocation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopLoc_SListNodeOfSListOfItemLocation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopLoc_SListNodeOfSListOfItemLocation {
    TopLoc_SListNodeOfSListOfItemLocation* GetObject() {
    return (TopLoc_SListNodeOfSListOfItemLocation*)$self->Access();
    }
};
%feature("shadow") Handle_TopLoc_SListNodeOfSListOfItemLocation::~Handle_TopLoc_SListNodeOfSListOfItemLocation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopLoc_SListNodeOfSListOfItemLocation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopLoc_SListOfItemLocation;
class TopLoc_SListOfItemLocation {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation ();
		%feature("autodoc", "Args:
	anItem(TopLoc_ItemLocation)
	aTail(TopLoc_SListOfItemLocation)

Returns:
	None

No detailed docstring for this function.") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation (const TopLoc_ItemLocation & anItem,const TopLoc_SListOfItemLocation & aTail);
		%feature("autodoc", "Args:
	Other(TopLoc_SListOfItemLocation)

Returns:
	None

No detailed docstring for this function.") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation (const TopLoc_SListOfItemLocation & Other);
		%feature("autodoc", "Args:
	Other(TopLoc_SListOfItemLocation)

Returns:
	TopLoc_SListOfItemLocation

No detailed docstring for this function.") Assign;
		TopLoc_SListOfItemLocation & Assign (const TopLoc_SListOfItemLocation & Other);
		%feature("autodoc", "Args:
	Other(TopLoc_SListOfItemLocation)

Returns:
	TopLoc_SListOfItemLocation

No detailed docstring for this function.") operator=;
		TopLoc_SListOfItemLocation & operator = (const TopLoc_SListOfItemLocation & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_ItemLocation

No detailed docstring for this function.") Value;
		const TopLoc_ItemLocation & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_ItemLocation

No detailed docstring for this function.") ChangeValue;
		TopLoc_ItemLocation & ChangeValue ();
		%feature("autodoc", "Args:
	anItem(TopLoc_ItemLocation)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const TopLoc_ItemLocation & anItem);
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_SListOfItemLocation

No detailed docstring for this function.") Tail;
		const TopLoc_SListOfItemLocation & Tail ();
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_SListOfItemLocation

No detailed docstring for this function.") ChangeTail;
		TopLoc_SListOfItemLocation & ChangeTail ();
		%feature("autodoc", "Args:
	aList(TopLoc_SListOfItemLocation)

Returns:
	None

No detailed docstring for this function.") SetTail;
		void SetTail (const TopLoc_SListOfItemLocation & aList);
		%feature("autodoc", "Args:
	anItem(TopLoc_ItemLocation)

Returns:
	None

No detailed docstring for this function.") Construct;
		void Construct (const TopLoc_ItemLocation & anItem);
		%feature("autodoc", "Args:
	anItem(TopLoc_ItemLocation)

Returns:
	TopLoc_SListOfItemLocation

No detailed docstring for this function.") Constructed;
		TopLoc_SListOfItemLocation Constructed (const TopLoc_ItemLocation & anItem);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ToTail;
		void ToTail ();
		%feature("autodoc", "Args:
	aList(TopLoc_SListOfItemLocation)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopLoc_SListOfItemLocation & aList);
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
};


%feature("shadow") TopLoc_SListOfItemLocation::~TopLoc_SListOfItemLocation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopLoc_SListOfItemLocation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopLoc_StdMapNodeOfMapOfLocation;
class TopLoc_StdMapNodeOfMapOfLocation : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopLoc_Location)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopLoc_StdMapNodeOfMapOfLocation;
		 TopLoc_StdMapNodeOfMapOfLocation (const TopLoc_Location & K,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_Location

No detailed docstring for this function.") Key;
		TopLoc_Location & Key ();
};


%feature("shadow") TopLoc_StdMapNodeOfMapOfLocation::~TopLoc_StdMapNodeOfMapOfLocation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopLoc_StdMapNodeOfMapOfLocation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopLoc_StdMapNodeOfMapOfLocation {
	Handle_TopLoc_StdMapNodeOfMapOfLocation GetHandle() {
	return *(Handle_TopLoc_StdMapNodeOfMapOfLocation*) &$self;
	}
};

%nodefaultctor Handle_TopLoc_StdMapNodeOfMapOfLocation;
class Handle_TopLoc_StdMapNodeOfMapOfLocation : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopLoc_StdMapNodeOfMapOfLocation();
        Handle_TopLoc_StdMapNodeOfMapOfLocation(const Handle_TopLoc_StdMapNodeOfMapOfLocation &aHandle);
        Handle_TopLoc_StdMapNodeOfMapOfLocation(const TopLoc_StdMapNodeOfMapOfLocation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopLoc_StdMapNodeOfMapOfLocation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopLoc_StdMapNodeOfMapOfLocation {
    TopLoc_StdMapNodeOfMapOfLocation* GetObject() {
    return (TopLoc_StdMapNodeOfMapOfLocation*)$self->Access();
    }
};
%feature("shadow") Handle_TopLoc_StdMapNodeOfMapOfLocation::~Handle_TopLoc_StdMapNodeOfMapOfLocation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopLoc_StdMapNodeOfMapOfLocation {
    void _kill_pointed() {
        delete $self;
    }
};

