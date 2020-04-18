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
%define TOPOPEBREPBUILDDOCSTRING
"TopOpeBRepBuild module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_topopebrepbuild.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		%feature("compactdefaultargs") TopOpeBRepBuild_AreaBuilder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_AreaBuilder;
		 TopOpeBRepBuild_AreaBuilder();

		/****************** TopOpeBRepBuild_AreaBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_AreaBuilder;
		%feature("autodoc", "Creates a areabuilder to build the areas on the shapes described by <ls> using the classifier <lc>.

Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool,optional
	default value is Standard_False

Returns
-------
None
") TopOpeBRepBuild_AreaBuilder;
		 TopOpeBRepBuild_AreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** ADD_LISTOFLoop_TO_LISTOFLoop ******************/
		%feature("compactdefaultargs") ADD_LISTOFLoop_TO_LISTOFLoop;
		%feature("autodoc", "No available documentation.

Parameters
----------
LOL1: TopOpeBRepBuild_ListOfLoop
LOL2: TopOpeBRepBuild_ListOfLoop
s: Standard_Address,optional
	default value is NULL
s1: Standard_Address,optional
	default value is NULL
s2: Standard_Address,optional
	default value is NULL

Returns
-------
None
") ADD_LISTOFLoop_TO_LISTOFLoop;
		virtual void ADD_LISTOFLoop_TO_LISTOFLoop(TopOpeBRepBuild_ListOfLoop & LOL1, TopOpeBRepBuild_ListOfLoop & LOL2, const Standard_Address s = NULL, const Standard_Address s1 = NULL, const Standard_Address s2 = NULL);

		/****************** ADD_Loop_TO_LISTOFLoop ******************/
		%feature("compactdefaultargs") ADD_Loop_TO_LISTOFLoop;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopOpeBRepBuild_Loop
LOL: TopOpeBRepBuild_ListOfLoop
s: Standard_Address,optional
	default value is NULL

Returns
-------
None
") ADD_Loop_TO_LISTOFLoop;
		virtual void ADD_Loop_TO_LISTOFLoop(const opencascade::handle<TopOpeBRepBuild_Loop> & L, TopOpeBRepBuild_ListOfLoop & LOL, const Standard_Address s = NULL);

		/****************** InitArea ******************/
		%feature("compactdefaultargs") InitArea;
		%feature("autodoc", "Initialize iteration on areas.

Returns
-------
int
") InitArea;
		Standard_Integer InitArea();

		/****************** InitAreaBuilder ******************/
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "Sets a areabuilder to find the areas on the shapes described by <ls> using the classifier <lc>.

Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool,optional
	default value is Standard_False

Returns
-------
None
") InitAreaBuilder;
		virtual void InitAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** InitLoop ******************/
		%feature("compactdefaultargs") InitLoop;
		%feature("autodoc", "Initialize iteration on loops of current area.

Returns
-------
int
") InitLoop;
		Standard_Integer InitLoop();

		/****************** Loop ******************/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "Returns the current loop in the current area.

Returns
-------
opencascade::handle<TopOpeBRepBuild_Loop>
") Loop;
		const opencascade::handle<TopOpeBRepBuild_Loop> & Loop();

		/****************** MoreArea ******************/
		%feature("compactdefaultargs") MoreArea;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreArea;
		Standard_Boolean MoreArea();

		/****************** MoreLoop ******************/
		%feature("compactdefaultargs") MoreLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreLoop;
		Standard_Boolean MoreLoop();

		/****************** NextArea ******************/
		%feature("compactdefaultargs") NextArea;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextArea;
		void NextArea();

		/****************** NextLoop ******************/
		%feature("compactdefaultargs") NextLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextLoop;
		void NextLoop();

		/****************** REM_Loop_FROM_LISTOFLoop ******************/
		%feature("compactdefaultargs") REM_Loop_FROM_LISTOFLoop;
		%feature("autodoc", "No available documentation.

Parameters
----------
ITLOL: TopOpeBRepBuild_ListIteratorOfListOfLoop
LOL: TopOpeBRepBuild_ListOfLoop
s: Standard_Address,optional
	default value is NULL

Returns
-------
None
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
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockBuilder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_BlockBuilder;
		 TopOpeBRepBuild_BlockBuilder();

		/****************** TopOpeBRepBuild_BlockBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
SS: TopOpeBRepBuild_ShapeSet

Returns
-------
None
") TopOpeBRepBuild_BlockBuilder;
		 TopOpeBRepBuild_BlockBuilder(TopOpeBRepBuild_ShapeSet & SS);

		/****************** AddElement ******************/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
int
") AddElement;
		Standard_Integer AddElement(const TopoDS_Shape & S);

		/****************** BlockIterator ******************/
		%feature("compactdefaultargs") BlockIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepBuild_BlockIterator
") BlockIterator;
		TopOpeBRepBuild_BlockIterator BlockIterator();

		/****************** CurrentBlockIsRegular ******************/
		%feature("compactdefaultargs") CurrentBlockIsRegular;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") CurrentBlockIsRegular;
		Standard_Boolean CurrentBlockIsRegular();

		/****************** Element ******************/
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "Returns the current element of <bi>.

Parameters
----------
BI: TopOpeBRepBuild_BlockIterator

Returns
-------
TopoDS_Shape
") Element;
		const TopoDS_Shape Element(const TopOpeBRepBuild_BlockIterator & BI);

		/****************** Element ******************/
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopoDS_Shape
") Element;
		const TopoDS_Shape Element(const Standard_Integer I);

		/****************** Element ******************/
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
int
") Element;
		Standard_Integer Element(const TopoDS_Shape & S);

		/****************** ElementIsValid ******************/
		%feature("compactdefaultargs") ElementIsValid;
		%feature("autodoc", "No available documentation.

Parameters
----------
BI: TopOpeBRepBuild_BlockIterator

Returns
-------
bool
") ElementIsValid;
		Standard_Boolean ElementIsValid(const TopOpeBRepBuild_BlockIterator & BI);

		/****************** ElementIsValid ******************/
		%feature("compactdefaultargs") ElementIsValid;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") ElementIsValid;
		Standard_Boolean ElementIsValid(const Standard_Integer I);

		/****************** InitBlock ******************/
		%feature("compactdefaultargs") InitBlock;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitBlock;
		void InitBlock();

		/****************** MakeBlock ******************/
		%feature("compactdefaultargs") MakeBlock;
		%feature("autodoc", "No available documentation.

Parameters
----------
SS: TopOpeBRepBuild_ShapeSet

Returns
-------
None
") MakeBlock;
		void MakeBlock(TopOpeBRepBuild_ShapeSet & SS);

		/****************** MoreBlock ******************/
		%feature("compactdefaultargs") MoreBlock;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreBlock;
		Standard_Boolean MoreBlock();

		/****************** NextBlock ******************/
		%feature("compactdefaultargs") NextBlock;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextBlock;
		void NextBlock();

		/****************** SetValid ******************/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "No available documentation.

Parameters
----------
BI: TopOpeBRepBuild_BlockIterator
isvalid: bool

Returns
-------
None
") SetValid;
		void SetValid(const TopOpeBRepBuild_BlockIterator & BI, const Standard_Boolean isvalid);

		/****************** SetValid ******************/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
isvalid: bool

Returns
-------
None
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
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_BlockIterator;
		 TopOpeBRepBuild_BlockIterator();

		/****************** TopOpeBRepBuild_BlockIterator ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lower: int
Upper: int

Returns
-------
None
") TopOpeBRepBuild_BlockIterator;
		 TopOpeBRepBuild_BlockIterator(const Standard_Integer Lower, const Standard_Integer Upper);

		/****************** Extent ******************/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Initialize;
		void Initialize();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
int
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
		%feature("compactdefaultargs") TopOpeBRepBuild_Builder;
		%feature("autodoc", "No available documentation.

Parameters
----------
BT: TopOpeBRepDS_BuildTool

Returns
-------
None
") TopOpeBRepBuild_Builder;
		 TopOpeBRepBuild_Builder(const TopOpeBRepDS_BuildTool & BT);

		/****************** AddONPatchesSFS ******************/
		%feature("compactdefaultargs") AddONPatchesSFS;
		%feature("autodoc", "No available documentation.

Parameters
----------
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Returns
-------
None
") AddONPatchesSFS;
		void AddONPatchesSFS(const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** BuildEdges ******************/
		%feature("compactdefaultargs") BuildEdges;
		%feature("autodoc", "Update the ds by creating new geometries. create shapes from the new geometries.

Parameters
----------
DS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") BuildEdges;
		void BuildEdges(const opencascade::handle<TopOpeBRepDS_HDataStructure> & DS);

		/****************** BuildTool ******************/
		%feature("compactdefaultargs") BuildTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_BuildTool
") BuildTool;
		const TopOpeBRepDS_BuildTool & BuildTool();

		/****************** BuildVertices ******************/
		%feature("compactdefaultargs") BuildVertices;
		%feature("autodoc", "Update the ds by creating new geometries. create vertices on ds points.

Parameters
----------
DS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") BuildVertices;
		void BuildVertices(const opencascade::handle<TopOpeBRepDS_HDataStructure> & DS);

		/****************** ChangeBuildTool ******************/
		%feature("compactdefaultargs") ChangeBuildTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_BuildTool
") ChangeBuildTool;
		TopOpeBRepDS_BuildTool & ChangeBuildTool();

		/****************** ChangeClassify ******************/
		%feature("compactdefaultargs") ChangeClassify;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") ChangeClassify;
		void ChangeClassify(const Standard_Boolean B);

		/****************** ChangeMSplit ******************/
		%feature("compactdefaultargs") ChangeMSplit;
		%feature("autodoc", "No available documentation.

Parameters
----------
s: TopAbs_State

Returns
-------
TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State
") ChangeMSplit;
		TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & ChangeMSplit(const TopAbs_State s);

		/****************** ChangeSplit ******************/
		%feature("compactdefaultargs") ChangeSplit;
		%feature("autodoc", "Returns a ref.on the list of shapes connected to <s> as <tb> split parts of <s>. mark <s> as split in <tb> parts.

Parameters
----------
S: TopoDS_Shape
TB: TopAbs_State

Returns
-------
TopTools_ListOfShape
") ChangeSplit;
		TopTools_ListOfShape & ChangeSplit(const TopoDS_Shape & S, const TopAbs_State TB);

		/****************** Classify ******************/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Classify;
		Standard_Boolean Classify();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes all splits and merges already performed. does not clear the handled ds.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** ClearMaps ******************/
		%feature("compactdefaultargs") ClearMaps;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ClearMaps;
		void ClearMaps();

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
L: TopTools_ListOfShape

Returns
-------
bool
") Contains;
		static Standard_Boolean Contains(const TopoDS_Shape & S, const TopTools_ListOfShape & L);

		/****************** DataStructure ******************/
		%feature("compactdefaultargs") DataStructure;
		%feature("autodoc", "Returns the ds handled by this builder.

Returns
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>
") DataStructure;
		opencascade::handle<TopOpeBRepDS_HDataStructure> DataStructure();

		/****************** End ******************/
		%feature("compactdefaultargs") End;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") End;
		void End();

		/****************** FillOnPatches ******************/
		%feature("compactdefaultargs") FillOnPatches;
		%feature("autodoc", "No available documentation.

Parameters
----------
anEdgesON: TopTools_ListOfShape
aBaseFace: TopoDS_Shape
avoidMap: TopTools_IndexedMapOfOrientedShape

Returns
-------
None
") FillOnPatches;
		void FillOnPatches(const TopTools_ListOfShape & anEdgesON, const TopoDS_Shape & aBaseFace, const TopTools_IndexedMapOfOrientedShape & avoidMap);

		/****************** FillSecEdgeAncestorMap ******************/
		%feature("compactdefaultargs") FillSecEdgeAncestorMap;
		%feature("autodoc", "Fills anancmap with pairs (edge,ancestor edge) for each split from the map amapon for the shape object identified by shaperank.

Parameters
----------
aShapeRank: int
aMapON: TopTools_MapOfShape
anAncMap: TopTools_DataMapOfShapeShape

Returns
-------
None
") FillSecEdgeAncestorMap;
		void FillSecEdgeAncestorMap(const Standard_Integer aShapeRank, const TopTools_MapOfShape & aMapON, TopTools_DataMapOfShapeShape & anAncMap);

		/****************** FindFacesTouchingEdge ******************/
		%feature("compactdefaultargs") FindFacesTouchingEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFace: TopoDS_Shape
anEdge: TopoDS_Shape
aShRank: int
aFaces: TopTools_ListOfShape

Returns
-------
None
") FindFacesTouchingEdge;
		void FindFacesTouchingEdge(const TopoDS_Shape & aFace, const TopoDS_Shape & anEdge, const Standard_Integer aShRank, TopTools_ListOfShape & aFaces);

		/****************** FindIsKPart ******************/
		%feature("compactdefaultargs") FindIsKPart;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") FindIsKPart;
		Standard_Integer FindIsKPart();

		/****************** FindSameDomain ******************/
		%feature("compactdefaultargs") FindSameDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
L1: TopTools_ListOfShape
L2: TopTools_ListOfShape

Returns
-------
None
") FindSameDomain;
		void FindSameDomain(TopTools_ListOfShape & L1, TopTools_ListOfShape & L2);

		/****************** FindSameDomainSameOrientation ******************/
		%feature("compactdefaultargs") FindSameDomainSameOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
LSO: TopTools_ListOfShape
LDO: TopTools_ListOfShape

Returns
-------
None
") FindSameDomainSameOrientation;
		void FindSameDomainSameOrientation(TopTools_ListOfShape & LSO, TopTools_ListOfShape & LDO);

		/****************** FindSameRank ******************/
		%feature("compactdefaultargs") FindSameRank;
		%feature("autodoc", "No available documentation.

Parameters
----------
L1: TopTools_ListOfShape
R: int
L2: TopTools_ListOfShape

Returns
-------
None
") FindSameRank;
		void FindSameRank(const TopTools_ListOfShape & L1, const Standard_Integer R, TopTools_ListOfShape & L2);

		/****************** GClearMaps ******************/
		%feature("compactdefaultargs") GClearMaps;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GClearMaps;
		void GClearMaps();

		/****************** GContains ******************/
		%feature("compactdefaultargs") GContains;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
L: TopTools_ListOfShape

Returns
-------
bool
") GContains;
		static Standard_Boolean GContains(const TopoDS_Shape & S, const TopTools_ListOfShape & L);

		/****************** GCopyList ******************/
		%feature("compactdefaultargs") GCopyList;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lin: TopTools_ListOfShape
i1: int
i2: int
Lou: TopTools_ListOfShape

Returns
-------
None
") GCopyList;
		static void GCopyList(const TopTools_ListOfShape & Lin, const Standard_Integer i1, const Standard_Integer i2, TopTools_ListOfShape & Lou);

		/****************** GCopyList ******************/
		%feature("compactdefaultargs") GCopyList;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lin: TopTools_ListOfShape
Lou: TopTools_ListOfShape

Returns
-------
None
") GCopyList;
		static void GCopyList(const TopTools_ListOfShape & Lin, TopTools_ListOfShape & Lou);

		/****************** GEDBUMakeEdges ******************/
		%feature("compactdefaultargs") GEDBUMakeEdges;
		%feature("autodoc", "No available documentation.

Parameters
----------
EF: TopoDS_Shape
EDBU: TopOpeBRepBuild_EdgeBuilder
LOE: TopTools_ListOfShape

Returns
-------
None
") GEDBUMakeEdges;
		void GEDBUMakeEdges(const TopoDS_Shape & EF, TopOpeBRepBuild_EdgeBuilder & EDBU, TopTools_ListOfShape & LOE);

		/****************** GFABUMakeFaces ******************/
		%feature("compactdefaultargs") GFABUMakeFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
FF: TopoDS_Shape
FABU: TopOpeBRepBuild_FaceBuilder
LOF: TopTools_ListOfShape
MWisOld: TopTools_DataMapOfShapeInteger

Returns
-------
None
") GFABUMakeFaces;
		void GFABUMakeFaces(const TopoDS_Shape & FF, TopOpeBRepBuild_FaceBuilder & FABU, TopTools_ListOfShape & LOF, TopTools_DataMapOfShapeInteger & MWisOld);

		/****************** GFillCurveTopologyWES ******************/
		%feature("compactdefaultargs") GFillCurveTopologyWES;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Returns
-------
None
") GFillCurveTopologyWES;
		void GFillCurveTopologyWES(const TopoDS_Shape & F, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillCurveTopologyWES ******************/
		%feature("compactdefaultargs") GFillCurveTopologyWES;
		%feature("autodoc", "No available documentation.

Parameters
----------
IT: TopOpeBRepDS_CurveIterator
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Returns
-------
None
") GFillCurveTopologyWES;
		void GFillCurveTopologyWES(const TopOpeBRepDS_CurveIterator & IT, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillEdgePVS ******************/
		%feature("compactdefaultargs") GFillEdgePVS;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
LE2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
PVS: TopOpeBRepBuild_PaveSet

Returns
-------
None
") GFillEdgePVS;
		void GFillEdgePVS(const TopoDS_Shape & E, const TopTools_ListOfShape & LE2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_PaveSet & PVS);

		/****************** GFillEdgeWES ******************/
		%feature("compactdefaultargs") GFillEdgeWES;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
LF2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Returns
-------
None
") GFillEdgeWES;
		void GFillEdgeWES(const TopoDS_Shape & E, const TopTools_ListOfShape & LF2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillEdgesPVS ******************/
		%feature("compactdefaultargs") GFillEdgesPVS;
		%feature("autodoc", "No available documentation.

Parameters
----------
LE1: TopTools_ListOfShape
LE2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
PVS: TopOpeBRepBuild_PaveSet

Returns
-------
None
") GFillEdgesPVS;
		void GFillEdgesPVS(const TopTools_ListOfShape & LE1, const TopTools_ListOfShape & LE2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_PaveSet & PVS);

		/****************** GFillFaceSFS ******************/
		%feature("compactdefaultargs") GFillFaceSFS;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Returns
-------
None
") GFillFaceSFS;
		void GFillFaceSFS(const TopoDS_Shape & F1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillFaceWES ******************/
		%feature("compactdefaultargs") GFillFaceWES;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape
LF2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Returns
-------
None
") GFillFaceWES;
		void GFillFaceWES(const TopoDS_Shape & F, const TopTools_ListOfShape & LF2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillFacesWES ******************/
		%feature("compactdefaultargs") GFillFacesWES;
		%feature("autodoc", "No available documentation.

Parameters
----------
LF1: TopTools_ListOfShape
LF2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Returns
-------
None
") GFillFacesWES;
		void GFillFacesWES(const TopTools_ListOfShape & LF1, const TopTools_ListOfShape & LF2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillFacesWESK ******************/
		%feature("compactdefaultargs") GFillFacesWESK;
		%feature("autodoc", "No available documentation.

Parameters
----------
LF1: TopTools_ListOfShape
LF2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet
K: int

Returns
-------
None
") GFillFacesWESK;
		void GFillFacesWESK(const TopTools_ListOfShape & LF1, const TopTools_ListOfShape & LF2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES, const Standard_Integer K);

		/****************** GFillFacesWESMakeFaces ******************/
		%feature("compactdefaultargs") GFillFacesWESMakeFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
LF1: TopTools_ListOfShape
LF2: TopTools_ListOfShape
LSO: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo

Returns
-------
None
") GFillFacesWESMakeFaces;
		void GFillFacesWESMakeFaces(const TopTools_ListOfShape & LF1, const TopTools_ListOfShape & LF2, const TopTools_ListOfShape & LSO, const TopOpeBRepBuild_GTopo & G);

		/****************** GFillONPartsWES ******************/
		%feature("compactdefaultargs") GFillONPartsWES;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape
G: TopOpeBRepBuild_GTopo
LSclass: TopTools_ListOfShape
WES: TopOpeBRepBuild_WireEdgeSet

Returns
-------
None
") GFillONPartsWES;
		void GFillONPartsWES(const TopoDS_Shape & F, const TopOpeBRepBuild_GTopo & G, const TopTools_ListOfShape & LSclass, TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillPointTopologyPVS ******************/
		%feature("compactdefaultargs") GFillPointTopologyPVS;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
G: TopOpeBRepBuild_GTopo
PVS: TopOpeBRepBuild_PaveSet

Returns
-------
None
") GFillPointTopologyPVS;
		void GFillPointTopologyPVS(const TopoDS_Shape & E, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_PaveSet & PVS);

		/****************** GFillPointTopologyPVS ******************/
		%feature("compactdefaultargs") GFillPointTopologyPVS;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
IT: TopOpeBRepDS_PointIterator
G: TopOpeBRepBuild_GTopo
PVS: TopOpeBRepBuild_PaveSet

Returns
-------
None
") GFillPointTopologyPVS;
		void GFillPointTopologyPVS(const TopoDS_Shape & E, const TopOpeBRepDS_PointIterator & IT, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_PaveSet & PVS);

		/****************** GFillShellSFS ******************/
		%feature("compactdefaultargs") GFillShellSFS;
		%feature("autodoc", "No available documentation.

Parameters
----------
SH1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Returns
-------
None
") GFillShellSFS;
		virtual void GFillShellSFS(const TopoDS_Shape & SH1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillSolidSFS ******************/
		%feature("compactdefaultargs") GFillSolidSFS;
		%feature("autodoc", "No available documentation.

Parameters
----------
SO1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Returns
-------
None
") GFillSolidSFS;
		virtual void GFillSolidSFS(const TopoDS_Shape & SO1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillSolidsSFS ******************/
		%feature("compactdefaultargs") GFillSolidsSFS;
		%feature("autodoc", "No available documentation.

Parameters
----------
LSO1: TopTools_ListOfShape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Returns
-------
None
") GFillSolidsSFS;
		void GFillSolidsSFS(const TopTools_ListOfShape & LSO1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillSurfaceTopologySFS ******************/
		%feature("compactdefaultargs") GFillSurfaceTopologySFS;
		%feature("autodoc", "No available documentation.

Parameters
----------
SO1: TopoDS_Shape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Returns
-------
None
") GFillSurfaceTopologySFS;
		void GFillSurfaceTopologySFS(const TopoDS_Shape & SO1, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillSurfaceTopologySFS ******************/
		%feature("compactdefaultargs") GFillSurfaceTopologySFS;
		%feature("autodoc", "No available documentation.

Parameters
----------
IT: TopOpeBRepDS_SurfaceIterator
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Returns
-------
None
") GFillSurfaceTopologySFS;
		void GFillSurfaceTopologySFS(const TopOpeBRepDS_SurfaceIterator & IT, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillWireWES ******************/
		%feature("compactdefaultargs") GFillWireWES;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: TopoDS_Shape
LF2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Returns
-------
None
") GFillWireWES;
		void GFillWireWES(const TopoDS_Shape & W, const TopTools_ListOfShape & LF2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFindSamDom ******************/
		%feature("compactdefaultargs") GFindSamDom;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
L1: TopTools_ListOfShape
L2: TopTools_ListOfShape

Returns
-------
None
") GFindSamDom;
		void GFindSamDom(const TopoDS_Shape & S, TopTools_ListOfShape & L1, TopTools_ListOfShape & L2);

		/****************** GFindSamDom ******************/
		%feature("compactdefaultargs") GFindSamDom;
		%feature("autodoc", "No available documentation.

Parameters
----------
L1: TopTools_ListOfShape
L2: TopTools_ListOfShape

Returns
-------
None
") GFindSamDom;
		void GFindSamDom(TopTools_ListOfShape & L1, TopTools_ListOfShape & L2);

		/****************** GFindSamDomSODO ******************/
		%feature("compactdefaultargs") GFindSamDomSODO;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
LSO: TopTools_ListOfShape
LDO: TopTools_ListOfShape

Returns
-------
None
") GFindSamDomSODO;
		void GFindSamDomSODO(const TopoDS_Shape & S, TopTools_ListOfShape & LSO, TopTools_ListOfShape & LDO);

		/****************** GFindSamDomSODO ******************/
		%feature("compactdefaultargs") GFindSamDomSODO;
		%feature("autodoc", "No available documentation.

Parameters
----------
LSO: TopTools_ListOfShape
LDO: TopTools_ListOfShape

Returns
-------
None
") GFindSamDomSODO;
		void GFindSamDomSODO(TopTools_ListOfShape & LSO, TopTools_ListOfShape & LDO);

		/****************** GFindSameRank ******************/
		%feature("compactdefaultargs") GFindSameRank;
		%feature("autodoc", "No available documentation.

Parameters
----------
L1: TopTools_ListOfShape
R: int
L2: TopTools_ListOfShape

Returns
-------
None
") GFindSameRank;
		void GFindSameRank(const TopTools_ListOfShape & L1, const Standard_Integer R, TopTools_ListOfShape & L2);

		/****************** GIsShapeOf ******************/
		%feature("compactdefaultargs") GIsShapeOf;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
I12: int

Returns
-------
bool
") GIsShapeOf;
		Standard_Boolean GIsShapeOf(const TopoDS_Shape & S, const Standard_Integer I12);

		/****************** GKeepShape ******************/
		%feature("compactdefaultargs") GKeepShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Lref: TopTools_ListOfShape
T: TopAbs_State

Returns
-------
bool
") GKeepShape;
		Standard_Boolean GKeepShape(const TopoDS_Shape & S, const TopTools_ListOfShape & Lref, const TopAbs_State T);

		/****************** GKeepShape1 ******************/
		%feature("compactdefaultargs") GKeepShape1;
		%feature("autodoc", "Return true if s is classified <t> / lref shapes.

Parameters
----------
S: TopoDS_Shape
Lref: TopTools_ListOfShape
T: TopAbs_State
pos: TopAbs_State

Returns
-------
bool
") GKeepShape1;
		Standard_Boolean GKeepShape1(const TopoDS_Shape & S, const TopTools_ListOfShape & Lref, const TopAbs_State T, TopAbs_State & pos);

		/****************** GKeepShapes ******************/
		%feature("compactdefaultargs") GKeepShapes;
		%feature("autodoc", "Add to lou the shapes of lin classified <t> / lref shapes. lou is not cleared. (s is a dummy trace argument).

Parameters
----------
S: TopoDS_Shape
Lref: TopTools_ListOfShape
T: TopAbs_State
Lin: TopTools_ListOfShape
Lou: TopTools_ListOfShape

Returns
-------
None
") GKeepShapes;
		void GKeepShapes(const TopoDS_Shape & S, const TopTools_ListOfShape & Lref, const TopAbs_State T, const TopTools_ListOfShape & Lin, TopTools_ListOfShape & Lou);

		/****************** GMapShapes ******************/
		%feature("compactdefaultargs") GMapShapes;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") GMapShapes;
		void GMapShapes(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** GMergeEdgeWES ******************/
		%feature("compactdefaultargs") GMergeEdgeWES;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Returns
-------
None
") GMergeEdgeWES;
		void GMergeEdgeWES(const TopoDS_Shape & E, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GMergeEdges ******************/
		%feature("compactdefaultargs") GMergeEdges;
		%feature("autodoc", "No available documentation.

Parameters
----------
LE1: TopTools_ListOfShape
LE2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo

Returns
-------
None
") GMergeEdges;
		void GMergeEdges(const TopTools_ListOfShape & LE1, const TopTools_ListOfShape & LE2, const TopOpeBRepBuild_GTopo & G);

		/****************** GMergeFaceSFS ******************/
		%feature("compactdefaultargs") GMergeFaceSFS;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Returns
-------
None
") GMergeFaceSFS;
		void GMergeFaceSFS(const TopoDS_Shape & F, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GMergeFaces ******************/
		%feature("compactdefaultargs") GMergeFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
LF1: TopTools_ListOfShape
LF2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo

Returns
-------
None
") GMergeFaces;
		void GMergeFaces(const TopTools_ListOfShape & LF1, const TopTools_ListOfShape & LF2, const TopOpeBRepBuild_GTopo & G);

		/****************** GMergeSolids ******************/
		%feature("compactdefaultargs") GMergeSolids;
		%feature("autodoc", "No available documentation.

Parameters
----------
LSO1: TopTools_ListOfShape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo

Returns
-------
None
") GMergeSolids;
		void GMergeSolids(const TopTools_ListOfShape & LSO1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G);

		/****************** GPVSMakeEdges ******************/
		%feature("compactdefaultargs") GPVSMakeEdges;
		%feature("autodoc", "No available documentation.

Parameters
----------
EF: TopoDS_Shape
PVS: TopOpeBRepBuild_PaveSet
LOE: TopTools_ListOfShape

Returns
-------
None
") GPVSMakeEdges;
		void GPVSMakeEdges(const TopoDS_Shape & EF, TopOpeBRepBuild_PaveSet & PVS, TopTools_ListOfShape & LOE);

		/****************** GParamOnReference ******************/
		%feature("compactdefaultargs") GParamOnReference;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Returns
-------
P: float
") GParamOnReference;
		Standard_Boolean GParamOnReference(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue);

		/****************** GSFSMakeSolids ******************/
		%feature("compactdefaultargs") GSFSMakeSolids;
		%feature("autodoc", "No available documentation.

Parameters
----------
SOF: TopoDS_Shape
SFS: TopOpeBRepBuild_ShellFaceSet
LOSO: TopTools_ListOfShape

Returns
-------
None
") GSFSMakeSolids;
		void GSFSMakeSolids(const TopoDS_Shape & SOF, TopOpeBRepBuild_ShellFaceSet & SFS, TopTools_ListOfShape & LOSO);

		/****************** GSOBUMakeSolids ******************/
		%feature("compactdefaultargs") GSOBUMakeSolids;
		%feature("autodoc", "No available documentation.

Parameters
----------
SOF: TopoDS_Shape
SOBU: TopOpeBRepBuild_SolidBuilder
LOSO: TopTools_ListOfShape

Returns
-------
None
") GSOBUMakeSolids;
		void GSOBUMakeSolids(const TopoDS_Shape & SOF, TopOpeBRepBuild_SolidBuilder & SOBU, TopTools_ListOfShape & LOSO);

		/****************** GShapeRank ******************/
		%feature("compactdefaultargs") GShapeRank;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
int
") GShapeRank;
		Standard_Integer GShapeRank(const TopoDS_Shape & S);

		/****************** GSplitEdge ******************/
		%feature("compactdefaultargs") GSplitEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
G: TopOpeBRepBuild_GTopo
LSclass: TopTools_ListOfShape

Returns
-------
None
") GSplitEdge;
		void GSplitEdge(const TopoDS_Shape & E, const TopOpeBRepBuild_GTopo & G, const TopTools_ListOfShape & LSclass);

		/****************** GSplitEdgeWES ******************/
		%feature("compactdefaultargs") GSplitEdgeWES;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
LF2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Returns
-------
None
") GSplitEdgeWES;
		void GSplitEdgeWES(const TopoDS_Shape & E, const TopTools_ListOfShape & LF2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GSplitFace ******************/
		%feature("compactdefaultargs") GSplitFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape
G: TopOpeBRepBuild_GTopo
LSclass: TopTools_ListOfShape

Returns
-------
None
") GSplitFace;
		void GSplitFace(const TopoDS_Shape & F, const TopOpeBRepBuild_GTopo & G, const TopTools_ListOfShape & LSclass);

		/****************** GSplitFaceSFS ******************/
		%feature("compactdefaultargs") GSplitFaceSFS;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Shape
LSclass: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Returns
-------
None
") GSplitFaceSFS;
		void GSplitFaceSFS(const TopoDS_Shape & F1, const TopTools_ListOfShape & LSclass, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GTakeCommonOfDiff ******************/
		%feature("compactdefaultargs") GTakeCommonOfDiff;
		%feature("autodoc", "No available documentation.

Parameters
----------
G: TopOpeBRepBuild_GTopo

Returns
-------
bool
") GTakeCommonOfDiff;
		static Standard_Boolean GTakeCommonOfDiff(const TopOpeBRepBuild_GTopo & G);

		/****************** GTakeCommonOfSame ******************/
		%feature("compactdefaultargs") GTakeCommonOfSame;
		%feature("autodoc", "No available documentation.

Parameters
----------
G: TopOpeBRepBuild_GTopo

Returns
-------
bool
") GTakeCommonOfSame;
		static Standard_Boolean GTakeCommonOfSame(const TopOpeBRepBuild_GTopo & G);

		/****************** GToMerge ******************/
		%feature("compactdefaultargs") GToMerge;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") GToMerge;
		Standard_Boolean GToMerge(const TopoDS_Shape & S);

		/****************** GToSplit ******************/
		%feature("compactdefaultargs") GToSplit;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
TB: TopAbs_State

Returns
-------
bool
") GToSplit;
		Standard_Boolean GToSplit(const TopoDS_Shape & S, const TopAbs_State TB);

		/****************** GWESMakeFaces ******************/
		%feature("compactdefaultargs") GWESMakeFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
FF: TopoDS_Shape
WES: TopOpeBRepBuild_WireEdgeSet
LOF: TopTools_ListOfShape

Returns
-------
None
") GWESMakeFaces;
		virtual void GWESMakeFaces(const TopoDS_Shape & FF, TopOpeBRepBuild_WireEdgeSet & WES, TopTools_ListOfShape & LOF);

		/****************** GcheckNBOUNDS ******************/
		%feature("compactdefaultargs") GcheckNBOUNDS;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape

Returns
-------
bool
") GcheckNBOUNDS;
		static Standard_Boolean GcheckNBOUNDS(const TopoDS_Shape & E);

		/****************** GdumpEDBU ******************/
		%feature("compactdefaultargs") GdumpEDBU;
		%feature("autodoc", "No available documentation.

Parameters
----------
EB: TopOpeBRepBuild_EdgeBuilder

Returns
-------
None
") GdumpEDBU;
		void GdumpEDBU(TopOpeBRepBuild_EdgeBuilder & EB);

		/****************** GdumpEDG ******************/
		%feature("compactdefaultargs") GdumpEDG;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
str: Standard_Address,optional
	default value is NULL

Returns
-------
None
") GdumpEDG;
		void GdumpEDG(const TopoDS_Shape & S, const Standard_Address str = NULL);

		/****************** GdumpEDGVER ******************/
		%feature("compactdefaultargs") GdumpEDGVER;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
V: TopoDS_Shape
str: Standard_Address,optional
	default value is NULL

Returns
-------
None
") GdumpEDGVER;
		void GdumpEDGVER(const TopoDS_Shape & E, const TopoDS_Shape & V, const Standard_Address str = NULL);

		/****************** GdumpEXP ******************/
		%feature("compactdefaultargs") GdumpEXP;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopOpeBRepTool_ShapeExplorer

Returns
-------
None
") GdumpEXP;
		void GdumpEXP(const TopOpeBRepTool_ShapeExplorer & E);

		/****************** GdumpFABU ******************/
		%feature("compactdefaultargs") GdumpFABU;
		%feature("autodoc", "No available documentation.

Parameters
----------
FB: TopOpeBRepBuild_FaceBuilder

Returns
-------
None
") GdumpFABU;
		void GdumpFABU(TopOpeBRepBuild_FaceBuilder & FB);

		/****************** GdumpLS ******************/
		%feature("compactdefaultargs") GdumpLS;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopTools_ListOfShape

Returns
-------
None
") GdumpLS;
		void GdumpLS(const TopTools_ListOfShape & L);

		/****************** GdumpORIPARPNT ******************/
		%feature("compactdefaultargs") GdumpORIPARPNT;
		%feature("autodoc", "No available documentation.

Parameters
----------
o: TopAbs_Orientation
p: float
Pnt: gp_Pnt

Returns
-------
None
") GdumpORIPARPNT;
		static void GdumpORIPARPNT(const TopAbs_Orientation o, const Standard_Real p, const gp_Pnt & Pnt);

		/****************** GdumpPNT ******************/
		%feature("compactdefaultargs") GdumpPNT;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") GdumpPNT;
		static void GdumpPNT(const gp_Pnt & P);

		/****************** GdumpSAMDOM ******************/
		%feature("compactdefaultargs") GdumpSAMDOM;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopTools_ListOfShape
str: Standard_Address,optional
	default value is NULL

Returns
-------
None
") GdumpSAMDOM;
		void GdumpSAMDOM(const TopTools_ListOfShape & L, const Standard_Address str = NULL);

		/****************** GdumpSHA ******************/
		%feature("compactdefaultargs") GdumpSHA;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
str: Standard_Address,optional
	default value is NULL

Returns
-------
None
") GdumpSHA;
		void GdumpSHA(const TopoDS_Shape & S, const Standard_Address str = NULL);

		/****************** GdumpSHAORI ******************/
		%feature("compactdefaultargs") GdumpSHAORI;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
str: Standard_Address,optional
	default value is NULL

Returns
-------
None
") GdumpSHAORI;
		void GdumpSHAORI(const TopoDS_Shape & S, const Standard_Address str = NULL);

		/****************** GdumpSHAORIGEO ******************/
		%feature("compactdefaultargs") GdumpSHAORIGEO;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
str: Standard_Address,optional
	default value is NULL

Returns
-------
None
") GdumpSHAORIGEO;
		void GdumpSHAORIGEO(const TopoDS_Shape & S, const Standard_Address str = NULL);

		/****************** GdumpSHASETindex ******************/
		%feature("compactdefaultargs") GdumpSHASETindex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GdumpSHASETindex;
		Standard_Integer GdumpSHASETindex();

		/****************** GdumpSHASETreset ******************/
		%feature("compactdefaultargs") GdumpSHASETreset;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GdumpSHASETreset;
		void GdumpSHASETreset();

		/****************** GdumpSHASTA ******************/
		%feature("compactdefaultargs") GdumpSHASTA;
		%feature("autodoc", "No available documentation.

Parameters
----------
iS: int
T: TopAbs_State
a: TCollection_AsciiString,optional
	default value is ""
b: TCollection_AsciiString,optional
	default value is ""

Returns
-------
None
") GdumpSHASTA;
		void GdumpSHASTA(const Standard_Integer iS, const TopAbs_State T, const TCollection_AsciiString & a = "", const TCollection_AsciiString & b = "");

		/****************** GdumpSHASTA ******************/
		%feature("compactdefaultargs") GdumpSHASTA;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
T: TopAbs_State
a: TCollection_AsciiString,optional
	default value is ""
b: TCollection_AsciiString,optional
	default value is ""

Returns
-------
None
") GdumpSHASTA;
		void GdumpSHASTA(const TopoDS_Shape & S, const TopAbs_State T, const TCollection_AsciiString & a = "", const TCollection_AsciiString & b = "");

		/****************** GdumpSHASTA ******************/
		%feature("compactdefaultargs") GdumpSHASTA;
		%feature("autodoc", "No available documentation.

Parameters
----------
iS: int
T: TopAbs_State
SS: TopOpeBRepBuild_ShapeSet
a: TCollection_AsciiString,optional
	default value is ""
b: TCollection_AsciiString,optional
	default value is ""
c: TCollection_AsciiString,optional
	default value is '\n'

Returns
-------
None
") GdumpSHASTA;
		void GdumpSHASTA(const Standard_Integer iS, const TopAbs_State T, const TopOpeBRepBuild_ShapeSet & SS, const TCollection_AsciiString & a = "", const TCollection_AsciiString & b = "", const TCollection_AsciiString & c = "\n");

		/****************** GdumpSOBU ******************/
		%feature("compactdefaultargs") GdumpSOBU;
		%feature("autodoc", "No available documentation.

Parameters
----------
SB: TopOpeBRepBuild_SolidBuilder

Returns
-------
None
") GdumpSOBU;
		void GdumpSOBU(TopOpeBRepBuild_SolidBuilder & SB);

		/****************** GtraceSPS ******************/
		%feature("compactdefaultargs") GtraceSPS;
		%feature("autodoc", "No available documentation.

Parameters
----------
iS: int

Returns
-------
bool
") GtraceSPS;
		Standard_Boolean GtraceSPS(const Standard_Integer iS);

		/****************** GtraceSPS ******************/
		%feature("compactdefaultargs") GtraceSPS;
		%feature("autodoc", "No available documentation.

Parameters
----------
iS: int
jS: int

Returns
-------
bool
") GtraceSPS;
		Standard_Boolean GtraceSPS(const Standard_Integer iS, const Standard_Integer jS);

		/****************** GtraceSPS ******************/
		%feature("compactdefaultargs") GtraceSPS;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") GtraceSPS;
		Standard_Boolean GtraceSPS(const TopoDS_Shape & S);

		/****************** GtraceSPS ******************/
		%feature("compactdefaultargs") GtraceSPS;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
IS: int
") GtraceSPS;
		Standard_Boolean GtraceSPS(const TopoDS_Shape & S, Standard_Integer &OutValue);

		/****************** InitSection ******************/
		%feature("compactdefaultargs") InitSection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitSection;
		void InitSection();

		/****************** IsKPart ******************/
		%feature("compactdefaultargs") IsKPart;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IsKPart;
		Standard_Integer IsKPart();

		/****************** IsMerged ******************/
		%feature("compactdefaultargs") IsMerged;
		%feature("autodoc", "Returns true if the shape <s> has been merged.

Parameters
----------
S: TopoDS_Shape
TB: TopAbs_State

Returns
-------
bool
") IsMerged;
		Standard_Boolean IsMerged(const TopoDS_Shape & S, const TopAbs_State TB);

		/****************** IsShapeOf ******************/
		%feature("compactdefaultargs") IsShapeOf;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
I12: int

Returns
-------
bool
") IsShapeOf;
		Standard_Boolean IsShapeOf(const TopoDS_Shape & S, const Standard_Integer I12);

		/****************** IsSplit ******************/
		%feature("compactdefaultargs") IsSplit;
		%feature("autodoc", "Returns true if the shape <s> has been split.

Parameters
----------
S: TopoDS_Shape
TB: TopAbs_State

Returns
-------
bool
") IsSplit;
		Standard_Boolean IsSplit(const TopoDS_Shape & S, const TopAbs_State TB);

		/****************** KPClearMaps ******************/
		%feature("compactdefaultargs") KPClearMaps;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") KPClearMaps;
		void KPClearMaps();

		/****************** KPContains ******************/
		%feature("compactdefaultargs") KPContains;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
L: TopTools_ListOfShape

Returns
-------
bool
") KPContains;
		static Standard_Boolean KPContains(const TopoDS_Shape & S, const TopTools_ListOfShape & L);

		/****************** KPSameDomain ******************/
		%feature("compactdefaultargs") KPSameDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
L1: TopTools_ListOfShape
L2: TopTools_ListOfShape

Returns
-------
None
") KPSameDomain;
		void KPSameDomain(TopTools_ListOfShape & L1, TopTools_ListOfShape & L2);

		/****************** KPclasSS ******************/
		%feature("compactdefaultargs") KPclasSS;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
exceptLS1: TopTools_ListOfShape
S2: TopoDS_Shape

Returns
-------
TopAbs_State
") KPclasSS;
		TopAbs_State KPclasSS(const TopoDS_Shape & S1, const TopTools_ListOfShape & exceptLS1, const TopoDS_Shape & S2);

		/****************** KPclasSS ******************/
		%feature("compactdefaultargs") KPclasSS;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
exceptS1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
TopAbs_State
") KPclasSS;
		TopAbs_State KPclasSS(const TopoDS_Shape & S1, const TopoDS_Shape & exceptS1, const TopoDS_Shape & S2);

		/****************** KPclasSS ******************/
		%feature("compactdefaultargs") KPclasSS;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
TopAbs_State
") KPclasSS;
		TopAbs_State KPclasSS(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** KPclassF ******************/
		%feature("compactdefaultargs") KPclassF;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Shape
F2: TopoDS_Shape

Returns
-------
TopAbs_State
") KPclassF;
		TopAbs_State KPclassF(const TopoDS_Shape & F1, const TopoDS_Shape & F2);

		/****************** KPclassFF ******************/
		%feature("compactdefaultargs") KPclassFF;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Shape
F2: TopoDS_Shape
T1: TopAbs_State
T2: TopAbs_State

Returns
-------
None
") KPclassFF;
		void KPclassFF(const TopoDS_Shape & F1, const TopoDS_Shape & F2, TopAbs_State & T1, TopAbs_State & T2);

		/****************** KPisdisj ******************/
		%feature("compactdefaultargs") KPisdisj;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") KPisdisj;
		Standard_Integer KPisdisj();

		/****************** KPisdisjanalyse ******************/
		%feature("compactdefaultargs") KPisdisjanalyse;
		%feature("autodoc", "No available documentation.

Parameters
----------
ST1: TopAbs_State
ST2: TopAbs_State

Returns
-------
I: int
IC1: int
IC2: int
") KPisdisjanalyse;
		void KPisdisjanalyse(const TopAbs_State ST1, const TopAbs_State ST2, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** KPisdisjsh ******************/
		%feature("compactdefaultargs") KPisdisjsh;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
int
") KPisdisjsh;
		Standard_Integer KPisdisjsh(const TopoDS_Shape & S);

		/****************** KPisfafa ******************/
		%feature("compactdefaultargs") KPisfafa;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") KPisfafa;
		Standard_Integer KPisfafa();

		/****************** KPisfafash ******************/
		%feature("compactdefaultargs") KPisfafash;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
int
") KPisfafash;
		Standard_Integer KPisfafash(const TopoDS_Shape & S);

		/****************** KPiskole ******************/
		%feature("compactdefaultargs") KPiskole;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") KPiskole;
		Standard_Integer KPiskole();

		/****************** KPiskoleFF ******************/
		%feature("compactdefaultargs") KPiskoleFF;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Shape
F2: TopoDS_Shape
T1: TopAbs_State
T2: TopAbs_State

Returns
-------
bool
") KPiskoleFF;
		Standard_Boolean KPiskoleFF(const TopoDS_Shape & F1, const TopoDS_Shape & F2, TopAbs_State & T1, TopAbs_State & T2);

		/****************** KPiskoleanalyse ******************/
		%feature("compactdefaultargs") KPiskoleanalyse;
		%feature("autodoc", "No available documentation.

Parameters
----------
FT1: TopAbs_State
FT2: TopAbs_State
ST1: TopAbs_State
ST2: TopAbs_State

Returns
-------
I: int
I1: int
I2: int
") KPiskoleanalyse;
		void KPiskoleanalyse(const TopAbs_State FT1, const TopAbs_State FT2, const TopAbs_State ST1, const TopAbs_State ST2, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** KPiskolesh ******************/
		%feature("compactdefaultargs") KPiskolesh;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
LS: TopTools_ListOfShape
LF: TopTools_ListOfShape

Returns
-------
bool
") KPiskolesh;
		Standard_Boolean KPiskolesh(const TopoDS_Shape & S, TopTools_ListOfShape & LS, TopTools_ListOfShape & LF);

		/****************** KPiskoletge ******************/
		%feature("compactdefaultargs") KPiskoletge;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") KPiskoletge;
		Standard_Integer KPiskoletge();

		/****************** KPiskoletgeanalyse ******************/
		%feature("compactdefaultargs") KPiskoletgeanalyse;
		%feature("autodoc", "No available documentation.

Parameters
----------
Conf: TopOpeBRepDS_Config
ST1: TopAbs_State
ST2: TopAbs_State

Returns
-------
I: int
") KPiskoletgeanalyse;
		void KPiskoletgeanalyse(const TopOpeBRepDS_Config Conf, const TopAbs_State ST1, const TopAbs_State ST2, Standard_Integer &OutValue);

		/****************** KPiskoletgesh ******************/
		%feature("compactdefaultargs") KPiskoletgesh;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
LS: TopTools_ListOfShape
LF: TopTools_ListOfShape

Returns
-------
bool
") KPiskoletgesh;
		Standard_Boolean KPiskoletgesh(const TopoDS_Shape & S, TopTools_ListOfShape & LS, TopTools_ListOfShape & LF);

		/****************** KPissoso ******************/
		%feature("compactdefaultargs") KPissoso;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") KPissoso;
		Standard_Integer KPissoso();

		/****************** KPissososh ******************/
		%feature("compactdefaultargs") KPissososh;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
int
") KPissososh;
		Standard_Integer KPissososh(const TopoDS_Shape & S);

		/****************** KPlhg ******************/
		%feature("compactdefaultargs") KPlhg;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
T: TopAbs_ShapeEnum
L: TopTools_ListOfShape

Returns
-------
int
") KPlhg;
		Standard_Integer KPlhg(const TopoDS_Shape & S, const TopAbs_ShapeEnum T, TopTools_ListOfShape & L);

		/****************** KPlhg ******************/
		%feature("compactdefaultargs") KPlhg;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
T: TopAbs_ShapeEnum

Returns
-------
int
") KPlhg;
		Standard_Integer KPlhg(const TopoDS_Shape & S, const TopAbs_ShapeEnum T);

		/****************** KPlhsd ******************/
		%feature("compactdefaultargs") KPlhsd;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
T: TopAbs_ShapeEnum
L: TopTools_ListOfShape

Returns
-------
int
") KPlhsd;
		Standard_Integer KPlhsd(const TopoDS_Shape & S, const TopAbs_ShapeEnum T, TopTools_ListOfShape & L);

		/****************** KPlhsd ******************/
		%feature("compactdefaultargs") KPlhsd;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
T: TopAbs_ShapeEnum

Returns
-------
int
") KPlhsd;
		Standard_Integer KPlhsd(const TopoDS_Shape & S, const TopAbs_ShapeEnum T);

		/****************** KPls ******************/
		%feature("compactdefaultargs") KPls;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
T: TopAbs_ShapeEnum
L: TopTools_ListOfShape

Returns
-------
int
") KPls;
		static Standard_Integer KPls(const TopoDS_Shape & S, const TopAbs_ShapeEnum T, TopTools_ListOfShape & L);

		/****************** KPls ******************/
		%feature("compactdefaultargs") KPls;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
T: TopAbs_ShapeEnum

Returns
-------
int
") KPls;
		static Standard_Integer KPls(const TopoDS_Shape & S, const TopAbs_ShapeEnum T);

		/****************** KPmakeface ******************/
		%feature("compactdefaultargs") KPmakeface;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Shape
LF2: TopTools_ListOfShape
T1: TopAbs_State
T2: TopAbs_State
R1: bool
R2: bool

Returns
-------
TopoDS_Shape
") KPmakeface;
		TopoDS_Shape KPmakeface(const TopoDS_Shape & F1, const TopTools_ListOfShape & LF2, const TopAbs_State T1, const TopAbs_State T2, const Standard_Boolean R1, const Standard_Boolean R2);

		/****************** KPreturn ******************/
		%feature("compactdefaultargs") KPreturn;
		%feature("autodoc", "No available documentation.

Parameters
----------
KP: int

Returns
-------
int
") KPreturn;
		static Standard_Integer KPreturn(const Standard_Integer KP);

		/****************** KeepShape ******************/
		%feature("compactdefaultargs") KeepShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
LS: TopTools_ListOfShape
T: TopAbs_State

Returns
-------
bool
") KeepShape;
		Standard_Boolean KeepShape(const TopoDS_Shape & S, const TopTools_ListOfShape & LS, const TopAbs_State T);

		/****************** MSplit ******************/
		%feature("compactdefaultargs") MSplit;
		%feature("autodoc", "No available documentation.

Parameters
----------
s: TopAbs_State

Returns
-------
TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State
") MSplit;
		const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MSplit(const TopAbs_State s);

		/****************** MakeEdges ******************/
		%feature("compactdefaultargs") MakeEdges;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
B: TopOpeBRepBuild_EdgeBuilder
L: TopTools_ListOfShape

Returns
-------
None
") MakeEdges;
		void MakeEdges(const TopoDS_Shape & E, TopOpeBRepBuild_EdgeBuilder & B, TopTools_ListOfShape & L);

		/****************** MakeFaces ******************/
		%feature("compactdefaultargs") MakeFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape
B: TopOpeBRepBuild_FaceBuilder
L: TopTools_ListOfShape

Returns
-------
None
") MakeFaces;
		void MakeFaces(const TopoDS_Shape & F, TopOpeBRepBuild_FaceBuilder & B, TopTools_ListOfShape & L);

		/****************** MakeShells ******************/
		%feature("compactdefaultargs") MakeShells;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: TopOpeBRepBuild_SolidBuilder
L: TopTools_ListOfShape

Returns
-------
None
") MakeShells;
		void MakeShells(TopOpeBRepBuild_SolidBuilder & B, TopTools_ListOfShape & L);

		/****************** MakeSolids ******************/
		%feature("compactdefaultargs") MakeSolids;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: TopOpeBRepBuild_SolidBuilder
L: TopTools_ListOfShape

Returns
-------
None
") MakeSolids;
		void MakeSolids(TopOpeBRepBuild_SolidBuilder & B, TopTools_ListOfShape & L);

		/****************** MapShapes ******************/
		%feature("compactdefaultargs") MapShapes;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") MapShapes;
		void MapShapes(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** MergeEdges ******************/
		%feature("compactdefaultargs") MergeEdges;
		%feature("autodoc", "Merges the two edges <s1> and <s2> keeping the parts in each edge of states <tb1> and <tb2>. booleans ona, onb, onab indicate wheter parts of edges found as state on respectively on first, second, and both shapes must be (or not) built.

Parameters
----------
L1: TopTools_ListOfShape
TB1: TopAbs_State
L2: TopTools_ListOfShape
TB2: TopAbs_State
onA: bool,optional
	default value is Standard_False
onB: bool,optional
	default value is Standard_False
onAB: bool,optional
	default value is Standard_False

Returns
-------
None
") MergeEdges;
		void MergeEdges(const TopTools_ListOfShape & L1, const TopAbs_State TB1, const TopTools_ListOfShape & L2, const TopAbs_State TB2, const Standard_Boolean onA = Standard_False, const Standard_Boolean onB = Standard_False, const Standard_Boolean onAB = Standard_False);

		/****************** MergeFaces ******************/
		%feature("compactdefaultargs") MergeFaces;
		%feature("autodoc", "Merges the two faces <s1> and <s2> keeping the parts in each face of states <tb1> and <tb2>.

Parameters
----------
S1: TopTools_ListOfShape
TB1: TopAbs_State
S2: TopTools_ListOfShape
TB2: TopAbs_State
onA: bool,optional
	default value is Standard_False
onB: bool,optional
	default value is Standard_False
onAB: bool,optional
	default value is Standard_False

Returns
-------
None
") MergeFaces;
		void MergeFaces(const TopTools_ListOfShape & S1, const TopAbs_State TB1, const TopTools_ListOfShape & S2, const TopAbs_State TB2, const Standard_Boolean onA = Standard_False, const Standard_Boolean onB = Standard_False, const Standard_Boolean onAB = Standard_False);

		/****************** MergeKPart ******************/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MergeKPart;
		virtual void MergeKPart();

		/****************** MergeKPart ******************/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", "No available documentation.

Parameters
----------
TB1: TopAbs_State
TB2: TopAbs_State

Returns
-------
None
") MergeKPart;
		virtual void MergeKPart(const TopAbs_State TB1, const TopAbs_State TB2);

		/****************** MergeKPartisdisj ******************/
		%feature("compactdefaultargs") MergeKPartisdisj;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MergeKPartisdisj;
		void MergeKPartisdisj();

		/****************** MergeKPartisfafa ******************/
		%feature("compactdefaultargs") MergeKPartisfafa;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MergeKPartisfafa;
		void MergeKPartisfafa();

		/****************** MergeKPartiskole ******************/
		%feature("compactdefaultargs") MergeKPartiskole;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MergeKPartiskole;
		void MergeKPartiskole();

		/****************** MergeKPartiskoletge ******************/
		%feature("compactdefaultargs") MergeKPartiskoletge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MergeKPartiskoletge;
		void MergeKPartiskoletge();

		/****************** MergeKPartissoso ******************/
		%feature("compactdefaultargs") MergeKPartissoso;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MergeKPartissoso;
		void MergeKPartissoso();

		/****************** MergeShapes ******************/
		%feature("compactdefaultargs") MergeShapes;
		%feature("autodoc", "Merges the two shapes <s1> and <s2> keeping the parts of states <tb1>,<tb2> in <s1>,<s2>.

Parameters
----------
S1: TopoDS_Shape
TB1: TopAbs_State
S2: TopoDS_Shape
TB2: TopAbs_State

Returns
-------
None
") MergeShapes;
		void MergeShapes(const TopoDS_Shape & S1, const TopAbs_State TB1, const TopoDS_Shape & S2, const TopAbs_State TB2);

		/****************** MergeSolid ******************/
		%feature("compactdefaultargs") MergeSolid;
		%feature("autodoc", "Merges the solid <s> keeping the parts of state <tb>.

Parameters
----------
S: TopoDS_Shape
TB: TopAbs_State

Returns
-------
None
") MergeSolid;
		void MergeSolid(const TopoDS_Shape & S, const TopAbs_State TB);

		/****************** MergeSolids ******************/
		%feature("compactdefaultargs") MergeSolids;
		%feature("autodoc", "Merges the two solids <s1> and <s2> keeping the parts in each solid of states <tb1> and <tb2>.

Parameters
----------
S1: TopoDS_Shape
TB1: TopAbs_State
S2: TopoDS_Shape
TB2: TopAbs_State

Returns
-------
None
") MergeSolids;
		void MergeSolids(const TopoDS_Shape & S1, const TopAbs_State TB1, const TopoDS_Shape & S2, const TopAbs_State TB2);

		/****************** Merged ******************/
		%feature("compactdefaultargs") Merged;
		%feature("autodoc", "Returns the merged parts <tb> of shape <s>.

Parameters
----------
S: TopoDS_Shape
TB: TopAbs_State

Returns
-------
TopTools_ListOfShape
") Merged;
		const TopTools_ListOfShape & Merged(const TopoDS_Shape & S, const TopAbs_State TB);

		/****************** NewEdges ******************/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "Returns the edges created on curve <i>.

Parameters
----------
I: int

Returns
-------
TopTools_ListOfShape
") NewEdges;
		const TopTools_ListOfShape & NewEdges(const Standard_Integer I);

		/****************** NewFaces ******************/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "Returns the faces created on surface <i>.

Parameters
----------
I: int

Returns
-------
TopTools_ListOfShape
") NewFaces;
		const TopTools_ListOfShape & NewFaces(const Standard_Integer I);

		/****************** NewVertex ******************/
		%feature("compactdefaultargs") NewVertex;
		%feature("autodoc", "Returns the vertex created on point <i>.

Parameters
----------
I: int

Returns
-------
TopoDS_Shape
") NewVertex;
		const TopoDS_Shape NewVertex(const Standard_Integer I);

		/****************** Opec12 ******************/
		%feature("compactdefaultargs") Opec12;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Opec12;
		Standard_Boolean Opec12();

		/****************** Opec21 ******************/
		%feature("compactdefaultargs") Opec21;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Opec21;
		Standard_Boolean Opec21();

		/****************** Opecom ******************/
		%feature("compactdefaultargs") Opecom;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Opecom;
		Standard_Boolean Opecom();

		/****************** Opefus ******************/
		%feature("compactdefaultargs") Opefus;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Opefus;
		Standard_Boolean Opefus();

		/****************** Orient ******************/
		%feature("compactdefaultargs") Orient;
		%feature("autodoc", "No available documentation.

Parameters
----------
O: TopAbs_Orientation
R: bool

Returns
-------
TopAbs_Orientation
") Orient;
		static TopAbs_Orientation Orient(const TopAbs_Orientation O, const Standard_Boolean R);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Stores the data structure <hds>, create shapes from the new geometries.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") Perform;
		virtual void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Stores the data structure <hds>, create shapes from the new geometries, evaluates if an operation performed on shapes s1,s2 is a particular case.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") Perform;
		virtual void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** PrintCur ******************/
		%feature("compactdefaultargs") PrintCur;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") PrintCur;
		static void PrintCur(const TopoDS_Edge & E);

		/****************** PrintGeo ******************/
		%feature("compactdefaultargs") PrintGeo;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") PrintGeo;
		static void PrintGeo(const TopoDS_Shape & S);

		/****************** PrintOri ******************/
		%feature("compactdefaultargs") PrintOri;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") PrintOri;
		static void PrintOri(const TopoDS_Shape & S);

		/****************** PrintPnt ******************/
		%feature("compactdefaultargs") PrintPnt;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: TopoDS_Vertex

Returns
-------
None
") PrintPnt;
		static void PrintPnt(const TopoDS_Vertex & V);

		/****************** PrintSur ******************/
		%feature("compactdefaultargs") PrintSur;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") PrintSur;
		static void PrintSur(const TopoDS_Face & F);

		/****************** RegularizeFace ******************/
		%feature("compactdefaultargs") RegularizeFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
FF: TopoDS_Shape
newFace: TopoDS_Shape
LOF: TopTools_ListOfShape

Returns
-------
None
") RegularizeFace;
		void RegularizeFace(const TopoDS_Shape & FF, const TopoDS_Shape & newFace, TopTools_ListOfShape & LOF);

		/****************** RegularizeFaces ******************/
		%feature("compactdefaultargs") RegularizeFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
FF: TopoDS_Shape
lnewFace: TopTools_ListOfShape
LOF: TopTools_ListOfShape

Returns
-------
None
") RegularizeFaces;
		void RegularizeFaces(const TopoDS_Shape & FF, const TopTools_ListOfShape & lnewFace, TopTools_ListOfShape & LOF);

		/****************** RegularizeSolid ******************/
		%feature("compactdefaultargs") RegularizeSolid;
		%feature("autodoc", "No available documentation.

Parameters
----------
SS: TopoDS_Shape
newSolid: TopoDS_Shape
LOS: TopTools_ListOfShape

Returns
-------
None
") RegularizeSolid;
		void RegularizeSolid(const TopoDS_Shape & SS, const TopoDS_Shape & newSolid, TopTools_ListOfShape & LOS);

		/****************** RegularizeSolids ******************/
		%feature("compactdefaultargs") RegularizeSolids;
		%feature("autodoc", "No available documentation.

Parameters
----------
SS: TopoDS_Shape
lnewSolid: TopTools_ListOfShape
LOS: TopTools_ListOfShape

Returns
-------
None
") RegularizeSolids;
		void RegularizeSolids(const TopoDS_Shape & SS, const TopTools_ListOfShape & lnewSolid, TopTools_ListOfShape & LOS);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Parameters
----------
T1: TopAbs_State
T2: TopAbs_State

Returns
-------
bool
") Reverse;
		static Standard_Boolean Reverse(const TopAbs_State T1, const TopAbs_State T2);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Return all section edges.

Parameters
----------
L: TopTools_ListOfShape

Returns
-------
None
") Section;
		void Section(TopTools_ListOfShape & L);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") Section;
		const TopTools_ListOfShape & Section();

		/****************** SectionCurves ******************/
		%feature("compactdefaultargs") SectionCurves;
		%feature("autodoc", "Return the section edges built on new curves.

Parameters
----------
L: TopTools_ListOfShape

Returns
-------
None
") SectionCurves;
		void SectionCurves(TopTools_ListOfShape & L);

		/****************** SectionEdges ******************/
		%feature("compactdefaultargs") SectionEdges;
		%feature("autodoc", "Return the parts of edges found on the boundary of the two arguments s1,s2 of perform().

Parameters
----------
L: TopTools_ListOfShape

Returns
-------
None
") SectionEdges;
		void SectionEdges(TopTools_ListOfShape & L);

		/****************** ShapePosition ******************/
		%feature("compactdefaultargs") ShapePosition;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
LS: TopTools_ListOfShape

Returns
-------
TopAbs_State
") ShapePosition;
		TopAbs_State ShapePosition(const TopoDS_Shape & S, const TopTools_ListOfShape & LS);

		/****************** ShapeRank ******************/
		%feature("compactdefaultargs") ShapeRank;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
int
") ShapeRank;
		Standard_Integer ShapeRank(const TopoDS_Shape & S);

		/****************** SplitEvisoONperiodicF ******************/
		%feature("compactdefaultargs") SplitEvisoONperiodicF;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SplitEvisoONperiodicF;
		void SplitEvisoONperiodicF();

		/****************** SplitSectionEdge ******************/
		%feature("compactdefaultargs") SplitSectionEdge;
		%feature("autodoc", "Create parts on solid of section edges.

Parameters
----------
E: TopoDS_Shape

Returns
-------
None
") SplitSectionEdge;
		virtual void SplitSectionEdge(const TopoDS_Shape & E);

		/****************** SplitSectionEdges ******************/
		%feature("compactdefaultargs") SplitSectionEdges;
		%feature("autodoc", "Create parts on solid of section edges.

Returns
-------
None
") SplitSectionEdges;
		void SplitSectionEdges();

		/****************** Splits ******************/
		%feature("compactdefaultargs") Splits;
		%feature("autodoc", "Returns the split parts <tb> of shape <s>.

Parameters
----------
S: TopoDS_Shape
TB: TopAbs_State

Returns
-------
TopTools_ListOfShape
") Splits;
		const TopTools_ListOfShape & Splits(const TopoDS_Shape & S, const TopAbs_State TB);

		/****************** StringState ******************/
		%feature("compactdefaultargs") StringState;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopAbs_State

Returns
-------
TCollection_AsciiString
") StringState;
		static TCollection_AsciiString StringState(const TopAbs_State S);

		/****************** TopType ******************/
		%feature("compactdefaultargs") TopType;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopAbs_ShapeEnum
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
		%feature("compactdefaultargs") TopOpeBRepBuild_BuilderON;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_BuilderON;
		 TopOpeBRepBuild_BuilderON();

		/****************** TopOpeBRepBuild_BuilderON ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_BuilderON;
		%feature("autodoc", "No available documentation.

Parameters
----------
PB: TopOpeBRepBuild_PBuilder
F: TopoDS_Shape
PG: TopOpeBRepBuild_PGTopo
PLSclass: TopOpeBRepTool_Plos
PWES: TopOpeBRepBuild_PWireEdgeSet

Returns
-------
None
") TopOpeBRepBuild_BuilderON;
		 TopOpeBRepBuild_BuilderON(const TopOpeBRepBuild_PBuilder & PB, const TopoDS_Shape & F, const TopOpeBRepBuild_PGTopo & PG, const TopOpeBRepTool_Plos & PLSclass, const TopOpeBRepBuild_PWireEdgeSet & PWES);

		/****************** GFillONCheckI ******************/
		%feature("compactdefaultargs") GFillONCheckI;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
bool
") GFillONCheckI;
		Standard_Boolean GFillONCheckI(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** GFillONParts2dWES2 ******************/
		%feature("compactdefaultargs") GFillONParts2dWES2;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference
EspON: TopoDS_Shape

Returns
-------
None
") GFillONParts2dWES2;
		void GFillONParts2dWES2(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopoDS_Shape & EspON);

		/****************** GFillONPartsWES1 ******************/
		%feature("compactdefaultargs") GFillONPartsWES1;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
None
") GFillONPartsWES1;
		void GFillONPartsWES1(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** GFillONPartsWES2 ******************/
		%feature("compactdefaultargs") GFillONPartsWES2;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference
EspON: TopoDS_Shape

Returns
-------
None
") GFillONPartsWES2;
		void GFillONPartsWES2(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopoDS_Shape & EspON);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
PB: TopOpeBRepBuild_PBuilder
F: TopoDS_Shape
PG: TopOpeBRepBuild_PGTopo
PLSclass: TopOpeBRepTool_Plos
PWES: TopOpeBRepBuild_PWireEdgeSet

Returns
-------
None
") Perform;
		void Perform(const TopOpeBRepBuild_PBuilder & PB, const TopoDS_Shape & F, const TopOpeBRepBuild_PGTopo & PG, const TopOpeBRepTool_Plos & PLSclass, const TopOpeBRepBuild_PWireEdgeSet & PWES);

		/****************** Perform2d ******************/
		%feature("compactdefaultargs") Perform2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
PB: TopOpeBRepBuild_PBuilder
F: TopoDS_Shape
PG: TopOpeBRepBuild_PGTopo
PLSclass: TopOpeBRepTool_Plos
PWES: TopOpeBRepBuild_PWireEdgeSet

Returns
-------
None
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
		%feature("compactdefaultargs") TopOpeBRepBuild_CorrectFace2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_CorrectFace2d;
		 TopOpeBRepBuild_CorrectFace2d();

		/****************** TopOpeBRepBuild_CorrectFace2d ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_CorrectFace2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFace: TopoDS_Face
anAvoidMap: TopTools_IndexedMapOfOrientedShape
aMap: TopTools_IndexedDataMapOfShapeShape

Returns
-------
None
") TopOpeBRepBuild_CorrectFace2d;
		 TopOpeBRepBuild_CorrectFace2d(const TopoDS_Face & aFace, const TopTools_IndexedMapOfOrientedShape & anAvoidMap, TopTools_IndexedDataMapOfShapeShape & aMap);

		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFace: TopoDS_Face
aHeadList: TopTools_ListOfShape

Returns
-------
None
") CheckList;
		static void CheckList(const TopoDS_Face & aFace, TopTools_ListOfShape & aHeadList);

		/****************** CorrectedFace ******************/
		%feature("compactdefaultargs") CorrectedFace;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") CorrectedFace;
		const TopoDS_Face CorrectedFace();

		/****************** ErrorStatus ******************/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ErrorStatus;
		Standard_Integer ErrorStatus();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** GetP2dFL ******************/
		%feature("compactdefaultargs") GetP2dFL;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFace: TopoDS_Face
anEdge: TopoDS_Edge
P2dF: gp_Pnt2d
P2dL: gp_Pnt2d

Returns
-------
None
") GetP2dFL;
		static void GetP2dFL(const TopoDS_Face & aFace, const TopoDS_Edge & anEdge, gp_Pnt2d & P2dF, gp_Pnt2d & P2dL);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MapOfTrans2dInfo ******************/
		%feature("compactdefaultargs") MapOfTrans2dInfo;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_IndexedDataMapOfShapeShape
") MapOfTrans2dInfo;
		TopTools_IndexedDataMapOfShapeShape & MapOfTrans2dInfo();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		void Perform();

		/****************** SetMapOfTrans2dInfo ******************/
		%feature("compactdefaultargs") SetMapOfTrans2dInfo;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMap: TopTools_IndexedDataMapOfShapeShape

Returns
-------
None
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
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceBuilder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_FaceBuilder;
		 TopOpeBRepBuild_FaceBuilder();

		/****************** TopOpeBRepBuild_FaceBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceBuilder;
		%feature("autodoc", "Create a facebuilder to build the faces on the shapes (wires, blocks of edge) described by <ls>.

Parameters
----------
ES: TopOpeBRepBuild_WireEdgeSet
F: TopoDS_Shape
ForceClass: bool,optional
	default value is Standard_False

Returns
-------
None
") TopOpeBRepBuild_FaceBuilder;
		 TopOpeBRepBuild_FaceBuilder(TopOpeBRepBuild_WireEdgeSet & ES, const TopoDS_Shape & F, const Standard_Boolean ForceClass = Standard_False);

		/****************** AddEdgeWire ******************/
		%feature("compactdefaultargs") AddEdgeWire;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
W: TopoDS_Shape

Returns
-------
int
") AddEdgeWire;
		Standard_Integer AddEdgeWire(const TopoDS_Shape & E, TopoDS_Shape & W);

		/****************** CorrectGclosedWire ******************/
		%feature("compactdefaultargs") CorrectGclosedWire;
		%feature("autodoc", "Using the given maps, change the topology of the 3d-closed wires, in order to get closed wires.

Parameters
----------
mapVVref: TopTools_IndexedDataMapOfShapeShape
mapVon1Edge: TopTools_IndexedDataMapOfShapeShape

Returns
-------
None
") CorrectGclosedWire;
		void CorrectGclosedWire(const TopTools_IndexedDataMapOfShapeShape & mapVVref, const TopTools_IndexedDataMapOfShapeShape & mapVon1Edge);

		/****************** DetectPseudoInternalEdge ******************/
		%feature("compactdefaultargs") DetectPseudoInternalEdge;
		%feature("autodoc", "Removes edges appearing twice (forward,reversed) with a bounding vertex not connected to any other edge. mape contains edges found. modifies myblockbuilder.

Parameters
----------
mapE: TopTools_IndexedMapOfShape

Returns
-------
None
") DetectPseudoInternalEdge;
		void DetectPseudoInternalEdge(TopTools_IndexedMapOfShape & mapE);

		/****************** DetectUnclosedWire ******************/
		%feature("compactdefaultargs") DetectUnclosedWire;
		%feature("autodoc", "Removes are non 3d-closed wires. fills up maps <mapvvsameg> and <mapvon1edge>, in order to correct 3d-closed but unclosed (topologic connexity) wires. modifies myblockbuilder.

Parameters
----------
mapVVsameG: TopTools_IndexedDataMapOfShapeShape
mapVon1Edge: TopTools_IndexedDataMapOfShapeShape

Returns
-------
None
") DetectUnclosedWire;
		void DetectUnclosedWire(TopTools_IndexedDataMapOfShapeShape & mapVVsameG, TopTools_IndexedDataMapOfShapeShape & mapVon1Edge);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns current new edge of current new wire.

Returns
-------
TopoDS_Shape
") Edge;
		const TopoDS_Shape Edge();

		/****************** EdgeConnexity ******************/
		%feature("compactdefaultargs") EdgeConnexity;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape

Returns
-------
int
") EdgeConnexity;
		Standard_Integer EdgeConnexity(const TopoDS_Shape & E);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return myface.

Returns
-------
TopoDS_Shape
") Face;
		const TopoDS_Shape Face();

		/****************** FindNextValidElement ******************/
		%feature("compactdefaultargs") FindNextValidElement;
		%feature("autodoc", "Iterates on myblockiterator until finding a valid element.

Returns
-------
None
") FindNextValidElement;
		void FindNextValidElement();

		/****************** InitEdge ******************/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") InitEdge;
		Standard_Integer InitEdge();

		/****************** InitFace ******************/
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") InitFace;
		Standard_Integer InitFace();

		/****************** InitFaceBuilder ******************/
		%feature("compactdefaultargs") InitFaceBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
ES: TopOpeBRepBuild_WireEdgeSet
F: TopoDS_Shape
ForceClass: bool

Returns
-------
None
") InitFaceBuilder;
		void InitFaceBuilder(TopOpeBRepBuild_WireEdgeSet & ES, const TopoDS_Shape & F, const Standard_Boolean ForceClass);

		/****************** InitWire ******************/
		%feature("compactdefaultargs") InitWire;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") InitWire;
		Standard_Integer InitWire();

		/****************** IsOldWire ******************/
		%feature("compactdefaultargs") IsOldWire;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsOldWire;
		Standard_Boolean IsOldWire();

		/****************** MoreEdge ******************/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreEdge;
		Standard_Boolean MoreEdge();

		/****************** MoreFace ******************/
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreFace;
		Standard_Boolean MoreFace();

		/****************** MoreWire ******************/
		%feature("compactdefaultargs") MoreWire;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreWire;
		Standard_Boolean MoreWire();

		/****************** NextEdge ******************/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextEdge;
		void NextEdge();

		/****************** NextFace ******************/
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextFace;
		void NextFace();

		/****************** NextWire ******************/
		%feature("compactdefaultargs") NextWire;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextWire;
		void NextWire();

		/****************** OldWire ******************/
		%feature("compactdefaultargs") OldWire;
		%feature("autodoc", "Returns current wire this wire may be : * an old wire oldwire(), which has not been reconstructed; * a new wire made of edges described by ...newedge() methods.

Returns
-------
TopoDS_Shape
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
		%feature("compactdefaultargs") TopOpeBRepBuild_FuseFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_FuseFace;
		 TopOpeBRepBuild_FuseFace();

		/****************** TopOpeBRepBuild_FuseFace ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_FuseFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
LIF: TopTools_ListOfShape
LRF: TopTools_ListOfShape
CXM: int

Returns
-------
None
") TopOpeBRepBuild_FuseFace;
		 TopOpeBRepBuild_FuseFace(const TopTools_ListOfShape & LIF, const TopTools_ListOfShape & LRF, const Standard_Integer CXM);

		/****************** ClearEdge ******************/
		%feature("compactdefaultargs") ClearEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ClearEdge;
		void ClearEdge();

		/****************** ClearVertex ******************/
		%feature("compactdefaultargs") ClearVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ClearVertex;
		void ClearVertex();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
LIF: TopTools_ListOfShape
LRF: TopTools_ListOfShape
CXM: int

Returns
-------
None
") Init;
		void Init(const TopTools_ListOfShape & LIF, const TopTools_ListOfShape & LRF, const Standard_Integer CXM);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsModified ******************/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsModified;
		Standard_Boolean IsModified();

		/****************** LExternEdge ******************/
		%feature("compactdefaultargs") LExternEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") LExternEdge;
		const TopTools_ListOfShape & LExternEdge();

		/****************** LExternVertex ******************/
		%feature("compactdefaultargs") LExternVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") LExternVertex;
		const TopTools_ListOfShape & LExternVertex();

		/****************** LFuseFace ******************/
		%feature("compactdefaultargs") LFuseFace;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") LFuseFace;
		const TopTools_ListOfShape & LFuseFace();

		/****************** LInternEdge ******************/
		%feature("compactdefaultargs") LInternEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") LInternEdge;
		const TopTools_ListOfShape & LInternEdge();

		/****************** LInternVertex ******************/
		%feature("compactdefaultargs") LInternVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") LInternVertex;
		const TopTools_ListOfShape & LInternVertex();

		/****************** LModifEdge ******************/
		%feature("compactdefaultargs") LModifEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") LModifEdge;
		const TopTools_ListOfShape & LModifEdge();

		/****************** LModifVertex ******************/
		%feature("compactdefaultargs") LModifVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") LModifVertex;
		const TopTools_ListOfShape & LModifVertex();

		/****************** PerformEdge ******************/
		%feature("compactdefaultargs") PerformEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") PerformEdge;
		void PerformEdge();

		/****************** PerformFace ******************/
		%feature("compactdefaultargs") PerformFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		%feature("compactdefaultargs") TopOpeBRepBuild_GIter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_GIter;
		 TopOpeBRepBuild_GIter();

		/****************** TopOpeBRepBuild_GIter ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_GIter;
		%feature("autodoc", "No available documentation.

Parameters
----------
G: TopOpeBRepBuild_GTopo

Returns
-------
None
") TopOpeBRepBuild_GIter;
		 TopOpeBRepBuild_GIter(const TopOpeBRepBuild_GTopo & G);

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "No available documentation.

Parameters
----------
s1: TopAbs_State
s2: TopAbs_State

Returns
-------
None
") Current;
		void Current(TopAbs_State & s1, TopAbs_State & s2);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
G: TopOpeBRepBuild_GTopo

Returns
-------
None
") Init;
		void Init(const TopOpeBRepBuild_GTopo & G);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GComDiff ******************/
		%feature("compactdefaultargs") GComDiff;
		%feature("autodoc", "No available documentation.

Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Returns
-------
TopOpeBRepBuild_GTopo
") GComDiff;
		static TopOpeBRepBuild_GTopo GComDiff(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

		/****************** GComSame ******************/
		%feature("compactdefaultargs") GComSame;
		%feature("autodoc", "No available documentation.

Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Returns
-------
TopOpeBRepBuild_GTopo
") GComSame;
		static TopOpeBRepBuild_GTopo GComSame(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

		/****************** GComUnsh ******************/
		%feature("compactdefaultargs") GComUnsh;
		%feature("autodoc", "No available documentation.

Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Returns
-------
TopOpeBRepBuild_GTopo
") GComUnsh;
		static TopOpeBRepBuild_GTopo GComUnsh(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

		/****************** GCutDiff ******************/
		%feature("compactdefaultargs") GCutDiff;
		%feature("autodoc", "No available documentation.

Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Returns
-------
TopOpeBRepBuild_GTopo
") GCutDiff;
		static TopOpeBRepBuild_GTopo GCutDiff(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

		/****************** GCutSame ******************/
		%feature("compactdefaultargs") GCutSame;
		%feature("autodoc", "No available documentation.

Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Returns
-------
TopOpeBRepBuild_GTopo
") GCutSame;
		static TopOpeBRepBuild_GTopo GCutSame(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

		/****************** GCutUnsh ******************/
		%feature("compactdefaultargs") GCutUnsh;
		%feature("autodoc", "No available documentation.

Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Returns
-------
TopOpeBRepBuild_GTopo
") GCutUnsh;
		static TopOpeBRepBuild_GTopo GCutUnsh(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

		/****************** GFusDiff ******************/
		%feature("compactdefaultargs") GFusDiff;
		%feature("autodoc", "No available documentation.

Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Returns
-------
TopOpeBRepBuild_GTopo
") GFusDiff;
		static TopOpeBRepBuild_GTopo GFusDiff(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

		/****************** GFusSame ******************/
		%feature("compactdefaultargs") GFusSame;
		%feature("autodoc", "No available documentation.

Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Returns
-------
TopOpeBRepBuild_GTopo
") GFusSame;
		static TopOpeBRepBuild_GTopo GFusSame(const TopAbs_ShapeEnum s1, const TopAbs_ShapeEnum s2);

		/****************** GFusUnsh ******************/
		%feature("compactdefaultargs") GFusUnsh;
		%feature("autodoc", "No available documentation.

Parameters
----------
s1: TopAbs_ShapeEnum
s2: TopAbs_ShapeEnum

Returns
-------
TopOpeBRepBuild_GTopo
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
		%feature("compactdefaultargs") TopOpeBRepBuild_GTopo;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_GTopo;
		 TopOpeBRepBuild_GTopo();

		/****************** TopOpeBRepBuild_GTopo ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_GTopo;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") TopOpeBRepBuild_GTopo;
		 TopOpeBRepBuild_GTopo(const Standard_Boolean II, const Standard_Boolean IN, const Standard_Boolean IO, const Standard_Boolean NI, const Standard_Boolean NN, const Standard_Boolean NO, const Standard_Boolean OI, const Standard_Boolean ON, const Standard_Boolean OO, const TopAbs_ShapeEnum t1, const TopAbs_ShapeEnum t2, const TopOpeBRepDS_Config C1, const TopOpeBRepDS_Config C2);

		/****************** ChangeConfig ******************/
		%feature("compactdefaultargs") ChangeConfig;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: TopOpeBRepDS_Config
C2: TopOpeBRepDS_Config

Returns
-------
None
") ChangeConfig;
		void ChangeConfig(const TopOpeBRepDS_Config C1, const TopOpeBRepDS_Config C2);

		/****************** ChangeType ******************/
		%feature("compactdefaultargs") ChangeType;
		%feature("autodoc", "No available documentation.

Parameters
----------
t1: TopAbs_ShapeEnum
t2: TopAbs_ShapeEnum

Returns
-------
None
") ChangeType;
		void ChangeType(const TopAbs_ShapeEnum t1, const TopAbs_ShapeEnum t2);

		/****************** ChangeValue ******************/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
i1: int
i2: int
b: bool

Returns
-------
None
") ChangeValue;
		void ChangeValue(const Standard_Integer i1, const Standard_Integer i2, const Standard_Boolean b);

		/****************** ChangeValue ******************/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
s1: TopAbs_State
s2: TopAbs_State
b: bool

Returns
-------
None
") ChangeValue;
		void ChangeValue(const TopAbs_State s1, const TopAbs_State s2, const Standard_Boolean b);

		/****************** Config1 ******************/
		%feature("compactdefaultargs") Config1;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Config
") Config1;
		TopOpeBRepDS_Config Config1();

		/****************** Config2 ******************/
		%feature("compactdefaultargs") Config2;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Config
") Config2;
		TopOpeBRepDS_Config Config2();

		/****************** CopyPermuted ******************/
		%feature("compactdefaultargs") CopyPermuted;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepBuild_GTopo
") CopyPermuted;
		TopOpeBRepBuild_GTopo CopyPermuted();


        %feature("autodoc", "1");
        %extend{
            std::string DumpTypeToString() {
            std::stringstream s;
            self->DumpType(s);
            return s.str();}
        };
		/****************** GIndex ******************/
		%feature("compactdefaultargs") GIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopAbs_State

Returns
-------
int
") GIndex;
		Standard_Integer GIndex(const TopAbs_State S);

		/****************** GState ******************/
		%feature("compactdefaultargs") GState;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopAbs_State
") GState;
		TopAbs_State GState(const Standard_Integer I);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Parameters
----------
II: int

Returns
-------
i1: int
i2: int
") Index;
		void Index(const Standard_Integer II, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** IsToReverse1 ******************/
		%feature("compactdefaultargs") IsToReverse1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsToReverse1;
		Standard_Boolean IsToReverse1();

		/****************** IsToReverse2 ******************/
		%feature("compactdefaultargs") IsToReverse2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsToReverse2;
		Standard_Boolean IsToReverse2();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reset;
		void Reset();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Reverse;
		Standard_Boolean Reverse();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") Set;
		void Set(const Standard_Boolean II, const Standard_Boolean IN, const Standard_Boolean IO, const Standard_Boolean NI, const Standard_Boolean NN, const Standard_Boolean NO, const Standard_Boolean OI, const Standard_Boolean ON, const Standard_Boolean OO);

		/****************** SetReverse ******************/
		%feature("compactdefaultargs") SetReverse;
		%feature("autodoc", "No available documentation.

Parameters
----------
rev: bool

Returns
-------
None
") SetReverse;
		void SetReverse(const Standard_Boolean rev);

		/****************** StatesON ******************/
		%feature("compactdefaultargs") StatesON;
		%feature("autodoc", "No available documentation.

Parameters
----------
s1: TopAbs_State
s2: TopAbs_State

Returns
-------
None
") StatesON;
		void StatesON(TopAbs_State & s1, TopAbs_State & s2);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Parameters
----------
t1: TopAbs_ShapeEnum
t2: TopAbs_ShapeEnum

Returns
-------
None
") Type;
		void Type(TopAbs_ShapeEnum & t1, TopAbs_ShapeEnum & t2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
s1: TopAbs_State
s2: TopAbs_State

Returns
-------
bool
") Value;
		Standard_Boolean Value(const TopAbs_State s1, const TopAbs_State s2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
I1: int
I2: int

Returns
-------
bool
") Value;
		Standard_Boolean Value(const Standard_Integer I1, const Standard_Integer I2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
II: int

Returns
-------
bool
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
		%feature("compactdefaultargs") TopOpeBRepBuild_HBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
BT: TopOpeBRepDS_BuildTool

Returns
-------
None
") TopOpeBRepBuild_HBuilder;
		 TopOpeBRepBuild_HBuilder(const TopOpeBRepDS_BuildTool & BT);

		/****************** BuildTool ******************/
		%feature("compactdefaultargs") BuildTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_BuildTool
") BuildTool;
		const TopOpeBRepDS_BuildTool & BuildTool();

		/****************** ChangeBuildTool ******************/
		%feature("compactdefaultargs") ChangeBuildTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_BuildTool
") ChangeBuildTool;
		TopOpeBRepDS_BuildTool & ChangeBuildTool();

		/****************** ChangeBuilder ******************/
		%feature("compactdefaultargs") ChangeBuilder;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepBuild_Builder
") ChangeBuilder;
		TopOpeBRepBuild_Builder & ChangeBuilder();

		/****************** ChangeNewEdges ******************/
		%feature("compactdefaultargs") ChangeNewEdges;
		%feature("autodoc", "Returns the edges created on curve <i>.

Parameters
----------
I: int

Returns
-------
TopTools_ListOfShape
") ChangeNewEdges;
		TopTools_ListOfShape & ChangeNewEdges(const Standard_Integer I);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes all split and merge already performed. does not clear the handled ds.

Returns
-------
None
") Clear;
		void Clear();

		/****************** CurrentSection ******************/
		%feature("compactdefaultargs") CurrentSection;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") CurrentSection;
		const TopoDS_Shape CurrentSection();

		/****************** DataStructure ******************/
		%feature("compactdefaultargs") DataStructure;
		%feature("autodoc", "Returns the ds handled by this builder.

Returns
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>
") DataStructure;
		opencascade::handle<TopOpeBRepDS_HDataStructure> DataStructure();

		/****************** EdgeCurveAncestors ******************/
		%feature("compactdefaultargs") EdgeCurveAncestors;
		%feature("autodoc", "Search for the couple of face f1,f2 (from arguments of supra perform(s1,s2,hds)) method which intersection gives section edge e built on an intersection curve. returns true if f1,f2 have been valued. returns false if e is not a section edge built on intersection curve ic.

Parameters
----------
E: TopoDS_Shape
F1: TopoDS_Shape
F2: TopoDS_Shape

Returns
-------
IC: int
") EdgeCurveAncestors;
		Standard_Boolean EdgeCurveAncestors(const TopoDS_Shape & E, TopoDS_Shape & F1, TopoDS_Shape & F2, Standard_Integer &OutValue);

		/****************** EdgeSectionAncestors ******************/
		%feature("compactdefaultargs") EdgeSectionAncestors;
		%feature("autodoc", "Search for the couple of face f1,f2 (from arguments of supra perform(s1,s2,hds)) method which intersection gives section edge e built on at least one edge . returns true if f1,f2 have been valued. returns false if e is not a section edge built on at least one edge of s1 and/or s2. le1,le2 are edges of s1,s2 which common part is edge e. le1 or le2 may be empty() but not both.

Parameters
----------
E: TopoDS_Shape
LF1: TopTools_ListOfShape
LF2: TopTools_ListOfShape
LE1: TopTools_ListOfShape
LE2: TopTools_ListOfShape

Returns
-------
bool
") EdgeSectionAncestors;
		Standard_Boolean EdgeSectionAncestors(const TopoDS_Shape & E, TopTools_ListOfShape & LF1, TopTools_ListOfShape & LF2, TopTools_ListOfShape & LE1, TopTools_ListOfShape & LE2);

		/****************** GetDSCurveFromSectEdge ******************/
		%feature("compactdefaultargs") GetDSCurveFromSectEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
SectEdge: TopoDS_Shape

Returns
-------
int
") GetDSCurveFromSectEdge;
		Standard_Integer GetDSCurveFromSectEdge(const TopoDS_Shape & SectEdge);

		/****************** GetDSEdgeFromSectEdge ******************/
		%feature("compactdefaultargs") GetDSEdgeFromSectEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
rank: int

Returns
-------
int
") GetDSEdgeFromSectEdge;
		Standard_Integer GetDSEdgeFromSectEdge(const TopoDS_Shape & E, const Standard_Integer rank);

		/****************** GetDSFaceFromDSCurve ******************/
		%feature("compactdefaultargs") GetDSFaceFromDSCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
indexCur: int
rank: int

Returns
-------
int
") GetDSFaceFromDSCurve;
		Standard_Integer GetDSFaceFromDSCurve(const Standard_Integer indexCur, const Standard_Integer rank);

		/****************** GetDSFaceFromDSEdge ******************/
		%feature("compactdefaultargs") GetDSFaceFromDSEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
indexEdg: int
rank: int

Returns
-------
TColStd_ListOfInteger
") GetDSFaceFromDSEdge;
		TColStd_ListOfInteger & GetDSFaceFromDSEdge(const Standard_Integer indexEdg, const Standard_Integer rank);

		/****************** GetDSPointFromNewVertex ******************/
		%feature("compactdefaultargs") GetDSPointFromNewVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
NewVert: TopoDS_Shape

Returns
-------
int
") GetDSPointFromNewVertex;
		Standard_Integer GetDSPointFromNewVertex(const TopoDS_Shape & NewVert);

		/****************** InitExtendedSectionDS ******************/
		%feature("compactdefaultargs") InitExtendedSectionDS;
		%feature("autodoc", "No available documentation.

Parameters
----------
k: int,optional
	default value is 3

Returns
-------
None
") InitExtendedSectionDS;
		void InitExtendedSectionDS(const Standard_Integer k = 3);

		/****************** InitSection ******************/
		%feature("compactdefaultargs") InitSection;
		%feature("autodoc", "No available documentation.

Parameters
----------
k: int,optional
	default value is 3

Returns
-------
None
") InitSection;
		void InitSection(const Standard_Integer k = 3);

		/****************** IsKPart ******************/
		%feature("compactdefaultargs") IsKPart;
		%feature("autodoc", "Returns 0 is standard operation, != 0 if particular case.

Returns
-------
int
") IsKPart;
		Standard_Integer IsKPart();

		/****************** IsMerged ******************/
		%feature("compactdefaultargs") IsMerged;
		%feature("autodoc", "Returns true if the shape <s> has been merged.

Parameters
----------
S: TopoDS_Shape
ToBuild: TopAbs_State

Returns
-------
bool
") IsMerged;
		Standard_Boolean IsMerged(const TopoDS_Shape & S, const TopAbs_State ToBuild);

		/****************** IsSplit ******************/
		%feature("compactdefaultargs") IsSplit;
		%feature("autodoc", "Returns true if the shape <s> has been split.

Parameters
----------
S: TopoDS_Shape
ToBuild: TopAbs_State

Returns
-------
bool
") IsSplit;
		Standard_Boolean IsSplit(const TopoDS_Shape & S, const TopAbs_State ToBuild);

		/****************** MergeKPart ******************/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", "No available documentation.

Parameters
----------
TB1: TopAbs_State
TB2: TopAbs_State

Returns
-------
None
") MergeKPart;
		void MergeKPart(const TopAbs_State TB1, const TopAbs_State TB2);

		/****************** MergeShapes ******************/
		%feature("compactdefaultargs") MergeShapes;
		%feature("autodoc", "Merges the two shapes <s1> and <s2> keeping the parts of states <tb1>,<tb2> in <s1>,<s2>.

Parameters
----------
S1: TopoDS_Shape
TB1: TopAbs_State
S2: TopoDS_Shape
TB2: TopAbs_State

Returns
-------
None
") MergeShapes;
		void MergeShapes(const TopoDS_Shape & S1, const TopAbs_State TB1, const TopoDS_Shape & S2, const TopAbs_State TB2);

		/****************** MergeSolid ******************/
		%feature("compactdefaultargs") MergeSolid;
		%feature("autodoc", "Merges the solid <s> keeping the parts of state <tb>.

Parameters
----------
S: TopoDS_Shape
TB: TopAbs_State

Returns
-------
None
") MergeSolid;
		void MergeSolid(const TopoDS_Shape & S, const TopAbs_State TB);

		/****************** MergeSolids ******************/
		%feature("compactdefaultargs") MergeSolids;
		%feature("autodoc", "Merges the two solids <s1> and <s2> keeping the parts in each solid of states <tb1> and <tb2>.

Parameters
----------
S1: TopoDS_Shape
TB1: TopAbs_State
S2: TopoDS_Shape
TB2: TopAbs_State

Returns
-------
None
") MergeSolids;
		void MergeSolids(const TopoDS_Shape & S1, const TopAbs_State TB1, const TopoDS_Shape & S2, const TopAbs_State TB2);

		/****************** Merged ******************/
		%feature("compactdefaultargs") Merged;
		%feature("autodoc", "Returns the merged parts <tobuild> of shape <s>.

Parameters
----------
S: TopoDS_Shape
ToBuild: TopAbs_State

Returns
-------
TopTools_ListOfShape
") Merged;
		const TopTools_ListOfShape & Merged(const TopoDS_Shape & S, const TopAbs_State ToBuild);

		/****************** MoreSection ******************/
		%feature("compactdefaultargs") MoreSection;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreSection;
		Standard_Boolean MoreSection();

		/****************** NewEdges ******************/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "Returns the edges created on curve <i>.

Parameters
----------
I: int

Returns
-------
TopTools_ListOfShape
") NewEdges;
		const TopTools_ListOfShape & NewEdges(const Standard_Integer I);

		/****************** NewFaces ******************/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "Returns the faces created on surface <i>.

Parameters
----------
I: int

Returns
-------
TopTools_ListOfShape
") NewFaces;
		const TopTools_ListOfShape & NewFaces(const Standard_Integer I);

		/****************** NewVertex ******************/
		%feature("compactdefaultargs") NewVertex;
		%feature("autodoc", "Returns the vertex created on point <i>.

Parameters
----------
I: int

Returns
-------
TopoDS_Shape
") NewVertex;
		const TopoDS_Shape NewVertex(const Standard_Integer I);

		/****************** NextSection ******************/
		%feature("compactdefaultargs") NextSection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextSection;
		void NextSection();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Stores the data structure <hds>, create shapes from the new geometries described in <hds>.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Same as previous + evaluates if an operation performed on shapes s1,s2 is a particular case.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") Section;
		const TopTools_ListOfShape & Section();

		/****************** Splits ******************/
		%feature("compactdefaultargs") Splits;
		%feature("autodoc", "Returns the split parts <tobuild> of shape <s>.

Parameters
----------
S: TopoDS_Shape
ToBuild: TopAbs_State

Returns
-------
TopTools_ListOfShape
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
		%feature("compactdefaultargs") TopOpeBRepBuild_Loop;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") TopOpeBRepBuild_Loop;
		 TopOpeBRepBuild_Loop(const TopoDS_Shape & S);

		/****************** TopOpeBRepBuild_Loop ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_Loop;
		%feature("autodoc", "No available documentation.

Parameters
----------
BI: TopOpeBRepBuild_BlockIterator

Returns
-------
None
") TopOpeBRepBuild_Loop;
		 TopOpeBRepBuild_Loop(const TopOpeBRepBuild_BlockIterator & BI);

		/****************** BlockIterator ******************/
		%feature("compactdefaultargs") BlockIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepBuild_BlockIterator
") BlockIterator;
		const TopOpeBRepBuild_BlockIterator & BlockIterator();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		virtual void Dump();

		/****************** IsShape ******************/
		%feature("compactdefaultargs") IsShape;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsShape;
		virtual Standard_Boolean IsShape();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
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
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Returns the state of loop <l1> compared with loop <l2>.

Parameters
----------
L1: TopOpeBRepBuild_Loop
L2: TopOpeBRepBuild_Loop

Returns
-------
TopAbs_State
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
		%feature("compactdefaultargs") TopOpeBRepBuild_LoopSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_LoopSet;
		 TopOpeBRepBuild_LoopSet();

		/****************** ChangeListOfLoop ******************/
		%feature("compactdefaultargs") ChangeListOfLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepBuild_ListOfLoop
") ChangeListOfLoop;
		TopOpeBRepBuild_ListOfLoop & ChangeListOfLoop();

		/****************** InitLoop ******************/
		%feature("compactdefaultargs") InitLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitLoop;
		virtual void InitLoop();

		/****************** Loop ******************/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRepBuild_Loop>
") Loop;
		virtual opencascade::handle<TopOpeBRepBuild_Loop> Loop();

		/****************** MoreLoop ******************/
		%feature("compactdefaultargs") MoreLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreLoop;
		virtual Standard_Boolean MoreLoop();

		/****************** NextLoop ******************/
		%feature("compactdefaultargs") NextLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeListOfShape;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_ShapeListOfShape;
		 TopOpeBRepBuild_ShapeListOfShape();

		/****************** TopOpeBRepBuild_ShapeListOfShape ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeListOfShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") TopOpeBRepBuild_ShapeListOfShape;
		 TopOpeBRepBuild_ShapeListOfShape(const TopoDS_Shape & S);

		/****************** TopOpeBRepBuild_ShapeListOfShape ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeListOfShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
L: TopTools_ListOfShape

Returns
-------
None
") TopOpeBRepBuild_ShapeListOfShape;
		 TopOpeBRepBuild_ShapeListOfShape(const TopoDS_Shape & S, const TopTools_ListOfShape & L);

		/****************** ChangeList ******************/
		%feature("compactdefaultargs") ChangeList;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") ChangeList;
		TopTools_ListOfShape & ChangeList();

		/****************** ChangeShape ******************/
		%feature("compactdefaultargs") ChangeShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") ChangeShape;
		TopoDS_Shape ChangeShape();

		/****************** List ******************/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") List;
		const TopTools_ListOfShape & List();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
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
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeSet;
		%feature("autodoc", "Creates a shapeset in order to build shapes connected by <subshapetype> shapes. <checkshape>:check (or not) the shapes, startelements, elements added.

Parameters
----------
SubShapeType: TopAbs_ShapeEnum
checkshape: bool,optional
	default value is Standard_True

Returns
-------
None
") TopOpeBRepBuild_ShapeSet;
		 TopOpeBRepBuild_ShapeSet(const TopAbs_ShapeEnum SubShapeType, const Standard_Boolean checkshape = Standard_True);

		/****************** AddElement ******************/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "For each subshape se of s of type mysubshapetype - add subshapes of s to the map of subshapes (mysubshapemap) - add s to the list of shape incident to subshapes of s.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") AddElement;
		virtual void AddElement(const TopoDS_Shape & S);

		/****************** AddShape ******************/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "Adds <s> to the list of shapes. (wires or shells).

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") AddShape;
		virtual void AddShape(const TopoDS_Shape & S);

		/****************** AddStartElement ******************/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "(s is a face or edge) add s to the list of starting shapes used for reconstructions. apply addelement(s).

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") AddStartElement;
		virtual void AddStartElement(const TopoDS_Shape & S);

		/****************** ChangeStartShapes ******************/
		%feature("compactdefaultargs") ChangeStartShapes;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") ChangeStartShapes;
		TopTools_ListOfShape & ChangeStartShapes();

		/****************** CheckShape ******************/
		%feature("compactdefaultargs") CheckShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
checkshape: bool

Returns
-------
None
") CheckShape;
		void CheckShape(const Standard_Boolean checkshape);

		/****************** CheckShape ******************/
		%feature("compactdefaultargs") CheckShape;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") CheckShape;
		Standard_Boolean CheckShape();

		/****************** CheckShape ******************/
		%feature("compactdefaultargs") CheckShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
checkgeom: bool,optional
	default value is Standard_False

Returns
-------
bool
") CheckShape;
		Standard_Boolean CheckShape(const TopoDS_Shape & S, const Standard_Boolean checkgeom = Standard_False);

		/****************** DEBName ******************/
		%feature("compactdefaultargs") DEBName;
		%feature("autodoc", "No available documentation.

Parameters
----------
N: TCollection_AsciiString

Returns
-------
None
") DEBName;
		void DEBName(const TCollection_AsciiString & N);

		/****************** DEBName ******************/
		%feature("compactdefaultargs") DEBName;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") DEBName;
		const TCollection_AsciiString & DEBName();

		/****************** DEBNumber ******************/
		%feature("compactdefaultargs") DEBNumber;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") DEBNumber;
		void DEBNumber(const Standard_Integer I);

		/****************** DEBNumber ******************/
		%feature("compactdefaultargs") DEBNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") DEBNumber;
		Standard_Integer DEBNumber();

		/****************** DumpBB ******************/
		%feature("compactdefaultargs") DumpBB;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") DumpBB;
		virtual void DumpBB();

		/****************** DumpSS ******************/
		%feature("compactdefaultargs") DumpSS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") DumpSS;
		virtual void DumpSS();

		/****************** FindNeighbours ******************/
		%feature("compactdefaultargs") FindNeighbours;
		%feature("autodoc", "Build the list of neighbour shapes of mycurrentshape (neighbour shapes and mycurrentshapes are of type t) initialize myincidentshapesiter on neighbour shapes.

Returns
-------
None
") FindNeighbours;
		virtual void FindNeighbours();

		/****************** InitNeighbours ******************/
		%feature("compactdefaultargs") InitNeighbours;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") InitNeighbours;
		virtual void InitNeighbours(const TopoDS_Shape & S);

		/****************** InitShapes ******************/
		%feature("compactdefaultargs") InitShapes;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitShapes;
		void InitShapes();

		/****************** InitStartElements ******************/
		%feature("compactdefaultargs") InitStartElements;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitStartElements;
		void InitStartElements();

		/****************** MakeNeighboursList ******************/
		%feature("compactdefaultargs") MakeNeighboursList;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
V: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") MakeNeighboursList;
		virtual const TopTools_ListOfShape & MakeNeighboursList(const TopoDS_Shape & E, const TopoDS_Shape & V);

		/****************** MaxNumberSubShape ******************/
		%feature("compactdefaultargs") MaxNumberSubShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
Shape: TopoDS_Shape

Returns
-------
int
") MaxNumberSubShape;
		Standard_Integer MaxNumberSubShape(const TopoDS_Shape & Shape);

		/****************** MoreNeighbours ******************/
		%feature("compactdefaultargs") MoreNeighbours;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreNeighbours;
		Standard_Boolean MoreNeighbours();

		/****************** MoreShapes ******************/
		%feature("compactdefaultargs") MoreShapes;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreShapes;
		Standard_Boolean MoreShapes();

		/****************** MoreStartElements ******************/
		%feature("compactdefaultargs") MoreStartElements;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreStartElements;
		Standard_Boolean MoreStartElements();

		/****************** Neighbour ******************/
		%feature("compactdefaultargs") Neighbour;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Neighbour;
		const TopoDS_Shape Neighbour();

		/****************** NextNeighbour ******************/
		%feature("compactdefaultargs") NextNeighbour;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextNeighbour;
		void NextNeighbour();

		/****************** NextShape ******************/
		%feature("compactdefaultargs") NextShape;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextShape;
		void NextShape();

		/****************** NextStartElement ******************/
		%feature("compactdefaultargs") NextStartElement;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextStartElement;
		void NextStartElement();

		/****************** SName ******************/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
sb: TCollection_AsciiString,optional
	default value is ""
sa: TCollection_AsciiString,optional
	default value is ""

Returns
-------
TCollection_AsciiString
") SName;
		virtual TCollection_AsciiString SName(const TopoDS_Shape & S, const TCollection_AsciiString & sb = "", const TCollection_AsciiString & sa = "");

		/****************** SName ******************/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopTools_ListOfShape
sb: TCollection_AsciiString,optional
	default value is ""
sa: TCollection_AsciiString,optional
	default value is ""

Returns
-------
TCollection_AsciiString
") SName;
		virtual TCollection_AsciiString SName(const TopTools_ListOfShape & S, const TCollection_AsciiString & sb = "", const TCollection_AsciiString & sa = "");

		/****************** SNameori ******************/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
sb: TCollection_AsciiString,optional
	default value is ""
sa: TCollection_AsciiString,optional
	default value is ""

Returns
-------
TCollection_AsciiString
") SNameori;
		virtual TCollection_AsciiString SNameori(const TopoDS_Shape & S, const TCollection_AsciiString & sb = "", const TCollection_AsciiString & sa = "");

		/****************** SNameori ******************/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopTools_ListOfShape
sb: TCollection_AsciiString,optional
	default value is ""
sa: TCollection_AsciiString,optional
	default value is ""

Returns
-------
TCollection_AsciiString
") SNameori;
		virtual TCollection_AsciiString SNameori(const TopTools_ListOfShape & S, const TCollection_AsciiString & sb = "", const TCollection_AsciiString & sa = "");

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** StartElement ******************/
		%feature("compactdefaultargs") StartElement;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") StartElement;
		const TopoDS_Shape StartElement();

		/****************** StartElements ******************/
		%feature("compactdefaultargs") StartElements;
		%feature("autodoc", "Return a reference on mystartshapes.

Returns
-------
TopTools_ListOfShape
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
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellToSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_ShellToSolid;
		 TopOpeBRepBuild_ShellToSolid();

		/****************** AddShell ******************/
		%feature("compactdefaultargs") AddShell;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sh: TopoDS_Shell

Returns
-------
None
") AddShell;
		void AddShell(const TopoDS_Shell & Sh);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** MakeSolids ******************/
		%feature("compactdefaultargs") MakeSolids;
		%feature("autodoc", "No available documentation.

Parameters
----------
So: TopoDS_Solid
LSo: TopTools_ListOfShape

Returns
-------
None
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
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidBuilder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_SolidBuilder;
		 TopOpeBRepBuild_SolidBuilder();

		/****************** TopOpeBRepBuild_SolidBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidBuilder;
		%feature("autodoc", "Create a solidbuilder to build the areas on the shapes (shells, blocks of faces) described by <ls>.

Parameters
----------
FS: TopOpeBRepBuild_ShellFaceSet
ForceClass: bool,optional
	default value is Standard_False

Returns
-------
None
") TopOpeBRepBuild_SolidBuilder;
		 TopOpeBRepBuild_SolidBuilder(TopOpeBRepBuild_ShellFaceSet & FS, const Standard_Boolean ForceClass = Standard_False);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns current new face of current new shell.

Returns
-------
TopoDS_Shape
") Face;
		const TopoDS_Shape Face();

		/****************** InitFace ******************/
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") InitFace;
		Standard_Integer InitFace();

		/****************** InitShell ******************/
		%feature("compactdefaultargs") InitShell;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") InitShell;
		Standard_Integer InitShell();

		/****************** InitSolid ******************/
		%feature("compactdefaultargs") InitSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") InitSolid;
		Standard_Integer InitSolid();

		/****************** InitSolidBuilder ******************/
		%feature("compactdefaultargs") InitSolidBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
FS: TopOpeBRepBuild_ShellFaceSet
ForceClass: bool

Returns
-------
None
") InitSolidBuilder;
		void InitSolidBuilder(TopOpeBRepBuild_ShellFaceSet & FS, const Standard_Boolean ForceClass);

		/****************** IsOldShell ******************/
		%feature("compactdefaultargs") IsOldShell;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsOldShell;
		Standard_Boolean IsOldShell();

		/****************** MoreFace ******************/
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreFace;
		Standard_Boolean MoreFace();

		/****************** MoreShell ******************/
		%feature("compactdefaultargs") MoreShell;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreShell;
		Standard_Boolean MoreShell();

		/****************** MoreSolid ******************/
		%feature("compactdefaultargs") MoreSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreSolid;
		Standard_Boolean MoreSolid();

		/****************** NextFace ******************/
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextFace;
		void NextFace();

		/****************** NextShell ******************/
		%feature("compactdefaultargs") NextShell;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextShell;
		void NextShell();

		/****************** NextSolid ******************/
		%feature("compactdefaultargs") NextSolid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextSolid;
		void NextSolid();

		/****************** OldShell ******************/
		%feature("compactdefaultargs") OldShell;
		%feature("autodoc", "Returns current shell this shell may be : * an old shell oldshell(), which has not been reconstructed; * a new shell made of faces described by ...newface() methods.

Returns
-------
TopoDS_Shape
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
		%feature("compactdefaultargs") CheckFaceClosed2d;
		%feature("autodoc", "Checks if <theface> has the properly closed in 2d boundary(ies).

Parameters
----------
theFace: TopoDS_Face

Returns
-------
bool
") CheckFaceClosed2d;
		static Standard_Boolean CheckFaceClosed2d(const TopoDS_Face & theFace);

		/****************** CorrectCurveOnSurface ******************/
		%feature("compactdefaultargs") CorrectCurveOnSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
aS: TopoDS_Shape
aTolMax: float,optional
	default value is 0.0001

Returns
-------
None
") CorrectCurveOnSurface;
		static void CorrectCurveOnSurface(const TopoDS_Shape & aS, const Standard_Real aTolMax = 0.0001);

		/****************** CorrectFace2d ******************/
		%feature("compactdefaultargs") CorrectFace2d;
		%feature("autodoc", "Test if uv representation of <oldface> is good (i.e. face is closed in 2d). if face is not closed , this method will try to close such face and will return corrected edges in the <amapofcorrect2dedges>. parameter <asourceshapes> used to fix the edge (or wires) which should be correct (corrector used it as a start shapes). note : parameter corrface doesn't mean anything. if you want to use this method , rebuild resulting face after by yourself using corrected edges.

Parameters
----------
oldFace: TopoDS_Shape
corrFace: TopoDS_Shape
aSourceShapes: TopTools_IndexedMapOfOrientedShape
aMapOfCorrect2dEdges: TopTools_IndexedDataMapOfShapeShape

Returns
-------
None
") CorrectFace2d;
		static void CorrectFace2d(const TopoDS_Shape & oldFace, TopoDS_Shape & corrFace, const TopTools_IndexedMapOfOrientedShape & aSourceShapes, TopTools_IndexedDataMapOfShapeShape & aMapOfCorrect2dEdges);

		/****************** CorrectPointOnCurve ******************/
		%feature("compactdefaultargs") CorrectPointOnCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
aS: TopoDS_Shape
aTolMax: float,optional
	default value is 0.0001

Returns
-------
None
") CorrectPointOnCurve;
		static void CorrectPointOnCurve(const TopoDS_Shape & aS, const Standard_Real aTolMax = 0.0001);

		/****************** CorrectTolerances ******************/
		%feature("compactdefaultargs") CorrectTolerances;
		%feature("autodoc", "No available documentation.

Parameters
----------
aS: TopoDS_Shape
aTolMax: float,optional
	default value is 0.0001

Returns
-------
None
") CorrectTolerances;
		static void CorrectTolerances(const TopoDS_Shape & aS, const Standard_Real aTolMax = 0.0001);

		/****************** FindState ******************/
		%feature("compactdefaultargs") FindState;
		%feature("autodoc", "No available documentation.

Parameters
----------
aVertex: TopoDS_Shape
aState: TopAbs_State
aShapeEnum: TopAbs_ShapeEnum
aMapVertexEdges: TopTools_IndexedDataMapOfShapeListOfShape
aMapProcessedVertices: TopTools_MapOfShape
aMapVs: TopOpeBRepDS_DataMapOfShapeState

Returns
-------
None
") FindState;
		static void FindState(const TopoDS_Shape & aVertex, const TopAbs_State aState, const TopAbs_ShapeEnum aShapeEnum, const TopTools_IndexedDataMapOfShapeListOfShape & aMapVertexEdges, TopTools_MapOfShape & aMapProcessedVertices, TopOpeBRepDS_DataMapOfShapeState & aMapVs);

		/****************** FindState1 ******************/
		%feature("compactdefaultargs") FindState1;
		%feature("autodoc", "No available documentation.

Parameters
----------
anEdge: TopoDS_Shape
aState: TopAbs_State
aMapEdgesFaces: TopTools_IndexedDataMapOfShapeListOfShape
aMapProcessedVertices: TopTools_MapOfShape
aMapVs: TopOpeBRepDS_DataMapOfShapeState

Returns
-------
None
") FindState1;
		static void FindState1(const TopoDS_Shape & anEdge, const TopAbs_State aState, const TopTools_IndexedDataMapOfShapeListOfShape & aMapEdgesFaces, TopTools_MapOfShape & aMapProcessedVertices, TopOpeBRepDS_DataMapOfShapeState & aMapVs);

		/****************** FindState2 ******************/
		%feature("compactdefaultargs") FindState2;
		%feature("autodoc", "No available documentation.

Parameters
----------
anEdge: TopoDS_Shape
aState: TopAbs_State
aMapEdgesFaces: TopTools_IndexedDataMapOfShapeListOfShape
aMapProcessedEdges: TopTools_MapOfShape
aMapVs: TopOpeBRepDS_DataMapOfShapeState

Returns
-------
None
") FindState2;
		static void FindState2(const TopoDS_Shape & anEdge, const TopAbs_State aState, const TopTools_IndexedDataMapOfShapeListOfShape & aMapEdgesFaces, TopTools_MapOfShape & aMapProcessedEdges, TopOpeBRepDS_DataMapOfShapeState & aMapVs);

		/****************** FindStateThroughVertex ******************/
		%feature("compactdefaultargs") FindStateThroughVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShape: TopoDS_Shape
aShapeClassifier: TopOpeBRepTool_ShapeClassifier
aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState
anAvoidSubshMap: TopTools_MapOfShape

Returns
-------
TopAbs_State
") FindStateThroughVertex;
		static TopAbs_State FindStateThroughVertex(const TopoDS_Shape & aShape, TopOpeBRepTool_ShapeClassifier & aShapeClassifier, TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState, const TopTools_MapOfShape & anAvoidSubshMap);

		/****************** GetAdjacentFace ******************/
		%feature("compactdefaultargs") GetAdjacentFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFaceObj: TopoDS_Shape
anEObj: TopoDS_Shape
anEdgeFaceMap: TopTools_IndexedDataMapOfShapeListOfShape
anAdjFaceObj: TopoDS_Shape

Returns
-------
bool
") GetAdjacentFace;
		static Standard_Boolean GetAdjacentFace(const TopoDS_Shape & aFaceObj, const TopoDS_Shape & anEObj, const TopTools_IndexedDataMapOfShapeListOfShape & anEdgeFaceMap, TopoDS_Shape & anAdjFaceObj);

		/****************** GetNormalInNearestPoint ******************/
		%feature("compactdefaultargs") GetNormalInNearestPoint;
		%feature("autodoc", "This function used to compute normal in point which is located near the point with param uv (used for computation of normals where the normal in the point uv equal to zero).

Parameters
----------
aFace: TopoDS_Face
anEdge: TopoDS_Edge
aNormal: gp_Vec

Returns
-------
None
") GetNormalInNearestPoint;
		static void GetNormalInNearestPoint(const TopoDS_Face & aFace, const TopoDS_Edge & anEdge, gp_Vec & aNormal);

		/****************** GetNormalToFaceOnEdge ******************/
		%feature("compactdefaultargs") GetNormalToFaceOnEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFObj: TopoDS_Face
anEdgeObj: TopoDS_Edge
aDirNormal: gp_Vec

Returns
-------
None
") GetNormalToFaceOnEdge;
		static void GetNormalToFaceOnEdge(const TopoDS_Face & aFObj, const TopoDS_Edge & anEdgeObj, gp_Vec & aDirNormal);

		/****************** GetTangentToEdge ******************/
		%feature("compactdefaultargs") GetTangentToEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
anEdgeObj: TopoDS_Edge
aTangent: gp_Vec

Returns
-------
bool
") GetTangentToEdge;
		static Standard_Boolean GetTangentToEdge(const TopoDS_Edge & anEdgeObj, gp_Vec & aTangent);

		/****************** GetTangentToEdgeEdge ******************/
		%feature("compactdefaultargs") GetTangentToEdgeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFObj: TopoDS_Face
anEdgeObj: TopoDS_Edge
aOriEObj: TopoDS_Edge
aTangent: gp_Vec

Returns
-------
bool
") GetTangentToEdgeEdge;
		static Standard_Boolean GetTangentToEdgeEdge(const TopoDS_Face & aFObj, const TopoDS_Edge & anEdgeObj, const TopoDS_Edge & aOriEObj, gp_Vec & aTangent);

		/****************** IsDegEdgesTheSame ******************/
		%feature("compactdefaultargs") IsDegEdgesTheSame;
		%feature("autodoc", "No available documentation.

Parameters
----------
anE1: TopoDS_Shape
anE2: TopoDS_Shape

Returns
-------
bool
") IsDegEdgesTheSame;
		static Standard_Boolean IsDegEdgesTheSame(const TopoDS_Shape & anE1, const TopoDS_Shape & anE2);

		/****************** NormalizeFace ******************/
		%feature("compactdefaultargs") NormalizeFace;
		%feature("autodoc", "Test if <oldface> does not contain internal or external edges and remove such edges in case of its presence. the result is stored in <corrface>.

Parameters
----------
oldFace: TopoDS_Shape
corrFace: TopoDS_Shape

Returns
-------
None
") NormalizeFace;
		static void NormalizeFace(const TopoDS_Shape & oldFace, TopoDS_Shape & corrFace);

		/****************** PropagateState ******************/
		%feature("compactdefaultargs") PropagateState;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSplEdgesState: TopOpeBRepDS_DataMapOfShapeState
anEdgesToRestMap: TopTools_IndexedMapOfShape
aShapeEnum1: TopAbs_ShapeEnum
aShapeEnum2: TopAbs_ShapeEnum
aShapeClassifier: TopOpeBRepTool_ShapeClassifier
aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState
anUnkStateShapes: TopTools_MapOfShape

Returns
-------
None
") PropagateState;
		static void PropagateState(const TopOpeBRepDS_DataMapOfShapeState & aSplEdgesState, const TopTools_IndexedMapOfShape & anEdgesToRestMap, const TopAbs_ShapeEnum aShapeEnum1, const TopAbs_ShapeEnum aShapeEnum2, TopOpeBRepTool_ShapeClassifier & aShapeClassifier, TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState, const TopTools_MapOfShape & anUnkStateShapes);

		/****************** PropagateStateForWires ******************/
		%feature("compactdefaultargs") PropagateStateForWires;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFacesToRestMap: TopTools_IndexedMapOfShape
aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState

Returns
-------
None
") PropagateStateForWires;
		static void PropagateStateForWires(const TopTools_IndexedMapOfShape & aFacesToRestMap, TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState);

		/****************** SpreadStateToChild ******************/
		%feature("compactdefaultargs") SpreadStateToChild;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShape: TopoDS_Shape
aState: TopAbs_State
aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState

Returns
-------
None
") SpreadStateToChild;
		static void SpreadStateToChild(const TopoDS_Shape & aShape, const TopAbs_State aState, TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState);

		/****************** UpdateEdgeOnFace ******************/
		%feature("compactdefaultargs") UpdateEdgeOnFace;
		%feature("autodoc", "Recompute pcurve of the edge on the newface.

Parameters
----------
aEdgeToUpdate: TopoDS_Edge
OldFace: TopoDS_Face
NewFace: TopoDS_Face

Returns
-------
None
") UpdateEdgeOnFace;
		static void UpdateEdgeOnFace(const TopoDS_Edge & aEdgeToUpdate, const TopoDS_Face & OldFace, const TopoDS_Face & NewFace);

		/****************** UpdateEdgeOnPeriodicalFace ******************/
		%feature("compactdefaultargs") UpdateEdgeOnPeriodicalFace;
		%feature("autodoc", "Recompute pcurves of the closing (sim , with 2 pcurves) edge on the newface.

Parameters
----------
aEdgeToUpdate: TopoDS_Edge
OldFace: TopoDS_Face
NewFace: TopoDS_Face

Returns
-------
None
") UpdateEdgeOnPeriodicalFace;
		static void UpdateEdgeOnPeriodicalFace(const TopoDS_Edge & aEdgeToUpdate, const TopoDS_Face & OldFace, const TopoDS_Face & NewFace);

		/****************** UpdatePCurves ******************/
		%feature("compactdefaultargs") UpdatePCurves;
		%feature("autodoc", "Recompute pcurves of the all edges from the wire on the <toface>.

Parameters
----------
aWire: TopoDS_Wire
fromFace: TopoDS_Face
toFace: TopoDS_Face

Returns
-------
None
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
		%feature("compactdefaultargs") DumpMapOfShapeVertexInfo;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMap: TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo

Returns
-------
None
") DumpMapOfShapeVertexInfo;
		static void DumpMapOfShapeVertexInfo(const TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & aMap);

		/****************** MakeMapOfShapeVertexInfo ******************/
		%feature("compactdefaultargs") MakeMapOfShapeVertexInfo;
		%feature("autodoc", "No available documentation.

Parameters
----------
aWire: TopoDS_Wire
aMap: TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo

Returns
-------
None
") MakeMapOfShapeVertexInfo;
		static void MakeMapOfShapeVertexInfo(const TopoDS_Wire & aWire, TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & aMap);

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "No available documentation.

Parameters
----------
aWire: TopoDS_Wire
aResList: TopTools_ListOfShape

Returns
-------
None
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
		%feature("compactdefaultargs") TopOpeBRepBuild_VertexInfo;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_VertexInfo;
		 TopOpeBRepBuild_VertexInfo();

		/****************** AddIn ******************/
		%feature("compactdefaultargs") AddIn;
		%feature("autodoc", "No available documentation.

Parameters
----------
anE: TopoDS_Edge

Returns
-------
None
") AddIn;
		void AddIn(const TopoDS_Edge & anE);

		/****************** AddOut ******************/
		%feature("compactdefaultargs") AddOut;
		%feature("autodoc", "No available documentation.

Parameters
----------
anE: TopoDS_Edge

Returns
-------
None
") AddOut;
		void AddOut(const TopoDS_Edge & anE);

		/****************** AppendPassed ******************/
		%feature("compactdefaultargs") AppendPassed;
		%feature("autodoc", "No available documentation.

Parameters
----------
anE: TopoDS_Edge

Returns
-------
None
") AppendPassed;
		void AppendPassed(const TopoDS_Edge & anE);

		/****************** ChangeEdgesOut ******************/
		%feature("compactdefaultargs") ChangeEdgesOut;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_IndexedMapOfOrientedShape
") ChangeEdgesOut;
		TopTools_IndexedMapOfOrientedShape & ChangeEdgesOut();

		/****************** CurrentOut ******************/
		%feature("compactdefaultargs") CurrentOut;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") CurrentOut;
		const TopoDS_Edge CurrentOut();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** EdgesIn ******************/
		%feature("compactdefaultargs") EdgesIn;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_IndexedMapOfOrientedShape
") EdgesIn;
		const TopTools_IndexedMapOfOrientedShape & EdgesIn();

		/****************** EdgesOut ******************/
		%feature("compactdefaultargs") EdgesOut;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_IndexedMapOfOrientedShape
") EdgesOut;
		const TopTools_IndexedMapOfOrientedShape & EdgesOut();

		/****************** FoundOut ******************/
		%feature("compactdefaultargs") FoundOut;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") FoundOut;
		Standard_Integer FoundOut();

		/****************** ListPassed ******************/
		%feature("compactdefaultargs") ListPassed;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") ListPassed;
		const TopTools_ListOfShape & ListPassed();

		/****************** NbCases ******************/
		%feature("compactdefaultargs") NbCases;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCases;
		Standard_Integer NbCases();

		/****************** Prepare ******************/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "No available documentation.

Parameters
----------
aL: TopTools_ListOfShape

Returns
-------
None
") Prepare;
		void Prepare(const TopTools_ListOfShape & aL);

		/****************** RemovePassed ******************/
		%feature("compactdefaultargs") RemovePassed;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RemovePassed;
		void RemovePassed();

		/****************** SetCurrentIn ******************/
		%feature("compactdefaultargs") SetCurrentIn;
		%feature("autodoc", "No available documentation.

Parameters
----------
anE: TopoDS_Edge

Returns
-------
None
") SetCurrentIn;
		void SetCurrentIn(const TopoDS_Edge & anE);

		/****************** SetSmart ******************/
		%feature("compactdefaultargs") SetSmart;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFlag: bool

Returns
-------
None
") SetSmart;
		void SetSmart(const Standard_Boolean aFlag);

		/****************** SetVertex ******************/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
aV: TopoDS_Vertex

Returns
-------
None
") SetVertex;
		void SetVertex(const TopoDS_Vertex & aV);

		/****************** Smart ******************/
		%feature("compactdefaultargs") Smart;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Smart;
		Standard_Boolean Smart();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
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
		%feature("compactdefaultargs") TopOpeBRepBuild_WireToFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_WireToFace;
		 TopOpeBRepBuild_WireToFace();

		/****************** AddWire ******************/
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: TopoDS_Wire

Returns
-------
None
") AddWire;
		void AddWire(const TopoDS_Wire & W);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** MakeFaces ******************/
		%feature("compactdefaultargs") MakeFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
LF: TopTools_ListOfShape

Returns
-------
None
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
		%feature("compactdefaultargs") TopOpeBRepBuild_Area1dBuilder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_Area1dBuilder;
		 TopOpeBRepBuild_Area1dBuilder();

		/****************** TopOpeBRepBuild_Area1dBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area1dBuilder;
		%feature("autodoc", "Creates a area1dbuilder to find the areas of the shapes described by <ls> using the classifier <lc>.

Parameters
----------
LS: TopOpeBRepBuild_PaveSet
LC: TopOpeBRepBuild_PaveClassifier
ForceClass: bool,optional
	default value is Standard_False

Returns
-------
None
") TopOpeBRepBuild_Area1dBuilder;
		 TopOpeBRepBuild_Area1dBuilder(TopOpeBRepBuild_PaveSet & LS, TopOpeBRepBuild_PaveClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** ADD_LISTOFLoop_TO_LISTOFLoop ******************/
		%feature("compactdefaultargs") ADD_LISTOFLoop_TO_LISTOFLoop;
		%feature("autodoc", "No available documentation.

Parameters
----------
LOL1: TopOpeBRepBuild_ListOfLoop
LOL2: TopOpeBRepBuild_ListOfLoop
s: Standard_Address,optional
	default value is NULL
s1: Standard_Address,optional
	default value is NULL
s2: Standard_Address,optional
	default value is NULL

Returns
-------
None
") ADD_LISTOFLoop_TO_LISTOFLoop;
		virtual void ADD_LISTOFLoop_TO_LISTOFLoop(TopOpeBRepBuild_ListOfLoop & LOL1, TopOpeBRepBuild_ListOfLoop & LOL2, const Standard_Address s = NULL, const Standard_Address s1 = NULL, const Standard_Address s2 = NULL);

		/****************** ADD_Loop_TO_LISTOFLoop ******************/
		%feature("compactdefaultargs") ADD_Loop_TO_LISTOFLoop;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopOpeBRepBuild_Loop
LOL: TopOpeBRepBuild_ListOfLoop
s: Standard_Address,optional
	default value is NULL

Returns
-------
None
") ADD_Loop_TO_LISTOFLoop;
		virtual void ADD_Loop_TO_LISTOFLoop(const opencascade::handle<TopOpeBRepBuild_Loop> & L, TopOpeBRepBuild_ListOfLoop & LOL, const Standard_Address s = NULL);

		/****************** DumpList ******************/
		%feature("compactdefaultargs") DumpList;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopOpeBRepBuild_ListOfLoop

Returns
-------
None
") DumpList;
		static void DumpList(const TopOpeBRepBuild_ListOfLoop & L);

		/****************** InitAreaBuilder ******************/
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "Sets a area1dbuilder to find the areas of the shapes described by <ls> using the classifier <lc>.

Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool,optional
	default value is Standard_False

Returns
-------
None
") InitAreaBuilder;
		virtual void InitAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** REM_Loop_FROM_LISTOFLoop ******************/
		%feature("compactdefaultargs") REM_Loop_FROM_LISTOFLoop;
		%feature("autodoc", "No available documentation.

Parameters
----------
ITLOL: TopOpeBRepBuild_ListIteratorOfListOfLoop
LOL: TopOpeBRepBuild_ListOfLoop
s: Standard_Address,optional
	default value is NULL

Returns
-------
None
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
		%feature("compactdefaultargs") TopOpeBRepBuild_Area2dBuilder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_Area2dBuilder;
		 TopOpeBRepBuild_Area2dBuilder();

		/****************** TopOpeBRepBuild_Area2dBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area2dBuilder;
		%feature("autodoc", "Creates a area2dbuilder to build faces on the (wires,blocks of edge) of <ls>, using the classifier <lc>.

Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool,optional
	default value is Standard_False

Returns
-------
None
") TopOpeBRepBuild_Area2dBuilder;
		 TopOpeBRepBuild_Area2dBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** InitAreaBuilder ******************/
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "Sets a area1dbuilder to find the areas of the shapes described by <ls> using the classifier <lc>.

Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool,optional
	default value is Standard_False

Returns
-------
None
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
		%feature("compactdefaultargs") TopOpeBRepBuild_Area3dBuilder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_Area3dBuilder;
		 TopOpeBRepBuild_Area3dBuilder();

		/****************** TopOpeBRepBuild_Area3dBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area3dBuilder;
		%feature("autodoc", "Creates a area3dbuilder to build solids on the (shells,blocks of face) of <ls>, using the classifier <lc>.

Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool,optional
	default value is Standard_False

Returns
-------
None
") TopOpeBRepBuild_Area3dBuilder;
		 TopOpeBRepBuild_Area3dBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** InitAreaBuilder ******************/
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "Sets a area1dbuilder to find the areas of the shapes described by <ls> using the classifier <lc>.

Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool,optional
	default value is Standard_False

Returns
-------
None
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
		%feature("compactdefaultargs") TopOpeBRepBuild_Builder1;
		%feature("autodoc", "No available documentation.

Parameters
----------
BT: TopOpeBRepDS_BuildTool

Returns
-------
None
") TopOpeBRepBuild_Builder1;
		 TopOpeBRepBuild_Builder1(const TopOpeBRepDS_BuildTool & BT);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes all splits and merges already performed. does not clear the handled ds (except shapewithstatesmaps).

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** CorrectResult2d ******************/
		%feature("compactdefaultargs") CorrectResult2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
aResult: TopoDS_Shape

Returns
-------
int
") CorrectResult2d;
		Standard_Integer CorrectResult2d(TopoDS_Shape & aResult);

		/****************** GFillEdgeNotSameDomWES ******************/
		%feature("compactdefaultargs") GFillEdgeNotSameDomWES;
		%feature("autodoc", "No available documentation.

Parameters
----------
E1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Returns
-------
None
") GFillEdgeNotSameDomWES;
		void GFillEdgeNotSameDomWES(const TopoDS_Shape & E1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillEdgeSameDomWES ******************/
		%feature("compactdefaultargs") GFillEdgeSameDomWES;
		%feature("autodoc", "No available documentation.

Parameters
----------
E1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Returns
-------
None
") GFillEdgeSameDomWES;
		void GFillEdgeSameDomWES(const TopoDS_Shape & E1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillFaceNotSameDomSFS ******************/
		%feature("compactdefaultargs") GFillFaceNotSameDomSFS;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Returns
-------
None
") GFillFaceNotSameDomSFS;
		void GFillFaceNotSameDomSFS(const TopoDS_Shape & F1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillFaceNotSameDomWES ******************/
		%feature("compactdefaultargs") GFillFaceNotSameDomWES;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Returns
-------
None
") GFillFaceNotSameDomWES;
		void GFillFaceNotSameDomWES(const TopoDS_Shape & F1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillFaceSameDomSFS ******************/
		%feature("compactdefaultargs") GFillFaceSameDomSFS;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Returns
-------
None
") GFillFaceSameDomSFS;
		void GFillFaceSameDomSFS(const TopoDS_Shape & F1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillFaceSameDomWES ******************/
		%feature("compactdefaultargs") GFillFaceSameDomWES;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Returns
-------
None
") GFillFaceSameDomWES;
		void GFillFaceSameDomWES(const TopoDS_Shape & F1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillShellSFS ******************/
		%feature("compactdefaultargs") GFillShellSFS;
		%feature("autodoc", "No available documentation.

Parameters
----------
SH1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Returns
-------
None
") GFillShellSFS;
		virtual void GFillShellSFS(const TopoDS_Shape & SH1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillSolidSFS ******************/
		%feature("compactdefaultargs") GFillSolidSFS;
		%feature("autodoc", "No available documentation.

Parameters
----------
SO1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
SFS: TopOpeBRepBuild_ShellFaceSet

Returns
-------
None
") GFillSolidSFS;
		virtual void GFillSolidSFS(const TopoDS_Shape & SO1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillWireNotSameDomWES ******************/
		%feature("compactdefaultargs") GFillWireNotSameDomWES;
		%feature("autodoc", "No available documentation.

Parameters
----------
W1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Returns
-------
None
") GFillWireNotSameDomWES;
		void GFillWireNotSameDomWES(const TopoDS_Shape & W1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillWireSameDomWES ******************/
		%feature("compactdefaultargs") GFillWireSameDomWES;
		%feature("autodoc", "No available documentation.

Parameters
----------
W1: TopoDS_Shape
LSO2: TopTools_ListOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Returns
-------
None
") GFillWireSameDomWES;
		void GFillWireSameDomWES(const TopoDS_Shape & W1, const TopTools_ListOfShape & LSO2, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GWESMakeFaces ******************/
		%feature("compactdefaultargs") GWESMakeFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
FF: TopoDS_Shape
WES: TopOpeBRepBuild_WireEdgeSet
LOF: TopTools_ListOfShape

Returns
-------
None
") GWESMakeFaces;
		virtual void GWESMakeFaces(const TopoDS_Shape & FF, TopOpeBRepBuild_WireEdgeSet & WES, TopTools_ListOfShape & LOF);

		/****************** MergeKPart ******************/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MergeKPart;
		virtual void MergeKPart();

		/****************** MergeKPart ******************/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", "No available documentation.

Parameters
----------
TB1: TopAbs_State
TB2: TopAbs_State

Returns
-------
None
") MergeKPart;
		virtual void MergeKPart(const TopAbs_State TB1, const TopAbs_State TB2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") Perform;
		virtual void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") Perform;
		virtual void Perform(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** PerformONParts ******************/
		%feature("compactdefaultargs") PerformONParts;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape
SDfaces: TopTools_IndexedMapOfShape
G: TopOpeBRepBuild_GTopo
WES: TopOpeBRepBuild_WireEdgeSet

Returns
-------
None
") PerformONParts;
		void PerformONParts(const TopoDS_Shape & F, const TopTools_IndexedMapOfShape & SDfaces, const TopOpeBRepBuild_GTopo & G, TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** PerformPieceIn2D ******************/
		%feature("compactdefaultargs") PerformPieceIn2D;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPieceToPerform: TopoDS_Edge
aOriginalEdge: TopoDS_Edge
edgeFace: TopoDS_Face
toFace: TopoDS_Face
G: TopOpeBRepBuild_GTopo

Returns
-------
keep: bool
") PerformPieceIn2D;
		void PerformPieceIn2D(const TopoDS_Edge & aPieceToPerform, const TopoDS_Edge & aOriginalEdge, const TopoDS_Face & edgeFace, const TopoDS_Face & toFace, const TopOpeBRepBuild_GTopo & G, Standard_Boolean &OutValue);

		/****************** PerformPieceOn2D ******************/
		%feature("compactdefaultargs") PerformPieceOn2D;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPieceObj: TopoDS_Shape
aFaceObj: TopoDS_Shape
aEdgeObj: TopoDS_Shape
aListOfPieces: TopTools_ListOfShape
aListOfFaces: TopTools_ListOfShape
aListOfPiecesOut2d: TopTools_ListOfShape

Returns
-------
int
") PerformPieceOn2D;
		Standard_Integer PerformPieceOn2D(const TopoDS_Shape & aPieceObj, const TopoDS_Shape & aFaceObj, const TopoDS_Shape & aEdgeObj, TopTools_ListOfShape & aListOfPieces, TopTools_ListOfShape & aListOfFaces, TopTools_ListOfShape & aListOfPiecesOut2d);

		/****************** TwoPiecesON ******************/
		%feature("compactdefaultargs") TwoPiecesON;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSeq: TopTools_SequenceOfShape
aListOfPieces: TopTools_ListOfShape
aListOfFaces: TopTools_ListOfShape
aListOfPiecesOut2d: TopTools_ListOfShape

Returns
-------
int
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
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "No available documentation.

Parameters
----------
L1: TopOpeBRepBuild_Loop
L2: TopOpeBRepBuild_Loop

Returns
-------
TopAbs_State
") Compare;
		virtual TopAbs_State Compare(const opencascade::handle<TopOpeBRepBuild_Loop> & L1, const opencascade::handle<TopOpeBRepBuild_Loop> & L2);

		/****************** CompareElement ******************/
		%feature("compactdefaultargs") CompareElement;
		%feature("autodoc", "Add element <e> in the set of elements used in classification. returns false if the element <e> has been already added to the set of elements, otherwise returns true.

Parameters
----------
E: TopoDS_Shape

Returns
-------
bool
") CompareElement;
		virtual Standard_Boolean CompareElement(const TopoDS_Shape & E);

		/****************** CompareElementToShape ******************/
		%feature("compactdefaultargs") CompareElementToShape;
		%feature("autodoc", "Classify element <e> with shape <b>.

Parameters
----------
E: TopoDS_Shape
B: TopoDS_Shape

Returns
-------
TopAbs_State
") CompareElementToShape;
		virtual TopAbs_State CompareElementToShape(const TopoDS_Shape & E, const TopoDS_Shape & B);

		/****************** CompareShapes ******************/
		%feature("compactdefaultargs") CompareShapes;
		%feature("autodoc", "Classify shape <b1> with shape <b2>.

Parameters
----------
B1: TopoDS_Shape
B2: TopoDS_Shape

Returns
-------
TopAbs_State
") CompareShapes;
		virtual TopAbs_State CompareShapes(const TopoDS_Shape & B1, const TopoDS_Shape & B2);

		/****************** ResetElement ******************/
		%feature("compactdefaultargs") ResetElement;
		%feature("autodoc", "Prepare classification involving element <e>.

Parameters
----------
E: TopoDS_Shape

Returns
-------
None
") ResetElement;
		virtual void ResetElement(const TopoDS_Shape & E);

		/****************** ResetShape ******************/
		%feature("compactdefaultargs") ResetShape;
		%feature("autodoc", "Prepare classification involving shape <b> calls resetelement on first element of <b>.

Parameters
----------
B: TopoDS_Shape

Returns
-------
None
") ResetShape;
		virtual void ResetShape(const TopoDS_Shape & B);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Returns state of classification of 2d point, defined by resetelement, with the current set of elements, defined by compare.

Returns
-------
TopAbs_State
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
		%feature("compactdefaultargs") TopOpeBRepBuild_Pave;
		%feature("autodoc", "V = vertex, p = parameter of vertex <v> bound = true if <v> is an old vertex bound = false if <v> is a new vertex.

Parameters
----------
V: TopoDS_Shape
P: float
bound: bool

Returns
-------
None
") TopOpeBRepBuild_Pave;
		 TopOpeBRepBuild_Pave(const TopoDS_Shape & V, const Standard_Real P, const Standard_Boolean bound);

		/****************** ChangeVertex ******************/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") ChangeVertex;
		TopoDS_Shape ChangeVertex();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		virtual void Dump();

		/****************** HasSameDomain ******************/
		%feature("compactdefaultargs") HasSameDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
b: bool

Returns
-------
None
") HasSameDomain;
		void HasSameDomain(const Standard_Boolean b);

		/****************** HasSameDomain ******************/
		%feature("compactdefaultargs") HasSameDomain;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasSameDomain;
		Standard_Boolean HasSameDomain();

		/****************** InterferenceType ******************/
		%feature("compactdefaultargs") InterferenceType;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Kind
") InterferenceType;
		TopOpeBRepDS_Kind & InterferenceType();

		/****************** IsShape ******************/
		%feature("compactdefaultargs") IsShape;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsShape;
		virtual Standard_Boolean IsShape();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Par: float

Returns
-------
None
") Parameter;
		void Parameter(const Standard_Real Par);

		/****************** SameDomain ******************/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
VSD: TopoDS_Shape

Returns
-------
None
") SameDomain;
		void SameDomain(const TopoDS_Shape & VSD);

		/****************** SameDomain ******************/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") SameDomain;
		const TopoDS_Shape SameDomain();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		virtual const TopoDS_Shape Shape();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
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
		%feature("compactdefaultargs") TopOpeBRepBuild_PaveClassifier;
		%feature("autodoc", "Create a pave classifier to compare vertices on edge <e>.

Parameters
----------
E: TopoDS_Shape

Returns
-------
None
") TopOpeBRepBuild_PaveClassifier;
		 TopOpeBRepBuild_PaveClassifier(const TopoDS_Shape & E);

		/****************** AdjustCase ******************/
		%feature("compactdefaultargs") AdjustCase;
		%feature("autodoc", "No available documentation.

Parameters
----------
p1: float
o: TopAbs_Orientation
first: float
period: float
tol: float

Returns
-------
cas: int
") AdjustCase;
		static Standard_Real AdjustCase(const Standard_Real p1, const TopAbs_Orientation o, const Standard_Real first, const Standard_Real period, const Standard_Real tol, Standard_Integer &OutValue);

		/****************** ClosedVertices ******************/
		%feature("compactdefaultargs") ClosedVertices;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") ClosedVertices;
		void ClosedVertices(const Standard_Boolean B);

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Returns state of vertex <l1> compared with <l2>.

Parameters
----------
L1: TopOpeBRepBuild_Loop
L2: TopOpeBRepBuild_Loop

Returns
-------
TopAbs_State
") Compare;
		TopAbs_State Compare(const opencascade::handle<TopOpeBRepBuild_Loop> & L1, const opencascade::handle<TopOpeBRepBuild_Loop> & L2);

		/****************** SetFirstParameter ******************/
		%feature("compactdefaultargs") SetFirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: float

Returns
-------
None
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
		%feature("compactdefaultargs") TopOpeBRepBuild_PaveSet;
		%feature("autodoc", "Create a pave set on edge <e>. it contains <e> vertices.

Parameters
----------
E: TopoDS_Shape

Returns
-------
None
") TopOpeBRepBuild_PaveSet;
		 TopOpeBRepBuild_PaveSet(const TopoDS_Shape & E);

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Add <pv> in the pave set.

Parameters
----------
PV: TopOpeBRepBuild_Pave

Returns
-------
None
") Append;
		void Append(const opencascade::handle<TopOpeBRepBuild_Pave> & PV);

		/****************** ClosedVertices ******************/
		%feature("compactdefaultargs") ClosedVertices;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") ClosedVertices;
		Standard_Boolean ClosedVertices();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** EqualParameters ******************/
		%feature("compactdefaultargs") EqualParameters;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") EqualParameters;
		Standard_Real EqualParameters();

		/****************** HasEqualParameters ******************/
		%feature("compactdefaultargs") HasEqualParameters;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasEqualParameters;
		Standard_Boolean HasEqualParameters();

		/****************** InitLoop ******************/
		%feature("compactdefaultargs") InitLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitLoop;
		virtual void InitLoop();

		/****************** Loop ******************/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRepBuild_Loop>
") Loop;
		virtual opencascade::handle<TopOpeBRepBuild_Loop> Loop();

		/****************** MoreLoop ******************/
		%feature("compactdefaultargs") MoreLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreLoop;
		virtual Standard_Boolean MoreLoop();

		/****************** NextLoop ******************/
		%feature("compactdefaultargs") NextLoop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextLoop;
		virtual void NextLoop();

		/****************** RemovePV ******************/
		%feature("compactdefaultargs") RemovePV;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") RemovePV;
		void RemovePV(const Standard_Boolean B);

		/****************** SortPave ******************/
		%feature("compactdefaultargs") SortPave;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lin: TopOpeBRepBuild_ListOfPave
Lout: TopOpeBRepBuild_ListOfPave

Returns
-------
None
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
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellFaceSet;
		%feature("autodoc", "Creates a shellfaceset to build blocks of faces connected by edges.

Returns
-------
None
") TopOpeBRepBuild_ShellFaceSet;
		 TopOpeBRepBuild_ShellFaceSet();

		/****************** TopOpeBRepBuild_ShellFaceSet ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellFaceSet;
		%feature("autodoc", "Creates a shellfaceset to build blocks of faces connected by edges.

Parameters
----------
S: TopoDS_Shape
Addr: Standard_Address,optional
	default value is NULL

Returns
-------
None
") TopOpeBRepBuild_ShellFaceSet;
		 TopOpeBRepBuild_ShellFaceSet(const TopoDS_Shape & S, const Standard_Address Addr = NULL);

		/****************** AddElement ******************/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") AddElement;
		virtual void AddElement(const TopoDS_Shape & S);

		/****************** AddShape ******************/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") AddShape;
		virtual void AddShape(const TopoDS_Shape & S);

		/****************** AddStartElement ******************/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") AddStartElement;
		virtual void AddStartElement(const TopoDS_Shape & S);

		/****************** DumpSS ******************/
		%feature("compactdefaultargs") DumpSS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") DumpSS;
		virtual void DumpSS();

		/****************** SName ******************/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
sb: TCollection_AsciiString,optional
	default value is ""
sa: TCollection_AsciiString,optional
	default value is ""

Returns
-------
TCollection_AsciiString
") SName;
		virtual TCollection_AsciiString SName(const TopoDS_Shape & S, const TCollection_AsciiString & sb = "", const TCollection_AsciiString & sa = "");

		/****************** SName ******************/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopTools_ListOfShape
sb: TCollection_AsciiString,optional
	default value is ""
sa: TCollection_AsciiString,optional
	default value is ""

Returns
-------
TCollection_AsciiString
") SName;
		virtual TCollection_AsciiString SName(const TopTools_ListOfShape & S, const TCollection_AsciiString & sb = "", const TCollection_AsciiString & sa = "");

		/****************** SNameori ******************/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
sb: TCollection_AsciiString,optional
	default value is ""
sa: TCollection_AsciiString,optional
	default value is ""

Returns
-------
TCollection_AsciiString
") SNameori;
		virtual TCollection_AsciiString SNameori(const TopoDS_Shape & S, const TCollection_AsciiString & sb = "", const TCollection_AsciiString & sa = "");

		/****************** SNameori ******************/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopTools_ListOfShape
sb: TCollection_AsciiString,optional
	default value is ""
sa: TCollection_AsciiString,optional
	default value is ""

Returns
-------
TCollection_AsciiString
") SNameori;
		virtual TCollection_AsciiString SNameori(const TopTools_ListOfShape & S, const TCollection_AsciiString & sb = "", const TCollection_AsciiString & sa = "");

		/****************** Solid ******************/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Solid
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
		%feature("compactdefaultargs") TopOpeBRepBuild_WireEdgeSet;
		%feature("autodoc", "Creates a wireedgeset to build edges connected by vertices on face f. edges of the wireedgeset must have a representation on surface of face f.

Parameters
----------
F: TopoDS_Shape
Addr: Standard_Address,optional
	default value is NULL

Returns
-------
None
") TopOpeBRepBuild_WireEdgeSet;
		 TopOpeBRepBuild_WireEdgeSet(const TopoDS_Shape & F, const Standard_Address Addr = NULL);

		/****************** AddElement ******************/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") AddElement;
		virtual void AddElement(const TopoDS_Shape & S);

		/****************** AddShape ******************/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") AddShape;
		virtual void AddShape(const TopoDS_Shape & S);

		/****************** AddStartElement ******************/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") AddStartElement;
		virtual void AddStartElement(const TopoDS_Shape & S);

		/****************** DumpSS ******************/
		%feature("compactdefaultargs") DumpSS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") DumpSS;
		virtual void DumpSS();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Value of field myface.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** FindNeighbours ******************/
		%feature("compactdefaultargs") FindNeighbours;
		%feature("autodoc", "Build the list of neighbour edges of edge mycurrentshape initialize iterator of neighbour edges to edge mycurrentshape.

Returns
-------
None
") FindNeighbours;
		virtual void FindNeighbours();

		/****************** InitNeighbours ******************/
		%feature("compactdefaultargs") InitNeighbours;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape

Returns
-------
None
") InitNeighbours;
		virtual void InitNeighbours(const TopoDS_Shape & E);

		/****************** IsUVISO ******************/
		%feature("compactdefaultargs") IsUVISO;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
uiso: bool
viso: bool
") IsUVISO;
		static void IsUVISO(const TopoDS_Edge & E, const TopoDS_Face & F, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** MakeNeighboursList ******************/
		%feature("compactdefaultargs") MakeNeighboursList;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
V: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") MakeNeighboursList;
		virtual const TopTools_ListOfShape & MakeNeighboursList(const TopoDS_Shape & E, const TopoDS_Shape & V);

		/****************** SName ******************/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
sb: TCollection_AsciiString,optional
	default value is ""
sa: TCollection_AsciiString,optional
	default value is ""

Returns
-------
TCollection_AsciiString
") SName;
		virtual TCollection_AsciiString SName(const TopoDS_Shape & S, const TCollection_AsciiString & sb = "", const TCollection_AsciiString & sa = "");

		/****************** SName ******************/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopTools_ListOfShape
sb: TCollection_AsciiString,optional
	default value is ""
sa: TCollection_AsciiString,optional
	default value is ""

Returns
-------
TCollection_AsciiString
") SName;
		virtual TCollection_AsciiString SName(const TopTools_ListOfShape & S, const TCollection_AsciiString & sb = "", const TCollection_AsciiString & sa = "");

		/****************** SNameori ******************/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
sb: TCollection_AsciiString,optional
	default value is ""
sa: TCollection_AsciiString,optional
	default value is ""

Returns
-------
TCollection_AsciiString
") SNameori;
		virtual TCollection_AsciiString SNameori(const TopoDS_Shape & S, const TCollection_AsciiString & sb = "", const TCollection_AsciiString & sa = "");

		/****************** SNameori ******************/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopTools_ListOfShape
sb: TCollection_AsciiString,optional
	default value is ""
sa: TCollection_AsciiString,optional
	default value is ""

Returns
-------
TCollection_AsciiString
") SNameori;
		virtual TCollection_AsciiString SNameori(const TopTools_ListOfShape & S, const TCollection_AsciiString & sb = "", const TCollection_AsciiString & sa = "");

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
		%feature("compactdefaultargs") TopOpeBRepBuild_EdgeBuilder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_EdgeBuilder;
		 TopOpeBRepBuild_EdgeBuilder();

		/****************** TopOpeBRepBuild_EdgeBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_EdgeBuilder;
		%feature("autodoc", "Creates a edgebuilder to find the areas of the shapes described by <ls> using the classifier <lc>.

Parameters
----------
LS: TopOpeBRepBuild_PaveSet
LC: TopOpeBRepBuild_PaveClassifier
ForceClass: bool,optional
	default value is Standard_False

Returns
-------
None
") TopOpeBRepBuild_EdgeBuilder;
		 TopOpeBRepBuild_EdgeBuilder(TopOpeBRepBuild_PaveSet & LS, TopOpeBRepBuild_PaveClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** InitEdge ******************/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitEdge;
		void InitEdge();

		/****************** InitEdgeBuilder ******************/
		%feature("compactdefaultargs") InitEdgeBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool,optional
	default value is Standard_False

Returns
-------
None
") InitEdgeBuilder;
		void InitEdgeBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** InitVertex ******************/
		%feature("compactdefaultargs") InitVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitVertex;
		void InitVertex();

		/****************** MoreEdge ******************/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreEdge;
		Standard_Boolean MoreEdge();

		/****************** MoreVertex ******************/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreVertex;
		Standard_Boolean MoreVertex();

		/****************** NextEdge ******************/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextEdge;
		void NextEdge();

		/****************** NextVertex ******************/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextVertex;
		void NextVertex();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
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
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceAreaBuilder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_FaceAreaBuilder;
		 TopOpeBRepBuild_FaceAreaBuilder();

		/****************** TopOpeBRepBuild_FaceAreaBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceAreaBuilder;
		%feature("autodoc", "Creates a faceareabuilder to build faces on the (wires,blocks of edge) of <ls>, using the classifier <lc>.

Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool,optional
	default value is Standard_False

Returns
-------
None
") TopOpeBRepBuild_FaceAreaBuilder;
		 TopOpeBRepBuild_FaceAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** InitFaceAreaBuilder ******************/
		%feature("compactdefaultargs") InitFaceAreaBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool,optional
	default value is Standard_False

Returns
-------
None
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
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellFaceClassifier;
		%feature("autodoc", "Creates a classifier in 3d space, to compare : a face with a set of faces a shell with a set of faces a shell with a shell.

Parameters
----------
BB: TopOpeBRepBuild_BlockBuilder

Returns
-------
None
") TopOpeBRepBuild_ShellFaceClassifier;
		 TopOpeBRepBuild_ShellFaceClassifier(const TopOpeBRepBuild_BlockBuilder & BB);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** CompareElement ******************/
		%feature("compactdefaultargs") CompareElement;
		%feature("autodoc", "Add the face <f> in the set of faces used in 3d point classification. returns false if the face <f> has been already added to the set of faces, otherwise returns true.

Parameters
----------
F: TopoDS_Shape

Returns
-------
bool
") CompareElement;
		Standard_Boolean CompareElement(const TopoDS_Shape & F);

		/****************** CompareElementToShape ******************/
		%feature("compactdefaultargs") CompareElementToShape;
		%feature("autodoc", "Classify face <f> with shell <s>.

Parameters
----------
F: TopoDS_Shape
S: TopoDS_Shape

Returns
-------
TopAbs_State
") CompareElementToShape;
		TopAbs_State CompareElementToShape(const TopoDS_Shape & F, const TopoDS_Shape & S);

		/****************** CompareShapes ******************/
		%feature("compactdefaultargs") CompareShapes;
		%feature("autodoc", "Classify shell <b1> with shell <b2>.

Parameters
----------
B1: TopoDS_Shape
B2: TopoDS_Shape

Returns
-------
TopAbs_State
") CompareShapes;
		TopAbs_State CompareShapes(const TopoDS_Shape & B1, const TopoDS_Shape & B2);

		/****************** ResetElement ******************/
		%feature("compactdefaultargs") ResetElement;
		%feature("autodoc", "Prepare classification involving face <f> define 3d point (later used in compare()) on first vertex of face <f>.

Parameters
----------
F: TopoDS_Shape

Returns
-------
None
") ResetElement;
		void ResetElement(const TopoDS_Shape & F);

		/****************** ResetShape ******************/
		%feature("compactdefaultargs") ResetShape;
		%feature("autodoc", "Prepare classification involving shell <s> calls resetelement on first face of <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") ResetShape;
		void ResetShape(const TopoDS_Shape & S);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Returns state of classification of 3d point, defined by resetelement, with the current set of faces, defined by compare.

Returns
-------
TopAbs_State
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
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidAreaBuilder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepBuild_SolidAreaBuilder;
		 TopOpeBRepBuild_SolidAreaBuilder();

		/****************** TopOpeBRepBuild_SolidAreaBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidAreaBuilder;
		%feature("autodoc", "Creates a solidareabuilder to build solids on the (shells,blocks of face) of <ls>, using the classifier <lc>.

Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool,optional
	default value is Standard_False

Returns
-------
None
") TopOpeBRepBuild_SolidAreaBuilder;
		 TopOpeBRepBuild_SolidAreaBuilder(TopOpeBRepBuild_LoopSet & LS, TopOpeBRepBuild_LoopClassifier & LC, const Standard_Boolean ForceClass = Standard_False);

		/****************** InitSolidAreaBuilder ******************/
		%feature("compactdefaultargs") InitSolidAreaBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
LS: TopOpeBRepBuild_LoopSet
LC: TopOpeBRepBuild_LoopClassifier
ForceClass: bool,optional
	default value is Standard_False

Returns
-------
None
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
		%feature("compactdefaultargs") TopOpeBRepBuild_WireEdgeClassifier;
		%feature("autodoc", "Creates a classifier on edge <f>. used to compare edges and wires on the edge <f>.

Parameters
----------
F: TopoDS_Shape
BB: TopOpeBRepBuild_BlockBuilder

Returns
-------
None
") TopOpeBRepBuild_WireEdgeClassifier;
		 TopOpeBRepBuild_WireEdgeClassifier(const TopoDS_Shape & F, const TopOpeBRepBuild_BlockBuilder & BB);

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "No available documentation.

Parameters
----------
L1: TopOpeBRepBuild_Loop
L2: TopOpeBRepBuild_Loop

Returns
-------
TopAbs_State
") Compare;
		virtual TopAbs_State Compare(const opencascade::handle<TopOpeBRepBuild_Loop> & L1, const opencascade::handle<TopOpeBRepBuild_Loop> & L2);

		/****************** CompareElement ******************/
		%feature("compactdefaultargs") CompareElement;
		%feature("autodoc", "Add the edge <e> in the set of edges used in 2d point classification.

Parameters
----------
E: TopoDS_Shape

Returns
-------
bool
") CompareElement;
		Standard_Boolean CompareElement(const TopoDS_Shape & E);

		/****************** CompareElementToShape ******************/
		%feature("compactdefaultargs") CompareElementToShape;
		%feature("autodoc", "Classify edge <e> with wire <b>.

Parameters
----------
E: TopoDS_Shape
B: TopoDS_Shape

Returns
-------
TopAbs_State
") CompareElementToShape;
		TopAbs_State CompareElementToShape(const TopoDS_Shape & E, const TopoDS_Shape & B);

		/****************** CompareShapes ******************/
		%feature("compactdefaultargs") CompareShapes;
		%feature("autodoc", "Classify wire <b1> with wire <b2>.

Parameters
----------
B1: TopoDS_Shape
B2: TopoDS_Shape

Returns
-------
TopAbs_State
") CompareShapes;
		TopAbs_State CompareShapes(const TopoDS_Shape & B1, const TopoDS_Shape & B2);

		/****************** LoopToShape ******************/
		%feature("compactdefaultargs") LoopToShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopOpeBRepBuild_Loop

Returns
-------
TopoDS_Shape
") LoopToShape;
		TopoDS_Shape LoopToShape(const opencascade::handle<TopOpeBRepBuild_Loop> & L);

		/****************** ResetElement ******************/
		%feature("compactdefaultargs") ResetElement;
		%feature("autodoc", "Prepare classification involving edge <e> define 2d point (later used in compare()) on first vertex of edge <e>.

Parameters
----------
E: TopoDS_Shape

Returns
-------
None
") ResetElement;
		void ResetElement(const TopoDS_Shape & E);

		/****************** ResetShape ******************/
		%feature("compactdefaultargs") ResetShape;
		%feature("autodoc", "Prepare classification involving wire <b> calls resetelement on first edge of <b>.

Parameters
----------
B: TopoDS_Shape

Returns
-------
None
") ResetShape;
		void ResetShape(const TopoDS_Shape & B);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Returns state of classification of 2d point, defined by resetelement, with the current set of edges, defined by compare.

Returns
-------
TopAbs_State
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
