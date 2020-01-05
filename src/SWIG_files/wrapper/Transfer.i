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
%template(Transfer_TransferMapOfProcessForTransient) NCollection_IndexedDataMap <opencascade::handle <Standard_Transient>, opencascade::handle <Transfer_Binder>, TColStd_MapTransientHasher>;
%template(Transfer_SequenceOfBinder) NCollection_Sequence <opencascade::handle <Transfer_Binder>>;
%template(Transfer_SequenceOfFinder) NCollection_Sequence <opencascade::handle <Transfer_Finder>>;
%template(Transfer_TransferMapOfProcessForFinder) NCollection_IndexedDataMap <opencascade::handle <Transfer_Finder>, opencascade::handle <Transfer_Binder>, Transfer_FindHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_IndexedDataMap <opencascade::handle <Standard_Transient>, opencascade::handle <Transfer_Binder>, TColStd_MapTransientHasher> Transfer_TransferMapOfProcessForTransient;
typedef NCollection_Sequence <opencascade::handle <Transfer_Binder>> Transfer_SequenceOfBinder;
typedef NCollection_Sequence <opencascade::handle <Transfer_Finder>> Transfer_SequenceOfFinder;
typedef NCollection_IndexedDataMap <opencascade::handle <Transfer_Finder>, opencascade::handle <Transfer_Binder>, Transfer_FindHasher> Transfer_TransferMapOfProcessForFinder;
/* end typedefs declaration */

/*****************************************
* class Transfer_ActorOfProcessForFinder *
*****************************************/
class Transfer_ActorOfProcessForFinder : public Standard_Transient {
	public:
		/****************** IsLast ******************/
		%feature("compactdefaultargs") IsLast;
		%feature("autodoc", "* Returns the Last status (see SetLast).
	:rtype: bool") IsLast;
		Standard_Boolean IsLast ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Returns the Actor defined as Next, or a Null Handle
	:rtype: opencascade::handle<Transfer_ActorOfProcessForFinder>") Next;
		opencascade::handle<Transfer_ActorOfProcessForFinder> Next ();

		/****************** NullResult ******************/
		%feature("compactdefaultargs") NullResult;
		%feature("autodoc", "* Returns a Binder for No Result, i.e. a Null Handle
	:rtype: opencascade::handle<Transfer_Binder>") NullResult;
		opencascade::handle<Transfer_Binder> NullResult ();

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "* Prerequesite for Transfer : the method Transfer is called on a starting object only if Recognize has returned True on it This allows to define a list of Actors, each one processing a definite kind of data TransferProcess calls Recognize on each one before calling Transfer. But even if Recognize has returned True, Transfer can reject by returning a Null Binder (afterwards rejection), the next actor is then invoked //! The provided default returns True, can be redefined
	:param start:
	:type start: Transfer_Finder
	:rtype: bool") Recognize;
		virtual Standard_Boolean Recognize (const opencascade::handle<Transfer_Finder> & start);

		/****************** SetLast ******************/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "* If <mode> is True, commands an Actor to be set at the end of the list of Actors (see SetNext) If it is False (creation default), each add Actor is set at the beginning of the list This allows to define default Actors (which are Last)
	:param mode: default value is Standard_True
	:type mode: bool
	:rtype: None") SetLast;
		void SetLast (const Standard_Boolean mode = Standard_True);

		/****************** SetNext ******************/
		%feature("compactdefaultargs") SetNext;
		%feature("autodoc", "* Defines a Next Actor : it can then be asked to work if <self> produces no result for a given type of Object. If Next is already set and is not 'Last', calls SetNext on it. If Next defined and 'Last', the new actor is added before it in the list
	:param next:
	:type next: Transfer_ActorOfProcessForFinder
	:rtype: None") SetNext;
		void SetNext (const opencascade::handle<Transfer_ActorOfProcessForFinder> & next);

		/****************** Transfer_ActorOfProcessForFinder ******************/
		%feature("compactdefaultargs") Transfer_ActorOfProcessForFinder;
		%feature("autodoc", ":rtype: None") Transfer_ActorOfProcessForFinder;
		 Transfer_ActorOfProcessForFinder ();

		/****************** Transferring ******************/
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "* Specific action of Transfer. The Result is stored in the returned Binder, or a Null Handle for 'No result' (Default defined as doing nothing; should be deffered) 'mutable' allows the Actor to record intermediate information, in addition to those of TransferProcess
	:param start:
	:type start: Transfer_Finder
	:param TP:
	:type TP: Transfer_ProcessForFinder
	:rtype: opencascade::handle<Transfer_Binder>") Transferring;
		virtual opencascade::handle<Transfer_Binder> Transferring (const opencascade::handle<Transfer_Finder> & start,const opencascade::handle<Transfer_ProcessForFinder> & TP);

		/****************** TransientResult ******************/
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "* Prepares and Returns a Binder for a Transient Result Returns a Null Handle if <res> is itself Null
	:param res:
	:type res: Standard_Transient
	:rtype: opencascade::handle<Transfer_SimpleBinderOfTransient>") TransientResult;
		opencascade::handle<Transfer_SimpleBinderOfTransient> TransientResult (const opencascade::handle<Standard_Transient> & res);

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
		/****************** IsLast ******************/
		%feature("compactdefaultargs") IsLast;
		%feature("autodoc", "* Returns the Last status (see SetLast).
	:rtype: bool") IsLast;
		Standard_Boolean IsLast ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Returns the Actor defined as Next, or a Null Handle
	:rtype: opencascade::handle<Transfer_ActorOfProcessForTransient>") Next;
		opencascade::handle<Transfer_ActorOfProcessForTransient> Next ();

		/****************** NullResult ******************/
		%feature("compactdefaultargs") NullResult;
		%feature("autodoc", "* Returns a Binder for No Result, i.e. a Null Handle
	:rtype: opencascade::handle<Transfer_Binder>") NullResult;
		opencascade::handle<Transfer_Binder> NullResult ();

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "* Prerequesite for Transfer : the method Transfer is called on a starting object only if Recognize has returned True on it This allows to define a list of Actors, each one processing a definite kind of data TransferProcess calls Recognize on each one before calling Transfer. But even if Recognize has returned True, Transfer can reject by returning a Null Binder (afterwards rejection), the next actor is then invoked //! The provided default returns True, can be redefined
	:param start:
	:type start: Standard_Transient
	:rtype: bool") Recognize;
		virtual Standard_Boolean Recognize (const opencascade::handle<Standard_Transient> & start);

		/****************** SetLast ******************/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "* If <mode> is True, commands an Actor to be set at the end of the list of Actors (see SetNext) If it is False (creation default), each add Actor is set at the beginning of the list This allows to define default Actors (which are Last)
	:param mode: default value is Standard_True
	:type mode: bool
	:rtype: None") SetLast;
		void SetLast (const Standard_Boolean mode = Standard_True);

		/****************** SetNext ******************/
		%feature("compactdefaultargs") SetNext;
		%feature("autodoc", "* Defines a Next Actor : it can then be asked to work if <self> produces no result for a given type of Object. If Next is already set and is not 'Last', calls SetNext on it. If Next defined and 'Last', the new actor is added before it in the list
	:param next:
	:type next: Transfer_ActorOfProcessForTransient
	:rtype: None") SetNext;
		void SetNext (const opencascade::handle<Transfer_ActorOfProcessForTransient> & next);

		/****************** Transfer_ActorOfProcessForTransient ******************/
		%feature("compactdefaultargs") Transfer_ActorOfProcessForTransient;
		%feature("autodoc", ":rtype: None") Transfer_ActorOfProcessForTransient;
		 Transfer_ActorOfProcessForTransient ();

		/****************** Transferring ******************/
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "* Specific action of Transfer. The Result is stored in the returned Binder, or a Null Handle for 'No result' (Default defined as doing nothing; should be deffered) 'mutable' allows the Actor to record intermediate information, in addition to those of TransferProcess
	:param start:
	:type start: Standard_Transient
	:param TP:
	:type TP: Transfer_ProcessForTransient
	:rtype: opencascade::handle<Transfer_Binder>") Transferring;
		virtual opencascade::handle<Transfer_Binder> Transferring (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Transfer_ProcessForTransient> & TP);

		/****************** TransientResult ******************/
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "* Prepares and Returns a Binder for a Transient Result Returns a Null Handle if <res> is itself Null
	:param res:
	:type res: Standard_Transient
	:rtype: opencascade::handle<Transfer_SimpleBinderOfTransient>") TransientResult;
		opencascade::handle<Transfer_SimpleBinderOfTransient> TransientResult (const opencascade::handle<Standard_Transient> & res);

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
		%feature("autodoc", "* Used to declare an individual transfer as beeing erroneous (Status is set to Void, StatusExec is set to Error, <errmess> is added to Check's list of Fails) It is possible to record several messages of error //! It has same effect for TransferProcess as raising an exception during the operation of Transfer, except the Transfer tries to continue (as if ErrorHandle had been set)
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None") AddFail;
		void AddFail (const char * mess,const char * orig = "");

		/****************** AddResult ******************/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "* Adds a next result (at the end of the list) Remark : this information is not processed by Merge
	:param next:
	:type next: Transfer_Binder
	:rtype: None") AddResult;
		void AddResult (const opencascade::handle<Transfer_Binder> & next);

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "* Used to attach a Warning Message to an individual Transfer It has no effect on the Status
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None") AddWarning;
		void AddWarning (const char * mess,const char * orig = "");

		/****************** CCheck ******************/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "* Returns Check which stores Fail messages, in order to modify it (adding messages, or replacing it)
	:rtype: opencascade::handle<Interface_Check>") CCheck;
		opencascade::handle<Interface_Check> CCheck ();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "* Returns Check which stores Fail messages Note that no Entity is associated in this Check
	:rtype: opencascade::handle<Interface_Check>") Check;
		const opencascade::handle<Interface_Check> Check ();

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "* Returns True if a Result is available (StatusResult = Defined) A Unique Result will be gotten by Result (which must be defined in each sub-class according to result type) For a Multiple Result, see class MultipleBinder For other case, specific access has to be forecast
	:rtype: bool") HasResult;
		Standard_Boolean HasResult ();

		/****************** IsMultiple ******************/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "* Returns True if a Binder has several results, either by itself or because it has next results Can be defined by sub-classes.
	:rtype: bool") IsMultiple;
		virtual Standard_Boolean IsMultiple ();

		/****************** Merge ******************/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "* Merges basic data (Check, ExecStatus) from another Binder but keeps its result. Used when a binder is replaced by another one, this allows to keep messages
	:param other:
	:type other: Transfer_Binder
	:rtype: None") Merge;
		void Merge (const opencascade::handle<Transfer_Binder> & other);

		/****************** NextResult ******************/
		%feature("compactdefaultargs") NextResult;
		%feature("autodoc", "* Returns the next result, Null if none
	:rtype: opencascade::handle<Transfer_Binder>") NextResult;
		opencascade::handle<Transfer_Binder> NextResult ();

		/****************** ResultType ******************/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "* Returns the Type which characterizes the Result (if known)
	:rtype: opencascade::handle<Standard_Type>") ResultType;
		virtual opencascade::handle<Standard_Type> ResultType ();

		/****************** ResultTypeName ******************/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "* Returns the Name of the Type which characterizes the Result Can be returned even if ResultType itself is unknown
	:rtype: char *") ResultTypeName;
		virtual const char * ResultTypeName ();

		/****************** SetAlreadyUsed ******************/
		%feature("compactdefaultargs") SetAlreadyUsed;
		%feature("autodoc", "* Declares that result is now used by another one, it means that it cannot be modified (by Rebind)
	:rtype: None") SetAlreadyUsed;
		void SetAlreadyUsed ();

		/****************** SetStatusExec ******************/
		%feature("compactdefaultargs") SetStatusExec;
		%feature("autodoc", "* Modifies execution status; called by TransferProcess only (for StatusError, rather use SetError, below)
	:param stat:
	:type stat: Transfer_StatusExec
	:rtype: None") SetStatusExec;
		void SetStatusExec (const Transfer_StatusExec stat);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns status, which can be Initial (not yet done), Made (a result is recorded, not yet shared), Used (it is shared and cannot be modified)
	:rtype: Transfer_StatusResult") Status;
		Transfer_StatusResult Status ();

		/****************** StatusExec ******************/
		%feature("compactdefaultargs") StatusExec;
		%feature("autodoc", "* Returns execution status
	:rtype: Transfer_StatusExec") StatusExec;
		Transfer_StatusExec StatusExec ();

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
		%feature("autodoc", "* Returns the Type attached to an object Here, the Dynamic Type of a Transient. Null Type if unknown
	:param ent:
	:type ent: Standard_Transient
	:rtype: opencascade::handle<Standard_Type>") Type;
		static opencascade::handle<Standard_Type> Type (const opencascade::handle<Standard_Transient> & ent);

		/****************** TypeName ******************/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "* Returns Type Name (string) Allows to name type of non-handled objects
	:param ent:
	:type ent: Standard_Transient
	:rtype: char *") TypeName;
		static const char * TypeName (const opencascade::handle<Standard_Transient> & ent);

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
		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "* Binds a (Transient) Result to a (Transient) Starting Entity
	:param ent:
	:type ent: Standard_Transient
	:param res:
	:type res: Standard_Transient
	:rtype: None") Bind;
		void Bind (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Standard_Transient> & res);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the List of Copied Results
	:rtype: None") Clear;
		void Clear ();

		/****************** Search ******************/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "* Searches for the Result bound to a Starting Entity If Found, returns True and fills <res> Else, returns False and nullifies <res>
	:param ent:
	:type ent: Standard_Transient
	:param res:
	:type res: Standard_Transient
	:rtype: bool") Search;
		Standard_Boolean Search (const opencascade::handle<Standard_Transient> & ent,opencascade::handle<Standard_Transient> & res);

		/****************** StartingModel ******************/
		%feature("compactdefaultargs") StartingModel;
		%feature("autodoc", "* Returns the Model from which the transfer is to be done
	:rtype: opencascade::handle<Interface_InterfaceModel>") StartingModel;
		const opencascade::handle<Interface_InterfaceModel> & StartingModel ();

		/****************** Transfer_DispatchControl ******************/
		%feature("compactdefaultargs") Transfer_DispatchControl;
		%feature("autodoc", "* Creates the DispatchControl, ready for use
	:param model:
	:type model: Interface_InterfaceModel
	:param TP:
	:type TP: Transfer_TransientProcess
	:rtype: None") Transfer_DispatchControl;
		 Transfer_DispatchControl (const opencascade::handle<Interface_InterfaceModel> & model,const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** TransientProcess ******************/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "* Returns the content of the DispatchControl : it can be used for a direct call, if the basic methods do not suffice
	:rtype: opencascade::handle<Transfer_TransientProcess>") TransientProcess;
		const opencascade::handle<Transfer_TransientProcess> & TransientProcess ();

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
		%feature("autodoc", "* Returns hash code for the given finder, in the range [1, theUpperBound]. Asks the finder its hash code, then transforms it to be in the required range @param theFinder the finder which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]
	:param theFinder:
	:type theFinder: Transfer_Finder
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int") HashCode;
		static Standard_Integer HashCode (const opencascade::handle<Transfer_Finder> & theFinder,Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True if two keys are the same. The test does not work on the Finders themselves but by calling their methods Equates
	:param K1:
	:type K1: Transfer_Finder
	:param K2:
	:type K2: Transfer_Finder
	:rtype: bool") IsEqual;
		static Standard_Boolean IsEqual (const opencascade::handle<Transfer_Finder> & K1,const opencascade::handle<Transfer_Finder> & K2);

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
		%feature("autodoc", "* Returns the exhaustive list of attributes
	:rtype: NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient> >") AttrList;
		NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient> > & AttrList ();

		/****************** Attribute ******************/
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "* Returns an attribute from its name. Null Handle if not recorded (whatever Transient, Integer, Real ...)
	:param name:
	:type name: char *
	:rtype: opencascade::handle<Standard_Transient>") Attribute;
		opencascade::handle<Standard_Transient> Attribute (const char * name);

		/****************** AttributeType ******************/
		%feature("compactdefaultargs") AttributeType;
		%feature("autodoc", "* Returns the type of an attribute : ParamInt , ParamReal , ParamText (String) , ParamIdent (any) or ParamVoid (not recorded)
	:param name:
	:type name: char *
	:rtype: Interface_ParamType") AttributeType;
		Interface_ParamType AttributeType (const char * name);

		/****************** Equates ******************/
		%feature("compactdefaultargs") Equates;
		%feature("autodoc", "* Specific testof equallity : to be defined by each sub-class, must be False if Finders have not the same true Type, else their contents must be compared
	:param other:
	:type other: Transfer_Finder
	:rtype: bool") Equates;
		virtual Standard_Boolean Equates (const opencascade::handle<Transfer_Finder> & other);

		/****************** GetAttribute ******************/
		%feature("compactdefaultargs") GetAttribute;
		%feature("autodoc", "* Returns an attribute from its name, filtered by a type If no attribute has this name, or if it is not kind of this type, <val> is Null and returned value is False Else, it is True
	:param name:
	:type name: char *
	:param type:
	:type type: Standard_Type
	:param val:
	:type val: Standard_Transient
	:rtype: bool") GetAttribute;
		Standard_Boolean GetAttribute (const char * name,const opencascade::handle<Standard_Type> & type,opencascade::handle<Standard_Transient> & val);

		/****************** GetAttributes ******************/
		%feature("compactdefaultargs") GetAttributes;
		%feature("autodoc", "* Gets the list of attributes from <other>, by copying it By default, considers all the attributes from <other> If <fromname> is given, considers only the attributes with name beginning by <fromname> //! For each attribute, if <copied> is True (D), its value is also copied if it is a basic type (Integer,Real,String), else it remains shared between <other> and <self> //! These new attributes are added to the existing ones in <self>, in case of same name, they replace the existing ones
	:param other:
	:type other: Transfer_Finder
	:param fromname: default value is ""
	:type fromname: char *
	:param copied: default value is Standard_True
	:type copied: bool
	:rtype: None") GetAttributes;
		void GetAttributes (const opencascade::handle<Transfer_Finder> & other,const char * fromname = "",const Standard_Boolean copied = Standard_True);

		/****************** GetHashCode ******************/
		%feature("compactdefaultargs") GetHashCode;
		%feature("autodoc", "* Returns the HashCode which has been stored by SetHashCode (remark that HashCode could be deferred then be defined by sub-classes, the result is the same)
	:rtype: int") GetHashCode;
		Standard_Integer GetHashCode ();

		/****************** GetIntegerAttribute ******************/
		%feature("compactdefaultargs") GetIntegerAttribute;
		%feature("autodoc", "* Returns an attribute from its name, as integer If no attribute has this name, or not an integer, <val> is 0 and returned value is False Else, it is True
	:param name:
	:type name: char *
	:param val:
	:type val: int
	:rtype: bool") GetIntegerAttribute;
		Standard_Boolean GetIntegerAttribute (const char * name,Standard_Integer &OutValue);

		/****************** GetRealAttribute ******************/
		%feature("compactdefaultargs") GetRealAttribute;
		%feature("autodoc", "* Returns an attribute from its name, as real If no attribute has this name, or not a real <val> is 0.0 and returned value is False Else, it is True
	:param name:
	:type name: char *
	:param val:
	:type val: float
	:rtype: bool") GetRealAttribute;
		Standard_Boolean GetRealAttribute (const char * name,Standard_Real &OutValue);

		/****************** GetStringAttribute ******************/
		%feature("compactdefaultargs") GetStringAttribute;
		%feature("autodoc", "* Returns an attribute from its name, as String If no attribute has this name, or not a String <val> is 0.0 and returned value is False Else, it is True
	:param name:
	:type name: char *
	:param val:
	:type val: char *
	:rtype: bool") GetStringAttribute;
		Standard_Boolean GetStringAttribute (const char * name,const char * & val);

		/****************** IntegerAttribute ******************/
		%feature("compactdefaultargs") IntegerAttribute;
		%feature("autodoc", "* Returns an integer attribute from its name. 0 if not recorded
	:param name:
	:type name: char *
	:rtype: int") IntegerAttribute;
		Standard_Integer IntegerAttribute (const char * name);

		/****************** RealAttribute ******************/
		%feature("compactdefaultargs") RealAttribute;
		%feature("autodoc", "* Returns a real attribute from its name. 0.0 if not recorded
	:param name:
	:type name: char *
	:rtype: float") RealAttribute;
		Standard_Real RealAttribute (const char * name);

		/****************** RemoveAttribute ******************/
		%feature("compactdefaultargs") RemoveAttribute;
		%feature("autodoc", "* Removes an attribute Returns True when done, False if this attribute did not exist
	:param name:
	:type name: char *
	:rtype: bool") RemoveAttribute;
		Standard_Boolean RemoveAttribute (const char * name);

		/****************** SameAttributes ******************/
		%feature("compactdefaultargs") SameAttributes;
		%feature("autodoc", "* Gets the list of attributes from <other>, as such, i.e. not copied : attributes are shared, any attribute edited, added, or removed in <other> is also in <self> and vice versa The former list of attributes of <self> is dropped
	:param other:
	:type other: Transfer_Finder
	:rtype: None") SameAttributes;
		void SameAttributes (const opencascade::handle<Transfer_Finder> & other);

		/****************** SetAttribute ******************/
		%feature("compactdefaultargs") SetAttribute;
		%feature("autodoc", "* Adds an attribute with a given name (replaces the former one with the same name if already exists)
	:param name:
	:type name: char *
	:param val:
	:type val: Standard_Transient
	:rtype: None") SetAttribute;
		void SetAttribute (const char * name,const opencascade::handle<Standard_Transient> & val);

		/****************** SetIntegerAttribute ******************/
		%feature("compactdefaultargs") SetIntegerAttribute;
		%feature("autodoc", "* Adds an integer value for an attribute
	:param name:
	:type name: char *
	:param val:
	:type val: int
	:rtype: None") SetIntegerAttribute;
		void SetIntegerAttribute (const char * name,const Standard_Integer val);

		/****************** SetRealAttribute ******************/
		%feature("compactdefaultargs") SetRealAttribute;
		%feature("autodoc", "* Adds a real value for an attribute
	:param name:
	:type name: char *
	:param val:
	:type val: float
	:rtype: None") SetRealAttribute;
		void SetRealAttribute (const char * name,const Standard_Real val);

		/****************** SetStringAttribute ******************/
		%feature("compactdefaultargs") SetStringAttribute;
		%feature("autodoc", "* Adds a String value for an attribute
	:param name:
	:type name: char *
	:param val:
	:type val: char *
	:rtype: None") SetStringAttribute;
		void SetStringAttribute (const char * name,const char * val);

		/****************** StringAttribute ******************/
		%feature("compactdefaultargs") StringAttribute;
		%feature("autodoc", "* Returns a String attribute from its name. '' if not recorded
	:param name:
	:type name: char *
	:rtype: char *") StringAttribute;
		const char * StringAttribute (const char * name);

		/****************** ValueType ******************/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "* Returns the Type of the Value. By default, returns the DynamicType of <self>, but can be redefined
	:rtype: opencascade::handle<Standard_Type>") ValueType;
		virtual opencascade::handle<Standard_Type> ValueType ();

		/****************** ValueTypeName ******************/
		%feature("compactdefaultargs") ValueTypeName;
		%feature("autodoc", "* Returns the name of the Type of the Value. Default is name of ValueType, unless it is for a non-handled object
	:rtype: char *") ValueTypeName;
		virtual const char * ValueTypeName ();

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
		/****************** GetMapObjects ******************/
		%feature("compactdefaultargs") GetMapObjects;
		%feature("autodoc", "* Get map already translated geometry objects.
	:rtype: TColStd_DataMapOfTransientTransient") GetMapObjects;
		TColStd_DataMapOfTransientTransient & GetMapObjects ();

		/****************** SetMapObjects ******************/
		%feature("compactdefaultargs") SetMapObjects;
		%feature("autodoc", "* Set map already translated geometry objects.
	:param theMapObjects:
	:type theMapObjects: TColStd_DataMapOfTransientTransient
	:rtype: None") SetMapObjects;
		void SetMapObjects (TColStd_DataMapOfTransientTransient & theMapObjects);

		/****************** Transfer_MapContainer ******************/
		%feature("compactdefaultargs") Transfer_MapContainer;
		%feature("autodoc", ":rtype: None") Transfer_MapContainer;
		 Transfer_MapContainer ();

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
		/****************** AbnormalResult ******************/
		%feature("compactdefaultargs") AbnormalResult;
		%feature("autodoc", "* Returns Binders which are neither 'Done' nor 'Initial', that is Error,Loop or Run (abnormal states at end of Transfer) Starting Objects are given in correspondance in the iterator
	:rtype: Transfer_IteratorOfProcessForTransient") AbnormalResult;
		Transfer_IteratorOfProcessForTransient AbnormalResult ();

		/****************** Actor ******************/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "* Returns the defined Actor. Returns a Null Handle if not set.
	:rtype: opencascade::handle<Transfer_ActorOfProcessForTransient>") Actor;
		opencascade::handle<Transfer_ActorOfProcessForTransient> Actor ();

		/****************** AddError ******************/
		%feature("compactdefaultargs") AddError;
		%feature("autodoc", "* (other name of AddFail, maintained for compatibility)
	:param start:
	:type start: Standard_Transient
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None") AddError;
		void AddError (const opencascade::handle<Standard_Transient> & start,const char * mess,const char * orig = "");

		/****************** AddFail ******************/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "* Adds an Error message to a starting entity (to the check of its Binder of category 0, as a Fail)
	:param start:
	:type start: Standard_Transient
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None") AddFail;
		void AddFail (const opencascade::handle<Standard_Transient> & start,const char * mess,const char * orig = "");

		/****************** AddFail ******************/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "* Adds an Error Message to a starting entity from the definition of a Msg (Original+Value)
	:param start:
	:type start: Standard_Transient
	:param amsg:
	:type amsg: Message_Msg
	:rtype: None") AddFail;
		void AddFail (const opencascade::handle<Standard_Transient> & start,const Message_Msg & amsg);

		/****************** AddMultiple ******************/
		%feature("compactdefaultargs") AddMultiple;
		%feature("autodoc", "* Adds an item to a list of results bound to a starting object. Considers a category number, by default 0, for all results
	:param start:
	:type start: Standard_Transient
	:param res:
	:type res: Standard_Transient
	:rtype: None") AddMultiple;
		void AddMultiple (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Standard_Transient> & res);

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "* Adds a Warning message to a starting entity (to the check of its Binder of category 0)
	:param start:
	:type start: Standard_Transient
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None") AddWarning;
		void AddWarning (const opencascade::handle<Standard_Transient> & start,const char * mess,const char * orig = "");

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "* Adds a Warning Message to a starting entity from the definition of a Msg (Original+Value)
	:param start:
	:type start: Standard_Transient
	:param amsg:
	:type amsg: Message_Msg
	:rtype: None") AddWarning;
		void AddWarning (const opencascade::handle<Standard_Transient> & start,const Message_Msg & amsg);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "* Creates a Link a starting Object with a Binder. This Binder can either bring a Result (effective Binding) or none (it can be set later : pre-binding). Considers a category number, by default 0
	:param start:
	:type start: Standard_Transient
	:param binder:
	:type binder: Transfer_Binder
	:rtype: None") Bind;
		void Bind (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Transfer_Binder> & binder);

		/****************** BindMultiple ******************/
		%feature("compactdefaultargs") BindMultiple;
		%feature("autodoc", "* Prepares an object <start> to be bound with several results. If no Binder is yet attached to <obj>, a MultipleBinder is created, empty. If a Binder is already set, it must accept Multiple Binding. Considers a category number, by default 0
	:param start:
	:type start: Standard_Transient
	:rtype: None") BindMultiple;
		void BindMultiple (const opencascade::handle<Standard_Transient> & start);

		/****************** BindTransient ******************/
		%feature("compactdefaultargs") BindTransient;
		%feature("autodoc", "* Binds a starting object with a Transient Result. Uses a SimpleBinderOfTransient to work. If there is already one but with no Result set, sets its Result. Considers a category number, by default 0
	:param start:
	:type start: Standard_Transient
	:param res:
	:type res: Standard_Transient
	:rtype: None") BindTransient;
		void BindTransient (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Standard_Transient> & res);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "* Returns the Check attached to a starting entity. If <start> is unknown, returns an empty Check Adds a case name to a starting entity Adds a case value to a starting entity Returns the complete case list for an entity. Null Handle if empty In the list of mapped items (between 1 and NbMapped), searches for the first item which follows <num0>(not included) and which has an attribute named <name> Attributes are brought by Binders Hence, allows such an iteration //! for (num = TP->NextItemWithAttribute(name,0); num > 0; num = TP->NextItemWithAttribute(name,num) { .. process mapped item <num> } Returns the type of an Attribute attached to binders If this name gives no Attribute, returns ParamVoid If this name gives several different types, returns ParamMisc Else, returns the effective type (ParamInteger, ParamReal, ParamIdent, or ParamText) Returns the list of recorded Attribute Names, as a Dictionary of Integer : each value gives the count of items which bring this attribute name By default, considers all the attribute names If <rootname> is given, considers only the attribute names which begin by <rootname>
	:param start:
	:type start: Standard_Transient
	:rtype: opencascade::handle<Interface_Check>") Check;
		opencascade::handle<Interface_Check> Check (const opencascade::handle<Standard_Transient> & start);

		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "* Returns a CheckList as a list of Check : each one is for a starting entity which have either check (warning or fail) messages are attached, or are in abnormal state : that case gives a specific message If <erronly> is True, checks with Warnings only are ignored
	:param erronly:
	:type erronly: bool
	:rtype: Interface_CheckIterator") CheckList;
		Interface_CheckIterator CheckList (const Standard_Boolean erronly);

		/****************** CheckListOne ******************/
		%feature("compactdefaultargs") CheckListOne;
		%feature("autodoc", "* Returns a CheckList for one starting object <level> interpreted as by ResultOne If <erronly> is True, checks with Warnings only are ignored
	:param start:
	:type start: Standard_Transient
	:param level:
	:type level: int
	:param erronly:
	:type erronly: bool
	:rtype: Interface_CheckIterator") CheckListOne;
		Interface_CheckIterator CheckListOne (const opencascade::handle<Standard_Transient> & start,const Standard_Integer level,const Standard_Boolean erronly);

		/****************** CheckNum ******************/
		%feature("compactdefaultargs") CheckNum;
		%feature("autodoc", "* Computes a number to be associated to a starting object in a check or a check-list By default, returns 0; can be redefined
	:param start:
	:type start: Standard_Transient
	:rtype: int") CheckNum;
		virtual Standard_Integer CheckNum (const opencascade::handle<Standard_Transient> & start);

		/****************** Clean ******************/
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "* Rebuilds the Map and the roots to really remove Unbound items Because Unbind keeps the entity in place, even if not bound Hence, working by checking new items is meaningless if a formerly unbound item is rebound
	:rtype: None") Clean;
		void Clean ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Resets a TransferProcess as ready for a completely new work. Clears general data (roots) and the Map
	:rtype: None") Clear;
		void Clear ();

		/****************** CompleteResult ******************/
		%feature("compactdefaultargs") CompleteResult;
		%feature("autodoc", "* Returns, as an Iterator, the entire log of transfer (list of created objects and Binders which can bring errors) If withstart is given True, Starting Objets are also returned
	:param withstart: default value is Standard_False
	:type withstart: bool
	:rtype: Transfer_IteratorOfProcessForTransient") CompleteResult;
		Transfer_IteratorOfProcessForTransient CompleteResult (const Standard_Boolean withstart = Standard_False);

		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "* Returns the Binder which is linked with a starting Object It can either bring a Result (Transfer done) or none (for a pre-binding). If no Binder is linked with <start>, returns a Null Handle Considers a category number, by default 0
	:param start:
	:type start: Standard_Transient
	:rtype: opencascade::handle<Transfer_Binder>") Find;
		opencascade::handle<Transfer_Binder> Find (const opencascade::handle<Standard_Transient> & start);

		/****************** FindElseBind ******************/
		%feature("compactdefaultargs") FindElseBind;
		%feature("autodoc", "* Returns a Binder for a starting entity, as follows : Tries to Find the already bound one If none found, creates a VoidBinder and Binds it
	:param start:
	:type start: Standard_Transient
	:rtype: opencascade::handle<Transfer_Binder>") FindElseBind;
		opencascade::handle<Transfer_Binder> FindElseBind (const opencascade::handle<Standard_Transient> & start);

		/****************** FindTransient ******************/
		%feature("compactdefaultargs") FindTransient;
		%feature("autodoc", "* Returns the Result of the Transfer of an object <start> as a Transient Result. Returns a Null Handle if there is no Transient Result Considers a category number, by default 0 Warning : Supposes that Binding is done with a SimpleBinderOfTransient
	:param start:
	:type start: Standard_Transient
	:rtype: opencascade::handle<Standard_Transient>") FindTransient;
		const opencascade::handle<Standard_Transient> & FindTransient (const opencascade::handle<Standard_Transient> & start);

		/****************** FindTypedTransient ******************/
		%feature("compactdefaultargs") FindTypedTransient;
		%feature("autodoc", "* Searches for a transient result attached to a starting object, according to its type, by criterium IsKind(atype) //! In case of multiple result, explores the list and gives in <val> the first transient result IsKind(atype) Returns True and fills <val> if found Else, returns False (<val> is not touched, not even nullified) //! This syntactic form avoids to do DownCast : if a result is found with the good type, it is loaded in <val> and can be immediately used, well initialised
	:param start:
	:type start: Standard_Transient
	:param atype:
	:type atype: Standard_Type
	:param val:
	:type val: Standard_Transient
	:rtype: bool") FindTypedTransient;
		Standard_Boolean FindTypedTransient (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Standard_Type> & atype,opencascade::handle<Standard_Transient> & val);

		/****************** GetProgress ******************/
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "* Gets Progress indicator
	:rtype: opencascade::handle<Message_ProgressIndicator>") GetProgress;
		opencascade::handle<Message_ProgressIndicator> GetProgress ();

		/****************** GetTypedTransient ******************/
		%feature("compactdefaultargs") GetTypedTransient;
		%feature("autodoc", "* Searches for a transient result recorded in a Binder, whatever this Binder is recorded or not in <self> //! This is strictly equivalent to the class method GetTypedResult from class SimpleBinderOfTransient, but is just lighter to call //! Apart from this, works as FindTypedTransient
	:param binder:
	:type binder: Transfer_Binder
	:param atype:
	:type atype: Standard_Type
	:param val:
	:type val: Standard_Transient
	:rtype: bool") GetTypedTransient;
		Standard_Boolean GetTypedTransient (const opencascade::handle<Transfer_Binder> & binder,const opencascade::handle<Standard_Type> & atype,opencascade::handle<Standard_Transient> & val);

		/****************** IsAlreadyUsed ******************/
		%feature("compactdefaultargs") IsAlreadyUsed;
		%feature("autodoc", "* Returns True if the result of the transfer of an object is already used in other ones. If it is, Rebind cannot change it. Considers a category number, by default 0
	:param start:
	:type start: Standard_Transient
	:rtype: bool") IsAlreadyUsed;
		Standard_Boolean IsAlreadyUsed (const opencascade::handle<Standard_Transient> & start);

		/****************** IsBound ******************/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "* Returns True if a Result (whatever its form) is Bound with a starting Object. I.e., if a Binder with a Result set, is linked with it Considers a category number, by default 0
	:param start:
	:type start: Standard_Transient
	:rtype: bool") IsBound;
		Standard_Boolean IsBound (const opencascade::handle<Standard_Transient> & start);

		/****************** IsCheckListEmpty ******************/
		%feature("compactdefaultargs") IsCheckListEmpty;
		%feature("autodoc", "* Returns True if no check message is attached to a starting object. <level> interpreted as by ResultOne If <erronly> is True, checks with Warnings only are ignored
	:param start:
	:type start: Standard_Transient
	:param level:
	:type level: int
	:param erronly:
	:type erronly: bool
	:rtype: bool") IsCheckListEmpty;
		Standard_Boolean IsCheckListEmpty (const opencascade::handle<Standard_Transient> & start,const Standard_Integer level,const Standard_Boolean erronly);

		/****************** IsLooping ******************/
		%feature("compactdefaultargs") IsLooping;
		%feature("autodoc", "* Returns True if we are surely in a DeadLoop. Evaluation is not exact, it is a 'majorant' which must be computed fast. This 'majorant' is : <alevel> greater than NbMapped.
	:param alevel:
	:type alevel: int
	:rtype: bool") IsLooping;
		Standard_Boolean IsLooping (const Standard_Integer alevel);

		/****************** MapIndex ******************/
		%feature("compactdefaultargs") MapIndex;
		%feature("autodoc", "* Returns the Index value bound to a Starting Object, 0 if none
	:param start:
	:type start: Standard_Transient
	:rtype: int") MapIndex;
		Standard_Integer MapIndex (const opencascade::handle<Standard_Transient> & start);

		/****************** MapItem ******************/
		%feature("compactdefaultargs") MapItem;
		%feature("autodoc", "* Returns the Binder bound to an Index Considers a category number, by default 0
	:param num:
	:type num: int
	:rtype: opencascade::handle<Transfer_Binder>") MapItem;
		opencascade::handle<Transfer_Binder> MapItem (const Standard_Integer num);

		/****************** Mapped ******************/
		%feature("compactdefaultargs") Mapped;
		%feature("autodoc", "* Returns the Starting Object bound to an Index,
	:param num:
	:type num: int
	:rtype: opencascade::handle<Standard_Transient>") Mapped;
		const opencascade::handle<Standard_Transient> & Mapped (const Standard_Integer num);

		/****************** Mend ******************/
		%feature("compactdefaultargs") Mend;
		%feature("autodoc", ":param start:
	:type start: Standard_Transient
	:param pref: default value is ""
	:type pref: char *
	:rtype: None") Mend;
		void Mend (const opencascade::handle<Standard_Transient> & start,const char * pref = "");

		/****************** Messenger ******************/
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "* Returns Messenger used for outputting messages. The returned object is guaranteed to be non-null; default is Message::Messenger().
	:rtype: opencascade::handle<Message_Messenger>") Messenger;
		opencascade::handle<Message_Messenger> Messenger ();

		/****************** NbMapped ******************/
		%feature("compactdefaultargs") NbMapped;
		%feature("autodoc", "* Returns the maximum possible value for Map Index (no result can be bound with a value greater than it)
	:rtype: int") NbMapped;
		Standard_Integer NbMapped ();

		/****************** NbRoots ******************/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "* Returns the count of recorded Roots
	:rtype: int") NbRoots;
		Standard_Integer NbRoots ();

		/****************** NestingLevel ******************/
		%feature("compactdefaultargs") NestingLevel;
		%feature("autodoc", "* Returns Nesting Level of Transfers (managed by methods TranscriptWith & Co). Starts to zero. If no automatic Transfer is used, it remains to zero. Zero means Root Level.
	:rtype: int") NestingLevel;
		Standard_Integer NestingLevel ();

		/****************** PrintTrace ******************/
		%feature("compactdefaultargs") PrintTrace;
		%feature("autodoc", "* Prints a short information on a starting object. By default prints its Dynamic Type. Can be redefined
	:param start:
	:type start: Standard_Transient
	:param S:
	:type S: Message_Messenger
	:rtype: void") PrintTrace;
		virtual void PrintTrace (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Message_Messenger> & S);

		/****************** Rebind ******************/
		%feature("compactdefaultargs") Rebind;
		%feature("autodoc", "* Changes the Binder linked with a starting Object for its unitary transfer. This it can be useful when the exact form of the result is known once the transfer is widely engaged. This can be done only on first transfer. Considers a category number, by default 0
	:param start:
	:type start: Standard_Transient
	:param binder:
	:type binder: Transfer_Binder
	:rtype: None") Rebind;
		void Rebind (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Transfer_Binder> & binder);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "* Tells if <start> has been recognized as good candidate for Transfer. i.e. queries the Actor and its Nexts
	:param start:
	:type start: Standard_Transient
	:rtype: bool") Recognize;
		Standard_Boolean Recognize (const opencascade::handle<Standard_Transient> & start);

		/****************** RemoveResult ******************/
		%feature("compactdefaultargs") RemoveResult;
		%feature("autodoc", "* Removes Results attached to (== Unbinds) a given object and, according <level> : <level> = 0 : only it <level> = 1 : it plus its immediately owned sub-results(scope) <level> = 2 : it plus all its owned sub-results(scope)
	:param start:
	:type start: Standard_Transient
	:param level:
	:type level: int
	:param compute: default value is Standard_True
	:type compute: bool
	:rtype: None") RemoveResult;
		void RemoveResult (const opencascade::handle<Standard_Transient> & start,const Standard_Integer level,const Standard_Boolean compute = Standard_True);

		/****************** ResetNestingLevel ******************/
		%feature("compactdefaultargs") ResetNestingLevel;
		%feature("autodoc", "* Resets Nesting Level of Transfers to Zero (Root Level), whatever its current value.
	:rtype: None") ResetNestingLevel;
		void ResetNestingLevel ();

		/****************** Resize ******************/
		%feature("compactdefaultargs") Resize;
		%feature("autodoc", "* Resizes the Map as required (if a new reliable value has been determined). Acts only if <nb> is greater than actual NbMapped
	:param nb:
	:type nb: int
	:rtype: None") Resize;
		void Resize (const Standard_Integer nb);

		/****************** ResultOne ******************/
		%feature("compactdefaultargs") ResultOne;
		%feature("autodoc", "* Returns, as an Iterator, the log of transfer for one object <level> = 0 : this object only and if <start> is a scope owner (else, <level> is ignored) : <level> = 1 : object plus its immediate scoped ones <level> = 2 : object plus all its scoped ones
	:param start:
	:type start: Standard_Transient
	:param level:
	:type level: int
	:param withstart: default value is Standard_False
	:type withstart: bool
	:rtype: Transfer_IteratorOfProcessForTransient") ResultOne;
		Transfer_IteratorOfProcessForTransient ResultOne (const opencascade::handle<Standard_Transient> & start,const Standard_Integer level,const Standard_Boolean withstart = Standard_False);

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "* Returns a Root Entity given its number in the list (1-NbRoots)
	:param num:
	:type num: int
	:rtype: opencascade::handle<Standard_Transient>") Root;
		const opencascade::handle<Standard_Transient> & Root (const Standard_Integer num);

		/****************** RootIndex ******************/
		%feature("compactdefaultargs") RootIndex;
		%feature("autodoc", "* Returns the index in the list of roots for a starting item, or 0 if it is not recorded as a root
	:param start:
	:type start: Standard_Transient
	:rtype: int") RootIndex;
		Standard_Integer RootIndex (const opencascade::handle<Standard_Transient> & start);

		/****************** RootItem ******************/
		%feature("compactdefaultargs") RootItem;
		%feature("autodoc", "* Returns the Binder bound with a Root Entity given its number Considers a category number, by default 0
	:param num:
	:type num: int
	:rtype: opencascade::handle<Transfer_Binder>") RootItem;
		opencascade::handle<Transfer_Binder> RootItem (const Standard_Integer num);

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns, as an iterator, the log of root transfer, i.e. the created objects and Binders bound to starting roots If withstart is given True, Starting Objets are also returned
	:param withstart: default value is Standard_False
	:type withstart: bool
	:rtype: Transfer_IteratorOfProcessForTransient") RootResult;
		Transfer_IteratorOfProcessForTransient RootResult (const Standard_Boolean withstart = Standard_False);

		/****************** SendFail ******************/
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "* New name for AddFail (Msg)
	:param start:
	:type start: Standard_Transient
	:param amsg:
	:type amsg: Message_Msg
	:rtype: None") SendFail;
		void SendFail (const opencascade::handle<Standard_Transient> & start,const Message_Msg & amsg);

		/****************** SendMsg ******************/
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "* Adds an information message Trace is filled if trace level is at least 3
	:param start:
	:type start: Standard_Transient
	:param amsg:
	:type amsg: Message_Msg
	:rtype: None") SendMsg;
		void SendMsg (const opencascade::handle<Standard_Transient> & start,const Message_Msg & amsg);

		/****************** SendWarning ******************/
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "* New name for AddWarning (Msg)
	:param start:
	:type start: Standard_Transient
	:param amsg:
	:type amsg: Message_Msg
	:rtype: None") SendWarning;
		void SendWarning (const opencascade::handle<Standard_Transient> & start,const Message_Msg & amsg);

		/****************** SetActor ******************/
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "* Defines an Actor, which is used for automatic Transfer If already defined, the new Actor is cumulated (see SetNext from Actor)
	:param actor:
	:type actor: Transfer_ActorOfProcessForTransient
	:rtype: None") SetActor;
		void SetActor (const opencascade::handle<Transfer_ActorOfProcessForTransient> & actor);

		/****************** SetMessenger ******************/
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "* Sets Messenger used for outputting messages.
	:param messenger:
	:type messenger: Message_Messenger
	:rtype: None") SetMessenger;
		void SetMessenger (const opencascade::handle<Message_Messenger> & messenger);

		/****************** SetProgress ******************/
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "* Sets Progress indicator
	:param theProgress:
	:type theProgress: Message_ProgressIndicator
	:rtype: None") SetProgress;
		void SetProgress (const opencascade::handle<Message_ProgressIndicator> & theProgress);

		/****************** SetRoot ******************/
		%feature("compactdefaultargs") SetRoot;
		%feature("autodoc", "* Declares <obj> (and its Result) as Root. This status will be later exploited by RootResult, see below (Result can be produced at any time)
	:param start:
	:type start: Standard_Transient
	:rtype: None") SetRoot;
		void SetRoot (const opencascade::handle<Standard_Transient> & start);

		/****************** SetRootManagement ******************/
		%feature("compactdefaultargs") SetRootManagement;
		%feature("autodoc", "* Enable (if <stat> True) or Disables (if <stat> False) Root Management. If it is set, Transfers are considered as stacked (a first Transfer commands other Transfers, and so on) and the Transfers commanded by an external caller are 'Root'. Remark : SetRoot can be called whatever this status, on every object. Default is set to True.
	:param stat:
	:type stat: bool
	:rtype: None") SetRootManagement;
		void SetRootManagement (const Standard_Boolean stat);

		/****************** SetTraceLevel ******************/
		%feature("compactdefaultargs") SetTraceLevel;
		%feature("autodoc", "* Sets trace level used for outputting messages: <trace> = 0 : no trace at all <trace> = 1 : handled exceptions and calls to AddError <trace> = 2 : also calls to AddWarning <trace> = 3 : also traces new Roots (uses method ErrorTrace). Default is 1 : Errors traced
	:param tracelev:
	:type tracelev: int
	:rtype: None") SetTraceLevel;
		void SetTraceLevel (const Standard_Integer tracelev);

		/****************** StartTrace ******************/
		%feature("compactdefaultargs") StartTrace;
		%feature("autodoc", "* Method called when trace is asked Calls PrintTrace to display information relevant for starting objects (which can be redefined) <level> is Nesting Level of Transfer (0 = root) <mode> controls the way the trace is done : 0 neutral, 1 for Error, 2 for Warning message, 3 for new Root
	:param binder:
	:type binder: Transfer_Binder
	:param start:
	:type start: Standard_Transient
	:param level:
	:type level: int
	:param mode:
	:type mode: int
	:rtype: None") StartTrace;
		void StartTrace (const opencascade::handle<Transfer_Binder> & binder,const opencascade::handle<Standard_Transient> & start,const Standard_Integer level,const Standard_Integer mode);

		/****************** TraceLevel ******************/
		%feature("compactdefaultargs") TraceLevel;
		%feature("autodoc", "* Returns trace level used for outputting messages.
	:rtype: int") TraceLevel;
		Standard_Integer TraceLevel ();

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "* Same as Transferring but does not return the Binder. Simply returns True in case of success (for user call)
	:param start:
	:type start: Standard_Transient
	:rtype: bool") Transfer;
		Standard_Boolean Transfer (const opencascade::handle<Standard_Transient> & start);

		/****************** Transfer_ProcessForTransient ******************/
		%feature("compactdefaultargs") Transfer_ProcessForTransient;
		%feature("autodoc", "* Sets TransferProcess at initial state. Gives an Initial size (indicative) for the Map when known (default is 10000). Sets default trace file as a printer and default trace level (see Message_TraceFile).
	:param nb: default value is 10000
	:type nb: int
	:rtype: None") Transfer_ProcessForTransient;
		 Transfer_ProcessForTransient (const Standard_Integer nb = 10000);

		/****************** Transfer_ProcessForTransient ******************/
		%feature("compactdefaultargs") Transfer_ProcessForTransient;
		%feature("autodoc", "* Sets TransferProcess at initial state. Gives an Initial size (indicative) for the Map when known (default is 10000). Sets a specified printer.
	:param printer:
	:type printer: Message_Messenger
	:param nb: default value is 10000
	:type nb: int
	:rtype: None") Transfer_ProcessForTransient;
		 Transfer_ProcessForTransient (const opencascade::handle<Message_Messenger> & printer,const Standard_Integer nb = 10000);

		/****************** Transferring ******************/
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "* Performs the Transfer of a Starting Object, by calling the method TransferProduct (see below). Mapping and Roots are managed : nothing is done if a Result is already Bound, an exception is raised in case of error.
	:param start:
	:type start: Standard_Transient
	:rtype: opencascade::handle<Transfer_Binder>") Transferring;
		opencascade::handle<Transfer_Binder> Transferring (const opencascade::handle<Standard_Transient> & start);

		/****************** Unbind ******************/
		%feature("compactdefaultargs") Unbind;
		%feature("autodoc", "* Removes the Binder linked with a starting object If this Binder brings a non-empty Check, it is replaced by a VoidBinder. Also removes from the list of Roots as required. Returns True if done, False if <start> was not bound Considers a category number, by default 0
	:param start:
	:type start: Standard_Transient
	:rtype: bool") Unbind;
		Standard_Boolean Unbind (const opencascade::handle<Standard_Transient> & start);

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
		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "* Returns the check-list of this set of results <erronly> true : only fails are considered <level> = 0 : considers only main binder <level> = 1 : considers main binder plus immediate subs <level> = 2 (D) : considers all checks
	:param erronly:
	:type erronly: bool
	:param level: default value is 2
	:type level: int
	:rtype: Interface_CheckIterator") CheckList;
		Interface_CheckIterator CheckList (const Standard_Boolean erronly,const Standard_Integer level = 2);

		/****************** CheckStatus ******************/
		%feature("compactdefaultargs") CheckStatus;
		%feature("autodoc", "* Returns the check status with corresponds to the content of this ResultFromModel; considers all levels of transfer (worst status). Returns CheckAny if not yet computed Reads it from recorded status if already computed, else recomputes one
	:rtype: Interface_CheckStatus") CheckStatus;
		Interface_CheckStatus CheckStatus ();

		/****************** CheckedList ******************/
		%feature("compactdefaultargs") CheckedList;
		%feature("autodoc", "* Returns the list of starting entities to which a check status is attached. <check> = -2 , all entities whatever the check (see result) <check> = -1 , entities with no fail (warning allowed) <check> = 0 , entities with no check at all <check> = 1 , entities with warning but no fail <check> = 2 , entities with fail <result> : if True, only entities with an attached result Remark : result True and check=0 will give an empty list
	:param check:
	:type check: Interface_CheckStatus
	:param result:
	:type result: bool
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>") CheckedList;
		opencascade::handle<TColStd_HSequenceOfTransient> CheckedList (const Interface_CheckStatus check,const Standard_Boolean result);

		/****************** ComputeCheckStatus ******************/
		%feature("compactdefaultargs") ComputeCheckStatus;
		%feature("autodoc", "* Computes and records check status (see CheckStatus) Does not computes it if already done and <enforce> False
	:param enforce:
	:type enforce: bool
	:rtype: Interface_CheckStatus") ComputeCheckStatus;
		Interface_CheckStatus ComputeCheckStatus (const Standard_Boolean enforce);

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "* Returns starting File Name (empty if not set)
	:rtype: char *") FileName;
		const char * FileName ();

		/****************** Fill ******************/
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "* Fills from a TransientProcess, with the result attached to a starting entity. Considers its Model if it is set. This action produces a structured set of ResultFromTransient, considering scopes, starting by that of <ent>. If <ent> has no recorded result, it remains empty Returns True if a result is recorded, False else
	:param TP:
	:type TP: Transfer_TransientProcess
	:param ent:
	:type ent: Standard_Transient
	:rtype: bool") Fill;
		Standard_Boolean Fill (const opencascade::handle<Transfer_TransientProcess> & TP,const opencascade::handle<Standard_Transient> & ent);

		/****************** FillBack ******************/
		%feature("compactdefaultargs") FillBack;
		%feature("autodoc", "* Fills back a TransientProcess from the structured set of binders. Also sets the Model.
	:param TP:
	:type TP: Transfer_TransientProcess
	:rtype: None") FillBack;
		void FillBack (const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "* Returns True if a Result is recorded
	:rtype: bool") HasResult;
		Standard_Boolean HasResult ();

		/****************** MainLabel ******************/
		%feature("compactdefaultargs") MainLabel;
		%feature("autodoc", "* Returns the label in starting model attached to main entity (updated by Fill or SetMainResult, if Model is known)
	:rtype: char *") MainLabel;
		const char * MainLabel ();

		/****************** MainNumber ******************/
		%feature("compactdefaultargs") MainNumber;
		%feature("autodoc", "* Returns the label in starting model attached to main entity
	:rtype: int") MainNumber;
		Standard_Integer MainNumber ();

		/****************** MainResult ******************/
		%feature("compactdefaultargs") MainResult;
		%feature("autodoc", "* Returns the main recorded ResultFromTransient, or a null
	:rtype: opencascade::handle<Transfer_ResultFromTransient>") MainResult;
		opencascade::handle<Transfer_ResultFromTransient> MainResult ();

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "* Returns starting Model (null if not set)
	:rtype: opencascade::handle<Interface_InterfaceModel>") Model;
		opencascade::handle<Interface_InterfaceModel> Model ();

		/****************** ResultFromKey ******************/
		%feature("compactdefaultargs") ResultFromKey;
		%feature("autodoc", "* Searches for a key (starting entity) and returns its result Returns a null handle if not found
	:param start:
	:type start: Standard_Transient
	:rtype: opencascade::handle<Transfer_ResultFromTransient>") ResultFromKey;
		opencascade::handle<Transfer_ResultFromTransient> ResultFromKey (const opencascade::handle<Standard_Transient> & start);

		/****************** Results ******************/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "* Internal method which returns the list of ResultFromTransient, according level (2:complete; 1:sub-level 1; 0:main only)
	:param level:
	:type level: int
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>") Results;
		opencascade::handle<TColStd_HSequenceOfTransient> Results (const Standard_Integer level);

		/****************** SetFileName ******************/
		%feature("compactdefaultargs") SetFileName;
		%feature("autodoc", "* Sets starting File Name
	:param filename:
	:type filename: char *
	:rtype: None") SetFileName;
		void SetFileName (const char * filename);

		/****************** SetMainResult ******************/
		%feature("compactdefaultargs") SetMainResult;
		%feature("autodoc", "* Sets a new value for the main recorded ResultFromTransient
	:param amain:
	:type amain: Transfer_ResultFromTransient
	:rtype: None") SetMainResult;
		void SetMainResult (const opencascade::handle<Transfer_ResultFromTransient> & amain);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "* Sets starting Model
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: None") SetModel;
		void SetModel (const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Strip ******************/
		%feature("compactdefaultargs") Strip;
		%feature("autodoc", "* Clears some data attached to binders used by TransientProcess, which become useless once the transfer has been done, by calling Strip on its ResultFromTransient //! mode = 0 : minimum, clears data remaining from TransferProcess mode = 10 : just keeps file name, label, check status ..., and MainResult but only the result (Binder) mode = 11 : also clears MainResult (status and names remain)
	:param mode:
	:type mode: int
	:rtype: None") Strip;
		void Strip (const Standard_Integer mode);

		/****************** Transfer_ResultFromModel ******************/
		%feature("compactdefaultargs") Transfer_ResultFromModel;
		%feature("autodoc", "* Creates a ResultFromModel, empty
	:rtype: None") Transfer_ResultFromModel;
		 Transfer_ResultFromModel ();

		/****************** TransferredList ******************/
		%feature("compactdefaultargs") TransferredList;
		%feature("autodoc", "* Returns the list of recorded starting entities, ending by the root. Entities with check but no transfer result are ignored <level> = 2 (D), considers the complete list <level> = 1 considers the main result plus immediate subs <level> = 0 just the main result
	:param level: default value is 2
	:type level: int
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>") TransferredList;
		opencascade::handle<TColStd_HSequenceOfTransient> TransferredList (const Standard_Integer level = 2);

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
		/****************** AddSubResult ******************/
		%feature("compactdefaultargs") AddSubResult;
		%feature("autodoc", "* Adds a sub-result
	:param sub:
	:type sub: Transfer_ResultFromTransient
	:rtype: None") AddSubResult;
		void AddSubResult (const opencascade::handle<Transfer_ResultFromTransient> & sub);

		/****************** Binder ******************/
		%feature("compactdefaultargs") Binder;
		%feature("autodoc", "* Returns the binder
	:rtype: opencascade::handle<Transfer_Binder>") Binder;
		opencascade::handle<Transfer_Binder> Binder ();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "* Returns the check (or an empty one if no binder)
	:rtype: opencascade::handle<Interface_Check>") Check;
		const opencascade::handle<Interface_Check> Check ();

		/****************** CheckStatus ******************/
		%feature("compactdefaultargs") CheckStatus;
		%feature("autodoc", "* Returns the check status
	:rtype: Interface_CheckStatus") CheckStatus;
		Interface_CheckStatus CheckStatus ();

		/****************** ClearSubs ******************/
		%feature("compactdefaultargs") ClearSubs;
		%feature("autodoc", "* Clears the list of (immediate) sub-results
	:rtype: None") ClearSubs;
		void ClearSubs ();

		/****************** Fill ******************/
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "* Fills from a TransientProcess, with the starting entity which must have been set before. It works with scopes, calls Fill on each of its sub-results
	:param TP:
	:type TP: Transfer_TransientProcess
	:rtype: None") Fill;
		void Fill (const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** FillBack ******************/
		%feature("compactdefaultargs") FillBack;
		%feature("autodoc", "* Fills back a TransientProcess with definition of a ResultFromTransient, respectfully to its structuration in scopes
	:param TP:
	:type TP: Transfer_TransientProcess
	:rtype: None") FillBack;
		void FillBack (const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** FillMap ******************/
		%feature("compactdefaultargs") FillMap;
		%feature("autodoc", "* This method is used by ResultFromModel to collate the list of ResultFromTransient, avoiding duplications with a map Remark : <self> is already in the map and has not to be bound
	:param map:
	:type map: TColStd_IndexedMapOfTransient
	:rtype: None") FillMap;
		void FillMap (TColStd_IndexedMapOfTransient & map);

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "* Returns True if a result is recorded
	:rtype: bool") HasResult;
		Standard_Boolean HasResult ();

		/****************** NbSubResults ******************/
		%feature("compactdefaultargs") NbSubResults;
		%feature("autodoc", "* Returns the count of recorded sub-results
	:rtype: int") NbSubResults;
		Standard_Integer NbSubResults ();

		/****************** ResultFromKey ******************/
		%feature("compactdefaultargs") ResultFromKey;
		%feature("autodoc", "* Returns the ResultFromTransient attached to a given starting entity (the key). Returns a null handle if not found
	:param key:
	:type key: Standard_Transient
	:rtype: opencascade::handle<Transfer_ResultFromTransient>") ResultFromKey;
		opencascade::handle<Transfer_ResultFromTransient> ResultFromKey (const opencascade::handle<Standard_Transient> & key);

		/****************** SetBinder ******************/
		%feature("compactdefaultargs") SetBinder;
		%feature("autodoc", "* Sets Binder (for result plus individual check)
	:param binder:
	:type binder: Transfer_Binder
	:rtype: None") SetBinder;
		void SetBinder (const opencascade::handle<Transfer_Binder> & binder);

		/****************** SetStart ******************/
		%feature("compactdefaultargs") SetStart;
		%feature("autodoc", "* Sets starting entity
	:param start:
	:type start: Standard_Transient
	:rtype: None") SetStart;
		void SetStart (const opencascade::handle<Standard_Transient> & start);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "* Returns the starting entity
	:rtype: opencascade::handle<Standard_Transient>") Start;
		opencascade::handle<Standard_Transient> Start ();

		/****************** Strip ******************/
		%feature("compactdefaultargs") Strip;
		%feature("autodoc", "* Clears some data attached to binders used by TransientProcess, which become useless once the transfer has been done : the list of sub-scoped binders, which is now recorded as sub-results
	:rtype: None") Strip;
		void Strip ();

		/****************** SubResult ******************/
		%feature("compactdefaultargs") SubResult;
		%feature("autodoc", "* Returns a sub-result, given its rank
	:param num:
	:type num: int
	:rtype: opencascade::handle<Transfer_ResultFromTransient>") SubResult;
		opencascade::handle<Transfer_ResultFromTransient> SubResult (const Standard_Integer num);

		/****************** Transfer_ResultFromTransient ******************/
		%feature("compactdefaultargs") Transfer_ResultFromTransient;
		%feature("autodoc", "* Creates a ResultFromTransient, empty
	:rtype: None") Transfer_ResultFromTransient;
		 Transfer_ResultFromTransient ();

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
		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Copies an Entity by calling the method Transferring from the TransferProcess. If this called produces a Null Binder, then the standard, inherited Copy is called
	:param entfrom:
	:type entfrom: Standard_Transient
	:param entto:
	:type entto: Standard_Transient
	:param mapped:
	:type mapped: bool
	:param errstat:
	:type errstat: bool
	:rtype: bool") Copy;
		virtual Standard_Boolean Copy (const opencascade::handle<Standard_Transient> & entfrom,opencascade::handle<Standard_Transient> & entto,const Standard_Boolean mapped,const Standard_Boolean errstat);

		/****************** Transfer_TransferDispatch ******************/
		%feature("compactdefaultargs") Transfer_TransferDispatch;
		%feature("autodoc", "* Creates a TransferDispatch from a Model. Works with a General Service Library, given as an Argument A TransferDispatch is created as a CopyTool in which the Control is set to TransientProcess
	:param amodel:
	:type amodel: Interface_InterfaceModel
	:param lib:
	:type lib: Interface_GeneralLib
	:rtype: None") Transfer_TransferDispatch;
		 Transfer_TransferDispatch (const opencascade::handle<Interface_InterfaceModel> & amodel,const Interface_GeneralLib & lib);

		/****************** Transfer_TransferDispatch ******************/
		%feature("compactdefaultargs") Transfer_TransferDispatch;
		%feature("autodoc", "* Same as above, but Library is defined through a Protocol
	:param amodel:
	:type amodel: Interface_InterfaceModel
	:param protocol:
	:type protocol: Interface_Protocol
	:rtype: None") Transfer_TransferDispatch;
		 Transfer_TransferDispatch (const opencascade::handle<Interface_InterfaceModel> & amodel,const opencascade::handle<Interface_Protocol> & protocol);

		/****************** Transfer_TransferDispatch ******************/
		%feature("compactdefaultargs") Transfer_TransferDispatch;
		%feature("autodoc", "* Same as above, but works with the Active Protocol
	:param amodel:
	:type amodel: Interface_InterfaceModel
	:rtype: None") Transfer_TransferDispatch;
		 Transfer_TransferDispatch (const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** TransientProcess ******************/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "* Returns the content of Control Object, as a TransientProcess
	:rtype: opencascade::handle<Transfer_TransientProcess>") TransientProcess;
		opencascade::handle<Transfer_TransientProcess> TransientProcess ();

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
		/****************** Entities ******************/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "* Takes the transient items stored in a TransferIterator
	:param list:
	:type list: Transfer_TransferIterator
	:rtype: Interface_EntityIterator") Entities;
		Interface_EntityIterator Entities (Transfer_TransferIterator & list);

		/****************** FillModel ******************/
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "* Fills an InterfaceModel with the Complete Result of a Transfer stored in a TransientProcess (Starting Objects are Transient) The complete result is exactly added to the model
	:param proc:
	:type proc: Transfer_TransientProcess
	:param amodel:
	:type amodel: Interface_InterfaceModel
	:rtype: None") FillModel;
		void FillModel (const opencascade::handle<Transfer_TransientProcess> & proc,const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** FillModel ******************/
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "* Fills an InterfaceModel with results of the Transfer recorded in a TransientProcess (Starting Objects are Transient) : Root Result if <roots> is True (Default), Complete Result else The entities added to the model are determined from the result by by adding the referenced entities
	:param proc:
	:type proc: Transfer_TransientProcess
	:param amodel:
	:type amodel: Interface_InterfaceModel
	:param proto:
	:type proto: Interface_Protocol
	:param roots: default value is Standard_True
	:type roots: bool
	:rtype: None") FillModel;
		void FillModel (const opencascade::handle<Transfer_TransientProcess> & proc,const opencascade::handle<Interface_InterfaceModel> & amodel,const opencascade::handle<Interface_Protocol> & proto,const Standard_Boolean roots = Standard_True);

		/****************** FillModel ******************/
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "* Fills an InterfaceModel with the Complete Result of a Transfer stored in a TransientProcess (Starting Objects are Transient) The complete result is exactly added to the model
	:param proc:
	:type proc: Transfer_FinderProcess
	:param amodel:
	:type amodel: Interface_InterfaceModel
	:rtype: None") FillModel;
		void FillModel (const opencascade::handle<Transfer_FinderProcess> & proc,const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** FillModel ******************/
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "* Fills an InterfaceModel with results of the Transfer recorded in a TransientProcess (Starting Objects are Transient) : Root Result if <roots> is True (Default), Complete Result else The entities added to the model are determined from the result by by adding the referenced entities
	:param proc:
	:type proc: Transfer_FinderProcess
	:param amodel:
	:type amodel: Interface_InterfaceModel
	:param proto:
	:type proto: Interface_Protocol
	:param roots: default value is Standard_True
	:type roots: bool
	:rtype: None") FillModel;
		void FillModel (const opencascade::handle<Transfer_FinderProcess> & proc,const opencascade::handle<Interface_InterfaceModel> & amodel,const opencascade::handle<Interface_Protocol> & proto,const Standard_Boolean roots = Standard_True);

		/****************** Transfer_TransferInput ******************/
		%feature("compactdefaultargs") Transfer_TransferInput;
		%feature("autodoc", "* Creates a TransferInput ready to use
	:rtype: None") Transfer_TransferInput;
		 Transfer_TransferInput ();

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
		/****************** AddItem ******************/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "* Adds a Binder to the iteration list (construction)
	:param atr:
	:type atr: Transfer_Binder
	:rtype: None") AddItem;
		void AddItem (const opencascade::handle<Transfer_Binder> & atr);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "* Returns Check associated to current Binder (in case of error, it brings Fail messages) (in case of warnings, it brings Warning messages)
	:rtype: opencascade::handle<Interface_Check>") Check;
		const opencascade::handle<Interface_Check> Check ();

		/****************** HasFails ******************/
		%feature("compactdefaultargs") HasFails;
		%feature("autodoc", "* Returns True if Fail Messages are recorded with the current Binder. They can then be read through Check (see below)
	:rtype: bool") HasFails;
		Standard_Boolean HasFails ();

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "* Returns True if current Item brings a Result, Transient (Handle) or not or Multiple. That is to say, if it corresponds to a normally acheived Transfer, Transient Result is read by specific TransientResult below. Other kind of Result must be read specifically from its Binder
	:rtype: bool") HasResult;
		Standard_Boolean HasResult ();

		/****************** HasTransientResult ******************/
		%feature("compactdefaultargs") HasTransientResult;
		%feature("autodoc", "* Returns True if the current Item has a Transient Unique Result (if yes, use TransientResult to get it)
	:rtype: bool") HasTransientResult;
		Standard_Boolean HasTransientResult ();

		/****************** HasUniqueResult ******************/
		%feature("compactdefaultargs") HasUniqueResult;
		%feature("autodoc", "* Returns True if Current Item has a Unique Result
	:rtype: bool") HasUniqueResult;
		Standard_Boolean HasUniqueResult ();

		/****************** HasWarnings ******************/
		%feature("compactdefaultargs") HasWarnings;
		%feature("autodoc", "* Returns True if Warning Messages are recorded with the current Binder. They can then be read through Check (see below)
	:rtype: bool") HasWarnings;
		Standard_Boolean HasWarnings ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True if there are other Items to iterate
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Sets Iteration to the next Item
	:rtype: None") Next;
		void Next ();

		/****************** Number ******************/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "* Returns count of Binders to be iterated
	:rtype: int") Number;
		Standard_Integer Number ();

		/****************** ResultType ******************/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "* Returns the Type of the Result of the current Item, if Unique. If No Unique Result (Error Transfert or Multiple Result), returns a Null Handle The Type is : the Dynamic Type for a Transient Result, the Type defined by the Binder Class else
	:rtype: opencascade::handle<Standard_Type>") ResultType;
		opencascade::handle<Standard_Type> ResultType ();

		/****************** SelectBinder ******************/
		%feature("compactdefaultargs") SelectBinder;
		%feature("autodoc", "* Selects Items on the Type of Binder : keep only Binders which are of a given Type (if keep is True) or reject only them (if keep is False)
	:param atype:
	:type atype: Standard_Type
	:param keep:
	:type keep: bool
	:rtype: None") SelectBinder;
		void SelectBinder (const opencascade::handle<Standard_Type> & atype,const Standard_Boolean keep);

		/****************** SelectItem ******************/
		%feature("compactdefaultargs") SelectItem;
		%feature("autodoc", "* Selects/Unselect (according to <keep> an item designated by its rank <num> in the list Used by sub-classes which have specific criteria
	:param num:
	:type num: int
	:param keep:
	:type keep: bool
	:rtype: None") SelectItem;
		void SelectItem (const Standard_Integer num,const Standard_Boolean keep);

		/****************** SelectResult ******************/
		%feature("compactdefaultargs") SelectResult;
		%feature("autodoc", "* Selects Items on the Type of Result. Considers only Unique Results. Considers Dynamic Type for Transient Result, Static Type (the one given to define the Binder) else. //! Results which are of a given Type (if keep is True) or reject only them (if keep is False)
	:param atype:
	:type atype: Standard_Type
	:param keep:
	:type keep: bool
	:rtype: None") SelectResult;
		void SelectResult (const opencascade::handle<Standard_Type> & atype,const Standard_Boolean keep);

		/****************** SelectUnique ******************/
		%feature("compactdefaultargs") SelectUnique;
		%feature("autodoc", "* Select Items according Unicity : keep only Unique Results (if keep is True) or keep only Multiple Results (if keep is False)
	:param keep:
	:type keep: bool
	:rtype: None") SelectUnique;
		void SelectUnique (const Standard_Boolean keep);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "* Clears Iteration in progress, to allow it to be restarted
	:rtype: None") Start;
		void Start ();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns Execution Status of current Binder Normal transfer corresponds to StatusDone
	:rtype: Transfer_StatusExec") Status;
		Transfer_StatusExec Status ();

		/****************** Transfer_TransferIterator ******************/
		%feature("compactdefaultargs") Transfer_TransferIterator;
		%feature("autodoc", "* Creates an empty Iterator
	:rtype: None") Transfer_TransferIterator;
		 Transfer_TransferIterator ();

		/****************** TransientResult ******************/
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "* Returns the Transient Result of the current Item if there is (else, returns a null Handle) Supposes that Binding is done by a SimpleBinderOfTransient
	:rtype: opencascade::handle<Standard_Transient>") TransientResult;
		const opencascade::handle<Standard_Transient> & TransientResult ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the current Binder
	:rtype: opencascade::handle<Transfer_Binder>") Value;
		const opencascade::handle<Transfer_Binder> & Value ();

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
		/****************** ListForStatus ******************/
		%feature("compactdefaultargs") ListForStatus;
		%feature("autodoc", "* Returns the list of Starting Entities with these criteria : - <normal> False, gives the entities bound with ABNORMAL STATUS (e.g. : Fail recorded, Exception raised during Transfer) - <normal> True, gives Entities with or without a Result, but with no Fail, no Exception (Warnings are not counted) - <roots> False, considers all entities recorded (either for Result, or for at least one Fail or Warning message) - <roots> True (Default), considers only roots of Transfer (the Entities recorded at highest level) This method is based on AbnormalResult from TransferProcess
	:param normal:
	:type normal: bool
	:param roots: default value is Standard_True
	:type roots: bool
	:rtype: Interface_EntityIterator") ListForStatus;
		Interface_EntityIterator ListForStatus (const Standard_Boolean normal,const Standard_Boolean roots = Standard_True);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "* Returns the Starting Model
	:rtype: opencascade::handle<Interface_InterfaceModel>") Model;
		opencascade::handle<Interface_InterfaceModel> Model ();

		/****************** ModelForStatus ******************/
		%feature("compactdefaultargs") ModelForStatus;
		%feature("autodoc", "* Fills a Model with the list determined by ListForStatus This model starts from scratch (made by NewEmptyModel from the current Model), then is filled by AddWithRefs //! Useful to get separately from a transfer, the entities which have caused problem, in order to furtherly analyse them (with normal = False), or the 'good' entities, to obtain a data set 'which works well' (with normal = True)
	:param protocol:
	:type protocol: Interface_Protocol
	:param normal:
	:type normal: bool
	:param roots: default value is Standard_True
	:type roots: bool
	:rtype: opencascade::handle<Interface_InterfaceModel>") ModelForStatus;
		opencascade::handle<Interface_InterfaceModel> ModelForStatus (const opencascade::handle<Interface_Protocol> & protocol,const Standard_Boolean normal,const Standard_Boolean roots = Standard_True);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "* Transfer checks that all taken Entities come from the same Model, then calls Transfer from TransientProcess
	:param obj:
	:type obj: Standard_Transient
	:rtype: None") Transfer;
		void Transfer (const opencascade::handle<Standard_Transient> & obj);

		/****************** TransferRoots ******************/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "* Runs transfer on the roots of the Interface Model The Roots are computed with a ShareFlags created from a Protocol given as Argument
	:param protocol:
	:type protocol: Interface_Protocol
	:rtype: None") TransferRoots;
		void TransferRoots (const opencascade::handle<Interface_Protocol> & protocol);

		/****************** TransferRoots ******************/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "* Runs transfer on the roots defined by a Graph of dependences (which detains also a Model and its Entities) Roots are computed with a ShareFlags created from the Graph
	:param G:
	:type G: Interface_Graph
	:rtype: None") TransferRoots;
		void TransferRoots (const Interface_Graph & G);

		/****************** TransferRoots ******************/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "* Runs transfer on the roots of the Interface Model Remark : the Roots are computed with a ShareFlags created from the Active Protocol
	:rtype: None") TransferRoots;
		void TransferRoots ();

		/****************** Transfer_TransferOutput ******************/
		%feature("compactdefaultargs") Transfer_TransferOutput;
		%feature("autodoc", "* Creates a TransferOutput ready to use, with a TransientProcess
	:param actor:
	:type actor: Transfer_ActorOfTransientProcess
	:param amodel:
	:type amodel: Interface_InterfaceModel
	:rtype: None") Transfer_TransferOutput;
		 Transfer_TransferOutput (const opencascade::handle<Transfer_ActorOfTransientProcess> & actor,const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** Transfer_TransferOutput ******************/
		%feature("compactdefaultargs") Transfer_TransferOutput;
		%feature("autodoc", "* Creates a TransferOutput from an already existing TransientProcess, and a Model Returns (by Reference, hence can be changed) the Mode for Scope Management. False (D) means Scope is ignored. True means that each individual Transfer (direct or through TransferRoots) is regarded as one Scope
	:param proc:
	:type proc: Transfer_TransientProcess
	:param amodel:
	:type amodel: Interface_InterfaceModel
	:rtype: None") Transfer_TransferOutput;
		 Transfer_TransferOutput (const opencascade::handle<Transfer_TransientProcess> & proc,const opencascade::handle<Interface_InterfaceModel> & amodel);

		/****************** TransientProcess ******************/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "* Returns the TransientProcess used to work
	:rtype: opencascade::handle<Transfer_TransientProcess>") TransientProcess;
		opencascade::handle<Transfer_TransientProcess> TransientProcess ();

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
		%feature("autodoc", ":param start:
	:type start: Transfer_Finder
	:param TP:
	:type TP: Transfer_FinderProcess
	:rtype: opencascade::handle<Transfer_Binder>") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer (const opencascade::handle<Transfer_Finder> & start,const opencascade::handle<Transfer_FinderProcess> & TP);

		/****************** TransferTransient ******************/
		%feature("compactdefaultargs") TransferTransient;
		%feature("autodoc", ":param start:
	:type start: Standard_Transient
	:param TP:
	:type TP: Transfer_FinderProcess
	:rtype: opencascade::handle<Standard_Transient>") TransferTransient;
		virtual opencascade::handle<Standard_Transient> TransferTransient (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Transfer_FinderProcess> & TP);

		/****************** Transfer_ActorOfFinderProcess ******************/
		%feature("compactdefaultargs") Transfer_ActorOfFinderProcess;
		%feature("autodoc", ":rtype: None") Transfer_ActorOfFinderProcess;
		 Transfer_ActorOfFinderProcess ();

		/****************** Transferring ******************/
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", ":param start:
	:type start: Transfer_Finder
	:param TP:
	:type TP: Transfer_ProcessForFinder
	:rtype: opencascade::handle<Transfer_Binder>") Transferring;
		virtual opencascade::handle<Transfer_Binder> Transferring (const opencascade::handle<Transfer_Finder> & start,const opencascade::handle<Transfer_ProcessForFinder> & TP);

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
		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", ":param start:
	:type start: Standard_Transient
	:param TP:
	:type TP: Transfer_TransientProcess
	:rtype: opencascade::handle<Transfer_Binder>") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** TransferTransient ******************/
		%feature("compactdefaultargs") TransferTransient;
		%feature("autodoc", ":param start:
	:type start: Standard_Transient
	:param TP:
	:type TP: Transfer_TransientProcess
	:rtype: opencascade::handle<Standard_Transient>") TransferTransient;
		virtual opencascade::handle<Standard_Transient> TransferTransient (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** Transfer_ActorOfTransientProcess ******************/
		%feature("compactdefaultargs") Transfer_ActorOfTransientProcess;
		%feature("autodoc", ":rtype: None") Transfer_ActorOfTransientProcess;
		 Transfer_ActorOfTransientProcess ();

		/****************** Transferring ******************/
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", ":param start:
	:type start: Standard_Transient
	:param TP:
	:type TP: Transfer_ProcessForTransient
	:rtype: opencascade::handle<Transfer_Binder>") Transferring;
		virtual opencascade::handle<Transfer_Binder> Transferring (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Transfer_ProcessForTransient> & TP);

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
		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "* Returns the Model which can be used for context
	:rtype: opencascade::handle<Interface_InterfaceModel>") Model;
		opencascade::handle<Interface_InterfaceModel> Model ();

		/****************** NextMappedWithAttribute ******************/
		%feature("compactdefaultargs") NextMappedWithAttribute;
		%feature("autodoc", "* In the list of mapped items (between 1 and NbMapped), searches for the first mapped item which follows <num0> (not included) and which has an attribute named <name> The considered Attributes are those brought by Finders,i.e. by Input data. While NextItemWithAttribute works on Result data (Binders) //! Hence, allows such an iteration //! for (num = FP->NextMappedWithAttribute(name,0); num > 0; num = FP->NextMappedWithAttribute(name,num) { .. process mapped item <num> }
	:param name:
	:type name: char *
	:param num0:
	:type num0: int
	:rtype: int") NextMappedWithAttribute;
		Standard_Integer NextMappedWithAttribute (const char * name,const Standard_Integer num0);

		/****************** PrintStats ******************/
		%feature("compactdefaultargs") PrintStats;
		%feature("autodoc", "* Prints statistics on a given output, according mode
	:param mode:
	:type mode: int
	:param S:
	:type S: Message_Messenger
	:rtype: None") PrintStats;
		void PrintStats (const Standard_Integer mode,const opencascade::handle<Message_Messenger> & S);

		/****************** PrintTrace ******************/
		%feature("compactdefaultargs") PrintTrace;
		%feature("autodoc", "* Specific printing to trace a Finder (by its method ValueType)
	:param start:
	:type start: Transfer_Finder
	:param S:
	:type S: Message_Messenger
	:rtype: void") PrintTrace;
		virtual void PrintTrace (const opencascade::handle<Transfer_Finder> & start,const opencascade::handle<Message_Messenger> & S);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "* Sets an InterfaceModel, which can be used during transfer for instance if a context must be managed, it is in the Model
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: None") SetModel;
		void SetModel (const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Transfer_FinderProcess ******************/
		%feature("compactdefaultargs") Transfer_FinderProcess;
		%feature("autodoc", "* Sets FinderProcess at initial state, with an initial size
	:param nb: default value is 10000
	:type nb: int
	:rtype: None") Transfer_FinderProcess;
		 Transfer_FinderProcess (const Standard_Integer nb = 10000);

		/****************** TransientMapper ******************/
		%feature("compactdefaultargs") TransientMapper;
		%feature("autodoc", "* Returns a TransientMapper for a given Transient Object Either <obj> is already mapped, then its Mapper is returned Or it is not, then a new one is created then returned, BUT it is not mapped here (use Bind or FindElseBind to do this)
	:param obj:
	:type obj: Standard_Transient
	:rtype: opencascade::handle<Transfer_TransientMapper>") TransientMapper;
		opencascade::handle<Transfer_TransientMapper> TransientMapper (const opencascade::handle<Standard_Transient> & obj);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a Binder to the iteration list (construction) with no corresponding Starting Object (note that Result is brought by Binder)
	:param binder:
	:type binder: Transfer_Binder
	:rtype: None") Add;
		void Add (const opencascade::handle<Transfer_Binder> & binder);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a Binder to the iteration list, associated with its corresponding Starting Object 'start' Starting Object is ignored if not required at Creation time
	:param binder:
	:type binder: Transfer_Binder
	:param start:
	:type start: Transfer_Finder
	:rtype: None") Add;
		void Add (const opencascade::handle<Transfer_Binder> & binder,const opencascade::handle<Transfer_Finder> & start);

		/****************** Filter ******************/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "* After having added all items, keeps or rejects items which are attached to starting data given by <only> <keep> = True (D) : keeps. <keep> = False : rejects Does nothing if <withstarts> was False
	:param list:
	:type list: Transfer_HSequenceOfFinder
	:param keep: default value is Standard_True
	:type keep: bool
	:rtype: None") Filter;
		void Filter (const opencascade::handle<Transfer_HSequenceOfFinder> & list,const Standard_Boolean keep = Standard_True);

		/****************** HasStarting ******************/
		%feature("compactdefaultargs") HasStarting;
		%feature("autodoc", "* Returns True if Starting Object is available (defined at Creation Time)
	:rtype: bool") HasStarting;
		Standard_Boolean HasStarting ();

		/****************** Starting ******************/
		%feature("compactdefaultargs") Starting;
		%feature("autodoc", "* Returns corresponding Starting Object
	:rtype: opencascade::handle<Transfer_Finder>") Starting;
		const opencascade::handle<Transfer_Finder> & Starting ();

		/****************** Transfer_IteratorOfProcessForFinder ******************/
		%feature("compactdefaultargs") Transfer_IteratorOfProcessForFinder;
		%feature("autodoc", "* Creates an empty Iterator if withstarts is True, each Binder to be iterated will be associated to its corresponding Starting Object
	:param withstarts:
	:type withstarts: bool
	:rtype: None") Transfer_IteratorOfProcessForFinder;
		 Transfer_IteratorOfProcessForFinder (const Standard_Boolean withstarts);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a Binder to the iteration list (construction) with no corresponding Starting Object (note that Result is brought by Binder)
	:param binder:
	:type binder: Transfer_Binder
	:rtype: None") Add;
		void Add (const opencascade::handle<Transfer_Binder> & binder);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a Binder to the iteration list, associated with its corresponding Starting Object 'start' Starting Object is ignored if not required at Creation time
	:param binder:
	:type binder: Transfer_Binder
	:param start:
	:type start: Standard_Transient
	:rtype: None") Add;
		void Add (const opencascade::handle<Transfer_Binder> & binder,const opencascade::handle<Standard_Transient> & start);

		/****************** Filter ******************/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "* After having added all items, keeps or rejects items which are attached to starting data given by <only> <keep> = True (D) : keeps. <keep> = False : rejects Does nothing if <withstarts> was False
	:param list:
	:type list: TColStd_HSequenceOfTransient
	:param keep: default value is Standard_True
	:type keep: bool
	:rtype: None") Filter;
		void Filter (const opencascade::handle<TColStd_HSequenceOfTransient> & list,const Standard_Boolean keep = Standard_True);

		/****************** HasStarting ******************/
		%feature("compactdefaultargs") HasStarting;
		%feature("autodoc", "* Returns True if Starting Object is available (defined at Creation Time)
	:rtype: bool") HasStarting;
		Standard_Boolean HasStarting ();

		/****************** Starting ******************/
		%feature("compactdefaultargs") Starting;
		%feature("autodoc", "* Returns corresponding Starting Object
	:rtype: opencascade::handle<Standard_Transient>") Starting;
		const opencascade::handle<Standard_Transient> & Starting ();

		/****************** Transfer_IteratorOfProcessForTransient ******************/
		%feature("compactdefaultargs") Transfer_IteratorOfProcessForTransient;
		%feature("autodoc", "* Creates an empty Iterator if withstarts is True, each Binder to be iterated will be associated to its corresponding Starting Object
	:param withstarts:
	:type withstarts: bool
	:rtype: None") Transfer_IteratorOfProcessForTransient;
		 Transfer_IteratorOfProcessForTransient (const Standard_Boolean withstarts);

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
		/****************** AddResult ******************/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "* Adds a new Item to the Multiple Result
	:param res:
	:type res: Standard_Transient
	:rtype: None") AddResult;
		void AddResult (const opencascade::handle<Standard_Transient> & res);

		/****************** IsMultiple ******************/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "* Returns True if a starting object is bound with SEVERAL results : Here, returns allways True
	:rtype: bool") IsMultiple;
		virtual Standard_Boolean IsMultiple ();

		/****************** MultipleResult ******************/
		%feature("compactdefaultargs") MultipleResult;
		%feature("autodoc", "* Returns the Multiple Result, if it is defined (at least one Item). Else, returns a Null Handle
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>") MultipleResult;
		opencascade::handle<TColStd_HSequenceOfTransient> MultipleResult ();

		/****************** NbResults ******************/
		%feature("compactdefaultargs") NbResults;
		%feature("autodoc", "* Returns the actual count of recorded (Transient) results
	:rtype: int") NbResults;
		Standard_Integer NbResults ();

		/****************** ResultType ******************/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "* Returns the Type permitted for Results, i.e. here Transient
	:rtype: opencascade::handle<Standard_Type>") ResultType;
		opencascade::handle<Standard_Type> ResultType ();

		/****************** ResultTypeName ******************/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "* Returns the Name of the Type which characterizes the Result Here, returns '(list)'
	:rtype: char *") ResultTypeName;
		const char * ResultTypeName ();

		/****************** ResultValue ******************/
		%feature("compactdefaultargs") ResultValue;
		%feature("autodoc", "* Returns the value of the recorded result n0 <num>
	:param num:
	:type num: int
	:rtype: opencascade::handle<Standard_Transient>") ResultValue;
		opencascade::handle<Standard_Transient> ResultValue (const Standard_Integer num);

		/****************** SetMultipleResult ******************/
		%feature("compactdefaultargs") SetMultipleResult;
		%feature("autodoc", "* Defines a Binding with a Multiple Result, given as a Sequence Error if a Unique Result has yet been defined
	:param mulres:
	:type mulres: TColStd_HSequenceOfTransient
	:rtype: None") SetMultipleResult;
		void SetMultipleResult (const opencascade::handle<TColStd_HSequenceOfTransient> & mulres);

		/****************** Transfer_MultipleBinder ******************/
		%feature("compactdefaultargs") Transfer_MultipleBinder;
		%feature("autodoc", "* normal standard constructor, creates an empty MultipleBinder
	:rtype: None") Transfer_MultipleBinder;
		 Transfer_MultipleBinder ();

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
		/****************** GetTypedResult ******************/
		%feature("compactdefaultargs") GetTypedResult;
		%feature("autodoc", "* Returns a transient result according to its type (IsKind) i.e. the result itself if IsKind(atype), else searches in NextResult, until first found, then returns True If not found, returns False (res is NOT touched) //! This syntactic form avoids to do DownCast : if a result is found with the good type, it is loaded in <res> and can be immediately used, well initialised
	:param bnd:
	:type bnd: Transfer_Binder
	:param atype:
	:type atype: Standard_Type
	:param res:
	:type res: Standard_Transient
	:rtype: bool") GetTypedResult;
		static Standard_Boolean GetTypedResult (const opencascade::handle<Transfer_Binder> & bnd,const opencascade::handle<Standard_Type> & atype,opencascade::handle<Standard_Transient> & res);

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "* Returns the defined Result, if there is one
	:rtype: opencascade::handle<Standard_Transient>") Result;
		const opencascade::handle<Standard_Transient> & Result ();

		/****************** ResultType ******************/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "* Returns the Effective (Dynamic) Type of the Result (Standard_Transient if no Result is defined)
	:rtype: opencascade::handle<Standard_Type>") ResultType;
		opencascade::handle<Standard_Type> ResultType ();

		/****************** ResultTypeName ******************/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "* Returns the Effective Name of (Dynamic) Type of the Result (void) if no result is defined
	:rtype: char *") ResultTypeName;
		const char * ResultTypeName ();

		/****************** SetResult ******************/
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "* Defines the Result
	:param res:
	:type res: Standard_Transient
	:rtype: None") SetResult;
		void SetResult (const opencascade::handle<Standard_Transient> & res);

		/****************** Transfer_SimpleBinderOfTransient ******************/
		%feature("compactdefaultargs") Transfer_SimpleBinderOfTransient;
		%feature("autodoc", "* Creates an empty SimpleBinderOfTransient Returns True if a starting object is bound with SEVERAL results : Here, returns allways False See Binder itself
	:rtype: None") Transfer_SimpleBinderOfTransient;
		 Transfer_SimpleBinderOfTransient ();

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
		/****************** AddResult ******************/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "* Adds an item to the result list
	:param res:
	:type res: Standard_Transient
	:rtype: None") AddResult;
		void AddResult (const opencascade::handle<Standard_Transient> & res);

		/****************** IsMultiple ******************/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", ":rtype: bool") IsMultiple;
		virtual Standard_Boolean IsMultiple ();

		/****************** NbTransients ******************/
		%feature("compactdefaultargs") NbTransients;
		%feature("autodoc", ":rtype: int") NbTransients;
		Standard_Integer NbTransients ();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", ":rtype: opencascade::handle<TColStd_HSequenceOfTransient>") Result;
		opencascade::handle<TColStd_HSequenceOfTransient> Result ();

		/****************** ResultType ******************/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", ":rtype: opencascade::handle<Standard_Type>") ResultType;
		opencascade::handle<Standard_Type> ResultType ();

		/****************** ResultTypeName ******************/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", ":rtype: char *") ResultTypeName;
		const char * ResultTypeName ();

		/****************** SetResult ******************/
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "* Changes an already defined sub-result
	:param num:
	:type num: int
	:param res:
	:type res: Standard_Transient
	:rtype: None") SetResult;
		void SetResult (const Standard_Integer num,const opencascade::handle<Standard_Transient> & res);

		/****************** Transfer_TransientListBinder ******************/
		%feature("compactdefaultargs") Transfer_TransientListBinder;
		%feature("autodoc", ":rtype: None") Transfer_TransientListBinder;
		 Transfer_TransientListBinder ();

		/****************** Transfer_TransientListBinder ******************/
		%feature("compactdefaultargs") Transfer_TransientListBinder;
		%feature("autodoc", ":param list:
	:type list: TColStd_HSequenceOfTransient
	:rtype: None") Transfer_TransientListBinder;
		 Transfer_TransientListBinder (const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** Transient ******************/
		%feature("compactdefaultargs") Transient;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: opencascade::handle<Standard_Transient>") Transient;
		const opencascade::handle<Standard_Transient> & Transient (const Standard_Integer num);

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
		/****************** Equates ******************/
		%feature("compactdefaultargs") Equates;
		%feature("autodoc", "* Specific testof equallity : defined as False if <other> has not the same true Type, else contents are compared (by C++ operator ==)
	:param other:
	:type other: Transfer_Finder
	:rtype: bool") Equates;
		Standard_Boolean Equates (const opencascade::handle<Transfer_Finder> & other);

		/****************** Transfer_TransientMapper ******************/
		%feature("compactdefaultargs") Transfer_TransientMapper;
		%feature("autodoc", "* Creates a Mapper with a Value. This Value can then not be changed. It is used by the Hasher to compute the HashCode, which will then be stored for an immediate reading.
	:param akey:
	:type akey: Standard_Transient
	:rtype: None") Transfer_TransientMapper;
		 Transfer_TransientMapper (const opencascade::handle<Standard_Transient> & akey);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the contained value
	:rtype: opencascade::handle<Standard_Transient>") Value;
		const opencascade::handle<Standard_Transient> & Value ();

		/****************** ValueType ******************/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "* Returns the Type of the Value. By default, returns the DynamicType of <self>, but can be redefined
	:rtype: opencascade::handle<Standard_Type>") ValueType;
		virtual opencascade::handle<Standard_Type> ValueType ();

		/****************** ValueTypeName ******************/
		%feature("compactdefaultargs") ValueTypeName;
		%feature("autodoc", "* Returns the name of the Type of the Value. Default is name of ValueType, unless it is for a non-handled object
	:rtype: char *") ValueTypeName;
		virtual const char * ValueTypeName ();

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
		/****************** CheckNum ******************/
		%feature("compactdefaultargs") CheckNum;
		%feature("autodoc", "* Specific number of a starting object for check-list : Number in model
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CheckNum;
		virtual Standard_Integer CheckNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "* Returns (modifiable) the whole definition of Context Rather for internal use (ex.: preparing and setting in once)
	:rtype: NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient> >") Context;
		NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient> > & Context ();

		/****************** GetContext ******************/
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "* Returns the Context attached to a name, if set and if it is Kind of the type, else a Null Handle Returns True if OK, False if no Context
	:param name:
	:type name: char *
	:param type:
	:type type: Standard_Type
	:param ctx:
	:type ctx: Standard_Transient
	:rtype: bool") GetContext;
		Standard_Boolean GetContext (const char * name,const opencascade::handle<Standard_Type> & type,opencascade::handle<Standard_Transient> & ctx);

		/****************** Graph ******************/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", ":rtype: Interface_Graph") Graph;
		const Interface_Graph & Graph ();

		/****************** HGraph ******************/
		%feature("compactdefaultargs") HGraph;
		%feature("autodoc", ":rtype: opencascade::handle<Interface_HGraph>") HGraph;
		opencascade::handle<Interface_HGraph> HGraph ();

		/****************** HasGraph ******************/
		%feature("compactdefaultargs") HasGraph;
		%feature("autodoc", ":rtype: bool") HasGraph;
		Standard_Boolean HasGraph ();

		/****************** IsDataFail ******************/
		%feature("compactdefaultargs") IsDataFail;
		%feature("autodoc", "* Tells if an entity fails on data checking (load time, syntactic, or semantic check). Normally, should answer False. It is not prudent to try transferring an entity which fails on data checking
	:param ent:
	:type ent: Standard_Transient
	:rtype: bool") IsDataFail;
		Standard_Boolean IsDataFail (const opencascade::handle<Standard_Transient> & ent);

		/****************** IsDataLoaded ******************/
		%feature("compactdefaultargs") IsDataLoaded;
		%feature("autodoc", "* Tells if an entity is well loaded from file (even if its data fail on checking, they are present). Mostly often, answers True. Else, there was a syntactic error in the file. A non-loaded entity MAY NOT BE transferred, unless its Report (in the model) is interpreted
	:param ent:
	:type ent: Standard_Transient
	:rtype: bool") IsDataLoaded;
		Standard_Boolean IsDataLoaded (const opencascade::handle<Standard_Transient> & ent);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "* Returns the Model used for StartTrace
	:rtype: opencascade::handle<Interface_InterfaceModel>") Model;
		opencascade::handle<Interface_InterfaceModel> Model ();

		/****************** PrintStats ******************/
		%feature("compactdefaultargs") PrintStats;
		%feature("autodoc", "* Prints statistics on a given output, according mode
	:param mode:
	:type mode: int
	:param S:
	:type S: Message_Messenger
	:rtype: None") PrintStats;
		void PrintStats (const Standard_Integer mode,const opencascade::handle<Message_Messenger> & S);

		/****************** PrintTrace ******************/
		%feature("compactdefaultargs") PrintTrace;
		%feature("autodoc", "* Specific printing to trace an entity : prints label and type (if model is set)
	:param start:
	:type start: Standard_Transient
	:param S:
	:type S: Message_Messenger
	:rtype: void") PrintTrace;
		virtual void PrintTrace (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Message_Messenger> & S);

		/****************** RootsForTransfer ******************/
		%feature("compactdefaultargs") RootsForTransfer;
		%feature("autodoc", ":rtype: opencascade::handle<TColStd_HSequenceOfTransient>") RootsForTransfer;
		opencascade::handle<TColStd_HSequenceOfTransient> RootsForTransfer ();

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "* Sets a Context : according to receiving appli, to be interpreted by the Actor
	:param name:
	:type name: char *
	:param ctx:
	:type ctx: Standard_Transient
	:rtype: None") SetContext;
		void SetContext (const char * name,const opencascade::handle<Standard_Transient> & ctx);

		/****************** SetGraph ******************/
		%feature("compactdefaultargs") SetGraph;
		%feature("autodoc", "* Sets a Graph : superseedes SetModel if already done
	:param HG:
	:type HG: Interface_HGraph
	:rtype: None") SetGraph;
		void SetGraph (const opencascade::handle<Interface_HGraph> & HG);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "* Sets an InterfaceModel, used by StartTrace, CheckList, queries on Integrity, to give informations significant for each norm.
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: None") SetModel;
		void SetModel (const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Transfer_TransientProcess ******************/
		%feature("compactdefaultargs") Transfer_TransientProcess;
		%feature("autodoc", "* Sets TransientProcess at initial state, with an initial size
	:param nb: default value is 10000
	:type nb: int
	:rtype: None") Transfer_TransientProcess;
		 Transfer_TransientProcess (const Standard_Integer nb = 10000);

		/****************** TypedSharings ******************/
		%feature("compactdefaultargs") TypedSharings;
		%feature("autodoc", "* Returns the list of sharings entities, AT ANY LEVEL, which are kind of a given type. Calls TypedSharings from Graph Returns an empty list if the Graph has not been aknowledged
	:param start:
	:type start: Standard_Transient
	:param type:
	:type type: Standard_Type
	:rtype: Interface_EntityIterator") TypedSharings;
		Interface_EntityIterator TypedSharings (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Standard_Type> & type);

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
		/****************** ResultType ******************/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "* while a VoidBinder admits no Result, its ResultType returns the type of <self>
	:rtype: opencascade::handle<Standard_Type>") ResultType;
		opencascade::handle<Standard_Type> ResultType ();

		/****************** ResultTypeName ******************/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "* Returns '(void)'
	:rtype: char *") ResultTypeName;
		const char * ResultTypeName ();

		/****************** Transfer_VoidBinder ******************/
		%feature("compactdefaultargs") Transfer_VoidBinder;
		%feature("autodoc", "* a VoidBinder is not Multiple (Remark : it is not Simple too) But it can bring next results ...
	:rtype: None") Transfer_VoidBinder;
		 Transfer_VoidBinder ();

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
		/****************** AddActor ******************/
		%feature("compactdefaultargs") AddActor;
		%feature("autodoc", "* Utility which adds an actor to the default <self> (it calls SetActor from the TransientProcess)
	:param actor:
	:type actor: Transfer_ActorOfTransientProcess
	:rtype: None") AddActor;
		void AddActor (const opencascade::handle<Transfer_ActorOfTransientProcess> & actor);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "* Specific action : it calls the method Transfer from CopyTool i.e. the general service Copy, then returns the Binder produced by the TransientProcess
	:param start:
	:type start: Standard_Transient
	:param TP:
	:type TP: Transfer_TransientProcess
	:rtype: opencascade::handle<Transfer_Binder>") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** TransferDispatch ******************/
		%feature("compactdefaultargs") TransferDispatch;
		%feature("autodoc", "* Returns the TransferDispatch, which does the work, records the intermediate data, etc... See TransferDispatch & CopyTool, to see the available methods
	:rtype: Transfer_TransferDispatch") TransferDispatch;
		Transfer_TransferDispatch & TransferDispatch ();

		/****************** Transfer_ActorDispatch ******************/
		%feature("compactdefaultargs") Transfer_ActorDispatch;
		%feature("autodoc", "* Creates an ActorDispatch from a Model. Works with a General Service Library, given as an Argument This causes TransferDispatch and its TransientProcess to be created, with default actor <self>
	:param amodel:
	:type amodel: Interface_InterfaceModel
	:param lib:
	:type lib: Interface_GeneralLib
	:rtype: None") Transfer_ActorDispatch;
		 Transfer_ActorDispatch (const opencascade::handle<Interface_InterfaceModel> & amodel,const Interface_GeneralLib & lib);

		/****************** Transfer_ActorDispatch ******************/
		%feature("compactdefaultargs") Transfer_ActorDispatch;
		%feature("autodoc", "* Same as above, but Library is defined through a Protocol
	:param amodel:
	:type amodel: Interface_InterfaceModel
	:param protocol:
	:type protocol: Interface_Protocol
	:rtype: None") Transfer_ActorDispatch;
		 Transfer_ActorDispatch (const opencascade::handle<Interface_InterfaceModel> & amodel,const opencascade::handle<Interface_Protocol> & protocol);

		/****************** Transfer_ActorDispatch ******************/
		%feature("compactdefaultargs") Transfer_ActorDispatch;
		%feature("autodoc", "* Same as above, but works with the Active Protocol
	:param amodel:
	:type amodel: Interface_InterfaceModel
	:rtype: None") Transfer_ActorDispatch;
		 Transfer_ActorDispatch (const opencascade::handle<Interface_InterfaceModel> & amodel);

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
		/****************** Integer ******************/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "* Returns the value set for the integer part
	:rtype: int") Integer;
		Standard_Integer Integer ();

		/****************** SetInteger ******************/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "* Sets a value for the integer part
	:param value:
	:type value: int
	:rtype: None") SetInteger;
		void SetInteger (const Standard_Integer value);

		/****************** Transfer_BinderOfTransientInteger ******************/
		%feature("compactdefaultargs") Transfer_BinderOfTransientInteger;
		%feature("autodoc", "* Creates an empty BinderOfTransientInteger; Default value for the integer part is zero
	:rtype: None") Transfer_BinderOfTransientInteger;
		 Transfer_BinderOfTransientInteger ();

};


%make_alias(Transfer_BinderOfTransientInteger)

%extend Transfer_BinderOfTransientInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class Transfer_HSequenceOfBinder : public  Transfer_SequenceOfBinder, public Standard_Transient {
  public:
    Transfer_HSequenceOfBinder();
    Transfer_HSequenceOfBinder(const  Transfer_SequenceOfBinder& theOther);
    const  Transfer_SequenceOfBinder& Sequence();
    void Append (const  Transfer_SequenceOfBinder::value_type& theItem);
    void Append ( Transfer_SequenceOfBinder& theSequence);
     Transfer_SequenceOfBinder& ChangeSequence();
};
%make_alias(Transfer_HSequenceOfBinder)


class Transfer_HSequenceOfFinder : public  Transfer_SequenceOfFinder, public Standard_Transient {
  public:
    Transfer_HSequenceOfFinder();
    Transfer_HSequenceOfFinder(const  Transfer_SequenceOfFinder& theOther);
    const  Transfer_SequenceOfFinder& Sequence();
    void Append (const  Transfer_SequenceOfFinder::value_type& theItem);
    void Append ( Transfer_SequenceOfFinder& theSequence);
     Transfer_SequenceOfFinder& ChangeSequence();
};
%make_alias(Transfer_HSequenceOfFinder)


