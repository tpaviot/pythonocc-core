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
		%feature("autodoc", "	* Constructs a default Datum3D.

	:rtype: None
") TopLoc_Datum3D;
		 TopLoc_Datum3D ();
		%feature("autodoc", "	* Constructs a Datum3D form a Trsf from gp. An error is raised if the Trsf is not a rigid transformation.

	:param T:
	:type T: gp_Trsf
	:rtype: None
") TopLoc_Datum3D;
		 TopLoc_Datum3D (const gp_Trsf & T);
		%feature("autodoc", "	* Returns a gp_Trsf which, when applied to this datum, produces the default datum.

	:rtype: gp_Trsf
") Transformation;
		const gp_Trsf & Transformation ();

        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	:param K1:
	:type K1: TopLoc_Location &
	:param K2:
	:type K2: Standard_Integer
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopLoc_IndexedMapNodeOfIndexedMapOfLocation;
		 TopLoc_IndexedMapNodeOfIndexedMapOfLocation (const TopLoc_Location & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "	:rtype: TopLoc_Location
") Key1;
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
            		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopLoc_IndexedMapOfLocation;
		 TopLoc_IndexedMapOfLocation (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_IndexedMapOfLocation &
	:rtype: TopLoc_IndexedMapOfLocation
") Assign;
		TopLoc_IndexedMapOfLocation & Assign (const TopLoc_IndexedMapOfLocation & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_IndexedMapOfLocation &
	:rtype: TopLoc_IndexedMapOfLocation
") operator=;
		TopLoc_IndexedMapOfLocation & operator = (const TopLoc_IndexedMapOfLocation & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopLoc_Location &
	:rtype: int
") Add;
		Standard_Integer Add (const TopLoc_Location & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param K:
	:type K: TopLoc_Location &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopLoc_Location & K);
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "	:param K:
	:type K: TopLoc_Location &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopLoc_Location & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopLoc_Location
") FindKey;
		const TopLoc_Location & FindKey (const Standard_Integer I);
		%feature("autodoc", "	:param K:
	:type K: TopLoc_Location &
	:rtype: int
") FindIndex;
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
		%feature("autodoc", "	* Sets the elementary Datum to <D> Sets the exponent to <P>

	:param D:
	:type D: Handle_TopLoc_Datum3D &
	:param P:
	:type P: Standard_Integer
	:param fromTrsf: default value is Standard_False
	:type fromTrsf: bool
	:rtype: None
") TopLoc_ItemLocation;
		 TopLoc_ItemLocation (const Handle_TopLoc_Datum3D & D,const Standard_Integer P,const Standard_Boolean fromTrsf = Standard_False);
		%feature("autodoc", "	:param anOther:
	:type anOther: TopLoc_ItemLocation &
	:rtype: None
") TopLoc_ItemLocation;
		 TopLoc_ItemLocation (const TopLoc_ItemLocation & anOther);
		%feature("autodoc", "	:param anOther:
	:type anOther: TopLoc_ItemLocation &
	:rtype: TopLoc_ItemLocation
") Assign;
		TopLoc_ItemLocation & Assign (const TopLoc_ItemLocation & anOther);
		%feature("autodoc", "	:param anOther:
	:type anOther: TopLoc_ItemLocation &
	:rtype: TopLoc_ItemLocation
") operator=;
		TopLoc_ItemLocation & operator = (const TopLoc_ItemLocation & anOther);
		%feature("autodoc", "	:rtype: None
") Destroy;
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
		%feature("autodoc", "	* Constructs an empty local coordinate system object. Note: A Location constructed from a default datum is said to be 'empty'.

	:rtype: None
") TopLoc_Location;
		 TopLoc_Location ();
		%feature("autodoc", "	* Constructs the local coordinate system object defined by the transformation T. T invokes in turn, a TopLoc_Datum3D object.

	:param T:
	:type T: gp_Trsf
	:rtype: None
") TopLoc_Location;
		 TopLoc_Location (const gp_Trsf & T);
		%feature("autodoc", "	* Constructs the local coordinate system object defined by the 3D datum D. Exceptions Standard_ConstructionError if the transformation T does not represent a 3D coordinate system.

	:param D:
	:type D: Handle_TopLoc_Datum3D &
	:rtype: None
") TopLoc_Location;
		 TopLoc_Location (const Handle_TopLoc_Datum3D & D);
		%feature("autodoc", "	* Returns true if this location is equal to the Identity transformation.

	:rtype: bool
") IsIdentity;
		Standard_Boolean IsIdentity ();
		%feature("autodoc", "	* Resets this location to the Identity transformation.

	:rtype: None
") Identity;
		void Identity ();
		%feature("autodoc", "	* Returns the first elementary datum of the Location. Use the NextLocation function recursively to access the other data comprising this location. Exceptions Standard_NoSuchObject if this location is empty.

	:rtype: Handle_TopLoc_Datum3D
") FirstDatum;
		const Handle_TopLoc_Datum3D & FirstDatum ();
		%feature("autodoc", "	* Returns the power elevation of the first elementary datum. Exceptions Standard_NoSuchObject if this location is empty.

	:rtype: int
") FirstPower;
		Standard_Integer FirstPower ();
		%feature("autodoc", "	* Returns a Location representing <self> without the first datum. We have the relation : <self> = NextLocation() * FirstDatum() ^ FirstPower() Exceptions Standard_NoSuchObject if this location is empty.

	:rtype: TopLoc_Location
") NextLocation;
		const TopLoc_Location & NextLocation ();
		%feature("autodoc", "	* Returns the transformation associated to the coordinate system.

	:rtype: gp_Trsf
") Transformation;
		const gp_Trsf & Transformation ();
		%feature("autodoc", "	:rtype: 
") operatorgp_Trsf;
		 operator gp_Trsf ();
		%feature("autodoc", "	* Returns the inverse of <self>.  <self> * Inverted() is an Identity.

	:rtype: TopLoc_Location
") Inverted;
		TopLoc_Location Inverted ();
		%feature("autodoc", "	* Returns <self> * <Other>, the elementary datums are concatenated.

	:param Other:
	:type Other: TopLoc_Location &
	:rtype: TopLoc_Location
") Multiplied;
		TopLoc_Location Multiplied (const TopLoc_Location & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_Location &
	:rtype: TopLoc_Location
") operator*;
		TopLoc_Location operator * (const TopLoc_Location & Other);
		%feature("autodoc", "	* Returns <self> / <Other>.

	:param Other:
	:type Other: TopLoc_Location &
	:rtype: TopLoc_Location
") Divided;
		TopLoc_Location Divided (const TopLoc_Location & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_Location &
	:rtype: TopLoc_Location
") operator/;
		TopLoc_Location operator / (const TopLoc_Location & Other);
		%feature("autodoc", "	* Returns <Other>.Inverted() * <self>.

	:param Other:
	:type Other: TopLoc_Location &
	:rtype: TopLoc_Location
") Predivided;
		TopLoc_Location Predivided (const TopLoc_Location & Other);
		%feature("autodoc", "	* Returns me at the power <pwr>. If <pwr> is zero returns Identity. <pwr> can be lower than zero (usual meaning for powers).

	:param pwr:
	:type pwr: Standard_Integer
	:rtype: TopLoc_Location
") Powered;
		TopLoc_Location Powered (const Standard_Integer pwr);
		%feature("autodoc", "	* Returns a hashed value for this local coordinate system. This value is used, with map tables, to store and retrieve the object easily, and is in the range [ 1..Upper ].

	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") HashCode;
		Standard_Integer HashCode (const Standard_Integer Upper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("autodoc", "	* Returns true if this location and the location Other have the same elementary data, i.e. contain the same series of TopLoc_Datum3D and respective powers. This method is an alias for operator ==.

	:param Other:
	:type Other: TopLoc_Location &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const TopLoc_Location & Other);

        %extend{
            bool __eq_wrapper__(const TopLoc_Location  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "	* Returns true if this location and the location Other do not have the same elementary data, i.e. do not contain the same series of TopLoc_Datum3D and respective powers. This method is an alias for operator !=.

	:param Other:
	:type Other: TopLoc_Location &
	:rtype: bool
") IsDifferent;
		Standard_Boolean IsDifferent (const TopLoc_Location & Other);

        %extend{
            bool __ne_wrapper__(const TopLoc_Location  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        
        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
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
		%feature("autodoc", "	:rtype: None
") TopLoc_MapIteratorOfMapOfLocation;
		 TopLoc_MapIteratorOfMapOfLocation ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopLoc_MapOfLocation &
	:rtype: None
") TopLoc_MapIteratorOfMapOfLocation;
		 TopLoc_MapIteratorOfMapOfLocation (const TopLoc_MapOfLocation & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopLoc_MapOfLocation &
	:rtype: None
") Initialize;
		void Initialize (const TopLoc_MapOfLocation & aMap);
		%feature("autodoc", "	:rtype: TopLoc_Location
") Key;
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
		%feature("autodoc", "	:param K:
	:type K: TopLoc_Location &
	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const TopLoc_Location & K,const Standard_Integer Upper);
		%feature("autodoc", "	:param K1:
	:type K1: TopLoc_Location &
	:param K2:
	:type K2: TopLoc_Location &
	:rtype: bool
") IsEqual;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopLoc_MapOfLocation;
		 TopLoc_MapOfLocation (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_MapOfLocation &
	:rtype: TopLoc_MapOfLocation
") Assign;
		TopLoc_MapOfLocation & Assign (const TopLoc_MapOfLocation & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_MapOfLocation &
	:rtype: TopLoc_MapOfLocation
") operator=;
		TopLoc_MapOfLocation & operator = (const TopLoc_MapOfLocation & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param aKey:
	:type aKey: TopLoc_Location &
	:rtype: bool
") Add;
		Standard_Boolean Add (const TopLoc_Location & aKey);
		%feature("autodoc", "	:param aKey:
	:type aKey: TopLoc_Location &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopLoc_Location & aKey);
		%feature("autodoc", "	:param aKey:
	:type aKey: TopLoc_Location &
	:rtype: bool
") Remove;
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
		%feature("autodoc", "	:param I:
	:type I: TopLoc_ItemLocation &
	:param aTail:
	:type aTail: TopLoc_SListOfItemLocation &
	:rtype: None
") TopLoc_SListNodeOfSListOfItemLocation;
		 TopLoc_SListNodeOfSListOfItemLocation (const TopLoc_ItemLocation & I,const TopLoc_SListOfItemLocation & aTail);
		%feature("autodoc", "	:rtype: TopLoc_SListOfItemLocation
") Tail;
		TopLoc_SListOfItemLocation & Tail ();
		%feature("autodoc", "	:rtype: TopLoc_ItemLocation
") Value;
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
		%feature("autodoc", "	:rtype: None
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation ();
		%feature("autodoc", "	:param anItem:
	:type anItem: TopLoc_ItemLocation &
	:param aTail:
	:type aTail: TopLoc_SListOfItemLocation &
	:rtype: None
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation (const TopLoc_ItemLocation & anItem,const TopLoc_SListOfItemLocation & aTail);
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_SListOfItemLocation &
	:rtype: None
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation (const TopLoc_SListOfItemLocation & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_SListOfItemLocation &
	:rtype: TopLoc_SListOfItemLocation
") Assign;
		TopLoc_SListOfItemLocation & Assign (const TopLoc_SListOfItemLocation & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_SListOfItemLocation &
	:rtype: TopLoc_SListOfItemLocation
") operator=;
		TopLoc_SListOfItemLocation & operator = (const TopLoc_SListOfItemLocation & Other);
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: TopLoc_ItemLocation
") Value;
		const TopLoc_ItemLocation & Value ();
		%feature("autodoc", "	:rtype: TopLoc_ItemLocation
") ChangeValue;
		TopLoc_ItemLocation & ChangeValue ();
		%feature("autodoc", "	:param anItem:
	:type anItem: TopLoc_ItemLocation &
	:rtype: None
") SetValue;
		void SetValue (const TopLoc_ItemLocation & anItem);
		%feature("autodoc", "	:rtype: TopLoc_SListOfItemLocation
") Tail;
		const TopLoc_SListOfItemLocation & Tail ();
		%feature("autodoc", "	:rtype: TopLoc_SListOfItemLocation
") ChangeTail;
		TopLoc_SListOfItemLocation & ChangeTail ();
		%feature("autodoc", "	:param aList:
	:type aList: TopLoc_SListOfItemLocation &
	:rtype: None
") SetTail;
		void SetTail (const TopLoc_SListOfItemLocation & aList);
		%feature("autodoc", "	:param anItem:
	:type anItem: TopLoc_ItemLocation &
	:rtype: None
") Construct;
		void Construct (const TopLoc_ItemLocation & anItem);
		%feature("autodoc", "	:param anItem:
	:type anItem: TopLoc_ItemLocation &
	:rtype: TopLoc_SListOfItemLocation
") Constructed;
		TopLoc_SListOfItemLocation Constructed (const TopLoc_ItemLocation & anItem);
		%feature("autodoc", "	:rtype: None
") ToTail;
		void ToTail ();
		%feature("autodoc", "	:param aList:
	:type aList: TopLoc_SListOfItemLocation &
	:rtype: None
") Initialize;
		void Initialize (const TopLoc_SListOfItemLocation & aList);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
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
		%feature("autodoc", "	:param K:
	:type K: TopLoc_Location &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopLoc_StdMapNodeOfMapOfLocation;
		 TopLoc_StdMapNodeOfMapOfLocation (const TopLoc_Location & K,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopLoc_Location
") Key;
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

