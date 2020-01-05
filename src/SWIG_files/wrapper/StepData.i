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
/* public enums */
enum StepData_Logical {
	StepData_LFalse = 0,
	StepData_LTrue = 1,
	StepData_LUnknown = 2,
};

/* end public enums declaration */

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
%template(StepData_Array1OfField) NCollection_Array1 <StepData_Field>;

%extend NCollection_Array1 <StepData_Field> {
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
typedef NCollection_Array1 <StepData_Field> StepData_Array1OfField;
/* end typedefs declaration */

/*****************
* class StepData *
*****************/
%rename(stepdata) StepData;
class StepData {
	public:
		/****************** AddHeaderProtocol ******************/
		%feature("compactdefaultargs") AddHeaderProtocol;
		%feature("autodoc", "* Adds a new Header Protocol to the Header Definition
	:param headerproto:
	:type headerproto: StepData_Protocol
	:rtype: void") AddHeaderProtocol;
		static void AddHeaderProtocol (const opencascade::handle<StepData_Protocol> & headerproto);

		/****************** HeaderProtocol ******************/
		%feature("compactdefaultargs") HeaderProtocol;
		%feature("autodoc", "* Returns the recorded HeaderProtocol, which can be : - a Null Handle if no Header Protocol was yet defined - a simple Protocol if only one was defined - a FileProtocol if more than one Protocol was yet defined
	:rtype: opencascade::handle<StepData_Protocol>") HeaderProtocol;
		static opencascade::handle<StepData_Protocol> HeaderProtocol ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Prepares General Data required to work with this package, which are the Protocol and Modules to be loaded into Libraries
	:rtype: void") Init;
		static void Init ();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "* Returns a Protocol from StepData (avoids to create it)
	:rtype: opencascade::handle<StepData_Protocol>") Protocol;
		static opencascade::handle<StepData_Protocol> Protocol ();

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
		%feature("autodoc", "* Returns a Simple Entity which matches with a Type in <self> : For a Simple Entity : me if it matches, else a null handle For a Complex Entity : the member which matches, else null
	:param steptype:
	:type steptype: char *
	:rtype: opencascade::handle<StepData_Simple>") As;
		virtual opencascade::handle<StepData_Simple> As (const char * steptype);

		/****************** CField ******************/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "* Returns a Field from its name; read or write
	:param name:
	:type name: char *
	:rtype: StepData_Field") CField;
		virtual StepData_Field & CField (const char * name);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "* Fills a Check by using its Description
	:param ach:
	:type ach: Interface_Check
	:rtype: void") Check;
		virtual void Check (opencascade::handle<Interface_Check> & ach);

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "* Returns the Description used to define this entity
	:rtype: opencascade::handle<StepData_EDescr>") Description;
		opencascade::handle<StepData_EDescr> Description ();

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "* Returns a Field from its name; read-only
	:param name:
	:type name: char *
	:rtype: StepData_Field") Field;
		virtual const StepData_Field & Field (const char * name);

		/****************** HasField ******************/
		%feature("compactdefaultargs") HasField;
		%feature("autodoc", "* Tells if a Field brings a given name
	:param name:
	:type name: char *
	:rtype: bool") HasField;
		virtual Standard_Boolean HasField (const char * name);

		/****************** IsComplex ******************/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "* Tells if a described entity is complex
	:rtype: bool") IsComplex;
		virtual Standard_Boolean IsComplex ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if a step type is matched by <self> For a Simple Entity : own type or super type For a Complex Entity : one of the members
	:param steptype:
	:type steptype: char *
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (const char * steptype);

		/****************** Shared ******************/
		%feature("compactdefaultargs") Shared;
		%feature("autodoc", "* Fills an EntityIterator with entities shared by <self>
	:param list:
	:type list: Interface_EntityIterator
	:rtype: void") Shared;
		virtual void Shared (Interface_EntityIterator & list);

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
		%feature("autodoc", "* Tells if a EDescr is complex (ECDescr) or simple (ESDescr)
	:rtype: bool") IsComplex;
		virtual Standard_Boolean IsComplex ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if a ESDescr matches a step type : exact or super type
	:param steptype:
	:type steptype: char *
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (const char * steptype);

		/****************** NewEntity ******************/
		%feature("compactdefaultargs") NewEntity;
		%feature("autodoc", "* Creates a described entity (i.e. a simple one)
	:rtype: opencascade::handle<StepData_Described>") NewEntity;
		virtual opencascade::handle<StepData_Described> NewEntity ();

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
		/****************** AddDefinition ******************/
		%feature("compactdefaultargs") AddDefinition;
		%feature("autodoc", "* Processes a definition, splits it according blanks if any empty definitions are ignored A null definition can be input by given '$' :the corresponding position is attached to 'null/undefined' value (as one particular item of the enumeration list) See also IsSet
	:param term:
	:type term: char *
	:rtype: None") AddDefinition;
		void AddDefinition (const char * term);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "* Returns True if at least one definition has been entered after creation time (i.e. by AddDefinition only) //! This allows to build a static description by a first pass : static StepData_EnumTool myenumtool('e0' ...); ... if (!myenumtool.IsSet()) { for further inits myenumtool.AddDefinition('e21'); ... }
	:rtype: bool") IsSet;
		Standard_Boolean IsSet ();

		/****************** MaxValue ******************/
		%feature("compactdefaultargs") MaxValue;
		%feature("autodoc", "* Returns the maximum integer for a suitable value Remark : while values begin at zero, MaxValue is the count of recorded values minus one
	:rtype: int") MaxValue;
		Standard_Integer MaxValue ();

		/****************** NullValue ******************/
		%feature("compactdefaultargs") NullValue;
		%feature("autodoc", "* Returns the value attached to 'null/undefined value' If none is specified or if Optional has been set to False, returns -1 Null Value has been specified by definition '$'
	:rtype: int") NullValue;
		Standard_Integer NullValue ();

		/****************** Optional ******************/
		%feature("compactdefaultargs") Optional;
		%feature("autodoc", "* Sets or Unsets the EnumTool to accept undefined value (for optional field). Ignored if no null value is defined (by '$') Can be changed during execution (to read each field), Default is True (if a null value is defined)
	:param mode:
	:type mode: bool
	:rtype: None") Optional;
		void Optional (const Standard_Boolean mode);

		/****************** StepData_EnumTool ******************/
		%feature("compactdefaultargs") StepData_EnumTool;
		%feature("autodoc", "* Creates an EnumTool with definitions given by e0 .. e<max> Each definition string can bring one term, or several separated by blanks. Each term corresponds to one value of the enumeration, if dots are not presents they are added //! Such a static constructor allows to build a static description as : static StepData_EnumTool myenumtool('e0','e1'...); then use it without having to initialise it //! A null definition can be input by given '$' :the corresponding position is attached to 'null/undefined' value (as one particular item of the enumeration list)
	:param e0: default value is ""
	:type e0: char *
	:param e1: default value is ""
	:type e1: char *
	:param e2: default value is ""
	:type e2: char *
	:param e3: default value is ""
	:type e3: char *
	:param e4: default value is ""
	:type e4: char *
	:param e5: default value is ""
	:type e5: char *
	:param e6: default value is ""
	:type e6: char *
	:param e7: default value is ""
	:type e7: char *
	:param e8: default value is ""
	:type e8: char *
	:param e9: default value is ""
	:type e9: char *
	:param e10: default value is ""
	:type e10: char *
	:param e11: default value is ""
	:type e11: char *
	:param e12: default value is ""
	:type e12: char *
	:param e13: default value is ""
	:type e13: char *
	:param e14: default value is ""
	:type e14: char *
	:param e15: default value is ""
	:type e15: char *
	:param e16: default value is ""
	:type e16: char *
	:param e17: default value is ""
	:type e17: char *
	:param e18: default value is ""
	:type e18: char *
	:param e19: default value is ""
	:type e19: char *
	:param e20: default value is ""
	:type e20: char *
	:param e21: default value is ""
	:type e21: char *
	:param e22: default value is ""
	:type e22: char *
	:param e23: default value is ""
	:type e23: char *
	:param e24: default value is ""
	:type e24: char *
	:param e25: default value is ""
	:type e25: char *
	:param e26: default value is ""
	:type e26: char *
	:param e27: default value is ""
	:type e27: char *
	:param e28: default value is ""
	:type e28: char *
	:param e29: default value is ""
	:type e29: char *
	:param e30: default value is ""
	:type e30: char *
	:param e31: default value is ""
	:type e31: char *
	:param e32: default value is ""
	:type e32: char *
	:param e33: default value is ""
	:type e33: char *
	:param e34: default value is ""
	:type e34: char *
	:param e35: default value is ""
	:type e35: char *
	:param e36: default value is ""
	:type e36: char *
	:param e37: default value is ""
	:type e37: char *
	:param e38: default value is ""
	:type e38: char *
	:param e39: default value is ""
	:type e39: char *
	:rtype: None") StepData_EnumTool;
		 StepData_EnumTool (const char * e0 = "",const char * e1 = "",const char * e2 = "",const char * e3 = "",const char * e4 = "",const char * e5 = "",const char * e6 = "",const char * e7 = "",const char * e8 = "",const char * e9 = "",const char * e10 = "",const char * e11 = "",const char * e12 = "",const char * e13 = "",const char * e14 = "",const char * e15 = "",const char * e16 = "",const char * e17 = "",const char * e18 = "",const char * e19 = "",const char * e20 = "",const char * e21 = "",const char * e22 = "",const char * e23 = "",const char * e24 = "",const char * e25 = "",const char * e26 = "",const char * e27 = "",const char * e28 = "",const char * e29 = "",const char * e30 = "",const char * e31 = "",const char * e32 = "",const char * e33 = "",const char * e34 = "",const char * e35 = "",const char * e36 = "",const char * e37 = "",const char * e38 = "",const char * e39 = "");

		/****************** Text ******************/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "* Returns the text which corresponds to a given numeric value It is limited by dots If num is out of range, returns an empty string
	:param num:
	:type num: int
	:rtype: TCollection_AsciiString") Text;
		const TCollection_AsciiString & Text (const Standard_Integer num);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the numeric value found for a text The text must be in capitals and limited by dots A non-suitable text gives a negative value to be returned
	:param txt:
	:type txt: char *
	:rtype: int") Value;
		Standard_Integer Value (const char * txt);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Same as above but works on an AsciiString
	:param txt:
	:type txt: TCollection_AsciiString
	:rtype: int") Value;
		Standard_Integer Value (const TCollection_AsciiString & txt);

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
		/****************** Arity ******************/
		%feature("compactdefaultargs") Arity;
		%feature("autodoc", ":rtype: int") Arity;
		Standard_Integer Arity ();

		/****************** Boolean ******************/
		%feature("compactdefaultargs") Boolean;
		%feature("autodoc", ":param n1: default value is 1
	:type n1: int
	:param n2: default value is 1
	:type n2: int
	:rtype: bool") Boolean;
		Standard_Boolean Boolean (const Standard_Integer n1 = 1,const Standard_Integer n2 = 1);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the field, to set it as 'no value defined' Just before SetList, predeclares it as 'any' A Kind can be directly set here to declare a type
	:param kind: default value is 0
	:type kind: int
	:rtype: None") Clear;
		void Clear (const Standard_Integer kind = 0);

		/****************** ClearItem ******************/
		%feature("compactdefaultargs") ClearItem;
		%feature("autodoc", "* Declares an item of the list as undefined (ignored if list not defined as String,Entity or Any)
	:param num:
	:type num: int
	:rtype: None") ClearItem;
		void ClearItem (const Standard_Integer num);

		/****************** CopyFrom ******************/
		%feature("compactdefaultargs") CopyFrom;
		%feature("autodoc", "* Gets the copy of the values of another field
	:param other:
	:type other: StepData_Field
	:rtype: None") CopyFrom;
		void CopyFrom (const StepData_Field & other);

		/****************** Entity ******************/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", ":param n1: default value is 1
	:type n1: int
	:param n2: default value is 1
	:type n2: int
	:rtype: opencascade::handle<Standard_Transient>") Entity;
		opencascade::handle<Standard_Transient> Entity (const Standard_Integer n1 = 1,const Standard_Integer n2 = 1);

		/****************** Enum ******************/
		%feature("compactdefaultargs") Enum;
		%feature("autodoc", ":param n1: default value is 1
	:type n1: int
	:param n2: default value is 1
	:type n2: int
	:rtype: int") Enum;
		Standard_Integer Enum (const Standard_Integer n1 = 1,const Standard_Integer n2 = 1);

		/****************** EnumText ******************/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", ":param n1: default value is 1
	:type n1: int
	:param n2: default value is 1
	:type n2: int
	:rtype: char *") EnumText;
		const char * EnumText (const Standard_Integer n1 = 1,const Standard_Integer n2 = 1);

		/****************** Int ******************/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", ":rtype: int") Int;
		Standard_Integer Int ();

		/****************** Integer ******************/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", ":param n1: default value is 1
	:type n1: int
	:param n2: default value is 1
	:type n2: int
	:rtype: int") Integer;
		Standard_Integer Integer (const Standard_Integer n1 = 1,const Standard_Integer n2 = 1);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", ":param n1: default value is 1
	:type n1: int
	:param n2: default value is 1
	:type n2: int
	:rtype: bool") IsSet;
		Standard_Boolean IsSet (const Standard_Integer n1 = 1,const Standard_Integer n2 = 1);

		/****************** ItemKind ******************/
		%feature("compactdefaultargs") ItemKind;
		%feature("autodoc", "* Returns the kind of an item in a list or double list It is the kind of the list, except if it is 'Any', in such a case the true kind is determined and returned
	:param n1: default value is 1
	:type n1: int
	:param n2: default value is 1
	:type n2: int
	:rtype: int") ItemKind;
		Standard_Integer ItemKind (const Standard_Integer n1 = 1,const Standard_Integer n2 = 1);

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "* Returns the kind of the field <type> True (D) : returns only the type itself else, returns the complete kind
	:param type: default value is Standard_True
	:type type: bool
	:rtype: int") Kind;
		Standard_Integer Kind (const Standard_Boolean type = Standard_True);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", ":param index: default value is 1
	:type index: int
	:rtype: int") Length;
		Standard_Integer Length (const Standard_Integer index = 1);

		/****************** Logical ******************/
		%feature("compactdefaultargs") Logical;
		%feature("autodoc", ":param n1: default value is 1
	:type n1: int
	:param n2: default value is 1
	:type n2: int
	:rtype: StepData_Logical") Logical;
		StepData_Logical Logical (const Standard_Integer n1 = 1,const Standard_Integer n2 = 1);

		/****************** Lower ******************/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", ":param index: default value is 1
	:type index: int
	:rtype: int") Lower;
		Standard_Integer Lower (const Standard_Integer index = 1);

		/****************** Real ******************/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", ":param n1: default value is 1
	:type n1: int
	:param n2: default value is 1
	:type n2: int
	:rtype: float") Real;
		Standard_Real Real (const Standard_Integer n1 = 1,const Standard_Integer n2 = 1);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets an undetermined value : can be String, SelectMember, HArray(1-2) ... else, an Entity In case of an HArray, determines and records its size(s)
	:param val:
	:type val: Standard_Transient
	:rtype: None") Set;
		void Set (const opencascade::handle<Standard_Transient> & val);

		/****************** SetBoolean ******************/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "* Sets a Boolean value (or predeclares a list as boolean)
	:param val: default value is Standard_False
	:type val: bool
	:rtype: None") SetBoolean;
		void SetBoolean (const Standard_Boolean val = Standard_False);

		/****************** SetBoolean ******************/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", ":param num:
	:type num: int
	:param val:
	:type val: bool
	:rtype: None") SetBoolean;
		void SetBoolean (const Standard_Integer num,const Standard_Boolean val);

		/****************** SetDerived ******************/
		%feature("compactdefaultargs") SetDerived;
		%feature("autodoc", "* Codes a Field as derived (no proper value)
	:rtype: None") SetDerived;
		void SetDerived ();

		/****************** SetEntity ******************/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "* Sets an Entity Value
	:param val:
	:type val: Standard_Transient
	:rtype: None") SetEntity;
		void SetEntity (const opencascade::handle<Standard_Transient> & val);

		/****************** SetEntity ******************/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "* Predeclares a list as of entity
	:rtype: None") SetEntity;
		void SetEntity ();

		/****************** SetEntity ******************/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", ":param num:
	:type num: int
	:param val:
	:type val: Standard_Transient
	:rtype: None") SetEntity;
		void SetEntity (const Standard_Integer num,const opencascade::handle<Standard_Transient> & val);

		/****************** SetEnum ******************/
		%feature("compactdefaultargs") SetEnum;
		%feature("autodoc", "* Sets an Enum Value (as its integer counterpart) (or predeclares a list as Enum) If <text> is given , also sets its textual expression <val> negative means unknown (known values begin at 0)
	:param val: default value is -1
	:type val: int
	:param text: default value is ""
	:type text: char *
	:rtype: None") SetEnum;
		void SetEnum (const Standard_Integer val = -1,const char * text = "");

		/****************** SetEnum ******************/
		%feature("compactdefaultargs") SetEnum;
		%feature("autodoc", "* Sets an Enum Value (Integer counterpart), also its text expression if known (if list has been set as 'any')
	:param num:
	:type num: int
	:param val:
	:type val: int
	:param text: default value is ""
	:type text: char *
	:rtype: None") SetEnum;
		void SetEnum (const Standard_Integer num,const Standard_Integer val,const char * text = "");

		/****************** SetInt ******************/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "* Directly sets the Integer value, if its Kind matches Integer, Boolean, Logical, or Enum (does not change Kind)
	:param val:
	:type val: int
	:rtype: None") SetInt;
		void SetInt (const Standard_Integer val);

		/****************** SetInt ******************/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "* Internal access to an Integer Value for a list, plus its kind
	:param num:
	:type num: int
	:param val:
	:type val: int
	:param kind:
	:type kind: int
	:rtype: None") SetInt;
		void SetInt (const Standard_Integer num,const Standard_Integer val,const Standard_Integer kind);

		/****************** SetInteger ******************/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "* Sets an Integer value (before SetList* declares it as Integer)
	:param val: default value is 0
	:type val: int
	:rtype: None") SetInteger;
		void SetInteger (const Standard_Integer val = 0);

		/****************** SetInteger ******************/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "* Sets an Integer Value for a list (rank num) (recognizes a SelectMember)
	:param num:
	:type num: int
	:param val:
	:type val: int
	:rtype: None") SetInteger;
		void SetInteger (const Standard_Integer num,const Standard_Integer val);

		/****************** SetList ******************/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "* Declares a field as a list, with an initial size Initial lower is defaulted as 1, can be defined The list starts empty, typed by the last Set* If no Set* before, sets it as 'any' (transient/select)
	:param size:
	:type size: int
	:param first: default value is 1
	:type first: int
	:rtype: None") SetList;
		void SetList (const Standard_Integer size,const Standard_Integer first = 1);

		/****************** SetList2 ******************/
		%feature("compactdefaultargs") SetList2;
		%feature("autodoc", "* Declares a field as an homogeneous square list, with initial sizes, and initial lowers
	:param siz1:
	:type siz1: int
	:param siz2:
	:type siz2: int
	:param f1: default value is 1
	:type f1: int
	:param f2: default value is 1
	:type f2: int
	:rtype: None") SetList2;
		void SetList2 (const Standard_Integer siz1,const Standard_Integer siz2,const Standard_Integer f1 = 1,const Standard_Integer f2 = 1);

		/****************** SetLogical ******************/
		%feature("compactdefaultargs") SetLogical;
		%feature("autodoc", "* Sets a Logical Value (or predeclares a list as logical)
	:param val: default value is StepData_LFalse
	:type val: StepData_Logical
	:rtype: None") SetLogical;
		void SetLogical (const StepData_Logical val = StepData_LFalse);

		/****************** SetLogical ******************/
		%feature("compactdefaultargs") SetLogical;
		%feature("autodoc", ":param num:
	:type num: int
	:param val:
	:type val: StepData_Logical
	:rtype: None") SetLogical;
		void SetLogical (const Standard_Integer num,const StepData_Logical val);

		/****************** SetReal ******************/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "* Sets a Real Value (or predeclares a list as Real);
	:param val: default value is 0.0
	:type val: float
	:rtype: None") SetReal;
		void SetReal (const Standard_Real val = 0.0);

		/****************** SetReal ******************/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", ":param num:
	:type num: int
	:param val:
	:type val: float
	:rtype: None") SetReal;
		void SetReal (const Standard_Integer num,const Standard_Real val);

		/****************** SetSelectMember ******************/
		%feature("compactdefaultargs") SetSelectMember;
		%feature("autodoc", "* Sets a SelectMember (for Integer,Boolean,Enum,Real,Logical) Hence, the value of the field is accessed through this member
	:param val:
	:type val: StepData_SelectMember
	:rtype: None") SetSelectMember;
		void SetSelectMember (const opencascade::handle<StepData_SelectMember> & val);

		/****************** SetString ******************/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "* Sets a String Value (or predeclares a list as String) Does not redefine the Kind if it is alread String or Enum
	:param val: default value is ""
	:type val: char *
	:rtype: None") SetString;
		void SetString (const char * val = "");

		/****************** SetString ******************/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", ":param num:
	:type num: int
	:param val:
	:type val: char *
	:rtype: None") SetString;
		void SetString (const Standard_Integer num,const char * val);

		/****************** StepData_Field ******************/
		%feature("compactdefaultargs") StepData_Field;
		%feature("autodoc", "* Creates a Field, empty ('no value defined')
	:rtype: None") StepData_Field;
		 StepData_Field ();

		/****************** StepData_Field ******************/
		%feature("compactdefaultargs") StepData_Field;
		%feature("autodoc", "* Creates a Field from another one. If <copy> is True, Handled data (Select,String,List, not entities) are copied
	:param other:
	:type other: StepData_Field
	:param copy: default value is Standard_False
	:type copy: bool
	:rtype: None") StepData_Field;
		 StepData_Field (const StepData_Field & other,const Standard_Boolean copy = Standard_False);

		/****************** String ******************/
		%feature("compactdefaultargs") String;
		%feature("autodoc", ":param n1: default value is 1
	:type n1: int
	:param n2: default value is 1
	:type n2: int
	:rtype: char *") String;
		const char * String (const Standard_Integer n1 = 1,const Standard_Integer n2 = 1);

		/****************** Transient ******************/
		%feature("compactdefaultargs") Transient;
		%feature("autodoc", ":rtype: opencascade::handle<Standard_Transient>") Transient;
		opencascade::handle<Standard_Transient> Transient ();

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
		/****************** CField ******************/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "* Returns the field n0 <num> between 1 and NbFields, in order to modify its content
	:param num:
	:type num: int
	:rtype: StepData_Field") CField;
		virtual StepData_Field & CField (const Standard_Integer num);

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "* Returns the field n0 <num> between 1 and NbFields (read only)
	:param num:
	:type num: int
	:rtype: StepData_Field") Field;
		virtual const StepData_Field & Field (const Standard_Integer num);

		/****************** FillShared ******************/
		%feature("compactdefaultargs") FillShared;
		%feature("autodoc", "* Fills an iterator with the entities shared by <self>
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") FillShared;
		void FillShared (Interface_EntityIterator & iter);

		/****************** NbFields ******************/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "* Returns the count of fields. Here, returns 0
	:rtype: int") NbFields;
		virtual Standard_Integer NbFields ();

		/****************** StepData_FieldList ******************/
		%feature("compactdefaultargs") StepData_FieldList;
		%feature("autodoc", "* Creates a FieldList of 0 Field
	:rtype: None") StepData_FieldList;
		 StepData_FieldList ();

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
		%feature("autodoc", "* Adds a new Recognizer to the Compound, at the end Several calls to Add work by adding in the order of calls : Hence, when Eval has failed to recognize, Evaluate will call Evaluate from the first added Recognizer if there is one, and to the second if there is still no result, and so on
	:param reco:
	:type reco: StepData_FileRecognizer
	:rtype: None") Add;
		void Add (const opencascade::handle<StepData_FileRecognizer> & reco);

		/****************** Evaluate ******************/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "* Evaluates if recognition has a result, returns it if yes In case of success, Returns True and puts result in 'res' In case of Failure, simply Returns False Works by calling deferred method Eval, and in case of failure, looks for Added Recognizers to work
	:param akey:
	:type akey: TCollection_AsciiString
	:param res:
	:type res: Standard_Transient
	:rtype: bool") Evaluate;
		Standard_Boolean Evaluate (const TCollection_AsciiString & akey,opencascade::handle<Standard_Transient> & res);

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "* Returns result of last recognition (call of Evaluate)
	:rtype: opencascade::handle<Standard_Transient>") Result;
		opencascade::handle<Standard_Transient> Result ();

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
		%feature("autodoc", "* Specific Checking of an Entity <ent>
	:param casenum:
	:type casenum: int
	:param ent:
	:type ent: Standard_Transient
	:param shares:
	:type shares: Interface_ShareTool
	:param ach:
	:type ach: Interface_Check
	:rtype: void") CheckCase;
		virtual void CheckCase (const Standard_Integer casenum,const opencascade::handle<Standard_Transient> & ent,const Interface_ShareTool & shares,opencascade::handle<Interface_Check> & ach);

		/****************** CopyCase ******************/
		%feature("compactdefaultargs") CopyCase;
		%feature("autodoc", "* Specific Copy ('Deep') from <entfrom> to <entto> (same type) by using a TransferControl which provides its working Map. Use method Transferred from TransferControl to work Specific Copying of Implied References A Default is provided which does nothing (must current case !) Already copied references (by CopyFrom) must remain unchanged Use method Search from TransferControl to work
	:param casenum:
	:type casenum: int
	:param entfrom:
	:type entfrom: Standard_Transient
	:param entto:
	:type entto: Standard_Transient
	:param TC:
	:type TC: Interface_CopyTool
	:rtype: void") CopyCase;
		virtual void CopyCase (const Standard_Integer casenum,const opencascade::handle<Standard_Transient> & entfrom,const opencascade::handle<Standard_Transient> & entto,Interface_CopyTool & TC);

		/****************** FillSharedCase ******************/
		%feature("compactdefaultargs") FillSharedCase;
		%feature("autodoc", "* Specific filling of the list of Entities shared by an Entity <ent>. Can use the internal utility method Share, below
	:param casenum:
	:type casenum: int
	:param ent:
	:type ent: Standard_Transient
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: void") FillSharedCase;
		virtual void FillSharedCase (const Standard_Integer casenum,const opencascade::handle<Standard_Transient> & ent,Interface_EntityIterator & iter);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a Module bound with a Protocol to the list : does nothing if already in the list, THAT IS, Same Type (exact match) and Same State (that is, IsEqual is not required) Once added, stores its attached Protocol in correspondance
	:param amodule:
	:type amodule: StepData_ReadWriteModule
	:param aprotocol:
	:type aprotocol: StepData_Protocol
	:rtype: None") Add;
		void Add (const opencascade::handle<StepData_ReadWriteModule> & amodule,const opencascade::handle<StepData_Protocol> & aprotocol);

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "* Returns the Module stored in a given GlobalNode
	:rtype: opencascade::handle<StepData_ReadWriteModule>") Module;
		const opencascade::handle<StepData_ReadWriteModule> & Module ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Returns the Next GlobalNode. If none is defined, returned value is a Null Handle
	:rtype: opencascade::handle<StepData_GlobalNodeOfWriterLib>") Next;
		const opencascade::handle<StepData_GlobalNodeOfWriterLib> & Next ();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "* Returns the attached Protocol stored in a given GlobalNode
	:rtype: opencascade::handle<StepData_Protocol>") Protocol;
		const opencascade::handle<StepData_Protocol> & Protocol ();

		/****************** StepData_GlobalNodeOfWriterLib ******************/
		%feature("compactdefaultargs") StepData_GlobalNodeOfWriterLib;
		%feature("autodoc", "* Creates an empty GlobalNode, with no Next
	:rtype: None") StepData_GlobalNodeOfWriterLib;
		 StepData_GlobalNodeOfWriterLib ();

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
		/****************** AddNode ******************/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "* Adds a couple (Module,Protocol), that is, stores it into itself if not yet done, else creates a Next Node to do it
	:param anode:
	:type anode: StepData_GlobalNodeOfWriterLib
	:rtype: None") AddNode;
		void AddNode (const opencascade::handle<StepData_GlobalNodeOfWriterLib> & anode);

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "* Returns the Module designated by a precise Node
	:rtype: opencascade::handle<StepData_ReadWriteModule>") Module;
		const opencascade::handle<StepData_ReadWriteModule> & Module ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Returns the Next Node. If none was defined, returned value is a Null Handle
	:rtype: opencascade::handle<StepData_NodeOfWriterLib>") Next;
		const opencascade::handle<StepData_NodeOfWriterLib> & Next ();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "* Returns the Protocol designated by a precise Node
	:rtype: opencascade::handle<StepData_Protocol>") Protocol;
		const opencascade::handle<StepData_Protocol> & Protocol ();

		/****************** StepData_NodeOfWriterLib ******************/
		%feature("compactdefaultargs") StepData_NodeOfWriterLib;
		%feature("autodoc", "* Creates an empty Node, with no Next
	:rtype: None") StepData_NodeOfWriterLib;
		 StepData_NodeOfWriterLib ();

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
		/****************** AddArity ******************/
		%feature("compactdefaultargs") AddArity;
		%feature("autodoc", "* Adds an arity count to <self>, by default 1 1 : a simple field passes to a LIST/ARRAY etc or a LIST to a LIST OF LIST 2 : a simple field passes to a LIST OF LIST
	:param arity: default value is 1
	:type arity: int
	:rtype: None") AddArity;
		void AddArity (const Standard_Integer arity = 1);

		/****************** AddEnumDef ******************/
		%feature("compactdefaultargs") AddEnumDef;
		%feature("autodoc", "* Adds an enum value as a string
	:param enumdef:
	:type enumdef: char *
	:rtype: None") AddEnumDef;
		void AddEnumDef (const char * enumdef);

		/****************** AddMember ******************/
		%feature("compactdefaultargs") AddMember;
		%feature("autodoc", "* Adds a member to a SELECT description
	:param member:
	:type member: StepData_PDescr
	:rtype: None") AddMember;
		void AddMember (const opencascade::handle<StepData_PDescr> & member);

		/****************** Arity ******************/
		%feature("compactdefaultargs") Arity;
		%feature("autodoc", "* Returns the arity of <self>
	:rtype: int") Arity;
		Standard_Integer Arity ();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "* Semantic Check of a Field : does it complies with the given description ?
	:param afild:
	:type afild: StepData_Field
	:param ach:
	:type ach: Interface_Check
	:rtype: void") Check;
		virtual void Check (const StepData_Field & afild,opencascade::handle<Interface_Check> & ach);

		/****************** DescrName ******************/
		%feature("compactdefaultargs") DescrName;
		%feature("autodoc", "* Returns the description (type name) to match, for a Described (else, empty string)
	:rtype: char *") DescrName;
		const char * DescrName ();

		/****************** EnumMax ******************/
		%feature("compactdefaultargs") EnumMax;
		%feature("autodoc", "* Returns the maximum integer for a suitable value (count - 1)
	:rtype: int") EnumMax;
		Standard_Integer EnumMax ();

		/****************** EnumText ******************/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "* Returns the text which corresponds to a numeric value, between 0 and EnumMax. It is limited by dots
	:param val:
	:type val: int
	:rtype: char *") EnumText;
		const char * EnumText (const Standard_Integer val);

		/****************** EnumValue ******************/
		%feature("compactdefaultargs") EnumValue;
		%feature("autodoc", "* Returns the numeric value found for an enum text The text must be in capitals and limited by dots A non-suitable text gives a negative value to be returned
	:param name:
	:type name: char *
	:rtype: int") EnumValue;
		Standard_Integer EnumValue (const char * name);

		/****************** FieldName ******************/
		%feature("compactdefaultargs") FieldName;
		%feature("autodoc", ":rtype: char *") FieldName;
		const char * FieldName ();

		/****************** FieldRank ******************/
		%feature("compactdefaultargs") FieldRank;
		%feature("autodoc", ":rtype: int") FieldRank;
		Standard_Integer FieldRank ();

		/****************** IsBoolean ******************/
		%feature("compactdefaultargs") IsBoolean;
		%feature("autodoc", "* Tells if <self> is for a Boolean value (false,true)
	:rtype: bool") IsBoolean;
		Standard_Boolean IsBoolean ();

		/****************** IsDerived ******************/
		%feature("compactdefaultargs") IsDerived;
		%feature("autodoc", "* Tells if <self> is Derived
	:rtype: bool") IsDerived;
		Standard_Boolean IsDerived ();

		/****************** IsDescr ******************/
		%feature("compactdefaultargs") IsDescr;
		%feature("autodoc", "* Tells if <self> is for a Described entity of a given EDescr (does this EDescr match description name ?). For late-bnd (works for <self> + nexts if <self> is a Select)
	:param descr:
	:type descr: StepData_EDescr
	:rtype: bool") IsDescr;
		Standard_Boolean IsDescr (const opencascade::handle<StepData_EDescr> & descr);

		/****************** IsEntity ******************/
		%feature("compactdefaultargs") IsEntity;
		%feature("autodoc", "* Tells if <self> is for an Entity, either Described or CDL Type
	:rtype: bool") IsEntity;
		Standard_Boolean IsEntity ();

		/****************** IsEnum ******************/
		%feature("compactdefaultargs") IsEnum;
		%feature("autodoc", "* Tells if <self> is for an Enum value Then, call AddEnumDef ordered from the first one (value 0) Managed by an EnumTool
	:rtype: bool") IsEnum;
		Standard_Boolean IsEnum ();

		/****************** IsField ******************/
		%feature("compactdefaultargs") IsField;
		%feature("autodoc", "* Tells if <self> is a Field. Else it is a Type
	:rtype: bool") IsField;
		Standard_Boolean IsField ();

		/****************** IsInteger ******************/
		%feature("compactdefaultargs") IsInteger;
		%feature("autodoc", "* Tells if <self> is for an Integer
	:rtype: bool") IsInteger;
		Standard_Boolean IsInteger ();

		/****************** IsLogical ******************/
		%feature("compactdefaultargs") IsLogical;
		%feature("autodoc", "* Tells if <self> is for a Logical value (false,true,unknown)
	:rtype: bool") IsLogical;
		Standard_Boolean IsLogical ();

		/****************** IsOptional ******************/
		%feature("compactdefaultargs") IsOptional;
		%feature("autodoc", "* Tells if <self> is Optional
	:rtype: bool") IsOptional;
		Standard_Boolean IsOptional ();

		/****************** IsReal ******************/
		%feature("compactdefaultargs") IsReal;
		%feature("autodoc", "* Tells if <self> is for a Real value
	:rtype: bool") IsReal;
		Standard_Boolean IsReal ();

		/****************** IsSelect ******************/
		%feature("compactdefaultargs") IsSelect;
		%feature("autodoc", "* Tells if <self> is for a SELECT
	:rtype: bool") IsSelect;
		Standard_Boolean IsSelect ();

		/****************** IsString ******************/
		%feature("compactdefaultargs") IsString;
		%feature("autodoc", "* Tells if <self> is for a String value
	:rtype: bool") IsString;
		Standard_Boolean IsString ();

		/****************** IsType ******************/
		%feature("compactdefaultargs") IsType;
		%feature("autodoc", "* Tells if <self> is for an entity of a given CDL type (early-bnd) (works for <self> + nexts if <self> is a Select)
	:param atype:
	:type atype: Standard_Type
	:rtype: bool") IsType;
		Standard_Boolean IsType (const opencascade::handle<Standard_Type> & atype);

		/****************** Member ******************/
		%feature("compactdefaultargs") Member;
		%feature("autodoc", "* For a SELECT, returns the member whose name matches <name> To this member, the following question can then be asked Null Handle if <name> not matched or <self> not a SELECT //! Remark : not to be asked for an entity type Hence, following IsInteger .. Enum* only apply on <self> and require Member While IsType applies on <self> and all Select Members
	:param name:
	:type name: char *
	:rtype: opencascade::handle<StepData_PDescr>") Member;
		opencascade::handle<StepData_PDescr> Member (const char * name);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", ":rtype: char *") Name;
		const char * Name ();

		/****************** SetArity ******************/
		%feature("compactdefaultargs") SetArity;
		%feature("autodoc", "* Directly sets the arity count 0 : simple field 1 : LIST or ARRAY etc 2 : LIST OF LIST
	:param arity: default value is 1
	:type arity: int
	:rtype: None") SetArity;
		void SetArity (const Standard_Integer arity = 1);

		/****************** SetBoolean ******************/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "* Sets <self> for a Boolean value (false,true)
	:rtype: None") SetBoolean;
		void SetBoolean ();

		/****************** SetDerived ******************/
		%feature("compactdefaultargs") SetDerived;
		%feature("autodoc", "* Sets/Unsets <self> to be for a derived field
	:param der: default value is Standard_True
	:type der: bool
	:rtype: None") SetDerived;
		void SetDerived (const Standard_Boolean der = Standard_True);

		/****************** SetDescr ******************/
		%feature("compactdefaultargs") SetDescr;
		%feature("autodoc", "* Sets <self> for a Described Entity, whose Description must match the type name <dscnam>
	:param dscnam:
	:type dscnam: char *
	:rtype: None") SetDescr;
		void SetDescr (const char * dscnam);

		/****************** SetEnum ******************/
		%feature("compactdefaultargs") SetEnum;
		%feature("autodoc", "* Sets <self> for an Enum value Then, call AddEnumDef ordered from the first one (value 0)
	:rtype: None") SetEnum;
		void SetEnum ();

		/****************** SetField ******************/
		%feature("compactdefaultargs") SetField;
		%feature("autodoc", "* Sets <self> to describe a field of an entity With a name and a rank
	:param name:
	:type name: char *
	:param rank:
	:type rank: int
	:rtype: None") SetField;
		void SetField (const char * name,const Standard_Integer rank);

		/****************** SetFrom ******************/
		%feature("compactdefaultargs") SetFrom;
		%feature("autodoc", "* Sets <self> as <other> but duplicated Hence, some definition may be changed
	:param other:
	:type other: StepData_PDescr
	:rtype: None") SetFrom;
		void SetFrom (const opencascade::handle<StepData_PDescr> & other);

		/****************** SetInteger ******************/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "* Sets <self> for an Integer value
	:rtype: None") SetInteger;
		void SetInteger ();

		/****************** SetLogical ******************/
		%feature("compactdefaultargs") SetLogical;
		%feature("autodoc", "* Sets <self> for a Logical value (false,true,unknown)
	:rtype: None") SetLogical;
		void SetLogical ();

		/****************** SetMemberName ******************/
		%feature("compactdefaultargs") SetMemberName;
		%feature("autodoc", "* Sets a name for SELECT member. To be used if a member is for an immediate type
	:param memname:
	:type memname: char *
	:rtype: None") SetMemberName;
		void SetMemberName (const char * memname);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", ":param name:
	:type name: char *
	:rtype: None") SetName;
		void SetName (const char * name);

		/****************** SetOptional ******************/
		%feature("compactdefaultargs") SetOptional;
		%feature("autodoc", "* Sets/Unsets <self> to accept undefined values
	:param opt: default value is Standard_True
	:type opt: bool
	:rtype: None") SetOptional;
		void SetOptional (const Standard_Boolean opt = Standard_True);

		/****************** SetReal ******************/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "* Sets <self> for a Real value
	:rtype: None") SetReal;
		void SetReal ();

		/****************** SetSelect ******************/
		%feature("compactdefaultargs") SetSelect;
		%feature("autodoc", "* Declares this PDescr to be a Select, hence to have members <self> itself can be the first member
	:rtype: None") SetSelect;
		void SetSelect ();

		/****************** SetString ******************/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "* Sets <self> for a String value
	:rtype: None") SetString;
		void SetString ();

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "* Sets <self> for an Entity which must match a Type (early-bound)
	:param atype:
	:type atype: Standard_Type
	:rtype: None") SetType;
		void SetType (const opencascade::handle<Standard_Type> & atype);

		/****************** Simple ******************/
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", "* For a LIST or LIST OF LIST, Returns the PDescr for the simpler PDescr. Else, returns <self> This allows to have different attributes for Optional for instance, on a field, and on the parameter of a LIST : [OPTIONAL] LIST OF [OPTIONAL] ...
	:rtype: opencascade::handle<StepData_PDescr>") Simple;
		opencascade::handle<StepData_PDescr> Simple ();

		/****************** StepData_PDescr ******************/
		%feature("compactdefaultargs") StepData_PDescr;
		%feature("autodoc", ":rtype: None") StepData_PDescr;
		 StepData_PDescr ();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns the type to match (IsKind), for a CDL Entity (else, null handle)
	:rtype: opencascade::handle<Standard_Type>") Type;
		opencascade::handle<Standard_Type> Type ();

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
		/****************** AddBasicDescr ******************/
		%feature("compactdefaultargs") AddBasicDescr;
		%feature("autodoc", "* Records an ESDescr, intended to build complex descriptions
	:param esdescr:
	:type esdescr: StepData_ESDescr
	:rtype: None") AddBasicDescr;
		void AddBasicDescr (const opencascade::handle<StepData_ESDescr> & esdescr);

		/****************** AddDescr ******************/
		%feature("compactdefaultargs") AddDescr;
		%feature("autodoc", "* Records an EDescr with its case number Also records its name for an ESDescr (simple type): an ESDescr is then used, for case number, or for type name
	:param adescr:
	:type adescr: StepData_EDescr
	:param CN:
	:type CN: int
	:rtype: None") AddDescr;
		void AddDescr (const opencascade::handle<StepData_EDescr> & adescr,const Standard_Integer CN);

		/****************** AddPDescr ******************/
		%feature("compactdefaultargs") AddPDescr;
		%feature("autodoc", "* Records an PDescr
	:param pdescr:
	:type pdescr: StepData_PDescr
	:rtype: None") AddPDescr;
		void AddPDescr (const opencascade::handle<StepData_PDescr> & pdescr);

		/****************** BasicDescr ******************/
		%feature("compactdefaultargs") BasicDescr;
		%feature("autodoc", "* Returns a basic description according to its name <anylevel> True (D) : for <self> and its resources <anylevel> False : for <self> only
	:param name:
	:type name: char *
	:param anylevel: default value is Standard_True
	:type anylevel: bool
	:rtype: opencascade::handle<StepData_EDescr>") BasicDescr;
		opencascade::handle<StepData_EDescr> BasicDescr (const char * name,const Standard_Boolean anylevel = Standard_True);

		/****************** CaseNumber ******************/
		%feature("compactdefaultargs") CaseNumber;
		%feature("autodoc", "* Returns a unique positive number for any recognized entity Redefined to work by calling both TypeNumber and, for a Described Entity (late binding) DescrNumber
	:param obj:
	:type obj: Standard_Transient
	:rtype: int") CaseNumber;
		virtual Standard_Integer CaseNumber (const opencascade::handle<Standard_Transient> & obj);

		/****************** Descr ******************/
		%feature("compactdefaultargs") Descr;
		%feature("autodoc", "* Returns the description attached to a case number, or null
	:param num:
	:type num: int
	:rtype: opencascade::handle<StepData_EDescr>") Descr;
		opencascade::handle<StepData_EDescr> Descr (const Standard_Integer num);

		/****************** Descr ******************/
		%feature("compactdefaultargs") Descr;
		%feature("autodoc", "* Returns a description according to its name <anylevel> True (D) : for <self> and its resources <anylevel> False : for <self> only
	:param name:
	:type name: char *
	:param anylevel: default value is Standard_True
	:type anylevel: bool
	:rtype: opencascade::handle<StepData_EDescr>") Descr;
		opencascade::handle<StepData_EDescr> Descr (const char * name,const Standard_Boolean anylevel = Standard_True);

		/****************** DescrNumber ******************/
		%feature("compactdefaultargs") DescrNumber;
		%feature("autodoc", "* Returns a unique positive CaseNumber for types described by an EDescr (late binding) Warning : TypeNumber and DescrNumber must give together a unique positive case number for each distinct case, type or descr
	:param adescr:
	:type adescr: StepData_EDescr
	:rtype: int") DescrNumber;
		virtual Standard_Integer DescrNumber (const opencascade::handle<StepData_EDescr> & adescr);

		/****************** ECDescr ******************/
		%feature("compactdefaultargs") ECDescr;
		%feature("autodoc", "* Returns a complex description according to list of names <anylevel> True (D) : for <self> and its resources <anylevel> False : for <self> only
	:param names:
	:type names: TColStd_SequenceOfAsciiString
	:param anylevel: default value is Standard_True
	:type anylevel: bool
	:rtype: opencascade::handle<StepData_ECDescr>") ECDescr;
		opencascade::handle<StepData_ECDescr> ECDescr (const TColStd_SequenceOfAsciiString & names,const Standard_Boolean anylevel = Standard_True);

		/****************** ESDescr ******************/
		%feature("compactdefaultargs") ESDescr;
		%feature("autodoc", "* Idem as Descr but cast to simple description
	:param name:
	:type name: char *
	:param anylevel: default value is Standard_True
	:type anylevel: bool
	:rtype: opencascade::handle<StepData_ESDescr>") ESDescr;
		opencascade::handle<StepData_ESDescr> ESDescr (const char * name,const Standard_Boolean anylevel = Standard_True);

		/****************** HasDescr ******************/
		%feature("compactdefaultargs") HasDescr;
		%feature("autodoc", "* Tells if a Protocol brings at least one ESDescr, i.e. if it defines at least one entity description by ESDescr mechanism
	:rtype: bool") HasDescr;
		Standard_Boolean HasDescr ();

		/****************** IsSuitableModel ******************/
		%feature("compactdefaultargs") IsSuitableModel;
		%feature("autodoc", "* Returns True if <model> is a Model of Step Norm
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") IsSuitableModel;
		Standard_Boolean IsSuitableModel (const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** IsUnknownEntity ******************/
		%feature("compactdefaultargs") IsUnknownEntity;
		%feature("autodoc", "* Returns True if <ent> is an Unknown Entity for the Norm, i.e. Type UndefinedEntity, status Unknown
	:param ent:
	:type ent: Standard_Transient
	:rtype: bool") IsUnknownEntity;
		Standard_Boolean IsUnknownEntity (const opencascade::handle<Standard_Transient> & ent);

		/****************** NbResources ******************/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "* Gives the count of Protocols used as Resource (can be zero) Here, No resource
	:rtype: int") NbResources;
		Standard_Integer NbResources ();

		/****************** NewModel ******************/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "* Creates an empty Model for Step Norm
	:rtype: opencascade::handle<Interface_InterfaceModel>") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel ();

		/****************** PDescr ******************/
		%feature("compactdefaultargs") PDescr;
		%feature("autodoc", "* Returns a parameter description according to its name <anylevel> True (D) : for <self> and its resources <anylevel> False : for <self> only
	:param name:
	:type name: char *
	:param anylevel: default value is Standard_True
	:type anylevel: bool
	:rtype: opencascade::handle<StepData_PDescr>") PDescr;
		opencascade::handle<StepData_PDescr> PDescr (const char * name,const Standard_Boolean anylevel = Standard_True);

		/****************** Resource ******************/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "* Returns a Resource, given a rank. Here, none
	:param num:
	:type num: int
	:rtype: opencascade::handle<Interface_Protocol>") Resource;
		opencascade::handle<Interface_Protocol> Resource (const Standard_Integer num);

		/****************** SchemaName ******************/
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "* Returns the Schema Name attached to each class of Protocol To be redefined by each sub-class Here, SchemaName returns '(DEFAULT)' was C++ : return const
	:rtype: char *") SchemaName;
		virtual const char * SchemaName ();

		/****************** StepData_Protocol ******************/
		%feature("compactdefaultargs") StepData_Protocol;
		%feature("autodoc", ":rtype: None") StepData_Protocol;
		 StepData_Protocol ();

		/****************** TypeNumber ******************/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "* Returns a Case Number, specific of each recognized Type Here, only Unknown Entity is recognized
	:param atype:
	:type atype: Standard_Type
	:rtype: int") TypeNumber;
		Standard_Integer TypeNumber (const opencascade::handle<Standard_Type> & atype);

		/****************** UnknownEntity ******************/
		%feature("compactdefaultargs") UnknownEntity;
		%feature("autodoc", "* Creates a new Unknown Entity for Step (UndefinedEntity)
	:rtype: opencascade::handle<Standard_Transient>") UnknownEntity;
		opencascade::handle<Standard_Transient> UnknownEntity ();

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
		%feature("autodoc", "* Translate the Type of record <num> in <data> to a positive Case Number, or 0 if failed. Works with a StepReaderData, in which the Type of an Entity is defined as a String : Reads the RecordType <num> then calls CaseNum (this type) Warning : The methods CaseStep, StepType and Recognize, must be in phase (triplets CaseNum-StepType-Type of Object)
	:param data:
	:type data: Interface_FileReaderData
	:param num:
	:type num: int
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Interface_FileReaderData> & data,const Standard_Integer num);

		/****************** CaseStep ******************/
		%feature("compactdefaultargs") CaseStep;
		%feature("autodoc", "* Defines Case Numbers corresponding to the recognized Types Called by CaseNum (data,num) above for a Simple Type Entity Warning : CaseStep must give the same Value as Protocol does for the Entity type which corresponds to this Type given as a String
	:param atype:
	:type atype: TCollection_AsciiString
	:rtype: int") CaseStep;
		virtual Standard_Integer CaseStep (const TCollection_AsciiString & atype);

		/****************** CaseStep ******************/
		%feature("compactdefaultargs") CaseStep;
		%feature("autodoc", "* Same a above but for a Complex Type Entity ('Plex') The provided Default recognizes nothing
	:param types:
	:type types: TColStd_SequenceOfAsciiString
	:rtype: int") CaseStep;
		virtual Standard_Integer CaseStep (const TColStd_SequenceOfAsciiString & types);

		/****************** ComplexType ******************/
		%feature("compactdefaultargs") ComplexType;
		%feature("autodoc", "* Function specific to STEP, which delivers the list of types which corresponds to a complex type. If <CN> is not for a complex type, this method returns False. Else it returns True and fills the list in alphabetic order. The default returns False. To be redefined as required.
	:param CN:
	:type CN: int
	:param types:
	:type types: TColStd_SequenceOfAsciiString
	:rtype: bool") ComplexType;
		virtual Standard_Boolean ComplexType (const Standard_Integer CN,TColStd_SequenceOfAsciiString & types);

		/****************** IsComplex ******************/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "* Returns True if the Case Number corresponds to a Complex Type ('Plex'). Remember that all possible combinations must be aknowledged to be processed Default is False for all cases. For a Protocol which defines possible Plexes, this method must be redefined.
	:param CN:
	:type CN: int
	:rtype: bool") IsComplex;
		virtual Standard_Boolean IsComplex (const Standard_Integer CN);

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "* General Read Function, calls ReadStep
	:param CN:
	:type CN: int
	:param data:
	:type data: Interface_FileReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: Standard_Transient
	:rtype: None") Read;
		void Read (const Standard_Integer CN,const opencascade::handle<Interface_FileReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<Standard_Transient> & ent);

		/****************** ReadStep ******************/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "* Specific Read Function. Works with StepReaderData
	:param CN:
	:type CN: int
	:param data:
	:type data: StepData_StepReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: Standard_Transient
	:rtype: void") ReadStep;
		virtual void ReadStep (const Standard_Integer CN,const opencascade::handle<StepData_StepReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<Standard_Transient> & ent);

		/****************** ShortType ******************/
		%feature("compactdefaultargs") ShortType;
		%feature("autodoc", "* Function specific to STEP. Some STEP Types have a short form This method can be redefined to fill it By default, returns an empty string, which is then interpreted to take normal form from StepType
	:param CN:
	:type CN: int
	:rtype: TCollection_AsciiString") ShortType;
		virtual TCollection_AsciiString ShortType (const Standard_Integer CN);

		/****************** StepType ******************/
		%feature("compactdefaultargs") StepType;
		%feature("autodoc", "* Function specific to STEP, which delivers the StepType as it is recorded in and read from a File compliant with STEP. This method is symmetric to the method CaseStep. StepType can be different from Dynamic Type's name, but belongs to the same class of Object. Returns an empty String if <CN> is zero. Warning : For a Complex Type Entity, returns an Empty String (Complex Type must be managed by users)
	:param CN:
	:type CN: int
	:rtype: TCollection_AsciiString") StepType;
		virtual const TCollection_AsciiString & StepType (const Standard_Integer CN);

		/****************** WriteStep ******************/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "* Write Function, switched by CaseNum
	:param CN:
	:type CN: int
	:param SW:
	:type SW: StepData_StepWriter
	:param ent:
	:type ent: Standard_Transient
	:rtype: void") WriteStep;
		virtual void WriteStep (const Standard_Integer CN,StepData_StepWriter & SW,const opencascade::handle<Standard_Transient> & ent);

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
		/****************** Boolean ******************/
		%feature("compactdefaultargs") Boolean;
		%feature("autodoc", ":rtype: bool") Boolean;
		Standard_Boolean Boolean ();

		/****************** Enum ******************/
		%feature("compactdefaultargs") Enum;
		%feature("autodoc", ":rtype: int") Enum;
		Standard_Integer Enum ();

		/****************** EnumText ******************/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", ":rtype: char *") EnumText;
		virtual const char * EnumText ();

		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "* Tells if a SelectMember has a name. Default is False
	:rtype: bool") HasName;
		virtual Standard_Boolean HasName ();

		/****************** Int ******************/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "* This internal method gives access to a value implemented by an Integer (to read it)
	:rtype: int") Int;
		virtual Standard_Integer Int ();

		/****************** Integer ******************/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "* Gets the value as an Integer
	:rtype: int") Integer;
		Standard_Integer Integer ();

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", ":rtype: int") Kind;
		virtual Standard_Integer Kind ();

		/****************** Logical ******************/
		%feature("compactdefaultargs") Logical;
		%feature("autodoc", ":rtype: StepData_Logical") Logical;
		StepData_Logical Logical ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if the name of a SelectMember matches a given one By default, compares the strings, can be redefined (optimised)
	:param name:
	:type name: char *
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (const char * name);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns the name of a SelectMember. Default is empty
	:rtype: char *") Name;
		virtual const char * Name ();

		/****************** ParamType ******************/
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "* Returns the Kind of the SelectMember, under the form of an enum ParamType
	:rtype: Interface_ParamType") ParamType;
		Interface_ParamType ParamType ();

		/****************** Real ******************/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", ":rtype: float") Real;
		virtual Standard_Real Real ();

		/****************** SetBoolean ******************/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", ":param val:
	:type val: bool
	:rtype: None") SetBoolean;
		void SetBoolean (const Standard_Boolean val);

		/****************** SetEnum ******************/
		%feature("compactdefaultargs") SetEnum;
		%feature("autodoc", ":param val:
	:type val: int
	:param text: default value is ""
	:type text: char *
	:rtype: None") SetEnum;
		void SetEnum (const Standard_Integer val,const char * text = "");

		/****************** SetEnumText ******************/
		%feature("compactdefaultargs") SetEnumText;
		%feature("autodoc", ":param val:
	:type val: int
	:param text:
	:type text: char *
	:rtype: void") SetEnumText;
		virtual void SetEnumText (const Standard_Integer val,const char * text);

		/****************** SetInt ******************/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "* This internal method gives access to a value implemented by an Integer (to set it)
	:param val:
	:type val: int
	:rtype: void") SetInt;
		virtual void SetInt (const Standard_Integer val);

		/****************** SetInteger ******************/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", ":param val:
	:type val: int
	:rtype: None") SetInteger;
		void SetInteger (const Standard_Integer val);

		/****************** SetKind ******************/
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", ":param kind:
	:type kind: int
	:rtype: void") SetKind;
		virtual void SetKind (const Standard_Integer kind);

		/****************** SetLogical ******************/
		%feature("compactdefaultargs") SetLogical;
		%feature("autodoc", ":param val:
	:type val: StepData_Logical
	:rtype: None") SetLogical;
		void SetLogical (const StepData_Logical val);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Sets the name of a SelectMember, returns True if done, False if no name is allowed Default does nothing and returns False
	:param name:
	:type name: char *
	:rtype: bool") SetName;
		virtual Standard_Boolean SetName (const char * name);

		/****************** SetReal ******************/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", ":param val:
	:type val: float
	:rtype: void") SetReal;
		virtual void SetReal (const Standard_Real val);

		/****************** SetString ******************/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", ":param val:
	:type val: char *
	:rtype: void") SetString;
		virtual void SetString (const char * val);

		/****************** StepData_SelectMember ******************/
		%feature("compactdefaultargs") StepData_SelectMember;
		%feature("autodoc", ":rtype: None") StepData_SelectMember;
		 StepData_SelectMember ();

		/****************** String ******************/
		%feature("compactdefaultargs") String;
		%feature("autodoc", ":rtype: char *") String;
		virtual const char * String ();

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
		%feature("autodoc", ":rtype: bool") Boolean;
		Standard_Boolean Boolean ();

		/****************** CaseMem ******************/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "* Recognize a SelectMember (kind, name). Returns a positive value which identifies the case in the List of immediate cases (distinct from the List of Entity Types). Zero if not recognizes Default returns 0, saying that no immediate value is allowed
	:param ent:
	:type ent: StepData_SelectMember
	:rtype: int") CaseMem;
		virtual Standard_Integer CaseMem (const opencascade::handle<StepData_SelectMember> & ent);

		/****************** CaseMember ******************/
		%feature("compactdefaultargs") CaseMember;
		%feature("autodoc", "* Returns the Type of the stored SelectMember, or zero if it is Null or Entity. Calls the method CaseMem on Value
	:rtype: int") CaseMember;
		Standard_Integer CaseMember ();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes the Type of an Entity. Returns a positive Number which identifies the Type in the definition List of the SelectType. Returns Zero if its Type in not in this List.
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		virtual Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** CaseNumber ******************/
		%feature("compactdefaultargs") CaseNumber;
		%feature("autodoc", "* Recognizes the Type of the stored Entity, or zero if it is Null or SelectMember. Calls the first method CaseNum on Value
	:rtype: int") CaseNumber;
		Standard_Integer CaseNumber ();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "* Returns the Description which corresponds to <self> Null if no specific description to give. This description is used to control reading an check validity. Default returns a Null Handle, i.e. undefined description It can suffice if CaseNum and CaseMem give enough control
	:rtype: opencascade::handle<StepData_PDescr>") Description;
		virtual opencascade::handle<StepData_PDescr> Description ();

		/****************** Int ******************/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "* This internal method gives access to a value implemented by an Integer (to read it)
	:rtype: int") Int;
		Standard_Integer Int ();

		/****************** Integer ******************/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "* Gets the value as an Integer
	:rtype: int") Integer;
		Standard_Integer Integer ();

		/****************** IsNull ******************/
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "* Returns True if there is no Stored Entity (i.e. it is Null)
	:rtype: bool") IsNull;
		Standard_Boolean IsNull ();

		/****************** Logical ******************/
		%feature("compactdefaultargs") Logical;
		%feature("autodoc", ":rtype: StepData_Logical") Logical;
		StepData_Logical Logical ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Returns True if the Type of an Entity complies with the definition list of the SelectType. Also checks for a SelectMember Default Implementation looks for CaseNum or CaseMem positive
	:param ent:
	:type ent: Standard_Transient
	:rtype: bool") Matches;
		Standard_Boolean Matches (const opencascade::handle<Standard_Transient> & ent);

		/****************** Member ******************/
		%feature("compactdefaultargs") Member;
		%feature("autodoc", "* Returns Value as a SelectMember. Null if not a SelectMember
	:rtype: opencascade::handle<StepData_SelectMember>") Member;
		opencascade::handle<StepData_SelectMember> Member ();

		/****************** NewMember ******************/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "* Returns a preferred SelectMember. Default returns a Null By default, a SelectMember can be set according to data type and Name : it is a SelectNamed if Name is defined //! This method allows to define, for a specific SelectType, a specific SelectMember than SelectNamed. For instance for a Real plus a Name, a SelectReal plus a case number is a good solution, lighter than SelectNamed which is very multipurpose
	:rtype: opencascade::handle<StepData_SelectMember>") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember ();

		/****************** Nullify ******************/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "* Nullifies the Stored Entity
	:rtype: None") Nullify;
		void Nullify ();

		/****************** Real ******************/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", ":rtype: float") Real;
		Standard_Real Real ();

		/****************** SelectName ******************/
		%feature("compactdefaultargs") SelectName;
		%feature("autodoc", "* Returns the type name of SelectMember. If no SelectMember or with no type name, returns an empty string To change it, pass through the SelectMember itself
	:rtype: char *") SelectName;
		const char * SelectName ();

		/****************** SetBoolean ******************/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", ":param val:
	:type val: bool
	:param name: default value is ""
	:type name: char *
	:rtype: None") SetBoolean;
		void SetBoolean (const Standard_Boolean val,const char * name = "");

		/****************** SetInt ******************/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "* This internal method gives access to a value implemented by an Integer (to set it) : a SelectMember MUST ALREADY BE THERE !
	:param val:
	:type val: int
	:rtype: None") SetInt;
		void SetInt (const Standard_Integer val);

		/****************** SetInteger ******************/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "* Sets a new Integer value, with an optional type name Warning : If a SelectMember is already set, works on it : value and name must then be accepted by this SelectMember
	:param val:
	:type val: int
	:param name: default value is ""
	:type name: char *
	:rtype: None") SetInteger;
		void SetInteger (const Standard_Integer val,const char * name = "");

		/****************** SetLogical ******************/
		%feature("compactdefaultargs") SetLogical;
		%feature("autodoc", ":param val:
	:type val: StepData_Logical
	:param name: default value is ""
	:type name: char *
	:rtype: None") SetLogical;
		void SetLogical (const StepData_Logical val,const char * name = "");

		/****************** SetReal ******************/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", ":param val:
	:type val: float
	:param name: default value is ""
	:type name: char *
	:rtype: None") SetReal;
		void SetReal (const Standard_Real val,const char * name = "");

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Stores an Entity. This allows to define a specific SelectType class with one read method per member Type, which returns the Value casted with the good Type.
	:param ent:
	:type ent: Standard_Transient
	:rtype: None") SetValue;
		void SetValue (const opencascade::handle<Standard_Transient> & ent);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns the Effective (Dynamic) Type of the Stored Entity If it is Null, returns TYPE(Transient)
	:rtype: opencascade::handle<Standard_Type>") Type;
		opencascade::handle<Standard_Type> Type ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the Stored Entity. Can be used to define specific read methods (see above)
	:rtype: opencascade::handle<Standard_Transient>") Value;
		const opencascade::handle<Standard_Transient> & Value ();

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
		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dumps a Entity on an Messenger. Returns True if sucess, False, if the entity to dump has not been recognized by the Protocol. <level> can have one of these values : - 0 : prints the TYPE only, as known in STEP Files (StepType) If <ent> has not been regognized by the Protocol, or if its type is Complex, the StepType is replaced by the display of the cdl type. Complex Type are well processed by level 1. - 1 : dumps the entity, completely (whatever it has simple or complex type) but alone. - 2 : dumps the entity completely, plus the item its refers to at first level (a header message designates the starting entity of the dump) <Lists Shared and Implied> - 3 : dumps the entity and its refered items at any levels //! For levels 1,2,3, the numbers displayed (form #nnn) are the numbers of the corresponding entities in the Model
	:param S:
	:type S: Message_Messenger
	:param ent:
	:type ent: Standard_Transient
	:param level:
	:type level: int
	:rtype: bool") Dump;
		Standard_Boolean Dump (const opencascade::handle<Message_Messenger> & S,const opencascade::handle<Standard_Transient> & ent,const Standard_Integer level);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Works as Dump with a Transient, but directly takes the entity designated by its number in the Model Returns False, also if <num> is out of range
	:param S:
	:type S: Message_Messenger
	:param num:
	:type num: int
	:param level:
	:type level: int
	:rtype: bool") Dump;
		Standard_Boolean Dump (const opencascade::handle<Message_Messenger> & S,const Standard_Integer num,const Standard_Integer level);

		/****************** StepData_StepDumper ******************/
		%feature("compactdefaultargs") StepData_StepDumper;
		%feature("autodoc", "* Creates a StepDumper, able to work on a given StepModel (which defines the total scope for dumping entities) and a given Protocol from Step (which defines the authorized types to be dumped) <mode> commands what is to be displayed (number or label) 0 for number (and corresponding labels are displayed apart) 1 for label (and corresponding numbers are displayed apart) 2 for label without anymore
	:param amodel:
	:type amodel: StepData_StepModel
	:param protocol:
	:type protocol: StepData_Protocol
	:param mode: default value is 0
	:type mode: int
	:rtype: None") StepData_StepDumper;
		 StepData_StepDumper (const opencascade::handle<StepData_StepModel> & amodel,const opencascade::handle<StepData_Protocol> & protocol,const Standard_Integer mode = 0);

		/****************** StepWriter ******************/
		%feature("compactdefaultargs") StepWriter;
		%feature("autodoc", "* Gives an access to the tool which is used to work : this allow to acts on some parameters : Floating Format, Scopes ...
	:rtype: StepData_StepWriter") StepWriter;
		StepData_StepWriter & StepWriter ();

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
		/****************** AddHeaderEntity ******************/
		%feature("compactdefaultargs") AddHeaderEntity;
		%feature("autodoc", "* Adds an Entity to the Header
	:param ent:
	:type ent: Standard_Transient
	:rtype: None") AddHeaderEntity;
		void AddHeaderEntity (const opencascade::handle<Standard_Transient> & ent);

		/****************** ClearHeader ******************/
		%feature("compactdefaultargs") ClearHeader;
		%feature("autodoc", "* Clears the Header
	:rtype: None") ClearHeader;
		void ClearHeader ();

		/****************** ClearLabels ******************/
		%feature("compactdefaultargs") ClearLabels;
		%feature("autodoc", "* erases specific labels, i.e. clears the map (entity-ident)
	:rtype: None") ClearLabels;
		void ClearLabels ();

		/****************** DumpHeader ******************/
		%feature("compactdefaultargs") DumpHeader;
		%feature("autodoc", "* Dumps the Header, with the Header Protocol of StepData. If the Header Protocol is not defined, for each Header Entity, prints its Type. Else sends the Header under the form of HEADER Section of an Ascii Step File <level> is not used because Header is not so big
	:param S:
	:type S: Message_Messenger
	:param level: default value is 0
	:type level: int
	:rtype: None") DumpHeader;
		void DumpHeader (const opencascade::handle<Message_Messenger> & S,const Standard_Integer level = 0);

		/****************** Entity ******************/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "* returns entity given its rank. Same as InterfaceEntity, but with a shorter name
	:param num:
	:type num: int
	:rtype: opencascade::handle<Standard_Transient>") Entity;
		opencascade::handle<Standard_Transient> Entity (const Standard_Integer num);

		/****************** GetFromAnother ******************/
		%feature("compactdefaultargs") GetFromAnother;
		%feature("autodoc", "* gets header from another Model (uses Header Protocol)
	:param other:
	:type other: Interface_InterfaceModel
	:rtype: None") GetFromAnother;
		void GetFromAnother (const opencascade::handle<Interface_InterfaceModel> & other);

		/****************** HasHeaderEntity ******************/
		%feature("compactdefaultargs") HasHeaderEntity;
		%feature("autodoc", "* says if a Header entity has a specifed type
	:param atype:
	:type atype: Standard_Type
	:rtype: bool") HasHeaderEntity;
		Standard_Boolean HasHeaderEntity (const opencascade::handle<Standard_Type> & atype);

		/****************** Header ******************/
		%feature("compactdefaultargs") Header;
		%feature("autodoc", "* returns Header entities under the form of an iterator
	:rtype: Interface_EntityIterator") Header;
		Interface_EntityIterator Header ();

		/****************** HeaderEntity ******************/
		%feature("compactdefaultargs") HeaderEntity;
		%feature("autodoc", "* Returns Header entity with specified type, if there is
	:param atype:
	:type atype: Standard_Type
	:rtype: opencascade::handle<Standard_Transient>") HeaderEntity;
		opencascade::handle<Standard_Transient> HeaderEntity (const opencascade::handle<Standard_Type> & atype);

		/****************** IdentLabel ******************/
		%feature("compactdefaultargs") IdentLabel;
		%feature("autodoc", "* returns the label ident attached to an entity, 0 if not in me
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") IdentLabel;
		Standard_Integer IdentLabel (const opencascade::handle<Standard_Transient> & ent);

		/****************** NewEmptyModel ******************/
		%feature("compactdefaultargs") NewEmptyModel;
		%feature("autodoc", "* Returns a New Empty Model, same type as <self>, i.e. StepModel
	:rtype: opencascade::handle<Interface_InterfaceModel>") NewEmptyModel;
		opencascade::handle<Interface_InterfaceModel> NewEmptyModel ();

		/****************** PrintLabel ******************/
		%feature("compactdefaultargs") PrintLabel;
		%feature("autodoc", "* Prints label specific to STEP norm for a given entity, i.e. if a LabelIdent has been recorded, its value with '#', else the number in the model with '#' and between ()
	:param ent:
	:type ent: Standard_Transient
	:param S:
	:type S: Message_Messenger
	:rtype: None") PrintLabel;
		void PrintLabel (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Message_Messenger> & S);

		/****************** SetIdentLabel ******************/
		%feature("compactdefaultargs") SetIdentLabel;
		%feature("autodoc", "* Attaches an ident to an entity to produce a label (does nothing if <ent> is not in <self>)
	:param ent:
	:type ent: Standard_Transient
	:param ident:
	:type ident: int
	:rtype: None") SetIdentLabel;
		void SetIdentLabel (const opencascade::handle<Standard_Transient> & ent,const Standard_Integer ident);

		/****************** StepData_StepModel ******************/
		%feature("compactdefaultargs") StepData_StepModel;
		%feature("autodoc", "* Creates an empty STEP model with an empty header.
	:rtype: None") StepData_StepModel;
		 StepData_StepModel ();

		/****************** StringLabel ******************/
		%feature("compactdefaultargs") StringLabel;
		%feature("autodoc", "* Returns a string with the label attached to a given entity, same form as for PrintLabel
	:param ent:
	:type ent: Standard_Transient
	:rtype: opencascade::handle<TCollection_HAsciiString>") StringLabel;
		opencascade::handle<TCollection_HAsciiString> StringLabel (const opencascade::handle<Standard_Transient> & ent);

		/****************** VerifyCheck ******************/
		%feature("compactdefaultargs") VerifyCheck;
		%feature("autodoc", "* Specific Check, checks Header Items with HeaderProtocol
	:param ach:
	:type ach: Interface_Check
	:rtype: void") VerifyCheck;
		virtual void VerifyCheck (opencascade::handle<Interface_Check> & ach);

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
		/****************** AddStepParam ******************/
		%feature("compactdefaultargs") AddStepParam;
		%feature("autodoc", "* Fills the fields of a parameter of a record. This is a variant of AddParam, Adapted to STEP (optimized for specific values)
	:param num:
	:type num: int
	:param aval:
	:type aval: char *
	:param atype:
	:type atype: Interface_ParamType
	:param nument: default value is 0
	:type nument: int
	:rtype: None") AddStepParam;
		void AddStepParam (const Standard_Integer num,const char * aval,const Interface_ParamType atype,const Standard_Integer nument = 0);

		/****************** CType ******************/
		%feature("compactdefaultargs") CType;
		%feature("autodoc", "* Returns Record Type as a CString was C++ : return const
	:param num:
	:type num: int
	:rtype: char *") CType;
		const char * CType (const Standard_Integer num);

		/****************** CheckDerived ******************/
		%feature("compactdefaultargs") CheckDerived;
		%feature("autodoc", "* Checks if parameter <nump> of record <num> is given as Derived If this Check is successful (i.e. Param = '*'), returns True Else, fills <ach> with a Message which contains <mess> and returns False. According to <errstat>, this message is Warning if errstat is False (Default), Fail if errstat is True
	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:param mess:
	:type mess: char *
	:param ach:
	:type ach: Interface_Check
	:param errstat: default value is Standard_False
	:type errstat: bool
	:rtype: bool") CheckDerived;
		Standard_Boolean CheckDerived (const Standard_Integer num,const Standard_Integer nump,const char * mess,opencascade::handle<Interface_Check> & ach,const Standard_Boolean errstat = Standard_False);

		/****************** CheckNbParams ******************/
		%feature("compactdefaultargs") CheckNbParams;
		%feature("autodoc", "* Checks Count of Parameters of record <num> to equate <nbreq> If this Check is successful, returns True Else, fills <ach> with an Error Message then returns False <mess> is included in the Error message if given non empty
	:param num:
	:type num: int
	:param nbreq:
	:type nbreq: int
	:param ach:
	:type ach: Interface_Check
	:param mess: default value is ""
	:type mess: char *
	:rtype: bool") CheckNbParams;
		Standard_Boolean CheckNbParams (const Standard_Integer num,const Standard_Integer nbreq,opencascade::handle<Interface_Check> & ach,const char * mess = "");

		/****************** ComplexType ******************/
		%feature("compactdefaultargs") ComplexType;
		%feature("autodoc", "* Returns the List of Types which correspond to a Complex Type Entity. If not Complex, there is just one Type in it For a SubList or a Scope mark, <types> remains empty
	:param num:
	:type num: int
	:param types:
	:type types: TColStd_SequenceOfAsciiString
	:rtype: None") ComplexType;
		void ComplexType (const Standard_Integer num,TColStd_SequenceOfAsciiString & types);

		/****************** FailEnumValue ******************/
		%feature("compactdefaultargs") FailEnumValue;
		%feature("autodoc", "* Fills a check with a fail message if enumeration value does match parameter definition Just a help to centralize message definitions
	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:param mess:
	:type mess: char *
	:param ach:
	:type ach: Interface_Check
	:rtype: None") FailEnumValue;
		void FailEnumValue (const Standard_Integer num,const Standard_Integer nump,const char * mess,opencascade::handle<Interface_Check> & ach);

		/****************** FindNextHeaderRecord ******************/
		%feature("compactdefaultargs") FindNextHeaderRecord;
		%feature("autodoc", "* determine first suitable record of Header works as FindNextRecord, but treats only Header records
	:param num:
	:type num: int
	:rtype: int") FindNextHeaderRecord;
		Standard_Integer FindNextHeaderRecord (const Standard_Integer num);

		/****************** FindNextRecord ******************/
		%feature("compactdefaultargs") FindNextRecord;
		%feature("autodoc", "* determines the first suitable record following a given one that is, skips SCOPE,ENDSCOPE and SUBLIST records Note : skips Header records, which are accessed separately
	:param num:
	:type num: int
	:rtype: int") FindNextRecord;
		Standard_Integer FindNextRecord (const Standard_Integer num);

		/****************** GlobalCheck ******************/
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "* Returns the Global Check. It can record Fail messages about Undefined References (detected by SetEntityNumbers)
	:rtype: opencascade::handle<Interface_Check>") GlobalCheck;
		const opencascade::handle<Interface_Check> GlobalCheck ();

		/****************** IsComplex ******************/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "* Returns True if <num> corresponds to a Complex Type Entity (as can be defined by ANDOR Express clause)
	:param num:
	:type num: int
	:rtype: bool") IsComplex;
		Standard_Boolean IsComplex (const Standard_Integer num);

		/****************** NamedForComplex ******************/
		%feature("compactdefaultargs") NamedForComplex;
		%feature("autodoc", "* Determines the first component which brings a given name, for a Complex Type Entity <num0> is the very first record of this entity <num> is given the last NextNamedForComplex, starts at zero it is returned as the newly found number Hence, in the normal case, NextNamedForComplex starts by num0 if <num> is zero, else by NextForComplex(num) If the alphabetic order is not respected, it restarts from num0 and loops on NextForComplex until finding <name> In case of 'non-alphabetic order', <ach> is filled with a Warning for this name In case of 'not-found at all', <ach> is filled with a Fail, and <num> is returned as zero //! Returns True if alphabetic order, False else
	:param name:
	:type name: char *
	:param num0:
	:type num0: int
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:rtype: bool") NamedForComplex;
		Standard_Boolean NamedForComplex (const char * name,const Standard_Integer num0,Standard_Integer &OutValue,opencascade::handle<Interface_Check> & ach);

		/****************** NamedForComplex ******************/
		%feature("compactdefaultargs") NamedForComplex;
		%feature("autodoc", "* Determines the first component which brings a given name, or short name for a Complex Type Entity <num0> is the very first record of this entity <num> is given the last NextNamedForComplex, starts at zero it is returned as the newly found number Hence, in the normal case, NextNamedForComplex starts by num0 if <num> is zero, else by NextForComplex(num) If the alphabetic order is not respected, it restarts from num0 and loops on NextForComplex until finding <name> In case of 'non-alphabetic order', <ach> is filled with a Warning for this name In case of 'not-found at all', <ach> is filled with a Fail, and <num> is returned as zero //! Returns True if alphabetic order, False else
	:param theName:
	:type theName: char *
	:param theShortName:
	:type theShortName: char *
	:param num0:
	:type num0: int
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:rtype: bool") NamedForComplex;
		Standard_Boolean NamedForComplex (const char * theName,const char * theShortName,const Standard_Integer num0,Standard_Integer &OutValue,opencascade::handle<Interface_Check> & ach);

		/****************** NbEntities ******************/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "* Returns total count of Entities (including Header)
	:rtype: int") NbEntities;
		virtual Standard_Integer NbEntities ();

		/****************** NextForComplex ******************/
		%feature("compactdefaultargs") NextForComplex;
		%feature("autodoc", "* Returns the Next 'Componant' for a Complex Type Entity, of which <num> is already a Componant (the first one or a next one) Returns 0 for a Simple Type or for the last Componant
	:param num:
	:type num: int
	:rtype: int") NextForComplex;
		Standard_Integer NextForComplex (const Standard_Integer num);

		/****************** PrepareHeader ******************/
		%feature("compactdefaultargs") PrepareHeader;
		%feature("autodoc", "* Works as SetEntityNumbers but for Header : more simple because there are no Reference, only Sub-Lists
	:rtype: None") PrepareHeader;
		void PrepareHeader ();

		/****************** ReadAny ******************/
		%feature("compactdefaultargs") ReadAny;
		%feature("autodoc", "* Reads parameter <nump> of record <num> into a Transient Value according to the type of the parameter : Named for Integer,Boolean,Logical,Enum,Real : SelectNamed Immediate Integer,Boolean,Logical,Enum,Real : SelectInt/Real Text : HAsciiString Ident : the referenced Entity Sub-List not processed, see ReadSub This value is controlled by a Parameter Descriptor (PDescr), which controls its allowed type and value <ach> is filled if the read parameter does not match its description (the select is nevertheless created if possible) //! Warning : val is in out, hence it is possible to predefine a specific SelectMember then to fill it. If <val> is Null or if the result is not a SelectMember, val itself is returned a new ref For a Select with a Name, <val> must then be a SelectNamed
	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:param mess:
	:type mess: char *
	:param ach:
	:type ach: Interface_Check
	:param descr:
	:type descr: StepData_PDescr
	:param val:
	:type val: Standard_Transient
	:rtype: bool") ReadAny;
		Standard_Boolean ReadAny (const Standard_Integer num,const Standard_Integer nump,const char * mess,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepData_PDescr> & descr,opencascade::handle<Standard_Transient> & val);

		/****************** ReadBoolean ******************/
		%feature("compactdefaultargs") ReadBoolean;
		%feature("autodoc", "* reads parameter <nump> of record <num> as a Boolean Return value and Check managed as by ReadReal (demands a Boolean enum, i.e. text '.T.' for True or '.F.' for False)
	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:param mess:
	:type mess: char *
	:param ach:
	:type ach: Interface_Check
	:param flag:
	:type flag: bool
	:rtype: bool") ReadBoolean;
		Standard_Boolean ReadBoolean (const Standard_Integer num,const Standard_Integer nump,const char * mess,opencascade::handle<Interface_Check> & ach,Standard_Boolean &OutValue);

		/****************** ReadEnum ******************/
		%feature("compactdefaultargs") ReadEnum;
		%feature("autodoc", "* Reads parameter <nump> of record <num> as an Enumeration (text between dots) and converts it to an integer value, by an EnumTool. Returns True if OK, false if : this parameter is not enumeration, or is not recognized by the EnumTool (with fail)
	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:param mess:
	:type mess: char *
	:param ach:
	:type ach: Interface_Check
	:param enumtool:
	:type enumtool: StepData_EnumTool
	:param val:
	:type val: int
	:rtype: bool") ReadEnum;
		Standard_Boolean ReadEnum (const Standard_Integer num,const Standard_Integer nump,const char * mess,opencascade::handle<Interface_Check> & ach,const StepData_EnumTool & enumtool,Standard_Integer &OutValue);

		/****************** ReadEnumParam ******************/
		%feature("compactdefaultargs") ReadEnumParam;
		%feature("autodoc", ":param num:
	:type num: int
	:param nump:
	:type nump: int
	:param mess:
	:type mess: char *
	:param ach:
	:type ach: Interface_Check
	:param text:
	:type text: char *
	:rtype: bool") ReadEnumParam;
		Standard_Boolean ReadEnumParam (const Standard_Integer num,const Standard_Integer nump,const char * mess,opencascade::handle<Interface_Check> & ach,const char * & text);

		/****************** ReadField ******************/
		%feature("compactdefaultargs") ReadField;
		%feature("autodoc", "* reads parameter <nump> of record <num> into a Field, controlled by a Parameter Descriptor (PDescr), which controls its allowed type(s) and value <ach> is filled if the read parameter does not match its description (but the field is read anyway) If the description is not defined, no control is done Returns True when done
	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:param mess:
	:type mess: char *
	:param ach:
	:type ach: Interface_Check
	:param descr:
	:type descr: StepData_PDescr
	:param fild:
	:type fild: StepData_Field
	:rtype: bool") ReadField;
		Standard_Boolean ReadField (const Standard_Integer num,const Standard_Integer nump,const char * mess,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepData_PDescr> & descr,StepData_Field & fild);

		/****************** ReadInteger ******************/
		%feature("compactdefaultargs") ReadInteger;
		%feature("autodoc", "* reads parameter <nump> of record <num> as a single Integer. Return value & Check managed as by ReadXY (demands an Integer)
	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:param mess:
	:type mess: char *
	:param ach:
	:type ach: Interface_Check
	:param val:
	:type val: int
	:rtype: bool") ReadInteger;
		Standard_Boolean ReadInteger (const Standard_Integer num,const Standard_Integer nump,const char * mess,opencascade::handle<Interface_Check> & ach,Standard_Integer &OutValue);

		/****************** ReadList ******************/
		%feature("compactdefaultargs") ReadList;
		%feature("autodoc", "* reads a list of fields controlled by an ESDescr
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param descr:
	:type descr: StepData_ESDescr
	:param list:
	:type list: StepData_FieldList
	:rtype: bool") ReadList;
		Standard_Boolean ReadList (const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepData_ESDescr> & descr,StepData_FieldList & list);

		/****************** ReadLogical ******************/
		%feature("compactdefaultargs") ReadLogical;
		%feature("autodoc", "* reads parameter <nump> of record <num> as a Logical Return value and Check managed as by ReadBoolean (demands a Logical enum, i.e. text '.T.', '.F.', or '.U.')
	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:param mess:
	:type mess: char *
	:param ach:
	:type ach: Interface_Check
	:param flag:
	:type flag: StepData_Logical
	:rtype: bool") ReadLogical;
		Standard_Boolean ReadLogical (const Standard_Integer num,const Standard_Integer nump,const char * mess,opencascade::handle<Interface_Check> & ach,StepData_Logical & flag);

		/****************** ReadReal ******************/
		%feature("compactdefaultargs") ReadReal;
		%feature("autodoc", "* reads parameter <nump> of record <num> as a single Real value. Return value and Check managed as by ReadXY (demands a Real)
	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:param mess:
	:type mess: char *
	:param ach:
	:type ach: Interface_Check
	:param val:
	:type val: float
	:rtype: bool") ReadReal;
		Standard_Boolean ReadReal (const Standard_Integer num,const Standard_Integer nump,const char * mess,opencascade::handle<Interface_Check> & ach,Standard_Real &OutValue);

		/****************** ReadString ******************/
		%feature("compactdefaultargs") ReadString;
		%feature("autodoc", "* reads parameter <nump> of record <num> as a String (text between quotes, quotes are removed by the Read operation) Return value and Check managed as by ReadXY (demands a String)
	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:param mess:
	:type mess: char *
	:param ach:
	:type ach: Interface_Check
	:param val:
	:type val: TCollection_HAsciiString
	:rtype: bool") ReadString;
		Standard_Boolean ReadString (const Standard_Integer num,const Standard_Integer nump,const char * mess,opencascade::handle<Interface_Check> & ach,opencascade::handle<TCollection_HAsciiString> & val);

		/****************** ReadSub ******************/
		%feature("compactdefaultargs") ReadSub;
		%feature("autodoc", "* reads the content of a sub-list into a transient : SelectNamed, or HArray1 of Integer,Real,String,Transient ... recursive call if list of list ... If a sub-list has mixed types, an HArray1OfTransient is produced, it may contain SelectMember Intended to be called by ReadField The returned status is : negative if failed, 0 if empty. Else the kind to be recorded in the field
	:param numsub:
	:type numsub: int
	:param mess:
	:type mess: char *
	:param ach:
	:type ach: Interface_Check
	:param descr:
	:type descr: StepData_PDescr
	:param val:
	:type val: Standard_Transient
	:rtype: int") ReadSub;
		Standard_Integer ReadSub (const Standard_Integer numsub,const char * mess,opencascade::handle<Interface_Check> & ach,const opencascade::handle<StepData_PDescr> & descr,opencascade::handle<Standard_Transient> & val);

		/****************** ReadSubList ******************/
		%feature("compactdefaultargs") ReadSubList;
		%feature("autodoc", "* reads parameter <nump> of record <num> as a sub-list (may be typed, see ReadTypedParameter in this case) Returns True if OK. Else (not a LIST), returns false and feeds Check with appropriate check If <optional> is True and Param is not defined, returns True with <ach> not filled and <numsub> returned as 0 Works with SubListNumber with <aslast> false (no specific case for last parameter)
	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:param mess:
	:type mess: char *
	:param ach:
	:type ach: Interface_Check
	:param numsub:
	:type numsub: int
	:param optional: default value is Standard_False
	:type optional: bool
	:param lenmin: default value is 0
	:type lenmin: int
	:param lenmax: default value is 0
	:type lenmax: int
	:rtype: bool") ReadSubList;
		Standard_Boolean ReadSubList (const Standard_Integer num,const Standard_Integer nump,const char * mess,opencascade::handle<Interface_Check> & ach,Standard_Integer &OutValue,const Standard_Boolean optional = Standard_False,const Standard_Integer lenmin = 0,const Standard_Integer lenmax = 0);

		/****************** ReadTypedParam ******************/
		%feature("compactdefaultargs") ReadTypedParam;
		%feature("autodoc", "* Resolves a parameter which can be enclosed in a type def., as TYPE(val). The parameter must then be read normally according its type. Parameter to be resolved is <nump> of record <num> <mustbetyped> True demands a typed parameter <mustbetyped> False accepts a non-typed parameter as option mess and ach as usual <numr>,<numrp> are the resolved record and parameter numbers = num,nump if no type, else numrp=1 <typ> returns the recorded type, or empty string Remark : a non-typed list is considered as 'non-typed'
	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:param mustbetyped:
	:type mustbetyped: bool
	:param mess:
	:type mess: char *
	:param ach:
	:type ach: Interface_Check
	:param numr:
	:type numr: int
	:param numrp:
	:type numrp: int
	:param typ:
	:type typ: TCollection_AsciiString
	:rtype: bool") ReadTypedParam;
		Standard_Boolean ReadTypedParam (const Standard_Integer num,const Standard_Integer nump,const Standard_Boolean mustbetyped,const char * mess,opencascade::handle<Interface_Check> & ach,Standard_Integer &OutValue,Standard_Integer &OutValue,TCollection_AsciiString & typ);

		/****************** ReadXY ******************/
		%feature("compactdefaultargs") ReadXY;
		%feature("autodoc", "* reads parameter <nump> of record <num> as a sub-list of two Reals X,Y. Returns True if OK. Else, returns false and feeds Check with appropriate Fails (parameter not a sub-list, not two Reals in the sub-list) composed with 'mess' which gives the name of the parameter
	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:param mess:
	:type mess: char *
	:param ach:
	:type ach: Interface_Check
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: bool") ReadXY;
		Standard_Boolean ReadXY (const Standard_Integer num,const Standard_Integer nump,const char * mess,opencascade::handle<Interface_Check> & ach,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ReadXYZ ******************/
		%feature("compactdefaultargs") ReadXYZ;
		%feature("autodoc", "* reads parameter <nump> of record <num> as a sub-list of three Reals X,Y,Z. Return value and Check managed as by ReadXY (demands a sub-list of three Reals)
	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:param mess:
	:type mess: char *
	:param ach:
	:type ach: Interface_Check
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: bool") ReadXYZ;
		Standard_Boolean ReadXYZ (const Standard_Integer num,const Standard_Integer nump,const char * mess,opencascade::handle<Interface_Check> & ach,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** RecordIdent ******************/
		%feature("compactdefaultargs") RecordIdent;
		%feature("autodoc", "* Returns record identifier (Positive number) If returned ident is not positive : Sub-List or Scope mark
	:param num:
	:type num: int
	:rtype: int") RecordIdent;
		Standard_Integer RecordIdent (const Standard_Integer num);

		/****************** RecordType ******************/
		%feature("compactdefaultargs") RecordType;
		%feature("autodoc", "* Returns Record Type
	:param num:
	:type num: int
	:rtype: TCollection_AsciiString") RecordType;
		const TCollection_AsciiString & RecordType (const Standard_Integer num);

		/****************** SetEntityNumbers ******************/
		%feature("compactdefaultargs") SetEntityNumbers;
		%feature("autodoc", "* determines reference numbers in EntityNumber fields called by Prepare from StepReaderTool to prepare later using by a StepModel. This method is attached to StepReaderData because it needs a massive amount of data accesses to work //! If <withmap> is given False, the basic exploration algorithm is activated, otherwise a map is used as far as it is possible this option can be used only to test this algorithm
	:param withmap: default value is Standard_True
	:type withmap: bool
	:rtype: None") SetEntityNumbers;
		void SetEntityNumbers (const Standard_Boolean withmap = Standard_True);

		/****************** SetRecord ******************/
		%feature("compactdefaultargs") SetRecord;
		%feature("autodoc", "* Fills the fields of a record
	:param num:
	:type num: int
	:param ident:
	:type ident: char *
	:param type:
	:type type: char *
	:param nbpar:
	:type nbpar: int
	:rtype: None") SetRecord;
		void SetRecord (const Standard_Integer num,const char * ident,const char * type,const Standard_Integer nbpar);

		/****************** StepData_StepReaderData ******************/
		%feature("compactdefaultargs") StepData_StepReaderData;
		%feature("autodoc", "* creates StepReaderData correctly dimensionned (necessary at creation time, because it contains arrays) nbheader is nb of records for Header, nbtotal for Header+Data and nbpar gives the total count of parameters
	:param nbheader:
	:type nbheader: int
	:param nbtotal:
	:type nbtotal: int
	:param nbpar:
	:type nbpar: int
	:rtype: None") StepData_StepReaderData;
		 StepData_StepReaderData (const Standard_Integer nbheader,const Standard_Integer nbtotal,const Standard_Integer nbpar);

		/****************** SubListNumber ******************/
		%feature("compactdefaultargs") SubListNumber;
		%feature("autodoc", "* Returns SubList numero designated by a parameter (nump) in a record (num), or zero if the parameter does not exist or is not a SubList address. Zero too If aslast is True and nump is not for the last parameter
	:param num:
	:type num: int
	:param nump:
	:type nump: int
	:param aslast:
	:type aslast: bool
	:rtype: int") SubListNumber;
		Standard_Integer SubListNumber (const Standard_Integer num,const Standard_Integer nump,const Standard_Boolean aslast);

};


%make_alias(StepData_StepReaderData)

%extend StepData_StepReaderData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepData_StepReaderTool *
********************************/
class StepData_StepReaderTool : public Interface_FileReaderTool {
	public:
		/****************** AnalyseRecord ******************/
		%feature("compactdefaultargs") AnalyseRecord;
		%feature("autodoc", "* fills an entity, given record no; works by using a ReaderLib to load each entity, which must be a Transient Actually, returned value is True if no fail, False else
	:param num:
	:type num: int
	:param anent:
	:type anent: Standard_Transient
	:param acheck:
	:type acheck: Interface_Check
	:rtype: bool") AnalyseRecord;
		Standard_Boolean AnalyseRecord (const Standard_Integer num,const opencascade::handle<Standard_Transient> & anent,opencascade::handle<Interface_Check> & acheck);

		/****************** BeginRead ******************/
		%feature("compactdefaultargs") BeginRead;
		%feature("autodoc", "* fills model's header; that is, gives to it Header entities and commands their loading. Also fills StepModel's Global Check from StepReaderData's GlobalCheck
	:param amodel:
	:type amodel: Interface_InterfaceModel
	:rtype: None") BeginRead;
		void BeginRead (const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** EndRead ******************/
		%feature("compactdefaultargs") EndRead;
		%feature("autodoc", "* Ends file reading after reading all the entities Here, it binds in the model, Idents to Entities (for checks)
	:param amodel:
	:type amodel: Interface_InterfaceModel
	:rtype: void") EndRead;
		virtual void EndRead (const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** Prepare ******************/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "* Bounds empty entities to records, uses default Recognition provided by ReaderLib and ReaderModule. Also calls computation of references (SetEntityNumbers from StepReaderData) Works only on data entities (skips header) <optimize> given False allows to test some internal algorithms which are normally avoided (see also StepReaderData)
	:param optimize: default value is Standard_True
	:type optimize: bool
	:rtype: None") Prepare;
		void Prepare (const Standard_Boolean optimize = Standard_True);

		/****************** Prepare ******************/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "* Bounds empty entities to records, works with a specific FileRecognizer, stored and later used in Recognize Works only on data entities (skips header) <optimize : same as above
	:param reco:
	:type reco: StepData_FileRecognizer
	:param optimize: default value is Standard_True
	:type optimize: bool
	:rtype: None") Prepare;
		void Prepare (const opencascade::handle<StepData_FileRecognizer> & reco,const Standard_Boolean optimize = Standard_True);

		/****************** PrepareHeader ******************/
		%feature("compactdefaultargs") PrepareHeader;
		%feature("autodoc", "* bounds empty entities and sub-lists to header records works like Prepare + SetEntityNumbers, but for header (N.B.: in Header, no Ident and no reference) FileRecognizer is to specify Entities which are allowed to be defined in the Header (not every type can be)
	:param reco:
	:type reco: StepData_FileRecognizer
	:rtype: None") PrepareHeader;
		void PrepareHeader (const opencascade::handle<StepData_FileRecognizer> & reco);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "* recognizes records, by asking either ReaderLib (default) or FileRecognizer (if defined) to do so. <ach> is to call RecognizeByLib
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: Standard_Transient
	:rtype: bool") Recognize;
		Standard_Boolean Recognize (const Standard_Integer num,opencascade::handle<Interface_Check> & ach,opencascade::handle<Standard_Transient> & ent);

		/****************** StepData_StepReaderTool ******************/
		%feature("compactdefaultargs") StepData_StepReaderTool;
		%feature("autodoc", "* creates StepReaderTool to work with a StepReaderData according to a Step Protocol. Defines the ReaderLib at this time
	:param reader:
	:type reader: StepData_StepReaderData
	:param protocol:
	:type protocol: StepData_Protocol
	:rtype: None") StepData_StepReaderTool;
		 StepData_StepReaderTool (const opencascade::handle<StepData_StepReaderData> & reader,const opencascade::handle<StepData_Protocol> & protocol);

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
		/****************** AddParam ******************/
		%feature("compactdefaultargs") AddParam;
		%feature("autodoc", "* prepares adding a parameter (that is, adds ',' except for first one); normally for internal use; can be used to send a totally empty parameter (with no litteral value)
	:rtype: None") AddParam;
		void AddParam ();

		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "* Returns the check-list, which has received possible checks : for unknown entities, badly loaded ones, null or unknown references
	:rtype: Interface_CheckIterator") CheckList;
		Interface_CheckIterator CheckList ();

		/****************** CloseSub ******************/
		%feature("compactdefaultargs") CloseSub;
		%feature("autodoc", "* closes a sublist by a ')'
	:rtype: None") CloseSub;
		void CloseSub ();

		/****************** Comment ******************/
		%feature("compactdefaultargs") Comment;
		%feature("autodoc", "* sets a comment mark : if mode is True, begins Comment zone, if mode is False, ends Comment zone (if one is begun)
	:param mode:
	:type mode: bool
	:rtype: None") Comment;
		void Comment (const Standard_Boolean mode);

		/****************** EndComplex ******************/
		%feature("compactdefaultargs") EndComplex;
		%feature("autodoc", "* sends the end of a complex entity : a simple closed bracket It must be called AFTER sending all the componants and BEFORE the final call to EndEntity
	:rtype: None") EndComplex;
		void EndComplex ();

		/****************** EndEntity ******************/
		%feature("compactdefaultargs") EndEntity;
		%feature("autodoc", "* sends end of entity (closing bracket plus ';') Error if count of opened-closed brackets is not null
	:rtype: None") EndEntity;
		void EndEntity ();

		/****************** EndFile ******************/
		%feature("compactdefaultargs") EndFile;
		%feature("autodoc", "* sets end of file; error is EndSec was not set
	:rtype: None") EndFile;
		void EndFile ();

		/****************** EndSec ******************/
		%feature("compactdefaultargs") EndSec;
		%feature("autodoc", "* sets end of section; to be done before passing to next one
	:rtype: None") EndSec;
		void EndSec ();

		/****************** FloatWriter ******************/
		%feature("compactdefaultargs") FloatWriter;
		%feature("autodoc", "* Returns the embedded FloatWriter, which controls sending Reals Use this method to access FloatWriter in order to consult or change its options (MainFormat, FormatForRange,ZeroSuppress), because it is returned as the address of its field
	:rtype: Interface_FloatWriter") FloatWriter;
		Interface_FloatWriter & FloatWriter ();

		/****************** Indent ******************/
		%feature("compactdefaultargs") Indent;
		%feature("autodoc", "* asks that further indentations will begin at position of entity first opening bracket; else they begin at zero (def) for each sublist level, two more blancks are added at beginning (except for text continuation, which must begin at true zero)
	:param onent:
	:type onent: bool
	:rtype: None") Indent;
		void Indent (const Standard_Boolean onent);

		/****************** IsInScope ******************/
		%feature("compactdefaultargs") IsInScope;
		%feature("autodoc", "* Returns True if an Entity identified by its Number is in a Scope
	:param num:
	:type num: int
	:rtype: bool") IsInScope;
		Standard_Boolean IsInScope (const Standard_Integer num);

		/****************** JoinLast ******************/
		%feature("compactdefaultargs") JoinLast;
		%feature("autodoc", "* joins current line to last one, only if new length is 72 max if newline is True, a new current line begins; else, current line is set to the last line (once joined) itself an can be completed
	:param newline:
	:type newline: bool
	:rtype: None") JoinLast;
		void JoinLast (const Standard_Boolean newline);


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
		%feature("autodoc", "* Returns a Line given its rank in the File
	:param num:
	:type num: int
	:rtype: opencascade::handle<TCollection_HAsciiString>") Line;
		opencascade::handle<TCollection_HAsciiString> Line (const Standard_Integer num);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "* Returns count of Lines
	:rtype: int") NbLines;
		Standard_Integer NbLines ();

		/****************** NewLine ******************/
		%feature("compactdefaultargs") NewLine;
		%feature("autodoc", "* flushes current line; if empty, flushes it (defines a new empty line) if evenempty is True; else, skips it
	:param evenempty:
	:type evenempty: bool
	:rtype: None") NewLine;
		void NewLine (const Standard_Boolean evenempty);

		/****************** OpenSub ******************/
		%feature("compactdefaultargs") OpenSub;
		%feature("autodoc", "* open a sublist by a '('
	:rtype: None") OpenSub;
		void OpenSub ();

		/****************** OpenTypedSub ******************/
		%feature("compactdefaultargs") OpenTypedSub;
		%feature("autodoc", "* open a sublist with its type then a '('
	:param subtype:
	:type subtype: char *
	:rtype: None") OpenTypedSub;
		void OpenTypedSub (const char * subtype);


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		/****************** Send ******************/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "* sends an integer parameter
	:param val:
	:type val: int
	:rtype: None") Send;
		void Send (const Standard_Integer val);

		/****************** Send ******************/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "* sends a real parameter (wroks with FloatWriter)
	:param val:
	:type val: float
	:rtype: None") Send;
		void Send (const Standard_Real val);

		/****************** Send ******************/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "* sends a text given as string (it will be set between '...')
	:param val:
	:type val: TCollection_AsciiString
	:rtype: None") Send;
		void Send (const TCollection_AsciiString & val);

		/****************** Send ******************/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "* sends a reference to an entity (its identifier with '#') REMARK 1 : a Null <val> is interpreted as 'Undefined' REMARK 2 : for an HAsciiString which is not recorded in the Model, it is send as its String Content, between quotes
	:param val:
	:type val: Standard_Transient
	:rtype: None") Send;
		void Send (const opencascade::handle<Standard_Transient> & val);

		/****************** SendArrReal ******************/
		%feature("compactdefaultargs") SendArrReal;
		%feature("autodoc", "* sends an array of real
	:param anArr:
	:type anArr: TColStd_HArray1OfReal
	:rtype: None") SendArrReal;
		void SendArrReal (const opencascade::handle<TColStd_HArray1OfReal> & anArr);

		/****************** SendBoolean ******************/
		%feature("compactdefaultargs") SendBoolean;
		%feature("autodoc", "* sends a Boolean as .T. for True or .F. for False (it is an useful case of Enum, which is built-in)
	:param val:
	:type val: bool
	:rtype: None") SendBoolean;
		void SendBoolean (const Standard_Boolean val);

		/****************** SendComment ******************/
		%feature("compactdefaultargs") SendComment;
		%feature("autodoc", "* sends a comment. Error if we are not inside a comment zone
	:param text:
	:type text: TCollection_HAsciiString
	:rtype: None") SendComment;
		void SendComment (const opencascade::handle<TCollection_HAsciiString> & text);

		/****************** SendComment ******************/
		%feature("compactdefaultargs") SendComment;
		%feature("autodoc", "* same as above but accepts a CString (ex.: '...' directly)
	:param text:
	:type text: char *
	:rtype: None") SendComment;
		void SendComment (const char * text);

		/****************** SendData ******************/
		%feature("compactdefaultargs") SendData;
		%feature("autodoc", "* Begins data section; error if EndSec was not set
	:rtype: None") SendData;
		void SendData ();

		/****************** SendDerived ******************/
		%feature("compactdefaultargs") SendDerived;
		%feature("autodoc", "* sends a 'Derived' parameter (by '*'). A Derived Parameter has been inherited from a Super-Type then redefined as being computed by a function. Hence its value in file is senseless.
	:rtype: None") SendDerived;
		void SendDerived ();

		/****************** SendEndscope ******************/
		%feature("compactdefaultargs") SendEndscope;
		%feature("autodoc", "* sets an end of Scope (on a separate line)
	:rtype: None") SendEndscope;
		void SendEndscope ();

		/****************** SendEntity ******************/
		%feature("compactdefaultargs") SendEntity;
		%feature("autodoc", "* Send an Entity of the Data Section. If it corresponds to a Scope, also Sends the Scope informations and contained Items
	:param nument:
	:type nument: int
	:param lib:
	:type lib: StepData_WriterLib
	:rtype: None") SendEntity;
		void SendEntity (const Standard_Integer nument,const StepData_WriterLib & lib);

		/****************** SendEnum ******************/
		%feature("compactdefaultargs") SendEnum;
		%feature("autodoc", "* sends an enum given by String (litteral expression) adds '.' around it if not done Remark : val can be computed by class EnumTool from StepData: StepWriter.SendEnum (myenum.Text(enumval));
	:param val:
	:type val: TCollection_AsciiString
	:rtype: None") SendEnum;
		void SendEnum (const TCollection_AsciiString & val);

		/****************** SendEnum ******************/
		%feature("compactdefaultargs") SendEnum;
		%feature("autodoc", "* sends an enum given by String (litteral expression) adds '.' around it if not done
	:param val:
	:type val: char *
	:rtype: None") SendEnum;
		void SendEnum (const char * val);

		/****************** SendField ******************/
		%feature("compactdefaultargs") SendField;
		%feature("autodoc", "* Sends the content of a field, controlled by its descriptor If the descriptor is not defined, follows the description detained by the field itself
	:param fild:
	:type fild: StepData_Field
	:param descr:
	:type descr: StepData_PDescr
	:rtype: None") SendField;
		void SendField (const StepData_Field & fild,const opencascade::handle<StepData_PDescr> & descr);

		/****************** SendHeader ******************/
		%feature("compactdefaultargs") SendHeader;
		%feature("autodoc", "* Begins model header
	:rtype: None") SendHeader;
		void SendHeader ();

		/****************** SendIdent ******************/
		%feature("compactdefaultargs") SendIdent;
		%feature("autodoc", "* begins an entity with an ident plus '=' (at beginning of line) entity ident is its Number given by the containing Model Warning : <ident> must be, either Number or Label, according LabelMode
	:param ident:
	:type ident: int
	:rtype: None") SendIdent;
		void SendIdent (const Standard_Integer ident);

		/****************** SendList ******************/
		%feature("compactdefaultargs") SendList;
		%feature("autodoc", "* Send the content of an entity as being a FieldList controlled by its descriptor. This includes start and end brackets but not the entity type
	:param list:
	:type list: StepData_FieldList
	:param descr:
	:type descr: StepData_ESDescr
	:rtype: None") SendList;
		void SendList (const StepData_FieldList & list,const opencascade::handle<StepData_ESDescr> & descr);

		/****************** SendLogical ******************/
		%feature("compactdefaultargs") SendLogical;
		%feature("autodoc", "* sends a Logical as .T. or .F. or .U. according its Value (it is a standard case of Enum for Step, and is built-in)
	:param val:
	:type val: StepData_Logical
	:rtype: None") SendLogical;
		void SendLogical (const StepData_Logical val);

		/****************** SendModel ******************/
		%feature("compactdefaultargs") SendModel;
		%feature("autodoc", "* Sends the complete Model, included HEADER and DATA Sections Works with a WriterLib defined through a Protocol If <headeronly> is given True, only the HEADER Section is sent (used to Dump the Header of a StepModel)
	:param protocol:
	:type protocol: StepData_Protocol
	:param headeronly: default value is Standard_False
	:type headeronly: bool
	:rtype: None") SendModel;
		void SendModel (const opencascade::handle<StepData_Protocol> & protocol,const Standard_Boolean headeronly = Standard_False);

		/****************** SendScope ******************/
		%feature("compactdefaultargs") SendScope;
		%feature("autodoc", "* sets a begin of Scope (ends this line)
	:rtype: None") SendScope;
		void SendScope ();

		/****************** SendSelect ******************/
		%feature("compactdefaultargs") SendSelect;
		%feature("autodoc", "* Sends a SelectMember, which cab be named or not
	:param sm:
	:type sm: StepData_SelectMember
	:param descr:
	:type descr: StepData_PDescr
	:rtype: None") SendSelect;
		void SendSelect (const opencascade::handle<StepData_SelectMember> & sm,const opencascade::handle<StepData_PDescr> & descr);

		/****************** SendString ******************/
		%feature("compactdefaultargs") SendString;
		%feature("autodoc", "* sends a string exactly as it is given
	:param val:
	:type val: TCollection_AsciiString
	:rtype: None") SendString;
		void SendString (const TCollection_AsciiString & val);

		/****************** SendString ******************/
		%feature("compactdefaultargs") SendString;
		%feature("autodoc", "* sends a string exactly as it is given
	:param val:
	:type val: char *
	:rtype: None") SendString;
		void SendString (const char * val);

		/****************** SendUndef ******************/
		%feature("compactdefaultargs") SendUndef;
		%feature("autodoc", "* sends an undefined (optionnal absent) parameter (by '$')
	:rtype: None") SendUndef;
		void SendUndef ();

		/****************** SetScope ******************/
		%feature("compactdefaultargs") SetScope;
		%feature("autodoc", "* Declares the Entity Number <numscope> to correspond to a Scope which contains the Entity Number <numin>. Several calls to the same <numscope> add Entities in this Scope, in this order. Error if <numin> is already declared in the Scope Warning : the declaration of the Scopes is assumed to be consistent, i.e. <numin> is not referenced from outside this Scope (not checked here)
	:param numscope:
	:type numscope: int
	:param numin:
	:type numin: int
	:rtype: None") SetScope;
		void SetScope (const Standard_Integer numscope,const Standard_Integer numin);

		/****************** StartComplex ******************/
		%feature("compactdefaultargs") StartComplex;
		%feature("autodoc", "* sends the start of a complex entity, which is a simple open bracket (without increasing braket level) It must be called JUST AFTER SendEntity and BEFORE sending componants, each one begins by StartEntity
	:rtype: None") StartComplex;
		void StartComplex ();

		/****************** StartEntity ******************/
		%feature("compactdefaultargs") StartEntity;
		%feature("autodoc", "* sets entity's StepType, opens brakets, starts param no to 0 params are separated by comma Remark : for a Multiple Type Entity (see Express ANDOR clause) StartComplex must be called before sending componants, then each 'Componant' must be send separately (one call to StartEntity for each one) : the Type which preceeds is then automaticaly closed. Once all the componants have been sent, EndComplex must be called, then and only then EndEntity
	:param atype:
	:type atype: TCollection_AsciiString
	:rtype: None") StartEntity;
		void StartEntity (const TCollection_AsciiString & atype);

		/****************** StepData_StepWriter ******************/
		%feature("compactdefaultargs") StepData_StepWriter;
		%feature("autodoc", "* Creates an empty StepWriter from a StepModel. The StepModel provides the Number of Entities, as identifiers for File
	:param amodel:
	:type amodel: StepData_StepModel
	:rtype: None") StepData_StepWriter;
		 StepData_StepWriter (const opencascade::handle<StepData_StepModel> & amodel);


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
		/****************** AddProtocol ******************/
		%feature("compactdefaultargs") AddProtocol;
		%feature("autodoc", "* Adds a couple (Module-Protocol) to the Library, given the class of a Protocol. Takes Resources into account. (if <aprotocol> is not of type TheProtocol, it is not added)
	:param aprotocol:
	:type aprotocol: Standard_Transient
	:rtype: None") AddProtocol;
		void AddProtocol (const opencascade::handle<Standard_Transient> & aprotocol);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the list of Modules of a library (can be used to redefine the order of Modules before action : Clear then refill the Library by calls to AddProtocol)
	:rtype: None") Clear;
		void Clear ();

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "* Returns the current Module in the Iteration
	:rtype: opencascade::handle<StepData_ReadWriteModule>") Module;
		const opencascade::handle<StepData_ReadWriteModule> & Module ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True if there are more Modules to iterate on
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Iterates by getting the next Module in the list If there is none, the exception will be raised by Value
	:rtype: None") Next;
		void Next ();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "* Returns the current Protocol in the Iteration
	:rtype: opencascade::handle<StepData_Protocol>") Protocol;
		const opencascade::handle<StepData_Protocol> & Protocol ();

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "* Selects a Module from the Library, given an Object. Returns True if Select has succeeded, False else. Also Returns (as arguments) the selected Module and the Case Number determined by the associated Protocol. If Select has failed, <module> is Null Handle and CN is zero. (Select can work on any criterium, such as Object DynamicType)
	:param obj:
	:type obj: Standard_Transient
	:param module:
	:type module: StepData_ReadWriteModule
	:param CN:
	:type CN: int
	:rtype: bool") Select;
		Standard_Boolean Select (const opencascade::handle<Standard_Transient> & obj,opencascade::handle<StepData_ReadWriteModule> & module,Standard_Integer &OutValue);

		/****************** SetComplete ******************/
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "* Sets a library to be defined with the complete Global list (all the couples Protocol/Modules recorded in it)
	:rtype: None") SetComplete;
		void SetComplete ();

		/****************** SetGlobal ******************/
		%feature("compactdefaultargs") SetGlobal;
		%feature("autodoc", "* Adds a couple (Module-Protocol) into the global definition set for this class of Library.
	:param amodule:
	:type amodule: StepData_ReadWriteModule
	:param aprotocol:
	:type aprotocol: StepData_Protocol
	:rtype: void") SetGlobal;
		static void SetGlobal (const opencascade::handle<StepData_ReadWriteModule> & amodule,const opencascade::handle<StepData_Protocol> & aprotocol);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "* Starts Iteration on the Modules (sets it on the first one)
	:rtype: None") Start;
		void Start ();

		/****************** StepData_WriterLib ******************/
		%feature("compactdefaultargs") StepData_WriterLib;
		%feature("autodoc", "* Creates a Library which complies with a Protocol, that is : Same class (criterium IsInstance) This creation gets the Modules from the global set, those which are bound to the given Protocol and its Resources
	:param aprotocol:
	:type aprotocol: StepData_Protocol
	:rtype: None") StepData_WriterLib;
		 StepData_WriterLib (const opencascade::handle<StepData_Protocol> & aprotocol);

		/****************** StepData_WriterLib ******************/
		%feature("compactdefaultargs") StepData_WriterLib;
		%feature("autodoc", "* Creates an empty Library : it will later by filled by method AddProtocol
	:rtype: None") StepData_WriterLib;
		 StepData_WriterLib ();

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
		/****************** CheckCase ******************/
		%feature("compactdefaultargs") CheckCase;
		%feature("autodoc", "* Specific Checking of an Entity <ent>
	:param casenum:
	:type casenum: int
	:param ent:
	:type ent: Standard_Transient
	:param shares:
	:type shares: Interface_ShareTool
	:param ach:
	:type ach: Interface_Check
	:rtype: None") CheckCase;
		void CheckCase (const Standard_Integer casenum,const opencascade::handle<Standard_Transient> & ent,const Interface_ShareTool & shares,opencascade::handle<Interface_Check> & ach);

		/****************** CopyCase ******************/
		%feature("compactdefaultargs") CopyCase;
		%feature("autodoc", "* Specific Copy ('Deep') from <entfrom> to <entto> (same type) by using a CopyTool which provides its working Map. Use method Transferred from TransferControl to work
	:param casenum:
	:type casenum: int
	:param entfrom:
	:type entfrom: Standard_Transient
	:param entto:
	:type entto: Standard_Transient
	:param TC:
	:type TC: Interface_CopyTool
	:rtype: None") CopyCase;
		void CopyCase (const Standard_Integer casenum,const opencascade::handle<Standard_Transient> & entfrom,const opencascade::handle<Standard_Transient> & entto,Interface_CopyTool & TC);

		/****************** FillSharedCase ******************/
		%feature("compactdefaultargs") FillSharedCase;
		%feature("autodoc", "* Specific filling of the list of Entities shared by an Entity <ent>, which is an UnknownEntity from StepData.
	:param casenum:
	:type casenum: int
	:param ent:
	:type ent: Standard_Transient
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") FillSharedCase;
		void FillSharedCase (const Standard_Integer casenum,const opencascade::handle<Standard_Transient> & ent,Interface_EntityIterator & iter);

		/****************** NewVoid ******************/
		%feature("compactdefaultargs") NewVoid;
		%feature("autodoc", "* Specific creation of a new void entity
	:param CN:
	:type CN: int
	:param entto:
	:type entto: Standard_Transient
	:rtype: bool") NewVoid;
		Standard_Boolean NewVoid (const Standard_Integer CN,opencascade::handle<Standard_Transient> & entto);

		/****************** StepData_DefaultGeneral ******************/
		%feature("compactdefaultargs") StepData_DefaultGeneral;
		%feature("autodoc", "* Creates a Default General Module
	:rtype: None") StepData_DefaultGeneral;
		 StepData_DefaultGeneral ();

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a member Warning : members are added in alphabetic order
	:param member:
	:type member: StepData_ESDescr
	:rtype: None") Add;
		void Add (const opencascade::handle<StepData_ESDescr> & member);

		/****************** IsComplex ******************/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "* Returns True
	:rtype: bool") IsComplex;
		Standard_Boolean IsComplex ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if a ESDescr matches a step type : exact or super type
	:param steptype:
	:type steptype: char *
	:rtype: bool") Matches;
		Standard_Boolean Matches (const char * steptype);

		/****************** Member ******************/
		%feature("compactdefaultargs") Member;
		%feature("autodoc", "* Returns a Member from its rank
	:param num:
	:type num: int
	:rtype: opencascade::handle<StepData_ESDescr>") Member;
		opencascade::handle<StepData_ESDescr> Member (const Standard_Integer num);

		/****************** NbMembers ******************/
		%feature("compactdefaultargs") NbMembers;
		%feature("autodoc", "* Returns the count of members
	:rtype: int") NbMembers;
		Standard_Integer NbMembers ();

		/****************** NewEntity ******************/
		%feature("compactdefaultargs") NewEntity;
		%feature("autodoc", "* Creates a described entity (i.e. a complex one, made of one simple entity per member)
	:rtype: opencascade::handle<StepData_Described>") NewEntity;
		opencascade::handle<StepData_Described> NewEntity ();

		/****************** StepData_ECDescr ******************/
		%feature("compactdefaultargs") StepData_ECDescr;
		%feature("autodoc", "* Creates an ECDescr, empty
	:rtype: None") StepData_ECDescr;
		 StepData_ECDescr ();

		/****************** TypeList ******************/
		%feature("compactdefaultargs") TypeList;
		%feature("autodoc", "* Returns the ordered list of types
	:rtype: opencascade::handle<TColStd_HSequenceOfAsciiString>") TypeList;
		opencascade::handle<TColStd_HSequenceOfAsciiString> TypeList ();

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
		/****************** Base ******************/
		%feature("compactdefaultargs") Base;
		%feature("autodoc", "* Returns the basic ESDescr, null if <self> is not derived
	:rtype: opencascade::handle<StepData_ESDescr>") Base;
		opencascade::handle<StepData_ESDescr> Base ();

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "* Returns the PDescr for the field <num> (or Null)
	:param num:
	:type num: int
	:rtype: opencascade::handle<StepData_PDescr>") Field;
		opencascade::handle<StepData_PDescr> Field (const Standard_Integer num);

		/****************** IsComplex ******************/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "* Returns False
	:rtype: bool") IsComplex;
		Standard_Boolean IsComplex ();

		/****************** IsSub ******************/
		%feature("compactdefaultargs") IsSub;
		%feature("autodoc", "* Tells if <self> is sub-type of (or equal to) another one
	:param other:
	:type other: StepData_ESDescr
	:rtype: bool") IsSub;
		Standard_Boolean IsSub (const opencascade::handle<StepData_ESDescr> & other);

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if a ESDescr matches a step type : exact or super type
	:param steptype:
	:type steptype: char *
	:rtype: bool") Matches;
		Standard_Boolean Matches (const char * steptype);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns the name of a field from its rank. empty if outofrange
	:param num:
	:type num: int
	:rtype: char *") Name;
		const char * Name (const Standard_Integer num);

		/****************** NamedField ******************/
		%feature("compactdefaultargs") NamedField;
		%feature("autodoc", "* Returns the PDescr for the field named <name> (or Null)
	:param name:
	:type name: char *
	:rtype: opencascade::handle<StepData_PDescr>") NamedField;
		opencascade::handle<StepData_PDescr> NamedField (const char * name);

		/****************** NbFields ******************/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "* Returns the count of fields
	:rtype: int") NbFields;
		Standard_Integer NbFields ();

		/****************** NewEntity ******************/
		%feature("compactdefaultargs") NewEntity;
		%feature("autodoc", "* Creates a described entity (i.e. a simple one)
	:rtype: opencascade::handle<StepData_Described>") NewEntity;
		opencascade::handle<StepData_Described> NewEntity ();

		/****************** Rank ******************/
		%feature("compactdefaultargs") Rank;
		%feature("autodoc", "* Returns the rank of a field from its name. 0 if unknown
	:param name:
	:type name: char *
	:rtype: int") Rank;
		Standard_Integer Rank (const char * name);

		/****************** SetBase ******************/
		%feature("compactdefaultargs") SetBase;
		%feature("autodoc", "* Sets an ESDescr as based on another one Hence, if there are inherited fields, the derived ESDescr cumulates all them, while the base just records its own ones
	:param base:
	:type base: StepData_ESDescr
	:rtype: None") SetBase;
		void SetBase (const opencascade::handle<StepData_ESDescr> & base);

		/****************** SetField ******************/
		%feature("compactdefaultargs") SetField;
		%feature("autodoc", "* Sets a PDescr to describe a field A Field is designated by its rank and name
	:param num:
	:type num: int
	:param name:
	:type name: char *
	:param descr:
	:type descr: StepData_PDescr
	:rtype: None") SetField;
		void SetField (const Standard_Integer num,const char * name,const opencascade::handle<StepData_PDescr> & descr);

		/****************** SetNbFields ******************/
		%feature("compactdefaultargs") SetNbFields;
		%feature("autodoc", "* Sets a new count of fields Each one is described by a PDescr
	:param nb:
	:type nb: int
	:rtype: None") SetNbFields;
		void SetNbFields (const Standard_Integer nb);

		/****************** SetSuper ******************/
		%feature("compactdefaultargs") SetSuper;
		%feature("autodoc", "* Sets an ESDescr as 'super-type'. Applies an a base (non derived) ESDescr
	:param super:
	:type super: StepData_ESDescr
	:rtype: None") SetSuper;
		void SetSuper (const opencascade::handle<StepData_ESDescr> & super);

		/****************** StepData_ESDescr ******************/
		%feature("compactdefaultargs") StepData_ESDescr;
		%feature("autodoc", "* Creates an ESDescr with a type name
	:param name:
	:type name: char *
	:rtype: None") StepData_ESDescr;
		 StepData_ESDescr (const char * name);

		/****************** StepType ******************/
		%feature("compactdefaultargs") StepType;
		%feature("autodoc", "* Returns the type name as an AsciiString
	:rtype: TCollection_AsciiString") StepType;
		const TCollection_AsciiString & StepType ();

		/****************** Super ******************/
		%feature("compactdefaultargs") Super;
		%feature("autodoc", "* Returns the super-type ESDescr, null if <self> is root
	:rtype: opencascade::handle<StepData_ESDescr>") Super;
		opencascade::handle<StepData_ESDescr> Super ();

		/****************** TypeName ******************/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "* Returns the type name given at creation time
	:rtype: char *") TypeName;
		const char * TypeName ();

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
		/****************** CField ******************/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "* Returns the field n0 <num> between 1 and NbFields, in order to modify its content
	:param num:
	:type num: int
	:rtype: StepData_Field") CField;
		virtual StepData_Field & CField (const Standard_Integer num);

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "* Returns the field n0 <num> between 1 and NbFields (read only)
	:param num:
	:type num: int
	:rtype: StepData_Field") Field;
		virtual const StepData_Field & Field (const Standard_Integer num);

		/****************** NbFields ******************/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "* Returns the count of fields. Here, returns 1
	:rtype: int") NbFields;
		virtual Standard_Integer NbFields ();

		/****************** StepData_FieldList1 ******************/
		%feature("compactdefaultargs") StepData_FieldList1;
		%feature("autodoc", "* Creates a FieldList of 1 Field
	:rtype: None") StepData_FieldList1;
		 StepData_FieldList1 ();

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
		/****************** CField ******************/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "* Returns the field n0 <num> between 1 and NbFields, in order to modify its content
	:param num:
	:type num: int
	:rtype: StepData_Field") CField;
		virtual StepData_Field & CField (const Standard_Integer num);

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "* Returns the field n0 <num> between 1 and NbFields (read only)
	:param num:
	:type num: int
	:rtype: StepData_Field") Field;
		virtual const StepData_Field & Field (const Standard_Integer num);

		/****************** NbFields ******************/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "* Returns the count of fields. Here, returns starting <nb>
	:rtype: int") NbFields;
		virtual Standard_Integer NbFields ();

		/****************** SetNb ******************/
		%feature("compactdefaultargs") SetNb;
		%feature("autodoc", "* Sets a new count of Fields. Former contents are lost
	:param nb:
	:type nb: int
	:rtype: None") SetNb;
		void SetNb (const Standard_Integer nb);

		/****************** StepData_FieldListD ******************/
		%feature("compactdefaultargs") StepData_FieldListD;
		%feature("autodoc", "* Creates a FieldListD of <nb> Fields
	:param nb:
	:type nb: int
	:rtype: None") StepData_FieldListD;
		 StepData_FieldListD (const Standard_Integer nb);

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
		/****************** CField ******************/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "* Returns the field n0 <num> between 1 and NbFields, in order to modify its content
	:param num:
	:type num: int
	:rtype: StepData_Field") CField;
		virtual StepData_Field & CField (const Standard_Integer num);

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "* Returns the field n0 <num> between 1 and NbFields (read only)
	:param num:
	:type num: int
	:rtype: StepData_Field") Field;
		virtual const StepData_Field & Field (const Standard_Integer num);

		/****************** NbFields ******************/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "* Returns the count of fields. Here, returns starting <nb>
	:rtype: int") NbFields;
		virtual Standard_Integer NbFields ();

		/****************** StepData_FieldListN ******************/
		%feature("compactdefaultargs") StepData_FieldListN;
		%feature("autodoc", "* Creates a FieldListN of <nb> Fields
	:param nb:
	:type nb: int
	:rtype: None") StepData_FieldListN;
		 StepData_FieldListN (const Standard_Integer nb);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a Protocol to the definition list of the FileProtocol But ensures that each class of Protocol is present only once in this list
	:param protocol:
	:type protocol: StepData_Protocol
	:rtype: None") Add;
		void Add (const opencascade::handle<StepData_Protocol> & protocol);

		/****************** GlobalCheck ******************/
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "* Calls GlobalCheck for each of its recorded ressources
	:param G:
	:type G: Interface_Graph
	:param ach:
	:type ach: Interface_Check
	:rtype: bool") GlobalCheck;
		virtual Standard_Boolean GlobalCheck (const Interface_Graph & G,opencascade::handle<Interface_Check> & ach);

		/****************** NbResources ******************/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "* Gives the count of Protocols used as Resource (can be zero) i.e. the count of Protocol recorded by calling the method Add
	:rtype: int") NbResources;
		virtual Standard_Integer NbResources ();

		/****************** Resource ******************/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "* Returns a Resource, given a rank. Here, rank of calling Add
	:param num:
	:type num: int
	:rtype: opencascade::handle<Interface_Protocol>") Resource;
		virtual opencascade::handle<Interface_Protocol> Resource (const Standard_Integer num);

		/****************** SchemaName ******************/
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "* Returns the Schema Name attached to each class of Protocol To be redefined by each sub-class Here, SchemaName returns '' (empty String) was C++ : return const
	:rtype: char *") SchemaName;
		virtual const char * SchemaName ();

		/****************** StepData_FileProtocol ******************/
		%feature("compactdefaultargs") StepData_FileProtocol;
		%feature("autodoc", "* Creates an empty FileProtocol
	:rtype: None") StepData_FileProtocol;
		 StepData_FileProtocol ();

		/****************** TypeNumber ******************/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "* Returns a Case Number, specific of each recognized Type Here, NO Type at all is recognized properly : all Types are recognized by the resources
	:param atype:
	:type atype: Standard_Type
	:rtype: int") TypeNumber;
		virtual Standard_Integer TypeNumber (const opencascade::handle<Standard_Type> & atype);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a member to <self>
	:param member:
	:type member: StepData_Simple
	:rtype: None") Add;
		void Add (const opencascade::handle<StepData_Simple> & member);

		/****************** As ******************/
		%feature("compactdefaultargs") As;
		%feature("autodoc", "* Returns a Simple Entity which matches with a Type in <self> : For a Simple Entity : me if it matches, else a null handle For a Complex Entity : the member which matches, else null
	:param steptype:
	:type steptype: char *
	:rtype: opencascade::handle<StepData_Simple>") As;
		opencascade::handle<StepData_Simple> As (const char * steptype);

		/****************** CField ******************/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "* Returns a Field from its name; read or write
	:param name:
	:type name: char *
	:rtype: StepData_Field") CField;
		StepData_Field & CField (const char * name);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "* Fills a Check by using its Description
	:param ach:
	:type ach: Interface_Check
	:rtype: None") Check;
		void Check (opencascade::handle<Interface_Check> & ach);

		/****************** ECDescr ******************/
		%feature("compactdefaultargs") ECDescr;
		%feature("autodoc", "* Returns the Description as for a Plex
	:rtype: opencascade::handle<StepData_ECDescr>") ECDescr;
		opencascade::handle<StepData_ECDescr> ECDescr ();

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "* Returns a Field from its name; read-only
	:param name:
	:type name: char *
	:rtype: StepData_Field") Field;
		const StepData_Field & Field (const char * name);

		/****************** HasField ******************/
		%feature("compactdefaultargs") HasField;
		%feature("autodoc", "* Tells if a Field brings a given name
	:param name:
	:type name: char *
	:rtype: bool") HasField;
		Standard_Boolean HasField (const char * name);

		/****************** IsComplex ******************/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "* Returns False
	:rtype: bool") IsComplex;
		Standard_Boolean IsComplex ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if a step type is matched by <self> For a Simple Entity : own type or super type For a Complex Entity : one of the members
	:param steptype:
	:type steptype: char *
	:rtype: bool") Matches;
		Standard_Boolean Matches (const char * steptype);

		/****************** Member ******************/
		%feature("compactdefaultargs") Member;
		%feature("autodoc", "* Returns a simple member from its rank
	:param num:
	:type num: int
	:rtype: opencascade::handle<StepData_Simple>") Member;
		opencascade::handle<StepData_Simple> Member (const Standard_Integer num);

		/****************** NbMembers ******************/
		%feature("compactdefaultargs") NbMembers;
		%feature("autodoc", "* Returns the count of simple members
	:rtype: int") NbMembers;
		Standard_Integer NbMembers ();

		/****************** Shared ******************/
		%feature("compactdefaultargs") Shared;
		%feature("autodoc", "* Fills an EntityIterator with entities shared by <self>
	:param list:
	:type list: Interface_EntityIterator
	:rtype: None") Shared;
		void Shared (Interface_EntityIterator & list);

		/****************** StepData_Plex ******************/
		%feature("compactdefaultargs") StepData_Plex;
		%feature("autodoc", "* Creates a Plex (empty). The complete creation is made by the ECDescr itself, by calling Add
	:param descr:
	:type descr: StepData_ECDescr
	:rtype: None") StepData_Plex;
		 StepData_Plex (const opencascade::handle<StepData_ECDescr> & descr);

		/****************** TypeList ******************/
		%feature("compactdefaultargs") TypeList;
		%feature("autodoc", "* Returns the actual list of members types
	:rtype: opencascade::handle<TColStd_HSequenceOfAsciiString>") TypeList;
		opencascade::handle<TColStd_HSequenceOfAsciiString> TypeList ();

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
		/****************** Int ******************/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", ":rtype: int") Int;
		virtual Standard_Integer Int ();

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", ":rtype: int") Kind;
		virtual Standard_Integer Kind ();

		/****************** SetInt ******************/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", ":param val:
	:type val: int
	:rtype: void") SetInt;
		virtual void SetInt (const Standard_Integer val);

		/****************** SetKind ******************/
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", ":param kind:
	:type kind: int
	:rtype: void") SetKind;
		virtual void SetKind (const Standard_Integer kind);

		/****************** StepData_SelectInt ******************/
		%feature("compactdefaultargs") StepData_SelectInt;
		%feature("autodoc", ":rtype: None") StepData_SelectInt;
		 StepData_SelectInt ();

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
		/****************** CField ******************/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", ":rtype: StepData_Field") CField;
		StepData_Field & CField ();

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", ":rtype: StepData_Field") Field;
		const StepData_Field & Field ();

		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", ":rtype: bool") HasName;
		virtual Standard_Boolean HasName ();

		/****************** Int ******************/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "* This internal method gives access to a value implemented by an Integer (to read it)
	:rtype: int") Int;
		virtual Standard_Integer Int ();

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", ":rtype: int") Kind;
		virtual Standard_Integer Kind ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", ":rtype: char *") Name;
		virtual const char * Name ();

		/****************** Real ******************/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", ":rtype: float") Real;
		virtual Standard_Real Real ();

		/****************** SetInt ******************/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "* This internal method gives access to a value implemented by an Integer (to set it)
	:param val:
	:type val: int
	:rtype: void") SetInt;
		virtual void SetInt (const Standard_Integer val);

		/****************** SetKind ******************/
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", ":param kind:
	:type kind: int
	:rtype: void") SetKind;
		virtual void SetKind (const Standard_Integer kind);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", ":param name:
	:type name: char *
	:rtype: bool") SetName;
		virtual Standard_Boolean SetName (const char * name);

		/****************** SetReal ******************/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", ":param val:
	:type val: float
	:rtype: void") SetReal;
		virtual void SetReal (const Standard_Real val);

		/****************** SetString ******************/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", ":param val:
	:type val: char *
	:rtype: void") SetString;
		virtual void SetString (const char * val);

		/****************** StepData_SelectNamed ******************/
		%feature("compactdefaultargs") StepData_SelectNamed;
		%feature("autodoc", ":rtype: None") StepData_SelectNamed;
		 StepData_SelectNamed ();

		/****************** String ******************/
		%feature("compactdefaultargs") String;
		%feature("autodoc", ":rtype: char *") String;
		virtual const char * String ();

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
		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", ":rtype: int") Kind;
		virtual Standard_Integer Kind ();

		/****************** Real ******************/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", ":rtype: float") Real;
		virtual Standard_Real Real ();

		/****************** SetReal ******************/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", ":param val:
	:type val: float
	:rtype: void") SetReal;
		virtual void SetReal (const Standard_Real val);

		/****************** StepData_SelectReal ******************/
		%feature("compactdefaultargs") StepData_SelectReal;
		%feature("autodoc", ":rtype: None") StepData_SelectReal;
		 StepData_SelectReal ();

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
		/****************** As ******************/
		%feature("compactdefaultargs") As;
		%feature("autodoc", "* Returns a Simple Entity which matches with a Type in <self> : For a Simple Entity : me if it matches, else a null handle For a Complex Entity : the member which matches, else null
	:param steptype:
	:type steptype: char *
	:rtype: opencascade::handle<StepData_Simple>") As;
		opencascade::handle<StepData_Simple> As (const char * steptype);

		/****************** CField ******************/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "* Returns a Field from its name; read or write
	:param name:
	:type name: char *
	:rtype: StepData_Field") CField;
		StepData_Field & CField (const char * name);

		/****************** CFieldNum ******************/
		%feature("compactdefaultargs") CFieldNum;
		%feature("autodoc", "* Returns a field from its rank, in order to modify it
	:param num:
	:type num: int
	:rtype: StepData_Field") CFieldNum;
		StepData_Field & CFieldNum (const Standard_Integer num);

		/****************** CFields ******************/
		%feature("compactdefaultargs") CFields;
		%feature("autodoc", "* Returns the entire field list, read or write
	:rtype: StepData_FieldListN") CFields;
		StepData_FieldListN & CFields ();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "* Fills a Check by using its Description
	:param ach:
	:type ach: Interface_Check
	:rtype: None") Check;
		void Check (opencascade::handle<Interface_Check> & ach);

		/****************** ESDescr ******************/
		%feature("compactdefaultargs") ESDescr;
		%feature("autodoc", "* Returns description, as for simple
	:rtype: opencascade::handle<StepData_ESDescr>") ESDescr;
		opencascade::handle<StepData_ESDescr> ESDescr ();

		/****************** Field ******************/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "* Returns a Field from its name; read-only
	:param name:
	:type name: char *
	:rtype: StepData_Field") Field;
		const StepData_Field & Field (const char * name);

		/****************** FieldNum ******************/
		%feature("compactdefaultargs") FieldNum;
		%feature("autodoc", "* Returns a field from its rank, for read-only use
	:param num:
	:type num: int
	:rtype: StepData_Field") FieldNum;
		const StepData_Field & FieldNum (const Standard_Integer num);

		/****************** Fields ******************/
		%feature("compactdefaultargs") Fields;
		%feature("autodoc", "* Returns the entire field list, read-only
	:rtype: StepData_FieldListN") Fields;
		const StepData_FieldListN & Fields ();

		/****************** HasField ******************/
		%feature("compactdefaultargs") HasField;
		%feature("autodoc", "* Tells if a Field brings a given name
	:param name:
	:type name: char *
	:rtype: bool") HasField;
		Standard_Boolean HasField (const char * name);

		/****************** IsComplex ******************/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "* Returns False
	:rtype: bool") IsComplex;
		Standard_Boolean IsComplex ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if a step type is matched by <self> For a Simple Entity : own type or super type For a Complex Entity : one of the members
	:param steptype:
	:type steptype: char *
	:rtype: bool") Matches;
		Standard_Boolean Matches (const char * steptype);

		/****************** NbFields ******************/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "* Returns the count of fields
	:rtype: int") NbFields;
		Standard_Integer NbFields ();

		/****************** Shared ******************/
		%feature("compactdefaultargs") Shared;
		%feature("autodoc", "* Fills an EntityIterator with entities shared by <self>
	:param list:
	:type list: Interface_EntityIterator
	:rtype: None") Shared;
		void Shared (Interface_EntityIterator & list);

		/****************** StepData_Simple ******************/
		%feature("compactdefaultargs") StepData_Simple;
		%feature("autodoc", "* Creates a Simple Entity
	:param descr:
	:type descr: StepData_ESDescr
	:rtype: None") StepData_Simple;
		 StepData_Simple (const opencascade::handle<StepData_ESDescr> & descr);

		/****************** StepType ******************/
		%feature("compactdefaultargs") StepType;
		%feature("autodoc", "* Returns the recorded StepType (TypeName of its ESDescr)
	:rtype: char *") StepType;
		const char * StepType ();

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
		/****************** ArrReal ******************/
		%feature("compactdefaultargs") ArrReal;
		%feature("autodoc", ":rtype: opencascade::handle<TColStd_HArray1OfReal>") ArrReal;
		opencascade::handle<TColStd_HArray1OfReal> ArrReal ();

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", ":rtype: int") Kind;
		virtual Standard_Integer Kind ();

		/****************** SetArrReal ******************/
		%feature("compactdefaultargs") SetArrReal;
		%feature("autodoc", ":param arr:
	:type arr: TColStd_HArray1OfReal
	:rtype: None") SetArrReal;
		void SetArrReal (const opencascade::handle<TColStd_HArray1OfReal> & arr);

		/****************** StepData_SelectArrReal ******************/
		%feature("compactdefaultargs") StepData_SelectArrReal;
		%feature("autodoc", ":rtype: None") StepData_SelectArrReal;
		 StepData_SelectArrReal ();

};


%make_alias(StepData_SelectArrReal)

%extend StepData_SelectArrReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class StepData_HArray1OfField : public  StepData_Array1OfField, public Standard_Transient {
  public:
    StepData_HArray1OfField(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepData_HArray1OfField(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepData_Array1OfField::value_type& theValue);
    StepData_HArray1OfField(const  StepData_Array1OfField& theOther);
    const  StepData_Array1OfField& Array1();
     StepData_Array1OfField& ChangeArray1();
};
%make_alias(StepData_HArray1OfField)


/* harray2 classes */
/* hsequence classes */
