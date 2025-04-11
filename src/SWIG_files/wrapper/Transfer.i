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
%define TRANSFERDOCSTRING
"Transfer module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_transfer.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<Transfer_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<Interface_module.hxx>
#include<TColStd_module.hxx>
#include<DE_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<TDF_module.hxx>
#include<IFSelect_module.hxx>
#include<TDocStd_module.hxx>
#include<XSControl_module.hxx>
#include<PCDM_module.hxx>
#include<CDF_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<Geom2d_module.hxx>
#include<TopTools_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Message.i
%import Interface.i
%import TColStd.i
%import DE.i

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

enum Transfer_StatusResult {
	Transfer_StatusVoid = 0,
	Transfer_StatusDefined = 1,
	Transfer_StatusUsed = 2,
};

enum Transfer_UndefMode {
	Transfer_UndefIgnore = 0,
	Transfer_UndefFailure = 1,
	Transfer_UndefContent = 2,
	Transfer_UndefUser = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
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

class Transfer_StatusResult(IntEnum):
	Transfer_StatusVoid = 0
	Transfer_StatusDefined = 1
	Transfer_StatusUsed = 2
Transfer_StatusVoid = Transfer_StatusResult.Transfer_StatusVoid
Transfer_StatusDefined = Transfer_StatusResult.Transfer_StatusDefined
Transfer_StatusUsed = Transfer_StatusResult.Transfer_StatusUsed

class Transfer_UndefMode(IntEnum):
	Transfer_UndefIgnore = 0
	Transfer_UndefFailure = 1
	Transfer_UndefContent = 2
	Transfer_UndefUser = 3
Transfer_UndefIgnore = Transfer_UndefMode.Transfer_UndefIgnore
Transfer_UndefFailure = Transfer_UndefMode.Transfer_UndefFailure
Transfer_UndefContent = Transfer_UndefMode.Transfer_UndefContent
Transfer_UndefUser = Transfer_UndefMode.Transfer_UndefUser
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
%template(Transfer_TransferMapOfProcessForTransient) NCollection_IndexedDataMap<opencascade::handle<Standard_Transient>,opencascade::handle<Transfer_Binder>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<opencascade::handle<Transfer_Binder>> Transfer_SequenceOfBinder;
typedef NCollection_Sequence<opencascade::handle<Transfer_Finder>> Transfer_SequenceOfFinder;
typedef NCollection_IndexedDataMap<opencascade::handle<Transfer_Finder>, opencascade::handle<Transfer_Binder>, Transfer_FindHasher> Transfer_TransferMapOfProcessForFinder;
typedef NCollection_IndexedDataMap<opencascade::handle<Standard_Transient>, opencascade::handle<Transfer_Binder>> Transfer_TransferMapOfProcessForTransient;
/* end typedefs declaration */

/*****************************************
* class Transfer_ActorOfProcessForFinder *
*****************************************/
class Transfer_ActorOfProcessForFinder : public Standard_Transient {
	public:
		/****** Transfer_ActorOfProcessForFinder::Transfer_ActorOfProcessForFinder ******/
		/****** md5 signature: 8e6c984da83716454314603871cb104a ******/
		%feature("compactdefaultargs") Transfer_ActorOfProcessForFinder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Transfer_ActorOfProcessForFinder;
		 Transfer_ActorOfProcessForFinder();

		/****** Transfer_ActorOfProcessForFinder::IsLast ******/
		/****** md5 signature: c5c02b95e7fdc27ff10e50bea8a37dfe ******/
		%feature("compactdefaultargs") IsLast;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Last status (see SetLast).
") IsLast;
		Standard_Boolean IsLast();

		/****** Transfer_ActorOfProcessForFinder::Next ******/
		/****** md5 signature: c935e6de5132ead936cbe353d0cb562b ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_ActorOfProcessForFinder>

Description
-----------
Returns the Actor defined as Next, or a Null Handle.
") Next;
		opencascade::handle<Transfer_ActorOfProcessForFinder> Next();

		/****** Transfer_ActorOfProcessForFinder::NullResult ******/
		/****** md5 signature: e02ea99a7200cf4f954ac79146fe413f ******/
		%feature("compactdefaultargs") NullResult;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
Returns a Binder for No Result, i.e. a Null Handle.
") NullResult;
		opencascade::handle<Transfer_Binder> NullResult();

		/****** Transfer_ActorOfProcessForFinder::Recognize ******/
		/****** md5 signature: fdda053250b90625a3b286b329acd0e6 ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "
Parameters
----------
start: Transfer_Finder

Return
-------
bool

Description
-----------
Prerequisite for Transfer: the method Transfer is called on a starting object only if Recognize has returned True on it This allows to define a list of Actors, each one processing a definite kind of data TransferProcess calls Recognize on each one before calling Transfer. But even if Recognize has returned True, Transfer can reject by returning a Null Binder (afterwards rejection), the next actor is then invoked //! The provided default returns True, can be redefined.
") Recognize;
		virtual Standard_Boolean Recognize(const opencascade::handle<Transfer_Finder> & start);

		/****** Transfer_ActorOfProcessForFinder::SetLast ******/
		/****** md5 signature: b98430590a856b85daea77920383b716 ******/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "
Parameters
----------
mode: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
If <mode> is True, commands an Actor to be set at the end of the list of Actors (see SetNext) If it is False (creation default), each add Actor is set at the beginning of the list This allows to define default Actors (which are Last).
") SetLast;
		void SetLast(const Standard_Boolean mode = Standard_True);

		/****** Transfer_ActorOfProcessForFinder::SetNext ******/
		/****** md5 signature: 357d6d80d1ea70ffb9e7f1d5ca7255ac ******/
		%feature("compactdefaultargs") SetNext;
		%feature("autodoc", "
Parameters
----------
next: Transfer_ActorOfProcessForFinder

Return
-------
None

Description
-----------
Defines a Next Actor: it can then be asked to work if <self> produces no result for a given type of Object. If Next is already set and is not 'Last', calls SetNext on it. If Next defined and 'Last', the new actor is added before it in the list.
") SetNext;
		void SetNext(const opencascade::handle<Transfer_ActorOfProcessForFinder> & next);

		/****** Transfer_ActorOfProcessForFinder::Transferring ******/
		/****** md5 signature: 4f53e5d5a83d9867599cfcf49344ee90 ******/
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "
Parameters
----------
start: Transfer_Finder
TP: Transfer_ProcessForFinder
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
Specific action of Transfer. The Result is stored in the returned Binder, or a Null Handle for 'No result' (Default defined as doing nothing; should be deferred) 'mutable' allows the Actor to record intermediate information, in addition to those of TransferProcess.
") Transferring;
		virtual opencascade::handle<Transfer_Binder> Transferring(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<Transfer_ProcessForFinder> & TP, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** Transfer_ActorOfProcessForFinder::TransientResult ******/
		/****** md5 signature: 3c41d78d1eebeee46ad3f1cb847559e1 ******/
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "
Parameters
----------
res: Standard_Transient

Return
-------
opencascade::handle<Transfer_SimpleBinderOfTransient>

Description
-----------
Prepares and Returns a Binder for a Transient Result Returns a Null Handle if <res> is itself Null.
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
		/****** Transfer_ActorOfProcessForTransient::Transfer_ActorOfProcessForTransient ******/
		/****** md5 signature: 14c09063d9885c017e3c05b3cc26bdaf ******/
		%feature("compactdefaultargs") Transfer_ActorOfProcessForTransient;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Transfer_ActorOfProcessForTransient;
		 Transfer_ActorOfProcessForTransient();

		/****** Transfer_ActorOfProcessForTransient::IsLast ******/
		/****** md5 signature: c5c02b95e7fdc27ff10e50bea8a37dfe ******/
		%feature("compactdefaultargs") IsLast;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Last status (see SetLast).
") IsLast;
		Standard_Boolean IsLast();

		/****** Transfer_ActorOfProcessForTransient::Next ******/
		/****** md5 signature: e73b87337282519405d29c4bddc4ab4d ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_ActorOfProcessForTransient>

Description
-----------
Returns the Actor defined as Next, or a Null Handle.
") Next;
		opencascade::handle<Transfer_ActorOfProcessForTransient> Next();

		/****** Transfer_ActorOfProcessForTransient::NullResult ******/
		/****** md5 signature: e02ea99a7200cf4f954ac79146fe413f ******/
		%feature("compactdefaultargs") NullResult;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
Returns a Binder for No Result, i.e. a Null Handle.
") NullResult;
		opencascade::handle<Transfer_Binder> NullResult();

		/****** Transfer_ActorOfProcessForTransient::Recognize ******/
		/****** md5 signature: 21881fa70b6757786f78e5a92965e2c1 ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
bool

Description
-----------
Prerequisite for Transfer: the method Transfer is called on a starting object only if Recognize has returned True on it This allows to define a list of Actors, each one processing a definite kind of data TransferProcess calls Recognize on each one before calling Transfer. But even if Recognize has returned True, Transfer can reject by returning a Null Binder (afterwards rejection), the next actor is then invoked //! The provided default returns True, can be redefined.
") Recognize;
		virtual Standard_Boolean Recognize(const opencascade::handle<Standard_Transient> & start);

		/****** Transfer_ActorOfProcessForTransient::SetLast ******/
		/****** md5 signature: b98430590a856b85daea77920383b716 ******/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "
Parameters
----------
mode: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
If <mode> is True, commands an Actor to be set at the end of the list of Actors (see SetNext) If it is False (creation default), each add Actor is set at the beginning of the list This allows to define default Actors (which are Last).
") SetLast;
		void SetLast(const Standard_Boolean mode = Standard_True);

		/****** Transfer_ActorOfProcessForTransient::SetNext ******/
		/****** md5 signature: 422e503b43f8cad5eb719b8bdd24baf2 ******/
		%feature("compactdefaultargs") SetNext;
		%feature("autodoc", "
Parameters
----------
next: Transfer_ActorOfProcessForTransient

Return
-------
None

Description
-----------
Defines a Next Actor: it can then be asked to work if <self> produces no result for a given type of Object. If Next is already set and is not 'Last', calls SetNext on it. If Next defined and 'Last', the new actor is added before it in the list.
") SetNext;
		void SetNext(const opencascade::handle<Transfer_ActorOfProcessForTransient> & next);

		/****** Transfer_ActorOfProcessForTransient::Transferring ******/
		/****** md5 signature: e31455ac7db7ffccb1c6d0fa5dff964e ******/
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
TP: Transfer_ProcessForTransient
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
Specific action of Transfer. The Result is stored in the returned Binder, or a Null Handle for 'No result' (Default defined as doing nothing; should be deferred) 'mutable' allows the Actor to record intermediate information, in addition to those of TransferProcess.
") Transferring;
		virtual opencascade::handle<Transfer_Binder> Transferring(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_ProcessForTransient> & TP, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** Transfer_ActorOfProcessForTransient::TransientResult ******/
		/****** md5 signature: 3c41d78d1eebeee46ad3f1cb847559e1 ******/
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "
Parameters
----------
res: Standard_Transient

Return
-------
opencascade::handle<Transfer_SimpleBinderOfTransient>

Description
-----------
Prepares and Returns a Binder for a Transient Result Returns a Null Handle if <res> is itself Null.
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
		/****** Transfer_Binder::AddFail ******/
		/****** md5 signature: 4da0304d0675e0e43eeeae8a464c5cc0 ******/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "
Parameters
----------
mess: str
orig: str (optional, default to "")

Return
-------
None

Description
-----------
Used to declare an individual transfer as being erroneous (Status is set to Void, StatusExec is set to Error, <errmess> is added to Check's list of Fails) It is possible to record several messages of error //! It has same effect for TransferProcess as raising an exception during the operation of Transfer, except the Transfer tries to continue (as if ErrorHandle had been set).
") AddFail;
		void AddFail(Standard_CString mess, Standard_CString orig = "");

		/****** Transfer_Binder::AddResult ******/
		/****** md5 signature: c4d1dbf3cde88d1c0fe97dd4e1b160db ******/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "
Parameters
----------
next: Transfer_Binder

Return
-------
None

Description
-----------
Adds a next result (at the end of the list) Remark: this information is not processed by Merge.
") AddResult;
		void AddResult(const opencascade::handle<Transfer_Binder> & next);

		/****** Transfer_Binder::AddWarning ******/
		/****** md5 signature: 7b0d842b79cba19dac8910421687d46e ******/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "
Parameters
----------
mess: str
orig: str (optional, default to "")

Return
-------
None

Description
-----------
Used to attach a Warning Message to an individual Transfer It has no effect on the Status.
") AddWarning;
		void AddWarning(Standard_CString mess, Standard_CString orig = "");

		/****** Transfer_Binder::CCheck ******/
		/****** md5 signature: 25f912471be6d6189472b3728ee8c8a0 ******/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns Check which stores Fail messages, in order to modify it (adding messages, or replacing it).
") CCheck;
		opencascade::handle<Interface_Check> CCheck();

		/****** Transfer_Binder::Check ******/
		/****** md5 signature: b324f0f5184c97d14308315ce8d6a533 ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns Check which stores Fail messages Note that no Entity is associated in this Check.
") Check;
		const opencascade::handle<Interface_Check> Check();

		/****** Transfer_Binder::HasResult ******/
		/****** md5 signature: 345d4b0f7e88f528928167976d8256d5 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Result is available (StatusResult = Defined) A Unique Result will be gotten by Result (which must be defined in each sub-class according to result type) For a Multiple Result, see class MultipleBinder For other case, specific access has to be forecast.
") HasResult;
		Standard_Boolean HasResult();

		/****** Transfer_Binder::IsMultiple ******/
		/****** md5 signature: f7265f4dd0181907775998b527ac0435 ******/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Binder has several results, either by itself or because it has next results Can be defined by sub-classes.
") IsMultiple;
		virtual Standard_Boolean IsMultiple();

		/****** Transfer_Binder::Merge ******/
		/****** md5 signature: 1b8206ff75c870ea0eb335e4e9e261f2 ******/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "
Parameters
----------
other: Transfer_Binder

Return
-------
None

Description
-----------
Merges basic data (Check, ExecStatus) from another Binder but keeps its result. Used when a binder is replaced by another one, this allows to keep messages.
") Merge;
		void Merge(const opencascade::handle<Transfer_Binder> & other);

		/****** Transfer_Binder::NextResult ******/
		/****** md5 signature: 9348b6e94723731bdfd7369e364da734 ******/
		%feature("compactdefaultargs") NextResult;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
Returns the next result, Null if none.
") NextResult;
		opencascade::handle<Transfer_Binder> NextResult();

		/****** Transfer_Binder::ResultType ******/
		/****** md5 signature: ab5fb57ad3f62d92bd05bdc8355cd533 ******/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the Type which characterizes the Result (if known).
") ResultType;
		virtual opencascade::handle<Standard_Type> ResultType();

		/****** Transfer_Binder::ResultTypeName ******/
		/****** md5 signature: 38fba6b08ecfdb5389d6ec3483bf3d6b ******/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the Name of the Type which characterizes the Result Can be returned even if ResultType itself is unknown.
") ResultTypeName;
		virtual Standard_CString ResultTypeName();

		/****** Transfer_Binder::SetAlreadyUsed ******/
		/****** md5 signature: da162a2fbf7d2c14d95e7b85fe8c2275 ******/
		%feature("compactdefaultargs") SetAlreadyUsed;
		%feature("autodoc", "Return
-------
None

Description
-----------
Declares that result is now used by another one, it means that it cannot be modified (by Rebind).
") SetAlreadyUsed;
		void SetAlreadyUsed();

		/****** Transfer_Binder::SetStatusExec ******/
		/****** md5 signature: 50ba49bbb850ce57d41cfe1dc06f076e ******/
		%feature("compactdefaultargs") SetStatusExec;
		%feature("autodoc", "
Parameters
----------
stat: Transfer_StatusExec

Return
-------
None

Description
-----------
Modifies execution status; called by TransferProcess only (for StatusError, rather use SetError, below).
") SetStatusExec;
		void SetStatusExec(const Transfer_StatusExec stat);

		/****** Transfer_Binder::Status ******/
		/****** md5 signature: 0d8fd839ccfcca8f1b040fc192113715 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
Transfer_StatusResult

Description
-----------
Returns status, which can be Initial (not yet done), Made (a result is recorded, not yet shared), Used (it is shared and cannot be modified).
") Status;
		Transfer_StatusResult Status();

		/****** Transfer_Binder::StatusExec ******/
		/****** md5 signature: bc80a785b9df228c69ab57600a21eb85 ******/
		%feature("compactdefaultargs") StatusExec;
		%feature("autodoc", "Return
-------
Transfer_StatusExec

Description
-----------
Returns execution status.
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
		/****** Transfer_DataInfo::Type ******/
		/****** md5 signature: 192a28917d102787dc4550e6e61c97a0 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the Type attached to an object Here, the Dynamic Type of a Transient. Null Type if unknown.
") Type;
		static opencascade::handle<Standard_Type> Type(const opencascade::handle<Standard_Transient> & ent);

		/****** Transfer_DataInfo::TypeName ******/
		/****** md5 signature: 2ed9999dd09e4008de6273d943a36227 ******/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
str

Description
-----------
Returns Type Name (string) Allows to name type of non-handled objects.
") TypeName;
		static Standard_CString TypeName(const opencascade::handle<Standard_Transient> & ent);

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
		/****** Transfer_DispatchControl::Transfer_DispatchControl ******/
		/****** md5 signature: 1f48b35507cb82a12d094f11795b8ad5 ******/
		%feature("compactdefaultargs") Transfer_DispatchControl;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel
TP: Transfer_TransientProcess

Return
-------
None

Description
-----------
Creates the DispatchControl, ready for use.
") Transfer_DispatchControl;
		 Transfer_DispatchControl(const opencascade::handle<Interface_InterfaceModel> & model, const opencascade::handle<Transfer_TransientProcess> & TP);

		/****** Transfer_DispatchControl::Bind ******/
		/****** md5 signature: 6b8123ff1b872cf7eccc6ee384405fb1 ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
res: Standard_Transient

Return
-------
None

Description
-----------
Binds a (Transient) Result to a (Transient) Starting Entity.
") Bind;
		void Bind(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Standard_Transient> & res);

		/****** Transfer_DispatchControl::Clear ******/
		/****** md5 signature: 04e06e275d2bf51a1788968453d01f4e ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the List of Copied Results.
") Clear;
		void Clear();

		/****** Transfer_DispatchControl::Search ******/
		/****** md5 signature: 525f5a6e060d9bc49aafdc8e913d57c5 ******/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient
res: Standard_Transient

Return
-------
bool

Description
-----------
Searches for the Result bound to a Starting Entity If Found, returns True and fills <res> Else, returns False and nullifies <res>.
") Search;
		Standard_Boolean Search(const opencascade::handle<Standard_Transient> & ent, opencascade::handle<Standard_Transient> & res);

		/****** Transfer_DispatchControl::StartingModel ******/
		/****** md5 signature: 8bd242b2c84ceecc600e7dcca67e7484 ******/
		%feature("compactdefaultargs") StartingModel;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the Model from which the transfer is to be done.
") StartingModel;
		const opencascade::handle<Interface_InterfaceModel> & StartingModel();

		/****** Transfer_DispatchControl::TransientProcess ******/
		/****** md5 signature: 0d1e45ead605e0700d65c1f7838e32c2 ******/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_TransientProcess>

Description
-----------
Returns the content of the DispatchControl: it can be used for a direct call, if the basic methods do not suffice.
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
		/****** Transfer_Finder::AttrList ******/
		/****** md5 signature: 91acc7815878cd2f4a493ea7669a3fe0 ******/
		%feature("compactdefaultargs") AttrList;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>

Description
-----------
Returns the exhaustive list of attributes.
") AttrList;
		NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & AttrList();

		/****** Transfer_Finder::Attribute ******/
		/****** md5 signature: e5ad5be0e92752a0fdb049be9d57b2a2 ******/
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns an attribute from its name. Null Handle if not recorded (whatever Transient, Integer, Real ...).
") Attribute;
		opencascade::handle<Standard_Transient> Attribute(Standard_CString name);

		/****** Transfer_Finder::AttributeType ******/
		/****** md5 signature: ebecc9f18283c7073dbc9ff9e987f2ae ******/
		%feature("compactdefaultargs") AttributeType;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
Interface_ParamType

Description
-----------
Returns the type of an attribute: ParamInt , ParamReal , ParamText (String) , ParamIdent (any) or ParamVoid (not recorded).
") AttributeType;
		Interface_ParamType AttributeType(Standard_CString name);

		/****** Transfer_Finder::Equates ******/
		/****** md5 signature: c23eeb6738a5a3b9c168de5c90033b61 ******/
		%feature("compactdefaultargs") Equates;
		%feature("autodoc", "
Parameters
----------
other: Transfer_Finder

Return
-------
bool

Description
-----------
Specific testof equality: to be defined by each sub-class, must be False if Finders have not the same true Type, else their contents must be compared.
") Equates;
		virtual Standard_Boolean Equates(const opencascade::handle<Transfer_Finder> & other);

		/****** Transfer_Finder::GetAttribute ******/
		/****** md5 signature: 2af91cadcf009781db910ca0a130a005 ******/
		%feature("compactdefaultargs") GetAttribute;
		%feature("autodoc", "
Parameters
----------
name: str
type: Standard_Type
val: Standard_Transient

Return
-------
bool

Description
-----------
Returns an attribute from its name, filtered by a type If no attribute has this name, or if it is not kind of this type, <val> is Null and returned value is False Else, it is True.
") GetAttribute;
		Standard_Boolean GetAttribute(Standard_CString name, const opencascade::handle<Standard_Type> & type, opencascade::handle<Standard_Transient> & val);

		/****** Transfer_Finder::GetAttributes ******/
		/****** md5 signature: 2600862f8c38b03a0506b6b2c2a55c2a ******/
		%feature("compactdefaultargs") GetAttributes;
		%feature("autodoc", "
Parameters
----------
other: Transfer_Finder
fromname: str (optional, default to "")
copied: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Gets the list of attributes from <other>, by copying it By default, considers all the attributes from <other> If <fromname> is given, considers only the attributes with name beginning by <fromname> //! For each attribute, if <copied> is True (D), its value is also copied if it is a basic type (Integer,Real,String), else it remains shared between <other> and <self> //! These new attributes are added to the existing ones in <self>, in case of same name, they replace the existing ones.
") GetAttributes;
		void GetAttributes(const opencascade::handle<Transfer_Finder> & other, Standard_CString fromname = "", const Standard_Boolean copied = Standard_True);

		/****** Transfer_Finder::GetHashCode ******/
		/****** md5 signature: 7287addabc58f18bcef75f2c632e90c4 ******/
		%feature("compactdefaultargs") GetHashCode;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Returns the HashCode which has been stored by SetHashCode (remark that HashCode could be deferred then be defined by sub-classes, the result is the same).
") GetHashCode;
		size_t GetHashCode();

		/****** Transfer_Finder::GetIntegerAttribute ******/
		/****** md5 signature: ea2fdae17b02c2aa020d84d6b452688b ******/
		%feature("compactdefaultargs") GetIntegerAttribute;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
val: int

Description
-----------
Returns an attribute from its name, as integer If no attribute has this name, or not an integer, <val> is 0 and returned value is False Else, it is True.
") GetIntegerAttribute;
		Standard_Boolean GetIntegerAttribute(Standard_CString name, Standard_Integer &OutValue);

		/****** Transfer_Finder::GetRealAttribute ******/
		/****** md5 signature: 5f2c96db8b329d634687ce67f5e59b4b ******/
		%feature("compactdefaultargs") GetRealAttribute;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
val: float

Description
-----------
Returns an attribute from its name, as real If no attribute has this name, or not a real <val> is 0.0 and returned value is False Else, it is True.
") GetRealAttribute;
		Standard_Boolean GetRealAttribute(Standard_CString name, Standard_Real &OutValue);

		/****** Transfer_Finder::GetStringAttribute ******/
		/****** md5 signature: 318a12b6d26483dacbc14b18a716e743 ******/
		%feature("compactdefaultargs") GetStringAttribute;
		%feature("autodoc", "
Parameters
----------
name: str
val: str

Return
-------
bool

Description
-----------
Returns an attribute from its name, as String If no attribute has this name, or not a String <val> is 0.0 and returned value is False Else, it is True.
") GetStringAttribute;
		Standard_Boolean GetStringAttribute(Standard_CString name, Standard_CString val);

		/****** Transfer_Finder::IntegerAttribute ******/
		/****** md5 signature: 93d9fbf5febe449e6af99311c8d8ce44 ******/
		%feature("compactdefaultargs") IntegerAttribute;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
int

Description
-----------
Returns an integer attribute from its name. 0 if not recorded.
") IntegerAttribute;
		Standard_Integer IntegerAttribute(Standard_CString name);

		/****** Transfer_Finder::RealAttribute ******/
		/****** md5 signature: 58a4e4d83ca92f4eca73ac61ee1fe729 ******/
		%feature("compactdefaultargs") RealAttribute;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
float

Description
-----------
Returns a real attribute from its name. 0.0 if not recorded.
") RealAttribute;
		Standard_Real RealAttribute(Standard_CString name);

		/****** Transfer_Finder::RemoveAttribute ******/
		/****** md5 signature: 57071515bfbcf1a2ae1f11ad7d448049 ******/
		%feature("compactdefaultargs") RemoveAttribute;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Removes an attribute Returns True when done, False if this attribute did not exist.
") RemoveAttribute;
		Standard_Boolean RemoveAttribute(Standard_CString name);

		/****** Transfer_Finder::SameAttributes ******/
		/****** md5 signature: 270660a3d80d1ea22a91fae883e90d14 ******/
		%feature("compactdefaultargs") SameAttributes;
		%feature("autodoc", "
Parameters
----------
other: Transfer_Finder

Return
-------
None

Description
-----------
Gets the list of attributes from <other>, as such, i.e. not copied: attributes are shared, any attribute edited, added, or removed in <other> is also in <self> and vice versa The former list of attributes of <self> is dropped.
") SameAttributes;
		void SameAttributes(const opencascade::handle<Transfer_Finder> & other);

		/****** Transfer_Finder::SetAttribute ******/
		/****** md5 signature: ca59af36cb49e274007a7374b826f6d3 ******/
		%feature("compactdefaultargs") SetAttribute;
		%feature("autodoc", "
Parameters
----------
name: str
val: Standard_Transient

Return
-------
None

Description
-----------
Adds an attribute with a given name (replaces the former one with the same name if already exists).
") SetAttribute;
		void SetAttribute(Standard_CString name, const opencascade::handle<Standard_Transient> & val);

		/****** Transfer_Finder::SetIntegerAttribute ******/
		/****** md5 signature: 91bcd8c22467c6503d3124ea1bc29193 ******/
		%feature("compactdefaultargs") SetIntegerAttribute;
		%feature("autodoc", "
Parameters
----------
name: str
val: int

Return
-------
None

Description
-----------
Adds an integer value for an attribute.
") SetIntegerAttribute;
		void SetIntegerAttribute(Standard_CString name, const Standard_Integer val);

		/****** Transfer_Finder::SetRealAttribute ******/
		/****** md5 signature: 6336cf08a7edf9acb99611e6933d3024 ******/
		%feature("compactdefaultargs") SetRealAttribute;
		%feature("autodoc", "
Parameters
----------
name: str
val: float

Return
-------
None

Description
-----------
Adds a real value for an attribute.
") SetRealAttribute;
		void SetRealAttribute(Standard_CString name, const Standard_Real val);

		/****** Transfer_Finder::SetStringAttribute ******/
		/****** md5 signature: c4470714ba0031d975841ff9a21690ca ******/
		%feature("compactdefaultargs") SetStringAttribute;
		%feature("autodoc", "
Parameters
----------
name: str
val: str

Return
-------
None

Description
-----------
Adds a String value for an attribute.
") SetStringAttribute;
		void SetStringAttribute(Standard_CString name, Standard_CString val);

		/****** Transfer_Finder::StringAttribute ******/
		/****** md5 signature: c2ee3863f53a113455cc1e4716e85015 ******/
		%feature("compactdefaultargs") StringAttribute;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
str

Description
-----------
Returns a String attribute from its name. '' if not recorded.
") StringAttribute;
		Standard_CString StringAttribute(Standard_CString name);

		/****** Transfer_Finder::ValueType ******/
		/****** md5 signature: 7bf10d093b4c83528695e983de0b203f ******/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the Type of the Value. By default, returns the DynamicType of <self>, but can be redefined.
") ValueType;
		virtual opencascade::handle<Standard_Type> ValueType();

		/****** Transfer_Finder::ValueTypeName ******/
		/****** md5 signature: 9c551b5e8bde5c3427d2235f8cb0d374 ******/
		%feature("compactdefaultargs") ValueTypeName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the name of the Type of the Value. Default is name of ValueType, unless it is for a non-handled object.
") ValueTypeName;
		virtual Standard_CString ValueTypeName();

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
		/****** Transfer_MapContainer::Transfer_MapContainer ******/
		/****** md5 signature: b67b0a319d4bb2d6ca1c7d515ccc27a9 ******/
		%feature("compactdefaultargs") Transfer_MapContainer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Transfer_MapContainer;
		 Transfer_MapContainer();

		/****** Transfer_MapContainer::GetMapObjects ******/
		/****** md5 signature: b78e42301b73ffbcdd944f891ef37929 ******/
		%feature("compactdefaultargs") GetMapObjects;
		%feature("autodoc", "Return
-------
TColStd_DataMapOfTransientTransient

Description
-----------
Get map already translated geometry objects.
") GetMapObjects;
		TColStd_DataMapOfTransientTransient & GetMapObjects();

		/****** Transfer_MapContainer::SetMapObjects ******/
		/****** md5 signature: 42b12546d44c4134360d0249d249c527 ******/
		%feature("compactdefaultargs") SetMapObjects;
		%feature("autodoc", "
Parameters
----------
theMapObjects: TColStd_DataMapOfTransientTransient

Return
-------
None

Description
-----------
Set map already translated geometry objects.
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
		/****** Transfer_ProcessForTransient::Transfer_ProcessForTransient ******/
		/****** md5 signature: c79c4a6f922b540d45457c332ef67290 ******/
		%feature("compactdefaultargs") Transfer_ProcessForTransient;
		%feature("autodoc", "
Parameters
----------
nb: int (optional, default to 10000)

Return
-------
None

Description
-----------
Sets TransferProcess at initial state. Gives an Initial size (indicative) for the Map when known (default is 10000). Sets default trace file as a printer and default trace level (see Message_TraceFile).
") Transfer_ProcessForTransient;
		 Transfer_ProcessForTransient(const Standard_Integer nb = 10000);

		/****** Transfer_ProcessForTransient::Transfer_ProcessForTransient ******/
		/****** md5 signature: 08d1e19e4f9bb742f2b56d2f39bd884c ******/
		%feature("compactdefaultargs") Transfer_ProcessForTransient;
		%feature("autodoc", "
Parameters
----------
printer: Message_Messenger
nb: int (optional, default to 10000)

Return
-------
None

Description
-----------
Sets TransferProcess at initial state. Gives an Initial size (indicative) for the Map when known (default is 10000). Sets a specified printer.
") Transfer_ProcessForTransient;
		 Transfer_ProcessForTransient(const opencascade::handle<Message_Messenger> & printer, const Standard_Integer nb = 10000);

		/****** Transfer_ProcessForTransient::AbnormalResult ******/
		/****** md5 signature: 83a1f95395dc879f57c81c4d201c078d ******/
		%feature("compactdefaultargs") AbnormalResult;
		%feature("autodoc", "Return
-------
Transfer_IteratorOfProcessForTransient

Description
-----------
Returns Binders which are neither 'Done' nor 'Initial', that is Error,Loop or Run (abnormal states at end of Transfer) Starting Objects are given in correspondence in the iterator.
") AbnormalResult;
		Transfer_IteratorOfProcessForTransient AbnormalResult();

		/****** Transfer_ProcessForTransient::Actor ******/
		/****** md5 signature: df2ebaaedc9ec93e08a548c3e1f4da11 ******/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_ActorOfProcessForTransient>

Description
-----------
Returns the defined Actor. Returns a Null Handle if not set.
") Actor;
		opencascade::handle<Transfer_ActorOfProcessForTransient> Actor();

		/****** Transfer_ProcessForTransient::AddError ******/
		/****** md5 signature: 964f0677a127bf5448523bd1e2fa9bbd ******/
		%feature("compactdefaultargs") AddError;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
mess: str
orig: str (optional, default to "")

Return
-------
None

Description
-----------
(other name of AddFail, maintained for compatibility).
") AddError;
		void AddError(const opencascade::handle<Standard_Transient> & start, Standard_CString mess, Standard_CString orig = "");

		/****** Transfer_ProcessForTransient::AddFail ******/
		/****** md5 signature: 9795f5c11159dce99f638412f8744dee ******/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
mess: str
orig: str (optional, default to "")

Return
-------
None

Description
-----------
Adds an Error message to a starting entity (to the check of its Binder of category 0, as a Fail).
") AddFail;
		void AddFail(const opencascade::handle<Standard_Transient> & start, Standard_CString mess, Standard_CString orig = "");

		/****** Transfer_ProcessForTransient::AddFail ******/
		/****** md5 signature: 6b0d3fec2a52085b81fbdbfe16aef486 ******/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
amsg: Message_Msg

Return
-------
None

Description
-----------
Adds an Error Message to a starting entity from the definition of a Msg (Original+Value).
") AddFail;
		void AddFail(const opencascade::handle<Standard_Transient> & start, const Message_Msg & amsg);

		/****** Transfer_ProcessForTransient::AddMultiple ******/
		/****** md5 signature: f39f85f6866e511f6f4b8239a808d7e3 ******/
		%feature("compactdefaultargs") AddMultiple;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
res: Standard_Transient

Return
-------
None

Description
-----------
Adds an item to a list of results bound to a starting object. Considers a category number, by default 0, for all results.
") AddMultiple;
		void AddMultiple(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Standard_Transient> & res);

		/****** Transfer_ProcessForTransient::AddWarning ******/
		/****** md5 signature: 988f49b1d5bd3bf018afd5790e28b086 ******/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
mess: str
orig: str (optional, default to "")

Return
-------
None

Description
-----------
Adds a Warning message to a starting entity (to the check of its Binder of category 0).
") AddWarning;
		void AddWarning(const opencascade::handle<Standard_Transient> & start, Standard_CString mess, Standard_CString orig = "");

		/****** Transfer_ProcessForTransient::AddWarning ******/
		/****** md5 signature: bc3b2f4ee089d893bd2b7716390affae ******/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
amsg: Message_Msg

Return
-------
None

Description
-----------
Adds a Warning Message to a starting entity from the definition of a Msg (Original+Value).
") AddWarning;
		void AddWarning(const opencascade::handle<Standard_Transient> & start, const Message_Msg & amsg);

		/****** Transfer_ProcessForTransient::Bind ******/
		/****** md5 signature: bf73e24e506125d3d9de2fea95969610 ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
binder: Transfer_Binder

Return
-------
None

Description
-----------
Creates a Link a starting Object with a Binder. This Binder can either bring a Result (effective Binding) or none (it can be set later: pre-binding). Considers a category number, by default 0.
") Bind;
		void Bind(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_Binder> & binder);

		/****** Transfer_ProcessForTransient::BindMultiple ******/
		/****** md5 signature: c447327618698dc54ddfbab057e8dd75 ******/
		%feature("compactdefaultargs") BindMultiple;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
None

Description
-----------
Prepares an object <start> to be bound with several results. If no Binder is yet attached to <obj>, a MultipleBinder is created, empty. If a Binder is already set, it must accept Multiple Binding. Considers a category number, by default 0.
") BindMultiple;
		void BindMultiple(const opencascade::handle<Standard_Transient> & start);

		/****** Transfer_ProcessForTransient::BindTransient ******/
		/****** md5 signature: 3f71962535ec43902228ab6280cedca8 ******/
		%feature("compactdefaultargs") BindTransient;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
res: Standard_Transient

Return
-------
None

Description
-----------
Binds a starting object with a Transient Result. Uses a SimpleBinderOfTransient to work. If there is already one but with no Result set, sets its Result. Considers a category number, by default 0.
") BindTransient;
		void BindTransient(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Standard_Transient> & res);

		/****** Transfer_ProcessForTransient::Check ******/
		/****** md5 signature: 966e2a0b8c0a8863c7f85aafb48c01b9 ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns the Check attached to a starting entity. If <start> is unknown, returns an empty Check Adds a case name to a starting entity Adds a case value to a starting entity Returns the complete case list for an entity. Null Handle if empty In the list of mapped items (between 1 and NbMapped), searches for the first item which follows <num0>(not included) and which has an attribute named <name> Attributes are brought by Binders Hence, allows such an iteration //! for (num = TP->NextItemWithAttribute(name,0); num > 0; num = TP->NextItemWithAttribute(name,num) { .. process mapped item <num> } Returns the type of an Attribute attached to binders If this name gives no Attribute, returns ParamVoid If this name gives several different types, returns ParamMisc Else, returns the effective type (ParamInteger, ParamReal, ParamIdent, or ParamText) Returns the list of recorded Attribute Names, as a Dictionary of Integer: each value gives the count of items which bring this attribute name By default, considers all the attribute names If <rootname> is given, considers only the attribute names which begin by <rootname>.
") Check;
		opencascade::handle<Interface_Check> Check(const opencascade::handle<Standard_Transient> & start);

		/****** Transfer_ProcessForTransient::CheckList ******/
		/****** md5 signature: 4327fcc13c13f870f552e6873782ea4e ******/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "
Parameters
----------
erronly: bool

Return
-------
Interface_CheckIterator

Description
-----------
Returns a CheckList as a list of Check: each one is for a starting entity which have either check (warning or fail) messages are attached, or are in abnormal state: that case gives a specific message If <erronly> is True, checks with Warnings only are ignored.
") CheckList;
		Interface_CheckIterator CheckList(const Standard_Boolean erronly);

		/****** Transfer_ProcessForTransient::CheckListOne ******/
		/****** md5 signature: 4a76bac661d5184a7fa791306eb73b5f ******/
		%feature("compactdefaultargs") CheckListOne;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
level: int
erronly: bool

Return
-------
Interface_CheckIterator

Description
-----------
Returns a CheckList for one starting object <level> interpreted as by ResultOne If <erronly> is True, checks with Warnings only are ignored.
") CheckListOne;
		Interface_CheckIterator CheckListOne(const opencascade::handle<Standard_Transient> & start, const Standard_Integer level, const Standard_Boolean erronly);

		/****** Transfer_ProcessForTransient::CheckNum ******/
		/****** md5 signature: a6e945ebd9ab29fdd3875d21dd4e19ce ******/
		%feature("compactdefaultargs") CheckNum;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
int

Description
-----------
Computes a number to be associated to a starting object in a check or a check-list By default, returns 0; can be redefined.
") CheckNum;
		virtual Standard_Integer CheckNum(const opencascade::handle<Standard_Transient> & start);

		/****** Transfer_ProcessForTransient::Clean ******/
		/****** md5 signature: 2b06aa6e249aa983252ec57e01a88d51 ******/
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "Return
-------
None

Description
-----------
Rebuilds the Map and the roots to really remove Unbound items Because Unbind keeps the entity in place, even if not bound Hence, working by checking new items is meaningless if a formerly unbound item is rebound.
") Clean;
		void Clean();

		/****** Transfer_ProcessForTransient::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets a TransferProcess as ready for a completely new work. Clears general data (roots) and the Map.
") Clear;
		void Clear();

		/****** Transfer_ProcessForTransient::CompleteResult ******/
		/****** md5 signature: cdd116bbcf7ed573c06d1f2aa037184b ******/
		%feature("compactdefaultargs") CompleteResult;
		%feature("autodoc", "
Parameters
----------
withstart: bool (optional, default to Standard_False)

Return
-------
Transfer_IteratorOfProcessForTransient

Description
-----------
Returns, as an Iterator, the entire log of transfer (list of created objects and Binders which can bring errors) If withstart is given True, Starting Objects are also returned.
") CompleteResult;
		Transfer_IteratorOfProcessForTransient CompleteResult(const Standard_Boolean withstart = Standard_False);

		/****** Transfer_ProcessForTransient::ErrorHandle ******/
		/****** md5 signature: 8cd52cc3593d14fa4239b9d171ad1cc0 ******/
		%feature("compactdefaultargs") ErrorHandle;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns error handling flag.
") ErrorHandle;
		Standard_Boolean ErrorHandle();

		/****** Transfer_ProcessForTransient::Find ******/
		/****** md5 signature: 4b1db88dfdd7187936e0a00f627e0355 ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
Returns the Binder which is linked with a starting Object It can either bring a Result (Transfer done) or none (for a pre-binding). If no Binder is linked with <start>, returns a Null Handle Considers a category number, by default 0.
") Find;
		opencascade::handle<Transfer_Binder> Find(const opencascade::handle<Standard_Transient> & start);

		/****** Transfer_ProcessForTransient::FindElseBind ******/
		/****** md5 signature: 33716994d9ad374a36f8b0501124baee ******/
		%feature("compactdefaultargs") FindElseBind;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
Returns a Binder for a starting entity, as follows: Tries to Find the already bound one If none found, creates a VoidBinder and Binds it.
") FindElseBind;
		opencascade::handle<Transfer_Binder> FindElseBind(const opencascade::handle<Standard_Transient> & start);

		/****** Transfer_ProcessForTransient::FindTransient ******/
		/****** md5 signature: f705c1c0bd571b1513e731698548de36 ******/
		%feature("compactdefaultargs") FindTransient;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the Result of the Transfer of an object <start> as a Transient Result. Returns a Null Handle if there is no Transient Result Considers a category number, by default 0 Warning: Supposes that Binding is done with a SimpleBinderOfTransient.
") FindTransient;
		const opencascade::handle<Standard_Transient> & FindTransient(const opencascade::handle<Standard_Transient> & start);

		/****** Transfer_ProcessForTransient::FindTypedTransient ******/
		/****** md5 signature: a092fef204d5075bf57172da498095b0 ******/
		%feature("compactdefaultargs") FindTypedTransient;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
atype: Standard_Type
val: Standard_Transient

Return
-------
bool

Description
-----------
Searches for a transient result attached to a starting object, according to its type, by criterium IsKind(atype) //! In case of multiple result, explores the list and gives in <val> the first transient result IsKind(atype) Returns True and fills <val> if found Else, returns False (<val> is not touched, not even nullified) //! This syntactic form avoids to do DownCast: if a result is found with the good type, it is loaded in <val> and can be immediately used, well initialised.
") FindTypedTransient;
		Standard_Boolean FindTypedTransient(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Standard_Type> & atype, opencascade::handle<Standard_Transient> & val);

		/****** Transfer_ProcessForTransient::GetTypedTransient ******/
		/****** md5 signature: 6e9af0349f441e7b5ef9d474e02e3af3 ******/
		%feature("compactdefaultargs") GetTypedTransient;
		%feature("autodoc", "
Parameters
----------
binder: Transfer_Binder
atype: Standard_Type
val: Standard_Transient

Return
-------
bool

Description
-----------
Searches for a transient result recorded in a Binder, whatever this Binder is recorded or not in <self> //! This is strictly equivalent to the class method GetTypedResult from class SimpleBinderOfTransient, but is just lighter to call //! Apart from this, works as FindTypedTransient.
") GetTypedTransient;
		Standard_Boolean GetTypedTransient(const opencascade::handle<Transfer_Binder> & binder, const opencascade::handle<Standard_Type> & atype, opencascade::handle<Standard_Transient> & val);

		/****** Transfer_ProcessForTransient::IsAlreadyUsed ******/
		/****** md5 signature: dacef323e0776ce75d3126c178c4347c ******/
		%feature("compactdefaultargs") IsAlreadyUsed;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
bool

Description
-----------
Returns True if the result of the transfer of an object is already used in other ones. If it is, Rebind cannot change it. Considers a category number, by default 0.
") IsAlreadyUsed;
		Standard_Boolean IsAlreadyUsed(const opencascade::handle<Standard_Transient> & start);

		/****** Transfer_ProcessForTransient::IsBound ******/
		/****** md5 signature: d65f302b06f5a51e9a0ec9a49de93450 ******/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
bool

Description
-----------
Returns True if a Result (whatever its form) is Bound with a starting Object. I.e., if a Binder with a Result set, is linked with it Considers a category number, by default 0.
") IsBound;
		Standard_Boolean IsBound(const opencascade::handle<Standard_Transient> & start);

		/****** Transfer_ProcessForTransient::IsCheckListEmpty ******/
		/****** md5 signature: 7426a34e4b9432928d7b687b83017635 ******/
		%feature("compactdefaultargs") IsCheckListEmpty;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
level: int
erronly: bool

Return
-------
bool

Description
-----------
Returns True if no check message is attached to a starting object. <level> interpreted as by ResultOne If <erronly> is True, checks with Warnings only are ignored.
") IsCheckListEmpty;
		Standard_Boolean IsCheckListEmpty(const opencascade::handle<Standard_Transient> & start, const Standard_Integer level, const Standard_Boolean erronly);

		/****** Transfer_ProcessForTransient::IsLooping ******/
		/****** md5 signature: d40d7d099f2445cb01310e029b0dd3e8 ******/
		%feature("compactdefaultargs") IsLooping;
		%feature("autodoc", "
Parameters
----------
alevel: int

Return
-------
bool

Description
-----------
Returns True if we are surely in a DeadLoop. Evaluation is not exact, it is a 'majorant' which must be computed fast. This 'majorant' is: <alevel> greater than NbMapped.
") IsLooping;
		Standard_Boolean IsLooping(const Standard_Integer alevel);

		/****** Transfer_ProcessForTransient::MapIndex ******/
		/****** md5 signature: 6b6fdf8f30ea73356a799dd420a662a3 ******/
		%feature("compactdefaultargs") MapIndex;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
int

Description
-----------
Returns the Index value bound to a Starting Object, 0 if none.
") MapIndex;
		Standard_Integer MapIndex(const opencascade::handle<Standard_Transient> & start);

		/****** Transfer_ProcessForTransient::MapItem ******/
		/****** md5 signature: 5f31c62024685b4d7aed94e812e584a3 ******/
		%feature("compactdefaultargs") MapItem;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
Returns the Binder bound to an Index Considers a category number, by default 0.
") MapItem;
		opencascade::handle<Transfer_Binder> MapItem(const Standard_Integer num);

		/****** Transfer_ProcessForTransient::Mapped ******/
		/****** md5 signature: d8895545f89e9e7068cd850cead74673 ******/
		%feature("compactdefaultargs") Mapped;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the Starting Object bound to an Index,.
") Mapped;
		const opencascade::handle<Standard_Transient> & Mapped(const Standard_Integer num);

		/****** Transfer_ProcessForTransient::Mend ******/
		/****** md5 signature: f0a439e76b2264f8c1afe70d021eed6d ******/
		%feature("compactdefaultargs") Mend;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
pref: str (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") Mend;
		void Mend(const opencascade::handle<Standard_Transient> & start, Standard_CString pref = "");

		/****** Transfer_ProcessForTransient::Messenger ******/
		/****** md5 signature: c51845cdafadb143338935f519a3d7c7 ******/
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "Return
-------
opencascade::handle<Message_Messenger>

Description
-----------
Returns Messenger used for outputting messages. The returned object is guaranteed to be non-null; default is Message::Messenger().
") Messenger;
		opencascade::handle<Message_Messenger> Messenger();

		/****** Transfer_ProcessForTransient::NbMapped ******/
		/****** md5 signature: a11c288784ccf3ab5a7694b4a5ba48b6 ******/
		%feature("compactdefaultargs") NbMapped;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum possible value for Map Index (no result can be bound with a value greater than it).
") NbMapped;
		Standard_Integer NbMapped();

		/****** Transfer_ProcessForTransient::NbRoots ******/
		/****** md5 signature: d23dc5b5f7fe61d6b998e72ba9eb27b3 ******/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of recorded Roots.
") NbRoots;
		Standard_Integer NbRoots();

		/****** Transfer_ProcessForTransient::NestingLevel ******/
		/****** md5 signature: c7c3ad64a816ebfb4ee26d6fedec1d74 ******/
		%feature("compactdefaultargs") NestingLevel;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Nesting Level of Transfers (managed by methods TranscriptWith & Co). Starts to zero. If no automatic Transfer is used, it remains to zero. Zero means Root Level.
") NestingLevel;
		Standard_Integer NestingLevel();

		/****** Transfer_ProcessForTransient::PrintTrace ******/
		/****** md5 signature: 0a0a53bc4716a09a519c2ea2a9ac5776 ******/
		%feature("compactdefaultargs") PrintTrace;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
S: Standard_OStream

Description
-----------
Prints a short information on a starting object. By default prints its Dynamic Type. Can be redefined.
") PrintTrace;
		virtual void PrintTrace(const opencascade::handle<Standard_Transient> & start, std::ostream &OutValue);

		/****** Transfer_ProcessForTransient::Rebind ******/
		/****** md5 signature: e57d830e06b8d133bb4caf4c620470a2 ******/
		%feature("compactdefaultargs") Rebind;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
binder: Transfer_Binder

Return
-------
None

Description
-----------
Changes the Binder linked with a starting Object for its unitary transfer. This it can be useful when the exact form of the result is known once the transfer is widely engaged. This can be done only on first transfer. Considers a category number, by default 0.
") Rebind;
		void Rebind(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_Binder> & binder);

		/****** Transfer_ProcessForTransient::Recognize ******/
		/****** md5 signature: e23945c2db95d9c698a143374250e68e ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
bool

Description
-----------
Tells if <start> has been recognized as good candidate for Transfer. i.e. queries the Actor and its Nexts.
") Recognize;
		Standard_Boolean Recognize(const opencascade::handle<Standard_Transient> & start);

		/****** Transfer_ProcessForTransient::RemoveResult ******/
		/****** md5 signature: 53f7f36f61702374663ef90eb775010c ******/
		%feature("compactdefaultargs") RemoveResult;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
level: int
compute: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Removes Results attached to (== Unbinds) a given object and, according <level>: <level> = 0: only it <level> = 1: it plus its immediately owned sub-results(scope) <level> = 2: it plus all its owned sub-results(scope).
") RemoveResult;
		void RemoveResult(const opencascade::handle<Standard_Transient> & start, const Standard_Integer level, const Standard_Boolean compute = Standard_True);

		/****** Transfer_ProcessForTransient::ResetNestingLevel ******/
		/****** md5 signature: fccac8107b781d03299e78e280fddae3 ******/
		%feature("compactdefaultargs") ResetNestingLevel;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets Nesting Level of Transfers to Zero (Root Level), whatever its current value.
") ResetNestingLevel;
		void ResetNestingLevel();

		/****** Transfer_ProcessForTransient::Resize ******/
		/****** md5 signature: ebe4063391e94c8a79c7ae789ec49dd6 ******/
		%feature("compactdefaultargs") Resize;
		%feature("autodoc", "
Parameters
----------
nb: int

Return
-------
None

Description
-----------
Resizes the Map as required (if a new reliable value has been determined). Acts only if <nb> is greater than actual NbMapped.
") Resize;
		void Resize(const Standard_Integer nb);

		/****** Transfer_ProcessForTransient::ResultOne ******/
		/****** md5 signature: 701a5d7142af9dadfb756e80b076b539 ******/
		%feature("compactdefaultargs") ResultOne;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
level: int
withstart: bool (optional, default to Standard_False)

Return
-------
Transfer_IteratorOfProcessForTransient

Description
-----------
Returns, as an Iterator, the log of transfer for one object <level> = 0: this object only and if <start> is a scope owner (else, <level> is ignored): <level> = 1: object plus its immediate scoped ones <level> = 2: object plus all its scoped ones.
") ResultOne;
		Transfer_IteratorOfProcessForTransient ResultOne(const opencascade::handle<Standard_Transient> & start, const Standard_Integer level, const Standard_Boolean withstart = Standard_False);

		/****** Transfer_ProcessForTransient::Root ******/
		/****** md5 signature: f8a933ff1567e74f038f01f1e6f35af9 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns a Root Entity given its number in the list (1-NbRoots).
") Root;
		const opencascade::handle<Standard_Transient> & Root(const Standard_Integer num);

		/****** Transfer_ProcessForTransient::RootIndex ******/
		/****** md5 signature: 04f4903bfd92b2823564e0b7ed401e44 ******/
		%feature("compactdefaultargs") RootIndex;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
int

Description
-----------
Returns the index in the list of roots for a starting item, or 0 if it is not recorded as a root.
") RootIndex;
		Standard_Integer RootIndex(const opencascade::handle<Standard_Transient> & start);

		/****** Transfer_ProcessForTransient::RootItem ******/
		/****** md5 signature: b07d66c4854cca1612fa392e6949c308 ******/
		%feature("compactdefaultargs") RootItem;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
Returns the Binder bound with a Root Entity given its number Considers a category number, by default 0.
") RootItem;
		opencascade::handle<Transfer_Binder> RootItem(const Standard_Integer num);

		/****** Transfer_ProcessForTransient::RootResult ******/
		/****** md5 signature: 0a0e61f56d5a609830fa57636a74d5b9 ******/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "
Parameters
----------
withstart: bool (optional, default to Standard_False)

Return
-------
Transfer_IteratorOfProcessForTransient

Description
-----------
Returns, as an iterator, the log of root transfer, i.e. the created objects and Binders bound to starting roots If withstart is given True, Starting Objects are also returned.
") RootResult;
		Transfer_IteratorOfProcessForTransient RootResult(const Standard_Boolean withstart = Standard_False);

		/****** Transfer_ProcessForTransient::SendFail ******/
		/****** md5 signature: d32875c652ac12b94f5494c8a6909e18 ******/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
amsg: Message_Msg

Return
-------
None

Description
-----------
New name for AddFail (Msg).
") SendFail;
		void SendFail(const opencascade::handle<Standard_Transient> & start, const Message_Msg & amsg);

		/****** Transfer_ProcessForTransient::SendMsg ******/
		/****** md5 signature: 110e19651ba98c9b48fe9ab918091abf ******/
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
amsg: Message_Msg

Return
-------
None

Description
-----------
Adds an information message Trace is filled if trace level is at least 3.
") SendMsg;
		void SendMsg(const opencascade::handle<Standard_Transient> & start, const Message_Msg & amsg);

		/****** Transfer_ProcessForTransient::SendWarning ******/
		/****** md5 signature: ba2cf32029cee904163d9bc8ed5139ff ******/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
amsg: Message_Msg

Return
-------
None

Description
-----------
New name for AddWarning (Msg).
") SendWarning;
		void SendWarning(const opencascade::handle<Standard_Transient> & start, const Message_Msg & amsg);

		/****** Transfer_ProcessForTransient::SetActor ******/
		/****** md5 signature: ad69a99f7d9cae16ffa3fbb2dde0adee ******/
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "
Parameters
----------
actor: Transfer_ActorOfProcessForTransient

Return
-------
None

Description
-----------
Defines an Actor, which is used for automatic Transfer If already defined, the new Actor is cumulated (see SetNext from Actor).
") SetActor;
		void SetActor(const opencascade::handle<Transfer_ActorOfProcessForTransient> & actor);

		/****** Transfer_ProcessForTransient::SetErrorHandle ******/
		/****** md5 signature: cea15a20003832113608c312ef431fa6 ******/
		%feature("compactdefaultargs") SetErrorHandle;
		%feature("autodoc", "
Parameters
----------
err: bool

Return
-------
None

Description
-----------
Allows controls if exceptions will be handled Transfer Operations <err> False: they are not handled with try {} catch {} <err> True: they are Default is False: no handling performed.
") SetErrorHandle;
		void SetErrorHandle(const Standard_Boolean err);

		/****** Transfer_ProcessForTransient::SetMessenger ******/
		/****** md5 signature: a9749da4085afccb49a47ccebbb86045 ******/
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "
Parameters
----------
messenger: Message_Messenger

Return
-------
None

Description
-----------
Sets Messenger used for outputting messages.
") SetMessenger;
		void SetMessenger(const opencascade::handle<Message_Messenger> & messenger);

		/****** Transfer_ProcessForTransient::SetRoot ******/
		/****** md5 signature: 5a99d27cd967ef7f92acd7016203a0df ******/
		%feature("compactdefaultargs") SetRoot;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
None

Description
-----------
Declares <obj> (and its Result) as Root. This status will be later exploited by RootResult, see below (Result can be produced at any time).
") SetRoot;
		void SetRoot(const opencascade::handle<Standard_Transient> & start);

		/****** Transfer_ProcessForTransient::SetRootManagement ******/
		/****** md5 signature: f00b393b03802497e86faa83a981372a ******/
		%feature("compactdefaultargs") SetRootManagement;
		%feature("autodoc", "
Parameters
----------
stat: bool

Return
-------
None

Description
-----------
Enable (if <stat> True) or Disables (if <stat> False) Root Management. If it is set, Transfers are considered as stacked (a first Transfer commands other Transfers, and so on) and the Transfers commanded by an external caller are 'Root'. Remark: SetRoot can be called whatever this status, on every object. Default is set to True.
") SetRootManagement;
		void SetRootManagement(const Standard_Boolean stat);

		/****** Transfer_ProcessForTransient::SetTraceLevel ******/
		/****** md5 signature: b2d3fab409a6e2832ea6fb56a22812c1 ******/
		%feature("compactdefaultargs") SetTraceLevel;
		%feature("autodoc", "
Parameters
----------
tracelev: int

Return
-------
None

Description
-----------
Sets trace level used for outputting messages: <trace> = 0: no trace at all <trace> = 1: handled exceptions and calls to AddError <trace> = 2: also calls to AddWarning <trace> = 3: also traces new Roots (uses method ErrorTrace). Default is 1: Errors traced.
") SetTraceLevel;
		void SetTraceLevel(const Standard_Integer tracelev);

		/****** Transfer_ProcessForTransient::StartTrace ******/
		/****** md5 signature: b740b16f2bf8b249951768f7a3a02cf8 ******/
		%feature("compactdefaultargs") StartTrace;
		%feature("autodoc", "
Parameters
----------
binder: Transfer_Binder
start: Standard_Transient
level: int
mode: int

Return
-------
None

Description
-----------
Method called when trace is asked Calls PrintTrace to display information relevant for starting objects (which can be redefined) <level> is Nesting Level of Transfer (0 = root) <mode> controls the way the trace is done: 0 neutral, 1 for Error, 2 for Warning message, 3 for new Root.
") StartTrace;
		void StartTrace(const opencascade::handle<Transfer_Binder> & binder, const opencascade::handle<Standard_Transient> & start, const Standard_Integer level, const Standard_Integer mode);

		/****** Transfer_ProcessForTransient::TraceLevel ******/
		/****** md5 signature: 71a5f63811c28c261ef1f9e77d8b2618 ******/
		%feature("compactdefaultargs") TraceLevel;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns trace level used for outputting messages.
") TraceLevel;
		Standard_Integer TraceLevel();

		/****** Transfer_ProcessForTransient::Transfer ******/
		/****** md5 signature: c71bfebbf26d85976302e17529f72ccd ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Same as Transferring but does not return the Binder. Simply returns True in case of success (for user call).
") Transfer;
		Standard_Boolean Transfer(const opencascade::handle<Standard_Transient> & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** Transfer_ProcessForTransient::Transferring ******/
		/****** md5 signature: bf0dd68be3fa1440823e3d01d971993a ******/
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
Performs the Transfer of a Starting Object, by calling the method TransferProduct (see below). Mapping and Roots are managed: nothing is done if a Result is already Bound, an exception is raised in case of error.
") Transferring;
		opencascade::handle<Transfer_Binder> Transferring(const opencascade::handle<Standard_Transient> & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** Transfer_ProcessForTransient::Unbind ******/
		/****** md5 signature: 68606943e62848e312bd09ef2c626c47 ******/
		%feature("compactdefaultargs") Unbind;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
bool

Description
-----------
Removes the Binder linked with a starting object If this Binder brings a non-empty Check, it is replaced by a VoidBinder. Also removes from the list of Roots as required. Returns True if done, False if <start> was not bound Considers a category number, by default 0.
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
		/****** Transfer_ResultFromModel::Transfer_ResultFromModel ******/
		/****** md5 signature: 86b3c4120f76ae1b9b78bddf7bfd580b ******/
		%feature("compactdefaultargs") Transfer_ResultFromModel;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a ResultFromModel, empty.
") Transfer_ResultFromModel;
		 Transfer_ResultFromModel();

		/****** Transfer_ResultFromModel::CheckList ******/
		/****** md5 signature: a722cb68ab0a4d43a4bdfa4e46a07b58 ******/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "
Parameters
----------
erronly: bool
level: int (optional, default to 2)

Return
-------
Interface_CheckIterator

Description
-----------
Returns the check-list of this set of results <erronly> true: only fails are considered <level> = 0: considers only main binder <level> = 1: considers main binder plus immediate subs <level> = 2 (D): considers all checks.
") CheckList;
		Interface_CheckIterator CheckList(const Standard_Boolean erronly, const Standard_Integer level = 2);

		/****** Transfer_ResultFromModel::CheckStatus ******/
		/****** md5 signature: 435b2628f8f9bb8fdcca0c0ecf453f08 ******/
		%feature("compactdefaultargs") CheckStatus;
		%feature("autodoc", "Return
-------
Interface_CheckStatus

Description
-----------
Returns the check status with corresponds to the content of this ResultFromModel; considers all levels of transfer (worst status). Returns CheckAny if not yet computed Reads it from recorded status if already computed, else recomputes one.
") CheckStatus;
		Interface_CheckStatus CheckStatus();

		/****** Transfer_ResultFromModel::CheckedList ******/
		/****** md5 signature: 3cd3620ff5cdabbb428a24f5fa698607 ******/
		%feature("compactdefaultargs") CheckedList;
		%feature("autodoc", "
Parameters
----------
check: Interface_CheckStatus
result: bool

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the list of starting entities to which a check status is attached. <check> = -2 , all entities whatever the check (see result) <check> = -1 , entities with no fail (warning allowed) <check> = 0 , entities with no check at all <check> = 1 , entities with warning but no fail <check> = 2 , entities with fail <result>: if True, only entities with an attached result Remark: result True and check=0 will give an empty list.
") CheckedList;
		opencascade::handle<TColStd_HSequenceOfTransient> CheckedList(const Interface_CheckStatus check, const Standard_Boolean result);

		/****** Transfer_ResultFromModel::ComputeCheckStatus ******/
		/****** md5 signature: 5a4c69d05791fe7284103b8b3ecb9c62 ******/
		%feature("compactdefaultargs") ComputeCheckStatus;
		%feature("autodoc", "
Parameters
----------
enforce: bool

Return
-------
Interface_CheckStatus

Description
-----------
Computes and records check status (see CheckStatus) Does not computes it if already done and <enforce> False.
") ComputeCheckStatus;
		Interface_CheckStatus ComputeCheckStatus(const Standard_Boolean enforce);

		/****** Transfer_ResultFromModel::FileName ******/
		/****** md5 signature: 85b6394bcac5e528aa5809d0c9e6d178 ******/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns starting File Name (empty if not set).
") FileName;
		Standard_CString FileName();

		/****** Transfer_ResultFromModel::Fill ******/
		/****** md5 signature: 4b4edb201c233e76456aea2eb36c64a5 ******/
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "
Parameters
----------
TP: Transfer_TransientProcess
ent: Standard_Transient

Return
-------
bool

Description
-----------
Fills from a TransientProcess, with the result attached to a starting entity. Considers its Model if it is set. This action produces a structured set of ResultFromTransient, considering scopes, starting by that of <ent>. If <ent> has no recorded result, it remains empty Returns True if a result is recorded, False else.
") Fill;
		Standard_Boolean Fill(const opencascade::handle<Transfer_TransientProcess> & TP, const opencascade::handle<Standard_Transient> & ent);

		/****** Transfer_ResultFromModel::FillBack ******/
		/****** md5 signature: 8b4ef4bf5c68841052668acfafa83b62 ******/
		%feature("compactdefaultargs") FillBack;
		%feature("autodoc", "
Parameters
----------
TP: Transfer_TransientProcess

Return
-------
None

Description
-----------
Fills back a TransientProcess from the structured set of binders. Also sets the Model.
") FillBack;
		void FillBack(const opencascade::handle<Transfer_TransientProcess> & TP);

		/****** Transfer_ResultFromModel::HasResult ******/
		/****** md5 signature: 345d4b0f7e88f528928167976d8256d5 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a Result is recorded.
") HasResult;
		Standard_Boolean HasResult();

		/****** Transfer_ResultFromModel::MainLabel ******/
		/****** md5 signature: 89e5e795f3552e1c3474b97f7ba51e15 ******/
		%feature("compactdefaultargs") MainLabel;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the label in starting model attached to main entity (updated by Fill or SetMainResult, if Model is known).
") MainLabel;
		Standard_CString MainLabel();

		/****** Transfer_ResultFromModel::MainNumber ******/
		/****** md5 signature: c7812d4aa5ac295ddd43bdd4ac8f1ead ******/
		%feature("compactdefaultargs") MainNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the label in starting model attached to main entity.
") MainNumber;
		Standard_Integer MainNumber();

		/****** Transfer_ResultFromModel::MainResult ******/
		/****** md5 signature: a0a50a6aeb66f0640f3a596d505a9580 ******/
		%feature("compactdefaultargs") MainResult;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_ResultFromTransient>

Description
-----------
Returns the main recorded ResultFromTransient, or a null.
") MainResult;
		opencascade::handle<Transfer_ResultFromTransient> MainResult();

		/****** Transfer_ResultFromModel::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns starting Model (null if not set).
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** Transfer_ResultFromModel::ResultFromKey ******/
		/****** md5 signature: faee4631c279d10c40033a6e68529cb4 ******/
		%feature("compactdefaultargs") ResultFromKey;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
opencascade::handle<Transfer_ResultFromTransient>

Description
-----------
Searches for a key (starting entity) and returns its result Returns a null handle if not found.
") ResultFromKey;
		opencascade::handle<Transfer_ResultFromTransient> ResultFromKey(const opencascade::handle<Standard_Transient> & start);

		/****** Transfer_ResultFromModel::Results ******/
		/****** md5 signature: b4649f6d18c464f3f93aadeada3e7d81 ******/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "
Parameters
----------
level: int

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Internal method which returns the list of ResultFromTransient, according level (2:complete; 1:sub-level 1; 0:main only).
") Results;
		opencascade::handle<TColStd_HSequenceOfTransient> Results(const Standard_Integer level);

		/****** Transfer_ResultFromModel::SetFileName ******/
		/****** md5 signature: 01264eab651f24a03fa095140833c1e6 ******/
		%feature("compactdefaultargs") SetFileName;
		%feature("autodoc", "
Parameters
----------
filename: str

Return
-------
None

Description
-----------
Sets starting File Name.
") SetFileName;
		void SetFileName(Standard_CString filename);

		/****** Transfer_ResultFromModel::SetMainResult ******/
		/****** md5 signature: 65dcc5167fc4eed0bd35bdb86cf0bae5 ******/
		%feature("compactdefaultargs") SetMainResult;
		%feature("autodoc", "
Parameters
----------
amain: Transfer_ResultFromTransient

Return
-------
None

Description
-----------
Sets a new value for the main recorded ResultFromTransient.
") SetMainResult;
		void SetMainResult(const opencascade::handle<Transfer_ResultFromTransient> & amain);

		/****** Transfer_ResultFromModel::SetModel ******/
		/****** md5 signature: 70328a97cec44e457500ce3b002efc49 ******/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel

Return
-------
None

Description
-----------
Sets starting Model.
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** Transfer_ResultFromModel::Strip ******/
		/****** md5 signature: 44b7ddebb6940cf6f9077520c82b7817 ******/
		%feature("compactdefaultargs") Strip;
		%feature("autodoc", "
Parameters
----------
mode: int

Return
-------
None

Description
-----------
Clears some data attached to binders used by TransientProcess, which become useless once the transfer has been done, by calling Strip on its ResultFromTransient //! mode = 0: minimum, clears data remaining from TransferProcess mode = 10: just keeps file name, label, check status ..., and MainResult but only the result (Binder) mode = 11: also clears MainResult (status and names remain).
") Strip;
		void Strip(const Standard_Integer mode);

		/****** Transfer_ResultFromModel::TransferredList ******/
		/****** md5 signature: c57abe5750523fa9c76e621d52245f34 ******/
		%feature("compactdefaultargs") TransferredList;
		%feature("autodoc", "
Parameters
----------
level: int (optional, default to 2)

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the list of recorded starting entities, ending by the root. Entities with check but no transfer result are ignored <level> = 2 (D), considers the complete list <level> = 1 considers the main result plus immediate subs <level> = 0 just the main result.
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
		/****** Transfer_ResultFromTransient::Transfer_ResultFromTransient ******/
		/****** md5 signature: b65f16aa0a33f9ee3fefcc03f2efaa09 ******/
		%feature("compactdefaultargs") Transfer_ResultFromTransient;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a ResultFromTransient, empty.
") Transfer_ResultFromTransient;
		 Transfer_ResultFromTransient();

		/****** Transfer_ResultFromTransient::AddSubResult ******/
		/****** md5 signature: 886b3d930bb307f552d4093b80373aed ******/
		%feature("compactdefaultargs") AddSubResult;
		%feature("autodoc", "
Parameters
----------
sub: Transfer_ResultFromTransient

Return
-------
None

Description
-----------
Adds a sub-result.
") AddSubResult;
		void AddSubResult(const opencascade::handle<Transfer_ResultFromTransient> & sub);

		/****** Transfer_ResultFromTransient::Binder ******/
		/****** md5 signature: c455fbd6c51c1b2aca4dda866aaa784a ******/
		%feature("compactdefaultargs") Binder;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
Returns the binder.
") Binder;
		opencascade::handle<Transfer_Binder> Binder();

		/****** Transfer_ResultFromTransient::Check ******/
		/****** md5 signature: b324f0f5184c97d14308315ce8d6a533 ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns the check (or an empty one if no binder).
") Check;
		const opencascade::handle<Interface_Check> Check();

		/****** Transfer_ResultFromTransient::CheckStatus ******/
		/****** md5 signature: 435b2628f8f9bb8fdcca0c0ecf453f08 ******/
		%feature("compactdefaultargs") CheckStatus;
		%feature("autodoc", "Return
-------
Interface_CheckStatus

Description
-----------
Returns the check status.
") CheckStatus;
		Interface_CheckStatus CheckStatus();

		/****** Transfer_ResultFromTransient::ClearSubs ******/
		/****** md5 signature: b2f34bd33bc0c64da59a60de8fa03aba ******/
		%feature("compactdefaultargs") ClearSubs;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the list of (immediate) sub-results.
") ClearSubs;
		void ClearSubs();

		/****** Transfer_ResultFromTransient::Fill ******/
		/****** md5 signature: 735772e116add5578a8805b8bd64ee4f ******/
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "
Parameters
----------
TP: Transfer_TransientProcess

Return
-------
None

Description
-----------
Fills from a TransientProcess, with the starting entity which must have been set before. It works with scopes, calls Fill on each of its sub-results.
") Fill;
		void Fill(const opencascade::handle<Transfer_TransientProcess> & TP);

		/****** Transfer_ResultFromTransient::FillBack ******/
		/****** md5 signature: 8b4ef4bf5c68841052668acfafa83b62 ******/
		%feature("compactdefaultargs") FillBack;
		%feature("autodoc", "
Parameters
----------
TP: Transfer_TransientProcess

Return
-------
None

Description
-----------
Fills back a TransientProcess with definition of a ResultFromTransient, respectfully to its structuration in scopes.
") FillBack;
		void FillBack(const opencascade::handle<Transfer_TransientProcess> & TP);

		/****** Transfer_ResultFromTransient::FillMap ******/
		/****** md5 signature: 7ecb2a15540f8a1459eef96b7bd7b5d3 ******/
		%feature("compactdefaultargs") FillMap;
		%feature("autodoc", "
Parameters
----------
map: TColStd_IndexedMapOfTransient

Return
-------
None

Description
-----------
This method is used by ResultFromModel to collate the list of ResultFromTransient, avoiding duplications with a map Remark: <self> is already in the map and has not to be bound.
") FillMap;
		void FillMap(TColStd_IndexedMapOfTransient & map);

		/****** Transfer_ResultFromTransient::HasResult ******/
		/****** md5 signature: 345d4b0f7e88f528928167976d8256d5 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a result is recorded.
") HasResult;
		Standard_Boolean HasResult();

		/****** Transfer_ResultFromTransient::NbSubResults ******/
		/****** md5 signature: 7d56bac3eea8a906a9dce0b236c3ab49 ******/
		%feature("compactdefaultargs") NbSubResults;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of recorded sub-results.
") NbSubResults;
		Standard_Integer NbSubResults();

		/****** Transfer_ResultFromTransient::ResultFromKey ******/
		/****** md5 signature: 02fa96c7e49342a8237d57a19dbe007f ******/
		%feature("compactdefaultargs") ResultFromKey;
		%feature("autodoc", "
Parameters
----------
key: Standard_Transient

Return
-------
opencascade::handle<Transfer_ResultFromTransient>

Description
-----------
Returns the ResultFromTransient attached to a given starting entity (the key). Returns a null handle if not found.
") ResultFromKey;
		opencascade::handle<Transfer_ResultFromTransient> ResultFromKey(const opencascade::handle<Standard_Transient> & key);

		/****** Transfer_ResultFromTransient::SetBinder ******/
		/****** md5 signature: 30383b14fb37fc48f3ef7bec1a62300c ******/
		%feature("compactdefaultargs") SetBinder;
		%feature("autodoc", "
Parameters
----------
binder: Transfer_Binder

Return
-------
None

Description
-----------
Sets Binder (for result plus individual check).
") SetBinder;
		void SetBinder(const opencascade::handle<Transfer_Binder> & binder);

		/****** Transfer_ResultFromTransient::SetStart ******/
		/****** md5 signature: 45fd919f572141296eb48e05b1b6b4ed ******/
		%feature("compactdefaultargs") SetStart;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
None

Description
-----------
Sets starting entity.
") SetStart;
		void SetStart(const opencascade::handle<Standard_Transient> & start);

		/****** Transfer_ResultFromTransient::Start ******/
		/****** md5 signature: c32fb6226af227c40c2acdfda7f56a5b ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the starting entity.
") Start;
		opencascade::handle<Standard_Transient> Start();

		/****** Transfer_ResultFromTransient::Strip ******/
		/****** md5 signature: 4e5d87f245ebfb5ab5077fbccee31377 ******/
		%feature("compactdefaultargs") Strip;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears some data attached to binders used by TransientProcess, which become useless once the transfer has been done: the list of sub-scoped binders, which is now recorded as sub-results.
") Strip;
		void Strip();

		/****** Transfer_ResultFromTransient::SubResult ******/
		/****** md5 signature: fb024d959d50cb4a0e4994637b0d0ba8 ******/
		%feature("compactdefaultargs") SubResult;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Transfer_ResultFromTransient>

Description
-----------
Returns a sub-result, given its rank.
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
		/****** Transfer_TransferDispatch::Transfer_TransferDispatch ******/
		/****** md5 signature: c9b164781c18f7824c36fc83469acb50 ******/
		%feature("compactdefaultargs") Transfer_TransferDispatch;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
lib: Interface_GeneralLib

Return
-------
None

Description
-----------
Creates a TransferDispatch from a Model. Works with a General Service Library, given as an Argument A TransferDispatch is created as a CopyTool in which the Control is set to TransientProcess.
") Transfer_TransferDispatch;
		 Transfer_TransferDispatch(const opencascade::handle<Interface_InterfaceModel> & amodel, const Interface_GeneralLib & lib);

		/****** Transfer_TransferDispatch::Transfer_TransferDispatch ******/
		/****** md5 signature: 3ced86f31251498b6c7321d7f03c4479 ******/
		%feature("compactdefaultargs") Transfer_TransferDispatch;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
protocol: Interface_Protocol

Return
-------
None

Description
-----------
Same as above, but Library is defined through a Protocol.
") Transfer_TransferDispatch;
		 Transfer_TransferDispatch(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & protocol);

		/****** Transfer_TransferDispatch::Transfer_TransferDispatch ******/
		/****** md5 signature: aee8a2ddf46a7ec2ba2142b905802fb2 ******/
		%feature("compactdefaultargs") Transfer_TransferDispatch;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Same as above, but works with the Active Protocol.
") Transfer_TransferDispatch;
		 Transfer_TransferDispatch(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** Transfer_TransferDispatch::Copy ******/
		/****** md5 signature: aa3dd3e372c9a6a86dd959e12d7e676b ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
entfrom: Standard_Transient
entto: Standard_Transient
mapped: bool
errstat: bool

Return
-------
bool

Description
-----------
Copies an Entity by calling the method Transferring from the TransferProcess. If this called produces a Null Binder, then the standard, inherited Copy is called.
") Copy;
		virtual Standard_Boolean Copy(const opencascade::handle<Standard_Transient> & entfrom, opencascade::handle<Standard_Transient> & entto, const Standard_Boolean mapped, const Standard_Boolean errstat);

		/****** Transfer_TransferDispatch::TransientProcess ******/
		/****** md5 signature: cda5aa33365159e82c6213003de44419 ******/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_TransientProcess>

Description
-----------
Returns the content of Control Object, as a TransientProcess.
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
		/****** Transfer_TransferInput::Transfer_TransferInput ******/
		/****** md5 signature: 55bb1c114579a47a6c9181979110ec4b ******/
		%feature("compactdefaultargs") Transfer_TransferInput;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a TransferInput ready to use.
") Transfer_TransferInput;
		 Transfer_TransferInput();

		/****** Transfer_TransferInput::Entities ******/
		/****** md5 signature: 5db3b76609b964e68d9effb3c627f015 ******/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "
Parameters
----------
list: Transfer_TransferIterator

Return
-------
Interface_EntityIterator

Description
-----------
Takes the transient items stored in a TransferIterator.
") Entities;
		Interface_EntityIterator Entities(Transfer_TransferIterator & list);

		/****** Transfer_TransferInput::FillModel ******/
		/****** md5 signature: 481a8d7525eabb66fbaf189195b4a71e ******/
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "
Parameters
----------
proc: Transfer_TransientProcess
amodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Fills an InterfaceModel with the Complete Result of a Transfer stored in a TransientProcess (Starting Objects are Transient) The complete result is exactly added to the model.
") FillModel;
		void FillModel(const opencascade::handle<Transfer_TransientProcess> & proc, const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** Transfer_TransferInput::FillModel ******/
		/****** md5 signature: c393e76b94aead8744d8bcd81893dc4b ******/
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "
Parameters
----------
proc: Transfer_TransientProcess
amodel: Interface_InterfaceModel
proto: Interface_Protocol
roots: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Fills an InterfaceModel with results of the Transfer recorded in a TransientProcess (Starting Objects are Transient): Root Result if <roots> is True (Default), Complete Result else The entities added to the model are determined from the result by by adding the referenced entities.
") FillModel;
		void FillModel(const opencascade::handle<Transfer_TransientProcess> & proc, const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & proto, const Standard_Boolean roots = Standard_True);

		/****** Transfer_TransferInput::FillModel ******/
		/****** md5 signature: 5cb1480fcd475f430063f778828cd013 ******/
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "
Parameters
----------
proc: Transfer_FinderProcess
amodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Fills an InterfaceModel with the Complete Result of a Transfer stored in a TransientProcess (Starting Objects are Transient) The complete result is exactly added to the model.
") FillModel;
		void FillModel(const opencascade::handle<Transfer_FinderProcess> & proc, const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** Transfer_TransferInput::FillModel ******/
		/****** md5 signature: c1bd0a25ad5e5f15b1a8e849cee73f86 ******/
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "
Parameters
----------
proc: Transfer_FinderProcess
amodel: Interface_InterfaceModel
proto: Interface_Protocol
roots: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Fills an InterfaceModel with results of the Transfer recorded in a TransientProcess (Starting Objects are Transient): Root Result if <roots> is True (Default), Complete Result else The entities added to the model are determined from the result by by adding the referenced entities.
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
		/****** Transfer_TransferIterator::Transfer_TransferIterator ******/
		/****** md5 signature: 134d41c70233bac7a2658e98df51d73b ******/
		%feature("compactdefaultargs") Transfer_TransferIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty Iterator.
") Transfer_TransferIterator;
		 Transfer_TransferIterator();

		/****** Transfer_TransferIterator::AddItem ******/
		/****** md5 signature: ffb50f9c2fd650a44d5f10516435f6e7 ******/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "
Parameters
----------
atr: Transfer_Binder

Return
-------
None

Description
-----------
Adds a Binder to the iteration list (construction).
") AddItem;
		void AddItem(const opencascade::handle<Transfer_Binder> & atr);

		/****** Transfer_TransferIterator::Check ******/
		/****** md5 signature: b324f0f5184c97d14308315ce8d6a533 ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Check>

Description
-----------
Returns Check associated to current Binder (in case of error, it brings Fail messages) (in case of warnings, it brings Warning messages).
") Check;
		const opencascade::handle<Interface_Check> Check();

		/****** Transfer_TransferIterator::HasFails ******/
		/****** md5 signature: f3563bd9efac596467be81f4a575a861 ******/
		%feature("compactdefaultargs") HasFails;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Fail Messages are recorded with the current Binder. They can then be read through Check (see below).
") HasFails;
		Standard_Boolean HasFails();

		/****** Transfer_TransferIterator::HasResult ******/
		/****** md5 signature: 345d4b0f7e88f528928167976d8256d5 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if current Item brings a Result, Transient (Handle) or not or Multiple. That is to say, if it corresponds to a normally achieved Transfer, Transient Result is read by specific TransientResult below. Other kind of Result must be read specifically from its Binder.
") HasResult;
		Standard_Boolean HasResult();

		/****** Transfer_TransferIterator::HasTransientResult ******/
		/****** md5 signature: 54761d2e0d5d1752a81a9f361037869d ******/
		%feature("compactdefaultargs") HasTransientResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the current Item has a Transient Unique Result (if yes, use TransientResult to get it).
") HasTransientResult;
		Standard_Boolean HasTransientResult();

		/****** Transfer_TransferIterator::HasUniqueResult ******/
		/****** md5 signature: 6740e85ed519d6758e40ab150f6cf865 ******/
		%feature("compactdefaultargs") HasUniqueResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Current Item has a Unique Result.
") HasUniqueResult;
		Standard_Boolean HasUniqueResult();

		/****** Transfer_TransferIterator::HasWarnings ******/
		/****** md5 signature: 62eec0bc4f8c89e1937e6ebe5c890272 ******/
		%feature("compactdefaultargs") HasWarnings;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Warning Messages are recorded with the current Binder. They can then be read through Check (see below).
") HasWarnings;
		Standard_Boolean HasWarnings();

		/****** Transfer_TransferIterator::More ******/
		/****** md5 signature: f2144011648ae849666b28430a27a0ea ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there are other Items to iterate.
") More;
		Standard_Boolean More();

		/****** Transfer_TransferIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets Iteration to the next Item.
") Next;
		void Next();

		/****** Transfer_TransferIterator::Number ******/
		/****** md5 signature: 0049d1350ba9feffbbe0d130f3765410 ******/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns count of Binders to be iterated.
") Number;
		Standard_Integer Number();

		/****** Transfer_TransferIterator::ResultType ******/
		/****** md5 signature: 05a6797793486e19cd94de53a53b0ad7 ******/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the Type of the Result of the current Item, if Unique. If No Unique Result (Error Transfer or Multiple Result), returns a Null Handle The Type is: the Dynamic Type for a Transient Result, the Type defined by the Binder Class else.
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****** Transfer_TransferIterator::SelectBinder ******/
		/****** md5 signature: 2c82f4aa316674dfa570b7eb99d3bde0 ******/
		%feature("compactdefaultargs") SelectBinder;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type
keep: bool

Return
-------
None

Description
-----------
Selects Items on the Type of Binder: keep only Binders which are of a given Type (if keep is True) or reject only them (if keep is False).
") SelectBinder;
		void SelectBinder(const opencascade::handle<Standard_Type> & atype, const Standard_Boolean keep);

		/****** Transfer_TransferIterator::SelectItem ******/
		/****** md5 signature: c627e757f289a3bf535643d0f37dc088 ******/
		%feature("compactdefaultargs") SelectItem;
		%feature("autodoc", "
Parameters
----------
num: int
keep: bool

Return
-------
None

Description
-----------
Selects/Unselect (according to <keep> an item designated by its rank <num> in the list Used by sub-classes which have specific criteria.
") SelectItem;
		void SelectItem(const Standard_Integer num, const Standard_Boolean keep);

		/****** Transfer_TransferIterator::SelectResult ******/
		/****** md5 signature: 42d4bd1677459c3b95b15ab4e6322f93 ******/
		%feature("compactdefaultargs") SelectResult;
		%feature("autodoc", "
Parameters
----------
atype: Standard_Type
keep: bool

Return
-------
None

Description
-----------
Selects Items on the Type of Result. Considers only Unique Results. Considers Dynamic Type for Transient Result, Static Type (the one given to define the Binder) else. //! Results which are of a given Type (if keep is True) or reject only them (if keep is False).
") SelectResult;
		void SelectResult(const opencascade::handle<Standard_Type> & atype, const Standard_Boolean keep);

		/****** Transfer_TransferIterator::SelectUnique ******/
		/****** md5 signature: b7f115382ea39260170d68b3cf6fa384 ******/
		%feature("compactdefaultargs") SelectUnique;
		%feature("autodoc", "
Parameters
----------
keep: bool

Return
-------
None

Description
-----------
Select Items according Unicity: keep only Unique Results (if keep is True) or keep only Multiple Results (if keep is False).
") SelectUnique;
		void SelectUnique(const Standard_Boolean keep);

		/****** Transfer_TransferIterator::Start ******/
		/****** md5 signature: f8a4dbf1e6f2cec0927301856b440be5 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears Iteration in progress, to allow it to be restarted.
") Start;
		void Start();

		/****** Transfer_TransferIterator::Status ******/
		/****** md5 signature: af810d21148ff7c88d270db082f6e47e ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
Transfer_StatusExec

Description
-----------
Returns Execution Status of current Binder Normal transfer corresponds to StatusDone.
") Status;
		Transfer_StatusExec Status();

		/****** Transfer_TransferIterator::TransientResult ******/
		/****** md5 signature: e45bdce8b328d0de242c1817ac28dff5 ******/
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the Transient Result of the current Item if there is (else, returns a null Handle) Supposes that Binding is done by a SimpleBinderOfTransient.
") TransientResult;
		const opencascade::handle<Standard_Transient> & TransientResult();

		/****** Transfer_TransferIterator::Value ******/
		/****** md5 signature: 1c6466500ab78c129af2bec42d07824f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
Returns the current Binder.
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
		/****** Transfer_TransferOutput::Transfer_TransferOutput ******/
		/****** md5 signature: 03fff15a0a64ec9fe2d854f50dff2096 ******/
		%feature("compactdefaultargs") Transfer_TransferOutput;
		%feature("autodoc", "
Parameters
----------
actor: Transfer_ActorOfTransientProcess
amodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Creates a TransferOutput ready to use, with a TransientProcess.
") Transfer_TransferOutput;
		 Transfer_TransferOutput(const opencascade::handle<Transfer_ActorOfTransientProcess> & actor, const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** Transfer_TransferOutput::Transfer_TransferOutput ******/
		/****** md5 signature: 4b89f60255b0ac584f32262753ec1711 ******/
		%feature("compactdefaultargs") Transfer_TransferOutput;
		%feature("autodoc", "
Parameters
----------
proc: Transfer_TransientProcess
amodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Creates a TransferOutput from an already existing TransientProcess, and a Model Returns (by Reference, hence can be changed) the Mode for Scope Management. False (D) means Scope is ignored. True means that each individual Transfer (direct or through TransferRoots) is regarded as one Scope.
") Transfer_TransferOutput;
		 Transfer_TransferOutput(const opencascade::handle<Transfer_TransientProcess> & proc, const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** Transfer_TransferOutput::ListForStatus ******/
		/****** md5 signature: 4ce55ca144a32e7d7e82dc8e6e0441cc ******/
		%feature("compactdefaultargs") ListForStatus;
		%feature("autodoc", "
Parameters
----------
normal: bool
roots: bool (optional, default to Standard_True)

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of Starting Entities with these criteria: - <normal> False, gives the entities bound with ABNORMAL STATUS (e.g.: Fail recorded, Exception raised during Transfer) - <normal> True, gives Entities with or without a Result, but with no Fail, no Exception (Warnings are not counted) - <roots> False, considers all entities recorded (either for Result, or for at least one Fail or Warning message) - <roots> True (Default), considers only roots of Transfer (the Entities recorded at highest level) This method is based on AbnormalResult from TransferProcess.
") ListForStatus;
		Interface_EntityIterator ListForStatus(const Standard_Boolean normal, const Standard_Boolean roots = Standard_True);

		/****** Transfer_TransferOutput::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the Starting Model.
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** Transfer_TransferOutput::ModelForStatus ******/
		/****** md5 signature: 0b2557037db5c1e870f84f83c96fdb72 ******/
		%feature("compactdefaultargs") ModelForStatus;
		%feature("autodoc", "
Parameters
----------
protocol: Interface_Protocol
normal: bool
roots: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Fills a Model with the list determined by ListForStatus This model starts from scratch (made by NewEmptyModel from the current Model), then is filled by AddWithRefs //! Useful to get separately from a transfer, the entities which have caused problem, in order to furtherly analyse them (with normal = False), or the 'good' entities, to obtain a data set 'which works well' (with normal = True).
") ModelForStatus;
		opencascade::handle<Interface_InterfaceModel> ModelForStatus(const opencascade::handle<Interface_Protocol> & protocol, const Standard_Boolean normal, const Standard_Boolean roots = Standard_True);

		/****** Transfer_TransferOutput::Transfer ******/
		/****** md5 signature: 8e27747d8b599c3b80f2c1f3d03272cf ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
obj: Standard_Transient
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Transfer checks that all taken Entities come from the same Model, then calls Transfer from TransientProcess.
") Transfer;
		void Transfer(const opencascade::handle<Standard_Transient> & obj, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** Transfer_TransferOutput::TransferRoots ******/
		/****** md5 signature: 61600e91fe0ddcbe06f4fcd277fb7c48 ******/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "
Parameters
----------
protocol: Interface_Protocol
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Runs transfer on the roots of the Interface Model The Roots are computed with a ShareFlags created from a Protocol given as Argument.
") TransferRoots;
		void TransferRoots(const opencascade::handle<Interface_Protocol> & protocol, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** Transfer_TransferOutput::TransferRoots ******/
		/****** md5 signature: da9746e970c0a8b791a4f5bb60c98105 ******/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "
Parameters
----------
G: Interface_Graph
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Runs transfer on the roots defined by a Graph of dependences (which detains also a Model and its Entities) Roots are computed with a ShareFlags created from the Graph.
") TransferRoots;
		void TransferRoots(const Interface_Graph & G, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** Transfer_TransferOutput::TransferRoots ******/
		/****** md5 signature: 25bb247a7fd48e44af92ff0c96ed0a3c ******/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "
Parameters
----------
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Runs transfer on the roots of the Interface Model Remark: the Roots are computed with a ShareFlags created from the Active Protocol.
") TransferRoots;
		void TransferRoots(const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** Transfer_TransferOutput::TransientProcess ******/
		/****** md5 signature: cda5aa33365159e82c6213003de44419 ******/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_TransientProcess>

Description
-----------
Returns the TransientProcess used to work.
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
		/****** Transfer_ActorOfFinderProcess::Transfer_ActorOfFinderProcess ******/
		/****** md5 signature: 7bb9ae8ae754ef772a43669f3406eaff ******/
		%feature("compactdefaultargs") Transfer_ActorOfFinderProcess;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Transfer_ActorOfFinderProcess;
		 Transfer_ActorOfFinderProcess();

		/****** Transfer_ActorOfFinderProcess::GetShapeFixParameters ******/
		/****** md5 signature: a0fc3d423114840977f6d586006cd67d ******/
		%feature("compactdefaultargs") GetShapeFixParameters;
		%feature("autodoc", "Return
-------
XSAlgo_ShapeProcessor::ParameterMap

Description
-----------
Returns parameters for shape processing that was set by SetParameters() method. 
Return: the parameters for shape processing. Empty map if no parameters were set.
") GetShapeFixParameters;
		const XSAlgo_ShapeProcessor::ParameterMap & GetShapeFixParameters();

		/****** Transfer_ActorOfFinderProcess::GetShapeProcessFlags ******/
		/****** md5 signature: 9a36ef61377dc7b1e6932eb1cc2f212e ******/
		%feature("compactdefaultargs") GetShapeProcessFlags;
		%feature("autodoc", "Return
-------
XSAlgo_ShapeProcessor::ProcessingFlags

Description
-----------
Returns flags defining operations to be performed on shapes. 
Return: Pair of values defining operations to be performed on shapes and a boolean value that indicates whether the flags were set.
") GetShapeProcessFlags;
		const XSAlgo_ShapeProcessor::ProcessingFlags & GetShapeProcessFlags();


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
		/****** Transfer_ActorOfFinderProcess::SetShapeFixParameters ******/
		/****** md5 signature: c121f0c1a1bbbaa2d7732f28ec6b14f9 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: XSAlgo_ShapeProcessor::ParameterMap

Return
-------
None

Description
-----------
Sets parameters for shape processing. 
Parameter theParameters the parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(const XSAlgo_ShapeProcessor::ParameterMap & theParameters);

		/****** Transfer_ActorOfFinderProcess::SetShapeFixParameters ******/
		/****** md5 signature: 1db31276bf8a0d249a8011e0955a53e7 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: XSAlgo_ShapeProcessor::ParameterMap

Return
-------
None

Description
-----------
Sets parameters for shape processing. Parameters are moved from the input map. 
Parameter theParameters the parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(XSAlgo_ShapeProcessor::ParameterMap & theParameters);

		/****** Transfer_ActorOfFinderProcess::SetShapeFixParameters ******/
		/****** md5 signature: e895be254466ec0dab7446ab439d8103 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: DE_ShapeFixParameters
theAdditionalParameters: XSAlgo_ShapeProcessor::ParameterMap (optional, default to {})

Return
-------
None

Description
-----------
Sets parameters for shape processing. Parameters from @p theParameters are copied to the internal map. Parameters from @p theAdditionalParameters are copied to the internal map if they are not present in @p theParameters. 
Parameter theParameters the parameters for shape processing. 
Parameter theAdditionalParameters the additional parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(const DE_ShapeFixParameters & theParameters, const XSAlgo_ShapeProcessor::ParameterMap & theAdditionalParameters = {});

		/****** Transfer_ActorOfFinderProcess::SetShapeProcessFlags ******/
		/****** md5 signature: 8994bc61257c564f18dec11d989eee9a ******/
		%feature("compactdefaultargs") SetShapeProcessFlags;
		%feature("autodoc", "
Parameters
----------
theFlags: ShapeProcess::OperationsFlags

Return
-------
None

Description
-----------
Sets flags defining operations to be performed on shapes. 
Parameter theFlags The flags defining operations to be performed on shapes.
") SetShapeProcessFlags;
		void SetShapeProcessFlags(const ShapeProcess::OperationsFlags & theFlags);

		/****** Transfer_ActorOfFinderProcess::Transfer ******/
		/****** md5 signature: 0fe03bef0cb14a70799d9821bdfd7128 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
start: Transfer_Finder
TP: Transfer_FinderProcess
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
No available documentation.
") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<Transfer_FinderProcess> & TP, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** Transfer_ActorOfFinderProcess::TransferTransient ******/
		/****** md5 signature: 24fe8825c87ff896a8dc484d04499abd ******/
		%feature("compactdefaultargs") TransferTransient;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
TP: Transfer_FinderProcess
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
No available documentation.
") TransferTransient;
		virtual opencascade::handle<Standard_Transient> TransferTransient(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_FinderProcess> & TP, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** Transfer_ActorOfFinderProcess::Transferring ******/
		/****** md5 signature: 3464a419c95c9be779a18d63ebe10db3 ******/
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "
Parameters
----------
start: Transfer_Finder
TP: Transfer_ProcessForFinder
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
No available documentation.
") Transferring;
		virtual opencascade::handle<Transfer_Binder> Transferring(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<Transfer_ProcessForFinder> & TP, const Message_ProgressRange & theProgress = Message_ProgressRange());

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
		/****** Transfer_ActorOfTransientProcess::Transfer_ActorOfTransientProcess ******/
		/****** md5 signature: 3d05e6bcd3d347edb7b9af49cf89d070 ******/
		%feature("compactdefaultargs") Transfer_ActorOfTransientProcess;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Transfer_ActorOfTransientProcess;
		 Transfer_ActorOfTransientProcess();

		/****** Transfer_ActorOfTransientProcess::GetProcessingFlags ******/
		/****** md5 signature: 028e3c39463d40f9b67ea5e4eef4392b ******/
		%feature("compactdefaultargs") GetProcessingFlags;
		%feature("autodoc", "Return
-------
XSAlgo_ShapeProcessor::ProcessingFlags

Description
-----------
Returns flags defining operations to be performed on shapes. 
Return: Pair: the flags defining operations to be performed on shapes and a boolean value that indicates whether the flags were set.
") GetProcessingFlags;
		const XSAlgo_ShapeProcessor::ProcessingFlags & GetProcessingFlags();

		/****** Transfer_ActorOfTransientProcess::GetShapeFixParameters ******/
		/****** md5 signature: a0fc3d423114840977f6d586006cd67d ******/
		%feature("compactdefaultargs") GetShapeFixParameters;
		%feature("autodoc", "Return
-------
XSAlgo_ShapeProcessor::ParameterMap

Description
-----------
Returns parameters for shape processing that was set by SetParameters() method. 
Return: the parameters for shape processing. Empty map if no parameters were set.
") GetShapeFixParameters;
		const XSAlgo_ShapeProcessor::ParameterMap & GetShapeFixParameters();

		/****** Transfer_ActorOfTransientProcess::SetProcessingFlags ******/
		/****** md5 signature: ba5863441d51d46161ddfa6b423b2152 ******/
		%feature("compactdefaultargs") SetProcessingFlags;
		%feature("autodoc", "
Parameters
----------
theFlags: ShapeProcess::OperationsFlags

Return
-------
None

Description
-----------
Sets flags defining operations to be performed on shapes. 
Parameter theFlags The flags defining operations to be performed on shapes.
") SetProcessingFlags;
		void SetProcessingFlags(const ShapeProcess::OperationsFlags & theFlags);

		/****** Transfer_ActorOfTransientProcess::SetShapeFixParameters ******/
		/****** md5 signature: c121f0c1a1bbbaa2d7732f28ec6b14f9 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: XSAlgo_ShapeProcessor::ParameterMap

Return
-------
None

Description
-----------
Sets parameters for shape processing. 
Parameter theParameters the parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(const XSAlgo_ShapeProcessor::ParameterMap & theParameters);

		/****** Transfer_ActorOfTransientProcess::SetShapeFixParameters ******/
		/****** md5 signature: 1db31276bf8a0d249a8011e0955a53e7 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: XSAlgo_ShapeProcessor::ParameterMap

Return
-------
None

Description
-----------
Sets parameters for shape processing. Parameters are moved from the input map. 
Parameter theParameters the parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(XSAlgo_ShapeProcessor::ParameterMap & theParameters);

		/****** Transfer_ActorOfTransientProcess::SetShapeFixParameters ******/
		/****** md5 signature: e895be254466ec0dab7446ab439d8103 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: DE_ShapeFixParameters
theAdditionalParameters: XSAlgo_ShapeProcessor::ParameterMap (optional, default to {})

Return
-------
None

Description
-----------
Sets parameters for shape processing. Parameters from @p theParameters are copied to the internal map. Parameters from @p theAdditionalParameters are copied to the internal map if they are not present in @p theParameters. 
Parameter theParameters the parameters for shape processing. 
Parameter theAdditionalParameters the additional parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(const DE_ShapeFixParameters & theParameters, const XSAlgo_ShapeProcessor::ParameterMap & theAdditionalParameters = {});

		/****** Transfer_ActorOfTransientProcess::Transfer ******/
		/****** md5 signature: 61d6387dc674010808ec9a991a18e31d ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
TP: Transfer_TransientProcess
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
No available documentation.
") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_TransientProcess> & TP, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** Transfer_ActorOfTransientProcess::TransferTransient ******/
		/****** md5 signature: a9ca704c315b56c01b5f312b236d3746 ******/
		%feature("compactdefaultargs") TransferTransient;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
TP: Transfer_TransientProcess
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
No available documentation.
") TransferTransient;
		virtual opencascade::handle<Standard_Transient> TransferTransient(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_TransientProcess> & TP, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** Transfer_ActorOfTransientProcess::Transferring ******/
		/****** md5 signature: 3d349a09aa7dbf438f1e3e4274f68f63 ******/
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
TP: Transfer_ProcessForTransient
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
No available documentation.
") Transferring;
		virtual opencascade::handle<Transfer_Binder> Transferring(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_ProcessForTransient> & TP, const Message_ProgressRange & theProgress = Message_ProgressRange());

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
		/****** Transfer_FinderProcess::Transfer_FinderProcess ******/
		/****** md5 signature: 6543e0b56743c35bf2edca1ce675466b ******/
		%feature("compactdefaultargs") Transfer_FinderProcess;
		%feature("autodoc", "
Parameters
----------
nb: int (optional, default to 10000)

Return
-------
None

Description
-----------
Sets FinderProcess at initial state, with an initial size.
") Transfer_FinderProcess;
		 Transfer_FinderProcess(const Standard_Integer nb = 10000);

		/****** Transfer_FinderProcess::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the Model which can be used for context.
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** Transfer_FinderProcess::NextMappedWithAttribute ******/
		/****** md5 signature: a8c8001b9761e03443a2cdb062e0a16f ******/
		%feature("compactdefaultargs") NextMappedWithAttribute;
		%feature("autodoc", "
Parameters
----------
name: str
num0: int

Return
-------
int

Description
-----------
In the list of mapped items (between 1 and NbMapped), searches for the first mapped item which follows <num0> (not included) and which has an attribute named <name> The considered Attributes are those brought by Finders,i.e. by Input data. While NextItemWithAttribute works on Result data (Binders) //! Hence, allows such an iteration //! for (num = FP->NextMappedWithAttribute(name,0); num > 0; num = FP->NextMappedWithAttribute(name,num) { .. process mapped item <num> }.
") NextMappedWithAttribute;
		Standard_Integer NextMappedWithAttribute(Standard_CString name, const Standard_Integer num0);

		/****** Transfer_FinderProcess::PrintStats ******/
		/****** md5 signature: a0a8d2448d0f09b0c479b104db5da053 ******/
		%feature("compactdefaultargs") PrintStats;
		%feature("autodoc", "
Parameters
----------
mode: int

Return
-------
S: Standard_OStream

Description
-----------
Prints statistics on a given output, according mode.
") PrintStats;
		void PrintStats(const Standard_Integer mode, std::ostream &OutValue);

		/****** Transfer_FinderProcess::PrintTrace ******/
		/****** md5 signature: 8380d2532e8d3f7819d2298d70b485c1 ******/
		%feature("compactdefaultargs") PrintTrace;
		%feature("autodoc", "
Parameters
----------
start: Transfer_Finder

Return
-------
S: Standard_OStream

Description
-----------
Specific printing to trace a Finder (by its method ValueType).
") PrintTrace;
		virtual void PrintTrace(const opencascade::handle<Transfer_Finder> & start, std::ostream &OutValue);

		/****** Transfer_FinderProcess::SetModel ******/
		/****** md5 signature: 70328a97cec44e457500ce3b002efc49 ******/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel

Return
-------
None

Description
-----------
Sets an InterfaceModel, which can be used during transfer for instance if a context must be managed, it is in the Model.
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** Transfer_FinderProcess::TransientMapper ******/
		/****** md5 signature: bba75f1ee84dc872b5ce0fd3b61c5e38 ******/
		%feature("compactdefaultargs") TransientMapper;
		%feature("autodoc", "
Parameters
----------
obj: Standard_Transient

Return
-------
opencascade::handle<Transfer_TransientMapper>

Description
-----------
Returns a TransientMapper for a given Transient Object Either <obj> is already mapped, then its Mapper is returned Or it is not, then a new one is created then returned, BUT it is not mapped here (use Bind or FindElseBind to do this).
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
		/****** Transfer_IteratorOfProcessForFinder::Transfer_IteratorOfProcessForFinder ******/
		/****** md5 signature: d783e7a4df47396bdc8fdc69d99c7e82 ******/
		%feature("compactdefaultargs") Transfer_IteratorOfProcessForFinder;
		%feature("autodoc", "
Parameters
----------
withstarts: bool

Return
-------
None

Description
-----------
Creates an empty Iterator if withstarts is True, each Binder to be iterated will be associated to its corresponding Starting Object.
") Transfer_IteratorOfProcessForFinder;
		 Transfer_IteratorOfProcessForFinder(const Standard_Boolean withstarts);

		/****** Transfer_IteratorOfProcessForFinder::Add ******/
		/****** md5 signature: f68e4cd22cf05819b22444f933cba064 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
binder: Transfer_Binder

Return
-------
None

Description
-----------
Adds a Binder to the iteration list (construction) with no corresponding Starting Object (note that Result is brought by Binder).
") Add;
		void Add(const opencascade::handle<Transfer_Binder> & binder);

		/****** Transfer_IteratorOfProcessForFinder::Add ******/
		/****** md5 signature: 3829368d7c25902a6ca6c5f81bc0c127 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
binder: Transfer_Binder
start: Transfer_Finder

Return
-------
None

Description
-----------
Adds a Binder to the iteration list, associated with its corresponding Starting Object 'start' Starting Object is ignored if not required at Creation time.
") Add;
		void Add(const opencascade::handle<Transfer_Binder> & binder, const opencascade::handle<Transfer_Finder> & start);

		/****** Transfer_IteratorOfProcessForFinder::Filter ******/
		/****** md5 signature: 7dca65f9f52c4eef5fd7a100800ee481 ******/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "
Parameters
----------
list: Transfer_HSequenceOfFinder
keep: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
After having added all items, keeps or rejects items which are attached to starting data given by <only> <keep> = True (D): keeps. <keep> = False: rejects Does nothing if <withstarts> was False.
") Filter;
		void Filter(const opencascade::handle<Transfer_HSequenceOfFinder> & list, const Standard_Boolean keep = Standard_True);

		/****** Transfer_IteratorOfProcessForFinder::HasStarting ******/
		/****** md5 signature: 1b1bfb78f506561ca067180b234691f6 ******/
		%feature("compactdefaultargs") HasStarting;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Starting Object is available (defined at Creation Time).
") HasStarting;
		Standard_Boolean HasStarting();

		/****** Transfer_IteratorOfProcessForFinder::Starting ******/
		/****** md5 signature: 26380a0cdbe90b58a344a44a1da254da ******/
		%feature("compactdefaultargs") Starting;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_Finder>

Description
-----------
Returns corresponding Starting Object.
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
		/****** Transfer_IteratorOfProcessForTransient::Transfer_IteratorOfProcessForTransient ******/
		/****** md5 signature: 3479b0d136a3c3b46f3735dd63a8b7b5 ******/
		%feature("compactdefaultargs") Transfer_IteratorOfProcessForTransient;
		%feature("autodoc", "
Parameters
----------
withstarts: bool

Return
-------
None

Description
-----------
Creates an empty Iterator if withstarts is True, each Binder to be iterated will be associated to its corresponding Starting Object.
") Transfer_IteratorOfProcessForTransient;
		 Transfer_IteratorOfProcessForTransient(const Standard_Boolean withstarts);

		/****** Transfer_IteratorOfProcessForTransient::Add ******/
		/****** md5 signature: f68e4cd22cf05819b22444f933cba064 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
binder: Transfer_Binder

Return
-------
None

Description
-----------
Adds a Binder to the iteration list (construction) with no corresponding Starting Object (note that Result is brought by Binder).
") Add;
		void Add(const opencascade::handle<Transfer_Binder> & binder);

		/****** Transfer_IteratorOfProcessForTransient::Add ******/
		/****** md5 signature: 9639a2f990316f7650c07d3ad3fbcfe4 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
binder: Transfer_Binder
start: Standard_Transient

Return
-------
None

Description
-----------
Adds a Binder to the iteration list, associated with its corresponding Starting Object 'start' Starting Object is ignored if not required at Creation time.
") Add;
		void Add(const opencascade::handle<Transfer_Binder> & binder, const opencascade::handle<Standard_Transient> & start);

		/****** Transfer_IteratorOfProcessForTransient::Filter ******/
		/****** md5 signature: 3a3817a192dd52120e799cdbbd427069 ******/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfTransient
keep: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
After having added all items, keeps or rejects items which are attached to starting data given by <only> <keep> = True (D): keeps. <keep> = False: rejects Does nothing if <withstarts> was False.
") Filter;
		void Filter(const opencascade::handle<TColStd_HSequenceOfTransient> & list, const Standard_Boolean keep = Standard_True);

		/****** Transfer_IteratorOfProcessForTransient::HasStarting ******/
		/****** md5 signature: 1b1bfb78f506561ca067180b234691f6 ******/
		%feature("compactdefaultargs") HasStarting;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Starting Object is available (defined at Creation Time).
") HasStarting;
		Standard_Boolean HasStarting();

		/****** Transfer_IteratorOfProcessForTransient::Starting ******/
		/****** md5 signature: a57e499e7aa76b73a12df58540322b0e ******/
		%feature("compactdefaultargs") Starting;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns corresponding Starting Object.
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
		/****** Transfer_MultipleBinder::Transfer_MultipleBinder ******/
		/****** md5 signature: a7b41247ba0ca79546043ab1f3e5fb45 ******/
		%feature("compactdefaultargs") Transfer_MultipleBinder;
		%feature("autodoc", "Return
-------
None

Description
-----------
normal standard constructor, creates an empty MultipleBinder.
") Transfer_MultipleBinder;
		 Transfer_MultipleBinder();

		/****** Transfer_MultipleBinder::AddResult ******/
		/****** md5 signature: 26a5caa60fcbd70186b2bf4eb98b9e52 ******/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "
Parameters
----------
res: Standard_Transient

Return
-------
None

Description
-----------
Adds a new Item to the Multiple Result.
") AddResult;
		void AddResult(const opencascade::handle<Standard_Transient> & res);

		/****** Transfer_MultipleBinder::IsMultiple ******/
		/****** md5 signature: 17145d71daab4028b6c7195d5ff772ce ******/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if a starting object is bound with SEVERAL results: Here, returns always True.
") IsMultiple;
		virtual Standard_Boolean IsMultiple();

		/****** Transfer_MultipleBinder::MultipleResult ******/
		/****** md5 signature: 9c5ec29750579258267602ea00ec37c5 ******/
		%feature("compactdefaultargs") MultipleResult;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the Multiple Result, if it is defined (at least one Item). Else, returns a Null Handle.
") MultipleResult;
		opencascade::handle<TColStd_HSequenceOfTransient> MultipleResult();

		/****** Transfer_MultipleBinder::NbResults ******/
		/****** md5 signature: d68eae21e09d79bb9e5b28df0fd8b0fd ******/
		%feature("compactdefaultargs") NbResults;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the actual count of recorded (Transient) results.
") NbResults;
		Standard_Integer NbResults();

		/****** Transfer_MultipleBinder::ResultType ******/
		/****** md5 signature: 3e5db9429dee8b51366aef182b0d44a1 ******/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the Type permitted for Results, i.e. here Transient.
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****** Transfer_MultipleBinder::ResultTypeName ******/
		/****** md5 signature: 7c976254948a22ef88ad8fdce635402f ******/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the Name of the Type which characterizes the Result Here, returns '(list)'.
") ResultTypeName;
		Standard_CString ResultTypeName();

		/****** Transfer_MultipleBinder::ResultValue ******/
		/****** md5 signature: b7cf2832698e64e96726045e72479981 ******/
		%feature("compactdefaultargs") ResultValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the value of the recorded result n0 <num>.
") ResultValue;
		opencascade::handle<Standard_Transient> ResultValue(const Standard_Integer num);

		/****** Transfer_MultipleBinder::SetMultipleResult ******/
		/****** md5 signature: 5172db3db7d4b82dac155e2bf0adeb18 ******/
		%feature("compactdefaultargs") SetMultipleResult;
		%feature("autodoc", "
Parameters
----------
mulres: TColStd_HSequenceOfTransient

Return
-------
None

Description
-----------
Defines a Binding with a Multiple Result, given as a Sequence Error if a Unique Result has yet been defined.
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
		/****** Transfer_SimpleBinderOfTransient::Transfer_SimpleBinderOfTransient ******/
		/****** md5 signature: 83ba599c048412012db5337e7fe1879c ******/
		%feature("compactdefaultargs") Transfer_SimpleBinderOfTransient;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty SimpleBinderOfTransient Returns True if a starting object is bound with SEVERAL results: Here, returns always False See Binder itself.
") Transfer_SimpleBinderOfTransient;
		 Transfer_SimpleBinderOfTransient();

		/****** Transfer_SimpleBinderOfTransient::GetTypedResult ******/
		/****** md5 signature: ca1f1a878bdab3a27a7e99457abedbaa ******/
		%feature("compactdefaultargs") GetTypedResult;
		%feature("autodoc", "
Parameters
----------
bnd: Transfer_Binder
atype: Standard_Type
res: Standard_Transient

Return
-------
bool

Description
-----------
Returns a transient result according to its type (IsKind) i.e. the result itself if IsKind(atype), else searches in NextResult, until first found, then returns True If not found, returns False (res is NOT touched) //! This syntactic form avoids to do DownCast: if a result is found with the good type, it is loaded in <res> and can be immediately used, well initialised.
") GetTypedResult;
		static Standard_Boolean GetTypedResult(const opencascade::handle<Transfer_Binder> & bnd, const opencascade::handle<Standard_Type> & atype, opencascade::handle<Standard_Transient> & res);

		/****** Transfer_SimpleBinderOfTransient::Result ******/
		/****** md5 signature: 95c161d526ef1674cc23bca685805385 ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the defined Result, if there is one.
") Result;
		const opencascade::handle<Standard_Transient> & Result();

		/****** Transfer_SimpleBinderOfTransient::ResultType ******/
		/****** md5 signature: 3e5db9429dee8b51366aef182b0d44a1 ******/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the Effective (Dynamic) Type of the Result (Standard_Transient if no Result is defined).
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****** Transfer_SimpleBinderOfTransient::ResultTypeName ******/
		/****** md5 signature: 7c976254948a22ef88ad8fdce635402f ******/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the Effective Name of (Dynamic) Type of the Result (void) if no result is defined.
") ResultTypeName;
		Standard_CString ResultTypeName();

		/****** Transfer_SimpleBinderOfTransient::SetResult ******/
		/****** md5 signature: a91ed353e0cbe1f40e4af5c64aac3b28 ******/
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "
Parameters
----------
res: Standard_Transient

Return
-------
None

Description
-----------
Defines the Result.
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
		/****** Transfer_TransientListBinder::Transfer_TransientListBinder ******/
		/****** md5 signature: 985ec942a6a31b56c14a317041081ab8 ******/
		%feature("compactdefaultargs") Transfer_TransientListBinder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Transfer_TransientListBinder;
		 Transfer_TransientListBinder();

		/****** Transfer_TransientListBinder::Transfer_TransientListBinder ******/
		/****** md5 signature: f265a0b8c24820f23ed51a427318d965 ******/
		%feature("compactdefaultargs") Transfer_TransientListBinder;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfTransient

Return
-------
None

Description
-----------
No available documentation.
") Transfer_TransientListBinder;
		 Transfer_TransientListBinder(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****** Transfer_TransientListBinder::AddResult ******/
		/****** md5 signature: 26a5caa60fcbd70186b2bf4eb98b9e52 ******/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "
Parameters
----------
res: Standard_Transient

Return
-------
None

Description
-----------
Adds an item to the result list.
") AddResult;
		void AddResult(const opencascade::handle<Standard_Transient> & res);

		/****** Transfer_TransientListBinder::IsMultiple ******/
		/****** md5 signature: 17145d71daab4028b6c7195d5ff772ce ******/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsMultiple;
		virtual Standard_Boolean IsMultiple();

		/****** Transfer_TransientListBinder::NbTransients ******/
		/****** md5 signature: 9436b9a550cdb03fdd33d4f80aca7526 ******/
		%feature("compactdefaultargs") NbTransients;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbTransients;
		Standard_Integer NbTransients();

		/****** Transfer_TransientListBinder::Result ******/
		/****** md5 signature: 2bd6e9158d943b64479fab613acb4c84 ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
No available documentation.
") Result;
		opencascade::handle<TColStd_HSequenceOfTransient> Result();

		/****** Transfer_TransientListBinder::ResultType ******/
		/****** md5 signature: 3e5db9429dee8b51366aef182b0d44a1 ******/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
No available documentation.
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****** Transfer_TransientListBinder::ResultTypeName ******/
		/****** md5 signature: 7c976254948a22ef88ad8fdce635402f ******/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Return
-------
str

Description
-----------
No available documentation.
") ResultTypeName;
		Standard_CString ResultTypeName();

		/****** Transfer_TransientListBinder::SetResult ******/
		/****** md5 signature: 9b9f3aa6b0da2cde777cca0377073974 ******/
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "
Parameters
----------
num: int
res: Standard_Transient

Return
-------
None

Description
-----------
Changes an already defined sub-result.
") SetResult;
		void SetResult(const Standard_Integer num, const opencascade::handle<Standard_Transient> & res);

		/****** Transfer_TransientListBinder::Transient ******/
		/****** md5 signature: 907a24a1042c0d2e6d96d99e25c98f79 ******/
		%feature("compactdefaultargs") Transient;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
No available documentation.
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
		/****** Transfer_TransientMapper::Transfer_TransientMapper ******/
		/****** md5 signature: 8b03be42c0b0bd26c5f38c74de7882a5 ******/
		%feature("compactdefaultargs") Transfer_TransientMapper;
		%feature("autodoc", "
Parameters
----------
akey: Standard_Transient

Return
-------
None

Description
-----------
Creates a Mapper with a Value. This Value can then not be changed. It is used by the Hasher to compute the HashCode, which will then be stored for an immediate reading.
") Transfer_TransientMapper;
		 Transfer_TransientMapper(const opencascade::handle<Standard_Transient> & akey);

		/****** Transfer_TransientMapper::Equates ******/
		/****** md5 signature: 2bde7773554342cacb5dfc4ee8d4c0f3 ******/
		%feature("compactdefaultargs") Equates;
		%feature("autodoc", "
Parameters
----------
other: Transfer_Finder

Return
-------
bool

Description
-----------
Specific testof equality: defined as False if <other> has not the same true Type, else contents are compared (by C++ operator ==).
") Equates;
		Standard_Boolean Equates(const opencascade::handle<Transfer_Finder> & other);

		/****** Transfer_TransientMapper::Value ******/
		/****** md5 signature: b1443f8da90189a74241bf586c57fc63 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the contained value.
") Value;
		const opencascade::handle<Standard_Transient> & Value();

		/****** Transfer_TransientMapper::ValueType ******/
		/****** md5 signature: 40aa6e907b5cbe34817c19e20e6dde6e ******/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the Type of the Value. By default, returns the DynamicType of <self>, but can be redefined.
") ValueType;
		virtual opencascade::handle<Standard_Type> ValueType();

		/****** Transfer_TransientMapper::ValueTypeName ******/
		/****** md5 signature: d49d824d6a98cbb182d37bee73d4be07 ******/
		%feature("compactdefaultargs") ValueTypeName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the name of the Type of the Value. Default is name of ValueType, unless it is for a non-handled object.
") ValueTypeName;
		virtual Standard_CString ValueTypeName();

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
		/****** Transfer_TransientProcess::Transfer_TransientProcess ******/
		/****** md5 signature: e2a3c82cef0311477806faa8bed05f28 ******/
		%feature("compactdefaultargs") Transfer_TransientProcess;
		%feature("autodoc", "
Parameters
----------
nb: int (optional, default to 10000)

Return
-------
None

Description
-----------
Sets TransientProcess at initial state, with an initial size.
") Transfer_TransientProcess;
		 Transfer_TransientProcess(const Standard_Integer nb = 10000);

		/****** Transfer_TransientProcess::CheckNum ******/
		/****** md5 signature: 1206215b29038b8bb2c684de751aa167 ******/
		%feature("compactdefaultargs") CheckNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Specific number of a starting object for check-list: Number in model.
") CheckNum;
		virtual Standard_Integer CheckNum(const opencascade::handle<Standard_Transient> & ent);

		/****** Transfer_TransientProcess::Context ******/
		/****** md5 signature: b81edf1d9ad3c29d489a2eda3dedcb1f ******/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>

Description
-----------
Returns (modifiable) the whole definition of Context Rather for internal use (ex.: preparing and setting in once).
") Context;
		NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & Context();

		/****** Transfer_TransientProcess::GetContext ******/
		/****** md5 signature: 35a3fb181b40ac50cc3276aad484d0e6 ******/
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "
Parameters
----------
name: str
type: Standard_Type
ctx: Standard_Transient

Return
-------
bool

Description
-----------
Returns the Context attached to a name, if set and if it is Kind of the type, else a Null Handle Returns True if OK, False if no Context.
") GetContext;
		Standard_Boolean GetContext(Standard_CString name, const opencascade::handle<Standard_Type> & type, opencascade::handle<Standard_Transient> & ctx);

		/****** Transfer_TransientProcess::Graph ******/
		/****** md5 signature: 6a234e0475ae0da1c7d268d231e44a78 ******/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "Return
-------
Interface_Graph

Description
-----------
No available documentation.
") Graph;
		const Interface_Graph & Graph();

		/****** Transfer_TransientProcess::HGraph ******/
		/****** md5 signature: f11ddef29a65063d0492ed4367a78169 ******/
		%feature("compactdefaultargs") HGraph;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_HGraph>

Description
-----------
No available documentation.
") HGraph;
		opencascade::handle<Interface_HGraph> HGraph();

		/****** Transfer_TransientProcess::HasGraph ******/
		/****** md5 signature: 9e75b58a6854bcc374aebe383c2cf582 ******/
		%feature("compactdefaultargs") HasGraph;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasGraph;
		Standard_Boolean HasGraph();

		/****** Transfer_TransientProcess::IsDataFail ******/
		/****** md5 signature: abfb0c083f555db3379af2b0895f676c ******/
		%feature("compactdefaultargs") IsDataFail;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
bool

Description
-----------
Tells if an entity fails on data checking (load time, syntactic, or semantic check). Normally, should answer False. It is not prudent to try transferring an entity which fails on data checking.
") IsDataFail;
		Standard_Boolean IsDataFail(const opencascade::handle<Standard_Transient> & ent);

		/****** Transfer_TransientProcess::IsDataLoaded ******/
		/****** md5 signature: 0cfb430e098039c6765591e4d04235fd ******/
		%feature("compactdefaultargs") IsDataLoaded;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
bool

Description
-----------
Tells if an entity is well loaded from file (even if its data fail on checking, they are present). Mostly often, answers True. Else, there was a syntactic error in the file. A non-loaded entity MAY NOT BE transferred, unless its Report (in the model) is interpreted.
") IsDataLoaded;
		Standard_Boolean IsDataLoaded(const opencascade::handle<Standard_Transient> & ent);

		/****** Transfer_TransientProcess::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the Model used for StartTrace.
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** Transfer_TransientProcess::PrintStats ******/
		/****** md5 signature: a0a8d2448d0f09b0c479b104db5da053 ******/
		%feature("compactdefaultargs") PrintStats;
		%feature("autodoc", "
Parameters
----------
mode: int

Return
-------
S: Standard_OStream

Description
-----------
Prints statistics on a given output, according mode.
") PrintStats;
		void PrintStats(const Standard_Integer mode, std::ostream &OutValue);

		/****** Transfer_TransientProcess::PrintTrace ******/
		/****** md5 signature: 52ba67cfb212004a5323c79b188c104d ******/
		%feature("compactdefaultargs") PrintTrace;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
S: Standard_OStream

Description
-----------
Specific printing to trace an entity: prints label and type (if model is set).
") PrintTrace;
		virtual void PrintTrace(const opencascade::handle<Standard_Transient> & start, std::ostream &OutValue);

		/****** Transfer_TransientProcess::RootsForTransfer ******/
		/****** md5 signature: c79152a32ae4b6ec28313285c230ae8b ******/
		%feature("compactdefaultargs") RootsForTransfer;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
No available documentation.
") RootsForTransfer;
		opencascade::handle<TColStd_HSequenceOfTransient> RootsForTransfer();

		/****** Transfer_TransientProcess::SetContext ******/
		/****** md5 signature: 687f3566e8f038cd942291d8a4bdf6b8 ******/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "
Parameters
----------
name: str
ctx: Standard_Transient

Return
-------
None

Description
-----------
Sets a Context: according to receiving appli, to be interpreted by the Actor.
") SetContext;
		void SetContext(Standard_CString name, const opencascade::handle<Standard_Transient> & ctx);

		/****** Transfer_TransientProcess::SetGraph ******/
		/****** md5 signature: c0b17a1913a1fcbe531cbabf35a93da0 ******/
		%feature("compactdefaultargs") SetGraph;
		%feature("autodoc", "
Parameters
----------
HG: Interface_HGraph

Return
-------
None

Description
-----------
Sets a Graph: supersedes SetModel if already done.
") SetGraph;
		void SetGraph(const opencascade::handle<Interface_HGraph> & HG);

		/****** Transfer_TransientProcess::SetModel ******/
		/****** md5 signature: 70328a97cec44e457500ce3b002efc49 ******/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel

Return
-------
None

Description
-----------
Sets an InterfaceModel, used by StartTrace, CheckList, queries on Integrity, to give information significant for each norm.
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** Transfer_TransientProcess::TypedSharings ******/
		/****** md5 signature: 63d93577cdbacb42c1cd116ed1083072 ******/
		%feature("compactdefaultargs") TypedSharings;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
type: Standard_Type

Return
-------
Interface_EntityIterator

Description
-----------
Returns the list of sharings entities, AT ANY LEVEL, which are kind of a given type. Calls TypedSharings from Graph Returns an empty list if the Graph has not been acknowledged.
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
		/****** Transfer_VoidBinder::Transfer_VoidBinder ******/
		/****** md5 signature: 1e864ae9b50ee16142e62aa5c24b1ca0 ******/
		%feature("compactdefaultargs") Transfer_VoidBinder;
		%feature("autodoc", "Return
-------
None

Description
-----------
a VoidBinder is not Multiple (Remark: it is not Simple too) But it can bring next results ...
") Transfer_VoidBinder;
		 Transfer_VoidBinder();

		/****** Transfer_VoidBinder::ResultType ******/
		/****** md5 signature: 3e5db9429dee8b51366aef182b0d44a1 ******/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
while a VoidBinder admits no Result, its ResultType returns the type of <self>.
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****** Transfer_VoidBinder::ResultTypeName ******/
		/****** md5 signature: 7c976254948a22ef88ad8fdce635402f ******/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns '(void)'.
") ResultTypeName;
		Standard_CString ResultTypeName();

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
		/****** Transfer_ActorDispatch::Transfer_ActorDispatch ******/
		/****** md5 signature: 152a07092c4c6159bd1b6d4e1036cd46 ******/
		%feature("compactdefaultargs") Transfer_ActorDispatch;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
lib: Interface_GeneralLib

Return
-------
None

Description
-----------
Creates an ActorDispatch from a Model. Works with a General Service Library, given as an Argument This causes TransferDispatch and its TransientProcess to be created, with default actor <self>.
") Transfer_ActorDispatch;
		 Transfer_ActorDispatch(const opencascade::handle<Interface_InterfaceModel> & amodel, const Interface_GeneralLib & lib);

		/****** Transfer_ActorDispatch::Transfer_ActorDispatch ******/
		/****** md5 signature: eb926ba71ad0fbf6df623ff34c9ccbe0 ******/
		%feature("compactdefaultargs") Transfer_ActorDispatch;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel
protocol: Interface_Protocol

Return
-------
None

Description
-----------
Same as above, but Library is defined through a Protocol.
") Transfer_ActorDispatch;
		 Transfer_ActorDispatch(const opencascade::handle<Interface_InterfaceModel> & amodel, const opencascade::handle<Interface_Protocol> & protocol);

		/****** Transfer_ActorDispatch::Transfer_ActorDispatch ******/
		/****** md5 signature: c14d8969419bcc9b1bdd4b3c583befc3 ******/
		%feature("compactdefaultargs") Transfer_ActorDispatch;
		%feature("autodoc", "
Parameters
----------
amodel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Same as above, but works with the Active Protocol.
") Transfer_ActorDispatch;
		 Transfer_ActorDispatch(const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****** Transfer_ActorDispatch::AddActor ******/
		/****** md5 signature: 017fc477d6292d482b50dd07c5f26ad2 ******/
		%feature("compactdefaultargs") AddActor;
		%feature("autodoc", "
Parameters
----------
actor: Transfer_ActorOfTransientProcess

Return
-------
None

Description
-----------
Utility which adds an actor to the default <self> (it calls SetActor from the TransientProcess).
") AddActor;
		void AddActor(const opencascade::handle<Transfer_ActorOfTransientProcess> & actor);

		/****** Transfer_ActorDispatch::Transfer ******/
		/****** md5 signature: e4303fa9409798bd20ec402569b65ae8 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
TP: Transfer_TransientProcess
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
Specific action: it calls the method Transfer from CopyTool i.e. the general service Copy, then returns the Binder produced by the TransientProcess.
") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_TransientProcess> & TP, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** Transfer_ActorDispatch::TransferDispatch ******/
		/****** md5 signature: d8c37ebfb4344c5658d80d5678e6d3a2 ******/
		%feature("compactdefaultargs") TransferDispatch;
		%feature("autodoc", "Return
-------
Transfer_TransferDispatch

Description
-----------
Returns the TransferDispatch, which does the work, records the intermediate data, etc... See TransferDispatch & CopyTool, to see the available methods.
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
		/****** Transfer_BinderOfTransientInteger::Transfer_BinderOfTransientInteger ******/
		/****** md5 signature: 75a5cfc9d6db709047a5433470ef2411 ******/
		%feature("compactdefaultargs") Transfer_BinderOfTransientInteger;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty BinderOfTransientInteger; Default value for the integer part is zero.
") Transfer_BinderOfTransientInteger;
		 Transfer_BinderOfTransientInteger();

		/****** Transfer_BinderOfTransientInteger::Integer ******/
		/****** md5 signature: 5ca25bbf05344000d69837c81499cc7b ******/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value set for the integer part.
") Integer;
		Standard_Integer Integer();

		/****** Transfer_BinderOfTransientInteger::SetInteger ******/
		/****** md5 signature: 511ab2dde7e3346c66a01e27176236e9 ******/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "
Parameters
----------
value: int

Return
-------
None

Description
-----------
Sets a value for the integer part.
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


/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def Transfer_DataInfo_Type(*args):
	return Transfer_DataInfo.Type(*args)

@deprecated
def Transfer_DataInfo_TypeName(*args):
	return Transfer_DataInfo.TypeName(*args)

@deprecated
def Transfer_SimpleBinderOfTransient_GetTypedResult(*args):
	return Transfer_SimpleBinderOfTransient.GetTypedResult(*args)

}
