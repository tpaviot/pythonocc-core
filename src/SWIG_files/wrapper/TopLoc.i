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
%module (package="OCC") TopLoc

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


%include TopLoc_headers.i


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

%nodefaultctor TopLoc_Datum3D;
class TopLoc_Datum3D : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TopLoc_Datum3D;
		%feature("autodoc", "	* Constructs a default Datum3D.

	:rtype: None
") TopLoc_Datum3D;
		 TopLoc_Datum3D ();
		%feature("compactdefaultargs") TopLoc_Datum3D;
		%feature("autodoc", "	* Constructs a Datum3D form a Trsf from gp. An error is raised if the Trsf is not a rigid transformation.

	:param T:
	:type T: gp_Trsf
	:rtype: None
") TopLoc_Datum3D;
		 TopLoc_Datum3D (const gp_Trsf & T);
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "	* Returns a gp_Trsf which, when applied to this datum, produces the default datum.

	:rtype: gp_Trsf
") Transformation;
		const gp_Trsf  Transformation ();

        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
        };


%extend TopLoc_Datum3D {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopLoc_Datum3D(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopLoc_Datum3D::Handle_TopLoc_Datum3D %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopLoc_Datum3D* _get_reference() {
    return (TopLoc_Datum3D*)$self->Access();
    }
};

%extend Handle_TopLoc_Datum3D {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopLoc_Datum3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopLoc_IndexedMapNodeOfIndexedMapOfLocation;
class TopLoc_IndexedMapNodeOfIndexedMapOfLocation : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopLoc_IndexedMapNodeOfIndexedMapOfLocation;
		%feature("autodoc", "	:param K1:
	:type K1: TopLoc_Location &
	:param K2:
	:type K2: int
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopLoc_IndexedMapNodeOfIndexedMapOfLocation;
		 TopLoc_IndexedMapNodeOfIndexedMapOfLocation (const TopLoc_Location & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
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
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend TopLoc_IndexedMapNodeOfIndexedMapOfLocation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation::Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopLoc_IndexedMapNodeOfIndexedMapOfLocation* _get_reference() {
    return (TopLoc_IndexedMapNodeOfIndexedMapOfLocation*)$self->Access();
    }
};

%extend Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopLoc_IndexedMapNodeOfIndexedMapOfLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopLoc_IndexedMapOfLocation;
class TopLoc_IndexedMapOfLocation : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopLoc_IndexedMapOfLocation;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopLoc_IndexedMapOfLocation;
		 TopLoc_IndexedMapOfLocation (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TopLoc_IndexedMapOfLocation;
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_IndexedMapOfLocation &
	:rtype: None
") TopLoc_IndexedMapOfLocation;
		 TopLoc_IndexedMapOfLocation (const TopLoc_IndexedMapOfLocation & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_IndexedMapOfLocation &
	:rtype: TopLoc_IndexedMapOfLocation
") Assign;
		TopLoc_IndexedMapOfLocation & Assign (const TopLoc_IndexedMapOfLocation & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_IndexedMapOfLocation &
	:rtype: TopLoc_IndexedMapOfLocation
") operator =;
		TopLoc_IndexedMapOfLocation & operator = (const TopLoc_IndexedMapOfLocation & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: TopLoc_Location &
	:rtype: int
") Add;
		Standard_Integer Add (const TopLoc_Location & K);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: TopLoc_Location &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopLoc_Location & K);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: TopLoc_Location &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopLoc_Location & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopLoc_Location
") FindKey;
		const TopLoc_Location & FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: TopLoc_Location &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopLoc_Location & K);
};


%extend TopLoc_IndexedMapOfLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopLoc_ItemLocation;
class TopLoc_ItemLocation {
	public:
		%feature("compactdefaultargs") TopLoc_ItemLocation;
		%feature("autodoc", "	* Sets the elementary Datum to <D> Sets the exponent to <P>

	:param D:
	:type D: Handle_TopLoc_Datum3D &
	:param P:
	:type P: int
	:rtype: None
") TopLoc_ItemLocation;
		 TopLoc_ItemLocation (const Handle_TopLoc_Datum3D & D,const Standard_Integer P);
};


%extend TopLoc_ItemLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopLoc_Location;
class TopLoc_Location {
	public:
		%feature("compactdefaultargs") TopLoc_Location;
		%feature("autodoc", "	* Constructs an empty local coordinate system object. Note: A Location constructed from a default datum is said to be 'empty'.

	:rtype: None
") TopLoc_Location;
		 TopLoc_Location ();
		%feature("compactdefaultargs") TopLoc_Location;
		%feature("autodoc", "	* Constructs the local coordinate system object defined by the transformation T. T invokes in turn, a TopLoc_Datum3D object.

	:param T:
	:type T: gp_Trsf
	:rtype: None
") TopLoc_Location;
		 TopLoc_Location (const gp_Trsf & T);
		%feature("compactdefaultargs") TopLoc_Location;
		%feature("autodoc", "	* Constructs the local coordinate system object defined by the 3D datum D. Exceptions Standard_ConstructionError if the transformation T does not represent a 3D coordinate system.

	:param D:
	:type D: Handle_TopLoc_Datum3D &
	:rtype: None
") TopLoc_Location;
		 TopLoc_Location (const Handle_TopLoc_Datum3D & D);
		%feature("compactdefaultargs") IsIdentity;
		%feature("autodoc", "	* Returns true if this location is equal to the Identity transformation.

	:rtype: bool
") IsIdentity;
		Standard_Boolean IsIdentity ();
		%feature("compactdefaultargs") Identity;
		%feature("autodoc", "	* Resets this location to the Identity transformation.

	:rtype: None
") Identity;
		void Identity ();
		%feature("compactdefaultargs") FirstDatum;
		%feature("autodoc", "	* Returns the first elementary datum of the Location. Use the NextLocation function recursively to access the other data comprising this location. Exceptions Standard_NoSuchObject if this location is empty.

	:rtype: Handle_TopLoc_Datum3D
") FirstDatum;
		Handle_TopLoc_Datum3D FirstDatum ();
		%feature("compactdefaultargs") FirstPower;
		%feature("autodoc", "	* Returns the power elevation of the first elementary datum. Exceptions Standard_NoSuchObject if this location is empty.

	:rtype: int
") FirstPower;
		Standard_Integer FirstPower ();
		%feature("compactdefaultargs") NextLocation;
		%feature("autodoc", "	* Returns a Location representing <self> without the first datum. We have the relation : //! <self> = NextLocation() * FirstDatum() ^ FirstPower() Exceptions Standard_NoSuchObject if this location is empty.

	:rtype: TopLoc_Location
") NextLocation;
		const TopLoc_Location & NextLocation ();
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "	* Returns the transformation associated to the coordinate system.

	:rtype: gp_Trsf
") Transformation;
		const gp_Trsf  Transformation ();
		%feature("compactdefaultargs") operator gp_Trsf;
		%feature("autodoc", "	:rtype: 
") operator gp_Trsf;
		 operator gp_Trsf ();
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "	* Returns the inverse of <self>. //! <self> * Inverted() is an Identity.

	:rtype: TopLoc_Location
") Inverted;
		TopLoc_Location Inverted ();
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* Returns <self> * <Other>, the elementary datums are concatenated.

	:param Other:
	:type Other: TopLoc_Location &
	:rtype: TopLoc_Location
") Multiplied;
		TopLoc_Location Multiplied (const TopLoc_Location & Other);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_Location &
	:rtype: TopLoc_Location
") operator *;
		TopLoc_Location operator * (const TopLoc_Location & Other);
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "	* Returns <self> / <Other>.

	:param Other:
	:type Other: TopLoc_Location &
	:rtype: TopLoc_Location
") Divided;
		TopLoc_Location Divided (const TopLoc_Location & Other);
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_Location &
	:rtype: TopLoc_Location
") operator /;
		TopLoc_Location operator / (const TopLoc_Location & Other);
		%feature("compactdefaultargs") Predivided;
		%feature("autodoc", "	* Returns <Other>.Inverted() * <self>.

	:param Other:
	:type Other: TopLoc_Location &
	:rtype: TopLoc_Location
") Predivided;
		TopLoc_Location Predivided (const TopLoc_Location & Other);
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "	* Returns me at the power <pwr>. If <pwr> is zero returns Identity. <pwr> can be lower than zero (usual meaning for powers).

	:param pwr:
	:type pwr: int
	:rtype: TopLoc_Location
") Powered;
		TopLoc_Location Powered (const Standard_Integer pwr);
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Returns a hashed value for this local coordinate system. This value is used, with map tables, to store and retrieve the object easily, and is in the range [ 1..Upper ].

	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		Standard_Integer HashCode (const Standard_Integer Upper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("compactdefaultargs") IsEqual;
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
        		%feature("compactdefaultargs") IsDifferent;
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


%extend TopLoc_Location {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopLoc_MapIteratorOfMapOfLocation;
class TopLoc_MapIteratorOfMapOfLocation : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopLoc_MapIteratorOfMapOfLocation;
		%feature("autodoc", "	:rtype: None
") TopLoc_MapIteratorOfMapOfLocation;
		 TopLoc_MapIteratorOfMapOfLocation ();
		%feature("compactdefaultargs") TopLoc_MapIteratorOfMapOfLocation;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopLoc_MapOfLocation &
	:rtype: None
") TopLoc_MapIteratorOfMapOfLocation;
		 TopLoc_MapIteratorOfMapOfLocation (const TopLoc_MapOfLocation & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopLoc_MapOfLocation &
	:rtype: None
") Initialize;
		void Initialize (const TopLoc_MapOfLocation & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopLoc_Location
") Key;
		const TopLoc_Location & Key ();
};


%extend TopLoc_MapIteratorOfMapOfLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TopLoc_MapLocationHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param K:
	:type K: TopLoc_Location &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const TopLoc_Location & K,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param K1:
	:type K1: TopLoc_Location &
	:param K2:
	:type K2: TopLoc_Location &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const TopLoc_Location & K1,const TopLoc_Location & K2);
};


%extend TopLoc_MapLocationHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopLoc_MapOfLocation;
class TopLoc_MapOfLocation : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopLoc_MapOfLocation;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopLoc_MapOfLocation;
		 TopLoc_MapOfLocation (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TopLoc_MapOfLocation;
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_MapOfLocation &
	:rtype: None
") TopLoc_MapOfLocation;
		 TopLoc_MapOfLocation (const TopLoc_MapOfLocation & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_MapOfLocation &
	:rtype: TopLoc_MapOfLocation
") Assign;
		TopLoc_MapOfLocation & Assign (const TopLoc_MapOfLocation & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_MapOfLocation &
	:rtype: TopLoc_MapOfLocation
") operator =;
		TopLoc_MapOfLocation & operator = (const TopLoc_MapOfLocation & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param aKey:
	:type aKey: TopLoc_Location &
	:rtype: bool
") Add;
		Standard_Boolean Add (const TopLoc_Location & aKey);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param aKey:
	:type aKey: TopLoc_Location &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopLoc_Location & aKey);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aKey:
	:type aKey: TopLoc_Location &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const TopLoc_Location & aKey);
};


%extend TopLoc_MapOfLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopLoc_SListNodeOfItemLocation;
class TopLoc_SListNodeOfItemLocation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TopLoc_SListNodeOfItemLocation;
		%feature("autodoc", "	:param I:
	:type I: TopLoc_ItemLocation &
	:param aTail:
	:type aTail: TopLoc_SListOfItemLocation &
	:rtype: None
") TopLoc_SListNodeOfItemLocation;
		 TopLoc_SListNodeOfItemLocation (const TopLoc_ItemLocation & I,const TopLoc_SListOfItemLocation & aTail);
		%feature("compactdefaultargs") Tail;
		%feature("autodoc", "	:rtype: TopLoc_SListOfItemLocation
") Tail;
		TopLoc_SListOfItemLocation & Tail ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopLoc_ItemLocation
") Value;
		TopLoc_ItemLocation & Value ();
};


%extend TopLoc_SListNodeOfItemLocation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopLoc_SListNodeOfItemLocation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopLoc_SListNodeOfItemLocation::Handle_TopLoc_SListNodeOfItemLocation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopLoc_SListNodeOfItemLocation;
class Handle_TopLoc_SListNodeOfItemLocation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopLoc_SListNodeOfItemLocation();
        Handle_TopLoc_SListNodeOfItemLocation(const Handle_TopLoc_SListNodeOfItemLocation &aHandle);
        Handle_TopLoc_SListNodeOfItemLocation(const TopLoc_SListNodeOfItemLocation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopLoc_SListNodeOfItemLocation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopLoc_SListNodeOfItemLocation {
    TopLoc_SListNodeOfItemLocation* _get_reference() {
    return (TopLoc_SListNodeOfItemLocation*)$self->Access();
    }
};

%extend Handle_TopLoc_SListNodeOfItemLocation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopLoc_SListNodeOfItemLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopLoc_SListOfItemLocation;
class TopLoc_SListOfItemLocation {
	public:
		%feature("compactdefaultargs") TopLoc_SListOfItemLocation;
		%feature("autodoc", "	* Creates an empty List.

	:rtype: None
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation ();
		%feature("compactdefaultargs") TopLoc_SListOfItemLocation;
		%feature("autodoc", "	* Creates a List with <anItem> as value and <aTail> as tail.

	:param anItem:
	:type anItem: TopLoc_ItemLocation &
	:param aTail:
	:type aTail: TopLoc_SListOfItemLocation &
	:rtype: None
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation (const TopLoc_ItemLocation & anItem,const TopLoc_SListOfItemLocation & aTail);
		%feature("compactdefaultargs") TopLoc_SListOfItemLocation;
		%feature("autodoc", "	* Creates a list from an other one. The lists are shared.

	:param Other:
	:type Other: TopLoc_SListOfItemLocation &
	:rtype: None
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation (const TopLoc_SListOfItemLocation & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	* Sets a list from an other one. The lists are shared. The list itself is returned.

	:param Other:
	:type Other: TopLoc_SListOfItemLocation &
	:rtype: TopLoc_SListOfItemLocation
") Assign;
		TopLoc_SListOfItemLocation & Assign (const TopLoc_SListOfItemLocation & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_SListOfItemLocation &
	:rtype: TopLoc_SListOfItemLocation
") operator =;
		TopLoc_SListOfItemLocation & operator = (const TopLoc_SListOfItemLocation & Other);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Sets the list to be empty.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current value of the list. An error is raised if the list is empty.

	:rtype: TopLoc_ItemLocation
") Value;
		const TopLoc_ItemLocation & Value ();
		%feature("compactdefaultargs") Tail;
		%feature("autodoc", "	* Returns the current tail of the list. On an empty list the tail is the list itself.

	:rtype: TopLoc_SListOfItemLocation
") Tail;
		const TopLoc_SListOfItemLocation & Tail ();
		%feature("compactdefaultargs") Construct;
		%feature("autodoc", "	* Replaces the list by a list with <anItem> as Value and the list <self> as tail.

	:param anItem:
	:type anItem: TopLoc_ItemLocation &
	:rtype: None
") Construct;
		void Construct (const TopLoc_ItemLocation & anItem);
		%feature("compactdefaultargs") ToTail;
		%feature("autodoc", "	* Replaces the list <self> by its tail.

	:rtype: None
") ToTail;
		void ToTail ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True if the iterator has a current value. This is !IsEmpty()

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Moves the iterator to the next object in the list. If the iterator is empty it will stay empty. This is ToTail()

	:rtype: None
") Next;
		void Next ();
};


%extend TopLoc_SListOfItemLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopLoc_StdMapNodeOfMapOfLocation;
class TopLoc_StdMapNodeOfMapOfLocation : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopLoc_StdMapNodeOfMapOfLocation;
		%feature("autodoc", "	:param K:
	:type K: TopLoc_Location &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopLoc_StdMapNodeOfMapOfLocation;
		 TopLoc_StdMapNodeOfMapOfLocation (const TopLoc_Location & K,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopLoc_Location
") Key;
		TopLoc_Location & Key ();
};


%extend TopLoc_StdMapNodeOfMapOfLocation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopLoc_StdMapNodeOfMapOfLocation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopLoc_StdMapNodeOfMapOfLocation::Handle_TopLoc_StdMapNodeOfMapOfLocation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopLoc_StdMapNodeOfMapOfLocation* _get_reference() {
    return (TopLoc_StdMapNodeOfMapOfLocation*)$self->Access();
    }
};

%extend Handle_TopLoc_StdMapNodeOfMapOfLocation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopLoc_StdMapNodeOfMapOfLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
