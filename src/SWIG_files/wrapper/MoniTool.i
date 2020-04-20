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
		%feature("compactdefaultargs") MoniTool_AttrList;
		%feature("autodoc", "Creates an attrlist, empty.

Returns
-------
None
") MoniTool_AttrList;
		 MoniTool_AttrList();

		/****************** MoniTool_AttrList ******************/
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
		%feature("compactdefaultargs") AttrList;
		%feature("autodoc", "Returns the exhaustive list of attributes.

Returns
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>
") AttrList;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & AttrList();

		/****************** Attribute ******************/
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
		%feature("compactdefaultargs") CaseId;
		%feature("autodoc", "Returns the caseid.

Returns
-------
char *
") CaseId;
		const char * CaseId();

		/****************** Data ******************/
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
		%feature("compactdefaultargs") GetCPU;
		%feature("autodoc", "Returns the current amount of cpu this allows to laterly test and record cpu amount its value has to be given to largecpu and addcpu.

Returns
-------
float
") GetCPU;
		Standard_Real GetCPU();

		/****************** GetData ******************/
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
		%feature("compactdefaultargs") IsCheck;
		%feature("autodoc", "Tells if <self> is check (warning or fail), else it is info.

Returns
-------
bool
") IsCheck;
		Standard_Boolean IsCheck();

		/****************** IsFail ******************/
		%feature("compactdefaultargs") IsFail;
		%feature("autodoc", "Tells if <self> is fail.

Returns
-------
bool
") IsFail;
		Standard_Boolean IsFail();

		/****************** IsWarning ******************/
		%feature("compactdefaultargs") IsWarning;
		%feature("autodoc", "Tells if <self> is warning.

Returns
-------
bool
") IsWarning;
		Standard_Boolean IsWarning();

		/****************** Kind ******************/
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
		%feature("compactdefaultargs") Msg;
		%feature("autodoc", "Returns a msg from a casedata : it is build from defmsg, which gives the message code plus the designation of items of the casedata to be added to the msg empty if no message attached //! remains to be implemented.

Returns
-------
Message_Msg
") Msg;
		Message_Msg Msg();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name.

Returns
-------
char *
") Name;
		const char * Name();

		/****************** Name ******************/
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
		%feature("compactdefaultargs") NbData;
		%feature("autodoc", "Returns the count of data recorded to a set.

Returns
-------
int
") NbData;
		Standard_Integer NbData();

		/****************** Real ******************/
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
		%feature("compactdefaultargs") ResetCheck;
		%feature("autodoc", "Resets check status, i.e. sets <self> as info.

Returns
-------
None
") ResetCheck;
		void ResetCheck();

		/****************** SetCaseId ******************/
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
		%feature("compactdefaultargs") SetChange;
		%feature("autodoc", "Sets the next add... not to add but to change the data item designated by its name. if next add... is not called with a name, setchange is ignored reset by next add... , whatever <num> is correct or not.

Returns
-------
None
") SetChange;
		void SetChange();

		/****************** SetDefFail ******************/
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
		%feature("compactdefaultargs") SetFail;
		%feature("autodoc", "Sets <self> as fail.

Returns
-------
None
") SetFail;
		void SetFail();

		/****************** SetName ******************/
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
		%feature("compactdefaultargs") SetWarning;
		%feature("autodoc", "Sets <self> as warning.

Returns
-------
None
") SetWarning;
		void SetWarning();

		/****************** Shape ******************/
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
		%feature("compactdefaultargs") ChangeAttr;
		%feature("autodoc", "Returns (modifiable) the attribute list.

Returns
-------
MoniTool_AttrList
") ChangeAttr;
		MoniTool_AttrList & ChangeAttr();

		/****************** Equates ******************/
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
		%feature("compactdefaultargs") GetHashCode;
		%feature("autodoc", "Returns the hashcode which has been stored by sethashcode (remark that hashcode could be deferred then be defined by sub-classes, the result is the same).

Returns
-------
int
") GetHashCode;
		Standard_Integer GetHashCode();

		/****************** ListAttr ******************/
		%feature("compactdefaultargs") ListAttr;
		%feature("autodoc", "Returns (readonly) the attribute list.

Returns
-------
MoniTool_AttrList
") ListAttr;
		const MoniTool_AttrList & ListAttr();

		/****************** ValueType ******************/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "Returns the type of the value. by default, returns the dynamictype of <self>, but can be redefined.

Returns
-------
opencascade::handle<Standard_Type>
") ValueType;
		virtual opencascade::handle<Standard_Type> ValueType();

		/****************** ValueTypeName ******************/
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
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns an identification of the signature (a word), given at initialization time.

Returns
-------
char *
") Name;
		virtual const char * Name();

		/****************** Text ******************/
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
		%feature("compactdefaultargs") AddEnd;
		%feature("autodoc", "Ends the addsub and cumulates the sub-count to current level.

Returns
-------
None
") AddEnd;
		void AddEnd();

		/****************** AddSub ******************/
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
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "No available documentation.

Returns
-------
MoniTool_Stat
") Current;
		static MoniTool_Stat & Current();

		/****************** Level ******************/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Level;
		Standard_Integer Level();

		/****************** Open ******************/
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
		%feature("compactdefaultargs") MoniTool_Timer;
		%feature("autodoc", "Create timer in empty state.

Returns
-------
None
") MoniTool_Timer;
		 MoniTool_Timer();

		/****************** Amend ******************/
		%feature("compactdefaultargs") Amend;
		%feature("autodoc", "Return value of accumulated amendment on cpu time.

Returns
-------
float
") Amend;
		Standard_Real Amend();

		/****************** CPU ******************/
		%feature("compactdefaultargs") CPU;
		%feature("autodoc", "Return value of cpu time minus accumulated amendment.

Returns
-------
float
") CPU;
		Standard_Real CPU();

		/****************** ClearTimers ******************/
		%feature("compactdefaultargs") ClearTimers;
		%feature("autodoc", "Clears map of timers.

Returns
-------
None
") ClearTimers;
		static void ClearTimers();

		/****************** ComputeAmendments ******************/
		%feature("compactdefaultargs") ComputeAmendments;
		%feature("autodoc", "Computes and remembers amendments for times to access, start, and stop of timer, and estimates second-order error measured by 10 nested timers.

Returns
-------
None
") ComputeAmendments;
		static void ComputeAmendments();

		/****************** Count ******************/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "Return value of hits counter (count of start/stop pairs).

Returns
-------
int
") Count;
		Standard_Integer Count();

		/****************** Dictionary ******************/
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
		%feature("compactdefaultargs") IsRunning;
		%feature("autodoc", "Returns value of nesting counter.

Returns
-------
int
") IsRunning;
		Standard_Integer IsRunning();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Start, stop and reset the timer in addition to doing that to embedded osd_timer, manage also counter of hits.

Returns
-------
None
") Reset;
		void Reset();

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Start;
		void Start();

		/****************** Start ******************/
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
		%feature("compactdefaultargs") Stop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Stop;
		void Stop();

		/****************** Stop ******************/
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
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", "No available documentation.

Returns
-------
OSD_Timer
") Timer;
		const OSD_Timer & Timer();

		/****************** Timer ******************/
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", "Return reference to embedded osd_timer.

Returns
-------
OSD_Timer
") Timer;
		OSD_Timer & Timer();

		/****************** Timer ******************/
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
		%feature("compactdefaultargs") Stop;
		%feature("autodoc", "Manually stops the timer.

Returns
-------
None
") Stop;
		void Stop();

		/****************** Timer ******************/
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
		%feature("compactdefaultargs") CStringValue;
		%feature("autodoc", "Returns the value, as a cstring. empty if not set.

Returns
-------
char *
") CStringValue;
		const char * CStringValue();

		/****************** ClearValue ******************/
		%feature("compactdefaultargs") ClearValue;
		%feature("autodoc", "Clears the recorded value : it is now unset.

Returns
-------
None
") ClearValue;
		void ClearValue();

		/****************** Definition ******************/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "Returns the definition by priority, the enforced one, else an automatic one, computed from the specification.

Returns
-------
TCollection_AsciiString
") Definition;
		TCollection_AsciiString Definition();

		/****************** EnumCase ******************/
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
		%feature("compactdefaultargs") HStringValue;
		%feature("autodoc", "Returns the value, as a handle (can then be shared) null if not defined.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") HStringValue;
		opencascade::handle<TCollection_HAsciiString> HStringValue();

		/****************** HasInterpret ******************/
		%feature("compactdefaultargs") HasInterpret;
		%feature("autodoc", "Tells if a typedvalue has an interpret.

Returns
-------
bool
") HasInterpret;
		virtual Standard_Boolean HasInterpret();

		/****************** IntegerLimit ******************/
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
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "Returns the value as integer, i.e. : for type = integer, the integer itself; 0 if not set for type = enum, the designated rank (see enum definition) startenum - 1 if not set or not in the definition else, returns 0.

Returns
-------
int
") IntegerValue;
		Standard_Integer IntegerValue();

		/****************** Internals ******************/
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
		%feature("compactdefaultargs") IsSetValue;
		%feature("autodoc", "Returns true if the value is set (not empty/not null object).

Returns
-------
bool
") IsSetValue;
		Standard_Boolean IsSetValue();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label, if set; else returns an empty string.

Returns
-------
char *
") Label;
		const char * Label();

		/****************** Lib ******************/
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
		%feature("compactdefaultargs") LibList;
		%feature("autodoc", "Returns the list of names of items of the library of types -- library of typedvalue as valued parameters, -- -- accessed by parameter name for use by management of static parameters.

Returns
-------
opencascade::handle<TColStd_HSequenceOfAsciiString>
") LibList;
		static opencascade::handle<TColStd_HSequenceOfAsciiString> LibList();

		/****************** MaxLength ******************/
		%feature("compactdefaultargs") MaxLength;
		%feature("autodoc", "Returns the maximum length, 0 if not set.

Returns
-------
int
") MaxLength;
		Standard_Integer MaxLength();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name.

Returns
-------
char *
") Name;
		const char * Name();

		/****************** ObjectType ******************/
		%feature("compactdefaultargs") ObjectType;
		%feature("autodoc", "Returns the type of which an object typedvalue must be kind of default is standard_transient null for a typedvalue not an object.

Returns
-------
opencascade::handle<Standard_Type>
") ObjectType;
		opencascade::handle<Standard_Type> ObjectType();

		/****************** ObjectTypeName ******************/
		%feature("compactdefaultargs") ObjectTypeName;
		%feature("autodoc", "Returns the type name of the objectvalue, or an empty string if not set.

Returns
-------
char *
") ObjectTypeName;
		const char * ObjectTypeName();

		/****************** ObjectValue ******************/
		%feature("compactdefaultargs") ObjectValue;
		%feature("autodoc", "Returns the value as transient object, only for object/entity remark that the 'hstring value' is ignored here null if not set; remains to be casted.

Returns
-------
opencascade::handle<Standard_Transient>
") ObjectValue;
		opencascade::handle<Standard_Transient> ObjectValue();

		/****************** Print ******************/
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
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Returns the value as real, for a real type typedvalue else, returns 0.

Returns
-------
float
") RealValue;
		Standard_Real RealValue();

		/****************** Satisfies ******************/
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
		%feature("compactdefaultargs") SatisfiesName;
		%feature("autodoc", "Returns name of specific satisfy, empty string if none.

Returns
-------
char *
") SatisfiesName;
		const char * SatisfiesName();

		/****************** SetCStringValue ******************/
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
		%feature("compactdefaultargs") UnitDef;
		%feature("autodoc", "Returns the recorded unit definition, empty if not set.

Returns
-------
char *
") UnitDef;
		const char * UnitDef();

		/****************** ValueType ******************/
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
		%feature("compactdefaultargs") MoniTool_SignShape;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MoniTool_SignShape;
		 MoniTool_SignShape();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns 'shape'.

Returns
-------
char *
") Name;
		const char * Name();

		/****************** Text ******************/
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
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the contained value.

Returns
-------
opencascade::handle<Standard_Transient>
") Value;
		const opencascade::handle<Standard_Transient> & Value();

		/****************** ValueType ******************/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "Returns the type of the value. by default, returns the dynamictype of <self>, but can be redefined.

Returns
-------
opencascade::handle<Standard_Type>
") ValueType;
		virtual opencascade::handle<Standard_Type> ValueType();

		/****************** ValueTypeName ******************/
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


