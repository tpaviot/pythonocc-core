/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
%template(IGESData_Array1OfIGESEntity) NCollection_Array1 <opencascade::handle <IGESData_IGESEntity>>;

%extend NCollection_Array1 <opencascade::handle <IGESData_IGESEntity>> {
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
%template(IGESData_Array1OfDirPart) NCollection_Array1 <IGESData_DirPart>;

%extend NCollection_Array1 <IGESData_DirPart> {
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
typedef NCollection_Array1 <opencascade::handle <IGESData_IGESEntity>> IGESData_Array1OfIGESEntity;
typedef NCollection_Array1 <IGESData_DirPart> IGESData_Array1OfDirPart;
/* end typedefs declaration */

/*****************
* class IGESData *
*****************/
%rename(igesdata) IGESData;
class IGESData {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Prepares General dynamic data used for IGESData specifically : Protocol and Modules, which treat UndefinedEntity
	:rtype: void") Init;
		static void Init ();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "* Returns a Protocol from IGESData (avoids to create it)
	:rtype: opencascade::handle<IGESData_Protocol>") Protocol;
		static opencascade::handle<IGESData_Protocol> Protocol ();

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
		/****************** ApplyUnit ******************/
		%feature("compactdefaultargs") ApplyUnit;
		%feature("autodoc", "* Applies unit value to convert header data : Resolution, MaxCoord, MaxLineWeight Applies unit only once after SetUnit... has been called, if <enforce> is given as True. It can be called just before writing the model to a file, i.e. when definitive values are finally known
	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: None") ApplyUnit;
		void ApplyUnit (const Standard_Boolean enforce = Standard_False);

		/****************** AutoCorrect ******************/
		%feature("compactdefaultargs") AutoCorrect;
		%feature("autodoc", "* Performs auto-correction on an IGESEntity Returns True if something has changed, False if nothing done. //! Works with the specific IGES Services : DirChecker which allows to correct data in 'Directory Part' of Entities (such as required values for status, or references to be null), and the specific IGES service OwnCorrect, which is specialised for each type of entity.
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: bool") AutoCorrect;
		Standard_Boolean AutoCorrect (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** AutoCorrectModel ******************/
		%feature("compactdefaultargs") AutoCorrectModel;
		%feature("autodoc", "* Performs auto-correction on the whole Model Returns the count of modified entities
	:rtype: int") AutoCorrectModel;
		Standard_Integer AutoCorrectModel ();

		/****************** ComputeStatus ******************/
		%feature("compactdefaultargs") ComputeStatus;
		%feature("autodoc", "* Performs the re-computation of status on the whole model (Subordinate Status and Use Flag of each IGES Entity), which can have required values according the way they are referenced (see definitions of Logical use, Physical use, etc...)
	:rtype: None") ComputeStatus;
		void ComputeStatus ();

		/****************** DraftingMax ******************/
		%feature("compactdefaultargs") DraftingMax;
		%feature("autodoc", "* Returns the maximum allowed value for Drafting Flag
	:rtype: int") DraftingMax;
		static Standard_Integer DraftingMax ();

		/****************** DraftingName ******************/
		%feature("compactdefaultargs") DraftingName;
		%feature("autodoc", "* From the flag of drafting standard, returns name, '' if incorrect
	:param flag:
	:type flag: int
	:rtype: char *") DraftingName;
		static const char * DraftingName (const Standard_Integer flag);

		/****************** IGESData_BasicEditor ******************/
		%feature("compactdefaultargs") IGESData_BasicEditor;
		%feature("autodoc", "* Creates an empty Basic Editor which should be initialized via Init() method.
	:rtype: None") IGESData_BasicEditor;
		 IGESData_BasicEditor ();

		/****************** IGESData_BasicEditor ******************/
		%feature("compactdefaultargs") IGESData_BasicEditor;
		%feature("autodoc", "* Creates a Basic Editor, with a new IGESModel, ready to run
	:param protocol:
	:type protocol: IGESData_Protocol
	:rtype: None") IGESData_BasicEditor;
		 IGESData_BasicEditor (const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** IGESData_BasicEditor ******************/
		%feature("compactdefaultargs") IGESData_BasicEditor;
		%feature("autodoc", "* Creates a Basic Editor for IGES Data, ready to run
	:param model:
	:type model: IGESData_IGESModel
	:param protocol:
	:type protocol: IGESData_Protocol
	:rtype: None") IGESData_BasicEditor;
		 IGESData_BasicEditor (const opencascade::handle<IGESData_IGESModel> & model,const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** IGESVersionMax ******************/
		%feature("compactdefaultargs") IGESVersionMax;
		%feature("autodoc", "* Returns the maximum allowed value for IGESVersion Flag
	:rtype: int") IGESVersionMax;
		static Standard_Integer IGESVersionMax ();

		/****************** IGESVersionName ******************/
		%feature("compactdefaultargs") IGESVersionName;
		%feature("autodoc", "* From the flag of IGES version, returns name, '' if incorrect
	:param flag:
	:type flag: int
	:rtype: char *") IGESVersionName;
		static const char * IGESVersionName (const Standard_Integer flag);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize a Basic Editor, with a new IGESModel, ready to run
	:param protocol:
	:type protocol: IGESData_Protocol
	:rtype: None") Init;
		void Init (const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize a Basic Editor for IGES Data, ready to run
	:param model:
	:type model: IGESData_IGESModel
	:param protocol:
	:type protocol: IGESData_Protocol
	:rtype: None") Init;
		void Init (const opencascade::handle<IGESData_IGESModel> & model,const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "* Returns the designated model
	:rtype: opencascade::handle<IGESData_IGESModel>") Model;
		opencascade::handle<IGESData_IGESModel> Model ();

		/****************** SetUnitFlag ******************/
		%feature("compactdefaultargs") SetUnitFlag;
		%feature("autodoc", "* Sets a new unit from its flag (param 14 of Global Section) Returns True if done, False if <flag> is incorrect
	:param flag:
	:type flag: int
	:rtype: bool") SetUnitFlag;
		Standard_Boolean SetUnitFlag (const Standard_Integer flag);

		/****************** SetUnitName ******************/
		%feature("compactdefaultargs") SetUnitName;
		%feature("autodoc", "* Sets a new unit from its name (param 15 of Global Section) Returns True if done, False if <name> is incorrect Remark : if <flag> has been set to 3 (user defined), <name> is then free
	:param name:
	:type name: char *
	:rtype: bool") SetUnitName;
		Standard_Boolean SetUnitName (const char * name);

		/****************** SetUnitValue ******************/
		%feature("compactdefaultargs") SetUnitValue;
		%feature("autodoc", "* Sets a new unit from its value in meters (rounded to the closest one, max gap 1%) Returns True if done, False if <val> is too far from a suitable value
	:param val:
	:type val: float
	:rtype: bool") SetUnitValue;
		Standard_Boolean SetUnitValue (const Standard_Real val);

		/****************** UnitFlagName ******************/
		%feature("compactdefaultargs") UnitFlagName;
		%feature("autodoc", "* From the flag of unit, determines its name, '' if incorrect
	:param flag:
	:type flag: int
	:rtype: char *") UnitFlagName;
		static const char * UnitFlagName (const Standard_Integer flag);

		/****************** UnitFlagValue ******************/
		%feature("compactdefaultargs") UnitFlagValue;
		%feature("autodoc", "* From the flag of unit, determines value in MM, 0 if incorrect
	:param flag:
	:type flag: int
	:rtype: float") UnitFlagValue;
		static Standard_Real UnitFlagValue (const Standard_Integer flag);

		/****************** UnitNameFlag ******************/
		%feature("compactdefaultargs") UnitNameFlag;
		%feature("autodoc", "* From the name of unit, computes flag number, 0 if incorrect (in this case, user defined entity remains possible)
	:param name:
	:type name: char *
	:rtype: int") UnitNameFlag;
		static Standard_Integer UnitNameFlag (const char * name);

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
		/****************** DefType ******************/
		%feature("compactdefaultargs") DefType;
		%feature("autodoc", "* returns DefType status (Void,Reference,Rank)
	:rtype: IGESData_DefType") DefType;
		IGESData_DefType DefType ();

		/****************** IGESData_DefSwitch ******************/
		%feature("compactdefaultargs") IGESData_DefSwitch;
		%feature("autodoc", "* creates a DefSwitch as Void
	:rtype: None") IGESData_DefSwitch;
		 IGESData_DefSwitch ();

		/****************** SetRank ******************/
		%feature("compactdefaultargs") SetRank;
		%feature("autodoc", "* sets DefSwitch to 'Rank' with a Value (in file : Integer > 0)
	:param val:
	:type val: int
	:rtype: None") SetRank;
		void SetRank (const Standard_Integer val);

		/****************** SetReference ******************/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "* sets DefSwitch to 'Reference' Status (in file : Integer < 0)
	:rtype: None") SetReference;
		void SetReference ();

		/****************** SetVoid ******************/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "* sets DefSwitch to 'Void' status (in file : Integer = 0)
	:rtype: None") SetVoid;
		void SetVoid ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns Value as Integer (sensefull for a Rank)
	:rtype: int") Value;
		Standard_Integer Value ();

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
		/****************** BlankStatusIgnored ******************/
		%feature("compactdefaultargs") BlankStatusIgnored;
		%feature("autodoc", "* Sets Blank Status to be ignored (should not be defined, or its value should be 0)
	:rtype: None") BlankStatusIgnored;
		void BlankStatusIgnored ();

		/****************** BlankStatusRequired ******************/
		%feature("compactdefaultargs") BlankStatusRequired;
		%feature("autodoc", "* Sets Blank Status to be required at a given value
	:param val:
	:type val: int
	:rtype: None") BlankStatusRequired;
		void BlankStatusRequired (const Standard_Integer val);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "* Performs the Checks on an IGESEntity, according to the recorded criteria In addition, does minimal Checks, such as admitted range for Status, or presence of Error status in some data (Color, ...)
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: None") Check;
		void Check (opencascade::handle<Interface_Check> & ach,const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** CheckTypeAndForm ******************/
		%feature("compactdefaultargs") CheckTypeAndForm;
		%feature("autodoc", "* Performs a Check only on Values of Type Number and Form Number This allows to do a check on an Entity not yet completely filled but of which Type and Form Number have been already set
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: None") CheckTypeAndForm;
		void CheckTypeAndForm (opencascade::handle<Interface_Check> & ach,const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** Color ******************/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "* Sets Color criterium If crit is DefVoid, Ignored : should not be defined If crit is DefAny, Required : must be defined (value or ref) Other values are not taken in account
	:param crit:
	:type crit: IGESData_DefType
	:rtype: None") Color;
		void Color (const IGESData_DefType crit);

		/****************** Correct ******************/
		%feature("compactdefaultargs") Correct;
		%feature("autodoc", "* Corrects the Directory Entry of an IGES Entity as far as it is possible according recorded criteria without any ambiguity : - if a numeric Status is required a given value, this value is enforced - if an item is required to be Void, or if it recorded as Erroneous, it is cleared (set to Void) - Type Number is enforced - finally Form Number is enforced only if one and only Value is admitted (no range, see Constructors of DirChecker)
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: bool") Correct;
		Standard_Boolean Correct (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** GraphicsIgnored ******************/
		%feature("compactdefaultargs") GraphicsIgnored;
		%feature("autodoc", "* Sets Graphics data (LineFont, LineWeight, Color, Level, View) to be ignored according value of Hierarchy status : If hierarchy is not given, they are Ignored any way (that is, they should not be defined) If hierarchy is given, Graphics are Ignored if the Hierarchy status has the value given in argument 'hierarchy'
	:param hierarchy: default value is -1
	:type hierarchy: int
	:rtype: None") GraphicsIgnored;
		void GraphicsIgnored (const Standard_Integer hierarchy = -1);

		/****************** HierarchyStatusIgnored ******************/
		%feature("compactdefaultargs") HierarchyStatusIgnored;
		%feature("autodoc", "* Sets Hierarchy Status to be ignored (should not be defined, or its value should be 0)
	:rtype: None") HierarchyStatusIgnored;
		void HierarchyStatusIgnored ();

		/****************** HierarchyStatusRequired ******************/
		%feature("compactdefaultargs") HierarchyStatusRequired;
		%feature("autodoc", "* Sets Hierarchy Status to be required at a given value
	:param val:
	:type val: int
	:rtype: None") HierarchyStatusRequired;
		void HierarchyStatusRequired (const Standard_Integer val);

		/****************** IGESData_DirChecker ******************/
		%feature("compactdefaultargs") IGESData_DirChecker;
		%feature("autodoc", "* Returns a DirChecker, with no criterium at all to be checked
	:rtype: None") IGESData_DirChecker;
		 IGESData_DirChecker ();

		/****************** IGESData_DirChecker ******************/
		%feature("compactdefaultargs") IGESData_DirChecker;
		%feature("autodoc", "* Returns a DirChecker, with no criterium except Required Type
	:param atype:
	:type atype: int
	:rtype: None") IGESData_DirChecker;
		 IGESData_DirChecker (const Standard_Integer atype);

		/****************** IGESData_DirChecker ******************/
		%feature("compactdefaultargs") IGESData_DirChecker;
		%feature("autodoc", "* Returns a DirChecker, with no criterium except Required values for Type and Form numbers
	:param atype:
	:type atype: int
	:param aform:
	:type aform: int
	:rtype: None") IGESData_DirChecker;
		 IGESData_DirChecker (const Standard_Integer atype,const Standard_Integer aform);

		/****************** IGESData_DirChecker ******************/
		%feature("compactdefaultargs") IGESData_DirChecker;
		%feature("autodoc", "* Returns a DirChecker, with no criterium except Required values for Type number (atype), and Required Range for Form number (which must be between aform1 and aform2 included)
	:param atype:
	:type atype: int
	:param aform1:
	:type aform1: int
	:param aform2:
	:type aform2: int
	:rtype: None") IGESData_DirChecker;
		 IGESData_DirChecker (const Standard_Integer atype,const Standard_Integer aform1,const Standard_Integer aform2);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "* Returns True if at least one criterium has already been set Allows user to store a DirChecker (static variable) then ask if it has been set before setting it
	:rtype: bool") IsSet;
		Standard_Boolean IsSet ();

		/****************** LineFont ******************/
		%feature("compactdefaultargs") LineFont;
		%feature("autodoc", "* Sets LineFont criterium If crit is DefVoid, Ignored : should not be defined If crit is DefAny, Required : must be defined (value or ref) If crit is DefValue, Required as a Value (error if Reference) Other values are not taken in account
	:param crit:
	:type crit: IGESData_DefType
	:rtype: None") LineFont;
		void LineFont (const IGESData_DefType crit);

		/****************** LineWeight ******************/
		%feature("compactdefaultargs") LineWeight;
		%feature("autodoc", "* Sets LineWeight criterium If crit is DefVoid, Ignored : should not be defined If crit is DefValue, Required Other values are not taken in account
	:param crit:
	:type crit: IGESData_DefType
	:rtype: None") LineWeight;
		void LineWeight (const IGESData_DefType crit);

		/****************** SetDefault ******************/
		%feature("compactdefaultargs") SetDefault;
		%feature("autodoc", "* Sets a DirChecker with most current criteria, that is : Structure Ignored ( worths call Structure(crit = DefVoid) )
	:rtype: None") SetDefault;
		void SetDefault ();

		/****************** Structure ******************/
		%feature("compactdefaultargs") Structure;
		%feature("autodoc", "* Sets Structure criterium. If crit is DefVoid, Ignored : should not be defined If crit is DefReference, Required : must be defined Other values are not taken in account
	:param crit:
	:type crit: IGESData_DefType
	:rtype: None") Structure;
		void Structure (const IGESData_DefType crit);

		/****************** SubordinateStatusIgnored ******************/
		%feature("compactdefaultargs") SubordinateStatusIgnored;
		%feature("autodoc", "* Sets Subordinate Status to be ignored (should not be defined, or its value should be 0)
	:rtype: None") SubordinateStatusIgnored;
		void SubordinateStatusIgnored ();

		/****************** SubordinateStatusRequired ******************/
		%feature("compactdefaultargs") SubordinateStatusRequired;
		%feature("autodoc", "* Sets Subordinate Status to be required at a given value
	:param val:
	:type val: int
	:rtype: None") SubordinateStatusRequired;
		void SubordinateStatusRequired (const Standard_Integer val);

		/****************** UseFlagIgnored ******************/
		%feature("compactdefaultargs") UseFlagIgnored;
		%feature("autodoc", "* Sets Blank Status to be ignored (should not be defined, or its value should be 0)
	:rtype: None") UseFlagIgnored;
		void UseFlagIgnored ();

		/****************** UseFlagRequired ******************/
		%feature("compactdefaultargs") UseFlagRequired;
		%feature("autodoc", "* Sets Blank Status to be required at a given value Give -1 to demand UseFlag not zero (but no precise value req.)
	:param val:
	:type val: int
	:rtype: None") UseFlagRequired;
		void UseFlagRequired (const Standard_Integer val);

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
		%feature("autodoc", "* creates an empty DirPart, ready to be filled by Init
	:rtype: None") IGESData_DirPart;
		 IGESData_DirPart ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* fills DirPart with consistant data read from file
	:param i1:
	:type i1: int
	:param i2:
	:type i2: int
	:param i3:
	:type i3: int
	:param i4:
	:type i4: int
	:param i5:
	:type i5: int
	:param i6:
	:type i6: int
	:param i7:
	:type i7: int
	:param i8:
	:type i8: int
	:param i9:
	:type i9: int
	:param i19:
	:type i19: int
	:param i11:
	:type i11: int
	:param i12:
	:type i12: int
	:param i13:
	:type i13: int
	:param i14:
	:type i14: int
	:param i15:
	:type i15: int
	:param i16:
	:type i16: int
	:param i17:
	:type i17: int
	:param res1:
	:type res1: char *
	:param res2:
	:type res2: char *
	:param label:
	:type label: char *
	:param subscript:
	:type subscript: char *
	:rtype: None") Init;
		void Init (const Standard_Integer i1,const Standard_Integer i2,const Standard_Integer i3,const Standard_Integer i4,const Standard_Integer i5,const Standard_Integer i6,const Standard_Integer i7,const Standard_Integer i8,const Standard_Integer i9,const Standard_Integer i19,const Standard_Integer i11,const Standard_Integer i12,const Standard_Integer i13,const Standard_Integer i14,const Standard_Integer i15,const Standard_Integer i16,const Standard_Integer i17,const char * res1,const char * res2,const char * label,const char * subscript);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* returns 'type' and 'form' info, used to recognize the entity
	:rtype: IGESData_IGESType") Type;
		IGESData_IGESType Type ();

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* returns values recorded in DirPart (content of cstrings are modified)
	:param i1:
	:type i1: int
	:param i2:
	:type i2: int
	:param i3:
	:type i3: int
	:param i4:
	:type i4: int
	:param i5:
	:type i5: int
	:param i6:
	:type i6: int
	:param i7:
	:type i7: int
	:param i8:
	:type i8: int
	:param i9:
	:type i9: int
	:param i19:
	:type i19: int
	:param i11:
	:type i11: int
	:param i12:
	:type i12: int
	:param i13:
	:type i13: int
	:param i14:
	:type i14: int
	:param i15:
	:type i15: int
	:param i16:
	:type i16: int
	:param i17:
	:type i17: int
	:param res1:
	:type res1: char *
	:param res2:
	:type res2: char *
	:param label:
	:type label: char *
	:param subscript:
	:type subscript: char *
	:rtype: None") Values;
		void Values (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,const char * res1,const char * res2,const char * label,const char * subscript);

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
		%feature("autodoc", "* Adds a new Recognizer to the Compound, at the end Several calls to Add work by adding in the order of calls : Hence, when Eval has failed to recognize, Evaluate will call Evaluate from the first added Recognizer if there is one, and to the second if there is still no result, and so on
	:param reco:
	:type reco: IGESData_FileRecognizer
	:rtype: None") Add;
		void Add (const opencascade::handle<IGESData_FileRecognizer> & reco);

		/****************** Evaluate ******************/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "* Evaluates if recognition has a result, returns it if yes In case of success, Returns True and puts result in 'res' In case of Failure, simply Returns False Works by calling deferred method Eval, and in case of failure, looks for Added Recognizers to work
	:param akey:
	:type akey: IGESData_IGESType
	:param res:
	:type res: IGESData_IGESEntity
	:rtype: bool") Evaluate;
		Standard_Boolean Evaluate (const IGESData_IGESType & akey,opencascade::handle<IGESData_IGESEntity> & res);

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "* Returns result of last recognition (call of Evaluate)
	:rtype: opencascade::handle<IGESData_IGESEntity>") Result;
		opencascade::handle<IGESData_IGESEntity> Result ();

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
		%feature("autodoc", "* Specific answer to the question 'is Copy properly implemented' For IGES, answer is always True
	:param CN:
	:type CN: int
	:param ent:
	:type ent: Standard_Transient
	:rtype: bool") CanCopy;
		virtual Standard_Boolean CanCopy (const Standard_Integer CN,const opencascade::handle<Standard_Transient> & ent);

		/****************** CheckCase ******************/
		%feature("compactdefaultargs") CheckCase;
		%feature("autodoc", "* Semantic Checking of an IGESEntity. Performs general Checks, which use DirChecker, then call OwnCheck which does a check specific for each type of Entity
	:param CN:
	:type CN: int
	:param ent:
	:type ent: Standard_Transient
	:param shares:
	:type shares: Interface_ShareTool
	:param ach:
	:type ach: Interface_Check
	:rtype: None") CheckCase;
		void CheckCase (const Standard_Integer CN,const opencascade::handle<Standard_Transient> & ent,const Interface_ShareTool & shares,opencascade::handle<Interface_Check> & ach);

		/****************** CopyCase ******************/
		%feature("compactdefaultargs") CopyCase;
		%feature("autodoc", "* Copy ('Deep') from <entfrom> to <entto> (same type) by using a CopyTool which provides its working Map. For IGESEntities, Copies general data (Directory Part, List of Properties) and call OwnCopyCase
	:param CN:
	:type CN: int
	:param entfrom:
	:type entfrom: Standard_Transient
	:param entto:
	:type entto: Standard_Transient
	:param TC:
	:type TC: Interface_CopyTool
	:rtype: None") CopyCase;
		void CopyCase (const Standard_Integer CN,const opencascade::handle<Standard_Transient> & entfrom,const opencascade::handle<Standard_Transient> & entto,Interface_CopyTool & TC);

		/****************** DirChecker ******************/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "* Returns a DirChecker, specific for each type of Entity (identified by its Case Number) : this DirChecker defines constraints which must be respected by the DirectoryPart
	:param CN:
	:type CN: int
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: IGESData_DirChecker") DirChecker;
		virtual IGESData_DirChecker DirChecker (const Standard_Integer CN,const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** FillSharedCase ******************/
		%feature("compactdefaultargs") FillSharedCase;
		%feature("autodoc", "* Fills the list of Entities shared by an IGESEntity <ent>, according a Case Number <CN> (formerly computed by CaseNum). Considers Properties and Directory Part, and calls OwnSharedCase (which is adapted to each Type of Entity)
	:param CN:
	:type CN: int
	:param ent:
	:type ent: Standard_Transient
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") FillSharedCase;
		void FillSharedCase (const Standard_Integer CN,const opencascade::handle<Standard_Transient> & ent,Interface_EntityIterator & iter);

		/****************** ListImpliedCase ******************/
		%feature("compactdefaultargs") ListImpliedCase;
		%feature("autodoc", "* Lists the Implied References of <ent>. Here, these are the Associativities, plus the Entities defined by OwnSharedCase
	:param CN:
	:type CN: int
	:param ent:
	:type ent: Standard_Transient
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: void") ListImpliedCase;
		virtual void ListImpliedCase (const Standard_Integer CN,const opencascade::handle<Standard_Transient> & ent,Interface_EntityIterator & iter);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns the name of an IGES Entity (its NameValue) Can be redefined for an even more specific case ...
	:param CN:
	:type CN: int
	:param ent:
	:type ent: Standard_Transient
	:param shares:
	:type shares: Interface_ShareTool
	:rtype: opencascade::handle<TCollection_HAsciiString>") Name;
		virtual opencascade::handle<TCollection_HAsciiString> Name (const Standard_Integer CN,const opencascade::handle<Standard_Transient> & ent,const Interface_ShareTool & shares);

		/****************** NewVoid ******************/
		%feature("compactdefaultargs") NewVoid;
		%feature("autodoc", "* Specific creation of a new void entity
	:param CN:
	:type CN: int
	:param entto:
	:type entto: Standard_Transient
	:rtype: bool") NewVoid;
		virtual Standard_Boolean NewVoid (const Standard_Integer CN,opencascade::handle<Standard_Transient> & entto);

		/****************** OwnCheckCase ******************/
		%feature("compactdefaultargs") OwnCheckCase;
		%feature("autodoc", "* Performs Specific Semantic Check for each type of Entity
	:param CN:
	:type CN: int
	:param ent:
	:type ent: IGESData_IGESEntity
	:param shares:
	:type shares: Interface_ShareTool
	:param ach:
	:type ach: Interface_Check
	:rtype: void") OwnCheckCase;
		virtual void OwnCheckCase (const Standard_Integer CN,const opencascade::handle<IGESData_IGESEntity> & ent,const Interface_ShareTool & shares,opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopyCase ******************/
		%feature("compactdefaultargs") OwnCopyCase;
		%feature("autodoc", "* Copies parameters which are specific of each Type of Entity
	:param CN:
	:type CN: int
	:param entfrom:
	:type entfrom: IGESData_IGESEntity
	:param entto:
	:type entto: IGESData_IGESEntity
	:param TC:
	:type TC: Interface_CopyTool
	:rtype: void") OwnCopyCase;
		virtual void OwnCopyCase (const Standard_Integer CN,const opencascade::handle<IGESData_IGESEntity> & entfrom,const opencascade::handle<IGESData_IGESEntity> & entto,Interface_CopyTool & TC);

		/****************** OwnDeleteCase ******************/
		%feature("compactdefaultargs") OwnDeleteCase;
		%feature("autodoc", "* Specific preparation for delete, acts on own parameters Default does nothing, to be redefined as required
	:param CN:
	:type CN: int
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: void") OwnDeleteCase;
		virtual void OwnDeleteCase (const Standard_Integer CN,const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** OwnImpliedCase ******************/
		%feature("compactdefaultargs") OwnImpliedCase;
		%feature("autodoc", "* Specific list of Entities implied by a given IGESEntity <ent> (in addition to Associativities). By default, there are none, but this method can be redefined as required
	:param CN:
	:type CN: int
	:param ent:
	:type ent: IGESData_IGESEntity
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: void") OwnImpliedCase;
		virtual void OwnImpliedCase (const Standard_Integer CN,const opencascade::handle<IGESData_IGESEntity> & ent,Interface_EntityIterator & iter);

		/****************** OwnRenewCase ******************/
		%feature("compactdefaultargs") OwnRenewCase;
		%feature("autodoc", "* Renews parameters which are specific of each Type of Entity : the provided default does nothing, but this method may be redefined as required
	:param CN:
	:type CN: int
	:param entfrom:
	:type entfrom: IGESData_IGESEntity
	:param entto:
	:type entto: IGESData_IGESEntity
	:param TC:
	:type TC: Interface_CopyTool
	:rtype: void") OwnRenewCase;
		virtual void OwnRenewCase (const Standard_Integer CN,const opencascade::handle<IGESData_IGESEntity> & entfrom,const opencascade::handle<IGESData_IGESEntity> & entto,const Interface_CopyTool & TC);

		/****************** OwnSharedCase ******************/
		%feature("compactdefaultargs") OwnSharedCase;
		%feature("autodoc", "* Lists the Entities shared by a given IGESEntity <ent>, from its specific parameters : specific for each type
	:param CN:
	:type CN: int
	:param ent:
	:type ent: IGESData_IGESEntity
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: void") OwnSharedCase;
		virtual void OwnSharedCase (const Standard_Integer CN,const opencascade::handle<IGESData_IGESEntity> & ent,Interface_EntityIterator & iter);

		/****************** RenewImpliedCase ******************/
		%feature("compactdefaultargs") RenewImpliedCase;
		%feature("autodoc", "* Renewing of Implied References. For IGESEntities, Copies general data(List of Associativities) and calls OwnRenewCase
	:param CN:
	:type CN: int
	:param entfrom:
	:type entfrom: Standard_Transient
	:param entto:
	:type entto: Standard_Transient
	:param TC:
	:type TC: Interface_CopyTool
	:rtype: void") RenewImpliedCase;
		virtual void RenewImpliedCase (const Standard_Integer CN,const opencascade::handle<Standard_Transient> & entfrom,const opencascade::handle<Standard_Transient> & entto,const Interface_CopyTool & TC);

		/****************** WhenDeleteCase ******************/
		%feature("compactdefaultargs") WhenDeleteCase;
		%feature("autodoc", "* Prepares an IGES Entity for delete : works on directory part then calls OwnDeleteCase While dispatch requires to copy the entities, <dispatched> is ignored, entities are cleared in any case
	:param CN:
	:type CN: int
	:param ent:
	:type ent: Standard_Transient
	:param dispatched:
	:type dispatched: bool
	:rtype: void") WhenDeleteCase;
		virtual void WhenDeleteCase (const Standard_Integer CN,const opencascade::handle<Standard_Transient> & ent,const Standard_Boolean dispatched);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a Module bound with a Protocol to the list : does nothing if already in the list, THAT IS, Same Type (exact match) and Same State (that is, IsEqual is not required) Once added, stores its attached Protocol in correspondance
	:param amodule:
	:type amodule: IGESData_SpecificModule
	:param aprotocol:
	:type aprotocol: IGESData_Protocol
	:rtype: None") Add;
		void Add (const opencascade::handle<IGESData_SpecificModule> & amodule,const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****************** IGESData_GlobalNodeOfSpecificLib ******************/
		%feature("compactdefaultargs") IGESData_GlobalNodeOfSpecificLib;
		%feature("autodoc", "* Creates an empty GlobalNode, with no Next
	:rtype: None") IGESData_GlobalNodeOfSpecificLib;
		 IGESData_GlobalNodeOfSpecificLib ();

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "* Returns the Module stored in a given GlobalNode
	:rtype: opencascade::handle<IGESData_SpecificModule>") Module;
		const opencascade::handle<IGESData_SpecificModule> & Module ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Returns the Next GlobalNode. If none is defined, returned value is a Null Handle
	:rtype: opencascade::handle<IGESData_GlobalNodeOfSpecificLib>") Next;
		const opencascade::handle<IGESData_GlobalNodeOfSpecificLib> & Next ();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "* Returns the attached Protocol stored in a given GlobalNode
	:rtype: opencascade::handle<IGESData_Protocol>") Protocol;
		const opencascade::handle<IGESData_Protocol> & Protocol ();

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a Module bound with a Protocol to the list : does nothing if already in the list, THAT IS, Same Type (exact match) and Same State (that is, IsEqual is not required) Once added, stores its attached Protocol in correspondance
	:param amodule:
	:type amodule: IGESData_ReadWriteModule
	:param aprotocol:
	:type aprotocol: IGESData_Protocol
	:rtype: None") Add;
		void Add (const opencascade::handle<IGESData_ReadWriteModule> & amodule,const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****************** IGESData_GlobalNodeOfWriterLib ******************/
		%feature("compactdefaultargs") IGESData_GlobalNodeOfWriterLib;
		%feature("autodoc", "* Creates an empty GlobalNode, with no Next
	:rtype: None") IGESData_GlobalNodeOfWriterLib;
		 IGESData_GlobalNodeOfWriterLib ();

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "* Returns the Module stored in a given GlobalNode
	:rtype: opencascade::handle<IGESData_ReadWriteModule>") Module;
		const opencascade::handle<IGESData_ReadWriteModule> & Module ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Returns the Next GlobalNode. If none is defined, returned value is a Null Handle
	:rtype: opencascade::handle<IGESData_GlobalNodeOfWriterLib>") Next;
		const opencascade::handle<IGESData_GlobalNodeOfWriterLib> & Next ();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "* Returns the attached Protocol stored in a given GlobalNode
	:rtype: opencascade::handle<IGESData_Protocol>") Protocol;
		const opencascade::handle<IGESData_Protocol> & Protocol ();

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
		/****************** ApplicationProtocol ******************/
		%feature("compactdefaultargs") ApplicationProtocol;
		%feature("autodoc", ":rtype: opencascade::handle<TCollection_HAsciiString>") ApplicationProtocol;
		opencascade::handle<TCollection_HAsciiString> ApplicationProtocol ();

		/****************** AuthorName ******************/
		%feature("compactdefaultargs") AuthorName;
		%feature("autodoc", "* Returns the name of the IGES file author.
	:rtype: opencascade::handle<TCollection_HAsciiString>") AuthorName;
		opencascade::handle<TCollection_HAsciiString> AuthorName ();

		/****************** CompanyName ******************/
		%feature("compactdefaultargs") CompanyName;
		%feature("autodoc", "* Returns the name of the company where the IGES file was written.
	:rtype: opencascade::handle<TCollection_HAsciiString>") CompanyName;
		opencascade::handle<TCollection_HAsciiString> CompanyName ();

		/****************** CopyRefs ******************/
		%feature("compactdefaultargs") CopyRefs;
		%feature("autodoc", "* Copies data referenced by Handle (that is, Strings) usefull to 'isolate' a GlobalSection after copy by '=' (from a Model to another Model for instance)
	:rtype: None") CopyRefs;
		void CopyRefs ();

		/****************** Date ******************/
		%feature("compactdefaultargs") Date;
		%feature("autodoc", "* Returns the IGES file creation date.
	:rtype: opencascade::handle<TCollection_HAsciiString>") Date;
		opencascade::handle<TCollection_HAsciiString> Date ();

		/****************** DraftingStandard ******************/
		%feature("compactdefaultargs") DraftingStandard;
		%feature("autodoc", ":rtype: int") DraftingStandard;
		Standard_Integer DraftingStandard ();

		/****************** EndMark ******************/
		%feature("compactdefaultargs") EndMark;
		%feature("autodoc", "* Returns the record delimiter character.
	:rtype: Standard_Character") EndMark;
		Standard_Character EndMark ();

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "* Returns the name of the IGES file.
	:rtype: opencascade::handle<TCollection_HAsciiString>") FileName;
		opencascade::handle<TCollection_HAsciiString> FileName ();

		/****************** HasApplicationProtocol ******************/
		%feature("compactdefaultargs") HasApplicationProtocol;
		%feature("autodoc", ":rtype: bool") HasApplicationProtocol;
		Standard_Boolean HasApplicationProtocol ();

		/****************** HasLastChangeDate ******************/
		%feature("compactdefaultargs") HasLastChangeDate;
		%feature("autodoc", "* Returns True if the date and time when the model was created or last modified are specified, i.e. not defaulted to NULL.
	:rtype: bool") HasLastChangeDate;
		Standard_Boolean HasLastChangeDate ();

		/****************** HasMaxCoord ******************/
		%feature("compactdefaultargs") HasMaxCoord;
		%feature("autodoc", "* Returns True if the approximate maximum coordinate value found in the model is greater than 0.
	:rtype: bool") HasMaxCoord;
		Standard_Boolean HasMaxCoord ();

		/****************** IGESData_GlobalSection ******************/
		%feature("compactdefaultargs") IGESData_GlobalSection;
		%feature("autodoc", "* Creates an empty GlobalSection, ready to be filled, Warning : No default value is provided
	:rtype: None") IGESData_GlobalSection;
		 IGESData_GlobalSection ();

		/****************** IGESVersion ******************/
		%feature("compactdefaultargs") IGESVersion;
		%feature("autodoc", "* Returns the IGES version that the IGES file was written in.
	:rtype: int") IGESVersion;
		Standard_Integer IGESVersion ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Fills GlobalSection from a ParamSet (i.e. taken from file) undefined parameters do not change default values when defined Fills Check about Corrections or Fails
	:param params:
	:type params: Interface_ParamSet
	:param ach:
	:type ach: Interface_Check
	:rtype: None") Init;
		void Init (const opencascade::handle<Interface_ParamSet> & params,opencascade::handle<Interface_Check> & ach);

		/****************** IntegerBits ******************/
		%feature("compactdefaultargs") IntegerBits;
		%feature("autodoc", "* Returns the number of binary bits for integer representations.
	:rtype: int") IntegerBits;
		Standard_Integer IntegerBits ();

		/****************** InterfaceVersion ******************/
		%feature("compactdefaultargs") InterfaceVersion;
		%feature("autodoc", "* Returns the name of the pre-processor used to write the IGES file.
	:rtype: opencascade::handle<TCollection_HAsciiString>") InterfaceVersion;
		opencascade::handle<TCollection_HAsciiString> InterfaceVersion ();

		/****************** LastChangeDate ******************/
		%feature("compactdefaultargs") LastChangeDate;
		%feature("autodoc", "* Returns the date and time when the model was created or last modified (for IGES 5.1 and later).
	:rtype: opencascade::handle<TCollection_HAsciiString>") LastChangeDate;
		opencascade::handle<TCollection_HAsciiString> LastChangeDate ();

		/****************** LineWeightGrad ******************/
		%feature("compactdefaultargs") LineWeightGrad;
		%feature("autodoc", "* Returns the maximum number of line weight gradations.
	:rtype: int") LineWeightGrad;
		Standard_Integer LineWeightGrad ();

		/****************** MaxCoord ******************/
		%feature("compactdefaultargs") MaxCoord;
		%feature("autodoc", "* Returns the approximate maximum coordinate value found in the model.
	:rtype: float") MaxCoord;
		Standard_Real MaxCoord ();

		/****************** MaxDigitsDouble ******************/
		%feature("compactdefaultargs") MaxDigitsDouble;
		%feature("autodoc", ":rtype: int") MaxDigitsDouble;
		Standard_Integer MaxDigitsDouble ();

		/****************** MaxDigitsSingle ******************/
		%feature("compactdefaultargs") MaxDigitsSingle;
		%feature("autodoc", ":rtype: int") MaxDigitsSingle;
		Standard_Integer MaxDigitsSingle ();

		/****************** MaxLineWeight ******************/
		%feature("compactdefaultargs") MaxLineWeight;
		%feature("autodoc", "* Returns the of maximum line weight width in IGES file units.
	:rtype: float") MaxLineWeight;
		Standard_Real MaxLineWeight ();

		/****************** MaxMaxCoord ******************/
		%feature("compactdefaultargs") MaxMaxCoord;
		%feature("autodoc", ":param val: default value is 0.0
	:type val: float
	:rtype: None") MaxMaxCoord;
		void MaxMaxCoord (const Standard_Real val = 0.0);

		/****************** MaxMaxCoords ******************/
		%feature("compactdefaultargs") MaxMaxCoords;
		%feature("autodoc", ":param xyz:
	:type xyz: gp_XYZ
	:rtype: None") MaxMaxCoords;
		void MaxMaxCoords (const gp_XYZ & xyz);

		/****************** MaxPower10Double ******************/
		%feature("compactdefaultargs") MaxPower10Double;
		%feature("autodoc", "* Returns the maximum power of a decimal representation of a double-precision floating point number in the sending system.
	:rtype: int") MaxPower10Double;
		Standard_Integer MaxPower10Double ();

		/****************** MaxPower10Single ******************/
		%feature("compactdefaultargs") MaxPower10Single;
		%feature("autodoc", "* Returns the maximum power of a decimal representation of a single-precision floating point number in the sending system.
	:rtype: int") MaxPower10Single;
		Standard_Integer MaxPower10Single ();

		/****************** NewDateString ******************/
		%feature("compactdefaultargs") NewDateString;
		%feature("autodoc", "* Returns a string built from year, month, day, hour, minute and second values. The form of the resulting string is defined as follows: - -1: YYMMDD.HHNNSS, - 0: YYYYMMDD.HHNNSS, - 1: YYYY-MM-DD:HH-NN-SS, where: - YYYY or YY is 4 or 2 digit year, - HH is hour (00-23), - MM is month (01-12), - NN is minute (00-59) - DD is day (01-31), - SS is second (00-59).
	:param year:
	:type year: int
	:param month:
	:type month: int
	:param day:
	:type day: int
	:param hour:
	:type hour: int
	:param minut:
	:type minut: int
	:param second:
	:type second: int
	:param mode: default value is -1
	:type mode: int
	:rtype: opencascade::handle<TCollection_HAsciiString>") NewDateString;
		static opencascade::handle<TCollection_HAsciiString> NewDateString (const Standard_Integer year,const Standard_Integer month,const Standard_Integer day,const Standard_Integer hour,const Standard_Integer minut,const Standard_Integer second,const Standard_Integer mode = -1);

		/****************** NewDateString ******************/
		%feature("compactdefaultargs") NewDateString;
		%feature("autodoc", "* Converts the string given in the form YYMMDD.HHNNSS or YYYYMMDD.HHNNSS to either YYMMDD.HHNNSS, YYYYMMDD.HHNNSS or YYYY-MM-DD:HH-NN-SS.
	:param date:
	:type date: TCollection_HAsciiString
	:param mode: default value is 1
	:type mode: int
	:rtype: opencascade::handle<TCollection_HAsciiString>") NewDateString;
		static opencascade::handle<TCollection_HAsciiString> NewDateString (const opencascade::handle<TCollection_HAsciiString> & date,const Standard_Integer mode = 1);

		/****************** Params ******************/
		%feature("compactdefaultargs") Params;
		%feature("autodoc", "* Returns all contained data in the form of a ParamSet Remark : Strings are given under Hollerith form
	:rtype: opencascade::handle<Interface_ParamSet>") Params;
		opencascade::handle<Interface_ParamSet> Params ();

		/****************** ReceiveName ******************/
		%feature("compactdefaultargs") ReceiveName;
		%feature("autodoc", "* Returns the name of the receiving system.
	:rtype: opencascade::handle<TCollection_HAsciiString>") ReceiveName;
		opencascade::handle<TCollection_HAsciiString> ReceiveName ();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* Returns the resolution used in the IGES file.
	:rtype: float") Resolution;
		Standard_Real Resolution ();

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "* Returns the scale used in the IGES file.
	:rtype: float") Scale;
		Standard_Real Scale ();

		/****************** SendName ******************/
		%feature("compactdefaultargs") SendName;
		%feature("autodoc", "* Returns the name of the sending system.
	:rtype: opencascade::handle<TCollection_HAsciiString>") SendName;
		opencascade::handle<TCollection_HAsciiString> SendName ();

		/****************** Separator ******************/
		%feature("compactdefaultargs") Separator;
		%feature("autodoc", "* Returns the parameter delimiter character.
	:rtype: Standard_Character") Separator;
		Standard_Character Separator ();

		/****************** SetApplicationProtocol ******************/
		%feature("compactdefaultargs") SetApplicationProtocol;
		%feature("autodoc", ":param val:
	:type val: TCollection_HAsciiString
	:rtype: None") SetApplicationProtocol;
		void SetApplicationProtocol (const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetAuthorName ******************/
		%feature("compactdefaultargs") SetAuthorName;
		%feature("autodoc", ":param val:
	:type val: TCollection_HAsciiString
	:rtype: None") SetAuthorName;
		void SetAuthorName (const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetCompanyName ******************/
		%feature("compactdefaultargs") SetCompanyName;
		%feature("autodoc", ":param val:
	:type val: TCollection_HAsciiString
	:rtype: None") SetCompanyName;
		void SetCompanyName (const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetDate ******************/
		%feature("compactdefaultargs") SetDate;
		%feature("autodoc", ":param val:
	:type val: TCollection_HAsciiString
	:rtype: None") SetDate;
		void SetDate (const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetDraftingStandard ******************/
		%feature("compactdefaultargs") SetDraftingStandard;
		%feature("autodoc", ":param val:
	:type val: int
	:rtype: None") SetDraftingStandard;
		void SetDraftingStandard (const Standard_Integer val);

		/****************** SetEndMark ******************/
		%feature("compactdefaultargs") SetEndMark;
		%feature("autodoc", ":param val:
	:type val: Standard_Character
	:rtype: None") SetEndMark;
		void SetEndMark (const Standard_Character val);

		/****************** SetFileName ******************/
		%feature("compactdefaultargs") SetFileName;
		%feature("autodoc", ":param val:
	:type val: TCollection_HAsciiString
	:rtype: None") SetFileName;
		void SetFileName (const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetIGESVersion ******************/
		%feature("compactdefaultargs") SetIGESVersion;
		%feature("autodoc", ":param val:
	:type val: int
	:rtype: None") SetIGESVersion;
		void SetIGESVersion (const Standard_Integer val);

		/****************** SetIntegerBits ******************/
		%feature("compactdefaultargs") SetIntegerBits;
		%feature("autodoc", ":param val:
	:type val: int
	:rtype: None") SetIntegerBits;
		void SetIntegerBits (const Standard_Integer val);

		/****************** SetInterfaceVersion ******************/
		%feature("compactdefaultargs") SetInterfaceVersion;
		%feature("autodoc", ":param val:
	:type val: TCollection_HAsciiString
	:rtype: None") SetInterfaceVersion;
		void SetInterfaceVersion (const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetLastChangeDate ******************/
		%feature("compactdefaultargs") SetLastChangeDate;
		%feature("autodoc", ":rtype: None") SetLastChangeDate;
		void SetLastChangeDate ();

		/****************** SetLastChangeDate ******************/
		%feature("compactdefaultargs") SetLastChangeDate;
		%feature("autodoc", ":param val:
	:type val: TCollection_HAsciiString
	:rtype: None") SetLastChangeDate;
		void SetLastChangeDate (const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetLineWeightGrad ******************/
		%feature("compactdefaultargs") SetLineWeightGrad;
		%feature("autodoc", ":param val:
	:type val: int
	:rtype: None") SetLineWeightGrad;
		void SetLineWeightGrad (const Standard_Integer val);

		/****************** SetMaxCoord ******************/
		%feature("compactdefaultargs") SetMaxCoord;
		%feature("autodoc", ":param val: default value is 0.0
	:type val: float
	:rtype: None") SetMaxCoord;
		void SetMaxCoord (const Standard_Real val = 0.0);

		/****************** SetMaxDigitsDouble ******************/
		%feature("compactdefaultargs") SetMaxDigitsDouble;
		%feature("autodoc", ":param val:
	:type val: int
	:rtype: None") SetMaxDigitsDouble;
		void SetMaxDigitsDouble (const Standard_Integer val);

		/****************** SetMaxDigitsSingle ******************/
		%feature("compactdefaultargs") SetMaxDigitsSingle;
		%feature("autodoc", ":param val:
	:type val: int
	:rtype: None") SetMaxDigitsSingle;
		void SetMaxDigitsSingle (const Standard_Integer val);

		/****************** SetMaxLineWeight ******************/
		%feature("compactdefaultargs") SetMaxLineWeight;
		%feature("autodoc", ":param val:
	:type val: float
	:rtype: None") SetMaxLineWeight;
		void SetMaxLineWeight (const Standard_Real val);

		/****************** SetMaxPower10Double ******************/
		%feature("compactdefaultargs") SetMaxPower10Double;
		%feature("autodoc", ":param val:
	:type val: int
	:rtype: None") SetMaxPower10Double;
		void SetMaxPower10Double (const Standard_Integer val);

		/****************** SetMaxPower10Single ******************/
		%feature("compactdefaultargs") SetMaxPower10Single;
		%feature("autodoc", ":param val:
	:type val: int
	:rtype: None") SetMaxPower10Single;
		void SetMaxPower10Single (const Standard_Integer val);

		/****************** SetReceiveName ******************/
		%feature("compactdefaultargs") SetReceiveName;
		%feature("autodoc", ":param val:
	:type val: TCollection_HAsciiString
	:rtype: None") SetReceiveName;
		void SetReceiveName (const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetResolution ******************/
		%feature("compactdefaultargs") SetResolution;
		%feature("autodoc", ":param val:
	:type val: float
	:rtype: None") SetResolution;
		void SetResolution (const Standard_Real val);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", ":param val:
	:type val: float
	:rtype: None") SetScale;
		void SetScale (const Standard_Real val);

		/****************** SetSendName ******************/
		%feature("compactdefaultargs") SetSendName;
		%feature("autodoc", ":param val:
	:type val: TCollection_HAsciiString
	:rtype: None") SetSendName;
		void SetSendName (const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetSeparator ******************/
		%feature("compactdefaultargs") SetSeparator;
		%feature("autodoc", ":param val:
	:type val: Standard_Character
	:rtype: None") SetSeparator;
		void SetSeparator (const Standard_Character val);

		/****************** SetSystemId ******************/
		%feature("compactdefaultargs") SetSystemId;
		%feature("autodoc", ":param val:
	:type val: TCollection_HAsciiString
	:rtype: None") SetSystemId;
		void SetSystemId (const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SetUnitFlag ******************/
		%feature("compactdefaultargs") SetUnitFlag;
		%feature("autodoc", ":param val:
	:type val: int
	:rtype: None") SetUnitFlag;
		void SetUnitFlag (const Standard_Integer val);

		/****************** SetUnitName ******************/
		%feature("compactdefaultargs") SetUnitName;
		%feature("autodoc", ":param val:
	:type val: TCollection_HAsciiString
	:rtype: None") SetUnitName;
		void SetUnitName (const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SystemId ******************/
		%feature("compactdefaultargs") SystemId;
		%feature("autodoc", "* Returns the Native System ID of the system that created the IGES file.
	:rtype: opencascade::handle<TCollection_HAsciiString>") SystemId;
		opencascade::handle<TCollection_HAsciiString> SystemId ();

		/****************** TranslatedFromHollerith ******************/
		%feature("compactdefaultargs") TranslatedFromHollerith;
		%feature("autodoc", "* Returns a string withpout its Hollerith marks (nnnH ahead). Remark : all strings stored in GlobalSection are expurged from Hollerith informations (without nnnH) If <astr> is not Hollerith form, it is simply copied
	:param astr:
	:type astr: TCollection_HAsciiString
	:rtype: opencascade::handle<TCollection_HAsciiString>") TranslatedFromHollerith;
		opencascade::handle<TCollection_HAsciiString> TranslatedFromHollerith (const opencascade::handle<TCollection_HAsciiString> & astr);

		/****************** UnitFlag ******************/
		%feature("compactdefaultargs") UnitFlag;
		%feature("autodoc", "* Returns the unit flag that was used to write the IGES file.
	:rtype: int") UnitFlag;
		Standard_Integer UnitFlag ();

		/****************** UnitName ******************/
		%feature("compactdefaultargs") UnitName;
		%feature("autodoc", "* Returns the name of the unit the IGES file was written in.
	:rtype: opencascade::handle<TCollection_HAsciiString>") UnitName;
		opencascade::handle<TCollection_HAsciiString> UnitName ();

		/****************** UnitValue ******************/
		%feature("compactdefaultargs") UnitValue;
		%feature("autodoc", "* Returns the unit value (in meters) that the IGES file was written in.
	:rtype: float") UnitValue;
		Standard_Real UnitValue ();

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
		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":param ent:
	:type ent: IGESData_IGESEntity
	:param S:
	:type S: Message_Messenger
	:param own:
	:type own: int
	:param attached: default value is -1
	:type attached: int
	:rtype: None") Dump;
		void Dump (const opencascade::handle<IGESData_IGESEntity> & ent,const opencascade::handle<Message_Messenger> & S,const Standard_Integer own,const Standard_Integer attached = -1);

		/****************** IGESData_IGESDumper ******************/
		%feature("compactdefaultargs") IGESData_IGESDumper;
		%feature("autodoc", "* Returns an IGESDumper ready to work. The IGESModel provides the numbering of Entities : as for any InterfaceModel, it gives each Entity a number; but for IGESEntities, the 'Number of Directory Entry' according to the definition of IGES Files, is also usefull
	:param model:
	:type model: IGESData_IGESModel
	:param protocol:
	:type protocol: IGESData_Protocol
	:rtype: None") IGESData_IGESDumper;
		 IGESData_IGESDumper (const opencascade::handle<IGESData_IGESModel> & model,const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** OwnDump ******************/
		%feature("compactdefaultargs") OwnDump;
		%feature("autodoc", "* Specific Dump for each IGES Entity, call by Dump (just above) <own> is the parameter <own> from Dump
	:param ent:
	:type ent: IGESData_IGESEntity
	:param S:
	:type S: Message_Messenger
	:param own:
	:type own: int
	:rtype: None") OwnDump;
		void OwnDump (const opencascade::handle<IGESData_IGESEntity> & ent,const opencascade::handle<Message_Messenger> & S,const Standard_Integer own);

		/****************** PrintDNum ******************/
		%feature("compactdefaultargs") PrintDNum;
		%feature("autodoc", "* Prints onto an output, the 'Number of Directory Entry' which corresponds to an IGESEntity in the IGESModel, under the form 'D#nnn' (a Null Handle gives D#0)
	:param ent:
	:type ent: IGESData_IGESEntity
	:param S:
	:type S: Message_Messenger
	:rtype: None") PrintDNum;
		void PrintDNum (const opencascade::handle<IGESData_IGESEntity> & ent,const opencascade::handle<Message_Messenger> & S);

		/****************** PrintShort ******************/
		%feature("compactdefaultargs") PrintShort;
		%feature("autodoc", "* Prints onto an output, the 'Number of Directory Entry' (see PrintDNum) plus IGES Type and Form Numbers, which gives 'D#nnn Type nnn Form nnn'
	:param ent:
	:type ent: IGESData_IGESEntity
	:param S:
	:type S: Message_Messenger
	:rtype: None") PrintShort;
		void PrintShort (const opencascade::handle<IGESData_IGESEntity> & ent,const opencascade::handle<Message_Messenger> & S);

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
		%feature("autodoc", "* Adds a Property in the list
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: None") AddProperty;
		void AddProperty (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** ArePresentAssociativities ******************/
		%feature("compactdefaultargs") ArePresentAssociativities;
		%feature("autodoc", "* Returns True if the Entity is defined with an Associativity list, even empty (that is, file contains its length 0) Else, the file contained NO idencation at all about this list.
	:rtype: bool") ArePresentAssociativities;
		Standard_Boolean ArePresentAssociativities ();

		/****************** ArePresentProperties ******************/
		%feature("compactdefaultargs") ArePresentProperties;
		%feature("autodoc", "* Returns True if the Entity is defined with a Property list, even empty (that is, file contains its length 0) Else, the file contained NO idencation at all about this list
	:rtype: bool") ArePresentProperties;
		Standard_Boolean ArePresentProperties ();

		/****************** Associate ******************/
		%feature("compactdefaultargs") Associate;
		%feature("autodoc", "* Sets 'me' in the Associativity list of another Entity
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: None") Associate;
		void Associate (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** Associativities ******************/
		%feature("compactdefaultargs") Associativities;
		%feature("autodoc", "* Returns the Associativity List under the form of an EntityIterator.
	:rtype: Interface_EntityIterator") Associativities;
		Interface_EntityIterator Associativities ();

		/****************** BlankStatus ******************/
		%feature("compactdefaultargs") BlankStatus;
		%feature("autodoc", "* gives Blank Status (0 visible, 1 blanked)
	:rtype: int") BlankStatus;
		Standard_Integer BlankStatus ();

		/****************** CResValues ******************/
		%feature("compactdefaultargs") CResValues;
		%feature("autodoc", "* returns 'reserved' alphanumeric values res1 and res2 res1 and res2 have to be reserved as Character[9 at least] (remark : their content is changed) returned values are ended by null character in 9th returned Boolean is False if res1 and res2 are blank, true else
	:param res1:
	:type res1: char *
	:param res2:
	:type res2: char *
	:rtype: bool") CResValues;
		Standard_Boolean CResValues (const char * res1,const char * res2);

		/****************** Color ******************/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "* Returns the IGES entity which describes the color of the entity. Returns a null handle if this entity was defined as an integer.
	:rtype: opencascade::handle<IGESData_ColorEntity>") Color;
		opencascade::handle<IGESData_ColorEntity> Color ();

		/****************** CompoundLocation ******************/
		%feature("compactdefaultargs") CompoundLocation;
		%feature("autodoc", "* Returns Location by taking in account a Parent which has its own Location : that one will be combined to that of <self> The Parent is considered only if HasOneParent is True, else it is ignored and CompoundLocation = Location
	:rtype: gp_GTrsf") CompoundLocation;
		gp_GTrsf CompoundLocation ();

		/****************** DefColor ******************/
		%feature("compactdefaultargs") DefColor;
		%feature("autodoc", "* Returns the definition status of Color.
	:rtype: IGESData_DefType") DefColor;
		virtual IGESData_DefType DefColor ();

		/****************** DefLevel ******************/
		%feature("compactdefaultargs") DefLevel;
		%feature("autodoc", "* Returns the definition status of Level
	:rtype: IGESData_DefList") DefLevel;
		virtual IGESData_DefList DefLevel ();

		/****************** DefLineFont ******************/
		%feature("compactdefaultargs") DefLineFont;
		%feature("autodoc", "* Returns the definition status of LineFont
	:rtype: IGESData_DefType") DefLineFont;
		virtual IGESData_DefType DefLineFont ();

		/****************** DefView ******************/
		%feature("compactdefaultargs") DefView;
		%feature("autodoc", "* Returns the definition status of the view. This can be: none, one or several.
	:rtype: IGESData_DefList") DefView;
		virtual IGESData_DefList DefView ();

		/****************** DirFieldEntity ******************/
		%feature("compactdefaultargs") DirFieldEntity;
		%feature("autodoc", "* Returns the Entity which has been recorded for a given Field Number, i.e. without any cast. Maps with : 3 : Structure 4 : LineFont 5 : LevelList 6 : View 7 : Transf(ormation Matrix) 8 : LabelDisplay 13 : Color. Other values give a null handle It can then be of any kind, while specific items have a Type
	:param fieldnum:
	:type fieldnum: int
	:rtype: opencascade::handle<IGESData_IGESEntity>") DirFieldEntity;
		opencascade::handle<IGESData_IGESEntity> DirFieldEntity (const Standard_Integer fieldnum);

		/****************** Dissociate ******************/
		%feature("compactdefaultargs") Dissociate;
		%feature("autodoc", "* Resets 'me' from the Associativity list of another Entity
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: None") Dissociate;
		void Dissociate (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** FormNumber ******************/
		%feature("compactdefaultargs") FormNumber;
		%feature("autodoc", "* Returns the form number for that type of an IGES entity. The default form number is 0.
	:rtype: int") FormNumber;
		Standard_Integer FormNumber ();

		/****************** HasLabelDisplay ******************/
		%feature("compactdefaultargs") HasLabelDisplay;
		%feature("autodoc", "* Returns True if a LabelDisplay mode is defined for this entity
	:rtype: bool") HasLabelDisplay;
		Standard_Boolean HasLabelDisplay ();

		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "* says if a Name is defined, as Short Label or as Name Property (Property is looked first, else ShortLabel is considered)
	:rtype: bool") HasName;
		Standard_Boolean HasName ();

		/****************** HasOneParent ******************/
		%feature("compactdefaultargs") HasOneParent;
		%feature("autodoc", "* Returns True if an entity has one and only one parent, defined by a SingleParentEntity Type Associativity (explicit sharing). Thus, implicit sharing remains defined at model level (see class ToolLocation)
	:rtype: bool") HasOneParent;
		Standard_Boolean HasOneParent ();

		/****************** HasShortLabel ******************/
		%feature("compactdefaultargs") HasShortLabel;
		%feature("autodoc", "* Returns true if a short label is defined. A short label is a non-blank 8-character string.
	:rtype: bool") HasShortLabel;
		Standard_Boolean HasShortLabel ();

		/****************** HasStructure ******************/
		%feature("compactdefaultargs") HasStructure;
		%feature("autodoc", "* returns True if an IGESEntity is defined with a Structure (it is normally reserved for certain classes, such as Macros)
	:rtype: bool") HasStructure;
		Standard_Boolean HasStructure ();

		/****************** HasSubScriptNumber ******************/
		%feature("compactdefaultargs") HasSubScriptNumber;
		%feature("autodoc", "* Returns true if a subscript number is defined. A subscript number is an integer used to identify a label.
	:rtype: bool") HasSubScriptNumber;
		virtual Standard_Boolean HasSubScriptNumber ();

		/****************** HasTransf ******************/
		%feature("compactdefaultargs") HasTransf;
		%feature("autodoc", "* Returns True if a Transformation Matrix is defined
	:rtype: bool") HasTransf;
		Standard_Boolean HasTransf ();

		/****************** HierarchyStatus ******************/
		%feature("compactdefaultargs") HierarchyStatus;
		%feature("autodoc", "* gives Hierarchy status (0-1-2)
	:rtype: int") HierarchyStatus;
		Standard_Integer HierarchyStatus ();

		/****************** IGESType ******************/
		%feature("compactdefaultargs") IGESType;
		%feature("autodoc", "* gives IGES typing info (includes 'Type' and 'Form' data)
	:rtype: IGESData_IGESType") IGESType;
		IGESData_IGESType IGESType ();

		/****************** InitColor ******************/
		%feature("compactdefaultargs") InitColor;
		%feature("autodoc", "* Initializes Color data : if <ent> is not Null, it gives Color, else <rank> gives or erases (if zero) RankColor
	:param ent:
	:type ent: IGESData_ColorEntity
	:param rank: default value is 0
	:type rank: int
	:rtype: None") InitColor;
		void InitColor (const opencascade::handle<IGESData_ColorEntity> & ent,const Standard_Integer rank = 0);

		/****************** InitDirFieldEntity ******************/
		%feature("compactdefaultargs") InitDirFieldEntity;
		%feature("autodoc", "* Initializes a directory field as an Entiy of any kind See DirFieldEntity for more details
	:param fieldnum:
	:type fieldnum: int
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: None") InitDirFieldEntity;
		void InitDirFieldEntity (const Standard_Integer fieldnum,const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** InitLevel ******************/
		%feature("compactdefaultargs") InitLevel;
		%feature("autodoc", "* Initializes Level : if <ent> is not Null, it gives LevelList, else <val> gives or erases (if zero) unique Level
	:param ent:
	:type ent: IGESData_LevelListEntity
	:param val: default value is 0
	:type val: int
	:rtype: None") InitLevel;
		void InitLevel (const opencascade::handle<IGESData_LevelListEntity> & ent,const Standard_Integer val = 0);

		/****************** InitLineFont ******************/
		%feature("compactdefaultargs") InitLineFont;
		%feature("autodoc", "* Initializes LineFont : if <ent> is not Null, it gives LineFont, else <rank> gives or erases (if zero) RankLineFont
	:param ent:
	:type ent: IGESData_LineFontEntity
	:param rank: default value is 0
	:type rank: int
	:rtype: None") InitLineFont;
		void InitLineFont (const opencascade::handle<IGESData_LineFontEntity> & ent,const Standard_Integer rank = 0);

		/****************** InitMisc ******************/
		%feature("compactdefaultargs") InitMisc;
		%feature("autodoc", "* Initializes various data (those not yet seen above), or erases them if they are given as Null (Zero for <weightnum>) : <str> for Structure, <lab> for LabelDisplay, and <weightnum> for WeightNumber
	:param str:
	:type str: IGESData_IGESEntity
	:param lab:
	:type lab: IGESData_LabelDisplayEntity
	:param weightnum:
	:type weightnum: int
	:rtype: None") InitMisc;
		void InitMisc (const opencascade::handle<IGESData_IGESEntity> & str,const opencascade::handle<IGESData_LabelDisplayEntity> & lab,const Standard_Integer weightnum);

		/****************** InitStatus ******************/
		%feature("compactdefaultargs") InitStatus;
		%feature("autodoc", "* Initializes the Status of Directory Part
	:param blank:
	:type blank: int
	:param subordinate:
	:type subordinate: int
	:param useflag:
	:type useflag: int
	:param hierarchy:
	:type hierarchy: int
	:rtype: None") InitStatus;
		void InitStatus (const Standard_Integer blank,const Standard_Integer subordinate,const Standard_Integer useflag,const Standard_Integer hierarchy);

		/****************** InitTransf ******************/
		%feature("compactdefaultargs") InitTransf;
		%feature("autodoc", "* Initializes Transf, or erases it if <ent> is given Null
	:param ent:
	:type ent: IGESData_TransfEntity
	:rtype: None") InitTransf;
		void InitTransf (const opencascade::handle<IGESData_TransfEntity> & ent);

		/****************** InitView ******************/
		%feature("compactdefaultargs") InitView;
		%feature("autodoc", "* Initializes View, or erases it if <ent> is given Null
	:param ent:
	:type ent: IGESData_ViewKindEntity
	:rtype: None") InitView;
		void InitView (const opencascade::handle<IGESData_ViewKindEntity> & ent);

		/****************** LabelDisplay ******************/
		%feature("compactdefaultargs") LabelDisplay;
		%feature("autodoc", "* Returns the Label Display Associativity Entity if there is one. Returns a null handle if there is none.
	:rtype: opencascade::handle<IGESData_LabelDisplayEntity>") LabelDisplay;
		opencascade::handle<IGESData_LabelDisplayEntity> LabelDisplay ();

		/****************** Level ******************/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "* Returns the level the entity belongs to. Returns -1 if the entity belongs to more than one level.
	:rtype: int") Level;
		Standard_Integer Level ();

		/****************** LevelList ******************/
		%feature("compactdefaultargs") LevelList;
		%feature("autodoc", "* Returns LevelList if Level is defined as a list. Returns a null handle if DefLevel is not DefSeveral.
	:rtype: opencascade::handle<IGESData_LevelListEntity>") LevelList;
		opencascade::handle<IGESData_LevelListEntity> LevelList ();

		/****************** LineFont ******************/
		%feature("compactdefaultargs") LineFont;
		%feature("autodoc", "* Returns LineFont as an Entity (if defined as Reference) Returns a Null Handle if DefLineFont is not 'DefReference'
	:rtype: opencascade::handle<IGESData_LineFontEntity>") LineFont;
		opencascade::handle<IGESData_LineFontEntity> LineFont ();

		/****************** LineWeight ******************/
		%feature("compactdefaultargs") LineWeight;
		%feature("autodoc", "* Returns the true Line Weight, computed from LineWeightNumber and Global Parameter in the Model by call to SetLineWeight
	:rtype: float") LineWeight;
		Standard_Real LineWeight ();

		/****************** LineWeightNumber ******************/
		%feature("compactdefaultargs") LineWeightNumber;
		%feature("autodoc", "* Returns the LineWeight Number (0 not defined), see also LineWeight
	:rtype: int") LineWeightNumber;
		Standard_Integer LineWeightNumber ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns Location given by Transf in Directory Part (see above) It must be considered for local definition : if the Entity is set in a 'Parent', that one can add its one Location, but this is not taken in account here : see CompoundLocation for that. If no Transf is defined, returns Identity If Transf is itself compound, gives the final result
	:rtype: gp_GTrsf") Location;
		gp_GTrsf Location ();

		/****************** NameValue ******************/
		%feature("compactdefaultargs") NameValue;
		%feature("autodoc", "* returns Name value as a String (Property Name or ShortLabel) if SubNumber is defined, it is concatenated after ShortLabel as follows label(number). Ignored with a Property Name
	:rtype: opencascade::handle<TCollection_HAsciiString>") NameValue;
		opencascade::handle<TCollection_HAsciiString> NameValue ();

		/****************** NbAssociativities ******************/
		%feature("compactdefaultargs") NbAssociativities;
		%feature("autodoc", "* gives number of recorded associativities (0 no list defined)
	:rtype: int") NbAssociativities;
		Standard_Integer NbAssociativities ();

		/****************** NbProperties ******************/
		%feature("compactdefaultargs") NbProperties;
		%feature("autodoc", "* Gives number of recorded properties (0 no list defined)
	:rtype: int") NbProperties;
		Standard_Integer NbProperties ();

		/****************** NbTypedAssociativities ******************/
		%feature("compactdefaultargs") NbTypedAssociativities;
		%feature("autodoc", "* gives how many Associativities have a given type
	:param atype:
	:type atype: Standard_Type
	:rtype: int") NbTypedAssociativities;
		Standard_Integer NbTypedAssociativities (const opencascade::handle<Standard_Type> & atype);

		/****************** NbTypedProperties ******************/
		%feature("compactdefaultargs") NbTypedProperties;
		%feature("autodoc", "* gives how many Properties have a given type
	:param atype:
	:type atype: Standard_Type
	:rtype: int") NbTypedProperties;
		Standard_Integer NbTypedProperties (const opencascade::handle<Standard_Type> & atype);

		/****************** Properties ******************/
		%feature("compactdefaultargs") Properties;
		%feature("autodoc", "* Returns Property List under the form of an EntityIterator
	:rtype: Interface_EntityIterator") Properties;
		Interface_EntityIterator Properties ();

		/****************** RankColor ******************/
		%feature("compactdefaultargs") RankColor;
		%feature("autodoc", "* Returns the color definition as an integer value if the color was defined as a rank. Warning A negative value is returned if the color was defined as an entity.
	:rtype: int") RankColor;
		Standard_Integer RankColor ();

		/****************** RankLineFont ******************/
		%feature("compactdefaultargs") RankLineFont;
		%feature("autodoc", "* Returns LineFont definition as an Integer (if defined as Rank) If LineFont is defined as an Entity, returns a negative value
	:rtype: int") RankLineFont;
		Standard_Integer RankLineFont ();

		/****************** RemoveProperty ******************/
		%feature("compactdefaultargs") RemoveProperty;
		%feature("autodoc", "* Removes a Property from the list
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: None") RemoveProperty;
		void RemoveProperty (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** SetLabel ******************/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "* Sets a new Label to an IGES Entity If <sub> is given, it sets value of SubScriptNumber else, SubScriptNumber is erased
	:param label:
	:type label: TCollection_HAsciiString
	:param sub: default value is -1
	:type sub: int
	:rtype: None") SetLabel;
		void SetLabel (const opencascade::handle<TCollection_HAsciiString> & label,const Standard_Integer sub = -1);

		/****************** SetLineWeight ******************/
		%feature("compactdefaultargs") SetLineWeight;
		%feature("autodoc", "* computes and sets 'true' line weight according IGES rules from global data MaxLineWeight (maxv) and LineWeightGrad (gradw), or sets it to defw (Default) if LineWeightNumber is null
	:param defw:
	:type defw: float
	:param maxw:
	:type maxw: float
	:param gradw:
	:type gradw: int
	:rtype: None") SetLineWeight;
		void SetLineWeight (const Standard_Real defw,const Standard_Real maxw,const Standard_Integer gradw);

		/****************** ShortLabel ******************/
		%feature("compactdefaultargs") ShortLabel;
		%feature("autodoc", "* Returns the label value for this IGES entity as a string. Warning If the label is blank, this string is null.
	:rtype: opencascade::handle<TCollection_HAsciiString>") ShortLabel;
		opencascade::handle<TCollection_HAsciiString> ShortLabel ();

		/****************** SingleView ******************/
		%feature("compactdefaultargs") SingleView;
		%feature("autodoc", "* Returns the view as a single view if it was defined as such and not as a list of views. Warning A null handle is returned if DefView does not have the value DefOne.
	:rtype: opencascade::handle<IGESData_ViewKindEntity>") SingleView;
		opencascade::handle<IGESData_ViewKindEntity> SingleView ();

		/****************** Structure ******************/
		%feature("compactdefaultargs") Structure;
		%feature("autodoc", "* Returns Structure (used by some types of IGES Entities only) Returns a Null Handle if Structure is not defined
	:rtype: opencascade::handle<IGESData_IGESEntity>") Structure;
		opencascade::handle<IGESData_IGESEntity> Structure ();

		/****************** SubScriptNumber ******************/
		%feature("compactdefaultargs") SubScriptNumber;
		%feature("autodoc", "* Returns the integer subscript number used to identify this IGES entity. Warning 0 is returned if no subscript number is defined for this IGES entity.
	:rtype: int") SubScriptNumber;
		Standard_Integer SubScriptNumber ();

		/****************** SubordinateStatus ******************/
		%feature("compactdefaultargs") SubordinateStatus;
		%feature("autodoc", "* gives Subordinate Switch (0-1-2-3)
	:rtype: int") SubordinateStatus;
		Standard_Integer SubordinateStatus ();

		/****************** Transf ******************/
		%feature("compactdefaultargs") Transf;
		%feature("autodoc", "* Returns the Transformation Matrix (under IGES definition) Returns a Null Handle if there is none for a more complete use, see Location & CompoundLocation
	:rtype: opencascade::handle<IGESData_TransfEntity>") Transf;
		opencascade::handle<IGESData_TransfEntity> Transf ();

		/****************** TypeNumber ******************/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "* gives IGES Type Number (often coupled with Form Number)
	:rtype: int") TypeNumber;
		Standard_Integer TypeNumber ();

		/****************** TypedAssociativity ******************/
		%feature("compactdefaultargs") TypedAssociativity;
		%feature("autodoc", "* returns the Associativity of a given Type (if only one exists) Error if none or more than one
	:param atype:
	:type atype: Standard_Type
	:rtype: opencascade::handle<IGESData_IGESEntity>") TypedAssociativity;
		opencascade::handle<IGESData_IGESEntity> TypedAssociativity (const opencascade::handle<Standard_Type> & atype);

		/****************** TypedProperty ******************/
		%feature("compactdefaultargs") TypedProperty;
		%feature("autodoc", "* returns the Property of a given Type Error if none or more than one
	:param atype:
	:type atype: Standard_Type
	:param anum: default value is 0
	:type anum: int
	:rtype: opencascade::handle<IGESData_IGESEntity>") TypedProperty;
		opencascade::handle<IGESData_IGESEntity> TypedProperty (const opencascade::handle<Standard_Type> & atype,const Standard_Integer anum = 0);

		/****************** UniqueParent ******************/
		%feature("compactdefaultargs") UniqueParent;
		%feature("autodoc", "* Returns the Unique Parent (in the sense given by HasOneParent) Error if there is none or several
	:rtype: opencascade::handle<IGESData_IGESEntity>") UniqueParent;
		opencascade::handle<IGESData_IGESEntity> UniqueParent ();

		/****************** UseFlag ******************/
		%feature("compactdefaultargs") UseFlag;
		%feature("autodoc", "* gives Entity's Use Flag (0 to 5)
	:rtype: int") UseFlag;
		Standard_Integer UseFlag ();

		/****************** VectorLocation ******************/
		%feature("compactdefaultargs") VectorLocation;
		%feature("autodoc", "* Returns Location considered for Vectors, i.e. without its Translation Part. As Location, it gives local definition.
	:rtype: gp_GTrsf") VectorLocation;
		gp_GTrsf VectorLocation ();

		/****************** View ******************/
		%feature("compactdefaultargs") View;
		%feature("autodoc", "* Returns the view of this IGES entity. This view can be a single view or a list of views. Warning A null handle is returned if the view is not defined.
	:rtype: opencascade::handle<IGESData_ViewKindEntity>") View;
		opencascade::handle<IGESData_ViewKindEntity> View ();

		/****************** ViewList ******************/
		%feature("compactdefaultargs") ViewList;
		%feature("autodoc", "* Returns the view of this IGES entity as a list. Warning A null handle is returned if the definition status does not have the value DefSeveral.
	:rtype: opencascade::handle<IGESData_ViewKindEntity>") ViewList;
		opencascade::handle<IGESData_ViewKindEntity> ViewList ();

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
		/****************** AddStartLine ******************/
		%feature("compactdefaultargs") AddStartLine;
		%feature("autodoc", "* Adds a new string to the existing Start section at the end if atnum is 0 or not given, or before atnumth line.
	:param line:
	:type line: char *
	:param atnum: default value is 0
	:type atnum: int
	:rtype: None") AddStartLine;
		void AddStartLine (const char * line,const Standard_Integer atnum = 0);

		/****************** ApplyStatic ******************/
		%feature("compactdefaultargs") ApplyStatic;
		%feature("autodoc", "* Sets some of the Global section parameters with the values defined by the translation parameters. param may be: - receiver (value read in XSTEP.iges.header.receiver), - author (value read in XSTEP.iges.header.author), - company (value read in XSTEP.iges.header.company). The default value for param is an empty string. Returns True when done and if param is given, False if param is unknown or empty. Note: Set the unit in the IGES file Global section via IGESData_BasicEditor class.
	:param param: default value is ""
	:type param: char *
	:rtype: bool") ApplyStatic;
		Standard_Boolean ApplyStatic (const char * param = "");

		/****************** ClearHeader ******************/
		%feature("compactdefaultargs") ClearHeader;
		%feature("autodoc", "* Erases all data specific to IGES file Header (Start + Global)
	:rtype: None") ClearHeader;
		void ClearHeader ();

		/****************** ClearLabels ******************/
		%feature("compactdefaultargs") ClearLabels;
		%feature("autodoc", "* erases specific labels, i.e. does nothing
	:rtype: None") ClearLabels;
		void ClearLabels ();

		/****************** ClearStartSection ******************/
		%feature("compactdefaultargs") ClearStartSection;
		%feature("autodoc", "* Clears the IGES file Start Section
	:rtype: None") ClearStartSection;
		void ClearStartSection ();

		/****************** DNum ******************/
		%feature("compactdefaultargs") DNum;
		%feature("autodoc", "* Returns the equivalent DE Number for an Entity, i.e. 2*Number(ent)-1 , or 0 if <ent> is unknown from <self> This DE Number is used for File Writing for instance
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: int") DNum;
		Standard_Integer DNum (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** DumpHeader ******************/
		%feature("compactdefaultargs") DumpHeader;
		%feature("autodoc", "* Prints the IGES file header (Start and Global Sections) to the log file. The integer parameter is intended to be used as a level indicator but is not used at present.
	:param S:
	:type S: Message_Messenger
	:param level: default value is 0
	:type level: int
	:rtype: None") DumpHeader;
		void DumpHeader (const opencascade::handle<Message_Messenger> & S,const Standard_Integer level = 0);

		/****************** Entity ******************/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "* Returns an IGES entity given by its rank number.
	:param num:
	:type num: int
	:rtype: opencascade::handle<IGESData_IGESEntity>") Entity;
		opencascade::handle<IGESData_IGESEntity> Entity (const Standard_Integer num);

		/****************** GetFromAnother ******************/
		%feature("compactdefaultargs") GetFromAnother;
		%feature("autodoc", "* gets Header (GlobalSection) from another Model
	:param other:
	:type other: Interface_InterfaceModel
	:rtype: None") GetFromAnother;
		void GetFromAnother (const opencascade::handle<Interface_InterfaceModel> & other);

		/****************** GlobalSection ******************/
		%feature("compactdefaultargs") GlobalSection;
		%feature("autodoc", "* Returns the Global section of the IGES file.
	:rtype: IGESData_GlobalSection") GlobalSection;
		const IGESData_GlobalSection & GlobalSection ();

		/****************** IGESData_IGESModel ******************/
		%feature("compactdefaultargs") IGESData_IGESModel;
		%feature("autodoc", ":rtype: None") IGESData_IGESModel;
		 IGESData_IGESModel ();

		/****************** NbStartLines ******************/
		%feature("compactdefaultargs") NbStartLines;
		%feature("autodoc", "* Returns the count of recorded Start Lines
	:rtype: int") NbStartLines;
		Standard_Integer NbStartLines ();

		/****************** NewEmptyModel ******************/
		%feature("compactdefaultargs") NewEmptyModel;
		%feature("autodoc", "* Returns a New Empty Model, same type as <self> i.e. IGESModel
	:rtype: opencascade::handle<Interface_InterfaceModel>") NewEmptyModel;
		opencascade::handle<Interface_InterfaceModel> NewEmptyModel ();

		/****************** PrintInfo ******************/
		%feature("compactdefaultargs") PrintInfo;
		%feature("autodoc", "* Prints label specific to IGES norm for a given entity, i.e. its directory entry number (2*Number-1)
	:param ent:
	:type ent: Standard_Transient
	:param S:
	:type S: Message_Messenger
	:rtype: None") PrintInfo;
		void PrintInfo (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Message_Messenger> & S);

		/****************** PrintLabel ******************/
		%feature("compactdefaultargs") PrintLabel;
		%feature("autodoc", "* Prints label specific to IGES norm for a given entity, i.e. its directory entry number (2*Number-1)
	:param ent:
	:type ent: Standard_Transient
	:param S:
	:type S: Message_Messenger
	:rtype: None") PrintLabel;
		void PrintLabel (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Message_Messenger> & S);

		/****************** PrintToLog ******************/
		%feature("compactdefaultargs") PrintToLog;
		%feature("autodoc", "* Prints label specific to IGES norm for a given -- -- entity, i.e. its directory entry number (2*Number-1) in the log file format.
	:param ent:
	:type ent: Standard_Transient
	:param S:
	:type S: Message_Messenger
	:rtype: void") PrintToLog;
		virtual void PrintToLog (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Message_Messenger> & S);

		/****************** SetGlobalSection ******************/
		%feature("compactdefaultargs") SetGlobalSection;
		%feature("autodoc", "* Sets the Global section of the IGES file.
	:param header:
	:type header: IGESData_GlobalSection
	:rtype: None") SetGlobalSection;
		void SetGlobalSection (const IGESData_GlobalSection & header);

		/****************** SetLineWeights ******************/
		%feature("compactdefaultargs") SetLineWeights;
		%feature("autodoc", "* Sets LineWeights of contained Entities according header data (MaxLineWeight and LineWeightGrad) or to a default value for undefined weights
	:param defw:
	:type defw: float
	:rtype: None") SetLineWeights;
		void SetLineWeights (const Standard_Real defw);

		/****************** SetStartSection ******************/
		%feature("compactdefaultargs") SetStartSection;
		%feature("autodoc", "* Sets a new Start section from a list of strings. If copy is false, the Start section will be shared. Any modifications made to the strings later on, will have an effect on the Start section. If copy is true (default value), an independent copy of the strings is created and used as the Start section. Any modifications made to the strings later on, will have no effect on the Start section.
	:param list:
	:type list: TColStd_HSequenceOfHAsciiString
	:param copy: default value is Standard_True
	:type copy: bool
	:rtype: None") SetStartSection;
		void SetStartSection (const opencascade::handle<TColStd_HSequenceOfHAsciiString> & list,const Standard_Boolean copy = Standard_True);

		/****************** StartLine ******************/
		%feature("compactdefaultargs") StartLine;
		%feature("autodoc", "* Returns a line from the IGES file Start section by specifying its number. An empty string is returned if the number given is out of range, the range being from 1 to NbStartLines.
	:param num:
	:type num: int
	:rtype: char *") StartLine;
		const char * StartLine (const Standard_Integer num);

		/****************** StartSection ******************/
		%feature("compactdefaultargs") StartSection;
		%feature("autodoc", "* Returns Model's Start Section (list of comment lines)
	:rtype: opencascade::handle<TColStd_HSequenceOfHAsciiString>") StartSection;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> StartSection ();

		/****************** StringLabel ******************/
		%feature("compactdefaultargs") StringLabel;
		%feature("autodoc", "* Returns a string with the label attached to a given entity, i.e. a string 'Dnn' with nn = directory entry number (2*N-1)
	:param ent:
	:type ent: Standard_Transient
	:rtype: opencascade::handle<TCollection_HAsciiString>") StringLabel;
		opencascade::handle<TCollection_HAsciiString> StringLabel (const opencascade::handle<Standard_Transient> & ent);

		/****************** VerifyCheck ******************/
		%feature("compactdefaultargs") VerifyCheck;
		%feature("autodoc", "* Checks that the IGES file Global section contains valid data that conforms to the IGES specifications.
	:param ach:
	:type ach: Interface_Check
	:rtype: void") VerifyCheck;
		virtual void VerifyCheck (opencascade::handle<Interface_Check> & ach);

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
		/****************** AddGlobal ******************/
		%feature("compactdefaultargs") AddGlobal;
		%feature("autodoc", "* adds a parameter to global section's parameter list
	:param atype:
	:type atype: Interface_ParamType
	:param aval:
	:type aval: char *
	:rtype: None") AddGlobal;
		void AddGlobal (const Interface_ParamType atype,const char * aval);

		/****************** AddStartLine ******************/
		%feature("compactdefaultargs") AddStartLine;
		%feature("autodoc", "* adds a start line to start section
	:param aval:
	:type aval: char *
	:rtype: None") AddStartLine;
		void AddStartLine (const char * aval);

		/****************** DefaultLineWeight ******************/
		%feature("compactdefaultargs") DefaultLineWeight;
		%feature("autodoc", "* Returns the recorded Default Line Weight, if there is (else, returns 0)
	:rtype: float") DefaultLineWeight;
		Standard_Real DefaultLineWeight ();

		/****************** DirPart ******************/
		%feature("compactdefaultargs") DirPart;
		%feature("autodoc", "* returns DirPart identified by record no (half Dsect number)
	:param num:
	:type num: int
	:rtype: IGESData_DirPart") DirPart;
		const IGESData_DirPart & DirPart (const Standard_Integer num);

		/****************** DirType ******************/
		%feature("compactdefaultargs") DirType;
		%feature("autodoc", "* returns 'type' and 'form' info from a directory part
	:param num:
	:type num: int
	:rtype: IGESData_IGESType") DirType;
		IGESData_IGESType DirType (const Standard_Integer num);

		/****************** DirValues ******************/
		%feature("compactdefaultargs") DirValues;
		%feature("autodoc", "* returns values recorded in directory part n0 <num>
	:param num:
	:type num: int
	:param i1:
	:type i1: int
	:param i2:
	:type i2: int
	:param i3:
	:type i3: int
	:param i4:
	:type i4: int
	:param i5:
	:type i5: int
	:param i6:
	:type i6: int
	:param i7:
	:type i7: int
	:param i8:
	:type i8: int
	:param i9:
	:type i9: int
	:param i10:
	:type i10: int
	:param i11:
	:type i11: int
	:param i12:
	:type i12: int
	:param i13:
	:type i13: int
	:param i14:
	:type i14: int
	:param i15:
	:type i15: int
	:param i16:
	:type i16: int
	:param i17:
	:type i17: int
	:param res1:
	:type res1: char *
	:param res2:
	:type res2: char *
	:param label:
	:type label: char *
	:param subs:
	:type subs: char *
	:rtype: None") DirValues;
		void DirValues (const Standard_Integer num,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,const char * & res1,const char * & res2,const char * & label,const char * & subs);

		/****************** FindNextRecord ******************/
		%feature("compactdefaultargs") FindNextRecord;
		%feature("autodoc", "* determines next suitable record from num; that is num+1 except for last one which gives 0
	:param num:
	:type num: int
	:rtype: int") FindNextRecord;
		Standard_Integer FindNextRecord (const Standard_Integer num);

		/****************** GlobalCheck ******************/
		%feature("compactdefaultargs") GlobalCheck;
		%feature("autodoc", "* Returns the recorded Global Check
	:rtype: opencascade::handle<Interface_Check>") GlobalCheck;
		opencascade::handle<Interface_Check> GlobalCheck ();

		/****************** GlobalSection ******************/
		%feature("compactdefaultargs") GlobalSection;
		%feature("autodoc", "* returns header as GlobalSection
	:rtype: IGESData_GlobalSection") GlobalSection;
		const IGESData_GlobalSection & GlobalSection ();

		/****************** IGESData_IGESReaderData ******************/
		%feature("compactdefaultargs") IGESData_IGESReaderData;
		%feature("autodoc", "* creates IGESReaderData correctly dimensionned (for arrays) <nbe> count of entities, that is, half nb of directory lines <nbp> : count of parameters
	:param nbe:
	:type nbe: int
	:param nbp:
	:type nbp: int
	:rtype: None") IGESData_IGESReaderData;
		 IGESData_IGESReaderData (const Standard_Integer nbe,const Standard_Integer nbp);

		/****************** NbEntities ******************/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "* Returns count of recorded Entities (i.e. size of Directory)
	:rtype: int") NbEntities;
		virtual Standard_Integer NbEntities ();

		/****************** SetDefaultLineWeight ******************/
		%feature("compactdefaultargs") SetDefaultLineWeight;
		%feature("autodoc", "* allows to set a default line weight, will be later applied at load time, on Entities which have no specified line weight
	:param defw:
	:type defw: float
	:rtype: None") SetDefaultLineWeight;
		void SetDefaultLineWeight (const Standard_Real defw);

		/****************** SetDirPart ******************/
		%feature("compactdefaultargs") SetDirPart;
		%feature("autodoc", "* fills a DirPart, designated by its rank (that is, (N+1)/2 if N is its first number in section D)
	:param num:
	:type num: int
	:param i1:
	:type i1: int
	:param i2:
	:type i2: int
	:param i3:
	:type i3: int
	:param i4:
	:type i4: int
	:param i5:
	:type i5: int
	:param i6:
	:type i6: int
	:param i7:
	:type i7: int
	:param i8:
	:type i8: int
	:param i9:
	:type i9: int
	:param i10:
	:type i10: int
	:param i11:
	:type i11: int
	:param i12:
	:type i12: int
	:param i13:
	:type i13: int
	:param i14:
	:type i14: int
	:param i15:
	:type i15: int
	:param i16:
	:type i16: int
	:param i17:
	:type i17: int
	:param res1:
	:type res1: char *
	:param res2:
	:type res2: char *
	:param label:
	:type label: char *
	:param subs:
	:type subs: char *
	:rtype: None") SetDirPart;
		void SetDirPart (const Standard_Integer num,const Standard_Integer i1,const Standard_Integer i2,const Standard_Integer i3,const Standard_Integer i4,const Standard_Integer i5,const Standard_Integer i6,const Standard_Integer i7,const Standard_Integer i8,const Standard_Integer i9,const Standard_Integer i10,const Standard_Integer i11,const Standard_Integer i12,const Standard_Integer i13,const Standard_Integer i14,const Standard_Integer i15,const Standard_Integer i16,const Standard_Integer i17,const char * res1,const char * res2,const char * label,const char * subs);

		/****************** SetEntityNumbers ******************/
		%feature("compactdefaultargs") SetEntityNumbers;
		%feature("autodoc", "* determines reference numbers in EntityNumber fields (called by SetEntities from IGESReaderTool) works on 'Integer' type Parameters, because IGES does not distinguish Integer and Entity Refs : every Integer which is odd and less than twice NbRecords can be an Entity Ref ... (Ref Number is then (N+1)/2 if N is the Integer Value)
	:rtype: None") SetEntityNumbers;
		void SetEntityNumbers ();

		/****************** SetGlobalSection ******************/
		%feature("compactdefaultargs") SetGlobalSection;
		%feature("autodoc", "* reads header (as GlobalSection) content from the ParamSet after it has been filled by successive calls to AddGlobal
	:rtype: None") SetGlobalSection;
		void SetGlobalSection ();

		/****************** StartSection ******************/
		%feature("compactdefaultargs") StartSection;
		%feature("autodoc", "* Returns the Start Section in once
	:rtype: opencascade::handle<TColStd_HSequenceOfHAsciiString>") StartSection;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> StartSection ();

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
		/****************** AnalyseRecord ******************/
		%feature("compactdefaultargs") AnalyseRecord;
		%feature("autodoc", "* fills an entity, given record no; works by calling ReadDirPart then ReadParams (with help of a ParamReader), then if required ReadProps and ReadAssocs, from IGESEntity Returns True if no fail has been recorded
	:param num:
	:type num: int
	:param anent:
	:type anent: Standard_Transient
	:param acheck:
	:type acheck: Interface_Check
	:rtype: bool") AnalyseRecord;
		Standard_Boolean AnalyseRecord (const Standard_Integer num,const opencascade::handle<Standard_Transient> & anent,opencascade::handle<Interface_Check> & acheck);

		/****************** BeginRead ******************/
		%feature("compactdefaultargs") BeginRead;
		%feature("autodoc", "* fills model's header, that is, its GlobalSection
	:param amodel:
	:type amodel: Interface_InterfaceModel
	:rtype: None") BeginRead;
		void BeginRead (const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** EndRead ******************/
		%feature("compactdefaultargs") EndRead;
		%feature("autodoc", "* after reading entities, true line weights can be computed
	:param amodel:
	:type amodel: Interface_InterfaceModel
	:rtype: void") EndRead;
		virtual void EndRead (const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** IGESData_IGESReaderTool ******************/
		%feature("compactdefaultargs") IGESData_IGESReaderTool;
		%feature("autodoc", "* creates IGESReaderTool to work with an IGESReaderData and an IGES Protocol. Actually, no Lib is used
	:param reader:
	:type reader: IGESData_IGESReaderData
	:param protocol:
	:type protocol: IGESData_Protocol
	:rtype: None") IGESData_IGESReaderTool;
		 IGESData_IGESReaderTool (const opencascade::handle<IGESData_IGESReaderData> & reader,const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** Prepare ******************/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "* binds empty entities to records, works with the Protocol (from IGESData) stored and later used RQ : Actually, sets DNum into IGES Entities Also loads the list of parameters for ParamReader
	:param reco:
	:type reco: IGESData_FileRecognizer
	:rtype: None") Prepare;
		void Prepare (const opencascade::handle<IGESData_FileRecognizer> & reco);

		/****************** ReadAssocs ******************/
		%feature("compactdefaultargs") ReadAssocs;
		%feature("autodoc", "* Reads Associativity List, if there is (if not, does nothing) criterium is : current parameter of PR remains inside params list, and Stage is 'Own' Same conditions as above; in addition, no parameter must be let after the list once read Note that 'Associated' entities are not declared 'Shared'
	:param ent:
	:type ent: IGESData_IGESEntity
	:param IR:
	:type IR: IGESData_IGESReaderData
	:param PR:
	:type PR: IGESData_ParamReader
	:rtype: None") ReadAssocs;
		void ReadAssocs (const opencascade::handle<IGESData_IGESEntity> & ent,const opencascade::handle<IGESData_IGESReaderData> & IR,IGESData_ParamReader & PR);

		/****************** ReadDir ******************/
		%feature("compactdefaultargs") ReadDir;
		%feature("autodoc", "* Reads directory part componants from file; DP is the litteral directory part, IR detains entities referenced by DP
	:param ent:
	:type ent: IGESData_IGESEntity
	:param IR:
	:type IR: IGESData_IGESReaderData
	:param DP:
	:type DP: IGESData_DirPart
	:param ach:
	:type ach: Interface_Check
	:rtype: None") ReadDir;
		void ReadDir (const opencascade::handle<IGESData_IGESEntity> & ent,const opencascade::handle<IGESData_IGESReaderData> & IR,const IGESData_DirPart & DP,opencascade::handle<Interface_Check> & ach);

		/****************** ReadOwnParams ******************/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "* Performs Reading of own Parameters for each IGESEntity Works with the ReaderLib loaded with ReadWriteModules for IGES In case of failure, tries UndefinedEntity from IGES
	:param ent:
	:type ent: IGESData_IGESEntity
	:param IR:
	:type IR: IGESData_IGESReaderData
	:param PR:
	:type PR: IGESData_ParamReader
	:rtype: None") ReadOwnParams;
		void ReadOwnParams (const opencascade::handle<IGESData_IGESEntity> & ent,const opencascade::handle<IGESData_IGESReaderData> & IR,IGESData_ParamReader & PR);

		/****************** ReadProps ******************/
		%feature("compactdefaultargs") ReadProps;
		%feature("autodoc", "* Reads Property List, if there is (if not, does nothing) criterium is : current parameter of PR remains inside params list, and Stage is 'Own' Current parameter must be a positive integer, which value gives the length of the list; else, a Fail is produced (into Check of PR) and reading process is stopped
	:param ent:
	:type ent: IGESData_IGESEntity
	:param IR:
	:type IR: IGESData_IGESReaderData
	:param PR:
	:type PR: IGESData_ParamReader
	:rtype: None") ReadProps;
		void ReadProps (const opencascade::handle<IGESData_IGESEntity> & ent,const opencascade::handle<IGESData_IGESReaderData> & IR,IGESData_ParamReader & PR);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "* recognizes records by asking Protocol (on data of DirType)
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: Standard_Transient
	:rtype: bool") Recognize;
		Standard_Boolean Recognize (const Standard_Integer num,opencascade::handle<Interface_Check> & ach,opencascade::handle<Standard_Transient> & ent);

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
		/****************** Form ******************/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "* returns 'form' data
	:rtype: int") Form;
		Standard_Integer Form ();

		/****************** IGESData_IGESType ******************/
		%feature("compactdefaultargs") IGESData_IGESType;
		%feature("autodoc", ":rtype: None") IGESData_IGESType;
		 IGESData_IGESType ();

		/****************** IGESData_IGESType ******************/
		%feature("compactdefaultargs") IGESData_IGESType;
		%feature("autodoc", ":param atype:
	:type atype: int
	:param aform:
	:type aform: int
	:rtype: None") IGESData_IGESType;
		 IGESData_IGESType (const Standard_Integer atype,const Standard_Integer aform);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* compares two IGESTypes, avoiding comparing their fields
	:param another:
	:type another: IGESData_IGESType
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const IGESData_IGESType & another);

		/****************** Nullify ******************/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "* resets fields (usefull when an IGESType is stored as mask)
	:rtype: None") Nullify;
		void Nullify ();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* returns 'type' data
	:rtype: int") Type;
		Standard_Integer Type ();


        %extend{
            bool __eq_wrapper__(const IGESData_IGESType  other) {
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
		/****************** Associativities ******************/
		%feature("compactdefaultargs") Associativities;
		%feature("autodoc", "* sends associativity list, as complement of parameters list error if not in sections DP or Stage not 'Associativity'
	:param anent:
	:type anent: IGESData_IGESEntity
	:rtype: None") Associativities;
		void Associativities (const opencascade::handle<IGESData_IGESEntity> & anent);

		/****************** DirPart ******************/
		%feature("compactdefaultargs") DirPart;
		%feature("autodoc", "* translates directory part of an Entity into a litteral DirPart Some infos are computed after sending parameters Error if not in sections DP or Stage not 'Dir'
	:param anent:
	:type anent: IGESData_IGESEntity
	:rtype: None") DirPart;
		void DirPart (const opencascade::handle<IGESData_IGESEntity> & anent);

		/****************** EndEntity ******************/
		%feature("compactdefaultargs") EndEntity;
		%feature("autodoc", "* declares end of sending an entity (ends param list by ';')
	:rtype: None") EndEntity;
		void EndEntity ();

		/****************** FloatWriter ******************/
		%feature("compactdefaultargs") FloatWriter;
		%feature("autodoc", "* Returns the embedded FloatWriter, which controls sending Reals Use this method to access FloatWriter in order to consult or change its options (MainFormat, FormatForRange,ZeroSuppress), because it is returned as the address of its field
	:rtype: Interface_FloatWriter") FloatWriter;
		Interface_FloatWriter & FloatWriter ();

		/****************** IGESData_IGESWriter ******************/
		%feature("compactdefaultargs") IGESData_IGESWriter;
		%feature("autodoc", "* Creates an IGESWriter, empty ready to work (see the methods SendModel and Print)
	:param amodel:
	:type amodel: IGESData_IGESModel
	:rtype: None") IGESData_IGESWriter;
		 IGESData_IGESWriter (const opencascade::handle<IGESData_IGESModel> & amodel);

		/****************** IGESData_IGESWriter ******************/
		%feature("compactdefaultargs") IGESData_IGESWriter;
		%feature("autodoc", "* Default constructor (not used) to satisfy the compiler
	:rtype: None") IGESData_IGESWriter;
		 IGESData_IGESWriter ();

		/****************** IGESData_IGESWriter ******************/
		%feature("compactdefaultargs") IGESData_IGESWriter;
		%feature("autodoc", "* Constructor by copy (not used) to satisfy the compiler
	:param other:
	:type other: IGESData_IGESWriter
	:rtype: None") IGESData_IGESWriter;
		 IGESData_IGESWriter (const IGESData_IGESWriter & other);

		/****************** OwnParams ******************/
		%feature("compactdefaultargs") OwnParams;
		%feature("autodoc", "* sends own parameters of the entity, by sending firstly its type, then calling specific method WriteOwnParams Error if not in sections DP or Stage not 'Own'
	:param anent:
	:type anent: IGESData_IGESEntity
	:rtype: None") OwnParams;
		void OwnParams (const opencascade::handle<IGESData_IGESEntity> & anent);


        %feature("autodoc", "1");
        %extend{
            std::string PrintToString() {
            std::stringstream s;
            self->Print(s);
            return s.str();}
        };
        		/****************** Properties ******************/
		%feature("compactdefaultargs") Properties;
		%feature("autodoc", "* sends property list, as complement of parameters list error if not in sections DP or Stage not 'Property'
	:param anent:
	:type anent: IGESData_IGESEntity
	:rtype: None") Properties;
		void Properties (const opencascade::handle<IGESData_IGESEntity> & anent);

		/****************** SectionG ******************/
		%feature("compactdefaultargs") SectionG;
		%feature("autodoc", "* prepares sending of header, from a GlobalSection (stores it) error if SectionS was not called just before takes in account special characters (Separator, EndMark)
	:param header:
	:type header: IGESData_GlobalSection
	:rtype: None") SectionG;
		void SectionG (const IGESData_GlobalSection & header);

		/****************** SectionS ******************/
		%feature("compactdefaultargs") SectionS;
		%feature("autodoc", "* declares sending of S section (only a declaration) error if state is not initial
	:rtype: None") SectionS;
		void SectionS ();

		/****************** SectionStrings ******************/
		%feature("compactdefaultargs") SectionStrings;
		%feature("autodoc", "* Returns the list of strings for a section given its rank 1 : Start (if not empty) 2 : Global 3 or 4 : Parameters RQ: no string list for Directory section An empty section gives a null handle
	:param numsec:
	:type numsec: int
	:rtype: opencascade::handle<TColStd_HSequenceOfHAsciiString>") SectionStrings;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> SectionStrings (const Standard_Integer numsec);

		/****************** SectionT ******************/
		%feature("compactdefaultargs") SectionT;
		%feature("autodoc", "* declares sending of T section (only a declaration) error if does not follow Entities sending
	:rtype: None") SectionT;
		void SectionT ();

		/****************** SectionsDP ******************/
		%feature("compactdefaultargs") SectionsDP;
		%feature("autodoc", "* prepares sending of list of entities, as Sections D (directory list) and P (Parameters lists, one per entity) Entities will be then processed, one after the other error if SectionG has not be called just before
	:rtype: None") SectionsDP;
		void SectionsDP ();

		/****************** SendBoolean ******************/
		%feature("compactdefaultargs") SendBoolean;
		%feature("autodoc", "* sends a Boolean parameter as an Integer value 0(False)/1(True)
	:param val:
	:type val: bool
	:rtype: None") SendBoolean;
		void SendBoolean (const Standard_Boolean val);

		/****************** SendModel ******************/
		%feature("compactdefaultargs") SendModel;
		%feature("autodoc", "* Sends the complete IGESModel (Global Section, Entities as Directory Entries & Parameter Lists, etc...) i.e. fills a list of texts. Once filled, it can be sent by method Print
	:param protocol:
	:type protocol: IGESData_Protocol
	:rtype: None") SendModel;
		void SendModel (const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** SendStartLine ******************/
		%feature("compactdefaultargs") SendStartLine;
		%feature("autodoc", "* Sends an additionnal Starting Line : this is the way used to send comments in an IGES File (at beginning of the file). If the line is more than 72 char.s long, it is splited into as many lines as required to send it completely
	:param startline:
	:type startline: char *
	:rtype: None") SendStartLine;
		void SendStartLine (const char * startline);

		/****************** SendString ******************/
		%feature("compactdefaultargs") SendString;
		%feature("autodoc", "* sends a parameter under its exact form given as a string
	:param val:
	:type val: TCollection_HAsciiString
	:rtype: None") SendString;
		void SendString (const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** SendVoid ******************/
		%feature("compactdefaultargs") SendVoid;
		%feature("autodoc", "* sends a void parameter, that is null text
	:rtype: None") SendVoid;
		void SendVoid ();


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
	}
};

/***********************************
* class IGESData_NodeOfSpecificLib *
***********************************/
class IGESData_NodeOfSpecificLib : public Standard_Transient {
	public:
		/****************** AddNode ******************/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "* Adds a couple (Module,Protocol), that is, stores it into itself if not yet done, else creates a Next Node to do it
	:param anode:
	:type anode: IGESData_GlobalNodeOfSpecificLib
	:rtype: None") AddNode;
		void AddNode (const opencascade::handle<IGESData_GlobalNodeOfSpecificLib> & anode);

		/****************** IGESData_NodeOfSpecificLib ******************/
		%feature("compactdefaultargs") IGESData_NodeOfSpecificLib;
		%feature("autodoc", "* Creates an empty Node, with no Next
	:rtype: None") IGESData_NodeOfSpecificLib;
		 IGESData_NodeOfSpecificLib ();

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "* Returns the Module designated by a precise Node
	:rtype: opencascade::handle<IGESData_SpecificModule>") Module;
		const opencascade::handle<IGESData_SpecificModule> & Module ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Returns the Next Node. If none was defined, returned value is a Null Handle
	:rtype: opencascade::handle<IGESData_NodeOfSpecificLib>") Next;
		const opencascade::handle<IGESData_NodeOfSpecificLib> & Next ();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "* Returns the Protocol designated by a precise Node
	:rtype: opencascade::handle<IGESData_Protocol>") Protocol;
		const opencascade::handle<IGESData_Protocol> & Protocol ();

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
		/****************** AddNode ******************/
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "* Adds a couple (Module,Protocol), that is, stores it into itself if not yet done, else creates a Next Node to do it
	:param anode:
	:type anode: IGESData_GlobalNodeOfWriterLib
	:rtype: None") AddNode;
		void AddNode (const opencascade::handle<IGESData_GlobalNodeOfWriterLib> & anode);

		/****************** IGESData_NodeOfWriterLib ******************/
		%feature("compactdefaultargs") IGESData_NodeOfWriterLib;
		%feature("autodoc", "* Creates an empty Node, with no Next
	:rtype: None") IGESData_NodeOfWriterLib;
		 IGESData_NodeOfWriterLib ();

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "* Returns the Module designated by a precise Node
	:rtype: opencascade::handle<IGESData_ReadWriteModule>") Module;
		const opencascade::handle<IGESData_ReadWriteModule> & Module ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Returns the Next Node. If none was defined, returned value is a Null Handle
	:rtype: opencascade::handle<IGESData_NodeOfWriterLib>") Next;
		const opencascade::handle<IGESData_NodeOfWriterLib> & Next ();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "* Returns the Protocol designated by a precise Node
	:rtype: opencascade::handle<IGESData_Protocol>") Protocol;
		const opencascade::handle<IGESData_Protocol> & Protocol ();

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
		/****************** Advance ******************/
		%feature("compactdefaultargs") Advance;
		%feature("autodoc", "* Returns True if Advance command has been set
	:rtype: bool") Advance;
		Standard_Boolean Advance ();

		/****************** Count ******************/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "* Returns required count of items to be read
	:rtype: int") Count;
		Standard_Integer Count ();

		/****************** IGESData_ParamCursor ******************/
		%feature("compactdefaultargs") IGESData_ParamCursor;
		%feature("autodoc", "* Creates a Cursor to read a precise parameter of ParamReader, identified by its number, then set Current Number to 'num + 1' (this constructor allows to simply give a Number to a method Read... from ParamReader, which will be translated into a ParamCursor by compiler)
	:param num:
	:type num: int
	:rtype: None") IGESData_ParamCursor;
		 IGESData_ParamCursor (const Standard_Integer num);

		/****************** IGESData_ParamCursor ******************/
		%feature("compactdefaultargs") IGESData_ParamCursor;
		%feature("autodoc", "* Creates a Cursor to read a list of parameters (count 'nb') starting from a precise one (number 'num') included, then set Current Number of ParamNumber to the first following one ('num + nb') If size is given, it means that each parameter is made of more than one term. One term is the normal (default) case : for instance, a Parameter comprises one Integer, or one Entity ... Size gives the complete size of each Item if it is complex. To be used ONLY IF it is constant
	:param num:
	:type num: int
	:param nb:
	:type nb: int
	:param size: default value is 1
	:type size: int
	:rtype: None") IGESData_ParamCursor;
		 IGESData_ParamCursor (const Standard_Integer num,const Standard_Integer nb,const Standard_Integer size = 1);

		/****************** ItemSize ******************/
		%feature("compactdefaultargs") ItemSize;
		%feature("autodoc", "* Returns length of item (count of parameters per item)
	:rtype: int") ItemSize;
		Standard_Integer ItemSize ();

		/****************** Limit ******************/
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "* Returns (excluded) upper limit number for reading parameters
	:rtype: int") Limit;
		Standard_Integer Limit ();

		/****************** Offset ******************/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "* Returns offset from which current term must be read in item
	:rtype: int") Offset;
		Standard_Integer Offset ();

		/****************** SetAdvance ******************/
		%feature("compactdefaultargs") SetAdvance;
		%feature("autodoc", "* Changes command to advance current cursor after reading parameters. If 'advance' True, sets advance, if 'False', resets it. ParamCursor is created by default with True.
	:param advance:
	:type advance: bool
	:rtype: None") SetAdvance;
		void SetAdvance (const Standard_Boolean advance);

		/****************** SetOne ******************/
		%feature("compactdefaultargs") SetOne;
		%feature("autodoc", "* Defines a term of one Parameter (very current case)
	:param autoadv: default value is Standard_True
	:type autoadv: bool
	:rtype: None") SetOne;
		void SetOne (const Standard_Boolean autoadv = Standard_True);

		/****************** SetTerm ******************/
		%feature("compactdefaultargs") SetTerm;
		%feature("autodoc", "* Defines the size of a term to read in the item : this commands ParamReader to read 'size' parameters for each item, then skip the remainder of the item to the same term of next Item (that is, skip 'item size' - 'term size') //! In addition, Offset from beginning of Item is managed : After being created, and for the frist call to SetTerm, the part of Item to be read begins exactly as the Item begins But after a SetTerm, the next read will add an offset which is the size of former term. //! autoadv commands Advance management. If it is True (default), the last SetTerm (Item size has been covered) calls SetAdvance If it is False, SetAdvance must be called directly if necessary //! Error if a SetTerm overpasses the size of the Item
	:param size:
	:type size: int
	:param autoadv: default value is Standard_True
	:type autoadv: bool
	:rtype: None") SetTerm;
		void SetTerm (const Standard_Integer size,const Standard_Boolean autoadv = Standard_True);

		/****************** SetXY ******************/
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "* Defines a term of two Parameters for a XY (current case)
	:param autoadv: default value is Standard_True
	:type autoadv: bool
	:rtype: None") SetXY;
		void SetXY (const Standard_Boolean autoadv = Standard_True);

		/****************** SetXYZ ******************/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "* Defines a term of three Parameters for XYZ (current case)
	:param autoadv: default value is Standard_True
	:type autoadv: bool
	:rtype: None") SetXYZ;
		void SetXYZ (const Standard_Boolean autoadv = Standard_True);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "* Returns (included) starting number for reading parameters
	:rtype: int") Start;
		Standard_Integer Start ();

		/****************** TermSize ******************/
		%feature("compactdefaultargs") TermSize;
		%feature("autodoc", "* Returns length of current term (count of parameters) in item
	:rtype: int") TermSize;
		Standard_Integer TermSize ();

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
		/****************** AddFail ******************/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", ":param afail:
	:type afail: char *
	:param bfail: default value is ""
	:type bfail: char *
	:rtype: None") AddFail;
		void AddFail (const char * afail,const char * bfail = "");

		/****************** AddFail ******************/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "* feeds the Check with a new fail (as a String or as a CString)
	:param af:
	:type af: TCollection_HAsciiString
	:param bf:
	:type bf: TCollection_HAsciiString
	:rtype: None") AddFail;
		void AddFail (const opencascade::handle<TCollection_HAsciiString> & af,const opencascade::handle<TCollection_HAsciiString> & bf);

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", ":param awarn:
	:type awarn: char *
	:param bwarn: default value is ""
	:type bwarn: char *
	:rtype: None") AddWarning;
		void AddWarning (const char * awarn,const char * bwarn = "");

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "* feeds the Check with a new Warning message
	:param aw:
	:type aw: TCollection_HAsciiString
	:param bw:
	:type bw: TCollection_HAsciiString
	:rtype: None") AddWarning;
		void AddWarning (const opencascade::handle<TCollection_HAsciiString> & aw,const opencascade::handle<TCollection_HAsciiString> & bw);

		/****************** CCheck ******************/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "* returns the check in a way which allows to work on it directly (i.e. messages added to the Check are added to ParamReader too)
	:rtype: opencascade::handle<Interface_Check>") CCheck;
		opencascade::handle<Interface_Check> & CCheck ();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "* returns the Check Note that any error signaled above is also recorded into it
	:rtype: opencascade::handle<Interface_Check>") Check;
		const opencascade::handle<Interface_Check> & Check ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* resets state (stage, current param number, check with no fail)
	:rtype: None") Clear;
		void Clear ();

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "* Creates a ParamCursor from the Current Number, to read one parameter, and to advance Current Number after reading
	:rtype: IGESData_ParamCursor") Current;
		IGESData_ParamCursor Current ();

		/****************** CurrentList ******************/
		%feature("compactdefaultargs") CurrentList;
		%feature("autodoc", "* Creates a ParamCursor from the Current Number, to read a list of 'nb' items, and to advance Current Number after reading By default, each item is made of one parameter If size is given, it precises the number of params per item
	:param nb:
	:type nb: int
	:param size: default value is 1
	:type size: int
	:rtype: IGESData_ParamCursor") CurrentList;
		IGESData_ParamCursor CurrentList (const Standard_Integer nb,const Standard_Integer size = 1);

		/****************** CurrentNumber ******************/
		%feature("compactdefaultargs") CurrentNumber;
		%feature("autodoc", "* returns the current parameter number This notion is involved by the organisation of an IGES list of parameter : it can be ended by two lists (Associativities and Properties), which can be empty, or even absent. Hence, it is necessary to know, at the end of specific reading, how many parameters have been read : the optionnal lists follow
	:rtype: int") CurrentNumber;
		Standard_Integer CurrentNumber ();

		/****************** DefinedElseSkip ******************/
		%feature("compactdefaultargs") DefinedElseSkip;
		%feature("autodoc", "* Allows to simply process a parameter which can be defaulted. Waits on the Current Number a defined parameter or skips it : If the parameter <num> is defined, changes nothing and returns True Hence, the next reading with current cursor will concern <num> If it is void, advances Current Position by one, and returns False The next reading will concern <num+1> (except if <num> = NbParams) //! This allows to process Default values as follows (C++) : if (PR.DefinedElseSkip()) { .. PR.Read... (current parameter); } else { <current parameter> = default value .. nothing else to do with ParamReader } For Message
	:rtype: bool") DefinedElseSkip;
		Standard_Boolean DefinedElseSkip ();

		/****************** EndAll ******************/
		%feature("compactdefaultargs") EndAll;
		%feature("autodoc", "* passes directly to the end of reading process
	:rtype: None") EndAll;
		void EndAll ();

		/****************** EntityNumber ******************/
		%feature("compactdefaultargs") EntityNumber;
		%feature("autodoc", "* Returns the entity number in the file
	:rtype: int") EntityNumber;
		Standard_Integer EntityNumber ();

		/****************** HasFailed ******************/
		%feature("compactdefaultargs") HasFailed;
		%feature("autodoc", "* says if fails have been recorded into the Check
	:rtype: bool") HasFailed;
		Standard_Boolean HasFailed ();

		/****************** IGESData_ParamReader ******************/
		%feature("compactdefaultargs") IGESData_ParamReader;
		%feature("autodoc", "* Prepares a ParamReader, stage 'Own', current param = 1 It considers a part of the list, from <base> (excluded) for <nbpar> parameters; <nbpar> = 0 commands to take list length. Default is (1 to skip type)
	:param list:
	:type list: Interface_ParamList
	:param ach:
	:type ach: Interface_Check
	:param base: default value is 1
	:type base: int
	:param nbpar: default value is 0
	:type nbpar: int
	:param num: default value is 0
	:type num: int
	:rtype: None") IGESData_ParamReader;
		 IGESData_ParamReader (const opencascade::handle<Interface_ParamList> & list,const opencascade::handle<Interface_Check> & ach,const Standard_Integer base = 1,const Standard_Integer nbpar = 0,const Standard_Integer num = 0);

		/****************** IsCheckEmpty ******************/
		%feature("compactdefaultargs") IsCheckEmpty;
		%feature("autodoc", "* Returns True if the Check is Empty Else, it has to be recorded with the Read Entity
	:rtype: bool") IsCheckEmpty;
		Standard_Boolean IsCheckEmpty ();

		/****************** IsParamDefined ******************/
		%feature("compactdefaultargs") IsParamDefined;
		%feature("autodoc", "* says if a parameter is defined (not void) See also DefinedElseSkip
	:param num:
	:type num: int
	:rtype: bool") IsParamDefined;
		Standard_Boolean IsParamDefined (const Standard_Integer num);

		/****************** IsParamEntity ******************/
		%feature("compactdefaultargs") IsParamEntity;
		%feature("autodoc", "* says if a parameter can be regarded as an entity reference (see Prepare from IGESReaderData for more explanation) Note that such a parameter can seen as be a plain Integer too
	:param num:
	:type num: int
	:rtype: bool") IsParamEntity;
		Standard_Boolean IsParamEntity (const Standard_Integer num);

		/****************** Mend ******************/
		%feature("compactdefaultargs") Mend;
		%feature("autodoc", ":param pref: default value is ""
	:type pref: char *
	:rtype: None") Mend;
		void Mend (const char * pref = "");

		/****************** NbParams ******************/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "* returns number of parameters (minus the first one) following method skip the first parameter (1 gives the 2nd)
	:rtype: int") NbParams;
		Standard_Integer NbParams ();

		/****************** NextStage ******************/
		%feature("compactdefaultargs") NextStage;
		%feature("autodoc", "* passes to next stage (must be linked with setting Current)
	:rtype: None") NextStage;
		void NextStage ();

		/****************** ParamEntity ******************/
		%feature("compactdefaultargs") ParamEntity;
		%feature("autodoc", "* directly returns entity referenced by a parameter
	:param IR:
	:type IR: IGESData_IGESReaderData
	:param num:
	:type num: int
	:rtype: opencascade::handle<IGESData_IGESEntity>") ParamEntity;
		opencascade::handle<IGESData_IGESEntity> ParamEntity (const opencascade::handle<IGESData_IGESReaderData> & IR,const Standard_Integer num);

		/****************** ParamNumber ******************/
		%feature("compactdefaultargs") ParamNumber;
		%feature("autodoc", "* returns entity number corresponding to a parameter if there is otherwise zero (according criterium IsParamEntity)
	:param num:
	:type num: int
	:rtype: int") ParamNumber;
		Standard_Integer ParamNumber (const Standard_Integer num);

		/****************** ParamType ******************/
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "* returns type of parameter; note that 'Ident' or 'Sub' cannot be encountered, they correspond to 'Integer', see also below
	:param num:
	:type num: int
	:rtype: Interface_ParamType") ParamType;
		Interface_ParamType ParamType (const Standard_Integer num);

		/****************** ParamValue ******************/
		%feature("compactdefaultargs") ParamValue;
		%feature("autodoc", "* returns litteral value of a parameter, as it was in file
	:param num:
	:type num: int
	:rtype: char *") ParamValue;
		const char * ParamValue (const Standard_Integer num);

		/****************** ReadBoolean ******************/
		%feature("compactdefaultargs") ReadBoolean;
		%feature("autodoc", ":param PC:
	:type PC: IGESData_ParamCursor
	:param amsg:
	:type amsg: Message_Msg
	:param val:
	:type val: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool") ReadBoolean;
		Standard_Boolean ReadBoolean (const IGESData_ParamCursor & PC,const Message_Msg & amsg,Standard_Boolean &OutValue,const Standard_Boolean exact = Standard_True);

		/****************** ReadBoolean ******************/
		%feature("compactdefaultargs") ReadBoolean;
		%feature("autodoc", "* Reads a Boolean value from parameter 'num' A Boolean is given as an Integer value 0 (False) or 1 (True) Anyway, an Integer is demanded (else, Check is filled) If exact is given True, those precise values are demanded Else, Correction is done, as False for 0 or <0, True for >0 (with a Warning error message, and return is True) In case of error (not an Integer, or not 0/1 and exact True), Check is filled with a Fail (using mess) and return is False
	:param PC:
	:type PC: IGESData_ParamCursor
	:param mess:
	:type mess: char *
	:param val:
	:type val: bool
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: bool") ReadBoolean;
		Standard_Boolean ReadBoolean (const IGESData_ParamCursor & PC,const char * mess,Standard_Boolean &OutValue,const Standard_Boolean exact = Standard_True);

		/****************** ReadEntList ******************/
		%feature("compactdefaultargs") ReadEntList;
		%feature("autodoc", ":param IR:
	:type IR: IGESData_IGESReaderData
	:param PC:
	:type PC: IGESData_ParamCursor
	:param amsg:
	:type amsg: Message_Msg
	:param val:
	:type val: Interface_EntityList
	:param ord: default value is Standard_True
	:type ord: bool
	:rtype: bool") ReadEntList;
		Standard_Boolean ReadEntList (const opencascade::handle<IGESData_IGESReaderData> & IR,const IGESData_ParamCursor & PC,Message_Msg & amsg,Interface_EntityList & val,const Standard_Boolean ord = Standard_True);

		/****************** ReadEntList ******************/
		%feature("compactdefaultargs") ReadEntList;
		%feature("autodoc", "* Reads a list of Entities defined by PC Same conditions as for ReadEnts, for PC The list is given as an EntityList (index has no meaning; the EntityList starts from clear) If 'ord' is given True (default), entities will be added to the list in their original order Remark : Negative or Null Pointers are ignored Else ('ord' False), order is not garanteed (faster mode) If all params cannot be read as Entities, same as above Warning Give 'ord' to False ONLY if order is not significant
	:param IR:
	:type IR: IGESData_IGESReaderData
	:param PC:
	:type PC: IGESData_ParamCursor
	:param mess:
	:type mess: char *
	:param val:
	:type val: Interface_EntityList
	:param ord: default value is Standard_True
	:type ord: bool
	:rtype: bool") ReadEntList;
		Standard_Boolean ReadEntList (const opencascade::handle<IGESData_IGESReaderData> & IR,const IGESData_ParamCursor & PC,const char * mess,Interface_EntityList & val,const Standard_Boolean ord = Standard_True);

		/****************** ReadEnts ******************/
		%feature("compactdefaultargs") ReadEnts;
		%feature("autodoc", ":param IR:
	:type IR: IGESData_IGESReaderData
	:param PC:
	:type PC: IGESData_ParamCursor
	:param amsg:
	:type amsg: Message_Msg
	:param val:
	:type val: IGESData_HArray1OfIGESEntity
	:param index: default value is 1
	:type index: int
	:rtype: bool") ReadEnts;
		Standard_Boolean ReadEnts (const opencascade::handle<IGESData_IGESReaderData> & IR,const IGESData_ParamCursor & PC,const Message_Msg & amsg,opencascade::handle<IGESData_HArray1OfIGESEntity> & val,const Standard_Integer index = 1);

		/****************** ReadEnts ******************/
		%feature("compactdefaultargs") ReadEnts;
		%feature("autodoc", "* Reads a list of Entities defined by PC Same conditions as for ReadInts, for PC and index The list is given as a HArray1, numered from 'index' If all params cannot be read as Entities, Check is filled (using mess) and return value is False Remark : Null references are accepted, they are ignored (negative pointers too : they provoke a Warning message) If the caller wants to check them, a loop on ReadEntity should be used
	:param IR:
	:type IR: IGESData_IGESReaderData
	:param PC:
	:type PC: IGESData_ParamCursor
	:param mess:
	:type mess: char *
	:param val:
	:type val: IGESData_HArray1OfIGESEntity
	:param index: default value is 1
	:type index: int
	:rtype: bool") ReadEnts;
		Standard_Boolean ReadEnts (const opencascade::handle<IGESData_IGESReaderData> & IR,const IGESData_ParamCursor & PC,const char * mess,opencascade::handle<IGESData_HArray1OfIGESEntity> & val,const Standard_Integer index = 1);

		/****************** ReadInteger ******************/
		%feature("compactdefaultargs") ReadInteger;
		%feature("autodoc", ":param PC:
	:type PC: IGESData_ParamCursor
	:param val:
	:type val: int
	:rtype: bool") ReadInteger;
		Standard_Boolean ReadInteger (const IGESData_ParamCursor & PC,Standard_Integer &OutValue);

		/****************** ReadInteger ******************/
		%feature("compactdefaultargs") ReadInteger;
		%feature("autodoc", "* Reads an Integer value designated by PC The method Current designates the current parameter and advances the Current Number by one after reading Note that if a count (not 1) is given, it is ignored If it is not an Integer, fills Check with a Fail (using mess) and returns False
	:param PC:
	:type PC: IGESData_ParamCursor
	:param mess:
	:type mess: char *
	:param val:
	:type val: int
	:rtype: bool") ReadInteger;
		Standard_Boolean ReadInteger (const IGESData_ParamCursor & PC,const char * mess,Standard_Integer &OutValue);

		/****************** ReadInts ******************/
		%feature("compactdefaultargs") ReadInts;
		%feature("autodoc", ":param PC:
	:type PC: IGESData_ParamCursor
	:param amsg:
	:type amsg: Message_Msg
	:param val:
	:type val: TColStd_HArray1OfInteger
	:param index: default value is 1
	:type index: int
	:rtype: bool") ReadInts;
		Standard_Boolean ReadInts (const IGESData_ParamCursor & PC,const Message_Msg & amsg,opencascade::handle<TColStd_HArray1OfInteger> & val,const Standard_Integer index = 1);

		/****************** ReadInts ******************/
		%feature("compactdefaultargs") ReadInts;
		%feature("autodoc", "* Reads a list of Integer values, defined by PC (with a count of parameters). PC can start from Current Number and command it to advance after reading (use method CurrentList to do this) The list is given as a HArray1, numered from 'index' If all params are not Integer, Check is filled (using mess) and return value is False
	:param PC:
	:type PC: IGESData_ParamCursor
	:param mess:
	:type mess: char *
	:param val:
	:type val: TColStd_HArray1OfInteger
	:param index: default value is 1
	:type index: int
	:rtype: bool") ReadInts;
		Standard_Boolean ReadInts (const IGESData_ParamCursor & PC,const char * mess,opencascade::handle<TColStd_HArray1OfInteger> & val,const Standard_Integer index = 1);

		/****************** ReadReal ******************/
		%feature("compactdefaultargs") ReadReal;
		%feature("autodoc", ":param PC:
	:type PC: IGESData_ParamCursor
	:param val:
	:type val: float
	:rtype: bool") ReadReal;
		Standard_Boolean ReadReal (const IGESData_ParamCursor & PC,Standard_Real &OutValue);

		/****************** ReadReal ******************/
		%feature("compactdefaultargs") ReadReal;
		%feature("autodoc", "* Reads a Real value from parameter 'num' An Integer is accepted (Check is filled with a Warning message) and causes return to be True (as normal case) In other cases, Check is filled with a Fail and return is False
	:param PC:
	:type PC: IGESData_ParamCursor
	:param mess:
	:type mess: char *
	:param val:
	:type val: float
	:rtype: bool") ReadReal;
		Standard_Boolean ReadReal (const IGESData_ParamCursor & PC,const char * mess,Standard_Real &OutValue);

		/****************** ReadReals ******************/
		%feature("compactdefaultargs") ReadReals;
		%feature("autodoc", ":param PC:
	:type PC: IGESData_ParamCursor
	:param amsg:
	:type amsg: Message_Msg
	:param val:
	:type val: TColStd_HArray1OfReal
	:param index: default value is 1
	:type index: int
	:rtype: bool") ReadReals;
		Standard_Boolean ReadReals (const IGESData_ParamCursor & PC,Message_Msg & amsg,opencascade::handle<TColStd_HArray1OfReal> & val,const Standard_Integer index = 1);

		/****************** ReadReals ******************/
		%feature("compactdefaultargs") ReadReals;
		%feature("autodoc", "* Reads a list of Real values defined by PC Same conditions as for ReadInts, for PC and index An Integer parameter is accepted, if at least one parameter is Integer, Check is filled with a 'Warning' message If all params are neither Real nor Integer, Check is filled (using mess) and return value is False
	:param PC:
	:type PC: IGESData_ParamCursor
	:param mess:
	:type mess: char *
	:param val:
	:type val: TColStd_HArray1OfReal
	:param index: default value is 1
	:type index: int
	:rtype: bool") ReadReals;
		Standard_Boolean ReadReals (const IGESData_ParamCursor & PC,const char * mess,opencascade::handle<TColStd_HArray1OfReal> & val,const Standard_Integer index = 1);

		/****************** ReadText ******************/
		%feature("compactdefaultargs") ReadText;
		%feature("autodoc", ":param PC:
	:type PC: IGESData_ParamCursor
	:param amsg:
	:type amsg: Message_Msg
	:param val:
	:type val: TCollection_HAsciiString
	:rtype: bool") ReadText;
		Standard_Boolean ReadText (const IGESData_ParamCursor & PC,const Message_Msg & amsg,opencascade::handle<TCollection_HAsciiString> & val);

		/****************** ReadText ******************/
		%feature("compactdefaultargs") ReadText;
		%feature("autodoc", "* Reads a Text value from parameter 'num', as a String from Collection, that is, Hollerith text without leading 'nnnH' If it is not a String, fills Check with a Fail (using mess) and returns False
	:param PC:
	:type PC: IGESData_ParamCursor
	:param mess:
	:type mess: char *
	:param val:
	:type val: TCollection_HAsciiString
	:rtype: bool") ReadText;
		Standard_Boolean ReadText (const IGESData_ParamCursor & PC,const char * mess,opencascade::handle<TCollection_HAsciiString> & val);

		/****************** ReadTexts ******************/
		%feature("compactdefaultargs") ReadTexts;
		%feature("autodoc", ":param PC:
	:type PC: IGESData_ParamCursor
	:param amsg:
	:type amsg: Message_Msg
	:param val:
	:type val: Interface_HArray1OfHAsciiString
	:param index: default value is 1
	:type index: int
	:rtype: bool") ReadTexts;
		Standard_Boolean ReadTexts (const IGESData_ParamCursor & PC,const Message_Msg & amsg,opencascade::handle<Interface_HArray1OfHAsciiString> & val,const Standard_Integer index = 1);

		/****************** ReadTexts ******************/
		%feature("compactdefaultargs") ReadTexts;
		%feature("autodoc", "* Reads a list of Hollerith Texts, defined by PC Texts are read as Hollerith texts without leading 'nnnH' Same conditions as for ReadInts, for PC and index If all params are not Text, Check is filled (using mess) and return value is False
	:param PC:
	:type PC: IGESData_ParamCursor
	:param mess:
	:type mess: char *
	:param val:
	:type val: Interface_HArray1OfHAsciiString
	:param index: default value is 1
	:type index: int
	:rtype: bool") ReadTexts;
		Standard_Boolean ReadTexts (const IGESData_ParamCursor & PC,const char * mess,opencascade::handle<Interface_HArray1OfHAsciiString> & val,const Standard_Integer index = 1);

		/****************** ReadXY ******************/
		%feature("compactdefaultargs") ReadXY;
		%feature("autodoc", ":param PC:
	:type PC: IGESData_ParamCursor
	:param amsg:
	:type amsg: Message_Msg
	:param val:
	:type val: gp_XY
	:rtype: bool") ReadXY;
		Standard_Boolean ReadXY (const IGESData_ParamCursor & PC,Message_Msg & amsg,gp_XY & val);

		/****************** ReadXY ******************/
		%feature("compactdefaultargs") ReadXY;
		%feature("autodoc", "* Reads a couple of Real values (X,Y) from parameter 'num' Integers are accepted (Check is filled with a Warning message) and cause return to be True (as normal case) In other cases, Check is filled with a Fail and return is False
	:param PC:
	:type PC: IGESData_ParamCursor
	:param mess:
	:type mess: char *
	:param val:
	:type val: gp_XY
	:rtype: bool") ReadXY;
		Standard_Boolean ReadXY (const IGESData_ParamCursor & PC,const char * mess,gp_XY & val);

		/****************** ReadXYZ ******************/
		%feature("compactdefaultargs") ReadXYZ;
		%feature("autodoc", ":param PC:
	:type PC: IGESData_ParamCursor
	:param amsg:
	:type amsg: Message_Msg
	:param val:
	:type val: gp_XYZ
	:rtype: bool") ReadXYZ;
		Standard_Boolean ReadXYZ (const IGESData_ParamCursor & PC,Message_Msg & amsg,gp_XYZ & val);

		/****************** ReadXYZ ******************/
		%feature("compactdefaultargs") ReadXYZ;
		%feature("autodoc", "* Reads a triplet of Real values (X,Y,Z) from parameter 'num' Integers are accepted (Check is filled with a Warning message) and cause return to be True (as normal case) In other cases, Check is filled with a Fail and return is False For Message
	:param PC:
	:type PC: IGESData_ParamCursor
	:param mess:
	:type mess: char *
	:param val:
	:type val: gp_XYZ
	:rtype: bool") ReadXYZ;
		Standard_Boolean ReadXYZ (const IGESData_ParamCursor & PC,const char * mess,gp_XYZ & val);

		/****************** ReadingEntityNumber ******************/
		%feature("compactdefaultargs") ReadingEntityNumber;
		%feature("autodoc", ":param num:
	:type num: int
	:param val:
	:type val: int
	:rtype: bool") ReadingEntityNumber;
		Standard_Boolean ReadingEntityNumber (const Standard_Integer num,Standard_Integer &OutValue);

		/****************** ReadingEntityNumber ******************/
		%feature("compactdefaultargs") ReadingEntityNumber;
		%feature("autodoc", "* Routine which reads an Entity Number (which allows to read the Entity in the IGESReaderData by BoundEntity), given its number in the list of Parameters Same conditions as ReadEntity for mess, val, and return value In particular, returns True and val to zero means Null Entity, and val not zero means Entity read by BoundEntity
	:param num:
	:type num: int
	:param mess:
	:type mess: char *
	:param val:
	:type val: int
	:rtype: bool") ReadingEntityNumber;
		Standard_Boolean ReadingEntityNumber (const Standard_Integer num,const char * mess,Standard_Integer &OutValue);

		/****************** ReadingReal ******************/
		%feature("compactdefaultargs") ReadingReal;
		%feature("autodoc", ":param num:
	:type num: int
	:param val:
	:type val: float
	:rtype: bool") ReadingReal;
		Standard_Boolean ReadingReal (const Standard_Integer num,Standard_Real &OutValue);

		/****************** ReadingReal ******************/
		%feature("compactdefaultargs") ReadingReal;
		%feature("autodoc", "* Routine which reads a Real parameter, given its number Same conditions as ReadReal for mess, val, and return value
	:param num:
	:type num: int
	:param mess:
	:type mess: char *
	:param val:
	:type val: float
	:rtype: bool") ReadingReal;
		Standard_Boolean ReadingReal (const Standard_Integer num,const char * mess,Standard_Real &OutValue);

		/****************** SendFail ******************/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", ":param amsg:
	:type amsg: Message_Msg
	:rtype: None") SendFail;
		void SendFail (const Message_Msg & amsg);

		/****************** SendWarning ******************/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", ":param amsg:
	:type amsg: Message_Msg
	:rtype: None") SendWarning;
		void SendWarning (const Message_Msg & amsg);

		/****************** SetCurrentNumber ******************/
		%feature("compactdefaultargs") SetCurrentNumber;
		%feature("autodoc", "* sets current parameter number to a new value must be done at end of each step : set on first parameter following last read one; is done by some Read... methods (must be done directly if these method are not used) num greater than NbParams means that following lists are empty If current num is not managed, it remains at 1, which probably will cause error when successive steps of reading are made
	:param num:
	:type num: int
	:rtype: None") SetCurrentNumber;
		void SetCurrentNumber (const Standard_Integer num);

		/****************** Stage ******************/
		%feature("compactdefaultargs") Stage;
		%feature("autodoc", "* gives current stage (Own-Props-Assocs-End, begins at Own)
	:rtype: IGESData_ReadStage") Stage;
		IGESData_ReadStage Stage ();

};


%extend IGESData_ParamReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IGESData_Protocol *
**************************/
class IGESData_Protocol : public Interface_Protocol {
	public:
		/****************** IGESData_Protocol ******************/
		%feature("compactdefaultargs") IGESData_Protocol;
		%feature("autodoc", ":rtype: None") IGESData_Protocol;
		 IGESData_Protocol ();

		/****************** IsSuitableModel ******************/
		%feature("compactdefaultargs") IsSuitableModel;
		%feature("autodoc", "* Returns True if <model> is a Model of IGES Norm
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") IsSuitableModel;
		Standard_Boolean IsSuitableModel (const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** IsUnknownEntity ******************/
		%feature("compactdefaultargs") IsUnknownEntity;
		%feature("autodoc", "* Returns True if <ent> is an Unknown Entity for the Norm, i.e. Type UndefinedEntity, status Unknown
	:param ent:
	:type ent: Standard_Transient
	:rtype: bool") IsUnknownEntity;
		Standard_Boolean IsUnknownEntity (const opencascade::handle<Standard_Transient> & ent);

		/****************** NbResources ******************/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "* Gives the count of Resource Protocol. Here, none
	:rtype: int") NbResources;
		Standard_Integer NbResources ();

		/****************** NewModel ******************/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "* Creates an empty Model for IGES Norm
	:rtype: opencascade::handle<Interface_InterfaceModel>") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel ();

		/****************** Resource ******************/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "* Returns a Resource, given a rank. Here, none
	:param num:
	:type num: int
	:rtype: opencascade::handle<Interface_Protocol>") Resource;
		opencascade::handle<Interface_Protocol> Resource (const Standard_Integer num);

		/****************** TypeNumber ******************/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "* Returns a Case Number, specific of each recognized Type Here, Undefined and Free Format Entities have the Number 1.
	:param atype:
	:type atype: Standard_Type
	:rtype: int") TypeNumber;
		Standard_Integer TypeNumber (const opencascade::handle<Standard_Type> & atype);

		/****************** UnknownEntity ******************/
		%feature("compactdefaultargs") UnknownEntity;
		%feature("autodoc", "* Creates a new Unknown Entity for IGES (UndefinedEntity)
	:rtype: opencascade::handle<Standard_Transient>") UnknownEntity;
		opencascade::handle<Standard_Transient> UnknownEntity ();

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
		%feature("autodoc", "* Defines Case Numbers corresponding to the Entity Types taken into account by a sub-class of ReadWriteModule (hence, each sub-class of ReadWriteModule has to redefine this method) Called by CaseNum. Its result will then be used to call Read, etc ...
	:param typenum:
	:type typenum: int
	:param formnum:
	:type formnum: int
	:rtype: int") CaseIGES;
		virtual Standard_Integer CaseIGES (const Standard_Integer typenum,const Standard_Integer formnum);

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Translates the Type of record <num> in <data> to a positive Case Number, or 0 if failed. Works with IGESReaderData which provides Type & Form Numbers, and calls CaseIGES (see below)
	:param data:
	:type data: Interface_FileReaderData
	:param num:
	:type num: int
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Interface_FileReaderData> & data,const Standard_Integer num);

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "* General Read Function. See IGESReaderTool for more info
	:param CN:
	:type CN: int
	:param data:
	:type data: Interface_FileReaderData
	:param num:
	:type num: int
	:param ach:
	:type ach: Interface_Check
	:param ent:
	:type ent: Standard_Transient
	:rtype: None") Read;
		void Read (const Standard_Integer CN,const opencascade::handle<Interface_FileReaderData> & data,const Standard_Integer num,opencascade::handle<Interface_Check> & ach,const opencascade::handle<Standard_Transient> & ent);

		/****************** ReadOwnParams ******************/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "* Reads own parameters from file for an Entity; <PR> gives access to them, <IR> detains parameter types and values For each class, there must be a specific action provided Note that Properties and Associativities Lists are Read by specific methods (see below), they are called under control of reading process (only one call) according Stage recorded in ParamReader
	:param CN:
	:type CN: int
	:param ent:
	:type ent: IGESData_IGESEntity
	:param IR:
	:type IR: IGESData_IGESReaderData
	:param PR:
	:type PR: IGESData_ParamReader
	:rtype: void") ReadOwnParams;
		virtual void ReadOwnParams (const Standard_Integer CN,const opencascade::handle<IGESData_IGESEntity> & ent,const opencascade::handle<IGESData_IGESReaderData> & IR,IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "* Writes own parameters to IGESWriter; defined for each class (to be redefined for other IGES ReadWriteModules) Warning : Properties and Associativities are directly managed by WriteIGES, must not be sent by this method
	:param CN:
	:type CN: int
	:param ent:
	:type ent: IGESData_IGESEntity
	:param IW:
	:type IW: IGESData_IGESWriter
	:rtype: void") WriteOwnParams;
		virtual void WriteOwnParams (const Standard_Integer CN,const opencascade::handle<IGESData_IGESEntity> & ent,IGESData_IGESWriter & IW);

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
		/****************** AddProtocol ******************/
		%feature("compactdefaultargs") AddProtocol;
		%feature("autodoc", "* Adds a couple (Module-Protocol) to the Library, given the class of a Protocol. Takes Resources into account. (if <aprotocol> is not of type TheProtocol, it is not added)
	:param aprotocol:
	:type aprotocol: Standard_Transient
	:rtype: None") AddProtocol;
		void AddProtocol (const opencascade::handle<Standard_Transient> & aprotocol);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the list of Modules of a library (can be used to redefine the order of Modules before action : Clear then refill the Library by calls to AddProtocol)
	:rtype: None") Clear;
		void Clear ();

		/****************** IGESData_SpecificLib ******************/
		%feature("compactdefaultargs") IGESData_SpecificLib;
		%feature("autodoc", "* Creates a Library which complies with a Protocol, that is : Same class (criterium IsInstance) This creation gets the Modules from the global set, those which are bound to the given Protocol and its Resources
	:param aprotocol:
	:type aprotocol: IGESData_Protocol
	:rtype: None") IGESData_SpecificLib;
		 IGESData_SpecificLib (const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****************** IGESData_SpecificLib ******************/
		%feature("compactdefaultargs") IGESData_SpecificLib;
		%feature("autodoc", "* Creates an empty Library : it will later by filled by method AddProtocol
	:rtype: None") IGESData_SpecificLib;
		 IGESData_SpecificLib ();

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "* Returns the current Module in the Iteration
	:rtype: opencascade::handle<IGESData_SpecificModule>") Module;
		const opencascade::handle<IGESData_SpecificModule> & Module ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True if there are more Modules to iterate on
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Iterates by getting the next Module in the list If there is none, the exception will be raised by Value
	:rtype: None") Next;
		void Next ();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "* Returns the current Protocol in the Iteration
	:rtype: opencascade::handle<IGESData_Protocol>") Protocol;
		const opencascade::handle<IGESData_Protocol> & Protocol ();

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "* Selects a Module from the Library, given an Object. Returns True if Select has succeeded, False else. Also Returns (as arguments) the selected Module and the Case Number determined by the associated Protocol. If Select has failed, <module> is Null Handle and CN is zero. (Select can work on any criterium, such as Object DynamicType)
	:param obj:
	:type obj: IGESData_IGESEntity
	:param module:
	:type module: IGESData_SpecificModule
	:param CN:
	:type CN: int
	:rtype: bool") Select;
		Standard_Boolean Select (const opencascade::handle<IGESData_IGESEntity> & obj,opencascade::handle<IGESData_SpecificModule> & module,Standard_Integer &OutValue);

		/****************** SetComplete ******************/
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "* Sets a library to be defined with the complete Global list (all the couples Protocol/Modules recorded in it)
	:rtype: None") SetComplete;
		void SetComplete ();

		/****************** SetGlobal ******************/
		%feature("compactdefaultargs") SetGlobal;
		%feature("autodoc", "* Adds a couple (Module-Protocol) into the global definition set for this class of Library.
	:param amodule:
	:type amodule: IGESData_SpecificModule
	:param aprotocol:
	:type aprotocol: IGESData_Protocol
	:rtype: void") SetGlobal;
		static void SetGlobal (const opencascade::handle<IGESData_SpecificModule> & amodule,const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "* Starts Iteration on the Modules (sets it on the first one)
	:rtype: None") Start;
		void Start ();

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
		%feature("autodoc", "* Specific Automatic Correction on own Parameters of an Entity. It works by setting in accordance redundant data, if there are when there is no ambiguity (else, it does nothing). Remark that classic Corrections on Directory Entry (to set void data) are taken into account alsewhere. //! For instance, many 'Associativity Entities' have a Number of Properties which must have a fixed value. Or, a ConicalArc has its Form Number which records the kind of Conic, also determined from its coefficients But, a CircularArc of which Distances (Center-Start) and (Center-End) are not equal cannot be corrected ... //! Returns True if something has been corrected in <ent> By default, does nothing. If at least one of the Types processed by a sub-class of SpecificModule has a Correct procedure attached, this method can be redefined
	:param CN:
	:type CN: int
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: bool") OwnCorrect;
		virtual Standard_Boolean OwnCorrect (const Standard_Integer CN,const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** OwnDump ******************/
		%feature("compactdefaultargs") OwnDump;
		%feature("autodoc", "* Specific Dump for each type of IGES Entity : it concerns only own parameters, the general data (Directory Part, Lists) are taken into account by the IGESDumper See class IGESDumper for the rules to follow for <own> and <attached> level
	:param CN:
	:type CN: int
	:param ent:
	:type ent: IGESData_IGESEntity
	:param dumper:
	:type dumper: IGESData_IGESDumper
	:param S:
	:type S: Message_Messenger
	:param own:
	:type own: int
	:rtype: void") OwnDump;
		virtual void OwnDump (const Standard_Integer CN,const opencascade::handle<IGESData_IGESEntity> & ent,const IGESData_IGESDumper & dumper,const opencascade::handle<Message_Messenger> & S,const Standard_Integer own);

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
		/****************** AnalyseLocation ******************/
		%feature("compactdefaultargs") AnalyseLocation;
		%feature("autodoc", "* Analysis a Location given as a GTrsf, by trying to convert it to a Trsf (i.e. to a True Location of which effect is described by an Isometry or a Similarity) Works with the Precision given by default or by SetPrecision Calls ConvertLocation (see below)
	:param loc:
	:type loc: gp_GTrsf
	:param result:
	:type result: gp_Trsf
	:rtype: bool") AnalyseLocation;
		Standard_Boolean AnalyseLocation (const gp_GTrsf & loc,gp_Trsf & result);

		/****************** ConvertLocation ******************/
		%feature("compactdefaultargs") ConvertLocation;
		%feature("autodoc", "* Convertion of a Location, from GTrsf form to Trsf form Works with a precision given as argument. Returns True if the Conversion is possible, (hence, <result> contains the converted location), False else <unit>, if given, indicates the unit in which <loc> is defined in meters. It concerns the translation part (to be converted. //! As a class method, it can be called separately
	:param prec:
	:type prec: float
	:param loc:
	:type loc: gp_GTrsf
	:param result:
	:type result: gp_Trsf
	:param uni: default value is 1
	:type uni: float
	:rtype: bool") ConvertLocation;
		static Standard_Boolean ConvertLocation (const Standard_Real prec,const gp_GTrsf & loc,gp_Trsf & result,const Standard_Real uni = 1);

		/****************** EffectiveLocation ******************/
		%feature("compactdefaultargs") EffectiveLocation;
		%feature("autodoc", "* Returns the effective Location of an Entity, i.e. the composition of its proper Transformation Matrix (returned by Transf) and its Parent's Location (returned by ParentLocation)
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: gp_GTrsf") EffectiveLocation;
		gp_GTrsf EffectiveLocation (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** ExplicitLocation ******************/
		%feature("compactdefaultargs") ExplicitLocation;
		%feature("autodoc", "* Returns the Explicit Location defined by the Transformation Matrix of <ent>. Identity if there is none
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: gp_GTrsf") ExplicitLocation;
		gp_GTrsf ExplicitLocation (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** HasParent ******************/
		%feature("compactdefaultargs") HasParent;
		%feature("autodoc", "* Returns True if <ent> is dependent from one and only one other Entity, either by Reference or by Associativity
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: bool") HasParent;
		Standard_Boolean HasParent (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** HasParentByAssociativity ******************/
		%feature("compactdefaultargs") HasParentByAssociativity;
		%feature("autodoc", "* Returns True if the Parent, if there is one, is defined by a SingleParentEntity Associativity Else, if HasParent is True, it is by Reference
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: bool") HasParentByAssociativity;
		Standard_Boolean HasParentByAssociativity (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** HasTransf ******************/
		%feature("compactdefaultargs") HasTransf;
		%feature("autodoc", "* Returns True if <ent> has a Transformation Matrix in proper (referenced from its Directory Part)
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: bool") HasTransf;
		Standard_Boolean HasTransf (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** IGESData_ToolLocation ******************/
		%feature("compactdefaultargs") IGESData_ToolLocation;
		%feature("autodoc", "* Creates a ToolLocation on a given Model, filled with the help of a Protocol (which allows to known Entities referenced by other ones)
	:param amodel:
	:type amodel: IGESData_IGESModel
	:param protocol:
	:type protocol: IGESData_Protocol
	:rtype: None") IGESData_ToolLocation;
		 IGESData_ToolLocation (const opencascade::handle<IGESData_IGESModel> & amodel,const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** IsAmbiguous ******************/
		%feature("compactdefaultargs") IsAmbiguous;
		%feature("autodoc", "* Returns True if more than one Parent has been determined for <ent>, by adding direct References and Associativities
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: bool") IsAmbiguous;
		Standard_Boolean IsAmbiguous (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** IsAssociativity ******************/
		%feature("compactdefaultargs") IsAssociativity;
		%feature("autodoc", "* Returns True if <ent> is an Associativity (IGES Type 402). Then, Location does not apply.
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: bool") IsAssociativity;
		Standard_Boolean IsAssociativity (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** IsTransf ******************/
		%feature("compactdefaultargs") IsTransf;
		%feature("autodoc", "* Returns True if <ent> is kind of TransfEntity. Then, it has no location, while it can be used to define a Location)
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: bool") IsTransf;
		Standard_Boolean IsTransf (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Does the effective work of determining Locations of Entities
	:rtype: None") Load;
		void Load ();

		/****************** Parent ******************/
		%feature("compactdefaultargs") Parent;
		%feature("autodoc", "* Returns the unique Parent recorded for <ent>. Returns a Null Handle if there is none
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: opencascade::handle<IGESData_IGESEntity>") Parent;
		opencascade::handle<IGESData_IGESEntity> Parent (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** ParentLocation ******************/
		%feature("compactdefaultargs") ParentLocation;
		%feature("autodoc", "* Returns the effective Location of the Parent of <ent>, if there is one : this Location is itself given as compound according dependences on the Parent, if there are some. Returns an Identity Transformation if no Parent is recorded.
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: gp_GTrsf") ParentLocation;
		gp_GTrsf ParentLocation (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** ResetDependences ******************/
		%feature("compactdefaultargs") ResetDependences;
		%feature("autodoc", "* Resets all informations about dependences for <child>
	:param child:
	:type child: IGESData_IGESEntity
	:rtype: None") ResetDependences;
		void ResetDependences (const opencascade::handle<IGESData_IGESEntity> & child);

		/****************** SetOwnAsDependent ******************/
		%feature("compactdefaultargs") SetOwnAsDependent;
		%feature("autodoc", "* Unitary action which defines Entities referenced by <ent> (except those in Directory Part and Associativities List) as Dependent (their Locations are related to that of <ent>)
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: None") SetOwnAsDependent;
		void SetOwnAsDependent (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** SetParentAssoc ******************/
		%feature("compactdefaultargs") SetParentAssoc;
		%feature("autodoc", "* Sets the 'Associativity' information for <child> as being <parent> (it must be the Parent itself, not the Associativity)
	:param parent:
	:type parent: IGESData_IGESEntity
	:param child:
	:type child: IGESData_IGESEntity
	:rtype: None") SetParentAssoc;
		void SetParentAssoc (const opencascade::handle<IGESData_IGESEntity> & parent,const opencascade::handle<IGESData_IGESEntity> & child);

		/****************** SetPrecision ******************/
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "* Sets a precision for the Analysis of Locations (default by constructor is 1.E-05)
	:param prec:
	:type prec: float
	:rtype: None") SetPrecision;
		void SetPrecision (const Standard_Real prec);

		/****************** SetReference ******************/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "* Sets the 'Reference' information for <child> as being <parent> Sets an Error Status if already set (see method IsAmbiguous)
	:param parent:
	:type parent: IGESData_IGESEntity
	:param child:
	:type child: IGESData_IGESEntity
	:rtype: None") SetReference;
		void SetReference (const opencascade::handle<IGESData_IGESEntity> & parent,const opencascade::handle<IGESData_IGESEntity> & child);

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
		/****************** AddProtocol ******************/
		%feature("compactdefaultargs") AddProtocol;
		%feature("autodoc", "* Adds a couple (Module-Protocol) to the Library, given the class of a Protocol. Takes Resources into account. (if <aprotocol> is not of type TheProtocol, it is not added)
	:param aprotocol:
	:type aprotocol: Standard_Transient
	:rtype: None") AddProtocol;
		void AddProtocol (const opencascade::handle<Standard_Transient> & aprotocol);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the list of Modules of a library (can be used to redefine the order of Modules before action : Clear then refill the Library by calls to AddProtocol)
	:rtype: None") Clear;
		void Clear ();

		/****************** IGESData_WriterLib ******************/
		%feature("compactdefaultargs") IGESData_WriterLib;
		%feature("autodoc", "* Creates a Library which complies with a Protocol, that is : Same class (criterium IsInstance) This creation gets the Modules from the global set, those which are bound to the given Protocol and its Resources
	:param aprotocol:
	:type aprotocol: IGESData_Protocol
	:rtype: None") IGESData_WriterLib;
		 IGESData_WriterLib (const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****************** IGESData_WriterLib ******************/
		%feature("compactdefaultargs") IGESData_WriterLib;
		%feature("autodoc", "* Creates an empty Library : it will later by filled by method AddProtocol
	:rtype: None") IGESData_WriterLib;
		 IGESData_WriterLib ();

		/****************** Module ******************/
		%feature("compactdefaultargs") Module;
		%feature("autodoc", "* Returns the current Module in the Iteration
	:rtype: opencascade::handle<IGESData_ReadWriteModule>") Module;
		const opencascade::handle<IGESData_ReadWriteModule> & Module ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True if there are more Modules to iterate on
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Iterates by getting the next Module in the list If there is none, the exception will be raised by Value
	:rtype: None") Next;
		void Next ();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "* Returns the current Protocol in the Iteration
	:rtype: opencascade::handle<IGESData_Protocol>") Protocol;
		const opencascade::handle<IGESData_Protocol> & Protocol ();

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "* Selects a Module from the Library, given an Object. Returns True if Select has succeeded, False else. Also Returns (as arguments) the selected Module and the Case Number determined by the associated Protocol. If Select has failed, <module> is Null Handle and CN is zero. (Select can work on any criterium, such as Object DynamicType)
	:param obj:
	:type obj: IGESData_IGESEntity
	:param module:
	:type module: IGESData_ReadWriteModule
	:param CN:
	:type CN: int
	:rtype: bool") Select;
		Standard_Boolean Select (const opencascade::handle<IGESData_IGESEntity> & obj,opencascade::handle<IGESData_ReadWriteModule> & module,Standard_Integer &OutValue);

		/****************** SetComplete ******************/
		%feature("compactdefaultargs") SetComplete;
		%feature("autodoc", "* Sets a library to be defined with the complete Global list (all the couples Protocol/Modules recorded in it)
	:rtype: None") SetComplete;
		void SetComplete ();

		/****************** SetGlobal ******************/
		%feature("compactdefaultargs") SetGlobal;
		%feature("autodoc", "* Adds a couple (Module-Protocol) into the global definition set for this class of Library.
	:param amodule:
	:type amodule: IGESData_ReadWriteModule
	:param aprotocol:
	:type aprotocol: IGESData_Protocol
	:rtype: void") SetGlobal;
		static void SetGlobal (const opencascade::handle<IGESData_ReadWriteModule> & amodule,const opencascade::handle<IGESData_Protocol> & aprotocol);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "* Starts Iteration on the Modules (sets it on the first one)
	:rtype: None") Start;
		void Start ();

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
		/****************** DirChecker ******************/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "* Returns a DirChecker, specific for each type of Entity Here, Returns an empty DirChecker (no constraint to check)
	:param CN:
	:type CN: int
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: IGESData_DirChecker") DirChecker;
		IGESData_DirChecker DirChecker (const Standard_Integer CN,const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** IGESData_DefaultGeneral ******************/
		%feature("compactdefaultargs") IGESData_DefaultGeneral;
		%feature("autodoc", "* Creates a DefaultGeneral and puts it into GeneralLib, bound with a Protocol from IGESData
	:rtype: None") IGESData_DefaultGeneral;
		 IGESData_DefaultGeneral ();

		/****************** NewVoid ******************/
		%feature("compactdefaultargs") NewVoid;
		%feature("autodoc", "* Specific creation of a new void entity (UndefinedEntity only)
	:param CN:
	:type CN: int
	:param entto:
	:type entto: Standard_Transient
	:rtype: bool") NewVoid;
		Standard_Boolean NewVoid (const Standard_Integer CN,opencascade::handle<Standard_Transient> & entto);

		/****************** OwnCheckCase ******************/
		%feature("compactdefaultargs") OwnCheckCase;
		%feature("autodoc", "* Performs Specific Semantic Check for each type of Entity Here, does nothing (no constraint to check)
	:param CN:
	:type CN: int
	:param ent:
	:type ent: IGESData_IGESEntity
	:param shares:
	:type shares: Interface_ShareTool
	:param ach:
	:type ach: Interface_Check
	:rtype: None") OwnCheckCase;
		void OwnCheckCase (const Standard_Integer CN,const opencascade::handle<IGESData_IGESEntity> & ent,const Interface_ShareTool & shares,opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopyCase ******************/
		%feature("compactdefaultargs") OwnCopyCase;
		%feature("autodoc", "* Copies parameters which are specific of each Type of Entity
	:param CN:
	:type CN: int
	:param entfrom:
	:type entfrom: IGESData_IGESEntity
	:param entto:
	:type entto: IGESData_IGESEntity
	:param TC:
	:type TC: Interface_CopyTool
	:rtype: None") OwnCopyCase;
		void OwnCopyCase (const Standard_Integer CN,const opencascade::handle<IGESData_IGESEntity> & entfrom,const opencascade::handle<IGESData_IGESEntity> & entto,Interface_CopyTool & TC);

		/****************** OwnSharedCase ******************/
		%feature("compactdefaultargs") OwnSharedCase;
		%feature("autodoc", "* Lists the Entities shared by an IGESEntity, which must be an UndefinedEntity
	:param CN:
	:type CN: int
	:param ent:
	:type ent: IGESData_IGESEntity
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: None") OwnSharedCase;
		void OwnSharedCase (const Standard_Integer CN,const opencascade::handle<IGESData_IGESEntity> & ent,Interface_EntityIterator & iter);

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
		%feature("autodoc", "* Creates a DefaultSpecific and puts it into SpecificLib
	:rtype: None") IGESData_DefaultSpecific;
		 IGESData_DefaultSpecific ();

		/****************** OwnDump ******************/
		%feature("compactdefaultargs") OwnDump;
		%feature("autodoc", "* Specific Dump for UndefinedEntity : it concerns only own parameters, the general data (Directory Part, Lists) are taken into account by the IGESDumper
	:param CN:
	:type CN: int
	:param ent:
	:type ent: IGESData_IGESEntity
	:param dumper:
	:type dumper: IGESData_IGESDumper
	:param S:
	:type S: Message_Messenger
	:param own:
	:type own: int
	:rtype: None") OwnDump;
		void OwnDump (const Standard_Integer CN,const opencascade::handle<IGESData_IGESEntity> & ent,const IGESData_IGESDumper & dumper,const opencascade::handle<Message_Messenger> & S,const Standard_Integer own);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a resource
	:param protocol:
	:type protocol: IGESData_Protocol
	:rtype: None") Add;
		void Add (const opencascade::handle<IGESData_Protocol> & protocol);

		/****************** IGESData_FileProtocol ******************/
		%feature("compactdefaultargs") IGESData_FileProtocol;
		%feature("autodoc", "* Returns an empty FileProtocol
	:rtype: None") IGESData_FileProtocol;
		 IGESData_FileProtocol ();

		/****************** NbResources ******************/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "* Gives the count of Resources : the count of Added Protocols
	:rtype: int") NbResources;
		virtual Standard_Integer NbResources ();

		/****************** Resource ******************/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "* Returns a Resource, given a rank (rank of call to Add)
	:param num:
	:type num: int
	:rtype: opencascade::handle<Interface_Protocol>") Resource;
		virtual opencascade::handle<Interface_Protocol> Resource (const Standard_Integer num);

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
		%feature("autodoc", "* returns True if <level> is in the list
	:param level:
	:type level: int
	:rtype: bool") HasLevelNumber;
		Standard_Boolean HasLevelNumber (const Standard_Integer level);

		/****************** LevelNumber ******************/
		%feature("compactdefaultargs") LevelNumber;
		%feature("autodoc", "* returns the Level Number of <self>, indicated by <num> raises an exception if num is out of range
	:param num:
	:type num: int
	:rtype: int") LevelNumber;
		virtual Standard_Integer LevelNumber (const Standard_Integer num);

		/****************** NbLevelNumbers ******************/
		%feature("compactdefaultargs") NbLevelNumbers;
		%feature("autodoc", "* Must return the count of levels
	:rtype: int") NbLevelNumbers;
		virtual Standard_Integer NbLevelNumbers ();

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
		%feature("autodoc", "* Retyrns the alphanumeric value of the Name, to be defined
	:rtype: opencascade::handle<TCollection_HAsciiString>") Value;
		virtual opencascade::handle<TCollection_HAsciiString> Value ();

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
		%feature("autodoc", "* Returns a Child given its rank
	:param num:
	:type num: int
	:rtype: opencascade::handle<IGESData_IGESEntity>") Child;
		virtual opencascade::handle<IGESData_IGESEntity> Child (const Standard_Integer num);

		/****************** NbChildren ******************/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "* Returns the count of Entities designated as children
	:rtype: int") NbChildren;
		virtual Standard_Integer NbChildren ();

		/****************** SingleParent ******************/
		%feature("compactdefaultargs") SingleParent;
		%feature("autodoc", "* Returns the parent designated by the Entity, if only one !
	:rtype: opencascade::handle<IGESData_IGESEntity>") SingleParent;
		virtual opencascade::handle<IGESData_IGESEntity> SingleParent ();

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
		%feature("autodoc", "* gives value of the transformation, as a GTrsf To be defined by an effective class of Transformation Entity Warning : Must take in account Composition : if a TransfEntity has in its Directory Part, a Transf, this means that it is Compound, Value must return the global result
	:rtype: gp_GTrsf") Value;
		virtual gp_GTrsf Value ();

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
		/****************** ChangeableContent ******************/
		%feature("compactdefaultargs") ChangeableContent;
		%feature("autodoc", "* Returns own data as an UndefinedContent, in order to touch it
	:rtype: opencascade::handle<Interface_UndefinedContent>") ChangeableContent;
		opencascade::handle<Interface_UndefinedContent> ChangeableContent ();

		/****************** DefColor ******************/
		%feature("compactdefaultargs") DefColor;
		%feature("autodoc", "* returns Error status if necessary, else calls original method
	:rtype: IGESData_DefType") DefColor;
		virtual IGESData_DefType DefColor ();

		/****************** DefLevel ******************/
		%feature("compactdefaultargs") DefLevel;
		%feature("autodoc", "* returns Error status if necessary, else calls original method
	:rtype: IGESData_DefList") DefLevel;
		virtual IGESData_DefList DefLevel ();

		/****************** DefLineFont ******************/
		%feature("compactdefaultargs") DefLineFont;
		%feature("autodoc", "* returns Error status if necessary, else calls original method
	:rtype: IGESData_DefType") DefLineFont;
		virtual IGESData_DefType DefLineFont ();

		/****************** DefView ******************/
		%feature("compactdefaultargs") DefView;
		%feature("autodoc", "* returns Error status if necessary, else calls original method
	:rtype: IGESData_DefList") DefView;
		virtual IGESData_DefList DefView ();

		/****************** DirStatus ******************/
		%feature("compactdefaultargs") DirStatus;
		%feature("autodoc", "* returns Directory Error Status (used for Copy)
	:rtype: int") DirStatus;
		Standard_Integer DirStatus ();

		/****************** HasSubScriptNumber ******************/
		%feature("compactdefaultargs") HasSubScriptNumber;
		%feature("autodoc", "* returns Error status if necessary, else calls original method (that is, if SubScript field is not blank or positive integer)
	:rtype: bool") HasSubScriptNumber;
		virtual Standard_Boolean HasSubScriptNumber ();

		/****************** IGESData_UndefinedEntity ******************/
		%feature("compactdefaultargs") IGESData_UndefinedEntity;
		%feature("autodoc", "* creates an unknown entity
	:rtype: None") IGESData_UndefinedEntity;
		 IGESData_UndefinedEntity ();

		/****************** IsOKDirPart ******************/
		%feature("compactdefaultargs") IsOKDirPart;
		%feature("autodoc", "* says if DirPart is OK or not (if not, it is erroneous) Note that if it is not, Def* methods can return Error status
	:rtype: bool") IsOKDirPart;
		Standard_Boolean IsOKDirPart ();

		/****************** ReadDir ******************/
		%feature("compactdefaultargs") ReadDir;
		%feature("autodoc", "* Computes the Directory Error Status, to be called before standard ReadDir from IGESReaderTool Returns True if OK (hence, Directory can be loaded), Else returns False and the DirPart <DP> is modified (hence, Directory Error Status is non null; and standard Read will work with an acceptable DirectoryPart)
	:param IR:
	:type IR: IGESData_IGESReaderData
	:param DP:
	:type DP: IGESData_DirPart
	:param ach:
	:type ach: Interface_Check
	:rtype: bool") ReadDir;
		virtual Standard_Boolean ReadDir (const opencascade::handle<IGESData_IGESReaderData> & IR,IGESData_DirPart & DP,opencascade::handle<Interface_Check> & ach);

		/****************** ReadOwnParams ******************/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "* reads own parameters from file; PR gives access to them, IR detains parameter types and values Here, reads all parameters, integers are considered as entity reference unless they cannot be; no list interpretation No property or associativity list is managed
	:param IR:
	:type IR: IGESData_IGESReaderData
	:param PR:
	:type PR: IGESData_ParamReader
	:rtype: void") ReadOwnParams;
		virtual void ReadOwnParams (const opencascade::handle<IGESData_IGESReaderData> & IR,IGESData_ParamReader & PR);

		/****************** SetNewContent ******************/
		%feature("compactdefaultargs") SetNewContent;
		%feature("autodoc", "* Redefines a completely new UndefinedContent Used by a Copy which begins by ShallowCopy, for instance
	:param cont:
	:type cont: Interface_UndefinedContent
	:rtype: None") SetNewContent;
		void SetNewContent (const opencascade::handle<Interface_UndefinedContent> & cont);

		/****************** SetOKDirPart ******************/
		%feature("compactdefaultargs") SetOKDirPart;
		%feature("autodoc", "* Erases the Directory Error Status Warning : Be sure that data are consistent to call this method ...
	:rtype: None") SetOKDirPart;
		void SetOKDirPart ();

		/****************** UndefinedContent ******************/
		%feature("compactdefaultargs") UndefinedContent;
		%feature("autodoc", "* Returns own data as an UndefinedContent
	:rtype: opencascade::handle<Interface_UndefinedContent>") UndefinedContent;
		opencascade::handle<Interface_UndefinedContent> UndefinedContent ();

		/****************** WriteOwnParams ******************/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "* writes parameters to IGESWriter, taken from UndefinedContent
	:param IW:
	:type IW: IGESData_IGESWriter
	:rtype: void") WriteOwnParams;
		virtual void WriteOwnParams (IGESData_IGESWriter & IW);

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
		%feature("autodoc", "* says if 'me' is a Single View (True) or a List of Views (False)
	:rtype: bool") IsSingle;
		virtual Standard_Boolean IsSingle ();

		/****************** NbViews ******************/
		%feature("compactdefaultargs") NbViews;
		%feature("autodoc", "* Returns the count of Views for a List of Views. For a Single View, may return simply 1
	:rtype: int") NbViews;
		virtual Standard_Integer NbViews ();

		/****************** ViewItem ******************/
		%feature("compactdefaultargs") ViewItem;
		%feature("autodoc", "* Returns the View n0. <num> for a List of Views. For a Single Views, may return <self> itself
	:param num:
	:type num: int
	:rtype: opencascade::handle<IGESData_ViewKindEntity>") ViewItem;
		virtual opencascade::handle<IGESData_ViewKindEntity> ViewItem (const Standard_Integer num);

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
		/****************** AddEntities ******************/
		%feature("compactdefaultargs") AddEntities;
		%feature("autodoc", "* Adds a set of Entities, given as a HArray1OfIGESEntity Causes creation of : an Integer Parameter which gives count of Entities, then the list of Entities of the Array Error if an Entity is not an IGESEntity All these Entities will be interpreted as 'Positive Pointers' by IGESWriter
	:param ents:
	:type ents: IGESData_HArray1OfIGESEntity
	:rtype: None") AddEntities;
		void AddEntities (const opencascade::handle<IGESData_HArray1OfIGESEntity> & ents);

		/****************** AddEntity ******************/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "* Adds a Parameter which references an Entity. If the Entity is Null, the added parameter will define a 'Null Pointer' (0) If <negative> is given True, this will command Sending to File (see IGESWriter) to produce a 'Negative Pointer' (Default is False)
	:param ptype:
	:type ptype: Interface_ParamType
	:param ent:
	:type ent: IGESData_IGESEntity
	:param negative: default value is Standard_False
	:type negative: bool
	:rtype: None") AddEntity;
		void AddEntity (const Interface_ParamType ptype,const opencascade::handle<IGESData_IGESEntity> & ent,const Standard_Boolean negative = Standard_False);

		/****************** AddLiteral ******************/
		%feature("compactdefaultargs") AddLiteral;
		%feature("autodoc", "* Adds a literal Parameter to the list (as such)
	:param ptype:
	:type ptype: Interface_ParamType
	:param val:
	:type val: TCollection_HAsciiString
	:rtype: None") AddLiteral;
		void AddLiteral (const Interface_ParamType ptype,const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** AddLiteral ******************/
		%feature("compactdefaultargs") AddLiteral;
		%feature("autodoc", "* Adds a literal Parameter to the list (builds an HAsciiString)
	:param ptype:
	:type ptype: Interface_ParamType
	:param val:
	:type val: char *
	:rtype: None") AddLiteral;
		void AddLiteral (const Interface_ParamType ptype,const char * val);

		/****************** AddNegativePointers ******************/
		%feature("compactdefaultargs") AddNegativePointers;
		%feature("autodoc", "* Adds a list of Ranks of Parameters to be noted as Negative Pointers (this will be taken into account for Parameters which are Entities)
	:param list:
	:type list: TColStd_HSequenceOfInteger
	:rtype: None") AddNegativePointers;
		void AddNegativePointers (const opencascade::handle<TColStd_HSequenceOfInteger> & list);

		/****************** ClearNegativePointers ******************/
		%feature("compactdefaultargs") ClearNegativePointers;
		%feature("autodoc", "* Clears all informations about Negative Pointers, hence every Entity kind Parameter will be send normally, as Positive
	:rtype: None") ClearNegativePointers;
		void ClearNegativePointers ();

		/****************** IGESData_FreeFormatEntity ******************/
		%feature("compactdefaultargs") IGESData_FreeFormatEntity;
		%feature("autodoc", "* Creates a completely empty FreeFormatEntity
	:rtype: None") IGESData_FreeFormatEntity;
		 IGESData_FreeFormatEntity ();

		/****************** IsNegativePointer ******************/
		%feature("compactdefaultargs") IsNegativePointer;
		%feature("autodoc", "* Returns True if <num> is noted as for a 'Negative Pointer' (see AddEntity for details). Senseful only if IsParamEntity answers True for <num>, else returns False.
	:param num:
	:type num: int
	:rtype: bool") IsNegativePointer;
		Standard_Boolean IsNegativePointer (const Standard_Integer num);

		/****************** IsParamEntity ******************/
		%feature("compactdefaultargs") IsParamEntity;
		%feature("autodoc", "* Returns True if a Parameter is recorded as an entity Error if num is not between 1 and NbParams
	:param num:
	:type num: int
	:rtype: bool") IsParamEntity;
		Standard_Boolean IsParamEntity (const Standard_Integer num);

		/****************** NbParams ******************/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "* Gives count of recorded parameters
	:rtype: int") NbParams;
		Standard_Integer NbParams ();

		/****************** NegativePointers ******************/
		%feature("compactdefaultargs") NegativePointers;
		%feature("autodoc", "* Returns the complete list of Ramks of Parameters which have been noted as Negative Pointers Warning : It is returned as a Null Handle if none was noted
	:rtype: opencascade::handle<TColStd_HSequenceOfInteger>") NegativePointers;
		opencascade::handle<TColStd_HSequenceOfInteger> NegativePointers ();

		/****************** ParamData ******************/
		%feature("compactdefaultargs") ParamData;
		%feature("autodoc", "* Returns data of a Parameter : its type, and the entity if it designates en entity ('ent') or its literal value else ('str') Returned value (Boolean) : True if it is an Entity, False else
	:param num:
	:type num: int
	:param ptype:
	:type ptype: Interface_ParamType
	:param ent:
	:type ent: IGESData_IGESEntity
	:param val:
	:type val: TCollection_HAsciiString
	:rtype: bool") ParamData;
		Standard_Boolean ParamData (const Standard_Integer num,Interface_ParamType & ptype,opencascade::handle<IGESData_IGESEntity> & ent,opencascade::handle<TCollection_HAsciiString> & val);

		/****************** ParamEntity ******************/
		%feature("compactdefaultargs") ParamEntity;
		%feature("autodoc", "* Returns Entity corresponding to a Param, given its rank Error if out of range or if Param num does not designate an Entity
	:param num:
	:type num: int
	:rtype: opencascade::handle<IGESData_IGESEntity>") ParamEntity;
		opencascade::handle<IGESData_IGESEntity> ParamEntity (const Standard_Integer num);

		/****************** ParamType ******************/
		%feature("compactdefaultargs") ParamType;
		%feature("autodoc", "* Returns the ParamType of a Param, given its rank Error if num is not between 1 and NbParams
	:param num:
	:type num: int
	:rtype: Interface_ParamType") ParamType;
		Interface_ParamType ParamType (const Standard_Integer num);

		/****************** ParamValue ******************/
		%feature("compactdefaultargs") ParamValue;
		%feature("autodoc", "* Returns litteral value of a Parameter, given its rank Error if num is out of range, or if Parameter is not literal
	:param num:
	:type num: int
	:rtype: opencascade::handle<TCollection_HAsciiString>") ParamValue;
		opencascade::handle<TCollection_HAsciiString> ParamValue (const Standard_Integer num);

		/****************** SetFormNumber ******************/
		%feature("compactdefaultargs") SetFormNumber;
		%feature("autodoc", "* Sets Form Number to a new Value (to called after SetTypeNumber)
	:param formnum:
	:type formnum: int
	:rtype: None") SetFormNumber;
		void SetFormNumber (const Standard_Integer formnum);

		/****************** SetTypeNumber ******************/
		%feature("compactdefaultargs") SetTypeNumber;
		%feature("autodoc", "* Sets Type Number to a new Value, and Form Number to Zero
	:param typenum:
	:type typenum: int
	:rtype: None") SetTypeNumber;
		void SetTypeNumber (const Standard_Integer typenum);

		/****************** WriteOwnParams ******************/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "* WriteOwnParams is redefined for FreeFormatEntity to take into account the supplementary information 'Negative Pointer'
	:param IW:
	:type IW: IGESData_IGESWriter
	:rtype: void") WriteOwnParams;
		virtual void WriteOwnParams (IGESData_IGESWriter & IW);

};


%make_alias(IGESData_FreeFormatEntity)

%extend IGESData_FreeFormatEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class IGESData_HArray1OfIGESEntity : public  IGESData_Array1OfIGESEntity, public Standard_Transient {
  public:
    IGESData_HArray1OfIGESEntity(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESData_HArray1OfIGESEntity(const Standard_Integer theLower, const Standard_Integer theUpper, const  IGESData_Array1OfIGESEntity::value_type& theValue);
    IGESData_HArray1OfIGESEntity(const  IGESData_Array1OfIGESEntity& theOther);
    const  IGESData_Array1OfIGESEntity& Array1();
     IGESData_Array1OfIGESEntity& ChangeArray1();
};
%make_alias(IGESData_HArray1OfIGESEntity)


/* harray2 classes */
/* hsequence classes */
