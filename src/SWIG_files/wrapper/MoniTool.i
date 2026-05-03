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
%define MONITOOLDOCSTRING
"MoniTool module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_monitool.html"
%enddef
%module (package="OCC.Core", docstring=MONITOOLDOCSTRING) MoniTool


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
#include<MoniTool_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<Message_module.hxx>
#include<TCollection_module.hxx>
#include<OSD_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import gp.i
%import Message.i
%import TCollection.i
%import OSD.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum MoniTool_ValueType {
	MoniTool_ValueMisc = 0,
	MoniTool_ValueInteger = 1,
	MoniTool_ValueReal = 2,
	MoniTool_ValueIdent = 3,
	MoniTool_ValueVoid = 4,
	MoniTool_ValueText = 5,
	MoniTool_ValueEnum = 6,
	MoniTool_ValueLogical = 7,
	MoniTool_ValueSub = 8,
	MoniTool_ValueHexa = 9,
	MoniTool_ValueBinary = 10,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class MoniTool_ValueType(IntEnum):
	MoniTool_ValueMisc = 0
	MoniTool_ValueInteger = 1
	MoniTool_ValueReal = 2
	MoniTool_ValueIdent = 3
	MoniTool_ValueVoid = 4
	MoniTool_ValueText = 5
	MoniTool_ValueEnum = 6
	MoniTool_ValueLogical = 7
	MoniTool_ValueSub = 8
	MoniTool_ValueHexa = 9
	MoniTool_ValueBinary = 10
MoniTool_ValueMisc = MoniTool_ValueType.MoniTool_ValueMisc
MoniTool_ValueInteger = MoniTool_ValueType.MoniTool_ValueInteger
MoniTool_ValueReal = MoniTool_ValueType.MoniTool_ValueReal
MoniTool_ValueIdent = MoniTool_ValueType.MoniTool_ValueIdent
MoniTool_ValueVoid = MoniTool_ValueType.MoniTool_ValueVoid
MoniTool_ValueText = MoniTool_ValueType.MoniTool_ValueText
MoniTool_ValueEnum = MoniTool_ValueType.MoniTool_ValueEnum
MoniTool_ValueLogical = MoniTool_ValueType.MoniTool_ValueLogical
MoniTool_ValueSub = MoniTool_ValueType.MoniTool_ValueSub
MoniTool_ValueHexa = MoniTool_ValueType.MoniTool_ValueHexa
MoniTool_ValueBinary = MoniTool_ValueType.MoniTool_ValueBinary
};
/* end python proxy for enums */

/* handles */
%wrap_handle(MoniTool_CaseData)
%wrap_handle(MoniTool_Element)
%wrap_handle(MoniTool_IntVal)
%wrap_handle(MoniTool_RealVal)
%wrap_handle(MoniTool_SignText)
%wrap_handle(MoniTool_Timer)
%wrap_handle(MoniTool_TypedValue)
%wrap_handle(MoniTool_SignShape)
%wrap_handle(MoniTool_TransientElem)
/* end handles declaration */

/* templates */
%ignore NCollection_DataMap<TopoDS_Shape,opencascade::handle<Standard_Transient>,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,opencascade::handle<Standard_Transient>,TopTools_ShapeMapHasher>::KeyValues;
%template(MoniTool_DataMapOfShapeTransient) NCollection_DataMap<TopoDS_Shape,opencascade::handle<Standard_Transient>,TopTools_ShapeMapHasher>;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,opencascade::handle<Standard_Transient>,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,opencascade::handle<Standard_Transient>,TopTools_ShapeMapHasher>::KeyValues;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,opencascade::handle<Standard_Transient>,TopTools_ShapeMapHasher>::IndexedItems;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,opencascade::handle<Standard_Transient>,TopTools_ShapeMapHasher>::Contained;
%template(MoniTool_IndexedDataMapOfShapeTransient) NCollection_IndexedDataMap<TopoDS_Shape,opencascade::handle<Standard_Transient>,TopTools_ShapeMapHasher>;
%template(MoniTool_SequenceOfElement) NCollection_Sequence<opencascade::handle<MoniTool_Element>>;

%extend NCollection_Sequence<opencascade::handle<MoniTool_Element>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<Standard_Transient>, TopTools_ShapeMapHasher>::Iterator MoniTool_DataMapIteratorOfDataMapOfShapeTransient;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<Standard_Transient>, TopTools_ShapeMapHasher> MoniTool_DataMapOfShapeTransient;
typedef NCollection_HSequence<opencascade::handle<MoniTool_Element>> MoniTool_HSequenceOfElement;
typedef NCollection_IndexedDataMap<TopoDS_Shape, opencascade::handle<Standard_Transient>, TopTools_ShapeMapHasher> MoniTool_IndexedDataMapOfShapeTransient;
typedef NCollection_Sequence<opencascade::handle<MoniTool_Element>> MoniTool_SequenceOfElement;
/* end typedefs declaration */

/**************************
* class MoniTool_AttrList *
**************************/
class MoniTool_AttrList {
	public:
		/****** MoniTool_AttrList::MoniTool_AttrList ******/
		/****** md5 signature: f7316938355278c0258f18df32d45c4b ******/
		%feature("compactdefaultargs") MoniTool_AttrList;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an AttrList, empty.
") MoniTool_AttrList;
		 MoniTool_AttrList();

		/****** MoniTool_AttrList::MoniTool_AttrList ******/
		/****** md5 signature: 1f622e0139ab42ddb11cef0b29c0e0bc ******/
		%feature("compactdefaultargs") MoniTool_AttrList;
		%feature("autodoc", "
Parameters
----------
other: MoniTool_AttrList

Return
-------
None

Description
-----------
Creates an AttrList from another one, definitions are shared (calls SameAttributes).
") MoniTool_AttrList;
		 MoniTool_AttrList(const MoniTool_AttrList & other);

		/****** MoniTool_AttrList::AttrList ******/
		/****** md5 signature: 7e1fb43f6aa6b3324760286668f16a94 ******/
		%feature("compactdefaultargs") AttrList;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>

Description
-----------
Returns the exhaustive list of attributes.
") AttrList;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & AttrList();

		/****** MoniTool_AttrList::Attribute ******/
		/****** md5 signature: 61b74cee807124b4ea25e7a7780af237 ******/
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns an attribute from its name. Null Handle if not recorded (whatever Transient, Integer, Real ...) Integer is recorded as IntVal Real is recorded as RealVal Text is recorded as HAsciiString.
") Attribute;
		opencascade::handle<Standard_Transient> Attribute(const char * const name);

		/****** MoniTool_AttrList::AttributeType ******/
		/****** md5 signature: a02f292ec63488e40a04cdcdfb0a2555 ******/
		%feature("compactdefaultargs") AttributeType;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
MoniTool_ValueType

Description
-----------
Returns the type of an attribute: ValueInt, ValueReal, ValueText (String), ValueIdent (any) or ValueVoid (not recorded).
") AttributeType;
		MoniTool_ValueType AttributeType(const char * const name);

		/****** MoniTool_AttrList::GetAttribute ******/
		/****** md5 signature: 301b05b19b01313a1d1a60f39a0c61a3 ******/
		%feature("compactdefaultargs") GetAttribute;
		%feature("autodoc", "
Parameters
----------
name: char *
type: Standard_Type
val: Standard_Transient

Return
-------
bool

Description
-----------
Returns an attribute from its name, filtered by a type If no attribute has this name, or if it is not kind of this type, <val> is Null and returned value is False Else, it is True.
") GetAttribute;
		bool GetAttribute(const char * const name, const opencascade::handle<Standard_Type> & type, opencascade::handle<Standard_Transient> & val);

		/****** MoniTool_AttrList::GetAttributes ******/
		/****** md5 signature: a4a8f024b2d13351999f8efff3ce03b7 ******/
		%feature("compactdefaultargs") GetAttributes;
		%feature("autodoc", "
Parameters
----------
other: MoniTool_AttrList
fromname: char * (optional, default to "")
copied: bool (optional, default to true)

Return
-------
None

Description
-----------
Gets the list of attributes from <other>, by copying it By default, considers all the attributes from <other> If <fromname> is given, considers only the attributes with name beginning by <fromname> //! For each attribute, if <copied> is True (D), its value is also copied if it is a basic type (Integer,Real,String), else it remains shared between <other> and <self> //! These new attributes are added to the existing ones in <self>, in case of same name, they replace the existing ones.
") GetAttributes;
		void GetAttributes(const MoniTool_AttrList & other, const char * const fromname = "", const bool copied = true);

		/****** MoniTool_AttrList::GetIntegerAttribute ******/
		/****** md5 signature: f4bdc5fdfc78cf804ad9688cfe2fd0bd ******/
		%feature("compactdefaultargs") GetIntegerAttribute;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
val: int

Description
-----------
Returns an attribute from its name, as integer If no attribute has this name, or not an integer, <val> is 0 and returned value is False Else, it is True.
") GetIntegerAttribute;
		bool GetIntegerAttribute(const char * const name, Standard_Integer &OutValue);

		/****** MoniTool_AttrList::GetRealAttribute ******/
		/****** md5 signature: e1d11b5c694cd0e19584286a08432cb2 ******/
		%feature("compactdefaultargs") GetRealAttribute;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
val: double

Description
-----------
Returns an attribute from its name, as real If no attribute has this name, or not a real <val> is 0.0 and returned value is False Else, it is True.
") GetRealAttribute;
		bool GetRealAttribute(const char * const name, Standard_Real &OutValue);

		/****** MoniTool_AttrList::GetStringAttribute ******/
		/****** md5 signature: 1eb47361bcb0be5cec2ecdadd6779f6c ******/
		%feature("compactdefaultargs") GetStringAttribute;
		%feature("autodoc", "
Parameters
----------
name: char *
val: char *

Return
-------
bool

Description
-----------
Returns an attribute from its name, as String If no attribute has this name, or not a String <val> is 0.0 and returned value is False Else, it is True.
") GetStringAttribute;
		bool GetStringAttribute(const char * const name, const char * & val);

		/****** MoniTool_AttrList::IntegerAttribute ******/
		/****** md5 signature: e21357e3b6f11ccb2c035efcc979db7b ******/
		%feature("compactdefaultargs") IntegerAttribute;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
int

Description
-----------
Returns an integer attribute from its name. 0 if not recorded.
") IntegerAttribute;
		int IntegerAttribute(const char * const name);

		/****** MoniTool_AttrList::RealAttribute ******/
		/****** md5 signature: 6f7498029d2a3f8e7d1974820a2c0fd8 ******/
		%feature("compactdefaultargs") RealAttribute;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
double

Description
-----------
Returns a real attribute from its name. 0.0 if not recorded.
") RealAttribute;
		double RealAttribute(const char * const name);

		/****** MoniTool_AttrList::RemoveAttribute ******/
		/****** md5 signature: 840236e34d212bb5ece70e80f0032a46 ******/
		%feature("compactdefaultargs") RemoveAttribute;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Removes an attribute Returns True when done, False if this attribute did not exist.
") RemoveAttribute;
		bool RemoveAttribute(const char * const name);

		/****** MoniTool_AttrList::SameAttributes ******/
		/****** md5 signature: 547f034f219ce85d3fb7576a461a7e64 ******/
		%feature("compactdefaultargs") SameAttributes;
		%feature("autodoc", "
Parameters
----------
other: MoniTool_AttrList

Return
-------
None

Description
-----------
Gets the list of attributes from <other>, as such, i.e. not copied: attributes are shared, any attribute edited, added, or removed in <other> is also in <self> and vice versa The former list of attributes of <self> is dropped.
") SameAttributes;
		void SameAttributes(const MoniTool_AttrList & other);

		/****** MoniTool_AttrList::SetAttribute ******/
		/****** md5 signature: 4be6acde589af50b9b09dcaab0d21601 ******/
		%feature("compactdefaultargs") SetAttribute;
		%feature("autodoc", "
Parameters
----------
name: char *
val: Standard_Transient

Return
-------
None

Description
-----------
Adds an attribute with a given name (replaces the former one with the same name if already exists).
") SetAttribute;
		void SetAttribute(const char * const name, const opencascade::handle<Standard_Transient> & val);

		/****** MoniTool_AttrList::SetIntegerAttribute ******/
		/****** md5 signature: e17be05694385d7bd04d97f8911e1801 ******/
		%feature("compactdefaultargs") SetIntegerAttribute;
		%feature("autodoc", "
Parameters
----------
name: char *
val: int

Return
-------
None

Description
-----------
Adds an integer value for an attribute.
") SetIntegerAttribute;
		void SetIntegerAttribute(const char * const name, const int val);

		/****** MoniTool_AttrList::SetRealAttribute ******/
		/****** md5 signature: 710dc4b61762728f32b662f8ccdd0a20 ******/
		%feature("compactdefaultargs") SetRealAttribute;
		%feature("autodoc", "
Parameters
----------
name: char *
val: double

Return
-------
None

Description
-----------
Adds a real value for an attribute.
") SetRealAttribute;
		void SetRealAttribute(const char * const name, const double val);

		/****** MoniTool_AttrList::SetStringAttribute ******/
		/****** md5 signature: 94db0c2716dbf429e8214beb0428fbba ******/
		%feature("compactdefaultargs") SetStringAttribute;
		%feature("autodoc", "
Parameters
----------
name: char *
val: char *

Return
-------
None

Description
-----------
Adds a String value for an attribute.
") SetStringAttribute;
		void SetStringAttribute(const char * const name, const char * const val);

		/****** MoniTool_AttrList::StringAttribute ******/
		/****** md5 signature: 1f4c914446b691f2358a6982ff8c3630 ******/
		%feature("compactdefaultargs") StringAttribute;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
char *

Description
-----------
Returns a String attribute from its name. '' if not recorded.
") StringAttribute;
		const char * StringAttribute(const char * const name);

};


%extend MoniTool_AttrList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class MoniTool_CaseData *
**************************/
class MoniTool_CaseData : public Standard_Transient {
	public:
		/****** MoniTool_CaseData::MoniTool_CaseData ******/
		/****** md5 signature: 095b382805d9e795807f8d53c3bdd006 ******/
		%feature("compactdefaultargs") MoniTool_CaseData;
		%feature("autodoc", "
Parameters
----------
caseid: char * (optional, default to "")
name: char * (optional, default to "")

Return
-------
None

Description
-----------
Creates a CaseData with a CaseId and a Name (by default not defined).
") MoniTool_CaseData;
		 MoniTool_CaseData(const char * const caseid = "", const char * const name = "");

		/****** MoniTool_CaseData::AddAny ******/
		/****** md5 signature: cf9f63ba2a6b65fe981b3a480534165e ******/
		%feature("compactdefaultargs") AddAny;
		%feature("autodoc", "
Parameters
----------
val: Standard_Transient
name: char * (optional, default to "")

Return
-------
None

Description
-----------
Adds a Transient, with no more meaning.
") AddAny;
		void AddAny(const opencascade::handle<Standard_Transient> & val, const char * const name = "");

		/****** MoniTool_CaseData::AddCPU ******/
		/****** md5 signature: ec74ddcf4a016f51ac645e98e7b10dde ******/
		%feature("compactdefaultargs") AddCPU;
		%feature("autodoc", "
Parameters
----------
lastCPU: double
curCPU: double (optional, default to 0)
name: char * (optional, default to "")

Return
-------
None

Description
-----------
Adds the CPU time between lastCPU and now if <curCPU> is given, the CPU amount is curCPU-lastCPU else it is currently measured CPU - lastCPU lastCPU has been read by call to GetCPU See GetCPU to get amount, and LargeCPU to test large amount.
") AddCPU;
		void AddCPU(const double lastCPU, const double curCPU = 0, const char * const name = "");

		/****** MoniTool_CaseData::AddData ******/
		/****** md5 signature: d8d1a57a8df11b5528af6696a6a00d0a ******/
		%feature("compactdefaultargs") AddData;
		%feature("autodoc", "
Parameters
----------
val: Standard_Transient
kind: int
name: char * (optional, default to "")

Return
-------
None

Description
-----------
Unitary adding a data; rather internal.
") AddData;
		void AddData(const opencascade::handle<Standard_Transient> & val, const int kind, const char * const name = "");

		/****** MoniTool_CaseData::AddEntity ******/
		/****** md5 signature: 36bc2d5a77c0519df44ff4cc79670e17 ******/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
name: char * (optional, default to "")

Return
-------
None

Description
-----------
Adds a Transient, as an Entity from an InterfaceModel for instance: it will then be printed with the help of a DBPE.
") AddEntity;
		void AddEntity(const opencascade::handle<Standard_Transient> & ent, const char * const name = "");

		/****** MoniTool_CaseData::AddGeom ******/
		/****** md5 signature: 76442794d44adde5a227e935653c7894 ******/
		%feature("compactdefaultargs") AddGeom;
		%feature("autodoc", "
Parameters
----------
geom: Standard_Transient
name: char * (optional, default to "")

Return
-------
None

Description
-----------
Adds a Geometric as a Transient (Curve, Surface ...).
") AddGeom;
		void AddGeom(const opencascade::handle<Standard_Transient> & geom, const char * const name = "");

		/****** MoniTool_CaseData::AddInteger ******/
		/****** md5 signature: 422cc88bcc4ef65174033503d00af2e1 ******/
		%feature("compactdefaultargs") AddInteger;
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
Adds an Integer.
") AddInteger;
		void AddInteger(const int val, const char * const name = "");

		/****** MoniTool_CaseData::AddRaised ******/
		/****** md5 signature: 517abb4aec2c8f0fe28034a29fd373f2 ******/
		%feature("compactdefaultargs") AddRaised;
		%feature("autodoc", "
Parameters
----------
theException: Standard_Failure
name: char * (optional, default to "")

Return
-------
None

Description
-----------
Adds the currently caught exception.
") AddRaised;
		void AddRaised(const Standard_Failure & theException, const char * const name = "");

		/****** MoniTool_CaseData::AddReal ******/
		/****** md5 signature: cb3332c2c578d269dab2a9d89afaba29 ******/
		%feature("compactdefaultargs") AddReal;
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
Adds a Real.
") AddReal;
		void AddReal(const double val, const char * const name = "");

		/****** MoniTool_CaseData::AddReals ******/
		/****** md5 signature: 4e259e540153e203618ce46200cb8b04 ******/
		%feature("compactdefaultargs") AddReals;
		%feature("autodoc", "
Parameters
----------
v1: double
v2: double
name: char * (optional, default to "")

Return
-------
None

Description
-----------
Adds two reals (for instance, two parameters).
") AddReals;
		void AddReals(const double v1, const double v2, const char * const name = "");

		/****** MoniTool_CaseData::AddShape ******/
		/****** md5 signature: f647f5087f3cdd3d99971edfcfe96a98 ******/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "
Parameters
----------
sh: TopoDS_Shape
name: char * (optional, default to "")

Return
-------
None

Description
-----------
Adds a Shape (recorded as a HShape).
") AddShape;
		void AddShape(const TopoDS_Shape & sh, const char * const name = "");

		/****** MoniTool_CaseData::AddText ******/
		/****** md5 signature: a1e578c7fc73c6166b515d017c1d8fac ******/
		%feature("compactdefaultargs") AddText;
		%feature("autodoc", "
Parameters
----------
text: char *
name: char * (optional, default to "")

Return
-------
None

Description
-----------
Adds a Text (as HAsciiString).
") AddText;
		void AddText(const char * const text, const char * const name = "");

		/****** MoniTool_CaseData::AddXY ******/
		/****** md5 signature: e6cb03cadb86788d96026a82833bb374 ******/
		%feature("compactdefaultargs") AddXY;
		%feature("autodoc", "
Parameters
----------
aXY: gp_XY
name: char * (optional, default to "")

Return
-------
None

Description
-----------
Adds a XY.
") AddXY;
		void AddXY(const gp_XY & aXY, const char * const name = "");

		/****** MoniTool_CaseData::AddXYZ ******/
		/****** md5 signature: 080d471e4898caf48383a44b06970fef ******/
		%feature("compactdefaultargs") AddXYZ;
		%feature("autodoc", "
Parameters
----------
aXYZ: gp_XYZ
name: char * (optional, default to "")

Return
-------
None

Description
-----------
Adds a XYZ.
") AddXYZ;
		void AddXYZ(const gp_XYZ & aXYZ, const char * const name = "");

		/****** MoniTool_CaseData::CaseId ******/
		/****** md5 signature: b451ff4596e9ba4cfecac7d63df46579 ******/
		%feature("compactdefaultargs") CaseId;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the CaseId.
") CaseId;
		const char * CaseId();

		/****** MoniTool_CaseData::Data ******/
		/****** md5 signature: 59354f2978a520eb5a937f600d42cab9 ******/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "
Parameters
----------
nd: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns a data item (n0 <nd> in the set <num>).
") Data;
		opencascade::handle<Standard_Transient> Data(const int nd);

		/****** MoniTool_CaseData::DefCheck ******/
		/****** md5 signature: d12b6dcb7979707ade9a31205021dfaa ******/
		%feature("compactdefaultargs") DefCheck;
		%feature("autodoc", "
Parameters
----------
acode: char *

Return
-------
int

Description
-----------
Returns Check Status for a Code: 0 non/info (default), 1 warning, 2 fail //! Remark: DefCheck is used to set the check status of a CaseData when it is attached to a case code, it can be changed later (by SetFail, SetWarning, ResetCheck).
") DefCheck;
		static int DefCheck(const char * const acode);

		/****** MoniTool_CaseData::DefMsg ******/
		/****** md5 signature: 0a7670ac58ae1636ee02baf48708962b ******/
		%feature("compactdefaultargs") DefMsg;
		%feature("autodoc", "
Parameters
----------
casecode: char *

Return
-------
char *

Description
-----------
Returns the message definition for a case code Empty if no message attached.
") DefMsg;
		static const char * DefMsg(const char * const casecode);

		/****** MoniTool_CaseData::GetCPU ******/
		/****** md5 signature: aac8de5859be809321ce472d564deaec ******/
		%feature("compactdefaultargs") GetCPU;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the current amount of CPU This allows to laterly test and record CPU amount Its value has to be given to LargeCPU and AddCPU.
") GetCPU;
		double GetCPU();

		/****** MoniTool_CaseData::GetData ******/
		/****** md5 signature: afb0c5beb67a0442ac672c1b78437dff ******/
		%feature("compactdefaultargs") GetData;
		%feature("autodoc", "
Parameters
----------
nd: int
type: Standard_Type
val: Standard_Transient

Return
-------
bool

Description
-----------
Returns a data item, under control of a Type If the data item is kind of this type, it is returned in <val> and the returned value is True Else, <val> is unchanged and the returned value is False.
") GetData;
		bool GetData(const int nd, const opencascade::handle<Standard_Type> & type, opencascade::handle<Standard_Transient> & val);

		/****** MoniTool_CaseData::Integer ******/
		/****** md5 signature: e371bf28db535934ec53c5cb317cb49a ******/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "
Parameters
----------
nd: int

Return
-------
val: int

Description
-----------
Returns an Integer.
") Integer;
		bool Integer(const int nd, Standard_Integer &OutValue);

		/****** MoniTool_CaseData::IsCheck ******/
		/****** md5 signature: 7728d6549e1a61e1cdff61a4c3a061be ******/
		%feature("compactdefaultargs") IsCheck;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is Check (Warning or Fail), else it is Info.
") IsCheck;
		bool IsCheck();

		/****** MoniTool_CaseData::IsFail ******/
		/****** md5 signature: ec2188e610ced5fce8bc42f6d7b7bbd2 ******/
		%feature("compactdefaultargs") IsFail;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is Fail.
") IsFail;
		bool IsFail();

		/****** MoniTool_CaseData::IsWarning ******/
		/****** md5 signature: 3f5211ee7fd3bbdc2e13b923e80b2568 ******/
		%feature("compactdefaultargs") IsWarning;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is Warning.
") IsWarning;
		bool IsWarning();

		/****** MoniTool_CaseData::Kind ******/
		/****** md5 signature: 39231d0ecf839ecf9bbf0911cbdf8828 ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "
Parameters
----------
nd: int

Return
-------
int

Description
-----------
Returns the kind of a data: KIND TYPE MEANING 0 ANY any (not one of the following) 1 EX raised exception 2 EN entity 3 G geom 4 SH shape 5 XYZ XYZ 6 XY or UV XY 7 RR 2 reals 8 R 1 real 9 CPU CPU (1 real) 10 T text 11 I integer //! For NameNum, these codes for TYPE must be given exact i.e. SH for a Shape, not S nor SHAPE nor SOLID etc.
") Kind;
		int Kind(const int nd);

		/****** MoniTool_CaseData::LargeCPU ******/
		/****** md5 signature: a350718163a99ca6521560cc73dde21f ******/
		%feature("compactdefaultargs") LargeCPU;
		%feature("autodoc", "
Parameters
----------
maxCPU: double
lastCPU: double
curCPU: double (optional, default to 0)

Return
-------
bool

Description
-----------
Tells if a CPU time amount is large <maxCPU> gives the amount over which an amount is large <lastCPU> gives the start CPU amount if <curCPU> is given, the tested CPU amount is curCPU-lastCPU else it is currently measured CPU - lastCPU.
") LargeCPU;
		bool LargeCPU(const double maxCPU, const double lastCPU, const double curCPU = 0);

		/****** MoniTool_CaseData::Msg ******/
		/****** md5 signature: 9a65aef83214ce6d33b185aed38c1f0a ******/
		%feature("compactdefaultargs") Msg;
		%feature("autodoc", "Return
-------
Message_Msg

Description
-----------
Returns a Msg from a CaseData: it is build from DefMsg, which gives the message code plus the designation of items of the CaseData to be added to the Msg Empty if no message attached //! Remains to be implemented.
") Msg;
		Message_Msg Msg();

		/****** MoniTool_CaseData::Name ******/
		/****** md5 signature: c01515d64eb8c383d620d861376d0837 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the Name.
") Name;
		const char * Name();

		/****** MoniTool_CaseData::Name ******/
		/****** md5 signature: 9df6872f3ae88a184ec13bf8aca5ff4a ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "
Parameters
----------
nd: int

Return
-------
TCollection_AsciiString

Description
-----------
Returns the name of a data. If it has no name, the string is empty (length = 0).
") Name;
		const TCollection_AsciiString & Name(const int nd);

		/****** MoniTool_CaseData::NameNum ******/
		/****** md5 signature: 86810629fdb9af6564e8590cad50084b ******/
		%feature("compactdefaultargs") NameNum;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
int

Description
-----------
Returns the first suitable data rank for a given name Exact matching (exact case, no completion) is required Firstly checks the recorded names If not found, considers the name as follows: Name = 'TYPE': search for the first item with this TYPE Name = 'TYPE:nn': search for the nn.th item with this TYPE See allowed values in method Kind.
") NameNum;
		int NameNum(const char * const name);

		/****** MoniTool_CaseData::NbData ******/
		/****** md5 signature: 7fc584303bd621d978c73acc4ba03ad4 ******/
		%feature("compactdefaultargs") NbData;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of data recorded to a set.
") NbData;
		int NbData();

		/****** MoniTool_CaseData::Real ******/
		/****** md5 signature: bbc373071afaeaa531c7d57510436765 ******/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "
Parameters
----------
nd: int

Return
-------
val: double

Description
-----------
Returns a real or CPU amount (stored in Geom2d_CartesianPoint) (allows an Integer converted to a Real).
") Real;
		bool Real(const int nd, Standard_Real &OutValue);

		/****** MoniTool_CaseData::Reals ******/
		/****** md5 signature: 4b3e27f0e31f4d3c19d13baabba5e077 ******/
		%feature("compactdefaultargs") Reals;
		%feature("autodoc", "
Parameters
----------
nd: int

Return
-------
v1: double
v2: double

Description
-----------
Returns a couple of reals (stored in Geom2d_CartesianPoint).
") Reals;
		bool Reals(const int nd, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** MoniTool_CaseData::RemoveData ******/
		/****** md5 signature: bce36a5d00117950d0bc09c0abd2518b ******/
		%feature("compactdefaultargs") RemoveData;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
Removes a Data from its rank. Does nothing if out of range.
") RemoveData;
		void RemoveData(const int num);

		/****** MoniTool_CaseData::ResetCheck ******/
		/****** md5 signature: 994db56670d518106b28f0eb1c3ddbaf ******/
		%feature("compactdefaultargs") ResetCheck;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets Check Status, i.e. sets <self> as Info.
") ResetCheck;
		void ResetCheck();

		/****** MoniTool_CaseData::SetCaseId ******/
		/****** md5 signature: 5763e8f2cc73398c7e048c3a25358222 ******/
		%feature("compactdefaultargs") SetCaseId;
		%feature("autodoc", "
Parameters
----------
caseid: char *

Return
-------
None

Description
-----------
Sets a CaseId.
") SetCaseId;
		void SetCaseId(const char * const caseid);

		/****** MoniTool_CaseData::SetChange ******/
		/****** md5 signature: 35020ffdf661ae424b32ec90844aa543 ******/
		%feature("compactdefaultargs") SetChange;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the next Add... not to add but to change the data item designated by its name. If next Add... is not called with a name, SetChange is ignored Reset by next Add... , whatever <num> is correct or not.
") SetChange;
		void SetChange();

		/****** MoniTool_CaseData::SetDefFail ******/
		/****** md5 signature: 52032e68a0225ff15310b1fb8c036ced ******/
		%feature("compactdefaultargs") SetDefFail;
		%feature("autodoc", "
Parameters
----------
acode: char *

Return
-------
None

Description
-----------
Sets a Code to give a Fail.
") SetDefFail;
		static void SetDefFail(const char * const acode);

		/****** MoniTool_CaseData::SetDefMsg ******/
		/****** md5 signature: 03d92acf194f9faa2f3cf5d5468009aa ******/
		%feature("compactdefaultargs") SetDefMsg;
		%feature("autodoc", "
Parameters
----------
casecode: char *
mesdef: char *

Return
-------
None

Description
-----------
Attaches a message definition to a case code This definition includes the message code plus designation of items of the CaseData to be added to the message (this part not yet implemented).
") SetDefMsg;
		static void SetDefMsg(const char * const casecode, const char * const mesdef);

		/****** MoniTool_CaseData::SetDefWarning ******/
		/****** md5 signature: 398c96aed0b636e08bdeefa16f39ae07 ******/
		%feature("compactdefaultargs") SetDefWarning;
		%feature("autodoc", "
Parameters
----------
acode: char *

Return
-------
None

Description
-----------
Sets a Code to give a Warning.
") SetDefWarning;
		static void SetDefWarning(const char * const acode);

		/****** MoniTool_CaseData::SetFail ******/
		/****** md5 signature: 31938ccd35b6a5850873a21884c12ffc ******/
		%feature("compactdefaultargs") SetFail;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets <self> as Fail.
") SetFail;
		void SetFail();

		/****** MoniTool_CaseData::SetName ******/
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
Sets a Name.
") SetName;
		void SetName(const char * const name);

		/****** MoniTool_CaseData::SetReplace ******/
		/****** md5 signature: 56a52648fefa2710fcdbc80ee7b120c5 ******/
		%feature("compactdefaultargs") SetReplace;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
Sets the next Add... not to add but to replace the data item <num>, if <num> is between 1 and NbData. Reset by next Add... , whatever <num> is correct or not.
") SetReplace;
		void SetReplace(const int num);

		/****** MoniTool_CaseData::SetWarning ******/
		/****** md5 signature: 58fb56cb90f7ed086699b1ee96d438c0 ******/
		%feature("compactdefaultargs") SetWarning;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets <self> as Warning.
") SetWarning;
		void SetWarning();

		/****** MoniTool_CaseData::Shape ******/
		/****** md5 signature: b008ee32d5adb630761bbed350872730 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
nd: int

Return
-------
TopoDS_Shape

Description
-----------
Returns a data as a shape, Null if not a shape.
") Shape;
		TopoDS_Shape Shape(const int nd);

		/****** MoniTool_CaseData::Text ******/
		/****** md5 signature: a6c04b8191da4f44d304e0e93c80fa3c ******/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "
Parameters
----------
nd: int
text: char *

Return
-------
bool

Description
-----------
Returns a text (stored in TCollection_HAsciiString).
") Text;
		bool Text(const int nd, const char * & text);

		/****** MoniTool_CaseData::XY ******/
		/****** md5 signature: afcf2709044bbd471979f9bdb0692c3c ******/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "
Parameters
----------
nd: int
val: gp_XY

Return
-------
bool

Description
-----------
Returns a data as a XY (i.e. Geom2d_CartesianPoint) Returns False if not the good type.
") XY;
		bool XY(const int nd, gp_XY & val);

		/****** MoniTool_CaseData::XYZ ******/
		/****** md5 signature: bf814fadb8e5a0c5f53222a805c227d9 ******/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "
Parameters
----------
nd: int
val: gp_XYZ

Return
-------
bool

Description
-----------
Returns a data as a XYZ (i.e. Geom_CartesianPoint) Returns False if not the good type.
") XYZ;
		bool XYZ(const int nd, gp_XYZ & val);

};


%make_alias(MoniTool_CaseData)

%extend MoniTool_CaseData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class MoniTool_DataInfo *
**************************/
class MoniTool_DataInfo {
	public:
		/****** MoniTool_DataInfo::Type ******/
		/****** md5 signature: 192a28917d102787dc4550e6e61c97a0 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the Type attached to an object Here, the Dynamic Type of a Transient. Null Type if unknown.
") Type;
		static opencascade::handle<Standard_Type> Type(const opencascade::handle<Standard_Transient> & ent);

		/****** MoniTool_DataInfo::TypeName ******/
		/****** md5 signature: 34f591c4cd7fd1dae37681a7fee60154 ******/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
char *

Description
-----------
Returns Type Name (string) Allows to name type of non-handled objects.
") TypeName;
		static const char * TypeName(const opencascade::handle<Standard_Transient> & ent);

};


%extend MoniTool_DataInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class MoniTool_Element *
*************************/
%nodefaultctor MoniTool_Element;
class MoniTool_Element : public Standard_Transient {
	public:
		/****** MoniTool_Element::ChangeAttr ******/
		/****** md5 signature: 37f068e8d5573c47945d4a10825eef1d ******/
		%feature("compactdefaultargs") ChangeAttr;
		%feature("autodoc", "Return
-------
MoniTool_AttrList

Description
-----------
Returns (modifiable) the Attribute List.
") ChangeAttr;
		MoniTool_AttrList & ChangeAttr();

		/****** MoniTool_Element::Equates ******/
		/****** md5 signature: dca59b7e4ea02e39b4f762ee7887b7ec ******/
		%feature("compactdefaultargs") Equates;
		%feature("autodoc", "
Parameters
----------
other: MoniTool_Element

Return
-------
bool

Description
-----------
Specific testof equality: to be defined by each sub-class, must be False if Elements have not the same true Type, else their contents must be compared.
") Equates;
		virtual bool Equates(const opencascade::handle<MoniTool_Element> & other);

		/****** MoniTool_Element::GetHashCode ******/
		/****** md5 signature: 7287addabc58f18bcef75f2c632e90c4 ******/
		%feature("compactdefaultargs") GetHashCode;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Returns the HashCode which has been stored by SetHashCode (remark that HashCode could be deferred then be defined by sub-classes, the result is the same).
") GetHashCode;
		size_t GetHashCode();

		/****** MoniTool_Element::ListAttr ******/
		/****** md5 signature: 89db2371bd1b9507aadc1fc2ccd6a47b ******/
		%feature("compactdefaultargs") ListAttr;
		%feature("autodoc", "Return
-------
MoniTool_AttrList

Description
-----------
Returns (readonly) the Attribute List.
") ListAttr;
		const MoniTool_AttrList & ListAttr();

		/****** MoniTool_Element::ValueType ******/
		/****** md5 signature: 7bf10d093b4c83528695e983de0b203f ******/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the Type of the Value. By default, returns the DynamicType of <self>, but can be redefined.
") ValueType;
		virtual opencascade::handle<Standard_Type> ValueType();

		/****** MoniTool_Element::ValueTypeName ******/
		/****** md5 signature: 8f7815b30e9ac78ada2d7b59245dac6f ******/
		%feature("compactdefaultargs") ValueTypeName;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the name of the Type of the Value. Default is name of ValueType, unless it is for a non-handled object.
") ValueTypeName;
		virtual const char * ValueTypeName();

};


%make_alias(MoniTool_Element)

%extend MoniTool_Element {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class MoniTool_IntVal *
************************/
class MoniTool_IntVal : public Standard_Transient {
	public:
		/****** MoniTool_IntVal::MoniTool_IntVal ******/
		/****** md5 signature: c37703d03fc22a8aa4656e7a995723e3 ******/
		%feature("compactdefaultargs") MoniTool_IntVal;
		%feature("autodoc", "
Parameters
----------
val: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") MoniTool_IntVal;
		 MoniTool_IntVal(const int val = 0);

		/****** MoniTool_IntVal::CValue ******/
		/****** md5 signature: 951890a4297fbccd079907a620b4e41b ******/
		%feature("compactdefaultargs") CValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") CValue;
		int & CValue();

		/****** MoniTool_IntVal::Value ******/
		/****** md5 signature: c627cada3dfed5ccab6c1f1ff49fb87f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Value;
		int Value();

};


%make_alias(MoniTool_IntVal)

%extend MoniTool_IntVal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class MoniTool_RealVal *
*************************/
class MoniTool_RealVal : public Standard_Transient {
	public:
		/****** MoniTool_RealVal::MoniTool_RealVal ******/
		/****** md5 signature: 93e4e2005c54db23aab4f8c9c3fb26c0 ******/
		%feature("compactdefaultargs") MoniTool_RealVal;
		%feature("autodoc", "
Parameters
----------
val: double (optional, default to 0.0)

Return
-------
None

Description
-----------
No available documentation.
") MoniTool_RealVal;
		 MoniTool_RealVal(const double val = 0.0);

		/****** MoniTool_RealVal::CValue ******/
		/****** md5 signature: 6989d44e0c573a9c2e24029dc143ccfd ******/
		%feature("compactdefaultargs") CValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") CValue;
		double & CValue();

		/****** MoniTool_RealVal::Value ******/
		/****** md5 signature: dbdf6d9f5299cb6ef730d686d81d15db ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Value;
		double Value();

};


%make_alias(MoniTool_RealVal)

%extend MoniTool_RealVal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class MoniTool_SignText *
**************************/
%nodefaultctor MoniTool_SignText;
class MoniTool_SignText : public Standard_Transient {
	public:
		/****** MoniTool_SignText::Name ******/
		/****** md5 signature: 44165aab868a97dec4d77db590f1fc35 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns an identification of the Signature (a word), given at initialization time.
") Name;
		virtual const char * Name();

		/****** MoniTool_SignText::Text ******/
		/****** md5 signature: 8d6fbb08669c0a43c9d336ccc51c4fbd ******/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
context: Standard_Transient

Return
-------
TCollection_AsciiString

Description
-----------
Gives a text as a signature for a transient object in a context If the context is senseless, it can be given as Null Handle empty result if nothing to give (at least the DynamicType could be sent ?).
") Text;
		virtual TCollection_AsciiString Text(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Transient> & context);

		/****** MoniTool_SignText::TextAlone ******/
		/****** md5 signature: aed71ef19ce188a0cfee174f5a0a9194 ******/
		%feature("compactdefaultargs") TextAlone;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
TCollection_AsciiString

Description
-----------
Gives a text as a signature for a transient object alone, i.e. without defined context. By default, calls Text with undefined context (Null Handle) and if empty, then returns DynamicType.
") TextAlone;
		virtual TCollection_AsciiString TextAlone(const opencascade::handle<Standard_Transient> & ent);

};


%make_alias(MoniTool_SignText)

%extend MoniTool_SignText {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class MoniTool_Stat *
**********************/
class MoniTool_Stat {
	public:
		/****** MoniTool_Stat::MoniTool_Stat ******/
		/****** md5 signature: ae046cb64d9bb84e72307a189bec07a4 ******/
		%feature("compactdefaultargs") MoniTool_Stat;
		%feature("autodoc", "
Parameters
----------
title: char * (optional, default to "")

Return
-------
None

Description
-----------
Creates a Stat form. At start, one default phase is defined, with one default step. Then, it suffises to start with a count of items (and cycles if several) then record items, to have a queryable report.
") MoniTool_Stat;
		 MoniTool_Stat(const char * const title = "");

		/****** MoniTool_Stat::MoniTool_Stat ******/
		/****** md5 signature: 68a05e88f487eadb51ec526eeea9410c ******/
		%feature("compactdefaultargs") MoniTool_Stat;
		%feature("autodoc", "
Parameters
----------
other: MoniTool_Stat

Return
-------
None

Description
-----------
used when starting.
") MoniTool_Stat;
		 MoniTool_Stat(const MoniTool_Stat & other);

		/****** MoniTool_Stat::Add ******/
		/****** md5 signature: b160c4a250f5bd3995b6fa705c75bbca ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
nb: int (optional, default to 1)

Return
-------
None

Description
-----------
Directly adds items.
") Add;
		void Add(const int nb = 1);

		/****** MoniTool_Stat::AddEnd ******/
		/****** md5 signature: 370897480301b628c04a6bd14f86ae0e ******/
		%feature("compactdefaultargs") AddEnd;
		%feature("autodoc", "Return
-------
None

Description
-----------
Ends the AddSub and cumulates the sub-count to current level.
") AddEnd;
		void AddEnd();

		/****** MoniTool_Stat::AddSub ******/
		/****** md5 signature: 8115d351783f9973dc57aa8e36e44836 ******/
		%feature("compactdefaultargs") AddSub;
		%feature("autodoc", "
Parameters
----------
nb: int (optional, default to 1)

Return
-------
None

Description
-----------
Declares a count of items to be added later. If a sub-counter is opened, its percentage multiplies this sub-count to compute the percent of current level.
") AddSub;
		void AddSub(const int nb = 1);

		/****** MoniTool_Stat::Close ******/
		/****** md5 signature: becbd20b5f0be281a21d013384e81977 ******/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "
Parameters
----------
id: int

Return
-------
None

Description
-----------
No available documentation.
") Close;
		void Close(const int id);

		/****** MoniTool_Stat::Current ******/
		/****** md5 signature: ebcdfafb894465b5f81e125d5c4b5637 ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
MoniTool_Stat

Description
-----------
No available documentation.
") Current;
		static MoniTool_Stat & Current();

		/****** MoniTool_Stat::Level ******/
		/****** md5 signature: 1c6749a8f4fa3c4b1ef506600d9abb66 ******/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Level;
		int Level();

		/****** MoniTool_Stat::Open ******/
		/****** md5 signature: d0adaaf3c034afb85a74e5e84755c432 ******/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "
Parameters
----------
nb: int (optional, default to 100)

Return
-------
int

Description
-----------
Opens a new counter with a starting count of items.
") Open;
		int Open(const int nb = 100);

		/****** MoniTool_Stat::OpenMore ******/
		/****** md5 signature: d5a7b9878a2937a6d2732f72e0e2d5cc ******/
		%feature("compactdefaultargs") OpenMore;
		%feature("autodoc", "
Parameters
----------
id: int
nb: int

Return
-------
None

Description
-----------
Adds more items to be counted by Add... on current level.
") OpenMore;
		void OpenMore(const int id, const int nb);

		/****** MoniTool_Stat::Percent ******/
		/****** md5 signature: 53468b8b5518b0f6c3c8e8fe968507be ******/
		%feature("compactdefaultargs") Percent;
		%feature("autodoc", "
Parameters
----------
fromlev: int (optional, default to 0)

Return
-------
double

Description
-----------
No available documentation.
") Percent;
		double Percent(const int fromlev = 0);

};


%extend MoniTool_Stat {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class MoniTool_Timer *
***********************/
class MoniTool_Timer : public Standard_Transient {
	public:
		/****** MoniTool_Timer::MoniTool_Timer ******/
		/****** md5 signature: 7da08ee764ade7eb8e612ac9e8eacc68 ******/
		%feature("compactdefaultargs") MoniTool_Timer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Create timer in empty state.
") MoniTool_Timer;
		 MoniTool_Timer();

		/****** MoniTool_Timer::Amend ******/
		/****** md5 signature: 5c31e829a597cd26b49142ccb0d1cfdf ******/
		%feature("compactdefaultargs") Amend;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return value of accumulated amendment on CPU time.
") Amend;
		double Amend();

		/****** MoniTool_Timer::CPU ******/
		/****** md5 signature: b69073cf096feddc0a6a520dafd54466 ******/
		%feature("compactdefaultargs") CPU;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return value of CPU time minus accumulated amendment.
") CPU;
		double CPU();

		/****** MoniTool_Timer::ClearTimers ******/
		/****** md5 signature: 7fa02c7296fcabbcc3d9ae592e2da041 ******/
		%feature("compactdefaultargs") ClearTimers;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears map of timers.
") ClearTimers;
		static void ClearTimers();

		/****** MoniTool_Timer::ComputeAmendments ******/
		/****** md5 signature: d712d0303d6ce344bca5d1358ce67cdb ******/
		%feature("compactdefaultargs") ComputeAmendments;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes and remembers amendments for times to access, start, and stop of timer, and estimates second-order error measured by 10 nested timers.
") ComputeAmendments;
		static void ComputeAmendments();

		/****** MoniTool_Timer::Count ******/
		/****** md5 signature: 78148c14f4cfe8961517f1210318a2cc ******/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return value of hits counter (count of Start/Stop pairs).
") Count;
		int Count();

		/****** MoniTool_Timer::Dictionary ******/
		/****** md5 signature: 46f558b40f638a888a4ce2323e617434 ******/
		%feature("compactdefaultargs") Dictionary;
		%feature("autodoc", "Return
-------
NCollection_DataMap< char *, opencascade::handle<MoniTool_Timer>, strHasher>

Description
-----------
Returns map of timers.
") Dictionary;
		static NCollection_DataMap<const char *, opencascade::handle<MoniTool_Timer>, Standard_CStringHasher> & Dictionary();

		/****** MoniTool_Timer::Dump ******/
		/****** md5 signature: ba17251f1205c984d981679cb87ee281 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
ostr: Standard_OStream

Description
-----------
Dumps current state of a timer shortly (one-line output).
") Dump;
		void Dump(std::ostream &OutValue);

		/****** MoniTool_Timer::DumpTimers ******/
		/****** md5 signature: a163d6e3a2170cc59ce7e312bac33510 ******/
		%feature("compactdefaultargs") DumpTimers;
		%feature("autodoc", "
Parameters
----------

Return
-------
ostr: Standard_OStream

Description
-----------
Dumps contents of the whole dictionary.
") DumpTimers;
		static void DumpTimers(std::ostream &OutValue);

		/****** MoniTool_Timer::GetAmendments ******/
		/****** md5 signature: 6558f99320e9e4e83932a39b3b7c9365 ******/
		%feature("compactdefaultargs") GetAmendments;
		%feature("autodoc", "
Parameters
----------

Return
-------
Access: double
Internal: double
External: double
Error10: double

Description
-----------
The computed amendmens are returned (for information only).
") GetAmendments;
		static void GetAmendments(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** MoniTool_Timer::IsRunning ******/
		/****** md5 signature: 5382d2c1c4bb6d7be40b4e9209f72c21 ******/
		%feature("compactdefaultargs") IsRunning;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns value of nesting counter.
") IsRunning;
		int IsRunning();

		/****** MoniTool_Timer::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Start, Stop and reset the timer In addition to doing that to embedded OSD_Timer, manage also counter of hits.
") Reset;
		void Reset();

		/****** MoniTool_Timer::Start ******/
		/****** md5 signature: f8a4dbf1e6f2cec0927301856b440be5 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Start;
		void Start();

		/****** MoniTool_Timer::Start ******/
		/****** md5 signature: c0f8016bdc13cb24b62f786f1db9b25d ******/
		%feature("compactdefaultargs") Start;
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
") Start;
		static void Start(const char * const name);

		/****** MoniTool_Timer::Stop ******/
		/****** md5 signature: 702270b81e0a152f42e95b594cbf6271 ******/
		%feature("compactdefaultargs") Stop;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Stop;
		void Stop();

		/****** MoniTool_Timer::Stop ******/
		/****** md5 signature: af7a54c20f95028752e110364d009c77 ******/
		%feature("compactdefaultargs") Stop;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
None

Description
-----------
Inline methods to conveniently start/stop timer by name Shortcut to Timer(name)->Start/Stop().
") Stop;
		static void Stop(const char * const name);

		/****** MoniTool_Timer::Timer ******/
		/****** md5 signature: bcb4e9e61cdff233394f8b155f896468 ******/
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", "Return
-------
OSD_Timer

Description
-----------
No available documentation.
") Timer;
		const OSD_Timer & Timer();

		/****** MoniTool_Timer::Timer ******/
		/****** md5 signature: 26bc13b983ab9fb82126f8517bcdd477 ******/
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", "Return
-------
OSD_Timer

Description
-----------
Return reference to embedded OSD_Timer.
") Timer;
		OSD_Timer & Timer();

		/****** MoniTool_Timer::Timer ******/
		/****** md5 signature: fb9a71b4050aa64e523813f1ea57339f ******/
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
opencascade::handle<MoniTool_Timer>

Description
-----------
Returns a timer from a dictionary by its name If timer not existed, creates a new one.
") Timer;
		static opencascade::handle<MoniTool_Timer> Timer(const char * const name);

};


%make_alias(MoniTool_Timer)

%extend MoniTool_Timer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class MoniTool_TimerSentry *
*****************************/
class MoniTool_TimerSentry {
	public:
		/****** MoniTool_TimerSentry::MoniTool_TimerSentry ******/
		/****** md5 signature: 4eb738dc3e0d982ea8241f8d3209a601 ******/
		%feature("compactdefaultargs") MoniTool_TimerSentry;
		%feature("autodoc", "
Parameters
----------
cname: char *

Return
-------
None

Description
-----------
Constructor creates an instance and runs the corresponding timer.
") MoniTool_TimerSentry;
		 MoniTool_TimerSentry(const char * const cname);

		/****** MoniTool_TimerSentry::MoniTool_TimerSentry ******/
		/****** md5 signature: f8ad07fc64ca3f7f856174a2c43628b8 ******/
		%feature("compactdefaultargs") MoniTool_TimerSentry;
		%feature("autodoc", "
Parameters
----------
timer: MoniTool_Timer

Return
-------
None

Description
-----------
Constructor creates an instance and runs the corresponding timer.
") MoniTool_TimerSentry;
		 MoniTool_TimerSentry(const opencascade::handle<MoniTool_Timer> & timer);

		/****** MoniTool_TimerSentry::Stop ******/
		/****** md5 signature: 702270b81e0a152f42e95b594cbf6271 ******/
		%feature("compactdefaultargs") Stop;
		%feature("autodoc", "Return
-------
None

Description
-----------
Manually stops the timer.
") Stop;
		void Stop();

		/****** MoniTool_TimerSentry::Timer ******/
		/****** md5 signature: 85c5aa27e020bbb36f74c4d61646d1d4 ******/
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", "Return
-------
opencascade::handle<MoniTool_Timer>

Description
-----------
No available documentation.
") Timer;
		opencascade::handle<MoniTool_Timer> Timer();

};


%extend MoniTool_TimerSentry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class MoniTool_TypedValue *
****************************/
class MoniTool_TypedValue : public Standard_Transient {
	public:
		/****** MoniTool_TypedValue::MoniTool_TypedValue ******/
		/****** md5 signature: 969a9b820c688fcadd4decd7312636f6 ******/
		%feature("compactdefaultargs") MoniTool_TypedValue;
		%feature("autodoc", "
Parameters
----------
name: char *
type: MoniTool_ValueType (optional, default to MoniTool_ValueText)
init: char * (optional, default to "")

Return
-------
None

Description
-----------
Creates a TypedValue, with a name //! type gives the type of the parameter, default is free text Also available: Integer, Real, Enum, Entity (i.e. Object) More precise specifications, titles, can be given to the TypedValue once created //! init gives an initial value. If it is not given, the TypedValue begins as 'not set', its value is empty.
") MoniTool_TypedValue;
		 MoniTool_TypedValue(const char * const name, const MoniTool_ValueType type = MoniTool_ValueText, const char * const init = "");

		/****** MoniTool_TypedValue::MoniTool_TypedValue ******/
		/****** md5 signature: 2b88b6976dfa2d96905a887c992d595a ******/
		%feature("compactdefaultargs") MoniTool_TypedValue;
		%feature("autodoc", "
Parameters
----------
other: MoniTool_TypedValue

Return
-------
None

Description
-----------
Creates a TypedValue from another one, by duplication.
") MoniTool_TypedValue;
		 MoniTool_TypedValue(const opencascade::handle<MoniTool_TypedValue> & other);

		/****** MoniTool_TypedValue::AddDef ******/
		/****** md5 signature: 9ea157c9dc8f9d02d8615ab14cd37838 ******/
		%feature("compactdefaultargs") AddDef;
		%feature("autodoc", "
Parameters
----------
initext: char *

Return
-------
bool

Description
-----------
Completes the definition of a TypedValue by command <initext>, once created with its type Returns True if done, False if could not be interpreted <initext> may be: imin ival: minimum value for an integer imax ival: maximum value for an integer rmin rval: minimum value for a real rmax rval: maximum value for a real unit name: name of unit ematch i: enum from integer value i, match required enum i: enum from integer value i, match not required eval text: add an enumerative value (increments max by 1) eval: add a non-authorised enum value (to be skipped) tmax l: maximum length for a text.
") AddDef;
		bool AddDef(const char * const initext);

		/****** MoniTool_TypedValue::AddEnum ******/
		/****** md5 signature: a301a33cc163845bb0e640314e5f1cfa ******/
		%feature("compactdefaultargs") AddEnum;
		%feature("autodoc", "
Parameters
----------
v1: char * (optional, default to "")
v2: char * (optional, default to "")
v3: char * (optional, default to "")
v4: char * (optional, default to "")
v5: char * (optional, default to "")
v6: char * (optional, default to "")
v7: char * (optional, default to "")
v8: char * (optional, default to "")
v9: char * (optional, default to "")
v10: char * (optional, default to "")

Return
-------
None

Description
-----------
Adds enumerative definitions. For more than 10, several calls.
") AddEnum;
		void AddEnum(const char * const v1 = "", const char * const v2 = "", const char * const v3 = "", const char * const v4 = "", const char * const v5 = "", const char * const v6 = "", const char * const v7 = "", const char * const v8 = "", const char * const v9 = "", const char * const v10 = "");

		/****** MoniTool_TypedValue::AddEnumValue ******/
		/****** md5 signature: b34c8789f0aa6c176459b5f004a96521 ******/
		%feature("compactdefaultargs") AddEnumValue;
		%feature("autodoc", "
Parameters
----------
val: char *
num: int

Return
-------
None

Description
-----------
Adds an enumeration definition, by its string and numeric values. If it is the first setting for this value, it is recorded as main value. Else, it is recognized as alternate string for this numeric value.
") AddEnumValue;
		void AddEnumValue(const char * const val, const int num);

		/****** MoniTool_TypedValue::AddLib ******/
		/****** md5 signature: beb8b15376fa173f8288ee5d79e1c498 ******/
		%feature("compactdefaultargs") AddLib;
		%feature("autodoc", "
Parameters
----------
tv: MoniTool_TypedValue
def: char * (optional, default to "")

Return
-------
bool

Description
-----------
Adds a TypedValue in the library. It is recorded then will be accessed by its Name Its Definition may be imposed, else it is computed as usual By default it will be accessed by its Definition (string) Returns True if done, False if tv is Null or brings no Definition or <def> not defined //! If a TypedValue was already recorded under this name, it is replaced.
") AddLib;
		static bool AddLib(const opencascade::handle<MoniTool_TypedValue> & tv, const char * const def = "");

		/****** MoniTool_TypedValue::CStringValue ******/
		/****** md5 signature: 4c3c95d3121dc408ea6b14e5c77426b6 ******/
		%feature("compactdefaultargs") CStringValue;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the value, as a cstring. Empty if not set.
") CStringValue;
		const char * CStringValue();

		/****** MoniTool_TypedValue::ClearValue ******/
		/****** md5 signature: 70260fa193dc762fb315c6297127fb7c ******/
		%feature("compactdefaultargs") ClearValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the recorded Value: it is now unset.
") ClearValue;
		void ClearValue();

		/****** MoniTool_TypedValue::Definition ******/
		/****** md5 signature: ccdcae49759d4b73dcb504b2936ba137 ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the Definition By priority, the enforced one, else an automatic one, computed from the specification.
") Definition;
		TCollection_AsciiString Definition();

		/****** MoniTool_TypedValue::EnumCase ******/
		/****** md5 signature: 59e8dc6cc4e9baa6ebb541b0f594f7fe ******/
		%feature("compactdefaultargs") EnumCase;
		%feature("autodoc", "
Parameters
----------
val: char *

Return
-------
int

Description
-----------
Returns the case number which corresponds to a string value Works with main and additional values Returns (StartEnum - 1) if not OK, -1 if not an Enum.
") EnumCase;
		int EnumCase(const char * const val);

		/****** MoniTool_TypedValue::EnumDef ******/
		/****** md5 signature: 2c0749408a1e45c419319352d9d1fa12 ******/
		%feature("compactdefaultargs") EnumDef;
		%feature("autodoc", "
Parameters
----------

Return
-------
startcase: int
endcase: int
match: bool

Description
-----------
Gives the Enum definitions: start value, end value, match status. Returns True for an Enum, False else.
") EnumDef;
		bool EnumDef(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Boolean &OutValue);

		/****** MoniTool_TypedValue::EnumVal ******/
		/****** md5 signature: 0ec424d7aa0384eb931250a3f6f5af5f ******/
		%feature("compactdefaultargs") EnumVal;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
char *

Description
-----------
Returns the value of an enumerative definition, from its rank Empty string if out of range or not an Enum.
") EnumVal;
		const char * EnumVal(const int num);

		/****** MoniTool_TypedValue::FromLib ******/
		/****** md5 signature: f787cfd1e642c2e022cd5fa5ce2c3784 ******/
		%feature("compactdefaultargs") FromLib;
		%feature("autodoc", "
Parameters
----------
def: char *

Return
-------
opencascade::handle<MoniTool_TypedValue>

Description
-----------
Returns a COPY of the TypedValue bound with a given Name Null Handle if none recorded.
") FromLib;
		static opencascade::handle<MoniTool_TypedValue> FromLib(const char * const def);

		/****** MoniTool_TypedValue::GetObjectValue ******/
		/****** md5 signature: 23272bc4133e0775830a35a37d96d179 ******/
		%feature("compactdefaultargs") GetObjectValue;
		%feature("autodoc", "
Parameters
----------
val: Standard_Transient

Return
-------
None

Description
-----------
Same as ObjectValue, but avoids DownCast: the receiving variable is directly loaded. It is assumed that it complies with the definition of ObjectType ! Otherwise, big trouble.
") GetObjectValue;
		void GetObjectValue(opencascade::handle<Standard_Transient> & val);

		/****** MoniTool_TypedValue::HStringValue ******/
		/****** md5 signature: c0daaacdffeb9186dd6b6121d18328e9 ******/
		%feature("compactdefaultargs") HStringValue;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the value, as a Handle (can then be shared) Null if not defined.
") HStringValue;
		opencascade::handle<TCollection_HAsciiString> HStringValue();

		/****** MoniTool_TypedValue::HasInterpret ******/
		/****** md5 signature: ef94ec92cbb65ae4dcb2809c67b09a50 ******/
		%feature("compactdefaultargs") HasInterpret;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if a TypedValue has an Interpret.
") HasInterpret;
		virtual bool HasInterpret();

		/****** MoniTool_TypedValue::IntegerLimit ******/
		/****** md5 signature: 1bf532a3ac81e9ff4462b2ce9d153c2a ******/
		%feature("compactdefaultargs") IntegerLimit;
		%feature("autodoc", "
Parameters
----------
max: bool

Return
-------
val: int

Description
-----------
Gives an Integer Limit (upper if <max> True, lower if <max> False). Returns True if this limit is defined, False else (in that case, gives the natural limit for Integer).
") IntegerLimit;
		bool IntegerLimit(const bool max, Standard_Integer &OutValue);

		/****** MoniTool_TypedValue::IntegerValue ******/
		/****** md5 signature: a21ed5e6498eb5350afa935263aed2ac ******/
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value as integer, i.e.: For type = Integer, the integer itself; 0 if not set For type = Enum, the designated rank (see Enum definition) StartEnum - 1 if not set or not in the definition Else, returns 0.
") IntegerValue;
		int IntegerValue();

		/****** MoniTool_TypedValue::Internals ******/
		/****** md5 signature: 2437afeb9760e4d799b803f976c6f4b4 ******/
		%feature("compactdefaultargs") Internals;
		%feature("autodoc", "
Parameters
----------
interp: MoniTool_ValueInterpret
satisf: MoniTool_ValueSatisfies
satisname: char *
enums: NCollection_DataMap<TCollection_AsciiString, int>

Return
-------
None

Description
-----------
Access to internal data which have no other access.
") Internals;
		void Internals(MoniTool_ValueInterpret & interp, MoniTool_ValueSatisfies & satisf, const char * & satisname, NCollection_DataMap<TCollection_AsciiString, int> & enums);

		/****** MoniTool_TypedValue::Interpret ******/
		/****** md5 signature: 6e8edc616aae23bcfccf203fb5cd50dd ******/
		%feature("compactdefaultargs") Interpret;
		%feature("autodoc", "
Parameters
----------
hval: TCollection_HAsciiString
native: bool

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Interprets a value. <native> True: returns a native value <native> False: returns a coded value If the Interpret function is set, calls it Else, for an Enum, Native returns the Text, Coded returns the number STANDARD RETURNS: = hval means no specific interpretation Null means senseless Can also be redefined.
") Interpret;
		virtual opencascade::handle<TCollection_HAsciiString> Interpret(const opencascade::handle<TCollection_HAsciiString> & hval, const bool native);

		/****** MoniTool_TypedValue::IsSetValue ******/
		/****** md5 signature: 6a439a52ad1f72982a492200627937fe ******/
		%feature("compactdefaultargs") IsSetValue;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the value is set (not empty/not null object).
") IsSetValue;
		bool IsSetValue();

		/****** MoniTool_TypedValue::Label ******/
		/****** md5 signature: 0bfe42933f9d80a86e93960dded47048 ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the label, if set; else returns an empty string.
") Label;
		const char * Label();

		/****** MoniTool_TypedValue::Lib ******/
		/****** md5 signature: 88e435ec7b7fa8ee1d27a4103e8183f3 ******/
		%feature("compactdefaultargs") Lib;
		%feature("autodoc", "
Parameters
----------
def: char *

Return
-------
opencascade::handle<MoniTool_TypedValue>

Description
-----------
Returns the TypedValue bound with a given Name Null Handle if none recorded Warning: it is the original, not duplicated.
") Lib;
		static opencascade::handle<MoniTool_TypedValue> Lib(const char * const def);

		/****** MoniTool_TypedValue::LibList ******/
		/****** md5 signature: 85e9bd579985e2178bc67c8a9c53a307 ******/
		%feature("compactdefaultargs") LibList;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<TCollection_AsciiString>>

Description
-----------
Returns the list of names of items of the Library of Types Library of TypedValue as Valued Parameters, accessed by parameter name for use by management of Static Parameters.
") LibList;
		static opencascade::handle<NCollection_HSequence<TCollection_AsciiString>> LibList();

		/****** MoniTool_TypedValue::MaxLength ******/
		/****** md5 signature: f7f61d418d075aa36e1eba86ab143941 ******/
		%feature("compactdefaultargs") MaxLength;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum length, 0 if not set.
") MaxLength;
		int MaxLength();

		/****** MoniTool_TypedValue::Name ******/
		/****** md5 signature: c01515d64eb8c383d620d861376d0837 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the name.
") Name;
		const char * Name();

		/****** MoniTool_TypedValue::ObjectType ******/
		/****** md5 signature: 6320624908ef64342bea6f08a015e066 ******/
		%feature("compactdefaultargs") ObjectType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the type of which an Object TypedValue must be kind of Default is Standard_Transient Null for a TypedValue not an Object.
") ObjectType;
		opencascade::handle<Standard_Type> ObjectType();

		/****** MoniTool_TypedValue::ObjectTypeName ******/
		/****** md5 signature: 497d6b3d2a618e459f2cc4fd61ed1131 ******/
		%feature("compactdefaultargs") ObjectTypeName;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the type name of the ObjectValue, or an empty string if not set.
") ObjectTypeName;
		const char * ObjectTypeName();

		/****** MoniTool_TypedValue::ObjectValue ******/
		/****** md5 signature: bd801152e11f117b295705342aad54e1 ******/
		%feature("compactdefaultargs") ObjectValue;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the value as Transient Object, only for Object/Entity Remark that the 'HString value' is IGNORED here Null if not set; remains to be casted.
") ObjectValue;
		opencascade::handle<Standard_Transient> ObjectValue();

		/****** MoniTool_TypedValue::Print ******/
		/****** md5 signature: d481ea44f76183e17a04f4e32b90f550 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
S: Standard_OStream

Description
-----------
Prints definition, specification, and actual status and value.
") Print;
		virtual void Print(std::ostream &OutValue);

		/****** MoniTool_TypedValue::PrintValue ******/
		/****** md5 signature: a5c0ed204815d55a64ad2d065f7106ab ******/
		%feature("compactdefaultargs") PrintValue;
		%feature("autodoc", "
Parameters
----------

Return
-------
S: Standard_OStream

Description
-----------
Prints only the Value.
") PrintValue;
		void PrintValue(std::ostream &OutValue);

		/****** MoniTool_TypedValue::RealLimit ******/
		/****** md5 signature: 19998ef5cb3d4bfe60bba398e45005eb ******/
		%feature("compactdefaultargs") RealLimit;
		%feature("autodoc", "
Parameters
----------
max: bool

Return
-------
val: double

Description
-----------
Gives an Real Limit (upper if <max> True, lower if <max> False). Returns True if this limit is defined, False else (in that case, gives the natural limit for Real).
") RealLimit;
		bool RealLimit(const bool max, Standard_Real &OutValue);

		/****** MoniTool_TypedValue::RealValue ******/
		/****** md5 signature: c2cf21cf42a875e7427474a09b5db0a4 ******/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value as real, for a Real type TypedValue Else, returns 0.
") RealValue;
		double RealValue();

		/****** MoniTool_TypedValue::Satisfies ******/
		/****** md5 signature: e6946e24ecaae2c277b448609e7b8a1d ******/
		%feature("compactdefaultargs") Satisfies;
		%feature("autodoc", "
Parameters
----------
hval: TCollection_HAsciiString

Return
-------
bool

Description
-----------
Returns True if a value statifies the specification (remark: does not apply to Entity: see ObjectType, for this type, the string is just a comment).
") Satisfies;
		virtual bool Satisfies(const opencascade::handle<TCollection_HAsciiString> & hval);

		/****** MoniTool_TypedValue::SatisfiesName ******/
		/****** md5 signature: 955c80f820d2490ee2791655c39fc5c6 ******/
		%feature("compactdefaultargs") SatisfiesName;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns name of specific satisfy, empty string if none.
") SatisfiesName;
		const char * SatisfiesName();

		/****** MoniTool_TypedValue::SetCStringValue ******/
		/****** md5 signature: b838b1e928daae50e768d67f99d3c55a ******/
		%feature("compactdefaultargs") SetCStringValue;
		%feature("autodoc", "
Parameters
----------
val: char *

Return
-------
bool

Description
-----------
Changes the value. The new one must satisfy the specification Returns False (and did not set) if the new value does not satisfy the specification Can be redefined to be managed (in a subclass).
") SetCStringValue;
		virtual bool SetCStringValue(const char * const val);

		/****** MoniTool_TypedValue::SetDefinition ******/
		/****** md5 signature: 133ff5d61e68a8804a0a0c475ee709f4 ******/
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "
Parameters
----------
deftext: char *

Return
-------
None

Description
-----------
Enforces a Definition.
") SetDefinition;
		void SetDefinition(const char * const deftext);

		/****** MoniTool_TypedValue::SetHStringValue ******/
		/****** md5 signature: 2eebb5e06048799d74b20cb9b30b9e83 ******/
		%feature("compactdefaultargs") SetHStringValue;
		%feature("autodoc", "
Parameters
----------
hval: TCollection_HAsciiString

Return
-------
bool

Description
-----------
Forces a new Handle for the Value It can be empty, else (if Type is not free Text), it must satisfy the specification. Not only the value is changed, but also the way it is shared Remark: for Type=Object, this value is not controlled, it can be set as a comment Returns False (and did not set) if the new value does not satisfy the specification Can be redefined to be managed (in a subclass).
") SetHStringValue;
		virtual bool SetHStringValue(const opencascade::handle<TCollection_HAsciiString> & hval);

		/****** MoniTool_TypedValue::SetIntegerLimit ******/
		/****** md5 signature: 6a756beeac7fe6177b1f382ccc6f800b ******/
		%feature("compactdefaultargs") SetIntegerLimit;
		%feature("autodoc", "
Parameters
----------
max: bool
val: int

Return
-------
None

Description
-----------
Sets an Integer limit (included) to <val>, the upper limit if <max> is True, the lower limit if <max> is False.
") SetIntegerLimit;
		void SetIntegerLimit(const bool max, const int val);

		/****** MoniTool_TypedValue::SetIntegerValue ******/
		/****** md5 signature: 03f57e85f25ded329784caf6aee2a8c3 ******/
		%feature("compactdefaultargs") SetIntegerValue;
		%feature("autodoc", "
Parameters
----------
ival: int

Return
-------
bool

Description
-----------
Changes the value as an integer, only for Integer or Enum.
") SetIntegerValue;
		virtual bool SetIntegerValue(const int ival);

		/****** MoniTool_TypedValue::SetInterpret ******/
		/****** md5 signature: dad8a9fad1cc341287c733bfc633d813 ******/
		%feature("compactdefaultargs") SetInterpret;
		%feature("autodoc", "
Parameters
----------
func: MoniTool_ValueInterpret

Return
-------
None

Description
-----------
Sets a specific Interpret function.
") SetInterpret;
		void SetInterpret(const MoniTool_ValueInterpret func);

		/****** MoniTool_TypedValue::SetLabel ******/
		/****** md5 signature: 88583e3dd5ec34d16007dcce2c8424f6 ******/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "
Parameters
----------
label: char *

Return
-------
None

Description
-----------
Sets a label, which can then be displayed.
") SetLabel;
		void SetLabel(const char * const label);

		/****** MoniTool_TypedValue::SetMaxLength ******/
		/****** md5 signature: 9f53def313211d48cd3ca0850d0d3841 ******/
		%feature("compactdefaultargs") SetMaxLength;
		%feature("autodoc", "
Parameters
----------
max: int

Return
-------
None

Description
-----------
Sets a maximum length for a text (active only for a free text).
") SetMaxLength;
		void SetMaxLength(const int max);

		/****** MoniTool_TypedValue::SetObjectType ******/
		/****** md5 signature: d1f10681f04445c832c7a32bc0d6356d ******/
		%feature("compactdefaultargs") SetObjectType;
		%feature("autodoc", "
Parameters
----------
typ: Standard_Type

Return
-------
None

Description
-----------
Sets type of which an Object TypedValue must be kind of Error for a TypedValue not an Object (Entity).
") SetObjectType;
		void SetObjectType(const opencascade::handle<Standard_Type> & typ);

		/****** MoniTool_TypedValue::SetObjectValue ******/
		/****** md5 signature: c4667ecd2992ce463fbeb652ea02d384 ******/
		%feature("compactdefaultargs") SetObjectValue;
		%feature("autodoc", "
Parameters
----------
obj: Standard_Transient

Return
-------
bool

Description
-----------
Changes the value as Transient Object, only for Object/Entity Returns False if DynamicType does not satisfy ObjectType Can be redefined to be managed (in a subclass).
") SetObjectValue;
		virtual bool SetObjectValue(const opencascade::handle<Standard_Transient> & obj);

		/****** MoniTool_TypedValue::SetRealLimit ******/
		/****** md5 signature: e3b00b9dc9795da107e52475928edf3e ******/
		%feature("compactdefaultargs") SetRealLimit;
		%feature("autodoc", "
Parameters
----------
max: bool
val: double

Return
-------
None

Description
-----------
Sets a Real limit (included) to <val>, the upper limit if <max> is True, the lower limit if <max> is False.
") SetRealLimit;
		void SetRealLimit(const bool max, const double val);

		/****** MoniTool_TypedValue::SetRealValue ******/
		/****** md5 signature: 84ca020ab3db54ffa24e07686afbc9ec ******/
		%feature("compactdefaultargs") SetRealValue;
		%feature("autodoc", "
Parameters
----------
rval: double

Return
-------
bool

Description
-----------
Changes the value as a real, only for Real.
") SetRealValue;
		virtual bool SetRealValue(const double rval);

		/****** MoniTool_TypedValue::SetSatisfies ******/
		/****** md5 signature: 9d544f15b78ac04dbd6999d8a0064b56 ******/
		%feature("compactdefaultargs") SetSatisfies;
		%feature("autodoc", "
Parameters
----------
func: MoniTool_ValueSatisfies
name: char *

Return
-------
None

Description
-----------
Sets a specific Satisfies function: it is added to the already defined criteria It must match the form: satisfies (val: HAsciiString) returns Boolean.
") SetSatisfies;
		void SetSatisfies(const MoniTool_ValueSatisfies func, const char * const name);

		/****** MoniTool_TypedValue::SetUnitDef ******/
		/****** md5 signature: 2fb794b33db4788f8dfe062d2b77d483 ******/
		%feature("compactdefaultargs") SetUnitDef;
		%feature("autodoc", "
Parameters
----------
def: char *

Return
-------
None

Description
-----------
Sets (Clears if <def> empty) a unit definition, as an equation of dimensions. TypedValue just records this definition, does not exploit it, to be done as required by user applications.
") SetUnitDef;
		void SetUnitDef(const char * const def);

		/****** MoniTool_TypedValue::StartEnum ******/
		/****** md5 signature: 14f943e1d92634771cef1cee2bbd2c79 ******/
		%feature("compactdefaultargs") StartEnum;
		%feature("autodoc", "
Parameters
----------
start: int (optional, default to 0)
match: bool (optional, default to true)

Return
-------
None

Description
-----------
For an enumeration, precises the starting value (default 0) and the match condition: if True (D), the string value must match the definition, else it may take another value: in that case, the Integer Value will be Start - 1. (empty value remains allowed).
") StartEnum;
		void StartEnum(const int start = 0, const bool match = true);

		/****** MoniTool_TypedValue::StaticValue ******/
		/****** md5 signature: 6fd44c696c97025a70a7b6d1864dc0a9 ******/
		%feature("compactdefaultargs") StaticValue;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
opencascade::handle<MoniTool_TypedValue>

Description
-----------
Returns a static value from its name, null if unknown.
") StaticValue;
		static opencascade::handle<MoniTool_TypedValue> StaticValue(const char * const name);

		/****** MoniTool_TypedValue::UnitDef ******/
		/****** md5 signature: 03107935b885b98e40dcb74217cd6b3c ******/
		%feature("compactdefaultargs") UnitDef;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the recorded unit definition, empty if not set.
") UnitDef;
		const char * UnitDef();

		/****** MoniTool_TypedValue::ValueType ******/
		/****** md5 signature: a2b700590fb8f925c50c498db15aa421 ******/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "Return
-------
MoniTool_ValueType

Description
-----------
Returns the type of the value.
") ValueType;
		MoniTool_ValueType ValueType();

};


%make_alias(MoniTool_TypedValue)

%extend MoniTool_TypedValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class MoniTool_SignShape *
***************************/
class MoniTool_SignShape : public MoniTool_SignText {
	public:
		/****** MoniTool_SignShape::MoniTool_SignShape ******/
		/****** md5 signature: 92586a12e018f443c7cbb07692c130a0 ******/
		%feature("compactdefaultargs") MoniTool_SignShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MoniTool_SignShape;
		 MoniTool_SignShape();

		/****** MoniTool_SignShape::Name ******/
		/****** md5 signature: f81f5718972ea56a52cc674874d73fa6 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns 'SHAPE'.
") Name;
		const char * Name();

		/****** MoniTool_SignShape::Text ******/
		/****** md5 signature: 21e12f81b51627ac85fd4ba2c3857126 ******/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
context: Standard_Transient

Return
-------
TCollection_AsciiString

Description
-----------
Returns for a HShape, the string of its ShapeEnum The Model is absolutely useless (may be null).
") Text;
		TCollection_AsciiString Text(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Transient> & context);

};


%make_alias(MoniTool_SignShape)

%extend MoniTool_SignShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class MoniTool_TransientElem *
*******************************/
class MoniTool_TransientElem : public MoniTool_Element {
	public:
		/****** MoniTool_TransientElem::MoniTool_TransientElem ******/
		/****** md5 signature: 209dc6e58c11d349eee7b18ee202941d ******/
		%feature("compactdefaultargs") MoniTool_TransientElem;
		%feature("autodoc", "
Parameters
----------
akey: Standard_Transient

Return
-------
None

Description
-----------
Creates a TransientElem with a Value. This Value can then not be changed. It is used by the Hasher to compute the HashCode, which will then be stored for an immediate reading.
") MoniTool_TransientElem;
		 MoniTool_TransientElem(const opencascade::handle<Standard_Transient> & akey);

		/****** MoniTool_TransientElem::Equates ******/
		/****** md5 signature: b4d65cf6aec7314cf1fdbfc5c76acf61 ******/
		%feature("compactdefaultargs") Equates;
		%feature("autodoc", "
Parameters
----------
other: MoniTool_Element

Return
-------
bool

Description
-----------
Specific testof equality: defined as False if <other> has not the same true Type, else contents are compared (by C++ operator ==).
") Equates;
		bool Equates(const opencascade::handle<MoniTool_Element> & other);

		/****** MoniTool_TransientElem::Value ******/
		/****** md5 signature: b1443f8da90189a74241bf586c57fc63 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the contained value.
") Value;
		const opencascade::handle<Standard_Transient> & Value();

		/****** MoniTool_TransientElem::ValueType ******/
		/****** md5 signature: 9013f89343e9d7fdefc9baa7b7c53b4f ******/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the Type of the Value. By default, returns the DynamicType of <self>, but can be redefined.
") ValueType;
		opencascade::handle<Standard_Type> ValueType();

		/****** MoniTool_TransientElem::ValueTypeName ******/
		/****** md5 signature: 28672ff733ba4193d89ffe9994247474 ******/
		%feature("compactdefaultargs") ValueTypeName;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the name of the Type of the Value. Default is name of ValueType, unless it is for a non-handled object.
") ValueTypeName;
		const char * ValueTypeName();

};


%make_alias(MoniTool_TransientElem)

%extend MoniTool_TransientElem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class MoniTool_HSequenceOfElement : public NCollection_Sequence<opencascade::handle<MoniTool_Element>>, public Standard_Transient {
  public:
    MoniTool_HSequenceOfElement();
    MoniTool_HSequenceOfElement(const NCollection_Sequence<opencascade::handle<MoniTool_Element>>& theOther);
    const NCollection_Sequence<opencascade::handle<MoniTool_Element>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<MoniTool_Element>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<MoniTool_Element>>& theSequence);
    NCollection_Sequence<opencascade::handle<MoniTool_Element>>& ChangeSequence();
};
%make_alias(MoniTool_HSequenceOfElement)


/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def MoniTool_CaseData_DefCheck(*args):
	return MoniTool_CaseData.DefCheck(*args)

@deprecated
def MoniTool_CaseData_DefMsg(*args):
	return MoniTool_CaseData.DefMsg(*args)

@deprecated
def MoniTool_CaseData_SetDefFail(*args):
	return MoniTool_CaseData.SetDefFail(*args)

@deprecated
def MoniTool_CaseData_SetDefMsg(*args):
	return MoniTool_CaseData.SetDefMsg(*args)

@deprecated
def MoniTool_CaseData_SetDefWarning(*args):
	return MoniTool_CaseData.SetDefWarning(*args)

@deprecated
def MoniTool_DataInfo_Type(*args):
	return MoniTool_DataInfo.Type(*args)

@deprecated
def MoniTool_DataInfo_TypeName(*args):
	return MoniTool_DataInfo.TypeName(*args)

@deprecated
def MoniTool_Stat_Current(*args):
	return MoniTool_Stat.Current(*args)

@deprecated
def MoniTool_Timer_ClearTimers(*args):
	return MoniTool_Timer.ClearTimers(*args)

@deprecated
def MoniTool_Timer_ComputeAmendments(*args):
	return MoniTool_Timer.ComputeAmendments(*args)

@deprecated
def MoniTool_Timer_Dictionary(*args):
	return MoniTool_Timer.Dictionary(*args)

@deprecated
def MoniTool_Timer_DumpTimers(*args):
	return MoniTool_Timer.DumpTimers(*args)

@deprecated
def MoniTool_Timer_GetAmendments(*args):
	return MoniTool_Timer.GetAmendments(*args)

@deprecated
def MoniTool_Timer_Start(*args):
	return MoniTool_Timer.Start(*args)

@deprecated
def MoniTool_Timer_Stop(*args):
	return MoniTool_Timer.Stop(*args)

@deprecated
def MoniTool_Timer_Timer(*args):
	return MoniTool_Timer.Timer(*args)

@deprecated
def MoniTool_TypedValue_AddLib(*args):
	return MoniTool_TypedValue.AddLib(*args)

@deprecated
def MoniTool_TypedValue_FromLib(*args):
	return MoniTool_TypedValue.FromLib(*args)

@deprecated
def MoniTool_TypedValue_Lib(*args):
	return MoniTool_TypedValue.Lib(*args)

@deprecated
def MoniTool_TypedValue_LibList(*args):
	return MoniTool_TypedValue.LibList(*args)

@deprecated
def MoniTool_TypedValue_StaticValue(*args):
	return MoniTool_TypedValue.StaticValue(*args)

}
