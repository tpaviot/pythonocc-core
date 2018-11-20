/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
"-Purpose : Defines general Transfer engine, which provides tools and
workframe for all kinds of file (non-direct) Interfaces.
Works on the basis of data provided by package Interface
(especially InterfaceModel).
"
%enddef
%module (package="OCC.Core", docstring=TRANSFERDOCSTRING) Transfer

#pragma SWIG nowarn=504,325,503

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


%include Transfer_headers.i

/* typedefs */
/* end typedefs declaration */

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

%wrap_handle(Transfer_ActorOfProcessForFinder)
%wrap_handle(Transfer_ActorOfProcessForTransient)
%wrap_handle(Transfer_Binder)
%wrap_handle(Transfer_DispatchControl)
%wrap_handle(Transfer_Finder)
%wrap_handle(Transfer_HSequenceOfBinder)
%wrap_handle(Transfer_HSequenceOfFinder)
%wrap_handle(Transfer_IndexedDataMapNodeOfTransferMapOfProcessForFinder)
%wrap_handle(Transfer_IndexedDataMapNodeOfTransferMapOfProcessForTransient)
%wrap_handle(Transfer_MapContainer)
%wrap_handle(Transfer_ProcessForFinder)
%wrap_handle(Transfer_ProcessForTransient)
%wrap_handle(Transfer_ResultFromModel)
%wrap_handle(Transfer_ResultFromTransient)
%wrap_handle(Transfer_SequenceNodeOfSequenceOfBinder)
%wrap_handle(Transfer_SequenceNodeOfSequenceOfFinder)
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

%nodefaultctor Transfer_ActorOfProcessForFinder;
class Transfer_ActorOfProcessForFinder : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Transfer_ActorOfProcessForFinder;
		%feature("autodoc", "	:rtype: None
") Transfer_ActorOfProcessForFinder;
		 Transfer_ActorOfProcessForFinder ();
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: bool
") Recognize;
		virtual Standard_Boolean Recognize (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param TP:
	:type TP: Handle_Transfer_ProcessForFinder &
	:rtype: Handle_Transfer_Binder
") Transferring;
		virtual Handle_Transfer_Binder Transferring (const Handle_Transfer_Finder & start,const Handle_Transfer_ProcessForFinder & TP);
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: Handle_Transfer_SimpleBinderOfTransient
") TransientResult;
		Handle_Transfer_SimpleBinderOfTransient TransientResult (const Handle_Standard_Transient & res);
		%feature("compactdefaultargs") NullResult;
		%feature("autodoc", "	:rtype: Handle_Transfer_Binder
") NullResult;
		Handle_Transfer_Binder NullResult ();
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "	:param mode: default value is Standard_True
	:type mode: bool
	:rtype: None
") SetLast;
		void SetLast (const Standard_Boolean mode = Standard_True);
		%feature("compactdefaultargs") IsLast;
		%feature("autodoc", "	:rtype: bool
") IsLast;
		Standard_Boolean IsLast ();
		%feature("compactdefaultargs") SetNext;
		%feature("autodoc", "	:param next:
	:type next: Handle_Transfer_ActorOfProcessForFinder &
	:rtype: None
") SetNext;
		void SetNext (const Handle_Transfer_ActorOfProcessForFinder & next);
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: Handle_Transfer_ActorOfProcessForFinder
") Next;
		Handle_Transfer_ActorOfProcessForFinder Next ();
};


%make_alias(Transfer_ActorOfProcessForFinder)

%extend Transfer_ActorOfProcessForFinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_ActorOfProcessForTransient;
class Transfer_ActorOfProcessForTransient : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Transfer_ActorOfProcessForTransient;
		%feature("autodoc", "	:rtype: None
") Transfer_ActorOfProcessForTransient;
		 Transfer_ActorOfProcessForTransient ();
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: bool
") Recognize;
		virtual Standard_Boolean Recognize (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param TP:
	:type TP: Handle_Transfer_ProcessForTransient &
	:rtype: Handle_Transfer_Binder
") Transferring;
		virtual Handle_Transfer_Binder Transferring (const Handle_Standard_Transient & start,const Handle_Transfer_ProcessForTransient & TP);
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: Handle_Transfer_SimpleBinderOfTransient
") TransientResult;
		Handle_Transfer_SimpleBinderOfTransient TransientResult (const Handle_Standard_Transient & res);
		%feature("compactdefaultargs") NullResult;
		%feature("autodoc", "	:rtype: Handle_Transfer_Binder
") NullResult;
		Handle_Transfer_Binder NullResult ();
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "	:param mode: default value is Standard_True
	:type mode: bool
	:rtype: None
") SetLast;
		void SetLast (const Standard_Boolean mode = Standard_True);
		%feature("compactdefaultargs") IsLast;
		%feature("autodoc", "	:rtype: bool
") IsLast;
		Standard_Boolean IsLast ();
		%feature("compactdefaultargs") SetNext;
		%feature("autodoc", "	:param next:
	:type next: Handle_Transfer_ActorOfProcessForTransient &
	:rtype: None
") SetNext;
		void SetNext (const Handle_Transfer_ActorOfProcessForTransient & next);
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: Handle_Transfer_ActorOfProcessForTransient
") Next;
		Handle_Transfer_ActorOfProcessForTransient Next ();
};


%make_alias(Transfer_ActorOfProcessForTransient)

%extend Transfer_ActorOfProcessForTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_Binder;
class Transfer_Binder : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "	* Merges basic data (Check, ExecStatus) from another Binder but keeps its result. Used when a binder is replaced by another one, this allows to keep messages

	:param other:
	:type other: Handle_Transfer_Binder &
	:rtype: None
") Merge;
		void Merge (const Handle_Transfer_Binder & other);
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "	* Returns True if a Binder has several results, either by itself or because it has next results Can be defined by sub-classes.

	:rtype: bool
") IsMultiple;
		virtual Standard_Boolean IsMultiple ();
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "	* Returns the Type which characterizes the Result (if known)

	:rtype: Handle_Standard_Type
") ResultType;
		virtual Handle_Standard_Type ResultType ();
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "	* Returns the Name of the Type which characterizes the Result Can be returned even if ResultType itself is unknown

	:rtype: char *
") ResultTypeName;
		virtual const char * ResultTypeName ();
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "	* Adds a next result (at the end of the list) Remark : this information is not processed by Merge

	:param next:
	:type next: Handle_Transfer_Binder &
	:rtype: None
") AddResult;
		void AddResult (const Handle_Transfer_Binder & next);
		%feature("compactdefaultargs") NextResult;
		%feature("autodoc", "	* Returns the next result, Null if none

	:rtype: Handle_Transfer_Binder
") NextResult;
		Handle_Transfer_Binder NextResult ();
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	* Returns True if a Result is available (StatusResult = Defined) A Unique Result will be gotten by Result (which must be defined in each sub-class according to result type) For a Multiple Result, see class MultipleBinder For other case, specific access has to be forecast

	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("compactdefaultargs") SetAlreadyUsed;
		%feature("autodoc", "	* Declares that result is now used by another one, it means that it cannot be modified (by Rebind)

	:rtype: None
") SetAlreadyUsed;
		void SetAlreadyUsed ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns status, which can be Initial (not yet done), Made (a result is recorded, not yet shared), Used (it is shared and cannot be modified)

	:rtype: Transfer_StatusResult
") Status;
		Transfer_StatusResult Status ();
		%feature("compactdefaultargs") StatusExec;
		%feature("autodoc", "	* Returns execution status

	:rtype: Transfer_StatusExec
") StatusExec;
		Transfer_StatusExec StatusExec ();
		%feature("compactdefaultargs") SetStatusExec;
		%feature("autodoc", "	* Modifies execution status; called by TransferProcess only (for StatusError, rather use SetError, below)

	:param stat:
	:type stat: Transfer_StatusExec
	:rtype: None
") SetStatusExec;
		void SetStatusExec (const Transfer_StatusExec stat);
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "	* Used to declare an individual transfer as beeing erroneous (Status is set to Void, StatusExec is set to Error, <errmess> is added to Check's list of Fails) It is possible to record several messages of error //! It has same effect for TransferProcess as raising an exception during the operation of Transfer, except the Transfer tries to continue (as if ErrorHandle had been set)

	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None
") AddFail;
		void AddFail (const char * mess,const char * orig = "");
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "	* Used to attach a Warning Message to an individual Transfer It has no effect on the Status

	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None
") AddWarning;
		void AddWarning (const char * mess,const char * orig = "");
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	* Returns Check which stores Fail messages Note that no Entity is associated in this Check

	:rtype: Handle_Interface_Check
") Check;
		const Handle_Interface_Check Check ();
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "	* Returns Check which stores Fail messages, in order to modify it (adding messages, or replacing it)

	:rtype: Handle_Interface_Check
") CCheck;
		Handle_Interface_Check CCheck ();
};


%make_alias(Transfer_Binder)

%extend Transfer_Binder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Transfer_DataInfo {
	public:
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the Type attached to an object Here, the Dynamic Type of a Transient. Null Type if unknown

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_Standard_Type
") Type;
		static Handle_Standard_Type Type (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "	* Returns Type Name (string) Allows to name type of non-handled objects

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: char *
") TypeName;
		static const char * TypeName (const Handle_Standard_Transient & ent);
};


%extend Transfer_DataInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_DispatchControl;
class Transfer_DispatchControl : public Interface_CopyControl {
	public:
		%feature("compactdefaultargs") Transfer_DispatchControl;
		%feature("autodoc", "	* Creates the DispatchControl, ready for use

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: None
") Transfer_DispatchControl;
		 Transfer_DispatchControl (const Handle_Interface_InterfaceModel & model,const Handle_Transfer_TransientProcess & TP);
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "	* Returns the content of the DispatchControl : it can be used for a direct call, if the basic methods do not suffice

	:rtype: Handle_Transfer_TransientProcess
") TransientProcess;
		Handle_Transfer_TransientProcess TransientProcess ();
		%feature("compactdefaultargs") StartingModel;
		%feature("autodoc", "	* Returns the Model from which the transfer is to be done

	:rtype: Handle_Interface_InterfaceModel
") StartingModel;
		Handle_Interface_InterfaceModel StartingModel ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the List of Copied Results

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	* Binds a (Transient) Result to a (Transient) Starting Entity

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: None
") Bind;
		void Bind (const Handle_Standard_Transient & ent,const Handle_Standard_Transient & res);
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "	* Searches for the Result bound to a Starting Entity If Found, returns True and fills <res> Else, returns False and nullifies <res>

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: bool
") Search;
		Standard_Boolean Search (const Handle_Standard_Transient & ent,Handle_Standard_Transient & res);
};


%make_alias(Transfer_DispatchControl)

%extend Transfer_DispatchControl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Transfer_FindHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Returns a HashCode in the range <0,Upper> for a Finder : asks the Finder its HashCode then transforms it to be in the required range

	:param K:
	:type K: Handle_Transfer_Finder &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const Handle_Transfer_Finder & K,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True if two keys are the same. The test does not work on the Finders themselves but by calling their methods Equates

	:param K1:
	:type K1: Handle_Transfer_Finder &
	:param K2:
	:type K2: Handle_Transfer_Finder &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const Handle_Transfer_Finder & K1,const Handle_Transfer_Finder & K2);
};


%extend Transfer_FindHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_Finder;
class Transfer_Finder : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") GetHashCode;
		%feature("autodoc", "	* Returns the HashCode which has been stored by SetHashCode (remark that HashCode could be deferred then be defined by sub-classes, the result is the same)

	:rtype: int
") GetHashCode;
		Standard_Integer GetHashCode ();
		%feature("compactdefaultargs") Equates;
		%feature("autodoc", "	* Specific testof equallity : to be defined by each sub-class, must be False if Finders have not the same true Type, else their contents must be compared

	:param other:
	:type other: Handle_Transfer_Finder &
	:rtype: bool
") Equates;
		virtual Standard_Boolean Equates (const Handle_Transfer_Finder & other);
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "	* Returns the Type of the Value. By default, returns the DynamicType of <self>, but can be redefined

	:rtype: Handle_Standard_Type
") ValueType;
		virtual Handle_Standard_Type ValueType ();
		%feature("compactdefaultargs") ValueTypeName;
		%feature("autodoc", "	* Returns the name of the Type of the Value. Default is name of ValueType, unless it is for a non-handled object

	:rtype: char *
") ValueTypeName;
		virtual const char * ValueTypeName ();
		%feature("compactdefaultargs") SetAttribute;
		%feature("autodoc", "	* Adds an attribute with a given name (replaces the former one with the same name if already exists)

	:param name:
	:type name: char *
	:param val:
	:type val: Handle_Standard_Transient &
	:rtype: None
") SetAttribute;
		void SetAttribute (const char * name,const Handle_Standard_Transient & val);
		%feature("compactdefaultargs") RemoveAttribute;
		%feature("autodoc", "	* Removes an attribute Returns True when done, False if this attribute did not exist

	:param name:
	:type name: char *
	:rtype: bool
") RemoveAttribute;
		Standard_Boolean RemoveAttribute (const char * name);
		%feature("compactdefaultargs") GetAttribute;
		%feature("autodoc", "	* Returns an attribute from its name, filtered by a type If no attribute has this name, or if it is not kind of this type, <val> is Null and returned value is False Else, it is True

	:param name:
	:type name: char *
	:param type:
	:type type: Handle_Standard_Type &
	:param val:
	:type val: Handle_Standard_Transient &
	:rtype: bool
") GetAttribute;
		Standard_Boolean GetAttribute (const char * name,const Handle_Standard_Type & type,Handle_Standard_Transient & val);
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "	* Returns an attribute from its name. Null Handle if not recorded (whatever Transient, Integer, Real ...)

	:param name:
	:type name: char *
	:rtype: Handle_Standard_Transient
") Attribute;
		Handle_Standard_Transient Attribute (const char * name);
		%feature("compactdefaultargs") AttributeType;
		%feature("autodoc", "	* Returns the type of an attribute : ParamInt , ParamReal , ParamText (String) , ParamIdent (any) or ParamVoid (not recorded)

	:param name:
	:type name: char *
	:rtype: Interface_ParamType
") AttributeType;
		Interface_ParamType AttributeType (const char * name);
		%feature("compactdefaultargs") SetIntegerAttribute;
		%feature("autodoc", "	* Adds an integer value for an attribute

	:param name:
	:type name: char *
	:param val:
	:type val: int
	:rtype: None
") SetIntegerAttribute;
		void SetIntegerAttribute (const char * name,const Standard_Integer val);
		%feature("compactdefaultargs") GetIntegerAttribute;
		%feature("autodoc", "	* Returns an attribute from its name, as integer If no attribute has this name, or not an integer, <val> is 0 and returned value is False Else, it is True

	:param name:
	:type name: char *
	:param val:
	:type val: int &
	:rtype: bool
") GetIntegerAttribute;
		Standard_Boolean GetIntegerAttribute (const char * name,Standard_Integer &OutValue);
		%feature("compactdefaultargs") IntegerAttribute;
		%feature("autodoc", "	* Returns an integer attribute from its name. 0 if not recorded

	:param name:
	:type name: char *
	:rtype: int
") IntegerAttribute;
		Standard_Integer IntegerAttribute (const char * name);
		%feature("compactdefaultargs") SetRealAttribute;
		%feature("autodoc", "	* Adds a real value for an attribute

	:param name:
	:type name: char *
	:param val:
	:type val: float
	:rtype: None
") SetRealAttribute;
		void SetRealAttribute (const char * name,const Standard_Real val);
		%feature("compactdefaultargs") GetRealAttribute;
		%feature("autodoc", "	* Returns an attribute from its name, as real If no attribute has this name, or not a real <val> is 0.0 and returned value is False Else, it is True

	:param name:
	:type name: char *
	:param val:
	:type val: float &
	:rtype: bool
") GetRealAttribute;
		Standard_Boolean GetRealAttribute (const char * name,Standard_Real &OutValue);
		%feature("compactdefaultargs") RealAttribute;
		%feature("autodoc", "	* Returns a real attribute from its name. 0.0 if not recorded

	:param name:
	:type name: char *
	:rtype: float
") RealAttribute;
		Standard_Real RealAttribute (const char * name);
		%feature("compactdefaultargs") SetStringAttribute;
		%feature("autodoc", "	* Adds a String value for an attribute

	:param name:
	:type name: char *
	:param val:
	:type val: char *
	:rtype: None
") SetStringAttribute;
		void SetStringAttribute (const char * name,const char * val);
		%feature("compactdefaultargs") GetStringAttribute;
		%feature("autodoc", "	* Returns an attribute from its name, as String If no attribute has this name, or not a String <val> is 0.0 and returned value is False Else, it is True

	:param name:
	:type name: char *
	:param val:
	:type val: char * &
	:rtype: bool
") GetStringAttribute;
		Standard_Boolean GetStringAttribute (const char * name,const char * & val);
		%feature("compactdefaultargs") StringAttribute;
		%feature("autodoc", "	* Returns a String attribute from its name. '' if not recorded

	:param name:
	:type name: char *
	:rtype: char *
") StringAttribute;
		const char * StringAttribute (const char * name);
		%feature("compactdefaultargs") AttrList;
		%feature("autodoc", "	* Returns the exhaustive list of attributes

	:rtype: Handle_Dico_DictionaryOfTransient
") AttrList;
		Handle_Dico_DictionaryOfTransient AttrList ();
		%feature("compactdefaultargs") SameAttributes;
		%feature("autodoc", "	* Gets the list of attributes from <other>, as such, i.e. not copied : attributes are shared, any attribute edited, added, or removed in <other> is also in <self> and vice versa The former list of attributes of <self> is dropped

	:param other:
	:type other: Handle_Transfer_Finder &
	:rtype: None
") SameAttributes;
		void SameAttributes (const Handle_Transfer_Finder & other);
		%feature("compactdefaultargs") GetAttributes;
		%feature("autodoc", "	* Gets the list of attributes from <other>, by copying it By default, considers all the attributes from <other> If <fromname> is given, considers only the attributes with name beginning by <fromname> //! For each attribute, if <copied> is True (D), its value is also copied if it is a basic type (Integer,Real,String), else it remains shared between <other> and <self> //! These new attributes are added to the existing ones in <self>, in case of same name, they replace the existing ones

	:param other:
	:type other: Handle_Transfer_Finder &
	:param fromname: default value is ""
	:type fromname: char *
	:param copied: default value is Standard_True
	:type copied: bool
	:rtype: None
") GetAttributes;
		void GetAttributes (const Handle_Transfer_Finder & other,const char * fromname = "",const Standard_Boolean copied = Standard_True);
};


%make_alias(Transfer_Finder)

%extend Transfer_Finder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_HSequenceOfBinder;
class Transfer_HSequenceOfBinder : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Transfer_HSequenceOfBinder;
		%feature("autodoc", "	:rtype: None
") Transfer_HSequenceOfBinder;
		 Transfer_HSequenceOfBinder ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Transfer_Binder &
	:rtype: None
") Append;
		void Append (const Handle_Transfer_Binder & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Transfer_HSequenceOfBinder &
	:rtype: None
") Append;
		void Append (const Handle_Transfer_HSequenceOfBinder & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Transfer_Binder &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Transfer_Binder & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Transfer_HSequenceOfBinder &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Transfer_HSequenceOfBinder & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Transfer_Binder &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Transfer_Binder & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Transfer_HSequenceOfBinder &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Transfer_HSequenceOfBinder & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Transfer_Binder &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Transfer_Binder & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Transfer_HSequenceOfBinder &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Transfer_HSequenceOfBinder & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Transfer_HSequenceOfBinder
") Split;
		Handle_Transfer_HSequenceOfBinder Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Transfer_Binder &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Transfer_Binder & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Transfer_Binder
") Value;
		Handle_Transfer_Binder Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Transfer_Binder
") ChangeValue;
		Handle_Transfer_Binder ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: Transfer_SequenceOfBinder
") Sequence;
		const Transfer_SequenceOfBinder & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: Transfer_SequenceOfBinder
") ChangeSequence;
		Transfer_SequenceOfBinder & ChangeSequence ();
};


%make_alias(Transfer_HSequenceOfBinder)

%extend Transfer_HSequenceOfBinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_HSequenceOfFinder;
class Transfer_HSequenceOfFinder : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Transfer_HSequenceOfFinder;
		%feature("autodoc", "	:rtype: None
") Transfer_HSequenceOfFinder;
		 Transfer_HSequenceOfFinder ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Transfer_Finder &
	:rtype: None
") Append;
		void Append (const Handle_Transfer_Finder & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Transfer_HSequenceOfFinder &
	:rtype: None
") Append;
		void Append (const Handle_Transfer_HSequenceOfFinder & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Transfer_Finder &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Transfer_Finder & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Transfer_HSequenceOfFinder &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Transfer_HSequenceOfFinder & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Transfer_Finder &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Transfer_Finder & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Transfer_HSequenceOfFinder &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Transfer_HSequenceOfFinder & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Transfer_Finder &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Transfer_Finder & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Transfer_HSequenceOfFinder &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Transfer_HSequenceOfFinder & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Transfer_HSequenceOfFinder
") Split;
		Handle_Transfer_HSequenceOfFinder Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Transfer_Finder &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Transfer_Finder & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Transfer_Finder
") Value;
		Handle_Transfer_Finder Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Transfer_Finder
") ChangeValue;
		Handle_Transfer_Finder ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: Transfer_SequenceOfFinder
") Sequence;
		const Transfer_SequenceOfFinder & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: Transfer_SequenceOfFinder
") ChangeSequence;
		Transfer_SequenceOfFinder & ChangeSequence ();
};


%make_alias(Transfer_HSequenceOfFinder)

%extend Transfer_HSequenceOfFinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_IndexedDataMapNodeOfTransferMapOfProcessForFinder;
class Transfer_IndexedDataMapNodeOfTransferMapOfProcessForFinder : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Transfer_IndexedDataMapNodeOfTransferMapOfProcessForFinder;
		%feature("autodoc", "	:param K1:
	:type K1: Handle_Transfer_Finder &
	:param K2:
	:type K2: int
	:param I:
	:type I: Handle_Transfer_Binder &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") Transfer_IndexedDataMapNodeOfTransferMapOfProcessForFinder;
		 Transfer_IndexedDataMapNodeOfTransferMapOfProcessForFinder (const Handle_Transfer_Finder & K1,const Standard_Integer K2,const Handle_Transfer_Binder & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: Handle_Transfer_Finder
") Key1;
		Handle_Transfer_Finder Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Transfer_Binder
") Value;
		Handle_Transfer_Binder Value ();
};


%make_alias(Transfer_IndexedDataMapNodeOfTransferMapOfProcessForFinder)

%extend Transfer_IndexedDataMapNodeOfTransferMapOfProcessForFinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_IndexedDataMapNodeOfTransferMapOfProcessForTransient;
class Transfer_IndexedDataMapNodeOfTransferMapOfProcessForTransient : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Transfer_IndexedDataMapNodeOfTransferMapOfProcessForTransient;
		%feature("autodoc", "	:param K1:
	:type K1: Handle_Standard_Transient &
	:param K2:
	:type K2: int
	:param I:
	:type I: Handle_Transfer_Binder &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") Transfer_IndexedDataMapNodeOfTransferMapOfProcessForTransient;
		 Transfer_IndexedDataMapNodeOfTransferMapOfProcessForTransient (const Handle_Standard_Transient & K1,const Standard_Integer K2,const Handle_Transfer_Binder & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Key1;
		Handle_Standard_Transient Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Transfer_Binder
") Value;
		Handle_Transfer_Binder Value ();
};


%make_alias(Transfer_IndexedDataMapNodeOfTransferMapOfProcessForTransient)

%extend Transfer_IndexedDataMapNodeOfTransferMapOfProcessForTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_MapContainer;
class Transfer_MapContainer : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Transfer_MapContainer;
		%feature("autodoc", "	:rtype: None
") Transfer_MapContainer;
		 Transfer_MapContainer ();
		%feature("compactdefaultargs") SetMapObjects;
		%feature("autodoc", "	* Set map already translated geometry objects.

	:param theMapObjects:
	:type theMapObjects: TColStd_DataMapOfTransientTransient &
	:rtype: None
") SetMapObjects;
		void SetMapObjects (TColStd_DataMapOfTransientTransient & theMapObjects);
		%feature("compactdefaultargs") GetMapObjects;
		%feature("autodoc", "	* Get map already translated geometry objects.

	:rtype: TColStd_DataMapOfTransientTransient
") GetMapObjects;
		TColStd_DataMapOfTransientTransient & GetMapObjects ();
};


%make_alias(Transfer_MapContainer)

%extend Transfer_MapContainer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_ProcessForFinder;
class Transfer_ProcessForFinder : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Transfer_ProcessForFinder;
		%feature("autodoc", "	:param nb: default value is 10000
	:type nb: int
	:rtype: None
") Transfer_ProcessForFinder;
		 Transfer_ProcessForFinder (const Standard_Integer nb = 10000);
		%feature("compactdefaultargs") Transfer_ProcessForFinder;
		%feature("autodoc", "	:param printer:
	:type printer: Handle_Message_Messenger &
	:param nb: default value is 10000
	:type nb: int
	:rtype: None
") Transfer_ProcessForFinder;
		 Transfer_ProcessForFinder (const Handle_Message_Messenger & printer,const Standard_Integer nb = 10000);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "	:rtype: None
") Clean;
		void Clean ();
		%feature("compactdefaultargs") Resize;
		%feature("autodoc", "	:param nb:
	:type nb: int
	:rtype: None
") Resize;
		void Resize (const Standard_Integer nb);
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "	:param actor:
	:type actor: Handle_Transfer_ActorOfProcessForFinder &
	:rtype: None
") SetActor;
		void SetActor (const Handle_Transfer_ActorOfProcessForFinder & actor);
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "	:rtype: Handle_Transfer_ActorOfProcessForFinder
") Actor;
		Handle_Transfer_ActorOfProcessForFinder Actor ();
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: Handle_Transfer_Binder
") Find;
		Handle_Transfer_Binder Find (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") IsAlreadyUsed;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: bool
") IsAlreadyUsed;
		Standard_Boolean IsAlreadyUsed (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param binder:
	:type binder: Handle_Transfer_Binder &
	:rtype: None
") Bind;
		void Bind (const Handle_Transfer_Finder & start,const Handle_Transfer_Binder & binder);
		%feature("compactdefaultargs") Rebind;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param binder:
	:type binder: Handle_Transfer_Binder &
	:rtype: None
") Rebind;
		void Rebind (const Handle_Transfer_Finder & start,const Handle_Transfer_Binder & binder);
		%feature("compactdefaultargs") Unbind;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: bool
") Unbind;
		Standard_Boolean Unbind (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") FindElseBind;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: Handle_Transfer_Binder
") FindElseBind;
		Handle_Transfer_Binder FindElseBind (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "	:param messenger:
	:type messenger: Handle_Message_Messenger &
	:rtype: None
") SetMessenger;
		void SetMessenger (const Handle_Message_Messenger & messenger);
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "	:rtype: Handle_Message_Messenger
") Messenger;
		Handle_Message_Messenger Messenger ();
		%feature("compactdefaultargs") SetTraceLevel;
		%feature("autodoc", "	:param tracelev:
	:type tracelev: int
	:rtype: None
") SetTraceLevel;
		void SetTraceLevel (const Standard_Integer tracelev);
		%feature("compactdefaultargs") TraceLevel;
		%feature("autodoc", "	:rtype: int
") TraceLevel;
		Standard_Integer TraceLevel ();
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param amsg:
	:type amsg: Message_Msg &
	:rtype: None
") SendFail;
		void SendFail (const Handle_Transfer_Finder & start,const Message_Msg & amsg);
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param amsg:
	:type amsg: Message_Msg &
	:rtype: None
") SendWarning;
		void SendWarning (const Handle_Transfer_Finder & start,const Message_Msg & amsg);
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param amsg:
	:type amsg: Message_Msg &
	:rtype: None
") SendMsg;
		void SendMsg (const Handle_Transfer_Finder & start,const Message_Msg & amsg);
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None
") AddFail;
		void AddFail (const Handle_Transfer_Finder & start,const char * mess,const char * orig = "");
		%feature("compactdefaultargs") AddError;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None
") AddError;
		void AddError (const Handle_Transfer_Finder & start,const char * mess,const char * orig = "");
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param amsg:
	:type amsg: Message_Msg &
	:rtype: None
") AddFail;
		void AddFail (const Handle_Transfer_Finder & start,const Message_Msg & amsg);
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None
") AddWarning;
		void AddWarning (const Handle_Transfer_Finder & start,const char * mess,const char * orig = "");
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param amsg:
	:type amsg: Message_Msg &
	:rtype: None
") AddWarning;
		void AddWarning (const Handle_Transfer_Finder & start,const Message_Msg & amsg);
		%feature("compactdefaultargs") Mend;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param pref: default value is ""
	:type pref: char *
	:rtype: None
") Mend;
		void Mend (const Handle_Transfer_Finder & start,const char * pref = "");
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: Handle_Interface_Check
") Check;
		Handle_Interface_Check Check (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") BindTransient;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: None
") BindTransient;
		void BindTransient (const Handle_Transfer_Finder & start,const Handle_Standard_Transient & res);
		%feature("compactdefaultargs") FindTransient;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: Handle_Standard_Transient
") FindTransient;
		Handle_Standard_Transient FindTransient (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") BindMultiple;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: None
") BindMultiple;
		void BindMultiple (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") AddMultiple;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: None
") AddMultiple;
		void AddMultiple (const Handle_Transfer_Finder & start,const Handle_Standard_Transient & res);
		%feature("compactdefaultargs") FindTypedTransient;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param atype:
	:type atype: Handle_Standard_Type &
	:param val:
	:type val: Handle_Standard_Transient &
	:rtype: bool
") FindTypedTransient;
		Standard_Boolean FindTypedTransient (const Handle_Transfer_Finder & start,const Handle_Standard_Type & atype,Handle_Standard_Transient & val);
		%feature("compactdefaultargs") GetTypedTransient;
		%feature("autodoc", "	:param binder:
	:type binder: Handle_Transfer_Binder &
	:param atype:
	:type atype: Handle_Standard_Type &
	:param val:
	:type val: Handle_Standard_Transient &
	:rtype: bool
") GetTypedTransient;
		Standard_Boolean GetTypedTransient (const Handle_Transfer_Binder & binder,const Handle_Standard_Type & atype,Handle_Standard_Transient & val);
		%feature("compactdefaultargs") NbMapped;
		%feature("autodoc", "	:rtype: int
") NbMapped;
		Standard_Integer NbMapped ();
		%feature("compactdefaultargs") Mapped;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_Transfer_Finder
") Mapped;
		Handle_Transfer_Finder Mapped (const Standard_Integer num);
		%feature("compactdefaultargs") MapIndex;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: int
") MapIndex;
		Standard_Integer MapIndex (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") MapItem;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_Transfer_Binder
") MapItem;
		Handle_Transfer_Binder MapItem (const Standard_Integer num);
		%feature("compactdefaultargs") SetRoot;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: None
") SetRoot;
		void SetRoot (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") SetRootManagement;
		%feature("autodoc", "	:param stat:
	:type stat: bool
	:rtype: None
") SetRootManagement;
		void SetRootManagement (const Standard_Boolean stat);
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "	:rtype: int
") NbRoots;
		Standard_Integer NbRoots ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_Transfer_Finder
") Root;
		Handle_Transfer_Finder Root (const Standard_Integer num);
		%feature("compactdefaultargs") RootItem;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_Transfer_Binder
") RootItem;
		Handle_Transfer_Binder RootItem (const Standard_Integer num);
		%feature("compactdefaultargs") RootIndex;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: int
") RootIndex;
		Standard_Integer RootIndex (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") NestingLevel;
		%feature("autodoc", "	:rtype: int
") NestingLevel;
		Standard_Integer NestingLevel ();
		%feature("compactdefaultargs") ResetNestingLevel;
		%feature("autodoc", "	:rtype: None
") ResetNestingLevel;
		void ResetNestingLevel ();
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: bool
") Recognize;
		Standard_Boolean Recognize (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: Handle_Transfer_Binder
") Transferring;
		Handle_Transfer_Binder Transferring (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: bool
") Transfer;
		Standard_Boolean Transfer (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") StartTrace;
		%feature("autodoc", "	:param binder:
	:type binder: Handle_Transfer_Binder &
	:param start:
	:type start: Handle_Transfer_Finder &
	:param level:
	:type level: int
	:param mode:
	:type mode: int
	:rtype: None
") StartTrace;
		void StartTrace (const Handle_Transfer_Binder & binder,const Handle_Transfer_Finder & start,const Standard_Integer level,const Standard_Integer mode);
		%feature("compactdefaultargs") PrintTrace;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: void
") PrintTrace;
		virtual void PrintTrace (const Handle_Transfer_Finder & start,const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") IsLooping;
		%feature("autodoc", "	:param alevel:
	:type alevel: int
	:rtype: bool
") IsLooping;
		Standard_Boolean IsLooping (const Standard_Integer alevel);
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	:param withstart: default value is Standard_False
	:type withstart: bool
	:rtype: Transfer_IteratorOfProcessForFinder
") RootResult;
		Transfer_IteratorOfProcessForFinder RootResult (const Standard_Boolean withstart = Standard_False);
		%feature("compactdefaultargs") CompleteResult;
		%feature("autodoc", "	:param withstart: default value is Standard_False
	:type withstart: bool
	:rtype: Transfer_IteratorOfProcessForFinder
") CompleteResult;
		Transfer_IteratorOfProcessForFinder CompleteResult (const Standard_Boolean withstart = Standard_False);
		%feature("compactdefaultargs") AbnormalResult;
		%feature("autodoc", "	:rtype: Transfer_IteratorOfProcessForFinder
") AbnormalResult;
		Transfer_IteratorOfProcessForFinder AbnormalResult ();
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "	:param erronly:
	:type erronly: bool
	:rtype: Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList (const Standard_Boolean erronly);
		%feature("compactdefaultargs") ResultOne;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param level:
	:type level: int
	:param withstart: default value is Standard_False
	:type withstart: bool
	:rtype: Transfer_IteratorOfProcessForFinder
") ResultOne;
		Transfer_IteratorOfProcessForFinder ResultOne (const Handle_Transfer_Finder & start,const Standard_Integer level,const Standard_Boolean withstart = Standard_False);
		%feature("compactdefaultargs") CheckListOne;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param level:
	:type level: int
	:param erronly:
	:type erronly: bool
	:rtype: Interface_CheckIterator
") CheckListOne;
		Interface_CheckIterator CheckListOne (const Handle_Transfer_Finder & start,const Standard_Integer level,const Standard_Boolean erronly);
		%feature("compactdefaultargs") IsCheckListEmpty;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param level:
	:type level: int
	:param erronly:
	:type erronly: bool
	:rtype: bool
") IsCheckListEmpty;
		Standard_Boolean IsCheckListEmpty (const Handle_Transfer_Finder & start,const Standard_Integer level,const Standard_Boolean erronly);
		%feature("compactdefaultargs") RemoveResult;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param level:
	:type level: int
	:param compute: default value is Standard_True
	:type compute: bool
	:rtype: None
") RemoveResult;
		void RemoveResult (const Handle_Transfer_Finder & start,const Standard_Integer level,const Standard_Boolean compute = Standard_True);
		%feature("compactdefaultargs") CheckNum;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: int
") CheckNum;
		virtual Standard_Integer CheckNum (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "	:param theProgress:
	:type theProgress: Handle_Message_ProgressIndicator &
	:rtype: None
") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & theProgress);
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "	:rtype: Handle_Message_ProgressIndicator
") GetProgress;
		Handle_Message_ProgressIndicator GetProgress ();
};


%make_alias(Transfer_ProcessForFinder)

%extend Transfer_ProcessForFinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_ProcessForTransient;
class Transfer_ProcessForTransient : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Transfer_ProcessForTransient;
		%feature("autodoc", "	:param nb: default value is 10000
	:type nb: int
	:rtype: None
") Transfer_ProcessForTransient;
		 Transfer_ProcessForTransient (const Standard_Integer nb = 10000);
		%feature("compactdefaultargs") Transfer_ProcessForTransient;
		%feature("autodoc", "	:param printer:
	:type printer: Handle_Message_Messenger &
	:param nb: default value is 10000
	:type nb: int
	:rtype: None
") Transfer_ProcessForTransient;
		 Transfer_ProcessForTransient (const Handle_Message_Messenger & printer,const Standard_Integer nb = 10000);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "	:rtype: None
") Clean;
		void Clean ();
		%feature("compactdefaultargs") Resize;
		%feature("autodoc", "	:param nb:
	:type nb: int
	:rtype: None
") Resize;
		void Resize (const Standard_Integer nb);
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "	:param actor:
	:type actor: Handle_Transfer_ActorOfProcessForTransient &
	:rtype: None
") SetActor;
		void SetActor (const Handle_Transfer_ActorOfProcessForTransient & actor);
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "	:rtype: Handle_Transfer_ActorOfProcessForTransient
") Actor;
		Handle_Transfer_ActorOfProcessForTransient Actor ();
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: Handle_Transfer_Binder
") Find;
		Handle_Transfer_Binder Find (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") IsAlreadyUsed;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: bool
") IsAlreadyUsed;
		Standard_Boolean IsAlreadyUsed (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param binder:
	:type binder: Handle_Transfer_Binder &
	:rtype: None
") Bind;
		void Bind (const Handle_Standard_Transient & start,const Handle_Transfer_Binder & binder);
		%feature("compactdefaultargs") Rebind;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param binder:
	:type binder: Handle_Transfer_Binder &
	:rtype: None
") Rebind;
		void Rebind (const Handle_Standard_Transient & start,const Handle_Transfer_Binder & binder);
		%feature("compactdefaultargs") Unbind;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: bool
") Unbind;
		Standard_Boolean Unbind (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") FindElseBind;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: Handle_Transfer_Binder
") FindElseBind;
		Handle_Transfer_Binder FindElseBind (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") SetMessenger;
		%feature("autodoc", "	:param messenger:
	:type messenger: Handle_Message_Messenger &
	:rtype: None
") SetMessenger;
		void SetMessenger (const Handle_Message_Messenger & messenger);
		%feature("compactdefaultargs") Messenger;
		%feature("autodoc", "	:rtype: Handle_Message_Messenger
") Messenger;
		Handle_Message_Messenger Messenger ();
		%feature("compactdefaultargs") SetTraceLevel;
		%feature("autodoc", "	:param tracelev:
	:type tracelev: int
	:rtype: None
") SetTraceLevel;
		void SetTraceLevel (const Standard_Integer tracelev);
		%feature("compactdefaultargs") TraceLevel;
		%feature("autodoc", "	:rtype: int
") TraceLevel;
		Standard_Integer TraceLevel ();
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param amsg:
	:type amsg: Message_Msg &
	:rtype: None
") SendFail;
		void SendFail (const Handle_Standard_Transient & start,const Message_Msg & amsg);
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param amsg:
	:type amsg: Message_Msg &
	:rtype: None
") SendWarning;
		void SendWarning (const Handle_Standard_Transient & start,const Message_Msg & amsg);
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param amsg:
	:type amsg: Message_Msg &
	:rtype: None
") SendMsg;
		void SendMsg (const Handle_Standard_Transient & start,const Message_Msg & amsg);
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None
") AddFail;
		void AddFail (const Handle_Standard_Transient & start,const char * mess,const char * orig = "");
		%feature("compactdefaultargs") AddError;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None
") AddError;
		void AddError (const Handle_Standard_Transient & start,const char * mess,const char * orig = "");
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param amsg:
	:type amsg: Message_Msg &
	:rtype: None
") AddFail;
		void AddFail (const Handle_Standard_Transient & start,const Message_Msg & amsg);
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None
") AddWarning;
		void AddWarning (const Handle_Standard_Transient & start,const char * mess,const char * orig = "");
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param amsg:
	:type amsg: Message_Msg &
	:rtype: None
") AddWarning;
		void AddWarning (const Handle_Standard_Transient & start,const Message_Msg & amsg);
		%feature("compactdefaultargs") Mend;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param pref: default value is ""
	:type pref: char *
	:rtype: None
") Mend;
		void Mend (const Handle_Standard_Transient & start,const char * pref = "");
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: Handle_Interface_Check
") Check;
		Handle_Interface_Check Check (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") BindTransient;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: None
") BindTransient;
		void BindTransient (const Handle_Standard_Transient & start,const Handle_Standard_Transient & res);
		%feature("compactdefaultargs") FindTransient;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: Handle_Standard_Transient
") FindTransient;
		Handle_Standard_Transient FindTransient (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") BindMultiple;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: None
") BindMultiple;
		void BindMultiple (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") AddMultiple;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: None
") AddMultiple;
		void AddMultiple (const Handle_Standard_Transient & start,const Handle_Standard_Transient & res);
		%feature("compactdefaultargs") FindTypedTransient;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param atype:
	:type atype: Handle_Standard_Type &
	:param val:
	:type val: Handle_Standard_Transient &
	:rtype: bool
") FindTypedTransient;
		Standard_Boolean FindTypedTransient (const Handle_Standard_Transient & start,const Handle_Standard_Type & atype,Handle_Standard_Transient & val);
		%feature("compactdefaultargs") GetTypedTransient;
		%feature("autodoc", "	:param binder:
	:type binder: Handle_Transfer_Binder &
	:param atype:
	:type atype: Handle_Standard_Type &
	:param val:
	:type val: Handle_Standard_Transient &
	:rtype: bool
") GetTypedTransient;
		Standard_Boolean GetTypedTransient (const Handle_Transfer_Binder & binder,const Handle_Standard_Type & atype,Handle_Standard_Transient & val);
		%feature("compactdefaultargs") NbMapped;
		%feature("autodoc", "	:rtype: int
") NbMapped;
		Standard_Integer NbMapped ();
		%feature("compactdefaultargs") Mapped;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_Standard_Transient
") Mapped;
		Handle_Standard_Transient Mapped (const Standard_Integer num);
		%feature("compactdefaultargs") MapIndex;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: int
") MapIndex;
		Standard_Integer MapIndex (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") MapItem;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_Transfer_Binder
") MapItem;
		Handle_Transfer_Binder MapItem (const Standard_Integer num);
		%feature("compactdefaultargs") SetRoot;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: None
") SetRoot;
		void SetRoot (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") SetRootManagement;
		%feature("autodoc", "	:param stat:
	:type stat: bool
	:rtype: None
") SetRootManagement;
		void SetRootManagement (const Standard_Boolean stat);
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "	:rtype: int
") NbRoots;
		Standard_Integer NbRoots ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_Standard_Transient
") Root;
		Handle_Standard_Transient Root (const Standard_Integer num);
		%feature("compactdefaultargs") RootItem;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_Transfer_Binder
") RootItem;
		Handle_Transfer_Binder RootItem (const Standard_Integer num);
		%feature("compactdefaultargs") RootIndex;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: int
") RootIndex;
		Standard_Integer RootIndex (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") NestingLevel;
		%feature("autodoc", "	:rtype: int
") NestingLevel;
		Standard_Integer NestingLevel ();
		%feature("compactdefaultargs") ResetNestingLevel;
		%feature("autodoc", "	:rtype: None
") ResetNestingLevel;
		void ResetNestingLevel ();
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: bool
") Recognize;
		Standard_Boolean Recognize (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: Handle_Transfer_Binder
") Transferring;
		Handle_Transfer_Binder Transferring (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: bool
") Transfer;
		Standard_Boolean Transfer (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") StartTrace;
		%feature("autodoc", "	:param binder:
	:type binder: Handle_Transfer_Binder &
	:param start:
	:type start: Handle_Standard_Transient &
	:param level:
	:type level: int
	:param mode:
	:type mode: int
	:rtype: None
") StartTrace;
		void StartTrace (const Handle_Transfer_Binder & binder,const Handle_Standard_Transient & start,const Standard_Integer level,const Standard_Integer mode);
		%feature("compactdefaultargs") PrintTrace;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: void
") PrintTrace;
		virtual void PrintTrace (const Handle_Standard_Transient & start,const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") IsLooping;
		%feature("autodoc", "	:param alevel:
	:type alevel: int
	:rtype: bool
") IsLooping;
		Standard_Boolean IsLooping (const Standard_Integer alevel);
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	:param withstart: default value is Standard_False
	:type withstart: bool
	:rtype: Transfer_IteratorOfProcessForTransient
") RootResult;
		Transfer_IteratorOfProcessForTransient RootResult (const Standard_Boolean withstart = Standard_False);
		%feature("compactdefaultargs") CompleteResult;
		%feature("autodoc", "	:param withstart: default value is Standard_False
	:type withstart: bool
	:rtype: Transfer_IteratorOfProcessForTransient
") CompleteResult;
		Transfer_IteratorOfProcessForTransient CompleteResult (const Standard_Boolean withstart = Standard_False);
		%feature("compactdefaultargs") AbnormalResult;
		%feature("autodoc", "	:rtype: Transfer_IteratorOfProcessForTransient
") AbnormalResult;
		Transfer_IteratorOfProcessForTransient AbnormalResult ();
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "	:param erronly:
	:type erronly: bool
	:rtype: Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList (const Standard_Boolean erronly);
		%feature("compactdefaultargs") ResultOne;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param level:
	:type level: int
	:param withstart: default value is Standard_False
	:type withstart: bool
	:rtype: Transfer_IteratorOfProcessForTransient
") ResultOne;
		Transfer_IteratorOfProcessForTransient ResultOne (const Handle_Standard_Transient & start,const Standard_Integer level,const Standard_Boolean withstart = Standard_False);
		%feature("compactdefaultargs") CheckListOne;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param level:
	:type level: int
	:param erronly:
	:type erronly: bool
	:rtype: Interface_CheckIterator
") CheckListOne;
		Interface_CheckIterator CheckListOne (const Handle_Standard_Transient & start,const Standard_Integer level,const Standard_Boolean erronly);
		%feature("compactdefaultargs") IsCheckListEmpty;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param level:
	:type level: int
	:param erronly:
	:type erronly: bool
	:rtype: bool
") IsCheckListEmpty;
		Standard_Boolean IsCheckListEmpty (const Handle_Standard_Transient & start,const Standard_Integer level,const Standard_Boolean erronly);
		%feature("compactdefaultargs") RemoveResult;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param level:
	:type level: int
	:param compute: default value is Standard_True
	:type compute: bool
	:rtype: None
") RemoveResult;
		void RemoveResult (const Handle_Standard_Transient & start,const Standard_Integer level,const Standard_Boolean compute = Standard_True);
		%feature("compactdefaultargs") CheckNum;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: int
") CheckNum;
		virtual Standard_Integer CheckNum (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "	:param theProgress:
	:type theProgress: Handle_Message_ProgressIndicator &
	:rtype: None
") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & theProgress);
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "	:rtype: Handle_Message_ProgressIndicator
") GetProgress;
		Handle_Message_ProgressIndicator GetProgress ();
};


%make_alias(Transfer_ProcessForTransient)

%extend Transfer_ProcessForTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_ResultFromModel;
class Transfer_ResultFromModel : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Transfer_ResultFromModel;
		%feature("autodoc", "	* Creates a ResultFromModel, empty

	:rtype: None
") Transfer_ResultFromModel;
		 Transfer_ResultFromModel ();
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "	* Sets starting Model

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: None
") SetModel;
		void SetModel (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") SetFileName;
		%feature("autodoc", "	* Sets starting File Name

	:param filename:
	:type filename: char *
	:rtype: None
") SetFileName;
		void SetFileName (const char * filename);
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns starting Model (null if not set)

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "	* Returns starting File Name (empty if not set)

	:rtype: char *
") FileName;
		const char * FileName ();
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "	* Fills from a TransientProcess, with the result attached to a starting entity. Considers its Model if it is set. This action produces a structured set of ResultFromTransient, considering scopes, starting by that of <ent>. If <ent> has no recorded result, it remains empty Returns True if a result is recorded, False else

	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") Fill;
		Standard_Boolean Fill (const Handle_Transfer_TransientProcess & TP,const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Strip;
		%feature("autodoc", "	* Clears some data attached to binders used by TransientProcess, which become useless once the transfer has been done, by calling Strip on its ResultFromTransient //! mode = 0 : minimum, clears data remaining from TransferProcess mode = 10 : just keeps file name, label, check status ..., and MainResult but only the result (Binder) mode = 11 : also clears MainResult (status and names remain)

	:param mode:
	:type mode: int
	:rtype: None
") Strip;
		void Strip (const Standard_Integer mode);
		%feature("compactdefaultargs") FillBack;
		%feature("autodoc", "	* Fills back a TransientProcess from the structured set of binders. Also sets the Model.

	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: None
") FillBack;
		void FillBack (const Handle_Transfer_TransientProcess & TP);
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	* Returns True if a Result is recorded

	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("compactdefaultargs") MainResult;
		%feature("autodoc", "	* Returns the main recorded ResultFromTransient, or a null

	:rtype: Handle_Transfer_ResultFromTransient
") MainResult;
		Handle_Transfer_ResultFromTransient MainResult ();
		%feature("compactdefaultargs") SetMainResult;
		%feature("autodoc", "	* Sets a new value for the main recorded ResultFromTransient

	:param amain:
	:type amain: Handle_Transfer_ResultFromTransient &
	:rtype: None
") SetMainResult;
		void SetMainResult (const Handle_Transfer_ResultFromTransient & amain);
		%feature("compactdefaultargs") MainLabel;
		%feature("autodoc", "	* Returns the label in starting model attached to main entity (updated by Fill or SetMainResult, if Model is known)

	:rtype: char *
") MainLabel;
		const char * MainLabel ();
		%feature("compactdefaultargs") MainNumber;
		%feature("autodoc", "	* Returns the label in starting model attached to main entity

	:rtype: int
") MainNumber;
		Standard_Integer MainNumber ();
		%feature("compactdefaultargs") ResultFromKey;
		%feature("autodoc", "	* Searches for a key (starting entity) and returns its result Returns a null handle if not found

	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: Handle_Transfer_ResultFromTransient
") ResultFromKey;
		Handle_Transfer_ResultFromTransient ResultFromKey (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "	* Internal method which returns the list of ResultFromTransient, according level (2:complete; 1:sub-level 1; 0:main only)

	:param level:
	:type level: int
	:rtype: Handle_TColStd_HSequenceOfTransient
") Results;
		Handle_TColStd_HSequenceOfTransient Results (const Standard_Integer level);
		%feature("compactdefaultargs") TransferredList;
		%feature("autodoc", "	* Returns the list of recorded starting entities, ending by the root. Entities with check but no transfer result are ignored <level> = 2 (D), considers the complete list <level> = 1 considers the main result plus immediate subs <level> = 0 just the main result

	:param level: default value is 2
	:type level: int
	:rtype: Handle_TColStd_HSequenceOfTransient
") TransferredList;
		Handle_TColStd_HSequenceOfTransient TransferredList (const Standard_Integer level = 2);
		%feature("compactdefaultargs") CheckedList;
		%feature("autodoc", "	* Returns the list of starting entities to which a check status is attached. <check> = -2 , all entities whatever the check (see result) <check> = -1 , entities with no fail (warning allowed) <check> = 0 , entities with no check at all <check> = 1 , entities with warning but no fail <check> = 2 , entities with fail <result> : if True, only entities with an attached result Remark : result True and check=0 will give an empty list

	:param check:
	:type check: Interface_CheckStatus
	:param result:
	:type result: bool
	:rtype: Handle_TColStd_HSequenceOfTransient
") CheckedList;
		Handle_TColStd_HSequenceOfTransient CheckedList (const Interface_CheckStatus check,const Standard_Boolean result);
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "	* Returns the check-list of this set of results <erronly> true : only fails are considered <level> = 0 : considers only main binder <level> = 1 : considers main binder plus immediate subs <level> = 2 (D) : considers all checks

	:param erronly:
	:type erronly: bool
	:param level: default value is 2
	:type level: int
	:rtype: Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList (const Standard_Boolean erronly,const Standard_Integer level = 2);
		%feature("compactdefaultargs") CheckStatus;
		%feature("autodoc", "	* Returns the check status with corresponds to the content of this ResultFromModel; considers all levels of transfer (worst status). Returns CheckAny if not yet computed Reads it from recorded status if already computed, else recomputes one

	:rtype: Interface_CheckStatus
") CheckStatus;
		Interface_CheckStatus CheckStatus ();
		%feature("compactdefaultargs") ComputeCheckStatus;
		%feature("autodoc", "	* Computes and records check status (see CheckStatus) Does not computes it if already done and <enforce> False

	:param enforce:
	:type enforce: bool
	:rtype: Interface_CheckStatus
") ComputeCheckStatus;
		Interface_CheckStatus ComputeCheckStatus (const Standard_Boolean enforce);
};


%make_alias(Transfer_ResultFromModel)

%extend Transfer_ResultFromModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_ResultFromTransient;
class Transfer_ResultFromTransient : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Transfer_ResultFromTransient;
		%feature("autodoc", "	* Creates a ResultFromTransient, empty

	:rtype: None
") Transfer_ResultFromTransient;
		 Transfer_ResultFromTransient ();
		%feature("compactdefaultargs") SetStart;
		%feature("autodoc", "	* Sets starting entity

	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: None
") SetStart;
		void SetStart (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") SetBinder;
		%feature("autodoc", "	* Sets Binder (for result plus individual check)

	:param binder:
	:type binder: Handle_Transfer_Binder &
	:rtype: None
") SetBinder;
		void SetBinder (const Handle_Transfer_Binder & binder);
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "	* Returns the starting entity

	:rtype: Handle_Standard_Transient
") Start;
		Handle_Standard_Transient Start ();
		%feature("compactdefaultargs") Binder;
		%feature("autodoc", "	* Returns the binder

	:rtype: Handle_Transfer_Binder
") Binder;
		Handle_Transfer_Binder Binder ();
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	* Returns True if a result is recorded

	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	* Returns the check (or an empty one if no binder)

	:rtype: Handle_Interface_Check
") Check;
		const Handle_Interface_Check Check ();
		%feature("compactdefaultargs") CheckStatus;
		%feature("autodoc", "	* Returns the check status

	:rtype: Interface_CheckStatus
") CheckStatus;
		Interface_CheckStatus CheckStatus ();
		%feature("compactdefaultargs") ClearSubs;
		%feature("autodoc", "	* Clears the list of (immediate) sub-results

	:rtype: None
") ClearSubs;
		void ClearSubs ();
		%feature("compactdefaultargs") AddSubResult;
		%feature("autodoc", "	* Adds a sub-result

	:param sub:
	:type sub: Handle_Transfer_ResultFromTransient &
	:rtype: None
") AddSubResult;
		void AddSubResult (const Handle_Transfer_ResultFromTransient & sub);
		%feature("compactdefaultargs") NbSubResults;
		%feature("autodoc", "	* Returns the count of recorded sub-results

	:rtype: int
") NbSubResults;
		Standard_Integer NbSubResults ();
		%feature("compactdefaultargs") SubResult;
		%feature("autodoc", "	* Returns a sub-result, given its rank

	:param num:
	:type num: int
	:rtype: Handle_Transfer_ResultFromTransient
") SubResult;
		Handle_Transfer_ResultFromTransient SubResult (const Standard_Integer num);
		%feature("compactdefaultargs") ResultFromKey;
		%feature("autodoc", "	* Returns the ResultFromTransient attached to a given starting entity (the key). Returns a null handle if not found

	:param key:
	:type key: Handle_Standard_Transient &
	:rtype: Handle_Transfer_ResultFromTransient
") ResultFromKey;
		Handle_Transfer_ResultFromTransient ResultFromKey (const Handle_Standard_Transient & key);
		%feature("compactdefaultargs") FillMap;
		%feature("autodoc", "	* This method is used by ResultFromModel to collate the list of ResultFromTransient, avoiding duplications with a map Remark : <self> is already in the map and has not to be bound

	:param map:
	:type map: TColStd_IndexedMapOfTransient &
	:rtype: None
") FillMap;
		void FillMap (TColStd_IndexedMapOfTransient & map);
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "	* Fills from a TransientProcess, with the starting entity which must have been set before. It works with scopes, calls Fill on each of its sub-results

	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: None
") Fill;
		void Fill (const Handle_Transfer_TransientProcess & TP);
		%feature("compactdefaultargs") Strip;
		%feature("autodoc", "	* Clears some data attached to binders used by TransientProcess, which become useless once the transfer has been done : the list of sub-scoped binders, which is now recorded as sub-results

	:rtype: None
") Strip;
		void Strip ();
		%feature("compactdefaultargs") FillBack;
		%feature("autodoc", "	* Fills back a TransientProcess with definition of a ResultFromTransient, respectfully to its structuration in scopes

	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: None
") FillBack;
		void FillBack (const Handle_Transfer_TransientProcess & TP);
};


%make_alias(Transfer_ResultFromTransient)

%extend Transfer_ResultFromTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_SequenceNodeOfSequenceOfBinder;
class Transfer_SequenceNodeOfSequenceOfBinder : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Transfer_SequenceNodeOfSequenceOfBinder;
		%feature("autodoc", "	:param I:
	:type I: Handle_Transfer_Binder &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Transfer_SequenceNodeOfSequenceOfBinder;
		 Transfer_SequenceNodeOfSequenceOfBinder (const Handle_Transfer_Binder & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Transfer_Binder
") Value;
		Handle_Transfer_Binder Value ();
};


%make_alias(Transfer_SequenceNodeOfSequenceOfBinder)

%extend Transfer_SequenceNodeOfSequenceOfBinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_SequenceNodeOfSequenceOfFinder;
class Transfer_SequenceNodeOfSequenceOfFinder : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Transfer_SequenceNodeOfSequenceOfFinder;
		%feature("autodoc", "	:param I:
	:type I: Handle_Transfer_Finder &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Transfer_SequenceNodeOfSequenceOfFinder;
		 Transfer_SequenceNodeOfSequenceOfFinder (const Handle_Transfer_Finder & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Transfer_Finder
") Value;
		Handle_Transfer_Finder Value ();
};


%make_alias(Transfer_SequenceNodeOfSequenceOfFinder)

%extend Transfer_SequenceNodeOfSequenceOfFinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_SequenceOfBinder;
class Transfer_SequenceOfBinder : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Transfer_SequenceOfBinder;
		%feature("autodoc", "	:rtype: None
") Transfer_SequenceOfBinder;
		 Transfer_SequenceOfBinder ();
		%feature("compactdefaultargs") Transfer_SequenceOfBinder;
		%feature("autodoc", "	:param Other:
	:type Other: Transfer_SequenceOfBinder &
	:rtype: None
") Transfer_SequenceOfBinder;
		 Transfer_SequenceOfBinder (const Transfer_SequenceOfBinder & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Transfer_SequenceOfBinder &
	:rtype: Transfer_SequenceOfBinder
") Assign;
		const Transfer_SequenceOfBinder & Assign (const Transfer_SequenceOfBinder & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Transfer_SequenceOfBinder &
	:rtype: Transfer_SequenceOfBinder
") operator =;
		const Transfer_SequenceOfBinder & operator = (const Transfer_SequenceOfBinder & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Transfer_Binder &
	:rtype: None
") Append;
		void Append (const Handle_Transfer_Binder & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Transfer_SequenceOfBinder &
	:rtype: None
") Append;
		void Append (Transfer_SequenceOfBinder & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Transfer_Binder &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Transfer_Binder & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Transfer_SequenceOfBinder &
	:rtype: None
") Prepend;
		void Prepend (Transfer_SequenceOfBinder & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Transfer_Binder &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Transfer_Binder & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Transfer_SequenceOfBinder &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Transfer_SequenceOfBinder & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Transfer_Binder &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Transfer_Binder & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Transfer_SequenceOfBinder &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Transfer_SequenceOfBinder & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Transfer_Binder
") First;
		Handle_Transfer_Binder First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Transfer_Binder
") Last;
		Handle_Transfer_Binder Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Transfer_SequenceOfBinder &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Transfer_SequenceOfBinder & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Transfer_Binder
") Value;
		Handle_Transfer_Binder Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Transfer_Binder &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Transfer_Binder & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Transfer_Binder
") ChangeValue;
		Handle_Transfer_Binder ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Transfer_SequenceOfBinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_SequenceOfFinder;
class Transfer_SequenceOfFinder : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Transfer_SequenceOfFinder;
		%feature("autodoc", "	:rtype: None
") Transfer_SequenceOfFinder;
		 Transfer_SequenceOfFinder ();
		%feature("compactdefaultargs") Transfer_SequenceOfFinder;
		%feature("autodoc", "	:param Other:
	:type Other: Transfer_SequenceOfFinder &
	:rtype: None
") Transfer_SequenceOfFinder;
		 Transfer_SequenceOfFinder (const Transfer_SequenceOfFinder & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Transfer_SequenceOfFinder &
	:rtype: Transfer_SequenceOfFinder
") Assign;
		const Transfer_SequenceOfFinder & Assign (const Transfer_SequenceOfFinder & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Transfer_SequenceOfFinder &
	:rtype: Transfer_SequenceOfFinder
") operator =;
		const Transfer_SequenceOfFinder & operator = (const Transfer_SequenceOfFinder & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Transfer_Finder &
	:rtype: None
") Append;
		void Append (const Handle_Transfer_Finder & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Transfer_SequenceOfFinder &
	:rtype: None
") Append;
		void Append (Transfer_SequenceOfFinder & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Transfer_Finder &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Transfer_Finder & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Transfer_SequenceOfFinder &
	:rtype: None
") Prepend;
		void Prepend (Transfer_SequenceOfFinder & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Transfer_Finder &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Transfer_Finder & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Transfer_SequenceOfFinder &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Transfer_SequenceOfFinder & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Transfer_Finder &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Transfer_Finder & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Transfer_SequenceOfFinder &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Transfer_SequenceOfFinder & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Transfer_Finder
") First;
		Handle_Transfer_Finder First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Transfer_Finder
") Last;
		Handle_Transfer_Finder Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Transfer_SequenceOfFinder &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Transfer_SequenceOfFinder & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Transfer_Finder
") Value;
		Handle_Transfer_Finder Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Transfer_Finder &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Transfer_Finder & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Transfer_Finder
") ChangeValue;
		Handle_Transfer_Finder ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Transfer_SequenceOfFinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_TransferDispatch;
class Transfer_TransferDispatch : public Interface_CopyTool {
	public:
		%feature("compactdefaultargs") Transfer_TransferDispatch;
		%feature("autodoc", "	* Creates a TransferDispatch from a Model. Works with a General Service Library, given as an Argument A TransferDispatch is created as a CopyTool in which the Control is set to TransientProcess

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param lib:
	:type lib: Interface_GeneralLib &
	:rtype: None
") Transfer_TransferDispatch;
		 Transfer_TransferDispatch (const Handle_Interface_InterfaceModel & amodel,const Interface_GeneralLib & lib);
		%feature("compactdefaultargs") Transfer_TransferDispatch;
		%feature("autodoc", "	* Same as above, but Library is defined through a Protocol

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:rtype: None
") Transfer_TransferDispatch;
		 Transfer_TransferDispatch (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_Protocol & protocol);
		%feature("compactdefaultargs") Transfer_TransferDispatch;
		%feature("autodoc", "	* Same as above, but works with the Active Protocol

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:rtype: None
") Transfer_TransferDispatch;
		 Transfer_TransferDispatch (const Handle_Interface_InterfaceModel & amodel);
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "	* Returns the content of Control Object, as a TransientProcess

	:rtype: Handle_Transfer_TransientProcess
") TransientProcess;
		Handle_Transfer_TransientProcess TransientProcess ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Copies an Entity by calling the method Transferring from the TransferProcess. If this called produces a Null Binder, then the standard, inherited Copy is called

	:param entfrom:
	:type entfrom: Handle_Standard_Transient &
	:param entto:
	:type entto: Handle_Standard_Transient &
	:param mapped:
	:type mapped: bool
	:param errstat:
	:type errstat: bool
	:rtype: bool
") Copy;
		virtual Standard_Boolean Copy (const Handle_Standard_Transient & entfrom,Handle_Standard_Transient & entto,const Standard_Boolean mapped,const Standard_Boolean errstat);
};


%extend Transfer_TransferDispatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_TransferInput;
class Transfer_TransferInput {
	public:
		%feature("compactdefaultargs") Transfer_TransferInput;
		%feature("autodoc", "	* Creates a TransferInput ready to use

	:rtype: None
") Transfer_TransferInput;
		 Transfer_TransferInput ();
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "	* Takes the transient items stored in a TransferIterator

	:param list:
	:type list: Transfer_TransferIterator &
	:rtype: Interface_EntityIterator
") Entities;
		Interface_EntityIterator Entities (Transfer_TransferIterator & list);
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "	* Fills an InterfaceModel with the Complete Result of a Transfer stored in a TransientProcess (Starting Objects are Transient) The complete result is exactly added to the model

	:param proc:
	:type proc: Handle_Transfer_TransientProcess &
	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:rtype: None
") FillModel;
		void FillModel (const Handle_Transfer_TransientProcess & proc,const Handle_Interface_InterfaceModel & amodel);
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "	* Fills an InterfaceModel with results of the Transfer recorded in a TransientProcess (Starting Objects are Transient) : Root Result if <roots> is True (Default), Complete Result else The entities added to the model are determined from the result by by adding the referenced entities

	:param proc:
	:type proc: Handle_Transfer_TransientProcess &
	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param proto:
	:type proto: Handle_Interface_Protocol &
	:param roots: default value is Standard_True
	:type roots: bool
	:rtype: None
") FillModel;
		void FillModel (const Handle_Transfer_TransientProcess & proc,const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_Protocol & proto,const Standard_Boolean roots = Standard_True);
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "	* Fills an InterfaceModel with the Complete Result of a Transfer stored in a TransientProcess (Starting Objects are Transient) The complete result is exactly added to the model

	:param proc:
	:type proc: Handle_Transfer_FinderProcess &
	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:rtype: None
") FillModel;
		void FillModel (const Handle_Transfer_FinderProcess & proc,const Handle_Interface_InterfaceModel & amodel);
		%feature("compactdefaultargs") FillModel;
		%feature("autodoc", "	* Fills an InterfaceModel with results of the Transfer recorded in a TransientProcess (Starting Objects are Transient) : Root Result if <roots> is True (Default), Complete Result else The entities added to the model are determined from the result by by adding the referenced entities

	:param proc:
	:type proc: Handle_Transfer_FinderProcess &
	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param proto:
	:type proto: Handle_Interface_Protocol &
	:param roots: default value is Standard_True
	:type roots: bool
	:rtype: None
") FillModel;
		void FillModel (const Handle_Transfer_FinderProcess & proc,const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_Protocol & proto,const Standard_Boolean roots = Standard_True);
};


%extend Transfer_TransferInput {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_TransferIterator;
class Transfer_TransferIterator {
	public:
		%feature("compactdefaultargs") Transfer_TransferIterator;
		%feature("autodoc", "	* Creates an empty Iterator

	:rtype: None
") Transfer_TransferIterator;
		 Transfer_TransferIterator ();
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "	* Adds a Binder to the iteration list (construction)

	:param atr:
	:type atr: Handle_Transfer_Binder &
	:rtype: None
") AddItem;
		void AddItem (const Handle_Transfer_Binder & atr);
		%feature("compactdefaultargs") SelectBinder;
		%feature("autodoc", "	* Selects Items on the Type of Binder : keep only Binders which are of a given Type (if keep is True) or reject only them (if keep is False)

	:param atype:
	:type atype: Handle_Standard_Type &
	:param keep:
	:type keep: bool
	:rtype: None
") SelectBinder;
		void SelectBinder (const Handle_Standard_Type & atype,const Standard_Boolean keep);
		%feature("compactdefaultargs") SelectResult;
		%feature("autodoc", "	* Selects Items on the Type of Result. Considers only Unique Results. Considers Dynamic Type for Transient Result, Static Type (the one given to define the Binder) else. //! Results which are of a given Type (if keep is True) or reject only them (if keep is False)

	:param atype:
	:type atype: Handle_Standard_Type &
	:param keep:
	:type keep: bool
	:rtype: None
") SelectResult;
		void SelectResult (const Handle_Standard_Type & atype,const Standard_Boolean keep);
		%feature("compactdefaultargs") SelectUnique;
		%feature("autodoc", "	* Select Items according Unicity : keep only Unique Results (if keep is True) or keep only Multiple Results (if keep is False)

	:param keep:
	:type keep: bool
	:rtype: None
") SelectUnique;
		void SelectUnique (const Standard_Boolean keep);
		%feature("compactdefaultargs") SelectItem;
		%feature("autodoc", "	* Selects/Unselect (according to <keep> an item designated by its rank <num> in the list Used by sub-classes which have specific criteria

	:param num:
	:type num: int
	:param keep:
	:type keep: bool
	:rtype: None
") SelectItem;
		void SelectItem (const Standard_Integer num,const Standard_Boolean keep);
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "	* Returns count of Binders to be iterated

	:rtype: int
") Number;
		Standard_Integer Number ();
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "	* Clears Iteration in progress, to allow it to be restarted

	:rtype: None
") Start;
		void Start ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True if there are other Items to iterate

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Sets Iteration to the next Item

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current Binder

	:rtype: Handle_Transfer_Binder
") Value;
		Handle_Transfer_Binder Value ();
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	* Returns True if current Item brings a Result, Transient (Handle) or not or Multiple. That is to say, if it corresponds to a normally acheived Transfer, Transient Result is read by specific TransientResult below. Other kind of Result must be read specifically from its Binder

	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
		%feature("compactdefaultargs") HasUniqueResult;
		%feature("autodoc", "	* Returns True if Current Item has a Unique Result

	:rtype: bool
") HasUniqueResult;
		Standard_Boolean HasUniqueResult ();
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "	* Returns the Type of the Result of the current Item, if Unique. If No Unique Result (Error Transfert or Multiple Result), returns a Null Handle The Type is : the Dynamic Type for a Transient Result, the Type defined by the Binder Class else

	:rtype: Handle_Standard_Type
") ResultType;
		Handle_Standard_Type ResultType ();
		%feature("compactdefaultargs") HasTransientResult;
		%feature("autodoc", "	* Returns True if the current Item has a Transient Unique Result (if yes, use TransientResult to get it)

	:rtype: bool
") HasTransientResult;
		Standard_Boolean HasTransientResult ();
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "	* Returns the Transient Result of the current Item if there is (else, returns a null Handle) Supposes that Binding is done by a SimpleBinderOfTransient

	:rtype: Handle_Standard_Transient
") TransientResult;
		Handle_Standard_Transient TransientResult ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns Execution Status of current Binder Normal transfer corresponds to StatusDone

	:rtype: Transfer_StatusExec
") Status;
		Transfer_StatusExec Status ();
		%feature("compactdefaultargs") HasFails;
		%feature("autodoc", "	* Returns True if Fail Messages are recorded with the current Binder. They can then be read through Check (see below)

	:rtype: bool
") HasFails;
		Standard_Boolean HasFails ();
		%feature("compactdefaultargs") HasWarnings;
		%feature("autodoc", "	* Returns True if Warning Messages are recorded with the current Binder. They can then be read through Check (see below)

	:rtype: bool
") HasWarnings;
		Standard_Boolean HasWarnings ();
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	* Returns Check associated to current Binder (in case of error, it brings Fail messages) (in case of warnings, it brings Warning messages)

	:rtype: Handle_Interface_Check
") Check;
		const Handle_Interface_Check Check ();
};


%extend Transfer_TransferIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_TransferMapOfProcessForFinder;
class Transfer_TransferMapOfProcessForFinder : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") Transfer_TransferMapOfProcessForFinder;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") Transfer_TransferMapOfProcessForFinder;
		 Transfer_TransferMapOfProcessForFinder (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Transfer_TransferMapOfProcessForFinder &
	:rtype: Transfer_TransferMapOfProcessForFinder
") Assign;
		Transfer_TransferMapOfProcessForFinder & Assign (const Transfer_TransferMapOfProcessForFinder & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Transfer_TransferMapOfProcessForFinder &
	:rtype: Transfer_TransferMapOfProcessForFinder
") operator =;
		Transfer_TransferMapOfProcessForFinder & operator = (const Transfer_TransferMapOfProcessForFinder & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: Handle_Transfer_Finder &
	:param I:
	:type I: Handle_Transfer_Binder &
	:rtype: int
") Add;
		Standard_Integer Add (const Handle_Transfer_Finder & K,const Handle_Transfer_Binder & I);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: Handle_Transfer_Finder &
	:param T:
	:type T: Handle_Transfer_Binder &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const Handle_Transfer_Finder & K,const Handle_Transfer_Binder & T);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: Handle_Transfer_Finder &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Transfer_Finder & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Handle_Transfer_Finder
") FindKey;
		Handle_Transfer_Finder FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Handle_Transfer_Binder
") FindFromIndex;
		Handle_Transfer_Binder FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Handle_Transfer_Binder
") ChangeFromIndex;
		Handle_Transfer_Binder ChangeFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: Handle_Transfer_Finder &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const Handle_Transfer_Finder & K);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param K:
	:type K: Handle_Transfer_Finder &
	:rtype: Handle_Transfer_Binder
") FindFromKey;
		Handle_Transfer_Binder FindFromKey (const Handle_Transfer_Finder & K);
		%feature("compactdefaultargs") ChangeFromKey;
		%feature("autodoc", "	:param K:
	:type K: Handle_Transfer_Finder &
	:rtype: Handle_Transfer_Binder
") ChangeFromKey;
		Handle_Transfer_Binder ChangeFromKey (const Handle_Transfer_Finder & K);
		%feature("compactdefaultargs") FindFromKey1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Transfer_Finder &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const Handle_Transfer_Finder & K);
		%feature("compactdefaultargs") ChangeFromKey1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Transfer_Finder &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const Handle_Transfer_Finder & K);
};


%extend Transfer_TransferMapOfProcessForFinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_TransferMapOfProcessForTransient;
class Transfer_TransferMapOfProcessForTransient : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") Transfer_TransferMapOfProcessForTransient;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") Transfer_TransferMapOfProcessForTransient;
		 Transfer_TransferMapOfProcessForTransient (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Transfer_TransferMapOfProcessForTransient &
	:rtype: Transfer_TransferMapOfProcessForTransient
") Assign;
		Transfer_TransferMapOfProcessForTransient & Assign (const Transfer_TransferMapOfProcessForTransient & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Transfer_TransferMapOfProcessForTransient &
	:rtype: Transfer_TransferMapOfProcessForTransient
") operator =;
		Transfer_TransferMapOfProcessForTransient & operator = (const Transfer_TransferMapOfProcessForTransient & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:param I:
	:type I: Handle_Transfer_Binder &
	:rtype: int
") Add;
		Standard_Integer Add (const Handle_Standard_Transient & K,const Handle_Transfer_Binder & I);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: Handle_Standard_Transient &
	:param T:
	:type T: Handle_Transfer_Binder &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const Handle_Standard_Transient & K,const Handle_Transfer_Binder & T);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Handle_Standard_Transient
") FindKey;
		Handle_Standard_Transient FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Handle_Transfer_Binder
") FindFromIndex;
		Handle_Transfer_Binder FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Handle_Transfer_Binder
") ChangeFromIndex;
		Handle_Transfer_Binder ChangeFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Handle_Transfer_Binder
") FindFromKey;
		Handle_Transfer_Binder FindFromKey (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") ChangeFromKey;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Handle_Transfer_Binder
") ChangeFromKey;
		Handle_Transfer_Binder ChangeFromKey (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") FindFromKey1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const Handle_Standard_Transient & K);
		%feature("compactdefaultargs") ChangeFromKey1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const Handle_Standard_Transient & K);
};


%extend Transfer_TransferMapOfProcessForTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_TransferOutput;
class Transfer_TransferOutput {
	public:
		%feature("compactdefaultargs") Transfer_TransferOutput;
		%feature("autodoc", "	* Creates a TransferOutput ready to use, with a TransientProcess

	:param actor:
	:type actor: Handle_Transfer_ActorOfTransientProcess &
	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:rtype: None
") Transfer_TransferOutput;
		 Transfer_TransferOutput (const Handle_Transfer_ActorOfTransientProcess & actor,const Handle_Interface_InterfaceModel & amodel);
		%feature("compactdefaultargs") Transfer_TransferOutput;
		%feature("autodoc", "	* Creates a TransferOutput from an already existing TransientProcess, and a Model Returns (by Reference, hence can be changed) the Mode for Scope Management. False (D) means Scope is ignored. True means that each individual Transfer (direct or through TransferRoots) is regarded as one Scope

	:param proc:
	:type proc: Handle_Transfer_TransientProcess &
	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:rtype: None
") Transfer_TransferOutput;
		 Transfer_TransferOutput (const Handle_Transfer_TransientProcess & proc,const Handle_Interface_InterfaceModel & amodel);
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the Starting Model

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "	* Returns the TransientProcess used to work

	:rtype: Handle_Transfer_TransientProcess
") TransientProcess;
		Handle_Transfer_TransientProcess TransientProcess ();
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "	* Transfer checks that all taken Entities come from the same Model, then calls Transfer from TransientProcess

	:param obj:
	:type obj: Handle_Standard_Transient &
	:rtype: None
") Transfer;
		void Transfer (const Handle_Standard_Transient & obj);
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "	* Runs transfer on the roots of the Interface Model The Roots are computed with a ShareFlags created from a Protocol given as Argument

	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:rtype: None
") TransferRoots;
		void TransferRoots (const Handle_Interface_Protocol & protocol);
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "	* Runs transfer on the roots defined by a Graph of dependences (which detains also a Model and its Entities) Roots are computed with a ShareFlags created from the Graph

	:param G:
	:type G: Interface_Graph &
	:rtype: None
") TransferRoots;
		void TransferRoots (const Interface_Graph & G);
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "	* Runs transfer on the roots of the Interface Model Remark : the Roots are computed with a ShareFlags created from the Active Protocol

	:rtype: None
") TransferRoots;
		void TransferRoots ();
		%feature("compactdefaultargs") ListForStatus;
		%feature("autodoc", "	* Returns the list of Starting Entities with these criteria : - <normal> False, gives the entities bound with ABNORMAL STATUS (e.g. : Fail recorded, Exception raised during Transfer) - <normal> True, gives Entities with or without a Result, but with no Fail, no Exception (Warnings are not counted) - <roots> False, considers all entities recorded (either for Result, or for at least one Fail or Warning message) - <roots> True (Default), considers only roots of Transfer (the Entities recorded at highest level) This method is based on AbnormalResult from TransferProcess

	:param normal:
	:type normal: bool
	:param roots: default value is Standard_True
	:type roots: bool
	:rtype: Interface_EntityIterator
") ListForStatus;
		Interface_EntityIterator ListForStatus (const Standard_Boolean normal,const Standard_Boolean roots = Standard_True);
		%feature("compactdefaultargs") ModelForStatus;
		%feature("autodoc", "	* Fills a Model with the list determined by ListForStatus This model starts from scratch (made by NewEmptyModel from the current Model), then is filled by AddWithRefs //! Useful to get separately from a transfer, the entities which have caused problem, in order to furtherly analyse them (with normal = False), or the 'good' entities, to obtain a data set 'which works well' (with normal = True)

	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:param normal:
	:type normal: bool
	:param roots: default value is Standard_True
	:type roots: bool
	:rtype: Handle_Interface_InterfaceModel
") ModelForStatus;
		Handle_Interface_InterfaceModel ModelForStatus (const Handle_Interface_Protocol & protocol,const Standard_Boolean normal,const Standard_Boolean roots = Standard_True);
};


%extend Transfer_TransferOutput {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_ActorOfFinderProcess;
class Transfer_ActorOfFinderProcess : public Transfer_ActorOfProcessForFinder {
	public:
		%feature("compactdefaultargs") Transfer_ActorOfFinderProcess;
		%feature("autodoc", "	:rtype: None
") Transfer_ActorOfFinderProcess;
		 Transfer_ActorOfFinderProcess ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetModeTrans() {
                return (Standard_Integer) $self->ModeTrans();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetModeTrans(Standard_Integer value ) {
                $self->ModeTrans()=value;
                }
            };
            		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param TP:
	:type TP: Handle_Transfer_ProcessForFinder &
	:rtype: Handle_Transfer_Binder
") Transferring;
		virtual Handle_Transfer_Binder Transferring (const Handle_Transfer_Finder & start,const Handle_Transfer_ProcessForFinder & TP);
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param TP:
	:type TP: Handle_Transfer_FinderProcess &
	:rtype: Handle_Transfer_Binder
") Transfer;
		virtual Handle_Transfer_Binder Transfer (const Handle_Transfer_Finder & start,const Handle_Transfer_FinderProcess & TP);
		%feature("compactdefaultargs") TransferTransient;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param TP:
	:type TP: Handle_Transfer_FinderProcess &
	:rtype: Handle_Standard_Transient
") TransferTransient;
		virtual Handle_Standard_Transient TransferTransient (const Handle_Standard_Transient & start,const Handle_Transfer_FinderProcess & TP);
};


%make_alias(Transfer_ActorOfFinderProcess)

%extend Transfer_ActorOfFinderProcess {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_ActorOfTransientProcess;
class Transfer_ActorOfTransientProcess : public Transfer_ActorOfProcessForTransient {
	public:
		%feature("compactdefaultargs") Transfer_ActorOfTransientProcess;
		%feature("autodoc", "	:rtype: None
") Transfer_ActorOfTransientProcess;
		 Transfer_ActorOfTransientProcess ();
		%feature("compactdefaultargs") Transferring;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param TP:
	:type TP: Handle_Transfer_ProcessForTransient &
	:rtype: Handle_Transfer_Binder
") Transferring;
		virtual Handle_Transfer_Binder Transferring (const Handle_Standard_Transient & start,const Handle_Transfer_ProcessForTransient & TP);
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: Handle_Transfer_Binder
") Transfer;
		virtual Handle_Transfer_Binder Transfer (const Handle_Standard_Transient & start,const Handle_Transfer_TransientProcess & TP);
		%feature("compactdefaultargs") TransferTransient;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: Handle_Standard_Transient
") TransferTransient;
		virtual Handle_Standard_Transient TransferTransient (const Handle_Standard_Transient & start,const Handle_Transfer_TransientProcess & TP);
};


%make_alias(Transfer_ActorOfTransientProcess)

%extend Transfer_ActorOfTransientProcess {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_FinderProcess;
class Transfer_FinderProcess : public Transfer_ProcessForFinder {
	public:
		%feature("compactdefaultargs") Transfer_FinderProcess;
		%feature("autodoc", "	* Sets FinderProcess at initial state, with an initial size

	:param nb: default value is 10000
	:type nb: int
	:rtype: None
") Transfer_FinderProcess;
		 Transfer_FinderProcess (const Standard_Integer nb = 10000);
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "	* Sets an InterfaceModel, which can be used during transfer for instance if a context must be managed, it is in the Model

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: None
") SetModel;
		void SetModel (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the Model which can be used for context

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") NextMappedWithAttribute;
		%feature("autodoc", "	* In the list of mapped items (between 1 and NbMapped), searches for the first mapped item which follows <num0> (not included) and which has an attribute named <name> The considered Attributes are those brought by Finders,i.e. by Input data. While NextItemWithAttribute works on Result data (Binders) //! Hence, allows such an iteration //! for (num = FP->NextMappedWithAttribute(name,0); num > 0; num = FP->NextMappedWithAttribute(name,num) { .. process mapped item <num> }

	:param name:
	:type name: char *
	:param num0:
	:type num0: int
	:rtype: int
") NextMappedWithAttribute;
		Standard_Integer NextMappedWithAttribute (const char * name,const Standard_Integer num0);
		%feature("compactdefaultargs") TransientMapper;
		%feature("autodoc", "	* Returns a TransientMapper for a given Transient Object Either <obj> is already mapped, then its Mapper is returned Or it is not, then a new one is created then returned, BUT it is not mapped here (use Bind or FindElseBind to do this)

	:param obj:
	:type obj: Handle_Standard_Transient &
	:rtype: Handle_Transfer_TransientMapper
") TransientMapper;
		Handle_Transfer_TransientMapper TransientMapper (const Handle_Standard_Transient & obj);
		%feature("compactdefaultargs") PrintTrace;
		%feature("autodoc", "	* Specific printing to trace a Finder (by its method ValueType)

	:param start:
	:type start: Handle_Transfer_Finder &
	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: void
") PrintTrace;
		virtual void PrintTrace (const Handle_Transfer_Finder & start,const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") PrintStats;
		%feature("autodoc", "	* Prints statistics on a given output, according mode

	:param mode:
	:type mode: int
	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: None
") PrintStats;
		void PrintStats (const Standard_Integer mode,const Handle_Message_Messenger & S);
};


%make_alias(Transfer_FinderProcess)

%extend Transfer_FinderProcess {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_IteratorOfProcessForFinder;
class Transfer_IteratorOfProcessForFinder : public Transfer_TransferIterator {
	public:
		%feature("compactdefaultargs") Transfer_IteratorOfProcessForFinder;
		%feature("autodoc", "	:param withstarts:
	:type withstarts: bool
	:rtype: None
") Transfer_IteratorOfProcessForFinder;
		 Transfer_IteratorOfProcessForFinder (const Standard_Boolean withstarts);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param binder:
	:type binder: Handle_Transfer_Binder &
	:rtype: None
") Add;
		void Add (const Handle_Transfer_Binder & binder);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param binder:
	:type binder: Handle_Transfer_Binder &
	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: None
") Add;
		void Add (const Handle_Transfer_Binder & binder,const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "	:param list:
	:type list: Handle_Transfer_HSequenceOfFinder &
	:param keep: default value is Standard_True
	:type keep: bool
	:rtype: None
") Filter;
		void Filter (const Handle_Transfer_HSequenceOfFinder & list,const Standard_Boolean keep = Standard_True);
		%feature("compactdefaultargs") HasStarting;
		%feature("autodoc", "	:rtype: bool
") HasStarting;
		Standard_Boolean HasStarting ();
		%feature("compactdefaultargs") Starting;
		%feature("autodoc", "	:rtype: Handle_Transfer_Finder
") Starting;
		Handle_Transfer_Finder Starting ();
};


%extend Transfer_IteratorOfProcessForFinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_IteratorOfProcessForTransient;
class Transfer_IteratorOfProcessForTransient : public Transfer_TransferIterator {
	public:
		%feature("compactdefaultargs") Transfer_IteratorOfProcessForTransient;
		%feature("autodoc", "	:param withstarts:
	:type withstarts: bool
	:rtype: None
") Transfer_IteratorOfProcessForTransient;
		 Transfer_IteratorOfProcessForTransient (const Standard_Boolean withstarts);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param binder:
	:type binder: Handle_Transfer_Binder &
	:rtype: None
") Add;
		void Add (const Handle_Transfer_Binder & binder);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param binder:
	:type binder: Handle_Transfer_Binder &
	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: None
") Add;
		void Add (const Handle_Transfer_Binder & binder,const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:param keep: default value is Standard_True
	:type keep: bool
	:rtype: None
") Filter;
		void Filter (const Handle_TColStd_HSequenceOfTransient & list,const Standard_Boolean keep = Standard_True);
		%feature("compactdefaultargs") HasStarting;
		%feature("autodoc", "	:rtype: bool
") HasStarting;
		Standard_Boolean HasStarting ();
		%feature("compactdefaultargs") Starting;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Starting;
		Handle_Standard_Transient Starting ();
};


%extend Transfer_IteratorOfProcessForTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_MultipleBinder;
class Transfer_MultipleBinder : public Transfer_Binder {
	public:
		%feature("compactdefaultargs") Transfer_MultipleBinder;
		%feature("autodoc", "	* normal standard constructor, creates an empty MultipleBinder

	:rtype: None
") Transfer_MultipleBinder;
		 Transfer_MultipleBinder ();
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "	* Returns True if a starting object is bound with SEVERAL results : Here, returns allways True

	:rtype: bool
") IsMultiple;
		virtual Standard_Boolean IsMultiple ();
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "	* Returns the Type permitted for Results, i.e. here Transient

	:rtype: Handle_Standard_Type
") ResultType;
		Handle_Standard_Type ResultType ();
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "	* Returns the Name of the Type which characterizes the Result Here, returns '(list)'

	:rtype: char *
") ResultTypeName;
		const char * ResultTypeName ();
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "	* Adds a new Item to the Multiple Result

	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: None
") AddResult;
		void AddResult (const Handle_Standard_Transient & res);
		%feature("compactdefaultargs") NbResults;
		%feature("autodoc", "	* Returns the actual count of recorded (Transient) results

	:rtype: int
") NbResults;
		Standard_Integer NbResults ();
		%feature("compactdefaultargs") ResultValue;
		%feature("autodoc", "	* Returns the value of the recorded result n0 <num>

	:param num:
	:type num: int
	:rtype: Handle_Standard_Transient
") ResultValue;
		Handle_Standard_Transient ResultValue (const Standard_Integer num);
		%feature("compactdefaultargs") MultipleResult;
		%feature("autodoc", "	* Returns the Multiple Result, if it is defined (at least one Item). Else, returns a Null Handle

	:rtype: Handle_TColStd_HSequenceOfTransient
") MultipleResult;
		Handle_TColStd_HSequenceOfTransient MultipleResult ();
		%feature("compactdefaultargs") SetMultipleResult;
		%feature("autodoc", "	* Defines a Binding with a Multiple Result, given as a Sequence Error if a Unique Result has yet been defined

	:param mulres:
	:type mulres: Handle_TColStd_HSequenceOfTransient &
	:rtype: None
") SetMultipleResult;
		void SetMultipleResult (const Handle_TColStd_HSequenceOfTransient & mulres);
};


%make_alias(Transfer_MultipleBinder)

%extend Transfer_MultipleBinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_SimpleBinderOfTransient;
class Transfer_SimpleBinderOfTransient : public Transfer_Binder {
	public:
		%feature("compactdefaultargs") Transfer_SimpleBinderOfTransient;
		%feature("autodoc", "	* Creates an empty SimpleBinderOfTransient Returns True if a starting object is bound with SEVERAL results : Here, returns allways False See Binder itself

	:rtype: None
") Transfer_SimpleBinderOfTransient;
		 Transfer_SimpleBinderOfTransient ();
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "	* Returns the Effective (Dynamic) Type of the Result (Standard_Transient if no Result is defined)

	:rtype: Handle_Standard_Type
") ResultType;
		Handle_Standard_Type ResultType ();
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "	* Returns the Effective Name of (Dynamic) Type of the Result (void) if no result is defined

	:rtype: char *
") ResultTypeName;
		const char * ResultTypeName ();
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "	* Defines the Result

	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: None
") SetResult;
		void SetResult (const Handle_Standard_Transient & res);
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* Returns the defined Result, if there is one

	:rtype: Handle_Standard_Transient
") Result;
		Handle_Standard_Transient Result ();
		%feature("compactdefaultargs") GetTypedResult;
		%feature("autodoc", "	* Returns a transient result according to its type (IsKind) i.e. the result itself if IsKind(atype), else searches in NextResult, until first found, then returns True If not found, returns False (res is NOT touched) //! This syntactic form avoids to do DownCast : if a result is found with the good type, it is loaded in <res> and can be immediately used, well initialised

	:param bnd:
	:type bnd: Handle_Transfer_Binder &
	:param atype:
	:type atype: Handle_Standard_Type &
	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: bool
") GetTypedResult;
		static Standard_Boolean GetTypedResult (const Handle_Transfer_Binder & bnd,const Handle_Standard_Type & atype,Handle_Standard_Transient & res);
};


%make_alias(Transfer_SimpleBinderOfTransient)

%extend Transfer_SimpleBinderOfTransient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_TransientListBinder;
class Transfer_TransientListBinder : public Transfer_Binder {
	public:
		%feature("compactdefaultargs") Transfer_TransientListBinder;
		%feature("autodoc", "	:rtype: None
") Transfer_TransientListBinder;
		 Transfer_TransientListBinder ();
		%feature("compactdefaultargs") Transfer_TransientListBinder;
		%feature("autodoc", "	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:rtype: None
") Transfer_TransientListBinder;
		 Transfer_TransientListBinder (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "	:rtype: bool
") IsMultiple;
		virtual Standard_Boolean IsMultiple ();
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") ResultType;
		Handle_Standard_Type ResultType ();
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "	:rtype: char *
") ResultTypeName;
		const char * ResultTypeName ();
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "	* Adds an item to the result list

	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: None
") AddResult;
		void AddResult (const Handle_Standard_Transient & res);
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	:rtype: Handle_TColStd_HSequenceOfTransient
") Result;
		Handle_TColStd_HSequenceOfTransient Result ();
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "	* Changes an already defined sub-result

	:param num:
	:type num: int
	:param res:
	:type res: Handle_Standard_Transient &
	:rtype: None
") SetResult;
		void SetResult (const Standard_Integer num,const Handle_Standard_Transient & res);
		%feature("compactdefaultargs") NbTransients;
		%feature("autodoc", "	:rtype: int
") NbTransients;
		Standard_Integer NbTransients ();
		%feature("compactdefaultargs") Transient;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_Standard_Transient
") Transient;
		Handle_Standard_Transient Transient (const Standard_Integer num);
};


%make_alias(Transfer_TransientListBinder)

%extend Transfer_TransientListBinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_TransientMapper;
class Transfer_TransientMapper : public Transfer_Finder {
	public:
		%feature("compactdefaultargs") Transfer_TransientMapper;
		%feature("autodoc", "	:param akey:
	:type akey: Handle_Standard_Transient &
	:rtype: None
") Transfer_TransientMapper;
		 Transfer_TransientMapper (const Handle_Standard_Transient & akey);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
		%feature("compactdefaultargs") Equates;
		%feature("autodoc", "	:param other:
	:type other: Handle_Transfer_Finder &
	:rtype: bool
") Equates;
		Standard_Boolean Equates (const Handle_Transfer_Finder & other);
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") ValueType;
		virtual Handle_Standard_Type ValueType ();
		%feature("compactdefaultargs") ValueTypeName;
		%feature("autodoc", "	:rtype: char *
") ValueTypeName;
		virtual const char * ValueTypeName ();
};


%make_alias(Transfer_TransientMapper)

%extend Transfer_TransientMapper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_TransientProcess;
class Transfer_TransientProcess : public Transfer_ProcessForTransient {
	public:
		%feature("compactdefaultargs") Transfer_TransientProcess;
		%feature("autodoc", "	* Sets TransientProcess at initial state, with an initial size

	:param nb: default value is 10000
	:type nb: int
	:rtype: None
") Transfer_TransientProcess;
		 Transfer_TransientProcess (const Standard_Integer nb = 10000);
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "	* Sets an InterfaceModel, used by StartTrace, CheckList, queries on Integrity, to give informations significant for each norm.

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: None
") SetModel;
		void SetModel (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the Model used for StartTrace

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") SetGraph;
		%feature("autodoc", "	* Sets a Graph : superseedes SetModel if already done

	:param HG:
	:type HG: Handle_Interface_HGraph &
	:rtype: None
") SetGraph;
		void SetGraph (const Handle_Interface_HGraph & HG);
		%feature("compactdefaultargs") HasGraph;
		%feature("autodoc", "	:rtype: bool
") HasGraph;
		Standard_Boolean HasGraph ();
		%feature("compactdefaultargs") HGraph;
		%feature("autodoc", "	:rtype: Handle_Interface_HGraph
") HGraph;
		Handle_Interface_HGraph HGraph ();
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "	:rtype: Interface_Graph
") Graph;
		const Interface_Graph & Graph ();
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	* Sets a Context : according to receiving appli, to be interpreted by the Actor

	:param name:
	:type name: char *
	:param ctx:
	:type ctx: Handle_Standard_Transient &
	:rtype: None
") SetContext;
		void SetContext (const char * name,const Handle_Standard_Transient & ctx);
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "	* Returns the Context attached to a name, if set and if it is Kind of the type, else a Null Handle Returns True if OK, False if no Context

	:param name:
	:type name: char *
	:param type:
	:type type: Handle_Standard_Type &
	:param ctx:
	:type ctx: Handle_Standard_Transient &
	:rtype: bool
") GetContext;
		Standard_Boolean GetContext (const char * name,const Handle_Standard_Type & type,Handle_Standard_Transient & ctx);
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "	* Returns (modifiable) the whole definition of Context Rather for internal use (ex.: preparing and setting in once)

	:rtype: Handle_Dico_DictionaryOfTransient
") Context;
		Handle_Dico_DictionaryOfTransient Context ();
		%feature("compactdefaultargs") PrintTrace;
		%feature("autodoc", "	* Specific printing to trace an entity : prints label and type (if model is set)

	:param start:
	:type start: Handle_Standard_Transient &
	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: void
") PrintTrace;
		virtual void PrintTrace (const Handle_Standard_Transient & start,const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") CheckNum;
		%feature("autodoc", "	* Specific number of a starting object for check-list : Number in model

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CheckNum;
		virtual Standard_Integer CheckNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") TypedSharings;
		%feature("autodoc", "	* Returns the list of sharings entities, AT ANY LEVEL, which are kind of a given type. Calls TypedSharings from Graph Returns an empty list if the Graph has not been aknowledged

	:param start:
	:type start: Handle_Standard_Transient &
	:param type:
	:type type: Handle_Standard_Type &
	:rtype: Interface_EntityIterator
") TypedSharings;
		Interface_EntityIterator TypedSharings (const Handle_Standard_Transient & start,const Handle_Standard_Type & type);
		%feature("compactdefaultargs") IsDataLoaded;
		%feature("autodoc", "	* Tells if an entity is well loaded from file (even if its data fail on checking, they are present). Mostly often, answers True. Else, there was a syntactic error in the file. A non-loaded entity MAY NOT BE transferred, unless its Report (in the model) is interpreted

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") IsDataLoaded;
		Standard_Boolean IsDataLoaded (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") IsDataFail;
		%feature("autodoc", "	* Tells if an entity fails on data checking (load time, syntactic, or semantic check). Normally, should answer False. It is not prudent to try transferring an entity which fails on data checking

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") IsDataFail;
		Standard_Boolean IsDataFail (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") PrintStats;
		%feature("autodoc", "	* Prints statistics on a given output, according mode

	:param mode:
	:type mode: int
	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: None
") PrintStats;
		void PrintStats (const Standard_Integer mode,const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") RootsForTransfer;
		%feature("autodoc", "	:rtype: Handle_TColStd_HSequenceOfTransient
") RootsForTransfer;
		Handle_TColStd_HSequenceOfTransient RootsForTransfer ();
};


%make_alias(Transfer_TransientProcess)

%extend Transfer_TransientProcess {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_VoidBinder;
class Transfer_VoidBinder : public Transfer_Binder {
	public:
		%feature("compactdefaultargs") Transfer_VoidBinder;
		%feature("autodoc", "	* a VoidBinder is not Multiple (Remark : it is not Simple too) But it can bring next results ...

	:rtype: None
") Transfer_VoidBinder;
		 Transfer_VoidBinder ();
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "	* while a VoidBinder admits no Result, its ResultType returns the type of <self>

	:rtype: Handle_Standard_Type
") ResultType;
		Handle_Standard_Type ResultType ();
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "	* Returns '(void)'

	:rtype: char *
") ResultTypeName;
		const char * ResultTypeName ();
};


%make_alias(Transfer_VoidBinder)

%extend Transfer_VoidBinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_ActorDispatch;
class Transfer_ActorDispatch : public Transfer_ActorOfTransientProcess {
	public:
		%feature("compactdefaultargs") Transfer_ActorDispatch;
		%feature("autodoc", "	* Creates an ActorDispatch from a Model. Works with a General Service Library, given as an Argument This causes TransferDispatch and its TransientProcess to be created, with default actor <self>

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param lib:
	:type lib: Interface_GeneralLib &
	:rtype: None
") Transfer_ActorDispatch;
		 Transfer_ActorDispatch (const Handle_Interface_InterfaceModel & amodel,const Interface_GeneralLib & lib);
		%feature("compactdefaultargs") Transfer_ActorDispatch;
		%feature("autodoc", "	* Same as above, but Library is defined through a Protocol

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:rtype: None
") Transfer_ActorDispatch;
		 Transfer_ActorDispatch (const Handle_Interface_InterfaceModel & amodel,const Handle_Interface_Protocol & protocol);
		%feature("compactdefaultargs") Transfer_ActorDispatch;
		%feature("autodoc", "	* Same as above, but works with the Active Protocol

	:param amodel:
	:type amodel: Handle_Interface_InterfaceModel &
	:rtype: None
") Transfer_ActorDispatch;
		 Transfer_ActorDispatch (const Handle_Interface_InterfaceModel & amodel);
		%feature("compactdefaultargs") AddActor;
		%feature("autodoc", "	* Utility which adds an actor to the default <self> (it calls SetActor from the TransientProcess)

	:param actor:
	:type actor: Handle_Transfer_ActorOfTransientProcess &
	:rtype: None
") AddActor;
		void AddActor (const Handle_Transfer_ActorOfTransientProcess & actor);
		%feature("compactdefaultargs") TransferDispatch;
		%feature("autodoc", "	* Returns the TransferDispatch, which does the work, records the intermediate data, etc... See TransferDispatch & CopyTool, to see the available methods

	:rtype: Transfer_TransferDispatch
") TransferDispatch;
		Transfer_TransferDispatch & TransferDispatch ();
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "	* Specific action : it calls the method Transfer from CopyTool i.e. the general service Copy, then returns the Binder produced by the TransientProcess

	:param start:
	:type start: Handle_Standard_Transient &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: Handle_Transfer_Binder
") Transfer;
		virtual Handle_Transfer_Binder Transfer (const Handle_Standard_Transient & start,const Handle_Transfer_TransientProcess & TP);
};


%make_alias(Transfer_ActorDispatch)

%extend Transfer_ActorDispatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Transfer_BinderOfTransientInteger;
class Transfer_BinderOfTransientInteger : public Transfer_SimpleBinderOfTransient {
	public:
		%feature("compactdefaultargs") Transfer_BinderOfTransientInteger;
		%feature("autodoc", "	* Creates an empty BinderOfTransientInteger; Default value for the integer part is zero

	:rtype: None
") Transfer_BinderOfTransientInteger;
		 Transfer_BinderOfTransientInteger ();
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "	* Sets a value for the integer part

	:param value:
	:type value: int
	:rtype: None
") SetInteger;
		void SetInteger (const Standard_Integer value);
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "	* Returns the value set for the integer part

	:rtype: int
") Integer;
		Standard_Integer Integer ();
};


%make_alias(Transfer_BinderOfTransientInteger)

%extend Transfer_BinderOfTransientInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
