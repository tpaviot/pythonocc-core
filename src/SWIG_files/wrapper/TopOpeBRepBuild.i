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
%module (package="OCC") TopOpeBRepBuild

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


%include TopOpeBRepBuild_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef TopOpeBRepBuild_GTopo * TopOpeBRepBuild_PGTopo;
typedef TopOpeBRepBuild_Builder * TopOpeBRepBuild_PBuilder;
typedef TopOpeBRepBuild_WireEdgeSet * TopOpeBRepBuild_PWireEdgeSet;
/* end typedefs declaration */

/* public enums */
enum TopOpeBRepBuild_LoopEnum {
	TopOpeBRepBuild_ANYLOOP = 0,
	TopOpeBRepBuild_BOUNDARY = 1,
	TopOpeBRepBuild_BLOCK = 2,
};

/* end public enums declaration */

%nodefaultctor TopOpeBRepBuild_AreaBuilder;
class TopOpeBRepBuild_AreaBuilder {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_AreaBuilder;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_AreaBuilder;
		 TopOpeBRepBuild_AreaBuilder ();
		%feature("compactdefaultargs") TopOpeBRepBuild_AreaBuilder;
		%feature("autodoc", "	* Creates a AreaBuilder to build the areas on the shapes described by <LS> using the classifier <LC>.

	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet &
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier &
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None
") TopOpeBRepBuild_AreaBuilder;
		 TopOpeBRepBuild_AreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "	* Sets a AreaBuilder to find the areas on the shapes described by <LS> using the classifier <LC>.

	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet &
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier &
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: void
") InitAreaBuilder;
		virtual void InitAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("compactdefaultargs") InitArea;
		%feature("autodoc", "	* Initialize iteration on areas.

	:rtype: int
") InitArea;
		Standard_Integer InitArea ();
		%feature("compactdefaultargs") MoreArea;
		%feature("autodoc", "	:rtype: bool
") MoreArea;
		Standard_Boolean MoreArea ();
		%feature("compactdefaultargs") NextArea;
		%feature("autodoc", "	:rtype: None
") NextArea;
		void NextArea ();
		%feature("compactdefaultargs") InitLoop;
		%feature("autodoc", "	* Initialize iteration on loops of current Area.

	:rtype: int
") InitLoop;
		Standard_Integer InitLoop ();
		%feature("compactdefaultargs") MoreLoop;
		%feature("autodoc", "	:rtype: bool
") MoreLoop;
		Standard_Boolean MoreLoop ();
		%feature("compactdefaultargs") NextLoop;
		%feature("autodoc", "	:rtype: None
") NextLoop;
		void NextLoop ();
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "	* Returns the current Loop in the current area.

	:rtype: Handle_TopOpeBRepBuild_Loop
") Loop;
		Handle_TopOpeBRepBuild_Loop Loop ();
		%feature("compactdefaultargs") ADD_Loop_TO_LISTOFLoop;
		%feature("autodoc", "	:param L:
	:type L: Handle_TopOpeBRepBuild_Loop &
	:param LOL:
	:type LOL: TopOpeBRepBuild_ListOfLoop &
	:param s: default value is NULL
	:type s: Standard_Address
	:rtype: void
") ADD_Loop_TO_LISTOFLoop;
		virtual void ADD_Loop_TO_LISTOFLoop (const Handle_TopOpeBRepBuild_Loop & L,TopOpeBRepBuild_ListOfLoop & LOL,const Standard_Address s = NULL);
		%feature("compactdefaultargs") REM_Loop_FROM_LISTOFLoop;
		%feature("autodoc", "	:param ITLOL:
	:type ITLOL: TopOpeBRepBuild_ListIteratorOfListOfLoop &
	:param LOL:
	:type LOL: TopOpeBRepBuild_ListOfLoop &
	:param s: default value is NULL
	:type s: Standard_Address
	:rtype: void
") REM_Loop_FROM_LISTOFLoop;
		virtual void REM_Loop_FROM_LISTOFLoop (TopOpeBRepBuild_ListIteratorOfListOfLoop & ITLOL,TopOpeBRepBuild_ListOfLoop & LOL,const Standard_Address s = NULL);
		%feature("compactdefaultargs") ADD_LISTOFLoop_TO_LISTOFLoop;
		%feature("autodoc", "	:param LOL1:
	:type LOL1: TopOpeBRepBuild_ListOfLoop &
	:param LOL2:
	:type LOL2: TopOpeBRepBuild_ListOfLoop &
	:param s: default value is NULL
	:type s: Standard_Address
	:param s1: default value is NULL
	:type s1: Standard_Address
	:param s2: default value is NULL
	:type s2: Standard_Address
	:rtype: void
") ADD_LISTOFLoop_TO_LISTOFLoop;
		virtual void ADD_LISTOFLoop_TO_LISTOFLoop (TopOpeBRepBuild_ListOfLoop & LOL1,TopOpeBRepBuild_ListOfLoop & LOL2,const Standard_Address s = NULL,const Standard_Address s1 = NULL,const Standard_Address s2 = NULL);
};


%extend TopOpeBRepBuild_AreaBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_BlockBuilder;
class TopOpeBRepBuild_BlockBuilder {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockBuilder;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_BlockBuilder;
		 TopOpeBRepBuild_BlockBuilder ();
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockBuilder;
		%feature("autodoc", "	:param SS:
	:type SS: TopOpeBRepBuild_ShapeSet &
	:rtype: None
") TopOpeBRepBuild_BlockBuilder;
		 TopOpeBRepBuild_BlockBuilder (TopOpeBRepBuild_ShapeSet & SS);
		%feature("compactdefaultargs") MakeBlock;
		%feature("autodoc", "	:param SS:
	:type SS: TopOpeBRepBuild_ShapeSet &
	:rtype: None
") MakeBlock;
		void MakeBlock (TopOpeBRepBuild_ShapeSet & SS);
		%feature("compactdefaultargs") InitBlock;
		%feature("autodoc", "	:rtype: None
") InitBlock;
		void InitBlock ();
		%feature("compactdefaultargs") MoreBlock;
		%feature("autodoc", "	:rtype: bool
") MoreBlock;
		Standard_Boolean MoreBlock ();
		%feature("compactdefaultargs") NextBlock;
		%feature("autodoc", "	:rtype: None
") NextBlock;
		void NextBlock ();
		%feature("compactdefaultargs") BlockIterator;
		%feature("autodoc", "	:rtype: TopOpeBRepBuild_BlockIterator
") BlockIterator;
		TopOpeBRepBuild_BlockIterator BlockIterator ();
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "	* Returns the current element of <BI>.

	:param BI:
	:type BI: TopOpeBRepBuild_BlockIterator &
	:rtype: TopoDS_Shape
") Element;
		const TopoDS_Shape  Element (const TopOpeBRepBuild_BlockIterator & BI);
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopoDS_Shape
") Element;
		const TopoDS_Shape  Element (const Standard_Integer I);
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: int
") Element;
		Standard_Integer Element (const TopoDS_Shape & S);
		%feature("compactdefaultargs") ElementIsValid;
		%feature("autodoc", "	:param BI:
	:type BI: TopOpeBRepBuild_BlockIterator &
	:rtype: bool
") ElementIsValid;
		Standard_Boolean ElementIsValid (const TopOpeBRepBuild_BlockIterator & BI);
		%feature("compactdefaultargs") ElementIsValid;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: bool
") ElementIsValid;
		Standard_Boolean ElementIsValid (const Standard_Integer I);
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: int
") AddElement;
		Standard_Integer AddElement (const TopoDS_Shape & S);
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "	:param BI:
	:type BI: TopOpeBRepBuild_BlockIterator &
	:param isvalid:
	:type isvalid: bool
	:rtype: None
") SetValid;
		void SetValid (const TopOpeBRepBuild_BlockIterator & BI,const Standard_Boolean isvalid);
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "	:param I:
	:type I: int
	:param isvalid:
	:type isvalid: bool
	:rtype: None
") SetValid;
		void SetValid (const Standard_Integer I,const Standard_Boolean isvalid);
		%feature("compactdefaultargs") CurrentBlockIsRegular;
		%feature("autodoc", "	:rtype: bool
") CurrentBlockIsRegular;
		Standard_Boolean CurrentBlockIsRegular ();
};


%extend TopOpeBRepBuild_BlockBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_BlockIterator;
class TopOpeBRepBuild_BlockIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockIterator;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_BlockIterator;
		 TopOpeBRepBuild_BlockIterator ();
		%feature("compactdefaultargs") TopOpeBRepBuild_BlockIterator;
		%feature("autodoc", "	:param Lower:
	:type Lower: int
	:param Upper:
	:type Upper: int
	:rtype: None
") TopOpeBRepBuild_BlockIterator;
		 TopOpeBRepBuild_BlockIterator (const Standard_Integer Lower,const Standard_Integer Upper);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:rtype: None
") Initialize;
		void Initialize ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: int
") Value;
		Standard_Integer Value ();
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
};


%extend TopOpeBRepBuild_BlockIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_BuilderON;
class TopOpeBRepBuild_BuilderON {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_BuilderON;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_BuilderON;
		 TopOpeBRepBuild_BuilderON ();
		%feature("compactdefaultargs") TopOpeBRepBuild_BuilderON;
		%feature("autodoc", "	:param PB:
	:type PB: TopOpeBRepBuild_PBuilder &
	:param F:
	:type F: TopoDS_Shape &
	:param PG:
	:type PG: TopOpeBRepBuild_PGTopo &
	:param PLSclass:
	:type PLSclass: TopOpeBRepTool_Plos &
	:param PWES:
	:type PWES: TopOpeBRepBuild_PWireEdgeSet &
	:rtype: None
") TopOpeBRepBuild_BuilderON;
		 TopOpeBRepBuild_BuilderON (const TopOpeBRepBuild_PBuilder & PB,const TopoDS_Shape & F,const TopOpeBRepBuild_PGTopo & PG,const TopOpeBRepTool_Plos & PLSclass,const TopOpeBRepBuild_PWireEdgeSet & PWES);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param PB:
	:type PB: TopOpeBRepBuild_PBuilder &
	:param F:
	:type F: TopoDS_Shape &
	:param PG:
	:type PG: TopOpeBRepBuild_PGTopo &
	:param PLSclass:
	:type PLSclass: TopOpeBRepTool_Plos &
	:param PWES:
	:type PWES: TopOpeBRepBuild_PWireEdgeSet &
	:rtype: None
") Perform;
		void Perform (const TopOpeBRepBuild_PBuilder & PB,const TopoDS_Shape & F,const TopOpeBRepBuild_PGTopo & PG,const TopOpeBRepTool_Plos & PLSclass,const TopOpeBRepBuild_PWireEdgeSet & PWES);
		%feature("compactdefaultargs") GFillONCheckI;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: bool
") GFillONCheckI;
		Standard_Boolean GFillONCheckI (const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") GFillONPartsWES1;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") GFillONPartsWES1;
		void GFillONPartsWES1 (const Handle_TopOpeBRepDS_Interference & I);
		%feature("compactdefaultargs") GFillONPartsWES2;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param EspON:
	:type EspON: TopoDS_Shape &
	:rtype: None
") GFillONPartsWES2;
		void GFillONPartsWES2 (const Handle_TopOpeBRepDS_Interference & I,const TopoDS_Shape & EspON);
		%feature("compactdefaultargs") Perform2d;
		%feature("autodoc", "	:param PB:
	:type PB: TopOpeBRepBuild_PBuilder &
	:param F:
	:type F: TopoDS_Shape &
	:param PG:
	:type PG: TopOpeBRepBuild_PGTopo &
	:param PLSclass:
	:type PLSclass: TopOpeBRepTool_Plos &
	:param PWES:
	:type PWES: TopOpeBRepBuild_PWireEdgeSet &
	:rtype: None
") Perform2d;
		void Perform2d (const TopOpeBRepBuild_PBuilder & PB,const TopoDS_Shape & F,const TopOpeBRepBuild_PGTopo & PG,const TopOpeBRepTool_Plos & PLSclass,const TopOpeBRepBuild_PWireEdgeSet & PWES);
		%feature("compactdefaultargs") GFillONParts2dWES2;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:param EspON:
	:type EspON: TopoDS_Shape &
	:rtype: None
") GFillONParts2dWES2;
		void GFillONParts2dWES2 (const Handle_TopOpeBRepDS_Interference & I,const TopoDS_Shape & EspON);
};


%extend TopOpeBRepBuild_BuilderON {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_CorrectFace2d;
class TopOpeBRepBuild_CorrectFace2d {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_CorrectFace2d;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_CorrectFace2d;
		 TopOpeBRepBuild_CorrectFace2d ();
		%feature("compactdefaultargs") TopOpeBRepBuild_CorrectFace2d;
		%feature("autodoc", "	:param aFace:
	:type aFace: TopoDS_Face &
	:param anAvoidMap:
	:type anAvoidMap: TopTools_IndexedMapOfOrientedShape &
	:param aMap:
	:type aMap: TopTools_IndexedDataMapOfShapeShape &
	:rtype: None
") TopOpeBRepBuild_CorrectFace2d;
		 TopOpeBRepBuild_CorrectFace2d (const TopoDS_Face & aFace,const TopTools_IndexedMapOfOrientedShape & anAvoidMap,TopTools_IndexedDataMapOfShapeShape & aMap);
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "	:rtype: int
") ErrorStatus;
		Standard_Integer ErrorStatus ();
		%feature("compactdefaultargs") CorrectedFace;
		%feature("autodoc", "	:rtype: TopoDS_Face
") CorrectedFace;
		const TopoDS_Face  CorrectedFace ();
		%feature("compactdefaultargs") SetMapOfTrans2dInfo;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_IndexedDataMapOfShapeShape &
	:rtype: None
") SetMapOfTrans2dInfo;
		void SetMapOfTrans2dInfo (TopTools_IndexedDataMapOfShapeShape & aMap);
		%feature("compactdefaultargs") MapOfTrans2dInfo;
		%feature("autodoc", "	:rtype: TopTools_IndexedDataMapOfShapeShape
") MapOfTrans2dInfo;
		TopTools_IndexedDataMapOfShapeShape & MapOfTrans2dInfo ();
		%feature("compactdefaultargs") GetP2dFL;
		%feature("autodoc", "	:param aFace:
	:type aFace: TopoDS_Face &
	:param anEdge:
	:type anEdge: TopoDS_Edge &
	:param P2dF:
	:type P2dF: gp_Pnt2d
	:param P2dL:
	:type P2dL: gp_Pnt2d
	:rtype: void
") GetP2dFL;
		static void GetP2dFL (const TopoDS_Face & aFace,const TopoDS_Edge & anEdge,gp_Pnt2d & P2dF,gp_Pnt2d & P2dL);
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "	:param aFace:
	:type aFace: TopoDS_Face &
	:param aHeadList:
	:type aHeadList: TopTools_ListOfShape &
	:rtype: void
") CheckList;
		static void CheckList (const TopoDS_Face & aFace,TopTools_ListOfShape & aHeadList);
};


%extend TopOpeBRepBuild_CorrectFace2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape;
class TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape;
		 TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape ();
		%feature("compactdefaultargs") TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape &
	:rtype: None
") TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape;
		 TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape (const TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepBuild_ListOfShapeListOfShape
") Value;
		const TopOpeBRepBuild_ListOfShapeListOfShape & Value ();
};


%extend TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape;
class TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopOpeBRepBuild_ListOfShapeListOfShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape;
		 TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape (const TopoDS_Shape & K,const TopOpeBRepBuild_ListOfShapeListOfShape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepBuild_ListOfShapeListOfShape
") Value;
		TopOpeBRepBuild_ListOfShapeListOfShape & Value ();
};


%extend TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape::Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape;
class Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape();
        Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape(const Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape &aHandle);
        Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape(const TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape {
    TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape* _get_reference() {
    return (TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape*)$self->Access();
    }
};

%extend Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape;
class TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape;
		 TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape &
	:rtype: TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape
") Assign;
		TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape & Assign (const TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape &
	:rtype: TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape
") operator =;
		TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape & operator = (const TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopOpeBRepBuild_ListOfShapeListOfShape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopOpeBRepBuild_ListOfShapeListOfShape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepBuild_ListOfShapeListOfShape
") Find;
		const TopOpeBRepBuild_ListOfShapeListOfShape & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepBuild_ListOfShapeListOfShape
") ChangeFind;
		TopOpeBRepBuild_ListOfShapeListOfShape & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_FaceBuilder;
class TopOpeBRepBuild_FaceBuilder {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceBuilder;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_FaceBuilder;
		 TopOpeBRepBuild_FaceBuilder ();
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceBuilder;
		%feature("autodoc", "	* Create a FaceBuilder to build the faces on the shapes (wires, blocks of edge) described by <LS>.

	:param ES:
	:type ES: TopOpeBRepBuild_WireEdgeSet &
	:param F:
	:type F: TopoDS_Shape &
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None
") TopOpeBRepBuild_FaceBuilder;
		 TopOpeBRepBuild_FaceBuilder (TopOpeBRepBuild_WireEdgeSet & ES,const TopoDS_Shape & F,const Standard_Boolean ForceClass = Standard_False);
		%feature("compactdefaultargs") InitFaceBuilder;
		%feature("autodoc", "	:param ES:
	:type ES: TopOpeBRepBuild_WireEdgeSet &
	:param F:
	:type F: TopoDS_Shape &
	:param ForceClass:
	:type ForceClass: bool
	:rtype: None
") InitFaceBuilder;
		void InitFaceBuilder (TopOpeBRepBuild_WireEdgeSet & ES,const TopoDS_Shape & F,const Standard_Boolean ForceClass);
		%feature("compactdefaultargs") DetectUnclosedWire;
		%feature("autodoc", "	* Removes are non 3d-closed wires. Fills up maps <mapVVsameG> and <mapVon1Edge>, in order to correct 3d-closed but unclosed (topologic connexity) wires. modifies myBlockBuilder

	:param mapVVsameG:
	:type mapVVsameG: TopTools_IndexedDataMapOfShapeShape &
	:param mapVon1Edge:
	:type mapVon1Edge: TopTools_IndexedDataMapOfShapeShape &
	:rtype: None
") DetectUnclosedWire;
		void DetectUnclosedWire (TopTools_IndexedDataMapOfShapeShape & mapVVsameG,TopTools_IndexedDataMapOfShapeShape & mapVon1Edge);
		%feature("compactdefaultargs") CorrectGclosedWire;
		%feature("autodoc", "	* Using the given maps, change the topology of the 3d-closed wires, in order to get closed wires.

	:param mapVVref:
	:type mapVVref: TopTools_IndexedDataMapOfShapeShape &
	:param mapVon1Edge:
	:type mapVon1Edge: TopTools_IndexedDataMapOfShapeShape &
	:rtype: None
") CorrectGclosedWire;
		void CorrectGclosedWire (const TopTools_IndexedDataMapOfShapeShape & mapVVref,const TopTools_IndexedDataMapOfShapeShape & mapVon1Edge);
		%feature("compactdefaultargs") DetectPseudoInternalEdge;
		%feature("autodoc", "	* Removes edges appearing twice (FORWARD,REVERSED) with a bounding vertex not connected to any other edge. mapE contains edges found. modifies myBlockBuilder.

	:param mapE:
	:type mapE: TopTools_IndexedMapOfShape &
	:rtype: None
") DetectPseudoInternalEdge;
		void DetectPseudoInternalEdge (TopTools_IndexedMapOfShape & mapE);
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* return myFace

	:rtype: TopoDS_Shape
") Face;
		const TopoDS_Shape  Face ();
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "	:rtype: int
") InitFace;
		Standard_Integer InitFace ();
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", "	:rtype: bool
") MoreFace;
		Standard_Boolean MoreFace ();
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "	:rtype: None
") NextFace;
		void NextFace ();
		%feature("compactdefaultargs") InitWire;
		%feature("autodoc", "	:rtype: int
") InitWire;
		Standard_Integer InitWire ();
		%feature("compactdefaultargs") MoreWire;
		%feature("autodoc", "	:rtype: bool
") MoreWire;
		Standard_Boolean MoreWire ();
		%feature("compactdefaultargs") NextWire;
		%feature("autodoc", "	:rtype: None
") NextWire;
		void NextWire ();
		%feature("compactdefaultargs") IsOldWire;
		%feature("autodoc", "	:rtype: bool
") IsOldWire;
		Standard_Boolean IsOldWire ();
		%feature("compactdefaultargs") OldWire;
		%feature("autodoc", "	* Returns current wire This wire may be : * an old wire OldWire(), which has not been reconstructed; * a new wire made of edges described by ...NewEdge() methods.

	:rtype: TopoDS_Shape
") OldWire;
		const TopoDS_Shape  OldWire ();
		%feature("compactdefaultargs") FindNextValidElement;
		%feature("autodoc", "	* Iterates on myBlockIterator until finding a valid element

	:rtype: None
") FindNextValidElement;
		void FindNextValidElement ();
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "	:rtype: int
") InitEdge;
		Standard_Integer InitEdge ();
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "	:rtype: bool
") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "	:rtype: None
") NextEdge;
		void NextEdge ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Returns current new edge of current new wire.

	:rtype: TopoDS_Shape
") Edge;
		const TopoDS_Shape  Edge ();
		%feature("compactdefaultargs") EdgeConnexity;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:rtype: int
") EdgeConnexity;
		Standard_Integer EdgeConnexity (const TopoDS_Shape & E);
		%feature("compactdefaultargs") AddEdgeWire;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:param W:
	:type W: TopoDS_Shape &
	:rtype: int
") AddEdgeWire;
		Standard_Integer AddEdgeWire (const TopoDS_Shape & E,TopoDS_Shape & W);
};


%extend TopOpeBRepBuild_FaceBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_FuseFace;
class TopOpeBRepBuild_FuseFace {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_FuseFace;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_FuseFace;
		 TopOpeBRepBuild_FuseFace ();
		%feature("compactdefaultargs") TopOpeBRepBuild_FuseFace;
		%feature("autodoc", "	:param LIF:
	:type LIF: TopTools_ListOfShape &
	:param LRF:
	:type LRF: TopTools_ListOfShape &
	:param CXM:
	:type CXM: int
	:rtype: None
") TopOpeBRepBuild_FuseFace;
		 TopOpeBRepBuild_FuseFace (const TopTools_ListOfShape & LIF,const TopTools_ListOfShape & LRF,const Standard_Integer CXM);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param LIF:
	:type LIF: TopTools_ListOfShape &
	:param LRF:
	:type LRF: TopTools_ListOfShape &
	:param CXM:
	:type CXM: int
	:rtype: None
") Init;
		void Init (const TopTools_ListOfShape & LIF,const TopTools_ListOfShape & LRF,const Standard_Integer CXM);
		%feature("compactdefaultargs") PerformFace;
		%feature("autodoc", "	:rtype: None
") PerformFace;
		void PerformFace ();
		%feature("compactdefaultargs") PerformEdge;
		%feature("autodoc", "	:rtype: None
") PerformEdge;
		void PerformEdge ();
		%feature("compactdefaultargs") ClearEdge;
		%feature("autodoc", "	:rtype: None
") ClearEdge;
		void ClearEdge ();
		%feature("compactdefaultargs") ClearVertex;
		%feature("autodoc", "	:rtype: None
") ClearVertex;
		void ClearVertex ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "	:rtype: bool
") IsModified;
		Standard_Boolean IsModified ();
		%feature("compactdefaultargs") LFuseFace;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") LFuseFace;
		const TopTools_ListOfShape & LFuseFace ();
		%feature("compactdefaultargs") LInternEdge;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") LInternEdge;
		const TopTools_ListOfShape & LInternEdge ();
		%feature("compactdefaultargs") LExternEdge;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") LExternEdge;
		const TopTools_ListOfShape & LExternEdge ();
		%feature("compactdefaultargs") LModifEdge;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") LModifEdge;
		const TopTools_ListOfShape & LModifEdge ();
		%feature("compactdefaultargs") LInternVertex;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") LInternVertex;
		const TopTools_ListOfShape & LInternVertex ();
		%feature("compactdefaultargs") LExternVertex;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") LExternVertex;
		const TopTools_ListOfShape & LExternVertex ();
		%feature("compactdefaultargs") LModifVertex;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") LModifVertex;
		const TopTools_ListOfShape & LModifVertex ();
};


%extend TopOpeBRepBuild_FuseFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_GIter;
class TopOpeBRepBuild_GIter {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_GIter;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_GIter;
		 TopOpeBRepBuild_GIter ();
		%feature("compactdefaultargs") TopOpeBRepBuild_GIter;
		%feature("autodoc", "	:param G:
	:type G: TopOpeBRepBuild_GTopo &
	:rtype: None
") TopOpeBRepBuild_GIter;
		 TopOpeBRepBuild_GIter (const TopOpeBRepBuild_GTopo & G);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param G:
	:type G: TopOpeBRepBuild_GTopo &
	:rtype: None
") Init;
		void Init (const TopOpeBRepBuild_GTopo & G);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "	:param s1:
	:type s1: TopAbs_State &
	:param s2:
	:type s2: TopAbs_State &
	:rtype: None
") Current;
		void Current (TopAbs_State & s1,TopAbs_State & s2);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TopOpeBRepBuild_GIter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TopOpeBRepBuild_GTool {
	public:
		%feature("compactdefaultargs") GFusUnsh;
		%feature("autodoc", "	:param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo
") GFusUnsh;
		static TopOpeBRepBuild_GTopo GFusUnsh (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("compactdefaultargs") GFusSame;
		%feature("autodoc", "	:param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo
") GFusSame;
		static TopOpeBRepBuild_GTopo GFusSame (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("compactdefaultargs") GFusDiff;
		%feature("autodoc", "	:param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo
") GFusDiff;
		static TopOpeBRepBuild_GTopo GFusDiff (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("compactdefaultargs") GCutUnsh;
		%feature("autodoc", "	:param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo
") GCutUnsh;
		static TopOpeBRepBuild_GTopo GCutUnsh (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("compactdefaultargs") GCutSame;
		%feature("autodoc", "	:param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo
") GCutSame;
		static TopOpeBRepBuild_GTopo GCutSame (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("compactdefaultargs") GCutDiff;
		%feature("autodoc", "	:param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo
") GCutDiff;
		static TopOpeBRepBuild_GTopo GCutDiff (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("compactdefaultargs") GComUnsh;
		%feature("autodoc", "	:param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo
") GComUnsh;
		static TopOpeBRepBuild_GTopo GComUnsh (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("compactdefaultargs") GComSame;
		%feature("autodoc", "	:param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo
") GComSame;
		static TopOpeBRepBuild_GTopo GComSame (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("compactdefaultargs") GComDiff;
		%feature("autodoc", "	:param s1:
	:type s1: TopAbs_ShapeEnum
	:param s2:
	:type s2: TopAbs_ShapeEnum
	:rtype: TopOpeBRepBuild_GTopo
") GComDiff;
		static TopOpeBRepBuild_GTopo GComDiff (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TopOpeBRepBuild_GTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_GTopo;
class TopOpeBRepBuild_GTopo {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_GTopo;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_GTopo;
		 TopOpeBRepBuild_GTopo ();
		%feature("compactdefaultargs") TopOpeBRepBuild_GTopo;
		%feature("autodoc", "	:param II:
	:type II: int
	:param IN:
	:type IN: int
	:param IO:
	:type IO: int
	:param NI:
	:type NI: int
	:param NN:
	:type NN: int
	:param NO:
	:type NO: int
	:param OI:
	:type OI: int
	:param ON:
	:type ON: int
	:param OO:
	:type OO: int
	:param t1:
	:type t1: TopAbs_ShapeEnum
	:param t2:
	:type t2: TopAbs_ShapeEnum
	:param C1:
	:type C1: TopOpeBRepDS_Config
	:param C2:
	:type C2: TopOpeBRepDS_Config
	:rtype: None
") TopOpeBRepBuild_GTopo;
		 TopOpeBRepBuild_GTopo (const Standard_Integer II,const Standard_Integer IN,const Standard_Integer IO,const Standard_Integer NI,const Standard_Integer NN,const Standard_Integer NO,const Standard_Integer OI,const Standard_Integer ON,const Standard_Integer OO,const TopAbs_ShapeEnum t1,const TopAbs_ShapeEnum t2,const TopOpeBRepDS_Config C1,const TopOpeBRepDS_Config C2);
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	:rtype: None
") Reset;
		void Reset ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param II:
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
	:rtype: None
") Set;
		void Set (const Standard_Boolean II,const Standard_Boolean IN,const Standard_Boolean IO,const Standard_Boolean NI,const Standard_Boolean NN,const Standard_Boolean NO,const Standard_Boolean OI,const Standard_Boolean ON,const Standard_Boolean OO);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:param t1:
	:type t1: TopAbs_ShapeEnum &
	:param t2:
	:type t2: TopAbs_ShapeEnum &
	:rtype: None
") Type;
		void Type (TopAbs_ShapeEnum & t1,TopAbs_ShapeEnum & t2);
		%feature("compactdefaultargs") ChangeType;
		%feature("autodoc", "	:param t1:
	:type t1: TopAbs_ShapeEnum
	:param t2:
	:type t2: TopAbs_ShapeEnum
	:rtype: None
") ChangeType;
		void ChangeType (const TopAbs_ShapeEnum t1,const TopAbs_ShapeEnum t2);
		%feature("compactdefaultargs") Config1;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_Config
") Config1;
		TopOpeBRepDS_Config Config1 ();
		%feature("compactdefaultargs") Config2;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_Config
") Config2;
		TopOpeBRepDS_Config Config2 ();
		%feature("compactdefaultargs") ChangeConfig;
		%feature("autodoc", "	:param C1:
	:type C1: TopOpeBRepDS_Config
	:param C2:
	:type C2: TopOpeBRepDS_Config
	:rtype: None
") ChangeConfig;
		void ChangeConfig (const TopOpeBRepDS_Config C1,const TopOpeBRepDS_Config C2);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param s1:
	:type s1: TopAbs_State
	:param s2:
	:type s2: TopAbs_State
	:rtype: bool
") Value;
		Standard_Boolean Value (const TopAbs_State s1,const TopAbs_State s2);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Integer I1,const Standard_Integer I2);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param II:
	:type II: int
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Integer II);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param i1:
	:type i1: int
	:param i2:
	:type i2: int
	:param b:
	:type b: bool
	:rtype: None
") ChangeValue;
		void ChangeValue (const Standard_Integer i1,const Standard_Integer i2,const Standard_Boolean b);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param s1:
	:type s1: TopAbs_State
	:param s2:
	:type s2: TopAbs_State
	:param b:
	:type b: bool
	:rtype: None
") ChangeValue;
		void ChangeValue (const TopAbs_State s1,const TopAbs_State s2,const Standard_Boolean b);
		%feature("compactdefaultargs") GIndex;
		%feature("autodoc", "	:param S:
	:type S: TopAbs_State
	:rtype: int
") GIndex;
		Standard_Integer GIndex (const TopAbs_State S);
		%feature("compactdefaultargs") GState;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopAbs_State
") GState;
		TopAbs_State GState (const Standard_Integer I);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:param II:
	:type II: int
	:param i1:
	:type i1: int &
	:param i2:
	:type i2: int &
	:rtype: None
") Index;
		void Index (const Standard_Integer II,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") DumpVal;
		%feature("autodoc", "	:param OS:
	:type OS: Standard_OStream &
	:param s1:
	:type s1: TopAbs_State
	:param s2:
	:type s2: TopAbs_State
	:rtype: None
") DumpVal;
		void DumpVal (Standard_OStream & OS,const TopAbs_State s1,const TopAbs_State s2);

        %feature("autodoc", "1");
        %extend{
            std::string DumpTypeToString() {
            std::stringstream s;
            self->DumpType(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") DumpSSB;
		%feature("autodoc", "	:param OS:
	:type OS: Standard_OStream &
	:param s1:
	:type s1: TopAbs_State
	:param s2:
	:type s2: TopAbs_State
	:param b:
	:type b: bool
	:rtype: void
") DumpSSB;
		static void DumpSSB (Standard_OStream & OS,const TopAbs_State s1,const TopAbs_State s2,const Standard_Boolean b);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param OS:
	:type OS: Standard_OStream &
	:param s: default value is NULL
	:type s: Standard_Address
	:rtype: void
") Dump;
		virtual void Dump (Standard_OStream & OS,const Standard_Address s = NULL);
		%feature("compactdefaultargs") StatesON;
		%feature("autodoc", "	:param s1:
	:type s1: TopAbs_State &
	:param s2:
	:type s2: TopAbs_State &
	:rtype: None
") StatesON;
		void StatesON (TopAbs_State & s1,TopAbs_State & s2);
		%feature("compactdefaultargs") IsToReverse1;
		%feature("autodoc", "	:rtype: bool
") IsToReverse1;
		Standard_Boolean IsToReverse1 ();
		%feature("compactdefaultargs") IsToReverse2;
		%feature("autodoc", "	:rtype: bool
") IsToReverse2;
		Standard_Boolean IsToReverse2 ();
		%feature("compactdefaultargs") SetReverse;
		%feature("autodoc", "	:param rev:
	:type rev: bool
	:rtype: None
") SetReverse;
		void SetReverse (const Standard_Boolean rev);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: bool
") Reverse;
		Standard_Boolean Reverse ();
		%feature("compactdefaultargs") CopyPermuted;
		%feature("autodoc", "	:rtype: TopOpeBRepBuild_GTopo
") CopyPermuted;
		TopOpeBRepBuild_GTopo CopyPermuted ();
};


%extend TopOpeBRepBuild_GTopo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_HBuilder;
class TopOpeBRepBuild_HBuilder : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_HBuilder;
		%feature("autodoc", "	:param BT:
	:type BT: TopOpeBRepDS_BuildTool &
	:rtype: None
") TopOpeBRepBuild_HBuilder;
		 TopOpeBRepBuild_HBuilder (const TopOpeBRepDS_BuildTool & BT);
		%feature("compactdefaultargs") BuildTool;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_BuildTool
") BuildTool;
		const TopOpeBRepDS_BuildTool & BuildTool ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Stores the data structure <HDS>, Create shapes from the new geometries described in <HDS>.

	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") Perform;
		void Perform (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Same as previous + evaluates if an operation performed on shapes S1,S2 is a particular case.

	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") Perform;
		void Perform (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Removes all split and merge already performed. Does NOT clear the handled DS.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") DataStructure;
		%feature("autodoc", "	* returns the DS handled by this builder

	:rtype: Handle_TopOpeBRepDS_HDataStructure
") DataStructure;
		Handle_TopOpeBRepDS_HDataStructure DataStructure ();
		%feature("compactdefaultargs") ChangeBuildTool;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_BuildTool
") ChangeBuildTool;
		TopOpeBRepDS_BuildTool & ChangeBuildTool ();
		%feature("compactdefaultargs") MergeShapes;
		%feature("autodoc", "	* Merges the two shapes <S1> and <S2> keeping the parts of states <TB1>,<TB2> in <S1>,<S2>.

	:param S1:
	:type S1: TopoDS_Shape &
	:param TB1:
	:type TB1: TopAbs_State
	:param S2:
	:type S2: TopoDS_Shape &
	:param TB2:
	:type TB2: TopAbs_State
	:rtype: None
") MergeShapes;
		void MergeShapes (const TopoDS_Shape & S1,const TopAbs_State TB1,const TopoDS_Shape & S2,const TopAbs_State TB2);
		%feature("compactdefaultargs") MergeSolids;
		%feature("autodoc", "	* Merges the two solids <S1> and <S2> keeping the parts in each solid of states <TB1> and <TB2>.

	:param S1:
	:type S1: TopoDS_Shape &
	:param TB1:
	:type TB1: TopAbs_State
	:param S2:
	:type S2: TopoDS_Shape &
	:param TB2:
	:type TB2: TopAbs_State
	:rtype: None
") MergeSolids;
		void MergeSolids (const TopoDS_Shape & S1,const TopAbs_State TB1,const TopoDS_Shape & S2,const TopAbs_State TB2);
		%feature("compactdefaultargs") MergeSolid;
		%feature("autodoc", "	* Merges the solid <S> keeping the parts of state <TB>.

	:param S:
	:type S: TopoDS_Shape &
	:param TB:
	:type TB: TopAbs_State
	:rtype: None
") MergeSolid;
		void MergeSolid (const TopoDS_Shape & S,const TopAbs_State TB);
		%feature("compactdefaultargs") IsSplit;
		%feature("autodoc", "	* Returns True if the shape <S> has been split.

	:param S:
	:type S: TopoDS_Shape &
	:param ToBuild:
	:type ToBuild: TopAbs_State
	:rtype: bool
") IsSplit;
		Standard_Boolean IsSplit (const TopoDS_Shape & S,const TopAbs_State ToBuild);
		%feature("compactdefaultargs") Splits;
		%feature("autodoc", "	* Returns the split parts <ToBuild> of shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:param ToBuild:
	:type ToBuild: TopAbs_State
	:rtype: TopTools_ListOfShape
") Splits;
		const TopTools_ListOfShape & Splits (const TopoDS_Shape & S,const TopAbs_State ToBuild);
		%feature("compactdefaultargs") IsMerged;
		%feature("autodoc", "	* Returns True if the shape <S> has been merged.

	:param S:
	:type S: TopoDS_Shape &
	:param ToBuild:
	:type ToBuild: TopAbs_State
	:rtype: bool
") IsMerged;
		Standard_Boolean IsMerged (const TopoDS_Shape & S,const TopAbs_State ToBuild);
		%feature("compactdefaultargs") Merged;
		%feature("autodoc", "	* Returns the merged parts <ToBuild> of shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:param ToBuild:
	:type ToBuild: TopAbs_State
	:rtype: TopTools_ListOfShape
") Merged;
		const TopTools_ListOfShape & Merged (const TopoDS_Shape & S,const TopAbs_State ToBuild);
		%feature("compactdefaultargs") NewVertex;
		%feature("autodoc", "	* Returns the vertex created on point <I>.

	:param I:
	:type I: int
	:rtype: TopoDS_Shape
") NewVertex;
		const TopoDS_Shape  NewVertex (const Standard_Integer I);
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "	* Returns the edges created on curve <I>.

	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape
") NewEdges;
		const TopTools_ListOfShape & NewEdges (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeNewEdges;
		%feature("autodoc", "	* Returns the edges created on curve <I>.

	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape
") ChangeNewEdges;
		TopTools_ListOfShape & ChangeNewEdges (const Standard_Integer I);
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "	* Returns the faces created on surface <I>.

	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape
") NewFaces;
		const TopTools_ListOfShape & NewFaces (const Standard_Integer I);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Section;
		const TopTools_ListOfShape & Section ();
		%feature("compactdefaultargs") InitExtendedSectionDS;
		%feature("autodoc", "	:param k: default value is 3
	:type k: int
	:rtype: None
") InitExtendedSectionDS;
		void InitExtendedSectionDS (const Standard_Integer k = 3);
		%feature("compactdefaultargs") InitSection;
		%feature("autodoc", "	:param k: default value is 3
	:type k: int
	:rtype: None
") InitSection;
		void InitSection (const Standard_Integer k = 3);
		%feature("compactdefaultargs") MoreSection;
		%feature("autodoc", "	:rtype: bool
") MoreSection;
		Standard_Boolean MoreSection ();
		%feature("compactdefaultargs") NextSection;
		%feature("autodoc", "	:rtype: None
") NextSection;
		void NextSection ();
		%feature("compactdefaultargs") CurrentSection;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") CurrentSection;
		const TopoDS_Shape  CurrentSection ();
		%feature("compactdefaultargs") GetDSEdgeFromSectEdge;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:param rank:
	:type rank: int
	:rtype: int
") GetDSEdgeFromSectEdge;
		Standard_Integer GetDSEdgeFromSectEdge (const TopoDS_Shape & E,const Standard_Integer rank);
		%feature("compactdefaultargs") GetDSFaceFromDSEdge;
		%feature("autodoc", "	:param indexEdg:
	:type indexEdg: int
	:param rank:
	:type rank: int
	:rtype: TColStd_ListOfInteger
") GetDSFaceFromDSEdge;
		TColStd_ListOfInteger & GetDSFaceFromDSEdge (const Standard_Integer indexEdg,const Standard_Integer rank);
		%feature("compactdefaultargs") GetDSCurveFromSectEdge;
		%feature("autodoc", "	:param SectEdge:
	:type SectEdge: TopoDS_Shape &
	:rtype: int
") GetDSCurveFromSectEdge;
		Standard_Integer GetDSCurveFromSectEdge (const TopoDS_Shape & SectEdge);
		%feature("compactdefaultargs") GetDSFaceFromDSCurve;
		%feature("autodoc", "	:param indexCur:
	:type indexCur: int
	:param rank:
	:type rank: int
	:rtype: int
") GetDSFaceFromDSCurve;
		Standard_Integer GetDSFaceFromDSCurve (const Standard_Integer indexCur,const Standard_Integer rank);
		%feature("compactdefaultargs") GetDSPointFromNewVertex;
		%feature("autodoc", "	:param NewVert:
	:type NewVert: TopoDS_Shape &
	:rtype: int
") GetDSPointFromNewVertex;
		Standard_Integer GetDSPointFromNewVertex (const TopoDS_Shape & NewVert);
		%feature("compactdefaultargs") EdgeCurveAncestors;
		%feature("autodoc", "	* search for the couple of face F1,F2 (from arguments of supra Perform(S1,S2,HDS)) method which intersection gives section edge E built on an intersection curve. returns True if F1,F2 have been valued. returns False if E is not a section edge built on intersection curve IC.

	:param E:
	:type E: TopoDS_Shape &
	:param F1:
	:type F1: TopoDS_Shape &
	:param F2:
	:type F2: TopoDS_Shape &
	:param IC:
	:type IC: int &
	:rtype: bool
") EdgeCurveAncestors;
		Standard_Boolean EdgeCurveAncestors (const TopoDS_Shape & E,TopoDS_Shape & F1,TopoDS_Shape & F2,Standard_Integer &OutValue);
		%feature("compactdefaultargs") EdgeSectionAncestors;
		%feature("autodoc", "	* search for the couple of face F1,F2 (from arguments of supra Perform(S1,S2,HDS)) method which intersection gives section edge E built on at least one edge . returns True if F1,F2 have been valued. returns False if E is not a section edge built on at least one edge of S1 and/or S2. LE1,LE2 are edges of S1,S2 which common part is edge E. LE1 or LE2 may be empty() but not both.

	:param E:
	:type E: TopoDS_Shape &
	:param LF1:
	:type LF1: TopTools_ListOfShape &
	:param LF2:
	:type LF2: TopTools_ListOfShape &
	:param LE1:
	:type LE1: TopTools_ListOfShape &
	:param LE2:
	:type LE2: TopTools_ListOfShape &
	:rtype: bool
") EdgeSectionAncestors;
		Standard_Boolean EdgeSectionAncestors (const TopoDS_Shape & E,TopTools_ListOfShape & LF1,TopTools_ListOfShape & LF2,TopTools_ListOfShape & LE1,TopTools_ListOfShape & LE2);
		%feature("compactdefaultargs") IsKPart;
		%feature("autodoc", "	* Returns 0 is standard operation, != 0 if particular case

	:rtype: int
") IsKPart;
		Standard_Integer IsKPart ();
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", "	:param TB1:
	:type TB1: TopAbs_State
	:param TB2:
	:type TB2: TopAbs_State
	:rtype: None
") MergeKPart;
		void MergeKPart (const TopAbs_State TB1,const TopAbs_State TB2);
		%feature("compactdefaultargs") ChangeBuilder;
		%feature("autodoc", "	:rtype: TopOpeBRepBuild_Builder
") ChangeBuilder;
		TopOpeBRepBuild_Builder & ChangeBuilder ();
};


%extend TopOpeBRepBuild_HBuilder {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepBuild_HBuilder(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepBuild_HBuilder::Handle_TopOpeBRepBuild_HBuilder %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepBuild_HBuilder;
class Handle_TopOpeBRepBuild_HBuilder : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopOpeBRepBuild_HBuilder();
        Handle_TopOpeBRepBuild_HBuilder(const Handle_TopOpeBRepBuild_HBuilder &aHandle);
        Handle_TopOpeBRepBuild_HBuilder(const TopOpeBRepBuild_HBuilder *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepBuild_HBuilder DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepBuild_HBuilder {
    TopOpeBRepBuild_HBuilder* _get_reference() {
    return (TopOpeBRepBuild_HBuilder*)$self->Access();
    }
};

%extend Handle_TopOpeBRepBuild_HBuilder {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepBuild_HBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo;
class TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo;
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: int
	:param I:
	:type I: TopOpeBRepBuild_VertexInfo &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo;
		 TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo (const TopoDS_Shape & K1,const Standard_Integer K2,const TopOpeBRepBuild_VertexInfo & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key1;
		TopoDS_Shape  Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepBuild_VertexInfo
") Value;
		TopOpeBRepBuild_VertexInfo & Value ();
};


%extend TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo::Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo;
class Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo();
        Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo(const Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo &aHandle);
        Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo(const TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo {
    TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo* _get_reference() {
    return (TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo*)$self->Access();
    }
};

%extend Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo;
class TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo;
		 TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo &
	:rtype: TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo
") Assign;
		TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & Assign (const TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo &
	:rtype: TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo
") operator =;
		TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & operator = (const TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopOpeBRepBuild_VertexInfo &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopOpeBRepBuild_VertexInfo & I);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: TopoDS_Shape &
	:param T:
	:type T: TopOpeBRepBuild_VertexInfo &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopOpeBRepBuild_VertexInfo & T);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepBuild_VertexInfo
") FindFromIndex;
		const TopOpeBRepBuild_VertexInfo & FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopOpeBRepBuild_VertexInfo
") ChangeFromIndex;
		TopOpeBRepBuild_VertexInfo & ChangeFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepBuild_VertexInfo
") FindFromKey;
		const TopOpeBRepBuild_VertexInfo & FindFromKey (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopOpeBRepBuild_VertexInfo
") ChangeFromKey;
		TopOpeBRepBuild_VertexInfo & ChangeFromKey (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%extend TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ListIteratorOfListOfListOfLoop;
class TopOpeBRepBuild_ListIteratorOfListOfListOfLoop {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ListIteratorOfListOfListOfLoop;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_ListIteratorOfListOfListOfLoop;
		 TopOpeBRepBuild_ListIteratorOfListOfListOfLoop ();
		%feature("compactdefaultargs") TopOpeBRepBuild_ListIteratorOfListOfListOfLoop;
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRepBuild_ListOfListOfLoop &
	:rtype: None
") TopOpeBRepBuild_ListIteratorOfListOfListOfLoop;
		 TopOpeBRepBuild_ListIteratorOfListOfListOfLoop (const TopOpeBRepBuild_ListOfListOfLoop & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRepBuild_ListOfListOfLoop &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepBuild_ListOfListOfLoop & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepBuild_ListOfLoop
") Value;
		TopOpeBRepBuild_ListOfLoop & Value ();
};


%extend TopOpeBRepBuild_ListIteratorOfListOfListOfLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ListIteratorOfListOfLoop;
class TopOpeBRepBuild_ListIteratorOfListOfLoop {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ListIteratorOfListOfLoop;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_ListIteratorOfListOfLoop;
		 TopOpeBRepBuild_ListIteratorOfListOfLoop ();
		%feature("compactdefaultargs") TopOpeBRepBuild_ListIteratorOfListOfLoop;
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRepBuild_ListOfLoop &
	:rtype: None
") TopOpeBRepBuild_ListIteratorOfListOfLoop;
		 TopOpeBRepBuild_ListIteratorOfListOfLoop (const TopOpeBRepBuild_ListOfLoop & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRepBuild_ListOfLoop &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepBuild_ListOfLoop & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepBuild_Loop
") Value;
		Handle_TopOpeBRepBuild_Loop Value ();
};


%extend TopOpeBRepBuild_ListIteratorOfListOfLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ListIteratorOfListOfPave;
class TopOpeBRepBuild_ListIteratorOfListOfPave {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ListIteratorOfListOfPave;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_ListIteratorOfListOfPave;
		 TopOpeBRepBuild_ListIteratorOfListOfPave ();
		%feature("compactdefaultargs") TopOpeBRepBuild_ListIteratorOfListOfPave;
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRepBuild_ListOfPave &
	:rtype: None
") TopOpeBRepBuild_ListIteratorOfListOfPave;
		 TopOpeBRepBuild_ListIteratorOfListOfPave (const TopOpeBRepBuild_ListOfPave & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRepBuild_ListOfPave &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepBuild_ListOfPave & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepBuild_Pave
") Value;
		Handle_TopOpeBRepBuild_Pave Value ();
};


%extend TopOpeBRepBuild_ListIteratorOfListOfPave {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape;
class TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape;
		 TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape ();
		%feature("compactdefaultargs") TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape;
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRepBuild_ListOfShapeListOfShape &
	:rtype: None
") TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape;
		 TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape (const TopOpeBRepBuild_ListOfShapeListOfShape & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRepBuild_ListOfShapeListOfShape &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRepBuild_ListOfShapeListOfShape & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepBuild_ShapeListOfShape
") Value;
		TopOpeBRepBuild_ShapeListOfShape & Value ();
};


%extend TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ListNodeOfListOfListOfLoop;
class TopOpeBRepBuild_ListNodeOfListOfListOfLoop : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ListNodeOfListOfListOfLoop;
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepBuild_ListOfLoop &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepBuild_ListNodeOfListOfListOfLoop;
		 TopOpeBRepBuild_ListNodeOfListOfListOfLoop (const TopOpeBRepBuild_ListOfLoop & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepBuild_ListOfLoop
") Value;
		TopOpeBRepBuild_ListOfLoop & Value ();
};


%extend TopOpeBRepBuild_ListNodeOfListOfListOfLoop {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop::Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop;
class Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop();
        Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop(const Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop &aHandle);
        Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop(const TopOpeBRepBuild_ListNodeOfListOfListOfLoop *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop {
    TopOpeBRepBuild_ListNodeOfListOfListOfLoop* _get_reference() {
    return (TopOpeBRepBuild_ListNodeOfListOfListOfLoop*)$self->Access();
    }
};

%extend Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepBuild_ListNodeOfListOfListOfLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ListNodeOfListOfLoop;
class TopOpeBRepBuild_ListNodeOfListOfLoop : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ListNodeOfListOfLoop;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepBuild_Loop &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepBuild_ListNodeOfListOfLoop;
		 TopOpeBRepBuild_ListNodeOfListOfLoop (const Handle_TopOpeBRepBuild_Loop & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepBuild_Loop
") Value;
		Handle_TopOpeBRepBuild_Loop Value ();
};


%extend TopOpeBRepBuild_ListNodeOfListOfLoop {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepBuild_ListNodeOfListOfLoop(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepBuild_ListNodeOfListOfLoop::Handle_TopOpeBRepBuild_ListNodeOfListOfLoop %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepBuild_ListNodeOfListOfLoop;
class Handle_TopOpeBRepBuild_ListNodeOfListOfLoop : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepBuild_ListNodeOfListOfLoop();
        Handle_TopOpeBRepBuild_ListNodeOfListOfLoop(const Handle_TopOpeBRepBuild_ListNodeOfListOfLoop &aHandle);
        Handle_TopOpeBRepBuild_ListNodeOfListOfLoop(const TopOpeBRepBuild_ListNodeOfListOfLoop *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepBuild_ListNodeOfListOfLoop DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepBuild_ListNodeOfListOfLoop {
    TopOpeBRepBuild_ListNodeOfListOfLoop* _get_reference() {
    return (TopOpeBRepBuild_ListNodeOfListOfLoop*)$self->Access();
    }
};

%extend Handle_TopOpeBRepBuild_ListNodeOfListOfLoop {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepBuild_ListNodeOfListOfLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ListNodeOfListOfPave;
class TopOpeBRepBuild_ListNodeOfListOfPave : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ListNodeOfListOfPave;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepBuild_Pave &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepBuild_ListNodeOfListOfPave;
		 TopOpeBRepBuild_ListNodeOfListOfPave (const Handle_TopOpeBRepBuild_Pave & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepBuild_Pave
") Value;
		Handle_TopOpeBRepBuild_Pave Value ();
};


%extend TopOpeBRepBuild_ListNodeOfListOfPave {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepBuild_ListNodeOfListOfPave(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepBuild_ListNodeOfListOfPave::Handle_TopOpeBRepBuild_ListNodeOfListOfPave %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepBuild_ListNodeOfListOfPave;
class Handle_TopOpeBRepBuild_ListNodeOfListOfPave : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepBuild_ListNodeOfListOfPave();
        Handle_TopOpeBRepBuild_ListNodeOfListOfPave(const Handle_TopOpeBRepBuild_ListNodeOfListOfPave &aHandle);
        Handle_TopOpeBRepBuild_ListNodeOfListOfPave(const TopOpeBRepBuild_ListNodeOfListOfPave *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepBuild_ListNodeOfListOfPave DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepBuild_ListNodeOfListOfPave {
    TopOpeBRepBuild_ListNodeOfListOfPave* _get_reference() {
    return (TopOpeBRepBuild_ListNodeOfListOfPave*)$self->Access();
    }
};

%extend Handle_TopOpeBRepBuild_ListNodeOfListOfPave {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepBuild_ListNodeOfListOfPave {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape;
class TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape;
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepBuild_ShapeListOfShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape;
		 TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape (const TopOpeBRepBuild_ShapeListOfShape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopOpeBRepBuild_ShapeListOfShape
") Value;
		TopOpeBRepBuild_ShapeListOfShape & Value ();
};


%extend TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape::Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape;
class Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape();
        Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape(const Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape &aHandle);
        Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape(const TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape {
    TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape* _get_reference() {
    return (TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape*)$self->Access();
    }
};

%extend Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ListOfListOfLoop;
class TopOpeBRepBuild_ListOfListOfLoop {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ListOfListOfLoop;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_ListOfListOfLoop;
		 TopOpeBRepBuild_ListOfListOfLoop ();
		%feature("compactdefaultargs") TopOpeBRepBuild_ListOfListOfLoop;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfListOfLoop &
	:rtype: None
") TopOpeBRepBuild_ListOfListOfLoop;
		 TopOpeBRepBuild_ListOfListOfLoop (const TopOpeBRepBuild_ListOfListOfLoop & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfListOfLoop &
	:rtype: None
") Assign;
		void Assign (const TopOpeBRepBuild_ListOfListOfLoop & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfListOfLoop &
	:rtype: None
") operator =;
		void operator = (const TopOpeBRepBuild_ListOfListOfLoop & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepBuild_ListOfLoop &
	:rtype: None
") Prepend;
		void Prepend (const TopOpeBRepBuild_ListOfLoop & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepBuild_ListOfLoop &
	:param theIt:
	:type theIt: TopOpeBRepBuild_ListIteratorOfListOfListOfLoop &
	:rtype: None
") Prepend;
		void Prepend (const TopOpeBRepBuild_ListOfLoop & I,TopOpeBRepBuild_ListIteratorOfListOfListOfLoop & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfListOfLoop &
	:rtype: None
") Prepend;
		void Prepend (TopOpeBRepBuild_ListOfListOfLoop & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepBuild_ListOfLoop &
	:rtype: None
") Append;
		void Append (const TopOpeBRepBuild_ListOfLoop & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepBuild_ListOfLoop &
	:param theIt:
	:type theIt: TopOpeBRepBuild_ListIteratorOfListOfListOfLoop &
	:rtype: None
") Append;
		void Append (const TopOpeBRepBuild_ListOfLoop & I,TopOpeBRepBuild_ListIteratorOfListOfListOfLoop & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfListOfLoop &
	:rtype: None
") Append;
		void Append (TopOpeBRepBuild_ListOfListOfLoop & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TopOpeBRepBuild_ListOfLoop
") First;
		TopOpeBRepBuild_ListOfLoop & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TopOpeBRepBuild_ListOfLoop
") Last;
		TopOpeBRepBuild_ListOfLoop & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfListOfLoop &
	:rtype: None
") Remove;
		void Remove (TopOpeBRepBuild_ListIteratorOfListOfListOfLoop & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepBuild_ListOfLoop &
	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfListOfLoop &
	:rtype: None
") InsertBefore;
		void InsertBefore (const TopOpeBRepBuild_ListOfLoop & I,TopOpeBRepBuild_ListIteratorOfListOfListOfLoop & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfListOfLoop &
	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfListOfLoop &
	:rtype: None
") InsertBefore;
		void InsertBefore (TopOpeBRepBuild_ListOfListOfLoop & Other,TopOpeBRepBuild_ListIteratorOfListOfListOfLoop & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepBuild_ListOfLoop &
	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfListOfLoop &
	:rtype: None
") InsertAfter;
		void InsertAfter (const TopOpeBRepBuild_ListOfLoop & I,TopOpeBRepBuild_ListIteratorOfListOfListOfLoop & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfListOfLoop &
	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfListOfLoop &
	:rtype: None
") InsertAfter;
		void InsertAfter (TopOpeBRepBuild_ListOfListOfLoop & Other,TopOpeBRepBuild_ListIteratorOfListOfListOfLoop & It);
};


%extend TopOpeBRepBuild_ListOfListOfLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ListOfLoop;
class TopOpeBRepBuild_ListOfLoop {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ListOfLoop;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_ListOfLoop;
		 TopOpeBRepBuild_ListOfLoop ();
		%feature("compactdefaultargs") TopOpeBRepBuild_ListOfLoop;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfLoop &
	:rtype: None
") TopOpeBRepBuild_ListOfLoop;
		 TopOpeBRepBuild_ListOfLoop (const TopOpeBRepBuild_ListOfLoop & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfLoop &
	:rtype: None
") Assign;
		void Assign (const TopOpeBRepBuild_ListOfLoop & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfLoop &
	:rtype: None
") operator =;
		void operator = (const TopOpeBRepBuild_ListOfLoop & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepBuild_Loop &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TopOpeBRepBuild_Loop & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepBuild_Loop &
	:param theIt:
	:type theIt: TopOpeBRepBuild_ListIteratorOfListOfLoop &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TopOpeBRepBuild_Loop & I,TopOpeBRepBuild_ListIteratorOfListOfLoop & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfLoop &
	:rtype: None
") Prepend;
		void Prepend (TopOpeBRepBuild_ListOfLoop & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepBuild_Loop &
	:rtype: None
") Append;
		void Append (const Handle_TopOpeBRepBuild_Loop & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepBuild_Loop &
	:param theIt:
	:type theIt: TopOpeBRepBuild_ListIteratorOfListOfLoop &
	:rtype: None
") Append;
		void Append (const Handle_TopOpeBRepBuild_Loop & I,TopOpeBRepBuild_ListIteratorOfListOfLoop & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfLoop &
	:rtype: None
") Append;
		void Append (TopOpeBRepBuild_ListOfLoop & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepBuild_Loop
") First;
		Handle_TopOpeBRepBuild_Loop First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepBuild_Loop
") Last;
		Handle_TopOpeBRepBuild_Loop Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfLoop &
	:rtype: None
") Remove;
		void Remove (TopOpeBRepBuild_ListIteratorOfListOfLoop & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepBuild_Loop &
	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfLoop &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_TopOpeBRepBuild_Loop & I,TopOpeBRepBuild_ListIteratorOfListOfLoop & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfLoop &
	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfLoop &
	:rtype: None
") InsertBefore;
		void InsertBefore (TopOpeBRepBuild_ListOfLoop & Other,TopOpeBRepBuild_ListIteratorOfListOfLoop & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepBuild_Loop &
	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfLoop &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_TopOpeBRepBuild_Loop & I,TopOpeBRepBuild_ListIteratorOfListOfLoop & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfLoop &
	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfLoop &
	:rtype: None
") InsertAfter;
		void InsertAfter (TopOpeBRepBuild_ListOfLoop & Other,TopOpeBRepBuild_ListIteratorOfListOfLoop & It);
};


%extend TopOpeBRepBuild_ListOfLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ListOfPave;
class TopOpeBRepBuild_ListOfPave {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ListOfPave;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_ListOfPave;
		 TopOpeBRepBuild_ListOfPave ();
		%feature("compactdefaultargs") TopOpeBRepBuild_ListOfPave;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfPave &
	:rtype: None
") TopOpeBRepBuild_ListOfPave;
		 TopOpeBRepBuild_ListOfPave (const TopOpeBRepBuild_ListOfPave & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfPave &
	:rtype: None
") Assign;
		void Assign (const TopOpeBRepBuild_ListOfPave & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfPave &
	:rtype: None
") operator =;
		void operator = (const TopOpeBRepBuild_ListOfPave & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepBuild_Pave &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TopOpeBRepBuild_Pave & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepBuild_Pave &
	:param theIt:
	:type theIt: TopOpeBRepBuild_ListIteratorOfListOfPave &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TopOpeBRepBuild_Pave & I,TopOpeBRepBuild_ListIteratorOfListOfPave & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfPave &
	:rtype: None
") Prepend;
		void Prepend (TopOpeBRepBuild_ListOfPave & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepBuild_Pave &
	:rtype: None
") Append;
		void Append (const Handle_TopOpeBRepBuild_Pave & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepBuild_Pave &
	:param theIt:
	:type theIt: TopOpeBRepBuild_ListIteratorOfListOfPave &
	:rtype: None
") Append;
		void Append (const Handle_TopOpeBRepBuild_Pave & I,TopOpeBRepBuild_ListIteratorOfListOfPave & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfPave &
	:rtype: None
") Append;
		void Append (TopOpeBRepBuild_ListOfPave & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepBuild_Pave
") First;
		Handle_TopOpeBRepBuild_Pave First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepBuild_Pave
") Last;
		Handle_TopOpeBRepBuild_Pave Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfPave &
	:rtype: None
") Remove;
		void Remove (TopOpeBRepBuild_ListIteratorOfListOfPave & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepBuild_Pave &
	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfPave &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_TopOpeBRepBuild_Pave & I,TopOpeBRepBuild_ListIteratorOfListOfPave & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfPave &
	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfPave &
	:rtype: None
") InsertBefore;
		void InsertBefore (TopOpeBRepBuild_ListOfPave & Other,TopOpeBRepBuild_ListIteratorOfListOfPave & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_TopOpeBRepBuild_Pave &
	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfPave &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_TopOpeBRepBuild_Pave & I,TopOpeBRepBuild_ListIteratorOfListOfPave & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfPave &
	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfPave &
	:rtype: None
") InsertAfter;
		void InsertAfter (TopOpeBRepBuild_ListOfPave & Other,TopOpeBRepBuild_ListIteratorOfListOfPave & It);
};


%extend TopOpeBRepBuild_ListOfPave {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ListOfShapeListOfShape;
class TopOpeBRepBuild_ListOfShapeListOfShape {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ListOfShapeListOfShape;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_ListOfShapeListOfShape;
		 TopOpeBRepBuild_ListOfShapeListOfShape ();
		%feature("compactdefaultargs") TopOpeBRepBuild_ListOfShapeListOfShape;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfShapeListOfShape &
	:rtype: None
") TopOpeBRepBuild_ListOfShapeListOfShape;
		 TopOpeBRepBuild_ListOfShapeListOfShape (const TopOpeBRepBuild_ListOfShapeListOfShape & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfShapeListOfShape &
	:rtype: None
") Assign;
		void Assign (const TopOpeBRepBuild_ListOfShapeListOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfShapeListOfShape &
	:rtype: None
") operator =;
		void operator = (const TopOpeBRepBuild_ListOfShapeListOfShape & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepBuild_ShapeListOfShape &
	:rtype: None
") Prepend;
		void Prepend (const TopOpeBRepBuild_ShapeListOfShape & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepBuild_ShapeListOfShape &
	:param theIt:
	:type theIt: TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape &
	:rtype: None
") Prepend;
		void Prepend (const TopOpeBRepBuild_ShapeListOfShape & I,TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfShapeListOfShape &
	:rtype: None
") Prepend;
		void Prepend (TopOpeBRepBuild_ListOfShapeListOfShape & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepBuild_ShapeListOfShape &
	:rtype: None
") Append;
		void Append (const TopOpeBRepBuild_ShapeListOfShape & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepBuild_ShapeListOfShape &
	:param theIt:
	:type theIt: TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape &
	:rtype: None
") Append;
		void Append (const TopOpeBRepBuild_ShapeListOfShape & I,TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfShapeListOfShape &
	:rtype: None
") Append;
		void Append (TopOpeBRepBuild_ListOfShapeListOfShape & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TopOpeBRepBuild_ShapeListOfShape
") First;
		TopOpeBRepBuild_ShapeListOfShape & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TopOpeBRepBuild_ShapeListOfShape
") Last;
		TopOpeBRepBuild_ShapeListOfShape & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape &
	:rtype: None
") Remove;
		void Remove (TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepBuild_ShapeListOfShape &
	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const TopOpeBRepBuild_ShapeListOfShape & I,TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfShapeListOfShape &
	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (TopOpeBRepBuild_ListOfShapeListOfShape & Other,TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRepBuild_ShapeListOfShape &
	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const TopOpeBRepBuild_ShapeListOfShape & I,TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRepBuild_ListOfShapeListOfShape &
	:param It:
	:type It: TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (TopOpeBRepBuild_ListOfShapeListOfShape & Other,TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape & It);
};


%extend TopOpeBRepBuild_ListOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_Loop;
class TopOpeBRepBuild_Loop : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_Loop;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") TopOpeBRepBuild_Loop;
		 TopOpeBRepBuild_Loop (const TopoDS_Shape & S);
		%feature("compactdefaultargs") TopOpeBRepBuild_Loop;
		%feature("autodoc", "	:param BI:
	:type BI: TopOpeBRepBuild_BlockIterator &
	:rtype: None
") TopOpeBRepBuild_Loop;
		 TopOpeBRepBuild_Loop (const TopOpeBRepBuild_BlockIterator & BI);
		%feature("compactdefaultargs") IsShape;
		%feature("autodoc", "	:rtype: bool
") IsShape;
		virtual Standard_Boolean IsShape ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		virtual const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") BlockIterator;
		%feature("autodoc", "	:rtype: TopOpeBRepBuild_BlockIterator
") BlockIterator;
		const TopOpeBRepBuild_BlockIterator & BlockIterator ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: void
") Dump;
		virtual void Dump ();
};


%extend TopOpeBRepBuild_Loop {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepBuild_Loop(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepBuild_Loop::Handle_TopOpeBRepBuild_Loop %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepBuild_Loop;
class Handle_TopOpeBRepBuild_Loop : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopOpeBRepBuild_Loop();
        Handle_TopOpeBRepBuild_Loop(const Handle_TopOpeBRepBuild_Loop &aHandle);
        Handle_TopOpeBRepBuild_Loop(const TopOpeBRepBuild_Loop *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepBuild_Loop DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepBuild_Loop {
    TopOpeBRepBuild_Loop* _get_reference() {
    return (TopOpeBRepBuild_Loop*)$self->Access();
    }
};

%extend Handle_TopOpeBRepBuild_Loop {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepBuild_Loop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_LoopClassifier;
class TopOpeBRepBuild_LoopClassifier {
	public:
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "	* Returns the state of loop <L1> compared with loop <L2>.

	:param L1:
	:type L1: Handle_TopOpeBRepBuild_Loop &
	:param L2:
	:type L2: Handle_TopOpeBRepBuild_Loop &
	:rtype: TopAbs_State
") Compare;
		virtual TopAbs_State Compare (const Handle_TopOpeBRepBuild_Loop & L1,const Handle_TopOpeBRepBuild_Loop & L2);
};


%extend TopOpeBRepBuild_LoopClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_LoopSet;
class TopOpeBRepBuild_LoopSet {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_LoopSet;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_LoopSet;
		 TopOpeBRepBuild_LoopSet ();
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") ChangeListOfLoop;
		%feature("autodoc", "	:rtype: TopOpeBRepBuild_ListOfLoop
") ChangeListOfLoop;
		TopOpeBRepBuild_ListOfLoop & ChangeListOfLoop ();
		%feature("compactdefaultargs") InitLoop;
		%feature("autodoc", "	:rtype: void
") InitLoop;
		virtual void InitLoop ();
		%feature("compactdefaultargs") MoreLoop;
		%feature("autodoc", "	:rtype: bool
") MoreLoop;
		virtual Standard_Boolean MoreLoop ();
		%feature("compactdefaultargs") NextLoop;
		%feature("autodoc", "	:rtype: void
") NextLoop;
		virtual void NextLoop ();
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepBuild_Loop
") Loop;
		Handle_TopOpeBRepBuild_Loop Loop ();
};


%extend TopOpeBRepBuild_LoopSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ShapeListOfShape;
class TopOpeBRepBuild_ShapeListOfShape {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeListOfShape;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_ShapeListOfShape;
		 TopOpeBRepBuild_ShapeListOfShape ();
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeListOfShape;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") TopOpeBRepBuild_ShapeListOfShape;
		 TopOpeBRepBuild_ShapeListOfShape (const TopoDS_Shape & S);
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeListOfShape;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param L:
	:type L: TopTools_ListOfShape &
	:rtype: None
") TopOpeBRepBuild_ShapeListOfShape;
		 TopOpeBRepBuild_ShapeListOfShape (const TopoDS_Shape & S,const TopTools_ListOfShape & L);
		%feature("compactdefaultargs") List;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") List;
		const TopTools_ListOfShape & List ();
		%feature("compactdefaultargs") ChangeList;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") ChangeList;
		TopTools_ListOfShape & ChangeList ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") ChangeShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") ChangeShape;
		TopoDS_Shape  ChangeShape ();
};


%extend TopOpeBRepBuild_ShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ShapeSet;
class TopOpeBRepBuild_ShapeSet {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ShapeSet;
		%feature("autodoc", "	* Creates a ShapeSet in order to build shapes connected by <SubShapeType> shapes. <checkshape>:check (or not) the shapes, startelements, elements added.

	:param SubShapeType:
	:type SubShapeType: TopAbs_ShapeEnum
	:param checkshape: default value is Standard_True
	:type checkshape: bool
	:rtype: None
") TopOpeBRepBuild_ShapeSet;
		 TopOpeBRepBuild_ShapeSet (const TopAbs_ShapeEnum SubShapeType,const Standard_Boolean checkshape = Standard_True);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "	* Adds <S> to the list of shapes. (wires or shells).

	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") AddShape;
		virtual void AddShape (const TopoDS_Shape & S);
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "	* (S is a face or edge) Add S to the list of starting shapes used for reconstructions. apply AddElement(S).

	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") AddStartElement;
		virtual void AddStartElement (const TopoDS_Shape & S);
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "	* for each subshape SE of S of type mySubShapeType - Add subshapes of S to the map of subshapes (mySubShapeMap) - Add S to the list of shape incident to subshapes of S.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") AddElement;
		virtual void AddElement (const TopoDS_Shape & S);
		%feature("compactdefaultargs") StartElements;
		%feature("autodoc", "	* return a reference on myStartShapes

	:rtype: TopTools_ListOfShape
") StartElements;
		const TopTools_ListOfShape & StartElements ();
		%feature("compactdefaultargs") InitShapes;
		%feature("autodoc", "	:rtype: None
") InitShapes;
		void InitShapes ();
		%feature("compactdefaultargs") MoreShapes;
		%feature("autodoc", "	:rtype: bool
") MoreShapes;
		Standard_Boolean MoreShapes ();
		%feature("compactdefaultargs") NextShape;
		%feature("autodoc", "	:rtype: None
") NextShape;
		void NextShape ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") InitStartElements;
		%feature("autodoc", "	:rtype: None
") InitStartElements;
		void InitStartElements ();
		%feature("compactdefaultargs") MoreStartElements;
		%feature("autodoc", "	:rtype: bool
") MoreStartElements;
		Standard_Boolean MoreStartElements ();
		%feature("compactdefaultargs") NextStartElement;
		%feature("autodoc", "	:rtype: None
") NextStartElement;
		void NextStartElement ();
		%feature("compactdefaultargs") StartElement;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") StartElement;
		const TopoDS_Shape  StartElement ();
		%feature("compactdefaultargs") InitNeighbours;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") InitNeighbours;
		virtual void InitNeighbours (const TopoDS_Shape & S);
		%feature("compactdefaultargs") MoreNeighbours;
		%feature("autodoc", "	:rtype: bool
") MoreNeighbours;
		Standard_Boolean MoreNeighbours ();
		%feature("compactdefaultargs") NextNeighbour;
		%feature("autodoc", "	:rtype: None
") NextNeighbour;
		void NextNeighbour ();
		%feature("compactdefaultargs") Neighbour;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Neighbour;
		const TopoDS_Shape  Neighbour ();
		%feature("compactdefaultargs") ChangeStartShapes;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") ChangeStartShapes;
		TopTools_ListOfShape & ChangeStartShapes ();
		%feature("compactdefaultargs") FindNeighbours;
		%feature("autodoc", "	* Build the list of neighbour shapes of myCurrentShape (neighbour shapes and myCurrentShapes are of type t) Initialize myIncidentShapesIter on neighbour shapes.

	:rtype: void
") FindNeighbours;
		virtual void FindNeighbours ();
		%feature("compactdefaultargs") MakeNeighboursList;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:param V:
	:type V: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") MakeNeighboursList;
		virtual const TopTools_ListOfShape & MakeNeighboursList (const TopoDS_Shape & E,const TopoDS_Shape & V);
		%feature("compactdefaultargs") MaxNumberSubShape;
		%feature("autodoc", "	:param Shape:
	:type Shape: TopoDS_Shape &
	:rtype: int
") MaxNumberSubShape;
		Standard_Integer MaxNumberSubShape (const TopoDS_Shape & Shape);
		%feature("compactdefaultargs") CheckShape;
		%feature("autodoc", "	:param checkshape:
	:type checkshape: bool
	:rtype: None
") CheckShape;
		void CheckShape (const Standard_Boolean checkshape);
		%feature("compactdefaultargs") CheckShape;
		%feature("autodoc", "	:rtype: bool
") CheckShape;
		Standard_Boolean CheckShape ();
		%feature("compactdefaultargs") CheckShape;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param checkgeom: default value is Standard_False
	:type checkgeom: bool
	:rtype: bool
") CheckShape;
		Standard_Boolean CheckShape (const TopoDS_Shape & S,const Standard_Boolean checkgeom = Standard_False);
		%feature("compactdefaultargs") DumpName;
		%feature("autodoc", "	:param OS:
	:type OS: Standard_OStream &
	:param str:
	:type str: TCollection_AsciiString &
	:rtype: None
") DumpName;
		void DumpName (Standard_OStream & OS,const TCollection_AsciiString & str);
		%feature("compactdefaultargs") DumpCheck;
		%feature("autodoc", "	:param OS:
	:type OS: Standard_OStream &
	:param str:
	:type str: TCollection_AsciiString &
	:param S:
	:type S: TopoDS_Shape &
	:param chk:
	:type chk: bool
	:rtype: None
") DumpCheck;
		void DumpCheck (Standard_OStream & OS,const TCollection_AsciiString & str,const TopoDS_Shape & S,const Standard_Boolean chk);
		%feature("compactdefaultargs") DumpSS;
		%feature("autodoc", "	:rtype: void
") DumpSS;
		virtual void DumpSS ();
		%feature("compactdefaultargs") DumpBB;
		%feature("autodoc", "	:rtype: void
") DumpBB;
		virtual void DumpBB ();
		%feature("compactdefaultargs") DEBName;
		%feature("autodoc", "	:param N:
	:type N: TCollection_AsciiString &
	:rtype: None
") DEBName;
		void DEBName (const TCollection_AsciiString & N);
		%feature("compactdefaultargs") DEBName;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") DEBName;
		const TCollection_AsciiString & DEBName ();
		%feature("compactdefaultargs") DEBNumber;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") DEBNumber;
		void DEBNumber (const Standard_Integer I);
		%feature("compactdefaultargs") DEBNumber;
		%feature("autodoc", "	:rtype: int
") DEBNumber;
		Standard_Integer DEBNumber ();
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param sb: default value is ""
	:type sb: TCollection_AsciiString &
	:param sa: default value is ""
	:type sa: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") SName;
		virtual TCollection_AsciiString SName (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param sb: default value is ""
	:type sb: TCollection_AsciiString &
	:param sa: default value is ""
	:type sa: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") SNameori;
		virtual TCollection_AsciiString SNameori (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "	:param S:
	:type S: TopTools_ListOfShape &
	:param sb: default value is ""
	:type sb: TCollection_AsciiString &
	:param sa: default value is ""
	:type sa: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") SName;
		virtual TCollection_AsciiString SName (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "	:param S:
	:type S: TopTools_ListOfShape &
	:param sb: default value is ""
	:type sb: TCollection_AsciiString &
	:param sa: default value is ""
	:type sa: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") SNameori;
		virtual TCollection_AsciiString SNameori (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
};


%extend TopOpeBRepBuild_ShapeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ShellToSolid;
class TopOpeBRepBuild_ShellToSolid {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellToSolid;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_ShellToSolid;
		 TopOpeBRepBuild_ShellToSolid ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") AddShell;
		%feature("autodoc", "	:param Sh:
	:type Sh: TopoDS_Shell &
	:rtype: None
") AddShell;
		void AddShell (const TopoDS_Shell & Sh);
		%feature("compactdefaultargs") MakeSolids;
		%feature("autodoc", "	:param So:
	:type So: TopoDS_Solid &
	:param LSo:
	:type LSo: TopTools_ListOfShape &
	:rtype: None
") MakeSolids;
		void MakeSolids (const TopoDS_Solid & So,TopTools_ListOfShape & LSo);
};


%extend TopOpeBRepBuild_ShellToSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_SolidBuilder;
class TopOpeBRepBuild_SolidBuilder {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidBuilder;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_SolidBuilder;
		 TopOpeBRepBuild_SolidBuilder ();
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidBuilder;
		%feature("autodoc", "	* Create a SolidBuilder to build the areas on the shapes (shells, blocks of faces) described by <LS>.

	:param FS:
	:type FS: TopOpeBRepBuild_ShellFaceSet &
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None
") TopOpeBRepBuild_SolidBuilder;
		 TopOpeBRepBuild_SolidBuilder (TopOpeBRepBuild_ShellFaceSet & FS,const Standard_Boolean ForceClass = Standard_False);
		%feature("compactdefaultargs") InitSolidBuilder;
		%feature("autodoc", "	:param FS:
	:type FS: TopOpeBRepBuild_ShellFaceSet &
	:param ForceClass:
	:type ForceClass: bool
	:rtype: None
") InitSolidBuilder;
		void InitSolidBuilder (TopOpeBRepBuild_ShellFaceSet & FS,const Standard_Boolean ForceClass);
		%feature("compactdefaultargs") InitSolid;
		%feature("autodoc", "	:rtype: int
") InitSolid;
		Standard_Integer InitSolid ();
		%feature("compactdefaultargs") MoreSolid;
		%feature("autodoc", "	:rtype: bool
") MoreSolid;
		Standard_Boolean MoreSolid ();
		%feature("compactdefaultargs") NextSolid;
		%feature("autodoc", "	:rtype: None
") NextSolid;
		void NextSolid ();
		%feature("compactdefaultargs") InitShell;
		%feature("autodoc", "	:rtype: int
") InitShell;
		Standard_Integer InitShell ();
		%feature("compactdefaultargs") MoreShell;
		%feature("autodoc", "	:rtype: bool
") MoreShell;
		Standard_Boolean MoreShell ();
		%feature("compactdefaultargs") NextShell;
		%feature("autodoc", "	:rtype: None
") NextShell;
		void NextShell ();
		%feature("compactdefaultargs") IsOldShell;
		%feature("autodoc", "	:rtype: bool
") IsOldShell;
		Standard_Boolean IsOldShell ();
		%feature("compactdefaultargs") OldShell;
		%feature("autodoc", "	* Returns current shell This shell may be : * an old shell OldShell(), which has not been reconstructed; * a new shell made of faces described by ...NewFace() methods.

	:rtype: TopoDS_Shape
") OldShell;
		const TopoDS_Shape  OldShell ();
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "	:rtype: int
") InitFace;
		Standard_Integer InitFace ();
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", "	:rtype: bool
") MoreFace;
		Standard_Boolean MoreFace ();
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "	:rtype: None
") NextFace;
		void NextFace ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* Returns current new face of current new shell.

	:rtype: TopoDS_Shape
") Face;
		const TopoDS_Shape  Face ();
};


%extend TopOpeBRepBuild_SolidBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TopOpeBRepBuild_Tools {
	public:
		%feature("compactdefaultargs") DumpMapOfShapeWithState;
		%feature("autodoc", "	:param iP:
	:type iP: int
	:param aMapOfShapeWithState:
	:type aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState &
	:rtype: void
") DumpMapOfShapeWithState;
		static void DumpMapOfShapeWithState (const Standard_Integer iP,const TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState);
		%feature("compactdefaultargs") FindState;
		%feature("autodoc", "	:param aVertex:
	:type aVertex: TopoDS_Shape &
	:param aState:
	:type aState: TopAbs_State
	:param aShapeEnum:
	:type aShapeEnum: TopAbs_ShapeEnum
	:param aMapVertexEdges:
	:type aMapVertexEdges: TopTools_IndexedDataMapOfShapeListOfShape &
	:param aMapProcessedVertices:
	:type aMapProcessedVertices: TopTools_MapOfShape &
	:param aMapVs:
	:type aMapVs: TopOpeBRepDS_DataMapOfShapeState &
	:rtype: void
") FindState;
		static void FindState (const TopoDS_Shape & aVertex,const TopAbs_State aState,const TopAbs_ShapeEnum aShapeEnum,const TopTools_IndexedDataMapOfShapeListOfShape & aMapVertexEdges,TopTools_MapOfShape & aMapProcessedVertices,TopOpeBRepDS_DataMapOfShapeState & aMapVs);
		%feature("compactdefaultargs") PropagateState;
		%feature("autodoc", "	:param aSplEdgesState:
	:type aSplEdgesState: TopOpeBRepDS_DataMapOfShapeState &
	:param anEdgesToRestMap:
	:type anEdgesToRestMap: TopTools_IndexedMapOfShape &
	:param aShapeEnum1:
	:type aShapeEnum1: TopAbs_ShapeEnum
	:param aShapeEnum2:
	:type aShapeEnum2: TopAbs_ShapeEnum
	:param aShapeClassifier:
	:type aShapeClassifier: TopOpeBRepTool_ShapeClassifier &
	:param aMapOfShapeWithState:
	:type aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState &
	:param anUnkStateShapes:
	:type anUnkStateShapes: TopTools_MapOfShape &
	:rtype: void
") PropagateState;
		static void PropagateState (const TopOpeBRepDS_DataMapOfShapeState & aSplEdgesState,const TopTools_IndexedMapOfShape & anEdgesToRestMap,const TopAbs_ShapeEnum aShapeEnum1,const TopAbs_ShapeEnum aShapeEnum2,TopOpeBRepTool_ShapeClassifier & aShapeClassifier,TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState,const TopTools_MapOfShape & anUnkStateShapes);
		%feature("compactdefaultargs") FindStateThroughVertex;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aShapeClassifier:
	:type aShapeClassifier: TopOpeBRepTool_ShapeClassifier &
	:param aMapOfShapeWithState:
	:type aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState &
	:param anAvoidSubshMap:
	:type anAvoidSubshMap: TopTools_MapOfShape &
	:rtype: TopAbs_State
") FindStateThroughVertex;
		static TopAbs_State FindStateThroughVertex (const TopoDS_Shape & aShape,TopOpeBRepTool_ShapeClassifier & aShapeClassifier,TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState,const TopTools_MapOfShape & anAvoidSubshMap);
		%feature("compactdefaultargs") PropagateStateForWires;
		%feature("autodoc", "	:param aFacesToRestMap:
	:type aFacesToRestMap: TopTools_IndexedMapOfShape &
	:param aMapOfShapeWithState:
	:type aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState &
	:rtype: void
") PropagateStateForWires;
		static void PropagateStateForWires (const TopTools_IndexedMapOfShape & aFacesToRestMap,TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState);
		%feature("compactdefaultargs") SpreadStateToChild;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aState:
	:type aState: TopAbs_State
	:param aMapOfShapeWithState:
	:type aMapOfShapeWithState: TopOpeBRepDS_IndexedDataMapOfShapeWithState &
	:rtype: void
") SpreadStateToChild;
		static void SpreadStateToChild (const TopoDS_Shape & aShape,const TopAbs_State aState,TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState);
		%feature("compactdefaultargs") FindState1;
		%feature("autodoc", "	:param anEdge:
	:type anEdge: TopoDS_Shape &
	:param aState:
	:type aState: TopAbs_State
	:param aMapEdgesFaces:
	:type aMapEdgesFaces: TopTools_IndexedDataMapOfShapeListOfShape &
	:param aMapProcessedVertices:
	:type aMapProcessedVertices: TopTools_MapOfShape &
	:param aMapVs:
	:type aMapVs: TopOpeBRepDS_DataMapOfShapeState &
	:rtype: void
") FindState1;
		static void FindState1 (const TopoDS_Shape & anEdge,const TopAbs_State aState,const TopTools_IndexedDataMapOfShapeListOfShape & aMapEdgesFaces,TopTools_MapOfShape & aMapProcessedVertices,TopOpeBRepDS_DataMapOfShapeState & aMapVs);
		%feature("compactdefaultargs") FindState2;
		%feature("autodoc", "	:param anEdge:
	:type anEdge: TopoDS_Shape &
	:param aState:
	:type aState: TopAbs_State
	:param aMapEdgesFaces:
	:type aMapEdgesFaces: TopTools_IndexedDataMapOfShapeListOfShape &
	:param aMapProcessedEdges:
	:type aMapProcessedEdges: TopTools_MapOfShape &
	:param aMapVs:
	:type aMapVs: TopOpeBRepDS_DataMapOfShapeState &
	:rtype: void
") FindState2;
		static void FindState2 (const TopoDS_Shape & anEdge,const TopAbs_State aState,const TopTools_IndexedDataMapOfShapeListOfShape & aMapEdgesFaces,TopTools_MapOfShape & aMapProcessedEdges,TopOpeBRepDS_DataMapOfShapeState & aMapVs);
		%feature("compactdefaultargs") GetAdjacentFace;
		%feature("autodoc", "	:param aFaceObj:
	:type aFaceObj: TopoDS_Shape &
	:param anEObj:
	:type anEObj: TopoDS_Shape &
	:param anEdgeFaceMap:
	:type anEdgeFaceMap: TopTools_IndexedDataMapOfShapeListOfShape &
	:param anAdjFaceObj:
	:type anAdjFaceObj: TopoDS_Shape &
	:rtype: bool
") GetAdjacentFace;
		static Standard_Boolean GetAdjacentFace (const TopoDS_Shape & aFaceObj,const TopoDS_Shape & anEObj,const TopTools_IndexedDataMapOfShapeListOfShape & anEdgeFaceMap,TopoDS_Shape & anAdjFaceObj);
		%feature("compactdefaultargs") GetNormalToFaceOnEdge;
		%feature("autodoc", "	:param aFObj:
	:type aFObj: TopoDS_Face &
	:param anEdgeObj:
	:type anEdgeObj: TopoDS_Edge &
	:param aDirNormal:
	:type aDirNormal: gp_Vec
	:rtype: void
") GetNormalToFaceOnEdge;
		static void GetNormalToFaceOnEdge (const TopoDS_Face & aFObj,const TopoDS_Edge & anEdgeObj,gp_Vec & aDirNormal);
		%feature("compactdefaultargs") GetNormalInNearestPoint;
		%feature("autodoc", "	* This function used to compute normal in point which is located near the point with param UV (used for computation of normals where the normal in the point UV equal to zero).

	:param aFace:
	:type aFace: TopoDS_Face &
	:param anEdge:
	:type anEdge: TopoDS_Edge &
	:param aNormal:
	:type aNormal: gp_Vec
	:rtype: void
") GetNormalInNearestPoint;
		static void GetNormalInNearestPoint (const TopoDS_Face & aFace,const TopoDS_Edge & anEdge,gp_Vec & aNormal);
		%feature("compactdefaultargs") GetTangentToEdgeEdge;
		%feature("autodoc", "	:param aFObj:
	:type aFObj: TopoDS_Face &
	:param anEdgeObj:
	:type anEdgeObj: TopoDS_Edge &
	:param aOriEObj:
	:type aOriEObj: TopoDS_Edge &
	:param aTangent:
	:type aTangent: gp_Vec
	:rtype: bool
") GetTangentToEdgeEdge;
		static Standard_Boolean GetTangentToEdgeEdge (const TopoDS_Face & aFObj,const TopoDS_Edge & anEdgeObj,const TopoDS_Edge & aOriEObj,gp_Vec & aTangent);
		%feature("compactdefaultargs") GetTangentToEdge;
		%feature("autodoc", "	:param anEdgeObj:
	:type anEdgeObj: TopoDS_Edge &
	:param aTangent:
	:type aTangent: gp_Vec
	:rtype: bool
") GetTangentToEdge;
		static Standard_Boolean GetTangentToEdge (const TopoDS_Edge & anEdgeObj,gp_Vec & aTangent);
		%feature("compactdefaultargs") UpdatePCurves;
		%feature("autodoc", "	* Recompute PCurves of the all edges from the wire on the <toFace>

	:param aWire:
	:type aWire: TopoDS_Wire &
	:param fromFace:
	:type fromFace: TopoDS_Face &
	:param toFace:
	:type toFace: TopoDS_Face &
	:rtype: void
") UpdatePCurves;
		static void UpdatePCurves (const TopoDS_Wire & aWire,const TopoDS_Face & fromFace,const TopoDS_Face & toFace);
		%feature("compactdefaultargs") UpdateEdgeOnPeriodicalFace;
		%feature("autodoc", "	* recompute PCurves of the closing (SIM , with 2 PCurves) edge on the NewFace

	:param aEdgeToUpdate:
	:type aEdgeToUpdate: TopoDS_Edge &
	:param OldFace:
	:type OldFace: TopoDS_Face &
	:param NewFace:
	:type NewFace: TopoDS_Face &
	:rtype: void
") UpdateEdgeOnPeriodicalFace;
		static void UpdateEdgeOnPeriodicalFace (const TopoDS_Edge & aEdgeToUpdate,const TopoDS_Face & OldFace,const TopoDS_Face & NewFace);
		%feature("compactdefaultargs") UpdateEdgeOnFace;
		%feature("autodoc", "	* recompute PCurve of the edge on the NewFace

	:param aEdgeToUpdate:
	:type aEdgeToUpdate: TopoDS_Edge &
	:param OldFace:
	:type OldFace: TopoDS_Face &
	:param NewFace:
	:type NewFace: TopoDS_Face &
	:rtype: void
") UpdateEdgeOnFace;
		static void UpdateEdgeOnFace (const TopoDS_Edge & aEdgeToUpdate,const TopoDS_Face & OldFace,const TopoDS_Face & NewFace);
		%feature("compactdefaultargs") IsDegEdgesTheSame;
		%feature("autodoc", "	:param anE1:
	:type anE1: TopoDS_Shape &
	:param anE2:
	:type anE2: TopoDS_Shape &
	:rtype: bool
") IsDegEdgesTheSame;
		static Standard_Boolean IsDegEdgesTheSame (const TopoDS_Shape & anE1,const TopoDS_Shape & anE2);
		%feature("compactdefaultargs") NormalizeFace;
		%feature("autodoc", "	* test if <oldFace> does not contain INTERNAL or EXTERNAL edges and remove such edges in case of its presence. The result is stored in <corrFace>

	:param oldFace:
	:type oldFace: TopoDS_Shape &
	:param corrFace:
	:type corrFace: TopoDS_Shape &
	:rtype: void
") NormalizeFace;
		static void NormalizeFace (const TopoDS_Shape & oldFace,TopoDS_Shape & corrFace);
		%feature("compactdefaultargs") CorrectFace2d;
		%feature("autodoc", "	* test if UV representation of <oldFace> is good (i.e. face is closed in 2d). if face is not closed , this method will try to close such face and will return corrected edges in the <aMapOfCorrect2dEdges>. Parameter <aSourceShapes> used to fix the edge (or wires) which should be correct (Corrector used it as a start shapes). NOTE : Parameter corrFace doesn't mean anything. If you want to use this method , rebuild resulting face after by yourself using corrected edges.

	:param oldFace:
	:type oldFace: TopoDS_Shape &
	:param corrFace:
	:type corrFace: TopoDS_Shape &
	:param aSourceShapes:
	:type aSourceShapes: TopTools_IndexedMapOfOrientedShape &
	:param aMapOfCorrect2dEdges:
	:type aMapOfCorrect2dEdges: TopTools_IndexedDataMapOfShapeShape &
	:rtype: void
") CorrectFace2d;
		static void CorrectFace2d (const TopoDS_Shape & oldFace,TopoDS_Shape & corrFace,const TopTools_IndexedMapOfOrientedShape & aSourceShapes,TopTools_IndexedDataMapOfShapeShape & aMapOfCorrect2dEdges);
		%feature("compactdefaultargs") CorrectTolerances;
		%feature("autodoc", "	:param aS:
	:type aS: TopoDS_Shape &
	:param aTolMax: default value is 0.0001
	:type aTolMax: float
	:rtype: void
") CorrectTolerances;
		static void CorrectTolerances (const TopoDS_Shape & aS,const Standard_Real aTolMax = 0.0001);
		%feature("compactdefaultargs") CorrectCurveOnSurface;
		%feature("autodoc", "	:param aS:
	:type aS: TopoDS_Shape &
	:param aTolMax: default value is 0.0001
	:type aTolMax: float
	:rtype: void
") CorrectCurveOnSurface;
		static void CorrectCurveOnSurface (const TopoDS_Shape & aS,const Standard_Real aTolMax = 0.0001);
		%feature("compactdefaultargs") CorrectPointOnCurve;
		%feature("autodoc", "	:param aS:
	:type aS: TopoDS_Shape &
	:param aTolMax: default value is 0.0001
	:type aTolMax: float
	:rtype: void
") CorrectPointOnCurve;
		static void CorrectPointOnCurve (const TopoDS_Shape & aS,const Standard_Real aTolMax = 0.0001);
		%feature("compactdefaultargs") CheckFaceClosed2d;
		%feature("autodoc", "	* Checks if <theFace> has the properly closed in 2D boundary(ies)

	:param theFace:
	:type theFace: TopoDS_Face &
	:rtype: bool
") CheckFaceClosed2d;
		static Standard_Boolean CheckFaceClosed2d (const TopoDS_Face & theFace);
};


%extend TopOpeBRepBuild_Tools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TopOpeBRepBuild_Tools2d {
	public:
		%feature("compactdefaultargs") MakeMapOfShapeVertexInfo;
		%feature("autodoc", "	:param aWire:
	:type aWire: TopoDS_Wire &
	:param aMap:
	:type aMap: TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo &
	:rtype: void
") MakeMapOfShapeVertexInfo;
		static void MakeMapOfShapeVertexInfo (const TopoDS_Wire & aWire,TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & aMap);
		%feature("compactdefaultargs") DumpMapOfShapeVertexInfo;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo &
	:rtype: void
") DumpMapOfShapeVertexInfo;
		static void DumpMapOfShapeVertexInfo (const TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & aMap);
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "	:param aWire:
	:type aWire: TopoDS_Wire &
	:param aResList:
	:type aResList: TopTools_ListOfShape &
	:rtype: void
") Path;
		static void Path (const TopoDS_Wire & aWire,TopTools_ListOfShape & aResList);
};


%extend TopOpeBRepBuild_Tools2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_VertexInfo;
class TopOpeBRepBuild_VertexInfo {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_VertexInfo;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_VertexInfo;
		 TopOpeBRepBuild_VertexInfo ();
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "	:param aV:
	:type aV: TopoDS_Vertex &
	:rtype: None
") SetVertex;
		void SetVertex (const TopoDS_Vertex & aV);
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex  Vertex ();
		%feature("compactdefaultargs") SetSmart;
		%feature("autodoc", "	:param aFlag:
	:type aFlag: bool
	:rtype: None
") SetSmart;
		void SetSmart (const Standard_Boolean aFlag);
		%feature("compactdefaultargs") Smart;
		%feature("autodoc", "	:rtype: bool
") Smart;
		Standard_Boolean Smart ();
		%feature("compactdefaultargs") NbCases;
		%feature("autodoc", "	:rtype: int
") NbCases;
		Standard_Integer NbCases ();
		%feature("compactdefaultargs") FoundOut;
		%feature("autodoc", "	:rtype: int
") FoundOut;
		Standard_Integer FoundOut ();
		%feature("compactdefaultargs") AddIn;
		%feature("autodoc", "	:param anE:
	:type anE: TopoDS_Edge &
	:rtype: None
") AddIn;
		void AddIn (const TopoDS_Edge & anE);
		%feature("compactdefaultargs") AddOut;
		%feature("autodoc", "	:param anE:
	:type anE: TopoDS_Edge &
	:rtype: None
") AddOut;
		void AddOut (const TopoDS_Edge & anE);
		%feature("compactdefaultargs") SetCurrentIn;
		%feature("autodoc", "	:param anE:
	:type anE: TopoDS_Edge &
	:rtype: None
") SetCurrentIn;
		void SetCurrentIn (const TopoDS_Edge & anE);
		%feature("compactdefaultargs") EdgesIn;
		%feature("autodoc", "	:rtype: TopTools_IndexedMapOfOrientedShape
") EdgesIn;
		const TopTools_IndexedMapOfOrientedShape & EdgesIn ();
		%feature("compactdefaultargs") EdgesOut;
		%feature("autodoc", "	:rtype: TopTools_IndexedMapOfOrientedShape
") EdgesOut;
		const TopTools_IndexedMapOfOrientedShape & EdgesOut ();
		%feature("compactdefaultargs") ChangeEdgesOut;
		%feature("autodoc", "	:rtype: TopTools_IndexedMapOfOrientedShape
") ChangeEdgesOut;
		TopTools_IndexedMapOfOrientedShape & ChangeEdgesOut ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") CurrentOut;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") CurrentOut;
		const TopoDS_Edge  CurrentOut ();
		%feature("compactdefaultargs") AppendPassed;
		%feature("autodoc", "	:param anE:
	:type anE: TopoDS_Edge &
	:rtype: None
") AppendPassed;
		void AppendPassed (const TopoDS_Edge & anE);
		%feature("compactdefaultargs") RemovePassed;
		%feature("autodoc", "	:rtype: None
") RemovePassed;
		void RemovePassed ();
		%feature("compactdefaultargs") ListPassed;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") ListPassed;
		const TopTools_ListOfShape & ListPassed ();
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "	:param aL:
	:type aL: TopTools_ListOfShape &
	:rtype: None
") Prepare;
		void Prepare (const TopTools_ListOfShape & aL);
};


%extend TopOpeBRepBuild_VertexInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_WireToFace;
class TopOpeBRepBuild_WireToFace {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_WireToFace;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_WireToFace;
		 TopOpeBRepBuild_WireToFace ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") AddWire;
		void AddWire (const TopoDS_Wire & W);
		%feature("compactdefaultargs") MakeFaces;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param LF:
	:type LF: TopTools_ListOfShape &
	:rtype: None
") MakeFaces;
		void MakeFaces (const TopoDS_Face & F,TopTools_ListOfShape & LF);
};


%extend TopOpeBRepBuild_WireToFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_Area1dBuilder;
class TopOpeBRepBuild_Area1dBuilder : public TopOpeBRepBuild_AreaBuilder {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_Area1dBuilder;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_Area1dBuilder;
		 TopOpeBRepBuild_Area1dBuilder ();
		%feature("compactdefaultargs") TopOpeBRepBuild_Area1dBuilder;
		%feature("autodoc", "	* Creates a Area1dBuilder to find the areas of the shapes described by <LS> using the classifier <LC>.

	:param LS:
	:type LS: TopOpeBRepBuild_PaveSet &
	:param LC:
	:type LC: TopOpeBRepBuild_PaveClassifier &
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None
") TopOpeBRepBuild_Area1dBuilder;
		 TopOpeBRepBuild_Area1dBuilder (TopOpeBRepBuild_PaveSet & LS,TopOpeBRepBuild_PaveClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "	* Sets a Area1dBuilder to find the areas of the shapes described by <LS> using the classifier <LC>.

	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet &
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier &
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: void
") InitAreaBuilder;
		virtual void InitAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("compactdefaultargs") ADD_Loop_TO_LISTOFLoop;
		%feature("autodoc", "	:param L:
	:type L: Handle_TopOpeBRepBuild_Loop &
	:param LOL:
	:type LOL: TopOpeBRepBuild_ListOfLoop &
	:param s: default value is NULL
	:type s: Standard_Address
	:rtype: void
") ADD_Loop_TO_LISTOFLoop;
		virtual void ADD_Loop_TO_LISTOFLoop (const Handle_TopOpeBRepBuild_Loop & L,TopOpeBRepBuild_ListOfLoop & LOL,const Standard_Address s = NULL);
		%feature("compactdefaultargs") REM_Loop_FROM_LISTOFLoop;
		%feature("autodoc", "	:param ITLOL:
	:type ITLOL: TopOpeBRepBuild_ListIteratorOfListOfLoop &
	:param LOL:
	:type LOL: TopOpeBRepBuild_ListOfLoop &
	:param s: default value is NULL
	:type s: Standard_Address
	:rtype: void
") REM_Loop_FROM_LISTOFLoop;
		virtual void REM_Loop_FROM_LISTOFLoop (TopOpeBRepBuild_ListIteratorOfListOfLoop & ITLOL,TopOpeBRepBuild_ListOfLoop & LOL,const Standard_Address s = NULL);
		%feature("compactdefaultargs") ADD_LISTOFLoop_TO_LISTOFLoop;
		%feature("autodoc", "	:param LOL1:
	:type LOL1: TopOpeBRepBuild_ListOfLoop &
	:param LOL2:
	:type LOL2: TopOpeBRepBuild_ListOfLoop &
	:param s: default value is NULL
	:type s: Standard_Address
	:param s1: default value is NULL
	:type s1: Standard_Address
	:param s2: default value is NULL
	:type s2: Standard_Address
	:rtype: void
") ADD_LISTOFLoop_TO_LISTOFLoop;
		virtual void ADD_LISTOFLoop_TO_LISTOFLoop (TopOpeBRepBuild_ListOfLoop & LOL1,TopOpeBRepBuild_ListOfLoop & LOL2,const Standard_Address s = NULL,const Standard_Address s1 = NULL,const Standard_Address s2 = NULL);
		%feature("compactdefaultargs") DumpList;
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRepBuild_ListOfLoop &
	:rtype: void
") DumpList;
		static void DumpList (const TopOpeBRepBuild_ListOfLoop & L);
};


%extend TopOpeBRepBuild_Area1dBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_Area2dBuilder;
class TopOpeBRepBuild_Area2dBuilder : public TopOpeBRepBuild_AreaBuilder {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_Area2dBuilder;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_Area2dBuilder;
		 TopOpeBRepBuild_Area2dBuilder ();
		%feature("compactdefaultargs") TopOpeBRepBuild_Area2dBuilder;
		%feature("autodoc", "	* Creates a Area2dBuilder to build faces on the (wires,blocks of edge) of <LS>, using the classifier <LC>.

	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet &
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier &
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None
") TopOpeBRepBuild_Area2dBuilder;
		 TopOpeBRepBuild_Area2dBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "	* Sets a Area1dBuilder to find the areas of the shapes described by <LS> using the classifier <LC>.

	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet &
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier &
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: void
") InitAreaBuilder;
		virtual void InitAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
};


%extend TopOpeBRepBuild_Area2dBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_Area3dBuilder;
class TopOpeBRepBuild_Area3dBuilder : public TopOpeBRepBuild_AreaBuilder {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_Area3dBuilder;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_Area3dBuilder;
		 TopOpeBRepBuild_Area3dBuilder ();
		%feature("compactdefaultargs") TopOpeBRepBuild_Area3dBuilder;
		%feature("autodoc", "	* Creates a Area3dBuilder to build Solids on the (shells,blocks of face) of <LS>, using the classifier <LC>.

	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet &
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier &
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None
") TopOpeBRepBuild_Area3dBuilder;
		 TopOpeBRepBuild_Area3dBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("compactdefaultargs") InitAreaBuilder;
		%feature("autodoc", "	* Sets a Area1dBuilder to find the areas of the shapes described by <LS> using the classifier <LC>.

	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet &
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier &
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: void
") InitAreaBuilder;
		virtual void InitAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
};


%extend TopOpeBRepBuild_Area3dBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_Builder1;
class TopOpeBRepBuild_Builder1 : public TopOpeBRepBuild_Builder {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_Builder1;
		%feature("autodoc", "	:param BT:
	:type BT: TopOpeBRepDS_BuildTool &
	:rtype: None
") TopOpeBRepBuild_Builder1;
		 TopOpeBRepBuild_Builder1 (const TopOpeBRepDS_BuildTool & BT);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Removes all splits and merges already performed. Does NOT clear the handled DS (except ShapeWithStatesMaps).

	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: void
") Perform;
		virtual void Perform (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: void
") Perform;
		virtual void Perform (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", "	:rtype: void
") MergeKPart;
		virtual void MergeKPart ();
		%feature("compactdefaultargs") MergeKPart;
		%feature("autodoc", "	:param TB1:
	:type TB1: TopAbs_State
	:param TB2:
	:type TB2: TopAbs_State
	:rtype: void
") MergeKPart;
		virtual void MergeKPart (const TopAbs_State TB1,const TopAbs_State TB2);
		%feature("compactdefaultargs") GFillSolidSFS;
		%feature("autodoc", "	:param SO1:
	:type SO1: TopoDS_Shape &
	:param LSO2:
	:type LSO2: TopTools_ListOfShape &
	:param G:
	:type G: TopOpeBRepBuild_GTopo &
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet &
	:rtype: void
") GFillSolidSFS;
		virtual void GFillSolidSFS (const TopoDS_Shape & SO1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);
		%feature("compactdefaultargs") GFillShellSFS;
		%feature("autodoc", "	:param SH1:
	:type SH1: TopoDS_Shape &
	:param LSO2:
	:type LSO2: TopTools_ListOfShape &
	:param G:
	:type G: TopOpeBRepBuild_GTopo &
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet &
	:rtype: void
") GFillShellSFS;
		virtual void GFillShellSFS (const TopoDS_Shape & SH1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);
		%feature("compactdefaultargs") GWESMakeFaces;
		%feature("autodoc", "	:param FF:
	:type FF: TopoDS_Shape &
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet &
	:param LOF:
	:type LOF: TopTools_ListOfShape &
	:rtype: void
") GWESMakeFaces;
		virtual void GWESMakeFaces (const TopoDS_Shape & FF,TopOpeBRepBuild_WireEdgeSet & WES,TopTools_ListOfShape & LOF);
		%feature("compactdefaultargs") GFillFaceNotSameDomSFS;
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Shape &
	:param LSO2:
	:type LSO2: TopTools_ListOfShape &
	:param G:
	:type G: TopOpeBRepBuild_GTopo &
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet &
	:rtype: None
") GFillFaceNotSameDomSFS;
		void GFillFaceNotSameDomSFS (const TopoDS_Shape & F1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);
		%feature("compactdefaultargs") GFillFaceNotSameDomWES;
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Shape &
	:param LSO2:
	:type LSO2: TopTools_ListOfShape &
	:param G:
	:type G: TopOpeBRepBuild_GTopo &
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet &
	:rtype: None
") GFillFaceNotSameDomWES;
		void GFillFaceNotSameDomWES (const TopoDS_Shape & F1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);
		%feature("compactdefaultargs") GFillWireNotSameDomWES;
		%feature("autodoc", "	:param W1:
	:type W1: TopoDS_Shape &
	:param LSO2:
	:type LSO2: TopTools_ListOfShape &
	:param G:
	:type G: TopOpeBRepBuild_GTopo &
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet &
	:rtype: None
") GFillWireNotSameDomWES;
		void GFillWireNotSameDomWES (const TopoDS_Shape & W1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);
		%feature("compactdefaultargs") GFillEdgeNotSameDomWES;
		%feature("autodoc", "	:param E1:
	:type E1: TopoDS_Shape &
	:param LSO2:
	:type LSO2: TopTools_ListOfShape &
	:param G:
	:type G: TopOpeBRepBuild_GTopo &
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet &
	:rtype: None
") GFillEdgeNotSameDomWES;
		void GFillEdgeNotSameDomWES (const TopoDS_Shape & E1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);
		%feature("compactdefaultargs") GFillFaceSameDomSFS;
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Shape &
	:param LSO2:
	:type LSO2: TopTools_ListOfShape &
	:param G:
	:type G: TopOpeBRepBuild_GTopo &
	:param SFS:
	:type SFS: TopOpeBRepBuild_ShellFaceSet &
	:rtype: None
") GFillFaceSameDomSFS;
		void GFillFaceSameDomSFS (const TopoDS_Shape & F1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);
		%feature("compactdefaultargs") GFillFaceSameDomWES;
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Shape &
	:param LSO2:
	:type LSO2: TopTools_ListOfShape &
	:param G:
	:type G: TopOpeBRepBuild_GTopo &
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet &
	:rtype: None
") GFillFaceSameDomWES;
		void GFillFaceSameDomWES (const TopoDS_Shape & F1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);
		%feature("compactdefaultargs") GFillWireSameDomWES;
		%feature("autodoc", "	:param W1:
	:type W1: TopoDS_Shape &
	:param LSO2:
	:type LSO2: TopTools_ListOfShape &
	:param G:
	:type G: TopOpeBRepBuild_GTopo &
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet &
	:rtype: None
") GFillWireSameDomWES;
		void GFillWireSameDomWES (const TopoDS_Shape & W1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);
		%feature("compactdefaultargs") GFillEdgeSameDomWES;
		%feature("autodoc", "	:param E1:
	:type E1: TopoDS_Shape &
	:param LSO2:
	:type LSO2: TopTools_ListOfShape &
	:param G:
	:type G: TopOpeBRepBuild_GTopo &
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet &
	:rtype: None
") GFillEdgeSameDomWES;
		void GFillEdgeSameDomWES (const TopoDS_Shape & E1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);
		%feature("compactdefaultargs") PerformONParts;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Shape &
	:param SDfaces:
	:type SDfaces: TopTools_IndexedMapOfShape &
	:param G:
	:type G: TopOpeBRepBuild_GTopo &
	:param WES:
	:type WES: TopOpeBRepBuild_WireEdgeSet &
	:rtype: None
") PerformONParts;
		void PerformONParts (const TopoDS_Shape & F,const TopTools_IndexedMapOfShape & SDfaces,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);
		%feature("compactdefaultargs") PerformPieceIn2D;
		%feature("autodoc", "	:param aPieceToPerform:
	:type aPieceToPerform: TopoDS_Edge &
	:param aOriginalEdge:
	:type aOriginalEdge: TopoDS_Edge &
	:param edgeFace:
	:type edgeFace: TopoDS_Face &
	:param toFace:
	:type toFace: TopoDS_Face &
	:param G:
	:type G: TopOpeBRepBuild_GTopo &
	:param keep:
	:type keep: bool
	:rtype: None
") PerformPieceIn2D;
		void PerformPieceIn2D (const TopoDS_Edge & aPieceToPerform,const TopoDS_Edge & aOriginalEdge,const TopoDS_Face & edgeFace,const TopoDS_Face & toFace,const TopOpeBRepBuild_GTopo & G,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") PerformPieceOn2D;
		%feature("autodoc", "	:param aPieceObj:
	:type aPieceObj: TopoDS_Shape &
	:param aFaceObj:
	:type aFaceObj: TopoDS_Shape &
	:param aEdgeObj:
	:type aEdgeObj: TopoDS_Shape &
	:param aListOfPieces:
	:type aListOfPieces: TopTools_ListOfShape &
	:param aListOfFaces:
	:type aListOfFaces: TopTools_ListOfShape &
	:param aListOfPiecesOut2d:
	:type aListOfPiecesOut2d: TopTools_ListOfShape &
	:rtype: int
") PerformPieceOn2D;
		Standard_Integer PerformPieceOn2D (const TopoDS_Shape & aPieceObj,const TopoDS_Shape & aFaceObj,const TopoDS_Shape & aEdgeObj,TopTools_ListOfShape & aListOfPieces,TopTools_ListOfShape & aListOfFaces,TopTools_ListOfShape & aListOfPiecesOut2d);
		%feature("compactdefaultargs") TwoPiecesON;
		%feature("autodoc", "	:param aSeq:
	:type aSeq: TopTools_SequenceOfShape &
	:param aListOfPieces:
	:type aListOfPieces: TopTools_ListOfShape &
	:param aListOfFaces:
	:type aListOfFaces: TopTools_ListOfShape &
	:param aListOfPiecesOut2d:
	:type aListOfPiecesOut2d: TopTools_ListOfShape &
	:rtype: int
") TwoPiecesON;
		Standard_Integer TwoPiecesON (const TopTools_SequenceOfShape & aSeq,TopTools_ListOfShape & aListOfPieces,TopTools_ListOfShape & aListOfFaces,TopTools_ListOfShape & aListOfPiecesOut2d);
		%feature("compactdefaultargs") CorrectResult2d;
		%feature("autodoc", "	:param aResult:
	:type aResult: TopoDS_Shape &
	:rtype: int
") CorrectResult2d;
		Standard_Integer CorrectResult2d (TopoDS_Shape & aResult);
};


%extend TopOpeBRepBuild_Builder1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_CompositeClassifier;
class TopOpeBRepBuild_CompositeClassifier : public TopOpeBRepBuild_LoopClassifier {
	public:
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "	:param L1:
	:type L1: Handle_TopOpeBRepBuild_Loop &
	:param L2:
	:type L2: Handle_TopOpeBRepBuild_Loop &
	:rtype: TopAbs_State
") Compare;
		virtual TopAbs_State Compare (const Handle_TopOpeBRepBuild_Loop & L1,const Handle_TopOpeBRepBuild_Loop & L2);
		%feature("compactdefaultargs") CompareShapes;
		%feature("autodoc", "	* classify shape <B1> with shape <B2>

	:param B1:
	:type B1: TopoDS_Shape &
	:param B2:
	:type B2: TopoDS_Shape &
	:rtype: TopAbs_State
") CompareShapes;
		virtual TopAbs_State CompareShapes (const TopoDS_Shape & B1,const TopoDS_Shape & B2);
		%feature("compactdefaultargs") CompareElementToShape;
		%feature("autodoc", "	* classify element <E> with shape <B>

	:param E:
	:type E: TopoDS_Shape &
	:param B:
	:type B: TopoDS_Shape &
	:rtype: TopAbs_State
") CompareElementToShape;
		virtual TopAbs_State CompareElementToShape (const TopoDS_Shape & E,const TopoDS_Shape & B);
		%feature("compactdefaultargs") ResetShape;
		%feature("autodoc", "	* prepare classification involving shape <B> calls ResetElement on first element of <B>

	:param B:
	:type B: TopoDS_Shape &
	:rtype: void
") ResetShape;
		virtual void ResetShape (const TopoDS_Shape & B);
		%feature("compactdefaultargs") ResetElement;
		%feature("autodoc", "	* prepare classification involving element <E>.

	:param E:
	:type E: TopoDS_Shape &
	:rtype: void
") ResetElement;
		virtual void ResetElement (const TopoDS_Shape & E);
		%feature("compactdefaultargs") CompareElement;
		%feature("autodoc", "	* Add element <E> in the set of elements used in classification. Returns False if the element <E> has been already added to the set of elements, otherwise returns True.

	:param E:
	:type E: TopoDS_Shape &
	:rtype: bool
") CompareElement;
		virtual Standard_Boolean CompareElement (const TopoDS_Shape & E);
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	* Returns state of classification of 2D point, defined by ResetElement, with the current set of elements, defined by Compare.

	:rtype: TopAbs_State
") State;
		virtual TopAbs_State State ();
};


%extend TopOpeBRepBuild_CompositeClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_Pave;
class TopOpeBRepBuild_Pave : public TopOpeBRepBuild_Loop {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_Pave;
		%feature("autodoc", "	* V = vertex, P = parameter of vertex <V> bound = True if <V> is an old vertex bound = False if <V> is a new vertex

	:param V:
	:type V: TopoDS_Shape &
	:param P:
	:type P: float
	:param bound:
	:type bound: bool
	:rtype: None
") TopOpeBRepBuild_Pave;
		 TopOpeBRepBuild_Pave (const TopoDS_Shape & V,const Standard_Real P,const Standard_Boolean bound);
		%feature("compactdefaultargs") HasSameDomain;
		%feature("autodoc", "	:param b:
	:type b: bool
	:rtype: None
") HasSameDomain;
		void HasSameDomain (const Standard_Boolean b);
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "	:param VSD:
	:type VSD: TopoDS_Shape &
	:rtype: None
") SameDomain;
		void SameDomain (const TopoDS_Shape & VSD);
		%feature("compactdefaultargs") HasSameDomain;
		%feature("autodoc", "	:rtype: bool
") HasSameDomain;
		Standard_Boolean HasSameDomain ();
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") SameDomain;
		const TopoDS_Shape  SameDomain ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Vertex;
		const TopoDS_Shape  Vertex ();
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") ChangeVertex;
		TopoDS_Shape  ChangeVertex ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param Par:
	:type Par: float
	:rtype: None
") Parameter;
		void Parameter (const Standard_Real Par);
		%feature("compactdefaultargs") InterferenceType;
		%feature("autodoc", "	:rtype: TopOpeBRepDS_Kind
") InterferenceType;
		TopOpeBRepDS_Kind & InterferenceType ();
		%feature("compactdefaultargs") IsShape;
		%feature("autodoc", "	:rtype: bool
") IsShape;
		virtual Standard_Boolean IsShape ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		virtual const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: void
") Dump;
		virtual void Dump ();
};


%extend TopOpeBRepBuild_Pave {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopOpeBRepBuild_Pave(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopOpeBRepBuild_Pave::Handle_TopOpeBRepBuild_Pave %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TopOpeBRepBuild_Pave;
class Handle_TopOpeBRepBuild_Pave : public Handle_TopOpeBRepBuild_Loop {

    public:
        // constructors
        Handle_TopOpeBRepBuild_Pave();
        Handle_TopOpeBRepBuild_Pave(const Handle_TopOpeBRepBuild_Pave &aHandle);
        Handle_TopOpeBRepBuild_Pave(const TopOpeBRepBuild_Pave *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRepBuild_Pave DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRepBuild_Pave {
    TopOpeBRepBuild_Pave* _get_reference() {
    return (TopOpeBRepBuild_Pave*)$self->Access();
    }
};

%extend Handle_TopOpeBRepBuild_Pave {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopOpeBRepBuild_Pave {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_PaveClassifier;
class TopOpeBRepBuild_PaveClassifier : public TopOpeBRepBuild_LoopClassifier {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_PaveClassifier;
		%feature("autodoc", "	* Create a Pave classifier to compare vertices on edge <E>.

	:param E:
	:type E: TopoDS_Shape &
	:rtype: None
") TopOpeBRepBuild_PaveClassifier;
		 TopOpeBRepBuild_PaveClassifier (const TopoDS_Shape & E);
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "	* Returns state of vertex <L1> compared with <L2>.

	:param L1:
	:type L1: Handle_TopOpeBRepBuild_Loop &
	:param L2:
	:type L2: Handle_TopOpeBRepBuild_Loop &
	:rtype: TopAbs_State
") Compare;
		TopAbs_State Compare (const Handle_TopOpeBRepBuild_Loop & L1,const Handle_TopOpeBRepBuild_Loop & L2);
		%feature("compactdefaultargs") SetFirstParameter;
		%feature("autodoc", "	:param P:
	:type P: float
	:rtype: None
") SetFirstParameter;
		void SetFirstParameter (const Standard_Real P);
		%feature("compactdefaultargs") ClosedVertices;
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") ClosedVertices;
		void ClosedVertices (const Standard_Boolean B);
		%feature("compactdefaultargs") AdjustCase;
		%feature("autodoc", "	:param p1:
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
	:type cas: int &
	:rtype: float
") AdjustCase;
		static Standard_Real AdjustCase (const Standard_Real p1,const TopAbs_Orientation o,const Standard_Real first,const Standard_Real period,const Standard_Real tol,Standard_Integer &OutValue);
};


%extend TopOpeBRepBuild_PaveClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_PaveSet;
class TopOpeBRepBuild_PaveSet : public TopOpeBRepBuild_LoopSet {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_PaveSet;
		%feature("autodoc", "	* Create a Pave set on edge <E>. It contains <E> vertices.

	:param E:
	:type E: TopoDS_Shape &
	:rtype: None
") TopOpeBRepBuild_PaveSet;
		 TopOpeBRepBuild_PaveSet (const TopoDS_Shape & E);
		%feature("compactdefaultargs") RemovePV;
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") RemovePV;
		void RemovePV (const Standard_Boolean B);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Add <PV> in the Pave set.

	:param PV:
	:type PV: Handle_TopOpeBRepBuild_Pave &
	:rtype: None
") Append;
		void Append (const Handle_TopOpeBRepBuild_Pave & PV);
		%feature("compactdefaultargs") InitLoop;
		%feature("autodoc", "	:rtype: void
") InitLoop;
		virtual void InitLoop ();
		%feature("compactdefaultargs") MoreLoop;
		%feature("autodoc", "	:rtype: bool
") MoreLoop;
		virtual Standard_Boolean MoreLoop ();
		%feature("compactdefaultargs") NextLoop;
		%feature("autodoc", "	:rtype: void
") NextLoop;
		virtual void NextLoop ();
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepBuild_Loop
") Loop;
		Handle_TopOpeBRepBuild_Loop Loop ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge ();
		%feature("compactdefaultargs") HasEqualParameters;
		%feature("autodoc", "	:rtype: bool
") HasEqualParameters;
		Standard_Boolean HasEqualParameters ();
		%feature("compactdefaultargs") EqualParameters;
		%feature("autodoc", "	:rtype: float
") EqualParameters;
		Standard_Real EqualParameters ();
		%feature("compactdefaultargs") ClosedVertices;
		%feature("autodoc", "	:rtype: bool
") ClosedVertices;
		Standard_Boolean ClosedVertices ();
		%feature("compactdefaultargs") SortPave;
		%feature("autodoc", "	:param Lin:
	:type Lin: TopOpeBRepBuild_ListOfPave &
	:param Lout:
	:type Lout: TopOpeBRepBuild_ListOfPave &
	:rtype: void
") SortPave;
		static void SortPave (const TopOpeBRepBuild_ListOfPave & Lin,TopOpeBRepBuild_ListOfPave & Lout);
};


%extend TopOpeBRepBuild_PaveSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ShellFaceSet;
class TopOpeBRepBuild_ShellFaceSet : public TopOpeBRepBuild_ShapeSet {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellFaceSet;
		%feature("autodoc", "	* Creates a ShellFaceSet to build blocks of faces connected by edges.

	:rtype: None
") TopOpeBRepBuild_ShellFaceSet;
		 TopOpeBRepBuild_ShellFaceSet ();
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellFaceSet;
		%feature("autodoc", "	* Creates a ShellFaceSet to build blocks of faces connected by edges.

	:param S:
	:type S: TopoDS_Shape &
	:param Addr: default value is NULL
	:type Addr: Standard_Address
	:rtype: None
") TopOpeBRepBuild_ShellFaceSet;
		 TopOpeBRepBuild_ShellFaceSet (const TopoDS_Shape & S,const Standard_Address Addr = NULL);
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "	:rtype: TopoDS_Solid
") Solid;
		const TopoDS_Solid  Solid ();
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") AddShape;
		virtual void AddShape (const TopoDS_Shape & S);
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") AddStartElement;
		virtual void AddStartElement (const TopoDS_Shape & S);
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") AddElement;
		virtual void AddElement (const TopoDS_Shape & S);
		%feature("compactdefaultargs") DumpSS;
		%feature("autodoc", "	:rtype: void
") DumpSS;
		virtual void DumpSS ();
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param sb: default value is ""
	:type sb: TCollection_AsciiString &
	:param sa: default value is ""
	:type sa: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") SName;
		virtual TCollection_AsciiString SName (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "	:param S:
	:type S: TopTools_ListOfShape &
	:param sb: default value is ""
	:type sb: TCollection_AsciiString &
	:param sa: default value is ""
	:type sa: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") SName;
		virtual TCollection_AsciiString SName (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param sb: default value is ""
	:type sb: TCollection_AsciiString &
	:param sa: default value is ""
	:type sa: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") SNameori;
		virtual TCollection_AsciiString SNameori (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "	:param S:
	:type S: TopTools_ListOfShape &
	:param sb: default value is ""
	:type sb: TCollection_AsciiString &
	:param sa: default value is ""
	:type sa: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") SNameori;
		virtual TCollection_AsciiString SNameori (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
};


%extend TopOpeBRepBuild_ShellFaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_WireEdgeSet;
class TopOpeBRepBuild_WireEdgeSet : public TopOpeBRepBuild_ShapeSet {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_WireEdgeSet;
		%feature("autodoc", "	* Creates a WireEdgeSet to build edges connected by vertices on face F. Edges of the WireEdgeSet must have a representation on surface of face F.

	:param F:
	:type F: TopoDS_Shape &
	:param Addr: default value is NULL
	:type Addr: Standard_Address
	:rtype: None
") TopOpeBRepBuild_WireEdgeSet;
		 TopOpeBRepBuild_WireEdgeSet (const TopoDS_Shape & F,const Standard_Address Addr = NULL);
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* value of field myFace

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") AddShape;
		virtual void AddShape (const TopoDS_Shape & S);
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") AddStartElement;
		virtual void AddStartElement (const TopoDS_Shape & S);
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") AddElement;
		virtual void AddElement (const TopoDS_Shape & S);
		%feature("compactdefaultargs") InitNeighbours;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:rtype: void
") InitNeighbours;
		virtual void InitNeighbours (const TopoDS_Shape & E);
		%feature("compactdefaultargs") FindNeighbours;
		%feature("autodoc", "	* Build the list of neighbour edges of edge myCurrentShape Initialize iterator of neighbour edges to edge myCurrentShape

	:rtype: void
") FindNeighbours;
		virtual void FindNeighbours ();
		%feature("compactdefaultargs") MakeNeighboursList;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:param V:
	:type V: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") MakeNeighboursList;
		virtual const TopTools_ListOfShape & MakeNeighboursList (const TopoDS_Shape & E,const TopoDS_Shape & V);
		%feature("compactdefaultargs") IsUVISO;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param uiso:
	:type uiso: bool
	:param viso:
	:type viso: bool
	:rtype: void
") IsUVISO;
		static void IsUVISO (const TopoDS_Edge & E,const TopoDS_Face & F,Standard_Boolean &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") DumpSS;
		%feature("autodoc", "	:rtype: void
") DumpSS;
		virtual void DumpSS ();
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param sb: default value is ""
	:type sb: TCollection_AsciiString &
	:param sa: default value is ""
	:type sa: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") SName;
		virtual TCollection_AsciiString SName (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("compactdefaultargs") SName;
		%feature("autodoc", "	:param S:
	:type S: TopTools_ListOfShape &
	:param sb: default value is ""
	:type sb: TCollection_AsciiString &
	:param sa: default value is ""
	:type sa: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") SName;
		virtual TCollection_AsciiString SName (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param sb: default value is ""
	:type sb: TCollection_AsciiString &
	:param sa: default value is ""
	:type sa: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") SNameori;
		virtual TCollection_AsciiString SNameori (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("compactdefaultargs") SNameori;
		%feature("autodoc", "	:param S:
	:type S: TopTools_ListOfShape &
	:param sb: default value is ""
	:type sb: TCollection_AsciiString &
	:param sa: default value is ""
	:type sa: TCollection_AsciiString &
	:rtype: TCollection_AsciiString
") SNameori;
		virtual TCollection_AsciiString SNameori (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
};


%extend TopOpeBRepBuild_WireEdgeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_EdgeBuilder;
class TopOpeBRepBuild_EdgeBuilder : public TopOpeBRepBuild_Area1dBuilder {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_EdgeBuilder;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_EdgeBuilder;
		 TopOpeBRepBuild_EdgeBuilder ();
		%feature("compactdefaultargs") TopOpeBRepBuild_EdgeBuilder;
		%feature("autodoc", "	* Creates a EdgeBuilder to find the areas of the shapes described by <LS> using the classifier <LC>.

	:param LS:
	:type LS: TopOpeBRepBuild_PaveSet &
	:param LC:
	:type LC: TopOpeBRepBuild_PaveClassifier &
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None
") TopOpeBRepBuild_EdgeBuilder;
		 TopOpeBRepBuild_EdgeBuilder (TopOpeBRepBuild_PaveSet & LS,TopOpeBRepBuild_PaveClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("compactdefaultargs") InitEdgeBuilder;
		%feature("autodoc", "	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet &
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier &
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None
") InitEdgeBuilder;
		void InitEdgeBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "	:rtype: None
") InitEdge;
		void InitEdge ();
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "	:rtype: bool
") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "	:rtype: None
") NextEdge;
		void NextEdge ();
		%feature("compactdefaultargs") InitVertex;
		%feature("autodoc", "	:rtype: None
") InitVertex;
		void InitVertex ();
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "	:rtype: bool
") MoreVertex;
		Standard_Boolean MoreVertex ();
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "	:rtype: None
") NextVertex;
		void NextVertex ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Vertex;
		const TopoDS_Shape  Vertex ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
};


%extend TopOpeBRepBuild_EdgeBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_FaceAreaBuilder;
class TopOpeBRepBuild_FaceAreaBuilder : public TopOpeBRepBuild_Area2dBuilder {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceAreaBuilder;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_FaceAreaBuilder;
		 TopOpeBRepBuild_FaceAreaBuilder ();
		%feature("compactdefaultargs") TopOpeBRepBuild_FaceAreaBuilder;
		%feature("autodoc", "	* Creates a FaceAreaBuilder to build faces on the (wires,blocks of edge) of <LS>, using the classifier <LC>.

	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet &
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier &
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None
") TopOpeBRepBuild_FaceAreaBuilder;
		 TopOpeBRepBuild_FaceAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("compactdefaultargs") InitFaceAreaBuilder;
		%feature("autodoc", "	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet &
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier &
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None
") InitFaceAreaBuilder;
		void InitFaceAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
};


%extend TopOpeBRepBuild_FaceAreaBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_ShellFaceClassifier;
class TopOpeBRepBuild_ShellFaceClassifier : public TopOpeBRepBuild_CompositeClassifier {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_ShellFaceClassifier;
		%feature("autodoc", "	* Creates a classifier in 3D space, to compare : a face with a set of faces a shell with a set of faces a shell with a shell

	:param BB:
	:type BB: TopOpeBRepBuild_BlockBuilder &
	:rtype: None
") TopOpeBRepBuild_ShellFaceClassifier;
		 TopOpeBRepBuild_ShellFaceClassifier (const TopOpeBRepBuild_BlockBuilder & BB);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") CompareShapes;
		%feature("autodoc", "	* classify shell <B1> with shell <B2>

	:param B1:
	:type B1: TopoDS_Shape &
	:param B2:
	:type B2: TopoDS_Shape &
	:rtype: TopAbs_State
") CompareShapes;
		TopAbs_State CompareShapes (const TopoDS_Shape & B1,const TopoDS_Shape & B2);
		%feature("compactdefaultargs") CompareElementToShape;
		%feature("autodoc", "	* classify face <F> with shell <S>

	:param F:
	:type F: TopoDS_Shape &
	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopAbs_State
") CompareElementToShape;
		TopAbs_State CompareElementToShape (const TopoDS_Shape & F,const TopoDS_Shape & S);
		%feature("compactdefaultargs") ResetShape;
		%feature("autodoc", "	* prepare classification involving shell <S> calls ResetElement on first face of <S>

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") ResetShape;
		void ResetShape (const TopoDS_Shape & S);
		%feature("compactdefaultargs") ResetElement;
		%feature("autodoc", "	* prepare classification involving face <F> define 3D point (later used in Compare()) on first vertex of face <F>.

	:param F:
	:type F: TopoDS_Shape &
	:rtype: None
") ResetElement;
		void ResetElement (const TopoDS_Shape & F);
		%feature("compactdefaultargs") CompareElement;
		%feature("autodoc", "	* Add the face <F> in the set of faces used in 3D point classification. Returns False if the face <F> has been already added to the set of faces, otherwise returns True.

	:param F:
	:type F: TopoDS_Shape &
	:rtype: bool
") CompareElement;
		Standard_Boolean CompareElement (const TopoDS_Shape & F);
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	* Returns state of classification of 3D point, defined by ResetElement, with the current set of faces, defined by Compare.

	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
};


%extend TopOpeBRepBuild_ShellFaceClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_SolidAreaBuilder;
class TopOpeBRepBuild_SolidAreaBuilder : public TopOpeBRepBuild_Area3dBuilder {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidAreaBuilder;
		%feature("autodoc", "	:rtype: None
") TopOpeBRepBuild_SolidAreaBuilder;
		 TopOpeBRepBuild_SolidAreaBuilder ();
		%feature("compactdefaultargs") TopOpeBRepBuild_SolidAreaBuilder;
		%feature("autodoc", "	* Creates a SolidAreaBuilder to build Solids on the (shells,blocks of face) of <LS>, using the classifier <LC>.

	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet &
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier &
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None
") TopOpeBRepBuild_SolidAreaBuilder;
		 TopOpeBRepBuild_SolidAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("compactdefaultargs") InitSolidAreaBuilder;
		%feature("autodoc", "	:param LS:
	:type LS: TopOpeBRepBuild_LoopSet &
	:param LC:
	:type LC: TopOpeBRepBuild_LoopClassifier &
	:param ForceClass: default value is Standard_False
	:type ForceClass: bool
	:rtype: None
") InitSolidAreaBuilder;
		void InitSolidAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
};


%extend TopOpeBRepBuild_SolidAreaBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopOpeBRepBuild_WireEdgeClassifier;
class TopOpeBRepBuild_WireEdgeClassifier : public TopOpeBRepBuild_CompositeClassifier {
	public:
		%feature("compactdefaultargs") TopOpeBRepBuild_WireEdgeClassifier;
		%feature("autodoc", "	* Creates a classifier on edge <F>. Used to compare edges and wires on the edge <F>.

	:param F:
	:type F: TopoDS_Shape &
	:param BB:
	:type BB: TopOpeBRepBuild_BlockBuilder &
	:rtype: None
") TopOpeBRepBuild_WireEdgeClassifier;
		 TopOpeBRepBuild_WireEdgeClassifier (const TopoDS_Shape & F,const TopOpeBRepBuild_BlockBuilder & BB);
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "	:param L1:
	:type L1: Handle_TopOpeBRepBuild_Loop &
	:param L2:
	:type L2: Handle_TopOpeBRepBuild_Loop &
	:rtype: TopAbs_State
") Compare;
		virtual TopAbs_State Compare (const Handle_TopOpeBRepBuild_Loop & L1,const Handle_TopOpeBRepBuild_Loop & L2);
		%feature("compactdefaultargs") LoopToShape;
		%feature("autodoc", "	:param L:
	:type L: Handle_TopOpeBRepBuild_Loop &
	:rtype: TopoDS_Shape
") LoopToShape;
		TopoDS_Shape LoopToShape (const Handle_TopOpeBRepBuild_Loop & L);
		%feature("compactdefaultargs") CompareShapes;
		%feature("autodoc", "	* classify wire <B1> with wire <B2>

	:param B1:
	:type B1: TopoDS_Shape &
	:param B2:
	:type B2: TopoDS_Shape &
	:rtype: TopAbs_State
") CompareShapes;
		TopAbs_State CompareShapes (const TopoDS_Shape & B1,const TopoDS_Shape & B2);
		%feature("compactdefaultargs") CompareElementToShape;
		%feature("autodoc", "	* classify edge <E> with wire <B>

	:param E:
	:type E: TopoDS_Shape &
	:param B:
	:type B: TopoDS_Shape &
	:rtype: TopAbs_State
") CompareElementToShape;
		TopAbs_State CompareElementToShape (const TopoDS_Shape & E,const TopoDS_Shape & B);
		%feature("compactdefaultargs") ResetShape;
		%feature("autodoc", "	* prepare classification involving wire <B> calls ResetElement on first edge of <B>

	:param B:
	:type B: TopoDS_Shape &
	:rtype: None
") ResetShape;
		void ResetShape (const TopoDS_Shape & B);
		%feature("compactdefaultargs") ResetElement;
		%feature("autodoc", "	* prepare classification involving edge <E> define 2D point (later used in Compare()) on first vertex of edge <E>.

	:param E:
	:type E: TopoDS_Shape &
	:rtype: None
") ResetElement;
		void ResetElement (const TopoDS_Shape & E);
		%feature("compactdefaultargs") CompareElement;
		%feature("autodoc", "	* Add the edge <E> in the set of edges used in 2D point classification.

	:param E:
	:type E: TopoDS_Shape &
	:rtype: bool
") CompareElement;
		Standard_Boolean CompareElement (const TopoDS_Shape & E);
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	* Returns state of classification of 2D point, defined by ResetElement, with the current set of edges, defined by Compare.

	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
};


%extend TopOpeBRepBuild_WireEdgeClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
