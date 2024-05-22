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
%define TOPOPEBREPBUILDDOCSTRING
"TopOpeBRepBuild module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_topopebrepbuild.html"
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
%template(TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape) NCollection_DataMap<TopoDS_Shape,TopOpeBRepBuild_ListOfShapeListOfShape,TopTools_ShapeMapHasher>;
%template(TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo) NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepBuild_VertexInfo,TopTools_ShapeMapHasher>;
%template(TopOpeBRepBuild_ListIteratorOfListOfListOfLoop) NCollection_TListIterator<TopOpeBRepBuild_ListOfLoop>;
%template(TopOpeBRepBuild_ListIteratorOfListOfLoop) NCollection_TListIterator<opencascade::handle<TopOpeBRepBuild_Loop>>;
%template(TopOpeBRepBuild_ListIteratorOfListOfPave) NCollection_TListIterator<opencascade::handle<TopOpeBRepBuild_Pave>>;
%template(TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape) NCollection_TListIterator<TopOpeBRepBuild_ShapeListOfShape>;
%template(TopOpeBRepBuild_ListOfListOfLoop) NCollection_List<TopOpeBRepBuild_ListOfLoop>;

%extend NCollection_List<TopOpeBRepBuild_ListOfLoop> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TopOpeBRepBuild_ListOfLoop) NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>>;

%extend NCollection_List<opencascade::handle<TopOpeBRepBuild_Loop>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TopOpeBRepBuild_ListOfPave) NCollection_List<opencascade::handle<TopOpeBRepBuild_Pave>>;

%extend NCollection_List<opencascade::handle<TopOpeBRepBuild_Pave>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TopOpeBRepBuild_ListOfShapeListOfShape) NCollection_List<TopOpeBRepBuild_ShapeListOfShape>;

%extend NCollection_List<TopOpeBRepBuild_ShapeListOfShape> {
    %pythoncode {
    def __len__(self):
        return self.Size()
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
typedef TopOpeBRepBuild_Builder * TopOpeBRepBuild_PBuilder;
typedef TopOpeBRepBuild_GTopo * TopOpeBRepBuild_PGTopo;
typedef TopOpeBRepBuild_WireEdgeSet * TopOpeBRepBuild_PWireEdgeSet;
/* end typedefs declaration */

/************************************
* class TopOpeBRepBuild_AreaBuilder *
************************************/
class TopOpeBRepBuild_AreaBuilder {
	public:
		/****************** TopOpeBRepBuild_AreaBuilder ******************/
		/**** md5 signature: a9d4bd115c3eab690e6f4e9893c3b1b1 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_AreaBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_AreaBuilder;
		 TopOpeBRepBuild_AreaBuilder();

		/****************** TopOpeBRepBuild_AreaBuilder ******************/
		/**** md5 signature: 9243fc64bdcbf9c9a77499279feb4fab ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_AreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a areabuilder to build the areas on the shapes described by <ls> using the classifier <lc>.
") TopOpeBRepBuild_AreaBuilder;
		 TopOpeBRepBuild_AreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** ADD_LISTOFLoop_TO_LISTOFLoop ******************/
		/**** md5 signature: 0f728224a023b7bc5f9ab1535bc6d7d6 ****/
		%feature("compactdefaultargs") ADD_LISTOFLoop_TO_LISTOFLoop;
		%feature("autodoc", "
Parameters
----------
LOL1: TopOpeBRepBuild_ListOfLoop
LOL2: TopOpeBRepBuild_ListOfLoop
s: Standard_Address (optional, default to NULL)
s1: Standard_Address (optional, default to NULL)
s2: Standard_Address (optional, default to NULL)

Return
-------
None

Description
-----------
No available documentation.
") ADD_LISTOFLoop_TO_LISTOFLoop;
		virtual void ADD_LISTOFLoop_TO_LISTOFLoop(TopOpeBRepBuild_ListOfLoop & LOL1, TopOpeBRepBuild_ListOfLoop & LOL2, const Standard_Address s = NULL, const Standard_Address s1 = NULL, const Standard_Address s2 = NULL);

		/****************** ADD_Loop_TO_LISTOFLoop ******************/
		/**** md5 signature: 7f801d930c422151abf595d5516e3acd ****/
		%feature("compactdefaultargs") ADD_Loop_TO_LISTOFLoop;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepBuild_Loop
LOL: TopOpeBRepBuild_ListOfLoop
s: Standard_Address (optional, default to NULL)

Return
-------
None

Description
-----------
No available documentation.
") ADD_Loop_TO_LISTOFLoop;
		virtual void ADD_Loop_TO_LISTOFLoop(const opencascade::handle<TopOpeBRepBuild_Loop> & L, TopOpeBRepBuild_ListOfLoop & LOL, const Standard_Address s = NULL);

		/****************** InitArea ******************/
		/**** md5 signature: 808fca6b296002dbd2d60a31c8878dff ****/
		%feature("compactdefaultargs") InitArea;
		%feature("autodoc", "Return
-------
int

Description
-----------
Initialize iteration on areas.
") InitArea;
		Standard_Integer InitArea();

		/****************** InitAreaBuilder ******************/
		/**** md5 signature: 1f04d5d8338c472f785404953f26b155 ****/
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets a areabuilder to find the areas on the shapes described by <ls> using the classifier <lc>.
") InitAreaBuilder;
		virtual void InitAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** InitLoop ******************/
		/**** md5 signature: 34a70edd8a84c951b9005f85ed115fa1 ****/
		%feature("compactdefaultargs") InitLoop;
		%feature("autodoc", "Return
-------
int

Description
-----------
Initialize iteration on loops of current area.
") InitLoop;
		Standard_Integer InitLoop();

		/****************** Loop ******************/
		/**** md5 signature: e5eaa5279c90b5c8a2825b1e3e9c39f3 ****/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepBuild_Loop>

Description
-----------
Returns the current loop in the current area.
") Loop;
		const opencascade::handle<TopOpeBRepBuild_Loop> & Loop();

		/****************** MoreArea ******************/
		/**** md5 signature: 3197b46bada833503eb57c5b5d1da3ea ****/
		%feature("compactdefaultargs") MoreArea;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreArea;
		Standard_Boolean MoreArea();

		/****************** MoreLoop ******************/
		/**** md5 signature: 2fc4967f73643c49f8cdf85b9ea9e6ef ****/
		%feature("compactdefaultargs") MoreLoop;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreLoop;
		Standard_Boolean MoreLoop();

		/****************** NextArea ******************/
		/**** md5 signature: f05125373cb5bdf4fd14c1f424e6a6c9 ****/
		%feature("compactdefaultargs") NextArea;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextArea;
		void NextArea();

		/****************** NextLoop ******************/
		/**** md5 signature: e73b88fa3ffe72033ed712bf6302e3ab ****/
		%feature("compactdefaultargs") NextLoop;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextLoop;
		void NextLoop();

		/****************** REM_Loop_FROM_LISTOFLoop ******************/
		/**** md5 signature: 1527beb0e780057f4148e949b36faf57 ****/
		%feature("compactdefaultargs") REM_Loop_FROM_LISTOFLoop;
		%feature("autodoc", "
Parameters
----------
ITLOL: TopOpeBRepBuild_ListIteratorOfListOfLoop
LOL: TopOpeBRepBuild_ListOfLoop
s: Standard_Address (optional, default to NULL)

Return
-------
None

Description
-----------
No available documentation.
") REM_Loop_FROM_LISTOFLoop;
		virtual void REM_Loop_FROM_LISTOFLoop(TopOpeBRepBuild_ListIteratorOfListOfLoop & ITLOL, TopOpeBRepBuild_ListOfLoop & LOL, const Standard_Address s = NULL);

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
		/****************** TopOpeBRepBuild_BlockBuilder ******************/
		/**** md5 signature: 7c98d1cd1525ffe4083c43a3af6f2add ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_BlockBuilder;
		 TopOpeBRepBuild_BlockBuilder();

		/****************** TopOpeBRepBuild_BlockBuilder ******************/
		/**** md5 signature: af59f207713049a2879713e307c5a312 ****/
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

		/****************** AddElement ******************/
		/**** md5 signature: 5138601942697aa3bedd55e14478a01b ****/
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
		Standard_Integer AddElement(const TopoDS_Shape & S);

		/****************** BlockIterator ******************/
		/**** md5 signature: fd27df20c0300f63d4375379caeab86e ****/
		%feature("compactdefaultargs") BlockIterator;
		%feature("autodoc", "Return
-------
TopOpeBRepBuild_BlockIterator

Description
-----------
No available documentation.
") BlockIterator;
		TopOpeBRepBuild_BlockIterator BlockIterator();

		/****************** CurrentBlockIsRegular ******************/
		/**** md5 signature: 199f929b6682223271aa2ba5e57c4474 ****/
		%feature("compactdefaultargs") CurrentBlockIsRegular;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CurrentBlockIsRegular;
		Standard_Boolean CurrentBlockIsRegular();

		/****************** Element ******************/
		/**** md5 signature: 0a9acaa1578577926615c3f44302366b ****/
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
Returns the current element of <bi>.
") Element;
		const TopoDS_Shape Element(const TopOpeBRepBuild_BlockIterator & BI);

		/****************** Element ******************/
		/**** md5 signature: 646f7897f4abe50abf9bbbfd3baa3865 ****/
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
		const TopoDS_Shape Element(const Standard_Integer I);

		/****************** Element ******************/
		/**** md5 signature: 7d9ff5544871b85b3dd1a066bb8cd87d ****/
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
		Standard_Integer Element(const TopoDS_Shape & S);

		/****************** ElementIsValid ******************/
		/**** md5 signature: 6bc339a51ecc7e64764893b15fc7b1b3 ****/
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
		Standard_Boolean ElementIsValid(const TopOpeBRepBuild_BlockIterator & BI);

		/****************** ElementIsValid ******************/
		/**** md5 signature: 414d470c2a2958ddc78f78f40dde3846 ****/
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
		Standard_Boolean ElementIsValid(const Standard_Integer I);

		/****************** InitBlock ******************/
		/**** md5 signature: f0c2404669f8c44fd2edfb1e9d87f90e ****/
		%feature("compactdefaultargs") InitBlock;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitBlock;
		void InitBlock();

		/****************** MakeBlock ******************/
		/**** md5 signature: 1088718283f71ac192fee34488739e42 ****/
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

		/****************** MoreBlock ******************/
		/**** md5 signature: aaf846a2437f6611eb7efe7a785cce73 ****/
		%feature("compactdefaultargs") MoreBlock;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreBlock;
		Standard_Boolean MoreBlock();

		/****************** NextBlock ******************/
		/**** md5 signature: b92660971dbaee8b274d09e60cf8a5bb ****/
		%feature("compactdefaultargs") NextBlock;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextBlock;
		void NextBlock();

		/****************** SetValid ******************/
		/**** md5 signature: f1a4fa9bfd750bc5a97bbbc70c3e53c5 ****/
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
		void SetValid(const TopOpeBRepBuild_BlockIterator & BI, const Standard_Boolean isvalid);

		/****************** SetValid ******************/
		/**** md5 signature: cc42093d71af6e9ea6813a9f9438708c ****/
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
		void SetValid(const Standard_Integer I, const Standard_Boolean isvalid);

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
		/****************** TopOpeBRepBuild_BlockIterator ******************/
		/**** md5 signature: 51b04c62bb2b0ea19e459717cbf4b079 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_BlockIterator;
		 TopOpeBRepBuild_BlockIterator();

		/****************** TopOpeBRepBuild_BlockIterator ******************/
		/**** md5 signature: 7ce90da34bf0f9b315b74d3ed7a8c184 ****/
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
		 TopOpeBRepBuild_BlockIterator(const Standard_Integer Lower, const Standard_Integer Upper);

		/****************** Extent ******************/
		/**** md5 signature: 8da0d7e03de513b08d57e17232ac7391 ****/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Extent;
		Standard_Integer Extent();

		/****************** Initialize ******************/
		/**** md5 signature: 4c9930c75acb9044902a1f8388d68e73 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****************** Value ******************/
		/**** md5 signature: c6d99989077b92200f0377d8b792ba0b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Value;
		Standard_Integer Value();

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
		/****************** TopOpeBRepBuild_Builder ******************/
		/**** md5 signature: db05603b64ec486bca0081aa45c5fe3e ****/
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

		/****************** AddONPatchesSFS ******************/
		/**** md5 signature: 29af8820338a875d8b1b4cae4ed43711 ****/
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

		/****************** BuildEdges ******************/
		/**** md5 signature: a69eddf8f02bbde68465c237752d04a7 ****/
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
Update the ds by creating new geometries. create shapes from the new geometries.
") BuildEdges;
		void BuildEdges(const opencascade::handle<TopOpeBRepDS_HDataStructure> & DS);

		/****************** BuildTool ******************/
		/**** md5 signature: 8f00b58c6dc4bbbf0701f98004c469fd ****/
		%feature("compactdefaultargs") BuildTool;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_BuildTool

Description
-----------
No available documentation.
") BuildTool;
		const TopOpeBRepDS_BuildTool & BuildTool();

		/****************** BuildVertices ******************/
		/**** md5 signature: 307eb10c5561324e5d3fc62fa1aca2f0 ****/
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
Update the ds by creating new geometries. create vertices on ds points.
") BuildVertices;
		void BuildVertices(const opencascade::handle<TopOpeBRepDS_HDataStructure> & DS);

		/****************** ChangeBuildTool ******************/
		/**** md5 signature: f18366a59aef2f912961e1fc0d178930 ****/
		%feature("compactdefaultargs") ChangeBuildTool;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_BuildTool

Description
-----------
No available documentation.
") ChangeBuildTool;
		TopOpeBRepDS_BuildTool & ChangeBuildTool();

		/****************** ChangeClassify ******************/
		/**** md5 signature: a5aae6074b664252bffcb2a758139706 ****/
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
		void ChangeClassify(const Standard_Boolean B);

		/****************** ChangeMSplit ******************/
		/**** md5 signature: 0cd8e5c34504ef3505f88682bb4c0045 ****/
		%feature("compactdefaultargs") ChangeMSplit;
		%feature("autodoc", "
Parameters
----------
s: TopAbs_State

Return
-------
TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State

Description
-----------
No available documentation.
") ChangeMSplit;
		TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & ChangeMSplit(const TopAbs_State s);

		/****************** ChangeSplit ******************/
		/**** md5 signature: edd6d887a880c834367d466790bef748 ****/
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
Returns a ref.on the list of shapes connected to <s> as <tb> split parts of <s>. mark <s> as split in <tb> parts.
") ChangeSplit;
		TopTools_ListOfShape & ChangeSplit(const TopoDS_Shape & S, const TopAbs_State TB);

		/****************** Classify ******************/
		/**** md5 signature: 4db5d89b6f433f57d3e991b304cafec2 ****/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Classify;
		Standard_Boolean Classify();

		/****************** Clear ******************/
		/**** md5 signature: 1badd2d119b64dbdb177834e510c3af9 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all splits and merges already performed. does not clear the handled ds.
") Clear;
		virtual void Clear();

		/****************** ClearMaps ******************/
		/**** md5 signature: 3a3e1ac4dd56ec90accec52c01231b06 ****/
		%feature("compactdefaultargs") ClearMaps;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ClearMaps;
		void ClearMaps();

		/****************** Contains ******************/
		/**** md5 signature: c51b73a3c98ea4548fbbc45282acd899 ****/
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
		static Standard_Boolean Contains(const TopoDS_Shape & S, const TopTools_ListOfShape & L);

		/****************** DataStructure ******************/
		/**** md5 signature: c5d3d5af4f8db2375e9c48f16eb16363 ****/
		%feature("compactdefaultargs") DataStructure;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>

Description
-----------
Returns the ds handled by this builder.
") DataStructure;
		opencascade::handle<TopOpeBRepDS_HDataStructure> DataStructure();

		/****************** End ******************/
		/**** md5 signature: 583631727c11157a7fee45984d266c4a ****/
		%feature("compactdefaultargs") End;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") End;
		void End();

		/****************** FillOnPatches ******************/
		/**** md5 signature: 9caa5991b902eb3c4a7ba1f57d656a05 ****/
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

		/****************** FillSecEdgeAncestorMap ******************/
		/**** md5 signature: 7f23f1de287ee408ba99e69609a73e17 ****/
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
Fills anancmap with pairs (edge,ancestor edge) for each split from the map amapon for the shape object identified by shaperank.
") FillSecEdgeAncestorMap;
		void FillSecEdgeAncestorMap(const Standard_Integer aShapeRank, const TopTools_MapOfShape & aMapON, TopTools_DataMapOfShapeShape & anAncMap);

		/****************** FindFacesTouchingEdge ******************/
		/**** md5 signature: 4d02ec9008d82896bf2b6b669f00530c ****/
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
		void FindFacesTouchingEdge(const TopoDS_Shape & aFace, const TopoDS_Shape & anEdge, const Standard_Integer aShRank, TopTools_ListOfShape & aFaces);

		/****************** FindIsKPart ******************/
		/**** md5 signature: 2b66da5dd456618adc73ed47b3fcd637 ****/
		%feature("compactdefaultargs") FindIsKPart;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FindIsKPart;
		Standard_Integer FindIsKPart();

		/****************** FindSameDomain ******************/
		/**** md5 signature: f23cff66b3e3c2705367318a0ba22be6 ****/
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

		/****************** FindSameDomainSameOrientation ******************/
		/**** md5 signature: 320b1588ee71d57919e4f4607dba8362 ****/
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

		/****************** FindSameRank ******************/
		/**** md5 signature: 429913c3c11cd7676d660bde12f01596 ****/
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
		void FindSameRank(const TopTools_ListOfShape & L1, const Standard_Integer R, TopTools_ListOfShape & L2);

		/****************** GClearMaps ******************/
		/**** md5 signature: 7d0a1671079bfaeb1de7b98195821892 ****/
		%feature("compactdefaultargs") GClearMaps;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GClearMaps;
		void GClearMaps();

		/****************** GContains ******************/
		/**** md5 signature: 46cc7d6803662cf00cc3d0818f07f41a ****/
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
		static Standard_Boolean GContains(const TopoDS_Shape & S, const TopTools_ListOfShape & L);

		/****************** GCopyList ******************/
		/**** md5 signature: b06ac36cd3f32d5fa8b448cf983d9d15 ****/
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
		static void GCopyList(const TopTools_ListOfShape & Lin, const Standard_Integer i1, const Standard_Integer i2, TopTools_ListOfShape & Lou);

		/****************** GCopyList ******************/
		/**** md5 signature: e2960e8ce90f3207afd4562badb4cf92 ****/
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

		/****************** GEDBUMakeEdges ******************/
		/**** md5 signature: 2d508fae94eba8834c31c576b73c98d4 ****/
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

		/****************** GFABUMakeFaces ******************/
		/**** md5 signature: b02ec1c30b5cae76aa0cdd61546395aa ****/
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

		/****************** GFillCurveTopologyWES ******************/
		/**** md5 signature: ae6642415017c216585dc55ae9111141 ****/
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

		/****************** GFillCurveTopologyWES ******************/
		/**** md5 signature: b4099f1e415e678dbeade8b5e9202f94 ****/
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

		/****************** GFillEdgePVS ******************/
		/**** md5 signature: 634c5abe6df70f24dbd8c7f0c7bcd9da ****/
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

		/****************** GFillEdgeWES ******************/
		/**** md5 signature: fd1147d0934a90ed5e2dcf2e7b684b69 ****/
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

		/****************** GFillEdgesPVS ******************/
		/**** md5 signature: ab03af6f2a1c5eb53836966cf3a3001e ****/
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

		/****************** GFillFaceSFS ******************/
		/**** md5 signature: 556643c5ae94f766be559e160a55cc16 ****/
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

		/****************** GFillFaceWES ******************/
		/**** md5 signature: 9ca8810fb1baf6fdfa97310b137824ae ****/
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

		/****************** GFillFacesWES ******************/
		/**** md5 signature: c7829748f5779a4a52bfbd6d9f5b01d9 ****/
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

		/****************** GFillFacesWESK ******************/
		/**** md5 signature: ff4c115a720653fe43326186e72861e5 ****/
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
		void GFillFacesWESK(const TopTools_ListOfShape & LF1, const TopTools_ListOfShape & LF2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES, const Standard_Integer K);

		/****************** GFillFacesWESMakeFaces ******************/
		/**** md5 signature: 795fb99591f790a052a8b4a67ef05423 ****/
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

		/****************** GFillONPartsWES ******************/
		/**** md5 signature: 9b12b39ea245e6874fcb1709b9bce305 ****/
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

		/****************** GFillPointTopologyPVS ******************/
		/**** md5 signature: 00c325991f266de203dfe864e34d835b ****/
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

		/****************** GFillPointTopologyPVS ******************/
		/**** md5 signature: 6904815967b575964b12b0a0973a9335 ****/
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

		/****************** GFillShellSFS ******************/
		/**** md5 signature: 8c871168f4d07f3042cf5e83f853c6ee ****/
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

		/****************** GFillSolidSFS ******************/
		/**** md5 signature: 0e807efbe5f0fb9efb5a90e8b027fda3 ****/
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

		/****************** GFillSolidsSFS ******************/
		/**** md5 signature: 7986135ef4ea4d87af654c5a1700cf56 ****/
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

		/****************** GFillSurfaceTopologySFS ******************/
		/**** md5 signature: 93637eed413d6909c90ac82bad8c8ddb ****/
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

		/****************** GFillSurfaceTopologySFS ******************/
		/**** md5 signature: 3da49093d4b4d4c3f8537faf2e66edb1 ****/
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

		/****************** GFillWireWES ******************/
		/**** md5 signature: 3fb6de1a48bf6c55f86e3818f04365ec ****/
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

		/****************** GFindSamDom ******************/
		/**** md5 signature: af7d2bf2ceac84acbfd2f8d1edbf0a62 ****/
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

		/****************** GFindSamDom ******************/
		/**** md5 signature: ba5488e7697e59f33a0fa7d8d881f80c ****/
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

		/****************** GFindSamDomSODO ******************/
		/**** md5 signature: f417eb4612804a0a77c70959899e8997 ****/
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

		/****************** GFindSamDomSODO ******************/
		/**** md5 signature: df64d32fd466f3d1173dc6e7aa708d31 ****/
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

		/****************** GFindSameRank ******************/
		/**** md5 signature: bf10ceb58a6f2483d4c0ce84fbed0d89 ****/
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
		void GFindSameRank(const TopTools_ListOfShape & L1, const Standard_Integer R, TopTools_ListOfShape & L2);

		/****************** GIsShapeOf ******************/
		/**** md5 signature: 65b1f470122d44340803f13c9c21611c ****/
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
		Standard_Boolean GIsShapeOf(const TopoDS_Shape & S, const Standard_Integer I12);

		/****************** GKeepShape ******************/
		/**** md5 signature: b415d5c6da215f4878f9307b8b39c375 ****/
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
		Standard_Boolean GKeepShape(const TopoDS_Shape & S, const TopTools_ListOfShape & Lref, const TopAbs_State T);

		/****************** GKeepShape1 ******************/
		/**** md5 signature: 5dc090b1ec14d0a083a1a17d0e58324a ****/
		%feature("compactdefaultargs") GKeepShape1;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Lref: TopTools_ListOfShape
T: TopAbs_State
pos: TopAbs_State

Return
-------
bool

Description
-----------
Return true if s is classified <t> / lref shapes.
") GKeepShape1;
		Standard_Boolean GKeepShape1(const TopoDS_Shape & S, const TopTools_ListOfShape & Lref, const TopAbs_State T, TopAbs_State & pos);

		/****************** GKeepShapes ******************/
		/**** md5 signature: d7615d0c7d4afa2e48a8e2f64c8a8673 ****/
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
Add to lou the shapes of lin classified <t> / lref shapes. lou is not cleared. (s is a dummy trace argument).
") GKeepShapes;
		void GKeepShapes(const TopoDS_Shape & S, const TopTools_ListOfShape & Lref, const TopAbs_State T, const TopTools_ListOfShape & Lin, TopTools_ListOfShape & Lou);

		/****************** GMapShapes ******************/
		/**** md5 signature: 44ee55cccd1f2351430fc6c01a780ed0 ****/
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

		/****************** GMergeEdgeWES ******************/
		/**** md5 signature: 049b72e73e6bcd77631b9ec8abe03a9f ****/
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

		/****************** GMergeEdges ******************/
		/**** md5 signature: adce7aa3e7bb67fe80c20378909044c4 ****/
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

		/****************** GMergeFaceSFS ******************/
		/**** md5 signature: d5d3648aa42cd86a44acaab0e55b8c1a ****/
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

		/****************** GMergeFaces ******************/
		/**** md5 signature: 71fc21d27bece995f5bc30f6acb7fbde ****/
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

		/****************** GMergeSolids ******************/
		/**** md5 signature: 0cc3e18b3dbf191a704ebcd3d72ccece ****/
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

		/****************** GPVSMakeEdges ******************/
		/**** md5 signature: e13fee7dea779779b8dd50ed1b254f70 ****/
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

		/****************** GParamOnReference ******************/
		/**** md5 signature: 9847fbb030b2aee5abc523b359584894 ****/
		%feature("compactdefaultargs") GParamOnReference;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
P: float

Description
-----------
No available documentation.
") GParamOnReference;
		Standard_Boolean GParamOnReference(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue);

		/****************** GSFSMakeSolids ******************/
		/**** md5 signature: db1d056e5bece47d27ca83d676adb94e ****/
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

		/****************** GSOBUMakeSolids ******************/
		/**** md5 signature: ba8db62caccdc4eee36ba51b08df60ab ****/
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

		/****************** GShapeRank ******************/
		/**** md5 signature: 50e58ef919305987be74b047315f558b ****/
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
		Standard_Integer GShapeRank(const TopoDS_Shape & S);

		/****************** GSplitEdge ******************/
		/**** md5 signature: 8bedb809ac8a6f90c33de9e5495d1f84 ****/
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

		/****************** GSplitEdgeWES ******************/
		/**** md5 signature: 5827cd13a06bac9d9c5c3fb242006875 ****/
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

		/****************** GSplitFace ******************/
		/**** md5 signature: d42148f219db69b6ef8e7ac16c38a88a ****/
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

		/****************** GSplitFaceSFS ******************/
		/**** md5 signature: 1d247a4e2475afb1cf801db0ff601e15 ****/
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

		/****************** GTakeCommonOfDiff ******************/
		/**** md5 signature: 5f4fe6cce2285553c8581988a4778c4b ****/
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
		static Standard_Boolean GTakeCommonOfDiff(const TopOpeBRepBuild_GTopo & G);

		/****************** GTakeCommonOfSame ******************/
		/**** md5 signature: 1560b9b686284883b2c68bf589db4aa6 ****/
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
		static Standard_Boolean GTakeCommonOfSame(const TopOpeBRepBuild_GTopo & G);

		/****************** GToMerge ******************/
		/**** md5 signature: 2a6bce4f6bb6f85fb0033f3a27aa7994 ****/
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
		Standard_Boolean GToMerge(const TopoDS_Shape & S);

		/****************** GToSplit ******************/
		/**** md5 signature: de96f70b42f624b5908be956d220a4c6 ****/
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
		Standard_Boolean GToSplit(const TopoDS_Shape & S, const TopAbs_State TB);

		/****************** GWESMakeFaces ******************/
		/**** md5 signature: f8e71e0228a1905ac04f8e3a9ab05f1e ****/
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

		/****************** GcheckNBOUNDS ******************/
		/**** md5 signature: 0c398179d54225dbf7f39289ac59dd49 ****/
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
		static Standard_Boolean GcheckNBOUNDS(const TopoDS_Shape & E);

		/****************** GdumpEDBU ******************/
		/**** md5 signature: 28397c3153ddcc7446585594598b119d ****/
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

		/****************** GdumpEDG ******************/
		/**** md5 signature: be64a9f73152b4673817b4eb4ae93ac3 ****/
		%feature("compactdefaultargs") GdumpEDG;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
str: Standard_Address (optional, default to NULL)

Return
-------
None

Description
-----------
No available documentation.
") GdumpEDG;
		void GdumpEDG(const TopoDS_Shape & S, const Standard_Address str = NULL);

		/****************** GdumpEDGVER ******************/
		/**** md5 signature: 2dfe06e9c8a8e600a174f310a7b53225 ****/
		%feature("compactdefaultargs") GdumpEDGVER;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
V: TopoDS_Shape
str: Standard_Address (optional, default to NULL)

Return
-------
None

Description
-----------
No available documentation.
") GdumpEDGVER;
		void GdumpEDGVER(const TopoDS_Shape & E, const TopoDS_Shape & V, const Standard_Address str = NULL);

		/****************** GdumpEXP ******************/
		/**** md5 signature: dadc89986f33462511f8e7b7dbb93260 ****/
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

		/****************** GdumpFABU ******************/
		/**** md5 signature: 3b5fa97dd7829d0ae436a1bb37939d01 ****/
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

		/****************** GdumpLS ******************/
		/**** md5 signature: de4e9a197255890473eaead8932bd5dc ****/
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

		/****************** GdumpORIPARPNT ******************/
		/**** md5 signature: 310a0dc837467436a52e5998225e87cc ****/
		%feature("compactdefaultargs") GdumpORIPARPNT;
		%feature("autodoc", "
Parameters
----------
o: TopAbs_Orientation
p: float
Pnt: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GdumpORIPARPNT;
		static void GdumpORIPARPNT(const TopAbs_Orientation o, const Standard_Real p, const gp_Pnt & Pnt);

		/****************** GdumpPNT ******************/
		/**** md5 signature: b2e7b611534f1c09c9a5a7bdba7bfbc9 ****/
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

		/****************** GdumpSAMDOM ******************/
		/**** md5 signature: acb66af2050b03703523e7e9213a6fb2 ****/
		%feature("compactdefaultargs") GdumpSAMDOM;
		%feature("autodoc", "
Parameters
----------
L: TopTools_ListOfShape
str: Standard_Address (optional, default to NULL)

Return
-------
None

Description
-----------
No available documentation.
") GdumpSAMDOM;
		void GdumpSAMDOM(const TopTools_ListOfShape & L, const Standard_Address str = NULL);

		/****************** GdumpSHA ******************/
		/**** md5 signature: b33d08b145193c94207fe09507eada96 ****/
		%feature("compactdefaultargs") GdumpSHA;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
str: Standard_Address (optional, default to NULL)

Return
-------
None

Description
-----------
No available documentation.
") GdumpSHA;
		void GdumpSHA(const TopoDS_Shape & S, const Standard_Address str = NULL);

		/****************** GdumpSHAORI ******************/
		/**** md5 signature: 6f3c2425cba350675820a6c4c45f6562 ****/
		%feature("compactdefaultargs") GdumpSHAORI;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
str: Standard_Address (optional, default to NULL)

Return
-------
None

Description
-----------
No available documentation.
") GdumpSHAORI;
		void GdumpSHAORI(const TopoDS_Shape & S, const Standard_Address str = NULL);

		/****************** GdumpSHAORIGEO ******************/
		/**** md5 signature: 0cb32bf12ccde4731ec83fc7f9952eb0 ****/
		%feature("compactdefaultargs") GdumpSHAORIGEO;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
str: Standard_Address (optional, default to NULL)

Return
-------
None

Description
-----------
No available documentation.
") GdumpSHAORIGEO;
		void GdumpSHAORIGEO(const TopoDS_Shape & S, const Standard_Address str = NULL);

		/****************** GdumpSHASETindex ******************/
		/**** md5 signature: ab9c9976c1b5e245e09a906764fc6658 ****/
		%feature("compactdefaultargs") GdumpSHASETindex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GdumpSHASETindex;
		Standard_Integer GdumpSHASETindex();

		/****************** GdumpSHASETreset ******************/
		/**** md5 signature: 858d9a6d70c3592e32b403720974577a ****/
		%feature("compactdefaultargs") GdumpSHASETreset;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GdumpSHASETreset;
		void GdumpSHASETreset();

		/****************** GdumpSHASTA ******************/
		/**** md5 signature: c4d757293a5ba76159677ecddd5aa885 ****/
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
		void GdumpSHASTA(const Standard_Integer iS, const TopAbs_State T, TCollection_AsciiString a = "", TCollection_AsciiString b = "");

		/****************** GdumpSHASTA ******************/
		/**** md5 signature: cad20edf8bfe449486276d27f8ff1f74 ****/
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

		/****************** GdumpSHASTA ******************/
		/**** md5 signature: ad5d444f38fc9076eb7fc932b55a4d7e ****/
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
		void GdumpSHASTA(const Standard_Integer iS, const TopAbs_State T, const TopOpeBRepBuild_ShapeSet & SS, TCollection_AsciiString a = "", TCollection_AsciiString b = "", TCollection_AsciiString c = "\n");

		/****************** GdumpSOBU ******************/
		/**** md5 signature: 1aea67b9789dcd3f2eb7ecd482cf35ab ****/
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

		/****************** GtraceSPS ******************/
		/**** md5 signature: 92757d6dff5423fef37bd0894b9edf49 ****/
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
		Standard_Boolean GtraceSPS(const Standard_Integer iS);

		/****************** GtraceSPS ******************/
		/**** md5 signature: db026a5f008a1d15637fe4cc6fc8d480 ****/
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
		Standard_Boolean GtraceSPS(const Standard_Integer iS, const Standard_Integer jS);

		/****************** GtraceSPS ******************/
		/**** md5 signature: ca16f93d7573c1cd0fc6a8803842691c ****/
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
		Standard_Boolean GtraceSPS(const TopoDS_Shape & S);

		/****************** GtraceSPS ******************/
		/**** md5 signature: b4c5095f7fd4f7aa8a990e5298793b74 ****/
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
		Standard_Boolean GtraceSPS(const TopoDS_Shape & S, Standard_Integer &OutValue);

		/****************** InitSection ******************/
		/**** md5 signature: f27058639d6e6094640ca4c517e04af9 ****/
		%feature("compactdefaultargs") InitSection;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitSection;
		void InitSection();

		/****************** IsKPart ******************/
		/**** md5 signature: 2a118469af84419ccc334be36f278760 ****/
		%feature("compactdefaultargs") IsKPart;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IsKPart;
		Standard_Integer IsKPart();

		/****************** IsMerged ******************/
		/**** md5 signature: e95e0cd9df579ea79e71291eca94cb86 ****/
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
Returns true if the shape <s> has been merged.
") IsMerged;
		Standard_Boolean IsMerged(const TopoDS_Shape & S, const TopAbs_State TB);

		/****************** IsShapeOf ******************/
		/**** md5 signature: c83e3173dda8efa6809111274786f775 ****/
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
		Standard_Boolean IsShapeOf(const TopoDS_Shape & S, const Standard_Integer I12);

		/****************** IsSplit ******************/
		/**** md5 signature: ca7c85e2edb6ca3a93ce5dd55cc86736 ****/
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
Returns true if the shape <s> has been split.
") IsSplit;
		Standard_Boolean IsSplit(const TopoDS_Shape & S, const TopAbs_State TB);

		/****************** KPClearMaps ******************/
		/**** md5 signature: 1d528f7666001e87151255777251419c ****/
		%feature("compactdefaultargs") KPClearMaps;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") KPClearMaps;
		void KPClearMaps();

		/****************** KPContains ******************/
		/**** md5 signature: b2444b0c0e92be55ec65eef787df5d2d ****/
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
		static Standard_Boolean KPContains(const TopoDS_Shape & S, const TopTools_ListOfShape & L);

		/****************** KPSameDomain ******************/
		/**** md5 signature: bfcd89079bf508ca4b9b3ae2293870f0 ****/
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

		/****************** KPclasSS ******************/
		/**** md5 signature: 2050d409f4732118c79abb4715e36b77 ****/
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

		/****************** KPclasSS ******************/
		/**** md5 signature: d57f31fbfddcb0cc64704b29cb6b06d6 ****/
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

		/****************** KPclasSS ******************/
		/**** md5 signature: 7b816ac0db011918ea4b6bab862633bd ****/
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

		/****************** KPclassF ******************/
		/**** md5 signature: 8b3aab3e544b985f3be18249edbbe100 ****/
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

		/****************** KPclassFF ******************/
		/**** md5 signature: dd90793b0548c8ba1b31a61db8711199 ****/
		%feature("compactdefaultargs") KPclassFF;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Shape
F2: TopoDS_Shape
T1: TopAbs_State
T2: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") KPclassFF;
		void KPclassFF(const TopoDS_Shape & F1, const TopoDS_Shape & F2, TopAbs_State & T1, TopAbs_State & T2);

		/****************** KPisdisj ******************/
		/**** md5 signature: 1b0e050b16c6b351717414369d193c2c ****/
		%feature("compactdefaultargs") KPisdisj;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") KPisdisj;
		Standard_Integer KPisdisj();

		/****************** KPisdisjanalyse ******************/
		/**** md5 signature: 03e58c864fd67c4fcc7ca3151eb2b4cc ****/
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

		/****************** KPisdisjsh ******************/
		/**** md5 signature: d4061792d8a757bb091eb9f43b79dd60 ****/
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
		Standard_Integer KPisdisjsh(const TopoDS_Shape & S);

		/****************** KPisfafa ******************/
		/**** md5 signature: a3158d48bd477b814785ecf8a2f8d7f3 ****/
		%feature("compactdefaultargs") KPisfafa;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") KPisfafa;
		Standard_Integer KPisfafa();

		/****************** KPisfafash ******************/
		/**** md5 signature: f3709ba46be0dfa755f4e7f7c40f8ecb ****/
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
		Standard_Integer KPisfafash(const TopoDS_Shape & S);

		/****************** KPiskole ******************/
		/**** md5 signature: a928b3effc324e72a45790c46c3f0f8b ****/
		%feature("compactdefaultargs") KPiskole;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") KPiskole;
		Standard_Integer KPiskole();

		/****************** KPiskoleFF ******************/
		/**** md5 signature: 849724dcc3a886f5830ac15c48eeb3a0 ****/
		%feature("compactdefaultargs") KPiskoleFF;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Shape
F2: TopoDS_Shape
T1: TopAbs_State
T2: TopAbs_State

Return
-------
bool

Description
-----------
No available documentation.
") KPiskoleFF;
		Standard_Boolean KPiskoleFF(const TopoDS_Shape & F1, const TopoDS_Shape & F2, TopAbs_State & T1, TopAbs_State & T2);

		/****************** KPiskoleanalyse ******************/
		/**** md5 signature: 34c79a8fadaeffdca85f891fb32e8a62 ****/
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

		/****************** KPiskolesh ******************/
		/**** md5 signature: 1c257091174f9b7e3167ee608e6f4ae9 ****/
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
		Standard_Boolean KPiskolesh(const TopoDS_Shape & S, TopTools_ListOfShape & LS, TopTools_ListOfShape & LF);

		/****************** KPiskoletge ******************/
		/**** md5 signature: daef198dc839e6affc338345f2705e0f ****/
		%feature("compactdefaultargs") KPiskoletge;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") KPiskoletge;
		Standard_Integer KPiskoletge();

		/****************** KPiskoletgeanalyse ******************/
		/**** md5 signature: 333d436c1ad1bd990b516b2c21008d71 ****/
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

		/****************** KPiskoletgesh ******************/
		/**** md5 signature: bc420fd5d707b57eb059ed141954d81f ****/
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
		Standard_Boolean KPiskoletgesh(const TopoDS_Shape & S, TopTools_ListOfShape & LS, TopTools_ListOfShape & LF);

		/****************** KPissoso ******************/
		/**** md5 signature: 5705deb511462891db635b35473cd054 ****/
		%feature("compactdefaultargs") KPissoso;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") KPissoso;
		Standard_Integer KPissoso();

		/****************** KPissososh ******************/
		/**** md5 signature: 00e17e74eb933171e8f806344bc7bba4 ****/
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
		Standard_Integer KPissososh(const TopoDS_Shape & S);

		/****************** KPlhg ******************/
		/**** md5 signature: e56dfd8a4b90b0b37c5090efe9540555 ****/
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
		Standard_Integer KPlhg(const TopoDS_Shape & S, const TopAbs_ShapeEnum T, TopTools_ListOfShape & L);

		/****************** KPlhg ******************/
		/**** md5 signature: c4eb046fa57db797b9bc5c7a4c35b228 ****/
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
		Standard_Integer KPlhg(const TopoDS_Shape & S, const TopAbs_ShapeEnum T);

		/****************** KPlhsd ******************/
		/**** md5 signature: 15b550983c01807a1bff45cf5332a6cd ****/
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
		Standard_Integer KPlhsd(const TopoDS_Shape & S, const TopAbs_ShapeEnum T, TopTools_ListOfShape & L);

		/****************** KPlhsd ******************/
		/**** md5 signature: f78fc734ae7b36dc0b57c55b5e2dcffc ****/
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
		Standard_Integer KPlhsd(const TopoDS_Shape & S, const TopAbs_ShapeEnum T);

		/****************** KPls ******************/
		/**** md5 signature: fa1e5dc8dcd60ed5c185ce381e3b7007 ****/
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
		static Standard_Integer KPls(const TopoDS_Shape & S, const TopAbs_ShapeEnum T, TopTools_ListOfShape & L);

		/****************** KPls ******************/
		/**** md5 signature: 01ba7bb99f4eedf2755d8a5307603e8e ****/
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
		static Standard_Integer KPls(const TopoDS_Shape & S, const TopAbs_ShapeEnum T);

		/****************** KPmakeface ******************/
		/**** md5 signature: 641b91d6c3acef07eb29c11e995aa13c ****/
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
		TopoDS_Shape KPmakeface(const TopoDS_Shape & F1, const TopTools_ListOfShape & LF2, const TopAbs_State T1, const TopAbs_State T2, const Standard_Boolean R1, const Standard_Boolean R2);

		/****************** KPreturn ******************/
		/**** md5 signature: 64df81b258de3a87c7e99fa1cf0cb2c4 ****/
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
		static Standard_Integer KPreturn(const Standard_Integer KP);

		/****************** KeepShape ******************/
		/**** md5 signature: 03c9b6a32bc6f6c55381fff005d6ba71 ****/
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
		Standard_Boolean KeepShape(const TopoDS_Shape & S, const TopTools_ListOfShape & LS, const TopAbs_State T);

		/****************** MSplit ******************/
		/**** md5 signature: 5d2d1c0bded80985eddecfe9b505d55e ****/
		%feature("compactdefaultargs") MSplit;
		%feature("autodoc", "
Parameters
----------
s: TopAbs_State

Return
-------
TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State

Description
-----------
No available documentation.
") MSplit;
		const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MSplit(const TopAbs_State s);

		/****************** MakeEdges ******************/
		/**** md5 signature: 2919d80aff6f69dbb6977326748590b3 ****/
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

		/****************** MakeFaces ******************/
		/**** md5 signature: 3aba84be5590527decc78fc8d110ac80 ****/
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

		/****************** MakeShells ******************/
		/**** md5 signature: 1942877220dd27e307124153b15e928a ****/
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

		/****************** MakeSolids ******************/
		/**** md5 signature: 31fb67a0ffe0c5553e39c9505d981d3c ****/
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

		/****************** MapShapes ******************/
		/**** md5 signature: e9d3fcdd2a8a024ad795f312ab0fad1d ****/
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

		/****************** MergeEdges ******************/
		/**** md5 signature: 952be977f0e0dd8bdea0d200eddaf660 ****/
		%feature("compactdefaultargs") MergeEdges;
		%feature("autodoc", "
Parameters
----------
L1: TopTools_ListOfShape
TB1: TopAbs_State
L2: TopTools_ListOfShape
TB2: TopAbs_State
onA: bool (optional, default to Standard_False)
onB: bool (optional, default to Standard_False)
onAB: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Merges the two edges <s1> and <s2> keeping the parts in each edge of states <tb1> and <tb2>. booleans ona, onb, onab indicate whether parts of edges found as state on respectively on first, second, and both shapes must be (or not) built.
") MergeEdges;
		void MergeEdges(const TopTools_ListOfShape & L1, const TopAbs_State TB1, const TopTools_ListOfShape & L2, const TopAbs_State TB2, const Standard_Boolean onA = Standard_False, const Standard_Boolean onB = Standard_False, const Standard_Boolean onAB = Standard_False);

		/****************** MergeFaces ******************/
		/**** md5 signature: d221fad9b6eaf9fc8362cb84e1523a32 ****/
		%feature("compactdefaultargs") MergeFaces;
		%feature("autodoc", "
Parameters
----------
S1: TopTools_ListOfShape
TB1: TopAbs_State
S2: TopTools_ListOfShape
TB2: TopAbs_State
onA: bool (optional, default to Standard_False)
onB: bool (optional, default to Standard_False)
onAB: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Merges the two faces <s1> and <s2> keeping the parts in each face of states <tb1> and <tb2>.
") MergeFaces;
		void MergeFaces(const TopTools_ListOfShape & S1, const TopAbs_State TB1, const TopTools_ListOfShape & S2, const TopAbs_State TB2, const Standard_Boolean onA = Standard_False, const Standard_Boolean onB = Standard_False, const Standard_Boolean onAB = Standard_False);

		/****************** MergeKPart ******************/
		/**** md5 signature: 84113157513a352ebae25f2922b94101 ****/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MergeKPart;
		virtual void MergeKPart();

		/****************** MergeKPart ******************/
		/**** md5 signature: cc91d51623406e21a4b045a5dd803cae ****/
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

		/****************** MergeKPartisdisj ******************/
		/**** md5 signature: 451dda0b1fea96ec67eddb7af21a4992 ****/
		%feature("compactdefaultargs") MergeKPartisdisj;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MergeKPartisdisj;
		void MergeKPartisdisj();

		/****************** MergeKPartisfafa ******************/
		/**** md5 signature: c5226c87c8a7f951cc66f0ffe1017ef8 ****/
		%feature("compactdefaultargs") MergeKPartisfafa;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MergeKPartisfafa;
		void MergeKPartisfafa();

		/****************** MergeKPartiskole ******************/
		/**** md5 signature: 4db93b7123f424f7dc73d30b05ed4526 ****/
		%feature("compactdefaultargs") MergeKPartiskole;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MergeKPartiskole;
		void MergeKPartiskole();

		/****************** MergeKPartiskoletge ******************/
		/**** md5 signature: 752b685f17c596098295a4de24d5db13 ****/
		%feature("compactdefaultargs") MergeKPartiskoletge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MergeKPartiskoletge;
		void MergeKPartiskoletge();

		/****************** MergeKPartissoso ******************/
		/**** md5 signature: f624ae3f879a4f3f25dfbd0dbab2ef1d ****/
		%feature("compactdefaultargs") MergeKPartissoso;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MergeKPartissoso;
		void MergeKPartissoso();

		/****************** MergeShapes ******************/
		/**** md5 signature: 636b2f3679903a68befa397bca4894b5 ****/
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
Merges the two shapes <s1> and <s2> keeping the parts of states <tb1>,<tb2> in <s1>,<s2>.
") MergeShapes;
		void MergeShapes(const TopoDS_Shape & S1, const TopAbs_State TB1, const TopoDS_Shape & S2, const TopAbs_State TB2);

		/****************** MergeSolid ******************/
		/**** md5 signature: dadbcac87fb02bfa7f2c7004eb8c0e8f ****/
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
Merges the solid <s> keeping the parts of state <tb>.
") MergeSolid;
		void MergeSolid(const TopoDS_Shape & S, const TopAbs_State TB);

		/****************** MergeSolids ******************/
		/**** md5 signature: ad6aa825ea70349a881f7c3ac9f6ce03 ****/
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
Merges the two solids <s1> and <s2> keeping the parts in each solid of states <tb1> and <tb2>.
") MergeSolids;
		void MergeSolids(const TopoDS_Shape & S1, const TopAbs_State TB1, const TopoDS_Shape & S2, const TopAbs_State TB2);

		/****************** Merged ******************/
		/**** md5 signature: 7bdc189bc9a47f67fd9f80cdcb63b4f7 ****/
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
Returns the merged parts <tb> of shape <s>.
") Merged;
		const TopTools_ListOfShape & Merged(const TopoDS_Shape & S, const TopAbs_State TB);

		/****************** NewEdges ******************/
		/**** md5 signature: 179c09660233c56ae429549db3ff7400 ****/
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
Returns the edges created on curve <i>.
") NewEdges;
		const TopTools_ListOfShape & NewEdges(const Standard_Integer I);

		/****************** NewFaces ******************/
		/**** md5 signature: a980596ca1d4b7e52b84de8438a49893 ****/
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
Returns the faces created on surface <i>.
") NewFaces;
		const TopTools_ListOfShape & NewFaces(const Standard_Integer I);

		/****************** NewVertex ******************/
		/**** md5 signature: 151c4ed04d2f822e39225390e7212a98 ****/
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
Returns the vertex created on point <i>.
") NewVertex;
		const TopoDS_Shape NewVertex(const Standard_Integer I);

		/****************** Opec12 ******************/
		/**** md5 signature: 268c6547389375f1b09e75b513a86e85 ****/
		%feature("compactdefaultargs") Opec12;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Opec12;
		Standard_Boolean Opec12();

		/****************** Opec21 ******************/
		/**** md5 signature: bc5f86386a18ddc164a0ac60f8200c38 ****/
		%feature("compactdefaultargs") Opec21;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Opec21;
		Standard_Boolean Opec21();

		/****************** Opecom ******************/
		/**** md5 signature: 053a40c54e1cc0bb8faf488fd0c329d3 ****/
		%feature("compactdefaultargs") Opecom;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Opecom;
		Standard_Boolean Opecom();

		/****************** Opefus ******************/
		/**** md5 signature: 01bbbe4f2590f9090747ded4821c32ab ****/
		%feature("compactdefaultargs") Opefus;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Opefus;
		Standard_Boolean Opefus();

		/****************** Orient ******************/
		/**** md5 signature: cb4f1770d33b623a1e0a7c8ab1005122 ****/
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
		static TopAbs_Orientation Orient(const TopAbs_Orientation O, const Standard_Boolean R);

		/****************** Perform ******************/
		/**** md5 signature: 737fd9d01d459b713f34117ae5b4b0ed ****/
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
Stores the data structure <hds>, create shapes from the new geometries.
") Perform;
		virtual void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Perform ******************/
		/**** md5 signature: 7a86cedd59eb1018b87e867a0be8a054 ****/
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
Stores the data structure <hds>, create shapes from the new geometries, evaluates if an operation performed on shapes s1,s2 is a particular case.
") Perform;
		virtual void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** PrintCur ******************/
		/**** md5 signature: 98ec9b67ed7893703812ad1922fa4d9a ****/
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

		/****************** PrintGeo ******************/
		/**** md5 signature: fcdc33f7f3f293226fb5c10c1098522b ****/
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

		/****************** PrintOri ******************/
		/**** md5 signature: f27af39a692659cb41a84f88c22b0ac6 ****/
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

		/****************** PrintPnt ******************/
		/**** md5 signature: ec360edf1d0b3a294eef391826f48ec2 ****/
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

		/****************** PrintSur ******************/
		/**** md5 signature: cd992c1708c013efd5314abfac318068 ****/
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

		/****************** RegularizeFace ******************/
		/**** md5 signature: 998970fbafc244d622da1abef353b9e8 ****/
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

		/****************** RegularizeFaces ******************/
		/**** md5 signature: ed456bd66f616fd3827a7c87e7cc0081 ****/
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

		/****************** RegularizeSolid ******************/
		/**** md5 signature: a8f5113cbcb25b3ea747baaec8806865 ****/
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

		/****************** RegularizeSolids ******************/
		/**** md5 signature: 023b4cabd85d5988aebafc464c8ebb7f ****/
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

		/****************** Reverse ******************/
		/**** md5 signature: bb5ff2749921861d58ed428984771825 ****/
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
		static Standard_Boolean Reverse(const TopAbs_State T1, const TopAbs_State T2);

		/****************** Section ******************/
		/**** md5 signature: f246cee73f016b23543f940f4eeec761 ****/
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
Return all section edges.
") Section;
		void Section(TopTools_ListOfShape & L);

		/****************** Section ******************/
		/**** md5 signature: d6808b5660c9276aa346c459a52c09df ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") Section;
		const TopTools_ListOfShape & Section();

		/****************** SectionCurves ******************/
		/**** md5 signature: 609e96865644fd25b811e3f638af3810 ****/
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
Return the section edges built on new curves.
") SectionCurves;
		void SectionCurves(TopTools_ListOfShape & L);

		/****************** SectionEdges ******************/
		/**** md5 signature: 67c9ac40edc1da8c41e99b6f365dd67d ****/
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
Return the parts of edges found on the boundary of the two arguments s1,s2 of perform().
") SectionEdges;
		void SectionEdges(TopTools_ListOfShape & L);

		/****************** ShapePosition ******************/
		/**** md5 signature: 64e62dd569044425ed11cef3de95a5a1 ****/
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

		/****************** ShapeRank ******************/
		/**** md5 signature: 292bc0735bd8e9c20f74537febe0f59e ****/
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
		Standard_Integer ShapeRank(const TopoDS_Shape & S);

		/****************** SplitEvisoONperiodicF ******************/
		/**** md5 signature: cd44d893a3de98a88f8af3ec39ba6e36 ****/
		%feature("compactdefaultargs") SplitEvisoONperiodicF;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SplitEvisoONperiodicF;
		void SplitEvisoONperiodicF();

		/****************** SplitSectionEdge ******************/
		/**** md5 signature: c47bf05ca7a9c41c4726a24fdcff4efc ****/
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
Create parts on solid of section edges.
") SplitSectionEdge;
		virtual void SplitSectionEdge(const TopoDS_Shape & E);

		/****************** SplitSectionEdges ******************/
		/**** md5 signature: 0732b308f7409c9823300dc21836b69a ****/
		%feature("compactdefaultargs") SplitSectionEdges;
		%feature("autodoc", "Return
-------
None

Description
-----------
Create parts on solid of section edges.
") SplitSectionEdges;
		void SplitSectionEdges();

		/****************** Splits ******************/
		/**** md5 signature: 8397a9c8f778283e3e39933da779c78f ****/
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
Returns the split parts <tb> of shape <s>.
") Splits;
		const TopTools_ListOfShape & Splits(const TopoDS_Shape & S, const TopAbs_State TB);

		/****************** StringState ******************/
		/**** md5 signature: bc9ced969562a9a7d1b7ddcf0d9105f2 ****/
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

		/****************** TopType ******************/
		/**** md5 signature: 152faebc9c8f93773f88759bbe313a5d ****/
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
		/****************** TopOpeBRepBuild_BuilderON ******************/
		/**** md5 signature: 93a4d6fc21e372f0dc04fc90113fa649 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_BuilderON;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_BuilderON;
		 TopOpeBRepBuild_BuilderON();

		/****************** TopOpeBRepBuild_BuilderON ******************/
		/**** md5 signature: 5e205533018e9ce622a7cc279f39b8c7 ****/
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

		/****************** GFillONCheckI ******************/
		/**** md5 signature: 98e2bdc7f8443b1a2e1fee4bfb3583ea ****/
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
		Standard_Boolean GFillONCheckI(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** GFillONParts2dWES2 ******************/
		/**** md5 signature: 129b9dfe1de8b2aabf2590f4bf0e9a83 ****/
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

		/****************** GFillONPartsWES1 ******************/
		/**** md5 signature: 860c771dad5e5b425727dab3045ded73 ****/
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

		/****************** GFillONPartsWES2 ******************/
		/**** md5 signature: b41a82402fee8faaab3bcfb720cfde28 ****/
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

		/****************** Perform ******************/
		/**** md5 signature: c1af6c2b05eef14905f470745091359d ****/
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

		/****************** Perform2d ******************/
		/**** md5 signature: c566a45b3c9e229d28eac41630784eba ****/
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
		/****************** TopOpeBRepBuild_CorrectFace2d ******************/
		/**** md5 signature: bca6de8c8f0be2591c3040394f3b1240 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_CorrectFace2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_CorrectFace2d;
		 TopOpeBRepBuild_CorrectFace2d();

		/****************** TopOpeBRepBuild_CorrectFace2d ******************/
		/**** md5 signature: 38ceefb3575429981c491960db36a3a6 ****/
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

		/****************** CheckList ******************/
		/**** md5 signature: 4ff224b9603092fb88ff527e700fea48 ****/
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

		/****************** CorrectedFace ******************/
		/**** md5 signature: 7357b459c86fa687044bc53b4eb86956 ****/
		%feature("compactdefaultargs") CorrectedFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") CorrectedFace;
		const TopoDS_Face CorrectedFace();

		/****************** ErrorStatus ******************/
		/**** md5 signature: c2b5079ef2f8e1a943b7beedcff9e105 ****/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ErrorStatus;
		Standard_Integer ErrorStatus();

		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Face;
		const TopoDS_Face Face();

		/****************** GetP2dFL ******************/
		/**** md5 signature: c5dd9bab0bc1e9edc646e15e869727e7 ****/
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

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** MapOfTrans2dInfo ******************/
		/**** md5 signature: 7d548c5fbb00baafd381f2175bd7d1b9 ****/
		%feature("compactdefaultargs") MapOfTrans2dInfo;
		%feature("autodoc", "Return
-------
TopTools_IndexedDataMapOfShapeShape

Description
-----------
No available documentation.
") MapOfTrans2dInfo;
		TopTools_IndexedDataMapOfShapeShape & MapOfTrans2dInfo();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform();

		/****************** SetMapOfTrans2dInfo ******************/
		/**** md5 signature: 3c1552b59499a267d846553640dd7cc6 ****/
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
		/****************** TopOpeBRepBuild_FaceBuilder ******************/
		/**** md5 signature: bb04ce2e5fa3fcf6b20885083eef5ad9 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_FaceBuilder;
		 TopOpeBRepBuild_FaceBuilder();

		/****************** TopOpeBRepBuild_FaceBuilder ******************/
		/**** md5 signature: 972727f7a388059928fb168bfb9a56b1 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceBuilder;
		%feature("autodoc", "
Parameters
----------
ES: TopOpeBRepBuild_WireEdgeSet
F: TopoDS_Shape
ForceClass: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Create a facebuilder to build the faces on the shapes (wires, blocks of edge) described by <ls>.
") TopOpeBRepBuild_FaceBuilder;
		 TopOpeBRepBuild_FaceBuilder(TopOpeBRepBuild_WireEdgeSet & ES, const TopoDS_Shape & F, const Standard_Boolean ForceClass = Standard_False);

		/****************** AddEdgeWire ******************/
		/**** md5 signature: 930936d9fca54b6e7718e7d9e6ee1ea8 ****/
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
		Standard_Integer AddEdgeWire(const TopoDS_Shape & E, TopoDS_Shape & W);

		/****************** CorrectGclosedWire ******************/
		/**** md5 signature: 8ba05cba805c9cc3f074bef3706738f0 ****/
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

		/****************** DetectPseudoInternalEdge ******************/
		/**** md5 signature: 67730e054697369f0fbc13383710a0de ****/
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
Removes edges appearing twice (forward,reversed) with a bounding vertex not connected to any other edge. mape contains edges found. modifies myblockbuilder.
") DetectPseudoInternalEdge;
		void DetectPseudoInternalEdge(TopTools_IndexedMapOfShape & mapE);

		/****************** DetectUnclosedWire ******************/
		/**** md5 signature: 24fb4792ef17e86cedb1a6ee7dcde55a ****/
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
Removes are non 3d-closed wires. fills up maps <mapvvsameg> and <mapvon1edge>, in order to correct 3d-closed but unclosed (topologic connexity) wires. modifies myblockbuilder.
") DetectUnclosedWire;
		void DetectUnclosedWire(TopTools_IndexedDataMapOfShapeShape & mapVVsameG, TopTools_IndexedDataMapOfShapeShape & mapVon1Edge);

		/****************** Edge ******************/
		/**** md5 signature: 736edb396456a570eb4c4e39335bdcb0 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns current new edge of current new wire.
") Edge;
		const TopoDS_Shape Edge();

		/****************** EdgeConnexity ******************/
		/**** md5 signature: e2b25a341e7e0bd86a6e4fe07b4f09a5 ****/
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
		Standard_Integer EdgeConnexity(const TopoDS_Shape & E);

		/****************** Face ******************/
		/**** md5 signature: 9c9430f314f7a67219d35de85b5a42a5 ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return myface.
") Face;
		const TopoDS_Shape Face();

		/****************** FindNextValidElement ******************/
		/**** md5 signature: 2866d266db213eab6f3eebb99d30a197 ****/
		%feature("compactdefaultargs") FindNextValidElement;
		%feature("autodoc", "Return
-------
None

Description
-----------
Iterates on myblockiterator until finding a valid element.
") FindNextValidElement;
		void FindNextValidElement();

		/****************** InitEdge ******************/
		/**** md5 signature: 07ffd00dda09cc88ab0689563e4db0bc ****/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") InitEdge;
		Standard_Integer InitEdge();

		/****************** InitFace ******************/
		/**** md5 signature: 5ccd5edeaa7f45aeb42ebfd241061344 ****/
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") InitFace;
		Standard_Integer InitFace();

		/****************** InitFaceBuilder ******************/
		/**** md5 signature: bbd1fabf5da938e0451fd428cbf0f83c ****/
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
		void InitFaceBuilder(TopOpeBRepBuild_WireEdgeSet & ES, const TopoDS_Shape & F, const Standard_Boolean ForceClass);

		/****************** InitWire ******************/
		/**** md5 signature: a00546cadc031d2b0a9f1e5a47bc1419 ****/
		%feature("compactdefaultargs") InitWire;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") InitWire;
		Standard_Integer InitWire();

		/****************** IsOldWire ******************/
		/**** md5 signature: 1521223693e136a77675b429f60285dd ****/
		%feature("compactdefaultargs") IsOldWire;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsOldWire;
		Standard_Boolean IsOldWire();

		/****************** MoreEdge ******************/
		/**** md5 signature: 3deabda73e93b20e8a72f2f0ebea4e02 ****/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreEdge;
		Standard_Boolean MoreEdge();

		/****************** MoreFace ******************/
		/**** md5 signature: 9ce280b3ff0f94e82bd4ccb635ad91a7 ****/
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreFace;
		Standard_Boolean MoreFace();

		/****************** MoreWire ******************/
		/**** md5 signature: 3e395c540f4c6c109e2a8394d1728645 ****/
		%feature("compactdefaultargs") MoreWire;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreWire;
		Standard_Boolean MoreWire();

		/****************** NextEdge ******************/
		/**** md5 signature: 8103c946a7f7c0a3d885514a8a740502 ****/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextEdge;
		void NextEdge();

		/****************** NextFace ******************/
		/**** md5 signature: 33ae62d7d15ec80966f0219be1a267db ****/
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextFace;
		void NextFace();

		/****************** NextWire ******************/
		/**** md5 signature: 11b92f2dcc830f98b32d40bd651c0b28 ****/
		%feature("compactdefaultargs") NextWire;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextWire;
		void NextWire();

		/****************** OldWire ******************/
		/**** md5 signature: 867be45bb543914ad8830cba7e10a554 ****/
		%feature("compactdefaultargs") OldWire;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns current wire this wire may be: * an old wire oldwire(), which has not been reconstructed; * a new wire made of edges described by ...newedge() methods.
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
		/****************** TopOpeBRepBuild_FuseFace ******************/
		/**** md5 signature: e413591195cc7fce36b9eafab44de7e4 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_FuseFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_FuseFace;
		 TopOpeBRepBuild_FuseFace();

		/****************** TopOpeBRepBuild_FuseFace ******************/
		/**** md5 signature: 1d1347af1e67e1eb2f036ee42aace0c3 ****/
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
		 TopOpeBRepBuild_FuseFace(const TopTools_ListOfShape & LIF, const TopTools_ListOfShape & LRF, const Standard_Integer CXM);

		/****************** ClearEdge ******************/
		/**** md5 signature: dbef4a0c908b7dfedc92dad3e8fa4166 ****/
		%feature("compactdefaultargs") ClearEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ClearEdge;
		void ClearEdge();

		/****************** ClearVertex ******************/
		/**** md5 signature: ad18db1ffe90787575f3f9dc76fd7768 ****/
		%feature("compactdefaultargs") ClearVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ClearVertex;
		void ClearVertex();

		/****************** Init ******************/
		/**** md5 signature: 3ab2d1d6510508a975935cfc02f2a9e6 ****/
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
		void Init(const TopTools_ListOfShape & LIF, const TopTools_ListOfShape & LRF, const Standard_Integer CXM);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsModified ******************/
		/**** md5 signature: 9c75f71ece8c473c12f072739ddc9f63 ****/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsModified;
		Standard_Boolean IsModified();

		/****************** LExternEdge ******************/
		/**** md5 signature: d520f8b56159e72ebabf207cd3732ec1 ****/
		%feature("compactdefaultargs") LExternEdge;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") LExternEdge;
		const TopTools_ListOfShape & LExternEdge();

		/****************** LExternVertex ******************/
		/**** md5 signature: d70820bd86d74f6deeea1f8e2940536f ****/
		%feature("compactdefaultargs") LExternVertex;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") LExternVertex;
		const TopTools_ListOfShape & LExternVertex();

		/****************** LFuseFace ******************/
		/**** md5 signature: 93d3b6df16912050b3763e9c2bdf4851 ****/
		%feature("compactdefaultargs") LFuseFace;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") LFuseFace;
		const TopTools_ListOfShape & LFuseFace();

		/****************** LInternEdge ******************/
		/**** md5 signature: e5bac6648c8398b4d769fe8817b91fb7 ****/
		%feature("compactdefaultargs") LInternEdge;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") LInternEdge;
		const TopTools_ListOfShape & LInternEdge();

		/****************** LInternVertex ******************/
		/**** md5 signature: d9039c3a70dcd98643ec5d2a7c370cfc ****/
		%feature("compactdefaultargs") LInternVertex;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") LInternVertex;
		const TopTools_ListOfShape & LInternVertex();

		/****************** LModifEdge ******************/
		/**** md5 signature: 887f0e22514e5f8b2b3bc45ce22d6924 ****/
		%feature("compactdefaultargs") LModifEdge;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") LModifEdge;
		const TopTools_ListOfShape & LModifEdge();

		/****************** LModifVertex ******************/
		/**** md5 signature: 021f8f77a3f02418722c038284e4c8b4 ****/
		%feature("compactdefaultargs") LModifVertex;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") LModifVertex;
		const TopTools_ListOfShape & LModifVertex();

		/****************** PerformEdge ******************/
		/**** md5 signature: 56629cb1b52d14f9a2daa66f7719477a ****/
		%feature("compactdefaultargs") PerformEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") PerformEdge;
		void PerformEdge();

		/****************** PerformFace ******************/
		/**** md5 signature: 0f5caf45d02f1bed73a36f953359273a ****/
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
		/****************** TopOpeBRepBuild_GIter ******************/
		/**** md5 signature: 34990a93235c8e3d4bb9295bb82e7aa9 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_GIter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_GIter;
		 TopOpeBRepBuild_GIter();

		/****************** TopOpeBRepBuild_GIter ******************/
		/**** md5 signature: c2e2effc77071f308d325f505c8d3d8c ****/
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

		/****************** Current ******************/
		/**** md5 signature: ec04e3a6ed08aad70b7ace9b09bc6ff4 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "
Parameters
----------
s1: TopAbs_State
s2: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") Current;
		void Current(TopAbs_State & s1, TopAbs_State & s2);

		/****************** Dump ******************/
		/**** md5 signature: e60d722f65a7811be636699da7600e78 ****/
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

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****************** Init ******************/
		/**** md5 signature: b1954f33d1f51bc48115e8585914b10c ****/
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

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
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
		/****************** Dump ******************/
		/**** md5 signature: 7ac13aaed5b6d1996e76f06146a4af9d ****/
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

		/****************** GComDiff ******************/
		/**** md5 signature: 728073c8bdab2220cb285e5911b15d15 ****/
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

		/****************** GComSame ******************/
		/**** md5 signature: 62c2b0137ff9c80018ccf92308d50ef0 ****/
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

		/****************** GComUnsh ******************/
		/**** md5 signature: dfd7bab77d69376accb8feeea644091a ****/
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

		/****************** GCutDiff ******************/
		/**** md5 signature: 2776748e3dc8b3e478db1dc8a70f7447 ****/
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

		/****************** GCutSame ******************/
		/**** md5 signature: d5accbd402a7d9eb72b62f2ebd3c65bc ****/
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

		/****************** GCutUnsh ******************/
		/**** md5 signature: b6ffbcfc3f0fd8b4d27c698f7e0179cd ****/
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

		/****************** GFusDiff ******************/
		/**** md5 signature: ace570c740dd5774e869614c2c1115a7 ****/
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

		/****************** GFusSame ******************/
		/**** md5 signature: bc956f47f5261f960caabc2733af21af ****/
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

		/****************** GFusUnsh ******************/
		/**** md5 signature: 3ca04c0024a9895fdf7bf9316afe53f2 ****/
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
		/****************** TopOpeBRepBuild_GTopo ******************/
		/**** md5 signature: fc43733b46e0b23c7629bbdbe4b9a7d0 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_GTopo;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_GTopo;
		 TopOpeBRepBuild_GTopo();

		/****************** TopOpeBRepBuild_GTopo ******************/
		/**** md5 signature: bc42607302826705d0b102eeadc56de2 ****/
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
		 TopOpeBRepBuild_GTopo(const Standard_Boolean II, const Standard_Boolean IN, const Standard_Boolean IO, const Standard_Boolean NI, const Standard_Boolean NN, const Standard_Boolean NO, const Standard_Boolean OI, const Standard_Boolean ON, const Standard_Boolean OO, const TopAbs_ShapeEnum t1, const TopAbs_ShapeEnum t2, const TopOpeBRepDS_Config C1, const TopOpeBRepDS_Config C2);

		/****************** ChangeConfig ******************/
		/**** md5 signature: 55b5ae6cba23650cf9cba49d45c0be6d ****/
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

		/****************** ChangeType ******************/
		/**** md5 signature: 6d3e04d73efd6515cb6dc1f8eed9e9ab ****/
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

		/****************** ChangeValue ******************/
		/**** md5 signature: b3c3757c9d2cd11cf4499e0c8b41dc14 ****/
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
		void ChangeValue(const Standard_Integer i1, const Standard_Integer i2, const Standard_Boolean b);

		/****************** ChangeValue ******************/
		/**** md5 signature: b914c9ac099cb848353f0399bacfc4c8 ****/
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
		void ChangeValue(const TopAbs_State s1, const TopAbs_State s2, const Standard_Boolean b);

		/****************** Config1 ******************/
		/**** md5 signature: d6bdb88b5c25e150d56a96c1cd0b6f7e ****/
		%feature("compactdefaultargs") Config1;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Config

Description
-----------
No available documentation.
") Config1;
		TopOpeBRepDS_Config Config1();

		/****************** Config2 ******************/
		/**** md5 signature: b774f70112b999c3f3f0d033a3dee75d ****/
		%feature("compactdefaultargs") Config2;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Config

Description
-----------
No available documentation.
") Config2;
		TopOpeBRepDS_Config Config2();

		/****************** CopyPermuted ******************/
		/**** md5 signature: f0eed418380da84a80cd0b8e375792b2 ****/
		%feature("compactdefaultargs") CopyPermuted;
		%feature("autodoc", "Return
-------
TopOpeBRepBuild_GTopo

Description
-----------
No available documentation.
") CopyPermuted;
		TopOpeBRepBuild_GTopo CopyPermuted();

		/****************** Dump ******************/
		/**** md5 signature: 8c9af92dbb883764baa3ebb3e5b82f7c ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
s: Standard_Address (optional, default to NULL)

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		virtual void Dump(std::ostream &OutValue, const Standard_Address s = NULL);

		/****************** DumpSSB ******************/
		/**** md5 signature: f191eecc210b5827d05e7cd4594ead98 ****/
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
		static void DumpSSB(std::ostream &OutValue, const TopAbs_State s1, const TopAbs_State s2, const Standard_Boolean b);

		/****************** DumpType ******************/
		/**** md5 signature: 958d66f716a6ca18d4ec9ac299b310e2 ****/
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

		/****************** DumpVal ******************/
		/**** md5 signature: 8a87e48d25d7176e71c93b30dca770f3 ****/
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

		/****************** GIndex ******************/
		/**** md5 signature: 139dc2b2cf616d5e5205293f4637e677 ****/
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
		Standard_Integer GIndex(const TopAbs_State S);

		/****************** GState ******************/
		/**** md5 signature: d507e1b22ce648b493d4e2c23498ae74 ****/
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
		TopAbs_State GState(const Standard_Integer I);

		/****************** Index ******************/
		/**** md5 signature: 05425477b633eee8d01debea3ee3c150 ****/
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
		void Index(const Standard_Integer II, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** IsToReverse1 ******************/
		/**** md5 signature: b34cbee9202a98b4388caba35468ccae ****/
		%feature("compactdefaultargs") IsToReverse1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsToReverse1;
		Standard_Boolean IsToReverse1();

		/****************** IsToReverse2 ******************/
		/**** md5 signature: e19b83ad9ce47713046bf8c0d6b88a42 ****/
		%feature("compactdefaultargs") IsToReverse2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsToReverse2;
		Standard_Boolean IsToReverse2();

		/****************** Reset ******************/
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reset;
		void Reset();

		/****************** Reverse ******************/
		/**** md5 signature: f19cd0298ea10fb1ffed610ba2473b46 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Reverse;
		Standard_Boolean Reverse();

		/****************** Set ******************/
		/**** md5 signature: 1eb5139c3c13c9ee6f55221189d5a61d ****/
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
		void Set(const Standard_Boolean II, const Standard_Boolean IN, const Standard_Boolean IO, const Standard_Boolean NI, const Standard_Boolean NN, const Standard_Boolean NO, const Standard_Boolean OI, const Standard_Boolean ON, const Standard_Boolean OO);

		/****************** SetReverse ******************/
		/**** md5 signature: ac9a6ca181d5b4bfa5691fc119c26cc2 ****/
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
		void SetReverse(const Standard_Boolean rev);

		/****************** StatesON ******************/
		/**** md5 signature: e33d4816eb157a2c15a70772cb8691e2 ****/
		%feature("compactdefaultargs") StatesON;
		%feature("autodoc", "
Parameters
----------
s1: TopAbs_State
s2: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") StatesON;
		void StatesON(TopAbs_State & s1, TopAbs_State & s2);

		/****************** Type ******************/
		/**** md5 signature: b633f41f768e9f9c4f3d7b446ad113bf ****/
		%feature("compactdefaultargs") Type;
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
") Type;
		void Type(TopAbs_ShapeEnum & t1, TopAbs_ShapeEnum & t2);

		/****************** Value ******************/
		/**** md5 signature: b540e3f24fd7559697bc1e352720e2a3 ****/
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
		Standard_Boolean Value(const TopAbs_State s1, const TopAbs_State s2);

		/****************** Value ******************/
		/**** md5 signature: 51e0bee32bbeca558543f4379daea9e4 ****/
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
		Standard_Boolean Value(const Standard_Integer I1, const Standard_Integer I2);

		/****************** Value ******************/
		/**** md5 signature: bab97e558269b8b45b97aa307a8bd97c ****/
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
		Standard_Boolean Value(const Standard_Integer II);

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
		/****************** TopOpeBRepBuild_HBuilder ******************/
		/**** md5 signature: 5b5c582d55aa7cd7da248a4aae95967e ****/
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

		/****************** BuildTool ******************/
		/**** md5 signature: 8f00b58c6dc4bbbf0701f98004c469fd ****/
		%feature("compactdefaultargs") BuildTool;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_BuildTool

Description
-----------
No available documentation.
") BuildTool;
		const TopOpeBRepDS_BuildTool & BuildTool();

		/****************** ChangeBuildTool ******************/
		/**** md5 signature: f18366a59aef2f912961e1fc0d178930 ****/
		%feature("compactdefaultargs") ChangeBuildTool;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_BuildTool

Description
-----------
No available documentation.
") ChangeBuildTool;
		TopOpeBRepDS_BuildTool & ChangeBuildTool();

		/****************** ChangeBuilder ******************/
		/**** md5 signature: 2dacea8f27fdff55fc1de9cf82466ce4 ****/
		%feature("compactdefaultargs") ChangeBuilder;
		%feature("autodoc", "Return
-------
TopOpeBRepBuild_Builder

Description
-----------
No available documentation.
") ChangeBuilder;
		TopOpeBRepBuild_Builder & ChangeBuilder();

		/****************** ChangeNewEdges ******************/
		/**** md5 signature: 24fbbb7f955fea89043bb83eca2a9717 ****/
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
Returns the edges created on curve <i>.
") ChangeNewEdges;
		TopTools_ListOfShape & ChangeNewEdges(const Standard_Integer I);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all split and merge already performed. does not clear the handled ds.
") Clear;
		void Clear();

		/****************** CurrentSection ******************/
		/**** md5 signature: d448545aa275d0bbbc56cde80b47a1e6 ****/
		%feature("compactdefaultargs") CurrentSection;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") CurrentSection;
		const TopoDS_Shape CurrentSection();

		/****************** DataStructure ******************/
		/**** md5 signature: c5d3d5af4f8db2375e9c48f16eb16363 ****/
		%feature("compactdefaultargs") DataStructure;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>

Description
-----------
Returns the ds handled by this builder.
") DataStructure;
		opencascade::handle<TopOpeBRepDS_HDataStructure> DataStructure();

		/****************** EdgeCurveAncestors ******************/
		/**** md5 signature: 5e9edf4b24ffd8613debed35f8ead0bb ****/
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
Search for the couple of face f1,f2 (from arguments of supra perform(s1,s2,hds)) method which intersection gives section edge e built on an intersection curve. returns true if f1,f2 have been valued. returns false if e is not a section edge built on intersection curve ic.
") EdgeCurveAncestors;
		Standard_Boolean EdgeCurveAncestors(const TopoDS_Shape & E, TopoDS_Shape & F1, TopoDS_Shape & F2, Standard_Integer &OutValue);

		/****************** EdgeSectionAncestors ******************/
		/**** md5 signature: e2c91c74becf0432ad708c98d403dc94 ****/
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
Search for the couple of face f1,f2 (from arguments of supra perform(s1,s2,hds)) method which intersection gives section edge e built on at least one edge . returns true if f1,f2 have been valued. returns false if e is not a section edge built on at least one edge of s1 and/or s2. le1,le2 are edges of s1,s2 which common part is edge e. le1 or le2 may be empty() but not both.
") EdgeSectionAncestors;
		Standard_Boolean EdgeSectionAncestors(const TopoDS_Shape & E, TopTools_ListOfShape & LF1, TopTools_ListOfShape & LF2, TopTools_ListOfShape & LE1, TopTools_ListOfShape & LE2);

		/****************** GetDSCurveFromSectEdge ******************/
		/**** md5 signature: 85b52fb22de7e38bb1ce4013c0559d97 ****/
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
		Standard_Integer GetDSCurveFromSectEdge(const TopoDS_Shape & SectEdge);

		/****************** GetDSEdgeFromSectEdge ******************/
		/**** md5 signature: 7d5760ef2d37f9bf40a31723933aef40 ****/
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
		Standard_Integer GetDSEdgeFromSectEdge(const TopoDS_Shape & E, const Standard_Integer rank);

		/****************** GetDSFaceFromDSCurve ******************/
		/**** md5 signature: 6398e46beb43dcb7ef994842413d9e74 ****/
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
		Standard_Integer GetDSFaceFromDSCurve(const Standard_Integer indexCur, const Standard_Integer rank);

		/****************** GetDSFaceFromDSEdge ******************/
		/**** md5 signature: 7d920de72aa673c39273d79dc0b88c7b ****/
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
		TColStd_ListOfInteger & GetDSFaceFromDSEdge(const Standard_Integer indexEdg, const Standard_Integer rank);

		/****************** GetDSPointFromNewVertex ******************/
		/**** md5 signature: b5eb2341390865d0e383b8e13745b1bf ****/
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
		Standard_Integer GetDSPointFromNewVertex(const TopoDS_Shape & NewVert);

		/****************** InitExtendedSectionDS ******************/
		/**** md5 signature: b3e82110db1a002054cbcf596dfbc837 ****/
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
		void InitExtendedSectionDS(const Standard_Integer k = 3);

		/****************** InitSection ******************/
		/**** md5 signature: f822babf751016272aad50e4d220f5ea ****/
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
		void InitSection(const Standard_Integer k = 3);

		/****************** IsKPart ******************/
		/**** md5 signature: 7d539b64e4a4d593d9f8d0b73d6fd635 ****/
		%feature("compactdefaultargs") IsKPart;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 0 is standard operation, != 0 if particular case.
") IsKPart;
		Standard_Integer IsKPart();

		/****************** IsMerged ******************/
		/**** md5 signature: 858a082dbdb44d34f2c3122338c615a2 ****/
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
Returns true if the shape <s> has been merged.
") IsMerged;
		Standard_Boolean IsMerged(const TopoDS_Shape & S, const TopAbs_State ToBuild);

		/****************** IsSplit ******************/
		/**** md5 signature: acf7884b561006ec090062f3d96cbdfd ****/
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
Returns true if the shape <s> has been split.
") IsSplit;
		Standard_Boolean IsSplit(const TopoDS_Shape & S, const TopAbs_State ToBuild);

		/****************** MergeKPart ******************/
		/**** md5 signature: c5fda5909055a56871433a38fd623adb ****/
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

		/****************** MergeShapes ******************/
		/**** md5 signature: 636b2f3679903a68befa397bca4894b5 ****/
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
Merges the two shapes <s1> and <s2> keeping the parts of states <tb1>,<tb2> in <s1>,<s2>.
") MergeShapes;
		void MergeShapes(const TopoDS_Shape & S1, const TopAbs_State TB1, const TopoDS_Shape & S2, const TopAbs_State TB2);

		/****************** MergeSolid ******************/
		/**** md5 signature: dadbcac87fb02bfa7f2c7004eb8c0e8f ****/
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
Merges the solid <s> keeping the parts of state <tb>.
") MergeSolid;
		void MergeSolid(const TopoDS_Shape & S, const TopAbs_State TB);

		/****************** MergeSolids ******************/
		/**** md5 signature: ad6aa825ea70349a881f7c3ac9f6ce03 ****/
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
Merges the two solids <s1> and <s2> keeping the parts in each solid of states <tb1> and <tb2>.
") MergeSolids;
		void MergeSolids(const TopoDS_Shape & S1, const TopAbs_State TB1, const TopoDS_Shape & S2, const TopAbs_State TB2);

		/****************** Merged ******************/
		/**** md5 signature: 5c0e56fe667dc50fee7311d6ee9408f7 ****/
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
Returns the merged parts <tobuild> of shape <s>.
") Merged;
		const TopTools_ListOfShape & Merged(const TopoDS_Shape & S, const TopAbs_State ToBuild);

		/****************** MoreSection ******************/
		/**** md5 signature: 31ef6857806c3db53f082158d428e76b ****/
		%feature("compactdefaultargs") MoreSection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreSection;
		Standard_Boolean MoreSection();

		/****************** NewEdges ******************/
		/**** md5 signature: 179c09660233c56ae429549db3ff7400 ****/
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
Returns the edges created on curve <i>.
") NewEdges;
		const TopTools_ListOfShape & NewEdges(const Standard_Integer I);

		/****************** NewFaces ******************/
		/**** md5 signature: a980596ca1d4b7e52b84de8438a49893 ****/
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
Returns the faces created on surface <i>.
") NewFaces;
		const TopTools_ListOfShape & NewFaces(const Standard_Integer I);

		/****************** NewVertex ******************/
		/**** md5 signature: 151c4ed04d2f822e39225390e7212a98 ****/
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
Returns the vertex created on point <i>.
") NewVertex;
		const TopoDS_Shape NewVertex(const Standard_Integer I);

		/****************** NextSection ******************/
		/**** md5 signature: 43c27ad5f4227c4f31a1669f9df81a20 ****/
		%feature("compactdefaultargs") NextSection;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextSection;
		void NextSection();

		/****************** Perform ******************/
		/**** md5 signature: fe804a95bbd0d24fa265bd6d304ec2f0 ****/
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
Stores the data structure <hds>, create shapes from the new geometries described in <hds>.
") Perform;
		void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Perform ******************/
		/**** md5 signature: 1f49b3f64921986178453699330b0d8d ****/
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
Same as previous + evaluates if an operation performed on shapes s1,s2 is a particular case.
") Perform;
		void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** Section ******************/
		/**** md5 signature: d6808b5660c9276aa346c459a52c09df ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") Section;
		const TopTools_ListOfShape & Section();

		/****************** Splits ******************/
		/**** md5 signature: ea2be644a14946c6b65d2930b297a6ca ****/
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
Returns the split parts <tobuild> of shape <s>.
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
		/****************** TopOpeBRepBuild_Loop ******************/
		/**** md5 signature: f3dc9513544cd778e3c934a1b3478d27 ****/
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

		/****************** TopOpeBRepBuild_Loop ******************/
		/**** md5 signature: a9791f8a239b8f2965bf8eadc5a96e09 ****/
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

		/****************** BlockIterator ******************/
		/**** md5 signature: dacd603fbd6db0513733493b9c4a223e ****/
		%feature("compactdefaultargs") BlockIterator;
		%feature("autodoc", "Return
-------
TopOpeBRepBuild_BlockIterator

Description
-----------
No available documentation.
") BlockIterator;
		const TopOpeBRepBuild_BlockIterator & BlockIterator();

		/****************** Dump ******************/
		/**** md5 signature: 73b0c773468e8cceaf80d621d09b8350 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		virtual void Dump();

		/****************** IsShape ******************/
		/**** md5 signature: 8eb3ceac5fd0323d4df58a0604f59141 ****/
		%feature("compactdefaultargs") IsShape;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsShape;
		virtual Standard_Boolean IsShape();

		/****************** Shape ******************/
		/**** md5 signature: 337d0a309daba4934b247f345f1078fd ****/
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
		/****************** Compare ******************/
		/**** md5 signature: db1e708fef844b7eb3ac56e781142a23 ****/
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
Returns the state of loop <l1> compared with loop <l2>.
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
		/****************** TopOpeBRepBuild_LoopSet ******************/
		/**** md5 signature: a3de5838952cba4d621f6ed8013c2c0c ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_LoopSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_LoopSet;
		 TopOpeBRepBuild_LoopSet();

		/****************** ChangeListOfLoop ******************/
		/**** md5 signature: ce1fa4aeb54a18519d4bbe913aeeb5eb ****/
		%feature("compactdefaultargs") ChangeListOfLoop;
		%feature("autodoc", "Return
-------
TopOpeBRepBuild_ListOfLoop

Description
-----------
No available documentation.
") ChangeListOfLoop;
		TopOpeBRepBuild_ListOfLoop & ChangeListOfLoop();

		/****************** InitLoop ******************/
		/**** md5 signature: a4df8a77ba2719bab7c447a81e3a1574 ****/
		%feature("compactdefaultargs") InitLoop;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitLoop;
		virtual void InitLoop();

		/****************** Loop ******************/
		/**** md5 signature: ddfe19c212ce4c6c1b7b56a01ad4f9f3 ****/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepBuild_Loop>

Description
-----------
No available documentation.
") Loop;
		virtual opencascade::handle<TopOpeBRepBuild_Loop> Loop();

		/****************** MoreLoop ******************/
		/**** md5 signature: e5e0d7ea835c9794e64c37698a66ba8b ****/
		%feature("compactdefaultargs") MoreLoop;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreLoop;
		virtual Standard_Boolean MoreLoop();

		/****************** NextLoop ******************/
		/**** md5 signature: d99b3deb5badef1842f96552e38bc9a4 ****/
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
		/****************** TopOpeBRepBuild_ShapeListOfShape ******************/
		/**** md5 signature: 3414dce0de992b0ae41fe9bdb28809e4 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeListOfShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_ShapeListOfShape;
		 TopOpeBRepBuild_ShapeListOfShape();

		/****************** TopOpeBRepBuild_ShapeListOfShape ******************/
		/**** md5 signature: 12df71569993260a08c1a465caa334e3 ****/
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

		/****************** TopOpeBRepBuild_ShapeListOfShape ******************/
		/**** md5 signature: 73a51e79da9638a63d33626d34f51997 ****/
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

		/****************** ChangeList ******************/
		/**** md5 signature: 927c82612e8db4f53a52c292eac277bf ****/
		%feature("compactdefaultargs") ChangeList;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") ChangeList;
		TopTools_ListOfShape & ChangeList();

		/****************** ChangeShape ******************/
		/**** md5 signature: 465c12175fb924e02c35f2de6caf5b49 ****/
		%feature("compactdefaultargs") ChangeShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ChangeShape;
		TopoDS_Shape ChangeShape();

		/****************** List ******************/
		/**** md5 signature: cc162aad0d1c12f449760720eff4e228 ****/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") List;
		const TopTools_ListOfShape & List();

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
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
		/****************** TopOpeBRepBuild_ShapeSet ******************/
		/**** md5 signature: 8cac23cad0c430403128bc6dd52b342a ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeSet;
		%feature("autodoc", "
Parameters
----------
SubShapeType: TopAbs_ShapeEnum
checkshape: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a shapeset in order to build shapes connected by <subshapetype> shapes. <checkshape>:check (or not) the shapes, startelements, elements added.
") TopOpeBRepBuild_ShapeSet;
		 TopOpeBRepBuild_ShapeSet(const TopAbs_ShapeEnum SubShapeType, const Standard_Boolean checkshape = Standard_True);

		/****************** AddElement ******************/
		/**** md5 signature: a0c83dd931e5b348d22c96fc7e34b0be ****/
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
For each subshape se of s of type mysubshapetype - add subshapes of s to the map of subshapes (mysubshapemap) - add s to the list of shape incident to subshapes of s.
") AddElement;
		virtual void AddElement(const TopoDS_Shape & S);

		/****************** AddShape ******************/
		/**** md5 signature: c53353d34d3c27129aeecdacd6371580 ****/
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
Adds <s> to the list of shapes. (wires or shells).
") AddShape;
		virtual void AddShape(const TopoDS_Shape & S);

		/****************** AddStartElement ******************/
		/**** md5 signature: dc55f23481a00125b9138d890be42a76 ****/
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
(s is a face or edge) add s to the list of starting shapes used for reconstructions. apply addelement(s).
") AddStartElement;
		virtual void AddStartElement(const TopoDS_Shape & S);

		/****************** ChangeStartShapes ******************/
		/**** md5 signature: c10364be3af9e4ba91c965ae5b9fbb48 ****/
		%feature("compactdefaultargs") ChangeStartShapes;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") ChangeStartShapes;
		TopTools_ListOfShape & ChangeStartShapes();

		/****************** CheckShape ******************/
		/**** md5 signature: 461c9759e29765eca640f151dbae9d66 ****/
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
		void CheckShape(const Standard_Boolean checkshape);

		/****************** CheckShape ******************/
		/**** md5 signature: fcac9468eb05529e5e4952bad5c986b2 ****/
		%feature("compactdefaultargs") CheckShape;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CheckShape;
		Standard_Boolean CheckShape();

		/****************** CheckShape ******************/
		/**** md5 signature: 2608e837f5be1a2a46550ed224bfa9eb ****/
		%feature("compactdefaultargs") CheckShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
checkgeom: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
No available documentation.
") CheckShape;
		Standard_Boolean CheckShape(const TopoDS_Shape & S, const Standard_Boolean checkgeom = Standard_False);

		/****************** DEBName ******************/
		/**** md5 signature: 5e2926cd2a4caba9b436420af088c28e ****/
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

		/****************** DEBName ******************/
		/**** md5 signature: 596c83e886c46038e831ad6994742c89 ****/
		%feature("compactdefaultargs") DEBName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") DEBName;
		const TCollection_AsciiString & DEBName();

		/****************** DEBNumber ******************/
		/**** md5 signature: 2a906c667a5fd97a5580c80472018611 ****/
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
		void DEBNumber(const Standard_Integer I);

		/****************** DEBNumber ******************/
		/**** md5 signature: bf0881903128002059823140365b2ef9 ****/
		%feature("compactdefaultargs") DEBNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") DEBNumber;
		Standard_Integer DEBNumber();

		/****************** DumpBB ******************/
		/**** md5 signature: eb911931adf297046e3668db5b0bd70c ****/
		%feature("compactdefaultargs") DumpBB;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") DumpBB;
		virtual void DumpBB();

		/****************** DumpCheck ******************/
		/**** md5 signature: a08a701cbae28cab87a77d32a92880ac ****/
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
		void DumpCheck(std::ostream &OutValue, TCollection_AsciiString str, const TopoDS_Shape & S, const Standard_Boolean chk);

		/****************** DumpName ******************/
		/**** md5 signature: e73ae5ec230cf0b21dee0ddf6cc25888 ****/
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

		/****************** DumpSS ******************/
		/**** md5 signature: cdc9acb51bec94239bc4daf1ba078420 ****/
		%feature("compactdefaultargs") DumpSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") DumpSS;
		virtual void DumpSS();

		/****************** FindNeighbours ******************/
		/**** md5 signature: 9a7c7975c0fac78768adfbf3c69765cd ****/
		%feature("compactdefaultargs") FindNeighbours;
		%feature("autodoc", "Return
-------
None

Description
-----------
Build the list of neighbour shapes of mycurrentshape (neighbour shapes and mycurrentshapes are of type t) initialize myincidentshapesiter on neighbour shapes.
") FindNeighbours;
		virtual void FindNeighbours();

		/****************** InitNeighbours ******************/
		/**** md5 signature: a0cea7a8b3678ed63469bf531857236b ****/
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

		/****************** InitShapes ******************/
		/**** md5 signature: fadc3dab1e665e61d118295d0ffef841 ****/
		%feature("compactdefaultargs") InitShapes;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitShapes;
		void InitShapes();

		/****************** InitStartElements ******************/
		/**** md5 signature: d4e886530c21ee2f20773115c58aa61a ****/
		%feature("compactdefaultargs") InitStartElements;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitStartElements;
		void InitStartElements();

		/****************** MakeNeighboursList ******************/
		/**** md5 signature: ba275a0df860337ef714aabbdb773c42 ****/
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

		/****************** MaxNumberSubShape ******************/
		/**** md5 signature: 39936ab208ea601537f3741361126ad2 ****/
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
		Standard_Integer MaxNumberSubShape(const TopoDS_Shape & Shape);

		/****************** MoreNeighbours ******************/
		/**** md5 signature: 720945ae0a73511c76486bac94c2d412 ****/
		%feature("compactdefaultargs") MoreNeighbours;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreNeighbours;
		Standard_Boolean MoreNeighbours();

		/****************** MoreShapes ******************/
		/**** md5 signature: 3d47f71adfef1ff96a784095945ed044 ****/
		%feature("compactdefaultargs") MoreShapes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreShapes;
		Standard_Boolean MoreShapes();

		/****************** MoreStartElements ******************/
		/**** md5 signature: 97cd23c1aeded90304f9af2d294da3bb ****/
		%feature("compactdefaultargs") MoreStartElements;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreStartElements;
		Standard_Boolean MoreStartElements();

		/****************** Neighbour ******************/
		/**** md5 signature: 58db2ce92796f96724d4caf28e03dabd ****/
		%feature("compactdefaultargs") Neighbour;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Neighbour;
		const TopoDS_Shape Neighbour();

		/****************** NextNeighbour ******************/
		/**** md5 signature: 535f68a9b46f1974ababc8486870b0f4 ****/
		%feature("compactdefaultargs") NextNeighbour;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextNeighbour;
		void NextNeighbour();

		/****************** NextShape ******************/
		/**** md5 signature: 156dbccf2699d90c62d3b8c5b2d3ac79 ****/
		%feature("compactdefaultargs") NextShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextShape;
		void NextShape();

		/****************** NextStartElement ******************/
		/**** md5 signature: 297039843eabc0572b4c9b2613425226 ****/
		%feature("compactdefaultargs") NextStartElement;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextStartElement;
		void NextStartElement();

		/****************** SName ******************/
		/**** md5 signature: 7cac2bc1cde427670fc87937c4197971 ****/
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

		/****************** SName ******************/
		/**** md5 signature: aae50302d53b33cbeb1c320b118dd208 ****/
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

		/****************** SNameori ******************/
		/**** md5 signature: 38c70945225dd056fbf42066df8d01f7 ****/
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

		/****************** SNameori ******************/
		/**** md5 signature: e4676f5575125dd0147b7098e8a6d83e ****/
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

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

		/****************** StartElement ******************/
		/**** md5 signature: b59b01c3e9566e26cf0675119a661c56 ****/
		%feature("compactdefaultargs") StartElement;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") StartElement;
		const TopoDS_Shape StartElement();

		/****************** StartElements ******************/
		/**** md5 signature: 4df71127781e1f235af21a1e6e23cfbe ****/
		%feature("compactdefaultargs") StartElements;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Return a reference on mystartshapes.
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
		/****************** TopOpeBRepBuild_ShellToSolid ******************/
		/**** md5 signature: 3ec5c30834dc38a95b9f02fdcbbec343 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellToSolid;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_ShellToSolid;
		 TopOpeBRepBuild_ShellToSolid();

		/****************** AddShell ******************/
		/**** md5 signature: faaf3f93bf2b074b026cc92dd3f89969 ****/
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

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****************** MakeSolids ******************/
		/**** md5 signature: 21e2e0d94d3e8642730310fafa826ec3 ****/
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
		/****************** TopOpeBRepBuild_SolidBuilder ******************/
		/**** md5 signature: e5c243cabed9eda62c2fb92b7bbf54aa ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_SolidBuilder;
		 TopOpeBRepBuild_SolidBuilder();

		/****************** TopOpeBRepBuild_SolidBuilder ******************/
		/**** md5 signature: c3d5d08be1728f7e26f00fdb2dc94db4 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidBuilder;
		%feature("autodoc", "
Parameters
----------
FS: TopOpeBRepBuild_ShellFaceSet
ForceClass: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Create a solidbuilder to build the areas on the shapes (shells, blocks of faces) described by <ls>.
") TopOpeBRepBuild_SolidBuilder;
		 TopOpeBRepBuild_SolidBuilder(TopOpeBRepBuild_ShellFaceSet & FS, const Standard_Boolean ForceClass = Standard_False);

		/****************** Face ******************/
		/**** md5 signature: 9c9430f314f7a67219d35de85b5a42a5 ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns current new face of current new shell.
") Face;
		const TopoDS_Shape Face();

		/****************** InitFace ******************/
		/**** md5 signature: 5ccd5edeaa7f45aeb42ebfd241061344 ****/
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") InitFace;
		Standard_Integer InitFace();

		/****************** InitShell ******************/
		/**** md5 signature: 4ededd2a0112b3ad7c46ad1ec236171e ****/
		%feature("compactdefaultargs") InitShell;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") InitShell;
		Standard_Integer InitShell();

		/****************** InitSolid ******************/
		/**** md5 signature: 98da71bfec721d5f7ce0c4f8e02b2ff4 ****/
		%feature("compactdefaultargs") InitSolid;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") InitSolid;
		Standard_Integer InitSolid();

		/****************** InitSolidBuilder ******************/
		/**** md5 signature: e9fb6d56c4831e268527e52426370fe6 ****/
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
		void InitSolidBuilder(TopOpeBRepBuild_ShellFaceSet & FS, const Standard_Boolean ForceClass);

		/****************** IsOldShell ******************/
		/**** md5 signature: ad4035745a6a73d7dbdfd07fd0c23cfc ****/
		%feature("compactdefaultargs") IsOldShell;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsOldShell;
		Standard_Boolean IsOldShell();

		/****************** MoreFace ******************/
		/**** md5 signature: 9ce280b3ff0f94e82bd4ccb635ad91a7 ****/
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreFace;
		Standard_Boolean MoreFace();

		/****************** MoreShell ******************/
		/**** md5 signature: 9123faff7480a9cd91e7d3a7625f4cdb ****/
		%feature("compactdefaultargs") MoreShell;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreShell;
		Standard_Boolean MoreShell();

		/****************** MoreSolid ******************/
		/**** md5 signature: 5ee3bbd33c116381ecefd1329f583d7b ****/
		%feature("compactdefaultargs") MoreSolid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreSolid;
		Standard_Boolean MoreSolid();

		/****************** NextFace ******************/
		/**** md5 signature: 33ae62d7d15ec80966f0219be1a267db ****/
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextFace;
		void NextFace();

		/****************** NextShell ******************/
		/**** md5 signature: acf25ab192bbd1382fada471f35632f3 ****/
		%feature("compactdefaultargs") NextShell;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextShell;
		void NextShell();

		/****************** NextSolid ******************/
		/**** md5 signature: e2d23a7fdbf80f754adbb385c434e821 ****/
		%feature("compactdefaultargs") NextSolid;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextSolid;
		void NextSolid();

		/****************** OldShell ******************/
		/**** md5 signature: 50e7fb892ac0baaa4a78e899a50e0c64 ****/
		%feature("compactdefaultargs") OldShell;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns current shell this shell may be: * an old shell oldshell(), which has not been reconstructed; * a new shell made of faces described by ...newface() methods.
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
		/****************** CheckFaceClosed2d ******************/
		/**** md5 signature: 0e75b5d7973ce3491011235a2dfacdde ****/
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
Checks if <theface> has the properly closed in 2d boundary(ies).
") CheckFaceClosed2d;
		static Standard_Boolean CheckFaceClosed2d(const TopoDS_Face & theFace);

		/****************** CorrectCurveOnSurface ******************/
		/**** md5 signature: 6905c91646d7e9a0f42d85b6b5057819 ****/
		%feature("compactdefaultargs") CorrectCurveOnSurface;
		%feature("autodoc", "
Parameters
----------
aS: TopoDS_Shape
aTolMax: float (optional, default to 0.0001)

Return
-------
None

Description
-----------
No available documentation.
") CorrectCurveOnSurface;
		static void CorrectCurveOnSurface(const TopoDS_Shape & aS, const Standard_Real aTolMax = 0.0001);

		/****************** CorrectFace2d ******************/
		/**** md5 signature: 206f599953928f496dc8cf6c49d3a7c7 ****/
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
Test if uv representation of <oldface> is good (i.e. face is closed in 2d). if face is not closed , this method will try to close such face and will return corrected edges in the <amapofcorrect2dedges>. parameter <asourceshapes> used to fix the edge (or wires) which should be correct (corrector used it as a start shapes). note: parameter corrface doesn't mean anything. if you want to use this method , rebuild resulting face after by yourself using corrected edges.
") CorrectFace2d;
		static void CorrectFace2d(const TopoDS_Shape & oldFace, TopoDS_Shape & corrFace, const TopTools_IndexedMapOfOrientedShape & aSourceShapes, TopTools_IndexedDataMapOfShapeShape & aMapOfCorrect2dEdges);

		/****************** CorrectPointOnCurve ******************/
		/**** md5 signature: c1db9f6028b3ca834df782031511b27b ****/
		%feature("compactdefaultargs") CorrectPointOnCurve;
		%feature("autodoc", "
Parameters
----------
aS: TopoDS_Shape
aTolMax: float (optional, default to 0.0001)

Return
-------
None

Description
-----------
No available documentation.
") CorrectPointOnCurve;
		static void CorrectPointOnCurve(const TopoDS_Shape & aS, const Standard_Real aTolMax = 0.0001);

		/****************** CorrectTolerances ******************/
		/**** md5 signature: b3a964efbabb9889af0ab8060a0feb04 ****/
		%feature("compactdefaultargs") CorrectTolerances;
		%feature("autodoc", "
Parameters
----------
aS: TopoDS_Shape
aTolMax: float (optional, default to 0.0001)

Return
-------
None

Description
-----------
No available documentation.
") CorrectTolerances;
		static void CorrectTolerances(const TopoDS_Shape & aS, const Standard_Real aTolMax = 0.0001);

		/****************** FindState ******************/
		/**** md5 signature: d0be414c9abba9a9b4a6f4d083e61924 ****/
		%feature("compactdefaultargs") FindState;
		%feature("autodoc", "
Parameters
----------
aVertex: TopoDS_Shape
aState: TopAbs_State
aShapeEnum: TopAbs_ShapeEnum
aMapVertexEdges: TopTools_IndexedDataMapOfShapeListOfShape
aMapProcessedVertices: TopTools_MapOfShape
aMapVs: TopOpeBRepDS_DataMapOfShapeState

Return
-------
None

Description
-----------
No available documentation.
") FindState;
		static void FindState(const TopoDS_Shape & aVertex, const TopAbs_State aState, const TopAbs_ShapeEnum aShapeEnum, const TopTools_IndexedDataMapOfShapeListOfShape & aMapVertexEdges, TopTools_MapOfShape & aMapProcessedVertices, TopOpeBRepDS_DataMapOfShapeState & aMapVs);

		/****************** FindState1 ******************/
		/**** md5 signature: e7b49f353a8b9b5a44b6980a914f9203 ****/
		%feature("compactdefaultargs") FindState1;
		%feature("autodoc", "
Parameters
----------
anEdge: TopoDS_Shape
aState: TopAbs_State
aMapEdgesFaces: TopTools_IndexedDataMapOfShapeListOfShape
aMapProcessedVertices: TopTools_MapOfShape
aMapVs: TopOpeBRepDS_DataMapOfShapeState

Return
-------
None

Description
-----------
No available documentation.
") FindState1;
		static void FindState1(const TopoDS_Shape & anEdge, const TopAbs_State aState, const TopTools_IndexedDataMapOfShapeListOfShape & aMapEdgesFaces, TopTools_MapOfShape & aMapProcessedVertices, TopOpeBRepDS_DataMapOfShapeState & aMapVs);

		/****************** FindState2 ******************/
		/**** md5 signature: 012be84ed6597538d3bcce0fe30880a2 ****/
		%feature("compactdefaultargs") FindState2;
		%feature("autodoc", "
Parameters
----------
anEdge: TopoDS_Shape
aState: TopAbs_State
aMapEdgesFaces: TopTools_IndexedDataMapOfShapeListOfShape
aMapProcessedEdges: TopTools_MapOfShape
aMapVs: TopOpeBRepDS_DataMapOfShapeState

Return
-------
None

Description
-----------
No available documentation.
") FindState2;
		static void FindState2(const TopoDS_Shape & anEdge, const TopAbs_State aState, const TopTools_IndexedDataMapOfShapeListOfShape & aMapEdgesFaces, TopTools_MapOfShape & aMapProcessedEdges, TopOpeBRepDS_DataMapOfShapeState & aMapVs);

		/****************** FindStateThroughVertex ******************/
		/**** md5 signature: 999d9435114cb35519cae290b653e843 ****/
		%feature("compactdefaultargs") FindStateThroughVertex;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aShapeClassifier: TopOpeBRepTool_ShapeClassifier
aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState
anAvoidSubshMap: TopTools_MapOfShape

Return
-------
TopAbs_State

Description
-----------
No available documentation.
") FindStateThroughVertex;
		static TopAbs_State FindStateThroughVertex(const TopoDS_Shape & aShape, TopOpeBRepTool_ShapeClassifier & aShapeClassifier, TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState, const TopTools_MapOfShape & anAvoidSubshMap);

		/****************** GetAdjacentFace ******************/
		/**** md5 signature: 79467950ed91570880da889ce1c93776 ****/
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
		static Standard_Boolean GetAdjacentFace(const TopoDS_Shape & aFaceObj, const TopoDS_Shape & anEObj, const TopTools_IndexedDataMapOfShapeListOfShape & anEdgeFaceMap, TopoDS_Shape & anAdjFaceObj);

		/****************** GetNormalInNearestPoint ******************/
		/**** md5 signature: 2de9145b3d4393a457510776ac33fd9a ****/
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
This function used to compute normal in point which is located near the point with param uv (used for computation of normals where the normal in the point uv equal to zero).
") GetNormalInNearestPoint;
		static void GetNormalInNearestPoint(const TopoDS_Face & aFace, const TopoDS_Edge & anEdge, gp_Vec & aNormal);

		/****************** GetNormalToFaceOnEdge ******************/
		/**** md5 signature: 87fae39bcd5cabc104cd7535652da643 ****/
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

		/****************** GetTangentToEdge ******************/
		/**** md5 signature: 7dddfdf93830884fe3c389409356b027 ****/
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
		static Standard_Boolean GetTangentToEdge(const TopoDS_Edge & anEdgeObj, gp_Vec & aTangent);

		/****************** GetTangentToEdgeEdge ******************/
		/**** md5 signature: 7adac84e7084afe44380091fb1d5c9b8 ****/
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
		static Standard_Boolean GetTangentToEdgeEdge(const TopoDS_Face & aFObj, const TopoDS_Edge & anEdgeObj, const TopoDS_Edge & aOriEObj, gp_Vec & aTangent);

		/****************** IsDegEdgesTheSame ******************/
		/**** md5 signature: 5141734277d11308b456723f708348ed ****/
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
		static Standard_Boolean IsDegEdgesTheSame(const TopoDS_Shape & anE1, const TopoDS_Shape & anE2);

		/****************** NormalizeFace ******************/
		/**** md5 signature: 4fbabeb25073ee18ab15ff5a131e6e4b ****/
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
Test if <oldface> does not contain internal or external edges and remove such edges in case of its presence. the result is stored in <corrface>.
") NormalizeFace;
		static void NormalizeFace(const TopoDS_Shape & oldFace, TopoDS_Shape & corrFace);

		/****************** PropagateState ******************/
		/**** md5 signature: e70fffbd99c4570113cbcfab33706e0e ****/
		%feature("compactdefaultargs") PropagateState;
		%feature("autodoc", "
Parameters
----------
aSplEdgesState: TopOpeBRepDS_DataMapOfShapeState
anEdgesToRestMap: TopTools_IndexedMapOfShape
aShapeEnum1: TopAbs_ShapeEnum
aShapeEnum2: TopAbs_ShapeEnum
aShapeClassifier: TopOpeBRepTool_ShapeClassifier
aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState
anUnkStateShapes: TopTools_MapOfShape

Return
-------
None

Description
-----------
No available documentation.
") PropagateState;
		static void PropagateState(const TopOpeBRepDS_DataMapOfShapeState & aSplEdgesState, const TopTools_IndexedMapOfShape & anEdgesToRestMap, const TopAbs_ShapeEnum aShapeEnum1, const TopAbs_ShapeEnum aShapeEnum2, TopOpeBRepTool_ShapeClassifier & aShapeClassifier, TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState, const TopTools_MapOfShape & anUnkStateShapes);

		/****************** PropagateStateForWires ******************/
		/**** md5 signature: 9a328a726bee73304b00b3827ac0ae33 ****/
		%feature("compactdefaultargs") PropagateStateForWires;
		%feature("autodoc", "
Parameters
----------
aFacesToRestMap: TopTools_IndexedMapOfShape
aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState

Return
-------
None

Description
-----------
No available documentation.
") PropagateStateForWires;
		static void PropagateStateForWires(const TopTools_IndexedMapOfShape & aFacesToRestMap, TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState);

		/****************** SpreadStateToChild ******************/
		/**** md5 signature: 7337bd429b7c4dd60dc75af962ea54ac ****/
		%feature("compactdefaultargs") SpreadStateToChild;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aState: TopAbs_State
aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState

Return
-------
None

Description
-----------
No available documentation.
") SpreadStateToChild;
		static void SpreadStateToChild(const TopoDS_Shape & aShape, const TopAbs_State aState, TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState);

		/****************** UpdateEdgeOnFace ******************/
		/**** md5 signature: 0d1af09a3eb8715da0da9ee1af537b49 ****/
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
Recompute pcurve of the edge on the newface.
") UpdateEdgeOnFace;
		static void UpdateEdgeOnFace(const TopoDS_Edge & aEdgeToUpdate, const TopoDS_Face & OldFace, const TopoDS_Face & NewFace);

		/****************** UpdateEdgeOnPeriodicalFace ******************/
		/**** md5 signature: 6c25f82fec61a156498f3a8500a373bb ****/
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
Recompute pcurves of the closing (sim , with 2 pcurves) edge on the newface.
") UpdateEdgeOnPeriodicalFace;
		static void UpdateEdgeOnPeriodicalFace(const TopoDS_Edge & aEdgeToUpdate, const TopoDS_Face & OldFace, const TopoDS_Face & NewFace);

		/****************** UpdatePCurves ******************/
		/**** md5 signature: c92765c6ba973440b52c80b79faeb463 ****/
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
Recompute pcurves of the all edges from the wire on the <toface>.
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
		/****************** DumpMapOfShapeVertexInfo ******************/
		/**** md5 signature: d62adccf063e5baea2644fba23faf778 ****/
		%feature("compactdefaultargs") DumpMapOfShapeVertexInfo;
		%feature("autodoc", "
Parameters
----------
aMap: TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo

Return
-------
None

Description
-----------
No available documentation.
") DumpMapOfShapeVertexInfo;
		static void DumpMapOfShapeVertexInfo(const TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & aMap);

		/****************** MakeMapOfShapeVertexInfo ******************/
		/**** md5 signature: 830b53a76a432b6e238eb7d9597fed7c ****/
		%feature("compactdefaultargs") MakeMapOfShapeVertexInfo;
		%feature("autodoc", "
Parameters
----------
aWire: TopoDS_Wire
aMap: TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo

Return
-------
None

Description
-----------
No available documentation.
") MakeMapOfShapeVertexInfo;
		static void MakeMapOfShapeVertexInfo(const TopoDS_Wire & aWire, TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & aMap);

		/****************** Path ******************/
		/**** md5 signature: 4d443cc93ca769d1c089f1ea7d030f6c ****/
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
		/****************** TopOpeBRepBuild_VertexInfo ******************/
		/**** md5 signature: 6d829d36a8c3188d3f1c482facaeea18 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_VertexInfo;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_VertexInfo;
		 TopOpeBRepBuild_VertexInfo();

		/****************** AddIn ******************/
		/**** md5 signature: 58d2a5f6a6c93b0f15849308d23b58ba ****/
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

		/****************** AddOut ******************/
		/**** md5 signature: b5f9d9dc93f658df1834881b676295d6 ****/
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

		/****************** AppendPassed ******************/
		/**** md5 signature: dd48d2302d507ad9e8db9e351286fc22 ****/
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

		/****************** ChangeEdgesOut ******************/
		/**** md5 signature: f693a86b9204ddfaa5e7a2fc87d67feb ****/
		%feature("compactdefaultargs") ChangeEdgesOut;
		%feature("autodoc", "Return
-------
TopTools_IndexedMapOfOrientedShape

Description
-----------
No available documentation.
") ChangeEdgesOut;
		TopTools_IndexedMapOfOrientedShape & ChangeEdgesOut();

		/****************** CurrentOut ******************/
		/**** md5 signature: a060894e8825e40a1faca922a5ca0772 ****/
		%feature("compactdefaultargs") CurrentOut;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") CurrentOut;
		const TopoDS_Edge CurrentOut();

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****************** EdgesIn ******************/
		/**** md5 signature: a22df5f7efb0930ed8e78478e4843791 ****/
		%feature("compactdefaultargs") EdgesIn;
		%feature("autodoc", "Return
-------
TopTools_IndexedMapOfOrientedShape

Description
-----------
No available documentation.
") EdgesIn;
		const TopTools_IndexedMapOfOrientedShape & EdgesIn();

		/****************** EdgesOut ******************/
		/**** md5 signature: 8a73d68345cb827140bf9b062c32613d ****/
		%feature("compactdefaultargs") EdgesOut;
		%feature("autodoc", "Return
-------
TopTools_IndexedMapOfOrientedShape

Description
-----------
No available documentation.
") EdgesOut;
		const TopTools_IndexedMapOfOrientedShape & EdgesOut();

		/****************** FoundOut ******************/
		/**** md5 signature: b8c39522998889dce19214cb041a807c ****/
		%feature("compactdefaultargs") FoundOut;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FoundOut;
		Standard_Integer FoundOut();

		/****************** ListPassed ******************/
		/**** md5 signature: 805adaea35119f2d1a4a3133e12c5055 ****/
		%feature("compactdefaultargs") ListPassed;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") ListPassed;
		const TopTools_ListOfShape & ListPassed();

		/****************** NbCases ******************/
		/**** md5 signature: dadf008e17192a9c13d80c5487f28b41 ****/
		%feature("compactdefaultargs") NbCases;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCases;
		Standard_Integer NbCases();

		/****************** Prepare ******************/
		/**** md5 signature: d56ab4c07334edf2527815cd62813bbc ****/
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

		/****************** RemovePassed ******************/
		/**** md5 signature: 795e0b26ead769e8637abe035a752173 ****/
		%feature("compactdefaultargs") RemovePassed;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") RemovePassed;
		void RemovePassed();

		/****************** SetCurrentIn ******************/
		/**** md5 signature: 7ac4b279b190ff7e1f3e357517e715ef ****/
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

		/****************** SetSmart ******************/
		/**** md5 signature: 94b0106071625f2fb1a2b69a06af6603 ****/
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
		void SetSmart(const Standard_Boolean aFlag);

		/****************** SetVertex ******************/
		/**** md5 signature: 9085895b4fbc0ab8ea8c037e0f93a293 ****/
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

		/****************** Smart ******************/
		/**** md5 signature: e469db07f570975f92b2e6c63df5ac91 ****/
		%feature("compactdefaultargs") Smart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Smart;
		Standard_Boolean Smart();

		/****************** Vertex ******************/
		/**** md5 signature: 84212ff79cd7d64cd0ebfa6f17214e90 ****/
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
		/****************** TopOpeBRepBuild_WireToFace ******************/
		/**** md5 signature: ff81b73db4e599d15a329ad93442f2c9 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_WireToFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_WireToFace;
		 TopOpeBRepBuild_WireToFace();

		/****************** AddWire ******************/
		/**** md5 signature: 1783c94be1e4c0421c48f950e049b792 ****/
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

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****************** MakeFaces ******************/
		/**** md5 signature: 113bf019a6bd6242a1483cbc24621b3a ****/
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
		/****************** TopOpeBRepBuild_Area1dBuilder ******************/
		/**** md5 signature: a5bea6ca7fd1232b130e6a0e8c89865e ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area1dBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_Area1dBuilder;
		 TopOpeBRepBuild_Area1dBuilder();

		/****************** TopOpeBRepBuild_Area1dBuilder ******************/
		/**** md5 signature: 472d79f21ebc378f4aee21b8a98acb39 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area1dBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_PaveSet
LC: TopOpeBRepBuild_PaveClassifier
ForceClass: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a area1dbuilder to find the areas of the shapes described by <ls> using the classifier <lc>.
") TopOpeBRepBuild_Area1dBuilder;
		 TopOpeBRepBuild_Area1dBuilder(TopOpeBRepBuild_PaveSet & LS, TopOpeBRepBuild_PaveClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** ADD_LISTOFLoop_TO_LISTOFLoop ******************/
		/**** md5 signature: cce2bfb0b28db6ed3c34ecd764f6a94b ****/
		%feature("compactdefaultargs") ADD_LISTOFLoop_TO_LISTOFLoop;
		%feature("autodoc", "
Parameters
----------
LOL1: TopOpeBRepBuild_ListOfLoop
LOL2: TopOpeBRepBuild_ListOfLoop
s: Standard_Address (optional, default to NULL)
s1: Standard_Address (optional, default to NULL)
s2: Standard_Address (optional, default to NULL)

Return
-------
None

Description
-----------
No available documentation.
") ADD_LISTOFLoop_TO_LISTOFLoop;
		virtual void ADD_LISTOFLoop_TO_LISTOFLoop(TopOpeBRepBuild_ListOfLoop & LOL1, TopOpeBRepBuild_ListOfLoop & LOL2, const Standard_Address s = NULL, const Standard_Address s1 = NULL, const Standard_Address s2 = NULL);

		/****************** ADD_Loop_TO_LISTOFLoop ******************/
		/**** md5 signature: 5f93e158a9ec4859e4f5a7250d715fc0 ****/
		%feature("compactdefaultargs") ADD_Loop_TO_LISTOFLoop;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepBuild_Loop
LOL: TopOpeBRepBuild_ListOfLoop
s: Standard_Address (optional, default to NULL)

Return
-------
None

Description
-----------
No available documentation.
") ADD_Loop_TO_LISTOFLoop;
		virtual void ADD_Loop_TO_LISTOFLoop(const opencascade::handle<TopOpeBRepBuild_Loop> & L, TopOpeBRepBuild_ListOfLoop & LOL, const Standard_Address s = NULL);

		/****************** DumpList ******************/
		/**** md5 signature: e9d72d364cc193cbca306597b01d0f13 ****/
		%feature("compactdefaultargs") DumpList;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepBuild_ListOfLoop

Return
-------
None

Description
-----------
No available documentation.
") DumpList;
		static void DumpList(const TopOpeBRepBuild_ListOfLoop & L);

		/****************** InitAreaBuilder ******************/
		/**** md5 signature: 8c7aad7e5f4f2a4b357109939fbb8dfa ****/
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets a area1dbuilder to find the areas of the shapes described by <ls> using the classifier <lc>.
") InitAreaBuilder;
		virtual void InitAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** REM_Loop_FROM_LISTOFLoop ******************/
		/**** md5 signature: 1776b470d008a97797c02d461f264154 ****/
		%feature("compactdefaultargs") REM_Loop_FROM_LISTOFLoop;
		%feature("autodoc", "
Parameters
----------
ITLOL: TopOpeBRepBuild_ListIteratorOfListOfLoop
LOL: TopOpeBRepBuild_ListOfLoop
s: Standard_Address (optional, default to NULL)

Return
-------
None

Description
-----------
No available documentation.
") REM_Loop_FROM_LISTOFLoop;
		virtual void REM_Loop_FROM_LISTOFLoop(TopOpeBRepBuild_ListIteratorOfListOfLoop & ITLOL, TopOpeBRepBuild_ListOfLoop & LOL, const Standard_Address s = NULL);

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
		/****************** TopOpeBRepBuild_Area2dBuilder ******************/
		/**** md5 signature: ea96eca58adabb983d09a1a1b6091ff6 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area2dBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_Area2dBuilder;
		 TopOpeBRepBuild_Area2dBuilder();

		/****************** TopOpeBRepBuild_Area2dBuilder ******************/
		/**** md5 signature: 1cb9d29575e614536a44e1c903ed89df ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area2dBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a area2dbuilder to build faces on the (wires,blocks of edge) of <ls>, using the classifier <lc>.
") TopOpeBRepBuild_Area2dBuilder;
		 TopOpeBRepBuild_Area2dBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** InitAreaBuilder ******************/
		/**** md5 signature: 8c7aad7e5f4f2a4b357109939fbb8dfa ****/
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets a area1dbuilder to find the areas of the shapes described by <ls> using the classifier <lc>.
") InitAreaBuilder;
		virtual void InitAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

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
		/****************** TopOpeBRepBuild_Area3dBuilder ******************/
		/**** md5 signature: 5d760883cbd8eb32bf26b3c6359d9b77 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area3dBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_Area3dBuilder;
		 TopOpeBRepBuild_Area3dBuilder();

		/****************** TopOpeBRepBuild_Area3dBuilder ******************/
		/**** md5 signature: a280a0b3d09cb8711116bc09853ce2ff ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area3dBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a area3dbuilder to build solids on the (shells,blocks of face) of <ls>, using the classifier <lc>.
") TopOpeBRepBuild_Area3dBuilder;
		 TopOpeBRepBuild_Area3dBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** InitAreaBuilder ******************/
		/**** md5 signature: 8c7aad7e5f4f2a4b357109939fbb8dfa ****/
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets a area1dbuilder to find the areas of the shapes described by <ls> using the classifier <lc>.
") InitAreaBuilder;
		virtual void InitAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

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
		/****************** TopOpeBRepBuild_Builder1 ******************/
		/**** md5 signature: 9c7f5fbdcb561a7101894ec06354919b ****/
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

		/****************** Clear ******************/
		/**** md5 signature: f671931d03948860d0ead34afbe920aa ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all splits and merges already performed. does not clear the handled ds (except shapewithstatesmaps).
") Clear;
		virtual void Clear();

		/****************** CorrectResult2d ******************/
		/**** md5 signature: 645d1dac440271c467d83b71012f7698 ****/
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
		Standard_Integer CorrectResult2d(TopoDS_Shape & aResult);

		/****************** GFillEdgeNotSameDomWES ******************/
		/**** md5 signature: 556dc0ad0eaa64b0a2eb21e31b97d4da ****/
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

		/****************** GFillEdgeSameDomWES ******************/
		/**** md5 signature: f6fe3136ee571d8dccfc3197b686ae61 ****/
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

		/****************** GFillFaceNotSameDomSFS ******************/
		/**** md5 signature: bc7d540d0c624d1d59aec97c19cce9a6 ****/
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

		/****************** GFillFaceNotSameDomWES ******************/
		/**** md5 signature: dc742f072a6ea8c32195c0d83c0ed981 ****/
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

		/****************** GFillFaceSameDomSFS ******************/
		/**** md5 signature: 771ac3553c5297c08d3ff1f69e92d152 ****/
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

		/****************** GFillFaceSameDomWES ******************/
		/**** md5 signature: 9528d965c1a6631cce1b62a509121c53 ****/
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

		/****************** GFillShellSFS ******************/
		/**** md5 signature: 6829a6c02f53fba72e6c51b5f8b4e091 ****/
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

		/****************** GFillSolidSFS ******************/
		/**** md5 signature: 6433de7a2c74ee5812488b8cae67ca10 ****/
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

		/****************** GFillWireNotSameDomWES ******************/
		/**** md5 signature: 3eec9760a22ba496207d37d836afd4a8 ****/
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

		/****************** GFillWireSameDomWES ******************/
		/**** md5 signature: c6ca20e24a3971713ddb09cf63bc01dc ****/
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

		/****************** GWESMakeFaces ******************/
		/**** md5 signature: abfe2371d1cb6f9c8b15417bda121393 ****/
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

		/****************** MergeKPart ******************/
		/**** md5 signature: 70af060183df6c4bd7c3388fbba1eb38 ****/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MergeKPart;
		virtual void MergeKPart();

		/****************** MergeKPart ******************/
		/**** md5 signature: d27699f93b9ba1973fbf7d8ce8b05ce5 ****/
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

		/****************** Perform ******************/
		/**** md5 signature: e4b167b8287d05c97ea333f88905dbee ****/
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
		virtual void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Perform ******************/
		/**** md5 signature: 2dea56f1f6d2cee871965c98424ca999 ****/
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
		virtual void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** PerformONParts ******************/
		/**** md5 signature: 37dd525c9986fe42972c9b8c426cc012 ****/
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

		/****************** PerformPieceIn2D ******************/
		/**** md5 signature: 24484486c3e11c2ceede45c45b34066e ****/
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

		/****************** PerformPieceOn2D ******************/
		/**** md5 signature: cfb631f3035dbbcd1f108f498f908e85 ****/
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
		Standard_Integer PerformPieceOn2D(const TopoDS_Shape & aPieceObj, const TopoDS_Shape & aFaceObj, const TopoDS_Shape & aEdgeObj, TopTools_ListOfShape & aListOfPieces, TopTools_ListOfShape & aListOfFaces, TopTools_ListOfShape & aListOfPiecesOut2d);

		/****************** TwoPiecesON ******************/
		/**** md5 signature: 8777c83a6aa6e0d4953f3f8bde3af8da ****/
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
		Standard_Integer TwoPiecesON(const TopTools_SequenceOfShape & aSeq, TopTools_ListOfShape & aListOfPieces, TopTools_ListOfShape & aListOfFaces, TopTools_ListOfShape & aListOfPiecesOut2d);

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
		/****************** Compare ******************/
		/**** md5 signature: ca2b365fd2720fd9e2ed093e173bef92 ****/
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
		virtual TopAbs_State Compare(const opencascade::handle<TopOpeBRepBuild_Loop> & L1, const opencascade::handle<TopOpeBRepBuild_Loop> & L2);

		/****************** CompareElement ******************/
		/**** md5 signature: b306ffc04e91669ecc429350dbcccea4 ****/
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
Add element <e> in the set of elements used in classification. returns false if the element <e> has been already added to the set of elements, otherwise returns true.
") CompareElement;
		virtual Standard_Boolean CompareElement(const TopoDS_Shape & E);

		/****************** CompareElementToShape ******************/
		/**** md5 signature: bd5d7b75f82d8019008ec5c9aa72c3f6 ****/
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
Classify element <e> with shape <b>.
") CompareElementToShape;
		virtual TopAbs_State CompareElementToShape(const TopoDS_Shape & E, const TopoDS_Shape & B);

		/****************** CompareShapes ******************/
		/**** md5 signature: e01f02a4a0658a2496d401f4677136a6 ****/
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
Classify shape <b1> with shape <b2>.
") CompareShapes;
		virtual TopAbs_State CompareShapes(const TopoDS_Shape & B1, const TopoDS_Shape & B2);

		/****************** ResetElement ******************/
		/**** md5 signature: 25fb7988cef7fe4a96b1786bfe86e03d ****/
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
Prepare classification involving element <e>.
") ResetElement;
		virtual void ResetElement(const TopoDS_Shape & E);

		/****************** ResetShape ******************/
		/**** md5 signature: 2ee1a95aba4e9d5590b7812827dd463b ****/
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
Prepare classification involving shape <b> calls resetelement on first element of <b>.
") ResetShape;
		virtual void ResetShape(const TopoDS_Shape & B);

		/****************** State ******************/
		/**** md5 signature: 0604ca1bab9b663cd8e4e1804e67747c ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns state of classification of 2d point, defined by resetelement, with the current set of elements, defined by compare.
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
		/****************** TopOpeBRepBuild_Pave ******************/
		/**** md5 signature: 6fad9681efbcdfb8bed1844b6a8545bd ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_Pave;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Shape
P: float
bound: bool

Return
-------
None

Description
-----------
V = vertex, p = parameter of vertex <v> bound = true if <v> is an old vertex bound = false if <v> is a new vertex.
") TopOpeBRepBuild_Pave;
		 TopOpeBRepBuild_Pave(const TopoDS_Shape & V, const Standard_Real P, const Standard_Boolean bound);

		/****************** ChangeVertex ******************/
		/**** md5 signature: 118bc92b60bb2a4e67149d3849444bf0 ****/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ChangeVertex;
		TopoDS_Shape ChangeVertex();

		/****************** Dump ******************/
		/**** md5 signature: 0122bc94dff7b9dabc6bcac8a9f7fc02 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		virtual void Dump();

		/****************** HasSameDomain ******************/
		/**** md5 signature: 7207d58c7520a24b5061660fedcd5541 ****/
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
		void HasSameDomain(const Standard_Boolean b);

		/****************** HasSameDomain ******************/
		/**** md5 signature: 68549b32d844d9239066fd74202bf104 ****/
		%feature("compactdefaultargs") HasSameDomain;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasSameDomain;
		Standard_Boolean HasSameDomain();

		/****************** InterferenceType ******************/
		/**** md5 signature: 6af8508bed73354b450a7f29fd330a6e ****/
		%feature("compactdefaultargs") InterferenceType;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Kind

Description
-----------
No available documentation.
") InterferenceType;
		TopOpeBRepDS_Kind & InterferenceType();

		/****************** IsShape ******************/
		/**** md5 signature: eb502d25fcc43c87d67c669dfdc822a6 ****/
		%feature("compactdefaultargs") IsShape;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsShape;
		virtual Standard_Boolean IsShape();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter();

		/****************** Parameter ******************/
		/**** md5 signature: d48e33dbbc7159622c8478305cf66c96 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Par: float

Return
-------
None

Description
-----------
No available documentation.
") Parameter;
		void Parameter(const Standard_Real Par);

		/****************** SameDomain ******************/
		/**** md5 signature: ad991614a675b8a392bd5bdce16986c6 ****/
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

		/****************** SameDomain ******************/
		/**** md5 signature: 17401c88eae9f0306791fc40186b86f5 ****/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") SameDomain;
		const TopoDS_Shape SameDomain();

		/****************** Shape ******************/
		/**** md5 signature: 4c53ed19ee4f622b00adfb8349b3ab9d ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		virtual const TopoDS_Shape Shape();

		/****************** Vertex ******************/
		/**** md5 signature: 4b1334c642d4415d88330a5fa6216463 ****/
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
		/****************** TopOpeBRepBuild_PaveClassifier ******************/
		/**** md5 signature: 2fa7015d3f8cc0748010f7c2fbe91c47 ****/
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
Create a pave classifier to compare vertices on edge <e>.
") TopOpeBRepBuild_PaveClassifier;
		 TopOpeBRepBuild_PaveClassifier(const TopoDS_Shape & E);

		/****************** AdjustCase ******************/
		/**** md5 signature: 9f91a66734a96094285b64df28a5b90e ****/
		%feature("compactdefaultargs") AdjustCase;
		%feature("autodoc", "
Parameters
----------
p1: float
o: TopAbs_Orientation
first: float
period: float
tol: float

Return
-------
cas: int

Description
-----------
No available documentation.
") AdjustCase;
		static Standard_Real AdjustCase(const Standard_Real p1, const TopAbs_Orientation o, const Standard_Real first, const Standard_Real period, const Standard_Real tol, Standard_Integer &OutValue);

		/****************** ClosedVertices ******************/
		/**** md5 signature: 0dc4b2a655fd07d935e1f6e0014021be ****/
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
		void ClosedVertices(const Standard_Boolean B);

		/****************** Compare ******************/
		/**** md5 signature: 99a2ab1ce45df50cf5fc86747778b3af ****/
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
Returns state of vertex <l1> compared with <l2>.
") Compare;
		TopAbs_State Compare(const opencascade::handle<TopOpeBRepBuild_Loop> & L1, const opencascade::handle<TopOpeBRepBuild_Loop> & L2);

		/****************** SetFirstParameter ******************/
		/**** md5 signature: 97cd631fff0005c549c005d59f9b13ae ****/
		%feature("compactdefaultargs") SetFirstParameter;
		%feature("autodoc", "
Parameters
----------
P: float

Return
-------
None

Description
-----------
No available documentation.
") SetFirstParameter;
		void SetFirstParameter(const Standard_Real P);

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
		/****************** TopOpeBRepBuild_PaveSet ******************/
		/**** md5 signature: 67c1829eafba7278c461b400444c539f ****/
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
Create a pave set on edge <e>. it contains <e> vertices.
") TopOpeBRepBuild_PaveSet;
		 TopOpeBRepBuild_PaveSet(const TopoDS_Shape & E);

		/****************** Append ******************/
		/**** md5 signature: 413ba2c781bd7c21d7dc73f4f6e0519f ****/
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
Add <pv> in the pave set.
") Append;
		void Append(const opencascade::handle<TopOpeBRepBuild_Pave> & PV);

		/****************** ClosedVertices ******************/
		/**** md5 signature: 854f6d9c481bae71dd6fa8e13e3bbfb3 ****/
		%feature("compactdefaultargs") ClosedVertices;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ClosedVertices;
		Standard_Boolean ClosedVertices();

		/****************** Edge ******************/
		/**** md5 signature: be590cff987799d8b7c28083399d0e9f ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") Edge;
		const TopoDS_Edge Edge();

		/****************** EqualParameters ******************/
		/**** md5 signature: 1842977beac3bee2013490aa8405412b ****/
		%feature("compactdefaultargs") EqualParameters;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") EqualParameters;
		Standard_Real EqualParameters();

		/****************** HasEqualParameters ******************/
		/**** md5 signature: 7a51836935303c49fca0c9b00174e02d ****/
		%feature("compactdefaultargs") HasEqualParameters;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasEqualParameters;
		Standard_Boolean HasEqualParameters();

		/****************** InitLoop ******************/
		/**** md5 signature: 9aada3105d553aa39264d7709b1ac322 ****/
		%feature("compactdefaultargs") InitLoop;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitLoop;
		virtual void InitLoop();

		/****************** Loop ******************/
		/**** md5 signature: 615eb1a481912b47ebf79c852b7294cb ****/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepBuild_Loop>

Description
-----------
No available documentation.
") Loop;
		virtual opencascade::handle<TopOpeBRepBuild_Loop> Loop();

		/****************** MoreLoop ******************/
		/**** md5 signature: 69bd496933748dc2d37e0ef38dfe5eb9 ****/
		%feature("compactdefaultargs") MoreLoop;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreLoop;
		virtual Standard_Boolean MoreLoop();

		/****************** NextLoop ******************/
		/**** md5 signature: 1424666d4c451507cc72b55836dce0cf ****/
		%feature("compactdefaultargs") NextLoop;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextLoop;
		virtual void NextLoop();

		/****************** RemovePV ******************/
		/**** md5 signature: a83a93f2e04a0d12fddc2216ea904b6f ****/
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
		void RemovePV(const Standard_Boolean B);

		/****************** SortPave ******************/
		/**** md5 signature: 00ad8a48882788445fcf122554ce7700 ****/
		%feature("compactdefaultargs") SortPave;
		%feature("autodoc", "
Parameters
----------
Lin: TopOpeBRepBuild_ListOfPave
Lout: TopOpeBRepBuild_ListOfPave

Return
-------
None

Description
-----------
No available documentation.
") SortPave;
		static void SortPave(const TopOpeBRepBuild_ListOfPave & Lin, TopOpeBRepBuild_ListOfPave & Lout);

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
		/****************** TopOpeBRepBuild_ShellFaceSet ******************/
		/**** md5 signature: 92cda05c597af841ee44572a0dc2e72c ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellFaceSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a shellfaceset to build blocks of faces connected by edges.
") TopOpeBRepBuild_ShellFaceSet;
		 TopOpeBRepBuild_ShellFaceSet();

		/****************** TopOpeBRepBuild_ShellFaceSet ******************/
		/**** md5 signature: 9cfb16deac6442dc78179585f0e82019 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellFaceSet;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Addr: Standard_Address (optional, default to NULL)

Return
-------
None

Description
-----------
Creates a shellfaceset to build blocks of faces connected by edges.
") TopOpeBRepBuild_ShellFaceSet;
		 TopOpeBRepBuild_ShellFaceSet(const TopoDS_Shape & S, const Standard_Address Addr = NULL);

		/****************** AddElement ******************/
		/**** md5 signature: c0fd7b9ad7268cebbd92d15ddcc6f276 ****/
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
		virtual void AddElement(const TopoDS_Shape & S);

		/****************** AddShape ******************/
		/**** md5 signature: c8bb56d3b44db84675e80800af165998 ****/
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
		virtual void AddShape(const TopoDS_Shape & S);

		/****************** AddStartElement ******************/
		/**** md5 signature: 0f01e210fb7a175f660a12f4c0c9c395 ****/
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
		virtual void AddStartElement(const TopoDS_Shape & S);

		/****************** DumpSS ******************/
		/**** md5 signature: 6402ba15bdfcafa3cb26f476267e90da ****/
		%feature("compactdefaultargs") DumpSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") DumpSS;
		virtual void DumpSS();

		/****************** SName ******************/
		/**** md5 signature: 5f80868d1c4c398e024d63f986d494cc ****/
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

		/****************** SName ******************/
		/**** md5 signature: 439aa61e703e5a53a45918a05c2d0318 ****/
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

		/****************** SNameori ******************/
		/**** md5 signature: 13d091dc5a1df5e5b76408b1cf7882ab ****/
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

		/****************** SNameori ******************/
		/**** md5 signature: 5a9c43c224cad506161a5139631efdf6 ****/
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

		/****************** Solid ******************/
		/**** md5 signature: 0e70c03e20bb23e014ac5417ea4abe26 ****/
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
		/****************** TopOpeBRepBuild_WireEdgeSet ******************/
		/**** md5 signature: 9e72944cc17474a662be59b12653b74e ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_WireEdgeSet;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
Addr: Standard_Address (optional, default to NULL)

Return
-------
None

Description
-----------
Creates a wireedgeset to build edges connected by vertices on face f. edges of the wireedgeset must have a representation on surface of face f.
") TopOpeBRepBuild_WireEdgeSet;
		 TopOpeBRepBuild_WireEdgeSet(const TopoDS_Shape & F, const Standard_Address Addr = NULL);

		/****************** AddElement ******************/
		/**** md5 signature: c0fd7b9ad7268cebbd92d15ddcc6f276 ****/
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
		virtual void AddElement(const TopoDS_Shape & S);

		/****************** AddShape ******************/
		/**** md5 signature: c8bb56d3b44db84675e80800af165998 ****/
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
		virtual void AddShape(const TopoDS_Shape & S);

		/****************** AddStartElement ******************/
		/**** md5 signature: 0f01e210fb7a175f660a12f4c0c9c395 ****/
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
		virtual void AddStartElement(const TopoDS_Shape & S);

		/****************** DumpSS ******************/
		/**** md5 signature: 6402ba15bdfcafa3cb26f476267e90da ****/
		%feature("compactdefaultargs") DumpSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") DumpSS;
		virtual void DumpSS();

		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Value of field myface.
") Face;
		const TopoDS_Face Face();

		/****************** FindNeighbours ******************/
		/**** md5 signature: 9c6e1802ff5feb36028534b42d4f4a96 ****/
		%feature("compactdefaultargs") FindNeighbours;
		%feature("autodoc", "Return
-------
None

Description
-----------
Build the list of neighbour edges of edge mycurrentshape initialize iterator of neighbour edges to edge mycurrentshape.
") FindNeighbours;
		virtual void FindNeighbours();

		/****************** InitNeighbours ******************/
		/**** md5 signature: 08041087a2fe82df6310461976fa7fbc ****/
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
		virtual void InitNeighbours(const TopoDS_Shape & E);

		/****************** IsUVISO ******************/
		/**** md5 signature: c62241f095fc6393c07cfca1ce3a6a5b ****/
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

		/****************** MakeNeighboursList ******************/
		/**** md5 signature: 76e7c89107969695f3dd5f4055661445 ****/
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

		/****************** SName ******************/
		/**** md5 signature: 5f80868d1c4c398e024d63f986d494cc ****/
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

		/****************** SName ******************/
		/**** md5 signature: 439aa61e703e5a53a45918a05c2d0318 ****/
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

		/****************** SNameori ******************/
		/**** md5 signature: 13d091dc5a1df5e5b76408b1cf7882ab ****/
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

		/****************** SNameori ******************/
		/**** md5 signature: 5a9c43c224cad506161a5139631efdf6 ****/
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
		/****************** TopOpeBRepBuild_EdgeBuilder ******************/
		/**** md5 signature: 22f83f657351f29dddea9f6c3508a926 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_EdgeBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_EdgeBuilder;
		 TopOpeBRepBuild_EdgeBuilder();

		/****************** TopOpeBRepBuild_EdgeBuilder ******************/
		/**** md5 signature: 23fa9971f5c00aede542244c5a2a487c ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_EdgeBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_PaveSet
LC: TopOpeBRepBuild_PaveClassifier
ForceClass: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a edgebuilder to find the areas of the shapes described by <ls> using the classifier <lc>.
") TopOpeBRepBuild_EdgeBuilder;
		 TopOpeBRepBuild_EdgeBuilder(TopOpeBRepBuild_PaveSet & LS, TopOpeBRepBuild_PaveClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** InitEdge ******************/
		/**** md5 signature: 13e3d303d78cdf9134a0106c465fdb17 ****/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitEdge;
		void InitEdge();

		/****************** InitEdgeBuilder ******************/
		/**** md5 signature: feab14ae0eb34263c1597ab51e270453 ****/
		%feature("compactdefaultargs") InitEdgeBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") InitEdgeBuilder;
		void InitEdgeBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** InitVertex ******************/
		/**** md5 signature: 12fa7b14d7e7f4c6f0e753d97f3e91ab ****/
		%feature("compactdefaultargs") InitVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitVertex;
		void InitVertex();

		/****************** MoreEdge ******************/
		/**** md5 signature: 3deabda73e93b20e8a72f2f0ebea4e02 ****/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreEdge;
		Standard_Boolean MoreEdge();

		/****************** MoreVertex ******************/
		/**** md5 signature: a83eb0d708855c09e405b7e894d8577e ****/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreVertex;
		Standard_Boolean MoreVertex();

		/****************** NextEdge ******************/
		/**** md5 signature: 8103c946a7f7c0a3d885514a8a740502 ****/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextEdge;
		void NextEdge();

		/****************** NextVertex ******************/
		/**** md5 signature: c800122ce4f2c3bd5f52dba7f14e300c ****/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextVertex;
		void NextVertex();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter();

		/****************** Vertex ******************/
		/**** md5 signature: 4b1334c642d4415d88330a5fa6216463 ****/
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
		/****************** TopOpeBRepBuild_FaceAreaBuilder ******************/
		/**** md5 signature: 57921e4ad2221036737f23a15d3756b2 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceAreaBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_FaceAreaBuilder;
		 TopOpeBRepBuild_FaceAreaBuilder();

		/****************** TopOpeBRepBuild_FaceAreaBuilder ******************/
		/**** md5 signature: aae85d4fb51ab8b033369bdcc2ce897c ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceAreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a faceareabuilder to build faces on the (wires,blocks of edge) of <ls>, using the classifier <lc>.
") TopOpeBRepBuild_FaceAreaBuilder;
		 TopOpeBRepBuild_FaceAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** InitFaceAreaBuilder ******************/
		/**** md5 signature: 4c2406552a92f8db15e0db3231a07d69 ****/
		%feature("compactdefaultargs") InitFaceAreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") InitFaceAreaBuilder;
		void InitFaceAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

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
		/****************** TopOpeBRepBuild_ShellFaceClassifier ******************/
		/**** md5 signature: 410539db715d7aeaed3803d1d3083d0e ****/
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
Creates a classifier in 3d space, to compare: a face with a set of faces a shell with a set of faces a shell with a shell.
") TopOpeBRepBuild_ShellFaceClassifier;
		 TopOpeBRepBuild_ShellFaceClassifier(const TopOpeBRepBuild_BlockBuilder & BB);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****************** CompareElement ******************/
		/**** md5 signature: ba1c176c416a3ec4b766e16ebcc74d2a ****/
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
Add the face <f> in the set of faces used in 3d point classification. returns false if the face <f> has been already added to the set of faces, otherwise returns true.
") CompareElement;
		Standard_Boolean CompareElement(const TopoDS_Shape & F);

		/****************** CompareElementToShape ******************/
		/**** md5 signature: fcde046c10c59d90fd65d4ff20dcda53 ****/
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
Classify face <f> with shell <s>.
") CompareElementToShape;
		TopAbs_State CompareElementToShape(const TopoDS_Shape & F, const TopoDS_Shape & S);

		/****************** CompareShapes ******************/
		/**** md5 signature: da0bd451b348820112f4020c95c6891e ****/
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
Classify shell <b1> with shell <b2>.
") CompareShapes;
		TopAbs_State CompareShapes(const TopoDS_Shape & B1, const TopoDS_Shape & B2);

		/****************** ResetElement ******************/
		/**** md5 signature: ea9ba08a968ee72e66bd20e4dda95a5b ****/
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
Prepare classification involving face <f> define 3d point (later used in compare()) on first vertex of face <f>.
") ResetElement;
		void ResetElement(const TopoDS_Shape & F);

		/****************** ResetShape ******************/
		/**** md5 signature: 284a4c5e760adb7fa5d4bbdce6df9059 ****/
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
Prepare classification involving shell <s> calls resetelement on first face of <s>.
") ResetShape;
		void ResetShape(const TopoDS_Shape & S);

		/****************** State ******************/
		/**** md5 signature: 913355dbb99a92aa0aba1549eebd504d ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns state of classification of 3d point, defined by resetelement, with the current set of faces, defined by compare.
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
		/****************** TopOpeBRepBuild_SolidAreaBuilder ******************/
		/**** md5 signature: 3f30f33660bafa155aed9b75d3a4890f ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidAreaBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepBuild_SolidAreaBuilder;
		 TopOpeBRepBuild_SolidAreaBuilder();

		/****************** TopOpeBRepBuild_SolidAreaBuilder ******************/
		/**** md5 signature: b6d207c7bf97feaee3dda1d33f127577 ****/
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidAreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates a solidareabuilder to build solids on the (shells,blocks of face) of <ls>, using the classifier <lc>.
") TopOpeBRepBuild_SolidAreaBuilder;
		 TopOpeBRepBuild_SolidAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** InitSolidAreaBuilder ******************/
		/**** md5 signature: 1fe349a5f143a74a39ca0c4d4b94b628 ****/
		%feature("compactdefaultargs") InitSolidAreaBuilder;
		%feature("autodoc", "
Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") InitSolidAreaBuilder;
		void InitSolidAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

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
		/****************** TopOpeBRepBuild_WireEdgeClassifier ******************/
		/**** md5 signature: b31b3951b5786c808c6475b92daabfe4 ****/
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
Creates a classifier on edge <f>. used to compare edges and wires on the edge <f>.
") TopOpeBRepBuild_WireEdgeClassifier;
		 TopOpeBRepBuild_WireEdgeClassifier(const TopoDS_Shape & F, const TopOpeBRepBuild_BlockBuilder & BB);

		/****************** Compare ******************/
		/**** md5 signature: ca2b365fd2720fd9e2ed093e173bef92 ****/
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
		virtual TopAbs_State Compare(const opencascade::handle<TopOpeBRepBuild_Loop> & L1, const opencascade::handle<TopOpeBRepBuild_Loop> & L2);

		/****************** CompareElement ******************/
		/**** md5 signature: 56c158550cc802d6ac998ecc10f83a15 ****/
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
Add the edge <e> in the set of edges used in 2d point classification.
") CompareElement;
		Standard_Boolean CompareElement(const TopoDS_Shape & E);

		/****************** CompareElementToShape ******************/
		/**** md5 signature: 82e26bb3950222156821b04e65f27daf ****/
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
Classify edge <e> with wire <b>.
") CompareElementToShape;
		TopAbs_State CompareElementToShape(const TopoDS_Shape & E, const TopoDS_Shape & B);

		/****************** CompareShapes ******************/
		/**** md5 signature: e3b41838badeb7de538db8664a47f82b ****/
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
Classify wire <b1> with wire <b2>.
") CompareShapes;
		TopAbs_State CompareShapes(const TopoDS_Shape & B1, const TopoDS_Shape & B2);

		/****************** LoopToShape ******************/
		/**** md5 signature: 1f9c4b4ab37159531369dfc6f4c50d03 ****/
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

		/****************** ResetElement ******************/
		/**** md5 signature: 617b6654710f522258ec4f817674e58d ****/
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
Prepare classification involving edge <e> define 2d point (later used in compare()) on first vertex of edge <e>.
") ResetElement;
		void ResetElement(const TopoDS_Shape & E);

		/****************** ResetShape ******************/
		/**** md5 signature: 1129a8c8129825f675e4ed602276d080 ****/
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
Prepare classification involving wire <b> calls resetelement on first edge of <b>.
") ResetShape;
		void ResetShape(const TopoDS_Shape & B);

		/****************** State ******************/
		/**** md5 signature: 111684c5fa36f56d9acfe2227477d711 ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns state of classification of 2d point, defined by resetelement, with the current set of edges, defined by compare.
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
