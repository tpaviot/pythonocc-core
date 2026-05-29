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
%define TOPOPEBREPBUILDDOCSTRING
"TopOpeBRepBuild module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_topopebrepbuild.html"
%enddef
%module (package="OCC.Core", docstring=TOPOPEBREPBUILDDOCSTRING) TopOpeBRepBuild


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
#include<TopOpeBRepBuild_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<TopOpeBRepDS_module.hxx>
#include<TopAbs_module.hxx>
#include<TopTools_module.hxx>
#include<TopOpeBRepTool_module.hxx>
#include<gp_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Bnd_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TopLoc_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Message_module.hxx>
#include<Intf_module.hxx>
#include<IntSurf_module.hxx>
#include<Extrema_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import TopOpeBRepDS.i
%import TopAbs.i
%import TopTools.i
%import TopOpeBRepTool.i
%import gp.i
%import TCollection.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum TopOpeBRepBuild_LoopEnum {
	TopOpeBRepBuild_ANYLOOP = 0,
	TopOpeBRepBuild_BOUNDARY = 1,
	TopOpeBRepBuild_BLOCK = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class TopOpeBRepBuild_LoopEnum(IntEnum):
	TopOpeBRepBuild_ANYLOOP = 0
	TopOpeBRepBuild_BOUNDARY = 1
	TopOpeBRepBuild_BLOCK = 2
TopOpeBRepBuild_ANYLOOP = TopOpeBRepBuild_LoopEnum.TopOpeBRepBuild_ANYLOOP
TopOpeBRepBuild_BOUNDARY = TopOpeBRepBuild_LoopEnum.TopOpeBRepBuild_BOUNDARY
TopOpeBRepBuild_BLOCK = TopOpeBRepBuild_LoopEnum.TopOpeBRepBuild_BLOCK
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TopOpeBRepBuild_HBuilder)
%wrap_handle(TopOpeBRepBuild_Loop)
%wrap_handle(TopOpeBRepBuild_Pave)
/* end handles declaration */

/* templates */
%ignore NCollection_DataMap<TopoDS_Shape,TopOpeBRepBuild_ListOfShapeListOfShape,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TopOpeBRepBuild_ListOfShapeListOfShape,TopTools_ShapeMapHasher>::KeyValues;
%template(TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape) NCollection_DataMap<TopoDS_Shape,TopOpeBRepBuild_ListOfShapeListOfShape,TopTools_ShapeMapHasher>;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepBuild_VertexInfo,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepBuild_VertexInfo,TopTools_ShapeMapHasher>::KeyValues;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepBuild_VertexInfo,TopTools_ShapeMapHasher>::IndexedItems;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepBuild_VertexInfo,TopTools_ShapeMapHasher>::Contained;
%template(TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo) NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepBuild_VertexInfo,TopTools_ShapeMapHasher>;
%template(TopOpeBRepBuild_ListIteratorOfListOfListOfLoop) NCollection_TListIterator<TopOpeBRepBuild_ListOfLoop>;
%template(TopOpeBRepBuild_ListIteratorOfListOfLoop) NCollection_TListIterator<opencascade::handle<TopOpeBRepBuild_Loop>>;
%template(TopOpeBRepBuild_ListIteratorOfListOfPave) NCollection_TListIterator<opencascade::handle<TopOpeBRepBuild_Pave>>;
%template(TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape) NCollection_TListIterator<TopOpeBRepBuild_ShapeListOfShape>;
%template(TopOpeBRepBuild_ListOfListOfLoop) NCollection_List<TopOpeBRepBuild_ListOfLoop>;

%extend NCollection_List<TopOpeBRepBuild_ListOfLoop> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = TopOpeBRepBuild_ListIteratorOfListOfListOfLoop(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(TopOpeBRepBuild_ListOfLoop) NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>>;

%extend NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = TopOpeBRepBuild_ListIteratorOfListOfLoop(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(TopOpeBRepBuild_ListOfPave) NCollection_List<opencascade::handle<TopOpeBRepBuild_Pave>>;

%extend NCollection_List<opencascade::handle<TopOpeBRepBuild_Pave>> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = TopOpeBRepBuild_ListIteratorOfListOfPave(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(TopOpeBRepBuild_ListOfShapeListOfShape) NCollection_List<TopOpeBRepBuild_ShapeListOfShape>;

%extend NCollection_List<TopOpeBRepBuild_ShapeListOfShape> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepBuild_ListOfShapeListOfShape, TopTools_ShapeMapHasher>::Iterator TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepBuild_ListOfShapeListOfShape, TopTools_ShapeMapHasher> TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepBuild_VertexInfo, TopTools_ShapeMapHasher> TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo;
typedef NCollection_List<TopOpeBRepBuild_ListOfLoop>::Iterator TopOpeBRepBuild_ListIteratorOfListOfListOfLoop;
typedef NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>>::Iterator TopOpeBRepBuild_ListIteratorOfListOfLoop;
typedef NCollection_List<opencascade::handle<TopOpeBRepBuild_Pave>>::Iterator TopOpeBRepBuild_ListIteratorOfListOfPave;
typedef NCollection_List<TopOpeBRepBuild_ShapeListOfShape>::Iterator TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape;
typedef NCollection_List<TopOpeBRepBuild_ListOfLoop> TopOpeBRepBuild_ListOfListOfLoop;
typedef NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>> TopOpeBRepBuild_ListOfLoop;
typedef NCollection_List<opencascade::handle<TopOpeBRepBuild_Pave>> TopOpeBRepBuild_ListOfPave;
typedef NCollection_List<TopOpeBRepBuild_ShapeListOfShape> TopOpeBRepBuild_ListOfShapeListOfShape;
/* end typedefs declaration */

/************************************
* class TopOpeBRepBuild_AreaBuilder *
************************************/
class TopOpeBRepBuild_AreaBuilder {
	public:
		/****** TopOpeBRepBuild_AreaBuilder::TopOpeBRepBuild_AreaBuilder ******/
		/****** md5 signature: a9d4bd115c3eab690e6f4e9893c3b1b1 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_AreaBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_AreaBuilder;
		 TopOpeBRepBuild_AreaBuilder();

		/****** TopOpeBRepBuild_AreaBuilder::TopOpeBRepBuild_AreaBuilder ******/
		/****** md5 signature: c04765c45f5e7af5daf6c336c3033cea ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_AreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates a AreaBuilder to build the areas on the shapes described by <LS> using the classifier <LC>.
") TopOpeBRepBuild_AreaBuilder;
		 TopOpeBRepBuild_AreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const bool ForceClass = false);

		/****** TopOpeBRepBuild_AreaBuilder::ADD_LISTOFLoop_TO_LISTOFLoop ******/
		/****** md5 signature: fff80896510fddb94b9e3d31d6331aaa ******/
		%feature("compactdefaultargs") ADD_LISTOFLoop_TO_LISTOFLoop;
		%feature("autodoc", "
Parameters
----------
LOL1: TopOpeBRepBuild_Loop
LOL2: TopOpeBRepBuild_Loop
s: void * (optional, default to nullptr)
s1: void * (optional, default to nullptr)
s2: void * (optional, default to nullptr)

Return
-------
None

Description
-----------
No available documentation.
") ADD_LISTOFLoop_TO_LISTOFLoop;
		virtual void ADD_LISTOFLoop_TO_LISTOFLoop(NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>> & LOL1, NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>> & LOL2, void * const s = nullptr, void * const s1 = nullptr, void * const s2 = nullptr);

		/****** TopOpeBRepBuild_AreaBuilder::ADD_Loop_TO_LISTOFLoop ******/
		/****** md5 signature: ea1788c38c5b1017ae065cd7a2a8f2cc ******/
		%feature("compactdefaultargs") ADD_Loop_TO_LISTOFLoop;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepBuild_Loop
LOL: TopOpeBRepBuild_Loop
s: void * (optional, default to nullptr)

Return
-------
None

Description
-----------
No available documentation.
") ADD_Loop_TO_LISTOFLoop;
		virtual void ADD_Loop_TO_LISTOFLoop(const opencascade::handle<TopOpeBRepBuild_Loop> & L, NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>> & LOL, void * const s = nullptr);

		/****** TopOpeBRepBuild_AreaBuilder::InitArea ******/
		/****** md5 signature: 6e55c8e440759d6e5084173b004a49f0 ******/
		%feature("compactdefaultargs") InitArea;
		%feature("autodoc", "Return
-------
int

Description
-----------
Initialize iteration on areas.
") InitArea;
		int InitArea();

		/****** TopOpeBRepBuild_AreaBuilder::InitAreaBuilder ******/
		/****** md5 signature: b9cb5ebc9ed651afea56368b1c2ea48c ******/
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to false)

Return
-------
None

Description
-----------
Sets a AreaBuilder to find the areas on the shapes described by <LS> using the classifier <LC>.
") InitAreaBuilder;
		virtual void InitAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const bool ForceClass = false);

		/****** TopOpeBRepBuild_AreaBuilder::InitLoop ******/
		/****** md5 signature: 977b7fa943f565a35b832e18a991603c ******/
		%feature("compactdefaultargs") InitLoop;
		%feature("autodoc", "Return
-------
int

Description
-----------
Initialize iteration on loops of current Area.
") InitLoop;
		int InitLoop();

		/****** TopOpeBRepBuild_AreaBuilder::Loop ******/
		/****** md5 signature: e5eaa5279c90b5c8a2825b1e3e9c39f3 ******/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepBuild_Loop>

Description
-----------
Returns the current Loop in the current area.
") Loop;
		const opencascade::handle<TopOpeBRepBuild_Loop> & Loop();

		/****** TopOpeBRepBuild_AreaBuilder::MoreArea ******/
		/****** md5 signature: 89b63f829c2180ad2067cc533c8aa683 ******/
		%feature("compactdefaultargs") MoreArea;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreArea;
		bool MoreArea();

		/****** TopOpeBRepBuild_AreaBuilder::MoreLoop ******/
		/****** md5 signature: 1d09652cbf16e916a8b2933556364b9b ******/
		%feature("compactdefaultargs") MoreLoop;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreLoop;
		bool MoreLoop();

		/****** TopOpeBRepBuild_AreaBuilder::NextArea ******/
		/****** md5 signature: f05125373cb5bdf4fd14c1f424e6a6c9 ******/
		%feature("compactdefaultargs") NextArea;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextArea;
		void NextArea();

		/****** TopOpeBRepBuild_AreaBuilder::NextLoop ******/
		/****** md5 signature: e73b88fa3ffe72033ed712bf6302e3ab ******/
		%feature("compactdefaultargs") NextLoop;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextLoop;
		void NextLoop();

		/****** TopOpeBRepBuild_AreaBuilder::REM_Loop_FROM_LISTOFLoop ******/
		/****** md5 signature: 4852ac7a1859329482e25264eb11421e ******/
		%feature("compactdefaultargs") REM_Loop_FROM_LISTOFLoop;
		%feature("autodoc", "
Parameters
----------
ITLOL: TopOpeBRepBuild_Loop
LOL: TopOpeBRepBuild_Loop
s: void * (optional, default to nullptr)

Return
-------
None

Description
-----------
No available documentation.
") REM_Loop_FROM_LISTOFLoop;
		virtual void REM_Loop_FROM_LISTOFLoop(NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>>::Iterator & ITLOL, NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>> & LOL, void * const s = nullptr);

};


%extend TopOpeBRepBuild_AreaBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class TopOpeBRepBuild_BlockBuilder *
*************************************/
class TopOpeBRepBuild_BlockBuilder {
	public:
		/****** TopOpeBRepBuild_BlockBuilder::TopOpeBRepBuild_BlockBuilder ******/
		/****** md5 signature: 7c98d1cd1525ffe4083c43a3af6f2add ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_BlockBuilder;
		 TopOpeBRepBuild_BlockBuilder();

		/****** TopOpeBRepBuild_BlockBuilder::TopOpeBRepBuild_BlockBuilder ******/
		/****** md5 signature: af59f207713049a2879713e307c5a312 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockBuilder;
		%feature("autodoc", "
Parameters
----------
SS: TopOpeBRepBuild_ShapeSet

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_BlockBuilder;
		 TopOpeBRepBuild_BlockBuilder(TopOpeBRepBuild_ShapeSet & SS);

		/****** TopOpeBRepBuild_BlockBuilder::AddElement ******/
		/****** md5 signature: 5fe9d7753cdd27373e9ee919b30da27b ******/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") AddElement;
		int AddElement(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_BlockBuilder::BlockIterator ******/
		/****** md5 signature: fd27df20c0300f63d4375379caeab86e ******/
		%feature("compactdefaultargs") BlockIterator;
		%feature("autodoc", "Return
-------
TopOpeBRepBuild_BlockIterator

Description
-----------
No available documentation.
") BlockIterator;
		TopOpeBRepBuild_BlockIterator BlockIterator();

		/****** TopOpeBRepBuild_BlockBuilder::CurrentBlockIsRegular ******/
		/****** md5 signature: fd738ff2213a4eb12219e2ad0da6893b ******/
		%feature("compactdefaultargs") CurrentBlockIsRegular;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CurrentBlockIsRegular;
		bool CurrentBlockIsRegular();

		/****** TopOpeBRepBuild_BlockBuilder::Element ******/
		/****** md5 signature: 0a9acaa1578577926615c3f44302366b ******/
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "
Parameters
----------
BI: TopOpeBRepBuild_BlockIterator

Return
-------
TopoDS_Shape

Description
-----------
Returns the current element of <BI>.
") Element;
		const TopoDS_Shape Element(const TopOpeBRepBuild_BlockIterator & BI);

		/****** TopOpeBRepBuild_BlockBuilder::Element ******/
		/****** md5 signature: 93c9039b3cf02881bf8feaf4b4d3b97c ******/
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Element;
		const TopoDS_Shape Element(const int I);

		/****** TopOpeBRepBuild_BlockBuilder::Element ******/
		/****** md5 signature: 8339911510eddfbd55c68d3a1dfbbd96 ******/
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") Element;
		int Element(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_BlockBuilder::ElementIsValid ******/
		/****** md5 signature: eb912420bc61fcf504169f6fb743547b ******/
		%feature("compactdefaultargs") ElementIsValid;
		%feature("autodoc", "
Parameters
----------
BI: TopOpeBRepBuild_BlockIterator

Return
-------
bool

Description
-----------
No available documentation.
") ElementIsValid;
		bool ElementIsValid(const TopOpeBRepBuild_BlockIterator & BI);

		/****** TopOpeBRepBuild_BlockBuilder::ElementIsValid ******/
		/****** md5 signature: 42717babdcc500be623d1aa2d6431c2c ******/
		%feature("compactdefaultargs") ElementIsValid;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") ElementIsValid;
		bool ElementIsValid(const int I);

		/****** TopOpeBRepBuild_BlockBuilder::InitBlock ******/
		/****** md5 signature: f0c2404669f8c44fd2edfb1e9d87f90e ******/
		%feature("compactdefaultargs") InitBlock;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitBlock;
		void InitBlock();

		/****** TopOpeBRepBuild_BlockBuilder::MakeBlock ******/
		/****** md5 signature: 1088718283f71ac192fee34488739e42 ******/
		%feature("compactdefaultargs") MakeBlock;
		%feature("autodoc", "
Parameters
----------
SS: TopOpeBRepBuild_ShapeSet

Return
-------
None

Description
-----------
No available documentation.
") MakeBlock;
		void MakeBlock(TopOpeBRepBuild_ShapeSet & SS);

		/****** TopOpeBRepBuild_BlockBuilder::MoreBlock ******/
		/****** md5 signature: 1df2361996ea08d4148be9542a775fc8 ******/
		%feature("compactdefaultargs") MoreBlock;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreBlock;
		bool MoreBlock();

		/****** TopOpeBRepBuild_BlockBuilder::NextBlock ******/
		/****** md5 signature: b92660971dbaee8b274d09e60cf8a5bb ******/
		%feature("compactdefaultargs") NextBlock;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextBlock;
		void NextBlock();

		/****** TopOpeBRepBuild_BlockBuilder::SetValid ******/
		/****** md5 signature: 5eea033d8f92023e2b0168c610a04e30 ******/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "
Parameters
----------
BI: TopOpeBRepBuild_BlockIterator
isvalid: bool

Return
-------
None

Description
-----------
No available documentation.
") SetValid;
		void SetValid(const TopOpeBRepBuild_BlockIterator & BI, const bool isvalid);

		/****** TopOpeBRepBuild_BlockBuilder::SetValid ******/
		/****** md5 signature: 70234ddb3ad8415f83cf525a64e014f2 ******/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "
Parameters
----------
I: int
isvalid: bool

Return
-------
None

Description
-----------
No available documentation.
") SetValid;
		void SetValid(const int I, const bool isvalid);

};


%extend TopOpeBRepBuild_BlockBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class TopOpeBRepBuild_BlockIterator *
**************************************/
class TopOpeBRepBuild_BlockIterator {
	public:
		/****** TopOpeBRepBuild_BlockIterator::TopOpeBRepBuild_BlockIterator ******/
		/****** md5 signature: 51b04c62bb2b0ea19e459717cbf4b079 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_BlockIterator;
		 TopOpeBRepBuild_BlockIterator();

		/****** TopOpeBRepBuild_BlockIterator::TopOpeBRepBuild_BlockIterator ******/
		/****** md5 signature: 4ba2920749d94d519e2baf39839ccbb2 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockIterator;
		%feature("autodoc", "
Parameters
----------
Lower: int
Upper: int

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_BlockIterator;
		 TopOpeBRepBuild_BlockIterator(const int Lower, const int Upper);

		/****** TopOpeBRepBuild_BlockIterator::Extent ******/
		/****** md5 signature: 1c9a99c4f72ae2188a5b950ee752d850 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		int Extent();

		/****** TopOpeBRepBuild_BlockIterator::Initialize ******/
		/****** md5 signature: 4c9930c75acb9044902a1f8388d68e73 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize();

		/****** TopOpeBRepBuild_BlockIterator::More ******/
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		bool More();

		/****** TopOpeBRepBuild_BlockIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****** TopOpeBRepBuild_BlockIterator::Value ******/
		/****** md5 signature: c627cada3dfed5ccab6c1f1ff49fb87f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Value;
		int Value();

};


%extend TopOpeBRepBuild_BlockIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TopOpeBRepBuild_Builder *
********************************/
class TopOpeBRepBuild_Builder {
	public:
		/****** TopOpeBRepBuild_Builder::TopOpeBRepBuild_Builder ******/
		/****** md5 signature: db05603b64ec486bca0081aa45c5fe3e ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_Builder;
		%feature("autodoc", "
Parameters
----------
BT: TopOpeBRepDS_BuildTool

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_Builder;
		 TopOpeBRepBuild_Builder(const TopOpeBRepDS_BuildTool & BT);

		/****** TopOpeBRepBuild_Builder::AddONPatchesSFS ******/
		/****** md5 signature: 29af8820338a875d8b1b4cae4ed43711 ******/
		%feature("compactdefaultargs") AddONPatchesSFS;
		%feature("autodoc", "
Parameters
----------
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Return
-------
None

Description
-----------
No available documentation.
") AddONPatchesSFS;
		void AddONPatchesSFS(const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****** TopOpeBRepBuild_Builder::BuildEdges ******/
		/****** md5 signature: a69eddf8f02bbde68465c237752d04a7 ******/
		%feature("compactdefaultargs") BuildEdges;
		%feature("autodoc", "
Parameters
----------
DS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
update the DS by creating new geometries. create shapes from the new geometries.
") BuildEdges;
		void BuildEdges(const opencascade::handle<TopOpeBRepDS_HDataStructure> & DS);

		/****** TopOpeBRepBuild_Builder::BuildTool ******/
		/****** md5 signature: 8f00b58c6dc4bbbf0701f98004c469fd ******/
		%feature("compactdefaultargs") BuildTool;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_BuildTool

Description
-----------
No available documentation.
") BuildTool;
		const TopOpeBRepDS_BuildTool & BuildTool();

		/****** TopOpeBRepBuild_Builder::BuildVertices ******/
		/****** md5 signature: 307eb10c5561324e5d3fc62fa1aca2f0 ******/
		%feature("compactdefaultargs") BuildVertices;
		%feature("autodoc", "
Parameters
----------
DS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
update the DS by creating new geometries. create vertices on DS points.
") BuildVertices;
		void BuildVertices(const opencascade::handle<TopOpeBRepDS_HDataStructure> & DS);

		/****** TopOpeBRepBuild_Builder::ChangeBuildTool ******/
		/****** md5 signature: f18366a59aef2f912961e1fc0d178930 ******/
		%feature("compactdefaultargs") ChangeBuildTool;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_BuildTool

Description
-----------
No available documentation.
") ChangeBuildTool;
		TopOpeBRepDS_BuildTool & ChangeBuildTool();

		/****** TopOpeBRepBuild_Builder::ChangeClassify ******/
		/****** md5 signature: 9276434fa673871dbedd0466f1fd5326 ******/
		%feature("compactdefaultargs") ChangeClassify;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") ChangeClassify;
		void ChangeClassify(const bool B);

		/****** TopOpeBRepBuild_Builder::ChangeMSplit ******/
		/****** md5 signature: d4771fbe1beb0346d61c376e12a43b65 ******/
		%feature("compactdefaultargs") ChangeMSplit;
		%feature("autodoc", "
Parameters
----------
s: TopAbs_State

Return
-------
NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher>

Description
-----------
No available documentation.
") ChangeMSplit;
		NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher> ChangeMSplit(const TopAbs_State s);

		/****** TopOpeBRepBuild_Builder::ChangeSplit ******/
		/****** md5 signature: 2eb63da324e7d202ce2271e4945cc0b3 ******/
		%feature("compactdefaultargs") ChangeSplit;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TB: TopAbs_State

Return
-------
TopTools_ListOfShape

Description
-----------
Returns a ref.on the list of shapes connected to <S> as <TB> split parts of <S>. Mark <S> as split in <TB> parts.
") ChangeSplit;
		TopTools_ListOfShape & ChangeSplit(const TopoDS_Shape & S, const TopAbs_State TB);

		/****** TopOpeBRepBuild_Builder::Classify ******/
		/****** md5 signature: 22aea0e94c83736c0940aaa5699fce12 ******/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Classify;
		bool Classify();

		/****** TopOpeBRepBuild_Builder::Clear ******/
		/****** md5 signature: 1badd2d119b64dbdb177834e510c3af9 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all splits and merges already performed. Does NOT clear the handled DS.
") Clear;
		virtual void Clear();

		/****** TopOpeBRepBuild_Builder::ClearMaps ******/
		/****** md5 signature: 3a3e1ac4dd56ec90accec52c01231b06 ******/
		%feature("compactdefaultargs") ClearMaps;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ClearMaps;
		void ClearMaps();

		/****** TopOpeBRepBuild_Builder::Contains ******/
		/****** md5 signature: 619c1ca39b78f8343cda6de00685fc53 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
L: TopTools_ListOfShape

Return
-------
bool

Description
-----------
No available documentation.
") Contains;
		static bool Contains(const TopoDS_Shape & S, const TopTools_ListOfShape & L);

		/****** TopOpeBRepBuild_Builder::DataStructure ******/
		/****** md5 signature: c5d3d5af4f8db2375e9c48f16eb16363 ******/
		%feature("compactdefaultargs") DataStructure;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>

Description
-----------
returns the DS handled by this builder.
") DataStructure;
		opencascade::handle<TopOpeBRepDS_HDataStructure> DataStructure();

		/****** TopOpeBRepBuild_Builder::End ******/
		/****** md5 signature: 583631727c11157a7fee45984d266c4a ******/
		%feature("compactdefaultargs") End;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") End;
		void End();

		/****** TopOpeBRepBuild_Builder::FillOnPatches ******/
		/****** md5 signature: 0dcf807551c78f542923ce9fa9c481de ******/
		%feature("compactdefaultargs") FillOnPatches;
		%feature("autodoc", "
Parameters
----------
anEdgesON: TopTools_ListOfShape
aBaseFace: TopoDS_Shape
avoidMap: TopTools_IndexedMapOfOrientedShape

Return
-------
None

Description
-----------
No available documentation.
") FillOnPatches;
		void FillOnPatches(const TopTools_ListOfShape & anEdgesON, const TopoDS_Shape & aBaseFace, const TopTools_IndexedMapOfOrientedShape & avoidMap);

		/****** TopOpeBRepBuild_Builder::FillSecEdgeAncestorMap ******/
		/****** md5 signature: b4dd2d4a1f605337ba10d6ec3e0f732f ******/
		%feature("compactdefaultargs") FillSecEdgeAncestorMap;
		%feature("autodoc", "
Parameters
----------
aShapeRank: int
aMapON: TopTools_MapOfShape
anAncMap: TopTools_DataMapOfShapeShape

Return
-------
None

Description
-----------
Fills anAncMap with pairs (edge,ancestor edge) for each split from the map aMapON for the shape object identified by ShapeRank.
") FillSecEdgeAncestorMap;
		void FillSecEdgeAncestorMap(const int aShapeRank, const TopTools_MapOfShape & aMapON, TopTools_DataMapOfShapeShape & anAncMap);

		/****** TopOpeBRepBuild_Builder::FindFacesTouchingEdge ******/
		/****** md5 signature: f43e25c235130c5cf227a066b53a270e ******/
		%feature("compactdefaultargs") FindFacesTouchingEdge;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Shape
anEdge: TopoDS_Shape
aShRank: int
aFaces: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") FindFacesTouchingEdge;
		void FindFacesTouchingEdge(const TopoDS_Shape & aFace, const TopoDS_Shape & anEdge, const int aShRank, TopTools_ListOfShape & aFaces);

		/****** TopOpeBRepBuild_Builder::FindIsKPart ******/
		/****** md5 signature: db06608b5ad7e57c9d97c38cf43b8d7f ******/
		%feature("compactdefaultargs") FindIsKPart;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FindIsKPart;
		int FindIsKPart();

		/****** TopOpeBRepBuild_Builder::FindSameDomain ******/
		/****** md5 signature: 067c36f79d7f4a6162f686b3d9df42b1 ******/
		%feature("compactdefaultargs") FindSameDomain;
		%feature("autodoc", "
Parameters
----------
L1: TopTools_ListOfShape
L2: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") FindSameDomain;
		void FindSameDomain(TopTools_ListOfShape & L1, TopTools_ListOfShape & L2);

		/****** TopOpeBRepBuild_Builder::FindSameDomainSameOrientation ******/
		/****** md5 signature: cab9c8a5287255799df2b0634fdadcad ******/
		%feature("compactdefaultargs") FindSameDomainSameOrientation;
		%feature("autodoc", "
Parameters
----------
LSO: TopTools_ListOfShape
LDO: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") FindSameDomainSameOrientation;
		void FindSameDomainSameOrientation(TopTools_ListOfShape & LSO, TopTools_ListOfShape & LDO);

		/****** TopOpeBRepBuild_Builder::FindSameRank ******/
		/****** md5 signature: bf94dc3852e32316700b79b1c6427b72 ******/
		%feature("compactdefaultargs") FindSameRank;
		%feature("autodoc", "
Parameters
----------
L1: TopTools_ListOfShape
R: int
L2: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") FindSameRank;
		void FindSameRank(const TopTools_ListOfShape & L1, const int R, TopTools_ListOfShape & L2);

		/****** TopOpeBRepBuild_Builder::GClearMaps ******/
		/****** md5 signature: 7d0a1671079bfaeb1de7b98195821892 ******/
		%feature("compactdefaultargs") GClearMaps;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GClearMaps;
		void GClearMaps();

		/****** TopOpeBRepBuild_Builder::GContains ******/
		/****** md5 signature: 2822eaf38af7295b244dbe95fa579215 ******/
		%feature("compactdefaultargs") GContains;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
L: TopTools_ListOfShape

Return
-------
bool

Description
-----------
No available documentation.
") GContains;
		static bool GContains(const TopoDS_Shape & S, const TopTools_ListOfShape & L);

		/****** TopOpeBRepBuild_Builder::GCopyList ******/
		/****** md5 signature: 49b1243765c757d8044593157e95c7f9 ******/
		%feature("compactdefaultargs") GCopyList;
		%feature("autodoc", "
Parameters
----------
Lin: TopTools_ListOfShape
i1: int
i2: int
Lou: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GCopyList;
		static void GCopyList(const TopTools_ListOfShape & Lin, const int i1, const int i2, TopTools_ListOfShape & Lou);

		/****** TopOpeBRepBuild_Builder::GCopyList ******/
		/****** md5 signature: f61e5df18995c0ed408a111707f87868 ******/
		%feature("compactdefaultargs") GCopyList;
		%feature("autodoc", "
Parameters
----------
Lin: TopTools_ListOfShape
Lou: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GCopyList;
		static void GCopyList(const TopTools_ListOfShape & Lin, TopTools_ListOfShape & Lou);

		/****** TopOpeBRepBuild_Builder::GEDBUMakeEdges ******/
		/****** md5 signature: 527ab0862827de7aec469de9ab44c102 ******/
		%feature("compactdefaultargs") GEDBUMakeEdges;
		%feature("autodoc", "
Parameters
----------
EF: TopoDS_Shape
EDBU: TopOpeBRepBuild_EdgeBuilder
LOE: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GEDBUMakeEdges;
		void GEDBUMakeEdges(const TopoDS_Shape & EF, TopOpeBRepBuild_EdgeBuilder & EDBU, TopTools_ListOfShape & LOE);

		/****** TopOpeBRepBuild_Builder::GFABUMakeFaces ******/
		/****** md5 signature: 2bba94aa744845412a2bc16beaf04daa ******/
		%feature("compactdefaultargs") GFABUMakeFaces;
		%feature("autodoc", "
Parameters
----------
FF: TopoDS_Shape
FABU: TopOpeBRepBuild_FaceBuilder
LOF: TopTools_ListOfShape
MWisOld: TopTools_DataMapOfShapeInteger

Return
-------
None

Description
-----------
No available documentation.
") GFABUMakeFaces;
		void GFABUMakeFaces(const TopoDS_Shape & FF, TopOpeBRepBuild_FaceBuilder & FABU, TopTools_ListOfShape & LOF, TopTools_DataMapOfShapeInteger & MWisOld);

		/****** TopOpeBRepBuild_Builder::GFillCurveTopologyWES ******/
		/****** md5 signature: ae6642415017c216585dc55ae9111141 ******/
		%feature("compactdefaultargs") GFillCurveTopologyWES;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") GFillCurveTopologyWES;
		void GFillCurveTopologyWES(const TopoDS_Shape & F, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****** TopOpeBRepBuild_Builder::GFillCurveTopologyWES ******/
		/****** md5 signature: b4099f1e415e678dbeade8b5e9202f94 ******/
		%feature("compactdefaultargs") GFillCurveTopologyWES;
		%feature("autodoc", "
Parameters
----------
IT: TopOpeBRepDS_CurveIterator
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") GFillCurveTopologyWES;
		void GFillCurveTopologyWES(const TopOpeBRepDS_CurveIterator & IT, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****** TopOpeBRepBuild_Builder::GFillEdgePVS ******/
		/****** md5 signature: 2a00b290b054ba98415f1b6baa2b437a ******/
		%feature("compactdefaultargs") GFillEdgePVS;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
LE2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
PVS: TopOpeBRepBuild_PaveSet

Return
-------
None

Description
-----------
No available documentation.
") GFillEdgePVS;
		void GFillEdgePVS(const TopoDS_Shape & E, const TopTools_ListOfShape & LE2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_PaveSet & PVS);

		/****** TopOpeBRepBuild_Builder::GFillEdgeWES ******/
		/****** md5 signature: 0ebf7daf09f8ae68d7b61b768a17cbe8 ******/
		%feature("compactdefaultargs") GFillEdgeWES;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
LF2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") GFillEdgeWES;
		void GFillEdgeWES(const TopoDS_Shape & E, const TopTools_ListOfShape & LF2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****** TopOpeBRepBuild_Builder::GFillEdgesPVS ******/
		/****** md5 signature: e001a6d8b81d8cd7706d0b9213296840 ******/
		%feature("compactdefaultargs") GFillEdgesPVS;
		%feature("autodoc", "
Parameters
----------
LE1: TopTools_ListOfShape
LE2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
PVS: TopOpeBRepBuild_PaveSet

Return
-------
None

Description
-----------
No available documentation.
") GFillEdgesPVS;
		void GFillEdgesPVS(const TopTools_ListOfShape & LE1, const TopTools_ListOfShape & LE2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_PaveSet & PVS);

		/****** TopOpeBRepBuild_Builder::GFillFaceSFS ******/
		/****** md5 signature: 7fecd61be72bbe222fbea7b6f8143c07 ******/
		%feature("compactdefaultargs") GFillFaceSFS;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Return
-------
None

Description
-----------
No available documentation.
") GFillFaceSFS;
		void GFillFaceSFS(const TopoDS_Shape & F1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****** TopOpeBRepBuild_Builder::GFillFaceWES ******/
		/****** md5 signature: e36684a3c106875828e1ce089be92d32 ******/
		%feature("compactdefaultargs") GFillFaceWES;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
LF2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") GFillFaceWES;
		void GFillFaceWES(const TopoDS_Shape & F, const TopTools_ListOfShape & LF2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****** TopOpeBRepBuild_Builder::GFillFacesWES ******/
		/****** md5 signature: 1e53a6cbd627f4bc9ee41c57331e3f15 ******/
		%feature("compactdefaultargs") GFillFacesWES;
		%feature("autodoc", "
Parameters
----------
LF1: TopTools_ListOfShape
LF2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") GFillFacesWES;
		void GFillFacesWES(const TopTools_ListOfShape & LF1, const TopTools_ListOfShape & LF2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****** TopOpeBRepBuild_Builder::GFillFacesWESK ******/
		/****** md5 signature: 4cc247343f38cf86761907276921006f ******/
		%feature("compactdefaultargs") GFillFacesWESK;
		%feature("autodoc", "
Parameters
----------
LF1: TopTools_ListOfShape
LF2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet
K: int

Return
-------
None

Description
-----------
No available documentation.
") GFillFacesWESK;
		void GFillFacesWESK(const TopTools_ListOfShape & LF1, const TopTools_ListOfShape & LF2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES, const int K);

		/****** TopOpeBRepBuild_Builder::GFillFacesWESMakeFaces ******/
		/****** md5 signature: 528b9328d63482cd24c7756cdd602ad6 ******/
		%feature("compactdefaultargs") GFillFacesWESMakeFaces;
		%feature("autodoc", "
Parameters
----------
LF1: TopTools_ListOfShape
LF2: TopTools_ListOfShape
LSO: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo

Return
-------
None

Description
-----------
No available documentation.
") GFillFacesWESMakeFaces;
		void GFillFacesWESMakeFaces(const TopTools_ListOfShape & LF1, const TopTools_ListOfShape & LF2, const TopTools_ListOfShape & LSO, const TopOpeBRepBuild_GTopo & G);

		/****** TopOpeBRepBuild_Builder::GFillONPartsWES ******/
		/****** md5 signature: c25bf75e58712521dcbc12868b9e04f3 ******/
		%feature("compactdefaultargs") GFillONPartsWES;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
G: TopOpeBRepBuild_GTopo
LSclass: TopTools_ListOfShape
WES: TopOpeBRepBuild_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") GFillONPartsWES;
		void GFillONPartsWES(const TopoDS_Shape & F, const TopOpeBRepBuild_GTopo & G, const TopTools_ListOfShape & LSclass, TopOpeBRepBuild_WireEdgeSet & WES);

		/****** TopOpeBRepBuild_Builder::GFillPointTopologyPVS ******/
		/****** md5 signature: 00c325991f266de203dfe864e34d835b ******/
		%feature("compactdefaultargs") GFillPointTopologyPVS;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
G: TopOpeBRepBuild_GTopo
PVS: TopOpeBRepBuild_PaveSet

Return
-------
None

Description
-----------
No available documentation.
") GFillPointTopologyPVS;
		void GFillPointTopologyPVS(const TopoDS_Shape & E, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_PaveSet & PVS);

		/****** TopOpeBRepBuild_Builder::GFillPointTopologyPVS ******/
		/****** md5 signature: 6904815967b575964b12b0a0973a9335 ******/
		%feature("compactdefaultargs") GFillPointTopologyPVS;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
IT: TopOpeBRepDS_PointIterator
G: TopOpeBRepBuild_GTopo
PVS: TopOpeBRepBuild_PaveSet

Return
-------
None

Description
-----------
No available documentation.
") GFillPointTopologyPVS;
		void GFillPointTopologyPVS(const TopoDS_Shape & E, const TopOpeBRepDS_PointIterator & IT, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_PaveSet & PVS);

		/****** TopOpeBRepBuild_Builder::GFillShellSFS ******/
		/****** md5 signature: 1bd7ab2d8256ea26ea77a80a72c31461 ******/
		%feature("compactdefaultargs") GFillShellSFS;
		%feature("autodoc", "
Parameters
----------
SH1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Return
-------
None

Description
-----------
No available documentation.
") GFillShellSFS;
		virtual void GFillShellSFS(const TopoDS_Shape & SH1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****** TopOpeBRepBuild_Builder::GFillSolidSFS ******/
		/****** md5 signature: 34f7f48a5b56e2e34c279c73b10986f3 ******/
		%feature("compactdefaultargs") GFillSolidSFS;
		%feature("autodoc", "
Parameters
----------
SO1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Return
-------
None

Description
-----------
No available documentation.
") GFillSolidSFS;
		virtual void GFillSolidSFS(const TopoDS_Shape & SO1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****** TopOpeBRepBuild_Builder::GFillSolidsSFS ******/
		/****** md5 signature: 4d38e429c90a5d4266e887f89e28e6c2 ******/
		%feature("compactdefaultargs") GFillSolidsSFS;
		%feature("autodoc", "
Parameters
----------
LSO1: TopTools_ListOfShape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Return
-------
None

Description
-----------
No available documentation.
") GFillSolidsSFS;
		void GFillSolidsSFS(const TopTools_ListOfShape & LSO1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****** TopOpeBRepBuild_Builder::GFillSurfaceTopologySFS ******/
		/****** md5 signature: 93637eed413d6909c90ac82bad8c8ddb ******/
		%feature("compactdefaultargs") GFillSurfaceTopologySFS;
		%feature("autodoc", "
Parameters
----------
SO1: TopoDS_Shape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Return
-------
None

Description
-----------
No available documentation.
") GFillSurfaceTopologySFS;
		void GFillSurfaceTopologySFS(const TopoDS_Shape & SO1, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****** TopOpeBRepBuild_Builder::GFillSurfaceTopologySFS ******/
		/****** md5 signature: 3da49093d4b4d4c3f8537faf2e66edb1 ******/
		%feature("compactdefaultargs") GFillSurfaceTopologySFS;
		%feature("autodoc", "
Parameters
----------
IT: TopOpeBRepDS_SurfaceIterator
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Return
-------
None

Description
-----------
No available documentation.
") GFillSurfaceTopologySFS;
		void GFillSurfaceTopologySFS(const TopOpeBRepDS_SurfaceIterator & IT, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****** TopOpeBRepBuild_Builder::GFillWireWES ******/
		/****** md5 signature: b2d05fff5ae7241aac0f407ee7b8025d ******/
		%feature("compactdefaultargs") GFillWireWES;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Shape
LF2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") GFillWireWES;
		void GFillWireWES(const TopoDS_Shape & W, const TopTools_ListOfShape & LF2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****** TopOpeBRepBuild_Builder::GFindSamDom ******/
		/****** md5 signature: 9d90c1f5163033dd3db833192264be73 ******/
		%feature("compactdefaultargs") GFindSamDom;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
L1: TopTools_ListOfShape
L2: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GFindSamDom;
		void GFindSamDom(const TopoDS_Shape & S, TopTools_ListOfShape & L1, TopTools_ListOfShape & L2);

		/****** TopOpeBRepBuild_Builder::GFindSamDom ******/
		/****** md5 signature: 1eba3901a554cc2e1c28a38b3194f84b ******/
		%feature("compactdefaultargs") GFindSamDom;
		%feature("autodoc", "
Parameters
----------
L1: TopTools_ListOfShape
L2: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GFindSamDom;
		void GFindSamDom(TopTools_ListOfShape & L1, TopTools_ListOfShape & L2);

		/****** TopOpeBRepBuild_Builder::GFindSamDomSODO ******/
		/****** md5 signature: 408cdbc0794c50d8b8b5ed622a625253 ******/
		%feature("compactdefaultargs") GFindSamDomSODO;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
LSO: TopTools_ListOfShape
LDO: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GFindSamDomSODO;
		void GFindSamDomSODO(const TopoDS_Shape & S, TopTools_ListOfShape & LSO, TopTools_ListOfShape & LDO);

		/****** TopOpeBRepBuild_Builder::GFindSamDomSODO ******/
		/****** md5 signature: 36651507de027ade89827d4abc464ebb ******/
		%feature("compactdefaultargs") GFindSamDomSODO;
		%feature("autodoc", "
Parameters
----------
LSO: TopTools_ListOfShape
LDO: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GFindSamDomSODO;
		void GFindSamDomSODO(TopTools_ListOfShape & LSO, TopTools_ListOfShape & LDO);

		/****** TopOpeBRepBuild_Builder::GFindSameRank ******/
		/****** md5 signature: d23a696c97892bf5aaf3f311767e0508 ******/
		%feature("compactdefaultargs") GFindSameRank;
		%feature("autodoc", "
Parameters
----------
L1: TopTools_ListOfShape
R: int
L2: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GFindSameRank;
		void GFindSameRank(const TopTools_ListOfShape & L1, const int R, TopTools_ListOfShape & L2);

		/****** TopOpeBRepBuild_Builder::GIsShapeOf ******/
		/****** md5 signature: 75f37e47b5d46901e16db368e08f4789 ******/
		%feature("compactdefaultargs") GIsShapeOf;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
I12: int

Return
-------
bool

Description
-----------
No available documentation.
") GIsShapeOf;
		bool GIsShapeOf(const TopoDS_Shape & S, const int I12);

		/****** TopOpeBRepBuild_Builder::GKeepShape ******/
		/****** md5 signature: 6287583e1d12840c2b1f50aa53c3924a ******/
		%feature("compactdefaultargs") GKeepShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Lref: TopTools_ListOfShape
T: TopAbs_State

Return
-------
bool

Description
-----------
No available documentation.
") GKeepShape;
		bool GKeepShape(const TopoDS_Shape & S, const TopTools_ListOfShape & Lref, const TopAbs_State T);

		/****** TopOpeBRepBuild_Builder::GKeepShape1 ******/
		/****** md5 signature: cb12b2b10f6da81d7aabffdff0eb2f83 ******/
		%feature("compactdefaultargs") GKeepShape1;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Lref: TopTools_ListOfShape
T: TopAbs_State

Return
-------
pos: TopAbs_State

Description
-----------
return True if S is classified <T> / Lref shapes.
") GKeepShape1;
		bool GKeepShape1(const TopoDS_Shape & S, const TopTools_ListOfShape & Lref, const TopAbs_State T, TopAbs_State &OutValue);

		/****** TopOpeBRepBuild_Builder::GKeepShapes ******/
		/****** md5 signature: 3a0ec35b9ac7b6f659a7f3f1210b2093 ******/
		%feature("compactdefaultargs") GKeepShapes;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Lref: TopTools_ListOfShape
T: TopAbs_State
Lin: TopTools_ListOfShape
Lou: TopTools_ListOfShape

Return
-------
None

Description
-----------
add to Lou the shapes of Lin classified <T> / Lref shapes. Lou is not cleared. (S is a dummy trace argument).
") GKeepShapes;
		void GKeepShapes(const TopoDS_Shape & S, const TopTools_ListOfShape & Lref, const TopAbs_State T, const TopTools_ListOfShape & Lin, TopTools_ListOfShape & Lou);

		/****** TopOpeBRepBuild_Builder::GMapShapes ******/
		/****** md5 signature: 44ee55cccd1f2351430fc6c01a780ed0 ******/
		%feature("compactdefaultargs") GMapShapes;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") GMapShapes;
		void GMapShapes(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** TopOpeBRepBuild_Builder::GMergeEdgeWES ******/
		/****** md5 signature: 049b72e73e6bcd77631b9ec8abe03a9f ******/
		%feature("compactdefaultargs") GMergeEdgeWES;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") GMergeEdgeWES;
		void GMergeEdgeWES(const TopoDS_Shape & E, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****** TopOpeBRepBuild_Builder::GMergeEdges ******/
		/****** md5 signature: 64861988a847c3795558ebe5ea4fc371 ******/
		%feature("compactdefaultargs") GMergeEdges;
		%feature("autodoc", "
Parameters
----------
LE1: TopTools_ListOfShape
LE2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo

Return
-------
None

Description
-----------
No available documentation.
") GMergeEdges;
		void GMergeEdges(const TopTools_ListOfShape & LE1, const TopTools_ListOfShape & LE2, const TopOpeBRepBuild_GTopo & G);

		/****** TopOpeBRepBuild_Builder::GMergeFaceSFS ******/
		/****** md5 signature: d5d3648aa42cd86a44acaab0e55b8c1a ******/
		%feature("compactdefaultargs") GMergeFaceSFS;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Return
-------
None

Description
-----------
No available documentation.
") GMergeFaceSFS;
		void GMergeFaceSFS(const TopoDS_Shape & F, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****** TopOpeBRepBuild_Builder::GMergeFaces ******/
		/****** md5 signature: eefcc3df84a794bed645c660121fc977 ******/
		%feature("compactdefaultargs") GMergeFaces;
		%feature("autodoc", "
Parameters
----------
LF1: TopTools_ListOfShape
LF2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo

Return
-------
None

Description
-----------
No available documentation.
") GMergeFaces;
		void GMergeFaces(const TopTools_ListOfShape & LF1, const TopTools_ListOfShape & LF2, const TopOpeBRepBuild_GTopo & G);

		/****** TopOpeBRepBuild_Builder::GMergeSolids ******/
		/****** md5 signature: 1bd390c213acfdf2f6809ff44ecbae4b ******/
		%feature("compactdefaultargs") GMergeSolids;
		%feature("autodoc", "
Parameters
----------
LSO1: TopTools_ListOfShape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo

Return
-------
None

Description
-----------
No available documentation.
") GMergeSolids;
		void GMergeSolids(const TopTools_ListOfShape & LSO1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G);

		/****** TopOpeBRepBuild_Builder::GPVSMakeEdges ******/
		/****** md5 signature: eb3f937080dae972cfc4ec233b58a1cb ******/
		%feature("compactdefaultargs") GPVSMakeEdges;
		%feature("autodoc", "
Parameters
----------
EF: TopoDS_Shape
PVS: TopOpeBRepBuild_PaveSet
LOE: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GPVSMakeEdges;
		void GPVSMakeEdges(const TopoDS_Shape & EF, TopOpeBRepBuild_PaveSet & PVS, TopTools_ListOfShape & LOE);

		/****** TopOpeBRepBuild_Builder::GParamOnReference ******/
		/****** md5 signature: 2e0c78b5eb444ed3fd8a408dee9e53d2 ******/
		%feature("compactdefaultargs") GParamOnReference;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
P: double

Description
-----------
No available documentation.
") GParamOnReference;
		bool GParamOnReference(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue);

		/****** TopOpeBRepBuild_Builder::GSFSMakeSolids ******/
		/****** md5 signature: 031354c24419fa93429304be8098c564 ******/
		%feature("compactdefaultargs") GSFSMakeSolids;
		%feature("autodoc", "
Parameters
----------
SOF: TopoDS_Shape
SFS: TopOpeBRepBuild_ShellFaceSet
LOSO: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GSFSMakeSolids;
		void GSFSMakeSolids(const TopoDS_Shape & SOF, TopOpeBRepBuild_ShellFaceSet & SFS, TopTools_ListOfShape & LOSO);

		/****** TopOpeBRepBuild_Builder::GSOBUMakeSolids ******/
		/****** md5 signature: 5a014108c6abc23615a0ba533e922792 ******/
		%feature("compactdefaultargs") GSOBUMakeSolids;
		%feature("autodoc", "
Parameters
----------
SOF: TopoDS_Shape
SOBU: TopOpeBRepBuild_SolidBuilder
LOSO: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GSOBUMakeSolids;
		void GSOBUMakeSolids(const TopoDS_Shape & SOF, TopOpeBRepBuild_SolidBuilder & SOBU, TopTools_ListOfShape & LOSO);

		/****** TopOpeBRepBuild_Builder::GShapeRank ******/
		/****** md5 signature: 3aac5258e88c5cf4239265696b9c70bb ******/
		%feature("compactdefaultargs") GShapeRank;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") GShapeRank;
		int GShapeRank(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_Builder::GSplitEdge ******/
		/****** md5 signature: 60cc0618e9261e9770dec21cf66993ea ******/
		%feature("compactdefaultargs") GSplitEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
G: TopOpeBRepBuild_GTopo
LSclass: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GSplitEdge;
		void GSplitEdge(const TopoDS_Shape & E, const TopOpeBRepBuild_GTopo & G, const TopTools_ListOfShape & LSclass);

		/****** TopOpeBRepBuild_Builder::GSplitEdgeWES ******/
		/****** md5 signature: 1af600445a1f78072a8abaab2b759042 ******/
		%feature("compactdefaultargs") GSplitEdgeWES;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
LF2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") GSplitEdgeWES;
		void GSplitEdgeWES(const TopoDS_Shape & E, const TopTools_ListOfShape & LF2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****** TopOpeBRepBuild_Builder::GSplitFace ******/
		/****** md5 signature: 6a836ff722657ad38194533310ab7d20 ******/
		%feature("compactdefaultargs") GSplitFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
G: TopOpeBRepBuild_GTopo
LSclass: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GSplitFace;
		void GSplitFace(const TopoDS_Shape & F, const TopOpeBRepBuild_GTopo & G, const TopTools_ListOfShape & LSclass);

		/****** TopOpeBRepBuild_Builder::GSplitFaceSFS ******/
		/****** md5 signature: d4d0deefa2c06eae870c95833d372fd6 ******/
		%feature("compactdefaultargs") GSplitFaceSFS;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Shape
LSclass: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Return
-------
None

Description
-----------
No available documentation.
") GSplitFaceSFS;
		void GSplitFaceSFS(const TopoDS_Shape & F1, const TopTools_ListOfShape & LSclass, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****** TopOpeBRepBuild_Builder::GTakeCommonOfDiff ******/
		/****** md5 signature: 981561b856928c26ab3983da1f5acb12 ******/
		%feature("compactdefaultargs") GTakeCommonOfDiff;
		%feature("autodoc", "
Parameters
----------
G: TopOpeBRepBuild_GTopo

Return
-------
bool

Description
-----------
No available documentation.
") GTakeCommonOfDiff;
		static bool GTakeCommonOfDiff(const TopOpeBRepBuild_GTopo & G);

		/****** TopOpeBRepBuild_Builder::GTakeCommonOfSame ******/
		/****** md5 signature: 15ecad1f50ec7cb71476dc3c4acc7749 ******/
		%feature("compactdefaultargs") GTakeCommonOfSame;
		%feature("autodoc", "
Parameters
----------
G: TopOpeBRepBuild_GTopo

Return
-------
bool

Description
-----------
No available documentation.
") GTakeCommonOfSame;
		static bool GTakeCommonOfSame(const TopOpeBRepBuild_GTopo & G);

		/****** TopOpeBRepBuild_Builder::GToMerge ******/
		/****** md5 signature: 741ab5e43dcfd2020193d2b297eb459e ******/
		%feature("compactdefaultargs") GToMerge;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") GToMerge;
		bool GToMerge(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_Builder::GToSplit ******/
		/****** md5 signature: a206dcc345e6b976afd88fa01980d4ac ******/
		%feature("compactdefaultargs") GToSplit;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TB: TopAbs_State

Return
-------
bool

Description
-----------
No available documentation.
") GToSplit;
		bool GToSplit(const TopoDS_Shape & S, const TopAbs_State TB);

		/****** TopOpeBRepBuild_Builder::GWESMakeFaces ******/
		/****** md5 signature: 69933900bbbcc0f2889dbae61f42b035 ******/
		%feature("compactdefaultargs") GWESMakeFaces;
		%feature("autodoc", "
Parameters
----------
FF: TopoDS_Shape
WES: TopOpeBRepBuild_WireEdgeSet
LOF: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GWESMakeFaces;
		virtual void GWESMakeFaces(const TopoDS_Shape & FF, TopOpeBRepBuild_WireEdgeSet & WES, TopTools_ListOfShape & LOF);

		/****** TopOpeBRepBuild_Builder::GcheckNBOUNDS ******/
		/****** md5 signature: e0c71a6034f948ea269a09f89c3fbaf3 ******/
		%feature("compactdefaultargs") GcheckNBOUNDS;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") GcheckNBOUNDS;
		static bool GcheckNBOUNDS(const TopoDS_Shape & E);

		/****** TopOpeBRepBuild_Builder::GdumpEDBU ******/
		/****** md5 signature: 28397c3153ddcc7446585594598b119d ******/
		%feature("compactdefaultargs") GdumpEDBU;
		%feature("autodoc", "
Parameters
----------
EB: TopOpeBRepBuild_EdgeBuilder

Return
-------
None

Description
-----------
No available documentation.
") GdumpEDBU;
		void GdumpEDBU(TopOpeBRepBuild_EdgeBuilder & EB);

		/****** TopOpeBRepBuild_Builder::GdumpEDG ******/
		/****** md5 signature: a45138a34910627c8fdd1b688d7a8465 ******/
		%feature("compactdefaultargs") GdumpEDG;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
str: void * (optional, default to nullptr)

Return
-------
None

Description
-----------
No available documentation.
") GdumpEDG;
		void GdumpEDG(const TopoDS_Shape & S, void * const str = nullptr);

		/****** TopOpeBRepBuild_Builder::GdumpEDGVER ******/
		/****** md5 signature: 67bf466aba8bafc852ad5f513fbe7475 ******/
		%feature("compactdefaultargs") GdumpEDGVER;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
V: TopoDS_Shape
str: void * (optional, default to nullptr)

Return
-------
None

Description
-----------
No available documentation.
") GdumpEDGVER;
		void GdumpEDGVER(const TopoDS_Shape & E, const TopoDS_Shape & V, void * const str = nullptr);

		/****** TopOpeBRepBuild_Builder::GdumpEXP ******/
		/****** md5 signature: dadc89986f33462511f8e7b7dbb93260 ******/
		%feature("compactdefaultargs") GdumpEXP;
		%feature("autodoc", "
Parameters
----------
E: TopOpeBRepTool_ShapeExplorer

Return
-------
None

Description
-----------
No available documentation.
") GdumpEXP;
		void GdumpEXP(const TopOpeBRepTool_ShapeExplorer & E);

		/****** TopOpeBRepBuild_Builder::GdumpFABU ******/
		/****** md5 signature: 3b5fa97dd7829d0ae436a1bb37939d01 ******/
		%feature("compactdefaultargs") GdumpFABU;
		%feature("autodoc", "
Parameters
----------
FB: TopOpeBRepBuild_FaceBuilder

Return
-------
None

Description
-----------
No available documentation.
") GdumpFABU;
		void GdumpFABU(TopOpeBRepBuild_FaceBuilder & FB);

		/****** TopOpeBRepBuild_Builder::GdumpLS ******/
		/****** md5 signature: cd1ae18564a358e63f245c751f6a4da6 ******/
		%feature("compactdefaultargs") GdumpLS;
		%feature("autodoc", "
Parameters
----------
L: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GdumpLS;
		void GdumpLS(const TopTools_ListOfShape & L);

		/****** TopOpeBRepBuild_Builder::GdumpORIPARPNT ******/
		/****** md5 signature: 66fc8790cf6e13a13131dce956fd9f10 ******/
		%feature("compactdefaultargs") GdumpORIPARPNT;
		%feature("autodoc", "
Parameters
----------
o: TopAbs_Orientation
p: double
Pnt: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GdumpORIPARPNT;
		static void GdumpORIPARPNT(const TopAbs_Orientation o, const double p, const gp_Pnt & Pnt);

		/****** TopOpeBRepBuild_Builder::GdumpPNT ******/
		/****** md5 signature: b2e7b611534f1c09c9a5a7bdba7bfbc9 ******/
		%feature("compactdefaultargs") GdumpPNT;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GdumpPNT;
		static void GdumpPNT(const gp_Pnt & P);

		/****** TopOpeBRepBuild_Builder::GdumpSAMDOM ******/
		/****** md5 signature: 116319ec581b326810280644921f67dd ******/
		%feature("compactdefaultargs") GdumpSAMDOM;
		%feature("autodoc", "
Parameters
----------
L: TopTools_ListOfShape
str: void * (optional, default to nullptr)

Return
-------
None

Description
-----------
No available documentation.
") GdumpSAMDOM;
		void GdumpSAMDOM(const TopTools_ListOfShape & L, void * const str = nullptr);

		/****** TopOpeBRepBuild_Builder::GdumpSHA ******/
		/****** md5 signature: 291053d47370dd34347df65dede1d9ea ******/
		%feature("compactdefaultargs") GdumpSHA;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
str: void * (optional, default to nullptr)

Return
-------
None

Description
-----------
No available documentation.
") GdumpSHA;
		void GdumpSHA(const TopoDS_Shape & S, void * const str = nullptr);

		/****** TopOpeBRepBuild_Builder::GdumpSHAORI ******/
		/****** md5 signature: ab28e8a1b5f06ac29453eeb26176d5c4 ******/
		%feature("compactdefaultargs") GdumpSHAORI;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
str: void * (optional, default to nullptr)

Return
-------
None

Description
-----------
No available documentation.
") GdumpSHAORI;
		void GdumpSHAORI(const TopoDS_Shape & S, void * const str = nullptr);

		/****** TopOpeBRepBuild_Builder::GdumpSHAORIGEO ******/
		/****** md5 signature: 15c482163404c67fb5b222e5ef4c69bc ******/
		%feature("compactdefaultargs") GdumpSHAORIGEO;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
str: void * (optional, default to nullptr)

Return
-------
None

Description
-----------
No available documentation.
") GdumpSHAORIGEO;
		void GdumpSHAORIGEO(const TopoDS_Shape & S, void * const str = nullptr);

		/****** TopOpeBRepBuild_Builder::GdumpSHASETindex ******/
		/****** md5 signature: b18b53093f4cc6d38aec03f5c58ab0f0 ******/
		%feature("compactdefaultargs") GdumpSHASETindex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GdumpSHASETindex;
		int GdumpSHASETindex();

		/****** TopOpeBRepBuild_Builder::GdumpSHASETreset ******/
		/****** md5 signature: 858d9a6d70c3592e32b403720974577a ******/
		%feature("compactdefaultargs") GdumpSHASETreset;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GdumpSHASETreset;
		void GdumpSHASETreset();

		/****** TopOpeBRepBuild_Builder::GdumpSHASTA ******/
		/****** md5 signature: 3a10cbdc21f3058d34b8bbc351a8ce3a ******/
		%feature("compactdefaultargs") GdumpSHASTA;
		%feature("autodoc", "
Parameters
----------
iS: int
T: TopAbs_State
a: str (optional, default to "")
b: str (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") GdumpSHASTA;
		void GdumpSHASTA(const int iS, const TopAbs_State T, TCollection_AsciiString a = "", TCollection_AsciiString b = "");

		/****** TopOpeBRepBuild_Builder::GdumpSHASTA ******/
		/****** md5 signature: cad20edf8bfe449486276d27f8ff1f74 ******/
		%feature("compactdefaultargs") GdumpSHASTA;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
T: TopAbs_State
a: str (optional, default to "")
b: str (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") GdumpSHASTA;
		void GdumpSHASTA(const TopoDS_Shape & S, const TopAbs_State T, TCollection_AsciiString a = "", TCollection_AsciiString b = "");

		/****** TopOpeBRepBuild_Builder::GdumpSHASTA ******/
		/****** md5 signature: b8baaaa5ed12dbda0175436287656a3f ******/
		%feature("compactdefaultargs") GdumpSHASTA;
		%feature("autodoc", "
Parameters
----------
iS: int
T: TopAbs_State
SS: TopOpeBRepBuild_ShapeSet
a: str (optional, default to "")
b: str (optional, default to "")
c: str (optional, default to '\n')

Return
-------
None

Description
-----------
No available documentation.
") GdumpSHASTA;
		void GdumpSHASTA(const int iS, const TopAbs_State T, const TopOpeBRepBuild_ShapeSet & SS, TCollection_AsciiString a = "", TCollection_AsciiString b = "", TCollection_AsciiString c = "\n");

		/****** TopOpeBRepBuild_Builder::GdumpSOBU ******/
		/****** md5 signature: 1aea67b9789dcd3f2eb7ecd482cf35ab ******/
		%feature("compactdefaultargs") GdumpSOBU;
		%feature("autodoc", "
Parameters
----------
SB: TopOpeBRepBuild_SolidBuilder

Return
-------
None

Description
-----------
No available documentation.
") GdumpSOBU;
		void GdumpSOBU(TopOpeBRepBuild_SolidBuilder & SB);

		/****** TopOpeBRepBuild_Builder::GtraceSPS ******/
		/****** md5 signature: 6c2391447912540a9c424aa01e8b81ba ******/
		%feature("compactdefaultargs") GtraceSPS;
		%feature("autodoc", "
Parameters
----------
iS: int

Return
-------
bool

Description
-----------
No available documentation.
") GtraceSPS;
		bool GtraceSPS(const int iS);

		/****** TopOpeBRepBuild_Builder::GtraceSPS ******/
		/****** md5 signature: cf593a6d6190c95c4e845de338f2a023 ******/
		%feature("compactdefaultargs") GtraceSPS;
		%feature("autodoc", "
Parameters
----------
iS: int
jS: int

Return
-------
bool

Description
-----------
No available documentation.
") GtraceSPS;
		bool GtraceSPS(const int iS, const int jS);

		/****** TopOpeBRepBuild_Builder::GtraceSPS ******/
		/****** md5 signature: d7211736311cc54e6c55a6b45dea071f ******/
		%feature("compactdefaultargs") GtraceSPS;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") GtraceSPS;
		bool GtraceSPS(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_Builder::GtraceSPS ******/
		/****** md5 signature: 528f28b4183af50565adb19453eccf1f ******/
		%feature("compactdefaultargs") GtraceSPS;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
IS: int

Description
-----------
No available documentation.
") GtraceSPS;
		bool GtraceSPS(const TopoDS_Shape & S, Standard_Integer &OutValue);

		/****** TopOpeBRepBuild_Builder::InitSection ******/
		/****** md5 signature: f27058639d6e6094640ca4c517e04af9 ******/
		%feature("compactdefaultargs") InitSection;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitSection;
		void InitSection();

		/****** TopOpeBRepBuild_Builder::IsKPart ******/
		/****** md5 signature: 3f53c1f314824fc6dc2aed1888adb38e ******/
		%feature("compactdefaultargs") IsKPart;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IsKPart;
		int IsKPart();

		/****** TopOpeBRepBuild_Builder::IsMerged ******/
		/****** md5 signature: b12a7b8b3a19664bfb97cb280a24aeac ******/
		%feature("compactdefaultargs") IsMerged;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TB: TopAbs_State

Return
-------
bool

Description
-----------
Returns True if the shape <S> has been merged.
") IsMerged;
		bool IsMerged(const TopoDS_Shape & S, const TopAbs_State TB);

		/****** TopOpeBRepBuild_Builder::IsShapeOf ******/
		/****** md5 signature: 154c92b28702493e2cd3ff803aed23e0 ******/
		%feature("compactdefaultargs") IsShapeOf;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
I12: int

Return
-------
bool

Description
-----------
No available documentation.
") IsShapeOf;
		bool IsShapeOf(const TopoDS_Shape & S, const int I12);

		/****** TopOpeBRepBuild_Builder::IsSplit ******/
		/****** md5 signature: 93f2a0d4c7c0d9b8657dcafb8355abae ******/
		%feature("compactdefaultargs") IsSplit;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TB: TopAbs_State

Return
-------
bool

Description
-----------
Returns True if the shape <S> has been split.
") IsSplit;
		bool IsSplit(const TopoDS_Shape & S, const TopAbs_State TB);

		/****** TopOpeBRepBuild_Builder::KPClearMaps ******/
		/****** md5 signature: 1d528f7666001e87151255777251419c ******/
		%feature("compactdefaultargs") KPClearMaps;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") KPClearMaps;
		void KPClearMaps();

		/****** TopOpeBRepBuild_Builder::KPContains ******/
		/****** md5 signature: 1ea0d74e5676d00263ac2d2fc03804cc ******/
		%feature("compactdefaultargs") KPContains;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
L: TopTools_ListOfShape

Return
-------
bool

Description
-----------
No available documentation.
") KPContains;
		static bool KPContains(const TopoDS_Shape & S, const TopTools_ListOfShape & L);

		/****** TopOpeBRepBuild_Builder::KPSameDomain ******/
		/****** md5 signature: ef737dd14998c9dc23971a088b8daa62 ******/
		%feature("compactdefaultargs") KPSameDomain;
		%feature("autodoc", "
Parameters
----------
L1: TopTools_ListOfShape
L2: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") KPSameDomain;
		void KPSameDomain(TopTools_ListOfShape & L1, TopTools_ListOfShape & L2);

		/****** TopOpeBRepBuild_Builder::KPclasSS ******/
		/****** md5 signature: b6ec387bdd9a8d63314f72c8b16af3b8 ******/
		%feature("compactdefaultargs") KPclasSS;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
exceptLS1: TopTools_ListOfShape
S2: TopoDS_Shape

Return
-------
TopAbs_State

Description
-----------
No available documentation.
") KPclasSS;
		TopAbs_State KPclasSS(const TopoDS_Shape & S1, const TopTools_ListOfShape & exceptLS1, const TopoDS_Shape & S2);

		/****** TopOpeBRepBuild_Builder::KPclasSS ******/
		/****** md5 signature: d57f31fbfddcb0cc64704b29cb6b06d6 ******/
		%feature("compactdefaultargs") KPclasSS;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
exceptS1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
TopAbs_State

Description
-----------
No available documentation.
") KPclasSS;
		TopAbs_State KPclasSS(const TopoDS_Shape & S1, const TopoDS_Shape & exceptS1, const TopoDS_Shape & S2);

		/****** TopOpeBRepBuild_Builder::KPclasSS ******/
		/****** md5 signature: 7b816ac0db011918ea4b6bab862633bd ******/
		%feature("compactdefaultargs") KPclasSS;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
TopAbs_State

Description
-----------
No available documentation.
") KPclasSS;
		TopAbs_State KPclasSS(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** TopOpeBRepBuild_Builder::KPclassF ******/
		/****** md5 signature: 8b3aab3e544b985f3be18249edbbe100 ******/
		%feature("compactdefaultargs") KPclassF;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Shape
F2: TopoDS_Shape

Return
-------
TopAbs_State

Description
-----------
No available documentation.
") KPclassF;
		TopAbs_State KPclassF(const TopoDS_Shape & F1, const TopoDS_Shape & F2);

		/****** TopOpeBRepBuild_Builder::KPclassFF ******/
		/****** md5 signature: dd90793b0548c8ba1b31a61db8711199 ******/
		%feature("compactdefaultargs") KPclassFF;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Shape
F2: TopoDS_Shape

Return
-------
T1: TopAbs_State
T2: TopAbs_State

Description
-----------
No available documentation.
") KPclassFF;
		void KPclassFF(const TopoDS_Shape & F1, const TopoDS_Shape & F2, TopAbs_State &OutValue, TopAbs_State &OutValue);

		/****** TopOpeBRepBuild_Builder::KPisdisj ******/
		/****** md5 signature: eb7b31a8a2f83192408a1783ef3ffc2d ******/
		%feature("compactdefaultargs") KPisdisj;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") KPisdisj;
		int KPisdisj();

		/****** TopOpeBRepBuild_Builder::KPisdisjanalyse ******/
		/****** md5 signature: 40d90487be19fe332fc9cf464668955c ******/
		%feature("compactdefaultargs") KPisdisjanalyse;
		%feature("autodoc", "
Parameters
----------
ST1: TopAbs_State
ST2: TopAbs_State

Return
-------
I: int
IC1: int
IC2: int

Description
-----------
No available documentation.
") KPisdisjanalyse;
		void KPisdisjanalyse(const TopAbs_State ST1, const TopAbs_State ST2, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** TopOpeBRepBuild_Builder::KPisdisjsh ******/
		/****** md5 signature: 0b0f765216601d4c5123d627353dc4c8 ******/
		%feature("compactdefaultargs") KPisdisjsh;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") KPisdisjsh;
		int KPisdisjsh(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_Builder::KPisfafa ******/
		/****** md5 signature: f31fe4c8bb2508743b8523c81d6416ad ******/
		%feature("compactdefaultargs") KPisfafa;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") KPisfafa;
		int KPisfafa();

		/****** TopOpeBRepBuild_Builder::KPisfafash ******/
		/****** md5 signature: 786c07c3d0f89da40880b98242805c0d ******/
		%feature("compactdefaultargs") KPisfafash;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") KPisfafash;
		int KPisfafash(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_Builder::KPiskole ******/
		/****** md5 signature: f2f7bdc52646f55b4bd673efe8b4980a ******/
		%feature("compactdefaultargs") KPiskole;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") KPiskole;
		int KPiskole();

		/****** TopOpeBRepBuild_Builder::KPiskoleFF ******/
		/****** md5 signature: 190657a2e21c713c32ddb102f8e9c6e6 ******/
		%feature("compactdefaultargs") KPiskoleFF;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Shape
F2: TopoDS_Shape

Return
-------
T1: TopAbs_State
T2: TopAbs_State

Description
-----------
No available documentation.
") KPiskoleFF;
		bool KPiskoleFF(const TopoDS_Shape & F1, const TopoDS_Shape & F2, TopAbs_State &OutValue, TopAbs_State &OutValue);

		/****** TopOpeBRepBuild_Builder::KPiskoleanalyse ******/
		/****** md5 signature: bcf4108d46c29c82183467cf0e9ba1ba ******/
		%feature("compactdefaultargs") KPiskoleanalyse;
		%feature("autodoc", "
Parameters
----------
FT1: TopAbs_State
FT2: TopAbs_State
ST1: TopAbs_State
ST2: TopAbs_State

Return
-------
I: int
I1: int
I2: int

Description
-----------
No available documentation.
") KPiskoleanalyse;
		void KPiskoleanalyse(const TopAbs_State FT1, const TopAbs_State FT2, const TopAbs_State ST1, const TopAbs_State ST2, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** TopOpeBRepBuild_Builder::KPiskolesh ******/
		/****** md5 signature: 7ba76495ddaf3c5f15814c897aec78fd ******/
		%feature("compactdefaultargs") KPiskolesh;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
LS: TopTools_ListOfShape
LF: TopTools_ListOfShape

Return
-------
bool

Description
-----------
No available documentation.
") KPiskolesh;
		bool KPiskolesh(const TopoDS_Shape & S, TopTools_ListOfShape & LS, TopTools_ListOfShape & LF);

		/****** TopOpeBRepBuild_Builder::KPiskoletge ******/
		/****** md5 signature: 4ac061eb967b4104354c81b930856235 ******/
		%feature("compactdefaultargs") KPiskoletge;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") KPiskoletge;
		int KPiskoletge();

		/****** TopOpeBRepBuild_Builder::KPiskoletgeanalyse ******/
		/****** md5 signature: 54008042c83a77254c78a3cf161a2e38 ******/
		%feature("compactdefaultargs") KPiskoletgeanalyse;
		%feature("autodoc", "
Parameters
----------
Conf: TopOpeBRepDS_Config
ST1: TopAbs_State
ST2: TopAbs_State

Return
-------
I: int

Description
-----------
No available documentation.
") KPiskoletgeanalyse;
		void KPiskoletgeanalyse(const TopOpeBRepDS_Config Conf, const TopAbs_State ST1, const TopAbs_State ST2, Standard_Integer &OutValue);

		/****** TopOpeBRepBuild_Builder::KPiskoletgesh ******/
		/****** md5 signature: cce8e402d46c8b2114d3608248013d4a ******/
		%feature("compactdefaultargs") KPiskoletgesh;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
LS: TopTools_ListOfShape
LF: TopTools_ListOfShape

Return
-------
bool

Description
-----------
No available documentation.
") KPiskoletgesh;
		bool KPiskoletgesh(const TopoDS_Shape & S, TopTools_ListOfShape & LS, TopTools_ListOfShape & LF);

		/****** TopOpeBRepBuild_Builder::KPissoso ******/
		/****** md5 signature: ab59bdfa5583c46a75e2360b539c838e ******/
		%feature("compactdefaultargs") KPissoso;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") KPissoso;
		int KPissoso();

		/****** TopOpeBRepBuild_Builder::KPissososh ******/
		/****** md5 signature: b96199de581984afdcf39bb6bac92862 ******/
		%feature("compactdefaultargs") KPissososh;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") KPissososh;
		int KPissososh(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_Builder::KPlhg ******/
		/****** md5 signature: 599541210df11fa4de838fe9c1fb6bd5 ******/
		%feature("compactdefaultargs") KPlhg;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
T: TopAbs_ShapeEnum
L: TopTools_ListOfShape

Return
-------
int

Description
-----------
No available documentation.
") KPlhg;
		int KPlhg(const TopoDS_Shape & S, const TopAbs_ShapeEnum T, TopTools_ListOfShape & L);

		/****** TopOpeBRepBuild_Builder::KPlhg ******/
		/****** md5 signature: ed32b444d3354d0eb3bea213cea36270 ******/
		%feature("compactdefaultargs") KPlhg;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
T: TopAbs_ShapeEnum

Return
-------
int

Description
-----------
No available documentation.
") KPlhg;
		int KPlhg(const TopoDS_Shape & S, const TopAbs_ShapeEnum T);

		/****** TopOpeBRepBuild_Builder::KPlhsd ******/
		/****** md5 signature: 3bd2322232ea472658d2154eed46a9e8 ******/
		%feature("compactdefaultargs") KPlhsd;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
T: TopAbs_ShapeEnum
L: TopTools_ListOfShape

Return
-------
int

Description
-----------
No available documentation.
") KPlhsd;
		int KPlhsd(const TopoDS_Shape & S, const TopAbs_ShapeEnum T, TopTools_ListOfShape & L);

		/****** TopOpeBRepBuild_Builder::KPlhsd ******/
		/****** md5 signature: 7630b1233110e3a42a433c8802368375 ******/
		%feature("compactdefaultargs") KPlhsd;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
T: TopAbs_ShapeEnum

Return
-------
int

Description
-----------
No available documentation.
") KPlhsd;
		int KPlhsd(const TopoDS_Shape & S, const TopAbs_ShapeEnum T);

		/****** TopOpeBRepBuild_Builder::KPls ******/
		/****** md5 signature: 44211b94e2b6ec12d8ef6cb0c7cc96bd ******/
		%feature("compactdefaultargs") KPls;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
T: TopAbs_ShapeEnum
L: TopTools_ListOfShape

Return
-------
int

Description
-----------
No available documentation.
") KPls;
		static int KPls(const TopoDS_Shape & S, const TopAbs_ShapeEnum T, TopTools_ListOfShape & L);

		/****** TopOpeBRepBuild_Builder::KPls ******/
		/****** md5 signature: 178fa501f9cac3b79c0e429f4fb9636e ******/
		%feature("compactdefaultargs") KPls;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
T: TopAbs_ShapeEnum

Return
-------
int

Description
-----------
No available documentation.
") KPls;
		static int KPls(const TopoDS_Shape & S, const TopAbs_ShapeEnum T);

		/****** TopOpeBRepBuild_Builder::KPmakeface ******/
		/****** md5 signature: 7ba424d9e6065b6faa56a36883d218e1 ******/
		%feature("compactdefaultargs") KPmakeface;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Shape
LF2: TopTools_ListOfShape
T1: TopAbs_State
T2: TopAbs_State
R1: bool
R2: bool

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") KPmakeface;
		TopoDS_Shape KPmakeface(const TopoDS_Shape & F1, const TopTools_ListOfShape & LF2, const TopAbs_State T1, const TopAbs_State T2, const bool R1, const bool R2);

		/****** TopOpeBRepBuild_Builder::KPreturn ******/
		/****** md5 signature: 77337cc8ebfed70d1a55e1934c6466f2 ******/
		%feature("compactdefaultargs") KPreturn;
		%feature("autodoc", "
Parameters
----------
KP: int

Return
-------
int

Description
-----------
No available documentation.
") KPreturn;
		static int KPreturn(const int KP);

		/****** TopOpeBRepBuild_Builder::KeepShape ******/
		/****** md5 signature: 55a86492ea4c0727b2223b2bfe8812ca ******/
		%feature("compactdefaultargs") KeepShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
LS: TopTools_ListOfShape
T: TopAbs_State

Return
-------
bool

Description
-----------
No available documentation.
") KeepShape;
		bool KeepShape(const TopoDS_Shape & S, const TopTools_ListOfShape & LS, const TopAbs_State T);

		/****** TopOpeBRepBuild_Builder::MSplit ******/
		/****** md5 signature: 1bdfdc4f03895934ddc99f1c21529f82 ******/
		%feature("compactdefaultargs") MSplit;
		%feature("autodoc", "
Parameters
----------
s: TopAbs_State

Return
-------
NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher>

Description
-----------
No available documentation.
") MSplit;
		const NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher> MSplit(const TopAbs_State s);

		/****** TopOpeBRepBuild_Builder::MakeEdges ******/
		/****** md5 signature: 5953c55031c0671d386f9c796750e364 ******/
		%feature("compactdefaultargs") MakeEdges;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
B: TopOpeBRepBuild_EdgeBuilder
L: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") MakeEdges;
		void MakeEdges(const TopoDS_Shape & E, TopOpeBRepBuild_EdgeBuilder & B, TopTools_ListOfShape & L);

		/****** TopOpeBRepBuild_Builder::MakeFaces ******/
		/****** md5 signature: 57abf40bb1d56ca74765d00f5f62bef7 ******/
		%feature("compactdefaultargs") MakeFaces;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
B: TopOpeBRepBuild_FaceBuilder
L: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") MakeFaces;
		void MakeFaces(const TopoDS_Shape & F, TopOpeBRepBuild_FaceBuilder & B, TopTools_ListOfShape & L);

		/****** TopOpeBRepBuild_Builder::MakeShells ******/
		/****** md5 signature: b506e01089aa44ec0a265b92031d05d6 ******/
		%feature("compactdefaultargs") MakeShells;
		%feature("autodoc", "
Parameters
----------
B: TopOpeBRepBuild_SolidBuilder
L: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") MakeShells;
		void MakeShells(TopOpeBRepBuild_SolidBuilder & B, TopTools_ListOfShape & L);

		/****** TopOpeBRepBuild_Builder::MakeSolids ******/
		/****** md5 signature: dd8e21dbd023439d0992c546d1a17620 ******/
		%feature("compactdefaultargs") MakeSolids;
		%feature("autodoc", "
Parameters
----------
B: TopOpeBRepBuild_SolidBuilder
L: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") MakeSolids;
		void MakeSolids(TopOpeBRepBuild_SolidBuilder & B, TopTools_ListOfShape & L);

		/****** TopOpeBRepBuild_Builder::MapShapes ******/
		/****** md5 signature: e9d3fcdd2a8a024ad795f312ab0fad1d ******/
		%feature("compactdefaultargs") MapShapes;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MapShapes;
		void MapShapes(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** TopOpeBRepBuild_Builder::MergeEdges ******/
		/****** md5 signature: c2d8826faaab9fe3fa7df7d0a077bba7 ******/
		%feature("compactdefaultargs") MergeEdges;
		%feature("autodoc", "
Parameters
----------
L1: TopTools_ListOfShape
TB1: TopAbs_State
L2: TopTools_ListOfShape
TB2: TopAbs_State
onA: bool (optional, default to false)
onB: bool (optional, default to false)
onAB: bool (optional, default to false)

Return
-------
None

Description
-----------
Merges the two edges <S1> and <S2> keeping the parts in each edge of states <TB1> and <TB2>. Booleans onA, onB, onAB indicate whether parts of edges found as state ON respectively on first, second, and both shapes must be (or not) built.
") MergeEdges;
		void MergeEdges(const TopTools_ListOfShape & L1, const TopAbs_State TB1, const TopTools_ListOfShape & L2, const TopAbs_State TB2, const bool onA = false, const bool onB = false, const bool onAB = false);

		/****** TopOpeBRepBuild_Builder::MergeFaces ******/
		/****** md5 signature: 8cf4068bc2741e7e6beb10dc14789d7a ******/
		%feature("compactdefaultargs") MergeFaces;
		%feature("autodoc", "
Parameters
----------
S1: TopTools_ListOfShape
TB1: TopAbs_State
S2: TopTools_ListOfShape
TB2: TopAbs_State
onA: bool (optional, default to false)
onB: bool (optional, default to false)
onAB: bool (optional, default to false)

Return
-------
None

Description
-----------
Merges the two faces <S1> and <S2> keeping the parts in each face of states <TB1> and <TB2>.
") MergeFaces;
		void MergeFaces(const TopTools_ListOfShape & S1, const TopAbs_State TB1, const TopTools_ListOfShape & S2, const TopAbs_State TB2, const bool onA = false, const bool onB = false, const bool onAB = false);

		/****** TopOpeBRepBuild_Builder::MergeKPart ******/
		/****** md5 signature: 84113157513a352ebae25f2922b94101 ******/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MergeKPart;
		virtual void MergeKPart();

		/****** TopOpeBRepBuild_Builder::MergeKPart ******/
		/****** md5 signature: cc91d51623406e21a4b045a5dd803cae ******/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", "
Parameters
----------
TB1: TopAbs_State
TB2: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") MergeKPart;
		virtual void MergeKPart(const TopAbs_State TB1, const TopAbs_State TB2);

		/****** TopOpeBRepBuild_Builder::MergeKPartisdisj ******/
		/****** md5 signature: 451dda0b1fea96ec67eddb7af21a4992 ******/
		%feature("compactdefaultargs") MergeKPartisdisj;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MergeKPartisdisj;
		void MergeKPartisdisj();

		/****** TopOpeBRepBuild_Builder::MergeKPartisfafa ******/
		/****** md5 signature: c5226c87c8a7f951cc66f0ffe1017ef8 ******/
		%feature("compactdefaultargs") MergeKPartisfafa;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MergeKPartisfafa;
		void MergeKPartisfafa();

		/****** TopOpeBRepBuild_Builder::MergeKPartiskole ******/
		/****** md5 signature: 4db93b7123f424f7dc73d30b05ed4526 ******/
		%feature("compactdefaultargs") MergeKPartiskole;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MergeKPartiskole;
		void MergeKPartiskole();

		/****** TopOpeBRepBuild_Builder::MergeKPartiskoletge ******/
		/****** md5 signature: 752b685f17c596098295a4de24d5db13 ******/
		%feature("compactdefaultargs") MergeKPartiskoletge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MergeKPartiskoletge;
		void MergeKPartiskoletge();

		/****** TopOpeBRepBuild_Builder::MergeKPartissoso ******/
		/****** md5 signature: f624ae3f879a4f3f25dfbd0dbab2ef1d ******/
		%feature("compactdefaultargs") MergeKPartissoso;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MergeKPartissoso;
		void MergeKPartissoso();

		/****** TopOpeBRepBuild_Builder::MergeShapes ******/
		/****** md5 signature: 636b2f3679903a68befa397bca4894b5 ******/
		%feature("compactdefaultargs") MergeShapes;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
TB1: TopAbs_State
S2: TopoDS_Shape
TB2: TopAbs_State

Return
-------
None

Description
-----------
Merges the two shapes <S1> and <S2> keeping the parts of states <TB1>,<TB2> in <S1>,<S2>.
") MergeShapes;
		void MergeShapes(const TopoDS_Shape & S1, const TopAbs_State TB1, const TopoDS_Shape & S2, const TopAbs_State TB2);

		/****** TopOpeBRepBuild_Builder::MergeSolid ******/
		/****** md5 signature: dadbcac87fb02bfa7f2c7004eb8c0e8f ******/
		%feature("compactdefaultargs") MergeSolid;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TB: TopAbs_State

Return
-------
None

Description
-----------
Merges the solid <S> keeping the parts of state <TB>.
") MergeSolid;
		void MergeSolid(const TopoDS_Shape & S, const TopAbs_State TB);

		/****** TopOpeBRepBuild_Builder::MergeSolids ******/
		/****** md5 signature: ad6aa825ea70349a881f7c3ac9f6ce03 ******/
		%feature("compactdefaultargs") MergeSolids;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
TB1: TopAbs_State
S2: TopoDS_Shape
TB2: TopAbs_State

Return
-------
None

Description
-----------
Merges the two solids <S1> and <S2> keeping the parts in each solid of states <TB1> and <TB2>.
") MergeSolids;
		void MergeSolids(const TopoDS_Shape & S1, const TopAbs_State TB1, const TopoDS_Shape & S2, const TopAbs_State TB2);

		/****** TopOpeBRepBuild_Builder::Merged ******/
		/****** md5 signature: 4724ee301d458253fdc2b556d484d458 ******/
		%feature("compactdefaultargs") Merged;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TB: TopAbs_State

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the merged parts <TB> of shape <S>.
") Merged;
		const TopTools_ListOfShape & Merged(const TopoDS_Shape & S, const TopAbs_State TB);

		/****** TopOpeBRepBuild_Builder::NewEdges ******/
		/****** md5 signature: 9ec982f5f3014b1590bdac140184735d ******/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the edges created on curve <I>.
") NewEdges;
		const TopTools_ListOfShape & NewEdges(const int I);

		/****** TopOpeBRepBuild_Builder::NewFaces ******/
		/****** md5 signature: 96a08f871c044c95bf0a5b942b6f1d59 ******/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the faces created on surface <I>.
") NewFaces;
		const TopTools_ListOfShape & NewFaces(const int I);

		/****** TopOpeBRepBuild_Builder::NewVertex ******/
		/****** md5 signature: 22041e3bce7e66de68d0cb74a55b4197 ******/
		%feature("compactdefaultargs") NewVertex;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Shape

Description
-----------
Returns the vertex created on point <I>.
") NewVertex;
		const TopoDS_Shape NewVertex(const int I);

		/****** TopOpeBRepBuild_Builder::Opec12 ******/
		/****** md5 signature: 7a2ab10746925a05c57be66568fbfd9b ******/
		%feature("compactdefaultargs") Opec12;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Opec12;
		bool Opec12();

		/****** TopOpeBRepBuild_Builder::Opec21 ******/
		/****** md5 signature: 89c65690d1c0d6fea8f4221dd2c685c6 ******/
		%feature("compactdefaultargs") Opec21;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Opec21;
		bool Opec21();

		/****** TopOpeBRepBuild_Builder::Opecom ******/
		/****** md5 signature: f3d3a762acf55571047670b439fc9242 ******/
		%feature("compactdefaultargs") Opecom;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Opecom;
		bool Opecom();

		/****** TopOpeBRepBuild_Builder::Opefus ******/
		/****** md5 signature: 5b970ec1e90525d3924912b5143a5643 ******/
		%feature("compactdefaultargs") Opefus;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Opefus;
		bool Opefus();

		/****** TopOpeBRepBuild_Builder::Orient ******/
		/****** md5 signature: e8803556526ce8cc880697267b247876 ******/
		%feature("compactdefaultargs") Orient;
		%feature("autodoc", "
Parameters
----------
O: TopAbs_Orientation
R: bool

Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orient;
		static TopAbs_Orientation Orient(const TopAbs_Orientation O, const bool R);

		/****** TopOpeBRepBuild_Builder::Perform ******/
		/****** md5 signature: 737fd9d01d459b713f34117ae5b4b0ed ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
Stores the data structure <HDS>, Create shapes from the new geometries.
") Perform;
		virtual void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****** TopOpeBRepBuild_Builder::Perform ******/
		/****** md5 signature: 7a86cedd59eb1018b87e867a0be8a054 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
None

Description
-----------
Stores the data structure <HDS>, Create shapes from the new geometries, Evaluates if an operation performed on shapes S1,S2 is a particular case.
") Perform;
		virtual void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** TopOpeBRepBuild_Builder::PrintCur ******/
		/****** md5 signature: 98ec9b67ed7893703812ad1922fa4d9a ******/
		%feature("compactdefaultargs") PrintCur;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") PrintCur;
		static void PrintCur(const TopoDS_Edge & E);

		/****** TopOpeBRepBuild_Builder::PrintGeo ******/
		/****** md5 signature: fcdc33f7f3f293226fb5c10c1098522b ******/
		%feature("compactdefaultargs") PrintGeo;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") PrintGeo;
		static void PrintGeo(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_Builder::PrintOri ******/
		/****** md5 signature: f27af39a692659cb41a84f88c22b0ac6 ******/
		%feature("compactdefaultargs") PrintOri;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") PrintOri;
		static void PrintOri(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_Builder::PrintPnt ******/
		/****** md5 signature: ec360edf1d0b3a294eef391826f48ec2 ******/
		%feature("compactdefaultargs") PrintPnt;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") PrintPnt;
		static void PrintPnt(const TopoDS_Vertex & V);

		/****** TopOpeBRepBuild_Builder::PrintSur ******/
		/****** md5 signature: cd992c1708c013efd5314abfac318068 ******/
		%feature("compactdefaultargs") PrintSur;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") PrintSur;
		static void PrintSur(const TopoDS_Face & F);

		/****** TopOpeBRepBuild_Builder::RegularizeFace ******/
		/****** md5 signature: 886b88d6af337f60aa6c8c1a87314331 ******/
		%feature("compactdefaultargs") RegularizeFace;
		%feature("autodoc", "
Parameters
----------
FF: TopoDS_Shape
newFace: TopoDS_Shape
LOF: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") RegularizeFace;
		void RegularizeFace(const TopoDS_Shape & FF, const TopoDS_Shape & newFace, TopTools_ListOfShape & LOF);

		/****** TopOpeBRepBuild_Builder::RegularizeFaces ******/
		/****** md5 signature: fbd71a72a7637a7917336ca0dcff56af ******/
		%feature("compactdefaultargs") RegularizeFaces;
		%feature("autodoc", "
Parameters
----------
FF: TopoDS_Shape
lnewFace: TopTools_ListOfShape
LOF: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") RegularizeFaces;
		void RegularizeFaces(const TopoDS_Shape & FF, const TopTools_ListOfShape & lnewFace, TopTools_ListOfShape & LOF);

		/****** TopOpeBRepBuild_Builder::RegularizeSolid ******/
		/****** md5 signature: d1386c2d82b1d9bfac895454969cbec2 ******/
		%feature("compactdefaultargs") RegularizeSolid;
		%feature("autodoc", "
Parameters
----------
SS: TopoDS_Shape
newSolid: TopoDS_Shape
LOS: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") RegularizeSolid;
		void RegularizeSolid(const TopoDS_Shape & SS, const TopoDS_Shape & newSolid, TopTools_ListOfShape & LOS);

		/****** TopOpeBRepBuild_Builder::RegularizeSolids ******/
		/****** md5 signature: 4cb5180b5f0ac3855f82975d4ace0543 ******/
		%feature("compactdefaultargs") RegularizeSolids;
		%feature("autodoc", "
Parameters
----------
SS: TopoDS_Shape
lnewSolid: TopTools_ListOfShape
LOS: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") RegularizeSolids;
		void RegularizeSolids(const TopoDS_Shape & SS, const TopTools_ListOfShape & lnewSolid, TopTools_ListOfShape & LOS);

		/****** TopOpeBRepBuild_Builder::Reverse ******/
		/****** md5 signature: bb1b267c45d23ad39c5df46239434fc3 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "
Parameters
----------
T1: TopAbs_State
T2: TopAbs_State

Return
-------
bool

Description
-----------
No available documentation.
") Reverse;
		static bool Reverse(const TopAbs_State T1, const TopAbs_State T2);

		/****** TopOpeBRepBuild_Builder::Section ******/
		/****** md5 signature: dbcc312fba60937e8cc4963c696181f6 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
L: TopTools_ListOfShape

Return
-------
None

Description
-----------
return all section edges.
") Section;
		void Section(TopTools_ListOfShape & L);

		/****** TopOpeBRepBuild_Builder::Section ******/
		/****** md5 signature: de29fcbd54cc3d269c973a6e4f3c1c51 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") Section;
		const TopTools_ListOfShape & Section();

		/****** TopOpeBRepBuild_Builder::SectionCurves ******/
		/****** md5 signature: 5b1747f0a3da0a539d08ee5d4d40ee6b ******/
		%feature("compactdefaultargs") SectionCurves;
		%feature("autodoc", "
Parameters
----------
L: TopTools_ListOfShape

Return
-------
None

Description
-----------
return the section edges built on new curves.
") SectionCurves;
		void SectionCurves(TopTools_ListOfShape & L);

		/****** TopOpeBRepBuild_Builder::SectionEdges ******/
		/****** md5 signature: e3ace9c0808d97715282427fd7ff6c15 ******/
		%feature("compactdefaultargs") SectionEdges;
		%feature("autodoc", "
Parameters
----------
L: TopTools_ListOfShape

Return
-------
None

Description
-----------
return the parts of edges found ON the boundary of the two arguments S1,S2 of Perform().
") SectionEdges;
		void SectionEdges(TopTools_ListOfShape & L);

		/****** TopOpeBRepBuild_Builder::ShapePosition ******/
		/****** md5 signature: 5fee5a87af657946e4b180601b884508 ******/
		%feature("compactdefaultargs") ShapePosition;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
LS: TopTools_ListOfShape

Return
-------
TopAbs_State

Description
-----------
No available documentation.
") ShapePosition;
		TopAbs_State ShapePosition(const TopoDS_Shape & S, const TopTools_ListOfShape & LS);

		/****** TopOpeBRepBuild_Builder::ShapeRank ******/
		/****** md5 signature: ab8b803eab89958f17acf3c508685b3b ******/
		%feature("compactdefaultargs") ShapeRank;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") ShapeRank;
		int ShapeRank(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_Builder::SplitEvisoONperiodicF ******/
		/****** md5 signature: cd44d893a3de98a88f8af3ec39ba6e36 ******/
		%feature("compactdefaultargs") SplitEvisoONperiodicF;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SplitEvisoONperiodicF;
		void SplitEvisoONperiodicF();

		/****** TopOpeBRepBuild_Builder::SplitSectionEdge ******/
		/****** md5 signature: c47bf05ca7a9c41c4726a24fdcff4efc ******/
		%feature("compactdefaultargs") SplitSectionEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape

Return
-------
None

Description
-----------
create parts ON solid of section edges.
") SplitSectionEdge;
		virtual void SplitSectionEdge(const TopoDS_Shape & E);

		/****** TopOpeBRepBuild_Builder::SplitSectionEdges ******/
		/****** md5 signature: 0732b308f7409c9823300dc21836b69a ******/
		%feature("compactdefaultargs") SplitSectionEdges;
		%feature("autodoc", "Return
-------
None

Description
-----------
create parts ON solid of section edges.
") SplitSectionEdges;
		void SplitSectionEdges();

		/****** TopOpeBRepBuild_Builder::Splits ******/
		/****** md5 signature: 90cf6ed590c619273895a6aee9ef33a8 ******/
		%feature("compactdefaultargs") Splits;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TB: TopAbs_State

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the split parts <TB> of shape <S>.
") Splits;
		const TopTools_ListOfShape & Splits(const TopoDS_Shape & S, const TopAbs_State TB);

		/****** TopOpeBRepBuild_Builder::StringState ******/
		/****** md5 signature: bc9ced969562a9a7d1b7ddcf0d9105f2 ******/
		%feature("compactdefaultargs") StringState;
		%feature("autodoc", "
Parameters
----------
S: TopAbs_State

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") StringState;
		static TCollection_AsciiString StringState(const TopAbs_State S);

		/****** TopOpeBRepBuild_Builder::TopType ******/
		/****** md5 signature: 152faebc9c8f93773f88759bbe313a5d ******/
		%feature("compactdefaultargs") TopType;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopAbs_ShapeEnum

Description
-----------
No available documentation.
") TopType;
		static TopAbs_ShapeEnum TopType(const TopoDS_Shape & S);

};


%extend TopOpeBRepBuild_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class TopOpeBRepBuild_BuilderON *
**********************************/
class TopOpeBRepBuild_BuilderON {
	public:
		/****** TopOpeBRepBuild_BuilderON::TopOpeBRepBuild_BuilderON ******/
		/****** md5 signature: 93a4d6fc21e372f0dc04fc90113fa649 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_BuilderON;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_BuilderON;
		 TopOpeBRepBuild_BuilderON();

		/****** TopOpeBRepBuild_BuilderON::TopOpeBRepBuild_BuilderON ******/
		/****** md5 signature: 5e205533018e9ce622a7cc279f39b8c7 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_BuilderON;
		%feature("autodoc", "
Parameters
----------
PB: TopOpeBRepBuild_PBuilder
F: TopoDS_Shape
PG: TopOpeBRepBuild_PGTopo
PLSclass: TopOpeBRepTool_Plos
PWES: TopOpeBRepBuild_PWireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_BuilderON;
		 TopOpeBRepBuild_BuilderON(const TopOpeBRepBuild_PBuilder & PB, const TopoDS_Shape & F, const TopOpeBRepBuild_PGTopo & PG, const TopOpeBRepTool_Plos & PLSclass, const TopOpeBRepBuild_PWireEdgeSet & PWES);

		/****** TopOpeBRepBuild_BuilderON::GFillONCheckI ******/
		/****** md5 signature: b2574dae8022beaf64726bf69dccd7f9 ******/
		%feature("compactdefaultargs") GFillONCheckI;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
bool

Description
-----------
No available documentation.
") GFillONCheckI;
		bool GFillONCheckI(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****** TopOpeBRepBuild_BuilderON::GFillONParts2dWES2 ******/
		/****** md5 signature: 129b9dfe1de8b2aabf2590f4bf0e9a83 ******/
		%feature("compactdefaultargs") GFillONParts2dWES2;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
EspON: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") GFillONParts2dWES2;
		void GFillONParts2dWES2(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopoDS_Shape & EspON);

		/****** TopOpeBRepBuild_BuilderON::GFillONPartsWES1 ******/
		/****** md5 signature: 860c771dad5e5b425727dab3045ded73 ******/
		%feature("compactdefaultargs") GFillONPartsWES1;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") GFillONPartsWES1;
		void GFillONPartsWES1(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****** TopOpeBRepBuild_BuilderON::GFillONPartsWES2 ******/
		/****** md5 signature: b41a82402fee8faaab3bcfb720cfde28 ******/
		%feature("compactdefaultargs") GFillONPartsWES2;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
EspON: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") GFillONPartsWES2;
		void GFillONPartsWES2(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopoDS_Shape & EspON);

		/****** TopOpeBRepBuild_BuilderON::Perform ******/
		/****** md5 signature: c1af6c2b05eef14905f470745091359d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
PB: TopOpeBRepBuild_PBuilder
F: TopoDS_Shape
PG: TopOpeBRepBuild_PGTopo
PLSclass: TopOpeBRepTool_Plos
PWES: TopOpeBRepBuild_PWireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopOpeBRepBuild_PBuilder & PB, const TopoDS_Shape & F, const TopOpeBRepBuild_PGTopo & PG, const TopOpeBRepTool_Plos & PLSclass, const TopOpeBRepBuild_PWireEdgeSet & PWES);

		/****** TopOpeBRepBuild_BuilderON::Perform2d ******/
		/****** md5 signature: c566a45b3c9e229d28eac41630784eba ******/
		%feature("compactdefaultargs") Perform2d;
		%feature("autodoc", "
Parameters
----------
PB: TopOpeBRepBuild_PBuilder
F: TopoDS_Shape
PG: TopOpeBRepBuild_PGTopo
PLSclass: TopOpeBRepTool_Plos
PWES: TopOpeBRepBuild_PWireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") Perform2d;
		void Perform2d(const TopOpeBRepBuild_PBuilder & PB, const TopoDS_Shape & F, const TopOpeBRepBuild_PGTopo & PG, const TopOpeBRepTool_Plos & PLSclass, const TopOpeBRepBuild_PWireEdgeSet & PWES);

};


%extend TopOpeBRepBuild_BuilderON {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class TopOpeBRepBuild_CorrectFace2d *
**************************************/
class TopOpeBRepBuild_CorrectFace2d {
	public:
		/****** TopOpeBRepBuild_CorrectFace2d::TopOpeBRepBuild_CorrectFace2d ******/
		/****** md5 signature: bca6de8c8f0be2591c3040394f3b1240 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_CorrectFace2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_CorrectFace2d;
		 TopOpeBRepBuild_CorrectFace2d();

		/****** TopOpeBRepBuild_CorrectFace2d::TopOpeBRepBuild_CorrectFace2d ******/
		/****** md5 signature: ed5796031d97c626b035e0acd2384b62 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_CorrectFace2d;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Face
anAvoidMap: TopTools_IndexedMapOfOrientedShape
aMap: TopTools_IndexedDataMapOfShapeShape

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_CorrectFace2d;
		 TopOpeBRepBuild_CorrectFace2d(const TopoDS_Face & aFace, const TopTools_IndexedMapOfOrientedShape & anAvoidMap, TopTools_IndexedDataMapOfShapeShape & aMap);

		/****** TopOpeBRepBuild_CorrectFace2d::CheckList ******/
		/****** md5 signature: c6ae6edb7d333a7921ca5712531544b9 ******/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Face
aHeadList: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") CheckList;
		static void CheckList(const TopoDS_Face & aFace, TopTools_ListOfShape & aHeadList);

		/****** TopOpeBRepBuild_CorrectFace2d::CorrectedFace ******/
		/****** md5 signature: 7357b459c86fa687044bc53b4eb86956 ******/
		%feature("compactdefaultargs") CorrectedFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") CorrectedFace;
		const TopoDS_Face CorrectedFace();

		/****** TopOpeBRepBuild_CorrectFace2d::ErrorStatus ******/
		/****** md5 signature: 13481d2945af376391a643c48d6d5825 ******/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ErrorStatus;
		int ErrorStatus();

		/****** TopOpeBRepBuild_CorrectFace2d::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Face;
		const TopoDS_Face Face();

		/****** TopOpeBRepBuild_CorrectFace2d::GetP2dFL ******/
		/****** md5 signature: c5dd9bab0bc1e9edc646e15e869727e7 ******/
		%feature("compactdefaultargs") GetP2dFL;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Face
anEdge: TopoDS_Edge
P2dF: gp_Pnt2d
P2dL: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") GetP2dFL;
		static void GetP2dFL(const TopoDS_Face & aFace, const TopoDS_Edge & anEdge, gp_Pnt2d & P2dF, gp_Pnt2d & P2dL);

		/****** TopOpeBRepBuild_CorrectFace2d::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** TopOpeBRepBuild_CorrectFace2d::MapOfTrans2dInfo ******/
		/****** md5 signature: 002163a1ebd643630c42b8e336a05b3f ******/
		%feature("compactdefaultargs") MapOfTrans2dInfo;
		%feature("autodoc", "Return
-------
TopTools_IndexedDataMapOfShapeShape

Description
-----------
No available documentation.
") MapOfTrans2dInfo;
		TopTools_IndexedDataMapOfShapeShape & MapOfTrans2dInfo();

		/****** TopOpeBRepBuild_CorrectFace2d::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform();

		/****** TopOpeBRepBuild_CorrectFace2d::SetMapOfTrans2dInfo ******/
		/****** md5 signature: f2fb4b0bbc26b5501ccb3bdd563a98c1 ******/
		%feature("compactdefaultargs") SetMapOfTrans2dInfo;
		%feature("autodoc", "
Parameters
----------
aMap: TopTools_IndexedDataMapOfShapeShape

Return
-------
None

Description
-----------
No available documentation.
") SetMapOfTrans2dInfo;
		void SetMapOfTrans2dInfo(TopTools_IndexedDataMapOfShapeShape & aMap);

};


%extend TopOpeBRepBuild_CorrectFace2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TopOpeBRepBuild_FaceBuilder *
************************************/
class TopOpeBRepBuild_FaceBuilder {
	public:
		/****** TopOpeBRepBuild_FaceBuilder::TopOpeBRepBuild_FaceBuilder ******/
		/****** md5 signature: bb04ce2e5fa3fcf6b20885083eef5ad9 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_FaceBuilder;
		 TopOpeBRepBuild_FaceBuilder();

		/****** TopOpeBRepBuild_FaceBuilder::TopOpeBRepBuild_FaceBuilder ******/
		/****** md5 signature: d6c9137f10c0ad6a9b1d536a8719793d ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceBuilder;
		%feature("autodoc", "
Parameters
----------
ES: TopOpeBRepBuild_WireEdgeSet
F: TopoDS_Shape
ForceClass: bool (optional, default to false)

Return
-------
None

Description
-----------
Create a FaceBuilder to build the faces on the shapes (wires, blocks of edge) described by <LS>.
") TopOpeBRepBuild_FaceBuilder;
		 TopOpeBRepBuild_FaceBuilder(TopOpeBRepBuild_WireEdgeSet & ES, const TopoDS_Shape & F, const bool ForceClass = false);

		/****** TopOpeBRepBuild_FaceBuilder::AddEdgeWire ******/
		/****** md5 signature: f39164c782ad457de53b0141d4eb0278 ******/
		%feature("compactdefaultargs") AddEdgeWire;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
W: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") AddEdgeWire;
		int AddEdgeWire(const TopoDS_Shape & E, TopoDS_Shape & W);

		/****** TopOpeBRepBuild_FaceBuilder::CorrectGclosedWire ******/
		/****** md5 signature: 9de2a123ce123a037be03f7093952b34 ******/
		%feature("compactdefaultargs") CorrectGclosedWire;
		%feature("autodoc", "
Parameters
----------
mapVVref: TopTools_IndexedDataMapOfShapeShape
mapVon1Edge: TopTools_IndexedDataMapOfShapeShape

Return
-------
None

Description
-----------
Using the given maps, change the topology of the 3d-closed wires, in order to get closed wires.
") CorrectGclosedWire;
		void CorrectGclosedWire(const TopTools_IndexedDataMapOfShapeShape & mapVVref, const TopTools_IndexedDataMapOfShapeShape & mapVon1Edge);

		/****** TopOpeBRepBuild_FaceBuilder::DetectPseudoInternalEdge ******/
		/****** md5 signature: c41a644cfc6708164ba946f258e93f8d ******/
		%feature("compactdefaultargs") DetectPseudoInternalEdge;
		%feature("autodoc", "
Parameters
----------
mapE: TopTools_IndexedMapOfShape

Return
-------
None

Description
-----------
Removes edges appearing twice (FORWARD,REVERSED) with a bounding vertex not connected to any other edge. mapE contains edges found. modifies myBlockBuilder.
") DetectPseudoInternalEdge;
		void DetectPseudoInternalEdge(TopTools_IndexedMapOfShape & mapE);

		/****** TopOpeBRepBuild_FaceBuilder::DetectUnclosedWire ******/
		/****** md5 signature: 521215cbde6fae31dd528ec692d7bf45 ******/
		%feature("compactdefaultargs") DetectUnclosedWire;
		%feature("autodoc", "
Parameters
----------
mapVVsameG: TopTools_IndexedDataMapOfShapeShape
mapVon1Edge: TopTools_IndexedDataMapOfShapeShape

Return
-------
None

Description
-----------
Removes are non 3d-closed wires. Fills up maps <mapVVsameG> and <mapVon1Edge>, in order to correct 3d-closed but unclosed (topologic connexity) wires. modifies myBlockBuilder.
") DetectUnclosedWire;
		void DetectUnclosedWire(TopTools_IndexedDataMapOfShapeShape & mapVVsameG, TopTools_IndexedDataMapOfShapeShape & mapVon1Edge);

		/****** TopOpeBRepBuild_FaceBuilder::Edge ******/
		/****** md5 signature: 736edb396456a570eb4c4e39335bdcb0 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns current new edge of current new wire.
") Edge;
		const TopoDS_Shape Edge();

		/****** TopOpeBRepBuild_FaceBuilder::EdgeConnexity ******/
		/****** md5 signature: 3cc5fa8ef1e1e74aa1ea3d680b0e6d60 ******/
		%feature("compactdefaultargs") EdgeConnexity;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") EdgeConnexity;
		int EdgeConnexity(const TopoDS_Shape & E);

		/****** TopOpeBRepBuild_FaceBuilder::Face ******/
		/****** md5 signature: 9c9430f314f7a67219d35de85b5a42a5 ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
return myFace.
") Face;
		const TopoDS_Shape Face();

		/****** TopOpeBRepBuild_FaceBuilder::FindNextValidElement ******/
		/****** md5 signature: 2866d266db213eab6f3eebb99d30a197 ******/
		%feature("compactdefaultargs") FindNextValidElement;
		%feature("autodoc", "Return
-------
None

Description
-----------
Iterates on myBlockIterator until finding a valid element.
") FindNextValidElement;
		void FindNextValidElement();

		/****** TopOpeBRepBuild_FaceBuilder::InitEdge ******/
		/****** md5 signature: 4ffafd5d7903af73bf81cf5c49102c1c ******/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") InitEdge;
		int InitEdge();

		/****** TopOpeBRepBuild_FaceBuilder::InitFace ******/
		/****** md5 signature: f7d658980d48b1f34106c03b05d30566 ******/
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") InitFace;
		int InitFace();

		/****** TopOpeBRepBuild_FaceBuilder::InitFaceBuilder ******/
		/****** md5 signature: 3de4373e76d74ac8d4afc4bd8947912a ******/
		%feature("compactdefaultargs") InitFaceBuilder;
		%feature("autodoc", "
Parameters
----------
ES: TopOpeBRepBuild_WireEdgeSet
F: TopoDS_Shape
ForceClass: bool

Return
-------
None

Description
-----------
No available documentation.
") InitFaceBuilder;
		void InitFaceBuilder(TopOpeBRepBuild_WireEdgeSet & ES, const TopoDS_Shape & F, const bool ForceClass);

		/****** TopOpeBRepBuild_FaceBuilder::InitWire ******/
		/****** md5 signature: 8ee444964484761e992eacd423b7c1a6 ******/
		%feature("compactdefaultargs") InitWire;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") InitWire;
		int InitWire();

		/****** TopOpeBRepBuild_FaceBuilder::IsOldWire ******/
		/****** md5 signature: cb84b89e4acd7eb2d1203c3a80f96ba7 ******/
		%feature("compactdefaultargs") IsOldWire;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsOldWire;
		bool IsOldWire();

		/****** TopOpeBRepBuild_FaceBuilder::MoreEdge ******/
		/****** md5 signature: 6ad80ac0d66dad5013f4fe4cff20c934 ******/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreEdge;
		bool MoreEdge();

		/****** TopOpeBRepBuild_FaceBuilder::MoreFace ******/
		/****** md5 signature: bff7dacb9d14d55afd6f709576086160 ******/
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreFace;
		bool MoreFace();

		/****** TopOpeBRepBuild_FaceBuilder::MoreWire ******/
		/****** md5 signature: 33e57650f873a7add69878ed9f775310 ******/
		%feature("compactdefaultargs") MoreWire;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreWire;
		bool MoreWire();

		/****** TopOpeBRepBuild_FaceBuilder::NextEdge ******/
		/****** md5 signature: 8103c946a7f7c0a3d885514a8a740502 ******/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextEdge;
		void NextEdge();

		/****** TopOpeBRepBuild_FaceBuilder::NextFace ******/
		/****** md5 signature: 33ae62d7d15ec80966f0219be1a267db ******/
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextFace;
		void NextFace();

		/****** TopOpeBRepBuild_FaceBuilder::NextWire ******/
		/****** md5 signature: 11b92f2dcc830f98b32d40bd651c0b28 ******/
		%feature("compactdefaultargs") NextWire;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextWire;
		void NextWire();

		/****** TopOpeBRepBuild_FaceBuilder::OldWire ******/
		/****** md5 signature: 867be45bb543914ad8830cba7e10a554 ******/
		%feature("compactdefaultargs") OldWire;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns current wire This wire may be: * an old wire OldWire(), which has not been reconstructed; * a new wire made of edges described by ...NewEdge() methods.
") OldWire;
		const TopoDS_Shape OldWire();

};


%extend TopOpeBRepBuild_FaceBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopOpeBRepBuild_FuseFace *
*********************************/
class TopOpeBRepBuild_FuseFace {
	public:
		/****** TopOpeBRepBuild_FuseFace::TopOpeBRepBuild_FuseFace ******/
		/****** md5 signature: e413591195cc7fce36b9eafab44de7e4 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_FuseFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_FuseFace;
		 TopOpeBRepBuild_FuseFace();

		/****** TopOpeBRepBuild_FuseFace::TopOpeBRepBuild_FuseFace ******/
		/****** md5 signature: 808af97ae4e398dc9a2b4a99866b00a4 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_FuseFace;
		%feature("autodoc", "
Parameters
----------
LIF: TopTools_ListOfShape
LRF: TopTools_ListOfShape
CXM: int

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_FuseFace;
		 TopOpeBRepBuild_FuseFace(const TopTools_ListOfShape & LIF, const TopTools_ListOfShape & LRF, const int CXM);

		/****** TopOpeBRepBuild_FuseFace::ClearEdge ******/
		/****** md5 signature: dbef4a0c908b7dfedc92dad3e8fa4166 ******/
		%feature("compactdefaultargs") ClearEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ClearEdge;
		void ClearEdge();

		/****** TopOpeBRepBuild_FuseFace::ClearVertex ******/
		/****** md5 signature: ad18db1ffe90787575f3f9dc76fd7768 ******/
		%feature("compactdefaultargs") ClearVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ClearVertex;
		void ClearVertex();

		/****** TopOpeBRepBuild_FuseFace::Init ******/
		/****** md5 signature: 578726fde3dad1afdca072ee051e77c9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
LIF: TopTools_ListOfShape
LRF: TopTools_ListOfShape
CXM: int

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopTools_ListOfShape & LIF, const TopTools_ListOfShape & LRF, const int CXM);

		/****** TopOpeBRepBuild_FuseFace::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** TopOpeBRepBuild_FuseFace::IsModified ******/
		/****** md5 signature: 20a841c48b5ecb63ab1563022bd76327 ******/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsModified;
		bool IsModified();

		/****** TopOpeBRepBuild_FuseFace::LExternEdge ******/
		/****** md5 signature: 4c1d1ca0012b714f19dbc317460c895f ******/
		%feature("compactdefaultargs") LExternEdge;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") LExternEdge;
		const TopTools_ListOfShape & LExternEdge();

		/****** TopOpeBRepBuild_FuseFace::LExternVertex ******/
		/****** md5 signature: 0c9f7455ca685895891c450fff11602e ******/
		%feature("compactdefaultargs") LExternVertex;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") LExternVertex;
		const TopTools_ListOfShape & LExternVertex();

		/****** TopOpeBRepBuild_FuseFace::LFuseFace ******/
		/****** md5 signature: 3eb68dd307149c6bd448b037f0024d74 ******/
		%feature("compactdefaultargs") LFuseFace;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") LFuseFace;
		const TopTools_ListOfShape & LFuseFace();

		/****** TopOpeBRepBuild_FuseFace::LInternEdge ******/
		/****** md5 signature: dbe1d71948e9f57352799e61f50dea4f ******/
		%feature("compactdefaultargs") LInternEdge;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") LInternEdge;
		const TopTools_ListOfShape & LInternEdge();

		/****** TopOpeBRepBuild_FuseFace::LInternVertex ******/
		/****** md5 signature: 813a5d739524bb9a98c7045d3e785872 ******/
		%feature("compactdefaultargs") LInternVertex;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") LInternVertex;
		const TopTools_ListOfShape & LInternVertex();

		/****** TopOpeBRepBuild_FuseFace::LModifEdge ******/
		/****** md5 signature: 762cfcc06dbf4c28175c40a7624b3c64 ******/
		%feature("compactdefaultargs") LModifEdge;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") LModifEdge;
		const TopTools_ListOfShape & LModifEdge();

		/****** TopOpeBRepBuild_FuseFace::LModifVertex ******/
		/****** md5 signature: 799e4c6e1d4c7d567547656463a23410 ******/
		%feature("compactdefaultargs") LModifVertex;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") LModifVertex;
		const TopTools_ListOfShape & LModifVertex();

		/****** TopOpeBRepBuild_FuseFace::PerformEdge ******/
		/****** md5 signature: 56629cb1b52d14f9a2daa66f7719477a ******/
		%feature("compactdefaultargs") PerformEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") PerformEdge;
		void PerformEdge();

		/****** TopOpeBRepBuild_FuseFace::PerformFace ******/
		/****** md5 signature: 0f5caf45d02f1bed73a36f953359273a ******/
		%feature("compactdefaultargs") PerformFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") PerformFace;
		void PerformFace();

};


%extend TopOpeBRepBuild_FuseFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TopOpeBRepBuild_GIter *
******************************/
class TopOpeBRepBuild_GIter {
	public:
		/****** TopOpeBRepBuild_GIter::TopOpeBRepBuild_GIter ******/
		/****** md5 signature: 34990a93235c8e3d4bb9295bb82e7aa9 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_GIter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_GIter;
		 TopOpeBRepBuild_GIter();

		/****** TopOpeBRepBuild_GIter::TopOpeBRepBuild_GIter ******/
		/****** md5 signature: c2e2effc77071f308d325f505c8d3d8c ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_GIter;
		%feature("autodoc", "
Parameters
----------
G: TopOpeBRepBuild_GTopo

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_GIter;
		 TopOpeBRepBuild_GIter(const TopOpeBRepBuild_GTopo & G);

		/****** TopOpeBRepBuild_GIter::Current ******/
		/****** md5 signature: ec04e3a6ed08aad70b7ace9b09bc6ff4 ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "
Parameters
----------

Return
-------
s1: TopAbs_State
s2: TopAbs_State

Description
-----------
No available documentation.
") Current;
		void Current(TopAbs_State &OutValue, TopAbs_State &OutValue);

		/****** TopOpeBRepBuild_GIter::Dump ******/
		/****** md5 signature: e60d722f65a7811be636699da7600e78 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** TopOpeBRepBuild_GIter::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****** TopOpeBRepBuild_GIter::Init ******/
		/****** md5 signature: b1954f33d1f51bc48115e8585914b10c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
G: TopOpeBRepBuild_GTopo

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopOpeBRepBuild_GTopo & G);

		/****** TopOpeBRepBuild_GIter::More ******/
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		bool More();

		/****** TopOpeBRepBuild_GIter::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

};


%extend TopOpeBRepBuild_GIter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TopOpeBRepBuild_GTool *
******************************/
class TopOpeBRepBuild_GTool {
	public:
		/****** TopOpeBRepBuild_GTool::Dump ******/
		/****** md5 signature: 7ac13aaed5b6d1996e76f06146a4af9d ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		static void Dump(std::ostream &OutValue);

		/****** TopOpeBRepBuild_GTool::GComDiff ******/
		/****** md5 signature: 728073c8bdab2220cb285e5911b15d15 ******/
		%feature("compactdefaultargs") GComDiff;
		%feature("autodoc", "
Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Return
-------
TopOpeBRepBuild_GTopo

Description
-----------
No available documentation.
") GComDiff;
		static TopOpeBRepBuild_GTopo GComDiff(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

		/****** TopOpeBRepBuild_GTool::GComSame ******/
		/****** md5 signature: 62c2b0137ff9c80018ccf92308d50ef0 ******/
		%feature("compactdefaultargs") GComSame;
		%feature("autodoc", "
Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Return
-------
TopOpeBRepBuild_GTopo

Description
-----------
No available documentation.
") GComSame;
		static TopOpeBRepBuild_GTopo GComSame(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

		/****** TopOpeBRepBuild_GTool::GComUnsh ******/
		/****** md5 signature: dfd7bab77d69376accb8feeea644091a ******/
		%feature("compactdefaultargs") GComUnsh;
		%feature("autodoc", "
Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Return
-------
TopOpeBRepBuild_GTopo

Description
-----------
No available documentation.
") GComUnsh;
		static TopOpeBRepBuild_GTopo GComUnsh(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

		/****** TopOpeBRepBuild_GTool::GCutDiff ******/
		/****** md5 signature: 2776748e3dc8b3e478db1dc8a70f7447 ******/
		%feature("compactdefaultargs") GCutDiff;
		%feature("autodoc", "
Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Return
-------
TopOpeBRepBuild_GTopo

Description
-----------
No available documentation.
") GCutDiff;
		static TopOpeBRepBuild_GTopo GCutDiff(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

		/****** TopOpeBRepBuild_GTool::GCutSame ******/
		/****** md5 signature: d5accbd402a7d9eb72b62f2ebd3c65bc ******/
		%feature("compactdefaultargs") GCutSame;
		%feature("autodoc", "
Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Return
-------
TopOpeBRepBuild_GTopo

Description
-----------
No available documentation.
") GCutSame;
		static TopOpeBRepBuild_GTopo GCutSame(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

		/****** TopOpeBRepBuild_GTool::GCutUnsh ******/
		/****** md5 signature: b6ffbcfc3f0fd8b4d27c698f7e0179cd ******/
		%feature("compactdefaultargs") GCutUnsh;
		%feature("autodoc", "
Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Return
-------
TopOpeBRepBuild_GTopo

Description
-----------
No available documentation.
") GCutUnsh;
		static TopOpeBRepBuild_GTopo GCutUnsh(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

		/****** TopOpeBRepBuild_GTool::GFusDiff ******/
		/****** md5 signature: ace570c740dd5774e869614c2c1115a7 ******/
		%feature("compactdefaultargs") GFusDiff;
		%feature("autodoc", "
Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Return
-------
TopOpeBRepBuild_GTopo

Description
-----------
No available documentation.
") GFusDiff;
		static TopOpeBRepBuild_GTopo GFusDiff(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

		/****** TopOpeBRepBuild_GTool::GFusSame ******/
		/****** md5 signature: bc956f47f5261f960caabc2733af21af ******/
		%feature("compactdefaultargs") GFusSame;
		%feature("autodoc", "
Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Return
-------
TopOpeBRepBuild_GTopo

Description
-----------
No available documentation.
") GFusSame;
		static TopOpeBRepBuild_GTopo GFusSame(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

		/****** TopOpeBRepBuild_GTool::GFusUnsh ******/
		/****** md5 signature: 3ca04c0024a9895fdf7bf9316afe53f2 ******/
		%feature("compactdefaultargs") GFusUnsh;
		%feature("autodoc", "
Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Return
-------
TopOpeBRepBuild_GTopo

Description
-----------
No available documentation.
") GFusUnsh;
		static TopOpeBRepBuild_GTopo GFusUnsh(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

};


%extend TopOpeBRepBuild_GTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TopOpeBRepBuild_GTopo *
******************************/
class TopOpeBRepBuild_GTopo {
	public:
		/****** TopOpeBRepBuild_GTopo::TopOpeBRepBuild_GTopo ******/
		/****** md5 signature: fc43733b46e0b23c7629bbdbe4b9a7d0 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_GTopo;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_GTopo;
		 TopOpeBRepBuild_GTopo();

		/****** TopOpeBRepBuild_GTopo::TopOpeBRepBuild_GTopo ******/
		/****** md5 signature: 22e78bd530c717ad6fed69669d8f0a9a ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_GTopo;
		%feature("autodoc", "
Parameters
----------
II: bool
IN: bool
IO: bool
NI: bool
NN: bool
NO: bool
OI: bool
ON: bool
OO: bool
t1: TopAbs_ShapeEnum
t2: TopAbs_ShapeEnum
C1: TopOpeBRepDS_Config
C2: TopOpeBRepDS_Config

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_GTopo;
		 TopOpeBRepBuild_GTopo(const bool II, const bool IN, const bool IO, const bool NI, const bool NN, const bool NO, const bool OI, const bool ON, const bool OO, const TopAbs_ShapeEnum t1, const TopAbs_ShapeEnum t2, const TopOpeBRepDS_Config C1, const TopOpeBRepDS_Config C2);

		/****** TopOpeBRepBuild_GTopo::ChangeConfig ******/
		/****** md5 signature: 55b5ae6cba23650cf9cba49d45c0be6d ******/
		%feature("compactdefaultargs") ChangeConfig;
		%feature("autodoc", "
Parameters
----------
C1: TopOpeBRepDS_Config
C2: TopOpeBRepDS_Config

Return
-------
None

Description
-----------
No available documentation.
") ChangeConfig;
		void ChangeConfig(const TopOpeBRepDS_Config C1, const TopOpeBRepDS_Config C2);

		/****** TopOpeBRepBuild_GTopo::ChangeType ******/
		/****** md5 signature: 6d3e04d73efd6515cb6dc1f8eed9e9ab ******/
		%feature("compactdefaultargs") ChangeType;
		%feature("autodoc", "
Parameters
----------
t1: TopAbs_ShapeEnum
t2: TopAbs_ShapeEnum

Return
-------
None

Description
-----------
No available documentation.
") ChangeType;
		void ChangeType(const TopAbs_ShapeEnum t1, const TopAbs_ShapeEnum t2);

		/****** TopOpeBRepBuild_GTopo::ChangeValue ******/
		/****** md5 signature: 39126b72af80830e3aa073a829a5b658 ******/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "
Parameters
----------
i1: int
i2: int
b: bool

Return
-------
None

Description
-----------
No available documentation.
") ChangeValue;
		void ChangeValue(const int i1, const int i2, const bool b);

		/****** TopOpeBRepBuild_GTopo::ChangeValue ******/
		/****** md5 signature: b5ec5410407f2a832f39dd7bf2ce340b ******/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "
Parameters
----------
s1: TopAbs_State
s2: TopAbs_State
b: bool

Return
-------
None

Description
-----------
No available documentation.
") ChangeValue;
		void ChangeValue(const TopAbs_State s1, const TopAbs_State s2, const bool b);

		/****** TopOpeBRepBuild_GTopo::Config1 ******/
		/****** md5 signature: d6bdb88b5c25e150d56a96c1cd0b6f7e ******/
		%feature("compactdefaultargs") Config1;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Config

Description
-----------
No available documentation.
") Config1;
		TopOpeBRepDS_Config Config1();

		/****** TopOpeBRepBuild_GTopo::Config2 ******/
		/****** md5 signature: b774f70112b999c3f3f0d033a3dee75d ******/
		%feature("compactdefaultargs") Config2;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Config

Description
-----------
No available documentation.
") Config2;
		TopOpeBRepDS_Config Config2();

		/****** TopOpeBRepBuild_GTopo::CopyPermuted ******/
		/****** md5 signature: f0eed418380da84a80cd0b8e375792b2 ******/
		%feature("compactdefaultargs") CopyPermuted;
		%feature("autodoc", "Return
-------
TopOpeBRepBuild_GTopo

Description
-----------
No available documentation.
") CopyPermuted;
		TopOpeBRepBuild_GTopo CopyPermuted();

		/****** TopOpeBRepBuild_GTopo::Dump ******/
		/****** md5 signature: 4db960682eea21d4432cbe5240bcb03e ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
s: void * (optional, default to nullptr)

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		virtual void Dump(std::ostream &OutValue, void * const s = nullptr);

		/****** TopOpeBRepBuild_GTopo::DumpSSB ******/
		/****** md5 signature: dc351fb541cd1e4cb1a154a6d1136901 ******/
		%feature("compactdefaultargs") DumpSSB;
		%feature("autodoc", "
Parameters
----------
s1: TopAbs_State
s2: TopAbs_State
b: bool

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") DumpSSB;
		static void DumpSSB(std::ostream &OutValue, const TopAbs_State s1, const TopAbs_State s2, const bool b);

		/****** TopOpeBRepBuild_GTopo::DumpType ******/
		/****** md5 signature: 958d66f716a6ca18d4ec9ac299b310e2 ******/
		%feature("compactdefaultargs") DumpType;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") DumpType;
		void DumpType(std::ostream &OutValue);

		/****** TopOpeBRepBuild_GTopo::DumpVal ******/
		/****** md5 signature: 8a87e48d25d7176e71c93b30dca770f3 ******/
		%feature("compactdefaultargs") DumpVal;
		%feature("autodoc", "
Parameters
----------
s1: TopAbs_State
s2: TopAbs_State

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") DumpVal;
		void DumpVal(std::ostream &OutValue, const TopAbs_State s1, const TopAbs_State s2);

		/****** TopOpeBRepBuild_GTopo::GIndex ******/
		/****** md5 signature: 3e929986cdf308f39beeb3c7df43fef4 ******/
		%feature("compactdefaultargs") GIndex;
		%feature("autodoc", "
Parameters
----------
S: TopAbs_State

Return
-------
int

Description
-----------
No available documentation.
") GIndex;
		int GIndex(const TopAbs_State S);

		/****** TopOpeBRepBuild_GTopo::GState ******/
		/****** md5 signature: 7674c965dc991f254de064ede95ad57c ******/
		%feature("compactdefaultargs") GState;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopAbs_State

Description
-----------
No available documentation.
") GState;
		TopAbs_State GState(const int I);

		/****** TopOpeBRepBuild_GTopo::Index ******/
		/****** md5 signature: 6740ebff082841ca909d2f85d6daadc2 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
II: int

Return
-------
i1: int
i2: int

Description
-----------
No available documentation.
") Index;
		void Index(const int II, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** TopOpeBRepBuild_GTopo::IsToReverse1 ******/
		/****** md5 signature: 1f652bfd67b753ffc87f702323b31484 ******/
		%feature("compactdefaultargs") IsToReverse1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsToReverse1;
		bool IsToReverse1();

		/****** TopOpeBRepBuild_GTopo::IsToReverse2 ******/
		/****** md5 signature: 988a633c85cebd2ff0443e47ff83a1f1 ******/
		%feature("compactdefaultargs") IsToReverse2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsToReverse2;
		bool IsToReverse2();

		/****** TopOpeBRepBuild_GTopo::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reset;
		void Reset();

		/****** TopOpeBRepBuild_GTopo::Reverse ******/
		/****** md5 signature: 6c288f9b62966d1069d30219e51887a5 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Reverse;
		bool Reverse();

		/****** TopOpeBRepBuild_GTopo::Set ******/
		/****** md5 signature: 963e06a202a08d7b4bf9f35c847ae373 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
II: bool
IN: bool
IO: bool
NI: bool
NN: bool
NO: bool
OI: bool
ON: bool
OO: bool

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const bool II, const bool IN, const bool IO, const bool NI, const bool NN, const bool NO, const bool OI, const bool ON, const bool OO);

		/****** TopOpeBRepBuild_GTopo::SetReverse ******/
		/****** md5 signature: aca571f167b9b1449f27873d0de8d4f1 ******/
		%feature("compactdefaultargs") SetReverse;
		%feature("autodoc", "
Parameters
----------
rev: bool

Return
-------
None

Description
-----------
No available documentation.
") SetReverse;
		void SetReverse(const bool rev);

		/****** TopOpeBRepBuild_GTopo::StatesON ******/
		/****** md5 signature: e33d4816eb157a2c15a70772cb8691e2 ******/
		%feature("compactdefaultargs") StatesON;
		%feature("autodoc", "
Parameters
----------

Return
-------
s1: TopAbs_State
s2: TopAbs_State

Description
-----------
No available documentation.
") StatesON;
		void StatesON(TopAbs_State &OutValue, TopAbs_State &OutValue);

		/****** TopOpeBRepBuild_GTopo::Type ******/
		/****** md5 signature: b633f41f768e9f9c4f3d7b446ad113bf ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "
Parameters
----------

Return
-------
t1: TopAbs_ShapeEnum
t2: TopAbs_ShapeEnum

Description
-----------
No available documentation.
") Type;
		void Type(TopAbs_ShapeEnum &OutValue, TopAbs_ShapeEnum &OutValue);

		/****** TopOpeBRepBuild_GTopo::Value ******/
		/****** md5 signature: 124d8b0da7f767525a36d507dd789992 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
s1: TopAbs_State
s2: TopAbs_State

Return
-------
bool

Description
-----------
No available documentation.
") Value;
		bool Value(const TopAbs_State s1, const TopAbs_State s2);

		/****** TopOpeBRepBuild_GTopo::Value ******/
		/****** md5 signature: 81fda4fd6ac28ee873a7b70f3087dd83 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
I1: int
I2: int

Return
-------
bool

Description
-----------
No available documentation.
") Value;
		bool Value(const int I1, const int I2);

		/****** TopOpeBRepBuild_GTopo::Value ******/
		/****** md5 signature: 01f482df7e2b46ba5672a7a968a7f571 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
II: int

Return
-------
bool

Description
-----------
No available documentation.
") Value;
		bool Value(const int II);

};


%extend TopOpeBRepBuild_GTopo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopOpeBRepBuild_HBuilder *
*********************************/
class TopOpeBRepBuild_HBuilder : public Standard_Transient {
	public:
		/****** TopOpeBRepBuild_HBuilder::TopOpeBRepBuild_HBuilder ******/
		/****** md5 signature: 5b5c582d55aa7cd7da248a4aae95967e ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_HBuilder;
		%feature("autodoc", "
Parameters
----------
BT: TopOpeBRepDS_BuildTool

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_HBuilder;
		 TopOpeBRepBuild_HBuilder(const TopOpeBRepDS_BuildTool & BT);

		/****** TopOpeBRepBuild_HBuilder::BuildTool ******/
		/****** md5 signature: 8f00b58c6dc4bbbf0701f98004c469fd ******/
		%feature("compactdefaultargs") BuildTool;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_BuildTool

Description
-----------
No available documentation.
") BuildTool;
		const TopOpeBRepDS_BuildTool & BuildTool();

		/****** TopOpeBRepBuild_HBuilder::ChangeBuildTool ******/
		/****** md5 signature: f18366a59aef2f912961e1fc0d178930 ******/
		%feature("compactdefaultargs") ChangeBuildTool;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_BuildTool

Description
-----------
No available documentation.
") ChangeBuildTool;
		TopOpeBRepDS_BuildTool & ChangeBuildTool();

		/****** TopOpeBRepBuild_HBuilder::ChangeBuilder ******/
		/****** md5 signature: 2dacea8f27fdff55fc1de9cf82466ce4 ******/
		%feature("compactdefaultargs") ChangeBuilder;
		%feature("autodoc", "Return
-------
TopOpeBRepBuild_Builder

Description
-----------
No available documentation.
") ChangeBuilder;
		TopOpeBRepBuild_Builder & ChangeBuilder();

		/****** TopOpeBRepBuild_HBuilder::ChangeNewEdges ******/
		/****** md5 signature: 7f4303b5367efe135b0647b5c62b25b0 ******/
		%feature("compactdefaultargs") ChangeNewEdges;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the edges created on curve <I>.
") ChangeNewEdges;
		TopTools_ListOfShape & ChangeNewEdges(const int I);

		/****** TopOpeBRepBuild_HBuilder::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all split and merge already performed. Does NOT clear the handled DS.
") Clear;
		void Clear();

		/****** TopOpeBRepBuild_HBuilder::CurrentSection ******/
		/****** md5 signature: d448545aa275d0bbbc56cde80b47a1e6 ******/
		%feature("compactdefaultargs") CurrentSection;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") CurrentSection;
		const TopoDS_Shape CurrentSection();

		/****** TopOpeBRepBuild_HBuilder::DataStructure ******/
		/****** md5 signature: c5d3d5af4f8db2375e9c48f16eb16363 ******/
		%feature("compactdefaultargs") DataStructure;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>

Description
-----------
returns the DS handled by this builder.
") DataStructure;
		opencascade::handle<TopOpeBRepDS_HDataStructure> DataStructure();

		/****** TopOpeBRepBuild_HBuilder::EdgeCurveAncestors ******/
		/****** md5 signature: ab3c18493d0bec27907964e0f88bdf36 ******/
		%feature("compactdefaultargs") EdgeCurveAncestors;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
F1: TopoDS_Shape
F2: TopoDS_Shape

Return
-------
IC: int

Description
-----------
search for the couple of face F1,F2 (from arguments of supra Perform(S1,S2,HDS)) method which intersection gives section edge E built on an intersection curve. returns True if F1,F2 have been valued. returns False if E is not a section edge built on intersection curve IC.
") EdgeCurveAncestors;
		bool EdgeCurveAncestors(const TopoDS_Shape & E, TopoDS_Shape & F1, TopoDS_Shape & F2, Standard_Integer &OutValue);

		/****** TopOpeBRepBuild_HBuilder::EdgeSectionAncestors ******/
		/****** md5 signature: 9ce55a3fc52d699b16100b962c993bc3 ******/
		%feature("compactdefaultargs") EdgeSectionAncestors;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
LF1: TopTools_ListOfShape
LF2: TopTools_ListOfShape
LE1: TopTools_ListOfShape
LE2: TopTools_ListOfShape

Return
-------
bool

Description
-----------
search for the couple of face F1,F2 (from arguments of supra Perform(S1,S2,HDS)) method which intersection gives section edge E built on at least one edge. returns True if F1,F2 have been valued. returns False if E is not a section edge built on at least one edge of S1 and/or S2. LE1,LE2 are edges of S1,S2 which common part is edge E. LE1 or LE2 may be empty() but not both.
") EdgeSectionAncestors;
		bool EdgeSectionAncestors(const TopoDS_Shape & E, TopTools_ListOfShape & LF1, TopTools_ListOfShape & LF2, TopTools_ListOfShape & LE1, TopTools_ListOfShape & LE2);

		/****** TopOpeBRepBuild_HBuilder::GetDSCurveFromSectEdge ******/
		/****** md5 signature: bd05bc971bc5185fe7b309a2fac19738 ******/
		%feature("compactdefaultargs") GetDSCurveFromSectEdge;
		%feature("autodoc", "
Parameters
----------
SectEdge: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") GetDSCurveFromSectEdge;
		int GetDSCurveFromSectEdge(const TopoDS_Shape & SectEdge);

		/****** TopOpeBRepBuild_HBuilder::GetDSEdgeFromSectEdge ******/
		/****** md5 signature: addfdd9ed1ccf9ca207fe45495fdcf89 ******/
		%feature("compactdefaultargs") GetDSEdgeFromSectEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
rank: int

Return
-------
int

Description
-----------
No available documentation.
") GetDSEdgeFromSectEdge;
		int GetDSEdgeFromSectEdge(const TopoDS_Shape & E, const int rank);

		/****** TopOpeBRepBuild_HBuilder::GetDSFaceFromDSCurve ******/
		/****** md5 signature: 4db427058dc3084f173c46716e7b9c8b ******/
		%feature("compactdefaultargs") GetDSFaceFromDSCurve;
		%feature("autodoc", "
Parameters
----------
indexCur: int
rank: int

Return
-------
int

Description
-----------
No available documentation.
") GetDSFaceFromDSCurve;
		int GetDSFaceFromDSCurve(const int indexCur, const int rank);

		/****** TopOpeBRepBuild_HBuilder::GetDSFaceFromDSEdge ******/
		/****** md5 signature: a962da98d2a4a7b207c8849c157ebbb1 ******/
		%feature("compactdefaultargs") GetDSFaceFromDSEdge;
		%feature("autodoc", "
Parameters
----------
indexEdg: int
rank: int

Return
-------
TColStd_ListOfInteger

Description
-----------
No available documentation.
") GetDSFaceFromDSEdge;
		TColStd_ListOfInteger & GetDSFaceFromDSEdge(const int indexEdg, const int rank);

		/****** TopOpeBRepBuild_HBuilder::GetDSPointFromNewVertex ******/
		/****** md5 signature: 35073b889ed09bb772e102ee75693fb1 ******/
		%feature("compactdefaultargs") GetDSPointFromNewVertex;
		%feature("autodoc", "
Parameters
----------
NewVert: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") GetDSPointFromNewVertex;
		int GetDSPointFromNewVertex(const TopoDS_Shape & NewVert);

		/****** TopOpeBRepBuild_HBuilder::InitExtendedSectionDS ******/
		/****** md5 signature: c8f8791d3e3eb320c2f652ffa23f1533 ******/
		%feature("compactdefaultargs") InitExtendedSectionDS;
		%feature("autodoc", "
Parameters
----------
k: int (optional, default to 3)

Return
-------
None

Description
-----------
No available documentation.
") InitExtendedSectionDS;
		void InitExtendedSectionDS(const int k = 3);

		/****** TopOpeBRepBuild_HBuilder::InitSection ******/
		/****** md5 signature: ac6683a9d8543835cf7d41f167b7ee23 ******/
		%feature("compactdefaultargs") InitSection;
		%feature("autodoc", "
Parameters
----------
k: int (optional, default to 3)

Return
-------
None

Description
-----------
No available documentation.
") InitSection;
		void InitSection(const int k = 3);

		/****** TopOpeBRepBuild_HBuilder::IsKPart ******/
		/****** md5 signature: c29b47b6ba7b2650c3c57b9a89e7a847 ******/
		%feature("compactdefaultargs") IsKPart;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 0 is standard operation, != 0 if particular case.
") IsKPart;
		int IsKPart();

		/****** TopOpeBRepBuild_HBuilder::IsMerged ******/
		/****** md5 signature: a0812fd5703287c15de14ba0cf954cbd ******/
		%feature("compactdefaultargs") IsMerged;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
ToBuild: TopAbs_State

Return
-------
bool

Description
-----------
Returns True if the shape <S> has been merged.
") IsMerged;
		bool IsMerged(const TopoDS_Shape & S, const TopAbs_State ToBuild);

		/****** TopOpeBRepBuild_HBuilder::IsSplit ******/
		/****** md5 signature: 1c41d25538e744a270bc89e2aed3ee6a ******/
		%feature("compactdefaultargs") IsSplit;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
ToBuild: TopAbs_State

Return
-------
bool

Description
-----------
Returns True if the shape <S> has been split.
") IsSplit;
		bool IsSplit(const TopoDS_Shape & S, const TopAbs_State ToBuild);

		/****** TopOpeBRepBuild_HBuilder::MergeKPart ******/
		/****** md5 signature: c5fda5909055a56871433a38fd623adb ******/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", "
Parameters
----------
TB1: TopAbs_State
TB2: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") MergeKPart;
		void MergeKPart(const TopAbs_State TB1, const TopAbs_State TB2);

		/****** TopOpeBRepBuild_HBuilder::MergeShapes ******/
		/****** md5 signature: 636b2f3679903a68befa397bca4894b5 ******/
		%feature("compactdefaultargs") MergeShapes;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
TB1: TopAbs_State
S2: TopoDS_Shape
TB2: TopAbs_State

Return
-------
None

Description
-----------
Merges the two shapes <S1> and <S2> keeping the parts of states <TB1>,<TB2> in <S1>,<S2>.
") MergeShapes;
		void MergeShapes(const TopoDS_Shape & S1, const TopAbs_State TB1, const TopoDS_Shape & S2, const TopAbs_State TB2);

		/****** TopOpeBRepBuild_HBuilder::MergeSolid ******/
		/****** md5 signature: dadbcac87fb02bfa7f2c7004eb8c0e8f ******/
		%feature("compactdefaultargs") MergeSolid;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TB: TopAbs_State

Return
-------
None

Description
-----------
Merges the solid <S> keeping the parts of state <TB>.
") MergeSolid;
		void MergeSolid(const TopoDS_Shape & S, const TopAbs_State TB);

		/****** TopOpeBRepBuild_HBuilder::MergeSolids ******/
		/****** md5 signature: ad6aa825ea70349a881f7c3ac9f6ce03 ******/
		%feature("compactdefaultargs") MergeSolids;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
TB1: TopAbs_State
S2: TopoDS_Shape
TB2: TopAbs_State

Return
-------
None

Description
-----------
Merges the two solids <S1> and <S2> keeping the parts in each solid of states <TB1> and <TB2>.
") MergeSolids;
		void MergeSolids(const TopoDS_Shape & S1, const TopAbs_State TB1, const TopoDS_Shape & S2, const TopAbs_State TB2);

		/****** TopOpeBRepBuild_HBuilder::Merged ******/
		/****** md5 signature: 1864c8ae010bb2078b42410bdf1d2bc1 ******/
		%feature("compactdefaultargs") Merged;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
ToBuild: TopAbs_State

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the merged parts <ToBuild> of shape <S>.
") Merged;
		const TopTools_ListOfShape & Merged(const TopoDS_Shape & S, const TopAbs_State ToBuild);

		/****** TopOpeBRepBuild_HBuilder::MoreSection ******/
		/****** md5 signature: 4cbf6bad03842a67747339a1cb0aa03a ******/
		%feature("compactdefaultargs") MoreSection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreSection;
		bool MoreSection();

		/****** TopOpeBRepBuild_HBuilder::NewEdges ******/
		/****** md5 signature: 9ec982f5f3014b1590bdac140184735d ******/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the edges created on curve <I>.
") NewEdges;
		const TopTools_ListOfShape & NewEdges(const int I);

		/****** TopOpeBRepBuild_HBuilder::NewFaces ******/
		/****** md5 signature: 96a08f871c044c95bf0a5b942b6f1d59 ******/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the faces created on surface <I>.
") NewFaces;
		const TopTools_ListOfShape & NewFaces(const int I);

		/****** TopOpeBRepBuild_HBuilder::NewVertex ******/
		/****** md5 signature: 22041e3bce7e66de68d0cb74a55b4197 ******/
		%feature("compactdefaultargs") NewVertex;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Shape

Description
-----------
Returns the vertex created on point <I>.
") NewVertex;
		const TopoDS_Shape NewVertex(const int I);

		/****** TopOpeBRepBuild_HBuilder::NextSection ******/
		/****** md5 signature: 43c27ad5f4227c4f31a1669f9df81a20 ******/
		%feature("compactdefaultargs") NextSection;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextSection;
		void NextSection();

		/****** TopOpeBRepBuild_HBuilder::Perform ******/
		/****** md5 signature: fe804a95bbd0d24fa265bd6d304ec2f0 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
Stores the data structure <HDS>, Create shapes from the new geometries described in <HDS>.
") Perform;
		void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****** TopOpeBRepBuild_HBuilder::Perform ******/
		/****** md5 signature: 1f49b3f64921986178453699330b0d8d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
None

Description
-----------
Same as previous + evaluates if an operation performed on shapes S1,S2 is a particular case.
") Perform;
		void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** TopOpeBRepBuild_HBuilder::Section ******/
		/****** md5 signature: de29fcbd54cc3d269c973a6e4f3c1c51 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") Section;
		const TopTools_ListOfShape & Section();

		/****** TopOpeBRepBuild_HBuilder::Splits ******/
		/****** md5 signature: ecea27f245d698e307a1abbd0f220221 ******/
		%feature("compactdefaultargs") Splits;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
ToBuild: TopAbs_State

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the split parts <ToBuild> of shape <S>.
") Splits;
		const TopTools_ListOfShape & Splits(const TopoDS_Shape & S, const TopAbs_State ToBuild);

};


%make_alias(TopOpeBRepBuild_HBuilder)

%extend TopOpeBRepBuild_HBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopOpeBRepBuild_Loop *
*****************************/
class TopOpeBRepBuild_Loop : public Standard_Transient {
	public:
		/****** TopOpeBRepBuild_Loop::TopOpeBRepBuild_Loop ******/
		/****** md5 signature: f3dc9513544cd778e3c934a1b3478d27 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_Loop;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_Loop;
		 TopOpeBRepBuild_Loop(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_Loop::TopOpeBRepBuild_Loop ******/
		/****** md5 signature: a9791f8a239b8f2965bf8eadc5a96e09 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_Loop;
		%feature("autodoc", "
Parameters
----------
BI: TopOpeBRepBuild_BlockIterator

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_Loop;
		 TopOpeBRepBuild_Loop(const TopOpeBRepBuild_BlockIterator & BI);

		/****** TopOpeBRepBuild_Loop::BlockIterator ******/
		/****** md5 signature: dacd603fbd6db0513733493b9c4a223e ******/
		%feature("compactdefaultargs") BlockIterator;
		%feature("autodoc", "Return
-------
TopOpeBRepBuild_BlockIterator

Description
-----------
No available documentation.
") BlockIterator;
		const TopOpeBRepBuild_BlockIterator & BlockIterator();

		/****** TopOpeBRepBuild_Loop::Dump ******/
		/****** md5 signature: 73b0c773468e8cceaf80d621d09b8350 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		virtual void Dump();

		/****** TopOpeBRepBuild_Loop::IsShape ******/
		/****** md5 signature: 59e03c162f361e2f4f44a567c5f17d88 ******/
		%feature("compactdefaultargs") IsShape;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsShape;
		virtual bool IsShape();

		/****** TopOpeBRepBuild_Loop::Shape ******/
		/****** md5 signature: 337d0a309daba4934b247f345f1078fd ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		virtual const TopoDS_Shape Shape();

};


%make_alias(TopOpeBRepBuild_Loop)

%extend TopOpeBRepBuild_Loop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class TopOpeBRepBuild_LoopClassifier *
***************************************/
%nodefaultctor TopOpeBRepBuild_LoopClassifier;
class TopOpeBRepBuild_LoopClassifier {
	public:
		/****** TopOpeBRepBuild_LoopClassifier::Compare ******/
		/****** md5 signature: db1e708fef844b7eb3ac56e781142a23 ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
L1: TopOpeBRepBuild_Loop
L2: TopOpeBRepBuild_Loop

Return
-------
TopAbs_State

Description
-----------
Returns the state of loop <L1> compared with loop <L2>.
") Compare;
		virtual TopAbs_State Compare(const opencascade::handle<TopOpeBRepBuild_Loop> & L1, const opencascade::handle<TopOpeBRepBuild_Loop> & L2);

};


%extend TopOpeBRepBuild_LoopClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TopOpeBRepBuild_LoopSet *
********************************/
class TopOpeBRepBuild_LoopSet {
	public:
		/****** TopOpeBRepBuild_LoopSet::TopOpeBRepBuild_LoopSet ******/
		/****** md5 signature: a3de5838952cba4d621f6ed8013c2c0c ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_LoopSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_LoopSet;
		 TopOpeBRepBuild_LoopSet();

		/****** TopOpeBRepBuild_LoopSet::ChangeListOfLoop ******/
		/****** md5 signature: 5aa9b460b50ff2b9db4092df61e6905f ******/
		%feature("compactdefaultargs") ChangeListOfLoop;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>>

Description
-----------
No available documentation.
") ChangeListOfLoop;
		NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>> & ChangeListOfLoop();

		/****** TopOpeBRepBuild_LoopSet::InitLoop ******/
		/****** md5 signature: a4df8a77ba2719bab7c447a81e3a1574 ******/
		%feature("compactdefaultargs") InitLoop;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitLoop;
		virtual void InitLoop();

		/****** TopOpeBRepBuild_LoopSet::Loop ******/
		/****** md5 signature: ddfe19c212ce4c6c1b7b56a01ad4f9f3 ******/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepBuild_Loop>

Description
-----------
No available documentation.
") Loop;
		virtual opencascade::handle<TopOpeBRepBuild_Loop> Loop();

		/****** TopOpeBRepBuild_LoopSet::MoreLoop ******/
		/****** md5 signature: 0f9ba6ebb2c9d32de2d7ce66275c4d2d ******/
		%feature("compactdefaultargs") MoreLoop;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreLoop;
		virtual bool MoreLoop();

		/****** TopOpeBRepBuild_LoopSet::NextLoop ******/
		/****** md5 signature: d99b3deb5badef1842f96552e38bc9a4 ******/
		%feature("compactdefaultargs") NextLoop;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextLoop;
		virtual void NextLoop();

};


%extend TopOpeBRepBuild_LoopSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class TopOpeBRepBuild_ShapeListOfShape *
*****************************************/
class TopOpeBRepBuild_ShapeListOfShape {
	public:
		/****** TopOpeBRepBuild_ShapeListOfShape::TopOpeBRepBuild_ShapeListOfShape ******/
		/****** md5 signature: 3414dce0de992b0ae41fe9bdb28809e4 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeListOfShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_ShapeListOfShape;
		 TopOpeBRepBuild_ShapeListOfShape();

		/****** TopOpeBRepBuild_ShapeListOfShape::TopOpeBRepBuild_ShapeListOfShape ******/
		/****** md5 signature: 12df71569993260a08c1a465caa334e3 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeListOfShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_ShapeListOfShape;
		 TopOpeBRepBuild_ShapeListOfShape(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_ShapeListOfShape::TopOpeBRepBuild_ShapeListOfShape ******/
		/****** md5 signature: 874b69bcf3075cdc8c07237ada2ecd62 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeListOfShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
L: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_ShapeListOfShape;
		 TopOpeBRepBuild_ShapeListOfShape(const TopoDS_Shape & S, const TopTools_ListOfShape & L);

		/****** TopOpeBRepBuild_ShapeListOfShape::ChangeList ******/
		/****** md5 signature: cbc513114dab617d234a66c2a7a0e9f1 ******/
		%feature("compactdefaultargs") ChangeList;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") ChangeList;
		TopTools_ListOfShape & ChangeList();

		/****** TopOpeBRepBuild_ShapeListOfShape::ChangeShape ******/
		/****** md5 signature: 465c12175fb924e02c35f2de6caf5b49 ******/
		%feature("compactdefaultargs") ChangeShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ChangeShape;
		TopoDS_Shape ChangeShape();

		/****** TopOpeBRepBuild_ShapeListOfShape::List ******/
		/****** md5 signature: 25c7d72b52d4ce0a2cf693b3dde1f6ac ******/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") List;
		const TopTools_ListOfShape & List();

		/****** TopOpeBRepBuild_ShapeListOfShape::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

};


%extend TopOpeBRepBuild_ShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopOpeBRepBuild_ShapeSet *
*********************************/
class TopOpeBRepBuild_ShapeSet {
	public:
		/****** TopOpeBRepBuild_ShapeSet::TopOpeBRepBuild_ShapeSet ******/
		/****** md5 signature: 63f2608f9ad3bb50e1afcdd21f41e6cc ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeSet;
		%feature("autodoc", "
Parameters
----------
SubShapeType: TopAbs_ShapeEnum
checkshape: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a ShapeSet in order to build shapes connected by <SubShapeType> shapes. <checkshape>:check (or not) the shapes, startelements, elements added.
") TopOpeBRepBuild_ShapeSet;
		 TopOpeBRepBuild_ShapeSet(const TopAbs_ShapeEnum SubShapeType, const bool checkshape = true);

		/****** TopOpeBRepBuild_ShapeSet::AddElement ******/
		/****** md5 signature: a0c83dd931e5b348d22c96fc7e34b0be ******/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
for each subshape SE of S of type mySubShapeType - Add subshapes of S to the map of subshapes (mySubShapeMap) - Add S to the list of shape incident to subshapes of S.
") AddElement;
		virtual void AddElement(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_ShapeSet::AddShape ******/
		/****** md5 signature: c53353d34d3c27129aeecdacd6371580 ******/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Adds <S> to the list of shapes. (wires or shells).
") AddShape;
		virtual void AddShape(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_ShapeSet::AddStartElement ******/
		/****** md5 signature: dc55f23481a00125b9138d890be42a76 ******/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
(S is a face or edge) Add S to the list of starting shapes used for reconstructions. apply AddElement(S).
") AddStartElement;
		virtual void AddStartElement(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_ShapeSet::ChangeStartShapes ******/
		/****** md5 signature: ee94f0d1072abc13f19e14ddca9e8839 ******/
		%feature("compactdefaultargs") ChangeStartShapes;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") ChangeStartShapes;
		TopTools_ListOfShape & ChangeStartShapes();

		/****** TopOpeBRepBuild_ShapeSet::CheckShape ******/
		/****** md5 signature: ab7ce023faa137329caa469a34afff21 ******/
		%feature("compactdefaultargs") CheckShape;
		%feature("autodoc", "
Parameters
----------
checkshape: bool

Return
-------
None

Description
-----------
No available documentation.
") CheckShape;
		void CheckShape(const bool checkshape);

		/****** TopOpeBRepBuild_ShapeSet::CheckShape ******/
		/****** md5 signature: 12b47b49675e9ae5a222c6c0e3bbe84d ******/
		%feature("compactdefaultargs") CheckShape;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CheckShape;
		bool CheckShape();

		/****** TopOpeBRepBuild_ShapeSet::CheckShape ******/
		/****** md5 signature: e1165fabfdf925fbd133a5323da89d79 ******/
		%feature("compactdefaultargs") CheckShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
checkgeom: bool (optional, default to false)

Return
-------
bool

Description
-----------
No available documentation.
") CheckShape;
		bool CheckShape(const TopoDS_Shape & S, const bool checkgeom = false);

		/****** TopOpeBRepBuild_ShapeSet::DEBName ******/
		/****** md5 signature: 5e2926cd2a4caba9b436420af088c28e ******/
		%feature("compactdefaultargs") DEBName;
		%feature("autodoc", "
Parameters
----------
N: str

Return
-------
None

Description
-----------
No available documentation.
") DEBName;
		void DEBName(TCollection_AsciiString N);

		/****** TopOpeBRepBuild_ShapeSet::DEBName ******/
		/****** md5 signature: 596c83e886c46038e831ad6994742c89 ******/
		%feature("compactdefaultargs") DEBName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") DEBName;
		const TCollection_AsciiString & DEBName();

		/****** TopOpeBRepBuild_ShapeSet::DEBNumber ******/
		/****** md5 signature: a24fb50c68b3d689759bc37c453b91dc ******/
		%feature("compactdefaultargs") DEBNumber;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") DEBNumber;
		void DEBNumber(const int I);

		/****** TopOpeBRepBuild_ShapeSet::DEBNumber ******/
		/****** md5 signature: 50dff59f518b2433ca64af17b5308abc ******/
		%feature("compactdefaultargs") DEBNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") DEBNumber;
		int DEBNumber();

		/****** TopOpeBRepBuild_ShapeSet::DumpBB ******/
		/****** md5 signature: eb911931adf297046e3668db5b0bd70c ******/
		%feature("compactdefaultargs") DumpBB;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") DumpBB;
		virtual void DumpBB();

		/****** TopOpeBRepBuild_ShapeSet::DumpCheck ******/
		/****** md5 signature: 049c19f70d6799bcafe6b85b239a3ba6 ******/
		%feature("compactdefaultargs") DumpCheck;
		%feature("autodoc", "
Parameters
----------
str: str
S: TopoDS_Shape
chk: bool

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") DumpCheck;
		void DumpCheck(std::ostream &OutValue, TCollection_AsciiString str, const TopoDS_Shape & S, const bool chk);

		/****** TopOpeBRepBuild_ShapeSet::DumpName ******/
		/****** md5 signature: e73ae5ec230cf0b21dee0ddf6cc25888 ******/
		%feature("compactdefaultargs") DumpName;
		%feature("autodoc", "
Parameters
----------
str: str

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") DumpName;
		void DumpName(std::ostream &OutValue, TCollection_AsciiString str);

		/****** TopOpeBRepBuild_ShapeSet::DumpSS ******/
		/****** md5 signature: cdc9acb51bec94239bc4daf1ba078420 ******/
		%feature("compactdefaultargs") DumpSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") DumpSS;
		virtual void DumpSS();

		/****** TopOpeBRepBuild_ShapeSet::FindNeighbours ******/
		/****** md5 signature: 9a7c7975c0fac78768adfbf3c69765cd ******/
		%feature("compactdefaultargs") FindNeighbours;
		%feature("autodoc", "Return
-------
None

Description
-----------
Build the list of neighbour shapes of myCurrentShape (neighbour shapes and myCurrentShapes are of type t) Initialize myIncidentShapesIter on neighbour shapes.
") FindNeighbours;
		virtual void FindNeighbours();

		/****** TopOpeBRepBuild_ShapeSet::InitNeighbours ******/
		/****** md5 signature: a0cea7a8b3678ed63469bf531857236b ******/
		%feature("compactdefaultargs") InitNeighbours;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") InitNeighbours;
		virtual void InitNeighbours(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_ShapeSet::InitShapes ******/
		/****** md5 signature: fadc3dab1e665e61d118295d0ffef841 ******/
		%feature("compactdefaultargs") InitShapes;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitShapes;
		void InitShapes();

		/****** TopOpeBRepBuild_ShapeSet::InitStartElements ******/
		/****** md5 signature: d4e886530c21ee2f20773115c58aa61a ******/
		%feature("compactdefaultargs") InitStartElements;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitStartElements;
		void InitStartElements();

		/****** TopOpeBRepBuild_ShapeSet::MakeNeighboursList ******/
		/****** md5 signature: f595d6ca3f7965749f70022ca0ea583a ******/
		%feature("compactdefaultargs") MakeNeighboursList;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
V: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") MakeNeighboursList;
		virtual const TopTools_ListOfShape & MakeNeighboursList(const TopoDS_Shape & E, const TopoDS_Shape & V);

		/****** TopOpeBRepBuild_ShapeSet::MaxNumberSubShape ******/
		/****** md5 signature: ddfcef19d67b93056540712bea42f236 ******/
		%feature("compactdefaultargs") MaxNumberSubShape;
		%feature("autodoc", "
Parameters
----------
Shape: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") MaxNumberSubShape;
		int MaxNumberSubShape(const TopoDS_Shape & Shape);

		/****** TopOpeBRepBuild_ShapeSet::MoreNeighbours ******/
		/****** md5 signature: ace2ff5b924936657d24fb26abd4155b ******/
		%feature("compactdefaultargs") MoreNeighbours;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreNeighbours;
		bool MoreNeighbours();

		/****** TopOpeBRepBuild_ShapeSet::MoreShapes ******/
		/****** md5 signature: 6d6bfff865ecc79a4addc4ca200bcbdc ******/
		%feature("compactdefaultargs") MoreShapes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreShapes;
		bool MoreShapes();

		/****** TopOpeBRepBuild_ShapeSet::MoreStartElements ******/
		/****** md5 signature: fa6b242adfda7bd84f237f099d1da1f6 ******/
		%feature("compactdefaultargs") MoreStartElements;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreStartElements;
		bool MoreStartElements();

		/****** TopOpeBRepBuild_ShapeSet::Neighbour ******/
		/****** md5 signature: 58db2ce92796f96724d4caf28e03dabd ******/
		%feature("compactdefaultargs") Neighbour;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Neighbour;
		const TopoDS_Shape Neighbour();

		/****** TopOpeBRepBuild_ShapeSet::NextNeighbour ******/
		/****** md5 signature: 535f68a9b46f1974ababc8486870b0f4 ******/
		%feature("compactdefaultargs") NextNeighbour;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextNeighbour;
		void NextNeighbour();

		/****** TopOpeBRepBuild_ShapeSet::NextShape ******/
		/****** md5 signature: 156dbccf2699d90c62d3b8c5b2d3ac79 ******/
		%feature("compactdefaultargs") NextShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextShape;
		void NextShape();

		/****** TopOpeBRepBuild_ShapeSet::NextStartElement ******/
		/****** md5 signature: 297039843eabc0572b4c9b2613425226 ******/
		%feature("compactdefaultargs") NextStartElement;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextStartElement;
		void NextStartElement();

		/****** TopOpeBRepBuild_ShapeSet::SName ******/
		/****** md5 signature: 7cac2bc1cde427670fc87937c4197971 ******/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
sb: str (optional, default to "")
sa: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SName;
		virtual TCollection_AsciiString SName(const TopoDS_Shape & S, TCollection_AsciiString sb = "", TCollection_AsciiString sa = "");

		/****** TopOpeBRepBuild_ShapeSet::SName ******/
		/****** md5 signature: 028d4f667a4a1c0fee87263e71ac4ed8 ******/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "
Parameters
----------
S: TopTools_ListOfShape
sb: str (optional, default to "")
sa: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SName;
		virtual TCollection_AsciiString SName(const TopTools_ListOfShape & S, TCollection_AsciiString sb = "", TCollection_AsciiString sa = "");

		/****** TopOpeBRepBuild_ShapeSet::SNameori ******/
		/****** md5 signature: 38c70945225dd056fbf42066df8d01f7 ******/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
sb: str (optional, default to "")
sa: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SNameori;
		virtual TCollection_AsciiString SNameori(const TopoDS_Shape & S, TCollection_AsciiString sb = "", TCollection_AsciiString sa = "");

		/****** TopOpeBRepBuild_ShapeSet::SNameori ******/
		/****** md5 signature: 7e3150722ab19986d05808ad9e3334db ******/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "
Parameters
----------
S: TopTools_ListOfShape
sb: str (optional, default to "")
sa: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SNameori;
		virtual TCollection_AsciiString SNameori(const TopTools_ListOfShape & S, TCollection_AsciiString sb = "", TCollection_AsciiString sa = "");

		/****** TopOpeBRepBuild_ShapeSet::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

		/****** TopOpeBRepBuild_ShapeSet::StartElement ******/
		/****** md5 signature: b59b01c3e9566e26cf0675119a661c56 ******/
		%feature("compactdefaultargs") StartElement;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") StartElement;
		const TopoDS_Shape StartElement();

		/****** TopOpeBRepBuild_ShapeSet::StartElements ******/
		/****** md5 signature: 8affdda449171035a3b1e1ddba936aa5 ******/
		%feature("compactdefaultargs") StartElements;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
return a reference on myStartShapes.
") StartElements;
		const TopTools_ListOfShape & StartElements();

};


%extend TopOpeBRepBuild_ShapeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class TopOpeBRepBuild_ShellToSolid *
*************************************/
class TopOpeBRepBuild_ShellToSolid {
	public:
		/****** TopOpeBRepBuild_ShellToSolid::TopOpeBRepBuild_ShellToSolid ******/
		/****** md5 signature: 3ec5c30834dc38a95b9f02fdcbbec343 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellToSolid;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_ShellToSolid;
		 TopOpeBRepBuild_ShellToSolid();

		/****** TopOpeBRepBuild_ShellToSolid::AddShell ******/
		/****** md5 signature: faaf3f93bf2b074b026cc92dd3f89969 ******/
		%feature("compactdefaultargs") AddShell;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shell

Return
-------
None

Description
-----------
No available documentation.
") AddShell;
		void AddShell(const TopoDS_Shell & Sh);

		/****** TopOpeBRepBuild_ShellToSolid::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****** TopOpeBRepBuild_ShellToSolid::MakeSolids ******/
		/****** md5 signature: 59a8ac21c897e186144dac7245cb3269 ******/
		%feature("compactdefaultargs") MakeSolids;
		%feature("autodoc", "
Parameters
----------
So: TopoDS_Solid
LSo: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") MakeSolids;
		void MakeSolids(const TopoDS_Solid & So, TopTools_ListOfShape & LSo);

};


%extend TopOpeBRepBuild_ShellToSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class TopOpeBRepBuild_SolidBuilder *
*************************************/
class TopOpeBRepBuild_SolidBuilder {
	public:
		/****** TopOpeBRepBuild_SolidBuilder::TopOpeBRepBuild_SolidBuilder ******/
		/****** md5 signature: e5c243cabed9eda62c2fb92b7bbf54aa ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_SolidBuilder;
		 TopOpeBRepBuild_SolidBuilder();

		/****** TopOpeBRepBuild_SolidBuilder::TopOpeBRepBuild_SolidBuilder ******/
		/****** md5 signature: 713160a18c1efed54fd96efb32f08074 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidBuilder;
		%feature("autodoc", "
Parameters
----------
FS: TopOpeBRepBuild_ShellFaceSet
ForceClass: bool (optional, default to false)

Return
-------
None

Description
-----------
Create a SolidBuilder to build the areas on the shapes (shells, blocks of faces) described by <LS>.
") TopOpeBRepBuild_SolidBuilder;
		 TopOpeBRepBuild_SolidBuilder(TopOpeBRepBuild_ShellFaceSet & FS, const bool ForceClass = false);

		/****** TopOpeBRepBuild_SolidBuilder::Face ******/
		/****** md5 signature: 9c9430f314f7a67219d35de85b5a42a5 ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns current new face of current new shell.
") Face;
		const TopoDS_Shape Face();

		/****** TopOpeBRepBuild_SolidBuilder::InitFace ******/
		/****** md5 signature: f7d658980d48b1f34106c03b05d30566 ******/
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") InitFace;
		int InitFace();

		/****** TopOpeBRepBuild_SolidBuilder::InitShell ******/
		/****** md5 signature: 85b17fab55f16a9ab053bddebe95f734 ******/
		%feature("compactdefaultargs") InitShell;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") InitShell;
		int InitShell();

		/****** TopOpeBRepBuild_SolidBuilder::InitSolid ******/
		/****** md5 signature: b5c9b1b539aa56f6dd95ab393281c463 ******/
		%feature("compactdefaultargs") InitSolid;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") InitSolid;
		int InitSolid();

		/****** TopOpeBRepBuild_SolidBuilder::InitSolidBuilder ******/
		/****** md5 signature: 34f16619423a9e5ee3b166d0f7f83114 ******/
		%feature("compactdefaultargs") InitSolidBuilder;
		%feature("autodoc", "
Parameters
----------
FS: TopOpeBRepBuild_ShellFaceSet
ForceClass: bool

Return
-------
None

Description
-----------
No available documentation.
") InitSolidBuilder;
		void InitSolidBuilder(TopOpeBRepBuild_ShellFaceSet & FS, const bool ForceClass);

		/****** TopOpeBRepBuild_SolidBuilder::IsOldShell ******/
		/****** md5 signature: 5ad2985e0625a2834f6862a84cdb6bdb ******/
		%feature("compactdefaultargs") IsOldShell;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsOldShell;
		bool IsOldShell();

		/****** TopOpeBRepBuild_SolidBuilder::MoreFace ******/
		/****** md5 signature: bff7dacb9d14d55afd6f709576086160 ******/
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreFace;
		bool MoreFace();

		/****** TopOpeBRepBuild_SolidBuilder::MoreShell ******/
		/****** md5 signature: c58d1a5522c7d62e59763f1b09775cef ******/
		%feature("compactdefaultargs") MoreShell;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreShell;
		bool MoreShell();

		/****** TopOpeBRepBuild_SolidBuilder::MoreSolid ******/
		/****** md5 signature: d676750eea343fe115ff6727af0175d2 ******/
		%feature("compactdefaultargs") MoreSolid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreSolid;
		bool MoreSolid();

		/****** TopOpeBRepBuild_SolidBuilder::NextFace ******/
		/****** md5 signature: 33ae62d7d15ec80966f0219be1a267db ******/
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextFace;
		void NextFace();

		/****** TopOpeBRepBuild_SolidBuilder::NextShell ******/
		/****** md5 signature: acf25ab192bbd1382fada471f35632f3 ******/
		%feature("compactdefaultargs") NextShell;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextShell;
		void NextShell();

		/****** TopOpeBRepBuild_SolidBuilder::NextSolid ******/
		/****** md5 signature: e2d23a7fdbf80f754adbb385c434e821 ******/
		%feature("compactdefaultargs") NextSolid;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextSolid;
		void NextSolid();

		/****** TopOpeBRepBuild_SolidBuilder::OldShell ******/
		/****** md5 signature: 50e7fb892ac0baaa4a78e899a50e0c64 ******/
		%feature("compactdefaultargs") OldShell;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns current shell This shell may be: * an old shell OldShell(), which has not been reconstructed; * a new shell made of faces described by ...NewFace() methods.
") OldShell;
		const TopoDS_Shape OldShell();

};


%extend TopOpeBRepBuild_SolidBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TopOpeBRepBuild_Tools *
******************************/
class TopOpeBRepBuild_Tools {
	public:
		/****** TopOpeBRepBuild_Tools::CheckFaceClosed2d ******/
		/****** md5 signature: 58bd20b085acfa0c0e1ad48e6366a3b7 ******/
		%feature("compactdefaultargs") CheckFaceClosed2d;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face

Return
-------
bool

Description
-----------
Checks if <theFace> has the properly closed in 2D boundary(ies).
") CheckFaceClosed2d;
		static bool CheckFaceClosed2d(const TopoDS_Face & theFace);

		/****** TopOpeBRepBuild_Tools::CorrectCurveOnSurface ******/
		/****** md5 signature: 337521ff2d221bb205ad074bf3de67c3 ******/
		%feature("compactdefaultargs") CorrectCurveOnSurface;
		%feature("autodoc", "
Parameters
----------
aS: TopoDS_Shape
aTolMax: double (optional, default to 0.0001)

Return
-------
None

Description
-----------
No available documentation.
") CorrectCurveOnSurface;
		static void CorrectCurveOnSurface(const TopoDS_Shape & aS, const double aTolMax = 0.0001);

		/****** TopOpeBRepBuild_Tools::CorrectFace2d ******/
		/****** md5 signature: 4abb20ca1d2b3c1d5ad7f83a56692e5b ******/
		%feature("compactdefaultargs") CorrectFace2d;
		%feature("autodoc", "
Parameters
----------
oldFace: TopoDS_Shape
corrFace: TopoDS_Shape
aSourceShapes: TopTools_IndexedMapOfOrientedShape
aMapOfCorrect2dEdges: TopTools_IndexedDataMapOfShapeShape

Return
-------
None

Description
-----------
test if UV representation of <oldFace> is good (i.e. face is closed in 2d). if face is not closed, this method will try to close such face and will return corrected edges in the <aMapOfCorrect2dEdges>. Parameter <aSourceShapes> used to fix the edge (or wires) which should be correct (Corrector used it as a start shapes). NOTE: Parameter corrFace doesn't mean anything. If you want to use this method, rebuild resulting face after by yourself using corrected edges.
") CorrectFace2d;
		static void CorrectFace2d(const TopoDS_Shape & oldFace, TopoDS_Shape & corrFace, const TopTools_IndexedMapOfOrientedShape & aSourceShapes, TopTools_IndexedDataMapOfShapeShape & aMapOfCorrect2dEdges);

		/****** TopOpeBRepBuild_Tools::CorrectPointOnCurve ******/
		/****** md5 signature: f3178046829c5ee9c97699610766d33b ******/
		%feature("compactdefaultargs") CorrectPointOnCurve;
		%feature("autodoc", "
Parameters
----------
aS: TopoDS_Shape
aTolMax: double (optional, default to 0.0001)

Return
-------
None

Description
-----------
No available documentation.
") CorrectPointOnCurve;
		static void CorrectPointOnCurve(const TopoDS_Shape & aS, const double aTolMax = 0.0001);

		/****** TopOpeBRepBuild_Tools::CorrectTolerances ******/
		/****** md5 signature: 2b56d8d1521772732b25bd1792559b43 ******/
		%feature("compactdefaultargs") CorrectTolerances;
		%feature("autodoc", "
Parameters
----------
aS: TopoDS_Shape
aTolMax: double (optional, default to 0.0001)

Return
-------
None

Description
-----------
No available documentation.
") CorrectTolerances;
		static void CorrectTolerances(const TopoDS_Shape & aS, const double aTolMax = 0.0001);

		/****** TopOpeBRepBuild_Tools::FindState ******/
		/****** md5 signature: 0e76f7bf2323ab7fab1491e82e92e2ba ******/
		%feature("compactdefaultargs") FindState;
		%feature("autodoc", "
Parameters
----------
aVertex: TopoDS_Shape
aState: TopAbs_State
aShapeEnum: TopAbs_ShapeEnum
aMapVertexEdges: TopTools_IndexedDataMapOfShapeListOfShape
aMapProcessedVertices: TopTools_MapOfShape
aMapVs: NCollection_DataMap<TopoDS_Shape, TopAbs_State, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") FindState;
		static void FindState(const TopoDS_Shape & aVertex, const TopAbs_State aState, const TopAbs_ShapeEnum aShapeEnum, const TopTools_IndexedDataMapOfShapeListOfShape & aMapVertexEdges, TopTools_MapOfShape & aMapProcessedVertices, NCollection_DataMap<TopoDS_Shape, TopAbs_State, TopTools_ShapeMapHasher> & aMapVs);

		/****** TopOpeBRepBuild_Tools::FindState1 ******/
		/****** md5 signature: 02abea97e4a022c9f9f84aecadd34421 ******/
		%feature("compactdefaultargs") FindState1;
		%feature("autodoc", "
Parameters
----------
anEdge: TopoDS_Shape
aState: TopAbs_State
aMapEdgesFaces: TopTools_IndexedDataMapOfShapeListOfShape
aMapProcessedVertices: TopTools_MapOfShape
aMapVs: NCollection_DataMap<TopoDS_Shape, TopAbs_State, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") FindState1;
		static void FindState1(const TopoDS_Shape & anEdge, const TopAbs_State aState, const TopTools_IndexedDataMapOfShapeListOfShape & aMapEdgesFaces, TopTools_MapOfShape & aMapProcessedVertices, NCollection_DataMap<TopoDS_Shape, TopAbs_State, TopTools_ShapeMapHasher> & aMapVs);

		/****** TopOpeBRepBuild_Tools::FindState2 ******/
		/****** md5 signature: 342a5964ba2b385561d5c0f06a0f554f ******/
		%feature("compactdefaultargs") FindState2;
		%feature("autodoc", "
Parameters
----------
anEdge: TopoDS_Shape
aState: TopAbs_State
aMapEdgesFaces: TopTools_IndexedDataMapOfShapeListOfShape
aMapProcessedEdges: TopTools_MapOfShape
aMapVs: NCollection_DataMap<TopoDS_Shape, TopAbs_State, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") FindState2;
		static void FindState2(const TopoDS_Shape & anEdge, const TopAbs_State aState, const TopTools_IndexedDataMapOfShapeListOfShape & aMapEdgesFaces, TopTools_MapOfShape & aMapProcessedEdges, NCollection_DataMap<TopoDS_Shape, TopAbs_State, TopTools_ShapeMapHasher> & aMapVs);

		/****** TopOpeBRepBuild_Tools::FindStateThroughVertex ******/
		/****** md5 signature: fb56004abd1d62ba7f2cf4c2293946de ******/
		%feature("compactdefaultargs") FindStateThroughVertex;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aShapeClassifier: TopOpeBRepTool_ShapeClassifier
aMapOfShapeWithState: NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeWithState, TopTools_ShapeMapHasher>
anAvoidSubshMap: TopTools_MapOfShape

Return
-------
TopAbs_State

Description
-----------
No available documentation.
") FindStateThroughVertex;
		static TopAbs_State FindStateThroughVertex(const TopoDS_Shape & aShape, TopOpeBRepTool_ShapeClassifier & aShapeClassifier, NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeWithState, TopTools_ShapeMapHasher> & aMapOfShapeWithState, const TopTools_MapOfShape & anAvoidSubshMap);

		/****** TopOpeBRepBuild_Tools::GetAdjacentFace ******/
		/****** md5 signature: b97bea36a28b3a8dc4f5fd82cae5cbac ******/
		%feature("compactdefaultargs") GetAdjacentFace;
		%feature("autodoc", "
Parameters
----------
aFaceObj: TopoDS_Shape
anEObj: TopoDS_Shape
anEdgeFaceMap: TopTools_IndexedDataMapOfShapeListOfShape
anAdjFaceObj: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") GetAdjacentFace;
		static bool GetAdjacentFace(const TopoDS_Shape & aFaceObj, const TopoDS_Shape & anEObj, const TopTools_IndexedDataMapOfShapeListOfShape & anEdgeFaceMap, TopoDS_Shape & anAdjFaceObj);

		/****** TopOpeBRepBuild_Tools::GetNormalInNearestPoint ******/
		/****** md5 signature: 2de9145b3d4393a457510776ac33fd9a ******/
		%feature("compactdefaultargs") GetNormalInNearestPoint;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Face
anEdge: TopoDS_Edge
aNormal: gp_Vec

Return
-------
None

Description
-----------
This function used to compute normal in point which is located near the point with param UV (used for computation of normals where the normal in the point UV equal to zero).
") GetNormalInNearestPoint;
		static void GetNormalInNearestPoint(const TopoDS_Face & aFace, const TopoDS_Edge & anEdge, gp_Vec & aNormal);

		/****** TopOpeBRepBuild_Tools::GetNormalToFaceOnEdge ******/
		/****** md5 signature: 87fae39bcd5cabc104cd7535652da643 ******/
		%feature("compactdefaultargs") GetNormalToFaceOnEdge;
		%feature("autodoc", "
Parameters
----------
aFObj: TopoDS_Face
anEdgeObj: TopoDS_Edge
aDirNormal: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") GetNormalToFaceOnEdge;
		static void GetNormalToFaceOnEdge(const TopoDS_Face & aFObj, const TopoDS_Edge & anEdgeObj, gp_Vec & aDirNormal);

		/****** TopOpeBRepBuild_Tools::GetTangentToEdge ******/
		/****** md5 signature: 9958555b8aa7ef36a31b5eb669ad0e29 ******/
		%feature("compactdefaultargs") GetTangentToEdge;
		%feature("autodoc", "
Parameters
----------
anEdgeObj: TopoDS_Edge
aTangent: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") GetTangentToEdge;
		static bool GetTangentToEdge(const TopoDS_Edge & anEdgeObj, gp_Vec & aTangent);

		/****** TopOpeBRepBuild_Tools::GetTangentToEdgeEdge ******/
		/****** md5 signature: 5d8e059ace86450d6d58f899fa6fa385 ******/
		%feature("compactdefaultargs") GetTangentToEdgeEdge;
		%feature("autodoc", "
Parameters
----------
aFObj: TopoDS_Face
anEdgeObj: TopoDS_Edge
aOriEObj: TopoDS_Edge
aTangent: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") GetTangentToEdgeEdge;
		static bool GetTangentToEdgeEdge(const TopoDS_Face & aFObj, const TopoDS_Edge & anEdgeObj, const TopoDS_Edge & aOriEObj, gp_Vec & aTangent);

		/****** TopOpeBRepBuild_Tools::IsDegEdgesTheSame ******/
		/****** md5 signature: e90bcbd5813806acede31dc12f7a7a31 ******/
		%feature("compactdefaultargs") IsDegEdgesTheSame;
		%feature("autodoc", "
Parameters
----------
anE1: TopoDS_Shape
anE2: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") IsDegEdgesTheSame;
		static bool IsDegEdgesTheSame(const TopoDS_Shape & anE1, const TopoDS_Shape & anE2);

		/****** TopOpeBRepBuild_Tools::NormalizeFace ******/
		/****** md5 signature: 4fbabeb25073ee18ab15ff5a131e6e4b ******/
		%feature("compactdefaultargs") NormalizeFace;
		%feature("autodoc", "
Parameters
----------
oldFace: TopoDS_Shape
corrFace: TopoDS_Shape

Return
-------
None

Description
-----------
test if <oldFace> does not contain INTERNAL or EXTERNAL edges and remove such edges in case of its presence. The result is stored in <corrFace>.
") NormalizeFace;
		static void NormalizeFace(const TopoDS_Shape & oldFace, TopoDS_Shape & corrFace);

		/****** TopOpeBRepBuild_Tools::PropagateState ******/
		/****** md5 signature: 1f0fe1f543058030b2ecffd4aa5658a4 ******/
		%feature("compactdefaultargs") PropagateState;
		%feature("autodoc", "
Parameters
----------
aSplEdgesState: NCollection_DataMap<TopoDS_Shape, TopAbs_State, TopTools_ShapeMapHasher>
anEdgesToRestMap: TopTools_IndexedMapOfShape
aShapeEnum1: TopAbs_ShapeEnum
aShapeEnum2: TopAbs_ShapeEnum
aShapeClassifier: TopOpeBRepTool_ShapeClassifier
aMapOfShapeWithState: NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeWithState, TopTools_ShapeMapHasher>
anUnkStateShapes: TopTools_MapOfShape

Return
-------
None

Description
-----------
No available documentation.
") PropagateState;
		static void PropagateState(const NCollection_DataMap<TopoDS_Shape, TopAbs_State, TopTools_ShapeMapHasher> & aSplEdgesState, const TopTools_IndexedMapOfShape & anEdgesToRestMap, const TopAbs_ShapeEnum aShapeEnum1, const TopAbs_ShapeEnum aShapeEnum2, TopOpeBRepTool_ShapeClassifier & aShapeClassifier, NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeWithState, TopTools_ShapeMapHasher> & aMapOfShapeWithState, const TopTools_MapOfShape & anUnkStateShapes);

		/****** TopOpeBRepBuild_Tools::PropagateStateForWires ******/
		/****** md5 signature: 7a73840f9fa14375d652dbb72f6a65e4 ******/
		%feature("compactdefaultargs") PropagateStateForWires;
		%feature("autodoc", "
Parameters
----------
aFacesToRestMap: TopTools_IndexedMapOfShape
aMapOfShapeWithState: NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeWithState, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") PropagateStateForWires;
		static void PropagateStateForWires(const TopTools_IndexedMapOfShape & aFacesToRestMap, NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeWithState, TopTools_ShapeMapHasher> & aMapOfShapeWithState);

		/****** TopOpeBRepBuild_Tools::SpreadStateToChild ******/
		/****** md5 signature: be25d10d574a60ecca3b6d6afef282e2 ******/
		%feature("compactdefaultargs") SpreadStateToChild;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aState: TopAbs_State
aMapOfShapeWithState: NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeWithState, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") SpreadStateToChild;
		static void SpreadStateToChild(const TopoDS_Shape & aShape, const TopAbs_State aState, NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeWithState, TopTools_ShapeMapHasher> & aMapOfShapeWithState);

		/****** TopOpeBRepBuild_Tools::UpdateEdgeOnFace ******/
		/****** md5 signature: 0d1af09a3eb8715da0da9ee1af537b49 ******/
		%feature("compactdefaultargs") UpdateEdgeOnFace;
		%feature("autodoc", "
Parameters
----------
aEdgeToUpdate: TopoDS_Edge
OldFace: TopoDS_Face
NewFace: TopoDS_Face

Return
-------
None

Description
-----------
Recompute PCurve of the edge on the NewFace.
") UpdateEdgeOnFace;
		static void UpdateEdgeOnFace(const TopoDS_Edge & aEdgeToUpdate, const TopoDS_Face & OldFace, const TopoDS_Face & NewFace);

		/****** TopOpeBRepBuild_Tools::UpdateEdgeOnPeriodicalFace ******/
		/****** md5 signature: 6c25f82fec61a156498f3a8500a373bb ******/
		%feature("compactdefaultargs") UpdateEdgeOnPeriodicalFace;
		%feature("autodoc", "
Parameters
----------
aEdgeToUpdate: TopoDS_Edge
OldFace: TopoDS_Face
NewFace: TopoDS_Face

Return
-------
None

Description
-----------
Recompute PCurves of the closing (SIM, with 2 PCurves) edge on the NewFace.
") UpdateEdgeOnPeriodicalFace;
		static void UpdateEdgeOnPeriodicalFace(const TopoDS_Edge & aEdgeToUpdate, const TopoDS_Face & OldFace, const TopoDS_Face & NewFace);

		/****** TopOpeBRepBuild_Tools::UpdatePCurves ******/
		/****** md5 signature: c92765c6ba973440b52c80b79faeb463 ******/
		%feature("compactdefaultargs") UpdatePCurves;
		%feature("autodoc", "
Parameters
----------
aWire: TopoDS_Wire
fromFace: TopoDS_Face
toFace: TopoDS_Face

Return
-------
None

Description
-----------
Recompute PCurves of the all edges from the wire on the <toFace>.
") UpdatePCurves;
		static void UpdatePCurves(const TopoDS_Wire & aWire, const TopoDS_Face & fromFace, const TopoDS_Face & toFace);

};


%extend TopOpeBRepBuild_Tools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TopOpeBRepBuild_Tools2d *
********************************/
class TopOpeBRepBuild_Tools2d {
	public:
		/****** TopOpeBRepBuild_Tools2d::DumpMapOfShapeVertexInfo ******/
		/****** md5 signature: e17851642a601726f636668627c643ad ******/
		%feature("compactdefaultargs") DumpMapOfShapeVertexInfo;
		%feature("autodoc", "
Parameters
----------
aMap: NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepBuild_VertexInfo, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") DumpMapOfShapeVertexInfo;
		static void DumpMapOfShapeVertexInfo(const NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepBuild_VertexInfo, TopTools_ShapeMapHasher> & aMap);

		/****** TopOpeBRepBuild_Tools2d::MakeMapOfShapeVertexInfo ******/
		/****** md5 signature: 3f4d7c8a3b9f0f6b9c6d53aa77883cd8 ******/
		%feature("compactdefaultargs") MakeMapOfShapeVertexInfo;
		%feature("autodoc", "
Parameters
----------
aWire: TopoDS_Wire
aMap: NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepBuild_VertexInfo, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") MakeMapOfShapeVertexInfo;
		static void MakeMapOfShapeVertexInfo(const TopoDS_Wire & aWire, NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepBuild_VertexInfo, TopTools_ShapeMapHasher> & aMap);

		/****** TopOpeBRepBuild_Tools2d::Path ******/
		/****** md5 signature: a749385e2d7fb0c5f96ca4a2e2ce783b ******/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "
Parameters
----------
aWire: TopoDS_Wire
aResList: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") Path;
		static void Path(const TopoDS_Wire & aWire, TopTools_ListOfShape & aResList);

};


%extend TopOpeBRepBuild_Tools2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TopOpeBRepBuild_VertexInfo *
***********************************/
class TopOpeBRepBuild_VertexInfo {
	public:
		/****** TopOpeBRepBuild_VertexInfo::TopOpeBRepBuild_VertexInfo ******/
		/****** md5 signature: 6d829d36a8c3188d3f1c482facaeea18 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_VertexInfo;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_VertexInfo;
		 TopOpeBRepBuild_VertexInfo();

		/****** TopOpeBRepBuild_VertexInfo::AddIn ******/
		/****** md5 signature: 58d2a5f6a6c93b0f15849308d23b58ba ******/
		%feature("compactdefaultargs") AddIn;
		%feature("autodoc", "
Parameters
----------
anE: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") AddIn;
		void AddIn(const TopoDS_Edge & anE);

		/****** TopOpeBRepBuild_VertexInfo::AddOut ******/
		/****** md5 signature: b5f9d9dc93f658df1834881b676295d6 ******/
		%feature("compactdefaultargs") AddOut;
		%feature("autodoc", "
Parameters
----------
anE: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") AddOut;
		void AddOut(const TopoDS_Edge & anE);

		/****** TopOpeBRepBuild_VertexInfo::AppendPassed ******/
		/****** md5 signature: dd48d2302d507ad9e8db9e351286fc22 ******/
		%feature("compactdefaultargs") AppendPassed;
		%feature("autodoc", "
Parameters
----------
anE: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") AppendPassed;
		void AppendPassed(const TopoDS_Edge & anE);

		/****** TopOpeBRepBuild_VertexInfo::ChangeEdgesOut ******/
		/****** md5 signature: b0f51d4b5bccafbe61393919b8c349e7 ******/
		%feature("compactdefaultargs") ChangeEdgesOut;
		%feature("autodoc", "Return
-------
TopTools_IndexedMapOfOrientedShape

Description
-----------
No available documentation.
") ChangeEdgesOut;
		TopTools_IndexedMapOfOrientedShape & ChangeEdgesOut();

		/****** TopOpeBRepBuild_VertexInfo::CurrentOut ******/
		/****** md5 signature: a060894e8825e40a1faca922a5ca0772 ******/
		%feature("compactdefaultargs") CurrentOut;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") CurrentOut;
		const TopoDS_Edge CurrentOut();

		/****** TopOpeBRepBuild_VertexInfo::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** TopOpeBRepBuild_VertexInfo::EdgesIn ******/
		/****** md5 signature: d7957d65971892e7449e4387a97ff8df ******/
		%feature("compactdefaultargs") EdgesIn;
		%feature("autodoc", "Return
-------
TopTools_IndexedMapOfOrientedShape

Description
-----------
No available documentation.
") EdgesIn;
		const TopTools_IndexedMapOfOrientedShape & EdgesIn();

		/****** TopOpeBRepBuild_VertexInfo::EdgesOut ******/
		/****** md5 signature: 10364abf525dfd7c3568b9e6e4fe498a ******/
		%feature("compactdefaultargs") EdgesOut;
		%feature("autodoc", "Return
-------
TopTools_IndexedMapOfOrientedShape

Description
-----------
No available documentation.
") EdgesOut;
		const TopTools_IndexedMapOfOrientedShape & EdgesOut();

		/****** TopOpeBRepBuild_VertexInfo::FoundOut ******/
		/****** md5 signature: c983fed976888782585426bad9809194 ******/
		%feature("compactdefaultargs") FoundOut;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FoundOut;
		int FoundOut();

		/****** TopOpeBRepBuild_VertexInfo::ListPassed ******/
		/****** md5 signature: dbe91a313833122c2f4a0cb637ab7f0c ******/
		%feature("compactdefaultargs") ListPassed;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") ListPassed;
		const TopTools_ListOfShape & ListPassed();

		/****** TopOpeBRepBuild_VertexInfo::NbCases ******/
		/****** md5 signature: 5884266ea4876b23782561f076e4c977 ******/
		%feature("compactdefaultargs") NbCases;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCases;
		int NbCases();

		/****** TopOpeBRepBuild_VertexInfo::Prepare ******/
		/****** md5 signature: 5d46b755acb18d7183c890e82cb23ab2 ******/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "
Parameters
----------
aL: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") Prepare;
		void Prepare(const TopTools_ListOfShape & aL);

		/****** TopOpeBRepBuild_VertexInfo::RemovePassed ******/
		/****** md5 signature: 795e0b26ead769e8637abe035a752173 ******/
		%feature("compactdefaultargs") RemovePassed;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") RemovePassed;
		void RemovePassed();

		/****** TopOpeBRepBuild_VertexInfo::SetCurrentIn ******/
		/****** md5 signature: 7ac4b279b190ff7e1f3e357517e715ef ******/
		%feature("compactdefaultargs") SetCurrentIn;
		%feature("autodoc", "
Parameters
----------
anE: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") SetCurrentIn;
		void SetCurrentIn(const TopoDS_Edge & anE);

		/****** TopOpeBRepBuild_VertexInfo::SetSmart ******/
		/****** md5 signature: 13019e0d6ed5550458bb4d963c88f435 ******/
		%feature("compactdefaultargs") SetSmart;
		%feature("autodoc", "
Parameters
----------
aFlag: bool

Return
-------
None

Description
-----------
No available documentation.
") SetSmart;
		void SetSmart(const bool aFlag);

		/****** TopOpeBRepBuild_VertexInfo::SetVertex ******/
		/****** md5 signature: 9085895b4fbc0ab8ea8c037e0f93a293 ******/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "
Parameters
----------
aV: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") SetVertex;
		void SetVertex(const TopoDS_Vertex & aV);

		/****** TopOpeBRepBuild_VertexInfo::Smart ******/
		/****** md5 signature: df8750ae905ebfeb0e7df5f79d09f245 ******/
		%feature("compactdefaultargs") Smart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Smart;
		bool Smart();

		/****** TopOpeBRepBuild_VertexInfo::Vertex ******/
		/****** md5 signature: 84212ff79cd7d64cd0ebfa6f17214e90 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		const TopoDS_Vertex Vertex();

};


%extend TopOpeBRepBuild_VertexInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TopOpeBRepBuild_WireToFace *
***********************************/
class TopOpeBRepBuild_WireToFace {
	public:
		/****** TopOpeBRepBuild_WireToFace::TopOpeBRepBuild_WireToFace ******/
		/****** md5 signature: ff81b73db4e599d15a329ad93442f2c9 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_WireToFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_WireToFace;
		 TopOpeBRepBuild_WireToFace();

		/****** TopOpeBRepBuild_WireToFace::AddWire ******/
		/****** md5 signature: 1783c94be1e4c0421c48f950e049b792 ******/
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire

Return
-------
None

Description
-----------
No available documentation.
") AddWire;
		void AddWire(const TopoDS_Wire & W);

		/****** TopOpeBRepBuild_WireToFace::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****** TopOpeBRepBuild_WireToFace::MakeFaces ******/
		/****** md5 signature: d15917b34b9fc3878206667806c79bcf ******/
		%feature("compactdefaultargs") MakeFaces;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
LF: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") MakeFaces;
		void MakeFaces(const TopoDS_Face & F, TopTools_ListOfShape & LF);

};


%extend TopOpeBRepBuild_WireToFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class TopOpeBRepBuild_Area1dBuilder *
**************************************/
class TopOpeBRepBuild_Area1dBuilder : public TopOpeBRepBuild_AreaBuilder {
	public:
		/****** TopOpeBRepBuild_Area1dBuilder::TopOpeBRepBuild_Area1dBuilder ******/
		/****** md5 signature: a5bea6ca7fd1232b130e6a0e8c89865e ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area1dBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_Area1dBuilder;
		 TopOpeBRepBuild_Area1dBuilder();

		/****** TopOpeBRepBuild_Area1dBuilder::TopOpeBRepBuild_Area1dBuilder ******/
		/****** md5 signature: f5640f8d28c63ddd910551f2fb4de420 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area1dBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_PaveSet
LC: TopOpeBRepBuild_PaveClassifier
ForceClass: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates a Area1dBuilder to find the areas of the shapes described by <LS> using the classifier <LC>.
") TopOpeBRepBuild_Area1dBuilder;
		 TopOpeBRepBuild_Area1dBuilder(TopOpeBRepBuild_PaveSet & LS, TopOpeBRepBuild_PaveClassifier & LC, const bool ForceClass = false);

		/****** TopOpeBRepBuild_Area1dBuilder::ADD_LISTOFLoop_TO_LISTOFLoop ******/
		/****** md5 signature: e68661bc2bff622807b3febb8bc64421 ******/
		%feature("compactdefaultargs") ADD_LISTOFLoop_TO_LISTOFLoop;
		%feature("autodoc", "
Parameters
----------
LOL1: TopOpeBRepBuild_Loop
LOL2: TopOpeBRepBuild_Loop
s: void * (optional, default to nullptr)
s1: void * (optional, default to nullptr)
s2: void * (optional, default to nullptr)

Return
-------
None

Description
-----------
No available documentation.
") ADD_LISTOFLoop_TO_LISTOFLoop;
		void ADD_LISTOFLoop_TO_LISTOFLoop(NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>> & LOL1, NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>> & LOL2, void * const s = nullptr, void * const s1 = nullptr, void * const s2 = nullptr);

		/****** TopOpeBRepBuild_Area1dBuilder::ADD_Loop_TO_LISTOFLoop ******/
		/****** md5 signature: 8771fc8132f0f06fca6e7b34d59348c2 ******/
		%feature("compactdefaultargs") ADD_Loop_TO_LISTOFLoop;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepBuild_Loop
LOL: TopOpeBRepBuild_Loop
s: void * (optional, default to nullptr)

Return
-------
None

Description
-----------
No available documentation.
") ADD_Loop_TO_LISTOFLoop;
		void ADD_Loop_TO_LISTOFLoop(const opencascade::handle<TopOpeBRepBuild_Loop> & L, NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>> & LOL, void * const s = nullptr);

		/****** TopOpeBRepBuild_Area1dBuilder::DumpList ******/
		/****** md5 signature: 5ee29eb0a17d3c125e2ace08acc23a1c ******/
		%feature("compactdefaultargs") DumpList;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepBuild_Loop

Return
-------
None

Description
-----------
No available documentation.
") DumpList;
		static void DumpList(const NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>> & L);

		/****** TopOpeBRepBuild_Area1dBuilder::InitAreaBuilder ******/
		/****** md5 signature: 7213ff5fa0be3b9010f85732fa6a77f2 ******/
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to false)

Return
-------
None

Description
-----------
Sets a Area1dBuilder to find the areas of the shapes described by <LS> using the classifier <LC>.
") InitAreaBuilder;
		void InitAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const bool ForceClass = false);

		/****** TopOpeBRepBuild_Area1dBuilder::REM_Loop_FROM_LISTOFLoop ******/
		/****** md5 signature: 04517bd4e0ae5be078e0f72d70b9d564 ******/
		%feature("compactdefaultargs") REM_Loop_FROM_LISTOFLoop;
		%feature("autodoc", "
Parameters
----------
ITLOL: TopOpeBRepBuild_Loop
LOL: TopOpeBRepBuild_Loop
s: void * (optional, default to nullptr)

Return
-------
None

Description
-----------
No available documentation.
") REM_Loop_FROM_LISTOFLoop;
		void REM_Loop_FROM_LISTOFLoop(NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>>::Iterator & ITLOL, NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>> & LOL, void * const s = nullptr);

};


%extend TopOpeBRepBuild_Area1dBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class TopOpeBRepBuild_Area2dBuilder *
**************************************/
class TopOpeBRepBuild_Area2dBuilder : public TopOpeBRepBuild_AreaBuilder {
	public:
		/****** TopOpeBRepBuild_Area2dBuilder::TopOpeBRepBuild_Area2dBuilder ******/
		/****** md5 signature: ea96eca58adabb983d09a1a1b6091ff6 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area2dBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_Area2dBuilder;
		 TopOpeBRepBuild_Area2dBuilder();

		/****** TopOpeBRepBuild_Area2dBuilder::TopOpeBRepBuild_Area2dBuilder ******/
		/****** md5 signature: 9527f71f53a1a3016f59fd5a45412a65 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area2dBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates a Area2dBuilder to build faces on the (wires,blocks of edge) of <LS>, using the classifier <LC>.
") TopOpeBRepBuild_Area2dBuilder;
		 TopOpeBRepBuild_Area2dBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const bool ForceClass = false);

		/****** TopOpeBRepBuild_Area2dBuilder::InitAreaBuilder ******/
		/****** md5 signature: 7213ff5fa0be3b9010f85732fa6a77f2 ******/
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to false)

Return
-------
None

Description
-----------
Sets a Area1dBuilder to find the areas of the shapes described by <LS> using the classifier <LC>.
") InitAreaBuilder;
		void InitAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const bool ForceClass = false);

};


%extend TopOpeBRepBuild_Area2dBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class TopOpeBRepBuild_Area3dBuilder *
**************************************/
class TopOpeBRepBuild_Area3dBuilder : public TopOpeBRepBuild_AreaBuilder {
	public:
		/****** TopOpeBRepBuild_Area3dBuilder::TopOpeBRepBuild_Area3dBuilder ******/
		/****** md5 signature: 5d760883cbd8eb32bf26b3c6359d9b77 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area3dBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_Area3dBuilder;
		 TopOpeBRepBuild_Area3dBuilder();

		/****** TopOpeBRepBuild_Area3dBuilder::TopOpeBRepBuild_Area3dBuilder ******/
		/****** md5 signature: d05214ff2fe4b1a34ecf8e7e7b010fd3 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area3dBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates a Area3dBuilder to build Solids on the (shells,blocks of face) of <LS>, using the classifier <LC>.
") TopOpeBRepBuild_Area3dBuilder;
		 TopOpeBRepBuild_Area3dBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const bool ForceClass = false);

		/****** TopOpeBRepBuild_Area3dBuilder::InitAreaBuilder ******/
		/****** md5 signature: 7213ff5fa0be3b9010f85732fa6a77f2 ******/
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to false)

Return
-------
None

Description
-----------
Sets a Area1dBuilder to find the areas of the shapes described by <LS> using the classifier <LC>.
") InitAreaBuilder;
		void InitAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const bool ForceClass = false);

};


%extend TopOpeBRepBuild_Area3dBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopOpeBRepBuild_Builder1 *
*********************************/
class TopOpeBRepBuild_Builder1 : public TopOpeBRepBuild_Builder {
	public:
		/****** TopOpeBRepBuild_Builder1::TopOpeBRepBuild_Builder1 ******/
		/****** md5 signature: 9c7f5fbdcb561a7101894ec06354919b ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_Builder1;
		%feature("autodoc", "
Parameters
----------
BT: TopOpeBRepDS_BuildTool

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_Builder1;
		 TopOpeBRepBuild_Builder1(const TopOpeBRepDS_BuildTool & BT);

		/****** TopOpeBRepBuild_Builder1::Clear ******/
		/****** md5 signature: 1c0d2ab59d0f6282725648dcdf130adb ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all splits and merges already performed. Does NOT clear the handled DS (except ShapeWithStatesMaps).
") Clear;
		void Clear();

		/****** TopOpeBRepBuild_Builder1::CorrectResult2d ******/
		/****** md5 signature: 9e93f1062f85453c2ced638b386213be ******/
		%feature("compactdefaultargs") CorrectResult2d;
		%feature("autodoc", "
Parameters
----------
aResult: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") CorrectResult2d;
		int CorrectResult2d(TopoDS_Shape & aResult);

		/****** TopOpeBRepBuild_Builder1::GFillEdgeNotSameDomWES ******/
		/****** md5 signature: 87abcfc0efcf110e1d5b0a3940389f91 ******/
		%feature("compactdefaultargs") GFillEdgeNotSameDomWES;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") GFillEdgeNotSameDomWES;
		void GFillEdgeNotSameDomWES(const TopoDS_Shape & E1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****** TopOpeBRepBuild_Builder1::GFillEdgeSameDomWES ******/
		/****** md5 signature: c9446c5f1279566800454fb3f030aede ******/
		%feature("compactdefaultargs") GFillEdgeSameDomWES;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") GFillEdgeSameDomWES;
		void GFillEdgeSameDomWES(const TopoDS_Shape & E1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****** TopOpeBRepBuild_Builder1::GFillFaceNotSameDomSFS ******/
		/****** md5 signature: ac54cbec91b623ff179acf76124729f9 ******/
		%feature("compactdefaultargs") GFillFaceNotSameDomSFS;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Return
-------
None

Description
-----------
No available documentation.
") GFillFaceNotSameDomSFS;
		void GFillFaceNotSameDomSFS(const TopoDS_Shape & F1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****** TopOpeBRepBuild_Builder1::GFillFaceNotSameDomWES ******/
		/****** md5 signature: dcb782ae6feb2b109d86970016c539f7 ******/
		%feature("compactdefaultargs") GFillFaceNotSameDomWES;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") GFillFaceNotSameDomWES;
		void GFillFaceNotSameDomWES(const TopoDS_Shape & F1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****** TopOpeBRepBuild_Builder1::GFillFaceSameDomSFS ******/
		/****** md5 signature: 7c92214b5dc8e94c903100461e4e6353 ******/
		%feature("compactdefaultargs") GFillFaceSameDomSFS;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Return
-------
None

Description
-----------
No available documentation.
") GFillFaceSameDomSFS;
		void GFillFaceSameDomSFS(const TopoDS_Shape & F1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****** TopOpeBRepBuild_Builder1::GFillFaceSameDomWES ******/
		/****** md5 signature: 284793ec0188251a245e053d0091d5bb ******/
		%feature("compactdefaultargs") GFillFaceSameDomWES;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") GFillFaceSameDomWES;
		void GFillFaceSameDomWES(const TopoDS_Shape & F1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****** TopOpeBRepBuild_Builder1::GFillShellSFS ******/
		/****** md5 signature: 433b4d7165470afecce45b1fd42a1250 ******/
		%feature("compactdefaultargs") GFillShellSFS;
		%feature("autodoc", "
Parameters
----------
SH1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Return
-------
None

Description
-----------
No available documentation.
") GFillShellSFS;
		void GFillShellSFS(const TopoDS_Shape & SH1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****** TopOpeBRepBuild_Builder1::GFillSolidSFS ******/
		/****** md5 signature: 344ea37bed5584cb8ecdd9ab830c817f ******/
		%feature("compactdefaultargs") GFillSolidSFS;
		%feature("autodoc", "
Parameters
----------
SO1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Return
-------
None

Description
-----------
No available documentation.
") GFillSolidSFS;
		void GFillSolidSFS(const TopoDS_Shape & SO1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****** TopOpeBRepBuild_Builder1::GFillWireNotSameDomWES ******/
		/****** md5 signature: 816a5ced4fd51a63ef5e309179ccd366 ******/
		%feature("compactdefaultargs") GFillWireNotSameDomWES;
		%feature("autodoc", "
Parameters
----------
W1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") GFillWireNotSameDomWES;
		void GFillWireNotSameDomWES(const TopoDS_Shape & W1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****** TopOpeBRepBuild_Builder1::GFillWireSameDomWES ******/
		/****** md5 signature: e04c6124e6a3262f99b7c97245c83809 ******/
		%feature("compactdefaultargs") GFillWireSameDomWES;
		%feature("autodoc", "
Parameters
----------
W1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") GFillWireSameDomWES;
		void GFillWireSameDomWES(const TopoDS_Shape & W1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****** TopOpeBRepBuild_Builder1::GWESMakeFaces ******/
		/****** md5 signature: be072ac7e1c2adf17f6f714012183b88 ******/
		%feature("compactdefaultargs") GWESMakeFaces;
		%feature("autodoc", "
Parameters
----------
FF: TopoDS_Shape
WES: TopOpeBRepBuild_WireEdgeSet
LOF: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") GWESMakeFaces;
		void GWESMakeFaces(const TopoDS_Shape & FF, TopOpeBRepBuild_WireEdgeSet & WES, TopTools_ListOfShape & LOF);

		/****** TopOpeBRepBuild_Builder1::MergeKPart ******/
		/****** md5 signature: 37ebddf29308e95bf109b4c48de75491 ******/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MergeKPart;
		void MergeKPart();

		/****** TopOpeBRepBuild_Builder1::MergeKPart ******/
		/****** md5 signature: ee1f2ac543860ba470366f47678f2eb6 ******/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", "
Parameters
----------
TB1: TopAbs_State
TB2: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") MergeKPart;
		void MergeKPart(const TopAbs_State TB1, const TopAbs_State TB2);

		/****** TopOpeBRepBuild_Builder1::Perform ******/
		/****** md5 signature: 87c6cefe67bc5be42d9d84ef2f8c255e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****** TopOpeBRepBuild_Builder1::Perform ******/
		/****** md5 signature: f973cd996d1a2f74455d09987f67b74c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** TopOpeBRepBuild_Builder1::PerformONParts ******/
		/****** md5 signature: 029b4607ddef58404a63c1cf690fdf78 ******/
		%feature("compactdefaultargs") PerformONParts;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
SDfaces: TopTools_IndexedMapOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Return
-------
None

Description
-----------
No available documentation.
") PerformONParts;
		void PerformONParts(const TopoDS_Shape & F, const TopTools_IndexedMapOfShape & SDfaces, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****** TopOpeBRepBuild_Builder1::PerformPieceIn2D ******/
		/****** md5 signature: 891921666bc5466271471950740614d8 ******/
		%feature("compactdefaultargs") PerformPieceIn2D;
		%feature("autodoc", "
Parameters
----------
aPieceToPerform: TopoDS_Edge
aOriginalEdge: TopoDS_Edge
edgeFace: TopoDS_Face
toFace: TopoDS_Face
G: TopOpeBRepBuild_GTopo

Return
-------
keep: bool

Description
-----------
No available documentation.
") PerformPieceIn2D;
		void PerformPieceIn2D(const TopoDS_Edge & aPieceToPerform, const TopoDS_Edge & aOriginalEdge, const TopoDS_Face & edgeFace, const TopoDS_Face & toFace, const TopOpeBRepBuild_GTopo & G, Standard_Boolean &OutValue);

		/****** TopOpeBRepBuild_Builder1::PerformPieceOn2D ******/
		/****** md5 signature: a1b000589ded4a1d352f75f2de41d998 ******/
		%feature("compactdefaultargs") PerformPieceOn2D;
		%feature("autodoc", "
Parameters
----------
aPieceObj: TopoDS_Shape
aFaceObj: TopoDS_Shape
aEdgeObj: TopoDS_Shape
aListOfPieces: TopTools_ListOfShape
aListOfFaces: TopTools_ListOfShape
aListOfPiecesOut2d: TopTools_ListOfShape

Return
-------
int

Description
-----------
No available documentation.
") PerformPieceOn2D;
		int PerformPieceOn2D(const TopoDS_Shape & aPieceObj, const TopoDS_Shape & aFaceObj, const TopoDS_Shape & aEdgeObj, TopTools_ListOfShape & aListOfPieces, TopTools_ListOfShape & aListOfFaces, TopTools_ListOfShape & aListOfPiecesOut2d);

		/****** TopOpeBRepBuild_Builder1::TwoPiecesON ******/
		/****** md5 signature: 2a41e4db21938d2b8ce4d49e049293bc ******/
		%feature("compactdefaultargs") TwoPiecesON;
		%feature("autodoc", "
Parameters
----------
aSeq: TopTools_SequenceOfShape
aListOfPieces: TopTools_ListOfShape
aListOfFaces: TopTools_ListOfShape
aListOfPiecesOut2d: TopTools_ListOfShape

Return
-------
int

Description
-----------
No available documentation.
") TwoPiecesON;
		int TwoPiecesON(const TopTools_SequenceOfShape & aSeq, TopTools_ListOfShape & aListOfPieces, TopTools_ListOfShape & aListOfFaces, TopTools_ListOfShape & aListOfPiecesOut2d);

};


%extend TopOpeBRepBuild_Builder1 {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def GFillSplitsPVS(self):
		pass
	}
};

/********************************************
* class TopOpeBRepBuild_CompositeClassifier *
********************************************/
%nodefaultctor TopOpeBRepBuild_CompositeClassifier;
class TopOpeBRepBuild_CompositeClassifier : public TopOpeBRepBuild_LoopClassifier {
	public:
		/****** TopOpeBRepBuild_CompositeClassifier::Compare ******/
		/****** md5 signature: 0913c23095e6757cd112f945bf759079 ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
L1: TopOpeBRepBuild_Loop
L2: TopOpeBRepBuild_Loop

Return
-------
TopAbs_State

Description
-----------
No available documentation.
") Compare;
		TopAbs_State Compare(const opencascade::handle<TopOpeBRepBuild_Loop> & L1, const opencascade::handle<TopOpeBRepBuild_Loop> & L2);

		/****** TopOpeBRepBuild_CompositeClassifier::CompareElement ******/
		/****** md5 signature: 5a3755e0b9123b52d6fa14bcc8cf1545 ******/
		%feature("compactdefaultargs") CompareElement;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape

Return
-------
bool

Description
-----------
Add element <E> in the set of elements used in classification. Returns False if the element <E> has been already added to the set of elements, otherwise returns True.
") CompareElement;
		virtual bool CompareElement(const TopoDS_Shape & E);

		/****** TopOpeBRepBuild_CompositeClassifier::CompareElementToShape ******/
		/****** md5 signature: bd5d7b75f82d8019008ec5c9aa72c3f6 ******/
		%feature("compactdefaultargs") CompareElementToShape;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
B: TopoDS_Shape

Return
-------
TopAbs_State

Description
-----------
classify element <E> with shape <B>.
") CompareElementToShape;
		virtual TopAbs_State CompareElementToShape(const TopoDS_Shape & E, const TopoDS_Shape & B);

		/****** TopOpeBRepBuild_CompositeClassifier::CompareShapes ******/
		/****** md5 signature: e01f02a4a0658a2496d401f4677136a6 ******/
		%feature("compactdefaultargs") CompareShapes;
		%feature("autodoc", "
Parameters
----------
B1: TopoDS_Shape
B2: TopoDS_Shape

Return
-------
TopAbs_State

Description
-----------
classify shape <B1> with shape <B2>.
") CompareShapes;
		virtual TopAbs_State CompareShapes(const TopoDS_Shape & B1, const TopoDS_Shape & B2);

		/****** TopOpeBRepBuild_CompositeClassifier::ResetElement ******/
		/****** md5 signature: 25fb7988cef7fe4a96b1786bfe86e03d ******/
		%feature("compactdefaultargs") ResetElement;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape

Return
-------
None

Description
-----------
prepare classification involving element <E>.
") ResetElement;
		virtual void ResetElement(const TopoDS_Shape & E);

		/****** TopOpeBRepBuild_CompositeClassifier::ResetShape ******/
		/****** md5 signature: 2ee1a95aba4e9d5590b7812827dd463b ******/
		%feature("compactdefaultargs") ResetShape;
		%feature("autodoc", "
Parameters
----------
B: TopoDS_Shape

Return
-------
None

Description
-----------
prepare classification involving shape <B> calls ResetElement on first element of <B>.
") ResetShape;
		virtual void ResetShape(const TopoDS_Shape & B);

		/****** TopOpeBRepBuild_CompositeClassifier::State ******/
		/****** md5 signature: 0604ca1bab9b663cd8e4e1804e67747c ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns state of classification of 2D point, defined by ResetElement, with the current set of elements, defined by Compare.
") State;
		virtual TopAbs_State State();

};


%extend TopOpeBRepBuild_CompositeClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopOpeBRepBuild_Pave *
*****************************/
class TopOpeBRepBuild_Pave : public TopOpeBRepBuild_Loop {
	public:
		/****** TopOpeBRepBuild_Pave::TopOpeBRepBuild_Pave ******/
		/****** md5 signature: 671e6dbe935aa5b2545f7209359fe6d6 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_Pave;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Shape
P: double
bound: bool

Return
-------
None

Description
-----------
V = vertex, P = parameter of vertex <V> bound = True if <V> is an old vertex bound = False if <V> is a new vertex.
") TopOpeBRepBuild_Pave;
		 TopOpeBRepBuild_Pave(const TopoDS_Shape & V, const double P, const bool bound);

		/****** TopOpeBRepBuild_Pave::ChangeVertex ******/
		/****** md5 signature: 118bc92b60bb2a4e67149d3849444bf0 ******/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ChangeVertex;
		TopoDS_Shape ChangeVertex();

		/****** TopOpeBRepBuild_Pave::Dump ******/
		/****** md5 signature: 1e8267eb1be0e9cb1f766e2160451c4e ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** TopOpeBRepBuild_Pave::HasSameDomain ******/
		/****** md5 signature: 1c0c17dd4966f91f9faf956e25a364d8 ******/
		%feature("compactdefaultargs") HasSameDomain;
		%feature("autodoc", "
Parameters
----------
b: bool

Return
-------
None

Description
-----------
No available documentation.
") HasSameDomain;
		void HasSameDomain(const bool b);

		/****** TopOpeBRepBuild_Pave::HasSameDomain ******/
		/****** md5 signature: 1487b788f10ee8bd04e490dc33a59105 ******/
		%feature("compactdefaultargs") HasSameDomain;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasSameDomain;
		bool HasSameDomain();

		/****** TopOpeBRepBuild_Pave::InterferenceType ******/
		/****** md5 signature: 6af8508bed73354b450a7f29fd330a6e ******/
		%feature("compactdefaultargs") InterferenceType;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Kind

Description
-----------
No available documentation.
") InterferenceType;
		TopOpeBRepDS_Kind & InterferenceType();

		/****** TopOpeBRepBuild_Pave::IsShape ******/
		/****** md5 signature: 9b1effbbb89f8789fd21f7cb548e8795 ******/
		%feature("compactdefaultargs") IsShape;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsShape;
		bool IsShape();

		/****** TopOpeBRepBuild_Pave::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter();

		/****** TopOpeBRepBuild_Pave::Parameter ******/
		/****** md5 signature: ce8855cc897e0a034c59ea8a5d9d7a11 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Par: double

Return
-------
None

Description
-----------
No available documentation.
") Parameter;
		void Parameter(const double Par);

		/****** TopOpeBRepBuild_Pave::SameDomain ******/
		/****** md5 signature: ad991614a675b8a392bd5bdce16986c6 ******/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "
Parameters
----------
VSD: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") SameDomain;
		void SameDomain(const TopoDS_Shape & VSD);

		/****** TopOpeBRepBuild_Pave::SameDomain ******/
		/****** md5 signature: 17401c88eae9f0306791fc40186b86f5 ******/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") SameDomain;
		const TopoDS_Shape SameDomain();

		/****** TopOpeBRepBuild_Pave::Shape ******/
		/****** md5 signature: 71e6d84d92e216ab483e94eb877d856e ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

		/****** TopOpeBRepBuild_Pave::Vertex ******/
		/****** md5 signature: 4b1334c642d4415d88330a5fa6216463 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Vertex;
		const TopoDS_Shape Vertex();

};


%make_alias(TopOpeBRepBuild_Pave)

%extend TopOpeBRepBuild_Pave {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class TopOpeBRepBuild_PaveClassifier *
***************************************/
class TopOpeBRepBuild_PaveClassifier : public TopOpeBRepBuild_LoopClassifier {
	public:
		/****** TopOpeBRepBuild_PaveClassifier::TopOpeBRepBuild_PaveClassifier ******/
		/****** md5 signature: 2fa7015d3f8cc0748010f7c2fbe91c47 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_PaveClassifier;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape

Return
-------
None

Description
-----------
Create a Pave classifier to compare vertices on edge <E>.
") TopOpeBRepBuild_PaveClassifier;
		 TopOpeBRepBuild_PaveClassifier(const TopoDS_Shape & E);

		/****** TopOpeBRepBuild_PaveClassifier::AdjustCase ******/
		/****** md5 signature: b400558b72ba81771162811225f1e423 ******/
		%feature("compactdefaultargs") AdjustCase;
		%feature("autodoc", "
Parameters
----------
p1: double
o: TopAbs_Orientation
first: double
period: double
tol: double

Return
-------
cas: int

Description
-----------
No available documentation.
") AdjustCase;
		static double AdjustCase(const double p1, const TopAbs_Orientation o, const double first, const double period, const double tol, Standard_Integer &OutValue);

		/****** TopOpeBRepBuild_PaveClassifier::ClosedVertices ******/
		/****** md5 signature: 8cf9686115ef0a08029a3a144d44a58e ******/
		%feature("compactdefaultargs") ClosedVertices;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") ClosedVertices;
		void ClosedVertices(const bool B);

		/****** TopOpeBRepBuild_PaveClassifier::Compare ******/
		/****** md5 signature: 0913c23095e6757cd112f945bf759079 ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
L1: TopOpeBRepBuild_Loop
L2: TopOpeBRepBuild_Loop

Return
-------
TopAbs_State

Description
-----------
Returns state of vertex <L1> compared with <L2>.
") Compare;
		TopAbs_State Compare(const opencascade::handle<TopOpeBRepBuild_Loop> & L1, const opencascade::handle<TopOpeBRepBuild_Loop> & L2);

		/****** TopOpeBRepBuild_PaveClassifier::SetFirstParameter ******/
		/****** md5 signature: 5ac66927cf172f47bbf2d29fddbfc969 ******/
		%feature("compactdefaultargs") SetFirstParameter;
		%feature("autodoc", "
Parameters
----------
P: double

Return
-------
None

Description
-----------
No available documentation.
") SetFirstParameter;
		void SetFirstParameter(const double P);

};


%extend TopOpeBRepBuild_PaveClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TopOpeBRepBuild_PaveSet *
********************************/
class TopOpeBRepBuild_PaveSet : public TopOpeBRepBuild_LoopSet {
	public:
		/****** TopOpeBRepBuild_PaveSet::TopOpeBRepBuild_PaveSet ******/
		/****** md5 signature: 67c1829eafba7278c461b400444c539f ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_PaveSet;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape

Return
-------
None

Description
-----------
Create a Pave set on edge <E>. It contains <E> vertices.
") TopOpeBRepBuild_PaveSet;
		 TopOpeBRepBuild_PaveSet(const TopoDS_Shape & E);

		/****** TopOpeBRepBuild_PaveSet::Append ******/
		/****** md5 signature: 413ba2c781bd7c21d7dc73f4f6e0519f ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
PV: TopOpeBRepBuild_Pave

Return
-------
None

Description
-----------
Add <PV> in the Pave set.
") Append;
		void Append(const opencascade::handle<TopOpeBRepBuild_Pave> & PV);

		/****** TopOpeBRepBuild_PaveSet::ClosedVertices ******/
		/****** md5 signature: aeed398fae83faae81a408c55989c339 ******/
		%feature("compactdefaultargs") ClosedVertices;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ClosedVertices;
		bool ClosedVertices();

		/****** TopOpeBRepBuild_PaveSet::Edge ******/
		/****** md5 signature: be590cff987799d8b7c28083399d0e9f ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") Edge;
		const TopoDS_Edge Edge();

		/****** TopOpeBRepBuild_PaveSet::EqualParameters ******/
		/****** md5 signature: c7c03bcd8e3d1589938049cea21f45bb ******/
		%feature("compactdefaultargs") EqualParameters;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") EqualParameters;
		double EqualParameters();

		/****** TopOpeBRepBuild_PaveSet::HasEqualParameters ******/
		/****** md5 signature: 9a16d47b798f01d3cc8b958ee18f5fc9 ******/
		%feature("compactdefaultargs") HasEqualParameters;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasEqualParameters;
		bool HasEqualParameters();

		/****** TopOpeBRepBuild_PaveSet::InitLoop ******/
		/****** md5 signature: 05749d31c6c0af0b3635495be7f7b61d ******/
		%feature("compactdefaultargs") InitLoop;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitLoop;
		void InitLoop();

		/****** TopOpeBRepBuild_PaveSet::Loop ******/
		/****** md5 signature: f3e21b30fe17905c8577c3b4fd3a59eb ******/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepBuild_Loop>

Description
-----------
No available documentation.
") Loop;
		opencascade::handle<TopOpeBRepBuild_Loop> Loop();

		/****** TopOpeBRepBuild_PaveSet::MoreLoop ******/
		/****** md5 signature: 696f33be6f5b5c5c212ffae17c40eaca ******/
		%feature("compactdefaultargs") MoreLoop;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreLoop;
		bool MoreLoop();

		/****** TopOpeBRepBuild_PaveSet::NextLoop ******/
		/****** md5 signature: 7ce7cc7a1cd593c4a8fc19ad6d548abc ******/
		%feature("compactdefaultargs") NextLoop;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextLoop;
		void NextLoop();

		/****** TopOpeBRepBuild_PaveSet::RemovePV ******/
		/****** md5 signature: 36d1cdcef53f2b2a242f8ad0f1daad2a ******/
		%feature("compactdefaultargs") RemovePV;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") RemovePV;
		void RemovePV(const bool B);

		/****** TopOpeBRepBuild_PaveSet::SortPave ******/
		/****** md5 signature: a9797ee80932abd43ab34321aa1f2059 ******/
		%feature("compactdefaultargs") SortPave;
		%feature("autodoc", "
Parameters
----------
Lin: TopOpeBRepBuild_Pave
Lout: TopOpeBRepBuild_Pave

Return
-------
None

Description
-----------
No available documentation.
") SortPave;
		static void SortPave(const NCollection_List<opencascade::handle<TopOpeBRepBuild_Pave>> & Lin, NCollection_List<opencascade::handle<TopOpeBRepBuild_Pave>> & Lout);

};


%extend TopOpeBRepBuild_PaveSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class TopOpeBRepBuild_ShellFaceSet *
*************************************/
class TopOpeBRepBuild_ShellFaceSet : public TopOpeBRepBuild_ShapeSet {
	public:
		/****** TopOpeBRepBuild_ShellFaceSet::TopOpeBRepBuild_ShellFaceSet ******/
		/****** md5 signature: 92cda05c597af841ee44572a0dc2e72c ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellFaceSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a ShellFaceSet to build blocks of faces connected by edges.
") TopOpeBRepBuild_ShellFaceSet;
		 TopOpeBRepBuild_ShellFaceSet();

		/****** TopOpeBRepBuild_ShellFaceSet::TopOpeBRepBuild_ShellFaceSet ******/
		/****** md5 signature: ecdb53523977fc9b1519df1760df2e0b ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellFaceSet;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Addr: void * (optional, default to nullptr)

Return
-------
None

Description
-----------
Creates a ShellFaceSet to build blocks of faces connected by edges.
") TopOpeBRepBuild_ShellFaceSet;
		 TopOpeBRepBuild_ShellFaceSet(const TopoDS_Shape & S, void * const Addr = nullptr);

		/****** TopOpeBRepBuild_ShellFaceSet::AddElement ******/
		/****** md5 signature: 4173e6749dc1d30d8928504c8fd2e3bf ******/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddElement;
		void AddElement(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_ShellFaceSet::AddShape ******/
		/****** md5 signature: d2d1a4c725fba5b08dcce08dbce9cd1b ******/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddShape;
		void AddShape(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_ShellFaceSet::AddStartElement ******/
		/****** md5 signature: 9812d6d256f4dddf0365139f56e912e8 ******/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddStartElement;
		void AddStartElement(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_ShellFaceSet::DumpSS ******/
		/****** md5 signature: 6b12b24c9d7c230330c420fe6dc3dcf4 ******/
		%feature("compactdefaultargs") DumpSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") DumpSS;
		void DumpSS();

		/****** TopOpeBRepBuild_ShellFaceSet::SName ******/
		/****** md5 signature: 88e13ce91de76e2556cb8f5d110c48af ******/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
sb: str (optional, default to "")
sa: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SName;
		TCollection_AsciiString SName(const TopoDS_Shape & S, TCollection_AsciiString sb = "", TCollection_AsciiString sa = "");

		/****** TopOpeBRepBuild_ShellFaceSet::SName ******/
		/****** md5 signature: 1b69a1e1c040b2482d2954472e6f1d93 ******/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "
Parameters
----------
S: TopTools_ListOfShape
sb: str (optional, default to "")
sa: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SName;
		TCollection_AsciiString SName(const TopTools_ListOfShape & S, TCollection_AsciiString sb = "", TCollection_AsciiString sa = "");

		/****** TopOpeBRepBuild_ShellFaceSet::SNameori ******/
		/****** md5 signature: 06a1fb89f0664aa913edd3cb9bdb96f0 ******/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
sb: str (optional, default to "")
sa: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SNameori;
		TCollection_AsciiString SNameori(const TopoDS_Shape & S, TCollection_AsciiString sb = "", TCollection_AsciiString sa = "");

		/****** TopOpeBRepBuild_ShellFaceSet::SNameori ******/
		/****** md5 signature: 40dc465fbb2c2088dbd7c4aeeb4f0bf7 ******/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "
Parameters
----------
S: TopTools_ListOfShape
sb: str (optional, default to "")
sa: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SNameori;
		TCollection_AsciiString SNameori(const TopTools_ListOfShape & S, TCollection_AsciiString sb = "", TCollection_AsciiString sa = "");

		/****** TopOpeBRepBuild_ShellFaceSet::Solid ******/
		/****** md5 signature: 0e70c03e20bb23e014ac5417ea4abe26 ******/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Return
-------
TopoDS_Solid

Description
-----------
No available documentation.
") Solid;
		const TopoDS_Solid Solid();

};


%extend TopOpeBRepBuild_ShellFaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TopOpeBRepBuild_WireEdgeSet *
************************************/
class TopOpeBRepBuild_WireEdgeSet : public TopOpeBRepBuild_ShapeSet {
	public:
		/****** TopOpeBRepBuild_WireEdgeSet::TopOpeBRepBuild_WireEdgeSet ******/
		/****** md5 signature: 3eab48c86e44ebbefe40c21e9812efa9 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_WireEdgeSet;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
Addr: void * (optional, default to nullptr)

Return
-------
None

Description
-----------
Creates a WireEdgeSet to build edges connected by vertices on face F. Edges of the WireEdgeSet must have a representation on surface of face F.
") TopOpeBRepBuild_WireEdgeSet;
		 TopOpeBRepBuild_WireEdgeSet(const TopoDS_Shape & F, void * const Addr = nullptr);

		/****** TopOpeBRepBuild_WireEdgeSet::AddElement ******/
		/****** md5 signature: 4173e6749dc1d30d8928504c8fd2e3bf ******/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddElement;
		void AddElement(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_WireEdgeSet::AddShape ******/
		/****** md5 signature: d2d1a4c725fba5b08dcce08dbce9cd1b ******/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddShape;
		void AddShape(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_WireEdgeSet::AddStartElement ******/
		/****** md5 signature: 9812d6d256f4dddf0365139f56e912e8 ******/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddStartElement;
		void AddStartElement(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_WireEdgeSet::DumpSS ******/
		/****** md5 signature: 6b12b24c9d7c230330c420fe6dc3dcf4 ******/
		%feature("compactdefaultargs") DumpSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") DumpSS;
		void DumpSS();

		/****** TopOpeBRepBuild_WireEdgeSet::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
value of field myFace.
") Face;
		const TopoDS_Face Face();

		/****** TopOpeBRepBuild_WireEdgeSet::FindNeighbours ******/
		/****** md5 signature: e16ca4df2298c21bc5d2a3de912e61c4 ******/
		%feature("compactdefaultargs") FindNeighbours;
		%feature("autodoc", "Return
-------
None

Description
-----------
Build the list of neighbour edges of edge myCurrentShape Initialize iterator of neighbour edges to edge myCurrentShape.
") FindNeighbours;
		void FindNeighbours();

		/****** TopOpeBRepBuild_WireEdgeSet::InitNeighbours ******/
		/****** md5 signature: 163b448e9e2319364dae9a593b864879 ******/
		%feature("compactdefaultargs") InitNeighbours;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") InitNeighbours;
		void InitNeighbours(const TopoDS_Shape & E);

		/****** TopOpeBRepBuild_WireEdgeSet::IsUVISO ******/
		/****** md5 signature: 139129f9a519b792ef0af9d8dd082e04 ******/
		%feature("compactdefaultargs") IsUVISO;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
uiso: bool
viso: bool

Description
-----------
No available documentation.
") IsUVISO;
		static void IsUVISO(const TopoDS_Edge & E, const TopoDS_Face & F, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** TopOpeBRepBuild_WireEdgeSet::MakeNeighboursList ******/
		/****** md5 signature: 81130c096d40dcebb1574255e33feb9d ******/
		%feature("compactdefaultargs") MakeNeighboursList;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
V: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") MakeNeighboursList;
		const TopTools_ListOfShape & MakeNeighboursList(const TopoDS_Shape & E, const TopoDS_Shape & V);

		/****** TopOpeBRepBuild_WireEdgeSet::SName ******/
		/****** md5 signature: 88e13ce91de76e2556cb8f5d110c48af ******/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
sb: str (optional, default to "")
sa: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SName;
		TCollection_AsciiString SName(const TopoDS_Shape & S, TCollection_AsciiString sb = "", TCollection_AsciiString sa = "");

		/****** TopOpeBRepBuild_WireEdgeSet::SName ******/
		/****** md5 signature: 1b69a1e1c040b2482d2954472e6f1d93 ******/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "
Parameters
----------
S: TopTools_ListOfShape
sb: str (optional, default to "")
sa: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SName;
		TCollection_AsciiString SName(const TopTools_ListOfShape & S, TCollection_AsciiString sb = "", TCollection_AsciiString sa = "");

		/****** TopOpeBRepBuild_WireEdgeSet::SNameori ******/
		/****** md5 signature: 06a1fb89f0664aa913edd3cb9bdb96f0 ******/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
sb: str (optional, default to "")
sa: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SNameori;
		TCollection_AsciiString SNameori(const TopoDS_Shape & S, TCollection_AsciiString sb = "", TCollection_AsciiString sa = "");

		/****** TopOpeBRepBuild_WireEdgeSet::SNameori ******/
		/****** md5 signature: 40dc465fbb2c2088dbd7c4aeeb4f0bf7 ******/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "
Parameters
----------
S: TopTools_ListOfShape
sb: str (optional, default to "")
sa: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SNameori;
		TCollection_AsciiString SNameori(const TopTools_ListOfShape & S, TCollection_AsciiString sb = "", TCollection_AsciiString sa = "");

};


%extend TopOpeBRepBuild_WireEdgeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TopOpeBRepBuild_EdgeBuilder *
************************************/
class TopOpeBRepBuild_EdgeBuilder : public TopOpeBRepBuild_Area1dBuilder {
	public:
		/****** TopOpeBRepBuild_EdgeBuilder::TopOpeBRepBuild_EdgeBuilder ******/
		/****** md5 signature: 22f83f657351f29dddea9f6c3508a926 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_EdgeBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_EdgeBuilder;
		 TopOpeBRepBuild_EdgeBuilder();

		/****** TopOpeBRepBuild_EdgeBuilder::TopOpeBRepBuild_EdgeBuilder ******/
		/****** md5 signature: e59a57c4fd27df384f3cc6afdb0322e9 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_EdgeBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_PaveSet
LC: TopOpeBRepBuild_PaveClassifier
ForceClass: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates a EdgeBuilder to find the areas of the shapes described by <LS> using the classifier <LC>.
") TopOpeBRepBuild_EdgeBuilder;
		 TopOpeBRepBuild_EdgeBuilder(TopOpeBRepBuild_PaveSet & LS, TopOpeBRepBuild_PaveClassifier & LC, const bool ForceClass = false);

		/****** TopOpeBRepBuild_EdgeBuilder::InitEdge ******/
		/****** md5 signature: 13e3d303d78cdf9134a0106c465fdb17 ******/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitEdge;
		void InitEdge();

		/****** TopOpeBRepBuild_EdgeBuilder::InitEdgeBuilder ******/
		/****** md5 signature: dae6c2bcd6fe201e2bba8961735b4b26 ******/
		%feature("compactdefaultargs") InitEdgeBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") InitEdgeBuilder;
		void InitEdgeBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const bool ForceClass = false);

		/****** TopOpeBRepBuild_EdgeBuilder::InitVertex ******/
		/****** md5 signature: 12fa7b14d7e7f4c6f0e753d97f3e91ab ******/
		%feature("compactdefaultargs") InitVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitVertex;
		void InitVertex();

		/****** TopOpeBRepBuild_EdgeBuilder::MoreEdge ******/
		/****** md5 signature: 6ad80ac0d66dad5013f4fe4cff20c934 ******/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreEdge;
		bool MoreEdge();

		/****** TopOpeBRepBuild_EdgeBuilder::MoreVertex ******/
		/****** md5 signature: 73bec1e3a9592b7ee376cebfedb62bcf ******/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreVertex;
		bool MoreVertex();

		/****** TopOpeBRepBuild_EdgeBuilder::NextEdge ******/
		/****** md5 signature: 8103c946a7f7c0a3d885514a8a740502 ******/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextEdge;
		void NextEdge();

		/****** TopOpeBRepBuild_EdgeBuilder::NextVertex ******/
		/****** md5 signature: c800122ce4f2c3bd5f52dba7f14e300c ******/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextVertex;
		void NextVertex();

		/****** TopOpeBRepBuild_EdgeBuilder::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter();

		/****** TopOpeBRepBuild_EdgeBuilder::Vertex ******/
		/****** md5 signature: 4b1334c642d4415d88330a5fa6216463 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Vertex;
		const TopoDS_Shape Vertex();

};


%extend TopOpeBRepBuild_EdgeBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class TopOpeBRepBuild_FaceAreaBuilder *
****************************************/
class TopOpeBRepBuild_FaceAreaBuilder : public TopOpeBRepBuild_Area2dBuilder {
	public:
		/****** TopOpeBRepBuild_FaceAreaBuilder::TopOpeBRepBuild_FaceAreaBuilder ******/
		/****** md5 signature: 57921e4ad2221036737f23a15d3756b2 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceAreaBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_FaceAreaBuilder;
		 TopOpeBRepBuild_FaceAreaBuilder();

		/****** TopOpeBRepBuild_FaceAreaBuilder::TopOpeBRepBuild_FaceAreaBuilder ******/
		/****** md5 signature: 2b716a87b0dcc847cfc6c51c10b19423 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceAreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates a FaceAreaBuilder to build faces on the (wires,blocks of edge) of <LS>, using the classifier <LC>.
") TopOpeBRepBuild_FaceAreaBuilder;
		 TopOpeBRepBuild_FaceAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const bool ForceClass = false);

		/****** TopOpeBRepBuild_FaceAreaBuilder::InitFaceAreaBuilder ******/
		/****** md5 signature: 01a334023aaaeda40b6ec5c34950cf9f ******/
		%feature("compactdefaultargs") InitFaceAreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") InitFaceAreaBuilder;
		void InitFaceAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const bool ForceClass = false);

};


%extend TopOpeBRepBuild_FaceAreaBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class TopOpeBRepBuild_ShellFaceClassifier *
********************************************/
class TopOpeBRepBuild_ShellFaceClassifier : public TopOpeBRepBuild_CompositeClassifier {
	public:
		/****** TopOpeBRepBuild_ShellFaceClassifier::TopOpeBRepBuild_ShellFaceClassifier ******/
		/****** md5 signature: 410539db715d7aeaed3803d1d3083d0e ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellFaceClassifier;
		%feature("autodoc", "
Parameters
----------
BB: TopOpeBRepBuild_BlockBuilder

Return
-------
None

Description
-----------
Creates a classifier in 3D space, to compare: a face with a set of faces a shell with a set of faces a shell with a shell.
") TopOpeBRepBuild_ShellFaceClassifier;
		 TopOpeBRepBuild_ShellFaceClassifier(const TopOpeBRepBuild_BlockBuilder & BB);

		/****** TopOpeBRepBuild_ShellFaceClassifier::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** TopOpeBRepBuild_ShellFaceClassifier::CompareElement ******/
		/****** md5 signature: 8c80a4bbfde0d686ea9b5de5135812c8 ******/
		%feature("compactdefaultargs") CompareElement;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
bool

Description
-----------
Add the face <F> in the set of faces used in 3D point classification. Returns False if the face <F> has been already added to the set of faces, otherwise returns True.
") CompareElement;
		bool CompareElement(const TopoDS_Shape & F);

		/****** TopOpeBRepBuild_ShellFaceClassifier::CompareElementToShape ******/
		/****** md5 signature: 0700a9c6f3bdd91c4c83451d84225d78 ******/
		%feature("compactdefaultargs") CompareElementToShape;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
S: TopoDS_Shape

Return
-------
TopAbs_State

Description
-----------
classify face <F> with shell <S>.
") CompareElementToShape;
		TopAbs_State CompareElementToShape(const TopoDS_Shape & F, const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_ShellFaceClassifier::CompareShapes ******/
		/****** md5 signature: b81b0a02c114db766004bad2e239ab69 ******/
		%feature("compactdefaultargs") CompareShapes;
		%feature("autodoc", "
Parameters
----------
B1: TopoDS_Shape
B2: TopoDS_Shape

Return
-------
TopAbs_State

Description
-----------
classify shell <B1> with shell <B2>.
") CompareShapes;
		TopAbs_State CompareShapes(const TopoDS_Shape & B1, const TopoDS_Shape & B2);

		/****** TopOpeBRepBuild_ShellFaceClassifier::ResetElement ******/
		/****** md5 signature: 38635a54b2d41a6b3509eee1b21f7bb7 ******/
		%feature("compactdefaultargs") ResetElement;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
None

Description
-----------
prepare classification involving face <F> define 3D point (later used in Compare()) on first vertex of face <F>.
") ResetElement;
		void ResetElement(const TopoDS_Shape & F);

		/****** TopOpeBRepBuild_ShellFaceClassifier::ResetShape ******/
		/****** md5 signature: c35b6684d1b1500ed0ef1e690886b6df ******/
		%feature("compactdefaultargs") ResetShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
prepare classification involving shell <S> calls ResetElement on first face of <S>.
") ResetShape;
		void ResetShape(const TopoDS_Shape & S);

		/****** TopOpeBRepBuild_ShellFaceClassifier::State ******/
		/****** md5 signature: 8d4e3a462b151f1591c5e1f3cee67ce9 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns state of classification of 3D point, defined by ResetElement, with the current set of faces, defined by Compare.
") State;
		TopAbs_State State();

};


%extend TopOpeBRepBuild_ShellFaceClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class TopOpeBRepBuild_SolidAreaBuilder *
*****************************************/
class TopOpeBRepBuild_SolidAreaBuilder : public TopOpeBRepBuild_Area3dBuilder {
	public:
		/****** TopOpeBRepBuild_SolidAreaBuilder::TopOpeBRepBuild_SolidAreaBuilder ******/
		/****** md5 signature: 3f30f33660bafa155aed9b75d3a4890f ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidAreaBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_SolidAreaBuilder;
		 TopOpeBRepBuild_SolidAreaBuilder();

		/****** TopOpeBRepBuild_SolidAreaBuilder::TopOpeBRepBuild_SolidAreaBuilder ******/
		/****** md5 signature: 305878ca9583a67bd958ca5867c0b348 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidAreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates a SolidAreaBuilder to build Solids on the (shells,blocks of face) of <LS>, using the classifier <LC>.
") TopOpeBRepBuild_SolidAreaBuilder;
		 TopOpeBRepBuild_SolidAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const bool ForceClass = false);

		/****** TopOpeBRepBuild_SolidAreaBuilder::InitSolidAreaBuilder ******/
		/****** md5 signature: 9df399889038c10e37958dc573d86f46 ******/
		%feature("compactdefaultargs") InitSolidAreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") InitSolidAreaBuilder;
		void InitSolidAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const bool ForceClass = false);

};


%extend TopOpeBRepBuild_SolidAreaBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class TopOpeBRepBuild_WireEdgeClassifier *
*******************************************/
class TopOpeBRepBuild_WireEdgeClassifier : public TopOpeBRepBuild_CompositeClassifier {
	public:
		/****** TopOpeBRepBuild_WireEdgeClassifier::TopOpeBRepBuild_WireEdgeClassifier ******/
		/****** md5 signature: b31b3951b5786c808c6475b92daabfe4 ******/
		%feature("compactdefaultargs") TopOpeBRepBuild_WireEdgeClassifier;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
BB: TopOpeBRepBuild_BlockBuilder

Return
-------
None

Description
-----------
Creates a classifier on edge <F>. Used to compare edges and wires on the edge <F>.
") TopOpeBRepBuild_WireEdgeClassifier;
		 TopOpeBRepBuild_WireEdgeClassifier(const TopoDS_Shape & F, const TopOpeBRepBuild_BlockBuilder & BB);

		/****** TopOpeBRepBuild_WireEdgeClassifier::Compare ******/
		/****** md5 signature: 0913c23095e6757cd112f945bf759079 ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
L1: TopOpeBRepBuild_Loop
L2: TopOpeBRepBuild_Loop

Return
-------
TopAbs_State

Description
-----------
No available documentation.
") Compare;
		TopAbs_State Compare(const opencascade::handle<TopOpeBRepBuild_Loop> & L1, const opencascade::handle<TopOpeBRepBuild_Loop> & L2);

		/****** TopOpeBRepBuild_WireEdgeClassifier::CompareElement ******/
		/****** md5 signature: 4e1dbb8606cbfccf50ba2f139e96b3dd ******/
		%feature("compactdefaultargs") CompareElement;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape

Return
-------
bool

Description
-----------
Add the edge <E> in the set of edges used in 2D point classification.
") CompareElement;
		bool CompareElement(const TopoDS_Shape & E);

		/****** TopOpeBRepBuild_WireEdgeClassifier::CompareElementToShape ******/
		/****** md5 signature: f3a29eecc73cc1ff4fd81e08c9dc68cd ******/
		%feature("compactdefaultargs") CompareElementToShape;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
B: TopoDS_Shape

Return
-------
TopAbs_State

Description
-----------
classify edge <E> with wire <B>.
") CompareElementToShape;
		TopAbs_State CompareElementToShape(const TopoDS_Shape & E, const TopoDS_Shape & B);

		/****** TopOpeBRepBuild_WireEdgeClassifier::CompareShapes ******/
		/****** md5 signature: b81b0a02c114db766004bad2e239ab69 ******/
		%feature("compactdefaultargs") CompareShapes;
		%feature("autodoc", "
Parameters
----------
B1: TopoDS_Shape
B2: TopoDS_Shape

Return
-------
TopAbs_State

Description
-----------
classify wire <B1> with wire <B2>.
") CompareShapes;
		TopAbs_State CompareShapes(const TopoDS_Shape & B1, const TopoDS_Shape & B2);

		/****** TopOpeBRepBuild_WireEdgeClassifier::LoopToShape ******/
		/****** md5 signature: 1f9c4b4ab37159531369dfc6f4c50d03 ******/
		%feature("compactdefaultargs") LoopToShape;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepBuild_Loop

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") LoopToShape;
		TopoDS_Shape LoopToShape(const opencascade::handle<TopOpeBRepBuild_Loop> & L);

		/****** TopOpeBRepBuild_WireEdgeClassifier::ResetElement ******/
		/****** md5 signature: 5b22f3ef9126d9d65da5f3beff5f2077 ******/
		%feature("compactdefaultargs") ResetElement;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape

Return
-------
None

Description
-----------
prepare classification involving edge <E> define 2D point (later used in Compare()) on first vertex of edge <E>.
") ResetElement;
		void ResetElement(const TopoDS_Shape & E);

		/****** TopOpeBRepBuild_WireEdgeClassifier::ResetShape ******/
		/****** md5 signature: ec877f5b929fb0490b74fe2ed0160243 ******/
		%feature("compactdefaultargs") ResetShape;
		%feature("autodoc", "
Parameters
----------
B: TopoDS_Shape

Return
-------
None

Description
-----------
prepare classification involving wire <B> calls ResetElement on first edge of <B>.
") ResetShape;
		void ResetShape(const TopoDS_Shape & B);

		/****** TopOpeBRepBuild_WireEdgeClassifier::State ******/
		/****** md5 signature: 8d4e3a462b151f1591c5e1f3cee67ce9 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns state of classification of 2D point, defined by ResetElement, with the current set of edges, defined by Compare.
") State;
		TopAbs_State State();

};


%extend TopOpeBRepBuild_WireEdgeClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def TopOpeBRepBuild_Builder_Contains(*args):
	return TopOpeBRepBuild_Builder.Contains(*args)

@deprecated
def TopOpeBRepBuild_Builder_GContains(*args):
	return TopOpeBRepBuild_Builder.GContains(*args)

@deprecated
def TopOpeBRepBuild_Builder_GCopyList(*args):
	return TopOpeBRepBuild_Builder.GCopyList(*args)

@deprecated
def TopOpeBRepBuild_Builder_GCopyList(*args):
	return TopOpeBRepBuild_Builder.GCopyList(*args)

@deprecated
def TopOpeBRepBuild_Builder_GTakeCommonOfDiff(*args):
	return TopOpeBRepBuild_Builder.GTakeCommonOfDiff(*args)

@deprecated
def TopOpeBRepBuild_Builder_GTakeCommonOfSame(*args):
	return TopOpeBRepBuild_Builder.GTakeCommonOfSame(*args)

@deprecated
def TopOpeBRepBuild_Builder_GcheckNBOUNDS(*args):
	return TopOpeBRepBuild_Builder.GcheckNBOUNDS(*args)

@deprecated
def TopOpeBRepBuild_Builder_GdumpORIPARPNT(*args):
	return TopOpeBRepBuild_Builder.GdumpORIPARPNT(*args)

@deprecated
def TopOpeBRepBuild_Builder_GdumpPNT(*args):
	return TopOpeBRepBuild_Builder.GdumpPNT(*args)

@deprecated
def TopOpeBRepBuild_Builder_KPContains(*args):
	return TopOpeBRepBuild_Builder.KPContains(*args)

@deprecated
def TopOpeBRepBuild_Builder_KPls(*args):
	return TopOpeBRepBuild_Builder.KPls(*args)

@deprecated
def TopOpeBRepBuild_Builder_KPls(*args):
	return TopOpeBRepBuild_Builder.KPls(*args)

@deprecated
def TopOpeBRepBuild_Builder_KPreturn(*args):
	return TopOpeBRepBuild_Builder.KPreturn(*args)

@deprecated
def TopOpeBRepBuild_Builder_Orient(*args):
	return TopOpeBRepBuild_Builder.Orient(*args)

@deprecated
def TopOpeBRepBuild_Builder_PrintCur(*args):
	return TopOpeBRepBuild_Builder.PrintCur(*args)

@deprecated
def TopOpeBRepBuild_Builder_PrintGeo(*args):
	return TopOpeBRepBuild_Builder.PrintGeo(*args)

@deprecated
def TopOpeBRepBuild_Builder_PrintOri(*args):
	return TopOpeBRepBuild_Builder.PrintOri(*args)

@deprecated
def TopOpeBRepBuild_Builder_PrintPnt(*args):
	return TopOpeBRepBuild_Builder.PrintPnt(*args)

@deprecated
def TopOpeBRepBuild_Builder_PrintSur(*args):
	return TopOpeBRepBuild_Builder.PrintSur(*args)

@deprecated
def TopOpeBRepBuild_Builder_Reverse(*args):
	return TopOpeBRepBuild_Builder.Reverse(*args)

@deprecated
def TopOpeBRepBuild_Builder_StringState(*args):
	return TopOpeBRepBuild_Builder.StringState(*args)

@deprecated
def TopOpeBRepBuild_Builder_TopType(*args):
	return TopOpeBRepBuild_Builder.TopType(*args)

@deprecated
def TopOpeBRepBuild_CorrectFace2d_CheckList(*args):
	return TopOpeBRepBuild_CorrectFace2d.CheckList(*args)

@deprecated
def TopOpeBRepBuild_CorrectFace2d_GetP2dFL(*args):
	return TopOpeBRepBuild_CorrectFace2d.GetP2dFL(*args)

@deprecated
def TopOpeBRepBuild_GTool_Dump(*args):
	return TopOpeBRepBuild_GTool.Dump(*args)

@deprecated
def TopOpeBRepBuild_GTool_GComDiff(*args):
	return TopOpeBRepBuild_GTool.GComDiff(*args)

@deprecated
def TopOpeBRepBuild_GTool_GComSame(*args):
	return TopOpeBRepBuild_GTool.GComSame(*args)

@deprecated
def TopOpeBRepBuild_GTool_GComUnsh(*args):
	return TopOpeBRepBuild_GTool.GComUnsh(*args)

@deprecated
def TopOpeBRepBuild_GTool_GCutDiff(*args):
	return TopOpeBRepBuild_GTool.GCutDiff(*args)

@deprecated
def TopOpeBRepBuild_GTool_GCutSame(*args):
	return TopOpeBRepBuild_GTool.GCutSame(*args)

@deprecated
def TopOpeBRepBuild_GTool_GCutUnsh(*args):
	return TopOpeBRepBuild_GTool.GCutUnsh(*args)

@deprecated
def TopOpeBRepBuild_GTool_GFusDiff(*args):
	return TopOpeBRepBuild_GTool.GFusDiff(*args)

@deprecated
def TopOpeBRepBuild_GTool_GFusSame(*args):
	return TopOpeBRepBuild_GTool.GFusSame(*args)

@deprecated
def TopOpeBRepBuild_GTool_GFusUnsh(*args):
	return TopOpeBRepBuild_GTool.GFusUnsh(*args)

@deprecated
def TopOpeBRepBuild_GTopo_DumpSSB(*args):
	return TopOpeBRepBuild_GTopo.DumpSSB(*args)

@deprecated
def TopOpeBRepBuild_Tools_CheckFaceClosed2d(*args):
	return TopOpeBRepBuild_Tools.CheckFaceClosed2d(*args)

@deprecated
def TopOpeBRepBuild_Tools_CorrectCurveOnSurface(*args):
	return TopOpeBRepBuild_Tools.CorrectCurveOnSurface(*args)

@deprecated
def TopOpeBRepBuild_Tools_CorrectFace2d(*args):
	return TopOpeBRepBuild_Tools.CorrectFace2d(*args)

@deprecated
def TopOpeBRepBuild_Tools_CorrectPointOnCurve(*args):
	return TopOpeBRepBuild_Tools.CorrectPointOnCurve(*args)

@deprecated
def TopOpeBRepBuild_Tools_CorrectTolerances(*args):
	return TopOpeBRepBuild_Tools.CorrectTolerances(*args)

@deprecated
def TopOpeBRepBuild_Tools_FindState(*args):
	return TopOpeBRepBuild_Tools.FindState(*args)

@deprecated
def TopOpeBRepBuild_Tools_FindState1(*args):
	return TopOpeBRepBuild_Tools.FindState1(*args)

@deprecated
def TopOpeBRepBuild_Tools_FindState2(*args):
	return TopOpeBRepBuild_Tools.FindState2(*args)

@deprecated
def TopOpeBRepBuild_Tools_FindStateThroughVertex(*args):
	return TopOpeBRepBuild_Tools.FindStateThroughVertex(*args)

@deprecated
def TopOpeBRepBuild_Tools_GetAdjacentFace(*args):
	return TopOpeBRepBuild_Tools.GetAdjacentFace(*args)

@deprecated
def TopOpeBRepBuild_Tools_GetNormalInNearestPoint(*args):
	return TopOpeBRepBuild_Tools.GetNormalInNearestPoint(*args)

@deprecated
def TopOpeBRepBuild_Tools_GetNormalToFaceOnEdge(*args):
	return TopOpeBRepBuild_Tools.GetNormalToFaceOnEdge(*args)

@deprecated
def TopOpeBRepBuild_Tools_GetTangentToEdge(*args):
	return TopOpeBRepBuild_Tools.GetTangentToEdge(*args)

@deprecated
def TopOpeBRepBuild_Tools_GetTangentToEdgeEdge(*args):
	return TopOpeBRepBuild_Tools.GetTangentToEdgeEdge(*args)

@deprecated
def TopOpeBRepBuild_Tools_IsDegEdgesTheSame(*args):
	return TopOpeBRepBuild_Tools.IsDegEdgesTheSame(*args)

@deprecated
def TopOpeBRepBuild_Tools_NormalizeFace(*args):
	return TopOpeBRepBuild_Tools.NormalizeFace(*args)

@deprecated
def TopOpeBRepBuild_Tools_PropagateState(*args):
	return TopOpeBRepBuild_Tools.PropagateState(*args)

@deprecated
def TopOpeBRepBuild_Tools_PropagateStateForWires(*args):
	return TopOpeBRepBuild_Tools.PropagateStateForWires(*args)

@deprecated
def TopOpeBRepBuild_Tools_SpreadStateToChild(*args):
	return TopOpeBRepBuild_Tools.SpreadStateToChild(*args)

@deprecated
def TopOpeBRepBuild_Tools_UpdateEdgeOnFace(*args):
	return TopOpeBRepBuild_Tools.UpdateEdgeOnFace(*args)

@deprecated
def TopOpeBRepBuild_Tools_UpdateEdgeOnPeriodicalFace(*args):
	return TopOpeBRepBuild_Tools.UpdateEdgeOnPeriodicalFace(*args)

@deprecated
def TopOpeBRepBuild_Tools_UpdatePCurves(*args):
	return TopOpeBRepBuild_Tools.UpdatePCurves(*args)

@deprecated
def TopOpeBRepBuild_Tools2d_DumpMapOfShapeVertexInfo(*args):
	return TopOpeBRepBuild_Tools2d.DumpMapOfShapeVertexInfo(*args)

@deprecated
def TopOpeBRepBuild_Tools2d_MakeMapOfShapeVertexInfo(*args):
	return TopOpeBRepBuild_Tools2d.MakeMapOfShapeVertexInfo(*args)

@deprecated
def TopOpeBRepBuild_Tools2d_Path(*args):
	return TopOpeBRepBuild_Tools2d.Path(*args)

@deprecated
def TopOpeBRepBuild_Area1dBuilder_DumpList(*args):
	return TopOpeBRepBuild_Area1dBuilder.DumpList(*args)

@deprecated
def TopOpeBRepBuild_PaveClassifier_AdjustCase(*args):
	return TopOpeBRepBuild_PaveClassifier.AdjustCase(*args)

@deprecated
def TopOpeBRepBuild_PaveSet_SortPave(*args):
	return TopOpeBRepBuild_PaveSet.SortPave(*args)

@deprecated
def TopOpeBRepBuild_WireEdgeSet_IsUVISO(*args):
	return TopOpeBRepBuild_WireEdgeSet.IsUVISO(*args)

}
