/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_stepdata.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<StepData_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Interface_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Resource_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<Message_module.hxx>
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
%import Resource.i

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

/* python proxy classes for enums */
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
Array1ExtendIter(StepData_Field)

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
		/****** StepData::AddHeaderProtocol ******/
		/****** md5 signature: 0a7cd1a7029723524dfa430b71173848 ******/
		%feature("compactdefaultargs") AddHeaderProtocol;
		%feature("autodoc", "
Parameters
----------
headerproto: StepData_Protocol

Return
-------
None

Description
-----------
Adds a new Header Protocol to the Header Definition.
") AddHeaderProtocol;
		static void AddHeaderProtocol(const opencascade::handle<StepData_Protocol> & headerproto);

		/****** StepData::HeaderProtocol ******/
		/****** md5 signature: ee8a4e5c3ee9940c1f97e501fc77c69c ******/
		%feature("compactdefaultargs") HeaderProtocol;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_Protocol>

Description
-----------
Returns the recorded HeaderProtocol, which can be: - a Null Handle if no Header Protocol was yet defined - a simple Protocol if only one was defined - a FileProtocol if more than one Protocol was yet defined.
") HeaderProtocol;
		static opencascade::handle<StepData_Protocol> HeaderProtocol();

		/****** StepData::Init ******/
		/****** md5 signature: 342fdccc4643f67c269591c4b6447108 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Prepares General Data required to work with this package, which are the Protocol and Modules to be loaded into Libraries.
") Init;
		static void Init();

		/****** StepData::Protocol ******/
		/****** md5 signature: 359567b3fb4e9ebcff0716a45d2733c9 ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_Protocol>

Description
-----------
Returns a Protocol from StepData (avoids to create it).
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
		/****** StepData_Described::As ******/
		/****** md5 signature: e6f72365cd240b51fd7b81aebeaca885 ******/
		%feature("compactdefaultargs") As;
		%feature("autodoc", "
Parameters
----------
steptype: str

Return
-------
opencascade::handle<StepData_Simple>

Description
-----------
Returns a Simple Entity which matches with a Type in <self>: For a Simple Entity: me if it matches, else a null handle For a Complex Entity: the member which matches, else null.
") As;
		virtual opencascade::handle<StepData_Simple> As(Standard_CString steptype);

		/****** StepData_Described::CField ******/
		/****** md5 signature: 3942529d9415c9a1148718142b858ef3 ******/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
StepData_Field

Description
-----------
Returns a Field from its name; read or write.
") CField;
		virtual StepData_Field & CField(Standard_CString name);

		/****** StepData_Described::Check ******/
		/****** md5 signature: a6c0f3d98344bfd32cbe8030f11e49a2 ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
ach: Interface_Check

Return
-------
None

Description
-----------
Fills a Check by using its Description.
") Check;
		virtual void Check(opencascade::handle<Interface_Check> & ach);

		/****** StepData_Described::Description ******/
		/****** md5 signature: 40a62100abb908ee192f9ee7322f2792 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_EDescr>

Description
-----------
Returns the Description used to define this entity.
") Description;
		opencascade::handle<StepData_EDescr> Description();

		/****** StepData_Described::Field ******/
		/****** md5 signature: b54581cafdf7e0ab0516bfe80096faf7 ******/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
StepData_Field

Description
-----------
Returns a Field from its name; read-only.
") Field;
		virtual const StepData_Field & Field(Standard_CString name);

		/****** StepData_Described::HasField ******/
		/****** md5 signature: 763cef82240aba1dfcfff32b45427471 ******/
		%feature("compactdefaultargs") HasField;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Tells if a Field brings a given name.
") HasField;
		virtual Standard_Boolean HasField(Standard_CString name);

		/****** StepData_Described::IsComplex ******/
		/****** md5 signature: 215c43b1ca8c148c12b487f2fd98bef8 ******/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if a described entity is complex.
") IsComplex;
		virtual Standard_Boolean IsComplex();

		/****** StepData_Described::Matches ******/
		/****** md5 signature: a826a593a3dad8b7fff1d0cd8938a955 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
steptype: str

Return
-------
bool

Description
-----------
Tells if a step type is matched by <self> For a Simple Entity: own type or super type For a Complex Entity: one of the members.
") Matches;
		virtual Standard_Boolean Matches(Standard_CString steptype);

		/****** StepData_Described::Shared ******/
		/****** md5 signature: d9e9efa040bea745d29689599b296689 ******/
		%feature("compactdefaultargs") Shared;
		%feature("autodoc", "
Parameters
----------
list: Interface_EntityIterator

Return
-------
None

Description
-----------
Fills an EntityIterator with entities shared by <self>.
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
		/****** StepData_EDescr::IsComplex ******/
		/****** md5 signature: 215c43b1ca8c148c12b487f2fd98bef8 ******/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if a EDescr is complex (ECDescr) or simple (ESDescr).
") IsComplex;
		virtual Standard_Boolean IsComplex();

		/****** StepData_EDescr::Matches ******/
		/****** md5 signature: a826a593a3dad8b7fff1d0cd8938a955 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
steptype: str

Return
-------
bool

Description
-----------
Tells if a ESDescr matches a step type: exact or super type.
") Matches;
		virtual Standard_Boolean Matches(Standard_CString steptype);

		/****** StepData_EDescr::NewEntity ******/
		/****** md5 signature: 6ca199af3f6d883b631677c74f1720fd ******/
		%feature("compactdefaultargs") NewEntity;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_Described>

Description
-----------
Creates a described entity (i.e. a simple one).
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
		/****** StepData_EnumTool::StepData_EnumTool ******/
		/****** md5 signature: 8d5339daaaa43e9738a7a169ae14a519 ******/
		%feature("compactdefaultargs") StepData_EnumTool;
		%feature("autodoc", "
Parameters
----------
e0: str (optional, default to "")
e1: str (optional, default to "")
e2: str (optional, default to "")
e3: str (optional, default to "")
e4: str (optional, default to "")
e5: str (optional, default to "")
e6: str (optional, default to "")
e7: str (optional, default to "")
e8: str (optional, default to "")
e9: str (optional, default to "")
e10: str (optional, default to "")
e11: str (optional, default to "")
e12: str (optional, default to "")
e13: str (optional, default to "")
e14: str (optional, default to "")
e15: str (optional, default to "")
e16: str (optional, default to "")
e17: str (optional, default to "")
e18: str (optional, default to "")
e19: str (optional, default to "")
e20: str (optional, default to "")
e21: str (optional, default to "")
e22: str (optional, default to "")
e23: str (optional, default to "")
e24: str (optional, default to "")
e25: str (optional, default to "")
e26: str (optional, default to "")
e27: str (optional, default to "")
e28: str (optional, default to "")
e29: str (optional, default to "")
e30: str (optional, default to "")
e31: str (optional, default to "")
e32: str (optional, default to "")
e33: str (optional, default to "")
e34: str (optional, default to "")
e35: str (optional, default to "")
e36: str (optional, default to "")
e37: str (optional, default to "")
e38: str (optional, default to "")
e39: str (optional, default to "")

Return
-------
None

Description
-----------
Creates an EnumTool with definitions given by e0 .. e<max> Each definition string can bring one term, or several separated by blanks. Each term corresponds to one value of the enumeration, if dots are not presents they are added //! Such a static constructor allows to build a static description as: static StepData_EnumTool myenumtool('e0','e1'...); then use it without having to initialise it //! A null definition can be input by given '$' :the corresponding position is attached to 'null/undefined' value (as one particular item of the enumeration list).
") StepData_EnumTool;
		 StepData_EnumTool(Standard_CString e0 = "", Standard_CString e1 = "", Standard_CString e2 = "", Standard_CString e3 = "", Standard_CString e4 = "", Standard_CString e5 = "", Standard_CString e6 = "", Standard_CString e7 = "", Standard_CString e8 = "", Standard_CString e9 = "", Standard_CString e10 = "", Standard_CString e11 = "", Standard_CString e12 = "", Standard_CString e13 = "", Standard_CString e14 = "", Standard_CString e15 = "", Standard_CString e16 = "", Standard_CString e17 = "", Standard_CString e18 = "", Standard_CString e19 = "", Standard_CString e20 = "", Standard_CString e21 = "", Standard_CString e22 = "", Standard_CString e23 = "", Standard_CString e24 = "", Standard_CString e25 = "", Standard_CString e26 = "", Standard_CString e27 = "", Standard_CString e28 = "", Standard_CString e29 = "", Standard_CString e30 = "", Standard_CString e31 = "", Standard_CString e32 = "", Standard_CString e33 = "", Standard_CString e34 = "", Standard_CString e35 = "", Standard_CString e36 = "", Standard_CString e37 = "", Standard_CString e38 = "", Standard_CString e39 = "");

		/****** StepData_EnumTool::AddDefinition ******/
		/****** md5 signature: 23a5c4986f78df0c3ae858b925eb5246 ******/
		%feature("compactdefaultargs") AddDefinition;
		%feature("autodoc", "
Parameters
----------
term: str

Return
-------
None

Description
-----------
Processes a definition, splits it according blanks if any empty definitions are ignored A null definition can be input by given '$' :the corresponding position is attached to 'null/undefined' value (as one particular item of the enumeration list) See also IsSet.
") AddDefinition;
		void AddDefinition(Standard_CString term);

		/****** StepData_EnumTool::IsSet ******/
		/****** md5 signature: d771f80e63fcb5d314de94e557642c75 ******/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if at least one definition has been entered after creation time (i.e. by AddDefinition only) //! This allows to build a static description by a first pass: static StepData_EnumTool myenumtool('e0' ...); ... if (!myenumtool.IsSet()) { for further inits myenumtool.AddDefinition('e21'); ... }.
") IsSet;
		Standard_Boolean IsSet();

		/****** StepData_EnumTool::MaxValue ******/
		/****** md5 signature: c740afbe5c26bd9e0283229c123b037e ******/
		%feature("compactdefaultargs") MaxValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum integer for a suitable value Remark: while values begin at zero, MaxValue is the count of recorded values minus one.
") MaxValue;
		Standard_Integer MaxValue();

		/****** StepData_EnumTool::NullValue ******/
		/****** md5 signature: d87571946a1ab73fe735a14f9a3129d7 ******/
		%feature("compactdefaultargs") NullValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value attached to 'null/undefined value' If none is specified or if Optional has been set to False, returns -1 Null Value has been specified by definition '$'.
") NullValue;
		Standard_Integer NullValue();

		/****** StepData_EnumTool::Optional ******/
		/****** md5 signature: f01d12334cbcf88113d3cc1ea5fea155 ******/
		%feature("compactdefaultargs") Optional;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
Sets or Unsets the EnumTool to accept undefined value (for optional field). Ignored if no null value is defined (by '$') Can be changed during execution (to read each field), Default is True (if a null value is defined).
") Optional;
		void Optional(const Standard_Boolean mode);

		/****** StepData_EnumTool::Text ******/
		/****** md5 signature: 68f510ac8cb4a3e7a045f9d04d5b5002 ******/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TCollection_AsciiString

Description
-----------
Returns the text which corresponds to a given numeric value It is limited by dots If num is out of range, returns an empty string.
") Text;
		const TCollection_AsciiString & Text(const Standard_Integer num);

		/****** StepData_EnumTool::Value ******/
		/****** md5 signature: 3a486bb84d937fe3e67a87cda87049da ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
txt: str

Return
-------
int

Description
-----------
Returns the numeric value found for a text The text must be in capitals and limited by dots A non-suitable text gives a negative value to be returned.
") Value;
		Standard_Integer Value(Standard_CString txt);

		/****** StepData_EnumTool::Value ******/
		/****** md5 signature: 297d6bfd8a3e6e4466b4cf9c8399a2f1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
txt: str

Return
-------
int

Description
-----------
Same as above but works on an AsciiString.
") Value;
		Standard_Integer Value(TCollection_AsciiString txt);

};


%extend StepData_EnumTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StepData_Factors *
*************************/
class StepData_Factors {
	public:
		/****** StepData_Factors::StepData_Factors ******/
		/****** md5 signature: 6dd57ab5fc7f0b37f726172c0e5475a8 ******/
		%feature("compactdefaultargs") StepData_Factors;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") StepData_Factors;
		 StepData_Factors();

		/****** StepData_Factors::CascadeUnit ******/
		/****** md5 signature: 0a04d480977f0e8fef0df000d9bf1748 ******/
		%feature("compactdefaultargs") CascadeUnit;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns length unit for current transfer process (mm by default).
") CascadeUnit;
		Standard_Real CascadeUnit();

		/****** StepData_Factors::FactorDegreeRadian ******/
		/****** md5 signature: c42d3d03e3dd317c6901b788646067a0 ******/
		%feature("compactdefaultargs") FactorDegreeRadian;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns transient factor degree radian for conversion of angles at one stage of transfer process.
") FactorDegreeRadian;
		Standard_Real FactorDegreeRadian();

		/****** StepData_Factors::FactorRadianDegree ******/
		/****** md5 signature: 3fe70ab620009bf6d8e5fdd4492c13fe ******/
		%feature("compactdefaultargs") FactorRadianDegree;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns transient factor radian degree for conversion of angles at one stage of transfer process.
") FactorRadianDegree;
		Standard_Real FactorRadianDegree();

		/****** StepData_Factors::InitializeFactors ******/
		/****** md5 signature: cd04360a2d1cbd674218ed3c1e732874 ******/
		%feature("compactdefaultargs") InitializeFactors;
		%feature("autodoc", "
Parameters
----------
theLengthFactor: float
thePlaneAngleFactor: float
theSolidAngleFactor: float

Return
-------
None

Description
-----------
Initializes the 3 factors for the conversion of units.
") InitializeFactors;
		void InitializeFactors(const Standard_Real theLengthFactor, const Standard_Real thePlaneAngleFactor, const Standard_Real theSolidAngleFactor);

		/****** StepData_Factors::LengthFactor ******/
		/****** md5 signature: 15771254030d5d42fe1035afb35f49f8 ******/
		%feature("compactdefaultargs") LengthFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns transient length factor for scaling of shapes at one stage of transfer process.
") LengthFactor;
		Standard_Real LengthFactor();

		/****** StepData_Factors::PlaneAngleFactor ******/
		/****** md5 signature: 24a746fdf36cb34234bfa6984c9c2721 ******/
		%feature("compactdefaultargs") PlaneAngleFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns transient plane angle factor for conversion of angles at one stage of transfer process.
") PlaneAngleFactor;
		Standard_Real PlaneAngleFactor();

		/****** StepData_Factors::SetCascadeUnit ******/
		/****** md5 signature: 9681d8ff7bf315f004a2dba0dc32aacc ******/
		%feature("compactdefaultargs") SetCascadeUnit;
		%feature("autodoc", "
Parameters
----------
theUnit: float

Return
-------
None

Description
-----------
Sets length unit for current transfer process.
") SetCascadeUnit;
		void SetCascadeUnit(const Standard_Real theUnit);

		/****** StepData_Factors::SolidAngleFactor ******/
		/****** md5 signature: 5c610c278e1133bf63025e97445bcd03 ******/
		%feature("compactdefaultargs") SolidAngleFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns transient solid angle factor for conversion of angles at one stage of transfer process.
") SolidAngleFactor;
		Standard_Real SolidAngleFactor();

};


%extend StepData_Factors {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class StepData_Field *
***********************/
class StepData_Field {
	public:
		/****** StepData_Field::StepData_Field ******/
		/****** md5 signature: b2d9a8a01e73cb65d994ee3fb2a6225b ******/
		%feature("compactdefaultargs") StepData_Field;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a Field, empty ('no value defined').
") StepData_Field;
		 StepData_Field();

		/****** StepData_Field::StepData_Field ******/
		/****** md5 signature: dec751dedfc43a6634b948cd2d377747 ******/
		%feature("compactdefaultargs") StepData_Field;
		%feature("autodoc", "
Parameters
----------
other: StepData_Field
copy: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a Field from another one. If <copy> is True, Handled data (Select,String,List, not entities) are copied.
") StepData_Field;
		 StepData_Field(const StepData_Field & other, const Standard_Boolean copy = Standard_False);

		/****** StepData_Field::Arity ******/
		/****** md5 signature: 20ac80f17e36fa74dda1be985f98e194 ******/
		%feature("compactdefaultargs") Arity;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Arity;
		Standard_Integer Arity();

		/****** StepData_Field::Boolean ******/
		/****** md5 signature: 84acce27304ec7fab03c41692b2abb27 ******/
		%feature("compactdefaultargs") Boolean;
		%feature("autodoc", "
Parameters
----------
n1: int (optional, default to 1)
n2: int (optional, default to 1)

Return
-------
bool

Description
-----------
No available documentation.
") Boolean;
		Standard_Boolean Boolean(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****** StepData_Field::Clear ******/
		/****** md5 signature: 06a9aa1e7ad36592e140c342d0aa0518 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
kind: int (optional, default to 0)

Return
-------
None

Description
-----------
Clears the field, to set it as 'no value defined' Just before SetList, predeclares it as 'any' A Kind can be directly set here to declare a type.
") Clear;
		void Clear(const Standard_Integer kind = 0);

		/****** StepData_Field::ClearItem ******/
		/****** md5 signature: 59665022a329fbab5dc0039fffc2b280 ******/
		%feature("compactdefaultargs") ClearItem;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
Declares an item of the list as undefined (ignored if list not defined as String,Entity or Any).
") ClearItem;
		void ClearItem(const Standard_Integer num);

		/****** StepData_Field::CopyFrom ******/
		/****** md5 signature: cdf165bfdbd68dff126e1d1ffdb13ca6 ******/
		%feature("compactdefaultargs") CopyFrom;
		%feature("autodoc", "
Parameters
----------
other: StepData_Field

Return
-------
None

Description
-----------
Gets the copy of the values of another field.
") CopyFrom;
		void CopyFrom(const StepData_Field & other);

		/****** StepData_Field::Entity ******/
		/****** md5 signature: e454cfdf3aa08032e84c07a83723c455 ******/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "
Parameters
----------
n1: int (optional, default to 1)
n2: int (optional, default to 1)

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
No available documentation.
") Entity;
		opencascade::handle<Standard_Transient> Entity(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****** StepData_Field::Enum ******/
		/****** md5 signature: 39cff2ee8ac4ac87a5c98eb58adf5188 ******/
		%feature("compactdefaultargs") Enum;
		%feature("autodoc", "
Parameters
----------
n1: int (optional, default to 1)
n2: int (optional, default to 1)

Return
-------
int

Description
-----------
No available documentation.
") Enum;
		Standard_Integer Enum(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****** StepData_Field::EnumText ******/
		/****** md5 signature: ac7ad4f1127b4e3312cca940733299f6 ******/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "
Parameters
----------
n1: int (optional, default to 1)
n2: int (optional, default to 1)

Return
-------
str

Description
-----------
No available documentation.
") EnumText;
		Standard_CString EnumText(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****** StepData_Field::Int ******/
		/****** md5 signature: 1413d7ff960425ad93b46a46cdc240ec ******/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Int;
		Standard_Integer Int();

		/****** StepData_Field::Integer ******/
		/****** md5 signature: 190ccfc6369ae2e7ed041adf31cc2f6c ******/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "
Parameters
----------
n1: int (optional, default to 1)
n2: int (optional, default to 1)

Return
-------
int

Description
-----------
No available documentation.
") Integer;
		Standard_Integer Integer(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****** StepData_Field::IsSet ******/
		/****** md5 signature: 551688547dc9940e3115be11a325717f ******/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "
Parameters
----------
n1: int (optional, default to 1)
n2: int (optional, default to 1)

Return
-------
bool

Description
-----------
No available documentation.
") IsSet;
		Standard_Boolean IsSet(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****** StepData_Field::ItemKind ******/
		/****** md5 signature: 0ac42f8324a90e0da1ec9c71a6bfa8c3 ******/
		%feature("compactdefaultargs") ItemKind;
		%feature("autodoc", "
Parameters
----------
n1: int (optional, default to 1)
n2: int (optional, default to 1)

Return
-------
int

Description
-----------
Returns the kind of an item in a list or double list It is the kind of the list, except if it is 'Any', in such a case the true kind is determined and returned.
") ItemKind;
		Standard_Integer ItemKind(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****** StepData_Field::Kind ******/
		/****** md5 signature: 0f949cc91d90c10b6f6b1a0be3460e4d ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "
Parameters
----------
type: bool (optional, default to Standard_True)

Return
-------
int

Description
-----------
Returns the kind of the field <type> True (D): returns only the type itself else, returns the complete kind.
") Kind;
		Standard_Integer Kind(const Standard_Boolean type = Standard_True);

		/****** StepData_Field::Length ******/
		/****** md5 signature: 27a4e3d48774cdde854fbae9ccb338e5 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
index: int (optional, default to 1)

Return
-------
int

Description
-----------
No available documentation.
") Length;
		Standard_Integer Length(const Standard_Integer index = 1);

		/****** StepData_Field::Logical ******/
		/****** md5 signature: 52cf91428cbe20defb88706ca9abba31 ******/
		%feature("compactdefaultargs") Logical;
		%feature("autodoc", "
Parameters
----------
n1: int (optional, default to 1)
n2: int (optional, default to 1)

Return
-------
StepData_Logical

Description
-----------
No available documentation.
") Logical;
		StepData_Logical Logical(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****** StepData_Field::Lower ******/
		/****** md5 signature: 9231e123255a5e0b308cfc7a8936fe8e ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "
Parameters
----------
index: int (optional, default to 1)

Return
-------
int

Description
-----------
No available documentation.
") Lower;
		Standard_Integer Lower(const Standard_Integer index = 1);

		/****** StepData_Field::Real ******/
		/****** md5 signature: 089acbdc8ea38b93d474a5b20072cadd ******/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "
Parameters
----------
n1: int (optional, default to 1)
n2: int (optional, default to 1)

Return
-------
float

Description
-----------
No available documentation.
") Real;
		Standard_Real Real(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****** StepData_Field::Set ******/
		/****** md5 signature: 53a063b73cbc66b14e226f6ffbcfad0b ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
val: Standard_Transient

Return
-------
None

Description
-----------
Sets an undetermined value: can be String, SelectMember, HArray(1-2) ... else, an Entity In case of an HArray, determines and records its size(s).
") Set;
		void Set(const opencascade::handle<Standard_Transient> & val);

		/****** StepData_Field::SetBoolean ******/
		/****** md5 signature: d2ae2fd479a934a8e365e260c39a0b9a ******/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "
Parameters
----------
val: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets a Boolean value (or predeclares a list as boolean).
") SetBoolean;
		void SetBoolean(const Standard_Boolean val = Standard_False);

		/****** StepData_Field::SetBoolean ******/
		/****** md5 signature: 65dcdf98ac9ac398542a91f2b2c70798 ******/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "
Parameters
----------
num: int
val: bool

Return
-------
None

Description
-----------
No available documentation.
") SetBoolean;
		void SetBoolean(const Standard_Integer num, const Standard_Boolean val);

		/****** StepData_Field::SetDerived ******/
		/****** md5 signature: a80ad14f5afeeab36a7f513db1256465 ******/
		%feature("compactdefaultargs") SetDerived;
		%feature("autodoc", "Return
-------
None

Description
-----------
Codes a Field as derived (no proper value).
") SetDerived;
		void SetDerived();

		/****** StepData_Field::SetEntity ******/
		/****** md5 signature: c6a6fc4c9dcde0bc285267d9aed7a1c5 ******/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "
Parameters
----------
val: Standard_Transient

Return
-------
None

Description
-----------
Sets an Entity Value.
") SetEntity;
		void SetEntity(const opencascade::handle<Standard_Transient> & val);

		/****** StepData_Field::SetEntity ******/
		/****** md5 signature: bfc33c7bf86b38dc73173c942862e48e ******/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Predeclares a list as of entity.
") SetEntity;
		void SetEntity();

		/****** StepData_Field::SetEntity ******/
		/****** md5 signature: 8f7abced0e0362c329584af4986dee6b ******/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "
Parameters
----------
num: int
val: Standard_Transient

Return
-------
None

Description
-----------
No available documentation.
") SetEntity;
		void SetEntity(const Standard_Integer num, const opencascade::handle<Standard_Transient> & val);

		/****** StepData_Field::SetEnum ******/
		/****** md5 signature: 815c4c3631f6fb0be03cdcb93f3d0ac7 ******/
		%feature("compactdefaultargs") SetEnum;
		%feature("autodoc", "
Parameters
----------
val: int (optional, default to -1)
text: str (optional, default to "")

Return
-------
None

Description
-----------
Sets an Enum Value (as its integer counterpart) (or predeclares a list as Enum) If <text> is given , also sets its textual expression <val> negative means unknown (known values begin at 0).
") SetEnum;
		void SetEnum(const Standard_Integer val = -1, Standard_CString text = "");

		/****** StepData_Field::SetEnum ******/
		/****** md5 signature: bc1babd5877fcdfbed8c3c18c8fb941d ******/
		%feature("compactdefaultargs") SetEnum;
		%feature("autodoc", "
Parameters
----------
num: int
val: int
text: str (optional, default to "")

Return
-------
None

Description
-----------
Sets an Enum Value (Integer counterpart), also its text expression if known (if list has been set as 'any').
") SetEnum;
		void SetEnum(const Standard_Integer num, const Standard_Integer val, Standard_CString text = "");

		/****** StepData_Field::SetInt ******/
		/****** md5 signature: dcaa71e8d1c44545b3a4bd91a6b8e118 ******/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "
Parameters
----------
val: int

Return
-------
None

Description
-----------
Directly sets the Integer value, if its Kind matches Integer, Boolean, Logical, or Enum (does not change Kind).
") SetInt;
		void SetInt(const Standard_Integer val);

		/****** StepData_Field::SetInt ******/
		/****** md5 signature: 478fb891c77d9c827547911218dbbdf8 ******/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "
Parameters
----------
num: int
val: int
kind: int

Return
-------
None

Description
-----------
Internal access to an Integer Value for a list, plus its kind.
") SetInt;
		void SetInt(const Standard_Integer num, const Standard_Integer val, const Standard_Integer kind);

		/****** StepData_Field::SetInteger ******/
		/****** md5 signature: 35899117e85fab405a5c10f4096f4868 ******/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "
Parameters
----------
val: int (optional, default to 0)

Return
-------
None

Description
-----------
Sets an Integer value (before SetList* declares it as Integer).
") SetInteger;
		void SetInteger(const Standard_Integer val = 0);

		/****** StepData_Field::SetInteger ******/
		/****** md5 signature: 44f51fa90a9a3a02c196b18e66b74f9c ******/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "
Parameters
----------
num: int
val: int

Return
-------
None

Description
-----------
Sets an Integer Value for a list (rank num) (recognizes a SelectMember).
") SetInteger;
		void SetInteger(const Standard_Integer num, const Standard_Integer val);

		/****** StepData_Field::SetList ******/
		/****** md5 signature: ff43def4de223c3631c5bf24aec29410 ******/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "
Parameters
----------
size: int
first: int (optional, default to 1)

Return
-------
None

Description
-----------
Declares a field as a list, with an initial size Initial lower is defaulted as 1, can be defined The list starts empty, typed by the last Set* If no Set* before, sets it as 'any' (transient/select).
") SetList;
		void SetList(const Standard_Integer size, const Standard_Integer first = 1);

		/****** StepData_Field::SetList2 ******/
		/****** md5 signature: 38fa7e624e6758a095044332a691150b ******/
		%feature("compactdefaultargs") SetList2;
		%feature("autodoc", "
Parameters
----------
siz1: int
siz2: int
f1: int (optional, default to 1)
f2: int (optional, default to 1)

Return
-------
None

Description
-----------
Declares a field as an homogeneous square list, with initial sizes, and initial lowers.
") SetList2;
		void SetList2(const Standard_Integer siz1, const Standard_Integer siz2, const Standard_Integer f1 = 1, const Standard_Integer f2 = 1);

		/****** StepData_Field::SetLogical ******/
		/****** md5 signature: f45ed36db2fa09e8ef1d7d07130f9b83 ******/
		%feature("compactdefaultargs") SetLogical;
		%feature("autodoc", "
Parameters
----------
val: StepData_Logical (optional, default to StepData_LFalse)

Return
-------
None

Description
-----------
Sets a Logical Value (or predeclares a list as logical).
") SetLogical;
		void SetLogical(const StepData_Logical val = StepData_LFalse);

		/****** StepData_Field::SetLogical ******/
		/****** md5 signature: ef76377b7df689a67a0545e7d3a30fee ******/
		%feature("compactdefaultargs") SetLogical;
		%feature("autodoc", "
Parameters
----------
num: int
val: StepData_Logical

Return
-------
None

Description
-----------
No available documentation.
") SetLogical;
		void SetLogical(const Standard_Integer num, const StepData_Logical val);

		/****** StepData_Field::SetReal ******/
		/****** md5 signature: 35e6333bdaab648aae6df8a305f6439b ******/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "
Parameters
----------
val: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Sets a Real Value (or predeclares a list as Real);.
") SetReal;
		void SetReal(const Standard_Real val = 0.0);

		/****** StepData_Field::SetReal ******/
		/****** md5 signature: e7283d228809c9467174f045f70fa321 ******/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "
Parameters
----------
num: int
val: float

Return
-------
None

Description
-----------
No available documentation.
") SetReal;
		void SetReal(const Standard_Integer num, const Standard_Real val);

		/****** StepData_Field::SetSelectMember ******/
		/****** md5 signature: c38cbdb8ec1be691737e204fa9961684 ******/
		%feature("compactdefaultargs") SetSelectMember;
		%feature("autodoc", "
Parameters
----------
val: StepData_SelectMember

Return
-------
None

Description
-----------
Sets a SelectMember (for Integer,Boolean,Enum,Real,Logical) Hence, the value of the field is accessed through this member.
") SetSelectMember;
		void SetSelectMember(const opencascade::handle<StepData_SelectMember> & val);

		/****** StepData_Field::SetString ******/
		/****** md5 signature: fd08d5f8b5cfd32e65c1be12d7e2440a ******/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "
Parameters
----------
val: str (optional, default to "")

Return
-------
None

Description
-----------
Sets a String Value (or predeclares a list as String) Does not redefine the Kind if it is already String or Enum.
") SetString;
		void SetString(Standard_CString val = "");

		/****** StepData_Field::SetString ******/
		/****** md5 signature: f741937452f9aac8d558f8cc952598a6 ******/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "
Parameters
----------
num: int
val: str

Return
-------
None

Description
-----------
No available documentation.
") SetString;
		void SetString(const Standard_Integer num, Standard_CString val);

		/****** StepData_Field::String ******/
		/****** md5 signature: 52aed6fbe6a9dbd2567c65ce961ec922 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "
Parameters
----------
n1: int (optional, default to 1)
n2: int (optional, default to 1)

Return
-------
str

Description
-----------
No available documentation.
") String;
		Standard_CString String(const Standard_Integer n1 = 1, const Standard_Integer n2 = 1);

		/****** StepData_Field::Transient ******/
		/****** md5 signature: 5e2d51bfd45ca63ce3acf2b050563c85 ******/
		%feature("compactdefaultargs") Transient;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
No available documentation.
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
		/****** StepData_FieldList::StepData_FieldList ******/
		/****** md5 signature: 663f79bf664a687bef2bbb31fc7ffbc7 ******/
		%feature("compactdefaultargs") StepData_FieldList;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a FieldList of 0 Field.
") StepData_FieldList;
		 StepData_FieldList();

		/****** StepData_FieldList::CField ******/
		/****** md5 signature: 2ab5b964a298bbbf8b72fe8796eda457 ******/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepData_Field

Description
-----------
Returns the field n0 <num> between 1 and NbFields, in order to modify its content.
") CField;
		virtual StepData_Field & CField(const Standard_Integer num);

		/****** StepData_FieldList::Field ******/
		/****** md5 signature: 428e6e13c8309e2322a1ca78618c4624 ******/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepData_Field

Description
-----------
Returns the field n0 <num> between 1 and NbFields (read only).
") Field;
		virtual const StepData_Field & Field(const Standard_Integer num);

		/****** StepData_FieldList::FillShared ******/
		/****** md5 signature: c859b171a613ba5d4f5654a157c2c9d5 ******/
		%feature("compactdefaultargs") FillShared;
		%feature("autodoc", "
Parameters
----------
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
Fills an iterator with the entities shared by <self>.
") FillShared;
		void FillShared(Interface_EntityIterator & iter);

		/****** StepData_FieldList::NbFields ******/
		/****** md5 signature: 724ee9f833e2afc6f707c1556db2ce3a ******/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of fields. Here, returns 0.
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
		/****** StepData_FileRecognizer::Add ******/
		/****** md5 signature: 1a1427b9de0299880764a51cd1c5fca0 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
reco: StepData_FileRecognizer

Return
-------
None

Description
-----------
Adds a new Recognizer to the Compound, at the end Several calls to Add work by adding in the order of calls: Hence, when Eval has failed to recognize, Evaluate will call Evaluate from the first added Recognizer if there is one, and to the second if there is still no result, and so on.
") Add;
		void Add(const opencascade::handle<StepData_FileRecognizer> & reco);

		/****** StepData_FileRecognizer::Evaluate ******/
		/****** md5 signature: 7f95a0db3f780527bc96e1921144b3d9 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
akey: str
res: Standard_Transient

Return
-------
bool

Description
-----------
Evaluates if recognition has a result, returns it if yes In case of success, Returns True and puts result in 'res' In case of Failure, simply Returns False Works by calling deferred method Eval, and in case of failure, looks for Added Recognizers to work.
") Evaluate;
		Standard_Boolean Evaluate(TCollection_AsciiString akey, opencascade::handle<Standard_Transient> & res);

		/****** StepData_FileRecognizer::Result ******/
		/****** md5 signature: 1e478c458b39937c7be2973ea1c73aa7 ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns result of last recognition (call of Evaluate).
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
		/****** StepData_GeneralModule::CheckCase ******/
		/****** md5 signature: f70507a217932123f7ace4ad48391e17 ******/
		%feature("compactdefaultargs") CheckCase;
		%feature("autodoc", "
Parameters
----------
casenum: int
ent: Standard_Transient
shares: Interface_ShareTool
ach: Interface_Check

Return
-------
None

Description
-----------
Specific Checking of an Entity <ent>.
") CheckCase;
		virtual void CheckCase(const Standard_Integer casenum, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****** StepData_GeneralModule::CopyCase ******/
		/****** md5 signature: efad3342c5c4cce396b731e451727516 ******/
		%feature("compactdefaultargs") CopyCase;
		%feature("autodoc", "
Parameters
----------
casenum: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Return
-------
None

Description
-----------
Specific Copy ('Deep') from <entfrom> to <entto> (same type) by using a TransferControl which provides its working Map. Use method Transferred from TransferControl to work Specific Copying of Implied References A Default is provided which does nothing (must current case !) Already copied references (by CopyFrom) must remain unchanged Use method Search from TransferControl to work.
") CopyCase;
		virtual void CopyCase(const Standard_Integer casenum, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****** StepData_GeneralModule::FillSharedCase ******/
		/****** md5 signature: 94cc5462c692f02ed43b5d49103c610c ******/
		%feature("compactdefaultargs") FillSharedCase;
		%feature("autodoc", "
Parameters
----------
casenum: int
ent: Standard_Transient
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
Specific filling of the list of Entities shared by an Entity <ent>. Can use the internal utility method Share, below.
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
		/****** StepData_GlobalNodeOfWriterLib::StepData_GlobalNodeOfWriterLib ******/
		/****** md5 signature: dcd765dfcc181934f2a7e60968aec5f1 ******/
		%feature("compactdefaultargs") StepData_GlobalNodeOfWriterLib;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty GlobalNode, with no Next.
") StepData_GlobalNodeOfWriterLib;
		 StepData_GlobalNodeOfWriterLib();

		/****** StepData_GlobalNodeOfWriterLib::Add ******/
		/****** md5 signature: 497be690de5df95c0f5f595cb301a456 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
amodule: StepData_ReadWriteModule
aprotocol: StepData_Protocol

Return
-------
None

Description
-----------
Adds a Module bound with a Protocol to the list: does nothing if already in the list, THAT IS, Same Type (exact match) and Same State (that is, IsEqual is not required) Once added, stores its attached Protocol in correspondence.
") Add;
		void Add(const opencascade::handle<StepData_ReadWriteModule> & amodule, const opencascade::handle<StepData_Protocol> & aprotocol);

		/****** StepData_GlobalNodeOfWriterLib::Module ******/
		/****** md5 signature: fc6ebae4e625291cc922056721349877 ******/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_ReadWriteModule>

Description
-----------
Returns the Module stored in a given GlobalNode.
") Module;
		const opencascade::handle<StepData_ReadWriteModule> & Module();

		/****** StepData_GlobalNodeOfWriterLib::Next ******/
		/****** md5 signature: 3dfe858631563fb6cb129bf868332ba8 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_GlobalNodeOfWriterLib>

Description
-----------
Returns the Next GlobalNode. If none is defined, returned value is a Null Handle.
") Next;
		const opencascade::handle<StepData_GlobalNodeOfWriterLib> & Next();

		/****** StepData_GlobalNodeOfWriterLib::Protocol ******/
		/****** md5 signature: be143b1e7168aac7c0bb42807f3196d4 ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_Protocol>

Description
-----------
Returns the attached Protocol stored in a given GlobalNode.
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
		/****** StepData_NodeOfWriterLib::StepData_NodeOfWriterLib ******/
		/****** md5 signature: 85b113642b68a2367beb75014fb04a3a ******/
		%feature("compactdefaultargs") StepData_NodeOfWriterLib;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty Node, with no Next.
") StepData_NodeOfWriterLib;
		 StepData_NodeOfWriterLib();

		/****** StepData_NodeOfWriterLib::AddNode ******/
		/****** md5 signature: 4f414810368d19288acfccbf4b33c1a6 ******/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "
Parameters
----------
anode: StepData_GlobalNodeOfWriterLib

Return
-------
None

Description
-----------
Adds a couple (Module,Protocol), that is, stores it into itself if not yet done, else creates a Next Node to do it.
") AddNode;
		void AddNode(const opencascade::handle<StepData_GlobalNodeOfWriterLib> & anode);

		/****** StepData_NodeOfWriterLib::Module ******/
		/****** md5 signature: fc6ebae4e625291cc922056721349877 ******/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_ReadWriteModule>

Description
-----------
Returns the Module designated by a precise Node.
") Module;
		const opencascade::handle<StepData_ReadWriteModule> & Module();

		/****** StepData_NodeOfWriterLib::Next ******/
		/****** md5 signature: 29517d45474e61e1be0adda5d75728d7 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_NodeOfWriterLib>

Description
-----------
Returns the Next Node. If none was defined, returned value is a Null Handle.
") Next;
		const opencascade::handle<StepData_NodeOfWriterLib> & Next();

		/****** StepData_NodeOfWriterLib::Protocol ******/
		/****** md5 signature: be143b1e7168aac7c0bb42807f3196d4 ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_Protocol>

Description
-----------
Returns the Protocol designated by a precise Node.
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
		/****** StepData_PDescr::StepData_PDescr ******/
		/****** md5 signature: 7031f332cf7edd19fdd813861076021c ******/
		%feature("compactdefaultargs") StepData_PDescr;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepData_PDescr;
		 StepData_PDescr();

		/****** StepData_PDescr::AddArity ******/
		/****** md5 signature: 57693e89b3b8b9bd869a21a75b6e1718 ******/
		%feature("compactdefaultargs") AddArity;
		%feature("autodoc", "
Parameters
----------
arity: int (optional, default to 1)

Return
-------
None

Description
-----------
Adds an arity count to <self>, by default 1 1: a simple field passes to a LIST/ARRAY etc or a LIST to a LIST OF LIST 2: a simple field passes to a LIST OF LIST.
") AddArity;
		void AddArity(const Standard_Integer arity = 1);

		/****** StepData_PDescr::AddEnumDef ******/
		/****** md5 signature: 46c7fa9e4331909047350ca948b45d0f ******/
		%feature("compactdefaultargs") AddEnumDef;
		%feature("autodoc", "
Parameters
----------
enumdef: str

Return
-------
None

Description
-----------
Adds an enum value as a string.
") AddEnumDef;
		void AddEnumDef(Standard_CString enumdef);

		/****** StepData_PDescr::AddMember ******/
		/****** md5 signature: 8b4d028f234e253b6e252a8999245bcc ******/
		%feature("compactdefaultargs") AddMember;
		%feature("autodoc", "
Parameters
----------
member: StepData_PDescr

Return
-------
None

Description
-----------
Adds a member to a SELECT description.
") AddMember;
		void AddMember(const opencascade::handle<StepData_PDescr> & member);

		/****** StepData_PDescr::Arity ******/
		/****** md5 signature: 20ac80f17e36fa74dda1be985f98e194 ******/
		%feature("compactdefaultargs") Arity;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the arity of <self>.
") Arity;
		Standard_Integer Arity();

		/****** StepData_PDescr::Check ******/
		/****** md5 signature: d68d9bbd232a98cba7bf42d03257f06b ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
afild: StepData_Field
ach: Interface_Check

Return
-------
None

Description
-----------
Semantic Check of a Field: does it complies with the given description ?.
") Check;
		virtual void Check(const StepData_Field & afild, opencascade::handle<Interface_Check> & ach);

		/****** StepData_PDescr::DescrName ******/
		/****** md5 signature: 726678b07d46074a272befd7851786a7 ******/
		%feature("compactdefaultargs") DescrName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the description (type name) to match, for a Described (else, empty string).
") DescrName;
		Standard_CString DescrName();

		/****** StepData_PDescr::EnumMax ******/
		/****** md5 signature: aa737d66db4ab58d09a625e0a52a3fa7 ******/
		%feature("compactdefaultargs") EnumMax;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum integer for a suitable value (count - 1).
") EnumMax;
		Standard_Integer EnumMax();

		/****** StepData_PDescr::EnumText ******/
		/****** md5 signature: 8d101e51207f5b5f1d44b816e2e7ba7d ******/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "
Parameters
----------
val: int

Return
-------
str

Description
-----------
Returns the text which corresponds to a numeric value, between 0 and EnumMax. It is limited by dots.
") EnumText;
		Standard_CString EnumText(const Standard_Integer val);

		/****** StepData_PDescr::EnumValue ******/
		/****** md5 signature: 6c468230915f39b81b0354c088266e55 ******/
		%feature("compactdefaultargs") EnumValue;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
int

Description
-----------
Returns the numeric value found for an enum text The text must be in capitals and limited by dots A non-suitable text gives a negative value to be returned.
") EnumValue;
		Standard_Integer EnumValue(Standard_CString name);

		/****** StepData_PDescr::FieldName ******/
		/****** md5 signature: 8f41dbaec7635486ef27f4b3e9739bb0 ******/
		%feature("compactdefaultargs") FieldName;
		%feature("autodoc", "Return
-------
str

Description
-----------
No available documentation.
") FieldName;
		Standard_CString FieldName();

		/****** StepData_PDescr::FieldRank ******/
		/****** md5 signature: 260020dccf4d2143e00013a5db3a717c ******/
		%feature("compactdefaultargs") FieldRank;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FieldRank;
		Standard_Integer FieldRank();

		/****** StepData_PDescr::IsBoolean ******/
		/****** md5 signature: 1c61622cf353aca7cea3edcb32444564 ******/
		%feature("compactdefaultargs") IsBoolean;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is for a Boolean value (false,true).
") IsBoolean;
		Standard_Boolean IsBoolean();

		/****** StepData_PDescr::IsDerived ******/
		/****** md5 signature: d2591312eb12f8b2e296880e7538bb13 ******/
		%feature("compactdefaultargs") IsDerived;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is Derived.
") IsDerived;
		Standard_Boolean IsDerived();

		/****** StepData_PDescr::IsDescr ******/
		/****** md5 signature: b1bf4641c095adc7bc8f1d2cb1dcf949 ******/
		%feature("compactdefaultargs") IsDescr;
		%feature("autodoc", "
Parameters
----------
descr: StepData_EDescr

Return
-------
bool

Description
-----------
Tells if <self> is for a Described entity of a given EDescr (does this EDescr match description name ?). For late-bnd (works for <self> + nexts if <self> is a Select).
") IsDescr;
		Standard_Boolean IsDescr(const opencascade::handle<StepData_EDescr> & descr);

		/****** StepData_PDescr::IsEntity ******/
		/****** md5 signature: 8a80f2b06c557cd40d0d13dedcde58ff ******/
		%feature("compactdefaultargs") IsEntity;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is for an Entity, either Described or CDL Type.
") IsEntity;
		Standard_Boolean IsEntity();

		/****** StepData_PDescr::IsEnum ******/
		/****** md5 signature: 62faa27f841b1b236729320f804d0ea1 ******/
		%feature("compactdefaultargs") IsEnum;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is for an Enum value Then, call AddEnumDef ordered from the first one (value 0) Managed by an EnumTool.
") IsEnum;
		Standard_Boolean IsEnum();

		/****** StepData_PDescr::IsField ******/
		/****** md5 signature: a67066329d35b56cb15d4ab721c6d976 ******/
		%feature("compactdefaultargs") IsField;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is a Field. Else it is a Type.
") IsField;
		Standard_Boolean IsField();

		/****** StepData_PDescr::IsInteger ******/
		/****** md5 signature: 18ca4dbe35358015c8d493d4befdc431 ******/
		%feature("compactdefaultargs") IsInteger;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is for an Integer.
") IsInteger;
		Standard_Boolean IsInteger();

		/****** StepData_PDescr::IsLogical ******/
		/****** md5 signature: 795b5b4e96a6165e1c72e97010c59da0 ******/
		%feature("compactdefaultargs") IsLogical;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is for a Logical value (false,true,unknown).
") IsLogical;
		Standard_Boolean IsLogical();

		/****** StepData_PDescr::IsOptional ******/
		/****** md5 signature: 9c52f00f8741fdeb63e0063a710dbe63 ******/
		%feature("compactdefaultargs") IsOptional;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is Optional.
") IsOptional;
		Standard_Boolean IsOptional();

		/****** StepData_PDescr::IsReal ******/
		/****** md5 signature: 269b0701cd2deb04ad298cb258c8a221 ******/
		%feature("compactdefaultargs") IsReal;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is for a Real value.
") IsReal;
		Standard_Boolean IsReal();

		/****** StepData_PDescr::IsSelect ******/
		/****** md5 signature: 4fd51ac73ac4f170284ef23b73e8ad10 ******/
		%feature("compactdefaultargs") IsSelect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is for a SELECT.
") IsSelect;
		Standard_Boolean IsSelect();

		/****** StepData_PDescr::IsString ******/
		/****** md5 signature: ac665e4e9c83f465923dced607b01ce2 ******/
		%feature("compactdefaultargs") IsString;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is for a String value.
") IsString;
		Standard_Boolean IsString();

		/****** StepData_PDescr::IsType ******/
		/****** md5 signature: 7f80c69742aac431c8267e8d799e47a0 ******/
		%feature("compactdefaultargs") IsType;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type

Return
-------
bool

Description
-----------
Tells if <self> is for an entity of a given CDL type (early-bnd) (works for <self> + nexts if <self> is a Select).
") IsType;
		Standard_Boolean IsType(const opencascade::handle<Standard_Type> & atype);

		/****** StepData_PDescr::Member ******/
		/****** md5 signature: ca2f280b640e912436a3c96a8631a573 ******/
		%feature("compactdefaultargs") Member;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<StepData_PDescr>

Description
-----------
For a SELECT, returns the member whose name matches <name> To this member, the following question can then be asked Null Handle if <name> not matched or <self> not a SELECT //! Remark: not to be asked for an entity type Hence, following IsInteger .. Enum* only apply on <self> and require Member While IsType applies on <self> and all Select Members.
") Member;
		opencascade::handle<StepData_PDescr> Member(Standard_CString name);

		/****** StepData_PDescr::Name ******/
		/****** md5 signature: 2e8cb64f99d00deafae9c92f20b187a2 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
No available documentation.
") Name;
		Standard_CString Name();

		/****** StepData_PDescr::SetArity ******/
		/****** md5 signature: 19349cb1569c7d2c99201a4b17f62b09 ******/
		%feature("compactdefaultargs") SetArity;
		%feature("autodoc", "
Parameters
----------
arity: int (optional, default to 1)

Return
-------
None

Description
-----------
Directly sets the arity count 0: simple field 1: LIST or ARRAY etc 2: LIST OF LIST.
") SetArity;
		void SetArity(const Standard_Integer arity = 1);

		/****** StepData_PDescr::SetBoolean ******/
		/****** md5 signature: bf9900e4b4fd787ac6b581c7fda7a856 ******/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets <self> for a Boolean value (false,true).
") SetBoolean;
		void SetBoolean();

		/****** StepData_PDescr::SetDerived ******/
		/****** md5 signature: 9093f15053d321b0228c297329293ec1 ******/
		%feature("compactdefaultargs") SetDerived;
		%feature("autodoc", "
Parameters
----------
der: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets/Unsets <self> to be for a derived field.
") SetDerived;
		void SetDerived(const Standard_Boolean der = Standard_True);

		/****** StepData_PDescr::SetDescr ******/
		/****** md5 signature: febac70e45c7821737578180b25b24b9 ******/
		%feature("compactdefaultargs") SetDescr;
		%feature("autodoc", "
Parameters
----------
dscnam: str

Return
-------
None

Description
-----------
Sets <self> for a Described Entity, whose Description must match the type name <dscnam>.
") SetDescr;
		void SetDescr(Standard_CString dscnam);

		/****** StepData_PDescr::SetEnum ******/
		/****** md5 signature: 7f9613aa4cc5debf6e829382aa1b5c8f ******/
		%feature("compactdefaultargs") SetEnum;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets <self> for an Enum value Then, call AddEnumDef ordered from the first one (value 0).
") SetEnum;
		void SetEnum();

		/****** StepData_PDescr::SetField ******/
		/****** md5 signature: 6bd22ff34c7fd8f3fc9a55e0007dcf69 ******/
		%feature("compactdefaultargs") SetField;
		%feature("autodoc", "
Parameters
----------
name: str
rank: int

Return
-------
None

Description
-----------
Sets <self> to describe a field of an entity With a name and a rank.
") SetField;
		void SetField(Standard_CString name, const Standard_Integer rank);

		/****** StepData_PDescr::SetFrom ******/
		/****** md5 signature: 3627e9a1276d95210a26b8aa1638d208 ******/
		%feature("compactdefaultargs") SetFrom;
		%feature("autodoc", "
Parameters
----------
other: StepData_PDescr

Return
-------
None

Description
-----------
Sets <self> as <other> but duplicated Hence, some definition may be changed.
") SetFrom;
		void SetFrom(const opencascade::handle<StepData_PDescr> & other);

		/****** StepData_PDescr::SetInteger ******/
		/****** md5 signature: e1340539d89f56fa251bab142a434314 ******/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets <self> for an Integer value.
") SetInteger;
		void SetInteger();

		/****** StepData_PDescr::SetLogical ******/
		/****** md5 signature: 0ed991860fa7270d7086e934aeee16d1 ******/
		%feature("compactdefaultargs") SetLogical;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets <self> for a Logical value (false,true,unknown).
") SetLogical;
		void SetLogical();

		/****** StepData_PDescr::SetMemberName ******/
		/****** md5 signature: a28ff59c1912e38954636701e39eb710 ******/
		%feature("compactdefaultargs") SetMemberName;
		%feature("autodoc", "
Parameters
----------
memname: str

Return
-------
None

Description
-----------
Sets a name for SELECT member. To be used if a member is for an immediate type.
") SetMemberName;
		void SetMemberName(Standard_CString memname);

		/****** StepData_PDescr::SetName ******/
		/****** md5 signature: 208d3e507b11ad1eb22d3afd35f96209 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(Standard_CString name);

		/****** StepData_PDescr::SetOptional ******/
		/****** md5 signature: 205ea788b56cdff70243eaa68a2bc517 ******/
		%feature("compactdefaultargs") SetOptional;
		%feature("autodoc", "
Parameters
----------
opt: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets/Unsets <self> to accept undefined values.
") SetOptional;
		void SetOptional(const Standard_Boolean opt = Standard_True);

		/****** StepData_PDescr::SetReal ******/
		/****** md5 signature: 2ce6cd0118626db593edb228dd1788f0 ******/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets <self> for a Real value.
") SetReal;
		void SetReal();

		/****** StepData_PDescr::SetSelect ******/
		/****** md5 signature: 377ef062747bc63962788d18f4bf5f38 ******/
		%feature("compactdefaultargs") SetSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Declares this PDescr to be a Select, hence to have members <self> itself can be the first member.
") SetSelect;
		void SetSelect();

		/****** StepData_PDescr::SetString ******/
		/****** md5 signature: 99c33365649fd9c8a2496f1650081785 ******/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets <self> for a String value.
") SetString;
		void SetString();

		/****** StepData_PDescr::SetType ******/
		/****** md5 signature: a055014cd5b5c6a10713677ab0eb36a8 ******/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type

Return
-------
None

Description
-----------
Sets <self> for an Entity which must match a Type (early-bound).
") SetType;
		void SetType(const opencascade::handle<Standard_Type> & atype);

		/****** StepData_PDescr::Simple ******/
		/****** md5 signature: 6400b5325f2d5a6efd9d4a6c1b35bb86 ******/
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_PDescr>

Description
-----------
For a LIST or LIST OF LIST, Returns the PDescr for the simpler PDescr. Else, returns <self> This allows to have different attributes for Optional for instance, on a field, and on the parameter of a LIST: [OPTIONAL] LIST OF [OPTIONAL] ...
") Simple;
		opencascade::handle<StepData_PDescr> Simple();

		/****** StepData_PDescr::Type ******/
		/****** md5 signature: cd11500a4cd5f0e491d7fd0933c498fe ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the type to match (IsKind), for a CDL Entity (else, null handle).
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
		/****** StepData_Protocol::StepData_Protocol ******/
		/****** md5 signature: 2cf9b8cf1a61a623756de3478ffe45c8 ******/
		%feature("compactdefaultargs") StepData_Protocol;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepData_Protocol;
		 StepData_Protocol();

		/****** StepData_Protocol::AddBasicDescr ******/
		/****** md5 signature: d611384ca1b0668e2622fbc3f09c3588 ******/
		%feature("compactdefaultargs") AddBasicDescr;
		%feature("autodoc", "
Parameters
----------
esdescr: StepData_ESDescr

Return
-------
None

Description
-----------
Records an ESDescr, intended to build complex descriptions.
") AddBasicDescr;
		void AddBasicDescr(const opencascade::handle<StepData_ESDescr> & esdescr);

		/****** StepData_Protocol::AddDescr ******/
		/****** md5 signature: c81121b35247ced8e3cc3e849be40fe4 ******/
		%feature("compactdefaultargs") AddDescr;
		%feature("autodoc", "
Parameters
----------
adescr: StepData_EDescr
CN: int

Return
-------
None

Description
-----------
Records an EDescr with its case number Also records its name for an ESDescr (simple type): an ESDescr is then used, for case number, or for type name.
") AddDescr;
		void AddDescr(const opencascade::handle<StepData_EDescr> & adescr, const Standard_Integer CN);

		/****** StepData_Protocol::AddPDescr ******/
		/****** md5 signature: 0b7907fa8b298bf81503a93005ad302f ******/
		%feature("compactdefaultargs") AddPDescr;
		%feature("autodoc", "
Parameters
----------
pdescr: StepData_PDescr

Return
-------
None

Description
-----------
Records an PDescr.
") AddPDescr;
		void AddPDescr(const opencascade::handle<StepData_PDescr> & pdescr);

		/****** StepData_Protocol::BasicDescr ******/
		/****** md5 signature: ea145ef73c875ad092784f773a0ec92e ******/
		%feature("compactdefaultargs") BasicDescr;
		%feature("autodoc", "
Parameters
----------
name: str
anylevel: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<StepData_EDescr>

Description
-----------
Returns a basic description according to its name <anylevel> True (D): for <self> and its resources <anylevel> False: for <self> only.
") BasicDescr;
		opencascade::handle<StepData_EDescr> BasicDescr(Standard_CString name, const Standard_Boolean anylevel = Standard_True);

		/****** StepData_Protocol::CaseNumber ******/
		/****** md5 signature: d6b7e103ec41af298dd6803be8908a5e ******/
		%feature("compactdefaultargs") CaseNumber;
		%feature("autodoc", "
Parameters
----------
obj: Standard_Transient

Return
-------
int

Description
-----------
Returns a unique positive number for any recognized entity Redefined to work by calling both TypeNumber and, for a Described Entity (late binding) DescrNumber.
") CaseNumber;
		virtual Standard_Integer CaseNumber(const opencascade::handle<Standard_Transient> & obj);

		/****** StepData_Protocol::Descr ******/
		/****** md5 signature: bc229387d2901cc0869d62058998449b ******/
		%feature("compactdefaultargs") Descr;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepData_EDescr>

Description
-----------
Returns the description attached to a case number, or null.
") Descr;
		opencascade::handle<StepData_EDescr> Descr(const Standard_Integer num);

		/****** StepData_Protocol::Descr ******/
		/****** md5 signature: a64b4d396209a530eae12437dcc7dd4b ******/
		%feature("compactdefaultargs") Descr;
		%feature("autodoc", "
Parameters
----------
name: str
anylevel: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<StepData_EDescr>

Description
-----------
Returns a description according to its name <anylevel> True (D): for <self> and its resources <anylevel> False: for <self> only.
") Descr;
		opencascade::handle<StepData_EDescr> Descr(Standard_CString name, const Standard_Boolean anylevel = Standard_True);

		/****** StepData_Protocol::DescrNumber ******/
		/****** md5 signature: 6654ae9b30db0b05d98cad2dcce64330 ******/
		%feature("compactdefaultargs") DescrNumber;
		%feature("autodoc", "
Parameters
----------
adescr: StepData_EDescr

Return
-------
int

Description
-----------
Returns a unique positive CaseNumber for types described by an EDescr (late binding) Warning: TypeNumber and DescrNumber must give together a unique positive case number for each distinct case, type or descr.
") DescrNumber;
		virtual Standard_Integer DescrNumber(const opencascade::handle<StepData_EDescr> & adescr);

		/****** StepData_Protocol::ECDescr ******/
		/****** md5 signature: 3e7da9805ec51804b1b8459683d6d65e ******/
		%feature("compactdefaultargs") ECDescr;
		%feature("autodoc", "
Parameters
----------
names: TColStd_SequenceOfAsciiString
anylevel: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<StepData_ECDescr>

Description
-----------
Returns a complex description according to list of names <anylevel> True (D): for <self> and its resources <anylevel> False: for <self> only.
") ECDescr;
		opencascade::handle<StepData_ECDescr> ECDescr(const TColStd_SequenceOfAsciiString & names, const Standard_Boolean anylevel = Standard_True);

		/****** StepData_Protocol::ESDescr ******/
		/****** md5 signature: 805abe23f6acecedb762c8bd132622f4 ******/
		%feature("compactdefaultargs") ESDescr;
		%feature("autodoc", "
Parameters
----------
name: str
anylevel: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<StepData_ESDescr>

Description
-----------
Idem as Descr but cast to simple description.
") ESDescr;
		opencascade::handle<StepData_ESDescr> ESDescr(Standard_CString name, const Standard_Boolean anylevel = Standard_True);

		/****** StepData_Protocol::HasDescr ******/
		/****** md5 signature: bf5be80666d0e25b04a7537155317256 ******/
		%feature("compactdefaultargs") HasDescr;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if a Protocol brings at least one ESDescr, i.e. if it defines at least one entity description by ESDescr mechanism.
") HasDescr;
		Standard_Boolean HasDescr();

		/****** StepData_Protocol::IsSuitableModel ******/
		/****** md5 signature: 3a7d76487f7ffeaa887a18b03ce0e06c ******/
		%feature("compactdefaultargs") IsSuitableModel;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel

Return
-------
bool

Description
-----------
Returns True if <model> is a Model of Step Norm.
") IsSuitableModel;
		Standard_Boolean IsSuitableModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** StepData_Protocol::IsUnknownEntity ******/
		/****** md5 signature: cec9bde85b0ea68f8042a2f3f4f9c29b ******/
		%feature("compactdefaultargs") IsUnknownEntity;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
bool

Description
-----------
Returns True if <ent> is an Unknown Entity for the Norm, i.e. Type UndefinedEntity, status Unknown.
") IsUnknownEntity;
		Standard_Boolean IsUnknownEntity(const opencascade::handle<Standard_Transient> & ent);

		/****** StepData_Protocol::NbResources ******/
		/****** md5 signature: e09215dfaa5a4c92d70662499182122c ******/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the count of Protocols used as Resource (can be zero) Here, No resource.
") NbResources;
		Standard_Integer NbResources();

		/****** StepData_Protocol::NewModel ******/
		/****** md5 signature: 91513f9ebe9e7d52eca2b6b58f6b9b0a ******/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Creates an empty Model for Step Norm.
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****** StepData_Protocol::PDescr ******/
		/****** md5 signature: 2abe2851749e0ea2ddeef19dbac17487 ******/
		%feature("compactdefaultargs") PDescr;
		%feature("autodoc", "
Parameters
----------
name: str
anylevel: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<StepData_PDescr>

Description
-----------
Returns a parameter description according to its name <anylevel> True (D): for <self> and its resources <anylevel> False: for <self> only.
") PDescr;
		opencascade::handle<StepData_PDescr> PDescr(Standard_CString name, const Standard_Boolean anylevel = Standard_True);

		/****** StepData_Protocol::Resource ******/
		/****** md5 signature: d60e6fb01254af21c091aa5baad80e74 ******/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns a Resource, given a rank. Here, none.
") Resource;
		opencascade::handle<Interface_Protocol> Resource(const Standard_Integer num);

		/****** StepData_Protocol::SchemaName ******/
		/****** md5 signature: 9b6562a0bce45ba741d1284ad388153f ******/
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "
Parameters
----------
theModel: Interface_InterfaceModel

Return
-------
str

Description
-----------
Returns the Schema Name attached to each class of Protocol To be redefined by each sub-class Here, SchemaName returns '(DEFAULT)' was C++: return const.
") SchemaName;
		virtual Standard_CString SchemaName(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****** StepData_Protocol::TypeNumber ******/
		/****** md5 signature: c141bcfd5e7e4d36c0619b6951ddde94 ******/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type

Return
-------
int

Description
-----------
Returns a Case Number, specific of each recognized Type Here, only Unknown Entity is recognized.
") TypeNumber;
		Standard_Integer TypeNumber(const opencascade::handle<Standard_Type> & atype);

		/****** StepData_Protocol::UnknownEntity ******/
		/****** md5 signature: 201f936eaa0d5d272733a19cbe8e2fa3 ******/
		%feature("compactdefaultargs") UnknownEntity;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Creates a new Unknown Entity for Step (UndefinedEntity).
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
		/****** StepData_ReadWriteModule::CaseNum ******/
		/****** md5 signature: 9879d2c99e315f91c57304d23ffeaef0 ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
data: Interface_FileReaderData
num: int

Return
-------
int

Description
-----------
Translate the Type of record <num> in <data> to a positive Case Number, or 0 if failed. Works with a StepReaderData, in which the Type of an Entity is defined as a String: Reads the RecordType <num> then calls CaseNum (this type) Warning: The methods CaseStep, StepType and Recognize, must be in phase (triplets CaseNum-StepType-Type of Object).
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Interface_FileReaderData> & data, const Standard_Integer num);

		/****** StepData_ReadWriteModule::CaseStep ******/
		/****** md5 signature: 7e65e4b4a69664f65e970d967f008708 ******/
		%feature("compactdefaultargs") CaseStep;
		%feature("autodoc", "
Parameters
----------
atype: str

Return
-------
int

Description
-----------
Defines Case Numbers corresponding to the recognized Types Called by CaseNum (data,num) above for a Simple Type Entity Warning: CaseStep must give the same Value as Protocol does for the Entity type which corresponds to this Type given as a String.
") CaseStep;
		virtual Standard_Integer CaseStep(TCollection_AsciiString atype);

		/****** StepData_ReadWriteModule::CaseStep ******/
		/****** md5 signature: d9651ca055fd2343fe45b2e5d648493f ******/
		%feature("compactdefaultargs") CaseStep;
		%feature("autodoc", "
Parameters
----------
types: TColStd_SequenceOfAsciiString

Return
-------
int

Description
-----------
Same a above but for a Complex Type Entity ('Plex') The provided Default recognizes nothing.
") CaseStep;
		virtual Standard_Integer CaseStep(const TColStd_SequenceOfAsciiString & types);

		/****** StepData_ReadWriteModule::ComplexType ******/
		/****** md5 signature: 52df8730ab1b7428b731404043419d5e ******/
		%feature("compactdefaultargs") ComplexType;
		%feature("autodoc", "
Parameters
----------
CN: int
types: TColStd_SequenceOfAsciiString

Return
-------
bool

Description
-----------
Function specific to STEP, which delivers the list of types which corresponds to a complex type. If <CN> is not for a complex type, this method returns False. Else it returns True and fills the list in alphabetic order. The default returns False. To be redefined as required.
") ComplexType;
		virtual Standard_Boolean ComplexType(const Standard_Integer CN, TColStd_SequenceOfAsciiString & types);

		/****** StepData_ReadWriteModule::IsComplex ******/
		/****** md5 signature: f69d23266f548cbef58466865b56b793 ******/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "
Parameters
----------
CN: int

Return
-------
bool

Description
-----------
Returns True if the Case Number corresponds to a Complex Type ('Plex'). Remember that all possible combinations must be acknowledged to be processed Default is False for all cases. For a Protocol which defines possible Plexes, this method must be redefined.
") IsComplex;
		virtual Standard_Boolean IsComplex(const Standard_Integer CN);

		/****** StepData_ReadWriteModule::Read ******/
		/****** md5 signature: 42ded38f13a0a591a94dfdfbbc6644f7 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
CN: int
data: Interface_FileReaderData
num: int
ach: Interface_Check
ent: Standard_Transient

Return
-------
None

Description
-----------
General Read Function, calls ReadStep.
") Read;
		void Read(const Standard_Integer CN, const opencascade::handle<Interface_FileReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<Standard_Transient> & ent);

		/****** StepData_ReadWriteModule::ReadStep ******/
		/****** md5 signature: 7827cf6d9624cefa436418259cfad082 ******/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "
Parameters
----------
CN: int
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: Standard_Transient

Return
-------
None

Description
-----------
Specific Read Function. Works with StepReaderData.
") ReadStep;
		virtual void ReadStep(const Standard_Integer CN, const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<Standard_Transient> & ent);

		/****** StepData_ReadWriteModule::ShortType ******/
		/****** md5 signature: feccc5d77de5a4efd2ff9c32c681670d ******/
		%feature("compactdefaultargs") ShortType;
		%feature("autodoc", "
Parameters
----------
CN: int

Return
-------
TCollection_AsciiString

Description
-----------
Function specific to STEP. Some STEP Types have a short form This method can be redefined to fill it By default, returns an empty string, which is then interpreted to take normal form from StepType.
") ShortType;
		virtual TCollection_AsciiString ShortType(const Standard_Integer CN);

		/****** StepData_ReadWriteModule::StepType ******/
		/****** md5 signature: 8a1b15e32146e0e72c4fad9883c71bc2 ******/
		%feature("compactdefaultargs") StepType;
		%feature("autodoc", "
Parameters
----------
CN: int

Return
-------
TCollection_AsciiString

Description
-----------
Function specific to STEP, which delivers the StepType as it is recorded in and read from a File compliant with STEP. This method is symmetric to the method CaseStep. StepType can be different from Dynamic Type's name, but belongs to the same class of Object. Returns an empty String if <CN> is zero. Warning: For a Complex Type Entity, returns an Empty String (Complex Type must be managed by users).
") StepType;
		virtual const TCollection_AsciiString & StepType(const Standard_Integer CN);

		/****** StepData_ReadWriteModule::WriteStep ******/
		/****** md5 signature: 986769118432b0fa4d7f4b1c81f028e4 ******/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "
Parameters
----------
CN: int
SW: StepData_StepWriter
ent: Standard_Transient

Return
-------
None

Description
-----------
Write Function, switched by CaseNum.
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
		/****** StepData_SelectMember::StepData_SelectMember ******/
		/****** md5 signature: 2292c13b9da063b7c1d0c247f6a5c45b ******/
		%feature("compactdefaultargs") StepData_SelectMember;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepData_SelectMember;
		 StepData_SelectMember();

		/****** StepData_SelectMember::Boolean ******/
		/****** md5 signature: 39ad0909384672336008a4c3e79f7717 ******/
		%feature("compactdefaultargs") Boolean;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Boolean;
		Standard_Boolean Boolean();

		/****** StepData_SelectMember::Enum ******/
		/****** md5 signature: 75bb761a19f6ce89aca919b1b06fddaf ******/
		%feature("compactdefaultargs") Enum;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Enum;
		Standard_Integer Enum();

		/****** StepData_SelectMember::EnumText ******/
		/****** md5 signature: 621a527a92778ae4fa5cff824a2c2790 ******/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "Return
-------
str

Description
-----------
No available documentation.
") EnumText;
		virtual Standard_CString EnumText();

		/****** StepData_SelectMember::HasName ******/
		/****** md5 signature: a74e6ea53e000ac8d5a7eb1d6d14b850 ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if a SelectMember has a name. Default is False.
") HasName;
		virtual Standard_Boolean HasName();

		/****** StepData_SelectMember::Int ******/
		/****** md5 signature: f27438da77305a243726a9826a63a916 ******/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "Return
-------
int

Description
-----------
This internal method gives access to a value implemented by an Integer (to read it).
") Int;
		virtual Standard_Integer Int();

		/****** StepData_SelectMember::Integer ******/
		/****** md5 signature: 5ca25bbf05344000d69837c81499cc7b ******/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gets the value as an Integer.
") Integer;
		Standard_Integer Integer();

		/****** StepData_SelectMember::Kind ******/
		/****** md5 signature: 5771a64a3f3c102cd68a48415bbe33eb ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Kind;
		virtual Standard_Integer Kind();

		/****** StepData_SelectMember::Logical ******/
		/****** md5 signature: f59f41b2208e1bd65bb2ef13de48dac8 ******/
		%feature("compactdefaultargs") Logical;
		%feature("autodoc", "Return
-------
StepData_Logical

Description
-----------
No available documentation.
") Logical;
		StepData_Logical Logical();

		/****** StepData_SelectMember::Matches ******/
		/****** md5 signature: c9d1ea3408c59311e6e40d3891575d93 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Tells if the name of a SelectMember matches a given one By default, compares the strings, can be redefined (optimised).
") Matches;
		virtual Standard_Boolean Matches(Standard_CString name);

		/****** StepData_SelectMember::Name ******/
		/****** md5 signature: 4bbe2b58331ae651e1fa6526c574b2e9 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the name of a SelectMember. Default is empty.
") Name;
		virtual Standard_CString Name();

		/****** StepData_SelectMember::ParamType ******/
		/****** md5 signature: dc18453a4564d25585accbb5ebf0a4f7 ******/
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "Return
-------
Interface_ParamType

Description
-----------
Returns the Kind of the SelectMember, under the form of an enum ParamType.
") ParamType;
		Interface_ParamType ParamType();

		/****** StepData_SelectMember::Real ******/
		/****** md5 signature: 30595f985b2d3d2d1b6c5cccc0b83aad ******/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Real;
		virtual Standard_Real Real();

		/****** StepData_SelectMember::SetBoolean ******/
		/****** md5 signature: 59873555daddcc9f684733208feeb7c7 ******/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "
Parameters
----------
val: bool

Return
-------
None

Description
-----------
No available documentation.
") SetBoolean;
		void SetBoolean(const Standard_Boolean val);

		/****** StepData_SelectMember::SetEnum ******/
		/****** md5 signature: 758f07821669833e2be91cd8731e45df ******/
		%feature("compactdefaultargs") SetEnum;
		%feature("autodoc", "
Parameters
----------
val: int
text: str (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") SetEnum;
		void SetEnum(const Standard_Integer val, Standard_CString text = "");

		/****** StepData_SelectMember::SetEnumText ******/
		/****** md5 signature: 6e5583fdb08591f7e8f8f226898b0d67 ******/
		%feature("compactdefaultargs") SetEnumText;
		%feature("autodoc", "
Parameters
----------
val: int
text: str

Return
-------
None

Description
-----------
No available documentation.
") SetEnumText;
		virtual void SetEnumText(const Standard_Integer val, Standard_CString text);

		/****** StepData_SelectMember::SetInt ******/
		/****** md5 signature: 289060698bf307997261972a524e768b ******/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "
Parameters
----------
val: int

Return
-------
None

Description
-----------
This internal method gives access to a value implemented by an Integer (to set it).
") SetInt;
		virtual void SetInt(const Standard_Integer val);

		/****** StepData_SelectMember::SetInteger ******/
		/****** md5 signature: dc131391f0aa1bd4afb803faec59f9d3 ******/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "
Parameters
----------
val: int

Return
-------
None

Description
-----------
No available documentation.
") SetInteger;
		void SetInteger(const Standard_Integer val);

		/****** StepData_SelectMember::SetKind ******/
		/****** md5 signature: 5e6fd09fa87a3b96c34121bb6afbd92b ******/
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "
Parameters
----------
kind: int

Return
-------
None

Description
-----------
No available documentation.
") SetKind;
		virtual void SetKind(const Standard_Integer kind);

		/****** StepData_SelectMember::SetLogical ******/
		/****** md5 signature: 5e18a3dde7de2dd23dd820298e9ddccb ******/
		%feature("compactdefaultargs") SetLogical;
		%feature("autodoc", "
Parameters
----------
val: StepData_Logical

Return
-------
None

Description
-----------
No available documentation.
") SetLogical;
		void SetLogical(const StepData_Logical val);

		/****** StepData_SelectMember::SetName ******/
		/****** md5 signature: 4188498b2a6d9bd915c04353feb3a32a ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Sets the name of a SelectMember, returns True if done, False if no name is allowed Default does nothing and returns False.
") SetName;
		virtual Standard_Boolean SetName(Standard_CString name);

		/****** StepData_SelectMember::SetReal ******/
		/****** md5 signature: ead3399bdee9d33e972dd778e9163719 ******/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "
Parameters
----------
val: float

Return
-------
None

Description
-----------
No available documentation.
") SetReal;
		virtual void SetReal(const Standard_Real val);

		/****** StepData_SelectMember::SetString ******/
		/****** md5 signature: ac1c534ccd534f94fa88320cb774264e ******/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "
Parameters
----------
val: str

Return
-------
None

Description
-----------
No available documentation.
") SetString;
		virtual void SetString(Standard_CString val);

		/****** StepData_SelectMember::String ******/
		/****** md5 signature: 2ee5f6c9286e147f38695747c263fc79 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
str

Description
-----------
No available documentation.
") String;
		virtual Standard_CString String();

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
		/****** StepData_SelectType::Boolean ******/
		/****** md5 signature: 39ad0909384672336008a4c3e79f7717 ******/
		%feature("compactdefaultargs") Boolean;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Boolean;
		Standard_Boolean Boolean();

		/****** StepData_SelectType::CaseMem ******/
		/****** md5 signature: a17454a8505683177bac9d5e4faa1d1d ******/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "
Parameters
----------
ent: StepData_SelectMember

Return
-------
int

Description
-----------
Recognize a SelectMember (kind, name). Returns a positive value which identifies the case in the List of immediate cases (distinct from the List of Entity Types). Zero if not recognizes Default returns 0, saying that no immediate value is allowed.
") CaseMem;
		virtual Standard_Integer CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepData_SelectType::CaseMember ******/
		/****** md5 signature: 294b9f6dec0f6b31d757999adcb36171 ******/
		%feature("compactdefaultargs") CaseMember;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Type of the stored SelectMember, or zero if it is Null or Entity. Calls the method CaseMem on Value.
") CaseMember;
		Standard_Integer CaseMember();

		/****** StepData_SelectType::CaseNum ******/
		/****** md5 signature: 4f0e8f8256342e77e3423e91317a1579 ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes the Type of an Entity. Returns a positive Number which identifies the Type in the definition List of the SelectType. Returns Zero if its Type in not in this List.
") CaseNum;
		virtual Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepData_SelectType::CaseNumber ******/
		/****** md5 signature: 31aa5fdc8212555fb0e3cbfc4b1bab59 ******/
		%feature("compactdefaultargs") CaseNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Recognizes the Type of the stored Entity, or zero if it is Null or SelectMember. Calls the first method CaseNum on Value.
") CaseNumber;
		Standard_Integer CaseNumber();

		/****** StepData_SelectType::Description ******/
		/****** md5 signature: f04ac39845446a6fa87e1ea8e37c7bbc ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_PDescr>

Description
-----------
Returns the Description which corresponds to <self> Null if no specific description to give. This description is used to control reading an check validity. Default returns a Null Handle, i.e. undefined description It can suffice if CaseNum and CaseMem give enough control.
") Description;
		virtual opencascade::handle<StepData_PDescr> Description();

		/****** StepData_SelectType::Int ******/
		/****** md5 signature: 1413d7ff960425ad93b46a46cdc240ec ******/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "Return
-------
int

Description
-----------
This internal method gives access to a value implemented by an Integer (to read it).
") Int;
		Standard_Integer Int();

		/****** StepData_SelectType::Integer ******/
		/****** md5 signature: 5ca25bbf05344000d69837c81499cc7b ******/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gets the value as an Integer.
") Integer;
		Standard_Integer Integer();

		/****** StepData_SelectType::IsNull ******/
		/****** md5 signature: eab2964eabd2f0636e5f767661fb72a9 ******/
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is no Stored Entity (i.e. it is Null).
") IsNull;
		Standard_Boolean IsNull();

		/****** StepData_SelectType::Logical ******/
		/****** md5 signature: f59f41b2208e1bd65bb2ef13de48dac8 ******/
		%feature("compactdefaultargs") Logical;
		%feature("autodoc", "Return
-------
StepData_Logical

Description
-----------
No available documentation.
") Logical;
		StepData_Logical Logical();

		/****** StepData_SelectType::Matches ******/
		/****** md5 signature: a158768991d394ac27eba9f2e3ebe357 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
bool

Description
-----------
Returns True if the Type of an Entity complies with the definition list of the SelectType. Also checks for a SelectMember Default Implementation looks for CaseNum or CaseMem positive.
") Matches;
		Standard_Boolean Matches(const opencascade::handle<Standard_Transient> & ent);

		/****** StepData_SelectType::Member ******/
		/****** md5 signature: 29604dad95e12947007c79462435d631 ******/
		%feature("compactdefaultargs") Member;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns Value as a SelectMember. Null if not a SelectMember.
") Member;
		opencascade::handle<StepData_SelectMember> Member();

		/****** StepData_SelectType::NewMember ******/
		/****** md5 signature: e442139cb2cd542e64d2d09b020c5078 ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a preferred SelectMember. Default returns a Null By default, a SelectMember can be set according to data type and Name: it is a SelectNamed if Name is defined //! This method allows to define, for a specific SelectType, a specific SelectMember than SelectNamed. For instance for a Real plus a Name, a SelectReal plus a case number is a good solution, lighter than SelectNamed which is very multipurpose.
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember();

		/****** StepData_SelectType::Nullify ******/
		/****** md5 signature: 1915d5159e87738b7b9af9d5accf4c6e ******/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "Return
-------
None

Description
-----------
Nullifies the Stored Entity.
") Nullify;
		void Nullify();

		/****** StepData_SelectType::Real ******/
		/****** md5 signature: 181e92704b7f1e346dc134d4b9adb5a7 ******/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Real;
		Standard_Real Real();

		/****** StepData_SelectType::SelectName ******/
		/****** md5 signature: 24088194cbf01ec376461d167baf80e1 ******/
		%feature("compactdefaultargs") SelectName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the type name of SelectMember. If no SelectMember or with no type name, returns an empty string To change it, pass through the SelectMember itself.
") SelectName;
		Standard_CString SelectName();

		/****** StepData_SelectType::SetBoolean ******/
		/****** md5 signature: 4c36e531ab59ebb4eac7bfea6d026b1b ******/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "
Parameters
----------
val: bool
name: str (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") SetBoolean;
		void SetBoolean(const Standard_Boolean val, Standard_CString name = "");

		/****** StepData_SelectType::SetInt ******/
		/****** md5 signature: dcaa71e8d1c44545b3a4bd91a6b8e118 ******/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "
Parameters
----------
val: int

Return
-------
None

Description
-----------
This internal method gives access to a value implemented by an Integer (to set it): a SelectMember MUST ALREADY BE THERE !.
") SetInt;
		void SetInt(const Standard_Integer val);

		/****** StepData_SelectType::SetInteger ******/
		/****** md5 signature: 641c279fb96673f3ceb40811e8a55e66 ******/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "
Parameters
----------
val: int
name: str (optional, default to "")

Return
-------
None

Description
-----------
Sets a new Integer value, with an optional type name Warning: If a SelectMember is already set, works on it: value and name must then be accepted by this SelectMember.
") SetInteger;
		void SetInteger(const Standard_Integer val, Standard_CString name = "");

		/****** StepData_SelectType::SetLogical ******/
		/****** md5 signature: 8b08112ac196caf89d73cb41e1657d45 ******/
		%feature("compactdefaultargs") SetLogical;
		%feature("autodoc", "
Parameters
----------
val: StepData_Logical
name: str (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") SetLogical;
		void SetLogical(const StepData_Logical val, Standard_CString name = "");

		/****** StepData_SelectType::SetReal ******/
		/****** md5 signature: 235b28f168469ea4a0d3160bc30cf516 ******/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "
Parameters
----------
val: float
name: str (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") SetReal;
		void SetReal(const Standard_Real val, Standard_CString name = "");

		/****** StepData_SelectType::SetValue ******/
		/****** md5 signature: a322c71f7e82fac78b60be1e7fcd4248 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
None

Description
-----------
Stores an Entity. This allows to define a specific SelectType class with one read method per member Type, which returns the Value casted with the good Type.
") SetValue;
		void SetValue(const opencascade::handle<Standard_Transient> & ent);

		/****** StepData_SelectType::Type ******/
		/****** md5 signature: cd11500a4cd5f0e491d7fd0933c498fe ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the Effective (Dynamic) Type of the Stored Entity If it is Null, returns TYPE(Transient).
") Type;
		opencascade::handle<Standard_Type> Type();

		/****** StepData_SelectType::Value ******/
		/****** md5 signature: b1443f8da90189a74241bf586c57fc63 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the Stored Entity. Can be used to define specific read methods (see above).
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
		/****** StepData_StepDumper::StepData_StepDumper ******/
		/****** md5 signature: 9deee2e0f03885b6991eac045d3bff49 ******/
		%feature("compactdefaultargs") StepData_StepDumper;
		%feature("autodoc", "
Parameters
----------
amodel: StepData_StepModel
protocol: StepData_Protocol
mode: int (optional, default to 0)

Return
-------
None

Description
-----------
Creates a StepDumper, able to work on a given StepModel (which defines the total scope for dumping entities) and a given Protocol from Step (which defines the authorized types to be dumped) <mode> commands what is to be displayed (number or label) 0 for number (and corresponding labels are displayed apart) 1 for label (and corresponding numbers are displayed apart) 2 for label without anymore.
") StepData_StepDumper;
		 StepData_StepDumper(const opencascade::handle<StepData_StepModel> & amodel, const opencascade::handle<StepData_Protocol> & protocol, const Standard_Integer mode = 0);

		/****** StepData_StepDumper::Dump ******/
		/****** md5 signature: 51a252c8de81ad50ec4845852573a9a5 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
level: int

Return
-------
S: Standard_OStream

Description
-----------
Dumps a Entity on an Messenger. Returns True if success, False, if the entity to dump has not been recognized by the Protocol. <level> can have one of these values: - 0: prints the TYPE only, as known in STEP Files (StepType) If <ent> has not been regognized by the Protocol, or if its type is Complex, the StepType is replaced by the display of the cdl type. Complex Type are well processed by level 1. - 1: dumps the entity, completely (whatever it has simple or complex type) but alone. - 2: dumps the entity completely, plus the item its refers to at first level (a header message designates the starting entity of the dump) <Lists Shared and Implied> - 3: dumps the entity and its referred items at any levels //! For levels 1,2,3, the numbers displayed (form #nnn) are the numbers of the corresponding entities in the Model.
") Dump;
		Standard_Boolean Dump(std::ostream &OutValue, const opencascade::handle<Standard_Transient> & ent, const Standard_Integer level);

		/****** StepData_StepDumper::Dump ******/
		/****** md5 signature: 2c2fad53a5ea53ff96aa2a4598e4e028 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
num: int
level: int

Return
-------
S: Standard_OStream

Description
-----------
Works as Dump with a Transient, but directly takes the entity designated by its number in the Model Returns False, also if <num> is out of range.
") Dump;
		Standard_Boolean Dump(std::ostream &OutValue, const Standard_Integer num, const Standard_Integer level);

		/****** StepData_StepDumper::StepWriter ******/
		/****** md5 signature: 96c8201dd445aa612be97bdda77742fe ******/
		%feature("compactdefaultargs") StepWriter;
		%feature("autodoc", "Return
-------
StepData_StepWriter

Description
-----------
Gives an access to the tool which is used to work: this allow to acts on some parameters: Floating Format, Scopes ...
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
		/****** StepData_StepModel::StepData_StepModel ******/
		/****** md5 signature: c99203119f72afa543e25ef26579062e ******/
		%feature("compactdefaultargs") StepData_StepModel;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty STEP model with an empty header.
") StepData_StepModel;
		 StepData_StepModel();

		/****** StepData_StepModel::AddHeaderEntity ******/
		/****** md5 signature: 47586b12b5398e3b40311ebe30fc917e ******/
		%feature("compactdefaultargs") AddHeaderEntity;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
None

Description
-----------
Adds an Entity to the Header.
") AddHeaderEntity;
		void AddHeaderEntity(const opencascade::handle<Standard_Transient> & ent);

		/****** StepData_StepModel::ClearHeader ******/
		/****** md5 signature: e0fe665687ba246130521f416ab14715 ******/
		%feature("compactdefaultargs") ClearHeader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the Header.
") ClearHeader;
		void ClearHeader();

		/****** StepData_StepModel::ClearLabels ******/
		/****** md5 signature: 3045f499e790e0fc2a95acdb522f6ec7 ******/
		%feature("compactdefaultargs") ClearLabels;
		%feature("autodoc", "Return
-------
None

Description
-----------
erases specific labels, i.e. clears the map (entity-ident).
") ClearLabels;
		void ClearLabels();

		/****** StepData_StepModel::DumpHeader ******/
		/****** md5 signature: 56f8df745054635fd7397075063f4387 ******/
		%feature("compactdefaultargs") DumpHeader;
		%feature("autodoc", "
Parameters
----------
level: int (optional, default to 0)

Return
-------
S: Standard_OStream

Description
-----------
Dumps the Header, with the Header Protocol of StepData. If the Header Protocol is not defined, for each Header Entity, prints its Type. Else sends the Header under the form of HEADER Section of an Ascii Step File <level> is not used because Header is not so big.
") DumpHeader;
		void DumpHeader(std::ostream &OutValue, const Standard_Integer level = 0);

		/****** StepData_StepModel::Entity ******/
		/****** md5 signature: 1676edef20e54d8138d1f2a308537826 ******/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
returns entity given its rank. Same as InterfaceEntity, but with a shorter name.
") Entity;
		opencascade::handle<Standard_Transient> Entity(const Standard_Integer num);

		/****** StepData_StepModel::GetFromAnother ******/
		/****** md5 signature: 07f4171563413e184028d7c8759ed71c ******/
		%feature("compactdefaultargs") GetFromAnother;
		%feature("autodoc", "
Parameters
----------
other: Interface_InterfaceModel

Return
-------
None

Description
-----------
gets header from another Model (uses Header Protocol).
") GetFromAnother;
		void GetFromAnother(const opencascade::handle<Interface_InterfaceModel> & other);

		/****** StepData_StepModel::HasHeaderEntity ******/
		/****** md5 signature: b89a0a364c711932b6d01b56cee77906 ******/
		%feature("compactdefaultargs") HasHeaderEntity;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type

Return
-------
bool

Description
-----------
says if a Header entity has a specified type.
") HasHeaderEntity;
		Standard_Boolean HasHeaderEntity(const opencascade::handle<Standard_Type> & atype);

		/****** StepData_StepModel::Header ******/
		/****** md5 signature: 3d6e09de2922c048a927493ef2d64848 ******/
		%feature("compactdefaultargs") Header;
		%feature("autodoc", "Return
-------
Interface_EntityIterator

Description
-----------
returns Header entities under the form of an iterator.
") Header;
		Interface_EntityIterator Header();

		/****** StepData_StepModel::HeaderEntity ******/
		/****** md5 signature: ede6837f6a2ad5d452848de1bfd923d8 ******/
		%feature("compactdefaultargs") HeaderEntity;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns Header entity with specified type, if there is.
") HeaderEntity;
		opencascade::handle<Standard_Transient> HeaderEntity(const opencascade::handle<Standard_Type> & atype);

		/****** StepData_StepModel::IdentLabel ******/
		/****** md5 signature: 10b81eabe33ad8b4029c27784d0a6669 ******/
		%feature("compactdefaultargs") IdentLabel;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
returns the label ident attached to an entity, 0 if not in me.
") IdentLabel;
		Standard_Integer IdentLabel(const opencascade::handle<Standard_Transient> & ent);

		/****** StepData_StepModel::IsInitializedUnit ******/
		/****** md5 signature: fe0bd8baacb679c3138fd7d26ea62f98 ******/
		%feature("compactdefaultargs") IsInitializedUnit;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the unit initialization flag True - the unit was initialized False - the unit value was not initialized, the default value is used.
") IsInitializedUnit;
		Standard_Boolean IsInitializedUnit();

		/****** StepData_StepModel::LocalLengthUnit ******/
		/****** md5 signature: 985f2c4be943ccdeef11a3c7627d6535 ******/
		%feature("compactdefaultargs") LocalLengthUnit;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns local length unit using for transfer process (1 by default).
") LocalLengthUnit;
		Standard_Real LocalLengthUnit();

		/****** StepData_StepModel::NewEmptyModel ******/
		/****** md5 signature: 40876c8eb593ebc41abaf47645e862e5 ******/
		%feature("compactdefaultargs") NewEmptyModel;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns a New Empty Model, same type as <self>, i.e. StepModel.
") NewEmptyModel;
		opencascade::handle<Interface_InterfaceModel> NewEmptyModel();

		/****** StepData_StepModel::PrintLabel ******/
		/****** md5 signature: 70ad5739c870581f6dca5167f0b3bae0 ******/
		%feature("compactdefaultargs") PrintLabel;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
S: Standard_OStream

Description
-----------
Prints label specific to STEP norm for a given entity, i.e. if a LabelIdent has been recorded, its value with '#', else the number in the model with '#' and between ().
") PrintLabel;
		void PrintLabel(const opencascade::handle<Standard_Transient> & ent, std::ostream &OutValue);

		/****** StepData_StepModel::SetIdentLabel ******/
		/****** md5 signature: d8211ff55cd283602d612ccf9779dc4a ******/
		%feature("compactdefaultargs") SetIdentLabel;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
ident: int

Return
-------
None

Description
-----------
Attaches an ident to an entity to produce a label (does nothing if <ent> is not in <self>).
") SetIdentLabel;
		void SetIdentLabel(const opencascade::handle<Standard_Transient> & ent, const Standard_Integer ident);

		/****** StepData_StepModel::SetLocalLengthUnit ******/
		/****** md5 signature: 783595f799eb693ca1a2109c4ddaf448 ******/
		%feature("compactdefaultargs") SetLocalLengthUnit;
		%feature("autodoc", "
Parameters
----------
theUnit: float

Return
-------
None

Description
-----------
Sets local length unit using for transfer process.
") SetLocalLengthUnit;
		void SetLocalLengthUnit(const Standard_Real theUnit);

		/****** StepData_StepModel::SetSourceCodePage ******/
		/****** md5 signature: aa588b60c23e4bbb2537b739d5a43a57 ******/
		%feature("compactdefaultargs") SetSourceCodePage;
		%feature("autodoc", "
Parameters
----------
theCode: Resource_FormatType

Return
-------
None

Description
-----------
Return the encoding of STEP file for converting names into UNICODE.
") SetSourceCodePage;
		void SetSourceCodePage(Resource_FormatType theCode);

		/****** StepData_StepModel::SetWriteLengthUnit ******/
		/****** md5 signature: c506583997fe9e8405e47ccc0d6e9a2b ******/
		%feature("compactdefaultargs") SetWriteLengthUnit;
		%feature("autodoc", "
Parameters
----------
theUnit: float

Return
-------
None

Description
-----------
Sets length unit using for writing process.
") SetWriteLengthUnit;
		void SetWriteLengthUnit(const Standard_Real theUnit);

		/****** StepData_StepModel::SourceCodePage ******/
		/****** md5 signature: e194da071972a41e58548e424201cc2c ******/
		%feature("compactdefaultargs") SourceCodePage;
		%feature("autodoc", "Return
-------
Resource_FormatType

Description
-----------
Return the encoding of STEP file for converting names into UNICODE. Initialized from 'read.step.codepage' variable by constructor, which is Resource_UTF8 by default.
") SourceCodePage;
		Resource_FormatType SourceCodePage();

		/****** StepData_StepModel::StringLabel ******/
		/****** md5 signature: 8051e56e871a0ca086f3d44adb661ad2 ******/
		%feature("compactdefaultargs") StringLabel;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns a string with the label attached to a given entity, same form as for PrintLabel.
") StringLabel;
		opencascade::handle<TCollection_HAsciiString> StringLabel(const opencascade::handle<Standard_Transient> & ent);

		/****** StepData_StepModel::VerifyCheck ******/
		/****** md5 signature: 1054ee41d20b1185127d800c7331e3c3 ******/
		%feature("compactdefaultargs") VerifyCheck;
		%feature("autodoc", "
Parameters
----------
ach: Interface_Check

Return
-------
None

Description
-----------
Specific Check, checks Header Items with HeaderProtocol.
") VerifyCheck;
		virtual void VerifyCheck(opencascade::handle<Interface_Check> & ach);

		/****** StepData_StepModel::WriteLengthUnit ******/
		/****** md5 signature: a15b65aac54886b2c56544fdb4e2f592 ******/
		%feature("compactdefaultargs") WriteLengthUnit;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns length unit using for writing process (1 by default).
") WriteLengthUnit;
		Standard_Real WriteLengthUnit();

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
		/****** StepData_StepReaderData::StepData_StepReaderData ******/
		/****** md5 signature: db335b50fd725a5628db2d961b3a5133 ******/
		%feature("compactdefaultargs") StepData_StepReaderData;
		%feature("autodoc", "
Parameters
----------
nbheader: int
nbtotal: int
nbpar: int
theSourceCodePage: Resource_FormatType (optional, default to Resource_FormatType_UTF8)

Return
-------
None

Description
-----------
creates StepReaderData correctly dimensioned (necessary at creation time, because it contains arrays) nbheader is nb of records for Header, nbtotal for Header+Data and nbpar gives the total count of parameters.
") StepData_StepReaderData;
		 StepData_StepReaderData(const Standard_Integer nbheader, const Standard_Integer nbtotal, const Standard_Integer nbpar, const Resource_FormatType theSourceCodePage = Resource_FormatType_UTF8);

		/****** StepData_StepReaderData::AddStepParam ******/
		/****** md5 signature: 834d18d38a342df8da62aa7c53fe99a4 ******/
		%feature("compactdefaultargs") AddStepParam;
		%feature("autodoc", "
Parameters
----------
num: int
aval: str
atype: Interface_ParamType
nument: int (optional, default to 0)

Return
-------
None

Description
-----------
Fills the fields of a parameter of a record. This is a variant of AddParam, Adapted to STEP (optimized for specific values).
") AddStepParam;
		void AddStepParam(const Standard_Integer num, Standard_CString aval, const Interface_ParamType atype, const Standard_Integer nument = 0);

		/****** StepData_StepReaderData::CType ******/
		/****** md5 signature: 3471c88389b71f86b2469f9965af46ab ******/
		%feature("compactdefaultargs") CType;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
str

Description
-----------
Returns Record Type as a CString was C++: return const.
") CType;
		Standard_CString CType(const Standard_Integer num);

		/****** StepData_StepReaderData::CheckDerived ******/
		/****** md5 signature: d9839de6294aa8ba65f812eb1e812f91 ******/
		%feature("compactdefaultargs") CheckDerived;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: str
ach: Interface_Check
errstat: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Checks if parameter <nump> of record <num> is given as Derived If this Check is successful (i.e. Param = '*'), returns True Else, fills <ach> with a Message which contains <mess> and returns False. According to <errstat>, this message is Warning if errstat is False (Default), Fail if errstat is True.
") CheckDerived;
		Standard_Boolean CheckDerived(const Standard_Integer num, const Standard_Integer nump, Standard_CString mess, opencascade::handle<Interface_Check> & ach, const Standard_Boolean errstat = Standard_False);

		/****** StepData_StepReaderData::CheckNbParams ******/
		/****** md5 signature: 40bd050708432827e8edcb713a598c03 ******/
		%feature("compactdefaultargs") CheckNbParams;
		%feature("autodoc", "
Parameters
----------
num: int
nbreq: int
ach: Interface_Check
mess: str (optional, default to "")

Return
-------
bool

Description
-----------
Checks Count of Parameters of record <num> to equate <nbreq> If this Check is successful, returns True Else, fills <ach> with an Error Message then returns False <mess> is included in the Error message if given non empty.
") CheckNbParams;
		Standard_Boolean CheckNbParams(const Standard_Integer num, const Standard_Integer nbreq, opencascade::handle<Interface_Check> & ach, Standard_CString mess = "");

		/****** StepData_StepReaderData::ComplexType ******/
		/****** md5 signature: 340da4e2cb3395caa521e4492b2553d1 ******/
		%feature("compactdefaultargs") ComplexType;
		%feature("autodoc", "
Parameters
----------
num: int
types: TColStd_SequenceOfAsciiString

Return
-------
None

Description
-----------
Returns the List of Types which correspond to a Complex Type Entity. If not Complex, there is just one Type in it For a SubList or a Scope mark, <types> remains empty.
") ComplexType;
		void ComplexType(const Standard_Integer num, TColStd_SequenceOfAsciiString & types);

		/****** StepData_StepReaderData::FailEnumValue ******/
		/****** md5 signature: 25e193747e56ca1f197d8dbf6eb86a76 ******/
		%feature("compactdefaultargs") FailEnumValue;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: str
ach: Interface_Check

Return
-------
None

Description
-----------
Fills a check with a fail message if enumeration value does match parameter definition Just a help to centralize message definitions.
") FailEnumValue;
		void FailEnumValue(const Standard_Integer num, const Standard_Integer nump, Standard_CString mess, opencascade::handle<Interface_Check> & ach);

		/****** StepData_StepReaderData::FindNextHeaderRecord ******/
		/****** md5 signature: 4810c89976f8a19ded7f4ad73027cd2a ******/
		%feature("compactdefaultargs") FindNextHeaderRecord;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
determine first suitable record of Header works as FindNextRecord, but treats only Header records.
") FindNextHeaderRecord;
		Standard_Integer FindNextHeaderRecord(const Standard_Integer num);

		/****** StepData_StepReaderData::FindNextRecord ******/
		/****** md5 signature: b54f23c95a9eaf7d62f9c7b9d32982b2 ******/
		%feature("compactdefaultargs") FindNextRecord;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
determines the first suitable record following a given one that is, skips SCOPE,ENDSCOPE and SUBLIST records Note: skips Header records, which are accessed separately.
") FindNextRecord;
		Standard_Integer FindNextRecord(const Standard_Integer num);

		/****** StepData_StepReaderData::GlobalCheck ******/
		/****** md5 signature: 00501d7eb3a6736e3986f0a6d1d2c559 ******/
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns the Global Check. It can record Fail messages about Undefined References (detected by SetEntityNumbers).
") GlobalCheck;
		const opencascade::handle<Interface_Check> GlobalCheck();

		/****** StepData_StepReaderData::IsComplex ******/
		/****** md5 signature: 14fe1b648c0c4d95a2f1af447484f0fc ******/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Returns True if <num> corresponds to a Complex Type Entity (as can be defined by ANDOR Express clause).
") IsComplex;
		Standard_Boolean IsComplex(const Standard_Integer num);

		/****** StepData_StepReaderData::NamedForComplex ******/
		/****** md5 signature: d1ec9ab7b048a14ad3cae103f38e0618 ******/
		%feature("compactdefaultargs") NamedForComplex;
		%feature("autodoc", "
Parameters
----------
name: str
num0: int
ach: Interface_Check

Return
-------
num: int

Description
-----------
Determines the first component which brings a given name, for a Complex Type Entity <num0> is the very first record of this entity <num> is given the last NextNamedForComplex, starts at zero it is returned as the newly found number Hence, in the normal case, NextNamedForComplex starts by num0 if <num> is zero, else by NextForComplex(num) If the alphabetic order is not respected, it restarts from num0 and loops on NextForComplex until finding <name> In case of 'non-alphabetic order', <ach> is filled with a Warning for this name In case of 'not-found at all', <ach> is filled with a Fail, and <num> is returned as zero //! Returns True if alphabetic order, False else.
") NamedForComplex;
		Standard_Boolean NamedForComplex(Standard_CString name, const Standard_Integer num0, Standard_Integer &OutValue, opencascade::handle<Interface_Check> & ach);

		/****** StepData_StepReaderData::NamedForComplex ******/
		/****** md5 signature: 9323d5d37d3d46676be6970d81776e60 ******/
		%feature("compactdefaultargs") NamedForComplex;
		%feature("autodoc", "
Parameters
----------
theName: str
theShortName: str
num0: int
ach: Interface_Check

Return
-------
num: int

Description
-----------
Determines the first component which brings a given name, or short name for a Complex Type Entity <num0> is the very first record of this entity <num> is given the last NextNamedForComplex, starts at zero it is returned as the newly found number Hence, in the normal case, NextNamedForComplex starts by num0 if <num> is zero, else by NextForComplex(num) If the alphabetic order is not respected, it restarts from num0 and loops on NextForComplex until finding <name> In case of 'non-alphabetic order', <ach> is filled with a Warning for this name In case of 'not-found at all', <ach> is filled with a Fail, and <num> is returned as zero //! Returns True if alphabetic order, False else.
") NamedForComplex;
		Standard_Boolean NamedForComplex(Standard_CString theName, Standard_CString theShortName, const Standard_Integer num0, Standard_Integer &OutValue, opencascade::handle<Interface_Check> & ach);

		/****** StepData_StepReaderData::NbEntities ******/
		/****** md5 signature: ab39f1a260e05424e9d879a047ae3f8d ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns total count of Entities (including Header).
") NbEntities;
		virtual Standard_Integer NbEntities();

		/****** StepData_StepReaderData::NextForComplex ******/
		/****** md5 signature: dcd2936f68f0d3198fecec8298b34d93 ******/
		%feature("compactdefaultargs") NextForComplex;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
Returns the Next 'Component' for a Complex Type Entity, of which <num> is already a Component (the first one or a next one) Returns 0 for a Simple Type or for the last Component.
") NextForComplex;
		Standard_Integer NextForComplex(const Standard_Integer num);

		/****** StepData_StepReaderData::PrepareHeader ******/
		/****** md5 signature: 11051b9ec511cc902c041ebf5d287d0b ******/
		%feature("compactdefaultargs") PrepareHeader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Works as SetEntityNumbers but for Header: more simple because there are no Reference, only Sub-Lists.
") PrepareHeader;
		void PrepareHeader();

		/****** StepData_StepReaderData::ReadAny ******/
		/****** md5 signature: f7e94a149abb91c70d6c2dd8819fe3cc ******/
		%feature("compactdefaultargs") ReadAny;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: str
ach: Interface_Check
descr: StepData_PDescr
val: Standard_Transient

Return
-------
bool

Description
-----------
Reads parameter <nump> of record <num> into a Transient Value according to the type of the parameter: Named for Integer,Boolean,Logical,Enum,Real: SelectNamed Immediate Integer,Boolean,Logical,Enum,Real: SelectInt/Real Text: HAsciiString Ident: the referenced Entity Sub-List not processed, see ReadSub This value is controlled by a Parameter Descriptor (PDescr), which controls its allowed type and value <ach> is filled if the read parameter does not match its description (the select is nevertheless created if possible) //! Warning: val is in out, hence it is possible to predefine a specific SelectMember then to fill it. If <val> is Null or if the result is not a SelectMember, val itself is returned a new ref For a Select with a Name, <val> must then be a SelectNamed.
") ReadAny;
		Standard_Boolean ReadAny(const Standard_Integer num, const Standard_Integer nump, Standard_CString mess, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepData_PDescr> & descr, opencascade::handle<Standard_Transient> & val);

		/****** StepData_StepReaderData::ReadBoolean ******/
		/****** md5 signature: c61b344ba750add039b5fae58b747ea7 ******/
		%feature("compactdefaultargs") ReadBoolean;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: str
ach: Interface_Check

Return
-------
flag: bool

Description
-----------
reads parameter <nump> of record <num> as a Boolean Return value and Check managed as by ReadReal (demands a Boolean enum, i.e. text '.T.' for True or '.F.' for False).
") ReadBoolean;
		Standard_Boolean ReadBoolean(const Standard_Integer num, const Standard_Integer nump, Standard_CString mess, opencascade::handle<Interface_Check> & ach, Standard_Boolean &OutValue);

		/****** StepData_StepReaderData::ReadEnum ******/
		/****** md5 signature: 1ba2321f0ae50fef377849bb1f6650d7 ******/
		%feature("compactdefaultargs") ReadEnum;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: str
ach: Interface_Check
enumtool: StepData_EnumTool

Return
-------
val: int

Description
-----------
Reads parameter <nump> of record <num> as an Enumeration (text between dots) and converts it to an integer value, by an EnumTool. Returns True if OK, false if: this parameter is not enumeration, or is not recognized by the EnumTool (with fail).
") ReadEnum;
		Standard_Boolean ReadEnum(const Standard_Integer num, const Standard_Integer nump, Standard_CString mess, opencascade::handle<Interface_Check> & ach, const StepData_EnumTool & enumtool, Standard_Integer &OutValue);

		/****** StepData_StepReaderData::ReadEnumParam ******/
		/****** md5 signature: 673529d8e471385b72ef2a193883fa07 ******/
		%feature("compactdefaultargs") ReadEnumParam;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: str
ach: Interface_Check
text: str

Return
-------
bool

Description
-----------
No available documentation.
") ReadEnumParam;
		Standard_Boolean ReadEnumParam(const Standard_Integer num, const Standard_Integer nump, Standard_CString mess, opencascade::handle<Interface_Check> & ach, Standard_CString text);

		/****** StepData_StepReaderData::ReadField ******/
		/****** md5 signature: 117cffc7ad5a8d128a01db0184aab062 ******/
		%feature("compactdefaultargs") ReadField;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: str
ach: Interface_Check
descr: StepData_PDescr
fild: StepData_Field

Return
-------
bool

Description
-----------
reads parameter <nump> of record <num> into a Field, controlled by a Parameter Descriptor (PDescr), which controls its allowed type(s) and value <ach> is filled if the read parameter does not match its description (but the field is read anyway) If the description is not defined, no control is done Returns True when done.
") ReadField;
		Standard_Boolean ReadField(const Standard_Integer num, const Standard_Integer nump, Standard_CString mess, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepData_PDescr> & descr, StepData_Field & fild);

		/****** StepData_StepReaderData::ReadInteger ******/
		/****** md5 signature: 8df89f40ca3baa06d5708a995e3bc965 ******/
		%feature("compactdefaultargs") ReadInteger;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: str
ach: Interface_Check

Return
-------
val: int

Description
-----------
reads parameter <nump> of record <num> as a single Integer. Return value & Check managed as by ReadXY (demands an Integer).
") ReadInteger;
		Standard_Boolean ReadInteger(const Standard_Integer num, const Standard_Integer nump, Standard_CString mess, opencascade::handle<Interface_Check> & ach, Standard_Integer &OutValue);

		/****** StepData_StepReaderData::ReadList ******/
		/****** md5 signature: 6fee9a6abd753aabac229fd7505f0bec ******/
		%feature("compactdefaultargs") ReadList;
		%feature("autodoc", "
Parameters
----------
num: int
ach: Interface_Check
descr: StepData_ESDescr
list: StepData_FieldList

Return
-------
bool

Description
-----------
reads a list of fields controlled by an ESDescr.
") ReadList;
		Standard_Boolean ReadList(const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepData_ESDescr> & descr, StepData_FieldList & list);

		/****** StepData_StepReaderData::ReadLogical ******/
		/****** md5 signature: 5e1a0e71d39ef6503884113456db3977 ******/
		%feature("compactdefaultargs") ReadLogical;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: str
ach: Interface_Check

Return
-------
flag: StepData_Logical

Description
-----------
reads parameter <nump> of record <num> as a Logical Return value and Check managed as by ReadBoolean (demands a Logical enum, i.e. text '.T.', '.F.', or '.U.').
") ReadLogical;
		Standard_Boolean ReadLogical(const Standard_Integer num, const Standard_Integer nump, Standard_CString mess, opencascade::handle<Interface_Check> & ach, StepData_Logical &OutValue);

		/****** StepData_StepReaderData::ReadReal ******/
		/****** md5 signature: ffb5a16c71361b585a01f0d634e7c1d7 ******/
		%feature("compactdefaultargs") ReadReal;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: str
ach: Interface_Check

Return
-------
val: float

Description
-----------
reads parameter <nump> of record <num> as a single Real value. Return value and Check managed as by ReadXY (demands a Real).
") ReadReal;
		Standard_Boolean ReadReal(const Standard_Integer num, const Standard_Integer nump, Standard_CString mess, opencascade::handle<Interface_Check> & ach, Standard_Real &OutValue);

		/****** StepData_StepReaderData::ReadString ******/
		/****** md5 signature: 488fccca903c0d056793019b913279db ******/
		%feature("compactdefaultargs") ReadString;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: str
ach: Interface_Check

Return
-------
val: TCollection_HAsciiString

Description
-----------
reads parameter <nump> of record <num> as a String (text between quotes, quotes are removed by the Read operation) Return value and Check managed as by ReadXY (demands a String).
") ReadString;
		Standard_Boolean ReadString(const Standard_Integer num, const Standard_Integer nump, Standard_CString mess, opencascade::handle<Interface_Check> & ach, opencascade::handle<TCollection_HAsciiString> &OutValue);

		/****** StepData_StepReaderData::ReadSub ******/
		/****** md5 signature: c5ac3109022b64e7d22ee6e578f203ae ******/
		%feature("compactdefaultargs") ReadSub;
		%feature("autodoc", "
Parameters
----------
numsub: int
mess: str
ach: Interface_Check
descr: StepData_PDescr
val: Standard_Transient

Return
-------
int

Description
-----------
reads the content of a sub-list into a transient: SelectNamed, or HArray1 of Integer,Real,String,Transient ... recursive call if list of list ... If a sub-list has mixed types, an HArray1OfTransient is produced, it may contain SelectMember Intended to be called by ReadField The returned status is: negative if failed, 0 if empty. Else the kind to be recorded in the field.
") ReadSub;
		Standard_Integer ReadSub(const Standard_Integer numsub, Standard_CString mess, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepData_PDescr> & descr, opencascade::handle<Standard_Transient> & val);

		/****** StepData_StepReaderData::ReadSubList ******/
		/****** md5 signature: cf974a9ca2509fac417e73c1eeffb784 ******/
		%feature("compactdefaultargs") ReadSubList;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: str
ach: Interface_Check
optional: bool (optional, default to Standard_False)
lenmin: int (optional, default to 0)
lenmax: int (optional, default to 0)

Return
-------
numsub: int

Description
-----------
reads parameter <nump> of record <num> as a sub-list (may be typed, see ReadTypedParameter in this case) Returns True if OK. Else (not a LIST), returns false and feeds Check with appropriate check If <optional> is True and Param is not defined, returns True with <ach> not filled and <numsub> returned as 0 Works with SubListNumber with <aslast> false (no specific case for last parameter).
") ReadSubList;
		Standard_Boolean ReadSubList(const Standard_Integer num, const Standard_Integer nump, Standard_CString mess, opencascade::handle<Interface_Check> & ach, Standard_Integer &OutValue, const Standard_Boolean optional = Standard_False, const Standard_Integer lenmin = 0, const Standard_Integer lenmax = 0);

		/****** StepData_StepReaderData::ReadTypedParam ******/
		/****** md5 signature: 9ae8cb43153e7d06c2546e73f27b8a23 ******/
		%feature("compactdefaultargs") ReadTypedParam;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mustbetyped: bool
mess: str
ach: Interface_Check
typ: str

Return
-------
numr: int
numrp: int

Description
-----------
Resolves a parameter which can be enclosed in a type def., as TYPE(val). The parameter must then be read normally according its type. Parameter to be resolved is <nump> of record <num> <mustbetyped> True demands a typed parameter <mustbetyped> False accepts a non-typed parameter as option mess and ach as usual <numr>,<numrp> are the resolved record and parameter numbers = num,nump if no type, else numrp=1 <typ> returns the recorded type, or empty string Remark: a non-typed list is considered as 'non-typed'.
") ReadTypedParam;
		Standard_Boolean ReadTypedParam(const Standard_Integer num, const Standard_Integer nump, const Standard_Boolean mustbetyped, Standard_CString mess, opencascade::handle<Interface_Check> & ach, Standard_Integer &OutValue, Standard_Integer &OutValue, TCollection_AsciiString & typ);

		/****** StepData_StepReaderData::ReadXY ******/
		/****** md5 signature: 35739d3be1921b37774b2c9ffd74a099 ******/
		%feature("compactdefaultargs") ReadXY;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: str
ach: Interface_Check

Return
-------
X: float
Y: float

Description
-----------
reads parameter <nump> of record <num> as a sub-list of two Reals X,Y. Returns True if OK. Else, returns false and feeds Check with appropriate Fails (parameter not a sub-list, not two Reals in the sub-list) composed with 'mess' which gives the name of the parameter.
") ReadXY;
		Standard_Boolean ReadXY(const Standard_Integer num, const Standard_Integer nump, Standard_CString mess, opencascade::handle<Interface_Check> & ach, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** StepData_StepReaderData::ReadXYZ ******/
		/****** md5 signature: 7aabc99aae7f903c581d308dafdf7469 ******/
		%feature("compactdefaultargs") ReadXYZ;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: str
ach: Interface_Check

Return
-------
X: float
Y: float
Z: float

Description
-----------
reads parameter <nump> of record <num> as a sub-list of three Reals X,Y,Z. Return value and Check managed as by ReadXY (demands a sub-list of three Reals).
") ReadXYZ;
		Standard_Boolean ReadXYZ(const Standard_Integer num, const Standard_Integer nump, Standard_CString mess, opencascade::handle<Interface_Check> & ach, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** StepData_StepReaderData::RecordIdent ******/
		/****** md5 signature: c1cae48e2f0b459a26c9eb869d36a23b ******/
		%feature("compactdefaultargs") RecordIdent;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
Returns record identifier (Positive number) If returned ident is not positive: Sub-List or Scope mark.
") RecordIdent;
		Standard_Integer RecordIdent(const Standard_Integer num);

		/****** StepData_StepReaderData::RecordType ******/
		/****** md5 signature: 59d4d9d001fb67e65116864fabb6482e ******/
		%feature("compactdefaultargs") RecordType;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TCollection_AsciiString

Description
-----------
Returns Record Type.
") RecordType;
		const TCollection_AsciiString & RecordType(const Standard_Integer num);

		/****** StepData_StepReaderData::SetEntityNumbers ******/
		/****** md5 signature: 0a67f4008b023bc680131c73c0ddf183 ******/
		%feature("compactdefaultargs") SetEntityNumbers;
		%feature("autodoc", "
Parameters
----------
withmap: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
determines reference numbers in EntityNumber fields called by Prepare from StepReaderTool to prepare later using by a StepModel. This method is attached to StepReaderData because it needs a massive amount of data accesses to work //! If <withmap> is given False, the basic exploration algorithm is activated, otherwise a map is used as far as it is possible this option can be used only to test this algorithm.
") SetEntityNumbers;
		void SetEntityNumbers(const Standard_Boolean withmap = Standard_True);

		/****** StepData_StepReaderData::SetRecord ******/
		/****** md5 signature: 80022d16b7147e3f446fb935dfc09fd5 ******/
		%feature("compactdefaultargs") SetRecord;
		%feature("autodoc", "
Parameters
----------
num: int
ident: str
type: str
nbpar: int

Return
-------
None

Description
-----------
Fills the fields of a record.
") SetRecord;
		void SetRecord(const Standard_Integer num, Standard_CString ident, Standard_CString type, const Standard_Integer nbpar);

		/****** StepData_StepReaderData::SubListNumber ******/
		/****** md5 signature: c968678faf4381e8c92b5055d58a7092 ******/
		%feature("compactdefaultargs") SubListNumber;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
aslast: bool

Return
-------
int

Description
-----------
Returns SubList numero designated by a parameter (nump) in a record (num), or zero if the parameter does not exist or is not a SubList address. Zero too If aslast is True and nump is not for the last parameter.
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
		/****** StepData_StepReaderTool::StepData_StepReaderTool ******/
		/****** md5 signature: b829ed075a39b10a86756c841f6db6e2 ******/
		%feature("compactdefaultargs") StepData_StepReaderTool;
		%feature("autodoc", "
Parameters
----------
reader: StepData_StepReaderData
protocol: StepData_Protocol

Return
-------
None

Description
-----------
creates StepReaderTool to work with a StepReaderData according to a Step Protocol. Defines the ReaderLib at this time.
") StepData_StepReaderTool;
		 StepData_StepReaderTool(const opencascade::handle<StepData_StepReaderData> & reader, const opencascade::handle<StepData_Protocol> & protocol);

		/****** StepData_StepReaderTool::AnalyseRecord ******/
		/****** md5 signature: 11e711b41d10e9d1ee2744d9797437ea ******/
		%feature("compactdefaultargs") AnalyseRecord;
		%feature("autodoc", "
Parameters
----------
num: int
anent: Standard_Transient
acheck: Interface_Check

Return
-------
bool

Description
-----------
fills an entity, given record no; works by using a ReaderLib to load each entity, which must be a Transient Actually, returned value is True if no fail, False else.
") AnalyseRecord;
		Standard_Boolean AnalyseRecord(const Standard_Integer num, const opencascade::handle<Standard_Transient> & anent, opencascade::handle<Interface_Check> & acheck);

		/****** StepData_StepReaderTool::BeginRead ******/
		/****** md5 signature: 77f0fe12db475c0a685ef00996ac9075 ******/
		%feature("compactdefaultargs") BeginRead;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
fills model's header; that is, gives to it Header entities and commands their loading. Also fills StepModel's Global Check from StepReaderData's GlobalCheck.
") BeginRead;
		void BeginRead(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** StepData_StepReaderTool::EndRead ******/
		/****** md5 signature: 410f49289536f95f2a8341a522a74781 ******/
		%feature("compactdefaultargs") EndRead;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Ends file reading after reading all the entities Here, it binds in the model, Idents to Entities (for checks).
") EndRead;
		virtual void EndRead(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** StepData_StepReaderTool::Prepare ******/
		/****** md5 signature: 528d2a7b058744c19c0c36afc9e40229 ******/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "
Parameters
----------
optimize: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Bounds empty entities to records, uses default Recognition provided by ReaderLib and ReaderModule. Also calls computation of references (SetEntityNumbers from StepReaderData) Works only on data entities (skips header) <optimize> given False allows to test some internal algorithms which are normally avoided (see also StepReaderData).
") Prepare;
		void Prepare(const Standard_Boolean optimize = Standard_True);

		/****** StepData_StepReaderTool::Prepare ******/
		/****** md5 signature: 1e45dfa3ffd32fc6c18603840e8870f8 ******/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "
Parameters
----------
reco: StepData_FileRecognizer
optimize: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Bounds empty entities to records, works with a specific FileRecognizer, stored and later used in Recognize Works only on data entities (skips header) <optimize: same as above.
") Prepare;
		void Prepare(const opencascade::handle<StepData_FileRecognizer> & reco, const Standard_Boolean optimize = Standard_True);

		/****** StepData_StepReaderTool::PrepareHeader ******/
		/****** md5 signature: f8e57f4971302260e16b8f9eca3c65bd ******/
		%feature("compactdefaultargs") PrepareHeader;
		%feature("autodoc", "
Parameters
----------
reco: StepData_FileRecognizer

Return
-------
None

Description
-----------
bounds empty entities and sub-lists to header records works like Prepare + SetEntityNumbers, but for header (N.B.: in Header, no Ident and no reference) FileRecognizer is to specify Entities which are allowed to be defined in the Header (not every type can be).
") PrepareHeader;
		void PrepareHeader(const opencascade::handle<StepData_FileRecognizer> & reco);

		/****** StepData_StepReaderTool::Recognize ******/
		/****** md5 signature: 910d8cba6a79ab1da4faa756f31c32c7 ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "
Parameters
----------
num: int
ach: Interface_Check
ent: Standard_Transient

Return
-------
bool

Description
-----------
recognizes records, by asking either ReaderLib (default) or FileRecognizer (if defined) to do so. <ach> is to call RecognizeByLib.
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
		/****** StepData_StepWriter::StepData_StepWriter ******/
		/****** md5 signature: 6b1870cc23c3eef078caee2d60ddda09 ******/
		%feature("compactdefaultargs") StepData_StepWriter;
		%feature("autodoc", "
Parameters
----------
amodel: StepData_StepModel

Return
-------
None

Description
-----------
Creates an empty StepWriter from a StepModel. The StepModel provides the Number of Entities, as identifiers for File.
") StepData_StepWriter;
		 StepData_StepWriter(const opencascade::handle<StepData_StepModel> & amodel);

		/****** StepData_StepWriter::AddParam ******/
		/****** md5 signature: b7c09c76557d15a905a6585c105fc6eb ******/
		%feature("compactdefaultargs") AddParam;
		%feature("autodoc", "Return
-------
None

Description
-----------
prepares adding a parameter (that is, adds ',' except for first one); normally for internal use; can be used to send a totally empty parameter (with no literal value).
") AddParam;
		void AddParam();

		/****** StepData_StepWriter::CheckList ******/
		/****** md5 signature: 28097225c7dc1bd34c16a03b8c119653 ******/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Return
-------
Interface_CheckIterator

Description
-----------
Returns the check-list, which has received possible checks: for unknown entities, badly loaded ones, null or unknown references.
") CheckList;
		Interface_CheckIterator CheckList();

		/****** StepData_StepWriter::CloseSub ******/
		/****** md5 signature: ab3e69e84e1e558c20f4ba6326702249 ******/
		%feature("compactdefaultargs") CloseSub;
		%feature("autodoc", "Return
-------
None

Description
-----------
closes a sublist by a ')'.
") CloseSub;
		void CloseSub();

		/****** StepData_StepWriter::Comment ******/
		/****** md5 signature: dae8a1d9e2b5258fc894237893a1c093 ******/
		%feature("compactdefaultargs") Comment;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
sets a comment mark: if mode is True, begins Comment zone, if mode is False, ends Comment zone (if one is begun).
") Comment;
		void Comment(const Standard_Boolean mode);

		/****** StepData_StepWriter::EndComplex ******/
		/****** md5 signature: 647e8f46af8631ebe3ef1f2b96ad4dea ******/
		%feature("compactdefaultargs") EndComplex;
		%feature("autodoc", "Return
-------
None

Description
-----------
sends the end of a complex entity: a simple closed bracket It must be called AFTER sending all the components and BEFORE the final call to EndEntity.
") EndComplex;
		void EndComplex();

		/****** StepData_StepWriter::EndEntity ******/
		/****** md5 signature: 2e21c428951219249bd42b33a599281b ******/
		%feature("compactdefaultargs") EndEntity;
		%feature("autodoc", "Return
-------
None

Description
-----------
sends end of entity (closing bracket plus ';') Error if count of opened-closed brackets is not null.
") EndEntity;
		void EndEntity();

		/****** StepData_StepWriter::EndFile ******/
		/****** md5 signature: 5f8af3603ceb0446804ef8e1576045bf ******/
		%feature("compactdefaultargs") EndFile;
		%feature("autodoc", "Return
-------
None

Description
-----------
sets end of file; error is EndSec was not set.
") EndFile;
		void EndFile();

		/****** StepData_StepWriter::EndSec ******/
		/****** md5 signature: b0739dfa585ac748da2c208281d35a7c ******/
		%feature("compactdefaultargs") EndSec;
		%feature("autodoc", "Return
-------
None

Description
-----------
sets end of section; to be done before passing to next one.
") EndSec;
		void EndSec();

		/****** StepData_StepWriter::FloatWriter ******/
		/****** md5 signature: 861009c9fe600b2a8fc50cd628967a67 ******/
		%feature("compactdefaultargs") FloatWriter;
		%feature("autodoc", "Return
-------
Interface_FloatWriter

Description
-----------
Returns the embedded FloatWriter, which controls sending Reals Use this method to access FloatWriter in order to consult or change its options (MainFormat, FormatForRange,ZeroSuppress), because it is returned as the address of its field.
") FloatWriter;
		Interface_FloatWriter & FloatWriter();

		/****** StepData_StepWriter::Indent ******/
		/****** md5 signature: 5b3f6216026f2cb4b28e92afb615a0a4 ******/
		%feature("compactdefaultargs") Indent;
		%feature("autodoc", "
Parameters
----------
onent: bool

Return
-------
None

Description
-----------
asks that further indentations will begin at position of entity first opening bracket; else they begin at zero (def) for each sublist level, two more blancks are added at beginning (except for text continuation, which must begin at true zero).
") Indent;
		void Indent(const Standard_Boolean onent);

		/****** StepData_StepWriter::IsInScope ******/
		/****** md5 signature: c571be75c0d507af59b0bf256b886bed ******/
		%feature("compactdefaultargs") IsInScope;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Returns True if an Entity identified by its Number is in a Scope.
") IsInScope;
		Standard_Boolean IsInScope(const Standard_Integer num);

		/****** StepData_StepWriter::JoinLast ******/
		/****** md5 signature: 03e4ebde14ce1c095a3f5f2123384503 ******/
		%feature("compactdefaultargs") JoinLast;
		%feature("autodoc", "
Parameters
----------
newline: bool

Return
-------
None

Description
-----------
joins current line to last one, only if new length is 72 max if newline is True, a new current line begins; else, current line is set to the last line (once joined) itself an can be completed.
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
		/****** StepData_StepWriter::Line ******/
		/****** md5 signature: 2938488b55d0589bc75f9301e49848d4 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns a Line given its rank in the File.
") Line;
		opencascade::handle<TCollection_HAsciiString> Line(const Standard_Integer num);

		/****** StepData_StepWriter::NbLines ******/
		/****** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of Lines.
") NbLines;
		Standard_Integer NbLines();

		/****** StepData_StepWriter::NewLine ******/
		/****** md5 signature: 073a07ae5e5ffba5c238b71733b36b13 ******/
		%feature("compactdefaultargs") NewLine;
		%feature("autodoc", "
Parameters
----------
evenempty: bool

Return
-------
None

Description
-----------
flushes current line; if empty, flushes it (defines a new empty line) if evenempty is True; else, skips it.
") NewLine;
		void NewLine(const Standard_Boolean evenempty);

		/****** StepData_StepWriter::OpenSub ******/
		/****** md5 signature: 6285529661194732f433bc65662cab85 ******/
		%feature("compactdefaultargs") OpenSub;
		%feature("autodoc", "Return
-------
None

Description
-----------
open a sublist by a '('.
") OpenSub;
		void OpenSub();

		/****** StepData_StepWriter::OpenTypedSub ******/
		/****** md5 signature: 1162318f55bb89bc1711c1d24c5667d8 ******/
		%feature("compactdefaultargs") OpenTypedSub;
		%feature("autodoc", "
Parameters
----------
subtype: str

Return
-------
None

Description
-----------
open a sublist with its type then a '('.
") OpenTypedSub;
		void OpenTypedSub(Standard_CString subtype);

		/****** StepData_StepWriter::Print ******/
		/****** md5 signature: 2eb8b686c42ac7926ce46f27d6e81985 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
S: Standard_OStream

Description
-----------
writes result on an output defined as an OStream then clears it.
") Print;
		Standard_Boolean Print(std::ostream &OutValue);

		/****** StepData_StepWriter::Send ******/
		/****** md5 signature: 834a80f8fb88341c53a16609c1df2e80 ******/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "
Parameters
----------
val: int

Return
-------
None

Description
-----------
sends an integer parameter.
") Send;
		void Send(const Standard_Integer val);

		/****** StepData_StepWriter::Send ******/
		/****** md5 signature: f58679aa6a4d459eeebef2ee9689b9ec ******/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "
Parameters
----------
val: float

Return
-------
None

Description
-----------
sends a real parameter (works with FloatWriter).
") Send;
		void Send(const Standard_Real val);

		/****** StepData_StepWriter::Send ******/
		/****** md5 signature: bdf5dec419f2dac9533249a75c08b658 ******/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "
Parameters
----------
val: str

Return
-------
None

Description
-----------
sends a text given as string (it will be set between '...').
") Send;
		void Send(TCollection_AsciiString val);

		/****** StepData_StepWriter::Send ******/
		/****** md5 signature: 3880ccc0702fdb7655055e88ee1fc846 ******/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "
Parameters
----------
val: Standard_Transient

Return
-------
None

Description
-----------
sends a reference to an entity (its identifier with '#') REMARK 1: a Null <val> is interpreted as 'Undefined' REMARK 2: for an HAsciiString which is not recorded in the Model, it is send as its String Content, between quotes.
") Send;
		void Send(const opencascade::handle<Standard_Transient> & val);

		/****** StepData_StepWriter::SendArrReal ******/
		/****** md5 signature: 1284c431a92505cf0b01eab69001bee8 ******/
		%feature("compactdefaultargs") SendArrReal;
		%feature("autodoc", "
Parameters
----------
anArr: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
sends an array of real.
") SendArrReal;
		void SendArrReal(const opencascade::handle<TColStd_HArray1OfReal> & anArr);

		/****** StepData_StepWriter::SendBoolean ******/
		/****** md5 signature: 64cbf8ca025e041c684fe788899fd7cd ******/
		%feature("compactdefaultargs") SendBoolean;
		%feature("autodoc", "
Parameters
----------
val: bool

Return
-------
None

Description
-----------
sends a Boolean as .T. for True or .F. for False (it is an useful case of Enum, which is built-in).
") SendBoolean;
		void SendBoolean(const Standard_Boolean val);

		/****** StepData_StepWriter::SendComment ******/
		/****** md5 signature: dbfb6c0c398923ecdbc81089745bc3c9 ******/
		%feature("compactdefaultargs") SendComment;
		%feature("autodoc", "
Parameters
----------
text: TCollection_HAsciiString

Return
-------
None

Description
-----------
sends a comment. Error if we are not inside a comment zone.
") SendComment;
		void SendComment(const opencascade::handle<TCollection_HAsciiString> & text);

		/****** StepData_StepWriter::SendComment ******/
		/****** md5 signature: a5775b5da52c8611fde273141c2534c9 ******/
		%feature("compactdefaultargs") SendComment;
		%feature("autodoc", "
Parameters
----------
text: str

Return
-------
None

Description
-----------
same as above but accepts a CString (ex.: '...' directly).
") SendComment;
		void SendComment(Standard_CString text);

		/****** StepData_StepWriter::SendData ******/
		/****** md5 signature: d649dad9b048a0857622c773c2313876 ******/
		%feature("compactdefaultargs") SendData;
		%feature("autodoc", "Return
-------
None

Description
-----------
Begins data section; error if EndSec was not set.
") SendData;
		void SendData();

		/****** StepData_StepWriter::SendDerived ******/
		/****** md5 signature: 2648c16f3fc954e8831bea0c8c590505 ******/
		%feature("compactdefaultargs") SendDerived;
		%feature("autodoc", "Return
-------
None

Description
-----------
sends a 'Derived' parameter (by '*'). A Derived Parameter has been inherited from a Super-Type then redefined as being computed by a function. Hence its value in file is senseless.
") SendDerived;
		void SendDerived();

		/****** StepData_StepWriter::SendEndscope ******/
		/****** md5 signature: f3c6d90370ea0ed0a6c24670c6011405 ******/
		%feature("compactdefaultargs") SendEndscope;
		%feature("autodoc", "Return
-------
None

Description
-----------
sets an end of Scope (on a separate line).
") SendEndscope;
		void SendEndscope();

		/****** StepData_StepWriter::SendEntity ******/
		/****** md5 signature: 815da511e408035eb7d900f0d5de06aa ******/
		%feature("compactdefaultargs") SendEntity;
		%feature("autodoc", "
Parameters
----------
nument: int
lib: StepData_WriterLib

Return
-------
None

Description
-----------
Send an Entity of the Data Section. If it corresponds to a Scope, also Sends the Scope information and contained Items.
") SendEntity;
		void SendEntity(const Standard_Integer nument, const StepData_WriterLib & lib);

		/****** StepData_StepWriter::SendEnum ******/
		/****** md5 signature: 3697a0d2e471dd3afbe9d81d2d3efbe7 ******/
		%feature("compactdefaultargs") SendEnum;
		%feature("autodoc", "
Parameters
----------
val: str

Return
-------
None

Description
-----------
sends an enum given by String (literal expression) adds '.' around it if not done Remark: val can be computed by class EnumTool from StepData: StepWriter.SendEnum (myenum.Text(enumval));.
") SendEnum;
		void SendEnum(TCollection_AsciiString val);

		/****** StepData_StepWriter::SendEnum ******/
		/****** md5 signature: ece5bc46b726e98cedf51fd63ae16366 ******/
		%feature("compactdefaultargs") SendEnum;
		%feature("autodoc", "
Parameters
----------
val: str

Return
-------
None

Description
-----------
sends an enum given by String (literal expression) adds '.' around it if not done.
") SendEnum;
		void SendEnum(Standard_CString val);

		/****** StepData_StepWriter::SendField ******/
		/****** md5 signature: d6d4a7b78133afcc05bebc4b4655a49e ******/
		%feature("compactdefaultargs") SendField;
		%feature("autodoc", "
Parameters
----------
fild: StepData_Field
descr: StepData_PDescr

Return
-------
None

Description
-----------
Sends the content of a field, controlled by its descriptor If the descriptor is not defined, follows the description detained by the field itself.
") SendField;
		void SendField(const StepData_Field & fild, const opencascade::handle<StepData_PDescr> & descr);

		/****** StepData_StepWriter::SendHeader ******/
		/****** md5 signature: b24bcb8c96d3cb4e3deb13e427cab17d ******/
		%feature("compactdefaultargs") SendHeader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Begins model header.
") SendHeader;
		void SendHeader();

		/****** StepData_StepWriter::SendIdent ******/
		/****** md5 signature: 49b63e5df47b48b91702d94c9463480e ******/
		%feature("compactdefaultargs") SendIdent;
		%feature("autodoc", "
Parameters
----------
ident: int

Return
-------
None

Description
-----------
begins an entity with an ident plus '=' (at beginning of line) entity ident is its Number given by the containing Model Warning: <ident> must be, either Number or Label, according LabelMode.
") SendIdent;
		void SendIdent(const Standard_Integer ident);

		/****** StepData_StepWriter::SendList ******/
		/****** md5 signature: 1414296a88bbf3b14e509572c1a4484d ******/
		%feature("compactdefaultargs") SendList;
		%feature("autodoc", "
Parameters
----------
list: StepData_FieldList
descr: StepData_ESDescr

Return
-------
None

Description
-----------
Send the content of an entity as being a FieldList controlled by its descriptor. This includes start and end brackets but not the entity type.
") SendList;
		void SendList(const StepData_FieldList & list, const opencascade::handle<StepData_ESDescr> & descr);

		/****** StepData_StepWriter::SendLogical ******/
		/****** md5 signature: 40303be65dc245b6220473e4177bb72d ******/
		%feature("compactdefaultargs") SendLogical;
		%feature("autodoc", "
Parameters
----------
val: StepData_Logical

Return
-------
None

Description
-----------
sends a Logical as .T. or .F. or .U. according its Value (it is a standard case of Enum for Step, and is built-in).
") SendLogical;
		void SendLogical(const StepData_Logical val);

		/****** StepData_StepWriter::SendModel ******/
		/****** md5 signature: c06391a4b90f77c973013ffd437c3d56 ******/
		%feature("compactdefaultargs") SendModel;
		%feature("autodoc", "
Parameters
----------
protocol: StepData_Protocol
headeronly: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sends the complete Model, included HEADER and DATA Sections Works with a WriterLib defined through a Protocol If <headeronly> is given True, only the HEADER Section is sent (used to Dump the Header of a StepModel).
") SendModel;
		void SendModel(const opencascade::handle<StepData_Protocol> & protocol, const Standard_Boolean headeronly = Standard_False);

		/****** StepData_StepWriter::SendScope ******/
		/****** md5 signature: 13f737207035a1625b7eed277cb3c0fd ******/
		%feature("compactdefaultargs") SendScope;
		%feature("autodoc", "Return
-------
None

Description
-----------
sets a begin of Scope (ends this line).
") SendScope;
		void SendScope();

		/****** StepData_StepWriter::SendSelect ******/
		/****** md5 signature: 2b8c73740d25b92d882bfe82d84b5294 ******/
		%feature("compactdefaultargs") SendSelect;
		%feature("autodoc", "
Parameters
----------
sm: StepData_SelectMember
descr: StepData_PDescr

Return
-------
None

Description
-----------
Sends a SelectMember, which cab be named or not.
") SendSelect;
		void SendSelect(const opencascade::handle<StepData_SelectMember> & sm, const opencascade::handle<StepData_PDescr> & descr);

		/****** StepData_StepWriter::SendString ******/
		/****** md5 signature: 670f90b97301166ddb1b79594e6e3578 ******/
		%feature("compactdefaultargs") SendString;
		%feature("autodoc", "
Parameters
----------
val: str

Return
-------
None

Description
-----------
sends a string exactly as it is given.
") SendString;
		void SendString(TCollection_AsciiString val);

		/****** StepData_StepWriter::SendString ******/
		/****** md5 signature: 2a52fec60aa726da40d31560629ccab1 ******/
		%feature("compactdefaultargs") SendString;
		%feature("autodoc", "
Parameters
----------
val: str

Return
-------
None

Description
-----------
sends a string exactly as it is given.
") SendString;
		void SendString(Standard_CString val);

		/****** StepData_StepWriter::SendUndef ******/
		/****** md5 signature: 2f7e3905171f54dc8bc4c8128123b2a0 ******/
		%feature("compactdefaultargs") SendUndef;
		%feature("autodoc", "Return
-------
None

Description
-----------
sends an undefined (optional absent) parameter (by '$').
") SendUndef;
		void SendUndef();

		/****** StepData_StepWriter::SetScope ******/
		/****** md5 signature: e36cf7e70b5de436eb88dbccfc35a009 ******/
		%feature("compactdefaultargs") SetScope;
		%feature("autodoc", "
Parameters
----------
numscope: int
numin: int

Return
-------
None

Description
-----------
Declares the Entity Number <numscope> to correspond to a Scope which contains the Entity Number <numin>. Several calls to the same <numscope> add Entities in this Scope, in this order. Error if <numin> is already declared in the Scope Warning: the declaration of the Scopes is assumed to be consistent, i.e. <numin> is not referenced from outside this Scope (not checked here).
") SetScope;
		void SetScope(const Standard_Integer numscope, const Standard_Integer numin);

		/****** StepData_StepWriter::StartComplex ******/
		/****** md5 signature: 32f5a1b6cc0ca2550cde910812f629aa ******/
		%feature("compactdefaultargs") StartComplex;
		%feature("autodoc", "Return
-------
None

Description
-----------
sends the start of a complex entity, which is a simple open bracket (without increasing bracket level) It must be called JUST AFTER SendEntity and BEFORE sending components, each one begins by StartEntity.
") StartComplex;
		void StartComplex();

		/****** StepData_StepWriter::StartEntity ******/
		/****** md5 signature: fb2e99a3062c663c9c61b42c2f9ee4a7 ******/
		%feature("compactdefaultargs") StartEntity;
		%feature("autodoc", "
Parameters
----------
atype: str

Return
-------
None

Description
-----------
sets entity's StepType, opens brackets, starts param no to 0 params are separated by comma Remark: for a Multiple Type Entity (see Express ANDOR clause) StartComplex must be called before sending components, then each 'Component' must be sent separately (one call to StartEntity for each one): the Type which precedes is then automatically closed. Once all the components have been sent, EndComplex must be called, then and only then EndEntity.
") StartEntity;
		void StartEntity(TCollection_AsciiString atype);


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
		/****** StepData_WriterLib::StepData_WriterLib ******/
		/****** md5 signature: 3894b0c0020e5edf82467f45cb01d35e ******/
		%feature("compactdefaultargs") StepData_WriterLib;
		%feature("autodoc", "
Parameters
----------
aprotocol: StepData_Protocol

Return
-------
None

Description
-----------
Creates a Library which complies with a Protocol, that is: Same class (criterium IsInstance) This creation gets the Modules from the global set, those which are bound to the given Protocol and its Resources.
") StepData_WriterLib;
		 StepData_WriterLib(const opencascade::handle<StepData_Protocol> & aprotocol);

		/****** StepData_WriterLib::StepData_WriterLib ******/
		/****** md5 signature: 072c08aa4766d338d8df8e8cd05de95b ******/
		%feature("compactdefaultargs") StepData_WriterLib;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty Library: it will later by filled by method AddProtocol.
") StepData_WriterLib;
		 StepData_WriterLib();

		/****** StepData_WriterLib::AddProtocol ******/
		/****** md5 signature: 97bedbaaa5336e800a60d78a56ab8c60 ******/
		%feature("compactdefaultargs") AddProtocol;
		%feature("autodoc", "
Parameters
----------
aprotocol: Standard_Transient

Return
-------
None

Description
-----------
Adds a couple (Module-Protocol) to the Library, given the class of a Protocol. Takes Resources into account. (if <aprotocol> is not of type TheProtocol, it is not added).
") AddProtocol;
		void AddProtocol(const opencascade::handle<Standard_Transient> & aprotocol);

		/****** StepData_WriterLib::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the list of Modules of a library (can be used to redefine the order of Modules before action: Clear then refill the Library by calls to AddProtocol).
") Clear;
		void Clear();

		/****** StepData_WriterLib::Module ******/
		/****** md5 signature: fc6ebae4e625291cc922056721349877 ******/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_ReadWriteModule>

Description
-----------
Returns the current Module in the Iteration.
") Module;
		const opencascade::handle<StepData_ReadWriteModule> & Module();

		/****** StepData_WriterLib::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there are more Modules to iterate on.
") More;
		Standard_Boolean More();

		/****** StepData_WriterLib::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Iterates by getting the next Module in the list If there is none, the exception will be raised by Value.
") Next;
		void Next();

		/****** StepData_WriterLib::Protocol ******/
		/****** md5 signature: be143b1e7168aac7c0bb42807f3196d4 ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_Protocol>

Description
-----------
Returns the current Protocol in the Iteration.
") Protocol;
		const opencascade::handle<StepData_Protocol> & Protocol();

		/****** StepData_WriterLib::Select ******/
		/****** md5 signature: a51c195de5d83ca9713c7290686aba5f ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
obj: Standard_Transient
module: StepData_ReadWriteModule

Return
-------
CN: int

Description
-----------
Selects a Module from the Library, given an Object. Returns True if Select has succeeded, False else. Also Returns (as arguments) the selected Module and the Case Number determined by the associated Protocol. If Select has failed, <module> is Null Handle and CN is zero. (Select can work on any criterium, such as Object DynamicType).
") Select;
		Standard_Boolean Select(const opencascade::handle<Standard_Transient> & obj, opencascade::handle<StepData_ReadWriteModule> & module, Standard_Integer &OutValue);

		/****** StepData_WriterLib::SetComplete ******/
		/****** md5 signature: 9b2529d2e257b2464fe4d8064a8a0171 ******/
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets a library to be defined with the complete Global list (all the couples Protocol/Modules recorded in it).
") SetComplete;
		void SetComplete();

		/****** StepData_WriterLib::SetGlobal ******/
		/****** md5 signature: 8e9a51f241a0abb5e5c65cd99654308f ******/
		%feature("compactdefaultargs") SetGlobal;
		%feature("autodoc", "
Parameters
----------
amodule: StepData_ReadWriteModule
aprotocol: StepData_Protocol

Return
-------
None

Description
-----------
Adds a couple (Module-Protocol) into the global definition set for this class of Library.
") SetGlobal;
		static void SetGlobal(const opencascade::handle<StepData_ReadWriteModule> & amodule, const opencascade::handle<StepData_Protocol> & aprotocol);

		/****** StepData_WriterLib::Start ******/
		/****** md5 signature: f8a4dbf1e6f2cec0927301856b440be5 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
None

Description
-----------
Starts Iteration on the Modules (sets it on the first one).
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
		/****** StepData_DefaultGeneral::StepData_DefaultGeneral ******/
		/****** md5 signature: afaa8a3ac6f1ab62d6bfa817e1ff28b5 ******/
		%feature("compactdefaultargs") StepData_DefaultGeneral;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a Default General Module.
") StepData_DefaultGeneral;
		 StepData_DefaultGeneral();

		/****** StepData_DefaultGeneral::CheckCase ******/
		/****** md5 signature: b796d698a150ad077075774d191929c9 ******/
		%feature("compactdefaultargs") CheckCase;
		%feature("autodoc", "
Parameters
----------
casenum: int
ent: Standard_Transient
shares: Interface_ShareTool
ach: Interface_Check

Return
-------
None

Description
-----------
Specific Checking of an Entity <ent>.
") CheckCase;
		void CheckCase(const Standard_Integer casenum, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****** StepData_DefaultGeneral::CopyCase ******/
		/****** md5 signature: 212e95473a977b4001621330a5cbd483 ******/
		%feature("compactdefaultargs") CopyCase;
		%feature("autodoc", "
Parameters
----------
casenum: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Return
-------
None

Description
-----------
Specific Copy ('Deep') from <entfrom> to <entto> (same type) by using a CopyTool which provides its working Map. Use method Transferred from TransferControl to work.
") CopyCase;
		void CopyCase(const Standard_Integer casenum, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****** StepData_DefaultGeneral::FillSharedCase ******/
		/****** md5 signature: 840a5ecbc52b201313429f5901c0dea9 ******/
		%feature("compactdefaultargs") FillSharedCase;
		%feature("autodoc", "
Parameters
----------
casenum: int
ent: Standard_Transient
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
Specific filling of the list of Entities shared by an Entity <ent>, which is an UnknownEntity from StepData.
") FillSharedCase;
		void FillSharedCase(const Standard_Integer casenum, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****** StepData_DefaultGeneral::NewVoid ******/
		/****** md5 signature: 8e184c5622d3823d145bc2105790b57a ******/
		%feature("compactdefaultargs") NewVoid;
		%feature("autodoc", "
Parameters
----------
CN: int
entto: Standard_Transient

Return
-------
bool

Description
-----------
Specific creation of a new void entity.
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
		/****** StepData_ECDescr::StepData_ECDescr ******/
		/****** md5 signature: d8ef3643a24662400d54c72845296abf ******/
		%feature("compactdefaultargs") StepData_ECDescr;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an ECDescr, empty.
") StepData_ECDescr;
		 StepData_ECDescr();

		/****** StepData_ECDescr::Add ******/
		/****** md5 signature: eec77b5ba05bca0da8120c96b3b79ac8 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
member: StepData_ESDescr

Return
-------
None

Description
-----------
Adds a member Warning: members are added in alphabetic order.
") Add;
		void Add(const opencascade::handle<StepData_ESDescr> & member);

		/****** StepData_ECDescr::IsComplex ******/
		/****** md5 signature: 3fa56289b77889af0bfdd6826c1eed29 ******/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsComplex;
		Standard_Boolean IsComplex();

		/****** StepData_ECDescr::Matches ******/
		/****** md5 signature: b3ebc80ca8903672d866072d9df6eac3 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
steptype: str

Return
-------
bool

Description
-----------
Tells if a ESDescr matches a step type: exact or super type.
") Matches;
		Standard_Boolean Matches(Standard_CString steptype);

		/****** StepData_ECDescr::Member ******/
		/****** md5 signature: 435d565cdd42b6028f2889346da774f8 ******/
		%feature("compactdefaultargs") Member;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepData_ESDescr>

Description
-----------
Returns a Member from its rank.
") Member;
		opencascade::handle<StepData_ESDescr> Member(const Standard_Integer num);

		/****** StepData_ECDescr::NbMembers ******/
		/****** md5 signature: 8e81ec5aa56286fcf33294c6bf3fd7e1 ******/
		%feature("compactdefaultargs") NbMembers;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of members.
") NbMembers;
		Standard_Integer NbMembers();

		/****** StepData_ECDescr::NewEntity ******/
		/****** md5 signature: 2cc8d3f443b3d28ca36d56627d2eaa9b ******/
		%feature("compactdefaultargs") NewEntity;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_Described>

Description
-----------
Creates a described entity (i.e. a complex one, made of one simple entity per member).
") NewEntity;
		opencascade::handle<StepData_Described> NewEntity();

		/****** StepData_ECDescr::TypeList ******/
		/****** md5 signature: 07b37aa698431b74a0484fd073417a16 ******/
		%feature("compactdefaultargs") TypeList;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfAsciiString>

Description
-----------
Returns the ordered list of types.
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
		/****** StepData_ESDescr::StepData_ESDescr ******/
		/****** md5 signature: e3b7652268c9e2a9ef78b6139d1ed560 ******/
		%feature("compactdefaultargs") StepData_ESDescr;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
None

Description
-----------
Creates an ESDescr with a type name.
") StepData_ESDescr;
		 StepData_ESDescr(Standard_CString name);

		/****** StepData_ESDescr::Base ******/
		/****** md5 signature: ea04cb6a986eaf32f4a3b105c2ff525b ******/
		%feature("compactdefaultargs") Base;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_ESDescr>

Description
-----------
Returns the basic ESDescr, null if <self> is not derived.
") Base;
		opencascade::handle<StepData_ESDescr> Base();

		/****** StepData_ESDescr::Field ******/
		/****** md5 signature: e0a7a1ca0b253e518fc233cd0b736d1f ******/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepData_PDescr>

Description
-----------
Returns the PDescr for the field <num> (or Null).
") Field;
		opencascade::handle<StepData_PDescr> Field(const Standard_Integer num);

		/****** StepData_ESDescr::IsComplex ******/
		/****** md5 signature: 3fa56289b77889af0bfdd6826c1eed29 ******/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsComplex;
		Standard_Boolean IsComplex();

		/****** StepData_ESDescr::IsSub ******/
		/****** md5 signature: f420d4ccccf7c54cb3ff3797f5c1c465 ******/
		%feature("compactdefaultargs") IsSub;
		%feature("autodoc", "
Parameters
----------
other: StepData_ESDescr

Return
-------
bool

Description
-----------
Tells if <self> is sub-type of (or equal to) another one.
") IsSub;
		Standard_Boolean IsSub(const opencascade::handle<StepData_ESDescr> & other);

		/****** StepData_ESDescr::Matches ******/
		/****** md5 signature: b3ebc80ca8903672d866072d9df6eac3 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
steptype: str

Return
-------
bool

Description
-----------
Tells if a ESDescr matches a step type: exact or super type.
") Matches;
		Standard_Boolean Matches(Standard_CString steptype);

		/****** StepData_ESDescr::Name ******/
		/****** md5 signature: 9147a7d0c7cc3f58d615827664b3d780 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
str

Description
-----------
Returns the name of a field from its rank. empty if outofrange.
") Name;
		Standard_CString Name(const Standard_Integer num);

		/****** StepData_ESDescr::NamedField ******/
		/****** md5 signature: a022259a4403307aba71981645b428da ******/
		%feature("compactdefaultargs") NamedField;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<StepData_PDescr>

Description
-----------
Returns the PDescr for the field named <name> (or Null).
") NamedField;
		opencascade::handle<StepData_PDescr> NamedField(Standard_CString name);

		/****** StepData_ESDescr::NbFields ******/
		/****** md5 signature: 3a0202b8c2c96cf1ff6b7765aa84d699 ******/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of fields.
") NbFields;
		Standard_Integer NbFields();

		/****** StepData_ESDescr::NewEntity ******/
		/****** md5 signature: 2cc8d3f443b3d28ca36d56627d2eaa9b ******/
		%feature("compactdefaultargs") NewEntity;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_Described>

Description
-----------
Creates a described entity (i.e. a simple one).
") NewEntity;
		opencascade::handle<StepData_Described> NewEntity();

		/****** StepData_ESDescr::Rank ******/
		/****** md5 signature: 74e4ffa5bb58ee75e763f5f649866e59 ******/
		%feature("compactdefaultargs") Rank;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
int

Description
-----------
Returns the rank of a field from its name. 0 if unknown.
") Rank;
		Standard_Integer Rank(Standard_CString name);

		/****** StepData_ESDescr::SetBase ******/
		/****** md5 signature: 07f8051ecaa95846bec41a717b24c354 ******/
		%feature("compactdefaultargs") SetBase;
		%feature("autodoc", "
Parameters
----------
base: StepData_ESDescr

Return
-------
None

Description
-----------
Sets an ESDescr as based on another one Hence, if there are inherited fields, the derived ESDescr cumulates all them, while the base just records its own ones.
") SetBase;
		void SetBase(const opencascade::handle<StepData_ESDescr> & base);

		/****** StepData_ESDescr::SetField ******/
		/****** md5 signature: 0e14bb3b67bd94de6ba8c30c9f78683b ******/
		%feature("compactdefaultargs") SetField;
		%feature("autodoc", "
Parameters
----------
num: int
name: str
descr: StepData_PDescr

Return
-------
None

Description
-----------
Sets a PDescr to describe a field A Field is designated by its rank and name.
") SetField;
		void SetField(const Standard_Integer num, Standard_CString name, const opencascade::handle<StepData_PDescr> & descr);

		/****** StepData_ESDescr::SetNbFields ******/
		/****** md5 signature: 50335a67d4b95ef42d6982fcae5c2187 ******/
		%feature("compactdefaultargs") SetNbFields;
		%feature("autodoc", "
Parameters
----------
nb: int

Return
-------
None

Description
-----------
Sets a new count of fields Each one is described by a PDescr.
") SetNbFields;
		void SetNbFields(const Standard_Integer nb);

		/****** StepData_ESDescr::SetSuper ******/
		/****** md5 signature: 8c0f391472f8b772cf2c95f086f41d64 ******/
		%feature("compactdefaultargs") SetSuper;
		%feature("autodoc", "
Parameters
----------
super: StepData_ESDescr

Return
-------
None

Description
-----------
Sets an ESDescr as 'super-type'. Applies an a base (non derived) ESDescr.
") SetSuper;
		void SetSuper(const opencascade::handle<StepData_ESDescr> & super);

		/****** StepData_ESDescr::StepType ******/
		/****** md5 signature: 1cc7b85b5264351a7b2b25f30c5b661d ******/
		%feature("compactdefaultargs") StepType;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the type name as an AsciiString.
") StepType;
		const TCollection_AsciiString & StepType();

		/****** StepData_ESDescr::Super ******/
		/****** md5 signature: 849cec13f0eadae6d17e1e2f434bc384 ******/
		%feature("compactdefaultargs") Super;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_ESDescr>

Description
-----------
Returns the super-type ESDescr, null if <self> is root.
") Super;
		opencascade::handle<StepData_ESDescr> Super();

		/****** StepData_ESDescr::TypeName ******/
		/****** md5 signature: e40228db966cdd2b08c74c84594a73bf ******/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the type name given at creation time.
") TypeName;
		Standard_CString TypeName();

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
		/****** StepData_FieldList1::StepData_FieldList1 ******/
		/****** md5 signature: cfe1cd631d0b101136a6a29c9222efeb ******/
		%feature("compactdefaultargs") StepData_FieldList1;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a FieldList of 1 Field.
") StepData_FieldList1;
		 StepData_FieldList1();

		/****** StepData_FieldList1::CField ******/
		/****** md5 signature: 1b6b52fc01f6e04947dbba58911e9348 ******/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepData_Field

Description
-----------
Returns the field n0 <num> between 1 and NbFields, in order to modify its content.
") CField;
		virtual StepData_Field & CField(const Standard_Integer num);

		/****** StepData_FieldList1::Field ******/
		/****** md5 signature: 9b18ada02aca1ed24117b08a90dccf5c ******/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepData_Field

Description
-----------
Returns the field n0 <num> between 1 and NbFields (read only).
") Field;
		virtual const StepData_Field & Field(const Standard_Integer num);

		/****** StepData_FieldList1::NbFields ******/
		/****** md5 signature: 75c0edacc367c4dfa474083d1ff15eef ******/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of fields. Here, returns 1.
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
		/****** StepData_FieldListD::StepData_FieldListD ******/
		/****** md5 signature: 0a3480e10f72c61c1d3ff19ae38eb17f ******/
		%feature("compactdefaultargs") StepData_FieldListD;
		%feature("autodoc", "
Parameters
----------
nb: int

Return
-------
None

Description
-----------
Creates a FieldListD of <nb> Fields.
") StepData_FieldListD;
		 StepData_FieldListD(const Standard_Integer nb);

		/****** StepData_FieldListD::CField ******/
		/****** md5 signature: 1b6b52fc01f6e04947dbba58911e9348 ******/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepData_Field

Description
-----------
Returns the field n0 <num> between 1 and NbFields, in order to modify its content.
") CField;
		virtual StepData_Field & CField(const Standard_Integer num);

		/****** StepData_FieldListD::Field ******/
		/****** md5 signature: 9b18ada02aca1ed24117b08a90dccf5c ******/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepData_Field

Description
-----------
Returns the field n0 <num> between 1 and NbFields (read only).
") Field;
		virtual const StepData_Field & Field(const Standard_Integer num);

		/****** StepData_FieldListD::NbFields ******/
		/****** md5 signature: 75c0edacc367c4dfa474083d1ff15eef ******/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of fields. Here, returns starting <nb>.
") NbFields;
		virtual Standard_Integer NbFields();

		/****** StepData_FieldListD::SetNb ******/
		/****** md5 signature: 9c23f2226c3d0d27e4de6fc8bf4462c7 ******/
		%feature("compactdefaultargs") SetNb;
		%feature("autodoc", "
Parameters
----------
nb: int

Return
-------
None

Description
-----------
Sets a new count of Fields. Former contents are lost.
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
		/****** StepData_FieldListN::StepData_FieldListN ******/
		/****** md5 signature: 5922b172c38ba9df3ba8947317c430c1 ******/
		%feature("compactdefaultargs") StepData_FieldListN;
		%feature("autodoc", "
Parameters
----------
nb: int

Return
-------
None

Description
-----------
Creates a FieldListN of <nb> Fields.
") StepData_FieldListN;
		 StepData_FieldListN(const Standard_Integer nb);

		/****** StepData_FieldListN::CField ******/
		/****** md5 signature: 1b6b52fc01f6e04947dbba58911e9348 ******/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepData_Field

Description
-----------
Returns the field n0 <num> between 1 and NbFields, in order to modify its content.
") CField;
		virtual StepData_Field & CField(const Standard_Integer num);

		/****** StepData_FieldListN::Field ******/
		/****** md5 signature: 9b18ada02aca1ed24117b08a90dccf5c ******/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepData_Field

Description
-----------
Returns the field n0 <num> between 1 and NbFields (read only).
") Field;
		virtual const StepData_Field & Field(const Standard_Integer num);

		/****** StepData_FieldListN::NbFields ******/
		/****** md5 signature: 75c0edacc367c4dfa474083d1ff15eef ******/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of fields. Here, returns starting <nb>.
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
		/****** StepData_FileProtocol::StepData_FileProtocol ******/
		/****** md5 signature: 6d5b5355aa41345afbe9689dc00842f1 ******/
		%feature("compactdefaultargs") StepData_FileProtocol;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty FileProtocol.
") StepData_FileProtocol;
		 StepData_FileProtocol();

		/****** StepData_FileProtocol::Add ******/
		/****** md5 signature: 0c8830e5ed68a81bd078ad9148cb7bea ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
protocol: StepData_Protocol

Return
-------
None

Description
-----------
Adds a Protocol to the definition list of the FileProtocol But ensures that each class of Protocol is present only once in this list.
") Add;
		void Add(const opencascade::handle<StepData_Protocol> & protocol);

		/****** StepData_FileProtocol::GlobalCheck ******/
		/****** md5 signature: 0c271e5ee55036c2344ebf1a4f07ae92 ******/
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
ach: Interface_Check

Return
-------
bool

Description
-----------
Calls GlobalCheck for each of its recorded resources.
") GlobalCheck;
		virtual Standard_Boolean GlobalCheck(const Interface_Graph & G, opencascade::handle<Interface_Check> & ach);

		/****** StepData_FileProtocol::NbResources ******/
		/****** md5 signature: cd524335b33aeb6eb83cc80f6b7e5681 ******/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the count of Protocols used as Resource (can be zero) i.e. the count of Protocol recorded by calling the method Add.
") NbResources;
		virtual Standard_Integer NbResources();

		/****** StepData_FileProtocol::Resource ******/
		/****** md5 signature: 26597e9d8db9fc70530508f766cf0d70 ******/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns a Resource, given a rank. Here, rank of calling Add.
") Resource;
		virtual opencascade::handle<Interface_Protocol> Resource(const Standard_Integer num);

		/****** StepData_FileProtocol::SchemaName ******/
		/****** md5 signature: 52640e28819c7e829718ce5927c4da83 ******/
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "
Parameters
----------
theModel: Interface_InterfaceModel

Return
-------
str

Description
-----------
Returns the Schema Name attached to each class of Protocol To be redefined by each sub-class Here, SchemaName returns '' (empty String) was C++: return const.
") SchemaName;
		virtual Standard_CString SchemaName(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****** StepData_FileProtocol::TypeNumber ******/
		/****** md5 signature: f4ed4f2e12d80f3bd752f6dd34ed84b4 ******/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type

Return
-------
int

Description
-----------
Returns a Case Number, specific of each recognized Type Here, NO Type at all is recognized properly: all Types are recognized by the resources.
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
		/****** StepData_Plex::StepData_Plex ******/
		/****** md5 signature: ee16f92790fc28435c1f638f98787f28 ******/
		%feature("compactdefaultargs") StepData_Plex;
		%feature("autodoc", "
Parameters
----------
descr: StepData_ECDescr

Return
-------
None

Description
-----------
Creates a Plex (empty). The complete creation is made by the ECDescr itself, by calling Add.
") StepData_Plex;
		 StepData_Plex(const opencascade::handle<StepData_ECDescr> & descr);

		/****** StepData_Plex::Add ******/
		/****** md5 signature: 140b3b43c6abfe481ad1d13f73122e86 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
member: StepData_Simple

Return
-------
None

Description
-----------
Adds a member to <self>.
") Add;
		void Add(const opencascade::handle<StepData_Simple> & member);

		/****** StepData_Plex::As ******/
		/****** md5 signature: e00bfbdc02f2f3b0e5cdb40024fe70aa ******/
		%feature("compactdefaultargs") As;
		%feature("autodoc", "
Parameters
----------
steptype: str

Return
-------
opencascade::handle<StepData_Simple>

Description
-----------
Returns a Simple Entity which matches with a Type in <self>: For a Simple Entity: me if it matches, else a null handle For a Complex Entity: the member which matches, else null.
") As;
		opencascade::handle<StepData_Simple> As(Standard_CString steptype);

		/****** StepData_Plex::CField ******/
		/****** md5 signature: 40f3201ea099aeccb82acc5445d0f96e ******/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
StepData_Field

Description
-----------
Returns a Field from its name; read or write.
") CField;
		StepData_Field & CField(Standard_CString name);

		/****** StepData_Plex::Check ******/
		/****** md5 signature: 391f0e357b34862749cae0a57bd47b8d ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
ach: Interface_Check

Return
-------
None

Description
-----------
Fills a Check by using its Description.
") Check;
		void Check(opencascade::handle<Interface_Check> & ach);

		/****** StepData_Plex::ECDescr ******/
		/****** md5 signature: d184cfc8d6f007b43e15858c6570254e ******/
		%feature("compactdefaultargs") ECDescr;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_ECDescr>

Description
-----------
Returns the Description as for a Plex.
") ECDescr;
		opencascade::handle<StepData_ECDescr> ECDescr();

		/****** StepData_Plex::Field ******/
		/****** md5 signature: 77c9826bda429d5f3045df93b81bfc9d ******/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
StepData_Field

Description
-----------
Returns a Field from its name; read-only.
") Field;
		const StepData_Field & Field(Standard_CString name);

		/****** StepData_Plex::HasField ******/
		/****** md5 signature: d3dae4e2aed9325ead74f94179c5b06c ******/
		%feature("compactdefaultargs") HasField;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Tells if a Field brings a given name.
") HasField;
		Standard_Boolean HasField(Standard_CString name);

		/****** StepData_Plex::IsComplex ******/
		/****** md5 signature: 3fa56289b77889af0bfdd6826c1eed29 ******/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsComplex;
		Standard_Boolean IsComplex();

		/****** StepData_Plex::Matches ******/
		/****** md5 signature: b3ebc80ca8903672d866072d9df6eac3 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
steptype: str

Return
-------
bool

Description
-----------
Tells if a step type is matched by <self> For a Simple Entity: own type or super type For a Complex Entity: one of the members.
") Matches;
		Standard_Boolean Matches(Standard_CString steptype);

		/****** StepData_Plex::Member ******/
		/****** md5 signature: c3076bfab7e254207a7d2740ed587727 ******/
		%feature("compactdefaultargs") Member;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepData_Simple>

Description
-----------
Returns a simple member from its rank.
") Member;
		opencascade::handle<StepData_Simple> Member(const Standard_Integer num);

		/****** StepData_Plex::NbMembers ******/
		/****** md5 signature: 8e81ec5aa56286fcf33294c6bf3fd7e1 ******/
		%feature("compactdefaultargs") NbMembers;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of simple members.
") NbMembers;
		Standard_Integer NbMembers();

		/****** StepData_Plex::Shared ******/
		/****** md5 signature: cb09e6cfaa5b4cb4d07e5348e0bd3aeb ******/
		%feature("compactdefaultargs") Shared;
		%feature("autodoc", "
Parameters
----------
list: Interface_EntityIterator

Return
-------
None

Description
-----------
Fills an EntityIterator with entities shared by <self>.
") Shared;
		void Shared(Interface_EntityIterator & list);

		/****** StepData_Plex::TypeList ******/
		/****** md5 signature: 07b37aa698431b74a0484fd073417a16 ******/
		%feature("compactdefaultargs") TypeList;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfAsciiString>

Description
-----------
Returns the actual list of members types.
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
		/****** StepData_SelectInt::StepData_SelectInt ******/
		/****** md5 signature: f4b272846b101e949ef642f18ef93f8f ******/
		%feature("compactdefaultargs") StepData_SelectInt;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepData_SelectInt;
		 StepData_SelectInt();

		/****** StepData_SelectInt::Int ******/
		/****** md5 signature: e1d47d32e1361d73ced760c08d2c59fc ******/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Int;
		virtual Standard_Integer Int();

		/****** StepData_SelectInt::Kind ******/
		/****** md5 signature: 6b65ec6e888ef74a618fe34525b57903 ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Kind;
		virtual Standard_Integer Kind();

		/****** StepData_SelectInt::SetInt ******/
		/****** md5 signature: 35b20bd74a27947e1ed53d4f2331415b ******/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "
Parameters
----------
val: int

Return
-------
None

Description
-----------
No available documentation.
") SetInt;
		virtual void SetInt(const Standard_Integer val);

		/****** StepData_SelectInt::SetKind ******/
		/****** md5 signature: 0644e60e01d80780dae47df016915fac ******/
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "
Parameters
----------
kind: int

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepData_SelectNamed::StepData_SelectNamed ******/
		/****** md5 signature: 036c6b21090bd900c4ec9ba5f9de8392 ******/
		%feature("compactdefaultargs") StepData_SelectNamed;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepData_SelectNamed;
		 StepData_SelectNamed();

		/****** StepData_SelectNamed::CField ******/
		/****** md5 signature: 41479025df2fccc852073319e7b17235 ******/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "Return
-------
StepData_Field

Description
-----------
No available documentation.
") CField;
		StepData_Field & CField();

		/****** StepData_SelectNamed::Field ******/
		/****** md5 signature: 7529d55b5b7df4ca4246175b9d436a91 ******/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "Return
-------
StepData_Field

Description
-----------
No available documentation.
") Field;
		const StepData_Field & Field();

		/****** StepData_SelectNamed::HasName ******/
		/****** md5 signature: c4b2dbd737f3c98314fdb7955ce91c2a ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasName;
		virtual Standard_Boolean HasName();

		/****** StepData_SelectNamed::Int ******/
		/****** md5 signature: e1d47d32e1361d73ced760c08d2c59fc ******/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "Return
-------
int

Description
-----------
This internal method gives access to a value implemented by an Integer (to read it).
") Int;
		virtual Standard_Integer Int();

		/****** StepData_SelectNamed::Kind ******/
		/****** md5 signature: 6b65ec6e888ef74a618fe34525b57903 ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Kind;
		virtual Standard_Integer Kind();

		/****** StepData_SelectNamed::Name ******/
		/****** md5 signature: d654a4ee9a75d24a9c3f33853f908999 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
No available documentation.
") Name;
		virtual Standard_CString Name();

		/****** StepData_SelectNamed::Real ******/
		/****** md5 signature: c9456a7c56ea266ceb625e159fd1b575 ******/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Real;
		virtual Standard_Real Real();

		/****** StepData_SelectNamed::SetInt ******/
		/****** md5 signature: 35b20bd74a27947e1ed53d4f2331415b ******/
		%feature("compactdefaultargs") SetInt;
		%feature("autodoc", "
Parameters
----------
val: int

Return
-------
None

Description
-----------
This internal method gives access to a value implemented by an Integer (to set it).
") SetInt;
		virtual void SetInt(const Standard_Integer val);

		/****** StepData_SelectNamed::SetKind ******/
		/****** md5 signature: 0644e60e01d80780dae47df016915fac ******/
		%feature("compactdefaultargs") SetKind;
		%feature("autodoc", "
Parameters
----------
kind: int

Return
-------
None

Description
-----------
No available documentation.
") SetKind;
		virtual void SetKind(const Standard_Integer kind);

		/****** StepData_SelectNamed::SetName ******/
		/****** md5 signature: cb088c8a5caf9447945830483c3112e7 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
No available documentation.
") SetName;
		virtual Standard_Boolean SetName(Standard_CString name);

		/****** StepData_SelectNamed::SetReal ******/
		/****** md5 signature: 12ca179780b0a6880b41325c17c33afd ******/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "
Parameters
----------
val: float

Return
-------
None

Description
-----------
No available documentation.
") SetReal;
		virtual void SetReal(const Standard_Real val);

		/****** StepData_SelectNamed::SetString ******/
		/****** md5 signature: cedc4b81002c588163e57c780672a9a6 ******/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "
Parameters
----------
val: str

Return
-------
None

Description
-----------
No available documentation.
") SetString;
		virtual void SetString(Standard_CString val);

		/****** StepData_SelectNamed::String ******/
		/****** md5 signature: c8e7159fddba166cd70249088a18f326 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
str

Description
-----------
No available documentation.
") String;
		virtual Standard_CString String();

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
		/****** StepData_SelectReal::StepData_SelectReal ******/
		/****** md5 signature: 3bfcda086f839b0f300bb7e27bd7e0c6 ******/
		%feature("compactdefaultargs") StepData_SelectReal;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepData_SelectReal;
		 StepData_SelectReal();

		/****** StepData_SelectReal::Kind ******/
		/****** md5 signature: 6b65ec6e888ef74a618fe34525b57903 ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Kind;
		virtual Standard_Integer Kind();

		/****** StepData_SelectReal::Real ******/
		/****** md5 signature: c9456a7c56ea266ceb625e159fd1b575 ******/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Real;
		virtual Standard_Real Real();

		/****** StepData_SelectReal::SetReal ******/
		/****** md5 signature: 12ca179780b0a6880b41325c17c33afd ******/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "
Parameters
----------
val: float

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepData_Simple::StepData_Simple ******/
		/****** md5 signature: bdd63a134739cb43d4ebf886a2efea26 ******/
		%feature("compactdefaultargs") StepData_Simple;
		%feature("autodoc", "
Parameters
----------
descr: StepData_ESDescr

Return
-------
None

Description
-----------
Creates a Simple Entity.
") StepData_Simple;
		 StepData_Simple(const opencascade::handle<StepData_ESDescr> & descr);

		/****** StepData_Simple::As ******/
		/****** md5 signature: e00bfbdc02f2f3b0e5cdb40024fe70aa ******/
		%feature("compactdefaultargs") As;
		%feature("autodoc", "
Parameters
----------
steptype: str

Return
-------
opencascade::handle<StepData_Simple>

Description
-----------
Returns a Simple Entity which matches with a Type in <self>: For a Simple Entity: me if it matches, else a null handle For a Complex Entity: the member which matches, else null.
") As;
		opencascade::handle<StepData_Simple> As(Standard_CString steptype);

		/****** StepData_Simple::CField ******/
		/****** md5 signature: 40f3201ea099aeccb82acc5445d0f96e ******/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
StepData_Field

Description
-----------
Returns a Field from its name; read or write.
") CField;
		StepData_Field & CField(Standard_CString name);

		/****** StepData_Simple::CFieldNum ******/
		/****** md5 signature: a7d486756179e14ce3b0b453f3f39c7a ******/
		%feature("compactdefaultargs") CFieldNum;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepData_Field

Description
-----------
Returns a field from its rank, in order to modify it.
") CFieldNum;
		StepData_Field & CFieldNum(const Standard_Integer num);

		/****** StepData_Simple::CFields ******/
		/****** md5 signature: f5599bdac48411c5f4a346515f0306c0 ******/
		%feature("compactdefaultargs") CFields;
		%feature("autodoc", "Return
-------
StepData_FieldListN

Description
-----------
Returns the entire field list, read or write.
") CFields;
		StepData_FieldListN & CFields();

		/****** StepData_Simple::Check ******/
		/****** md5 signature: 391f0e357b34862749cae0a57bd47b8d ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
ach: Interface_Check

Return
-------
None

Description
-----------
Fills a Check by using its Description.
") Check;
		void Check(opencascade::handle<Interface_Check> & ach);

		/****** StepData_Simple::ESDescr ******/
		/****** md5 signature: fa9322e7d1d412419d30de936a5f09c6 ******/
		%feature("compactdefaultargs") ESDescr;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_ESDescr>

Description
-----------
Returns description, as for simple.
") ESDescr;
		opencascade::handle<StepData_ESDescr> ESDescr();

		/****** StepData_Simple::Field ******/
		/****** md5 signature: 77c9826bda429d5f3045df93b81bfc9d ******/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
StepData_Field

Description
-----------
Returns a Field from its name; read-only.
") Field;
		const StepData_Field & Field(Standard_CString name);

		/****** StepData_Simple::FieldNum ******/
		/****** md5 signature: 468afcfd3ad5be1751459fde7fa1aa3d ******/
		%feature("compactdefaultargs") FieldNum;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepData_Field

Description
-----------
Returns a field from its rank, for read-only use.
") FieldNum;
		const StepData_Field & FieldNum(const Standard_Integer num);

		/****** StepData_Simple::Fields ******/
		/****** md5 signature: 21f22355e99961c86e183f991e523ec8 ******/
		%feature("compactdefaultargs") Fields;
		%feature("autodoc", "Return
-------
StepData_FieldListN

Description
-----------
Returns the entire field list, read-only.
") Fields;
		const StepData_FieldListN & Fields();

		/****** StepData_Simple::HasField ******/
		/****** md5 signature: d3dae4e2aed9325ead74f94179c5b06c ******/
		%feature("compactdefaultargs") HasField;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Tells if a Field brings a given name.
") HasField;
		Standard_Boolean HasField(Standard_CString name);

		/****** StepData_Simple::IsComplex ******/
		/****** md5 signature: 3fa56289b77889af0bfdd6826c1eed29 ******/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsComplex;
		Standard_Boolean IsComplex();

		/****** StepData_Simple::Matches ******/
		/****** md5 signature: b3ebc80ca8903672d866072d9df6eac3 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
steptype: str

Return
-------
bool

Description
-----------
Tells if a step type is matched by <self> For a Simple Entity: own type or super type For a Complex Entity: one of the members.
") Matches;
		Standard_Boolean Matches(Standard_CString steptype);

		/****** StepData_Simple::NbFields ******/
		/****** md5 signature: 3a0202b8c2c96cf1ff6b7765aa84d699 ******/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of fields.
") NbFields;
		Standard_Integer NbFields();

		/****** StepData_Simple::Shared ******/
		/****** md5 signature: cb09e6cfaa5b4cb4d07e5348e0bd3aeb ******/
		%feature("compactdefaultargs") Shared;
		%feature("autodoc", "
Parameters
----------
list: Interface_EntityIterator

Return
-------
None

Description
-----------
Fills an EntityIterator with entities shared by <self>.
") Shared;
		void Shared(Interface_EntityIterator & list);

		/****** StepData_Simple::StepType ******/
		/****** md5 signature: 9cdc25631c46d17d3135ea15b612a266 ******/
		%feature("compactdefaultargs") StepType;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the recorded StepType (TypeName of its ESDescr).
") StepType;
		Standard_CString StepType();

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
		/****** StepData_SelectArrReal::StepData_SelectArrReal ******/
		/****** md5 signature: fdf8da3b8a924d002635385c2ba547b3 ******/
		%feature("compactdefaultargs") StepData_SelectArrReal;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepData_SelectArrReal;
		 StepData_SelectArrReal();

		/****** StepData_SelectArrReal::ArrReal ******/
		/****** md5 signature: e0d5b60d28c635678174b491bcc8a716 ******/
		%feature("compactdefaultargs") ArrReal;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") ArrReal;
		opencascade::handle<TColStd_HArray1OfReal> ArrReal();

		/****** StepData_SelectArrReal::Kind ******/
		/****** md5 signature: 6b65ec6e888ef74a618fe34525b57903 ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Kind;
		virtual Standard_Integer Kind();

		/****** StepData_SelectArrReal::SetArrReal ******/
		/****** md5 signature: 0693802c089dd2cddf6308a155e0fd08 ******/
		%feature("compactdefaultargs") SetArrReal;
		%feature("autodoc", "
Parameters
----------
arr: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def stepdata_AddHeaderProtocol(*args):
	return stepdata.AddHeaderProtocol(*args)

@deprecated
def stepdata_HeaderProtocol(*args):
	return stepdata.HeaderProtocol(*args)

@deprecated
def stepdata_Init(*args):
	return stepdata.Init(*args)

@deprecated
def stepdata_Protocol(*args):
	return stepdata.Protocol(*args)

@deprecated
def StepData_WriterLib_SetGlobal(*args):
	return StepData_WriterLib.SetGlobal(*args)

}
