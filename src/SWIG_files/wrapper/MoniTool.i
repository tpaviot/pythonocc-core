/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_monitool.html"
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
#include<TCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<Message_module.hxx>
#include<OSD_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import TopoDS.i
%import gp.i
%import Message.i
%import OSD.i
%import TColStd.i

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
%wrap_handle(MoniTool_HSequenceOfElement)
/* end handles declaration */

/* templates */
%template(MoniTool_DataMapOfShapeTransient) NCollection_DataMap<TopoDS_Shape,opencascade::handle<Standard_Transient>,TopTools_ShapeMapHasher>;
%template(MoniTool_DataMapOfTimer) NCollection_DataMap<Standard_CString,opencascade::handle<MoniTool_Timer>,Standard_CStringHasher>;
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
typedef Standard_Boolean ( * MoniTool_ValueSatisfies ) ( const opencascade::handle<TCollection_HAsciiString>& val );
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<Standard_Transient>, TopTools_ShapeMapHasher>::Iterator MoniTool_DataMapIteratorOfDataMapOfShapeTransient;
typedef NCollection_DataMap<Standard_CString, opencascade::handle<MoniTool_Timer>, Standard_CStringHasher>::Iterator MoniTool_DataMapIteratorOfDataMapOfTimer;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<Standard_Transient>, TopTools_ShapeMapHasher> MoniTool_DataMapOfShapeTransient;
typedef NCollection_DataMap<Standard_CString, opencascade::handle<MoniTool_Timer>, Standard_CStringHasher> MoniTool_DataMapOfTimer;
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
Creates an attrlist, empty.
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
Creates an attrlist from another one, definitions are shared (calls sameattributes).
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
		/****** md5 signature: e5ad5be0e92752a0fdb049be9d57b2a2 ******/
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns an attribute from its name. null handle if not recorded (whatever transient, integer, real ...) integer is recorded as intval real is recorded as realval text is recorded as hasciistring.
") Attribute;
		opencascade::handle<Standard_Transient> Attribute(Standard_CString name);

		/****** MoniTool_AttrList::AttributeType ******/
		/****** md5 signature: 9014240ef88a98ed31e2ac659ed330bb ******/
		%feature("compactdefaultargs") AttributeType;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
MoniTool_ValueType

Description
-----------
Returns the type of an attribute: valueint , valuereal , valuetext (string) , valueident (any) or valuevoid (not recorded).
") AttributeType;
		MoniTool_ValueType AttributeType(Standard_CString name);

		/****** MoniTool_AttrList::GetAttribute ******/
		/****** md5 signature: 2af91cadcf009781db910ca0a130a005 ******/
		%feature("compactdefaultargs") GetAttribute;
		%feature("autodoc", "
Parameters
----------
name: str
type: Standard_Type
val: Standard_Transient

Return
-------
bool

Description
-----------
Returns an attribute from its name, filtered by a type if no attribute has this name, or if it is not kind of this type, <val> is null and returned value is false else, it is true.
") GetAttribute;
		Standard_Boolean GetAttribute(Standard_CString name, const opencascade::handle<Standard_Type> & type, opencascade::handle<Standard_Transient> & val);

		/****** MoniTool_AttrList::GetAttributes ******/
		/****** md5 signature: 1fc563dcdd495504eda158a1799a2a7d ******/
		%feature("compactdefaultargs") GetAttributes;
		%feature("autodoc", "
Parameters
----------
other: MoniTool_AttrList
fromname: str (optional, default to "")
copied: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Gets the list of attributes from <other>, by copying it by default, considers all the attributes from <other> if <fromname> is given, considers only the attributes with name beginning by <fromname> //! for each attribute, if <copied> is true (d), its value is also copied if it is a basic type (integer,real,string), else it remains shared between <other> and <self> //! these new attributes are added to the existing ones in <self>, in case of same name, they replace the existing ones.
") GetAttributes;
		void GetAttributes(const MoniTool_AttrList & other, Standard_CString fromname = "", const Standard_Boolean copied = Standard_True);

		/****** MoniTool_AttrList::GetIntegerAttribute ******/
		/****** md5 signature: ea2fdae17b02c2aa020d84d6b452688b ******/
		%feature("compactdefaultargs") GetIntegerAttribute;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
val: int

Description
-----------
Returns an attribute from its name, as integer if no attribute has this name, or not an integer, <val> is 0 and returned value is false else, it is true.
") GetIntegerAttribute;
		Standard_Boolean GetIntegerAttribute(Standard_CString name, Standard_Integer &OutValue);

		/****** MoniTool_AttrList::GetRealAttribute ******/
		/****** md5 signature: 5f2c96db8b329d634687ce67f5e59b4b ******/
		%feature("compactdefaultargs") GetRealAttribute;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
val: float

Description
-----------
Returns an attribute from its name, as real if no attribute has this name, or not a real <val> is 0.0 and returned value is false else, it is true.
") GetRealAttribute;
		Standard_Boolean GetRealAttribute(Standard_CString name, Standard_Real &OutValue);

		/****** MoniTool_AttrList::GetStringAttribute ******/
		/****** md5 signature: 318a12b6d26483dacbc14b18a716e743 ******/
		%feature("compactdefaultargs") GetStringAttribute;
		%feature("autodoc", "
Parameters
----------
name: str
val: str

Return
-------
bool

Description
-----------
Returns an attribute from its name, as string if no attribute has this name, or not a string <val> is 0.0 and returned value is false else, it is true.
") GetStringAttribute;
		Standard_Boolean GetStringAttribute(Standard_CString name, Standard_CString val);

		/****** MoniTool_AttrList::IntegerAttribute ******/
		/****** md5 signature: 93d9fbf5febe449e6af99311c8d8ce44 ******/
		%feature("compactdefaultargs") IntegerAttribute;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
int

Description
-----------
Returns an integer attribute from its name. 0 if not recorded.
") IntegerAttribute;
		Standard_Integer IntegerAttribute(Standard_CString name);

		/****** MoniTool_AttrList::RealAttribute ******/
		/****** md5 signature: 58a4e4d83ca92f4eca73ac61ee1fe729 ******/
		%feature("compactdefaultargs") RealAttribute;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
float

Description
-----------
Returns a real attribute from its name. 0.0 if not recorded.
") RealAttribute;
		Standard_Real RealAttribute(Standard_CString name);

		/****** MoniTool_AttrList::RemoveAttribute ******/
		/****** md5 signature: 57071515bfbcf1a2ae1f11ad7d448049 ******/
		%feature("compactdefaultargs") RemoveAttribute;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Removes an attribute returns true when done, false if this attribute did not exist.
") RemoveAttribute;
		Standard_Boolean RemoveAttribute(Standard_CString name);

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
Gets the list of attributes from <other>, as such, i.e. not copied: attributes are shared, any attribute edited, added, or removed in <other> is also in <self> and vice versa the former list of attributes of <self> is dropped.
") SameAttributes;
		void SameAttributes(const MoniTool_AttrList & other);

		/****** MoniTool_AttrList::SetAttribute ******/
		/****** md5 signature: ca59af36cb49e274007a7374b826f6d3 ******/
		%feature("compactdefaultargs") SetAttribute;
		%feature("autodoc", "
Parameters
----------
name: str
val: Standard_Transient

Return
-------
None

Description
-----------
Adds an attribute with a given name (replaces the former one with the same name if already exists).
") SetAttribute;
		void SetAttribute(Standard_CString name, const opencascade::handle<Standard_Transient> & val);

		/****** MoniTool_AttrList::SetIntegerAttribute ******/
		/****** md5 signature: 91bcd8c22467c6503d3124ea1bc29193 ******/
		%feature("compactdefaultargs") SetIntegerAttribute;
		%feature("autodoc", "
Parameters
----------
name: str
val: int

Return
-------
None

Description
-----------
Adds an integer value for an attribute.
") SetIntegerAttribute;
		void SetIntegerAttribute(Standard_CString name, const Standard_Integer val);

		/****** MoniTool_AttrList::SetRealAttribute ******/
		/****** md5 signature: 6336cf08a7edf9acb99611e6933d3024 ******/
		%feature("compactdefaultargs") SetRealAttribute;
		%feature("autodoc", "
Parameters
----------
name: str
val: float

Return
-------
None

Description
-----------
Adds a real value for an attribute.
") SetRealAttribute;
		void SetRealAttribute(Standard_CString name, const Standard_Real val);

		/****** MoniTool_AttrList::SetStringAttribute ******/
		/****** md5 signature: c4470714ba0031d975841ff9a21690ca ******/
		%feature("compactdefaultargs") SetStringAttribute;
		%feature("autodoc", "
Parameters
----------
name: str
val: str

Return
-------
None

Description
-----------
Adds a string value for an attribute.
") SetStringAttribute;
		void SetStringAttribute(Standard_CString name, Standard_CString val);

		/****** MoniTool_AttrList::StringAttribute ******/
		/****** md5 signature: c2ee3863f53a113455cc1e4716e85015 ******/
		%feature("compactdefaultargs") StringAttribute;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
str

Description
-----------
Returns a string attribute from its name. '' if not recorded.
") StringAttribute;
		Standard_CString StringAttribute(Standard_CString name);

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
		/****** md5 signature: 20f6f5cfd624da13c011641b453aa448 ******/
		%feature("compactdefaultargs") MoniTool_CaseData;
		%feature("autodoc", "
Parameters
----------
caseid: str (optional, default to "")
name: str (optional, default to "")

Return
-------
None

Description
-----------
Creates a casedata with a caseid and a name (by default not defined).
") MoniTool_CaseData;
		 MoniTool_CaseData(Standard_CString caseid = "", Standard_CString name = "");

		/****** MoniTool_CaseData::AddAny ******/
		/****** md5 signature: 709a2fd6303bcca56f76fc49d1c53165 ******/
		%feature("compactdefaultargs") AddAny;
		%feature("autodoc", "
Parameters
----------
val: Standard_Transient
name: str (optional, default to "")

Return
-------
None

Description
-----------
Adds a transient, with no more meaning.
") AddAny;
		void AddAny(const opencascade::handle<Standard_Transient> & val, Standard_CString name = "");

		/****** MoniTool_CaseData::AddCPU ******/
		/****** md5 signature: 0b9a5de720b389c1022fbd88ca2aa134 ******/
		%feature("compactdefaultargs") AddCPU;
		%feature("autodoc", "
Parameters
----------
lastCPU: float
curCPU: float (optional, default to 0)
name: str (optional, default to "")

Return
-------
None

Description
-----------
Adds the cpu time between lastcpu and now if <curcpu> is given, the cpu amount is curcpu-lastcpu else it is currently measured cpu - lastcpu lastcpu has been read by call to getcpu see getcpu to get amount, and largecpu to test large amount.
") AddCPU;
		void AddCPU(const Standard_Real lastCPU, const Standard_Real curCPU = 0, Standard_CString name = "");

		/****** MoniTool_CaseData::AddData ******/
		/****** md5 signature: e189fc454edeaa2eda99c8d1942c5eaf ******/
		%feature("compactdefaultargs") AddData;
		%feature("autodoc", "
Parameters
----------
val: Standard_Transient
kind: int
name: str (optional, default to "")

Return
-------
None

Description
-----------
Unitary adding a data; rather internal.
") AddData;
		void AddData(const opencascade::handle<Standard_Transient> & val, const Standard_Integer kind, Standard_CString name = "");

		/****** MoniTool_CaseData::AddEntity ******/
		/****** md5 signature: ef1423904a64872bedc94dbaa33024cd ******/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
name: str (optional, default to "")

Return
-------
None

Description
-----------
Adds a transient, as an entity from an interfacemodel for instance: it will then be printed with the help of a dbpe.
") AddEntity;
		void AddEntity(const opencascade::handle<Standard_Transient> & ent, Standard_CString name = "");

		/****** MoniTool_CaseData::AddGeom ******/
		/****** md5 signature: 395ed39ca7e9dbcb0d96192c9b9b5133 ******/
		%feature("compactdefaultargs") AddGeom;
		%feature("autodoc", "
Parameters
----------
geom: Standard_Transient
name: str (optional, default to "")

Return
-------
None

Description
-----------
Adds a geometric as a transient (curve, surface ...).
") AddGeom;
		void AddGeom(const opencascade::handle<Standard_Transient> & geom, Standard_CString name = "");

		/****** MoniTool_CaseData::AddInteger ******/
		/****** md5 signature: 4ed9fedcaa74eccb711a8d608ab755f4 ******/
		%feature("compactdefaultargs") AddInteger;
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
Adds an integer.
") AddInteger;
		void AddInteger(const Standard_Integer val, Standard_CString name = "");

		/****** MoniTool_CaseData::AddRaised ******/
		/****** md5 signature: 19b75a9ad3f3f5b77c60473ad6eff707 ******/
		%feature("compactdefaultargs") AddRaised;
		%feature("autodoc", "
Parameters
----------
theException: Standard_Failure
name: str (optional, default to "")

Return
-------
None

Description
-----------
Adds the currently caught exception.
") AddRaised;
		void AddRaised(const opencascade::handle<Standard_Failure> & theException, Standard_CString name = "");

		/****** MoniTool_CaseData::AddReal ******/
		/****** md5 signature: 780a7a087ce809d081144c47cf3b4f39 ******/
		%feature("compactdefaultargs") AddReal;
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
Adds a real.
") AddReal;
		void AddReal(const Standard_Real val, Standard_CString name = "");

		/****** MoniTool_CaseData::AddReals ******/
		/****** md5 signature: 9c0acc336ad0a492fbfa5f1fe5fd1687 ******/
		%feature("compactdefaultargs") AddReals;
		%feature("autodoc", "
Parameters
----------
v1: float
v2: float
name: str (optional, default to "")

Return
-------
None

Description
-----------
Adds two reals (for instance, two parameters).
") AddReals;
		void AddReals(const Standard_Real v1, const Standard_Real v2, Standard_CString name = "");

		/****** MoniTool_CaseData::AddShape ******/
		/****** md5 signature: 7e2f031b8d272c8a0b3fa7e20cb62eb5 ******/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "
Parameters
----------
sh: TopoDS_Shape
name: str (optional, default to "")

Return
-------
None

Description
-----------
Adds a shape (recorded as a hshape).
") AddShape;
		void AddShape(const TopoDS_Shape & sh, Standard_CString name = "");

		/****** MoniTool_CaseData::AddText ******/
		/****** md5 signature: a4eaadd4ba4352f6b55cb9c7d2514620 ******/
		%feature("compactdefaultargs") AddText;
		%feature("autodoc", "
Parameters
----------
text: str
name: str (optional, default to "")

Return
-------
None

Description
-----------
Adds a text (as hasciistring).
") AddText;
		void AddText(Standard_CString text, Standard_CString name = "");

		/****** MoniTool_CaseData::AddXY ******/
		/****** md5 signature: b4c2f9d1d8072378fc2125fb0795e979 ******/
		%feature("compactdefaultargs") AddXY;
		%feature("autodoc", "
Parameters
----------
aXY: gp_XY
name: str (optional, default to "")

Return
-------
None

Description
-----------
Adds a xy.
") AddXY;
		void AddXY(const gp_XY & aXY, Standard_CString name = "");

		/****** MoniTool_CaseData::AddXYZ ******/
		/****** md5 signature: 812ae7a37099d4e0579eb148e74e815d ******/
		%feature("compactdefaultargs") AddXYZ;
		%feature("autodoc", "
Parameters
----------
aXYZ: gp_XYZ
name: str (optional, default to "")

Return
-------
None

Description
-----------
Adds a xyz.
") AddXYZ;
		void AddXYZ(const gp_XYZ & aXYZ, Standard_CString name = "");

		/****** MoniTool_CaseData::CaseId ******/
		/****** md5 signature: 00273d8277e031d07a637ab90697c910 ******/
		%feature("compactdefaultargs") CaseId;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the caseid.
") CaseId;
		Standard_CString CaseId();

		/****** MoniTool_CaseData::Data ******/
		/****** md5 signature: f80568a434a1353b089e99d0a8827cee ******/
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
		opencascade::handle<Standard_Transient> Data(const Standard_Integer nd);

		/****** MoniTool_CaseData::DefCheck ******/
		/****** md5 signature: eb4da30abf4fe917c43513e8562de6f1 ******/
		%feature("compactdefaultargs") DefCheck;
		%feature("autodoc", "
Parameters
----------
acode: str

Return
-------
int

Description
-----------
Returns check status for a code: 0 non/info (default), 1 warning, 2 fail //! remark: defcheck is used to set the check status of a casedata when it is attached to a case code, it can be changed later (by setfail, setwarning, resetcheck).
") DefCheck;
		static Standard_Integer DefCheck(Standard_CString acode);

		/****** MoniTool_CaseData::DefMsg ******/
		/****** md5 signature: f3fdd9962e01566774984d3cbbc8b441 ******/
		%feature("compactdefaultargs") DefMsg;
		%feature("autodoc", "
Parameters
----------
casecode: str

Return
-------
str

Description
-----------
Returns the message definition for a case code empty if no message attached.
") DefMsg;
		static Standard_CString DefMsg(Standard_CString casecode);

		/****** MoniTool_CaseData::GetCPU ******/
		/****** md5 signature: 00bbde2fe3bee9e2c2e91eb52554c939 ******/
		%feature("compactdefaultargs") GetCPU;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the current amount of cpu this allows to laterly test and record cpu amount its value has to be given to largecpu and addcpu.
") GetCPU;
		Standard_Real GetCPU();

		/****** MoniTool_CaseData::GetData ******/
		/****** md5 signature: bb9d0e00d5fb999da4e5420db20a8c13 ******/
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
Returns a data item, under control of a type if the data item is kind of this type, it is returned in <val> and the returned value is true else, <val> is unchanged and the returned value is false.
") GetData;
		Standard_Boolean GetData(const Standard_Integer nd, const opencascade::handle<Standard_Type> & type, opencascade::handle<Standard_Transient> & val);

		/****** MoniTool_CaseData::Integer ******/
		/****** md5 signature: d8b799534891244055a897cb27c52560 ******/
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
Returns an integer.
") Integer;
		Standard_Boolean Integer(const Standard_Integer nd, Standard_Integer &OutValue);

		/****** MoniTool_CaseData::IsCheck ******/
		/****** md5 signature: 30349f70e09cdfa743fc34bc26c2fb2b ******/
		%feature("compactdefaultargs") IsCheck;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is check (warning or fail), else it is info.
") IsCheck;
		Standard_Boolean IsCheck();

		/****** MoniTool_CaseData::IsFail ******/
		/****** md5 signature: 524d8ab308e46f0a1f95eddd8baf23a1 ******/
		%feature("compactdefaultargs") IsFail;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is fail.
") IsFail;
		Standard_Boolean IsFail();

		/****** MoniTool_CaseData::IsWarning ******/
		/****** md5 signature: e5e018b76f604f721ac7f5a4f0da1bee ******/
		%feature("compactdefaultargs") IsWarning;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if <self> is warning.
") IsWarning;
		Standard_Boolean IsWarning();

		/****** MoniTool_CaseData::Kind ******/
		/****** md5 signature: 240ee38bbdcd2cdfc62382e178aee32c ******/
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
Returns the kind of a data: kind type meaning 0 any any (not one of the following) 1 ex raised exception 2 en entity 3 g geom 4 sh shape 5 xyz xyz 6 xy or uv xy 7 rr 2 reals 8 r 1 real 9 cpu cpu (1 real) 10 t text 11 i integer //! for namenum, these codes for type must be given exact i.e. sh for a shape, not s nor shape nor solid etc.
") Kind;
		Standard_Integer Kind(const Standard_Integer nd);

		/****** MoniTool_CaseData::LargeCPU ******/
		/****** md5 signature: 71dadf235aade01bedc90b6cdb2897ce ******/
		%feature("compactdefaultargs") LargeCPU;
		%feature("autodoc", "
Parameters
----------
maxCPU: float
lastCPU: float
curCPU: float (optional, default to 0)

Return
-------
bool

Description
-----------
Tells if a cpu time amount is large <maxcpu> gives the amount over which an amount is large <lastcpu> gives the start cpu amount if <curcpu> is given, the tested cpu amount is curcpu-lastcpu else it is currently measured cpu - lastcpu.
") LargeCPU;
		Standard_Boolean LargeCPU(const Standard_Real maxCPU, const Standard_Real lastCPU, const Standard_Real curCPU = 0);

		/****** MoniTool_CaseData::Msg ******/
		/****** md5 signature: 9a65aef83214ce6d33b185aed38c1f0a ******/
		%feature("compactdefaultargs") Msg;
		%feature("autodoc", "Return
-------
Message_Msg

Description
-----------
Returns a msg from a casedata: it is build from defmsg, which gives the message code plus the designation of items of the casedata to be added to the msg empty if no message attached //! remains to be implemented.
") Msg;
		Message_Msg Msg();

		/****** MoniTool_CaseData::Name ******/
		/****** md5 signature: 2e8cb64f99d00deafae9c92f20b187a2 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the name.
") Name;
		Standard_CString Name();

		/****** MoniTool_CaseData::Name ******/
		/****** md5 signature: daa685c923900f80fa41f50d5eeb7f76 ******/
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
Returns the name of a data. if it has no name, the string is empty (length = 0).
") Name;
		const TCollection_AsciiString & Name(const Standard_Integer nd);

		/****** MoniTool_CaseData::NameNum ******/
		/****** md5 signature: 1d3a907e11739d5a6bd945884af12849 ******/
		%feature("compactdefaultargs") NameNum;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
int

Description
-----------
Returns the first suitable data rank for a given name exact matching (exact case, no completion) is required firstly checks the recorded names if not found, considers the name as follows: name = 'type': search for the first item with this type name = 'type:nn': search for the nn.th item with this type see allowed values in method kind.
") NameNum;
		Standard_Integer NameNum(Standard_CString name);

		/****** MoniTool_CaseData::NbData ******/
		/****** md5 signature: 65dffaaee72ce13df8f72ba4f254de29 ******/
		%feature("compactdefaultargs") NbData;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of data recorded to a set.
") NbData;
		Standard_Integer NbData();

		/****** MoniTool_CaseData::Real ******/
		/****** md5 signature: fb3ec93e6fea8b68ac5fb104ba9991ec ******/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "
Parameters
----------
nd: int

Return
-------
val: float

Description
-----------
Returns a real or cpu amount (stored in geom2d_cartesianpoint) (allows an integer converted to a real).
") Real;
		Standard_Boolean Real(const Standard_Integer nd, Standard_Real &OutValue);

		/****** MoniTool_CaseData::Reals ******/
		/****** md5 signature: 6ca87920cf3a61113f864e225ed735c3 ******/
		%feature("compactdefaultargs") Reals;
		%feature("autodoc", "
Parameters
----------
nd: int

Return
-------
v1: float
v2: float

Description
-----------
Returns a couple of reals (stored in geom2d_cartesianpoint).
") Reals;
		Standard_Boolean Reals(const Standard_Integer nd, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** MoniTool_CaseData::RemoveData ******/
		/****** md5 signature: 87f33cf90143f205f9e74295f235a95f ******/
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
Removes a data from its rank. does nothing if out of range.
") RemoveData;
		void RemoveData(const Standard_Integer num);

		/****** MoniTool_CaseData::ResetCheck ******/
		/****** md5 signature: 994db56670d518106b28f0eb1c3ddbaf ******/
		%feature("compactdefaultargs") ResetCheck;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets check status, i.e. sets <self> as info.
") ResetCheck;
		void ResetCheck();

		/****** MoniTool_CaseData::SetCaseId ******/
		/****** md5 signature: 269d9f4f53a76a32a3150406d8f94389 ******/
		%feature("compactdefaultargs") SetCaseId;
		%feature("autodoc", "
Parameters
----------
caseid: str

Return
-------
None

Description
-----------
Sets a caseid.
") SetCaseId;
		void SetCaseId(Standard_CString caseid);

		/****** MoniTool_CaseData::SetChange ******/
		/****** md5 signature: 35020ffdf661ae424b32ec90844aa543 ******/
		%feature("compactdefaultargs") SetChange;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the next add... not to add but to change the data item designated by its name. if next add... is not called with a name, setchange is ignored reset by next add... , whatever <num> is correct or not.
") SetChange;
		void SetChange();

		/****** MoniTool_CaseData::SetDefFail ******/
		/****** md5 signature: c1ff28d91d209519b87fb8d9d0a096c4 ******/
		%feature("compactdefaultargs") SetDefFail;
		%feature("autodoc", "
Parameters
----------
acode: str

Return
-------
None

Description
-----------
Sets a code to give a fail.
") SetDefFail;
		static void SetDefFail(Standard_CString acode);

		/****** MoniTool_CaseData::SetDefMsg ******/
		/****** md5 signature: 129902a2108aea4a762b8e75e5fd239d ******/
		%feature("compactdefaultargs") SetDefMsg;
		%feature("autodoc", "
Parameters
----------
casecode: str
mesdef: str

Return
-------
None

Description
-----------
Attaches a message definition to a case code this definition includes the message code plus designation of items of the casedata to be added to the message (this part not yet implemented).
") SetDefMsg;
		static void SetDefMsg(Standard_CString casecode, Standard_CString mesdef);

		/****** MoniTool_CaseData::SetDefWarning ******/
		/****** md5 signature: fc48374ca5a180ca723d24adab781749 ******/
		%feature("compactdefaultargs") SetDefWarning;
		%feature("autodoc", "
Parameters
----------
acode: str

Return
-------
None

Description
-----------
Sets a code to give a warning.
") SetDefWarning;
		static void SetDefWarning(Standard_CString acode);

		/****** MoniTool_CaseData::SetFail ******/
		/****** md5 signature: 31938ccd35b6a5850873a21884c12ffc ******/
		%feature("compactdefaultargs") SetFail;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets <self> as fail.
") SetFail;
		void SetFail();

		/****** MoniTool_CaseData::SetName ******/
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
Sets a name.
") SetName;
		void SetName(Standard_CString name);

		/****** MoniTool_CaseData::SetReplace ******/
		/****** md5 signature: d05913aa2cce37b4b1cb745952a24764 ******/
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
Sets the next add... not to add but to replace the data item <num>, if <num> is between 1 and nbdata. reset by next add... , whatever <num> is correct or not.
") SetReplace;
		void SetReplace(const Standard_Integer num);

		/****** MoniTool_CaseData::SetWarning ******/
		/****** md5 signature: 58fb56cb90f7ed086699b1ee96d438c0 ******/
		%feature("compactdefaultargs") SetWarning;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets <self> as warning.
") SetWarning;
		void SetWarning();

		/****** MoniTool_CaseData::Shape ******/
		/****** md5 signature: 3e8a6ae743356dd38a2628e8b75a6b9f ******/
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
Returns a data as a shape, null if not a shape.
") Shape;
		TopoDS_Shape Shape(const Standard_Integer nd);

		/****** MoniTool_CaseData::Text ******/
		/****** md5 signature: f1bb927b5da5ede3cefcbeed1efa5328 ******/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "
Parameters
----------
nd: int
text: str

Return
-------
bool

Description
-----------
Returns a text (stored in tcollection_hasciistring).
") Text;
		Standard_Boolean Text(const Standard_Integer nd, Standard_CString text);

		/****** MoniTool_CaseData::XY ******/
		/****** md5 signature: 6265946dc936f94b9ea104fac9e33a84 ******/
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
Returns a data as a xy (i.e. geom2d_cartesianpoint) returns false if not the good type.
") XY;
		Standard_Boolean XY(const Standard_Integer nd, gp_XY & val);

		/****** MoniTool_CaseData::XYZ ******/
		/****** md5 signature: dcfe8b60a571ed54747716041cc1158b ******/
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
Returns a data as a xyz (i.e. geom_cartesianpoint) returns false if not the good type.
") XYZ;
		Standard_Boolean XYZ(const Standard_Integer nd, gp_XYZ & val);

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
Returns the type attached to an object here, the dynamic type of a transient. null type if unknown.
") Type;
		static opencascade::handle<Standard_Type> Type(const opencascade::handle<Standard_Transient> & ent);

		/****** MoniTool_DataInfo::TypeName ******/
		/****** md5 signature: 2ed9999dd09e4008de6273d943a36227 ******/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
str

Description
-----------
Returns type name (string) allows to name type of non-handled objects.
") TypeName;
		static Standard_CString TypeName(const opencascade::handle<Standard_Transient> & ent);

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
Returns (modifiable) the attribute list.
") ChangeAttr;
		MoniTool_AttrList & ChangeAttr();

		/****** MoniTool_Element::Equates ******/
		/****** md5 signature: 1e903a4f175e33c1a9f161e9ea07b5f3 ******/
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
Specific testof equality: to be defined by each sub-class, must be false if elements have not the same true type, else their contents must be compared.
") Equates;
		virtual Standard_Boolean Equates(const opencascade::handle<MoniTool_Element> & other);

		/****** MoniTool_Element::GetHashCode ******/
		/****** md5 signature: 7287addabc58f18bcef75f2c632e90c4 ******/
		%feature("compactdefaultargs") GetHashCode;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Returns the hashcode which has been stored by sethashcode (remark that hashcode could be deferred then be defined by sub-classes, the result is the same).
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
Returns (readonly) the attribute list.
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
Returns the type of the value. by default, returns the dynamictype of <self>, but can be redefined.
") ValueType;
		virtual opencascade::handle<Standard_Type> ValueType();

		/****** MoniTool_Element::ValueTypeName ******/
		/****** md5 signature: 9c551b5e8bde5c3427d2235f8cb0d374 ******/
		%feature("compactdefaultargs") ValueTypeName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the name of the type of the value. default is name of valuetype, unless it is for a non-handled object.
") ValueTypeName;
		virtual Standard_CString ValueTypeName();

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
		/****** md5 signature: 54b1ae511a36927c8a949693d00e10f5 ******/
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
		 MoniTool_IntVal(const Standard_Integer val = 0);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetCValue() {
            return (Standard_Integer) $self->CValue();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetCValue(Standard_Integer value) {
            $self->CValue()=value;
            }
        };
		/****** MoniTool_IntVal::Value ******/
		/****** md5 signature: c6d99989077b92200f0377d8b792ba0b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Value;
		Standard_Integer Value();

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
		/****** md5 signature: 7c169d55add39db3049450bc8d4f35b8 ******/
		%feature("compactdefaultargs") MoniTool_RealVal;
		%feature("autodoc", "
Parameters
----------
val: float (optional, default to 0.0)

Return
-------
None

Description
-----------
No available documentation.
") MoniTool_RealVal;
		 MoniTool_RealVal(const Standard_Real val = 0.0);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetCValue() {
            return (Standard_Real) $self->CValue();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetCValue(Standard_Real value) {
            $self->CValue()=value;
            }
        };
		/****** MoniTool_RealVal::Value ******/
		/****** md5 signature: 52655a2fb6642856b2c68a9331826787 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Value;
		Standard_Real Value();

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
		/****** md5 signature: b2b3faaae1ea976a5c6814bfba5805a2 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns an identification of the signature (a word), given at initialization time.
") Name;
		virtual Standard_CString Name();

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
Gives a text as a signature for a transient object in a context if the context is senseless, it can be given as null handle empty result if nothing to give (at least the dynamictype could be sent ?).
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
Gives a text as a signature for a transient object alone, i.e. without defined context. by default, calls text with undefined context (null handle) and if empty, then returns dynamictype.
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
		/****** md5 signature: e65040f7ebf5fe26b424de8f71d41722 ******/
		%feature("compactdefaultargs") MoniTool_Stat;
		%feature("autodoc", "
Parameters
----------
title: str (optional, default to "")

Return
-------
None

Description
-----------
Creates a stat form. at start, one default phase is defined, with one default step. then, it suffises to start with a count of items (and cycles if several) then record items, to have a queryable report.
") MoniTool_Stat;
		 MoniTool_Stat(Standard_CString title = "");

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
Used when starting.
") MoniTool_Stat;
		 MoniTool_Stat(const MoniTool_Stat & other);

		/****** MoniTool_Stat::Add ******/
		/****** md5 signature: f3fab2c5142a08a50b9a3023611b3ad1 ******/
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
		void Add(const Standard_Integer nb = 1);

		/****** MoniTool_Stat::AddEnd ******/
		/****** md5 signature: 370897480301b628c04a6bd14f86ae0e ******/
		%feature("compactdefaultargs") AddEnd;
		%feature("autodoc", "Return
-------
None

Description
-----------
Ends the addsub and cumulates the sub-count to current level.
") AddEnd;
		void AddEnd();

		/****** MoniTool_Stat::AddSub ******/
		/****** md5 signature: 6c1da3fd60aca6c3db02b8499ea9f372 ******/
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
Declares a count of items to be added later. if a sub-counter is opened, its percentage multiplies this sub-count to compute the percent of current level.
") AddSub;
		void AddSub(const Standard_Integer nb = 1);

		/****** MoniTool_Stat::Close ******/
		/****** md5 signature: 45b7e0c851ec50c4814c2077322ec35a ******/
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
		void Close(const Standard_Integer id);

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
		/****** md5 signature: 06f7279e938b54c0bc4a49915192a536 ******/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Level;
		Standard_Integer Level();

		/****** MoniTool_Stat::Open ******/
		/****** md5 signature: 075d35239e71af92e8dc106f04de7b47 ******/
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
		Standard_Integer Open(const Standard_Integer nb = 100);

		/****** MoniTool_Stat::OpenMore ******/
		/****** md5 signature: fe91d805ae92eca04888425aaa630b89 ******/
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
Adds more items to be counted by add... on current level.
") OpenMore;
		void OpenMore(const Standard_Integer id, const Standard_Integer nb);

		/****** MoniTool_Stat::Percent ******/
		/****** md5 signature: 46bae145f78bddca0f22277606688606 ******/
		%feature("compactdefaultargs") Percent;
		%feature("autodoc", "
Parameters
----------
fromlev: int (optional, default to 0)

Return
-------
float

Description
-----------
No available documentation.
") Percent;
		Standard_Real Percent(const Standard_Integer fromlev = 0);

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
		/****** md5 signature: d9cb93339d1e645446e111d326e3bc45 ******/
		%feature("compactdefaultargs") Amend;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return value of accumulated amendment on cpu time.
") Amend;
		Standard_Real Amend();

		/****** MoniTool_Timer::CPU ******/
		/****** md5 signature: 521db0d485b8797a691f912f6b878d86 ******/
		%feature("compactdefaultargs") CPU;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return value of cpu time minus accumulated amendment.
") CPU;
		Standard_Real CPU();

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
		/****** md5 signature: 991c7b8ad8fee748c77481e1ff97e534 ******/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return value of hits counter (count of start/stop pairs).
") Count;
		Standard_Integer Count();

		/****** MoniTool_Timer::Dictionary ******/
		/****** md5 signature: 3dd9e448982a7f8f1ae68a5ba35de172 ******/
		%feature("compactdefaultargs") Dictionary;
		%feature("autodoc", "Return
-------
MoniTool_DataMapOfTimer

Description
-----------
Returns map of timers.
") Dictionary;
		static MoniTool_DataMapOfTimer & Dictionary();

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
		/****** md5 signature: c2be8078ab69a477345c7d01bfe03646 ******/
		%feature("compactdefaultargs") GetAmendments;
		%feature("autodoc", "
Parameters
----------

Return
-------
Access: float
Internal: float
External: float
Error10: float

Description
-----------
The computed amendmens are returned (for information only).
") GetAmendments;
		static void GetAmendments(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** MoniTool_Timer::IsRunning ******/
		/****** md5 signature: d7c315f198eeb1f77f7fa766917cac35 ******/
		%feature("compactdefaultargs") IsRunning;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns value of nesting counter.
") IsRunning;
		Standard_Integer IsRunning();

		/****** MoniTool_Timer::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Start, stop and reset the timer in addition to doing that to embedded osd_timer, manage also counter of hits.
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
		/****** md5 signature: b833d14b6b19bc40531ad996f753cfaf ******/
		%feature("compactdefaultargs") Start;
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
") Start;
		static void Start(Standard_CString name);

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
		/****** md5 signature: a7e1fcb4a05664a7681ec0b7099dcb2b ******/
		%feature("compactdefaultargs") Stop;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
None

Description
-----------
Inline methods to conveniently start/stop timer by name shortcut to timer(name)->start/stop().
") Stop;
		static void Stop(Standard_CString name);

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
Return reference to embedded osd_timer.
") Timer;
		OSD_Timer & Timer();

		/****** MoniTool_Timer::Timer ******/
		/****** md5 signature: 9237b83a5e4ff7ccc33dbe1781fb7e12 ******/
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<MoniTool_Timer>

Description
-----------
Returns a timer from a dictionary by its name if timer not existed, creates a new one.
") Timer;
		static opencascade::handle<MoniTool_Timer> Timer(Standard_CString name);

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
		/****** md5 signature: 29c99cdb9c92a94de51617e05465c45f ******/
		%feature("compactdefaultargs") MoniTool_TimerSentry;
		%feature("autodoc", "
Parameters
----------
cname: str

Return
-------
None

Description
-----------
Constructor creates an instance and runs the corresponding timer.
") MoniTool_TimerSentry;
		 MoniTool_TimerSentry(Standard_CString cname);

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
		/****** md5 signature: 96d7c03f50b98cd157c360176d941966 ******/
		%feature("compactdefaultargs") MoniTool_TypedValue;
		%feature("autodoc", "
Parameters
----------
name: str
type: MoniTool_ValueType (optional, default to MoniTool_ValueText)
init: str (optional, default to "")

Return
-------
None

Description
-----------
Creates a typedvalue, with a name //! type gives the type of the parameter, default is free text also available: integer, real, enum, entity (i.e. object) more precise specifications, titles, can be given to the typedvalue once created //! init gives an initial value. if it is not given, the typedvalue begins as 'not set', its value is empty.
") MoniTool_TypedValue;
		 MoniTool_TypedValue(Standard_CString name, const MoniTool_ValueType type = MoniTool_ValueText, Standard_CString init = "");

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
Creates a typedvalue from another one, by duplication.
") MoniTool_TypedValue;
		 MoniTool_TypedValue(const opencascade::handle<MoniTool_TypedValue> & other);

		/****** MoniTool_TypedValue::AddDef ******/
		/****** md5 signature: 270379383287ef65ab016bd598c4af1f ******/
		%feature("compactdefaultargs") AddDef;
		%feature("autodoc", "
Parameters
----------
initext: str

Return
-------
bool

Description
-----------
Completes the definition of a typedvalue by command <initext>, once created with its type returns true if done, false if could not be interpreted <initext> may be: imin ival: minimum value for an integer imax ival: maximum value for an integer rmin rval: minimum value for a real rmax rval: maximum value for a real unit name: name of unit ematch i: enum from integer value i, match required enum i: enum from integer value i, match not required eval text: add an enumerative value (increments max by 1) eval: add a non-authorised enum value (to be skipped) tmax l: maximum length for a text.
") AddDef;
		Standard_Boolean AddDef(Standard_CString initext);

		/****** MoniTool_TypedValue::AddEnum ******/
		/****** md5 signature: e6ae955f31fb3a2e2ceeb01f3e9686bd ******/
		%feature("compactdefaultargs") AddEnum;
		%feature("autodoc", "
Parameters
----------
v1: str (optional, default to "")
v2: str (optional, default to "")
v3: str (optional, default to "")
v4: str (optional, default to "")
v5: str (optional, default to "")
v6: str (optional, default to "")
v7: str (optional, default to "")
v8: str (optional, default to "")
v9: str (optional, default to "")
v10: str (optional, default to "")

Return
-------
None

Description
-----------
Adds enumerative definitions. for more than 10, several calls.
") AddEnum;
		void AddEnum(Standard_CString v1 = "", Standard_CString v2 = "", Standard_CString v3 = "", Standard_CString v4 = "", Standard_CString v5 = "", Standard_CString v6 = "", Standard_CString v7 = "", Standard_CString v8 = "", Standard_CString v9 = "", Standard_CString v10 = "");

		/****** MoniTool_TypedValue::AddEnumValue ******/
		/****** md5 signature: dd36fba0a6d141a7dfbf4646a6317bd6 ******/
		%feature("compactdefaultargs") AddEnumValue;
		%feature("autodoc", "
Parameters
----------
val: str
num: int

Return
-------
None

Description
-----------
Adds an enumeration definition, by its string and numeric values. if it is the first setting for this value, it is recorded as main value. else, it is recognized as alternate string for this numeric value.
") AddEnumValue;
		void AddEnumValue(Standard_CString val, const Standard_Integer num);

		/****** MoniTool_TypedValue::AddLib ******/
		/****** md5 signature: c61cc150ba0ebcce137a721917e17662 ******/
		%feature("compactdefaultargs") AddLib;
		%feature("autodoc", "
Parameters
----------
tv: MoniTool_TypedValue
def: str (optional, default to "")

Return
-------
bool

Description
-----------
Adds a typedvalue in the library. it is recorded then will be accessed by its name its definition may be imposed, else it is computed as usual by default it will be accessed by its definition (string) returns true if done, false if tv is null or brings no definition or <def> not defined //! if a typedvalue was already recorded under this name, it is replaced.
") AddLib;
		static Standard_Boolean AddLib(const opencascade::handle<MoniTool_TypedValue> & tv, Standard_CString def = "");

		/****** MoniTool_TypedValue::CStringValue ******/
		/****** md5 signature: e29eae6e0076125e72074e4bd0c76b3a ******/
		%feature("compactdefaultargs") CStringValue;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the value, as a cstring. empty if not set.
") CStringValue;
		Standard_CString CStringValue();

		/****** MoniTool_TypedValue::ClearValue ******/
		/****** md5 signature: 70260fa193dc762fb315c6297127fb7c ******/
		%feature("compactdefaultargs") ClearValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the recorded value: it is now unset.
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
Returns the definition by priority, the enforced one, else an automatic one, computed from the specification.
") Definition;
		TCollection_AsciiString Definition();

		/****** MoniTool_TypedValue::EnumCase ******/
		/****** md5 signature: 62406df61445d184caa1d6ed239fe6a3 ******/
		%feature("compactdefaultargs") EnumCase;
		%feature("autodoc", "
Parameters
----------
val: str

Return
-------
int

Description
-----------
Returns the case number which corresponds to a string value works with main and additional values returns (startenum - 1) if not ok, -1 if not an enum.
") EnumCase;
		Standard_Integer EnumCase(Standard_CString val);

		/****** MoniTool_TypedValue::EnumDef ******/
		/****** md5 signature: 980792930a6ea3fdf361dc3b1c7d441d ******/
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
Gives the enum definitions: start value, end value, match status. returns true for an enum, false else.
") EnumDef;
		Standard_Boolean EnumDef(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Boolean &OutValue);

		/****** MoniTool_TypedValue::EnumVal ******/
		/****** md5 signature: 354eb473aa3cf0e0681ce7fc2799fa01 ******/
		%feature("compactdefaultargs") EnumVal;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
str

Description
-----------
Returns the value of an enumerative definition, from its rank empty string if out of range or not an enum.
") EnumVal;
		Standard_CString EnumVal(const Standard_Integer num);

		/****** MoniTool_TypedValue::FromLib ******/
		/****** md5 signature: fa43a04fa4b4ae98ce69c9be25395f2a ******/
		%feature("compactdefaultargs") FromLib;
		%feature("autodoc", "
Parameters
----------
def: str

Return
-------
opencascade::handle<MoniTool_TypedValue>

Description
-----------
Returns a copy of the typedvalue bound with a given name null handle if none recorded.
") FromLib;
		static opencascade::handle<MoniTool_TypedValue> FromLib(Standard_CString def);

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
Same as objectvalue, but avoids downcast: the receiving variable is directly loaded. it is assumed that it complies with the definition of objecttype ! otherwise, big trouble.
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
Returns the value, as a handle (can then be shared) null if not defined.
") HStringValue;
		opencascade::handle<TCollection_HAsciiString> HStringValue();

		/****** MoniTool_TypedValue::HasInterpret ******/
		/****** md5 signature: 6f629b352f0708b49269300b1a9f380d ******/
		%feature("compactdefaultargs") HasInterpret;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if a typedvalue has an interpret.
") HasInterpret;
		virtual Standard_Boolean HasInterpret();

		/****** MoniTool_TypedValue::IntegerLimit ******/
		/****** md5 signature: 92d178c29627fe6bb9dd5904f4dda9a8 ******/
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
Gives an integer limit (upper if <max> true, lower if <max> false). returns true if this limit is defined, false else (in that case, gives the natural limit for integer).
") IntegerLimit;
		Standard_Boolean IntegerLimit(const Standard_Boolean max, Standard_Integer &OutValue);

		/****** MoniTool_TypedValue::IntegerValue ******/
		/****** md5 signature: a75e1a4c2632a55658f0262c4c2f22c2 ******/
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value as integer, i.e.: for type = integer, the integer itself; 0 if not set for type = enum, the designated rank (see enum definition) startenum - 1 if not set or not in the definition else, returns 0.
") IntegerValue;
		Standard_Integer IntegerValue();

		/****** MoniTool_TypedValue::Internals ******/
		/****** md5 signature: 531d20a03e534a771a01b2421460e428 ******/
		%feature("compactdefaultargs") Internals;
		%feature("autodoc", "
Parameters
----------
interp: MoniTool_ValueInterpret
satisf: MoniTool_ValueSatisfies
satisname: str
enums: NCollection_DataMap<TCollection_AsciiString, int>

Return
-------
None

Description
-----------
Access to internal data which have no other access.
") Internals;
		void Internals(MoniTool_ValueInterpret & interp, MoniTool_ValueSatisfies & satisf, Standard_CString satisname, NCollection_DataMap<TCollection_AsciiString, Standard_Integer> & enums);

		/****** MoniTool_TypedValue::Interpret ******/
		/****** md5 signature: 9c6153888caed409cc74bdcaede46f12 ******/
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
Interprets a value. <native> true: returns a native value <native> false: returns a coded value if the interpret function is set, calls it else, for an enum, native returns the text, coded returns the number standard returns: = hval means no specific interpretation null means senseless can also be redefined.
") Interpret;
		virtual opencascade::handle<TCollection_HAsciiString> Interpret(const opencascade::handle<TCollection_HAsciiString> & hval, const Standard_Boolean native);

		/****** MoniTool_TypedValue::IsSetValue ******/
		/****** md5 signature: b7211cd65ed84bfd998fea019061883d ******/
		%feature("compactdefaultargs") IsSetValue;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the value is set (not empty/not null object).
") IsSetValue;
		Standard_Boolean IsSetValue();

		/****** MoniTool_TypedValue::Label ******/
		/****** md5 signature: a2cdaa2c189e4a121892e76566961d64 ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the label, if set; else returns an empty string.
") Label;
		Standard_CString Label();

		/****** MoniTool_TypedValue::Lib ******/
		/****** md5 signature: a5d90c5d20ec2688667bfa72e7671bb5 ******/
		%feature("compactdefaultargs") Lib;
		%feature("autodoc", "
Parameters
----------
def: str

Return
-------
opencascade::handle<MoniTool_TypedValue>

Description
-----------
Returns the typedvalue bound with a given name null handle if none recorded warning: it is the original, not duplicated.
") Lib;
		static opencascade::handle<MoniTool_TypedValue> Lib(Standard_CString def);

		/****** MoniTool_TypedValue::LibList ******/
		/****** md5 signature: 0d836a3a9b5bd600e3f329f3412de2d0 ******/
		%feature("compactdefaultargs") LibList;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfAsciiString>

Description
-----------
Returns the list of names of items of the library of types -- library of typedvalue as valued parameters, -- -- accessed by parameter name for use by management of static parameters.
") LibList;
		static opencascade::handle<TColStd_HSequenceOfAsciiString> LibList();

		/****** MoniTool_TypedValue::MaxLength ******/
		/****** md5 signature: 81402d983184c310a40be9c5c0534e33 ******/
		%feature("compactdefaultargs") MaxLength;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum length, 0 if not set.
") MaxLength;
		Standard_Integer MaxLength();

		/****** MoniTool_TypedValue::Name ******/
		/****** md5 signature: 2e8cb64f99d00deafae9c92f20b187a2 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the name.
") Name;
		Standard_CString Name();

		/****** MoniTool_TypedValue::ObjectType ******/
		/****** md5 signature: 6320624908ef64342bea6f08a015e066 ******/
		%feature("compactdefaultargs") ObjectType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the type of which an object typedvalue must be kind of default is standard_transient null for a typedvalue not an object.
") ObjectType;
		opencascade::handle<Standard_Type> ObjectType();

		/****** MoniTool_TypedValue::ObjectTypeName ******/
		/****** md5 signature: 117bb5ca131230a9a7bb5829d6593e5b ******/
		%feature("compactdefaultargs") ObjectTypeName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the type name of the objectvalue, or an empty string if not set.
") ObjectTypeName;
		Standard_CString ObjectTypeName();

		/****** MoniTool_TypedValue::ObjectValue ******/
		/****** md5 signature: bd801152e11f117b295705342aad54e1 ******/
		%feature("compactdefaultargs") ObjectValue;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the value as transient object, only for object/entity remark that the 'hstring value' is ignored here null if not set; remains to be casted.
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
Prints only the value.
") PrintValue;
		void PrintValue(std::ostream &OutValue);

		/****** MoniTool_TypedValue::RealLimit ******/
		/****** md5 signature: 89c72e2e3893a95f4283fcadf76436b4 ******/
		%feature("compactdefaultargs") RealLimit;
		%feature("autodoc", "
Parameters
----------
max: bool

Return
-------
val: float

Description
-----------
Gives an real limit (upper if <max> true, lower if <max> false). returns true if this limit is defined, false else (in that case, gives the natural limit for real).
") RealLimit;
		Standard_Boolean RealLimit(const Standard_Boolean max, Standard_Real &OutValue);

		/****** MoniTool_TypedValue::RealValue ******/
		/****** md5 signature: 8a0c7a2ab7b53f6fb68a06ec0dbc6aa7 ******/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value as real, for a real type typedvalue else, returns 0.
") RealValue;
		Standard_Real RealValue();

		/****** MoniTool_TypedValue::Satisfies ******/
		/****** md5 signature: 2c6f554b64a4a7ef444a4ba67da8e1ad ******/
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
Returns true if a value statifies the specification (remark: does not apply to entity: see objecttype, for this type, the string is just a comment).
") Satisfies;
		virtual Standard_Boolean Satisfies(const opencascade::handle<TCollection_HAsciiString> & hval);

		/****** MoniTool_TypedValue::SatisfiesName ******/
		/****** md5 signature: 4e18cf6cac58b1fda6a5a8dca1a18323 ******/
		%feature("compactdefaultargs") SatisfiesName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns name of specific satisfy, empty string if none.
") SatisfiesName;
		Standard_CString SatisfiesName();

		/****** MoniTool_TypedValue::SetCStringValue ******/
		/****** md5 signature: effa6c9216f0b492b4c2e518069e1a90 ******/
		%feature("compactdefaultargs") SetCStringValue;
		%feature("autodoc", "
Parameters
----------
val: str

Return
-------
bool

Description
-----------
Changes the value. the new one must satisfy the specification returns false (and did not set) if the new value does not satisfy the specification can be redefined to be managed (in a subclass).
") SetCStringValue;
		virtual Standard_Boolean SetCStringValue(Standard_CString val);

		/****** MoniTool_TypedValue::SetDefinition ******/
		/****** md5 signature: d99e23b341c7f1e3f198dd0f04a36d84 ******/
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "
Parameters
----------
deftext: str

Return
-------
None

Description
-----------
Enforces a definition.
") SetDefinition;
		void SetDefinition(Standard_CString deftext);

		/****** MoniTool_TypedValue::SetHStringValue ******/
		/****** md5 signature: de7c62babaa97912ec98c71879a0d8a9 ******/
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
Forces a new handle for the value it can be empty, else (if type is not free text), it must satisfy the specification. not only the value is changed, but also the way it is shared remark: for type=object, this value is not controlled, it can be set as a comment returns false (and did not set) if the new value does not satisfy the specification can be redefined to be managed (in a subclass).
") SetHStringValue;
		virtual Standard_Boolean SetHStringValue(const opencascade::handle<TCollection_HAsciiString> & hval);

		/****** MoniTool_TypedValue::SetIntegerLimit ******/
		/****** md5 signature: c2135aef222b83c75b2ed3cef848b174 ******/
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
Sets an integer limit (included) to <val>, the upper limit if <max> is true, the lower limit if <max> is false.
") SetIntegerLimit;
		void SetIntegerLimit(const Standard_Boolean max, const Standard_Integer val);

		/****** MoniTool_TypedValue::SetIntegerValue ******/
		/****** md5 signature: a4e5fb94cb4abcf21a5f124e8a222979 ******/
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
Changes the value as an integer, only for integer or enum.
") SetIntegerValue;
		virtual Standard_Boolean SetIntegerValue(const Standard_Integer ival);

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
Sets a specific interpret function.
") SetInterpret;
		void SetInterpret(const MoniTool_ValueInterpret func);

		/****** MoniTool_TypedValue::SetLabel ******/
		/****** md5 signature: 22a615cc38955b7431d4e25423d6e156 ******/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "
Parameters
----------
label: str

Return
-------
None

Description
-----------
Sets a label, which can then be displayed.
") SetLabel;
		void SetLabel(Standard_CString label);

		/****** MoniTool_TypedValue::SetMaxLength ******/
		/****** md5 signature: 056e107e4772026e4004710b692c8026 ******/
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
		void SetMaxLength(const Standard_Integer max);

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
Sets type of which an object typedvalue must be kind of error for a typedvalue not an object (entity).
") SetObjectType;
		void SetObjectType(const opencascade::handle<Standard_Type> & typ);

		/****** MoniTool_TypedValue::SetObjectValue ******/
		/****** md5 signature: ce0b84345af23fb6eaecb39ca8367f29 ******/
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
Changes the value as transient object, only for object/entity returns false if dynamictype does not satisfy objecttype can be redefined to be managed (in a subclass).
") SetObjectValue;
		virtual Standard_Boolean SetObjectValue(const opencascade::handle<Standard_Transient> & obj);

		/****** MoniTool_TypedValue::SetRealLimit ******/
		/****** md5 signature: 2c07a42f1fdf96a4266d8c2e6b12deaa ******/
		%feature("compactdefaultargs") SetRealLimit;
		%feature("autodoc", "
Parameters
----------
max: bool
val: float

Return
-------
None

Description
-----------
Sets a real limit (included) to <val>, the upper limit if <max> is true, the lower limit if <max> is false.
") SetRealLimit;
		void SetRealLimit(const Standard_Boolean max, const Standard_Real val);

		/****** MoniTool_TypedValue::SetRealValue ******/
		/****** md5 signature: 52ebdd0f8213ad1ba5a5b91643f643ec ******/
		%feature("compactdefaultargs") SetRealValue;
		%feature("autodoc", "
Parameters
----------
rval: float

Return
-------
bool

Description
-----------
Changes the value as a real, only for real.
") SetRealValue;
		virtual Standard_Boolean SetRealValue(const Standard_Real rval);

		/****** MoniTool_TypedValue::SetSatisfies ******/
		/****** md5 signature: 10cbef7ca241ca4eed214bb6602da3f0 ******/
		%feature("compactdefaultargs") SetSatisfies;
		%feature("autodoc", "
Parameters
----------
func: MoniTool_ValueSatisfies
name: str

Return
-------
None

Description
-----------
Sets a specific satisfies function: it is added to the already defined criteria it must match the form: satisfies (val: hasciistring) returns boolean.
") SetSatisfies;
		void SetSatisfies(const MoniTool_ValueSatisfies func, Standard_CString name);

		/****** MoniTool_TypedValue::SetUnitDef ******/
		/****** md5 signature: 30b7503e4ee844870c530c56053721a7 ******/
		%feature("compactdefaultargs") SetUnitDef;
		%feature("autodoc", "
Parameters
----------
def: str

Return
-------
None

Description
-----------
Sets (clears if <def> empty) a unit definition, as an equation of dimensions. typedvalue just records this definition, does not exploit it, to be done as required by user applications.
") SetUnitDef;
		void SetUnitDef(Standard_CString def);

		/****** MoniTool_TypedValue::StartEnum ******/
		/****** md5 signature: 0ae13a6123edbd6996b53e248a55a112 ******/
		%feature("compactdefaultargs") StartEnum;
		%feature("autodoc", "
Parameters
----------
start: int (optional, default to 0)
match: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
For an enumeration, precises the starting value (default 0) and the match condition: if true (d), the string value must match the definition, else it may take another value: in that case, the integer value will be start - 1. (empty value remains allowed).
") StartEnum;
		void StartEnum(const Standard_Integer start = 0, const Standard_Boolean match = Standard_True);

		/****** MoniTool_TypedValue::StaticValue ******/
		/****** md5 signature: bf5bcf8a5edc5bdc063e75ea7956dd93 ******/
		%feature("compactdefaultargs") StaticValue;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<MoniTool_TypedValue>

Description
-----------
Returns a static value from its name, null if unknown.
") StaticValue;
		static opencascade::handle<MoniTool_TypedValue> StaticValue(Standard_CString name);

		/****** MoniTool_TypedValue::UnitDef ******/
		/****** md5 signature: 61b7bdf19530e233fa3664a070cf6b90 ******/
		%feature("compactdefaultargs") UnitDef;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the recorded unit definition, empty if not set.
") UnitDef;
		Standard_CString UnitDef();

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
		/****** md5 signature: f35e373630f40191cc40cd61094fa98a ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns 'shape'.
") Name;
		Standard_CString Name();

		/****** MoniTool_SignShape::Text ******/
		/****** md5 signature: 44c44c56f0e9da4d892db26a3852e369 ******/
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
Returns for a hshape, the string of its shapeenum the model is absolutely useless (may be null).
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
Creates a transientelem with a value. this value can then not be changed. it is used by the hasher to compute the hashcode, which will then be stored for an immediate reading.
") MoniTool_TransientElem;
		 MoniTool_TransientElem(const opencascade::handle<Standard_Transient> & akey);

		/****** MoniTool_TransientElem::Equates ******/
		/****** md5 signature: 37e72bdf003bc234f02a6795d9820def ******/
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
Specific testof equality: defined as false if <other> has not the same true type, else contents are compared (by c++ operator ==).
") Equates;
		Standard_Boolean Equates(const opencascade::handle<MoniTool_Element> & other);

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
		/****** md5 signature: 40aa6e907b5cbe34817c19e20e6dde6e ******/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the type of the value. by default, returns the dynamictype of <self>, but can be redefined.
") ValueType;
		virtual opencascade::handle<Standard_Type> ValueType();

		/****** MoniTool_TransientElem::ValueTypeName ******/
		/****** md5 signature: d49d824d6a98cbb182d37bee73d4be07 ******/
		%feature("compactdefaultargs") ValueTypeName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the name of the type of the value. default is name of valuetype, unless it is for a non-handled object.
") ValueTypeName;
		virtual Standard_CString ValueTypeName();

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
class MoniTool_HSequenceOfElement : public MoniTool_SequenceOfElement, public Standard_Transient {
  public:
    MoniTool_HSequenceOfElement();
    MoniTool_HSequenceOfElement(const MoniTool_SequenceOfElement& theOther);
    const MoniTool_SequenceOfElement& Sequence();
    void Append (const MoniTool_SequenceOfElement::value_type& theItem);
    void Append (MoniTool_SequenceOfElement& theSequence);
    MoniTool_SequenceOfElement& ChangeSequence();
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
