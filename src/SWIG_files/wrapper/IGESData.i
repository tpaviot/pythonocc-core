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
typedef NCollection_HArray1<opencascade::handle<IGESData_IGESEntity>> IGESData_HArray1OfIGESEntity;
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
		/****** md5 signature: 90a32d24c79a74eead07db6f23f9e02f ******/
		%feature("compactdefaultargs") ApplyUnit;
		%feature("autodoc", "
Parameters
----------
enforce: bool (optional, default to false)

Return
-------
None

Description
-----------
Applies unit value to convert header data: Resolution, MaxCoord, MaxLineWeight Applies unit only once after SetUnit... has been called, if <enforce> is given as True. It can be called just before writing the model to a file, i.e. when definitive values are finally known.
") ApplyUnit;
		void ApplyUnit(const bool enforce = false);

		/****** IGESData_BasicEditor::AutoCorrect ******/
		/****** md5 signature: ef8a2868237aa322c6874ca9e974fc68 ******/
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
		bool AutoCorrect(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_BasicEditor::AutoCorrectModel ******/
		/****** md5 signature: a16d98f721ede73c126e1945b70eebef ******/
		%feature("compactdefaultargs") AutoCorrectModel;
		%feature("autodoc", "Return
-------
int

Description
-----------
Performs auto-correction on the whole Model Returns the count of modified entities.
") AutoCorrectModel;
		int AutoCorrectModel();

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
		/****** md5 signature: 67b0b0aeb622404b61c2b3ca290fd0cf ******/
		%feature("compactdefaultargs") DraftingMax;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum allowed value for Drafting Flag.
") DraftingMax;
		static int DraftingMax();

		/****** IGESData_BasicEditor::DraftingName ******/
		/****** md5 signature: 74830a99e08813975ae3dd34ae02e68c ******/
		%feature("compactdefaultargs") DraftingName;
		%feature("autodoc", "
Parameters
----------
flag: int

Return
-------
char *

Description
-----------
From the flag of drafting standard, returns name, '' if incorrect.
") DraftingName;
		static const char * DraftingName(const int flag);

		/****** IGESData_BasicEditor::GetFlagByValue ******/
		/****** md5 signature: d30ca60538ba66f4c997c193f183fe98 ******/
		%feature("compactdefaultargs") GetFlagByValue;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
int

Description
-----------
Returns Flag corresponding to the scaling theValue. Returns 0 if there's no such flag.
") GetFlagByValue;
		static int GetFlagByValue(const double theValue);

		/****** IGESData_BasicEditor::IGESVersionMax ******/
		/****** md5 signature: 95227e506647711c4b2d0c06a5f45396 ******/
		%feature("compactdefaultargs") IGESVersionMax;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum allowed value for IGESVersion Flag.
") IGESVersionMax;
		static int IGESVersionMax();

		/****** IGESData_BasicEditor::IGESVersionName ******/
		/****** md5 signature: 1e2bbc906adbd56111ac1d19b7c4f142 ******/
		%feature("compactdefaultargs") IGESVersionName;
		%feature("autodoc", "
Parameters
----------
flag: int

Return
-------
char *

Description
-----------
From the flag of IGES version, returns name, '' if incorrect.
") IGESVersionName;
		static const char * IGESVersionName(const int flag);

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
		/****** md5 signature: 15baa1fe0124575ecb3a5d12e5804a53 ******/
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
		bool SetUnitFlag(const int flag);

		/****** IGESData_BasicEditor::SetUnitName ******/
		/****** md5 signature: 14f8250cb9fc545cb08454ded6f61bd3 ******/
		%feature("compactdefaultargs") SetUnitName;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Sets a new unit from its name (param 15 of Global Section) Returns True if done, False if <name> is incorrect Remark: if <flag> has been set to 3 (user defined), <name> is then free.
") SetUnitName;
		bool SetUnitName(const char * const name);

		/****** IGESData_BasicEditor::SetUnitValue ******/
		/****** md5 signature: 649a3b51d3235013f1b97cd04a2bb2cb ******/
		%feature("compactdefaultargs") SetUnitValue;
		%feature("autodoc", "
Parameters
----------
val: double

Return
-------
bool

Description
-----------
Sets a new unit from its value in meters (rounded to the closest one, max gap 1%) Returns True if done, False if <val> is too far from a suitable value.
") SetUnitValue;
		bool SetUnitValue(const double val);

		/****** IGESData_BasicEditor::UnitFlagName ******/
		/****** md5 signature: a6cda47375e796b85bdbb726aa22e19f ******/
		%feature("compactdefaultargs") UnitFlagName;
		%feature("autodoc", "
Parameters
----------
flag: int

Return
-------
char *

Description
-----------
From the flag of unit, determines its name, '' if incorrect.
") UnitFlagName;
		static const char * UnitFlagName(const int flag);

		/****** IGESData_BasicEditor::UnitFlagValue ******/
		/****** md5 signature: a6e875ea5569bd2ee26f490cf4507141 ******/
		%feature("compactdefaultargs") UnitFlagValue;
		%feature("autodoc", "
Parameters
----------
flag: int

Return
-------
double

Description
-----------
From the flag of unit, determines value in MM, 0 if incorrect.
") UnitFlagValue;
		static double UnitFlagValue(const int flag);

		/****** IGESData_BasicEditor::UnitNameFlag ******/
		/****** md5 signature: af92f4c7e06ef41d106023c4fe300dea ******/
		%feature("compactdefaultargs") UnitNameFlag;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
int

Description
-----------
From the name of unit, computes flag number, 0 if incorrect (in this case, user defined entity remains possible).
") UnitNameFlag;
		static int UnitNameFlag(const char * const name);

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
		/****** md5 signature: 630b1f17b1680e6b5a8d40a27d2fbae1 ******/
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
		void SetRank(const int val);

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
		/****** md5 signature: c627cada3dfed5ccab6c1f1ff49fb87f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns Value as Integer (sensefull for a Rank).
") Value;
		int Value();

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
		/****** md5 signature: a55673444e016013fb8a7c84e68c8145 ******/
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
		 IGESData_DirChecker(const int atype);

		/****** IGESData_DirChecker::IGESData_DirChecker ******/
		/****** md5 signature: 4e78294dd0cb01e93f8f371adaa75cc2 ******/
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
		 IGESData_DirChecker(const int atype, const int aform);

		/****** IGESData_DirChecker::IGESData_DirChecker ******/
		/****** md5 signature: e0115a576bd93a0115f667d0259d01b8 ******/
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
		 IGESData_DirChecker(const int atype, const int aform1, const int aform2);

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
		/****** md5 signature: 7d80131b0a307f8ad58300bb27650f70 ******/
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
		void BlankStatusRequired(const int val);

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
		/****** md5 signature: 621d6ba68e6cc1e16160339b98d717d3 ******/
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
		bool Correct(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_DirChecker::GraphicsIgnored ******/
		/****** md5 signature: ae5b3c45fe1181b63bcd79d2110bee85 ******/
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
		void GraphicsIgnored(const int hierarchy = -1);

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
		/****** md5 signature: a932d089b8bb0ae20a672aa037a93178 ******/
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
		void HierarchyStatusRequired(const int val);

		/****** IGESData_DirChecker::IsSet ******/
		/****** md5 signature: fa026a649a18f57fe3cfebbe001e5931 ******/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if at least one criterium has already been set Allows user to store a DirChecker (static variable) then ask if it has been set before setting it.
") IsSet;
		bool IsSet();

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
		/****** md5 signature: f879cbab4071c3ce79b7ceab17ac670b ******/
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
		void SubordinateStatusRequired(const int val);

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
		/****** md5 signature: 0af7a80a53184348398631798371ba06 ******/
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
		void UseFlagRequired(const int val);

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
		/****** md5 signature: 6d858f06ee86571da3784b8005ccda96 ******/
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
res1: char *
res2: char *
label: char *
subscript: char *

Return
-------
None

Description
-----------
fills DirPart with consistent data read from file.
") Init;
		void Init(const int i1, const int i2, const int i3, const int i4, const int i5, const int i6, const int i7, const int i8, const int i9, const int i19, const int i11, const int i12, const int i13, const int i14, const int i15, const int i16, const int i17, const char * const res1, const char * const res2, const char * const label, const char * const subscript);

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
		/****** md5 signature: 6cb6cc32ecd0043317c816793ad39ec6 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
res1: char *
res2: char *
label: char *
subscript: char *

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
		void Values(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, char * res1, char * res2, char * label, char * subscript);

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
		/****** md5 signature: bcea3595519f32194bdd45776a677d5a ******/
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
		bool Evaluate(const IGESData_IGESType & akey, opencascade::handle<IGESData_IGESEntity> & res);

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
		/****** md5 signature: e21799b76dd4fb3b969e688640623e63 ******/
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
		bool CanCopy(const int CN, const opencascade::handle<Standard_Transient> & ent);

		/****** IGESData_GeneralModule::CheckCase ******/
		/****** md5 signature: d1c7ba6add9212b48bcbb631196567e9 ******/
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
		void CheckCase(const int CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****** IGESData_GeneralModule::CopyCase ******/
		/****** md5 signature: fc38f8790e575e509f035b0523c81b6a ******/
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
		void CopyCase(const int CN, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, Interface_CopyTool & TC);

		/****** IGESData_GeneralModule::DirChecker ******/
		/****** md5 signature: 24ac4dd970fdb6edfd98c8299928698c ******/
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
		virtual IGESData_DirChecker DirChecker(const int CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_GeneralModule::FillSharedCase ******/
		/****** md5 signature: a1af00a8f137f9d8747366c144a8316d ******/
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
		void FillSharedCase(const int CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****** IGESData_GeneralModule::ListImpliedCase ******/
		/****** md5 signature: fe950e42f0f82e8defd035719c5cd138 ******/
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
		void ListImpliedCase(const int CN, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & iter);

		/****** IGESData_GeneralModule::Name ******/
		/****** md5 signature: 95b9b1ecb679c888363cbd297ea9aae6 ******/
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
		opencascade::handle<TCollection_HAsciiString> Name(const int CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares);

		/****** IGESData_GeneralModule::NewVoid ******/
		/****** md5 signature: 846cb661bd6323cca40137ab9cdf7888 ******/
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

		/****** IGESData_GeneralModule::OwnCheckCase ******/
		/****** md5 signature: eca300876a80daa3d6461589e915cb6d ******/
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
		virtual void OwnCheckCase(const int CN, const opencascade::handle<IGESData_IGESEntity> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****** IGESData_GeneralModule::OwnCopyCase ******/
		/****** md5 signature: 9ad0bed5f3aa318c249804d4eee661b5 ******/
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
		virtual void OwnCopyCase(const int CN, const opencascade::handle<IGESData_IGESEntity> & entfrom, const opencascade::handle<IGESData_IGESEntity> & entto, Interface_CopyTool & TC);

		/****** IGESData_GeneralModule::OwnDeleteCase ******/
		/****** md5 signature: f5bcbb33bdbefcdcff9af5594a72d1f4 ******/
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
		virtual void OwnDeleteCase(const int CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_GeneralModule::OwnImpliedCase ******/
		/****** md5 signature: 1d540cb5f1d86b582ba1f3e8c2fb2ef6 ******/
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
		virtual void OwnImpliedCase(const int CN, const opencascade::handle<IGESData_IGESEntity> & ent, Interface_EntityIterator & iter);

		/****** IGESData_GeneralModule::OwnRenewCase ******/
		/****** md5 signature: fa477dc3fdcd812af9b6029bd810e12e ******/
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
		virtual void OwnRenewCase(const int CN, const opencascade::handle<IGESData_IGESEntity> & entfrom, const opencascade::handle<IGESData_IGESEntity> & entto, const Interface_CopyTool & TC);

		/****** IGESData_GeneralModule::OwnSharedCase ******/
		/****** md5 signature: 992f94b4e92ed9a9604d77ea9df93f9b ******/
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
		virtual void OwnSharedCase(const int CN, const opencascade::handle<IGESData_IGESEntity> & ent, Interface_EntityIterator & iter);

		/****** IGESData_GeneralModule::RenewImpliedCase ******/
		/****** md5 signature: 63f1dcf4eabdcff2e0d31cae949cc27f ******/
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
		void RenewImpliedCase(const int CN, const opencascade::handle<Standard_Transient> & entfrom, const opencascade::handle<Standard_Transient> & entto, const Interface_CopyTool & TC);

		/****** IGESData_GeneralModule::WhenDeleteCase ******/
		/****** md5 signature: 928f8a4f0b9f81b1963543974e5e8656 ******/
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
		void WhenDeleteCase(const int CN, const opencascade::handle<Standard_Transient> & ent, const bool dispatched);

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
		/****** md5 signature: a4fdf5b096820cb26e8793b5002c86f5 ******/
		%feature("compactdefaultargs") CascadeUnit;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the system length unit.
") CascadeUnit;
		double CascadeUnit();

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
		/****** md5 signature: 94ffd77be1dcd1da56243a290bdcd289 ******/
		%feature("compactdefaultargs") DraftingStandard;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") DraftingStandard;
		int DraftingStandard();

		/****** IGESData_GlobalSection::EndMark ******/
		/****** md5 signature: 0299b5a3ee7f7d4c6010ffd18ce6eb3e ******/
		%feature("compactdefaultargs") EndMark;
		%feature("autodoc", "Return
-------
char

Description
-----------
Returns the record delimiter character.
") EndMark;
		char EndMark();

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
		/****** md5 signature: 01c3c78544f32667768ccd27cda9e793 ******/
		%feature("compactdefaultargs") HasApplicationProtocol;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasApplicationProtocol;
		bool HasApplicationProtocol();

		/****** IGESData_GlobalSection::HasLastChangeDate ******/
		/****** md5 signature: 4593c48c6212d874f6498ed2b3e468f4 ******/
		%feature("compactdefaultargs") HasLastChangeDate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the date and time when the model was created or last modified are specified, i.e. not defaulted to NULL.
") HasLastChangeDate;
		bool HasLastChangeDate();

		/****** IGESData_GlobalSection::HasMaxCoord ******/
		/****** md5 signature: e15506a7884d9363ec0f527341a1dd6b ******/
		%feature("compactdefaultargs") HasMaxCoord;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the approximate maximum coordinate value found in the model is greater than 0.
") HasMaxCoord;
		bool HasMaxCoord();

		/****** IGESData_GlobalSection::IGESVersion ******/
		/****** md5 signature: d447e98d31a210dd6b0d93bb308e4a32 ******/
		%feature("compactdefaultargs") IGESVersion;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the IGES version that the IGES file was written in.
") IGESVersion;
		int IGESVersion();

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
		/****** md5 signature: 0ecf960c573ff4add56cfd7501165145 ******/
		%feature("compactdefaultargs") IntegerBits;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of binary bits for integer representations.
") IntegerBits;
		int IntegerBits();

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
		/****** md5 signature: 78f9a5d58169d6e1fe069998a5a2ca2c ******/
		%feature("compactdefaultargs") LineWeightGrad;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum number of line weight gradations.
") LineWeightGrad;
		int LineWeightGrad();

		/****** IGESData_GlobalSection::MaxCoord ******/
		/****** md5 signature: fc8f3aa6e78285e3f0b1aa5a1976ee67 ******/
		%feature("compactdefaultargs") MaxCoord;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the approximate maximum coordinate value found in the model.
") MaxCoord;
		double MaxCoord();

		/****** IGESData_GlobalSection::MaxDigitsDouble ******/
		/****** md5 signature: 212dab61a07903f1121f80a69e13786f ******/
		%feature("compactdefaultargs") MaxDigitsDouble;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") MaxDigitsDouble;
		int MaxDigitsDouble();

		/****** IGESData_GlobalSection::MaxDigitsSingle ******/
		/****** md5 signature: 68e863e40b4e965f4e7d2c7fd43cb997 ******/
		%feature("compactdefaultargs") MaxDigitsSingle;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") MaxDigitsSingle;
		int MaxDigitsSingle();

		/****** IGESData_GlobalSection::MaxLineWeight ******/
		/****** md5 signature: a0b843e223c48e7cd933c8e15c41b42a ******/
		%feature("compactdefaultargs") MaxLineWeight;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the of maximum line weight width in IGES file units.
") MaxLineWeight;
		double MaxLineWeight();

		/****** IGESData_GlobalSection::MaxMaxCoord ******/
		/****** md5 signature: 6beaaa00a9682686c6371dab2c3e83df ******/
		%feature("compactdefaultargs") MaxMaxCoord;
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
") MaxMaxCoord;
		void MaxMaxCoord(const double val = 0.0);

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
		/****** md5 signature: 178902b9d857207d15bb43246a2c112d ******/
		%feature("compactdefaultargs") MaxPower10Double;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum power of a decimal representation of a double-precision floating point number in the sending system.
") MaxPower10Double;
		int MaxPower10Double();

		/****** IGESData_GlobalSection::MaxPower10Single ******/
		/****** md5 signature: 454bdf45e84d8cf0ed844fd5afdd8f88 ******/
		%feature("compactdefaultargs") MaxPower10Single;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum power of a decimal representation of a single-precision floating point number in the sending system.
") MaxPower10Single;
		int MaxPower10Single();

		/****** IGESData_GlobalSection::NewDateString ******/
		/****** md5 signature: 84610212b940c4ae0262c897f726f79e ******/
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
		static opencascade::handle<TCollection_HAsciiString> NewDateString(const int year, const int month, const int day, const int hour, const int minut, const int second, const int mode = -1);

		/****** IGESData_GlobalSection::NewDateString ******/
		/****** md5 signature: 74bc6592fc6cd3cca3a661ca1802c9c8 ******/
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
		static opencascade::handle<TCollection_HAsciiString> NewDateString(const opencascade::handle<TCollection_HAsciiString> & date, const int mode = 1);

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
		/****** md5 signature: a7b2c2af3fdb4b7a1695adc980096fe1 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the resolution used in the IGES file.
") Resolution;
		double Resolution();

		/****** IGESData_GlobalSection::Scale ******/
		/****** md5 signature: 61c9c74d8ec40780bdfa84588e6789a4 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the scale used in the IGES file.
") Scale;
		double Scale();

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
		/****** md5 signature: ed61e44b5cb1564a12fa603cec7d9b4d ******/
		%feature("compactdefaultargs") Separator;
		%feature("autodoc", "Return
-------
char

Description
-----------
Returns the parameter delimiter character.
") Separator;
		char Separator();

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
No available documentation.
") SetCascadeUnit;
		void SetCascadeUnit(const double theUnit);

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
		/****** md5 signature: 48c18cc14b937a8af2c8aa249116d08e ******/
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
		void SetDraftingStandard(const int val);

		/****** IGESData_GlobalSection::SetEndMark ******/
		/****** md5 signature: b4515991d942316e9ea26879fffacbdd ******/
		%feature("compactdefaultargs") SetEndMark;
		%feature("autodoc", "
Parameters
----------
val: char

Return
-------
None

Description
-----------
No available documentation.
") SetEndMark;
		void SetEndMark(const char val);

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
		/****** md5 signature: 334d6f705482baa4cef0e90f66413510 ******/
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
		void SetIGESVersion(const int val);

		/****** IGESData_GlobalSection::SetIntegerBits ******/
		/****** md5 signature: 3fff598a4bbbf77a482f55042c99858b ******/
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
		void SetIntegerBits(const int val);

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
		/****** md5 signature: 584cf18c1e8e7773a81e4d3e2e4d52f9 ******/
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
		void SetLineWeightGrad(const int val);

		/****** IGESData_GlobalSection::SetMaxCoord ******/
		/****** md5 signature: 1e74bb98bd3f10ac916318eb9f9a9e98 ******/
		%feature("compactdefaultargs") SetMaxCoord;
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
") SetMaxCoord;
		void SetMaxCoord(const double val = 0.0);

		/****** IGESData_GlobalSection::SetMaxDigitsDouble ******/
		/****** md5 signature: 5727e52cbfebf0b34941d8a7eed4512e ******/
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
		void SetMaxDigitsDouble(const int val);

		/****** IGESData_GlobalSection::SetMaxDigitsSingle ******/
		/****** md5 signature: 0e840716909c340395b734a81f13d285 ******/
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
		void SetMaxDigitsSingle(const int val);

		/****** IGESData_GlobalSection::SetMaxLineWeight ******/
		/****** md5 signature: d1eda09156c77bb5b80083955a8f1f68 ******/
		%feature("compactdefaultargs") SetMaxLineWeight;
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
") SetMaxLineWeight;
		void SetMaxLineWeight(const double val);

		/****** IGESData_GlobalSection::SetMaxPower10Double ******/
		/****** md5 signature: cd367a85c245b02c1da5c045f8246f68 ******/
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
		void SetMaxPower10Double(const int val);

		/****** IGESData_GlobalSection::SetMaxPower10Single ******/
		/****** md5 signature: 08d880ab31cf4ab60feeb0283a4b5827 ******/
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
		void SetMaxPower10Single(const int val);

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
		/****** md5 signature: 82315a1eb3b4ec00c2edacfdbf9d055e ******/
		%feature("compactdefaultargs") SetResolution;
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
") SetResolution;
		void SetResolution(const double val);

		/****** IGESData_GlobalSection::SetScale ******/
		/****** md5 signature: ddd4d1b045c134444959d7ab171092e2 ******/
		%feature("compactdefaultargs") SetScale;
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
") SetScale;
		void SetScale(const double val);

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
		/****** md5 signature: 9357bf4133ff06d1de561dd70fd7cbf1 ******/
		%feature("compactdefaultargs") SetSeparator;
		%feature("autodoc", "
Parameters
----------
val: char

Return
-------
None

Description
-----------
No available documentation.
") SetSeparator;
		void SetSeparator(const char val);

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
		/****** md5 signature: 9c2316b2e3efc73396058c56033e90c2 ******/
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
		void SetUnitFlag(const int val);

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
		/****** md5 signature: e17e2d555f141f9348e6e2ad53da7b14 ******/
		%feature("compactdefaultargs") UnitFlag;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the unit flag that was used to write the IGES file.
") UnitFlag;
		int UnitFlag();

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
		/****** md5 signature: 40990966ec6a24f0aba3aed2d7321b94 ******/
		%feature("compactdefaultargs") UnitValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the unit value (in meters) that the IGES file was written in.
") UnitValue;
		double UnitValue();

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
		/****** md5 signature: 70794450d3b653db562e33121314b30f ******/
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
		void Dump(const opencascade::handle<IGESData_IGESEntity> & ent, std::ostream &OutValue, const int own, const int attached = -1);

		/****** IGESData_IGESDumper::OwnDump ******/
		/****** md5 signature: e2eb1e64fb235dee2564ef8b117fbc50 ******/
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
		void OwnDump(const opencascade::handle<IGESData_IGESEntity> & ent, std::ostream &OutValue, const int own);

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
		/****** md5 signature: b821017cee95b0de18c90c5959bbc3fd ******/
		%feature("compactdefaultargs") ArePresentAssociativities;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the Entity is defined with an Associativity list, even empty (that is, file contains its length 0) Else, the file contained NO idencation at all about this list.
") ArePresentAssociativities;
		bool ArePresentAssociativities();

		/****** IGESData_IGESEntity::ArePresentProperties ******/
		/****** md5 signature: 74fd5a5b18b4170c733bd9558b565d85 ******/
		%feature("compactdefaultargs") ArePresentProperties;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the Entity is defined with a Property list, even empty (that is, file contains its length 0) Else, the file contained NO idencation at all about this list.
") ArePresentProperties;
		bool ArePresentProperties();

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
		/****** md5 signature: b58351b0dcf24a11d9778c004654e547 ******/
		%feature("compactdefaultargs") BlankStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
gives Blank Status (0 visible, 1 blanked).
") BlankStatus;
		int BlankStatus();

		/****** IGESData_IGESEntity::CResValues ******/
		/****** md5 signature: db15dfeb8086acfac1055baebe1bae64 ******/
		%feature("compactdefaultargs") CResValues;
		%feature("autodoc", "
Parameters
----------
res1: char *
res2: char *

Return
-------
bool

Description
-----------
returns 'reserved' alphanumeric values res1 and res2 res1 and res2 have to be reserved as Character[9 at least] (remark: their content is changed) returned values are ended by null character in 9th returned Boolean is False if res1 and res2 are blank, true else.
") CResValues;
		bool CResValues(char * res1, char * res2);

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
		/****** md5 signature: 2fc521f1254e03ea8f56b83a2e765883 ******/
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
		opencascade::handle<IGESData_IGESEntity> DirFieldEntity(const int fieldnum);

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
		/****** md5 signature: 2635b30c3bcd4a5d6ca1d4359e5c02f5 ******/
		%feature("compactdefaultargs") FormNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the form number for that type of an IGES entity. The default form number is 0.
") FormNumber;
		int FormNumber();

		/****** IGESData_IGESEntity::HasLabelDisplay ******/
		/****** md5 signature: 9a9a663e4dc6b19a67d4cf0b07b3d542 ******/
		%feature("compactdefaultargs") HasLabelDisplay;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a LabelDisplay mode is defined for this entity.
") HasLabelDisplay;
		bool HasLabelDisplay();

		/****** IGESData_IGESEntity::HasName ******/
		/****** md5 signature: f70fdf10d0079e2612f42cd1bfec535f ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
says if a Name is defined, as Short Label or as Name Property (Property is looked first, else ShortLabel is considered).
") HasName;
		bool HasName();

		/****** IGESData_IGESEntity::HasOneParent ******/
		/****** md5 signature: 852b874a1887aef6ba9b2c36755f32ac ******/
		%feature("compactdefaultargs") HasOneParent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if an entity has one and only one parent, defined by a SingleParentEntity Type Associativity (explicit sharing). Thus, implicit sharing remains defined at model level (see class ToolLocation).
") HasOneParent;
		bool HasOneParent();

		/****** IGESData_IGESEntity::HasShortLabel ******/
		/****** md5 signature: 4420ea4a2b3d1bf91d714d62696c1b0c ******/
		%feature("compactdefaultargs") HasShortLabel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if a short label is defined. A short label is a non-blank 8-character string.
") HasShortLabel;
		bool HasShortLabel();

		/****** IGESData_IGESEntity::HasStructure ******/
		/****** md5 signature: b807d4a8f9148476e2aa6963add461ea ******/
		%feature("compactdefaultargs") HasStructure;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if an IGESEntity is defined with a Structure (it is normally reserved for certain classes, such as Macros).
") HasStructure;
		bool HasStructure();

		/****** IGESData_IGESEntity::HasSubScriptNumber ******/
		/****** md5 signature: dee9c05f05b2c2ec13fd34d27760abc3 ******/
		%feature("compactdefaultargs") HasSubScriptNumber;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if a subscript number is defined. A subscript number is an integer used to identify a label.
") HasSubScriptNumber;
		virtual bool HasSubScriptNumber();

		/****** IGESData_IGESEntity::HasTransf ******/
		/****** md5 signature: 2819265b70c58f04741e07257704b7aa ******/
		%feature("compactdefaultargs") HasTransf;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Transformation Matrix is defined.
") HasTransf;
		bool HasTransf();

		/****** IGESData_IGESEntity::HierarchyStatus ******/
		/****** md5 signature: 2cbc1d1d725069a96c73853ddef0121c ******/
		%feature("compactdefaultargs") HierarchyStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
gives Hierarchy status (0-1-2).
") HierarchyStatus;
		int HierarchyStatus();

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
		/****** md5 signature: 560a69a61626d9dbf37c4b69b8ab0f74 ******/
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
		void InitColor(const opencascade::handle<IGESData_ColorEntity> & ent, const int rank = 0);

		/****** IGESData_IGESEntity::InitDirFieldEntity ******/
		/****** md5 signature: 7134777a7d5395d033f9333167fcea3b ******/
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
		void InitDirFieldEntity(const int fieldnum, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_IGESEntity::InitLevel ******/
		/****** md5 signature: 118675101c5642d350f2c3107c65c2a1 ******/
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
		void InitLevel(const opencascade::handle<IGESData_LevelListEntity> & ent, const int val = 0);

		/****** IGESData_IGESEntity::InitLineFont ******/
		/****** md5 signature: 782a81f2f410f082f21b9187271f477b ******/
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
		void InitLineFont(const opencascade::handle<IGESData_LineFontEntity> & ent, const int rank = 0);

		/****** IGESData_IGESEntity::InitMisc ******/
		/****** md5 signature: 2a82702939f056464476a3208830a33a ******/
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
		void InitMisc(const opencascade::handle<IGESData_IGESEntity> & str, const opencascade::handle<IGESData_LabelDisplayEntity> & lab, const int weightnum);

		/****** IGESData_IGESEntity::InitStatus ******/
		/****** md5 signature: d7cb32e06f13622629195e94d81eec92 ******/
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
		void InitStatus(const int blank, const int subordinate, const int useflag, const int hierarchy);

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
		/****** md5 signature: 1c6749a8f4fa3c4b1ef506600d9abb66 ******/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the level the entity belongs to. Returns -1 if the entity belongs to more than one level.
") Level;
		int Level();

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
		/****** md5 signature: b6d2b651a3633993b90431be4d174e77 ******/
		%feature("compactdefaultargs") LineWeight;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the true Line Weight, computed from LineWeightNumber and Global Parameter in the Model by call to SetLineWeight.
") LineWeight;
		double LineWeight();

		/****** IGESData_IGESEntity::LineWeightNumber ******/
		/****** md5 signature: 3472f54d62dbfcef8671066f1e360ab3 ******/
		%feature("compactdefaultargs") LineWeightNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the LineWeight Number (0 not defined), see also LineWeight.
") LineWeightNumber;
		int LineWeightNumber();

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
		/****** md5 signature: 2c7f0573d4ff8e44d5e5180a10969f37 ******/
		%feature("compactdefaultargs") NbAssociativities;
		%feature("autodoc", "Return
-------
int

Description
-----------
gives number of recorded associativities (0 no list defined).
") NbAssociativities;
		int NbAssociativities();

		/****** IGESData_IGESEntity::NbProperties ******/
		/****** md5 signature: c9c6e37d12480f9e186b99864ee97716 ******/
		%feature("compactdefaultargs") NbProperties;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives number of recorded properties (0 no list defined).
") NbProperties;
		int NbProperties();

		/****** IGESData_IGESEntity::NbTypedAssociativities ******/
		/****** md5 signature: 1d89dbca81070b79e0523d63ca47b80b ******/
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
		int NbTypedAssociativities(const opencascade::handle<Standard_Type> & atype);

		/****** IGESData_IGESEntity::NbTypedProperties ******/
		/****** md5 signature: 780ab85ad5ea39a2c7545f3e76c9a111 ******/
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
		int NbTypedProperties(const opencascade::handle<Standard_Type> & atype);

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
		/****** md5 signature: 758258a940193717b2054a98fa04d641 ******/
		%feature("compactdefaultargs") RankColor;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the color definition as an integer value if the color was defined as a rank. Warning A negative value is returned if the color was defined as an entity.
") RankColor;
		int RankColor();

		/****** IGESData_IGESEntity::RankLineFont ******/
		/****** md5 signature: 5034a7c4b76ddcf29589289c73c06176 ******/
		%feature("compactdefaultargs") RankLineFont;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns LineFont definition as an Integer (if defined as Rank) If LineFont is defined as an Entity, returns a negative value.
") RankLineFont;
		int RankLineFont();

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
		/****** md5 signature: 6918652ea1d69ff7df553a7681669d21 ******/
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
		void SetLabel(const opencascade::handle<TCollection_HAsciiString> & label, const int sub = -1);

		/****** IGESData_IGESEntity::SetLineWeight ******/
		/****** md5 signature: 6d3035811adbd562ce8e1404c2307f23 ******/
		%feature("compactdefaultargs") SetLineWeight;
		%feature("autodoc", "
Parameters
----------
defw: double
maxw: double
gradw: int

Return
-------
None

Description
-----------
computes and sets 'true' line weight according IGES rules from global data MaxLineWeight (maxv) and LineWeightGrad (gradw), or sets it to defw (Default) if LineWeightNumber is null.
") SetLineWeight;
		void SetLineWeight(const double defw, const double maxw, const int gradw);

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
		/****** md5 signature: 8aaf22b08182cd5057b8247ef14ab90e ******/
		%feature("compactdefaultargs") SubScriptNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the integer subscript number used to identify this IGES entity. Warning 0 is returned if no subscript number is defined for this IGES entity.
") SubScriptNumber;
		int SubScriptNumber();

		/****** IGESData_IGESEntity::SubordinateStatus ******/
		/****** md5 signature: 91bec81bac619b7cf9e0843deb518d1d ******/
		%feature("compactdefaultargs") SubordinateStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
gives Subordinate Switch (0-1-2-3).
") SubordinateStatus;
		int SubordinateStatus();

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
		/****** md5 signature: f2d7e285576144d97ab49ef8bfa7d7e8 ******/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
gives IGES Type Number (often coupled with Form Number).
") TypeNumber;
		int TypeNumber();

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
		/****** md5 signature: 13dc6a871a3d4700e4cec92bd8266d12 ******/
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
		opencascade::handle<IGESData_IGESEntity> TypedProperty(const opencascade::handle<Standard_Type> & atype, const int anum = 0);

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
		/****** md5 signature: 8ee9e3dd1c26a933189d9c37e3ce6138 ******/
		%feature("compactdefaultargs") UseFlag;
		%feature("autodoc", "Return
-------
int

Description
-----------
gives Entity's Use Flag (0 to 5).
") UseFlag;
		int UseFlag();

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
		/****** md5 signature: 7cc17a52bc94168e72e7dc7319566995 ******/
		%feature("compactdefaultargs") AddStartLine;
		%feature("autodoc", "
Parameters
----------
line: char *
atnum: int (optional, default to 0)

Return
-------
None

Description
-----------
Adds a new string to the existing Start section at the end if atnum is 0 or not given, or before atnumth line.
") AddStartLine;
		void AddStartLine(const char * const line, const int atnum = 0);

		/****** IGESData_IGESModel::ApplyStatic ******/
		/****** md5 signature: 3d396d12eaeea510651ecbe6e3032cee ******/
		%feature("compactdefaultargs") ApplyStatic;
		%feature("autodoc", "
Parameters
----------
param: char * (optional, default to "")

Return
-------
bool

Description
-----------
Sets some of the Global section parameters with the values defined by the translation parameters. param may be: - receiver (value read in XSTEP.iges.header.receiver), - author (value read in XSTEP.iges.header.author), - company (value read in XSTEP.iges.header.company). The default value for param is an empty string. Returns True when done and if param is given, False if param is unknown or empty. Note: Set the unit in the IGES file Global section via IGESData_BasicEditor class.
") ApplyStatic;
		bool ApplyStatic(const char * const param = "");

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
		/****** md5 signature: 81ef923f850ea8300d46a65c729c1bd6 ******/
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
		/****** md5 signature: a5f109e33320ab46b6efaa733b163b63 ******/
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
		/****** md5 signature: 037e6d0f347ff1138ae74ae30f6375f8 ******/
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
		int DNum(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_IGESModel::DumpHeader ******/
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
Prints the IGES file header (Start and Global Sections) to the log file. The integer parameter is intended to be used as a level indicator but is not used at present.
") DumpHeader;
		void DumpHeader(std::ostream &OutValue, const int level = 0);

		/****** IGESData_IGESModel::Entity ******/
		/****** md5 signature: b04c0ca10055a52e271d5463aa6986fd ******/
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
		opencascade::handle<IGESData_IGESEntity> Entity(const int num);

		/****** IGESData_IGESModel::GetFromAnother ******/
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
		/****** md5 signature: 0d29ab1b2ada9e8acb57b398fee23515 ******/
		%feature("compactdefaultargs") NbStartLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of recorded Start Lines.
") NbStartLines;
		int NbStartLines();

		/****** IGESData_IGESModel::NewEmptyModel ******/
		/****** md5 signature: c7c7afeaeaa4e3f58350438ec9368a8b ******/
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
Prints label specific to IGES norm for a given entity, i.e. its directory entry number (2*Number-1).
") PrintLabel;
		void PrintLabel(const opencascade::handle<Standard_Transient> & ent, std::ostream &OutValue);

		/****** IGESData_IGESModel::PrintToLog ******/
		/****** md5 signature: 415cb4936c831272461b79c56e3dd8ad ******/
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
		void PrintToLog(const opencascade::handle<Standard_Transient> & ent, std::ostream &OutValue);

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
		/****** md5 signature: 0d81a802903c455f81846585f3d7508d ******/
		%feature("compactdefaultargs") SetLineWeights;
		%feature("autodoc", "
Parameters
----------
defw: double

Return
-------
None

Description
-----------
Sets LineWeights of contained Entities according header data (MaxLineWeight and LineWeightGrad) or to a default value for undefined weights.
") SetLineWeights;
		void SetLineWeights(const double defw);

		/****** IGESData_IGESModel::SetStartSection ******/
		/****** md5 signature: 962c659074889aede8a8243c610997e3 ******/
		%feature("compactdefaultargs") SetStartSection;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfHAsciiString
copy: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets a new Start section from a list of strings. If copy is false, the Start section will be shared. Any modifications made to the strings later on, will have an effect on the Start section. If copy is true (default value), an independent copy of the strings is created and used as the Start section. Any modifications made to the strings later on, will have no effect on the Start section.
") SetStartSection;
		void SetStartSection(const opencascade::handle<TColStd_HSequenceOfHAsciiString > & list, const bool copy = true);

		/****** IGESData_IGESModel::StartLine ******/
		/****** md5 signature: eb51d28c711734d223175b0959b26d46 ******/
		%feature("compactdefaultargs") StartLine;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
char *

Description
-----------
Returns a line from the IGES file Start section by specifying its number. An empty string is returned if the number given is out of range, the range being from 1 to NbStartLines.
") StartLine;
		const char * StartLine(const int num);

		/****** IGESData_IGESModel::StartSection ******/
		/****** md5 signature: 6f0e34e71c1038babb351b1099cd062a ******/
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
Returns a string with the label attached to a given entity, i.e. a string 'Dnn' with nn = directory entry number (2*N-1).
") StringLabel;
		opencascade::handle<TCollection_HAsciiString> StringLabel(const opencascade::handle<Standard_Transient> & ent);

		/****** IGESData_IGESModel::VerifyCheck ******/
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
Checks that the IGES file Global section contains valid data that conforms to the IGES specifications.
") VerifyCheck;
		void VerifyCheck(opencascade::handle<Interface_Check> & ach);

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
		/****** md5 signature: e08a1ed7adb02fd87d14eb175ad85dff ******/
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
		 IGESData_IGESReaderData(const int nbe, const int nbp);

		/****** IGESData_IGESReaderData::AddGlobal ******/
		/****** md5 signature: 8da2fd64c68097c0c9fc903f3032ed71 ******/
		%feature("compactdefaultargs") AddGlobal;
		%feature("autodoc", "
Parameters
----------
atype: Interface_ParamType
aval: char *

Return
-------
None

Description
-----------
adds a parameter to global section's parameter list.
") AddGlobal;
		void AddGlobal(const Interface_ParamType atype, const char * const aval);

		/****** IGESData_IGESReaderData::AddStartLine ******/
		/****** md5 signature: eb3a538318ddf531d0b5c5de7f6f2b37 ******/
		%feature("compactdefaultargs") AddStartLine;
		%feature("autodoc", "
Parameters
----------
aval: char *

Return
-------
None

Description
-----------
adds a start line to start section.
") AddStartLine;
		void AddStartLine(const char * const aval);

		/****** IGESData_IGESReaderData::DefaultLineWeight ******/
		/****** md5 signature: 0a210a21c793f519ee82ab14a782a83b ******/
		%feature("compactdefaultargs") DefaultLineWeight;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the recorded Default Line Weight, if there is (else, returns 0).
") DefaultLineWeight;
		double DefaultLineWeight();

		/****** IGESData_IGESReaderData::DirPart ******/
		/****** md5 signature: 921bb580f06445d5d442b31c12e06162 ******/
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
		const IGESData_DirPart & DirPart(const int num);

		/****** IGESData_IGESReaderData::DirType ******/
		/****** md5 signature: dc542b0c913f18aa1432e56ad66fbcc8 ******/
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
		IGESData_IGESType DirType(const int num);

		/****** IGESData_IGESReaderData::DirValues ******/
		/****** md5 signature: 016897cc0b662205b10d07952028d83e ******/
		%feature("compactdefaultargs") DirValues;
		%feature("autodoc", "
Parameters
----------
num: int
res1: char *
res2: char *
label: char *
subs: char *

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
		void DirValues(const int num, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, char * res1, char * res2, char * label, char * subs);

		/****** IGESData_IGESReaderData::FindNextRecord ******/
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
determines next suitable record from num; that is num+1 except for last one which gives 0.
") FindNextRecord;
		int FindNextRecord(const int num);

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
		/****** md5 signature: 9f1930526dd42b0983ed2f53654ed3b7 ******/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of recorded Entities (i.e. size of Directory).
") NbEntities;
		int NbEntities();

		/****** IGESData_IGESReaderData::SetDefaultLineWeight ******/
		/****** md5 signature: 920d1e3321acedc6f4d277b78ec98e74 ******/
		%feature("compactdefaultargs") SetDefaultLineWeight;
		%feature("autodoc", "
Parameters
----------
defw: double

Return
-------
None

Description
-----------
allows to set a default line weight, will be later applied at load time, on Entities which have no specified line weight.
") SetDefaultLineWeight;
		void SetDefaultLineWeight(const double defw);

		/****** IGESData_IGESReaderData::SetDirPart ******/
		/****** md5 signature: 1831784f7fd9e2fb573a14e055424629 ******/
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
res1: char *
res2: char *
label: char *
subs: char *

Return
-------
None

Description
-----------
fills a DirPart, designated by its rank (that is, (N+1)/2 if N is its first number in section D).
") SetDirPart;
		void SetDirPart(const int num, const int i1, const int i2, const int i3, const int i4, const int i5, const int i6, const int i7, const int i8, const int i9, const int i10, const int i11, const int i12, const int i13, const int i14, const int i15, const int i16, const int i17, const char * const res1, const char * const res2, const char * const label, const char * const subs);

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
		/****** md5 signature: 6f0e34e71c1038babb351b1099cd062a ******/
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
fills an entity, given record no; works by calling ReadDirPart then ReadParams (with help of a ParamReader), then if required ReadProps and ReadAssocs, from IGESEntity Returns True if no fail has been recorded.
") AnalyseRecord;
		bool AnalyseRecord(const int num, const opencascade::handle<Standard_Transient> & anent, opencascade::handle<Interface_Check> & acheck);

		/****** IGESData_IGESReaderTool::BeginRead ******/
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
fills model's header, that is, its GlobalSection.
") BeginRead;
		void BeginRead(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** IGESData_IGESReaderTool::EndRead ******/
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
after reading entities, true line weights can be computed.
") EndRead;
		void EndRead(const opencascade::handle<Interface_InterfaceModel> & amodel);

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
recognizes records by asking Protocol (on data of DirType).
") Recognize;
		bool Recognize(const int num, opencascade::handle<Interface_Check> & ach, opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: 9654a63ebfae1af0d6583bec81f39737 ******/
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
		 IGESData_IGESType(const int atype, const int aform);

		/****** IGESData_IGESType::Form ******/
		/****** md5 signature: b3ca7cfbed16ebfe788bcd2ee4d55b20 ******/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 'form' data.
") Form;
		int Form();

		/****** IGESData_IGESType::IsEqual ******/
		/****** md5 signature: 7b475177d173d9114bc9c19fd7c20539 ******/
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
		bool IsEqual(const IGESData_IGESType & another);

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
		/****** md5 signature: 08d6b3f0f2bca5b690ae63689e8d73f5 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 'type' data.
") Type;
		int Type();


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
		/****** md5 signature: f9264905c875957693bc6eda08b97601 ******/
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
		bool Print(std::ostream &OutValue);

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
		/****** md5 signature: 3c66e1d9a4c2b0499bd0662c078183bb ******/
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
		opencascade::handle<TColStd_HSequenceOfHAsciiString> SectionStrings(const int numsec);

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
sends a Boolean parameter as an Integer value 0(False)/1(True).
") SendBoolean;
		void SendBoolean(const bool val);

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
		/****** md5 signature: 80a4467b971d09c1d4b7322787c31079 ******/
		%feature("compactdefaultargs") SendStartLine;
		%feature("autodoc", "
Parameters
----------
startline: char *

Return
-------
None

Description
-----------
Sends an additional Starting Line: this is the way used to send comments in an IGES File (at beginning of the file). If the line is more than 72 chars long, it is split into as many lines as required to send it completely.
") SendStartLine;
		void SendStartLine(const char * const startline);

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

		/****** IGESData_IGESWriter::WriteMode ******/
		/****** md5 signature: 38281ca5f805393ec278c85016f34e58 ******/
		%feature("compactdefaultargs") WriteMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the write mode, in order to be read and/or changed Write Mode controls the way final print works 0 (D): Normal IGES, 10: FNES.
") WriteMode;
		int & WriteMode();

		%extend{
			int GetWriteMode() { return self->WriteMode(); }
			void SetWriteMode(int value) { self->WriteMode() = value; }
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
		/****** md5 signature: 3134a13cd562b29a41a13fc8f3c1b1e5 ******/
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
		 IGESData_ParamCursor(const int num);

		/****** IGESData_ParamCursor::IGESData_ParamCursor ******/
		/****** md5 signature: 5289c7a6971c6099cf033b182e7d1710 ******/
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
		 IGESData_ParamCursor(const int num, const int nb, const int size = 1);

		/****** IGESData_ParamCursor::Advance ******/
		/****** md5 signature: 9c283a54f8ac5a23a6dfd4653eb7d9d1 ******/
		%feature("compactdefaultargs") Advance;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Advance command has been set.
") Advance;
		bool Advance();

		/****** IGESData_ParamCursor::Count ******/
		/****** md5 signature: 78148c14f4cfe8961517f1210318a2cc ******/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns required count of items to be read.
") Count;
		int Count();

		/****** IGESData_ParamCursor::ItemSize ******/
		/****** md5 signature: b281288aefbe60827bc485ba7eb92be1 ******/
		%feature("compactdefaultargs") ItemSize;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns length of item (count of parameters per item).
") ItemSize;
		int ItemSize();

		/****** IGESData_ParamCursor::Limit ******/
		/****** md5 signature: 213bf78d59a90b418f7459d491ce2797 ******/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (excluded) upper limit number for reading parameters.
") Limit;
		int Limit();

		/****** IGESData_ParamCursor::Offset ******/
		/****** md5 signature: 55fa9a2c230a0e3c9f00762fdc3c76f1 ******/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns offset from which current term must be read in item.
") Offset;
		int Offset();

		/****** IGESData_ParamCursor::SetAdvance ******/
		/****** md5 signature: dd11ffd909e8fa0e0acbd20d3df4f6f4 ******/
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
		void SetAdvance(const bool advance);

		/****** IGESData_ParamCursor::SetOne ******/
		/****** md5 signature: 0d8d6aeff1e7821e2eb6ae99dcf1e1c7 ******/
		%feature("compactdefaultargs") SetOne;
		%feature("autodoc", "
Parameters
----------
autoadv: bool (optional, default to true)

Return
-------
None

Description
-----------
Defines a term of one Parameter (very current case).
") SetOne;
		void SetOne(const bool autoadv = true);

		/****** IGESData_ParamCursor::SetTerm ******/
		/****** md5 signature: 1b307b55d9e45af110b2650b6a7a6559 ******/
		%feature("compactdefaultargs") SetTerm;
		%feature("autodoc", "
Parameters
----------
size: int
autoadv: bool (optional, default to true)

Return
-------
None

Description
-----------
Defines the size of a term to read in the item: this commands ParamReader to read 'size' parameters for each item, then skip the remainder of the item to the same term of next Item (that is, skip 'item size' - 'term size') //! In addition, Offset from beginning of Item is managed: After being created, and for the first call to SetTerm, the part of Item to be read begins exactly as the Item begins But after a SetTerm, the next read will add an offset which is the size of former term. //! autoadv commands Advance management. If it is True (default), the last SetTerm (Item size has been covered) calls SetAdvance If it is False, SetAdvance must be called directly if necessary //! Error if a SetTerm overpasses the size of the Item.
") SetTerm;
		void SetTerm(const int size, const bool autoadv = true);

		/****** IGESData_ParamCursor::SetXY ******/
		/****** md5 signature: 84e3c20a04697466aaf8ae38d97cb4a6 ******/
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "
Parameters
----------
autoadv: bool (optional, default to true)

Return
-------
None

Description
-----------
Defines a term of two Parameters for a XY (current case).
") SetXY;
		void SetXY(const bool autoadv = true);

		/****** IGESData_ParamCursor::SetXYZ ******/
		/****** md5 signature: c8ababbcebb8d17d1a9e9f4850371e6e ******/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "
Parameters
----------
autoadv: bool (optional, default to true)

Return
-------
None

Description
-----------
Defines a term of three Parameters for XYZ (current case).
") SetXYZ;
		void SetXYZ(const bool autoadv = true);

		/****** IGESData_ParamCursor::Start ******/
		/****** md5 signature: 88167321d3cf58cf35721be21ad3fa18 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns (included) starting number for reading parameters.
") Start;
		int Start();

		/****** IGESData_ParamCursor::TermSize ******/
		/****** md5 signature: 3338f17dbf8c9a2224b682cb1556afb2 ******/
		%feature("compactdefaultargs") TermSize;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns length of current term (count of parameters) in item.
") TermSize;
		int TermSize();

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
		/****** md5 signature: 687593b5c116290279d7fe2b80fb9feb ******/
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
		 IGESData_ParamReader(const opencascade::handle<Interface_ParamList> & list, const opencascade::handle<Interface_Check> & ach, const int base = 1, const int nbpar = 0, const int num = 0);

		/****** IGESData_ParamReader::AddFail ******/
		/****** md5 signature: e5ce09732e1b8fa7c092b410b162b7d9 ******/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "
Parameters
----------
afail: char *
bfail: char * (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") AddFail;
		void AddFail(const char * const afail, const char * const bfail = "");

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
		/****** md5 signature: 7c2b56d3f182d2e497de441a881fd46e ******/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "
Parameters
----------
awarn: char *
bwarn: char * (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") AddWarning;
		void AddWarning(const char * const awarn, const char * const bwarn = "");

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
		/****** md5 signature: 7fb4031c0f691ee4baab2b6d29b14036 ******/
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
		IGESData_ParamCursor CurrentList(const int nb, const int size = 1);

		/****** IGESData_ParamReader::CurrentNumber ******/
		/****** md5 signature: bf72559fcf52beae75398c0cdefdca93 ******/
		%feature("compactdefaultargs") CurrentNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the current parameter number This notion is involved by the organisation of an IGES list of parameters: it can be ended by two lists (Associativities and Properties), which can be empty, or even absent. Hence, it is necessary to know, at the end of specific reading, how many parameters have been read: the optional lists follow.
") CurrentNumber;
		int CurrentNumber();

		/****** IGESData_ParamReader::DefinedElseSkip ******/
		/****** md5 signature: 61442f45904be43c84e425ca773bab1a ******/
		%feature("compactdefaultargs") DefinedElseSkip;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Allows to simply process a parameter which can be defaulted. Waits on the Current Number a defined parameter or skips it: If the parameter <num> is defined, changes nothing and returns True Hence, the next reading with current cursor will concern <num> If it is void, advances Current Position by one, and returns False The next reading will concern <num+1> (except if <num> = NbParams) //! This allows to process Default values as follows (C++): if (PR.DefinedElseSkip()) { .. PR.Read... (current parameter); } else { <current parameter> = default value .. nothing else to do with ParamReader } For Message.
") DefinedElseSkip;
		bool DefinedElseSkip();

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
		/****** md5 signature: 2fcec837afe21e656571ee20a085168d ******/
		%feature("compactdefaultargs") EntityNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the entity number in the file.
") EntityNumber;
		int EntityNumber();

		/****** IGESData_ParamReader::HasFailed ******/
		/****** md5 signature: ce7804154429fff28a900a0531c41bbe ******/
		%feature("compactdefaultargs") HasFailed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
says if fails have been recorded into the Check.
") HasFailed;
		bool HasFailed();

		/****** IGESData_ParamReader::IsCheckEmpty ******/
		/****** md5 signature: aec19da7645ad339221fb58e4834df7b ******/
		%feature("compactdefaultargs") IsCheckEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the Check is Empty Else, it has to be recorded with the Read Entity.
") IsCheckEmpty;
		bool IsCheckEmpty();

		/****** IGESData_ParamReader::IsParamDefined ******/
		/****** md5 signature: 1bcb804e35797503b7895c4d721bd379 ******/
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
		bool IsParamDefined(const int num);

		/****** IGESData_ParamReader::IsParamEntity ******/
		/****** md5 signature: 54d50dbb8acda69f9f7f32ee35bba080 ******/
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
		bool IsParamEntity(const int num);

		/****** IGESData_ParamReader::Mend ******/
		/****** md5 signature: bbdea5265049b8f554e7c4445d6e73f6 ******/
		%feature("compactdefaultargs") Mend;
		%feature("autodoc", "
Parameters
----------
pref: char * (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") Mend;
		void Mend(const char * const pref = "");

		/****** IGESData_ParamReader::NbParams ******/
		/****** md5 signature: 3d5942837081abb877dd0a91d1f0a57f ******/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns number of parameters (minus the first one) following method skip the first parameter (1 gives the 2nd).
") NbParams;
		int NbParams();

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
		/****** md5 signature: d4dc63b7a04a58af772b27e62ea5416f ******/
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
		opencascade::handle<IGESData_IGESEntity> ParamEntity(const opencascade::handle<IGESData_IGESReaderData> & IR, const int num);

		/****** IGESData_ParamReader::ParamNumber ******/
		/****** md5 signature: e79b0d95a5f23b9079b9b6385782cee1 ******/
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
		int ParamNumber(const int num);

		/****** IGESData_ParamReader::ParamType ******/
		/****** md5 signature: 561418a28e8f194c5a0ff3ab3fec26a2 ******/
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
		Interface_ParamType ParamType(const int num);

		/****** IGESData_ParamReader::ParamValue ******/
		/****** md5 signature: 508d44a748509824ce8efc31bf6ddb91 ******/
		%feature("compactdefaultargs") ParamValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
char *

Description
-----------
returns literal value of a parameter, as it was in file.
") ParamValue;
		const char * ParamValue(const int num);

		/****** IGESData_ParamReader::ReadBoolean ******/
		/****** md5 signature: faf439972c2786f555fb1a134638207d ******/
		%feature("compactdefaultargs") ReadBoolean;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
amsg: Message_Msg
exact: bool (optional, default to true)

Return
-------
val: bool

Description
-----------
No available documentation.
") ReadBoolean;
		bool ReadBoolean(const IGESData_ParamCursor & PC, const Message_Msg & amsg, Standard_Boolean &OutValue, const bool exact = true);

		/****** IGESData_ParamReader::ReadBoolean ******/
		/****** md5 signature: bde1d1806e40d95a5ccc42127aacdeb8 ******/
		%feature("compactdefaultargs") ReadBoolean;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: char *
exact: bool (optional, default to true)

Return
-------
val: bool

Description
-----------
Reads a Boolean value from parameter 'num' A Boolean is given as an Integer value 0 (False) or 1 (True) Anyway, an Integer is demanded (else, Check is filled) If exact is given True, those precise values are demanded Else, Correction is done, as False for 0 or <0, True for >0 (with a Warning error message, and return is True) In case of error (not an Integer, or not 0/1 and exact True), Check is filled with a Fail (using mess) and return is False.
") ReadBoolean;
		bool ReadBoolean(const IGESData_ParamCursor & PC, const char * const mess, Standard_Boolean &OutValue, const bool exact = true);

		/****** IGESData_ParamReader::ReadEntList ******/
		/****** md5 signature: 2a781251548241a7c9a717210b8e3df8 ******/
		%feature("compactdefaultargs") ReadEntList;
		%feature("autodoc", "
Parameters
----------
IR: IGESData_IGESReaderData
PC: IGESData_ParamCursor
amsg: Message_Msg
val: Interface_EntityList
ord: bool (optional, default to true)

Return
-------
bool

Description
-----------
No available documentation.
") ReadEntList;
		bool ReadEntList(const opencascade::handle<IGESData_IGESReaderData> & IR, const IGESData_ParamCursor & PC, Message_Msg & amsg, Interface_EntityList & val, const bool ord = true);

		/****** IGESData_ParamReader::ReadEntList ******/
		/****** md5 signature: 9c06118eceecca457236dd15747cdad7 ******/
		%feature("compactdefaultargs") ReadEntList;
		%feature("autodoc", "
Parameters
----------
IR: IGESData_IGESReaderData
PC: IGESData_ParamCursor
mess: char *
val: Interface_EntityList
ord: bool (optional, default to true)

Return
-------
bool

Description
-----------
Reads a list of Entities defined by PC Same conditions as for ReadEnts, for PC The list is given as an EntityList (index has no meaning; the EntityList starts from clear) If 'ord' is given True (default), entities will be added to the list in their original order Remark: Negative or Null Pointers are ignored Else ('ord' False), order is not guaranteed (faster mode) If all params cannot be read as Entities, same as above Warning: Give 'ord' to False ONLY if order is not significant.
") ReadEntList;
		bool ReadEntList(const opencascade::handle<IGESData_IGESReaderData> & IR, const IGESData_ParamCursor & PC, const char * const mess, Interface_EntityList & val, const bool ord = true);

		/****** IGESData_ParamReader::ReadEnts ******/
		/****** md5 signature: 8d37a3056343552c9f257ca3ee1a8cf7 ******/
		%feature("compactdefaultargs") ReadEnts;
		%feature("autodoc", "
Parameters
----------
IR: IGESData_IGESReaderData
PC: IGESData_ParamCursor
amsg: Message_Msg
val: NCollection_HArray1<
index: int (optional, default to 1)

Return
-------
bool

Description
-----------
No available documentation.
") ReadEnts;
		bool ReadEnts(const opencascade::handle<IGESData_IGESReaderData> & IR, const IGESData_ParamCursor & PC, const Message_Msg & amsg, opencascade::handle<NCollection_HArray1<opencascade::handle<IGESData_IGESEntity>> > & val, const int index = 1);

		/****** IGESData_ParamReader::ReadEnts ******/
		/****** md5 signature: 40a43386e4724de502cb4ae94c6cd9c4 ******/
		%feature("compactdefaultargs") ReadEnts;
		%feature("autodoc", "
Parameters
----------
IR: IGESData_IGESReaderData
PC: IGESData_ParamCursor
mess: char *
val: NCollection_HArray1<
index: int (optional, default to 1)

Return
-------
bool

Description
-----------
Reads a list of Entities defined by PC Same conditions as for ReadInts, for PC and index The list is given as a HArray1, numered from 'index' If all params cannot be read as Entities, Check is filled (using mess) and return value is False Remark: Null references are accepted, they are ignored (negative pointers too: they provoke a Warning message) If the caller wants to check them, a loop on ReadEntity should be used.
") ReadEnts;
		bool ReadEnts(const opencascade::handle<IGESData_IGESReaderData> & IR, const IGESData_ParamCursor & PC, const char * const mess, opencascade::handle<NCollection_HArray1<opencascade::handle<IGESData_IGESEntity>> > & val, const int index = 1);

		/****** IGESData_ParamReader::ReadInteger ******/
		/****** md5 signature: 396bd6b0656cc25840454b61f0c6b05c ******/
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
		bool ReadInteger(const IGESData_ParamCursor & PC, Standard_Integer &OutValue);

		/****** IGESData_ParamReader::ReadInteger ******/
		/****** md5 signature: 701150aaa47f518474e99f850ce855a3 ******/
		%feature("compactdefaultargs") ReadInteger;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: char *

Return
-------
val: int

Description
-----------
Reads an Integer value designated by PC The method Current designates the current parameter and advances the Current Number by one after reading Note that if a count (not 1) is given, it is ignored If it is not an Integer, fills Check with a Fail (using mess) and returns False.
") ReadInteger;
		bool ReadInteger(const IGESData_ParamCursor & PC, const char * const mess, Standard_Integer &OutValue);

		/****** IGESData_ParamReader::ReadInts ******/
		/****** md5 signature: 931995650c62f5733056d355f358705a ******/
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
		bool ReadInts(const IGESData_ParamCursor & PC, const Message_Msg & amsg, opencascade::handle<TColStd_HArray1OfInteger> & val, const int index = 1);

		/****** IGESData_ParamReader::ReadInts ******/
		/****** md5 signature: 6fcb8643b24b53ab1771cf7944ec102c ******/
		%feature("compactdefaultargs") ReadInts;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: char *
val: TColStd_HArray1OfInteger
index: int (optional, default to 1)

Return
-------
bool

Description
-----------
Reads a list of Integer values, defined by PC (with a count of parameters). PC can start from Current Number and command it to advance after reading (use method CurrentList to do this) The list is given as a HArray1, numered from 'index' If all params are not Integer, Check is filled (using mess) and return value is False.
") ReadInts;
		bool ReadInts(const IGESData_ParamCursor & PC, const char * const mess, opencascade::handle<TColStd_HArray1OfInteger> & val, const int index = 1);

		/****** IGESData_ParamReader::ReadReal ******/
		/****** md5 signature: bc37f22926d8c7721cd9b809b4dab78a ******/
		%feature("compactdefaultargs") ReadReal;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor

Return
-------
val: double

Description
-----------
No available documentation.
") ReadReal;
		bool ReadReal(const IGESData_ParamCursor & PC, Standard_Real &OutValue);

		/****** IGESData_ParamReader::ReadReal ******/
		/****** md5 signature: 3d60b45d74dd145f5e3c0212a76729bb ******/
		%feature("compactdefaultargs") ReadReal;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: char *

Return
-------
val: double

Description
-----------
Reads a Real value from parameter 'num' An Integer is accepted (Check is filled with a Warning message) and causes return to be True (as normal case) In other cases, Check is filled with a Fail and return is False.
") ReadReal;
		bool ReadReal(const IGESData_ParamCursor & PC, const char * const mess, Standard_Real &OutValue);

		/****** IGESData_ParamReader::ReadReals ******/
		/****** md5 signature: 16e4f096cce335a2923fe9a3b95c8e1a ******/
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
		bool ReadReals(const IGESData_ParamCursor & PC, Message_Msg & amsg, opencascade::handle<TColStd_HArray1OfReal> & val, const int index = 1);

		/****** IGESData_ParamReader::ReadReals ******/
		/****** md5 signature: 9e2a62a226da70b5e9dce9934a5f64d9 ******/
		%feature("compactdefaultargs") ReadReals;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: char *
val: TColStd_HArray1OfReal
index: int (optional, default to 1)

Return
-------
bool

Description
-----------
Reads a list of Real values defined by PC Same conditions as for ReadInts, for PC and index An Integer parameter is accepted, if at least one parameter is Integer, Check is filled with a 'Warning' message If all params are neither Real nor Integer, Check is filled (using mess) and return value is False.
") ReadReals;
		bool ReadReals(const IGESData_ParamCursor & PC, const char * const mess, opencascade::handle<TColStd_HArray1OfReal> & val, const int index = 1);

		/****** IGESData_ParamReader::ReadText ******/
		/****** md5 signature: 80c7d621c609493d0c38860f26140322 ******/
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
		bool ReadText(const IGESData_ParamCursor & thePC, const Message_Msg & theMsg, opencascade::handle<TCollection_HAsciiString> &OutValue);

		/****** IGESData_ParamReader::ReadText ******/
		/****** md5 signature: 36daf8205207d415c3ac8082eb64d410 ******/
		%feature("compactdefaultargs") ReadText;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: char *

Return
-------
val: TCollection_HAsciiString

Description
-----------
Reads a Text value from parameter 'num', as a String from Collection, that is, Hollerith text without leading 'nnnH' If it is not a String, fills Check with a Fail (using mess) and returns False.
") ReadText;
		bool ReadText(const IGESData_ParamCursor & PC, const char * const mess, opencascade::handle<TCollection_HAsciiString> &OutValue);

		/****** IGESData_ParamReader::ReadTexts ******/
		/****** md5 signature: 1b3deb1d0b8956c82857e2da0e820c0d ******/
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
		bool ReadTexts(const IGESData_ParamCursor & PC, const Message_Msg & amsg, opencascade::handle<Interface_HArray1OfHAsciiString > & val, const int index = 1);

		/****** IGESData_ParamReader::ReadTexts ******/
		/****** md5 signature: c707b1437e30f5fea5bc96986a0057a9 ******/
		%feature("compactdefaultargs") ReadTexts;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: char *
val: Interface_HArray1OfHAsciiString
index: int (optional, default to 1)

Return
-------
bool

Description
-----------
Reads a list of Hollerith Texts, defined by PC Texts are read as Hollerith texts without leading 'nnnH' Same conditions as for ReadInts, for PC and index If all params are not Text, Check is filled (using mess) and return value is False.
") ReadTexts;
		bool ReadTexts(const IGESData_ParamCursor & PC, const char * const mess, opencascade::handle<Interface_HArray1OfHAsciiString > & val, const int index = 1);

		/****** IGESData_ParamReader::ReadXY ******/
		/****** md5 signature: 4763773f69f64b43c371ed82c0b9720e ******/
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
		bool ReadXY(const IGESData_ParamCursor & PC, Message_Msg & amsg, gp_XY & val);

		/****** IGESData_ParamReader::ReadXY ******/
		/****** md5 signature: f9504ec92bd205ab0c91acb7bc0ece77 ******/
		%feature("compactdefaultargs") ReadXY;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: char *
val: gp_XY

Return
-------
bool

Description
-----------
Reads a couple of Real values (X,Y) from parameter 'num' Integers are accepted (Check is filled with a Warning message) and cause return to be True (as normal case) In other cases, Check is filled with a Fail and return is False.
") ReadXY;
		bool ReadXY(const IGESData_ParamCursor & PC, const char * const mess, gp_XY & val);

		/****** IGESData_ParamReader::ReadXYZ ******/
		/****** md5 signature: 02144fd03b9c4ab36c39f6dbc91377d6 ******/
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
		bool ReadXYZ(const IGESData_ParamCursor & PC, Message_Msg & amsg, gp_XYZ & val);

		/****** IGESData_ParamReader::ReadXYZ ******/
		/****** md5 signature: aee41a8a4b26aa1e4a6b738f4b47354c ******/
		%feature("compactdefaultargs") ReadXYZ;
		%feature("autodoc", "
Parameters
----------
PC: IGESData_ParamCursor
mess: char *
val: gp_XYZ

Return
-------
bool

Description
-----------
Reads a triplet of Real values (X,Y,Z) from parameter 'num' Integers are accepted (Check is filled with a Warning message) and cause return to be True (as normal case) In other cases, Check is filled with a Fail and return is False For Message.
") ReadXYZ;
		bool ReadXYZ(const IGESData_ParamCursor & PC, const char * const mess, gp_XYZ & val);

		/****** IGESData_ParamReader::ReadingEntityNumber ******/
		/****** md5 signature: 8c7a28996d3e9abce00afe53fe64c475 ******/
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
		bool ReadingEntityNumber(const int num, Standard_Integer &OutValue);

		/****** IGESData_ParamReader::ReadingEntityNumber ******/
		/****** md5 signature: 61e1e421282d3c21cd655b0259ef1d99 ******/
		%feature("compactdefaultargs") ReadingEntityNumber;
		%feature("autodoc", "
Parameters
----------
num: int
mess: char *

Return
-------
val: int

Description
-----------
Routine which reads an Entity Number (which allows to read the Entity in the IGESReaderData by BoundEntity), given its number in the list of Parameters Same conditions as ReadEntity for mess, val, and return value In particular, returns True and val to zero means Null Entity, and val not zero means Entity read by BoundEntity.
") ReadingEntityNumber;
		bool ReadingEntityNumber(const int num, const char * const mess, Standard_Integer &OutValue);

		/****** IGESData_ParamReader::ReadingReal ******/
		/****** md5 signature: f8645a87fb24502bf76eb392d0e1c3c6 ******/
		%feature("compactdefaultargs") ReadingReal;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
val: double

Description
-----------
No available documentation.
") ReadingReal;
		bool ReadingReal(const int num, Standard_Real &OutValue);

		/****** IGESData_ParamReader::ReadingReal ******/
		/****** md5 signature: 9406bcfee75c5086366dc33e5479a615 ******/
		%feature("compactdefaultargs") ReadingReal;
		%feature("autodoc", "
Parameters
----------
num: int
mess: char *

Return
-------
val: double

Description
-----------
Routine which reads a Real parameter, given its number Same conditions as ReadReal for mess, val, and return value.
") ReadingReal;
		bool ReadingReal(const int num, const char * const mess, Standard_Real &OutValue);

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
		/****** md5 signature: 37c05428033726e8ff9c2f26df9e52bf ******/
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
		void SetCurrentNumber(const int num);

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
Returns True if <model> is a Model of IGES Norm.
") IsSuitableModel;
		bool IsSuitableModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IGESData_Protocol::IsUnknownEntity ******/
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

		/****** IGESData_Protocol::NbResources ******/
		/****** md5 signature: 3c8410815357f0a892211359291d8070 ******/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the count of Resource Protocol. Here, none.
") NbResources;
		int NbResources();

		/****** IGESData_Protocol::NewModel ******/
		/****** md5 signature: 4e176eab7c6da9b73e274debab7af3fb ******/
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

		/****** IGESData_Protocol::TypeNumber ******/
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
Returns a Case Number, specific of each recognized Type Here, Undefined and Free Format Entities have the Number 1.
") TypeNumber;
		int TypeNumber(const opencascade::handle<Standard_Type> & atype);

		/****** IGESData_Protocol::UnknownEntity ******/
		/****** md5 signature: 169032e358d8d8ef4fd05f39169f96f5 ******/
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
		/****** md5 signature: ed86887e9b21ff9e4a423e567668c960 ******/
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
		virtual int CaseIGES(const int typenum, const int formnum);

		/****** IGESData_ReadWriteModule::CaseNum ******/
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
Translates the Type of record <num> in <data> to a positive Case Number, or 0 if failed. Works with IGESReaderData which provides Type & Form Numbers, and calls CaseIGES (see below).
") CaseNum;
		int CaseNum(const opencascade::handle<Interface_FileReaderData> & data, const int num);

		/****** IGESData_ReadWriteModule::Read ******/
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
General Read Function. See IGESReaderTool for more info.
") Read;
		void Read(const int CN, const opencascade::handle<Interface_FileReaderData> & data, const int num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<Standard_Transient> & ent);

		/****** IGESData_ReadWriteModule::ReadOwnParams ******/
		/****** md5 signature: 3a683b15c75377f2978f987ec637a979 ******/
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
		virtual void ReadOwnParams(const int CN, const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****** IGESData_ReadWriteModule::WriteOwnParams ******/
		/****** md5 signature: 54ae2ede18b74f2dd4bebdff953d28c5 ******/
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
		virtual void WriteOwnParams(const int CN, const opencascade::handle<IGESData_IGESEntity> & ent, IGESData_IGESWriter & IW);

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
		/****** md5 signature: fc2d555d24e47499a27818f023accdb3 ******/
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
		bool Select(const opencascade::handle<IGESData_IGESEntity> & obj, opencascade::handle<IGESData_SpecificModule> & module, Standard_Integer &OutValue);

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
		/****** md5 signature: 871238ccb7812cf05419d4dd89dab67c ******/
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
		virtual bool OwnCorrect(const int CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_SpecificModule::OwnDump ******/
		/****** md5 signature: c8c5e761af7b27eee2cb81b6ab056909 ******/
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
		virtual void OwnDump(const int CN, const opencascade::handle<IGESData_IGESEntity> & ent, const IGESData_IGESDumper & dumper, std::ostream &OutValue, const int own);

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
		/****** md5 signature: d58aa834264eb1d2bc54fb1ef9065df7 ******/
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
		bool AnalyseLocation(const gp_GTrsf & loc, gp_Trsf & result);

		/****** IGESData_ToolLocation::ConvertLocation ******/
		/****** md5 signature: 43ad8490b4563a4045d020c5e70eecb3 ******/
		%feature("compactdefaultargs") ConvertLocation;
		%feature("autodoc", "
Parameters
----------
prec: double
loc: gp_GTrsf
result: gp_Trsf
uni: double (optional, default to 1)

Return
-------
bool

Description
-----------
Conversion of a Location, from GTrsf form to Trsf form Works with a precision given as argument. Returns True if the Conversion is possible, (hence, <result> contains the converted location), False else <unit>, if given, indicates the unit in which <loc> is defined in meters. It concerns the translation part (to be converted. //! As a class method, it can be called separately.
") ConvertLocation;
		static bool ConvertLocation(const double prec, const gp_GTrsf & loc, gp_Trsf & result, const double uni = 1);

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
		/****** md5 signature: 2fc5c1f9c99408896cca3e2d7482d5fd ******/
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
		bool HasParent(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_ToolLocation::HasParentByAssociativity ******/
		/****** md5 signature: 21961e53911a081ad9e77170bcd85e56 ******/
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
		bool HasParentByAssociativity(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_ToolLocation::HasTransf ******/
		/****** md5 signature: 23baf648075b0ea53e07f8ef73253559 ******/
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
		bool HasTransf(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_ToolLocation::IsAmbiguous ******/
		/****** md5 signature: 0bad7c00204cd3ab36ff37a68e2e2596 ******/
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
		bool IsAmbiguous(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_ToolLocation::IsAssociativity ******/
		/****** md5 signature: 31621cd9bbfc84cf010a0d08a7849cc8 ******/
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
		bool IsAssociativity(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_ToolLocation::IsTransf ******/
		/****** md5 signature: 17ab229d4a0d1f1b5b5a28a2859865b0 ******/
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
		bool IsTransf(const opencascade::handle<IGESData_IGESEntity> & ent);

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
		/****** md5 signature: f9c41d0388ab8dedd7f97163565c355a ******/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "
Parameters
----------
prec: double

Return
-------
None

Description
-----------
Sets a precision for the Analysis of Locations (default by constructor is 1.E-05).
") SetPrecision;
		void SetPrecision(const double prec);

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
		/****** md5 signature: 66556dc6152f930c4bf81c147fdcf463 ******/
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
		bool Select(const opencascade::handle<IGESData_IGESEntity> & obj, opencascade::handle<IGESData_ReadWriteModule> & module, Standard_Integer &OutValue);

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
		/****** md5 signature: 06f4bd4bac643698d7bfbfe663662f9c ******/
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
		IGESData_DirChecker DirChecker(const int CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESData_DefaultGeneral::NewVoid ******/
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
Specific creation of a new void entity (UndefinedEntity only).
") NewVoid;
		bool NewVoid(const int CN, opencascade::handle<Standard_Transient> & entto);

		/****** IGESData_DefaultGeneral::OwnCheckCase ******/
		/****** md5 signature: 2a5e04523b952b8e6a44224bce15836c ******/
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
		void OwnCheckCase(const int CN, const opencascade::handle<IGESData_IGESEntity> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****** IGESData_DefaultGeneral::OwnCopyCase ******/
		/****** md5 signature: 815b2747b3640ba3fcc115728c02532e ******/
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
		void OwnCopyCase(const int CN, const opencascade::handle<IGESData_IGESEntity> & entfrom, const opencascade::handle<IGESData_IGESEntity> & entto, Interface_CopyTool & TC);

		/****** IGESData_DefaultGeneral::OwnSharedCase ******/
		/****** md5 signature: 3b0a5840356eebeb8c71901f7742473e ******/
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
		void OwnSharedCase(const int CN, const opencascade::handle<IGESData_IGESEntity> & ent, Interface_EntityIterator & iter);

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
		/****** md5 signature: aab069f62219feaf509e7d0bad34539b ******/
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
		void OwnDump(const int CN, const opencascade::handle<IGESData_IGESEntity> & ent, const IGESData_IGESDumper & dumper, std::ostream &OutValue, const int own);

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
		/****** md5 signature: 3c8410815357f0a892211359291d8070 ******/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the count of Resources: the count of Added Protocols.
") NbResources;
		int NbResources();

		/****** IGESData_FileProtocol::Resource ******/
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
Returns a Resource, given a rank (rank of call to Add).
") Resource;
		opencascade::handle<Interface_Protocol> Resource(const int num);

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
		/****** md5 signature: 51fb063bc23725fd5f362ca57e5b536f ******/
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
		bool HasLevelNumber(const int level);

		/****** IGESData_LevelListEntity::LevelNumber ******/
		/****** md5 signature: 67fb8317d645839ccd1d53d5bf2d34ef ******/
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
		virtual int LevelNumber(const int num);

		/****** IGESData_LevelListEntity::NbLevelNumbers ******/
		/****** md5 signature: 964aa6ac6357fbd898400c0532d421f9 ******/
		%feature("compactdefaultargs") NbLevelNumbers;
		%feature("autodoc", "Return
-------
int

Description
-----------
Must return the count of levels.
") NbLevelNumbers;
		virtual int NbLevelNumbers();

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
		/****** md5 signature: 0efb06a580a0e79314e266cd4e9c8b1c ******/
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
		virtual opencascade::handle<IGESData_IGESEntity> Child(const int num);

		/****** IGESData_SingleParentEntity::NbChildren ******/
		/****** md5 signature: 16dff739e0188c79e6a04e07b7fb9714 ******/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of Entities designated as children.
") NbChildren;
		virtual int NbChildren();

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
		/****** md5 signature: 9912c34c5e6d96f006043167f5735f9d ******/
		%feature("compactdefaultargs") DefColor;
		%feature("autodoc", "Return
-------
IGESData_DefType

Description
-----------
returns Error status if necessary, else calls original method.
") DefColor;
		IGESData_DefType DefColor();

		/****** IGESData_UndefinedEntity::DefLevel ******/
		/****** md5 signature: cb2b1cdb6e89cf49ced5bbbbe8984b89 ******/
		%feature("compactdefaultargs") DefLevel;
		%feature("autodoc", "Return
-------
IGESData_DefList

Description
-----------
returns Error status if necessary, else calls original method.
") DefLevel;
		IGESData_DefList DefLevel();

		/****** IGESData_UndefinedEntity::DefLineFont ******/
		/****** md5 signature: 975de5b346c968ee5195bde8e280a15b ******/
		%feature("compactdefaultargs") DefLineFont;
		%feature("autodoc", "Return
-------
IGESData_DefType

Description
-----------
returns Error status if necessary, else calls original method.
") DefLineFont;
		IGESData_DefType DefLineFont();

		/****** IGESData_UndefinedEntity::DefView ******/
		/****** md5 signature: 66f292393c0b5d881698b405b0f07bda ******/
		%feature("compactdefaultargs") DefView;
		%feature("autodoc", "Return
-------
IGESData_DefList

Description
-----------
returns Error status if necessary, else calls original method.
") DefView;
		IGESData_DefList DefView();

		/****** IGESData_UndefinedEntity::DirStatus ******/
		/****** md5 signature: d3657712c21a95d884ae553aa3e3e6df ******/
		%feature("compactdefaultargs") DirStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns Directory Error Status (used for Copy).
") DirStatus;
		int DirStatus();

		/****** IGESData_UndefinedEntity::HasSubScriptNumber ******/
		/****** md5 signature: cb0452c3ba0259eb01fed39d29113c18 ******/
		%feature("compactdefaultargs") HasSubScriptNumber;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns Error status if necessary, else calls original method (that is, if SubScript field is not blank or positive integer).
") HasSubScriptNumber;
		bool HasSubScriptNumber();

		/****** IGESData_UndefinedEntity::IsOKDirPart ******/
		/****** md5 signature: 16ca1a28e486c30f70ff5ade3573987c ******/
		%feature("compactdefaultargs") IsOKDirPart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
says if DirPart is OK or not (if not, it is erroneous) Note that if it is not, Def* methods can return Error status.
") IsOKDirPart;
		bool IsOKDirPart();

		/****** IGESData_UndefinedEntity::ReadDir ******/
		/****** md5 signature: f403a93ce71c9ba86d23bbe7ccbdd97e ******/
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
		virtual bool ReadDir(const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_DirPart & DP, opencascade::handle<Interface_Check> & ach);

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
		/****** md5 signature: 95cdd497d50f62d05a36f5d9ed71f10b ******/
		%feature("compactdefaultargs") IsSingle;
		%feature("autodoc", "Return
-------
bool

Description
-----------
says if 'me' is a Single View (True) or a List of Views (False).
") IsSingle;
		virtual bool IsSingle();

		/****** IGESData_ViewKindEntity::NbViews ******/
		/****** md5 signature: 95ee3df511cbcdf60970a966d2dbf401 ******/
		%feature("compactdefaultargs") NbViews;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of Views for a List of Views. For a Single View, may return simply 1.
") NbViews;
		virtual int NbViews();

		/****** IGESData_ViewKindEntity::ViewItem ******/
		/****** md5 signature: 0dbc89d3546f7458a63b22a21dd4773c ******/
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
		virtual opencascade::handle<IGESData_ViewKindEntity> ViewItem(const int num);

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
		/****** md5 signature: afefa14844d5fac59a79248a4f32832f ******/
		%feature("compactdefaultargs") AddEntities;
		%feature("autodoc", "
Parameters
----------
ents: NCollection_HArray1<

Return
-------
None

Description
-----------
Adds a set of Entities, given as a HArray1OfIGESEntity Causes creation of: an Integer Parameter which gives count of Entities, then the list of Entities of the Array Error if an Entity is not an IGESEntity All these Entities will be interpreted as 'Positive Pointers' by IGESWriter.
") AddEntities;
		void AddEntities(const opencascade::handle<NCollection_HArray1<opencascade::handle<IGESData_IGESEntity>> > & ents);

		/****** IGESData_FreeFormatEntity::AddEntity ******/
		/****** md5 signature: 3a502aec2cb97399764f67d087329483 ******/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "
Parameters
----------
ptype: Interface_ParamType
ent: IGESData_IGESEntity
negative: bool (optional, default to false)

Return
-------
None

Description
-----------
Adds a Parameter which references an Entity. If the Entity is Null, the added parameter will define a 'Null Pointer' (0) If <negative> is given True, this will command Sending to File (see IGESWriter) to produce a 'Negative Pointer' (Default is False).
") AddEntity;
		void AddEntity(const Interface_ParamType ptype, const opencascade::handle<IGESData_IGESEntity> & ent, const bool negative = false);

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
		/****** md5 signature: ee03aecf29a195760484275903421292 ******/
		%feature("compactdefaultargs") AddLiteral;
		%feature("autodoc", "
Parameters
----------
ptype: Interface_ParamType
val: char *

Return
-------
None

Description
-----------
Adds a literal Parameter to the list (builds an HAsciiString).
") AddLiteral;
		void AddLiteral(const Interface_ParamType ptype, const char * const val);

		/****** IGESData_FreeFormatEntity::AddNegativePointers ******/
		/****** md5 signature: 66815cbf776ba2765b0910477f787671 ******/
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
		/****** md5 signature: 38da39812a55b2189e82166947b5aa5d ******/
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
		bool IsNegativePointer(const int num);

		/****** IGESData_FreeFormatEntity::IsParamEntity ******/
		/****** md5 signature: 54d50dbb8acda69f9f7f32ee35bba080 ******/
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
		bool IsParamEntity(const int num);

		/****** IGESData_FreeFormatEntity::NbParams ******/
		/****** md5 signature: 3d5942837081abb877dd0a91d1f0a57f ******/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives count of recorded parameters.
") NbParams;
		int NbParams();

		/****** IGESData_FreeFormatEntity::NegativePointers ******/
		/****** md5 signature: cd18e2526df58391bd25ae3adfb8bb26 ******/
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
		/****** md5 signature: d91e3cd4ff0ad38e16bdeed3b26a9c4b ******/
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
		bool ParamData(const int num, Interface_ParamType & ptype, opencascade::handle<IGESData_IGESEntity> & ent, opencascade::handle<TCollection_HAsciiString> &OutValue);

		/****** IGESData_FreeFormatEntity::ParamEntity ******/
		/****** md5 signature: cf69465ec7bcc77dabc72896ebb76424 ******/
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
		opencascade::handle<IGESData_IGESEntity> ParamEntity(const int num);

		/****** IGESData_FreeFormatEntity::ParamType ******/
		/****** md5 signature: 561418a28e8f194c5a0ff3ab3fec26a2 ******/
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
		Interface_ParamType ParamType(const int num);

		/****** IGESData_FreeFormatEntity::ParamValue ******/
		/****** md5 signature: a2d933f421389542d0a4e1715ec08e45 ******/
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
		opencascade::handle<TCollection_HAsciiString> ParamValue(const int num);

		/****** IGESData_FreeFormatEntity::SetFormNumber ******/
		/****** md5 signature: 8ff3af51eca8f325760457ef93539a94 ******/
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
		void SetFormNumber(const int formnum);

		/****** IGESData_FreeFormatEntity::SetTypeNumber ******/
		/****** md5 signature: 4ad91c0eda5743f2fc2f07139a0259a7 ******/
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
		void SetTypeNumber(const int typenum);

		/****** IGESData_FreeFormatEntity::WriteOwnParams ******/
		/****** md5 signature: ea18458846316170be43e3b4450a518b ******/
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
		void WriteOwnParams(IGESData_IGESWriter & IW);

};


%make_alias(IGESData_FreeFormatEntity)

%extend IGESData_FreeFormatEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class IGESData_HArray1OfIGESEntity : public NCollection_Array1<opencascade::handle<IGESData_IGESEntity>>, public Standard_Transient {
  public:
    IGESData_HArray1OfIGESEntity(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESData_HArray1OfIGESEntity(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<IGESData_IGESEntity>>::value_type& theValue);
    IGESData_HArray1OfIGESEntity(const NCollection_Array1<opencascade::handle<IGESData_IGESEntity>>& theOther);
    const NCollection_Array1<opencascade::handle<IGESData_IGESEntity>>& Array1();
    NCollection_Array1<opencascade::handle<IGESData_IGESEntity>>& ChangeArray1();
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
