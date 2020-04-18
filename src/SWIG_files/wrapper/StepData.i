/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
%define STEPDATADOCSTRING
"StepData module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepdata.html"
%enddef
%module (package="OCC.Core", docstring=STEPDATADOCSTRING) StepData


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


%{
#include<StepData_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Interface_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Interface.i
%import TCollection.i
%import TColStd.i
%import Message.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum StepData_Logical {
	StepData_LFalse = 0,
	StepData_LTrue = 1,
	StepData_LUnknown = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class StepData_Logical(IntEnum):
	StepData_LFalse = 0
	StepData_LTrue = 1
	StepData_LUnknown = 2
StepData_LFalse = StepData_Logical.StepData_LFalse
StepData_LTrue = StepData_Logical.StepData_LTrue
StepData_LUnknown = StepData_Logical.StepData_LUnknown
};
/* end python proxy for enums */

/* handles */
%wrap_handle(StepData_Described)
%wrap_handle(StepData_EDescr)
%wrap_handle(StepData_FileRecognizer)
%wrap_handle(StepData_GeneralModule)
%wrap_handle(StepData_GlobalNodeOfWriterLib)
%wrap_handle(StepData_NodeOfWriterLib)
%wrap_handle(StepData_PDescr)
%wrap_handle(StepData_Protocol)
%wrap_handle(StepData_ReadWriteModule)
%wrap_handle(StepData_SelectMember)
%wrap_handle(StepData_StepModel)
%wrap_handle(StepData_StepReaderData)
%wrap_handle(StepData_DefaultGeneral)
%wrap_handle(StepData_ECDescr)
%wrap_handle(StepData_ESDescr)
%wrap_handle(StepData_FileProtocol)
%wrap_handle(StepData_Plex)
%wrap_handle(StepData_SelectInt)
%wrap_handle(StepData_SelectNamed)
%wrap_handle(StepData_SelectReal)
%wrap_handle(StepData_Simple)
%wrap_handle(StepData_SelectArrReal)
%wrap_handle(StepData_HArray1OfField)
/* end handles declaration */

/* templates */
%template(StepData_Array1OfField) NCollection_Array1<StepData_Field>;

%extend NCollection_Array1<StepData_Field> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<StepData_Field> StepData_Array1OfField;
/* end typedefs declaration */

/*****************
* class StepData *
*****************/
%rename(stepdata) StepData;
class StepData {
	public:
		/****************** AddHeaderProtocol ******************/
		%feature("compactdefaultargs") AddHeaderProtocol;
		%feature("autodoc", "Adds a new header protocol to the header definition.

Parameters
----------
headerproto: StepData_Protocol

Returns
-------
None
") AddHeaderProtocol;
		static void AddHeaderProtocol(const opencascade::handle<StepData_Protocol> & headerproto);

		/****************** HeaderProtocol ******************/
		%feature("compactdefaultargs") HeaderProtocol;
		%feature("autodoc", "Returns the recorded headerprotocol, which can be : - a null handle if no header protocol was yet defined - a simple protocol if only one was defined - a fileprotocol if more than one protocol was yet defined.

Returns
-------
opencascade::handle<StepData_Protocol>
") HeaderProtocol;
		static opencascade::handle<StepData_Protocol> HeaderProtocol();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Prepares general data required to work with this package, which are the protocol and modules to be loaded into libraries.

Returns
-------
None
") Init;
		static void Init();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns a protocol from stepdata (avoids to create it).

Returns
-------
opencascade::handle<StepData_Protocol>
") Protocol;
		static opencascade::handle<StepData_Protocol> Protocol();

};


%extend StepData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepData_Described *
***************************/
%nodefaultctor StepData_Described;
class StepData_Described : public Standard_Transient {
	public:
		/****************** As ******************/
		%feature("compactdefaultargs") As;
		%feature("autodoc", "Returns a simple entity which matches with a type in <self> : for a simple entity : me if it matches, else a null handle for a complex entity : the member which matches, else null.

Parameters
----------
steptype: char *

Returns
-------
opencascade::handle<StepData_Simple>
") As;
		virtual opencascade::handle<StepData_Simple> As(const char * steptype);

		/****************** CField ******************/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "Returns a field from its name; read or write.

Parameters
----------
name: char *

Returns
-------
StepData_Field
") CField;
		virtual StepData_Field & CField(const char * name);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Fills a check by using its description.

Parameters
----------
ach: Interface_Check

Returns
-------
None
") Check;
		virtual void Check(opencascade::handle<Interface_Check> & ach);

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns the description used to define this entity.

Returns
-------
opencascade::handle<StepData_EDescr>
") Description;
		opencascade::handle<StepData_EDescr> Description();

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "Returns a field from its name; read-only.

Parameters
----------
name: char *

Returns
-------
StepData_Field
") Field;
		virtual const StepData_Field & Field(const char * name);

		/****************** HasField ******************/
		%feature("compactdefaultargs") HasField;
		%feature("autodoc", "Tells if a field brings a given name.

Parameters
----------
name: char *

Returns
-------
bool
") HasField;
		virtual Standard_Boolean HasField(const char * name);

		/****************** IsComplex ******************/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Tells if a described entity is complex.

Returns
-------
bool
") IsComplex;
		virtual Standard_Boolean IsComplex();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Tells if a step type is matched by <self> for a simple entity : own type or super type for a complex entity : one of the members.

Parameters
----------
steptype: char *

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(const char * steptype);

		/****************** Shared ******************/
		%feature("compactdefaultargs") Shared;
		%feature("autodoc", "Fills an entityiterator with entities shared by <self>.

Parameters
----------
list: Interface_EntityIterator

Returns
-------
None
") Shared;
		virtual void Shared(Interface_EntityIterator & list);

};


%make_alias(StepData_Described)

%extend StepData_Described {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StepData_EDescr *
************************/
%nodefaultctor StepData_EDescr;
class StepData_EDescr : public Standard_Transient {
	public:
		/****************** IsComplex ******************/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Tells if a edescr is complex (ecdescr) or simple (esdescr).

Returns
-------
bool
") IsComplex;
		virtual Standard_Boolean IsComplex();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Tells if a esdescr matches a step type : exact or super type.

Parameters
----------
steptype: char *

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(const char * steptype);

		/****************** NewEntity ******************/
		%feature("compactdefaultargs") NewEntity;
		%feature("autodoc", "Creates a described entity (i.e. a simple one).

Returns
-------
opencascade::handle<StepData_Described>
") NewEntity;
		virtual opencascade::handle<StepData_Described> NewEntity();

};


%make_alias(StepData_EDescr)

%extend StepData_EDescr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class StepData_EnumTool *
**************************/
class StepData_EnumTool {
	public:
		/****************** StepData_EnumTool ******************/
		%feature("compactdefaultargs") StepData_EnumTool;
		%feature("autodoc", "Creates an enumtool with definitions given by e0 .. e<max> each definition string can bring one term, or several separated by blanks. each term corresponds to one value of the enumeration, if dots are not presents they are added //! such a static constructor allows to build a static description as : static stepdata_enumtool myenumtool('e0','e1'...); then use it without having to initialise it //! a null definition can be input by given '$' :the corresponding position is attached to 'null/undefined' value (as one particular item of the enumeration list).

Parameters
----------
e0: char *,optional
	default value is ""
e1: char *,optional
	default value is ""
e2: char *,optional
	default value is ""
e3: char *,optional
	default value is ""
e4: char *,optional
	default value is ""
e5: char *,optional
	default value is ""
e6: char *,optional
	default value is ""
e7: char *,optional
	default value is ""
e8: char *,optional
	default value is ""
e9: char *,optional
	default value is ""
e10: char *,optional
	default value is ""
e11: char *,optional
	default value is ""
e12: char *,optional
	default value is ""
e13: char *,optional
	default value is ""
e14: char *,optional
	default value is ""
e15: char *,optional
	default value is ""
e16: char *,optional
	default value is ""
e17: char *,optional
	default value is ""
e18: char *,optional
	default value is ""
e19: char *,optional
	default value is ""
e20: char *,optional
	default value is ""
e21: char *,optional
	default value is ""
e22: char *,optional
	default value is ""
e23: char *,optional
	default value is ""
e24: char *,optional
	default value is ""
e25: char *,optional
	default value is ""
e26: char *,optional
	default value is ""
e27: char *,optional
	default value is ""
e28: char *,optional
	default value is ""
e29: char *,optional
	default value is ""
e30: char *,optional
	default value is ""
e31: char *,optional
	default value is ""
e32: char *,optional
	default value is ""
e33: char *,optional
	default value is ""
e34: char *,optional
	default value is ""
e35: char *,optional
	default value is ""
e36: char *,optional
	default value is ""
e37: char *,optional
	default value is ""
e38: char *,optional
	default value is ""
e39: char *,optional
	default value is ""

Returns
-------
None
") StepData_EnumTool;
		 StepData_EnumTool(const char * e0 = "", const char * e1 = "", const char * e2 = "", const char * e3 = "", const char * e4 = "", const char * e5 = "", const char * e6 = "", const char * e7 = "", const char * e8 = "", const char * e9 = "", const char * e10 = "", const char * e11 = "", const char * e12 = "", const char * e13 = "", const char * e14 = "", const char * e15 = "", const char * e16 = "", const char * e17 = "", const char * e18 = "", const char * e19 = "", const char * e20 = "", const char * e21 = "", const char * e22 = "", const char * e23 = "", const char * e24 = "", const char * e25 = "", const char * e26 = "", const char * e27 = "", const char * e28 = "", const char * e29 = "", const char * e30 = "", const char * e31 = "", const char * e32 = "", const char * e33 = "", const char * e34 = "", const char * e35 = "", const char * e36 = "", const char * e37 = "", const char * e38 = "", const char * e39 = "");

		/****************** AddDefinition ******************/
		%feature("compactdefaultargs") AddDefinition;
		%feature("autodoc", "Processes a definition, splits it according blanks if any empty definitions are ignored a null definition can be input by given '$' :the corresponding position is attached to 'null/undefined' value (as one particular item of the enumeration list) see also isset.

Parameters
----------
term: char *

Returns
-------
None
") AddDefinition;
		void AddDefinition(const char * term);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true if at least one definition has been entered after creation time (i.e. by adddefinition only) //! this allows to build a static description by a first pass : static stepdata_enumtool myenumtool('e0' ...); ... if (!myenumtool.isset()) { for further inits myenumtool.adddefinition('e21'); ... }.

Returns
-------
bool
") IsSet;
		Standard_Boolean IsSet();

		/****************** MaxValue ******************/
		%feature("compactdefaultargs") MaxValue;
		%feature("autodoc", "Returns the maximum integer for a suitable value remark : while values begin at zero, maxvalue is the count of recorded values minus one.

Returns
-------
int
") MaxValue;
		Standard_Integer MaxValue();

		/****************** NullValue ******************/
		%feature("compactdefaultargs") NullValue;
		%feature("autodoc", "Returns the value attached to 'null/undefined value' if none is specified or if optional has been set to false, returns -1 null value has been specified by definition '$'.

Returns
-------
int
") NullValue;
		Standard_Integer NullValue();

		/****************** Optional ******************/
		%feature("compactdefaultargs") Optional;
		%feature("autodoc", "Sets or unsets the enumtool to accept undefined value (for optional field). ignored if no null value is defined (by '$') can be changed during execution (to read each field), default is true (if a null value is defined).

Parameters
----------
mode: bool

Returns
-------
None
") Optional;
		void Optional(const Standard_Boolean mode);

		/****************** Text ******************/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Returns the text which corresponds to a given numeric value it is limited by dots if num is out of range, returns an empty string.

Parameters
----------
num: int

Returns
-------
TCollection_AsciiString
") Text;
		const TCollection_AsciiString & Text(const Standard_Integer num);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the numeric value found for a text the text must be in capitals and limited by dots a non-suitable text gives a negative value to be returned.

Parameters
----------
txt: char *

Returns
-------
int
") Value;
		Standard_Integer Value(const char * txt);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Same as above but works on an asciistring.

Parameters
----------
txt: TCollection_AsciiString

Returns
-------
int
") Value;
		Standard_Integer Value(const TCollection_AsciiString & txt);

};


%extend StepData_EnumTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class StepData_Field *
***********************/
class StepData_Field {
	public:
		/****************** StepData_Field ******************/
		%feature("compactdefaultargs") StepData_Field;
		%feature("autodoc", "Creates a field, empty ('no value defined').

Returns
-------
None
") StepData_Field;
		 StepData_Field();

		/****************** StepData_Field ******************/
		%feature("compactdefaultargs") StepData_Field;
		%feature("autodoc", "Creates a field from another one. if <copy> is true, handled data (select,string,list, not entities) are copied.

Parameters
----------
other: StepData_Field
copy: bool,optional
	default value is Standard_False

Returns
-------
None
") StepData_Field;
		 StepData_Field(const StepData_Field & other, const Standard_Boolean copy = Standard_False);

		/****************** Arity ******************/
		%feature("compactdefaultargs") Arity;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Arity;
		Standard_Integer Arity();

		/****************** Boolean ******************/
		%feature("compactdefaultargs") Boolean;
		%feature("autodoc", "No available documentation.

Parameters
----------
n1: int,optional
	default value is 1
n2: int,optional
	default value is 1

Returns
-------
bool
") Boolean;
		Standard_Boolean Boolean(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the field, to set it as 'no value defined' just before setlist, predeclares it as 'any' a kind can be directly set here to declare a type.

Parameters
----------
kind: int,optional
	default value is 0

Returns
-------
None
") Clear;
		void Clear(const Standard_Integer kind = 0);

		/****************** ClearItem ******************/
		%feature("compactdefaultargs") ClearItem;
		%feature("autodoc", "Declares an item of the list as undefined (ignored if list not defined as string,entity or any).

Parameters
----------
num: int

Returns
-------
None
") ClearItem;
		void ClearItem(const Standard_Integer num);

		/****************** CopyFrom ******************/
		%feature("compactdefaultargs") CopyFrom;
		%feature("autodoc", "Gets the copy of the values of another field.

Parameters
----------
other: StepData_Field

Returns
-------
None
") CopyFrom;
		void CopyFrom(const StepData_Field & other);

		/****************** Entity ******************/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "No available documentation.

Parameters
----------
n1: int,optional
	default value is 1
n2: int,optional
	default value is 1

Returns
-------
opencascade::handle<Standard_Transient>
") Entity;
		opencascade::handle<Standard_Transient> Entity(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****************** Enum ******************/
		%feature("compactdefaultargs") Enum;
		%feature("autodoc", "No available documentation.

Parameters
----------
n1: int,optional
	default value is 1
n2: int,optional
	default value is 1

Returns
-------
int
") Enum;
		Standard_Integer Enum(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****************** EnumText ******************/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "No available documentation.

Parameters
----------
n1: int,optional
	default value is 1
n2: int,optional
	default value is 1

Returns
-------
char *
") EnumText;
		const char * EnumText(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****************** Int ******************/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Int;
		Standard_Integer Int();

		/****************** Integer ******************/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "No available documentation.

Parameters
----------
n1: int,optional
	default value is 1
n2: int,optional
	default value is 1

Returns
-------
int
") Integer;
		Standard_Integer Integer(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "No available documentation.

Parameters
----------
n1: int,optional
	default value is 1
n2: int,optional
	default value is 1

Returns
-------
bool
") IsSet;
		Standard_Boolean IsSet(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****************** ItemKind ******************/
		%feature("compactdefaultargs") ItemKind;
		%feature("autodoc", "Returns the kind of an item in a list or double list it is the kind of the list, except if it is 'any', in such a case the true kind is determined and returned.

Parameters
----------
n1: int,optional
	default value is 1
n2: int,optional
	default value is 1

Returns
-------
int
") ItemKind;
		Standard_Integer ItemKind(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Returns the kind of the field <type> true (d) : returns only the type itself else, returns the complete kind.

Parameters
----------
type: bool,optional
	default value is Standard_True

Returns
-------
int
") Kind;
		Standard_Integer Kind(const Standard_Boolean type = Standard_True);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "No available documentation.

Parameters
----------
index: int,optional
	default value is 1

Returns
-------
int
") Length;
		Standard_Integer Length(const Standard_Integer index = 1);

		/****************** Logical ******************/
		%feature("compactdefaultargs") Logical;
		%feature("autodoc", "No available documentation.

Parameters
----------
n1: int,optional
	default value is 1
n2: int,optional
	default value is 1

Returns
-------
StepData_Logical
") Logical;
		StepData_Logical Logical(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****************** Lower ******************/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "No available documentation.

Parameters
----------
index: int,optional
	default value is 1

Returns
-------
int
") Lower;
		Standard_Integer Lower(const Standard_Integer index = 1);

		/****************** Real ******************/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "No available documentation.

Parameters
----------
n1: int,optional
	default value is 1
n2: int,optional
	default value is 1

Returns
-------
float
") Real;
		Standard_Real Real(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets an undetermined value : can be string, selectmember, harray(1-2) ... else, an entity in case of an harray, determines and records its size(s).

Parameters
----------
val: Standard_Transient

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Standard_Transient> & val);

		/****************** SetBoolean ******************/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "Sets a boolean value (or predeclares a list as boolean).

Parameters
----------
val: bool,optional
	default value is Standard_False

Returns
-------
None
") SetBoolean;
		void SetBoolean(const Standard_Boolean val = Standard_False);

		/****************** SetBoolean ******************/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
val: bool

Returns
-------
None
") SetBoolean;
		void SetBoolean(const Standard_Integer num, const Standard_Boolean val);

		/****************** SetDerived ******************/
		%feature("compactdefaultargs") SetDerived;
		%feature("autodoc", "Codes a field as derived (no proper value).

Returns
-------
None
") SetDerived;
		void SetDerived();

		/****************** SetEntity ******************/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "Sets an entity value.

Parameters
----------
val: Standard_Transient

Returns
-------
None
") SetEntity;
		void SetEntity(const opencascade::handle<Standard_Transient> & val);

		/****************** SetEntity ******************/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "Predeclares a list as of entity.

Returns
-------
None
") SetEntity;
		void SetEntity();

		/****************** SetEntity ******************/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
val: Standard_Transient

Returns
-------
None
") SetEntity;
		void SetEntity(const Standard_Integer num, const opencascade::handle<Standard_Transient> & val);

		/****************** SetEnum ******************/
		%feature("compactdefaultargs") SetEnum;
		%feature("autodoc", "Sets an enum value (as its integer counterpart) (or predeclares a list as enum) if <text> is given , also sets its textual expression <val> negative means unknown (known values begin at 0).

Parameters
----------
val: int,optional
	default value is -1
text: char *,optional
	default value is ""

Returns
-------
None
") SetEnum;
		void SetEnum(const Standard_Integer val = -1, const char * text = "");

		/****************** SetEnum ******************/
		%feature("compactdefaultargs") SetEnum;
		%feature("autodoc", "Sets an enum value (integer counterpart), also its text expression if known (if list has been set as 'any').

Parameters
----------
num: int
val: int
text: char *,optional
	default value is ""

Returns
-------
None
") SetEnum;
		void SetEnum(const Standard_Integer num, const Standard_Integer val, const char * text = "");

		/****************** SetInt ******************/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "Directly sets the integer value, if its kind matches integer, boolean, logical, or enum (does not change kind).

Parameters
----------
val: int

Returns
-------
None
") SetInt;
		void SetInt(const Standard_Integer val);

		/****************** SetInt ******************/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "Internal access to an integer value for a list, plus its kind.

Parameters
----------
num: int
val: int
kind: int

Returns
-------
None
") SetInt;
		void SetInt(const Standard_Integer num, const Standard_Integer val, const Standard_Integer kind);

		/****************** SetInteger ******************/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "Sets an integer value (before setlist* declares it as integer).

Parameters
----------
val: int,optional
	default value is 0

Returns
-------
None
") SetInteger;
		void SetInteger(const Standard_Integer val = 0);

		/****************** SetInteger ******************/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "Sets an integer value for a list (rank num) (recognizes a selectmember).

Parameters
----------
num: int
val: int

Returns
-------
None
") SetInteger;
		void SetInteger(const Standard_Integer num, const Standard_Integer val);

		/****************** SetList ******************/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "Declares a field as a list, with an initial size initial lower is defaulted as 1, can be defined the list starts empty, typed by the last set* if no set* before, sets it as 'any' (transient/select).

Parameters
----------
size: int
first: int,optional
	default value is 1

Returns
-------
None
") SetList;
		void SetList(const Standard_Integer size, const Standard_Integer first = 1);

		/****************** SetList2 ******************/
		%feature("compactdefaultargs") SetList2;
		%feature("autodoc", "Declares a field as an homogeneous square list, with initial sizes, and initial lowers.

Parameters
----------
siz1: int
siz2: int
f1: int,optional
	default value is 1
f2: int,optional
	default value is 1

Returns
-------
None
") SetList2;
		void SetList2(const Standard_Integer siz1, const Standard_Integer siz2, const Standard_Integer f1 = 1, const Standard_Integer f2 = 1);

		/****************** SetLogical ******************/
		%feature("compactdefaultargs") SetLogical;
		%feature("autodoc", "Sets a logical value (or predeclares a list as logical).

Parameters
----------
val: StepData_Logical,optional
	default value is StepData_LFalse

Returns
-------
None
") SetLogical;
		void SetLogical(const StepData_Logical val = StepData_LFalse);

		/****************** SetLogical ******************/
		%feature("compactdefaultargs") SetLogical;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
val: StepData_Logical

Returns
-------
None
") SetLogical;
		void SetLogical(const Standard_Integer num, const StepData_Logical val);

		/****************** SetReal ******************/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "Sets a real value (or predeclares a list as real);.

Parameters
----------
val: float,optional
	default value is 0.0

Returns
-------
None
") SetReal;
		void SetReal(const Standard_Real val = 0.0);

		/****************** SetReal ******************/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
val: float

Returns
-------
None
") SetReal;
		void SetReal(const Standard_Integer num, const Standard_Real val);

		/****************** SetSelectMember ******************/
		%feature("compactdefaultargs") SetSelectMember;
		%feature("autodoc", "Sets a selectmember (for integer,boolean,enum,real,logical) hence, the value of the field is accessed through this member.

Parameters
----------
val: StepData_SelectMember

Returns
-------
None
") SetSelectMember;
		void SetSelectMember(const opencascade::handle<StepData_SelectMember> & val);

		/****************** SetString ******************/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "Sets a string value (or predeclares a list as string) does not redefine the kind if it is alread string or enum.

Parameters
----------
val: char *,optional
	default value is ""

Returns
-------
None
") SetString;
		void SetString(const char * val = "");

		/****************** SetString ******************/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
val: char *

Returns
-------
None
") SetString;
		void SetString(const Standard_Integer num, const char * val);

		/****************** String ******************/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "No available documentation.

Parameters
----------
n1: int,optional
	default value is 1
n2: int,optional
	default value is 1

Returns
-------
char *
") String;
		const char * String(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****************** Transient ******************/
		%feature("compactdefaultargs") Transient;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Standard_Transient>
") Transient;
		opencascade::handle<Standard_Transient> Transient();

};


%extend StepData_Field {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepData_FieldList *
***************************/
class StepData_FieldList {
	public:
		/****************** StepData_FieldList ******************/
		%feature("compactdefaultargs") StepData_FieldList;
		%feature("autodoc", "Creates a fieldlist of 0 field.

Returns
-------
None
") StepData_FieldList;
		 StepData_FieldList();

		/****************** CField ******************/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "Returns the field n0 <num> between 1 and nbfields, in order to modify its content.

Parameters
----------
num: int

Returns
-------
StepData_Field
") CField;
		virtual StepData_Field & CField(const Standard_Integer num);

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "Returns the field n0 <num> between 1 and nbfields (read only).

Parameters
----------
num: int

Returns
-------
StepData_Field
") Field;
		virtual const StepData_Field & Field(const Standard_Integer num);

		/****************** FillShared ******************/
		%feature("compactdefaultargs") FillShared;
		%feature("autodoc", "Fills an iterator with the entities shared by <self>.

Parameters
----------
iter: Interface_EntityIterator

Returns
-------
None
") FillShared;
		void FillShared(Interface_EntityIterator & iter);

		/****************** NbFields ******************/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Returns the count of fields. here, returns 0.

Returns
-------
int
") NbFields;
		virtual Standard_Integer NbFields();

};


%extend StepData_FieldList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepData_FileRecognizer *
********************************/
%nodefaultctor StepData_FileRecognizer;
class StepData_FileRecognizer : public Standard_Transient {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a new recognizer to the compound, at the end several calls to add work by adding in the order of calls : hence, when eval has failed to recognize, evaluate will call evaluate from the first added recognizer if there is one, and to the second if there is still no result, and so on.

Parameters
----------
reco: StepData_FileRecognizer

Returns
-------
None
") Add;
		void Add(const opencascade::handle<StepData_FileRecognizer> & reco);

		/****************** Evaluate ******************/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Evaluates if recognition has a result, returns it if yes in case of success, returns true and puts result in 'res' in case of failure, simply returns false works by calling deferred method eval, and in case of failure, looks for added recognizers to work.

Parameters
----------
akey: TCollection_AsciiString
res: Standard_Transient

Returns
-------
bool
") Evaluate;
		Standard_Boolean Evaluate(const TCollection_AsciiString & akey, opencascade::handle<Standard_Transient> & res);

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns result of last recognition (call of evaluate).

Returns
-------
opencascade::handle<Standard_Transient>
") Result;
		opencascade::handle<Standard_Transient> Result();

};


%make_alias(StepData_FileRecognizer)

%extend StepData_FileRecognizer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepData_FreeFormEntity *
********************************/
/*******************************
* class StepData_GeneralModule *
*******************************/
%nodefaultctor StepData_GeneralModule;
class StepData_GeneralModule : public Interface_GeneralModule {
	public:
		/****************** CheckCase ******************/
		%feature("compactdefaultargs") CheckCase;
		%feature("autodoc", "Specific checking of an entity <ent>.

Parameters
----------
casenum: int
ent: Standard_Transient
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") CheckCase;
		virtual void CheckCase(const Standard_Integer casenum, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** CopyCase ******************/
		%feature("compactdefaultargs") CopyCase;
		%feature("autodoc", "Specific copy ('deep') from <entfrom> to <entto> (same type) by using a transfercontrol which provides its working map. use method transferred from transfercontrol to work specific copying of implied references a default is provided which does nothing (must current case !) already copied references (by copyfrom) must remain unchanged use method search from transfercontrol to work.

Parameters
----------
casenum: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Returns
-------
None
") CopyCase;
		virtual void CopyCase(const Standard_Integer casenum, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****************** FillSharedCase ******************/
		%feature("compactdefaultargs") FillSharedCase;
		%feature("autodoc", "Specific filling of the list of entities shared by an entity <ent>. can use the internal utility method share, below.

Parameters
----------
casenum: int
ent: Standard_Transient
iter: Interface_EntityIterator

Returns
-------
None
") FillSharedCase;
		virtual void FillSharedCase(const Standard_Integer casenum, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

};


%make_alias(StepData_GeneralModule)

%extend StepData_GeneralModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepData_GlobalNodeOfWriterLib *
***************************************/
class StepData_GlobalNodeOfWriterLib : public Standard_Transient {
	public:
		/****************** StepData_GlobalNodeOfWriterLib ******************/
		%feature("compactdefaultargs") StepData_GlobalNodeOfWriterLib;
		%feature("autodoc", "Creates an empty globalnode, with no next.

Returns
-------
None
") StepData_GlobalNodeOfWriterLib;
		 StepData_GlobalNodeOfWriterLib();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a module bound with a protocol to the list : does nothing if already in the list, that is, same type (exact match) and same state (that is, isequal is not required) once added, stores its attached protocol in correspondance.

Parameters
----------
amodule: StepData_ReadWriteModule
aprotocol: StepData_Protocol

Returns
-------
None
") Add;
		void Add(const opencascade::handle<StepData_ReadWriteModule> & amodule, const opencascade::handle<StepData_Protocol> & aprotocol);

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module stored in a given globalnode.

Returns
-------
opencascade::handle<StepData_ReadWriteModule>
") Module;
		const opencascade::handle<StepData_ReadWriteModule> & Module();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next globalnode. if none is defined, returned value is a null handle.

Returns
-------
opencascade::handle<StepData_GlobalNodeOfWriterLib>
") Next;
		const opencascade::handle<StepData_GlobalNodeOfWriterLib> & Next();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the attached protocol stored in a given globalnode.

Returns
-------
opencascade::handle<StepData_Protocol>
") Protocol;
		const opencascade::handle<StepData_Protocol> & Protocol();

};


%make_alias(StepData_GlobalNodeOfWriterLib)

%extend StepData_GlobalNodeOfWriterLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepData_NodeOfWriterLib *
*********************************/
class StepData_NodeOfWriterLib : public Standard_Transient {
	public:
		/****************** StepData_NodeOfWriterLib ******************/
		%feature("compactdefaultargs") StepData_NodeOfWriterLib;
		%feature("autodoc", "Creates an empty node, with no next.

Returns
-------
None
") StepData_NodeOfWriterLib;
		 StepData_NodeOfWriterLib();

		/****************** AddNode ******************/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "Adds a couple (module,protocol), that is, stores it into itself if not yet done, else creates a next node to do it.

Parameters
----------
anode: StepData_GlobalNodeOfWriterLib

Returns
-------
None
") AddNode;
		void AddNode(const opencascade::handle<StepData_GlobalNodeOfWriterLib> & anode);

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module designated by a precise node.

Returns
-------
opencascade::handle<StepData_ReadWriteModule>
") Module;
		const opencascade::handle<StepData_ReadWriteModule> & Module();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next node. if none was defined, returned value is a null handle.

Returns
-------
opencascade::handle<StepData_NodeOfWriterLib>
") Next;
		const opencascade::handle<StepData_NodeOfWriterLib> & Next();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol designated by a precise node.

Returns
-------
opencascade::handle<StepData_Protocol>
") Protocol;
		const opencascade::handle<StepData_Protocol> & Protocol();

};


%make_alias(StepData_NodeOfWriterLib)

%extend StepData_NodeOfWriterLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StepData_PDescr *
************************/
class StepData_PDescr : public Standard_Transient {
	public:
		/****************** StepData_PDescr ******************/
		%feature("compactdefaultargs") StepData_PDescr;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepData_PDescr;
		 StepData_PDescr();

		/****************** AddArity ******************/
		%feature("compactdefaultargs") AddArity;
		%feature("autodoc", "Adds an arity count to <self>, by default 1 1 : a simple field passes to a list/array etc or a list to a list of list 2 : a simple field passes to a list of list.

Parameters
----------
arity: int,optional
	default value is 1

Returns
-------
None
") AddArity;
		void AddArity(const Standard_Integer arity = 1);

		/****************** AddEnumDef ******************/
		%feature("compactdefaultargs") AddEnumDef;
		%feature("autodoc", "Adds an enum value as a string.

Parameters
----------
enumdef: char *

Returns
-------
None
") AddEnumDef;
		void AddEnumDef(const char * enumdef);

		/****************** AddMember ******************/
		%feature("compactdefaultargs") AddMember;
		%feature("autodoc", "Adds a member to a select description.

Parameters
----------
member: StepData_PDescr

Returns
-------
None
") AddMember;
		void AddMember(const opencascade::handle<StepData_PDescr> & member);

		/****************** Arity ******************/
		%feature("compactdefaultargs") Arity;
		%feature("autodoc", "Returns the arity of <self>.

Returns
-------
int
") Arity;
		Standard_Integer Arity();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Semantic check of a field : does it complies with the given description ?.

Parameters
----------
afild: StepData_Field
ach: Interface_Check

Returns
-------
None
") Check;
		virtual void Check(const StepData_Field & afild, opencascade::handle<Interface_Check> & ach);

		/****************** DescrName ******************/
		%feature("compactdefaultargs") DescrName;
		%feature("autodoc", "Returns the description (type name) to match, for a described (else, empty string).

Returns
-------
char *
") DescrName;
		const char * DescrName();

		/****************** EnumMax ******************/
		%feature("compactdefaultargs") EnumMax;
		%feature("autodoc", "Returns the maximum integer for a suitable value (count - 1).

Returns
-------
int
") EnumMax;
		Standard_Integer EnumMax();

		/****************** EnumText ******************/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "Returns the text which corresponds to a numeric value, between 0 and enummax. it is limited by dots.

Parameters
----------
val: int

Returns
-------
char *
") EnumText;
		const char * EnumText(const Standard_Integer val);

		/****************** EnumValue ******************/
		%feature("compactdefaultargs") EnumValue;
		%feature("autodoc", "Returns the numeric value found for an enum text the text must be in capitals and limited by dots a non-suitable text gives a negative value to be returned.

Parameters
----------
name: char *

Returns
-------
int
") EnumValue;
		Standard_Integer EnumValue(const char * name);

		/****************** FieldName ******************/
		%feature("compactdefaultargs") FieldName;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") FieldName;
		const char * FieldName();

		/****************** FieldRank ******************/
		%feature("compactdefaultargs") FieldRank;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") FieldRank;
		Standard_Integer FieldRank();

		/****************** IsBoolean ******************/
		%feature("compactdefaultargs") IsBoolean;
		%feature("autodoc", "Tells if <self> is for a boolean value (false,true).

Returns
-------
bool
") IsBoolean;
		Standard_Boolean IsBoolean();

		/****************** IsDerived ******************/
		%feature("compactdefaultargs") IsDerived;
		%feature("autodoc", "Tells if <self> is derived.

Returns
-------
bool
") IsDerived;
		Standard_Boolean IsDerived();

		/****************** IsDescr ******************/
		%feature("compactdefaultargs") IsDescr;
		%feature("autodoc", "Tells if <self> is for a described entity of a given edescr (does this edescr match description name ?). for late-bnd (works for <self> + nexts if <self> is a select).

Parameters
----------
descr: StepData_EDescr

Returns
-------
bool
") IsDescr;
		Standard_Boolean IsDescr(const opencascade::handle<StepData_EDescr> & descr);

		/****************** IsEntity ******************/
		%feature("compactdefaultargs") IsEntity;
		%feature("autodoc", "Tells if <self> is for an entity, either described or cdl type.

Returns
-------
bool
") IsEntity;
		Standard_Boolean IsEntity();

		/****************** IsEnum ******************/
		%feature("compactdefaultargs") IsEnum;
		%feature("autodoc", "Tells if <self> is for an enum value then, call addenumdef ordered from the first one (value 0) managed by an enumtool.

Returns
-------
bool
") IsEnum;
		Standard_Boolean IsEnum();

		/****************** IsField ******************/
		%feature("compactdefaultargs") IsField;
		%feature("autodoc", "Tells if <self> is a field. else it is a type.

Returns
-------
bool
") IsField;
		Standard_Boolean IsField();

		/****************** IsInteger ******************/
		%feature("compactdefaultargs") IsInteger;
		%feature("autodoc", "Tells if <self> is for an integer.

Returns
-------
bool
") IsInteger;
		Standard_Boolean IsInteger();

		/****************** IsLogical ******************/
		%feature("compactdefaultargs") IsLogical;
		%feature("autodoc", "Tells if <self> is for a logical value (false,true,unknown).

Returns
-------
bool
") IsLogical;
		Standard_Boolean IsLogical();

		/****************** IsOptional ******************/
		%feature("compactdefaultargs") IsOptional;
		%feature("autodoc", "Tells if <self> is optional.

Returns
-------
bool
") IsOptional;
		Standard_Boolean IsOptional();

		/****************** IsReal ******************/
		%feature("compactdefaultargs") IsReal;
		%feature("autodoc", "Tells if <self> is for a real value.

Returns
-------
bool
") IsReal;
		Standard_Boolean IsReal();

		/****************** IsSelect ******************/
		%feature("compactdefaultargs") IsSelect;
		%feature("autodoc", "Tells if <self> is for a select.

Returns
-------
bool
") IsSelect;
		Standard_Boolean IsSelect();

		/****************** IsString ******************/
		%feature("compactdefaultargs") IsString;
		%feature("autodoc", "Tells if <self> is for a string value.

Returns
-------
bool
") IsString;
		Standard_Boolean IsString();

		/****************** IsType ******************/
		%feature("compactdefaultargs") IsType;
		%feature("autodoc", "Tells if <self> is for an entity of a given cdl type (early-bnd) (works for <self> + nexts if <self> is a select).

Parameters
----------
atype: Standard_Type

Returns
-------
bool
") IsType;
		Standard_Boolean IsType(const opencascade::handle<Standard_Type> & atype);

		/****************** Member ******************/
		%feature("compactdefaultargs") Member;
		%feature("autodoc", "For a select, returns the member whose name matches <name> to this member, the following question can then be asked null handle if <name> not matched or <self> not a select //! remark : not to be asked for an entity type hence, following isinteger .. enum* only apply on <self> and require member while istype applies on <self> and all select members.

Parameters
----------
name: char *

Returns
-------
opencascade::handle<StepData_PDescr>
") Member;
		opencascade::handle<StepData_PDescr> Member(const char * name);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") Name;
		const char * Name();

		/****************** SetArity ******************/
		%feature("compactdefaultargs") SetArity;
		%feature("autodoc", "Directly sets the arity count 0 : simple field 1 : list or array etc 2 : list of list.

Parameters
----------
arity: int,optional
	default value is 1

Returns
-------
None
") SetArity;
		void SetArity(const Standard_Integer arity = 1);

		/****************** SetBoolean ******************/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "Sets <self> for a boolean value (false,true).

Returns
-------
None
") SetBoolean;
		void SetBoolean();

		/****************** SetDerived ******************/
		%feature("compactdefaultargs") SetDerived;
		%feature("autodoc", "Sets/unsets <self> to be for a derived field.

Parameters
----------
der: bool,optional
	default value is Standard_True

Returns
-------
None
") SetDerived;
		void SetDerived(const Standard_Boolean der = Standard_True);

		/****************** SetDescr ******************/
		%feature("compactdefaultargs") SetDescr;
		%feature("autodoc", "Sets <self> for a described entity, whose description must match the type name <dscnam>.

Parameters
----------
dscnam: char *

Returns
-------
None
") SetDescr;
		void SetDescr(const char * dscnam);

		/****************** SetEnum ******************/
		%feature("compactdefaultargs") SetEnum;
		%feature("autodoc", "Sets <self> for an enum value then, call addenumdef ordered from the first one (value 0).

Returns
-------
None
") SetEnum;
		void SetEnum();

		/****************** SetField ******************/
		%feature("compactdefaultargs") SetField;
		%feature("autodoc", "Sets <self> to describe a field of an entity with a name and a rank.

Parameters
----------
name: char *
rank: int

Returns
-------
None
") SetField;
		void SetField(const char * name, const Standard_Integer rank);

		/****************** SetFrom ******************/
		%feature("compactdefaultargs") SetFrom;
		%feature("autodoc", "Sets <self> as <other> but duplicated hence, some definition may be changed.

Parameters
----------
other: StepData_PDescr

Returns
-------
None
") SetFrom;
		void SetFrom(const opencascade::handle<StepData_PDescr> & other);

		/****************** SetInteger ******************/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "Sets <self> for an integer value.

Returns
-------
None
") SetInteger;
		void SetInteger();

		/****************** SetLogical ******************/
		%feature("compactdefaultargs") SetLogical;
		%feature("autodoc", "Sets <self> for a logical value (false,true,unknown).

Returns
-------
None
") SetLogical;
		void SetLogical();

		/****************** SetMemberName ******************/
		%feature("compactdefaultargs") SetMemberName;
		%feature("autodoc", "Sets a name for select member. to be used if a member is for an immediate type.

Parameters
----------
memname: char *

Returns
-------
None
") SetMemberName;
		void SetMemberName(const char * memname);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *

Returns
-------
None
") SetName;
		void SetName(const char * name);

		/****************** SetOptional ******************/
		%feature("compactdefaultargs") SetOptional;
		%feature("autodoc", "Sets/unsets <self> to accept undefined values.

Parameters
----------
opt: bool,optional
	default value is Standard_True

Returns
-------
None
") SetOptional;
		void SetOptional(const Standard_Boolean opt = Standard_True);

		/****************** SetReal ******************/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "Sets <self> for a real value.

Returns
-------
None
") SetReal;
		void SetReal();

		/****************** SetSelect ******************/
		%feature("compactdefaultargs") SetSelect;
		%feature("autodoc", "Declares this pdescr to be a select, hence to have members <self> itself can be the first member.

Returns
-------
None
") SetSelect;
		void SetSelect();

		/****************** SetString ******************/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "Sets <self> for a string value.

Returns
-------
None
") SetString;
		void SetString();

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "Sets <self> for an entity which must match a type (early-bound).

Parameters
----------
atype: Standard_Type

Returns
-------
None
") SetType;
		void SetType(const opencascade::handle<Standard_Type> & atype);

		/****************** Simple ******************/
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", "For a list or list of list, returns the pdescr for the simpler pdescr. else, returns <self> this allows to have different attributes for optional for instance, on a field, and on the parameter of a list : [optional] list of [optional] ...

Returns
-------
opencascade::handle<StepData_PDescr>
") Simple;
		opencascade::handle<StepData_PDescr> Simple();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type to match (iskind), for a cdl entity (else, null handle).

Returns
-------
opencascade::handle<Standard_Type>
") Type;
		opencascade::handle<Standard_Type> Type();

};


%make_alias(StepData_PDescr)

%extend StepData_PDescr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class StepData_Protocol *
**************************/
class StepData_Protocol : public Interface_Protocol {
	public:
		/****************** StepData_Protocol ******************/
		%feature("compactdefaultargs") StepData_Protocol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepData_Protocol;
		 StepData_Protocol();

		/****************** AddBasicDescr ******************/
		%feature("compactdefaultargs") AddBasicDescr;
		%feature("autodoc", "Records an esdescr, intended to build complex descriptions.

Parameters
----------
esdescr: StepData_ESDescr

Returns
-------
None
") AddBasicDescr;
		void AddBasicDescr(const opencascade::handle<StepData_ESDescr> & esdescr);

		/****************** AddDescr ******************/
		%feature("compactdefaultargs") AddDescr;
		%feature("autodoc", "Records an edescr with its case number also records its name for an esdescr (simple type): an esdescr is then used, for case number, or for type name.

Parameters
----------
adescr: StepData_EDescr
CN: int

Returns
-------
None
") AddDescr;
		void AddDescr(const opencascade::handle<StepData_EDescr> & adescr, const Standard_Integer CN);

		/****************** AddPDescr ******************/
		%feature("compactdefaultargs") AddPDescr;
		%feature("autodoc", "Records an pdescr.

Parameters
----------
pdescr: StepData_PDescr

Returns
-------
None
") AddPDescr;
		void AddPDescr(const opencascade::handle<StepData_PDescr> & pdescr);

		/****************** BasicDescr ******************/
		%feature("compactdefaultargs") BasicDescr;
		%feature("autodoc", "Returns a basic description according to its name <anylevel> true (d) : for <self> and its resources <anylevel> false : for <self> only.

Parameters
----------
name: char *
anylevel: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<StepData_EDescr>
") BasicDescr;
		opencascade::handle<StepData_EDescr> BasicDescr(const char * name, const Standard_Boolean anylevel = Standard_True);

		/****************** CaseNumber ******************/
		%feature("compactdefaultargs") CaseNumber;
		%feature("autodoc", "Returns a unique positive number for any recognized entity redefined to work by calling both typenumber and, for a described entity (late binding) descrnumber.

Parameters
----------
obj: Standard_Transient

Returns
-------
int
") CaseNumber;
		virtual Standard_Integer CaseNumber(const opencascade::handle<Standard_Transient> & obj);

		/****************** Descr ******************/
		%feature("compactdefaultargs") Descr;
		%feature("autodoc", "Returns the description attached to a case number, or null.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepData_EDescr>
") Descr;
		opencascade::handle<StepData_EDescr> Descr(const Standard_Integer num);

		/****************** Descr ******************/
		%feature("compactdefaultargs") Descr;
		%feature("autodoc", "Returns a description according to its name <anylevel> true (d) : for <self> and its resources <anylevel> false : for <self> only.

Parameters
----------
name: char *
anylevel: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<StepData_EDescr>
") Descr;
		opencascade::handle<StepData_EDescr> Descr(const char * name, const Standard_Boolean anylevel = Standard_True);

		/****************** DescrNumber ******************/
		%feature("compactdefaultargs") DescrNumber;
		%feature("autodoc", "Returns a unique positive casenumber for types described by an edescr (late binding) warning : typenumber and descrnumber must give together a unique positive case number for each distinct case, type or descr.

Parameters
----------
adescr: StepData_EDescr

Returns
-------
int
") DescrNumber;
		virtual Standard_Integer DescrNumber(const opencascade::handle<StepData_EDescr> & adescr);

		/****************** ECDescr ******************/
		%feature("compactdefaultargs") ECDescr;
		%feature("autodoc", "Returns a complex description according to list of names <anylevel> true (d) : for <self> and its resources <anylevel> false : for <self> only.

Parameters
----------
names: TColStd_SequenceOfAsciiString
anylevel: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<StepData_ECDescr>
") ECDescr;
		opencascade::handle<StepData_ECDescr> ECDescr(const TColStd_SequenceOfAsciiString & names, const Standard_Boolean anylevel = Standard_True);

		/****************** ESDescr ******************/
		%feature("compactdefaultargs") ESDescr;
		%feature("autodoc", "Idem as descr but cast to simple description.

Parameters
----------
name: char *
anylevel: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<StepData_ESDescr>
") ESDescr;
		opencascade::handle<StepData_ESDescr> ESDescr(const char * name, const Standard_Boolean anylevel = Standard_True);

		/****************** HasDescr ******************/
		%feature("compactdefaultargs") HasDescr;
		%feature("autodoc", "Tells if a protocol brings at least one esdescr, i.e. if it defines at least one entity description by esdescr mechanism.

Returns
-------
bool
") HasDescr;
		Standard_Boolean HasDescr();

		/****************** IsSuitableModel ******************/
		%feature("compactdefaultargs") IsSuitableModel;
		%feature("autodoc", "Returns true if <model> is a model of step norm.

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
bool
") IsSuitableModel;
		Standard_Boolean IsSuitableModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** IsUnknownEntity ******************/
		%feature("compactdefaultargs") IsUnknownEntity;
		%feature("autodoc", "Returns true if <ent> is an unknown entity for the norm, i.e. type undefinedentity, status unknown.

Parameters
----------
ent: Standard_Transient

Returns
-------
bool
") IsUnknownEntity;
		Standard_Boolean IsUnknownEntity(const opencascade::handle<Standard_Transient> & ent);

		/****************** NbResources ******************/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Gives the count of protocols used as resource (can be zero) here, no resource.

Returns
-------
int
") NbResources;
		Standard_Integer NbResources();

		/****************** NewModel ******************/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Creates an empty model for step norm.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****************** PDescr ******************/
		%feature("compactdefaultargs") PDescr;
		%feature("autodoc", "Returns a parameter description according to its name <anylevel> true (d) : for <self> and its resources <anylevel> false : for <self> only.

Parameters
----------
name: char *
anylevel: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<StepData_PDescr>
") PDescr;
		opencascade::handle<StepData_PDescr> PDescr(const char * name, const Standard_Boolean anylevel = Standard_True);

		/****************** Resource ******************/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "Returns a resource, given a rank. here, none.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Interface_Protocol>
") Resource;
		opencascade::handle<Interface_Protocol> Resource(const Standard_Integer num);

		/****************** SchemaName ******************/
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "Returns the schema name attached to each class of protocol to be redefined by each sub-class here, schemaname returns '(default)' was c++ : return const.

Returns
-------
char *
") SchemaName;
		virtual const char * SchemaName();

		/****************** TypeNumber ******************/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "Returns a case number, specific of each recognized type here, only unknown entity is recognized.

Parameters
----------
atype: Standard_Type

Returns
-------
int
") TypeNumber;
		Standard_Integer TypeNumber(const opencascade::handle<Standard_Type> & atype);

		/****************** UnknownEntity ******************/
		%feature("compactdefaultargs") UnknownEntity;
		%feature("autodoc", "Creates a new unknown entity for step (undefinedentity).

Returns
-------
opencascade::handle<Standard_Transient>
") UnknownEntity;
		opencascade::handle<Standard_Transient> UnknownEntity();

};


%make_alias(StepData_Protocol)

%extend StepData_Protocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepData_ReadWriteModule *
*********************************/
%nodefaultctor StepData_ReadWriteModule;
class StepData_ReadWriteModule : public Interface_ReaderModule {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Translate the type of record <num> in <data> to a positive case number, or 0 if failed. works with a stepreaderdata, in which the type of an entity is defined as a string : reads the recordtype <num> then calls casenum (this type) warning : the methods casestep, steptype and recognize, must be in phase (triplets casenum-steptype-type of object).

Parameters
----------
data: Interface_FileReaderData
num: int

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Interface_FileReaderData> & data, const Standard_Integer num);

		/****************** CaseStep ******************/
		%feature("compactdefaultargs") CaseStep;
		%feature("autodoc", "Defines case numbers corresponding to the recognized types called by casenum (data,num) above for a simple type entity warning : casestep must give the same value as protocol does for the entity type which corresponds to this type given as a string.

Parameters
----------
atype: TCollection_AsciiString

Returns
-------
int
") CaseStep;
		virtual Standard_Integer CaseStep(const TCollection_AsciiString & atype);

		/****************** CaseStep ******************/
		%feature("compactdefaultargs") CaseStep;
		%feature("autodoc", "Same a above but for a complex type entity ('plex') the provided default recognizes nothing.

Parameters
----------
types: TColStd_SequenceOfAsciiString

Returns
-------
int
") CaseStep;
		virtual Standard_Integer CaseStep(const TColStd_SequenceOfAsciiString & types);

		/****************** ComplexType ******************/
		%feature("compactdefaultargs") ComplexType;
		%feature("autodoc", "Function specific to step, which delivers the list of types which corresponds to a complex type. if <cn> is not for a complex type, this method returns false. else it returns true and fills the list in alphabetic order. the default returns false. to be redefined as required.

Parameters
----------
CN: int
types: TColStd_SequenceOfAsciiString

Returns
-------
bool
") ComplexType;
		virtual Standard_Boolean ComplexType(const Standard_Integer CN, TColStd_SequenceOfAsciiString & types);

		/****************** IsComplex ******************/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Returns true if the case number corresponds to a complex type ('plex'). remember that all possible combinations must be aknowledged to be processed default is false for all cases. for a protocol which defines possible plexes, this method must be redefined.

Parameters
----------
CN: int

Returns
-------
bool
") IsComplex;
		virtual Standard_Boolean IsComplex(const Standard_Integer CN);

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "General read function, calls readstep.

Parameters
----------
CN: int
data: Interface_FileReaderData
num: int
ach: Interface_Check
ent: Standard_Transient

Returns
-------
None
") Read;
		void Read(const Standard_Integer CN, const opencascade::handle<Interface_FileReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<Standard_Transient> & ent);

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Specific read function. works with stepreaderdata.

Parameters
----------
CN: int
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: Standard_Transient

Returns
-------
None
") ReadStep;
		virtual void ReadStep(const Standard_Integer CN, const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<Standard_Transient> & ent);

		/****************** ShortType ******************/
		%feature("compactdefaultargs") ShortType;
		%feature("autodoc", "Function specific to step. some step types have a short form this method can be redefined to fill it by default, returns an empty string, which is then interpreted to take normal form from steptype.

Parameters
----------
CN: int

Returns
-------
TCollection_AsciiString
") ShortType;
		virtual TCollection_AsciiString ShortType(const Standard_Integer CN);

		/****************** StepType ******************/
		%feature("compactdefaultargs") StepType;
		%feature("autodoc", "Function specific to step, which delivers the steptype as it is recorded in and read from a file compliant with step. this method is symmetric to the method casestep. steptype can be different from dynamic type's name, but belongs to the same class of object. returns an empty string if <cn> is zero. warning : for a complex type entity, returns an empty string (complex type must be managed by users).

Parameters
----------
CN: int

Returns
-------
TCollection_AsciiString
") StepType;
		virtual const TCollection_AsciiString & StepType(const Standard_Integer CN);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Write function, switched by casenum.

Parameters
----------
CN: int
SW: StepData_StepWriter
ent: Standard_Transient

Returns
-------
None
") WriteStep;
		virtual void WriteStep(const Standard_Integer CN, StepData_StepWriter & SW, const opencascade::handle<Standard_Transient> & ent);

};


%make_alias(StepData_ReadWriteModule)

%extend StepData_ReadWriteModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepData_SelectMember *
******************************/
class StepData_SelectMember : public Standard_Transient {
	public:
		/****************** StepData_SelectMember ******************/
		%feature("compactdefaultargs") StepData_SelectMember;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepData_SelectMember;
		 StepData_SelectMember();

		/****************** Boolean ******************/
		%feature("compactdefaultargs") Boolean;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Boolean;
		Standard_Boolean Boolean();

		/****************** Enum ******************/
		%feature("compactdefaultargs") Enum;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Enum;
		Standard_Integer Enum();

		/****************** EnumText ******************/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") EnumText;
		virtual const char * EnumText();

		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Tells if a selectmember has a name. default is false.

Returns
-------
bool
") HasName;
		virtual Standard_Boolean HasName();

		/****************** Int ******************/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "This internal method gives access to a value implemented by an integer (to read it).

Returns
-------
int
") Int;
		virtual Standard_Integer Int();

		/****************** Integer ******************/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "Gets the value as an integer.

Returns
-------
int
") Integer;
		Standard_Integer Integer();

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Kind;
		virtual Standard_Integer Kind();

		/****************** Logical ******************/
		%feature("compactdefaultargs") Logical;
		%feature("autodoc", "No available documentation.

Returns
-------
StepData_Logical
") Logical;
		StepData_Logical Logical();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Tells if the name of a selectmember matches a given one by default, compares the strings, can be redefined (optimised).

Parameters
----------
name: char *

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(const char * name);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name of a selectmember. default is empty.

Returns
-------
char *
") Name;
		virtual const char * Name();

		/****************** ParamType ******************/
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "Returns the kind of the selectmember, under the form of an enum paramtype.

Returns
-------
Interface_ParamType
") ParamType;
		Interface_ParamType ParamType();

		/****************** Real ******************/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Real;
		virtual Standard_Real Real();

		/****************** SetBoolean ******************/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: bool

Returns
-------
None
") SetBoolean;
		void SetBoolean(const Standard_Boolean val);

		/****************** SetEnum ******************/
		%feature("compactdefaultargs") SetEnum;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: int
text: char *,optional
	default value is ""

Returns
-------
None
") SetEnum;
		void SetEnum(const Standard_Integer val, const char * text = "");

		/****************** SetEnumText ******************/
		%feature("compactdefaultargs") SetEnumText;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: int
text: char *

Returns
-------
None
") SetEnumText;
		virtual void SetEnumText(const Standard_Integer val, const char * text);

		/****************** SetInt ******************/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "This internal method gives access to a value implemented by an integer (to set it).

Parameters
----------
val: int

Returns
-------
None
") SetInt;
		virtual void SetInt(const Standard_Integer val);

		/****************** SetInteger ******************/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: int

Returns
-------
None
") SetInteger;
		void SetInteger(const Standard_Integer val);

		/****************** SetKind ******************/
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "No available documentation.

Parameters
----------
kind: int

Returns
-------
None
") SetKind;
		virtual void SetKind(const Standard_Integer kind);

		/****************** SetLogical ******************/
		%feature("compactdefaultargs") SetLogical;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: StepData_Logical

Returns
-------
None
") SetLogical;
		void SetLogical(const StepData_Logical val);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Sets the name of a selectmember, returns true if done, false if no name is allowed default does nothing and returns false.

Parameters
----------
name: char *

Returns
-------
bool
") SetName;
		virtual Standard_Boolean SetName(const char * name);

		/****************** SetReal ******************/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: float

Returns
-------
None
") SetReal;
		virtual void SetReal(const Standard_Real val);

		/****************** SetString ******************/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: char *

Returns
-------
None
") SetString;
		virtual void SetString(const char * val);

		/****************** String ******************/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") String;
		virtual const char * String();

};


%make_alias(StepData_SelectMember)

%extend StepData_SelectMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepData_SelectType *
****************************/
%nodefaultctor StepData_SelectType;
class StepData_SelectType {
	public:
		/****************** Boolean ******************/
		%feature("compactdefaultargs") Boolean;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Boolean;
		Standard_Boolean Boolean();

		/****************** CaseMem ******************/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "Recognize a selectmember (kind, name). returns a positive value which identifies the case in the list of immediate cases (distinct from the list of entity types). zero if not recognizes default returns 0, saying that no immediate value is allowed.

Parameters
----------
ent: StepData_SelectMember

Returns
-------
int
") CaseMem;
		virtual Standard_Integer CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****************** CaseMember ******************/
		%feature("compactdefaultargs") CaseMember;
		%feature("autodoc", "Returns the type of the stored selectmember, or zero if it is null or entity. calls the method casemem on value.

Returns
-------
int
") CaseMember;
		Standard_Integer CaseMember();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes the type of an entity. returns a positive number which identifies the type in the definition list of the selecttype. returns zero if its type in not in this list.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		virtual Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** CaseNumber ******************/
		%feature("compactdefaultargs") CaseNumber;
		%feature("autodoc", "Recognizes the type of the stored entity, or zero if it is null or selectmember. calls the first method casenum on value.

Returns
-------
int
") CaseNumber;
		Standard_Integer CaseNumber();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns the description which corresponds to <self> null if no specific description to give. this description is used to control reading an check validity. default returns a null handle, i.e. undefined description it can suffice if casenum and casemem give enough control.

Returns
-------
opencascade::handle<StepData_PDescr>
") Description;
		virtual opencascade::handle<StepData_PDescr> Description();

		/****************** Int ******************/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "This internal method gives access to a value implemented by an integer (to read it).

Returns
-------
int
") Int;
		Standard_Integer Int();

		/****************** Integer ******************/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "Gets the value as an integer.

Returns
-------
int
") Integer;
		Standard_Integer Integer();

		/****************** IsNull ******************/
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "Returns true if there is no stored entity (i.e. it is null).

Returns
-------
bool
") IsNull;
		Standard_Boolean IsNull();

		/****************** Logical ******************/
		%feature("compactdefaultargs") Logical;
		%feature("autodoc", "No available documentation.

Returns
-------
StepData_Logical
") Logical;
		StepData_Logical Logical();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Returns true if the type of an entity complies with the definition list of the selecttype. also checks for a selectmember default implementation looks for casenum or casemem positive.

Parameters
----------
ent: Standard_Transient

Returns
-------
bool
") Matches;
		Standard_Boolean Matches(const opencascade::handle<Standard_Transient> & ent);

		/****************** Member ******************/
		%feature("compactdefaultargs") Member;
		%feature("autodoc", "Returns value as a selectmember. null if not a selectmember.

Returns
-------
opencascade::handle<StepData_SelectMember>
") Member;
		opencascade::handle<StepData_SelectMember> Member();

		/****************** NewMember ******************/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Returns a preferred selectmember. default returns a null by default, a selectmember can be set according to data type and name : it is a selectnamed if name is defined //! this method allows to define, for a specific selecttype, a specific selectmember than selectnamed. for instance for a real plus a name, a selectreal plus a case number is a good solution, lighter than selectnamed which is very multipurpose.

Returns
-------
opencascade::handle<StepData_SelectMember>
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember();

		/****************** Nullify ******************/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "Nullifies the stored entity.

Returns
-------
None
") Nullify;
		void Nullify();

		/****************** Real ******************/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Real;
		Standard_Real Real();

		/****************** SelectName ******************/
		%feature("compactdefaultargs") SelectName;
		%feature("autodoc", "Returns the type name of selectmember. if no selectmember or with no type name, returns an empty string to change it, pass through the selectmember itself.

Returns
-------
char *
") SelectName;
		const char * SelectName();

		/****************** SetBoolean ******************/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: bool
name: char *,optional
	default value is ""

Returns
-------
None
") SetBoolean;
		void SetBoolean(const Standard_Boolean val, const char * name = "");

		/****************** SetInt ******************/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "This internal method gives access to a value implemented by an integer (to set it) : a selectmember must already be there !.

Parameters
----------
val: int

Returns
-------
None
") SetInt;
		void SetInt(const Standard_Integer val);

		/****************** SetInteger ******************/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "Sets a new integer value, with an optional type name warning : if a selectmember is already set, works on it : value and name must then be accepted by this selectmember.

Parameters
----------
val: int
name: char *,optional
	default value is ""

Returns
-------
None
") SetInteger;
		void SetInteger(const Standard_Integer val, const char * name = "");

		/****************** SetLogical ******************/
		%feature("compactdefaultargs") SetLogical;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: StepData_Logical
name: char *,optional
	default value is ""

Returns
-------
None
") SetLogical;
		void SetLogical(const StepData_Logical val, const char * name = "");

		/****************** SetReal ******************/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: float
name: char *,optional
	default value is ""

Returns
-------
None
") SetReal;
		void SetReal(const Standard_Real val, const char * name = "");

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Stores an entity. this allows to define a specific selecttype class with one read method per member type, which returns the value casted with the good type.

Parameters
----------
ent: Standard_Transient

Returns
-------
None
") SetValue;
		void SetValue(const opencascade::handle<Standard_Transient> & ent);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the effective (dynamic) type of the stored entity if it is null, returns type(transient).

Returns
-------
opencascade::handle<Standard_Type>
") Type;
		opencascade::handle<Standard_Type> Type();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the stored entity. can be used to define specific read methods (see above).

Returns
-------
opencascade::handle<Standard_Transient>
") Value;
		const opencascade::handle<Standard_Transient> & Value();

};


%extend StepData_SelectType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepData_StepDumper *
****************************/
class StepData_StepDumper {
	public:
		/****************** StepData_StepDumper ******************/
		%feature("compactdefaultargs") StepData_StepDumper;
		%feature("autodoc", "Creates a stepdumper, able to work on a given stepmodel (which defines the total scope for dumping entities) and a given protocol from step (which defines the authorized types to be dumped) <mode> commands what is to be displayed (number or label) 0 for number (and corresponding labels are displayed apart) 1 for label (and corresponding numbers are displayed apart) 2 for label without anymore.

Parameters
----------
amodel: StepData_StepModel
protocol: StepData_Protocol
mode: int,optional
	default value is 0

Returns
-------
None
") StepData_StepDumper;
		 StepData_StepDumper(const opencascade::handle<StepData_StepModel> & amodel, const opencascade::handle<StepData_Protocol> & protocol, const Standard_Integer mode = 0);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dumps a entity on an messenger. returns true if sucess, false, if the entity to dump has not been recognized by the protocol. <level> can have one of these values : - 0 : prints the type only, as known in step files (steptype) if <ent> has not been regognized by the protocol, or if its type is complex, the steptype is replaced by the display of the cdl type. complex type are well processed by level 1. - 1 : dumps the entity, completely (whatever it has simple or complex type) but alone. - 2 : dumps the entity completely, plus the item its refers to at first level (a header message designates the starting entity of the dump) <lists shared and implied> - 3 : dumps the entity and its refered items at any levels //! for levels 1,2,3, the numbers displayed (form #nnn) are the numbers of the corresponding entities in the model.

Parameters
----------
S: Message_Messenger
ent: Standard_Transient
level: int

Returns
-------
bool
") Dump;
		Standard_Boolean Dump(const opencascade::handle<Message_Messenger> & S, const opencascade::handle<Standard_Transient> & ent, const Standard_Integer level);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Works as dump with a transient, but directly takes the entity designated by its number in the model returns false, also if <num> is out of range.

Parameters
----------
S: Message_Messenger
num: int
level: int

Returns
-------
bool
") Dump;
		Standard_Boolean Dump(const opencascade::handle<Message_Messenger> & S, const Standard_Integer num, const Standard_Integer level);

		/****************** StepWriter ******************/
		%feature("compactdefaultargs") StepWriter;
		%feature("autodoc", "Gives an access to the tool which is used to work : this allow to acts on some parameters : floating format, scopes ...

Returns
-------
StepData_StepWriter
") StepWriter;
		StepData_StepWriter & StepWriter();

};


%extend StepData_StepDumper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepData_StepModel *
***************************/
class StepData_StepModel : public Interface_InterfaceModel {
	public:
		/****************** StepData_StepModel ******************/
		%feature("compactdefaultargs") StepData_StepModel;
		%feature("autodoc", "Creates an empty step model with an empty header.

Returns
-------
None
") StepData_StepModel;
		 StepData_StepModel();

		/****************** AddHeaderEntity ******************/
		%feature("compactdefaultargs") AddHeaderEntity;
		%feature("autodoc", "Adds an entity to the header.

Parameters
----------
ent: Standard_Transient

Returns
-------
None
") AddHeaderEntity;
		void AddHeaderEntity(const opencascade::handle<Standard_Transient> & ent);

		/****************** ClearHeader ******************/
		%feature("compactdefaultargs") ClearHeader;
		%feature("autodoc", "Clears the header.

Returns
-------
None
") ClearHeader;
		void ClearHeader();

		/****************** ClearLabels ******************/
		%feature("compactdefaultargs") ClearLabels;
		%feature("autodoc", "Erases specific labels, i.e. clears the map (entity-ident).

Returns
-------
None
") ClearLabels;
		void ClearLabels();

		/****************** DumpHeader ******************/
		%feature("compactdefaultargs") DumpHeader;
		%feature("autodoc", "Dumps the header, with the header protocol of stepdata. if the header protocol is not defined, for each header entity, prints its type. else sends the header under the form of header section of an ascii step file <level> is not used because header is not so big.

Parameters
----------
S: Message_Messenger
level: int,optional
	default value is 0

Returns
-------
None
") DumpHeader;
		void DumpHeader(const opencascade::handle<Message_Messenger> & S, const Standard_Integer level = 0);

		/****************** Entity ******************/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "Returns entity given its rank. same as interfaceentity, but with a shorter name.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Standard_Transient>
") Entity;
		opencascade::handle<Standard_Transient> Entity(const Standard_Integer num);

		/****************** GetFromAnother ******************/
		%feature("compactdefaultargs") GetFromAnother;
		%feature("autodoc", "Gets header from another model (uses header protocol).

Parameters
----------
other: Interface_InterfaceModel

Returns
-------
None
") GetFromAnother;
		void GetFromAnother(const opencascade::handle<Interface_InterfaceModel> & other);

		/****************** HasHeaderEntity ******************/
		%feature("compactdefaultargs") HasHeaderEntity;
		%feature("autodoc", "Says if a header entity has a specifed type.

Parameters
----------
atype: Standard_Type

Returns
-------
bool
") HasHeaderEntity;
		Standard_Boolean HasHeaderEntity(const opencascade::handle<Standard_Type> & atype);

		/****************** Header ******************/
		%feature("compactdefaultargs") Header;
		%feature("autodoc", "Returns header entities under the form of an iterator.

Returns
-------
Interface_EntityIterator
") Header;
		Interface_EntityIterator Header();

		/****************** HeaderEntity ******************/
		%feature("compactdefaultargs") HeaderEntity;
		%feature("autodoc", "Returns header entity with specified type, if there is.

Parameters
----------
atype: Standard_Type

Returns
-------
opencascade::handle<Standard_Transient>
") HeaderEntity;
		opencascade::handle<Standard_Transient> HeaderEntity(const opencascade::handle<Standard_Type> & atype);

		/****************** IdentLabel ******************/
		%feature("compactdefaultargs") IdentLabel;
		%feature("autodoc", "Returns the label ident attached to an entity, 0 if not in me.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") IdentLabel;
		Standard_Integer IdentLabel(const opencascade::handle<Standard_Transient> & ent);

		/****************** NewEmptyModel ******************/
		%feature("compactdefaultargs") NewEmptyModel;
		%feature("autodoc", "Returns a new empty model, same type as <self>, i.e. stepmodel.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewEmptyModel;
		opencascade::handle<Interface_InterfaceModel> NewEmptyModel();

		/****************** PrintLabel ******************/
		%feature("compactdefaultargs") PrintLabel;
		%feature("autodoc", "Prints label specific to step norm for a given entity, i.e. if a labelident has been recorded, its value with '#', else the number in the model with '#' and between ().

Parameters
----------
ent: Standard_Transient
S: Message_Messenger

Returns
-------
None
") PrintLabel;
		void PrintLabel(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Message_Messenger> & S);

		/****************** SetIdentLabel ******************/
		%feature("compactdefaultargs") SetIdentLabel;
		%feature("autodoc", "Attaches an ident to an entity to produce a label (does nothing if <ent> is not in <self>).

Parameters
----------
ent: Standard_Transient
ident: int

Returns
-------
None
") SetIdentLabel;
		void SetIdentLabel(const opencascade::handle<Standard_Transient> & ent, const Standard_Integer ident);

		/****************** StringLabel ******************/
		%feature("compactdefaultargs") StringLabel;
		%feature("autodoc", "Returns a string with the label attached to a given entity, same form as for printlabel.

Parameters
----------
ent: Standard_Transient

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") StringLabel;
		opencascade::handle<TCollection_HAsciiString> StringLabel(const opencascade::handle<Standard_Transient> & ent);

		/****************** VerifyCheck ******************/
		%feature("compactdefaultargs") VerifyCheck;
		%feature("autodoc", "Specific check, checks header items with headerprotocol.

Parameters
----------
ach: Interface_Check

Returns
-------
None
") VerifyCheck;
		virtual void VerifyCheck(opencascade::handle<Interface_Check> & ach);

};


%make_alias(StepData_StepModel)

%extend StepData_StepModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepData_StepReaderData *
********************************/
class StepData_StepReaderData : public Interface_FileReaderData {
	public:
		/****************** StepData_StepReaderData ******************/
		%feature("compactdefaultargs") StepData_StepReaderData;
		%feature("autodoc", "Creates stepreaderdata correctly dimensionned (necessary at creation time, because it contains arrays) nbheader is nb of records for header, nbtotal for header+data and nbpar gives the total count of parameters.

Parameters
----------
nbheader: int
nbtotal: int
nbpar: int

Returns
-------
None
") StepData_StepReaderData;
		 StepData_StepReaderData(const Standard_Integer nbheader, const Standard_Integer nbtotal, const Standard_Integer nbpar);

		/****************** AddStepParam ******************/
		%feature("compactdefaultargs") AddStepParam;
		%feature("autodoc", "Fills the fields of a parameter of a record. this is a variant of addparam, adapted to step (optimized for specific values).

Parameters
----------
num: int
aval: char *
atype: Interface_ParamType
nument: int,optional
	default value is 0

Returns
-------
None
") AddStepParam;
		void AddStepParam(const Standard_Integer num, const char * aval, const Interface_ParamType atype, const Standard_Integer nument = 0);

		/****************** CType ******************/
		%feature("compactdefaultargs") CType;
		%feature("autodoc", "Returns record type as a cstring was c++ : return const.

Parameters
----------
num: int

Returns
-------
char *
") CType;
		const char * CType(const Standard_Integer num);

		/****************** CheckDerived ******************/
		%feature("compactdefaultargs") CheckDerived;
		%feature("autodoc", "Checks if parameter <nump> of record <num> is given as derived if this check is successful (i.e. param = '*'), returns true else, fills <ach> with a message which contains <mess> and returns false. according to <errstat>, this message is warning if errstat is false (default), fail if errstat is true.

Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check
errstat: bool,optional
	default value is Standard_False

Returns
-------
bool
") CheckDerived;
		Standard_Boolean CheckDerived(const Standard_Integer num, const Standard_Integer nump, const char * mess, opencascade::handle<Interface_Check> & ach, const Standard_Boolean errstat = Standard_False);

		/****************** CheckNbParams ******************/
		%feature("compactdefaultargs") CheckNbParams;
		%feature("autodoc", "Checks count of parameters of record <num> to equate <nbreq> if this check is successful, returns true else, fills <ach> with an error message then returns false <mess> is included in the error message if given non empty.

Parameters
----------
num: int
nbreq: int
ach: Interface_Check
mess: char *,optional
	default value is ""

Returns
-------
bool
") CheckNbParams;
		Standard_Boolean CheckNbParams(const Standard_Integer num, const Standard_Integer nbreq, opencascade::handle<Interface_Check> & ach, const char * mess = "");

		/****************** ComplexType ******************/
		%feature("compactdefaultargs") ComplexType;
		%feature("autodoc", "Returns the list of types which correspond to a complex type entity. if not complex, there is just one type in it for a sublist or a scope mark, <types> remains empty.

Parameters
----------
num: int
types: TColStd_SequenceOfAsciiString

Returns
-------
None
") ComplexType;
		void ComplexType(const Standard_Integer num, TColStd_SequenceOfAsciiString & types);

		/****************** FailEnumValue ******************/
		%feature("compactdefaultargs") FailEnumValue;
		%feature("autodoc", "Fills a check with a fail message if enumeration value does match parameter definition just a help to centralize message definitions.

Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check

Returns
-------
None
") FailEnumValue;
		void FailEnumValue(const Standard_Integer num, const Standard_Integer nump, const char * mess, opencascade::handle<Interface_Check> & ach);

		/****************** FindNextHeaderRecord ******************/
		%feature("compactdefaultargs") FindNextHeaderRecord;
		%feature("autodoc", "Determine first suitable record of header works as findnextrecord, but treats only header records.

Parameters
----------
num: int

Returns
-------
int
") FindNextHeaderRecord;
		Standard_Integer FindNextHeaderRecord(const Standard_Integer num);

		/****************** FindNextRecord ******************/
		%feature("compactdefaultargs") FindNextRecord;
		%feature("autodoc", "Determines the first suitable record following a given one that is, skips scope,endscope and sublist records note : skips header records, which are accessed separately.

Parameters
----------
num: int

Returns
-------
int
") FindNextRecord;
		Standard_Integer FindNextRecord(const Standard_Integer num);

		/****************** GlobalCheck ******************/
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "Returns the global check. it can record fail messages about undefined references (detected by setentitynumbers).

Returns
-------
opencascade::handle<Interface_Check>
") GlobalCheck;
		const opencascade::handle<Interface_Check> GlobalCheck();

		/****************** IsComplex ******************/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Returns true if <num> corresponds to a complex type entity (as can be defined by andor express clause).

Parameters
----------
num: int

Returns
-------
bool
") IsComplex;
		Standard_Boolean IsComplex(const Standard_Integer num);

		/****************** NamedForComplex ******************/
		%feature("compactdefaultargs") NamedForComplex;
		%feature("autodoc", "Determines the first component which brings a given name, for a complex type entity <num0> is the very first record of this entity <num> is given the last nextnamedforcomplex, starts at zero it is returned as the newly found number hence, in the normal case, nextnamedforcomplex starts by num0 if <num> is zero, else by nextforcomplex(num) if the alphabetic order is not respected, it restarts from num0 and loops on nextforcomplex until finding <name> in case of 'non-alphabetic order', <ach> is filled with a warning for this name in case of 'not-found at all', <ach> is filled with a fail, and <num> is returned as zero //! returns true if alphabetic order, false else.

Parameters
----------
name: char *
num0: int
ach: Interface_Check

Returns
-------
num: int
") NamedForComplex;
		Standard_Boolean NamedForComplex(const char * name, const Standard_Integer num0, Standard_Integer &OutValue, opencascade::handle<Interface_Check> & ach);

		/****************** NamedForComplex ******************/
		%feature("compactdefaultargs") NamedForComplex;
		%feature("autodoc", "Determines the first component which brings a given name, or short name for a complex type entity <num0> is the very first record of this entity <num> is given the last nextnamedforcomplex, starts at zero it is returned as the newly found number hence, in the normal case, nextnamedforcomplex starts by num0 if <num> is zero, else by nextforcomplex(num) if the alphabetic order is not respected, it restarts from num0 and loops on nextforcomplex until finding <name> in case of 'non-alphabetic order', <ach> is filled with a warning for this name in case of 'not-found at all', <ach> is filled with a fail, and <num> is returned as zero //! returns true if alphabetic order, false else.

Parameters
----------
theName: char *
theShortName: char *
num0: int
ach: Interface_Check

Returns
-------
num: int
") NamedForComplex;
		Standard_Boolean NamedForComplex(const char * theName, const char * theShortName, const Standard_Integer num0, Standard_Integer &OutValue, opencascade::handle<Interface_Check> & ach);

		/****************** NbEntities ******************/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns total count of entities (including header).

Returns
-------
int
") NbEntities;
		virtual Standard_Integer NbEntities();

		/****************** NextForComplex ******************/
		%feature("compactdefaultargs") NextForComplex;
		%feature("autodoc", "Returns the next 'componant' for a complex type entity, of which <num> is already a componant (the first one or a next one) returns 0 for a simple type or for the last componant.

Parameters
----------
num: int

Returns
-------
int
") NextForComplex;
		Standard_Integer NextForComplex(const Standard_Integer num);

		/****************** PrepareHeader ******************/
		%feature("compactdefaultargs") PrepareHeader;
		%feature("autodoc", "Works as setentitynumbers but for header : more simple because there are no reference, only sub-lists.

Returns
-------
None
") PrepareHeader;
		void PrepareHeader();

		/****************** ReadAny ******************/
		%feature("compactdefaultargs") ReadAny;
		%feature("autodoc", "Reads parameter <nump> of record <num> into a transient value according to the type of the parameter : named for integer,boolean,logical,enum,real : selectnamed immediate integer,boolean,logical,enum,real : selectint/real text : hasciistring ident : the referenced entity sub-list not processed, see readsub this value is controlled by a parameter descriptor (pdescr), which controls its allowed type and value <ach> is filled if the read parameter does not match its description (the select is nevertheless created if possible) //! warning : val is in out, hence it is possible to predefine a specific selectmember then to fill it. if <val> is null or if the result is not a selectmember, val itself is returned a new ref for a select with a name, <val> must then be a selectnamed.

Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check
descr: StepData_PDescr
val: Standard_Transient

Returns
-------
bool
") ReadAny;
		Standard_Boolean ReadAny(const Standard_Integer num, const Standard_Integer nump, const char * mess, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepData_PDescr> & descr, opencascade::handle<Standard_Transient> & val);

		/****************** ReadBoolean ******************/
		%feature("compactdefaultargs") ReadBoolean;
		%feature("autodoc", "Reads parameter <nump> of record <num> as a boolean return value and check managed as by readreal (demands a boolean enum, i.e. text '.t.' for true or '.f.' for false).

Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check

Returns
-------
flag: bool
") ReadBoolean;
		Standard_Boolean ReadBoolean(const Standard_Integer num, const Standard_Integer nump, const char * mess, opencascade::handle<Interface_Check> & ach, Standard_Boolean &OutValue);

		/****************** ReadEnum ******************/
		%feature("compactdefaultargs") ReadEnum;
		%feature("autodoc", "Reads parameter <nump> of record <num> as an enumeration (text between dots) and converts it to an integer value, by an enumtool. returns true if ok, false if : this parameter is not enumeration, or is not recognized by the enumtool (with fail).

Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check
enumtool: StepData_EnumTool

Returns
-------
val: int
") ReadEnum;
		Standard_Boolean ReadEnum(const Standard_Integer num, const Standard_Integer nump, const char * mess, opencascade::handle<Interface_Check> & ach, const StepData_EnumTool & enumtool, Standard_Integer &OutValue);

		/****************** ReadEnumParam ******************/
		%feature("compactdefaultargs") ReadEnumParam;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check
text: char *

Returns
-------
bool
") ReadEnumParam;
		Standard_Boolean ReadEnumParam(const Standard_Integer num, const Standard_Integer nump, const char * mess, opencascade::handle<Interface_Check> & ach, const char * & text);

		/****************** ReadField ******************/
		%feature("compactdefaultargs") ReadField;
		%feature("autodoc", "Reads parameter <nump> of record <num> into a field, controlled by a parameter descriptor (pdescr), which controls its allowed type(s) and value <ach> is filled if the read parameter does not match its description (but the field is read anyway) if the description is not defined, no control is done returns true when done.

Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check
descr: StepData_PDescr
fild: StepData_Field

Returns
-------
bool
") ReadField;
		Standard_Boolean ReadField(const Standard_Integer num, const Standard_Integer nump, const char * mess, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepData_PDescr> & descr, StepData_Field & fild);

		/****************** ReadInteger ******************/
		%feature("compactdefaultargs") ReadInteger;
		%feature("autodoc", "Reads parameter <nump> of record <num> as a single integer. return value & check managed as by readxy (demands an integer).

Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check

Returns
-------
val: int
") ReadInteger;
		Standard_Boolean ReadInteger(const Standard_Integer num, const Standard_Integer nump, const char * mess, opencascade::handle<Interface_Check> & ach, Standard_Integer &OutValue);

		/****************** ReadList ******************/
		%feature("compactdefaultargs") ReadList;
		%feature("autodoc", "Reads a list of fields controlled by an esdescr.

Parameters
----------
num: int
ach: Interface_Check
descr: StepData_ESDescr
list: StepData_FieldList

Returns
-------
bool
") ReadList;
		Standard_Boolean ReadList(const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepData_ESDescr> & descr, StepData_FieldList & list);

		/****************** ReadLogical ******************/
		%feature("compactdefaultargs") ReadLogical;
		%feature("autodoc", "Reads parameter <nump> of record <num> as a logical return value and check managed as by readboolean (demands a logical enum, i.e. text '.t.', '.f.', or '.u.').

Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check
flag: StepData_Logical

Returns
-------
bool
") ReadLogical;
		Standard_Boolean ReadLogical(const Standard_Integer num, const Standard_Integer nump, const char * mess, opencascade::handle<Interface_Check> & ach, StepData_Logical & flag);

		/****************** ReadReal ******************/
		%feature("compactdefaultargs") ReadReal;
		%feature("autodoc", "Reads parameter <nump> of record <num> as a single real value. return value and check managed as by readxy (demands a real).

Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check

Returns
-------
val: float
") ReadReal;
		Standard_Boolean ReadReal(const Standard_Integer num, const Standard_Integer nump, const char * mess, opencascade::handle<Interface_Check> & ach, Standard_Real &OutValue);

		/****************** ReadString ******************/
		%feature("compactdefaultargs") ReadString;
		%feature("autodoc", "Reads parameter <nump> of record <num> as a string (text between quotes, quotes are removed by the read operation) return value and check managed as by readxy (demands a string).

Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check
val: TCollection_HAsciiString

Returns
-------
bool
") ReadString;
		Standard_Boolean ReadString(const Standard_Integer num, const Standard_Integer nump, const char * mess, opencascade::handle<Interface_Check> & ach, opencascade::handle<TCollection_HAsciiString> & val);

		/****************** ReadSub ******************/
		%feature("compactdefaultargs") ReadSub;
		%feature("autodoc", "Reads the content of a sub-list into a transient : selectnamed, or harray1 of integer,real,string,transient ... recursive call if list of list ... if a sub-list has mixed types, an harray1oftransient is produced, it may contain selectmember intended to be called by readfield the returned status is : negative if failed, 0 if empty. else the kind to be recorded in the field.

Parameters
----------
numsub: int
mess: char *
ach: Interface_Check
descr: StepData_PDescr
val: Standard_Transient

Returns
-------
int
") ReadSub;
		Standard_Integer ReadSub(const Standard_Integer numsub, const char * mess, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepData_PDescr> & descr, opencascade::handle<Standard_Transient> & val);

		/****************** ReadSubList ******************/
		%feature("compactdefaultargs") ReadSubList;
		%feature("autodoc", "Reads parameter <nump> of record <num> as a sub-list (may be typed, see readtypedparameter in this case) returns true if ok. else (not a list), returns false and feeds check with appropriate check if <optional> is true and param is not defined, returns true with <ach> not filled and <numsub> returned as 0 works with sublistnumber with <aslast> false (no specific case for last parameter).

Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check
optional: bool,optional
	default value is Standard_False
lenmin: int,optional
	default value is 0
lenmax: int,optional
	default value is 0

Returns
-------
numsub: int
") ReadSubList;
		Standard_Boolean ReadSubList(const Standard_Integer num, const Standard_Integer nump, const char * mess, opencascade::handle<Interface_Check> & ach, Standard_Integer &OutValue, const Standard_Boolean optional = Standard_False, const Standard_Integer lenmin = 0, const Standard_Integer lenmax = 0);

		/****************** ReadTypedParam ******************/
		%feature("compactdefaultargs") ReadTypedParam;
		%feature("autodoc", "Resolves a parameter which can be enclosed in a type def., as type(val). the parameter must then be read normally according its type. parameter to be resolved is <nump> of record <num> <mustbetyped> true demands a typed parameter <mustbetyped> false accepts a non-typed parameter as option mess and ach as usual <numr>,<numrp> are the resolved record and parameter numbers = num,nump if no type, else numrp=1 <typ> returns the recorded type, or empty string remark : a non-typed list is considered as 'non-typed'.

Parameters
----------
num: int
nump: int
mustbetyped: bool
mess: char *
ach: Interface_Check
typ: TCollection_AsciiString

Returns
-------
numr: int
numrp: int
") ReadTypedParam;
		Standard_Boolean ReadTypedParam(const Standard_Integer num, const Standard_Integer nump, const Standard_Boolean mustbetyped, const char * mess, opencascade::handle<Interface_Check> & ach, Standard_Integer &OutValue, Standard_Integer &OutValue, TCollection_AsciiString & typ);

		/****************** ReadXY ******************/
		%feature("compactdefaultargs") ReadXY;
		%feature("autodoc", "Reads parameter <nump> of record <num> as a sub-list of two reals x,y. returns true if ok. else, returns false and feeds check with appropriate fails (parameter not a sub-list, not two reals in the sub-list) composed with 'mess' which gives the name of the parameter.

Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check

Returns
-------
X: float
Y: float
") ReadXY;
		Standard_Boolean ReadXY(const Standard_Integer num, const Standard_Integer nump, const char * mess, opencascade::handle<Interface_Check> & ach, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ReadXYZ ******************/
		%feature("compactdefaultargs") ReadXYZ;
		%feature("autodoc", "Reads parameter <nump> of record <num> as a sub-list of three reals x,y,z. return value and check managed as by readxy (demands a sub-list of three reals).

Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check

Returns
-------
X: float
Y: float
Z: float
") ReadXYZ;
		Standard_Boolean ReadXYZ(const Standard_Integer num, const Standard_Integer nump, const char * mess, opencascade::handle<Interface_Check> & ach, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** RecordIdent ******************/
		%feature("compactdefaultargs") RecordIdent;
		%feature("autodoc", "Returns record identifier (positive number) if returned ident is not positive : sub-list or scope mark.

Parameters
----------
num: int

Returns
-------
int
") RecordIdent;
		Standard_Integer RecordIdent(const Standard_Integer num);

		/****************** RecordType ******************/
		%feature("compactdefaultargs") RecordType;
		%feature("autodoc", "Returns record type.

Parameters
----------
num: int

Returns
-------
TCollection_AsciiString
") RecordType;
		const TCollection_AsciiString & RecordType(const Standard_Integer num);

		/****************** SetEntityNumbers ******************/
		%feature("compactdefaultargs") SetEntityNumbers;
		%feature("autodoc", "Determines reference numbers in entitynumber fields called by prepare from stepreadertool to prepare later using by a stepmodel. this method is attached to stepreaderdata because it needs a massive amount of data accesses to work //! if <withmap> is given false, the basic exploration algorithm is activated, otherwise a map is used as far as it is possible this option can be used only to test this algorithm.

Parameters
----------
withmap: bool,optional
	default value is Standard_True

Returns
-------
None
") SetEntityNumbers;
		void SetEntityNumbers(const Standard_Boolean withmap = Standard_True);

		/****************** SetRecord ******************/
		%feature("compactdefaultargs") SetRecord;
		%feature("autodoc", "Fills the fields of a record.

Parameters
----------
num: int
ident: char *
type: char *
nbpar: int

Returns
-------
None
") SetRecord;
		void SetRecord(const Standard_Integer num, const char * ident, const char * type, const Standard_Integer nbpar);

		/****************** SubListNumber ******************/
		%feature("compactdefaultargs") SubListNumber;
		%feature("autodoc", "Returns sublist numero designated by a parameter (nump) in a record (num), or zero if the parameter does not exist or is not a sublist address. zero too if aslast is true and nump is not for the last parameter.

Parameters
----------
num: int
nump: int
aslast: bool

Returns
-------
int
") SubListNumber;
		Standard_Integer SubListNumber(const Standard_Integer num, const Standard_Integer nump, const Standard_Boolean aslast);

};


%make_alias(StepData_StepReaderData)

%extend StepData_StepReaderData {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def ReadMember(self):
		pass

	@methodnotwrapped
	def ReadEntity(self):
		pass
	}
};

/********************************
* class StepData_StepReaderTool *
********************************/
class StepData_StepReaderTool : public Interface_FileReaderTool {
	public:
		/****************** StepData_StepReaderTool ******************/
		%feature("compactdefaultargs") StepData_StepReaderTool;
		%feature("autodoc", "Creates stepreadertool to work with a stepreaderdata according to a step protocol. defines the readerlib at this time.

Parameters
----------
reader: StepData_StepReaderData
protocol: StepData_Protocol

Returns
-------
None
") StepData_StepReaderTool;
		 StepData_StepReaderTool(const opencascade::handle<StepData_StepReaderData> & reader, const opencascade::handle<StepData_Protocol> & protocol);

		/****************** AnalyseRecord ******************/
		%feature("compactdefaultargs") AnalyseRecord;
		%feature("autodoc", "Fills an entity, given record no; works by using a readerlib to load each entity, which must be a transient actually, returned value is true if no fail, false else.

Parameters
----------
num: int
anent: Standard_Transient
acheck: Interface_Check

Returns
-------
bool
") AnalyseRecord;
		Standard_Boolean AnalyseRecord(const Standard_Integer num, const opencascade::handle<Standard_Transient> & anent, opencascade::handle<Interface_Check> & acheck);

		/****************** BeginRead ******************/
		%feature("compactdefaultargs") BeginRead;
		%feature("autodoc", "Fills model's header; that is, gives to it header entities and commands their loading. also fills stepmodel's global check from stepreaderdata's globalcheck.

Parameters
----------
amodel: Interface_InterfaceModel

Returns
-------
None
") BeginRead;
		void BeginRead(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** EndRead ******************/
		%feature("compactdefaultargs") EndRead;
		%feature("autodoc", "Ends file reading after reading all the entities here, it binds in the model, idents to entities (for checks).

Parameters
----------
amodel: Interface_InterfaceModel

Returns
-------
None
") EndRead;
		virtual void EndRead(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** Prepare ******************/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "Bounds empty entities to records, uses default recognition provided by readerlib and readermodule. also calls computation of references (setentitynumbers from stepreaderdata) works only on data entities (skips header) <optimize> given false allows to test some internal algorithms which are normally avoided (see also stepreaderdata).

Parameters
----------
optimize: bool,optional
	default value is Standard_True

Returns
-------
None
") Prepare;
		void Prepare(const Standard_Boolean optimize = Standard_True);

		/****************** Prepare ******************/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "Bounds empty entities to records, works with a specific filerecognizer, stored and later used in recognize works only on data entities (skips header) <optimize : same as above.

Parameters
----------
reco: StepData_FileRecognizer
optimize: bool,optional
	default value is Standard_True

Returns
-------
None
") Prepare;
		void Prepare(const opencascade::handle<StepData_FileRecognizer> & reco, const Standard_Boolean optimize = Standard_True);

		/****************** PrepareHeader ******************/
		%feature("compactdefaultargs") PrepareHeader;
		%feature("autodoc", "Bounds empty entities and sub-lists to header records works like prepare + setentitynumbers, but for header (n.b.: in header, no ident and no reference) filerecognizer is to specify entities which are allowed to be defined in the header (not every type can be).

Parameters
----------
reco: StepData_FileRecognizer

Returns
-------
None
") PrepareHeader;
		void PrepareHeader(const opencascade::handle<StepData_FileRecognizer> & reco);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "Recognizes records, by asking either readerlib (default) or filerecognizer (if defined) to do so. <ach> is to call recognizebylib.

Parameters
----------
num: int
ach: Interface_Check
ent: Standard_Transient

Returns
-------
bool
") Recognize;
		Standard_Boolean Recognize(const Standard_Integer num, opencascade::handle<Interface_Check> & ach, opencascade::handle<Standard_Transient> & ent);

};


%extend StepData_StepReaderTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepData_StepWriter *
****************************/
class StepData_StepWriter {
	public:
		/****************** StepData_StepWriter ******************/
		%feature("compactdefaultargs") StepData_StepWriter;
		%feature("autodoc", "Creates an empty stepwriter from a stepmodel. the stepmodel provides the number of entities, as identifiers for file.

Parameters
----------
amodel: StepData_StepModel

Returns
-------
None
") StepData_StepWriter;
		 StepData_StepWriter(const opencascade::handle<StepData_StepModel> & amodel);

		/****************** AddParam ******************/
		%feature("compactdefaultargs") AddParam;
		%feature("autodoc", "Prepares adding a parameter (that is, adds ',' except for first one); normally for internal use; can be used to send a totally empty parameter (with no litteral value).

Returns
-------
None
") AddParam;
		void AddParam();

		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Returns the check-list, which has received possible checks : for unknown entities, badly loaded ones, null or unknown references.

Returns
-------
Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList();

		/****************** CloseSub ******************/
		%feature("compactdefaultargs") CloseSub;
		%feature("autodoc", "Closes a sublist by a ')'.

Returns
-------
None
") CloseSub;
		void CloseSub();

		/****************** Comment ******************/
		%feature("compactdefaultargs") Comment;
		%feature("autodoc", "Sets a comment mark : if mode is true, begins comment zone, if mode is false, ends comment zone (if one is begun).

Parameters
----------
mode: bool

Returns
-------
None
") Comment;
		void Comment(const Standard_Boolean mode);

		/****************** EndComplex ******************/
		%feature("compactdefaultargs") EndComplex;
		%feature("autodoc", "Sends the end of a complex entity : a simple closed bracket it must be called after sending all the componants and before the final call to endentity.

Returns
-------
None
") EndComplex;
		void EndComplex();

		/****************** EndEntity ******************/
		%feature("compactdefaultargs") EndEntity;
		%feature("autodoc", "Sends end of entity (closing bracket plus ';') error if count of opened-closed brackets is not null.

Returns
-------
None
") EndEntity;
		void EndEntity();

		/****************** EndFile ******************/
		%feature("compactdefaultargs") EndFile;
		%feature("autodoc", "Sets end of file; error is endsec was not set.

Returns
-------
None
") EndFile;
		void EndFile();

		/****************** EndSec ******************/
		%feature("compactdefaultargs") EndSec;
		%feature("autodoc", "Sets end of section; to be done before passing to next one.

Returns
-------
None
") EndSec;
		void EndSec();

		/****************** FloatWriter ******************/
		%feature("compactdefaultargs") FloatWriter;
		%feature("autodoc", "Returns the embedded floatwriter, which controls sending reals use this method to access floatwriter in order to consult or change its options (mainformat, formatforrange,zerosuppress), because it is returned as the address of its field.

Returns
-------
Interface_FloatWriter
") FloatWriter;
		Interface_FloatWriter & FloatWriter();

		/****************** Indent ******************/
		%feature("compactdefaultargs") Indent;
		%feature("autodoc", "Asks that further indentations will begin at position of entity first opening bracket; else they begin at zero (def) for each sublist level, two more blancks are added at beginning (except for text continuation, which must begin at true zero).

Parameters
----------
onent: bool

Returns
-------
None
") Indent;
		void Indent(const Standard_Boolean onent);

		/****************** IsInScope ******************/
		%feature("compactdefaultargs") IsInScope;
		%feature("autodoc", "Returns true if an entity identified by its number is in a scope.

Parameters
----------
num: int

Returns
-------
bool
") IsInScope;
		Standard_Boolean IsInScope(const Standard_Integer num);

		/****************** JoinLast ******************/
		%feature("compactdefaultargs") JoinLast;
		%feature("autodoc", "Joins current line to last one, only if new length is 72 max if newline is true, a new current line begins; else, current line is set to the last line (once joined) itself an can be completed.

Parameters
----------
newline: bool

Returns
-------
None
") JoinLast;
		void JoinLast(const Standard_Boolean newline);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetLabelMode() {
            return (Standard_Integer) $self->LabelMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetLabelMode(Standard_Integer value) {
            $self->LabelMode()=value;
            }
        };
		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns a line given its rank in the file.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Line;
		opencascade::handle<TCollection_HAsciiString> Line(const Standard_Integer num);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns count of lines.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NewLine ******************/
		%feature("compactdefaultargs") NewLine;
		%feature("autodoc", "Flushes current line; if empty, flushes it (defines a new empty line) if evenempty is true; else, skips it.

Parameters
----------
evenempty: bool

Returns
-------
None
") NewLine;
		void NewLine(const Standard_Boolean evenempty);

		/****************** OpenSub ******************/
		%feature("compactdefaultargs") OpenSub;
		%feature("autodoc", "Open a sublist by a '('.

Returns
-------
None
") OpenSub;
		void OpenSub();

		/****************** OpenTypedSub ******************/
		%feature("compactdefaultargs") OpenTypedSub;
		%feature("autodoc", "Open a sublist with its type then a '('.

Parameters
----------
subtype: char *

Returns
-------
None
") OpenTypedSub;
		void OpenTypedSub(const char * subtype);


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** Send ******************/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Sends an integer parameter.

Parameters
----------
val: int

Returns
-------
None
") Send;
		void Send(const Standard_Integer val);

		/****************** Send ******************/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Sends a real parameter (wroks with floatwriter).

Parameters
----------
val: float

Returns
-------
None
") Send;
		void Send(const Standard_Real val);

		/****************** Send ******************/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Sends a text given as string (it will be set between '...').

Parameters
----------
val: TCollection_AsciiString

Returns
-------
None
") Send;
		void Send(const TCollection_AsciiString & val);

		/****************** Send ******************/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Sends a reference to an entity (its identifier with '#') remark 1 : a null <val> is interpreted as 'undefined' remark 2 : for an hasciistring which is not recorded in the model, it is send as its string content, between quotes.

Parameters
----------
val: Standard_Transient

Returns
-------
None
") Send;
		void Send(const opencascade::handle<Standard_Transient> & val);

		/****************** SendArrReal ******************/
		%feature("compactdefaultargs") SendArrReal;
		%feature("autodoc", "Sends an array of real.

Parameters
----------
anArr: TColStd_HArray1OfReal

Returns
-------
None
") SendArrReal;
		void SendArrReal(const opencascade::handle<TColStd_HArray1OfReal> & anArr);

		/****************** SendBoolean ******************/
		%feature("compactdefaultargs") SendBoolean;
		%feature("autodoc", "Sends a boolean as .t. for true or .f. for false (it is an useful case of enum, which is built-in).

Parameters
----------
val: bool

Returns
-------
None
") SendBoolean;
		void SendBoolean(const Standard_Boolean val);

		/****************** SendComment ******************/
		%feature("compactdefaultargs") SendComment;
		%feature("autodoc", "Sends a comment. error if we are not inside a comment zone.

Parameters
----------
text: TCollection_HAsciiString

Returns
-------
None
") SendComment;
		void SendComment(const opencascade::handle<TCollection_HAsciiString> & text);

		/****************** SendComment ******************/
		%feature("compactdefaultargs") SendComment;
		%feature("autodoc", "Same as above but accepts a cstring (ex.: '...' directly).

Parameters
----------
text: char *

Returns
-------
None
") SendComment;
		void SendComment(const char * text);

		/****************** SendData ******************/
		%feature("compactdefaultargs") SendData;
		%feature("autodoc", "Begins data section; error if endsec was not set.

Returns
-------
None
") SendData;
		void SendData();

		/****************** SendDerived ******************/
		%feature("compactdefaultargs") SendDerived;
		%feature("autodoc", "Sends a 'derived' parameter (by '*'). a derived parameter has been inherited from a super-type then redefined as being computed by a function. hence its value in file is senseless.

Returns
-------
None
") SendDerived;
		void SendDerived();

		/****************** SendEndscope ******************/
		%feature("compactdefaultargs") SendEndscope;
		%feature("autodoc", "Sets an end of scope (on a separate line).

Returns
-------
None
") SendEndscope;
		void SendEndscope();

		/****************** SendEntity ******************/
		%feature("compactdefaultargs") SendEntity;
		%feature("autodoc", "Send an entity of the data section. if it corresponds to a scope, also sends the scope informations and contained items.

Parameters
----------
nument: int
lib: StepData_WriterLib

Returns
-------
None
") SendEntity;
		void SendEntity(const Standard_Integer nument, const StepData_WriterLib & lib);

		/****************** SendEnum ******************/
		%feature("compactdefaultargs") SendEnum;
		%feature("autodoc", "Sends an enum given by string (litteral expression) adds '.' around it if not done remark : val can be computed by class enumtool from stepdata: stepwriter.sendenum (myenum.text(enumval));.

Parameters
----------
val: TCollection_AsciiString

Returns
-------
None
") SendEnum;
		void SendEnum(const TCollection_AsciiString & val);

		/****************** SendEnum ******************/
		%feature("compactdefaultargs") SendEnum;
		%feature("autodoc", "Sends an enum given by string (litteral expression) adds '.' around it if not done.

Parameters
----------
val: char *

Returns
-------
None
") SendEnum;
		void SendEnum(const char * val);

		/****************** SendField ******************/
		%feature("compactdefaultargs") SendField;
		%feature("autodoc", "Sends the content of a field, controlled by its descriptor if the descriptor is not defined, follows the description detained by the field itself.

Parameters
----------
fild: StepData_Field
descr: StepData_PDescr

Returns
-------
None
") SendField;
		void SendField(const StepData_Field & fild, const opencascade::handle<StepData_PDescr> & descr);

		/****************** SendHeader ******************/
		%feature("compactdefaultargs") SendHeader;
		%feature("autodoc", "Begins model header.

Returns
-------
None
") SendHeader;
		void SendHeader();

		/****************** SendIdent ******************/
		%feature("compactdefaultargs") SendIdent;
		%feature("autodoc", "Begins an entity with an ident plus '=' (at beginning of line) entity ident is its number given by the containing model warning : <ident> must be, either number or label, according labelmode.

Parameters
----------
ident: int

Returns
-------
None
") SendIdent;
		void SendIdent(const Standard_Integer ident);

		/****************** SendList ******************/
		%feature("compactdefaultargs") SendList;
		%feature("autodoc", "Send the content of an entity as being a fieldlist controlled by its descriptor. this includes start and end brackets but not the entity type.

Parameters
----------
list: StepData_FieldList
descr: StepData_ESDescr

Returns
-------
None
") SendList;
		void SendList(const StepData_FieldList & list, const opencascade::handle<StepData_ESDescr> & descr);

		/****************** SendLogical ******************/
		%feature("compactdefaultargs") SendLogical;
		%feature("autodoc", "Sends a logical as .t. or .f. or .u. according its value (it is a standard case of enum for step, and is built-in).

Parameters
----------
val: StepData_Logical

Returns
-------
None
") SendLogical;
		void SendLogical(const StepData_Logical val);

		/****************** SendModel ******************/
		%feature("compactdefaultargs") SendModel;
		%feature("autodoc", "Sends the complete model, included header and data sections works with a writerlib defined through a protocol if <headeronly> is given true, only the header section is sent (used to dump the header of a stepmodel).

Parameters
----------
protocol: StepData_Protocol
headeronly: bool,optional
	default value is Standard_False

Returns
-------
None
") SendModel;
		void SendModel(const opencascade::handle<StepData_Protocol> & protocol, const Standard_Boolean headeronly = Standard_False);

		/****************** SendScope ******************/
		%feature("compactdefaultargs") SendScope;
		%feature("autodoc", "Sets a begin of scope (ends this line).

Returns
-------
None
") SendScope;
		void SendScope();

		/****************** SendSelect ******************/
		%feature("compactdefaultargs") SendSelect;
		%feature("autodoc", "Sends a selectmember, which cab be named or not.

Parameters
----------
sm: StepData_SelectMember
descr: StepData_PDescr

Returns
-------
None
") SendSelect;
		void SendSelect(const opencascade::handle<StepData_SelectMember> & sm, const opencascade::handle<StepData_PDescr> & descr);

		/****************** SendString ******************/
		%feature("compactdefaultargs") SendString;
		%feature("autodoc", "Sends a string exactly as it is given.

Parameters
----------
val: TCollection_AsciiString

Returns
-------
None
") SendString;
		void SendString(const TCollection_AsciiString & val);

		/****************** SendString ******************/
		%feature("compactdefaultargs") SendString;
		%feature("autodoc", "Sends a string exactly as it is given.

Parameters
----------
val: char *

Returns
-------
None
") SendString;
		void SendString(const char * val);

		/****************** SendUndef ******************/
		%feature("compactdefaultargs") SendUndef;
		%feature("autodoc", "Sends an undefined (optionnal absent) parameter (by '$').

Returns
-------
None
") SendUndef;
		void SendUndef();

		/****************** SetScope ******************/
		%feature("compactdefaultargs") SetScope;
		%feature("autodoc", "Declares the entity number <numscope> to correspond to a scope which contains the entity number <numin>. several calls to the same <numscope> add entities in this scope, in this order. error if <numin> is already declared in the scope warning : the declaration of the scopes is assumed to be consistent, i.e. <numin> is not referenced from outside this scope (not checked here).

Parameters
----------
numscope: int
numin: int

Returns
-------
None
") SetScope;
		void SetScope(const Standard_Integer numscope, const Standard_Integer numin);

		/****************** StartComplex ******************/
		%feature("compactdefaultargs") StartComplex;
		%feature("autodoc", "Sends the start of a complex entity, which is a simple open bracket (without increasing braket level) it must be called just after sendentity and before sending componants, each one begins by startentity.

Returns
-------
None
") StartComplex;
		void StartComplex();

		/****************** StartEntity ******************/
		%feature("compactdefaultargs") StartEntity;
		%feature("autodoc", "Sets entity's steptype, opens brakets, starts param no to 0 params are separated by comma remark : for a multiple type entity (see express andor clause) startcomplex must be called before sending componants, then each 'componant' must be send separately (one call to startentity for each one) : the type which preceeds is then automaticaly closed. once all the componants have been sent, endcomplex must be called, then and only then endentity.

Parameters
----------
atype: TCollection_AsciiString

Returns
-------
None
") StartEntity;
		void StartEntity(const TCollection_AsciiString & atype);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetTypeMode() {
            return (Standard_Integer) $self->TypeMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetTypeMode(Standard_Integer value) {
            $self->TypeMode()=value;
            }
        };
};


%extend StepData_StepWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepData_UndefinedEntity *
*********************************/
/***************************
* class StepData_WriterLib *
***************************/
class StepData_WriterLib {
	public:
		/****************** StepData_WriterLib ******************/
		%feature("compactdefaultargs") StepData_WriterLib;
		%feature("autodoc", "Creates a library which complies with a protocol, that is : same class (criterium isinstance) this creation gets the modules from the global set, those which are bound to the given protocol and its resources.

Parameters
----------
aprotocol: StepData_Protocol

Returns
-------
None
") StepData_WriterLib;
		 StepData_WriterLib(const opencascade::handle<StepData_Protocol> & aprotocol);

		/****************** StepData_WriterLib ******************/
		%feature("compactdefaultargs") StepData_WriterLib;
		%feature("autodoc", "Creates an empty library : it will later by filled by method addprotocol.

Returns
-------
None
") StepData_WriterLib;
		 StepData_WriterLib();

		/****************** AddProtocol ******************/
		%feature("compactdefaultargs") AddProtocol;
		%feature("autodoc", "Adds a couple (module-protocol) to the library, given the class of a protocol. takes resources into account. (if <aprotocol> is not of type theprotocol, it is not added).

Parameters
----------
aprotocol: Standard_Transient

Returns
-------
None
") AddProtocol;
		void AddProtocol(const opencascade::handle<Standard_Transient> & aprotocol);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list of modules of a library (can be used to redefine the order of modules before action : clear then refill the library by calls to addprotocol).

Returns
-------
None
") Clear;
		void Clear();

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the current module in the iteration.

Returns
-------
opencascade::handle<StepData_ReadWriteModule>
") Module;
		const opencascade::handle<StepData_ReadWriteModule> & Module();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there are more modules to iterate on.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Iterates by getting the next module in the list if there is none, the exception will be raised by value.

Returns
-------
None
") Next;
		void Next();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the current protocol in the iteration.

Returns
-------
opencascade::handle<StepData_Protocol>
") Protocol;
		const opencascade::handle<StepData_Protocol> & Protocol();

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Selects a module from the library, given an object. returns true if select has succeeded, false else. also returns (as arguments) the selected module and the case number determined by the associated protocol. if select has failed, <module> is null handle and cn is zero. (select can work on any criterium, such as object dynamictype).

Parameters
----------
obj: Standard_Transient
module: StepData_ReadWriteModule

Returns
-------
CN: int
") Select;
		Standard_Boolean Select(const opencascade::handle<Standard_Transient> & obj, opencascade::handle<StepData_ReadWriteModule> & module, Standard_Integer &OutValue);

		/****************** SetComplete ******************/
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "Sets a library to be defined with the complete global list (all the couples protocol/modules recorded in it).

Returns
-------
None
") SetComplete;
		void SetComplete();

		/****************** SetGlobal ******************/
		%feature("compactdefaultargs") SetGlobal;
		%feature("autodoc", "Adds a couple (module-protocol) into the global definition set for this class of library.

Parameters
----------
amodule: StepData_ReadWriteModule
aprotocol: StepData_Protocol

Returns
-------
None
") SetGlobal;
		static void SetGlobal(const opencascade::handle<StepData_ReadWriteModule> & amodule, const opencascade::handle<StepData_Protocol> & aprotocol);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Starts iteration on the modules (sets it on the first one).

Returns
-------
None
") Start;
		void Start();

};


%extend StepData_WriterLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepData_DefaultGeneral *
********************************/
class StepData_DefaultGeneral : public StepData_GeneralModule {
	public:
		/****************** StepData_DefaultGeneral ******************/
		%feature("compactdefaultargs") StepData_DefaultGeneral;
		%feature("autodoc", "Creates a default general module.

Returns
-------
None
") StepData_DefaultGeneral;
		 StepData_DefaultGeneral();

		/****************** CheckCase ******************/
		%feature("compactdefaultargs") CheckCase;
		%feature("autodoc", "Specific checking of an entity <ent>.

Parameters
----------
casenum: int
ent: Standard_Transient
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") CheckCase;
		void CheckCase(const Standard_Integer casenum, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** CopyCase ******************/
		%feature("compactdefaultargs") CopyCase;
		%feature("autodoc", "Specific copy ('deep') from <entfrom> to <entto> (same type) by using a copytool which provides its working map. use method transferred from transfercontrol to work.

Parameters
----------
casenum: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Returns
-------
None
") CopyCase;
		void CopyCase(const Standard_Integer casenum, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****************** FillSharedCase ******************/
		%feature("compactdefaultargs") FillSharedCase;
		%feature("autodoc", "Specific filling of the list of entities shared by an entity <ent>, which is an unknownentity from stepdata.

Parameters
----------
casenum: int
ent: Standard_Transient
iter: Interface_EntityIterator

Returns
-------
None
") FillSharedCase;
		void FillSharedCase(const Standard_Integer casenum, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****************** NewVoid ******************/
		%feature("compactdefaultargs") NewVoid;
		%feature("autodoc", "Specific creation of a new void entity.

Parameters
----------
CN: int
entto: Standard_Transient

Returns
-------
bool
") NewVoid;
		Standard_Boolean NewVoid(const Standard_Integer CN, opencascade::handle<Standard_Transient> & entto);

};


%make_alias(StepData_DefaultGeneral)

%extend StepData_DefaultGeneral {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StepData_ECDescr *
*************************/
class StepData_ECDescr : public StepData_EDescr {
	public:
		/****************** StepData_ECDescr ******************/
		%feature("compactdefaultargs") StepData_ECDescr;
		%feature("autodoc", "Creates an ecdescr, empty.

Returns
-------
None
") StepData_ECDescr;
		 StepData_ECDescr();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a member warning : members are added in alphabetic order.

Parameters
----------
member: StepData_ESDescr

Returns
-------
None
") Add;
		void Add(const opencascade::handle<StepData_ESDescr> & member);

		/****************** IsComplex ******************/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsComplex;
		Standard_Boolean IsComplex();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Tells if a esdescr matches a step type : exact or super type.

Parameters
----------
steptype: char *

Returns
-------
bool
") Matches;
		Standard_Boolean Matches(const char * steptype);

		/****************** Member ******************/
		%feature("compactdefaultargs") Member;
		%feature("autodoc", "Returns a member from its rank.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepData_ESDescr>
") Member;
		opencascade::handle<StepData_ESDescr> Member(const Standard_Integer num);

		/****************** NbMembers ******************/
		%feature("compactdefaultargs") NbMembers;
		%feature("autodoc", "Returns the count of members.

Returns
-------
int
") NbMembers;
		Standard_Integer NbMembers();

		/****************** NewEntity ******************/
		%feature("compactdefaultargs") NewEntity;
		%feature("autodoc", "Creates a described entity (i.e. a complex one, made of one simple entity per member).

Returns
-------
opencascade::handle<StepData_Described>
") NewEntity;
		opencascade::handle<StepData_Described> NewEntity();

		/****************** TypeList ******************/
		%feature("compactdefaultargs") TypeList;
		%feature("autodoc", "Returns the ordered list of types.

Returns
-------
opencascade::handle<TColStd_HSequenceOfAsciiString>
") TypeList;
		opencascade::handle<TColStd_HSequenceOfAsciiString> TypeList();

};


%make_alias(StepData_ECDescr)

%extend StepData_ECDescr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StepData_ESDescr *
*************************/
class StepData_ESDescr : public StepData_EDescr {
	public:
		/****************** StepData_ESDescr ******************/
		%feature("compactdefaultargs") StepData_ESDescr;
		%feature("autodoc", "Creates an esdescr with a type name.

Parameters
----------
name: char *

Returns
-------
None
") StepData_ESDescr;
		 StepData_ESDescr(const char * name);

		/****************** Base ******************/
		%feature("compactdefaultargs") Base;
		%feature("autodoc", "Returns the basic esdescr, null if <self> is not derived.

Returns
-------
opencascade::handle<StepData_ESDescr>
") Base;
		opencascade::handle<StepData_ESDescr> Base();

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "Returns the pdescr for the field <num> (or null).

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepData_PDescr>
") Field;
		opencascade::handle<StepData_PDescr> Field(const Standard_Integer num);

		/****************** IsComplex ******************/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsComplex;
		Standard_Boolean IsComplex();

		/****************** IsSub ******************/
		%feature("compactdefaultargs") IsSub;
		%feature("autodoc", "Tells if <self> is sub-type of (or equal to) another one.

Parameters
----------
other: StepData_ESDescr

Returns
-------
bool
") IsSub;
		Standard_Boolean IsSub(const opencascade::handle<StepData_ESDescr> & other);

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Tells if a esdescr matches a step type : exact or super type.

Parameters
----------
steptype: char *

Returns
-------
bool
") Matches;
		Standard_Boolean Matches(const char * steptype);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name of a field from its rank. empty if outofrange.

Parameters
----------
num: int

Returns
-------
char *
") Name;
		const char * Name(const Standard_Integer num);

		/****************** NamedField ******************/
		%feature("compactdefaultargs") NamedField;
		%feature("autodoc", "Returns the pdescr for the field named <name> (or null).

Parameters
----------
name: char *

Returns
-------
opencascade::handle<StepData_PDescr>
") NamedField;
		opencascade::handle<StepData_PDescr> NamedField(const char * name);

		/****************** NbFields ******************/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Returns the count of fields.

Returns
-------
int
") NbFields;
		Standard_Integer NbFields();

		/****************** NewEntity ******************/
		%feature("compactdefaultargs") NewEntity;
		%feature("autodoc", "Creates a described entity (i.e. a simple one).

Returns
-------
opencascade::handle<StepData_Described>
") NewEntity;
		opencascade::handle<StepData_Described> NewEntity();

		/****************** Rank ******************/
		%feature("compactdefaultargs") Rank;
		%feature("autodoc", "Returns the rank of a field from its name. 0 if unknown.

Parameters
----------
name: char *

Returns
-------
int
") Rank;
		Standard_Integer Rank(const char * name);

		/****************** SetBase ******************/
		%feature("compactdefaultargs") SetBase;
		%feature("autodoc", "Sets an esdescr as based on another one hence, if there are inherited fields, the derived esdescr cumulates all them, while the base just records its own ones.

Parameters
----------
base: StepData_ESDescr

Returns
-------
None
") SetBase;
		void SetBase(const opencascade::handle<StepData_ESDescr> & base);

		/****************** SetField ******************/
		%feature("compactdefaultargs") SetField;
		%feature("autodoc", "Sets a pdescr to describe a field a field is designated by its rank and name.

Parameters
----------
num: int
name: char *
descr: StepData_PDescr

Returns
-------
None
") SetField;
		void SetField(const Standard_Integer num, const char * name, const opencascade::handle<StepData_PDescr> & descr);

		/****************** SetNbFields ******************/
		%feature("compactdefaultargs") SetNbFields;
		%feature("autodoc", "Sets a new count of fields each one is described by a pdescr.

Parameters
----------
nb: int

Returns
-------
None
") SetNbFields;
		void SetNbFields(const Standard_Integer nb);

		/****************** SetSuper ******************/
		%feature("compactdefaultargs") SetSuper;
		%feature("autodoc", "Sets an esdescr as 'super-type'. applies an a base (non derived) esdescr.

Parameters
----------
super: StepData_ESDescr

Returns
-------
None
") SetSuper;
		void SetSuper(const opencascade::handle<StepData_ESDescr> & super);

		/****************** StepType ******************/
		%feature("compactdefaultargs") StepType;
		%feature("autodoc", "Returns the type name as an asciistring.

Returns
-------
TCollection_AsciiString
") StepType;
		const TCollection_AsciiString & StepType();

		/****************** Super ******************/
		%feature("compactdefaultargs") Super;
		%feature("autodoc", "Returns the super-type esdescr, null if <self> is root.

Returns
-------
opencascade::handle<StepData_ESDescr>
") Super;
		opencascade::handle<StepData_ESDescr> Super();

		/****************** TypeName ******************/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "Returns the type name given at creation time.

Returns
-------
char *
") TypeName;
		const char * TypeName();

};


%make_alias(StepData_ESDescr)

%extend StepData_ESDescr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepData_FieldList1 *
****************************/
class StepData_FieldList1 : public StepData_FieldList {
	public:
		/****************** StepData_FieldList1 ******************/
		%feature("compactdefaultargs") StepData_FieldList1;
		%feature("autodoc", "Creates a fieldlist of 1 field.

Returns
-------
None
") StepData_FieldList1;
		 StepData_FieldList1();

		/****************** CField ******************/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "Returns the field n0 <num> between 1 and nbfields, in order to modify its content.

Parameters
----------
num: int

Returns
-------
StepData_Field
") CField;
		virtual StepData_Field & CField(const Standard_Integer num);

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "Returns the field n0 <num> between 1 and nbfields (read only).

Parameters
----------
num: int

Returns
-------
StepData_Field
") Field;
		virtual const StepData_Field & Field(const Standard_Integer num);

		/****************** NbFields ******************/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Returns the count of fields. here, returns 1.

Returns
-------
int
") NbFields;
		virtual Standard_Integer NbFields();

};


%extend StepData_FieldList1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepData_FieldListD *
****************************/
class StepData_FieldListD : public StepData_FieldList {
	public:
		/****************** StepData_FieldListD ******************/
		%feature("compactdefaultargs") StepData_FieldListD;
		%feature("autodoc", "Creates a fieldlistd of <nb> fields.

Parameters
----------
nb: int

Returns
-------
None
") StepData_FieldListD;
		 StepData_FieldListD(const Standard_Integer nb);

		/****************** CField ******************/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "Returns the field n0 <num> between 1 and nbfields, in order to modify its content.

Parameters
----------
num: int

Returns
-------
StepData_Field
") CField;
		virtual StepData_Field & CField(const Standard_Integer num);

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "Returns the field n0 <num> between 1 and nbfields (read only).

Parameters
----------
num: int

Returns
-------
StepData_Field
") Field;
		virtual const StepData_Field & Field(const Standard_Integer num);

		/****************** NbFields ******************/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Returns the count of fields. here, returns starting <nb>.

Returns
-------
int
") NbFields;
		virtual Standard_Integer NbFields();

		/****************** SetNb ******************/
		%feature("compactdefaultargs") SetNb;
		%feature("autodoc", "Sets a new count of fields. former contents are lost.

Parameters
----------
nb: int

Returns
-------
None
") SetNb;
		void SetNb(const Standard_Integer nb);

};


%extend StepData_FieldListD {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepData_FieldListN *
****************************/
class StepData_FieldListN : public StepData_FieldList {
	public:
		/****************** StepData_FieldListN ******************/
		%feature("compactdefaultargs") StepData_FieldListN;
		%feature("autodoc", "Creates a fieldlistn of <nb> fields.

Parameters
----------
nb: int

Returns
-------
None
") StepData_FieldListN;
		 StepData_FieldListN(const Standard_Integer nb);

		/****************** CField ******************/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "Returns the field n0 <num> between 1 and nbfields, in order to modify its content.

Parameters
----------
num: int

Returns
-------
StepData_Field
") CField;
		virtual StepData_Field & CField(const Standard_Integer num);

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "Returns the field n0 <num> between 1 and nbfields (read only).

Parameters
----------
num: int

Returns
-------
StepData_Field
") Field;
		virtual const StepData_Field & Field(const Standard_Integer num);

		/****************** NbFields ******************/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Returns the count of fields. here, returns starting <nb>.

Returns
-------
int
") NbFields;
		virtual Standard_Integer NbFields();

};


%extend StepData_FieldListN {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepData_FileProtocol *
******************************/
class StepData_FileProtocol : public StepData_Protocol {
	public:
		/****************** StepData_FileProtocol ******************/
		%feature("compactdefaultargs") StepData_FileProtocol;
		%feature("autodoc", "Creates an empty fileprotocol.

Returns
-------
None
") StepData_FileProtocol;
		 StepData_FileProtocol();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a protocol to the definition list of the fileprotocol but ensures that each class of protocol is present only once in this list.

Parameters
----------
protocol: StepData_Protocol

Returns
-------
None
") Add;
		void Add(const opencascade::handle<StepData_Protocol> & protocol);

		/****************** GlobalCheck ******************/
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "Calls globalcheck for each of its recorded ressources.

Parameters
----------
G: Interface_Graph
ach: Interface_Check

Returns
-------
bool
") GlobalCheck;
		virtual Standard_Boolean GlobalCheck(const Interface_Graph & G, opencascade::handle<Interface_Check> & ach);

		/****************** NbResources ******************/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Gives the count of protocols used as resource (can be zero) i.e. the count of protocol recorded by calling the method add.

Returns
-------
int
") NbResources;
		virtual Standard_Integer NbResources();

		/****************** Resource ******************/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "Returns a resource, given a rank. here, rank of calling add.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Interface_Protocol>
") Resource;
		virtual opencascade::handle<Interface_Protocol> Resource(const Standard_Integer num);

		/****************** SchemaName ******************/
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "Returns the schema name attached to each class of protocol to be redefined by each sub-class here, schemaname returns '' (empty string) was c++ : return const.

Returns
-------
char *
") SchemaName;
		virtual const char * SchemaName();

		/****************** TypeNumber ******************/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "Returns a case number, specific of each recognized type here, no type at all is recognized properly : all types are recognized by the resources.

Parameters
----------
atype: Standard_Type

Returns
-------
int
") TypeNumber;
		virtual Standard_Integer TypeNumber(const opencascade::handle<Standard_Type> & atype);

};


%make_alias(StepData_FileProtocol)

%extend StepData_FileProtocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class StepData_Plex *
**********************/
class StepData_Plex : public StepData_Described {
	public:
		/****************** StepData_Plex ******************/
		%feature("compactdefaultargs") StepData_Plex;
		%feature("autodoc", "Creates a plex (empty). the complete creation is made by the ecdescr itself, by calling add.

Parameters
----------
descr: StepData_ECDescr

Returns
-------
None
") StepData_Plex;
		 StepData_Plex(const opencascade::handle<StepData_ECDescr> & descr);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a member to <self>.

Parameters
----------
member: StepData_Simple

Returns
-------
None
") Add;
		void Add(const opencascade::handle<StepData_Simple> & member);

		/****************** As ******************/
		%feature("compactdefaultargs") As;
		%feature("autodoc", "Returns a simple entity which matches with a type in <self> : for a simple entity : me if it matches, else a null handle for a complex entity : the member which matches, else null.

Parameters
----------
steptype: char *

Returns
-------
opencascade::handle<StepData_Simple>
") As;
		opencascade::handle<StepData_Simple> As(const char * steptype);

		/****************** CField ******************/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "Returns a field from its name; read or write.

Parameters
----------
name: char *

Returns
-------
StepData_Field
") CField;
		StepData_Field & CField(const char * name);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Fills a check by using its description.

Parameters
----------
ach: Interface_Check

Returns
-------
None
") Check;
		void Check(opencascade::handle<Interface_Check> & ach);

		/****************** ECDescr ******************/
		%feature("compactdefaultargs") ECDescr;
		%feature("autodoc", "Returns the description as for a plex.

Returns
-------
opencascade::handle<StepData_ECDescr>
") ECDescr;
		opencascade::handle<StepData_ECDescr> ECDescr();

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "Returns a field from its name; read-only.

Parameters
----------
name: char *

Returns
-------
StepData_Field
") Field;
		const StepData_Field & Field(const char * name);

		/****************** HasField ******************/
		%feature("compactdefaultargs") HasField;
		%feature("autodoc", "Tells if a field brings a given name.

Parameters
----------
name: char *

Returns
-------
bool
") HasField;
		Standard_Boolean HasField(const char * name);

		/****************** IsComplex ******************/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsComplex;
		Standard_Boolean IsComplex();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Tells if a step type is matched by <self> for a simple entity : own type or super type for a complex entity : one of the members.

Parameters
----------
steptype: char *

Returns
-------
bool
") Matches;
		Standard_Boolean Matches(const char * steptype);

		/****************** Member ******************/
		%feature("compactdefaultargs") Member;
		%feature("autodoc", "Returns a simple member from its rank.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepData_Simple>
") Member;
		opencascade::handle<StepData_Simple> Member(const Standard_Integer num);

		/****************** NbMembers ******************/
		%feature("compactdefaultargs") NbMembers;
		%feature("autodoc", "Returns the count of simple members.

Returns
-------
int
") NbMembers;
		Standard_Integer NbMembers();

		/****************** Shared ******************/
		%feature("compactdefaultargs") Shared;
		%feature("autodoc", "Fills an entityiterator with entities shared by <self>.

Parameters
----------
list: Interface_EntityIterator

Returns
-------
None
") Shared;
		void Shared(Interface_EntityIterator & list);

		/****************** TypeList ******************/
		%feature("compactdefaultargs") TypeList;
		%feature("autodoc", "Returns the actual list of members types.

Returns
-------
opencascade::handle<TColStd_HSequenceOfAsciiString>
") TypeList;
		opencascade::handle<TColStd_HSequenceOfAsciiString> TypeList();

};


%make_alias(StepData_Plex)

%extend StepData_Plex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepData_SelectInt *
***************************/
class StepData_SelectInt : public StepData_SelectMember {
	public:
		/****************** StepData_SelectInt ******************/
		%feature("compactdefaultargs") StepData_SelectInt;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepData_SelectInt;
		 StepData_SelectInt();

		/****************** Int ******************/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Int;
		virtual Standard_Integer Int();

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Kind;
		virtual Standard_Integer Kind();

		/****************** SetInt ******************/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: int

Returns
-------
None
") SetInt;
		virtual void SetInt(const Standard_Integer val);

		/****************** SetKind ******************/
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "No available documentation.

Parameters
----------
kind: int

Returns
-------
None
") SetKind;
		virtual void SetKind(const Standard_Integer kind);

};


%make_alias(StepData_SelectInt)

%extend StepData_SelectInt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepData_SelectNamed *
*****************************/
class StepData_SelectNamed : public StepData_SelectMember {
	public:
		/****************** StepData_SelectNamed ******************/
		%feature("compactdefaultargs") StepData_SelectNamed;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepData_SelectNamed;
		 StepData_SelectNamed();

		/****************** CField ******************/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "No available documentation.

Returns
-------
StepData_Field
") CField;
		StepData_Field & CField();

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "No available documentation.

Returns
-------
StepData_Field
") Field;
		const StepData_Field & Field();

		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasName;
		virtual Standard_Boolean HasName();

		/****************** Int ******************/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "This internal method gives access to a value implemented by an integer (to read it).

Returns
-------
int
") Int;
		virtual Standard_Integer Int();

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Kind;
		virtual Standard_Integer Kind();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") Name;
		virtual const char * Name();

		/****************** Real ******************/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Real;
		virtual Standard_Real Real();

		/****************** SetInt ******************/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "This internal method gives access to a value implemented by an integer (to set it).

Parameters
----------
val: int

Returns
-------
None
") SetInt;
		virtual void SetInt(const Standard_Integer val);

		/****************** SetKind ******************/
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "No available documentation.

Parameters
----------
kind: int

Returns
-------
None
") SetKind;
		virtual void SetKind(const Standard_Integer kind);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *

Returns
-------
bool
") SetName;
		virtual Standard_Boolean SetName(const char * name);

		/****************** SetReal ******************/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: float

Returns
-------
None
") SetReal;
		virtual void SetReal(const Standard_Real val);

		/****************** SetString ******************/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: char *

Returns
-------
None
") SetString;
		virtual void SetString(const char * val);

		/****************** String ******************/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") String;
		virtual const char * String();

};


%make_alias(StepData_SelectNamed)

%extend StepData_SelectNamed {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepData_SelectReal *
****************************/
class StepData_SelectReal : public StepData_SelectMember {
	public:
		/****************** StepData_SelectReal ******************/
		%feature("compactdefaultargs") StepData_SelectReal;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepData_SelectReal;
		 StepData_SelectReal();

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Kind;
		virtual Standard_Integer Kind();

		/****************** Real ******************/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Real;
		virtual Standard_Real Real();

		/****************** SetReal ******************/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: float

Returns
-------
None
") SetReal;
		virtual void SetReal(const Standard_Real val);

};


%make_alias(StepData_SelectReal)

%extend StepData_SelectReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StepData_Simple *
************************/
class StepData_Simple : public StepData_Described {
	public:
		/****************** StepData_Simple ******************/
		%feature("compactdefaultargs") StepData_Simple;
		%feature("autodoc", "Creates a simple entity.

Parameters
----------
descr: StepData_ESDescr

Returns
-------
None
") StepData_Simple;
		 StepData_Simple(const opencascade::handle<StepData_ESDescr> & descr);

		/****************** As ******************/
		%feature("compactdefaultargs") As;
		%feature("autodoc", "Returns a simple entity which matches with a type in <self> : for a simple entity : me if it matches, else a null handle for a complex entity : the member which matches, else null.

Parameters
----------
steptype: char *

Returns
-------
opencascade::handle<StepData_Simple>
") As;
		opencascade::handle<StepData_Simple> As(const char * steptype);

		/****************** CField ******************/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "Returns a field from its name; read or write.

Parameters
----------
name: char *

Returns
-------
StepData_Field
") CField;
		StepData_Field & CField(const char * name);

		/****************** CFieldNum ******************/
		%feature("compactdefaultargs") CFieldNum;
		%feature("autodoc", "Returns a field from its rank, in order to modify it.

Parameters
----------
num: int

Returns
-------
StepData_Field
") CFieldNum;
		StepData_Field & CFieldNum(const Standard_Integer num);

		/****************** CFields ******************/
		%feature("compactdefaultargs") CFields;
		%feature("autodoc", "Returns the entire field list, read or write.

Returns
-------
StepData_FieldListN
") CFields;
		StepData_FieldListN & CFields();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Fills a check by using its description.

Parameters
----------
ach: Interface_Check

Returns
-------
None
") Check;
		void Check(opencascade::handle<Interface_Check> & ach);

		/****************** ESDescr ******************/
		%feature("compactdefaultargs") ESDescr;
		%feature("autodoc", "Returns description, as for simple.

Returns
-------
opencascade::handle<StepData_ESDescr>
") ESDescr;
		opencascade::handle<StepData_ESDescr> ESDescr();

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "Returns a field from its name; read-only.

Parameters
----------
name: char *

Returns
-------
StepData_Field
") Field;
		const StepData_Field & Field(const char * name);

		/****************** FieldNum ******************/
		%feature("compactdefaultargs") FieldNum;
		%feature("autodoc", "Returns a field from its rank, for read-only use.

Parameters
----------
num: int

Returns
-------
StepData_Field
") FieldNum;
		const StepData_Field & FieldNum(const Standard_Integer num);

		/****************** Fields ******************/
		%feature("compactdefaultargs") Fields;
		%feature("autodoc", "Returns the entire field list, read-only.

Returns
-------
StepData_FieldListN
") Fields;
		const StepData_FieldListN & Fields();

		/****************** HasField ******************/
		%feature("compactdefaultargs") HasField;
		%feature("autodoc", "Tells if a field brings a given name.

Parameters
----------
name: char *

Returns
-------
bool
") HasField;
		Standard_Boolean HasField(const char * name);

		/****************** IsComplex ******************/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Returns false.

Returns
-------
bool
") IsComplex;
		Standard_Boolean IsComplex();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Tells if a step type is matched by <self> for a simple entity : own type or super type for a complex entity : one of the members.

Parameters
----------
steptype: char *

Returns
-------
bool
") Matches;
		Standard_Boolean Matches(const char * steptype);

		/****************** NbFields ******************/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Returns the count of fields.

Returns
-------
int
") NbFields;
		Standard_Integer NbFields();

		/****************** Shared ******************/
		%feature("compactdefaultargs") Shared;
		%feature("autodoc", "Fills an entityiterator with entities shared by <self>.

Parameters
----------
list: Interface_EntityIterator

Returns
-------
None
") Shared;
		void Shared(Interface_EntityIterator & list);

		/****************** StepType ******************/
		%feature("compactdefaultargs") StepType;
		%feature("autodoc", "Returns the recorded steptype (typename of its esdescr).

Returns
-------
char *
") StepType;
		const char * StepType();

};


%make_alias(StepData_Simple)

%extend StepData_Simple {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepData_SelectArrReal *
*******************************/
class StepData_SelectArrReal : public StepData_SelectNamed {
	public:
		/****************** StepData_SelectArrReal ******************/
		%feature("compactdefaultargs") StepData_SelectArrReal;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepData_SelectArrReal;
		 StepData_SelectArrReal();

		/****************** ArrReal ******************/
		%feature("compactdefaultargs") ArrReal;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") ArrReal;
		opencascade::handle<TColStd_HArray1OfReal> ArrReal();

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Kind;
		virtual Standard_Integer Kind();

		/****************** SetArrReal ******************/
		%feature("compactdefaultargs") SetArrReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
arr: TColStd_HArray1OfReal

Returns
-------
None
") SetArrReal;
		void SetArrReal(const opencascade::handle<TColStd_HArray1OfReal> & arr);

};


%make_alias(StepData_SelectArrReal)

%extend StepData_SelectArrReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class StepData_FreeFormEntity:
	pass

@classnotwrapped
class StepData_UndefinedEntity:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */

class StepData_HArray1OfField : public StepData_Array1OfField, public Standard_Transient {
  public:
    StepData_HArray1OfField(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepData_HArray1OfField(const Standard_Integer theLower, const Standard_Integer theUpper, const StepData_Array1OfField::value_type& theValue);
    StepData_HArray1OfField(const StepData_Array1OfField& theOther);
    const StepData_Array1OfField& Array1();
    StepData_Array1OfField& ChangeArray1();
};
%make_alias(StepData_HArray1OfField)

/* harray2 classes */
/* hsequence classes */
