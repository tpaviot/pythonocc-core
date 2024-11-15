/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_transferbrep.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TransferBRep_BinderOfShape)
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
		/****** TransferBRep::CheckObject ******/
		/****** md5 signature: c02b98d5297a356378bb3f680a1d32cc ******/
		%feature("compactdefaultargs") CheckObject;
		%feature("autodoc", "
Parameters
----------
chl: Interface_CheckIterator
obj: Standard_Transient

Return
-------
Interface_CheckIterator

Description
-----------
Returns the check-list bound to a given object, generally none (if ok) or one check. <obj> can be, either a true transient object or entity, or a shapemapper, in that case the shape is considered.
") CheckObject;
		static Interface_CheckIterator CheckObject(const Interface_CheckIterator & chl, const opencascade::handle<Standard_Transient> & obj);

		/****** TransferBRep::Checked ******/
		/****** md5 signature: 11c1388c4c4067c53fe8aa3d82893878 ******/
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "
Parameters
----------
chl: Interface_CheckIterator
alsoshapes: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the list of objects to which a non-empty check is bound in a check-list. objects are transients, they can then be either imagine objects entities for an interface norm. <alsoshapes> commands shapes to be returned too (as shapemapper), see also checkedshapes.
") Checked;
		static opencascade::handle<TColStd_HSequenceOfTransient> Checked(const Interface_CheckIterator & chl, const Standard_Boolean alsoshapes = Standard_False);

		/****** TransferBRep::CheckedShapes ******/
		/****** md5 signature: 8d10365a883cad7d4c4020ff84899f9f ******/
		%feature("compactdefaultargs") CheckedShapes;
		%feature("autodoc", "
Parameters
----------
chl: Interface_CheckIterator

Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
Returns the list of shapes to which a non-empty check is bound in a check-list.
") CheckedShapes;
		static opencascade::handle<TopTools_HSequenceOfShape> CheckedShapes(const Interface_CheckIterator & chl);

		/****** TransferBRep::PrintResultInfo ******/
		/****** md5 signature: 70d322420eec79e1a0fa615f977961de ******/
		%feature("compactdefaultargs") PrintResultInfo;
		%feature("autodoc", "
Parameters
----------
Printer: Message_Printer
Header: Message_Msg
ResultInfo: TransferBRep_TransferResultInfo
printEmpty: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Prints the results of transfer to given priner with given header.
") PrintResultInfo;
		static void PrintResultInfo(const opencascade::handle<Message_Printer> & Printer, const Message_Msg & Header, const opencascade::handle<TransferBRep_TransferResultInfo> & ResultInfo, const Standard_Boolean printEmpty = Standard_True);

		/****** TransferBRep::ResultCheckList ******/
		/****** md5 signature: 37e46c9522e4067fe15baae592593088 ******/
		%feature("compactdefaultargs") ResultCheckList;
		%feature("autodoc", "
Parameters
----------
chl: Interface_CheckIterator
FP: Transfer_FinderProcess
model: Interface_InterfaceModel

Return
-------
Interface_CheckIterator

Description
-----------
Takes a starting checkiterator which brings checks bound with starting objects (shapes, transient from an imagine appli ...) and converts it to a checkiterator in which checks are bound with results in an interfacemodel mapping is recorded in the finderprocess starting objects for which no individual result is recorded remain in their state.
") ResultCheckList;
		static Interface_CheckIterator ResultCheckList(const Interface_CheckIterator & chl, const opencascade::handle<Transfer_FinderProcess> & FP, const opencascade::handle<Interface_InterfaceModel> & model);

		/****** TransferBRep::ResultFromShape ******/
		/****** md5 signature: 61291e9ced9a75f743abb463d4e79840 ******/
		%feature("compactdefaultargs") ResultFromShape;
		%feature("autodoc", "
Parameters
----------
FP: Transfer_FinderProcess
shape: TopoDS_Shape

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
Returns the result (as a binder) attached to a given shape null if none.
") ResultFromShape;
		static opencascade::handle<Transfer_Binder> ResultFromShape(const opencascade::handle<Transfer_FinderProcess> & FP, const TopoDS_Shape & shape);

		/****** TransferBRep::SetShapeResult ******/
		/****** md5 signature: 76ac9cb698250eada9e6a6c290c35850 ******/
		%feature("compactdefaultargs") SetShapeResult;
		%feature("autodoc", "
Parameters
----------
TP: Transfer_TransientProcess
ent: Standard_Transient
result: TopoDS_Shape

Return
-------
None

Description
-----------
Sets a shape as a result for a starting entity <ent> (reverse of shaperesult) it simply creates a shapebinder then binds it to the entity.
") SetShapeResult;
		static void SetShapeResult(const opencascade::handle<Transfer_TransientProcess> & TP, const opencascade::handle<Standard_Transient> & ent, const TopoDS_Shape & result);

		/****** TransferBRep::SetTransientFromShape ******/
		/****** md5 signature: dee0650dd6340fc5e3e83429530791bf ******/
		%feature("compactdefaultargs") SetTransientFromShape;
		%feature("autodoc", "
Parameters
----------
FP: Transfer_FinderProcess
shape: TopoDS_Shape
result: Standard_Transient

Return
-------
None

Description
-----------
Binds a transient result to a shape in a finderprocess (as first result if multiple: does not add it to existing one).
") SetTransientFromShape;
		static void SetTransientFromShape(const opencascade::handle<Transfer_FinderProcess> & FP, const TopoDS_Shape & shape, const opencascade::handle<Standard_Transient> & result);

		/****** TransferBRep::ShapeMapper ******/
		/****** md5 signature: 4fd026f629492842396269b05b4a1fdb ******/
		%feature("compactdefaultargs") ShapeMapper;
		%feature("autodoc", "
Parameters
----------
FP: Transfer_FinderProcess
shape: TopoDS_Shape

Return
-------
opencascade::handle<TransferBRep_ShapeMapper>

Description
-----------
Returns a shapemapper for a given shape (location included) either <shape> is already mapped, then its mapper is returned or it is not, then a new one is created then returned, but it is not mapped here (use bind or findelsebind to do this).
") ShapeMapper;
		static opencascade::handle<TransferBRep_ShapeMapper> ShapeMapper(const opencascade::handle<Transfer_FinderProcess> & FP, const TopoDS_Shape & shape);

		/****** TransferBRep::ShapeResult ******/
		/****** md5 signature: a0504e67c5abdcde2c87e808c901fce0 ******/
		%feature("compactdefaultargs") ShapeResult;
		%feature("autodoc", "
Parameters
----------
binder: Transfer_Binder

Return
-------
TopoDS_Shape

Description
-----------
Get the shape recorded in a binder if the binder brings a multiple result, search for the shape.
") ShapeResult;
		static TopoDS_Shape ShapeResult(const opencascade::handle<Transfer_Binder> & binder);

		/****** TransferBRep::ShapeResult ******/
		/****** md5 signature: 4020440d399de535815869f5144d80c8 ******/
		%feature("compactdefaultargs") ShapeResult;
		%feature("autodoc", "
Parameters
----------
TP: Transfer_TransientProcess
ent: Standard_Transient

Return
-------
TopoDS_Shape

Description
-----------
Get the shape recorded in a transientprocess as result of the transfer of an entity. i.e. in the binder bound to that entity if no result or result not a single shape, returns a null shape.
") ShapeResult;
		static TopoDS_Shape ShapeResult(const opencascade::handle<Transfer_TransientProcess> & TP, const opencascade::handle<Standard_Transient> & ent);

		/****** TransferBRep::ShapeState ******/
		/****** md5 signature: 7f75b3753823e021780769d84b8dba9b ******/
		%feature("compactdefaultargs") ShapeState;
		%feature("autodoc", "
Parameters
----------
FP: Transfer_FinderProcess
shape: TopoDS_Shape

Return
-------
TopAbs_Orientation

Description
-----------
Returns a status regarding a shape in a finderprocess - forward means bound with same orientation - reversed means bound with reverse orientation - external means not bound - internal is not used.
") ShapeState;
		static TopAbs_Orientation ShapeState(const opencascade::handle<Transfer_FinderProcess> & FP, const TopoDS_Shape & shape);

		/****** TransferBRep::Shapes ******/
		/****** md5 signature: 5cb69fb0fd505614728cd43a56a8c3cb ******/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "
Parameters
----------
TP: Transfer_TransientProcess
rootsonly: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
Gets the shapes recorded in a transientprocess as result of a transfer, considers roots only or all results according <rootsonly>, returns them as a hsequence.
") Shapes;
		static opencascade::handle<TopTools_HSequenceOfShape> Shapes(const opencascade::handle<Transfer_TransientProcess> & TP, const Standard_Boolean rootsonly = Standard_True);

		/****** TransferBRep::Shapes ******/
		/****** md5 signature: a53000cb23554ab000bc5b84b079d910 ******/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "
Parameters
----------
TP: Transfer_TransientProcess
list: TColStd_HSequenceOfTransient

Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
Gets the shapes recorded in a transientprocess as result of a transfer, for a given list of starting entities, returns the shapes as a hsequence.
") Shapes;
		static opencascade::handle<TopTools_HSequenceOfShape> Shapes(const opencascade::handle<Transfer_TransientProcess> & TP, const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****** TransferBRep::TransferResultInfo ******/
		/****** md5 signature: 534e95ac62c75feb3ba7977bd718b832 ******/
		%feature("compactdefaultargs") TransferResultInfo;
		%feature("autodoc", "
Parameters
----------
TP: Transfer_TransientProcess
EntityTypes: TColStd_HSequenceOfTransient
InfoSeq: TransferBRep_HSequenceOfTransferResultInfo

Return
-------
None

Description
-----------
Fills sequence of transferresultinfo for each type of entity given in the entitytypes (entity are given as objects). method iskind applied to the entities in tp is used to compare with entities in entitytypes. topabs_shapeenum).
") TransferResultInfo;
		static void TransferResultInfo(const opencascade::handle<Transfer_TransientProcess> & TP, const opencascade::handle<TColStd_HSequenceOfTransient> & EntityTypes, opencascade::handle<TransferBRep_HSequenceOfTransferResultInfo> & InfoSeq);

		/****** TransferBRep::TransferResultInfo ******/
		/****** md5 signature: 2bd2c7e3962729a4433aaf4ea583df8d ******/
		%feature("compactdefaultargs") TransferResultInfo;
		%feature("autodoc", "
Parameters
----------
FP: Transfer_FinderProcess
ShapeTypes: TColStd_HSequenceOfInteger
InfoSeq: TransferBRep_HSequenceOfTransferResultInfo

Return
-------
None

Description
-----------
Fills sequence of transferresultinfo for each type of shape given in the shapetypes (which are in fact considered as topabs_shapeenum). the finders in the fp are considered as shapemappers.
") TransferResultInfo;
		static void TransferResultInfo(const opencascade::handle<Transfer_FinderProcess> & FP, const opencascade::handle<TColStd_HSequenceOfInteger> & ShapeTypes, opencascade::handle<TransferBRep_HSequenceOfTransferResultInfo> & InfoSeq);

		/****** TransferBRep::TransientFromShape ******/
		/****** md5 signature: ac27ec8ebd551812170c1783235621b5 ******/
		%feature("compactdefaultargs") TransientFromShape;
		%feature("autodoc", "
Parameters
----------
FP: Transfer_FinderProcess
shape: TopoDS_Shape

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the result as pure transient attached to a shape first one if multiple result.
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
		/****** TransferBRep_BinderOfShape::TransferBRep_BinderOfShape ******/
		/****** md5 signature: 0e24b6a0d05d6367cba79758e65a3ba6 ******/
		%feature("compactdefaultargs") TransferBRep_BinderOfShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
Normal standard constructor, creates an empty binderofshape.
") TransferBRep_BinderOfShape;
		 TransferBRep_BinderOfShape();

		/****** TransferBRep_BinderOfShape::TransferBRep_BinderOfShape ******/
		/****** md5 signature: 5bbec8d38c7e9144c260dddea617f54e ******/
		%feature("compactdefaultargs") TransferBRep_BinderOfShape;
		%feature("autodoc", "
Parameters
----------
res: TopoDS_Shape

Return
-------
None

Description
-----------
Constructor which in the same time defines the result returns true if a starting object is bound with several results: here, returns always false but it can have next results.
") TransferBRep_BinderOfShape;
		 TransferBRep_BinderOfShape(const TopoDS_Shape & res);

		/****** TransferBRep_BinderOfShape::CResult ******/
		/****** md5 signature: 53f029a1cda5ba243bdce0cbc426b382 ******/
		%feature("compactdefaultargs") CResult;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the defined result, if there is one, and allows to change it (avoids result + setresult). admits that result can be not yet defined warning: a call to cresult causes result to be known as defined.
") CResult;
		TopoDS_Shape CResult();

		/****** TransferBRep_BinderOfShape::Result ******/
		/****** md5 signature: 64e8e20a963b00a422945949bd4e1549 ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the defined result, if there is one.
") Result;
		const TopoDS_Shape Result();

		/****** TransferBRep_BinderOfShape::ResultType ******/
		/****** md5 signature: 3e5db9429dee8b51366aef182b0d44a1 ******/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the type permitted for the result, i.e. the type of the parameter class <shape from topods> (statically defined).
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****** TransferBRep_BinderOfShape::ResultTypeName ******/
		/****** md5 signature: 7c976254948a22ef88ad8fdce635402f ******/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the type name computed for the result (dynamic).
") ResultTypeName;
		Standard_CString ResultTypeName();

		/****** TransferBRep_BinderOfShape::SetResult ******/
		/****** md5 signature: b581a5ff3d4839af932b887a85802930 ******/
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "
Parameters
----------
res: TopoDS_Shape

Return
-------
None

Description
-----------
Defines the result.
") SetResult;
		void SetResult(const TopoDS_Shape & res);

};


%make_alias(TransferBRep_BinderOfShape)

%extend TransferBRep_BinderOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TransferBRep_Reader *
****************************/
class TransferBRep_Reader {
	public:
		/****** TransferBRep_Reader::TransferBRep_Reader ******/
		/****** md5 signature: 89b0c1d65ba0c3b72390a67124ed8e2f ******/
		%feature("compactdefaultargs") TransferBRep_Reader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes a non-specialised reader. typically, for each norm or protocol, is will be required to define a specific create to load a file and transfer it.
") TransferBRep_Reader;
		 TransferBRep_Reader();

		/****** TransferBRep_Reader::Actor ******/
		/****** md5 signature: 46a9a8cd830c8bb4239c308f6a760b1a ******/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_ActorOfTransientProcess>

Description
-----------
Returns the recorded actor.
") Actor;
		virtual opencascade::handle<Transfer_ActorOfTransientProcess> Actor();

		/****** TransferBRep_Reader::BeginTransfer ******/
		/****** md5 signature: 45b9be9b944a95886bf096a49eb0bf8e ******/
		%feature("compactdefaultargs") BeginTransfer;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Initializes the reader for a transfer (one,roots, or list) also calls preparetransfer returns true when done, false if could not be done.
") BeginTransfer;
		Standard_Boolean BeginTransfer();

		/****** TransferBRep_Reader::CheckListModel ******/
		/****** md5 signature: 24d00665e95599b309f8e96a1b949c12 ******/
		%feature("compactdefaultargs") CheckListModel;
		%feature("autodoc", "Return
-------
Interface_CheckIterator

Description
-----------
Checks the model (complete: syntax + semantic) and returns the produced check list.
") CheckListModel;
		Interface_CheckIterator CheckListModel();

		/****** TransferBRep_Reader::CheckListResult ******/
		/****** md5 signature: 735cbc3fc13291439d3a0828abcd3f6a ******/
		%feature("compactdefaultargs") CheckListResult;
		%feature("autodoc", "Return
-------
Interface_CheckIterator

Description
-----------
Checks the result of last transfer (individual or roots, no cumulation on several transfers) and returns the produced list.
") CheckListResult;
		Interface_CheckIterator CheckListResult();

		/****** TransferBRep_Reader::CheckStatusModel ******/
		/****** md5 signature: 870c8266590633214733e675fb7f8dfa ******/
		%feature("compactdefaultargs") CheckStatusModel;
		%feature("autodoc", "
Parameters
----------
withprint: bool

Return
-------
bool

Description
-----------
Checks the model. returns true if there is no fail at all (regardless warnings) if <withprint> is true, also sends checks on standard output.
") CheckStatusModel;
		Standard_Boolean CheckStatusModel(const Standard_Boolean withprint);

		/****** TransferBRep_Reader::CheckStatusResult ******/
		/****** md5 signature: 331854297e3a398f63c12a5f55682ab2 ******/
		%feature("compactdefaultargs") CheckStatusResult;
		%feature("autodoc", "
Parameters
----------
withprints: bool

Return
-------
bool

Description
-----------
Checks the result of last transfer (individual or roots, no cumulation on several transfers). returns true if no fail occurred during transfer (queries the transientprocess).
") CheckStatusResult;
		Standard_Boolean CheckStatusResult(const Standard_Boolean withprints);

		/****** TransferBRep_Reader::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the result and done status. but not the model.
") Clear;
		void Clear();

		/****** TransferBRep_Reader::EndTransfer ******/
		/****** md5 signature: 743e3133a27f1051b31de826812cac18 ******/
		%feature("compactdefaultargs") EndTransfer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Ebds a transfer (one, roots or list) by recording its result.
") EndTransfer;
		void EndTransfer();

		/****** TransferBRep_Reader::FileNotFound ******/
		/****** md5 signature: 86b2480c0f386323f5deab3669dec3a3 ******/
		%feature("compactdefaultargs") FileNotFound;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if filestatus is for filenotfound.
") FileNotFound;
		Standard_Boolean FileNotFound();

		/****** TransferBRep_Reader::FileStatus ******/
		/****** md5 signature: 6a634e5454e1bf22f52b13e24d6e2c9c ******/
		%feature("compactdefaultargs") FileStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the file status.
") FileStatus;
		Standard_Integer FileStatus();

		/****** TransferBRep_Reader::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the last transfer/transferroots was a success.
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
		/****** TransferBRep_Reader::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the model to be worked on.
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** TransferBRep_Reader::NbShapes ******/
		/****** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of produced shapes (roots).
") NbShapes;
		Standard_Integer NbShapes();

		/****** TransferBRep_Reader::NbTransients ******/
		/****** md5 signature: 9436b9a550cdb03fdd33d4f80aca7526 ******/
		%feature("compactdefaultargs") NbTransients;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of produced transient results (roots).
") NbTransients;
		Standard_Integer NbTransients();

		/****** TransferBRep_Reader::OneShape ******/
		/****** md5 signature: 1fc1610db08b4eec83d275771d406ea5 ******/
		%feature("compactdefaultargs") OneShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns a unique shape for the result: - a void shape (type = shape) if result is empty - a simple shape if result has only one: returns this one - a compound if result has more than one shape.
") OneShape;
		TopoDS_Shape OneShape();

		/****** TransferBRep_Reader::PrepareTransfer ******/
		/****** md5 signature: ce6478f9210f4516f371381d8d9e7659 ******/
		%feature("compactdefaultargs") PrepareTransfer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Prepares the transfer. also can act on the actor or change the transientprocess if required. should not set the actor into the transientprocess, it is done by caller. the provided default does nothing.
") PrepareTransfer;
		virtual void PrepareTransfer();

		/****** TransferBRep_Reader::Protocol ******/
		/****** md5 signature: 2dce80af32cedc07d353d312ab7e2c73 ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns the recorded protocol.
") Protocol;
		virtual opencascade::handle<Interface_Protocol> Protocol();

		/****** TransferBRep_Reader::SetActor ******/
		/****** md5 signature: 8596f1237d29d2baaa927fcdaa1a0f89 ******/
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "
Parameters
----------
actor: Transfer_ActorOfTransientProcess

Return
-------
None

Description
-----------
Records the actor to be used for transfers.
") SetActor;
		void SetActor(const opencascade::handle<Transfer_ActorOfTransientProcess> & actor);

		/****** TransferBRep_Reader::SetFileStatus ******/
		/****** md5 signature: 74a715d4bf31def1e0a74262f5c53207 ******/
		%feature("compactdefaultargs") SetFileStatus;
		%feature("autodoc", "
Parameters
----------
status: int

Return
-------
None

Description
-----------
Sets file status to be interpreted as follows: = 0 ok < 0 file not found > 0 read error, no model could be created.
") SetFileStatus;
		void SetFileStatus(const Standard_Integer status);

		/****** TransferBRep_Reader::SetModel ******/
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
Specifies a model to work on also clears the result and done status.
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** TransferBRep_Reader::SetProtocol ******/
		/****** md5 signature: 032ba93c3a9bfe80213c23be9d305675 ******/
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "
Parameters
----------
protocol: Interface_Protocol

Return
-------
None

Description
-----------
Records the protocol to be used for read and transfer roots.
") SetProtocol;
		void SetProtocol(const opencascade::handle<Interface_Protocol> & protocol);

		/****** TransferBRep_Reader::Shape ******/
		/****** md5 signature: 1e795d69b15f05ab57c59b0afbc57ddf ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 1)

Return
-------
TopoDS_Shape

Description
-----------
Returns a shape given its rank, by default the first one.
") Shape;
		const TopoDS_Shape Shape(const Standard_Integer num = 1);

		/****** TransferBRep_Reader::ShapeResult ******/
		/****** md5 signature: 01e36bf3f5ba5a6d1aefe4e9aed8c7f6 ******/
		%feature("compactdefaultargs") ShapeResult;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
TopoDS_Shape

Description
-----------
Returns a shape produced from a given entity (if it was individually transferred or if an intermediate result is known). if no shape is bound with <ent>, returns a null shape warning: runs on the last call to transfer,transferroots,transferlist.
") ShapeResult;
		TopoDS_Shape ShapeResult(const opencascade::handle<Standard_Transient> & ent);

		/****** TransferBRep_Reader::Shapes ******/
		/****** md5 signature: fbd983721ce2925a93d47fdb2eb2a61d ******/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
Returns the complete list of produced shapes.
") Shapes;
		opencascade::handle<TopTools_HSequenceOfShape> Shapes();

		/****** TransferBRep_Reader::SyntaxError ******/
		/****** md5 signature: fa9da864765cf509ba7abf0725188a11 ******/
		%feature("compactdefaultargs") SyntaxError;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if filestatus is for error during read (major error; for local error, see checkmodel).
") SyntaxError;
		Standard_Boolean SyntaxError();

		/****** TransferBRep_Reader::Transfer ******/
		/****** md5 signature: b7b93a89ea541f8901206078d3c8ab0f ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
num: int
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Transfers an entity given its rank in the model (root or not) returns true if it is recognized as geom-topol. (but it can have failed: see isdone).
") Transfer;
		virtual Standard_Boolean Transfer(const Standard_Integer num, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TransferBRep_Reader::TransferList ******/
		/****** md5 signature: 9e2922f2658d44facb646c364ffbbc83 ******/
		%feature("compactdefaultargs") TransferList;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfTransient
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Transfers a list of entities (only the ones also in the model) remark: former result is cleared.
") TransferList;
		virtual void TransferList(const opencascade::handle<TColStd_HSequenceOfTransient> & list, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TransferBRep_Reader::TransferRoots ******/
		/****** md5 signature: b19043600acd2d46b55f29ea05e21678 ******/
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
Transfers all root entities which are recognized as geom-topol the result will be a list of shapes. this method calls user redefinable preparetransfer remark: former result is cleared.
") TransferRoots;
		virtual void TransferRoots(const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TransferBRep_Reader::Transient ******/
		/****** md5 signature: f74282777e87422dedb9fd96d2ddb7db ******/
		%feature("compactdefaultargs") Transient;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 1)

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns a transient root result, given its rank (by default the first one).
") Transient;
		opencascade::handle<Standard_Transient> Transient(const Standard_Integer num = 1);

		/****** TransferBRep_Reader::TransientProcess ******/
		/****** md5 signature: cda5aa33365159e82c6213003de44419 ******/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_TransientProcess>

Description
-----------
Returns the transientprocess. it records information about the very last transfer done. null if no transfer yet done. can be used for queries more accurate than the default ones.
") TransientProcess;
		opencascade::handle<Transfer_TransientProcess> TransientProcess();

		/****** TransferBRep_Reader::Transients ******/
		/****** md5 signature: 6b153a63c3c643b1b8e66b074c9eb931 ******/
		%feature("compactdefaultargs") Transients;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the complete list of produced transient results.
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
		/****** TransferBRep_ShapeInfo::Type ******/
		/****** md5 signature: 91a19cb485904b6668adaf1ff44c9776 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "
Parameters
----------
ent: TopoDS_Shape

Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the type attached to an object here, tshape (shape has no dynamic type).
") Type;
		static opencascade::handle<Standard_Type> Type(const TopoDS_Shape & ent);

		/****** TransferBRep_ShapeInfo::TypeName ******/
		/****** md5 signature: 9e3258fdb4a63ed1b39e111643bdaf36 ******/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "
Parameters
----------
ent: TopoDS_Shape

Return
-------
str

Description
-----------
Returns type name (string) here, the true name of the type of a shape.
") TypeName;
		static Standard_CString TypeName(const TopoDS_Shape & ent);

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
		/****** TransferBRep_ShapeListBinder::TransferBRep_ShapeListBinder ******/
		/****** md5 signature: c3dd8723ad1305f04db0647f85cc094a ******/
		%feature("compactdefaultargs") TransferBRep_ShapeListBinder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TransferBRep_ShapeListBinder;
		 TransferBRep_ShapeListBinder();

		/****** TransferBRep_ShapeListBinder::TransferBRep_ShapeListBinder ******/
		/****** md5 signature: b18999de218159d56d773f7587711b9b ******/
		%feature("compactdefaultargs") TransferBRep_ShapeListBinder;
		%feature("autodoc", "
Parameters
----------
list: TopTools_HSequenceOfShape

Return
-------
None

Description
-----------
No available documentation.
") TransferBRep_ShapeListBinder;
		 TransferBRep_ShapeListBinder(const opencascade::handle<TopTools_HSequenceOfShape> & list);

		/****** TransferBRep_ShapeListBinder::AddResult ******/
		/****** md5 signature: 307f4fac54065cc112d1d37fa0ba84d6 ******/
		%feature("compactdefaultargs") AddResult;
		%feature("autodoc", "
Parameters
----------
res: TopoDS_Shape

Return
-------
None

Description
-----------
Adds an item to the result list.
") AddResult;
		void AddResult(const TopoDS_Shape & res);

		/****** TransferBRep_ShapeListBinder::CompSolid ******/
		/****** md5 signature: 85f821a9b9b0553edcd2a0c068013325 ******/
		%feature("compactdefaultargs") CompSolid;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TopoDS_CompSolid

Description
-----------
No available documentation.
") CompSolid;
		TopoDS_CompSolid CompSolid(const Standard_Integer num);

		/****** TransferBRep_ShapeListBinder::Compound ******/
		/****** md5 signature: ffc423e6583d2e74cfed179181df389f ******/
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TopoDS_Compound

Description
-----------
No available documentation.
") Compound;
		TopoDS_Compound Compound(const Standard_Integer num);

		/****** TransferBRep_ShapeListBinder::Edge ******/
		/****** md5 signature: 825841bc4e9a24f9987724fcade8ecd7 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") Edge;
		TopoDS_Edge Edge(const Standard_Integer num);

		/****** TransferBRep_ShapeListBinder::Face ******/
		/****** md5 signature: 67e12ab0b51b730d66350be5ffa1f96e ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Face;
		TopoDS_Face Face(const Standard_Integer num);

		/****** TransferBRep_ShapeListBinder::IsMultiple ******/
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

		/****** TransferBRep_ShapeListBinder::NbShapes ******/
		/****** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbShapes;
		Standard_Integer NbShapes();

		/****** TransferBRep_ShapeListBinder::Result ******/
		/****** md5 signature: c4dc32098a28d0345ee9f33c9098c832 ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
No available documentation.
") Result;
		opencascade::handle<TopTools_HSequenceOfShape> Result();

		/****** TransferBRep_ShapeListBinder::ResultType ******/
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

		/****** TransferBRep_ShapeListBinder::ResultTypeName ******/
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

		/****** TransferBRep_ShapeListBinder::SetResult ******/
		/****** md5 signature: ce058a0f2fb955a00dd16b642d73ddf3 ******/
		%feature("compactdefaultargs") SetResult;
		%feature("autodoc", "
Parameters
----------
num: int
res: TopoDS_Shape

Return
-------
None

Description
-----------
Changes an already defined sub-result.
") SetResult;
		void SetResult(const Standard_Integer num, const TopoDS_Shape & res);

		/****** TransferBRep_ShapeListBinder::Shape ******/
		/****** md5 signature: 57dfd33e11a02b943ed7391444b46691 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape(const Standard_Integer num);

		/****** TransferBRep_ShapeListBinder::ShapeType ******/
		/****** md5 signature: 8f05332249aefadde782b65391e51fe2 ******/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TopAbs_ShapeEnum

Description
-----------
No available documentation.
") ShapeType;
		TopAbs_ShapeEnum ShapeType(const Standard_Integer num);

		/****** TransferBRep_ShapeListBinder::Shell ******/
		/****** md5 signature: f705fa0e2e8d1270514f2e407eafc945 ******/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TopoDS_Shell

Description
-----------
No available documentation.
") Shell;
		TopoDS_Shell Shell(const Standard_Integer num);

		/****** TransferBRep_ShapeListBinder::Solid ******/
		/****** md5 signature: eaaa658fc5bdc6be52c2ddaf73d8d00d ******/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TopoDS_Solid

Description
-----------
No available documentation.
") Solid;
		TopoDS_Solid Solid(const Standard_Integer num);

		/****** TransferBRep_ShapeListBinder::Vertex ******/
		/****** md5 signature: f53b5dfd31ebea2646e668d6f9b14e1d ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		TopoDS_Vertex Vertex(const Standard_Integer num);

		/****** TransferBRep_ShapeListBinder::Wire ******/
		/****** md5 signature: ea366fc3cbbdc5a77a2dfe378186f7fc ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
TopoDS_Wire

Description
-----------
No available documentation.
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
		/****** TransferBRep_ShapeMapper::TransferBRep_ShapeMapper ******/
		/****** md5 signature: c3571f808924632b111649c121419b7c ******/
		%feature("compactdefaultargs") TransferBRep_ShapeMapper;
		%feature("autodoc", "
Parameters
----------
akey: TopoDS_Shape

Return
-------
None

Description
-----------
Creates a mapper with a value. this value can then not be changed. it is used by the hasher to compute the hashcode, which will then be stored for an immediate reading.
") TransferBRep_ShapeMapper;
		 TransferBRep_ShapeMapper(const TopoDS_Shape & akey);

		/****** TransferBRep_ShapeMapper::Equates ******/
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
Specific testof equality: defined as false if <other> has not the same true type, else contents are compared (by c++ operator ==).
") Equates;
		Standard_Boolean Equates(const opencascade::handle<Transfer_Finder> & other);

		/****** TransferBRep_ShapeMapper::Value ******/
		/****** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the contained value.
") Value;
		const TopoDS_Shape Value();

		/****** TransferBRep_ShapeMapper::ValueType ******/
		/****** md5 signature: 40aa6e907b5cbe34817c19e20e6dde6e ******/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the type of the value. by default, returns the dynamictype of <self>, but can be redefined.
") ValueType;
		virtual opencascade::handle<Standard_Type> ValueType();

		/****** TransferBRep_ShapeMapper::ValueTypeName ******/
		/****** md5 signature: d49d824d6a98cbb182d37bee73d4be07 ******/
		%feature("compactdefaultargs") ValueTypeName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns the name of the type of the value. default is name of valuetype, unless it is for a non-handled object.
") ValueTypeName;
		virtual Standard_CString ValueTypeName();

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
		/****** TransferBRep_TransferResultInfo::TransferBRep_TransferResultInfo ******/
		/****** md5 signature: 5bd1437d5d446d705e7e47ecef5d002a ******/
		%feature("compactdefaultargs") TransferBRep_TransferResultInfo;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates object with all fields nullified.
") TransferBRep_TransferResultInfo;
		 TransferBRep_TransferResultInfo();

		/****** TransferBRep_TransferResultInfo::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets all the fields.
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
		/****** TransferBRep_ShapeBinder::TransferBRep_ShapeBinder ******/
		/****** md5 signature: f2a1ad7d416d197c0c7feca62a391246 ******/
		%feature("compactdefaultargs") TransferBRep_ShapeBinder;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty shapebinder.
") TransferBRep_ShapeBinder;
		 TransferBRep_ShapeBinder();

		/****** TransferBRep_ShapeBinder::TransferBRep_ShapeBinder ******/
		/****** md5 signature: 866088ebdf7b5fb1a5d84caf583fd813 ******/
		%feature("compactdefaultargs") TransferBRep_ShapeBinder;
		%feature("autodoc", "
Parameters
----------
res: TopoDS_Shape

Return
-------
None

Description
-----------
Creates a shapebinder with a result.
") TransferBRep_ShapeBinder;
		 TransferBRep_ShapeBinder(const TopoDS_Shape & res);

		/****** TransferBRep_ShapeBinder::CompSolid ******/
		/****** md5 signature: 2f1538abf8b930e68dc945fc6b8e5827 ******/
		%feature("compactdefaultargs") CompSolid;
		%feature("autodoc", "Return
-------
TopoDS_CompSolid

Description
-----------
No available documentation.
") CompSolid;
		TopoDS_CompSolid CompSolid();

		/****** TransferBRep_ShapeBinder::Compound ******/
		/****** md5 signature: 874212d5c1b1bb5c4c6e5c365d29670c ******/
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", "Return
-------
TopoDS_Compound

Description
-----------
No available documentation.
") Compound;
		TopoDS_Compound Compound();

		/****** TransferBRep_ShapeBinder::Edge ******/
		/****** md5 signature: 5fb4bdbeb7451241dd04cd0c90c043ff ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") Edge;
		TopoDS_Edge Edge();

		/****** TransferBRep_ShapeBinder::Face ******/
		/****** md5 signature: 64c75db1e9c1285068e9dd474618f74f ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Face;
		TopoDS_Face Face();

		/****** TransferBRep_ShapeBinder::ShapeType ******/
		/****** md5 signature: fdb6bbab82f138b7eb96684b837c482d ******/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns the type of the shape result (under topabs form).
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****** TransferBRep_ShapeBinder::Shell ******/
		/****** md5 signature: 3ea4686086a18491532865f1cfbce9ad ******/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Return
-------
TopoDS_Shell

Description
-----------
No available documentation.
") Shell;
		TopoDS_Shell Shell();

		/****** TransferBRep_ShapeBinder::Solid ******/
		/****** md5 signature: d3b8301796e7f37ff3cd00563df75b66 ******/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Return
-------
TopoDS_Solid

Description
-----------
No available documentation.
") Solid;
		TopoDS_Solid Solid();

		/****** TransferBRep_ShapeBinder::Vertex ******/
		/****** md5 signature: f00980db3d22a7e6d7f5f1300940ccaa ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		TopoDS_Vertex Vertex();

		/****** TransferBRep_ShapeBinder::Wire ******/
		/****** md5 signature: 2fe6e5f402158cff91e9020fddff92e6 ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
No available documentation.
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


/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def transferbrep_CheckObject(*args):
	return transferbrep.CheckObject(*args)

@deprecated
def transferbrep_Checked(*args):
	return transferbrep.Checked(*args)

@deprecated
def transferbrep_CheckedShapes(*args):
	return transferbrep.CheckedShapes(*args)

@deprecated
def transferbrep_PrintResultInfo(*args):
	return transferbrep.PrintResultInfo(*args)

@deprecated
def transferbrep_ResultCheckList(*args):
	return transferbrep.ResultCheckList(*args)

@deprecated
def transferbrep_ResultFromShape(*args):
	return transferbrep.ResultFromShape(*args)

@deprecated
def transferbrep_SetShapeResult(*args):
	return transferbrep.SetShapeResult(*args)

@deprecated
def transferbrep_SetTransientFromShape(*args):
	return transferbrep.SetTransientFromShape(*args)

@deprecated
def transferbrep_ShapeMapper(*args):
	return transferbrep.ShapeMapper(*args)

@deprecated
def transferbrep_ShapeResult(*args):
	return transferbrep.ShapeResult(*args)

@deprecated
def transferbrep_ShapeResult(*args):
	return transferbrep.ShapeResult(*args)

@deprecated
def transferbrep_ShapeState(*args):
	return transferbrep.ShapeState(*args)

@deprecated
def transferbrep_Shapes(*args):
	return transferbrep.Shapes(*args)

@deprecated
def transferbrep_Shapes(*args):
	return transferbrep.Shapes(*args)

@deprecated
def transferbrep_TransferResultInfo(*args):
	return transferbrep.TransferResultInfo(*args)

@deprecated
def transferbrep_TransferResultInfo(*args):
	return transferbrep.TransferResultInfo(*args)

@deprecated
def transferbrep_TransientFromShape(*args):
	return transferbrep.TransientFromShape(*args)

@deprecated
def TransferBRep_ShapeInfo_Type(*args):
	return TransferBRep_ShapeInfo.Type(*args)

@deprecated
def TransferBRep_ShapeInfo_TypeName(*args):
	return TransferBRep_ShapeInfo.TypeName(*args)

}
