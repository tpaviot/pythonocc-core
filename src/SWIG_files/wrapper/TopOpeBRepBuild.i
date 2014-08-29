/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module TopOpeBRepBuild

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include TopOpeBRepBuild_required_python_modules.i
%include TopOpeBRepBuild_headers.i

/* typedefs */
typedef TopOpeBRepBuild_Builder * TopOpeBRepBuild_PBuilder;
typedef TopOpeBRepBuild_GTopo * TopOpeBRepBuild_PGTopo;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_AreaBuilder;
		 TopOpeBRepBuild_AreaBuilder ();
		%feature("autodoc", "Args:
	LS(TopOpeBRepBuild_LoopSet)
	LC(TopOpeBRepBuild_LoopClassifier)
	ForceClass(Standard_Boolean)=Standard_False

Returns:
	None

Creates a AreaBuilder to build the areas on  
the shapes described by <LS> using the classifier <LC>.") TopOpeBRepBuild_AreaBuilder;
		 TopOpeBRepBuild_AreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	LS(TopOpeBRepBuild_LoopSet)
	LC(TopOpeBRepBuild_LoopClassifier)
	ForceClass(Standard_Boolean)=Standard_False

Returns:
	virtual void

Sets a AreaBuilder to find the areas on  
the shapes described by <LS> using the classifier <LC>.") InitAreaBuilder;
		virtual void InitAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Initialize iteration on areas.") InitArea;
		Standard_Integer InitArea ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreArea;
		Standard_Boolean MoreArea ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextArea;
		void NextArea ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Initialize iteration on loops of current Area.") InitLoop;
		Standard_Integer InitLoop ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreLoop;
		Standard_Boolean MoreLoop ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextLoop;
		void NextLoop ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_Loop

Returns the current Loop in the current area.") Loop;
		const Handle_TopOpeBRepBuild_Loop & Loop ();
		%feature("autodoc", "Args:
	L(Handle_TopOpeBRepBuild_Loop)
	LOL(TopOpeBRepBuild_ListOfLoop)
	s(Standard_Address)=NULL

Returns:
	virtual void

No detailed docstring for this function.") ADD_Loop_TO_LISTOFLoop;
		virtual void ADD_Loop_TO_LISTOFLoop (const Handle_TopOpeBRepBuild_Loop & L,TopOpeBRepBuild_ListOfLoop & LOL,const Standard_Address s = NULL);
		%feature("autodoc", "Args:
	ITLOL(TopOpeBRepBuild_ListIteratorOfListOfLoop)
	LOL(TopOpeBRepBuild_ListOfLoop)
	s(Standard_Address)=NULL

Returns:
	virtual void

No detailed docstring for this function.") REM_Loop_FROM_LISTOFLoop;
		virtual void REM_Loop_FROM_LISTOFLoop (TopOpeBRepBuild_ListIteratorOfListOfLoop & ITLOL,TopOpeBRepBuild_ListOfLoop & LOL,const Standard_Address s = NULL);
		%feature("autodoc", "Args:
	LOL1(TopOpeBRepBuild_ListOfLoop)
	LOL2(TopOpeBRepBuild_ListOfLoop)
	s(Standard_Address)=NULL
	s1(Standard_Address)=NULL
	s2(Standard_Address)=NULL

Returns:
	virtual void

No detailed docstring for this function.") ADD_LISTOFLoop_TO_LISTOFLoop;
		virtual void ADD_LISTOFLoop_TO_LISTOFLoop (TopOpeBRepBuild_ListOfLoop & LOL1,TopOpeBRepBuild_ListOfLoop & LOL2,const Standard_Address s = NULL,const Standard_Address s1 = NULL,const Standard_Address s2 = NULL);
};


%feature("shadow") TopOpeBRepBuild_AreaBuilder::~TopOpeBRepBuild_AreaBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_AreaBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_BlockBuilder;
class TopOpeBRepBuild_BlockBuilder {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_BlockBuilder;
		 TopOpeBRepBuild_BlockBuilder ();
		%feature("autodoc", "Args:
	SS(TopOpeBRepBuild_ShapeSet)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_BlockBuilder;
		 TopOpeBRepBuild_BlockBuilder (TopOpeBRepBuild_ShapeSet & SS);
		%feature("autodoc", "Args:
	SS(TopOpeBRepBuild_ShapeSet)

Returns:
	None

No detailed docstring for this function.") MakeBlock;
		void MakeBlock (TopOpeBRepBuild_ShapeSet & SS);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitBlock;
		void InitBlock ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreBlock;
		Standard_Boolean MoreBlock ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextBlock;
		void NextBlock ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepBuild_BlockIterator

No detailed docstring for this function.") BlockIterator;
		TopOpeBRepBuild_BlockIterator BlockIterator ();
		%feature("autodoc", "Args:
	BI(TopOpeBRepBuild_BlockIterator)

Returns:
	TopoDS_Shape

Returns the current element of <BI>.") Element;
		const TopoDS_Shape & Element (const TopOpeBRepBuild_BlockIterator & BI);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Element;
		const TopoDS_Shape & Element (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") Element;
		Standard_Integer Element (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	BI(TopOpeBRepBuild_BlockIterator)

Returns:
	Standard_Boolean

No detailed docstring for this function.") ElementIsValid;
		Standard_Boolean ElementIsValid (const TopOpeBRepBuild_BlockIterator & BI);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") ElementIsValid;
		Standard_Boolean ElementIsValid (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") AddElement;
		Standard_Integer AddElement (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	BI(TopOpeBRepBuild_BlockIterator)
	isvalid(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetValid;
		void SetValid (const TopOpeBRepBuild_BlockIterator & BI,const Standard_Boolean isvalid);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	isvalid(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetValid;
		void SetValid (const Standard_Integer I,const Standard_Boolean isvalid);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") CurrentBlockIsRegular;
		Standard_Boolean CurrentBlockIsRegular ();
};


%feature("shadow") TopOpeBRepBuild_BlockBuilder::~TopOpeBRepBuild_BlockBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_BlockBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_BlockIterator;
class TopOpeBRepBuild_BlockIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_BlockIterator;
		 TopOpeBRepBuild_BlockIterator ();
		%feature("autodoc", "Args:
	Lower(Standard_Integer)
	Upper(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_BlockIterator;
		 TopOpeBRepBuild_BlockIterator (const Standard_Integer Lower,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		Standard_Integer Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
};


%feature("shadow") TopOpeBRepBuild_BlockIterator::~TopOpeBRepBuild_BlockIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_BlockIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_BuilderON;
class TopOpeBRepBuild_BuilderON {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_BuilderON;
		 TopOpeBRepBuild_BuilderON ();
		%feature("autodoc", "Args:
	PB(TopOpeBRepBuild_PBuilder)
	F(TopoDS_Shape)
	PG(TopOpeBRepBuild_PGTopo)
	PLSclass(TopOpeBRepTool_Plos)
	PWES(TopOpeBRepBuild_PWireEdgeSet)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_BuilderON;
		 TopOpeBRepBuild_BuilderON (const TopOpeBRepBuild_PBuilder & PB,const TopoDS_Shape & F,const TopOpeBRepBuild_PGTopo & PG,const TopOpeBRepTool_Plos & PLSclass,const TopOpeBRepBuild_PWireEdgeSet & PWES);
		%feature("autodoc", "Args:
	PB(TopOpeBRepBuild_PBuilder)
	F(TopoDS_Shape)
	PG(TopOpeBRepBuild_PGTopo)
	PLSclass(TopOpeBRepTool_Plos)
	PWES(TopOpeBRepBuild_PWireEdgeSet)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopOpeBRepBuild_PBuilder & PB,const TopoDS_Shape & F,const TopOpeBRepBuild_PGTopo & PG,const TopOpeBRepTool_Plos & PLSclass,const TopOpeBRepBuild_PWireEdgeSet & PWES);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	Standard_Boolean

No detailed docstring for this function.") GFillONCheckI;
		Standard_Boolean GFillONCheckI (const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

No detailed docstring for this function.") GFillONPartsWES1;
		void GFillONPartsWES1 (const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	EspON(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") GFillONPartsWES2;
		void GFillONPartsWES2 (const Handle_TopOpeBRepDS_Interference & I,const TopoDS_Shape & EspON);
		%feature("autodoc", "Args:
	PB(TopOpeBRepBuild_PBuilder)
	F(TopoDS_Shape)
	PG(TopOpeBRepBuild_PGTopo)
	PLSclass(TopOpeBRepTool_Plos)
	PWES(TopOpeBRepBuild_PWireEdgeSet)

Returns:
	None

No detailed docstring for this function.") Perform2d;
		void Perform2d (const TopOpeBRepBuild_PBuilder & PB,const TopoDS_Shape & F,const TopOpeBRepBuild_PGTopo & PG,const TopOpeBRepTool_Plos & PLSclass,const TopOpeBRepBuild_PWireEdgeSet & PWES);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)
	EspON(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") GFillONParts2dWES2;
		void GFillONParts2dWES2 (const Handle_TopOpeBRepDS_Interference & I,const TopoDS_Shape & EspON);
};


%feature("shadow") TopOpeBRepBuild_BuilderON::~TopOpeBRepBuild_BuilderON %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_BuilderON {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_CorrectFace2d;
class TopOpeBRepBuild_CorrectFace2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_CorrectFace2d;
		 TopOpeBRepBuild_CorrectFace2d ();
		%feature("autodoc", "Args:
	aFace(TopoDS_Face)
	anAvoidMap(TopTools_IndexedMapOfOrientedShape)
	aMap(TopTools_IndexedDataMapOfShapeShape)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_CorrectFace2d;
		 TopOpeBRepBuild_CorrectFace2d (const TopoDS_Face & aFace,const TopTools_IndexedMapOfOrientedShape & anAvoidMap,TopTools_IndexedDataMapOfShapeShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Face;
		const TopoDS_Face & Face ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ErrorStatus;
		Standard_Integer ErrorStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") CorrectedFace;
		const TopoDS_Face & CorrectedFace ();
		%feature("autodoc", "Args:
	aMap(TopTools_IndexedDataMapOfShapeShape)

Returns:
	None

No detailed docstring for this function.") SetMapOfTrans2dInfo;
		void SetMapOfTrans2dInfo (TopTools_IndexedDataMapOfShapeShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_IndexedDataMapOfShapeShape

No detailed docstring for this function.") MapOfTrans2dInfo;
		TopTools_IndexedDataMapOfShapeShape & MapOfTrans2dInfo ();
		%feature("autodoc", "Args:
	aFace(TopoDS_Face)
	anEdge(TopoDS_Edge)
	P2dF(gp_Pnt2d)
	P2dL(gp_Pnt2d)

Returns:
	static void

No detailed docstring for this function.") GetP2dFL;
		static void GetP2dFL (const TopoDS_Face & aFace,const TopoDS_Edge & anEdge,gp_Pnt2d & P2dF,gp_Pnt2d & P2dL);
		%feature("autodoc", "Args:
	aFace(TopoDS_Face)
	aHeadList(TopTools_ListOfShape)

Returns:
	static void

No detailed docstring for this function.") CheckList;
		static void CheckList (const TopoDS_Face & aFace,TopTools_ListOfShape & aHeadList);
};


%feature("shadow") TopOpeBRepBuild_CorrectFace2d::~TopOpeBRepBuild_CorrectFace2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_CorrectFace2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape;
class TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape;
		 TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape;
		 TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape (const TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepBuild_ListOfShapeListOfShape

No detailed docstring for this function.") Value;
		const TopOpeBRepBuild_ListOfShapeListOfShape & Value ();
};


%feature("shadow") TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape::~TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_DataMapIteratorOfDataMapOfShapeListOfShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape;
class TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopOpeBRepBuild_ListOfShapeListOfShape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape;
		 TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape (const TopoDS_Shape & K,const TopOpeBRepBuild_ListOfShapeListOfShape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepBuild_ListOfShapeListOfShape

No detailed docstring for this function.") Value;
		TopOpeBRepBuild_ListOfShapeListOfShape & Value ();
};


%feature("shadow") TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape::~TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape {
	Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape GetHandle() {
	return *(Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape*) &$self;
	}
};

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
    TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape* GetObject() {
    return (TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape::~Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepBuild_DataMapNodeOfDataMapOfShapeListOfShapeListOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape;
class TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape;
		 TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape)

Returns:
	TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape

No detailed docstring for this function.") Assign;
		TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape & Assign (const TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape)

Returns:
	TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape

No detailed docstring for this function.") operator=;
		TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape & operator = (const TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopOpeBRepBuild_ListOfShapeListOfShape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopOpeBRepBuild_ListOfShapeListOfShape & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepBuild_ListOfShapeListOfShape

No detailed docstring for this function.") Find;
		const TopOpeBRepBuild_ListOfShapeListOfShape & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepBuild_ListOfShapeListOfShape

No detailed docstring for this function.") ChangeFind;
		TopOpeBRepBuild_ListOfShapeListOfShape & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape::~TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_DataMapOfShapeListOfShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_FaceBuilder;
class TopOpeBRepBuild_FaceBuilder {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_FaceBuilder;
		 TopOpeBRepBuild_FaceBuilder ();
		%feature("autodoc", "Args:
	ES(TopOpeBRepBuild_WireEdgeSet)
	F(TopoDS_Shape)
	ForceClass(Standard_Boolean)=Standard_False

Returns:
	None

Create a FaceBuilder to build the faces on  
the shapes (wires, blocks of edge) described by <LS>.") TopOpeBRepBuild_FaceBuilder;
		 TopOpeBRepBuild_FaceBuilder (TopOpeBRepBuild_WireEdgeSet & ES,const TopoDS_Shape & F,const Standard_Boolean ForceClass = Standard_False);
		%feature("autodoc", "Args:
	ES(TopOpeBRepBuild_WireEdgeSet)
	F(TopoDS_Shape)
	ForceClass(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") InitFaceBuilder;
		void InitFaceBuilder (TopOpeBRepBuild_WireEdgeSet & ES,const TopoDS_Shape & F,const Standard_Boolean ForceClass);
		%feature("autodoc", "Args:
	mapVVsameG(TopTools_IndexedDataMapOfShapeShape)
	mapVon1Edge(TopTools_IndexedDataMapOfShapeShape)

Returns:
	None

Removes   are  non 3d-closed  wires.  
         Fills  up maps <mapVVsameG> and  <mapVon1Edge>,  in order to  
         correct 3d-closed but unclosed (topologic connexity) wires.  
modifies myBlockBuilder") DetectUnclosedWire;
		void DetectUnclosedWire (TopTools_IndexedDataMapOfShapeShape & mapVVsameG,TopTools_IndexedDataMapOfShapeShape & mapVon1Edge);
		%feature("autodoc", "Args:
	mapVVref(TopTools_IndexedDataMapOfShapeShape)
	mapVon1Edge(TopTools_IndexedDataMapOfShapeShape)

Returns:
	None

Using the given maps, change the topology of the 3d-closed  
         wires, in order to get closed wires.") CorrectGclosedWire;
		void CorrectGclosedWire (const TopTools_IndexedDataMapOfShapeShape & mapVVref,const TopTools_IndexedDataMapOfShapeShape & mapVon1Edge);
		%feature("autodoc", "Args:
	mapE(TopTools_IndexedMapOfShape)

Returns:
	None

Removes edges appearing twice (FORWARD,REVERSED) with a bounding  
         vertex not connected to any other edge.  
         mapE contains edges found.  
modifies myBlockBuilder.") DetectPseudoInternalEdge;
		void DetectPseudoInternalEdge (TopTools_IndexedMapOfShape & mapE);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

return myFace") Face;
		const TopoDS_Shape & Face ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") InitFace;
		Standard_Integer InitFace ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreFace;
		Standard_Boolean MoreFace ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextFace;
		void NextFace ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") InitWire;
		Standard_Integer InitWire ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreWire;
		Standard_Boolean MoreWire ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextWire;
		void NextWire ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOldWire;
		Standard_Boolean IsOldWire ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns current wire  
This wire may be :  
* an old wire OldWire(), which has not been reconstructed;  
* a new wire made of edges described by ...NewEdge() methods.") OldWire;
		const TopoDS_Shape & OldWire ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Iterates on myBlockIterator until finding a valid element") FindNextValidElement;
		void FindNextValidElement ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") InitEdge;
		Standard_Integer InitEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextEdge;
		void NextEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns current new edge of current new wire.") Edge;
		const TopoDS_Shape & Edge ();
		%feature("autodoc", "Args:
	E(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") EdgeConnexity;
		Standard_Integer EdgeConnexity (const TopoDS_Shape & E);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	W(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") AddEdgeWire;
		Standard_Integer AddEdgeWire (const TopoDS_Shape & E,TopoDS_Shape & W);
};


%feature("shadow") TopOpeBRepBuild_FaceBuilder::~TopOpeBRepBuild_FaceBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_FaceBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_FuseFace;
class TopOpeBRepBuild_FuseFace {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_FuseFace;
		 TopOpeBRepBuild_FuseFace ();
		%feature("autodoc", "Args:
	LIF(TopTools_ListOfShape)
	LRF(TopTools_ListOfShape)
	CXM(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_FuseFace;
		 TopOpeBRepBuild_FuseFace (const TopTools_ListOfShape & LIF,const TopTools_ListOfShape & LRF,const Standard_Integer CXM);
		%feature("autodoc", "Args:
	LIF(TopTools_ListOfShape)
	LRF(TopTools_ListOfShape)
	CXM(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopTools_ListOfShape & LIF,const TopTools_ListOfShape & LRF,const Standard_Integer CXM);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") PerformFace;
		void PerformFace ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") PerformEdge;
		void PerformEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ClearEdge;
		void ClearEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ClearVertex;
		void ClearVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsModified;
		Standard_Boolean IsModified ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") LFuseFace;
		const TopTools_ListOfShape & LFuseFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") LInternEdge;
		const TopTools_ListOfShape & LInternEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") LExternEdge;
		const TopTools_ListOfShape & LExternEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") LModifEdge;
		const TopTools_ListOfShape & LModifEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") LInternVertex;
		const TopTools_ListOfShape & LInternVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") LExternVertex;
		const TopTools_ListOfShape & LExternVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") LModifVertex;
		const TopTools_ListOfShape & LModifVertex ();
};


%feature("shadow") TopOpeBRepBuild_FuseFace::~TopOpeBRepBuild_FuseFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_FuseFace {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_GIter;
class TopOpeBRepBuild_GIter {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_GIter;
		 TopOpeBRepBuild_GIter ();
		%feature("autodoc", "Args:
	G(TopOpeBRepBuild_GTopo)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_GIter;
		 TopOpeBRepBuild_GIter (const TopOpeBRepBuild_GTopo & G);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Init;
		void Init ();
		%feature("autodoc", "Args:
	G(TopOpeBRepBuild_GTopo)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopOpeBRepBuild_GTopo & G);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	s1(TopAbs_State)
	s2(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") Current;
		void Current (TopAbs_State & s1,TopAbs_State & s2);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump (Standard_OStream & OS);
};


%feature("shadow") TopOpeBRepBuild_GIter::~TopOpeBRepBuild_GIter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_GIter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_GTool;
class TopOpeBRepBuild_GTool {
	public:
		%feature("autodoc", "Args:
	s1(TopAbs_ShapeEnum)
	s2(TopAbs_ShapeEnum)

Returns:
	static TopOpeBRepBuild_GTopo

No detailed docstring for this function.") GFusUnsh;
		static TopOpeBRepBuild_GTopo GFusUnsh (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("autodoc", "Args:
	s1(TopAbs_ShapeEnum)
	s2(TopAbs_ShapeEnum)

Returns:
	static TopOpeBRepBuild_GTopo

No detailed docstring for this function.") GFusSame;
		static TopOpeBRepBuild_GTopo GFusSame (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("autodoc", "Args:
	s1(TopAbs_ShapeEnum)
	s2(TopAbs_ShapeEnum)

Returns:
	static TopOpeBRepBuild_GTopo

No detailed docstring for this function.") GFusDiff;
		static TopOpeBRepBuild_GTopo GFusDiff (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("autodoc", "Args:
	s1(TopAbs_ShapeEnum)
	s2(TopAbs_ShapeEnum)

Returns:
	static TopOpeBRepBuild_GTopo

No detailed docstring for this function.") GCutUnsh;
		static TopOpeBRepBuild_GTopo GCutUnsh (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("autodoc", "Args:
	s1(TopAbs_ShapeEnum)
	s2(TopAbs_ShapeEnum)

Returns:
	static TopOpeBRepBuild_GTopo

No detailed docstring for this function.") GCutSame;
		static TopOpeBRepBuild_GTopo GCutSame (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("autodoc", "Args:
	s1(TopAbs_ShapeEnum)
	s2(TopAbs_ShapeEnum)

Returns:
	static TopOpeBRepBuild_GTopo

No detailed docstring for this function.") GCutDiff;
		static TopOpeBRepBuild_GTopo GCutDiff (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("autodoc", "Args:
	s1(TopAbs_ShapeEnum)
	s2(TopAbs_ShapeEnum)

Returns:
	static TopOpeBRepBuild_GTopo

No detailed docstring for this function.") GComUnsh;
		static TopOpeBRepBuild_GTopo GComUnsh (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("autodoc", "Args:
	s1(TopAbs_ShapeEnum)
	s2(TopAbs_ShapeEnum)

Returns:
	static TopOpeBRepBuild_GTopo

No detailed docstring for this function.") GComSame;
		static TopOpeBRepBuild_GTopo GComSame (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("autodoc", "Args:
	s1(TopAbs_ShapeEnum)
	s2(TopAbs_ShapeEnum)

Returns:
	static TopOpeBRepBuild_GTopo

No detailed docstring for this function.") GComDiff;
		static TopOpeBRepBuild_GTopo GComDiff (const TopAbs_ShapeEnum s1,const TopAbs_ShapeEnum s2);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	static void

No detailed docstring for this function.") Dump;
		static void Dump (Standard_OStream & OS);
};


%feature("shadow") TopOpeBRepBuild_GTool::~TopOpeBRepBuild_GTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_GTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_GTopo;
class TopOpeBRepBuild_GTopo {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_GTopo;
		 TopOpeBRepBuild_GTopo ();
		%feature("autodoc", "Args:
	II(Standard_Integer)
	IN(Standard_Integer)
	IO(Standard_Integer)
	NI(Standard_Integer)
	NN(Standard_Integer)
	NO(Standard_Integer)
	OI(Standard_Integer)
	ON(Standard_Integer)
	OO(Standard_Integer)
	t1(TopAbs_ShapeEnum)
	t2(TopAbs_ShapeEnum)
	C1(TopOpeBRepDS_Config)
	C2(TopOpeBRepDS_Config)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_GTopo;
		 TopOpeBRepBuild_GTopo (const Standard_Integer II,const Standard_Integer IN,const Standard_Integer IO,const Standard_Integer NI,const Standard_Integer NN,const Standard_Integer NO,const Standard_Integer OI,const Standard_Integer ON,const Standard_Integer OO,const TopAbs_ShapeEnum t1,const TopAbs_ShapeEnum t2,const TopOpeBRepDS_Config C1,const TopOpeBRepDS_Config C2);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	II(Standard_Boolean)
	IN(Standard_Boolean)
	IO(Standard_Boolean)
	NI(Standard_Boolean)
	NN(Standard_Boolean)
	NO(Standard_Boolean)
	OI(Standard_Boolean)
	ON(Standard_Boolean)
	OO(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Boolean II,const Standard_Boolean IN,const Standard_Boolean IO,const Standard_Boolean NI,const Standard_Boolean NN,const Standard_Boolean NO,const Standard_Boolean OI,const Standard_Boolean ON,const Standard_Boolean OO);
		%feature("autodoc", "Args:
	t1(TopAbs_ShapeEnum)
	t2(TopAbs_ShapeEnum)

Returns:
	None

No detailed docstring for this function.") Type;
		void Type (TopAbs_ShapeEnum & t1,TopAbs_ShapeEnum & t2);
		%feature("autodoc", "Args:
	t1(TopAbs_ShapeEnum)
	t2(TopAbs_ShapeEnum)

Returns:
	None

No detailed docstring for this function.") ChangeType;
		void ChangeType (const TopAbs_ShapeEnum t1,const TopAbs_ShapeEnum t2);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_Config

No detailed docstring for this function.") Config1;
		TopOpeBRepDS_Config Config1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_Config

No detailed docstring for this function.") Config2;
		TopOpeBRepDS_Config Config2 ();
		%feature("autodoc", "Args:
	C1(TopOpeBRepDS_Config)
	C2(TopOpeBRepDS_Config)

Returns:
	None

No detailed docstring for this function.") ChangeConfig;
		void ChangeConfig (const TopOpeBRepDS_Config C1,const TopOpeBRepDS_Config C2);
		%feature("autodoc", "Args:
	s1(TopAbs_State)
	s2(TopAbs_State)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const TopAbs_State s1,const TopAbs_State s2);
		%feature("autodoc", "Args:
	I1(Standard_Integer)
	I2(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Integer I1,const Standard_Integer I2);
		%feature("autodoc", "Args:
	II(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Integer II);
		%feature("autodoc", "Args:
	i1(Standard_Integer)
	i2(Standard_Integer)
	b(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ChangeValue;
		void ChangeValue (const Standard_Integer i1,const Standard_Integer i2,const Standard_Boolean b);
		%feature("autodoc", "Args:
	s1(TopAbs_State)
	s2(TopAbs_State)
	b(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ChangeValue;
		void ChangeValue (const TopAbs_State s1,const TopAbs_State s2,const Standard_Boolean b);
		%feature("autodoc", "Args:
	S(TopAbs_State)

Returns:
	Standard_Integer

No detailed docstring for this function.") GIndex;
		Standard_Integer GIndex (const TopAbs_State S);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopAbs_State

No detailed docstring for this function.") GState;
		TopAbs_State GState (const Standard_Integer I);
		%feature("autodoc", "Args:
	II(Standard_Integer)
	i1(Standard_Integer)
	i2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Index;
		void Index (const Standard_Integer II,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	OS(Standard_OStream)
	s1(TopAbs_State)
	s2(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") DumpVal;
		void DumpVal (Standard_OStream & OS,const TopAbs_State s1,const TopAbs_State s2);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	None

No detailed docstring for this function.") DumpType;
		void DumpType (Standard_OStream & OS);
		%feature("autodoc", "Args:
	OS(Standard_OStream)
	s1(TopAbs_State)
	s2(TopAbs_State)
	b(Standard_Boolean)

Returns:
	static void

No detailed docstring for this function.") DumpSSB;
		static void DumpSSB (Standard_OStream & OS,const TopAbs_State s1,const TopAbs_State s2,const Standard_Boolean b);
		%feature("autodoc", "Args:
	OS(Standard_OStream)
	s(Standard_Address)=NULL

Returns:
	virtual void

No detailed docstring for this function.") Dump;
		virtual void Dump (Standard_OStream & OS,const Standard_Address s = NULL);
		%feature("autodoc", "Args:
	s1(TopAbs_State)
	s2(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") StatesON;
		void StatesON (TopAbs_State & s1,TopAbs_State & s2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsToReverse1;
		Standard_Boolean IsToReverse1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsToReverse2;
		Standard_Boolean IsToReverse2 ();
		%feature("autodoc", "Args:
	rev(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetReverse;
		void SetReverse (const Standard_Boolean rev);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Reverse;
		Standard_Boolean Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepBuild_GTopo

No detailed docstring for this function.") CopyPermuted;
		TopOpeBRepBuild_GTopo CopyPermuted ();
};


%feature("shadow") TopOpeBRepBuild_GTopo::~TopOpeBRepBuild_GTopo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_GTopo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_HBuilder;
class TopOpeBRepBuild_HBuilder : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	BT(TopOpeBRepDS_BuildTool)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_HBuilder;
		 TopOpeBRepBuild_HBuilder (const TopOpeBRepDS_BuildTool & BT);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_BuildTool

No detailed docstring for this function.") BuildTool;
		const TopOpeBRepDS_BuildTool & BuildTool ();
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

Stores the data structure <HDS>,  
Create shapes from the new geometries described in <HDS>.") Perform;
		void Perform (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

Same as previous + evaluates if an operation performed on shapes S1,S2  
is a particular case.") Perform;
		void Perform (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all split and merge already performed.  
	        Does NOT clear the handled DS.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_HDataStructure

returns the DS handled by this builder") DataStructure;
		Handle_TopOpeBRepDS_HDataStructure DataStructure ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_BuildTool

No detailed docstring for this function.") ChangeBuildTool;
		TopOpeBRepDS_BuildTool & ChangeBuildTool ();
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	TB1(TopAbs_State)
	S2(TopoDS_Shape)
	TB2(TopAbs_State)

Returns:
	None

Merges the two shapes <S1> and <S2> keeping the  
         parts of states <TB1>,<TB2> in <S1>,<S2>.") MergeShapes;
		void MergeShapes (const TopoDS_Shape & S1,const TopAbs_State TB1,const TopoDS_Shape & S2,const TopAbs_State TB2);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	TB1(TopAbs_State)
	S2(TopoDS_Shape)
	TB2(TopAbs_State)

Returns:
	None

Merges  the two solids <S1>   and <S2> keeping the  
         parts in each solid of states <TB1> and <TB2>.") MergeSolids;
		void MergeSolids (const TopoDS_Shape & S1,const TopAbs_State TB1,const TopoDS_Shape & S2,const TopAbs_State TB2);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	TB(TopAbs_State)

Returns:
	None

Merges the solid <S>  keeping the  
         parts of state <TB>.") MergeSolid;
		void MergeSolid (const TopoDS_Shape & S,const TopAbs_State TB);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	ToBuild(TopAbs_State)

Returns:
	Standard_Boolean

Returns True if the shape <S> has been split.") IsSplit;
		Standard_Boolean IsSplit (const TopoDS_Shape & S,const TopAbs_State ToBuild);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	ToBuild(TopAbs_State)

Returns:
	TopTools_ListOfShape

Returns the split parts <ToBuild> of shape <S>.") Splits;
		const TopTools_ListOfShape & Splits (const TopoDS_Shape & S,const TopAbs_State ToBuild);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	ToBuild(TopAbs_State)

Returns:
	Standard_Boolean

Returns True if the shape <S> has been merged.") IsMerged;
		Standard_Boolean IsMerged (const TopoDS_Shape & S,const TopAbs_State ToBuild);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	ToBuild(TopAbs_State)

Returns:
	TopTools_ListOfShape

Returns the merged parts <ToBuild> of shape <S>.") Merged;
		const TopTools_ListOfShape & Merged (const TopoDS_Shape & S,const TopAbs_State ToBuild);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

Returns the vertex created on point <I>.") NewVertex;
		const TopoDS_Shape & NewVertex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopTools_ListOfShape

Returns the edges created on curve <I>.") NewEdges;
		const TopTools_ListOfShape & NewEdges (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopTools_ListOfShape

Returns the edges created on curve <I>.") ChangeNewEdges;
		TopTools_ListOfShape & ChangeNewEdges (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopTools_ListOfShape

Returns the faces created on surface <I>.") NewFaces;
		const TopTools_ListOfShape & NewFaces (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Section;
		const TopTools_ListOfShape & Section ();
		%feature("autodoc", "Args:
	k(Standard_Integer)=3

Returns:
	None

No detailed docstring for this function.") InitExtendedSectionDS;
		void InitExtendedSectionDS (const Standard_Integer k = 3);
		%feature("autodoc", "Args:
	k(Standard_Integer)=3

Returns:
	None

No detailed docstring for this function.") InitSection;
		void InitSection (const Standard_Integer k = 3);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreSection;
		Standard_Boolean MoreSection ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextSection;
		void NextSection ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") CurrentSection;
		const TopoDS_Shape & CurrentSection ();
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	rank(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") GetDSEdgeFromSectEdge;
		Standard_Integer GetDSEdgeFromSectEdge (const TopoDS_Shape & E,const Standard_Integer rank);
		%feature("autodoc", "Args:
	indexEdg(Standard_Integer)
	rank(Standard_Integer)

Returns:
	TColStd_ListOfInteger

No detailed docstring for this function.") GetDSFaceFromDSEdge;
		TColStd_ListOfInteger & GetDSFaceFromDSEdge (const Standard_Integer indexEdg,const Standard_Integer rank);
		%feature("autodoc", "Args:
	SectEdge(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") GetDSCurveFromSectEdge;
		Standard_Integer GetDSCurveFromSectEdge (const TopoDS_Shape & SectEdge);
		%feature("autodoc", "Args:
	indexCur(Standard_Integer)
	rank(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") GetDSFaceFromDSCurve;
		Standard_Integer GetDSFaceFromDSCurve (const Standard_Integer indexCur,const Standard_Integer rank);
		%feature("autodoc", "Args:
	NewVert(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") GetDSPointFromNewVertex;
		Standard_Integer GetDSPointFromNewVertex (const TopoDS_Shape & NewVert);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	F1(TopoDS_Shape)
	F2(TopoDS_Shape)
	IC(Standard_Integer)

Returns:
	Standard_Boolean

search for the couple of face F1,F2  
(from arguments of supra Perform(S1,S2,HDS)) method which  
intersection gives section edge E built on an intersection curve.  
returns True if F1,F2 have been valued.  
returns False if E is not a section edge built  
on intersection curve IC.") EdgeCurveAncestors;
		Standard_Boolean EdgeCurveAncestors (const TopoDS_Shape & E,TopoDS_Shape & F1,TopoDS_Shape & F2,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	LF1(TopTools_ListOfShape)
	LF2(TopTools_ListOfShape)
	LE1(TopTools_ListOfShape)
	LE2(TopTools_ListOfShape)

Returns:
	Standard_Boolean

search for the couple of face F1,F2  
(from arguments of supra Perform(S1,S2,HDS)) method which  
intersection gives section edge E built on at least one edge .  
returns True if F1,F2 have been valued.  
returns False if E is not a section edge built  
on at least one edge of S1 and/or S2.  
LE1,LE2 are edges of S1,S2 which common part is edge E.  
LE1 or LE2 may be empty() but not both.") EdgeSectionAncestors;
		Standard_Boolean EdgeSectionAncestors (const TopoDS_Shape & E,TopTools_ListOfShape & LF1,TopTools_ListOfShape & LF2,TopTools_ListOfShape & LE1,TopTools_ListOfShape & LE2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns 0 is standard operation, != 0 if particular case") IsKPart;
		Standard_Integer IsKPart ();
		%feature("autodoc", "Args:
	TB1(TopAbs_State)
	TB2(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") MergeKPart;
		void MergeKPart (const TopAbs_State TB1,const TopAbs_State TB2);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepBuild_Builder

No detailed docstring for this function.") ChangeBuilder;
		TopOpeBRepBuild_Builder & ChangeBuilder ();
};


%feature("shadow") TopOpeBRepBuild_HBuilder::~TopOpeBRepBuild_HBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_HBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepBuild_HBuilder {
	Handle_TopOpeBRepBuild_HBuilder GetHandle() {
	return *(Handle_TopOpeBRepBuild_HBuilder*) &$self;
	}
};

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
    TopOpeBRepBuild_HBuilder* GetObject() {
    return (TopOpeBRepBuild_HBuilder*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepBuild_HBuilder::~Handle_TopOpeBRepBuild_HBuilder %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepBuild_HBuilder {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo;
class TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(TopoDS_Shape)
	K2(Standard_Integer)
	I(TopOpeBRepBuild_VertexInfo)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo;
		 TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo (const TopoDS_Shape & K1,const Standard_Integer K2,const TopOpeBRepBuild_VertexInfo & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key1;
		TopoDS_Shape & Key1 ();

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
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepBuild_VertexInfo

No detailed docstring for this function.") Value;
		TopOpeBRepBuild_VertexInfo & Value ();
};


%feature("shadow") TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo::~TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo {
	Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo GetHandle() {
	return *(Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo*) &$self;
	}
};

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
    TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo* GetObject() {
    return (TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo::~Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepBuild_IndexedDataMapNodeOfIndexedDataMapOfShapeVertexInfo {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo;
class TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo;
		 TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo)

Returns:
	TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo

No detailed docstring for this function.") Assign;
		TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & Assign (const TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo)

Returns:
	TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo

No detailed docstring for this function.") operator=;
		TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & operator = (const TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopOpeBRepBuild_VertexInfo)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopOpeBRepBuild_VertexInfo & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TopoDS_Shape)
	T(TopOpeBRepBuild_VertexInfo)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopOpeBRepBuild_VertexInfo & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FindKey;
		const TopoDS_Shape & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepBuild_VertexInfo

No detailed docstring for this function.") FindFromIndex;
		const TopOpeBRepBuild_VertexInfo & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepBuild_VertexInfo

No detailed docstring for this function.") ChangeFromIndex;
		TopOpeBRepBuild_VertexInfo & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepBuild_VertexInfo

No detailed docstring for this function.") FindFromKey;
		const TopOpeBRepBuild_VertexInfo & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopOpeBRepBuild_VertexInfo

No detailed docstring for this function.") ChangeFromKey;
		TopOpeBRepBuild_VertexInfo & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%feature("shadow") TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo::~TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_ListIteratorOfListOfListOfLoop;
class TopOpeBRepBuild_ListIteratorOfListOfListOfLoop {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ListIteratorOfListOfListOfLoop;
		 TopOpeBRepBuild_ListIteratorOfListOfListOfLoop ();
		%feature("autodoc", "Args:
	L(TopOpeBRepBuild_ListOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ListIteratorOfListOfListOfLoop;
		 TopOpeBRepBuild_ListIteratorOfListOfListOfLoop (const TopOpeBRepBuild_ListOfListOfLoop & L);
		%feature("autodoc", "Args:
	L(TopOpeBRepBuild_ListOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepBuild_ListOfListOfLoop & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepBuild_ListOfLoop

No detailed docstring for this function.") Value;
		TopOpeBRepBuild_ListOfLoop & Value ();
};


%feature("shadow") TopOpeBRepBuild_ListIteratorOfListOfListOfLoop::~TopOpeBRepBuild_ListIteratorOfListOfListOfLoop %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ListIteratorOfListOfListOfLoop {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_ListIteratorOfListOfLoop;
class TopOpeBRepBuild_ListIteratorOfListOfLoop {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ListIteratorOfListOfLoop;
		 TopOpeBRepBuild_ListIteratorOfListOfLoop ();
		%feature("autodoc", "Args:
	L(TopOpeBRepBuild_ListOfLoop)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ListIteratorOfListOfLoop;
		 TopOpeBRepBuild_ListIteratorOfListOfLoop (const TopOpeBRepBuild_ListOfLoop & L);
		%feature("autodoc", "Args:
	L(TopOpeBRepBuild_ListOfLoop)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepBuild_ListOfLoop & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_Loop

No detailed docstring for this function.") Value;
		Handle_TopOpeBRepBuild_Loop & Value ();
};


%feature("shadow") TopOpeBRepBuild_ListIteratorOfListOfLoop::~TopOpeBRepBuild_ListIteratorOfListOfLoop %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ListIteratorOfListOfLoop {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_ListIteratorOfListOfPave;
class TopOpeBRepBuild_ListIteratorOfListOfPave {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ListIteratorOfListOfPave;
		 TopOpeBRepBuild_ListIteratorOfListOfPave ();
		%feature("autodoc", "Args:
	L(TopOpeBRepBuild_ListOfPave)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ListIteratorOfListOfPave;
		 TopOpeBRepBuild_ListIteratorOfListOfPave (const TopOpeBRepBuild_ListOfPave & L);
		%feature("autodoc", "Args:
	L(TopOpeBRepBuild_ListOfPave)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepBuild_ListOfPave & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_Pave

No detailed docstring for this function.") Value;
		Handle_TopOpeBRepBuild_Pave & Value ();
};


%feature("shadow") TopOpeBRepBuild_ListIteratorOfListOfPave::~TopOpeBRepBuild_ListIteratorOfListOfPave %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ListIteratorOfListOfPave {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape;
class TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape;
		 TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape ();
		%feature("autodoc", "Args:
	L(TopOpeBRepBuild_ListOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape;
		 TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape (const TopOpeBRepBuild_ListOfShapeListOfShape & L);
		%feature("autodoc", "Args:
	L(TopOpeBRepBuild_ListOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRepBuild_ListOfShapeListOfShape & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepBuild_ShapeListOfShape

No detailed docstring for this function.") Value;
		TopOpeBRepBuild_ShapeListOfShape & Value ();
};


%feature("shadow") TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape::~TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_ListNodeOfListOfListOfLoop;
class TopOpeBRepBuild_ListNodeOfListOfListOfLoop : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(TopOpeBRepBuild_ListOfLoop)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ListNodeOfListOfListOfLoop;
		 TopOpeBRepBuild_ListNodeOfListOfListOfLoop (const TopOpeBRepBuild_ListOfLoop & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepBuild_ListOfLoop

No detailed docstring for this function.") Value;
		TopOpeBRepBuild_ListOfLoop & Value ();
};


%feature("shadow") TopOpeBRepBuild_ListNodeOfListOfListOfLoop::~TopOpeBRepBuild_ListNodeOfListOfListOfLoop %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ListNodeOfListOfListOfLoop {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepBuild_ListNodeOfListOfListOfLoop {
	Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop GetHandle() {
	return *(Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop*) &$self;
	}
};

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
    TopOpeBRepBuild_ListNodeOfListOfListOfLoop* GetObject() {
    return (TopOpeBRepBuild_ListNodeOfListOfListOfLoop*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop::~Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepBuild_ListNodeOfListOfListOfLoop {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepBuild_ListNodeOfListOfLoop;
class TopOpeBRepBuild_ListNodeOfListOfLoop : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepBuild_Loop)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ListNodeOfListOfLoop;
		 TopOpeBRepBuild_ListNodeOfListOfLoop (const Handle_TopOpeBRepBuild_Loop & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_Loop

No detailed docstring for this function.") Value;
		Handle_TopOpeBRepBuild_Loop & Value ();
};


%feature("shadow") TopOpeBRepBuild_ListNodeOfListOfLoop::~TopOpeBRepBuild_ListNodeOfListOfLoop %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ListNodeOfListOfLoop {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepBuild_ListNodeOfListOfLoop {
	Handle_TopOpeBRepBuild_ListNodeOfListOfLoop GetHandle() {
	return *(Handle_TopOpeBRepBuild_ListNodeOfListOfLoop*) &$self;
	}
};

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
    TopOpeBRepBuild_ListNodeOfListOfLoop* GetObject() {
    return (TopOpeBRepBuild_ListNodeOfListOfLoop*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepBuild_ListNodeOfListOfLoop::~Handle_TopOpeBRepBuild_ListNodeOfListOfLoop %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepBuild_ListNodeOfListOfLoop {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepBuild_ListNodeOfListOfPave;
class TopOpeBRepBuild_ListNodeOfListOfPave : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepBuild_Pave)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ListNodeOfListOfPave;
		 TopOpeBRepBuild_ListNodeOfListOfPave (const Handle_TopOpeBRepBuild_Pave & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_Pave

No detailed docstring for this function.") Value;
		Handle_TopOpeBRepBuild_Pave & Value ();
};


%feature("shadow") TopOpeBRepBuild_ListNodeOfListOfPave::~TopOpeBRepBuild_ListNodeOfListOfPave %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ListNodeOfListOfPave {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepBuild_ListNodeOfListOfPave {
	Handle_TopOpeBRepBuild_ListNodeOfListOfPave GetHandle() {
	return *(Handle_TopOpeBRepBuild_ListNodeOfListOfPave*) &$self;
	}
};

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
    TopOpeBRepBuild_ListNodeOfListOfPave* GetObject() {
    return (TopOpeBRepBuild_ListNodeOfListOfPave*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepBuild_ListNodeOfListOfPave::~Handle_TopOpeBRepBuild_ListNodeOfListOfPave %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepBuild_ListNodeOfListOfPave {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape;
class TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(TopOpeBRepBuild_ShapeListOfShape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape;
		 TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape (const TopOpeBRepBuild_ShapeListOfShape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepBuild_ShapeListOfShape

No detailed docstring for this function.") Value;
		TopOpeBRepBuild_ShapeListOfShape & Value ();
};


%feature("shadow") TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape::~TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape {
	Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape GetHandle() {
	return *(Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape*) &$self;
	}
};

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
    TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape* GetObject() {
    return (TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape::~Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepBuild_ListNodeOfListOfShapeListOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepBuild_ListOfListOfLoop;
class TopOpeBRepBuild_ListOfListOfLoop {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ListOfListOfLoop;
		 TopOpeBRepBuild_ListOfListOfLoop ();
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TopOpeBRepBuild_ListOfListOfLoop & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TopOpeBRepBuild_ListOfListOfLoop & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(TopOpeBRepBuild_ListOfLoop)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopOpeBRepBuild_ListOfLoop & I);
		%feature("autodoc", "Args:
	I(TopOpeBRepBuild_ListOfLoop)
	theIt(TopOpeBRepBuild_ListIteratorOfListOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopOpeBRepBuild_ListOfLoop & I,TopOpeBRepBuild_ListIteratorOfListOfListOfLoop & theIt);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TopOpeBRepBuild_ListOfListOfLoop & Other);
		%feature("autodoc", "Args:
	I(TopOpeBRepBuild_ListOfLoop)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopOpeBRepBuild_ListOfLoop & I);
		%feature("autodoc", "Args:
	I(TopOpeBRepBuild_ListOfLoop)
	theIt(TopOpeBRepBuild_ListIteratorOfListOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopOpeBRepBuild_ListOfLoop & I,TopOpeBRepBuild_ListIteratorOfListOfListOfLoop & theIt);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TopOpeBRepBuild_ListOfListOfLoop & Other);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepBuild_ListOfLoop

No detailed docstring for this function.") First;
		TopOpeBRepBuild_ListOfLoop & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepBuild_ListOfLoop

No detailed docstring for this function.") Last;
		TopOpeBRepBuild_ListOfLoop & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TopOpeBRepBuild_ListIteratorOfListOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TopOpeBRepBuild_ListIteratorOfListOfListOfLoop & It);
		%feature("autodoc", "Args:
	I(TopOpeBRepBuild_ListOfLoop)
	It(TopOpeBRepBuild_ListIteratorOfListOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const TopOpeBRepBuild_ListOfLoop & I,TopOpeBRepBuild_ListIteratorOfListOfListOfLoop & It);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfListOfLoop)
	It(TopOpeBRepBuild_ListIteratorOfListOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TopOpeBRepBuild_ListOfListOfLoop & Other,TopOpeBRepBuild_ListIteratorOfListOfListOfLoop & It);
		%feature("autodoc", "Args:
	I(TopOpeBRepBuild_ListOfLoop)
	It(TopOpeBRepBuild_ListIteratorOfListOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const TopOpeBRepBuild_ListOfLoop & I,TopOpeBRepBuild_ListIteratorOfListOfListOfLoop & It);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfListOfLoop)
	It(TopOpeBRepBuild_ListIteratorOfListOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (TopOpeBRepBuild_ListOfListOfLoop & Other,TopOpeBRepBuild_ListIteratorOfListOfListOfLoop & It);
};


%feature("shadow") TopOpeBRepBuild_ListOfListOfLoop::~TopOpeBRepBuild_ListOfListOfLoop %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ListOfListOfLoop {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_ListOfLoop;
class TopOpeBRepBuild_ListOfLoop {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ListOfLoop;
		 TopOpeBRepBuild_ListOfLoop ();
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfLoop)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TopOpeBRepBuild_ListOfLoop & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfLoop)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TopOpeBRepBuild_ListOfLoop & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepBuild_Loop)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TopOpeBRepBuild_Loop & I);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepBuild_Loop)
	theIt(TopOpeBRepBuild_ListIteratorOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TopOpeBRepBuild_Loop & I,TopOpeBRepBuild_ListIteratorOfListOfLoop & theIt);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfLoop)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TopOpeBRepBuild_ListOfLoop & Other);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepBuild_Loop)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TopOpeBRepBuild_Loop & I);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepBuild_Loop)
	theIt(TopOpeBRepBuild_ListIteratorOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TopOpeBRepBuild_Loop & I,TopOpeBRepBuild_ListIteratorOfListOfLoop & theIt);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfLoop)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TopOpeBRepBuild_ListOfLoop & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_Loop

No detailed docstring for this function.") First;
		Handle_TopOpeBRepBuild_Loop & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_Loop

No detailed docstring for this function.") Last;
		Handle_TopOpeBRepBuild_Loop & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TopOpeBRepBuild_ListIteratorOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TopOpeBRepBuild_ListIteratorOfListOfLoop & It);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepBuild_Loop)
	It(TopOpeBRepBuild_ListIteratorOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_TopOpeBRepBuild_Loop & I,TopOpeBRepBuild_ListIteratorOfListOfLoop & It);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfLoop)
	It(TopOpeBRepBuild_ListIteratorOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TopOpeBRepBuild_ListOfLoop & Other,TopOpeBRepBuild_ListIteratorOfListOfLoop & It);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepBuild_Loop)
	It(TopOpeBRepBuild_ListIteratorOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_TopOpeBRepBuild_Loop & I,TopOpeBRepBuild_ListIteratorOfListOfLoop & It);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfLoop)
	It(TopOpeBRepBuild_ListIteratorOfListOfLoop)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (TopOpeBRepBuild_ListOfLoop & Other,TopOpeBRepBuild_ListIteratorOfListOfLoop & It);
};


%feature("shadow") TopOpeBRepBuild_ListOfLoop::~TopOpeBRepBuild_ListOfLoop %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ListOfLoop {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_ListOfPave;
class TopOpeBRepBuild_ListOfPave {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ListOfPave;
		 TopOpeBRepBuild_ListOfPave ();
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfPave)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TopOpeBRepBuild_ListOfPave & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfPave)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TopOpeBRepBuild_ListOfPave & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepBuild_Pave)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TopOpeBRepBuild_Pave & I);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepBuild_Pave)
	theIt(TopOpeBRepBuild_ListIteratorOfListOfPave)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TopOpeBRepBuild_Pave & I,TopOpeBRepBuild_ListIteratorOfListOfPave & theIt);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfPave)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TopOpeBRepBuild_ListOfPave & Other);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepBuild_Pave)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TopOpeBRepBuild_Pave & I);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepBuild_Pave)
	theIt(TopOpeBRepBuild_ListIteratorOfListOfPave)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TopOpeBRepBuild_Pave & I,TopOpeBRepBuild_ListIteratorOfListOfPave & theIt);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfPave)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TopOpeBRepBuild_ListOfPave & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_Pave

No detailed docstring for this function.") First;
		Handle_TopOpeBRepBuild_Pave & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepBuild_Pave

No detailed docstring for this function.") Last;
		Handle_TopOpeBRepBuild_Pave & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TopOpeBRepBuild_ListIteratorOfListOfPave)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TopOpeBRepBuild_ListIteratorOfListOfPave & It);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepBuild_Pave)
	It(TopOpeBRepBuild_ListIteratorOfListOfPave)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_TopOpeBRepBuild_Pave & I,TopOpeBRepBuild_ListIteratorOfListOfPave & It);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfPave)
	It(TopOpeBRepBuild_ListIteratorOfListOfPave)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TopOpeBRepBuild_ListOfPave & Other,TopOpeBRepBuild_ListIteratorOfListOfPave & It);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepBuild_Pave)
	It(TopOpeBRepBuild_ListIteratorOfListOfPave)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_TopOpeBRepBuild_Pave & I,TopOpeBRepBuild_ListIteratorOfListOfPave & It);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfPave)
	It(TopOpeBRepBuild_ListIteratorOfListOfPave)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (TopOpeBRepBuild_ListOfPave & Other,TopOpeBRepBuild_ListIteratorOfListOfPave & It);
};


%feature("shadow") TopOpeBRepBuild_ListOfPave::~TopOpeBRepBuild_ListOfPave %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ListOfPave {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_ListOfShapeListOfShape;
class TopOpeBRepBuild_ListOfShapeListOfShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ListOfShapeListOfShape;
		 TopOpeBRepBuild_ListOfShapeListOfShape ();
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TopOpeBRepBuild_ListOfShapeListOfShape & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TopOpeBRepBuild_ListOfShapeListOfShape & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(TopOpeBRepBuild_ShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopOpeBRepBuild_ShapeListOfShape & I);
		%feature("autodoc", "Args:
	I(TopOpeBRepBuild_ShapeListOfShape)
	theIt(TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopOpeBRepBuild_ShapeListOfShape & I,TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape & theIt);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TopOpeBRepBuild_ListOfShapeListOfShape & Other);
		%feature("autodoc", "Args:
	I(TopOpeBRepBuild_ShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopOpeBRepBuild_ShapeListOfShape & I);
		%feature("autodoc", "Args:
	I(TopOpeBRepBuild_ShapeListOfShape)
	theIt(TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopOpeBRepBuild_ShapeListOfShape & I,TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape & theIt);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TopOpeBRepBuild_ListOfShapeListOfShape & Other);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepBuild_ShapeListOfShape

No detailed docstring for this function.") First;
		TopOpeBRepBuild_ShapeListOfShape & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepBuild_ShapeListOfShape

No detailed docstring for this function.") Last;
		TopOpeBRepBuild_ShapeListOfShape & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape & It);
		%feature("autodoc", "Args:
	I(TopOpeBRepBuild_ShapeListOfShape)
	It(TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const TopOpeBRepBuild_ShapeListOfShape & I,TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape & It);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfShapeListOfShape)
	It(TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TopOpeBRepBuild_ListOfShapeListOfShape & Other,TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape & It);
		%feature("autodoc", "Args:
	I(TopOpeBRepBuild_ShapeListOfShape)
	It(TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const TopOpeBRepBuild_ShapeListOfShape & I,TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape & It);
		%feature("autodoc", "Args:
	Other(TopOpeBRepBuild_ListOfShapeListOfShape)
	It(TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (TopOpeBRepBuild_ListOfShapeListOfShape & Other,TopOpeBRepBuild_ListIteratorOfListOfShapeListOfShape & It);
};


%feature("shadow") TopOpeBRepBuild_ListOfShapeListOfShape::~TopOpeBRepBuild_ListOfShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ListOfShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_Loop;
class TopOpeBRepBuild_Loop : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_Loop;
		 TopOpeBRepBuild_Loop (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	BI(TopOpeBRepBuild_BlockIterator)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_Loop;
		 TopOpeBRepBuild_Loop (const TopOpeBRepBuild_BlockIterator & BI);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsShape;
		virtual Standard_Boolean IsShape ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TopoDS_Shape

No detailed docstring for this function.") Shape;
		virtual const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepBuild_BlockIterator

No detailed docstring for this function.") BlockIterator;
		const TopOpeBRepBuild_BlockIterator & BlockIterator ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Dump;
		virtual void Dump ();
};


%feature("shadow") TopOpeBRepBuild_Loop::~TopOpeBRepBuild_Loop %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_Loop {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepBuild_Loop {
	Handle_TopOpeBRepBuild_Loop GetHandle() {
	return *(Handle_TopOpeBRepBuild_Loop*) &$self;
	}
};

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
    TopOpeBRepBuild_Loop* GetObject() {
    return (TopOpeBRepBuild_Loop*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepBuild_Loop::~Handle_TopOpeBRepBuild_Loop %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepBuild_Loop {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepBuild_LoopClassifier;
class TopOpeBRepBuild_LoopClassifier {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	L1(Handle_TopOpeBRepBuild_Loop)
	L2(Handle_TopOpeBRepBuild_Loop)

Returns:
	virtual TopAbs_State

Returns the state of loop <L1> compared with loop <L2>.") Compare;
		virtual TopAbs_State Compare (const Handle_TopOpeBRepBuild_Loop & L1,const Handle_TopOpeBRepBuild_Loop & L2);
};


%feature("shadow") TopOpeBRepBuild_LoopClassifier::~TopOpeBRepBuild_LoopClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_LoopClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_LoopSet;
class TopOpeBRepBuild_LoopSet {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_LoopSet;
		 TopOpeBRepBuild_LoopSet ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepBuild_ListOfLoop

No detailed docstring for this function.") ChangeListOfLoop;
		TopOpeBRepBuild_ListOfLoop & ChangeListOfLoop ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") InitLoop;
		virtual void InitLoop ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") MoreLoop;
		virtual Standard_Boolean MoreLoop ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") NextLoop;
		virtual void NextLoop ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_TopOpeBRepBuild_Loop

No detailed docstring for this function.") Loop;
		virtual const Handle_TopOpeBRepBuild_Loop & Loop ();
};


%feature("shadow") TopOpeBRepBuild_LoopSet::~TopOpeBRepBuild_LoopSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_LoopSet {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_ShapeListOfShape;
class TopOpeBRepBuild_ShapeListOfShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ShapeListOfShape;
		 TopOpeBRepBuild_ShapeListOfShape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ShapeListOfShape;
		 TopOpeBRepBuild_ShapeListOfShape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	L(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ShapeListOfShape;
		 TopOpeBRepBuild_ShapeListOfShape (const TopoDS_Shape & S,const TopTools_ListOfShape & L);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") List;
		const TopTools_ListOfShape & List ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ChangeList;
		TopTools_ListOfShape & ChangeList ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeShape;
		TopoDS_Shape & ChangeShape ();
};


%feature("shadow") TopOpeBRepBuild_ShapeListOfShape::~TopOpeBRepBuild_ShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_ShapeSet;
class TopOpeBRepBuild_ShapeSet {
	public:
		%feature("autodoc", "Args:
	SubShapeType(TopAbs_ShapeEnum)
	checkshape(Standard_Boolean)=Standard_True

Returns:
	None

Creates a ShapeSet  in order to build shapes connected  
by <SubShapeType>  shapes.  
<checkshape>:check (or not) the shapes, startelements, elements added.") TopOpeBRepBuild_ShapeSet;
		 TopOpeBRepBuild_ShapeSet (const TopAbs_ShapeEnum SubShapeType,const Standard_Boolean checkshape = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual void

Adds <S> to the list of shapes. (wires or shells).") AddShape;
		virtual void AddShape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual void

(S is a face or edge)  
Add S to the list of starting shapes used for reconstructions.  
apply AddElement(S).") AddStartElement;
		virtual void AddStartElement (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual void

for each subshape SE of S of type mySubShapeType  
- Add subshapes of S to the map of subshapes (mySubShapeMap)  
- Add S to the list of shape incident to subshapes of S.") AddElement;
		virtual void AddElement (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

return a reference on myStartShapes") StartElements;
		const TopTools_ListOfShape & StartElements ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitShapes;
		void InitShapes ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreShapes;
		Standard_Boolean MoreShapes ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextShape;
		void NextShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitStartElements;
		void InitStartElements ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreStartElements;
		Standard_Boolean MoreStartElements ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextStartElement;
		void NextStartElement ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") StartElement;
		const TopoDS_Shape & StartElement ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual void

No detailed docstring for this function.") InitNeighbours;
		virtual void InitNeighbours (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreNeighbours;
		Standard_Boolean MoreNeighbours ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextNeighbour;
		void NextNeighbour ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Neighbour;
		const TopoDS_Shape & Neighbour ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ChangeStartShapes;
		TopTools_ListOfShape & ChangeStartShapes ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Build the list of neighbour shapes of myCurrentShape  
(neighbour shapes and myCurrentShapes are of type t)  
Initialize myIncidentShapesIter on neighbour shapes.") FindNeighbours;
		virtual void FindNeighbours ();
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	V(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

No detailed docstring for this function.") MakeNeighboursList;
		virtual const TopTools_ListOfShape & MakeNeighboursList (const TopoDS_Shape & E,const TopoDS_Shape & V);
		%feature("autodoc", "Args:
	Shape(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") MaxNumberSubShape;
		Standard_Integer MaxNumberSubShape (const TopoDS_Shape & Shape);
		%feature("autodoc", "Args:
	checkshape(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") CheckShape;
		void CheckShape (const Standard_Boolean checkshape);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") CheckShape;
		Standard_Boolean CheckShape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	checkgeom(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

No detailed docstring for this function.") CheckShape;
		Standard_Boolean CheckShape (const TopoDS_Shape & S,const Standard_Boolean checkgeom = Standard_False);
		%feature("autodoc", "Args:
	OS(Standard_OStream)
	str(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") DumpName;
		void DumpName (Standard_OStream & OS,const TCollection_AsciiString & str);
		%feature("autodoc", "Args:
	OS(Standard_OStream)
	str(TCollection_AsciiString)
	S(TopoDS_Shape)
	chk(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") DumpCheck;
		void DumpCheck (Standard_OStream & OS,const TCollection_AsciiString & str,const TopoDS_Shape & S,const Standard_Boolean chk);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") DumpSS;
		virtual void DumpSS ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") DumpBB;
		virtual void DumpBB ();
		%feature("autodoc", "Args:
	N(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") DEBName;
		void DEBName (const TCollection_AsciiString & N);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") DEBName;
		const TCollection_AsciiString & DEBName ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") DEBNumber;
		void DEBNumber (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") DEBNumber;
		Standard_Integer DEBNumber ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	sb(TCollection_AsciiString)=
	sa(TCollection_AsciiString)=

Returns:
	virtual TCollection_AsciiString

No detailed docstring for this function.") SName;
		virtual TCollection_AsciiString SName (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	sb(TCollection_AsciiString)=
	sa(TCollection_AsciiString)=

Returns:
	virtual TCollection_AsciiString

No detailed docstring for this function.") SNameori;
		virtual TCollection_AsciiString SNameori (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("autodoc", "Args:
	S(TopTools_ListOfShape)
	sb(TCollection_AsciiString)=
	sa(TCollection_AsciiString)=

Returns:
	virtual TCollection_AsciiString

No detailed docstring for this function.") SName;
		virtual TCollection_AsciiString SName (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("autodoc", "Args:
	S(TopTools_ListOfShape)
	sb(TCollection_AsciiString)=
	sa(TCollection_AsciiString)=

Returns:
	virtual TCollection_AsciiString

No detailed docstring for this function.") SNameori;
		virtual TCollection_AsciiString SNameori (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
};


%feature("shadow") TopOpeBRepBuild_ShapeSet::~TopOpeBRepBuild_ShapeSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ShapeSet {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_ShellToSolid;
class TopOpeBRepBuild_ShellToSolid {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_ShellToSolid;
		 TopOpeBRepBuild_ShellToSolid ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Init;
		void Init ();
		%feature("autodoc", "Args:
	Sh(TopoDS_Shell)

Returns:
	None

No detailed docstring for this function.") AddShell;
		void AddShell (const TopoDS_Shell & Sh);
		%feature("autodoc", "Args:
	So(TopoDS_Solid)
	LSo(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") MakeSolids;
		void MakeSolids (const TopoDS_Solid & So,TopTools_ListOfShape & LSo);
};


%feature("shadow") TopOpeBRepBuild_ShellToSolid::~TopOpeBRepBuild_ShellToSolid %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ShellToSolid {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_SolidBuilder;
class TopOpeBRepBuild_SolidBuilder {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_SolidBuilder;
		 TopOpeBRepBuild_SolidBuilder ();
		%feature("autodoc", "Args:
	FS(TopOpeBRepBuild_ShellFaceSet)
	ForceClass(Standard_Boolean)=Standard_False

Returns:
	None

Create a SolidBuilder to build the areas on  
the shapes (shells, blocks of faces) described by <LS>.") TopOpeBRepBuild_SolidBuilder;
		 TopOpeBRepBuild_SolidBuilder (TopOpeBRepBuild_ShellFaceSet & FS,const Standard_Boolean ForceClass = Standard_False);
		%feature("autodoc", "Args:
	FS(TopOpeBRepBuild_ShellFaceSet)
	ForceClass(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") InitSolidBuilder;
		void InitSolidBuilder (TopOpeBRepBuild_ShellFaceSet & FS,const Standard_Boolean ForceClass);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") InitSolid;
		Standard_Integer InitSolid ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreSolid;
		Standard_Boolean MoreSolid ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextSolid;
		void NextSolid ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") InitShell;
		Standard_Integer InitShell ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreShell;
		Standard_Boolean MoreShell ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextShell;
		void NextShell ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOldShell;
		Standard_Boolean IsOldShell ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns current shell  
This shell may be :  
* an old shell OldShell(), which has not been reconstructed;  
* a new shell made of faces described by ...NewFace() methods.") OldShell;
		const TopoDS_Shape & OldShell ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") InitFace;
		Standard_Integer InitFace ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreFace;
		Standard_Boolean MoreFace ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextFace;
		void NextFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns current new face of current new shell.") Face;
		const TopoDS_Shape & Face ();
};


%feature("shadow") TopOpeBRepBuild_SolidBuilder::~TopOpeBRepBuild_SolidBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_SolidBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_Tools;
class TopOpeBRepBuild_Tools {
	public:
		%feature("autodoc", "Args:
	iP(Standard_Integer)
	aMapOfShapeWithState(TopOpeBRepDS_IndexedDataMapOfShapeWithState)

Returns:
	static void

No detailed docstring for this function.") DumpMapOfShapeWithState;
		static void DumpMapOfShapeWithState (const Standard_Integer iP,const TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState);
		%feature("autodoc", "Args:
	aVertex(TopoDS_Shape)
	aState(TopAbs_State)
	aShapeEnum(TopAbs_ShapeEnum)
	aMapVertexEdges(TopTools_IndexedDataMapOfShapeListOfShape)
	aMapProcessedVertices(TopTools_MapOfShape)
	aMapVs(TopOpeBRepDS_DataMapOfShapeState)

Returns:
	static void

No detailed docstring for this function.") FindState;
		static void FindState (const TopoDS_Shape & aVertex,const TopAbs_State aState,const TopAbs_ShapeEnum aShapeEnum,const TopTools_IndexedDataMapOfShapeListOfShape & aMapVertexEdges,TopTools_MapOfShape & aMapProcessedVertices,TopOpeBRepDS_DataMapOfShapeState & aMapVs);
		%feature("autodoc", "Args:
	aSplEdgesState(TopOpeBRepDS_DataMapOfShapeState)
	anEdgesToRestMap(TopTools_IndexedMapOfShape)
	aShapeEnum1(TopAbs_ShapeEnum)
	aShapeEnum2(TopAbs_ShapeEnum)
	aShapeClassifier(TopOpeBRepTool_ShapeClassifier)
	aMapOfShapeWithState(TopOpeBRepDS_IndexedDataMapOfShapeWithState)
	anUnkStateShapes(TopTools_MapOfShape)

Returns:
	static void

No detailed docstring for this function.") PropagateState;
		static void PropagateState (const TopOpeBRepDS_DataMapOfShapeState & aSplEdgesState,const TopTools_IndexedMapOfShape & anEdgesToRestMap,const TopAbs_ShapeEnum aShapeEnum1,const TopAbs_ShapeEnum aShapeEnum2,TopOpeBRepTool_ShapeClassifier & aShapeClassifier,TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState,const TopTools_MapOfShape & anUnkStateShapes);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aShapeClassifier(TopOpeBRepTool_ShapeClassifier)
	aMapOfShapeWithState(TopOpeBRepDS_IndexedDataMapOfShapeWithState)
	anAvoidSubshMap(TopTools_MapOfShape)

Returns:
	static TopAbs_State

No detailed docstring for this function.") FindStateThroughVertex;
		static TopAbs_State FindStateThroughVertex (const TopoDS_Shape & aShape,TopOpeBRepTool_ShapeClassifier & aShapeClassifier,TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState,const TopTools_MapOfShape & anAvoidSubshMap);
		%feature("autodoc", "Args:
	aFacesToRestMap(TopTools_IndexedMapOfShape)
	aMapOfShapeWithState(TopOpeBRepDS_IndexedDataMapOfShapeWithState)

Returns:
	static void

No detailed docstring for this function.") PropagateStateForWires;
		static void PropagateStateForWires (const TopTools_IndexedMapOfShape & aFacesToRestMap,TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)
	aState(TopAbs_State)
	aMapOfShapeWithState(TopOpeBRepDS_IndexedDataMapOfShapeWithState)

Returns:
	static void

No detailed docstring for this function.") SpreadStateToChild;
		static void SpreadStateToChild (const TopoDS_Shape & aShape,const TopAbs_State aState,TopOpeBRepDS_IndexedDataMapOfShapeWithState & aMapOfShapeWithState);
		%feature("autodoc", "Args:
	anEdge(TopoDS_Shape)
	aState(TopAbs_State)
	aMapEdgesFaces(TopTools_IndexedDataMapOfShapeListOfShape)
	aMapProcessedVertices(TopTools_MapOfShape)
	aMapVs(TopOpeBRepDS_DataMapOfShapeState)

Returns:
	static void

No detailed docstring for this function.") FindState1;
		static void FindState1 (const TopoDS_Shape & anEdge,const TopAbs_State aState,const TopTools_IndexedDataMapOfShapeListOfShape & aMapEdgesFaces,TopTools_MapOfShape & aMapProcessedVertices,TopOpeBRepDS_DataMapOfShapeState & aMapVs);
		%feature("autodoc", "Args:
	anEdge(TopoDS_Shape)
	aState(TopAbs_State)
	aMapEdgesFaces(TopTools_IndexedDataMapOfShapeListOfShape)
	aMapProcessedEdges(TopTools_MapOfShape)
	aMapVs(TopOpeBRepDS_DataMapOfShapeState)

Returns:
	static void

No detailed docstring for this function.") FindState2;
		static void FindState2 (const TopoDS_Shape & anEdge,const TopAbs_State aState,const TopTools_IndexedDataMapOfShapeListOfShape & aMapEdgesFaces,TopTools_MapOfShape & aMapProcessedEdges,TopOpeBRepDS_DataMapOfShapeState & aMapVs);
		%feature("autodoc", "Args:
	aFaceObj(TopoDS_Shape)
	anEObj(TopoDS_Shape)
	anEdgeFaceMap(TopTools_IndexedDataMapOfShapeListOfShape)
	anAdjFaceObj(TopoDS_Shape)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") GetAdjacentFace;
		static Standard_Boolean GetAdjacentFace (const TopoDS_Shape & aFaceObj,const TopoDS_Shape & anEObj,const TopTools_IndexedDataMapOfShapeListOfShape & anEdgeFaceMap,TopoDS_Shape & anAdjFaceObj);
		%feature("autodoc", "Args:
	aFObj(TopoDS_Face)
	anEdgeObj(TopoDS_Edge)
	aDirNormal(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") GetNormalToFaceOnEdge;
		static void GetNormalToFaceOnEdge (const TopoDS_Face & aFObj,const TopoDS_Edge & anEdgeObj,gp_Vec & aDirNormal);
		%feature("autodoc", "Args:
	aFace(TopoDS_Face)
	anEdge(TopoDS_Edge)
	aNormal(gp_Vec)

Returns:
	static void

This  function  used  to  compute  normal  in  point  which  is  located  
         near  the  point  with  param  UV    (used  for  computation  of  normals  where  the  normal  in  the  point UV  equal  to  zero).") GetNormalInNearestPoint;
		static void GetNormalInNearestPoint (const TopoDS_Face & aFace,const TopoDS_Edge & anEdge,gp_Vec & aNormal);
		%feature("autodoc", "Args:
	aFObj(TopoDS_Face)
	anEdgeObj(TopoDS_Edge)
	aOriEObj(TopoDS_Edge)
	aTangent(gp_Vec)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") GetTangentToEdgeEdge;
		static Standard_Boolean GetTangentToEdgeEdge (const TopoDS_Face & aFObj,const TopoDS_Edge & anEdgeObj,const TopoDS_Edge & aOriEObj,gp_Vec & aTangent);
		%feature("autodoc", "Args:
	anEdgeObj(TopoDS_Edge)
	aTangent(gp_Vec)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") GetTangentToEdge;
		static Standard_Boolean GetTangentToEdge (const TopoDS_Edge & anEdgeObj,gp_Vec & aTangent);
		%feature("autodoc", "Args:
	aWire(TopoDS_Wire)
	fromFace(TopoDS_Face)
	toFace(TopoDS_Face)

Returns:
	static void

Recompute  PCurves  of  the  all  edges  from  the  wire  on  the  <toFace>") UpdatePCurves;
		static void UpdatePCurves (const TopoDS_Wire & aWire,const TopoDS_Face & fromFace,const TopoDS_Face & toFace);
		%feature("autodoc", "Args:
	aEdgeToUpdate(TopoDS_Edge)
	OldFace(TopoDS_Face)
	NewFace(TopoDS_Face)

Returns:
	static void

recompute  PCurves  of  the  closing  (SIM  ,  with 2  PCurves)  edge on  the  NewFace") UpdateEdgeOnPeriodicalFace;
		static void UpdateEdgeOnPeriodicalFace (const TopoDS_Edge & aEdgeToUpdate,const TopoDS_Face & OldFace,const TopoDS_Face & NewFace);
		%feature("autodoc", "Args:
	aEdgeToUpdate(TopoDS_Edge)
	OldFace(TopoDS_Face)
	NewFace(TopoDS_Face)

Returns:
	static void

recompute  PCurve  of  the    edge on  the  NewFace") UpdateEdgeOnFace;
		static void UpdateEdgeOnFace (const TopoDS_Edge & aEdgeToUpdate,const TopoDS_Face & OldFace,const TopoDS_Face & NewFace);
		%feature("autodoc", "Args:
	anE1(TopoDS_Shape)
	anE2(TopoDS_Shape)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsDegEdgesTheSame;
		static Standard_Boolean IsDegEdgesTheSame (const TopoDS_Shape & anE1,const TopoDS_Shape & anE2);
		%feature("autodoc", "Args:
	oldFace(TopoDS_Shape)
	corrFace(TopoDS_Shape)

Returns:
	static void

test  if  <oldFace>  does  not  contain  INTERNAL  or  EXTERNAL  edges  
           and  remove  such  edges  in  case  of  its  presence.  The  result  is  stored  in  <corrFace>") NormalizeFace;
		static void NormalizeFace (const TopoDS_Shape & oldFace,TopoDS_Shape & corrFace);
		%feature("autodoc", "Args:
	oldFace(TopoDS_Shape)
	corrFace(TopoDS_Shape)
	aSourceShapes(TopTools_IndexedMapOfOrientedShape)
	aMapOfCorrect2dEdges(TopTools_IndexedDataMapOfShapeShape)

Returns:
	static void

test  if  UV  representation  of  <oldFace>  is  good  (i.e.  face  is  closed  in  2d).  
          if  face  is  not  closed  ,  this  method  will  try  to  close  such  face  and  will  
          return  corrected  edges  in  the  <aMapOfCorrect2dEdges>.  Parameter  <aSourceShapes>  
          used  to  fix  the  edge  (or  wires)  which  should  be  correct  (Corrector  used  it  as  a  start  shapes).  
          NOTE  :  Parameter  corrFace  doesn't  mean  anything.  If  you  want  to use  this  method  ,  rebuild  resulting  face  
          after  by  yourself  using  corrected  edges.") CorrectFace2d;
		static void CorrectFace2d (const TopoDS_Shape & oldFace,TopoDS_Shape & corrFace,const TopTools_IndexedMapOfOrientedShape & aSourceShapes,TopTools_IndexedDataMapOfShapeShape & aMapOfCorrect2dEdges);
		%feature("autodoc", "Args:
	aS(TopoDS_Shape)
	aTolMax(Standard_Real)=0.0001

Returns:
	static void

No detailed docstring for this function.") CorrectTolerances;
		static void CorrectTolerances (const TopoDS_Shape & aS,const Standard_Real aTolMax = 0.0001);
		%feature("autodoc", "Args:
	aS(TopoDS_Shape)
	aTolMax(Standard_Real)=0.0001

Returns:
	static void

No detailed docstring for this function.") CorrectCurveOnSurface;
		static void CorrectCurveOnSurface (const TopoDS_Shape & aS,const Standard_Real aTolMax = 0.0001);
		%feature("autodoc", "Args:
	aS(TopoDS_Shape)
	aTolMax(Standard_Real)=0.0001

Returns:
	static void

No detailed docstring for this function.") CorrectPointOnCurve;
		static void CorrectPointOnCurve (const TopoDS_Shape & aS,const Standard_Real aTolMax = 0.0001);
		%feature("autodoc", "Args:
	theFace(TopoDS_Face)

Returns:
	static Standard_Boolean

Checks if <theFace> has the properly closed in 2D boundary(ies)") CheckFaceClosed2d;
		static Standard_Boolean CheckFaceClosed2d (const TopoDS_Face & theFace);
};


%feature("shadow") TopOpeBRepBuild_Tools::~TopOpeBRepBuild_Tools %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_Tools {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_Tools2d;
class TopOpeBRepBuild_Tools2d {
	public:
		%feature("autodoc", "Args:
	aWire(TopoDS_Wire)
	aMap(TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo)

Returns:
	static void

No detailed docstring for this function.") MakeMapOfShapeVertexInfo;
		static void MakeMapOfShapeVertexInfo (const TopoDS_Wire & aWire,TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo)

Returns:
	static void

No detailed docstring for this function.") DumpMapOfShapeVertexInfo;
		static void DumpMapOfShapeVertexInfo (const TopOpeBRepBuild_IndexedDataMapOfShapeVertexInfo & aMap);
		%feature("autodoc", "Args:
	aWire(TopoDS_Wire)
	aResList(TopTools_ListOfShape)

Returns:
	static void

No detailed docstring for this function.") Path;
		static void Path (const TopoDS_Wire & aWire,TopTools_ListOfShape & aResList);
};


%feature("shadow") TopOpeBRepBuild_Tools2d::~TopOpeBRepBuild_Tools2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_Tools2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_VertexInfo;
class TopOpeBRepBuild_VertexInfo {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_VertexInfo;
		 TopOpeBRepBuild_VertexInfo ();
		%feature("autodoc", "Args:
	aV(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") SetVertex;
		void SetVertex (const TopoDS_Vertex & aV);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") Vertex;
		const TopoDS_Vertex & Vertex ();
		%feature("autodoc", "Args:
	aFlag(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetSmart;
		void SetSmart (const Standard_Boolean aFlag);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Smart;
		Standard_Boolean Smart ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbCases;
		Standard_Integer NbCases ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FoundOut;
		Standard_Integer FoundOut ();
		%feature("autodoc", "Args:
	anE(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") AddIn;
		void AddIn (const TopoDS_Edge & anE);
		%feature("autodoc", "Args:
	anE(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") AddOut;
		void AddOut (const TopoDS_Edge & anE);
		%feature("autodoc", "Args:
	anE(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") SetCurrentIn;
		void SetCurrentIn (const TopoDS_Edge & anE);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_IndexedMapOfOrientedShape

No detailed docstring for this function.") EdgesIn;
		const TopTools_IndexedMapOfOrientedShape & EdgesIn ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_IndexedMapOfOrientedShape

No detailed docstring for this function.") EdgesOut;
		const TopTools_IndexedMapOfOrientedShape & EdgesOut ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_IndexedMapOfOrientedShape

No detailed docstring for this function.") ChangeEdgesOut;
		TopTools_IndexedMapOfOrientedShape & ChangeEdgesOut ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") CurrentOut;
		const TopoDS_Edge & CurrentOut ();
		%feature("autodoc", "Args:
	anE(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") AppendPassed;
		void AppendPassed (const TopoDS_Edge & anE);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemovePassed;
		void RemovePassed ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ListPassed;
		const TopTools_ListOfShape & ListPassed ();
		%feature("autodoc", "Args:
	aL(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Prepare;
		void Prepare (const TopTools_ListOfShape & aL);
};


%feature("shadow") TopOpeBRepBuild_VertexInfo::~TopOpeBRepBuild_VertexInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_VertexInfo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_WireToFace;
class TopOpeBRepBuild_WireToFace {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_WireToFace;
		 TopOpeBRepBuild_WireToFace ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Init;
		void Init ();
		%feature("autodoc", "Args:
	W(TopoDS_Wire)

Returns:
	None

No detailed docstring for this function.") AddWire;
		void AddWire (const TopoDS_Wire & W);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	LF(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") MakeFaces;
		void MakeFaces (const TopoDS_Face & F,TopTools_ListOfShape & LF);
};


%feature("shadow") TopOpeBRepBuild_WireToFace::~TopOpeBRepBuild_WireToFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_WireToFace {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_Area1dBuilder;
class TopOpeBRepBuild_Area1dBuilder : public TopOpeBRepBuild_AreaBuilder {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_Area1dBuilder;
		 TopOpeBRepBuild_Area1dBuilder ();
		%feature("autodoc", "Args:
	LS(TopOpeBRepBuild_PaveSet)
	LC(TopOpeBRepBuild_PaveClassifier)
	ForceClass(Standard_Boolean)=Standard_False

Returns:
	None

Creates a Area1dBuilder to find the areas of  
the shapes described by <LS> using the classifier <LC>.") TopOpeBRepBuild_Area1dBuilder;
		 TopOpeBRepBuild_Area1dBuilder (TopOpeBRepBuild_PaveSet & LS,TopOpeBRepBuild_PaveClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("autodoc", "Args:
	LS(TopOpeBRepBuild_LoopSet)
	LC(TopOpeBRepBuild_LoopClassifier)
	ForceClass(Standard_Boolean)=Standard_False

Returns:
	virtual void

Sets a Area1dBuilder to find the areas of  
the shapes described by <LS> using the classifier <LC>.") InitAreaBuilder;
		virtual void InitAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("autodoc", "Args:
	L(Handle_TopOpeBRepBuild_Loop)
	LOL(TopOpeBRepBuild_ListOfLoop)
	s(Standard_Address)=NULL

Returns:
	virtual void

No detailed docstring for this function.") ADD_Loop_TO_LISTOFLoop;
		virtual void ADD_Loop_TO_LISTOFLoop (const Handle_TopOpeBRepBuild_Loop & L,TopOpeBRepBuild_ListOfLoop & LOL,const Standard_Address s = NULL);
		%feature("autodoc", "Args:
	ITLOL(TopOpeBRepBuild_ListIteratorOfListOfLoop)
	LOL(TopOpeBRepBuild_ListOfLoop)
	s(Standard_Address)=NULL

Returns:
	virtual void

No detailed docstring for this function.") REM_Loop_FROM_LISTOFLoop;
		virtual void REM_Loop_FROM_LISTOFLoop (TopOpeBRepBuild_ListIteratorOfListOfLoop & ITLOL,TopOpeBRepBuild_ListOfLoop & LOL,const Standard_Address s = NULL);
		%feature("autodoc", "Args:
	LOL1(TopOpeBRepBuild_ListOfLoop)
	LOL2(TopOpeBRepBuild_ListOfLoop)
	s(Standard_Address)=NULL
	s1(Standard_Address)=NULL
	s2(Standard_Address)=NULL

Returns:
	virtual void

No detailed docstring for this function.") ADD_LISTOFLoop_TO_LISTOFLoop;
		virtual void ADD_LISTOFLoop_TO_LISTOFLoop (TopOpeBRepBuild_ListOfLoop & LOL1,TopOpeBRepBuild_ListOfLoop & LOL2,const Standard_Address s = NULL,const Standard_Address s1 = NULL,const Standard_Address s2 = NULL);
		%feature("autodoc", "Args:
	L(TopOpeBRepBuild_ListOfLoop)

Returns:
	static void

No detailed docstring for this function.") DumpList;
		static void DumpList (const TopOpeBRepBuild_ListOfLoop & L);
};


%feature("shadow") TopOpeBRepBuild_Area1dBuilder::~TopOpeBRepBuild_Area1dBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_Area1dBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_Area2dBuilder;
class TopOpeBRepBuild_Area2dBuilder : public TopOpeBRepBuild_AreaBuilder {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_Area2dBuilder;
		 TopOpeBRepBuild_Area2dBuilder ();
		%feature("autodoc", "Args:
	LS(TopOpeBRepBuild_LoopSet)
	LC(TopOpeBRepBuild_LoopClassifier)
	ForceClass(Standard_Boolean)=Standard_False

Returns:
	None

Creates a Area2dBuilder to build faces on  
the (wires,blocks of edge) of <LS>, using the classifier <LC>.") TopOpeBRepBuild_Area2dBuilder;
		 TopOpeBRepBuild_Area2dBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("autodoc", "Args:
	LS(TopOpeBRepBuild_LoopSet)
	LC(TopOpeBRepBuild_LoopClassifier)
	ForceClass(Standard_Boolean)=Standard_False

Returns:
	virtual void

Sets a Area1dBuilder to find the areas of  
the shapes described by <LS> using the classifier <LC>.") InitAreaBuilder;
		virtual void InitAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
};


%feature("shadow") TopOpeBRepBuild_Area2dBuilder::~TopOpeBRepBuild_Area2dBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_Area2dBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_Area3dBuilder;
class TopOpeBRepBuild_Area3dBuilder : public TopOpeBRepBuild_AreaBuilder {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_Area3dBuilder;
		 TopOpeBRepBuild_Area3dBuilder ();
		%feature("autodoc", "Args:
	LS(TopOpeBRepBuild_LoopSet)
	LC(TopOpeBRepBuild_LoopClassifier)
	ForceClass(Standard_Boolean)=Standard_False

Returns:
	None

Creates a Area3dBuilder to build Solids on  
the (shells,blocks of face) of <LS>, using the classifier <LC>.") TopOpeBRepBuild_Area3dBuilder;
		 TopOpeBRepBuild_Area3dBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("autodoc", "Args:
	LS(TopOpeBRepBuild_LoopSet)
	LC(TopOpeBRepBuild_LoopClassifier)
	ForceClass(Standard_Boolean)=Standard_False

Returns:
	virtual void

Sets a Area1dBuilder to find the areas of  
the shapes described by <LS> using the classifier <LC>.") InitAreaBuilder;
		virtual void InitAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
};


%feature("shadow") TopOpeBRepBuild_Area3dBuilder::~TopOpeBRepBuild_Area3dBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_Area3dBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_Builder1;
class TopOpeBRepBuild_Builder1 : public TopOpeBRepBuild_Builder {
	public:
		%feature("autodoc", "Args:
	BT(TopOpeBRepDS_BuildTool)

Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_Builder1;
		 TopOpeBRepBuild_Builder1 (const TopOpeBRepDS_BuildTool & BT);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Removes all splits and merges already performed.  
Does NOT clear the handled DS  (except  ShapeWithStatesMaps).") Clear;
		virtual void Clear ();
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	virtual void

No detailed docstring for this function.") Perform;
		virtual void Perform (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	virtual void

No detailed docstring for this function.") Perform;
		virtual void Perform (const Handle_TopOpeBRepDS_HDataStructure & HDS,const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") MergeKPart;
		virtual void MergeKPart ();
		%feature("autodoc", "Args:
	TB1(TopAbs_State)
	TB2(TopAbs_State)

Returns:
	virtual void

No detailed docstring for this function.") MergeKPart;
		virtual void MergeKPart (const TopAbs_State TB1,const TopAbs_State TB2);
		%feature("autodoc", "Args:
	SO1(TopoDS_Shape)
	LSO2(TopTools_ListOfShape)
	G(TopOpeBRepBuild_GTopo)
	SFS(TopOpeBRepBuild_ShellFaceSet)

Returns:
	virtual void

No detailed docstring for this function.") GFillSolidSFS;
		virtual void GFillSolidSFS (const TopoDS_Shape & SO1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);
		%feature("autodoc", "Args:
	SH1(TopoDS_Shape)
	LSO2(TopTools_ListOfShape)
	G(TopOpeBRepBuild_GTopo)
	SFS(TopOpeBRepBuild_ShellFaceSet)

Returns:
	virtual void

No detailed docstring for this function.") GFillShellSFS;
		virtual void GFillShellSFS (const TopoDS_Shape & SH1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);
		%feature("autodoc", "Args:
	FF(TopoDS_Shape)
	WES(TopOpeBRepBuild_WireEdgeSet)
	LOF(TopTools_ListOfShape)

Returns:
	virtual void

No detailed docstring for this function.") GWESMakeFaces;
		virtual void GWESMakeFaces (const TopoDS_Shape & FF,TopOpeBRepBuild_WireEdgeSet & WES,TopTools_ListOfShape & LOF);
		%feature("autodoc", "Args:
	F1(TopoDS_Shape)
	LSO2(TopTools_ListOfShape)
	G(TopOpeBRepBuild_GTopo)
	SFS(TopOpeBRepBuild_ShellFaceSet)

Returns:
	None

No detailed docstring for this function.") GFillFaceNotSameDomSFS;
		void GFillFaceNotSameDomSFS (const TopoDS_Shape & F1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);
		%feature("autodoc", "Args:
	F1(TopoDS_Shape)
	LSO2(TopTools_ListOfShape)
	G(TopOpeBRepBuild_GTopo)
	WES(TopOpeBRepBuild_WireEdgeSet)

Returns:
	None

No detailed docstring for this function.") GFillFaceNotSameDomWES;
		void GFillFaceNotSameDomWES (const TopoDS_Shape & F1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);
		%feature("autodoc", "Args:
	W1(TopoDS_Shape)
	LSO2(TopTools_ListOfShape)
	G(TopOpeBRepBuild_GTopo)
	WES(TopOpeBRepBuild_WireEdgeSet)

Returns:
	None

No detailed docstring for this function.") GFillWireNotSameDomWES;
		void GFillWireNotSameDomWES (const TopoDS_Shape & W1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);
		%feature("autodoc", "Args:
	E1(TopoDS_Shape)
	LSO2(TopTools_ListOfShape)
	G(TopOpeBRepBuild_GTopo)
	WES(TopOpeBRepBuild_WireEdgeSet)

Returns:
	None

No detailed docstring for this function.") GFillEdgeNotSameDomWES;
		void GFillEdgeNotSameDomWES (const TopoDS_Shape & E1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);
		%feature("autodoc", "Args:
	F1(TopoDS_Shape)
	LSO2(TopTools_ListOfShape)
	G(TopOpeBRepBuild_GTopo)
	SFS(TopOpeBRepBuild_ShellFaceSet)

Returns:
	None

No detailed docstring for this function.") GFillFaceSameDomSFS;
		void GFillFaceSameDomSFS (const TopoDS_Shape & F1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_ShellFaceSet & SFS);
		%feature("autodoc", "Args:
	F1(TopoDS_Shape)
	LSO2(TopTools_ListOfShape)
	G(TopOpeBRepBuild_GTopo)
	WES(TopOpeBRepBuild_WireEdgeSet)

Returns:
	None

No detailed docstring for this function.") GFillFaceSameDomWES;
		void GFillFaceSameDomWES (const TopoDS_Shape & F1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);
		%feature("autodoc", "Args:
	W1(TopoDS_Shape)
	LSO2(TopTools_ListOfShape)
	G(TopOpeBRepBuild_GTopo)
	WES(TopOpeBRepBuild_WireEdgeSet)

Returns:
	None

No detailed docstring for this function.") GFillWireSameDomWES;
		void GFillWireSameDomWES (const TopoDS_Shape & W1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);
		%feature("autodoc", "Args:
	E1(TopoDS_Shape)
	LSO2(TopTools_ListOfShape)
	G(TopOpeBRepBuild_GTopo)
	WES(TopOpeBRepBuild_WireEdgeSet)

Returns:
	None

No detailed docstring for this function.") GFillEdgeSameDomWES;
		void GFillEdgeSameDomWES (const TopoDS_Shape & E1,const TopTools_ListOfShape & LSO2,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)
	SDfaces(TopTools_IndexedMapOfShape)
	G(TopOpeBRepBuild_GTopo)
	WES(TopOpeBRepBuild_WireEdgeSet)

Returns:
	None

No detailed docstring for this function.") PerformONParts;
		void PerformONParts (const TopoDS_Shape & F,const TopTools_IndexedMapOfShape & SDfaces,const TopOpeBRepBuild_GTopo & G,TopOpeBRepBuild_WireEdgeSet & WES);
		%feature("autodoc", "Args:
	aPieceToPerform(TopoDS_Edge)
	aOriginalEdge(TopoDS_Edge)
	edgeFace(TopoDS_Face)
	toFace(TopoDS_Face)
	G(TopOpeBRepBuild_GTopo)
	keep(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") PerformPieceIn2D;
		void PerformPieceIn2D (const TopoDS_Edge & aPieceToPerform,const TopoDS_Edge & aOriginalEdge,const TopoDS_Face & edgeFace,const TopoDS_Face & toFace,const TopOpeBRepBuild_GTopo & G,Standard_Boolean & keep);
		%feature("autodoc", "Args:
	aPieceObj(TopoDS_Shape)
	aFaceObj(TopoDS_Shape)
	aEdgeObj(TopoDS_Shape)
	aListOfPieces(TopTools_ListOfShape)
	aListOfFaces(TopTools_ListOfShape)
	aListOfPiecesOut2d(TopTools_ListOfShape)

Returns:
	Standard_Integer

No detailed docstring for this function.") PerformPieceOn2D;
		Standard_Integer PerformPieceOn2D (const TopoDS_Shape & aPieceObj,const TopoDS_Shape & aFaceObj,const TopoDS_Shape & aEdgeObj,TopTools_ListOfShape & aListOfPieces,TopTools_ListOfShape & aListOfFaces,TopTools_ListOfShape & aListOfPiecesOut2d);
		%feature("autodoc", "Args:
	aSeq(TopTools_SequenceOfShape)
	aListOfPieces(TopTools_ListOfShape)
	aListOfFaces(TopTools_ListOfShape)
	aListOfPiecesOut2d(TopTools_ListOfShape)

Returns:
	Standard_Integer

No detailed docstring for this function.") TwoPiecesON;
		Standard_Integer TwoPiecesON (const TopTools_SequenceOfShape & aSeq,TopTools_ListOfShape & aListOfPieces,TopTools_ListOfShape & aListOfFaces,TopTools_ListOfShape & aListOfPiecesOut2d);
		%feature("autodoc", "Args:
	aResult(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") CorrectResult2d;
		Standard_Integer CorrectResult2d (TopoDS_Shape & aResult);
};


%feature("shadow") TopOpeBRepBuild_Builder1::~TopOpeBRepBuild_Builder1 %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_Builder1 {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_CompositeClassifier;
class TopOpeBRepBuild_CompositeClassifier : public TopOpeBRepBuild_LoopClassifier {
	public:
		%feature("autodoc", "Args:
	L1(Handle_TopOpeBRepBuild_Loop)
	L2(Handle_TopOpeBRepBuild_Loop)

Returns:
	virtual TopAbs_State

No detailed docstring for this function.") Compare;
		virtual TopAbs_State Compare (const Handle_TopOpeBRepBuild_Loop & L1,const Handle_TopOpeBRepBuild_Loop & L2);
		%feature("autodoc", "Args:
	B1(TopoDS_Shape)
	B2(TopoDS_Shape)

Returns:
	virtual TopAbs_State

classify shape <B1> with shape <B2>") CompareShapes;
		virtual TopAbs_State CompareShapes (const TopoDS_Shape & B1,const TopoDS_Shape & B2);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	B(TopoDS_Shape)

Returns:
	virtual TopAbs_State

classify element <E> with shape <B>") CompareElementToShape;
		virtual TopAbs_State CompareElementToShape (const TopoDS_Shape & E,const TopoDS_Shape & B);
		%feature("autodoc", "Args:
	B(TopoDS_Shape)

Returns:
	virtual void

prepare classification involving shape <B>  
calls ResetElement on first element of <B>") ResetShape;
		virtual void ResetShape (const TopoDS_Shape & B);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)

Returns:
	virtual void

prepare classification involving element <E>.") ResetElement;
		virtual void ResetElement (const TopoDS_Shape & E);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)

Returns:
	virtual Standard_Boolean

Add element <E> in the set of elements used in classification.  
 Returns FALSE if the element <E> has been already added to the set of elements,  
 otherwise returns TRUE.") CompareElement;
		virtual Standard_Boolean CompareElement (const TopoDS_Shape & E);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopAbs_State

Returns state of classification of 2D point, defined by  
ResetElement, with the current set of elements, defined by Compare.") State;
		virtual TopAbs_State State ();
};


%feature("shadow") TopOpeBRepBuild_CompositeClassifier::~TopOpeBRepBuild_CompositeClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_CompositeClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_Pave;
class TopOpeBRepBuild_Pave : public TopOpeBRepBuild_Loop {
	public:
		%feature("autodoc", "Args:
	V(TopoDS_Shape)
	P(Standard_Real)
	bound(Standard_Boolean)

Returns:
	None

V = vertex, P = parameter of vertex <V>  
         bound = True if <V> is an old vertex  
         bound = False if <V> is a new vertex") TopOpeBRepBuild_Pave;
		 TopOpeBRepBuild_Pave (const TopoDS_Shape & V,const Standard_Real P,const Standard_Boolean bound);
		%feature("autodoc", "Args:
	b(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") HasSameDomain;
		void HasSameDomain (const Standard_Boolean b);
		%feature("autodoc", "Args:
	VSD(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SameDomain;
		void SameDomain (const TopoDS_Shape & VSD);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasSameDomain;
		Standard_Boolean HasSameDomain ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") SameDomain;
		const TopoDS_Shape & SameDomain ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Vertex;
		const TopoDS_Shape & Vertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeVertex;
		TopoDS_Shape & ChangeVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	Par(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Parameter;
		void Parameter (const Standard_Real Par);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_Kind

No detailed docstring for this function.") InterferenceType;
		TopOpeBRepDS_Kind & InterferenceType ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsShape;
		virtual Standard_Boolean IsShape ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TopoDS_Shape

No detailed docstring for this function.") Shape;
		virtual const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Dump;
		virtual void Dump ();
};


%feature("shadow") TopOpeBRepBuild_Pave::~TopOpeBRepBuild_Pave %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_Pave {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRepBuild_Pave {
	Handle_TopOpeBRepBuild_Pave GetHandle() {
	return *(Handle_TopOpeBRepBuild_Pave*) &$self;
	}
};

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
    TopOpeBRepBuild_Pave* GetObject() {
    return (TopOpeBRepBuild_Pave*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRepBuild_Pave::~Handle_TopOpeBRepBuild_Pave %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRepBuild_Pave {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRepBuild_PaveClassifier;
class TopOpeBRepBuild_PaveClassifier : public TopOpeBRepBuild_LoopClassifier {
	public:
		%feature("autodoc", "Args:
	E(TopoDS_Shape)

Returns:
	None

Create a Pave classifier to compare vertices on edge <E>.") TopOpeBRepBuild_PaveClassifier;
		 TopOpeBRepBuild_PaveClassifier (const TopoDS_Shape & E);
		%feature("autodoc", "Args:
	L1(Handle_TopOpeBRepBuild_Loop)
	L2(Handle_TopOpeBRepBuild_Loop)

Returns:
	TopAbs_State

Returns state of vertex <L1> compared with <L2>.") Compare;
		TopAbs_State Compare (const Handle_TopOpeBRepBuild_Loop & L1,const Handle_TopOpeBRepBuild_Loop & L2);
		%feature("autodoc", "Args:
	P(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetFirstParameter;
		void SetFirstParameter (const Standard_Real P);
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") ClosedVertices;
		void ClosedVertices (const Standard_Boolean B);
		%feature("autodoc", "Args:
	p1(Standard_Real)
	o(TopAbs_Orientation)
	first(Standard_Real)
	period(Standard_Real)
	tol(Standard_Real)
	cas(Standard_Integer)

Returns:
	static Standard_Real

No detailed docstring for this function.") AdjustCase;
		static Standard_Real AdjustCase (const Standard_Real p1,const TopAbs_Orientation o,const Standard_Real first,const Standard_Real period,const Standard_Real tol,Standard_Integer &OutValue);
};


%feature("shadow") TopOpeBRepBuild_PaveClassifier::~TopOpeBRepBuild_PaveClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_PaveClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_PaveSet;
class TopOpeBRepBuild_PaveSet : public TopOpeBRepBuild_LoopSet {
	public:
		%feature("autodoc", "Args:
	E(TopoDS_Shape)

Returns:
	None

Create a Pave set on edge <E>. It contains <E> vertices.") TopOpeBRepBuild_PaveSet;
		 TopOpeBRepBuild_PaveSet (const TopoDS_Shape & E);
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") RemovePV;
		void RemovePV (const Standard_Boolean B);
		%feature("autodoc", "Args:
	PV(Handle_TopOpeBRepBuild_Pave)

Returns:
	None

Add <PV> in the Pave set.") Append;
		void Append (const Handle_TopOpeBRepBuild_Pave & PV);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") InitLoop;
		virtual void InitLoop ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") MoreLoop;
		virtual Standard_Boolean MoreLoop ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") NextLoop;
		virtual void NextLoop ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_TopOpeBRepBuild_Loop

No detailed docstring for this function.") Loop;
		virtual const Handle_TopOpeBRepBuild_Loop & Loop ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasEqualParameters;
		Standard_Boolean HasEqualParameters ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") EqualParameters;
		Standard_Real EqualParameters ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") ClosedVertices;
		Standard_Boolean ClosedVertices ();
		%feature("autodoc", "Args:
	Lin(TopOpeBRepBuild_ListOfPave)
	Lout(TopOpeBRepBuild_ListOfPave)

Returns:
	static void

No detailed docstring for this function.") SortPave;
		static void SortPave (const TopOpeBRepBuild_ListOfPave & Lin,TopOpeBRepBuild_ListOfPave & Lout);
};


%feature("shadow") TopOpeBRepBuild_PaveSet::~TopOpeBRepBuild_PaveSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_PaveSet {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_ShellFaceSet;
class TopOpeBRepBuild_ShellFaceSet : public TopOpeBRepBuild_ShapeSet {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a ShellFaceSet to build blocks of faces  
connected by edges.") TopOpeBRepBuild_ShellFaceSet;
		 TopOpeBRepBuild_ShellFaceSet ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Addr(Standard_Address)=NULL

Returns:
	None

Creates a ShellFaceSet to build blocks of faces  
connected by edges.") TopOpeBRepBuild_ShellFaceSet;
		 TopOpeBRepBuild_ShellFaceSet (const TopoDS_Shape & S,const Standard_Address Addr = NULL);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Solid

No detailed docstring for this function.") Solid;
		const TopoDS_Solid & Solid ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual void

No detailed docstring for this function.") AddShape;
		virtual void AddShape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual void

No detailed docstring for this function.") AddStartElement;
		virtual void AddStartElement (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual void

No detailed docstring for this function.") AddElement;
		virtual void AddElement (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") DumpSS;
		virtual void DumpSS ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	sb(TCollection_AsciiString)=
	sa(TCollection_AsciiString)=

Returns:
	virtual TCollection_AsciiString

No detailed docstring for this function.") SName;
		virtual TCollection_AsciiString SName (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("autodoc", "Args:
	S(TopTools_ListOfShape)
	sb(TCollection_AsciiString)=
	sa(TCollection_AsciiString)=

Returns:
	virtual TCollection_AsciiString

No detailed docstring for this function.") SName;
		virtual TCollection_AsciiString SName (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	sb(TCollection_AsciiString)=
	sa(TCollection_AsciiString)=

Returns:
	virtual TCollection_AsciiString

No detailed docstring for this function.") SNameori;
		virtual TCollection_AsciiString SNameori (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("autodoc", "Args:
	S(TopTools_ListOfShape)
	sb(TCollection_AsciiString)=
	sa(TCollection_AsciiString)=

Returns:
	virtual TCollection_AsciiString

No detailed docstring for this function.") SNameori;
		virtual TCollection_AsciiString SNameori (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
};


%feature("shadow") TopOpeBRepBuild_ShellFaceSet::~TopOpeBRepBuild_ShellFaceSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ShellFaceSet {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_WireEdgeSet;
class TopOpeBRepBuild_WireEdgeSet : public TopOpeBRepBuild_ShapeSet {
	public:
		%feature("autodoc", "Args:
	F(TopoDS_Shape)
	Addr(Standard_Address)=NULL

Returns:
	None

Creates a WireEdgeSet to build edges connected by vertices  
on face F. Edges of the WireEdgeSet must have a representation  
on surface of face F.") TopOpeBRepBuild_WireEdgeSet;
		 TopOpeBRepBuild_WireEdgeSet (const TopoDS_Shape & F,const Standard_Address Addr = NULL);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

value of field myFace") Face;
		const TopoDS_Face & Face ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual void

No detailed docstring for this function.") AddShape;
		virtual void AddShape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual void

No detailed docstring for this function.") AddStartElement;
		virtual void AddStartElement (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual void

No detailed docstring for this function.") AddElement;
		virtual void AddElement (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)

Returns:
	virtual void

No detailed docstring for this function.") InitNeighbours;
		virtual void InitNeighbours (const TopoDS_Shape & E);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Build the list of neighbour edges of edge myCurrentShape  
Initialize iterator of neighbour edges to edge myCurrentShape") FindNeighbours;
		virtual void FindNeighbours ();
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	V(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

No detailed docstring for this function.") MakeNeighboursList;
		virtual const TopTools_ListOfShape & MakeNeighboursList (const TopoDS_Shape & E,const TopoDS_Shape & V);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	uiso(Standard_Boolean)
	viso(Standard_Boolean)

Returns:
	static void

No detailed docstring for this function.") IsUVISO;
		static void IsUVISO (const TopoDS_Edge & E,const TopoDS_Face & F,Standard_Boolean & uiso,Standard_Boolean & viso);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") DumpSS;
		virtual void DumpSS ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	sb(TCollection_AsciiString)=
	sa(TCollection_AsciiString)=

Returns:
	virtual TCollection_AsciiString

No detailed docstring for this function.") SName;
		virtual TCollection_AsciiString SName (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("autodoc", "Args:
	S(TopTools_ListOfShape)
	sb(TCollection_AsciiString)=
	sa(TCollection_AsciiString)=

Returns:
	virtual TCollection_AsciiString

No detailed docstring for this function.") SName;
		virtual TCollection_AsciiString SName (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	sb(TCollection_AsciiString)=
	sa(TCollection_AsciiString)=

Returns:
	virtual TCollection_AsciiString

No detailed docstring for this function.") SNameori;
		virtual TCollection_AsciiString SNameori (const TopoDS_Shape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
		%feature("autodoc", "Args:
	S(TopTools_ListOfShape)
	sb(TCollection_AsciiString)=
	sa(TCollection_AsciiString)=

Returns:
	virtual TCollection_AsciiString

No detailed docstring for this function.") SNameori;
		virtual TCollection_AsciiString SNameori (const TopTools_ListOfShape & S,const TCollection_AsciiString & sb = "",const TCollection_AsciiString & sa = "");
};


%feature("shadow") TopOpeBRepBuild_WireEdgeSet::~TopOpeBRepBuild_WireEdgeSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_WireEdgeSet {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_EdgeBuilder;
class TopOpeBRepBuild_EdgeBuilder : public TopOpeBRepBuild_Area1dBuilder {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_EdgeBuilder;
		 TopOpeBRepBuild_EdgeBuilder ();
		%feature("autodoc", "Args:
	LS(TopOpeBRepBuild_PaveSet)
	LC(TopOpeBRepBuild_PaveClassifier)
	ForceClass(Standard_Boolean)=Standard_False

Returns:
	None

Creates a EdgeBuilder to find the areas of  
the shapes described by <LS> using the classifier <LC>.") TopOpeBRepBuild_EdgeBuilder;
		 TopOpeBRepBuild_EdgeBuilder (TopOpeBRepBuild_PaveSet & LS,TopOpeBRepBuild_PaveClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("autodoc", "Args:
	LS(TopOpeBRepBuild_LoopSet)
	LC(TopOpeBRepBuild_LoopClassifier)
	ForceClass(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") InitEdgeBuilder;
		void InitEdgeBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitEdge;
		void InitEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextEdge;
		void NextEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitVertex;
		void InitVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreVertex;
		Standard_Boolean MoreVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextVertex;
		void NextVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Vertex;
		const TopoDS_Shape & Vertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
};


%feature("shadow") TopOpeBRepBuild_EdgeBuilder::~TopOpeBRepBuild_EdgeBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_EdgeBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_FaceAreaBuilder;
class TopOpeBRepBuild_FaceAreaBuilder : public TopOpeBRepBuild_Area2dBuilder {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_FaceAreaBuilder;
		 TopOpeBRepBuild_FaceAreaBuilder ();
		%feature("autodoc", "Args:
	LS(TopOpeBRepBuild_LoopSet)
	LC(TopOpeBRepBuild_LoopClassifier)
	ForceClass(Standard_Boolean)=Standard_False

Returns:
	None

Creates a FaceAreaBuilder to build faces on  
the (wires,blocks of edge) of <LS>, using the classifier <LC>.") TopOpeBRepBuild_FaceAreaBuilder;
		 TopOpeBRepBuild_FaceAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("autodoc", "Args:
	LS(TopOpeBRepBuild_LoopSet)
	LC(TopOpeBRepBuild_LoopClassifier)
	ForceClass(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") InitFaceAreaBuilder;
		void InitFaceAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
};


%feature("shadow") TopOpeBRepBuild_FaceAreaBuilder::~TopOpeBRepBuild_FaceAreaBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_FaceAreaBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_ShellFaceClassifier;
class TopOpeBRepBuild_ShellFaceClassifier : public TopOpeBRepBuild_CompositeClassifier {
	public:
		%feature("autodoc", "Args:
	BB(TopOpeBRepBuild_BlockBuilder)

Returns:
	None

Creates a classifier in 3D space, to compare :  
a face with a set of faces  
a shell with a set of faces  
a shell with a shell") TopOpeBRepBuild_ShellFaceClassifier;
		 TopOpeBRepBuild_ShellFaceClassifier (const TopOpeBRepBuild_BlockBuilder & BB);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	B1(TopoDS_Shape)
	B2(TopoDS_Shape)

Returns:
	TopAbs_State

classify shell <B1> with shell <B2>") CompareShapes;
		TopAbs_State CompareShapes (const TopoDS_Shape & B1,const TopoDS_Shape & B2);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)
	S(TopoDS_Shape)

Returns:
	TopAbs_State

classify face <F> with shell <S>") CompareElementToShape;
		TopAbs_State CompareElementToShape (const TopoDS_Shape & F,const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

prepare classification involving shell <S>  
calls ResetElement on first face of <S>") ResetShape;
		void ResetShape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)

Returns:
	None

prepare classification involving face <F>  
define 3D point (later used in Compare()) on first vertex of face <F>.") ResetElement;
		void ResetElement (const TopoDS_Shape & F);
		%feature("autodoc", "Args:
	F(TopoDS_Shape)

Returns:
	Standard_Boolean

Add the face <F> in the set of faces used in 3D point  
classification. Returns FALSE if the face <F> has been already  
added to the set of faces, otherwise returns TRUE.") CompareElement;
		Standard_Boolean CompareElement (const TopoDS_Shape & F);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

Returns state of classification of 3D point, defined by  
ResetElement, with the current set of faces, defined by Compare.") State;
		TopAbs_State State ();
};


%feature("shadow") TopOpeBRepBuild_ShellFaceClassifier::~TopOpeBRepBuild_ShellFaceClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_ShellFaceClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_SolidAreaBuilder;
class TopOpeBRepBuild_SolidAreaBuilder : public TopOpeBRepBuild_Area3dBuilder {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRepBuild_SolidAreaBuilder;
		 TopOpeBRepBuild_SolidAreaBuilder ();
		%feature("autodoc", "Args:
	LS(TopOpeBRepBuild_LoopSet)
	LC(TopOpeBRepBuild_LoopClassifier)
	ForceClass(Standard_Boolean)=Standard_False

Returns:
	None

Creates a SolidAreaBuilder to build Solids on  
the (shells,blocks of face) of <LS>, using the classifier <LC>.") TopOpeBRepBuild_SolidAreaBuilder;
		 TopOpeBRepBuild_SolidAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
		%feature("autodoc", "Args:
	LS(TopOpeBRepBuild_LoopSet)
	LC(TopOpeBRepBuild_LoopClassifier)
	ForceClass(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") InitSolidAreaBuilder;
		void InitSolidAreaBuilder (TopOpeBRepBuild_LoopSet & LS,TopOpeBRepBuild_LoopClassifier & LC,const Standard_Boolean ForceClass = Standard_False);
};


%feature("shadow") TopOpeBRepBuild_SolidAreaBuilder::~TopOpeBRepBuild_SolidAreaBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_SolidAreaBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRepBuild_WireEdgeClassifier;
class TopOpeBRepBuild_WireEdgeClassifier : public TopOpeBRepBuild_CompositeClassifier {
	public:
		%feature("autodoc", "Args:
	F(TopoDS_Shape)
	BB(TopOpeBRepBuild_BlockBuilder)

Returns:
	None

Creates a classifier on edge <F>.  
Used to compare edges and wires on the edge <F>.") TopOpeBRepBuild_WireEdgeClassifier;
		 TopOpeBRepBuild_WireEdgeClassifier (const TopoDS_Shape & F,const TopOpeBRepBuild_BlockBuilder & BB);
		%feature("autodoc", "Args:
	L1(Handle_TopOpeBRepBuild_Loop)
	L2(Handle_TopOpeBRepBuild_Loop)

Returns:
	virtual TopAbs_State

No detailed docstring for this function.") Compare;
		virtual TopAbs_State Compare (const Handle_TopOpeBRepBuild_Loop & L1,const Handle_TopOpeBRepBuild_Loop & L2);
		%feature("autodoc", "Args:
	L(Handle_TopOpeBRepBuild_Loop)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") LoopToShape;
		TopoDS_Shape LoopToShape (const Handle_TopOpeBRepBuild_Loop & L);
		%feature("autodoc", "Args:
	B1(TopoDS_Shape)
	B2(TopoDS_Shape)

Returns:
	TopAbs_State

classify wire <B1> with wire <B2>") CompareShapes;
		TopAbs_State CompareShapes (const TopoDS_Shape & B1,const TopoDS_Shape & B2);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)
	B(TopoDS_Shape)

Returns:
	TopAbs_State

classify edge <E> with wire <B>") CompareElementToShape;
		TopAbs_State CompareElementToShape (const TopoDS_Shape & E,const TopoDS_Shape & B);
		%feature("autodoc", "Args:
	B(TopoDS_Shape)

Returns:
	None

prepare classification involving wire <B>  
calls ResetElement on first edge of <B>") ResetShape;
		void ResetShape (const TopoDS_Shape & B);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)

Returns:
	None

prepare classification involving edge <E>  
define 2D point (later used in Compare()) on first vertex of edge <E>.") ResetElement;
		void ResetElement (const TopoDS_Shape & E);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)

Returns:
	Standard_Boolean

Add the edge <E> in the set of edges used in 2D point  
classification.") CompareElement;
		Standard_Boolean CompareElement (const TopoDS_Shape & E);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

Returns state of classification of 2D point, defined by  
ResetElement, with the current set of edges, defined by Compare.") State;
		TopAbs_State State ();
};


%feature("shadow") TopOpeBRepBuild_WireEdgeClassifier::~TopOpeBRepBuild_WireEdgeClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRepBuild_WireEdgeClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
