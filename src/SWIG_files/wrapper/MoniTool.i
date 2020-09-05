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
%define MONITOOLDOCSTRING
"MoniTool module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_monitool.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
%template(MoniTool_DataMapOfTimer) NCollection_DataMap<Standard_CString,opencascade::handle<MoniTool_Timer>,MoniTool_MTHasher>;
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
typedef NCollection_DataMap<Standard_CString, opencascade::handle<MoniTool_Timer>, MoniTool_MTHasher>::Iterator MoniTool_DataMapIteratorOfDataMapOfTimer;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<Standard_Transient>, TopTools_ShapeMapHasher> MoniTool_DataMapOfShapeTransient;
typedef NCollection_DataMap<Standard_CString, opencascade::handle<MoniTool_Timer>, MoniTool_MTHasher> MoniTool_DataMapOfTimer;
typedef NCollection_IndexedDataMap<TopoDS_Shape, opencascade::handle<Standard_Transient>, TopTools_ShapeMapHasher> MoniTool_IndexedDataMapOfShapeTransient;
typedef NCollection_Sequence<opencascade::handle<MoniTool_Element>> MoniTool_SequenceOfElement;
/* end typedefs declaration */

/**************************
* class MoniTool_AttrList *
**************************/
class MoniTool_AttrList {
	public:
		/****************** MoniTool_AttrList ******************/
		/**** md5 signature: f7316938355278c0258f18df32d45c4b ****/
		%feature("compactdefaultargs") MoniTool_AttrList;
		%feature("autodoc", "Creates an attrlist, empty.

Returns
-------
None
") MoniTool_AttrList;
		 MoniTool_AttrList();

		/****************** MoniTool_AttrList ******************/
		/**** md5 signature: 1f622e0139ab42ddb11cef0b29c0e0bc ****/
		%feature("compactdefaultargs") MoniTool_AttrList;
		%feature("autodoc", "Creates an attrlist from another one, definitions are shared (calls sameattributes).

Parameters
----------
other: MoniTool_AttrList

Returns
-------
None
") MoniTool_AttrList;
		 MoniTool_AttrList(const MoniTool_AttrList & other);

		/****************** AttrList ******************/
		/**** md5 signature: 7e1fb43f6aa6b3324760286668f16a94 ****/
		%feature("compactdefaultargs") AttrList;
		%feature("autodoc", "Returns the exhaustive list of attributes.

Returns
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>
") AttrList;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & AttrList();

		/****************** Attribute ******************/
		/**** md5 signature: e5ad5be0e92752a0fdb049be9d57b2a2 ****/
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "Returns an attribute from its name. null handle if not recorded (whatever transient, integer, real ...) integer is recorded as intval real is recorded as realval text is recorded as hasciistring.

Parameters
----------
name: char *

Returns
-------
opencascade::handle<Standard_Transient>
") Attribute;
		opencascade::handle<Standard_Transient> Attribute(const char * name);

		/****************** AttributeType ******************/
		/**** md5 signature: 9014240ef88a98ed31e2ac659ed330bb ****/
		%feature("compactdefaultargs") AttributeType;
		%feature("autodoc", "Returns the type of an attribute : valueint , valuereal , valuetext (string) , valueident (any) or valuevoid (not recorded).

Parameters
----------
name: char *

Returns
-------
MoniTool_ValueType
") AttributeType;
		MoniTool_ValueType AttributeType(const char * name);

		/****************** GetAttribute ******************/
		/**** md5 signature: 2af91cadcf009781db910ca0a130a005 ****/
		%feature("compactdefaultargs") GetAttribute;
		%feature("autodoc", "Returns an attribute from its name, filtered by a type if no attribute has this name, or if it is not kind of this type, <val> is null and returned value is false else, it is true.

Parameters
----------
name: char *
type: Standard_Type
val: Standard_Transient

Returns
-------
bool
") GetAttribute;
		Standard_Boolean GetAttribute(const char * name, const opencascade::handle<Standard_Type> & type, opencascade::handle<Standard_Transient> & val);

		/****************** GetAttributes ******************/
		/**** md5 signature: 1fc563dcdd495504eda158a1799a2a7d ****/
		%feature("compactdefaultargs") GetAttributes;
		%feature("autodoc", "Gets the list of attributes from <other>, by copying it by default, considers all the attributes from <other> if <fromname> is given, considers only the attributes with name beginning by <fromname> //! for each attribute, if <copied> is true (d), its value is also copied if it is a basic type (integer,real,string), else it remains shared between <other> and <self> //! these new attributes are added to the existing ones in <self>, in case of same name, they replace the existing ones.

Parameters
----------
other: MoniTool_AttrList
fromname: char *,optional
	default value is ""
copied: bool,optional
	default value is Standard_True

Returns
-------
None
") GetAttributes;
		void GetAttributes(const MoniTool_AttrList & other, const char * fromname = "", const Standard_Boolean copied = Standard_True);

		/****************** GetIntegerAttribute ******************/
		/**** md5 signature: ea2fdae17b02c2aa020d84d6b452688b ****/
		%feature("compactdefaultargs") GetIntegerAttribute;
		%feature("autodoc", "Returns an attribute from its name, as integer if no attribute has this name, or not an integer, <val> is 0 and returned value is false else, it is true.

Parameters
----------
name: char *

Returns
-------
val: int
") GetIntegerAttribute;
		Standard_Boolean GetIntegerAttribute(const char * name, Standard_Integer &OutValue);

		/****************** GetRealAttribute ******************/
		/**** md5 signature: 5f2c96db8b329d634687ce67f5e59b4b ****/
		%feature("compactdefaultargs") GetRealAttribute;
		%feature("autodoc", "Returns an attribute from its name, as real if no attribute has this name, or not a real <val> is 0.0 and returned value is false else, it is true.

Parameters
----------
name: char *

Returns
-------
val: float
") GetRealAttribute;
		Standard_Boolean GetRealAttribute(const char * name, Standard_Real &OutValue);

		/****************** GetStringAttribute ******************/
		/**** md5 signature: 318a12b6d26483dacbc14b18a716e743 ****/
		%feature("compactdefaultargs") GetStringAttribute;
		%feature("autodoc", "Returns an attribute from its name, as string if no attribute has this name, or not a string <val> is 0.0 and returned value is false else, it is true.

Parameters
----------
name: char *
val: char *

Returns
-------
bool
") GetStringAttribute;
		Standard_Boolean GetStringAttribute(const char * name, const char * & val);

		/****************** IntegerAttribute ******************/
		/**** md5 signature: 93d9fbf5febe449e6af99311c8d8ce44 ****/
		%feature("compactdefaultargs") IntegerAttribute;
		%feature("autodoc", "Returns an integer attribute from its name. 0 if not recorded.

Parameters
----------
name: char *

Returns
-------
int
") IntegerAttribute;
		Standard_Integer IntegerAttribute(const char * name);

		/****************** RealAttribute ******************/
		/**** md5 signature: 58a4e4d83ca92f4eca73ac61ee1fe729 ****/
		%feature("compactdefaultargs") RealAttribute;
		%feature("autodoc", "Returns a real attribute from its name. 0.0 if not recorded.

Parameters
----------
name: char *

Returns
-------
float
") RealAttribute;
		Standard_Real RealAttribute(const char * name);

		/****************** RemoveAttribute ******************/
		/**** md5 signature: 57071515bfbcf1a2ae1f11ad7d448049 ****/
		%feature("compactdefaultargs") RemoveAttribute;
		%feature("autodoc", "Removes an attribute returns true when done, false if this attribute did not exist.

Parameters
----------
name: char *

Returns
-------
bool
") RemoveAttribute;
		Standard_Boolean RemoveAttribute(const char * name);

		/****************** SameAttributes ******************/
		/**** md5 signature: 547f034f219ce85d3fb7576a461a7e64 ****/
		%feature("compactdefaultargs") SameAttributes;
		%feature("autodoc", "Gets the list of attributes from <other>, as such, i.e. not copied : attributes are shared, any attribute edited, added, or removed in <other> is also in <self> and vice versa the former list of attributes of <self> is dropped.

Parameters
----------
other: MoniTool_AttrList

Returns
-------
None
") SameAttributes;
		void SameAttributes(const MoniTool_AttrList & other);

		/****************** SetAttribute ******************/
		/**** md5 signature: ca59af36cb49e274007a7374b826f6d3 ****/
		%feature("compactdefaultargs") SetAttribute;
		%feature("autodoc", "Adds an attribute with a given name (replaces the former one with the same name if already exists).

Parameters
----------
name: char *
val: Standard_Transient

Returns
-------
None
") SetAttribute;
		void SetAttribute(const char * name, const opencascade::handle<Standard_Transient> & val);

		/****************** SetIntegerAttribute ******************/
		/**** md5 signature: 91bcd8c22467c6503d3124ea1bc29193 ****/
		%feature("compactdefaultargs") SetIntegerAttribute;
		%feature("autodoc", "Adds an integer value for an attribute.

Parameters
----------
name: char *
val: int

Returns
-------
None
") SetIntegerAttribute;
		void SetIntegerAttribute(const char * name, const Standard_Integer val);

		/****************** SetRealAttribute ******************/
		/**** md5 signature: 6336cf08a7edf9acb99611e6933d3024 ****/
		%feature("compactdefaultargs") SetRealAttribute;
		%feature("autodoc", "Adds a real value for an attribute.

Parameters
----------
name: char *
val: float

Returns
-------
None
") SetRealAttribute;
		void SetRealAttribute(const char * name, const Standard_Real val);

		/****************** SetStringAttribute ******************/
		/**** md5 signature: c4470714ba0031d975841ff9a21690ca ****/
		%feature("compactdefaultargs") SetStringAttribute;
		%feature("autodoc", "Adds a string value for an attribute.

Parameters
----------
name: char *
val: char *

Returns
-------
None
") SetStringAttribute;
		void SetStringAttribute(const char * name, const char * val);

		/****************** StringAttribute ******************/
		/**** md5 signature: c2ee3863f53a113455cc1e4716e85015 ****/
		%feature("compactdefaultargs") StringAttribute;
		%feature("autodoc", "Returns a string attribute from its name. '' if not recorded.

Parameters
----------
name: char *

Returns
-------
char *
") StringAttribute;
		const char * StringAttribute(const char * name);

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
		/****************** MoniTool_CaseData ******************/
		/**** md5 signature: 20f6f5cfd624da13c011641b453aa448 ****/
		%feature("compactdefaultargs") MoniTool_CaseData;
		%feature("autodoc", "Creates a casedata with a caseid and a name (by default not defined).

Parameters
----------
caseid: char *,optional
	default value is ""
name: char *,optional
	default value is ""

Returns
-------
None
") MoniTool_CaseData;
		 MoniTool_CaseData(const char * caseid = "", const char * name = "");

		/****************** AddAny ******************/
		/**** md5 signature: 709a2fd6303bcca56f76fc49d1c53165 ****/
		%feature("compactdefaultargs") AddAny;
		%feature("autodoc", "Adds a transient, with no more meaning.

Parameters
----------
val: Standard_Transient
name: char *,optional
	default value is ""

Returns
-------
None
") AddAny;
		void AddAny(const opencascade::handle<Standard_Transient> & val, const char * name = "");

		/****************** AddCPU ******************/
		/**** md5 signature: 0b9a5de720b389c1022fbd88ca2aa134 ****/
		%feature("compactdefaultargs") AddCPU;
		%feature("autodoc", "Adds the cpu time between lastcpu and now if <curcpu> is given, the cpu amount is curcpu-lastcpu else it is currently measured cpu - lastcpu lastcpu has been read by call to getcpu see getcpu to get amount, and largecpu to test large amount.

Parameters
----------
lastCPU: float
curCPU: float,optional
	default value is 0
name: char *,optional
	default value is ""

Returns
-------
None
") AddCPU;
		void AddCPU(const Standard_Real lastCPU, const Standard_Real curCPU = 0, const char * name = "");

		/****************** AddData ******************/
		/**** md5 signature: e189fc454edeaa2eda99c8d1942c5eaf ****/
		%feature("compactdefaultargs") AddData;
		%feature("autodoc", "Unitary adding a data; rather internal.

Parameters
----------
val: Standard_Transient
kind: int
name: char *,optional
	default value is ""

Returns
-------
None
") AddData;
		void AddData(const opencascade::handle<Standard_Transient> & val, const Standard_Integer kind, const char * name = "");

		/****************** AddEntity ******************/
		/**** md5 signature: ef1423904a64872bedc94dbaa33024cd ****/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "Adds a transient, as an entity from an interfacemodel for instance : it will then be printed with the help of a dbpe.

Parameters
----------
ent: Standard_Transient
name: char *,optional
	default value is ""

Returns
-------
None
") AddEntity;
		void AddEntity(const opencascade::handle<Standard_Transient> & ent, const char * name = "");

		/****************** AddGeom ******************/
		/**** md5 signature: 395ed39ca7e9dbcb0d96192c9b9b5133 ****/
		%feature("compactdefaultargs") AddGeom;
		%feature("autodoc", "Adds a geometric as a transient (curve, surface ...).

Parameters
----------
geom: Standard_Transient
name: char *,optional
	default value is ""

Returns
-------
None
") AddGeom;
		void AddGeom(const opencascade::handle<Standard_Transient> & geom, const char * name = "");

		/****************** AddInteger ******************/
		/**** md5 signature: 4ed9fedcaa74eccb711a8d608ab755f4 ****/
		%feature("compactdefaultargs") AddInteger;
		%feature("autodoc", "Adds an integer.

Parameters
----------
val: int
name: char *,optional
	default value is ""

Returns
-------
None
") AddInteger;
		void AddInteger(const Standard_Integer val, const char * name = "");

		/****************** AddRaised ******************/
		/**** md5 signature: 19b75a9ad3f3f5b77c60473ad6eff707 ****/
		%feature("compactdefaultargs") AddRaised;
		%feature("autodoc", "Adds the currently caught exception.

Parameters
----------
theException: Standard_Failure
name: char *,optional
	default value is ""

Returns
-------
None
") AddRaised;
		void AddRaised(const opencascade::handle<Standard_Failure> & theException, const char * name = "");

		/****************** AddReal ******************/
		/**** md5 signature: 780a7a087ce809d081144c47cf3b4f39 ****/
		%feature("compactdefaultargs") AddReal;
		%feature("autodoc", "Adds a real.

Parameters
----------
val: float
name: char *,optional
	default value is ""

Returns
-------
None
") AddReal;
		void AddReal(const Standard_Real val, const char * name = "");

		/****************** AddReals ******************/
		/**** md5 signature: 9c0acc336ad0a492fbfa5f1fe5fd1687 ****/
		%feature("compactdefaultargs") AddReals;
		%feature("autodoc", "Adds two reals (for instance, two parameters).

Parameters
----------
v1: float
v2: float
name: char *,optional
	default value is ""

Returns
-------
None
") AddReals;
		void AddReals(const Standard_Real v1, const Standard_Real v2, const char * name = "");

		/****************** AddShape ******************/
		/**** md5 signature: 7e2f031b8d272c8a0b3fa7e20cb62eb5 ****/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "Adds a shape (recorded as a hshape).

Parameters
----------
sh: TopoDS_Shape
name: char *,optional
	default value is ""

Returns
-------
None
") AddShape;
		void AddShape(const TopoDS_Shape & sh, const char * name = "");

		/****************** AddText ******************/
		/**** md5 signature: a4eaadd4ba4352f6b55cb9c7d2514620 ****/
		%feature("compactdefaultargs") AddText;
		%feature("autodoc", "Adds a text (as hasciistring).

Parameters
----------
text: char *
name: char *,optional
	default value is ""

Returns
-------
None
") AddText;
		void AddText(const char * text, const char * name = "");

		/****************** AddXY ******************/
		/**** md5 signature: b4c2f9d1d8072378fc2125fb0795e979 ****/
		%feature("compactdefaultargs") AddXY;
		%feature("autodoc", "Adds a xy.

Parameters
----------
aXY: gp_XY
name: char *,optional
	default value is ""

Returns
-------
None
") AddXY;
		void AddXY(const gp_XY & aXY, const char * name = "");

		/****************** AddXYZ ******************/
		/**** md5 signature: 812ae7a37099d4e0579eb148e74e815d ****/
		%feature("compactdefaultargs") AddXYZ;
		%feature("autodoc", "Adds a xyz.

Parameters
----------
aXYZ: gp_XYZ
name: char *,optional
	default value is ""

Returns
-------
None
") AddXYZ;
		void AddXYZ(const gp_XYZ & aXYZ, const char * name = "");

		/****************** CaseId ******************/
		/**** md5 signature: 00273d8277e031d07a637ab90697c910 ****/
		%feature("compactdefaultargs") CaseId;
		%feature("autodoc", "Returns the caseid.

Returns
-------
char *
") CaseId;
		const char * CaseId();

		/****************** Data ******************/
		/**** md5 signature: f80568a434a1353b089e99d0a8827cee ****/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Returns a data item (n0 <nd> in the set <num>).

Parameters
----------
nd: int

Returns
-------
opencascade::handle<Standard_Transient>
") Data;
		opencascade::handle<Standard_Transient> Data(const Standard_Integer nd);

		/****************** DefCheck ******************/
		/**** md5 signature: eb4da30abf4fe917c43513e8562de6f1 ****/
		%feature("compactdefaultargs") DefCheck;
		%feature("autodoc", "Returns check status for a code : 0 non/info (default), 1 warning, 2 fail //! remark : defcheck is used to set the check status of a casedata when it is attached to a case code, it can be changed later (by setfail, setwarning, resetcheck).

Parameters
----------
acode: char *

Returns
-------
int
") DefCheck;
		static Standard_Integer DefCheck(const char * acode);

		/****************** DefMsg ******************/
		/**** md5 signature: f3fdd9962e01566774984d3cbbc8b441 ****/
		%feature("compactdefaultargs") DefMsg;
		%feature("autodoc", "Returns the message definition for a case code empty if no message attached.

Parameters
----------
casecode: char *

Returns
-------
char *
") DefMsg;
		static const char * DefMsg(const char * casecode);

		/****************** GetCPU ******************/
		/**** md5 signature: 00bbde2fe3bee9e2c2e91eb52554c939 ****/
		%feature("compactdefaultargs") GetCPU;
		%feature("autodoc", "Returns the current amount of cpu this allows to laterly test and record cpu amount its value has to be given to largecpu and addcpu.

Returns
-------
float
") GetCPU;
		Standard_Real GetCPU();

		/****************** GetData ******************/
		/**** md5 signature: bb9d0e00d5fb999da4e5420db20a8c13 ****/
		%feature("compactdefaultargs") GetData;
		%feature("autodoc", "Returns a data item, under control of a type if the data item is kind of this type, it is returned in <val> and the returned value is true else, <val> is unchanged and the returned value is false.

Parameters
----------
nd: int
type: Standard_Type
val: Standard_Transient

Returns
-------
bool
") GetData;
		Standard_Boolean GetData(const Standard_Integer nd, const opencascade::handle<Standard_Type> & type, opencascade::handle<Standard_Transient> & val);

		/****************** Integer ******************/
		/**** md5 signature: d8b799534891244055a897cb27c52560 ****/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "Returns an integer.

Parameters
----------
nd: int

Returns
-------
val: int
") Integer;
		Standard_Boolean Integer(const Standard_Integer nd, Standard_Integer &OutValue);

		/****************** IsCheck ******************/
		/**** md5 signature: 30349f70e09cdfa743fc34bc26c2fb2b ****/
		%feature("compactdefaultargs") IsCheck;
		%feature("autodoc", "Tells if <self> is check (warning or fail), else it is info.

Returns
-------
bool
") IsCheck;
		Standard_Boolean IsCheck();

		/****************** IsFail ******************/
		/**** md5 signature: 524d8ab308e46f0a1f95eddd8baf23a1 ****/
		%feature("compactdefaultargs") IsFail;
		%feature("autodoc", "Tells if <self> is fail.

Returns
-------
bool
") IsFail;
		Standard_Boolean IsFail();

		/****************** IsWarning ******************/
		/**** md5 signature: e5e018b76f604f721ac7f5a4f0da1bee ****/
		%feature("compactdefaultargs") IsWarning;
		%feature("autodoc", "Tells if <self> is warning.

Returns
-------
bool
") IsWarning;
		Standard_Boolean IsWarning();

		/****************** Kind ******************/
		/**** md5 signature: 240ee38bbdcd2cdfc62382e178aee32c ****/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Returns the kind of a data : kind type meaning 0 any any (not one of the followings) 1 ex raised exception 2 en entity 3 g geom 4 sh shape 5 xyz xyz 6 xy or uv xy 7 rr 2 reals 8 r 1 real 9 cpu cpu (1 real) 10 t text 11 i integer //! for namenum, these codes for type must be given exact i.e. sh for a shape, not s nor shape nor solid etc.

Parameters
----------
nd: int

Returns
-------
int
") Kind;
		Standard_Integer Kind(const Standard_Integer nd);

		/****************** LargeCPU ******************/
		/**** md5 signature: 71dadf235aade01bedc90b6cdb2897ce ****/
		%feature("compactdefaultargs") LargeCPU;
		%feature("autodoc", "Tells if a cpu time amount is large <maxcpu> gives the amount over which an amount is large <lastcpu> gives the start cpu amount if <curcpu> is given, the tested cpu amount is curcpu-lastcpu else it is currently measured cpu - lastcpu.

Parameters
----------
maxCPU: float
lastCPU: float
curCPU: float,optional
	default value is 0

Returns
-------
bool
") LargeCPU;
		Standard_Boolean LargeCPU(const Standard_Real maxCPU, const Standard_Real lastCPU, const Standard_Real curCPU = 0);

		/****************** Msg ******************/
		/**** md5 signature: 9a65aef83214ce6d33b185aed38c1f0a ****/
		%feature("compactdefaultargs") Msg;
		%feature("autodoc", "Returns a msg from a casedata : it is build from defmsg, which gives the message code plus the designation of items of the casedata to be added to the msg empty if no message attached //! remains to be implemented.

Returns
-------
Message_Msg
") Msg;
		Message_Msg Msg();

		/****************** Name ******************/
		/**** md5 signature: 2e8cb64f99d00deafae9c92f20b187a2 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name.

Returns
-------
char *
") Name;
		const char * Name();

		/****************** Name ******************/
		/**** md5 signature: daa685c923900f80fa41f50d5eeb7f76 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name of a data. if it has no name, the string is empty (length = 0).

Parameters
----------
nd: int

Returns
-------
TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name(const Standard_Integer nd);

		/****************** NameNum ******************/
		/**** md5 signature: 1d3a907e11739d5a6bd945884af12849 ****/
		%feature("compactdefaultargs") NameNum;
		%feature("autodoc", "Returns the first suitable data rank for a given name exact maching (exact case, no completion) is required firstly checks the recorded names if not found, considers the name as follows : name = 'type' : search for the first item with this type name = 'type:nn' : search for the nn.th item with this type see allowed values in method kind.

Parameters
----------
name: char *

Returns
-------
int
") NameNum;
		Standard_Integer NameNum(const char * name);

		/****************** NbData ******************/
		/**** md5 signature: 65dffaaee72ce13df8f72ba4f254de29 ****/
		%feature("compactdefaultargs") NbData;
		%feature("autodoc", "Returns the count of data recorded to a set.

Returns
-------
int
") NbData;
		Standard_Integer NbData();

		/****************** Real ******************/
		/**** md5 signature: fb3ec93e6fea8b68ac5fb104ba9991ec ****/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "Returns a real or cpu amount (stored in geom2d_cartesianpoint) (allows an integer converted to a real).

Parameters
----------
nd: int

Returns
-------
val: float
") Real;
		Standard_Boolean Real(const Standard_Integer nd, Standard_Real &OutValue);

		/****************** Reals ******************/
		/**** md5 signature: 6ca87920cf3a61113f864e225ed735c3 ****/
		%feature("compactdefaultargs") Reals;
		%feature("autodoc", "Returns a couple of reals (stored in geom2d_cartesianpoint).

Parameters
----------
nd: int

Returns
-------
v1: float
v2: float
") Reals;
		Standard_Boolean Reals(const Standard_Integer nd, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** RemoveData ******************/
		/**** md5 signature: 87f33cf90143f205f9e74295f235a95f ****/
		%feature("compactdefaultargs") RemoveData;
		%feature("autodoc", "Removes a data from its rank. does nothing if out of range.

Parameters
----------
num: int

Returns
-------
None
") RemoveData;
		void RemoveData(const Standard_Integer num);

		/****************** ResetCheck ******************/
		/**** md5 signature: 994db56670d518106b28f0eb1c3ddbaf ****/
		%feature("compactdefaultargs") ResetCheck;
		%feature("autodoc", "Resets check status, i.e. sets <self> as info.

Returns
-------
None
") ResetCheck;
		void ResetCheck();

		/****************** SetCaseId ******************/
		/**** md5 signature: 269d9f4f53a76a32a3150406d8f94389 ****/
		%feature("compactdefaultargs") SetCaseId;
		%feature("autodoc", "Sets a caseid.

Parameters
----------
caseid: char *

Returns
-------
None
") SetCaseId;
		void SetCaseId(const char * caseid);

		/****************** SetChange ******************/
		/**** md5 signature: 35020ffdf661ae424b32ec90844aa543 ****/
		%feature("compactdefaultargs") SetChange;
		%feature("autodoc", "Sets the next add... not to add but to change the data item designated by its name. if next add... is not called with a name, setchange is ignored reset by next add... , whatever <num> is correct or not.

Returns
-------
None
") SetChange;
		void SetChange();

		/****************** SetDefFail ******************/
		/**** md5 signature: c1ff28d91d209519b87fb8d9d0a096c4 ****/
		%feature("compactdefaultargs") SetDefFail;
		%feature("autodoc", "Sets a code to give a fail.

Parameters
----------
acode: char *

Returns
-------
None
") SetDefFail;
		static void SetDefFail(const char * acode);

		/****************** SetDefMsg ******************/
		/**** md5 signature: 129902a2108aea4a762b8e75e5fd239d ****/
		%feature("compactdefaultargs") SetDefMsg;
		%feature("autodoc", "Attaches a message definition to a case code this definition includes the message code plus designation of items of the casedata to be added to the message (this part not yet implemented).

Parameters
----------
casecode: char *
mesdef: char *

Returns
-------
None
") SetDefMsg;
		static void SetDefMsg(const char * casecode, const char * mesdef);

		/****************** SetDefWarning ******************/
		/**** md5 signature: fc48374ca5a180ca723d24adab781749 ****/
		%feature("compactdefaultargs") SetDefWarning;
		%feature("autodoc", "Sets a code to give a warning.

Parameters
----------
acode: char *

Returns
-------
None
") SetDefWarning;
		static void SetDefWarning(const char * acode);

		/****************** SetFail ******************/
		/**** md5 signature: 31938ccd35b6a5850873a21884c12ffc ****/
		%feature("compactdefaultargs") SetFail;
		%feature("autodoc", "Sets <self> as fail.

Returns
-------
None
") SetFail;
		void SetFail();

		/****************** SetName ******************/
		/**** md5 signature: 208d3e507b11ad1eb22d3afd35f96209 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Sets a name.

Parameters
----------
name: char *

Returns
-------
None
") SetName;
		void SetName(const char * name);

		/****************** SetReplace ******************/
		/**** md5 signature: d05913aa2cce37b4b1cb745952a24764 ****/
		%feature("compactdefaultargs") SetReplace;
		%feature("autodoc", "Sets the next add... not to add but to replace the data item <num>, if <num> is between 1 and nbdata. reset by next add... , whatever <num> is correct or not.

Parameters
----------
num: int

Returns
-------
None
") SetReplace;
		void SetReplace(const Standard_Integer num);

		/****************** SetWarning ******************/
		/**** md5 signature: 58fb56cb90f7ed086699b1ee96d438c0 ****/
		%feature("compactdefaultargs") SetWarning;
		%feature("autodoc", "Sets <self> as warning.

Returns
-------
None
") SetWarning;
		void SetWarning();

		/****************** Shape ******************/
		/**** md5 signature: 3e8a6ae743356dd38a2628e8b75a6b9f ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns a data as a shape, null if not a shape.

Parameters
----------
nd: int

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape(const Standard_Integer nd);

		/****************** Text ******************/
		/**** md5 signature: f1bb927b5da5ede3cefcbeed1efa5328 ****/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Returns a text (stored in tcollection_hasciistring).

Parameters
----------
nd: int
text: char *

Returns
-------
bool
") Text;
		Standard_Boolean Text(const Standard_Integer nd, const char * & text);

		/****************** XY ******************/
		/**** md5 signature: 6265946dc936f94b9ea104fac9e33a84 ****/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "Returns a data as a xy (i.e. geom2d_cartesianpoint) returns false if not the good type.

Parameters
----------
nd: int
val: gp_XY

Returns
-------
bool
") XY;
		Standard_Boolean XY(const Standard_Integer nd, gp_XY & val);

		/****************** XYZ ******************/
		/**** md5 signature: dcfe8b60a571ed54747716041cc1158b ****/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "Returns a data as a xyz (i.e. geom_cartesianpoint) returns false if not the good type.

Parameters
----------
nd: int
val: gp_XYZ

Returns
-------
bool
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
		/****************** Type ******************/
		/**** md5 signature: 192a28917d102787dc4550e6e61c97a0 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type attached to an object here, the dynamic type of a transient. null type if unknown.

Parameters
----------
ent: Standard_Transient

Returns
-------
opencascade::handle<Standard_Type>
") Type;
		static opencascade::handle<Standard_Type> Type(const opencascade::handle<Standard_Transient> & ent);

		/****************** TypeName ******************/
		/**** md5 signature: 2ed9999dd09e4008de6273d943a36227 ****/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "Returns type name (string) allows to name type of non-handled objects.

Parameters
----------
ent: Standard_Transient

Returns
-------
char *
") TypeName;
		static const char * TypeName(const opencascade::handle<Standard_Transient> & ent);

};


%extend MoniTool_DataInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class MoniTool_ElemHasher *
****************************/
class MoniTool_ElemHasher {
	public:
		/****************** HashCode ******************/
		/**** md5 signature: 36ed3693281a4c1efb408c6d81ea9442 ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Returns hash code for the given element, in the range [1, theupperbound]. asks theelement its hashcode, then transforms it to be in the required range. @param theelement the element which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theElement: Handle ( MoniTool_Element )
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const Handle ( MoniTool_Element ) & theElement, Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		/**** md5 signature: 84b993ef1cb63a485f6d39c8e686a3d8 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if two keys are the same. the test does not work on the elements themselves but by calling their methods equates.

Parameters
----------
K1: MoniTool_Element
K2: MoniTool_Element

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const opencascade::handle<MoniTool_Element> & K1, const opencascade::handle<MoniTool_Element> & K2);

};


%extend MoniTool_ElemHasher {
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
		/****************** ChangeAttr ******************/
		/**** md5 signature: 37f068e8d5573c47945d4a10825eef1d ****/
		%feature("compactdefaultargs") ChangeAttr;
		%feature("autodoc", "Returns (modifiable) the attribute list.

Returns
-------
MoniTool_AttrList
") ChangeAttr;
		MoniTool_AttrList & ChangeAttr();

		/****************** Equates ******************/
		/**** md5 signature: 1e903a4f175e33c1a9f161e9ea07b5f3 ****/
		%feature("compactdefaultargs") Equates;
		%feature("autodoc", "Specific testof equallity : to be defined by each sub-class, must be false if elements have not the same true type, else their contents must be compared.

Parameters
----------
other: MoniTool_Element

Returns
-------
bool
") Equates;
		virtual Standard_Boolean Equates(const opencascade::handle<MoniTool_Element> & other);

		/****************** GetHashCode ******************/
		/**** md5 signature: bff72276a4c4e09c342f668ee3cdf337 ****/
		%feature("compactdefaultargs") GetHashCode;
		%feature("autodoc", "Returns the hashcode which has been stored by sethashcode (remark that hashcode could be deferred then be defined by sub-classes, the result is the same).

Returns
-------
int
") GetHashCode;
		Standard_Integer GetHashCode();

		/****************** ListAttr ******************/
		/**** md5 signature: 89db2371bd1b9507aadc1fc2ccd6a47b ****/
		%feature("compactdefaultargs") ListAttr;
		%feature("autodoc", "Returns (readonly) the attribute list.

Returns
-------
MoniTool_AttrList
") ListAttr;
		const MoniTool_AttrList & ListAttr();

		/****************** ValueType ******************/
		/**** md5 signature: 7bf10d093b4c83528695e983de0b203f ****/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "Returns the type of the value. by default, returns the dynamictype of <self>, but can be redefined.

Returns
-------
opencascade::handle<Standard_Type>
") ValueType;
		virtual opencascade::handle<Standard_Type> ValueType();

		/****************** ValueTypeName ******************/
		/**** md5 signature: 9c551b5e8bde5c3427d2235f8cb0d374 ****/
		%feature("compactdefaultargs") ValueTypeName;
		%feature("autodoc", "Returns the name of the type of the value. default is name of valuetype, unless it is for a non-handled object.

Returns
-------
char *
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
		/****************** MoniTool_IntVal ******************/
		/**** md5 signature: 54b1ae511a36927c8a949693d00e10f5 ****/
		%feature("compactdefaultargs") MoniTool_IntVal;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: int,optional
	default value is 0

Returns
-------
None
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
		/****************** Value ******************/
		/**** md5 signature: c6d99989077b92200f0377d8b792ba0b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Value;
		Standard_Integer Value();

};


%make_alias(MoniTool_IntVal)

%extend MoniTool_IntVal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class MoniTool_MTHasher *
**************************/
class MoniTool_MTHasher {
	public:
		/****************** HashCode ******************/
		/**** md5 signature: 41f46f76df5600cf4764d092181522c3 ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Returns hash code for the given string, in the range [1, theupperbound] @param thestring the string which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theString: char *
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const char * theString, Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		/**** md5 signature: d58faee5604f73146448a83725c5050b ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true when the two cstring are the same. two same strings must have the same hashcode, the contrary is not necessary. default str1 == str2.

Parameters
----------
Str1: char *
Str2: char *

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const char * Str1, const char * Str2);

};


%extend MoniTool_MTHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class MoniTool_RealVal *
*************************/
class MoniTool_RealVal : public Standard_Transient {
	public:
		/****************** MoniTool_RealVal ******************/
		/**** md5 signature: 7c169d55add39db3049450bc8d4f35b8 ****/
		%feature("compactdefaultargs") MoniTool_RealVal;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: float,optional
	default value is 0.0

Returns
-------
None
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
		/****************** Value ******************/
		/**** md5 signature: 52655a2fb6642856b2c68a9331826787 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
float
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
		/****************** Name ******************/
		/**** md5 signature: b2b3faaae1ea976a5c6814bfba5805a2 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns an identification of the signature (a word), given at initialization time.

Returns
-------
char *
") Name;
		virtual const char * Name();

		/****************** Text ******************/
		/**** md5 signature: 8d6fbb08669c0a43c9d336ccc51c4fbd ****/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Gives a text as a signature for a transient object in a context if the context is senseless, it can be given as null handle empty result if nothing to give (at least the dynamictype could be sent ?).

Parameters
----------
ent: Standard_Transient
context: Standard_Transient

Returns
-------
TCollection_AsciiString
") Text;
		virtual TCollection_AsciiString Text(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Transient> & context);

		/****************** TextAlone ******************/
		/**** md5 signature: aed71ef19ce188a0cfee174f5a0a9194 ****/
		%feature("compactdefaultargs") TextAlone;
		%feature("autodoc", "Gives a text as a signature for a transient object alone, i.e. without defined context. by default, calls text with undefined context (null handle) and if empty, then returns dynamictype.

Parameters
----------
ent: Standard_Transient

Returns
-------
TCollection_AsciiString
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
		/****************** MoniTool_Stat ******************/
		/**** md5 signature: e65040f7ebf5fe26b424de8f71d41722 ****/
		%feature("compactdefaultargs") MoniTool_Stat;
		%feature("autodoc", "Creates a stat form. at start, one default phase is defined, with one default step. then, it suffises to start with a count of items (and cycles if several) then record items, to have a queryable report.

Parameters
----------
title: char *,optional
	default value is ""

Returns
-------
None
") MoniTool_Stat;
		 MoniTool_Stat(const char * title = "");

		/****************** MoniTool_Stat ******************/
		/**** md5 signature: 68a05e88f487eadb51ec526eeea9410c ****/
		%feature("compactdefaultargs") MoniTool_Stat;
		%feature("autodoc", "Used when starting.

Parameters
----------
other: MoniTool_Stat

Returns
-------
None
") MoniTool_Stat;
		 MoniTool_Stat(const MoniTool_Stat & other);

		/****************** Add ******************/
		/**** md5 signature: f3fab2c5142a08a50b9a3023611b3ad1 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Directly addes items.

Parameters
----------
nb: int,optional
	default value is 1

Returns
-------
None
") Add;
		void Add(const Standard_Integer nb = 1);

		/****************** AddEnd ******************/
		/**** md5 signature: 370897480301b628c04a6bd14f86ae0e ****/
		%feature("compactdefaultargs") AddEnd;
		%feature("autodoc", "Ends the addsub and cumulates the sub-count to current level.

Returns
-------
None
") AddEnd;
		void AddEnd();

		/****************** AddSub ******************/
		/**** md5 signature: 6c1da3fd60aca6c3db02b8499ea9f372 ****/
		%feature("compactdefaultargs") AddSub;
		%feature("autodoc", "Declares a count of items to be added later. if a sub-counter is opened, its percentage multiplies this sub-count to compute the percent of current level.

Parameters
----------
nb: int,optional
	default value is 1

Returns
-------
None
") AddSub;
		void AddSub(const Standard_Integer nb = 1);

		/****************** Close ******************/
		/**** md5 signature: 45b7e0c851ec50c4814c2077322ec35a ****/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "No available documentation.

Parameters
----------
id: int

Returns
-------
None
") Close;
		void Close(const Standard_Integer id);

		/****************** Current ******************/
		/**** md5 signature: ebcdfafb894465b5f81e125d5c4b5637 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "No available documentation.

Returns
-------
MoniTool_Stat
") Current;
		static MoniTool_Stat & Current();

		/****************** Level ******************/
		/**** md5 signature: 06f7279e938b54c0bc4a49915192a536 ****/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Level;
		Standard_Integer Level();

		/****************** Open ******************/
		/**** md5 signature: 075d35239e71af92e8dc106f04de7b47 ****/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "Opens a new counter with a starting count of items.

Parameters
----------
nb: int,optional
	default value is 100

Returns
-------
int
") Open;
		Standard_Integer Open(const Standard_Integer nb = 100);

		/****************** OpenMore ******************/
		/**** md5 signature: fe91d805ae92eca04888425aaa630b89 ****/
		%feature("compactdefaultargs") OpenMore;
		%feature("autodoc", "Adds more items to be counted by add... on current level.

Parameters
----------
id: int
nb: int

Returns
-------
None
") OpenMore;
		void OpenMore(const Standard_Integer id, const Standard_Integer nb);

		/****************** Percent ******************/
		/**** md5 signature: 46bae145f78bddca0f22277606688606 ****/
		%feature("compactdefaultargs") Percent;
		%feature("autodoc", "No available documentation.

Parameters
----------
fromlev: int,optional
	default value is 0

Returns
-------
float
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
		/****************** MoniTool_Timer ******************/
		/**** md5 signature: 7da08ee764ade7eb8e612ac9e8eacc68 ****/
		%feature("compactdefaultargs") MoniTool_Timer;
		%feature("autodoc", "Create timer in empty state.

Returns
-------
None
") MoniTool_Timer;
		 MoniTool_Timer();

		/****************** Amend ******************/
		/**** md5 signature: d9cb93339d1e645446e111d326e3bc45 ****/
		%feature("compactdefaultargs") Amend;
		%feature("autodoc", "Return value of accumulated amendment on cpu time.

Returns
-------
float
") Amend;
		Standard_Real Amend();

		/****************** CPU ******************/
		/**** md5 signature: 521db0d485b8797a691f912f6b878d86 ****/
		%feature("compactdefaultargs") CPU;
		%feature("autodoc", "Return value of cpu time minus accumulated amendment.

Returns
-------
float
") CPU;
		Standard_Real CPU();

		/****************** ClearTimers ******************/
		/**** md5 signature: 7fa02c7296fcabbcc3d9ae592e2da041 ****/
		%feature("compactdefaultargs") ClearTimers;
		%feature("autodoc", "Clears map of timers.

Returns
-------
None
") ClearTimers;
		static void ClearTimers();

		/****************** ComputeAmendments ******************/
		/**** md5 signature: d712d0303d6ce344bca5d1358ce67cdb ****/
		%feature("compactdefaultargs") ComputeAmendments;
		%feature("autodoc", "Computes and remembers amendments for times to access, start, and stop of timer, and estimates second-order error measured by 10 nested timers.

Returns
-------
None
") ComputeAmendments;
		static void ComputeAmendments();

		/****************** Count ******************/
		/**** md5 signature: 991c7b8ad8fee748c77481e1ff97e534 ****/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "Return value of hits counter (count of start/stop pairs).

Returns
-------
int
") Count;
		Standard_Integer Count();

		/****************** Dictionary ******************/
		/**** md5 signature: 3dd9e448982a7f8f1ae68a5ba35de172 ****/
		%feature("compactdefaultargs") Dictionary;
		%feature("autodoc", "Returns map of timers.

Returns
-------
MoniTool_DataMapOfTimer
") Dictionary;
		static MoniTool_DataMapOfTimer & Dictionary();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };

        %feature("autodoc", "1");
        %extend{
            std::string DumpTimersToString() {
            std::stringstream s;
            self->DumpTimers(s);
            return s.str();}
        };
		/****************** GetAmendments ******************/
		/**** md5 signature: c2be8078ab69a477345c7d01bfe03646 ****/
		%feature("compactdefaultargs") GetAmendments;
		%feature("autodoc", "The computed amendmens are returned (for information only).

Parameters
----------

Returns
-------
Access: float
Internal: float
External: float
Error10: float
") GetAmendments;
		static void GetAmendments(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsRunning ******************/
		/**** md5 signature: d7c315f198eeb1f77f7fa766917cac35 ****/
		%feature("compactdefaultargs") IsRunning;
		%feature("autodoc", "Returns value of nesting counter.

Returns
-------
int
") IsRunning;
		Standard_Integer IsRunning();

		/****************** Reset ******************/
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Start, stop and reset the timer in addition to doing that to embedded osd_timer, manage also counter of hits.

Returns
-------
None
") Reset;
		void Reset();

		/****************** Start ******************/
		/**** md5 signature: f8a4dbf1e6f2cec0927301856b440be5 ****/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Start;
		void Start();

		/****************** Start ******************/
		/**** md5 signature: b833d14b6b19bc40531ad996f753cfaf ****/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *

Returns
-------
None
") Start;
		static void Start(const char * name);

		/****************** Stop ******************/
		/**** md5 signature: 702270b81e0a152f42e95b594cbf6271 ****/
		%feature("compactdefaultargs") Stop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Stop;
		void Stop();

		/****************** Stop ******************/
		/**** md5 signature: a7e1fcb4a05664a7681ec0b7099dcb2b ****/
		%feature("compactdefaultargs") Stop;
		%feature("autodoc", "Inline methods to conveniently start/stop timer by name shortcut to timer(name)->start/stop().

Parameters
----------
name: char *

Returns
-------
None
") Stop;
		static void Stop(const char * name);

		/****************** Timer ******************/
		/**** md5 signature: bcb4e9e61cdff233394f8b155f896468 ****/
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", "No available documentation.

Returns
-------
OSD_Timer
") Timer;
		const OSD_Timer & Timer();

		/****************** Timer ******************/
		/**** md5 signature: 26bc13b983ab9fb82126f8517bcdd477 ****/
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", "Return reference to embedded osd_timer.

Returns
-------
OSD_Timer
") Timer;
		OSD_Timer & Timer();

		/****************** Timer ******************/
		/**** md5 signature: 9237b83a5e4ff7ccc33dbe1781fb7e12 ****/
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", "Returns a timer from a dictionary by its name if timer not existed, creates a new one.

Parameters
----------
name: char *

Returns
-------
opencascade::handle<MoniTool_Timer>
") Timer;
		static opencascade::handle<MoniTool_Timer> Timer(const char * name);

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
		/****************** MoniTool_TimerSentry ******************/
		/**** md5 signature: 29c99cdb9c92a94de51617e05465c45f ****/
		%feature("compactdefaultargs") MoniTool_TimerSentry;
		%feature("autodoc", "Constructor creates an instance and runs the corresponding timer.

Parameters
----------
cname: char *

Returns
-------
None
") MoniTool_TimerSentry;
		 MoniTool_TimerSentry(const char * cname);

		/****************** MoniTool_TimerSentry ******************/
		/**** md5 signature: f8ad07fc64ca3f7f856174a2c43628b8 ****/
		%feature("compactdefaultargs") MoniTool_TimerSentry;
		%feature("autodoc", "Constructor creates an instance and runs the corresponding timer.

Parameters
----------
timer: MoniTool_Timer

Returns
-------
None
") MoniTool_TimerSentry;
		 MoniTool_TimerSentry(const opencascade::handle<MoniTool_Timer> & timer);

		/****************** Stop ******************/
		/**** md5 signature: 702270b81e0a152f42e95b594cbf6271 ****/
		%feature("compactdefaultargs") Stop;
		%feature("autodoc", "Manually stops the timer.

Returns
-------
None
") Stop;
		void Stop();

		/****************** Timer ******************/
		/**** md5 signature: 85c5aa27e020bbb36f74c4d61646d1d4 ****/
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MoniTool_Timer>
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
		/****************** MoniTool_TypedValue ******************/
		/**** md5 signature: 96d7c03f50b98cd157c360176d941966 ****/
		%feature("compactdefaultargs") MoniTool_TypedValue;
		%feature("autodoc", "Creates a typedvalue, with a name //! type gives the type of the parameter, default is free text also available : integer, real, enum, entity (i.e. object) more precise specifications, titles, can be given to the typedvalue once created //! init gives an initial value. if it is not given, the typedvalue begins as 'not set', its value is empty.

Parameters
----------
name: char *
type: MoniTool_ValueType,optional
	default value is MoniTool_ValueText
init: char *,optional
	default value is ""

Returns
-------
None
") MoniTool_TypedValue;
		 MoniTool_TypedValue(const char * name, const MoniTool_ValueType type = MoniTool_ValueText, const char * init = "");

		/****************** MoniTool_TypedValue ******************/
		/**** md5 signature: 2b88b6976dfa2d96905a887c992d595a ****/
		%feature("compactdefaultargs") MoniTool_TypedValue;
		%feature("autodoc", "Creates a typedvalue from another one, by duplication.

Parameters
----------
other: MoniTool_TypedValue

Returns
-------
None
") MoniTool_TypedValue;
		 MoniTool_TypedValue(const opencascade::handle<MoniTool_TypedValue> & other);

		/****************** AddDef ******************/
		/**** md5 signature: 270379383287ef65ab016bd598c4af1f ****/
		%feature("compactdefaultargs") AddDef;
		%feature("autodoc", "Completes the definition of a typedvalue by command <initext>, once created with its type returns true if done, false if could not be interpreted <initext> may be : imin ival : minimum value for an integer imax ival : maximum value for an integer rmin rval : minimum value for a real rmax rval : maximum value for a real unit name : name of unit ematch i : enum from integer value i, match required enum i : enum from integer value i, match not required eval text : add an enumerative value (increments max by 1) eval : add a non-authorised enum value (to be skipped) tmax l : maximum length for a text.

Parameters
----------
initext: char *

Returns
-------
bool
") AddDef;
		Standard_Boolean AddDef(const char * initext);

		/****************** AddEnum ******************/
		/**** md5 signature: e6ae955f31fb3a2e2ceeb01f3e9686bd ****/
		%feature("compactdefaultargs") AddEnum;
		%feature("autodoc", "Adds enumerative definitions. for more than 10, several calls.

Parameters
----------
v1: char *,optional
	default value is ""
v2: char *,optional
	default value is ""
v3: char *,optional
	default value is ""
v4: char *,optional
	default value is ""
v5: char *,optional
	default value is ""
v6: char *,optional
	default value is ""
v7: char *,optional
	default value is ""
v8: char *,optional
	default value is ""
v9: char *,optional
	default value is ""
v10: char *,optional
	default value is ""

Returns
-------
None
") AddEnum;
		void AddEnum(const char * v1 = "", const char * v2 = "", const char * v3 = "", const char * v4 = "", const char * v5 = "", const char * v6 = "", const char * v7 = "", const char * v8 = "", const char * v9 = "", const char * v10 = "");

		/****************** AddEnumValue ******************/
		/**** md5 signature: dd36fba0a6d141a7dfbf4646a6317bd6 ****/
		%feature("compactdefaultargs") AddEnumValue;
		%feature("autodoc", "Adds an enumeration definition, by its string and numeric values. if it is the first setting for this value, it is recorded as main value. else, it is recognized as alternate string for this numeric value.

Parameters
----------
val: char *
num: int

Returns
-------
None
") AddEnumValue;
		void AddEnumValue(const char * val, const Standard_Integer num);

		/****************** AddLib ******************/
		/**** md5 signature: c61cc150ba0ebcce137a721917e17662 ****/
		%feature("compactdefaultargs") AddLib;
		%feature("autodoc", "Adds a typedvalue in the library. it is recorded then will be accessed by its name its definition may be imposed, else it is computed as usual by default it will be accessed by its definition (string) returns true if done, false if tv is null or brings no definition or <def> not defined //! if a typedvalue was already recorded under this name, it is replaced.

Parameters
----------
tv: MoniTool_TypedValue
def: char *,optional
	default value is ""

Returns
-------
bool
") AddLib;
		static Standard_Boolean AddLib(const opencascade::handle<MoniTool_TypedValue> & tv, const char * def = "");

		/****************** CStringValue ******************/
		/**** md5 signature: e29eae6e0076125e72074e4bd0c76b3a ****/
		%feature("compactdefaultargs") CStringValue;
		%feature("autodoc", "Returns the value, as a cstring. empty if not set.

Returns
-------
char *
") CStringValue;
		const char * CStringValue();

		/****************** ClearValue ******************/
		/**** md5 signature: 70260fa193dc762fb315c6297127fb7c ****/
		%feature("compactdefaultargs") ClearValue;
		%feature("autodoc", "Clears the recorded value : it is now unset.

Returns
-------
None
") ClearValue;
		void ClearValue();

		/****************** Definition ******************/
		/**** md5 signature: ccdcae49759d4b73dcb504b2936ba137 ****/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "Returns the definition by priority, the enforced one, else an automatic one, computed from the specification.

Returns
-------
TCollection_AsciiString
") Definition;
		TCollection_AsciiString Definition();

		/****************** EnumCase ******************/
		/**** md5 signature: 62406df61445d184caa1d6ed239fe6a3 ****/
		%feature("compactdefaultargs") EnumCase;
		%feature("autodoc", "Returns the case number which cooresponds to a string value works with main and additionnal values returns (startenum - 1) if not ok, -1 if not an enum.

Parameters
----------
val: char *

Returns
-------
int
") EnumCase;
		Standard_Integer EnumCase(const char * val);

		/****************** EnumDef ******************/
		/**** md5 signature: 980792930a6ea3fdf361dc3b1c7d441d ****/
		%feature("compactdefaultargs") EnumDef;
		%feature("autodoc", "Gives the enum definitions : start value, end value, match status. returns true for an enum, false else.

Parameters
----------

Returns
-------
startcase: int
endcase: int
match: bool
") EnumDef;
		Standard_Boolean EnumDef(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Boolean &OutValue);

		/****************** EnumVal ******************/
		/**** md5 signature: 354eb473aa3cf0e0681ce7fc2799fa01 ****/
		%feature("compactdefaultargs") EnumVal;
		%feature("autodoc", "Returns the value of an enumerative definition, from its rank empty string if out of range or not an enum.

Parameters
----------
num: int

Returns
-------
char *
") EnumVal;
		const char * EnumVal(const Standard_Integer num);

		/****************** FromLib ******************/
		/**** md5 signature: fa43a04fa4b4ae98ce69c9be25395f2a ****/
		%feature("compactdefaultargs") FromLib;
		%feature("autodoc", "Returns a copy of the typedvalue bound with a given name null handle if none recorded.

Parameters
----------
def: char *

Returns
-------
opencascade::handle<MoniTool_TypedValue>
") FromLib;
		static opencascade::handle<MoniTool_TypedValue> FromLib(const char * def);

		/****************** GetObjectValue ******************/
		/**** md5 signature: 23272bc4133e0775830a35a37d96d179 ****/
		%feature("compactdefaultargs") GetObjectValue;
		%feature("autodoc", "Same as objectvalue, but avoids downcast : the receiving variable is directly loaded. it is assumed that it complies with the definition of objecttype ! otherwise, big trouble.

Parameters
----------
val: Standard_Transient

Returns
-------
None
") GetObjectValue;
		void GetObjectValue(opencascade::handle<Standard_Transient> & val);

		/****************** HStringValue ******************/
		/**** md5 signature: c0daaacdffeb9186dd6b6121d18328e9 ****/
		%feature("compactdefaultargs") HStringValue;
		%feature("autodoc", "Returns the value, as a handle (can then be shared) null if not defined.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") HStringValue;
		opencascade::handle<TCollection_HAsciiString> HStringValue();

		/****************** HasInterpret ******************/
		/**** md5 signature: 6f629b352f0708b49269300b1a9f380d ****/
		%feature("compactdefaultargs") HasInterpret;
		%feature("autodoc", "Tells if a typedvalue has an interpret.

Returns
-------
bool
") HasInterpret;
		virtual Standard_Boolean HasInterpret();

		/****************** IntegerLimit ******************/
		/**** md5 signature: 92d178c29627fe6bb9dd5904f4dda9a8 ****/
		%feature("compactdefaultargs") IntegerLimit;
		%feature("autodoc", "Gives an integer limit (upper if <max> true, lower if <max> false). returns true if this limit is defined, false else (in that case, gives the natural limit for integer).

Parameters
----------
max: bool

Returns
-------
val: int
") IntegerLimit;
		Standard_Boolean IntegerLimit(const Standard_Boolean max, Standard_Integer &OutValue);

		/****************** IntegerValue ******************/
		/**** md5 signature: a75e1a4c2632a55658f0262c4c2f22c2 ****/
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "Returns the value as integer, i.e. : for type = integer, the integer itself; 0 if not set for type = enum, the designated rank (see enum definition) startenum - 1 if not set or not in the definition else, returns 0.

Returns
-------
int
") IntegerValue;
		Standard_Integer IntegerValue();

		/****************** Internals ******************/
		/**** md5 signature: 531d20a03e534a771a01b2421460e428 ****/
		%feature("compactdefaultargs") Internals;
		%feature("autodoc", "Access to internal data which have no other access.

Parameters
----------
interp: MoniTool_ValueInterpret
satisf: MoniTool_ValueSatisfies
satisname: char *
enums: NCollection_DataMap<TCollection_AsciiString, int>

Returns
-------
None
") Internals;
		void Internals(MoniTool_ValueInterpret & interp, MoniTool_ValueSatisfies & satisf, const char * & satisname, NCollection_DataMap<TCollection_AsciiString, Standard_Integer> & enums);

		/****************** Interpret ******************/
		/**** md5 signature: 9c6153888caed409cc74bdcaede46f12 ****/
		%feature("compactdefaultargs") Interpret;
		%feature("autodoc", "Interprets a value. <native> true : returns a native value <native> false : returns a coded value if the interpret function is set, calls it else, for an enum, native returns the text, coded returns the number standard returns : = hval means no specific interpretation null means senseless can also be redefined.

Parameters
----------
hval: TCollection_HAsciiString
native: bool

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Interpret;
		virtual opencascade::handle<TCollection_HAsciiString> Interpret(const opencascade::handle<TCollection_HAsciiString> & hval, const Standard_Boolean native);

		/****************** IsSetValue ******************/
		/**** md5 signature: b7211cd65ed84bfd998fea019061883d ****/
		%feature("compactdefaultargs") IsSetValue;
		%feature("autodoc", "Returns true if the value is set (not empty/not null object).

Returns
-------
bool
") IsSetValue;
		Standard_Boolean IsSetValue();

		/****************** Label ******************/
		/**** md5 signature: a2cdaa2c189e4a121892e76566961d64 ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label, if set; else returns an empty string.

Returns
-------
char *
") Label;
		const char * Label();

		/****************** Lib ******************/
		/**** md5 signature: a5d90c5d20ec2688667bfa72e7671bb5 ****/
		%feature("compactdefaultargs") Lib;
		%feature("autodoc", "Returns the typedvalue bound with a given name null handle if none recorded warning : it is the original, not duplicated.

Parameters
----------
def: char *

Returns
-------
opencascade::handle<MoniTool_TypedValue>
") Lib;
		static opencascade::handle<MoniTool_TypedValue> Lib(const char * def);

		/****************** LibList ******************/
		/**** md5 signature: 0d836a3a9b5bd600e3f329f3412de2d0 ****/
		%feature("compactdefaultargs") LibList;
		%feature("autodoc", "Returns the list of names of items of the library of types -- library of typedvalue as valued parameters, -- -- accessed by parameter name for use by management of static parameters.

Returns
-------
opencascade::handle<TColStd_HSequenceOfAsciiString>
") LibList;
		static opencascade::handle<TColStd_HSequenceOfAsciiString> LibList();

		/****************** MaxLength ******************/
		/**** md5 signature: 81402d983184c310a40be9c5c0534e33 ****/
		%feature("compactdefaultargs") MaxLength;
		%feature("autodoc", "Returns the maximum length, 0 if not set.

Returns
-------
int
") MaxLength;
		Standard_Integer MaxLength();

		/****************** Name ******************/
		/**** md5 signature: 2e8cb64f99d00deafae9c92f20b187a2 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name.

Returns
-------
char *
") Name;
		const char * Name();

		/****************** ObjectType ******************/
		/**** md5 signature: 6320624908ef64342bea6f08a015e066 ****/
		%feature("compactdefaultargs") ObjectType;
		%feature("autodoc", "Returns the type of which an object typedvalue must be kind of default is standard_transient null for a typedvalue not an object.

Returns
-------
opencascade::handle<Standard_Type>
") ObjectType;
		opencascade::handle<Standard_Type> ObjectType();

		/****************** ObjectTypeName ******************/
		/**** md5 signature: 117bb5ca131230a9a7bb5829d6593e5b ****/
		%feature("compactdefaultargs") ObjectTypeName;
		%feature("autodoc", "Returns the type name of the objectvalue, or an empty string if not set.

Returns
-------
char *
") ObjectTypeName;
		const char * ObjectTypeName();

		/****************** ObjectValue ******************/
		/**** md5 signature: bd801152e11f117b295705342aad54e1 ****/
		%feature("compactdefaultargs") ObjectValue;
		%feature("autodoc", "Returns the value as transient object, only for object/entity remark that the 'hstring value' is ignored here null if not set; remains to be casted.

Returns
-------
opencascade::handle<Standard_Transient>
") ObjectValue;
		opencascade::handle<Standard_Transient> ObjectValue();

		/****************** Print ******************/
		/**** md5 signature: e569529855b4b5941e18b6562a1d1754 ****/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "Prints definition, specification, and actual status and value.

Parameters
----------
S: Message_Messenger

Returns
-------
None
") Print;
		virtual void Print(const opencascade::handle<Message_Messenger> & S);

		/****************** PrintValue ******************/
		/**** md5 signature: 16d858e8b42369a6f74a41dfb795a25d ****/
		%feature("compactdefaultargs") PrintValue;
		%feature("autodoc", "Prints only the value.

Parameters
----------
S: Message_Messenger

Returns
-------
None
") PrintValue;
		void PrintValue(const opencascade::handle<Message_Messenger> & S);

		/****************** RealLimit ******************/
		/**** md5 signature: 89c72e2e3893a95f4283fcadf76436b4 ****/
		%feature("compactdefaultargs") RealLimit;
		%feature("autodoc", "Gives an real limit (upper if <max> true, lower if <max> false). returns true if this limit is defined, false else (in that case, gives the natural limit for real).

Parameters
----------
max: bool

Returns
-------
val: float
") RealLimit;
		Standard_Boolean RealLimit(const Standard_Boolean max, Standard_Real &OutValue);

		/****************** RealValue ******************/
		/**** md5 signature: 8a0c7a2ab7b53f6fb68a06ec0dbc6aa7 ****/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Returns the value as real, for a real type typedvalue else, returns 0.

Returns
-------
float
") RealValue;
		Standard_Real RealValue();

		/****************** Satisfies ******************/
		/**** md5 signature: 2c6f554b64a4a7ef444a4ba67da8e1ad ****/
		%feature("compactdefaultargs") Satisfies;
		%feature("autodoc", "Returns true if a value statifies the specification (remark : does not apply to entity : see objecttype, for this type, the string is just a comment).

Parameters
----------
hval: TCollection_HAsciiString

Returns
-------
bool
") Satisfies;
		virtual Standard_Boolean Satisfies(const opencascade::handle<TCollection_HAsciiString> & hval);

		/****************** SatisfiesName ******************/
		/**** md5 signature: 4e18cf6cac58b1fda6a5a8dca1a18323 ****/
		%feature("compactdefaultargs") SatisfiesName;
		%feature("autodoc", "Returns name of specific satisfy, empty string if none.

Returns
-------
char *
") SatisfiesName;
		const char * SatisfiesName();

		/****************** SetCStringValue ******************/
		/**** md5 signature: effa6c9216f0b492b4c2e518069e1a90 ****/
		%feature("compactdefaultargs") SetCStringValue;
		%feature("autodoc", "Changes the value. the new one must satisfy the specification returns false (and did not set) if the new value does not satisfy the specification can be redefined to be managed (in a subclass).

Parameters
----------
val: char *

Returns
-------
bool
") SetCStringValue;
		virtual Standard_Boolean SetCStringValue(const char * val);

		/****************** SetDefinition ******************/
		/**** md5 signature: d99e23b341c7f1e3f198dd0f04a36d84 ****/
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "Enforces a definition.

Parameters
----------
deftext: char *

Returns
-------
None
") SetDefinition;
		void SetDefinition(const char * deftext);

		/****************** SetHStringValue ******************/
		/**** md5 signature: de7c62babaa97912ec98c71879a0d8a9 ****/
		%feature("compactdefaultargs") SetHStringValue;
		%feature("autodoc", "Forces a new handle for the value it can be empty, else (if type is not free text), it must satisfy the specification. not only the value is changed, but also the way it is shared remark : for type=object, this value is not controlled, it can be set as a comment returns false (and did not set) if the new value does not satisfy the specification can be redefined to be managed (in a subclass).

Parameters
----------
hval: TCollection_HAsciiString

Returns
-------
bool
") SetHStringValue;
		virtual Standard_Boolean SetHStringValue(const opencascade::handle<TCollection_HAsciiString> & hval);

		/****************** SetIntegerLimit ******************/
		/**** md5 signature: c2135aef222b83c75b2ed3cef848b174 ****/
		%feature("compactdefaultargs") SetIntegerLimit;
		%feature("autodoc", "Sets an integer limit (included) to <val>, the upper limit if <max> is true, the lower limit if <max> is false.

Parameters
----------
max: bool
val: int

Returns
-------
None
") SetIntegerLimit;
		void SetIntegerLimit(const Standard_Boolean max, const Standard_Integer val);

		/****************** SetIntegerValue ******************/
		/**** md5 signature: a4e5fb94cb4abcf21a5f124e8a222979 ****/
		%feature("compactdefaultargs") SetIntegerValue;
		%feature("autodoc", "Changes the value as an integer, only for integer or enum.

Parameters
----------
ival: int

Returns
-------
bool
") SetIntegerValue;
		virtual Standard_Boolean SetIntegerValue(const Standard_Integer ival);

		/****************** SetInterpret ******************/
		/**** md5 signature: dad8a9fad1cc341287c733bfc633d813 ****/
		%feature("compactdefaultargs") SetInterpret;
		%feature("autodoc", "Sets a specific interpret function.

Parameters
----------
func: MoniTool_ValueInterpret

Returns
-------
None
") SetInterpret;
		void SetInterpret(const MoniTool_ValueInterpret func);

		/****************** SetLabel ******************/
		/**** md5 signature: 22a615cc38955b7431d4e25423d6e156 ****/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "Sets a label, which can then be displayed.

Parameters
----------
label: char *

Returns
-------
None
") SetLabel;
		void SetLabel(const char * label);

		/****************** SetMaxLength ******************/
		/**** md5 signature: 056e107e4772026e4004710b692c8026 ****/
		%feature("compactdefaultargs") SetMaxLength;
		%feature("autodoc", "Sets a maximum length for a text (active only for a free text).

Parameters
----------
max: int

Returns
-------
None
") SetMaxLength;
		void SetMaxLength(const Standard_Integer max);

		/****************** SetObjectType ******************/
		/**** md5 signature: d1f10681f04445c832c7a32bc0d6356d ****/
		%feature("compactdefaultargs") SetObjectType;
		%feature("autodoc", "Sets type of which an object typedvalue must be kind of error for a typedvalue not an object (entity).

Parameters
----------
typ: Standard_Type

Returns
-------
None
") SetObjectType;
		void SetObjectType(const opencascade::handle<Standard_Type> & typ);

		/****************** SetObjectValue ******************/
		/**** md5 signature: ce0b84345af23fb6eaecb39ca8367f29 ****/
		%feature("compactdefaultargs") SetObjectValue;
		%feature("autodoc", "Changes the value as transient object, only for object/entity returns false if dynamictype does not satisfy objecttype can be redefined to be managed (in a subclass).

Parameters
----------
obj: Standard_Transient

Returns
-------
bool
") SetObjectValue;
		virtual Standard_Boolean SetObjectValue(const opencascade::handle<Standard_Transient> & obj);

		/****************** SetRealLimit ******************/
		/**** md5 signature: 2c07a42f1fdf96a4266d8c2e6b12deaa ****/
		%feature("compactdefaultargs") SetRealLimit;
		%feature("autodoc", "Sets a real limit (included) to <val>, the upper limit if <max> is true, the lower limit if <max> is false.

Parameters
----------
max: bool
val: float

Returns
-------
None
") SetRealLimit;
		void SetRealLimit(const Standard_Boolean max, const Standard_Real val);

		/****************** SetRealValue ******************/
		/**** md5 signature: 52ebdd0f8213ad1ba5a5b91643f643ec ****/
		%feature("compactdefaultargs") SetRealValue;
		%feature("autodoc", "Changes the value as a real, only for real.

Parameters
----------
rval: float

Returns
-------
bool
") SetRealValue;
		virtual Standard_Boolean SetRealValue(const Standard_Real rval);

		/****************** SetSatisfies ******************/
		/**** md5 signature: 10cbef7ca241ca4eed214bb6602da3f0 ****/
		%feature("compactdefaultargs") SetSatisfies;
		%feature("autodoc", "Sets a specific satisfies function : it is added to the already defined criteria it must match the form : statisfies (val : hasciistring) returns boolean.

Parameters
----------
func: MoniTool_ValueSatisfies
name: char *

Returns
-------
None
") SetSatisfies;
		void SetSatisfies(const MoniTool_ValueSatisfies func, const char * name);

		/****************** SetUnitDef ******************/
		/**** md5 signature: 30b7503e4ee844870c530c56053721a7 ****/
		%feature("compactdefaultargs") SetUnitDef;
		%feature("autodoc", "Sets (clears if <def> empty) a unit definition, as an equation of dimensions. typedvalue just records this definition, does not exploit it, to be done as required by user applications.

Parameters
----------
def: char *

Returns
-------
None
") SetUnitDef;
		void SetUnitDef(const char * def);

		/****************** StartEnum ******************/
		/**** md5 signature: 0ae13a6123edbd6996b53e248a55a112 ****/
		%feature("compactdefaultargs") StartEnum;
		%feature("autodoc", "For an enumeration, precises the starting value (default 0) and the match condition : if true (d), the string value must match the definition, else it may take another value : in that case, the integer value will be start - 1. (empty value remains allowed).

Parameters
----------
start: int,optional
	default value is 0
match: bool,optional
	default value is Standard_True

Returns
-------
None
") StartEnum;
		void StartEnum(const Standard_Integer start = 0, const Standard_Boolean match = Standard_True);

		/****************** StaticValue ******************/
		/**** md5 signature: bf5bcf8a5edc5bdc063e75ea7956dd93 ****/
		%feature("compactdefaultargs") StaticValue;
		%feature("autodoc", "Returns a static value from its name, null if unknown.

Parameters
----------
name: char *

Returns
-------
opencascade::handle<MoniTool_TypedValue>
") StaticValue;
		static opencascade::handle<MoniTool_TypedValue> StaticValue(const char * name);

		/****************** UnitDef ******************/
		/**** md5 signature: 61b7bdf19530e233fa3664a070cf6b90 ****/
		%feature("compactdefaultargs") UnitDef;
		%feature("autodoc", "Returns the recorded unit definition, empty if not set.

Returns
-------
char *
") UnitDef;
		const char * UnitDef();

		/****************** ValueType ******************/
		/**** md5 signature: a2b700590fb8f925c50c498db15aa421 ****/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "Returns the type of the value.

Returns
-------
MoniTool_ValueType
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
		/****************** MoniTool_SignShape ******************/
		/**** md5 signature: 92586a12e018f443c7cbb07692c130a0 ****/
		%feature("compactdefaultargs") MoniTool_SignShape;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MoniTool_SignShape;
		 MoniTool_SignShape();

		/****************** Name ******************/
		/**** md5 signature: f35e373630f40191cc40cd61094fa98a ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns 'shape'.

Returns
-------
char *
") Name;
		const char * Name();

		/****************** Text ******************/
		/**** md5 signature: 44c44c56f0e9da4d892db26a3852e369 ****/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Returns for a hshape, the string of its shapeenum the model is absolutely useless (may be null).

Parameters
----------
ent: Standard_Transient
context: Standard_Transient

Returns
-------
TCollection_AsciiString
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
		/****************** MoniTool_TransientElem ******************/
		/**** md5 signature: 209dc6e58c11d349eee7b18ee202941d ****/
		%feature("compactdefaultargs") MoniTool_TransientElem;
		%feature("autodoc", "Creates a transientelem with a value. this value can then not be changed. it is used by the hasher to compute the hashcode, which will then be stored for an immediate reading.

Parameters
----------
akey: Standard_Transient

Returns
-------
None
") MoniTool_TransientElem;
		 MoniTool_TransientElem(const opencascade::handle<Standard_Transient> & akey);

		/****************** Equates ******************/
		/**** md5 signature: 37e72bdf003bc234f02a6795d9820def ****/
		%feature("compactdefaultargs") Equates;
		%feature("autodoc", "Specific testof equallity : defined as false if <other> has not the same true type, else contents are compared (by c++ operator ==).

Parameters
----------
other: MoniTool_Element

Returns
-------
bool
") Equates;
		Standard_Boolean Equates(const opencascade::handle<MoniTool_Element> & other);

		/****************** Value ******************/
		/**** md5 signature: b1443f8da90189a74241bf586c57fc63 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the contained value.

Returns
-------
opencascade::handle<Standard_Transient>
") Value;
		const opencascade::handle<Standard_Transient> & Value();

		/****************** ValueType ******************/
		/**** md5 signature: 40aa6e907b5cbe34817c19e20e6dde6e ****/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "Returns the type of the value. by default, returns the dynamictype of <self>, but can be redefined.

Returns
-------
opencascade::handle<Standard_Type>
") ValueType;
		virtual opencascade::handle<Standard_Type> ValueType();

		/****************** ValueTypeName ******************/
		/**** md5 signature: d49d824d6a98cbb182d37bee73d4be07 ****/
		%feature("compactdefaultargs") ValueTypeName;
		%feature("autodoc", "Returns the name of the type of the value. default is name of valuetype, unless it is for a non-handled object.

Returns
-------
char *
") ValueTypeName;
		virtual const char * ValueTypeName();

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


