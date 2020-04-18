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
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Prepares general dynamic data used for igesdata specifically : protocol and modules, which treat undefinedentity.

Returns
-------
None
") Init;
		static void Init();

		/****************** Protocol ******************/
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
		%feature("compactdefaultargs") IGESData_BasicEditor;
		%feature("autodoc", "Creates an empty basic editor which should be initialized via init() method.

Returns
-------
None
") IGESData_BasicEditor;
		 IGESData_BasicEditor();

		/****************** IGESData_BasicEditor ******************/
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
		%feature("compactdefaultargs") AutoCorrectModel;
		%feature("autodoc", "Performs auto-correction on the whole model returns the count of modified entities.

Returns
-------
int
") AutoCorrectModel;
		Standard_Integer AutoCorrectModel();

		/****************** ComputeStatus ******************/
		%feature("compactdefaultargs") ComputeStatus;
		%feature("autodoc", "Performs the re-computation of status on the whole model (subordinate status and use flag of each iges entity), which can have required values according the way they are referenced (see definitions of logical use, physical use, etc...).

Returns
-------
None
") ComputeStatus;
		void ComputeStatus();

		/****************** DraftingMax ******************/
		%feature("compactdefaultargs") DraftingMax;
		%feature("autodoc", "Returns the maximum allowed value for drafting flag.

Returns
-------
int
") DraftingMax;
		static Standard_Integer DraftingMax();

		/****************** DraftingName ******************/
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
		%feature("compactdefaultargs") IGESVersionMax;
		%feature("autodoc", "Returns the maximum allowed value for igesversion flag.

Returns
-------
int
") IGESVersionMax;
		static Standard_Integer IGESVersionMax();

		/****************** IGESVersionName ******************/
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
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the designated model.

Returns
-------
opencascade::handle<IGESData_IGESModel>
") Model;
		opencascade::handle<IGESData_IGESModel> Model();

		/****************** SetUnitFlag ******************/
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
		%feature("compactdefaultargs") IGESData_DefSwitch;
		%feature("autodoc", "Creates a defswitch as void.

Returns
-------
None
") IGESData_DefSwitch;
		 IGESData_DefSwitch();

		/****************** DefType ******************/
		%feature("compactdefaultargs") DefType;
		%feature("autodoc", "Returns deftype status (void,reference,rank).

Returns
-------
IGESData_DefType
") DefType;
		IGESData_DefType DefType();

		/****************** SetRank ******************/
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
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "Sets defswitch to 'reference' status (in file : integer < 0).

Returns
-------
None
") SetReference;
		void SetReference();

		/****************** SetVoid ******************/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Sets defswitch to 'void' status (in file : integer = 0).

Returns
-------
None
") SetVoid;
		void SetVoid();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") IGESData_DirChecker;
		%feature("autodoc", "Returns a dirchecker, with no criterium at all to be checked.

Returns
-------
None
") IGESData_DirChecker;
		 IGESData_DirChecker();

		/****************** IGESData_DirChecker ******************/
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
		%feature("compactdefaultargs") BlankStatusIgnored;
		%feature("autodoc", "Sets blank status to be ignored (should not be defined, or its value should be 0).

Returns
-------
None
") BlankStatusIgnored;
		void BlankStatusIgnored();

		/****************** BlankStatusRequired ******************/
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
		%feature("compactdefaultargs") HierarchyStatusIgnored;
		%feature("autodoc", "Sets hierarchy status to be ignored (should not be defined, or its value should be 0).

Returns
-------
None
") HierarchyStatusIgnored;
		void HierarchyStatusIgnored();

		/****************** HierarchyStatusRequired ******************/
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
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true if at least one criterium has already been set allows user to store a dirchecker (static variable) then ask if it has been set before setting it.

Returns
-------
bool
") IsSet;
		Standard_Boolean IsSet();

		/****************** LineFont ******************/
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
		%feature("compactdefaultargs") SetDefault;
		%feature("autodoc", "Sets a dirchecker with most current criteria, that is : structure ignored ( worths call structure(crit = defvoid) ).

Returns
-------
None
") SetDefault;
		void SetDefault();

		/****************** Structure ******************/
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
		%feature("compactdefaultargs") SubordinateStatusIgnored;
		%feature("autodoc", "Sets subordinate status to be ignored (should not be defined, or its value should be 0).

Returns
-------
None
") SubordinateStatusIgnored;
		void SubordinateStatusIgnored();

		/****************** SubordinateStatusRequired ******************/
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
		%feature("compactdefaultargs") UseFlagIgnored;
		%feature("autodoc", "Sets blank status to be ignored (should not be defined, or its value should be 0).

Returns
-------
None
") UseFlagIgnored;
		void UseFlagIgnored();

		/****************** UseFlagRequired ******************/
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
		%feature("compactdefaultargs") IGESData_DirPart;
		%feature("autodoc", "Creates an empty dirpart, ready to be filled by init.

Returns
-------
None
") IGESData_DirPart;
		 IGESData_DirPart();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns 'type' and 'form' info, used to recognize the entity.

Returns
-------
IGESData_IGESType
") Type;
		IGESData_IGESType Type();

		/****************** Values ******************/
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
		%feature("compactdefaultargs") IGESData_GlobalNodeOfSpecificLib;
		%feature("autodoc", "Creates an empty globalnode, with no next.

Returns
-------
None
") IGESData_GlobalNodeOfSpecificLib;
		 IGESData_GlobalNodeOfSpecificLib();

		/****************** Add ******************/
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
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module stored in a given globalnode.

Returns
-------
opencascade::handle<IGESData_SpecificModule>
") Module;
		const opencascade::handle<IGESData_SpecificModule> & Module();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next globalnode. if none is defined, returned value is a null handle.

Returns
-------
opencascade::handle<IGESData_GlobalNodeOfSpecificLib>
") Next;
		const opencascade::handle<IGESData_GlobalNodeOfSpecificLib> & Next();

		/****************** Protocol ******************/
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
		%feature("compactdefaultargs") IGESData_GlobalNodeOfWriterLib;
		%feature("autodoc", "Creates an empty globalnode, with no next.

Returns
-------
None
") IGESData_GlobalNodeOfWriterLib;
		 IGESData_GlobalNodeOfWriterLib();

		/****************** Add ******************/
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
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module stored in a given globalnode.

Returns
-------
opencascade::handle<IGESData_ReadWriteModule>
") Module;
		const opencascade::handle<IGESData_ReadWriteModule> & Module();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next globalnode. if none is defined, returned value is a null handle.

Returns
-------
opencascade::handle<IGESData_GlobalNodeOfWriterLib>
") Next;
		const opencascade::handle<IGESData_GlobalNodeOfWriterLib> & Next();

		/****************** Protocol ******************/
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
		%feature("compactdefaultargs") IGESData_GlobalSection;
		%feature("autodoc", "Creates an empty globalsection, ready to be filled, warning : no default value is provided.

Returns
-------
None
") IGESData_GlobalSection;
		 IGESData_GlobalSection();

		/****************** ApplicationProtocol ******************/
		%feature("compactdefaultargs") ApplicationProtocol;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ApplicationProtocol;
		opencascade::handle<TCollection_HAsciiString> ApplicationProtocol();

		/****************** AuthorName ******************/
		%feature("compactdefaultargs") AuthorName;
		%feature("autodoc", "Returns the name of the iges file author.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") AuthorName;
		opencascade::handle<TCollection_HAsciiString> AuthorName();

		/****************** CompanyName ******************/
		%feature("compactdefaultargs") CompanyName;
		%feature("autodoc", "Returns the name of the company where the iges file was written.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") CompanyName;
		opencascade::handle<TCollection_HAsciiString> CompanyName();

		/****************** CopyRefs ******************/
		%feature("compactdefaultargs") CopyRefs;
		%feature("autodoc", "Copies data referenced by handle (that is, strings) usefull to 'isolate' a globalsection after copy by '=' (from a model to another model for instance).

Returns
-------
None
") CopyRefs;
		void CopyRefs();

		/****************** Date ******************/
		%feature("compactdefaultargs") Date;
		%feature("autodoc", "Returns the iges file creation date.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Date;
		opencascade::handle<TCollection_HAsciiString> Date();

		/****************** DraftingStandard ******************/
		%feature("compactdefaultargs") DraftingStandard;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") DraftingStandard;
		Standard_Integer DraftingStandard();

		/****************** EndMark ******************/
		%feature("compactdefaultargs") EndMark;
		%feature("autodoc", "Returns the record delimiter character.

Returns
-------
Standard_Character
") EndMark;
		Standard_Character EndMark();

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Returns the name of the iges file.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FileName;
		opencascade::handle<TCollection_HAsciiString> FileName();

		/****************** HasApplicationProtocol ******************/
		%feature("compactdefaultargs") HasApplicationProtocol;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasApplicationProtocol;
		Standard_Boolean HasApplicationProtocol();

		/****************** HasLastChangeDate ******************/
		%feature("compactdefaultargs") HasLastChangeDate;
		%feature("autodoc", "Returns true if the date and time when the model was created or last modified are specified, i.e. not defaulted to null.

Returns
-------
bool
") HasLastChangeDate;
		Standard_Boolean HasLastChangeDate();

		/****************** HasMaxCoord ******************/
		%feature("compactdefaultargs") HasMaxCoord;
		%feature("autodoc", "Returns true if the approximate maximum coordinate value found in the model is greater than 0.

Returns
-------
bool
") HasMaxCoord;
		Standard_Boolean HasMaxCoord();

		/****************** IGESVersion ******************/
		%feature("compactdefaultargs") IGESVersion;
		%feature("autodoc", "Returns the iges version that the iges file was written in.

Returns
-------
int
") IGESVersion;
		Standard_Integer IGESVersion();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") IntegerBits;
		%feature("autodoc", "Returns the number of binary bits for integer representations.

Returns
-------
int
") IntegerBits;
		Standard_Integer IntegerBits();

		/****************** InterfaceVersion ******************/
		%feature("compactdefaultargs") InterfaceVersion;
		%feature("autodoc", "Returns the name of the pre-processor used to write the iges file.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") InterfaceVersion;
		opencascade::handle<TCollection_HAsciiString> InterfaceVersion();

		/****************** LastChangeDate ******************/
		%feature("compactdefaultargs") LastChangeDate;
		%feature("autodoc", "Returns the date and time when the model was created or last modified (for iges 5.1 and later).

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") LastChangeDate;
		opencascade::handle<TCollection_HAsciiString> LastChangeDate();

		/****************** LineWeightGrad ******************/
		%feature("compactdefaultargs") LineWeightGrad;
		%feature("autodoc", "Returns the maximum number of line weight gradations.

Returns
-------
int
") LineWeightGrad;
		Standard_Integer LineWeightGrad();

		/****************** MaxCoord ******************/
		%feature("compactdefaultargs") MaxCoord;
		%feature("autodoc", "Returns the approximate maximum coordinate value found in the model.

Returns
-------
float
") MaxCoord;
		Standard_Real MaxCoord();

		/****************** MaxDigitsDouble ******************/
		%feature("compactdefaultargs") MaxDigitsDouble;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") MaxDigitsDouble;
		Standard_Integer MaxDigitsDouble();

		/****************** MaxDigitsSingle ******************/
		%feature("compactdefaultargs") MaxDigitsSingle;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") MaxDigitsSingle;
		Standard_Integer MaxDigitsSingle();

		/****************** MaxLineWeight ******************/
		%feature("compactdefaultargs") MaxLineWeight;
		%feature("autodoc", "Returns the of maximum line weight width in iges file units.

Returns
-------
float
") MaxLineWeight;
		Standard_Real MaxLineWeight();

		/****************** MaxMaxCoord ******************/
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
		%feature("compactdefaultargs") MaxPower10Double;
		%feature("autodoc", "Returns the maximum power of a decimal representation of a double-precision floating point number in the sending system.

Returns
-------
int
") MaxPower10Double;
		Standard_Integer MaxPower10Double();

		/****************** MaxPower10Single ******************/
		%feature("compactdefaultargs") MaxPower10Single;
		%feature("autodoc", "Returns the maximum power of a decimal representation of a single-precision floating point number in the sending system.

Returns
-------
int
") MaxPower10Single;
		Standard_Integer MaxPower10Single();

		/****************** NewDateString ******************/
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
		%feature("compactdefaultargs") Params;
		%feature("autodoc", "Returns all contained data in the form of a paramset remark : strings are given under hollerith form.

Returns
-------
opencascade::handle<Interface_ParamSet>
") Params;
		opencascade::handle<Interface_ParamSet> Params();

		/****************** ReceiveName ******************/
		%feature("compactdefaultargs") ReceiveName;
		%feature("autodoc", "Returns the name of the receiving system.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ReceiveName;
		opencascade::handle<TCollection_HAsciiString> ReceiveName();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the resolution used in the iges file.

Returns
-------
float
") Resolution;
		Standard_Real Resolution();

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Returns the scale used in the iges file.

Returns
-------
float
") Scale;
		Standard_Real Scale();

		/****************** SendName ******************/
		%feature("compactdefaultargs") SendName;
		%feature("autodoc", "Returns the name of the sending system.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") SendName;
		opencascade::handle<TCollection_HAsciiString> SendName();

		/****************** Separator ******************/
		%feature("compactdefaultargs") Separator;
		%feature("autodoc", "Returns the parameter delimiter character.

Returns
-------
Standard_Character
") Separator;
		Standard_Character Separator();

		/****************** SetApplicationProtocol ******************/
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
		%feature("compactdefaultargs") SetLastChangeDate;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetLastChangeDate;
		void SetLastChangeDate();

		/****************** SetLastChangeDate ******************/
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
		%feature("compactdefaultargs") SystemId;
		%feature("autodoc", "Returns the native system id of the system that created the iges file.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") SystemId;
		opencascade::handle<TCollection_HAsciiString> SystemId();

		/****************** TranslatedFromHollerith ******************/
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
		%feature("compactdefaultargs") UnitFlag;
		%feature("autodoc", "Returns the unit flag that was used to write the iges file.

Returns
-------
int
") UnitFlag;
		Standard_Integer UnitFlag();

		/****************** UnitName ******************/
		%feature("compactdefaultargs") UnitName;
		%feature("autodoc", "Returns the name of the unit the iges file was written in.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") UnitName;
		opencascade::handle<TCollection_HAsciiString> UnitName();

		/****************** UnitValue ******************/
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
		%feature("compactdefaultargs") ArePresentAssociativities;
		%feature("autodoc", "Returns true if the entity is defined with an associativity list, even empty (that is, file contains its length 0) else, the file contained no idencation at all about this list.

Returns
-------
bool
") ArePresentAssociativities;
		Standard_Boolean ArePresentAssociativities();

		/****************** ArePresentProperties ******************/
		%feature("compactdefaultargs") ArePresentProperties;
		%feature("autodoc", "Returns true if the entity is defined with a property list, even empty (that is, file contains its length 0) else, the file contained no idencation at all about this list.

Returns
-------
bool
") ArePresentProperties;
		Standard_Boolean ArePresentProperties();

		/****************** Associate ******************/
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
		%feature("compactdefaultargs") Associativities;
		%feature("autodoc", "Returns the associativity list under the form of an entityiterator.

Returns
-------
Interface_EntityIterator
") Associativities;
		Interface_EntityIterator Associativities();

		/****************** BlankStatus ******************/
		%feature("compactdefaultargs") BlankStatus;
		%feature("autodoc", "Gives blank status (0 visible, 1 blanked).

Returns
-------
int
") BlankStatus;
		Standard_Integer BlankStatus();

		/****************** CResValues ******************/
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
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Returns the iges entity which describes the color of the entity. returns a null handle if this entity was defined as an integer.

Returns
-------
opencascade::handle<IGESData_ColorEntity>
") Color;
		opencascade::handle<IGESData_ColorEntity> Color();

		/****************** CompoundLocation ******************/
		%feature("compactdefaultargs") CompoundLocation;
		%feature("autodoc", "Returns location by taking in account a parent which has its own location : that one will be combined to that of <self> the parent is considered only if hasoneparent is true, else it is ignored and compoundlocation = location.

Returns
-------
gp_GTrsf
") CompoundLocation;
		gp_GTrsf CompoundLocation();

		/****************** DefColor ******************/
		%feature("compactdefaultargs") DefColor;
		%feature("autodoc", "Returns the definition status of color.

Returns
-------
IGESData_DefType
") DefColor;
		virtual IGESData_DefType DefColor();

		/****************** DefLevel ******************/
		%feature("compactdefaultargs") DefLevel;
		%feature("autodoc", "Returns the definition status of level.

Returns
-------
IGESData_DefList
") DefLevel;
		virtual IGESData_DefList DefLevel();

		/****************** DefLineFont ******************/
		%feature("compactdefaultargs") DefLineFont;
		%feature("autodoc", "Returns the definition status of linefont.

Returns
-------
IGESData_DefType
") DefLineFont;
		virtual IGESData_DefType DefLineFont();

		/****************** DefView ******************/
		%feature("compactdefaultargs") DefView;
		%feature("autodoc", "Returns the definition status of the view. this can be: none, one or several.

Returns
-------
IGESData_DefList
") DefView;
		virtual IGESData_DefList DefView();

		/****************** DirFieldEntity ******************/
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
		%feature("compactdefaultargs") FormNumber;
		%feature("autodoc", "Returns the form number for that type of an iges entity. the default form number is 0.

Returns
-------
int
") FormNumber;
		Standard_Integer FormNumber();

		/****************** HasLabelDisplay ******************/
		%feature("compactdefaultargs") HasLabelDisplay;
		%feature("autodoc", "Returns true if a labeldisplay mode is defined for this entity.

Returns
-------
bool
") HasLabelDisplay;
		Standard_Boolean HasLabelDisplay();

		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Says if a name is defined, as short label or as name property (property is looked first, else shortlabel is considered).

Returns
-------
bool
") HasName;
		Standard_Boolean HasName();

		/****************** HasOneParent ******************/
		%feature("compactdefaultargs") HasOneParent;
		%feature("autodoc", "Returns true if an entity has one and only one parent, defined by a singleparententity type associativity (explicit sharing). thus, implicit sharing remains defined at model level (see class toollocation).

Returns
-------
bool
") HasOneParent;
		Standard_Boolean HasOneParent();

		/****************** HasShortLabel ******************/
		%feature("compactdefaultargs") HasShortLabel;
		%feature("autodoc", "Returns true if a short label is defined. a short label is a non-blank 8-character string.

Returns
-------
bool
") HasShortLabel;
		Standard_Boolean HasShortLabel();

		/****************** HasStructure ******************/
		%feature("compactdefaultargs") HasStructure;
		%feature("autodoc", "Returns true if an igesentity is defined with a structure (it is normally reserved for certain classes, such as macros).

Returns
-------
bool
") HasStructure;
		Standard_Boolean HasStructure();

		/****************** HasSubScriptNumber ******************/
		%feature("compactdefaultargs") HasSubScriptNumber;
		%feature("autodoc", "Returns true if a subscript number is defined. a subscript number is an integer used to identify a label.

Returns
-------
bool
") HasSubScriptNumber;
		virtual Standard_Boolean HasSubScriptNumber();

		/****************** HasTransf ******************/
		%feature("compactdefaultargs") HasTransf;
		%feature("autodoc", "Returns true if a transformation matrix is defined.

Returns
-------
bool
") HasTransf;
		Standard_Boolean HasTransf();

		/****************** HierarchyStatus ******************/
		%feature("compactdefaultargs") HierarchyStatus;
		%feature("autodoc", "Gives hierarchy status (0-1-2).

Returns
-------
int
") HierarchyStatus;
		Standard_Integer HierarchyStatus();

		/****************** IGESType ******************/
		%feature("compactdefaultargs") IGESType;
		%feature("autodoc", "Gives iges typing info (includes 'type' and 'form' data).

Returns
-------
IGESData_IGESType
") IGESType;
		IGESData_IGESType IGESType();

		/****************** InitColor ******************/
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
		%feature("compactdefaultargs") LabelDisplay;
		%feature("autodoc", "Returns the label display associativity entity if there is one. returns a null handle if there is none.

Returns
-------
opencascade::handle<IGESData_LabelDisplayEntity>
") LabelDisplay;
		opencascade::handle<IGESData_LabelDisplayEntity> LabelDisplay();

		/****************** Level ******************/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "Returns the level the entity belongs to. returns -1 if the entity belongs to more than one level.

Returns
-------
int
") Level;
		Standard_Integer Level();

		/****************** LevelList ******************/
		%feature("compactdefaultargs") LevelList;
		%feature("autodoc", "Returns levellist if level is defined as a list. returns a null handle if deflevel is not defseveral.

Returns
-------
opencascade::handle<IGESData_LevelListEntity>
") LevelList;
		opencascade::handle<IGESData_LevelListEntity> LevelList();

		/****************** LineFont ******************/
		%feature("compactdefaultargs") LineFont;
		%feature("autodoc", "Returns linefont as an entity (if defined as reference) returns a null handle if deflinefont is not 'defreference'.

Returns
-------
opencascade::handle<IGESData_LineFontEntity>
") LineFont;
		opencascade::handle<IGESData_LineFontEntity> LineFont();

		/****************** LineWeight ******************/
		%feature("compactdefaultargs") LineWeight;
		%feature("autodoc", "Returns the true line weight, computed from lineweightnumber and global parameter in the model by call to setlineweight.

Returns
-------
float
") LineWeight;
		Standard_Real LineWeight();

		/****************** LineWeightNumber ******************/
		%feature("compactdefaultargs") LineWeightNumber;
		%feature("autodoc", "Returns the lineweight number (0 not defined), see also lineweight.

Returns
-------
int
") LineWeightNumber;
		Standard_Integer LineWeightNumber();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns location given by transf in directory part (see above) it must be considered for local definition : if the entity is set in a 'parent', that one can add its one location, but this is not taken in account here : see compoundlocation for that. if no transf is defined, returns identity if transf is itself compound, gives the final result.

Returns
-------
gp_GTrsf
") Location;
		gp_GTrsf Location();

		/****************** NameValue ******************/
		%feature("compactdefaultargs") NameValue;
		%feature("autodoc", "Returns name value as a string (property name or shortlabel) if subnumber is defined, it is concatenated after shortlabel as follows label(number). ignored with a property name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") NameValue;
		opencascade::handle<TCollection_HAsciiString> NameValue();

		/****************** NbAssociativities ******************/
		%feature("compactdefaultargs") NbAssociativities;
		%feature("autodoc", "Gives number of recorded associativities (0 no list defined).

Returns
-------
int
") NbAssociativities;
		Standard_Integer NbAssociativities();

		/****************** NbProperties ******************/
		%feature("compactdefaultargs") NbProperties;
		%feature("autodoc", "Gives number of recorded properties (0 no list defined).

Returns
-------
int
") NbProperties;
		Standard_Integer NbProperties();

		/****************** NbTypedAssociativities ******************/
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
		%feature("compactdefaultargs") Properties;
		%feature("autodoc", "Returns property list under the form of an entityiterator.

Returns
-------
Interface_EntityIterator
") Properties;
		Interface_EntityIterator Properties();

		/****************** RankColor ******************/
		%feature("compactdefaultargs") RankColor;
		%feature("autodoc", "Returns the color definition as an integer value if the color was defined as a rank. warning a negative value is returned if the color was defined as an entity.

Returns
-------
int
") RankColor;
		Standard_Integer RankColor();

		/****************** RankLineFont ******************/
		%feature("compactdefaultargs") RankLineFont;
		%feature("autodoc", "Returns linefont definition as an integer (if defined as rank) if linefont is defined as an entity, returns a negative value.

Returns
-------
int
") RankLineFont;
		Standard_Integer RankLineFont();

		/****************** RemoveProperty ******************/
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
		%feature("compactdefaultargs") ShortLabel;
		%feature("autodoc", "Returns the label value for this iges entity as a string. warning if the label is blank, this string is null.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ShortLabel;
		opencascade::handle<TCollection_HAsciiString> ShortLabel();

		/****************** SingleView ******************/
		%feature("compactdefaultargs") SingleView;
		%feature("autodoc", "Returns the view as a single view if it was defined as such and not as a list of views. warning a null handle is returned if defview does not have the value defone.

Returns
-------
opencascade::handle<IGESData_ViewKindEntity>
") SingleView;
		opencascade::handle<IGESData_ViewKindEntity> SingleView();

		/****************** Structure ******************/
		%feature("compactdefaultargs") Structure;
		%feature("autodoc", "Returns structure (used by some types of iges entities only) returns a null handle if structure is not defined.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Structure;
		opencascade::handle<IGESData_IGESEntity> Structure();

		/****************** SubScriptNumber ******************/
		%feature("compactdefaultargs") SubScriptNumber;
		%feature("autodoc", "Returns the integer subscript number used to identify this iges entity. warning 0 is returned if no subscript number is defined for this iges entity.

Returns
-------
int
") SubScriptNumber;
		Standard_Integer SubScriptNumber();

		/****************** SubordinateStatus ******************/
		%feature("compactdefaultargs") SubordinateStatus;
		%feature("autodoc", "Gives subordinate switch (0-1-2-3).

Returns
-------
int
") SubordinateStatus;
		Standard_Integer SubordinateStatus();

		/****************** Transf ******************/
		%feature("compactdefaultargs") Transf;
		%feature("autodoc", "Returns the transformation matrix (under iges definition) returns a null handle if there is none for a more complete use, see location & compoundlocation.

Returns
-------
opencascade::handle<IGESData_TransfEntity>
") Transf;
		opencascade::handle<IGESData_TransfEntity> Transf();

		/****************** TypeNumber ******************/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "Gives iges type number (often coupled with form number).

Returns
-------
int
") TypeNumber;
		Standard_Integer TypeNumber();

		/****************** TypedAssociativity ******************/
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
		%feature("compactdefaultargs") UniqueParent;
		%feature("autodoc", "Returns the unique parent (in the sense given by hasoneparent) error if there is none or several.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") UniqueParent;
		opencascade::handle<IGESData_IGESEntity> UniqueParent();

		/****************** UseFlag ******************/
		%feature("compactdefaultargs") UseFlag;
		%feature("autodoc", "Gives entity's use flag (0 to 5).

Returns
-------
int
") UseFlag;
		Standard_Integer UseFlag();

		/****************** VectorLocation ******************/
		%feature("compactdefaultargs") VectorLocation;
		%feature("autodoc", "Returns location considered for vectors, i.e. without its translation part. as location, it gives local definition.

Returns
-------
gp_GTrsf
") VectorLocation;
		gp_GTrsf VectorLocation();

		/****************** View ******************/
		%feature("compactdefaultargs") View;
		%feature("autodoc", "Returns the view of this iges entity. this view can be a single view or a list of views. warning a null handle is returned if the view is not defined.

Returns
-------
opencascade::handle<IGESData_ViewKindEntity>
") View;
		opencascade::handle<IGESData_ViewKindEntity> View();

		/****************** ViewList ******************/
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
		%feature("compactdefaultargs") IGESData_IGESModel;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESData_IGESModel;
		 IGESData_IGESModel();

		/****************** AddStartLine ******************/
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
		%feature("compactdefaultargs") ClearHeader;
		%feature("autodoc", "Erases all data specific to iges file header (start + global).

Returns
-------
None
") ClearHeader;
		void ClearHeader();

		/****************** ClearLabels ******************/
		%feature("compactdefaultargs") ClearLabels;
		%feature("autodoc", "Erases specific labels, i.e. does nothing.

Returns
-------
None
") ClearLabels;
		void ClearLabels();

		/****************** ClearStartSection ******************/
		%feature("compactdefaultargs") ClearStartSection;
		%feature("autodoc", "Clears the iges file start section.

Returns
-------
None
") ClearStartSection;
		void ClearStartSection();

		/****************** DNum ******************/
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
		%feature("compactdefaultargs") GlobalSection;
		%feature("autodoc", "Returns the global section of the iges file.

Returns
-------
IGESData_GlobalSection
") GlobalSection;
		const IGESData_GlobalSection & GlobalSection();

		/****************** NbStartLines ******************/
		%feature("compactdefaultargs") NbStartLines;
		%feature("autodoc", "Returns the count of recorded start lines.

Returns
-------
int
") NbStartLines;
		Standard_Integer NbStartLines();

		/****************** NewEmptyModel ******************/
		%feature("compactdefaultargs") NewEmptyModel;
		%feature("autodoc", "Returns a new empty model, same type as <self> i.e. igesmodel.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewEmptyModel;
		opencascade::handle<Interface_InterfaceModel> NewEmptyModel();

		/****************** PrintInfo ******************/
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
		%feature("compactdefaultargs") StartSection;
		%feature("autodoc", "Returns model's start section (list of comment lines).

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") StartSection;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> StartSection();

		/****************** StringLabel ******************/
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
		%feature("compactdefaultargs") DefaultLineWeight;
		%feature("autodoc", "Returns the recorded default line weight, if there is (else, returns 0).

Returns
-------
float
") DefaultLineWeight;
		Standard_Real DefaultLineWeight();

		/****************** DirPart ******************/
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
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "Returns the recorded global check.

Returns
-------
opencascade::handle<Interface_Check>
") GlobalCheck;
		opencascade::handle<Interface_Check> GlobalCheck();

		/****************** GlobalSection ******************/
		%feature("compactdefaultargs") GlobalSection;
		%feature("autodoc", "Returns header as globalsection.

Returns
-------
IGESData_GlobalSection
") GlobalSection;
		const IGESData_GlobalSection & GlobalSection();

		/****************** NbEntities ******************/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns count of recorded entities (i.e. size of directory).

Returns
-------
int
") NbEntities;
		virtual Standard_Integer NbEntities();

		/****************** SetDefaultLineWeight ******************/
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
		%feature("compactdefaultargs") SetEntityNumbers;
		%feature("autodoc", "Determines reference numbers in entitynumber fields (called by setentities from igesreadertool) works on 'integer' type parameters, because iges does not distinguish integer and entity refs : every integer which is odd and less than twice nbrecords can be an entity ref ... (ref number is then (n+1)/2 if n is the integer value).

Returns
-------
None
") SetEntityNumbers;
		void SetEntityNumbers();

		/****************** SetGlobalSection ******************/
		%feature("compactdefaultargs") SetGlobalSection;
		%feature("autodoc", "Reads header (as globalsection) content from the paramset after it has been filled by successive calls to addglobal.

Returns
-------
None
") SetGlobalSection;
		void SetGlobalSection();

		/****************** StartSection ******************/
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
		%feature("compactdefaultargs") IGESData_IGESType;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESData_IGESType;
		 IGESData_IGESType();

		/****************** IGESData_IGESType ******************/
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
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Returns 'form' data.

Returns
-------
int
") Form;
		Standard_Integer Form();

		/****************** IsEqual ******************/
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
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "Resets fields (usefull when an igestype is stored as mask).

Returns
-------
None
") Nullify;
		void Nullify();

		/****************** Type ******************/
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
		%feature("compactdefaultargs") IGESData_IGESWriter;
		%feature("autodoc", "Default constructor (not used) to satisfy the compiler.

Returns
-------
None
") IGESData_IGESWriter;
		 IGESData_IGESWriter();

		/****************** IGESData_IGESWriter ******************/
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
		%feature("compactdefaultargs") EndEntity;
		%feature("autodoc", "Declares end of sending an entity (ends param list by ';').

Returns
-------
None
") EndEntity;
		void EndEntity();

		/****************** FloatWriter ******************/
		%feature("compactdefaultargs") FloatWriter;
		%feature("autodoc", "Returns the embedded floatwriter, which controls sending reals use this method to access floatwriter in order to consult or change its options (mainformat, formatforrange,zerosuppress), because it is returned as the address of its field.

Returns
-------
Interface_FloatWriter
") FloatWriter;
		Interface_FloatWriter & FloatWriter();

		/****************** OwnParams ******************/
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
		%feature("compactdefaultargs") SectionS;
		%feature("autodoc", "Declares sending of s section (only a declaration) error if state is not initial.

Returns
-------
None
") SectionS;
		void SectionS();

		/****************** SectionStrings ******************/
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
		%feature("compactdefaultargs") SectionT;
		%feature("autodoc", "Declares sending of t section (only a declaration) error if does not follow entities sending.

Returns
-------
None
") SectionT;
		void SectionT();

		/****************** SectionsDP ******************/
		%feature("compactdefaultargs") SectionsDP;
		%feature("autodoc", "Prepares sending of list of entities, as sections d (directory list) and p (parameters lists, one per entity) entities will be then processed, one after the other error if sectiong has not be called just before.

Returns
-------
None
") SectionsDP;
		void SectionsDP();

		/****************** SendBoolean ******************/
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
		%feature("compactdefaultargs") IGESData_NodeOfSpecificLib;
		%feature("autodoc", "Creates an empty node, with no next.

Returns
-------
None
") IGESData_NodeOfSpecificLib;
		 IGESData_NodeOfSpecificLib();

		/****************** AddNode ******************/
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
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module designated by a precise node.

Returns
-------
opencascade::handle<IGESData_SpecificModule>
") Module;
		const opencascade::handle<IGESData_SpecificModule> & Module();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next node. if none was defined, returned value is a null handle.

Returns
-------
opencascade::handle<IGESData_NodeOfSpecificLib>
") Next;
		const opencascade::handle<IGESData_NodeOfSpecificLib> & Next();

		/****************** Protocol ******************/
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
		%feature("compactdefaultargs") IGESData_NodeOfWriterLib;
		%feature("autodoc", "Creates an empty node, with no next.

Returns
-------
None
") IGESData_NodeOfWriterLib;
		 IGESData_NodeOfWriterLib();

		/****************** AddNode ******************/
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
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the module designated by a precise node.

Returns
-------
opencascade::handle<IGESData_ReadWriteModule>
") Module;
		const opencascade::handle<IGESData_ReadWriteModule> & Module();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next node. if none was defined, returned value is a null handle.

Returns
-------
opencascade::handle<IGESData_NodeOfWriterLib>
") Next;
		const opencascade::handle<IGESData_NodeOfWriterLib> & Next();

		/****************** Protocol ******************/
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
		%feature("compactdefaultargs") Advance;
		%feature("autodoc", "Returns true if advance command has been set.

Returns
-------
bool
") Advance;
		Standard_Boolean Advance();

		/****************** Count ******************/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "Returns required count of items to be read.

Returns
-------
int
") Count;
		Standard_Integer Count();

		/****************** ItemSize ******************/
		%feature("compactdefaultargs") ItemSize;
		%feature("autodoc", "Returns length of item (count of parameters per item).

Returns
-------
int
") ItemSize;
		Standard_Integer ItemSize();

		/****************** Limit ******************/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "Returns (excluded) upper limit number for reading parameters.

Returns
-------
int
") Limit;
		Standard_Integer Limit();

		/****************** Offset ******************/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "Returns offset from which current term must be read in item.

Returns
-------
int
") Offset;
		Standard_Integer Offset();

		/****************** SetAdvance ******************/
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
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Returns (included) starting number for reading parameters.

Returns
-------
int
") Start;
		Standard_Integer Start();

		/****************** TermSize ******************/
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
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "Returns the check in a way which allows to work on it directly (i.e. messages added to the check are added to paramreader too).

Returns
-------
opencascade::handle<Interface_Check>
") CCheck;
		opencascade::handle<Interface_Check> & CCheck();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Returns the check note that any error signaled above is also recorded into it.

Returns
-------
opencascade::handle<Interface_Check>
") Check;
		const opencascade::handle<Interface_Check> & Check();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Resets state (stage, current param number, check with no fail).

Returns
-------
None
") Clear;
		void Clear();

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Creates a paramcursor from the current number, to read one parameter, and to advance current number after reading.

Returns
-------
IGESData_ParamCursor
") Current;
		IGESData_ParamCursor Current();

		/****************** CurrentList ******************/
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
		%feature("compactdefaultargs") CurrentNumber;
		%feature("autodoc", "Returns the current parameter number this notion is involved by the organisation of an iges list of parameter : it can be ended by two lists (associativities and properties), which can be empty, or even absent. hence, it is necessary to know, at the end of specific reading, how many parameters have been read : the optionnal lists follow.

Returns
-------
int
") CurrentNumber;
		Standard_Integer CurrentNumber();

		/****************** DefinedElseSkip ******************/
		%feature("compactdefaultargs") DefinedElseSkip;
		%feature("autodoc", "Allows to simply process a parameter which can be defaulted. waits on the current number a defined parameter or skips it : if the parameter <num> is defined, changes nothing and returns true hence, the next reading with current cursor will concern <num> if it is void, advances current position by one, and returns false the next reading will concern <num+1> (except if <num> = nbparams) //! this allows to process default values as follows (c++) : if (pr.definedelseskip()) { .. pr.read... (current parameter); } else { <current parameter> = default value .. nothing else to do with paramreader } for message.

Returns
-------
bool
") DefinedElseSkip;
		Standard_Boolean DefinedElseSkip();

		/****************** EndAll ******************/
		%feature("compactdefaultargs") EndAll;
		%feature("autodoc", "Passes directly to the end of reading process.

Returns
-------
None
") EndAll;
		void EndAll();

		/****************** EntityNumber ******************/
		%feature("compactdefaultargs") EntityNumber;
		%feature("autodoc", "Returns the entity number in the file.

Returns
-------
int
") EntityNumber;
		Standard_Integer EntityNumber();

		/****************** HasFailed ******************/
		%feature("compactdefaultargs") HasFailed;
		%feature("autodoc", "Says if fails have been recorded into the check.

Returns
-------
bool
") HasFailed;
		Standard_Boolean HasFailed();

		/****************** IsCheckEmpty ******************/
		%feature("compactdefaultargs") IsCheckEmpty;
		%feature("autodoc", "Returns true if the check is empty else, it has to be recorded with the read entity.

Returns
-------
bool
") IsCheckEmpty;
		Standard_Boolean IsCheckEmpty();

		/****************** IsParamDefined ******************/
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
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Returns number of parameters (minus the first one) following method skip the first parameter (1 gives the 2nd).

Returns
-------
int
") NbParams;
		Standard_Integer NbParams();

		/****************** NextStage ******************/
		%feature("compactdefaultargs") NextStage;
		%feature("autodoc", "Passes to next stage (must be linked with setting current).

Returns
-------
None
") NextStage;
		void NextStage();

		/****************** ParamEntity ******************/
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
		%feature("compactdefaultargs") IGESData_Protocol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESData_Protocol;
		 IGESData_Protocol();

		/****************** IsSuitableModel ******************/
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
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Gives the count of resource protocol. here, none.

Returns
-------
int
") NbResources;
		Standard_Integer NbResources();

		/****************** NewModel ******************/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Creates an empty model for iges norm.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****************** Resource ******************/
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
		%feature("compactdefaultargs") IGESData_SpecificLib;
		%feature("autodoc", "Creates an empty library : it will later by filled by method addprotocol.

Returns
-------
None
") IGESData_SpecificLib;
		 IGESData_SpecificLib();

		/****************** AddProtocol ******************/
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
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list of modules of a library (can be used to redefine the order of modules before action : clear then refill the library by calls to addprotocol).

Returns
-------
None
") Clear;
		void Clear();

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the current module in the iteration.

Returns
-------
opencascade::handle<IGESData_SpecificModule>
") Module;
		const opencascade::handle<IGESData_SpecificModule> & Module();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there are more modules to iterate on.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Iterates by getting the next module in the list if there is none, the exception will be raised by value.

Returns
-------
None
") Next;
		void Next();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the current protocol in the iteration.

Returns
-------
opencascade::handle<IGESData_Protocol>
") Protocol;
		const opencascade::handle<IGESData_Protocol> & Protocol();

		/****************** Select ******************/
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
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "Sets a library to be defined with the complete global list (all the couples protocol/modules recorded in it).

Returns
-------
None
") SetComplete;
		void SetComplete();

		/****************** SetGlobal ******************/
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
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Does the effective work of determining locations of entities.

Returns
-------
None
") Load;
		void Load();

		/****************** Parent ******************/
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
		%feature("compactdefaultargs") IGESData_WriterLib;
		%feature("autodoc", "Creates an empty library : it will later by filled by method addprotocol.

Returns
-------
None
") IGESData_WriterLib;
		 IGESData_WriterLib();

		/****************** AddProtocol ******************/
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
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list of modules of a library (can be used to redefine the order of modules before action : clear then refill the library by calls to addprotocol).

Returns
-------
None
") Clear;
		void Clear();

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "Returns the current module in the iteration.

Returns
-------
opencascade::handle<IGESData_ReadWriteModule>
") Module;
		const opencascade::handle<IGESData_ReadWriteModule> & Module();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there are more modules to iterate on.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Iterates by getting the next module in the list if there is none, the exception will be raised by value.

Returns
-------
None
") Next;
		void Next();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the current protocol in the iteration.

Returns
-------
opencascade::handle<IGESData_Protocol>
") Protocol;
		const opencascade::handle<IGESData_Protocol> & Protocol();

		/****************** Select ******************/
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
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "Sets a library to be defined with the complete global list (all the couples protocol/modules recorded in it).

Returns
-------
None
") SetComplete;
		void SetComplete();

		/****************** SetGlobal ******************/
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
		%feature("compactdefaultargs") IGESData_DefaultGeneral;
		%feature("autodoc", "Creates a defaultgeneral and puts it into generallib, bound with a protocol from igesdata.

Returns
-------
None
") IGESData_DefaultGeneral;
		 IGESData_DefaultGeneral();

		/****************** DirChecker ******************/
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
		%feature("compactdefaultargs") IGESData_DefaultSpecific;
		%feature("autodoc", "Creates a defaultspecific and puts it into specificlib.

Returns
-------
None
") IGESData_DefaultSpecific;
		 IGESData_DefaultSpecific();

		/****************** OwnDump ******************/
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
		%feature("compactdefaultargs") IGESData_FileProtocol;
		%feature("autodoc", "Returns an empty fileprotocol.

Returns
-------
None
") IGESData_FileProtocol;
		 IGESData_FileProtocol();

		/****************** Add ******************/
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
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Gives the count of resources : the count of added protocols.

Returns
-------
int
") NbResources;
		virtual Standard_Integer NbResources();

		/****************** Resource ******************/
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
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Returns the count of entities designated as children.

Returns
-------
int
") NbChildren;
		virtual Standard_Integer NbChildren();

		/****************** SingleParent ******************/
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
		%feature("compactdefaultargs") IGESData_UndefinedEntity;
		%feature("autodoc", "Creates an unknown entity.

Returns
-------
None
") IGESData_UndefinedEntity;
		 IGESData_UndefinedEntity();

		/****************** ChangeableContent ******************/
		%feature("compactdefaultargs") ChangeableContent;
		%feature("autodoc", "Returns own data as an undefinedcontent, in order to touch it.

Returns
-------
opencascade::handle<Interface_UndefinedContent>
") ChangeableContent;
		opencascade::handle<Interface_UndefinedContent> ChangeableContent();

		/****************** DefColor ******************/
		%feature("compactdefaultargs") DefColor;
		%feature("autodoc", "Returns error status if necessary, else calls original method.

Returns
-------
IGESData_DefType
") DefColor;
		virtual IGESData_DefType DefColor();

		/****************** DefLevel ******************/
		%feature("compactdefaultargs") DefLevel;
		%feature("autodoc", "Returns error status if necessary, else calls original method.

Returns
-------
IGESData_DefList
") DefLevel;
		virtual IGESData_DefList DefLevel();

		/****************** DefLineFont ******************/
		%feature("compactdefaultargs") DefLineFont;
		%feature("autodoc", "Returns error status if necessary, else calls original method.

Returns
-------
IGESData_DefType
") DefLineFont;
		virtual IGESData_DefType DefLineFont();

		/****************** DefView ******************/
		%feature("compactdefaultargs") DefView;
		%feature("autodoc", "Returns error status if necessary, else calls original method.

Returns
-------
IGESData_DefList
") DefView;
		virtual IGESData_DefList DefView();

		/****************** DirStatus ******************/
		%feature("compactdefaultargs") DirStatus;
		%feature("autodoc", "Returns directory error status (used for copy).

Returns
-------
int
") DirStatus;
		Standard_Integer DirStatus();

		/****************** HasSubScriptNumber ******************/
		%feature("compactdefaultargs") HasSubScriptNumber;
		%feature("autodoc", "Returns error status if necessary, else calls original method (that is, if subscript field is not blank or positive integer).

Returns
-------
bool
") HasSubScriptNumber;
		virtual Standard_Boolean HasSubScriptNumber();

		/****************** IsOKDirPart ******************/
		%feature("compactdefaultargs") IsOKDirPart;
		%feature("autodoc", "Says if dirpart is ok or not (if not, it is erroneous) note that if it is not, def* methods can return error status.

Returns
-------
bool
") IsOKDirPart;
		Standard_Boolean IsOKDirPart();

		/****************** ReadDir ******************/
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
		%feature("compactdefaultargs") SetOKDirPart;
		%feature("autodoc", "Erases the directory error status warning : be sure that data are consistent to call this method ...

Returns
-------
None
") SetOKDirPart;
		void SetOKDirPart();

		/****************** UndefinedContent ******************/
		%feature("compactdefaultargs") UndefinedContent;
		%feature("autodoc", "Returns own data as an undefinedcontent.

Returns
-------
opencascade::handle<Interface_UndefinedContent>
") UndefinedContent;
		opencascade::handle<Interface_UndefinedContent> UndefinedContent();

		/****************** WriteOwnParams ******************/
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
		%feature("compactdefaultargs") IsSingle;
		%feature("autodoc", "Says if 'me' is a single view (true) or a list of views (false).

Returns
-------
bool
") IsSingle;
		virtual Standard_Boolean IsSingle();

		/****************** NbViews ******************/
		%feature("compactdefaultargs") NbViews;
		%feature("autodoc", "Returns the count of views for a list of views. for a single view, may return simply 1.

Returns
-------
int
") NbViews;
		virtual Standard_Integer NbViews();

		/****************** ViewItem ******************/
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
		%feature("compactdefaultargs") IGESData_FreeFormatEntity;
		%feature("autodoc", "Creates a completely empty freeformatentity.

Returns
-------
None
") IGESData_FreeFormatEntity;
		 IGESData_FreeFormatEntity();

		/****************** AddEntities ******************/
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
		%feature("compactdefaultargs") ClearNegativePointers;
		%feature("autodoc", "Clears all informations about negative pointers, hence every entity kind parameter will be send normally, as positive.

Returns
-------
None
") ClearNegativePointers;
		void ClearNegativePointers();

		/****************** IsNegativePointer ******************/
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
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "Gives count of recorded parameters.

Returns
-------
int
") NbParams;
		Standard_Integer NbParams();

		/****************** NegativePointers ******************/
		%feature("compactdefaultargs") NegativePointers;
		%feature("autodoc", "Returns the complete list of ramks of parameters which have been noted as negative pointers warning : it is returned as a null handle if none was noted.

Returns
-------
opencascade::handle<TColStd_HSequenceOfInteger>
") NegativePointers;
		opencascade::handle<TColStd_HSequenceOfInteger> NegativePointers();

		/****************** ParamData ******************/
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
