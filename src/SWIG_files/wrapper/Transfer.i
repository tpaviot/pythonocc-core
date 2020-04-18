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
%define TRANSFERDOCSTRING
"Transfer module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_transfer.html"
%enddef
%module (package="OCC.Core", docstring=TRANSFERDOCSTRING) Transfer


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
#include<Transfer_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Interface_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
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
%import TColStd.i
%import Message.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum Transfer_StatusExec {
	Transfer_StatusInitial = 0,
	Transfer_StatusRun = 1,
	Transfer_StatusDone = 2,
	Transfer_StatusError = 3,
	Transfer_StatusLoop = 4,
};

enum Transfer_UndefMode {
	Transfer_UndefIgnore = 0,
	Transfer_UndefFailure = 1,
	Transfer_UndefContent = 2,
	Transfer_UndefUser = 3,
};

enum Transfer_StatusResult {
	Transfer_StatusVoid = 0,
	Transfer_StatusDefined = 1,
	Transfer_StatusUsed = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class Transfer_StatusExec(IntEnum):
	Transfer_StatusInitial = 0
	Transfer_StatusRun = 1
	Transfer_StatusDone = 2
	Transfer_StatusError = 3
	Transfer_StatusLoop = 4
Transfer_StatusInitial = Transfer_StatusExec.Transfer_StatusInitial
Transfer_StatusRun = Transfer_StatusExec.Transfer_StatusRun
Transfer_StatusDone = Transfer_StatusExec.Transfer_StatusDone
Transfer_StatusError = Transfer_StatusExec.Transfer_StatusError
Transfer_StatusLoop = Transfer_StatusExec.Transfer_StatusLoop

class Transfer_UndefMode(IntEnum):
	Transfer_UndefIgnore = 0
	Transfer_UndefFailure = 1
	Transfer_UndefContent = 2
	Transfer_UndefUser = 3
Transfer_UndefIgnore = Transfer_UndefMode.Transfer_UndefIgnore
Transfer_UndefFailure = Transfer_UndefMode.Transfer_UndefFailure
Transfer_UndefContent = Transfer_UndefMode.Transfer_UndefContent
Transfer_UndefUser = Transfer_UndefMode.Transfer_UndefUser

class Transfer_StatusResult(IntEnum):
	Transfer_StatusVoid = 0
	Transfer_StatusDefined = 1
	Transfer_StatusUsed = 2
Transfer_StatusVoid = Transfer_StatusResult.Transfer_StatusVoid
Transfer_StatusDefined = Transfer_StatusResult.Transfer_StatusDefined
Transfer_StatusUsed = Transfer_StatusResult.Transfer_StatusUsed
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Transfer_ActorOfProcessForFinder)
%wrap_handle(Transfer_ActorOfProcessForTransient)
%wrap_handle(Transfer_Binder)
%wrap_handle(Transfer_DispatchControl)
%wrap_handle(Transfer_Finder)
%wrap_handle(Transfer_MapContainer)
%wrap_handle(Transfer_ProcessForTransient)
%wrap_handle(Transfer_ResultFromModel)
%wrap_handle(Transfer_ResultFromTransient)
%wrap_handle(Transfer_ActorOfFinderProcess)
%wrap_handle(Transfer_ActorOfTransientProcess)
%wrap_handle(Transfer_FinderProcess)
%wrap_handle(Transfer_MultipleBinder)
%wrap_handle(Transfer_SimpleBinderOfTransient)
%wrap_handle(Transfer_TransientListBinder)
%wrap_handle(Transfer_TransientMapper)
%wrap_handle(Transfer_TransientProcess)
%wrap_handle(Transfer_VoidBinder)
%wrap_handle(Transfer_ActorDispatch)
%wrap_handle(Transfer_BinderOfTransientInteger)
%wrap_handle(Transfer_HSequenceOfBinder)
%wrap_handle(Transfer_HSequenceOfFinder)
/* end handles declaration */

/* templates */
%template(Transfer_SequenceOfBinder) NCollection_Sequence<opencascade::handle<Transfer_Binder>>;
%template(Transfer_SequenceOfFinder) NCollection_Sequence<opencascade::handle<Transfer_Finder>>;
%template(Transfer_TransferMapOfProcessForFinder) NCollection_IndexedDataMap<opencascade::handle<Transfer_Finder>,opencascade::handle<Transfer_Binder>,Transfer_FindHasher>;
%template(Transfer_TransferMapOfProcessForTransient) NCollection_IndexedDataMap<opencascade::handle<Standard_Transient>,opencascade::handle<Transfer_Binder>,TColStd_MapTransientHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<opencascade::handle<Transfer_Binder>> Transfer_SequenceOfBinder;
typedef NCollection_Sequence<opencascade::handle<Transfer_Finder>> Transfer_SequenceOfFinder;
typedef NCollection_IndexedDataMap<opencascade::handle<Transfer_Finder>, opencascade::handle<Transfer_Binder>, Transfer_FindHasher> Transfer_TransferMapOfProcessForFinder;
typedef NCollection_IndexedDataMap<opencascade::handle<Standard_Transient>, opencascade::handle<Transfer_Binder>, TColStd_MapTransientHasher> Transfer_TransferMapOfProcessForTransient;
/* end typedefs declaration */

/*****************************************
* class Transfer_ActorOfProcessForFinder *
*****************************************/
class Transfer_ActorOfProcessForFinder : public Standard_Transient {
	public:
		/****************** Transfer_ActorOfProcessForFinder ******************/
		%feature("compactdefaultargs") Transfer_ActorOfProcessForFinder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Transfer_ActorOfProcessForFinder;
		 Transfer_ActorOfProcessForFinder();

		/****************** IsLast ******************/
		%feature("compactdefaultargs") IsLast;
		%feature("autodoc", "Returns the last status (see setlast).

Returns
-------
bool
") IsLast;
		Standard_Boolean IsLast();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the actor defined as next, or a null handle.

Returns
-------
opencascade::handle<Transfer_ActorOfProcessForFinder>
") Next;
		opencascade::handle<Transfer_ActorOfProcessForFinder> Next();

		/****************** NullResult ******************/
		%feature("compactdefaultargs") NullResult;
		%feature("autodoc", "Returns a binder for no result, i.e. a null handle.

Returns
-------
opencascade::handle<Transfer_Binder>
") NullResult;
		opencascade::handle<Transfer_Binder> NullResult();

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "Prerequesite for transfer : the method transfer is called on a starting object only if recognize has returned true on it this allows to define a list of actors, each one processing a definite kind of data transferprocess calls recognize on each one before calling transfer. but even if recognize has returned true, transfer can reject by returning a null binder (afterwards rejection), the next actor is then invoked //! the provided default returns true, can be redefined.

Parameters
----------
start: Transfer_Finder

Returns
-------
bool
") Recognize;
		virtual Standard_Boolean Recognize(const opencascade::handle<Transfer_Finder> & start);

		/****************** SetLast ******************/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "If <mode> is true, commands an actor to be set at the end of the list of actors (see setnext) if it is false (creation default), each add actor is set at the beginning of the list this allows to define default actors (which are last).

Parameters
----------
mode: bool,optional
	default value is Standard_True

Returns
-------
None
") SetLast;
		void SetLast(const Standard_Boolean mode = Standard_True);

		/****************** SetNext ******************/
		%feature("compactdefaultargs") SetNext;
		%feature("autodoc", "Defines a next actor : it can then be asked to work if <self> produces no result for a given type of object. if next is already set and is not 'last', calls setnext on it. if next defined and 'last', the new actor is added before it in the list.

Parameters
----------
next: Transfer_ActorOfProcessForFinder

Returns
-------
None
") SetNext;
		void SetNext(const opencascade::handle<Transfer_ActorOfProcessForFinder> & next);

		/****************** Transferring ******************/
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "Specific action of transfer. the result is stored in the returned binder, or a null handle for 'no result' (default defined as doing nothing; should be deffered) 'mutable' allows the actor to record intermediate information, in addition to those of transferprocess.

Parameters
----------
start: Transfer_Finder
TP: Transfer_ProcessForFinder

Returns
-------
opencascade::handle<Transfer_Binder>
") Transferring;
		virtual opencascade::handle<Transfer_Binder> Transferring(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<Transfer_ProcessForFinder> & TP);

		/****************** TransientResult ******************/
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "Prepares and returns a binder for a transient result returns a null handle if <res> is itself null.

Parameters
----------
res: Standard_Transient

Returns
-------
opencascade::handle<Transfer_SimpleBinderOfTransient>
") TransientResult;
		opencascade::handle<Transfer_SimpleBinderOfTransient> TransientResult(const opencascade::handle<Standard_Transient> & res);

};


%make_alias(Transfer_ActorOfProcessForFinder)

%extend Transfer_ActorOfProcessForFinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class Transfer_ActorOfProcessForTransient *
********************************************/
class Transfer_ActorOfProcessForTransient : public Standard_Transient {
	public:
		/****************** Transfer_ActorOfProcessForTransient ******************/
		%feature("compactdefaultargs") Transfer_ActorOfProcessForTransient;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Transfer_ActorOfProcessForTransient;
		 Transfer_ActorOfProcessForTransient();

		/****************** IsLast ******************/
		%feature("compactdefaultargs") IsLast;
		%feature("autodoc", "Returns the last status (see setlast).

Returns
-------
bool
") IsLast;
		Standard_Boolean IsLast();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the actor defined as next, or a null handle.

Returns
-------
opencascade::handle<Transfer_ActorOfProcessForTransient>
") Next;
		opencascade::handle<Transfer_ActorOfProcessForTransient> Next();

		/****************** NullResult ******************/
		%feature("compactdefaultargs") NullResult;
		%feature("autodoc", "Returns a binder for no result, i.e. a null handle.

Returns
-------
opencascade::handle<Transfer_Binder>
") NullResult;
		opencascade::handle<Transfer_Binder> NullResult();

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "Prerequesite for transfer : the method transfer is called on a starting object only if recognize has returned true on it this allows to define a list of actors, each one processing a definite kind of data transferprocess calls recognize on each one before calling transfer. but even if recognize has returned true, transfer can reject by returning a null binder (afterwards rejection), the next actor is then invoked //! the provided default returns true, can be redefined.

Parameters
----------
start: Standard_Transient

Returns
-------
bool
") Recognize;
		virtual Standard_Boolean Recognize(const opencascade::handle<Standard_Transient> & start);

		/****************** SetLast ******************/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "If <mode> is true, commands an actor to be set at the end of the list of actors (see setnext) if it is false (creation default), each add actor is set at the beginning of the list this allows to define default actors (which are last).

Parameters
----------
mode: bool,optional
	default value is Standard_True

Returns
-------
None
") SetLast;
		void SetLast(const Standard_Boolean mode = Standard_True);

		/****************** SetNext ******************/
		%feature("compactdefaultargs") SetNext;
		%feature("autodoc", "Defines a next actor : it can then be asked to work if <self> produces no result for a given type of object. if next is already set and is not 'last', calls setnext on it. if next defined and 'last', the new actor is added before it in the list.

Parameters
----------
next: Transfer_ActorOfProcessForTransient

Returns
-------
None
") SetNext;
		void SetNext(const opencascade::handle<Transfer_ActorOfProcessForTransient> & next);

		/****************** Transferring ******************/
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "Specific action of transfer. the result is stored in the returned binder, or a null handle for 'no result' (default defined as doing nothing; should be deffered) 'mutable' allows the actor to record intermediate information, in addition to those of transferprocess.

Parameters
----------
start: Standard_Transient
TP: Transfer_ProcessForTransient

Returns
-------
opencascade::handle<Transfer_Binder>
") Transferring;
		virtual opencascade::handle<Transfer_Binder> Transferring(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_ProcessForTransient> & TP);

		/****************** TransientResult ******************/
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "Prepares and returns a binder for a transient result returns a null handle if <res> is itself null.

Parameters
----------
res: Standard_Transient

Returns
-------
opencascade::handle<Transfer_SimpleBinderOfTransient>
") TransientResult;
		opencascade::handle<Transfer_SimpleBinderOfTransient> TransientResult(const opencascade::handle<Standard_Transient> & res);

};


%make_alias(Transfer_ActorOfProcessForTransient)

%extend Transfer_ActorOfProcessForTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Transfer_Binder *
************************/
%nodefaultctor Transfer_Binder;
class Transfer_Binder : public Standard_Transient {
	public:
		/****************** AddFail ******************/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "Used to declare an individual transfer as beeing erroneous (status is set to void, statusexec is set to error, <errmess> is added to check's list of fails) it is possible to record several messages of error //! it has same effect for transferprocess as raising an exception during the operation of transfer, except the transfer tries to continue (as if errorhandle had been set).

Parameters
----------
mess: char *
orig: char *,optional
	default value is ""

Returns
-------
None
") AddFail;
		void AddFail(const char * mess, const char * orig = "");

		/****************** AddResult ******************/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "Adds a next result (at the end of the list) remark : this information is not processed by merge.

Parameters
----------
next: Transfer_Binder

Returns
-------
None
") AddResult;
		void AddResult(const opencascade::handle<Transfer_Binder> & next);

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "Used to attach a warning message to an individual transfer it has no effect on the status.

Parameters
----------
mess: char *
orig: char *,optional
	default value is ""

Returns
-------
None
") AddWarning;
		void AddWarning(const char * mess, const char * orig = "");

		/****************** CCheck ******************/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "Returns check which stores fail messages, in order to modify it (adding messages, or replacing it).

Returns
-------
opencascade::handle<Interface_Check>
") CCheck;
		opencascade::handle<Interface_Check> CCheck();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Returns check which stores fail messages note that no entity is associated in this check.

Returns
-------
opencascade::handle<Interface_Check>
") Check;
		const opencascade::handle<Interface_Check> Check();

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns true if a result is available (statusresult = defined) a unique result will be gotten by result (which must be defined in each sub-class according to result type) for a multiple result, see class multiplebinder for other case, specific access has to be forecast.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsMultiple ******************/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Returns true if a binder has several results, either by itself or because it has next results can be defined by sub-classes.

Returns
-------
bool
") IsMultiple;
		virtual Standard_Boolean IsMultiple();

		/****************** Merge ******************/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "Merges basic data (check, execstatus) from another binder but keeps its result. used when a binder is replaced by another one, this allows to keep messages.

Parameters
----------
other: Transfer_Binder

Returns
-------
None
") Merge;
		void Merge(const opencascade::handle<Transfer_Binder> & other);

		/****************** NextResult ******************/
		%feature("compactdefaultargs") NextResult;
		%feature("autodoc", "Returns the next result, null if none.

Returns
-------
opencascade::handle<Transfer_Binder>
") NextResult;
		opencascade::handle<Transfer_Binder> NextResult();

		/****************** ResultType ******************/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Returns the type which characterizes the result (if known).

Returns
-------
opencascade::handle<Standard_Type>
") ResultType;
		virtual opencascade::handle<Standard_Type> ResultType();

		/****************** ResultTypeName ******************/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Returns the name of the type which characterizes the result can be returned even if resulttype itself is unknown.

Returns
-------
char *
") ResultTypeName;
		virtual const char * ResultTypeName();

		/****************** SetAlreadyUsed ******************/
		%feature("compactdefaultargs") SetAlreadyUsed;
		%feature("autodoc", "Declares that result is now used by another one, it means that it cannot be modified (by rebind).

Returns
-------
None
") SetAlreadyUsed;
		void SetAlreadyUsed();

		/****************** SetStatusExec ******************/
		%feature("compactdefaultargs") SetStatusExec;
		%feature("autodoc", "Modifies execution status; called by transferprocess only (for statuserror, rather use seterror, below).

Parameters
----------
stat: Transfer_StatusExec

Returns
-------
None
") SetStatusExec;
		void SetStatusExec(const Transfer_StatusExec stat);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns status, which can be initial (not yet done), made (a result is recorded, not yet shared), used (it is shared and cannot be modified).

Returns
-------
Transfer_StatusResult
") Status;
		Transfer_StatusResult Status();

		/****************** StatusExec ******************/
		%feature("compactdefaultargs") StatusExec;
		%feature("autodoc", "Returns execution status.

Returns
-------
Transfer_StatusExec
") StatusExec;
		Transfer_StatusExec StatusExec();

};


%make_alias(Transfer_Binder)

%extend Transfer_Binder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Transfer_DataInfo *
**************************/
class Transfer_DataInfo {
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


%extend Transfer_DataInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Transfer_DispatchControl *
*********************************/
class Transfer_DispatchControl : public Interface_CopyControl {
	public:
		/****************** Transfer_DispatchControl ******************/
		%feature("compactdefaultargs") Transfer_DispatchControl;
		%feature("autodoc", "Creates the dispatchcontrol, ready for use.

Parameters
----------
model: Interface_InterfaceModel
TP: Transfer_TransientProcess

Returns
-------
None
") Transfer_DispatchControl;
		 Transfer_DispatchControl(const opencascade::handle<Interface_InterfaceModel> & model, const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "Binds a (transient) result to a (transient) starting entity.

Parameters
----------
ent: Standard_Transient
res: Standard_Transient

Returns
-------
None
") Bind;
		void Bind(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Transient> & res);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list of copied results.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Search ******************/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "Searches for the result bound to a starting entity if found, returns true and fills <res> else, returns false and nullifies <res>.

Parameters
----------
ent: Standard_Transient
res: Standard_Transient

Returns
-------
bool
") Search;
		Standard_Boolean Search(const opencascade::handle<Standard_Transient> & ent, opencascade::handle<Standard_Transient> & res);

		/****************** StartingModel ******************/
		%feature("compactdefaultargs") StartingModel;
		%feature("autodoc", "Returns the model from which the transfer is to be done.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") StartingModel;
		const opencascade::handle<Interface_InterfaceModel> & StartingModel();

		/****************** TransientProcess ******************/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Returns the content of the dispatchcontrol : it can be used for a direct call, if the basic methods do not suffice.

Returns
-------
opencascade::handle<Transfer_TransientProcess>
") TransientProcess;
		const opencascade::handle<Transfer_TransientProcess> & TransientProcess();

};


%make_alias(Transfer_DispatchControl)

%extend Transfer_DispatchControl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Transfer_FindHasher *
****************************/
class Transfer_FindHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Returns hash code for the given finder, in the range [1, theupperbound]. asks the finder its hash code, then transforms it to be in the required range @param thefinder the finder which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theFinder: Handle ( Transfer_Finder )
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const Handle ( Transfer_Finder ) & theFinder, Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if two keys are the same. the test does not work on the finders themselves but by calling their methods equates.

Parameters
----------
K1: Transfer_Finder
K2: Transfer_Finder

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const opencascade::handle<Transfer_Finder> & K1, const opencascade::handle<Transfer_Finder> & K2);

};


%extend Transfer_FindHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Transfer_Finder *
************************/
%nodefaultctor Transfer_Finder;
class Transfer_Finder : public Standard_Transient {
	public:
		/****************** AttrList ******************/
		%feature("compactdefaultargs") AttrList;
		%feature("autodoc", "Returns the exhaustive list of attributes.

Returns
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>
") AttrList;
		NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & AttrList();

		/****************** Attribute ******************/
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "Returns an attribute from its name. null handle if not recorded (whatever transient, integer, real ...).

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
		%feature("autodoc", "Returns the type of an attribute : paramint , paramreal , paramtext (string) , paramident (any) or paramvoid (not recorded).

Parameters
----------
name: char *

Returns
-------
Interface_ParamType
") AttributeType;
		Interface_ParamType AttributeType(const char * name);

		/****************** Equates ******************/
		%feature("compactdefaultargs") Equates;
		%feature("autodoc", "Specific testof equallity : to be defined by each sub-class, must be false if finders have not the same true type, else their contents must be compared.

Parameters
----------
other: Transfer_Finder

Returns
-------
bool
") Equates;
		virtual Standard_Boolean Equates(const opencascade::handle<Transfer_Finder> & other);

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
other: Transfer_Finder
fromname: char *,optional
	default value is ""
copied: bool,optional
	default value is Standard_True

Returns
-------
None
") GetAttributes;
		void GetAttributes(const opencascade::handle<Transfer_Finder> & other, const char * fromname = "", const Standard_Boolean copied = Standard_True);

		/****************** GetHashCode ******************/
		%feature("compactdefaultargs") GetHashCode;
		%feature("autodoc", "Returns the hashcode which has been stored by sethashcode (remark that hashcode could be deferred then be defined by sub-classes, the result is the same).

Returns
-------
int
") GetHashCode;
		Standard_Integer GetHashCode();

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
other: Transfer_Finder

Returns
-------
None
") SameAttributes;
		void SameAttributes(const opencascade::handle<Transfer_Finder> & other);

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


%make_alias(Transfer_Finder)

%extend Transfer_Finder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Transfer_MapContainer *
******************************/
class Transfer_MapContainer : public Standard_Transient {
	public:
		/****************** Transfer_MapContainer ******************/
		%feature("compactdefaultargs") Transfer_MapContainer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Transfer_MapContainer;
		 Transfer_MapContainer();

		/****************** GetMapObjects ******************/
		%feature("compactdefaultargs") GetMapObjects;
		%feature("autodoc", "Get map already translated geometry objects.

Returns
-------
TColStd_DataMapOfTransientTransient
") GetMapObjects;
		TColStd_DataMapOfTransientTransient & GetMapObjects();

		/****************** SetMapObjects ******************/
		%feature("compactdefaultargs") SetMapObjects;
		%feature("autodoc", "Set map already translated geometry objects.

Parameters
----------
theMapObjects: TColStd_DataMapOfTransientTransient

Returns
-------
None
") SetMapObjects;
		void SetMapObjects(TColStd_DataMapOfTransientTransient & theMapObjects);

};


%make_alias(Transfer_MapContainer)

%extend Transfer_MapContainer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Transfer_ProcessForFinder *
**********************************/
/*************************************
* class Transfer_ProcessForTransient *
*************************************/
class Transfer_ProcessForTransient : public Standard_Transient {
	public:
		/****************** Transfer_ProcessForTransient ******************/
		%feature("compactdefaultargs") Transfer_ProcessForTransient;
		%feature("autodoc", "Sets transferprocess at initial state. gives an initial size (indicative) for the map when known (default is 10000). sets default trace file as a printer and default trace level (see message_tracefile).

Parameters
----------
nb: int,optional
	default value is 10000

Returns
-------
None
") Transfer_ProcessForTransient;
		 Transfer_ProcessForTransient(const Standard_Integer nb = 10000);

		/****************** Transfer_ProcessForTransient ******************/
		%feature("compactdefaultargs") Transfer_ProcessForTransient;
		%feature("autodoc", "Sets transferprocess at initial state. gives an initial size (indicative) for the map when known (default is 10000). sets a specified printer.

Parameters
----------
printer: Message_Messenger
nb: int,optional
	default value is 10000

Returns
-------
None
") Transfer_ProcessForTransient;
		 Transfer_ProcessForTransient(const opencascade::handle<Message_Messenger> & printer, const Standard_Integer nb = 10000);

		/****************** AbnormalResult ******************/
		%feature("compactdefaultargs") AbnormalResult;
		%feature("autodoc", "Returns binders which are neither 'done' nor 'initial', that is error,loop or run (abnormal states at end of transfer) starting objects are given in correspondance in the iterator.

Returns
-------
Transfer_IteratorOfProcessForTransient
") AbnormalResult;
		Transfer_IteratorOfProcessForTransient AbnormalResult();

		/****************** Actor ******************/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Returns the defined actor. returns a null handle if not set.

Returns
-------
opencascade::handle<Transfer_ActorOfProcessForTransient>
") Actor;
		opencascade::handle<Transfer_ActorOfProcessForTransient> Actor();

		/****************** AddError ******************/
		%feature("compactdefaultargs") AddError;
		%feature("autodoc", "(other name of addfail, maintained for compatibility).

Parameters
----------
start: Standard_Transient
mess: char *
orig: char *,optional
	default value is ""

Returns
-------
None
") AddError;
		void AddError(const opencascade::handle<Standard_Transient> & start, const char * mess, const char * orig = "");

		/****************** AddFail ******************/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "Adds an error message to a starting entity (to the check of its binder of category 0, as a fail).

Parameters
----------
start: Standard_Transient
mess: char *
orig: char *,optional
	default value is ""

Returns
-------
None
") AddFail;
		void AddFail(const opencascade::handle<Standard_Transient> & start, const char * mess, const char * orig = "");

		/****************** AddFail ******************/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "Adds an error message to a starting entity from the definition of a msg (original+value).

Parameters
----------
start: Standard_Transient
amsg: Message_Msg

Returns
-------
None
") AddFail;
		void AddFail(const opencascade::handle<Standard_Transient> & start, const Message_Msg & amsg);

		/****************** AddMultiple ******************/
		%feature("compactdefaultargs") AddMultiple;
		%feature("autodoc", "Adds an item to a list of results bound to a starting object. considers a category number, by default 0, for all results.

Parameters
----------
start: Standard_Transient
res: Standard_Transient

Returns
-------
None
") AddMultiple;
		void AddMultiple(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Standard_Transient> & res);

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "Adds a warning message to a starting entity (to the check of its binder of category 0).

Parameters
----------
start: Standard_Transient
mess: char *
orig: char *,optional
	default value is ""

Returns
-------
None
") AddWarning;
		void AddWarning(const opencascade::handle<Standard_Transient> & start, const char * mess, const char * orig = "");

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "Adds a warning message to a starting entity from the definition of a msg (original+value).

Parameters
----------
start: Standard_Transient
amsg: Message_Msg

Returns
-------
None
") AddWarning;
		void AddWarning(const opencascade::handle<Standard_Transient> & start, const Message_Msg & amsg);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "Creates a link a starting object with a binder. this binder can either bring a result (effective binding) or none (it can be set later : pre-binding). considers a category number, by default 0.

Parameters
----------
start: Standard_Transient
binder: Transfer_Binder

Returns
-------
None
") Bind;
		void Bind(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_Binder> & binder);

		/****************** BindMultiple ******************/
		%feature("compactdefaultargs") BindMultiple;
		%feature("autodoc", "Prepares an object <start> to be bound with several results. if no binder is yet attached to <obj>, a multiplebinder is created, empty. if a binder is already set, it must accept multiple binding. considers a category number, by default 0.

Parameters
----------
start: Standard_Transient

Returns
-------
None
") BindMultiple;
		void BindMultiple(const opencascade::handle<Standard_Transient> & start);

		/****************** BindTransient ******************/
		%feature("compactdefaultargs") BindTransient;
		%feature("autodoc", "Binds a starting object with a transient result. uses a simplebinderoftransient to work. if there is already one but with no result set, sets its result. considers a category number, by default 0.

Parameters
----------
start: Standard_Transient
res: Standard_Transient

Returns
-------
None
") BindTransient;
		void BindTransient(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Standard_Transient> & res);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Returns the check attached to a starting entity. if <start> is unknown, returns an empty check adds a case name to a starting entity adds a case value to a starting entity returns the complete case list for an entity. null handle if empty in the list of mapped items (between 1 and nbmapped), searches for the first item which follows <num0>(not included) and which has an attribute named <name> attributes are brought by binders hence, allows such an iteration //! for (num = tp->nextitemwithattribute(name,0); num > 0; num = tp->nextitemwithattribute(name,num) { .. process mapped item <num> } returns the type of an attribute attached to binders if this name gives no attribute, returns paramvoid if this name gives several different types, returns parammisc else, returns the effective type (paraminteger, paramreal, paramident, or paramtext) returns the list of recorded attribute names, as a dictionary of integer : each value gives the count of items which bring this attribute name by default, considers all the attribute names if <rootname> is given, considers only the attribute names which begin by <rootname>.

Parameters
----------
start: Standard_Transient

Returns
-------
opencascade::handle<Interface_Check>
") Check;
		opencascade::handle<Interface_Check> Check(const opencascade::handle<Standard_Transient> & start);

		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Returns a checklist as a list of check : each one is for a starting entity which have either check (warning or fail) messages are attached, or are in abnormal state : that case gives a specific message if <erronly> is true, checks with warnings only are ignored.

Parameters
----------
erronly: bool

Returns
-------
Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList(const Standard_Boolean erronly);

		/****************** CheckListOne ******************/
		%feature("compactdefaultargs") CheckListOne;
		%feature("autodoc", "Returns a checklist for one starting object <level> interpreted as by resultone if <erronly> is true, checks with warnings only are ignored.

Parameters
----------
start: Standard_Transient
level: int
erronly: bool

Returns
-------
Interface_CheckIterator
") CheckListOne;
		Interface_CheckIterator CheckListOne(const opencascade::handle<Standard_Transient> & start, const Standard_Integer level, const Standard_Boolean erronly);

		/****************** CheckNum ******************/
		%feature("compactdefaultargs") CheckNum;
		%feature("autodoc", "Computes a number to be associated to a starting object in a check or a check-list by default, returns 0; can be redefined.

Parameters
----------
start: Standard_Transient

Returns
-------
int
") CheckNum;
		virtual Standard_Integer CheckNum(const opencascade::handle<Standard_Transient> & start);

		/****************** Clean ******************/
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "Rebuilds the map and the roots to really remove unbound items because unbind keeps the entity in place, even if not bound hence, working by checking new items is meaningless if a formerly unbound item is rebound.

Returns
-------
None
") Clean;
		void Clean();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Resets a transferprocess as ready for a completely new work. clears general data (roots) and the map.

Returns
-------
None
") Clear;
		void Clear();

		/****************** CompleteResult ******************/
		%feature("compactdefaultargs") CompleteResult;
		%feature("autodoc", "Returns, as an iterator, the entire log of transfer (list of created objects and binders which can bring errors) if withstart is given true, starting objets are also returned.

Parameters
----------
withstart: bool,optional
	default value is Standard_False

Returns
-------
Transfer_IteratorOfProcessForTransient
") CompleteResult;
		Transfer_IteratorOfProcessForTransient CompleteResult(const Standard_Boolean withstart = Standard_False);

		/****************** ErrorHandle ******************/
		%feature("compactdefaultargs") ErrorHandle;
		%feature("autodoc", "Returns error handling flag.

Returns
-------
bool
") ErrorHandle;
		Standard_Boolean ErrorHandle();

		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "Returns the binder which is linked with a starting object it can either bring a result (transfer done) or none (for a pre-binding). if no binder is linked with <start>, returns a null handle considers a category number, by default 0.

Parameters
----------
start: Standard_Transient

Returns
-------
opencascade::handle<Transfer_Binder>
") Find;
		opencascade::handle<Transfer_Binder> Find(const opencascade::handle<Standard_Transient> & start);

		/****************** FindElseBind ******************/
		%feature("compactdefaultargs") FindElseBind;
		%feature("autodoc", "Returns a binder for a starting entity, as follows : tries to find the already bound one if none found, creates a voidbinder and binds it.

Parameters
----------
start: Standard_Transient

Returns
-------
opencascade::handle<Transfer_Binder>
") FindElseBind;
		opencascade::handle<Transfer_Binder> FindElseBind(const opencascade::handle<Standard_Transient> & start);

		/****************** FindTransient ******************/
		%feature("compactdefaultargs") FindTransient;
		%feature("autodoc", "Returns the result of the transfer of an object <start> as a transient result. returns a null handle if there is no transient result considers a category number, by default 0 warning : supposes that binding is done with a simplebinderoftransient.

Parameters
----------
start: Standard_Transient

Returns
-------
opencascade::handle<Standard_Transient>
") FindTransient;
		const opencascade::handle<Standard_Transient> & FindTransient(const opencascade::handle<Standard_Transient> & start);

		/****************** FindTypedTransient ******************/
		%feature("compactdefaultargs") FindTypedTransient;
		%feature("autodoc", "Searches for a transient result attached to a starting object, according to its type, by criterium iskind(atype) //! in case of multiple result, explores the list and gives in <val> the first transient result iskind(atype) returns true and fills <val> if found else, returns false (<val> is not touched, not even nullified) //! this syntactic form avoids to do downcast : if a result is found with the good type, it is loaded in <val> and can be immediately used, well initialised.

Parameters
----------
start: Standard_Transient
atype: Standard_Type
val: Standard_Transient

Returns
-------
bool
") FindTypedTransient;
		Standard_Boolean FindTypedTransient(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Standard_Type> & atype, opencascade::handle<Standard_Transient> & val);

		/****************** GetProgress ******************/
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "Gets progress indicator.

Returns
-------
opencascade::handle<Message_ProgressIndicator>
") GetProgress;
		opencascade::handle<Message_ProgressIndicator> GetProgress();

		/****************** GetTypedTransient ******************/
		%feature("compactdefaultargs") GetTypedTransient;
		%feature("autodoc", "Searches for a transient result recorded in a binder, whatever this binder is recorded or not in <self> //! this is strictly equivalent to the class method gettypedresult from class simplebinderoftransient, but is just lighter to call //! apart from this, works as findtypedtransient.

Parameters
----------
binder: Transfer_Binder
atype: Standard_Type
val: Standard_Transient

Returns
-------
bool
") GetTypedTransient;
		Standard_Boolean GetTypedTransient(const opencascade::handle<Transfer_Binder> & binder, const opencascade::handle<Standard_Type> & atype, opencascade::handle<Standard_Transient> & val);

		/****************** IsAlreadyUsed ******************/
		%feature("compactdefaultargs") IsAlreadyUsed;
		%feature("autodoc", "Returns true if the result of the transfer of an object is already used in other ones. if it is, rebind cannot change it. considers a category number, by default 0.

Parameters
----------
start: Standard_Transient

Returns
-------
bool
") IsAlreadyUsed;
		Standard_Boolean IsAlreadyUsed(const opencascade::handle<Standard_Transient> & start);

		/****************** IsBound ******************/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "Returns true if a result (whatever its form) is bound with a starting object. i.e., if a binder with a result set, is linked with it considers a category number, by default 0.

Parameters
----------
start: Standard_Transient

Returns
-------
bool
") IsBound;
		Standard_Boolean IsBound(const opencascade::handle<Standard_Transient> & start);

		/****************** IsCheckListEmpty ******************/
		%feature("compactdefaultargs") IsCheckListEmpty;
		%feature("autodoc", "Returns true if no check message is attached to a starting object. <level> interpreted as by resultone if <erronly> is true, checks with warnings only are ignored.

Parameters
----------
start: Standard_Transient
level: int
erronly: bool

Returns
-------
bool
") IsCheckListEmpty;
		Standard_Boolean IsCheckListEmpty(const opencascade::handle<Standard_Transient> & start, const Standard_Integer level, const Standard_Boolean erronly);

		/****************** IsLooping ******************/
		%feature("compactdefaultargs") IsLooping;
		%feature("autodoc", "Returns true if we are surely in a deadloop. evaluation is not exact, it is a 'majorant' which must be computed fast. this 'majorant' is : <alevel> greater than nbmapped.

Parameters
----------
alevel: int

Returns
-------
bool
") IsLooping;
		Standard_Boolean IsLooping(const Standard_Integer alevel);

		/****************** MapIndex ******************/
		%feature("compactdefaultargs") MapIndex;
		%feature("autodoc", "Returns the index value bound to a starting object, 0 if none.

Parameters
----------
start: Standard_Transient

Returns
-------
int
") MapIndex;
		Standard_Integer MapIndex(const opencascade::handle<Standard_Transient> & start);

		/****************** MapItem ******************/
		%feature("compactdefaultargs") MapItem;
		%feature("autodoc", "Returns the binder bound to an index considers a category number, by default 0.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Transfer_Binder>
") MapItem;
		opencascade::handle<Transfer_Binder> MapItem(const Standard_Integer num);

		/****************** Mapped ******************/
		%feature("compactdefaultargs") Mapped;
		%feature("autodoc", "Returns the starting object bound to an index,.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Standard_Transient>
") Mapped;
		const opencascade::handle<Standard_Transient> & Mapped(const Standard_Integer num);

		/****************** Mend ******************/
		%feature("compactdefaultargs") Mend;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Standard_Transient
pref: char *,optional
	default value is ""

Returns
-------
None
") Mend;
		void Mend(const opencascade::handle<Standard_Transient> & start, const char * pref = "");

		/****************** Messenger ******************/
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "Returns messenger used for outputting messages. the returned object is guaranteed to be non-null; default is message::messenger().

Returns
-------
opencascade::handle<Message_Messenger>
") Messenger;
		opencascade::handle<Message_Messenger> Messenger();

		/****************** NbMapped ******************/
		%feature("compactdefaultargs") NbMapped;
		%feature("autodoc", "Returns the maximum possible value for map index (no result can be bound with a value greater than it).

Returns
-------
int
") NbMapped;
		Standard_Integer NbMapped();

		/****************** NbRoots ******************/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "Returns the count of recorded roots.

Returns
-------
int
") NbRoots;
		Standard_Integer NbRoots();

		/****************** NestingLevel ******************/
		%feature("compactdefaultargs") NestingLevel;
		%feature("autodoc", "Returns nesting level of transfers (managed by methods transcriptwith & co). starts to zero. if no automatic transfer is used, it remains to zero. zero means root level.

Returns
-------
int
") NestingLevel;
		Standard_Integer NestingLevel();

		/****************** PrintTrace ******************/
		%feature("compactdefaultargs") PrintTrace;
		%feature("autodoc", "Prints a short information on a starting object. by default prints its dynamic type. can be redefined.

Parameters
----------
start: Standard_Transient
S: Message_Messenger

Returns
-------
None
") PrintTrace;
		virtual void PrintTrace(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Message_Messenger> & S);

		/****************** Rebind ******************/
		%feature("compactdefaultargs") Rebind;
		%feature("autodoc", "Changes the binder linked with a starting object for its unitary transfer. this it can be useful when the exact form of the result is known once the transfer is widely engaged. this can be done only on first transfer. considers a category number, by default 0.

Parameters
----------
start: Standard_Transient
binder: Transfer_Binder

Returns
-------
None
") Rebind;
		void Rebind(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_Binder> & binder);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "Tells if <start> has been recognized as good candidate for transfer. i.e. queries the actor and its nexts.

Parameters
----------
start: Standard_Transient

Returns
-------
bool
") Recognize;
		Standard_Boolean Recognize(const opencascade::handle<Standard_Transient> & start);

		/****************** RemoveResult ******************/
		%feature("compactdefaultargs") RemoveResult;
		%feature("autodoc", "Removes results attached to (== unbinds) a given object and, according <level> : <level> = 0 : only it <level> = 1 : it plus its immediately owned sub-results(scope) <level> = 2 : it plus all its owned sub-results(scope).

Parameters
----------
start: Standard_Transient
level: int
compute: bool,optional
	default value is Standard_True

Returns
-------
None
") RemoveResult;
		void RemoveResult(const opencascade::handle<Standard_Transient> & start, const Standard_Integer level, const Standard_Boolean compute = Standard_True);

		/****************** ResetNestingLevel ******************/
		%feature("compactdefaultargs") ResetNestingLevel;
		%feature("autodoc", "Resets nesting level of transfers to zero (root level), whatever its current value.

Returns
-------
None
") ResetNestingLevel;
		void ResetNestingLevel();

		/****************** Resize ******************/
		%feature("compactdefaultargs") Resize;
		%feature("autodoc", "Resizes the map as required (if a new reliable value has been determined). acts only if <nb> is greater than actual nbmapped.

Parameters
----------
nb: int

Returns
-------
None
") Resize;
		void Resize(const Standard_Integer nb);

		/****************** ResultOne ******************/
		%feature("compactdefaultargs") ResultOne;
		%feature("autodoc", "Returns, as an iterator, the log of transfer for one object <level> = 0 : this object only and if <start> is a scope owner (else, <level> is ignored) : <level> = 1 : object plus its immediate scoped ones <level> = 2 : object plus all its scoped ones.

Parameters
----------
start: Standard_Transient
level: int
withstart: bool,optional
	default value is Standard_False

Returns
-------
Transfer_IteratorOfProcessForTransient
") ResultOne;
		Transfer_IteratorOfProcessForTransient ResultOne(const opencascade::handle<Standard_Transient> & start, const Standard_Integer level, const Standard_Boolean withstart = Standard_False);

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns a root entity given its number in the list (1-nbroots).

Parameters
----------
num: int

Returns
-------
opencascade::handle<Standard_Transient>
") Root;
		const opencascade::handle<Standard_Transient> & Root(const Standard_Integer num);

		/****************** RootIndex ******************/
		%feature("compactdefaultargs") RootIndex;
		%feature("autodoc", "Returns the index in the list of roots for a starting item, or 0 if it is not recorded as a root.

Parameters
----------
start: Standard_Transient

Returns
-------
int
") RootIndex;
		Standard_Integer RootIndex(const opencascade::handle<Standard_Transient> & start);

		/****************** RootItem ******************/
		%feature("compactdefaultargs") RootItem;
		%feature("autodoc", "Returns the binder bound with a root entity given its number considers a category number, by default 0.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Transfer_Binder>
") RootItem;
		opencascade::handle<Transfer_Binder> RootItem(const Standard_Integer num);

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns, as an iterator, the log of root transfer, i.e. the created objects and binders bound to starting roots if withstart is given true, starting objets are also returned.

Parameters
----------
withstart: bool,optional
	default value is Standard_False

Returns
-------
Transfer_IteratorOfProcessForTransient
") RootResult;
		Transfer_IteratorOfProcessForTransient RootResult(const Standard_Boolean withstart = Standard_False);

		/****************** SendFail ******************/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "New name for addfail (msg).

Parameters
----------
start: Standard_Transient
amsg: Message_Msg

Returns
-------
None
") SendFail;
		void SendFail(const opencascade::handle<Standard_Transient> & start, const Message_Msg & amsg);

		/****************** SendMsg ******************/
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "Adds an information message trace is filled if trace level is at least 3.

Parameters
----------
start: Standard_Transient
amsg: Message_Msg

Returns
-------
None
") SendMsg;
		void SendMsg(const opencascade::handle<Standard_Transient> & start, const Message_Msg & amsg);

		/****************** SendWarning ******************/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "New name for addwarning (msg).

Parameters
----------
start: Standard_Transient
amsg: Message_Msg

Returns
-------
None
") SendWarning;
		void SendWarning(const opencascade::handle<Standard_Transient> & start, const Message_Msg & amsg);

		/****************** SetActor ******************/
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "Defines an actor, which is used for automatic transfer if already defined, the new actor is cumulated (see setnext from actor).

Parameters
----------
actor: Transfer_ActorOfProcessForTransient

Returns
-------
None
") SetActor;
		void SetActor(const opencascade::handle<Transfer_ActorOfProcessForTransient> & actor);

		/****************** SetErrorHandle ******************/
		%feature("compactdefaultargs") SetErrorHandle;
		%feature("autodoc", "Allows controls if exceptions will be handled transfer operations <err> false : they are not handled with try {} catch {} <err> true : they are default is false: no handling performed.

Parameters
----------
err: bool

Returns
-------
None
") SetErrorHandle;
		void SetErrorHandle(const Standard_Boolean err);

		/****************** SetMessenger ******************/
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "Sets messenger used for outputting messages.

Parameters
----------
messenger: Message_Messenger

Returns
-------
None
") SetMessenger;
		void SetMessenger(const opencascade::handle<Message_Messenger> & messenger);

		/****************** SetProgress ******************/
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "Sets progress indicator.

Parameters
----------
theProgress: Message_ProgressIndicator

Returns
-------
None
") SetProgress;
		void SetProgress(const opencascade::handle<Message_ProgressIndicator> & theProgress);

		/****************** SetRoot ******************/
		%feature("compactdefaultargs") SetRoot;
		%feature("autodoc", "Declares <obj> (and its result) as root. this status will be later exploited by rootresult, see below (result can be produced at any time).

Parameters
----------
start: Standard_Transient

Returns
-------
None
") SetRoot;
		void SetRoot(const opencascade::handle<Standard_Transient> & start);

		/****************** SetRootManagement ******************/
		%feature("compactdefaultargs") SetRootManagement;
		%feature("autodoc", "Enable (if <stat> true) or disables (if <stat> false) root management. if it is set, transfers are considered as stacked (a first transfer commands other transfers, and so on) and the transfers commanded by an external caller are 'root'. remark : setroot can be called whatever this status, on every object. default is set to true.

Parameters
----------
stat: bool

Returns
-------
None
") SetRootManagement;
		void SetRootManagement(const Standard_Boolean stat);

		/****************** SetTraceLevel ******************/
		%feature("compactdefaultargs") SetTraceLevel;
		%feature("autodoc", "Sets trace level used for outputting messages: <trace> = 0 : no trace at all <trace> = 1 : handled exceptions and calls to adderror <trace> = 2 : also calls to addwarning <trace> = 3 : also traces new roots (uses method errortrace). default is 1 : errors traced.

Parameters
----------
tracelev: int

Returns
-------
None
") SetTraceLevel;
		void SetTraceLevel(const Standard_Integer tracelev);

		/****************** StartTrace ******************/
		%feature("compactdefaultargs") StartTrace;
		%feature("autodoc", "Method called when trace is asked calls printtrace to display information relevant for starting objects (which can be redefined) <level> is nesting level of transfer (0 = root) <mode> controls the way the trace is done : 0 neutral, 1 for error, 2 for warning message, 3 for new root.

Parameters
----------
binder: Transfer_Binder
start: Standard_Transient
level: int
mode: int

Returns
-------
None
") StartTrace;
		void StartTrace(const opencascade::handle<Transfer_Binder> & binder, const opencascade::handle<Standard_Transient> & start, const Standard_Integer level, const Standard_Integer mode);

		/****************** TraceLevel ******************/
		%feature("compactdefaultargs") TraceLevel;
		%feature("autodoc", "Returns trace level used for outputting messages.

Returns
-------
int
") TraceLevel;
		Standard_Integer TraceLevel();

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "Same as transferring but does not return the binder. simply returns true in case of success (for user call).

Parameters
----------
start: Standard_Transient

Returns
-------
bool
") Transfer;
		Standard_Boolean Transfer(const opencascade::handle<Standard_Transient> & start);

		/****************** Transferring ******************/
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "Performs the transfer of a starting object, by calling the method transferproduct (see below). mapping and roots are managed : nothing is done if a result is already bound, an exception is raised in case of error.

Parameters
----------
start: Standard_Transient

Returns
-------
opencascade::handle<Transfer_Binder>
") Transferring;
		opencascade::handle<Transfer_Binder> Transferring(const opencascade::handle<Standard_Transient> & start);

		/****************** Unbind ******************/
		%feature("compactdefaultargs") Unbind;
		%feature("autodoc", "Removes the binder linked with a starting object if this binder brings a non-empty check, it is replaced by a voidbinder. also removes from the list of roots as required. returns true if done, false if <start> was not bound considers a category number, by default 0.

Parameters
----------
start: Standard_Transient

Returns
-------
bool
") Unbind;
		Standard_Boolean Unbind(const opencascade::handle<Standard_Transient> & start);

};


%make_alias(Transfer_ProcessForTransient)

%extend Transfer_ProcessForTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Transfer_ResultFromModel *
*********************************/
class Transfer_ResultFromModel : public Standard_Transient {
	public:
		/****************** Transfer_ResultFromModel ******************/
		%feature("compactdefaultargs") Transfer_ResultFromModel;
		%feature("autodoc", "Creates a resultfrommodel, empty.

Returns
-------
None
") Transfer_ResultFromModel;
		 Transfer_ResultFromModel();

		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Returns the check-list of this set of results <erronly> true : only fails are considered <level> = 0 : considers only main binder <level> = 1 : considers main binder plus immediate subs <level> = 2 (d) : considers all checks.

Parameters
----------
erronly: bool
level: int,optional
	default value is 2

Returns
-------
Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList(const Standard_Boolean erronly, const Standard_Integer level = 2);

		/****************** CheckStatus ******************/
		%feature("compactdefaultargs") CheckStatus;
		%feature("autodoc", "Returns the check status with corresponds to the content of this resultfrommodel; considers all levels of transfer (worst status). returns checkany if not yet computed reads it from recorded status if already computed, else recomputes one.

Returns
-------
Interface_CheckStatus
") CheckStatus;
		Interface_CheckStatus CheckStatus();

		/****************** CheckedList ******************/
		%feature("compactdefaultargs") CheckedList;
		%feature("autodoc", "Returns the list of starting entities to which a check status is attached. <check> = -2 , all entities whatever the check (see result) <check> = -1 , entities with no fail (warning allowed) <check> = 0 , entities with no check at all <check> = 1 , entities with warning but no fail <check> = 2 , entities with fail <result> : if true, only entities with an attached result remark : result true and check=0 will give an empty list.

Parameters
----------
check: Interface_CheckStatus
result: bool

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") CheckedList;
		opencascade::handle<TColStd_HSequenceOfTransient> CheckedList(const Interface_CheckStatus check, const Standard_Boolean result);

		/****************** ComputeCheckStatus ******************/
		%feature("compactdefaultargs") ComputeCheckStatus;
		%feature("autodoc", "Computes and records check status (see checkstatus) does not computes it if already done and <enforce> false.

Parameters
----------
enforce: bool

Returns
-------
Interface_CheckStatus
") ComputeCheckStatus;
		Interface_CheckStatus ComputeCheckStatus(const Standard_Boolean enforce);

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Returns starting file name (empty if not set).

Returns
-------
char *
") FileName;
		const char * FileName();

		/****************** Fill ******************/
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "Fills from a transientprocess, with the result attached to a starting entity. considers its model if it is set. this action produces a structured set of resultfromtransient, considering scopes, starting by that of <ent>. if <ent> has no recorded result, it remains empty returns true if a result is recorded, false else.

Parameters
----------
TP: Transfer_TransientProcess
ent: Standard_Transient

Returns
-------
bool
") Fill;
		Standard_Boolean Fill(const opencascade::handle<Transfer_TransientProcess> & TP, const opencascade::handle<Standard_Transient> & ent);

		/****************** FillBack ******************/
		%feature("compactdefaultargs") FillBack;
		%feature("autodoc", "Fills back a transientprocess from the structured set of binders. also sets the model.

Parameters
----------
TP: Transfer_TransientProcess

Returns
-------
None
") FillBack;
		void FillBack(const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns true if a result is recorded.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** MainLabel ******************/
		%feature("compactdefaultargs") MainLabel;
		%feature("autodoc", "Returns the label in starting model attached to main entity (updated by fill or setmainresult, if model is known).

Returns
-------
char *
") MainLabel;
		const char * MainLabel();

		/****************** MainNumber ******************/
		%feature("compactdefaultargs") MainNumber;
		%feature("autodoc", "Returns the label in starting model attached to main entity.

Returns
-------
int
") MainNumber;
		Standard_Integer MainNumber();

		/****************** MainResult ******************/
		%feature("compactdefaultargs") MainResult;
		%feature("autodoc", "Returns the main recorded resultfromtransient, or a null.

Returns
-------
opencascade::handle<Transfer_ResultFromTransient>
") MainResult;
		opencascade::handle<Transfer_ResultFromTransient> MainResult();

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns starting model (null if not set).

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** ResultFromKey ******************/
		%feature("compactdefaultargs") ResultFromKey;
		%feature("autodoc", "Searches for a key (starting entity) and returns its result returns a null handle if not found.

Parameters
----------
start: Standard_Transient

Returns
-------
opencascade::handle<Transfer_ResultFromTransient>
") ResultFromKey;
		opencascade::handle<Transfer_ResultFromTransient> ResultFromKey(const opencascade::handle<Standard_Transient> & start);

		/****************** Results ******************/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "Internal method which returns the list of resultfromtransient, according level (2:complete; 1:sub-level 1; 0:main only).

Parameters
----------
level: int

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") Results;
		opencascade::handle<TColStd_HSequenceOfTransient> Results(const Standard_Integer level);

		/****************** SetFileName ******************/
		%feature("compactdefaultargs") SetFileName;
		%feature("autodoc", "Sets starting file name.

Parameters
----------
filename: char *

Returns
-------
None
") SetFileName;
		void SetFileName(const char * filename);

		/****************** SetMainResult ******************/
		%feature("compactdefaultargs") SetMainResult;
		%feature("autodoc", "Sets a new value for the main recorded resultfromtransient.

Parameters
----------
amain: Transfer_ResultFromTransient

Returns
-------
None
") SetMainResult;
		void SetMainResult(const opencascade::handle<Transfer_ResultFromTransient> & amain);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "Sets starting model.

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
None
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Strip ******************/
		%feature("compactdefaultargs") Strip;
		%feature("autodoc", "Clears some data attached to binders used by transientprocess, which become useless once the transfer has been done, by calling strip on its resultfromtransient //! mode = 0 : minimum, clears data remaining from transferprocess mode = 10 : just keeps file name, label, check status ..., and mainresult but only the result (binder) mode = 11 : also clears mainresult (status and names remain).

Parameters
----------
mode: int

Returns
-------
None
") Strip;
		void Strip(const Standard_Integer mode);

		/****************** TransferredList ******************/
		%feature("compactdefaultargs") TransferredList;
		%feature("autodoc", "Returns the list of recorded starting entities, ending by the root. entities with check but no transfer result are ignored <level> = 2 (d), considers the complete list <level> = 1 considers the main result plus immediate subs <level> = 0 just the main result.

Parameters
----------
level: int,optional
	default value is 2

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") TransferredList;
		opencascade::handle<TColStd_HSequenceOfTransient> TransferredList(const Standard_Integer level = 2);

};


%make_alias(Transfer_ResultFromModel)

%extend Transfer_ResultFromModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class Transfer_ResultFromTransient *
*************************************/
class Transfer_ResultFromTransient : public Standard_Transient {
	public:
		/****************** Transfer_ResultFromTransient ******************/
		%feature("compactdefaultargs") Transfer_ResultFromTransient;
		%feature("autodoc", "Creates a resultfromtransient, empty.

Returns
-------
None
") Transfer_ResultFromTransient;
		 Transfer_ResultFromTransient();

		/****************** AddSubResult ******************/
		%feature("compactdefaultargs") AddSubResult;
		%feature("autodoc", "Adds a sub-result.

Parameters
----------
sub: Transfer_ResultFromTransient

Returns
-------
None
") AddSubResult;
		void AddSubResult(const opencascade::handle<Transfer_ResultFromTransient> & sub);

		/****************** Binder ******************/
		%feature("compactdefaultargs") Binder;
		%feature("autodoc", "Returns the binder.

Returns
-------
opencascade::handle<Transfer_Binder>
") Binder;
		opencascade::handle<Transfer_Binder> Binder();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Returns the check (or an empty one if no binder).

Returns
-------
opencascade::handle<Interface_Check>
") Check;
		const opencascade::handle<Interface_Check> Check();

		/****************** CheckStatus ******************/
		%feature("compactdefaultargs") CheckStatus;
		%feature("autodoc", "Returns the check status.

Returns
-------
Interface_CheckStatus
") CheckStatus;
		Interface_CheckStatus CheckStatus();

		/****************** ClearSubs ******************/
		%feature("compactdefaultargs") ClearSubs;
		%feature("autodoc", "Clears the list of (immediate) sub-results.

Returns
-------
None
") ClearSubs;
		void ClearSubs();

		/****************** Fill ******************/
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "Fills from a transientprocess, with the starting entity which must have been set before. it works with scopes, calls fill on each of its sub-results.

Parameters
----------
TP: Transfer_TransientProcess

Returns
-------
None
") Fill;
		void Fill(const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** FillBack ******************/
		%feature("compactdefaultargs") FillBack;
		%feature("autodoc", "Fills back a transientprocess with definition of a resultfromtransient, respectfully to its structuration in scopes.

Parameters
----------
TP: Transfer_TransientProcess

Returns
-------
None
") FillBack;
		void FillBack(const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** FillMap ******************/
		%feature("compactdefaultargs") FillMap;
		%feature("autodoc", "This method is used by resultfrommodel to collate the list of resultfromtransient, avoiding duplications with a map remark : <self> is already in the map and has not to be bound.

Parameters
----------
map: TColStd_IndexedMapOfTransient

Returns
-------
None
") FillMap;
		void FillMap(TColStd_IndexedMapOfTransient & map);

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns true if a result is recorded.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** NbSubResults ******************/
		%feature("compactdefaultargs") NbSubResults;
		%feature("autodoc", "Returns the count of recorded sub-results.

Returns
-------
int
") NbSubResults;
		Standard_Integer NbSubResults();

		/****************** ResultFromKey ******************/
		%feature("compactdefaultargs") ResultFromKey;
		%feature("autodoc", "Returns the resultfromtransient attached to a given starting entity (the key). returns a null handle if not found.

Parameters
----------
key: Standard_Transient

Returns
-------
opencascade::handle<Transfer_ResultFromTransient>
") ResultFromKey;
		opencascade::handle<Transfer_ResultFromTransient> ResultFromKey(const opencascade::handle<Standard_Transient> & key);

		/****************** SetBinder ******************/
		%feature("compactdefaultargs") SetBinder;
		%feature("autodoc", "Sets binder (for result plus individual check).

Parameters
----------
binder: Transfer_Binder

Returns
-------
None
") SetBinder;
		void SetBinder(const opencascade::handle<Transfer_Binder> & binder);

		/****************** SetStart ******************/
		%feature("compactdefaultargs") SetStart;
		%feature("autodoc", "Sets starting entity.

Parameters
----------
start: Standard_Transient

Returns
-------
None
") SetStart;
		void SetStart(const opencascade::handle<Standard_Transient> & start);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Returns the starting entity.

Returns
-------
opencascade::handle<Standard_Transient>
") Start;
		opencascade::handle<Standard_Transient> Start();

		/****************** Strip ******************/
		%feature("compactdefaultargs") Strip;
		%feature("autodoc", "Clears some data attached to binders used by transientprocess, which become useless once the transfer has been done : the list of sub-scoped binders, which is now recorded as sub-results.

Returns
-------
None
") Strip;
		void Strip();

		/****************** SubResult ******************/
		%feature("compactdefaultargs") SubResult;
		%feature("autodoc", "Returns a sub-result, given its rank.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Transfer_ResultFromTransient>
") SubResult;
		opencascade::handle<Transfer_ResultFromTransient> SubResult(const Standard_Integer num);

};


%make_alias(Transfer_ResultFromTransient)

%extend Transfer_ResultFromTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Transfer_TransferDispatch *
**********************************/
class Transfer_TransferDispatch : public Interface_CopyTool {
	public:
		/****************** Transfer_TransferDispatch ******************/
		%feature("compactdefaultargs") Transfer_TransferDispatch;
		%feature("autodoc", "Creates a transferdispatch from a model. works with a general service library, given as an argument a transferdispatch is created as a copytool in which the control is set to transientprocess.

Parameters
----------
amodel: Interface_InterfaceModel
lib: Interface_GeneralLib

Returns
-------
None
") Transfer_TransferDispatch;
		 Transfer_TransferDispatch(const opencascade::handle<Interface_InterfaceModel> & amodel, const Interface_GeneralLib & lib);

		/****************** Transfer_TransferDispatch ******************/
		%feature("compactdefaultargs") Transfer_TransferDispatch;
		%feature("autodoc", "Same as above, but library is defined through a protocol.

Parameters
----------
amodel: Interface_InterfaceModel
protocol: Interface_Protocol

Returns
-------
None
") Transfer_TransferDispatch;
		 Transfer_TransferDispatch(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & protocol);

		/****************** Transfer_TransferDispatch ******************/
		%feature("compactdefaultargs") Transfer_TransferDispatch;
		%feature("autodoc", "Same as above, but works with the active protocol.

Parameters
----------
amodel: Interface_InterfaceModel

Returns
-------
None
") Transfer_TransferDispatch;
		 Transfer_TransferDispatch(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Copies an entity by calling the method transferring from the transferprocess. if this called produces a null binder, then the standard, inherited copy is called.

Parameters
----------
entfrom: Standard_Transient
entto: Standard_Transient
mapped: bool
errstat: bool

Returns
-------
bool
") Copy;
		virtual Standard_Boolean Copy(const opencascade::handle<Standard_Transient> & entfrom, opencascade::handle<Standard_Transient> & entto, const Standard_Boolean mapped, const Standard_Boolean errstat);

		/****************** TransientProcess ******************/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Returns the content of control object, as a transientprocess.

Returns
-------
opencascade::handle<Transfer_TransientProcess>
") TransientProcess;
		opencascade::handle<Transfer_TransientProcess> TransientProcess();

};


%extend Transfer_TransferDispatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Transfer_TransferInput *
*******************************/
class Transfer_TransferInput {
	public:
		/****************** Transfer_TransferInput ******************/
		%feature("compactdefaultargs") Transfer_TransferInput;
		%feature("autodoc", "Creates a transferinput ready to use.

Returns
-------
None
") Transfer_TransferInput;
		 Transfer_TransferInput();

		/****************** Entities ******************/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "Takes the transient items stored in a transferiterator.

Parameters
----------
list: Transfer_TransferIterator

Returns
-------
Interface_EntityIterator
") Entities;
		Interface_EntityIterator Entities(Transfer_TransferIterator & list);

		/****************** FillModel ******************/
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "Fills an interfacemodel with the complete result of a transfer stored in a transientprocess (starting objects are transient) the complete result is exactly added to the model.

Parameters
----------
proc: Transfer_TransientProcess
amodel: Interface_InterfaceModel

Returns
-------
None
") FillModel;
		void FillModel(const opencascade::handle<Transfer_TransientProcess> & proc, const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** FillModel ******************/
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "Fills an interfacemodel with results of the transfer recorded in a transientprocess (starting objects are transient) : root result if <roots> is true (default), complete result else the entities added to the model are determined from the result by by adding the referenced entities.

Parameters
----------
proc: Transfer_TransientProcess
amodel: Interface_InterfaceModel
proto: Interface_Protocol
roots: bool,optional
	default value is Standard_True

Returns
-------
None
") FillModel;
		void FillModel(const opencascade::handle<Transfer_TransientProcess> & proc, const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & proto, const Standard_Boolean roots = Standard_True);

		/****************** FillModel ******************/
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "Fills an interfacemodel with the complete result of a transfer stored in a transientprocess (starting objects are transient) the complete result is exactly added to the model.

Parameters
----------
proc: Transfer_FinderProcess
amodel: Interface_InterfaceModel

Returns
-------
None
") FillModel;
		void FillModel(const opencascade::handle<Transfer_FinderProcess> & proc, const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** FillModel ******************/
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "Fills an interfacemodel with results of the transfer recorded in a transientprocess (starting objects are transient) : root result if <roots> is true (default), complete result else the entities added to the model are determined from the result by by adding the referenced entities.

Parameters
----------
proc: Transfer_FinderProcess
amodel: Interface_InterfaceModel
proto: Interface_Protocol
roots: bool,optional
	default value is Standard_True

Returns
-------
None
") FillModel;
		void FillModel(const opencascade::handle<Transfer_FinderProcess> & proc, const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & proto, const Standard_Boolean roots = Standard_True);

};


%extend Transfer_TransferInput {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Transfer_TransferIterator *
**********************************/
class Transfer_TransferIterator {
	public:
		/****************** Transfer_TransferIterator ******************/
		%feature("compactdefaultargs") Transfer_TransferIterator;
		%feature("autodoc", "Creates an empty iterator.

Returns
-------
None
") Transfer_TransferIterator;
		 Transfer_TransferIterator();

		/****************** AddItem ******************/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "Adds a binder to the iteration list (construction).

Parameters
----------
atr: Transfer_Binder

Returns
-------
None
") AddItem;
		void AddItem(const opencascade::handle<Transfer_Binder> & atr);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Returns check associated to current binder (in case of error, it brings fail messages) (in case of warnings, it brings warning messages).

Returns
-------
opencascade::handle<Interface_Check>
") Check;
		const opencascade::handle<Interface_Check> Check();

		/****************** HasFails ******************/
		%feature("compactdefaultargs") HasFails;
		%feature("autodoc", "Returns true if fail messages are recorded with the current binder. they can then be read through check (see below).

Returns
-------
bool
") HasFails;
		Standard_Boolean HasFails();

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns true if current item brings a result, transient (handle) or not or multiple. that is to say, if it corresponds to a normally acheived transfer, transient result is read by specific transientresult below. other kind of result must be read specifically from its binder.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** HasTransientResult ******************/
		%feature("compactdefaultargs") HasTransientResult;
		%feature("autodoc", "Returns true if the current item has a transient unique result (if yes, use transientresult to get it).

Returns
-------
bool
") HasTransientResult;
		Standard_Boolean HasTransientResult();

		/****************** HasUniqueResult ******************/
		%feature("compactdefaultargs") HasUniqueResult;
		%feature("autodoc", "Returns true if current item has a unique result.

Returns
-------
bool
") HasUniqueResult;
		Standard_Boolean HasUniqueResult();

		/****************** HasWarnings ******************/
		%feature("compactdefaultargs") HasWarnings;
		%feature("autodoc", "Returns true if warning messages are recorded with the current binder. they can then be read through check (see below).

Returns
-------
bool
") HasWarnings;
		Standard_Boolean HasWarnings();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there are other items to iterate.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Sets iteration to the next item.

Returns
-------
None
") Next;
		void Next();

		/****************** Number ******************/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Returns count of binders to be iterated.

Returns
-------
int
") Number;
		Standard_Integer Number();

		/****************** ResultType ******************/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Returns the type of the result of the current item, if unique. if no unique result (error transfert or multiple result), returns a null handle the type is : the dynamic type for a transient result, the type defined by the binder class else.

Returns
-------
opencascade::handle<Standard_Type>
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****************** SelectBinder ******************/
		%feature("compactdefaultargs") SelectBinder;
		%feature("autodoc", "Selects items on the type of binder : keep only binders which are of a given type (if keep is true) or reject only them (if keep is false).

Parameters
----------
atype: Standard_Type
keep: bool

Returns
-------
None
") SelectBinder;
		void SelectBinder(const opencascade::handle<Standard_Type> & atype, const Standard_Boolean keep);

		/****************** SelectItem ******************/
		%feature("compactdefaultargs") SelectItem;
		%feature("autodoc", "Selects/unselect (according to <keep> an item designated by its rank <num> in the list used by sub-classes which have specific criteria.

Parameters
----------
num: int
keep: bool

Returns
-------
None
") SelectItem;
		void SelectItem(const Standard_Integer num, const Standard_Boolean keep);

		/****************** SelectResult ******************/
		%feature("compactdefaultargs") SelectResult;
		%feature("autodoc", "Selects items on the type of result. considers only unique results. considers dynamic type for transient result, static type (the one given to define the binder) else. //! results which are of a given type (if keep is true) or reject only them (if keep is false).

Parameters
----------
atype: Standard_Type
keep: bool

Returns
-------
None
") SelectResult;
		void SelectResult(const opencascade::handle<Standard_Type> & atype, const Standard_Boolean keep);

		/****************** SelectUnique ******************/
		%feature("compactdefaultargs") SelectUnique;
		%feature("autodoc", "Select items according unicity : keep only unique results (if keep is true) or keep only multiple results (if keep is false).

Parameters
----------
keep: bool

Returns
-------
None
") SelectUnique;
		void SelectUnique(const Standard_Boolean keep);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Clears iteration in progress, to allow it to be restarted.

Returns
-------
None
") Start;
		void Start();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns execution status of current binder normal transfer corresponds to statusdone.

Returns
-------
Transfer_StatusExec
") Status;
		Transfer_StatusExec Status();

		/****************** TransientResult ******************/
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "Returns the transient result of the current item if there is (else, returns a null handle) supposes that binding is done by a simplebinderoftransient.

Returns
-------
opencascade::handle<Standard_Transient>
") TransientResult;
		const opencascade::handle<Standard_Transient> & TransientResult();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current binder.

Returns
-------
opencascade::handle<Transfer_Binder>
") Value;
		const opencascade::handle<Transfer_Binder> & Value();

};


%extend Transfer_TransferIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Transfer_TransferOutput *
********************************/
class Transfer_TransferOutput {
	public:
		/****************** Transfer_TransferOutput ******************/
		%feature("compactdefaultargs") Transfer_TransferOutput;
		%feature("autodoc", "Creates a transferoutput ready to use, with a transientprocess.

Parameters
----------
actor: Transfer_ActorOfTransientProcess
amodel: Interface_InterfaceModel

Returns
-------
None
") Transfer_TransferOutput;
		 Transfer_TransferOutput(const opencascade::handle<Transfer_ActorOfTransientProcess> & actor, const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** Transfer_TransferOutput ******************/
		%feature("compactdefaultargs") Transfer_TransferOutput;
		%feature("autodoc", "Creates a transferoutput from an already existing transientprocess, and a model returns (by reference, hence can be changed) the mode for scope management. false (d) means scope is ignored. true means that each individual transfer (direct or through transferroots) is regarded as one scope.

Parameters
----------
proc: Transfer_TransientProcess
amodel: Interface_InterfaceModel

Returns
-------
None
") Transfer_TransferOutput;
		 Transfer_TransferOutput(const opencascade::handle<Transfer_TransientProcess> & proc, const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** ListForStatus ******************/
		%feature("compactdefaultargs") ListForStatus;
		%feature("autodoc", "Returns the list of starting entities with these criteria : - <normal> false, gives the entities bound with abnormal status (e.g. : fail recorded, exception raised during transfer) - <normal> true, gives entities with or without a result, but with no fail, no exception (warnings are not counted) - <roots> false, considers all entities recorded (either for result, or for at least one fail or warning message) - <roots> true (default), considers only roots of transfer (the entities recorded at highest level) this method is based on abnormalresult from transferprocess.

Parameters
----------
normal: bool
roots: bool,optional
	default value is Standard_True

Returns
-------
Interface_EntityIterator
") ListForStatus;
		Interface_EntityIterator ListForStatus(const Standard_Boolean normal, const Standard_Boolean roots = Standard_True);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the starting model.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** ModelForStatus ******************/
		%feature("compactdefaultargs") ModelForStatus;
		%feature("autodoc", "Fills a model with the list determined by listforstatus this model starts from scratch (made by newemptymodel from the current model), then is filled by addwithrefs //! useful to get separately from a transfer, the entities which have caused problem, in order to furtherly analyse them (with normal = false), or the 'good' entities, to obtain a data set 'which works well' (with normal = true).

Parameters
----------
protocol: Interface_Protocol
normal: bool
roots: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") ModelForStatus;
		opencascade::handle<Interface_InterfaceModel> ModelForStatus(const opencascade::handle<Interface_Protocol> & protocol, const Standard_Boolean normal, const Standard_Boolean roots = Standard_True);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "Transfer checks that all taken entities come from the same model, then calls transfer from transientprocess.

Parameters
----------
obj: Standard_Transient

Returns
-------
None
") Transfer;
		void Transfer(const opencascade::handle<Standard_Transient> & obj);

		/****************** TransferRoots ******************/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "Runs transfer on the roots of the interface model the roots are computed with a shareflags created from a protocol given as argument.

Parameters
----------
protocol: Interface_Protocol

Returns
-------
None
") TransferRoots;
		void TransferRoots(const opencascade::handle<Interface_Protocol> & protocol);

		/****************** TransferRoots ******************/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "Runs transfer on the roots defined by a graph of dependences (which detains also a model and its entities) roots are computed with a shareflags created from the graph.

Parameters
----------
G: Interface_Graph

Returns
-------
None
") TransferRoots;
		void TransferRoots(const Interface_Graph & G);

		/****************** TransferRoots ******************/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "Runs transfer on the roots of the interface model remark : the roots are computed with a shareflags created from the active protocol.

Returns
-------
None
") TransferRoots;
		void TransferRoots();

		/****************** TransientProcess ******************/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Returns the transientprocess used to work.

Returns
-------
opencascade::handle<Transfer_TransientProcess>
") TransientProcess;
		opencascade::handle<Transfer_TransientProcess> TransientProcess();

};


%extend Transfer_TransferOutput {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class Transfer_ActorOfFinderProcess *
**************************************/
class Transfer_ActorOfFinderProcess : public Transfer_ActorOfProcessForFinder {
	public:
		/****************** Transfer_ActorOfFinderProcess ******************/
		%feature("compactdefaultargs") Transfer_ActorOfFinderProcess;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Transfer_ActorOfFinderProcess;
		 Transfer_ActorOfFinderProcess();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetModeTrans() {
            return (Standard_Integer) $self->ModeTrans();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetModeTrans(Standard_Integer value) {
            $self->ModeTrans()=value;
            }
        };
		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Transfer_Finder
TP: Transfer_FinderProcess

Returns
-------
opencascade::handle<Transfer_Binder>
") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<Transfer_FinderProcess> & TP);

		/****************** TransferTransient ******************/
		%feature("compactdefaultargs") TransferTransient;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Standard_Transient
TP: Transfer_FinderProcess

Returns
-------
opencascade::handle<Standard_Transient>
") TransferTransient;
		virtual opencascade::handle<Standard_Transient> TransferTransient(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_FinderProcess> & TP);

		/****************** Transferring ******************/
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Transfer_Finder
TP: Transfer_ProcessForFinder

Returns
-------
opencascade::handle<Transfer_Binder>
") Transferring;
		virtual opencascade::handle<Transfer_Binder> Transferring(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<Transfer_ProcessForFinder> & TP);

};


%make_alias(Transfer_ActorOfFinderProcess)

%extend Transfer_ActorOfFinderProcess {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class Transfer_ActorOfTransientProcess *
*****************************************/
class Transfer_ActorOfTransientProcess : public Transfer_ActorOfProcessForTransient {
	public:
		/****************** Transfer_ActorOfTransientProcess ******************/
		%feature("compactdefaultargs") Transfer_ActorOfTransientProcess;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Transfer_ActorOfTransientProcess;
		 Transfer_ActorOfTransientProcess();

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Standard_Transient
TP: Transfer_TransientProcess

Returns
-------
opencascade::handle<Transfer_Binder>
") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** TransferTransient ******************/
		%feature("compactdefaultargs") TransferTransient;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Standard_Transient
TP: Transfer_TransientProcess

Returns
-------
opencascade::handle<Standard_Transient>
") TransferTransient;
		virtual opencascade::handle<Standard_Transient> TransferTransient(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** Transferring ******************/
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Standard_Transient
TP: Transfer_ProcessForTransient

Returns
-------
opencascade::handle<Transfer_Binder>
") Transferring;
		virtual opencascade::handle<Transfer_Binder> Transferring(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_ProcessForTransient> & TP);

};


%make_alias(Transfer_ActorOfTransientProcess)

%extend Transfer_ActorOfTransientProcess {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Transfer_FinderProcess *
*******************************/
class Transfer_FinderProcess : public Transfer_ProcessForFinder {
	public:
		/****************** Transfer_FinderProcess ******************/
		%feature("compactdefaultargs") Transfer_FinderProcess;
		%feature("autodoc", "Sets finderprocess at initial state, with an initial size.

Parameters
----------
nb: int,optional
	default value is 10000

Returns
-------
None
") Transfer_FinderProcess;
		 Transfer_FinderProcess(const Standard_Integer nb = 10000);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model which can be used for context.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** NextMappedWithAttribute ******************/
		%feature("compactdefaultargs") NextMappedWithAttribute;
		%feature("autodoc", "In the list of mapped items (between 1 and nbmapped), searches for the first mapped item which follows <num0> (not included) and which has an attribute named <name> the considered attributes are those brought by finders,i.e. by input data. while nextitemwithattribute works on result data (binders) //! hence, allows such an iteration //! for (num = fp->nextmappedwithattribute(name,0); num > 0; num = fp->nextmappedwithattribute(name,num) { .. process mapped item <num> }.

Parameters
----------
name: char *
num0: int

Returns
-------
int
") NextMappedWithAttribute;
		Standard_Integer NextMappedWithAttribute(const char * name, const Standard_Integer num0);

		/****************** PrintStats ******************/
		%feature("compactdefaultargs") PrintStats;
		%feature("autodoc", "Prints statistics on a given output, according mode.

Parameters
----------
mode: int
S: Message_Messenger

Returns
-------
None
") PrintStats;
		void PrintStats(const Standard_Integer mode, const opencascade::handle<Message_Messenger> & S);

		/****************** PrintTrace ******************/
		%feature("compactdefaultargs") PrintTrace;
		%feature("autodoc", "Specific printing to trace a finder (by its method valuetype).

Parameters
----------
start: Transfer_Finder
S: Message_Messenger

Returns
-------
None
") PrintTrace;
		virtual void PrintTrace(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<Message_Messenger> & S);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "Sets an interfacemodel, which can be used during transfer for instance if a context must be managed, it is in the model.

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
None
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** TransientMapper ******************/
		%feature("compactdefaultargs") TransientMapper;
		%feature("autodoc", "Returns a transientmapper for a given transient object either <obj> is already mapped, then its mapper is returned or it is not, then a new one is created then returned, but it is not mapped here (use bind or findelsebind to do this).

Parameters
----------
obj: Standard_Transient

Returns
-------
opencascade::handle<Transfer_TransientMapper>
") TransientMapper;
		opencascade::handle<Transfer_TransientMapper> TransientMapper(const opencascade::handle<Standard_Transient> & obj);

};


%make_alias(Transfer_FinderProcess)

%extend Transfer_FinderProcess {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class Transfer_IteratorOfProcessForFinder *
********************************************/
class Transfer_IteratorOfProcessForFinder : public Transfer_TransferIterator {
	public:
		/****************** Transfer_IteratorOfProcessForFinder ******************/
		%feature("compactdefaultargs") Transfer_IteratorOfProcessForFinder;
		%feature("autodoc", "Creates an empty iterator if withstarts is true, each binder to be iterated will be associated to its corresponding starting object.

Parameters
----------
withstarts: bool

Returns
-------
None
") Transfer_IteratorOfProcessForFinder;
		 Transfer_IteratorOfProcessForFinder(const Standard_Boolean withstarts);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a binder to the iteration list (construction) with no corresponding starting object (note that result is brought by binder).

Parameters
----------
binder: Transfer_Binder

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Transfer_Binder> & binder);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a binder to the iteration list, associated with its corresponding starting object 'start' starting object is ignored if not required at creation time.

Parameters
----------
binder: Transfer_Binder
start: Transfer_Finder

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Transfer_Binder> & binder, const opencascade::handle<Transfer_Finder> & start);

		/****************** Filter ******************/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "After having added all items, keeps or rejects items which are attached to starting data given by <only> <keep> = true (d) : keeps. <keep> = false : rejects does nothing if <withstarts> was false.

Parameters
----------
list: Transfer_HSequenceOfFinder
keep: bool,optional
	default value is Standard_True

Returns
-------
None
") Filter;
		void Filter(const opencascade::handle<Transfer_HSequenceOfFinder> & list, const Standard_Boolean keep = Standard_True);

		/****************** HasStarting ******************/
		%feature("compactdefaultargs") HasStarting;
		%feature("autodoc", "Returns true if starting object is available (defined at creation time).

Returns
-------
bool
") HasStarting;
		Standard_Boolean HasStarting();

		/****************** Starting ******************/
		%feature("compactdefaultargs") Starting;
		%feature("autodoc", "Returns corresponding starting object.

Returns
-------
opencascade::handle<Transfer_Finder>
") Starting;
		const opencascade::handle<Transfer_Finder> & Starting();

};


%extend Transfer_IteratorOfProcessForFinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class Transfer_IteratorOfProcessForTransient *
***********************************************/
class Transfer_IteratorOfProcessForTransient : public Transfer_TransferIterator {
	public:
		/****************** Transfer_IteratorOfProcessForTransient ******************/
		%feature("compactdefaultargs") Transfer_IteratorOfProcessForTransient;
		%feature("autodoc", "Creates an empty iterator if withstarts is true, each binder to be iterated will be associated to its corresponding starting object.

Parameters
----------
withstarts: bool

Returns
-------
None
") Transfer_IteratorOfProcessForTransient;
		 Transfer_IteratorOfProcessForTransient(const Standard_Boolean withstarts);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a binder to the iteration list (construction) with no corresponding starting object (note that result is brought by binder).

Parameters
----------
binder: Transfer_Binder

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Transfer_Binder> & binder);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a binder to the iteration list, associated with its corresponding starting object 'start' starting object is ignored if not required at creation time.

Parameters
----------
binder: Transfer_Binder
start: Standard_Transient

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Transfer_Binder> & binder, const opencascade::handle<Standard_Transient> & start);

		/****************** Filter ******************/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "After having added all items, keeps or rejects items which are attached to starting data given by <only> <keep> = true (d) : keeps. <keep> = false : rejects does nothing if <withstarts> was false.

Parameters
----------
list: TColStd_HSequenceOfTransient
keep: bool,optional
	default value is Standard_True

Returns
-------
None
") Filter;
		void Filter(const opencascade::handle<TColStd_HSequenceOfTransient> & list, const Standard_Boolean keep = Standard_True);

		/****************** HasStarting ******************/
		%feature("compactdefaultargs") HasStarting;
		%feature("autodoc", "Returns true if starting object is available (defined at creation time).

Returns
-------
bool
") HasStarting;
		Standard_Boolean HasStarting();

		/****************** Starting ******************/
		%feature("compactdefaultargs") Starting;
		%feature("autodoc", "Returns corresponding starting object.

Returns
-------
opencascade::handle<Standard_Transient>
") Starting;
		const opencascade::handle<Standard_Transient> & Starting();

};


%extend Transfer_IteratorOfProcessForTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Transfer_MultipleBinder *
********************************/
class Transfer_MultipleBinder : public Transfer_Binder {
	public:
		/****************** Transfer_MultipleBinder ******************/
		%feature("compactdefaultargs") Transfer_MultipleBinder;
		%feature("autodoc", "Normal standard constructor, creates an empty multiplebinder.

Returns
-------
None
") Transfer_MultipleBinder;
		 Transfer_MultipleBinder();

		/****************** AddResult ******************/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "Adds a new item to the multiple result.

Parameters
----------
res: Standard_Transient

Returns
-------
None
") AddResult;
		void AddResult(const opencascade::handle<Standard_Transient> & res);

		/****************** IsMultiple ******************/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Returns true if a starting object is bound with several results : here, returns allways true.

Returns
-------
bool
") IsMultiple;
		virtual Standard_Boolean IsMultiple();

		/****************** MultipleResult ******************/
		%feature("compactdefaultargs") MultipleResult;
		%feature("autodoc", "Returns the multiple result, if it is defined (at least one item). else, returns a null handle.

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") MultipleResult;
		opencascade::handle<TColStd_HSequenceOfTransient> MultipleResult();

		/****************** NbResults ******************/
		%feature("compactdefaultargs") NbResults;
		%feature("autodoc", "Returns the actual count of recorded (transient) results.

Returns
-------
int
") NbResults;
		Standard_Integer NbResults();

		/****************** ResultType ******************/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Returns the type permitted for results, i.e. here transient.

Returns
-------
opencascade::handle<Standard_Type>
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****************** ResultTypeName ******************/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Returns the name of the type which characterizes the result here, returns '(list)'.

Returns
-------
char *
") ResultTypeName;
		const char * ResultTypeName();

		/****************** ResultValue ******************/
		%feature("compactdefaultargs") ResultValue;
		%feature("autodoc", "Returns the value of the recorded result n0 <num>.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Standard_Transient>
") ResultValue;
		opencascade::handle<Standard_Transient> ResultValue(const Standard_Integer num);

		/****************** SetMultipleResult ******************/
		%feature("compactdefaultargs") SetMultipleResult;
		%feature("autodoc", "Defines a binding with a multiple result, given as a sequence error if a unique result has yet been defined.

Parameters
----------
mulres: TColStd_HSequenceOfTransient

Returns
-------
None
") SetMultipleResult;
		void SetMultipleResult(const opencascade::handle<TColStd_HSequenceOfTransient> & mulres);

};


%make_alias(Transfer_MultipleBinder)

%extend Transfer_MultipleBinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class Transfer_SimpleBinderOfTransient *
*****************************************/
class Transfer_SimpleBinderOfTransient : public Transfer_Binder {
	public:
		/****************** Transfer_SimpleBinderOfTransient ******************/
		%feature("compactdefaultargs") Transfer_SimpleBinderOfTransient;
		%feature("autodoc", "Creates an empty simplebinderoftransient returns true if a starting object is bound with several results : here, returns allways false see binder itself.

Returns
-------
None
") Transfer_SimpleBinderOfTransient;
		 Transfer_SimpleBinderOfTransient();

		/****************** GetTypedResult ******************/
		%feature("compactdefaultargs") GetTypedResult;
		%feature("autodoc", "Returns a transient result according to its type (iskind) i.e. the result itself if iskind(atype), else searches in nextresult, until first found, then returns true if not found, returns false (res is not touched) //! this syntactic form avoids to do downcast : if a result is found with the good type, it is loaded in <res> and can be immediately used, well initialised.

Parameters
----------
bnd: Transfer_Binder
atype: Standard_Type
res: Standard_Transient

Returns
-------
bool
") GetTypedResult;
		static Standard_Boolean GetTypedResult(const opencascade::handle<Transfer_Binder> & bnd, const opencascade::handle<Standard_Type> & atype, opencascade::handle<Standard_Transient> & res);

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns the defined result, if there is one.

Returns
-------
opencascade::handle<Standard_Transient>
") Result;
		const opencascade::handle<Standard_Transient> & Result();

		/****************** ResultType ******************/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Returns the effective (dynamic) type of the result (standard_transient if no result is defined).

Returns
-------
opencascade::handle<Standard_Type>
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****************** ResultTypeName ******************/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Returns the effective name of (dynamic) type of the result (void) if no result is defined.

Returns
-------
char *
") ResultTypeName;
		const char * ResultTypeName();

		/****************** SetResult ******************/
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "Defines the result.

Parameters
----------
res: Standard_Transient

Returns
-------
None
") SetResult;
		void SetResult(const opencascade::handle<Standard_Transient> & res);

};


%make_alias(Transfer_SimpleBinderOfTransient)

%extend Transfer_SimpleBinderOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class Transfer_TransientListBinder *
*************************************/
class Transfer_TransientListBinder : public Transfer_Binder {
	public:
		/****************** Transfer_TransientListBinder ******************/
		%feature("compactdefaultargs") Transfer_TransientListBinder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Transfer_TransientListBinder;
		 Transfer_TransientListBinder();

		/****************** Transfer_TransientListBinder ******************/
		%feature("compactdefaultargs") Transfer_TransientListBinder;
		%feature("autodoc", "No available documentation.

Parameters
----------
list: TColStd_HSequenceOfTransient

Returns
-------
None
") Transfer_TransientListBinder;
		 Transfer_TransientListBinder(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** AddResult ******************/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "Adds an item to the result list.

Parameters
----------
res: Standard_Transient

Returns
-------
None
") AddResult;
		void AddResult(const opencascade::handle<Standard_Transient> & res);

		/****************** IsMultiple ******************/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsMultiple;
		virtual Standard_Boolean IsMultiple();

		/****************** NbTransients ******************/
		%feature("compactdefaultargs") NbTransients;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbTransients;
		Standard_Integer NbTransients();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") Result;
		opencascade::handle<TColStd_HSequenceOfTransient> Result();

		/****************** ResultType ******************/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Standard_Type>
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****************** ResultTypeName ******************/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") ResultTypeName;
		const char * ResultTypeName();

		/****************** SetResult ******************/
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "Changes an already defined sub-result.

Parameters
----------
num: int
res: Standard_Transient

Returns
-------
None
") SetResult;
		void SetResult(const Standard_Integer num, const opencascade::handle<Standard_Transient> & res);

		/****************** Transient ******************/
		%feature("compactdefaultargs") Transient;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Standard_Transient>
") Transient;
		const opencascade::handle<Standard_Transient> & Transient(const Standard_Integer num);

};


%make_alias(Transfer_TransientListBinder)

%extend Transfer_TransientListBinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Transfer_TransientMapper *
*********************************/
class Transfer_TransientMapper : public Transfer_Finder {
	public:
		/****************** Transfer_TransientMapper ******************/
		%feature("compactdefaultargs") Transfer_TransientMapper;
		%feature("autodoc", "Creates a mapper with a value. this value can then not be changed. it is used by the hasher to compute the hashcode, which will then be stored for an immediate reading.

Parameters
----------
akey: Standard_Transient

Returns
-------
None
") Transfer_TransientMapper;
		 Transfer_TransientMapper(const opencascade::handle<Standard_Transient> & akey);

		/****************** Equates ******************/
		%feature("compactdefaultargs") Equates;
		%feature("autodoc", "Specific testof equallity : defined as false if <other> has not the same true type, else contents are compared (by c++ operator ==).

Parameters
----------
other: Transfer_Finder

Returns
-------
bool
") Equates;
		Standard_Boolean Equates(const opencascade::handle<Transfer_Finder> & other);

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


%make_alias(Transfer_TransientMapper)

%extend Transfer_TransientMapper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Transfer_TransientProcess *
**********************************/
class Transfer_TransientProcess : public Transfer_ProcessForTransient {
	public:
		/****************** Transfer_TransientProcess ******************/
		%feature("compactdefaultargs") Transfer_TransientProcess;
		%feature("autodoc", "Sets transientprocess at initial state, with an initial size.

Parameters
----------
nb: int,optional
	default value is 10000

Returns
-------
None
") Transfer_TransientProcess;
		 Transfer_TransientProcess(const Standard_Integer nb = 10000);

		/****************** CheckNum ******************/
		%feature("compactdefaultargs") CheckNum;
		%feature("autodoc", "Specific number of a starting object for check-list : number in model.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CheckNum;
		virtual Standard_Integer CheckNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns (modifiable) the whole definition of context rather for internal use (ex.: preparing and setting in once).

Returns
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>
") Context;
		NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & Context();

		/****************** GetContext ******************/
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "Returns the context attached to a name, if set and if it is kind of the type, else a null handle returns true if ok, false if no context.

Parameters
----------
name: char *
type: Standard_Type
ctx: Standard_Transient

Returns
-------
bool
") GetContext;
		Standard_Boolean GetContext(const char * name, const opencascade::handle<Standard_Type> & type, opencascade::handle<Standard_Transient> & ctx);

		/****************** Graph ******************/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "No available documentation.

Returns
-------
Interface_Graph
") Graph;
		const Interface_Graph & Graph();

		/****************** HGraph ******************/
		%feature("compactdefaultargs") HGraph;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Interface_HGraph>
") HGraph;
		opencascade::handle<Interface_HGraph> HGraph();

		/****************** HasGraph ******************/
		%feature("compactdefaultargs") HasGraph;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasGraph;
		Standard_Boolean HasGraph();

		/****************** IsDataFail ******************/
		%feature("compactdefaultargs") IsDataFail;
		%feature("autodoc", "Tells if an entity fails on data checking (load time, syntactic, or semantic check). normally, should answer false. it is not prudent to try transferring an entity which fails on data checking.

Parameters
----------
ent: Standard_Transient

Returns
-------
bool
") IsDataFail;
		Standard_Boolean IsDataFail(const opencascade::handle<Standard_Transient> & ent);

		/****************** IsDataLoaded ******************/
		%feature("compactdefaultargs") IsDataLoaded;
		%feature("autodoc", "Tells if an entity is well loaded from file (even if its data fail on checking, they are present). mostly often, answers true. else, there was a syntactic error in the file. a non-loaded entity may not be transferred, unless its report (in the model) is interpreted.

Parameters
----------
ent: Standard_Transient

Returns
-------
bool
") IsDataLoaded;
		Standard_Boolean IsDataLoaded(const opencascade::handle<Standard_Transient> & ent);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model used for starttrace.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** PrintStats ******************/
		%feature("compactdefaultargs") PrintStats;
		%feature("autodoc", "Prints statistics on a given output, according mode.

Parameters
----------
mode: int
S: Message_Messenger

Returns
-------
None
") PrintStats;
		void PrintStats(const Standard_Integer mode, const opencascade::handle<Message_Messenger> & S);

		/****************** PrintTrace ******************/
		%feature("compactdefaultargs") PrintTrace;
		%feature("autodoc", "Specific printing to trace an entity : prints label and type (if model is set).

Parameters
----------
start: Standard_Transient
S: Message_Messenger

Returns
-------
None
") PrintTrace;
		virtual void PrintTrace(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Message_Messenger> & S);

		/****************** RootsForTransfer ******************/
		%feature("compactdefaultargs") RootsForTransfer;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") RootsForTransfer;
		opencascade::handle<TColStd_HSequenceOfTransient> RootsForTransfer();

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Sets a context : according to receiving appli, to be interpreted by the actor.

Parameters
----------
name: char *
ctx: Standard_Transient

Returns
-------
None
") SetContext;
		void SetContext(const char * name, const opencascade::handle<Standard_Transient> & ctx);

		/****************** SetGraph ******************/
		%feature("compactdefaultargs") SetGraph;
		%feature("autodoc", "Sets a graph : superseedes setmodel if already done.

Parameters
----------
HG: Interface_HGraph

Returns
-------
None
") SetGraph;
		void SetGraph(const opencascade::handle<Interface_HGraph> & HG);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "Sets an interfacemodel, used by starttrace, checklist, queries on integrity, to give informations significant for each norm.

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
None
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** TypedSharings ******************/
		%feature("compactdefaultargs") TypedSharings;
		%feature("autodoc", "Returns the list of sharings entities, at any level, which are kind of a given type. calls typedsharings from graph returns an empty list if the graph has not been aknowledged.

Parameters
----------
start: Standard_Transient
type: Standard_Type

Returns
-------
Interface_EntityIterator
") TypedSharings;
		Interface_EntityIterator TypedSharings(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Standard_Type> & type);

};


%make_alias(Transfer_TransientProcess)

%extend Transfer_TransientProcess {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Transfer_VoidBinder *
****************************/
class Transfer_VoidBinder : public Transfer_Binder {
	public:
		/****************** Transfer_VoidBinder ******************/
		%feature("compactdefaultargs") Transfer_VoidBinder;
		%feature("autodoc", "A voidbinder is not multiple (remark : it is not simple too) but it can bring next results ...

Returns
-------
None
") Transfer_VoidBinder;
		 Transfer_VoidBinder();

		/****************** ResultType ******************/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "While a voidbinder admits no result, its resulttype returns the type of <self>.

Returns
-------
opencascade::handle<Standard_Type>
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****************** ResultTypeName ******************/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Returns '(void)'.

Returns
-------
char *
") ResultTypeName;
		const char * ResultTypeName();

};


%make_alias(Transfer_VoidBinder)

%extend Transfer_VoidBinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Transfer_ActorDispatch *
*******************************/
class Transfer_ActorDispatch : public Transfer_ActorOfTransientProcess {
	public:
		/****************** Transfer_ActorDispatch ******************/
		%feature("compactdefaultargs") Transfer_ActorDispatch;
		%feature("autodoc", "Creates an actordispatch from a model. works with a general service library, given as an argument this causes transferdispatch and its transientprocess to be created, with default actor <self>.

Parameters
----------
amodel: Interface_InterfaceModel
lib: Interface_GeneralLib

Returns
-------
None
") Transfer_ActorDispatch;
		 Transfer_ActorDispatch(const opencascade::handle<Interface_InterfaceModel> & amodel, const Interface_GeneralLib & lib);

		/****************** Transfer_ActorDispatch ******************/
		%feature("compactdefaultargs") Transfer_ActorDispatch;
		%feature("autodoc", "Same as above, but library is defined through a protocol.

Parameters
----------
amodel: Interface_InterfaceModel
protocol: Interface_Protocol

Returns
-------
None
") Transfer_ActorDispatch;
		 Transfer_ActorDispatch(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & protocol);

		/****************** Transfer_ActorDispatch ******************/
		%feature("compactdefaultargs") Transfer_ActorDispatch;
		%feature("autodoc", "Same as above, but works with the active protocol.

Parameters
----------
amodel: Interface_InterfaceModel

Returns
-------
None
") Transfer_ActorDispatch;
		 Transfer_ActorDispatch(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** AddActor ******************/
		%feature("compactdefaultargs") AddActor;
		%feature("autodoc", "Utility which adds an actor to the default <self> (it calls setactor from the transientprocess).

Parameters
----------
actor: Transfer_ActorOfTransientProcess

Returns
-------
None
") AddActor;
		void AddActor(const opencascade::handle<Transfer_ActorOfTransientProcess> & actor);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "Specific action : it calls the method transfer from copytool i.e. the general service copy, then returns the binder produced by the transientprocess.

Parameters
----------
start: Standard_Transient
TP: Transfer_TransientProcess

Returns
-------
opencascade::handle<Transfer_Binder>
") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** TransferDispatch ******************/
		%feature("compactdefaultargs") TransferDispatch;
		%feature("autodoc", "Returns the transferdispatch, which does the work, records the intermediate data, etc... see transferdispatch & copytool, to see the available methods.

Returns
-------
Transfer_TransferDispatch
") TransferDispatch;
		Transfer_TransferDispatch & TransferDispatch();

};


%make_alias(Transfer_ActorDispatch)

%extend Transfer_ActorDispatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class Transfer_BinderOfTransientInteger *
******************************************/
class Transfer_BinderOfTransientInteger : public Transfer_SimpleBinderOfTransient {
	public:
		/****************** Transfer_BinderOfTransientInteger ******************/
		%feature("compactdefaultargs") Transfer_BinderOfTransientInteger;
		%feature("autodoc", "Creates an empty binderoftransientinteger; default value for the integer part is zero.

Returns
-------
None
") Transfer_BinderOfTransientInteger;
		 Transfer_BinderOfTransientInteger();

		/****************** Integer ******************/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "Returns the value set for the integer part.

Returns
-------
int
") Integer;
		Standard_Integer Integer();

		/****************** SetInteger ******************/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "Sets a value for the integer part.

Parameters
----------
value: int

Returns
-------
None
") SetInteger;
		void SetInteger(const Standard_Integer value);

};


%make_alias(Transfer_BinderOfTransientInteger)

%extend Transfer_BinderOfTransientInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class Transfer_ProcessForFinder:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class Transfer_HSequenceOfBinder : public Transfer_SequenceOfBinder, public Standard_Transient {
  public:
    Transfer_HSequenceOfBinder();
    Transfer_HSequenceOfBinder(const Transfer_SequenceOfBinder& theOther);
    const Transfer_SequenceOfBinder& Sequence();
    void Append (const Transfer_SequenceOfBinder::value_type& theItem);
    void Append (Transfer_SequenceOfBinder& theSequence);
    Transfer_SequenceOfBinder& ChangeSequence();
};
%make_alias(Transfer_HSequenceOfBinder)


class Transfer_HSequenceOfFinder : public Transfer_SequenceOfFinder, public Standard_Transient {
  public:
    Transfer_HSequenceOfFinder();
    Transfer_HSequenceOfFinder(const Transfer_SequenceOfFinder& theOther);
    const Transfer_SequenceOfFinder& Sequence();
    void Append (const Transfer_SequenceOfFinder::value_type& theItem);
    void Append (Transfer_SequenceOfFinder& theSequence);
    Transfer_SequenceOfFinder& ChangeSequence();
};
%make_alias(Transfer_HSequenceOfFinder)


