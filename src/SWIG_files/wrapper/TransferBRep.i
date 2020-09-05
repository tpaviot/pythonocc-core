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
from enum import IntEnum
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

%extend NCollection_Sequence<opencascade::handle<TransferBRep_TransferResultInfo>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/**** md5 signature: c02b98d5297a356378bb3f680a1d32cc ****/
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
		/**** md5 signature: 11c1388c4c4067c53fe8aa3d82893878 ****/
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
		/**** md5 signature: 8d10365a883cad7d4c4020ff84899f9f ****/
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
		/**** md5 signature: 70d322420eec79e1a0fa615f977961de ****/
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
		/**** md5 signature: 37e46c9522e4067fe15baae592593088 ****/
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
		/**** md5 signature: 61291e9ced9a75f743abb463d4e79840 ****/
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
		/**** md5 signature: 76ac9cb698250eada9e6a6c290c35850 ****/
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
		/**** md5 signature: dee0650dd6340fc5e3e83429530791bf ****/
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
		/**** md5 signature: 4fd026f629492842396269b05b4a1fdb ****/
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
		/**** md5 signature: a0504e67c5abdcde2c87e808c901fce0 ****/
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
		/**** md5 signature: 4020440d399de535815869f5144d80c8 ****/
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
		/**** md5 signature: 7f75b3753823e021780769d84b8dba9b ****/
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
		/**** md5 signature: 5cb69fb0fd505614728cd43a56a8c3cb ****/
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
		/**** md5 signature: a53000cb23554ab000bc5b84b079d910 ****/
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
		/**** md5 signature: 534e95ac62c75feb3ba7977bd718b832 ****/
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
		/**** md5 signature: 2bd2c7e3962729a4433aaf4ea583df8d ****/
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
		/**** md5 signature: ac27ec8ebd551812170c1783235621b5 ****/
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
		/**** md5 signature: 0e24b6a0d05d6367cba79758e65a3ba6 ****/
		%feature("compactdefaultargs") TransferBRep_BinderOfShape;
		%feature("autodoc", "Normal standard constructor, creates an empty binderofshape.

Returns
-------
None
") TransferBRep_BinderOfShape;
		 TransferBRep_BinderOfShape();

		/****************** TransferBRep_BinderOfShape ******************/
		/**** md5 signature: 5bbec8d38c7e9144c260dddea617f54e ****/
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
		/**** md5 signature: 53f029a1cda5ba243bdce0cbc426b382 ****/
		%feature("compactdefaultargs") CResult;
		%feature("autodoc", "Returns the defined result, if there is one, and allows to change it (avoids result + setresult). admits that result can be not yet defined warning : a call to cresult causes result to be known as defined.

Returns
-------
TopoDS_Shape
") CResult;
		TopoDS_Shape CResult();

		/****************** Result ******************/
		/**** md5 signature: 64e8e20a963b00a422945949bd4e1549 ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns the defined result, if there is one.

Returns
-------
TopoDS_Shape
") Result;
		const TopoDS_Shape Result();

		/****************** ResultType ******************/
		/**** md5 signature: 3e5db9429dee8b51366aef182b0d44a1 ****/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Returns the type permitted for the result, i.e. the type of the parameter class <shape from topods> (statically defined).

Returns
-------
opencascade::handle<Standard_Type>
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****************** ResultTypeName ******************/
		/**** md5 signature: 7c976254948a22ef88ad8fdce635402f ****/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Returns the type name computed for the result (dynamic).

Returns
-------
char *
") ResultTypeName;
		const char * ResultTypeName();

		/****************** SetResult ******************/
		/**** md5 signature: b581a5ff3d4839af932b887a85802930 ****/
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
		/**** md5 signature: 0b4e06a9db31fff4671aff2e303ee765 ****/
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
		/**** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the contained value.

Returns
-------
TopoDS_Shape
") Value;
		const TopoDS_Shape Value();

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
		/**** md5 signature: 89b0c1d65ba0c3b72390a67124ed8e2f ****/
		%feature("compactdefaultargs") TransferBRep_Reader;
		%feature("autodoc", "Initializes a non-specialised reader. typically, for each norm or protocol, is will be required to define a specific create to load a file and transfer it.

Returns
-------
None
") TransferBRep_Reader;
		 TransferBRep_Reader();

		/****************** Actor ******************/
		/**** md5 signature: 46a9a8cd830c8bb4239c308f6a760b1a ****/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Returns the recorded actor.

Returns
-------
opencascade::handle<Transfer_ActorOfTransientProcess>
") Actor;
		virtual opencascade::handle<Transfer_ActorOfTransientProcess> Actor();

		/****************** BeginTransfer ******************/
		/**** md5 signature: 45b9be9b944a95886bf096a49eb0bf8e ****/
		%feature("compactdefaultargs") BeginTransfer;
		%feature("autodoc", "Initializes the reader for a transfer (one,roots, or list) also calls preparetransfer returns true when done, false if could not be done.

Returns
-------
bool
") BeginTransfer;
		Standard_Boolean BeginTransfer();

		/****************** CheckListModel ******************/
		/**** md5 signature: 24d00665e95599b309f8e96a1b949c12 ****/
		%feature("compactdefaultargs") CheckListModel;
		%feature("autodoc", "Checks the model (complete : syntax + semantic) and returns the produced check list.

Returns
-------
Interface_CheckIterator
") CheckListModel;
		Interface_CheckIterator CheckListModel();

		/****************** CheckListResult ******************/
		/**** md5 signature: 735cbc3fc13291439d3a0828abcd3f6a ****/
		%feature("compactdefaultargs") CheckListResult;
		%feature("autodoc", "Checks the result of last transfer (individual or roots, no cumulation on several transfers) and returns the produced list.

Returns
-------
Interface_CheckIterator
") CheckListResult;
		Interface_CheckIterator CheckListResult();

		/****************** CheckStatusModel ******************/
		/**** md5 signature: 870c8266590633214733e675fb7f8dfa ****/
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
		/**** md5 signature: 331854297e3a398f63c12a5f55682ab2 ****/
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
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the result and done status. but not the model.

Returns
-------
None
") Clear;
		void Clear();

		/****************** EndTransfer ******************/
		/**** md5 signature: 743e3133a27f1051b31de826812cac18 ****/
		%feature("compactdefaultargs") EndTransfer;
		%feature("autodoc", "Ebds a transfer (one, roots or list) by recording its result.

Returns
-------
None
") EndTransfer;
		void EndTransfer();

		/****************** FileNotFound ******************/
		/**** md5 signature: 86b2480c0f386323f5deab3669dec3a3 ****/
		%feature("compactdefaultargs") FileNotFound;
		%feature("autodoc", "Returns true if filestatus is for filenotfound.

Returns
-------
bool
") FileNotFound;
		Standard_Boolean FileNotFound();

		/****************** FileStatus ******************/
		/**** md5 signature: 6a634e5454e1bf22f52b13e24d6e2c9c ****/
		%feature("compactdefaultargs") FileStatus;
		%feature("autodoc", "Returns the file status.

Returns
-------
int
") FileStatus;
		Standard_Integer FileStatus();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
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
		/**** md5 signature: aa6e85fbf0fa37084c702759534fae8b ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model to be worked on.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** NbShapes ******************/
		/**** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ****/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Returns the count of produced shapes (roots).

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** NbTransients ******************/
		/**** md5 signature: 9436b9a550cdb03fdd33d4f80aca7526 ****/
		%feature("compactdefaultargs") NbTransients;
		%feature("autodoc", "Returns the count of produced transient results (roots).

Returns
-------
int
") NbTransients;
		Standard_Integer NbTransients();

		/****************** OneShape ******************/
		/**** md5 signature: 1fc1610db08b4eec83d275771d406ea5 ****/
		%feature("compactdefaultargs") OneShape;
		%feature("autodoc", "Returns a unique shape for the result : - a void shape (type = shape) if result is empty - a simple shape if result has only one : returns this one - a compound if result has more than one shape.

Returns
-------
TopoDS_Shape
") OneShape;
		TopoDS_Shape OneShape();

		/****************** PrepareTransfer ******************/
		/**** md5 signature: ce6478f9210f4516f371381d8d9e7659 ****/
		%feature("compactdefaultargs") PrepareTransfer;
		%feature("autodoc", "Prepares the transfer. also can act on the actor or change the transientprocess if required. should not set the actor into the transientprocess, it is done by caller. the provided default does nothing.

Returns
-------
None
") PrepareTransfer;
		virtual void PrepareTransfer();

		/****************** Protocol ******************/
		/**** md5 signature: 2dce80af32cedc07d353d312ab7e2c73 ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the recorded protocol.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		virtual opencascade::handle<Interface_Protocol> Protocol();

		/****************** SetActor ******************/
		/**** md5 signature: 8596f1237d29d2baaa927fcdaa1a0f89 ****/
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
		/**** md5 signature: 74a715d4bf31def1e0a74262f5c53207 ****/
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
		/**** md5 signature: 70328a97cec44e457500ce3b002efc49 ****/
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
		/**** md5 signature: 032ba93c3a9bfe80213c23be9d305675 ****/
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
		/**** md5 signature: 1e795d69b15f05ab57c59b0afbc57ddf ****/
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
		/**** md5 signature: 01e36bf3f5ba5a6d1aefe4e9aed8c7f6 ****/
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
		/**** md5 signature: fbd983721ce2925a93d47fdb2eb2a61d ****/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "Returns the complete list of produced shapes.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") Shapes;
		opencascade::handle<TopTools_HSequenceOfShape> Shapes();

		/****************** SyntaxError ******************/
		/**** md5 signature: fa9da864765cf509ba7abf0725188a11 ****/
		%feature("compactdefaultargs") SyntaxError;
		%feature("autodoc", "Returns true if filestatus is for error during read (major error; for local error, see checkmodel).

Returns
-------
bool
") SyntaxError;
		Standard_Boolean SyntaxError();

		/****************** Transfer ******************/
		/**** md5 signature: 67ea450302048d3fc553ce9bb8ed59c7 ****/
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
		/**** md5 signature: 71147395c2cac29dca2d965cdb93c440 ****/
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
		/**** md5 signature: d9fa90c4a1041c991bbc3f82979c4c93 ****/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "Transfers all root entities which are recognized as geom-topol the result will be a list of shapes. this method calls user redefinable preparetransfer remark : former result is cleared.

Returns
-------
None
") TransferRoots;
		virtual void TransferRoots();

		/****************** Transient ******************/
		/**** md5 signature: f74282777e87422dedb9fd96d2ddb7db ****/
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
		/**** md5 signature: cda5aa33365159e82c6213003de44419 ****/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Returns the transientprocess. it records informations about the very last transfer done. null if no transfer yet done. can be used for queries more accurate than the default ones.

Returns
-------
opencascade::handle<Transfer_TransientProcess>
") TransientProcess;
		opencascade::handle<Transfer_TransientProcess> TransientProcess();

		/****************** Transients ******************/
		/**** md5 signature: 6b153a63c3c643b1b8e66b074c9eb931 ****/
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
		/**** md5 signature: 91a19cb485904b6668adaf1ff44c9776 ****/
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
		/**** md5 signature: 9e3258fdb4a63ed1b39e111643bdaf36 ****/
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
		/**** md5 signature: c3dd8723ad1305f04db0647f85cc094a ****/
		%feature("compactdefaultargs") TransferBRep_ShapeListBinder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TransferBRep_ShapeListBinder;
		 TransferBRep_ShapeListBinder();

		/****************** TransferBRep_ShapeListBinder ******************/
		/**** md5 signature: b18999de218159d56d773f7587711b9b ****/
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
		/**** md5 signature: 307f4fac54065cc112d1d37fa0ba84d6 ****/
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
		/**** md5 signature: 85f821a9b9b0553edcd2a0c068013325 ****/
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
		/**** md5 signature: ffc423e6583d2e74cfed179181df389f ****/
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
		/**** md5 signature: 825841bc4e9a24f9987724fcade8ecd7 ****/
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
		/**** md5 signature: 67e12ab0b51b730d66350be5ffa1f96e ****/
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
		/**** md5 signature: 17145d71daab4028b6c7195d5ff772ce ****/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsMultiple;
		virtual Standard_Boolean IsMultiple();

		/****************** NbShapes ******************/
		/**** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ****/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** Result ******************/
		/**** md5 signature: c4dc32098a28d0345ee9f33c9098c832 ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") Result;
		opencascade::handle<TopTools_HSequenceOfShape> Result();

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
		/**** md5 signature: ce058a0f2fb955a00dd16b642d73ddf3 ****/
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
		/**** md5 signature: 57dfd33e11a02b943ed7391444b46691 ****/
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
		/**** md5 signature: 8f05332249aefadde782b65391e51fe2 ****/
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
		/**** md5 signature: f705fa0e2e8d1270514f2e407eafc945 ****/
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
		/**** md5 signature: eaaa658fc5bdc6be52c2ddaf73d8d00d ****/
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
		/**** md5 signature: f53b5dfd31ebea2646e668d6f9b14e1d ****/
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
		/**** md5 signature: ea366fc3cbbdc5a77a2dfe378186f7fc ****/
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
		/**** md5 signature: c3571f808924632b111649c121419b7c ****/
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
		/**** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the contained value.

Returns
-------
TopoDS_Shape
") Value;
		const TopoDS_Shape Value();

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
		/**** md5 signature: 5bd1437d5d446d705e7e47ecef5d002a ****/
		%feature("compactdefaultargs") TransferBRep_TransferResultInfo;
		%feature("autodoc", "Creates object with all fields nullified.

Returns
-------
None
") TransferBRep_TransferResultInfo;
		 TransferBRep_TransferResultInfo();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
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
		/**** md5 signature: f2a1ad7d416d197c0c7feca62a391246 ****/
		%feature("compactdefaultargs") TransferBRep_ShapeBinder;
		%feature("autodoc", "Creates an empty shapebinder.

Returns
-------
None
") TransferBRep_ShapeBinder;
		 TransferBRep_ShapeBinder();

		/****************** TransferBRep_ShapeBinder ******************/
		/**** md5 signature: 866088ebdf7b5fb1a5d84caf583fd813 ****/
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
		/**** md5 signature: 2f1538abf8b930e68dc945fc6b8e5827 ****/
		%feature("compactdefaultargs") CompSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_CompSolid
") CompSolid;
		TopoDS_CompSolid CompSolid();

		/****************** Compound ******************/
		/**** md5 signature: 874212d5c1b1bb5c4c6e5c365d29670c ****/
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Compound
") Compound;
		TopoDS_Compound Compound();

		/****************** Edge ******************/
		/**** md5 signature: 5fb4bdbeb7451241dd04cd0c90c043ff ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") Edge;
		TopoDS_Edge Edge();

		/****************** Face ******************/
		/**** md5 signature: 64c75db1e9c1285068e9dd474618f74f ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		TopoDS_Face Face();

		/****************** ShapeType ******************/
		/**** md5 signature: fdb6bbab82f138b7eb96684b837c482d ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns the type of the shape result (under topabs form).

Returns
-------
TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****************** Shell ******************/
		/**** md5 signature: 3ea4686086a18491532865f1cfbce9ad ****/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shell
") Shell;
		TopoDS_Shell Shell();

		/****************** Solid ******************/
		/**** md5 signature: d3b8301796e7f37ff3cd00563df75b66 ****/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Solid
") Solid;
		TopoDS_Solid Solid();

		/****************** Vertex ******************/
		/**** md5 signature: f00980db3d22a7e6d7f5f1300940ccaa ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
") Vertex;
		TopoDS_Vertex Vertex();

		/****************** Wire ******************/
		/**** md5 signature: 2fe6e5f402158cff91e9020fddff92e6 ****/
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
class TransferBRep_HSequenceOfTransferResultInfo : public TransferBRep_SequenceOfTransferResultInfo, public Standard_Transient {
  public:
    TransferBRep_HSequenceOfTransferResultInfo();
    TransferBRep_HSequenceOfTransferResultInfo(const TransferBRep_SequenceOfTransferResultInfo& theOther);
    const TransferBRep_SequenceOfTransferResultInfo& Sequence();
    void Append (const TransferBRep_SequenceOfTransferResultInfo::value_type& theItem);
    void Append (TransferBRep_SequenceOfTransferResultInfo& theSequence);
    TransferBRep_SequenceOfTransferResultInfo& ChangeSequence();
};
%make_alias(TransferBRep_HSequenceOfTransferResultInfo)


