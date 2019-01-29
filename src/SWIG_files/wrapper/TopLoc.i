/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)


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
%define TOPLOCDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=TOPLOCDOCSTRING) TopLoc

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%include TopLoc_headers.i

/* templates */
%template(TopLoc_MapOfLocation) NCollection_Map <TopLoc_Location , TopLoc_MapLocationHasher>;
%template(TopLoc_IndexedMapOfLocation) NCollection_IndexedMap <TopLoc_Location , TopLoc_MapLocationHasher>;
%template(TopLoc_MapLocationHasher) NCollection_DefaultHasher <TopLoc_Location>;
/* end templates declaration */


/* typedefs */
typedef NCollection_Map <TopLoc_Location , TopLoc_MapLocationHasher> TopLoc_MapOfLocation;
typedef NCollection_Map <TopLoc_Location , TopLoc_MapLocationHasher>::Iterator TopLoc_MapIteratorOfMapOfLocation;
typedef NCollection_IndexedMap <TopLoc_Location , TopLoc_MapLocationHasher> TopLoc_IndexedMapOfLocation;
typedef NCollection_DefaultHasher <TopLoc_Location> TopLoc_MapLocationHasher;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(TopLoc_Datum3D)
%wrap_handle(TopLoc_SListNodeOfItemLocation)

%nodefaultctor TopLoc_Datum3D;
class TopLoc_Datum3D : public Standard_Transient {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
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
};


%make_alias(TopLoc_Datum3D)

%extend TopLoc_Datum3D {
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
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "	* Returns <self> / <Other>.

	:param Other:
	:type Other: TopLoc_Location &
	:rtype: TopLoc_Location
") Divided;
		TopLoc_Location Divided (const TopLoc_Location & Other);
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
        		%feature("compactdefaultargs") Identity;
		%feature("autodoc", "	* Resets this location to the Identity transformation.

	:rtype: None
") Identity;
		void Identity ();
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "	* Returns the inverse of <self>. //! <self> * Inverted() is an Identity.

	:rtype: TopLoc_Location
") Inverted;
		TopLoc_Location Inverted ();
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "	* Returns true if this location and the location Other do not have the same elementary data, i.e. do not contain the same series of TopLoc_Datum3D and respective powers. This method is an alias for operator !=.

	:param Other:
	:type Other: TopLoc_Location &
	:rtype: bool
") IsDifferent;
		Standard_Boolean IsDifferent (const TopLoc_Location & Other);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns true if this location and the location Other have the same elementary data, i.e. contain the same series of TopLoc_Datum3D and respective powers. This method is an alias for operator ==.

	:param Other:
	:type Other: TopLoc_Location &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const TopLoc_Location & Other);
		%feature("compactdefaultargs") IsIdentity;
		%feature("autodoc", "	* Returns true if this location is equal to the Identity transformation.

	:rtype: bool
") IsIdentity;
		Standard_Boolean IsIdentity ();
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* Returns <self> * <Other>, the elementary datums are concatenated.

	:param Other:
	:type Other: TopLoc_Location &
	:rtype: TopLoc_Location
") Multiplied;
		TopLoc_Location Multiplied (const TopLoc_Location & Other);
		%feature("compactdefaultargs") NextLocation;
		%feature("autodoc", "	* Returns a Location representing <self> without the first datum. We have the relation : //! <self> = NextLocation() * FirstDatum() ^ FirstPower() Exceptions Standard_NoSuchObject if this location is empty.

	:rtype: TopLoc_Location
") NextLocation;
		const TopLoc_Location & NextLocation ();
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "	* Returns me at the power <pwr>. If <pwr> is zero returns Identity. <pwr> can be lower than zero (usual meaning for powers).

	:param pwr:
	:type pwr: int
	:rtype: TopLoc_Location
") Powered;
		TopLoc_Location Powered (const Standard_Integer pwr);
		%feature("compactdefaultargs") Predivided;
		%feature("autodoc", "	* Returns <Other>.Inverted() * <self>.

	:param Other:
	:type Other: TopLoc_Location &
	:rtype: TopLoc_Location
") Predivided;
		TopLoc_Location Predivided (const TopLoc_Location & Other);

        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "	* Returns the transformation associated to the coordinate system.

	:rtype: gp_Trsf
") Transformation;
		const gp_Trsf  Transformation ();

        %extend{
            bool __ne_wrapper__(const TopLoc_Location  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self, right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_Location &
	:rtype: TopLoc_Location
") operator *;
		TopLoc_Location operator * (const TopLoc_Location & Other);
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_Location &
	:rtype: TopLoc_Location
") operator /;
		TopLoc_Location operator / (const TopLoc_Location & Other);

        %extend{
            bool __eq_wrapper__(const TopLoc_Location  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("compactdefaultargs") operator gp_Trsf;
		%feature("autodoc", "	:rtype: 
") operator gp_Trsf;
		 operator gp_Trsf ();
};


%extend TopLoc_Location {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopLoc_SListNodeOfItemLocation;
class TopLoc_SListNodeOfItemLocation : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Tail;
		%feature("autodoc", "	:rtype: TopLoc_SListOfItemLocation
") Tail;
		TopLoc_SListOfItemLocation & Tail ();
		%feature("compactdefaultargs") TopLoc_SListNodeOfItemLocation;
		%feature("autodoc", "	:param I:
	:type I: TopLoc_ItemLocation &
	:param aTail:
	:type aTail: TopLoc_SListOfItemLocation &
	:rtype: None
") TopLoc_SListNodeOfItemLocation;
		 TopLoc_SListNodeOfItemLocation (const TopLoc_ItemLocation & I,const TopLoc_SListOfItemLocation & aTail);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopLoc_ItemLocation
") Value;
		TopLoc_ItemLocation & Value ();
};


%make_alias(TopLoc_SListNodeOfItemLocation)

%extend TopLoc_SListNodeOfItemLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopLoc_SListOfItemLocation;
class TopLoc_SListOfItemLocation {
	public:
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	* Sets a list from an other one. The lists are shared. The list itself is returned.

	:param Other:
	:type Other: TopLoc_SListOfItemLocation &
	:rtype: TopLoc_SListOfItemLocation
") Assign;
		TopLoc_SListOfItemLocation & Assign (const TopLoc_SListOfItemLocation & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Sets the list to be empty.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Construct;
		%feature("autodoc", "	* Replaces the list by a list with <anItem> as Value and the list <self> as tail.

	:param anItem:
	:type anItem: TopLoc_ItemLocation &
	:rtype: None
") Construct;
		void Construct (const TopLoc_ItemLocation & anItem);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
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
		%feature("compactdefaultargs") Tail;
		%feature("autodoc", "	* Returns the current tail of the list. On an empty list the tail is the list itself.

	:rtype: TopLoc_SListOfItemLocation
") Tail;
		const TopLoc_SListOfItemLocation & Tail ();
		%feature("compactdefaultargs") ToTail;
		%feature("autodoc", "	* Replaces the list <self> by its tail.

	:rtype: None
") ToTail;
		void ToTail ();
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
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current value of the list. An error is raised if the list is empty.

	:rtype: TopLoc_ItemLocation
") Value;
		const TopLoc_ItemLocation & Value ();
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_SListOfItemLocation &
	:rtype: TopLoc_SListOfItemLocation
") operator =;
		TopLoc_SListOfItemLocation & operator = (const TopLoc_SListOfItemLocation & Other);
};


%extend TopLoc_SListOfItemLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
