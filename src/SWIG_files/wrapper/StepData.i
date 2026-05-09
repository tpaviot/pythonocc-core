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
/* end handles declaration */

/* templates */
%template(StepData_Array1OfField) NCollection_Array1<StepData_Field>;
Array1ExtendIter(StepData_Field)

/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<StepData_Field> StepData_Array1OfField;
typedef NCollection_HArray1<StepData_Field> StepData_HArray1OfField;
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
		/****** md5 signature: c5aa999b1e6fc17df1b80a471d89bb65 ******/
		%feature("compactdefaultargs") As;
		%feature("autodoc", "
Parameters
----------
steptype: char *

Return
-------
opencascade::handle<StepData_Simple>

Description
-----------
Returns a Simple Entity which matches with a Type in <self>: For a Simple Entity: me if it matches, else a null handle For a Complex Entity: the member which matches, else null.
") As;
		virtual opencascade::handle<StepData_Simple> As(const char * const steptype);

		/****** StepData_Described::CField ******/
		/****** md5 signature: 93c0036e39f9878a4e0d32dd3c774487 ******/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
StepData_Field

Description
-----------
Returns a Field from its name; read or write.
") CField;
		virtual StepData_Field & CField(const char * const name);

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
		/****** md5 signature: 30bf6b6c6096e21073c7685b4218c746 ******/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
StepData_Field

Description
-----------
Returns a Field from its name; read-only.
") Field;
		virtual const StepData_Field & Field(const char * const name);

		/****** StepData_Described::HasField ******/
		/****** md5 signature: 794f09536ad862ecb4fc1cebf8d9a067 ******/
		%feature("compactdefaultargs") HasField;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Tells if a Field brings a given name.
") HasField;
		virtual bool HasField(const char * const name);

		/****** StepData_Described::IsComplex ******/
		/****** md5 signature: d099435b48ee3dc99917659ceaf34566 ******/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if a described entity is complex.
") IsComplex;
		virtual bool IsComplex();

		/****** StepData_Described::Matches ******/
		/****** md5 signature: 855c9488852ce1d9d633c91dd0dc694f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
steptype: char *

Return
-------
bool

Description
-----------
Tells if a step type is matched by <self> For a Simple Entity: own type or super type For a Complex Entity: one of the members.
") Matches;
		virtual bool Matches(const char * const steptype);

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
		/****** md5 signature: d099435b48ee3dc99917659ceaf34566 ******/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if a EDescr is complex (ECDescr) or simple (ESDescr).
") IsComplex;
		virtual bool IsComplex();

		/****** StepData_EDescr::Matches ******/
		/****** md5 signature: 855c9488852ce1d9d633c91dd0dc694f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
steptype: char *

Return
-------
bool

Description
-----------
Tells if a ESDescr matches a step type: exact or super type.
") Matches;
		virtual bool Matches(const char * const steptype);

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
		/****** md5 signature: 4e89cf618a6063d35835f68a5e227b0b ******/
		%feature("compactdefaultargs") StepData_EnumTool;
		%feature("autodoc", "
Parameters
----------
e0: char * (optional, default to "")
e1: char * (optional, default to "")
e2: char * (optional, default to "")
e3: char * (optional, default to "")
e4: char * (optional, default to "")
e5: char * (optional, default to "")
e6: char * (optional, default to "")
e7: char * (optional, default to "")
e8: char * (optional, default to "")
e9: char * (optional, default to "")
e10: char * (optional, default to "")
e11: char * (optional, default to "")
e12: char * (optional, default to "")
e13: char * (optional, default to "")
e14: char * (optional, default to "")
e15: char * (optional, default to "")
e16: char * (optional, default to "")
e17: char * (optional, default to "")
e18: char * (optional, default to "")
e19: char * (optional, default to "")
e20: char * (optional, default to "")
e21: char * (optional, default to "")
e22: char * (optional, default to "")
e23: char * (optional, default to "")
e24: char * (optional, default to "")
e25: char * (optional, default to "")
e26: char * (optional, default to "")
e27: char * (optional, default to "")
e28: char * (optional, default to "")
e29: char * (optional, default to "")
e30: char * (optional, default to "")
e31: char * (optional, default to "")
e32: char * (optional, default to "")
e33: char * (optional, default to "")
e34: char * (optional, default to "")
e35: char * (optional, default to "")
e36: char * (optional, default to "")
e37: char * (optional, default to "")
e38: char * (optional, default to "")
e39: char * (optional, default to "")

Return
-------
None

Description
-----------
Creates an EnumTool with definitions given by e0 .. e<max> Each definition string can bring one term, or several separated by blanks. Each term corresponds to one value of the enumeration, if dots are not presents they are added //! Such a static constructor allows to build a static description as: static StepData_EnumTool myenumtool('e0','e1'...); then use it without having to initialise it //! A null definition can be input by given '$' :the corresponding position is attached to 'null/undefined' value (as one particular item of the enumeration list).
") StepData_EnumTool;
		 StepData_EnumTool(const char * const e0 = "", const char * const e1 = "", const char * const e2 = "", const char * const e3 = "", const char * const e4 = "", const char * const e5 = "", const char * const e6 = "", const char * const e7 = "", const char * const e8 = "", const char * const e9 = "", const char * const e10 = "", const char * const e11 = "", const char * const e12 = "", const char * const e13 = "", const char * const e14 = "", const char * const e15 = "", const char * const e16 = "", const char * const e17 = "", const char * const e18 = "", const char * const e19 = "", const char * const e20 = "", const char * const e21 = "", const char * const e22 = "", const char * const e23 = "", const char * const e24 = "", const char * const e25 = "", const char * const e26 = "", const char * const e27 = "", const char * const e28 = "", const char * const e29 = "", const char * const e30 = "", const char * const e31 = "", const char * const e32 = "", const char * const e33 = "", const char * const e34 = "", const char * const e35 = "", const char * const e36 = "", const char * const e37 = "", const char * const e38 = "", const char * const e39 = "");

		/****** StepData_EnumTool::AddDefinition ******/
		/****** md5 signature: 3ae0b5feac7f4634153f117605679727 ******/
		%feature("compactdefaultargs") AddDefinition;
		%feature("autodoc", "
Parameters
----------
term: char *

Return
-------
None

Description
-----------
Processes a definition, splits it according blanks if any empty definitions are ignored A null definition can be input by given '$' :the corresponding position is attached to 'null/undefined' value (as one particular item of the enumeration list) See also IsSet.
") AddDefinition;
		void AddDefinition(const char * const term);

		/****** StepData_EnumTool::IsSet ******/
		/****** md5 signature: fa026a649a18f57fe3cfebbe001e5931 ******/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if at least one definition has been entered after creation time (i.e. by AddDefinition only) //! This allows to build a static description by a first pass: static StepData_EnumTool myenumtool('e0' ...); ... if (!myenumtool.IsSet()) { for further inits myenumtool.AddDefinition('e21'); ... }.
") IsSet;
		bool IsSet();

		/****** StepData_EnumTool::MaxValue ******/
		/****** md5 signature: afc35dfa5b10c9c829a1fac31890e520 ******/
		%feature("compactdefaultargs") MaxValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum integer for a suitable value Remark: while values begin at zero, MaxValue is the count of recorded values minus one.
") MaxValue;
		int MaxValue();

		/****** StepData_EnumTool::NullValue ******/
		/****** md5 signature: 3b8c27800289d268fe9ea1f1a9c28977 ******/
		%feature("compactdefaultargs") NullValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value attached to 'null/undefined value' If none is specified or if Optional has been set to False, returns -1 Null Value has been specified by definition '$'.
") NullValue;
		int NullValue();

		/****** StepData_EnumTool::Optional ******/
		/****** md5 signature: 28c9937a415f4ab07770bc7a0a866702 ******/
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
		void Optional(const bool mode);

		/****** StepData_EnumTool::Text ******/
		/****** md5 signature: bd6fa8b893f97a4046f037d1ecff2989 ******/
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
		const TCollection_AsciiString & Text(const int num);

		/****** StepData_EnumTool::Value ******/
		/****** md5 signature: ca7180abad55e267d1baee96055dd9e3 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
txt: char *

Return
-------
int

Description
-----------
Returns the numeric value found for a text The text must be in capitals and limited by dots A non-suitable text gives a negative value to be returned.
") Value;
		int Value(const char * const txt);

		/****** StepData_EnumTool::Value ******/
		/****** md5 signature: 81dae08844f36d30edff5a8604023d4f ******/
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
		int Value(TCollection_AsciiString txt);

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
		/****** md5 signature: a4fdf5b096820cb26e8793b5002c86f5 ******/
		%feature("compactdefaultargs") CascadeUnit;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns length unit for current transfer process (mm by default).
") CascadeUnit;
		double CascadeUnit();

		/****** StepData_Factors::FactorDegreeRadian ******/
		/****** md5 signature: 1949254abf4b991f1a4c89ab210b2367 ******/
		%feature("compactdefaultargs") FactorDegreeRadian;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns transient factor degree radian for conversion of angles at one stage of transfer process.
") FactorDegreeRadian;
		double FactorDegreeRadian();

		/****** StepData_Factors::FactorRadianDegree ******/
		/****** md5 signature: c897e7f45b951f0b9bfaafdb97995123 ******/
		%feature("compactdefaultargs") FactorRadianDegree;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns transient factor radian degree for conversion of angles at one stage of transfer process.
") FactorRadianDegree;
		double FactorRadianDegree();

		/****** StepData_Factors::InitializeFactors ******/
		/****** md5 signature: 1a70a12425e77c7b127270b62a8de95e ******/
		%feature("compactdefaultargs") InitializeFactors;
		%feature("autodoc", "
Parameters
----------
theLengthFactor: double
thePlaneAngleFactor: double
theSolidAngleFactor: double

Return
-------
None

Description
-----------
Initializes the 3 factors for the conversion of units.
") InitializeFactors;
		void InitializeFactors(const double theLengthFactor, const double thePlaneAngleFactor, const double theSolidAngleFactor);

		/****** StepData_Factors::LengthFactor ******/
		/****** md5 signature: 1b284ce586610caeac599057e74cb7ff ******/
		%feature("compactdefaultargs") LengthFactor;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns transient length factor for scaling of shapes at one stage of transfer process.
") LengthFactor;
		double LengthFactor();

		/****** StepData_Factors::PlaneAngleFactor ******/
		/****** md5 signature: 14d51926d2ed0c93fcc15f3cb37b2929 ******/
		%feature("compactdefaultargs") PlaneAngleFactor;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns transient plane angle factor for conversion of angles at one stage of transfer process.
") PlaneAngleFactor;
		double PlaneAngleFactor();

		/****** StepData_Factors::SetCascadeUnit ******/
		/****** md5 signature: dcf34f9697d732cb5f2a6f6cb26388b9 ******/
		%feature("compactdefaultargs") SetCascadeUnit;
		%feature("autodoc", "
Parameters
----------
theUnit: double

Return
-------
None

Description
-----------
Sets length unit for current transfer process.
") SetCascadeUnit;
		void SetCascadeUnit(const double theUnit);

		/****** StepData_Factors::SolidAngleFactor ******/
		/****** md5 signature: a639790627747b4845cabbff578f7b75 ******/
		%feature("compactdefaultargs") SolidAngleFactor;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns transient solid angle factor for conversion of angles at one stage of transfer process.
") SolidAngleFactor;
		double SolidAngleFactor();

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
		/****** md5 signature: 9ff3dad52778b6a25a0cc9bb0569a881 ******/
		%feature("compactdefaultargs") StepData_Field;
		%feature("autodoc", "
Parameters
----------
other: StepData_Field
copy: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates a Field from another one. If <copy> is True, Handled data (Select,String,List, not entities) are copied.
") StepData_Field;
		 StepData_Field(const StepData_Field & other, const bool copy = false);

		/****** StepData_Field::Arity ******/
		/****** md5 signature: 3aec866b2a4542c02df59242f44ea80b ******/
		%feature("compactdefaultargs") Arity;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Arity;
		int Arity();

		/****** StepData_Field::Boolean ******/
		/****** md5 signature: 43d811e46447e173c8af1b74b5591c0c ******/
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
		bool Boolean(const int n1 = 1, const int n2 = 1);

		/****** StepData_Field::Clear ******/
		/****** md5 signature: 5e375e83631895f7506b8621bc60e112 ******/
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
		void Clear(const int kind = 0);

		/****** StepData_Field::ClearItem ******/
		/****** md5 signature: d931adc81c770eb3fd5e37f4919e53b8 ******/
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
		void ClearItem(const int num);

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
		/****** md5 signature: f260c8d92e142f17de07521a6102bc9e ******/
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
		opencascade::handle<Standard_Transient> Entity(const int n1 = 1, const int n2 = 1);

		/****** StepData_Field::Enum ******/
		/****** md5 signature: bb1795f6da1aaf4726fa970ffcf28ee5 ******/
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
		int Enum(const int n1 = 1, const int n2 = 1);

		/****** StepData_Field::EnumText ******/
		/****** md5 signature: 51d63c3e5007ffc84eeadedb7f5a2481 ******/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "
Parameters
----------
n1: int (optional, default to 1)
n2: int (optional, default to 1)

Return
-------
char *

Description
-----------
No available documentation.
") EnumText;
		const char * EnumText(const int n1 = 1, const int n2 = 1);

		/****** StepData_Field::Int ******/
		/****** md5 signature: c5232548243e824f05032038d86f2b7b ******/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Int;
		int Int();

		/****** StepData_Field::Integer ******/
		/****** md5 signature: 1e42cc1796b59b5b3daeb5ca5faa048a ******/
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
		int Integer(const int n1 = 1, const int n2 = 1);

		/****** StepData_Field::IsSet ******/
		/****** md5 signature: 3d75366dde101cdc14c7771ac3580b7e ******/
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
		bool IsSet(const int n1 = 1, const int n2 = 1);

		/****** StepData_Field::ItemKind ******/
		/****** md5 signature: b25ef0b3179aec9186e77c71396a207f ******/
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
		int ItemKind(const int n1 = 1, const int n2 = 1);

		/****** StepData_Field::Kind ******/
		/****** md5 signature: 186a071129ecd6dd86bb438065178bc8 ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "
Parameters
----------
type: bool (optional, default to true)

Return
-------
int

Description
-----------
Returns the kind of the field <type> True (D): returns only the type itself else, returns the complete kind.
") Kind;
		int Kind(const bool type = true);

		/****** StepData_Field::Length ******/
		/****** md5 signature: 7f9c42f1de234262778863e30d2fe4e4 ******/
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
		int Length(const int index = 1);

		/****** StepData_Field::Logical ******/
		/****** md5 signature: 8c7aee499531896ff2a8f371dac9cc58 ******/
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
		StepData_Logical Logical(const int n1 = 1, const int n2 = 1);

		/****** StepData_Field::Lower ******/
		/****** md5 signature: 757e45f471d731c1aadf57de14b50b38 ******/
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
		int Lower(const int index = 1);

		/****** StepData_Field::Real ******/
		/****** md5 signature: cbab9dde167413ee4b9738d889681e89 ******/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "
Parameters
----------
n1: int (optional, default to 1)
n2: int (optional, default to 1)

Return
-------
double

Description
-----------
No available documentation.
") Real;
		double Real(const int n1 = 1, const int n2 = 1);

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
		/****** md5 signature: 798b9e14371eca6dee36518d8ce8400a ******/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "
Parameters
----------
val: bool (optional, default to false)

Return
-------
None

Description
-----------
Sets a Boolean value (or predeclares a list as boolean).
") SetBoolean;
		void SetBoolean(const bool val = false);

		/****** StepData_Field::SetBoolean ******/
		/****** md5 signature: d289a9dbad0febbf261a94fdf898c64f ******/
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
		void SetBoolean(const int num, const bool val);

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
		/****** md5 signature: 4a80d0f03f430878eabdf850f9720ebb ******/
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
		void SetEntity(const int num, const opencascade::handle<Standard_Transient> & val);

		/****** StepData_Field::SetEnum ******/
		/****** md5 signature: bd264992b4257826ee293278749a0c5f ******/
		%feature("compactdefaultargs") SetEnum;
		%feature("autodoc", "
Parameters
----------
val: int (optional, default to -1)
text: char * (optional, default to "")

Return
-------
None

Description
-----------
Sets an Enum Value (as its integer counterpart) (or predeclares a list as Enum) If <text> is given , also sets its textual expression <val> negative means unknown (known values begin at 0).
") SetEnum;
		void SetEnum(const int val = -1, const char * const text = "");

		/****** StepData_Field::SetEnum ******/
		/****** md5 signature: 1e4d17cfda8cce10413dbe90efaaf310 ******/
		%feature("compactdefaultargs") SetEnum;
		%feature("autodoc", "
Parameters
----------
num: int
val: int
text: char * (optional, default to "")

Return
-------
None

Description
-----------
Sets an Enum Value (Integer counterpart), also its text expression if known (if list has been set as 'any').
") SetEnum;
		void SetEnum(const int num, const int val, const char * const text = "");

		/****** StepData_Field::SetInt ******/
		/****** md5 signature: e2fd56d2891bb446c69b20d104bbe5d9 ******/
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
		void SetInt(const int val);

		/****** StepData_Field::SetInt ******/
		/****** md5 signature: 144619ede0dc3fdcaa622380770ca04c ******/
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
		void SetInt(const int num, const int val, const int kind);

		/****** StepData_Field::SetInteger ******/
		/****** md5 signature: cfc4ec1ab8c45b65fcb0174ede005bfc ******/
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
		void SetInteger(const int val = 0);

		/****** StepData_Field::SetInteger ******/
		/****** md5 signature: 1bfcc1e7834506dd4ef752b3802b46e7 ******/
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
		void SetInteger(const int num, const int val);

		/****** StepData_Field::SetList ******/
		/****** md5 signature: 2a4692e92a57029be820699eec21fcb5 ******/
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
		void SetList(const int size, const int first = 1);

		/****** StepData_Field::SetList2 ******/
		/****** md5 signature: b37d2ca4e9101b8ad1756b414f3c4262 ******/
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
		void SetList2(const int siz1, const int siz2, const int f1 = 1, const int f2 = 1);

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
		/****** md5 signature: c5fc62c160ff9c2d64352671f942a320 ******/
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
		void SetLogical(const int num, const StepData_Logical val);

		/****** StepData_Field::SetReal ******/
		/****** md5 signature: e603deef1c18ef58df45d301a18c6142 ******/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "
Parameters
----------
val: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Sets a Real Value (or predeclares a list as Real);.
") SetReal;
		void SetReal(const double val = 0.0);

		/****** StepData_Field::SetReal ******/
		/****** md5 signature: c2aaefacf863cba729a70f9893bb5e12 ******/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "
Parameters
----------
num: int
val: double

Return
-------
None

Description
-----------
No available documentation.
") SetReal;
		void SetReal(const int num, const double val);

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
		/****** md5 signature: 306cbe1817e0bfaa0e0e9421384f1bfb ******/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "
Parameters
----------
val: char * (optional, default to "")

Return
-------
None

Description
-----------
Sets a String Value (or predeclares a list as String) Does not redefine the Kind if it is already String or Enum.
") SetString;
		void SetString(const char * const val = "");

		/****** StepData_Field::SetString ******/
		/****** md5 signature: 143b8f87bbbcabceb1ebc75d7c6234f7 ******/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "
Parameters
----------
num: int
val: char *

Return
-------
None

Description
-----------
No available documentation.
") SetString;
		void SetString(const int num, const char * const val);

		/****** StepData_Field::String ******/
		/****** md5 signature: 05b1efa7bb0c549c8b787d326de5d12e ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "
Parameters
----------
n1: int (optional, default to 1)
n2: int (optional, default to 1)

Return
-------
char *

Description
-----------
No available documentation.
") String;
		const char * String(const int n1 = 1, const int n2 = 1);

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
		/****** md5 signature: eae1537bc1d31c79540bfe93203fc536 ******/
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
		virtual StepData_Field & CField(const int num);

		/****** StepData_FieldList::Field ******/
		/****** md5 signature: c260bd5af0c97e74e35b47fb8a9a9afc ******/
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
		virtual const StepData_Field & Field(const int num);

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
		/****** md5 signature: d81169f9fe19d8277cf5154757f85929 ******/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of fields. Here, returns 0.
") NbFields;
		virtual int NbFields();

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
		/****** md5 signature: 1c73d7ccd1196e8066541f080618d7e9 ******/
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
		bool Evaluate(TCollection_AsciiString akey, opencascade::handle<Standard_Transient> & res);

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
		/****** md5 signature: 94b1cc0bf0e14a14c065367807e38e23 ******/
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
		void CheckCase(const int casenum, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****** StepData_GeneralModule::CopyCase ******/
		/****** md5 signature: f89b86afd939124d57b0e10476d26fa3 ******/
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
		void CopyCase(const int casenum, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****** StepData_GeneralModule::FillSharedCase ******/
		/****** md5 signature: ec321acec0a9b23be08c636dc4157224 ******/
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
		void FillSharedCase(const int casenum, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

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
		/****** md5 signature: bac13d13d23cf5a05775531352f28cbe ******/
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
		void AddArity(const int arity = 1);

		/****** StepData_PDescr::AddEnumDef ******/
		/****** md5 signature: fc739bd8d453f3da8c59a65698565df9 ******/
		%feature("compactdefaultargs") AddEnumDef;
		%feature("autodoc", "
Parameters
----------
enumdef: char *

Return
-------
None

Description
-----------
Adds an enum value as a string.
") AddEnumDef;
		void AddEnumDef(const char * const enumdef);

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
		/****** md5 signature: 3aec866b2a4542c02df59242f44ea80b ******/
		%feature("compactdefaultargs") Arity;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the arity of <self>.
") Arity;
		int Arity();

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
		/****** md5 signature: 904361c6395c6b0dc4199cc78da73587 ******/
		%feature("compactdefaultargs") DescrName;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the description (type name) to match, for a Described (else, empty string).
") DescrName;
		const char * DescrName();

		/****** StepData_PDescr::EnumMax ******/
		/****** md5 signature: 93a344430cd458c0c9dc0164bb378a20 ******/
		%feature("compactdefaultargs") EnumMax;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum integer for a suitable value (count - 1).
") EnumMax;
		int EnumMax();

		/****** StepData_PDescr::EnumText ******/
		/****** md5 signature: 491663c3eeeadc6ed8e9dfb6b0f132f4 ******/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "
Parameters
----------
val: int

Return
-------
char *

Description
-----------
Returns the text which corresponds to a numeric value, between 0 and EnumMax. It is limited by dots.
") EnumText;
		const char * EnumText(const int val);

		/****** StepData_PDescr::EnumValue ******/
		/****** md5 signature: e5e3a3b234dee4de2a3a1b5b383acd6e ******/
		%feature("compactdefaultargs") EnumValue;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
int

Description
-----------
Returns the numeric value found for an enum text The text must be in capitals and limited by dots A non-suitable text gives a negative value to be returned.
") EnumValue;
		int EnumValue(const char * const name);

		/****** StepData_PDescr::FieldName ******/
		/****** md5 signature: bc3f4bd560ab5566274e68c9a3a62e73 ******/
		%feature("compactdefaultargs") FieldName;
		%feature("autodoc", "Return
-------
char *

Description
-----------
No available documentation.
") FieldName;
		const char * FieldName();

		/****** StepData_PDescr::FieldRank ******/
		/****** md5 signature: 923771bf88fabfa057a6ed69803e6a6c ******/
		%feature("compactdefaultargs") FieldRank;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FieldRank;
		int FieldRank();

		/****** StepData_PDescr::IsBoolean ******/
		/****** md5 signature: 897dbf3bfb6e5cdb45d2a78401e0cd1b ******/
		%feature("compactdefaultargs") IsBoolean;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is for a Boolean value (false,true).
") IsBoolean;
		bool IsBoolean();

		/****** StepData_PDescr::IsDerived ******/
		/****** md5 signature: ebac32443d9159419b106a0e217d39c6 ******/
		%feature("compactdefaultargs") IsDerived;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is Derived.
") IsDerived;
		bool IsDerived();

		/****** StepData_PDescr::IsDescr ******/
		/****** md5 signature: 724194b1f741444a39823846f547f30e ******/
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
		bool IsDescr(const opencascade::handle<StepData_EDescr> & descr);

		/****** StepData_PDescr::IsEntity ******/
		/****** md5 signature: 6f0b6c4ba556b641f1d8e40ec03364c8 ******/
		%feature("compactdefaultargs") IsEntity;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is for an Entity, either Described or CDL Type.
") IsEntity;
		bool IsEntity();

		/****** StepData_PDescr::IsEnum ******/
		/****** md5 signature: 6f1fe35deff735a056a288bc76438370 ******/
		%feature("compactdefaultargs") IsEnum;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is for an Enum value Then, call AddEnumDef ordered from the first one (value 0) Managed by an EnumTool.
") IsEnum;
		bool IsEnum();

		/****** StepData_PDescr::IsField ******/
		/****** md5 signature: 1b7d1a142f2ef783caec3baac6807817 ******/
		%feature("compactdefaultargs") IsField;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is a Field. Else it is a Type.
") IsField;
		bool IsField();

		/****** StepData_PDescr::IsInteger ******/
		/****** md5 signature: 2e49701878d787625ded27a7c8bf9742 ******/
		%feature("compactdefaultargs") IsInteger;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is for an Integer.
") IsInteger;
		bool IsInteger();

		/****** StepData_PDescr::IsLogical ******/
		/****** md5 signature: 65ee8b8dba51b954b1b48e772895644d ******/
		%feature("compactdefaultargs") IsLogical;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is for a Logical value (false,true,unknown).
") IsLogical;
		bool IsLogical();

		/****** StepData_PDescr::IsOptional ******/
		/****** md5 signature: 37f5134985a3af6a2450aa79ff176e1e ******/
		%feature("compactdefaultargs") IsOptional;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is Optional.
") IsOptional;
		bool IsOptional();

		/****** StepData_PDescr::IsReal ******/
		/****** md5 signature: 1a9c024e9fee27e394bb7a7f67bc6ccd ******/
		%feature("compactdefaultargs") IsReal;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is for a Real value.
") IsReal;
		bool IsReal();

		/****** StepData_PDescr::IsSelect ******/
		/****** md5 signature: d6c820a6347313dd32508574c67e13aa ******/
		%feature("compactdefaultargs") IsSelect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is for a SELECT.
") IsSelect;
		bool IsSelect();

		/****** StepData_PDescr::IsString ******/
		/****** md5 signature: 1bfbd3f46eccbed8f58766113fb965cb ******/
		%feature("compactdefaultargs") IsString;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is for a String value.
") IsString;
		bool IsString();

		/****** StepData_PDescr::IsType ******/
		/****** md5 signature: f072c62b75f5641e54e8e4ca9b60ae7d ******/
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
		bool IsType(const opencascade::handle<Standard_Type> & atype);

		/****** StepData_PDescr::Member ******/
		/****** md5 signature: 2d0905fc4066ba67251a5393ee089e75 ******/
		%feature("compactdefaultargs") Member;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
opencascade::handle<StepData_PDescr>

Description
-----------
For a SELECT, returns the member whose name matches <name> To this member, the following question can then be asked Null Handle if <name> not matched or <self> not a SELECT //! Remark: not to be asked for an entity type Hence, following IsInteger .. Enum* only apply on <self> and require Member While IsType applies on <self> and all Select Members.
") Member;
		opencascade::handle<StepData_PDescr> Member(const char * const name);

		/****** StepData_PDescr::Name ******/
		/****** md5 signature: c01515d64eb8c383d620d861376d0837 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
No available documentation.
") Name;
		const char * Name();

		/****** StepData_PDescr::SetArity ******/
		/****** md5 signature: 24ed636cada9042707e237b963b92e29 ******/
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
		void SetArity(const int arity = 1);

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
		/****** md5 signature: adde89fe4dd94ffcefd7e4ff785701c4 ******/
		%feature("compactdefaultargs") SetDerived;
		%feature("autodoc", "
Parameters
----------
der: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets/Unsets <self> to be for a derived field.
") SetDerived;
		void SetDerived(const bool der = true);

		/****** StepData_PDescr::SetDescr ******/
		/****** md5 signature: d5f2571769e4bd421fbdcb8179fb6183 ******/
		%feature("compactdefaultargs") SetDescr;
		%feature("autodoc", "
Parameters
----------
dscnam: char *

Return
-------
None

Description
-----------
Sets <self> for a Described Entity, whose Description must match the type name <dscnam>.
") SetDescr;
		void SetDescr(const char * const dscnam);

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
		/****** md5 signature: 17d1a9a1fb61b786417953d239652131 ******/
		%feature("compactdefaultargs") SetField;
		%feature("autodoc", "
Parameters
----------
name: char *
rank: int

Return
-------
None

Description
-----------
Sets <self> to describe a field of an entity With a name and a rank.
") SetField;
		void SetField(const char * const name, const int rank);

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
		/****** md5 signature: 38bada6dfb8bcd5917d1a25ec4adb407 ******/
		%feature("compactdefaultargs") SetMemberName;
		%feature("autodoc", "
Parameters
----------
memname: char *

Return
-------
None

Description
-----------
Sets a name for SELECT member. To be used if a member is for an immediate type.
") SetMemberName;
		void SetMemberName(const char * const memname);

		/****** StepData_PDescr::SetName ******/
		/****** md5 signature: 9334b2c77e8aae2ba868615f5b4f7498 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const char * const name);

		/****** StepData_PDescr::SetOptional ******/
		/****** md5 signature: 764c391d0b5156e056200bb0999ec674 ******/
		%feature("compactdefaultargs") SetOptional;
		%feature("autodoc", "
Parameters
----------
opt: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets/Unsets <self> to accept undefined values.
") SetOptional;
		void SetOptional(const bool opt = true);

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
		/****** md5 signature: 790a2255d581aad6de732810d2d9a7d6 ******/
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
		void AddDescr(const opencascade::handle<StepData_EDescr> & adescr, const int CN);

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
		/****** md5 signature: d23f81ce4197eceb0694682741533250 ******/
		%feature("compactdefaultargs") BasicDescr;
		%feature("autodoc", "
Parameters
----------
name: char *
anylevel: bool (optional, default to true)

Return
-------
opencascade::handle<StepData_EDescr>

Description
-----------
Returns a basic description according to its name <anylevel> True (D): for <self> and its resources <anylevel> False: for <self> only.
") BasicDescr;
		opencascade::handle<StepData_EDescr> BasicDescr(const char * const name, const bool anylevel = true);

		/****** StepData_Protocol::CaseNumber ******/
		/****** md5 signature: 831bfc163524ce730daf18afbff58981 ******/
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
		int CaseNumber(const opencascade::handle<Standard_Transient> & obj);

		/****** StepData_Protocol::Descr ******/
		/****** md5 signature: 980f240ce9341dac16abf2b59e9f1210 ******/
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
		opencascade::handle<StepData_EDescr> Descr(const int num);

		/****** StepData_Protocol::Descr ******/
		/****** md5 signature: 60fb2b6aadc1935aca315f5f3ee3d36f ******/
		%feature("compactdefaultargs") Descr;
		%feature("autodoc", "
Parameters
----------
name: char *
anylevel: bool (optional, default to true)

Return
-------
opencascade::handle<StepData_EDescr>

Description
-----------
Returns a description according to its name <anylevel> True (D): for <self> and its resources <anylevel> False: for <self> only.
") Descr;
		opencascade::handle<StepData_EDescr> Descr(const char * const name, const bool anylevel = true);

		/****** StepData_Protocol::DescrNumber ******/
		/****** md5 signature: ad44b358a317e06d388f1562505349a0 ******/
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
		virtual int DescrNumber(const opencascade::handle<StepData_EDescr> & adescr);

		/****** StepData_Protocol::ECDescr ******/
		/****** md5 signature: 81228032ea839c005d6ea12b00650dca ******/
		%feature("compactdefaultargs") ECDescr;
		%feature("autodoc", "
Parameters
----------
names: TColStd_SequenceOfAsciiString
anylevel: bool (optional, default to true)

Return
-------
opencascade::handle<StepData_ECDescr>

Description
-----------
Returns a complex description according to list of names <anylevel> True (D): for <self> and its resources <anylevel> False: for <self> only.
") ECDescr;
		opencascade::handle<StepData_ECDescr> ECDescr(const TColStd_SequenceOfAsciiString & names, const bool anylevel = true);

		/****** StepData_Protocol::ESDescr ******/
		/****** md5 signature: 5e58a071c1665f4214b66b057cb71b20 ******/
		%feature("compactdefaultargs") ESDescr;
		%feature("autodoc", "
Parameters
----------
name: char *
anylevel: bool (optional, default to true)

Return
-------
opencascade::handle<StepData_ESDescr>

Description
-----------
Idem as Descr but cast to simple description.
") ESDescr;
		opencascade::handle<StepData_ESDescr> ESDescr(const char * const name, const bool anylevel = true);

		/****** StepData_Protocol::HasDescr ******/
		/****** md5 signature: a2c45d01e354a2002571d30a07a0b039 ******/
		%feature("compactdefaultargs") HasDescr;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if a Protocol brings at least one ESDescr, i.e. if it defines at least one entity description by ESDescr mechanism.
") HasDescr;
		bool HasDescr();

		/****** StepData_Protocol::IsSuitableModel ******/
		/****** md5 signature: d2ccb6e77cddff484d0b7a9051bcd673 ******/
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
		bool IsSuitableModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** StepData_Protocol::IsUnknownEntity ******/
		/****** md5 signature: 02362c70d307360a2b6188ad031013c3 ******/
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
		bool IsUnknownEntity(const opencascade::handle<Standard_Transient> & ent);

		/****** StepData_Protocol::NbResources ******/
		/****** md5 signature: 3c8410815357f0a892211359291d8070 ******/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the count of Protocols used as Resource (can be zero) Here, No resource.
") NbResources;
		int NbResources();

		/****** StepData_Protocol::NewModel ******/
		/****** md5 signature: 4e176eab7c6da9b73e274debab7af3fb ******/
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
		/****** md5 signature: 727349a707b29bc800cc5fc8f8f51325 ******/
		%feature("compactdefaultargs") PDescr;
		%feature("autodoc", "
Parameters
----------
name: char *
anylevel: bool (optional, default to true)

Return
-------
opencascade::handle<StepData_PDescr>

Description
-----------
Returns a parameter description according to its name <anylevel> True (D): for <self> and its resources <anylevel> False: for <self> only.
") PDescr;
		opencascade::handle<StepData_PDescr> PDescr(const char * const name, const bool anylevel = true);

		/****** StepData_Protocol::Resource ******/
		/****** md5 signature: 3c19c2497364406e7d4e9d2a0f8d51c0 ******/
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
		opencascade::handle<Interface_Protocol> Resource(const int num);

		/****** StepData_Protocol::SchemaName ******/
		/****** md5 signature: c7d0a0330aee388dde3198947d282264 ******/
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "
Parameters
----------
theModel: Interface_InterfaceModel

Return
-------
char *

Description
-----------
Returns the Schema Name attached to each class of Protocol To be redefined by each sub-class Here, SchemaName returns '(DEFAULT)' was C++: return const.
") SchemaName;
		virtual const char * SchemaName(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****** StepData_Protocol::TypeNumber ******/
		/****** md5 signature: bbae632533589e3c2443854ef12e6cb8 ******/
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
		int TypeNumber(const opencascade::handle<Standard_Type> & atype);

		/****** StepData_Protocol::UnknownEntity ******/
		/****** md5 signature: 169032e358d8d8ef4fd05f39169f96f5 ******/
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
		/****** md5 signature: e807b9c49d9153ce57b3e5855eca12f8 ******/
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
		int CaseNum(const opencascade::handle<Interface_FileReaderData> & data, const int num);

		/****** StepData_ReadWriteModule::CaseStep ******/
		/****** md5 signature: bf8bed63481f64209e8b724fd45994d0 ******/
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
		virtual int CaseStep(TCollection_AsciiString atype);

		/****** StepData_ReadWriteModule::CaseStep ******/
		/****** md5 signature: 379c1f5aea592abcd3dfadd588a2121c ******/
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
		virtual int CaseStep(const TColStd_SequenceOfAsciiString & types);

		/****** StepData_ReadWriteModule::ComplexType ******/
		/****** md5 signature: 78e3b47462e8a0e9e3e0a061c11eae06 ******/
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
		virtual bool ComplexType(const int CN, TColStd_SequenceOfAsciiString & types);

		/****** StepData_ReadWriteModule::IsComplex ******/
		/****** md5 signature: 85c6b2fef15897806cf8d77632c47346 ******/
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
		virtual bool IsComplex(const int CN);

		/****** StepData_ReadWriteModule::Read ******/
		/****** md5 signature: 51f5d802b79e4aa06bb2474af3294dbb ******/
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
		void Read(const int CN, const opencascade::handle<Interface_FileReaderData> & data, const int num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<Standard_Transient> & ent);

		/****** StepData_ReadWriteModule::ReadStep ******/
		/****** md5 signature: e7adfeb691bfae8306fa3307f3be7581 ******/
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
		virtual void ReadStep(const int CN, const opencascade::handle<StepData_StepReaderData> & data, const int num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<Standard_Transient> & ent);

		/****** StepData_ReadWriteModule::ShortType ******/
		/****** md5 signature: 15f208473fe8a83965ca5d35800d0666 ******/
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
		virtual TCollection_AsciiString ShortType(const int CN);

		/****** StepData_ReadWriteModule::StepType ******/
		/****** md5 signature: 2e9e325a0f23c7db6276030f7bd7ae4d ******/
		%feature("compactdefaultargs") StepType;
		%feature("autodoc", "
Parameters
----------
CN: int

Return
-------
std::string_view

Description
-----------
Function specific to STEP, which delivers the StepType as it is recorded in and read from a File compliant with STEP. This method is symmetric to the method CaseStep. StepType can be different from Dynamic Type's name, but belongs to the same class of Object. Returns an empty String if <CN> is zero. Warning: For a Complex Type Entity, returns an Empty String (Complex Type must be managed by users).
") StepType;
		virtual const std::string_view & StepType(const int CN);

		/****** StepData_ReadWriteModule::WriteStep ******/
		/****** md5 signature: 7e7d89d871d294f50b44ca7a5d95cbc0 ******/
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
		virtual void WriteStep(const int CN, StepData_StepWriter & SW, const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: 07be05793f336e9d3f994ffc3222a79f ******/
		%feature("compactdefaultargs") Boolean;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Boolean;
		bool Boolean();

		/****** StepData_SelectMember::Enum ******/
		/****** md5 signature: c185e396a8fc9593cfe32e0b5d9db431 ******/
		%feature("compactdefaultargs") Enum;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Enum;
		int Enum();

		/****** StepData_SelectMember::EnumText ******/
		/****** md5 signature: 16bcd56094c4ce5f9c6a393a43b08540 ******/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "Return
-------
char *

Description
-----------
No available documentation.
") EnumText;
		virtual const char * EnumText();

		/****** StepData_SelectMember::HasName ******/
		/****** md5 signature: 430fc08b0e34a96ab4dbd2405acb3bea ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if a SelectMember has a name. Default is False.
") HasName;
		virtual bool HasName();

		/****** StepData_SelectMember::Int ******/
		/****** md5 signature: 6aabae8f29a8a61ea60d76d296418f3a ******/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "Return
-------
int

Description
-----------
This internal method gives access to a value implemented by an Integer (to read it).
") Int;
		virtual int Int();

		/****** StepData_SelectMember::Integer ******/
		/****** md5 signature: 41bc0bf7511a4be8a41ab471a0c3532a ******/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gets the value as an Integer.
") Integer;
		int Integer();

		/****** StepData_SelectMember::Kind ******/
		/****** md5 signature: 36d9a8197556f4a763b376e82d07ec29 ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Kind;
		virtual int Kind();

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
		/****** md5 signature: ef368c3127474f232802bc33bb24ff22 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Tells if the name of a SelectMember matches a given one By default, compares the strings, can be redefined (optimised).
") Matches;
		virtual bool Matches(const char * const name);

		/****** StepData_SelectMember::Name ******/
		/****** md5 signature: d0f648d103fb210439b8e51a7c73a769 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the name of a SelectMember. Default is empty.
") Name;
		virtual const char * Name();

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
		/****** md5 signature: 8bdc564bf02430f070a77a38d5bcce48 ******/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Real;
		virtual double Real();

		/****** StepData_SelectMember::SetBoolean ******/
		/****** md5 signature: be83170857f536a88f271beae67c66df ******/
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
		void SetBoolean(const bool val);

		/****** StepData_SelectMember::SetEnum ******/
		/****** md5 signature: f3c495f541b8f3939079788d52f0f2ea ******/
		%feature("compactdefaultargs") SetEnum;
		%feature("autodoc", "
Parameters
----------
val: int
text: char * (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") SetEnum;
		void SetEnum(const int val, const char * const text = "");

		/****** StepData_SelectMember::SetEnumText ******/
		/****** md5 signature: 55cb51797df1cb596080973dad05b47f ******/
		%feature("compactdefaultargs") SetEnumText;
		%feature("autodoc", "
Parameters
----------
val: int
text: char *

Return
-------
None

Description
-----------
No available documentation.
") SetEnumText;
		virtual void SetEnumText(const int val, const char * const text);

		/****** StepData_SelectMember::SetInt ******/
		/****** md5 signature: 146a57409bcdce144dd4cf26ac2b706e ******/
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
		virtual void SetInt(const int val);

		/****** StepData_SelectMember::SetInteger ******/
		/****** md5 signature: 8d0eafa62dbebdf7e4cbd76b1c7313ac ******/
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
		void SetInteger(const int val);

		/****** StepData_SelectMember::SetKind ******/
		/****** md5 signature: dac8e95eb68ddee9449fd81cc1938199 ******/
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
		virtual void SetKind(const int kind);

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
		/****** md5 signature: 9cefcb8e18d0196170e1d2b2e423c108 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Sets the name of a SelectMember, returns True if done, False if no name is allowed Default does nothing and returns False.
") SetName;
		virtual bool SetName(const char * const name);

		/****** StepData_SelectMember::SetReal ******/
		/****** md5 signature: 134f203d3f903e79179d37f62f5b3838 ******/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "
Parameters
----------
val: double

Return
-------
None

Description
-----------
No available documentation.
") SetReal;
		virtual void SetReal(const double val);

		/****** StepData_SelectMember::SetString ******/
		/****** md5 signature: 04d3bc28944fb557284a3ebf8062fb7f ******/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "
Parameters
----------
val: char *

Return
-------
None

Description
-----------
No available documentation.
") SetString;
		virtual void SetString(const char * const val);

		/****** StepData_SelectMember::String ******/
		/****** md5 signature: 3d9ad9a383f7ab9461bbfe29096891e4 ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
char *

Description
-----------
No available documentation.
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
		/****** StepData_SelectType::Boolean ******/
		/****** md5 signature: 07be05793f336e9d3f994ffc3222a79f ******/
		%feature("compactdefaultargs") Boolean;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Boolean;
		bool Boolean();

		/****** StepData_SelectType::CaseMem ******/
		/****** md5 signature: ba4ef8c4494e3e253b5e719af32bef43 ******/
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
		virtual int CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepData_SelectType::CaseMember ******/
		/****** md5 signature: 0c3d15b0220c3ba2b67e0c1695ec96d4 ******/
		%feature("compactdefaultargs") CaseMember;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Type of the stored SelectMember, or zero if it is Null or Entity. Calls the method CaseMem on Value.
") CaseMember;
		int CaseMember();

		/****** StepData_SelectType::CaseNum ******/
		/****** md5 signature: 06c46b008f1b6bb75a86dc6de48995f9 ******/
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
		virtual int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepData_SelectType::CaseNumber ******/
		/****** md5 signature: ef3f4208c9c9cd6c0745e4862748840c ******/
		%feature("compactdefaultargs") CaseNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Recognizes the Type of the stored Entity, or zero if it is Null or SelectMember. Calls the first method CaseNum on Value.
") CaseNumber;
		int CaseNumber();

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
		/****** md5 signature: c5232548243e824f05032038d86f2b7b ******/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "Return
-------
int

Description
-----------
This internal method gives access to a value implemented by an Integer (to read it).
") Int;
		int Int();

		/****** StepData_SelectType::Integer ******/
		/****** md5 signature: 41bc0bf7511a4be8a41ab471a0c3532a ******/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gets the value as an Integer.
") Integer;
		int Integer();

		/****** StepData_SelectType::IsNull ******/
		/****** md5 signature: 853b69e6816e494cce299d49aca90322 ******/
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is no Stored Entity (i.e. it is Null).
") IsNull;
		bool IsNull();

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
		/****** md5 signature: 0a0e7991bc689e400bb8c1c7794f7d28 ******/
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
		bool Matches(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: 16ce6c42ffe077ec7b2a0073fb25cd28 ******/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Real;
		double Real();

		/****** StepData_SelectType::SelectName ******/
		/****** md5 signature: 6432857d2a60fbad8ee86a3667f023c3 ******/
		%feature("compactdefaultargs") SelectName;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the type name of SelectMember. If no SelectMember or with no type name, returns an empty string To change it, pass through the SelectMember itself.
") SelectName;
		const char * SelectName();

		/****** StepData_SelectType::SetBoolean ******/
		/****** md5 signature: 0281eab942d220ac5ebe4ab3fd3f02e2 ******/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "
Parameters
----------
val: bool
name: char * (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") SetBoolean;
		void SetBoolean(const bool val, const char * const name = "");

		/****** StepData_SelectType::SetInt ******/
		/****** md5 signature: e2fd56d2891bb446c69b20d104bbe5d9 ******/
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
		void SetInt(const int val);

		/****** StepData_SelectType::SetInteger ******/
		/****** md5 signature: 46d8f076e9b15d5a8ac2c17e10069069 ******/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "
Parameters
----------
val: int
name: char * (optional, default to "")

Return
-------
None

Description
-----------
Sets a new Integer value, with an optional type name Warning: If a SelectMember is already set, works on it: value and name must then be accepted by this SelectMember.
") SetInteger;
		void SetInteger(const int val, const char * const name = "");

		/****** StepData_SelectType::SetLogical ******/
		/****** md5 signature: d109fc4356b6e1159d35fc20a263a5cd ******/
		%feature("compactdefaultargs") SetLogical;
		%feature("autodoc", "
Parameters
----------
val: StepData_Logical
name: char * (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") SetLogical;
		void SetLogical(const StepData_Logical val, const char * const name = "");

		/****** StepData_SelectType::SetReal ******/
		/****** md5 signature: 9c8f6755655881fe91b65587fd598553 ******/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "
Parameters
----------
val: double
name: char * (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") SetReal;
		void SetReal(const double val, const char * const name = "");

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
		/****** md5 signature: 6e0ce962195c9b4453e05169e43c707a ******/
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
		 StepData_StepDumper(const opencascade::handle<StepData_StepModel> & amodel, const opencascade::handle<StepData_Protocol> & protocol, const int mode = 0);

		/****** StepData_StepDumper::Dump ******/
		/****** md5 signature: 0f393bff482132f936f2001c7625f5f6 ******/
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
		bool Dump(std::ostream &OutValue, const opencascade::handle<Standard_Transient> & ent, const int level);

		/****** StepData_StepDumper::Dump ******/
		/****** md5 signature: 586a2f2b2a4ca3824b0d1dc541c2f2ce ******/
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
		bool Dump(std::ostream &OutValue, const int num, const int level);

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
		/****** md5 signature: 81ef923f850ea8300d46a65c729c1bd6 ******/
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
		/****** md5 signature: a5f109e33320ab46b6efaa733b163b63 ******/
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
		/****** md5 signature: 24251371d0f012679b6af8500c3be0b5 ******/
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
		void DumpHeader(std::ostream &OutValue, const int level = 0);

		/****** StepData_StepModel::Entity ******/
		/****** md5 signature: 79caa837fa8980e44dea4c847e6eb9b4 ******/
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
		opencascade::handle<Standard_Transient> Entity(const int num);

		/****** StepData_StepModel::GetFromAnother ******/
		/****** md5 signature: f8d441c5771aa569690b393c9eb132d7 ******/
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
		/****** md5 signature: f2b2d8b9fa8d539b87e4a43fc7f0f824 ******/
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
		bool HasHeaderEntity(const opencascade::handle<Standard_Type> & atype);

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
		/****** md5 signature: 183be2ffb3d1cb7480f3a12623c93037 ******/
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
		int IdentLabel(const opencascade::handle<Standard_Transient> & ent);

		/****** StepData_StepModel::IsInitializedUnit ******/
		/****** md5 signature: 34c66fa387636226d6da3df2ced65421 ******/
		%feature("compactdefaultargs") IsInitializedUnit;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the unit initialization flag True - the unit was initialized False - the unit value was not initialized, the default value is used.
") IsInitializedUnit;
		bool IsInitializedUnit();

		/****** StepData_StepModel::LocalLengthUnit ******/
		/****** md5 signature: 365a49de9b1fa91cd28443b4dc210e4c ******/
		%feature("compactdefaultargs") LocalLengthUnit;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns local length unit using for transfer process (1 by default).
") LocalLengthUnit;
		double LocalLengthUnit();

		/****** StepData_StepModel::NewEmptyModel ******/
		/****** md5 signature: c7c7afeaeaa4e3f58350438ec9368a8b ******/
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
		/****** md5 signature: ef9765f6cbdc6da5c6aaea1612f21d9d ******/
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
		/****** md5 signature: fed5b63349eb0e1eada9bd209eab5b9a ******/
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
		void SetIdentLabel(const opencascade::handle<Standard_Transient> & ent, const int ident);

		/****** StepData_StepModel::SetLocalLengthUnit ******/
		/****** md5 signature: 6c291fc08631c4107177671a0aa400be ******/
		%feature("compactdefaultargs") SetLocalLengthUnit;
		%feature("autodoc", "
Parameters
----------
theUnit: double

Return
-------
None

Description
-----------
Sets local length unit using for transfer process.
") SetLocalLengthUnit;
		void SetLocalLengthUnit(const double theUnit);

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
		/****** md5 signature: d91fcc067a27fa11e6a7e77ad1f45463 ******/
		%feature("compactdefaultargs") SetWriteLengthUnit;
		%feature("autodoc", "
Parameters
----------
theUnit: double

Return
-------
None

Description
-----------
Sets length unit using for writing process.
") SetWriteLengthUnit;
		void SetWriteLengthUnit(const double theUnit);

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
		/****** md5 signature: 8c1d103d0db383cc063c7d455e356ae6 ******/
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
		/****** md5 signature: 695cf5d62a51fec2768c871671281fa7 ******/
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
		void VerifyCheck(opencascade::handle<Interface_Check> & ach);

		/****** StepData_StepModel::WriteLengthUnit ******/
		/****** md5 signature: f7a9c9c719ba2f8257c4a0364c8a7167 ******/
		%feature("compactdefaultargs") WriteLengthUnit;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns length unit using for writing process (1 by default).
") WriteLengthUnit;
		double WriteLengthUnit();

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
		/****** md5 signature: c5088a8425c7f8d759d1b6151ed5962b ******/
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
		 StepData_StepReaderData(const int nbheader, const int nbtotal, const int nbpar, const Resource_FormatType theSourceCodePage = Resource_FormatType_UTF8);

		/****** StepData_StepReaderData::AddStepParam ******/
		/****** md5 signature: c8d9c63027de869a2e1564e036e55e1e ******/
		%feature("compactdefaultargs") AddStepParam;
		%feature("autodoc", "
Parameters
----------
num: int
aval: char *
atype: Interface_ParamType
nument: int (optional, default to 0)

Return
-------
None

Description
-----------
Fills the fields of a parameter of a record. This is a variant of AddParam, Adapted to STEP (optimized for specific values).
") AddStepParam;
		void AddStepParam(const int num, const char * const aval, const Interface_ParamType atype, const int nument = 0);

		/****** StepData_StepReaderData::CType ******/
		/****** md5 signature: f83bdcc999b1d975cb03198d4ece859b ******/
		%feature("compactdefaultargs") CType;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
char *

Description
-----------
Returns Record Type as a CString was C++: return const.
") CType;
		const char * CType(const int num);

		/****** StepData_StepReaderData::CheckDerived ******/
		/****** md5 signature: a473cfa1a8fcdeb5bf7f129c7645f139 ******/
		%feature("compactdefaultargs") CheckDerived;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check
errstat: bool (optional, default to false)

Return
-------
bool

Description
-----------
Checks if parameter <nump> of record <num> is given as Derived If this Check is successful (i.e. Param = '*'), returns True Else, fills <ach> with a Message which contains <mess> and returns False. According to <errstat>, this message is Warning if errstat is False (Default), Fail if errstat is True.
") CheckDerived;
		bool CheckDerived(const int num, const int nump, const char * const mess, opencascade::handle<Interface_Check> & ach, const bool errstat = false);

		/****** StepData_StepReaderData::CheckNbParams ******/
		/****** md5 signature: 2cc9f73e62f8abea7ce5c59ad675be88 ******/
		%feature("compactdefaultargs") CheckNbParams;
		%feature("autodoc", "
Parameters
----------
num: int
nbreq: int
ach: Interface_Check
mess: char * (optional, default to "")

Return
-------
bool

Description
-----------
Checks Count of Parameters of record <num> to equate <nbreq> If this Check is successful, returns True Else, fills <ach> with an Error Message then returns False <mess> is included in the Error message if given non empty.
") CheckNbParams;
		bool CheckNbParams(const int num, const int nbreq, opencascade::handle<Interface_Check> & ach, const char * const mess = "");

		/****** StepData_StepReaderData::ComplexType ******/
		/****** md5 signature: f4f8f54a4662c9e509556287b1b71b0c ******/
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
		void ComplexType(const int num, TColStd_SequenceOfAsciiString & types);

		/****** StepData_StepReaderData::FailEnumValue ******/
		/****** md5 signature: 91a43b3b900d87f95767662ae337e8c1 ******/
		%feature("compactdefaultargs") FailEnumValue;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check

Return
-------
None

Description
-----------
Fills a check with a fail message if enumeration value does match parameter definition Just a help to centralize message definitions.
") FailEnumValue;
		void FailEnumValue(const int num, const int nump, const char * const mess, opencascade::handle<Interface_Check> & ach);

		/****** StepData_StepReaderData::FindNextHeaderRecord ******/
		/****** md5 signature: 6e49ce2e5dd43a0e9aa7b9240f1034de ******/
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
		int FindNextHeaderRecord(const int num);

		/****** StepData_StepReaderData::FindNextRecord ******/
		/****** md5 signature: af0880fae3013305c161fab34dea16e9 ******/
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
		int FindNextRecord(const int num);

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
		/****** md5 signature: b743d0c1e380fcd998f0d3c27acea4db ******/
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
		bool IsComplex(const int num);

		/****** StepData_StepReaderData::NamedForComplex ******/
		/****** md5 signature: 00b036b2302d7e92f5c05c8414753d65 ******/
		%feature("compactdefaultargs") NamedForComplex;
		%feature("autodoc", "
Parameters
----------
name: char *
num0: int
ach: Interface_Check

Return
-------
num: int

Description
-----------
Determines the first component which brings a given name, for a Complex Type Entity <num0> is the very first record of this entity <num> is given the last NextNamedForComplex, starts at zero it is returned as the newly found number Hence, in the normal case, NextNamedForComplex starts by num0 if <num> is zero, else by NextForComplex(num) If the alphabetic order is not respected, it restarts from num0 and loops on NextForComplex until finding <name> In case of 'non-alphabetic order', <ach> is filled with a Warning for this name In case of 'not-found at all', <ach> is filled with a Fail, and <num> is returned as zero //! Returns True if alphabetic order, False else.
") NamedForComplex;
		bool NamedForComplex(const char * const name, const int num0, Standard_Integer &OutValue, opencascade::handle<Interface_Check> & ach);

		/****** StepData_StepReaderData::NamedForComplex ******/
		/****** md5 signature: b6593effd9e1889a88d928af8f3adb15 ******/
		%feature("compactdefaultargs") NamedForComplex;
		%feature("autodoc", "
Parameters
----------
theName: char *
theShortName: char *
num0: int
ach: Interface_Check

Return
-------
num: int

Description
-----------
Determines the first component which brings a given name, or short name for a Complex Type Entity <num0> is the very first record of this entity <num> is given the last NextNamedForComplex, starts at zero it is returned as the newly found number Hence, in the normal case, NextNamedForComplex starts by num0 if <num> is zero, else by NextForComplex(num) If the alphabetic order is not respected, it restarts from num0 and loops on NextForComplex until finding <name> In case of 'non-alphabetic order', <ach> is filled with a Warning for this name In case of 'not-found at all', <ach> is filled with a Fail, and <num> is returned as zero //! Returns True if alphabetic order, False else.
") NamedForComplex;
		bool NamedForComplex(const char * const theName, const char * const theShortName, const int num0, Standard_Integer &OutValue, opencascade::handle<Interface_Check> & ach);

		/****** StepData_StepReaderData::NbEntities ******/
		/****** md5 signature: 9f1930526dd42b0983ed2f53654ed3b7 ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns total count of Entities (including Header).
") NbEntities;
		int NbEntities();

		/****** StepData_StepReaderData::NextForComplex ******/
		/****** md5 signature: 6b809e20aab5364d1a13bdb445e7de8d ******/
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
		int NextForComplex(const int num);

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
		/****** md5 signature: 07b41c0f3497522eb0180ef25905860f ******/
		%feature("compactdefaultargs") ReadAny;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: char *
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
		bool ReadAny(const int num, const int nump, const char * const mess, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepData_PDescr> & descr, opencascade::handle<Standard_Transient> & val);

		/****** StepData_StepReaderData::ReadBoolean ******/
		/****** md5 signature: cc003bda1176f538a19abe670196c73d ******/
		%feature("compactdefaultargs") ReadBoolean;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check

Return
-------
flag: bool

Description
-----------
reads parameter <nump> of record <num> as a Boolean Return value and Check managed as by ReadReal (demands a Boolean enum, i.e. text '.T.' for True or '.F.' for False).
") ReadBoolean;
		bool ReadBoolean(const int num, const int nump, const char * const mess, opencascade::handle<Interface_Check> & ach, Standard_Boolean &OutValue);

		/****** StepData_StepReaderData::ReadEnum ******/
		/****** md5 signature: 929b27485a24157b080bf36169ce16a0 ******/
		%feature("compactdefaultargs") ReadEnum;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check
enumtool: StepData_EnumTool

Return
-------
val: int

Description
-----------
Reads parameter <nump> of record <num> as an Enumeration (text between dots) and converts it to an integer value, by an EnumTool. Returns True if OK, false if: this parameter is not enumeration, or is not recognized by the EnumTool (with fail).
") ReadEnum;
		bool ReadEnum(const int num, const int nump, const char * const mess, opencascade::handle<Interface_Check> & ach, const StepData_EnumTool & enumtool, Standard_Integer &OutValue);

		/****** StepData_StepReaderData::ReadEnumParam ******/
		/****** md5 signature: a90475e4cdca15f9e37bbc9f8a634d22 ******/
		%feature("compactdefaultargs") ReadEnumParam;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check
text: char *

Return
-------
bool

Description
-----------
No available documentation.
") ReadEnumParam;
		bool ReadEnumParam(const int num, const int nump, const char * const mess, opencascade::handle<Interface_Check> & ach, const char * & text);

		/****** StepData_StepReaderData::ReadField ******/
		/****** md5 signature: ed579f6390b9fcb2976ab2d940a9e7bf ******/
		%feature("compactdefaultargs") ReadField;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: char *
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
		bool ReadField(const int num, const int nump, const char * const mess, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepData_PDescr> & descr, StepData_Field & fild);

		/****** StepData_StepReaderData::ReadInteger ******/
		/****** md5 signature: fd45b997700fa7eb99a2a100340febfe ******/
		%feature("compactdefaultargs") ReadInteger;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check

Return
-------
val: int

Description
-----------
reads parameter <nump> of record <num> as a single Integer. Return value & Check managed as by ReadXY (demands an Integer).
") ReadInteger;
		bool ReadInteger(const int num, const int nump, const char * const mess, opencascade::handle<Interface_Check> & ach, Standard_Integer &OutValue);

		/****** StepData_StepReaderData::ReadList ******/
		/****** md5 signature: c2b11e3e9be6224543ad5efa537a0743 ******/
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
		bool ReadList(const int num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepData_ESDescr> & descr, StepData_FieldList & list);

		/****** StepData_StepReaderData::ReadLogical ******/
		/****** md5 signature: d2ac57eba435501d5426ff5bdd6b2be4 ******/
		%feature("compactdefaultargs") ReadLogical;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check

Return
-------
flag: StepData_Logical

Description
-----------
reads parameter <nump> of record <num> as a Logical Return value and Check managed as by ReadBoolean (demands a Logical enum, i.e. text '.T.', '.F.', or '.U.').
") ReadLogical;
		bool ReadLogical(const int num, const int nump, const char * const mess, opencascade::handle<Interface_Check> & ach, StepData_Logical &OutValue);

		/****** StepData_StepReaderData::ReadReal ******/
		/****** md5 signature: 2501df368fae3ed243ec96446f557690 ******/
		%feature("compactdefaultargs") ReadReal;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check

Return
-------
val: double

Description
-----------
reads parameter <nump> of record <num> as a single Real value. Return value and Check managed as by ReadXY (demands a Real).
") ReadReal;
		bool ReadReal(const int num, const int nump, const char * const mess, opencascade::handle<Interface_Check> & ach, Standard_Real &OutValue);

		/****** StepData_StepReaderData::ReadString ******/
		/****** md5 signature: d50e8e302439b2be2b25bc045d3b74f2 ******/
		%feature("compactdefaultargs") ReadString;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check

Return
-------
val: TCollection_HAsciiString

Description
-----------
reads parameter <nump> of record <num> as a String (text between quotes, quotes are removed by the Read operation) Return value and Check managed as by ReadXY (demands a String).
") ReadString;
		bool ReadString(const int num, const int nump, const char * const mess, opencascade::handle<Interface_Check> & ach, opencascade::handle<TCollection_HAsciiString> &OutValue);

		/****** StepData_StepReaderData::ReadSub ******/
		/****** md5 signature: 893e44efbbdf6521f3f36f2d11e9d154 ******/
		%feature("compactdefaultargs") ReadSub;
		%feature("autodoc", "
Parameters
----------
numsub: int
mess: char *
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
		int ReadSub(const int numsub, const char * const mess, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepData_PDescr> & descr, opencascade::handle<Standard_Transient> & val);

		/****** StepData_StepReaderData::ReadSubList ******/
		/****** md5 signature: c72be8506a16d04fb05cbfdb00a63e31 ******/
		%feature("compactdefaultargs") ReadSubList;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check
optional: bool (optional, default to false)
lenmin: int (optional, default to 0)
lenmax: int (optional, default to 0)

Return
-------
numsub: int

Description
-----------
reads parameter <nump> of record <num> as a sub-list (may be typed, see ReadTypedParameter in this case) Returns True if OK. Else (not a LIST), returns false and feeds Check with appropriate check If <optional> is True and Param is not defined, returns True with <ach> not filled and <numsub> returned as 0 Works with SubListNumber with <aslast> false (no specific case for last parameter).
") ReadSubList;
		bool ReadSubList(const int num, const int nump, const char * const mess, opencascade::handle<Interface_Check> & ach, Standard_Integer &OutValue, const bool optional = false, const int lenmin = 0, const int lenmax = 0);

		/****** StepData_StepReaderData::ReadTypedParam ******/
		/****** md5 signature: ae4532ad46ba3df46639f45cd9618d1f ******/
		%feature("compactdefaultargs") ReadTypedParam;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mustbetyped: bool
mess: char *
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
		bool ReadTypedParam(const int num, const int nump, const bool mustbetyped, const char * const mess, opencascade::handle<Interface_Check> & ach, Standard_Integer &OutValue, Standard_Integer &OutValue, TCollection_AsciiString & typ);

		/****** StepData_StepReaderData::ReadXY ******/
		/****** md5 signature: 67ee76cb045e42ee05897ceb9b7ef629 ******/
		%feature("compactdefaultargs") ReadXY;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check

Return
-------
X: double
Y: double

Description
-----------
reads parameter <nump> of record <num> as a sub-list of two Reals X,Y. Returns True if OK. Else, returns false and feeds Check with appropriate Fails (parameter not a sub-list, not two Reals in the sub-list) composed with 'mess' which gives the name of the parameter.
") ReadXY;
		bool ReadXY(const int num, const int nump, const char * const mess, opencascade::handle<Interface_Check> & ach, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** StepData_StepReaderData::ReadXYZ ******/
		/****** md5 signature: 9d7d83849568da061827c1266225bc1c ******/
		%feature("compactdefaultargs") ReadXYZ;
		%feature("autodoc", "
Parameters
----------
num: int
nump: int
mess: char *
ach: Interface_Check

Return
-------
X: double
Y: double
Z: double

Description
-----------
reads parameter <nump> of record <num> as a sub-list of three Reals X,Y,Z. Return value and Check managed as by ReadXY (demands a sub-list of three Reals).
") ReadXYZ;
		bool ReadXYZ(const int num, const int nump, const char * const mess, opencascade::handle<Interface_Check> & ach, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** StepData_StepReaderData::RecordIdent ******/
		/****** md5 signature: 308e97c9b1f553efee72b22b115c7144 ******/
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
		int RecordIdent(const int num);

		/****** StepData_StepReaderData::RecordType ******/
		/****** md5 signature: 9002cf266c5eabd55940d8892d9e7136 ******/
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
		const TCollection_AsciiString & RecordType(const int num);

		/****** StepData_StepReaderData::SetEntityNumbers ******/
		/****** md5 signature: 3d2bccfc00695e305c5bb6be87bd61f9 ******/
		%feature("compactdefaultargs") SetEntityNumbers;
		%feature("autodoc", "
Parameters
----------
withmap: bool (optional, default to true)

Return
-------
None

Description
-----------
determines reference numbers in EntityNumber fields called by Prepare from StepReaderTool to prepare later using by a StepModel. This method is attached to StepReaderData because it needs a massive amount of data accesses to work //! If <withmap> is given False, the basic exploration algorithm is activated, otherwise a map is used as far as it is possible this option can be used only to test this algorithm.
") SetEntityNumbers;
		void SetEntityNumbers(const bool withmap = true);

		/****** StepData_StepReaderData::SetRecord ******/
		/****** md5 signature: bf37b88d25f59d6b93ed14ed647d4e19 ******/
		%feature("compactdefaultargs") SetRecord;
		%feature("autodoc", "
Parameters
----------
num: int
ident: char *
type: char *
nbpar: int

Return
-------
None

Description
-----------
Fills the fields of a record.
") SetRecord;
		void SetRecord(const int num, const char * const ident, const char * const type, const int nbpar);

		/****** StepData_StepReaderData::SubListNumber ******/
		/****** md5 signature: 74a9bec010398f8de0785ab46fe2d517 ******/
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
		int SubListNumber(const int num, const int nump, const bool aslast);

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
		/****** md5 signature: a60900bedd4413c52500df36a81d3b7a ******/
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
		bool AnalyseRecord(const int num, const opencascade::handle<Standard_Transient> & anent, opencascade::handle<Interface_Check> & acheck);

		/****** StepData_StepReaderTool::BeginRead ******/
		/****** md5 signature: 46873b04bd6384a1d2fef06e6fde3df7 ******/
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
		/****** md5 signature: db8dac182c765bca467b8fdedbbbb0c2 ******/
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
		void EndRead(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** StepData_StepReaderTool::Prepare ******/
		/****** md5 signature: d7e5553695ef2765973d3b2313e6814b ******/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "
Parameters
----------
optimize: bool (optional, default to true)

Return
-------
None

Description
-----------
Bounds empty entities to records, uses default Recognition provided by ReaderLib and ReaderModule. Also calls computation of references (SetEntityNumbers from StepReaderData) Works only on data entities (skips header) <optimize> given False allows to test some internal algorithms which are normally avoided (see also StepReaderData).
") Prepare;
		void Prepare(const bool optimize = true);

		/****** StepData_StepReaderTool::Prepare ******/
		/****** md5 signature: 6af363e066b7a29f568fe856b1d49b24 ******/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "
Parameters
----------
reco: StepData_FileRecognizer
optimize: bool (optional, default to true)

Return
-------
None

Description
-----------
Bounds empty entities to records, works with a specific FileRecognizer, stored and later used in Recognize Works only on data entities (skips header) <optimize: same as above.
") Prepare;
		void Prepare(const opencascade::handle<StepData_FileRecognizer> & reco, const bool optimize = true);

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
		/****** md5 signature: a2c2c552219e2267fe1814cabbf3077c ******/
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
		bool Recognize(const int num, opencascade::handle<Interface_Check> & ach, opencascade::handle<Standard_Transient> & ent);

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

		/****** StepData_StepWriter::CleanTextForSend ******/
		/****** md5 signature: 20926cba0364f2a2a3d74fcbfdd887f9 ******/
		%feature("compactdefaultargs") CleanTextForSend;
		%feature("autodoc", "
Parameters
----------
theText: str

Return
-------
TCollection_AsciiString

Description
-----------
Static helper function to prepare text for STEP file output while preserving existing ISO 10303-21 control directives. //! This function processes input text and escapes special characters (quotes, backslashes, newlines, tabs) for STEP file format compliance, while carefully preserving any existing control directives that may already be present in the input string. //! Supported control directive patterns that are preserved: - \X{HH}\: Single byte character encoding (U+0000 to U+00FF) - \X2\{HHHH}...\X0\: UTF-16 character encoding - \X4\{HHHHHHHH}...\X0\: UTF-32 character encoding - \S\: Latin codepoint character with current code page - \P{A-I}\: Code page control directive - \N\: Newline directive (preserved as-is) - \T\: Tab directive (preserved as-is) //! Character escaping performed (only on non-directive content): - Single quote (') -> double quote ('') - Backslash (\) -> double backslash (\\) - Newline character -> \N\ directive - Tab character -> \T\ directive //! Example: Input: 'text with \XA7\ and 'quotes'' Output: 'text with \XA7\ and ''quotes''' //! 
Parameter theText The input text string to be processed 
Return: Processed text with preserved control directives and escaped special characters.
") CleanTextForSend;
		static TCollection_AsciiString CleanTextForSend(TCollection_AsciiString theText);

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
		/****** md5 signature: 96f333f8314dc84222a8020af99860ec ******/
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
		void Comment(const bool mode);

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
		/****** md5 signature: c7358dd663ba6c179606d62d3a500233 ******/
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
		void Indent(const bool onent);

		/****** StepData_StepWriter::IsInScope ******/
		/****** md5 signature: d55316ce7c7df89e385ab4cfe56b4911 ******/
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
		bool IsInScope(const int num);

		/****** StepData_StepWriter::JoinLast ******/
		/****** md5 signature: ac3b8764e1c97c09f95da24d3eac6a06 ******/
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
		void JoinLast(const bool newline);

		/****** StepData_StepWriter::LabelMode ******/
		/****** md5 signature: 5c8f614e7e8c758690073325f81f58e5 ******/
		%feature("compactdefaultargs") LabelMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
ModeLabel controls how to display entity ids: 0 (D) gives entity number in the model 1 gives the already recorded label (else, its number) Warning: conflicts are not controlled.
") LabelMode;
		int & LabelMode();

		/****** StepData_StepWriter::Line ******/
		/****** md5 signature: 8aeca6ab96a5147c8851ef0a905af55b ******/
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
		opencascade::handle<TCollection_HAsciiString> Line(const int num);

		/****** StepData_StepWriter::NbLines ******/
		/****** md5 signature: 7c1b53177daa19e8eec95fb1ac3b65c8 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of Lines.
") NbLines;
		int NbLines();

		/****** StepData_StepWriter::NewLine ******/
		/****** md5 signature: bdcf75b24982bf4e51ea93e69d5f491d ******/
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
		void NewLine(const bool evenempty);

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
		/****** md5 signature: 52e8ddc0b09366420157bf676c04b35c ******/
		%feature("compactdefaultargs") OpenTypedSub;
		%feature("autodoc", "
Parameters
----------
subtype: char *

Return
-------
None

Description
-----------
open a sublist with its type then a '('.
") OpenTypedSub;
		void OpenTypedSub(const char * const subtype);

		/****** StepData_StepWriter::Print ******/
		/****** md5 signature: 2e9441dae72d0faaf26e312805c35ddd ******/
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
		bool Print(std::ostream &OutValue);

		/****** StepData_StepWriter::Send ******/
		/****** md5 signature: 589866becf20444d499fd338a7ad9f08 ******/
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
		void Send(const int val);

		/****** StepData_StepWriter::Send ******/
		/****** md5 signature: 1b26e87909d2e56aede53edb1d52c382 ******/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "
Parameters
----------
val: double

Return
-------
None

Description
-----------
sends a real parameter (works with FloatWriter).
") Send;
		void Send(const double val);

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
		/****** md5 signature: 86486790a0a8ece40b6b413d9ce20ba3 ******/
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
		/****** md5 signature: a9ab78867e7a9275dfd7011d6487664a ******/
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
		void SendBoolean(const bool val);

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
		/****** md5 signature: 2955b5d0abe7701c444e1f659bf891b8 ******/
		%feature("compactdefaultargs") SendComment;
		%feature("autodoc", "
Parameters
----------
text: char *

Return
-------
None

Description
-----------
same as above but accepts a CString (ex.: '...' directly).
") SendComment;
		void SendComment(const char * const text);

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
		/****** md5 signature: 0ee087cdfc4ccc6425c9857010eb55aa ******/
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
		void SendEntity(const int nument, const StepData_WriterLib & lib);

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
		/****** md5 signature: 1d568718ac35b8c22ba84e9d0badc5a7 ******/
		%feature("compactdefaultargs") SendEnum;
		%feature("autodoc", "
Parameters
----------
val: char *

Return
-------
None

Description
-----------
sends an enum given by String (literal expression) adds '.' around it if not done.
") SendEnum;
		void SendEnum(const char * const val);

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
		/****** md5 signature: f20b09c75b8ffef808a1c49e1f5da2c2 ******/
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
		void SendIdent(const int ident);

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
		/****** md5 signature: bfd09c8d64bcb85b1bca0a5611dcc7a2 ******/
		%feature("compactdefaultargs") SendModel;
		%feature("autodoc", "
Parameters
----------
protocol: StepData_Protocol
headeronly: bool (optional, default to false)

Return
-------
None

Description
-----------
Sends the complete Model, included HEADER and DATA Sections Works with a WriterLib defined through a Protocol If <headeronly> is given True, only the HEADER Section is sent (used to Dump the Header of a StepModel).
") SendModel;
		void SendModel(const opencascade::handle<StepData_Protocol> & protocol, const bool headeronly = false);

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
		/****** md5 signature: f5d3f8e9fcbc6be5ea0aef5b4bc056ee ******/
		%feature("compactdefaultargs") SendString;
		%feature("autodoc", "
Parameters
----------
val: char *

Return
-------
None

Description
-----------
sends a string exactly as it is given.
") SendString;
		void SendString(const char * const val);

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
		/****** md5 signature: 5fb5295af32e55da055199772ebc7e57 ******/
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
		void SetScope(const int numscope, const int numin);

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

		/****** StepData_StepWriter::TypeMode ******/
		/****** md5 signature: 620ef33997c7b57d752966d2b271e61c ******/
		%feature("compactdefaultargs") TypeMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
TypeMode controls the type form to use: 0 (D) for normal long form 1 for short form (if a type name has no short form, normal long form is then used).
") TypeMode;
		int & TypeMode();

		%extend{
			int GetLabelMode() { return self->LabelMode(); }
			void SetLabelMode(int value) { self->LabelMode() = value; }
		};
		%extend{
			int GetTypeMode() { return self->TypeMode(); }
			void SetTypeMode(int value) { self->TypeMode() = value; }
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
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there are more Modules to iterate on.
") More;
		bool More();

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
		/****** md5 signature: b716284dd1c7f523e99500df994fb7fc ******/
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
		bool Select(const opencascade::handle<Standard_Transient> & obj, opencascade::handle<StepData_ReadWriteModule> & module, Standard_Integer &OutValue);

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
		/****** md5 signature: 6c4a5431a68e81bdb79f21990c310521 ******/
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
		void CheckCase(const int casenum, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****** StepData_DefaultGeneral::CopyCase ******/
		/****** md5 signature: 2df746a2e9069362b90662b3c59d1e71 ******/
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
		void CopyCase(const int casenum, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****** StepData_DefaultGeneral::FillSharedCase ******/
		/****** md5 signature: 57f99a5c34fd0fecbda8fa98b93def34 ******/
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
		void FillSharedCase(const int casenum, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****** StepData_DefaultGeneral::NewVoid ******/
		/****** md5 signature: 8fabc1cc605ad55e47c5042d5c757077 ******/
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
		bool NewVoid(const int CN, opencascade::handle<Standard_Transient> & entto);

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
		/****** md5 signature: b5ef95b2e28f2e58056e1617be433847 ******/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsComplex;
		bool IsComplex();

		/****** StepData_ECDescr::Matches ******/
		/****** md5 signature: 94d80901fa8626e1fc42f35c8d661aac ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
steptype: char *

Return
-------
bool

Description
-----------
Tells if a ESDescr matches a step type: exact or super type.
") Matches;
		bool Matches(const char * const steptype);

		/****** StepData_ECDescr::Member ******/
		/****** md5 signature: b0c4e82dd1c856f782701dd614bc196b ******/
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
		opencascade::handle<StepData_ESDescr> Member(const int num);

		/****** StepData_ECDescr::NbMembers ******/
		/****** md5 signature: 7f2ef3fd62830b6f845f7166da4c733f ******/
		%feature("compactdefaultargs") NbMembers;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of members.
") NbMembers;
		int NbMembers();

		/****** StepData_ECDescr::NewEntity ******/
		/****** md5 signature: 80b82fc200a3bb933a392cbb0854f3f5 ******/
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
		/****** md5 signature: 81c7be8663859142c9e2aac1c2df7387 ******/
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
		/****** md5 signature: 0389caa7869b6711f5c6de72b8877ebd ******/
		%feature("compactdefaultargs") StepData_ESDescr;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
None

Description
-----------
Creates an ESDescr with a type name.
") StepData_ESDescr;
		 StepData_ESDescr(const char * const name);

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
		/****** md5 signature: 8ea0a29e57bddf4d62ccc9cd98166832 ******/
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
		opencascade::handle<StepData_PDescr> Field(const int num);

		/****** StepData_ESDescr::IsComplex ******/
		/****** md5 signature: b5ef95b2e28f2e58056e1617be433847 ******/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsComplex;
		bool IsComplex();

		/****** StepData_ESDescr::IsSub ******/
		/****** md5 signature: 8ebf3ed2f0f8ed6a0f1c546f1877e2cb ******/
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
		bool IsSub(const opencascade::handle<StepData_ESDescr> & other);

		/****** StepData_ESDescr::Matches ******/
		/****** md5 signature: 94d80901fa8626e1fc42f35c8d661aac ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
steptype: char *

Return
-------
bool

Description
-----------
Tells if a ESDescr matches a step type: exact or super type.
") Matches;
		bool Matches(const char * const steptype);

		/****** StepData_ESDescr::Name ******/
		/****** md5 signature: 27dcb5b14148583b124fc911a8b27eb1 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
char *

Description
-----------
Returns the name of a field from its rank. empty if outofrange.
") Name;
		const char * Name(const int num);

		/****** StepData_ESDescr::NamedField ******/
		/****** md5 signature: 726a84df527df428669e4241838e9d42 ******/
		%feature("compactdefaultargs") NamedField;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
opencascade::handle<StepData_PDescr>

Description
-----------
Returns the PDescr for the field named <name> (or Null).
") NamedField;
		opencascade::handle<StepData_PDescr> NamedField(const char * const name);

		/****** StepData_ESDescr::NbFields ******/
		/****** md5 signature: b0632c58d21f5d7ffa4b00c6ab4e5997 ******/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of fields.
") NbFields;
		int NbFields();

		/****** StepData_ESDescr::NewEntity ******/
		/****** md5 signature: 80b82fc200a3bb933a392cbb0854f3f5 ******/
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
		/****** md5 signature: 7766214bbe2150afbe6a297c5312065b ******/
		%feature("compactdefaultargs") Rank;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
int

Description
-----------
Returns the rank of a field from its name. 0 if unknown.
") Rank;
		int Rank(const char * const name);

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
		/****** md5 signature: e8d94c8d26cb80530e8cc79c6e85b376 ******/
		%feature("compactdefaultargs") SetField;
		%feature("autodoc", "
Parameters
----------
num: int
name: char *
descr: StepData_PDescr

Return
-------
None

Description
-----------
Sets a PDescr to describe a field A Field is designated by its rank and name.
") SetField;
		void SetField(const int num, const char * const name, const opencascade::handle<StepData_PDescr> & descr);

		/****** StepData_ESDescr::SetNbFields ******/
		/****** md5 signature: bc491712488d17a22d960e2f764967ca ******/
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
		void SetNbFields(const int nb);

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
		/****** md5 signature: 83be516af6f0b375bc8d994b1977584c ******/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the type name given at creation time.
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
		/****** md5 signature: 4ef3385dce19daa758b4e5ddb109faaa ******/
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
		StepData_Field & CField(const int num);

		/****** StepData_FieldList1::Field ******/
		/****** md5 signature: bd416719b5d6d6b0ccbaf13ae88f421e ******/
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
		const StepData_Field & Field(const int num);

		/****** StepData_FieldList1::NbFields ******/
		/****** md5 signature: 2624003e4fc330234a370aae9c2b7315 ******/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of fields. Here, returns 1.
") NbFields;
		int NbFields();

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
		/****** md5 signature: 770b2d140f07e57cc0d028093678017b ******/
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
		 StepData_FieldListD(const int nb);

		/****** StepData_FieldListD::CField ******/
		/****** md5 signature: 4ef3385dce19daa758b4e5ddb109faaa ******/
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
		StepData_Field & CField(const int num);

		/****** StepData_FieldListD::Field ******/
		/****** md5 signature: bd416719b5d6d6b0ccbaf13ae88f421e ******/
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
		const StepData_Field & Field(const int num);

		/****** StepData_FieldListD::NbFields ******/
		/****** md5 signature: 2624003e4fc330234a370aae9c2b7315 ******/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of fields. Here, returns starting <nb>.
") NbFields;
		int NbFields();

		/****** StepData_FieldListD::SetNb ******/
		/****** md5 signature: 10671db3073eaccc00d818d3510b4392 ******/
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
		void SetNb(const int nb);

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
		/****** md5 signature: 308988577db169acef1baf58c8662305 ******/
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
		 StepData_FieldListN(const int nb);

		/****** StepData_FieldListN::CField ******/
		/****** md5 signature: 4ef3385dce19daa758b4e5ddb109faaa ******/
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
		StepData_Field & CField(const int num);

		/****** StepData_FieldListN::Field ******/
		/****** md5 signature: bd416719b5d6d6b0ccbaf13ae88f421e ******/
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
		const StepData_Field & Field(const int num);

		/****** StepData_FieldListN::NbFields ******/
		/****** md5 signature: 2624003e4fc330234a370aae9c2b7315 ******/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of fields. Here, returns starting <nb>.
") NbFields;
		int NbFields();

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
		/****** md5 signature: 87a3530b42c39ea9e90fac7e699798e9 ******/
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
		bool GlobalCheck(const Interface_Graph & G, opencascade::handle<Interface_Check> & ach);

		/****** StepData_FileProtocol::NbResources ******/
		/****** md5 signature: 3c8410815357f0a892211359291d8070 ******/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the count of Protocols used as Resource (can be zero) i.e. the count of Protocol recorded by calling the method Add.
") NbResources;
		int NbResources();

		/****** StepData_FileProtocol::Resource ******/
		/****** md5 signature: 3c19c2497364406e7d4e9d2a0f8d51c0 ******/
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
		opencascade::handle<Interface_Protocol> Resource(const int num);

		/****** StepData_FileProtocol::SchemaName ******/
		/****** md5 signature: f5e5aca7e98ca49f6dd2c4128c7187e6 ******/
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "
Parameters
----------
theModel: Interface_InterfaceModel

Return
-------
char *

Description
-----------
Returns the Schema Name attached to each class of Protocol To be redefined by each sub-class Here, SchemaName returns '' (empty String) was C++: return const.
") SchemaName;
		const char * SchemaName(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****** StepData_FileProtocol::TypeNumber ******/
		/****** md5 signature: bbae632533589e3c2443854ef12e6cb8 ******/
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
		int TypeNumber(const opencascade::handle<Standard_Type> & atype);

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
		/****** md5 signature: 02f32a4582696bb35bdee8883d8d6b5d ******/
		%feature("compactdefaultargs") As;
		%feature("autodoc", "
Parameters
----------
steptype: char *

Return
-------
opencascade::handle<StepData_Simple>

Description
-----------
Returns a Simple Entity which matches with a Type in <self>: For a Simple Entity: me if it matches, else a null handle For a Complex Entity: the member which matches, else null.
") As;
		opencascade::handle<StepData_Simple> As(const char * const steptype);

		/****** StepData_Plex::CField ******/
		/****** md5 signature: f6994a884b9f5b25dc4f812aa66f0aa2 ******/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
StepData_Field

Description
-----------
Returns a Field from its name; read or write.
") CField;
		StepData_Field & CField(const char * const name);

		/****** StepData_Plex::Check ******/
		/****** md5 signature: 985a03c528171f996fdf473b46a0684b ******/
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
		/****** md5 signature: 2227bc84d41c10d79aa93fd5fc3dddab ******/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
StepData_Field

Description
-----------
Returns a Field from its name; read-only.
") Field;
		const StepData_Field & Field(const char * const name);

		/****** StepData_Plex::HasField ******/
		/****** md5 signature: e4fa13ac63d3911ab7e8d4a4d64b16d2 ******/
		%feature("compactdefaultargs") HasField;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Tells if a Field brings a given name.
") HasField;
		bool HasField(const char * const name);

		/****** StepData_Plex::IsComplex ******/
		/****** md5 signature: b5ef95b2e28f2e58056e1617be433847 ******/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsComplex;
		bool IsComplex();

		/****** StepData_Plex::Matches ******/
		/****** md5 signature: 94d80901fa8626e1fc42f35c8d661aac ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
steptype: char *

Return
-------
bool

Description
-----------
Tells if a step type is matched by <self> For a Simple Entity: own type or super type For a Complex Entity: one of the members.
") Matches;
		bool Matches(const char * const steptype);

		/****** StepData_Plex::Member ******/
		/****** md5 signature: deef58e864187468d464014314dd3c07 ******/
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
		opencascade::handle<StepData_Simple> Member(const int num);

		/****** StepData_Plex::NbMembers ******/
		/****** md5 signature: 7f2ef3fd62830b6f845f7166da4c733f ******/
		%feature("compactdefaultargs") NbMembers;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of simple members.
") NbMembers;
		int NbMembers();

		/****** StepData_Plex::Shared ******/
		/****** md5 signature: 0b7ec3674ed1bdb191caacb8dbb02b97 ******/
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
		/****** md5 signature: 81c7be8663859142c9e2aac1c2df7387 ******/
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
		/****** md5 signature: 3c4f88d18e8d45b712cb44c78bb53612 ******/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Int;
		int Int();

		/****** StepData_SelectInt::Kind ******/
		/****** md5 signature: 3498b2f7ea64caceb6e4729945892060 ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Kind;
		int Kind();

		/****** StepData_SelectInt::SetInt ******/
		/****** md5 signature: fe25dd22438eec4079fe300e708bf53b ******/
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
		void SetInt(const int val);

		/****** StepData_SelectInt::SetKind ******/
		/****** md5 signature: 7c92c66f2bab746f391fd0e58bc19a8b ******/
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
		void SetKind(const int kind);

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
		/****** md5 signature: 0fcc7580a7b0aa7df9ee626d148cd8f4 ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasName;
		bool HasName();

		/****** StepData_SelectNamed::Int ******/
		/****** md5 signature: 3c4f88d18e8d45b712cb44c78bb53612 ******/
		%feature("compactdefaultargs") Int;
		%feature("autodoc", "Return
-------
int

Description
-----------
This internal method gives access to a value implemented by an Integer (to read it).
") Int;
		int Int();

		/****** StepData_SelectNamed::Kind ******/
		/****** md5 signature: 3498b2f7ea64caceb6e4729945892060 ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Kind;
		int Kind();

		/****** StepData_SelectNamed::Name ******/
		/****** md5 signature: f81f5718972ea56a52cc674874d73fa6 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
No available documentation.
") Name;
		const char * Name();

		/****** StepData_SelectNamed::Real ******/
		/****** md5 signature: 9b563a66e4f6c06aa9c18be40ccd8396 ******/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Real;
		double Real();

		/****** StepData_SelectNamed::SetInt ******/
		/****** md5 signature: fe25dd22438eec4079fe300e708bf53b ******/
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
		void SetInt(const int val);

		/****** StepData_SelectNamed::SetKind ******/
		/****** md5 signature: 7c92c66f2bab746f391fd0e58bc19a8b ******/
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
		void SetKind(const int kind);

		/****** StepData_SelectNamed::SetName ******/
		/****** md5 signature: 43a419e9da8ca16400e117289b098561 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
No available documentation.
") SetName;
		bool SetName(const char * const name);

		/****** StepData_SelectNamed::SetReal ******/
		/****** md5 signature: b8323169e0efa0a9e7770e3de3cdc82c ******/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "
Parameters
----------
val: double

Return
-------
None

Description
-----------
No available documentation.
") SetReal;
		void SetReal(const double val);

		/****** StepData_SelectNamed::SetString ******/
		/****** md5 signature: f473f2293b6fe65749d049ae4ceef880 ******/
		%feature("compactdefaultargs") SetString;
		%feature("autodoc", "
Parameters
----------
val: char *

Return
-------
None

Description
-----------
No available documentation.
") SetString;
		void SetString(const char * const val);

		/****** StepData_SelectNamed::String ******/
		/****** md5 signature: 0d2af1f1a250ffaacb3bda47cb53702a ******/
		%feature("compactdefaultargs") String;
		%feature("autodoc", "Return
-------
char *

Description
-----------
No available documentation.
") String;
		const char * String();

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
		/****** md5 signature: 3498b2f7ea64caceb6e4729945892060 ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Kind;
		int Kind();

		/****** StepData_SelectReal::Real ******/
		/****** md5 signature: 9b563a66e4f6c06aa9c18be40ccd8396 ******/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Real;
		double Real();

		/****** StepData_SelectReal::SetReal ******/
		/****** md5 signature: b8323169e0efa0a9e7770e3de3cdc82c ******/
		%feature("compactdefaultargs") SetReal;
		%feature("autodoc", "
Parameters
----------
val: double

Return
-------
None

Description
-----------
No available documentation.
") SetReal;
		void SetReal(const double val);

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
		/****** md5 signature: 02f32a4582696bb35bdee8883d8d6b5d ******/
		%feature("compactdefaultargs") As;
		%feature("autodoc", "
Parameters
----------
steptype: char *

Return
-------
opencascade::handle<StepData_Simple>

Description
-----------
Returns a Simple Entity which matches with a Type in <self>: For a Simple Entity: me if it matches, else a null handle For a Complex Entity: the member which matches, else null.
") As;
		opencascade::handle<StepData_Simple> As(const char * const steptype);

		/****** StepData_Simple::CField ******/
		/****** md5 signature: f6994a884b9f5b25dc4f812aa66f0aa2 ******/
		%feature("compactdefaultargs") CField;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
StepData_Field

Description
-----------
Returns a Field from its name; read or write.
") CField;
		StepData_Field & CField(const char * const name);

		/****** StepData_Simple::CFieldNum ******/
		/****** md5 signature: 8b89e286679687951dd20ca13209e409 ******/
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
		StepData_Field & CFieldNum(const int num);

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
		/****** md5 signature: 985a03c528171f996fdf473b46a0684b ******/
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
		/****** md5 signature: 2227bc84d41c10d79aa93fd5fc3dddab ******/
		%feature("compactdefaultargs") Field;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
StepData_Field

Description
-----------
Returns a Field from its name; read-only.
") Field;
		const StepData_Field & Field(const char * const name);

		/****** StepData_Simple::FieldNum ******/
		/****** md5 signature: fb2193d063ab022afcdc98cbd28a7a8b ******/
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
		const StepData_Field & FieldNum(const int num);

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
		/****** md5 signature: e4fa13ac63d3911ab7e8d4a4d64b16d2 ******/
		%feature("compactdefaultargs") HasField;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Tells if a Field brings a given name.
") HasField;
		bool HasField(const char * const name);

		/****** StepData_Simple::IsComplex ******/
		/****** md5 signature: b5ef95b2e28f2e58056e1617be433847 ******/
		%feature("compactdefaultargs") IsComplex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False.
") IsComplex;
		bool IsComplex();

		/****** StepData_Simple::Matches ******/
		/****** md5 signature: 94d80901fa8626e1fc42f35c8d661aac ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
steptype: char *

Return
-------
bool

Description
-----------
Tells if a step type is matched by <self> For a Simple Entity: own type or super type For a Complex Entity: one of the members.
") Matches;
		bool Matches(const char * const steptype);

		/****** StepData_Simple::NbFields ******/
		/****** md5 signature: b0632c58d21f5d7ffa4b00c6ab4e5997 ******/
		%feature("compactdefaultargs") NbFields;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of fields.
") NbFields;
		int NbFields();

		/****** StepData_Simple::Shared ******/
		/****** md5 signature: 0b7ec3674ed1bdb191caacb8dbb02b97 ******/
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
		/****** md5 signature: 414e83f20ae8a1d5bb2ccd95edc0449f ******/
		%feature("compactdefaultargs") StepType;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the recorded StepType (TypeName of its ESDescr).
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
		/****** md5 signature: 82493cc3a263a0604ce79ee2353ecd17 ******/
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
		/****** md5 signature: 3498b2f7ea64caceb6e4729945892060 ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Kind;
		int Kind();

		/****** StepData_SelectArrReal::SetArrReal ******/
		/****** md5 signature: 914d4ec4e69f464c2bbb748917564fc1 ******/
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

class StepData_HArray1OfField : public NCollection_Array1<StepData_Field>, public Standard_Transient {
  public:
    StepData_HArray1OfField(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepData_HArray1OfField(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepData_Field>::value_type& theValue);
    StepData_HArray1OfField(const NCollection_Array1<StepData_Field>& theOther);
    const NCollection_Array1<StepData_Field>& Array1();
    NCollection_Array1<StepData_Field>& ChangeArray1();
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
def StepData_StepWriter_CleanTextForSend(*args):
	return StepData_StepWriter.CleanTextForSend(*args)

@deprecated
def StepData_WriterLib_SetGlobal(*args):
	return StepData_WriterLib.SetGlobal(*args)

}
