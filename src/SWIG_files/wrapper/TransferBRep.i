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
%define TRANSFERBREPDOCSTRING
"TransferBRep module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_transferbrep.html"
%enddef
%module (package="OCC.Core", docstring=TRANSFERBREPDOCSTRING) TransferBRep


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
#include<TransferBRep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Interface_module.hxx>
#include<TColStd_module.hxx>
#include<TopTools_module.hxx>
#include<Message_module.hxx>
#include<Transfer_module.hxx>
#include<TopoDS_module.hxx>
#include<TopAbs_module.hxx>
#include<TopLoc_module.hxx>
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
%import TopTools.i
%import Message.i
%import Transfer.i
%import TopoDS.i
%import TopAbs.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(TransferBRep_BinderOfShape)
%wrap_handle(TransferBRep_OrientedShapeMapper)
%wrap_handle(TransferBRep_ShapeListBinder)
%wrap_handle(TransferBRep_ShapeMapper)
%wrap_handle(TransferBRep_TransferResultInfo)
%wrap_handle(TransferBRep_ShapeBinder)
%wrap_handle(TransferBRep_HSequenceOfTransferResultInfo)
/* end handles declaration */

/* templates */
%template(TransferBRep_SequenceOfTransferResultInfo) NCollection_Sequence <opencascade::handle <TransferBRep_TransferResultInfo>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <opencascade::handle <TransferBRep_TransferResultInfo>> TransferBRep_SequenceOfTransferResultInfo;
/* end typedefs declaration */

/*********************
* class TransferBRep *
*********************/
%rename(transferbrep) TransferBRep;
class TransferBRep {
	public:
		/****************** CheckObject ******************/
		%feature("compactdefaultargs") CheckObject;
		%feature("autodoc", "* Returns the check-list bound to a given object, generally none (if OK) or one check. <obj> can be, either a true Transient object or entity, or a ShapeMapper, in that case the Shape is considered
	:param chl:
	:type chl: Interface_CheckIterator
	:param obj:
	:type obj: Standard_Transient
	:rtype: Interface_CheckIterator") CheckObject;
		static Interface_CheckIterator CheckObject (const Interface_CheckIterator & chl,const opencascade::handle<Standard_Transient> & obj);

		/****************** Checked ******************/
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "* Returns the list of objects to which a non-empty Check is bound in a check-list. Objects are transients, they can then be either Imagine objects entities for an Interface Norm. <alsoshapes> commands Shapes to be returned too (as ShapeMapper), see also CheckedShapes
	:param chl:
	:type chl: Interface_CheckIterator
	:param alsoshapes: default value is Standard_False
	:type alsoshapes: bool
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>") Checked;
		static opencascade::handle<TColStd_HSequenceOfTransient> Checked (const Interface_CheckIterator & chl,const Standard_Boolean alsoshapes = Standard_False);

		/****************** CheckedShapes ******************/
		%feature("compactdefaultargs") CheckedShapes;
		%feature("autodoc", "* Returns the list of shapes to which a non-empty Check is bound in a check-list
	:param chl:
	:type chl: Interface_CheckIterator
	:rtype: opencascade::handle<TopTools_HSequenceOfShape>") CheckedShapes;
		static opencascade::handle<TopTools_HSequenceOfShape> CheckedShapes (const Interface_CheckIterator & chl);

		/****************** PrintResultInfo ******************/
		%feature("compactdefaultargs") PrintResultInfo;
		%feature("autodoc", "* Prints the results of transfer to given priner with given header.
	:param Printer:
	:type Printer: Message_Printer
	:param Header:
	:type Header: Message_Msg
	:param ResultInfo:
	:type ResultInfo: TransferBRep_TransferResultInfo
	:param printEmpty: default value is Standard_True
	:type printEmpty: bool
	:rtype: void") PrintResultInfo;
		static void PrintResultInfo (const opencascade::handle<Message_Printer> & Printer,const Message_Msg & Header,const opencascade::handle<TransferBRep_TransferResultInfo> & ResultInfo,const Standard_Boolean printEmpty = Standard_True);

		/****************** ResultCheckList ******************/
		%feature("compactdefaultargs") ResultCheckList;
		%feature("autodoc", "* Takes a starting CheckIterator which brings checks bound with starting objects (Shapes, Transient from an Imagine appli ...) and converts it to a CheckIterator in which checks are bound with results in an InterfaceModel Mapping is recorded in the FinderProcess Starting objects for which no individual result is recorded remain in their state
	:param chl:
	:type chl: Interface_CheckIterator
	:param FP:
	:type FP: Transfer_FinderProcess
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: Interface_CheckIterator") ResultCheckList;
		static Interface_CheckIterator ResultCheckList (const Interface_CheckIterator & chl,const opencascade::handle<Transfer_FinderProcess> & FP,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** ResultFromShape ******************/
		%feature("compactdefaultargs") ResultFromShape;
		%feature("autodoc", "* Returns the result (as a Binder) attached to a given Shape Null if none
	:param FP:
	:type FP: Transfer_FinderProcess
	:param shape:
	:type shape: TopoDS_Shape
	:rtype: opencascade::handle<Transfer_Binder>") ResultFromShape;
		static opencascade::handle<Transfer_Binder> ResultFromShape (const opencascade::handle<Transfer_FinderProcess> & FP,const TopoDS_Shape & shape);

		/****************** SetShapeResult ******************/
		%feature("compactdefaultargs") SetShapeResult;
		%feature("autodoc", "* Sets a Shape as a result for a starting entity <ent> (reverse of ShapeResult) It simply creates a ShapeBinder then binds it to the entity
	:param TP:
	:type TP: Transfer_TransientProcess
	:param ent:
	:type ent: Standard_Transient
	:param result:
	:type result: TopoDS_Shape
	:rtype: void") SetShapeResult;
		static void SetShapeResult (const opencascade::handle<Transfer_TransientProcess> & TP,const opencascade::handle<Standard_Transient> & ent,const TopoDS_Shape & result);

		/****************** SetTransientFromShape ******************/
		%feature("compactdefaultargs") SetTransientFromShape;
		%feature("autodoc", "* Binds a Transient Result to a Shape in a FinderProcess (as first result if multiple : does not add it to existing one)
	:param FP:
	:type FP: Transfer_FinderProcess
	:param shape:
	:type shape: TopoDS_Shape
	:param result:
	:type result: Standard_Transient
	:rtype: void") SetTransientFromShape;
		static void SetTransientFromShape (const opencascade::handle<Transfer_FinderProcess> & FP,const TopoDS_Shape & shape,const opencascade::handle<Standard_Transient> & result);

		/****************** ShapeMapper ******************/
		%feature("compactdefaultargs") ShapeMapper;
		%feature("autodoc", "* Returns a ShapeMapper for a given Shape (location included) Either <shape> is already mapped, then its Mapper is returned Or it is not, then a new one is created then returned, BUT it is not mapped here (use Bind or FindElseBind to do this)
	:param FP:
	:type FP: Transfer_FinderProcess
	:param shape:
	:type shape: TopoDS_Shape
	:rtype: opencascade::handle<TransferBRep_ShapeMapper>") ShapeMapper;
		static opencascade::handle<TransferBRep_ShapeMapper> ShapeMapper (const opencascade::handle<Transfer_FinderProcess> & FP,const TopoDS_Shape & shape);

		/****************** ShapeResult ******************/
		%feature("compactdefaultargs") ShapeResult;
		%feature("autodoc", "* Get the Shape recorded in a Binder If the Binder brings a multiple result, search for the Shape
	:param binder:
	:type binder: Transfer_Binder
	:rtype: TopoDS_Shape") ShapeResult;
		static TopoDS_Shape ShapeResult (const opencascade::handle<Transfer_Binder> & binder);

		/****************** ShapeResult ******************/
		%feature("compactdefaultargs") ShapeResult;
		%feature("autodoc", "* Get the Shape recorded in a TransientProcess as result of the Transfer of an entity. I.E. in the binder bound to that Entity If no result or result not a single Shape, returns a Null Shape
	:param TP:
	:type TP: Transfer_TransientProcess
	:param ent:
	:type ent: Standard_Transient
	:rtype: TopoDS_Shape") ShapeResult;
		static TopoDS_Shape ShapeResult (const opencascade::handle<Transfer_TransientProcess> & TP,const opencascade::handle<Standard_Transient> & ent);

		/****************** ShapeState ******************/
		%feature("compactdefaultargs") ShapeState;
		%feature("autodoc", "* Returns a Status regarding a Shape in a FinderProcess - FORWARD means bound with SAME Orientation - REVERSED means bound with REVERSE Orientation - EXTERNAL means NOT BOUND - INTERNAL is not used
	:param FP:
	:type FP: Transfer_FinderProcess
	:param shape:
	:type shape: TopoDS_Shape
	:rtype: TopAbs_Orientation") ShapeState;
		static TopAbs_Orientation ShapeState (const opencascade::handle<Transfer_FinderProcess> & FP,const TopoDS_Shape & shape);

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "* Gets the Shapes recorded in a TransientProcess as result of a Transfer, considers roots only or all results according <rootsonly>, returns them as a HSequence
	:param TP:
	:type TP: Transfer_TransientProcess
	:param rootsonly: default value is Standard_True
	:type rootsonly: bool
	:rtype: opencascade::handle<TopTools_HSequenceOfShape>") Shapes;
		static opencascade::handle<TopTools_HSequenceOfShape> Shapes (const opencascade::handle<Transfer_TransientProcess> & TP,const Standard_Boolean rootsonly = Standard_True);

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "* Gets the Shapes recorded in a TransientProcess as result of a Transfer, for a given list of starting entities, returns the shapes as a HSequence
	:param TP:
	:type TP: Transfer_TransientProcess
	:param list:
	:type list: TColStd_HSequenceOfTransient
	:rtype: opencascade::handle<TopTools_HSequenceOfShape>") Shapes;
		static opencascade::handle<TopTools_HSequenceOfShape> Shapes (const opencascade::handle<Transfer_TransientProcess> & TP,const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** TransferResultInfo ******************/
		%feature("compactdefaultargs") TransferResultInfo;
		%feature("autodoc", "* Fills sequence of TransferResultInfo for each type of entity given in the EntityTypes (entity are given as objects). Method IsKind applied to the entities in TP is used to compare with entities in EntityTypes. TopAbs_ShapeEnum).
	:param TP:
	:type TP: Transfer_TransientProcess
	:param EntityTypes:
	:type EntityTypes: TColStd_HSequenceOfTransient
	:param InfoSeq:
	:type InfoSeq: TransferBRep_HSequenceOfTransferResultInfo
	:rtype: void") TransferResultInfo;
		static void TransferResultInfo (const opencascade::handle<Transfer_TransientProcess> & TP,const opencascade::handle<TColStd_HSequenceOfTransient> & EntityTypes,opencascade::handle<TransferBRep_HSequenceOfTransferResultInfo> & InfoSeq);

		/****************** TransferResultInfo ******************/
		%feature("compactdefaultargs") TransferResultInfo;
		%feature("autodoc", "* Fills sequence of TransferResultInfo for each type of shape given in the ShapeTypes (which are in fact considered as TopAbs_ShapeEnum). The Finders in the FP are considered as ShapeMappers.
	:param FP:
	:type FP: Transfer_FinderProcess
	:param ShapeTypes:
	:type ShapeTypes: TColStd_HSequenceOfInteger
	:param InfoSeq:
	:type InfoSeq: TransferBRep_HSequenceOfTransferResultInfo
	:rtype: void") TransferResultInfo;
		static void TransferResultInfo (const opencascade::handle<Transfer_FinderProcess> & FP,const opencascade::handle<TColStd_HSequenceOfInteger> & ShapeTypes,opencascade::handle<TransferBRep_HSequenceOfTransferResultInfo> & InfoSeq);

		/****************** TransientFromShape ******************/
		%feature("compactdefaultargs") TransientFromShape;
		%feature("autodoc", "* Returns the result as pure Transient attached to a Shape first one if multiple result
	:param FP:
	:type FP: Transfer_FinderProcess
	:param shape:
	:type shape: TopoDS_Shape
	:rtype: opencascade::handle<Standard_Transient>") TransientFromShape;
		static opencascade::handle<Standard_Transient> TransientFromShape (const opencascade::handle<Transfer_FinderProcess> & FP,const TopoDS_Shape & shape);

};


%extend TransferBRep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TransferBRep_BinderOfShape *
***********************************/
class TransferBRep_BinderOfShape : public Transfer_Binder {
	public:
		/****************** CResult ******************/
		%feature("compactdefaultargs") CResult;
		%feature("autodoc", "* Returns the defined Result, if there is one, and allows to change it (avoids Result + SetResult). Admits that Result can be not yet defined Warning : a call to CResult causes Result to be known as defined
	:rtype: TopoDS_Shape") CResult;
		TopoDS_Shape  CResult ();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "* Returns the defined Result, if there is one
	:rtype: TopoDS_Shape") Result;
		const TopoDS_Shape  Result ();

		/****************** ResultType ******************/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "* Returns the Type permitted for the Result, i.e. the Type of the Parameter Class <Shape from TopoDS> (statically defined)
	:rtype: opencascade::handle<Standard_Type>") ResultType;
		opencascade::handle<Standard_Type> ResultType ();

		/****************** ResultTypeName ******************/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "* Returns the Type Name computed for the Result (dynamic)
	:rtype: char *") ResultTypeName;
		const char * ResultTypeName ();

		/****************** SetResult ******************/
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "* Defines the Result
	:param res:
	:type res: TopoDS_Shape
	:rtype: None") SetResult;
		void SetResult (const TopoDS_Shape & res);

		/****************** TransferBRep_BinderOfShape ******************/
		%feature("compactdefaultargs") TransferBRep_BinderOfShape;
		%feature("autodoc", "* normal standard constructor, creates an empty BinderOfShape
	:rtype: None") TransferBRep_BinderOfShape;
		 TransferBRep_BinderOfShape ();

		/****************** TransferBRep_BinderOfShape ******************/
		%feature("compactdefaultargs") TransferBRep_BinderOfShape;
		%feature("autodoc", "* constructor which in the same time defines the result Returns True if a starting object is bound with SEVERAL results : Here, returns allways False But it can have next results
	:param res:
	:type res: TopoDS_Shape
	:rtype: None") TransferBRep_BinderOfShape;
		 TransferBRep_BinderOfShape (const TopoDS_Shape & res);

};


%make_alias(TransferBRep_BinderOfShape)

%extend TransferBRep_BinderOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class TransferBRep_OrientedShapeMapper *
*****************************************/
class TransferBRep_OrientedShapeMapper : public Transfer_Finder {
	public:
		/****************** Equates ******************/
		%feature("compactdefaultargs") Equates;
		%feature("autodoc", "* Specific testof equallity : defined as False if <other> has not the same true Type, else contents are compared (by C++ operator ==)
	:param other:
	:type other: Transfer_Finder
	:rtype: bool") Equates;
		Standard_Boolean Equates (const opencascade::handle<Transfer_Finder> & other);

		/****************** TransferBRep_OrientedShapeMapper ******************/
		%feature("compactdefaultargs") TransferBRep_OrientedShapeMapper;
		%feature("autodoc", "* Creates a Mapper with a Value. This Value can then not be changed. It is used by the Hasher to compute the HashCode, which will then be stored for an immediate reading.
	:param akey:
	:type akey: TopoDS_Shape
	:rtype: None") TransferBRep_OrientedShapeMapper;
		 TransferBRep_OrientedShapeMapper (const TopoDS_Shape & akey);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the contained value
	:rtype: TopoDS_Shape") Value;
		const TopoDS_Shape  Value ();

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


%make_alias(TransferBRep_OrientedShapeMapper)

%extend TransferBRep_OrientedShapeMapper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TransferBRep_Reader *
****************************/
class TransferBRep_Reader {
	public:
		/****************** Actor ******************/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "* Returns the recorded Actor
	:rtype: opencascade::handle<Transfer_ActorOfTransientProcess>") Actor;
		virtual opencascade::handle<Transfer_ActorOfTransientProcess> Actor ();

		/****************** BeginTransfer ******************/
		%feature("compactdefaultargs") BeginTransfer;
		%feature("autodoc", "* Initializes the Reader for a Transfer (one,roots, or list) Also calls PrepareTransfer Returns True when done, False if could not be done
	:rtype: bool") BeginTransfer;
		Standard_Boolean BeginTransfer ();

		/****************** CheckListModel ******************/
		%feature("compactdefaultargs") CheckListModel;
		%feature("autodoc", "* Checks the Model (complete : syntax + semantic) and returns the produced Check List
	:rtype: Interface_CheckIterator") CheckListModel;
		Interface_CheckIterator CheckListModel ();

		/****************** CheckListResult ******************/
		%feature("compactdefaultargs") CheckListResult;
		%feature("autodoc", "* Checks the Result of last Transfer (individual or roots, no cumulation on several transfers) and returns the produced list
	:rtype: Interface_CheckIterator") CheckListResult;
		Interface_CheckIterator CheckListResult ();

		/****************** CheckStatusModel ******************/
		%feature("compactdefaultargs") CheckStatusModel;
		%feature("autodoc", "* Checks the Model. Returns True if there is NO FAIL at all (regardless Warnings) If <withprint> is True, also sends Checks on standard output
	:param withprint:
	:type withprint: bool
	:rtype: bool") CheckStatusModel;
		Standard_Boolean CheckStatusModel (const Standard_Boolean withprint);

		/****************** CheckStatusResult ******************/
		%feature("compactdefaultargs") CheckStatusResult;
		%feature("autodoc", "* Checks the Result of last Transfer (individual or roots, no cumulation on several transfers). Returns True if NO fail occured during Transfer (queries the TransientProcess)
	:param withprints:
	:type withprints: bool
	:rtype: bool") CheckStatusResult;
		Standard_Boolean CheckStatusResult (const Standard_Boolean withprints);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* clears the result and Done status. But not the Model.
	:rtype: None") Clear;
		void Clear ();

		/****************** EndTransfer ******************/
		%feature("compactdefaultargs") EndTransfer;
		%feature("autodoc", "* Ebds a Transfer (one, roots or list) by recording its result
	:rtype: None") EndTransfer;
		void EndTransfer ();

		/****************** FileNotFound ******************/
		%feature("compactdefaultargs") FileNotFound;
		%feature("autodoc", "* Returns True if FileStatus is for FileNotFound
	:rtype: bool") FileNotFound;
		Standard_Boolean FileNotFound ();

		/****************** FileStatus ******************/
		%feature("compactdefaultargs") FileStatus;
		%feature("autodoc", "* Returns the File Status
	:rtype: int") FileStatus;
		Standard_Integer FileStatus ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the LAST Transfer/TransferRoots was a success
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetModeNewTransfer() {
            return (Standard_Boolean) $self->ModeNewTransfer();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetModeNewTransfer(Standard_Boolean value) {
            $self->ModeNewTransfer()=value;
            }
        };
		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "* Returns the Model to be worked on
	:rtype: opencascade::handle<Interface_InterfaceModel>") Model;
		opencascade::handle<Interface_InterfaceModel> Model ();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "* Returns the count of produced Shapes (roots)
	:rtype: int") NbShapes;
		Standard_Integer NbShapes ();

		/****************** NbTransients ******************/
		%feature("compactdefaultargs") NbTransients;
		%feature("autodoc", "* Returns the count of produced Transient Results (roots)
	:rtype: int") NbTransients;
		Standard_Integer NbTransients ();

		/****************** OneShape ******************/
		%feature("compactdefaultargs") OneShape;
		%feature("autodoc", "* Returns a unique Shape for the result : - a void Shape (type = SHAPE) if result is empty - a simple Shape if result has only one : returns this one - a Compound if result has more than one Shape
	:rtype: TopoDS_Shape") OneShape;
		TopoDS_Shape OneShape ();

		/****************** PrepareTransfer ******************/
		%feature("compactdefaultargs") PrepareTransfer;
		%feature("autodoc", "* Prepares the Transfer. Also can act on the Actor or change the TransientProcess if required. Should not set the Actor into the TransientProcess, it is done by caller. The provided default does nothing.
	:rtype: void") PrepareTransfer;
		virtual void PrepareTransfer ();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "* Returns the recorded Protocol
	:rtype: opencascade::handle<Interface_Protocol>") Protocol;
		virtual opencascade::handle<Interface_Protocol> Protocol ();

		/****************** SetActor ******************/
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "* Records the actor to be used for transfers
	:param actor:
	:type actor: Transfer_ActorOfTransientProcess
	:rtype: None") SetActor;
		void SetActor (const opencascade::handle<Transfer_ActorOfTransientProcess> & actor);

		/****************** SetFileStatus ******************/
		%feature("compactdefaultargs") SetFileStatus;
		%feature("autodoc", "* Sets File Status to be interpreted as follows : = 0 OK < 0 file not found > 0 read error, no Model could be created
	:param status:
	:type status: int
	:rtype: None") SetFileStatus;
		void SetFileStatus (const Standard_Integer status);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "* Specifies a Model to work on Also clears the result and Done status
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: None") SetModel;
		void SetModel (const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** SetProtocol ******************/
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "* Records the protocol to be used for read and transfer roots
	:param protocol:
	:type protocol: Interface_Protocol
	:rtype: None") SetProtocol;
		void SetProtocol (const opencascade::handle<Interface_Protocol> & protocol);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns a Shape given its rank, by default the first one
	:param num: default value is 1
	:type num: int
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape (const Standard_Integer num = 1);

		/****************** ShapeResult ******************/
		%feature("compactdefaultargs") ShapeResult;
		%feature("autodoc", "* Returns a Shape produced from a given entity (if it was individually transferred or if an intermediate result is known). If no Shape is bound with <ent>, returns a Null Shape Warning : Runs on the last call to Transfer,TransferRoots,TransferList
	:param ent:
	:type ent: Standard_Transient
	:rtype: TopoDS_Shape") ShapeResult;
		TopoDS_Shape ShapeResult (const opencascade::handle<Standard_Transient> & ent);

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "* Returns the complete list of produced Shapes
	:rtype: opencascade::handle<TopTools_HSequenceOfShape>") Shapes;
		opencascade::handle<TopTools_HSequenceOfShape> Shapes ();

		/****************** SyntaxError ******************/
		%feature("compactdefaultargs") SyntaxError;
		%feature("autodoc", "* Returns True if FileStatus is for Error during read (major error; for local error, see CheckModel)
	:rtype: bool") SyntaxError;
		Standard_Boolean SyntaxError ();

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "* Transfers an Entity given its rank in the Model (Root or not) Returns True if it is recognized as Geom-Topol. (But it can have failed : see IsDone)
	:param num:
	:type num: int
	:rtype: bool") Transfer;
		virtual Standard_Boolean Transfer (const Standard_Integer num);

		/****************** TransferBRep_Reader ******************/
		%feature("compactdefaultargs") TransferBRep_Reader;
		%feature("autodoc", "* Initializes a non-specialised Reader. Typically, for each norm or protocol, is will be required to define a specific Create to load a file and transfer it
	:rtype: None") TransferBRep_Reader;
		 TransferBRep_Reader ();

		/****************** TransferList ******************/
		%feature("compactdefaultargs") TransferList;
		%feature("autodoc", "* Transfers a list of Entities (only the ones also in the Model) Remark : former result is cleared
	:param list:
	:type list: TColStd_HSequenceOfTransient
	:rtype: void") TransferList;
		virtual void TransferList (const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** TransferRoots ******************/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "* Transfers all Root Entities which are recognized as Geom-Topol The result will be a list of Shapes. This method calls user redefinable PrepareTransfer Remark : former result is cleared
	:rtype: void") TransferRoots;
		virtual void TransferRoots ();

		/****************** Transient ******************/
		%feature("compactdefaultargs") Transient;
		%feature("autodoc", "* Returns a Transient Root Result, given its rank (by default the first one)
	:param num: default value is 1
	:type num: int
	:rtype: opencascade::handle<Standard_Transient>") Transient;
		opencascade::handle<Standard_Transient> Transient (const Standard_Integer num = 1);

		/****************** TransientProcess ******************/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "* Returns the TransientProcess. It records informations about the very last transfer done. Null if no transfer yet done. Can be used for queries more accurate than the default ones.
	:rtype: opencascade::handle<Transfer_TransientProcess>") TransientProcess;
		opencascade::handle<Transfer_TransientProcess> TransientProcess ();

		/****************** Transients ******************/
		%feature("compactdefaultargs") Transients;
		%feature("autodoc", "* Returns the complete list of produced Transient Results
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>") Transients;
		opencascade::handle<TColStd_HSequenceOfTransient> Transients ();

};


%extend TransferBRep_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TransferBRep_ShapeInfo *
*******************************/
class TransferBRep_ShapeInfo {
	public:
		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns the Type attached to an object Here, TShape (Shape has no Dynamic Type)
	:param ent:
	:type ent: TopoDS_Shape
	:rtype: opencascade::handle<Standard_Type>") Type;
		static opencascade::handle<Standard_Type> Type (const TopoDS_Shape & ent);

		/****************** TypeName ******************/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "* Returns Type Name (string) Here, the true name of the Type of a Shape
	:param ent:
	:type ent: TopoDS_Shape
	:rtype: char *") TypeName;
		static const char * TypeName (const TopoDS_Shape & ent);

};


%extend TransferBRep_ShapeInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class TransferBRep_ShapeListBinder *
*************************************/
class TransferBRep_ShapeListBinder : public Transfer_Binder {
	public:
		/****************** AddResult ******************/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "* Adds an item to the result list
	:param res:
	:type res: TopoDS_Shape
	:rtype: None") AddResult;
		void AddResult (const TopoDS_Shape & res);

		/****************** CompSolid ******************/
		%feature("compactdefaultargs") CompSolid;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: TopoDS_CompSolid") CompSolid;
		TopoDS_CompSolid CompSolid (const Standard_Integer num);

		/****************** Compound ******************/
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: TopoDS_Compound") Compound;
		TopoDS_Compound Compound (const Standard_Integer num);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: TopoDS_Edge") Edge;
		TopoDS_Edge Edge (const Standard_Integer num);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: TopoDS_Face") Face;
		TopoDS_Face Face (const Standard_Integer num);

		/****************** IsMultiple ******************/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", ":rtype: bool") IsMultiple;
		virtual Standard_Boolean IsMultiple ();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", ":rtype: int") NbShapes;
		Standard_Integer NbShapes ();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", ":rtype: opencascade::handle<TopTools_HSequenceOfShape>") Result;
		opencascade::handle<TopTools_HSequenceOfShape> Result ();

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
	:type res: TopoDS_Shape
	:rtype: None") SetResult;
		void SetResult (const Standard_Integer num,const TopoDS_Shape & res);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape (const Standard_Integer num);

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: TopAbs_ShapeEnum") ShapeType;
		TopAbs_ShapeEnum ShapeType (const Standard_Integer num);

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: TopoDS_Shell") Shell;
		TopoDS_Shell Shell (const Standard_Integer num);

		/****************** Solid ******************/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: TopoDS_Solid") Solid;
		TopoDS_Solid Solid (const Standard_Integer num);

		/****************** TransferBRep_ShapeListBinder ******************/
		%feature("compactdefaultargs") TransferBRep_ShapeListBinder;
		%feature("autodoc", ":rtype: None") TransferBRep_ShapeListBinder;
		 TransferBRep_ShapeListBinder ();

		/****************** TransferBRep_ShapeListBinder ******************/
		%feature("compactdefaultargs") TransferBRep_ShapeListBinder;
		%feature("autodoc", ":param list:
	:type list: TopTools_HSequenceOfShape
	:rtype: None") TransferBRep_ShapeListBinder;
		 TransferBRep_ShapeListBinder (const opencascade::handle<TopTools_HSequenceOfShape> & list);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: TopoDS_Vertex") Vertex;
		TopoDS_Vertex Vertex (const Standard_Integer num);

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", ":param num:
	:type num: int
	:rtype: TopoDS_Wire") Wire;
		TopoDS_Wire Wire (const Standard_Integer num);

};


%make_alias(TransferBRep_ShapeListBinder)

%extend TransferBRep_ShapeListBinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TransferBRep_ShapeMapper *
*********************************/
class TransferBRep_ShapeMapper : public Transfer_Finder {
	public:
		/****************** Equates ******************/
		%feature("compactdefaultargs") Equates;
		%feature("autodoc", "* Specific testof equallity : defined as False if <other> has not the same true Type, else contents are compared (by C++ operator ==)
	:param other:
	:type other: Transfer_Finder
	:rtype: bool") Equates;
		Standard_Boolean Equates (const opencascade::handle<Transfer_Finder> & other);

		/****************** TransferBRep_ShapeMapper ******************/
		%feature("compactdefaultargs") TransferBRep_ShapeMapper;
		%feature("autodoc", "* Creates a Mapper with a Value. This Value can then not be changed. It is used by the Hasher to compute the HashCode, which will then be stored for an immediate reading.
	:param akey:
	:type akey: TopoDS_Shape
	:rtype: None") TransferBRep_ShapeMapper;
		 TransferBRep_ShapeMapper (const TopoDS_Shape & akey);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the contained value
	:rtype: TopoDS_Shape") Value;
		const TopoDS_Shape  Value ();

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


%make_alias(TransferBRep_ShapeMapper)

%extend TransferBRep_ShapeMapper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class TransferBRep_TransferResultInfo *
****************************************/
class TransferBRep_TransferResultInfo : public Standard_Transient {
	public:
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Resets all the fields.
	:rtype: None") Clear;
		void Clear ();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetNoResult() {
            return (Standard_Integer) $self->NoResult();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetNoResult(Standard_Integer value) {
            $self->NoResult()=value;
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
            void SetNoResultFail(Standard_Integer value) {
            $self->NoResultFail()=value;
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
            void SetNoResultWarning(Standard_Integer value) {
            $self->NoResultWarning()=value;
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
            void SetNoResultWarningFail(Standard_Integer value) {
            $self->NoResultWarningFail()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetResult() {
            return (Standard_Integer) $self->Result();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetResult(Standard_Integer value) {
            $self->Result()=value;
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
            void SetResultFail(Standard_Integer value) {
            $self->ResultFail()=value;
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
            void SetResultWarning(Standard_Integer value) {
            $self->ResultWarning()=value;
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
            void SetResultWarningFail(Standard_Integer value) {
            $self->ResultWarningFail()=value;
            }
        };
		/****************** TransferBRep_TransferResultInfo ******************/
		%feature("compactdefaultargs") TransferBRep_TransferResultInfo;
		%feature("autodoc", "* Creates object with all fields nullified.
	:rtype: None") TransferBRep_TransferResultInfo;
		 TransferBRep_TransferResultInfo ();

};


%make_alias(TransferBRep_TransferResultInfo)

%extend TransferBRep_TransferResultInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TransferBRep_ShapeBinder *
*********************************/
class TransferBRep_ShapeBinder : public TransferBRep_BinderOfShape {
	public:
		/****************** CompSolid ******************/
		%feature("compactdefaultargs") CompSolid;
		%feature("autodoc", ":rtype: TopoDS_CompSolid") CompSolid;
		TopoDS_CompSolid CompSolid ();

		/****************** Compound ******************/
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", ":rtype: TopoDS_Compound") Compound;
		TopoDS_Compound Compound ();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":rtype: TopoDS_Edge") Edge;
		TopoDS_Edge Edge ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", ":rtype: TopoDS_Face") Face;
		TopoDS_Face Face ();

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "* Returns the Type of the Shape Result (under TopAbs form)
	:rtype: TopAbs_ShapeEnum") ShapeType;
		TopAbs_ShapeEnum ShapeType ();

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", ":rtype: TopoDS_Shell") Shell;
		TopoDS_Shell Shell ();

		/****************** Solid ******************/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", ":rtype: TopoDS_Solid") Solid;
		TopoDS_Solid Solid ();

		/****************** TransferBRep_ShapeBinder ******************/
		%feature("compactdefaultargs") TransferBRep_ShapeBinder;
		%feature("autodoc", "* Creates an empty ShapeBinder
	:rtype: None") TransferBRep_ShapeBinder;
		 TransferBRep_ShapeBinder ();

		/****************** TransferBRep_ShapeBinder ******************/
		%feature("compactdefaultargs") TransferBRep_ShapeBinder;
		%feature("autodoc", "* Creates a ShapeBinder with a result
	:param res:
	:type res: TopoDS_Shape
	:rtype: None") TransferBRep_ShapeBinder;
		 TransferBRep_ShapeBinder (const TopoDS_Shape & res);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":rtype: TopoDS_Vertex") Vertex;
		TopoDS_Vertex Vertex ();

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", ":rtype: TopoDS_Wire") Wire;
		TopoDS_Wire Wire ();

};


%make_alias(TransferBRep_ShapeBinder)

%extend TransferBRep_ShapeBinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class TransferBRep_HSequenceOfTransferResultInfo : public  TransferBRep_SequenceOfTransferResultInfo, public Standard_Transient {
  public:
    TransferBRep_HSequenceOfTransferResultInfo();
    TransferBRep_HSequenceOfTransferResultInfo(const  TransferBRep_SequenceOfTransferResultInfo& theOther);
    const  TransferBRep_SequenceOfTransferResultInfo& Sequence();
    void Append (const  TransferBRep_SequenceOfTransferResultInfo::value_type& theItem);
    void Append ( TransferBRep_SequenceOfTransferResultInfo& theSequence);
     TransferBRep_SequenceOfTransferResultInfo& ChangeSequence();
};
%make_alias(TransferBRep_HSequenceOfTransferResultInfo)


