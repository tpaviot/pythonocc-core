/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_transferbrep.html"
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
#include<TDF_module.hxx>
#include<IFSelect_module.hxx>
#include<TDocStd_module.hxx>
#include<XSControl_module.hxx>
#include<PCDM_module.hxx>
#include<CDF_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<Geom2d_module.hxx>
#include<DE_module.hxx>
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
/* end handles declaration */

/* templates */
%template(TransferBRep_SequenceOfTransferResultInfo) NCollection_Sequence<opencascade::handle<TransferBRep_TransferResultInfo>>;

%extend NCollection_Sequence<opencascade::handle<TransferBRep_TransferResultInfo>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_HSequence<opencascade::handle<TransferBRep_TransferResultInfo>> TransferBRep_HSequenceOfTransferResultInfo;
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
Returns the check-list bound to a given object, generally none (if OK) or one check. <obj> can be, either a true Transient object or entity, or a ShapeMapper, in that case the Shape is considered.
") CheckObject;
		static Interface_CheckIterator CheckObject(const Interface_CheckIterator & chl, const opencascade::handle<Standard_Transient> & obj);

		/****** TransferBRep::Checked ******/
		/****** md5 signature: 3c843c741c797c02ef910279805316b7 ******/
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "
Parameters
----------
chl: Interface_CheckIterator
alsoshapes: bool (optional, default to false)

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the list of objects to which a non-empty Check is bound in a check-list. Objects are transients, they can then be either Imagine objects entities for an Interface Norm. <alsoshapes> commands Shapes to be returned too (as ShapeMapper), see also CheckedShapes.
") Checked;
		static opencascade::handle<TColStd_HSequenceOfTransient> Checked(const Interface_CheckIterator & chl, const bool alsoshapes = false);

		/****** TransferBRep::CheckedShapes ******/
		/****** md5 signature: 126f080d495f23a9b3457849911b0f88 ******/
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
Returns the list of shapes to which a non-empty Check is bound in a check-list.
") CheckedShapes;
		static opencascade::handle<TopTools_HSequenceOfShape> CheckedShapes(const Interface_CheckIterator & chl);

		/****** TransferBRep::PrintResultInfo ******/
		/****** md5 signature: 37e2b11704f7882e65a02be038f90604 ******/
		%feature("compactdefaultargs") PrintResultInfo;
		%feature("autodoc", "
Parameters
----------
Printer: Message_Printer
Header: Message_Msg
ResultInfo: TransferBRep_TransferResultInfo
printEmpty: bool (optional, default to true)

Return
-------
None

Description
-----------
Prints the results of transfer to given priner with given header.
") PrintResultInfo;
		static void PrintResultInfo(const opencascade::handle<Message_Printer> & Printer, const Message_Msg & Header, const opencascade::handle<TransferBRep_TransferResultInfo> & ResultInfo, const bool printEmpty = true);

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
Takes a starting CheckIterator which brings checks bound with starting objects (Shapes, Transient from an Imagine appli ...) and converts it to a CheckIterator in which checks are bound with results in an InterfaceModel Mapping is recorded in the FinderProcess Starting objects for which no individual result is recorded remain in their state.
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
Returns the result (as a Binder) attached to a given Shape Null if none.
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
Sets a Shape as a result for a starting entity <ent> (reverse of ShapeResult) It simply creates a ShapeBinder then binds it to the entity.
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
Binds a Transient Result to a Shape in a FinderProcess (as first result if multiple: does not add it to existing one).
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
Returns a ShapeMapper for a given Shape (location included) Either <shape> is already mapped, then its Mapper is returned Or it is not, then a new one is created then returned, BUT it is not mapped here (use Bind or FindElseBind to do this).
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
Get the Shape recorded in a Binder If the Binder brings a multiple result, search for the Shape.
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
Get the Shape recorded in a TransientProcess as result of the Transfer of an entity. I.E. in the binder bound to that Entity If no result or result not a single Shape, returns a Null Shape.
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
Returns a Status regarding a Shape in a FinderProcess - FORWARD means bound with SAME Orientation - REVERSED means bound with REVERSE Orientation - EXTERNAL means NOT BOUND - INTERNAL is not used.
") ShapeState;
		static TopAbs_Orientation ShapeState(const opencascade::handle<Transfer_FinderProcess> & FP, const TopoDS_Shape & shape);

		/****** TransferBRep::Shapes ******/
		/****** md5 signature: d808986ecf67d2c73fac51ac0372c4ae ******/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "
Parameters
----------
TP: Transfer_TransientProcess
rootsonly: bool (optional, default to true)

Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
Gets the Shapes recorded in a TransientProcess as result of a Transfer, considers roots only or all results according <rootsonly>, returns them as a HSequence.
") Shapes;
		static opencascade::handle<TopTools_HSequenceOfShape> Shapes(const opencascade::handle<Transfer_TransientProcess> & TP, const bool rootsonly = true);

		/****** TransferBRep::Shapes ******/
		/****** md5 signature: da088c57afc5717cd643a6a18d242495 ******/
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
Gets the Shapes recorded in a TransientProcess as result of a Transfer, for a given list of starting entities, returns the shapes as a HSequence.
") Shapes;
		static opencascade::handle<TopTools_HSequenceOfShape> Shapes(const opencascade::handle<Transfer_TransientProcess> & TP, const opencascade::handle<TColStd_HSequenceOfTransient > & list);

		/****** TransferBRep::TransferResultInfo ******/
		/****** md5 signature: 29088a827361bc6fbd72b567473bc625 ******/
		%feature("compactdefaultargs") TransferResultInfo;
		%feature("autodoc", "
Parameters
----------
TP: Transfer_TransientProcess
EntityTypes: TColStd_HSequenceOfTransient
InfoSeq: NCollection_HSequence<

Return
-------
None

Description
-----------
Fills sequence of TransferResultInfo for each type of entity given in the EntityTypes (entity are given as objects). Method IsKind applied to the entities in TP is used to compare with entities in EntityTypes. TopAbs_ShapeEnum).
") TransferResultInfo;
		static void TransferResultInfo(const opencascade::handle<Transfer_TransientProcess> & TP, const opencascade::handle<TColStd_HSequenceOfTransient > & EntityTypes, opencascade::handle<NCollection_HSequence<opencascade::handle<TransferBRep_TransferResultInfo>> > & InfoSeq);

		/****** TransferBRep::TransferResultInfo ******/
		/****** md5 signature: 3cc221e8c25fd3e7d44f43649797d50f ******/
		%feature("compactdefaultargs") TransferResultInfo;
		%feature("autodoc", "
Parameters
----------
FP: Transfer_FinderProcess
ShapeTypes: TColStd_HSequenceOfInteger
InfoSeq: NCollection_HSequence<

Return
-------
None

Description
-----------
Fills sequence of TransferResultInfo for each type of shape given in the ShapeTypes (which are in fact considered as TopAbs_ShapeEnum). The Finders in the FP are considered as ShapeMappers.
") TransferResultInfo;
		static void TransferResultInfo(const opencascade::handle<Transfer_FinderProcess> & FP, const opencascade::handle<TColStd_HSequenceOfInteger> & ShapeTypes, opencascade::handle<NCollection_HSequence<opencascade::handle<TransferBRep_TransferResultInfo>> > & InfoSeq);

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
Returns the result as pure Transient attached to a Shape first one if multiple result.
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
normal standard constructor, creates an empty BinderOfShape.
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
constructor which in the same time defines the result Returns True if a starting object is bound with SEVERAL results: Here, returns always False But it can have next results.
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
Returns the defined Result, if there is one, and allows to change it (avoids Result + SetResult). Admits that Result can be not yet defined Warning: a call to CResult causes Result to be known as defined.
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
Returns the defined Result, if there is one.
") Result;
		const TopoDS_Shape Result();

		/****** TransferBRep_BinderOfShape::ResultType ******/
		/****** md5 signature: 4e004b8040dfd0ab644b911d7c8c2437 ******/
		%feature("compactdefaultargs") ResultType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the Type permitted for the Result, i.e. the Type of the Parameter Class <Shape from TopoDS> (statically defined).
") ResultType;
		opencascade::handle<Standard_Type> ResultType();

		/****** TransferBRep_BinderOfShape::ResultTypeName ******/
		/****** md5 signature: b971c635bd884aa99ea99620671ff261 ******/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the Type Name computed for the Result (dynamic).
") ResultTypeName;
		const char * ResultTypeName();

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
Defines the Result.
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
Initializes a non-specialised Reader. Typically, for each norm or protocol, is will be required to define a specific Create to load a file and transfer it.
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
Returns the recorded Actor.
") Actor;
		virtual opencascade::handle<Transfer_ActorOfTransientProcess> Actor();

		/****** TransferBRep_Reader::BeginTransfer ******/
		/****** md5 signature: 801cfd2af0c797c209e3f797f316b64f ******/
		%feature("compactdefaultargs") BeginTransfer;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Initializes the Reader for a Transfer (one,roots, or list) Also calls PrepareTransfer Returns True when done, False if could not be done.
") BeginTransfer;
		bool BeginTransfer();

		/****** TransferBRep_Reader::CheckListModel ******/
		/****** md5 signature: 24d00665e95599b309f8e96a1b949c12 ******/
		%feature("compactdefaultargs") CheckListModel;
		%feature("autodoc", "Return
-------
Interface_CheckIterator

Description
-----------
Checks the Model (complete: syntax + semantic) and returns the produced Check List.
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
Checks the Result of last Transfer (individual or roots, no cumulation on several transfers) and returns the produced list.
") CheckListResult;
		Interface_CheckIterator CheckListResult();

		/****** TransferBRep_Reader::CheckStatusModel ******/
		/****** md5 signature: 34ce57cecbc66e0eb09074d713dc09df ******/
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
Checks the Model. Returns True if there is NO FAIL at all (regardless Warnings) If <withprint> is True, also sends Checks on standard output.
") CheckStatusModel;
		bool CheckStatusModel(const bool withprint);

		/****** TransferBRep_Reader::CheckStatusResult ******/
		/****** md5 signature: 7686a68a7c17297f890516294c3183ba ******/
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
Checks the Result of last Transfer (individual or roots, no cumulation on several transfers). Returns True if NO fail occurred during Transfer (queries the TransientProcess).
") CheckStatusResult;
		bool CheckStatusResult(const bool withprints);

		/****** TransferBRep_Reader::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
clears the result and Done status. But not the Model.
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
Ebds a Transfer (one, roots or list) by recording its result.
") EndTransfer;
		void EndTransfer();

		/****** TransferBRep_Reader::FileNotFound ******/
		/****** md5 signature: 8611b6997989c076d77e32133390f01c ******/
		%feature("compactdefaultargs") FileNotFound;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if FileStatus is for FileNotFound.
") FileNotFound;
		bool FileNotFound();

		/****** TransferBRep_Reader::FileStatus ******/
		/****** md5 signature: 7eab34e63904d56a8ec3e29fe53af255 ******/
		%feature("compactdefaultargs") FileStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the File Status.
") FileStatus;
		int FileStatus();

		/****** TransferBRep_Reader::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the LAST Transfer/TransferRoots was a success.
") IsDone;
		bool IsDone();

		/****** TransferBRep_Reader::ModeNewTransfer ******/
		/****** md5 signature: 75cf63bf29080c75595a34e584fd5fb4 ******/
		%feature("compactdefaultargs") ModeNewTransfer;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns (by Reference, hence can be changed) the Mode for new Transfer: True (D) means that each new Transfer produces a new TransferProcess. Else keeps the original one but each Transfer clears its (former results are not kept).
") ModeNewTransfer;
		bool & ModeNewTransfer();

		/****** TransferBRep_Reader::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the Model to be worked on.
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** TransferBRep_Reader::NbShapes ******/
		/****** md5 signature: 5033c6acdebfec4ad702502e01d3601a ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of produced Shapes (roots).
") NbShapes;
		int NbShapes();

		/****** TransferBRep_Reader::NbTransients ******/
		/****** md5 signature: e02b1f2157c0ad9fd2433ae067a939e8 ******/
		%feature("compactdefaultargs") NbTransients;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the count of produced Transient Results (roots).
") NbTransients;
		int NbTransients();

		/****** TransferBRep_Reader::OneShape ******/
		/****** md5 signature: 1fc1610db08b4eec83d275771d406ea5 ******/
		%feature("compactdefaultargs") OneShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns a unique Shape for the result: - a void Shape (type = SHAPE) if result is empty - a simple Shape if result has only one: returns this one - a Compound if result has more than one Shape.
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
Prepares the Transfer. Also can act on the Actor or change the TransientProcess if required. Should not set the Actor into the TransientProcess, it is done by caller. The provided default does nothing.
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
Returns the recorded Protocol.
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
		/****** md5 signature: f0084f1fa3a41beda9b5cab0404f8868 ******/
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
Sets File Status to be interpreted as follows: = 0 OK < 0 file not found > 0 read error, no Model could be created.
") SetFileStatus;
		void SetFileStatus(const int status);

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
Specifies a Model to work on Also clears the result and Done status.
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
		/****** md5 signature: 26860324d11b89d5d3b80058d8c91d80 ******/
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
Returns a Shape given its rank, by default the first one.
") Shape;
		const TopoDS_Shape Shape(const int num = 1);

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
Returns a Shape produced from a given entity (if it was individually transferred or if an intermediate result is known). If no Shape is bound with <ent>, returns a Null Shape Warning: Runs on the last call to Transfer,TransferRoots,TransferList.
") ShapeResult;
		TopoDS_Shape ShapeResult(const opencascade::handle<Standard_Transient> & ent);

		/****** TransferBRep_Reader::Shapes ******/
		/****** md5 signature: 5731e74c95cacebc31ebc806d273237f ******/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
Returns the complete list of produced Shapes.
") Shapes;
		opencascade::handle<TopTools_HSequenceOfShape> Shapes();

		/****** TransferBRep_Reader::SyntaxError ******/
		/****** md5 signature: 433d999e6b11feb4e67a26c1a70d9c2a ******/
		%feature("compactdefaultargs") SyntaxError;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if FileStatus is for Error during read (major error; for local error, see CheckModel).
") SyntaxError;
		bool SyntaxError();

		/****** TransferBRep_Reader::Transfer ******/
		/****** md5 signature: b0d503f3234cb3822195ee354f333ac4 ******/
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
Transfers an Entity given its rank in the Model (Root or not) Returns True if it is recognized as Geom-Topol. (But it can have failed: see IsDone).
") Transfer;
		virtual bool Transfer(const int num, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TransferBRep_Reader::TransferList ******/
		/****** md5 signature: baad914ea40a7eb285c647bc035e07a4 ******/
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
Transfers a list of Entities (only the ones also in the Model) Remark: former result is cleared.
") TransferList;
		virtual void TransferList(const opencascade::handle<TColStd_HSequenceOfTransient > & list, const Message_ProgressRange & theProgress = Message_ProgressRange());

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
Transfers all Root Entities which are recognized as Geom-Topol The result will be a list of Shapes. This method calls user redefinable PrepareTransfer Remark: former result is cleared.
") TransferRoots;
		virtual void TransferRoots(const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TransferBRep_Reader::Transient ******/
		/****** md5 signature: e220123dd1d19eb01151dba95d1bc1a6 ******/
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
Returns a Transient Root Result, given its rank (by default the first one).
") Transient;
		opencascade::handle<Standard_Transient> Transient(const int num = 1);

		/****** TransferBRep_Reader::TransientProcess ******/
		/****** md5 signature: cda5aa33365159e82c6213003de44419 ******/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_TransientProcess>

Description
-----------
Returns the TransientProcess. It records information about the very last transfer done. Null if no transfer yet done. Can be used for queries more accurate than the default ones.
") TransientProcess;
		opencascade::handle<Transfer_TransientProcess> TransientProcess();

		/****** TransferBRep_Reader::Transients ******/
		/****** md5 signature: be79bdf6e146e047f8f7f20a53081f44 ******/
		%feature("compactdefaultargs") Transients;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the complete list of produced Transient Results.
") Transients;
		opencascade::handle<TColStd_HSequenceOfTransient> Transients();

		%extend{
			bool GetModeNewTransfer() { return self->ModeNewTransfer(); }
			void SetModeNewTransfer(bool value) { self->ModeNewTransfer() = value; }
		};
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
Returns the Type attached to an object Here, TShape (Shape has no Dynamic Type).
") Type;
		static opencascade::handle<Standard_Type> Type(const TopoDS_Shape & ent);

		/****** TransferBRep_ShapeInfo::TypeName ******/
		/****** md5 signature: 4b53529c5c139411f7bf25f48ef8dc2f ******/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "
Parameters
----------
ent: TopoDS_Shape

Return
-------
char *

Description
-----------
Returns Type Name (string) Here, the true name of the Type of a Shape.
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
		/****** md5 signature: 0684cb6f4f60d080945af182706bd3fe ******/
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
		/****** md5 signature: b1e5012e0bc0fc8a2163fb745e5e3c0c ******/
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
		TopoDS_CompSolid CompSolid(const int num);

		/****** TransferBRep_ShapeListBinder::Compound ******/
		/****** md5 signature: 6f1f382cf1de41658c275d8229a30a35 ******/
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
		TopoDS_Compound Compound(const int num);

		/****** TransferBRep_ShapeListBinder::Edge ******/
		/****** md5 signature: 94efb4c91a253aa8f1ccf8b1009cbb01 ******/
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
		TopoDS_Edge Edge(const int num);

		/****** TransferBRep_ShapeListBinder::Face ******/
		/****** md5 signature: 188ea327f7d3753eff3a27febeb100b7 ******/
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
		TopoDS_Face Face(const int num);

		/****** TransferBRep_ShapeListBinder::IsMultiple ******/
		/****** md5 signature: b73238879014f1cd1bb02ce2686b5485 ******/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsMultiple;
		bool IsMultiple();

		/****** TransferBRep_ShapeListBinder::NbShapes ******/
		/****** md5 signature: 5033c6acdebfec4ad702502e01d3601a ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbShapes;
		int NbShapes();

		/****** TransferBRep_ShapeListBinder::Result ******/
		/****** md5 signature: d40b68c89c597349e95d11f0cc7c830d ******/
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
		/****** md5 signature: 4e004b8040dfd0ab644b911d7c8c2437 ******/
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
		/****** md5 signature: b971c635bd884aa99ea99620671ff261 ******/
		%feature("compactdefaultargs") ResultTypeName;
		%feature("autodoc", "Return
-------
char *

Description
-----------
No available documentation.
") ResultTypeName;
		const char * ResultTypeName();

		/****** TransferBRep_ShapeListBinder::SetResult ******/
		/****** md5 signature: 38900e73809ddde935068c9a0a9c3aaa ******/
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
		void SetResult(const int num, const TopoDS_Shape & res);

		/****** TransferBRep_ShapeListBinder::Shape ******/
		/****** md5 signature: d00d28e0c2be2c27fa3af76487e7b786 ******/
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
		const TopoDS_Shape Shape(const int num);

		/****** TransferBRep_ShapeListBinder::ShapeType ******/
		/****** md5 signature: e9eb0a95773b9416ae340b3a9374734a ******/
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
		TopAbs_ShapeEnum ShapeType(const int num);

		/****** TransferBRep_ShapeListBinder::Shell ******/
		/****** md5 signature: c4633f19235e96d6e546a13e783cd428 ******/
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
		TopoDS_Shell Shell(const int num);

		/****** TransferBRep_ShapeListBinder::Solid ******/
		/****** md5 signature: 3819d1a9770d04087c624eef7e46bd98 ******/
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
		TopoDS_Solid Solid(const int num);

		/****** TransferBRep_ShapeListBinder::Vertex ******/
		/****** md5 signature: a5f17a4f65fd58efbbb829abdb4ee937 ******/
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
		TopoDS_Vertex Vertex(const int num);

		/****** TransferBRep_ShapeListBinder::Wire ******/
		/****** md5 signature: 43a878d7ccfba9fd3da2e78673002114 ******/
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
		TopoDS_Wire Wire(const int num);

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
Creates a Mapper with a Value. This Value can then not be changed. It is used by the Hasher to compute the HashCode, which will then be stored for an immediate reading.
") TransferBRep_ShapeMapper;
		 TransferBRep_ShapeMapper(const TopoDS_Shape & akey);

		/****** TransferBRep_ShapeMapper::Equates ******/
		/****** md5 signature: fda61c1d86b7277254b3d2e5d16413a3 ******/
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
Specific test of equality: defined as False if <other> has not the same true Type, else contents are compared (by C++ operator ==).
") Equates;
		bool Equates(const opencascade::handle<Transfer_Finder> & other);

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
		/****** md5 signature: 9013f89343e9d7fdefc9baa7b7c53b4f ******/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the Type of the Value. By default, returns the DynamicType of <self>, but can be redefined.
") ValueType;
		opencascade::handle<Standard_Type> ValueType();

		/****** TransferBRep_ShapeMapper::ValueTypeName ******/
		/****** md5 signature: 28672ff733ba4193d89ffe9994247474 ******/
		%feature("compactdefaultargs") ValueTypeName;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the name of the Type of the Value. Default is name of ValueType, unless it is for a non-handled object.
") ValueTypeName;
		const char * ValueTypeName();

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

		/****** TransferBRep_TransferResultInfo::NoResult ******/
		/****** md5 signature: a3c5571c31a373e583396c55e9f792ed ******/
		%feature("compactdefaultargs") NoResult;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NoResult;
		int & NoResult();

		/****** TransferBRep_TransferResultInfo::NoResultFail ******/
		/****** md5 signature: 07b152543278ffe436a216735ce431bb ******/
		%feature("compactdefaultargs") NoResultFail;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NoResultFail;
		int & NoResultFail();

		/****** TransferBRep_TransferResultInfo::NoResultWarning ******/
		/****** md5 signature: a76a7a3d93690a625646157922779e6a ******/
		%feature("compactdefaultargs") NoResultWarning;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NoResultWarning;
		int & NoResultWarning();

		/****** TransferBRep_TransferResultInfo::NoResultWarningFail ******/
		/****** md5 signature: d8f0b23f6eca26487f3bb645f30022ca ******/
		%feature("compactdefaultargs") NoResultWarningFail;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NoResultWarningFail;
		int & NoResultWarningFail();

		/****** TransferBRep_TransferResultInfo::Result ******/
		/****** md5 signature: a7321ff907618e28bfff86e0c13ce8f3 ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Result;
		int & Result();

		/****** TransferBRep_TransferResultInfo::ResultFail ******/
		/****** md5 signature: 3e120e154fa6e155d6145bfaa98b4058 ******/
		%feature("compactdefaultargs") ResultFail;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ResultFail;
		int & ResultFail();

		/****** TransferBRep_TransferResultInfo::ResultWarning ******/
		/****** md5 signature: 305f1a77ad1014b0a927ae078f15ee8a ******/
		%feature("compactdefaultargs") ResultWarning;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ResultWarning;
		int & ResultWarning();

		/****** TransferBRep_TransferResultInfo::ResultWarningFail ******/
		/****** md5 signature: e2b0c7d91ef17d3357984bf3157ae041 ******/
		%feature("compactdefaultargs") ResultWarningFail;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ResultWarningFail;
		int & ResultWarningFail();

		%extend{
			int GetResult() { return self->Result(); }
			void SetResult(int value) { self->Result() = value; }
		};
		%extend{
			int GetResultWarning() { return self->ResultWarning(); }
			void SetResultWarning(int value) { self->ResultWarning() = value; }
		};
		%extend{
			int GetResultFail() { return self->ResultFail(); }
			void SetResultFail(int value) { self->ResultFail() = value; }
		};
		%extend{
			int GetResultWarningFail() { return self->ResultWarningFail(); }
			void SetResultWarningFail(int value) { self->ResultWarningFail() = value; }
		};
		%extend{
			int GetNoResult() { return self->NoResult(); }
			void SetNoResult(int value) { self->NoResult() = value; }
		};
		%extend{
			int GetNoResultWarning() { return self->NoResultWarning(); }
			void SetNoResultWarning(int value) { self->NoResultWarning() = value; }
		};
		%extend{
			int GetNoResultFail() { return self->NoResultFail(); }
			void SetNoResultFail(int value) { self->NoResultFail() = value; }
		};
		%extend{
			int GetNoResultWarningFail() { return self->NoResultWarningFail(); }
			void SetNoResultWarningFail(int value) { self->NoResultWarningFail() = value; }
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
Creates an empty ShapeBinder.
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
Creates a ShapeBinder with a result.
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
Returns the Type of the Shape Result (under TopAbs form).
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
class TransferBRep_HSequenceOfTransferResultInfo : public NCollection_Sequence<opencascade::handle<TransferBRep_TransferResultInfo>>, public Standard_Transient {
  public:
    TransferBRep_HSequenceOfTransferResultInfo();
    TransferBRep_HSequenceOfTransferResultInfo(const NCollection_Sequence<opencascade::handle<TransferBRep_TransferResultInfo>>& theOther);
    const NCollection_Sequence<opencascade::handle<TransferBRep_TransferResultInfo>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<TransferBRep_TransferResultInfo>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<TransferBRep_TransferResultInfo>>& theSequence);
    NCollection_Sequence<opencascade::handle<TransferBRep_TransferResultInfo>>& ChangeSequence();
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
