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

%extend NCollection_Sequence<opencascade::handle<Transfer_Binder>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Transfer_SequenceOfFinder) NCollection_Sequence<opencascade::handle<Transfer_Finder>>;

%extend NCollection_Sequence<opencascade::handle<Transfer_Finder>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/**** md5 signature: 8e6c984da83716454314603871cb104a ****/
		%feature("compactdefaultargs") Transfer_ActorOfProcessForFinder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Transfer_ActorOfProcessForFinder;
		 Transfer_ActorOfProcessForFinder();

		/****************** IsLast ******************/
		/**** md5 signature: c5c02b95e7fdc27ff10e50bea8a37dfe ****/
		%feature("compactdefaultargs") IsLast;
		%feature("autodoc", "Returns the last status (see setlast).

Returns
-------
bool
") IsLast;
		Standard_Boolean IsLast();

		/****************** Next ******************/
		/**** md5 signature: c935e6de5132ead936cbe353d0cb562b ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the actor defined as next, or a null handle.

Returns
-------
opencascade::handle<Transfer_ActorOfProcessForFinder>
") Next;
		opencascade::handle<Transfer_ActorOfProcessForFinder> Next();

		/****************** NullResult ******************/
		/**** md5 signature: e02ea99a7200cf4f954ac79146fe413f ****/
		%feature("compactdefaultargs") NullResult;
		%feature("autodoc", "Returns a binder for no result, i.e. a null handle.

Returns
-------
opencascade::handle<Transfer_Binder>
") NullResult;
		opencascade::handle<Transfer_Binder> NullResult();

		/****************** Recognize ******************/
		/**** md5 signature: fdda053250b90625a3b286b329acd0e6 ****/
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
		/**** md5 signature: b98430590a856b85daea77920383b716 ****/
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
		/**** md5 signature: 357d6d80d1ea70ffb9e7f1d5ca7255ac ****/
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
		/**** md5 signature: cf9aab8a86c6d141a9f19ab81b3b06be ****/
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
		/**** md5 signature: 3c41d78d1eebeee46ad3f1cb847559e1 ****/
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
		/**** md5 signature: 14c09063d9885c017e3c05b3cc26bdaf ****/
		%feature("compactdefaultargs") Transfer_ActorOfProcessForTransient;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Transfer_ActorOfProcessForTransient;
		 Transfer_ActorOfProcessForTransient();

		/****************** IsLast ******************/
		/**** md5 signature: c5c02b95e7fdc27ff10e50bea8a37dfe ****/
		%feature("compactdefaultargs") IsLast;
		%feature("autodoc", "Returns the last status (see setlast).

Returns
-------
bool
") IsLast;
		Standard_Boolean IsLast();

		/****************** Next ******************/
		/**** md5 signature: e73b87337282519405d29c4bddc4ab4d ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the actor defined as next, or a null handle.

Returns
-------
opencascade::handle<Transfer_ActorOfProcessForTransient>
") Next;
		opencascade::handle<Transfer_ActorOfProcessForTransient> Next();

		/****************** NullResult ******************/
		/**** md5 signature: e02ea99a7200cf4f954ac79146fe413f ****/
		%feature("compactdefaultargs") NullResult;
		%feature("autodoc", "Returns a binder for no result, i.e. a null handle.

Returns
-------
opencascade::handle<Transfer_Binder>
") NullResult;
		opencascade::handle<Transfer_Binder> NullResult();

		/****************** Recognize ******************/
		/**** md5 signature: 21881fa70b6757786f78e5a92965e2c1 ****/
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
		/**** md5 signature: b98430590a856b85daea77920383b716 ****/
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
		/**** md5 signature: 422e503b43f8cad5eb719b8bdd24baf2 ****/
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
		/**** md5 signature: 79fa82969eaa2f0627703eab90fd64b0 ****/
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
		/**** md5 signature: 3c41d78d1eebeee46ad3f1cb847559e1 ****/
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
		/**** md5 signature: 4da0304d0675e0e43eeeae8a464c5cc0 ****/
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
		/**** md5 signature: c4d1dbf3cde88d1c0fe97dd4e1b160db ****/
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
		/**** md5 signature: 7b0d842b79cba19dac8910421687d46e ****/
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
		/**** md5 signature: 25f912471be6d6189472b3728ee8c8a0 ****/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "Returns check which stores fail messages, in order to modify it (adding messages, or replacing it).

Returns
-------
opencascade::handle<Interface_Check>
") CCheck;
		opencascade::handle<Interface_Check> CCheck();

		/****************** Check ******************/
		/**** md5 signature: b324f0f5184c97d14308315ce8d6a533 ****/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Returns check which stores fail messages note that no entity is associated in this check.

Returns
-------
opencascade::handle<Interface_Check>
") Check;
		const opencascade::handle<Interface_Check> Check();

		/****************** HasResult ******************/
		/**** md5 signature: 345d4b0f7e88f528928167976d8256d5 ****/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns true if a result is available (statusresult = defined) a unique result will be gotten by result (which must be defined in each sub-class according to result type) for a multiple result, see class multiplebinder for other case, specific access has to be forecast.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsMultiple ******************/
		/**** md5 signature: f7265f4dd0181907775998b527ac0435 ****/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Returns true if a binder has several results, either by itself or because it has next results can be defined by sub-classes.

Returns
-------
bool
") IsMultiple;
		virtual Standard_Boolean IsMultiple();

		/****************** Merge ******************/
		/**** md5 signature: 1b8206ff75c870ea0eb335e4e9e261f2 ****/
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
		/**** md5 signature: 9348b6e94723731bdfd7369e364da734 ****/
		%feature("compactdefaultargs") NextResult;
		%feature("autodoc", "Returns the next result, null if none.

Returns
-------
opencascade::handle<Transfer_Binder>
") NextResult;
		opencascade::handle<Transfer_Binder> NextResult();

		/****************** ResultType ******************/
		/**** md5 signature: ab5fb57ad3f62d92bd05bdc8355cd533 ****/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Returns the type which characterizes the result (if known).

Returns
-------
opencascade::handle<Standard_Type>
") ResultType;
		virtual opencascade::handle<Standard_Type> ResultType();

		/****************** ResultTypeName ******************/
		/**** md5 signature: 38fba6b08ecfdb5389d6ec3483bf3d6b ****/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Returns the name of the type which characterizes the result can be returned even if resulttype itself is unknown.

Returns
-------
char *
") ResultTypeName;
		virtual const char * ResultTypeName();

		/****************** SetAlreadyUsed ******************/
		/**** md5 signature: da162a2fbf7d2c14d95e7b85fe8c2275 ****/
		%feature("compactdefaultargs") SetAlreadyUsed;
		%feature("autodoc", "Declares that result is now used by another one, it means that it cannot be modified (by rebind).

Returns
-------
None
") SetAlreadyUsed;
		void SetAlreadyUsed();

		/****************** SetStatusExec ******************/
		/**** md5 signature: 50ba49bbb850ce57d41cfe1dc06f076e ****/
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
		/**** md5 signature: 0d8fd839ccfcca8f1b040fc192113715 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns status, which can be initial (not yet done), made (a result is recorded, not yet shared), used (it is shared and cannot be modified).

Returns
-------
Transfer_StatusResult
") Status;
		Transfer_StatusResult Status();

		/****************** StatusExec ******************/
		/**** md5 signature: bc80a785b9df228c69ab57600a21eb85 ****/
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
		/**** md5 signature: 1f48b35507cb82a12d094f11795b8ad5 ****/
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
		/**** md5 signature: 6b8123ff1b872cf7eccc6ee384405fb1 ****/
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
		/**** md5 signature: 04e06e275d2bf51a1788968453d01f4e ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list of copied results.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Search ******************/
		/**** md5 signature: 525f5a6e060d9bc49aafdc8e913d57c5 ****/
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
		/**** md5 signature: 8bd242b2c84ceecc600e7dcca67e7484 ****/
		%feature("compactdefaultargs") StartingModel;
		%feature("autodoc", "Returns the model from which the transfer is to be done.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") StartingModel;
		const opencascade::handle<Interface_InterfaceModel> & StartingModel();

		/****************** TransientProcess ******************/
		/**** md5 signature: 0d1e45ead605e0700d65c1f7838e32c2 ****/
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
		/**** md5 signature: 1abd55acd1294120566671207b2f009c ****/
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
		/**** md5 signature: ca64cb1ad49afab41adb3682d1ade24a ****/
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
		/**** md5 signature: 91acc7815878cd2f4a493ea7669a3fe0 ****/
		%feature("compactdefaultargs") AttrList;
		%feature("autodoc", "Returns the exhaustive list of attributes.

Returns
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>
") AttrList;
		NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & AttrList();

		/****************** Attribute ******************/
		/**** md5 signature: e5ad5be0e92752a0fdb049be9d57b2a2 ****/
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
		/**** md5 signature: ebecc9f18283c7073dbc9ff9e987f2ae ****/
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
		/**** md5 signature: c23eeb6738a5a3b9c168de5c90033b61 ****/
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
		/**** md5 signature: 2600862f8c38b03a0506b6b2c2a55c2a ****/
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
		/**** md5 signature: bff72276a4c4e09c342f668ee3cdf337 ****/
		%feature("compactdefaultargs") GetHashCode;
		%feature("autodoc", "Returns the hashcode which has been stored by sethashcode (remark that hashcode could be deferred then be defined by sub-classes, the result is the same).

Returns
-------
int
") GetHashCode;
		Standard_Integer GetHashCode();

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
		/**** md5 signature: 270660a3d80d1ea22a91fae883e90d14 ****/
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
		/**** md5 signature: b67b0a319d4bb2d6ca1c7d515ccc27a9 ****/
		%feature("compactdefaultargs") Transfer_MapContainer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Transfer_MapContainer;
		 Transfer_MapContainer();

		/****************** GetMapObjects ******************/
		/**** md5 signature: b78e42301b73ffbcdd944f891ef37929 ****/
		%feature("compactdefaultargs") GetMapObjects;
		%feature("autodoc", "Get map already translated geometry objects.

Returns
-------
TColStd_DataMapOfTransientTransient
") GetMapObjects;
		TColStd_DataMapOfTransientTransient & GetMapObjects();

		/****************** SetMapObjects ******************/
		/**** md5 signature: 42b12546d44c4134360d0249d249c527 ****/
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
		/**** md5 signature: c79c4a6f922b540d45457c332ef67290 ****/
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
		/**** md5 signature: 08d1e19e4f9bb742f2b56d2f39bd884c ****/
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
		/**** md5 signature: 83a1f95395dc879f57c81c4d201c078d ****/
		%feature("compactdefaultargs") AbnormalResult;
		%feature("autodoc", "Returns binders which are neither 'done' nor 'initial', that is error,loop or run (abnormal states at end of transfer) starting objects are given in correspondance in the iterator.

Returns
-------
Transfer_IteratorOfProcessForTransient
") AbnormalResult;
		Transfer_IteratorOfProcessForTransient AbnormalResult();

		/****************** Actor ******************/
		/**** md5 signature: df2ebaaedc9ec93e08a548c3e1f4da11 ****/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Returns the defined actor. returns a null handle if not set.

Returns
-------
opencascade::handle<Transfer_ActorOfProcessForTransient>
") Actor;
		opencascade::handle<Transfer_ActorOfProcessForTransient> Actor();

		/****************** AddError ******************/
		/**** md5 signature: 964f0677a127bf5448523bd1e2fa9bbd ****/
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
		/**** md5 signature: 9795f5c11159dce99f638412f8744dee ****/
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
		/**** md5 signature: 6b0d3fec2a52085b81fbdbfe16aef486 ****/
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
		/**** md5 signature: f39f85f6866e511f6f4b8239a808d7e3 ****/
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
		/**** md5 signature: 988f49b1d5bd3bf018afd5790e28b086 ****/
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
		/**** md5 signature: bc3b2f4ee089d893bd2b7716390affae ****/
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
		/**** md5 signature: bf73e24e506125d3d9de2fea95969610 ****/
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
		/**** md5 signature: c447327618698dc54ddfbab057e8dd75 ****/
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
		/**** md5 signature: 3f71962535ec43902228ab6280cedca8 ****/
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
		/**** md5 signature: 966e2a0b8c0a8863c7f85aafb48c01b9 ****/
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
		/**** md5 signature: 4327fcc13c13f870f552e6873782ea4e ****/
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
		/**** md5 signature: 4a76bac661d5184a7fa791306eb73b5f ****/
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
		/**** md5 signature: a6e945ebd9ab29fdd3875d21dd4e19ce ****/
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
		/**** md5 signature: 2b06aa6e249aa983252ec57e01a88d51 ****/
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "Rebuilds the map and the roots to really remove unbound items because unbind keeps the entity in place, even if not bound hence, working by checking new items is meaningless if a formerly unbound item is rebound.

Returns
-------
None
") Clean;
		void Clean();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Resets a transferprocess as ready for a completely new work. clears general data (roots) and the map.

Returns
-------
None
") Clear;
		void Clear();

		/****************** CompleteResult ******************/
		/**** md5 signature: cdd116bbcf7ed573c06d1f2aa037184b ****/
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
		/**** md5 signature: 8cd52cc3593d14fa4239b9d171ad1cc0 ****/
		%feature("compactdefaultargs") ErrorHandle;
		%feature("autodoc", "Returns error handling flag.

Returns
-------
bool
") ErrorHandle;
		Standard_Boolean ErrorHandle();

		/****************** Find ******************/
		/**** md5 signature: 4b1db88dfdd7187936e0a00f627e0355 ****/
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
		/**** md5 signature: 33716994d9ad374a36f8b0501124baee ****/
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
		/**** md5 signature: f705c1c0bd571b1513e731698548de36 ****/
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
		/**** md5 signature: a092fef204d5075bf57172da498095b0 ****/
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
		/**** md5 signature: 5ccd431fdaac188bfde6910f9c87adba ****/
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "Gets progress indicator.

Returns
-------
opencascade::handle<Message_ProgressIndicator>
") GetProgress;
		opencascade::handle<Message_ProgressIndicator> GetProgress();

		/****************** GetTypedTransient ******************/
		/**** md5 signature: 6e9af0349f441e7b5ef9d474e02e3af3 ****/
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
		/**** md5 signature: dacef323e0776ce75d3126c178c4347c ****/
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
		/**** md5 signature: d65f302b06f5a51e9a0ec9a49de93450 ****/
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
		/**** md5 signature: 7426a34e4b9432928d7b687b83017635 ****/
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
		/**** md5 signature: d40d7d099f2445cb01310e029b0dd3e8 ****/
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
		/**** md5 signature: 6b6fdf8f30ea73356a799dd420a662a3 ****/
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
		/**** md5 signature: 5f31c62024685b4d7aed94e812e584a3 ****/
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
		/**** md5 signature: d8895545f89e9e7068cd850cead74673 ****/
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
		/**** md5 signature: f0a439e76b2264f8c1afe70d021eed6d ****/
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
		/**** md5 signature: c51845cdafadb143338935f519a3d7c7 ****/
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "Returns messenger used for outputting messages. the returned object is guaranteed to be non-null; default is message::messenger().

Returns
-------
opencascade::handle<Message_Messenger>
") Messenger;
		opencascade::handle<Message_Messenger> Messenger();

		/****************** NbMapped ******************/
		/**** md5 signature: a11c288784ccf3ab5a7694b4a5ba48b6 ****/
		%feature("compactdefaultargs") NbMapped;
		%feature("autodoc", "Returns the maximum possible value for map index (no result can be bound with a value greater than it).

Returns
-------
int
") NbMapped;
		Standard_Integer NbMapped();

		/****************** NbRoots ******************/
		/**** md5 signature: d23dc5b5f7fe61d6b998e72ba9eb27b3 ****/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "Returns the count of recorded roots.

Returns
-------
int
") NbRoots;
		Standard_Integer NbRoots();

		/****************** NestingLevel ******************/
		/**** md5 signature: c7c3ad64a816ebfb4ee26d6fedec1d74 ****/
		%feature("compactdefaultargs") NestingLevel;
		%feature("autodoc", "Returns nesting level of transfers (managed by methods transcriptwith & co). starts to zero. if no automatic transfer is used, it remains to zero. zero means root level.

Returns
-------
int
") NestingLevel;
		Standard_Integer NestingLevel();

		/****************** PrintTrace ******************/
		/**** md5 signature: 524b4b5143f5b7272d2c3f9f207d57e8 ****/
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
		/**** md5 signature: e57d830e06b8d133bb4caf4c620470a2 ****/
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
		/**** md5 signature: e23945c2db95d9c698a143374250e68e ****/
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
		/**** md5 signature: 53f7f36f61702374663ef90eb775010c ****/
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
		/**** md5 signature: fccac8107b781d03299e78e280fddae3 ****/
		%feature("compactdefaultargs") ResetNestingLevel;
		%feature("autodoc", "Resets nesting level of transfers to zero (root level), whatever its current value.

Returns
-------
None
") ResetNestingLevel;
		void ResetNestingLevel();

		/****************** Resize ******************/
		/**** md5 signature: ebe4063391e94c8a79c7ae789ec49dd6 ****/
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
		/**** md5 signature: 701a5d7142af9dadfb756e80b076b539 ****/
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
		/**** md5 signature: f8a933ff1567e74f038f01f1e6f35af9 ****/
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
		/**** md5 signature: 04f4903bfd92b2823564e0b7ed401e44 ****/
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
		/**** md5 signature: b07d66c4854cca1612fa392e6949c308 ****/
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
		/**** md5 signature: 0a0e61f56d5a609830fa57636a74d5b9 ****/
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
		/**** md5 signature: d32875c652ac12b94f5494c8a6909e18 ****/
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
		/**** md5 signature: 110e19651ba98c9b48fe9ab918091abf ****/
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
		/**** md5 signature: ba2cf32029cee904163d9bc8ed5139ff ****/
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
		/**** md5 signature: ad69a99f7d9cae16ffa3fbb2dde0adee ****/
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
		/**** md5 signature: cea15a20003832113608c312ef431fa6 ****/
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
		/**** md5 signature: a9749da4085afccb49a47ccebbb86045 ****/
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
		/**** md5 signature: a84d4cba9281e377406d50b9d58fab3b ****/
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
		/**** md5 signature: 5a99d27cd967ef7f92acd7016203a0df ****/
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
		/**** md5 signature: f00b393b03802497e86faa83a981372a ****/
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
		/**** md5 signature: b2d3fab409a6e2832ea6fb56a22812c1 ****/
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
		/**** md5 signature: b740b16f2bf8b249951768f7a3a02cf8 ****/
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
		/**** md5 signature: 71a5f63811c28c261ef1f9e77d8b2618 ****/
		%feature("compactdefaultargs") TraceLevel;
		%feature("autodoc", "Returns trace level used for outputting messages.

Returns
-------
int
") TraceLevel;
		Standard_Integer TraceLevel();

		/****************** Transfer ******************/
		/**** md5 signature: be7772fb2a360e69deb51b0dc9dbd081 ****/
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
		/**** md5 signature: 091592a2b036349ad9128a2ec50f0c34 ****/
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
		/**** md5 signature: 68606943e62848e312bd09ef2c626c47 ****/
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
		/**** md5 signature: 86b3c4120f76ae1b9b78bddf7bfd580b ****/
		%feature("compactdefaultargs") Transfer_ResultFromModel;
		%feature("autodoc", "Creates a resultfrommodel, empty.

Returns
-------
None
") Transfer_ResultFromModel;
		 Transfer_ResultFromModel();

		/****************** CheckList ******************/
		/**** md5 signature: a722cb68ab0a4d43a4bdfa4e46a07b58 ****/
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
		/**** md5 signature: 435b2628f8f9bb8fdcca0c0ecf453f08 ****/
		%feature("compactdefaultargs") CheckStatus;
		%feature("autodoc", "Returns the check status with corresponds to the content of this resultfrommodel; considers all levels of transfer (worst status). returns checkany if not yet computed reads it from recorded status if already computed, else recomputes one.

Returns
-------
Interface_CheckStatus
") CheckStatus;
		Interface_CheckStatus CheckStatus();

		/****************** CheckedList ******************/
		/**** md5 signature: 3cd3620ff5cdabbb428a24f5fa698607 ****/
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
		/**** md5 signature: 5a4c69d05791fe7284103b8b3ecb9c62 ****/
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
		/**** md5 signature: 85b6394bcac5e528aa5809d0c9e6d178 ****/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Returns starting file name (empty if not set).

Returns
-------
char *
") FileName;
		const char * FileName();

		/****************** Fill ******************/
		/**** md5 signature: 4b4edb201c233e76456aea2eb36c64a5 ****/
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
		/**** md5 signature: 8b4ef4bf5c68841052668acfafa83b62 ****/
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
		/**** md5 signature: 345d4b0f7e88f528928167976d8256d5 ****/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns true if a result is recorded.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** MainLabel ******************/
		/**** md5 signature: 89e5e795f3552e1c3474b97f7ba51e15 ****/
		%feature("compactdefaultargs") MainLabel;
		%feature("autodoc", "Returns the label in starting model attached to main entity (updated by fill or setmainresult, if model is known).

Returns
-------
char *
") MainLabel;
		const char * MainLabel();

		/****************** MainNumber ******************/
		/**** md5 signature: c7812d4aa5ac295ddd43bdd4ac8f1ead ****/
		%feature("compactdefaultargs") MainNumber;
		%feature("autodoc", "Returns the label in starting model attached to main entity.

Returns
-------
int
") MainNumber;
		Standard_Integer MainNumber();

		/****************** MainResult ******************/
		/**** md5 signature: a0a50a6aeb66f0640f3a596d505a9580 ****/
		%feature("compactdefaultargs") MainResult;
		%feature("autodoc", "Returns the main recorded resultfromtransient, or a null.

Returns
-------
opencascade::handle<Transfer_ResultFromTransient>
") MainResult;
		opencascade::handle<Transfer_ResultFromTransient> MainResult();

		/****************** Model ******************/
		/**** md5 signature: aa6e85fbf0fa37084c702759534fae8b ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns starting model (null if not set).

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** ResultFromKey ******************/
		/**** md5 signature: faee4631c279d10c40033a6e68529cb4 ****/
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
		/**** md5 signature: b4649f6d18c464f3f93aadeada3e7d81 ****/
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
		/**** md5 signature: 01264eab651f24a03fa095140833c1e6 ****/
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
		/**** md5 signature: 65dcc5167fc4eed0bd35bdb86cf0bae5 ****/
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
		/**** md5 signature: 70328a97cec44e457500ce3b002efc49 ****/
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
		/**** md5 signature: 44b7ddebb6940cf6f9077520c82b7817 ****/
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
		/**** md5 signature: c57abe5750523fa9c76e621d52245f34 ****/
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
		/**** md5 signature: b65f16aa0a33f9ee3fefcc03f2efaa09 ****/
		%feature("compactdefaultargs") Transfer_ResultFromTransient;
		%feature("autodoc", "Creates a resultfromtransient, empty.

Returns
-------
None
") Transfer_ResultFromTransient;
		 Transfer_ResultFromTransient();

		/****************** AddSubResult ******************/
		/**** md5 signature: 886b3d930bb307f552d4093b80373aed ****/
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
		/**** md5 signature: c455fbd6c51c1b2aca4dda866aaa784a ****/
		%feature("compactdefaultargs") Binder;
		%feature("autodoc", "Returns the binder.

Returns
-------
opencascade::handle<Transfer_Binder>
") Binder;
		opencascade::handle<Transfer_Binder> Binder();

		/****************** Check ******************/
		/**** md5 signature: b324f0f5184c97d14308315ce8d6a533 ****/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Returns the check (or an empty one if no binder).

Returns
-------
opencascade::handle<Interface_Check>
") Check;
		const opencascade::handle<Interface_Check> Check();

		/****************** CheckStatus ******************/
		/**** md5 signature: 435b2628f8f9bb8fdcca0c0ecf453f08 ****/
		%feature("compactdefaultargs") CheckStatus;
		%feature("autodoc", "Returns the check status.

Returns
-------
Interface_CheckStatus
") CheckStatus;
		Interface_CheckStatus CheckStatus();

		/****************** ClearSubs ******************/
		/**** md5 signature: b2f34bd33bc0c64da59a60de8fa03aba ****/
		%feature("compactdefaultargs") ClearSubs;
		%feature("autodoc", "Clears the list of (immediate) sub-results.

Returns
-------
None
") ClearSubs;
		void ClearSubs();

		/****************** Fill ******************/
		/**** md5 signature: 735772e116add5578a8805b8bd64ee4f ****/
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
		/**** md5 signature: 8b4ef4bf5c68841052668acfafa83b62 ****/
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
		/**** md5 signature: 7ecb2a15540f8a1459eef96b7bd7b5d3 ****/
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
		/**** md5 signature: 345d4b0f7e88f528928167976d8256d5 ****/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns true if a result is recorded.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** NbSubResults ******************/
		/**** md5 signature: 7d56bac3eea8a906a9dce0b236c3ab49 ****/
		%feature("compactdefaultargs") NbSubResults;
		%feature("autodoc", "Returns the count of recorded sub-results.

Returns
-------
int
") NbSubResults;
		Standard_Integer NbSubResults();

		/****************** ResultFromKey ******************/
		/**** md5 signature: 02fa96c7e49342a8237d57a19dbe007f ****/
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
		/**** md5 signature: 30383b14fb37fc48f3ef7bec1a62300c ****/
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
		/**** md5 signature: 45fd919f572141296eb48e05b1b6b4ed ****/
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
		/**** md5 signature: c32fb6226af227c40c2acdfda7f56a5b ****/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Returns the starting entity.

Returns
-------
opencascade::handle<Standard_Transient>
") Start;
		opencascade::handle<Standard_Transient> Start();

		/****************** Strip ******************/
		/**** md5 signature: 4e5d87f245ebfb5ab5077fbccee31377 ****/
		%feature("compactdefaultargs") Strip;
		%feature("autodoc", "Clears some data attached to binders used by transientprocess, which become useless once the transfer has been done : the list of sub-scoped binders, which is now recorded as sub-results.

Returns
-------
None
") Strip;
		void Strip();

		/****************** SubResult ******************/
		/**** md5 signature: fb024d959d50cb4a0e4994637b0d0ba8 ****/
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
		/**** md5 signature: c9b164781c18f7824c36fc83469acb50 ****/
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
		/**** md5 signature: 3ced86f31251498b6c7321d7f03c4479 ****/
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
		/**** md5 signature: aee8a2ddf46a7ec2ba2142b905802fb2 ****/
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
		/**** md5 signature: aa3dd3e372c9a6a86dd959e12d7e676b ****/
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
		/**** md5 signature: cda5aa33365159e82c6213003de44419 ****/
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
		/**** md5 signature: 55bb1c114579a47a6c9181979110ec4b ****/
		%feature("compactdefaultargs") Transfer_TransferInput;
		%feature("autodoc", "Creates a transferinput ready to use.

Returns
-------
None
") Transfer_TransferInput;
		 Transfer_TransferInput();

		/****************** Entities ******************/
		/**** md5 signature: 5db3b76609b964e68d9effb3c627f015 ****/
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
		/**** md5 signature: 481a8d7525eabb66fbaf189195b4a71e ****/
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
		/**** md5 signature: c393e76b94aead8744d8bcd81893dc4b ****/
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
		/**** md5 signature: 5cb1480fcd475f430063f778828cd013 ****/
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
		/**** md5 signature: c1bd0a25ad5e5f15b1a8e849cee73f86 ****/
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
		/**** md5 signature: 134d41c70233bac7a2658e98df51d73b ****/
		%feature("compactdefaultargs") Transfer_TransferIterator;
		%feature("autodoc", "Creates an empty iterator.

Returns
-------
None
") Transfer_TransferIterator;
		 Transfer_TransferIterator();

		/****************** AddItem ******************/
		/**** md5 signature: ffb50f9c2fd650a44d5f10516435f6e7 ****/
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
		/**** md5 signature: b324f0f5184c97d14308315ce8d6a533 ****/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Returns check associated to current binder (in case of error, it brings fail messages) (in case of warnings, it brings warning messages).

Returns
-------
opencascade::handle<Interface_Check>
") Check;
		const opencascade::handle<Interface_Check> Check();

		/****************** HasFails ******************/
		/**** md5 signature: f3563bd9efac596467be81f4a575a861 ****/
		%feature("compactdefaultargs") HasFails;
		%feature("autodoc", "Returns true if fail messages are recorded with the current binder. they can then be read through check (see below).

Returns
-------
bool
") HasFails;
		Standard_Boolean HasFails();

		/****************** HasResult ******************/
		/**** md5 signature: 345d4b0f7e88f528928167976d8256d5 ****/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns true if current item brings a result, transient (handle) or not or multiple. that is to say, if it corresponds to a normally acheived transfer, transient result is read by specific transientresult below. other kind of result must be read specifically from its binder.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** HasTransientResult ******************/
		/**** md5 signature: 54761d2e0d5d1752a81a9f361037869d ****/
		%feature("compactdefaultargs") HasTransientResult;
		%feature("autodoc", "Returns true if the current item has a transient unique result (if yes, use transientresult to get it).

Returns
-------
bool
") HasTransientResult;
		Standard_Boolean HasTransientResult();

		/****************** HasUniqueResult ******************/
		/**** md5 signature: 6740e85ed519d6758e40ab150f6cf865 ****/
		%feature("compactdefaultargs") HasUniqueResult;
		%feature("autodoc", "Returns true if current item has a unique result.

Returns
-------
bool
") HasUniqueResult;
		Standard_Boolean HasUniqueResult();

		/****************** HasWarnings ******************/
		/**** md5 signature: 62eec0bc4f8c89e1937e6ebe5c890272 ****/
		%feature("compactdefaultargs") HasWarnings;
		%feature("autodoc", "Returns true if warning messages are recorded with the current binder. they can then be read through check (see below).

Returns
-------
bool
") HasWarnings;
		Standard_Boolean HasWarnings();

		/****************** More ******************/
		/**** md5 signature: f2144011648ae849666b28430a27a0ea ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there are other items to iterate.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Sets iteration to the next item.

Returns
-------
None
") Next;
		void Next();

		/****************** Number ******************/
		/**** md5 signature: 0049d1350ba9feffbbe0d130f3765410 ****/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Returns count of binders to be iterated.

Returns
-------
int
") Number;
		Standard_Integer Number();

		/****************** ResultType ******************/
		/**** md5 signature: 05a6797793486e19cd94de53a53b0ad7 ****/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Returns the type of the result of the current item, if unique. if no unique result (error transfert or multiple result), returns a null handle the type is : the dynamic type for a transient result, the type defined by the binder class else.

Returns
-------
opencascade::handle<Standard_Type>
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****************** SelectBinder ******************/
		/**** md5 signature: 2c82f4aa316674dfa570b7eb99d3bde0 ****/
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
		/**** md5 signature: c627e757f289a3bf535643d0f37dc088 ****/
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
		/**** md5 signature: 42d4bd1677459c3b95b15ab4e6322f93 ****/
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
		/**** md5 signature: b7f115382ea39260170d68b3cf6fa384 ****/
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
		/**** md5 signature: f8a4dbf1e6f2cec0927301856b440be5 ****/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Clears iteration in progress, to allow it to be restarted.

Returns
-------
None
") Start;
		void Start();

		/****************** Status ******************/
		/**** md5 signature: af810d21148ff7c88d270db082f6e47e ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns execution status of current binder normal transfer corresponds to statusdone.

Returns
-------
Transfer_StatusExec
") Status;
		Transfer_StatusExec Status();

		/****************** TransientResult ******************/
		/**** md5 signature: e45bdce8b328d0de242c1817ac28dff5 ****/
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "Returns the transient result of the current item if there is (else, returns a null handle) supposes that binding is done by a simplebinderoftransient.

Returns
-------
opencascade::handle<Standard_Transient>
") TransientResult;
		const opencascade::handle<Standard_Transient> & TransientResult();

		/****************** Value ******************/
		/**** md5 signature: 1c6466500ab78c129af2bec42d07824f ****/
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
		/**** md5 signature: 03fff15a0a64ec9fe2d854f50dff2096 ****/
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
		/**** md5 signature: 4b89f60255b0ac584f32262753ec1711 ****/
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
		/**** md5 signature: 4ce55ca144a32e7d7e82dc8e6e0441cc ****/
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
		/**** md5 signature: aa6e85fbf0fa37084c702759534fae8b ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the starting model.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** ModelForStatus ******************/
		/**** md5 signature: 0b2557037db5c1e870f84f83c96fdb72 ****/
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
		/**** md5 signature: 5c3e45b9b172134c67c23d29b060d914 ****/
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
		/**** md5 signature: 77bd509b40f938a06accaa8217592837 ****/
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
		/**** md5 signature: 416eb9e9ee4af1712fdacd03380b85f5 ****/
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
		/**** md5 signature: c537398ceffbe2d9af4dd00c2e450750 ****/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "Runs transfer on the roots of the interface model remark : the roots are computed with a shareflags created from the active protocol.

Returns
-------
None
") TransferRoots;
		void TransferRoots();

		/****************** TransientProcess ******************/
		/**** md5 signature: cda5aa33365159e82c6213003de44419 ****/
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
		/**** md5 signature: 7bb9ae8ae754ef772a43669f3406eaff ****/
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
		/**** md5 signature: 00c57224b7a9fe9d4c7ae94242be9c91 ****/
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
		/**** md5 signature: 98780a8107744dffbee1647ec3bf0f2d ****/
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
		/**** md5 signature: fabb0dd159d1b6f053d170196209ac73 ****/
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
		/**** md5 signature: 3d05e6bcd3d347edb7b9af49cf89d070 ****/
		%feature("compactdefaultargs") Transfer_ActorOfTransientProcess;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Transfer_ActorOfTransientProcess;
		 Transfer_ActorOfTransientProcess();

		/****************** Transfer ******************/
		/**** md5 signature: 145f7c27a8760cb8431376ebfe242e13 ****/
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
		/**** md5 signature: 38fac5bbd5dc3b1306a2c19549b08a40 ****/
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
		/**** md5 signature: 2dfc17bc3943da73bf6671935fe2df8f ****/
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
		/**** md5 signature: 6543e0b56743c35bf2edca1ce675466b ****/
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
		/**** md5 signature: aa6e85fbf0fa37084c702759534fae8b ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model which can be used for context.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** NextMappedWithAttribute ******************/
		/**** md5 signature: a8c8001b9761e03443a2cdb062e0a16f ****/
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
		/**** md5 signature: b7702c79c8fcaffc51dff783699a80ef ****/
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
		/**** md5 signature: 2dcc13edb110f69423bed09a333790ec ****/
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
		/**** md5 signature: 70328a97cec44e457500ce3b002efc49 ****/
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
		/**** md5 signature: bba75f1ee84dc872b5ce0fd3b61c5e38 ****/
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
		/**** md5 signature: d783e7a4df47396bdc8fdc69d99c7e82 ****/
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
		/**** md5 signature: f68e4cd22cf05819b22444f933cba064 ****/
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
		/**** md5 signature: 3829368d7c25902a6ca6c5f81bc0c127 ****/
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
		/**** md5 signature: 7dca65f9f52c4eef5fd7a100800ee481 ****/
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
		/**** md5 signature: 1b1bfb78f506561ca067180b234691f6 ****/
		%feature("compactdefaultargs") HasStarting;
		%feature("autodoc", "Returns true if starting object is available (defined at creation time).

Returns
-------
bool
") HasStarting;
		Standard_Boolean HasStarting();

		/****************** Starting ******************/
		/**** md5 signature: 26380a0cdbe90b58a344a44a1da254da ****/
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
		/**** md5 signature: 3479b0d136a3c3b46f3735dd63a8b7b5 ****/
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
		/**** md5 signature: f68e4cd22cf05819b22444f933cba064 ****/
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
		/**** md5 signature: 9639a2f990316f7650c07d3ad3fbcfe4 ****/
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
		/**** md5 signature: 3a3817a192dd52120e799cdbbd427069 ****/
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
		/**** md5 signature: 1b1bfb78f506561ca067180b234691f6 ****/
		%feature("compactdefaultargs") HasStarting;
		%feature("autodoc", "Returns true if starting object is available (defined at creation time).

Returns
-------
bool
") HasStarting;
		Standard_Boolean HasStarting();

		/****************** Starting ******************/
		/**** md5 signature: a57e499e7aa76b73a12df58540322b0e ****/
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
		/**** md5 signature: a7b41247ba0ca79546043ab1f3e5fb45 ****/
		%feature("compactdefaultargs") Transfer_MultipleBinder;
		%feature("autodoc", "Normal standard constructor, creates an empty multiplebinder.

Returns
-------
None
") Transfer_MultipleBinder;
		 Transfer_MultipleBinder();

		/****************** AddResult ******************/
		/**** md5 signature: 26a5caa60fcbd70186b2bf4eb98b9e52 ****/
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
		/**** md5 signature: 17145d71daab4028b6c7195d5ff772ce ****/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Returns true if a starting object is bound with several results : here, returns allways true.

Returns
-------
bool
") IsMultiple;
		virtual Standard_Boolean IsMultiple();

		/****************** MultipleResult ******************/
		/**** md5 signature: 9c5ec29750579258267602ea00ec37c5 ****/
		%feature("compactdefaultargs") MultipleResult;
		%feature("autodoc", "Returns the multiple result, if it is defined (at least one item). else, returns a null handle.

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") MultipleResult;
		opencascade::handle<TColStd_HSequenceOfTransient> MultipleResult();

		/****************** NbResults ******************/
		/**** md5 signature: d68eae21e09d79bb9e5b28df0fd8b0fd ****/
		%feature("compactdefaultargs") NbResults;
		%feature("autodoc", "Returns the actual count of recorded (transient) results.

Returns
-------
int
") NbResults;
		Standard_Integer NbResults();

		/****************** ResultType ******************/
		/**** md5 signature: 3e5db9429dee8b51366aef182b0d44a1 ****/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Returns the type permitted for results, i.e. here transient.

Returns
-------
opencascade::handle<Standard_Type>
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****************** ResultTypeName ******************/
		/**** md5 signature: 7c976254948a22ef88ad8fdce635402f ****/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Returns the name of the type which characterizes the result here, returns '(list)'.

Returns
-------
char *
") ResultTypeName;
		const char * ResultTypeName();

		/****************** ResultValue ******************/
		/**** md5 signature: b7cf2832698e64e96726045e72479981 ****/
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
		/**** md5 signature: 5172db3db7d4b82dac155e2bf0adeb18 ****/
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
		/**** md5 signature: 83ba599c048412012db5337e7fe1879c ****/
		%feature("compactdefaultargs") Transfer_SimpleBinderOfTransient;
		%feature("autodoc", "Creates an empty simplebinderoftransient returns true if a starting object is bound with several results : here, returns allways false see binder itself.

Returns
-------
None
") Transfer_SimpleBinderOfTransient;
		 Transfer_SimpleBinderOfTransient();

		/****************** GetTypedResult ******************/
		/**** md5 signature: ca1f1a878bdab3a27a7e99457abedbaa ****/
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
		/**** md5 signature: 95c161d526ef1674cc23bca685805385 ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns the defined result, if there is one.

Returns
-------
opencascade::handle<Standard_Transient>
") Result;
		const opencascade::handle<Standard_Transient> & Result();

		/****************** ResultType ******************/
		/**** md5 signature: 3e5db9429dee8b51366aef182b0d44a1 ****/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Returns the effective (dynamic) type of the result (standard_transient if no result is defined).

Returns
-------
opencascade::handle<Standard_Type>
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****************** ResultTypeName ******************/
		/**** md5 signature: 7c976254948a22ef88ad8fdce635402f ****/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Returns the effective name of (dynamic) type of the result (void) if no result is defined.

Returns
-------
char *
") ResultTypeName;
		const char * ResultTypeName();

		/****************** SetResult ******************/
		/**** md5 signature: a91ed353e0cbe1f40e4af5c64aac3b28 ****/
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
		/**** md5 signature: 985ec942a6a31b56c14a317041081ab8 ****/
		%feature("compactdefaultargs") Transfer_TransientListBinder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Transfer_TransientListBinder;
		 Transfer_TransientListBinder();

		/****************** Transfer_TransientListBinder ******************/
		/**** md5 signature: f265a0b8c24820f23ed51a427318d965 ****/
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
		/**** md5 signature: 26a5caa60fcbd70186b2bf4eb98b9e52 ****/
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
		/**** md5 signature: 17145d71daab4028b6c7195d5ff772ce ****/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsMultiple;
		virtual Standard_Boolean IsMultiple();

		/****************** NbTransients ******************/
		/**** md5 signature: 9436b9a550cdb03fdd33d4f80aca7526 ****/
		%feature("compactdefaultargs") NbTransients;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbTransients;
		Standard_Integer NbTransients();

		/****************** Result ******************/
		/**** md5 signature: 2bd6e9158d943b64479fab613acb4c84 ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") Result;
		opencascade::handle<TColStd_HSequenceOfTransient> Result();

		/****************** ResultType ******************/
		/**** md5 signature: 3e5db9429dee8b51366aef182b0d44a1 ****/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Standard_Type>
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****************** ResultTypeName ******************/
		/**** md5 signature: 7c976254948a22ef88ad8fdce635402f ****/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") ResultTypeName;
		const char * ResultTypeName();

		/****************** SetResult ******************/
		/**** md5 signature: 9b9f3aa6b0da2cde777cca0377073974 ****/
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
		/**** md5 signature: 907a24a1042c0d2e6d96d99e25c98f79 ****/
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
		/**** md5 signature: 8b03be42c0b0bd26c5f38c74de7882a5 ****/
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
		/**** md5 signature: 2bde7773554342cacb5dfc4ee8d4c0f3 ****/
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
		/**** md5 signature: e2a3c82cef0311477806faa8bed05f28 ****/
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
		/**** md5 signature: 1206215b29038b8bb2c684de751aa167 ****/
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
		/**** md5 signature: b81edf1d9ad3c29d489a2eda3dedcb1f ****/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns (modifiable) the whole definition of context rather for internal use (ex.: preparing and setting in once).

Returns
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>
") Context;
		NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & Context();

		/****************** GetContext ******************/
		/**** md5 signature: 35a3fb181b40ac50cc3276aad484d0e6 ****/
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
		/**** md5 signature: 6a234e0475ae0da1c7d268d231e44a78 ****/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "No available documentation.

Returns
-------
Interface_Graph
") Graph;
		const Interface_Graph & Graph();

		/****************** HGraph ******************/
		/**** md5 signature: f11ddef29a65063d0492ed4367a78169 ****/
		%feature("compactdefaultargs") HGraph;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Interface_HGraph>
") HGraph;
		opencascade::handle<Interface_HGraph> HGraph();

		/****************** HasGraph ******************/
		/**** md5 signature: 9e75b58a6854bcc374aebe383c2cf582 ****/
		%feature("compactdefaultargs") HasGraph;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasGraph;
		Standard_Boolean HasGraph();

		/****************** IsDataFail ******************/
		/**** md5 signature: abfb0c083f555db3379af2b0895f676c ****/
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
		/**** md5 signature: 0cfb430e098039c6765591e4d04235fd ****/
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
		/**** md5 signature: aa6e85fbf0fa37084c702759534fae8b ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model used for starttrace.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** PrintStats ******************/
		/**** md5 signature: b7702c79c8fcaffc51dff783699a80ef ****/
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
		/**** md5 signature: 2a5348ada50b5fc40de0f17e87e8d3f3 ****/
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
		/**** md5 signature: c79152a32ae4b6ec28313285c230ae8b ****/
		%feature("compactdefaultargs") RootsForTransfer;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") RootsForTransfer;
		opencascade::handle<TColStd_HSequenceOfTransient> RootsForTransfer();

		/****************** SetContext ******************/
		/**** md5 signature: 687f3566e8f038cd942291d8a4bdf6b8 ****/
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
		/**** md5 signature: c0b17a1913a1fcbe531cbabf35a93da0 ****/
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
		/**** md5 signature: 70328a97cec44e457500ce3b002efc49 ****/
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
		/**** md5 signature: 63d93577cdbacb42c1cd116ed1083072 ****/
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
		/**** md5 signature: 1e864ae9b50ee16142e62aa5c24b1ca0 ****/
		%feature("compactdefaultargs") Transfer_VoidBinder;
		%feature("autodoc", "A voidbinder is not multiple (remark : it is not simple too) but it can bring next results ...

Returns
-------
None
") Transfer_VoidBinder;
		 Transfer_VoidBinder();

		/****************** ResultType ******************/
		/**** md5 signature: 3e5db9429dee8b51366aef182b0d44a1 ****/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "While a voidbinder admits no result, its resulttype returns the type of <self>.

Returns
-------
opencascade::handle<Standard_Type>
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****************** ResultTypeName ******************/
		/**** md5 signature: 7c976254948a22ef88ad8fdce635402f ****/
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
		/**** md5 signature: 152a07092c4c6159bd1b6d4e1036cd46 ****/
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
		/**** md5 signature: eb926ba71ad0fbf6df623ff34c9ccbe0 ****/
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
		/**** md5 signature: c14d8969419bcc9b1bdd4b3c583befc3 ****/
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
		/**** md5 signature: 017fc477d6292d482b50dd07c5f26ad2 ****/
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
		/**** md5 signature: d3a576f6c6d265b51c604b4f3e7b52c0 ****/
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
		/**** md5 signature: d8c37ebfb4344c5658d80d5678e6d3a2 ****/
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
		/**** md5 signature: 75a5cfc9d6db709047a5433470ef2411 ****/
		%feature("compactdefaultargs") Transfer_BinderOfTransientInteger;
		%feature("autodoc", "Creates an empty binderoftransientinteger; default value for the integer part is zero.

Returns
-------
None
") Transfer_BinderOfTransientInteger;
		 Transfer_BinderOfTransientInteger();

		/****************** Integer ******************/
		/**** md5 signature: 5ca25bbf05344000d69837c81499cc7b ****/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "Returns the value set for the integer part.

Returns
-------
int
") Integer;
		Standard_Integer Integer();

		/****************** SetInteger ******************/
		/**** md5 signature: 511ab2dde7e3346c66a01e27176236e9 ****/
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


