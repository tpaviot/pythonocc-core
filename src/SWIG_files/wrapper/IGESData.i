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
%define IGESDATADOCSTRING
"IGESData module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_igesdata.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<IGESData_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Interface_module.hxx>
#include<TCollection_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<Poly_module.hxx>
#include<BRep_module.hxx>
#include<TopTools_module.hxx>
#include<TShort_module.hxx>
#include<TColGeom_module.hxx>
#include<ShapeExtend_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Bnd_module.hxx>
#include<BRepTools_module.hxx>
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
%import TColStd.i
%import Message.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum IGESData_DefList {
	IGESData_DefNone = 0,
	IGESData_DefOne = 1,
	IGESData_DefSeveral = 2,
	IGESData_ErrorOne = 3,
	IGESData_ErrorSeveral = 4,
};

enum IGESData_DefType {
	IGESData_DefVoid = 0,
	IGESData_DefValue = 1,
	IGESData_DefReference = 2,
	IGESData_DefAny = 3,
	IGESData_ErrorVal = 4,
	IGESData_ErrorRef = 5,
};

enum IGESData_ReadStage {
	IGESData_ReadDir = 0,
	IGESData_ReadOwn = 1,
	IGESData_ReadAssocs = 2,
	IGESData_ReadProps = 3,
	IGESData_ReadEnd = 4,
};

enum IGESData_Status {
	IGESData_EntityOK = 0,
	IGESData_EntityError = 1,
	IGESData_ReferenceError = 2,
	IGESData_TypeError = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

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

class IGESData_Status(IntEnum):
	IGESData_EntityOK = 0
	IGESData_EntityError = 1
	IGESData_ReferenceError = 2
	IGESData_TypeError = 3
IGESData_EntityOK = IGESData_Status.IGESData_EntityOK
IGESData_EntityError = IGESData_Status.IGESData_EntityError
IGESData_ReferenceError = IGESData_Status.IGESData_ReferenceError
IGESData_TypeError = IGESData_Status.IGESData_TypeError
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
Array1ExtendIter(IGESData_DirPart)

%template(IGESData_Array1OfIGESEntity) NCollection_Array1<opencascade::handle<IGESData_IGESEntity>>;
Array1ExtendIter(opencascade::handle<IGESData_IGESEntity>)

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
		/****** IGESData::Init ******/
		/****** md5 signature: 342fdccc4643f67c269591c4b6447108 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Prepares General dynamic data used for IGESData specifically: Protocol and Modules, which treat UndefinedEntity.
") Init;
		static void Init();

		/****** IGESData::Protocol ******/
		/****** md5 signature: 8a9c9a99eb867595c62ccd2ff8ac3085 ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_Protocol>

Description
-----------
Returns a Protocol from IGESData (avoids to create it).
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
		/****** IGESData_BasicEditor::IGESData_BasicEditor ******/
		/****** md5 signature: 327fd70db3e704a104f04e824b44586e ******/
		%feature("compactdefaultargs") IGESData_BasicEditor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty Basic Editor which should be initialized via Init() method.
") IGESData_BasicEditor;
		 IGESData_BasicEditor();

		/****** IGESData_BasicEditor::IGESData_BasicEditor ******/
		/****** md5 signature: cbabbfbad46474af21b1e08250607152 ******/
		%feature("compactdefaultargs") IGESData_BasicEditor;
		%feature("autodoc", "
Parameters
----------
protocol: IGESData_Protocol

Return
-------
None

Description
-----------
Creates a Basic Editor, with a new IGESModel, ready to run.
") IGESData_BasicEditor;
		 IGESData_BasicEditor(const opencascade::handle<IGESData_Protocol> & protocol);

		/****** IGESData_BasicEditor::IGESData_BasicEditor ******/
		/****** md5 signature: 6a3ffbe282aef9f8d02ee27afb7a6345 ******/
		%feature("compactdefaultargs") IGESData_BasicEditor;
		%feature("autodoc", "
Parameters
----------
model: IGESData_IGESModel
protocol: IGESData_Protocol

Return
-------
None

Description
-----------
Creates a Basic Editor for IGES Data, ready to run.
") IGESData_BasicEditor;
		 IGESData_BasicEditor(const opencascade::handle<IGESData_IGESModel> & model, const opencascade::handle<IGESData_Protocol> & protocol);

		/****** IGESData_BasicEditor::ApplyUnit ******/
		/****** md5 signature: 8fe231964ac1b98c4fad899bda384896 ******/
		%feature("compactdefaultargs") ApplyUnit;
		%feature("autodoc", "
Parameters
----------
enforce: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Applies unit value to convert header data: Resolution, MaxCoord, MaxLineWeight Applies unit only once after SetUnit... has been called, if <enforce> is given as True. It can be called just before writing the model to a file, i.e. when definitive values are finally known.
") ApplyUnit;
		void ApplyUnit(const Standard_Boolean enforce = Standard_False);

		/****** IGESData_BasicEditor::AutoCorrect ******/
		/****** md5 signature: ddc81d34506a37c11b7cd4d98642359a ******/
		%feature("compactdefaultargs") AutoCorrect;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Performs auto-correction on an IGESEntity Returns True if something has changed, False if nothing done. //! Works with the specific IGES Services: DirChecker which allows to correct data in 'Directory Part' of Entities (such as required values for status, or references to be null), and the specific IGES service OwnCorrect, which is specialised for each type of entity.
") AutoCorrect;
		Standard_Boolean AutoCorrect(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_BasicEditor::AutoCorrectModel ******/
		/****** md5 signature: fe46979c4f008825d0446287edc6ede7 ******/
		%feature("compactdefaultargs") AutoCorrectModel;
		%feature("autodoc", "Return
-------
int

Description
-----------
Performs auto-correction on the whole Model Returns the count of modified entities.
") AutoCorrectModel;
		Standard_Integer AutoCorrectModel();

		/****** IGESData_BasicEditor::ComputeStatus ******/
		/****** md5 signature: 94562276d7c280fff250ec7d0fc92e38 ******/
		%feature("compactdefaultargs") ComputeStatus;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs the re-computation of status on the whole model (Subordinate Status and Use Flag of each IGES Entity), which can have required values according the way they are referenced (see definitions of Logical use, Physical use, etc...).
") ComputeStatus;
		void ComputeStatus();

		/****** IGESData_BasicEditor::DraftingMax ******/
		/****** md5 signature: f35c54843eec6e8da4952db2c47da562 ******/
		%feature("compactdefaultargs") DraftingMax;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum allowed value for Drafting Flag.
") DraftingMax;
		static Standard_Integer DraftingMax();

		/****** IGESData_BasicEditor::DraftingName ******/
		/****** md5 signature: 7da09edb2042516a3d00c5651aac3cb9 ******/
		%feature("compactdefaultargs") DraftingName;
		%feature("autodoc", "
Parameters
----------
flag: int

Return
-------
str

Description
-----------
From the flag of drafting standard, returns name, '' if incorrect.
") DraftingName;
		static Standard_CString DraftingName(const Standard_Integer flag);

		/****** IGESData_BasicEditor::GetFlagByValue ******/
		/****** md5 signature: 1fbf7be16f7e6c0af91267909c4970a8 ******/
		%feature("compactdefaultargs") GetFlagByValue;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
int

Description
-----------
Returns Flag corresponding to the scaling theValue. Returns 0 if there's no such flag.
") GetFlagByValue;
		static Standard_Integer GetFlagByValue(const Standard_Real theValue);

		/****** IGESData_BasicEditor::IGESVersionMax ******/
		/****** md5 signature: 019f789bb05d370b5b7bd697923db3e3 ******/
		%feature("compactdefaultargs") IGESVersionMax;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum allowed value for IGESVersion Flag.
") IGESVersionMax;
		static Standard_Integer IGESVersionMax();

		/****** IGESData_BasicEditor::IGESVersionName ******/
		/****** md5 signature: 6707df18996b6c7800bb7770cd0d9e60 ******/
		%feature("compactdefaultargs") IGESVersionName;
		%feature("autodoc", "
Parameters
----------
flag: int

Return
-------
str

Description
-----------
From the flag of IGES version, returns name, '' if incorrect.
") IGESVersionName;
		static Standard_CString IGESVersionName(const Standard_Integer flag);

		/****** IGESData_BasicEditor::Init ******/
		/****** md5 signature: 97f796e95dfea5372a999aeb34b6facb ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
protocol: IGESData_Protocol

Return
-------
None

Description
-----------
Initialize a Basic Editor, with a new IGESModel, ready to run.
") Init;
		void Init(const opencascade::handle<IGESData_Protocol> & protocol);

		/****** IGESData_BasicEditor::Init ******/
		/****** md5 signature: 0ec823f6aae24ecd06ffcd5db568ee3b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
model: IGESData_IGESModel
protocol: IGESData_Protocol

Return
-------
None

Description
-----------
Initialize a Basic Editor for IGES Data, ready to run.
") Init;
		void Init(const opencascade::handle<IGESData_IGESModel> & model, const opencascade::handle<IGESData_Protocol> & protocol);

		/****** IGESData_BasicEditor::Model ******/
		/****** md5 signature: 4b3130e3b28afba6f0c58ab4875c4253 ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_IGESModel>

Description
-----------
Returns the designated model.
") Model;
		opencascade::handle<IGESData_IGESModel> Model();

		/****** IGESData_BasicEditor::SetUnitFlag ******/
		/****** md5 signature: 4666c28aaeb01c53577f0d10abec466c ******/
		%feature("compactdefaultargs") SetUnitFlag;
		%feature("autodoc", "
Parameters
----------
flag: int

Return
-------
bool

Description
-----------
Sets a new unit from its flag (param 14 of Global Section) Returns True if done, False if <flag> is incorrect.
") SetUnitFlag;
		Standard_Boolean SetUnitFlag(const Standard_Integer flag);

		/****** IGESData_BasicEditor::SetUnitName ******/
		/****** md5 signature: 883d858a01f10271707c017537c8f9e0 ******/
		%feature("compactdefaultargs") SetUnitName;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Sets a new unit from its name (param 15 of Global Section) Returns True if done, False if <name> is incorrect Remark: if <flag> has been set to 3 (user defined), <name> is then free.
") SetUnitName;
		Standard_Boolean SetUnitName(Standard_CString name);

		/****** IGESData_BasicEditor::SetUnitValue ******/
		/****** md5 signature: 4bccc95d28117974dc630c9e1c105787 ******/
		%feature("compactdefaultargs") SetUnitValue;
		%feature("autodoc", "
Parameters
----------
val: float

Return
-------
bool

Description
-----------
Sets a new unit from its value in meters (rounded to the closest one, max gap 1%) Returns True if done, False if <val> is too far from a suitable value.
") SetUnitValue;
		Standard_Boolean SetUnitValue(const Standard_Real val);

		/****** IGESData_BasicEditor::UnitFlagName ******/
		/****** md5 signature: f037d925469445a27c723e8210ab23f7 ******/
		%feature("compactdefaultargs") UnitFlagName;
		%feature("autodoc", "
Parameters
----------
flag: int

Return
-------
str

Description
-----------
From the flag of unit, determines its name, '' if incorrect.
") UnitFlagName;
		static Standard_CString UnitFlagName(const Standard_Integer flag);

		/****** IGESData_BasicEditor::UnitFlagValue ******/
		/****** md5 signature: b4467742c6222d78be1cf6dd2ed0ead4 ******/
		%feature("compactdefaultargs") UnitFlagValue;
		%feature("autodoc", "
Parameters
----------
flag: int

Return
-------
float

Description
-----------
From the flag of unit, determines value in MM, 0 if incorrect.
") UnitFlagValue;
		static Standard_Real UnitFlagValue(const Standard_Integer flag);

		/****** IGESData_BasicEditor::UnitNameFlag ******/
		/****** md5 signature: 8b4c418e38975e78606ce25137dbbc7a ******/
		%feature("compactdefaultargs") UnitNameFlag;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
int

Description
-----------
From the name of unit, computes flag number, 0 if incorrect (in this case, user defined entity remains possible).
") UnitNameFlag;
		static Standard_Integer UnitNameFlag(Standard_CString name);

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
		/****** IGESData_DefSwitch::IGESData_DefSwitch ******/
		/****** md5 signature: d3b2a0c20411fcd2ac4b38bce2cbe41a ******/
		%feature("compactdefaultargs") IGESData_DefSwitch;
		%feature("autodoc", "Return
-------
None

Description
-----------
creates a DefSwitch as Void.
") IGESData_DefSwitch;
		 IGESData_DefSwitch();

		/****** IGESData_DefSwitch::DefType ******/
		/****** md5 signature: 94a8946e12d430118ffd983fbb99771c ******/
		%feature("compactdefaultargs") DefType;
		%feature("autodoc", "Return
-------
IGESData_DefType

Description
-----------
returns DefType status (Void,Reference,Rank).
") DefType;
		IGESData_DefType DefType();

		/****** IGESData_DefSwitch::SetRank ******/
		/****** md5 signature: 44ed77fcf7fd7933eabfca8ff08d9959 ******/
		%feature("compactdefaultargs") SetRank;
		%feature("autodoc", "
Parameters
----------
val: int

Return
-------
None

Description
-----------
sets DefSwitch to 'Rank' with a Value (in file: Integer > 0).
") SetRank;
		void SetRank(const Standard_Integer val);

		/****** IGESData_DefSwitch::SetReference ******/
		/****** md5 signature: af9ec8d5348700121a982909f4b03eb8 ******/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "Return
-------
None

Description
-----------
sets DefSwitch to 'Reference' Status (in file: Integer < 0).
") SetReference;
		void SetReference();

		/****** IGESData_DefSwitch::SetVoid ******/
		/****** md5 signature: 4dd4a6d3caec420ced25c8de0d4bb003 ******/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Return
-------
None

Description
-----------
sets DefSwitch to 'Void' status (in file: Integer = 0).
") SetVoid;
		void SetVoid();

		/****** IGESData_DefSwitch::Value ******/
		/****** md5 signature: c6d99989077b92200f0377d8b792ba0b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns Value as Integer (sensefull for a Rank).
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
		/****** IGESData_DirChecker::IGESData_DirChecker ******/
		/****** md5 signature: a60271ae4d73e74f5d182f82110ade55 ******/
		%feature("compactdefaultargs") IGESData_DirChecker;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DirChecker, with no criterium at all to be checked.
") IGESData_DirChecker;
		 IGESData_DirChecker();

		/****** IGESData_DirChecker::IGESData_DirChecker ******/
		/****** md5 signature: 5f4208006c542f7010d7e96226a02e55 ******/
		%feature("compactdefaultargs") IGESData_DirChecker;
		%feature("autodoc", "
Parameters
----------
atype: int

Return
-------
None

Description
-----------
Returns a DirChecker, with no criterium except Required Type.
") IGESData_DirChecker;
		 IGESData_DirChecker(const Standard_Integer atype);

		/****** IGESData_DirChecker::IGESData_DirChecker ******/
		/****** md5 signature: 62a3adf07791971adde9112fe96133dd ******/
		%feature("compactdefaultargs") IGESData_DirChecker;
		%feature("autodoc", "
Parameters
----------
atype: int
aform: int

Return
-------
None

Description
-----------
Returns a DirChecker, with no criterium except Required values for Type and Form numbers.
") IGESData_DirChecker;
		 IGESData_DirChecker(const Standard_Integer atype, const Standard_Integer aform);

		/****** IGESData_DirChecker::IGESData_DirChecker ******/
		/****** md5 signature: 728f4d8dba5b36b6d46e1a9639b46105 ******/
		%feature("compactdefaultargs") IGESData_DirChecker;
		%feature("autodoc", "
Parameters
----------
atype: int
aform1: int
aform2: int

Return
-------
None

Description
-----------
Returns a DirChecker, with no criterium except Required values for Type number (atype), and Required Range for Form number (which must be between aform1 and aform2 included).
") IGESData_DirChecker;
		 IGESData_DirChecker(const Standard_Integer atype, const Standard_Integer aform1, const Standard_Integer aform2);

		/****** IGESData_DirChecker::BlankStatusIgnored ******/
		/****** md5 signature: a019c00f20a6cff66cc4b0ca7ef773d4 ******/
		%feature("compactdefaultargs") BlankStatusIgnored;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets Blank Status to be ignored (should not be defined, or its value should be 0).
") BlankStatusIgnored;
		void BlankStatusIgnored();

		/****** IGESData_DirChecker::BlankStatusRequired ******/
		/****** md5 signature: 27e4ded994f1b0d164c651d44a4f46c4 ******/
		%feature("compactdefaultargs") BlankStatusRequired;
		%feature("autodoc", "
Parameters
----------
val: int

Return
-------
None

Description
-----------
Sets Blank Status to be required at a given value.
") BlankStatusRequired;
		void BlankStatusRequired(const Standard_Integer val);

		/****** IGESData_DirChecker::Check ******/
		/****** md5 signature: f4f6d84244833174e19286de6b5f3957 ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
ach: Interface_Check
ent: IGESData_IGESEntity

Return
-------
None

Description
-----------
Performs the Checks on an IGESEntity, according to the recorded criteria In addition, does minimal Checks, such as admitted range for Status, or presence of Error status in some data (Color, ...).
") Check;
		void Check(opencascade::handle<Interface_Check> & ach, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_DirChecker::CheckTypeAndForm ******/
		/****** md5 signature: 2f3208893eeb87f52c120823b4e87c08 ******/
		%feature("compactdefaultargs") CheckTypeAndForm;
		%feature("autodoc", "
Parameters
----------
ach: Interface_Check
ent: IGESData_IGESEntity

Return
-------
None

Description
-----------
Performs a Check only on Values of Type Number and Form Number This allows to do a check on an Entity not yet completely filled but of which Type and Form Number have been already set.
") CheckTypeAndForm;
		void CheckTypeAndForm(opencascade::handle<Interface_Check> & ach, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_DirChecker::Color ******/
		/****** md5 signature: be280ceff4b96fd3bfafc81982428c90 ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "
Parameters
----------
crit: IGESData_DefType

Return
-------
None

Description
-----------
Sets Color criterium If crit is DefVoid, Ignored: should not be defined If crit is DefAny, Required: must be defined (value or ref) Other values are not taken in account.
") Color;
		void Color(const IGESData_DefType crit);

		/****** IGESData_DirChecker::Correct ******/
		/****** md5 signature: 9d2c2c88b925135509e528153f6a1f2c ******/
		%feature("compactdefaultargs") Correct;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Corrects the Directory Entry of an IGES Entity as far as it is possible according recorded criteria without any ambiguity: - if a numeric Status is required a given value, this value is enforced - if an item is required to be Void, or if it recorded as Erroneous, it is cleared (set to Void) - Type Number is enforced - finally Form Number is enforced only if one and only Value is admitted (no range, see Constructors of DirChecker).
") Correct;
		Standard_Boolean Correct(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_DirChecker::GraphicsIgnored ******/
		/****** md5 signature: 3b3f9c739a6271439c6dd678e0cb88ba ******/
		%feature("compactdefaultargs") GraphicsIgnored;
		%feature("autodoc", "
Parameters
----------
hierarchy: int (optional, default to -1)

Return
-------
None

Description
-----------
Sets Graphics data (LineFont, LineWeight, Color, Level, View) to be ignored according value of Hierarchy status: If hierarchy is not given, they are Ignored any way (that is, they should not be defined) If hierarchy is given, Graphics are Ignored if the Hierarchy status has the value given in argument 'hierarchy'.
") GraphicsIgnored;
		void GraphicsIgnored(const Standard_Integer hierarchy = -1);

		/****** IGESData_DirChecker::HierarchyStatusIgnored ******/
		/****** md5 signature: ffe6880a2270c9dd8d074fd8791a361b ******/
		%feature("compactdefaultargs") HierarchyStatusIgnored;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets Hierarchy Status to be ignored (should not be defined, or its value should be 0).
") HierarchyStatusIgnored;
		void HierarchyStatusIgnored();

		/****** IGESData_DirChecker::HierarchyStatusRequired ******/
		/****** md5 signature: b449161bc1a34ebb8c2e7ba44fffc443 ******/
		%feature("compactdefaultargs") HierarchyStatusRequired;
		%feature("autodoc", "
Parameters
----------
val: int

Return
-------
None

Description
-----------
Sets Hierarchy Status to be required at a given value.
") HierarchyStatusRequired;
		void HierarchyStatusRequired(const Standard_Integer val);

		/****** IGESData_DirChecker::IsSet ******/
		/****** md5 signature: d771f80e63fcb5d314de94e557642c75 ******/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if at least one criterium has already been set Allows user to store a DirChecker (static variable) then ask if it has been set before setting it.
") IsSet;
		Standard_Boolean IsSet();

		/****** IGESData_DirChecker::LineFont ******/
		/****** md5 signature: 6e240c23b24b5b0ad0fc231dbe891a55 ******/
		%feature("compactdefaultargs") LineFont;
		%feature("autodoc", "
Parameters
----------
crit: IGESData_DefType

Return
-------
None

Description
-----------
Sets LineFont criterium If crit is DefVoid, Ignored: should not be defined If crit is DefAny, Required: must be defined (value or ref) If crit is DefValue, Required as a Value (error if Reference) Other values are not taken in account.
") LineFont;
		void LineFont(const IGESData_DefType crit);

		/****** IGESData_DirChecker::LineWeight ******/
		/****** md5 signature: 227a713e91b7c732195e3cfac29b886e ******/
		%feature("compactdefaultargs") LineWeight;
		%feature("autodoc", "
Parameters
----------
crit: IGESData_DefType

Return
-------
None

Description
-----------
Sets LineWeight criterium If crit is DefVoid, Ignored: should not be defined If crit is DefValue, Required Other values are not taken in account.
") LineWeight;
		void LineWeight(const IGESData_DefType crit);

		/****** IGESData_DirChecker::SetDefault ******/
		/****** md5 signature: 05ebac5892e016d583d5d0d47869806a ******/
		%feature("compactdefaultargs") SetDefault;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets a DirChecker with most current criteria, that is: Structure Ignored ( worths call Structure(crit = DefVoid) ).
") SetDefault;
		void SetDefault();

		/****** IGESData_DirChecker::Structure ******/
		/****** md5 signature: cee4dcc75dad3c944ce704a668eb1877 ******/
		%feature("compactdefaultargs") Structure;
		%feature("autodoc", "
Parameters
----------
crit: IGESData_DefType

Return
-------
None

Description
-----------
Sets Structure criterium. If crit is DefVoid, Ignored: should not be defined If crit is DefReference, Required: must be defined Other values are not taken in account.
") Structure;
		void Structure(const IGESData_DefType crit);

		/****** IGESData_DirChecker::SubordinateStatusIgnored ******/
		/****** md5 signature: 6450449e9d94da036c3773b7a312c88d ******/
		%feature("compactdefaultargs") SubordinateStatusIgnored;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets Subordinate Status to be ignored (should not be defined, or its value should be 0).
") SubordinateStatusIgnored;
		void SubordinateStatusIgnored();

		/****** IGESData_DirChecker::SubordinateStatusRequired ******/
		/****** md5 signature: cfd4a7eaae9a113928416e1e3a726c5b ******/
		%feature("compactdefaultargs") SubordinateStatusRequired;
		%feature("autodoc", "
Parameters
----------
val: int

Return
-------
None

Description
-----------
Sets Subordinate Status to be required at a given value.
") SubordinateStatusRequired;
		void SubordinateStatusRequired(const Standard_Integer val);

		/****** IGESData_DirChecker::UseFlagIgnored ******/
		/****** md5 signature: 270ff3aa762df881823a73edf6215bc4 ******/
		%feature("compactdefaultargs") UseFlagIgnored;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets Blank Status to be ignored (should not be defined, or its value should be 0).
") UseFlagIgnored;
		void UseFlagIgnored();

		/****** IGESData_DirChecker::UseFlagRequired ******/
		/****** md5 signature: 3f04be01d8e4d038cf5279367cf81a5e ******/
		%feature("compactdefaultargs") UseFlagRequired;
		%feature("autodoc", "
Parameters
----------
val: int

Return
-------
None

Description
-----------
Sets Blank Status to be required at a given value Give -1 to demand UseFlag not zero (but no precise value req.).
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
		/****** IGESData_DirPart::IGESData_DirPart ******/
		/****** md5 signature: aaf3cefe57d3d5a99a23b32517bc07a7 ******/
		%feature("compactdefaultargs") IGESData_DirPart;
		%feature("autodoc", "Return
-------
None

Description
-----------
creates an empty DirPart, ready to be filled by Init.
") IGESData_DirPart;
		 IGESData_DirPart();

		/****** IGESData_DirPart::Init ******/
		/****** md5 signature: 18118032f60e0e9839e44d4d6cfb5e08 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
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
res1: str
res2: str
label: str
subscript: str

Return
-------
None

Description
-----------
fills DirPart with consistent data read from file.
") Init;
		void Init(const Standard_Integer i1, const Standard_Integer i2, const Standard_Integer i3, const Standard_Integer i4, const Standard_Integer i5, const Standard_Integer i6, const Standard_Integer i7, const Standard_Integer i8, const Standard_Integer i9, const Standard_Integer i19, const Standard_Integer i11, const Standard_Integer i12, const Standard_Integer i13, const Standard_Integer i14, const Standard_Integer i15, const Standard_Integer i16, const Standard_Integer i17, Standard_CString res1, Standard_CString res2, Standard_CString label, Standard_CString subscript);

		/****** IGESData_DirPart::Type ******/
		/****** md5 signature: 69362c058d18efeaee307371b2621b00 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
IGESData_IGESType

Description
-----------
returns 'type' and 'form' info, used to recognize the entity.
") Type;
		IGESData_IGESType Type();

		/****** IGESData_DirPart::Values ******/
		/****** md5 signature: 5828e8aff87ba1d4964d2e7a1d2e2675 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
res1: str
res2: str
label: str
subscript: str

Return
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

Description
-----------
returns values recorded in DirPart (content of cstrings are modified).
") Values;
		void Values(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_CString res1, Standard_CString res2, Standard_CString label, Standard_CString subscript);

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
		/****** IGESData_FileRecognizer::Add ******/
		/****** md5 signature: c5d4df34e0346f20fd2e3d1bd4beab1d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
reco: IGESData_FileRecognizer

Return
-------
None

Description
-----------
Adds a new Recognizer to the Compound, at the end Several calls to Add work by adding in the order of calls: Hence, when Eval has failed to recognize, Evaluate will call Evaluate from the first added Recognizer if there is one, and to the second if there is still no result, and so on.
") Add;
		void Add(const opencascade::handle<IGESData_FileRecognizer> & reco);

		/****** IGESData_FileRecognizer::Evaluate ******/
		/****** md5 signature: 3237dbbb2043959d221cc2e7c8976831 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
akey: IGESData_IGESType
res: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Evaluates if recognition has a result, returns it if yes In case of success, Returns True and puts result in 'res' In case of Failure, simply Returns False Works by calling deferred method Eval, and in case of failure, looks for Added Recognizers to work.
") Evaluate;
		Standard_Boolean Evaluate(const IGESData_IGESType & akey, opencascade::handle<IGESData_IGESEntity> & res);

		/****** IGESData_FileRecognizer::Result ******/
		/****** md5 signature: 29851946acd68a530fd6e44b9d630dfb ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_IGESEntity>

Description
-----------
Returns result of last recognition (call of Evaluate).
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
		/****** IGESData_GeneralModule::CanCopy ******/
		/****** md5 signature: a5bdcf31c0ad2154c49ebf2598d091b9 ******/
		%feature("compactdefaultargs") CanCopy;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: Standard_Transient

Return
-------
bool

Description
-----------
Specific answer to the question 'is Copy properly implemented' For IGES, answer is always True.
") CanCopy;
		virtual Standard_Boolean CanCopy(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent);

		/****** IGESData_GeneralModule::CheckCase ******/
		/****** md5 signature: d232fb3d35ada68a901b85a0af289c46 ******/
		%feature("compactdefaultargs") CheckCase;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool
ach: Interface_Check

Return
-------
None

Description
-----------
Semantic Checking of an IGESEntity. Performs general Checks, which use DirChecker, then call OwnCheck which does a check specific for each type of Entity.
") CheckCase;
		void CheckCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****** IGESData_GeneralModule::CopyCase ******/
		/****** md5 signature: 13c34a46cee20a3c1fc929ba0a39372a ******/
		%feature("compactdefaultargs") CopyCase;
		%feature("autodoc", "
Parameters
----------
CN: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Return
-------
None

Description
-----------
Copy ('Deep') from <entfrom> to <entto> (same type) by using a CopyTool which provides its working Map. For IGESEntities, Copies general data (Directory Part, List of Properties) and call OwnCopyCase.
") CopyCase;
		void CopyCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****** IGESData_GeneralModule::DirChecker ******/
		/****** md5 signature: 036d653b6ace3b4648653d3a1fe6b651 ******/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: IGESData_IGESEntity

Return
-------
IGESData_DirChecker

Description
-----------
Returns a DirChecker, specific for each type of Entity (identified by its Case Number): this DirChecker defines constraints which must be respected by the DirectoryPart.
") DirChecker;
		virtual IGESData_DirChecker DirChecker(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_GeneralModule::FillSharedCase ******/
		/****** md5 signature: 7bbac4d621ea60d6990c803dbf4b2897 ******/
		%feature("compactdefaultargs") FillSharedCase;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: Standard_Transient
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
Fills the list of Entities shared by an IGESEntity <ent>, according a Case Number <CN> (formerly computed by CaseNum). Considers Properties and Directory Part, and calls OwnSharedCase (which is adapted to each Type of Entity).
") FillSharedCase;
		void FillSharedCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****** IGESData_GeneralModule::ListImpliedCase ******/
		/****** md5 signature: 2464e54633a79d3cf9363f69b8c3a04f ******/
		%feature("compactdefaultargs") ListImpliedCase;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: Standard_Transient
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
Lists the Implied References of <ent>. Here, these are the Associativities, plus the Entities defined by OwnSharedCase.
") ListImpliedCase;
		virtual void ListImpliedCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****** IGESData_GeneralModule::Name ******/
		/****** md5 signature: ac91548e6672c7a25f89869ddd43f80a ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the name of an IGES Entity (its NameValue) Can be redefined for an even more specific case ...
") Name;
		virtual opencascade::handle<TCollection_HAsciiString> Name(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares);

		/****** IGESData_GeneralModule::NewVoid ******/
		/****** md5 signature: 89da2a487df7b420c0382ae0dc5fc2c5 ******/
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
		virtual Standard_Boolean NewVoid(const Standard_Integer CN, opencascade::handle<Standard_Transient> & entto);

		/****** IGESData_GeneralModule::OwnCheckCase ******/
		/****** md5 signature: 1ee5ab0982c8715677f898fc98959231 ******/
		%feature("compactdefaultargs") OwnCheckCase;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: IGESData_IGESEntity
shares: Interface_ShareTool
ach: Interface_Check

Return
-------
None

Description
-----------
Performs Specific Semantic Check for each type of Entity.
") OwnCheckCase;
		virtual void OwnCheckCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****** IGESData_GeneralModule::OwnCopyCase ******/
		/****** md5 signature: 29f249a12dd03139f8f1bcdf3d8aa0ca ******/
		%feature("compactdefaultargs") OwnCopyCase;
		%feature("autodoc", "
Parameters
----------
CN: int
entfrom: IGESData_IGESEntity
entto: IGESData_IGESEntity
TC: Interface_CopyTool

Return
-------
None

Description
-----------
Copies parameters which are specific of each Type of Entity.
") OwnCopyCase;
		virtual void OwnCopyCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & entfrom, const opencascade::handle<IGESData_IGESEntity> & entto, Interface_CopyTool & TC);

		/****** IGESData_GeneralModule::OwnDeleteCase ******/
		/****** md5 signature: c9a6039a81d69ed5f6b6015f1199b22a ******/
		%feature("compactdefaultargs") OwnDeleteCase;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: IGESData_IGESEntity

Return
-------
None

Description
-----------
Specific preparation for delete, acts on own parameters Default does nothing, to be redefined as required.
") OwnDeleteCase;
		virtual void OwnDeleteCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_GeneralModule::OwnImpliedCase ******/
		/****** md5 signature: 75f500e35478984bd78c87787d67741c ******/
		%feature("compactdefaultargs") OwnImpliedCase;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: IGESData_IGESEntity
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
Specific list of Entities implied by a given IGESEntity <ent> (in addition to Associativities). By default, there are none, but this method can be redefined as required.
") OwnImpliedCase;
		virtual void OwnImpliedCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, Interface_EntityIterator & iter);

		/****** IGESData_GeneralModule::OwnRenewCase ******/
		/****** md5 signature: 8cfebfba742ed0ec552abe5502e486fa ******/
		%feature("compactdefaultargs") OwnRenewCase;
		%feature("autodoc", "
Parameters
----------
CN: int
entfrom: IGESData_IGESEntity
entto: IGESData_IGESEntity
TC: Interface_CopyTool

Return
-------
None

Description
-----------
Renews parameters which are specific of each Type of Entity: the provided default does nothing, but this method may be redefined as required.
") OwnRenewCase;
		virtual void OwnRenewCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & entfrom, const opencascade::handle<IGESData_IGESEntity> & entto, const Interface_CopyTool & TC);

		/****** IGESData_GeneralModule::OwnSharedCase ******/
		/****** md5 signature: af6ce2f8effa428553bfd535582299e1 ******/
		%feature("compactdefaultargs") OwnSharedCase;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: IGESData_IGESEntity
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
Lists the Entities shared by a given IGESEntity <ent>, from its specific parameters: specific for each type.
") OwnSharedCase;
		virtual void OwnSharedCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, Interface_EntityIterator & iter);

		/****** IGESData_GeneralModule::RenewImpliedCase ******/
		/****** md5 signature: faab0844f93d5fbf03d896180bb19755 ******/
		%feature("compactdefaultargs") RenewImpliedCase;
		%feature("autodoc", "
Parameters
----------
CN: int
entfrom: Standard_Transient
entto: Standard_Transient
TC: Interface_CopyTool

Return
-------
None

Description
-----------
Renewing of Implied References. For IGESEntities, Copies general data(List of Associativities) and calls OwnRenewCase.
") RenewImpliedCase;
		virtual void RenewImpliedCase(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, const Interface_CopyTool & TC);

		/****** IGESData_GeneralModule::WhenDeleteCase ******/
		/****** md5 signature: 7740f2bc1169cdd39ca3b2f12adbb0e7 ******/
		%feature("compactdefaultargs") WhenDeleteCase;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: Standard_Transient
dispatched: bool

Return
-------
None

Description
-----------
Prepares an IGES Entity for delete: works on directory part then calls OwnDeleteCase While dispatch requires to copy the entities, <dispatched> is ignored, entities are cleared in any case.
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
		/****** IGESData_GlobalNodeOfSpecificLib::IGESData_GlobalNodeOfSpecificLib ******/
		/****** md5 signature: 3dff368a8c48aab5354bfbddab7d69a5 ******/
		%feature("compactdefaultargs") IGESData_GlobalNodeOfSpecificLib;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty GlobalNode, with no Next.
") IGESData_GlobalNodeOfSpecificLib;
		 IGESData_GlobalNodeOfSpecificLib();

		/****** IGESData_GlobalNodeOfSpecificLib::Add ******/
		/****** md5 signature: 693db3fdb3fbb08ef1ebc7b22a97916a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
amodule: IGESData_SpecificModule
aprotocol: IGESData_Protocol

Return
-------
None

Description
-----------
Adds a Module bound with a Protocol to the list: does nothing if already in the list, THAT IS, Same Type (exact match) and Same State (that is, IsEqual is not required) Once added, stores its attached Protocol in correspondence.
") Add;
		void Add(const opencascade::handle<IGESData_SpecificModule> & amodule, const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****** IGESData_GlobalNodeOfSpecificLib::Module ******/
		/****** md5 signature: 94fb463336d8c4fc0b6073746099eaef ******/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_SpecificModule>

Description
-----------
Returns the Module stored in a given GlobalNode.
") Module;
		const opencascade::handle<IGESData_SpecificModule> & Module();

		/****** IGESData_GlobalNodeOfSpecificLib::Next ******/
		/****** md5 signature: c408c95351b1bbbdaa02317172980e88 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_GlobalNodeOfSpecificLib>

Description
-----------
Returns the Next GlobalNode. If none is defined, returned value is a Null Handle.
") Next;
		const opencascade::handle<IGESData_GlobalNodeOfSpecificLib> & Next();

		/****** IGESData_GlobalNodeOfSpecificLib::Protocol ******/
		/****** md5 signature: 4eb07a48dbfd452cf11a527b6ce5309c ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_Protocol>

Description
-----------
Returns the attached Protocol stored in a given GlobalNode.
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
		/****** IGESData_GlobalNodeOfWriterLib::IGESData_GlobalNodeOfWriterLib ******/
		/****** md5 signature: b292d57488bea05b311a109f89db942b ******/
		%feature("compactdefaultargs") IGESData_GlobalNodeOfWriterLib;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty GlobalNode, with no Next.
") IGESData_GlobalNodeOfWriterLib;
		 IGESData_GlobalNodeOfWriterLib();

		/****** IGESData_GlobalNodeOfWriterLib::Add ******/
		/****** md5 signature: e3394d10b010b643c32b976b7056d700 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
amodule: IGESData_ReadWriteModule
aprotocol: IGESData_Protocol

Return
-------
None

Description
-----------
Adds a Module bound with a Protocol to the list: does nothing if already in the list, THAT IS, Same Type (exact match) and Same State (that is, IsEqual is not required). Once added, stores its attached Protocol in correspondence.
") Add;
		void Add(const opencascade::handle<IGESData_ReadWriteModule> & amodule, const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****** IGESData_GlobalNodeOfWriterLib::Module ******/
		/****** md5 signature: 620617849b7007bcf8f20d0e6d505c82 ******/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_ReadWriteModule>

Description
-----------
Returns the Module stored in a given GlobalNode.
") Module;
		const opencascade::handle<IGESData_ReadWriteModule> & Module();

		/****** IGESData_GlobalNodeOfWriterLib::Next ******/
		/****** md5 signature: 3798fc440690fb3bf4904544f1ae605b ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_GlobalNodeOfWriterLib>

Description
-----------
Returns the Next GlobalNode. If none is defined, returned value is a Null Handle.
") Next;
		const opencascade::handle<IGESData_GlobalNodeOfWriterLib> & Next();

		/****** IGESData_GlobalNodeOfWriterLib::Protocol ******/
		/****** md5 signature: 4eb07a48dbfd452cf11a527b6ce5309c ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_Protocol>

Description
-----------
Returns the attached Protocol stored in a given GlobalNode.
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
		/****** IGESData_GlobalSection::IGESData_GlobalSection ******/
		/****** md5 signature: 95bf3d4cddb1b7255d78e1c6c95e51ca ******/
		%feature("compactdefaultargs") IGESData_GlobalSection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty GlobalSection, ready to be filled, Warning: No default value is provided.
") IGESData_GlobalSection;
		 IGESData_GlobalSection();

		/****** IGESData_GlobalSection::ApplicationProtocol ******/
		/****** md5 signature: 57656f47147bb56fade3a45306ceb448 ******/
		%feature("compactdefaultargs") ApplicationProtocol;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") ApplicationProtocol;
		opencascade::handle<TCollection_HAsciiString> ApplicationProtocol();

		/****** IGESData_GlobalSection::AuthorName ******/
		/****** md5 signature: 5774996511404b1d946c5809a28a4ec8 ******/
		%feature("compactdefaultargs") AuthorName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the name of the IGES file author.
") AuthorName;
		opencascade::handle<TCollection_HAsciiString> AuthorName();

		/****** IGESData_GlobalSection::CascadeUnit ******/
		/****** md5 signature: 0a04d480977f0e8fef0df000d9bf1748 ******/
		%feature("compactdefaultargs") CascadeUnit;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the system length unit.
") CascadeUnit;
		Standard_Real CascadeUnit();

		/****** IGESData_GlobalSection::CompanyName ******/
		/****** md5 signature: 0ddc26b82ac89e543b514f876f02f512 ******/
		%feature("compactdefaultargs") CompanyName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the name of the company where the IGES file was written.
") CompanyName;
		opencascade::handle<TCollection_HAsciiString> CompanyName();

		/****** IGESData_GlobalSection::CopyRefs ******/
		/****** md5 signature: 5d079cafa039a9db79df1b570ffb5a05 ******/
		%feature("compactdefaultargs") CopyRefs;
		%feature("autodoc", "Return
-------
None

Description
-----------
Copies data referenced by Handle (that is, Strings) useful to 'isolate' a GlobalSection after copy by '=' (from a Model to another Model for instance).
") CopyRefs;
		void CopyRefs();

		/****** IGESData_GlobalSection::Date ******/
		/****** md5 signature: 09f606ad7bd37b4144d6194486109a4e ******/
		%feature("compactdefaultargs") Date;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the IGES file creation date.
") Date;
		opencascade::handle<TCollection_HAsciiString> Date();

		/****** IGESData_GlobalSection::DraftingStandard ******/
		/****** md5 signature: 2eaebc14c53be4e580dd6ae1343af802 ******/
		%feature("compactdefaultargs") DraftingStandard;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") DraftingStandard;
		Standard_Integer DraftingStandard();

		/****** IGESData_GlobalSection::EndMark ******/
		/****** md5 signature: 825aed0615f08fe50add623a0983b198 ******/
		%feature("compactdefaultargs") EndMark;
		%feature("autodoc", "Return
-------
Standard_Character

Description
-----------
Returns the record delimiter character.
") EndMark;
		Standard_Character EndMark();

		/****** IGESData_GlobalSection::FileName ******/
		/****** md5 signature: 57c69ea52795b11d2fa287b066777f7d ******/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the name of the IGES file.
") FileName;
		opencascade::handle<TCollection_HAsciiString> FileName();

		/****** IGESData_GlobalSection::HasApplicationProtocol ******/
		/****** md5 signature: cfd29c6043185cacffebd2205d9d7bda ******/
		%feature("compactdefaultargs") HasApplicationProtocol;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasApplicationProtocol;
		Standard_Boolean HasApplicationProtocol();

		/****** IGESData_GlobalSection::HasLastChangeDate ******/
		/****** md5 signature: f46c048fd0c3edfddb44c95266f02288 ******/
		%feature("compactdefaultargs") HasLastChangeDate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the date and time when the model was created or last modified are specified, i.e. not defaulted to NULL.
") HasLastChangeDate;
		Standard_Boolean HasLastChangeDate();

		/****** IGESData_GlobalSection::HasMaxCoord ******/
		/****** md5 signature: 76380c70ec5dd12901d275d3d79b7561 ******/
		%feature("compactdefaultargs") HasMaxCoord;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the approximate maximum coordinate value found in the model is greater than 0.
") HasMaxCoord;
		Standard_Boolean HasMaxCoord();

		/****** IGESData_GlobalSection::IGESVersion ******/
		/****** md5 signature: 7be43be14b3625c1c9d54d0fadc22fc2 ******/
		%feature("compactdefaultargs") IGESVersion;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the IGES version that the IGES file was written in.
") IGESVersion;
		Standard_Integer IGESVersion();

		/****** IGESData_GlobalSection::Init ******/
		/****** md5 signature: ed763441a63969eb5172d560669ca3e5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
params: Interface_ParamSet
ach: Interface_Check

Return
-------
None

Description
-----------
Fills GlobalSection from a ParamSet (i.e. taken from file) undefined parameters do not change default values when defined Fills Check about Corrections or Fails.
") Init;
		void Init(const opencascade::handle<Interface_ParamSet> & params, opencascade::handle<Interface_Check> & ach);

		/****** IGESData_GlobalSection::IntegerBits ******/
		/****** md5 signature: 1ba9b7a80f42a3cceda8900aa483c4a1 ******/
		%feature("compactdefaultargs") IntegerBits;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of binary bits for integer representations.
") IntegerBits;
		Standard_Integer IntegerBits();

		/****** IGESData_GlobalSection::InterfaceVersion ******/
		/****** md5 signature: ba796e5b26357dbaf114285a3e7aa830 ******/
		%feature("compactdefaultargs") InterfaceVersion;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the name of the pre-processor used to write the IGES file.
") InterfaceVersion;
		opencascade::handle<TCollection_HAsciiString> InterfaceVersion();

		/****** IGESData_GlobalSection::LastChangeDate ******/
		/****** md5 signature: bbffe66a1437053dbda722f9ba1a2a02 ******/
		%feature("compactdefaultargs") LastChangeDate;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the date and time when the model was created or last modified (for IGES 5.1 and later).
") LastChangeDate;
		opencascade::handle<TCollection_HAsciiString> LastChangeDate();

		/****** IGESData_GlobalSection::LineWeightGrad ******/
		/****** md5 signature: b89fae1eee517e85d24d795602389c1c ******/
		%feature("compactdefaultargs") LineWeightGrad;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum number of line weight gradations.
") LineWeightGrad;
		Standard_Integer LineWeightGrad();

		/****** IGESData_GlobalSection::MaxCoord ******/
		/****** md5 signature: 2a3013b177b0fb471e94fdad5e4d7641 ******/
		%feature("compactdefaultargs") MaxCoord;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the approximate maximum coordinate value found in the model.
") MaxCoord;
		Standard_Real MaxCoord();

		/****** IGESData_GlobalSection::MaxDigitsDouble ******/
		/****** md5 signature: ece0ba11aa0ccbc3247fa2882f24f813 ******/
		%feature("compactdefaultargs") MaxDigitsDouble;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") MaxDigitsDouble;
		Standard_Integer MaxDigitsDouble();

		/****** IGESData_GlobalSection::MaxDigitsSingle ******/
		/****** md5 signature: 6ae72eb1dad89328f033ed9b7774a200 ******/
		%feature("compactdefaultargs") MaxDigitsSingle;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") MaxDigitsSingle;
		Standard_Integer MaxDigitsSingle();

		/****** IGESData_GlobalSection::MaxLineWeight ******/
		/****** md5 signature: ff3bad41c4483abeecb982032362bc67 ******/
		%feature("compactdefaultargs") MaxLineWeight;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the of maximum line weight width in IGES file units.
") MaxLineWeight;
		Standard_Real MaxLineWeight();

		/****** IGESData_GlobalSection::MaxMaxCoord ******/
		/****** md5 signature: b623699c1df21e5e1cabdb5a0b4fc45a ******/
		%feature("compactdefaultargs") MaxMaxCoord;
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
") MaxMaxCoord;
		void MaxMaxCoord(const Standard_Real val = 0.0);

		/****** IGESData_GlobalSection::MaxMaxCoords ******/
		/****** md5 signature: 405ae2f04167559da5553089a934b14a ******/
		%feature("compactdefaultargs") MaxMaxCoords;
		%feature("autodoc", "
Parameters
----------
xyz: gp_XYZ

Return
-------
None

Description
-----------
No available documentation.
") MaxMaxCoords;
		void MaxMaxCoords(const gp_XYZ & xyz);

		/****** IGESData_GlobalSection::MaxPower10Double ******/
		/****** md5 signature: 13bcc9b315d110be21bd26ebc83adf54 ******/
		%feature("compactdefaultargs") MaxPower10Double;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum power of a decimal representation of a double-precision floating point number in the sending system.
") MaxPower10Double;
		Standard_Integer MaxPower10Double();

		/****** IGESData_GlobalSection::MaxPower10Single ******/
		/****** md5 signature: e96efe3988ebf92263ddbf4c3dc4b2d7 ******/
		%feature("compactdefaultargs") MaxPower10Single;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum power of a decimal representation of a single-precision floating point number in the sending system.
") MaxPower10Single;
		Standard_Integer MaxPower10Single();

		/****** IGESData_GlobalSection::NewDateString ******/
		/****** md5 signature: 3ecccd135edc3c62282f5e8172ce92c7 ******/
		%feature("compactdefaultargs") NewDateString;
		%feature("autodoc", "
Parameters
----------
year: int
month: int
day: int
hour: int
minut: int
second: int
mode: int (optional, default to -1)

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns a string built from year, month, day, hour, minute and second values. The form of the resulting string is defined as follows: - -1: YYMMDD.HHNNSS, - 0: YYYYMMDD.HHNNSS, - 1: YYYY-MM-DD:HH-NN-SS, where: - YYYY or YY is 4 or 2 digit year, - HH is hour (00-23), - MM is month (01-12), - NN is minute (00-59) - DD is day (01-31), - SS is second (00-59).
") NewDateString;
		static opencascade::handle<TCollection_HAsciiString> NewDateString(const Standard_Integer year, const Standard_Integer month, const Standard_Integer day, const Standard_Integer hour, const Standard_Integer minut, const Standard_Integer second, const Standard_Integer mode = -1);

		/****** IGESData_GlobalSection::NewDateString ******/
		/****** md5 signature: 5540b77516c3a70ce33562e8b5135518 ******/
		%feature("compactdefaultargs") NewDateString;
		%feature("autodoc", "
Parameters
----------
date: TCollection_HAsciiString
mode: int (optional, default to 1)

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Converts the string given in the form YYMMDD.HHNNSS or YYYYMMDD.HHNNSS to either YYMMDD.HHNNSS, YYYYMMDD.HHNNSS or YYYY-MM-DD:HH-NN-SS.
") NewDateString;
		static opencascade::handle<TCollection_HAsciiString> NewDateString(const opencascade::handle<TCollection_HAsciiString> & date, const Standard_Integer mode = 1);

		/****** IGESData_GlobalSection::Params ******/
		/****** md5 signature: c72a45a91254d4d8bb9687c8c3ff1040 ******/
		%feature("compactdefaultargs") Params;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_ParamSet>

Description
-----------
Returns all contained data in the form of a ParamSet Remark: Strings are given under Hollerith form.
") Params;
		opencascade::handle<Interface_ParamSet> Params();

		/****** IGESData_GlobalSection::ReceiveName ******/
		/****** md5 signature: c599e725c14998751fa2d2c740337669 ******/
		%feature("compactdefaultargs") ReceiveName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the name of the receiving system.
") ReceiveName;
		opencascade::handle<TCollection_HAsciiString> ReceiveName();

		/****** IGESData_GlobalSection::Resolution ******/
		/****** md5 signature: 4e5f84c856f59723b6a6d12fbb356538 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the resolution used in the IGES file.
") Resolution;
		Standard_Real Resolution();

		/****** IGESData_GlobalSection::Scale ******/
		/****** md5 signature: 4c0fd48707c01e5a42b2a639ca08da30 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the scale used in the IGES file.
") Scale;
		Standard_Real Scale();

		/****** IGESData_GlobalSection::SendName ******/
		/****** md5 signature: 52ad059fcd416f2eb44a71aeaec2b28c ******/
		%feature("compactdefaultargs") SendName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the name of the sending system.
") SendName;
		opencascade::handle<TCollection_HAsciiString> SendName();

		/****** IGESData_GlobalSection::Separator ******/
		/****** md5 signature: df98896b790fc76bded6cd92dc90ea1b ******/
		%feature("compactdefaultargs") Separator;
		%feature("autodoc", "Return
-------
Standard_Character

Description
-----------
Returns the parameter delimiter character.
") Separator;
		Standard_Character Separator();

		/****** IGESData_GlobalSection::SetApplicationProtocol ******/
		/****** md5 signature: df647e7bb63094648939c9d6d824c516 ******/
		%feature("compactdefaultargs") SetApplicationProtocol;
		%feature("autodoc", "
Parameters
----------
val: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetApplicationProtocol;
		void SetApplicationProtocol(const opencascade::handle<TCollection_HAsciiString> & val);

		/****** IGESData_GlobalSection::SetAuthorName ******/
		/****** md5 signature: 9ef66294fc6d0d16408e717190c2cc87 ******/
		%feature("compactdefaultargs") SetAuthorName;
		%feature("autodoc", "
Parameters
----------
val: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetAuthorName;
		void SetAuthorName(const opencascade::handle<TCollection_HAsciiString> & val);

		/****** IGESData_GlobalSection::SetCascadeUnit ******/
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
No available documentation.
") SetCascadeUnit;
		void SetCascadeUnit(const Standard_Real theUnit);

		/****** IGESData_GlobalSection::SetCompanyName ******/
		/****** md5 signature: 5dc4f10cc8e8c06b69f5aa1316e288f8 ******/
		%feature("compactdefaultargs") SetCompanyName;
		%feature("autodoc", "
Parameters
----------
val: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetCompanyName;
		void SetCompanyName(const opencascade::handle<TCollection_HAsciiString> & val);

		/****** IGESData_GlobalSection::SetDate ******/
		/****** md5 signature: 7684088d468c250a961b63ac61ac76ca ******/
		%feature("compactdefaultargs") SetDate;
		%feature("autodoc", "
Parameters
----------
val: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDate;
		void SetDate(const opencascade::handle<TCollection_HAsciiString> & val);

		/****** IGESData_GlobalSection::SetDraftingStandard ******/
		/****** md5 signature: 7bbb2699bea3a1f68905118277443da0 ******/
		%feature("compactdefaultargs") SetDraftingStandard;
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
") SetDraftingStandard;
		void SetDraftingStandard(const Standard_Integer val);

		/****** IGESData_GlobalSection::SetEndMark ******/
		/****** md5 signature: 0498a960afd8e09430103358b2acdb1c ******/
		%feature("compactdefaultargs") SetEndMark;
		%feature("autodoc", "
Parameters
----------
val: Standard_Character

Return
-------
None

Description
-----------
No available documentation.
") SetEndMark;
		void SetEndMark(const Standard_Character val);

		/****** IGESData_GlobalSection::SetFileName ******/
		/****** md5 signature: 5d6e767794c3f7492973d5d7ce4059ee ******/
		%feature("compactdefaultargs") SetFileName;
		%feature("autodoc", "
Parameters
----------
val: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetFileName;
		void SetFileName(const opencascade::handle<TCollection_HAsciiString> & val);

		/****** IGESData_GlobalSection::SetIGESVersion ******/
		/****** md5 signature: cfa3ebeb37cf2ce0f743e502181849fb ******/
		%feature("compactdefaultargs") SetIGESVersion;
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
") SetIGESVersion;
		void SetIGESVersion(const Standard_Integer val);

		/****** IGESData_GlobalSection::SetIntegerBits ******/
		/****** md5 signature: 475e7a7cf1bd3b45b7753ae4aff1f81a ******/
		%feature("compactdefaultargs") SetIntegerBits;
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
") SetIntegerBits;
		void SetIntegerBits(const Standard_Integer val);

		/****** IGESData_GlobalSection::SetInterfaceVersion ******/
		/****** md5 signature: 21ff81f9707d2f4cd40d4a7d0dd8905f ******/
		%feature("compactdefaultargs") SetInterfaceVersion;
		%feature("autodoc", "
Parameters
----------
val: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetInterfaceVersion;
		void SetInterfaceVersion(const opencascade::handle<TCollection_HAsciiString> & val);

		/****** IGESData_GlobalSection::SetLastChangeDate ******/
		/****** md5 signature: a6aecd5fe8ebc5691a3c2c56142913bc ******/
		%feature("compactdefaultargs") SetLastChangeDate;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SetLastChangeDate;
		void SetLastChangeDate();

		/****** IGESData_GlobalSection::SetLastChangeDate ******/
		/****** md5 signature: d5bb43c890a4b669a4f8fd9274e768bc ******/
		%feature("compactdefaultargs") SetLastChangeDate;
		%feature("autodoc", "
Parameters
----------
val: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetLastChangeDate;
		void SetLastChangeDate(const opencascade::handle<TCollection_HAsciiString> & val);

		/****** IGESData_GlobalSection::SetLineWeightGrad ******/
		/****** md5 signature: f3ac2940391df0a10217f2be70df803e ******/
		%feature("compactdefaultargs") SetLineWeightGrad;
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
") SetLineWeightGrad;
		void SetLineWeightGrad(const Standard_Integer val);

		/****** IGESData_GlobalSection::SetMaxCoord ******/
		/****** md5 signature: 869d8f71f11df82aaa8d7812f65425ca ******/
		%feature("compactdefaultargs") SetMaxCoord;
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
") SetMaxCoord;
		void SetMaxCoord(const Standard_Real val = 0.0);

		/****** IGESData_GlobalSection::SetMaxDigitsDouble ******/
		/****** md5 signature: 02f2baf854f4f12a6202f1742067f64e ******/
		%feature("compactdefaultargs") SetMaxDigitsDouble;
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
") SetMaxDigitsDouble;
		void SetMaxDigitsDouble(const Standard_Integer val);

		/****** IGESData_GlobalSection::SetMaxDigitsSingle ******/
		/****** md5 signature: 873e0772722e5b2095e0b58a2f28018f ******/
		%feature("compactdefaultargs") SetMaxDigitsSingle;
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
") SetMaxDigitsSingle;
		void SetMaxDigitsSingle(const Standard_Integer val);

		/****** IGESData_GlobalSection::SetMaxLineWeight ******/
		/****** md5 signature: 0c28dfccef5ca733dafcc2dfcaa7c2b9 ******/
		%feature("compactdefaultargs") SetMaxLineWeight;
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
") SetMaxLineWeight;
		void SetMaxLineWeight(const Standard_Real val);

		/****** IGESData_GlobalSection::SetMaxPower10Double ******/
		/****** md5 signature: d2c84d6f881b70f34544d97d4e762b70 ******/
		%feature("compactdefaultargs") SetMaxPower10Double;
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
") SetMaxPower10Double;
		void SetMaxPower10Double(const Standard_Integer val);

		/****** IGESData_GlobalSection::SetMaxPower10Single ******/
		/****** md5 signature: c10f1c24315e97dc712d31a20682013a ******/
		%feature("compactdefaultargs") SetMaxPower10Single;
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
") SetMaxPower10Single;
		void SetMaxPower10Single(const Standard_Integer val);

		/****** IGESData_GlobalSection::SetReceiveName ******/
		/****** md5 signature: a6cfc808584218fd2ba6aa69773aca18 ******/
		%feature("compactdefaultargs") SetReceiveName;
		%feature("autodoc", "
Parameters
----------
val: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetReceiveName;
		void SetReceiveName(const opencascade::handle<TCollection_HAsciiString> & val);

		/****** IGESData_GlobalSection::SetResolution ******/
		/****** md5 signature: f960e701377b9a53f863173be9785852 ******/
		%feature("compactdefaultargs") SetResolution;
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
") SetResolution;
		void SetResolution(const Standard_Real val);

		/****** IGESData_GlobalSection::SetScale ******/
		/****** md5 signature: 4c0ffeeb09801d32a2366f53c2193e30 ******/
		%feature("compactdefaultargs") SetScale;
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
") SetScale;
		void SetScale(const Standard_Real val);

		/****** IGESData_GlobalSection::SetSendName ******/
		/****** md5 signature: a738f63f7016df17effbedb291851702 ******/
		%feature("compactdefaultargs") SetSendName;
		%feature("autodoc", "
Parameters
----------
val: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetSendName;
		void SetSendName(const opencascade::handle<TCollection_HAsciiString> & val);

		/****** IGESData_GlobalSection::SetSeparator ******/
		/****** md5 signature: 25ddf0202bcd0473594edac03a820948 ******/
		%feature("compactdefaultargs") SetSeparator;
		%feature("autodoc", "
Parameters
----------
val: Standard_Character

Return
-------
None

Description
-----------
No available documentation.
") SetSeparator;
		void SetSeparator(const Standard_Character val);

		/****** IGESData_GlobalSection::SetSystemId ******/
		/****** md5 signature: e662f6c5c9fb230f9c1b2d57f3180f49 ******/
		%feature("compactdefaultargs") SetSystemId;
		%feature("autodoc", "
Parameters
----------
val: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetSystemId;
		void SetSystemId(const opencascade::handle<TCollection_HAsciiString> & val);

		/****** IGESData_GlobalSection::SetUnitFlag ******/
		/****** md5 signature: 663f9f6ff418fe58f988b532fa70d5d0 ******/
		%feature("compactdefaultargs") SetUnitFlag;
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
") SetUnitFlag;
		void SetUnitFlag(const Standard_Integer val);

		/****** IGESData_GlobalSection::SetUnitName ******/
		/****** md5 signature: 30c7109168312dd17229e70ab46f25d0 ******/
		%feature("compactdefaultargs") SetUnitName;
		%feature("autodoc", "
Parameters
----------
val: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetUnitName;
		void SetUnitName(const opencascade::handle<TCollection_HAsciiString> & val);

		/****** IGESData_GlobalSection::SystemId ******/
		/****** md5 signature: 919690a2c6fee9770148fde20ca72429 ******/
		%feature("compactdefaultargs") SystemId;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the Native System ID of the system that created the IGES file.
") SystemId;
		opencascade::handle<TCollection_HAsciiString> SystemId();

		/****** IGESData_GlobalSection::TranslatedFromHollerith ******/
		/****** md5 signature: da665df528b6e6e78a48f28441714df9 ******/
		%feature("compactdefaultargs") TranslatedFromHollerith;
		%feature("autodoc", "
Parameters
----------
astr: TCollection_HAsciiString

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns a string withpout its Hollerith marks (nnnH ahead). Remark: all strings stored in GlobalSection are expurged from Hollerith information (without nnnH) If <astr> is not Hollerith form, it is simply copied.
") TranslatedFromHollerith;
		opencascade::handle<TCollection_HAsciiString> TranslatedFromHollerith(const opencascade::handle<TCollection_HAsciiString> & astr);

		/****** IGESData_GlobalSection::UnitFlag ******/
		/****** md5 signature: 54ab2931996d2ea32441ec6724afb20d ******/
		%feature("compactdefaultargs") UnitFlag;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the unit flag that was used to write the IGES file.
") UnitFlag;
		Standard_Integer UnitFlag();

		/****** IGESData_GlobalSection::UnitName ******/
		/****** md5 signature: 5719249960d4417173aef99e14273641 ******/
		%feature("compactdefaultargs") UnitName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the name of the unit the IGES file was written in.
") UnitName;
		opencascade::handle<TCollection_HAsciiString> UnitName();

		/****** IGESData_GlobalSection::UnitValue ******/
		/****** md5 signature: 44bdd78781973523a9e69dd88c24c355 ******/
		%feature("compactdefaultargs") UnitValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the unit value (in meters) that the IGES file was written in.
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
		/****** IGESData_IGESDumper::IGESData_IGESDumper ******/
		/****** md5 signature: 4b47b03aa29239a6a9260ae416b48e6c ******/
		%feature("compactdefaultargs") IGESData_IGESDumper;
		%feature("autodoc", "
Parameters
----------
model: IGESData_IGESModel
protocol: IGESData_Protocol

Return
-------
None

Description
-----------
Returns an IGESDumper ready to work. The IGESModel provides the numbering of Entities: as for any InterfaceModel, it gives each Entity a number; but for IGESEntities, the 'Number of Directory Entry' according to the definition of IGES Files, is also useful.
") IGESData_IGESDumper;
		 IGESData_IGESDumper(const opencascade::handle<IGESData_IGESModel> & model, const opencascade::handle<IGESData_Protocol> & protocol);

		/****** IGESData_IGESDumper::Dump ******/
		/****** md5 signature: c347dc756919bc04f1eac57ddbe6e2a8 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity
own: int
attached: int (optional, default to -1)

Return
-------
S: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		void Dump(const opencascade::handle<IGESData_IGESEntity> & ent, std::ostream &OutValue, const Standard_Integer own, const Standard_Integer attached = -1);

		/****** IGESData_IGESDumper::OwnDump ******/
		/****** md5 signature: 3235d2f595b46c51344158ad01916bf5 ******/
		%feature("compactdefaultargs") OwnDump;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity
own: int

Return
-------
S: Standard_OStream

Description
-----------
Specific Dump for each IGES Entity, call by Dump (just above) <own> is the parameter <own> from Dump.
") OwnDump;
		void OwnDump(const opencascade::handle<IGESData_IGESEntity> & ent, std::ostream &OutValue, const Standard_Integer own);

		/****** IGESData_IGESDumper::PrintDNum ******/
		/****** md5 signature: 843ade9a40f705735dc483822de7ae21 ******/
		%feature("compactdefaultargs") PrintDNum;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
S: Standard_OStream

Description
-----------
Prints onto an output, the 'Number of Directory Entry' which corresponds to an IGESEntity in the IGESModel, under the form 'D#nnn' (a Null Handle gives D#0).
") PrintDNum;
		void PrintDNum(const opencascade::handle<IGESData_IGESEntity> & ent, std::ostream &OutValue);

		/****** IGESData_IGESDumper::PrintShort ******/
		/****** md5 signature: 70b65854c8626a1ea0446479ed6c8a1a ******/
		%feature("compactdefaultargs") PrintShort;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
S: Standard_OStream

Description
-----------
Prints onto an output, the 'Number of Directory Entry' (see PrintDNum) plus IGES Type and Form Numbers, which gives 'D#nnn Type nnn Form nnn'.
") PrintShort;
		void PrintShort(const opencascade::handle<IGESData_IGESEntity> & ent, std::ostream &OutValue);

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
		/****** IGESData_IGESEntity::AddProperty ******/
		/****** md5 signature: 11eb1a0a48c504214ac18ded70762762 ******/
		%feature("compactdefaultargs") AddProperty;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
None

Description
-----------
Adds a Property in the list.
") AddProperty;
		void AddProperty(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_IGESEntity::ArePresentAssociativities ******/
		/****** md5 signature: 707a417cab87284218fbd5d94abbbb41 ******/
		%feature("compactdefaultargs") ArePresentAssociativities;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the Entity is defined with an Associativity list, even empty (that is, file contains its length 0) Else, the file contained NO idencation at all about this list.
") ArePresentAssociativities;
		Standard_Boolean ArePresentAssociativities();

		/****** IGESData_IGESEntity::ArePresentProperties ******/
		/****** md5 signature: 4584fd74af287816a009d302141c768e ******/
		%feature("compactdefaultargs") ArePresentProperties;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the Entity is defined with a Property list, even empty (that is, file contains its length 0) Else, the file contained NO idencation at all about this list.
") ArePresentProperties;
		Standard_Boolean ArePresentProperties();

		/****** IGESData_IGESEntity::Associate ******/
		/****** md5 signature: 9ed5985e9a1f0bcda52be44e2252a6c0 ******/
		%feature("compactdefaultargs") Associate;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
None

Description
-----------
Sets 'me' in the Associativity list of another Entity.
") Associate;
		void Associate(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_IGESEntity::Associativities ******/
		/****** md5 signature: 6ec4d58d67480dbc21455e4edf596926 ******/
		%feature("compactdefaultargs") Associativities;
		%feature("autodoc", "Return
-------
Interface_EntityIterator

Description
-----------
Returns the Associativity List under the form of an EntityIterator.
") Associativities;
		Interface_EntityIterator Associativities();

		/****** IGESData_IGESEntity::BlankStatus ******/
		/****** md5 signature: 3c198eda99c79dd2ea0404847ca6132e ******/
		%feature("compactdefaultargs") BlankStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
gives Blank Status (0 visible, 1 blanked).
") BlankStatus;
		Standard_Integer BlankStatus();

		/****** IGESData_IGESEntity::CResValues ******/
		/****** md5 signature: 78002f1c0b06d38e9dd54430805fc2a5 ******/
		%feature("compactdefaultargs") CResValues;
		%feature("autodoc", "
Parameters
----------
res1: str
res2: str

Return
-------
bool

Description
-----------
returns 'reserved' alphanumeric values res1 and res2 res1 and res2 have to be reserved as Character[9 at least] (remark: their content is changed) returned values are ended by null character in 9th returned Boolean is False if res1 and res2 are blank, true else.
") CResValues;
		Standard_Boolean CResValues(Standard_CString res1, Standard_CString res2);

		/****** IGESData_IGESEntity::Color ******/
		/****** md5 signature: 9f059c3d16c0eb79fdf5239f02d987e7 ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_ColorEntity>

Description
-----------
Returns the IGES entity which describes the color of the entity. Returns a null handle if this entity was defined as an integer.
") Color;
		opencascade::handle<IGESData_ColorEntity> Color();

		/****** IGESData_IGESEntity::CompoundLocation ******/
		/****** md5 signature: d8f6f9c40c2c55cc1d0ff77fe46e169f ******/
		%feature("compactdefaultargs") CompoundLocation;
		%feature("autodoc", "Return
-------
gp_GTrsf

Description
-----------
Returns Location by taking in account a Parent which has its own Location: that one will be combined to that of <self> The Parent is considered only if HasOneParent is True, else it is ignored and CompoundLocation = Location.
") CompoundLocation;
		gp_GTrsf CompoundLocation();

		/****** IGESData_IGESEntity::DefColor ******/
		/****** md5 signature: d9784de5d90075aefe0a2dbe005ae1d2 ******/
		%feature("compactdefaultargs") DefColor;
		%feature("autodoc", "Return
-------
IGESData_DefType

Description
-----------
Returns the definition status of Color.
") DefColor;
		virtual IGESData_DefType DefColor();

		/****** IGESData_IGESEntity::DefLevel ******/
		/****** md5 signature: 3a684c5344b31bf8103c161b51dc33db ******/
		%feature("compactdefaultargs") DefLevel;
		%feature("autodoc", "Return
-------
IGESData_DefList

Description
-----------
Returns the definition status of Level.
") DefLevel;
		virtual IGESData_DefList DefLevel();

		/****** IGESData_IGESEntity::DefLineFont ******/
		/****** md5 signature: 381f99ba5ee5dafcb8145c35f7636e72 ******/
		%feature("compactdefaultargs") DefLineFont;
		%feature("autodoc", "Return
-------
IGESData_DefType

Description
-----------
Returns the definition status of LineFont.
") DefLineFont;
		virtual IGESData_DefType DefLineFont();

		/****** IGESData_IGESEntity::DefView ******/
		/****** md5 signature: be0c3db72aede27028777feb64c92975 ******/
		%feature("compactdefaultargs") DefView;
		%feature("autodoc", "Return
-------
IGESData_DefList

Description
-----------
Returns the definition status of the view. This can be: none, one or several.
") DefView;
		virtual IGESData_DefList DefView();

		/****** IGESData_IGESEntity::DirFieldEntity ******/
		/****** md5 signature: dd94642903c43edfbccaf93ac3d0143d ******/
		%feature("compactdefaultargs") DirFieldEntity;
		%feature("autodoc", "
Parameters
----------
fieldnum: int

Return
-------
opencascade::handle<IGESData_IGESEntity>

Description
-----------
Returns the Entity which has been recorded for a given Field Number, i.e. without any cast. Maps with: 3: Structure 4: LineFont 5: LevelList 6: View 7: Transf(ormation Matrix) 8: LabelDisplay 13: Color. Other values give a null handle It can then be of any kind, while specific items have a Type.
") DirFieldEntity;
		opencascade::handle<IGESData_IGESEntity> DirFieldEntity(const Standard_Integer fieldnum);

		/****** IGESData_IGESEntity::Dissociate ******/
		/****** md5 signature: 0c02ed30af1330200e9bd25c0645db88 ******/
		%feature("compactdefaultargs") Dissociate;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
None

Description
-----------
Resets 'me' from the Associativity list of another Entity.
") Dissociate;
		void Dissociate(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_IGESEntity::FormNumber ******/
		/****** md5 signature: 01816ab5757c400039bfeebd9b3bcbc2 ******/
		%feature("compactdefaultargs") FormNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the form number for that type of an IGES entity. The default form number is 0.
") FormNumber;
		Standard_Integer FormNumber();

		/****** IGESData_IGESEntity::HasLabelDisplay ******/
		/****** md5 signature: 9c615fbed732eecfa5155cde061accc7 ******/
		%feature("compactdefaultargs") HasLabelDisplay;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a LabelDisplay mode is defined for this entity.
") HasLabelDisplay;
		Standard_Boolean HasLabelDisplay();

		/****** IGESData_IGESEntity::HasName ******/
		/****** md5 signature: 1e1c2790637f6b21f247802eba58ce99 ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
says if a Name is defined, as Short Label or as Name Property (Property is looked first, else ShortLabel is considered).
") HasName;
		Standard_Boolean HasName();

		/****** IGESData_IGESEntity::HasOneParent ******/
		/****** md5 signature: 0db1d4c4a998e8d80fd0d6c03982cbc5 ******/
		%feature("compactdefaultargs") HasOneParent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if an entity has one and only one parent, defined by a SingleParentEntity Type Associativity (explicit sharing). Thus, implicit sharing remains defined at model level (see class ToolLocation).
") HasOneParent;
		Standard_Boolean HasOneParent();

		/****** IGESData_IGESEntity::HasShortLabel ******/
		/****** md5 signature: 1f29e2d54166d8b69975aaf0e8aae29b ******/
		%feature("compactdefaultargs") HasShortLabel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if a short label is defined. A short label is a non-blank 8-character string.
") HasShortLabel;
		Standard_Boolean HasShortLabel();

		/****** IGESData_IGESEntity::HasStructure ******/
		/****** md5 signature: 8bf587788d3a40a5c0372efe48a98a27 ******/
		%feature("compactdefaultargs") HasStructure;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if an IGESEntity is defined with a Structure (it is normally reserved for certain classes, such as Macros).
") HasStructure;
		Standard_Boolean HasStructure();

		/****** IGESData_IGESEntity::HasSubScriptNumber ******/
		/****** md5 signature: 3e229eed9a8086af64d790e1520e7d99 ******/
		%feature("compactdefaultargs") HasSubScriptNumber;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if a subscript number is defined. A subscript number is an integer used to identify a label.
") HasSubScriptNumber;
		virtual Standard_Boolean HasSubScriptNumber();

		/****** IGESData_IGESEntity::HasTransf ******/
		/****** md5 signature: a206f41ea34d912255da7ff3fcb695f7 ******/
		%feature("compactdefaultargs") HasTransf;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Transformation Matrix is defined.
") HasTransf;
		Standard_Boolean HasTransf();

		/****** IGESData_IGESEntity::HierarchyStatus ******/
		/****** md5 signature: 814091e9d5cef2cdf9e02fd374611543 ******/
		%feature("compactdefaultargs") HierarchyStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
gives Hierarchy status (0-1-2).
") HierarchyStatus;
		Standard_Integer HierarchyStatus();

		/****** IGESData_IGESEntity::IGESType ******/
		/****** md5 signature: 2f89b587c31ffcd8749f070fef4d0193 ******/
		%feature("compactdefaultargs") IGESType;
		%feature("autodoc", "Return
-------
IGESData_IGESType

Description
-----------
gives IGES typing info (includes 'Type' and 'Form' data).
") IGESType;
		IGESData_IGESType IGESType();

		/****** IGESData_IGESEntity::InitColor ******/
		/****** md5 signature: 20c3ccba0bc1486834d9f2d11347d57e ******/
		%feature("compactdefaultargs") InitColor;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_ColorEntity
rank: int (optional, default to 0)

Return
-------
None

Description
-----------
Initializes Color data: if <ent> is not Null, it gives Color, else <rank> gives or erases (if zero) RankColor.
") InitColor;
		void InitColor(const opencascade::handle<IGESData_ColorEntity> & ent, const Standard_Integer rank = 0);

		/****** IGESData_IGESEntity::InitDirFieldEntity ******/
		/****** md5 signature: 3eafe875096d0a62ce74c33f5ef34436 ******/
		%feature("compactdefaultargs") InitDirFieldEntity;
		%feature("autodoc", "
Parameters
----------
fieldnum: int
ent: IGESData_IGESEntity

Return
-------
None

Description
-----------
Initializes a directory field as an Entity of any kind See DirFieldEntity for more details.
") InitDirFieldEntity;
		void InitDirFieldEntity(const Standard_Integer fieldnum, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_IGESEntity::InitLevel ******/
		/****** md5 signature: 30789676685773818257f71dd1704061 ******/
		%feature("compactdefaultargs") InitLevel;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_LevelListEntity
val: int (optional, default to 0)

Return
-------
None

Description
-----------
Initializes Level: if <ent> is not Null, it gives LevelList, else <val> gives or erases (if zero) unique Level.
") InitLevel;
		void InitLevel(const opencascade::handle<IGESData_LevelListEntity> & ent, const Standard_Integer val = 0);

		/****** IGESData_IGESEntity::InitLineFont ******/
		/****** md5 signature: 918dd4c6a801d2cb9ba94ff6f57038f9 ******/
		%feature("compactdefaultargs") InitLineFont;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_LineFontEntity
rank: int (optional, default to 0)

Return
-------
None

Description
-----------
Initializes LineFont: if <ent> is not Null, it gives LineFont, else <rank> gives or erases (if zero) RankLineFont.
") InitLineFont;
		void InitLineFont(const opencascade::handle<IGESData_LineFontEntity> & ent, const Standard_Integer rank = 0);

		/****** IGESData_IGESEntity::InitMisc ******/
		/****** md5 signature: 7332b3a8806ccde6a9398b22ba0c24f3 ******/
		%feature("compactdefaultargs") InitMisc;
		%feature("autodoc", "
Parameters
----------
str: IGESData_IGESEntity
lab: IGESData_LabelDisplayEntity
weightnum: int

Return
-------
None

Description
-----------
Initializes various data (those not yet seen above), or erases them if they are given as Null (Zero for <weightnum>): <str> for Structure, <lab> for LabelDisplay, and <weightnum> for WeightNumber.
") InitMisc;
		void InitMisc(const opencascade::handle<IGESData_IGESEntity> & str, const opencascade::handle<IGESData_LabelDisplayEntity> & lab, const Standard_Integer weightnum);

		/****** IGESData_IGESEntity::InitStatus ******/
		/****** md5 signature: 453e9e179089c43b59f4f5f338aef1b1 ******/
		%feature("compactdefaultargs") InitStatus;
		%feature("autodoc", "
Parameters
----------
blank: int
subordinate: int
useflag: int
hierarchy: int

Return
-------
None

Description
-----------
Initializes the Status of Directory Part.
") InitStatus;
		void InitStatus(const Standard_Integer blank, const Standard_Integer subordinate, const Standard_Integer useflag, const Standard_Integer hierarchy);

		/****** IGESData_IGESEntity::InitTransf ******/
		/****** md5 signature: 15edbb5bdef6886110a77d9bc633aa93 ******/
		%feature("compactdefaultargs") InitTransf;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_TransfEntity

Return
-------
None

Description
-----------
Initializes Transf, or erases it if <ent> is given Null.
") InitTransf;
		void InitTransf(const opencascade::handle<IGESData_TransfEntity> & ent);

		/****** IGESData_IGESEntity::InitView ******/
		/****** md5 signature: 78dbab3db820934b22089e8063a77bdf ******/
		%feature("compactdefaultargs") InitView;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_ViewKindEntity

Return
-------
None

Description
-----------
Initializes View, or erases it if <ent> is given Null.
") InitView;
		void InitView(const opencascade::handle<IGESData_ViewKindEntity> & ent);

		/****** IGESData_IGESEntity::LabelDisplay ******/
		/****** md5 signature: ee2fe05c31dcb311b03fe8559cc0a8ee ******/
		%feature("compactdefaultargs") LabelDisplay;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_LabelDisplayEntity>

Description
-----------
Returns the Label Display Associativity Entity if there is one. Returns a null handle if there is none.
") LabelDisplay;
		opencascade::handle<IGESData_LabelDisplayEntity> LabelDisplay();

		/****** IGESData_IGESEntity::Level ******/
		/****** md5 signature: 06f7279e938b54c0bc4a49915192a536 ******/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the level the entity belongs to. Returns -1 if the entity belongs to more than one level.
") Level;
		Standard_Integer Level();

		/****** IGESData_IGESEntity::LevelList ******/
		/****** md5 signature: d7769fea2ddbe17721c588ed3d24340d ******/
		%feature("compactdefaultargs") LevelList;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_LevelListEntity>

Description
-----------
Returns LevelList if Level is defined as a list. Returns a null handle if DefLevel is not DefSeveral.
") LevelList;
		opencascade::handle<IGESData_LevelListEntity> LevelList();

		/****** IGESData_IGESEntity::LineFont ******/
		/****** md5 signature: 43fef7710663f7f4f96fa43adafe90a5 ******/
		%feature("compactdefaultargs") LineFont;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_LineFontEntity>

Description
-----------
Returns LineFont as an Entity (if defined as Reference) Returns a Null Handle if DefLineFont is not 'DefReference'.
") LineFont;
		opencascade::handle<IGESData_LineFontEntity> LineFont();

		/****** IGESData_IGESEntity::LineWeight ******/
		/****** md5 signature: e7feb099a03451db8a683621054e9f6f ******/
		%feature("compactdefaultargs") LineWeight;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the true Line Weight, computed from LineWeightNumber and Global Parameter in the Model by call to SetLineWeight.
") LineWeight;
		Standard_Real LineWeight();

		/****** IGESData_IGESEntity::LineWeightNumber ******/
		/****** md5 signature: 8bb9498f695e9c36332dc8bbca4498ae ******/
		%feature("compactdefaultargs") LineWeightNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the LineWeight Number (0 not defined), see also LineWeight.
") LineWeightNumber;
		Standard_Integer LineWeightNumber();

		/****** IGESData_IGESEntity::Location ******/
		/****** md5 signature: cf77359027b042b2c12141fee724bdb5 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_GTrsf

Description
-----------
Returns Location given by Transf in Directory Part (see above) It must be considered for local definition: if the Entity is set in a 'Parent', that one can add its one Location, but this is not taken in account here: see CompoundLocation for that. If no Transf is defined, returns Identity If Transf is itself compound, gives the final result.
") Location;
		gp_GTrsf Location();

		/****** IGESData_IGESEntity::NameValue ******/
		/****** md5 signature: 4203f13bdb9d22464919c0b23eb59758 ******/
		%feature("compactdefaultargs") NameValue;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
returns Name value as a String (Property Name or ShortLabel) if SubNumber is defined, it is concatenated after ShortLabel as follows label(number). Ignored with a Property Name.
") NameValue;
		opencascade::handle<TCollection_HAsciiString> NameValue();

		/****** IGESData_IGESEntity::NbAssociativities ******/
		/****** md5 signature: 76281acc8e6c4e2eec37ccc19fb31766 ******/
		%feature("compactdefaultargs") NbAssociativities;
		%feature("autodoc", "Return
-------
int

Description
-----------
gives number of recorded associativities (0 no list defined).
") NbAssociativities;
		Standard_Integer NbAssociativities();

		/****** IGESData_IGESEntity::NbProperties ******/
		/****** md5 signature: b8d59feba7ff602cf35d658f036ef723 ******/
		%feature("compactdefaultargs") NbProperties;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives number of recorded properties (0 no list defined).
") NbProperties;
		Standard_Integer NbProperties();

		/****** IGESData_IGESEntity::NbTypedAssociativities ******/
		/****** md5 signature: 5c0914c44d6265d2a6d7940389eae9f5 ******/
		%feature("compactdefaultargs") NbTypedAssociativities;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type

Return
-------
int

Description
-----------
gives how many Associativities have a given type.
") NbTypedAssociativities;
		Standard_Integer NbTypedAssociativities(const opencascade::handle<Standard_Type> & atype);

		/****** IGESData_IGESEntity::NbTypedProperties ******/
		/****** md5 signature: 4e2e5083c49f669f257791622375920d ******/
		%feature("compactdefaultargs") NbTypedProperties;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type

Return
-------
int

Description
-----------
gives how many Properties have a given type.
") NbTypedProperties;
		Standard_Integer NbTypedProperties(const opencascade::handle<Standard_Type> & atype);

		/****** IGESData_IGESEntity::Properties ******/
		/****** md5 signature: b9da45bd72180b9c10809cdc34a30e03 ******/
		%feature("compactdefaultargs") Properties;
		%feature("autodoc", "Return
-------
Interface_EntityIterator

Description
-----------
Returns Property List under the form of an EntityIterator.
") Properties;
		Interface_EntityIterator Properties();

		/****** IGESData_IGESEntity::RankColor ******/
		/****** md5 signature: 748842da901852425d0ed901d57f6955 ******/
		%feature("compactdefaultargs") RankColor;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the color definition as an integer value if the color was defined as a rank. Warning A negative value is returned if the color was defined as an entity.
") RankColor;
		Standard_Integer RankColor();

		/****** IGESData_IGESEntity::RankLineFont ******/
		/****** md5 signature: 38c961b6418a3f68e1631c9b1e7f9361 ******/
		%feature("compactdefaultargs") RankLineFont;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns LineFont definition as an Integer (if defined as Rank) If LineFont is defined as an Entity, returns a negative value.
") RankLineFont;
		Standard_Integer RankLineFont();

		/****** IGESData_IGESEntity::RemoveProperty ******/
		/****** md5 signature: 68d52b7c50f6db62ea2798d360495dcd ******/
		%feature("compactdefaultargs") RemoveProperty;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
None

Description
-----------
Removes a Property from the list.
") RemoveProperty;
		void RemoveProperty(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_IGESEntity::SetLabel ******/
		/****** md5 signature: a2b1447397f697fce5bf5e69cdbb139e ******/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "
Parameters
----------
label: TCollection_HAsciiString
sub: int (optional, default to -1)

Return
-------
None

Description
-----------
Sets a new Label to an IGES Entity If <sub> is given, it sets value of SubScriptNumber else, SubScriptNumber is erased.
") SetLabel;
		void SetLabel(const opencascade::handle<TCollection_HAsciiString> & label, const Standard_Integer sub = -1);

		/****** IGESData_IGESEntity::SetLineWeight ******/
		/****** md5 signature: 45a707b0245ae43be696ca63f51811a8 ******/
		%feature("compactdefaultargs") SetLineWeight;
		%feature("autodoc", "
Parameters
----------
defw: float
maxw: float
gradw: int

Return
-------
None

Description
-----------
computes and sets 'true' line weight according IGES rules from global data MaxLineWeight (maxv) and LineWeightGrad (gradw), or sets it to defw (Default) if LineWeightNumber is null.
") SetLineWeight;
		void SetLineWeight(const Standard_Real defw, const Standard_Real maxw, const Standard_Integer gradw);

		/****** IGESData_IGESEntity::ShortLabel ******/
		/****** md5 signature: 6f2ffdcbc6732ebfbbc06bcb397d07ab ******/
		%feature("compactdefaultargs") ShortLabel;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns the label value for this IGES entity as a string. Warning If the label is blank, this string is null.
") ShortLabel;
		opencascade::handle<TCollection_HAsciiString> ShortLabel();

		/****** IGESData_IGESEntity::SingleView ******/
		/****** md5 signature: 777ae42d6386ad3e3242612555faf2c3 ******/
		%feature("compactdefaultargs") SingleView;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_ViewKindEntity>

Description
-----------
Returns the view as a single view if it was defined as such and not as a list of views. Warning A null handle is returned if DefView does not have the value DefOne.
") SingleView;
		opencascade::handle<IGESData_ViewKindEntity> SingleView();

		/****** IGESData_IGESEntity::Structure ******/
		/****** md5 signature: 07cafc895ef77ae4ae90a963dfb9dc08 ******/
		%feature("compactdefaultargs") Structure;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_IGESEntity>

Description
-----------
Returns Structure (used by some types of IGES Entities only) Returns a Null Handle if Structure is not defined.
") Structure;
		opencascade::handle<IGESData_IGESEntity> Structure();

		/****** IGESData_IGESEntity::SubScriptNumber ******/
		/****** md5 signature: 926d708051b655f4963c2a9c9fcdfb69 ******/
		%feature("compactdefaultargs") SubScriptNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the integer subscript number used to identify this IGES entity. Warning 0 is returned if no subscript number is defined for this IGES entity.
") SubScriptNumber;
		Standard_Integer SubScriptNumber();

		/****** IGESData_IGESEntity::SubordinateStatus ******/
		/****** md5 signature: 70feec2a58cb5b617a258b2a3105db5d ******/
		%feature("compactdefaultargs") SubordinateStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
gives Subordinate Switch (0-1-2-3).
") SubordinateStatus;
		Standard_Integer SubordinateStatus();

		/****** IGESData_IGESEntity::Transf ******/
		/****** md5 signature: 342b691ddee0e9182c4cfb65faa08c4b ******/
		%feature("compactdefaultargs") Transf;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_TransfEntity>

Description
-----------
Returns the Transformation Matrix (under IGES definition) Returns a Null Handle if there is none for a more complete use, see Location & CompoundLocation.
") Transf;
		opencascade::handle<IGESData_TransfEntity> Transf();

		/****** IGESData_IGESEntity::TypeNumber ******/
		/****** md5 signature: 8bfe972f6ae89ab21183f7f2c6ffb423 ******/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
gives IGES Type Number (often coupled with Form Number).
") TypeNumber;
		Standard_Integer TypeNumber();

		/****** IGESData_IGESEntity::TypedAssociativity ******/
		/****** md5 signature: 3c01422c877e912134487113b82f007e ******/
		%feature("compactdefaultargs") TypedAssociativity;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type

Return
-------
opencascade::handle<IGESData_IGESEntity>

Description
-----------
returns the Associativity of a given Type (if only one exists) Error if none or more than one.
") TypedAssociativity;
		opencascade::handle<IGESData_IGESEntity> TypedAssociativity(const opencascade::handle<Standard_Type> & atype);

		/****** IGESData_IGESEntity::TypedProperty ******/
		/****** md5 signature: e1eb748f854a03b81a0e0e177375a310 ******/
		%feature("compactdefaultargs") TypedProperty;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type
anum: int (optional, default to 0)

Return
-------
opencascade::handle<IGESData_IGESEntity>

Description
-----------
returns the Property of a given Type Error if none or more than one.
") TypedProperty;
		opencascade::handle<IGESData_IGESEntity> TypedProperty(const opencascade::handle<Standard_Type> & atype, const Standard_Integer anum = 0);

		/****** IGESData_IGESEntity::UniqueParent ******/
		/****** md5 signature: a398586a4430ec15b850b027dd08f2e6 ******/
		%feature("compactdefaultargs") UniqueParent;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_IGESEntity>

Description
-----------
Returns the Unique Parent (in the sense given by HasOneParent) Error if there is none or several.
") UniqueParent;
		opencascade::handle<IGESData_IGESEntity> UniqueParent();

		/****** IGESData_IGESEntity::UseFlag ******/
		/****** md5 signature: 5ff6c4705401bef9792e82534561631c ******/
		%feature("compactdefaultargs") UseFlag;
		%feature("autodoc", "Return
-------
int

Description
-----------
gives Entity's Use Flag (0 to 5).
") UseFlag;
		Standard_Integer UseFlag();

		/****** IGESData_IGESEntity::VectorLocation ******/
		/****** md5 signature: 9ff63ce09420f1fb8fbceb9e2437f31e ******/
		%feature("compactdefaultargs") VectorLocation;
		%feature("autodoc", "Return
-------
gp_GTrsf

Description
-----------
Returns Location considered for Vectors, i.e. without its Translation Part. As Location, it gives local definition.
") VectorLocation;
		gp_GTrsf VectorLocation();

		/****** IGESData_IGESEntity::View ******/
		/****** md5 signature: 25b5f181ee45201916e5df752a187b0a ******/
		%feature("compactdefaultargs") View;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_ViewKindEntity>

Description
-----------
Returns the view of this IGES entity. This view can be a single view or a list of views. Warning A null handle is returned if the view is not defined.
") View;
		opencascade::handle<IGESData_ViewKindEntity> View();

		/****** IGESData_IGESEntity::ViewList ******/
		/****** md5 signature: 802ad423f0020138040b5c0ce0423dfa ******/
		%feature("compactdefaultargs") ViewList;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_ViewKindEntity>

Description
-----------
Returns the view of this IGES entity as a list. Warning A null handle is returned if the definition status does not have the value DefSeveral.
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
		/****** IGESData_IGESModel::IGESData_IGESModel ******/
		/****** md5 signature: 4a4bc58abc329f39396976972a75767b ******/
		%feature("compactdefaultargs") IGESData_IGESModel;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IGESData_IGESModel;
		 IGESData_IGESModel();

		/****** IGESData_IGESModel::AddStartLine ******/
		/****** md5 signature: b2e082dbb9611dc32a6105ad74c24e14 ******/
		%feature("compactdefaultargs") AddStartLine;
		%feature("autodoc", "
Parameters
----------
line: str
atnum: int (optional, default to 0)

Return
-------
None

Description
-----------
Adds a new string to the existing Start section at the end if atnum is 0 or not given, or before atnumth line.
") AddStartLine;
		void AddStartLine(Standard_CString line, const Standard_Integer atnum = 0);

		/****** IGESData_IGESModel::ApplyStatic ******/
		/****** md5 signature: 994a9ac1357b52e0bee3cbef68d704f1 ******/
		%feature("compactdefaultargs") ApplyStatic;
		%feature("autodoc", "
Parameters
----------
param: str (optional, default to "")

Return
-------
bool

Description
-----------
Sets some of the Global section parameters with the values defined by the translation parameters. param may be: - receiver (value read in XSTEP.iges.header.receiver), - author (value read in XSTEP.iges.header.author), - company (value read in XSTEP.iges.header.company). The default value for param is an empty string. Returns True when done and if param is given, False if param is unknown or empty. Note: Set the unit in the IGES file Global section via IGESData_BasicEditor class.
") ApplyStatic;
		Standard_Boolean ApplyStatic(Standard_CString param = "");

		/****** IGESData_IGESModel::ChangeGlobalSection ******/
		/****** md5 signature: 040968795059a2599255a0b8e187d384 ******/
		%feature("compactdefaultargs") ChangeGlobalSection;
		%feature("autodoc", "Return
-------
IGESData_GlobalSection

Description
-----------
Returns the Global section of the IGES file.
") ChangeGlobalSection;
		IGESData_GlobalSection & ChangeGlobalSection();

		/****** IGESData_IGESModel::ClearHeader ******/
		/****** md5 signature: e0fe665687ba246130521f416ab14715 ******/
		%feature("compactdefaultargs") ClearHeader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erases all data specific to IGES file Header (Start + Global).
") ClearHeader;
		void ClearHeader();

		/****** IGESData_IGESModel::ClearLabels ******/
		/****** md5 signature: 3045f499e790e0fc2a95acdb522f6ec7 ******/
		%feature("compactdefaultargs") ClearLabels;
		%feature("autodoc", "Return
-------
None

Description
-----------
erases specific labels, i.e. does nothing.
") ClearLabels;
		void ClearLabels();

		/****** IGESData_IGESModel::ClearStartSection ******/
		/****** md5 signature: 29b5c728821e04390dafe8b05fae72a4 ******/
		%feature("compactdefaultargs") ClearStartSection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the IGES file Start Section.
") ClearStartSection;
		void ClearStartSection();

		/****** IGESData_IGESModel::DNum ******/
		/****** md5 signature: 9a55ce46e7c2f097913f24946be05bcc ******/
		%feature("compactdefaultargs") DNum;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
int

Description
-----------
Returns the equivalent DE Number for an Entity, i.e. 2*Number(ent)-1 , or 0 if <ent> is unknown from <self> This DE Number is used for File Writing for instance.
") DNum;
		Standard_Integer DNum(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_IGESModel::DumpHeader ******/
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
Prints the IGES file header (Start and Global Sections) to the log file. The integer parameter is intended to be used as a level indicator but is not used at present.
") DumpHeader;
		void DumpHeader(std::ostream &OutValue, const Standard_Integer level = 0);

		/****** IGESData_IGESModel::Entity ******/
		/****** md5 signature: 9ad99fc403d738612d5a7261abb4e74e ******/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<IGESData_IGESEntity>

Description
-----------
Returns an IGES entity given by its rank number.
") Entity;
		opencascade::handle<IGESData_IGESEntity> Entity(const Standard_Integer num);

		/****** IGESData_IGESModel::GetFromAnother ******/
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
gets Header (GlobalSection) from another Model.
") GetFromAnother;
		void GetFromAnother(const opencascade::handle<Interface_InterfaceModel> & other);

		/****** IGESData_IGESModel::GlobalSection ******/
		/****** md5 signature: 2d5bb9cb8fa84f49edbd79893e642aa1 ******/
		%feature("compactdefaultargs") GlobalSection;
		%feature("autodoc", "Return
-------
IGESData_GlobalSection

Description
-----------
Returns the Global section of the IGES file.
") GlobalSection;
		const IGESData_GlobalSection & GlobalSection();

		/****** IGESData_IGESModel::NbStartLines ******/
		/****** md5 signature: 2d161449c39e91329b09abb1adcacd6b ******/
		%feature("compactdefaultargs") NbStartLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of recorded Start Lines.
") NbStartLines;
		Standard_Integer NbStartLines();

		/****** IGESData_IGESModel::NewEmptyModel ******/
		/****** md5 signature: 40876c8eb593ebc41abaf47645e862e5 ******/
		%feature("compactdefaultargs") NewEmptyModel;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns a New Empty Model, same type as <self> i.e. IGESModel.
") NewEmptyModel;
		opencascade::handle<Interface_InterfaceModel> NewEmptyModel();

		/****** IGESData_IGESModel::PrintInfo ******/
		/****** md5 signature: 048e00e2b50d28afc8b7b531cd4b786a ******/
		%feature("compactdefaultargs") PrintInfo;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
S: Standard_OStream

Description
-----------
Prints label specific to IGES norm for a given entity, i.e. its directory entry number (2*Number-1).
") PrintInfo;
		void PrintInfo(const opencascade::handle<Standard_Transient> & ent, std::ostream &OutValue);

		/****** IGESData_IGESModel::PrintLabel ******/
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
Prints label specific to IGES norm for a given entity, i.e. its directory entry number (2*Number-1).
") PrintLabel;
		void PrintLabel(const opencascade::handle<Standard_Transient> & ent, std::ostream &OutValue);

		/****** IGESData_IGESModel::PrintToLog ******/
		/****** md5 signature: 0993bb95706cbffcda2c98453ed6b557 ******/
		%feature("compactdefaultargs") PrintToLog;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
S: Standard_OStream

Description
-----------
Prints label specific to IGES norm for a given -- -- entity, i.e. its directory entry number (2*Number-1) in the log file format.
") PrintToLog;
		virtual void PrintToLog(const opencascade::handle<Standard_Transient> & ent, std::ostream &OutValue);

		/****** IGESData_IGESModel::SetGlobalSection ******/
		/****** md5 signature: 1af9179d630020de23e87e44cbffad84 ******/
		%feature("compactdefaultargs") SetGlobalSection;
		%feature("autodoc", "
Parameters
----------
header: IGESData_GlobalSection

Return
-------
None

Description
-----------
Sets the Global section of the IGES file.
") SetGlobalSection;
		void SetGlobalSection(const IGESData_GlobalSection & header);

		/****** IGESData_IGESModel::SetLineWeights ******/
		/****** md5 signature: e662b8b17b36bae19c5a66f41993209b ******/
		%feature("compactdefaultargs") SetLineWeights;
		%feature("autodoc", "
Parameters
----------
defw: float

Return
-------
None

Description
-----------
Sets LineWeights of contained Entities according header data (MaxLineWeight and LineWeightGrad) or to a default value for undefined weights.
") SetLineWeights;
		void SetLineWeights(const Standard_Real defw);

		/****** IGESData_IGESModel::SetStartSection ******/
		/****** md5 signature: ebf891bd634c8accc53a220ba641c312 ******/
		%feature("compactdefaultargs") SetStartSection;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfHAsciiString
copy: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets a new Start section from a list of strings. If copy is false, the Start section will be shared. Any modifications made to the strings later on, will have an effect on the Start section. If copy is true (default value), an independent copy of the strings is created and used as the Start section. Any modifications made to the strings later on, will have no effect on the Start section.
") SetStartSection;
		void SetStartSection(const opencascade::handle<TColStd_HSequenceOfHAsciiString> & list, const Standard_Boolean copy = Standard_True);

		/****** IGESData_IGESModel::StartLine ******/
		/****** md5 signature: 230c5bf04b169a2355c350165b2c19cc ******/
		%feature("compactdefaultargs") StartLine;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
str

Description
-----------
Returns a line from the IGES file Start section by specifying its number. An empty string is returned if the number given is out of range, the range being from 1 to NbStartLines.
") StartLine;
		Standard_CString StartLine(const Standard_Integer num);

		/****** IGESData_IGESModel::StartSection ******/
		/****** md5 signature: 998fa00be2a7bd3f42c5a6d35ff6278e ******/
		%feature("compactdefaultargs") StartSection;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns Model's Start Section (list of comment lines).
") StartSection;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> StartSection();

		/****** IGESData_IGESModel::StringLabel ******/
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
Returns a string with the label attached to a given entity, i.e. a string 'Dnn' with nn = directory entry number (2*N-1).
") StringLabel;
		opencascade::handle<TCollection_HAsciiString> StringLabel(const opencascade::handle<Standard_Transient> & ent);

		/****** IGESData_IGESModel::VerifyCheck ******/
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
Checks that the IGES file Global section contains valid data that conforms to the IGES specifications.
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
		/****** IGESData_IGESReaderData::IGESData_IGESReaderData ******/
		/****** md5 signature: 7bd1646350308a5e3a1609527631bae5 ******/
		%feature("compactdefaultargs") IGESData_IGESReaderData;
		%feature("autodoc", "
Parameters
----------
nbe: int
nbp: int

Return
-------
None

Description
-----------
creates IGESReaderData correctly dimensioned (for arrays) <nbe> count of entities, that is, half nb of directory lines <nbp>: count of parameters.
") IGESData_IGESReaderData;
		 IGESData_IGESReaderData(const Standard_Integer nbe, const Standard_Integer nbp);

		/****** IGESData_IGESReaderData::AddGlobal ******/
		/****** md5 signature: ec5685d7554a231058028d1107032f97 ******/
		%feature("compactdefaultargs") AddGlobal;
		%feature("autodoc", "
Parameters
----------
atype: Interface_ParamType
aval: str

Return
-------
None

Description
-----------
adds a parameter to global section's parameter list.
") AddGlobal;
		void AddGlobal(const Interface_ParamType atype, Standard_CString aval);

		/****** IGESData_IGESReaderData::AddStartLine ******/
		/****** md5 signature: ce16629f6b3db7e5bbe2a7c8d7a4bc5f ******/
		%feature("compactdefaultargs") AddStartLine;
		%feature("autodoc", "
Parameters
----------
aval: str

Return
-------
None

Description
-----------
adds a start line to start section.
") AddStartLine;
		void AddStartLine(Standard_CString aval);

		/****** IGESData_IGESReaderData::DefaultLineWeight ******/
		/****** md5 signature: 6dfd947d9c6ba05b9b68428e24e65be3 ******/
		%feature("compactdefaultargs") DefaultLineWeight;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the recorded Default Line Weight, if there is (else, returns 0).
") DefaultLineWeight;
		Standard_Real DefaultLineWeight();

		/****** IGESData_IGESReaderData::DirPart ******/
		/****** md5 signature: e38e8285a983ba750a194e68db50c834 ******/
		%feature("compactdefaultargs") DirPart;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
IGESData_DirPart

Description
-----------
returns DirPart identified by record no (half Dsect number).
") DirPart;
		const IGESData_DirPart & DirPart(const Standard_Integer num);

		/****** IGESData_IGESReaderData::DirType ******/
		/****** md5 signature: 5019de0967d38befc3938c68b6c48a9d ******/
		%feature("compactdefaultargs") DirType;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
IGESData_IGESType

Description
-----------
returns 'type' and 'form' info from a directory part.
") DirType;
		IGESData_IGESType DirType(const Standard_Integer num);

		/****** IGESData_IGESReaderData::DirValues ******/
		/****** md5 signature: 6475add3e7837b498bc2310ece31b391 ******/
		%feature("compactdefaultargs") DirValues;
		%feature("autodoc", "
Parameters
----------
num: int
res1: str
res2: str
label: str
subs: str

Return
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

Description
-----------
returns values recorded in directory part n0 <num>.
") DirValues;
		void DirValues(const Standard_Integer num, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_CString res1, Standard_CString res2, Standard_CString label, Standard_CString subs);

		/****** IGESData_IGESReaderData::FindNextRecord ******/
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
determines next suitable record from num; that is num+1 except for last one which gives 0.
") FindNextRecord;
		Standard_Integer FindNextRecord(const Standard_Integer num);

		/****** IGESData_IGESReaderData::GlobalCheck ******/
		/****** md5 signature: e6a5247811a8543d07da3a4917e3752a ******/
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns the recorded Global Check.
") GlobalCheck;
		opencascade::handle<Interface_Check> GlobalCheck();

		/****** IGESData_IGESReaderData::GlobalSection ******/
		/****** md5 signature: 9251755b31e2dbc4bc4c014b68758586 ******/
		%feature("compactdefaultargs") GlobalSection;
		%feature("autodoc", "Return
-------
IGESData_GlobalSection

Description
-----------
returns header as GlobalSection.
") GlobalSection;
		const IGESData_GlobalSection & GlobalSection();

		/****** IGESData_IGESReaderData::NbEntities ******/
		/****** md5 signature: ab39f1a260e05424e9d879a047ae3f8d ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of recorded Entities (i.e. size of Directory).
") NbEntities;
		virtual Standard_Integer NbEntities();

		/****** IGESData_IGESReaderData::SetDefaultLineWeight ******/
		/****** md5 signature: ea91eb9fed0bcebc6a359e1960f9b949 ******/
		%feature("compactdefaultargs") SetDefaultLineWeight;
		%feature("autodoc", "
Parameters
----------
defw: float

Return
-------
None

Description
-----------
allows to set a default line weight, will be later applied at load time, on Entities which have no specified line weight.
") SetDefaultLineWeight;
		void SetDefaultLineWeight(const Standard_Real defw);

		/****** IGESData_IGESReaderData::SetDirPart ******/
		/****** md5 signature: f5563f27adc7f5a15093df370f3cd0bc ******/
		%feature("compactdefaultargs") SetDirPart;
		%feature("autodoc", "
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
res1: str
res2: str
label: str
subs: str

Return
-------
None

Description
-----------
fills a DirPart, designated by its rank (that is, (N+1)/2 if N is its first number in section D).
") SetDirPart;
		void SetDirPart(const Standard_Integer num, const Standard_Integer i1, const Standard_Integer i2, const Standard_Integer i3, const Standard_Integer i4, const Standard_Integer i5, const Standard_Integer i6, const Standard_Integer i7, const Standard_Integer i8, const Standard_Integer i9, const Standard_Integer i10, const Standard_Integer i11, const Standard_Integer i12, const Standard_Integer i13, const Standard_Integer i14, const Standard_Integer i15, const Standard_Integer i16, const Standard_Integer i17, Standard_CString res1, Standard_CString res2, Standard_CString label, Standard_CString subs);

		/****** IGESData_IGESReaderData::SetEntityNumbers ******/
		/****** md5 signature: 2160d07f29f3b4f2e31932dc1880e6da ******/
		%feature("compactdefaultargs") SetEntityNumbers;
		%feature("autodoc", "Return
-------
None

Description
-----------
determines reference numbers in EntityNumber fields (called by SetEntities from IGESReaderTool) works on 'Integer' type Parameters, because IGES does not distinguish Integer and Entity Refs: every Integer which is odd and less than twice NbRecords can be an Entity Ref ... (Ref Number is then (N+1)/2 if N is the Integer Value).
") SetEntityNumbers;
		void SetEntityNumbers();

		/****** IGESData_IGESReaderData::SetGlobalSection ******/
		/****** md5 signature: 9d230dff88b6d731cd73911eabb472ee ******/
		%feature("compactdefaultargs") SetGlobalSection;
		%feature("autodoc", "Return
-------
None

Description
-----------
reads header (as GlobalSection) content from the ParamSet after it has been filled by successive calls to AddGlobal.
") SetGlobalSection;
		void SetGlobalSection();

		/****** IGESData_IGESReaderData::StartSection ******/
		/****** md5 signature: 998fa00be2a7bd3f42c5a6d35ff6278e ******/
		%feature("compactdefaultargs") StartSection;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the Start Section in once.
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
		/****** IGESData_IGESReaderTool::IGESData_IGESReaderTool ******/
		/****** md5 signature: 2be4dc2d191575581bce3c5f59d6388c ******/
		%feature("compactdefaultargs") IGESData_IGESReaderTool;
		%feature("autodoc", "
Parameters
----------
reader: IGESData_IGESReaderData
protocol: IGESData_Protocol

Return
-------
None

Description
-----------
creates IGESReaderTool to work with an IGESReaderData and an IGES Protocol. Actually, no Lib is used.
") IGESData_IGESReaderTool;
		 IGESData_IGESReaderTool(const opencascade::handle<IGESData_IGESReaderData> & reader, const opencascade::handle<IGESData_Protocol> & protocol);

		/****** IGESData_IGESReaderTool::AnalyseRecord ******/
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
fills an entity, given record no; works by calling ReadDirPart then ReadParams (with help of a ParamReader), then if required ReadProps and ReadAssocs, from IGESEntity Returns True if no fail has been recorded.
") AnalyseRecord;
		Standard_Boolean AnalyseRecord(const Standard_Integer num, const opencascade::handle<Standard_Transient> & anent, opencascade::handle<Interface_Check> & acheck);

		/****** IGESData_IGESReaderTool::BeginRead ******/
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
fills model's header, that is, its GlobalSection.
") BeginRead;
		void BeginRead(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** IGESData_IGESReaderTool::EndRead ******/
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
after reading entities, true line weights can be computed.
") EndRead;
		virtual void EndRead(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** IGESData_IGESReaderTool::Prepare ******/
		/****** md5 signature: 9cfe3a34381ef8cbe2c88cf2d2f616ac ******/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "
Parameters
----------
reco: IGESData_FileRecognizer

Return
-------
None

Description
-----------
binds empty entities to records, works with the Protocol (from IGESData) stored and later used RQ: Actually, sets DNum into IGES Entities Also loads the list of parameters for ParamReader.
") Prepare;
		void Prepare(const opencascade::handle<IGESData_FileRecognizer> & reco);

		/****** IGESData_IGESReaderTool::ReadAssocs ******/
		/****** md5 signature: d591d98a58b15cf05d804e773c814806 ******/
		%feature("compactdefaultargs") ReadAssocs;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Return
-------
None

Description
-----------
Reads Associativity List, if there is (if not, does nothing) criterium is: current parameter of PR remains inside params list, and Stage is 'Own' Same conditions as above; in addition, no parameter must be let after the list once read Note that 'Associated' entities are not declared 'Shared'.
") ReadAssocs;
		void ReadAssocs(const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****** IGESData_IGESReaderTool::ReadDir ******/
		/****** md5 signature: bf7e78cb043b431597579fee160e3250 ******/
		%feature("compactdefaultargs") ReadDir;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity
IR: IGESData_IGESReaderData
DP: IGESData_DirPart
ach: Interface_Check

Return
-------
None

Description
-----------
Reads directory part components from file; DP is the literal directory part, IR detains entities referenced by DP.
") ReadDir;
		void ReadDir(const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, const IGESData_DirPart & DP, opencascade::handle<Interface_Check> & ach);

		/****** IGESData_IGESReaderTool::ReadOwnParams ******/
		/****** md5 signature: c2a7a1044b7d8d316de3ab87ef8f43b1 ******/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Return
-------
None

Description
-----------
Performs Reading of own Parameters for each IGESEntity Works with the ReaderLib loaded with ReadWriteModules for IGES In case of failure, tries UndefinedEntity from IGES.
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****** IGESData_IGESReaderTool::ReadProps ******/
		/****** md5 signature: 063dccaba6a476008f1c9e9e43114cc2 ******/
		%feature("compactdefaultargs") ReadProps;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Return
-------
None

Description
-----------
Reads Property List, if there is (if not, does nothing) criterium is: current parameter of PR remains inside params list, and Stage is 'Own' Current parameter must be a positive integer, which value gives the length of the list; else, a Fail is produced (into Check of PR) and reading process is stopped.
") ReadProps;
		void ReadProps(const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****** IGESData_IGESReaderTool::Recognize ******/
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
recognizes records by asking Protocol (on data of DirType).
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
		/****** IGESData_IGESType::IGESData_IGESType ******/
		/****** md5 signature: e98d58f35bad767849b7598c27a8bdb3 ******/
		%feature("compactdefaultargs") IGESData_IGESType;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IGESData_IGESType;
		 IGESData_IGESType();

		/****** IGESData_IGESType::IGESData_IGESType ******/
		/****** md5 signature: 5d6fc738619a208b8bf5cac6d8aa8203 ******/
		%feature("compactdefaultargs") IGESData_IGESType;
		%feature("autodoc", "
Parameters
----------
atype: int
aform: int

Return
-------
None

Description
-----------
No available documentation.
") IGESData_IGESType;
		 IGESData_IGESType(const Standard_Integer atype, const Standard_Integer aform);

		/****** IGESData_IGESType::Form ******/
		/****** md5 signature: 3d0d90fa7c53c730feed4574fa16c0b4 ******/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 'form' data.
") Form;
		Standard_Integer Form();

		/****** IGESData_IGESType::IsEqual ******/
		/****** md5 signature: 204420b251ddf3b89f3d3ed25993bbce ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
another: IGESData_IGESType

Return
-------
bool

Description
-----------
compares two IGESTypes, avoiding comparing their fields.
") IsEqual;
		Standard_Boolean IsEqual(const IGESData_IGESType & another);

		/****** IGESData_IGESType::Nullify ******/
		/****** md5 signature: 1915d5159e87738b7b9af9d5accf4c6e ******/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "Return
-------
None

Description
-----------
resets fields (useful when an IGESType is stored as mask).
") Nullify;
		void Nullify();

		/****** IGESData_IGESType::Type ******/
		/****** md5 signature: fadaf18b7481222141380b2bb22870ff ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 'type' data.
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
		/****** IGESData_IGESWriter::IGESData_IGESWriter ******/
		/****** md5 signature: 6cfa98b78c1e12625adfb9e50d92ce7c ******/
		%feature("compactdefaultargs") IGESData_IGESWriter;
		%feature("autodoc", "
Parameters
----------
amodel: IGESData_IGESModel

Return
-------
None

Description
-----------
Creates an IGESWriter, empty ready to work (see the methods SendModel and Print).
") IGESData_IGESWriter;
		 IGESData_IGESWriter(const opencascade::handle<IGESData_IGESModel> & amodel);

		/****** IGESData_IGESWriter::IGESData_IGESWriter ******/
		/****** md5 signature: 1a168d67a4f832f17c10508919292f64 ******/
		%feature("compactdefaultargs") IGESData_IGESWriter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor (not used) to satisfy the compiler.
") IGESData_IGESWriter;
		 IGESData_IGESWriter();

		/****** IGESData_IGESWriter::IGESData_IGESWriter ******/
		/****** md5 signature: 60bc2594f2ee21e935e2d0d855ae0bf4 ******/
		%feature("compactdefaultargs") IGESData_IGESWriter;
		%feature("autodoc", "
Parameters
----------
other: IGESData_IGESWriter

Return
-------
None

Description
-----------
Constructor by copy (not used) to satisfy the compiler.
") IGESData_IGESWriter;
		 IGESData_IGESWriter(const IGESData_IGESWriter & other);

		/****** IGESData_IGESWriter::Associativities ******/
		/****** md5 signature: ebefaea9b8bf88426937d6634dd2eaca ******/
		%feature("compactdefaultargs") Associativities;
		%feature("autodoc", "
Parameters
----------
anent: IGESData_IGESEntity

Return
-------
None

Description
-----------
sends associativity list, as complement of parameters list error if not in sections DP or Stage not 'Associativity'.
") Associativities;
		void Associativities(const opencascade::handle<IGESData_IGESEntity> & anent);

		/****** IGESData_IGESWriter::DirPart ******/
		/****** md5 signature: a58406ae76e01f3bbf334f828411f5eb ******/
		%feature("compactdefaultargs") DirPart;
		%feature("autodoc", "
Parameters
----------
anent: IGESData_IGESEntity

Return
-------
None

Description
-----------
translates directory part of an Entity into a literal DirPart Some infos are computed after sending parameters Error if not in sections DP or Stage not 'Dir'.
") DirPart;
		void DirPart(const opencascade::handle<IGESData_IGESEntity> & anent);

		/****** IGESData_IGESWriter::EndEntity ******/
		/****** md5 signature: 2e21c428951219249bd42b33a599281b ******/
		%feature("compactdefaultargs") EndEntity;
		%feature("autodoc", "Return
-------
None

Description
-----------
declares end of sending an entity (ends param list by ';').
") EndEntity;
		void EndEntity();

		/****** IGESData_IGESWriter::FloatWriter ******/
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

		/****** IGESData_IGESWriter::OwnParams ******/
		/****** md5 signature: 1a8c0ea27d5f597c466e6147a077b86d ******/
		%feature("compactdefaultargs") OwnParams;
		%feature("autodoc", "
Parameters
----------
anent: IGESData_IGESEntity

Return
-------
None

Description
-----------
sends own parameters of the entity, by sending firstly its type, then calling specific method WriteOwnParams Error if not in sections DP or Stage not 'Own'.
") OwnParams;
		void OwnParams(const opencascade::handle<IGESData_IGESEntity> & anent);

		/****** IGESData_IGESWriter::Print ******/
		/****** md5 signature: 5e5b127c01c68c6fb6a747c286a95265 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------

Return
-------
S: Standard_OStream

Description
-----------
Writes result on an output defined as an OStream resolves stored infos at this time; in particular, numbers of lines used to address P-section from D-section and final totals Takes WriteMode into account.
") Print;
		Standard_Boolean Print(std::ostream &OutValue);

		/****** IGESData_IGESWriter::Properties ******/
		/****** md5 signature: 593129876ee8c43cc811cf1423c82b5d ******/
		%feature("compactdefaultargs") Properties;
		%feature("autodoc", "
Parameters
----------
anent: IGESData_IGESEntity

Return
-------
None

Description
-----------
sends property list, as complement of parameters list error if not in sections DP or Stage not 'Property'.
") Properties;
		void Properties(const opencascade::handle<IGESData_IGESEntity> & anent);

		/****** IGESData_IGESWriter::SectionG ******/
		/****** md5 signature: f70e27ff05550f06ae45ade95d2d0146 ******/
		%feature("compactdefaultargs") SectionG;
		%feature("autodoc", "
Parameters
----------
header: IGESData_GlobalSection

Return
-------
None

Description
-----------
prepares sending of header, from a GlobalSection (stores it) error if SectionS was not called just before takes in account special characters (Separator, EndMark).
") SectionG;
		void SectionG(const IGESData_GlobalSection & header);

		/****** IGESData_IGESWriter::SectionS ******/
		/****** md5 signature: 2129bff17ae34492037c8deb6b7cc519 ******/
		%feature("compactdefaultargs") SectionS;
		%feature("autodoc", "Return
-------
None

Description
-----------
declares sending of S section (only a declaration) error if state is not initial.
") SectionS;
		void SectionS();

		/****** IGESData_IGESWriter::SectionStrings ******/
		/****** md5 signature: 80ebd9f11f222c20b13b89b7313ac65e ******/
		%feature("compactdefaultargs") SectionStrings;
		%feature("autodoc", "
Parameters
----------
numsec: int

Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
Returns the list of strings for a section given its rank 1: Start (if not empty) 2: Global 3 or 4: Parameters RQ: no string list for Directory section An empty section gives a null handle.
") SectionStrings;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> SectionStrings(const Standard_Integer numsec);

		/****** IGESData_IGESWriter::SectionT ******/
		/****** md5 signature: 71f6640137d3036b727d79b6bab712cb ******/
		%feature("compactdefaultargs") SectionT;
		%feature("autodoc", "Return
-------
None

Description
-----------
declares sending of T section (only a declaration) error if does not follow Entities sending.
") SectionT;
		void SectionT();

		/****** IGESData_IGESWriter::SectionsDP ******/
		/****** md5 signature: a3970d28c5174555c7c6551f0e3d68c3 ******/
		%feature("compactdefaultargs") SectionsDP;
		%feature("autodoc", "Return
-------
None

Description
-----------
prepares sending of list of entities, as Sections D (directory list) and P (Parameters lists, one per entity) Entities will be then processed, one after the other error if SectionG has not be called just before.
") SectionsDP;
		void SectionsDP();

		/****** IGESData_IGESWriter::SendBoolean ******/
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
sends a Boolean parameter as an Integer value 0(False)/1(True).
") SendBoolean;
		void SendBoolean(const Standard_Boolean val);

		/****** IGESData_IGESWriter::SendModel ******/
		/****** md5 signature: 3aafa5ab3573378a6f17270792bcb0d1 ******/
		%feature("compactdefaultargs") SendModel;
		%feature("autodoc", "
Parameters
----------
protocol: IGESData_Protocol

Return
-------
None

Description
-----------
Sends the complete IGESModel (Global Section, Entities as Directory Entries & Parameter Lists, etc...) i.e. fills a list of texts. Once filled, it can be sent by method Print.
") SendModel;
		void SendModel(const opencascade::handle<IGESData_Protocol> & protocol);

		/****** IGESData_IGESWriter::SendStartLine ******/
		/****** md5 signature: a0b8d0b392e66a48753ee0b5a05b64b1 ******/
		%feature("compactdefaultargs") SendStartLine;
		%feature("autodoc", "
Parameters
----------
startline: str

Return
-------
None

Description
-----------
Sends an additional Starting Line: this is the way used to send comments in an IGES File (at beginning of the file). If the line is more than 72 chars long, it is split into as many lines as required to send it completely.
") SendStartLine;
		void SendStartLine(Standard_CString startline);

		/****** IGESData_IGESWriter::SendString ******/
		/****** md5 signature: 92320a0c3411641c39d308f7f62b1e3b ******/
		%feature("compactdefaultargs") SendString;
		%feature("autodoc", "
Parameters
----------
val: TCollection_HAsciiString

Return
-------
None

Description
-----------
sends a parameter under its exact form given as a string.
") SendString;
		void SendString(const opencascade::handle<TCollection_HAsciiString> & val);

		/****** IGESData_IGESWriter::SendVoid ******/
		/****** md5 signature: 57e39e043394ecdca192085943c6d397 ******/
		%feature("compactdefaultargs") SendVoid;
		%feature("autodoc", "Return
-------
None

Description
-----------
sends a void parameter, that is null text.
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
		/****** IGESData_NodeOfSpecificLib::IGESData_NodeOfSpecificLib ******/
		/****** md5 signature: f54dd4161f1e9f19ca86399897a966c6 ******/
		%feature("compactdefaultargs") IGESData_NodeOfSpecificLib;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty Node, with no Next.
") IGESData_NodeOfSpecificLib;
		 IGESData_NodeOfSpecificLib();

		/****** IGESData_NodeOfSpecificLib::AddNode ******/
		/****** md5 signature: b24e0e0113ac4e4c0f889a68a419a036 ******/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "
Parameters
----------
anode: IGESData_GlobalNodeOfSpecificLib

Return
-------
None

Description
-----------
Adds a couple (Module,Protocol), that is, stores it into itself if not yet done, else creates a Next Node to do it.
") AddNode;
		void AddNode(const opencascade::handle<IGESData_GlobalNodeOfSpecificLib> & anode);

		/****** IGESData_NodeOfSpecificLib::Module ******/
		/****** md5 signature: 94fb463336d8c4fc0b6073746099eaef ******/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_SpecificModule>

Description
-----------
Returns the Module designated by a precise Node.
") Module;
		const opencascade::handle<IGESData_SpecificModule> & Module();

		/****** IGESData_NodeOfSpecificLib::Next ******/
		/****** md5 signature: 5346038d4f02d13fdf50b8d30f4ac868 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_NodeOfSpecificLib>

Description
-----------
Returns the Next Node. If none was defined, returned value is a Null Handle.
") Next;
		const opencascade::handle<IGESData_NodeOfSpecificLib> & Next();

		/****** IGESData_NodeOfSpecificLib::Protocol ******/
		/****** md5 signature: 4eb07a48dbfd452cf11a527b6ce5309c ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_Protocol>

Description
-----------
Returns the Protocol designated by a precise Node.
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
		/****** IGESData_NodeOfWriterLib::IGESData_NodeOfWriterLib ******/
		/****** md5 signature: 861aea86c52551677c5542784ccac33b ******/
		%feature("compactdefaultargs") IGESData_NodeOfWriterLib;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty Node, with no Next.
") IGESData_NodeOfWriterLib;
		 IGESData_NodeOfWriterLib();

		/****** IGESData_NodeOfWriterLib::AddNode ******/
		/****** md5 signature: 80279a7c1b0a0b9e058f510e5db5ac30 ******/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "
Parameters
----------
anode: IGESData_GlobalNodeOfWriterLib

Return
-------
None

Description
-----------
Adds a couple (Module,Protocol), that is, stores it into itself if not yet done, else creates a Next Node to do it.
") AddNode;
		void AddNode(const opencascade::handle<IGESData_GlobalNodeOfWriterLib> & anode);

		/****** IGESData_NodeOfWriterLib::Module ******/
		/****** md5 signature: 620617849b7007bcf8f20d0e6d505c82 ******/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_ReadWriteModule>

Description
-----------
Returns the Module designated by a precise Node.
") Module;
		const opencascade::handle<IGESData_ReadWriteModule> & Module();

		/****** IGESData_NodeOfWriterLib::Next ******/
		/****** md5 signature: c0e9604917a176294a629a65becf9c72 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_NodeOfWriterLib>

Description
-----------
Returns the Next Node. If none was defined, returned value is a Null Handle.
") Next;
		const opencascade::handle<IGESData_NodeOfWriterLib> & Next();

		/****** IGESData_NodeOfWriterLib::Protocol ******/
		/****** md5 signature: 4eb07a48dbfd452cf11a527b6ce5309c ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_Protocol>

Description
-----------
Returns the Protocol designated by a precise Node.
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
		/****** IGESData_ParamCursor::IGESData_ParamCursor ******/
		/****** md5 signature: 17236a15be440009bfc9345a53285d8c ******/
		%feature("compactdefaultargs") IGESData_ParamCursor;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
Creates a Cursor to read a precise parameter of ParamReader, identified by its number, then set Current Number to 'num + 1' (this constructor allows to simply give a Number to a method Read... from ParamReader, which will be translated into a ParamCursor by compiler).
") IGESData_ParamCursor;
		 IGESData_ParamCursor(const Standard_Integer num);

		/****** IGESData_ParamCursor::IGESData_ParamCursor ******/
		/****** md5 signature: ed65ea820dcd6b63c6b259dda34b35e5 ******/
		%feature("compactdefaultargs") IGESData_ParamCursor;
		%feature("autodoc", "
Parameters
----------
num: int
nb: int
size: int (optional, default to 1)

Return
-------
None

Description
-----------
Creates a Cursor to read a list of parameters (count 'nb') starting from a precise one (number 'num') included, then set Current Number of ParamNumber to the first following one ('num + nb') If size is given, it means that each parameter is made of more than one term. One term is the normal (default) case: for instance, a Parameter comprises one Integer, or one Entity ... Size gives the complete size of each Item if it is complex. To be used ONLY IF it is constant.
") IGESData_ParamCursor;
		 IGESData_ParamCursor(const Standard_Integer num, const Standard_Integer nb, const Standard_Integer size = 1);

		/****** IGESData_ParamCursor::Advance ******/
		/****** md5 signature: 8732b03d4deabafe551100a45ffce80e ******/
		%feature("compactdefaultargs") Advance;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Advance command has been set.
") Advance;
		Standard_Boolean Advance();

		/****** IGESData_ParamCursor::Count ******/
		/****** md5 signature: 991c7b8ad8fee748c77481e1ff97e534 ******/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns required count of items to be read.
") Count;
		Standard_Integer Count();

		/****** IGESData_ParamCursor::ItemSize ******/
		/****** md5 signature: 51c711469617c7c15e7b2266ef8e2c5b ******/
		%feature("compactdefaultargs") ItemSize;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns length of item (count of parameters per item).
") ItemSize;
		Standard_Integer ItemSize();

		/****** IGESData_ParamCursor::Limit ******/
		/****** md5 signature: b53224ef6b9824bc94762faf5d79014a ******/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (excluded) upper limit number for reading parameters.
") Limit;
		Standard_Integer Limit();

		/****** IGESData_ParamCursor::Offset ******/
		/****** md5 signature: 03bde6fe15ae3c54c8556dcc0a4901ec ******/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns offset from which current term must be read in item.
") Offset;
		Standard_Integer Offset();

		/****** IGESData_ParamCursor::SetAdvance ******/
		/****** md5 signature: 40bfe0c94811631723642e838ccf5256 ******/
		%feature("compactdefaultargs") SetAdvance;
		%feature("autodoc", "
Parameters
----------
advance: bool

Return
-------
None

Description
-----------
Changes command to advance current cursor after reading parameters. If 'advance' True, sets advance, if 'False', resets it. ParamCursor is created by default with True.
") SetAdvance;
		void SetAdvance(const Standard_Boolean advance);

		/****** IGESData_ParamCursor::SetOne ******/
		/****** md5 signature: 1bfaf66a64f419b940b5e9d6e97f6428 ******/
		%feature("compactdefaultargs") SetOne;
		%feature("autodoc", "
Parameters
----------
autoadv: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Defines a term of one Parameter (very current case).
") SetOne;
		void SetOne(const Standard_Boolean autoadv = Standard_True);

		/****** IGESData_ParamCursor::SetTerm ******/
		/****** md5 signature: 5451e0f8db70fd6b34e9cabd793d48a1 ******/
		%feature("compactdefaultargs") SetTerm;
		%feature("autodoc", "
Parameters
----------
size: int
autoadv: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Defines the size of a term to read in the item: this commands ParamReader to read 'size' parameters for each item, then skip the remainder of the item to the same term of next Item (that is, skip 'item size' - 'term size') //! In addition, Offset from beginning of Item is managed: After being created, and for the first call to SetTerm, the part of Item to be read begins exactly as the Item begins But after a SetTerm, the next read will add an offset which is the size of former term. //! autoadv commands Advance management. If it is True (default), the last SetTerm (Item size has been covered) calls SetAdvance If it is False, SetAdvance must be called directly if necessary //! Error if a SetTerm overpasses the size of the Item.
") SetTerm;
		void SetTerm(const Standard_Integer size, const Standard_Boolean autoadv = Standard_True);

		/****** IGESData_ParamCursor::SetXY ******/
		/****** md5 signature: 0a2da6eac7b51f5fe56357b170dfa18a ******/
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "
Parameters
----------
autoadv: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Defines a term of two Parameters for a XY (current case).
") SetXY;
		void SetXY(const Standard_Boolean autoadv = Standard_True);

		/****** IGESData_ParamCursor::SetXYZ ******/
		/****** md5 signature: f92ea28b25f113bc557ceaed32b78fce ******/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "
Parameters
----------
autoadv: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Defines a term of three Parameters for XYZ (current case).
") SetXYZ;
		void SetXYZ(const Standard_Boolean autoadv = Standard_True);

		/****** IGESData_ParamCursor::Start ******/
		/****** md5 signature: df4b97f316882ae26acb8561520308e4 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (included) starting number for reading parameters.
") Start;
		Standard_Integer Start();

		/****** IGESData_ParamCursor::TermSize ******/
		/****** md5 signature: 3abad23e5df6e9276cb8570fb9313206 ******/
		%feature("compactdefaultargs") TermSize;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns length of current term (count of parameters) in item.
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
		/****** IGESData_ParamReader::IGESData_ParamReader ******/
		/****** md5 signature: 0be7335ed78b6f2c140a4421677b3de3 ******/
		%feature("compactdefaultargs") IGESData_ParamReader;
		%feature("autodoc", "
Parameters
----------
list: Interface_ParamList
ach: Interface_Check
base: int (optional, default to 1)
nbpar: int (optional, default to 0)
num: int (optional, default to 0)

Return
-------
None

Description
-----------
Prepares a ParamReader, stage 'Own', current param = 1 It considers a part of the list, from <base> (excluded) for <nbpar> parameters; <nbpar> = 0 commands to take list length. Default is (1 to skip type).
") IGESData_ParamReader;
		 IGESData_ParamReader(const opencascade::handle<Interface_ParamList> & list, const opencascade::handle<Interface_Check> & ach, const Standard_Integer base = 1, const Standard_Integer nbpar = 0, const Standard_Integer num = 0);

		/****** IGESData_ParamReader::AddFail ******/
		/****** md5 signature: c91e40f5f15a144a7f8c0b135ca877ca ******/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "
Parameters
----------
afail: str
bfail: str (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") AddFail;
		void AddFail(Standard_CString afail, Standard_CString bfail = "");

		/****** IGESData_ParamReader::AddFail ******/
		/****** md5 signature: c2e5e426059ba8bc38dac40e1adc4faa ******/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "
Parameters
----------
af: TCollection_HAsciiString
bf: TCollection_HAsciiString

Return
-------
None

Description
-----------
feeds the Check with a new fail (as a String or as a CString).
") AddFail;
		void AddFail(const opencascade::handle<TCollection_HAsciiString> & af, const opencascade::handle<TCollection_HAsciiString> & bf);

		/****** IGESData_ParamReader::AddWarning ******/
		/****** md5 signature: 9a73bc0475344564f058cee8c231b03d ******/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "
Parameters
----------
awarn: str
bwarn: str (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") AddWarning;
		void AddWarning(Standard_CString awarn, Standard_CString bwarn = "");

		/****** IGESData_ParamReader::AddWarning ******/
		/****** md5 signature: 08b677de5f00f85a69ff40630816ba2b ******/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "
Parameters
----------
aw: TCollection_HAsciiString
bw: TCollection_HAsciiString

Return
-------
None

Description
-----------
feeds the Check with a new Warning message.
") AddWarning;
		void AddWarning(const opencascade::handle<TCollection_HAsciiString> & aw, const opencascade::handle<TCollection_HAsciiString> & bw);

		/****** IGESData_ParamReader::CCheck ******/
		/****** md5 signature: 6e66cd51a221a5f9b18ffa07111f133d ******/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Check>

Description
-----------
returns the check in a way which allows to work on it directly (i.e. messages added to the Check are added to ParamReader too).
") CCheck;
		opencascade::handle<Interface_Check> & CCheck();

		/****** IGESData_ParamReader::Check ******/
		/****** md5 signature: 535183f491df1166f3d80ddd8b810a47 ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Check>

Description
-----------
returns the Check Note that any error signaled above is also recorded into it.
") Check;
		const opencascade::handle<Interface_Check> & Check();

		/****** IGESData_ParamReader::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
resets state (stage, current param number, check with no fail).
") Clear;
		void Clear();

		/****** IGESData_ParamReader::Current ******/
		/****** md5 signature: 135533e6192333264e7664264e27cf57 ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
IGESData_ParamCursor

Description
-----------
Creates a ParamCursor from the Current Number, to read one parameter, and to advance Current Number after reading.
") Current;
		IGESData_ParamCursor Current();

		/****** IGESData_ParamReader::CurrentList ******/
		/****** md5 signature: 907e65a85f73ab24aa0a2bff6b639fc6 ******/
		%feature("compactdefaultargs") CurrentList;
		%feature("autodoc", "
Parameters
----------
nb: int
size: int (optional, default to 1)

Return
-------
IGESData_ParamCursor

Description
-----------
Creates a ParamCursor from the Current Number, to read a list of 'nb' items, and to advance Current Number after reading By default, each item is made of one parameter If size is given, it precises the number of params per item.
") CurrentList;
		IGESData_ParamCursor CurrentList(const Standard_Integer nb, const Standard_Integer size = 1);

		/****** IGESData_ParamReader::CurrentNumber ******/
		/****** md5 signature: cad50b6737e024bb37d77c60a68e5874 ******/
		%feature("compactdefaultargs") CurrentNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the current parameter number This notion is involved by the organisation of an IGES list of parameter: it can be ended by two lists (Associativities and Properties), which can be empty, or even absent. Hence, it is necessary to know, at the end of specific reading, how many parameters have been read: the optional lists follow.
") CurrentNumber;
		Standard_Integer CurrentNumber();

		/****** IGESData_ParamReader::DefinedElseSkip ******/
		/****** md5 signature: 883cbb4e12366c3b803d0a4caa42669f ******/
		%feature("compactdefaultargs") DefinedElseSkip;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Allows to simply process a parameter which can be defaulted. Waits on the Current Number a defined parameter or skips it: If the parameter <num> is defined, changes nothing and returns True Hence, the next reading with current cursor will concern <num> If it is void, advances Current Position by one, and returns False The next reading will concern <num+1> (except if <num> = NbParams) //! This allows to process Default values as follows (C++): if (PR.DefinedElseSkip()) { .. PR.Read... (current parameter); } else { <current parameter> = default value .. nothing else to do with ParamReader } For Message.
") DefinedElseSkip;
		Standard_Boolean DefinedElseSkip();

		/****** IGESData_ParamReader::EndAll ******/
		/****** md5 signature: 1ea4b7216b380c8e79eddcee7a9bff79 ******/
		%feature("compactdefaultargs") EndAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
passes directly to the end of reading process.
") EndAll;
		void EndAll();

		/****** IGESData_ParamReader::EntityNumber ******/
		/****** md5 signature: 3b5de40d76500537f54e61dc1880dcc0 ******/
		%feature("compactdefaultargs") EntityNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the entity number in the file.
") EntityNumber;
		Standard_Integer EntityNumber();

		/****** IGESData_ParamReader::HasFailed ******/
		/****** md5 signature: 231f6cf476d6eb671060105fc565fef7 ******/
		%feature("compactdefaultargs") HasFailed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
says if fails have been recorded into the Check.
") HasFailed;
		Standard_Boolean HasFailed();

		/****** IGESData_ParamReader::IsCheckEmpty ******/
		/****** md5 signature: 5084ba875026d6b0ce293344b2432dc8 ******/
		%feature("compactdefaultargs") IsCheckEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the Check is Empty Else, it has to be recorded with the Read Entity.
") IsCheckEmpty;
		Standard_Boolean IsCheckEmpty();

		/****** IGESData_ParamReader::IsParamDefined ******/
		/****** md5 signature: 8e6b44f252e5989226cd44f91c0cf4b4 ******/
		%feature("compactdefaultargs") IsParamDefined;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
says if a parameter is defined (not void) See also DefinedElseSkip.
") IsParamDefined;
		Standard_Boolean IsParamDefined(const Standard_Integer num);

		/****** IGESData_ParamReader::IsParamEntity ******/
		/****** md5 signature: edcc5f4164bf630a10b2eddc151d1934 ******/
		%feature("compactdefaultargs") IsParamEntity;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
says if a parameter can be regarded as an entity reference (see Prepare from IGESReaderData for more explanation) Note that such a parameter can seen as be a plain Integer too.
") IsParamEntity;
		Standard_Boolean IsParamEntity(const Standard_Integer num);

		/****** IGESData_ParamReader::Mend ******/
		/****** md5 signature: 588cd016391e966111d0d2f7b92af695 ******/
		%feature("compactdefaultargs") Mend;
		%feature("autodoc", "
Parameters
----------
pref: str (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") Mend;
		void Mend(Standard_CString pref = "");

		/****** IGESData_ParamReader::NbParams ******/
		/****** md5 signature: 826f4756fca7f780e6d976c60183d715 ******/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns number of parameters (minus the first one) following method skip the first parameter (1 gives the 2nd).
") NbParams;
		Standard_Integer NbParams();

		/****** IGESData_ParamReader::NextStage ******/
		/****** md5 signature: 3afa7b44ad16680a74deb3d8fc21192e ******/
		%feature("compactdefaultargs") NextStage;
		%feature("autodoc", "Return
-------
None

Description
-----------
passes to next stage (must be linked with setting Current).
") NextStage;
		void NextStage();

		/****** IGESData_ParamReader::ParamEntity ******/
		/****** md5 signature: fc5bc5ca0ff84cba8590256531a2aaa5 ******/
		%feature("compactdefaultargs") ParamEntity;
		%feature("autodoc", "
Parameters
----------
IR: IGESData_IGESReaderData
num: int

Return
-------
opencascade::handle<IGESData_IGESEntity>

Description
-----------
directly returns entity referenced by a parameter.
") ParamEntity;
		opencascade::handle<IGESData_IGESEntity> ParamEntity(const opencascade::handle<IGESData_IGESReaderData> & IR, const Standard_Integer num);

		/****** IGESData_ParamReader::ParamNumber ******/
		/****** md5 signature: 82bace9b7e2f432720acfca17aba56fb ******/
		%feature("compactdefaultargs") ParamNumber;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
returns entity number corresponding to a parameter if there is otherwise zero (according criterium IsParamEntity).
") ParamNumber;
		Standard_Integer ParamNumber(const Standard_Integer num);

		/****** IGESData_ParamReader::ParamType ******/
		/****** md5 signature: 06805a954cdda33c70604680f220e0c5 ******/
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
Interface_ParamType

Description
-----------
returns type of parameter; note that 'Ident' or 'Sub' cannot be encountered, they correspond to 'Integer', see also below.
") ParamType;
		Interface_ParamType ParamType(const Standard_Integer num);

		/****** IGESData_ParamReader::ParamValue ******/
		/****** md5 signature: 5d590bd3843093ee8ddc8ca8dac44112 ******/
		%feature("compactdefaultargs") ParamValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
str

Description
-----------
returns literal value of a parameter, as it was in file.
") ParamValue;
		Standard_CString ParamValue(const Standard_Integer num);

		/****** IGESData_ParamReader::ReadBoolean ******/
		/****** md5 signature: 5af263137e415d719338928168c161b2 ******/
		%feature("compactdefaultargs") ReadBoolean;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
amsg: Message_Msg
exact: bool (optional, default to Standard_True)

Return
-------
val: bool

Description
-----------
No available documentation.
") ReadBoolean;
		Standard_Boolean ReadBoolean(const IGESData_ParamCursor & PC, const Message_Msg & amsg, Standard_Boolean &OutValue, const Standard_Boolean exact = Standard_True);

		/****** IGESData_ParamReader::ReadBoolean ******/
		/****** md5 signature: 6268762c0673bb403d3a288d7ff30cf4 ******/
		%feature("compactdefaultargs") ReadBoolean;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: str
exact: bool (optional, default to Standard_True)

Return
-------
val: bool

Description
-----------
Reads a Boolean value from parameter 'num' A Boolean is given as an Integer value 0 (False) or 1 (True) Anyway, an Integer is demanded (else, Check is filled) If exact is given True, those precise values are demanded Else, Correction is done, as False for 0 or <0, True for >0 (with a Warning error message, and return is True) In case of error (not an Integer, or not 0/1 and exact True), Check is filled with a Fail (using mess) and return is False.
") ReadBoolean;
		Standard_Boolean ReadBoolean(const IGESData_ParamCursor & PC, Standard_CString mess, Standard_Boolean &OutValue, const Standard_Boolean exact = Standard_True);

		/****** IGESData_ParamReader::ReadEntList ******/
		/****** md5 signature: 9c9af56d8bc83ee3ea10a6bf14216be8 ******/
		%feature("compactdefaultargs") ReadEntList;
		%feature("autodoc", "
Parameters
----------
IR: IGESData_IGESReaderData
PC: IGESData_ParamCursor
amsg: Message_Msg
val: Interface_EntityList
ord: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
No available documentation.
") ReadEntList;
		Standard_Boolean ReadEntList(const opencascade::handle<IGESData_IGESReaderData> & IR, const IGESData_ParamCursor & PC, Message_Msg & amsg, Interface_EntityList & val, const Standard_Boolean ord = Standard_True);

		/****** IGESData_ParamReader::ReadEntList ******/
		/****** md5 signature: 0d9be3239233313112722bdff358270b ******/
		%feature("compactdefaultargs") ReadEntList;
		%feature("autodoc", "
Parameters
----------
IR: IGESData_IGESReaderData
PC: IGESData_ParamCursor
mess: str
val: Interface_EntityList
ord: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Reads a list of Entities defined by PC Same conditions as for ReadEnts, for PC The list is given as an EntityList (index has no meaning; the EntityList starts from clear) If 'ord' is given True (default), entities will be added to the list in their original order Remark: Negative or Null Pointers are ignored Else ('ord' False), order is not guaranteed (faster mode) If all params cannot be read as Entities, same as above Warning Give 'ord' to False ONLY if order is not significant.
") ReadEntList;
		Standard_Boolean ReadEntList(const opencascade::handle<IGESData_IGESReaderData> & IR, const IGESData_ParamCursor & PC, Standard_CString mess, Interface_EntityList & val, const Standard_Boolean ord = Standard_True);

		/****** IGESData_ParamReader::ReadEnts ******/
		/****** md5 signature: 750391ef81f0fbfc5d61afa7f04ac7fd ******/
		%feature("compactdefaultargs") ReadEnts;
		%feature("autodoc", "
Parameters
----------
IR: IGESData_IGESReaderData
PC: IGESData_ParamCursor
amsg: Message_Msg
val: IGESData_HArray1OfIGESEntity
index: int (optional, default to 1)

Return
-------
bool

Description
-----------
No available documentation.
") ReadEnts;
		Standard_Boolean ReadEnts(const opencascade::handle<IGESData_IGESReaderData> & IR, const IGESData_ParamCursor & PC, const Message_Msg & amsg, opencascade::handle<IGESData_HArray1OfIGESEntity> & val, const Standard_Integer index = 1);

		/****** IGESData_ParamReader::ReadEnts ******/
		/****** md5 signature: c9f7df380f06bc937e9e8c4995e90b9c ******/
		%feature("compactdefaultargs") ReadEnts;
		%feature("autodoc", "
Parameters
----------
IR: IGESData_IGESReaderData
PC: IGESData_ParamCursor
mess: str
val: IGESData_HArray1OfIGESEntity
index: int (optional, default to 1)

Return
-------
bool

Description
-----------
Reads a list of Entities defined by PC Same conditions as for ReadInts, for PC and index The list is given as a HArray1, numered from 'index' If all params cannot be read as Entities, Check is filled (using mess) and return value is False Remark: Null references are accepted, they are ignored (negative pointers too: they provoke a Warning message) If the caller wants to check them, a loop on ReadEntity should be used.
") ReadEnts;
		Standard_Boolean ReadEnts(const opencascade::handle<IGESData_IGESReaderData> & IR, const IGESData_ParamCursor & PC, Standard_CString mess, opencascade::handle<IGESData_HArray1OfIGESEntity> & val, const Standard_Integer index = 1);

		/****** IGESData_ParamReader::ReadInteger ******/
		/****** md5 signature: 5c7a57000d7ed53a1cc81fab0e105a88 ******/
		%feature("compactdefaultargs") ReadInteger;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor

Return
-------
val: int

Description
-----------
No available documentation.
") ReadInteger;
		Standard_Boolean ReadInteger(const IGESData_ParamCursor & PC, Standard_Integer &OutValue);

		/****** IGESData_ParamReader::ReadInteger ******/
		/****** md5 signature: ed85b8e4697abef3f4bdbc503427bc64 ******/
		%feature("compactdefaultargs") ReadInteger;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: str

Return
-------
val: int

Description
-----------
Reads an Integer value designated by PC The method Current designates the current parameter and advances the Current Number by one after reading Note that if a count (not 1) is given, it is ignored If it is not an Integer, fills Check with a Fail (using mess) and returns False.
") ReadInteger;
		Standard_Boolean ReadInteger(const IGESData_ParamCursor & PC, Standard_CString mess, Standard_Integer &OutValue);

		/****** IGESData_ParamReader::ReadInts ******/
		/****** md5 signature: 31cf4defba66a66fd688e116606f5f9e ******/
		%feature("compactdefaultargs") ReadInts;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
amsg: Message_Msg
val: TColStd_HArray1OfInteger
index: int (optional, default to 1)

Return
-------
bool

Description
-----------
No available documentation.
") ReadInts;
		Standard_Boolean ReadInts(const IGESData_ParamCursor & PC, const Message_Msg & amsg, opencascade::handle<TColStd_HArray1OfInteger> & val, const Standard_Integer index = 1);

		/****** IGESData_ParamReader::ReadInts ******/
		/****** md5 signature: cb2250cec74ccc0dc67e08c3af09b5a3 ******/
		%feature("compactdefaultargs") ReadInts;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: str
val: TColStd_HArray1OfInteger
index: int (optional, default to 1)

Return
-------
bool

Description
-----------
Reads a list of Integer values, defined by PC (with a count of parameters). PC can start from Current Number and command it to advance after reading (use method CurrentList to do this) The list is given as a HArray1, numered from 'index' If all params are not Integer, Check is filled (using mess) and return value is False.
") ReadInts;
		Standard_Boolean ReadInts(const IGESData_ParamCursor & PC, Standard_CString mess, opencascade::handle<TColStd_HArray1OfInteger> & val, const Standard_Integer index = 1);

		/****** IGESData_ParamReader::ReadReal ******/
		/****** md5 signature: c82333f3d5ddad52fc0fae29e9ff5ea1 ******/
		%feature("compactdefaultargs") ReadReal;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor

Return
-------
val: float

Description
-----------
No available documentation.
") ReadReal;
		Standard_Boolean ReadReal(const IGESData_ParamCursor & PC, Standard_Real &OutValue);

		/****** IGESData_ParamReader::ReadReal ******/
		/****** md5 signature: c3a01ade61f69894a1059017f0b4ccb2 ******/
		%feature("compactdefaultargs") ReadReal;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: str

Return
-------
val: float

Description
-----------
Reads a Real value from parameter 'num' An Integer is accepted (Check is filled with a Warning message) and causes return to be True (as normal case) In other cases, Check is filled with a Fail and return is False.
") ReadReal;
		Standard_Boolean ReadReal(const IGESData_ParamCursor & PC, Standard_CString mess, Standard_Real &OutValue);

		/****** IGESData_ParamReader::ReadReals ******/
		/****** md5 signature: 966afe503c7f3736d9516f71c49612ff ******/
		%feature("compactdefaultargs") ReadReals;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
amsg: Message_Msg
val: TColStd_HArray1OfReal
index: int (optional, default to 1)

Return
-------
bool

Description
-----------
No available documentation.
") ReadReals;
		Standard_Boolean ReadReals(const IGESData_ParamCursor & PC, Message_Msg & amsg, opencascade::handle<TColStd_HArray1OfReal> & val, const Standard_Integer index = 1);

		/****** IGESData_ParamReader::ReadReals ******/
		/****** md5 signature: 0835badf4556bfe7269fbf0ff953e502 ******/
		%feature("compactdefaultargs") ReadReals;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: str
val: TColStd_HArray1OfReal
index: int (optional, default to 1)

Return
-------
bool

Description
-----------
Reads a list of Real values defined by PC Same conditions as for ReadInts, for PC and index An Integer parameter is accepted, if at least one parameter is Integer, Check is filled with a 'Warning' message If all params are neither Real nor Integer, Check is filled (using mess) and return value is False.
") ReadReals;
		Standard_Boolean ReadReals(const IGESData_ParamCursor & PC, Standard_CString mess, opencascade::handle<TColStd_HArray1OfReal> & val, const Standard_Integer index = 1);

		/****** IGESData_ParamReader::ReadText ******/
		/****** md5 signature: e6c8b0b8fb6d1cf4fafe20a1632d5ec8 ******/
		%feature("compactdefaultargs") ReadText;
		%feature("autodoc", "
Parameters
----------
thePC: IGESData_ParamCursor
theMsg: Message_Msg

Return
-------
theVal: TCollection_HAsciiString

Description
-----------
No available documentation.
") ReadText;
		Standard_Boolean ReadText(const IGESData_ParamCursor & thePC, const Message_Msg & theMsg, opencascade::handle<TCollection_HAsciiString> &OutValue);

		/****** IGESData_ParamReader::ReadText ******/
		/****** md5 signature: 583adf171adc696820aae6403d5703c0 ******/
		%feature("compactdefaultargs") ReadText;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: str

Return
-------
val: TCollection_HAsciiString

Description
-----------
Reads a Text value from parameter 'num', as a String from Collection, that is, Hollerith text without leading 'nnnH' If it is not a String, fills Check with a Fail (using mess) and returns False.
") ReadText;
		Standard_Boolean ReadText(const IGESData_ParamCursor & PC, Standard_CString mess, opencascade::handle<TCollection_HAsciiString> &OutValue);

		/****** IGESData_ParamReader::ReadTexts ******/
		/****** md5 signature: c6a37e5e63bf6ab8b99c9480e131fa17 ******/
		%feature("compactdefaultargs") ReadTexts;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
amsg: Message_Msg
val: Interface_HArray1OfHAsciiString
index: int (optional, default to 1)

Return
-------
bool

Description
-----------
No available documentation.
") ReadTexts;
		Standard_Boolean ReadTexts(const IGESData_ParamCursor & PC, const Message_Msg & amsg, opencascade::handle<Interface_HArray1OfHAsciiString> & val, const Standard_Integer index = 1);

		/****** IGESData_ParamReader::ReadTexts ******/
		/****** md5 signature: 7fc90df81fea9b3334c6a5fb05b22910 ******/
		%feature("compactdefaultargs") ReadTexts;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: str
val: Interface_HArray1OfHAsciiString
index: int (optional, default to 1)

Return
-------
bool

Description
-----------
Reads a list of Hollerith Texts, defined by PC Texts are read as Hollerith texts without leading 'nnnH' Same conditions as for ReadInts, for PC and index If all params are not Text, Check is filled (using mess) and return value is False.
") ReadTexts;
		Standard_Boolean ReadTexts(const IGESData_ParamCursor & PC, Standard_CString mess, opencascade::handle<Interface_HArray1OfHAsciiString> & val, const Standard_Integer index = 1);

		/****** IGESData_ParamReader::ReadXY ******/
		/****** md5 signature: f1f930720d20b00d8163c922eb48a7cf ******/
		%feature("compactdefaultargs") ReadXY;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
amsg: Message_Msg
val: gp_XY

Return
-------
bool

Description
-----------
No available documentation.
") ReadXY;
		Standard_Boolean ReadXY(const IGESData_ParamCursor & PC, Message_Msg & amsg, gp_XY & val);

		/****** IGESData_ParamReader::ReadXY ******/
		/****** md5 signature: 6992ef4100793f541a2652734a6e22f8 ******/
		%feature("compactdefaultargs") ReadXY;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: str
val: gp_XY

Return
-------
bool

Description
-----------
Reads a couple of Real values (X,Y) from parameter 'num' Integers are accepted (Check is filled with a Warning message) and cause return to be True (as normal case) In other cases, Check is filled with a Fail and return is False.
") ReadXY;
		Standard_Boolean ReadXY(const IGESData_ParamCursor & PC, Standard_CString mess, gp_XY & val);

		/****** IGESData_ParamReader::ReadXYZ ******/
		/****** md5 signature: e1f260ccc2a99b486835f0bbaf9490d4 ******/
		%feature("compactdefaultargs") ReadXYZ;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
amsg: Message_Msg
val: gp_XYZ

Return
-------
bool

Description
-----------
No available documentation.
") ReadXYZ;
		Standard_Boolean ReadXYZ(const IGESData_ParamCursor & PC, Message_Msg & amsg, gp_XYZ & val);

		/****** IGESData_ParamReader::ReadXYZ ******/
		/****** md5 signature: 15aa066c60d71f3df435929b7aa189a4 ******/
		%feature("compactdefaultargs") ReadXYZ;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: str
val: gp_XYZ

Return
-------
bool

Description
-----------
Reads a triplet of Real values (X,Y,Z) from parameter 'num' Integers are accepted (Check is filled with a Warning message) and cause return to be True (as normal case) In other cases, Check is filled with a Fail and return is False For Message.
") ReadXYZ;
		Standard_Boolean ReadXYZ(const IGESData_ParamCursor & PC, Standard_CString mess, gp_XYZ & val);

		/****** IGESData_ParamReader::ReadingEntityNumber ******/
		/****** md5 signature: 92704ecd65c2acb93d1b95eb5695d76c ******/
		%feature("compactdefaultargs") ReadingEntityNumber;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
val: int

Description
-----------
No available documentation.
") ReadingEntityNumber;
		Standard_Boolean ReadingEntityNumber(const Standard_Integer num, Standard_Integer &OutValue);

		/****** IGESData_ParamReader::ReadingEntityNumber ******/
		/****** md5 signature: 5d198f71dec6dc01baf2a876d8d0029b ******/
		%feature("compactdefaultargs") ReadingEntityNumber;
		%feature("autodoc", "
Parameters
----------
num: int
mess: str

Return
-------
val: int

Description
-----------
Routine which reads an Entity Number (which allows to read the Entity in the IGESReaderData by BoundEntity), given its number in the list of Parameters Same conditions as ReadEntity for mess, val, and return value In particular, returns True and val to zero means Null Entity, and val not zero means Entity read by BoundEntity.
") ReadingEntityNumber;
		Standard_Boolean ReadingEntityNumber(const Standard_Integer num, Standard_CString mess, Standard_Integer &OutValue);

		/****** IGESData_ParamReader::ReadingReal ******/
		/****** md5 signature: 1acc3f6abf688d2d1b7f455b5f35fd08 ******/
		%feature("compactdefaultargs") ReadingReal;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
val: float

Description
-----------
No available documentation.
") ReadingReal;
		Standard_Boolean ReadingReal(const Standard_Integer num, Standard_Real &OutValue);

		/****** IGESData_ParamReader::ReadingReal ******/
		/****** md5 signature: 3a9bac57a6845f06ca42b63580735416 ******/
		%feature("compactdefaultargs") ReadingReal;
		%feature("autodoc", "
Parameters
----------
num: int
mess: str

Return
-------
val: float

Description
-----------
Routine which reads a Real parameter, given its number Same conditions as ReadReal for mess, val, and return value.
") ReadingReal;
		Standard_Boolean ReadingReal(const Standard_Integer num, Standard_CString mess, Standard_Real &OutValue);

		/****** IGESData_ParamReader::SendFail ******/
		/****** md5 signature: 1eab4e53649e1a16e12a6f58bd826f30 ******/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "
Parameters
----------
amsg: Message_Msg

Return
-------
None

Description
-----------
No available documentation.
") SendFail;
		void SendFail(const Message_Msg & amsg);

		/****** IGESData_ParamReader::SendWarning ******/
		/****** md5 signature: 7a784110763f5a191de87e4b30b0324e ******/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "
Parameters
----------
amsg: Message_Msg

Return
-------
None

Description
-----------
No available documentation.
") SendWarning;
		void SendWarning(const Message_Msg & amsg);

		/****** IGESData_ParamReader::SetCurrentNumber ******/
		/****** md5 signature: cfd60e21d3b8d6b90fbe9763df1e8c6f ******/
		%feature("compactdefaultargs") SetCurrentNumber;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
None

Description
-----------
sets current parameter number to a new value must be done at end of each step: set on first parameter following last read one; is done by some Read... methods (must be done directly if these method are not used) num greater than NbParams means that following lists are empty If current num is not managed, it remains at 1, which probably will cause error when successive steps of reading are made.
") SetCurrentNumber;
		void SetCurrentNumber(const Standard_Integer num);

		/****** IGESData_ParamReader::Stage ******/
		/****** md5 signature: f26299ac744ccb6ad00be1e60a3fc3f6 ******/
		%feature("compactdefaultargs") Stage;
		%feature("autodoc", "Return
-------
IGESData_ReadStage

Description
-----------
gives current stage (Own-Props-Assocs-End, begins at Own).
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
		/****** IGESData_Protocol::IGESData_Protocol ******/
		/****** md5 signature: c9d8b242f6243d2610fe1d2b6216e77e ******/
		%feature("compactdefaultargs") IGESData_Protocol;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IGESData_Protocol;
		 IGESData_Protocol();

		/****** IGESData_Protocol::IsSuitableModel ******/
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
Returns True if <model> is a Model of IGES Norm.
") IsSuitableModel;
		Standard_Boolean IsSuitableModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IGESData_Protocol::IsUnknownEntity ******/
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

		/****** IGESData_Protocol::NbResources ******/
		/****** md5 signature: e09215dfaa5a4c92d70662499182122c ******/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the count of Resource Protocol. Here, none.
") NbResources;
		Standard_Integer NbResources();

		/****** IGESData_Protocol::NewModel ******/
		/****** md5 signature: 91513f9ebe9e7d52eca2b6b58f6b9b0a ******/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Creates an empty Model for IGES Norm.
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****** IGESData_Protocol::Resource ******/
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

		/****** IGESData_Protocol::TypeNumber ******/
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
Returns a Case Number, specific of each recognized Type Here, Undefined and Free Format Entities have the Number 1.
") TypeNumber;
		Standard_Integer TypeNumber(const opencascade::handle<Standard_Type> & atype);

		/****** IGESData_Protocol::UnknownEntity ******/
		/****** md5 signature: 201f936eaa0d5d272733a19cbe8e2fa3 ******/
		%feature("compactdefaultargs") UnknownEntity;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Creates a new Unknown Entity for IGES (UndefinedEntity).
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
		/****** IGESData_ReadWriteModule::CaseIGES ******/
		/****** md5 signature: 50a4ff4f6d600f478137a6aa68e47abb ******/
		%feature("compactdefaultargs") CaseIGES;
		%feature("autodoc", "
Parameters
----------
typenum: int
formnum: int

Return
-------
int

Description
-----------
Defines Case Numbers corresponding to the Entity Types taken into account by a sub-class of ReadWriteModule (hence, each sub-class of ReadWriteModule has to redefine this method) Called by CaseNum. Its result will then be used to call Read, etc ...
") CaseIGES;
		virtual Standard_Integer CaseIGES(const Standard_Integer typenum, const Standard_Integer formnum);

		/****** IGESData_ReadWriteModule::CaseNum ******/
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
Translates the Type of record <num> in <data> to a positive Case Number, or 0 if failed. Works with IGESReaderData which provides Type & Form Numbers, and calls CaseIGES (see below).
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Interface_FileReaderData> & data, const Standard_Integer num);

		/****** IGESData_ReadWriteModule::Read ******/
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
General Read Function. See IGESReaderTool for more info.
") Read;
		void Read(const Standard_Integer CN, const opencascade::handle<Interface_FileReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<Standard_Transient> & ent);

		/****** IGESData_ReadWriteModule::ReadOwnParams ******/
		/****** md5 signature: 44dfe59dc57956979a96c9a23fbaa660 ******/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: IGESData_IGESEntity
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Return
-------
None

Description
-----------
Reads own parameters from file for an Entity; <PR> gives access to them, <IR> detains parameter types and values For each class, there must be a specific action provided Note that Properties and Associativities Lists are Read by specific methods (see below), they are called under control of reading process (only one call) according Stage recorded in ParamReader.
") ReadOwnParams;
		virtual void ReadOwnParams(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****** IGESData_ReadWriteModule::WriteOwnParams ******/
		/****** md5 signature: dba319f8f44c1bd48f0c908dfc0b5313 ******/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: IGESData_IGESEntity
IW: IGESData_IGESWriter

Return
-------
None

Description
-----------
Writes own parameters to IGESWriter; defined for each class (to be redefined for other IGES ReadWriteModules) Warning: Properties and Associativities are directly managed by WriteIGES, must not be sent by this method.
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
		/****** IGESData_SpecificLib::IGESData_SpecificLib ******/
		/****** md5 signature: a7059173e151f23c878086fdecb5b8a7 ******/
		%feature("compactdefaultargs") IGESData_SpecificLib;
		%feature("autodoc", "
Parameters
----------
aprotocol: IGESData_Protocol

Return
-------
None

Description
-----------
Creates a Library which complies with a Protocol, that is: Same class (criterium IsInstance) This creation gets the Modules from the global set, those which are bound to the given Protocol and its Resources.
") IGESData_SpecificLib;
		 IGESData_SpecificLib(const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****** IGESData_SpecificLib::IGESData_SpecificLib ******/
		/****** md5 signature: eaac57946eaef8795d7b680b301228af ******/
		%feature("compactdefaultargs") IGESData_SpecificLib;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty Library: it will later by filled by method AddProtocol.
") IGESData_SpecificLib;
		 IGESData_SpecificLib();

		/****** IGESData_SpecificLib::AddProtocol ******/
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

		/****** IGESData_SpecificLib::Clear ******/
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

		/****** IGESData_SpecificLib::Module ******/
		/****** md5 signature: 94fb463336d8c4fc0b6073746099eaef ******/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_SpecificModule>

Description
-----------
Returns the current Module in the Iteration.
") Module;
		const opencascade::handle<IGESData_SpecificModule> & Module();

		/****** IGESData_SpecificLib::More ******/
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

		/****** IGESData_SpecificLib::Next ******/
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

		/****** IGESData_SpecificLib::Protocol ******/
		/****** md5 signature: 4eb07a48dbfd452cf11a527b6ce5309c ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_Protocol>

Description
-----------
Returns the current Protocol in the Iteration.
") Protocol;
		const opencascade::handle<IGESData_Protocol> & Protocol();

		/****** IGESData_SpecificLib::Select ******/
		/****** md5 signature: df7326180c9347987eb759b269019ddf ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
obj: IGESData_IGESEntity
module: IGESData_SpecificModule

Return
-------
CN: int

Description
-----------
Selects a Module from the Library, given an Object. Returns True if Select has succeeded, False else. Also Returns (as arguments) the selected Module and the Case Number determined by the associated Protocol. If Select has failed, <module> is Null Handle and CN is zero. (Select can work on any criterium, such as Object DynamicType).
") Select;
		Standard_Boolean Select(const opencascade::handle<IGESData_IGESEntity> & obj, opencascade::handle<IGESData_SpecificModule> & module, Standard_Integer &OutValue);

		/****** IGESData_SpecificLib::SetComplete ******/
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

		/****** IGESData_SpecificLib::SetGlobal ******/
		/****** md5 signature: 0e2ec242b36444b7772d81a17c1ab013 ******/
		%feature("compactdefaultargs") SetGlobal;
		%feature("autodoc", "
Parameters
----------
amodule: IGESData_SpecificModule
aprotocol: IGESData_Protocol

Return
-------
None

Description
-----------
Adds a couple (Module-Protocol) into the global definition set for this class of Library.
") SetGlobal;
		static void SetGlobal(const opencascade::handle<IGESData_SpecificModule> & amodule, const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****** IGESData_SpecificLib::Start ******/
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
		/****** IGESData_SpecificModule::OwnCorrect ******/
		/****** md5 signature: dcc0d76987465f3f21f4ad244d5059ed ******/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Specific Automatic Correction on own Parameters of an Entity. It works by setting in accordance redundant data, if there are when there is no ambiguity (else, it does nothing). Remark that classic Corrections on Directory Entry (to set void data) are taken into account alsewhere. //! For instance, many 'Associativity Entities' have a Number of Properties which must have a fixed value. Or, a ConicalArc has its Form Number which records the kind of Conic, also determined from its coefficients But, a CircularArc of which Distances (Center-Start) and (Center-End) are not equal cannot be corrected ... //! Returns True if something has been corrected in <ent> By default, does nothing. If at least one of the Types processed by a sub-class of SpecificModule has a Correct procedure attached, this method can be redefined.
") OwnCorrect;
		virtual Standard_Boolean OwnCorrect(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_SpecificModule::OwnDump ******/
		/****** md5 signature: f276487f02d27b508cdd766536f98d29 ******/
		%feature("compactdefaultargs") OwnDump;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: IGESData_IGESEntity
dumper: IGESData_IGESDumper
own: int

Return
-------
S: Standard_OStream

Description
-----------
Specific Dump for each type of IGES Entity: it concerns only own parameters, the general data (Directory Part, Lists) are taken into account by the IGESDumper See class IGESDumper for the rules to follow for <own> and <attached> level.
") OwnDump;
		virtual void OwnDump(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const IGESData_IGESDumper & dumper, std::ostream &OutValue, const Standard_Integer own);

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
		/****** IGESData_ToolLocation::IGESData_ToolLocation ******/
		/****** md5 signature: ece0883a0ffc681b36aed917904c13d5 ******/
		%feature("compactdefaultargs") IGESData_ToolLocation;
		%feature("autodoc", "
Parameters
----------
amodel: IGESData_IGESModel
protocol: IGESData_Protocol

Return
-------
None

Description
-----------
Creates a ToolLocation on a given Model, filled with the help of a Protocol (which allows to known Entities referenced by other ones).
") IGESData_ToolLocation;
		 IGESData_ToolLocation(const opencascade::handle<IGESData_IGESModel> & amodel, const opencascade::handle<IGESData_Protocol> & protocol);

		/****** IGESData_ToolLocation::AnalyseLocation ******/
		/****** md5 signature: 6505b52510f29496969bb2c34879f238 ******/
		%feature("compactdefaultargs") AnalyseLocation;
		%feature("autodoc", "
Parameters
----------
loc: gp_GTrsf
result: gp_Trsf

Return
-------
bool

Description
-----------
Analysis a Location given as a GTrsf, by trying to convert it to a Trsf (i.e. to a True Location of which effect is described by an Isometry or a Similarity) Works with the Precision given by default or by SetPrecision Calls ConvertLocation (see below).
") AnalyseLocation;
		Standard_Boolean AnalyseLocation(const gp_GTrsf & loc, gp_Trsf & result);

		/****** IGESData_ToolLocation::ConvertLocation ******/
		/****** md5 signature: d88a9351c35f05028c597b1f49d4a449 ******/
		%feature("compactdefaultargs") ConvertLocation;
		%feature("autodoc", "
Parameters
----------
prec: float
loc: gp_GTrsf
result: gp_Trsf
uni: float (optional, default to 1)

Return
-------
bool

Description
-----------
Conversion of a Location, from GTrsf form to Trsf form Works with a precision given as argument. Returns True if the Conversion is possible, (hence, <result> contains the converted location), False else <unit>, if given, indicates the unit in which <loc> is defined in meters. It concerns the translation part (to be converted. //! As a class method, it can be called separately.
") ConvertLocation;
		static Standard_Boolean ConvertLocation(const Standard_Real prec, const gp_GTrsf & loc, gp_Trsf & result, const Standard_Real uni = 1);

		/****** IGESData_ToolLocation::EffectiveLocation ******/
		/****** md5 signature: 965dc7c24b463a3ac115960ff1f244e4 ******/
		%feature("compactdefaultargs") EffectiveLocation;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
gp_GTrsf

Description
-----------
Returns the effective Location of an Entity, i.e. the composition of its proper Transformation Matrix (returned by Transf) and its Parent's Location (returned by ParentLocation).
") EffectiveLocation;
		gp_GTrsf EffectiveLocation(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_ToolLocation::ExplicitLocation ******/
		/****** md5 signature: e97e2a7d450ddca9a19653467259777b ******/
		%feature("compactdefaultargs") ExplicitLocation;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
gp_GTrsf

Description
-----------
Returns the Explicit Location defined by the Transformation Matrix of <ent>. Identity if there is none.
") ExplicitLocation;
		gp_GTrsf ExplicitLocation(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_ToolLocation::HasParent ******/
		/****** md5 signature: 30278e3ba06a09dd6b9664cce0877575 ******/
		%feature("compactdefaultargs") HasParent;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Returns True if <ent> is dependent from one and only one other Entity, either by Reference or by Associativity.
") HasParent;
		Standard_Boolean HasParent(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_ToolLocation::HasParentByAssociativity ******/
		/****** md5 signature: f3a27ae5d42b5e162098b70e7138bf62 ******/
		%feature("compactdefaultargs") HasParentByAssociativity;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Returns True if the Parent, if there is one, is defined by a SingleParentEntity Associativity Else, if HasParent is True, it is by Reference.
") HasParentByAssociativity;
		Standard_Boolean HasParentByAssociativity(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_ToolLocation::HasTransf ******/
		/****** md5 signature: 4328fae714f2eb51054b9fa9feb3e9a0 ******/
		%feature("compactdefaultargs") HasTransf;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Returns True if <ent> has a Transformation Matrix in proper (referenced from its Directory Part).
") HasTransf;
		Standard_Boolean HasTransf(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_ToolLocation::IsAmbiguous ******/
		/****** md5 signature: a142ade04a303f2a2924927f9be83a32 ******/
		%feature("compactdefaultargs") IsAmbiguous;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Returns True if more than one Parent has been determined for <ent>, by adding direct References and Associativities.
") IsAmbiguous;
		Standard_Boolean IsAmbiguous(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_ToolLocation::IsAssociativity ******/
		/****** md5 signature: df8bd2dde6b978364168767639fb635c ******/
		%feature("compactdefaultargs") IsAssociativity;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Returns True if <ent> is an Associativity (IGES Type 402). Then, Location does not apply.
") IsAssociativity;
		Standard_Boolean IsAssociativity(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_ToolLocation::IsTransf ******/
		/****** md5 signature: 4093feb571ae01012954d808e107de69 ******/
		%feature("compactdefaultargs") IsTransf;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Returns True if <ent> is kind of TransfEntity. Then, it has no location, while it can be used to define a Location).
") IsTransf;
		Standard_Boolean IsTransf(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_ToolLocation::Load ******/
		/****** md5 signature: 14bc79a16a4ba0fe93224560bb579cb0 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Return
-------
None

Description
-----------
Does the effective work of determining Locations of Entities.
") Load;
		void Load();

		/****** IGESData_ToolLocation::Parent ******/
		/****** md5 signature: ec19156c2a24bfda13ba3ff5d16ce9f4 ******/
		%feature("compactdefaultargs") Parent;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
opencascade::handle<IGESData_IGESEntity>

Description
-----------
Returns the unique Parent recorded for <ent>. Returns a Null Handle if there is none.
") Parent;
		opencascade::handle<IGESData_IGESEntity> Parent(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_ToolLocation::ParentLocation ******/
		/****** md5 signature: 5bdd0fc0426312315187678d7df40176 ******/
		%feature("compactdefaultargs") ParentLocation;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
gp_GTrsf

Description
-----------
Returns the effective Location of the Parent of <ent>, if there is one: this Location is itself given as compound according dependences on the Parent, if there are some. Returns an Identity Transformation if no Parent is recorded.
") ParentLocation;
		gp_GTrsf ParentLocation(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_ToolLocation::ResetDependences ******/
		/****** md5 signature: 774125d1ea13a5a21a07551198018ad4 ******/
		%feature("compactdefaultargs") ResetDependences;
		%feature("autodoc", "
Parameters
----------
child: IGESData_IGESEntity

Return
-------
None

Description
-----------
Resets all information about dependences for <child>.
") ResetDependences;
		void ResetDependences(const opencascade::handle<IGESData_IGESEntity> & child);

		/****** IGESData_ToolLocation::SetOwnAsDependent ******/
		/****** md5 signature: 99cc09240fbab397bb91c194d3a0b6cc ******/
		%feature("compactdefaultargs") SetOwnAsDependent;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
None

Description
-----------
Unitary action which defines Entities referenced by <ent> (except those in Directory Part and Associativities List) as Dependent (their Locations are related to that of <ent>).
") SetOwnAsDependent;
		void SetOwnAsDependent(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_ToolLocation::SetParentAssoc ******/
		/****** md5 signature: 175fb9559c279edac7dd744e5b0cd95a ******/
		%feature("compactdefaultargs") SetParentAssoc;
		%feature("autodoc", "
Parameters
----------
parent: IGESData_IGESEntity
child: IGESData_IGESEntity

Return
-------
None

Description
-----------
Sets the 'Associativity' information for <child> as being <parent> (it must be the Parent itself, not the Associativity).
") SetParentAssoc;
		void SetParentAssoc(const opencascade::handle<IGESData_IGESEntity> & parent, const opencascade::handle<IGESData_IGESEntity> & child);

		/****** IGESData_ToolLocation::SetPrecision ******/
		/****** md5 signature: 683e72fa620702e8c921bb4783d3d0b5 ******/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "
Parameters
----------
prec: float

Return
-------
None

Description
-----------
Sets a precision for the Analysis of Locations (default by constructor is 1.E-05).
") SetPrecision;
		void SetPrecision(const Standard_Real prec);

		/****** IGESData_ToolLocation::SetReference ******/
		/****** md5 signature: ac648ca8ad4e0f9b9f0124f883b5ef65 ******/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "
Parameters
----------
parent: IGESData_IGESEntity
child: IGESData_IGESEntity

Return
-------
None

Description
-----------
Sets the 'Reference' information for <child> as being <parent> Sets an Error Status if already set (see method IsAmbiguous).
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
		/****** IGESData_WriterLib::IGESData_WriterLib ******/
		/****** md5 signature: c21f94cb0b4c664a5dafb888d5b7d5ae ******/
		%feature("compactdefaultargs") IGESData_WriterLib;
		%feature("autodoc", "
Parameters
----------
aprotocol: IGESData_Protocol

Return
-------
None

Description
-----------
Creates a Library which complies with a Protocol, that is: Same class (criterium IsInstance) This creation gets the Modules from the global set, those which are bound to the given Protocol and its Resources.
") IGESData_WriterLib;
		 IGESData_WriterLib(const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****** IGESData_WriterLib::IGESData_WriterLib ******/
		/****** md5 signature: 684ea18a7afd7f274a8f5320d3c82c04 ******/
		%feature("compactdefaultargs") IGESData_WriterLib;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty Library: it will later by filled by method AddProtocol.
") IGESData_WriterLib;
		 IGESData_WriterLib();

		/****** IGESData_WriterLib::AddProtocol ******/
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

		/****** IGESData_WriterLib::Clear ******/
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

		/****** IGESData_WriterLib::Module ******/
		/****** md5 signature: 620617849b7007bcf8f20d0e6d505c82 ******/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_ReadWriteModule>

Description
-----------
Returns the current Module in the Iteration.
") Module;
		const opencascade::handle<IGESData_ReadWriteModule> & Module();

		/****** IGESData_WriterLib::More ******/
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

		/****** IGESData_WriterLib::Next ******/
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

		/****** IGESData_WriterLib::Protocol ******/
		/****** md5 signature: 4eb07a48dbfd452cf11a527b6ce5309c ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_Protocol>

Description
-----------
Returns the current Protocol in the Iteration.
") Protocol;
		const opencascade::handle<IGESData_Protocol> & Protocol();

		/****** IGESData_WriterLib::Select ******/
		/****** md5 signature: 65d70c03516a734c5fb3f481de80f7aa ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
obj: IGESData_IGESEntity
module: IGESData_ReadWriteModule

Return
-------
CN: int

Description
-----------
Selects a Module from the Library, given an Object. Returns True if Select has succeeded, False else. Also Returns (as arguments) the selected Module and the Case Number determined by the associated Protocol. If Select has failed, <module> is Null Handle and CN is zero. (Select can work on any criterium, such as Object DynamicType).
") Select;
		Standard_Boolean Select(const opencascade::handle<IGESData_IGESEntity> & obj, opencascade::handle<IGESData_ReadWriteModule> & module, Standard_Integer &OutValue);

		/****** IGESData_WriterLib::SetComplete ******/
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

		/****** IGESData_WriterLib::SetGlobal ******/
		/****** md5 signature: 1cd09dea33e22bc356df9507fb54941a ******/
		%feature("compactdefaultargs") SetGlobal;
		%feature("autodoc", "
Parameters
----------
amodule: IGESData_ReadWriteModule
aprotocol: IGESData_Protocol

Return
-------
None

Description
-----------
Adds a couple (Module-Protocol) into the global definition set for this class of Library.
") SetGlobal;
		static void SetGlobal(const opencascade::handle<IGESData_ReadWriteModule> & amodule, const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****** IGESData_WriterLib::Start ******/
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
		/****** IGESData_DefaultGeneral::IGESData_DefaultGeneral ******/
		/****** md5 signature: a94f4ee4970a0711e4ae58c36f4b32e9 ******/
		%feature("compactdefaultargs") IGESData_DefaultGeneral;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a DefaultGeneral and puts it into GeneralLib, bound with a Protocol from IGESData.
") IGESData_DefaultGeneral;
		 IGESData_DefaultGeneral();

		/****** IGESData_DefaultGeneral::DirChecker ******/
		/****** md5 signature: 06ffbfa1e4d88543cc06fdf7c67993ee ******/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: IGESData_IGESEntity

Return
-------
IGESData_DirChecker

Description
-----------
Returns a DirChecker, specific for each type of Entity Here, Returns an empty DirChecker (no constraint to check).
") DirChecker;
		IGESData_DirChecker DirChecker(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_DefaultGeneral::NewVoid ******/
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
Specific creation of a new void entity (UndefinedEntity only).
") NewVoid;
		Standard_Boolean NewVoid(const Standard_Integer CN, opencascade::handle<Standard_Transient> & entto);

		/****** IGESData_DefaultGeneral::OwnCheckCase ******/
		/****** md5 signature: a04fd9a5e3c5ef0e136832f7ce57363b ******/
		%feature("compactdefaultargs") OwnCheckCase;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: IGESData_IGESEntity
shares: Interface_ShareTool
ach: Interface_Check

Return
-------
None

Description
-----------
Performs Specific Semantic Check for each type of Entity Here, does nothing (no constraint to check).
") OwnCheckCase;
		void OwnCheckCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****** IGESData_DefaultGeneral::OwnCopyCase ******/
		/****** md5 signature: 5c0289b7b5a5ec08bef5e9dac3d445b7 ******/
		%feature("compactdefaultargs") OwnCopyCase;
		%feature("autodoc", "
Parameters
----------
CN: int
entfrom: IGESData_IGESEntity
entto: IGESData_IGESEntity
TC: Interface_CopyTool

Return
-------
None

Description
-----------
Copies parameters which are specific of each Type of Entity.
") OwnCopyCase;
		void OwnCopyCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & entfrom, const opencascade::handle<IGESData_IGESEntity> & entto, Interface_CopyTool & TC);

		/****** IGESData_DefaultGeneral::OwnSharedCase ******/
		/****** md5 signature: 1d978dfb0f38035ed4292cc342ee187f ******/
		%feature("compactdefaultargs") OwnSharedCase;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: IGESData_IGESEntity
iter: Interface_EntityIterator

Return
-------
None

Description
-----------
Lists the Entities shared by an IGESEntity, which must be an UndefinedEntity.
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
		/****** IGESData_DefaultSpecific::IGESData_DefaultSpecific ******/
		/****** md5 signature: 0f716d41251483626d473ea28d4f5afd ******/
		%feature("compactdefaultargs") IGESData_DefaultSpecific;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a DefaultSpecific and puts it into SpecificLib.
") IGESData_DefaultSpecific;
		 IGESData_DefaultSpecific();

		/****** IGESData_DefaultSpecific::OwnDump ******/
		/****** md5 signature: 97551005b4180a704e712d2024f870d6 ******/
		%feature("compactdefaultargs") OwnDump;
		%feature("autodoc", "
Parameters
----------
CN: int
ent: IGESData_IGESEntity
dumper: IGESData_IGESDumper
own: int

Return
-------
S: Standard_OStream

Description
-----------
Specific Dump for UndefinedEntity: it concerns only own parameters, the general data (Directory Part, Lists) are taken into account by the IGESDumper.
") OwnDump;
		void OwnDump(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const IGESData_IGESDumper & dumper, std::ostream &OutValue, const Standard_Integer own);

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
		/****** IGESData_FileProtocol::IGESData_FileProtocol ******/
		/****** md5 signature: 93aa4dce9a32d30c245626eca2a8b96d ******/
		%feature("compactdefaultargs") IGESData_FileProtocol;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty FileProtocol.
") IGESData_FileProtocol;
		 IGESData_FileProtocol();

		/****** IGESData_FileProtocol::Add ******/
		/****** md5 signature: d602e73c6588ce70faab49ca1972f0ef ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
protocol: IGESData_Protocol

Return
-------
None

Description
-----------
Adds a resource.
") Add;
		void Add(const opencascade::handle<IGESData_Protocol> & protocol);

		/****** IGESData_FileProtocol::NbResources ******/
		/****** md5 signature: cd524335b33aeb6eb83cc80f6b7e5681 ******/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the count of Resources: the count of Added Protocols.
") NbResources;
		virtual Standard_Integer NbResources();

		/****** IGESData_FileProtocol::Resource ******/
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
Returns a Resource, given a rank (rank of call to Add).
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
		/****** IGESData_LevelListEntity::HasLevelNumber ******/
		/****** md5 signature: 6e3d8ae20cde014b025b6ec7a6e5ad6b ******/
		%feature("compactdefaultargs") HasLevelNumber;
		%feature("autodoc", "
Parameters
----------
level: int

Return
-------
bool

Description
-----------
returns True if <level> is in the list.
") HasLevelNumber;
		Standard_Boolean HasLevelNumber(const Standard_Integer level);

		/****** IGESData_LevelListEntity::LevelNumber ******/
		/****** md5 signature: 728f6d613b520c606432617960e507a1 ******/
		%feature("compactdefaultargs") LevelNumber;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
returns the Level Number of <self>, indicated by <num> raises an exception if num is out of range.
") LevelNumber;
		virtual Standard_Integer LevelNumber(const Standard_Integer num);

		/****** IGESData_LevelListEntity::NbLevelNumbers ******/
		/****** md5 signature: 13d01bd3d60c42f0f5f0bf6fa6dbd1f8 ******/
		%feature("compactdefaultargs") NbLevelNumbers;
		%feature("autodoc", "Return
-------
int

Description
-----------
Must return the count of levels.
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
		/****** IGESData_NameEntity::Value ******/
		/****** md5 signature: 3efab42b0037f36f7bde757d1863aedc ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Retyrns the alphanumeric value of the Name, to be defined.
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
		/****** IGESData_SingleParentEntity::Child ******/
		/****** md5 signature: f17b0c264f47f8eb24c6a5a5648863ab ******/
		%feature("compactdefaultargs") Child;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<IGESData_IGESEntity>

Description
-----------
Returns a Child given its rank.
") Child;
		virtual opencascade::handle<IGESData_IGESEntity> Child(const Standard_Integer num);

		/****** IGESData_SingleParentEntity::NbChildren ******/
		/****** md5 signature: 175590d729766ac75534fc460a0217e1 ******/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of Entities designated as children.
") NbChildren;
		virtual Standard_Integer NbChildren();

		/****** IGESData_SingleParentEntity::SingleParent ******/
		/****** md5 signature: c5750f38b3582e3eed3080b9d08558eb ******/
		%feature("compactdefaultargs") SingleParent;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_IGESEntity>

Description
-----------
Returns the parent designated by the Entity, if only one !.
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
		/****** IGESData_TransfEntity::Value ******/
		/****** md5 signature: 7b00c4ce969aa987b88144c321b31cee ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_GTrsf

Description
-----------
gives value of the transformation, as a GTrsf To be defined by an effective class of Transformation Entity Warning: Must take in account Composition: if a TransfEntity has in its Directory Part, a Transf, this means that it is Compound, Value must return the global result.
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
		/****** IGESData_UndefinedEntity::IGESData_UndefinedEntity ******/
		/****** md5 signature: 341bc31d84cbf3490a6fff24866c14a6 ******/
		%feature("compactdefaultargs") IGESData_UndefinedEntity;
		%feature("autodoc", "Return
-------
None

Description
-----------
creates an unknown entity.
") IGESData_UndefinedEntity;
		 IGESData_UndefinedEntity();

		/****** IGESData_UndefinedEntity::ChangeableContent ******/
		/****** md5 signature: 1ab17b154aa704fa87d1bc1350a96a4d ******/
		%feature("compactdefaultargs") ChangeableContent;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_UndefinedContent>

Description
-----------
Returns own data as an UndefinedContent, in order to touch it.
") ChangeableContent;
		opencascade::handle<Interface_UndefinedContent> ChangeableContent();

		/****** IGESData_UndefinedEntity::DefColor ******/
		/****** md5 signature: df729d36a6c3bd6dbdb73c772781dd7f ******/
		%feature("compactdefaultargs") DefColor;
		%feature("autodoc", "Return
-------
IGESData_DefType

Description
-----------
returns Error status if necessary, else calls original method.
") DefColor;
		virtual IGESData_DefType DefColor();

		/****** IGESData_UndefinedEntity::DefLevel ******/
		/****** md5 signature: 24ebb34e7ce3d30f47be96247f29f837 ******/
		%feature("compactdefaultargs") DefLevel;
		%feature("autodoc", "Return
-------
IGESData_DefList

Description
-----------
returns Error status if necessary, else calls original method.
") DefLevel;
		virtual IGESData_DefList DefLevel();

		/****** IGESData_UndefinedEntity::DefLineFont ******/
		/****** md5 signature: bd07b091f1c06c07442342350e34d6d9 ******/
		%feature("compactdefaultargs") DefLineFont;
		%feature("autodoc", "Return
-------
IGESData_DefType

Description
-----------
returns Error status if necessary, else calls original method.
") DefLineFont;
		virtual IGESData_DefType DefLineFont();

		/****** IGESData_UndefinedEntity::DefView ******/
		/****** md5 signature: 2be876ab214cfa81805ee5f9bd3ebbfc ******/
		%feature("compactdefaultargs") DefView;
		%feature("autodoc", "Return
-------
IGESData_DefList

Description
-----------
returns Error status if necessary, else calls original method.
") DefView;
		virtual IGESData_DefList DefView();

		/****** IGESData_UndefinedEntity::DirStatus ******/
		/****** md5 signature: 09f6e73726397b9acbdef9af756fd13e ******/
		%feature("compactdefaultargs") DirStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns Directory Error Status (used for Copy).
") DirStatus;
		Standard_Integer DirStatus();

		/****** IGESData_UndefinedEntity::HasSubScriptNumber ******/
		/****** md5 signature: 89e5a77782c6a371cdd21bbe6a8912f6 ******/
		%feature("compactdefaultargs") HasSubScriptNumber;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns Error status if necessary, else calls original method (that is, if SubScript field is not blank or positive integer).
") HasSubScriptNumber;
		virtual Standard_Boolean HasSubScriptNumber();

		/****** IGESData_UndefinedEntity::IsOKDirPart ******/
		/****** md5 signature: a586de71abb9fa9ce3a5bd71ddb254bb ******/
		%feature("compactdefaultargs") IsOKDirPart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
says if DirPart is OK or not (if not, it is erroneous) Note that if it is not, Def* methods can return Error status.
") IsOKDirPart;
		Standard_Boolean IsOKDirPart();

		/****** IGESData_UndefinedEntity::ReadDir ******/
		/****** md5 signature: ac4bd3e7c6284d9c7a7b30a00439fc9b ******/
		%feature("compactdefaultargs") ReadDir;
		%feature("autodoc", "
Parameters
----------
IR: IGESData_IGESReaderData
DP: IGESData_DirPart
ach: Interface_Check

Return
-------
bool

Description
-----------
Computes the Directory Error Status, to be called before standard ReadDir from IGESReaderTool Returns True if OK (hence, Directory can be loaded), Else returns False and the DirPart <DP> is modified (hence, Directory Error Status is non null; and standard Read will work with an acceptable DirectoryPart).
") ReadDir;
		virtual Standard_Boolean ReadDir(const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_DirPart & DP, opencascade::handle<Interface_Check> & ach);

		/****** IGESData_UndefinedEntity::ReadOwnParams ******/
		/****** md5 signature: ce396b7c045c32fe23436ded438eff26 ******/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "
Parameters
----------
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Return
-------
None

Description
-----------
reads own parameters from file; PR gives access to them, IR detains parameter types and values Here, reads all parameters, integers are considered as entity reference unless they cannot be; no list interpretation No property or associativity list is managed.
") ReadOwnParams;
		virtual void ReadOwnParams(const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****** IGESData_UndefinedEntity::SetNewContent ******/
		/****** md5 signature: eca689e56e60de444eb442f8f0627c96 ******/
		%feature("compactdefaultargs") SetNewContent;
		%feature("autodoc", "
Parameters
----------
cont: Interface_UndefinedContent

Return
-------
None

Description
-----------
Redefines a completely new UndefinedContent Used by a Copy which begins by ShallowCopy, for instance.
") SetNewContent;
		void SetNewContent(const opencascade::handle<Interface_UndefinedContent> & cont);

		/****** IGESData_UndefinedEntity::SetOKDirPart ******/
		/****** md5 signature: a5e2936d6015e97c203cd061b97f693d ******/
		%feature("compactdefaultargs") SetOKDirPart;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erases the Directory Error Status Warning: Be sure that data are consistent to call this method ...
") SetOKDirPart;
		void SetOKDirPart();

		/****** IGESData_UndefinedEntity::UndefinedContent ******/
		/****** md5 signature: c3cd969c2461601a249f1babf934a5bb ******/
		%feature("compactdefaultargs") UndefinedContent;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_UndefinedContent>

Description
-----------
Returns own data as an UndefinedContent.
") UndefinedContent;
		opencascade::handle<Interface_UndefinedContent> UndefinedContent();

		/****** IGESData_UndefinedEntity::WriteOwnParams ******/
		/****** md5 signature: f5df84c0c628edcb5f80c0d02248159c ******/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "
Parameters
----------
IW: IGESData_IGESWriter

Return
-------
None

Description
-----------
writes parameters to IGESWriter, taken from UndefinedContent.
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
		/****** IGESData_ViewKindEntity::IsSingle ******/
		/****** md5 signature: c7535e12cfc5581af79774d2c5cc3b1f ******/
		%feature("compactdefaultargs") IsSingle;
		%feature("autodoc", "Return
-------
bool

Description
-----------
says if 'me' is a Single View (True) or a List of Views (False).
") IsSingle;
		virtual Standard_Boolean IsSingle();

		/****** IGESData_ViewKindEntity::NbViews ******/
		/****** md5 signature: 484337e5f6e276964761f5de8e14cb0e ******/
		%feature("compactdefaultargs") NbViews;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of Views for a List of Views. For a Single View, may return simply 1.
") NbViews;
		virtual Standard_Integer NbViews();

		/****** IGESData_ViewKindEntity::ViewItem ******/
		/****** md5 signature: 666e828a0dcb29cb2bfb10d85b5c7a20 ******/
		%feature("compactdefaultargs") ViewItem;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<IGESData_ViewKindEntity>

Description
-----------
Returns the View n0. <num> for a List of Views. For a Single Views, may return <self> itself.
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
		/****** IGESData_FreeFormatEntity::IGESData_FreeFormatEntity ******/
		/****** md5 signature: 96832e62fd6f997c1f9cd242a5729c17 ******/
		%feature("compactdefaultargs") IGESData_FreeFormatEntity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a completely empty FreeFormatEntity.
") IGESData_FreeFormatEntity;
		 IGESData_FreeFormatEntity();

		/****** IGESData_FreeFormatEntity::AddEntities ******/
		/****** md5 signature: 2722fcab00317dbfb6b14e0dbe4c3385 ******/
		%feature("compactdefaultargs") AddEntities;
		%feature("autodoc", "
Parameters
----------
ents: IGESData_HArray1OfIGESEntity

Return
-------
None

Description
-----------
Adds a set of Entities, given as a HArray1OfIGESEntity Causes creation of: an Integer Parameter which gives count of Entities, then the list of Entities of the Array Error if an Entity is not an IGESEntity All these Entities will be interpreted as 'Positive Pointers' by IGESWriter.
") AddEntities;
		void AddEntities(const opencascade::handle<IGESData_HArray1OfIGESEntity> & ents);

		/****** IGESData_FreeFormatEntity::AddEntity ******/
		/****** md5 signature: 3c8d5644ce8f5f33dcd64f56a87ee434 ******/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "
Parameters
----------
ptype: Interface_ParamType
ent: IGESData_IGESEntity
negative: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Adds a Parameter which references an Entity. If the Entity is Null, the added parameter will define a 'Null Pointer' (0) If <negative> is given True, this will command Sending to File (see IGESWriter) to produce a 'Negative Pointer' (Default is False).
") AddEntity;
		void AddEntity(const Interface_ParamType ptype, const opencascade::handle<IGESData_IGESEntity> & ent, const Standard_Boolean negative = Standard_False);

		/****** IGESData_FreeFormatEntity::AddLiteral ******/
		/****** md5 signature: 42c39aaae211ba3460d3b8849e56c767 ******/
		%feature("compactdefaultargs") AddLiteral;
		%feature("autodoc", "
Parameters
----------
ptype: Interface_ParamType
val: TCollection_HAsciiString

Return
-------
None

Description
-----------
Adds a literal Parameter to the list (as such).
") AddLiteral;
		void AddLiteral(const Interface_ParamType ptype, const opencascade::handle<TCollection_HAsciiString> & val);

		/****** IGESData_FreeFormatEntity::AddLiteral ******/
		/****** md5 signature: 76917af961f32cd77dd8618232875d21 ******/
		%feature("compactdefaultargs") AddLiteral;
		%feature("autodoc", "
Parameters
----------
ptype: Interface_ParamType
val: str

Return
-------
None

Description
-----------
Adds a literal Parameter to the list (builds an HAsciiString).
") AddLiteral;
		void AddLiteral(const Interface_ParamType ptype, Standard_CString val);

		/****** IGESData_FreeFormatEntity::AddNegativePointers ******/
		/****** md5 signature: 33e3fd63e015423d0c67a74a4d9b8824 ******/
		%feature("compactdefaultargs") AddNegativePointers;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfInteger

Return
-------
None

Description
-----------
Adds a list of Ranks of Parameters to be noted as Negative Pointers (this will be taken into account for Parameters which are Entities).
") AddNegativePointers;
		void AddNegativePointers(const opencascade::handle<TColStd_HSequenceOfInteger> & list);

		/****** IGESData_FreeFormatEntity::ClearNegativePointers ******/
		/****** md5 signature: dd3ad83abfc38f29bcf0cbb8425c8532 ******/
		%feature("compactdefaultargs") ClearNegativePointers;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears all information about Negative Pointers, hence every Entity kind Parameter will be sent normally, as Positive.
") ClearNegativePointers;
		void ClearNegativePointers();

		/****** IGESData_FreeFormatEntity::IsNegativePointer ******/
		/****** md5 signature: f21b874b60ac5b311983528a04b8a81f ******/
		%feature("compactdefaultargs") IsNegativePointer;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Returns True if <num> is noted as for a 'Negative Pointer' (see AddEntity for details). Senseful only if IsParamEntity answers True for <num>, else returns False.
") IsNegativePointer;
		Standard_Boolean IsNegativePointer(const Standard_Integer num);

		/****** IGESData_FreeFormatEntity::IsParamEntity ******/
		/****** md5 signature: edcc5f4164bf630a10b2eddc151d1934 ******/
		%feature("compactdefaultargs") IsParamEntity;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
bool

Description
-----------
Returns True if a Parameter is recorded as an entity Error if num is not between 1 and NbParams.
") IsParamEntity;
		Standard_Boolean IsParamEntity(const Standard_Integer num);

		/****** IGESData_FreeFormatEntity::NbParams ******/
		/****** md5 signature: 826f4756fca7f780e6d976c60183d715 ******/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives count of recorded parameters.
") NbParams;
		Standard_Integer NbParams();

		/****** IGESData_FreeFormatEntity::NegativePointers ******/
		/****** md5 signature: 19bd53b3f3f5b85696a0f7e1cc70530b ******/
		%feature("compactdefaultargs") NegativePointers;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfInteger>

Description
-----------
Returns the complete list of Ramks of Parameters which have been noted as Negative Pointers Warning: It is returned as a Null Handle if none was noted.
") NegativePointers;
		opencascade::handle<TColStd_HSequenceOfInteger> NegativePointers();

		/****** IGESData_FreeFormatEntity::ParamData ******/
		/****** md5 signature: 11d466d23f4fcfca11f9559a83610f5e ******/
		%feature("compactdefaultargs") ParamData;
		%feature("autodoc", "
Parameters
----------
num: int
ptype: Interface_ParamType
ent: IGESData_IGESEntity

Return
-------
val: TCollection_HAsciiString

Description
-----------
Returns data of a Parameter: its type, and the entity if it designates en entity ('ent') or its literal value else ('str') Returned value (Boolean): True if it is an Entity, False else.
") ParamData;
		Standard_Boolean ParamData(const Standard_Integer num, Interface_ParamType & ptype, opencascade::handle<IGESData_IGESEntity> & ent, opencascade::handle<TCollection_HAsciiString> &OutValue);

		/****** IGESData_FreeFormatEntity::ParamEntity ******/
		/****** md5 signature: 2a0bffa8d17df8d6aa5a1fa692044d19 ******/
		%feature("compactdefaultargs") ParamEntity;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<IGESData_IGESEntity>

Description
-----------
Returns Entity corresponding to a Param, given its rank Error if out of range or if Param num does not designate an Entity.
") ParamEntity;
		opencascade::handle<IGESData_IGESEntity> ParamEntity(const Standard_Integer num);

		/****** IGESData_FreeFormatEntity::ParamType ******/
		/****** md5 signature: 06805a954cdda33c70604680f220e0c5 ******/
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
Interface_ParamType

Description
-----------
Returns the ParamType of a Param, given its rank Error if num is not between 1 and NbParams.
") ParamType;
		Interface_ParamType ParamType(const Standard_Integer num);

		/****** IGESData_FreeFormatEntity::ParamValue ******/
		/****** md5 signature: 27f0f605c60e921cd93c878a3119e98b ******/
		%feature("compactdefaultargs") ParamValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns literal value of a Parameter, given its rank Error if num is out of range, or if Parameter is not literal.
") ParamValue;
		opencascade::handle<TCollection_HAsciiString> ParamValue(const Standard_Integer num);

		/****** IGESData_FreeFormatEntity::SetFormNumber ******/
		/****** md5 signature: 56d262317d52b4b1487246c0eba647b7 ******/
		%feature("compactdefaultargs") SetFormNumber;
		%feature("autodoc", "
Parameters
----------
formnum: int

Return
-------
None

Description
-----------
Sets Form Number to a new Value (to called after SetTypeNumber).
") SetFormNumber;
		void SetFormNumber(const Standard_Integer formnum);

		/****** IGESData_FreeFormatEntity::SetTypeNumber ******/
		/****** md5 signature: 85ab744003ab5d58c8acd6bbe2979925 ******/
		%feature("compactdefaultargs") SetTypeNumber;
		%feature("autodoc", "
Parameters
----------
typenum: int

Return
-------
None

Description
-----------
Sets Type Number to a new Value, and Form Number to Zero.
") SetTypeNumber;
		void SetTypeNumber(const Standard_Integer typenum);

		/****** IGESData_FreeFormatEntity::WriteOwnParams ******/
		/****** md5 signature: ce614fc3b2cd77ab3826f39614fd8e9c ******/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "
Parameters
----------
IW: IGESData_IGESWriter

Return
-------
None

Description
-----------
WriteOwnParams is redefined for FreeFormatEntity to take into account the supplementary information 'Negative Pointer'.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def igesdata_Init(*args):
	return igesdata.Init(*args)

@deprecated
def igesdata_Protocol(*args):
	return igesdata.Protocol(*args)

@deprecated
def IGESData_BasicEditor_DraftingMax(*args):
	return IGESData_BasicEditor.DraftingMax(*args)

@deprecated
def IGESData_BasicEditor_DraftingName(*args):
	return IGESData_BasicEditor.DraftingName(*args)

@deprecated
def IGESData_BasicEditor_GetFlagByValue(*args):
	return IGESData_BasicEditor.GetFlagByValue(*args)

@deprecated
def IGESData_BasicEditor_IGESVersionMax(*args):
	return IGESData_BasicEditor.IGESVersionMax(*args)

@deprecated
def IGESData_BasicEditor_IGESVersionName(*args):
	return IGESData_BasicEditor.IGESVersionName(*args)

@deprecated
def IGESData_BasicEditor_UnitFlagName(*args):
	return IGESData_BasicEditor.UnitFlagName(*args)

@deprecated
def IGESData_BasicEditor_UnitFlagValue(*args):
	return IGESData_BasicEditor.UnitFlagValue(*args)

@deprecated
def IGESData_BasicEditor_UnitNameFlag(*args):
	return IGESData_BasicEditor.UnitNameFlag(*args)

@deprecated
def IGESData_GlobalSection_NewDateString(*args):
	return IGESData_GlobalSection.NewDateString(*args)

@deprecated
def IGESData_GlobalSection_NewDateString(*args):
	return IGESData_GlobalSection.NewDateString(*args)

@deprecated
def IGESData_SpecificLib_SetGlobal(*args):
	return IGESData_SpecificLib.SetGlobal(*args)

@deprecated
def IGESData_ToolLocation_ConvertLocation(*args):
	return IGESData_ToolLocation.ConvertLocation(*args)

@deprecated
def IGESData_WriterLib_SetGlobal(*args):
	return IGESData_WriterLib.SetGlobal(*args)

}
