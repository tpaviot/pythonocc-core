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
/* public enums */
enum TopOpeBRepBuild_LoopEnum {
	TopOpeBRepBuild_ANYLOOP = 0,
	TopOpeBRepBuild_BOUNDARY = 1,
	TopOpeBRepBuild_BLOCK = 2,
};

/* end public enums declaration */

/* handles */
%wrap_handle(TopOpeBRepBuild_HBuilder)
%wrap_handle(TopOpeBRepBuild_Loop)
%wrap_handle(TopOpeBRepBuild_Pave)
/* end handles declaration */

/* templates */
%template(TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape) NCollection_DataMap <TopoDS_Shape , TopOpeBRepBuild_ListOfShapeListOfShape , TopTools_ShapeMapHasher>;
%template(TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo) NCollection_IndexedDataMap <TopoDS_Shape , TopOpeBRepBuild_VertexInfo , TopTools_ShapeMapHasher>;
%template(TopOpeBRepBuild_ListOfPave) NCollection_List <opencascade::handle <TopOpeBRepBuild_Pave>>;
%template(TopOpeBRepBuild_ListIteratorOfListOfPave) NCollection_TListIterator<opencascade::handle<TopOpeBRepBuild_Pave>>;
%template(TopOpeBRepBuild_ListOfShapeListOfShape) NCollection_List <TopOpeBRepBuild_ShapeListOfShape>;
%template(TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape) NCollection_TListIterator<TopOpeBRepBuild_ShapeListOfShape>;
%template(TopOpeBRepBuild_ListOfLoop) NCollection_List <opencascade::handle <TopOpeBRepBuild_Loop>>;
%template(TopOpeBRepBuild_ListIteratorOfListOfLoop) NCollection_TListIterator<opencascade::handle<TopOpeBRepBuild_Loop>>;
%template(TopOpeBRepBuild_ListOfListOfLoop) NCollection_List <TopOpeBRepBuild_ListOfLoop>;
%template(TopOpeBRepBuild_ListIteratorOfListOfListOfLoop) NCollection_TListIterator<TopOpeBRepBuild_ListOfLoop>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <TopoDS_Shape , TopOpeBRepBuild_ListOfShapeListOfShape , TopTools_ShapeMapHasher> TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape;
typedef NCollection_DataMap <TopoDS_Shape , TopOpeBRepBuild_ListOfShapeListOfShape , TopTools_ShapeMapHasher>::Iterator TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape;
typedef TopOpeBRepBuild_Builder * TopOpeBRepBuild_PBuilder;
typedef NCollection_IndexedDataMap <TopoDS_Shape , TopOpeBRepBuild_VertexInfo , TopTools_ShapeMapHasher> TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo;
typedef NCollection_List <opencascade::handle <TopOpeBRepBuild_Pave>> TopOpeBRepBuild_ListOfPave;
typedef NCollection_List <opencascade::handle <TopOpeBRepBuild_Pave>>::Iterator TopOpeBRepBuild_ListIteratorOfListOfPave;
typedef NCollection_List <TopOpeBRepBuild_ShapeListOfShape> TopOpeBRepBuild_ListOfShapeListOfShape;
typedef NCollection_List <TopOpeBRepBuild_ShapeListOfShape>::Iterator TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape;
typedef TopOpeBRepBuild_GTopo * TopOpeBRepBuild_PGTopo;
typedef NCollection_List <opencascade::handle <TopOpeBRepBuild_Loop>> TopOpeBRepBuild_ListOfLoop;
typedef NCollection_List <opencascade::handle <TopOpeBRepBuild_Loop>>::Iterator TopOpeBRepBuild_ListIteratorOfListOfLoop;
typedef TopOpeBRepBuild_WireEdgeSet * TopOpeBRepBuild_PWireEdgeSet;
typedef NCollection_List <TopOpeBRepBuild_ListOfLoop> TopOpeBRepBuild_ListOfListOfLoop;
typedef NCollection_List <TopOpeBRepBuild_ListOfLoop>::Iterator TopOpeBRepBuild_ListIteratorOfListOfListOfLoop;
/* end typedefs declaration */

/************************************
* class TopOpeBRepBuild_AreaBuilder *
************************************/
class TopOpeBRepBuild_AreaBuilder {
	public:
		/****************** ADD_LISTOFLoop_TO_LISTOFLoop ******************/
		%feature("compactdefaultargs") ADD_LISTOFLoop_TO_LISTOFLoop;
		%feature("autodoc", ":param LOL1:
	:type LOL1: TopOpeBRepBuild_ListOfLoop
	:param LOL2:
	:type LOL2: TopOpeBRepBuild_ListOfLoop
	:param s: default value is NULL
	:type s: Standard_Address
	:param s1: default value is NULL
	:type s1: Standard_Address
	:param s2: default value is NULL
	:type s2: Standard_Address
	:rtype: void") ADD_LISTOFLoop_TO_LISTOFLoop;
		virtual void ADD_LISTOFLoop_TO_LISTOFLoop (TopOpeBRepBuild_ListOfLoop & LOL1,TopOpeBRepBuild_ListOfLoop & LOL2,const Standard_Address s = NULL,const Standard_Address s1 = NULL,const Standard_Address s2 = NULL);

		/****************** ADD_Loop_TO_LISTOFLoop ******************/
		%feature("compactdefaultargs") ADD_Loop_TO_LISTOFLoop;
		%feature("autodoc", ":param L:
	:type L: TopOpeBRepBuild_Loop
	:param LOL:
	:type LOL: TopOpeBRepBuild_ListOfLoop
	:param s: default value is NULL
	:type s: Standard_Address
	:rtype: void") ADD_Loop_TO_LISTOFLoop;
		virtual void ADD_Loop_TO_LISTOFLoop (const opencascade::handle<TopOpeBRepBuild_Loop> & L,TopOpeBRepBuild_ListOfLoop & LOL,const Standard_Address s = NULL);

		/****************** InitArea ******************/
		%feature("compactdefaultargs") InitArea;
		%feature("autodoc", "* Initialize iteration on areas.
	:rtype: int") InitArea;
		Standard_Integer InitArea ();

		/****************** InitAreaBuilder ******************/
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "* Sets a AreaBuilder to find the areas on the shapes described by <LS> using the classifier <LC>.
	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: void") InitAreaBuilder;
		virtual void InitAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);

		/****************** InitLoop ******************/
		%feature("compactdefaultargs") InitLoop;
		%feature("autodoc", "* Initialize iteration on loops of current Area.
	:rtype: int") InitLoop;
		Standard_Integer InitLoop ();

		/****************** Loop ******************/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "* Returns the current Loop in the current area.
	:rtype: opencascade::handle<TopOpeBRepBuild_Loop>") Loop;
		const opencascade::handle<TopOpeBRepBuild_Loop> & Loop ();

		/****************** MoreArea ******************/
		%feature("compactdefaultargs") MoreArea;
		%feature("autodoc", ":rtype: bool") MoreArea;
		Standard_Boolean MoreArea ();

		/****************** MoreLoop ******************/
		%feature("compactdefaultargs") MoreLoop;
		%feature("autodoc", ":rtype: bool") MoreLoop;
		Standard_Boolean MoreLoop ();

		/****************** NextArea ******************/
		%feature("compactdefaultargs") NextArea;
		%feature("autodoc", ":rtype: None") NextArea;
		void NextArea ();

		/****************** NextLoop ******************/
		%feature("compactdefaultargs") NextLoop;
		%feature("autodoc", ":rtype: None") NextLoop;
		void NextLoop ();

		/****************** REM_Loop_FROM_LISTOFLoop ******************/
		%feature("compactdefaultargs") REM_Loop_FROM_LISTOFLoop;
		%feature("autodoc", ":param ITLOL:
	:type ITLOL: TopOpeBRepBuild_ListIteratorOfListOfLoop
	:param LOL:
	:type LOL: TopOpeBRepBuild_ListOfLoop
	:param s: default value is NULL
	:type s: Standard_Address
	:rtype: void") REM_Loop_FROM_LISTOFLoop;
		virtual void REM_Loop_FROM_LISTOFLoop (TopOpeBRepBuild_ListIteratorOfListOfLoop & ITLOL,TopOpeBRepBuild_ListOfLoop & LOL,const Standard_Address s = NULL);

		/****************** TopOpeBRepBuild_AreaBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_AreaBuilder;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_AreaBuilder;
		 TopOpeBRepBuild_AreaBuilder ();

		/****************** TopOpeBRepBuild_AreaBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_AreaBuilder;
		%feature("autodoc", "* Creates a AreaBuilder to build the areas on the shapes described by <LS> using the classifier <LC>.
	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None") TopOpeBRepBuild_AreaBuilder;
		 TopOpeBRepBuild_AreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);

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
		/****************** AddElement ******************/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: int") AddElement;
		Standard_Integer AddElement (const TopoDS_Shape & S);

		/****************** BlockIterator ******************/
		%feature("compactdefaultargs") BlockIterator;
		%feature("autodoc", ":rtype: TopOpeBRepBuild_BlockIterator") BlockIterator;
		TopOpeBRepBuild_BlockIterator BlockIterator ();

		/****************** CurrentBlockIsRegular ******************/
		%feature("compactdefaultargs") CurrentBlockIsRegular;
		%feature("autodoc", ":rtype: bool") CurrentBlockIsRegular;
		Standard_Boolean CurrentBlockIsRegular ();

		/****************** Element ******************/
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "* Returns the current element of <BI>.
	:param BI:
	:type BI: TopOpeBRepBuild_BlockIterator
	:rtype: TopoDS_Shape") Element;
		const TopoDS_Shape  Element (const TopOpeBRepBuild_BlockIterator & BI);

		/****************** Element ******************/
		%feature("compactdefaultargs") Element;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopoDS_Shape") Element;
		const TopoDS_Shape  Element (const Standard_Integer I);

		/****************** Element ******************/
		%feature("compactdefaultargs") Element;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: int") Element;
		Standard_Integer Element (const TopoDS_Shape & S);

		/****************** ElementIsValid ******************/
		%feature("compactdefaultargs") ElementIsValid;
		%feature("autodoc", ":param BI:
	:type BI: TopOpeBRepBuild_BlockIterator
	:rtype: bool") ElementIsValid;
		Standard_Boolean ElementIsValid (const TopOpeBRepBuild_BlockIterator & BI);

		/****************** ElementIsValid ******************/
		%feature("compactdefaultargs") ElementIsValid;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: bool") ElementIsValid;
		Standard_Boolean ElementIsValid (const Standard_Integer I);

		/****************** InitBlock ******************/
		%feature("compactdefaultargs") InitBlock;
		%feature("autodoc", ":rtype: None") InitBlock;
		void InitBlock ();

		/****************** MakeBlock ******************/
		%feature("compactdefaultargs") MakeBlock;
		%feature("autodoc", ":param SS:
	:type SS: TopOpeBRepBuild_ShapeSet
	:rtype: None") MakeBlock;
		void MakeBlock (TopOpeBRepBuild_ShapeSet & SS);

		/****************** MoreBlock ******************/
		%feature("compactdefaultargs") MoreBlock;
		%feature("autodoc", ":rtype: bool") MoreBlock;
		Standard_Boolean MoreBlock ();

		/****************** NextBlock ******************/
		%feature("compactdefaultargs") NextBlock;
		%feature("autodoc", ":rtype: None") NextBlock;
		void NextBlock ();

		/****************** SetValid ******************/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", ":param BI:
	:type BI: TopOpeBRepBuild_BlockIterator
	:param isvalid:
	:type isvalid: bool
	:rtype: None") SetValid;
		void SetValid (const TopOpeBRepBuild_BlockIterator & BI,const Standard_Boolean isvalid);

		/****************** SetValid ******************/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", ":param I:
	:type I: int
	:param isvalid:
	:type isvalid: bool
	:rtype: None") SetValid;
		void SetValid (const Standard_Integer I,const Standard_Boolean isvalid);

		/****************** TopOpeBRepBuild_BlockBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockBuilder;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_BlockBuilder;
		 TopOpeBRepBuild_BlockBuilder ();

		/****************** TopOpeBRepBuild_BlockBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockBuilder;
		%feature("autodoc", ":param SS:
	:type SS: TopOpeBRepBuild_ShapeSet
	:rtype: None") TopOpeBRepBuild_BlockBuilder;
		 TopOpeBRepBuild_BlockBuilder (TopOpeBRepBuild_ShapeSet & SS);

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
		/****************** Extent ******************/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", ":rtype: int") Extent;
		Standard_Integer Extent ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", ":rtype: None") Initialize;
		void Initialize ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: None") Next;
		void Next ();

		/****************** TopOpeBRepBuild_BlockIterator ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockIterator;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_BlockIterator;
		 TopOpeBRepBuild_BlockIterator ();

		/****************** TopOpeBRepBuild_BlockIterator ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockIterator;
		%feature("autodoc", ":param Lower:
	:type Lower: int
	:param Upper:
	:type Upper: int
	:rtype: None") TopOpeBRepBuild_BlockIterator;
		 TopOpeBRepBuild_BlockIterator (const Standard_Integer Lower,const Standard_Integer Upper);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: int") Value;
		Standard_Integer Value ();

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
		/****************** AddONPatchesSFS ******************/
		%feature("compactdefaultargs") AddONPatchesSFS;
		%feature("autodoc", ":param G:
	:type G: TopOpeBRepBuild_GTopo
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet
	:rtype: None") AddONPatchesSFS;
		void AddONPatchesSFS (const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** BuildEdges ******************/
		%feature("compactdefaultargs") BuildEdges;
		%feature("autodoc", "* update the DS by creating new geometries. create shapes from the new geometries.
	:param DS:
	:type DS: TopOpeBRepDS_HDataStructure
	:rtype: None") BuildEdges;
		void BuildEdges (const opencascade::handle<TopOpeBRepDS_HDataStructure> & DS);

		/****************** BuildTool ******************/
		%feature("compactdefaultargs") BuildTool;
		%feature("autodoc", ":rtype: TopOpeBRepDS_BuildTool") BuildTool;
		const TopOpeBRepDS_BuildTool & BuildTool ();

		/****************** BuildVertices ******************/
		%feature("compactdefaultargs") BuildVertices;
		%feature("autodoc", "* update the DS by creating new geometries. create vertices on DS points.
	:param DS:
	:type DS: TopOpeBRepDS_HDataStructure
	:rtype: None") BuildVertices;
		void BuildVertices (const opencascade::handle<TopOpeBRepDS_HDataStructure> & DS);

		/****************** ChangeBuildTool ******************/
		%feature("compactdefaultargs") ChangeBuildTool;
		%feature("autodoc", ":rtype: TopOpeBRepDS_BuildTool") ChangeBuildTool;
		TopOpeBRepDS_BuildTool & ChangeBuildTool ();

		/****************** ChangeClassify ******************/
		%feature("compactdefaultargs") ChangeClassify;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") ChangeClassify;
		void ChangeClassify (const Standard_Boolean B);

		/****************** ChangeMSplit ******************/
		%feature("compactdefaultargs") ChangeMSplit;
		%feature("autodoc", ":param s:
	:type s: TopAbs_State
	:rtype: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State") ChangeMSplit;
		TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & ChangeMSplit (const TopAbs_State s);

		/****************** ChangeSplit ******************/
		%feature("compactdefaultargs") ChangeSplit;
		%feature("autodoc", "* Returns a ref.on the list of shapes connected to <S> as <TB> split parts of <S>. Mark <S> as split in <TB> parts.
	:param S:
	:type S: TopoDS_Shape
	:param TB:
	:type TB: TopAbs_State
	:rtype: TopTools_ListOfShape") ChangeSplit;
		TopTools_ListOfShape & ChangeSplit (const TopoDS_Shape & S,const TopAbs_State TB);

		/****************** Classify ******************/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", ":rtype: bool") Classify;
		Standard_Boolean Classify ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Removes all splits and merges already performed. Does NOT clear the handled DS.
	:rtype: void") Clear;
		virtual void Clear ();

		/****************** ClearMaps ******************/
		%feature("compactdefaultargs") ClearMaps;
		%feature("autodoc", ":rtype: None") ClearMaps;
		void ClearMaps ();

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: bool") Contains;
		static Standard_Boolean Contains (const TopoDS_Shape & S,const TopTools_ListOfShape & L);

		/****************** DataStructure ******************/
		%feature("compactdefaultargs") DataStructure;
		%feature("autodoc", "* returns the DS handled by this builder
	:rtype: opencascade::handle<TopOpeBRepDS_HDataStructure>") DataStructure;
		opencascade::handle<TopOpeBRepDS_HDataStructure> DataStructure ();

		/****************** End ******************/
		%feature("compactdefaultargs") End;
		%feature("autodoc", ":rtype: None") End;
		void End ();

		/****************** FillOnPatches ******************/
		%feature("compactdefaultargs") FillOnPatches;
		%feature("autodoc", ":param anEdgesON:
	:type anEdgesON: TopTools_ListOfShape
	:param aBaseFace:
	:type aBaseFace: TopoDS_Shape
	:param avoidMap:
	:type avoidMap: TopTools_IndexedMapOfOrientedShape
	:rtype: None") FillOnPatches;
		void FillOnPatches (const TopTools_ListOfShape & anEdgesON,const TopoDS_Shape & aBaseFace,const TopTools_IndexedMapOfOrientedShape & avoidMap);

		/****************** FillSecEdgeAncestorMap ******************/
		%feature("compactdefaultargs") FillSecEdgeAncestorMap;
		%feature("autodoc", "* Fills anAncMap with pairs (edge,ancestor edge) for each split from the map aMapON for the shape object identified by ShapeRank
	:param aShapeRank:
	:type aShapeRank: int
	:param aMapON:
	:type aMapON: TopTools_MapOfShape
	:param anAncMap:
	:type anAncMap: TopTools_DataMapOfShapeShape
	:rtype: None") FillSecEdgeAncestorMap;
		void FillSecEdgeAncestorMap (const Standard_Integer aShapeRank,const TopTools_MapOfShape & aMapON,TopTools_DataMapOfShapeShape & anAncMap);

		/****************** FindFacesTouchingEdge ******************/
		%feature("compactdefaultargs") FindFacesTouchingEdge;
		%feature("autodoc", ":param aFace:
	:type aFace: TopoDS_Shape
	:param anEdge:
	:type anEdge: TopoDS_Shape
	:param aShRank:
	:type aShRank: int
	:param aFaces:
	:type aFaces: TopTools_ListOfShape
	:rtype: None") FindFacesTouchingEdge;
		void FindFacesTouchingEdge (const TopoDS_Shape & aFace,const TopoDS_Shape & anEdge,const Standard_Integer aShRank,TopTools_ListOfShape & aFaces);

		/****************** FindIsKPart ******************/
		%feature("compactdefaultargs") FindIsKPart;
		%feature("autodoc", ":rtype: int") FindIsKPart;
		Standard_Integer FindIsKPart ();

		/****************** FindSameDomain ******************/
		%feature("compactdefaultargs") FindSameDomain;
		%feature("autodoc", ":param L1:
	:type L1: TopTools_ListOfShape
	:param L2:
	:type L2: TopTools_ListOfShape
	:rtype: None") FindSameDomain;
		void FindSameDomain (TopTools_ListOfShape & L1,TopTools_ListOfShape & L2);

		/****************** FindSameDomainSameOrientation ******************/
		%feature("compactdefaultargs") FindSameDomainSameOrientation;
		%feature("autodoc", ":param LSO:
	:type LSO: TopTools_ListOfShape
	:param LDO:
	:type LDO: TopTools_ListOfShape
	:rtype: None") FindSameDomainSameOrientation;
		void FindSameDomainSameOrientation (TopTools_ListOfShape & LSO,TopTools_ListOfShape & LDO);

		/****************** FindSameRank ******************/
		%feature("compactdefaultargs") FindSameRank;
		%feature("autodoc", ":param L1:
	:type L1: TopTools_ListOfShape
	:param R:
	:type R: int
	:param L2:
	:type L2: TopTools_ListOfShape
	:rtype: None") FindSameRank;
		void FindSameRank (const TopTools_ListOfShape & L1,const Standard_Integer R,TopTools_ListOfShape & L2);

		/****************** GClearMaps ******************/
		%feature("compactdefaultargs") GClearMaps;
		%feature("autodoc", ":rtype: None") GClearMaps;
		void GClearMaps ();

		/****************** GContains ******************/
		%feature("compactdefaultargs") GContains;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: bool") GContains;
		static Standard_Boolean GContains (const TopoDS_Shape & S,const TopTools_ListOfShape & L);

		/****************** GCopyList ******************/
		%feature("compactdefaultargs") GCopyList;
		%feature("autodoc", ":param Lin:
	:type Lin: TopTools_ListOfShape
	:param i1:
	:type i1: int
	:param i2:
	:type i2: int
	:param Lou:
	:type Lou: TopTools_ListOfShape
	:rtype: void") GCopyList;
		static void GCopyList (const TopTools_ListOfShape & Lin,const Standard_Integer i1,const Standard_Integer i2,TopTools_ListOfShape & Lou);

		/****************** GCopyList ******************/
		%feature("compactdefaultargs") GCopyList;
		%feature("autodoc", ":param Lin:
	:type Lin: TopTools_ListOfShape
	:param Lou:
	:type Lou: TopTools_ListOfShape
	:rtype: void") GCopyList;
		static void GCopyList (const TopTools_ListOfShape & Lin,TopTools_ListOfShape & Lou);

		/****************** GEDBUMakeEdges ******************/
		%feature("compactdefaultargs") GEDBUMakeEdges;
		%feature("autodoc", ":param EF:
	:type EF: TopoDS_Shape
	:param EDBU:
	:type EDBU: TopOpeBRepBuild_EdgeBuilder
	:param LOE:
	:type LOE: TopTools_ListOfShape
	:rtype: None") GEDBUMakeEdges;
		void GEDBUMakeEdges (const TopoDS_Shape & EF,TopOpeBRepBuild_EdgeBuilder & EDBU,TopTools_ListOfShape & LOE);

		/****************** GFABUMakeFaces ******************/
		%feature("compactdefaultargs") GFABUMakeFaces;
		%feature("autodoc", ":param FF:
	:type FF: TopoDS_Shape
	:param FABU:
	:type FABU: TopOpeBRepBuild_FaceBuilder
	:param LOF:
	:type LOF: TopTools_ListOfShape
	:param MWisOld:
	:type MWisOld: TopTools_DataMapOfShapeInteger
	:rtype: None") GFABUMakeFaces;
		void GFABUMakeFaces (const TopoDS_Shape & FF,TopOpeBRepBuild_FaceBuilder & FABU,TopTools_ListOfShape & LOF,TopTools_DataMapOfShapeInteger & MWisOld);

		/****************** GFillCurveTopologyWES ******************/
		%feature("compactdefaultargs") GFillCurveTopologyWES;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Shape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:rtype: None") GFillCurveTopologyWES;
		void GFillCurveTopologyWES (const TopoDS_Shape & F,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillCurveTopologyWES ******************/
		%feature("compactdefaultargs") GFillCurveTopologyWES;
		%feature("autodoc", ":param IT:
	:type IT: TopOpeBRepDS_CurveIterator
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:rtype: None") GFillCurveTopologyWES;
		void GFillCurveTopologyWES (const TopOpeBRepDS_CurveIterator & IT,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillEdgePVS ******************/
		%feature("compactdefaultargs") GFillEdgePVS;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param LE2:
	:type LE2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param PVS:
	:type PVS: TopOpeBRepBuild_PaveSet
	:rtype: None") GFillEdgePVS;
		void GFillEdgePVS (const TopoDS_Shape & E,const TopTools_ListOfShape & LE2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_PaveSet & PVS);

		/****************** GFillEdgeWES ******************/
		%feature("compactdefaultargs") GFillEdgeWES;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param LF2:
	:type LF2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:rtype: None") GFillEdgeWES;
		void GFillEdgeWES (const TopoDS_Shape & E,const TopTools_ListOfShape & LF2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillEdgesPVS ******************/
		%feature("compactdefaultargs") GFillEdgesPVS;
		%feature("autodoc", ":param LE1:
	:type LE1: TopTools_ListOfShape
	:param LE2:
	:type LE2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param PVS:
	:type PVS: TopOpeBRepBuild_PaveSet
	:rtype: None") GFillEdgesPVS;
		void GFillEdgesPVS (const TopTools_ListOfShape & LE1,const TopTools_ListOfShape & LE2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_PaveSet & PVS);

		/****************** GFillFaceSFS ******************/
		%feature("compactdefaultargs") GFillFaceSFS;
		%feature("autodoc", ":param F1:
	:type F1: TopoDS_Shape
	:param LSO2:
	:type LSO2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet
	:rtype: None") GFillFaceSFS;
		void GFillFaceSFS (const TopoDS_Shape & F1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillFaceWES ******************/
		%feature("compactdefaultargs") GFillFaceWES;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Shape
	:param LF2:
	:type LF2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:rtype: None") GFillFaceWES;
		void GFillFaceWES (const TopoDS_Shape & F,const TopTools_ListOfShape & LF2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillFacesWES ******************/
		%feature("compactdefaultargs") GFillFacesWES;
		%feature("autodoc", ":param LF1:
	:type LF1: TopTools_ListOfShape
	:param LF2:
	:type LF2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:rtype: None") GFillFacesWES;
		void GFillFacesWES (const TopTools_ListOfShape & LF1,const TopTools_ListOfShape & LF2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillFacesWESK ******************/
		%feature("compactdefaultargs") GFillFacesWESK;
		%feature("autodoc", ":param LF1:
	:type LF1: TopTools_ListOfShape
	:param LF2:
	:type LF2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:param K:
	:type K: int
	:rtype: None") GFillFacesWESK;
		void GFillFacesWESK (const TopTools_ListOfShape & LF1,const TopTools_ListOfShape & LF2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES,const Standard_Integer K);

		/****************** GFillFacesWESMakeFaces ******************/
		%feature("compactdefaultargs") GFillFacesWESMakeFaces;
		%feature("autodoc", ":param LF1:
	:type LF1: TopTools_ListOfShape
	:param LF2:
	:type LF2: TopTools_ListOfShape
	:param LSO:
	:type LSO: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:rtype: None") GFillFacesWESMakeFaces;
		void GFillFacesWESMakeFaces (const TopTools_ListOfShape & LF1,const TopTools_ListOfShape & LF2,const TopTools_ListOfShape & LSO,const TopOpeBRepBuild_GTopo & G);

		/****************** GFillONPartsWES ******************/
		%feature("compactdefaultargs") GFillONPartsWES;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Shape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param LSclass:
	:type LSclass: TopTools_ListOfShape
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:rtype: None") GFillONPartsWES;
		void GFillONPartsWES (const TopoDS_Shape & F,const TopOpeBRepBuild_GTopo & G,const TopTools_ListOfShape & LSclass,TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillPointTopologyPVS ******************/
		%feature("compactdefaultargs") GFillPointTopologyPVS;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param PVS:
	:type PVS: TopOpeBRepBuild_PaveSet
	:rtype: None") GFillPointTopologyPVS;
		void GFillPointTopologyPVS (const TopoDS_Shape & E,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_PaveSet & PVS);

		/****************** GFillPointTopologyPVS ******************/
		%feature("compactdefaultargs") GFillPointTopologyPVS;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param IT:
	:type IT: TopOpeBRepDS_PointIterator
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param PVS:
	:type PVS: TopOpeBRepBuild_PaveSet
	:rtype: None") GFillPointTopologyPVS;
		void GFillPointTopologyPVS (const TopoDS_Shape & E,const TopOpeBRepDS_PointIterator & IT,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_PaveSet & PVS);

		/****************** GFillShellSFS ******************/
		%feature("compactdefaultargs") GFillShellSFS;
		%feature("autodoc", ":param SH1:
	:type SH1: TopoDS_Shape
	:param LSO2:
	:type LSO2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet
	:rtype: void") GFillShellSFS;
		virtual void GFillShellSFS (const TopoDS_Shape & SH1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillSolidSFS ******************/
		%feature("compactdefaultargs") GFillSolidSFS;
		%feature("autodoc", ":param SO1:
	:type SO1: TopoDS_Shape
	:param LSO2:
	:type LSO2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet
	:rtype: void") GFillSolidSFS;
		virtual void GFillSolidSFS (const TopoDS_Shape & SO1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillSolidsSFS ******************/
		%feature("compactdefaultargs") GFillSolidsSFS;
		%feature("autodoc", ":param LSO1:
	:type LSO1: TopTools_ListOfShape
	:param LSO2:
	:type LSO2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet
	:rtype: None") GFillSolidsSFS;
		void GFillSolidsSFS (const TopTools_ListOfShape & LSO1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillSurfaceTopologySFS ******************/
		%feature("compactdefaultargs") GFillSurfaceTopologySFS;
		%feature("autodoc", ":param SO1:
	:type SO1: TopoDS_Shape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet
	:rtype: None") GFillSurfaceTopologySFS;
		void GFillSurfaceTopologySFS (const TopoDS_Shape & SO1,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillSurfaceTopologySFS ******************/
		%feature("compactdefaultargs") GFillSurfaceTopologySFS;
		%feature("autodoc", ":param IT:
	:type IT: TopOpeBRepDS_SurfaceIterator
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet
	:rtype: None") GFillSurfaceTopologySFS;
		void GFillSurfaceTopologySFS (const TopOpeBRepDS_SurfaceIterator & IT,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillWireWES ******************/
		%feature("compactdefaultargs") GFillWireWES;
		%feature("autodoc", ":param W:
	:type W: TopoDS_Shape
	:param LF2:
	:type LF2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:rtype: None") GFillWireWES;
		void GFillWireWES (const TopoDS_Shape & W,const TopTools_ListOfShape & LF2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFindSamDom ******************/
		%feature("compactdefaultargs") GFindSamDom;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param L1:
	:type L1: TopTools_ListOfShape
	:param L2:
	:type L2: TopTools_ListOfShape
	:rtype: None") GFindSamDom;
		void GFindSamDom (const TopoDS_Shape & S,TopTools_ListOfShape & L1,TopTools_ListOfShape & L2);

		/****************** GFindSamDom ******************/
		%feature("compactdefaultargs") GFindSamDom;
		%feature("autodoc", ":param L1:
	:type L1: TopTools_ListOfShape
	:param L2:
	:type L2: TopTools_ListOfShape
	:rtype: None") GFindSamDom;
		void GFindSamDom (TopTools_ListOfShape & L1,TopTools_ListOfShape & L2);

		/****************** GFindSamDomSODO ******************/
		%feature("compactdefaultargs") GFindSamDomSODO;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param LSO:
	:type LSO: TopTools_ListOfShape
	:param LDO:
	:type LDO: TopTools_ListOfShape
	:rtype: None") GFindSamDomSODO;
		void GFindSamDomSODO (const TopoDS_Shape & S,TopTools_ListOfShape & LSO,TopTools_ListOfShape & LDO);

		/****************** GFindSamDomSODO ******************/
		%feature("compactdefaultargs") GFindSamDomSODO;
		%feature("autodoc", ":param LSO:
	:type LSO: TopTools_ListOfShape
	:param LDO:
	:type LDO: TopTools_ListOfShape
	:rtype: None") GFindSamDomSODO;
		void GFindSamDomSODO (TopTools_ListOfShape & LSO,TopTools_ListOfShape & LDO);

		/****************** GFindSameRank ******************/
		%feature("compactdefaultargs") GFindSameRank;
		%feature("autodoc", ":param L1:
	:type L1: TopTools_ListOfShape
	:param R:
	:type R: int
	:param L2:
	:type L2: TopTools_ListOfShape
	:rtype: None") GFindSameRank;
		void GFindSameRank (const TopTools_ListOfShape & L1,const Standard_Integer R,TopTools_ListOfShape & L2);

		/****************** GIsShapeOf ******************/
		%feature("compactdefaultargs") GIsShapeOf;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param I12:
	:type I12: int
	:rtype: bool") GIsShapeOf;
		Standard_Boolean GIsShapeOf (const TopoDS_Shape & S,const Standard_Integer I12);

		/****************** GKeepShape ******************/
		%feature("compactdefaultargs") GKeepShape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param Lref:
	:type Lref: TopTools_ListOfShape
	:param T:
	:type T: TopAbs_State
	:rtype: bool") GKeepShape;
		Standard_Boolean GKeepShape (const TopoDS_Shape & S,const TopTools_ListOfShape & Lref,const TopAbs_State T);

		/****************** GKeepShape1 ******************/
		%feature("compactdefaultargs") GKeepShape1;
		%feature("autodoc", "* return True if S is classified <T> / Lref shapes
	:param S:
	:type S: TopoDS_Shape
	:param Lref:
	:type Lref: TopTools_ListOfShape
	:param T:
	:type T: TopAbs_State
	:param pos:
	:type pos: TopAbs_State
	:rtype: bool") GKeepShape1;
		Standard_Boolean GKeepShape1 (const TopoDS_Shape & S,const TopTools_ListOfShape & Lref,const TopAbs_State T,TopAbs_State & pos);

		/****************** GKeepShapes ******************/
		%feature("compactdefaultargs") GKeepShapes;
		%feature("autodoc", "* add to Lou the shapes of Lin classified <T> / Lref shapes. Lou is not cleared. (S is a dummy trace argument)
	:param S:
	:type S: TopoDS_Shape
	:param Lref:
	:type Lref: TopTools_ListOfShape
	:param T:
	:type T: TopAbs_State
	:param Lin:
	:type Lin: TopTools_ListOfShape
	:param Lou:
	:type Lou: TopTools_ListOfShape
	:rtype: None") GKeepShapes;
		void GKeepShapes (const TopoDS_Shape & S,const TopTools_ListOfShape & Lref,const TopAbs_State T,const TopTools_ListOfShape & Lin,TopTools_ListOfShape & Lou);

		/****************** GMapShapes ******************/
		%feature("compactdefaultargs") GMapShapes;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: None") GMapShapes;
		void GMapShapes (const TopoDS_Shape & S1,const TopoDS_Shape & S2);

		/****************** GMergeEdgeWES ******************/
		%feature("compactdefaultargs") GMergeEdgeWES;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:rtype: None") GMergeEdgeWES;
		void GMergeEdgeWES (const TopoDS_Shape & E,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GMergeEdges ******************/
		%feature("compactdefaultargs") GMergeEdges;
		%feature("autodoc", ":param LE1:
	:type LE1: TopTools_ListOfShape
	:param LE2:
	:type LE2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:rtype: None") GMergeEdges;
		void GMergeEdges (const TopTools_ListOfShape & LE1,const TopTools_ListOfShape & LE2,const TopOpeBRepBuild_GTopo & G);

		/****************** GMergeFaceSFS ******************/
		%feature("compactdefaultargs") GMergeFaceSFS;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Shape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet
	:rtype: None") GMergeFaceSFS;
		void GMergeFaceSFS (const TopoDS_Shape & F,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GMergeFaces ******************/
		%feature("compactdefaultargs") GMergeFaces;
		%feature("autodoc", ":param LF1:
	:type LF1: TopTools_ListOfShape
	:param LF2:
	:type LF2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:rtype: None") GMergeFaces;
		void GMergeFaces (const TopTools_ListOfShape & LF1,const TopTools_ListOfShape & LF2,const TopOpeBRepBuild_GTopo & G);

		/****************** GMergeSolids ******************/
		%feature("compactdefaultargs") GMergeSolids;
		%feature("autodoc", ":param LSO1:
	:type LSO1: TopTools_ListOfShape
	:param LSO2:
	:type LSO2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:rtype: None") GMergeSolids;
		void GMergeSolids (const TopTools_ListOfShape & LSO1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G);

		/****************** GPVSMakeEdges ******************/
		%feature("compactdefaultargs") GPVSMakeEdges;
		%feature("autodoc", ":param EF:
	:type EF: TopoDS_Shape
	:param PVS:
	:type PVS: TopOpeBRepBuild_PaveSet
	:param LOE:
	:type LOE: TopTools_ListOfShape
	:rtype: None") GPVSMakeEdges;
		void GPVSMakeEdges (const TopoDS_Shape & EF,TopOpeBRepBuild_PaveSet & PVS,TopTools_ListOfShape & LOE);

		/****************** GParamOnReference ******************/
		%feature("compactdefaultargs") GParamOnReference;
		%feature("autodoc", ":param V:
	:type V: TopoDS_Vertex
	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: float
	:rtype: bool") GParamOnReference;
		Standard_Boolean GParamOnReference (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue);

		/****************** GSFSMakeSolids ******************/
		%feature("compactdefaultargs") GSFSMakeSolids;
		%feature("autodoc", ":param SOF:
	:type SOF: TopoDS_Shape
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet
	:param LOSO:
	:type LOSO: TopTools_ListOfShape
	:rtype: None") GSFSMakeSolids;
		void GSFSMakeSolids (const TopoDS_Shape & SOF,TopOpeBRepBuild_ShellFaceSet & SFS,TopTools_ListOfShape & LOSO);

		/****************** GSOBUMakeSolids ******************/
		%feature("compactdefaultargs") GSOBUMakeSolids;
		%feature("autodoc", ":param SOF:
	:type SOF: TopoDS_Shape
	:param SOBU:
	:type SOBU: TopOpeBRepBuild_SolidBuilder
	:param LOSO:
	:type LOSO: TopTools_ListOfShape
	:rtype: None") GSOBUMakeSolids;
		void GSOBUMakeSolids (const TopoDS_Shape & SOF,TopOpeBRepBuild_SolidBuilder & SOBU,TopTools_ListOfShape & LOSO);

		/****************** GShapeRank ******************/
		%feature("compactdefaultargs") GShapeRank;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: int") GShapeRank;
		Standard_Integer GShapeRank (const TopoDS_Shape & S);

		/****************** GSplitEdge ******************/
		%feature("compactdefaultargs") GSplitEdge;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param LSclass:
	:type LSclass: TopTools_ListOfShape
	:rtype: None") GSplitEdge;
		void GSplitEdge (const TopoDS_Shape & E,const TopOpeBRepBuild_GTopo & G,const TopTools_ListOfShape & LSclass);

		/****************** GSplitEdgeWES ******************/
		%feature("compactdefaultargs") GSplitEdgeWES;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param LF2:
	:type LF2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:rtype: None") GSplitEdgeWES;
		void GSplitEdgeWES (const TopoDS_Shape & E,const TopTools_ListOfShape & LF2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GSplitFace ******************/
		%feature("compactdefaultargs") GSplitFace;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Shape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param LSclass:
	:type LSclass: TopTools_ListOfShape
	:rtype: None") GSplitFace;
		void GSplitFace (const TopoDS_Shape & F,const TopOpeBRepBuild_GTopo & G,const TopTools_ListOfShape & LSclass);

		/****************** GSplitFaceSFS ******************/
		%feature("compactdefaultargs") GSplitFaceSFS;
		%feature("autodoc", ":param F1:
	:type F1: TopoDS_Shape
	:param LSclass:
	:type LSclass: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet
	:rtype: None") GSplitFaceSFS;
		void GSplitFaceSFS (const TopoDS_Shape & F1,const TopTools_ListOfShape & LSclass,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GTakeCommonOfDiff ******************/
		%feature("compactdefaultargs") GTakeCommonOfDiff;
		%feature("autodoc", ":param G:
	:type G: TopOpeBRepBuild_GTopo
	:rtype: bool") GTakeCommonOfDiff;
		static Standard_Boolean GTakeCommonOfDiff (const TopOpeBRepBuild_GTopo & G);

		/****************** GTakeCommonOfSame ******************/
		%feature("compactdefaultargs") GTakeCommonOfSame;
		%feature("autodoc", ":param G:
	:type G: TopOpeBRepBuild_GTopo
	:rtype: bool") GTakeCommonOfSame;
		static Standard_Boolean GTakeCommonOfSame (const TopOpeBRepBuild_GTopo & G);

		/****************** GToMerge ******************/
		%feature("compactdefaultargs") GToMerge;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: bool") GToMerge;
		Standard_Boolean GToMerge (const TopoDS_Shape & S);

		/****************** GToSplit ******************/
		%feature("compactdefaultargs") GToSplit;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param TB:
	:type TB: TopAbs_State
	:rtype: bool") GToSplit;
		Standard_Boolean GToSplit (const TopoDS_Shape & S,const TopAbs_State TB);

		/****************** GWESMakeFaces ******************/
		%feature("compactdefaultargs") GWESMakeFaces;
		%feature("autodoc", ":param FF:
	:type FF: TopoDS_Shape
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:param LOF:
	:type LOF: TopTools_ListOfShape
	:rtype: void") GWESMakeFaces;
		virtual void GWESMakeFaces (const TopoDS_Shape & FF,TopOpeBRepBuild_WireEdgeSet & WES,TopTools_ListOfShape & LOF);

		/****************** GcheckNBOUNDS ******************/
		%feature("compactdefaultargs") GcheckNBOUNDS;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:rtype: bool") GcheckNBOUNDS;
		static Standard_Boolean GcheckNBOUNDS (const TopoDS_Shape & E);

		/****************** GdumpEDBU ******************/
		%feature("compactdefaultargs") GdumpEDBU;
		%feature("autodoc", ":param EB:
	:type EB: TopOpeBRepBuild_EdgeBuilder
	:rtype: None") GdumpEDBU;
		void GdumpEDBU (TopOpeBRepBuild_EdgeBuilder & EB);

		/****************** GdumpEDG ******************/
		%feature("compactdefaultargs") GdumpEDG;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param str: default value is NULL
	:type str: Standard_Address
	:rtype: None") GdumpEDG;
		void GdumpEDG (const TopoDS_Shape & S,const Standard_Address str = NULL);

		/****************** GdumpEDGVER ******************/
		%feature("compactdefaultargs") GdumpEDGVER;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param V:
	:type V: TopoDS_Shape
	:param str: default value is NULL
	:type str: Standard_Address
	:rtype: None") GdumpEDGVER;
		void GdumpEDGVER (const TopoDS_Shape & E,const TopoDS_Shape & V,const Standard_Address str = NULL);

		/****************** GdumpEXP ******************/
		%feature("compactdefaultargs") GdumpEXP;
		%feature("autodoc", ":param E:
	:type E: TopOpeBRepTool_ShapeExplorer
	:rtype: None") GdumpEXP;
		void GdumpEXP (const TopOpeBRepTool_ShapeExplorer & E);

		/****************** GdumpFABU ******************/
		%feature("compactdefaultargs") GdumpFABU;
		%feature("autodoc", ":param FB:
	:type FB: TopOpeBRepBuild_FaceBuilder
	:rtype: None") GdumpFABU;
		void GdumpFABU (TopOpeBRepBuild_FaceBuilder & FB);

		/****************** GdumpLS ******************/
		%feature("compactdefaultargs") GdumpLS;
		%feature("autodoc", ":param L:
	:type L: TopTools_ListOfShape
	:rtype: None") GdumpLS;
		void GdumpLS (const TopTools_ListOfShape & L);

		/****************** GdumpORIPARPNT ******************/
		%feature("compactdefaultargs") GdumpORIPARPNT;
		%feature("autodoc", ":param o:
	:type o: TopAbs_Orientation
	:param p:
	:type p: float
	:param Pnt:
	:type Pnt: gp_Pnt
	:rtype: void") GdumpORIPARPNT;
		static void GdumpORIPARPNT (const TopAbs_Orientation o,const Standard_Real p,const gp_Pnt & Pnt);

		/****************** GdumpPNT ******************/
		%feature("compactdefaultargs") GdumpPNT;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: void") GdumpPNT;
		static void GdumpPNT (const gp_Pnt & P);

		/****************** GdumpSAMDOM ******************/
		%feature("compactdefaultargs") GdumpSAMDOM;
		%feature("autodoc", ":param L:
	:type L: TopTools_ListOfShape
	:param str: default value is NULL
	:type str: Standard_Address
	:rtype: None") GdumpSAMDOM;
		void GdumpSAMDOM (const TopTools_ListOfShape & L,const Standard_Address str = NULL);

		/****************** GdumpSHA ******************/
		%feature("compactdefaultargs") GdumpSHA;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param str: default value is NULL
	:type str: Standard_Address
	:rtype: None") GdumpSHA;
		void GdumpSHA (const TopoDS_Shape & S,const Standard_Address str = NULL);

		/****************** GdumpSHAORI ******************/
		%feature("compactdefaultargs") GdumpSHAORI;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param str: default value is NULL
	:type str: Standard_Address
	:rtype: None") GdumpSHAORI;
		void GdumpSHAORI (const TopoDS_Shape & S,const Standard_Address str = NULL);

		/****************** GdumpSHAORIGEO ******************/
		%feature("compactdefaultargs") GdumpSHAORIGEO;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param str: default value is NULL
	:type str: Standard_Address
	:rtype: None") GdumpSHAORIGEO;
		void GdumpSHAORIGEO (const TopoDS_Shape & S,const Standard_Address str = NULL);

		/****************** GdumpSHASETindex ******************/
		%feature("compactdefaultargs") GdumpSHASETindex;
		%feature("autodoc", ":rtype: int") GdumpSHASETindex;
		Standard_Integer GdumpSHASETindex ();

		/****************** GdumpSHASETreset ******************/
		%feature("compactdefaultargs") GdumpSHASETreset;
		%feature("autodoc", ":rtype: None") GdumpSHASETreset;
		void GdumpSHASETreset ();

		/****************** GdumpSHASTA ******************/
		%feature("compactdefaultargs") GdumpSHASTA;
		%feature("autodoc", ":param iS:
	:type iS: int
	:param T:
	:type T: TopAbs_State
	:param a: default value is ""
	:type a: TCollection_AsciiString
	:param b: default value is ""
	:type b: TCollection_AsciiString
	:rtype: None") GdumpSHASTA;
		void GdumpSHASTA (const Standard_Integer iS,const TopAbs_State T,const TCollection_AsciiString & a = "",const TCollection_AsciiString & b = "");

		/****************** GdumpSHASTA ******************/
		%feature("compactdefaultargs") GdumpSHASTA;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param T:
	:type T: TopAbs_State
	:param a: default value is ""
	:type a: TCollection_AsciiString
	:param b: default value is ""
	:type b: TCollection_AsciiString
	:rtype: None") GdumpSHASTA;
		void GdumpSHASTA (const TopoDS_Shape & S,const TopAbs_State T,const TCollection_AsciiString & a = "",const TCollection_AsciiString & b = "");

		/****************** GdumpSHASTA ******************/
		%feature("compactdefaultargs") GdumpSHASTA;
		%feature("autodoc", ":param iS:
	:type iS: int
	:param T:
	:type T: TopAbs_State
	:param SS:
	:type SS: TopOpeBRepBuild_ShapeSet
	:param a: default value is ""
	:type a: TCollection_AsciiString
	:param b: default value is ""
	:type b: TCollection_AsciiString
	:param c: default value is '\n'
	:type c: TCollection_AsciiString
	:rtype: None") GdumpSHASTA;
		void GdumpSHASTA (const Standard_Integer iS,const TopAbs_State T,const TopOpeBRepBuild_ShapeSet & SS,const TCollection_AsciiString & a = "",const TCollection_AsciiString & b = "",const TCollection_AsciiString & c = "\n");

		/****************** GdumpSOBU ******************/
		%feature("compactdefaultargs") GdumpSOBU;
		%feature("autodoc", ":param SB:
	:type SB: TopOpeBRepBuild_SolidBuilder
	:rtype: None") GdumpSOBU;
		void GdumpSOBU (TopOpeBRepBuild_SolidBuilder & SB);

		/****************** GtraceSPS ******************/
		%feature("compactdefaultargs") GtraceSPS;
		%feature("autodoc", ":param iS:
	:type iS: int
	:rtype: bool") GtraceSPS;
		Standard_Boolean GtraceSPS (const Standard_Integer iS);

		/****************** GtraceSPS ******************/
		%feature("compactdefaultargs") GtraceSPS;
		%feature("autodoc", ":param iS:
	:type iS: int
	:param jS:
	:type jS: int
	:rtype: bool") GtraceSPS;
		Standard_Boolean GtraceSPS (const Standard_Integer iS,const Standard_Integer jS);

		/****************** GtraceSPS ******************/
		%feature("compactdefaultargs") GtraceSPS;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: bool") GtraceSPS;
		Standard_Boolean GtraceSPS (const TopoDS_Shape & S);

		/****************** GtraceSPS ******************/
		%feature("compactdefaultargs") GtraceSPS;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param IS:
	:type IS: int
	:rtype: bool") GtraceSPS;
		Standard_Boolean GtraceSPS (const TopoDS_Shape & S,Standard_Integer &OutValue);

		/****************** InitSection ******************/
		%feature("compactdefaultargs") InitSection;
		%feature("autodoc", ":rtype: None") InitSection;
		void InitSection ();

		/****************** IsKPart ******************/
		%feature("compactdefaultargs") IsKPart;
		%feature("autodoc", ":rtype: int") IsKPart;
		Standard_Integer IsKPart ();

		/****************** IsMerged ******************/
		%feature("compactdefaultargs") IsMerged;
		%feature("autodoc", "* Returns True if the shape <S> has been merged.
	:param S:
	:type S: TopoDS_Shape
	:param TB:
	:type TB: TopAbs_State
	:rtype: bool") IsMerged;
		Standard_Boolean IsMerged (const TopoDS_Shape & S,const TopAbs_State TB);

		/****************** IsShapeOf ******************/
		%feature("compactdefaultargs") IsShapeOf;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param I12:
	:type I12: int
	:rtype: bool") IsShapeOf;
		Standard_Boolean IsShapeOf (const TopoDS_Shape & S,const Standard_Integer I12);

		/****************** IsSplit ******************/
		%feature("compactdefaultargs") IsSplit;
		%feature("autodoc", "* Returns True if the shape <S> has been split.
	:param S:
	:type S: TopoDS_Shape
	:param TB:
	:type TB: TopAbs_State
	:rtype: bool") IsSplit;
		Standard_Boolean IsSplit (const TopoDS_Shape & S,const TopAbs_State TB);

		/****************** KPClearMaps ******************/
		%feature("compactdefaultargs") KPClearMaps;
		%feature("autodoc", ":rtype: None") KPClearMaps;
		void KPClearMaps ();

		/****************** KPContains ******************/
		%feature("compactdefaultargs") KPContains;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: bool") KPContains;
		static Standard_Boolean KPContains (const TopoDS_Shape & S,const TopTools_ListOfShape & L);

		/****************** KPSameDomain ******************/
		%feature("compactdefaultargs") KPSameDomain;
		%feature("autodoc", ":param L1:
	:type L1: TopTools_ListOfShape
	:param L2:
	:type L2: TopTools_ListOfShape
	:rtype: None") KPSameDomain;
		void KPSameDomain (TopTools_ListOfShape & L1,TopTools_ListOfShape & L2);

		/****************** KPclasSS ******************/
		%feature("compactdefaultargs") KPclasSS;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param exceptLS1:
	:type exceptLS1: TopTools_ListOfShape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: TopAbs_State") KPclasSS;
		TopAbs_State KPclasSS (const TopoDS_Shape & S1,const TopTools_ListOfShape & exceptLS1,const TopoDS_Shape & S2);

		/****************** KPclasSS ******************/
		%feature("compactdefaultargs") KPclasSS;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param exceptS1:
	:type exceptS1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: TopAbs_State") KPclasSS;
		TopAbs_State KPclasSS (const TopoDS_Shape & S1,const TopoDS_Shape & exceptS1,const TopoDS_Shape & S2);

		/****************** KPclasSS ******************/
		%feature("compactdefaultargs") KPclasSS;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: TopAbs_State") KPclasSS;
		TopAbs_State KPclasSS (const TopoDS_Shape & S1,const TopoDS_Shape & S2);

		/****************** KPclassF ******************/
		%feature("compactdefaultargs") KPclassF;
		%feature("autodoc", ":param F1:
	:type F1: TopoDS_Shape
	:param F2:
	:type F2: TopoDS_Shape
	:rtype: TopAbs_State") KPclassF;
		TopAbs_State KPclassF (const TopoDS_Shape & F1,const TopoDS_Shape & F2);

		/****************** KPclassFF ******************/
		%feature("compactdefaultargs") KPclassFF;
		%feature("autodoc", ":param F1:
	:type F1: TopoDS_Shape
	:param F2:
	:type F2: TopoDS_Shape
	:param T1:
	:type T1: TopAbs_State
	:param T2:
	:type T2: TopAbs_State
	:rtype: None") KPclassFF;
		void KPclassFF (const TopoDS_Shape & F1,const TopoDS_Shape & F2,TopAbs_State & T1,TopAbs_State & T2);

		/****************** KPisdisj ******************/
		%feature("compactdefaultargs") KPisdisj;
		%feature("autodoc", ":rtype: int") KPisdisj;
		Standard_Integer KPisdisj ();

		/****************** KPisdisjanalyse ******************/
		%feature("compactdefaultargs") KPisdisjanalyse;
		%feature("autodoc", ":param ST1:
	:type ST1: TopAbs_State
	:param ST2:
	:type ST2: TopAbs_State
	:param I:
	:type I: int
	:param IC1:
	:type IC1: int
	:param IC2:
	:type IC2: int
	:rtype: None") KPisdisjanalyse;
		void KPisdisjanalyse (const TopAbs_State ST1,const TopAbs_State ST2,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** KPisdisjsh ******************/
		%feature("compactdefaultargs") KPisdisjsh;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: int") KPisdisjsh;
		Standard_Integer KPisdisjsh (const TopoDS_Shape & S);

		/****************** KPisfafa ******************/
		%feature("compactdefaultargs") KPisfafa;
		%feature("autodoc", ":rtype: int") KPisfafa;
		Standard_Integer KPisfafa ();

		/****************** KPisfafash ******************/
		%feature("compactdefaultargs") KPisfafash;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: int") KPisfafash;
		Standard_Integer KPisfafash (const TopoDS_Shape & S);

		/****************** KPiskole ******************/
		%feature("compactdefaultargs") KPiskole;
		%feature("autodoc", ":rtype: int") KPiskole;
		Standard_Integer KPiskole ();

		/****************** KPiskoleFF ******************/
		%feature("compactdefaultargs") KPiskoleFF;
		%feature("autodoc", ":param F1:
	:type F1: TopoDS_Shape
	:param F2:
	:type F2: TopoDS_Shape
	:param T1:
	:type T1: TopAbs_State
	:param T2:
	:type T2: TopAbs_State
	:rtype: bool") KPiskoleFF;
		Standard_Boolean KPiskoleFF (const TopoDS_Shape & F1,const TopoDS_Shape & F2,TopAbs_State & T1,TopAbs_State & T2);

		/****************** KPiskoleanalyse ******************/
		%feature("compactdefaultargs") KPiskoleanalyse;
		%feature("autodoc", ":param FT1:
	:type FT1: TopAbs_State
	:param FT2:
	:type FT2: TopAbs_State
	:param ST1:
	:type ST1: TopAbs_State
	:param ST2:
	:type ST2: TopAbs_State
	:param I:
	:type I: int
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:rtype: None") KPiskoleanalyse;
		void KPiskoleanalyse (const TopAbs_State FT1,const TopAbs_State FT2,const TopAbs_State ST1,const TopAbs_State ST2,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** KPiskolesh ******************/
		%feature("compactdefaultargs") KPiskolesh;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param LS:
	:type LS: TopTools_ListOfShape
	:param LF:
	:type LF: TopTools_ListOfShape
	:rtype: bool") KPiskolesh;
		Standard_Boolean KPiskolesh (const TopoDS_Shape & S,TopTools_ListOfShape & LS,TopTools_ListOfShape & LF);

		/****************** KPiskoletge ******************/
		%feature("compactdefaultargs") KPiskoletge;
		%feature("autodoc", ":rtype: int") KPiskoletge;
		Standard_Integer KPiskoletge ();

		/****************** KPiskoletgeanalyse ******************/
		%feature("compactdefaultargs") KPiskoletgeanalyse;
		%feature("autodoc", ":param Conf:
	:type Conf: TopOpeBRepDS_Config
	:param ST1:
	:type ST1: TopAbs_State
	:param ST2:
	:type ST2: TopAbs_State
	:param I:
	:type I: int
	:rtype: None") KPiskoletgeanalyse;
		void KPiskoletgeanalyse (const TopOpeBRepDS_Config Conf,const TopAbs_State ST1,const TopAbs_State ST2,Standard_Integer &OutValue);

		/****************** KPiskoletgesh ******************/
		%feature("compactdefaultargs") KPiskoletgesh;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param LS:
	:type LS: TopTools_ListOfShape
	:param LF:
	:type LF: TopTools_ListOfShape
	:rtype: bool") KPiskoletgesh;
		Standard_Boolean KPiskoletgesh (const TopoDS_Shape & S,TopTools_ListOfShape & LS,TopTools_ListOfShape & LF);

		/****************** KPissoso ******************/
		%feature("compactdefaultargs") KPissoso;
		%feature("autodoc", ":rtype: int") KPissoso;
		Standard_Integer KPissoso ();

		/****************** KPissososh ******************/
		%feature("compactdefaultargs") KPissososh;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: int") KPissososh;
		Standard_Integer KPissososh (const TopoDS_Shape & S);

		/****************** KPlhg ******************/
		%feature("compactdefaultargs") KPlhg;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param T:
	:type T: TopAbs_ShapeEnum
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: int") KPlhg;
		Standard_Integer KPlhg (const TopoDS_Shape & S,const TopAbs_ShapeEnum T,TopTools_ListOfShape & L);

		/****************** KPlhg ******************/
		%feature("compactdefaultargs") KPlhg;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param T:
	:type T: TopAbs_ShapeEnum
	:rtype: int") KPlhg;
		Standard_Integer KPlhg (const TopoDS_Shape & S,const TopAbs_ShapeEnum T);

		/****************** KPlhsd ******************/
		%feature("compactdefaultargs") KPlhsd;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param T:
	:type T: TopAbs_ShapeEnum
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: int") KPlhsd;
		Standard_Integer KPlhsd (const TopoDS_Shape & S,const TopAbs_ShapeEnum T,TopTools_ListOfShape & L);

		/****************** KPlhsd ******************/
		%feature("compactdefaultargs") KPlhsd;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param T:
	:type T: TopAbs_ShapeEnum
	:rtype: int") KPlhsd;
		Standard_Integer KPlhsd (const TopoDS_Shape & S,const TopAbs_ShapeEnum T);

		/****************** KPls ******************/
		%feature("compactdefaultargs") KPls;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param T:
	:type T: TopAbs_ShapeEnum
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: int") KPls;
		static Standard_Integer KPls (const TopoDS_Shape & S,const TopAbs_ShapeEnum T,TopTools_ListOfShape & L);

		/****************** KPls ******************/
		%feature("compactdefaultargs") KPls;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param T:
	:type T: TopAbs_ShapeEnum
	:rtype: int") KPls;
		static Standard_Integer KPls (const TopoDS_Shape & S,const TopAbs_ShapeEnum T);

		/****************** KPmakeface ******************/
		%feature("compactdefaultargs") KPmakeface;
		%feature("autodoc", ":param F1:
	:type F1: TopoDS_Shape
	:param LF2:
	:type LF2: TopTools_ListOfShape
	:param T1:
	:type T1: TopAbs_State
	:param T2:
	:type T2: TopAbs_State
	:param R1:
	:type R1: bool
	:param R2:
	:type R2: bool
	:rtype: TopoDS_Shape") KPmakeface;
		TopoDS_Shape KPmakeface (const TopoDS_Shape & F1,const TopTools_ListOfShape & LF2,const TopAbs_State T1,const TopAbs_State T2,const Standard_Boolean R1,const Standard_Boolean R2);

		/****************** KPreturn ******************/
		%feature("compactdefaultargs") KPreturn;
		%feature("autodoc", ":param KP:
	:type KP: int
	:rtype: int") KPreturn;
		static Standard_Integer KPreturn (const Standard_Integer KP);

		/****************** KeepShape ******************/
		%feature("compactdefaultargs") KeepShape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param LS:
	:type LS: TopTools_ListOfShape
	:param T:
	:type T: TopAbs_State
	:rtype: bool") KeepShape;
		Standard_Boolean KeepShape (const TopoDS_Shape & S,const TopTools_ListOfShape & LS,const TopAbs_State T);

		/****************** MSplit ******************/
		%feature("compactdefaultargs") MSplit;
		%feature("autodoc", ":param s:
	:type s: TopAbs_State
	:rtype: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State") MSplit;
		const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MSplit (const TopAbs_State s);

		/****************** MakeEdges ******************/
		%feature("compactdefaultargs") MakeEdges;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param B:
	:type B: TopOpeBRepBuild_EdgeBuilder
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: None") MakeEdges;
		void MakeEdges (const TopoDS_Shape & E,TopOpeBRepBuild_EdgeBuilder & B,TopTools_ListOfShape & L);

		/****************** MakeFaces ******************/
		%feature("compactdefaultargs") MakeFaces;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Shape
	:param B:
	:type B: TopOpeBRepBuild_FaceBuilder
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: None") MakeFaces;
		void MakeFaces (const TopoDS_Shape & F,TopOpeBRepBuild_FaceBuilder & B,TopTools_ListOfShape & L);

		/****************** MakeShells ******************/
		%feature("compactdefaultargs") MakeShells;
		%feature("autodoc", ":param B:
	:type B: TopOpeBRepBuild_SolidBuilder
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: None") MakeShells;
		void MakeShells (TopOpeBRepBuild_SolidBuilder & B,TopTools_ListOfShape & L);

		/****************** MakeSolids ******************/
		%feature("compactdefaultargs") MakeSolids;
		%feature("autodoc", ":param B:
	:type B: TopOpeBRepBuild_SolidBuilder
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: None") MakeSolids;
		void MakeSolids (TopOpeBRepBuild_SolidBuilder & B,TopTools_ListOfShape & L);

		/****************** MapShapes ******************/
		%feature("compactdefaultargs") MapShapes;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: None") MapShapes;
		void MapShapes (const TopoDS_Shape & S1,const TopoDS_Shape & S2);

		/****************** MergeEdges ******************/
		%feature("compactdefaultargs") MergeEdges;
		%feature("autodoc", "* Merges the two edges <S1> and <S2> keeping the parts in each edge of states <TB1> and <TB2>. Booleans onA, onB, onAB indicate wheter parts of edges found as state ON respectively on first, second, and both shapes must be (or not) built.
	:param L1:
	:type L1: TopTools_ListOfShape
	:param TB1:
	:type TB1: TopAbs_State
	:param L2:
	:type L2: TopTools_ListOfShape
	:param TB2:
	:type TB2: TopAbs_State
	:param onA: default value is Standard_False
	:type onA: bool
	:param onB: default value is Standard_False
	:type onB: bool
	:param onAB: default value is Standard_False
	:type onAB: bool
	:rtype: None") MergeEdges;
		void MergeEdges (const TopTools_ListOfShape & L1,const TopAbs_State TB1,const TopTools_ListOfShape & L2,const TopAbs_State TB2,const Standard_Boolean onA = Standard_False,const Standard_Boolean onB = Standard_False,const Standard_Boolean onAB = Standard_False);

		/****************** MergeFaces ******************/
		%feature("compactdefaultargs") MergeFaces;
		%feature("autodoc", "* Merges the two faces <S1> and <S2> keeping the parts in each face of states <TB1> and <TB2>.
	:param S1:
	:type S1: TopTools_ListOfShape
	:param TB1:
	:type TB1: TopAbs_State
	:param S2:
	:type S2: TopTools_ListOfShape
	:param TB2:
	:type TB2: TopAbs_State
	:param onA: default value is Standard_False
	:type onA: bool
	:param onB: default value is Standard_False
	:type onB: bool
	:param onAB: default value is Standard_False
	:type onAB: bool
	:rtype: None") MergeFaces;
		void MergeFaces (const TopTools_ListOfShape & S1,const TopAbs_State TB1,const TopTools_ListOfShape & S2,const TopAbs_State TB2,const Standard_Boolean onA = Standard_False,const Standard_Boolean onB = Standard_False,const Standard_Boolean onAB = Standard_False);

		/****************** MergeKPart ******************/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", ":rtype: void") MergeKPart;
		virtual void MergeKPart ();

		/****************** MergeKPart ******************/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", ":param TB1:
	:type TB1: TopAbs_State
	:param TB2:
	:type TB2: TopAbs_State
	:rtype: void") MergeKPart;
		virtual void MergeKPart (const TopAbs_State TB1,const TopAbs_State TB2);

		/****************** MergeKPartisdisj ******************/
		%feature("compactdefaultargs") MergeKPartisdisj;
		%feature("autodoc", ":rtype: None") MergeKPartisdisj;
		void MergeKPartisdisj ();

		/****************** MergeKPartisfafa ******************/
		%feature("compactdefaultargs") MergeKPartisfafa;
		%feature("autodoc", ":rtype: None") MergeKPartisfafa;
		void MergeKPartisfafa ();

		/****************** MergeKPartiskole ******************/
		%feature("compactdefaultargs") MergeKPartiskole;
		%feature("autodoc", ":rtype: None") MergeKPartiskole;
		void MergeKPartiskole ();

		/****************** MergeKPartiskoletge ******************/
		%feature("compactdefaultargs") MergeKPartiskoletge;
		%feature("autodoc", ":rtype: None") MergeKPartiskoletge;
		void MergeKPartiskoletge ();

		/****************** MergeKPartissoso ******************/
		%feature("compactdefaultargs") MergeKPartissoso;
		%feature("autodoc", ":rtype: None") MergeKPartissoso;
		void MergeKPartissoso ();

		/****************** MergeShapes ******************/
		%feature("compactdefaultargs") MergeShapes;
		%feature("autodoc", "* Merges the two shapes <S1> and <S2> keeping the parts of states <TB1>,<TB2> in <S1>,<S2>.
	:param S1:
	:type S1: TopoDS_Shape
	:param TB1:
	:type TB1: TopAbs_State
	:param S2:
	:type S2: TopoDS_Shape
	:param TB2:
	:type TB2: TopAbs_State
	:rtype: None") MergeShapes;
		void MergeShapes (const TopoDS_Shape & S1,const TopAbs_State TB1,const TopoDS_Shape & S2,const TopAbs_State TB2);

		/****************** MergeSolid ******************/
		%feature("compactdefaultargs") MergeSolid;
		%feature("autodoc", "* Merges the solid <S> keeping the parts of state <TB>.
	:param S:
	:type S: TopoDS_Shape
	:param TB:
	:type TB: TopAbs_State
	:rtype: None") MergeSolid;
		void MergeSolid (const TopoDS_Shape & S,const TopAbs_State TB);

		/****************** MergeSolids ******************/
		%feature("compactdefaultargs") MergeSolids;
		%feature("autodoc", "* Merges the two solids <S1> and <S2> keeping the parts in each solid of states <TB1> and <TB2>.
	:param S1:
	:type S1: TopoDS_Shape
	:param TB1:
	:type TB1: TopAbs_State
	:param S2:
	:type S2: TopoDS_Shape
	:param TB2:
	:type TB2: TopAbs_State
	:rtype: None") MergeSolids;
		void MergeSolids (const TopoDS_Shape & S1,const TopAbs_State TB1,const TopoDS_Shape & S2,const TopAbs_State TB2);

		/****************** Merged ******************/
		%feature("compactdefaultargs") Merged;
		%feature("autodoc", "* Returns the merged parts <TB> of shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:param TB:
	:type TB: TopAbs_State
	:rtype: TopTools_ListOfShape") Merged;
		const TopTools_ListOfShape & Merged (const TopoDS_Shape & S,const TopAbs_State TB);

		/****************** NewEdges ******************/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "* Returns the edges created on curve <I>.
	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape") NewEdges;
		const TopTools_ListOfShape & NewEdges (const Standard_Integer I);

		/****************** NewFaces ******************/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "* Returns the faces created on surface <I>.
	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape") NewFaces;
		const TopTools_ListOfShape & NewFaces (const Standard_Integer I);

		/****************** NewVertex ******************/
		%feature("compactdefaultargs") NewVertex;
		%feature("autodoc", "* Returns the vertex created on point <I>.
	:param I:
	:type I: int
	:rtype: TopoDS_Shape") NewVertex;
		const TopoDS_Shape  NewVertex (const Standard_Integer I);

		/****************** Opec12 ******************/
		%feature("compactdefaultargs") Opec12;
		%feature("autodoc", ":rtype: bool") Opec12;
		Standard_Boolean Opec12 ();

		/****************** Opec21 ******************/
		%feature("compactdefaultargs") Opec21;
		%feature("autodoc", ":rtype: bool") Opec21;
		Standard_Boolean Opec21 ();

		/****************** Opecom ******************/
		%feature("compactdefaultargs") Opecom;
		%feature("autodoc", ":rtype: bool") Opecom;
		Standard_Boolean Opecom ();

		/****************** Opefus ******************/
		%feature("compactdefaultargs") Opefus;
		%feature("autodoc", ":rtype: bool") Opefus;
		Standard_Boolean Opefus ();

		/****************** Orient ******************/
		%feature("compactdefaultargs") Orient;
		%feature("autodoc", ":param O:
	:type O: TopAbs_Orientation
	:param R:
	:type R: bool
	:rtype: TopAbs_Orientation") Orient;
		static TopAbs_Orientation Orient (const TopAbs_Orientation O,const Standard_Boolean R);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Stores the data structure <HDS>, Create shapes from the new geometries.
	:param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:rtype: void") Perform;
		virtual void Perform (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Stores the data structure <HDS>, Create shapes from the new geometries, Evaluates if an operation performed on shapes S1,S2 is a particular case.
	:param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: void") Perform;
		virtual void Perform (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS,const TopoDS_Shape & S1,const TopoDS_Shape & S2);

		/****************** PrintCur ******************/
		%feature("compactdefaultargs") PrintCur;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:rtype: void") PrintCur;
		static void PrintCur (const TopoDS_Edge & E);

		/****************** PrintGeo ******************/
		%feature("compactdefaultargs") PrintGeo;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: void") PrintGeo;
		static void PrintGeo (const TopoDS_Shape & S);

		/****************** PrintOri ******************/
		%feature("compactdefaultargs") PrintOri;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: void") PrintOri;
		static void PrintOri (const TopoDS_Shape & S);

		/****************** PrintPnt ******************/
		%feature("compactdefaultargs") PrintPnt;
		%feature("autodoc", ":param V:
	:type V: TopoDS_Vertex
	:rtype: void") PrintPnt;
		static void PrintPnt (const TopoDS_Vertex & V);

		/****************** PrintSur ******************/
		%feature("compactdefaultargs") PrintSur;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:rtype: void") PrintSur;
		static void PrintSur (const TopoDS_Face & F);

		/****************** RegularizeFace ******************/
		%feature("compactdefaultargs") RegularizeFace;
		%feature("autodoc", ":param FF:
	:type FF: TopoDS_Shape
	:param newFace:
	:type newFace: TopoDS_Shape
	:param LOF:
	:type LOF: TopTools_ListOfShape
	:rtype: None") RegularizeFace;
		void RegularizeFace (const TopoDS_Shape & FF,const TopoDS_Shape & newFace,TopTools_ListOfShape & LOF);

		/****************** RegularizeFaces ******************/
		%feature("compactdefaultargs") RegularizeFaces;
		%feature("autodoc", ":param FF:
	:type FF: TopoDS_Shape
	:param lnewFace:
	:type lnewFace: TopTools_ListOfShape
	:param LOF:
	:type LOF: TopTools_ListOfShape
	:rtype: None") RegularizeFaces;
		void RegularizeFaces (const TopoDS_Shape & FF,const TopTools_ListOfShape & lnewFace,TopTools_ListOfShape & LOF);

		/****************** RegularizeSolid ******************/
		%feature("compactdefaultargs") RegularizeSolid;
		%feature("autodoc", ":param SS:
	:type SS: TopoDS_Shape
	:param newSolid:
	:type newSolid: TopoDS_Shape
	:param LOS:
	:type LOS: TopTools_ListOfShape
	:rtype: None") RegularizeSolid;
		void RegularizeSolid (const TopoDS_Shape & SS,const TopoDS_Shape & newSolid,TopTools_ListOfShape & LOS);

		/****************** RegularizeSolids ******************/
		%feature("compactdefaultargs") RegularizeSolids;
		%feature("autodoc", ":param SS:
	:type SS: TopoDS_Shape
	:param lnewSolid:
	:type lnewSolid: TopTools_ListOfShape
	:param LOS:
	:type LOS: TopTools_ListOfShape
	:rtype: None") RegularizeSolids;
		void RegularizeSolids (const TopoDS_Shape & SS,const TopTools_ListOfShape & lnewSolid,TopTools_ListOfShape & LOS);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", ":param T1:
	:type T1: TopAbs_State
	:param T2:
	:type T2: TopAbs_State
	:rtype: bool") Reverse;
		static Standard_Boolean Reverse (const TopAbs_State T1,const TopAbs_State T2);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "* return all section edges.
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: None") Section;
		void Section (TopTools_ListOfShape & L);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") Section;
		const TopTools_ListOfShape & Section ();

		/****************** SectionCurves ******************/
		%feature("compactdefaultargs") SectionCurves;
		%feature("autodoc", "* return the section edges built on new curves.
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: None") SectionCurves;
		void SectionCurves (TopTools_ListOfShape & L);

		/****************** SectionEdges ******************/
		%feature("compactdefaultargs") SectionEdges;
		%feature("autodoc", "* return the parts of edges found ON the boundary of the two arguments S1,S2 of Perform()
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: None") SectionEdges;
		void SectionEdges (TopTools_ListOfShape & L);

		/****************** ShapePosition ******************/
		%feature("compactdefaultargs") ShapePosition;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param LS:
	:type LS: TopTools_ListOfShape
	:rtype: TopAbs_State") ShapePosition;
		TopAbs_State ShapePosition (const TopoDS_Shape & S,const TopTools_ListOfShape & LS);

		/****************** ShapeRank ******************/
		%feature("compactdefaultargs") ShapeRank;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: int") ShapeRank;
		Standard_Integer ShapeRank (const TopoDS_Shape & S);

		/****************** SplitEvisoONperiodicF ******************/
		%feature("compactdefaultargs") SplitEvisoONperiodicF;
		%feature("autodoc", ":rtype: None") SplitEvisoONperiodicF;
		void SplitEvisoONperiodicF ();

		/****************** SplitSectionEdge ******************/
		%feature("compactdefaultargs") SplitSectionEdge;
		%feature("autodoc", "* create parts ON solid of section edges
	:param E:
	:type E: TopoDS_Shape
	:rtype: void") SplitSectionEdge;
		virtual void SplitSectionEdge (const TopoDS_Shape & E);

		/****************** SplitSectionEdges ******************/
		%feature("compactdefaultargs") SplitSectionEdges;
		%feature("autodoc", "* create parts ON solid of section edges
	:rtype: None") SplitSectionEdges;
		void SplitSectionEdges ();

		/****************** Splits ******************/
		%feature("compactdefaultargs") Splits;
		%feature("autodoc", "* Returns the split parts <TB> of shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:param TB:
	:type TB: TopAbs_State
	:rtype: TopTools_ListOfShape") Splits;
		const TopTools_ListOfShape & Splits (const TopoDS_Shape & S,const TopAbs_State TB);

		/****************** StringState ******************/
		%feature("compactdefaultargs") StringState;
		%feature("autodoc", ":param S:
	:type S: TopAbs_State
	:rtype: TCollection_AsciiString") StringState;
		static TCollection_AsciiString StringState (const TopAbs_State S);

		/****************** TopOpeBRepBuild_Builder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_Builder;
		%feature("autodoc", ":param BT:
	:type BT: TopOpeBRepDS_BuildTool
	:rtype: None") TopOpeBRepBuild_Builder;
		 TopOpeBRepBuild_Builder (const TopOpeBRepDS_BuildTool & BT);

		/****************** TopType ******************/
		%feature("compactdefaultargs") TopType;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopAbs_ShapeEnum") TopType;
		static TopAbs_ShapeEnum TopType (const TopoDS_Shape & S);

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
		/****************** GFillONCheckI ******************/
		%feature("compactdefaultargs") GFillONCheckI;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: bool") GFillONCheckI;
		Standard_Boolean GFillONCheckI (const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** GFillONParts2dWES2 ******************/
		%feature("compactdefaultargs") GFillONParts2dWES2;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:param EspON:
	:type EspON: TopoDS_Shape
	:rtype: None") GFillONParts2dWES2;
		void GFillONParts2dWES2 (const opencascade::handle<TopOpeBRepDS_Interference> & I,const TopoDS_Shape & EspON);

		/****************** GFillONPartsWES1 ******************/
		%feature("compactdefaultargs") GFillONPartsWES1;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:rtype: None") GFillONPartsWES1;
		void GFillONPartsWES1 (const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** GFillONPartsWES2 ******************/
		%feature("compactdefaultargs") GFillONPartsWES2;
		%feature("autodoc", ":param I:
	:type I: TopOpeBRepDS_Interference
	:param EspON:
	:type EspON: TopoDS_Shape
	:rtype: None") GFillONPartsWES2;
		void GFillONPartsWES2 (const opencascade::handle<TopOpeBRepDS_Interference> & I,const TopoDS_Shape & EspON);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param PB:
	:type PB: TopOpeBRepBuild_PBuilder
	:param F:
	:type F: TopoDS_Shape
	:param PG:
	:type PG: TopOpeBRepBuild_PGTopo
	:param PLSclass:
	:type PLSclass: TopOpeBRepTool_Plos
	:param PWES:
	:type PWES: TopOpeBRepBuild_PWireEdgeSet
	:rtype: None") Perform;
		void Perform (const TopOpeBRepBuild_PBuilder & PB,const TopoDS_Shape & F,const TopOpeBRepBuild_PGTopo & PG,const TopOpeBRepTool_Plos & PLSclass,const TopOpeBRepBuild_PWireEdgeSet & PWES);

		/****************** Perform2d ******************/
		%feature("compactdefaultargs") Perform2d;
		%feature("autodoc", ":param PB:
	:type PB: TopOpeBRepBuild_PBuilder
	:param F:
	:type F: TopoDS_Shape
	:param PG:
	:type PG: TopOpeBRepBuild_PGTopo
	:param PLSclass:
	:type PLSclass: TopOpeBRepTool_Plos
	:param PWES:
	:type PWES: TopOpeBRepBuild_PWireEdgeSet
	:rtype: None") Perform2d;
		void Perform2d (const TopOpeBRepBuild_PBuilder & PB,const TopoDS_Shape & F,const TopOpeBRepBuild_PGTopo & PG,const TopOpeBRepTool_Plos & PLSclass,const TopOpeBRepBuild_PWireEdgeSet & PWES);

		/****************** TopOpeBRepBuild_BuilderON ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_BuilderON;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_BuilderON;
		 TopOpeBRepBuild_BuilderON ();

		/****************** TopOpeBRepBuild_BuilderON ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_BuilderON;
		%feature("autodoc", ":param PB:
	:type PB: TopOpeBRepBuild_PBuilder
	:param F:
	:type F: TopoDS_Shape
	:param PG:
	:type PG: TopOpeBRepBuild_PGTopo
	:param PLSclass:
	:type PLSclass: TopOpeBRepTool_Plos
	:param PWES:
	:type PWES: TopOpeBRepBuild_PWireEdgeSet
	:rtype: None") TopOpeBRepBuild_BuilderON;
		 TopOpeBRepBuild_BuilderON (const TopOpeBRepBuild_PBuilder & PB,const TopoDS_Shape & F,const TopOpeBRepBuild_PGTopo & PG,const TopOpeBRepTool_Plos & PLSclass,const TopOpeBRepBuild_PWireEdgeSet & PWES);

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
		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", ":param aFace:
	:type aFace: TopoDS_Face
	:param aHeadList:
	:type aHeadList: TopTools_ListOfShape
	:rtype: void") CheckList;
		static void CheckList (const TopoDS_Face & aFace,TopTools_ListOfShape & aHeadList);

		/****************** CorrectedFace ******************/
		%feature("compactdefaultargs") CorrectedFace;
		%feature("autodoc", ":rtype: TopoDS_Face") CorrectedFace;
		const TopoDS_Face  CorrectedFace ();

		/****************** ErrorStatus ******************/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", ":rtype: int") ErrorStatus;
		Standard_Integer ErrorStatus ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", ":rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face ();

		/****************** GetP2dFL ******************/
		%feature("compactdefaultargs") GetP2dFL;
		%feature("autodoc", ":param aFace:
	:type aFace: TopoDS_Face
	:param anEdge:
	:type anEdge: TopoDS_Edge
	:param P2dF:
	:type P2dF: gp_Pnt2d
	:param P2dL:
	:type P2dL: gp_Pnt2d
	:rtype: void") GetP2dFL;
		static void GetP2dFL (const TopoDS_Face & aFace,const TopoDS_Edge & anEdge,gp_Pnt2d & P2dF,gp_Pnt2d & P2dL);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** MapOfTrans2dInfo ******************/
		%feature("compactdefaultargs") MapOfTrans2dInfo;
		%feature("autodoc", ":rtype: TopTools_IndexedDataMapOfShapeShape") MapOfTrans2dInfo;
		TopTools_IndexedDataMapOfShapeShape & MapOfTrans2dInfo ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":rtype: None") Perform;
		void Perform ();

		/****************** SetMapOfTrans2dInfo ******************/
		%feature("compactdefaultargs") SetMapOfTrans2dInfo;
		%feature("autodoc", ":param aMap:
	:type aMap: TopTools_IndexedDataMapOfShapeShape
	:rtype: None") SetMapOfTrans2dInfo;
		void SetMapOfTrans2dInfo (TopTools_IndexedDataMapOfShapeShape & aMap);

		/****************** TopOpeBRepBuild_CorrectFace2d ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_CorrectFace2d;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_CorrectFace2d;
		 TopOpeBRepBuild_CorrectFace2d ();

		/****************** TopOpeBRepBuild_CorrectFace2d ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_CorrectFace2d;
		%feature("autodoc", ":param aFace:
	:type aFace: TopoDS_Face
	:param anAvoidMap:
	:type anAvoidMap: TopTools_IndexedMapOfOrientedShape
	:param aMap:
	:type aMap: TopTools_IndexedDataMapOfShapeShape
	:rtype: None") TopOpeBRepBuild_CorrectFace2d;
		 TopOpeBRepBuild_CorrectFace2d (const TopoDS_Face & aFace,const TopTools_IndexedMapOfOrientedShape & anAvoidMap,TopTools_IndexedDataMapOfShapeShape & aMap);

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
		/****************** AddEdgeWire ******************/
		%feature("compactdefaultargs") AddEdgeWire;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param W:
	:type W: TopoDS_Shape
	:rtype: int") AddEdgeWire;
		Standard_Integer AddEdgeWire (const TopoDS_Shape & E,TopoDS_Shape & W);

		/****************** CorrectGclosedWire ******************/
		%feature("compactdefaultargs") CorrectGclosedWire;
		%feature("autodoc", "* Using the given maps, change the topology of the 3d-closed wires, in order to get closed wires.
	:param mapVVref:
	:type mapVVref: TopTools_IndexedDataMapOfShapeShape
	:param mapVon1Edge:
	:type mapVon1Edge: TopTools_IndexedDataMapOfShapeShape
	:rtype: None") CorrectGclosedWire;
		void CorrectGclosedWire (const TopTools_IndexedDataMapOfShapeShape & mapVVref,const TopTools_IndexedDataMapOfShapeShape & mapVon1Edge);

		/****************** DetectPseudoInternalEdge ******************/
		%feature("compactdefaultargs") DetectPseudoInternalEdge;
		%feature("autodoc", "* Removes edges appearing twice (FORWARD,REVERSED) with a bounding vertex not connected to any other edge. mapE contains edges found. modifies myBlockBuilder.
	:param mapE:
	:type mapE: TopTools_IndexedMapOfShape
	:rtype: None") DetectPseudoInternalEdge;
		void DetectPseudoInternalEdge (TopTools_IndexedMapOfShape & mapE);

		/****************** DetectUnclosedWire ******************/
		%feature("compactdefaultargs") DetectUnclosedWire;
		%feature("autodoc", "* Removes are non 3d-closed wires. Fills up maps <mapVVsameG> and <mapVon1Edge>, in order to correct 3d-closed but unclosed (topologic connexity) wires. modifies myBlockBuilder
	:param mapVVsameG:
	:type mapVVsameG: TopTools_IndexedDataMapOfShapeShape
	:param mapVon1Edge:
	:type mapVon1Edge: TopTools_IndexedDataMapOfShapeShape
	:rtype: None") DetectUnclosedWire;
		void DetectUnclosedWire (TopTools_IndexedDataMapOfShapeShape & mapVVsameG,TopTools_IndexedDataMapOfShapeShape & mapVon1Edge);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "* Returns current new edge of current new wire.
	:rtype: TopoDS_Shape") Edge;
		const TopoDS_Shape  Edge ();

		/****************** EdgeConnexity ******************/
		%feature("compactdefaultargs") EdgeConnexity;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:rtype: int") EdgeConnexity;
		Standard_Integer EdgeConnexity (const TopoDS_Shape & E);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* return myFace
	:rtype: TopoDS_Shape") Face;
		const TopoDS_Shape  Face ();

		/****************** FindNextValidElement ******************/
		%feature("compactdefaultargs") FindNextValidElement;
		%feature("autodoc", "* Iterates on myBlockIterator until finding a valid element
	:rtype: None") FindNextValidElement;
		void FindNextValidElement ();

		/****************** InitEdge ******************/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", ":rtype: int") InitEdge;
		Standard_Integer InitEdge ();

		/****************** InitFace ******************/
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", ":rtype: int") InitFace;
		Standard_Integer InitFace ();

		/****************** InitFaceBuilder ******************/
		%feature("compactdefaultargs") InitFaceBuilder;
		%feature("autodoc", ":param ES:
	:type ES: TopOpeBRepBuild_WireEdgeSet
	:param F:
	:type F: TopoDS_Shape
	:param ForceClass:
	:type ForceClass: bool
	:rtype: None") InitFaceBuilder;
		void InitFaceBuilder (TopOpeBRepBuild_WireEdgeSet & ES,const TopoDS_Shape & F,const Standard_Boolean ForceClass);

		/****************** InitWire ******************/
		%feature("compactdefaultargs") InitWire;
		%feature("autodoc", ":rtype: int") InitWire;
		Standard_Integer InitWire ();

		/****************** IsOldWire ******************/
		%feature("compactdefaultargs") IsOldWire;
		%feature("autodoc", ":rtype: bool") IsOldWire;
		Standard_Boolean IsOldWire ();

		/****************** MoreEdge ******************/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", ":rtype: bool") MoreEdge;
		Standard_Boolean MoreEdge ();

		/****************** MoreFace ******************/
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", ":rtype: bool") MoreFace;
		Standard_Boolean MoreFace ();

		/****************** MoreWire ******************/
		%feature("compactdefaultargs") MoreWire;
		%feature("autodoc", ":rtype: bool") MoreWire;
		Standard_Boolean MoreWire ();

		/****************** NextEdge ******************/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", ":rtype: None") NextEdge;
		void NextEdge ();

		/****************** NextFace ******************/
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", ":rtype: None") NextFace;
		void NextFace ();

		/****************** NextWire ******************/
		%feature("compactdefaultargs") NextWire;
		%feature("autodoc", ":rtype: None") NextWire;
		void NextWire ();

		/****************** OldWire ******************/
		%feature("compactdefaultargs") OldWire;
		%feature("autodoc", "* Returns current wire This wire may be : * an old wire OldWire(), which has not been reconstructed; * a new wire made of edges described by ...NewEdge() methods.
	:rtype: TopoDS_Shape") OldWire;
		const TopoDS_Shape  OldWire ();

		/****************** TopOpeBRepBuild_FaceBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceBuilder;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_FaceBuilder;
		 TopOpeBRepBuild_FaceBuilder ();

		/****************** TopOpeBRepBuild_FaceBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceBuilder;
		%feature("autodoc", "* Create a FaceBuilder to build the faces on the shapes (wires, blocks of edge) described by <LS>.
	:param ES:
	:type ES: TopOpeBRepBuild_WireEdgeSet
	:param F:
	:type F: TopoDS_Shape
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None") TopOpeBRepBuild_FaceBuilder;
		 TopOpeBRepBuild_FaceBuilder (TopOpeBRepBuild_WireEdgeSet & ES,const TopoDS_Shape & F,const Standard_Boolean ForceClass = Standard_False);

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
		/****************** ClearEdge ******************/
		%feature("compactdefaultargs") ClearEdge;
		%feature("autodoc", ":rtype: None") ClearEdge;
		void ClearEdge ();

		/****************** ClearVertex ******************/
		%feature("compactdefaultargs") ClearVertex;
		%feature("autodoc", ":rtype: None") ClearVertex;
		void ClearVertex ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param LIF:
	:type LIF: TopTools_ListOfShape
	:param LRF:
	:type LRF: TopTools_ListOfShape
	:param CXM:
	:type CXM: int
	:rtype: None") Init;
		void Init (const TopTools_ListOfShape & LIF,const TopTools_ListOfShape & LRF,const Standard_Integer CXM);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsModified ******************/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", ":rtype: bool") IsModified;
		Standard_Boolean IsModified ();

		/****************** LExternEdge ******************/
		%feature("compactdefaultargs") LExternEdge;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") LExternEdge;
		const TopTools_ListOfShape & LExternEdge ();

		/****************** LExternVertex ******************/
		%feature("compactdefaultargs") LExternVertex;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") LExternVertex;
		const TopTools_ListOfShape & LExternVertex ();

		/****************** LFuseFace ******************/
		%feature("compactdefaultargs") LFuseFace;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") LFuseFace;
		const TopTools_ListOfShape & LFuseFace ();

		/****************** LInternEdge ******************/
		%feature("compactdefaultargs") LInternEdge;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") LInternEdge;
		const TopTools_ListOfShape & LInternEdge ();

		/****************** LInternVertex ******************/
		%feature("compactdefaultargs") LInternVertex;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") LInternVertex;
		const TopTools_ListOfShape & LInternVertex ();

		/****************** LModifEdge ******************/
		%feature("compactdefaultargs") LModifEdge;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") LModifEdge;
		const TopTools_ListOfShape & LModifEdge ();

		/****************** LModifVertex ******************/
		%feature("compactdefaultargs") LModifVertex;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") LModifVertex;
		const TopTools_ListOfShape & LModifVertex ();

		/****************** PerformEdge ******************/
		%feature("compactdefaultargs") PerformEdge;
		%feature("autodoc", ":rtype: None") PerformEdge;
		void PerformEdge ();

		/****************** PerformFace ******************/
		%feature("compactdefaultargs") PerformFace;
		%feature("autodoc", ":rtype: None") PerformFace;
		void PerformFace ();

		/****************** TopOpeBRepBuild_FuseFace ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_FuseFace;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_FuseFace;
		 TopOpeBRepBuild_FuseFace ();

		/****************** TopOpeBRepBuild_FuseFace ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_FuseFace;
		%feature("autodoc", ":param LIF:
	:type LIF: TopTools_ListOfShape
	:param LRF:
	:type LRF: TopTools_ListOfShape
	:param CXM:
	:type CXM: int
	:rtype: None") TopOpeBRepBuild_FuseFace;
		 TopOpeBRepBuild_FuseFace (const TopTools_ListOfShape & LIF,const TopTools_ListOfShape & LRF,const Standard_Integer CXM);

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
		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", ":param s1:
	:type s1: TopAbs_State
	:param s2:
	:type s2: TopAbs_State
	:rtype: None") Current;
		void Current (TopAbs_State & s1,TopAbs_State & s2);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":rtype: None") Init;
		void Init ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param G:
	:type G: TopOpeBRepBuild_GTopo
	:rtype: None") Init;
		void Init (const TopOpeBRepBuild_GTopo & G);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: None") Next;
		void Next ();

		/****************** TopOpeBRepBuild_GIter ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_GIter;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_GIter;
		 TopOpeBRepBuild_GIter ();

		/****************** TopOpeBRepBuild_GIter ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_GIter;
		%feature("autodoc", ":param G:
	:type G: TopOpeBRepBuild_GTopo
	:rtype: None") TopOpeBRepBuild_GIter;
		 TopOpeBRepBuild_GIter (const TopOpeBRepBuild_GTopo & G);

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
		%feature("autodoc", ":param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo") GComDiff;
		static TopOpeBRepBuild_GTopo GComDiff (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);

		/****************** GComSame ******************/
		%feature("compactdefaultargs") GComSame;
		%feature("autodoc", ":param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo") GComSame;
		static TopOpeBRepBuild_GTopo GComSame (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);

		/****************** GComUnsh ******************/
		%feature("compactdefaultargs") GComUnsh;
		%feature("autodoc", ":param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo") GComUnsh;
		static TopOpeBRepBuild_GTopo GComUnsh (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);

		/****************** GCutDiff ******************/
		%feature("compactdefaultargs") GCutDiff;
		%feature("autodoc", ":param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo") GCutDiff;
		static TopOpeBRepBuild_GTopo GCutDiff (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);

		/****************** GCutSame ******************/
		%feature("compactdefaultargs") GCutSame;
		%feature("autodoc", ":param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo") GCutSame;
		static TopOpeBRepBuild_GTopo GCutSame (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);

		/****************** GCutUnsh ******************/
		%feature("compactdefaultargs") GCutUnsh;
		%feature("autodoc", ":param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo") GCutUnsh;
		static TopOpeBRepBuild_GTopo GCutUnsh (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);

		/****************** GFusDiff ******************/
		%feature("compactdefaultargs") GFusDiff;
		%feature("autodoc", ":param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo") GFusDiff;
		static TopOpeBRepBuild_GTopo GFusDiff (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);

		/****************** GFusSame ******************/
		%feature("compactdefaultargs") GFusSame;
		%feature("autodoc", ":param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo") GFusSame;
		static TopOpeBRepBuild_GTopo GFusSame (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);

		/****************** GFusUnsh ******************/
		%feature("compactdefaultargs") GFusUnsh;
		%feature("autodoc", ":param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo") GFusUnsh;
		static TopOpeBRepBuild_GTopo GFusUnsh (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);

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
		/****************** ChangeConfig ******************/
		%feature("compactdefaultargs") ChangeConfig;
		%feature("autodoc", ":param C1:
	:type C1: TopOpeBRepDS_Config
	:param C2:
	:type C2: TopOpeBRepDS_Config
	:rtype: None") ChangeConfig;
		void ChangeConfig (const TopOpeBRepDS_Config C1,const TopOpeBRepDS_Config C2);

		/****************** ChangeType ******************/
		%feature("compactdefaultargs") ChangeType;
		%feature("autodoc", ":param t1:
	:type t1: TopAbs_ShapeEnum
	:param t2:
	:type t2: TopAbs_ShapeEnum
	:rtype: None") ChangeType;
		void ChangeType (const TopAbs_ShapeEnum t1,const TopAbs_ShapeEnum t2);

		/****************** ChangeValue ******************/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", ":param i1:
	:type i1: int
	:param i2:
	:type i2: int
	:param b:
	:type b: bool
	:rtype: None") ChangeValue;
		void ChangeValue (const Standard_Integer i1,const Standard_Integer i2,const Standard_Boolean b);

		/****************** ChangeValue ******************/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", ":param s1:
	:type s1: TopAbs_State
	:param s2:
	:type s2: TopAbs_State
	:param b:
	:type b: bool
	:rtype: None") ChangeValue;
		void ChangeValue (const TopAbs_State s1,const TopAbs_State s2,const Standard_Boolean b);

		/****************** Config1 ******************/
		%feature("compactdefaultargs") Config1;
		%feature("autodoc", ":rtype: TopOpeBRepDS_Config") Config1;
		TopOpeBRepDS_Config Config1 ();

		/****************** Config2 ******************/
		%feature("compactdefaultargs") Config2;
		%feature("autodoc", ":rtype: TopOpeBRepDS_Config") Config2;
		TopOpeBRepDS_Config Config2 ();

		/****************** CopyPermuted ******************/
		%feature("compactdefaultargs") CopyPermuted;
		%feature("autodoc", ":rtype: TopOpeBRepBuild_GTopo") CopyPermuted;
		TopOpeBRepBuild_GTopo CopyPermuted ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":param OS:
	:type OS: Standard_OStream
	:param s: default value is NULL
	:type s: Standard_Address
	:rtype: void") Dump;
		virtual void Dump (Standard_OStream & OS,const Standard_Address s = NULL);

		/****************** DumpSSB ******************/
		%feature("compactdefaultargs") DumpSSB;
		%feature("autodoc", ":param OS:
	:type OS: Standard_OStream
	:param s1:
	:type s1: TopAbs_State
	:param s2:
	:type s2: TopAbs_State
	:param b:
	:type b: bool
	:rtype: void") DumpSSB;
		static void DumpSSB (Standard_OStream & OS,const TopAbs_State s1,const TopAbs_State s2,const Standard_Boolean b);


        %feature("autodoc", "1");
        %extend{
            std::string DumpTypeToString() {
            std::stringstream s;
            self->DumpType(s);
            return s.str();}
        };
        		/****************** DumpVal ******************/
		%feature("compactdefaultargs") DumpVal;
		%feature("autodoc", ":param OS:
	:type OS: Standard_OStream
	:param s1:
	:type s1: TopAbs_State
	:param s2:
	:type s2: TopAbs_State
	:rtype: None") DumpVal;
		void DumpVal (Standard_OStream & OS,const TopAbs_State s1,const TopAbs_State s2);

		/****************** GIndex ******************/
		%feature("compactdefaultargs") GIndex;
		%feature("autodoc", ":param S:
	:type S: TopAbs_State
	:rtype: int") GIndex;
		Standard_Integer GIndex (const TopAbs_State S);

		/****************** GState ******************/
		%feature("compactdefaultargs") GState;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopAbs_State") GState;
		TopAbs_State GState (const Standard_Integer I);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", ":param II:
	:type II: int
	:param i1:
	:type i1: int
	:param i2:
	:type i2: int
	:rtype: None") Index;
		void Index (const Standard_Integer II,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** IsToReverse1 ******************/
		%feature("compactdefaultargs") IsToReverse1;
		%feature("autodoc", ":rtype: bool") IsToReverse1;
		Standard_Boolean IsToReverse1 ();

		/****************** IsToReverse2 ******************/
		%feature("compactdefaultargs") IsToReverse2;
		%feature("autodoc", ":rtype: bool") IsToReverse2;
		Standard_Boolean IsToReverse2 ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", ":rtype: None") Reset;
		void Reset ();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", ":rtype: bool") Reverse;
		Standard_Boolean Reverse ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param II:
	:type II: bool
	:param IN:
	:type IN: bool
	:param IO:
	:type IO: bool
	:param NI:
	:type NI: bool
	:param NN:
	:type NN: bool
	:param NO:
	:type NO: bool
	:param OI:
	:type OI: bool
	:param ON:
	:type ON: bool
	:param OO:
	:type OO: bool
	:rtype: None") Set;
		void Set (const Standard_Boolean II,const Standard_Boolean IN,const Standard_Boolean IO,const Standard_Boolean NI,const Standard_Boolean NN,const Standard_Boolean NO,const Standard_Boolean OI,const Standard_Boolean ON,const Standard_Boolean OO);

		/****************** SetReverse ******************/
		%feature("compactdefaultargs") SetReverse;
		%feature("autodoc", ":param rev:
	:type rev: bool
	:rtype: None") SetReverse;
		void SetReverse (const Standard_Boolean rev);

		/****************** StatesON ******************/
		%feature("compactdefaultargs") StatesON;
		%feature("autodoc", ":param s1:
	:type s1: TopAbs_State
	:param s2:
	:type s2: TopAbs_State
	:rtype: None") StatesON;
		void StatesON (TopAbs_State & s1,TopAbs_State & s2);

		/****************** TopOpeBRepBuild_GTopo ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_GTopo;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_GTopo;
		 TopOpeBRepBuild_GTopo ();

		/****************** TopOpeBRepBuild_GTopo ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_GTopo;
		%feature("autodoc", ":param II:
	:type II: bool
	:param IN:
	:type IN: bool
	:param IO:
	:type IO: bool
	:param NI:
	:type NI: bool
	:param NN:
	:type NN: bool
	:param NO:
	:type NO: bool
	:param OI:
	:type OI: bool
	:param ON:
	:type ON: bool
	:param OO:
	:type OO: bool
	:param t1:
	:type t1: TopAbs_ShapeEnum
	:param t2:
	:type t2: TopAbs_ShapeEnum
	:param C1:
	:type C1: TopOpeBRepDS_Config
	:param C2:
	:type C2: TopOpeBRepDS_Config
	:rtype: None") TopOpeBRepBuild_GTopo;
		 TopOpeBRepBuild_GTopo (const Standard_Boolean II,const Standard_Boolean IN,const Standard_Boolean IO,const Standard_Boolean NI,const Standard_Boolean NN,const Standard_Boolean NO,const Standard_Boolean OI,const Standard_Boolean ON,const Standard_Boolean OO,const TopAbs_ShapeEnum t1,const TopAbs_ShapeEnum t2,const TopOpeBRepDS_Config C1,const TopOpeBRepDS_Config C2);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", ":param t1:
	:type t1: TopAbs_ShapeEnum
	:param t2:
	:type t2: TopAbs_ShapeEnum
	:rtype: None") Type;
		void Type (TopAbs_ShapeEnum & t1,TopAbs_ShapeEnum & t2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param s1:
	:type s1: TopAbs_State
	:param s2:
	:type s2: TopAbs_State
	:rtype: bool") Value;
		Standard_Boolean Value (const TopAbs_State s1,const TopAbs_State s2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:rtype: bool") Value;
		Standard_Boolean Value (const Standard_Integer I1,const Standard_Integer I2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param II:
	:type II: int
	:rtype: bool") Value;
		Standard_Boolean Value (const Standard_Integer II);

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
		/****************** BuildTool ******************/
		%feature("compactdefaultargs") BuildTool;
		%feature("autodoc", ":rtype: TopOpeBRepDS_BuildTool") BuildTool;
		const TopOpeBRepDS_BuildTool & BuildTool ();

		/****************** ChangeBuildTool ******************/
		%feature("compactdefaultargs") ChangeBuildTool;
		%feature("autodoc", ":rtype: TopOpeBRepDS_BuildTool") ChangeBuildTool;
		TopOpeBRepDS_BuildTool & ChangeBuildTool ();

		/****************** ChangeBuilder ******************/
		%feature("compactdefaultargs") ChangeBuilder;
		%feature("autodoc", ":rtype: TopOpeBRepBuild_Builder") ChangeBuilder;
		TopOpeBRepBuild_Builder & ChangeBuilder ();

		/****************** ChangeNewEdges ******************/
		%feature("compactdefaultargs") ChangeNewEdges;
		%feature("autodoc", "* Returns the edges created on curve <I>.
	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape") ChangeNewEdges;
		TopTools_ListOfShape & ChangeNewEdges (const Standard_Integer I);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Removes all split and merge already performed. Does NOT clear the handled DS.
	:rtype: None") Clear;
		void Clear ();

		/****************** CurrentSection ******************/
		%feature("compactdefaultargs") CurrentSection;
		%feature("autodoc", ":rtype: TopoDS_Shape") CurrentSection;
		const TopoDS_Shape  CurrentSection ();

		/****************** DataStructure ******************/
		%feature("compactdefaultargs") DataStructure;
		%feature("autodoc", "* returns the DS handled by this builder
	:rtype: opencascade::handle<TopOpeBRepDS_HDataStructure>") DataStructure;
		opencascade::handle<TopOpeBRepDS_HDataStructure> DataStructure ();

		/****************** EdgeCurveAncestors ******************/
		%feature("compactdefaultargs") EdgeCurveAncestors;
		%feature("autodoc", "* search for the couple of face F1,F2 (from arguments of supra Perform(S1,S2,HDS)) method which intersection gives section edge E built on an intersection curve. returns True if F1,F2 have been valued. returns False if E is not a section edge built on intersection curve IC.
	:param E:
	:type E: TopoDS_Shape
	:param F1:
	:type F1: TopoDS_Shape
	:param F2:
	:type F2: TopoDS_Shape
	:param IC:
	:type IC: int
	:rtype: bool") EdgeCurveAncestors;
		Standard_Boolean EdgeCurveAncestors (const TopoDS_Shape & E,TopoDS_Shape & F1,TopoDS_Shape & F2,Standard_Integer &OutValue);

		/****************** EdgeSectionAncestors ******************/
		%feature("compactdefaultargs") EdgeSectionAncestors;
		%feature("autodoc", "* search for the couple of face F1,F2 (from arguments of supra Perform(S1,S2,HDS)) method which intersection gives section edge E built on at least one edge . returns True if F1,F2 have been valued. returns False if E is not a section edge built on at least one edge of S1 and/or S2. LE1,LE2 are edges of S1,S2 which common part is edge E. LE1 or LE2 may be empty() but not both.
	:param E:
	:type E: TopoDS_Shape
	:param LF1:
	:type LF1: TopTools_ListOfShape
	:param LF2:
	:type LF2: TopTools_ListOfShape
	:param LE1:
	:type LE1: TopTools_ListOfShape
	:param LE2:
	:type LE2: TopTools_ListOfShape
	:rtype: bool") EdgeSectionAncestors;
		Standard_Boolean EdgeSectionAncestors (const TopoDS_Shape & E,TopTools_ListOfShape & LF1,TopTools_ListOfShape & LF2,TopTools_ListOfShape & LE1,TopTools_ListOfShape & LE2);

		/****************** GetDSCurveFromSectEdge ******************/
		%feature("compactdefaultargs") GetDSCurveFromSectEdge;
		%feature("autodoc", ":param SectEdge:
	:type SectEdge: TopoDS_Shape
	:rtype: int") GetDSCurveFromSectEdge;
		Standard_Integer GetDSCurveFromSectEdge (const TopoDS_Shape & SectEdge);

		/****************** GetDSEdgeFromSectEdge ******************/
		%feature("compactdefaultargs") GetDSEdgeFromSectEdge;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param rank:
	:type rank: int
	:rtype: int") GetDSEdgeFromSectEdge;
		Standard_Integer GetDSEdgeFromSectEdge (const TopoDS_Shape & E,const Standard_Integer rank);

		/****************** GetDSFaceFromDSCurve ******************/
		%feature("compactdefaultargs") GetDSFaceFromDSCurve;
		%feature("autodoc", ":param indexCur:
	:type indexCur: int
	:param rank:
	:type rank: int
	:rtype: int") GetDSFaceFromDSCurve;
		Standard_Integer GetDSFaceFromDSCurve (const Standard_Integer indexCur,const Standard_Integer rank);

		/****************** GetDSFaceFromDSEdge ******************/
		%feature("compactdefaultargs") GetDSFaceFromDSEdge;
		%feature("autodoc", ":param indexEdg:
	:type indexEdg: int
	:param rank:
	:type rank: int
	:rtype: TColStd_ListOfInteger") GetDSFaceFromDSEdge;
		TColStd_ListOfInteger & GetDSFaceFromDSEdge (const Standard_Integer indexEdg,const Standard_Integer rank);

		/****************** GetDSPointFromNewVertex ******************/
		%feature("compactdefaultargs") GetDSPointFromNewVertex;
		%feature("autodoc", ":param NewVert:
	:type NewVert: TopoDS_Shape
	:rtype: int") GetDSPointFromNewVertex;
		Standard_Integer GetDSPointFromNewVertex (const TopoDS_Shape & NewVert);

		/****************** InitExtendedSectionDS ******************/
		%feature("compactdefaultargs") InitExtendedSectionDS;
		%feature("autodoc", ":param k: default value is 3
	:type k: int
	:rtype: None") InitExtendedSectionDS;
		void InitExtendedSectionDS (const Standard_Integer k = 3);

		/****************** InitSection ******************/
		%feature("compactdefaultargs") InitSection;
		%feature("autodoc", ":param k: default value is 3
	:type k: int
	:rtype: None") InitSection;
		void InitSection (const Standard_Integer k = 3);

		/****************** IsKPart ******************/
		%feature("compactdefaultargs") IsKPart;
		%feature("autodoc", "* Returns 0 is standard operation, != 0 if particular case
	:rtype: int") IsKPart;
		Standard_Integer IsKPart ();

		/****************** IsMerged ******************/
		%feature("compactdefaultargs") IsMerged;
		%feature("autodoc", "* Returns True if the shape <S> has been merged.
	:param S:
	:type S: TopoDS_Shape
	:param ToBuild:
	:type ToBuild: TopAbs_State
	:rtype: bool") IsMerged;
		Standard_Boolean IsMerged (const TopoDS_Shape & S,const TopAbs_State ToBuild);

		/****************** IsSplit ******************/
		%feature("compactdefaultargs") IsSplit;
		%feature("autodoc", "* Returns True if the shape <S> has been split.
	:param S:
	:type S: TopoDS_Shape
	:param ToBuild:
	:type ToBuild: TopAbs_State
	:rtype: bool") IsSplit;
		Standard_Boolean IsSplit (const TopoDS_Shape & S,const TopAbs_State ToBuild);

		/****************** MergeKPart ******************/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", ":param TB1:
	:type TB1: TopAbs_State
	:param TB2:
	:type TB2: TopAbs_State
	:rtype: None") MergeKPart;
		void MergeKPart (const TopAbs_State TB1,const TopAbs_State TB2);

		/****************** MergeShapes ******************/
		%feature("compactdefaultargs") MergeShapes;
		%feature("autodoc", "* Merges the two shapes <S1> and <S2> keeping the parts of states <TB1>,<TB2> in <S1>,<S2>.
	:param S1:
	:type S1: TopoDS_Shape
	:param TB1:
	:type TB1: TopAbs_State
	:param S2:
	:type S2: TopoDS_Shape
	:param TB2:
	:type TB2: TopAbs_State
	:rtype: None") MergeShapes;
		void MergeShapes (const TopoDS_Shape & S1,const TopAbs_State TB1,const TopoDS_Shape & S2,const TopAbs_State TB2);

		/****************** MergeSolid ******************/
		%feature("compactdefaultargs") MergeSolid;
		%feature("autodoc", "* Merges the solid <S> keeping the parts of state <TB>.
	:param S:
	:type S: TopoDS_Shape
	:param TB:
	:type TB: TopAbs_State
	:rtype: None") MergeSolid;
		void MergeSolid (const TopoDS_Shape & S,const TopAbs_State TB);

		/****************** MergeSolids ******************/
		%feature("compactdefaultargs") MergeSolids;
		%feature("autodoc", "* Merges the two solids <S1> and <S2> keeping the parts in each solid of states <TB1> and <TB2>.
	:param S1:
	:type S1: TopoDS_Shape
	:param TB1:
	:type TB1: TopAbs_State
	:param S2:
	:type S2: TopoDS_Shape
	:param TB2:
	:type TB2: TopAbs_State
	:rtype: None") MergeSolids;
		void MergeSolids (const TopoDS_Shape & S1,const TopAbs_State TB1,const TopoDS_Shape & S2,const TopAbs_State TB2);

		/****************** Merged ******************/
		%feature("compactdefaultargs") Merged;
		%feature("autodoc", "* Returns the merged parts <ToBuild> of shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:param ToBuild:
	:type ToBuild: TopAbs_State
	:rtype: TopTools_ListOfShape") Merged;
		const TopTools_ListOfShape & Merged (const TopoDS_Shape & S,const TopAbs_State ToBuild);

		/****************** MoreSection ******************/
		%feature("compactdefaultargs") MoreSection;
		%feature("autodoc", ":rtype: bool") MoreSection;
		Standard_Boolean MoreSection ();

		/****************** NewEdges ******************/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "* Returns the edges created on curve <I>.
	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape") NewEdges;
		const TopTools_ListOfShape & NewEdges (const Standard_Integer I);

		/****************** NewFaces ******************/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "* Returns the faces created on surface <I>.
	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape") NewFaces;
		const TopTools_ListOfShape & NewFaces (const Standard_Integer I);

		/****************** NewVertex ******************/
		%feature("compactdefaultargs") NewVertex;
		%feature("autodoc", "* Returns the vertex created on point <I>.
	:param I:
	:type I: int
	:rtype: TopoDS_Shape") NewVertex;
		const TopoDS_Shape  NewVertex (const Standard_Integer I);

		/****************** NextSection ******************/
		%feature("compactdefaultargs") NextSection;
		%feature("autodoc", ":rtype: None") NextSection;
		void NextSection ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Stores the data structure <HDS>, Create shapes from the new geometries described in <HDS>.
	:param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:rtype: None") Perform;
		void Perform (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Same as previous + evaluates if an operation performed on shapes S1,S2 is a particular case.
	:param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: None") Perform;
		void Perform (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS,const TopoDS_Shape & S1,const TopoDS_Shape & S2);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") Section;
		const TopTools_ListOfShape & Section ();

		/****************** Splits ******************/
		%feature("compactdefaultargs") Splits;
		%feature("autodoc", "* Returns the split parts <ToBuild> of shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:param ToBuild:
	:type ToBuild: TopAbs_State
	:rtype: TopTools_ListOfShape") Splits;
		const TopTools_ListOfShape & Splits (const TopoDS_Shape & S,const TopAbs_State ToBuild);

		/****************** TopOpeBRepBuild_HBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_HBuilder;
		%feature("autodoc", ":param BT:
	:type BT: TopOpeBRepDS_BuildTool
	:rtype: None") TopOpeBRepBuild_HBuilder;
		 TopOpeBRepBuild_HBuilder (const TopOpeBRepDS_BuildTool & BT);

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
		/****************** BlockIterator ******************/
		%feature("compactdefaultargs") BlockIterator;
		%feature("autodoc", ":rtype: TopOpeBRepBuild_BlockIterator") BlockIterator;
		const TopOpeBRepBuild_BlockIterator & BlockIterator ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: void") Dump;
		virtual void Dump ();

		/****************** IsShape ******************/
		%feature("compactdefaultargs") IsShape;
		%feature("autodoc", ":rtype: bool") IsShape;
		virtual Standard_Boolean IsShape ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		virtual const TopoDS_Shape  Shape ();

		/****************** TopOpeBRepBuild_Loop ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_Loop;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") TopOpeBRepBuild_Loop;
		 TopOpeBRepBuild_Loop (const TopoDS_Shape & S);

		/****************** TopOpeBRepBuild_Loop ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_Loop;
		%feature("autodoc", ":param BI:
	:type BI: TopOpeBRepBuild_BlockIterator
	:rtype: None") TopOpeBRepBuild_Loop;
		 TopOpeBRepBuild_Loop (const TopOpeBRepBuild_BlockIterator & BI);

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
		%feature("autodoc", "* Returns the state of loop <L1> compared with loop <L2>.
	:param L1:
	:type L1: TopOpeBRepBuild_Loop
	:param L2:
	:type L2: TopOpeBRepBuild_Loop
	:rtype: TopAbs_State") Compare;
		virtual TopAbs_State Compare (const opencascade::handle<TopOpeBRepBuild_Loop> & L1,const opencascade::handle<TopOpeBRepBuild_Loop> & L2);

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
		/****************** ChangeListOfLoop ******************/
		%feature("compactdefaultargs") ChangeListOfLoop;
		%feature("autodoc", ":rtype: TopOpeBRepBuild_ListOfLoop") ChangeListOfLoop;
		TopOpeBRepBuild_ListOfLoop & ChangeListOfLoop ();

		/****************** InitLoop ******************/
		%feature("compactdefaultargs") InitLoop;
		%feature("autodoc", ":rtype: void") InitLoop;
		virtual void InitLoop ();

		/****************** Loop ******************/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", ":rtype: opencascade::handle<TopOpeBRepBuild_Loop>") Loop;
		virtual opencascade::handle<TopOpeBRepBuild_Loop> Loop ();

		/****************** MoreLoop ******************/
		%feature("compactdefaultargs") MoreLoop;
		%feature("autodoc", ":rtype: bool") MoreLoop;
		virtual Standard_Boolean MoreLoop ();

		/****************** NextLoop ******************/
		%feature("compactdefaultargs") NextLoop;
		%feature("autodoc", ":rtype: void") NextLoop;
		virtual void NextLoop ();

		/****************** TopOpeBRepBuild_LoopSet ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_LoopSet;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_LoopSet;
		 TopOpeBRepBuild_LoopSet ();

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
		/****************** ChangeList ******************/
		%feature("compactdefaultargs") ChangeList;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") ChangeList;
		TopTools_ListOfShape & ChangeList ();

		/****************** ChangeShape ******************/
		%feature("compactdefaultargs") ChangeShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") ChangeShape;
		TopoDS_Shape  ChangeShape ();

		/****************** List ******************/
		%feature("compactdefaultargs") List;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") List;
		const TopTools_ListOfShape & List ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** TopOpeBRepBuild_ShapeListOfShape ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeListOfShape;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_ShapeListOfShape;
		 TopOpeBRepBuild_ShapeListOfShape ();

		/****************** TopOpeBRepBuild_ShapeListOfShape ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeListOfShape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") TopOpeBRepBuild_ShapeListOfShape;
		 TopOpeBRepBuild_ShapeListOfShape (const TopoDS_Shape & S);

		/****************** TopOpeBRepBuild_ShapeListOfShape ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeListOfShape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: None") TopOpeBRepBuild_ShapeListOfShape;
		 TopOpeBRepBuild_ShapeListOfShape (const TopoDS_Shape & S,const TopTools_ListOfShape & L);

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
		/****************** AddElement ******************/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "* for each subshape SE of S of type mySubShapeType - Add subshapes of S to the map of subshapes (mySubShapeMap) - Add S to the list of shape incident to subshapes of S.
	:param S:
	:type S: TopoDS_Shape
	:rtype: void") AddElement;
		virtual void AddElement (const TopoDS_Shape & S);

		/****************** AddShape ******************/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "* Adds <S> to the list of shapes. (wires or shells).
	:param S:
	:type S: TopoDS_Shape
	:rtype: void") AddShape;
		virtual void AddShape (const TopoDS_Shape & S);

		/****************** AddStartElement ******************/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "* (S is a face or edge) Add S to the list of starting shapes used for reconstructions. apply AddElement(S).
	:param S:
	:type S: TopoDS_Shape
	:rtype: void") AddStartElement;
		virtual void AddStartElement (const TopoDS_Shape & S);

		/****************** ChangeStartShapes ******************/
		%feature("compactdefaultargs") ChangeStartShapes;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") ChangeStartShapes;
		TopTools_ListOfShape & ChangeStartShapes ();

		/****************** CheckShape ******************/
		%feature("compactdefaultargs") CheckShape;
		%feature("autodoc", ":param checkshape:
	:type checkshape: bool
	:rtype: None") CheckShape;
		void CheckShape (const Standard_Boolean checkshape);

		/****************** CheckShape ******************/
		%feature("compactdefaultargs") CheckShape;
		%feature("autodoc", ":rtype: bool") CheckShape;
		Standard_Boolean CheckShape ();

		/****************** CheckShape ******************/
		%feature("compactdefaultargs") CheckShape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param checkgeom: default value is Standard_False
	:type checkgeom: bool
	:rtype: bool") CheckShape;
		Standard_Boolean CheckShape (const TopoDS_Shape & S,const Standard_Boolean checkgeom = Standard_False);

		/****************** DEBName ******************/
		%feature("compactdefaultargs") DEBName;
		%feature("autodoc", ":param N:
	:type N: TCollection_AsciiString
	:rtype: None") DEBName;
		void DEBName (const TCollection_AsciiString & N);

		/****************** DEBName ******************/
		%feature("compactdefaultargs") DEBName;
		%feature("autodoc", ":rtype: TCollection_AsciiString") DEBName;
		const TCollection_AsciiString & DEBName ();

		/****************** DEBNumber ******************/
		%feature("compactdefaultargs") DEBNumber;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") DEBNumber;
		void DEBNumber (const Standard_Integer I);

		/****************** DEBNumber ******************/
		%feature("compactdefaultargs") DEBNumber;
		%feature("autodoc", ":rtype: int") DEBNumber;
		Standard_Integer DEBNumber ();

		/****************** DumpBB ******************/
		%feature("compactdefaultargs") DumpBB;
		%feature("autodoc", ":rtype: void") DumpBB;
		virtual void DumpBB ();

		/****************** DumpCheck ******************/
		%feature("compactdefaultargs") DumpCheck;
		%feature("autodoc", ":param OS:
	:type OS: Standard_OStream
	:param str:
	:type str: TCollection_AsciiString
	:param S:
	:type S: TopoDS_Shape
	:param chk:
	:type chk: bool
	:rtype: None") DumpCheck;
		void DumpCheck (Standard_OStream & OS,const TCollection_AsciiString & str,const TopoDS_Shape & S,const Standard_Boolean chk);

		/****************** DumpName ******************/
		%feature("compactdefaultargs") DumpName;
		%feature("autodoc", ":param OS:
	:type OS: Standard_OStream
	:param str:
	:type str: TCollection_AsciiString
	:rtype: None") DumpName;
		void DumpName (Standard_OStream & OS,const TCollection_AsciiString & str);

		/****************** DumpSS ******************/
		%feature("compactdefaultargs") DumpSS;
		%feature("autodoc", ":rtype: void") DumpSS;
		virtual void DumpSS ();

		/****************** FindNeighbours ******************/
		%feature("compactdefaultargs") FindNeighbours;
		%feature("autodoc", "* Build the list of neighbour shapes of myCurrentShape (neighbour shapes and myCurrentShapes are of type t) Initialize myIncidentShapesIter on neighbour shapes.
	:rtype: void") FindNeighbours;
		virtual void FindNeighbours ();

		/****************** InitNeighbours ******************/
		%feature("compactdefaultargs") InitNeighbours;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: void") InitNeighbours;
		virtual void InitNeighbours (const TopoDS_Shape & S);

		/****************** InitShapes ******************/
		%feature("compactdefaultargs") InitShapes;
		%feature("autodoc", ":rtype: None") InitShapes;
		void InitShapes ();

		/****************** InitStartElements ******************/
		%feature("compactdefaultargs") InitStartElements;
		%feature("autodoc", ":rtype: None") InitStartElements;
		void InitStartElements ();

		/****************** MakeNeighboursList ******************/
		%feature("compactdefaultargs") MakeNeighboursList;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param V:
	:type V: TopoDS_Shape
	:rtype: TopTools_ListOfShape") MakeNeighboursList;
		virtual const TopTools_ListOfShape & MakeNeighboursList (const TopoDS_Shape & E,const TopoDS_Shape & V);

		/****************** MaxNumberSubShape ******************/
		%feature("compactdefaultargs") MaxNumberSubShape;
		%feature("autodoc", ":param Shape:
	:type Shape: TopoDS_Shape
	:rtype: int") MaxNumberSubShape;
		Standard_Integer MaxNumberSubShape (const TopoDS_Shape & Shape);

		/****************** MoreNeighbours ******************/
		%feature("compactdefaultargs") MoreNeighbours;
		%feature("autodoc", ":rtype: bool") MoreNeighbours;
		Standard_Boolean MoreNeighbours ();

		/****************** MoreShapes ******************/
		%feature("compactdefaultargs") MoreShapes;
		%feature("autodoc", ":rtype: bool") MoreShapes;
		Standard_Boolean MoreShapes ();

		/****************** MoreStartElements ******************/
		%feature("compactdefaultargs") MoreStartElements;
		%feature("autodoc", ":rtype: bool") MoreStartElements;
		Standard_Boolean MoreStartElements ();

		/****************** Neighbour ******************/
		%feature("compactdefaultargs") Neighbour;
		%feature("autodoc", ":rtype: TopoDS_Shape") Neighbour;
		const TopoDS_Shape  Neighbour ();

		/****************** NextNeighbour ******************/
		%feature("compactdefaultargs") NextNeighbour;
		%feature("autodoc", ":rtype: None") NextNeighbour;
		void NextNeighbour ();

		/****************** NextShape ******************/
		%feature("compactdefaultargs") NextShape;
		%feature("autodoc", ":rtype: None") NextShape;
		void NextShape ();

		/****************** NextStartElement ******************/
		%feature("compactdefaultargs") NextStartElement;
		%feature("autodoc", ":rtype: None") NextStartElement;
		void NextStartElement ();

		/****************** SName ******************/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param sb: default value is ""
	:type sb: TCollection_AsciiString
	:param sa: default value is ""
	:type sa: TCollection_AsciiString
	:rtype: TCollection_AsciiString") SName;
		virtual TCollection_AsciiString SName (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");

		/****************** SName ******************/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", ":param S:
	:type S: TopTools_ListOfShape
	:param sb: default value is ""
	:type sb: TCollection_AsciiString
	:param sa: default value is ""
	:type sa: TCollection_AsciiString
	:rtype: TCollection_AsciiString") SName;
		virtual TCollection_AsciiString SName (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");

		/****************** SNameori ******************/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param sb: default value is ""
	:type sb: TCollection_AsciiString
	:param sa: default value is ""
	:type sa: TCollection_AsciiString
	:rtype: TCollection_AsciiString") SNameori;
		virtual TCollection_AsciiString SNameori (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");

		/****************** SNameori ******************/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", ":param S:
	:type S: TopTools_ListOfShape
	:param sb: default value is ""
	:type sb: TCollection_AsciiString
	:param sa: default value is ""
	:type sa: TCollection_AsciiString
	:rtype: TCollection_AsciiString") SNameori;
		virtual TCollection_AsciiString SNameori (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** StartElement ******************/
		%feature("compactdefaultargs") StartElement;
		%feature("autodoc", ":rtype: TopoDS_Shape") StartElement;
		const TopoDS_Shape  StartElement ();

		/****************** StartElements ******************/
		%feature("compactdefaultargs") StartElements;
		%feature("autodoc", "* return a reference on myStartShapes
	:rtype: TopTools_ListOfShape") StartElements;
		const TopTools_ListOfShape & StartElements ();

		/****************** TopOpeBRepBuild_ShapeSet ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeSet;
		%feature("autodoc", "* Creates a ShapeSet in order to build shapes connected by <SubShapeType> shapes. <checkshape>:check (or not) the shapes, startelements, elements added.
	:param SubShapeType:
	:type SubShapeType: TopAbs_ShapeEnum
	:param checkshape: default value is Standard_True
	:type checkshape: bool
	:rtype: None") TopOpeBRepBuild_ShapeSet;
		 TopOpeBRepBuild_ShapeSet (const TopAbs_ShapeEnum SubShapeType,const Standard_Boolean checkshape = Standard_True);

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
		/****************** AddShell ******************/
		%feature("compactdefaultargs") AddShell;
		%feature("autodoc", ":param Sh:
	:type Sh: TopoDS_Shell
	:rtype: None") AddShell;
		void AddShell (const TopoDS_Shell & Sh);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":rtype: None") Init;
		void Init ();

		/****************** MakeSolids ******************/
		%feature("compactdefaultargs") MakeSolids;
		%feature("autodoc", ":param So:
	:type So: TopoDS_Solid
	:param LSo:
	:type LSo: TopTools_ListOfShape
	:rtype: None") MakeSolids;
		void MakeSolids (const TopoDS_Solid & So,TopTools_ListOfShape & LSo);

		/****************** TopOpeBRepBuild_ShellToSolid ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellToSolid;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_ShellToSolid;
		 TopOpeBRepBuild_ShellToSolid ();

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
		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* Returns current new face of current new shell.
	:rtype: TopoDS_Shape") Face;
		const TopoDS_Shape  Face ();

		/****************** InitFace ******************/
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", ":rtype: int") InitFace;
		Standard_Integer InitFace ();

		/****************** InitShell ******************/
		%feature("compactdefaultargs") InitShell;
		%feature("autodoc", ":rtype: int") InitShell;
		Standard_Integer InitShell ();

		/****************** InitSolid ******************/
		%feature("compactdefaultargs") InitSolid;
		%feature("autodoc", ":rtype: int") InitSolid;
		Standard_Integer InitSolid ();

		/****************** InitSolidBuilder ******************/
		%feature("compactdefaultargs") InitSolidBuilder;
		%feature("autodoc", ":param FS:
	:type FS: TopOpeBRepBuild_ShellFaceSet
	:param ForceClass:
	:type ForceClass: bool
	:rtype: None") InitSolidBuilder;
		void InitSolidBuilder (TopOpeBRepBuild_ShellFaceSet & FS,const Standard_Boolean ForceClass);

		/****************** IsOldShell ******************/
		%feature("compactdefaultargs") IsOldShell;
		%feature("autodoc", ":rtype: bool") IsOldShell;
		Standard_Boolean IsOldShell ();

		/****************** MoreFace ******************/
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", ":rtype: bool") MoreFace;
		Standard_Boolean MoreFace ();

		/****************** MoreShell ******************/
		%feature("compactdefaultargs") MoreShell;
		%feature("autodoc", ":rtype: bool") MoreShell;
		Standard_Boolean MoreShell ();

		/****************** MoreSolid ******************/
		%feature("compactdefaultargs") MoreSolid;
		%feature("autodoc", ":rtype: bool") MoreSolid;
		Standard_Boolean MoreSolid ();

		/****************** NextFace ******************/
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", ":rtype: None") NextFace;
		void NextFace ();

		/****************** NextShell ******************/
		%feature("compactdefaultargs") NextShell;
		%feature("autodoc", ":rtype: None") NextShell;
		void NextShell ();

		/****************** NextSolid ******************/
		%feature("compactdefaultargs") NextSolid;
		%feature("autodoc", ":rtype: None") NextSolid;
		void NextSolid ();

		/****************** OldShell ******************/
		%feature("compactdefaultargs") OldShell;
		%feature("autodoc", "* Returns current shell This shell may be : * an old shell OldShell(), which has not been reconstructed; * a new shell made of faces described by ...NewFace() methods.
	:rtype: TopoDS_Shape") OldShell;
		const TopoDS_Shape  OldShell ();

		/****************** TopOpeBRepBuild_SolidBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidBuilder;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_SolidBuilder;
		 TopOpeBRepBuild_SolidBuilder ();

		/****************** TopOpeBRepBuild_SolidBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidBuilder;
		%feature("autodoc", "* Create a SolidBuilder to build the areas on the shapes (shells, blocks of faces) described by <LS>.
	:param FS:
	:type FS: TopOpeBRepBuild_ShellFaceSet
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None") TopOpeBRepBuild_SolidBuilder;
		 TopOpeBRepBuild_SolidBuilder (TopOpeBRepBuild_ShellFaceSet & FS,const Standard_Boolean ForceClass = Standard_False);

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
		%feature("autodoc", "* Checks if <theFace> has the properly closed in 2D boundary(ies)
	:param theFace:
	:type theFace: TopoDS_Face
	:rtype: bool") CheckFaceClosed2d;
		static Standard_Boolean CheckFaceClosed2d (const TopoDS_Face & theFace);

		/****************** CorrectCurveOnSurface ******************/
		%feature("compactdefaultargs") CorrectCurveOnSurface;
		%feature("autodoc", ":param aS:
	:type aS: TopoDS_Shape
	:param aTolMax: default value is 0.0001
	:type aTolMax: float
	:rtype: void") CorrectCurveOnSurface;
		static void CorrectCurveOnSurface (const TopoDS_Shape & aS,const Standard_Real aTolMax = 0.0001);

		/****************** CorrectFace2d ******************/
		%feature("compactdefaultargs") CorrectFace2d;
		%feature("autodoc", "* test if UV representation of <oldFace> is good (i.e. face is closed in 2d). if face is not closed , this method will try to close such face and will return corrected edges in the <aMapOfCorrect2dEdges>. Parameter <aSourceShapes> used to fix the edge (or wires) which should be correct (Corrector used it as a start shapes). NOTE : Parameter corrFace doesn't mean anything. If you want to use this method , rebuild resulting face after by yourself using corrected edges.
	:param oldFace:
	:type oldFace: TopoDS_Shape
	:param corrFace:
	:type corrFace: TopoDS_Shape
	:param aSourceShapes:
	:type aSourceShapes: TopTools_IndexedMapOfOrientedShape
	:param aMapOfCorrect2dEdges:
	:type aMapOfCorrect2dEdges: TopTools_IndexedDataMapOfShapeShape
	:rtype: void") CorrectFace2d;
		static void CorrectFace2d (const TopoDS_Shape & oldFace,TopoDS_Shape & corrFace,const TopTools_IndexedMapOfOrientedShape & aSourceShapes,TopTools_IndexedDataMapOfShapeShape & aMapOfCorrect2dEdges);

		/****************** CorrectPointOnCurve ******************/
		%feature("compactdefaultargs") CorrectPointOnCurve;
		%feature("autodoc", ":param aS:
	:type aS: TopoDS_Shape
	:param aTolMax: default value is 0.0001
	:type aTolMax: float
	:rtype: void") CorrectPointOnCurve;
		static void CorrectPointOnCurve (const TopoDS_Shape & aS,const Standard_Real aTolMax = 0.0001);

		/****************** CorrectTolerances ******************/
		%feature("compactdefaultargs") CorrectTolerances;
		%feature("autodoc", ":param aS:
	:type aS: TopoDS_Shape
	:param aTolMax: default value is 0.0001
	:type aTolMax: float
	:rtype: void") CorrectTolerances;
		static void CorrectTolerances (const TopoDS_Shape & aS,const Standard_Real aTolMax = 0.0001);

		/****************** FindState ******************/
		%feature("compactdefaultargs") FindState;
		%feature("autodoc", ":param aVertex:
	:type aVertex: TopoDS_Shape
	:param aState:
	:type aState: TopAbs_State
	:param aShapeEnum:
	:type aShapeEnum: TopAbs_ShapeEnum
	:param aMapVertexEdges:
	:type aMapVertexEdges: TopTools_IndexedDataMapOfShapeListOfShape
	:param aMapProcessedVertices:
	:type aMapProcessedVertices: TopTools_MapOfShape
	:param aMapVs:
	:type aMapVs: TopOpeBRepDS_DataMapOfShapeState
	:rtype: void") FindState;
		static void FindState (const TopoDS_Shape & aVertex,const TopAbs_State aState,const TopAbs_ShapeEnum aShapeEnum,const TopTools_IndexedDataMapOfShapeListOfShape & aMapVertexEdges,TopTools_MapOfShape & aMapProcessedVertices,TopOpeBRepDS_DataMapOfShapeState & aMapVs);

		/****************** FindState1 ******************/
		%feature("compactdefaultargs") FindState1;
		%feature("autodoc", ":param anEdge:
	:type anEdge: TopoDS_Shape
	:param aState:
	:type aState: TopAbs_State
	:param aMapEdgesFaces:
	:type aMapEdgesFaces: TopTools_IndexedDataMapOfShapeListOfShape
	:param aMapProcessedVertices:
	:type aMapProcessedVertices: TopTools_MapOfShape
	:param aMapVs:
	:type aMapVs: TopOpeBRepDS_DataMapOfShapeState
	:rtype: void") FindState1;
		static void FindState1 (const TopoDS_Shape & anEdge,const TopAbs_State aState,const TopTools_IndexedDataMapOfShapeListOfShape & aMapEdgesFaces,TopTools_MapOfShape & aMapProcessedVertices,TopOpeBRepDS_DataMapOfShapeState & aMapVs);

		/****************** FindState2 ******************/
		%feature("compactdefaultargs") FindState2;
		%feature("autodoc", ":param anEdge:
	:type anEdge: TopoDS_Shape
	:param aState:
	:type aState: TopAbs_State
	:param aMapEdgesFaces:
	:type aMapEdgesFaces: TopTools_IndexedDataMapOfShapeListOfShape
	:param aMapProcessedEdges:
	:type aMapProcessedEdges: TopTools_MapOfShape
	:param aMapVs:
	:type aMapVs: TopOpeBRepDS_DataMapOfShapeState
	:rtype: void") FindState2;
		static void FindState2 (const TopoDS_Shape & anEdge,const TopAbs_State aState,const TopTools_IndexedDataMapOfShapeListOfShape & aMapEdgesFaces,TopTools_MapOfShape & aMapProcessedEdges,TopOpeBRepDS_DataMapOfShapeState & aMapVs);

		/****************** FindStateThroughVertex ******************/
		%feature("compactdefaultargs") FindStateThroughVertex;
		%feature("autodoc", ":param aShape:
	:type aShape: TopoDS_Shape
	:param aShapeClassifier:
	:type aShapeClassifier: TopOpeBRepTool_ShapeClassifier
	:param aMapOfShapeWithState:
	:type aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState
	:param anAvoidSubshMap:
	:type anAvoidSubshMap: TopTools_MapOfShape
	:rtype: TopAbs_State") FindStateThroughVertex;
		static TopAbs_State FindStateThroughVertex (const TopoDS_Shape & aShape,TopOpeBRepTool_ShapeClassifier & aShapeClassifier,TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState,const TopTools_MapOfShape & anAvoidSubshMap);

		/****************** GetAdjacentFace ******************/
		%feature("compactdefaultargs") GetAdjacentFace;
		%feature("autodoc", ":param aFaceObj:
	:type aFaceObj: TopoDS_Shape
	:param anEObj:
	:type anEObj: TopoDS_Shape
	:param anEdgeFaceMap:
	:type anEdgeFaceMap: TopTools_IndexedDataMapOfShapeListOfShape
	:param anAdjFaceObj:
	:type anAdjFaceObj: TopoDS_Shape
	:rtype: bool") GetAdjacentFace;
		static Standard_Boolean GetAdjacentFace (const TopoDS_Shape & aFaceObj,const TopoDS_Shape & anEObj,const TopTools_IndexedDataMapOfShapeListOfShape & anEdgeFaceMap,TopoDS_Shape & anAdjFaceObj);

		/****************** GetNormalInNearestPoint ******************/
		%feature("compactdefaultargs") GetNormalInNearestPoint;
		%feature("autodoc", "* This function used to compute normal in point which is located near the point with param UV (used for computation of normals where the normal in the point UV equal to zero).
	:param aFace:
	:type aFace: TopoDS_Face
	:param anEdge:
	:type anEdge: TopoDS_Edge
	:param aNormal:
	:type aNormal: gp_Vec
	:rtype: void") GetNormalInNearestPoint;
		static void GetNormalInNearestPoint (const TopoDS_Face & aFace,const TopoDS_Edge & anEdge,gp_Vec & aNormal);

		/****************** GetNormalToFaceOnEdge ******************/
		%feature("compactdefaultargs") GetNormalToFaceOnEdge;
		%feature("autodoc", ":param aFObj:
	:type aFObj: TopoDS_Face
	:param anEdgeObj:
	:type anEdgeObj: TopoDS_Edge
	:param aDirNormal:
	:type aDirNormal: gp_Vec
	:rtype: void") GetNormalToFaceOnEdge;
		static void GetNormalToFaceOnEdge (const TopoDS_Face & aFObj,const TopoDS_Edge & anEdgeObj,gp_Vec & aDirNormal);

		/****************** GetTangentToEdge ******************/
		%feature("compactdefaultargs") GetTangentToEdge;
		%feature("autodoc", ":param anEdgeObj:
	:type anEdgeObj: TopoDS_Edge
	:param aTangent:
	:type aTangent: gp_Vec
	:rtype: bool") GetTangentToEdge;
		static Standard_Boolean GetTangentToEdge (const TopoDS_Edge & anEdgeObj,gp_Vec & aTangent);

		/****************** GetTangentToEdgeEdge ******************/
		%feature("compactdefaultargs") GetTangentToEdgeEdge;
		%feature("autodoc", ":param aFObj:
	:type aFObj: TopoDS_Face
	:param anEdgeObj:
	:type anEdgeObj: TopoDS_Edge
	:param aOriEObj:
	:type aOriEObj: TopoDS_Edge
	:param aTangent:
	:type aTangent: gp_Vec
	:rtype: bool") GetTangentToEdgeEdge;
		static Standard_Boolean GetTangentToEdgeEdge (const TopoDS_Face & aFObj,const TopoDS_Edge & anEdgeObj,const TopoDS_Edge & aOriEObj,gp_Vec & aTangent);

		/****************** IsDegEdgesTheSame ******************/
		%feature("compactdefaultargs") IsDegEdgesTheSame;
		%feature("autodoc", ":param anE1:
	:type anE1: TopoDS_Shape
	:param anE2:
	:type anE2: TopoDS_Shape
	:rtype: bool") IsDegEdgesTheSame;
		static Standard_Boolean IsDegEdgesTheSame (const TopoDS_Shape & anE1,const TopoDS_Shape & anE2);

		/****************** NormalizeFace ******************/
		%feature("compactdefaultargs") NormalizeFace;
		%feature("autodoc", "* test if <oldFace> does not contain INTERNAL or EXTERNAL edges and remove such edges in case of its presence. The result is stored in <corrFace>
	:param oldFace:
	:type oldFace: TopoDS_Shape
	:param corrFace:
	:type corrFace: TopoDS_Shape
	:rtype: void") NormalizeFace;
		static void NormalizeFace (const TopoDS_Shape & oldFace,TopoDS_Shape & corrFace);

		/****************** PropagateState ******************/
		%feature("compactdefaultargs") PropagateState;
		%feature("autodoc", ":param aSplEdgesState:
	:type aSplEdgesState: TopOpeBRepDS_DataMapOfShapeState
	:param anEdgesToRestMap:
	:type anEdgesToRestMap: TopTools_IndexedMapOfShape
	:param aShapeEnum1:
	:type aShapeEnum1: TopAbs_ShapeEnum
	:param aShapeEnum2:
	:type aShapeEnum2: TopAbs_ShapeEnum
	:param aShapeClassifier:
	:type aShapeClassifier: TopOpeBRepTool_ShapeClassifier
	:param aMapOfShapeWithState:
	:type aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState
	:param anUnkStateShapes:
	:type anUnkStateShapes: TopTools_MapOfShape
	:rtype: void") PropagateState;
		static void PropagateState (const TopOpeBRepDS_DataMapOfShapeState & aSplEdgesState,const TopTools_IndexedMapOfShape & anEdgesToRestMap,const TopAbs_ShapeEnum aShapeEnum1,const TopAbs_ShapeEnum aShapeEnum2,TopOpeBRepTool_ShapeClassifier & aShapeClassifier,TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState,const TopTools_MapOfShape & anUnkStateShapes);

		/****************** PropagateStateForWires ******************/
		%feature("compactdefaultargs") PropagateStateForWires;
		%feature("autodoc", ":param aFacesToRestMap:
	:type aFacesToRestMap: TopTools_IndexedMapOfShape
	:param aMapOfShapeWithState:
	:type aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState
	:rtype: void") PropagateStateForWires;
		static void PropagateStateForWires (const TopTools_IndexedMapOfShape & aFacesToRestMap,TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState);

		/****************** SpreadStateToChild ******************/
		%feature("compactdefaultargs") SpreadStateToChild;
		%feature("autodoc", ":param aShape:
	:type aShape: TopoDS_Shape
	:param aState:
	:type aState: TopAbs_State
	:param aMapOfShapeWithState:
	:type aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState
	:rtype: void") SpreadStateToChild;
		static void SpreadStateToChild (const TopoDS_Shape & aShape,const TopAbs_State aState,TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState);

		/****************** UpdateEdgeOnFace ******************/
		%feature("compactdefaultargs") UpdateEdgeOnFace;
		%feature("autodoc", "* recompute PCurve of the edge on the NewFace
	:param aEdgeToUpdate:
	:type aEdgeToUpdate: TopoDS_Edge
	:param OldFace:
	:type OldFace: TopoDS_Face
	:param NewFace:
	:type NewFace: TopoDS_Face
	:rtype: void") UpdateEdgeOnFace;
		static void UpdateEdgeOnFace (const TopoDS_Edge & aEdgeToUpdate,const TopoDS_Face & OldFace,const TopoDS_Face & NewFace);

		/****************** UpdateEdgeOnPeriodicalFace ******************/
		%feature("compactdefaultargs") UpdateEdgeOnPeriodicalFace;
		%feature("autodoc", "* recompute PCurves of the closing (SIM , with 2 PCurves) edge on the NewFace
	:param aEdgeToUpdate:
	:type aEdgeToUpdate: TopoDS_Edge
	:param OldFace:
	:type OldFace: TopoDS_Face
	:param NewFace:
	:type NewFace: TopoDS_Face
	:rtype: void") UpdateEdgeOnPeriodicalFace;
		static void UpdateEdgeOnPeriodicalFace (const TopoDS_Edge & aEdgeToUpdate,const TopoDS_Face & OldFace,const TopoDS_Face & NewFace);

		/****************** UpdatePCurves ******************/
		%feature("compactdefaultargs") UpdatePCurves;
		%feature("autodoc", "* Recompute PCurves of the all edges from the wire on the <toFace>
	:param aWire:
	:type aWire: TopoDS_Wire
	:param fromFace:
	:type fromFace: TopoDS_Face
	:param toFace:
	:type toFace: TopoDS_Face
	:rtype: void") UpdatePCurves;
		static void UpdatePCurves (const TopoDS_Wire & aWire,const TopoDS_Face & fromFace,const TopoDS_Face & toFace);

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
		%feature("autodoc", ":param aMap:
	:type aMap: TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo
	:rtype: void") DumpMapOfShapeVertexInfo;
		static void DumpMapOfShapeVertexInfo (const TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & aMap);

		/****************** MakeMapOfShapeVertexInfo ******************/
		%feature("compactdefaultargs") MakeMapOfShapeVertexInfo;
		%feature("autodoc", ":param aWire:
	:type aWire: TopoDS_Wire
	:param aMap:
	:type aMap: TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo
	:rtype: void") MakeMapOfShapeVertexInfo;
		static void MakeMapOfShapeVertexInfo (const TopoDS_Wire & aWire,TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & aMap);

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", ":param aWire:
	:type aWire: TopoDS_Wire
	:param aResList:
	:type aResList: TopTools_ListOfShape
	:rtype: void") Path;
		static void Path (const TopoDS_Wire & aWire,TopTools_ListOfShape & aResList);

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
		/****************** AddIn ******************/
		%feature("compactdefaultargs") AddIn;
		%feature("autodoc", ":param anE:
	:type anE: TopoDS_Edge
	:rtype: None") AddIn;
		void AddIn (const TopoDS_Edge & anE);

		/****************** AddOut ******************/
		%feature("compactdefaultargs") AddOut;
		%feature("autodoc", ":param anE:
	:type anE: TopoDS_Edge
	:rtype: None") AddOut;
		void AddOut (const TopoDS_Edge & anE);

		/****************** AppendPassed ******************/
		%feature("compactdefaultargs") AppendPassed;
		%feature("autodoc", ":param anE:
	:type anE: TopoDS_Edge
	:rtype: None") AppendPassed;
		void AppendPassed (const TopoDS_Edge & anE);

		/****************** ChangeEdgesOut ******************/
		%feature("compactdefaultargs") ChangeEdgesOut;
		%feature("autodoc", ":rtype: TopTools_IndexedMapOfOrientedShape") ChangeEdgesOut;
		TopTools_IndexedMapOfOrientedShape & ChangeEdgesOut ();

		/****************** CurrentOut ******************/
		%feature("compactdefaultargs") CurrentOut;
		%feature("autodoc", ":rtype: TopoDS_Edge") CurrentOut;
		const TopoDS_Edge  CurrentOut ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: None") Dump;
		void Dump ();

		/****************** EdgesIn ******************/
		%feature("compactdefaultargs") EdgesIn;
		%feature("autodoc", ":rtype: TopTools_IndexedMapOfOrientedShape") EdgesIn;
		const TopTools_IndexedMapOfOrientedShape & EdgesIn ();

		/****************** EdgesOut ******************/
		%feature("compactdefaultargs") EdgesOut;
		%feature("autodoc", ":rtype: TopTools_IndexedMapOfOrientedShape") EdgesOut;
		const TopTools_IndexedMapOfOrientedShape & EdgesOut ();

		/****************** FoundOut ******************/
		%feature("compactdefaultargs") FoundOut;
		%feature("autodoc", ":rtype: int") FoundOut;
		Standard_Integer FoundOut ();

		/****************** ListPassed ******************/
		%feature("compactdefaultargs") ListPassed;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") ListPassed;
		const TopTools_ListOfShape & ListPassed ();

		/****************** NbCases ******************/
		%feature("compactdefaultargs") NbCases;
		%feature("autodoc", ":rtype: int") NbCases;
		Standard_Integer NbCases ();

		/****************** Prepare ******************/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", ":param aL:
	:type aL: TopTools_ListOfShape
	:rtype: None") Prepare;
		void Prepare (const TopTools_ListOfShape & aL);

		/****************** RemovePassed ******************/
		%feature("compactdefaultargs") RemovePassed;
		%feature("autodoc", ":rtype: None") RemovePassed;
		void RemovePassed ();

		/****************** SetCurrentIn ******************/
		%feature("compactdefaultargs") SetCurrentIn;
		%feature("autodoc", ":param anE:
	:type anE: TopoDS_Edge
	:rtype: None") SetCurrentIn;
		void SetCurrentIn (const TopoDS_Edge & anE);

		/****************** SetSmart ******************/
		%feature("compactdefaultargs") SetSmart;
		%feature("autodoc", ":param aFlag:
	:type aFlag: bool
	:rtype: None") SetSmart;
		void SetSmart (const Standard_Boolean aFlag);

		/****************** SetVertex ******************/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", ":param aV:
	:type aV: TopoDS_Vertex
	:rtype: None") SetVertex;
		void SetVertex (const TopoDS_Vertex & aV);

		/****************** Smart ******************/
		%feature("compactdefaultargs") Smart;
		%feature("autodoc", ":rtype: bool") Smart;
		Standard_Boolean Smart ();

		/****************** TopOpeBRepBuild_VertexInfo ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_VertexInfo;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_VertexInfo;
		 TopOpeBRepBuild_VertexInfo ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":rtype: TopoDS_Vertex") Vertex;
		const TopoDS_Vertex  Vertex ();

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
		/****************** AddWire ******************/
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", ":param W:
	:type W: TopoDS_Wire
	:rtype: None") AddWire;
		void AddWire (const TopoDS_Wire & W);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":rtype: None") Init;
		void Init ();

		/****************** MakeFaces ******************/
		%feature("compactdefaultargs") MakeFaces;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param LF:
	:type LF: TopTools_ListOfShape
	:rtype: None") MakeFaces;
		void MakeFaces (const TopoDS_Face & F,TopTools_ListOfShape & LF);

		/****************** TopOpeBRepBuild_WireToFace ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_WireToFace;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_WireToFace;
		 TopOpeBRepBuild_WireToFace ();

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
		/****************** ADD_LISTOFLoop_TO_LISTOFLoop ******************/
		%feature("compactdefaultargs") ADD_LISTOFLoop_TO_LISTOFLoop;
		%feature("autodoc", ":param LOL1:
	:type LOL1: TopOpeBRepBuild_ListOfLoop
	:param LOL2:
	:type LOL2: TopOpeBRepBuild_ListOfLoop
	:param s: default value is NULL
	:type s: Standard_Address
	:param s1: default value is NULL
	:type s1: Standard_Address
	:param s2: default value is NULL
	:type s2: Standard_Address
	:rtype: void") ADD_LISTOFLoop_TO_LISTOFLoop;
		virtual void ADD_LISTOFLoop_TO_LISTOFLoop (TopOpeBRepBuild_ListOfLoop & LOL1,TopOpeBRepBuild_ListOfLoop & LOL2,const Standard_Address s = NULL,const Standard_Address s1 = NULL,const Standard_Address s2 = NULL);

		/****************** ADD_Loop_TO_LISTOFLoop ******************/
		%feature("compactdefaultargs") ADD_Loop_TO_LISTOFLoop;
		%feature("autodoc", ":param L:
	:type L: TopOpeBRepBuild_Loop
	:param LOL:
	:type LOL: TopOpeBRepBuild_ListOfLoop
	:param s: default value is NULL
	:type s: Standard_Address
	:rtype: void") ADD_Loop_TO_LISTOFLoop;
		virtual void ADD_Loop_TO_LISTOFLoop (const opencascade::handle<TopOpeBRepBuild_Loop> & L,TopOpeBRepBuild_ListOfLoop & LOL,const Standard_Address s = NULL);

		/****************** DumpList ******************/
		%feature("compactdefaultargs") DumpList;
		%feature("autodoc", ":param L:
	:type L: TopOpeBRepBuild_ListOfLoop
	:rtype: void") DumpList;
		static void DumpList (const TopOpeBRepBuild_ListOfLoop & L);

		/****************** InitAreaBuilder ******************/
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "* Sets a Area1dBuilder to find the areas of the shapes described by <LS> using the classifier <LC>.
	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: void") InitAreaBuilder;
		virtual void InitAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);

		/****************** REM_Loop_FROM_LISTOFLoop ******************/
		%feature("compactdefaultargs") REM_Loop_FROM_LISTOFLoop;
		%feature("autodoc", ":param ITLOL:
	:type ITLOL: TopOpeBRepBuild_ListIteratorOfListOfLoop
	:param LOL:
	:type LOL: TopOpeBRepBuild_ListOfLoop
	:param s: default value is NULL
	:type s: Standard_Address
	:rtype: void") REM_Loop_FROM_LISTOFLoop;
		virtual void REM_Loop_FROM_LISTOFLoop (TopOpeBRepBuild_ListIteratorOfListOfLoop & ITLOL,TopOpeBRepBuild_ListOfLoop & LOL,const Standard_Address s = NULL);

		/****************** TopOpeBRepBuild_Area1dBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area1dBuilder;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_Area1dBuilder;
		 TopOpeBRepBuild_Area1dBuilder ();

		/****************** TopOpeBRepBuild_Area1dBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area1dBuilder;
		%feature("autodoc", "* Creates a Area1dBuilder to find the areas of the shapes described by <LS> using the classifier <LC>.
	:param LS:
	:type LS: TopOpeBRepBuild_PaveSet
	:param LC:
	:type LC: TopOpeBRepBuild_PaveClassifier
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None") TopOpeBRepBuild_Area1dBuilder;
		 TopOpeBRepBuild_Area1dBuilder (TopOpeBRepBuild_PaveSet & LS,TopOpeBRepBuild_PaveClassifier & LC,const Standard_Boolean ForceClass = Standard_False);

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
		/****************** InitAreaBuilder ******************/
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "* Sets a Area1dBuilder to find the areas of the shapes described by <LS> using the classifier <LC>.
	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: void") InitAreaBuilder;
		virtual void InitAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);

		/****************** TopOpeBRepBuild_Area2dBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area2dBuilder;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_Area2dBuilder;
		 TopOpeBRepBuild_Area2dBuilder ();

		/****************** TopOpeBRepBuild_Area2dBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area2dBuilder;
		%feature("autodoc", "* Creates a Area2dBuilder to build faces on the (wires,blocks of edge) of <LS>, using the classifier <LC>.
	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None") TopOpeBRepBuild_Area2dBuilder;
		 TopOpeBRepBuild_Area2dBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);

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
		/****************** InitAreaBuilder ******************/
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "* Sets a Area1dBuilder to find the areas of the shapes described by <LS> using the classifier <LC>.
	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: void") InitAreaBuilder;
		virtual void InitAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);

		/****************** TopOpeBRepBuild_Area3dBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area3dBuilder;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_Area3dBuilder;
		 TopOpeBRepBuild_Area3dBuilder ();

		/****************** TopOpeBRepBuild_Area3dBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_Area3dBuilder;
		%feature("autodoc", "* Creates a Area3dBuilder to build Solids on the (shells,blocks of face) of <LS>, using the classifier <LC>.
	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None") TopOpeBRepBuild_Area3dBuilder;
		 TopOpeBRepBuild_Area3dBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);

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
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Removes all splits and merges already performed. Does NOT clear the handled DS (except ShapeWithStatesMaps).
	:rtype: void") Clear;
		virtual void Clear ();

		/****************** CorrectResult2d ******************/
		%feature("compactdefaultargs") CorrectResult2d;
		%feature("autodoc", ":param aResult:
	:type aResult: TopoDS_Shape
	:rtype: int") CorrectResult2d;
		Standard_Integer CorrectResult2d (TopoDS_Shape & aResult);

		/****************** GFillEdgeNotSameDomWES ******************/
		%feature("compactdefaultargs") GFillEdgeNotSameDomWES;
		%feature("autodoc", ":param E1:
	:type E1: TopoDS_Shape
	:param LSO2:
	:type LSO2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:rtype: None") GFillEdgeNotSameDomWES;
		void GFillEdgeNotSameDomWES (const TopoDS_Shape & E1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillEdgeSameDomWES ******************/
		%feature("compactdefaultargs") GFillEdgeSameDomWES;
		%feature("autodoc", ":param E1:
	:type E1: TopoDS_Shape
	:param LSO2:
	:type LSO2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:rtype: None") GFillEdgeSameDomWES;
		void GFillEdgeSameDomWES (const TopoDS_Shape & E1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillFaceNotSameDomSFS ******************/
		%feature("compactdefaultargs") GFillFaceNotSameDomSFS;
		%feature("autodoc", ":param F1:
	:type F1: TopoDS_Shape
	:param LSO2:
	:type LSO2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet
	:rtype: None") GFillFaceNotSameDomSFS;
		void GFillFaceNotSameDomSFS (const TopoDS_Shape & F1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillFaceNotSameDomWES ******************/
		%feature("compactdefaultargs") GFillFaceNotSameDomWES;
		%feature("autodoc", ":param F1:
	:type F1: TopoDS_Shape
	:param LSO2:
	:type LSO2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:rtype: None") GFillFaceNotSameDomWES;
		void GFillFaceNotSameDomWES (const TopoDS_Shape & F1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillFaceSameDomSFS ******************/
		%feature("compactdefaultargs") GFillFaceSameDomSFS;
		%feature("autodoc", ":param F1:
	:type F1: TopoDS_Shape
	:param LSO2:
	:type LSO2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet
	:rtype: None") GFillFaceSameDomSFS;
		void GFillFaceSameDomSFS (const TopoDS_Shape & F1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillFaceSameDomWES ******************/
		%feature("compactdefaultargs") GFillFaceSameDomWES;
		%feature("autodoc", ":param F1:
	:type F1: TopoDS_Shape
	:param LSO2:
	:type LSO2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:rtype: None") GFillFaceSameDomWES;
		void GFillFaceSameDomWES (const TopoDS_Shape & F1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillShellSFS ******************/
		%feature("compactdefaultargs") GFillShellSFS;
		%feature("autodoc", ":param SH1:
	:type SH1: TopoDS_Shape
	:param LSO2:
	:type LSO2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet
	:rtype: void") GFillShellSFS;
		virtual void GFillShellSFS (const TopoDS_Shape & SH1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillSolidSFS ******************/
		%feature("compactdefaultargs") GFillSolidSFS;
		%feature("autodoc", ":param SO1:
	:type SO1: TopoDS_Shape
	:param LSO2:
	:type LSO2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet
	:rtype: void") GFillSolidSFS;
		virtual void GFillSolidSFS (const TopoDS_Shape & SO1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);

		/****************** GFillWireNotSameDomWES ******************/
		%feature("compactdefaultargs") GFillWireNotSameDomWES;
		%feature("autodoc", ":param W1:
	:type W1: TopoDS_Shape
	:param LSO2:
	:type LSO2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:rtype: None") GFillWireNotSameDomWES;
		void GFillWireNotSameDomWES (const TopoDS_Shape & W1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GFillWireSameDomWES ******************/
		%feature("compactdefaultargs") GFillWireSameDomWES;
		%feature("autodoc", ":param W1:
	:type W1: TopoDS_Shape
	:param LSO2:
	:type LSO2: TopTools_ListOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:rtype: None") GFillWireSameDomWES;
		void GFillWireSameDomWES (const TopoDS_Shape & W1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** GWESMakeFaces ******************/
		%feature("compactdefaultargs") GWESMakeFaces;
		%feature("autodoc", ":param FF:
	:type FF: TopoDS_Shape
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:param LOF:
	:type LOF: TopTools_ListOfShape
	:rtype: void") GWESMakeFaces;
		virtual void GWESMakeFaces (const TopoDS_Shape & FF,TopOpeBRepBuild_WireEdgeSet & WES,TopTools_ListOfShape & LOF);

		/****************** MergeKPart ******************/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", ":rtype: void") MergeKPart;
		virtual void MergeKPart ();

		/****************** MergeKPart ******************/
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", ":param TB1:
	:type TB1: TopAbs_State
	:param TB2:
	:type TB2: TopAbs_State
	:rtype: void") MergeKPart;
		virtual void MergeKPart (const TopAbs_State TB1,const TopAbs_State TB2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:rtype: void") Perform;
		virtual void Perform (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param HDS:
	:type HDS: TopOpeBRepDS_HDataStructure
	:param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: void") Perform;
		virtual void Perform (const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS,const TopoDS_Shape & S1,const TopoDS_Shape & S2);

		/****************** PerformONParts ******************/
		%feature("compactdefaultargs") PerformONParts;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Shape
	:param SDfaces:
	:type SDfaces: TopTools_IndexedMapOfShape
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet
	:rtype: None") PerformONParts;
		void PerformONParts (const TopoDS_Shape & F,const TopTools_IndexedMapOfShape & SDfaces,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);

		/****************** PerformPieceIn2D ******************/
		%feature("compactdefaultargs") PerformPieceIn2D;
		%feature("autodoc", ":param aPieceToPerform:
	:type aPieceToPerform: TopoDS_Edge
	:param aOriginalEdge:
	:type aOriginalEdge: TopoDS_Edge
	:param edgeFace:
	:type edgeFace: TopoDS_Face
	:param toFace:
	:type toFace: TopoDS_Face
	:param G:
	:type G: TopOpeBRepBuild_GTopo
	:param keep:
	:type keep: bool
	:rtype: None") PerformPieceIn2D;
		void PerformPieceIn2D (const TopoDS_Edge & aPieceToPerform,const TopoDS_Edge & aOriginalEdge,const TopoDS_Face & edgeFace,const TopoDS_Face & toFace,const TopOpeBRepBuild_GTopo & G,Standard_Boolean &OutValue);

		/****************** PerformPieceOn2D ******************/
		%feature("compactdefaultargs") PerformPieceOn2D;
		%feature("autodoc", ":param aPieceObj:
	:type aPieceObj: TopoDS_Shape
	:param aFaceObj:
	:type aFaceObj: TopoDS_Shape
	:param aEdgeObj:
	:type aEdgeObj: TopoDS_Shape
	:param aListOfPieces:
	:type aListOfPieces: TopTools_ListOfShape
	:param aListOfFaces:
	:type aListOfFaces: TopTools_ListOfShape
	:param aListOfPiecesOut2d:
	:type aListOfPiecesOut2d: TopTools_ListOfShape
	:rtype: int") PerformPieceOn2D;
		Standard_Integer PerformPieceOn2D (const TopoDS_Shape & aPieceObj,const TopoDS_Shape & aFaceObj,const TopoDS_Shape & aEdgeObj,TopTools_ListOfShape & aListOfPieces,TopTools_ListOfShape & aListOfFaces,TopTools_ListOfShape & aListOfPiecesOut2d);

		/****************** TopOpeBRepBuild_Builder1 ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_Builder1;
		%feature("autodoc", ":param BT:
	:type BT: TopOpeBRepDS_BuildTool
	:rtype: None") TopOpeBRepBuild_Builder1;
		 TopOpeBRepBuild_Builder1 (const TopOpeBRepDS_BuildTool & BT);

		/****************** TwoPiecesON ******************/
		%feature("compactdefaultargs") TwoPiecesON;
		%feature("autodoc", ":param aSeq:
	:type aSeq: TopTools_SequenceOfShape
	:param aListOfPieces:
	:type aListOfPieces: TopTools_ListOfShape
	:param aListOfFaces:
	:type aListOfFaces: TopTools_ListOfShape
	:param aListOfPiecesOut2d:
	:type aListOfPiecesOut2d: TopTools_ListOfShape
	:rtype: int") TwoPiecesON;
		Standard_Integer TwoPiecesON (const TopTools_SequenceOfShape & aSeq,TopTools_ListOfShape & aListOfPieces,TopTools_ListOfShape & aListOfFaces,TopTools_ListOfShape & aListOfPiecesOut2d);

};


%extend TopOpeBRepBuild_Builder1 {
	%pythoncode {
	__repr__ = _dumps_object
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
		%feature("autodoc", ":param L1:
	:type L1: TopOpeBRepBuild_Loop
	:param L2:
	:type L2: TopOpeBRepBuild_Loop
	:rtype: TopAbs_State") Compare;
		virtual TopAbs_State Compare (const opencascade::handle<TopOpeBRepBuild_Loop> & L1,const opencascade::handle<TopOpeBRepBuild_Loop> & L2);

		/****************** CompareElement ******************/
		%feature("compactdefaultargs") CompareElement;
		%feature("autodoc", "* Add element <E> in the set of elements used in classification. Returns False if the element <E> has been already added to the set of elements, otherwise returns True.
	:param E:
	:type E: TopoDS_Shape
	:rtype: bool") CompareElement;
		virtual Standard_Boolean CompareElement (const TopoDS_Shape & E);

		/****************** CompareElementToShape ******************/
		%feature("compactdefaultargs") CompareElementToShape;
		%feature("autodoc", "* classify element <E> with shape <B>
	:param E:
	:type E: TopoDS_Shape
	:param B:
	:type B: TopoDS_Shape
	:rtype: TopAbs_State") CompareElementToShape;
		virtual TopAbs_State CompareElementToShape (const TopoDS_Shape & E,const TopoDS_Shape & B);

		/****************** CompareShapes ******************/
		%feature("compactdefaultargs") CompareShapes;
		%feature("autodoc", "* classify shape <B1> with shape <B2>
	:param B1:
	:type B1: TopoDS_Shape
	:param B2:
	:type B2: TopoDS_Shape
	:rtype: TopAbs_State") CompareShapes;
		virtual TopAbs_State CompareShapes (const TopoDS_Shape & B1,const TopoDS_Shape & B2);

		/****************** ResetElement ******************/
		%feature("compactdefaultargs") ResetElement;
		%feature("autodoc", "* prepare classification involving element <E>.
	:param E:
	:type E: TopoDS_Shape
	:rtype: void") ResetElement;
		virtual void ResetElement (const TopoDS_Shape & E);

		/****************** ResetShape ******************/
		%feature("compactdefaultargs") ResetShape;
		%feature("autodoc", "* prepare classification involving shape <B> calls ResetElement on first element of <B>
	:param B:
	:type B: TopoDS_Shape
	:rtype: void") ResetShape;
		virtual void ResetShape (const TopoDS_Shape & B);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "* Returns state of classification of 2D point, defined by ResetElement, with the current set of elements, defined by Compare.
	:rtype: TopAbs_State") State;
		virtual TopAbs_State State ();

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
		/****************** ChangeVertex ******************/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", ":rtype: TopoDS_Shape") ChangeVertex;
		TopoDS_Shape  ChangeVertex ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: void") Dump;
		virtual void Dump ();

		/****************** HasSameDomain ******************/
		%feature("compactdefaultargs") HasSameDomain;
		%feature("autodoc", ":param b:
	:type b: bool
	:rtype: None") HasSameDomain;
		void HasSameDomain (const Standard_Boolean b);

		/****************** HasSameDomain ******************/
		%feature("compactdefaultargs") HasSameDomain;
		%feature("autodoc", ":rtype: bool") HasSameDomain;
		Standard_Boolean HasSameDomain ();

		/****************** InterferenceType ******************/
		%feature("compactdefaultargs") InterferenceType;
		%feature("autodoc", ":rtype: TopOpeBRepDS_Kind") InterferenceType;
		TopOpeBRepDS_Kind & InterferenceType ();

		/****************** IsShape ******************/
		%feature("compactdefaultargs") IsShape;
		%feature("autodoc", ":rtype: bool") IsShape;
		virtual Standard_Boolean IsShape ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param Par:
	:type Par: float
	:rtype: None") Parameter;
		void Parameter (const Standard_Real Par);

		/****************** SameDomain ******************/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", ":param VSD:
	:type VSD: TopoDS_Shape
	:rtype: None") SameDomain;
		void SameDomain (const TopoDS_Shape & VSD);

		/****************** SameDomain ******************/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", ":rtype: TopoDS_Shape") SameDomain;
		const TopoDS_Shape  SameDomain ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		virtual const TopoDS_Shape  Shape ();

		/****************** TopOpeBRepBuild_Pave ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_Pave;
		%feature("autodoc", "* V = vertex, P = parameter of vertex <V> bound = True if <V> is an old vertex bound = False if <V> is a new vertex
	:param V:
	:type V: TopoDS_Shape
	:param P:
	:type P: float
	:param bound:
	:type bound: bool
	:rtype: None") TopOpeBRepBuild_Pave;
		 TopOpeBRepBuild_Pave (const TopoDS_Shape & V,const Standard_Real P,const Standard_Boolean bound);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":rtype: TopoDS_Shape") Vertex;
		const TopoDS_Shape  Vertex ();

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
		/****************** AdjustCase ******************/
		%feature("compactdefaultargs") AdjustCase;
		%feature("autodoc", ":param p1:
	:type p1: float
	:param o:
	:type o: TopAbs_Orientation
	:param first:
	:type first: float
	:param period:
	:type period: float
	:param tol:
	:type tol: float
	:param cas:
	:type cas: int
	:rtype: float") AdjustCase;
		static Standard_Real AdjustCase (const Standard_Real p1,const TopAbs_Orientation o,const Standard_Real first,const Standard_Real period,const Standard_Real tol,Standard_Integer &OutValue);

		/****************** ClosedVertices ******************/
		%feature("compactdefaultargs") ClosedVertices;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") ClosedVertices;
		void ClosedVertices (const Standard_Boolean B);

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "* Returns state of vertex <L1> compared with <L2>.
	:param L1:
	:type L1: TopOpeBRepBuild_Loop
	:param L2:
	:type L2: TopOpeBRepBuild_Loop
	:rtype: TopAbs_State") Compare;
		TopAbs_State Compare (const opencascade::handle<TopOpeBRepBuild_Loop> & L1,const opencascade::handle<TopOpeBRepBuild_Loop> & L2);

		/****************** SetFirstParameter ******************/
		%feature("compactdefaultargs") SetFirstParameter;
		%feature("autodoc", ":param P:
	:type P: float
	:rtype: None") SetFirstParameter;
		void SetFirstParameter (const Standard_Real P);

		/****************** TopOpeBRepBuild_PaveClassifier ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_PaveClassifier;
		%feature("autodoc", "* Create a Pave classifier to compare vertices on edge <E>.
	:param E:
	:type E: TopoDS_Shape
	:rtype: None") TopOpeBRepBuild_PaveClassifier;
		 TopOpeBRepBuild_PaveClassifier (const TopoDS_Shape & E);

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
		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "* Add <PV> in the Pave set.
	:param PV:
	:type PV: TopOpeBRepBuild_Pave
	:rtype: None") Append;
		void Append (const opencascade::handle<TopOpeBRepBuild_Pave> & PV);

		/****************** ClosedVertices ******************/
		%feature("compactdefaultargs") ClosedVertices;
		%feature("autodoc", ":rtype: bool") ClosedVertices;
		Standard_Boolean ClosedVertices ();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":rtype: TopoDS_Edge") Edge;
		const TopoDS_Edge  Edge ();

		/****************** EqualParameters ******************/
		%feature("compactdefaultargs") EqualParameters;
		%feature("autodoc", ":rtype: float") EqualParameters;
		Standard_Real EqualParameters ();

		/****************** HasEqualParameters ******************/
		%feature("compactdefaultargs") HasEqualParameters;
		%feature("autodoc", ":rtype: bool") HasEqualParameters;
		Standard_Boolean HasEqualParameters ();

		/****************** InitLoop ******************/
		%feature("compactdefaultargs") InitLoop;
		%feature("autodoc", ":rtype: void") InitLoop;
		virtual void InitLoop ();

		/****************** Loop ******************/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", ":rtype: opencascade::handle<TopOpeBRepBuild_Loop>") Loop;
		virtual opencascade::handle<TopOpeBRepBuild_Loop> Loop ();

		/****************** MoreLoop ******************/
		%feature("compactdefaultargs") MoreLoop;
		%feature("autodoc", ":rtype: bool") MoreLoop;
		virtual Standard_Boolean MoreLoop ();

		/****************** NextLoop ******************/
		%feature("compactdefaultargs") NextLoop;
		%feature("autodoc", ":rtype: void") NextLoop;
		virtual void NextLoop ();

		/****************** RemovePV ******************/
		%feature("compactdefaultargs") RemovePV;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") RemovePV;
		void RemovePV (const Standard_Boolean B);

		/****************** SortPave ******************/
		%feature("compactdefaultargs") SortPave;
		%feature("autodoc", ":param Lin:
	:type Lin: TopOpeBRepBuild_ListOfPave
	:param Lout:
	:type Lout: TopOpeBRepBuild_ListOfPave
	:rtype: void") SortPave;
		static void SortPave (const TopOpeBRepBuild_ListOfPave & Lin,TopOpeBRepBuild_ListOfPave & Lout);

		/****************** TopOpeBRepBuild_PaveSet ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_PaveSet;
		%feature("autodoc", "* Create a Pave set on edge <E>. It contains <E> vertices.
	:param E:
	:type E: TopoDS_Shape
	:rtype: None") TopOpeBRepBuild_PaveSet;
		 TopOpeBRepBuild_PaveSet (const TopoDS_Shape & E);

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
		/****************** AddElement ******************/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: void") AddElement;
		virtual void AddElement (const TopoDS_Shape & S);

		/****************** AddShape ******************/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: void") AddShape;
		virtual void AddShape (const TopoDS_Shape & S);

		/****************** AddStartElement ******************/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: void") AddStartElement;
		virtual void AddStartElement (const TopoDS_Shape & S);

		/****************** DumpSS ******************/
		%feature("compactdefaultargs") DumpSS;
		%feature("autodoc", ":rtype: void") DumpSS;
		virtual void DumpSS ();

		/****************** SName ******************/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param sb: default value is ""
	:type sb: TCollection_AsciiString
	:param sa: default value is ""
	:type sa: TCollection_AsciiString
	:rtype: TCollection_AsciiString") SName;
		virtual TCollection_AsciiString SName (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");

		/****************** SName ******************/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", ":param S:
	:type S: TopTools_ListOfShape
	:param sb: default value is ""
	:type sb: TCollection_AsciiString
	:param sa: default value is ""
	:type sa: TCollection_AsciiString
	:rtype: TCollection_AsciiString") SName;
		virtual TCollection_AsciiString SName (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");

		/****************** SNameori ******************/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param sb: default value is ""
	:type sb: TCollection_AsciiString
	:param sa: default value is ""
	:type sa: TCollection_AsciiString
	:rtype: TCollection_AsciiString") SNameori;
		virtual TCollection_AsciiString SNameori (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");

		/****************** SNameori ******************/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", ":param S:
	:type S: TopTools_ListOfShape
	:param sb: default value is ""
	:type sb: TCollection_AsciiString
	:param sa: default value is ""
	:type sa: TCollection_AsciiString
	:rtype: TCollection_AsciiString") SNameori;
		virtual TCollection_AsciiString SNameori (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");

		/****************** Solid ******************/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", ":rtype: TopoDS_Solid") Solid;
		const TopoDS_Solid  Solid ();

		/****************** TopOpeBRepBuild_ShellFaceSet ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellFaceSet;
		%feature("autodoc", "* Creates a ShellFaceSet to build blocks of faces connected by edges.
	:rtype: None") TopOpeBRepBuild_ShellFaceSet;
		 TopOpeBRepBuild_ShellFaceSet ();

		/****************** TopOpeBRepBuild_ShellFaceSet ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellFaceSet;
		%feature("autodoc", "* Creates a ShellFaceSet to build blocks of faces connected by edges.
	:param S:
	:type S: TopoDS_Shape
	:param Addr: default value is NULL
	:type Addr: Standard_Address
	:rtype: None") TopOpeBRepBuild_ShellFaceSet;
		 TopOpeBRepBuild_ShellFaceSet (const TopoDS_Shape & S,const Standard_Address Addr = NULL);

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
		/****************** AddElement ******************/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: void") AddElement;
		virtual void AddElement (const TopoDS_Shape & S);

		/****************** AddShape ******************/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: void") AddShape;
		virtual void AddShape (const TopoDS_Shape & S);

		/****************** AddStartElement ******************/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: void") AddStartElement;
		virtual void AddStartElement (const TopoDS_Shape & S);

		/****************** DumpSS ******************/
		%feature("compactdefaultargs") DumpSS;
		%feature("autodoc", ":rtype: void") DumpSS;
		virtual void DumpSS ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* value of field myFace
	:rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face ();

		/****************** FindNeighbours ******************/
		%feature("compactdefaultargs") FindNeighbours;
		%feature("autodoc", "* Build the list of neighbour edges of edge myCurrentShape Initialize iterator of neighbour edges to edge myCurrentShape
	:rtype: void") FindNeighbours;
		virtual void FindNeighbours ();

		/****************** InitNeighbours ******************/
		%feature("compactdefaultargs") InitNeighbours;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:rtype: void") InitNeighbours;
		virtual void InitNeighbours (const TopoDS_Shape & E);

		/****************** IsUVISO ******************/
		%feature("compactdefaultargs") IsUVISO;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param uiso:
	:type uiso: bool
	:param viso:
	:type viso: bool
	:rtype: void") IsUVISO;
		static void IsUVISO (const TopoDS_Edge & E,const TopoDS_Face & F,Standard_Boolean &OutValue,Standard_Boolean &OutValue);

		/****************** MakeNeighboursList ******************/
		%feature("compactdefaultargs") MakeNeighboursList;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Shape
	:param V:
	:type V: TopoDS_Shape
	:rtype: TopTools_ListOfShape") MakeNeighboursList;
		virtual const TopTools_ListOfShape & MakeNeighboursList (const TopoDS_Shape & E,const TopoDS_Shape & V);

		/****************** SName ******************/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param sb: default value is ""
	:type sb: TCollection_AsciiString
	:param sa: default value is ""
	:type sa: TCollection_AsciiString
	:rtype: TCollection_AsciiString") SName;
		virtual TCollection_AsciiString SName (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");

		/****************** SName ******************/
		%feature("compactdefaultargs") SName;
		%feature("autodoc", ":param S:
	:type S: TopTools_ListOfShape
	:param sb: default value is ""
	:type sb: TCollection_AsciiString
	:param sa: default value is ""
	:type sa: TCollection_AsciiString
	:rtype: TCollection_AsciiString") SName;
		virtual TCollection_AsciiString SName (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");

		/****************** SNameori ******************/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param sb: default value is ""
	:type sb: TCollection_AsciiString
	:param sa: default value is ""
	:type sa: TCollection_AsciiString
	:rtype: TCollection_AsciiString") SNameori;
		virtual TCollection_AsciiString SNameori (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");

		/****************** SNameori ******************/
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", ":param S:
	:type S: TopTools_ListOfShape
	:param sb: default value is ""
	:type sb: TCollection_AsciiString
	:param sa: default value is ""
	:type sa: TCollection_AsciiString
	:rtype: TCollection_AsciiString") SNameori;
		virtual TCollection_AsciiString SNameori (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");

		/****************** TopOpeBRepBuild_WireEdgeSet ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_WireEdgeSet;
		%feature("autodoc", "* Creates a WireEdgeSet to build edges connected by vertices on face F. Edges of the WireEdgeSet must have a representation on surface of face F.
	:param F:
	:type F: TopoDS_Shape
	:param Addr: default value is NULL
	:type Addr: Standard_Address
	:rtype: None") TopOpeBRepBuild_WireEdgeSet;
		 TopOpeBRepBuild_WireEdgeSet (const TopoDS_Shape & F,const Standard_Address Addr = NULL);

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
		/****************** InitEdge ******************/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", ":rtype: None") InitEdge;
		void InitEdge ();

		/****************** InitEdgeBuilder ******************/
		%feature("compactdefaultargs") InitEdgeBuilder;
		%feature("autodoc", ":param LS:
	:type LS: TopOpeBRepBuild_LoopSet
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None") InitEdgeBuilder;
		void InitEdgeBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);

		/****************** InitVertex ******************/
		%feature("compactdefaultargs") InitVertex;
		%feature("autodoc", ":rtype: None") InitVertex;
		void InitVertex ();

		/****************** MoreEdge ******************/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", ":rtype: bool") MoreEdge;
		Standard_Boolean MoreEdge ();

		/****************** MoreVertex ******************/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", ":rtype: bool") MoreVertex;
		Standard_Boolean MoreVertex ();

		/****************** NextEdge ******************/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", ":rtype: None") NextEdge;
		void NextEdge ();

		/****************** NextVertex ******************/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", ":rtype: None") NextVertex;
		void NextVertex ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** TopOpeBRepBuild_EdgeBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_EdgeBuilder;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_EdgeBuilder;
		 TopOpeBRepBuild_EdgeBuilder ();

		/****************** TopOpeBRepBuild_EdgeBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_EdgeBuilder;
		%feature("autodoc", "* Creates a EdgeBuilder to find the areas of the shapes described by <LS> using the classifier <LC>.
	:param LS:
	:type LS: TopOpeBRepBuild_PaveSet
	:param LC:
	:type LC: TopOpeBRepBuild_PaveClassifier
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None") TopOpeBRepBuild_EdgeBuilder;
		 TopOpeBRepBuild_EdgeBuilder (TopOpeBRepBuild_PaveSet & LS,TopOpeBRepBuild_PaveClassifier & LC,const Standard_Boolean ForceClass = Standard_False);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":rtype: TopoDS_Shape") Vertex;
		const TopoDS_Shape  Vertex ();

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
		/****************** InitFaceAreaBuilder ******************/
		%feature("compactdefaultargs") InitFaceAreaBuilder;
		%feature("autodoc", ":param LS:
	:type LS: TopOpeBRepBuild_LoopSet
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None") InitFaceAreaBuilder;
		void InitFaceAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);

		/****************** TopOpeBRepBuild_FaceAreaBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceAreaBuilder;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_FaceAreaBuilder;
		 TopOpeBRepBuild_FaceAreaBuilder ();

		/****************** TopOpeBRepBuild_FaceAreaBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceAreaBuilder;
		%feature("autodoc", "* Creates a FaceAreaBuilder to build faces on the (wires,blocks of edge) of <LS>, using the classifier <LC>.
	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None") TopOpeBRepBuild_FaceAreaBuilder;
		 TopOpeBRepBuild_FaceAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);

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
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** CompareElement ******************/
		%feature("compactdefaultargs") CompareElement;
		%feature("autodoc", "* Add the face <F> in the set of faces used in 3D point classification. Returns False if the face <F> has been already added to the set of faces, otherwise returns True.
	:param F:
	:type F: TopoDS_Shape
	:rtype: bool") CompareElement;
		Standard_Boolean CompareElement (const TopoDS_Shape & F);

		/****************** CompareElementToShape ******************/
		%feature("compactdefaultargs") CompareElementToShape;
		%feature("autodoc", "* classify face <F> with shell <S>
	:param F:
	:type F: TopoDS_Shape
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopAbs_State") CompareElementToShape;
		TopAbs_State CompareElementToShape (const TopoDS_Shape & F,const TopoDS_Shape & S);

		/****************** CompareShapes ******************/
		%feature("compactdefaultargs") CompareShapes;
		%feature("autodoc", "* classify shell <B1> with shell <B2>
	:param B1:
	:type B1: TopoDS_Shape
	:param B2:
	:type B2: TopoDS_Shape
	:rtype: TopAbs_State") CompareShapes;
		TopAbs_State CompareShapes (const TopoDS_Shape & B1,const TopoDS_Shape & B2);

		/****************** ResetElement ******************/
		%feature("compactdefaultargs") ResetElement;
		%feature("autodoc", "* prepare classification involving face <F> define 3D point (later used in Compare()) on first vertex of face <F>.
	:param F:
	:type F: TopoDS_Shape
	:rtype: None") ResetElement;
		void ResetElement (const TopoDS_Shape & F);

		/****************** ResetShape ******************/
		%feature("compactdefaultargs") ResetShape;
		%feature("autodoc", "* prepare classification involving shell <S> calls ResetElement on first face of <S>
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") ResetShape;
		void ResetShape (const TopoDS_Shape & S);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "* Returns state of classification of 3D point, defined by ResetElement, with the current set of faces, defined by Compare.
	:rtype: TopAbs_State") State;
		TopAbs_State State ();

		/****************** TopOpeBRepBuild_ShellFaceClassifier ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellFaceClassifier;
		%feature("autodoc", "* Creates a classifier in 3D space, to compare : a face with a set of faces a shell with a set of faces a shell with a shell
	:param BB:
	:type BB: TopOpeBRepBuild_BlockBuilder
	:rtype: None") TopOpeBRepBuild_ShellFaceClassifier;
		 TopOpeBRepBuild_ShellFaceClassifier (const TopOpeBRepBuild_BlockBuilder & BB);

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
		/****************** InitSolidAreaBuilder ******************/
		%feature("compactdefaultargs") InitSolidAreaBuilder;
		%feature("autodoc", ":param LS:
	:type LS: TopOpeBRepBuild_LoopSet
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None") InitSolidAreaBuilder;
		void InitSolidAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);

		/****************** TopOpeBRepBuild_SolidAreaBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidAreaBuilder;
		%feature("autodoc", ":rtype: None") TopOpeBRepBuild_SolidAreaBuilder;
		 TopOpeBRepBuild_SolidAreaBuilder ();

		/****************** TopOpeBRepBuild_SolidAreaBuilder ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidAreaBuilder;
		%feature("autodoc", "* Creates a SolidAreaBuilder to build Solids on the (shells,blocks of face) of <LS>, using the classifier <LC>.
	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None") TopOpeBRepBuild_SolidAreaBuilder;
		 TopOpeBRepBuild_SolidAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);

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
		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", ":param L1:
	:type L1: TopOpeBRepBuild_Loop
	:param L2:
	:type L2: TopOpeBRepBuild_Loop
	:rtype: TopAbs_State") Compare;
		virtual TopAbs_State Compare (const opencascade::handle<TopOpeBRepBuild_Loop> & L1,const opencascade::handle<TopOpeBRepBuild_Loop> & L2);

		/****************** CompareElement ******************/
		%feature("compactdefaultargs") CompareElement;
		%feature("autodoc", "* Add the edge <E> in the set of edges used in 2D point classification.
	:param E:
	:type E: TopoDS_Shape
	:rtype: bool") CompareElement;
		Standard_Boolean CompareElement (const TopoDS_Shape & E);

		/****************** CompareElementToShape ******************/
		%feature("compactdefaultargs") CompareElementToShape;
		%feature("autodoc", "* classify edge <E> with wire <B>
	:param E:
	:type E: TopoDS_Shape
	:param B:
	:type B: TopoDS_Shape
	:rtype: TopAbs_State") CompareElementToShape;
		TopAbs_State CompareElementToShape (const TopoDS_Shape & E,const TopoDS_Shape & B);

		/****************** CompareShapes ******************/
		%feature("compactdefaultargs") CompareShapes;
		%feature("autodoc", "* classify wire <B1> with wire <B2>
	:param B1:
	:type B1: TopoDS_Shape
	:param B2:
	:type B2: TopoDS_Shape
	:rtype: TopAbs_State") CompareShapes;
		TopAbs_State CompareShapes (const TopoDS_Shape & B1,const TopoDS_Shape & B2);

		/****************** LoopToShape ******************/
		%feature("compactdefaultargs") LoopToShape;
		%feature("autodoc", ":param L:
	:type L: TopOpeBRepBuild_Loop
	:rtype: TopoDS_Shape") LoopToShape;
		TopoDS_Shape LoopToShape (const opencascade::handle<TopOpeBRepBuild_Loop> & L);

		/****************** ResetElement ******************/
		%feature("compactdefaultargs") ResetElement;
		%feature("autodoc", "* prepare classification involving edge <E> define 2D point (later used in Compare()) on first vertex of edge <E>.
	:param E:
	:type E: TopoDS_Shape
	:rtype: None") ResetElement;
		void ResetElement (const TopoDS_Shape & E);

		/****************** ResetShape ******************/
		%feature("compactdefaultargs") ResetShape;
		%feature("autodoc", "* prepare classification involving wire <B> calls ResetElement on first edge of <B>
	:param B:
	:type B: TopoDS_Shape
	:rtype: None") ResetShape;
		void ResetShape (const TopoDS_Shape & B);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "* Returns state of classification of 2D point, defined by ResetElement, with the current set of edges, defined by Compare.
	:rtype: TopAbs_State") State;
		TopAbs_State State ();

		/****************** TopOpeBRepBuild_WireEdgeClassifier ******************/
		%feature("compactdefaultargs") TopOpeBRepBuild_WireEdgeClassifier;
		%feature("autodoc", "* Creates a classifier on edge <F>. Used to compare edges and wires on the edge <F>.
	:param F:
	:type F: TopoDS_Shape
	:param BB:
	:type BB: TopOpeBRepBuild_BlockBuilder
	:rtype: None") TopOpeBRepBuild_WireEdgeClassifier;
		 TopOpeBRepBuild_WireEdgeClassifier (const TopoDS_Shape & F,const TopOpeBRepBuild_BlockBuilder & BB);

};


%extend TopOpeBRepBuild_WireEdgeClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
