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
%define TRANSFERBREPDOCSTRING
"-Purpose : This package gathers services to simply read files and convert
them to Shapes from CasCade. IE. it can be used in conjunction
with purely CasCade software
"
%enddef
%module (package="OCC.Core", docstring=TRANSFERBREPDOCSTRING) TransferBRep

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


%include TransferBRep_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(TransferBRep_BinderOfShape)
%wrap_handle(TransferBRep_HSequenceOfTransferResultInfo)
%wrap_handle(TransferBRep_OrientedShapeMapper)
%wrap_handle(TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo)
%wrap_handle(TransferBRep_ShapeListBinder)
%wrap_handle(TransferBRep_ShapeMapper)
%wrap_handle(TransferBRep_TransferResultInfo)
%wrap_handle(TransferBRep_ShapeBinder)

%rename(transferbrep) TransferBRep;
class TransferBRep {
	public:
		%feature("compactdefaultargs") ShapeResult;
		%feature("autodoc", "	* Get the Shape recorded in a Binder If the Binder brings a multiple result, search for the Shape

	:param binder:
	:type binder: Handle_Transfer_Binder &
	:rtype: TopoDS_Shape
") ShapeResult;
		static TopoDS_Shape ShapeResult (const Handle_Transfer_Binder & binder);
		%feature("compactdefaultargs") ShapeResult;
		%feature("autodoc", "	* Get the Shape recorded in a TransientProcess as result of the Transfer of an entity. I.E. in the binder bound to that Entity If no result or result not a single Shape, returns a Null Shape

	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: TopoDS_Shape
") ShapeResult;
		static TopoDS_Shape ShapeResult (const Handle_Transfer_TransientProcess & TP,const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") SetShapeResult;
		%feature("autodoc", "	* Sets a Shape as a result for a starting entity <ent> (reverse of ShapeResult) It simply creates a ShapeBinder then binds it to the entity

	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param result:
	:type result: TopoDS_Shape &
	:rtype: void
") SetShapeResult;
		static void SetShapeResult (const Handle_Transfer_TransientProcess & TP,const Handle_Standard_Transient & ent,const TopoDS_Shape & result);
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "	* Gets the Shapes recorded in a TransientProcess as result of a Transfer, considers roots only or all results according <rootsonly>, returns them as a HSequence

	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:param rootsonly: default value is Standard_True
	:type rootsonly: bool
	:rtype: Handle_TopTools_HSequenceOfShape
") Shapes;
		static Handle_TopTools_HSequenceOfShape Shapes (const Handle_Transfer_TransientProcess & TP,const Standard_Boolean rootsonly = Standard_True);
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "	* Gets the Shapes recorded in a TransientProcess as result of a Transfer, for a given list of starting entities, returns the shapes as a HSequence

	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:rtype: Handle_TopTools_HSequenceOfShape
") Shapes;
		static Handle_TopTools_HSequenceOfShape Shapes (const Handle_Transfer_TransientProcess & TP,const Handle_TColStd_HSequenceOfTransient & list);
		%feature("compactdefaultargs") ShapeState;
		%feature("autodoc", "	* Returns a Status regarding a Shape in a FinderProcess - FORWARD means bound with SAME Orientation - REVERSED means bound with REVERSE Orientation - EXTERNAL means NOT BOUND - INTERNAL is not used

	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: TopAbs_Orientation
") ShapeState;
		static TopAbs_Orientation ShapeState (const Handle_Transfer_FinderProcess & FP,const TopoDS_Shape & shape);
		%feature("compactdefaultargs") ResultFromShape;
		%feature("autodoc", "	* Returns the result (as a Binder) attached to a given Shape Null if none

	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: Handle_Transfer_Binder
") ResultFromShape;
		static Handle_Transfer_Binder ResultFromShape (const Handle_Transfer_FinderProcess & FP,const TopoDS_Shape & shape);
		%feature("compactdefaultargs") TransientFromShape;
		%feature("autodoc", "	* Returns the result as pure Transient attached to a Shape first one if multiple result

	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: Handle_Standard_Transient
") TransientFromShape;
		static Handle_Standard_Transient TransientFromShape (const Handle_Transfer_FinderProcess & FP,const TopoDS_Shape & shape);
		%feature("compactdefaultargs") SetTransientFromShape;
		%feature("autodoc", "	* Binds a Transient Result to a Shape in a FinderProcess (as first result if multiple : does not add it to existing one)

	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:param shape:
	:type shape: TopoDS_Shape &
	:param result:
	:type result: Handle_Standard_Transient &
	:rtype: void
") SetTransientFromShape;
		static void SetTransientFromShape (const Handle_Transfer_FinderProcess & FP,const TopoDS_Shape & shape,const Handle_Standard_Transient & result);
		%feature("compactdefaultargs") ShapeMapper;
		%feature("autodoc", "	* Returns a ShapeMapper for a given Shape (location included) Either <shape> is already mapped, then its Mapper is returned Or it is not, then a new one is created then returned, BUT it is not mapped here (use Bind or FindElseBind to do this)

	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: Handle_TransferBRep_ShapeMapper
") ShapeMapper;
		static Handle_TransferBRep_ShapeMapper ShapeMapper (const Handle_Transfer_FinderProcess & FP,const TopoDS_Shape & shape);
		%feature("compactdefaultargs") TransferResultInfo;
		%feature("autodoc", "	* Fills sequence of TransferResultInfo for each type of entity given in the EntityTypes (entity are given as objects). Method IsKind applied to the entities in TP is used to compare with entities in EntityTypes. TopAbs_ShapeEnum).

	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:param EntityTypes:
	:type EntityTypes: Handle_TColStd_HSequenceOfTransient &
	:param InfoSeq:
	:type InfoSeq: Handle_TransferBRep_HSequenceOfTransferResultInfo &
	:rtype: void
") TransferResultInfo;
		static void TransferResultInfo (const Handle_Transfer_TransientProcess & TP,const Handle_TColStd_HSequenceOfTransient & EntityTypes,Handle_TransferBRep_HSequenceOfTransferResultInfo & InfoSeq);
		%feature("compactdefaultargs") TransferResultInfo;
		%feature("autodoc", "	* Fills sequence of TransferResultInfo for each type of shape given in the ShapeTypes (which are in fact considered as TopAbs_ShapeEnum). The Finders in the FP are considered as ShapeMappers.

	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:param ShapeTypes:
	:type ShapeTypes: Handle_TColStd_HSequenceOfInteger &
	:param InfoSeq:
	:type InfoSeq: Handle_TransferBRep_HSequenceOfTransferResultInfo &
	:rtype: void
") TransferResultInfo;
		static void TransferResultInfo (const Handle_Transfer_FinderProcess & FP,const Handle_TColStd_HSequenceOfInteger & ShapeTypes,Handle_TransferBRep_HSequenceOfTransferResultInfo & InfoSeq);
		%feature("compactdefaultargs") PrintResultInfo;
		%feature("autodoc", "	* Prints the results of transfer to given priner with given header.

	:param Printer:
	:type Printer: Handle_Message_Printer &
	:param Header:
	:type Header: Message_Msg &
	:param ResultInfo:
	:type ResultInfo: Handle_TransferBRep_TransferResultInfo &
	:param printEmpty: default value is Standard_True
	:type printEmpty: bool
	:rtype: void
") PrintResultInfo;
		static void PrintResultInfo (const Handle_Message_Printer & Printer,const Message_Msg & Header,const Handle_TransferBRep_TransferResultInfo & ResultInfo,const Standard_Boolean printEmpty = Standard_True);
		%feature("compactdefaultargs") ResultCheckList;
		%feature("autodoc", "	* Takes a starting CheckIterator which brings checks bound with starting objects (Shapes, Transient from an Imagine appli ...) and converts it to a CheckIterator in which checks are bound with results in an InterfaceModel Mapping is recorded in the FinderProcess Starting objects for which no individual result is recorded remain in their state

	:param chl:
	:type chl: Interface_CheckIterator &
	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: Interface_CheckIterator
") ResultCheckList;
		static Interface_CheckIterator ResultCheckList (const Interface_CheckIterator & chl,const Handle_Transfer_FinderProcess & FP,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "	* Returns the list of objects to which a non-empty Check is bound in a check-list. Objects are transients, they can then be either Imagine objects entities for an Interface Norm. <alsoshapes> commands Shapes to be returned too (as ShapeMapper), see also CheckedShapes

	:param chl:
	:type chl: Interface_CheckIterator &
	:param alsoshapes: default value is Standard_False
	:type alsoshapes: bool
	:rtype: Handle_TColStd_HSequenceOfTransient
") Checked;
		static Handle_TColStd_HSequenceOfTransient Checked (const Interface_CheckIterator & chl,const Standard_Boolean alsoshapes = Standard_False);
		%feature("compactdefaultargs") CheckedShapes;
		%feature("autodoc", "	* Returns the list of shapes to which a non-empty Check is bound in a check-list

	:param chl:
	:type chl: Interface_CheckIterator &
	:rtype: Handle_TopTools_HSequenceOfShape
") CheckedShapes;
		static Handle_TopTools_HSequenceOfShape CheckedShapes (const Interface_CheckIterator & chl);
		%feature("compactdefaultargs") CheckObject;
		%feature("autodoc", "	* Returns the check-list bound to a given object, generally none (if OK) or one check. <obj> can be, either a true Transient object or entity, or a ShapeMapper, in that case the Shape is considered

	:param chl:
	:type chl: Interface_CheckIterator &
	:param obj:
	:type obj: Handle_Standard_Transient &
	:rtype: Interface_CheckIterator
") CheckObject;
		static Interface_CheckIterator CheckObject (const Interface_CheckIterator & chl,const Handle_Standard_Transient & obj);
};


%extend TransferBRep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TransferBRep_BinderOfShape;
class TransferBRep_BinderOfShape : public Transfer_Binder {
	public:
		%feature("compactdefaultargs") TransferBRep_BinderOfShape;
		%feature("autodoc", "	* normal standard constructor, creates an empty BinderOfShape

	:rtype: None
") TransferBRep_BinderOfShape;
		 TransferBRep_BinderOfShape ();
		%feature("compactdefaultargs") TransferBRep_BinderOfShape;
		%feature("autodoc", "	* constructor which in the same time defines the result Returns True if a starting object is bound with SEVERAL results : Here, returns allways False But it can have next results

	:param res:
	:type res: TopoDS_Shape &
	:rtype: None
") TransferBRep_BinderOfShape;
		 TransferBRep_BinderOfShape (const TopoDS_Shape & res);
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "	* Returns the Type permitted for the Result, i.e. the Type of the Parameter Class <Shape from TopoDS> (statically defined)

	:rtype: Handle_Standard_Type
") ResultType;
		Handle_Standard_Type ResultType ();
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "	* Returns the Type Name computed for the Result (dynamic)

	:rtype: char *
") ResultTypeName;
		const char * ResultTypeName ();
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "	* Defines the Result

	:param res:
	:type res: TopoDS_Shape &
	:rtype: None
") SetResult;
		void SetResult (const TopoDS_Shape & res);
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* Returns the defined Result, if there is one

	:rtype: TopoDS_Shape
") Result;
		const TopoDS_Shape  Result ();
		%feature("compactdefaultargs") CResult;
		%feature("autodoc", "	* Returns the defined Result, if there is one, and allows to change it (avoids Result + SetResult). Admits that Result can be not yet defined Warning : a call to CResult causes Result to be known as defined

	:rtype: TopoDS_Shape
") CResult;
		TopoDS_Shape  CResult ();
};


%make_alias(TransferBRep_BinderOfShape)

%extend TransferBRep_BinderOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TransferBRep_HSequenceOfTransferResultInfo;
class TransferBRep_HSequenceOfTransferResultInfo : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TransferBRep_HSequenceOfTransferResultInfo;
		%feature("autodoc", "	:rtype: None
") TransferBRep_HSequenceOfTransferResultInfo;
		 TransferBRep_HSequenceOfTransferResultInfo ();
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
	:type anItem: Handle_TransferBRep_TransferResultInfo &
	:rtype: None
") Append;
		void Append (const Handle_TransferBRep_TransferResultInfo & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TransferBRep_HSequenceOfTransferResultInfo &
	:rtype: None
") Append;
		void Append (const Handle_TransferBRep_HSequenceOfTransferResultInfo & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_TransferBRep_TransferResultInfo &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TransferBRep_TransferResultInfo & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TransferBRep_HSequenceOfTransferResultInfo &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TransferBRep_HSequenceOfTransferResultInfo & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_TransferBRep_TransferResultInfo &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TransferBRep_TransferResultInfo & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TransferBRep_HSequenceOfTransferResultInfo &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TransferBRep_HSequenceOfTransferResultInfo & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_TransferBRep_TransferResultInfo &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TransferBRep_TransferResultInfo & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TransferBRep_HSequenceOfTransferResultInfo &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TransferBRep_HSequenceOfTransferResultInfo & aSequence);
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
	:rtype: Handle_TransferBRep_HSequenceOfTransferResultInfo
") Split;
		Handle_TransferBRep_HSequenceOfTransferResultInfo Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_TransferBRep_TransferResultInfo &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_TransferBRep_TransferResultInfo & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TransferBRep_TransferResultInfo
") Value;
		Handle_TransferBRep_TransferResultInfo Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TransferBRep_TransferResultInfo
") ChangeValue;
		Handle_TransferBRep_TransferResultInfo ChangeValue (const Standard_Integer anIndex);
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
		%feature("autodoc", "	:rtype: TransferBRep_SequenceOfTransferResultInfo
") Sequence;
		const TransferBRep_SequenceOfTransferResultInfo & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TransferBRep_SequenceOfTransferResultInfo
") ChangeSequence;
		TransferBRep_SequenceOfTransferResultInfo & ChangeSequence ();
};


%make_alias(TransferBRep_HSequenceOfTransferResultInfo)

%extend TransferBRep_HSequenceOfTransferResultInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TransferBRep_OrientedShapeMapper;
class TransferBRep_OrientedShapeMapper : public Transfer_Finder {
	public:
		%feature("compactdefaultargs") TransferBRep_OrientedShapeMapper;
		%feature("autodoc", "	:param akey:
	:type akey: TopoDS_Shape &
	:rtype: None
") TransferBRep_OrientedShapeMapper;
		 TransferBRep_OrientedShapeMapper (const TopoDS_Shape & akey);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
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


%make_alias(TransferBRep_OrientedShapeMapper)

%extend TransferBRep_OrientedShapeMapper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TransferBRep_Reader;
class TransferBRep_Reader {
	public:
		%feature("compactdefaultargs") TransferBRep_Reader;
		%feature("autodoc", "	* Initializes a non-specialised Reader. Typically, for each norm or protocol, is will be required to define a specific Create to load a file and transfer it

	:rtype: None
") TransferBRep_Reader;
		 TransferBRep_Reader ();
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "	* Records the protocol to be used for read and transfer roots

	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:rtype: None
") SetProtocol;
		void SetProtocol (const Handle_Interface_Protocol & protocol);
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "	* Returns the recorded Protocol

	:rtype: Handle_Interface_Protocol
") Protocol;
		virtual Handle_Interface_Protocol Protocol ();
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "	* Records the actor to be used for transfers

	:param actor:
	:type actor: Handle_Transfer_ActorOfTransientProcess &
	:rtype: None
") SetActor;
		void SetActor (const Handle_Transfer_ActorOfTransientProcess & actor);
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "	* Returns the recorded Actor

	:rtype: Handle_Transfer_ActorOfTransientProcess
") Actor;
		virtual Handle_Transfer_ActorOfTransientProcess Actor ();
		%feature("compactdefaultargs") SetFileStatus;
		%feature("autodoc", "	* Sets File Status to be interpreted as follows : = 0 OK < 0 file not found > 0 read error, no Model could be created

	:param status:
	:type status: int
	:rtype: None
") SetFileStatus;
		void SetFileStatus (const Standard_Integer status);
		%feature("compactdefaultargs") FileStatus;
		%feature("autodoc", "	* Returns the File Status

	:rtype: int
") FileStatus;
		Standard_Integer FileStatus ();
		%feature("compactdefaultargs") FileNotFound;
		%feature("autodoc", "	* Returns True if FileStatus is for FileNotFound

	:rtype: bool
") FileNotFound;
		Standard_Boolean FileNotFound ();
		%feature("compactdefaultargs") SyntaxError;
		%feature("autodoc", "	* Returns True if FileStatus is for Error during read (major error; for local error, see CheckModel)

	:rtype: bool
") SyntaxError;
		Standard_Boolean SyntaxError ();
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "	* Specifies a Model to work on Also clears the result and Done status

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: None
") SetModel;
		void SetModel (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the Model to be worked on

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* clears the result and Done status. But not the Model.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") CheckStatusModel;
		%feature("autodoc", "	* Checks the Model. Returns True if there is NO FAIL at all (regardless Warnings) If <withprint> is True, also sends Checks on standard output

	:param withprint:
	:type withprint: bool
	:rtype: bool
") CheckStatusModel;
		Standard_Boolean CheckStatusModel (const Standard_Boolean withprint);
		%feature("compactdefaultargs") CheckListModel;
		%feature("autodoc", "	* Checks the Model (complete : syntax + semantic) and returns the produced Check List

	:rtype: Interface_CheckIterator
") CheckListModel;
		Interface_CheckIterator CheckListModel ();

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetModeNewTransfer() {
                return (Standard_Boolean) $self->ModeNewTransfer();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetModeNewTransfer(Standard_Boolean value ) {
                $self->ModeNewTransfer()=value;
                }
            };
            		%feature("compactdefaultargs") BeginTransfer;
		%feature("autodoc", "	* Initializes the Reader for a Transfer (one,roots, or list) Also calls PrepareTransfer Returns True when done, False if could not be done

	:rtype: bool
") BeginTransfer;
		Standard_Boolean BeginTransfer ();
		%feature("compactdefaultargs") EndTransfer;
		%feature("autodoc", "	* Ebds a Transfer (one, roots or list) by recording its result

	:rtype: None
") EndTransfer;
		void EndTransfer ();
		%feature("compactdefaultargs") PrepareTransfer;
		%feature("autodoc", "	* Prepares the Transfer. Also can act on the Actor or change the TransientProcess if required. Should not set the Actor into the TransientProcess, it is done by caller. The provided default does nothing.

	:rtype: void
") PrepareTransfer;
		virtual void PrepareTransfer ();
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "	* Transfers all Root Entities which are recognized as Geom-Topol The result will be a list of Shapes. This method calls user redefinable PrepareTransfer Remark : former result is cleared

	:rtype: void
") TransferRoots;
		virtual void TransferRoots ();
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "	* Transfers an Entity given its rank in the Model (Root or not) Returns True if it is recognized as Geom-Topol. (But it can have failed : see IsDone)

	:param num:
	:type num: int
	:rtype: bool
") Transfer;
		virtual Standard_Boolean Transfer (const Standard_Integer num);
		%feature("compactdefaultargs") TransferList;
		%feature("autodoc", "	* Transfers a list of Entities (only the ones also in the Model) Remark : former result is cleared

	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:rtype: void
") TransferList;
		virtual void TransferList (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the LAST Transfer/TransferRoots was a success

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "	* Returns the count of produced Shapes (roots)

	:rtype: int
") NbShapes;
		Standard_Integer NbShapes ();
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "	* Returns the complete list of produced Shapes

	:rtype: Handle_TopTools_HSequenceOfShape
") Shapes;
		Handle_TopTools_HSequenceOfShape Shapes ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns a Shape given its rank, by default the first one

	:param num: default value is 1
	:type num: int
	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape (const Standard_Integer num = 1);
		%feature("compactdefaultargs") ShapeResult;
		%feature("autodoc", "	* Returns a Shape produced from a given entity (if it was individually transferred or if an intermediate result is known). If no Shape is bound with <ent>, returns a Null Shape Warning : Runs on the last call to Transfer,TransferRoots,TransferList

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: TopoDS_Shape
") ShapeResult;
		TopoDS_Shape ShapeResult (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") OneShape;
		%feature("autodoc", "	* Returns a unique Shape for the result : - a void Shape (type = SHAPE) if result is empty - a simple Shape if result has only one : returns this one - a Compound if result has more than one Shape

	:rtype: TopoDS_Shape
") OneShape;
		TopoDS_Shape OneShape ();
		%feature("compactdefaultargs") NbTransients;
		%feature("autodoc", "	* Returns the count of produced Transient Results (roots)

	:rtype: int
") NbTransients;
		Standard_Integer NbTransients ();
		%feature("compactdefaultargs") Transients;
		%feature("autodoc", "	* Returns the complete list of produced Transient Results

	:rtype: Handle_TColStd_HSequenceOfTransient
") Transients;
		Handle_TColStd_HSequenceOfTransient Transients ();
		%feature("compactdefaultargs") Transient;
		%feature("autodoc", "	* Returns a Transient Root Result, given its rank (by default the first one)

	:param num: default value is 1
	:type num: int
	:rtype: Handle_Standard_Transient
") Transient;
		Handle_Standard_Transient Transient (const Standard_Integer num = 1);
		%feature("compactdefaultargs") CheckStatusResult;
		%feature("autodoc", "	* Checks the Result of last Transfer (individual or roots, no cumulation on several transfers). Returns True if NO fail occured during Transfer (queries the TransientProcess)

	:param withprints:
	:type withprints: bool
	:rtype: bool
") CheckStatusResult;
		Standard_Boolean CheckStatusResult (const Standard_Boolean withprints);
		%feature("compactdefaultargs") CheckListResult;
		%feature("autodoc", "	* Checks the Result of last Transfer (individual or roots, no cumulation on several transfers) and returns the produced list

	:rtype: Interface_CheckIterator
") CheckListResult;
		Interface_CheckIterator CheckListResult ();
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "	* Returns the TransientProcess. It records informations about the very last transfer done. Null if no transfer yet done. Can be used for queries more accurate than the default ones.

	:rtype: Handle_Transfer_TransientProcess
") TransientProcess;
		Handle_Transfer_TransientProcess TransientProcess ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: void
") Destroy;
		virtual void Destroy ();
};


%extend TransferBRep_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo;
class TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo;
		%feature("autodoc", "	:param I:
	:type I: Handle_TransferBRep_TransferResultInfo &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo;
		 TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo (const Handle_TransferBRep_TransferResultInfo & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TransferBRep_TransferResultInfo
") Value;
		Handle_TransferBRep_TransferResultInfo Value ();
};


%make_alias(TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo)

%extend TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TransferBRep_SequenceOfTransferResultInfo;
class TransferBRep_SequenceOfTransferResultInfo : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TransferBRep_SequenceOfTransferResultInfo;
		%feature("autodoc", "	:rtype: None
") TransferBRep_SequenceOfTransferResultInfo;
		 TransferBRep_SequenceOfTransferResultInfo ();
		%feature("compactdefaultargs") TransferBRep_SequenceOfTransferResultInfo;
		%feature("autodoc", "	:param Other:
	:type Other: TransferBRep_SequenceOfTransferResultInfo &
	:rtype: None
") TransferBRep_SequenceOfTransferResultInfo;
		 TransferBRep_SequenceOfTransferResultInfo (const TransferBRep_SequenceOfTransferResultInfo & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TransferBRep_SequenceOfTransferResultInfo &
	:rtype: TransferBRep_SequenceOfTransferResultInfo
") Assign;
		const TransferBRep_SequenceOfTransferResultInfo & Assign (const TransferBRep_SequenceOfTransferResultInfo & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TransferBRep_SequenceOfTransferResultInfo &
	:rtype: TransferBRep_SequenceOfTransferResultInfo
") operator =;
		const TransferBRep_SequenceOfTransferResultInfo & operator = (const TransferBRep_SequenceOfTransferResultInfo & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_TransferBRep_TransferResultInfo &
	:rtype: None
") Append;
		void Append (const Handle_TransferBRep_TransferResultInfo & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TransferBRep_SequenceOfTransferResultInfo &
	:rtype: None
") Append;
		void Append (TransferBRep_SequenceOfTransferResultInfo & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_TransferBRep_TransferResultInfo &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TransferBRep_TransferResultInfo & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TransferBRep_SequenceOfTransferResultInfo &
	:rtype: None
") Prepend;
		void Prepend (TransferBRep_SequenceOfTransferResultInfo & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TransferBRep_TransferResultInfo &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TransferBRep_TransferResultInfo & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TransferBRep_SequenceOfTransferResultInfo &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TransferBRep_SequenceOfTransferResultInfo & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TransferBRep_TransferResultInfo &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TransferBRep_TransferResultInfo & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TransferBRep_SequenceOfTransferResultInfo &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TransferBRep_SequenceOfTransferResultInfo & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TransferBRep_TransferResultInfo
") First;
		Handle_TransferBRep_TransferResultInfo First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TransferBRep_TransferResultInfo
") Last;
		Handle_TransferBRep_TransferResultInfo Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TransferBRep_SequenceOfTransferResultInfo &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TransferBRep_SequenceOfTransferResultInfo & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TransferBRep_TransferResultInfo
") Value;
		Handle_TransferBRep_TransferResultInfo Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_TransferBRep_TransferResultInfo &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TransferBRep_TransferResultInfo & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TransferBRep_TransferResultInfo
") ChangeValue;
		Handle_TransferBRep_TransferResultInfo ChangeValue (const Standard_Integer Index);
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


%extend TransferBRep_SequenceOfTransferResultInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TransferBRep_ShapeInfo {
	public:
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the Type attached to an object Here, TShape (Shape has no Dynamic Type)

	:param ent:
	:type ent: TopoDS_Shape &
	:rtype: Handle_Standard_Type
") Type;
		static Handle_Standard_Type Type (const TopoDS_Shape & ent);
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "	* Returns Type Name (string) Here, the true name of the Type of a Shape

	:param ent:
	:type ent: TopoDS_Shape &
	:rtype: char *
") TypeName;
		static const char * TypeName (const TopoDS_Shape & ent);
};


%extend TransferBRep_ShapeInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TransferBRep_ShapeListBinder;
class TransferBRep_ShapeListBinder : public Transfer_Binder {
	public:
		%feature("compactdefaultargs") TransferBRep_ShapeListBinder;
		%feature("autodoc", "	:rtype: None
") TransferBRep_ShapeListBinder;
		 TransferBRep_ShapeListBinder ();
		%feature("compactdefaultargs") TransferBRep_ShapeListBinder;
		%feature("autodoc", "	:param list:
	:type list: Handle_TopTools_HSequenceOfShape &
	:rtype: None
") TransferBRep_ShapeListBinder;
		 TransferBRep_ShapeListBinder (const Handle_TopTools_HSequenceOfShape & list);
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
	:type res: TopoDS_Shape &
	:rtype: None
") AddResult;
		void AddResult (const TopoDS_Shape & res);
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	:rtype: Handle_TopTools_HSequenceOfShape
") Result;
		Handle_TopTools_HSequenceOfShape Result ();
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "	* Changes an already defined sub-result

	:param num:
	:type num: int
	:param res:
	:type res: TopoDS_Shape &
	:rtype: None
") SetResult;
		void SetResult (const Standard_Integer num,const TopoDS_Shape & res);
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "	:rtype: int
") NbShapes;
		Standard_Integer NbShapes ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape (const Standard_Integer num);
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType (const Standard_Integer num);
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: TopoDS_Vertex
") Vertex;
		TopoDS_Vertex Vertex (const Standard_Integer num);
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: TopoDS_Edge
") Edge;
		TopoDS_Edge Edge (const Standard_Integer num);
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: TopoDS_Wire
") Wire;
		TopoDS_Wire Wire (const Standard_Integer num);
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: TopoDS_Face
") Face;
		TopoDS_Face Face (const Standard_Integer num);
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: TopoDS_Shell
") Shell;
		TopoDS_Shell Shell (const Standard_Integer num);
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: TopoDS_Solid
") Solid;
		TopoDS_Solid Solid (const Standard_Integer num);
		%feature("compactdefaultargs") CompSolid;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: TopoDS_CompSolid
") CompSolid;
		TopoDS_CompSolid CompSolid (const Standard_Integer num);
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: TopoDS_Compound
") Compound;
		TopoDS_Compound Compound (const Standard_Integer num);
};


%make_alias(TransferBRep_ShapeListBinder)

%extend TransferBRep_ShapeListBinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TransferBRep_ShapeMapper;
class TransferBRep_ShapeMapper : public Transfer_Finder {
	public:
		%feature("compactdefaultargs") TransferBRep_ShapeMapper;
		%feature("autodoc", "	:param akey:
	:type akey: TopoDS_Shape &
	:rtype: None
") TransferBRep_ShapeMapper;
		 TransferBRep_ShapeMapper (const TopoDS_Shape & akey);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
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


%make_alias(TransferBRep_ShapeMapper)

%extend TransferBRep_ShapeMapper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TransferBRep_TransferResultInfo;
class TransferBRep_TransferResultInfo : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TransferBRep_TransferResultInfo;
		%feature("autodoc", "	* Creates object with all fields nullified.

	:rtype: None
") TransferBRep_TransferResultInfo;
		 TransferBRep_TransferResultInfo ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Resets all the fields.

	:rtype: None
") Clear;
		void Clear ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetResult() {
                return (Standard_Integer) $self->Result();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetResult(Standard_Integer value ) {
                $self->Result()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetResultWarning() {
                return (Standard_Integer) $self->ResultWarning();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetResultWarning(Standard_Integer value ) {
                $self->ResultWarning()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetResultFail() {
                return (Standard_Integer) $self->ResultFail();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetResultFail(Standard_Integer value ) {
                $self->ResultFail()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetResultWarningFail() {
                return (Standard_Integer) $self->ResultWarningFail();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetResultWarningFail(Standard_Integer value ) {
                $self->ResultWarningFail()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetNoResult() {
                return (Standard_Integer) $self->NoResult();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetNoResult(Standard_Integer value ) {
                $self->NoResult()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetNoResultWarning() {
                return (Standard_Integer) $self->NoResultWarning();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetNoResultWarning(Standard_Integer value ) {
                $self->NoResultWarning()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetNoResultFail() {
                return (Standard_Integer) $self->NoResultFail();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetNoResultFail(Standard_Integer value ) {
                $self->NoResultFail()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetNoResultWarningFail() {
                return (Standard_Integer) $self->NoResultWarningFail();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetNoResultWarningFail(Standard_Integer value ) {
                $self->NoResultWarningFail()=value;
                }
            };
            };


%make_alias(TransferBRep_TransferResultInfo)

%extend TransferBRep_TransferResultInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TransferBRep_ShapeBinder;
class TransferBRep_ShapeBinder : public TransferBRep_BinderOfShape {
	public:
		%feature("compactdefaultargs") TransferBRep_ShapeBinder;
		%feature("autodoc", "	* Creates an empty ShapeBinder

	:rtype: None
") TransferBRep_ShapeBinder;
		 TransferBRep_ShapeBinder ();
		%feature("compactdefaultargs") TransferBRep_ShapeBinder;
		%feature("autodoc", "	* Creates a ShapeBinder with a result

	:param res:
	:type res: TopoDS_Shape &
	:rtype: None
") TransferBRep_ShapeBinder;
		 TransferBRep_ShapeBinder (const TopoDS_Shape & res);
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	* Returns the Type of the Shape Result (under TopAbs form)

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") Vertex;
		TopoDS_Vertex Vertex ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		TopoDS_Edge Edge ();
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "	:rtype: TopoDS_Wire
") Wire;
		TopoDS_Wire Wire ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	:rtype: TopoDS_Face
") Face;
		TopoDS_Face Face ();
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "	:rtype: TopoDS_Shell
") Shell;
		TopoDS_Shell Shell ();
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "	:rtype: TopoDS_Solid
") Solid;
		TopoDS_Solid Solid ();
		%feature("compactdefaultargs") CompSolid;
		%feature("autodoc", "	:rtype: TopoDS_CompSolid
") CompSolid;
		TopoDS_CompSolid CompSolid ();
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", "	:rtype: TopoDS_Compound
") Compound;
		TopoDS_Compound Compound ();
};


%make_alias(TransferBRep_ShapeBinder)

%extend TransferBRep_ShapeBinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
