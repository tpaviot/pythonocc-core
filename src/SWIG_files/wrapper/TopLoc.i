/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.7.0/refman/html/package_toploc.html"
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
%template(TopLoc_IndexedMapOfLocation) NCollection_IndexedMap<TopLoc_Location,TopLoc_MapLocationHasher>;
%template(TopLoc_MapLocationHasher) NCollection_DefaultHasher<TopLoc_Location>;
%template(TopLoc_MapOfLocation) NCollection_Map<TopLoc_Location,TopLoc_MapLocationHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_IndexedMap<TopLoc_Location, TopLoc_MapLocationHasher> TopLoc_IndexedMapOfLocation;
typedef NCollection_Map<TopLoc_Location, TopLoc_MapLocationHasher>::Iterator TopLoc_MapIteratorOfMapOfLocation;
typedef NCollection_DefaultHasher<TopLoc_Location> TopLoc_MapLocationHasher;
typedef NCollection_Map<TopLoc_Location, TopLoc_MapLocationHasher> TopLoc_MapOfLocation;
/* end typedefs declaration */

/***********************
* class TopLoc_Datum3D *
***********************/
class TopLoc_Datum3D : public Standard_Transient {
	public:
		/****************** TopLoc_Datum3D ******************/
		/**** md5 signature: 1d9af424841282be97f56a59eaf4f68a ****/
		%feature("compactdefaultargs") TopLoc_Datum3D;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs a default datum3d.
") TopLoc_Datum3D;
		 TopLoc_Datum3D();

		/****************** TopLoc_Datum3D ******************/
		/**** md5 signature: 67fd7309ab6c3f86fd2f849c40410bca ****/
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
Constructs a datum3d form a trsf from gp. an error is raised if the trsf is not a rigid transformation.
") TopLoc_Datum3D;
		 TopLoc_Datum3D(const gp_Trsf & T);


        /****************** DumpJsonToString ******************/
        %feature("autodoc", "Json string serializer.");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****************** Form ******************/
		/**** md5 signature: f29bb1eb1523b456c279366338ab9947 ****/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Return
-------
gp_TrsfForm

Description
-----------
Return transformation form.
") Form;
		gp_TrsfForm Form();


        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
		/****************** Transformation ******************/
		/**** md5 signature: 4340f0c35d6856faf6f9daeca03f9595 ****/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns a gp_trsf which, when applied to this datum, produces the default datum.
") Transformation;
		const gp_Trsf Transformation();

		/****************** Trsf ******************/
		/**** md5 signature: 994369af5cf027a69090540425b26b58 ****/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns a gp_trsf which, when applied to this datum, produces the default datum.
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
		/****************** TopLoc_ItemLocation ******************/
		/**** md5 signature: 44c00ea25ac3b4105c24f296cc1b3fc5 ****/
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
Sets the elementary datum to <d> sets the exponent to <p>.
") TopLoc_ItemLocation;
		 TopLoc_ItemLocation(const opencascade::handle<TopLoc_Datum3D> & D, const Standard_Integer P);


        /****************** DumpJsonToString ******************/
        %feature("autodoc", "Json string serializer.");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
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
		/****************** TopLoc_Location ******************/
		/**** md5 signature: 93aa6734becd0bf9185b7e3b2c2b00c9 ****/
		%feature("compactdefaultargs") TopLoc_Location;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty local coordinate system object. note: a location constructed from a default datum is said to be 'empty'.
") TopLoc_Location;
		 TopLoc_Location();

		/****************** TopLoc_Location ******************/
		/**** md5 signature: 6a2d975754aeaf7f3ab3682581acce4a ****/
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
Constructs the local coordinate system object defined by the transformation t. t invokes in turn, a toploc_datum3d object.
") TopLoc_Location;
		 TopLoc_Location(const gp_Trsf & T);

		/****************** TopLoc_Location ******************/
		/**** md5 signature: 4ba013c4ed401fb40b4ab443b70dfa68 ****/
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
Constructs the local coordinate system object defined by the 3d datum d. exceptions standard_constructionerror if the transformation t does not represent a 3d coordinate system.
") TopLoc_Location;
		 TopLoc_Location(const opencascade::handle<TopLoc_Datum3D> & D);

		/****************** Clear ******************/
		/**** md5 signature: 75abd67f132413fc11c19201aabf1126 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear myitems.
") Clear;
		void Clear();

		/****************** Divided ******************/
		/**** md5 signature: 571315f932ca7f258a4732378a5c6f52 ****/
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
Returns <self> / <other>.
") Divided;
		TopLoc_Location Divided(const TopLoc_Location & Other);


        /****************** DumpJsonToString ******************/
        %feature("autodoc", "Json string serializer.");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****************** FirstDatum ******************/
		/**** md5 signature: 6cdca59f5ca5329a1b7dd3455c8d5c55 ****/
		%feature("compactdefaultargs") FirstDatum;
		%feature("autodoc", "Return
-------
opencascade::handle<TopLoc_Datum3D>

Description
-----------
Returns the first elementary datum of the location. use the nextlocation function recursively to access the other data comprising this location. exceptions standard_nosuchobject if this location is empty.
") FirstDatum;
		const opencascade::handle<TopLoc_Datum3D> & FirstDatum();

		/****************** FirstPower ******************/
		/**** md5 signature: f82e700978233be4257ee703ac848471 ****/
		%feature("compactdefaultargs") FirstPower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the power elevation of the first elementary datum. exceptions standard_nosuchobject if this location is empty.
") FirstPower;
		Standard_Integer FirstPower();

		/****************** HashCode ******************/
		/**** md5 signature: 63d1f963e092468b3b680fe64f4cfd8b ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "
Parameters
----------
theUpperBound: int

Return
-------
int

Description
-----------
Returns a hashed value for this local coordinate system. this value is used, with map tables, to store and retrieve the object easily, and is in the range [1, theupperbound]. @param theupperbound the upper bound of the range a computing hash code must be within return a computed hash code, in the range [1, theupperbound].
") HashCode;
		Standard_Integer HashCode(Standard_Integer theUpperBound);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };

		/****************** Identity ******************/
		/**** md5 signature: 64fc51a3ba989a9b1d65ef638ba90638 ****/
		%feature("compactdefaultargs") Identity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets this location to the identity transformation.
") Identity;
		void Identity();

		/****************** Inverted ******************/
		/**** md5 signature: d2be847fc61d9991ad192487683aec6d ****/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
Returns the inverse of <self>. //! <self> * inverted() is an identity.
") Inverted;
		TopLoc_Location Inverted();

		/****************** IsDifferent ******************/
		/**** md5 signature: 3d18eb241535f19435a69a497e59d20d ****/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
Other: TopLoc_Location

Return
-------
bool

Description
-----------
Returns true if this location and the location other do not have the same elementary data, i.e. do not contain the same series of toploc_datum3d and respective powers. this method is an alias for operator !=.
") IsDifferent;
		Standard_Boolean IsDifferent(const TopLoc_Location & Other);

		/****************** IsEqual ******************/
		/**** md5 signature: f2932b5badcf39895fb716ab41db8b77 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
Other: TopLoc_Location

Return
-------
bool

Description
-----------
Returns true if this location and the location other have the same elementary data, i.e. contain the same series of toploc_datum3d and respective powers. this method is an alias for operator ==.
") IsEqual;
		Standard_Boolean IsEqual(const TopLoc_Location & Other);

		/****************** IsIdentity ******************/
		/**** md5 signature: c38f0e0f7a13209171f4210bc9ad93d3 ****/
		%feature("compactdefaultargs") IsIdentity;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this location is equal to the identity transformation.
") IsIdentity;
		Standard_Boolean IsIdentity();

		/****************** Multiplied ******************/
		/**** md5 signature: d0ab0a5bc6e645b7631dc956217bbac6 ****/
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
Returns <self> * <other>, the elementary datums are concatenated.
") Multiplied;
		TopLoc_Location Multiplied(const TopLoc_Location & Other);

		/****************** NextLocation ******************/
		/**** md5 signature: 4f43a28215f9c657f15c65e6ea8d59ca ****/
		%feature("compactdefaultargs") NextLocation;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
Returns a location representing <self> without the first datum. we have the relation: //! <self> = nextlocation() * firstdatum() ^ firstpower() exceptions standard_nosuchobject if this location is empty.
") NextLocation;
		const TopLoc_Location & NextLocation();

		/****************** Powered ******************/
		/**** md5 signature: 2aeb53c5ab1b0e7282c2ac03730989fc ****/
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
Returns me at the power <pwr>. if <pwr> is zero returns identity. <pwr> can be lower than zero (usual meaning for powers).
") Powered;
		TopLoc_Location Powered(const Standard_Integer pwr);

		/****************** Predivided ******************/
		/**** md5 signature: 67db06b8cb24ea5e40aa828bd3c89dd1 ****/
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
Returns <other>.inverted() * <self>.
") Predivided;
		TopLoc_Location Predivided(const TopLoc_Location & Other);

		/****************** ScalePrec ******************/
		/**** md5 signature: dffe6ee0100207e469842f2ea00b57ac ****/
		%feature("compactdefaultargs") ScalePrec;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ScalePrec;
		static Standard_Real ScalePrec();


        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
		/****************** Transformation ******************/
		/**** md5 signature: 567e6ee373139970f4679dbb49e28e7c ****/
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
		/****************** operator * ******************/
		/**** md5 signature: b914624702617b5c10e313c8e2b471b0 ****/
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

		/****************** operator / ******************/
		/**** md5 signature: 9277faf09ff3df40bb288064b81b41f0 ****/
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
		/****************** TopLoc_SListNodeOfItemLocation ******************/
		/**** md5 signature: 3b21f468f24329563bf05586a42c44dd ****/
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

		/****************** Tail ******************/
		/**** md5 signature: 57acbb7d348b766166feca29e69c216b ****/
		%feature("compactdefaultargs") Tail;
		%feature("autodoc", "Return
-------
TopLoc_SListOfItemLocation

Description
-----------
No available documentation.
") Tail;
		TopLoc_SListOfItemLocation & Tail();

		/****************** Value ******************/
		/**** md5 signature: 8f7ce7cfd62ffb5a331e9ddc65a15b75 ****/
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
		/****************** TopLoc_SListOfItemLocation ******************/
		/**** md5 signature: 2f9ad3c814b4b63689c359b0393ae771 ****/
		%feature("compactdefaultargs") TopLoc_SListOfItemLocation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty list.
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation();

		/****************** TopLoc_SListOfItemLocation ******************/
		/**** md5 signature: d7323f87558e3534068a78b183434bcf ****/
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
Creates a list with <anitem> as value and <atail> as tail.
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation(const TopLoc_ItemLocation & anItem, const TopLoc_SListOfItemLocation & aTail);

		/****************** TopLoc_SListOfItemLocation ******************/
		/**** md5 signature: c23bf9b5c1b0adfcaf79aa477b9cc274 ****/
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
Creates a list from an other one. the lists are shared.
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation(const TopLoc_SListOfItemLocation & Other);

		/****************** TopLoc_SListOfItemLocation ******************/
		/**** md5 signature: 0379b2634e957903294469c3ee0f66b5 ****/
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

		/****************** Assign ******************/
		/**** md5 signature: b5735fdd3d6cb7b6ceb4cfc062cd319b ****/
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
Sets a list from an other one. the lists are shared. the list itself is returned.
") Assign;
		TopLoc_SListOfItemLocation & Assign(const TopLoc_SListOfItemLocation & Other);

		/****************** Clear ******************/
		/**** md5 signature: 75abd67f132413fc11c19201aabf1126 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the list to be empty.
") Clear;
		void Clear();

		/****************** Construct ******************/
		/**** md5 signature: 7c9d03bae6a7a364558f3a59d55a9f0b ****/
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
Replaces the list by a list with <anitem> as value and the list <self> as tail.
") Construct;
		void Construct(const TopLoc_ItemLocation & anItem);

		/****************** IsEmpty ******************/
		/**** md5 signature: d529c07ce9e12eea3222188c82b0e80b ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returne true if this list is empty.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** More ******************/
		/**** md5 signature: cff271d3b32940da94bada40648f9096 ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the iterator has a current value. this is !isempty().
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: 1201a55f750036045cd397a65f07fc7d ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Moves the iterator to the next object in the list. if the iterator is empty it will stay empty. this is totail().
") Next;
		void Next();

		/****************** Tail ******************/
		/**** md5 signature: 50fc348679ec04a9cc73c1820554ab0d ****/
		%feature("compactdefaultargs") Tail;
		%feature("autodoc", "Return
-------
TopLoc_SListOfItemLocation

Description
-----------
Returns the current tail of the list. on an empty list the tail is the list itself.
") Tail;
		const TopLoc_SListOfItemLocation & Tail();

		/****************** ToTail ******************/
		/**** md5 signature: 9bb28ab5d51fa8b8dab1e08bf2428cb5 ****/
		%feature("compactdefaultargs") ToTail;
		%feature("autodoc", "Return
-------
None

Description
-----------
Replaces the list <self> by its tail.
") ToTail;
		void ToTail();

		/****************** Value ******************/
		/**** md5 signature: c837b1119fc0a458b644c6dd6374aa3c ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopLoc_ItemLocation

Description
-----------
Returns the current value of the list. an error is raised if the list is empty.
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
