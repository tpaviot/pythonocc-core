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

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

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
%template(TransferBRep_SequenceOfTransferResultInfo) NCollection_Sequence<opencascade::handle<TransferBRep_TransferResultInfo>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<opencascade::handle<TransferBRep_TransferResultInfo>> TransferBRep_SequenceOfTransferResultInfo;
/* end typedefs declaration */

/*********************
* class TransferBRep *
*********************/
%rename(transferbrep) TransferBRep;
class TransferBRep {
	public:
		/****************** CheckObject ******************/
		%feature("compactdefaultargs") CheckObject;
		%feature("autodoc", "Returns the check-list bound to a given object, generally none (if ok) or one check. <obj> can be, either a true transient object or entity, or a shapemapper, in that case the shape is considered.

Parameters
----------
chl: Interface_CheckIterator
obj: Standard_Transient

Returns
-------
Interface_CheckIterator
") CheckObject;
		static Interface_CheckIterator CheckObject(const Interface_CheckIterator & chl, const opencascade::handle<Standard_Transient> & obj);

		/****************** Checked ******************/
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "Returns the list of objects to which a non-empty check is bound in a check-list. objects are transients, they can then be either imagine objects entities for an interface norm. <alsoshapes> commands shapes to be returned too (as shapemapper), see also checkedshapes.

Parameters
----------
chl: Interface_CheckIterator
alsoshapes: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") Checked;
		static opencascade::handle<TColStd_HSequenceOfTransient> Checked(const Interface_CheckIterator & chl, const Standard_Boolean alsoshapes = Standard_False);

		/****************** CheckedShapes ******************/
		%feature("compactdefaultargs") CheckedShapes;
		%feature("autodoc", "Returns the list of shapes to which a non-empty check is bound in a check-list.

Parameters
----------
chl: Interface_CheckIterator

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") CheckedShapes;
		static opencascade::handle<TopTools_HSequenceOfShape> CheckedShapes(const Interface_CheckIterator & chl);

		/****************** PrintResultInfo ******************/
		%feature("compactdefaultargs") PrintResultInfo;
		%feature("autodoc", "Prints the results of transfer to given priner with given header.

Parameters
----------
Printer: Message_Printer
Header: Message_Msg
ResultInfo: TransferBRep_TransferResultInfo
printEmpty: bool,optional
	default value is Standard_True

Returns
-------
None
") PrintResultInfo;
		static void PrintResultInfo(const opencascade::handle<Message_Printer> & Printer, const Message_Msg & Header, const opencascade::handle<TransferBRep_TransferResultInfo> & ResultInfo, const Standard_Boolean printEmpty = Standard_True);

		/****************** ResultCheckList ******************/
		%feature("compactdefaultargs") ResultCheckList;
		%feature("autodoc", "Takes a starting checkiterator which brings checks bound with starting objects (shapes, transient from an imagine appli ...) and converts it to a checkiterator in which checks are bound with results in an interfacemodel mapping is recorded in the finderprocess starting objects for which no individual result is recorded remain in their state.

Parameters
----------
chl: Interface_CheckIterator
FP: Transfer_FinderProcess
model: Interface_InterfaceModel

Returns
-------
Interface_CheckIterator
") ResultCheckList;
		static Interface_CheckIterator ResultCheckList(const Interface_CheckIterator & chl, const opencascade::handle<Transfer_FinderProcess> & FP, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** ResultFromShape ******************/
		%feature("compactdefaultargs") ResultFromShape;
		%feature("autodoc", "Returns the result (as a binder) attached to a given shape null if none.

Parameters
----------
FP: Transfer_FinderProcess
shape: TopoDS_Shape

Returns
-------
opencascade::handle<Transfer_Binder>
") ResultFromShape;
		static opencascade::handle<Transfer_Binder> ResultFromShape(const opencascade::handle<Transfer_FinderProcess> & FP, const TopoDS_Shape & shape);

		/****************** SetShapeResult ******************/
		%feature("compactdefaultargs") SetShapeResult;
		%feature("autodoc", "Sets a shape as a result for a starting entity <ent> (reverse of shaperesult) it simply creates a shapebinder then binds it to the entity.

Parameters
----------
TP: Transfer_TransientProcess
ent: Standard_Transient
result: TopoDS_Shape

Returns
-------
None
") SetShapeResult;
		static void SetShapeResult(const opencascade::handle<Transfer_TransientProcess> & TP, const opencascade::handle<Standard_Transient> & ent, const TopoDS_Shape & result);

		/****************** SetTransientFromShape ******************/
		%feature("compactdefaultargs") SetTransientFromShape;
		%feature("autodoc", "Binds a transient result to a shape in a finderprocess (as first result if multiple : does not add it to existing one).

Parameters
----------
FP: Transfer_FinderProcess
shape: TopoDS_Shape
result: Standard_Transient

Returns
-------
None
") SetTransientFromShape;
		static void SetTransientFromShape(const opencascade::handle<Transfer_FinderProcess> & FP, const TopoDS_Shape & shape, const opencascade::handle<Standard_Transient> & result);

		/****************** ShapeMapper ******************/
		%feature("compactdefaultargs") ShapeMapper;
		%feature("autodoc", "Returns a shapemapper for a given shape (location included) either <shape> is already mapped, then its mapper is returned or it is not, then a new one is created then returned, but it is not mapped here (use bind or findelsebind to do this).

Parameters
----------
FP: Transfer_FinderProcess
shape: TopoDS_Shape

Returns
-------
opencascade::handle<TransferBRep_ShapeMapper>
") ShapeMapper;
		static opencascade::handle<TransferBRep_ShapeMapper> ShapeMapper(const opencascade::handle<Transfer_FinderProcess> & FP, const TopoDS_Shape & shape);

		/****************** ShapeResult ******************/
		%feature("compactdefaultargs") ShapeResult;
		%feature("autodoc", "Get the shape recorded in a binder if the binder brings a multiple result, search for the shape.

Parameters
----------
binder: Transfer_Binder

Returns
-------
TopoDS_Shape
") ShapeResult;
		static TopoDS_Shape ShapeResult(const opencascade::handle<Transfer_Binder> & binder);

		/****************** ShapeResult ******************/
		%feature("compactdefaultargs") ShapeResult;
		%feature("autodoc", "Get the shape recorded in a transientprocess as result of the transfer of an entity. i.e. in the binder bound to that entity if no result or result not a single shape, returns a null shape.

Parameters
----------
TP: Transfer_TransientProcess
ent: Standard_Transient

Returns
-------
TopoDS_Shape
") ShapeResult;
		static TopoDS_Shape ShapeResult(const opencascade::handle<Transfer_TransientProcess> & TP, const opencascade::handle<Standard_Transient> & ent);

		/****************** ShapeState ******************/
		%feature("compactdefaultargs") ShapeState;
		%feature("autodoc", "Returns a status regarding a shape in a finderprocess - forward means bound with same orientation - reversed means bound with reverse orientation - external means not bound - internal is not used.

Parameters
----------
FP: Transfer_FinderProcess
shape: TopoDS_Shape

Returns
-------
TopAbs_Orientation
") ShapeState;
		static TopAbs_Orientation ShapeState(const opencascade::handle<Transfer_FinderProcess> & FP, const TopoDS_Shape & shape);

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "Gets the shapes recorded in a transientprocess as result of a transfer, considers roots only or all results according <rootsonly>, returns them as a hsequence.

Parameters
----------
TP: Transfer_TransientProcess
rootsonly: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") Shapes;
		static opencascade::handle<TopTools_HSequenceOfShape> Shapes(const opencascade::handle<Transfer_TransientProcess> & TP, const Standard_Boolean rootsonly = Standard_True);

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "Gets the shapes recorded in a transientprocess as result of a transfer, for a given list of starting entities, returns the shapes as a hsequence.

Parameters
----------
TP: Transfer_TransientProcess
list: TColStd_HSequenceOfTransient

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") Shapes;
		static opencascade::handle<TopTools_HSequenceOfShape> Shapes(const opencascade::handle<Transfer_TransientProcess> & TP, const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** TransferResultInfo ******************/
		%feature("compactdefaultargs") TransferResultInfo;
		%feature("autodoc", "Fills sequence of transferresultinfo for each type of entity given in the entitytypes (entity are given as objects). method iskind applied to the entities in tp is used to compare with entities in entitytypes. topabs_shapeenum).

Parameters
----------
TP: Transfer_TransientProcess
EntityTypes: TColStd_HSequenceOfTransient
InfoSeq: TransferBRep_HSequenceOfTransferResultInfo

Returns
-------
None
") TransferResultInfo;
		static void TransferResultInfo(const opencascade::handle<Transfer_TransientProcess> & TP, const opencascade::handle<TColStd_HSequenceOfTransient> & EntityTypes, opencascade::handle<TransferBRep_HSequenceOfTransferResultInfo> & InfoSeq);

		/****************** TransferResultInfo ******************/
		%feature("compactdefaultargs") TransferResultInfo;
		%feature("autodoc", "Fills sequence of transferresultinfo for each type of shape given in the shapetypes (which are in fact considered as topabs_shapeenum). the finders in the fp are considered as shapemappers.

Parameters
----------
FP: Transfer_FinderProcess
ShapeTypes: TColStd_HSequenceOfInteger
InfoSeq: TransferBRep_HSequenceOfTransferResultInfo

Returns
-------
None
") TransferResultInfo;
		static void TransferResultInfo(const opencascade::handle<Transfer_FinderProcess> & FP, const opencascade::handle<TColStd_HSequenceOfInteger> & ShapeTypes, opencascade::handle<TransferBRep_HSequenceOfTransferResultInfo> & InfoSeq);

		/****************** TransientFromShape ******************/
		%feature("compactdefaultargs") TransientFromShape;
		%feature("autodoc", "Returns the result as pure transient attached to a shape first one if multiple result.

Parameters
----------
FP: Transfer_FinderProcess
shape: TopoDS_Shape

Returns
-------
opencascade::handle<Standard_Transient>
") TransientFromShape;
		static opencascade::handle<Standard_Transient> TransientFromShape(const opencascade::handle<Transfer_FinderProcess> & FP, const TopoDS_Shape & shape);

};


%extend TransferBRep {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def BRepCheck(self):
		pass
	}
};

/***********************************
* class TransferBRep_BinderOfShape *
***********************************/
class TransferBRep_BinderOfShape : public Transfer_Binder {
	public:
		/****************** TransferBRep_BinderOfShape ******************/
		%feature("compactdefaultargs") TransferBRep_BinderOfShape;
		%feature("autodoc", "Normal standard constructor, creates an empty binderofshape.

Returns
-------
None
") TransferBRep_BinderOfShape;
		 TransferBRep_BinderOfShape();

		/****************** TransferBRep_BinderOfShape ******************/
		%feature("compactdefaultargs") TransferBRep_BinderOfShape;
		%feature("autodoc", "Constructor which in the same time defines the result returns true if a starting object is bound with several results : here, returns allways false but it can have next results.

Parameters
----------
res: TopoDS_Shape

Returns
-------
None
") TransferBRep_BinderOfShape;
		 TransferBRep_BinderOfShape(const TopoDS_Shape & res);

		/****************** CResult ******************/
		%feature("compactdefaultargs") CResult;
		%feature("autodoc", "Returns the defined result, if there is one, and allows to change it (avoids result + setresult). admits that result can be not yet defined warning : a call to cresult causes result to be known as defined.

Returns
-------
TopoDS_Shape
") CResult;
		TopoDS_Shape CResult();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns the defined result, if there is one.

Returns
-------
TopoDS_Shape
") Result;
		const TopoDS_Shape Result();

		/****************** ResultType ******************/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Returns the type permitted for the result, i.e. the type of the parameter class <shape from topods> (statically defined).

Returns
-------
opencascade::handle<Standard_Type>
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****************** ResultTypeName ******************/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Returns the type name computed for the result (dynamic).

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
res: TopoDS_Shape

Returns
-------
None
") SetResult;
		void SetResult(const TopoDS_Shape & res);

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
		/****************** TransferBRep_OrientedShapeMapper ******************/
		%feature("compactdefaultargs") TransferBRep_OrientedShapeMapper;
		%feature("autodoc", "Creates a mapper with a value. this value can then not be changed. it is used by the hasher to compute the hashcode, which will then be stored for an immediate reading.

Parameters
----------
akey: TopoDS_Shape

Returns
-------
None
") TransferBRep_OrientedShapeMapper;
		 TransferBRep_OrientedShapeMapper(const TopoDS_Shape & akey);

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
TopoDS_Shape
") Value;
		const TopoDS_Shape Value();

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
		/****************** TransferBRep_Reader ******************/
		%feature("compactdefaultargs") TransferBRep_Reader;
		%feature("autodoc", "Initializes a non-specialised reader. typically, for each norm or protocol, is will be required to define a specific create to load a file and transfer it.

Returns
-------
None
") TransferBRep_Reader;
		 TransferBRep_Reader();

		/****************** Actor ******************/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Returns the recorded actor.

Returns
-------
opencascade::handle<Transfer_ActorOfTransientProcess>
") Actor;
		virtual opencascade::handle<Transfer_ActorOfTransientProcess> Actor();

		/****************** BeginTransfer ******************/
		%feature("compactdefaultargs") BeginTransfer;
		%feature("autodoc", "Initializes the reader for a transfer (one,roots, or list) also calls preparetransfer returns true when done, false if could not be done.

Returns
-------
bool
") BeginTransfer;
		Standard_Boolean BeginTransfer();

		/****************** CheckListModel ******************/
		%feature("compactdefaultargs") CheckListModel;
		%feature("autodoc", "Checks the model (complete : syntax + semantic) and returns the produced check list.

Returns
-------
Interface_CheckIterator
") CheckListModel;
		Interface_CheckIterator CheckListModel();

		/****************** CheckListResult ******************/
		%feature("compactdefaultargs") CheckListResult;
		%feature("autodoc", "Checks the result of last transfer (individual or roots, no cumulation on several transfers) and returns the produced list.

Returns
-------
Interface_CheckIterator
") CheckListResult;
		Interface_CheckIterator CheckListResult();

		/****************** CheckStatusModel ******************/
		%feature("compactdefaultargs") CheckStatusModel;
		%feature("autodoc", "Checks the model. returns true if there is no fail at all (regardless warnings) if <withprint> is true, also sends checks on standard output.

Parameters
----------
withprint: bool

Returns
-------
bool
") CheckStatusModel;
		Standard_Boolean CheckStatusModel(const Standard_Boolean withprint);

		/****************** CheckStatusResult ******************/
		%feature("compactdefaultargs") CheckStatusResult;
		%feature("autodoc", "Checks the result of last transfer (individual or roots, no cumulation on several transfers). returns true if no fail occured during transfer (queries the transientprocess).

Parameters
----------
withprints: bool

Returns
-------
bool
") CheckStatusResult;
		Standard_Boolean CheckStatusResult(const Standard_Boolean withprints);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the result and done status. but not the model.

Returns
-------
None
") Clear;
		void Clear();

		/****************** EndTransfer ******************/
		%feature("compactdefaultargs") EndTransfer;
		%feature("autodoc", "Ebds a transfer (one, roots or list) by recording its result.

Returns
-------
None
") EndTransfer;
		void EndTransfer();

		/****************** FileNotFound ******************/
		%feature("compactdefaultargs") FileNotFound;
		%feature("autodoc", "Returns true if filestatus is for filenotfound.

Returns
-------
bool
") FileNotFound;
		Standard_Boolean FileNotFound();

		/****************** FileStatus ******************/
		%feature("compactdefaultargs") FileStatus;
		%feature("autodoc", "Returns the file status.

Returns
-------
int
") FileStatus;
		Standard_Integer FileStatus();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the last transfer/transferroots was a success.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();


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
		%feature("autodoc", "Returns the model to be worked on.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Returns the count of produced shapes (roots).

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** NbTransients ******************/
		%feature("compactdefaultargs") NbTransients;
		%feature("autodoc", "Returns the count of produced transient results (roots).

Returns
-------
int
") NbTransients;
		Standard_Integer NbTransients();

		/****************** OneShape ******************/
		%feature("compactdefaultargs") OneShape;
		%feature("autodoc", "Returns a unique shape for the result : - a void shape (type = shape) if result is empty - a simple shape if result has only one : returns this one - a compound if result has more than one shape.

Returns
-------
TopoDS_Shape
") OneShape;
		TopoDS_Shape OneShape();

		/****************** PrepareTransfer ******************/
		%feature("compactdefaultargs") PrepareTransfer;
		%feature("autodoc", "Prepares the transfer. also can act on the actor or change the transientprocess if required. should not set the actor into the transientprocess, it is done by caller. the provided default does nothing.

Returns
-------
None
") PrepareTransfer;
		virtual void PrepareTransfer();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the recorded protocol.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		virtual opencascade::handle<Interface_Protocol> Protocol();

		/****************** SetActor ******************/
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "Records the actor to be used for transfers.

Parameters
----------
actor: Transfer_ActorOfTransientProcess

Returns
-------
None
") SetActor;
		void SetActor(const opencascade::handle<Transfer_ActorOfTransientProcess> & actor);

		/****************** SetFileStatus ******************/
		%feature("compactdefaultargs") SetFileStatus;
		%feature("autodoc", "Sets file status to be interpreted as follows : = 0 ok < 0 file not found > 0 read error, no model could be created.

Parameters
----------
status: int

Returns
-------
None
") SetFileStatus;
		void SetFileStatus(const Standard_Integer status);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "Specifies a model to work on also clears the result and done status.

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
None
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** SetProtocol ******************/
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "Records the protocol to be used for read and transfer roots.

Parameters
----------
protocol: Interface_Protocol

Returns
-------
None
") SetProtocol;
		void SetProtocol(const opencascade::handle<Interface_Protocol> & protocol);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns a shape given its rank, by default the first one.

Parameters
----------
num: int,optional
	default value is 1

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape(const Standard_Integer num = 1);

		/****************** ShapeResult ******************/
		%feature("compactdefaultargs") ShapeResult;
		%feature("autodoc", "Returns a shape produced from a given entity (if it was individually transferred or if an intermediate result is known). if no shape is bound with <ent>, returns a null shape warning : runs on the last call to transfer,transferroots,transferlist.

Parameters
----------
ent: Standard_Transient

Returns
-------
TopoDS_Shape
") ShapeResult;
		TopoDS_Shape ShapeResult(const opencascade::handle<Standard_Transient> & ent);

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "Returns the complete list of produced shapes.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") Shapes;
		opencascade::handle<TopTools_HSequenceOfShape> Shapes();

		/****************** SyntaxError ******************/
		%feature("compactdefaultargs") SyntaxError;
		%feature("autodoc", "Returns true if filestatus is for error during read (major error; for local error, see checkmodel).

Returns
-------
bool
") SyntaxError;
		Standard_Boolean SyntaxError();

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "Transfers an entity given its rank in the model (root or not) returns true if it is recognized as geom-topol. (but it can have failed : see isdone).

Parameters
----------
num: int

Returns
-------
bool
") Transfer;
		virtual Standard_Boolean Transfer(const Standard_Integer num);

		/****************** TransferList ******************/
		%feature("compactdefaultargs") TransferList;
		%feature("autodoc", "Transfers a list of entities (only the ones also in the model) remark : former result is cleared.

Parameters
----------
list: TColStd_HSequenceOfTransient

Returns
-------
None
") TransferList;
		virtual void TransferList(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** TransferRoots ******************/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "Transfers all root entities which are recognized as geom-topol the result will be a list of shapes. this method calls user redefinable preparetransfer remark : former result is cleared.

Returns
-------
None
") TransferRoots;
		virtual void TransferRoots();

		/****************** Transient ******************/
		%feature("compactdefaultargs") Transient;
		%feature("autodoc", "Returns a transient root result, given its rank (by default the first one).

Parameters
----------
num: int,optional
	default value is 1

Returns
-------
opencascade::handle<Standard_Transient>
") Transient;
		opencascade::handle<Standard_Transient> Transient(const Standard_Integer num = 1);

		/****************** TransientProcess ******************/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Returns the transientprocess. it records informations about the very last transfer done. null if no transfer yet done. can be used for queries more accurate than the default ones.

Returns
-------
opencascade::handle<Transfer_TransientProcess>
") TransientProcess;
		opencascade::handle<Transfer_TransientProcess> TransientProcess();

		/****************** Transients ******************/
		%feature("compactdefaultargs") Transients;
		%feature("autodoc", "Returns the complete list of produced transient results.

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") Transients;
		opencascade::handle<TColStd_HSequenceOfTransient> Transients();

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
		%feature("autodoc", "Returns the type attached to an object here, tshape (shape has no dynamic type).

Parameters
----------
ent: TopoDS_Shape

Returns
-------
opencascade::handle<Standard_Type>
") Type;
		static opencascade::handle<Standard_Type> Type(const TopoDS_Shape & ent);

		/****************** TypeName ******************/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "Returns type name (string) here, the true name of the type of a shape.

Parameters
----------
ent: TopoDS_Shape

Returns
-------
char *
") TypeName;
		static const char * TypeName(const TopoDS_Shape & ent);

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
		/****************** TransferBRep_ShapeListBinder ******************/
		%feature("compactdefaultargs") TransferBRep_ShapeListBinder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TransferBRep_ShapeListBinder;
		 TransferBRep_ShapeListBinder();

		/****************** TransferBRep_ShapeListBinder ******************/
		%feature("compactdefaultargs") TransferBRep_ShapeListBinder;
		%feature("autodoc", "No available documentation.

Parameters
----------
list: TopTools_HSequenceOfShape

Returns
-------
None
") TransferBRep_ShapeListBinder;
		 TransferBRep_ShapeListBinder(const opencascade::handle<TopTools_HSequenceOfShape> & list);

		/****************** AddResult ******************/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "Adds an item to the result list.

Parameters
----------
res: TopoDS_Shape

Returns
-------
None
") AddResult;
		void AddResult(const TopoDS_Shape & res);

		/****************** CompSolid ******************/
		%feature("compactdefaultargs") CompSolid;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
TopoDS_CompSolid
") CompSolid;
		TopoDS_CompSolid CompSolid(const Standard_Integer num);

		/****************** Compound ******************/
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
TopoDS_Compound
") Compound;
		TopoDS_Compound Compound(const Standard_Integer num);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
TopoDS_Edge
") Edge;
		TopoDS_Edge Edge(const Standard_Integer num);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
TopoDS_Face
") Face;
		TopoDS_Face Face(const Standard_Integer num);

		/****************** IsMultiple ******************/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsMultiple;
		virtual Standard_Boolean IsMultiple();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") Result;
		opencascade::handle<TopTools_HSequenceOfShape> Result();

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
res: TopoDS_Shape

Returns
-------
None
") SetResult;
		void SetResult(const Standard_Integer num, const TopoDS_Shape & res);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape(const Standard_Integer num);

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType(const Standard_Integer num);

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
TopoDS_Shell
") Shell;
		TopoDS_Shell Shell(const Standard_Integer num);

		/****************** Solid ******************/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
TopoDS_Solid
") Solid;
		TopoDS_Solid Solid(const Standard_Integer num);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
TopoDS_Vertex
") Vertex;
		TopoDS_Vertex Vertex(const Standard_Integer num);

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
TopoDS_Wire
") Wire;
		TopoDS_Wire Wire(const Standard_Integer num);

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
		/****************** TransferBRep_ShapeMapper ******************/
		%feature("compactdefaultargs") TransferBRep_ShapeMapper;
		%feature("autodoc", "Creates a mapper with a value. this value can then not be changed. it is used by the hasher to compute the hashcode, which will then be stored for an immediate reading.

Parameters
----------
akey: TopoDS_Shape

Returns
-------
None
") TransferBRep_ShapeMapper;
		 TransferBRep_ShapeMapper(const TopoDS_Shape & akey);

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
TopoDS_Shape
") Value;
		const TopoDS_Shape Value();

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
		/****************** TransferBRep_TransferResultInfo ******************/
		%feature("compactdefaultargs") TransferBRep_TransferResultInfo;
		%feature("autodoc", "Creates object with all fields nullified.

Returns
-------
None
") TransferBRep_TransferResultInfo;
		 TransferBRep_TransferResultInfo();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Resets all the fields.

Returns
-------
None
") Clear;
		void Clear();


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
		/****************** TransferBRep_ShapeBinder ******************/
		%feature("compactdefaultargs") TransferBRep_ShapeBinder;
		%feature("autodoc", "Creates an empty shapebinder.

Returns
-------
None
") TransferBRep_ShapeBinder;
		 TransferBRep_ShapeBinder();

		/****************** TransferBRep_ShapeBinder ******************/
		%feature("compactdefaultargs") TransferBRep_ShapeBinder;
		%feature("autodoc", "Creates a shapebinder with a result.

Parameters
----------
res: TopoDS_Shape

Returns
-------
None
") TransferBRep_ShapeBinder;
		 TransferBRep_ShapeBinder(const TopoDS_Shape & res);

		/****************** CompSolid ******************/
		%feature("compactdefaultargs") CompSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_CompSolid
") CompSolid;
		TopoDS_CompSolid CompSolid();

		/****************** Compound ******************/
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Compound
") Compound;
		TopoDS_Compound Compound();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") Edge;
		TopoDS_Edge Edge();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		TopoDS_Face Face();

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns the type of the shape result (under topabs form).

Returns
-------
TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shell
") Shell;
		TopoDS_Shell Shell();

		/****************** Solid ******************/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Solid
") Solid;
		TopoDS_Solid Solid();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
") Vertex;
		TopoDS_Vertex Vertex();

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Wire
") Wire;
		TopoDS_Wire Wire();

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


