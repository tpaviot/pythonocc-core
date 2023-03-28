/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
%define IGESSELECTDOCSTRING
"IGESSelect module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_igesselect.html"
%enddef
%module (package="OCC.Core", docstring=IGESSELECTDOCSTRING) IGESSelect


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


%{
#include<IGESSelect_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IGESData_module.hxx>
#include<Interface_module.hxx>
#include<IFSelect_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<MoniTool_module.hxx>
#include<Message_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IGESData.i
%import Interface.i
%import IFSelect.i
%import TColStd.i
%import TCollection.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(IGESSelect_Activator)
%wrap_handle(IGESSelect_CounterOfLevelNumber)
%wrap_handle(IGESSelect_DispPerDrawing)
%wrap_handle(IGESSelect_DispPerSingleView)
%wrap_handle(IGESSelect_Dumper)
%wrap_handle(IGESSelect_EditDirPart)
%wrap_handle(IGESSelect_EditHeader)
%wrap_handle(IGESSelect_FileModifier)
%wrap_handle(IGESSelect_IGESName)
%wrap_handle(IGESSelect_IGESTypeForm)
%wrap_handle(IGESSelect_ModelModifier)
%wrap_handle(IGESSelect_SelectBypassGroup)
%wrap_handle(IGESSelect_SelectBypassSubfigure)
%wrap_handle(IGESSelect_SelectDrawingFrom)
%wrap_handle(IGESSelect_SelectFaces)
%wrap_handle(IGESSelect_SelectFromDrawing)
%wrap_handle(IGESSelect_SelectFromSingleView)
%wrap_handle(IGESSelect_SelectLevelNumber)
%wrap_handle(IGESSelect_SelectName)
%wrap_handle(IGESSelect_SelectPCurves)
%wrap_handle(IGESSelect_SelectSingleViewFrom)
%wrap_handle(IGESSelect_SelectSubordinate)
%wrap_handle(IGESSelect_SelectVisibleStatus)
%wrap_handle(IGESSelect_SignColor)
%wrap_handle(IGESSelect_SignLevelNumber)
%wrap_handle(IGESSelect_SignStatus)
%wrap_handle(IGESSelect_SplineToBSpline)
%wrap_handle(IGESSelect_ViewSorter)
%wrap_handle(IGESSelect_WorkLibrary)
%wrap_handle(IGESSelect_AddFileComment)
%wrap_handle(IGESSelect_AddGroup)
%wrap_handle(IGESSelect_AutoCorrect)
%wrap_handle(IGESSelect_ChangeLevelList)
%wrap_handle(IGESSelect_ChangeLevelNumber)
%wrap_handle(IGESSelect_ComputeStatus)
%wrap_handle(IGESSelect_FloatFormat)
%wrap_handle(IGESSelect_RebuildDrawings)
%wrap_handle(IGESSelect_RebuildGroups)
%wrap_handle(IGESSelect_RemoveCurves)
%wrap_handle(IGESSelect_SetGlobalParameter)
%wrap_handle(IGESSelect_SetLabel)
%wrap_handle(IGESSelect_SetVersion5)
%wrap_handle(IGESSelect_UpdateCreationDate)
%wrap_handle(IGESSelect_UpdateFileName)
%wrap_handle(IGESSelect_UpdateLastChange)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*******************
* class IGESSelect *
*******************/
%rename(igesselect) IGESSelect;
class IGESSelect {
	public:
		/****************** Run ******************/
		/**** md5 signature: 6297dd805022290cd2324401700e3f52 ****/
		%feature("compactdefaultargs") Run;
		%feature("autodoc", "Simply gives a prompt for a conversational action on standard input/output. returns the status of a.

Returns
-------
void
") Run;
		static void Run();

		/****************** WhatIges ******************/
		/**** md5 signature: b733dc681cd6ab9b90499eec5c2bf0e6 ****/
		%feature("compactdefaultargs") WhatIges;
		%feature("autodoc", "Gives a quick analysis of an iges entity in the context of a model (i.e. a file) described by a graph. returned values are : <sup> : the most meaningful super entity, if any (else null) <index> : meaningful index relating to super entity, if any <returned> : a status which helps exploitation of <sup>, by giving a case (normally, types of <ent> and <sup> should suffice to known the case).

Parameters
----------
ent: IGESData_IGESEntity
G: Interface_Graph
sup: IGESData_IGESEntity

Returns
-------
index: int
") WhatIges;
		static Standard_Integer WhatIges(const opencascade::handle<IGESData_IGESEntity> & ent, const Interface_Graph & G, opencascade::handle<IGESData_IGESEntity> & sup, Standard_Integer &OutValue);

};


%extend IGESSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESSelect_Activator *
*****************************/
class IGESSelect_Activator : public IFSelect_Activator {
	public:
		/****************** IGESSelect_Activator ******************/
		/**** md5 signature: d65dea40d3c52d5c9dcb51515e0ce3e6 ****/
		%feature("compactdefaultargs") IGESSelect_Activator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSelect_Activator;
		 IGESSelect_Activator();

		/****************** Do ******************/
		/**** md5 signature: 84f46bc11d2d5e9591ed76f3c0abda9a ****/
		%feature("compactdefaultargs") Do;
		%feature("autodoc", "Executes a command line for igesselect.

Parameters
----------
number: int
pilot: IFSelect_SessionPilot

Returns
-------
IFSelect_ReturnStatus
") Do;
		IFSelect_ReturnStatus Do(const Standard_Integer number, const opencascade::handle<IFSelect_SessionPilot> & pilot);

		/****************** Help ******************/
		/**** md5 signature: f58ae97ad0af39f2393512a71352549e ****/
		%feature("compactdefaultargs") Help;
		%feature("autodoc", "Sends a short help message for igesselect commands.

Parameters
----------
number: int

Returns
-------
str
") Help;
		Standard_CString Help(const Standard_Integer number);

};


%make_alias(IGESSelect_Activator)

%extend IGESSelect_Activator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESSelect_CounterOfLevelNumber *
****************************************/
class IGESSelect_CounterOfLevelNumber : public IFSelect_SignCounter {
	public:
		/****************** IGESSelect_CounterOfLevelNumber ******************/
		/**** md5 signature: 9370559aa8e73398d7e091d4ef615412 ****/
		%feature("compactdefaultargs") IGESSelect_CounterOfLevelNumber;
		%feature("autodoc", "Creates a counteroflevelnumber, clear, ready to work <withmap> and <withlist> are transmitted to signcounter.

Parameters
----------
withmap: bool,optional
	default value is Standard_True
withlist: bool,optional
	default value is Standard_False

Returns
-------
None
") IGESSelect_CounterOfLevelNumber;
		 IGESSelect_CounterOfLevelNumber(const Standard_Boolean withmap = Standard_True, const Standard_Boolean withlist = Standard_False);

		/****************** AddLevel ******************/
		/**** md5 signature: ffe64b577c81c36bf8ff50a846c094f0 ****/
		%feature("compactdefaultargs") AddLevel;
		%feature("autodoc", "The internal action to record a new level number, positive, null (no level) or negative (level list).

Parameters
----------
ent: Standard_Transient
level: int

Returns
-------
None
") AddLevel;
		void AddLevel(const opencascade::handle<Standard_Transient> & ent, const Standard_Integer level);

		/****************** AddSign ******************/
		/**** md5 signature: 7707744cc4bcc200426a1aa57611f684 ****/
		%feature("compactdefaultargs") AddSign;
		%feature("autodoc", "Adds an entity by considering its lrvrl number(s) a level is added both in numeric and alphanumeric form, i.e. levellist gives 'level list', others (no level or positive level) displays level number on 7 digits (c : %7d) remark : an entity attached to a level list is added for ' level list', and for each of its constituent levels.

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
None
") AddSign;
		virtual void AddSign(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Clear ******************/
		/**** md5 signature: f671931d03948860d0ead34afbe920aa ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Resets already memorized information : also numeric data.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** HighestLevel ******************/
		/**** md5 signature: 6e91dd7e21a1a113c8f1d29029031874 ****/
		%feature("compactdefaultargs") HighestLevel;
		%feature("autodoc", "Returns the highest value found for a level number.

Returns
-------
int
") HighestLevel;
		Standard_Integer HighestLevel();

		/****************** Levels ******************/
		/**** md5 signature: a288f91fd4585278e66aefe1bd2c29a8 ****/
		%feature("compactdefaultargs") Levels;
		%feature("autodoc", "Returns the ordered list of used positive level numbers.

Returns
-------
opencascade::handle<TColStd_HSequenceOfInteger>
") Levels;
		opencascade::handle<TColStd_HSequenceOfInteger> Levels();

		/****************** NbTimesLevel ******************/
		/**** md5 signature: edb285d1b8ee38ecb0a8a0bcc320ec16 ****/
		%feature("compactdefaultargs") NbTimesLevel;
		%feature("autodoc", "Returns the number of times a level is used, 0 if it has not been recorded at all <level> = 0 counts entities attached to no level <level> < 0 counts entities attached to a levellist.

Parameters
----------
level: int

Returns
-------
int
") NbTimesLevel;
		Standard_Integer NbTimesLevel(const Standard_Integer level);


        %feature("autodoc", "1");
        %extend{
            std::string PrintCountToString() {
            std::stringstream s;
            self->PrintCount(s);
            return s.str();}
        };
		/****************** Sign ******************/
		/**** md5 signature: 7499cc4a7f975add1f03d71207d7f2d5 ****/
		%feature("compactdefaultargs") Sign;
		%feature("autodoc", "Determines and returns the value of the signature for an entity as an hasciistring. redefined, gives the same result as addsign, see this method ('level list' or 'nnnnnnn').

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Sign;
		virtual opencascade::handle<TCollection_HAsciiString> Sign(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IGESSelect_CounterOfLevelNumber)

%extend IGESSelect_CounterOfLevelNumber {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESSelect_DispPerDrawing *
**********************************/
class IGESSelect_DispPerDrawing : public IFSelect_Dispatch {
	public:
		/****************** IGESSelect_DispPerDrawing ******************/
		/**** md5 signature: a2fe65baedf004f71a083d67d5c0e2ab ****/
		%feature("compactdefaultargs") IGESSelect_DispPerDrawing;
		%feature("autodoc", "Creates a dispperdrawing.

Returns
-------
None
") IGESSelect_DispPerDrawing;
		 IGESSelect_DispPerDrawing();

		/****************** CanHaveRemainder ******************/
		/**** md5 signature: bbdaf12e13f50825d693e72a5d08ae2c ****/
		%feature("compactdefaultargs") CanHaveRemainder;
		%feature("autodoc", "Returns true, because of entities attached to no view.

Returns
-------
bool
") CanHaveRemainder;
		virtual Standard_Boolean CanHaveRemainder();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns as label, 'one file per drawing'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Packets ******************/
		/**** md5 signature: 926a75218f16786de747dd6ee34bde90 ****/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "Computes the list of produced packets. packets are computed by a viewsorter (sortdrawings with also frames).

Parameters
----------
G: Interface_Graph
packs: IFGraph_SubPartsIterator

Returns
-------
None
") Packets;
		void Packets(const Interface_Graph & G, IFGraph_SubPartsIterator & packs);

		/****************** Remainder ******************/
		/**** md5 signature: bfe26226d33a24ff1a79791fff349c03 ****/
		%feature("compactdefaultargs") Remainder;
		%feature("autodoc", "Returns remainder which is a set of entities. it is supposed to be called once packets has been called.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") Remainder;
		virtual Interface_EntityIterator Remainder(const Interface_Graph & G);

};


%make_alias(IGESSelect_DispPerDrawing)

%extend IGESSelect_DispPerDrawing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESSelect_DispPerSingleView *
*************************************/
class IGESSelect_DispPerSingleView : public IFSelect_Dispatch {
	public:
		/****************** IGESSelect_DispPerSingleView ******************/
		/**** md5 signature: f9f9ecf4fd178c3bdad174518df20ea7 ****/
		%feature("compactdefaultargs") IGESSelect_DispPerSingleView;
		%feature("autodoc", "Creates a disppersingleview.

Returns
-------
None
") IGESSelect_DispPerSingleView;
		 IGESSelect_DispPerSingleView();

		/****************** CanHaveRemainder ******************/
		/**** md5 signature: bbdaf12e13f50825d693e72a5d08ae2c ****/
		%feature("compactdefaultargs") CanHaveRemainder;
		%feature("autodoc", "Returns true, because of entities attached to no view.

Returns
-------
bool
") CanHaveRemainder;
		virtual Standard_Boolean CanHaveRemainder();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns as label, 'one file per single view or drawing frame'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Packets ******************/
		/**** md5 signature: 926a75218f16786de747dd6ee34bde90 ****/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "Computes the list of produced packets. packets are computed by a viewsorter (sortsingleviews with also frames).

Parameters
----------
G: Interface_Graph
packs: IFGraph_SubPartsIterator

Returns
-------
None
") Packets;
		void Packets(const Interface_Graph & G, IFGraph_SubPartsIterator & packs);

		/****************** Remainder ******************/
		/**** md5 signature: bfe26226d33a24ff1a79791fff349c03 ****/
		%feature("compactdefaultargs") Remainder;
		%feature("autodoc", "Returns remainder which is a set of entities. it is supposed to be called once packets has been called.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") Remainder;
		virtual Interface_EntityIterator Remainder(const Interface_Graph & G);

};


%make_alias(IGESSelect_DispPerSingleView)

%extend IGESSelect_DispPerSingleView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IGESSelect_Dumper *
**************************/
class IGESSelect_Dumper : public IFSelect_SessionDumper {
	public:
		/****************** IGESSelect_Dumper ******************/
		/**** md5 signature: 6a85f0e6e89b2d497e3d6e86aaaedef3 ****/
		%feature("compactdefaultargs") IGESSelect_Dumper;
		%feature("autodoc", "Creates a dumper and puts it into the library of dumper.

Returns
-------
None
") IGESSelect_Dumper;
		 IGESSelect_Dumper();

		/****************** ReadOwn ******************/
		/**** md5 signature: 537cf3342fb63eef348b1c1130ae0574 ****/
		%feature("compactdefaultargs") ReadOwn;
		%feature("autodoc", "Recognizes and read own parameters for types of package igesselect. returns true if done and <item> created, false else.

Parameters
----------
file: IFSelect_SessionFile
type: str
item: Standard_Transient

Returns
-------
bool
") ReadOwn;
		Standard_Boolean ReadOwn(IFSelect_SessionFile & file, TCollection_AsciiString type, opencascade::handle<Standard_Transient> & item);

		/****************** WriteOwn ******************/
		/**** md5 signature: d3ac6824a29798b0b3016080139d7006 ****/
		%feature("compactdefaultargs") WriteOwn;
		%feature("autodoc", "Write the own parameters of types defined in package igesselect returns true if <item> has been processed, false else.

Parameters
----------
file: IFSelect_SessionFile
item: Standard_Transient

Returns
-------
bool
") WriteOwn;
		Standard_Boolean WriteOwn(IFSelect_SessionFile & file, const opencascade::handle<Standard_Transient> & item);

};


%make_alias(IGESSelect_Dumper)

%extend IGESSelect_Dumper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESSelect_EditDirPart *
*******************************/
class IGESSelect_EditDirPart : public IFSelect_Editor {
	public:
		/****************** IGESSelect_EditDirPart ******************/
		/**** md5 signature: ff0a9a36a43a191401e2b7df3dfcf914 ****/
		%feature("compactdefaultargs") IGESSelect_EditDirPart;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSelect_EditDirPart;
		 IGESSelect_EditDirPart();

		/****************** Apply ******************/
		/**** md5 signature: 7128480b7f4b1ff6fd959731640e27fc ****/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Apply;
		Standard_Boolean Apply(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Load ******************/
		/**** md5 signature: fbb84192d1ec7737c4c84905239a2df8 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Load;
		Standard_Boolean Load(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Recognize ******************/
		/**** md5 signature: 745b42e0c753cb6baed4d66bbf94e5b8 ****/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm

Returns
-------
bool
") Recognize;
		Standard_Boolean Recognize(const opencascade::handle<IFSelect_EditForm> & form);

		/****************** StringValue ******************/
		/**** md5 signature: 4371620dd4c31b906a08f6f8ee98f04a ****/
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") StringValue;
		opencascade::handle<TCollection_HAsciiString> StringValue(const opencascade::handle<IFSelect_EditForm> & form, const Standard_Integer num);

		/****************** Update ******************/
		/**** md5 signature: be1a8884485dd9aa85278e47d1eec194 ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
num: int
newval: TCollection_HAsciiString
enforce: bool

Returns
-------
bool
") Update;
		virtual Standard_Boolean Update(const opencascade::handle<IFSelect_EditForm> & form, const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & newval, const Standard_Boolean enforce);

};


%make_alias(IGESSelect_EditDirPart)

%extend IGESSelect_EditDirPart {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESSelect_EditHeader *
******************************/
class IGESSelect_EditHeader : public IFSelect_Editor {
	public:
		/****************** IGESSelect_EditHeader ******************/
		/**** md5 signature: 65ad3ca8e01e2188e996da146f3abb35 ****/
		%feature("compactdefaultargs") IGESSelect_EditHeader;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSelect_EditHeader;
		 IGESSelect_EditHeader();

		/****************** Apply ******************/
		/**** md5 signature: 7128480b7f4b1ff6fd959731640e27fc ****/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Apply;
		Standard_Boolean Apply(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Load ******************/
		/**** md5 signature: fbb84192d1ec7737c4c84905239a2df8 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Load;
		Standard_Boolean Load(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Recognize ******************/
		/**** md5 signature: 745b42e0c753cb6baed4d66bbf94e5b8 ****/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm

Returns
-------
bool
") Recognize;
		Standard_Boolean Recognize(const opencascade::handle<IFSelect_EditForm> & form);

		/****************** StringValue ******************/
		/**** md5 signature: 4371620dd4c31b906a08f6f8ee98f04a ****/
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") StringValue;
		opencascade::handle<TCollection_HAsciiString> StringValue(const opencascade::handle<IFSelect_EditForm> & form, const Standard_Integer num);

		/****************** Update ******************/
		/**** md5 signature: be1a8884485dd9aa85278e47d1eec194 ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
num: int
newval: TCollection_HAsciiString
enforce: bool

Returns
-------
bool
") Update;
		virtual Standard_Boolean Update(const opencascade::handle<IFSelect_EditForm> & form, const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & newval, const Standard_Boolean enforce);

};


%make_alias(IGESSelect_EditHeader)

%extend IGESSelect_EditHeader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESSelect_FileModifier *
********************************/
%nodefaultctor IGESSelect_FileModifier;
class IGESSelect_FileModifier : public IFSelect_GeneralModifier {
	public:
		/****************** Perform ******************/
		/**** md5 signature: be439faed281fbb80e52ca4b38c9d459 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Perform the action specific to each class of file modifier <ctx> is the contextwrite, which brings : the model, the protocol, the file name, plus the object appliedmodifiers (not used here) and the checklist remark that the model has to be casted for specific access //! <writer> is the writer and is specific to each norm, on which to act.

Parameters
----------
ctx: IFSelect_ContextWrite
writer: IGESData_IGESWriter

Returns
-------
None
") Perform;
		virtual void Perform(IFSelect_ContextWrite & ctx, IGESData_IGESWriter & writer);

};


%make_alias(IGESSelect_FileModifier)

%extend IGESSelect_FileModifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESSelect_IGESName *
****************************/
class IGESSelect_IGESName : public IFSelect_Signature {
	public:
		/****************** IGESSelect_IGESName ******************/
		/**** md5 signature: 524dd81610ed05d2f2659fd4ec83b9a7 ****/
		%feature("compactdefaultargs") IGESSelect_IGESName;
		%feature("autodoc", "Creates a signature for iges name (reduced to shortlabel, without subscriptlabel or long name).

Returns
-------
None
") IGESSelect_IGESName;
		 IGESSelect_IGESName();

		/****************** Value ******************/
		/**** md5 signature: 4e85ac861c77ba955d20c48cb38639f7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the shortlabel as being the name of an igesentity if <ent> has no name, it returns empty string ''.

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
str
") Value;
		Standard_CString Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IGESSelect_IGESName)

%extend IGESSelect_IGESName {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESSelect_IGESTypeForm *
********************************/
class IGESSelect_IGESTypeForm : public IFSelect_Signature {
	public:
		/****************** IGESSelect_IGESTypeForm ******************/
		/**** md5 signature: 5183a9eb29f80a0de44b4051f6d05d95 ****/
		%feature("compactdefaultargs") IGESSelect_IGESTypeForm;
		%feature("autodoc", "Creates a signature for iges type & form numbers if <withform> is false, for iges type number only.

Parameters
----------
withform: bool,optional
	default value is Standard_True

Returns
-------
None
") IGESSelect_IGESTypeForm;
		 IGESSelect_IGESTypeForm(const Standard_Boolean withform = Standard_True);

		/****************** SetForm ******************/
		/**** md5 signature: 589abff65d714af1a8ac642d2cde3ddb ****/
		%feature("compactdefaultargs") SetForm;
		%feature("autodoc", "Changes the mode for giving the form number.

Parameters
----------
withform: bool

Returns
-------
None
") SetForm;
		void SetForm(const Standard_Boolean withform);

		/****************** Value ******************/
		/**** md5 signature: 4e85ac861c77ba955d20c48cb38639f7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the signature for iges, 'mmm nnn' or 'mmm' according creation choice (type & form or type only).

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
str
") Value;
		Standard_CString Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IGESSelect_IGESTypeForm)

%extend IGESSelect_IGESTypeForm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESSelect_ModelModifier *
*********************************/
%nodefaultctor IGESSelect_ModelModifier;
class IGESSelect_ModelModifier : public IFSelect_Modifier {
	public:
		/****************** Perform ******************/
		/**** md5 signature: 4c70286fda376ec2d1b40913ebcbb75a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The inherited perform does the required cast (and refuses to go further if cast has failed) then calls the instantiated performing.

Parameters
----------
ctx: IFSelect_ContextModif
target: Interface_InterfaceModel
protocol: Interface_Protocol
TC: Interface_CopyTool

Returns
-------
None
") Perform;
		void Perform(IFSelect_ContextModif & ctx, const opencascade::handle<Interface_InterfaceModel> & target, const opencascade::handle<Interface_Protocol> & protocol, Interface_CopyTool & TC);

		/****************** PerformProtocol ******************/
		/**** md5 signature: 2f27fb8691485f2c9c335a95521f83a1 ****/
		%feature("compactdefaultargs") PerformProtocol;
		%feature("autodoc", "Specific perform with protocol. it is defined to let the protocol unused and to call performing without protocol (most current case). it can be redefined if specific action requires protocol.

Parameters
----------
ctx: IFSelect_ContextModif
target: IGESData_IGESModel
proto: IGESData_Protocol
TC: Interface_CopyTool

Returns
-------
None
") PerformProtocol;
		virtual void PerformProtocol(IFSelect_ContextModif & ctx, const opencascade::handle<IGESData_IGESModel> & target, const opencascade::handle<IGESData_Protocol> & proto, Interface_CopyTool & TC);

		/****************** Performing ******************/
		/**** md5 signature: ba365383d25a5f1e600eb91703f9b9d4 ****/
		%feature("compactdefaultargs") Performing;
		%feature("autodoc", "Specific perform, without protocol. if performing with protocol is redefined, performing without protocol must though be defined to do nothing (not called, but demanded by the linker).

Parameters
----------
ctx: IFSelect_ContextModif
target: IGESData_IGESModel
TC: Interface_CopyTool

Returns
-------
None
") Performing;
		virtual void Performing(IFSelect_ContextModif & ctx, const opencascade::handle<IGESData_IGESModel> & target, Interface_CopyTool & TC);

};


%make_alias(IGESSelect_ModelModifier)

%extend IGESSelect_ModelModifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESSelect_SelectBasicGeom *
***********************************/
/*************************************
* class IGESSelect_SelectBypassGroup *
*************************************/
class IGESSelect_SelectBypassGroup : public IFSelect_SelectExplore {
	public:
		/****************** IGESSelect_SelectBypassGroup ******************/
		/**** md5 signature: e99a6b3c37dfb0531b908cd90f32d859 ****/
		%feature("compactdefaultargs") IGESSelect_SelectBypassGroup;
		%feature("autodoc", "Creates a selectbypassgroup, by default all level (level = 1 explores at first level).

Parameters
----------
level: int,optional
	default value is 0

Returns
-------
None
") IGESSelect_SelectBypassGroup;
		 IGESSelect_SelectBypassGroup(const Standard_Integer level = 0);

		/****************** Explore ******************/
		/**** md5 signature: 50c4444632fd853033919d1a382f1178 ****/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "Explores an entity : for a group, gives its elements else, takes the entity itself.

Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Returns
-------
bool
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		/**** md5 signature: 6716492c1a431b7aec766a1b00353622 ****/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Returns a text defining the criterium : 'content of group'.

Returns
-------
TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

};


%make_alias(IGESSelect_SelectBypassGroup)

%extend IGESSelect_SelectBypassGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class IGESSelect_SelectBypassSubfigure *
*****************************************/
class IGESSelect_SelectBypassSubfigure : public IFSelect_SelectExplore {
	public:
		/****************** IGESSelect_SelectBypassSubfigure ******************/
		/**** md5 signature: 777e5b9222508b520558cdfa85875f03 ****/
		%feature("compactdefaultargs") IGESSelect_SelectBypassSubfigure;
		%feature("autodoc", "Creates a selectbypasssubfigure, by default all level (level = 1 explores at first level).

Parameters
----------
level: int,optional
	default value is 0

Returns
-------
None
") IGESSelect_SelectBypassSubfigure;
		 IGESSelect_SelectBypassSubfigure(const Standard_Integer level = 0);

		/****************** Explore ******************/
		/**** md5 signature: 50c4444632fd853033919d1a382f1178 ****/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "Explores an entity : for a subfigure, gives its elements else, takes the entity itself.

Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Returns
-------
bool
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		/**** md5 signature: 6716492c1a431b7aec766a1b00353622 ****/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Returns a text defining the criterium : 'content of subfigure'.

Returns
-------
TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

};


%make_alias(IGESSelect_SelectBypassSubfigure)

%extend IGESSelect_SelectBypassSubfigure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESSelect_SelectDrawingFrom *
*************************************/
class IGESSelect_SelectDrawingFrom : public IFSelect_SelectDeduct {
	public:
		/****************** IGESSelect_SelectDrawingFrom ******************/
		/**** md5 signature: ff53a6e59135d0d2ae75a0d7907c9a13 ****/
		%feature("compactdefaultargs") IGESSelect_SelectDrawingFrom;
		%feature("autodoc", "Creates a selectdrawingfrom.

Returns
-------
None
") IGESSelect_SelectDrawingFrom;
		 IGESSelect_SelectDrawingFrom();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label, with is 'drawings attached'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** RootResult ******************/
		/**** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ****/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Selects the drawings attached (through single views in directory part) to input entities.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

};


%make_alias(IGESSelect_SelectDrawingFrom)

%extend IGESSelect_SelectDrawingFrom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESSelect_SelectFaces *
*******************************/
class IGESSelect_SelectFaces : public IFSelect_SelectExplore {
	public:
		/****************** IGESSelect_SelectFaces ******************/
		/**** md5 signature: 583ff395fa30c1f4ca5b4ce4bffbab9b ****/
		%feature("compactdefaultargs") IGESSelect_SelectFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSelect_SelectFaces;
		 IGESSelect_SelectFaces();

		/****************** Explore ******************/
		/**** md5 signature: 50c4444632fd853033919d1a382f1178 ****/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "Explores an entity, to take its faces works recursively.

Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Returns
-------
bool
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		/**** md5 signature: 6716492c1a431b7aec766a1b00353622 ****/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Returns a text defining the criterium : 'faces'.

Returns
-------
TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

};


%make_alias(IGESSelect_SelectFaces)

%extend IGESSelect_SelectFaces {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESSelect_SelectFromDrawing *
*************************************/
class IGESSelect_SelectFromDrawing : public IFSelect_SelectDeduct {
	public:
		/****************** IGESSelect_SelectFromDrawing ******************/
		/**** md5 signature: 65e0692162f89b440abbd393ad056a30 ****/
		%feature("compactdefaultargs") IGESSelect_SelectFromDrawing;
		%feature("autodoc", "Creates a selectfromdrawing.

Returns
-------
None
") IGESSelect_SelectFromDrawing;
		 IGESSelect_SelectFromDrawing();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label, with is 'entities attached to drawing'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** RootResult ******************/
		/**** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ****/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Selects the entities which are attached to the drawing(s) present in the input.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

};


%make_alias(IGESSelect_SelectFromDrawing)

%extend IGESSelect_SelectFromDrawing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESSelect_SelectFromSingleView *
****************************************/
class IGESSelect_SelectFromSingleView : public IFSelect_SelectDeduct {
	public:
		/****************** IGESSelect_SelectFromSingleView ******************/
		/**** md5 signature: a873f337fe0a13fdb7f819a1aadb275a ****/
		%feature("compactdefaultargs") IGESSelect_SelectFromSingleView;
		%feature("autodoc", "Creates a selectfromsingleview.

Returns
-------
None
") IGESSelect_SelectFromSingleView;
		 IGESSelect_SelectFromSingleView();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label, with is 'entities attached to single view'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** RootResult ******************/
		/**** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ****/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Selects the entities which are attached to the single view(s) present in the input.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

};


%make_alias(IGESSelect_SelectFromSingleView)

%extend IGESSelect_SelectFromSingleView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESSelect_SelectLevelNumber *
*************************************/
class IGESSelect_SelectLevelNumber : public IFSelect_SelectExtract {
	public:
		/****************** IGESSelect_SelectLevelNumber ******************/
		/**** md5 signature: bb615992120ad81d7d6a52eff9cb9390 ****/
		%feature("compactdefaultargs") IGESSelect_SelectLevelNumber;
		%feature("autodoc", "Creates a selectlevelnumber, with no level criterium : see setlevelnumber. empty, this selection filters nothing.

Returns
-------
None
") IGESSelect_SelectLevelNumber;
		 IGESSelect_SelectLevelNumber();

		/****************** ExtractLabel ******************/
		/**** md5 signature: 04da44ccc1aaa5db6b559360d74d3853 ****/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns the selection criterium : 'iges entity, level number admits <nn>' (if nn > 0) or 'iges entity attached to no level' (if nn = 0).

Returns
-------
TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****************** LevelNumber ******************/
		/**** md5 signature: f9a977303e37072b433d9eb0d870ca3e ****/
		%feature("compactdefaultargs") LevelNumber;
		%feature("autodoc", "Returns the level criterium. nullhandle if not yet set (interpreted as level = 0 : no level number attached).

Returns
-------
opencascade::handle<IFSelect_IntParam>
") LevelNumber;
		opencascade::handle<IFSelect_IntParam> LevelNumber();

		/****************** SetLevelNumber ******************/
		/**** md5 signature: 773f7607f78b5e03995c83b2e61537cb ****/
		%feature("compactdefaultargs") SetLevelNumber;
		%feature("autodoc", "Sets a parameter as level criterium.

Parameters
----------
levnum: IFSelect_IntParam

Returns
-------
None
") SetLevelNumber;
		void SetLevelNumber(const opencascade::handle<IFSelect_IntParam> & levnum);

		/****************** Sort ******************/
		/**** md5 signature: 88b4690c932193f08237f487d1cf387b ****/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "Returns true if <ent> is an iges entity with level number admits the criterium (= value if single level, or one of the attached level numbers = value if level list).

Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IGESSelect_SelectLevelNumber)

%extend IGESSelect_SelectLevelNumber {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESSelect_SelectName *
******************************/
class IGESSelect_SelectName : public IFSelect_SelectExtract {
	public:
		/****************** IGESSelect_SelectName ******************/
		/**** md5 signature: 3790b1376aeedef7160c216982184bad ****/
		%feature("compactdefaultargs") IGESSelect_SelectName;
		%feature("autodoc", "Creates an empty selectname : every entity is considered good (no filter active).

Returns
-------
None
") IGESSelect_SelectName;
		 IGESSelect_SelectName();

		/****************** ExtractLabel ******************/
		/**** md5 signature: 04da44ccc1aaa5db6b559360d74d3853 ****/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns the selection criterium : 'iges entity, name : <name>'.

Returns
-------
TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name used as filter.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Sets a name as a criterium : iges entities which have this name are kept (without regular expression, there should be at most one). <name> can be regarded as a text parameter.

Parameters
----------
name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** Sort ******************/
		/**** md5 signature: 88b4690c932193f08237f487d1cf387b ****/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "Returns true if name of entity complies with name filter.

Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IGESSelect_SelectName)

%extend IGESSelect_SelectName {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESSelect_SelectPCurves *
*********************************/
class IGESSelect_SelectPCurves : public IFSelect_SelectExplore {
	public:
		/****************** IGESSelect_SelectPCurves ******************/
		/**** md5 signature: 2f11303d9cfd26f3b6ba347323233cb1 ****/
		%feature("compactdefaultargs") IGESSelect_SelectPCurves;
		%feature("autodoc", "Creates a selectpcurves basic true : lists all the components of pcurves basic false : lists the uppest level definitions (i.e. stops at compositecurve).

Parameters
----------
basic: bool

Returns
-------
None
") IGESSelect_SelectPCurves;
		 IGESSelect_SelectPCurves(const Standard_Boolean basic);

		/****************** Explore ******************/
		/**** md5 signature: 50c4444632fd853033919d1a382f1178 ****/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "Explores an entity, to take its contained pcurves an independent curve is ignored : only faces are explored.

Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Returns
-------
bool
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		/**** md5 signature: 6716492c1a431b7aec766a1b00353622 ****/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Returns a text defining the criterium : 'basic pcurves' or 'global pcurves'.

Returns
-------
TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

};


%make_alias(IGESSelect_SelectPCurves)

%extend IGESSelect_SelectPCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESSelect_SelectSingleViewFrom *
****************************************/
class IGESSelect_SelectSingleViewFrom : public IFSelect_SelectDeduct {
	public:
		/****************** IGESSelect_SelectSingleViewFrom ******************/
		/**** md5 signature: e98d29f11203fe9ccfb5f5b26dcceced ****/
		%feature("compactdefaultargs") IGESSelect_SelectSingleViewFrom;
		%feature("autodoc", "Creates a selectsingleviewfrom.

Returns
-------
None
") IGESSelect_SelectSingleViewFrom;
		 IGESSelect_SelectSingleViewFrom();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label, with is 'single views attached'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** RootResult ******************/
		/**** md5 signature: 94d3d2ba84f70a954fe8975e2590bfd2 ****/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Selects the single views attached (in directory part) to input entities.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

};


%make_alias(IGESSelect_SelectSingleViewFrom)

%extend IGESSelect_SelectSingleViewFrom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESSelect_SelectSubordinate *
*************************************/
class IGESSelect_SelectSubordinate : public IFSelect_SelectExtract {
	public:
		/****************** IGESSelect_SelectSubordinate ******************/
		/**** md5 signature: 971c98dcce83c9a2734aa46b57f49570 ****/
		%feature("compactdefaultargs") IGESSelect_SelectSubordinate;
		%feature("autodoc", "Creates a selectsubordinate with a status to be sorted.

Parameters
----------
status: int

Returns
-------
None
") IGESSelect_SelectSubordinate;
		 IGESSelect_SelectSubordinate(const Standard_Integer status);

		/****************** ExtractLabel ******************/
		/**** md5 signature: 04da44ccc1aaa5db6b559360d74d3853 ****/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns the selection criterium : 'iges entity, independent' etc...

Returns
-------
TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****************** Sort ******************/
		/**** md5 signature: 88b4690c932193f08237f487d1cf387b ****/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "Returns true if <ent> is an iges entity with subordinate status matching the criterium.

Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Status ******************/
		/**** md5 signature: 95453a41824a64084ab7e8075846ede5 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the status used for sorting.

Returns
-------
int
") Status;
		Standard_Integer Status();

};


%make_alias(IGESSelect_SelectSubordinate)

%extend IGESSelect_SelectSubordinate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class IGESSelect_SelectVisibleStatus *
***************************************/
class IGESSelect_SelectVisibleStatus : public IFSelect_SelectExtract {
	public:
		/****************** IGESSelect_SelectVisibleStatus ******************/
		/**** md5 signature: cbb3d5de4d56efef4d9ad28ff3927f50 ****/
		%feature("compactdefaultargs") IGESSelect_SelectVisibleStatus;
		%feature("autodoc", "Creates a selectvisiblestatus.

Returns
-------
None
") IGESSelect_SelectVisibleStatus;
		 IGESSelect_SelectVisibleStatus();

		/****************** ExtractLabel ******************/
		/**** md5 signature: 04da44ccc1aaa5db6b559360d74d3853 ****/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns the selection criterium : 'iges entity, status visible'.

Returns
-------
TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****************** Sort ******************/
		/**** md5 signature: 88b4690c932193f08237f487d1cf387b ****/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "Returns true if <ent> is an iges entity with blank status = 0.

Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IGESSelect_SelectVisibleStatus)

%extend IGESSelect_SelectVisibleStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESSelect_SignColor *
*****************************/
class IGESSelect_SignColor : public IFSelect_Signature {
	public:
		/****************** IGESSelect_SignColor ******************/
		/**** md5 signature: a41990b65b9c17f9232724d01aeef2e9 ****/
		%feature("compactdefaultargs") IGESSelect_SignColor;
		%feature("autodoc", "Creates a signcolor mode : see above for the meaning modes 4,5,6 give a numeric integer value name is initialised according to the mode.

Parameters
----------
mode: int

Returns
-------
None
") IGESSelect_SignColor;
		 IGESSelect_SignColor(const Standard_Integer mode);

		/****************** Value ******************/
		/**** md5 signature: 4e85ac861c77ba955d20c48cb38639f7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value (see above).

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
str
") Value;
		Standard_CString Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IGESSelect_SignColor)

%extend IGESSelect_SignColor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESSelect_SignLevelNumber *
***********************************/
class IGESSelect_SignLevelNumber : public IFSelect_Signature {
	public:
		/****************** IGESSelect_SignLevelNumber ******************/
		/**** md5 signature: f03d333d27034bcc31432a1092684a67 ****/
		%feature("compactdefaultargs") IGESSelect_SignLevelNumber;
		%feature("autodoc", "Creates a signlevelnumber <countmode> true : values are naturally displayed <countmode> false: values are separated by slashes in order to allow selection by signature by draw or c++.

Parameters
----------
countmode: bool

Returns
-------
None
") IGESSelect_SignLevelNumber;
		 IGESSelect_SignLevelNumber(const Standard_Boolean countmode);

		/****************** Value ******************/
		/**** md5 signature: 4e85ac861c77ba955d20c48cb38639f7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value (see above).

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
str
") Value;
		Standard_CString Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IGESSelect_SignLevelNumber)

%extend IGESSelect_SignLevelNumber {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESSelect_SignStatus *
******************************/
class IGESSelect_SignStatus : public IFSelect_Signature {
	public:
		/****************** IGESSelect_SignStatus ******************/
		/**** md5 signature: e05c024de4fbbd88eb620a9343aae029 ****/
		%feature("compactdefaultargs") IGESSelect_SignStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESSelect_SignStatus;
		 IGESSelect_SignStatus();

		/****************** Matches ******************/
		/**** md5 signature: 6cdb41c3b6f4c6d9bbd3a66d390d7419 ****/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Performs the match rule (see above).

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel
text: str
exact: bool

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model, TCollection_AsciiString text, const Standard_Boolean exact);

		/****************** Value ******************/
		/**** md5 signature: 4e85ac861c77ba955d20c48cb38639f7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value (see above).

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
str
") Value;
		Standard_CString Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

};


%make_alias(IGESSelect_SignStatus)

%extend IGESSelect_SignStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESSelect_SplineToBSpline *
***********************************/
class IGESSelect_SplineToBSpline : public IFSelect_Transformer {
	public:
		/****************** IGESSelect_SplineToBSpline ******************/
		/**** md5 signature: 10c460aec8debf72c86d97355e7c30a0 ****/
		%feature("compactdefaultargs") IGESSelect_SplineToBSpline;
		%feature("autodoc", "Creates a transformer splinetobspline. if <tryc2> is true, it will in addition try to upgrade continuity up to c2.

Parameters
----------
tryC2: bool

Returns
-------
None
") IGESSelect_SplineToBSpline;
		 IGESSelect_SplineToBSpline(const Standard_Boolean tryC2);

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which defines the way a transformer works : 'conversion spline to bspline' and as opted, ' trying to upgrade continuity'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** OptionTryC2 ******************/
		/**** md5 signature: 31cd8587787fc0cd8f2da5df00ac2ea0 ****/
		%feature("compactdefaultargs") OptionTryC2;
		%feature("autodoc", "Returns the option tryc2 given at creation time.

Returns
-------
bool
") OptionTryC2;
		Standard_Boolean OptionTryC2();

		/****************** Perform ******************/
		/**** md5 signature: b1205e0b994dfb92700072b5562fb3aa ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the transformation, if there is at least one spline curve (112) or surface (126). does nothing if there is none.

Parameters
----------
G: Interface_Graph
protocol: Interface_Protocol
checks: Interface_CheckIterator
newmod: Interface_InterfaceModel

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const Interface_Graph & G, const opencascade::handle<Interface_Protocol> & protocol, Interface_CheckIterator & checks, opencascade::handle<Interface_InterfaceModel> & newmod);

		/****************** Updated ******************/
		/**** md5 signature: ef53f73b484d5d7527130e47523fc8ca ****/
		%feature("compactdefaultargs") Updated;
		%feature("autodoc", "Returns the transformed entities. if original data contained no spline curve or surface, the result is identity : <entto> = <entfrom> else, the copied counterpart is returned : for a spline curve or surface, it is a converted bspline curve or surface. else, it is the result of general service copy (rebuilt as necessary by bsplines replacing splines).

Parameters
----------
entfrom: Standard_Transient
entto: Standard_Transient

Returns
-------
bool
") Updated;
		Standard_Boolean Updated(const opencascade::handle<Standard_Transient> & entfrom, opencascade::handle<Standard_Transient> & entto);

};


%make_alias(IGESSelect_SplineToBSpline)

%extend IGESSelect_SplineToBSpline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESSelect_ViewSorter *
******************************/
class IGESSelect_ViewSorter : public Standard_Transient {
	public:
		/****************** IGESSelect_ViewSorter ******************/
		/**** md5 signature: b78b8e612875e5334f0aad5aac049ca5 ****/
		%feature("compactdefaultargs") IGESSelect_ViewSorter;
		%feature("autodoc", "Creates a viewsorter, empty. setmodel remains to be called.

Returns
-------
None
") IGESSelect_ViewSorter;
		 IGESSelect_ViewSorter();

		/****************** Add ******************/
		/**** md5 signature: d39effa527ac4b92c1f34bfe8e36829d ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds an item according its type : addentity,addlist,addmodel.

Parameters
----------
ent: Standard_Transient

Returns
-------
bool
") Add;
		Standard_Boolean Add(const opencascade::handle<Standard_Transient> & ent);

		/****************** AddEntity ******************/
		/**** md5 signature: 46e1564641ba2ab4a23129b84022a3fb ****/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "Adds an iges entity. records the view it is attached to. records directly <ent> if it is a viewkindentity or a drawing returns true if added, false if already in the map.

Parameters
----------
igesent: IGESData_IGESEntity

Returns
-------
bool
") AddEntity;
		Standard_Boolean AddEntity(const opencascade::handle<IGESData_IGESEntity> & igesent);

		/****************** AddList ******************/
		/**** md5 signature: aa5a44f7eb178e7bc497b41c38a65aad ****/
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "Adds a list of entities by adding each of the items.

Parameters
----------
list: TColStd_HSequenceOfTransient

Returns
-------
None
") AddList;
		void AddList(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** AddModel ******************/
		/**** md5 signature: 382e0e340780b5b95ec820d1c6e5d0e3 ****/
		%feature("compactdefaultargs") AddModel;
		%feature("autodoc", "Adds all the entities contained in a model.

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
None
") AddModel;
		void AddModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears recorded data.

Returns
-------
None
") Clear;
		void Clear();

		/****************** NbEntities ******************/
		/**** md5 signature: 533943455099343f106415a0a22e8ac9 ****/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns the count of already recorded.

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities();

		/****************** NbSets ******************/
		/**** md5 signature: 60d1f086d7ca3aa72e81f62b25559dfa ****/
		%feature("compactdefaultargs") NbSets;
		%feature("autodoc", "Returns the count of sets recorded, one per distinct item. the remaining list is not counted. if <final> is false, the sets are attached to distinct views determined by the method add. if <final> is true, they are the sets determined by the last call to, either sortsingleviews, or sortdrawings. //! warning : drawings directly recorded are also counted as sets, because of their frame (which is made of annotations).

Parameters
----------
final: bool

Returns
-------
int
") NbSets;
		Standard_Integer NbSets(const Standard_Boolean final);

		/****************** SetItem ******************/
		/**** md5 signature: 131ca2405b86e8cf71f4c62c0f3e27b4 ****/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "Returns the item which is attached to a set of entities for <final> and definition of sets, see method nbsets. this item can be a kind of view or a drawing.

Parameters
----------
num: int
final: bool

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") SetItem;
		opencascade::handle<IGESData_IGESEntity> SetItem(const Standard_Integer num, const Standard_Boolean final);

		/****************** SetModel ******************/
		/**** md5 signature: 57ee68a1eb65ee7bf7cf629e19bb0af7 ****/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "Sets the model (for packetlist).

Parameters
----------
model: IGESData_IGESModel

Returns
-------
None
") SetModel;
		void SetModel(const opencascade::handle<IGESData_IGESModel> & model);

		/****************** Sets ******************/
		/**** md5 signature: 6d9f27c897c91e6a447e58c6ecae21f0 ****/
		%feature("compactdefaultargs") Sets;
		%feature("autodoc", "Returns the complete content of the determined sets, which include duplicated and remaining (duplication 0) lists for <final> and definition of sets, see method nbsets.

Parameters
----------
final: bool

Returns
-------
opencascade::handle<IFSelect_PacketList>
") Sets;
		opencascade::handle<IFSelect_PacketList> Sets(const Standard_Boolean final);

		/****************** SortDrawings ******************/
		/**** md5 signature: 03119a61d1cff028a4399fd214d2dfe2 ****/
		%feature("compactdefaultargs") SortDrawings;
		%feature("autodoc", "Prepares the result to the sets attached to drawings : all the single views referenced by a drawing become bound to the set for this drawing //! entities or views which correspond to no drawing are put into the remaining list. //! result can then be read by the methods nbsets,setitem,setlist, remaininglist(final = true).

Parameters
----------
G: Interface_Graph

Returns
-------
None
") SortDrawings;
		void SortDrawings(const Interface_Graph & G);

		/****************** SortSingleViews ******************/
		/**** md5 signature: 24f4b8725f76aa8acfd071174f707dee ****/
		%feature("compactdefaultargs") SortSingleViews;
		%feature("autodoc", "Prepares the result to keep only sets attached to single views if <alsoframes> is given true, it keeps also the drawings as specific sets, in order to get their frames. entities attached to no single view are put in remaining list. //! result can then be read by the methods nbsets,setitem,setlist, remaininglist(final = true).

Parameters
----------
alsoframes: bool

Returns
-------
None
") SortSingleViews;
		void SortSingleViews(const Standard_Boolean alsoframes);

};


%make_alias(IGESSelect_ViewSorter)

%extend IGESSelect_ViewSorter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESSelect_WorkLibrary *
*******************************/
class IGESSelect_WorkLibrary : public IFSelect_WorkLibrary {
	public:
		/****************** IGESSelect_WorkLibrary ******************/
		/**** md5 signature: aa7120d9713c18bbf2aada8db14f7b62 ****/
		%feature("compactdefaultargs") IGESSelect_WorkLibrary;
		%feature("autodoc", "Creates a iges worklibrary if <modefnes> is given as true, it will work for fnes.

Parameters
----------
modefnes: bool,optional
	default value is Standard_False

Returns
-------
None
") IGESSelect_WorkLibrary;
		 IGESSelect_WorkLibrary(const Standard_Boolean modefnes = Standard_False);

		/****************** DefineProtocol ******************/
		/**** md5 signature: 157146c9b0f14b53f8f657386c4e33d1 ****/
		%feature("compactdefaultargs") DefineProtocol;
		%feature("autodoc", "Defines a protocol to be adequate for iges (encompasses all the iges norm including igessolid, igesappli).

Returns
-------
opencascade::handle<IGESData_Protocol>
") DefineProtocol;
		static opencascade::handle<IGESData_Protocol> DefineProtocol();

		/****************** ReadFile ******************/
		/**** md5 signature: 7c07c8c070fa7d8e2bea65030a355e54 ****/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "Reads a iges file and returns a iges model (into <mod>), or lets <mod> 'null' in case of error returns 0 if ok, 1 if read error, -1 if file not opened.

Parameters
----------
name: str
model: Interface_InterfaceModel
protocol: Interface_Protocol

Returns
-------
int
") ReadFile;
		Standard_Integer ReadFile(Standard_CString name, opencascade::handle<Interface_InterfaceModel> & model, const opencascade::handle<Interface_Protocol> & protocol);

		/****************** WriteFile ******************/
		/**** md5 signature: d4f9eb66731fa2c6274e217de4bd8e1a ****/
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "Writes a file from a iges model (brought by <ctx>) returns false (and writes no file) if <ctx> is not for iges.

Parameters
----------
ctx: IFSelect_ContextWrite

Returns
-------
bool
") WriteFile;
		Standard_Boolean WriteFile(IFSelect_ContextWrite & ctx);

};


%make_alias(IGESSelect_WorkLibrary)

%extend IGESSelect_WorkLibrary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESSelect_AddFileComment *
**********************************/
class IGESSelect_AddFileComment : public IGESSelect_FileModifier {
	public:
		/****************** IGESSelect_AddFileComment ******************/
		/**** md5 signature: 037750273dc8c847d2e6f6e952666798 ****/
		%feature("compactdefaultargs") IGESSelect_AddFileComment;
		%feature("autodoc", "Creates a new empty addfilecomment. use addline to complete it.

Returns
-------
None
") IGESSelect_AddFileComment;
		 IGESSelect_AddFileComment();

		/****************** AddLine ******************/
		/**** md5 signature: 3b219b13dcd6c36fea60a93c3fc075f6 ****/
		%feature("compactdefaultargs") AddLine;
		%feature("autodoc", "Adds a line for file comment remark : lines are limited to 72 useful char.s . a line of more than 72 char.s will be splited into several ones of 72 max each.

Parameters
----------
line: str

Returns
-------
None
") AddLine;
		void AddLine(Standard_CString line);

		/****************** AddLines ******************/
		/**** md5 signature: e02165464db5279d6186e87aa698f12b ****/
		%feature("compactdefaultargs") AddLines;
		%feature("autodoc", "Adds a list of lines for file comment each of them must comply with demand of addline.

Parameters
----------
lines: TColStd_HSequenceOfHAsciiString

Returns
-------
None
") AddLines;
		void AddLines(const opencascade::handle<TColStd_HSequenceOfHAsciiString> & lines);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list of file comment lines already stored.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns specific label, which is 'add <nn> comment lines (start section)'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Line ******************/
		/**** md5 signature: f88aefd17e1bce8b1401305eb1d3be74 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns a stored line given its rank.

Parameters
----------
num: int

Returns
-------
str
") Line;
		Standard_CString Line(const Standard_Integer num);

		/****************** Lines ******************/
		/**** md5 signature: 2821a44de71b22973fbe11bc7f04ef9e ****/
		%feature("compactdefaultargs") Lines;
		%feature("autodoc", "Returns the complete list of lines in once.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") Lines;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> Lines();

		/****************** NbLines ******************/
		/**** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ****/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the count of stored lines.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** Perform ******************/
		/**** md5 signature: c7208349c36e85f892d3fd89cfcede97 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Sends the comment lines to the file (start section).

Parameters
----------
ctx: IFSelect_ContextWrite
writer: IGESData_IGESWriter

Returns
-------
None
") Perform;
		void Perform(IFSelect_ContextWrite & ctx, IGESData_IGESWriter & writer);

};


%make_alias(IGESSelect_AddFileComment)

%extend IGESSelect_AddFileComment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESSelect_AddGroup *
****************************/
class IGESSelect_AddGroup : public IGESSelect_ModelModifier {
	public:
		/****************** IGESSelect_AddGroup ******************/
		/**** md5 signature: 24e08d3352cf0f2a4833bd7d8069276d ****/
		%feature("compactdefaultargs") IGESSelect_AddGroup;
		%feature("autodoc", "Creates an addgroup.

Returns
-------
None
") IGESSelect_AddGroup;
		 IGESSelect_AddGroup();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which is 'add group'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Performing ******************/
		/**** md5 signature: 002f19ac261a3654b72417037f3917fd ****/
		%feature("compactdefaultargs") Performing;
		%feature("autodoc", "Specific action : adds a new group.

Parameters
----------
ctx: IFSelect_ContextModif
target: IGESData_IGESModel
TC: Interface_CopyTool

Returns
-------
None
") Performing;
		void Performing(IFSelect_ContextModif & ctx, const opencascade::handle<IGESData_IGESModel> & target, Interface_CopyTool & TC);

};


%make_alias(IGESSelect_AddGroup)

%extend IGESSelect_AddGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESSelect_AutoCorrect *
*******************************/
class IGESSelect_AutoCorrect : public IGESSelect_ModelModifier {
	public:
		/****************** IGESSelect_AutoCorrect ******************/
		/**** md5 signature: 7ddde9ee7a3e1ab4c525c66dad6ccc43 ****/
		%feature("compactdefaultargs") IGESSelect_AutoCorrect;
		%feature("autodoc", "Creates an autocorrect.

Returns
-------
None
") IGESSelect_AutoCorrect;
		 IGESSelect_AutoCorrect();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which is 'auto-correction of iges entities'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Performing ******************/
		/**** md5 signature: 002f19ac261a3654b72417037f3917fd ****/
		%feature("compactdefaultargs") Performing;
		%feature("autodoc", "Specific action : corrects entities when it is absolutely obvious, i.e. non equivoque (by dirchecker and specific service owncorrect) : works with a protocol.

Parameters
----------
ctx: IFSelect_ContextModif
target: IGESData_IGESModel
TC: Interface_CopyTool

Returns
-------
None
") Performing;
		void Performing(IFSelect_ContextModif & ctx, const opencascade::handle<IGESData_IGESModel> & target, Interface_CopyTool & TC);

};


%make_alias(IGESSelect_AutoCorrect)

%extend IGESSelect_AutoCorrect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESSelect_ChangeLevelList *
***********************************/
class IGESSelect_ChangeLevelList : public IGESSelect_ModelModifier {
	public:
		/****************** IGESSelect_ChangeLevelList ******************/
		/**** md5 signature: aa043f153037ac93d4543274945345a6 ****/
		%feature("compactdefaultargs") IGESSelect_ChangeLevelList;
		%feature("autodoc", "Creates a changelevellist, not yet defined (see setoldnumber and setnewnumber).

Returns
-------
None
") IGESSelect_ChangeLevelList;
		 IGESSelect_ChangeLevelList();

		/****************** HasNewNumber ******************/
		/**** md5 signature: 71256d91d24df54d6fb671494a091413 ****/
		%feature("compactdefaultargs") HasNewNumber;
		%feature("autodoc", "Returns true if newnumber is defined : then, it gives the new value for level number. else, the first value of the levellist is used as new level number.

Returns
-------
bool
") HasNewNumber;
		Standard_Boolean HasNewNumber();

		/****************** HasOldNumber ******************/
		/**** md5 signature: 44290406954fe2d1159ed593a2a3d3e2 ****/
		%feature("compactdefaultargs") HasOldNumber;
		%feature("autodoc", "Returns true if oldnumber is defined : then, only entities which have a levellist which contains the value are processed. else, all entities attached to a levellist are.

Returns
-------
bool
") HasOldNumber;
		Standard_Boolean HasOldNumber();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which begins by 'changes level lists containing <old>', or 'changes all level lists in d.e.', and ends by ' to number <new>' or ' to number = first value in list'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** NewNumber ******************/
		/**** md5 signature: 32a243e9b3f8497a4542b9a22c816fc1 ****/
		%feature("compactdefaultargs") NewNumber;
		%feature("autodoc", "Returns the parameter for newnumber. if not defined (null handle), it will be interpreted as 'new value 0'.

Returns
-------
opencascade::handle<IFSelect_IntParam>
") NewNumber;
		opencascade::handle<IFSelect_IntParam> NewNumber();

		/****************** OldNumber ******************/
		/**** md5 signature: ec43ce9880b37b62a97c767dac690933 ****/
		%feature("compactdefaultargs") OldNumber;
		%feature("autodoc", "Returns the parameter for oldnumber. if not defined (null handle), it will be interpreted as 'all level lists'.

Returns
-------
opencascade::handle<IFSelect_IntParam>
") OldNumber;
		opencascade::handle<IFSelect_IntParam> OldNumber();

		/****************** Performing ******************/
		/**** md5 signature: 002f19ac261a3654b72417037f3917fd ****/
		%feature("compactdefaultargs") Performing;
		%feature("autodoc", "Specific action : considers selected target entities : if oldnumber is not defined, all entities attached to a level list if oldnumber is defined (value not negative), entities with a level list which contains this value attaches all these entities to value given by newnumber, or the first value of the level list.

Parameters
----------
ctx: IFSelect_ContextModif
target: IGESData_IGESModel
TC: Interface_CopyTool

Returns
-------
None
") Performing;
		void Performing(IFSelect_ContextModif & ctx, const opencascade::handle<IGESData_IGESModel> & target, Interface_CopyTool & TC);

		/****************** SetNewNumber ******************/
		/**** md5 signature: b94db43268a5a92f61fdd7086f0c1375 ****/
		%feature("compactdefaultargs") SetNewNumber;
		%feature("autodoc", "Sets a parameter for newnumber.

Parameters
----------
param: IFSelect_IntParam

Returns
-------
None
") SetNewNumber;
		void SetNewNumber(const opencascade::handle<IFSelect_IntParam> & param);

		/****************** SetOldNumber ******************/
		/**** md5 signature: ed929c0a0b9a64b469f924fd47278389 ****/
		%feature("compactdefaultargs") SetOldNumber;
		%feature("autodoc", "Sets a parameter for oldnumber.

Parameters
----------
param: IFSelect_IntParam

Returns
-------
None
") SetOldNumber;
		void SetOldNumber(const opencascade::handle<IFSelect_IntParam> & param);

};


%make_alias(IGESSelect_ChangeLevelList)

%extend IGESSelect_ChangeLevelList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESSelect_ChangeLevelNumber *
*************************************/
class IGESSelect_ChangeLevelNumber : public IGESSelect_ModelModifier {
	public:
		/****************** IGESSelect_ChangeLevelNumber ******************/
		/**** md5 signature: ce311c402bd1a8e3f3e952910df87728 ****/
		%feature("compactdefaultargs") IGESSelect_ChangeLevelNumber;
		%feature("autodoc", "Creates a changelevelnumber, not yet defined (see setoldnumber and setnewnumber).

Returns
-------
None
") IGESSelect_ChangeLevelNumber;
		 IGESSelect_ChangeLevelNumber();

		/****************** HasOldNumber ******************/
		/**** md5 signature: 44290406954fe2d1159ed593a2a3d3e2 ****/
		%feature("compactdefaultargs") HasOldNumber;
		%feature("autodoc", "Returns true if oldnumber is defined : then, only entities attached to the value of oldnumber will be considered. else, all entities but those attached to a level list will be.

Returns
-------
bool
") HasOldNumber;
		Standard_Boolean HasOldNumber();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which is 'changes level number <old> to <new>' , or 'changes all levels numbers positive and zero to <new>'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** NewNumber ******************/
		/**** md5 signature: 32a243e9b3f8497a4542b9a22c816fc1 ****/
		%feature("compactdefaultargs") NewNumber;
		%feature("autodoc", "Returns the parameter for newnumber. if not defined (null handle), it will be interpreted as 'new value 0'.

Returns
-------
opencascade::handle<IFSelect_IntParam>
") NewNumber;
		opencascade::handle<IFSelect_IntParam> NewNumber();

		/****************** OldNumber ******************/
		/**** md5 signature: ec43ce9880b37b62a97c767dac690933 ****/
		%feature("compactdefaultargs") OldNumber;
		%feature("autodoc", "Returns the parameter for oldnumber. if not defined (null handle), it will be interpreted as 'all level numbers'.

Returns
-------
opencascade::handle<IFSelect_IntParam>
") OldNumber;
		opencascade::handle<IFSelect_IntParam> OldNumber();

		/****************** Performing ******************/
		/**** md5 signature: 002f19ac261a3654b72417037f3917fd ****/
		%feature("compactdefaultargs") Performing;
		%feature("autodoc", "Specific action : considers selected target entities : if oldnumber is not defined, all entities but those attached to a level list if oldnumber is defined (value not negative), entities with a defined level number (can be zero) attaches all these entities to value given by newnumber, or zero if not defined.

Parameters
----------
ctx: IFSelect_ContextModif
target: IGESData_IGESModel
TC: Interface_CopyTool

Returns
-------
None
") Performing;
		void Performing(IFSelect_ContextModif & ctx, const opencascade::handle<IGESData_IGESModel> & target, Interface_CopyTool & TC);

		/****************** SetNewNumber ******************/
		/**** md5 signature: b94db43268a5a92f61fdd7086f0c1375 ****/
		%feature("compactdefaultargs") SetNewNumber;
		%feature("autodoc", "Sets a parameter for newnumber.

Parameters
----------
param: IFSelect_IntParam

Returns
-------
None
") SetNewNumber;
		void SetNewNumber(const opencascade::handle<IFSelect_IntParam> & param);

		/****************** SetOldNumber ******************/
		/**** md5 signature: ed929c0a0b9a64b469f924fd47278389 ****/
		%feature("compactdefaultargs") SetOldNumber;
		%feature("autodoc", "Sets a parameter for oldnumber.

Parameters
----------
param: IFSelect_IntParam

Returns
-------
None
") SetOldNumber;
		void SetOldNumber(const opencascade::handle<IFSelect_IntParam> & param);

};


%make_alias(IGESSelect_ChangeLevelNumber)

%extend IGESSelect_ChangeLevelNumber {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESSelect_ComputeStatus *
*********************************/
class IGESSelect_ComputeStatus : public IGESSelect_ModelModifier {
	public:
		/****************** IGESSelect_ComputeStatus ******************/
		/**** md5 signature: bd78d2ea3e4b13b9c9cef2e9ebeadc82 ****/
		%feature("compactdefaultargs") IGESSelect_ComputeStatus;
		%feature("autodoc", "Creates an computestatus, which uses the system date.

Returns
-------
None
") IGESSelect_ComputeStatus;
		 IGESSelect_ComputeStatus();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which is 'compute subordinate status and use flag'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Performing ******************/
		/**** md5 signature: 002f19ac261a3654b72417037f3917fd ****/
		%feature("compactdefaultargs") Performing;
		%feature("autodoc", "Specific action : it first evaluates the required values for subordinate status and use flag (in directory part of each iges entity). then it corrects them, for the whole target. works with a protocol. implementation uses basiceditor.

Parameters
----------
ctx: IFSelect_ContextModif
target: IGESData_IGESModel
TC: Interface_CopyTool

Returns
-------
None
") Performing;
		void Performing(IFSelect_ContextModif & ctx, const opencascade::handle<IGESData_IGESModel> & target, Interface_CopyTool & TC);

};


%make_alias(IGESSelect_ComputeStatus)

%extend IGESSelect_ComputeStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESSelect_FloatFormat *
*******************************/
class IGESSelect_FloatFormat : public IGESSelect_FileModifier {
	public:
		/****************** IGESSelect_FloatFormat ******************/
		/**** md5 signature: d438d8eb6458258c6baeb33fa0179075 ****/
		%feature("compactdefaultargs") IGESSelect_FloatFormat;
		%feature("autodoc", "Creates a new floatformat, with standard options : zerosuppress, main format = %e, format between 0.001 and 1000. = %f.

Returns
-------
None
") IGESSelect_FloatFormat;
		 IGESSelect_FloatFormat();

		/****************** Format ******************/
		/**** md5 signature: 87c98e532826f781bc17bd6f9c3e8a54 ****/
		%feature("compactdefaultargs") Format;
		%feature("autodoc", "Returns all recorded parameters : zerosup : zerosuppress status mainform : main format (which applies out of the range, or for every real if no range is set) hasrange : true if a formatinrange is set, false else (following parameters do not apply if it is false) forminrange : secondary format (it applies inside the range) rangemin, rangemax : the range in which the secondary format applies.

Parameters
----------
mainform: str
forminrange: str

Returns
-------
zerosup: bool
hasrange: bool
rangemin: float
rangemax: float
") Format;
		void Format(Standard_Boolean &OutValue, TCollection_AsciiString & mainform, Standard_Boolean &OutValue, TCollection_AsciiString & forminrange, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns specific label : for instance, 'float format [zerosuppress] %e [, in range r1-r2 %f]'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Perform ******************/
		/**** md5 signature: c7208349c36e85f892d3fd89cfcede97 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Sets the floatting formats of igeswriter to the recorded parameters.

Parameters
----------
ctx: IFSelect_ContextWrite
writer: IGESData_IGESWriter

Returns
-------
None
") Perform;
		void Perform(IFSelect_ContextWrite & ctx, IGESData_IGESWriter & writer);

		/****************** SetDefault ******************/
		/**** md5 signature: 2919cc1c3f4a1ea6357807b51bbaad00 ****/
		%feature("compactdefaultargs") SetDefault;
		%feature("autodoc", "Sets floatformat to default value (see create) but if <digits> is given positive, it commands formats (main and range) to ensure <digits> significant digits to be displayed.

Parameters
----------
digits: int,optional
	default value is 0

Returns
-------
None
") SetDefault;
		void SetDefault(const Standard_Integer digits = 0);

		/****************** SetFormat ******************/
		/**** md5 signature: b7dee440a4b338f6c72152642427ad2c ****/
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "Sets main format to a new value remark : setformat, setzerosuppress and setformatforrange are independent.

Parameters
----------
format: str,optional
	default value is '%E'

Returns
-------
None
") SetFormat;
		void SetFormat(Standard_CString format = "%E");

		/****************** SetFormatForRange ******************/
		/**** md5 signature: bc1da3215959891437fef8abd0ed7fef ****/
		%feature("compactdefaultargs") SetFormatForRange;
		%feature("autodoc", "Sets format for range to a new value with its range of application. to cancel it, give format as '' (empty string) remark that if the condition (0. < rmin < rmax) is not verified, this secondary format will be ignored. moreover, this secondary format is intended to be used in a range around 1.

Parameters
----------
format: str,optional
	default value is '%f'
Rmin: float,optional
	default value is 0.1
Rmax: float,optional
	default value is 1000.0

Returns
-------
None
") SetFormatForRange;
		void SetFormatForRange(Standard_CString format = "%f", const Standard_Real Rmin = 0.1, const Standard_Real Rmax = 1000.0);

		/****************** SetZeroSuppress ******************/
		/**** md5 signature: 37a02e3338eee7e275b19584090a7212 ****/
		%feature("compactdefaultargs") SetZeroSuppress;
		%feature("autodoc", "Sets zerosuppress mode to a new value.

Parameters
----------
mode: bool

Returns
-------
None
") SetZeroSuppress;
		void SetZeroSuppress(const Standard_Boolean mode);

};


%make_alias(IGESSelect_FloatFormat)

%extend IGESSelect_FloatFormat {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESSelect_RebuildDrawings *
***********************************/
class IGESSelect_RebuildDrawings : public IGESSelect_ModelModifier {
	public:
		/****************** IGESSelect_RebuildDrawings ******************/
		/**** md5 signature: 68ad642719ec523dafe77dce3679cf28 ****/
		%feature("compactdefaultargs") IGESSelect_RebuildDrawings;
		%feature("autodoc", "Creates an rebuilddrawings, which uses the system date.

Returns
-------
None
") IGESSelect_RebuildDrawings;
		 IGESSelect_RebuildDrawings();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which is 'rebuild drawings'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Performing ******************/
		/**** md5 signature: 002f19ac261a3654b72417037f3917fd ****/
		%feature("compactdefaultargs") Performing;
		%feature("autodoc", "Specific action : rebuilds the original drawings.

Parameters
----------
ctx: IFSelect_ContextModif
target: IGESData_IGESModel
TC: Interface_CopyTool

Returns
-------
None
") Performing;
		void Performing(IFSelect_ContextModif & ctx, const opencascade::handle<IGESData_IGESModel> & target, Interface_CopyTool & TC);

};


%make_alias(IGESSelect_RebuildDrawings)

%extend IGESSelect_RebuildDrawings {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESSelect_RebuildGroups *
*********************************/
class IGESSelect_RebuildGroups : public IGESSelect_ModelModifier {
	public:
		/****************** IGESSelect_RebuildGroups ******************/
		/**** md5 signature: 4b3bc03b5a7c6e09da062057712cf807 ****/
		%feature("compactdefaultargs") IGESSelect_RebuildGroups;
		%feature("autodoc", "Creates an rebuildgroups, which uses the system date.

Returns
-------
None
") IGESSelect_RebuildGroups;
		 IGESSelect_RebuildGroups();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which is 'rebuild groups'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Performing ******************/
		/**** md5 signature: 002f19ac261a3654b72417037f3917fd ****/
		%feature("compactdefaultargs") Performing;
		%feature("autodoc", "Specific action : rebuilds the original groups.

Parameters
----------
ctx: IFSelect_ContextModif
target: IGESData_IGESModel
TC: Interface_CopyTool

Returns
-------
None
") Performing;
		void Performing(IFSelect_ContextModif & ctx, const opencascade::handle<IGESData_IGESModel> & target, Interface_CopyTool & TC);

};


%make_alias(IGESSelect_RebuildGroups)

%extend IGESSelect_RebuildGroups {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESSelect_RemoveCurves *
********************************/
class IGESSelect_RemoveCurves : public IGESSelect_ModelModifier {
	public:
		/****************** IGESSelect_RemoveCurves ******************/
		/**** md5 signature: b8f0bf913ddd4f6f9140433c1b2f6e75 ****/
		%feature("compactdefaultargs") IGESSelect_RemoveCurves;
		%feature("autodoc", "Creates a removecurves from faces (141/142/143/144) uv true : removes uv curves (pcurves) uv false : removes 3d curves.

Parameters
----------
UV: bool

Returns
-------
None
") IGESSelect_RemoveCurves;
		 IGESSelect_RemoveCurves(const Standard_Boolean UV);

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which is 'remove curves uv on face' or 'remove curves 3d on face'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Performing ******************/
		/**** md5 signature: 002f19ac261a3654b72417037f3917fd ****/
		%feature("compactdefaultargs") Performing;
		%feature("autodoc", "Specific action : removes the curves.

Parameters
----------
ctx: IFSelect_ContextModif
target: IGESData_IGESModel
TC: Interface_CopyTool

Returns
-------
None
") Performing;
		void Performing(IFSelect_ContextModif & ctx, const opencascade::handle<IGESData_IGESModel> & target, Interface_CopyTool & TC);

};


%make_alias(IGESSelect_RemoveCurves)

%extend IGESSelect_RemoveCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESSelect_SetGlobalParameter *
**************************************/
class IGESSelect_SetGlobalParameter : public IGESSelect_ModelModifier {
	public:
		/****************** IGESSelect_SetGlobalParameter ******************/
		/**** md5 signature: 6d0d0544cd70995c03b317e4f17358b0 ****/
		%feature("compactdefaultargs") IGESSelect_SetGlobalParameter;
		%feature("autodoc", "Creates an setglobalparameter, to be applied on global parameter <numpar>.

Parameters
----------
numpar: int

Returns
-------
None
") IGESSelect_SetGlobalParameter;
		 IGESSelect_SetGlobalParameter(const Standard_Integer numpar);

		/****************** GlobalNumber ******************/
		/**** md5 signature: cbca89666bdb17706be2f9295461f50c ****/
		%feature("compactdefaultargs") GlobalNumber;
		%feature("autodoc", "Returns the global parameter number to which this modifiers applies.

Returns
-------
int
") GlobalNumber;
		Standard_Integer GlobalNumber();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which is 'sets global parameter <numpar> to <new value>'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Performing ******************/
		/**** md5 signature: 002f19ac261a3654b72417037f3917fd ****/
		%feature("compactdefaultargs") Performing;
		%feature("autodoc", "Specific action : only <target> is used : the form of the new value is checked regarding the parameter number (given at creation time).

Parameters
----------
ctx: IFSelect_ContextModif
target: IGESData_IGESModel
TC: Interface_CopyTool

Returns
-------
None
") Performing;
		void Performing(IFSelect_ContextModif & ctx, const opencascade::handle<IGESData_IGESModel> & target, Interface_CopyTool & TC);

		/****************** SetValue ******************/
		/**** md5 signature: a0d08cd822164d4c56f9a811c5862234 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets a text parameter for the new value.

Parameters
----------
text: TCollection_HAsciiString

Returns
-------
None
") SetValue;
		void SetValue(const opencascade::handle<TCollection_HAsciiString> & text);

		/****************** Value ******************/
		/**** md5 signature: 9a475d18ce214b39a6c0952c885137c2 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value to set to the global parameter (text param).

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Value;
		opencascade::handle<TCollection_HAsciiString> Value();

};


%make_alias(IGESSelect_SetGlobalParameter)

%extend IGESSelect_SetGlobalParameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESSelect_SetLabel *
****************************/
class IGESSelect_SetLabel : public IGESSelect_ModelModifier {
	public:
		/****************** IGESSelect_SetLabel ******************/
		/**** md5 signature: 237047e0283ec76858f69823a809fd93 ****/
		%feature("compactdefaultargs") IGESSelect_SetLabel;
		%feature("autodoc", "Creates a setlabel for igesentity mode : see purpose of the class.

Parameters
----------
mode: int
enforce: bool

Returns
-------
None
") IGESSelect_SetLabel;
		 IGESSelect_SetLabel(const Standard_Integer mode, const Standard_Boolean enforce);

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which is 'clear short label' or 'set label to de' with possible additional information ' (enforced)'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Performing ******************/
		/**** md5 signature: 002f19ac261a3654b72417037f3917fd ****/
		%feature("compactdefaultargs") Performing;
		%feature("autodoc", "Specific action : sets or clears the label.

Parameters
----------
ctx: IFSelect_ContextModif
target: IGESData_IGESModel
TC: Interface_CopyTool

Returns
-------
None
") Performing;
		void Performing(IFSelect_ContextModif & ctx, const opencascade::handle<IGESData_IGESModel> & target, Interface_CopyTool & TC);

};


%make_alias(IGESSelect_SetLabel)

%extend IGESSelect_SetLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESSelect_SetVersion5 *
*******************************/
class IGESSelect_SetVersion5 : public IGESSelect_ModelModifier {
	public:
		/****************** IGESSelect_SetVersion5 ******************/
		/**** md5 signature: 65c92ee772db3d143fd4c43fede97e2a ****/
		%feature("compactdefaultargs") IGESSelect_SetVersion5;
		%feature("autodoc", "Creates an setversion5, which uses the system date for last change date.

Returns
-------
None
") IGESSelect_SetVersion5;
		 IGESSelect_SetVersion5();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which is 'update iges version to 5.1'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Performing ******************/
		/**** md5 signature: 002f19ac261a3654b72417037f3917fd ****/
		%feature("compactdefaultargs") Performing;
		%feature("autodoc", "Specific action : only <target> is used : iges version (coded) is upgraded to 5.1 if it is older, and it this case the new global parameter 25 (lastchangedate) is set to current time.

Parameters
----------
ctx: IFSelect_ContextModif
target: IGESData_IGESModel
TC: Interface_CopyTool

Returns
-------
None
") Performing;
		void Performing(IFSelect_ContextModif & ctx, const opencascade::handle<IGESData_IGESModel> & target, Interface_CopyTool & TC);

};


%make_alias(IGESSelect_SetVersion5)

%extend IGESSelect_SetVersion5 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESSelect_UpdateCreationDate *
**************************************/
class IGESSelect_UpdateCreationDate : public IGESSelect_ModelModifier {
	public:
		/****************** IGESSelect_UpdateCreationDate ******************/
		/**** md5 signature: d9cb250838e5b02b9470316191c41524 ****/
		%feature("compactdefaultargs") IGESSelect_UpdateCreationDate;
		%feature("autodoc", "Creates an updatecreationdate, which uses the system date.

Returns
-------
None
") IGESSelect_UpdateCreationDate;
		 IGESSelect_UpdateCreationDate();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which is 'update iges header creation date'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Performing ******************/
		/**** md5 signature: 002f19ac261a3654b72417037f3917fd ****/
		%feature("compactdefaultargs") Performing;
		%feature("autodoc", "Specific action : only <target> is used : the system date is set to global section item n0 18.

Parameters
----------
ctx: IFSelect_ContextModif
target: IGESData_IGESModel
TC: Interface_CopyTool

Returns
-------
None
") Performing;
		void Performing(IFSelect_ContextModif & ctx, const opencascade::handle<IGESData_IGESModel> & target, Interface_CopyTool & TC);

};


%make_alias(IGESSelect_UpdateCreationDate)

%extend IGESSelect_UpdateCreationDate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESSelect_UpdateFileName *
**********************************/
class IGESSelect_UpdateFileName : public IGESSelect_ModelModifier {
	public:
		/****************** IGESSelect_UpdateFileName ******************/
		/**** md5 signature: 83a1072e1c3859bf69152ce54f992e40 ****/
		%feature("compactdefaultargs") IGESSelect_UpdateFileName;
		%feature("autodoc", "Creates an updatefilename, which uses the system date.

Returns
-------
None
") IGESSelect_UpdateFileName;
		 IGESSelect_UpdateFileName();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which is 'updates iges file name to new current one'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Performing ******************/
		/**** md5 signature: 002f19ac261a3654b72417037f3917fd ****/
		%feature("compactdefaultargs") Performing;
		%feature("autodoc", "Specific action : only <target> is used : the system date is set to global section item n0 18.

Parameters
----------
ctx: IFSelect_ContextModif
target: IGESData_IGESModel
TC: Interface_CopyTool

Returns
-------
None
") Performing;
		void Performing(IFSelect_ContextModif & ctx, const opencascade::handle<IGESData_IGESModel> & target, Interface_CopyTool & TC);

};


%make_alias(IGESSelect_UpdateFileName)

%extend IGESSelect_UpdateFileName {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESSelect_UpdateLastChange *
************************************/
class IGESSelect_UpdateLastChange : public IGESSelect_ModelModifier {
	public:
		/****************** IGESSelect_UpdateLastChange ******************/
		/**** md5 signature: 118b4d9c58004f3b453b3d2dbc82f658 ****/
		%feature("compactdefaultargs") IGESSelect_UpdateLastChange;
		%feature("autodoc", "Creates an updatelastchange, which uses the system date.

Returns
-------
None
") IGESSelect_UpdateLastChange;
		 IGESSelect_UpdateLastChange();

		/****************** Label ******************/
		/**** md5 signature: e2fbf0e262882b3e9ec00c539ad3471b ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which is 'update iges header last change date'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Performing ******************/
		/**** md5 signature: 002f19ac261a3654b72417037f3917fd ****/
		%feature("compactdefaultargs") Performing;
		%feature("autodoc", "Specific action : only <target> is used : the system date is set to global section item n0 25. also sets iges version (item n0 23) to iges5 if it was older.

Parameters
----------
ctx: IFSelect_ContextModif
target: IGESData_IGESModel
TC: Interface_CopyTool

Returns
-------
None
") Performing;
		void Performing(IFSelect_ContextModif & ctx, const opencascade::handle<IGESData_IGESModel> & target, Interface_CopyTool & TC);

};


%make_alias(IGESSelect_UpdateLastChange)

%extend IGESSelect_UpdateLastChange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class IGESSelect_SelectBasicGeom:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
