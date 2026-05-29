/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
"TopLoc module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_toploc.html"
%enddef
%module (package="OCC.Core", docstring=TOPLOCDOCSTRING) TopLoc


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<TopLoc_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TopLoc_Datum3D)
%wrap_handle(TopLoc_SListNodeOfItemLocation)
/* end handles declaration */

/* templates */
%ignore NCollection_IndexedMap<TopLoc_Location>::Items;
%ignore NCollection_IndexedMap<TopLoc_Location>::KeyValues;
%ignore NCollection_IndexedMap<TopLoc_Location>::IndexedItems;
%ignore NCollection_IndexedMap<TopLoc_Location>::Contained;
%template(TopLoc_IndexedMapOfLocation) NCollection_IndexedMap<TopLoc_Location>;
%template(TopLoc_MapOfLocation) NCollection_Map<TopLoc_Location>;
/* end templates declaration */

/* typedefs */
typedef NCollection_IndexedMap<TopLoc_Location> TopLoc_IndexedMapOfLocation;
typedef NCollection_Map<TopLoc_Location>::Iterator TopLoc_MapIteratorOfMapOfLocation;
typedef NCollection_Map<TopLoc_Location> TopLoc_MapOfLocation;
/* end typedefs declaration */

/***********************
* class TopLoc_Datum3D *
***********************/
class TopLoc_Datum3D : public Standard_Transient {
	public:
		/****** TopLoc_Datum3D::TopLoc_Datum3D ******/
		/****** md5 signature: 1d9af424841282be97f56a59eaf4f68a ******/
		%feature("compactdefaultargs") TopLoc_Datum3D;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs a default Datum3D.
") TopLoc_Datum3D;
		 TopLoc_Datum3D();

		/****** TopLoc_Datum3D::TopLoc_Datum3D ******/
		/****** md5 signature: 67fd7309ab6c3f86fd2f849c40410bca ******/
		%feature("compactdefaultargs") TopLoc_Datum3D;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Constructs a Datum3D form a Trsf from gp. An error is raised if the Trsf is not a rigid transformation.
") TopLoc_Datum3D;
		 TopLoc_Datum3D(const gp_Trsf & T);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TopLoc_Datum3D::Form ******/
		/****** md5 signature: f29bb1eb1523b456c279366338ab9947 ******/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Return
-------
gp_TrsfForm

Description
-----------
Return transformation form.
") Form;
		gp_TrsfForm Form();

		/****** TopLoc_Datum3D::ShallowDump ******/
		/****** md5 signature: becb37fcb2ae0b90bde25605537706e5 ******/
		%feature("compactdefaultargs") ShallowDump;
		%feature("autodoc", "
Parameters
----------

Return
-------
S: Standard_OStream

Description
-----------
Writes the contents of this Datum3D to the stream S.
") ShallowDump;
		void ShallowDump(std::ostream &OutValue);

		/****** TopLoc_Datum3D::Transformation ******/
		/****** md5 signature: 4340f0c35d6856faf6f9daeca03f9595 ******/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns a gp_Trsf which, when applied to this datum, produces the default datum.
") Transformation;
		const gp_Trsf Transformation();

		/****** TopLoc_Datum3D::Trsf ******/
		/****** md5 signature: 994369af5cf027a69090540425b26b58 ******/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns a gp_Trsf which, when applied to this datum, produces the default datum.
") Trsf;
		const gp_Trsf Trsf();

};


%make_alias(TopLoc_Datum3D)

%extend TopLoc_Datum3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopLoc_ItemLocation *
****************************/
class TopLoc_ItemLocation {
	public:
		/****** TopLoc_ItemLocation::TopLoc_ItemLocation ******/
		/****** md5 signature: 96e3bb32545d2e9085fcd3eaba22ac9a ******/
		%feature("compactdefaultargs") TopLoc_ItemLocation;
		%feature("autodoc", "
Parameters
----------
D: TopLoc_Datum3D
P: int

Return
-------
None

Description
-----------
Sets the elementary Datum to <D> Sets the exponent to <P>.
") TopLoc_ItemLocation;
		 TopLoc_ItemLocation(const opencascade::handle<TopLoc_Datum3D> & D, const int P);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
};


%extend TopLoc_ItemLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TopLoc_Location *
************************/
class TopLoc_Location {
	public:
		/****** TopLoc_Location::TopLoc_Location ******/
		/****** md5 signature: 629849c6406c878d579cc13a52514cc1 ******/
		%feature("compactdefaultargs") TopLoc_Location;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty local coordinate system object. Note: A Location constructed from a default datum is said to be 'empty'.
") TopLoc_Location;
		 TopLoc_Location();

		/****** TopLoc_Location::TopLoc_Location ******/
		/****** md5 signature: 924653b3d2fe2b76aa03be18bdc788ad ******/
		%feature("compactdefaultargs") TopLoc_Location;
		%feature("autodoc", "
Parameters
----------
theOther: TopLoc_Location

Return
-------
None

Description
-----------
Copy constructor.
") TopLoc_Location;
		 TopLoc_Location(const TopLoc_Location & theOther);

		/****** TopLoc_Location::TopLoc_Location ******/
		/****** md5 signature: 720edddffc68189c9c11cc9afe04b29c ******/
		%feature("compactdefaultargs") TopLoc_Location;
		%feature("autodoc", "
Parameters
----------
theOther: TopLoc_Location

Return
-------
None

Description
-----------
Move constructor.
") TopLoc_Location;
		 TopLoc_Location(TopLoc_Location & theOther);

		/****** TopLoc_Location::TopLoc_Location ******/
		/****** md5 signature: 6a2d975754aeaf7f3ab3682581acce4a ******/
		%feature("compactdefaultargs") TopLoc_Location;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Constructs the local coordinate system object defined by the transformation T. T invokes in turn, a TopLoc_Datum3D object.
") TopLoc_Location;
		 TopLoc_Location(const gp_Trsf & T);

		/****** TopLoc_Location::TopLoc_Location ******/
		/****** md5 signature: 4ba013c4ed401fb40b4ab443b70dfa68 ******/
		%feature("compactdefaultargs") TopLoc_Location;
		%feature("autodoc", "
Parameters
----------
D: TopLoc_Datum3D

Return
-------
None

Description
-----------
Constructs the local coordinate system object defined by the 3D datum D. Exceptions Standard_ConstructionError if the transformation T does not represent a 3D coordinate system.
") TopLoc_Location;
		 TopLoc_Location(const opencascade::handle<TopLoc_Datum3D> & D);

		/****** TopLoc_Location::Clear ******/
		/****** md5 signature: f94ced5490d98e5d60224bef6de49d38 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear myItems.
") Clear;
		void Clear();

		/****** TopLoc_Location::Divided ******/
		/****** md5 signature: 571315f932ca7f258a4732378a5c6f52 ******/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
Other: TopLoc_Location

Return
-------
TopLoc_Location

Description
-----------
Returns <self> / <Other>.
") Divided;
		TopLoc_Location Divided(const TopLoc_Location & Other);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** TopLoc_Location::FirstDatum ******/
		/****** md5 signature: 6cdca59f5ca5329a1b7dd3455c8d5c55 ******/
		%feature("compactdefaultargs") FirstDatum;
		%feature("autodoc", "Return
-------
opencascade::handle<TopLoc_Datum3D>

Description
-----------
Returns the first elementary datum of the Location. Use the NextLocation function recursively to access the other data comprising this location. Exceptions Standard_NoSuchObject if this location is empty.
") FirstDatum;
		const opencascade::handle<TopLoc_Datum3D> & FirstDatum();

		/****** TopLoc_Location::FirstPower ******/
		/****** md5 signature: 382d87c09f4a02429a528288baab71cf ******/
		%feature("compactdefaultargs") FirstPower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the power elevation of the first elementary datum. Exceptions Standard_NoSuchObject if this location is empty.
") FirstPower;
		int FirstPower();

		/****** TopLoc_Location::HashCode ******/
		/****** md5 signature: e6d33518f6ceb2746b64a927df545aed ******/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Returns a hashed value for this local coordinate system. This value is used, with map tables, to store and retrieve the object easily 
Return: a computed hash code.
") HashCode;
		size_t HashCode();

		/****** TopLoc_Location::Identity ******/
		/****** md5 signature: 1f0eff03c9cfaa24804ec08851807008 ******/
		%feature("compactdefaultargs") Identity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets this location to the Identity transformation.
") Identity;
		void Identity();

		/****** TopLoc_Location::Inverted ******/
		/****** md5 signature: d2be847fc61d9991ad192487683aec6d ******/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
Returns the inverse of <self>. //! <self> * Inverted() is an Identity.
") Inverted;
		TopLoc_Location Inverted();

		/****** TopLoc_Location::IsDifferent ******/
		/****** md5 signature: d3fecf8d4ee4f3ea397949494d6d4d1a ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
theOther: TopLoc_Location

Return
-------
bool

Description
-----------
Returns true if this location and the location Other do not have the same elementary data, i.e. do not contain the same series of TopLoc_Datum3D and respective powers. This method is an alias for operator !=.
") IsDifferent;
		bool IsDifferent(const TopLoc_Location & theOther);

		/****** TopLoc_Location::IsEqual ******/
		/****** md5 signature: 84fe41995192aebb611dfe059377c1ec ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: TopLoc_Location

Return
-------
bool

Description
-----------
Returns true if this location and the location Other have the same elementary data, i.e. contain the same series of TopLoc_Datum3D and respective powers. This method is an alias for operator ==.
") IsEqual;
		bool IsEqual(const TopLoc_Location & theOther);

		/****** TopLoc_Location::IsIdentity ******/
		/****** md5 signature: 3d3140142042fb87cb739204e54e7ee9 ******/
		%feature("compactdefaultargs") IsIdentity;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this location is equal to the Identity transformation.
") IsIdentity;
		bool IsIdentity();

		/****** TopLoc_Location::Multiplied ******/
		/****** md5 signature: d0ab0a5bc6e645b7631dc956217bbac6 ******/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
Other: TopLoc_Location

Return
-------
TopLoc_Location

Description
-----------
Returns <self> * <Other>, the elementary datums are concatenated.
") Multiplied;
		TopLoc_Location Multiplied(const TopLoc_Location & Other);

		/****** TopLoc_Location::NextLocation ******/
		/****** md5 signature: 4f43a28215f9c657f15c65e6ea8d59ca ******/
		%feature("compactdefaultargs") NextLocation;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
Returns a Location representing <self> without the first datum. We have the relation: //! <self> = NextLocation() * FirstDatum() ^ FirstPower() Exceptions Standard_NoSuchObject if this location is empty.
") NextLocation;
		const TopLoc_Location & NextLocation();

		/****** TopLoc_Location::Powered ******/
		/****** md5 signature: a13c87762b94e3afabe1409d5809c520 ******/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "
Parameters
----------
pwr: int

Return
-------
TopLoc_Location

Description
-----------
Returns me at the power <pwr>. If <pwr> is zero returns Identity. <pwr> can be lower than zero (usual meaning for powers).
") Powered;
		TopLoc_Location Powered(const int pwr);

		/****** TopLoc_Location::Predivided ******/
		/****** md5 signature: 67db06b8cb24ea5e40aa828bd3c89dd1 ******/
		%feature("compactdefaultargs") Predivided;
		%feature("autodoc", "
Parameters
----------
Other: TopLoc_Location

Return
-------
TopLoc_Location

Description
-----------
Returns <Other>.Inverted() * <self>.
") Predivided;
		TopLoc_Location Predivided(const TopLoc_Location & Other);

		/****** TopLoc_Location::ScalePrec ******/
		/****** md5 signature: 817106cb55d2e7f8e1d3b6316d44cd32 ******/
		%feature("compactdefaultargs") ScalePrec;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ScalePrec;
		static double ScalePrec();

		/****** TopLoc_Location::ShallowDump ******/
		/****** md5 signature: becb37fcb2ae0b90bde25605537706e5 ******/
		%feature("compactdefaultargs") ShallowDump;
		%feature("autodoc", "
Parameters
----------

Return
-------
S: Standard_OStream

Description
-----------
Prints the contents of <self> on the stream <s>.
") ShallowDump;
		void ShallowDump(std::ostream &OutValue);

		/****** TopLoc_Location::Transformation ******/
		/****** md5 signature: 567e6ee373139970f4679dbb49e28e7c ******/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the transformation associated to the coordinate system.
") Transformation;
		const gp_Trsf Transformation();


%extend{
    bool __ne_wrapper__(const TopLoc_Location other) {
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
		/****** TopLoc_Location::operator * ******/
		/****** md5 signature: b914624702617b5c10e313c8e2b471b0 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
Other: TopLoc_Location

Return
-------
TopLoc_Location

Description
-----------
No available documentation.
") operator *;
		TopLoc_Location operator *(const TopLoc_Location & Other);

		/****** TopLoc_Location::operator / ******/
		/****** md5 signature: 9277faf09ff3df40bb288064b81b41f0 ******/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
Other: TopLoc_Location

Return
-------
TopLoc_Location

Description
-----------
No available documentation.
") operator /;
		TopLoc_Location operator /(const TopLoc_Location & Other);


%extend{
    bool __eq_wrapper__(const TopLoc_Location other) {
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
};


%extend TopLoc_Location {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class TopLoc_SListNodeOfItemLocation *
***************************************/
class TopLoc_SListNodeOfItemLocation : public Standard_Transient {
	public:
		/****** TopLoc_SListNodeOfItemLocation::TopLoc_SListNodeOfItemLocation ******/
		/****** md5 signature: 3b21f468f24329563bf05586a42c44dd ******/
		%feature("compactdefaultargs") TopLoc_SListNodeOfItemLocation;
		%feature("autodoc", "
Parameters
----------
I: TopLoc_ItemLocation
aTail: TopLoc_SListOfItemLocation

Return
-------
None

Description
-----------
No available documentation.
") TopLoc_SListNodeOfItemLocation;
		 TopLoc_SListNodeOfItemLocation(const TopLoc_ItemLocation & I, const TopLoc_SListOfItemLocation & aTail);

		/****** TopLoc_SListNodeOfItemLocation::Tail ******/
		/****** md5 signature: 57acbb7d348b766166feca29e69c216b ******/
		%feature("compactdefaultargs") Tail;
		%feature("autodoc", "Return
-------
TopLoc_SListOfItemLocation

Description
-----------
No available documentation.
") Tail;
		TopLoc_SListOfItemLocation & Tail();

		/****** TopLoc_SListNodeOfItemLocation::Value ******/
		/****** md5 signature: 8f7ce7cfd62ffb5a331e9ddc65a15b75 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopLoc_ItemLocation

Description
-----------
No available documentation.
") Value;
		TopLoc_ItemLocation & Value();

};


%make_alias(TopLoc_SListNodeOfItemLocation)

%extend TopLoc_SListNodeOfItemLocation {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Count(self):
		pass
	}
};

/***********************************
* class TopLoc_SListOfItemLocation *
***********************************/
class TopLoc_SListOfItemLocation {
	public:
		/****** TopLoc_SListOfItemLocation::TopLoc_SListOfItemLocation ******/
		/****** md5 signature: ff5ed5e968d2ae5348a2fc49425fee50 ******/
		%feature("compactdefaultargs") TopLoc_SListOfItemLocation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty List.
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation();

		/****** TopLoc_SListOfItemLocation::TopLoc_SListOfItemLocation ******/
		/****** md5 signature: d7323f87558e3534068a78b183434bcf ******/
		%feature("compactdefaultargs") TopLoc_SListOfItemLocation;
		%feature("autodoc", "
Parameters
----------
anItem: TopLoc_ItemLocation
aTail: TopLoc_SListOfItemLocation

Return
-------
None

Description
-----------
Creates a List with <anItem> as value and <aTail> as tail.
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation(const TopLoc_ItemLocation & anItem, const TopLoc_SListOfItemLocation & aTail);

		/****** TopLoc_SListOfItemLocation::TopLoc_SListOfItemLocation ******/
		/****** md5 signature: a56712eac99de26c80cd4912008d9e2d ******/
		%feature("compactdefaultargs") TopLoc_SListOfItemLocation;
		%feature("autodoc", "
Parameters
----------
Other: TopLoc_SListOfItemLocation

Return
-------
None

Description
-----------
Creates a list from an other one. The lists are shared.
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation(const TopLoc_SListOfItemLocation & Other);

		/****** TopLoc_SListOfItemLocation::TopLoc_SListOfItemLocation ******/
		/****** md5 signature: eb5e10c8bf2a8e0756a15294a08f1243 ******/
		%feature("compactdefaultargs") TopLoc_SListOfItemLocation;
		%feature("autodoc", "
Parameters
----------
theOther: TopLoc_SListOfItemLocation

Return
-------
None

Description
-----------
Move constructor.
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation(TopLoc_SListOfItemLocation & theOther);

		/****** TopLoc_SListOfItemLocation::Assign ******/
		/****** md5 signature: b5735fdd3d6cb7b6ceb4cfc062cd319b ******/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "
Parameters
----------
Other: TopLoc_SListOfItemLocation

Return
-------
TopLoc_SListOfItemLocation

Description
-----------
Sets a list from an other one. The lists are shared. The list itself is returned.
") Assign;
		TopLoc_SListOfItemLocation & Assign(const TopLoc_SListOfItemLocation & Other);

		/****** TopLoc_SListOfItemLocation::Clear ******/
		/****** md5 signature: f94ced5490d98e5d60224bef6de49d38 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the list to be empty.
") Clear;
		void Clear();

		/****** TopLoc_SListOfItemLocation::Construct ******/
		/****** md5 signature: 7c9d03bae6a7a364558f3a59d55a9f0b ******/
		%feature("compactdefaultargs") Construct;
		%feature("autodoc", "
Parameters
----------
anItem: TopLoc_ItemLocation

Return
-------
None

Description
-----------
Replaces the list by a list with <anItem> as Value and the list <self> as tail.
") Construct;
		void Construct(const TopLoc_ItemLocation & anItem);

		/****** TopLoc_SListOfItemLocation::IsEmpty ******/
		/****** md5 signature: 0b1729d7dd66450c10440a01fc8d63d2 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if this list is empty.
") IsEmpty;
		bool IsEmpty();

		/****** TopLoc_SListOfItemLocation::More ******/
		/****** md5 signature: 9e74877ec9fa81689f1de8f969e60d39 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the iterator has a current value. This is !IsEmpty().
") More;
		bool More();

		/****** TopLoc_SListOfItemLocation::Next ******/
		/****** md5 signature: 1201a55f750036045cd397a65f07fc7d ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Moves the iterator to the next object in the list. If the iterator is empty it will stay empty. This is ToTail().
") Next;
		void Next();

		/****** TopLoc_SListOfItemLocation::Tail ******/
		/****** md5 signature: 50fc348679ec04a9cc73c1820554ab0d ******/
		%feature("compactdefaultargs") Tail;
		%feature("autodoc", "Return
-------
TopLoc_SListOfItemLocation

Description
-----------
Returns the current tail of the list. On an empty list the tail is the list itself.
") Tail;
		const TopLoc_SListOfItemLocation & Tail();

		/****** TopLoc_SListOfItemLocation::ToTail ******/
		/****** md5 signature: 9bb28ab5d51fa8b8dab1e08bf2428cb5 ******/
		%feature("compactdefaultargs") ToTail;
		%feature("autodoc", "Return
-------
None

Description
-----------
Replaces the list <self> by its tail.
") ToTail;
		void ToTail();

		/****** TopLoc_SListOfItemLocation::Value ******/
		/****** md5 signature: c837b1119fc0a458b644c6dd6374aa3c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopLoc_ItemLocation

Description
-----------
Returns the current value of the list. An error is raised if the list is empty.
") Value;
		const TopLoc_ItemLocation & Value();

};


%extend TopLoc_SListOfItemLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def TopLoc_Location_ScalePrec(*args):
	return TopLoc_Location.ScalePrec(*args)

}
