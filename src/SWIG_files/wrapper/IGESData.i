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
%define IGESDATADOCSTRING
"IGESData module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_igesdata.html"
%enddef
%module (package="OCC.Core", docstring=IGESDATADOCSTRING) IGESData


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
#include<IGESData_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Interface_module.hxx>
#include<TCollection_module.hxx>
#include<gp_module.hxx>
#include<Message_module.hxx>
#include<TColStd_module.hxx>
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
%import gp.i
%import Message.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum IGESData_ReadStage {
	IGESData_ReadDir = 0,
	IGESData_ReadOwn = 1,
	IGESData_ReadAssocs = 2,
	IGESData_ReadProps = 3,
	IGESData_ReadEnd = 4,
};

enum IGESData_DefList {
	IGESData_DefNone = 0,
	IGESData_DefOne = 1,
	IGESData_DefSeveral = 2,
	IGESData_ErrorOne = 3,
	IGESData_ErrorSeveral = 4,
};

enum IGESData_Status {
	IGESData_EntityOK = 0,
	IGESData_EntityError = 1,
	IGESData_ReferenceError = 2,
	IGESData_TypeError = 3,
};

enum IGESData_DefType {
	IGESData_DefVoid = 0,
	IGESData_DefValue = 1,
	IGESData_DefReference = 2,
	IGESData_DefAny = 3,
	IGESData_ErrorVal = 4,
	IGESData_ErrorRef = 5,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class IGESData_ReadStage(IntEnum):
	IGESData_ReadDir = 0
	IGESData_ReadOwn = 1
	IGESData_ReadAssocs = 2
	IGESData_ReadProps = 3
	IGESData_ReadEnd = 4
IGESData_ReadDir = IGESData_ReadStage.IGESData_ReadDir
IGESData_ReadOwn = IGESData_ReadStage.IGESData_ReadOwn
IGESData_ReadAssocs = IGESData_ReadStage.IGESData_ReadAssocs
IGESData_ReadProps = IGESData_ReadStage.IGESData_ReadProps
IGESData_ReadEnd = IGESData_ReadStage.IGESData_ReadEnd

class IGESData_DefList(IntEnum):
	IGESData_DefNone = 0
	IGESData_DefOne = 1
	IGESData_DefSeveral = 2
	IGESData_ErrorOne = 3
	IGESData_ErrorSeveral = 4
IGESData_DefNone = IGESData_DefList.IGESData_DefNone
IGESData_DefOne = IGESData_DefList.IGESData_DefOne
IGESData_DefSeveral = IGESData_DefList.IGESData_DefSeveral
IGESData_ErrorOne = IGESData_DefList.IGESData_ErrorOne
IGESData_ErrorSeveral = IGESData_DefList.IGESData_ErrorSeveral

class IGESData_Status(IntEnum):
	IGESData_EntityOK = 0
	IGESData_EntityError = 1
	IGESData_ReferenceError = 2
	IGESData_TypeError = 3
IGESData_EntityOK = IGESData_Status.IGESData_EntityOK
IGESData_EntityError = IGESData_Status.IGESData_EntityError
IGESData_ReferenceError = IGESData_Status.IGESData_ReferenceError
IGESData_TypeError = IGESData_Status.IGESData_TypeError

class IGESData_DefType(IntEnum):
	IGESData_DefVoid = 0
	IGESData_DefValue = 1
	IGESData_DefReference = 2
	IGESData_DefAny = 3
	IGESData_ErrorVal = 4
	IGESData_ErrorRef = 5
IGESData_DefVoid = IGESData_DefType.IGESData_DefVoid
IGESData_DefValue = IGESData_DefType.IGESData_DefValue
IGESData_DefReference = IGESData_DefType.IGESData_DefReference
IGESData_DefAny = IGESData_DefType.IGESData_DefAny
IGESData_ErrorVal = IGESData_DefType.IGESData_ErrorVal
IGESData_ErrorRef = IGESData_DefType.IGESData_ErrorRef
};
/* end python proxy for enums */

/* handles */
%wrap_handle(IGESData_FileRecognizer)
%wrap_handle(IGESData_GeneralModule)
%wrap_handle(IGESData_GlobalNodeOfSpecificLib)
%wrap_handle(IGESData_GlobalNodeOfWriterLib)
%wrap_handle(IGESData_IGESEntity)
%wrap_handle(IGESData_IGESModel)
%wrap_handle(IGESData_IGESReaderData)
%wrap_handle(IGESData_NodeOfSpecificLib)
%wrap_handle(IGESData_NodeOfWriterLib)
%wrap_handle(IGESData_Protocol)
%wrap_handle(IGESData_ReadWriteModule)
%wrap_handle(IGESData_SpecificModule)
%wrap_handle(IGESData_ToolLocation)
%wrap_handle(IGESData_ColorEntity)
%wrap_handle(IGESData_DefaultGeneral)
%wrap_handle(IGESData_DefaultSpecific)
%wrap_handle(IGESData_FileProtocol)
%wrap_handle(IGESData_LabelDisplayEntity)
%wrap_handle(IGESData_LevelListEntity)
%wrap_handle(IGESData_LineFontEntity)
%wrap_handle(IGESData_NameEntity)
%wrap_handle(IGESData_SingleParentEntity)
%wrap_handle(IGESData_TransfEntity)
%wrap_handle(IGESData_UndefinedEntity)
%wrap_handle(IGESData_ViewKindEntity)
%wrap_handle(IGESData_FreeFormatEntity)
%wrap_handle(IGESData_HArray1OfIGESEntity)
/* end handles declaration */

/* templates */
%template(IGESData_Array1OfDirPart) NCollection_Array1<IGESData_DirPart>;

%extend NCollection_Array1<IGESData_DirPart> {
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
%template(IGESData_Array1OfIGESEntity) NCollection_Array1<opencascade::handle<IGESData_IGESEntity>>;

%extend NCollection_Array1<opencascade::handle<IGESData_IGESEntity>> {
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
typedef NCollection_Array1<IGESData_DirPart> IGESData_Array1OfDirPart;
typedef NCollection_Array1<opencascade::handle<IGESData_IGESEntity>> IGESData_Array1OfIGESEntity;
/* end typedefs declaration */

/*****************
* class IGESData *
*****************/
%rename(igesdata) IGESData;
class IGESData {
	public:
		/****************** Init ******************/
		/**** md5 signature: 342fdccc4643f67c269591c4b6447108 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Prepares general dynamic data used for igesdata specifically : protocol and modules, which treat undefinedentity.

Returns
-------
None
") Init;
		static void Init();

		/****************** Protocol ******************/
		/**** md5 signature: 8a9c9a99eb867595c62ccd2ff8ac3085 ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns a protocol from igesdata (avoids to create it).

Returns
-------
opencascade::handle<IGESData_Protocol>
") Protocol;
		static opencascade::handle<IGESData_Protocol> Protocol();

};


%extend IGESData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESData_BasicEditor *
*****************************/
class IGESData_BasicEditor {
	public:
		/****************** IGESData_BasicEditor ******************/
		/**** md5 signature: 327fd70db3e704a104f04e824b44586e ****/
		%feature("compactdefaultargs") IGESData_BasicEditor;
		%feature("autodoc", "Creates an empty basic editor which should be initialized via init() method.

Returns
-------
None
") IGESData_BasicEditor;
		 IGESData_BasicEditor();

		/****************** IGESData_BasicEditor ******************/
		/**** md5 signature: cbabbfbad46474af21b1e08250607152 ****/
		%feature("compactdefaultargs") IGESData_BasicEditor;
		%feature("autodoc", "Creates a basic editor, with a new igesmodel, ready to run.

Parameters
----------
protocol: IGESData_Protocol

Returns
-------
None
") IGESData_BasicEditor;
		 IGESData_BasicEditor(const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** IGESData_BasicEditor ******************/
		/**** md5 signature: 6a3ffbe282aef9f8d02ee27afb7a6345 ****/
		%feature("compactdefaultargs") IGESData_BasicEditor;
		%feature("autodoc", "Creates a basic editor for iges data, ready to run.

Parameters
----------
model: IGESData_IGESModel
protocol: IGESData_Protocol

Returns
-------
None
") IGESData_BasicEditor;
		 IGESData_BasicEditor(const opencascade::handle<IGESData_IGESModel> & model, const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** ApplyUnit ******************/
		/**** md5 signature: 8fe231964ac1b98c4fad899bda384896 ****/
		%feature("compactdefaultargs") ApplyUnit;
		%feature("autodoc", "Applies unit value to convert header data : resolution, maxcoord, maxlineweight applies unit only once after setunit... has been called, if <enforce> is given as true. it can be called just before writing the model to a file, i.e. when definitive values are finally known.

Parameters
----------
enforce: bool,optional
	default value is Standard_False

Returns
-------
None
") ApplyUnit;
		void ApplyUnit(const Standard_Boolean enforce = Standard_False);

		/****************** AutoCorrect ******************/
		/**** md5 signature: ddc81d34506a37c11b7cd4d98642359a ****/
		%feature("compactdefaultargs") AutoCorrect;
		%feature("autodoc", "Performs auto-correction on an igesentity returns true if something has changed, false if nothing done. //! works with the specific iges services : dirchecker which allows to correct data in 'directory part' of entities (such as required values for status, or references to be null), and the specific iges service owncorrect, which is specialised for each type of entity.

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
bool
") AutoCorrect;
		Standard_Boolean AutoCorrect(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** AutoCorrectModel ******************/
		/**** md5 signature: fe46979c4f008825d0446287edc6ede7 ****/
		%feature("compactdefaultargs") AutoCorrectModel;
		%feature("autodoc", "Performs auto-correction on the whole model returns the count of modified entities.

Returns
-------
int
") AutoCorrectModel;
		Standard_Integer AutoCorrectModel();

		/****************** ComputeStatus ******************/
		/**** md5 signature: 94562276d7c280fff250ec7d0fc92e38 ****/
		%feature("compactdefaultargs") ComputeStatus;
		%feature("autodoc", "Performs the re-computation of status on the whole model (subordinate status and use flag of each iges entity), which can have required values according the way they are referenced (see definitions of logical use, physical use, etc...).

Returns
-------
None
") ComputeStatus;
		void ComputeStatus();

		/****************** DraftingMax ******************/
		/**** md5 signature: f35c54843eec6e8da4952db2c47da562 ****/
		%feature("compactdefaultargs") DraftingMax;
		%feature("autodoc", "Returns the maximum allowed value for drafting flag.

Returns
-------
int
") DraftingMax;
		static Standard_Integer DraftingMax();

		/****************** DraftingName ******************/
		/**** md5 signature: 7da09edb2042516a3d00c5651aac3cb9 ****/
		%feature("compactdefaultargs") DraftingName;
		%feature("autodoc", "From the flag of drafting standard, returns name, '' if incorrect.

Parameters
----------
flag: int

Returns
-------
char *
") DraftingName;
		static const char * DraftingName(const Standard_Integer flag);

		/****************** IGESVersionMax ******************/
		/**** md5 signature: 019f789bb05d370b5b7bd697923db3e3 ****/
		%feature("compactdefaultargs") IGESVersionMax;
		%feature("autodoc", "Returns the maximum allowed value for igesversion flag.

Returns
-------
int
") IGESVersionMax;
		static Standard_Integer IGESVersionMax();

		/****************** IGESVersionName ******************/
		/**** md5 signature: 6707df18996b6c7800bb7770cd0d9e60 ****/
		%feature("compactdefaultargs") IGESVersionName;
		%feature("autodoc", "From the flag of iges version, returns name, '' if incorrect.

Parameters
----------
flag: int

Returns
-------
char *
") IGESVersionName;
		static const char * IGESVersionName(const Standard_Integer flag);

		/****************** Init ******************/
		/**** md5 signature: 97f796e95dfea5372a999aeb34b6facb ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize a basic editor, with a new igesmodel, ready to run.

Parameters
----------
protocol: IGESData_Protocol

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** Init ******************/
		/**** md5 signature: 0ec823f6aae24ecd06ffcd5db568ee3b ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize a basic editor for iges data, ready to run.

Parameters
----------
model: IGESData_IGESModel
protocol: IGESData_Protocol

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_IGESModel> & model, const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** Model ******************/
		/**** md5 signature: 4b3130e3b28afba6f0c58ab4875c4253 ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the designated model.

Returns
-------
opencascade::handle<IGESData_IGESModel>
") Model;
		opencascade::handle<IGESData_IGESModel> Model();

		/****************** SetUnitFlag ******************/
		/**** md5 signature: 4666c28aaeb01c53577f0d10abec466c ****/
		%feature("compactdefaultargs") SetUnitFlag;
		%feature("autodoc", "Sets a new unit from its flag (param 14 of global section) returns true if done, false if <flag> is incorrect.

Parameters
----------
flag: int

Returns
-------
bool
") SetUnitFlag;
		Standard_Boolean SetUnitFlag(const Standard_Integer flag);

		/****************** SetUnitName ******************/
		/**** md5 signature: 883d858a01f10271707c017537c8f9e0 ****/
		%feature("compactdefaultargs") SetUnitName;
		%feature("autodoc", "Sets a new unit from its name (param 15 of global section) returns true if done, false if <name> is incorrect remark : if <flag> has been set to 3 (user defined), <name> is then free.

Parameters
----------
name: char *

Returns
-------
bool
") SetUnitName;
		Standard_Boolean SetUnitName(const char * name);

		/****************** SetUnitValue ******************/
		/**** md5 signature: 4bccc95d28117974dc630c9e1c105787 ****/
		%feature("compactdefaultargs") SetUnitValue;
		%feature("autodoc", "Sets a new unit from its value in meters (rounded to the closest one, max gap 1%) returns true if done, false if <val> is too far from a suitable value.

Parameters
----------
val: float

Returns
-------
bool
") SetUnitValue;
		Standard_Boolean SetUnitValue(const Standard_Real val);

		/****************** UnitFlagName ******************/
		/**** md5 signature: f037d925469445a27c723e8210ab23f7 ****/
		%feature("compactdefaultargs") UnitFlagName;
		%feature("autodoc", "From the flag of unit, determines its name, '' if incorrect.

Parameters
----------
flag: int

Returns
-------
char *
") UnitFlagName;
		static const char * UnitFlagName(const Standard_Integer flag);

		/****************** UnitFlagValue ******************/
		/**** md5 signature: b4467742c6222d78be1cf6dd2ed0ead4 ****/
		%feature("compactdefaultargs") UnitFlagValue;
		%feature("autodoc", "From the flag of unit, determines value in mm, 0 if incorrect.

Parameters
----------
flag: int

Returns
-------
float
") UnitFlagValue;
		static Standard_Real UnitFlagValue(const Standard_Integer flag);

		/****************** UnitNameFlag ******************/
		/**** md5 signature: 8b4c418e38975e78606ce25137dbbc7a ****/
		%feature("compactdefaultargs") UnitNameFlag;
		%feature("autodoc", "From the name of unit, computes flag number, 0 if incorrect (in this case, user defined entity remains possible).

Parameters
----------
name: char *

Returns
-------
int
") UnitNameFlag;
		static Standard_Integer UnitNameFlag(const char * name);

};


%extend IGESData_BasicEditor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESData_DefSwitch *
***************************/
class IGESData_DefSwitch {
	public:
		/****************** IGESData_DefSwitch ******************/
		/**** md5 signature: d3b2a0c20411fcd2ac4b38bce2cbe41a ****/
		%feature("compactdefaultargs") IGESData_DefSwitch;
		%feature("autodoc", "Creates a defswitch as void.

Returns
-------
None
") IGESData_DefSwitch;
		 IGESData_DefSwitch();

		/****************** DefType ******************/
		/**** md5 signature: 94a8946e12d430118ffd983fbb99771c ****/
		%feature("compactdefaultargs") DefType;
		%feature("autodoc", "Returns deftype status (void,reference,rank).

Returns
-------
IGESData_DefType
") DefType;
		IGESData_DefType DefType();

		/****************** SetRank ******************/
		/**** md5 signature: 44ed77fcf7fd7933eabfca8ff08d9959 ****/
		%feature("compactdefaultargs") SetRank;
		%feature("autodoc", "Sets defswitch to 'rank' with a value (in file : integer > 0).

Parameters
----------
val: int

Returns
-------
None
") SetRank;
		void SetRank(const Standard_Integer val);

		/****************** SetReference ******************/
		/**** md5 signature: af9ec8d5348700121a982909f4b03eb8 ****/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "Sets defswitch to 'reference' status (in file : integer < 0).

Returns
-------
None
") SetReference;
		void SetReference();

		/****************** SetVoid ******************/
		/**** md5 signature: 4dd4a6d3caec420ced25c8de0d4bb003 ****/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Sets defswitch to 'void' status (in file : integer = 0).

Returns
-------
None
") SetVoid;
		void SetVoid();

		/****************** Value ******************/
		/**** md5 signature: c6d99989077b92200f0377d8b792ba0b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns value as integer (sensefull for a rank).

Returns
-------
int
") Value;
		Standard_Integer Value();

};


%extend IGESData_DefSwitch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESData_DirChecker *
****************************/
class IGESData_DirChecker {
	public:
		/****************** IGESData_DirChecker ******************/
		/**** md5 signature: a60271ae4d73e74f5d182f82110ade55 ****/
		%feature("compactdefaultargs") IGESData_DirChecker;
		%feature("autodoc", "Returns a dirchecker, with no criterium at all to be checked.

Returns
-------
None
") IGESData_DirChecker;
		 IGESData_DirChecker();

		/****************** IGESData_DirChecker ******************/
		/**** md5 signature: 5f4208006c542f7010d7e96226a02e55 ****/
		%feature("compactdefaultargs") IGESData_DirChecker;
		%feature("autodoc", "Returns a dirchecker, with no criterium except required type.

Parameters
----------
atype: int

Returns
-------
None
") IGESData_DirChecker;
		 IGESData_DirChecker(const Standard_Integer atype);

		/****************** IGESData_DirChecker ******************/
		/**** md5 signature: 62a3adf07791971adde9112fe96133dd ****/
		%feature("compactdefaultargs") IGESData_DirChecker;
		%feature("autodoc", "Returns a dirchecker, with no criterium except required values for type and form numbers.

Parameters
----------
atype: int
aform: int

Returns
-------
None
") IGESData_DirChecker;
		 IGESData_DirChecker(const Standard_Integer atype, const Standard_Integer aform);

		/****************** IGESData_DirChecker ******************/
		/**** md5 signature: 728f4d8dba5b36b6d46e1a9639b46105 ****/
		%feature("compactdefaultargs") IGESData_DirChecker;
		%feature("autodoc", "Returns a dirchecker, with no criterium except required values for type number (atype), and required range for form number (which must be between aform1 and aform2 included).

Parameters
----------
atype: int
aform1: int
aform2: int

Returns
-------
None
") IGESData_DirChecker;
		 IGESData_DirChecker(const Standard_Integer atype, const Standard_Integer aform1, const Standard_Integer aform2);

		/****************** BlankStatusIgnored ******************/
		/**** md5 signature: a019c00f20a6cff66cc4b0ca7ef773d4 ****/
		%feature("compactdefaultargs") BlankStatusIgnored;
		%feature("autodoc", "Sets blank status to be ignored (should not be defined, or its value should be 0).

Returns
-------
None
") BlankStatusIgnored;
		void BlankStatusIgnored();

		/****************** BlankStatusRequired ******************/
		/**** md5 signature: 27e4ded994f1b0d164c651d44a4f46c4 ****/
		%feature("compactdefaultargs") BlankStatusRequired;
		%feature("autodoc", "Sets blank status to be required at a given value.

Parameters
----------
val: int

Returns
-------
None
") BlankStatusRequired;
		void BlankStatusRequired(const Standard_Integer val);

		/****************** Check ******************/
		/**** md5 signature: f4f6d84244833174e19286de6b5f3957 ****/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Performs the checks on an igesentity, according to the recorded criteria in addition, does minimal checks, such as admitted range for status, or presence of error status in some data (color, ...).

Parameters
----------
ach: Interface_Check
ent: IGESData_IGESEntity

Returns
-------
None
") Check;
		void Check(opencascade::handle<Interface_Check> & ach, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** CheckTypeAndForm ******************/
		/**** md5 signature: 2f3208893eeb87f52c120823b4e87c08 ****/
		%feature("compactdefaultargs") CheckTypeAndForm;
		%feature("autodoc", "Performs a check only on values of type number and form number this allows to do a check on an entity not yet completely filled but of which type and form number have been already set.

Parameters
----------
ach: Interface_Check
ent: IGESData_IGESEntity

Returns
-------
None
") CheckTypeAndForm;
		void CheckTypeAndForm(opencascade::handle<Interface_Check> & ach, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** Color ******************/
		/**** md5 signature: be280ceff4b96fd3bfafc81982428c90 ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Sets color criterium if crit is defvoid, ignored : should not be defined if crit is defany, required : must be defined (value or ref) other values are not taken in account.

Parameters
----------
crit: IGESData_DefType

Returns
-------
None
") Color;
		void Color(const IGESData_DefType crit);

		/****************** Correct ******************/
		/**** md5 signature: 9d2c2c88b925135509e528153f6a1f2c ****/
		%feature("compactdefaultargs") Correct;
		%feature("autodoc", "Corrects the directory entry of an iges entity as far as it is possible according recorded criteria without any ambiguity : - if a numeric status is required a given value, this value is enforced - if an item is required to be void, or if it recorded as erroneous, it is cleared (set to void) - type number is enforced - finally form number is enforced only if one and only value is admitted (no range, see constructors of dirchecker).

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
bool
") Correct;
		Standard_Boolean Correct(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** GraphicsIgnored ******************/
		/**** md5 signature: 3b3f9c739a6271439c6dd678e0cb88ba ****/
		%feature("compactdefaultargs") GraphicsIgnored;
		%feature("autodoc", "Sets graphics data (linefont, lineweight, color, level, view) to be ignored according value of hierarchy status : if hierarchy is not given, they are ignored any way (that is, they should not be defined) if hierarchy is given, graphics are ignored if the hierarchy status has the value given in argument 'hierarchy'.

Parameters
----------
hierarchy: int,optional
	default value is -1

Returns
-------
None
") GraphicsIgnored;
		void GraphicsIgnored(const Standard_Integer hierarchy = -1);

		/****************** HierarchyStatusIgnored ******************/
		/**** md5 signature: ffe6880a2270c9dd8d074fd8791a361b ****/
		%feature("compactdefaultargs") HierarchyStatusIgnored;
		%feature("autodoc", "Sets hierarchy status to be ignored (should not be defined, or its value should be 0).

Returns
-------
None
") HierarchyStatusIgnored;
		void HierarchyStatusIgnored();

		/****************** HierarchyStatusRequired ******************/
		/**** md5 signature: b449161bc1a34ebb8c2e7ba44fffc443 ****/
		%feature("compactdefaultargs") HierarchyStatusRequired;
		%feature("autodoc", "Sets hierarchy status to be required at a given value.

Parameters
----------
val: int

Returns
-------
None
") HierarchyStatusRequired;
		void HierarchyStatusRequired(const Standard_Integer val);

		/****************** IsSet ******************/
		/**** md5 signature: d771f80e63fcb5d314de94e557642c75 ****/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true if at least one criterium has already been set allows user to store a dirchecker (static variable) then ask if it has been set before setting it.

Returns
-------
bool
") IsSet;
		Standard_Boolean IsSet();

		/****************** LineFont ******************/
		/**** md5 signature: 6e240c23b24b5b0ad0fc231dbe891a55 ****/
		%feature("compactdefaultargs") LineFont;
		%feature("autodoc", "Sets linefont criterium if crit is defvoid, ignored : should not be defined if crit is defany, required : must be defined (value or ref) if crit is defvalue, required as a value (error if reference) other values are not taken in account.

Parameters
----------
crit: IGESData_DefType

Returns
-------
None
") LineFont;
		void LineFont(const IGESData_DefType crit);

		/****************** LineWeight ******************/
		/**** md5 signature: 227a713e91b7c732195e3cfac29b886e ****/
		%feature("compactdefaultargs") LineWeight;
		%feature("autodoc", "Sets lineweight criterium if crit is defvoid, ignored : should not be defined if crit is defvalue, required other values are not taken in account.

Parameters
----------
crit: IGESData_DefType

Returns
-------
None
") LineWeight;
		void LineWeight(const IGESData_DefType crit);

		/****************** SetDefault ******************/
		/**** md5 signature: 05ebac5892e016d583d5d0d47869806a ****/
		%feature("compactdefaultargs") SetDefault;
		%feature("autodoc", "Sets a dirchecker with most current criteria, that is : structure ignored ( worths call structure(crit = defvoid) ).

Returns
-------
None
") SetDefault;
		void SetDefault();

		/****************** Structure ******************/
		/**** md5 signature: cee4dcc75dad3c944ce704a668eb1877 ****/
		%feature("compactdefaultargs") Structure;
		%feature("autodoc", "Sets structure criterium. if crit is defvoid, ignored : should not be defined if crit is defreference, required : must be defined other values are not taken in account.

Parameters
----------
crit: IGESData_DefType

Returns
-------
None
") Structure;
		void Structure(const IGESData_DefType crit);

		/****************** SubordinateStatusIgnored ******************/
		/**** md5 signature: 6450449e9d94da036c3773b7a312c88d ****/
		%feature("compactdefaultargs") SubordinateStatusIgnored;
		%feature("autodoc", "Sets subordinate status to be ignored (should not be defined, or its value should be 0).

Returns
-------
None
") SubordinateStatusIgnored;
		void SubordinateStatusIgnored();

		/****************** SubordinateStatusRequired ******************/
		/**** md5 signature: cfd4a7eaae9a113928416e1e3a726c5b ****/
		%feature("compactdefaultargs") SubordinateStatusRequired;
		%feature("autodoc", "Sets subordinate status to be required at a given value.

Parameters
----------
val: int

Returns
-------
None
") SubordinateStatusRequired;
		void SubordinateStatusRequired(const Standard_Integer val);

		/****************** UseFlagIgnored ******************/
		/**** md5 signature: 270ff3aa762df881823a73edf6215bc4 ****/
		%feature("compactdefaultargs") UseFlagIgnored;
		%feature("autodoc", "Sets blank status to be ignored (should not be defined, or its value should be 0).

Returns
-------
None
") UseFlagIgnored;
		void UseFlagIgnored();

		/****************** UseFlagRequired ******************/
		/**** md5 signature: 3f04be01d8e4d038cf5279367cf81a5e ****/
		%feature("compactdefaultargs") UseFlagRequired;
		%feature("autodoc", "Sets blank status to be required at a given value give -1 to demand useflag not zero (but no precise value req.).

Parameters
----------
val: int

Returns
-------
None
") UseFlagRequired;
		void UseFlagRequired(const Standard_Integer val);

};


%extend IGESData_DirChecker {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class IGESData_DirPart *
*************************/
class IGESData_DirPart {
	public:
		/****************** IGESData_DirPart ******************/
		/**** md5 signature: aaf3cefe57d3d5a99a23b32517bc07a7 ****/
		%feature("compactdefaultargs") IGESData_DirPart;
		%feature("autodoc", "Creates an empty dirpart, ready to be filled by init.

Returns
-------
None
") IGESData_DirPart;
		 IGESData_DirPart();

		/****************** Init ******************/
		/**** md5 signature: 18118032f60e0e9839e44d4d6cfb5e08 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Fills dirpart with consistant data read from file.

Parameters
----------
i1: int
i2: int
i3: int
i4: int
i5: int
i6: int
i7: int
i8: int
i9: int
i19: int
i11: int
i12: int
i13: int
i14: int
i15: int
i16: int
i17: int
res1: char *
res2: char *
label: char *
subscript: char *

Returns
-------
None
") Init;
		void Init(const Standard_Integer i1, const Standard_Integer i2, const Standard_Integer i3, const Standard_Integer i4, const Standard_Integer i5, const Standard_Integer i6, const Standard_Integer i7, const Standard_Integer i8, const Standard_Integer i9, const Standard_Integer i19, const Standard_Integer i11, const Standard_Integer i12, const Standard_Integer i13, const Standard_Integer i14, const Standard_Integer i15, const Standard_Integer i16, const Standard_Integer i17, const char * res1, const char * res2, const char * label, const char * subscript);

		/****************** Type ******************/
		/**** md5 signature: 69362c058d18efeaee307371b2621b00 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns 'type' and 'form' info, used to recognize the entity.

Returns
-------
IGESData_IGESType
") Type;
		IGESData_IGESType Type();

		/****************** Values ******************/
		/**** md5 signature: 5828e8aff87ba1d4964d2e7a1d2e2675 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns values recorded in dirpart (content of cstrings are modified).

Parameters
----------
res1: char *
res2: char *
label: char *
subscript: char *

Returns
-------
i1: int
i2: int
i3: int
i4: int
i5: int
i6: int
i7: int
i8: int
i9: int
i19: int
i11: int
i12: int
i13: int
i14: int
i15: int
i16: int
i17: int
") Values;
		void Values(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, const char * res1, const char * res2, const char * label, const char * subscript);

};


%extend IGESData_DirPart {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESData_FileRecognizer *
********************************/
%nodefaultctor IGESData_FileRecognizer;
class IGESData_FileRecognizer : public Standard_Transient {
	public:
		/****************** Add ******************/
		/**** md5 signature: c5d4df34e0346f20fd2e3d1bd4beab1d ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a new recognizer to the compound, at the end several calls to add work by adding in the order of calls : hence, when eval has failed to recognize, evaluate will call evaluate from the first added recognizer if there is one, and to the second if there is still no result, and so on.

Parameters
----------
reco: IGESData_FileRecognizer

Returns
-------
None
") Add;
		void Add(const opencascade::handle<IGESData_FileRecognizer> & reco);

		/****************** Evaluate ******************/
		/**** md5 signature: 3237dbbb2043959d221cc2e7c8976831 ****/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Evaluates if recognition has a result, returns it if yes in case of success, returns true and puts result in 'res' in case of failure, simply returns false works by calling deferred method eval, and in case of failure, looks for added recognizers to work.

Parameters
----------
akey: IGESData_IGESType
res: IGESData_IGESEntity

Returns
-------
bool
") Evaluate;
		Standard_Boolean Evaluate(const IGESData_IGESType & akey, opencascade::handle<IGESData_IGESEntity> & res);

		/****************** Result ******************/
		/**** md5 signature: 29851946acd68a530fd6e44b9d630dfb ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns result of last recognition (call of evaluate).

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Result;
		opencascade::handle<IGESData_IGESEntity> Result();

};


%make_alias(IGESData_FileRecognizer)

%extend IGESData_FileRecognizer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESData_GeneralModule *
*******************************/
%nodefaultctor IGESData_GeneralModule;
class IGESData_GeneralModule : public Interface_GeneralModule {
	public:
		/****************** CanCopy ******************/
		/**** md5 signature: a5bdcf31c0ad2154c49ebf2598d091b9 ****/
		%feature("compactdefaultargs") CanCopy;
		%feature("autodoc", "Specific answer to the question 'is copy properly implemented' for iges, answer is always true.

Parameters
----------
CN: int
ent: Standard_Transient

Returns
-------
bool
") CanCopy;
		virtual Standard_Boolean CanCopy(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent);

		/****************** CheckCase ******************/
		/**** md5 signature: d232fb3d35ada68a901b85a0af289c46 ****/
		%feature("compactdefaultargs") CheckCase;
		%feature("autodoc", "Semantic checking of an igesentity. performs general checks, which use dirchecker, then call owncheck which does a check specific for each type of entity.

Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") CheckCase;
		void CheckCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** CopyCase ******************/
		/**** md5 signature: 13c34a46cee20a3c1fc929ba0a39372a ****/
		%feature("compactdefaultargs") CopyCase;
		%feature("autodoc", "Copy ('deep') from <entfrom> to <entto> (same type) by using a copytool which provides its working map. for igesentities, copies general data (directory part, list of properties) and call owncopycase.

Parameters
----------
CN: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Returns
-------
None
") CopyCase;
		void CopyCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****************** DirChecker ******************/
		/**** md5 signature: 036d653b6ace3b4648653d3a1fe6b651 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns a dirchecker, specific for each type of entity (identified by its case number) : this dirchecker defines constraints which must be respected by the directorypart.

Parameters
----------
CN: int
ent: IGESData_IGESEntity

Returns
-------
IGESData_DirChecker
") DirChecker;
		virtual IGESData_DirChecker DirChecker(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** FillSharedCase ******************/
		/**** md5 signature: 7bbac4d621ea60d6990c803dbf4b2897 ****/
		%feature("compactdefaultargs") FillSharedCase;
		%feature("autodoc", "Fills the list of entities shared by an igesentity <ent>, according a case number <cn> (formerly computed by casenum). considers properties and directory part, and calls ownsharedcase (which is adapted to each type of entity).

Parameters
----------
CN: int
ent: Standard_Transient
iter: Interface_EntityIterator

Returns
-------
None
") FillSharedCase;
		void FillSharedCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****************** ListImpliedCase ******************/
		/**** md5 signature: 2464e54633a79d3cf9363f69b8c3a04f ****/
		%feature("compactdefaultargs") ListImpliedCase;
		%feature("autodoc", "Lists the implied references of <ent>. here, these are the associativities, plus the entities defined by ownsharedcase.

Parameters
----------
CN: int
ent: Standard_Transient
iter: Interface_EntityIterator

Returns
-------
None
") ListImpliedCase;
		virtual void ListImpliedCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****************** Name ******************/
		/**** md5 signature: ac91548e6672c7a25f89869ddd43f80a ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name of an iges entity (its namevalue) can be redefined for an even more specific case ...

Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		virtual opencascade::handle<TCollection_HAsciiString> Name(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares);

		/****************** NewVoid ******************/
		/**** md5 signature: 89da2a487df7b420c0382ae0dc5fc2c5 ****/
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
		virtual Standard_Boolean NewVoid(const Standard_Integer CN, opencascade::handle<Standard_Transient> & entto);

		/****************** OwnCheckCase ******************/
		/**** md5 signature: 1ee5ab0982c8715677f898fc98959231 ****/
		%feature("compactdefaultargs") OwnCheckCase;
		%feature("autodoc", "Performs specific semantic check for each type of entity.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheckCase;
		virtual void OwnCheckCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopyCase ******************/
		/**** md5 signature: 29f249a12dd03139f8f1bcdf3d8aa0ca ****/
		%feature("compactdefaultargs") OwnCopyCase;
		%feature("autodoc", "Copies parameters which are specific of each type of entity.

Parameters
----------
CN: int
entfrom: IGESData_IGESEntity
entto: IGESData_IGESEntity
TC: Interface_CopyTool

Returns
-------
None
") OwnCopyCase;
		virtual void OwnCopyCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & entfrom, const opencascade::handle<IGESData_IGESEntity> & entto, Interface_CopyTool & TC);

		/****************** OwnDeleteCase ******************/
		/**** md5 signature: c9a6039a81d69ed5f6b6015f1199b22a ****/
		%feature("compactdefaultargs") OwnDeleteCase;
		%feature("autodoc", "Specific preparation for delete, acts on own parameters default does nothing, to be redefined as required.

Parameters
----------
CN: int
ent: IGESData_IGESEntity

Returns
-------
None
") OwnDeleteCase;
		virtual void OwnDeleteCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** OwnImpliedCase ******************/
		/**** md5 signature: 75f500e35478984bd78c87787d67741c ****/
		%feature("compactdefaultargs") OwnImpliedCase;
		%feature("autodoc", "Specific list of entities implied by a given igesentity <ent> (in addition to associativities). by default, there are none, but this method can be redefined as required.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
iter: Interface_EntityIterator

Returns
-------
None
") OwnImpliedCase;
		virtual void OwnImpliedCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, Interface_EntityIterator & iter);

		/****************** OwnRenewCase ******************/
		/**** md5 signature: 8cfebfba742ed0ec552abe5502e486fa ****/
		%feature("compactdefaultargs") OwnRenewCase;
		%feature("autodoc", "Renews parameters which are specific of each type of entity : the provided default does nothing, but this method may be redefined as required.

Parameters
----------
CN: int
entfrom: IGESData_IGESEntity
entto: IGESData_IGESEntity
TC: Interface_CopyTool

Returns
-------
None
") OwnRenewCase;
		virtual void OwnRenewCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & entfrom, const opencascade::handle<IGESData_IGESEntity> & entto, const Interface_CopyTool & TC);

		/****************** OwnSharedCase ******************/
		/**** md5 signature: af6ce2f8effa428553bfd535582299e1 ****/
		%feature("compactdefaultargs") OwnSharedCase;
		%feature("autodoc", "Lists the entities shared by a given igesentity <ent>, from its specific parameters : specific for each type.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
iter: Interface_EntityIterator

Returns
-------
None
") OwnSharedCase;
		virtual void OwnSharedCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, Interface_EntityIterator & iter);

		/****************** RenewImpliedCase ******************/
		/**** md5 signature: faab0844f93d5fbf03d896180bb19755 ****/
		%feature("compactdefaultargs") RenewImpliedCase;
		%feature("autodoc", "Renewing of implied references. for igesentities, copies general data(list of associativities) and calls ownrenewcase.

Parameters
----------
CN: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Returns
-------
None
") RenewImpliedCase;
		virtual void RenewImpliedCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, const Interface_CopyTool & TC);

		/****************** WhenDeleteCase ******************/
		/**** md5 signature: 7740f2bc1169cdd39ca3b2f12adbb0e7 ****/
		%feature("compactdefaultargs") WhenDeleteCase;
		%feature("autodoc", "Prepares an iges entity for delete : works on directory part then calls owndeletecase while dispatch requires to copy the entities, <dispatched> is ignored, entities are cleared in any case.

Parameters
----------
CN: int
ent: Standard_Transient
dispatched: bool

Returns
-------
None
") WhenDeleteCase;
		virtual void WhenDeleteCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Standard_Boolean dispatched);

};


%make_alias(IGESData_GeneralModule)

%extend IGESData_GeneralModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class IGESData_GlobalNodeOfSpecificLib *
*****************************************/
class IGESData_GlobalNodeOfSpecificLib : public Standard_Transient {
	public:
		/****************** IGESData_GlobalNodeOfSpecificLib ******************/
		/**** md5 signature: 3dff368a8c48aab5354bfbddab7d69a5 ****/
		%feature("compactdefaultargs") IGESData_GlobalNodeOfSpecificLib;
		%feature("autodoc", "Creates an empty globalnode, with no next.

Returns
-------
None
") IGESData_GlobalNodeOfSpecificLib;
		 IGESData_GlobalNodeOfSpecificLib();

		/****************** Add ******************/
		/**** md5 signature: 693db3fdb3fbb08ef1ebc7b22a97916a ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a module bound with a protocol to the list : does nothing if already in the list, that is, same type (exact match) and same state (that is, isequal is not required) once added, stores its attached protocol in correspondance.

Parameters
----------
amodule: IGESData_SpecificModule
aprotocol: IGESData_Protocol

Returns
-------
None
") Add;
		void Add(const opencascade::handle<IGESData_SpecificModule> & amodule, const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****************** Module ******************/
		/**** md5 signature: 94fb463336d8c4fc0b6073746099eaef ****/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module stored in a given globalnode.

Returns
-------
opencascade::handle<IGESData_SpecificModule>
") Module;
		const opencascade::handle<IGESData_SpecificModule> & Module();

		/****************** Next ******************/
		/**** md5 signature: c408c95351b1bbbdaa02317172980e88 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next globalnode. if none is defined, returned value is a null handle.

Returns
-------
opencascade::handle<IGESData_GlobalNodeOfSpecificLib>
") Next;
		const opencascade::handle<IGESData_GlobalNodeOfSpecificLib> & Next();

		/****************** Protocol ******************/
		/**** md5 signature: 4eb07a48dbfd452cf11a527b6ce5309c ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the attached protocol stored in a given globalnode.

Returns
-------
opencascade::handle<IGESData_Protocol>
") Protocol;
		const opencascade::handle<IGESData_Protocol> & Protocol();

};


%make_alias(IGESData_GlobalNodeOfSpecificLib)

%extend IGESData_GlobalNodeOfSpecificLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class IGESData_GlobalNodeOfWriterLib *
***************************************/
class IGESData_GlobalNodeOfWriterLib : public Standard_Transient {
	public:
		/****************** IGESData_GlobalNodeOfWriterLib ******************/
		/**** md5 signature: b292d57488bea05b311a109f89db942b ****/
		%feature("compactdefaultargs") IGESData_GlobalNodeOfWriterLib;
		%feature("autodoc", "Creates an empty globalnode, with no next.

Returns
-------
None
") IGESData_GlobalNodeOfWriterLib;
		 IGESData_GlobalNodeOfWriterLib();

		/****************** Add ******************/
		/**** md5 signature: e3394d10b010b643c32b976b7056d700 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a module bound with a protocol to the list : does nothing if already in the list, that is, same type (exact match) and same state (that is, isequal is not required) once added, stores its attached protocol in correspondance.

Parameters
----------
amodule: IGESData_ReadWriteModule
aprotocol: IGESData_Protocol

Returns
-------
None
") Add;
		void Add(const opencascade::handle<IGESData_ReadWriteModule> & amodule, const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****************** Module ******************/
		/**** md5 signature: 620617849b7007bcf8f20d0e6d505c82 ****/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module stored in a given globalnode.

Returns
-------
opencascade::handle<IGESData_ReadWriteModule>
") Module;
		const opencascade::handle<IGESData_ReadWriteModule> & Module();

		/****************** Next ******************/
		/**** md5 signature: 3798fc440690fb3bf4904544f1ae605b ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next globalnode. if none is defined, returned value is a null handle.

Returns
-------
opencascade::handle<IGESData_GlobalNodeOfWriterLib>
") Next;
		const opencascade::handle<IGESData_GlobalNodeOfWriterLib> & Next();

		/****************** Protocol ******************/
		/**** md5 signature: 4eb07a48dbfd452cf11a527b6ce5309c ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the attached protocol stored in a given globalnode.

Returns
-------
opencascade::handle<IGESData_Protocol>
") Protocol;
		const opencascade::handle<IGESData_Protocol> & Protocol();

};


%make_alias(IGESData_GlobalNodeOfWriterLib)

%extend IGESData_GlobalNodeOfWriterLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESData_GlobalSection *
*******************************/
class IGESData_GlobalSection {
	public:
		/****************** IGESData_GlobalSection ******************/
		/**** md5 signature: 95bf3d4cddb1b7255d78e1c6c95e51ca ****/
		%feature("compactdefaultargs") IGESData_GlobalSection;
		%feature("autodoc", "Creates an empty globalsection, ready to be filled, warning : no default value is provided.

Returns
-------
None
") IGESData_GlobalSection;
		 IGESData_GlobalSection();

		/****************** ApplicationProtocol ******************/
		/**** md5 signature: 57656f47147bb56fade3a45306ceb448 ****/
		%feature("compactdefaultargs") ApplicationProtocol;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ApplicationProtocol;
		opencascade::handle<TCollection_HAsciiString> ApplicationProtocol();

		/****************** AuthorName ******************/
		/**** md5 signature: 5774996511404b1d946c5809a28a4ec8 ****/
		%feature("compactdefaultargs") AuthorName;
		%feature("autodoc", "Returns the name of the iges file author.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") AuthorName;
		opencascade::handle<TCollection_HAsciiString> AuthorName();

		/****************** CompanyName ******************/
		/**** md5 signature: 0ddc26b82ac89e543b514f876f02f512 ****/
		%feature("compactdefaultargs") CompanyName;
		%feature("autodoc", "Returns the name of the company where the iges file was written.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") CompanyName;
		opencascade::handle<TCollection_HAsciiString> CompanyName();

		/****************** CopyRefs ******************/
		/**** md5 signature: 5d079cafa039a9db79df1b570ffb5a05 ****/
		%feature("compactdefaultargs") CopyRefs;
		%feature("autodoc", "Copies data referenced by handle (that is, strings) usefull to 'isolate' a globalsection after copy by '=' (from a model to another model for instance).

Returns
-------
None
") CopyRefs;
		void CopyRefs();

		/****************** Date ******************/
		/**** md5 signature: 09f606ad7bd37b4144d6194486109a4e ****/
		%feature("compactdefaultargs") Date;
		%feature("autodoc", "Returns the iges file creation date.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Date;
		opencascade::handle<TCollection_HAsciiString> Date();

		/****************** DraftingStandard ******************/
		/**** md5 signature: 2eaebc14c53be4e580dd6ae1343af802 ****/
		%feature("compactdefaultargs") DraftingStandard;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") DraftingStandard;
		Standard_Integer DraftingStandard();

		/****************** EndMark ******************/
		/**** md5 signature: 825aed0615f08fe50add623a0983b198 ****/
		%feature("compactdefaultargs") EndMark;
		%feature("autodoc", "Returns the record delimiter character.

Returns
-------
Standard_Character
") EndMark;
		Standard_Character EndMark();

		/****************** FileName ******************/
		/**** md5 signature: 57c69ea52795b11d2fa287b066777f7d ****/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Returns the name of the iges file.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FileName;
		opencascade::handle<TCollection_HAsciiString> FileName();

		/****************** HasApplicationProtocol ******************/
		/**** md5 signature: cfd29c6043185cacffebd2205d9d7bda ****/
		%feature("compactdefaultargs") HasApplicationProtocol;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasApplicationProtocol;
		Standard_Boolean HasApplicationProtocol();

		/****************** HasLastChangeDate ******************/
		/**** md5 signature: f46c048fd0c3edfddb44c95266f02288 ****/
		%feature("compactdefaultargs") HasLastChangeDate;
		%feature("autodoc", "Returns true if the date and time when the model was created or last modified are specified, i.e. not defaulted to null.

Returns
-------
bool
") HasLastChangeDate;
		Standard_Boolean HasLastChangeDate();

		/****************** HasMaxCoord ******************/
		/**** md5 signature: 76380c70ec5dd12901d275d3d79b7561 ****/
		%feature("compactdefaultargs") HasMaxCoord;
		%feature("autodoc", "Returns true if the approximate maximum coordinate value found in the model is greater than 0.

Returns
-------
bool
") HasMaxCoord;
		Standard_Boolean HasMaxCoord();

		/****************** IGESVersion ******************/
		/**** md5 signature: 7be43be14b3625c1c9d54d0fadc22fc2 ****/
		%feature("compactdefaultargs") IGESVersion;
		%feature("autodoc", "Returns the iges version that the iges file was written in.

Returns
-------
int
") IGESVersion;
		Standard_Integer IGESVersion();

		/****************** Init ******************/
		/**** md5 signature: ed763441a63969eb5172d560669ca3e5 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Fills globalsection from a paramset (i.e. taken from file) undefined parameters do not change default values when defined fills check about corrections or fails.

Parameters
----------
params: Interface_ParamSet
ach: Interface_Check

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Interface_ParamSet> & params, opencascade::handle<Interface_Check> & ach);

		/****************** IntegerBits ******************/
		/**** md5 signature: 1ba9b7a80f42a3cceda8900aa483c4a1 ****/
		%feature("compactdefaultargs") IntegerBits;
		%feature("autodoc", "Returns the number of binary bits for integer representations.

Returns
-------
int
") IntegerBits;
		Standard_Integer IntegerBits();

		/****************** InterfaceVersion ******************/
		/**** md5 signature: ba796e5b26357dbaf114285a3e7aa830 ****/
		%feature("compactdefaultargs") InterfaceVersion;
		%feature("autodoc", "Returns the name of the pre-processor used to write the iges file.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") InterfaceVersion;
		opencascade::handle<TCollection_HAsciiString> InterfaceVersion();

		/****************** LastChangeDate ******************/
		/**** md5 signature: bbffe66a1437053dbda722f9ba1a2a02 ****/
		%feature("compactdefaultargs") LastChangeDate;
		%feature("autodoc", "Returns the date and time when the model was created or last modified (for iges 5.1 and later).

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") LastChangeDate;
		opencascade::handle<TCollection_HAsciiString> LastChangeDate();

		/****************** LineWeightGrad ******************/
		/**** md5 signature: b89fae1eee517e85d24d795602389c1c ****/
		%feature("compactdefaultargs") LineWeightGrad;
		%feature("autodoc", "Returns the maximum number of line weight gradations.

Returns
-------
int
") LineWeightGrad;
		Standard_Integer LineWeightGrad();

		/****************** MaxCoord ******************/
		/**** md5 signature: 2a3013b177b0fb471e94fdad5e4d7641 ****/
		%feature("compactdefaultargs") MaxCoord;
		%feature("autodoc", "Returns the approximate maximum coordinate value found in the model.

Returns
-------
float
") MaxCoord;
		Standard_Real MaxCoord();

		/****************** MaxDigitsDouble ******************/
		/**** md5 signature: ece0ba11aa0ccbc3247fa2882f24f813 ****/
		%feature("compactdefaultargs") MaxDigitsDouble;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") MaxDigitsDouble;
		Standard_Integer MaxDigitsDouble();

		/****************** MaxDigitsSingle ******************/
		/**** md5 signature: 6ae72eb1dad89328f033ed9b7774a200 ****/
		%feature("compactdefaultargs") MaxDigitsSingle;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") MaxDigitsSingle;
		Standard_Integer MaxDigitsSingle();

		/****************** MaxLineWeight ******************/
		/**** md5 signature: ff3bad41c4483abeecb982032362bc67 ****/
		%feature("compactdefaultargs") MaxLineWeight;
		%feature("autodoc", "Returns the of maximum line weight width in iges file units.

Returns
-------
float
") MaxLineWeight;
		Standard_Real MaxLineWeight();

		/****************** MaxMaxCoord ******************/
		/**** md5 signature: b623699c1df21e5e1cabdb5a0b4fc45a ****/
		%feature("compactdefaultargs") MaxMaxCoord;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: float,optional
	default value is 0.0

Returns
-------
None
") MaxMaxCoord;
		void MaxMaxCoord(const Standard_Real val = 0.0);

		/****************** MaxMaxCoords ******************/
		/**** md5 signature: 405ae2f04167559da5553089a934b14a ****/
		%feature("compactdefaultargs") MaxMaxCoords;
		%feature("autodoc", "No available documentation.

Parameters
----------
xyz: gp_XYZ

Returns
-------
None
") MaxMaxCoords;
		void MaxMaxCoords(const gp_XYZ & xyz);

		/****************** MaxPower10Double ******************/
		/**** md5 signature: 13bcc9b315d110be21bd26ebc83adf54 ****/
		%feature("compactdefaultargs") MaxPower10Double;
		%feature("autodoc", "Returns the maximum power of a decimal representation of a double-precision floating point number in the sending system.

Returns
-------
int
") MaxPower10Double;
		Standard_Integer MaxPower10Double();

		/****************** MaxPower10Single ******************/
		/**** md5 signature: e96efe3988ebf92263ddbf4c3dc4b2d7 ****/
		%feature("compactdefaultargs") MaxPower10Single;
		%feature("autodoc", "Returns the maximum power of a decimal representation of a single-precision floating point number in the sending system.

Returns
-------
int
") MaxPower10Single;
		Standard_Integer MaxPower10Single();

		/****************** NewDateString ******************/
		/**** md5 signature: 3ecccd135edc3c62282f5e8172ce92c7 ****/
		%feature("compactdefaultargs") NewDateString;
		%feature("autodoc", "Returns a string built from year, month, day, hour, minute and second values. the form of the resulting string is defined as follows: - -1: yymmdd.hhnnss, - 0: yyyymmdd.hhnnss, - 1: yyyy-mm-dd:hh-nn-ss, where: - yyyy or yy is 4 or 2 digit year, - hh is hour (00-23), - mm is month (01-12), - nn is minute (00-59) - dd is day (01-31), - ss is second (00-59).

Parameters
----------
year: int
month: int
day: int
hour: int
minut: int
second: int
mode: int,optional
	default value is -1

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") NewDateString;
		static opencascade::handle<TCollection_HAsciiString> NewDateString(const Standard_Integer year, const Standard_Integer month, const Standard_Integer day, const Standard_Integer hour, const Standard_Integer minut, const Standard_Integer second, const Standard_Integer mode = -1);

		/****************** NewDateString ******************/
		/**** md5 signature: 5540b77516c3a70ce33562e8b5135518 ****/
		%feature("compactdefaultargs") NewDateString;
		%feature("autodoc", "Converts the string given in the form yymmdd.hhnnss or yyyymmdd.hhnnss to either yymmdd.hhnnss, yyyymmdd.hhnnss or yyyy-mm-dd:hh-nn-ss.

Parameters
----------
date: TCollection_HAsciiString
mode: int,optional
	default value is 1

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") NewDateString;
		static opencascade::handle<TCollection_HAsciiString> NewDateString(const opencascade::handle<TCollection_HAsciiString> & date, const Standard_Integer mode = 1);

		/****************** Params ******************/
		/**** md5 signature: c72a45a91254d4d8bb9687c8c3ff1040 ****/
		%feature("compactdefaultargs") Params;
		%feature("autodoc", "Returns all contained data in the form of a paramset remark : strings are given under hollerith form.

Returns
-------
opencascade::handle<Interface_ParamSet>
") Params;
		opencascade::handle<Interface_ParamSet> Params();

		/****************** ReceiveName ******************/
		/**** md5 signature: c599e725c14998751fa2d2c740337669 ****/
		%feature("compactdefaultargs") ReceiveName;
		%feature("autodoc", "Returns the name of the receiving system.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ReceiveName;
		opencascade::handle<TCollection_HAsciiString> ReceiveName();

		/****************** Resolution ******************/
		/**** md5 signature: 4e5f84c856f59723b6a6d12fbb356538 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the resolution used in the iges file.

Returns
-------
float
") Resolution;
		Standard_Real Resolution();

		/****************** Scale ******************/
		/**** md5 signature: 4c0fd48707c01e5a42b2a639ca08da30 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Returns the scale used in the iges file.

Returns
-------
float
") Scale;
		Standard_Real Scale();

		/****************** SendName ******************/
		/**** md5 signature: 52ad059fcd416f2eb44a71aeaec2b28c ****/
		%feature("compactdefaultargs") SendName;
		%feature("autodoc", "Returns the name of the sending system.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") SendName;
		opencascade::handle<TCollection_HAsciiString> SendName();

		/****************** Separator ******************/
		/**** md5 signature: df98896b790fc76bded6cd92dc90ea1b ****/
		%feature("compactdefaultargs") Separator;
		%feature("autodoc", "Returns the parameter delimiter character.

Returns
-------
Standard_Character
") Separator;
		Standard_Character Separator();

		/****************** SetApplicationProtocol ******************/
		/**** md5 signature: df647e7bb63094648939c9d6d824c516 ****/
		%feature("compactdefaultargs") SetApplicationProtocol;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: TCollection_HAsciiString

Returns
-------
None
") SetApplicationProtocol;
		void SetApplicationProtocol(const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetAuthorName ******************/
		/**** md5 signature: 9ef66294fc6d0d16408e717190c2cc87 ****/
		%feature("compactdefaultargs") SetAuthorName;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: TCollection_HAsciiString

Returns
-------
None
") SetAuthorName;
		void SetAuthorName(const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetCompanyName ******************/
		/**** md5 signature: 5dc4f10cc8e8c06b69f5aa1316e288f8 ****/
		%feature("compactdefaultargs") SetCompanyName;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: TCollection_HAsciiString

Returns
-------
None
") SetCompanyName;
		void SetCompanyName(const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetDate ******************/
		/**** md5 signature: 7684088d468c250a961b63ac61ac76ca ****/
		%feature("compactdefaultargs") SetDate;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: TCollection_HAsciiString

Returns
-------
None
") SetDate;
		void SetDate(const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetDraftingStandard ******************/
		/**** md5 signature: 7bbb2699bea3a1f68905118277443da0 ****/
		%feature("compactdefaultargs") SetDraftingStandard;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: int

Returns
-------
None
") SetDraftingStandard;
		void SetDraftingStandard(const Standard_Integer val);

		/****************** SetEndMark ******************/
		/**** md5 signature: 0498a960afd8e09430103358b2acdb1c ****/
		%feature("compactdefaultargs") SetEndMark;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: Standard_Character

Returns
-------
None
") SetEndMark;
		void SetEndMark(const Standard_Character val);

		/****************** SetFileName ******************/
		/**** md5 signature: 5d6e767794c3f7492973d5d7ce4059ee ****/
		%feature("compactdefaultargs") SetFileName;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: TCollection_HAsciiString

Returns
-------
None
") SetFileName;
		void SetFileName(const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetIGESVersion ******************/
		/**** md5 signature: cfa3ebeb37cf2ce0f743e502181849fb ****/
		%feature("compactdefaultargs") SetIGESVersion;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: int

Returns
-------
None
") SetIGESVersion;
		void SetIGESVersion(const Standard_Integer val);

		/****************** SetIntegerBits ******************/
		/**** md5 signature: 475e7a7cf1bd3b45b7753ae4aff1f81a ****/
		%feature("compactdefaultargs") SetIntegerBits;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: int

Returns
-------
None
") SetIntegerBits;
		void SetIntegerBits(const Standard_Integer val);

		/****************** SetInterfaceVersion ******************/
		/**** md5 signature: 21ff81f9707d2f4cd40d4a7d0dd8905f ****/
		%feature("compactdefaultargs") SetInterfaceVersion;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: TCollection_HAsciiString

Returns
-------
None
") SetInterfaceVersion;
		void SetInterfaceVersion(const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetLastChangeDate ******************/
		/**** md5 signature: a6aecd5fe8ebc5691a3c2c56142913bc ****/
		%feature("compactdefaultargs") SetLastChangeDate;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetLastChangeDate;
		void SetLastChangeDate();

		/****************** SetLastChangeDate ******************/
		/**** md5 signature: d5bb43c890a4b669a4f8fd9274e768bc ****/
		%feature("compactdefaultargs") SetLastChangeDate;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: TCollection_HAsciiString

Returns
-------
None
") SetLastChangeDate;
		void SetLastChangeDate(const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetLineWeightGrad ******************/
		/**** md5 signature: f3ac2940391df0a10217f2be70df803e ****/
		%feature("compactdefaultargs") SetLineWeightGrad;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: int

Returns
-------
None
") SetLineWeightGrad;
		void SetLineWeightGrad(const Standard_Integer val);

		/****************** SetMaxCoord ******************/
		/**** md5 signature: 869d8f71f11df82aaa8d7812f65425ca ****/
		%feature("compactdefaultargs") SetMaxCoord;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: float,optional
	default value is 0.0

Returns
-------
None
") SetMaxCoord;
		void SetMaxCoord(const Standard_Real val = 0.0);

		/****************** SetMaxDigitsDouble ******************/
		/**** md5 signature: 02f2baf854f4f12a6202f1742067f64e ****/
		%feature("compactdefaultargs") SetMaxDigitsDouble;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: int

Returns
-------
None
") SetMaxDigitsDouble;
		void SetMaxDigitsDouble(const Standard_Integer val);

		/****************** SetMaxDigitsSingle ******************/
		/**** md5 signature: 873e0772722e5b2095e0b58a2f28018f ****/
		%feature("compactdefaultargs") SetMaxDigitsSingle;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: int

Returns
-------
None
") SetMaxDigitsSingle;
		void SetMaxDigitsSingle(const Standard_Integer val);

		/****************** SetMaxLineWeight ******************/
		/**** md5 signature: 0c28dfccef5ca733dafcc2dfcaa7c2b9 ****/
		%feature("compactdefaultargs") SetMaxLineWeight;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: float

Returns
-------
None
") SetMaxLineWeight;
		void SetMaxLineWeight(const Standard_Real val);

		/****************** SetMaxPower10Double ******************/
		/**** md5 signature: d2c84d6f881b70f34544d97d4e762b70 ****/
		%feature("compactdefaultargs") SetMaxPower10Double;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: int

Returns
-------
None
") SetMaxPower10Double;
		void SetMaxPower10Double(const Standard_Integer val);

		/****************** SetMaxPower10Single ******************/
		/**** md5 signature: c10f1c24315e97dc712d31a20682013a ****/
		%feature("compactdefaultargs") SetMaxPower10Single;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: int

Returns
-------
None
") SetMaxPower10Single;
		void SetMaxPower10Single(const Standard_Integer val);

		/****************** SetReceiveName ******************/
		/**** md5 signature: a6cfc808584218fd2ba6aa69773aca18 ****/
		%feature("compactdefaultargs") SetReceiveName;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: TCollection_HAsciiString

Returns
-------
None
") SetReceiveName;
		void SetReceiveName(const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetResolution ******************/
		/**** md5 signature: f960e701377b9a53f863173be9785852 ****/
		%feature("compactdefaultargs") SetResolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: float

Returns
-------
None
") SetResolution;
		void SetResolution(const Standard_Real val);

		/****************** SetScale ******************/
		/**** md5 signature: 4c0ffeeb09801d32a2366f53c2193e30 ****/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: float

Returns
-------
None
") SetScale;
		void SetScale(const Standard_Real val);

		/****************** SetSendName ******************/
		/**** md5 signature: a738f63f7016df17effbedb291851702 ****/
		%feature("compactdefaultargs") SetSendName;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: TCollection_HAsciiString

Returns
-------
None
") SetSendName;
		void SetSendName(const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetSeparator ******************/
		/**** md5 signature: 25ddf0202bcd0473594edac03a820948 ****/
		%feature("compactdefaultargs") SetSeparator;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: Standard_Character

Returns
-------
None
") SetSeparator;
		void SetSeparator(const Standard_Character val);

		/****************** SetSystemId ******************/
		/**** md5 signature: e662f6c5c9fb230f9c1b2d57f3180f49 ****/
		%feature("compactdefaultargs") SetSystemId;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: TCollection_HAsciiString

Returns
-------
None
") SetSystemId;
		void SetSystemId(const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetUnitFlag ******************/
		/**** md5 signature: 663f9f6ff418fe58f988b532fa70d5d0 ****/
		%feature("compactdefaultargs") SetUnitFlag;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: int

Returns
-------
None
") SetUnitFlag;
		void SetUnitFlag(const Standard_Integer val);

		/****************** SetUnitName ******************/
		/**** md5 signature: 30c7109168312dd17229e70ab46f25d0 ****/
		%feature("compactdefaultargs") SetUnitName;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: TCollection_HAsciiString

Returns
-------
None
") SetUnitName;
		void SetUnitName(const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SystemId ******************/
		/**** md5 signature: 919690a2c6fee9770148fde20ca72429 ****/
		%feature("compactdefaultargs") SystemId;
		%feature("autodoc", "Returns the native system id of the system that created the iges file.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") SystemId;
		opencascade::handle<TCollection_HAsciiString> SystemId();

		/****************** TranslatedFromHollerith ******************/
		/**** md5 signature: da665df528b6e6e78a48f28441714df9 ****/
		%feature("compactdefaultargs") TranslatedFromHollerith;
		%feature("autodoc", "Returns a string withpout its hollerith marks (nnnh ahead). remark : all strings stored in globalsection are expurged from hollerith informations (without nnnh) if <astr> is not hollerith form, it is simply copied.

Parameters
----------
astr: TCollection_HAsciiString

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") TranslatedFromHollerith;
		opencascade::handle<TCollection_HAsciiString> TranslatedFromHollerith(const opencascade::handle<TCollection_HAsciiString> & astr);

		/****************** UnitFlag ******************/
		/**** md5 signature: 54ab2931996d2ea32441ec6724afb20d ****/
		%feature("compactdefaultargs") UnitFlag;
		%feature("autodoc", "Returns the unit flag that was used to write the iges file.

Returns
-------
int
") UnitFlag;
		Standard_Integer UnitFlag();

		/****************** UnitName ******************/
		/**** md5 signature: 5719249960d4417173aef99e14273641 ****/
		%feature("compactdefaultargs") UnitName;
		%feature("autodoc", "Returns the name of the unit the iges file was written in.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") UnitName;
		opencascade::handle<TCollection_HAsciiString> UnitName();

		/****************** UnitValue ******************/
		/**** md5 signature: 44bdd78781973523a9e69dd88c24c355 ****/
		%feature("compactdefaultargs") UnitValue;
		%feature("autodoc", "Returns the unit value (in meters) that the iges file was written in.

Returns
-------
float
") UnitValue;
		Standard_Real UnitValue();

};


%extend IGESData_GlobalSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESData_IGESDumper *
****************************/
class IGESData_IGESDumper {
	public:
		/****************** IGESData_IGESDumper ******************/
		/**** md5 signature: 4b47b03aa29239a6a9260ae416b48e6c ****/
		%feature("compactdefaultargs") IGESData_IGESDumper;
		%feature("autodoc", "Returns an igesdumper ready to work. the igesmodel provides the numbering of entities : as for any interfacemodel, it gives each entity a number; but for igesentities, the 'number of directory entry' according to the definition of iges files, is also usefull.

Parameters
----------
model: IGESData_IGESModel
protocol: IGESData_Protocol

Returns
-------
None
") IGESData_IGESDumper;
		 IGESData_IGESDumper(const opencascade::handle<IGESData_IGESModel> & model, const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** Dump ******************/
		/**** md5 signature: 8b0ab3cc7431e805636f6dc740252a15 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: IGESData_IGESEntity
S: Message_Messenger
own: int
attached: int,optional
	default value is -1

Returns
-------
None
") Dump;
		void Dump(const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<Message_Messenger> & S, const Standard_Integer own, const Standard_Integer attached = -1);

		/****************** OwnDump ******************/
		/**** md5 signature: 8b8f15f40d4d7eb44d5d634d2c231b8b ****/
		%feature("compactdefaultargs") OwnDump;
		%feature("autodoc", "Specific dump for each iges entity, call by dump (just above) <own> is the parameter <own> from dump.

Parameters
----------
ent: IGESData_IGESEntity
S: Message_Messenger
own: int

Returns
-------
None
") OwnDump;
		void OwnDump(const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<Message_Messenger> & S, const Standard_Integer own);

		/****************** PrintDNum ******************/
		/**** md5 signature: e869244fa44d0863d7d5f75aaf7be0f5 ****/
		%feature("compactdefaultargs") PrintDNum;
		%feature("autodoc", "Prints onto an output, the 'number of directory entry' which corresponds to an igesentity in the igesmodel, under the form 'd#nnn' (a null handle gives d#0).

Parameters
----------
ent: IGESData_IGESEntity
S: Message_Messenger

Returns
-------
None
") PrintDNum;
		void PrintDNum(const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<Message_Messenger> & S);

		/****************** PrintShort ******************/
		/**** md5 signature: df4847d22a7332f77b823a5ca20b578b ****/
		%feature("compactdefaultargs") PrintShort;
		%feature("autodoc", "Prints onto an output, the 'number of directory entry' (see printdnum) plus iges type and form numbers, which gives 'd#nnn type nnn form nnn'.

Parameters
----------
ent: IGESData_IGESEntity
S: Message_Messenger

Returns
-------
None
") PrintShort;
		void PrintShort(const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<Message_Messenger> & S);

};


%extend IGESData_IGESDumper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESData_IGESEntity *
****************************/
%nodefaultctor IGESData_IGESEntity;
class IGESData_IGESEntity : public Standard_Transient {
	public:
		/****************** AddProperty ******************/
		/**** md5 signature: 11eb1a0a48c504214ac18ded70762762 ****/
		%feature("compactdefaultargs") AddProperty;
		%feature("autodoc", "Adds a property in the list.

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
None
") AddProperty;
		void AddProperty(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** ArePresentAssociativities ******************/
		/**** md5 signature: 707a417cab87284218fbd5d94abbbb41 ****/
		%feature("compactdefaultargs") ArePresentAssociativities;
		%feature("autodoc", "Returns true if the entity is defined with an associativity list, even empty (that is, file contains its length 0) else, the file contained no idencation at all about this list.

Returns
-------
bool
") ArePresentAssociativities;
		Standard_Boolean ArePresentAssociativities();

		/****************** ArePresentProperties ******************/
		/**** md5 signature: 4584fd74af287816a009d302141c768e ****/
		%feature("compactdefaultargs") ArePresentProperties;
		%feature("autodoc", "Returns true if the entity is defined with a property list, even empty (that is, file contains its length 0) else, the file contained no idencation at all about this list.

Returns
-------
bool
") ArePresentProperties;
		Standard_Boolean ArePresentProperties();

		/****************** Associate ******************/
		/**** md5 signature: 9ed5985e9a1f0bcda52be44e2252a6c0 ****/
		%feature("compactdefaultargs") Associate;
		%feature("autodoc", "Sets 'me' in the associativity list of another entity.

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
None
") Associate;
		void Associate(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** Associativities ******************/
		/**** md5 signature: 6ec4d58d67480dbc21455e4edf596926 ****/
		%feature("compactdefaultargs") Associativities;
		%feature("autodoc", "Returns the associativity list under the form of an entityiterator.

Returns
-------
Interface_EntityIterator
") Associativities;
		Interface_EntityIterator Associativities();

		/****************** BlankStatus ******************/
		/**** md5 signature: 3c198eda99c79dd2ea0404847ca6132e ****/
		%feature("compactdefaultargs") BlankStatus;
		%feature("autodoc", "Gives blank status (0 visible, 1 blanked).

Returns
-------
int
") BlankStatus;
		Standard_Integer BlankStatus();

		/****************** CResValues ******************/
		/**** md5 signature: 78002f1c0b06d38e9dd54430805fc2a5 ****/
		%feature("compactdefaultargs") CResValues;
		%feature("autodoc", "Returns 'reserved' alphanumeric values res1 and res2 res1 and res2 have to be reserved as character[9 at least] (remark : their content is changed) returned values are ended by null character in 9th returned boolean is false if res1 and res2 are blank, true else.

Parameters
----------
res1: char *
res2: char *

Returns
-------
bool
") CResValues;
		Standard_Boolean CResValues(const char * res1, const char * res2);

		/****************** Color ******************/
		/**** md5 signature: 9f059c3d16c0eb79fdf5239f02d987e7 ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Returns the iges entity which describes the color of the entity. returns a null handle if this entity was defined as an integer.

Returns
-------
opencascade::handle<IGESData_ColorEntity>
") Color;
		opencascade::handle<IGESData_ColorEntity> Color();

		/****************** CompoundLocation ******************/
		/**** md5 signature: d8f6f9c40c2c55cc1d0ff77fe46e169f ****/
		%feature("compactdefaultargs") CompoundLocation;
		%feature("autodoc", "Returns location by taking in account a parent which has its own location : that one will be combined to that of <self> the parent is considered only if hasoneparent is true, else it is ignored and compoundlocation = location.

Returns
-------
gp_GTrsf
") CompoundLocation;
		gp_GTrsf CompoundLocation();

		/****************** DefColor ******************/
		/**** md5 signature: d9784de5d90075aefe0a2dbe005ae1d2 ****/
		%feature("compactdefaultargs") DefColor;
		%feature("autodoc", "Returns the definition status of color.

Returns
-------
IGESData_DefType
") DefColor;
		virtual IGESData_DefType DefColor();

		/****************** DefLevel ******************/
		/**** md5 signature: 3a684c5344b31bf8103c161b51dc33db ****/
		%feature("compactdefaultargs") DefLevel;
		%feature("autodoc", "Returns the definition status of level.

Returns
-------
IGESData_DefList
") DefLevel;
		virtual IGESData_DefList DefLevel();

		/****************** DefLineFont ******************/
		/**** md5 signature: 381f99ba5ee5dafcb8145c35f7636e72 ****/
		%feature("compactdefaultargs") DefLineFont;
		%feature("autodoc", "Returns the definition status of linefont.

Returns
-------
IGESData_DefType
") DefLineFont;
		virtual IGESData_DefType DefLineFont();

		/****************** DefView ******************/
		/**** md5 signature: be0c3db72aede27028777feb64c92975 ****/
		%feature("compactdefaultargs") DefView;
		%feature("autodoc", "Returns the definition status of the view. this can be: none, one or several.

Returns
-------
IGESData_DefList
") DefView;
		virtual IGESData_DefList DefView();

		/****************** DirFieldEntity ******************/
		/**** md5 signature: dd94642903c43edfbccaf93ac3d0143d ****/
		%feature("compactdefaultargs") DirFieldEntity;
		%feature("autodoc", "Returns the entity which has been recorded for a given field number, i.e. without any cast. maps with : 3 : structure 4 : linefont 5 : levellist 6 : view 7 : transf(ormation matrix) 8 : labeldisplay 13 : color. other values give a null handle it can then be of any kind, while specific items have a type.

Parameters
----------
fieldnum: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") DirFieldEntity;
		opencascade::handle<IGESData_IGESEntity> DirFieldEntity(const Standard_Integer fieldnum);

		/****************** Dissociate ******************/
		/**** md5 signature: 0c02ed30af1330200e9bd25c0645db88 ****/
		%feature("compactdefaultargs") Dissociate;
		%feature("autodoc", "Resets 'me' from the associativity list of another entity.

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
None
") Dissociate;
		void Dissociate(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** FormNumber ******************/
		/**** md5 signature: 01816ab5757c400039bfeebd9b3bcbc2 ****/
		%feature("compactdefaultargs") FormNumber;
		%feature("autodoc", "Returns the form number for that type of an iges entity. the default form number is 0.

Returns
-------
int
") FormNumber;
		Standard_Integer FormNumber();

		/****************** HasLabelDisplay ******************/
		/**** md5 signature: 9c615fbed732eecfa5155cde061accc7 ****/
		%feature("compactdefaultargs") HasLabelDisplay;
		%feature("autodoc", "Returns true if a labeldisplay mode is defined for this entity.

Returns
-------
bool
") HasLabelDisplay;
		Standard_Boolean HasLabelDisplay();

		/****************** HasName ******************/
		/**** md5 signature: 1e1c2790637f6b21f247802eba58ce99 ****/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Says if a name is defined, as short label or as name property (property is looked first, else shortlabel is considered).

Returns
-------
bool
") HasName;
		Standard_Boolean HasName();

		/****************** HasOneParent ******************/
		/**** md5 signature: 0db1d4c4a998e8d80fd0d6c03982cbc5 ****/
		%feature("compactdefaultargs") HasOneParent;
		%feature("autodoc", "Returns true if an entity has one and only one parent, defined by a singleparententity type associativity (explicit sharing). thus, implicit sharing remains defined at model level (see class toollocation).

Returns
-------
bool
") HasOneParent;
		Standard_Boolean HasOneParent();

		/****************** HasShortLabel ******************/
		/**** md5 signature: 1f29e2d54166d8b69975aaf0e8aae29b ****/
		%feature("compactdefaultargs") HasShortLabel;
		%feature("autodoc", "Returns true if a short label is defined. a short label is a non-blank 8-character string.

Returns
-------
bool
") HasShortLabel;
		Standard_Boolean HasShortLabel();

		/****************** HasStructure ******************/
		/**** md5 signature: 8bf587788d3a40a5c0372efe48a98a27 ****/
		%feature("compactdefaultargs") HasStructure;
		%feature("autodoc", "Returns true if an igesentity is defined with a structure (it is normally reserved for certain classes, such as macros).

Returns
-------
bool
") HasStructure;
		Standard_Boolean HasStructure();

		/****************** HasSubScriptNumber ******************/
		/**** md5 signature: 3e229eed9a8086af64d790e1520e7d99 ****/
		%feature("compactdefaultargs") HasSubScriptNumber;
		%feature("autodoc", "Returns true if a subscript number is defined. a subscript number is an integer used to identify a label.

Returns
-------
bool
") HasSubScriptNumber;
		virtual Standard_Boolean HasSubScriptNumber();

		/****************** HasTransf ******************/
		/**** md5 signature: a206f41ea34d912255da7ff3fcb695f7 ****/
		%feature("compactdefaultargs") HasTransf;
		%feature("autodoc", "Returns true if a transformation matrix is defined.

Returns
-------
bool
") HasTransf;
		Standard_Boolean HasTransf();

		/****************** HierarchyStatus ******************/
		/**** md5 signature: 814091e9d5cef2cdf9e02fd374611543 ****/
		%feature("compactdefaultargs") HierarchyStatus;
		%feature("autodoc", "Gives hierarchy status (0-1-2).

Returns
-------
int
") HierarchyStatus;
		Standard_Integer HierarchyStatus();

		/****************** IGESType ******************/
		/**** md5 signature: 2f89b587c31ffcd8749f070fef4d0193 ****/
		%feature("compactdefaultargs") IGESType;
		%feature("autodoc", "Gives iges typing info (includes 'type' and 'form' data).

Returns
-------
IGESData_IGESType
") IGESType;
		IGESData_IGESType IGESType();

		/****************** InitColor ******************/
		/**** md5 signature: 20c3ccba0bc1486834d9f2d11347d57e ****/
		%feature("compactdefaultargs") InitColor;
		%feature("autodoc", "Initializes color data : if <ent> is not null, it gives color, else <rank> gives or erases (if zero) rankcolor.

Parameters
----------
ent: IGESData_ColorEntity
rank: int,optional
	default value is 0

Returns
-------
None
") InitColor;
		void InitColor(const opencascade::handle<IGESData_ColorEntity> & ent, const Standard_Integer rank = 0);

		/****************** InitDirFieldEntity ******************/
		/**** md5 signature: 3eafe875096d0a62ce74c33f5ef34436 ****/
		%feature("compactdefaultargs") InitDirFieldEntity;
		%feature("autodoc", "Initializes a directory field as an entiy of any kind see dirfieldentity for more details.

Parameters
----------
fieldnum: int
ent: IGESData_IGESEntity

Returns
-------
None
") InitDirFieldEntity;
		void InitDirFieldEntity(const Standard_Integer fieldnum, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** InitLevel ******************/
		/**** md5 signature: 30789676685773818257f71dd1704061 ****/
		%feature("compactdefaultargs") InitLevel;
		%feature("autodoc", "Initializes level : if <ent> is not null, it gives levellist, else <val> gives or erases (if zero) unique level.

Parameters
----------
ent: IGESData_LevelListEntity
val: int,optional
	default value is 0

Returns
-------
None
") InitLevel;
		void InitLevel(const opencascade::handle<IGESData_LevelListEntity> & ent, const Standard_Integer val = 0);

		/****************** InitLineFont ******************/
		/**** md5 signature: 918dd4c6a801d2cb9ba94ff6f57038f9 ****/
		%feature("compactdefaultargs") InitLineFont;
		%feature("autodoc", "Initializes linefont : if <ent> is not null, it gives linefont, else <rank> gives or erases (if zero) ranklinefont.

Parameters
----------
ent: IGESData_LineFontEntity
rank: int,optional
	default value is 0

Returns
-------
None
") InitLineFont;
		void InitLineFont(const opencascade::handle<IGESData_LineFontEntity> & ent, const Standard_Integer rank = 0);

		/****************** InitMisc ******************/
		/**** md5 signature: 7332b3a8806ccde6a9398b22ba0c24f3 ****/
		%feature("compactdefaultargs") InitMisc;
		%feature("autodoc", "Initializes various data (those not yet seen above), or erases them if they are given as null (zero for <weightnum>) : <str> for structure, <lab> for labeldisplay, and <weightnum> for weightnumber.

Parameters
----------
str: IGESData_IGESEntity
lab: IGESData_LabelDisplayEntity
weightnum: int

Returns
-------
None
") InitMisc;
		void InitMisc(const opencascade::handle<IGESData_IGESEntity> & str, const opencascade::handle<IGESData_LabelDisplayEntity> & lab, const Standard_Integer weightnum);

		/****************** InitStatus ******************/
		/**** md5 signature: 453e9e179089c43b59f4f5f338aef1b1 ****/
		%feature("compactdefaultargs") InitStatus;
		%feature("autodoc", "Initializes the status of directory part.

Parameters
----------
blank: int
subordinate: int
useflag: int
hierarchy: int

Returns
-------
None
") InitStatus;
		void InitStatus(const Standard_Integer blank, const Standard_Integer subordinate, const Standard_Integer useflag, const Standard_Integer hierarchy);

		/****************** InitTransf ******************/
		/**** md5 signature: 15edbb5bdef6886110a77d9bc633aa93 ****/
		%feature("compactdefaultargs") InitTransf;
		%feature("autodoc", "Initializes transf, or erases it if <ent> is given null.

Parameters
----------
ent: IGESData_TransfEntity

Returns
-------
None
") InitTransf;
		void InitTransf(const opencascade::handle<IGESData_TransfEntity> & ent);

		/****************** InitView ******************/
		/**** md5 signature: 78dbab3db820934b22089e8063a77bdf ****/
		%feature("compactdefaultargs") InitView;
		%feature("autodoc", "Initializes view, or erases it if <ent> is given null.

Parameters
----------
ent: IGESData_ViewKindEntity

Returns
-------
None
") InitView;
		void InitView(const opencascade::handle<IGESData_ViewKindEntity> & ent);

		/****************** LabelDisplay ******************/
		/**** md5 signature: ee2fe05c31dcb311b03fe8559cc0a8ee ****/
		%feature("compactdefaultargs") LabelDisplay;
		%feature("autodoc", "Returns the label display associativity entity if there is one. returns a null handle if there is none.

Returns
-------
opencascade::handle<IGESData_LabelDisplayEntity>
") LabelDisplay;
		opencascade::handle<IGESData_LabelDisplayEntity> LabelDisplay();

		/****************** Level ******************/
		/**** md5 signature: 06f7279e938b54c0bc4a49915192a536 ****/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "Returns the level the entity belongs to. returns -1 if the entity belongs to more than one level.

Returns
-------
int
") Level;
		Standard_Integer Level();

		/****************** LevelList ******************/
		/**** md5 signature: d7769fea2ddbe17721c588ed3d24340d ****/
		%feature("compactdefaultargs") LevelList;
		%feature("autodoc", "Returns levellist if level is defined as a list. returns a null handle if deflevel is not defseveral.

Returns
-------
opencascade::handle<IGESData_LevelListEntity>
") LevelList;
		opencascade::handle<IGESData_LevelListEntity> LevelList();

		/****************** LineFont ******************/
		/**** md5 signature: 43fef7710663f7f4f96fa43adafe90a5 ****/
		%feature("compactdefaultargs") LineFont;
		%feature("autodoc", "Returns linefont as an entity (if defined as reference) returns a null handle if deflinefont is not 'defreference'.

Returns
-------
opencascade::handle<IGESData_LineFontEntity>
") LineFont;
		opencascade::handle<IGESData_LineFontEntity> LineFont();

		/****************** LineWeight ******************/
		/**** md5 signature: e7feb099a03451db8a683621054e9f6f ****/
		%feature("compactdefaultargs") LineWeight;
		%feature("autodoc", "Returns the true line weight, computed from lineweightnumber and global parameter in the model by call to setlineweight.

Returns
-------
float
") LineWeight;
		Standard_Real LineWeight();

		/****************** LineWeightNumber ******************/
		/**** md5 signature: 8bb9498f695e9c36332dc8bbca4498ae ****/
		%feature("compactdefaultargs") LineWeightNumber;
		%feature("autodoc", "Returns the lineweight number (0 not defined), see also lineweight.

Returns
-------
int
") LineWeightNumber;
		Standard_Integer LineWeightNumber();

		/****************** Location ******************/
		/**** md5 signature: cf77359027b042b2c12141fee724bdb5 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns location given by transf in directory part (see above) it must be considered for local definition : if the entity is set in a 'parent', that one can add its one location, but this is not taken in account here : see compoundlocation for that. if no transf is defined, returns identity if transf is itself compound, gives the final result.

Returns
-------
gp_GTrsf
") Location;
		gp_GTrsf Location();

		/****************** NameValue ******************/
		/**** md5 signature: 4203f13bdb9d22464919c0b23eb59758 ****/
		%feature("compactdefaultargs") NameValue;
		%feature("autodoc", "Returns name value as a string (property name or shortlabel) if subnumber is defined, it is concatenated after shortlabel as follows label(number). ignored with a property name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") NameValue;
		opencascade::handle<TCollection_HAsciiString> NameValue();

		/****************** NbAssociativities ******************/
		/**** md5 signature: 76281acc8e6c4e2eec37ccc19fb31766 ****/
		%feature("compactdefaultargs") NbAssociativities;
		%feature("autodoc", "Gives number of recorded associativities (0 no list defined).

Returns
-------
int
") NbAssociativities;
		Standard_Integer NbAssociativities();

		/****************** NbProperties ******************/
		/**** md5 signature: b8d59feba7ff602cf35d658f036ef723 ****/
		%feature("compactdefaultargs") NbProperties;
		%feature("autodoc", "Gives number of recorded properties (0 no list defined).

Returns
-------
int
") NbProperties;
		Standard_Integer NbProperties();

		/****************** NbTypedAssociativities ******************/
		/**** md5 signature: 5c0914c44d6265d2a6d7940389eae9f5 ****/
		%feature("compactdefaultargs") NbTypedAssociativities;
		%feature("autodoc", "Gives how many associativities have a given type.

Parameters
----------
atype: Standard_Type

Returns
-------
int
") NbTypedAssociativities;
		Standard_Integer NbTypedAssociativities(const opencascade::handle<Standard_Type> & atype);

		/****************** NbTypedProperties ******************/
		/**** md5 signature: 4e2e5083c49f669f257791622375920d ****/
		%feature("compactdefaultargs") NbTypedProperties;
		%feature("autodoc", "Gives how many properties have a given type.

Parameters
----------
atype: Standard_Type

Returns
-------
int
") NbTypedProperties;
		Standard_Integer NbTypedProperties(const opencascade::handle<Standard_Type> & atype);

		/****************** Properties ******************/
		/**** md5 signature: b9da45bd72180b9c10809cdc34a30e03 ****/
		%feature("compactdefaultargs") Properties;
		%feature("autodoc", "Returns property list under the form of an entityiterator.

Returns
-------
Interface_EntityIterator
") Properties;
		Interface_EntityIterator Properties();

		/****************** RankColor ******************/
		/**** md5 signature: 748842da901852425d0ed901d57f6955 ****/
		%feature("compactdefaultargs") RankColor;
		%feature("autodoc", "Returns the color definition as an integer value if the color was defined as a rank. warning a negative value is returned if the color was defined as an entity.

Returns
-------
int
") RankColor;
		Standard_Integer RankColor();

		/****************** RankLineFont ******************/
		/**** md5 signature: 38c961b6418a3f68e1631c9b1e7f9361 ****/
		%feature("compactdefaultargs") RankLineFont;
		%feature("autodoc", "Returns linefont definition as an integer (if defined as rank) if linefont is defined as an entity, returns a negative value.

Returns
-------
int
") RankLineFont;
		Standard_Integer RankLineFont();

		/****************** RemoveProperty ******************/
		/**** md5 signature: 68d52b7c50f6db62ea2798d360495dcd ****/
		%feature("compactdefaultargs") RemoveProperty;
		%feature("autodoc", "Removes a property from the list.

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
None
") RemoveProperty;
		void RemoveProperty(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** SetLabel ******************/
		/**** md5 signature: a2b1447397f697fce5bf5e69cdbb139e ****/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "Sets a new label to an iges entity if <sub> is given, it sets value of subscriptnumber else, subscriptnumber is erased.

Parameters
----------
label: TCollection_HAsciiString
sub: int,optional
	default value is -1

Returns
-------
None
") SetLabel;
		void SetLabel(const opencascade::handle<TCollection_HAsciiString> & label, const Standard_Integer sub = -1);

		/****************** SetLineWeight ******************/
		/**** md5 signature: 45a707b0245ae43be696ca63f51811a8 ****/
		%feature("compactdefaultargs") SetLineWeight;
		%feature("autodoc", "Computes and sets 'true' line weight according iges rules from global data maxlineweight (maxv) and lineweightgrad (gradw), or sets it to defw (default) if lineweightnumber is null.

Parameters
----------
defw: float
maxw: float
gradw: int

Returns
-------
None
") SetLineWeight;
		void SetLineWeight(const Standard_Real defw, const Standard_Real maxw, const Standard_Integer gradw);

		/****************** ShortLabel ******************/
		/**** md5 signature: 6f2ffdcbc6732ebfbbc06bcb397d07ab ****/
		%feature("compactdefaultargs") ShortLabel;
		%feature("autodoc", "Returns the label value for this iges entity as a string. warning if the label is blank, this string is null.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ShortLabel;
		opencascade::handle<TCollection_HAsciiString> ShortLabel();

		/****************** SingleView ******************/
		/**** md5 signature: 777ae42d6386ad3e3242612555faf2c3 ****/
		%feature("compactdefaultargs") SingleView;
		%feature("autodoc", "Returns the view as a single view if it was defined as such and not as a list of views. warning a null handle is returned if defview does not have the value defone.

Returns
-------
opencascade::handle<IGESData_ViewKindEntity>
") SingleView;
		opencascade::handle<IGESData_ViewKindEntity> SingleView();

		/****************** Structure ******************/
		/**** md5 signature: 07cafc895ef77ae4ae90a963dfb9dc08 ****/
		%feature("compactdefaultargs") Structure;
		%feature("autodoc", "Returns structure (used by some types of iges entities only) returns a null handle if structure is not defined.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Structure;
		opencascade::handle<IGESData_IGESEntity> Structure();

		/****************** SubScriptNumber ******************/
		/**** md5 signature: 926d708051b655f4963c2a9c9fcdfb69 ****/
		%feature("compactdefaultargs") SubScriptNumber;
		%feature("autodoc", "Returns the integer subscript number used to identify this iges entity. warning 0 is returned if no subscript number is defined for this iges entity.

Returns
-------
int
") SubScriptNumber;
		Standard_Integer SubScriptNumber();

		/****************** SubordinateStatus ******************/
		/**** md5 signature: 70feec2a58cb5b617a258b2a3105db5d ****/
		%feature("compactdefaultargs") SubordinateStatus;
		%feature("autodoc", "Gives subordinate switch (0-1-2-3).

Returns
-------
int
") SubordinateStatus;
		Standard_Integer SubordinateStatus();

		/****************** Transf ******************/
		/**** md5 signature: 342b691ddee0e9182c4cfb65faa08c4b ****/
		%feature("compactdefaultargs") Transf;
		%feature("autodoc", "Returns the transformation matrix (under iges definition) returns a null handle if there is none for a more complete use, see location & compoundlocation.

Returns
-------
opencascade::handle<IGESData_TransfEntity>
") Transf;
		opencascade::handle<IGESData_TransfEntity> Transf();

		/****************** TypeNumber ******************/
		/**** md5 signature: 8bfe972f6ae89ab21183f7f2c6ffb423 ****/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "Gives iges type number (often coupled with form number).

Returns
-------
int
") TypeNumber;
		Standard_Integer TypeNumber();

		/****************** TypedAssociativity ******************/
		/**** md5 signature: 3c01422c877e912134487113b82f007e ****/
		%feature("compactdefaultargs") TypedAssociativity;
		%feature("autodoc", "Returns the associativity of a given type (if only one exists) error if none or more than one.

Parameters
----------
atype: Standard_Type

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TypedAssociativity;
		opencascade::handle<IGESData_IGESEntity> TypedAssociativity(const opencascade::handle<Standard_Type> & atype);

		/****************** TypedProperty ******************/
		/**** md5 signature: e1eb748f854a03b81a0e0e177375a310 ****/
		%feature("compactdefaultargs") TypedProperty;
		%feature("autodoc", "Returns the property of a given type error if none or more than one.

Parameters
----------
atype: Standard_Type
anum: int,optional
	default value is 0

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TypedProperty;
		opencascade::handle<IGESData_IGESEntity> TypedProperty(const opencascade::handle<Standard_Type> & atype, const Standard_Integer anum = 0);

		/****************** UniqueParent ******************/
		/**** md5 signature: a398586a4430ec15b850b027dd08f2e6 ****/
		%feature("compactdefaultargs") UniqueParent;
		%feature("autodoc", "Returns the unique parent (in the sense given by hasoneparent) error if there is none or several.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") UniqueParent;
		opencascade::handle<IGESData_IGESEntity> UniqueParent();

		/****************** UseFlag ******************/
		/**** md5 signature: 5ff6c4705401bef9792e82534561631c ****/
		%feature("compactdefaultargs") UseFlag;
		%feature("autodoc", "Gives entity's use flag (0 to 5).

Returns
-------
int
") UseFlag;
		Standard_Integer UseFlag();

		/****************** VectorLocation ******************/
		/**** md5 signature: 9ff63ce09420f1fb8fbceb9e2437f31e ****/
		%feature("compactdefaultargs") VectorLocation;
		%feature("autodoc", "Returns location considered for vectors, i.e. without its translation part. as location, it gives local definition.

Returns
-------
gp_GTrsf
") VectorLocation;
		gp_GTrsf VectorLocation();

		/****************** View ******************/
		/**** md5 signature: 25b5f181ee45201916e5df752a187b0a ****/
		%feature("compactdefaultargs") View;
		%feature("autodoc", "Returns the view of this iges entity. this view can be a single view or a list of views. warning a null handle is returned if the view is not defined.

Returns
-------
opencascade::handle<IGESData_ViewKindEntity>
") View;
		opencascade::handle<IGESData_ViewKindEntity> View();

		/****************** ViewList ******************/
		/**** md5 signature: 802ad423f0020138040b5c0ce0423dfa ****/
		%feature("compactdefaultargs") ViewList;
		%feature("autodoc", "Returns the view of this iges entity as a list. warning a null handle is returned if the definition status does not have the value defseveral.

Returns
-------
opencascade::handle<IGESData_ViewKindEntity>
") ViewList;
		opencascade::handle<IGESData_ViewKindEntity> ViewList();

};


%make_alias(IGESData_IGESEntity)

%extend IGESData_IGESEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESData_IGESModel *
***************************/
class IGESData_IGESModel : public Interface_InterfaceModel {
	public:
		/****************** IGESData_IGESModel ******************/
		/**** md5 signature: 4a4bc58abc329f39396976972a75767b ****/
		%feature("compactdefaultargs") IGESData_IGESModel;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESData_IGESModel;
		 IGESData_IGESModel();

		/****************** AddStartLine ******************/
		/**** md5 signature: b2e082dbb9611dc32a6105ad74c24e14 ****/
		%feature("compactdefaultargs") AddStartLine;
		%feature("autodoc", "Adds a new string to the existing start section at the end if atnum is 0 or not given, or before atnumth line.

Parameters
----------
line: char *
atnum: int,optional
	default value is 0

Returns
-------
None
") AddStartLine;
		void AddStartLine(const char * line, const Standard_Integer atnum = 0);

		/****************** ApplyStatic ******************/
		/**** md5 signature: 994a9ac1357b52e0bee3cbef68d704f1 ****/
		%feature("compactdefaultargs") ApplyStatic;
		%feature("autodoc", "Sets some of the global section parameters with the values defined by the translation parameters. param may be: - receiver (value read in xstep.iges.header.receiver), - author (value read in xstep.iges.header.author), - company (value read in xstep.iges.header.company). the default value for param is an empty string. returns true when done and if param is given, false if param is unknown or empty. note: set the unit in the iges file global section via igesdata_basiceditor class.

Parameters
----------
param: char *,optional
	default value is ""

Returns
-------
bool
") ApplyStatic;
		Standard_Boolean ApplyStatic(const char * param = "");

		/****************** ClearHeader ******************/
		/**** md5 signature: e0fe665687ba246130521f416ab14715 ****/
		%feature("compactdefaultargs") ClearHeader;
		%feature("autodoc", "Erases all data specific to iges file header (start + global).

Returns
-------
None
") ClearHeader;
		void ClearHeader();

		/****************** ClearLabels ******************/
		/**** md5 signature: 3045f499e790e0fc2a95acdb522f6ec7 ****/
		%feature("compactdefaultargs") ClearLabels;
		%feature("autodoc", "Erases specific labels, i.e. does nothing.

Returns
-------
None
") ClearLabels;
		void ClearLabels();

		/****************** ClearStartSection ******************/
		/**** md5 signature: 29b5c728821e04390dafe8b05fae72a4 ****/
		%feature("compactdefaultargs") ClearStartSection;
		%feature("autodoc", "Clears the iges file start section.

Returns
-------
None
") ClearStartSection;
		void ClearStartSection();

		/****************** DNum ******************/
		/**** md5 signature: 9a55ce46e7c2f097913f24946be05bcc ****/
		%feature("compactdefaultargs") DNum;
		%feature("autodoc", "Returns the equivalent de number for an entity, i.e. 2*number(ent)-1 , or 0 if <ent> is unknown from <self> this de number is used for file writing for instance.

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
int
") DNum;
		Standard_Integer DNum(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** DumpHeader ******************/
		/**** md5 signature: 8c26c3bada2e328de3402788b3830cab ****/
		%feature("compactdefaultargs") DumpHeader;
		%feature("autodoc", "Prints the iges file header (start and global sections) to the log file. the integer parameter is intended to be used as a level indicator but is not used at present.

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
		/**** md5 signature: 9ad99fc403d738612d5a7261abb4e74e ****/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "Returns an iges entity given by its rank number.

Parameters
----------
num: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Entity;
		opencascade::handle<IGESData_IGESEntity> Entity(const Standard_Integer num);

		/****************** GetFromAnother ******************/
		/**** md5 signature: 07f4171563413e184028d7c8759ed71c ****/
		%feature("compactdefaultargs") GetFromAnother;
		%feature("autodoc", "Gets header (globalsection) from another model.

Parameters
----------
other: Interface_InterfaceModel

Returns
-------
None
") GetFromAnother;
		void GetFromAnother(const opencascade::handle<Interface_InterfaceModel> & other);

		/****************** GlobalSection ******************/
		/**** md5 signature: 9251755b31e2dbc4bc4c014b68758586 ****/
		%feature("compactdefaultargs") GlobalSection;
		%feature("autodoc", "Returns the global section of the iges file.

Returns
-------
IGESData_GlobalSection
") GlobalSection;
		const IGESData_GlobalSection & GlobalSection();

		/****************** NbStartLines ******************/
		/**** md5 signature: 2d161449c39e91329b09abb1adcacd6b ****/
		%feature("compactdefaultargs") NbStartLines;
		%feature("autodoc", "Returns the count of recorded start lines.

Returns
-------
int
") NbStartLines;
		Standard_Integer NbStartLines();

		/****************** NewEmptyModel ******************/
		/**** md5 signature: 40876c8eb593ebc41abaf47645e862e5 ****/
		%feature("compactdefaultargs") NewEmptyModel;
		%feature("autodoc", "Returns a new empty model, same type as <self> i.e. igesmodel.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewEmptyModel;
		opencascade::handle<Interface_InterfaceModel> NewEmptyModel();

		/****************** PrintInfo ******************/
		/**** md5 signature: 28774f1d8ce0ab446201b5920328210b ****/
		%feature("compactdefaultargs") PrintInfo;
		%feature("autodoc", "Prints label specific to iges norm for a given entity, i.e. its directory entry number (2*number-1).

Parameters
----------
ent: Standard_Transient
S: Message_Messenger

Returns
-------
None
") PrintInfo;
		void PrintInfo(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Message_Messenger> & S);

		/****************** PrintLabel ******************/
		/**** md5 signature: 4457bad1928cdec47f83e1bb0c2b5633 ****/
		%feature("compactdefaultargs") PrintLabel;
		%feature("autodoc", "Prints label specific to iges norm for a given entity, i.e. its directory entry number (2*number-1).

Parameters
----------
ent: Standard_Transient
S: Message_Messenger

Returns
-------
None
") PrintLabel;
		void PrintLabel(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Message_Messenger> & S);

		/****************** PrintToLog ******************/
		/**** md5 signature: dfb1967e9da3580659ff79f786499b8c ****/
		%feature("compactdefaultargs") PrintToLog;
		%feature("autodoc", "Prints label specific to iges norm for a given -- -- entity, i.e. its directory entry number (2*number-1) in the log file format.

Parameters
----------
ent: Standard_Transient
S: Message_Messenger

Returns
-------
None
") PrintToLog;
		virtual void PrintToLog(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Message_Messenger> & S);

		/****************** SetGlobalSection ******************/
		/**** md5 signature: 1af9179d630020de23e87e44cbffad84 ****/
		%feature("compactdefaultargs") SetGlobalSection;
		%feature("autodoc", "Sets the global section of the iges file.

Parameters
----------
header: IGESData_GlobalSection

Returns
-------
None
") SetGlobalSection;
		void SetGlobalSection(const IGESData_GlobalSection & header);

		/****************** SetLineWeights ******************/
		/**** md5 signature: e662b8b17b36bae19c5a66f41993209b ****/
		%feature("compactdefaultargs") SetLineWeights;
		%feature("autodoc", "Sets lineweights of contained entities according header data (maxlineweight and lineweightgrad) or to a default value for undefined weights.

Parameters
----------
defw: float

Returns
-------
None
") SetLineWeights;
		void SetLineWeights(const Standard_Real defw);

		/****************** SetStartSection ******************/
		/**** md5 signature: ebf891bd634c8accc53a220ba641c312 ****/
		%feature("compactdefaultargs") SetStartSection;
		%feature("autodoc", "Sets a new start section from a list of strings. if copy is false, the start section will be shared. any modifications made to the strings later on, will have an effect on the start section. if copy is true (default value), an independent copy of the strings is created and used as the start section. any modifications made to the strings later on, will have no effect on the start section.

Parameters
----------
list: TColStd_HSequenceOfHAsciiString
copy: bool,optional
	default value is Standard_True

Returns
-------
None
") SetStartSection;
		void SetStartSection(const opencascade::handle<TColStd_HSequenceOfHAsciiString> & list, const Standard_Boolean copy = Standard_True);

		/****************** StartLine ******************/
		/**** md5 signature: 230c5bf04b169a2355c350165b2c19cc ****/
		%feature("compactdefaultargs") StartLine;
		%feature("autodoc", "Returns a line from the iges file start section by specifying its number. an empty string is returned if the number given is out of range, the range being from 1 to nbstartlines.

Parameters
----------
num: int

Returns
-------
char *
") StartLine;
		const char * StartLine(const Standard_Integer num);

		/****************** StartSection ******************/
		/**** md5 signature: 998fa00be2a7bd3f42c5a6d35ff6278e ****/
		%feature("compactdefaultargs") StartSection;
		%feature("autodoc", "Returns model's start section (list of comment lines).

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") StartSection;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> StartSection();

		/****************** StringLabel ******************/
		/**** md5 signature: 8051e56e871a0ca086f3d44adb661ad2 ****/
		%feature("compactdefaultargs") StringLabel;
		%feature("autodoc", "Returns a string with the label attached to a given entity, i.e. a string 'dnn' with nn = directory entry number (2*n-1).

Parameters
----------
ent: Standard_Transient

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") StringLabel;
		opencascade::handle<TCollection_HAsciiString> StringLabel(const opencascade::handle<Standard_Transient> & ent);

		/****************** VerifyCheck ******************/
		/**** md5 signature: 1054ee41d20b1185127d800c7331e3c3 ****/
		%feature("compactdefaultargs") VerifyCheck;
		%feature("autodoc", "Checks that the iges file global section contains valid data that conforms to the iges specifications.

Parameters
----------
ach: Interface_Check

Returns
-------
None
") VerifyCheck;
		virtual void VerifyCheck(opencascade::handle<Interface_Check> & ach);

};


%make_alias(IGESData_IGESModel)

%extend IGESData_IGESModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESData_IGESReaderData *
********************************/
class IGESData_IGESReaderData : public Interface_FileReaderData {
	public:
		/****************** IGESData_IGESReaderData ******************/
		/**** md5 signature: 7bd1646350308a5e3a1609527631bae5 ****/
		%feature("compactdefaultargs") IGESData_IGESReaderData;
		%feature("autodoc", "Creates igesreaderdata correctly dimensionned (for arrays) <nbe> count of entities, that is, half nb of directory lines <nbp> : count of parameters.

Parameters
----------
nbe: int
nbp: int

Returns
-------
None
") IGESData_IGESReaderData;
		 IGESData_IGESReaderData(const Standard_Integer nbe, const Standard_Integer nbp);

		/****************** AddGlobal ******************/
		/**** md5 signature: ec5685d7554a231058028d1107032f97 ****/
		%feature("compactdefaultargs") AddGlobal;
		%feature("autodoc", "Adds a parameter to global section's parameter list.

Parameters
----------
atype: Interface_ParamType
aval: char *

Returns
-------
None
") AddGlobal;
		void AddGlobal(const Interface_ParamType atype, const char * aval);

		/****************** AddStartLine ******************/
		/**** md5 signature: ce16629f6b3db7e5bbe2a7c8d7a4bc5f ****/
		%feature("compactdefaultargs") AddStartLine;
		%feature("autodoc", "Adds a start line to start section.

Parameters
----------
aval: char *

Returns
-------
None
") AddStartLine;
		void AddStartLine(const char * aval);

		/****************** DefaultLineWeight ******************/
		/**** md5 signature: 6dfd947d9c6ba05b9b68428e24e65be3 ****/
		%feature("compactdefaultargs") DefaultLineWeight;
		%feature("autodoc", "Returns the recorded default line weight, if there is (else, returns 0).

Returns
-------
float
") DefaultLineWeight;
		Standard_Real DefaultLineWeight();

		/****************** DirPart ******************/
		/**** md5 signature: e38e8285a983ba750a194e68db50c834 ****/
		%feature("compactdefaultargs") DirPart;
		%feature("autodoc", "Returns dirpart identified by record no (half dsect number).

Parameters
----------
num: int

Returns
-------
IGESData_DirPart
") DirPart;
		const IGESData_DirPart & DirPart(const Standard_Integer num);

		/****************** DirType ******************/
		/**** md5 signature: 5019de0967d38befc3938c68b6c48a9d ****/
		%feature("compactdefaultargs") DirType;
		%feature("autodoc", "Returns 'type' and 'form' info from a directory part.

Parameters
----------
num: int

Returns
-------
IGESData_IGESType
") DirType;
		IGESData_IGESType DirType(const Standard_Integer num);

		/****************** DirValues ******************/
		/**** md5 signature: 6475add3e7837b498bc2310ece31b391 ****/
		%feature("compactdefaultargs") DirValues;
		%feature("autodoc", "Returns values recorded in directory part n0 <num>.

Parameters
----------
num: int
res1: char *
res2: char *
label: char *
subs: char *

Returns
-------
i1: int
i2: int
i3: int
i4: int
i5: int
i6: int
i7: int
i8: int
i9: int
i10: int
i11: int
i12: int
i13: int
i14: int
i15: int
i16: int
i17: int
") DirValues;
		void DirValues(const Standard_Integer num, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, const char * & res1, const char * & res2, const char * & label, const char * & subs);

		/****************** FindNextRecord ******************/
		/**** md5 signature: b54f23c95a9eaf7d62f9c7b9d32982b2 ****/
		%feature("compactdefaultargs") FindNextRecord;
		%feature("autodoc", "Determines next suitable record from num; that is num+1 except for last one which gives 0.

Parameters
----------
num: int

Returns
-------
int
") FindNextRecord;
		Standard_Integer FindNextRecord(const Standard_Integer num);

		/****************** GlobalCheck ******************/
		/**** md5 signature: e6a5247811a8543d07da3a4917e3752a ****/
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "Returns the recorded global check.

Returns
-------
opencascade::handle<Interface_Check>
") GlobalCheck;
		opencascade::handle<Interface_Check> GlobalCheck();

		/****************** GlobalSection ******************/
		/**** md5 signature: 9251755b31e2dbc4bc4c014b68758586 ****/
		%feature("compactdefaultargs") GlobalSection;
		%feature("autodoc", "Returns header as globalsection.

Returns
-------
IGESData_GlobalSection
") GlobalSection;
		const IGESData_GlobalSection & GlobalSection();

		/****************** NbEntities ******************/
		/**** md5 signature: ab39f1a260e05424e9d879a047ae3f8d ****/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns count of recorded entities (i.e. size of directory).

Returns
-------
int
") NbEntities;
		virtual Standard_Integer NbEntities();

		/****************** SetDefaultLineWeight ******************/
		/**** md5 signature: ea91eb9fed0bcebc6a359e1960f9b949 ****/
		%feature("compactdefaultargs") SetDefaultLineWeight;
		%feature("autodoc", "Allows to set a default line weight, will be later applied at load time, on entities which have no specified line weight.

Parameters
----------
defw: float

Returns
-------
None
") SetDefaultLineWeight;
		void SetDefaultLineWeight(const Standard_Real defw);

		/****************** SetDirPart ******************/
		/**** md5 signature: f5563f27adc7f5a15093df370f3cd0bc ****/
		%feature("compactdefaultargs") SetDirPart;
		%feature("autodoc", "Fills a dirpart, designated by its rank (that is, (n+1)/2 if n is its first number in section d).

Parameters
----------
num: int
i1: int
i2: int
i3: int
i4: int
i5: int
i6: int
i7: int
i8: int
i9: int
i10: int
i11: int
i12: int
i13: int
i14: int
i15: int
i16: int
i17: int
res1: char *
res2: char *
label: char *
subs: char *

Returns
-------
None
") SetDirPart;
		void SetDirPart(const Standard_Integer num, const Standard_Integer i1, const Standard_Integer i2, const Standard_Integer i3, const Standard_Integer i4, const Standard_Integer i5, const Standard_Integer i6, const Standard_Integer i7, const Standard_Integer i8, const Standard_Integer i9, const Standard_Integer i10, const Standard_Integer i11, const Standard_Integer i12, const Standard_Integer i13, const Standard_Integer i14, const Standard_Integer i15, const Standard_Integer i16, const Standard_Integer i17, const char * res1, const char * res2, const char * label, const char * subs);

		/****************** SetEntityNumbers ******************/
		/**** md5 signature: 2160d07f29f3b4f2e31932dc1880e6da ****/
		%feature("compactdefaultargs") SetEntityNumbers;
		%feature("autodoc", "Determines reference numbers in entitynumber fields (called by setentities from igesreadertool) works on 'integer' type parameters, because iges does not distinguish integer and entity refs : every integer which is odd and less than twice nbrecords can be an entity ref ... (ref number is then (n+1)/2 if n is the integer value).

Returns
-------
None
") SetEntityNumbers;
		void SetEntityNumbers();

		/****************** SetGlobalSection ******************/
		/**** md5 signature: 9d230dff88b6d731cd73911eabb472ee ****/
		%feature("compactdefaultargs") SetGlobalSection;
		%feature("autodoc", "Reads header (as globalsection) content from the paramset after it has been filled by successive calls to addglobal.

Returns
-------
None
") SetGlobalSection;
		void SetGlobalSection();

		/****************** StartSection ******************/
		/**** md5 signature: 998fa00be2a7bd3f42c5a6d35ff6278e ****/
		%feature("compactdefaultargs") StartSection;
		%feature("autodoc", "Returns the start section in once.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") StartSection;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> StartSection();

};


%make_alias(IGESData_IGESReaderData)

%extend IGESData_IGESReaderData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESData_IGESReaderTool *
********************************/
class IGESData_IGESReaderTool : public Interface_FileReaderTool {
	public:
		/****************** IGESData_IGESReaderTool ******************/
		/**** md5 signature: 2be4dc2d191575581bce3c5f59d6388c ****/
		%feature("compactdefaultargs") IGESData_IGESReaderTool;
		%feature("autodoc", "Creates igesreadertool to work with an igesreaderdata and an iges protocol. actually, no lib is used.

Parameters
----------
reader: IGESData_IGESReaderData
protocol: IGESData_Protocol

Returns
-------
None
") IGESData_IGESReaderTool;
		 IGESData_IGESReaderTool(const opencascade::handle<IGESData_IGESReaderData> & reader, const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** AnalyseRecord ******************/
		/**** md5 signature: 11e711b41d10e9d1ee2744d9797437ea ****/
		%feature("compactdefaultargs") AnalyseRecord;
		%feature("autodoc", "Fills an entity, given record no; works by calling readdirpart then readparams (with help of a paramreader), then if required readprops and readassocs, from igesentity returns true if no fail has been recorded.

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
		/**** md5 signature: 77f0fe12db475c0a685ef00996ac9075 ****/
		%feature("compactdefaultargs") BeginRead;
		%feature("autodoc", "Fills model's header, that is, its globalsection.

Parameters
----------
amodel: Interface_InterfaceModel

Returns
-------
None
") BeginRead;
		void BeginRead(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** EndRead ******************/
		/**** md5 signature: 410f49289536f95f2a8341a522a74781 ****/
		%feature("compactdefaultargs") EndRead;
		%feature("autodoc", "After reading entities, true line weights can be computed.

Parameters
----------
amodel: Interface_InterfaceModel

Returns
-------
None
") EndRead;
		virtual void EndRead(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** Prepare ******************/
		/**** md5 signature: 9cfe3a34381ef8cbe2c88cf2d2f616ac ****/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "Binds empty entities to records, works with the protocol (from igesdata) stored and later used rq : actually, sets dnum into iges entities also loads the list of parameters for paramreader.

Parameters
----------
reco: IGESData_FileRecognizer

Returns
-------
None
") Prepare;
		void Prepare(const opencascade::handle<IGESData_FileRecognizer> & reco);

		/****************** ReadAssocs ******************/
		/**** md5 signature: d591d98a58b15cf05d804e773c814806 ****/
		%feature("compactdefaultargs") ReadAssocs;
		%feature("autodoc", "Reads associativity list, if there is (if not, does nothing) criterium is : current parameter of pr remains inside params list, and stage is 'own' same conditions as above; in addition, no parameter must be let after the list once read note that 'associated' entities are not declared 'shared'.

Parameters
----------
ent: IGESData_IGESEntity
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadAssocs;
		void ReadAssocs(const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** ReadDir ******************/
		/**** md5 signature: bf7e78cb043b431597579fee160e3250 ****/
		%feature("compactdefaultargs") ReadDir;
		%feature("autodoc", "Reads directory part componants from file; dp is the litteral directory part, ir detains entities referenced by dp.

Parameters
----------
ent: IGESData_IGESEntity
IR: IGESData_IGESReaderData
DP: IGESData_DirPart
ach: Interface_Check

Returns
-------
None
") ReadDir;
		void ReadDir(const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, const IGESData_DirPart & DP, opencascade::handle<Interface_Check> & ach);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: c2a7a1044b7d8d316de3ab87ef8f43b1 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Performs reading of own parameters for each igesentity works with the readerlib loaded with readwritemodules for iges in case of failure, tries undefinedentity from iges.

Parameters
----------
ent: IGESData_IGESEntity
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** ReadProps ******************/
		/**** md5 signature: 063dccaba6a476008f1c9e9e43114cc2 ****/
		%feature("compactdefaultargs") ReadProps;
		%feature("autodoc", "Reads property list, if there is (if not, does nothing) criterium is : current parameter of pr remains inside params list, and stage is 'own' current parameter must be a positive integer, which value gives the length of the list; else, a fail is produced (into check of pr) and reading process is stopped.

Parameters
----------
ent: IGESData_IGESEntity
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadProps;
		void ReadProps(const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** Recognize ******************/
		/**** md5 signature: 910d8cba6a79ab1da4faa756f31c32c7 ****/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "Recognizes records by asking protocol (on data of dirtype).

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


%extend IGESData_IGESReaderTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IGESData_IGESType *
**************************/
class IGESData_IGESType {
	public:
		/****************** IGESData_IGESType ******************/
		/**** md5 signature: e98d58f35bad767849b7598c27a8bdb3 ****/
		%feature("compactdefaultargs") IGESData_IGESType;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESData_IGESType;
		 IGESData_IGESType();

		/****************** IGESData_IGESType ******************/
		/**** md5 signature: 5d6fc738619a208b8bf5cac6d8aa8203 ****/
		%feature("compactdefaultargs") IGESData_IGESType;
		%feature("autodoc", "No available documentation.

Parameters
----------
atype: int
aform: int

Returns
-------
None
") IGESData_IGESType;
		 IGESData_IGESType(const Standard_Integer atype, const Standard_Integer aform);

		/****************** Form ******************/
		/**** md5 signature: 3d0d90fa7c53c730feed4574fa16c0b4 ****/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Returns 'form' data.

Returns
-------
int
") Form;
		Standard_Integer Form();

		/****************** IsEqual ******************/
		/**** md5 signature: 204420b251ddf3b89f3d3ed25993bbce ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Compares two igestypes, avoiding comparing their fields.

Parameters
----------
another: IGESData_IGESType

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const IGESData_IGESType & another);

		/****************** Nullify ******************/
		/**** md5 signature: 1915d5159e87738b7b9af9d5accf4c6e ****/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "Resets fields (usefull when an igestype is stored as mask).

Returns
-------
None
") Nullify;
		void Nullify();

		/****************** Type ******************/
		/**** md5 signature: fadaf18b7481222141380b2bb22870ff ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns 'type' data.

Returns
-------
int
") Type;
		Standard_Integer Type();


            %extend{
                bool __eq_wrapper__(const IGESData_IGESType other) {
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


%extend IGESData_IGESType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESData_IGESWriter *
****************************/
class IGESData_IGESWriter {
	public:
		/****************** IGESData_IGESWriter ******************/
		/**** md5 signature: 6cfa98b78c1e12625adfb9e50d92ce7c ****/
		%feature("compactdefaultargs") IGESData_IGESWriter;
		%feature("autodoc", "Creates an igeswriter, empty ready to work (see the methods sendmodel and print).

Parameters
----------
amodel: IGESData_IGESModel

Returns
-------
None
") IGESData_IGESWriter;
		 IGESData_IGESWriter(const opencascade::handle<IGESData_IGESModel> & amodel);

		/****************** IGESData_IGESWriter ******************/
		/**** md5 signature: 1a168d67a4f832f17c10508919292f64 ****/
		%feature("compactdefaultargs") IGESData_IGESWriter;
		%feature("autodoc", "Default constructor (not used) to satisfy the compiler.

Returns
-------
None
") IGESData_IGESWriter;
		 IGESData_IGESWriter();

		/****************** IGESData_IGESWriter ******************/
		/**** md5 signature: 60bc2594f2ee21e935e2d0d855ae0bf4 ****/
		%feature("compactdefaultargs") IGESData_IGESWriter;
		%feature("autodoc", "Constructor by copy (not used) to satisfy the compiler.

Parameters
----------
other: IGESData_IGESWriter

Returns
-------
None
") IGESData_IGESWriter;
		 IGESData_IGESWriter(const IGESData_IGESWriter & other);

		/****************** Associativities ******************/
		/**** md5 signature: ebefaea9b8bf88426937d6634dd2eaca ****/
		%feature("compactdefaultargs") Associativities;
		%feature("autodoc", "Sends associativity list, as complement of parameters list error if not in sections dp or stage not 'associativity'.

Parameters
----------
anent: IGESData_IGESEntity

Returns
-------
None
") Associativities;
		void Associativities(const opencascade::handle<IGESData_IGESEntity> & anent);

		/****************** DirPart ******************/
		/**** md5 signature: a58406ae76e01f3bbf334f828411f5eb ****/
		%feature("compactdefaultargs") DirPart;
		%feature("autodoc", "Translates directory part of an entity into a litteral dirpart some infos are computed after sending parameters error if not in sections dp or stage not 'dir'.

Parameters
----------
anent: IGESData_IGESEntity

Returns
-------
None
") DirPart;
		void DirPart(const opencascade::handle<IGESData_IGESEntity> & anent);

		/****************** EndEntity ******************/
		/**** md5 signature: 2e21c428951219249bd42b33a599281b ****/
		%feature("compactdefaultargs") EndEntity;
		%feature("autodoc", "Declares end of sending an entity (ends param list by ';').

Returns
-------
None
") EndEntity;
		void EndEntity();

		/****************** FloatWriter ******************/
		/**** md5 signature: 861009c9fe600b2a8fc50cd628967a67 ****/
		%feature("compactdefaultargs") FloatWriter;
		%feature("autodoc", "Returns the embedded floatwriter, which controls sending reals use this method to access floatwriter in order to consult or change its options (mainformat, formatforrange,zerosuppress), because it is returned as the address of its field.

Returns
-------
Interface_FloatWriter
") FloatWriter;
		Interface_FloatWriter & FloatWriter();

		/****************** OwnParams ******************/
		/**** md5 signature: 1a8c0ea27d5f597c466e6147a077b86d ****/
		%feature("compactdefaultargs") OwnParams;
		%feature("autodoc", "Sends own parameters of the entity, by sending firstly its type, then calling specific method writeownparams error if not in sections dp or stage not 'own'.

Parameters
----------
anent: IGESData_IGESEntity

Returns
-------
None
") OwnParams;
		void OwnParams(const opencascade::handle<IGESData_IGESEntity> & anent);


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
		/****************** Properties ******************/
		/**** md5 signature: 593129876ee8c43cc811cf1423c82b5d ****/
		%feature("compactdefaultargs") Properties;
		%feature("autodoc", "Sends property list, as complement of parameters list error if not in sections dp or stage not 'property'.

Parameters
----------
anent: IGESData_IGESEntity

Returns
-------
None
") Properties;
		void Properties(const opencascade::handle<IGESData_IGESEntity> & anent);

		/****************** SectionG ******************/
		/**** md5 signature: f70e27ff05550f06ae45ade95d2d0146 ****/
		%feature("compactdefaultargs") SectionG;
		%feature("autodoc", "Prepares sending of header, from a globalsection (stores it) error if sections was not called just before takes in account special characters (separator, endmark).

Parameters
----------
header: IGESData_GlobalSection

Returns
-------
None
") SectionG;
		void SectionG(const IGESData_GlobalSection & header);

		/****************** SectionS ******************/
		/**** md5 signature: 2129bff17ae34492037c8deb6b7cc519 ****/
		%feature("compactdefaultargs") SectionS;
		%feature("autodoc", "Declares sending of s section (only a declaration) error if state is not initial.

Returns
-------
None
") SectionS;
		void SectionS();

		/****************** SectionStrings ******************/
		/**** md5 signature: 80ebd9f11f222c20b13b89b7313ac65e ****/
		%feature("compactdefaultargs") SectionStrings;
		%feature("autodoc", "Returns the list of strings for a section given its rank 1 : start (if not empty) 2 : global 3 or 4 : parameters rq: no string list for directory section an empty section gives a null handle.

Parameters
----------
numsec: int

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") SectionStrings;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> SectionStrings(const Standard_Integer numsec);

		/****************** SectionT ******************/
		/**** md5 signature: 71f6640137d3036b727d79b6bab712cb ****/
		%feature("compactdefaultargs") SectionT;
		%feature("autodoc", "Declares sending of t section (only a declaration) error if does not follow entities sending.

Returns
-------
None
") SectionT;
		void SectionT();

		/****************** SectionsDP ******************/
		/**** md5 signature: a3970d28c5174555c7c6551f0e3d68c3 ****/
		%feature("compactdefaultargs") SectionsDP;
		%feature("autodoc", "Prepares sending of list of entities, as sections d (directory list) and p (parameters lists, one per entity) entities will be then processed, one after the other error if sectiong has not be called just before.

Returns
-------
None
") SectionsDP;
		void SectionsDP();

		/****************** SendBoolean ******************/
		/**** md5 signature: 64cbf8ca025e041c684fe788899fd7cd ****/
		%feature("compactdefaultargs") SendBoolean;
		%feature("autodoc", "Sends a boolean parameter as an integer value 0(false)/1(true).

Parameters
----------
val: bool

Returns
-------
None
") SendBoolean;
		void SendBoolean(const Standard_Boolean val);

		/****************** SendModel ******************/
		/**** md5 signature: 3aafa5ab3573378a6f17270792bcb0d1 ****/
		%feature("compactdefaultargs") SendModel;
		%feature("autodoc", "Sends the complete igesmodel (global section, entities as directory entries & parameter lists, etc...) i.e. fills a list of texts. once filled, it can be sent by method print.

Parameters
----------
protocol: IGESData_Protocol

Returns
-------
None
") SendModel;
		void SendModel(const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** SendStartLine ******************/
		/**** md5 signature: a0b8d0b392e66a48753ee0b5a05b64b1 ****/
		%feature("compactdefaultargs") SendStartLine;
		%feature("autodoc", "Sends an additionnal starting line : this is the way used to send comments in an iges file (at beginning of the file). if the line is more than 72 char.s long, it is splited into as many lines as required to send it completely.

Parameters
----------
startline: char *

Returns
-------
None
") SendStartLine;
		void SendStartLine(const char * startline);

		/****************** SendString ******************/
		/**** md5 signature: 92320a0c3411641c39d308f7f62b1e3b ****/
		%feature("compactdefaultargs") SendString;
		%feature("autodoc", "Sends a parameter under its exact form given as a string.

Parameters
----------
val: TCollection_HAsciiString

Returns
-------
None
") SendString;
		void SendString(const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SendVoid ******************/
		/**** md5 signature: 57e39e043394ecdca192085943c6d397 ****/
		%feature("compactdefaultargs") SendVoid;
		%feature("autodoc", "Sends a void parameter, that is null text.

Returns
-------
None
") SendVoid;
		void SendVoid();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetWriteMode() {
            return (Standard_Integer) $self->WriteMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetWriteMode(Standard_Integer value) {
            $self->WriteMode()=value;
            }
        };
};


%extend IGESData_IGESWriter {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Send(self):
		pass
	}
};

/***********************************
* class IGESData_NodeOfSpecificLib *
***********************************/
class IGESData_NodeOfSpecificLib : public Standard_Transient {
	public:
		/****************** IGESData_NodeOfSpecificLib ******************/
		/**** md5 signature: f54dd4161f1e9f19ca86399897a966c6 ****/
		%feature("compactdefaultargs") IGESData_NodeOfSpecificLib;
		%feature("autodoc", "Creates an empty node, with no next.

Returns
-------
None
") IGESData_NodeOfSpecificLib;
		 IGESData_NodeOfSpecificLib();

		/****************** AddNode ******************/
		/**** md5 signature: b24e0e0113ac4e4c0f889a68a419a036 ****/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "Adds a couple (module,protocol), that is, stores it into itself if not yet done, else creates a next node to do it.

Parameters
----------
anode: IGESData_GlobalNodeOfSpecificLib

Returns
-------
None
") AddNode;
		void AddNode(const opencascade::handle<IGESData_GlobalNodeOfSpecificLib> & anode);

		/****************** Module ******************/
		/**** md5 signature: 94fb463336d8c4fc0b6073746099eaef ****/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module designated by a precise node.

Returns
-------
opencascade::handle<IGESData_SpecificModule>
") Module;
		const opencascade::handle<IGESData_SpecificModule> & Module();

		/****************** Next ******************/
		/**** md5 signature: 5346038d4f02d13fdf50b8d30f4ac868 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next node. if none was defined, returned value is a null handle.

Returns
-------
opencascade::handle<IGESData_NodeOfSpecificLib>
") Next;
		const opencascade::handle<IGESData_NodeOfSpecificLib> & Next();

		/****************** Protocol ******************/
		/**** md5 signature: 4eb07a48dbfd452cf11a527b6ce5309c ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol designated by a precise node.

Returns
-------
opencascade::handle<IGESData_Protocol>
") Protocol;
		const opencascade::handle<IGESData_Protocol> & Protocol();

};


%make_alias(IGESData_NodeOfSpecificLib)

%extend IGESData_NodeOfSpecificLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESData_NodeOfWriterLib *
*********************************/
class IGESData_NodeOfWriterLib : public Standard_Transient {
	public:
		/****************** IGESData_NodeOfWriterLib ******************/
		/**** md5 signature: 861aea86c52551677c5542784ccac33b ****/
		%feature("compactdefaultargs") IGESData_NodeOfWriterLib;
		%feature("autodoc", "Creates an empty node, with no next.

Returns
-------
None
") IGESData_NodeOfWriterLib;
		 IGESData_NodeOfWriterLib();

		/****************** AddNode ******************/
		/**** md5 signature: 80279a7c1b0a0b9e058f510e5db5ac30 ****/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "Adds a couple (module,protocol), that is, stores it into itself if not yet done, else creates a next node to do it.

Parameters
----------
anode: IGESData_GlobalNodeOfWriterLib

Returns
-------
None
") AddNode;
		void AddNode(const opencascade::handle<IGESData_GlobalNodeOfWriterLib> & anode);

		/****************** Module ******************/
		/**** md5 signature: 620617849b7007bcf8f20d0e6d505c82 ****/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module designated by a precise node.

Returns
-------
opencascade::handle<IGESData_ReadWriteModule>
") Module;
		const opencascade::handle<IGESData_ReadWriteModule> & Module();

		/****************** Next ******************/
		/**** md5 signature: c0e9604917a176294a629a65becf9c72 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next node. if none was defined, returned value is a null handle.

Returns
-------
opencascade::handle<IGESData_NodeOfWriterLib>
") Next;
		const opencascade::handle<IGESData_NodeOfWriterLib> & Next();

		/****************** Protocol ******************/
		/**** md5 signature: 4eb07a48dbfd452cf11a527b6ce5309c ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol designated by a precise node.

Returns
-------
opencascade::handle<IGESData_Protocol>
") Protocol;
		const opencascade::handle<IGESData_Protocol> & Protocol();

};


%make_alias(IGESData_NodeOfWriterLib)

%extend IGESData_NodeOfWriterLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESData_ParamCursor *
*****************************/
class IGESData_ParamCursor {
	public:
		/****************** IGESData_ParamCursor ******************/
		/**** md5 signature: 17236a15be440009bfc9345a53285d8c ****/
		%feature("compactdefaultargs") IGESData_ParamCursor;
		%feature("autodoc", "Creates a cursor to read a precise parameter of paramreader, identified by its number, then set current number to 'num + 1' (this constructor allows to simply give a number to a method read... from paramreader, which will be translated into a paramcursor by compiler).

Parameters
----------
num: int

Returns
-------
None
") IGESData_ParamCursor;
		 IGESData_ParamCursor(const Standard_Integer num);

		/****************** IGESData_ParamCursor ******************/
		/**** md5 signature: ed65ea820dcd6b63c6b259dda34b35e5 ****/
		%feature("compactdefaultargs") IGESData_ParamCursor;
		%feature("autodoc", "Creates a cursor to read a list of parameters (count 'nb') starting from a precise one (number 'num') included, then set current number of paramnumber to the first following one ('num + nb') if size is given, it means that each parameter is made of more than one term. one term is the normal (default) case : for instance, a parameter comprises one integer, or one entity ... size gives the complete size of each item if it is complex. to be used only if it is constant.

Parameters
----------
num: int
nb: int
size: int,optional
	default value is 1

Returns
-------
None
") IGESData_ParamCursor;
		 IGESData_ParamCursor(const Standard_Integer num, const Standard_Integer nb, const Standard_Integer size = 1);

		/****************** Advance ******************/
		/**** md5 signature: 8732b03d4deabafe551100a45ffce80e ****/
		%feature("compactdefaultargs") Advance;
		%feature("autodoc", "Returns true if advance command has been set.

Returns
-------
bool
") Advance;
		Standard_Boolean Advance();

		/****************** Count ******************/
		/**** md5 signature: 991c7b8ad8fee748c77481e1ff97e534 ****/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "Returns required count of items to be read.

Returns
-------
int
") Count;
		Standard_Integer Count();

		/****************** ItemSize ******************/
		/**** md5 signature: 51c711469617c7c15e7b2266ef8e2c5b ****/
		%feature("compactdefaultargs") ItemSize;
		%feature("autodoc", "Returns length of item (count of parameters per item).

Returns
-------
int
") ItemSize;
		Standard_Integer ItemSize();

		/****************** Limit ******************/
		/**** md5 signature: b53224ef6b9824bc94762faf5d79014a ****/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "Returns (excluded) upper limit number for reading parameters.

Returns
-------
int
") Limit;
		Standard_Integer Limit();

		/****************** Offset ******************/
		/**** md5 signature: 03bde6fe15ae3c54c8556dcc0a4901ec ****/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "Returns offset from which current term must be read in item.

Returns
-------
int
") Offset;
		Standard_Integer Offset();

		/****************** SetAdvance ******************/
		/**** md5 signature: 40bfe0c94811631723642e838ccf5256 ****/
		%feature("compactdefaultargs") SetAdvance;
		%feature("autodoc", "Changes command to advance current cursor after reading parameters. if 'advance' true, sets advance, if 'false', resets it. paramcursor is created by default with true.

Parameters
----------
advance: bool

Returns
-------
None
") SetAdvance;
		void SetAdvance(const Standard_Boolean advance);

		/****************** SetOne ******************/
		/**** md5 signature: 1bfaf66a64f419b940b5e9d6e97f6428 ****/
		%feature("compactdefaultargs") SetOne;
		%feature("autodoc", "Defines a term of one parameter (very current case).

Parameters
----------
autoadv: bool,optional
	default value is Standard_True

Returns
-------
None
") SetOne;
		void SetOne(const Standard_Boolean autoadv = Standard_True);

		/****************** SetTerm ******************/
		/**** md5 signature: 5451e0f8db70fd6b34e9cabd793d48a1 ****/
		%feature("compactdefaultargs") SetTerm;
		%feature("autodoc", "Defines the size of a term to read in the item : this commands paramreader to read 'size' parameters for each item, then skip the remainder of the item to the same term of next item (that is, skip 'item size' - 'term size') //! in addition, offset from beginning of item is managed : after being created, and for the frist call to setterm, the part of item to be read begins exactly as the item begins but after a setterm, the next read will add an offset which is the size of former term. //! autoadv commands advance management. if it is true (default), the last setterm (item size has been covered) calls setadvance if it is false, setadvance must be called directly if necessary //! error if a setterm overpasses the size of the item.

Parameters
----------
size: int
autoadv: bool,optional
	default value is Standard_True

Returns
-------
None
") SetTerm;
		void SetTerm(const Standard_Integer size, const Standard_Boolean autoadv = Standard_True);

		/****************** SetXY ******************/
		/**** md5 signature: 0a2da6eac7b51f5fe56357b170dfa18a ****/
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "Defines a term of two parameters for a xy (current case).

Parameters
----------
autoadv: bool,optional
	default value is Standard_True

Returns
-------
None
") SetXY;
		void SetXY(const Standard_Boolean autoadv = Standard_True);

		/****************** SetXYZ ******************/
		/**** md5 signature: f92ea28b25f113bc557ceaed32b78fce ****/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "Defines a term of three parameters for xyz (current case).

Parameters
----------
autoadv: bool,optional
	default value is Standard_True

Returns
-------
None
") SetXYZ;
		void SetXYZ(const Standard_Boolean autoadv = Standard_True);

		/****************** Start ******************/
		/**** md5 signature: df4b97f316882ae26acb8561520308e4 ****/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Returns (included) starting number for reading parameters.

Returns
-------
int
") Start;
		Standard_Integer Start();

		/****************** TermSize ******************/
		/**** md5 signature: 3abad23e5df6e9276cb8570fb9313206 ****/
		%feature("compactdefaultargs") TermSize;
		%feature("autodoc", "Returns length of current term (count of parameters) in item.

Returns
-------
int
") TermSize;
		Standard_Integer TermSize();

};


%extend IGESData_ParamCursor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESData_ParamReader *
*****************************/
class IGESData_ParamReader {
	public:
		/****************** IGESData_ParamReader ******************/
		/**** md5 signature: 0be7335ed78b6f2c140a4421677b3de3 ****/
		%feature("compactdefaultargs") IGESData_ParamReader;
		%feature("autodoc", "Prepares a paramreader, stage 'own', current param = 1 it considers a part of the list, from <base> (excluded) for <nbpar> parameters; <nbpar> = 0 commands to take list length. default is (1 to skip type).

Parameters
----------
list: Interface_ParamList
ach: Interface_Check
base: int,optional
	default value is 1
nbpar: int,optional
	default value is 0
num: int,optional
	default value is 0

Returns
-------
None
") IGESData_ParamReader;
		 IGESData_ParamReader(const opencascade::handle<Interface_ParamList> & list, const opencascade::handle<Interface_Check> & ach, const Standard_Integer base = 1, const Standard_Integer nbpar = 0, const Standard_Integer num = 0);

		/****************** AddFail ******************/
		/**** md5 signature: c91e40f5f15a144a7f8c0b135ca877ca ****/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "No available documentation.

Parameters
----------
afail: char *
bfail: char *,optional
	default value is ""

Returns
-------
None
") AddFail;
		void AddFail(const char * afail, const char * bfail = "");

		/****************** AddFail ******************/
		/**** md5 signature: c2e5e426059ba8bc38dac40e1adc4faa ****/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "Feeds the check with a new fail (as a string or as a cstring).

Parameters
----------
af: TCollection_HAsciiString
bf: TCollection_HAsciiString

Returns
-------
None
") AddFail;
		void AddFail(const opencascade::handle<TCollection_HAsciiString> & af, const opencascade::handle<TCollection_HAsciiString> & bf);

		/****************** AddWarning ******************/
		/**** md5 signature: 9a73bc0475344564f058cee8c231b03d ****/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "No available documentation.

Parameters
----------
awarn: char *
bwarn: char *,optional
	default value is ""

Returns
-------
None
") AddWarning;
		void AddWarning(const char * awarn, const char * bwarn = "");

		/****************** AddWarning ******************/
		/**** md5 signature: 08b677de5f00f85a69ff40630816ba2b ****/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "Feeds the check with a new warning message.

Parameters
----------
aw: TCollection_HAsciiString
bw: TCollection_HAsciiString

Returns
-------
None
") AddWarning;
		void AddWarning(const opencascade::handle<TCollection_HAsciiString> & aw, const opencascade::handle<TCollection_HAsciiString> & bw);

		/****************** CCheck ******************/
		/**** md5 signature: 6e66cd51a221a5f9b18ffa07111f133d ****/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "Returns the check in a way which allows to work on it directly (i.e. messages added to the check are added to paramreader too).

Returns
-------
opencascade::handle<Interface_Check>
") CCheck;
		opencascade::handle<Interface_Check> & CCheck();

		/****************** Check ******************/
		/**** md5 signature: 535183f491df1166f3d80ddd8b810a47 ****/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Returns the check note that any error signaled above is also recorded into it.

Returns
-------
opencascade::handle<Interface_Check>
") Check;
		const opencascade::handle<Interface_Check> & Check();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Resets state (stage, current param number, check with no fail).

Returns
-------
None
") Clear;
		void Clear();

		/****************** Current ******************/
		/**** md5 signature: 135533e6192333264e7664264e27cf57 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Creates a paramcursor from the current number, to read one parameter, and to advance current number after reading.

Returns
-------
IGESData_ParamCursor
") Current;
		IGESData_ParamCursor Current();

		/****************** CurrentList ******************/
		/**** md5 signature: 907e65a85f73ab24aa0a2bff6b639fc6 ****/
		%feature("compactdefaultargs") CurrentList;
		%feature("autodoc", "Creates a paramcursor from the current number, to read a list of 'nb' items, and to advance current number after reading by default, each item is made of one parameter if size is given, it precises the number of params per item.

Parameters
----------
nb: int
size: int,optional
	default value is 1

Returns
-------
IGESData_ParamCursor
") CurrentList;
		IGESData_ParamCursor CurrentList(const Standard_Integer nb, const Standard_Integer size = 1);

		/****************** CurrentNumber ******************/
		/**** md5 signature: cad50b6737e024bb37d77c60a68e5874 ****/
		%feature("compactdefaultargs") CurrentNumber;
		%feature("autodoc", "Returns the current parameter number this notion is involved by the organisation of an iges list of parameter : it can be ended by two lists (associativities and properties), which can be empty, or even absent. hence, it is necessary to know, at the end of specific reading, how many parameters have been read : the optionnal lists follow.

Returns
-------
int
") CurrentNumber;
		Standard_Integer CurrentNumber();

		/****************** DefinedElseSkip ******************/
		/**** md5 signature: 883cbb4e12366c3b803d0a4caa42669f ****/
		%feature("compactdefaultargs") DefinedElseSkip;
		%feature("autodoc", "Allows to simply process a parameter which can be defaulted. waits on the current number a defined parameter or skips it : if the parameter <num> is defined, changes nothing and returns true hence, the next reading with current cursor will concern <num> if it is void, advances current position by one, and returns false the next reading will concern <num+1> (except if <num> = nbparams) //! this allows to process default values as follows (c++) : if (pr.definedelseskip()) { .. pr.read... (current parameter); } else { <current parameter> = default value .. nothing else to do with paramreader } for message.

Returns
-------
bool
") DefinedElseSkip;
		Standard_Boolean DefinedElseSkip();

		/****************** EndAll ******************/
		/**** md5 signature: 1ea4b7216b380c8e79eddcee7a9bff79 ****/
		%feature("compactdefaultargs") EndAll;
		%feature("autodoc", "Passes directly to the end of reading process.

Returns
-------
None
") EndAll;
		void EndAll();

		/****************** EntityNumber ******************/
		/**** md5 signature: 3b5de40d76500537f54e61dc1880dcc0 ****/
		%feature("compactdefaultargs") EntityNumber;
		%feature("autodoc", "Returns the entity number in the file.

Returns
-------
int
") EntityNumber;
		Standard_Integer EntityNumber();

		/****************** HasFailed ******************/
		/**** md5 signature: 231f6cf476d6eb671060105fc565fef7 ****/
		%feature("compactdefaultargs") HasFailed;
		%feature("autodoc", "Says if fails have been recorded into the check.

Returns
-------
bool
") HasFailed;
		Standard_Boolean HasFailed();

		/****************** IsCheckEmpty ******************/
		/**** md5 signature: 5084ba875026d6b0ce293344b2432dc8 ****/
		%feature("compactdefaultargs") IsCheckEmpty;
		%feature("autodoc", "Returns true if the check is empty else, it has to be recorded with the read entity.

Returns
-------
bool
") IsCheckEmpty;
		Standard_Boolean IsCheckEmpty();

		/****************** IsParamDefined ******************/
		/**** md5 signature: 8e6b44f252e5989226cd44f91c0cf4b4 ****/
		%feature("compactdefaultargs") IsParamDefined;
		%feature("autodoc", "Says if a parameter is defined (not void) see also definedelseskip.

Parameters
----------
num: int

Returns
-------
bool
") IsParamDefined;
		Standard_Boolean IsParamDefined(const Standard_Integer num);

		/****************** IsParamEntity ******************/
		/**** md5 signature: edcc5f4164bf630a10b2eddc151d1934 ****/
		%feature("compactdefaultargs") IsParamEntity;
		%feature("autodoc", "Says if a parameter can be regarded as an entity reference (see prepare from igesreaderdata for more explanation) note that such a parameter can seen as be a plain integer too.

Parameters
----------
num: int

Returns
-------
bool
") IsParamEntity;
		Standard_Boolean IsParamEntity(const Standard_Integer num);

		/****************** Mend ******************/
		/**** md5 signature: 588cd016391e966111d0d2f7b92af695 ****/
		%feature("compactdefaultargs") Mend;
		%feature("autodoc", "No available documentation.

Parameters
----------
pref: char *,optional
	default value is ""

Returns
-------
None
") Mend;
		void Mend(const char * pref = "");

		/****************** NbParams ******************/
		/**** md5 signature: 826f4756fca7f780e6d976c60183d715 ****/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Returns number of parameters (minus the first one) following method skip the first parameter (1 gives the 2nd).

Returns
-------
int
") NbParams;
		Standard_Integer NbParams();

		/****************** NextStage ******************/
		/**** md5 signature: 3afa7b44ad16680a74deb3d8fc21192e ****/
		%feature("compactdefaultargs") NextStage;
		%feature("autodoc", "Passes to next stage (must be linked with setting current).

Returns
-------
None
") NextStage;
		void NextStage();

		/****************** ParamEntity ******************/
		/**** md5 signature: fc5bc5ca0ff84cba8590256531a2aaa5 ****/
		%feature("compactdefaultargs") ParamEntity;
		%feature("autodoc", "Directly returns entity referenced by a parameter.

Parameters
----------
IR: IGESData_IGESReaderData
num: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") ParamEntity;
		opencascade::handle<IGESData_IGESEntity> ParamEntity(const opencascade::handle<IGESData_IGESReaderData> & IR, const Standard_Integer num);

		/****************** ParamNumber ******************/
		/**** md5 signature: 82bace9b7e2f432720acfca17aba56fb ****/
		%feature("compactdefaultargs") ParamNumber;
		%feature("autodoc", "Returns entity number corresponding to a parameter if there is otherwise zero (according criterium isparamentity).

Parameters
----------
num: int

Returns
-------
int
") ParamNumber;
		Standard_Integer ParamNumber(const Standard_Integer num);

		/****************** ParamType ******************/
		/**** md5 signature: 06805a954cdda33c70604680f220e0c5 ****/
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "Returns type of parameter; note that 'ident' or 'sub' cannot be encountered, they correspond to 'integer', see also below.

Parameters
----------
num: int

Returns
-------
Interface_ParamType
") ParamType;
		Interface_ParamType ParamType(const Standard_Integer num);

		/****************** ParamValue ******************/
		/**** md5 signature: 5d590bd3843093ee8ddc8ca8dac44112 ****/
		%feature("compactdefaultargs") ParamValue;
		%feature("autodoc", "Returns litteral value of a parameter, as it was in file.

Parameters
----------
num: int

Returns
-------
char *
") ParamValue;
		const char * ParamValue(const Standard_Integer num);

		/****************** ReadBoolean ******************/
		/**** md5 signature: 5af263137e415d719338928168c161b2 ****/
		%feature("compactdefaultargs") ReadBoolean;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: IGESData_ParamCursor
amsg: Message_Msg
exact: bool,optional
	default value is Standard_True

Returns
-------
val: bool
") ReadBoolean;
		Standard_Boolean ReadBoolean(const IGESData_ParamCursor & PC, const Message_Msg & amsg, Standard_Boolean &OutValue, const Standard_Boolean exact = Standard_True);

		/****************** ReadBoolean ******************/
		/**** md5 signature: 6268762c0673bb403d3a288d7ff30cf4 ****/
		%feature("compactdefaultargs") ReadBoolean;
		%feature("autodoc", "Reads a boolean value from parameter 'num' a boolean is given as an integer value 0 (false) or 1 (true) anyway, an integer is demanded (else, check is filled) if exact is given true, those precise values are demanded else, correction is done, as false for 0 or <0, true for >0 (with a warning error message, and return is true) in case of error (not an integer, or not 0/1 and exact true), check is filled with a fail (using mess) and return is false.

Parameters
----------
PC: IGESData_ParamCursor
mess: char *
exact: bool,optional
	default value is Standard_True

Returns
-------
val: bool
") ReadBoolean;
		Standard_Boolean ReadBoolean(const IGESData_ParamCursor & PC, const char * mess, Standard_Boolean &OutValue, const Standard_Boolean exact = Standard_True);

		/****************** ReadEntList ******************/
		/**** md5 signature: 9c9af56d8bc83ee3ea10a6bf14216be8 ****/
		%feature("compactdefaultargs") ReadEntList;
		%feature("autodoc", "No available documentation.

Parameters
----------
IR: IGESData_IGESReaderData
PC: IGESData_ParamCursor
amsg: Message_Msg
val: Interface_EntityList
ord: bool,optional
	default value is Standard_True

Returns
-------
bool
") ReadEntList;
		Standard_Boolean ReadEntList(const opencascade::handle<IGESData_IGESReaderData> & IR, const IGESData_ParamCursor & PC, Message_Msg & amsg, Interface_EntityList & val, const Standard_Boolean ord = Standard_True);

		/****************** ReadEntList ******************/
		/**** md5 signature: 0d9be3239233313112722bdff358270b ****/
		%feature("compactdefaultargs") ReadEntList;
		%feature("autodoc", "Reads a list of entities defined by pc same conditions as for readents, for pc the list is given as an entitylist (index has no meaning; the entitylist starts from clear) if 'ord' is given true (default), entities will be added to the list in their original order remark : negative or null pointers are ignored else ('ord' false), order is not garanteed (faster mode) if all params cannot be read as entities, same as above warning give 'ord' to false only if order is not significant.

Parameters
----------
IR: IGESData_IGESReaderData
PC: IGESData_ParamCursor
mess: char *
val: Interface_EntityList
ord: bool,optional
	default value is Standard_True

Returns
-------
bool
") ReadEntList;
		Standard_Boolean ReadEntList(const opencascade::handle<IGESData_IGESReaderData> & IR, const IGESData_ParamCursor & PC, const char * mess, Interface_EntityList & val, const Standard_Boolean ord = Standard_True);

		/****************** ReadEnts ******************/
		/**** md5 signature: 750391ef81f0fbfc5d61afa7f04ac7fd ****/
		%feature("compactdefaultargs") ReadEnts;
		%feature("autodoc", "No available documentation.

Parameters
----------
IR: IGESData_IGESReaderData
PC: IGESData_ParamCursor
amsg: Message_Msg
val: IGESData_HArray1OfIGESEntity
index: int,optional
	default value is 1

Returns
-------
bool
") ReadEnts;
		Standard_Boolean ReadEnts(const opencascade::handle<IGESData_IGESReaderData> & IR, const IGESData_ParamCursor & PC, const Message_Msg & amsg, opencascade::handle<IGESData_HArray1OfIGESEntity> & val, const Standard_Integer index = 1);

		/****************** ReadEnts ******************/
		/**** md5 signature: c9f7df380f06bc937e9e8c4995e90b9c ****/
		%feature("compactdefaultargs") ReadEnts;
		%feature("autodoc", "Reads a list of entities defined by pc same conditions as for readints, for pc and index the list is given as a harray1, numered from 'index' if all params cannot be read as entities, check is filled (using mess) and return value is false remark : null references are accepted, they are ignored (negative pointers too : they provoke a warning message) if the caller wants to check them, a loop on readentity should be used.

Parameters
----------
IR: IGESData_IGESReaderData
PC: IGESData_ParamCursor
mess: char *
val: IGESData_HArray1OfIGESEntity
index: int,optional
	default value is 1

Returns
-------
bool
") ReadEnts;
		Standard_Boolean ReadEnts(const opencascade::handle<IGESData_IGESReaderData> & IR, const IGESData_ParamCursor & PC, const char * mess, opencascade::handle<IGESData_HArray1OfIGESEntity> & val, const Standard_Integer index = 1);

		/****************** ReadInteger ******************/
		/**** md5 signature: 5c7a57000d7ed53a1cc81fab0e105a88 ****/
		%feature("compactdefaultargs") ReadInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: IGESData_ParamCursor

Returns
-------
val: int
") ReadInteger;
		Standard_Boolean ReadInteger(const IGESData_ParamCursor & PC, Standard_Integer &OutValue);

		/****************** ReadInteger ******************/
		/**** md5 signature: ed85b8e4697abef3f4bdbc503427bc64 ****/
		%feature("compactdefaultargs") ReadInteger;
		%feature("autodoc", "Reads an integer value designated by pc the method current designates the current parameter and advances the current number by one after reading note that if a count (not 1) is given, it is ignored if it is not an integer, fills check with a fail (using mess) and returns false.

Parameters
----------
PC: IGESData_ParamCursor
mess: char *

Returns
-------
val: int
") ReadInteger;
		Standard_Boolean ReadInteger(const IGESData_ParamCursor & PC, const char * mess, Standard_Integer &OutValue);

		/****************** ReadInts ******************/
		/**** md5 signature: 31cf4defba66a66fd688e116606f5f9e ****/
		%feature("compactdefaultargs") ReadInts;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: IGESData_ParamCursor
amsg: Message_Msg
val: TColStd_HArray1OfInteger
index: int,optional
	default value is 1

Returns
-------
bool
") ReadInts;
		Standard_Boolean ReadInts(const IGESData_ParamCursor & PC, const Message_Msg & amsg, opencascade::handle<TColStd_HArray1OfInteger> & val, const Standard_Integer index = 1);

		/****************** ReadInts ******************/
		/**** md5 signature: cb2250cec74ccc0dc67e08c3af09b5a3 ****/
		%feature("compactdefaultargs") ReadInts;
		%feature("autodoc", "Reads a list of integer values, defined by pc (with a count of parameters). pc can start from current number and command it to advance after reading (use method currentlist to do this) the list is given as a harray1, numered from 'index' if all params are not integer, check is filled (using mess) and return value is false.

Parameters
----------
PC: IGESData_ParamCursor
mess: char *
val: TColStd_HArray1OfInteger
index: int,optional
	default value is 1

Returns
-------
bool
") ReadInts;
		Standard_Boolean ReadInts(const IGESData_ParamCursor & PC, const char * mess, opencascade::handle<TColStd_HArray1OfInteger> & val, const Standard_Integer index = 1);

		/****************** ReadReal ******************/
		/**** md5 signature: c82333f3d5ddad52fc0fae29e9ff5ea1 ****/
		%feature("compactdefaultargs") ReadReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: IGESData_ParamCursor

Returns
-------
val: float
") ReadReal;
		Standard_Boolean ReadReal(const IGESData_ParamCursor & PC, Standard_Real &OutValue);

		/****************** ReadReal ******************/
		/**** md5 signature: c3a01ade61f69894a1059017f0b4ccb2 ****/
		%feature("compactdefaultargs") ReadReal;
		%feature("autodoc", "Reads a real value from parameter 'num' an integer is accepted (check is filled with a warning message) and causes return to be true (as normal case) in other cases, check is filled with a fail and return is false.

Parameters
----------
PC: IGESData_ParamCursor
mess: char *

Returns
-------
val: float
") ReadReal;
		Standard_Boolean ReadReal(const IGESData_ParamCursor & PC, const char * mess, Standard_Real &OutValue);

		/****************** ReadReals ******************/
		/**** md5 signature: 966afe503c7f3736d9516f71c49612ff ****/
		%feature("compactdefaultargs") ReadReals;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: IGESData_ParamCursor
amsg: Message_Msg
val: TColStd_HArray1OfReal
index: int,optional
	default value is 1

Returns
-------
bool
") ReadReals;
		Standard_Boolean ReadReals(const IGESData_ParamCursor & PC, Message_Msg & amsg, opencascade::handle<TColStd_HArray1OfReal> & val, const Standard_Integer index = 1);

		/****************** ReadReals ******************/
		/**** md5 signature: 0835badf4556bfe7269fbf0ff953e502 ****/
		%feature("compactdefaultargs") ReadReals;
		%feature("autodoc", "Reads a list of real values defined by pc same conditions as for readints, for pc and index an integer parameter is accepted, if at least one parameter is integer, check is filled with a 'warning' message if all params are neither real nor integer, check is filled (using mess) and return value is false.

Parameters
----------
PC: IGESData_ParamCursor
mess: char *
val: TColStd_HArray1OfReal
index: int,optional
	default value is 1

Returns
-------
bool
") ReadReals;
		Standard_Boolean ReadReals(const IGESData_ParamCursor & PC, const char * mess, opencascade::handle<TColStd_HArray1OfReal> & val, const Standard_Integer index = 1);

		/****************** ReadText ******************/
		/**** md5 signature: 8807f276466f6d3d64b7837129489f8b ****/
		%feature("compactdefaultargs") ReadText;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: IGESData_ParamCursor
amsg: Message_Msg
val: TCollection_HAsciiString

Returns
-------
bool
") ReadText;
		Standard_Boolean ReadText(const IGESData_ParamCursor & PC, const Message_Msg & amsg, opencascade::handle<TCollection_HAsciiString> & val);

		/****************** ReadText ******************/
		/**** md5 signature: 583adf171adc696820aae6403d5703c0 ****/
		%feature("compactdefaultargs") ReadText;
		%feature("autodoc", "Reads a text value from parameter 'num', as a string from collection, that is, hollerith text without leading 'nnnh' if it is not a string, fills check with a fail (using mess) and returns false.

Parameters
----------
PC: IGESData_ParamCursor
mess: char *
val: TCollection_HAsciiString

Returns
-------
bool
") ReadText;
		Standard_Boolean ReadText(const IGESData_ParamCursor & PC, const char * mess, opencascade::handle<TCollection_HAsciiString> & val);

		/****************** ReadTexts ******************/
		/**** md5 signature: c6a37e5e63bf6ab8b99c9480e131fa17 ****/
		%feature("compactdefaultargs") ReadTexts;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: IGESData_ParamCursor
amsg: Message_Msg
val: Interface_HArray1OfHAsciiString
index: int,optional
	default value is 1

Returns
-------
bool
") ReadTexts;
		Standard_Boolean ReadTexts(const IGESData_ParamCursor & PC, const Message_Msg & amsg, opencascade::handle<Interface_HArray1OfHAsciiString> & val, const Standard_Integer index = 1);

		/****************** ReadTexts ******************/
		/**** md5 signature: 7fc90df81fea9b3334c6a5fb05b22910 ****/
		%feature("compactdefaultargs") ReadTexts;
		%feature("autodoc", "Reads a list of hollerith texts, defined by pc texts are read as hollerith texts without leading 'nnnh' same conditions as for readints, for pc and index if all params are not text, check is filled (using mess) and return value is false.

Parameters
----------
PC: IGESData_ParamCursor
mess: char *
val: Interface_HArray1OfHAsciiString
index: int,optional
	default value is 1

Returns
-------
bool
") ReadTexts;
		Standard_Boolean ReadTexts(const IGESData_ParamCursor & PC, const char * mess, opencascade::handle<Interface_HArray1OfHAsciiString> & val, const Standard_Integer index = 1);

		/****************** ReadXY ******************/
		/**** md5 signature: f1f930720d20b00d8163c922eb48a7cf ****/
		%feature("compactdefaultargs") ReadXY;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: IGESData_ParamCursor
amsg: Message_Msg
val: gp_XY

Returns
-------
bool
") ReadXY;
		Standard_Boolean ReadXY(const IGESData_ParamCursor & PC, Message_Msg & amsg, gp_XY & val);

		/****************** ReadXY ******************/
		/**** md5 signature: 6992ef4100793f541a2652734a6e22f8 ****/
		%feature("compactdefaultargs") ReadXY;
		%feature("autodoc", "Reads a couple of real values (x,y) from parameter 'num' integers are accepted (check is filled with a warning message) and cause return to be true (as normal case) in other cases, check is filled with a fail and return is false.

Parameters
----------
PC: IGESData_ParamCursor
mess: char *
val: gp_XY

Returns
-------
bool
") ReadXY;
		Standard_Boolean ReadXY(const IGESData_ParamCursor & PC, const char * mess, gp_XY & val);

		/****************** ReadXYZ ******************/
		/**** md5 signature: e1f260ccc2a99b486835f0bbaf9490d4 ****/
		%feature("compactdefaultargs") ReadXYZ;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: IGESData_ParamCursor
amsg: Message_Msg
val: gp_XYZ

Returns
-------
bool
") ReadXYZ;
		Standard_Boolean ReadXYZ(const IGESData_ParamCursor & PC, Message_Msg & amsg, gp_XYZ & val);

		/****************** ReadXYZ ******************/
		/**** md5 signature: 15aa066c60d71f3df435929b7aa189a4 ****/
		%feature("compactdefaultargs") ReadXYZ;
		%feature("autodoc", "Reads a triplet of real values (x,y,z) from parameter 'num' integers are accepted (check is filled with a warning message) and cause return to be true (as normal case) in other cases, check is filled with a fail and return is false for message.

Parameters
----------
PC: IGESData_ParamCursor
mess: char *
val: gp_XYZ

Returns
-------
bool
") ReadXYZ;
		Standard_Boolean ReadXYZ(const IGESData_ParamCursor & PC, const char * mess, gp_XYZ & val);

		/****************** ReadingEntityNumber ******************/
		/**** md5 signature: 92704ecd65c2acb93d1b95eb5695d76c ****/
		%feature("compactdefaultargs") ReadingEntityNumber;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
val: int
") ReadingEntityNumber;
		Standard_Boolean ReadingEntityNumber(const Standard_Integer num, Standard_Integer &OutValue);

		/****************** ReadingEntityNumber ******************/
		/**** md5 signature: 5d198f71dec6dc01baf2a876d8d0029b ****/
		%feature("compactdefaultargs") ReadingEntityNumber;
		%feature("autodoc", "Routine which reads an entity number (which allows to read the entity in the igesreaderdata by boundentity), given its number in the list of parameters same conditions as readentity for mess, val, and return value in particular, returns true and val to zero means null entity, and val not zero means entity read by boundentity.

Parameters
----------
num: int
mess: char *

Returns
-------
val: int
") ReadingEntityNumber;
		Standard_Boolean ReadingEntityNumber(const Standard_Integer num, const char * mess, Standard_Integer &OutValue);

		/****************** ReadingReal ******************/
		/**** md5 signature: 1acc3f6abf688d2d1b7f455b5f35fd08 ****/
		%feature("compactdefaultargs") ReadingReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
val: float
") ReadingReal;
		Standard_Boolean ReadingReal(const Standard_Integer num, Standard_Real &OutValue);

		/****************** ReadingReal ******************/
		/**** md5 signature: 3a9bac57a6845f06ca42b63580735416 ****/
		%feature("compactdefaultargs") ReadingReal;
		%feature("autodoc", "Routine which reads a real parameter, given its number same conditions as readreal for mess, val, and return value.

Parameters
----------
num: int
mess: char *

Returns
-------
val: float
") ReadingReal;
		Standard_Boolean ReadingReal(const Standard_Integer num, const char * mess, Standard_Real &OutValue);

		/****************** SendFail ******************/
		/**** md5 signature: 1eab4e53649e1a16e12a6f58bd826f30 ****/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "No available documentation.

Parameters
----------
amsg: Message_Msg

Returns
-------
None
") SendFail;
		void SendFail(const Message_Msg & amsg);

		/****************** SendWarning ******************/
		/**** md5 signature: 7a784110763f5a191de87e4b30b0324e ****/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "No available documentation.

Parameters
----------
amsg: Message_Msg

Returns
-------
None
") SendWarning;
		void SendWarning(const Message_Msg & amsg);

		/****************** SetCurrentNumber ******************/
		/**** md5 signature: cfd60e21d3b8d6b90fbe9763df1e8c6f ****/
		%feature("compactdefaultargs") SetCurrentNumber;
		%feature("autodoc", "Sets current parameter number to a new value must be done at end of each step : set on first parameter following last read one; is done by some read... methods (must be done directly if these method are not used) num greater than nbparams means that following lists are empty if current num is not managed, it remains at 1, which probably will cause error when successive steps of reading are made.

Parameters
----------
num: int

Returns
-------
None
") SetCurrentNumber;
		void SetCurrentNumber(const Standard_Integer num);

		/****************** Stage ******************/
		/**** md5 signature: f26299ac744ccb6ad00be1e60a3fc3f6 ****/
		%feature("compactdefaultargs") Stage;
		%feature("autodoc", "Gives current stage (own-props-assocs-end, begins at own).

Returns
-------
IGESData_ReadStage
") Stage;
		IGESData_ReadStage Stage();

};


%extend IGESData_ParamReader {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def ReadEntity(self):
		pass
	}
};

/**************************
* class IGESData_Protocol *
**************************/
class IGESData_Protocol : public Interface_Protocol {
	public:
		/****************** IGESData_Protocol ******************/
		/**** md5 signature: c9d8b242f6243d2610fe1d2b6216e77e ****/
		%feature("compactdefaultargs") IGESData_Protocol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESData_Protocol;
		 IGESData_Protocol();

		/****************** IsSuitableModel ******************/
		/**** md5 signature: 3a7d76487f7ffeaa887a18b03ce0e06c ****/
		%feature("compactdefaultargs") IsSuitableModel;
		%feature("autodoc", "Returns true if <model> is a model of iges norm.

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
bool
") IsSuitableModel;
		Standard_Boolean IsSuitableModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** IsUnknownEntity ******************/
		/**** md5 signature: cec9bde85b0ea68f8042a2f3f4f9c29b ****/
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
		/**** md5 signature: e09215dfaa5a4c92d70662499182122c ****/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Gives the count of resource protocol. here, none.

Returns
-------
int
") NbResources;
		Standard_Integer NbResources();

		/****************** NewModel ******************/
		/**** md5 signature: 91513f9ebe9e7d52eca2b6b58f6b9b0a ****/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Creates an empty model for iges norm.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****************** Resource ******************/
		/**** md5 signature: d60e6fb01254af21c091aa5baad80e74 ****/
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

		/****************** TypeNumber ******************/
		/**** md5 signature: c141bcfd5e7e4d36c0619b6951ddde94 ****/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "Returns a case number, specific of each recognized type here, undefined and free format entities have the number 1.

Parameters
----------
atype: Standard_Type

Returns
-------
int
") TypeNumber;
		Standard_Integer TypeNumber(const opencascade::handle<Standard_Type> & atype);

		/****************** UnknownEntity ******************/
		/**** md5 signature: 201f936eaa0d5d272733a19cbe8e2fa3 ****/
		%feature("compactdefaultargs") UnknownEntity;
		%feature("autodoc", "Creates a new unknown entity for iges (undefinedentity).

Returns
-------
opencascade::handle<Standard_Transient>
") UnknownEntity;
		opencascade::handle<Standard_Transient> UnknownEntity();

};


%make_alias(IGESData_Protocol)

%extend IGESData_Protocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESData_ReadWriteModule *
*********************************/
%nodefaultctor IGESData_ReadWriteModule;
class IGESData_ReadWriteModule : public Interface_ReaderModule {
	public:
		/****************** CaseIGES ******************/
		/**** md5 signature: 50a4ff4f6d600f478137a6aa68e47abb ****/
		%feature("compactdefaultargs") CaseIGES;
		%feature("autodoc", "Defines case numbers corresponding to the entity types taken into account by a sub-class of readwritemodule (hence, each sub-class of readwritemodule has to redefine this method) called by casenum. its result will then be used to call read, etc ...

Parameters
----------
typenum: int
formnum: int

Returns
-------
int
") CaseIGES;
		virtual Standard_Integer CaseIGES(const Standard_Integer typenum, const Standard_Integer formnum);

		/****************** CaseNum ******************/
		/**** md5 signature: 9879d2c99e315f91c57304d23ffeaef0 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Translates the type of record <num> in <data> to a positive case number, or 0 if failed. works with igesreaderdata which provides type & form numbers, and calls caseiges (see below).

Parameters
----------
data: Interface_FileReaderData
num: int

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Interface_FileReaderData> & data, const Standard_Integer num);

		/****************** Read ******************/
		/**** md5 signature: 42ded38f13a0a591a94dfdfbbc6644f7 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "General read function. see igesreadertool for more info.

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

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 44dfe59dc57956979a96c9a23fbaa660 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file for an entity; <pr> gives access to them, <ir> detains parameter types and values for each class, there must be a specific action provided note that properties and associativities lists are read by specific methods (see below), they are called under control of reading process (only one call) according stage recorded in paramreader.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		virtual void ReadOwnParams(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: dba319f8f44c1bd48f0c908dfc0b5313 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter; defined for each class (to be redefined for other iges readwritemodules) warning : properties and associativities are directly managed by writeiges, must not be sent by this method.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		virtual void WriteOwnParams(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, IGESData_IGESWriter & IW);

};


%make_alias(IGESData_ReadWriteModule)

%extend IGESData_ReadWriteModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESData_SpecificLib *
*****************************/
class IGESData_SpecificLib {
	public:
		/****************** IGESData_SpecificLib ******************/
		/**** md5 signature: a7059173e151f23c878086fdecb5b8a7 ****/
		%feature("compactdefaultargs") IGESData_SpecificLib;
		%feature("autodoc", "Creates a library which complies with a protocol, that is : same class (criterium isinstance) this creation gets the modules from the global set, those which are bound to the given protocol and its resources.

Parameters
----------
aprotocol: IGESData_Protocol

Returns
-------
None
") IGESData_SpecificLib;
		 IGESData_SpecificLib(const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****************** IGESData_SpecificLib ******************/
		/**** md5 signature: eaac57946eaef8795d7b680b301228af ****/
		%feature("compactdefaultargs") IGESData_SpecificLib;
		%feature("autodoc", "Creates an empty library : it will later by filled by method addprotocol.

Returns
-------
None
") IGESData_SpecificLib;
		 IGESData_SpecificLib();

		/****************** AddProtocol ******************/
		/**** md5 signature: 97bedbaaa5336e800a60d78a56ab8c60 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list of modules of a library (can be used to redefine the order of modules before action : clear then refill the library by calls to addprotocol).

Returns
-------
None
") Clear;
		void Clear();

		/****************** Module ******************/
		/**** md5 signature: 94fb463336d8c4fc0b6073746099eaef ****/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the current module in the iteration.

Returns
-------
opencascade::handle<IGESData_SpecificModule>
") Module;
		const opencascade::handle<IGESData_SpecificModule> & Module();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there are more modules to iterate on.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Iterates by getting the next module in the list if there is none, the exception will be raised by value.

Returns
-------
None
") Next;
		void Next();

		/****************** Protocol ******************/
		/**** md5 signature: 4eb07a48dbfd452cf11a527b6ce5309c ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the current protocol in the iteration.

Returns
-------
opencascade::handle<IGESData_Protocol>
") Protocol;
		const opencascade::handle<IGESData_Protocol> & Protocol();

		/****************** Select ******************/
		/**** md5 signature: df7326180c9347987eb759b269019ddf ****/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Selects a module from the library, given an object. returns true if select has succeeded, false else. also returns (as arguments) the selected module and the case number determined by the associated protocol. if select has failed, <module> is null handle and cn is zero. (select can work on any criterium, such as object dynamictype).

Parameters
----------
obj: IGESData_IGESEntity
module: IGESData_SpecificModule

Returns
-------
CN: int
") Select;
		Standard_Boolean Select(const opencascade::handle<IGESData_IGESEntity> & obj, opencascade::handle<IGESData_SpecificModule> & module, Standard_Integer &OutValue);

		/****************** SetComplete ******************/
		/**** md5 signature: 9b2529d2e257b2464fe4d8064a8a0171 ****/
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "Sets a library to be defined with the complete global list (all the couples protocol/modules recorded in it).

Returns
-------
None
") SetComplete;
		void SetComplete();

		/****************** SetGlobal ******************/
		/**** md5 signature: 0e2ec242b36444b7772d81a17c1ab013 ****/
		%feature("compactdefaultargs") SetGlobal;
		%feature("autodoc", "Adds a couple (module-protocol) into the global definition set for this class of library.

Parameters
----------
amodule: IGESData_SpecificModule
aprotocol: IGESData_Protocol

Returns
-------
None
") SetGlobal;
		static void SetGlobal(const opencascade::handle<IGESData_SpecificModule> & amodule, const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****************** Start ******************/
		/**** md5 signature: f8a4dbf1e6f2cec0927301856b440be5 ****/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Starts iteration on the modules (sets it on the first one).

Returns
-------
None
") Start;
		void Start();

};


%extend IGESData_SpecificLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESData_SpecificModule *
********************************/
%nodefaultctor IGESData_SpecificModule;
class IGESData_SpecificModule : public Standard_Transient {
	public:
		/****************** OwnCorrect ******************/
		/**** md5 signature: dcc0d76987465f3f21f4ad244d5059ed ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Specific automatic correction on own parameters of an entity. it works by setting in accordance redundant data, if there are when there is no ambiguity (else, it does nothing). remark that classic corrections on directory entry (to set void data) are taken into account alsewhere. //! for instance, many 'associativity entities' have a number of properties which must have a fixed value. or, a conicalarc has its form number which records the kind of conic, also determined from its coefficients but, a circulararc of which distances (center-start) and (center-end) are not equal cannot be corrected ... //! returns true if something has been corrected in <ent> by default, does nothing. if at least one of the types processed by a sub-class of specificmodule has a correct procedure attached, this method can be redefined.

Parameters
----------
CN: int
ent: IGESData_IGESEntity

Returns
-------
bool
") OwnCorrect;
		virtual Standard_Boolean OwnCorrect(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** OwnDump ******************/
		/**** md5 signature: 971dfde837815f5359746132d6541d0e ****/
		%feature("compactdefaultargs") OwnDump;
		%feature("autodoc", "Specific dump for each type of iges entity : it concerns only own parameters, the general data (directory part, lists) are taken into account by the igesdumper see class igesdumper for the rules to follow for <own> and <attached> level.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
dumper: IGESData_IGESDumper
S: Message_Messenger
own: int

Returns
-------
None
") OwnDump;
		virtual void OwnDump(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const IGESData_IGESDumper & dumper, const opencascade::handle<Message_Messenger> & S, const Standard_Integer own);

};


%make_alias(IGESData_SpecificModule)

%extend IGESData_SpecificModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESData_ToolLocation *
******************************/
class IGESData_ToolLocation : public Standard_Transient {
	public:
		/****************** IGESData_ToolLocation ******************/
		/**** md5 signature: ece0883a0ffc681b36aed917904c13d5 ****/
		%feature("compactdefaultargs") IGESData_ToolLocation;
		%feature("autodoc", "Creates a toollocation on a given model, filled with the help of a protocol (which allows to known entities referenced by other ones).

Parameters
----------
amodel: IGESData_IGESModel
protocol: IGESData_Protocol

Returns
-------
None
") IGESData_ToolLocation;
		 IGESData_ToolLocation(const opencascade::handle<IGESData_IGESModel> & amodel, const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** AnalyseLocation ******************/
		/**** md5 signature: 6505b52510f29496969bb2c34879f238 ****/
		%feature("compactdefaultargs") AnalyseLocation;
		%feature("autodoc", "Analysis a location given as a gtrsf, by trying to convert it to a trsf (i.e. to a true location of which effect is described by an isometry or a similarity) works with the precision given by default or by setprecision calls convertlocation (see below).

Parameters
----------
loc: gp_GTrsf
result: gp_Trsf

Returns
-------
bool
") AnalyseLocation;
		Standard_Boolean AnalyseLocation(const gp_GTrsf & loc, gp_Trsf & result);

		/****************** ConvertLocation ******************/
		/**** md5 signature: d88a9351c35f05028c597b1f49d4a449 ****/
		%feature("compactdefaultargs") ConvertLocation;
		%feature("autodoc", "Convertion of a location, from gtrsf form to trsf form works with a precision given as argument. returns true if the conversion is possible, (hence, <result> contains the converted location), false else <unit>, if given, indicates the unit in which <loc> is defined in meters. it concerns the translation part (to be converted. //! as a class method, it can be called separately.

Parameters
----------
prec: float
loc: gp_GTrsf
result: gp_Trsf
uni: float,optional
	default value is 1

Returns
-------
bool
") ConvertLocation;
		static Standard_Boolean ConvertLocation(const Standard_Real prec, const gp_GTrsf & loc, gp_Trsf & result, const Standard_Real uni = 1);

		/****************** EffectiveLocation ******************/
		/**** md5 signature: 965dc7c24b463a3ac115960ff1f244e4 ****/
		%feature("compactdefaultargs") EffectiveLocation;
		%feature("autodoc", "Returns the effective location of an entity, i.e. the composition of its proper transformation matrix (returned by transf) and its parent's location (returned by parentlocation).

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
gp_GTrsf
") EffectiveLocation;
		gp_GTrsf EffectiveLocation(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** ExplicitLocation ******************/
		/**** md5 signature: e97e2a7d450ddca9a19653467259777b ****/
		%feature("compactdefaultargs") ExplicitLocation;
		%feature("autodoc", "Returns the explicit location defined by the transformation matrix of <ent>. identity if there is none.

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
gp_GTrsf
") ExplicitLocation;
		gp_GTrsf ExplicitLocation(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** HasParent ******************/
		/**** md5 signature: 30278e3ba06a09dd6b9664cce0877575 ****/
		%feature("compactdefaultargs") HasParent;
		%feature("autodoc", "Returns true if <ent> is dependent from one and only one other entity, either by reference or by associativity.

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
bool
") HasParent;
		Standard_Boolean HasParent(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** HasParentByAssociativity ******************/
		/**** md5 signature: f3a27ae5d42b5e162098b70e7138bf62 ****/
		%feature("compactdefaultargs") HasParentByAssociativity;
		%feature("autodoc", "Returns true if the parent, if there is one, is defined by a singleparententity associativity else, if hasparent is true, it is by reference.

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
bool
") HasParentByAssociativity;
		Standard_Boolean HasParentByAssociativity(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** HasTransf ******************/
		/**** md5 signature: 4328fae714f2eb51054b9fa9feb3e9a0 ****/
		%feature("compactdefaultargs") HasTransf;
		%feature("autodoc", "Returns true if <ent> has a transformation matrix in proper (referenced from its directory part).

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
bool
") HasTransf;
		Standard_Boolean HasTransf(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** IsAmbiguous ******************/
		/**** md5 signature: a142ade04a303f2a2924927f9be83a32 ****/
		%feature("compactdefaultargs") IsAmbiguous;
		%feature("autodoc", "Returns true if more than one parent has been determined for <ent>, by adding direct references and associativities.

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
bool
") IsAmbiguous;
		Standard_Boolean IsAmbiguous(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** IsAssociativity ******************/
		/**** md5 signature: df8bd2dde6b978364168767639fb635c ****/
		%feature("compactdefaultargs") IsAssociativity;
		%feature("autodoc", "Returns true if <ent> is an associativity (iges type 402). then, location does not apply.

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
bool
") IsAssociativity;
		Standard_Boolean IsAssociativity(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** IsTransf ******************/
		/**** md5 signature: 4093feb571ae01012954d808e107de69 ****/
		%feature("compactdefaultargs") IsTransf;
		%feature("autodoc", "Returns true if <ent> is kind of transfentity. then, it has no location, while it can be used to define a location).

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
bool
") IsTransf;
		Standard_Boolean IsTransf(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** Load ******************/
		/**** md5 signature: 14bc79a16a4ba0fe93224560bb579cb0 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Does the effective work of determining locations of entities.

Returns
-------
None
") Load;
		void Load();

		/****************** Parent ******************/
		/**** md5 signature: ec19156c2a24bfda13ba3ff5d16ce9f4 ****/
		%feature("compactdefaultargs") Parent;
		%feature("autodoc", "Returns the unique parent recorded for <ent>. returns a null handle if there is none.

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Parent;
		opencascade::handle<IGESData_IGESEntity> Parent(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** ParentLocation ******************/
		/**** md5 signature: 5bdd0fc0426312315187678d7df40176 ****/
		%feature("compactdefaultargs") ParentLocation;
		%feature("autodoc", "Returns the effective location of the parent of <ent>, if there is one : this location is itself given as compound according dependences on the parent, if there are some. returns an identity transformation if no parent is recorded.

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
gp_GTrsf
") ParentLocation;
		gp_GTrsf ParentLocation(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** ResetDependences ******************/
		/**** md5 signature: 774125d1ea13a5a21a07551198018ad4 ****/
		%feature("compactdefaultargs") ResetDependences;
		%feature("autodoc", "Resets all informations about dependences for <child>.

Parameters
----------
child: IGESData_IGESEntity

Returns
-------
None
") ResetDependences;
		void ResetDependences(const opencascade::handle<IGESData_IGESEntity> & child);

		/****************** SetOwnAsDependent ******************/
		/**** md5 signature: 99cc09240fbab397bb91c194d3a0b6cc ****/
		%feature("compactdefaultargs") SetOwnAsDependent;
		%feature("autodoc", "Unitary action which defines entities referenced by <ent> (except those in directory part and associativities list) as dependent (their locations are related to that of <ent>).

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
None
") SetOwnAsDependent;
		void SetOwnAsDependent(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** SetParentAssoc ******************/
		/**** md5 signature: 175fb9559c279edac7dd744e5b0cd95a ****/
		%feature("compactdefaultargs") SetParentAssoc;
		%feature("autodoc", "Sets the 'associativity' information for <child> as being <parent> (it must be the parent itself, not the associativity).

Parameters
----------
parent: IGESData_IGESEntity
child: IGESData_IGESEntity

Returns
-------
None
") SetParentAssoc;
		void SetParentAssoc(const opencascade::handle<IGESData_IGESEntity> & parent, const opencascade::handle<IGESData_IGESEntity> & child);

		/****************** SetPrecision ******************/
		/**** md5 signature: 683e72fa620702e8c921bb4783d3d0b5 ****/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "Sets a precision for the analysis of locations (default by constructor is 1.e-05).

Parameters
----------
prec: float

Returns
-------
None
") SetPrecision;
		void SetPrecision(const Standard_Real prec);

		/****************** SetReference ******************/
		/**** md5 signature: ac648ca8ad4e0f9b9f0124f883b5ef65 ****/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "Sets the 'reference' information for <child> as being <parent> sets an error status if already set (see method isambiguous).

Parameters
----------
parent: IGESData_IGESEntity
child: IGESData_IGESEntity

Returns
-------
None
") SetReference;
		void SetReference(const opencascade::handle<IGESData_IGESEntity> & parent, const opencascade::handle<IGESData_IGESEntity> & child);

};


%make_alias(IGESData_ToolLocation)

%extend IGESData_ToolLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESData_WriterLib *
***************************/
class IGESData_WriterLib {
	public:
		/****************** IGESData_WriterLib ******************/
		/**** md5 signature: c21f94cb0b4c664a5dafb888d5b7d5ae ****/
		%feature("compactdefaultargs") IGESData_WriterLib;
		%feature("autodoc", "Creates a library which complies with a protocol, that is : same class (criterium isinstance) this creation gets the modules from the global set, those which are bound to the given protocol and its resources.

Parameters
----------
aprotocol: IGESData_Protocol

Returns
-------
None
") IGESData_WriterLib;
		 IGESData_WriterLib(const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****************** IGESData_WriterLib ******************/
		/**** md5 signature: 684ea18a7afd7f274a8f5320d3c82c04 ****/
		%feature("compactdefaultargs") IGESData_WriterLib;
		%feature("autodoc", "Creates an empty library : it will later by filled by method addprotocol.

Returns
-------
None
") IGESData_WriterLib;
		 IGESData_WriterLib();

		/****************** AddProtocol ******************/
		/**** md5 signature: 97bedbaaa5336e800a60d78a56ab8c60 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list of modules of a library (can be used to redefine the order of modules before action : clear then refill the library by calls to addprotocol).

Returns
-------
None
") Clear;
		void Clear();

		/****************** Module ******************/
		/**** md5 signature: 620617849b7007bcf8f20d0e6d505c82 ****/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the current module in the iteration.

Returns
-------
opencascade::handle<IGESData_ReadWriteModule>
") Module;
		const opencascade::handle<IGESData_ReadWriteModule> & Module();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there are more modules to iterate on.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Iterates by getting the next module in the list if there is none, the exception will be raised by value.

Returns
-------
None
") Next;
		void Next();

		/****************** Protocol ******************/
		/**** md5 signature: 4eb07a48dbfd452cf11a527b6ce5309c ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the current protocol in the iteration.

Returns
-------
opencascade::handle<IGESData_Protocol>
") Protocol;
		const opencascade::handle<IGESData_Protocol> & Protocol();

		/****************** Select ******************/
		/**** md5 signature: 65d70c03516a734c5fb3f481de80f7aa ****/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Selects a module from the library, given an object. returns true if select has succeeded, false else. also returns (as arguments) the selected module and the case number determined by the associated protocol. if select has failed, <module> is null handle and cn is zero. (select can work on any criterium, such as object dynamictype).

Parameters
----------
obj: IGESData_IGESEntity
module: IGESData_ReadWriteModule

Returns
-------
CN: int
") Select;
		Standard_Boolean Select(const opencascade::handle<IGESData_IGESEntity> & obj, opencascade::handle<IGESData_ReadWriteModule> & module, Standard_Integer &OutValue);

		/****************** SetComplete ******************/
		/**** md5 signature: 9b2529d2e257b2464fe4d8064a8a0171 ****/
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "Sets a library to be defined with the complete global list (all the couples protocol/modules recorded in it).

Returns
-------
None
") SetComplete;
		void SetComplete();

		/****************** SetGlobal ******************/
		/**** md5 signature: 1cd09dea33e22bc356df9507fb54941a ****/
		%feature("compactdefaultargs") SetGlobal;
		%feature("autodoc", "Adds a couple (module-protocol) into the global definition set for this class of library.

Parameters
----------
amodule: IGESData_ReadWriteModule
aprotocol: IGESData_Protocol

Returns
-------
None
") SetGlobal;
		static void SetGlobal(const opencascade::handle<IGESData_ReadWriteModule> & amodule, const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****************** Start ******************/
		/**** md5 signature: f8a4dbf1e6f2cec0927301856b440be5 ****/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Starts iteration on the modules (sets it on the first one).

Returns
-------
None
") Start;
		void Start();

};


%extend IGESData_WriterLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESData_ColorEntity *
*****************************/
class IGESData_ColorEntity : public IGESData_IGESEntity {
	public:
};


%make_alias(IGESData_ColorEntity)

%extend IGESData_ColorEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESData_DefaultGeneral *
********************************/
class IGESData_DefaultGeneral : public IGESData_GeneralModule {
	public:
		/****************** IGESData_DefaultGeneral ******************/
		/**** md5 signature: a94f4ee4970a0711e4ae58c36f4b32e9 ****/
		%feature("compactdefaultargs") IGESData_DefaultGeneral;
		%feature("autodoc", "Creates a defaultgeneral and puts it into generallib, bound with a protocol from igesdata.

Returns
-------
None
") IGESData_DefaultGeneral;
		 IGESData_DefaultGeneral();

		/****************** DirChecker ******************/
		/**** md5 signature: 06ffbfa1e4d88543cc06fdf7c67993ee ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns a dirchecker, specific for each type of entity here, returns an empty dirchecker (no constraint to check).

Parameters
----------
CN: int
ent: IGESData_IGESEntity

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** NewVoid ******************/
		/**** md5 signature: 8e184c5622d3823d145bc2105790b57a ****/
		%feature("compactdefaultargs") NewVoid;
		%feature("autodoc", "Specific creation of a new void entity (undefinedentity only).

Parameters
----------
CN: int
entto: Standard_Transient

Returns
-------
bool
") NewVoid;
		Standard_Boolean NewVoid(const Standard_Integer CN, opencascade::handle<Standard_Transient> & entto);

		/****************** OwnCheckCase ******************/
		/**** md5 signature: a04fd9a5e3c5ef0e136832f7ce57363b ****/
		%feature("compactdefaultargs") OwnCheckCase;
		%feature("autodoc", "Performs specific semantic check for each type of entity here, does nothing (no constraint to check).

Parameters
----------
CN: int
ent: IGESData_IGESEntity
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheckCase;
		void OwnCheckCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopyCase ******************/
		/**** md5 signature: 5c0289b7b5a5ec08bef5e9dac3d445b7 ****/
		%feature("compactdefaultargs") OwnCopyCase;
		%feature("autodoc", "Copies parameters which are specific of each type of entity.

Parameters
----------
CN: int
entfrom: IGESData_IGESEntity
entto: IGESData_IGESEntity
TC: Interface_CopyTool

Returns
-------
None
") OwnCopyCase;
		void OwnCopyCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & entfrom, const opencascade::handle<IGESData_IGESEntity> & entto, Interface_CopyTool & TC);

		/****************** OwnSharedCase ******************/
		/**** md5 signature: 1d978dfb0f38035ed4292cc342ee187f ****/
		%feature("compactdefaultargs") OwnSharedCase;
		%feature("autodoc", "Lists the entities shared by an igesentity, which must be an undefinedentity.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
iter: Interface_EntityIterator

Returns
-------
None
") OwnSharedCase;
		void OwnSharedCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, Interface_EntityIterator & iter);

};


%make_alias(IGESData_DefaultGeneral)

%extend IGESData_DefaultGeneral {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESData_DefaultSpecific *
*********************************/
class IGESData_DefaultSpecific : public IGESData_SpecificModule {
	public:
		/****************** IGESData_DefaultSpecific ******************/
		/**** md5 signature: 0f716d41251483626d473ea28d4f5afd ****/
		%feature("compactdefaultargs") IGESData_DefaultSpecific;
		%feature("autodoc", "Creates a defaultspecific and puts it into specificlib.

Returns
-------
None
") IGESData_DefaultSpecific;
		 IGESData_DefaultSpecific();

		/****************** OwnDump ******************/
		/**** md5 signature: 7d568e35f284dd8e24c129b3f26e0c96 ****/
		%feature("compactdefaultargs") OwnDump;
		%feature("autodoc", "Specific dump for undefinedentity : it concerns only own parameters, the general data (directory part, lists) are taken into account by the igesdumper.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
dumper: IGESData_IGESDumper
S: Message_Messenger
own: int

Returns
-------
None
") OwnDump;
		void OwnDump(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const IGESData_IGESDumper & dumper, const opencascade::handle<Message_Messenger> & S, const Standard_Integer own);

};


%make_alias(IGESData_DefaultSpecific)

%extend IGESData_DefaultSpecific {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESData_FileProtocol *
******************************/
class IGESData_FileProtocol : public IGESData_Protocol {
	public:
		/****************** IGESData_FileProtocol ******************/
		/**** md5 signature: 93aa4dce9a32d30c245626eca2a8b96d ****/
		%feature("compactdefaultargs") IGESData_FileProtocol;
		%feature("autodoc", "Returns an empty fileprotocol.

Returns
-------
None
") IGESData_FileProtocol;
		 IGESData_FileProtocol();

		/****************** Add ******************/
		/**** md5 signature: d602e73c6588ce70faab49ca1972f0ef ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a resource.

Parameters
----------
protocol: IGESData_Protocol

Returns
-------
None
") Add;
		void Add(const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** NbResources ******************/
		/**** md5 signature: cd524335b33aeb6eb83cc80f6b7e5681 ****/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Gives the count of resources : the count of added protocols.

Returns
-------
int
") NbResources;
		virtual Standard_Integer NbResources();

		/****************** Resource ******************/
		/**** md5 signature: 26597e9d8db9fc70530508f766cf0d70 ****/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "Returns a resource, given a rank (rank of call to add).

Parameters
----------
num: int

Returns
-------
opencascade::handle<Interface_Protocol>
") Resource;
		virtual opencascade::handle<Interface_Protocol> Resource(const Standard_Integer num);

};


%make_alias(IGESData_FileProtocol)

%extend IGESData_FileProtocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESData_LabelDisplayEntity *
************************************/
class IGESData_LabelDisplayEntity : public IGESData_IGESEntity {
	public:
};


%make_alias(IGESData_LabelDisplayEntity)

%extend IGESData_LabelDisplayEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESData_LevelListEntity *
*********************************/
%nodefaultctor IGESData_LevelListEntity;
class IGESData_LevelListEntity : public IGESData_IGESEntity {
	public:
		/****************** HasLevelNumber ******************/
		/**** md5 signature: 6e3d8ae20cde014b025b6ec7a6e5ad6b ****/
		%feature("compactdefaultargs") HasLevelNumber;
		%feature("autodoc", "Returns true if <level> is in the list.

Parameters
----------
level: int

Returns
-------
bool
") HasLevelNumber;
		Standard_Boolean HasLevelNumber(const Standard_Integer level);

		/****************** LevelNumber ******************/
		/**** md5 signature: 728f6d613b520c606432617960e507a1 ****/
		%feature("compactdefaultargs") LevelNumber;
		%feature("autodoc", "Returns the level number of <self>, indicated by <num> raises an exception if num is out of range.

Parameters
----------
num: int

Returns
-------
int
") LevelNumber;
		virtual Standard_Integer LevelNumber(const Standard_Integer num);

		/****************** NbLevelNumbers ******************/
		/**** md5 signature: 13d01bd3d60c42f0f5f0bf6fa6dbd1f8 ****/
		%feature("compactdefaultargs") NbLevelNumbers;
		%feature("autodoc", "Must return the count of levels.

Returns
-------
int
") NbLevelNumbers;
		virtual Standard_Integer NbLevelNumbers();

};


%make_alias(IGESData_LevelListEntity)

%extend IGESData_LevelListEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESData_LineFontEntity *
********************************/
class IGESData_LineFontEntity : public IGESData_IGESEntity {
	public:
};


%make_alias(IGESData_LineFontEntity)

%extend IGESData_LineFontEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESData_NameEntity *
****************************/
%nodefaultctor IGESData_NameEntity;
class IGESData_NameEntity : public IGESData_IGESEntity {
	public:
		/****************** Value ******************/
		/**** md5 signature: 3efab42b0037f36f7bde757d1863aedc ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Retyrns the alphanumeric value of the name, to be defined.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Value;
		virtual opencascade::handle<TCollection_HAsciiString> Value();

};


%make_alias(IGESData_NameEntity)

%extend IGESData_NameEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESData_SingleParentEntity *
************************************/
%nodefaultctor IGESData_SingleParentEntity;
class IGESData_SingleParentEntity : public IGESData_IGESEntity {
	public:
		/****************** Child ******************/
		/**** md5 signature: f17b0c264f47f8eb24c6a5a5648863ab ****/
		%feature("compactdefaultargs") Child;
		%feature("autodoc", "Returns a child given its rank.

Parameters
----------
num: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Child;
		virtual opencascade::handle<IGESData_IGESEntity> Child(const Standard_Integer num);

		/****************** NbChildren ******************/
		/**** md5 signature: 175590d729766ac75534fc460a0217e1 ****/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Returns the count of entities designated as children.

Returns
-------
int
") NbChildren;
		virtual Standard_Integer NbChildren();

		/****************** SingleParent ******************/
		/**** md5 signature: c5750f38b3582e3eed3080b9d08558eb ****/
		%feature("compactdefaultargs") SingleParent;
		%feature("autodoc", "Returns the parent designated by the entity, if only one !.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") SingleParent;
		virtual opencascade::handle<IGESData_IGESEntity> SingleParent();

};


%make_alias(IGESData_SingleParentEntity)

%extend IGESData_SingleParentEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESData_TransfEntity *
******************************/
%nodefaultctor IGESData_TransfEntity;
class IGESData_TransfEntity : public IGESData_IGESEntity {
	public:
		/****************** Value ******************/
		/**** md5 signature: 7b00c4ce969aa987b88144c321b31cee ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Gives value of the transformation, as a gtrsf to be defined by an effective class of transformation entity warning : must take in account composition : if a transfentity has in its directory part, a transf, this means that it is compound, value must return the global result.

Returns
-------
gp_GTrsf
") Value;
		virtual gp_GTrsf Value();

};


%make_alias(IGESData_TransfEntity)

%extend IGESData_TransfEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESData_UndefinedEntity *
*********************************/
class IGESData_UndefinedEntity : public IGESData_IGESEntity {
	public:
		/****************** IGESData_UndefinedEntity ******************/
		/**** md5 signature: 341bc31d84cbf3490a6fff24866c14a6 ****/
		%feature("compactdefaultargs") IGESData_UndefinedEntity;
		%feature("autodoc", "Creates an unknown entity.

Returns
-------
None
") IGESData_UndefinedEntity;
		 IGESData_UndefinedEntity();

		/****************** ChangeableContent ******************/
		/**** md5 signature: 1ab17b154aa704fa87d1bc1350a96a4d ****/
		%feature("compactdefaultargs") ChangeableContent;
		%feature("autodoc", "Returns own data as an undefinedcontent, in order to touch it.

Returns
-------
opencascade::handle<Interface_UndefinedContent>
") ChangeableContent;
		opencascade::handle<Interface_UndefinedContent> ChangeableContent();

		/****************** DefColor ******************/
		/**** md5 signature: df729d36a6c3bd6dbdb73c772781dd7f ****/
		%feature("compactdefaultargs") DefColor;
		%feature("autodoc", "Returns error status if necessary, else calls original method.

Returns
-------
IGESData_DefType
") DefColor;
		virtual IGESData_DefType DefColor();

		/****************** DefLevel ******************/
		/**** md5 signature: 24ebb34e7ce3d30f47be96247f29f837 ****/
		%feature("compactdefaultargs") DefLevel;
		%feature("autodoc", "Returns error status if necessary, else calls original method.

Returns
-------
IGESData_DefList
") DefLevel;
		virtual IGESData_DefList DefLevel();

		/****************** DefLineFont ******************/
		/**** md5 signature: bd07b091f1c06c07442342350e34d6d9 ****/
		%feature("compactdefaultargs") DefLineFont;
		%feature("autodoc", "Returns error status if necessary, else calls original method.

Returns
-------
IGESData_DefType
") DefLineFont;
		virtual IGESData_DefType DefLineFont();

		/****************** DefView ******************/
		/**** md5 signature: 2be876ab214cfa81805ee5f9bd3ebbfc ****/
		%feature("compactdefaultargs") DefView;
		%feature("autodoc", "Returns error status if necessary, else calls original method.

Returns
-------
IGESData_DefList
") DefView;
		virtual IGESData_DefList DefView();

		/****************** DirStatus ******************/
		/**** md5 signature: 09f6e73726397b9acbdef9af756fd13e ****/
		%feature("compactdefaultargs") DirStatus;
		%feature("autodoc", "Returns directory error status (used for copy).

Returns
-------
int
") DirStatus;
		Standard_Integer DirStatus();

		/****************** HasSubScriptNumber ******************/
		/**** md5 signature: 89e5a77782c6a371cdd21bbe6a8912f6 ****/
		%feature("compactdefaultargs") HasSubScriptNumber;
		%feature("autodoc", "Returns error status if necessary, else calls original method (that is, if subscript field is not blank or positive integer).

Returns
-------
bool
") HasSubScriptNumber;
		virtual Standard_Boolean HasSubScriptNumber();

		/****************** IsOKDirPart ******************/
		/**** md5 signature: a586de71abb9fa9ce3a5bd71ddb254bb ****/
		%feature("compactdefaultargs") IsOKDirPart;
		%feature("autodoc", "Says if dirpart is ok or not (if not, it is erroneous) note that if it is not, def* methods can return error status.

Returns
-------
bool
") IsOKDirPart;
		Standard_Boolean IsOKDirPart();

		/****************** ReadDir ******************/
		/**** md5 signature: ac4bd3e7c6284d9c7a7b30a00439fc9b ****/
		%feature("compactdefaultargs") ReadDir;
		%feature("autodoc", "Computes the directory error status, to be called before standard readdir from igesreadertool returns true if ok (hence, directory can be loaded), else returns false and the dirpart <dp> is modified (hence, directory error status is non null; and standard read will work with an acceptable directorypart).

Parameters
----------
IR: IGESData_IGESReaderData
DP: IGESData_DirPart
ach: Interface_Check

Returns
-------
bool
") ReadDir;
		virtual Standard_Boolean ReadDir(const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_DirPart & DP, opencascade::handle<Interface_Check> & ach);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: ce396b7c045c32fe23436ded438eff26 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file; pr gives access to them, ir detains parameter types and values here, reads all parameters, integers are considered as entity reference unless they cannot be; no list interpretation no property or associativity list is managed.

Parameters
----------
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		virtual void ReadOwnParams(const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** SetNewContent ******************/
		/**** md5 signature: eca689e56e60de444eb442f8f0627c96 ****/
		%feature("compactdefaultargs") SetNewContent;
		%feature("autodoc", "Redefines a completely new undefinedcontent used by a copy which begins by shallowcopy, for instance.

Parameters
----------
cont: Interface_UndefinedContent

Returns
-------
None
") SetNewContent;
		void SetNewContent(const opencascade::handle<Interface_UndefinedContent> & cont);

		/****************** SetOKDirPart ******************/
		/**** md5 signature: a5e2936d6015e97c203cd061b97f693d ****/
		%feature("compactdefaultargs") SetOKDirPart;
		%feature("autodoc", "Erases the directory error status warning : be sure that data are consistent to call this method ...

Returns
-------
None
") SetOKDirPart;
		void SetOKDirPart();

		/****************** UndefinedContent ******************/
		/**** md5 signature: c3cd969c2461601a249f1babf934a5bb ****/
		%feature("compactdefaultargs") UndefinedContent;
		%feature("autodoc", "Returns own data as an undefinedcontent.

Returns
-------
opencascade::handle<Interface_UndefinedContent>
") UndefinedContent;
		opencascade::handle<Interface_UndefinedContent> UndefinedContent();

		/****************** WriteOwnParams ******************/
		/**** md5 signature: f5df84c0c628edcb5f80c0d02248159c ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes parameters to igeswriter, taken from undefinedcontent.

Parameters
----------
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		virtual void WriteOwnParams(IGESData_IGESWriter & IW);

};


%make_alias(IGESData_UndefinedEntity)

%extend IGESData_UndefinedEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESData_ViewKindEntity *
********************************/
%nodefaultctor IGESData_ViewKindEntity;
class IGESData_ViewKindEntity : public IGESData_IGESEntity {
	public:
		/****************** IsSingle ******************/
		/**** md5 signature: c7535e12cfc5581af79774d2c5cc3b1f ****/
		%feature("compactdefaultargs") IsSingle;
		%feature("autodoc", "Says if 'me' is a single view (true) or a list of views (false).

Returns
-------
bool
") IsSingle;
		virtual Standard_Boolean IsSingle();

		/****************** NbViews ******************/
		/**** md5 signature: 484337e5f6e276964761f5de8e14cb0e ****/
		%feature("compactdefaultargs") NbViews;
		%feature("autodoc", "Returns the count of views for a list of views. for a single view, may return simply 1.

Returns
-------
int
") NbViews;
		virtual Standard_Integer NbViews();

		/****************** ViewItem ******************/
		/**** md5 signature: 666e828a0dcb29cb2bfb10d85b5c7a20 ****/
		%feature("compactdefaultargs") ViewItem;
		%feature("autodoc", "Returns the view n0. <num> for a list of views. for a single views, may return <self> itself.

Parameters
----------
num: int

Returns
-------
opencascade::handle<IGESData_ViewKindEntity>
") ViewItem;
		virtual opencascade::handle<IGESData_ViewKindEntity> ViewItem(const Standard_Integer num);

};


%make_alias(IGESData_ViewKindEntity)

%extend IGESData_ViewKindEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESData_FreeFormatEntity *
**********************************/
class IGESData_FreeFormatEntity : public IGESData_UndefinedEntity {
	public:
		/****************** IGESData_FreeFormatEntity ******************/
		/**** md5 signature: 96832e62fd6f997c1f9cd242a5729c17 ****/
		%feature("compactdefaultargs") IGESData_FreeFormatEntity;
		%feature("autodoc", "Creates a completely empty freeformatentity.

Returns
-------
None
") IGESData_FreeFormatEntity;
		 IGESData_FreeFormatEntity();

		/****************** AddEntities ******************/
		/**** md5 signature: 2722fcab00317dbfb6b14e0dbe4c3385 ****/
		%feature("compactdefaultargs") AddEntities;
		%feature("autodoc", "Adds a set of entities, given as a harray1ofigesentity causes creation of : an integer parameter which gives count of entities, then the list of entities of the array error if an entity is not an igesentity all these entities will be interpreted as 'positive pointers' by igeswriter.

Parameters
----------
ents: IGESData_HArray1OfIGESEntity

Returns
-------
None
") AddEntities;
		void AddEntities(const opencascade::handle<IGESData_HArray1OfIGESEntity> & ents);

		/****************** AddEntity ******************/
		/**** md5 signature: 3c8d5644ce8f5f33dcd64f56a87ee434 ****/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "Adds a parameter which references an entity. if the entity is null, the added parameter will define a 'null pointer' (0) if <negative> is given true, this will command sending to file (see igeswriter) to produce a 'negative pointer' (default is false).

Parameters
----------
ptype: Interface_ParamType
ent: IGESData_IGESEntity
negative: bool,optional
	default value is Standard_False

Returns
-------
None
") AddEntity;
		void AddEntity(const Interface_ParamType ptype, const opencascade::handle<IGESData_IGESEntity> & ent, const Standard_Boolean negative = Standard_False);

		/****************** AddLiteral ******************/
		/**** md5 signature: 42c39aaae211ba3460d3b8849e56c767 ****/
		%feature("compactdefaultargs") AddLiteral;
		%feature("autodoc", "Adds a literal parameter to the list (as such).

Parameters
----------
ptype: Interface_ParamType
val: TCollection_HAsciiString

Returns
-------
None
") AddLiteral;
		void AddLiteral(const Interface_ParamType ptype, const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** AddLiteral ******************/
		/**** md5 signature: 76917af961f32cd77dd8618232875d21 ****/
		%feature("compactdefaultargs") AddLiteral;
		%feature("autodoc", "Adds a literal parameter to the list (builds an hasciistring).

Parameters
----------
ptype: Interface_ParamType
val: char *

Returns
-------
None
") AddLiteral;
		void AddLiteral(const Interface_ParamType ptype, const char * val);

		/****************** AddNegativePointers ******************/
		/**** md5 signature: 33e3fd63e015423d0c67a74a4d9b8824 ****/
		%feature("compactdefaultargs") AddNegativePointers;
		%feature("autodoc", "Adds a list of ranks of parameters to be noted as negative pointers (this will be taken into account for parameters which are entities).

Parameters
----------
list: TColStd_HSequenceOfInteger

Returns
-------
None
") AddNegativePointers;
		void AddNegativePointers(const opencascade::handle<TColStd_HSequenceOfInteger> & list);

		/****************** ClearNegativePointers ******************/
		/**** md5 signature: dd3ad83abfc38f29bcf0cbb8425c8532 ****/
		%feature("compactdefaultargs") ClearNegativePointers;
		%feature("autodoc", "Clears all informations about negative pointers, hence every entity kind parameter will be send normally, as positive.

Returns
-------
None
") ClearNegativePointers;
		void ClearNegativePointers();

		/****************** IsNegativePointer ******************/
		/**** md5 signature: f21b874b60ac5b311983528a04b8a81f ****/
		%feature("compactdefaultargs") IsNegativePointer;
		%feature("autodoc", "Returns true if <num> is noted as for a 'negative pointer' (see addentity for details). senseful only if isparamentity answers true for <num>, else returns false.

Parameters
----------
num: int

Returns
-------
bool
") IsNegativePointer;
		Standard_Boolean IsNegativePointer(const Standard_Integer num);

		/****************** IsParamEntity ******************/
		/**** md5 signature: edcc5f4164bf630a10b2eddc151d1934 ****/
		%feature("compactdefaultargs") IsParamEntity;
		%feature("autodoc", "Returns true if a parameter is recorded as an entity error if num is not between 1 and nbparams.

Parameters
----------
num: int

Returns
-------
bool
") IsParamEntity;
		Standard_Boolean IsParamEntity(const Standard_Integer num);

		/****************** NbParams ******************/
		/**** md5 signature: 826f4756fca7f780e6d976c60183d715 ****/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Gives count of recorded parameters.

Returns
-------
int
") NbParams;
		Standard_Integer NbParams();

		/****************** NegativePointers ******************/
		/**** md5 signature: 19bd53b3f3f5b85696a0f7e1cc70530b ****/
		%feature("compactdefaultargs") NegativePointers;
		%feature("autodoc", "Returns the complete list of ramks of parameters which have been noted as negative pointers warning : it is returned as a null handle if none was noted.

Returns
-------
opencascade::handle<TColStd_HSequenceOfInteger>
") NegativePointers;
		opencascade::handle<TColStd_HSequenceOfInteger> NegativePointers();

		/****************** ParamData ******************/
		/**** md5 signature: 11d466d23f4fcfca11f9559a83610f5e ****/
		%feature("compactdefaultargs") ParamData;
		%feature("autodoc", "Returns data of a parameter : its type, and the entity if it designates en entity ('ent') or its literal value else ('str') returned value (boolean) : true if it is an entity, false else.

Parameters
----------
num: int
ptype: Interface_ParamType
ent: IGESData_IGESEntity
val: TCollection_HAsciiString

Returns
-------
bool
") ParamData;
		Standard_Boolean ParamData(const Standard_Integer num, Interface_ParamType & ptype, opencascade::handle<IGESData_IGESEntity> & ent, opencascade::handle<TCollection_HAsciiString> & val);

		/****************** ParamEntity ******************/
		/**** md5 signature: 2a0bffa8d17df8d6aa5a1fa692044d19 ****/
		%feature("compactdefaultargs") ParamEntity;
		%feature("autodoc", "Returns entity corresponding to a param, given its rank error if out of range or if param num does not designate an entity.

Parameters
----------
num: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") ParamEntity;
		opencascade::handle<IGESData_IGESEntity> ParamEntity(const Standard_Integer num);

		/****************** ParamType ******************/
		/**** md5 signature: 06805a954cdda33c70604680f220e0c5 ****/
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "Returns the paramtype of a param, given its rank error if num is not between 1 and nbparams.

Parameters
----------
num: int

Returns
-------
Interface_ParamType
") ParamType;
		Interface_ParamType ParamType(const Standard_Integer num);

		/****************** ParamValue ******************/
		/**** md5 signature: 27f0f605c60e921cd93c878a3119e98b ****/
		%feature("compactdefaultargs") ParamValue;
		%feature("autodoc", "Returns litteral value of a parameter, given its rank error if num is out of range, or if parameter is not literal.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ParamValue;
		opencascade::handle<TCollection_HAsciiString> ParamValue(const Standard_Integer num);

		/****************** SetFormNumber ******************/
		/**** md5 signature: 56d262317d52b4b1487246c0eba647b7 ****/
		%feature("compactdefaultargs") SetFormNumber;
		%feature("autodoc", "Sets form number to a new value (to called after settypenumber).

Parameters
----------
formnum: int

Returns
-------
None
") SetFormNumber;
		void SetFormNumber(const Standard_Integer formnum);

		/****************** SetTypeNumber ******************/
		/**** md5 signature: 85ab744003ab5d58c8acd6bbe2979925 ****/
		%feature("compactdefaultargs") SetTypeNumber;
		%feature("autodoc", "Sets type number to a new value, and form number to zero.

Parameters
----------
typenum: int

Returns
-------
None
") SetTypeNumber;
		void SetTypeNumber(const Standard_Integer typenum);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: ce614fc3b2cd77ab3826f39614fd8e9c ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writeownparams is redefined for freeformatentity to take into account the supplementary information 'negative pointer'.

Parameters
----------
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		virtual void WriteOwnParams(IGESData_IGESWriter & IW);

};


%make_alias(IGESData_FreeFormatEntity)

%extend IGESData_FreeFormatEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class IGESData_HArray1OfIGESEntity : public IGESData_Array1OfIGESEntity, public Standard_Transient {
  public:
    IGESData_HArray1OfIGESEntity(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESData_HArray1OfIGESEntity(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESData_Array1OfIGESEntity::value_type& theValue);
    IGESData_HArray1OfIGESEntity(const IGESData_Array1OfIGESEntity& theOther);
    const IGESData_Array1OfIGESEntity& Array1();
    IGESData_Array1OfIGESEntity& ChangeArray1();
};
%make_alias(IGESData_HArray1OfIGESEntity)

/* harray2 classes */
/* hsequence classes */
