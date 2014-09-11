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
%module (package="OCC") TopOpeBRep

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

%include TopOpeBRep_headers.i

/* typedefs */
typedef TopOpeBRep_EdgesIntersector * TopOpeBRep_PEdgesIntersector;
typedef IntPatch_Point * TopOpeBRep_PThePointOfIntersection;
typedef IntSurf_PntOn2S * TopOpeBRep_PPntOn2S;
typedef TopOpeBRep_FacesFiller * TopOpeBRep_PFacesFiller;
typedef IntRes2d_IntersectionPoint * TopOpeBRep_PIntRes2d_IntersectionPoint;
typedef TopOpeBRep_LineInter * TopOpeBRep_PLineInter;
typedef TopOpeBRep_FacesIntersector * TopOpeBRep_PFacesIntersector;
/* end typedefs declaration */

/* public enums */
enum TopOpeBRep_P2Dstatus {
	TopOpeBRep_P2DUNK = 0,
	TopOpeBRep_P2DINT = 1,
	TopOpeBRep_P2DSGF = 2,
	TopOpeBRep_P2DSGL = 3,
	TopOpeBRep_P2DNEW = 4,
};

enum TopOpeBRep_TypeLineCurve {
	TopOpeBRep_ANALYTIC = 0,
	TopOpeBRep_RESTRICTION = 1,
	TopOpeBRep_WALKING = 2,
	TopOpeBRep_LINE = 3,
	TopOpeBRep_CIRCLE = 4,
	TopOpeBRep_ELLIPSE = 5,
	TopOpeBRep_PARABOLA = 6,
	TopOpeBRep_HYPERBOLA = 7,
	TopOpeBRep_OTHERTYPE = 8,
};

/* end public enums declaration */

%rename(topopebrep) TopOpeBRep;
%nodefaultctor TopOpeBRep;
class TopOpeBRep {
	public:
		%feature("autodoc", "Args:
	TLC(TopOpeBRep_TypeLineCurve)
	OS(Standard_OStream)

Returns:
	static Standard_OStream

Prints the name  of  <TLC>  as  a String  on the  
         Stream <S> and returns <S>.") Print;
		static Standard_OStream & Print (const TopOpeBRep_TypeLineCurve TLC,Standard_OStream & OS);
};


%feature("shadow") TopOpeBRep::~TopOpeBRep %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_Array1OfLineInter;
class TopOpeBRep_Array1OfLineInter {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_Array1OfLineInter;
		 TopOpeBRep_Array1OfLineInter (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(TopOpeBRep_LineInter)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_Array1OfLineInter;
		 TopOpeBRep_Array1OfLineInter (const TopOpeBRep_LineInter & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(TopOpeBRep_LineInter)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopOpeBRep_LineInter & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TopOpeBRep_Array1OfLineInter)

Returns:
	TopOpeBRep_Array1OfLineInter

No detailed docstring for this function.") Assign;
		const TopOpeBRep_Array1OfLineInter & Assign (const TopOpeBRep_Array1OfLineInter & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRep_Array1OfLineInter)

Returns:
	TopOpeBRep_Array1OfLineInter

No detailed docstring for this function.") operator=;
		const TopOpeBRep_Array1OfLineInter & operator = (const TopOpeBRep_Array1OfLineInter & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(TopOpeBRep_LineInter)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TopOpeBRep_LineInter & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopOpeBRep_LineInter

No detailed docstring for this function.") Value;
		const TopOpeBRep_LineInter & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopOpeBRep_LineInter

No detailed docstring for this function.") ChangeValue;
		TopOpeBRep_LineInter & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TopOpeBRep_Array1OfLineInter::~TopOpeBRep_Array1OfLineInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_Array1OfLineInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_Array1OfVPointInter;
class TopOpeBRep_Array1OfVPointInter {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_Array1OfVPointInter;
		 TopOpeBRep_Array1OfVPointInter (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(TopOpeBRep_VPointInter)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_Array1OfVPointInter;
		 TopOpeBRep_Array1OfVPointInter (const TopOpeBRep_VPointInter & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(TopOpeBRep_VPointInter)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopOpeBRep_VPointInter & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TopOpeBRep_Array1OfVPointInter)

Returns:
	TopOpeBRep_Array1OfVPointInter

No detailed docstring for this function.") Assign;
		const TopOpeBRep_Array1OfVPointInter & Assign (const TopOpeBRep_Array1OfVPointInter & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRep_Array1OfVPointInter)

Returns:
	TopOpeBRep_Array1OfVPointInter

No detailed docstring for this function.") operator=;
		const TopOpeBRep_Array1OfVPointInter & operator = (const TopOpeBRep_Array1OfVPointInter & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(TopOpeBRep_VPointInter)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TopOpeBRep_VPointInter & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopOpeBRep_VPointInter

No detailed docstring for this function.") Value;
		const TopOpeBRep_VPointInter & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopOpeBRep_VPointInter

No detailed docstring for this function.") ChangeValue;
		TopOpeBRep_VPointInter & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TopOpeBRep_Array1OfVPointInter::~TopOpeBRep_Array1OfVPointInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_Array1OfVPointInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_Bipoint;
class TopOpeBRep_Bipoint {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_Bipoint;
		 TopOpeBRep_Bipoint ();
		%feature("autodoc", "Args:
	I1(Standard_Integer)
	I2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_Bipoint;
		 TopOpeBRep_Bipoint (const Standard_Integer I1,const Standard_Integer I2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") I1;
		Standard_Integer I1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") I2;
		Standard_Integer I2 ();
};


%feature("shadow") TopOpeBRep_Bipoint::~TopOpeBRep_Bipoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_Bipoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_DSFiller;
class TopOpeBRep_DSFiller {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_DSFiller;
		 TopOpeBRep_DSFiller ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_PShapeClassifier

return field myPShapeClassifier.  set field myPShapeClassifier.") PShapeClassifier;
		TopOpeBRepTool_PShapeClassifier PShapeClassifier ();
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	HDS(Handle_TopOpeBRepDS_HDataStructure)
	orientFORWARD(Standard_Boolean)=Standard_True

Returns:
	None

Stores in <DS> the intersections of <S1> and <S2>.  
         if orientFORWARD = True  
              S FORWARD,REVERSED   --> FORWARD  
              S EXTERNAL,INTERNAL --> EXTERNAL,INTERNAL") Insert;
		void Insert (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Handle_TopOpeBRepDS_HDataStructure & HDS,const Standard_Boolean orientFORWARD = Standard_True);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	HDS(Handle_TopOpeBRepDS_HDataStructure)
	orientFORWARD(Standard_Boolean)=Standard_True

Returns:
	None

Stores in <DS> the intersections of <S1> and <S2>.  
         if orientFORWARD = True  
              S FORWAR,REVERSED   --> FORWARD  
              S EXTERNAL,INTERNAL --> EXTERNAL,INTERNAL") InsertIntersection;
		void InsertIntersection (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Handle_TopOpeBRepDS_HDataStructure & HDS,const Standard_Boolean orientFORWARD = Standard_True);
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") Complete;
		void Complete (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

Stores in <DS> the intersections of <S1> and <S2>.  
         S1 et S2 contain only SameDomain Face") Insert2d;
		void Insert2d (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

S1, S2 set of tangent face  
         lance les intersections 2d pour coder correctement  
         les faces SameDomain.") InsertIntersection2d;
		void InsertIntersection2d (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMadeOf1d;
		Standard_Boolean IsMadeOf1d (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsContext1d;
		Standard_Boolean IsContext1d (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	F1(TopoDS_Face)
	F2(TopoDS_Face)
	HDS(Handle_TopOpeBRepDS_HDataStructure)
	orientFORWARD(Standard_Boolean)=Standard_False

Returns:
	None

Stores in <DS> the intersections of <S1> and <S2>.  
         S1 and S2 are edges or wires.  
         S1 edges have a 2d representation in face F1  
         S2 edges have a 2d representation in face F2  
         F1 is the face which surface is taken as reference  
         for 2d description of S1 and S2 edges.  
         if orientFORWARD = True  
              S FORWARD,REVERSED  --> FORWARD  
              S EXTERNAL,INTERNAL --> EXTERNAL,INTERNAL") Insert1d;
		void Insert1d (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const TopoDS_Face & F1,const TopoDS_Face & F2,const Handle_TopOpeBRepDS_HDataStructure & HDS,const Standard_Boolean orientFORWARD = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_ShapeIntersector

No detailed docstring for this function.") ChangeShapeIntersector;
		TopOpeBRep_ShapeIntersector & ChangeShapeIntersector ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_ShapeIntersector2d

No detailed docstring for this function.") ChangeShapeIntersector2d;
		TopOpeBRep_ShapeIntersector2d & ChangeShapeIntersector2d ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_FacesFiller

No detailed docstring for this function.") ChangeFacesFiller;
		TopOpeBRep_FacesFiller & ChangeFacesFiller ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_EdgesFiller

No detailed docstring for this function.") ChangeEdgesFiller;
		TopOpeBRep_EdgesFiller & ChangeEdgesFiller ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_FaceEdgeFiller

No detailed docstring for this function.") ChangeFaceEdgeFiller;
		TopOpeBRep_FaceEdgeFiller & ChangeFaceEdgeFiller ();
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") GapFiller;
		void GapFiller (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

Update   the  data      structure  with   relevant  
         informations deduced from the intersections.  
 
         Shells containing an intersected face.  
         Wires  containing an intersected edge.") CompleteDS;
		void CompleteDS (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") Filter;
		void Filter (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") Reducer;
		void Reducer (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") RemoveUnsharedGeometry;
		void RemoveUnsharedGeometry (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") Checker;
		void Checker (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

Update   the  data      structure  with   relevant  
         informations deduced from the intersections 2d.  
 
         Shells containing an intersected face.  
         Wires  containing an intersected edge.  
 search for interference identity using edge connexity //NYI") CompleteDS2d;
		void CompleteDS2d (const Handle_TopOpeBRepDS_HDataStructure & HDS);
};


%feature("shadow") TopOpeBRep_DSFiller::~TopOpeBRep_DSFiller %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_DSFiller {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_DataMapIteratorOfDataMapOfTopolTool;
class TopOpeBRep_DataMapIteratorOfDataMapOfTopolTool : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_DataMapIteratorOfDataMapOfTopolTool;
		 TopOpeBRep_DataMapIteratorOfDataMapOfTopolTool ();
		%feature("autodoc", "Args:
	aMap(TopOpeBRep_DataMapOfTopolTool)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_DataMapIteratorOfDataMapOfTopolTool;
		 TopOpeBRep_DataMapIteratorOfDataMapOfTopolTool (const TopOpeBRep_DataMapOfTopolTool & aMap);
		%feature("autodoc", "Args:
	aMap(TopOpeBRep_DataMapOfTopolTool)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRep_DataMapOfTopolTool & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepTopAdaptor_TopolTool

No detailed docstring for this function.") Value;
		const Handle_BRepTopAdaptor_TopolTool & Value ();
};


%feature("shadow") TopOpeBRep_DataMapIteratorOfDataMapOfTopolTool::~TopOpeBRep_DataMapIteratorOfDataMapOfTopolTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_DataMapIteratorOfDataMapOfTopolTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_DataMapNodeOfDataMapOfTopolTool;
class TopOpeBRep_DataMapNodeOfDataMapOfTopolTool : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Handle_BRepTopAdaptor_TopolTool)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_DataMapNodeOfDataMapOfTopolTool;
		 TopOpeBRep_DataMapNodeOfDataMapOfTopolTool (const TopoDS_Shape & K,const Handle_BRepTopAdaptor_TopolTool & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepTopAdaptor_TopolTool

No detailed docstring for this function.") Value;
		Handle_BRepTopAdaptor_TopolTool & Value ();
};


%feature("shadow") TopOpeBRep_DataMapNodeOfDataMapOfTopolTool::~TopOpeBRep_DataMapNodeOfDataMapOfTopolTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_DataMapNodeOfDataMapOfTopolTool {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRep_DataMapNodeOfDataMapOfTopolTool {
	Handle_TopOpeBRep_DataMapNodeOfDataMapOfTopolTool GetHandle() {
	return *(Handle_TopOpeBRep_DataMapNodeOfDataMapOfTopolTool*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRep_DataMapNodeOfDataMapOfTopolTool;
class Handle_TopOpeBRep_DataMapNodeOfDataMapOfTopolTool : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRep_DataMapNodeOfDataMapOfTopolTool();
        Handle_TopOpeBRep_DataMapNodeOfDataMapOfTopolTool(const Handle_TopOpeBRep_DataMapNodeOfDataMapOfTopolTool &aHandle);
        Handle_TopOpeBRep_DataMapNodeOfDataMapOfTopolTool(const TopOpeBRep_DataMapNodeOfDataMapOfTopolTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRep_DataMapNodeOfDataMapOfTopolTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRep_DataMapNodeOfDataMapOfTopolTool {
    TopOpeBRep_DataMapNodeOfDataMapOfTopolTool* GetObject() {
    return (TopOpeBRep_DataMapNodeOfDataMapOfTopolTool*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRep_DataMapNodeOfDataMapOfTopolTool::~Handle_TopOpeBRep_DataMapNodeOfDataMapOfTopolTool %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRep_DataMapNodeOfDataMapOfTopolTool {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRep_DataMapOfTopolTool;
class TopOpeBRep_DataMapOfTopolTool : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_DataMapOfTopolTool;
		 TopOpeBRep_DataMapOfTopolTool (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopOpeBRep_DataMapOfTopolTool)

Returns:
	TopOpeBRep_DataMapOfTopolTool

No detailed docstring for this function.") Assign;
		TopOpeBRep_DataMapOfTopolTool & Assign (const TopOpeBRep_DataMapOfTopolTool & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRep_DataMapOfTopolTool)

Returns:
	TopOpeBRep_DataMapOfTopolTool

No detailed docstring for this function.") operator=;
		TopOpeBRep_DataMapOfTopolTool & operator = (const TopOpeBRep_DataMapOfTopolTool & Other);
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
	I(Handle_BRepTopAdaptor_TopolTool)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Handle_BRepTopAdaptor_TopolTool & I);
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
	Handle_BRepTopAdaptor_TopolTool

No detailed docstring for this function.") Find;
		const Handle_BRepTopAdaptor_TopolTool & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Handle_BRepTopAdaptor_TopolTool

No detailed docstring for this function.") ChangeFind;
		Handle_BRepTopAdaptor_TopolTool & ChangeFind (const TopoDS_Shape & K);
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


%feature("shadow") TopOpeBRep_DataMapOfTopolTool::~TopOpeBRep_DataMapOfTopolTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_DataMapOfTopolTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_EdgesFiller;
class TopOpeBRep_EdgesFiller {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_EdgesFiller;
		 TopOpeBRep_EdgesFiller ();
		%feature("autodoc", "Args:
	E1(TopoDS_Shape)
	E2(TopoDS_Shape)
	EI(TopOpeBRep_EdgesIntersector)
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") Insert;
		void Insert (const TopoDS_Shape & E1,const TopoDS_Shape & E2,TopOpeBRep_EdgesIntersector & EI,const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	F(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Face;
		void Face (const Standard_Integer I,const TopoDS_Shape & F);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Face;
		const TopoDS_Shape & Face (const Standard_Integer I);
};


%feature("shadow") TopOpeBRep_EdgesFiller::~TopOpeBRep_EdgesFiller %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_EdgesFiller {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_EdgesIntersector;
class TopOpeBRep_EdgesIntersector {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_EdgesIntersector;
		 TopOpeBRep_EdgesIntersector ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	F1(TopoDS_Shape)
	F2(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetFaces;
		void SetFaces (const TopoDS_Shape & F1,const TopoDS_Shape & F2);
		%feature("autodoc", "Args:
	F1(TopoDS_Shape)
	F2(TopoDS_Shape)
	B1(Bnd_Box)
	B2(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") SetFaces;
		void SetFaces (const TopoDS_Shape & F1,const TopoDS_Shape & F2,const Bnd_Box & B1,const Bnd_Box & B2);
		%feature("autodoc", "Args:
	Tol1(Standard_Real)
	Tol2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ForceTolerances;
		void ForceTolerances (const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "Args:
	D(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Dimension;
		void Dimension (const Standard_Integer D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

set working space dimension D = 1 for E &|| W, 2 for E in F") Dimension;
		Standard_Integer Dimension ();
		%feature("autodoc", "Args:
	E1(TopoDS_Shape)
	E2(TopoDS_Shape)
	ReduceSegments(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopoDS_Shape & E1,const TopoDS_Shape & E2,const Standard_Boolean ReduceSegments = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

true if at least one intersection segment.") HasSegment;
		Standard_Boolean HasSegment ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

= mySameDomain.") SameDomain;
		Standard_Boolean SameDomain ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Edge;
		const TopoDS_Shape & Edge (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Geom2dAdaptor_Curve

No detailed docstring for this function.") Curve;
		const Geom2dAdaptor_Curve & Curve (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Face;
		const TopoDS_Shape & Face (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepAdaptor_Surface

No detailed docstring for this function.") Surface;
		const BRepAdaptor_Surface & Surface (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") SurfacesSameOriented;
		Standard_Boolean SurfacesSameOriented ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") FacesSameOriented;
		Standard_Boolean FacesSameOriented ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ToleranceMax;
		Standard_Real ToleranceMax ();
		%feature("autodoc", "Args:
	tol1(Standard_Real)
	tol2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Tolerances;
		void Tolerances (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "Args:
	str(TCollection_AsciiString)
	ie1(Standard_Integer)=0
	ie2(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump (const TCollection_AsciiString & str,const Standard_Integer ie1 = 0,const Standard_Integer ie2 = 0);
		%feature("autodoc", "Args:
	selectkeep(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") InitPoint;
		void InitPoint (const Standard_Boolean selectkeep = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MorePoint;
		Standard_Boolean MorePoint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextPoint;
		void NextPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_SequenceOfPoint2d

No detailed docstring for this function.") Points;
		const TopOpeBRep_SequenceOfPoint2d & Points ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_Point2d

No detailed docstring for this function.") Point;
		const TopOpeBRep_Point2d & Point ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRep_Point2d

No detailed docstring for this function.") Point;
		const TopOpeBRep_Point2d & Point (const Standard_Integer I);
		%feature("autodoc", "Args:
	P1(TopOpeBRep_Point2d)
	P2(TopOpeBRep_Point2d)
	Pn(TopOpeBRep_Point2d)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") ReduceSegment;
		virtual Standard_Boolean ReduceSegment (TopOpeBRep_Point2d & P1,TopOpeBRep_Point2d & P2,TopOpeBRep_Point2d & Pn);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_P2Dstatus

No detailed docstring for this function.") Status1;
		TopOpeBRep_P2Dstatus Status1 ();
};


%feature("shadow") TopOpeBRep_EdgesIntersector::~TopOpeBRep_EdgesIntersector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_EdgesIntersector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_FFDumper;
class TopOpeBRep_FFDumper : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	PFF(TopOpeBRep_PFacesFiller)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_FFDumper;
		 TopOpeBRep_FFDumper (const TopOpeBRep_PFacesFiller & PFF);
		%feature("autodoc", "Args:
	PFF(TopOpeBRep_PFacesFiller)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopOpeBRep_PFacesFiller & PFF);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") DumpLine;
		void DumpLine (const Standard_Integer I);
		%feature("autodoc", "Args:
	L(TopOpeBRep_LineInter)

Returns:
	None

No detailed docstring for this function.") DumpLine;
		void DumpLine (const TopOpeBRep_LineInter & L);
		%feature("autodoc", "Args:
	VP(TopOpeBRep_VPointInter)

Returns:
	None

No detailed docstring for this function.") DumpVP;
		void DumpVP (const TopOpeBRep_VPointInter & VP);
		%feature("autodoc", "Args:
	VP(TopOpeBRep_VPointInter)
	ISI(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") DumpVP;
		void DumpVP (const TopOpeBRep_VPointInter & VP,const Standard_Integer ISI);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	ISI(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") ExploreIndex;
		Standard_Integer ExploreIndex (const TopoDS_Shape & S,const Standard_Integer ISI);
		%feature("autodoc", "Args:
	VP(TopOpeBRep_VPointInter)
	GK(TopOpeBRepDS_Kind)
	G(Standard_Integer)
	newinDS(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") DumpDSP;
		void DumpDSP (const TopOpeBRep_VPointInter & VP,const TopOpeBRepDS_Kind GK,const Standard_Integer G,const Standard_Boolean newinDS);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_PFacesFiller

No detailed docstring for this function.") PFacesFillerDummy;
		TopOpeBRep_PFacesFiller PFacesFillerDummy ();
};


%feature("shadow") TopOpeBRep_FFDumper::~TopOpeBRep_FFDumper %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_FFDumper {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRep_FFDumper {
	Handle_TopOpeBRep_FFDumper GetHandle() {
	return *(Handle_TopOpeBRep_FFDumper*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRep_FFDumper;
class Handle_TopOpeBRep_FFDumper : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopOpeBRep_FFDumper();
        Handle_TopOpeBRep_FFDumper(const Handle_TopOpeBRep_FFDumper &aHandle);
        Handle_TopOpeBRep_FFDumper(const TopOpeBRep_FFDumper *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRep_FFDumper DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRep_FFDumper {
    TopOpeBRep_FFDumper* GetObject() {
    return (TopOpeBRep_FFDumper*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRep_FFDumper::~Handle_TopOpeBRep_FFDumper %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRep_FFDumper {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRep_FFTransitionTool;
class TopOpeBRep_FFTransitionTool {
	public:
		%feature("autodoc", "Args:
	P(TopOpeBRep_VPointInter)
	Index(Standard_Integer)
	EdgeOrientation(TopAbs_Orientation)

Returns:
	static TopOpeBRepDS_Transition

No detailed docstring for this function.") ProcessLineTransition;
		static TopOpeBRepDS_Transition ProcessLineTransition (const TopOpeBRep_VPointInter & P,const Standard_Integer Index,const TopAbs_Orientation EdgeOrientation);
		%feature("autodoc", "Args:
	P(TopOpeBRep_VPointInter)
	L(TopOpeBRep_LineInter)

Returns:
	static TopOpeBRepDS_Transition

No detailed docstring for this function.") ProcessLineTransition;
		static TopOpeBRepDS_Transition ProcessLineTransition (const TopOpeBRep_VPointInter & P,const TopOpeBRep_LineInter & L);
		%feature("autodoc", "Args:
	P(TopOpeBRep_VPointInter)
	Index(Standard_Integer)
	LineOrientation(TopAbs_Orientation)

Returns:
	static TopOpeBRepDS_Transition

No detailed docstring for this function.") ProcessEdgeTransition;
		static TopOpeBRepDS_Transition ProcessEdgeTransition (const TopOpeBRep_VPointInter & P,const Standard_Integer Index,const TopAbs_Orientation LineOrientation);
		%feature("autodoc", "Args:
	L(TopOpeBRep_LineInter)
	Index(Standard_Integer)
	FaceOrientation(TopAbs_Orientation)

Returns:
	static TopOpeBRepDS_Transition

No detailed docstring for this function.") ProcessFaceTransition;
		static TopOpeBRepDS_Transition ProcessFaceTransition (const TopOpeBRep_LineInter & L,const Standard_Integer Index,const TopAbs_Orientation FaceOrientation);
		%feature("autodoc", "Args:
	VP(TopOpeBRep_VPointInter)
	Index(Standard_Integer)
	R(TopoDS_Shape)
	E(TopoDS_Shape)
	F(TopoDS_Shape)

Returns:
	static TopOpeBRepDS_Transition

compute transition on 'IntPatch_Restriction line' edge <R>  
when crossing edge <E> of face <F> at point <VP>.  
VP is given on edge <E> of face <F> of index <Index> (1 or 2).  
<VP> has been classified by FacesFiller as TopAbs_ON an edge <R>  
of the other face than <F> of current (face/face) intersection.  
Transition depends on the orientation of E in F.  
This method should be provided by IntPatch_Line (NYI)") ProcessEdgeONTransition;
		static TopOpeBRepDS_Transition ProcessEdgeONTransition (const TopOpeBRep_VPointInter & VP,const Standard_Integer Index,const TopoDS_Shape & R,const TopoDS_Shape & E,const TopoDS_Shape & F);
};


%feature("shadow") TopOpeBRep_FFTransitionTool::~TopOpeBRep_FFTransitionTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_FFTransitionTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_FaceEdgeFiller;
class TopOpeBRep_FaceEdgeFiller {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_FaceEdgeFiller;
		 TopOpeBRep_FaceEdgeFiller ();
		%feature("autodoc", "Args:
	F(TopoDS_Shape)
	E(TopoDS_Shape)
	FEINT(TopOpeBRep_FaceEdgeIntersector)
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

No detailed docstring for this function.") Insert;
		void Insert (const TopoDS_Shape & F,const TopoDS_Shape & E,TopOpeBRep_FaceEdgeIntersector & FEINT,const Handle_TopOpeBRepDS_HDataStructure & HDS);
};


%feature("shadow") TopOpeBRep_FaceEdgeFiller::~TopOpeBRep_FaceEdgeFiller %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_FaceEdgeFiller {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_FaceEdgeIntersector;
class TopOpeBRep_FaceEdgeIntersector {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_FaceEdgeIntersector;
		 TopOpeBRep_FaceEdgeIntersector ();
		%feature("autodoc", "Args:
	F(TopoDS_Shape)
	E(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopoDS_Shape & F,const TopoDS_Shape & E);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

returns intersected face or edge according to  
         value of <Index> = 1 or 2") Shape;
		const TopoDS_Shape & Shape (const Standard_Integer Index);
		%feature("autodoc", "Args:
	tol(Standard_Real)

Returns:
	None

Force the tolerance values used by the next Perform(S1,S2) call.") ForceTolerance;
		void ForceTolerance (const Standard_Real tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Return the tolerance value used in the last Perform() call  
If ForceTolerance() has been called, return the given value.  
If not, return value extracted from shapes.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitPoint;
		void InitPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MorePoint;
		Standard_Boolean MorePoint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextPoint;
		void NextPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

return the 3D point of the current intersection point.") Value;
		gp_Pnt Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

parametre de Value() sur l'arete") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

parametre de Value() sur la face") UVPoint;
		void UVPoint (gp_Pnt2d & P);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

IN ou ON / a la face. Les points OUT ne sont pas retournes.") State;
		TopAbs_State State ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	FaceOrientation(TopAbs_Orientation)

Returns:
	TopOpeBRepDS_Transition

Index = 1 transition par rapport a la face, en cheminant sur l'arete") Transition;
		TopOpeBRepDS_Transition Transition (const Standard_Integer Index,const TopAbs_Orientation FaceOrientation);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	P(gp_Pnt)
	Tol(Standard_Real)
	V(TopoDS_Vertex)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVertex;
		Standard_Boolean IsVertex (const TopoDS_Shape & S,const gp_Pnt & P,const Standard_Real Tol,TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	V(TopoDS_Vertex)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVertex;
		Standard_Boolean IsVertex (const Standard_Integer I,TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

trace only") Index;
		Standard_Integer Index ();
};


%feature("shadow") TopOpeBRep_FaceEdgeIntersector::~TopOpeBRep_FaceEdgeIntersector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_FaceEdgeIntersector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_FacesFiller;
class TopOpeBRep_FacesFiller {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_FacesFiller;
		 TopOpeBRep_FacesFiller ();
		%feature("autodoc", "Args:
	F1(TopoDS_Shape)
	F2(TopoDS_Shape)
	FACINT(TopOpeBRep_FacesIntersector)
	HDS(Handle_TopOpeBRepDS_HDataStructure)

Returns:
	None

Stores in <DS> the intersections of <S1> and <S2>.") Insert;
		void Insert (const TopoDS_Shape & F1,const TopoDS_Shape & F2,TopOpeBRep_FacesIntersector & FACINT,const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ProcessSectionEdges;
		void ProcessSectionEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_PointClassifier

No detailed docstring for this function.") ChangePointClassifier;
		TopOpeBRep_PointClassifier & ChangePointClassifier ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_PShapeClassifier

return field myPShapeClassifier.") PShapeClassifier;
		TopOpeBRepTool_PShapeClassifier PShapeClassifier ();
		%feature("autodoc", "Args:
	PSC(TopOpeBRepTool_PShapeClassifier)

Returns:
	None

set field myPShapeClassifier.") SetPShapeClassifier;
		void SetPShapeClassifier (const TopOpeBRepTool_PShapeClassifier & PSC);
		%feature("autodoc", "Args:
	L(TopOpeBRep_LineInter)

Returns:
	None

No detailed docstring for this function.") LoadLine;
		void LoadLine (TopOpeBRep_LineInter & L);
		%feature("autodoc", "Args:
	L(TopOpeBRep_LineInter)

Returns:
	Standard_Boolean

No detailed docstring for this function.") CheckLine;
		Standard_Boolean CheckLine (TopOpeBRep_LineInter & L);
		%feature("autodoc", "Args:
	FACINT(TopOpeBRep_FacesIntersector)

Returns:
	None

compute position of VPoints of lines") VP_Position;
		void VP_Position (TopOpeBRep_FacesIntersector & FACINT);
		%feature("autodoc", "Args:
	L(TopOpeBRep_LineInter)

Returns:
	None

compute position of VPoints of line L") VP_Position;
		void VP_Position (TopOpeBRep_LineInter & L);
		%feature("autodoc", "Args:
	L(TopOpeBRep_LineInter)

Returns:
	None

compute position of VPoints of non-restriction line L.") VP_PositionOnL;
		void VP_PositionOnL (TopOpeBRep_LineInter & L);
		%feature("autodoc", "Args:
	L(TopOpeBRep_LineInter)

Returns:
	None

compute position of VPoints of restriction line L.") VP_PositionOnR;
		void VP_PositionOnR (TopOpeBRep_LineInter & L);
		%feature("autodoc", "Args:
	VP(TopOpeBRep_VPointInter)
	VPC(TopOpeBRep_VPointInterClassifier)

Returns:
	None

compute position of VP with current faces,  
         according to VP.ShapeIndex() .") VP_Position;
		void VP_Position (TopOpeBRep_VPointInter & VP,TopOpeBRep_VPointInterClassifier & VPC);
		%feature("autodoc", "Args:
	None
Returns:
	None

Process current intersection line (set by LoadLine)") ProcessLine;
		void ProcessLine ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ResetDSC;
		void ResetDSC ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Process current restriction line, adding restriction edge  
         and computing face/edge interference.") ProcessRLine;
		void ProcessRLine ();
		%feature("autodoc", "Args:
	None
Returns:
	None

VP processing for restriction  line  and line sharing  
          same domain with  section edges :  
           - if restriction :  
           Adds restriction edges as  section edges and compute  
          face/edge  interference.  
           - if  same domain :  
           If line share same domain  with section edges, compute  
          parts of line IN/IN the two faces, and compute curve/point  
          interference for VP boundaries.") FillLineVPonR;
		void FillLineVPonR ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") FillLine;
		void FillLine ();
		%feature("autodoc", "Args:
	None
Returns:
	None

compute 3d curve, pcurves and face/curve interferences  
         for current NDSC. Add them to the DS.") AddShapesLine;
		void AddShapesLine ();
		%feature("autodoc", "Args:
	LES(TopTools_ListOfShape)

Returns:
	None

Get map <mapES > of restriction edges having parts IN one  
         of the 2 faces.") GetESL;
		void GetESL (TopTools_ListOfShape & LES);
		%feature("autodoc", "Args:
	FF(TopOpeBRep_FacesFiller)
	VP(TopOpeBRep_VPointInter)

Returns:
	None

calling the followings ProcessVPIonR and ProcessVPonR.") ProcessVPR;
		void ProcessVPR (TopOpeBRep_FacesFiller & FF,const TopOpeBRep_VPointInter & VP);
		%feature("autodoc", "Args:
	VPI(TopOpeBRep_VPointInterIterator)
	trans1(TopOpeBRepDS_Transition)
	F1(TopoDS_Shape)
	ShapeIndex(Standard_Integer)

Returns:
	None

processing ProcessVPonR for VPI.") ProcessVPIonR;
		void ProcessVPIonR (TopOpeBRep_VPointInterIterator & VPI,const TopOpeBRepDS_Transition & trans1,const TopoDS_Shape & F1,const Standard_Integer ShapeIndex);
		%feature("autodoc", "Args:
	VP(TopOpeBRep_VPointInter)
	trans1(TopOpeBRepDS_Transition)
	F1(TopoDS_Shape)
	ShapeIndex(Standard_Integer)

Returns:
	None

adds <VP>'s   geometric   point (if not   stored)  and  
         computes (curve or edge)/(point or vertex) interference.") ProcessVPonR;
		void ProcessVPonR (const TopOpeBRep_VPointInter & VP,const TopOpeBRepDS_Transition & trans1,const TopoDS_Shape & F1,const Standard_Integer ShapeIndex);
		%feature("autodoc", "Args:
	VP(TopOpeBRep_VPointInter)
	F1(TopoDS_Shape)
	ShapeIndex(Standard_Integer)
	transEdge(TopOpeBRepDS_Transition)
	PVKind(TopOpeBRepDS_Kind)
	PVIndex(Standard_Integer)
	EPIfound(Standard_Boolean)
	IEPI(Handle_TopOpeBRepDS_Interference)

Returns:
	None

VP processing on closing arc.") ProcessVPonclosingR;
		void ProcessVPonclosingR (const TopOpeBRep_VPointInter & VP,const TopoDS_Shape & F1,const Standard_Integer ShapeIndex,const TopOpeBRepDS_Transition & transEdge,const TopOpeBRepDS_Kind PVKind,const Standard_Integer PVIndex,const Standard_Boolean EPIfound,const Handle_TopOpeBRepDS_Interference & IEPI);
		%feature("autodoc", "Args:
	VP(TopOpeBRep_VPointInter)
	ShapeIndex(Standard_Integer)
	PVKind(TopOpeBRepDS_Kind)
	PVIndex(Standard_Integer)
	EPIfound(Standard_Boolean)
	IEPI(Handle_TopOpeBRepDS_Interference)
	CPIfound(Standard_Boolean)
	ICPI(Handle_TopOpeBRepDS_Interference)

Returns:
	Standard_Boolean

VP processing on degenerated arc.") ProcessVPondgE;
		Standard_Boolean ProcessVPondgE (const TopOpeBRep_VPointInter & VP,const Standard_Integer ShapeIndex,TopOpeBRepDS_Kind & PVKind,Standard_Integer &OutValue,Standard_Boolean & EPIfound,Handle_TopOpeBRepDS_Interference & IEPI,Standard_Boolean & CPIfound,Handle_TopOpeBRepDS_Interference & ICPI);
		%feature("autodoc", "Args:
	VPI(TopOpeBRep_VPointInterIterator)

Returns:
	None

processing ProcessVPnotonR for VPI.") ProcessVPInotonR;
		void ProcessVPInotonR (TopOpeBRep_VPointInterIterator & VPI);
		%feature("autodoc", "Args:
	VP(TopOpeBRep_VPointInter)

Returns:
	None

adds <VP>'s  geometrical point to the DS (if not stored)  
         and computes curve point interference.") ProcessVPnotonR;
		void ProcessVPnotonR (const TopOpeBRep_VPointInter & VP);
		%feature("autodoc", "Args:
	IT(TopOpeBRepDS_ListIteratorOfListOfInterference)
	VP(TopOpeBRep_VPointInter)
	G(Standard_Integer)
	K(TopOpeBRepDS_Kind)

Returns:
	Standard_Boolean

Get the geometry of a DS point <DSP>.  
Search for it with ScanInterfList (previous method).  
if found, set <G> to the geometry of the interference found.  
else, add the point <DSP> in the <DS> and set <G> to the  
value of the new geometry such created.  
returns the value of ScanInterfList().") GetGeometry;
		Standard_Boolean GetGeometry (TopOpeBRepDS_ListIteratorOfListOfInterference & IT,const TopOpeBRep_VPointInter & VP,Standard_Integer &OutValue,TopOpeBRepDS_Kind & K);
		%feature("autodoc", "Args:
	VP(TopOpeBRep_VPointInter)
	ShapeIndex(Standard_Integer)
	K(TopOpeBRepDS_Kind)

Returns:
	Standard_Integer

No detailed docstring for this function.") MakeGeometry;
		Standard_Integer MakeGeometry (const TopOpeBRep_VPointInter & VP,const Standard_Integer ShapeIndex,TopOpeBRepDS_Kind & K);
		%feature("autodoc", "Args:
	I(Handle_TopOpeBRepDS_Interference)

Returns:
	None

Add interference <I> to list myDSCIL.  
on a given line, at first call, add a new DS curve.") StoreCurveInterference;
		void StoreCurveInterference (const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "Args:
	DSP(TopOpeBRepDS_Point)
	K(TopOpeBRepDS_Kind)
	G(Standard_Integer)

Returns:
	Standard_Boolean

search for G = geometry of Point which is identical to <DSP>  
         among the DS Points created in the CURRENT face/face  
         intersection ( current Insert() call).") GetFFGeometry;
		Standard_Boolean GetFFGeometry (const TopOpeBRepDS_Point & DSP,TopOpeBRepDS_Kind & K,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	VP(TopOpeBRep_VPointInter)
	K(TopOpeBRepDS_Kind)
	G(Standard_Integer)

Returns:
	Standard_Boolean

search for G = geometry of Point which is identical to <VP>  
         among the DS Points created in the CURRENT face/face  
         intersection ( current Insert() call).") GetFFGeometry;
		Standard_Boolean GetFFGeometry (const TopOpeBRep_VPointInter & VP,TopOpeBRepDS_Kind & K,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_FacesIntersector

No detailed docstring for this function.") ChangeFacesIntersector;
		TopOpeBRep_FacesIntersector & ChangeFacesIntersector ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRepDS_HDataStructure

No detailed docstring for this function.") HDataStructure;
		Handle_TopOpeBRepDS_HDataStructure HDataStructure ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_DataStructure

No detailed docstring for this function.") ChangeDataStructure;
		TopOpeBRepDS_DataStructure & ChangeDataStructure ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Face

No detailed docstring for this function.") Face;
		const TopoDS_Face & Face (const Standard_Integer I);
		%feature("autodoc", "Args:
	L(TopOpeBRep_LineInter)
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Transition

No detailed docstring for this function.") FaceFaceTransition;
		const TopOpeBRepDS_Transition & FaceFaceTransition (const TopOpeBRep_LineInter & L,const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Transition

No detailed docstring for this function.") FaceFaceTransition;
		const TopOpeBRepDS_Transition & FaceFaceTransition (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_PFacesIntersector

No detailed docstring for this function.") PFacesIntersectorDummy;
		TopOpeBRep_PFacesIntersector PFacesIntersectorDummy ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_PDataStructure

No detailed docstring for this function.") PDataStructureDummy;
		TopOpeBRepDS_PDataStructure PDataStructureDummy ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_PLineInter

No detailed docstring for this function.") PLineInterDummy;
		TopOpeBRep_PLineInter PLineInterDummy ();
		%feature("autodoc", "Args:
	exF1(Standard_Integer)
	exF2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetTraceIndex;
		void SetTraceIndex (const Standard_Integer exF1,const Standard_Integer exF2);
		%feature("autodoc", "Args:
	exF1(Standard_Integer)
	exF2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GetTraceIndex;
		void GetTraceIndex (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	L(TopOpeBRep_LineInter)
	pmin(Standard_Real)
	pmax(Standard_Real)

Returns:
	static void

Computes <pmin> and <pmax> the upper and lower bounds of <L>  
         enclosing all vpoints.") Lminmax;
		static void Lminmax (const TopOpeBRep_LineInter & L,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	L(TopOpeBRep_LineInter)
	ERL(TopTools_ListOfShape)

Returns:
	static Standard_Boolean

Returns <True> if <L> shares a same geometric domain with  
         at least one of the section edges of <ERL>.") LSameDomainERL;
		static Standard_Boolean LSameDomainERL (const TopOpeBRep_LineInter & L,const TopTools_ListOfShape & ERL);
		%feature("autodoc", "Args:
	L(TopOpeBRep_LineInter)
	iVP(Standard_Integer)
	SI12(Standard_Integer)
	T(TopOpeBRepDS_Transition)

Returns:
	static Standard_Boolean

Computes the transition <T> of the VPoint <iVP> on the edge  
         of <SI12>. Returns <False> if the status is unknown.") IsVPtransLok;
		static Standard_Boolean IsVPtransLok (const TopOpeBRep_LineInter & L,const Standard_Integer iVP,const Standard_Integer SI12,TopOpeBRepDS_Transition & T);
		%feature("autodoc", "Args:
	L(TopOpeBRep_LineInter)
	iVP(Standard_Integer)
	SI(Standard_Integer)
	isINOUT(Standard_Boolean)

Returns:
	static Standard_Boolean

Computes   transition   on line for  VP<iVP>   on edge  
         restriction of <SI>.  If <isINOUT>  :  returns <true> if  
         transition computed is IN/OUT else : returns <true> if  
         transition computed is OUT/IN.") TransvpOK;
		static Standard_Boolean TransvpOK (const TopOpeBRep_LineInter & L,const Standard_Integer iVP,const Standard_Integer SI,const Standard_Boolean isINOUT);
		%feature("autodoc", "Args:
	vp(TopOpeBRep_VPointInter)
	Lrest(TopOpeBRep_LineInter)

Returns:
	static Standard_Real

Returns parameter u of vp on the restriction edge.") VPParamOnER;
		static Standard_Real VPParamOnER (const TopOpeBRep_VPointInter & vp,const TopOpeBRep_LineInter & Lrest);
		%feature("autodoc", "Args:
	Lrest(TopOpeBRep_LineInter)
	VP1(TopOpeBRep_VPointInter)
	VP2(TopOpeBRep_VPointInter)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") EqualpPonR;
		static Standard_Boolean EqualpPonR (const TopOpeBRep_LineInter & Lrest,const TopOpeBRep_VPointInter & VP1,const TopOpeBRep_VPointInter & VP2);
};


%feature("shadow") TopOpeBRep_FacesFiller::~TopOpeBRep_FacesFiller %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_FacesFiller {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_FacesIntersector;
class TopOpeBRep_FacesIntersector {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_FacesIntersector;
		 TopOpeBRep_FacesIntersector ();
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

Computes the intersection of faces S1 and S2.") Perform;
		void Perform (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	B1(Bnd_Box)
	B2(Bnd_Box)

Returns:
	None

Computes the intersection of faces S1 and S2.") Perform;
		void Perform (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Bnd_Box & B1,const Bnd_Box & B2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
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

Returns True if Perform() arguments are two faces with the  
         same surface.") SameDomain;
		Standard_Boolean SameDomain ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

returns first or second intersected face.") Face;
		const TopoDS_Shape & Face (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if Perform() arguments are two faces  
         SameDomain() and normals on both side.  
         Raise if SameDomain is False") SurfacesSameOriented;
		Standard_Boolean SurfacesSameOriented ();
		%feature("autodoc", "Args:
	E(TopoDS_Shape)

Returns:
	Standard_Boolean

returns true if edge <E> is found as same as the edge  
         associated with a RESTRICTION line.") IsRestriction;
		Standard_Boolean IsRestriction (const TopoDS_Shape & E);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_IndexedMapOfShape

returns the map of edges found as TopeBRepBRep_RESTRICTION") Restrictions;
		const TopTools_IndexedMapOfShape & Restrictions ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") PrepareLines;
		void PrepareLines ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRep_HArray1OfLineInter

No detailed docstring for this function.") Lines;
		Handle_TopOpeBRep_HArray1OfLineInter Lines ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbLines;
		Standard_Integer NbLines ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitLine;
		void InitLine ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreLine;
		Standard_Boolean MoreLine ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextLine;
		void NextLine ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_LineInter

No detailed docstring for this function.") CurrentLine;
		TopOpeBRep_LineInter & CurrentLine ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") CurrentLineIndex;
		Standard_Integer CurrentLineIndex ();
		%feature("autodoc", "Args:
	IL(Standard_Integer)

Returns:
	TopOpeBRep_LineInter

No detailed docstring for this function.") ChangeLine;
		TopOpeBRep_LineInter & ChangeLine (const Standard_Integer IL);
		%feature("autodoc", "Args:
	tolarc(Standard_Real)
	toltang(Standard_Real)

Returns:
	None

Force the tolerance values used by the next Perform(S1,S2) call.") ForceTolerances;
		void ForceTolerances (const Standard_Real tolarc,const Standard_Real toltang);
		%feature("autodoc", "Args:
	tolarc(Standard_Real)
	toltang(Standard_Real)

Returns:
	None

Return the tolerance values used in the last Perform() call  
If ForceTolerances() has been called, return the given values.  
If not, return values extracted from shapes.") GetTolerances;
		void GetTolerances (Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") TopOpeBRep_FacesIntersector::~TopOpeBRep_FacesIntersector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_FacesIntersector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_GeomTool;
class TopOpeBRep_GeomTool {
	public:
		%feature("autodoc", "Args:
	min(Standard_Real)
	max(Standard_Real)
	L(TopOpeBRep_LineInter)
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	C(TopOpeBRepDS_Curve)
	PC1(Handle_Geom2d_Curve)
	PC2(Handle_Geom2d_Curve)

Returns:
	static void

Make the  DS curve <C> and the pcurves <PC1,PC2> from  
intersection line <L> lying on shapes <S1,S2>. <min,max> = <L> bounds") MakeCurves;
		static void MakeCurves (const Standard_Real min,const Standard_Real max,const TopOpeBRep_LineInter & L,const TopoDS_Shape & S1,const TopoDS_Shape & S2,TopOpeBRepDS_Curve & C,Handle_Geom2d_Curve & PC1,Handle_Geom2d_Curve & PC2);
		%feature("autodoc", "Args:
	min(Standard_Real)
	max(Standard_Real)
	L(TopOpeBRep_LineInter)
	C(Handle_Geom_Curve)

Returns:
	static void

No detailed docstring for this function.") MakeCurve;
		static void MakeCurve (const Standard_Real min,const Standard_Real max,const TopOpeBRep_LineInter & L,Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	L(TopOpeBRep_LineInter)

Returns:
	static Handle_Geom_Curve

No detailed docstring for this function.") MakeBSpline1fromWALKING3d;
		static Handle_Geom_Curve MakeBSpline1fromWALKING3d (const TopOpeBRep_LineInter & L);
		%feature("autodoc", "Args:
	L(TopOpeBRep_LineInter)
	SI(Standard_Integer)

Returns:
	static Handle_Geom2d_Curve

No detailed docstring for this function.") MakeBSpline1fromWALKING2d;
		static Handle_Geom2d_Curve MakeBSpline1fromWALKING2d (const TopOpeBRep_LineInter & L,const Standard_Integer SI);
};


%feature("shadow") TopOpeBRep_GeomTool::~TopOpeBRep_GeomTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_GeomTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_HArray1OfLineInter;
class TopOpeBRep_HArray1OfLineInter : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_HArray1OfLineInter;
		 TopOpeBRep_HArray1OfLineInter (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(TopOpeBRep_LineInter)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_HArray1OfLineInter;
		 TopOpeBRep_HArray1OfLineInter (const Standard_Integer Low,const Standard_Integer Up,const TopOpeBRep_LineInter & V);
		%feature("autodoc", "Args:
	V(TopOpeBRep_LineInter)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopOpeBRep_LineInter & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(TopOpeBRep_LineInter)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TopOpeBRep_LineInter & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopOpeBRep_LineInter

No detailed docstring for this function.") Value;
		const TopOpeBRep_LineInter & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopOpeBRep_LineInter

No detailed docstring for this function.") ChangeValue;
		TopOpeBRep_LineInter & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_Array1OfLineInter

No detailed docstring for this function.") Array1;
		const TopOpeBRep_Array1OfLineInter & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_Array1OfLineInter

No detailed docstring for this function.") ChangeArray1;
		TopOpeBRep_Array1OfLineInter & ChangeArray1 ();
};


%feature("shadow") TopOpeBRep_HArray1OfLineInter::~TopOpeBRep_HArray1OfLineInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_HArray1OfLineInter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRep_HArray1OfLineInter {
	Handle_TopOpeBRep_HArray1OfLineInter GetHandle() {
	return *(Handle_TopOpeBRep_HArray1OfLineInter*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRep_HArray1OfLineInter;
class Handle_TopOpeBRep_HArray1OfLineInter : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopOpeBRep_HArray1OfLineInter();
        Handle_TopOpeBRep_HArray1OfLineInter(const Handle_TopOpeBRep_HArray1OfLineInter &aHandle);
        Handle_TopOpeBRep_HArray1OfLineInter(const TopOpeBRep_HArray1OfLineInter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRep_HArray1OfLineInter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRep_HArray1OfLineInter {
    TopOpeBRep_HArray1OfLineInter* GetObject() {
    return (TopOpeBRep_HArray1OfLineInter*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRep_HArray1OfLineInter::~Handle_TopOpeBRep_HArray1OfLineInter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRep_HArray1OfLineInter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRep_HArray1OfVPointInter;
class TopOpeBRep_HArray1OfVPointInter : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_HArray1OfVPointInter;
		 TopOpeBRep_HArray1OfVPointInter (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(TopOpeBRep_VPointInter)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_HArray1OfVPointInter;
		 TopOpeBRep_HArray1OfVPointInter (const Standard_Integer Low,const Standard_Integer Up,const TopOpeBRep_VPointInter & V);
		%feature("autodoc", "Args:
	V(TopOpeBRep_VPointInter)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopOpeBRep_VPointInter & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(TopOpeBRep_VPointInter)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TopOpeBRep_VPointInter & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopOpeBRep_VPointInter

No detailed docstring for this function.") Value;
		const TopOpeBRep_VPointInter & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopOpeBRep_VPointInter

No detailed docstring for this function.") ChangeValue;
		TopOpeBRep_VPointInter & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_Array1OfVPointInter

No detailed docstring for this function.") Array1;
		const TopOpeBRep_Array1OfVPointInter & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_Array1OfVPointInter

No detailed docstring for this function.") ChangeArray1;
		TopOpeBRep_Array1OfVPointInter & ChangeArray1 ();
};


%feature("shadow") TopOpeBRep_HArray1OfVPointInter::~TopOpeBRep_HArray1OfVPointInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_HArray1OfVPointInter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRep_HArray1OfVPointInter {
	Handle_TopOpeBRep_HArray1OfVPointInter GetHandle() {
	return *(Handle_TopOpeBRep_HArray1OfVPointInter*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRep_HArray1OfVPointInter;
class Handle_TopOpeBRep_HArray1OfVPointInter : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopOpeBRep_HArray1OfVPointInter();
        Handle_TopOpeBRep_HArray1OfVPointInter(const Handle_TopOpeBRep_HArray1OfVPointInter &aHandle);
        Handle_TopOpeBRep_HArray1OfVPointInter(const TopOpeBRep_HArray1OfVPointInter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRep_HArray1OfVPointInter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRep_HArray1OfVPointInter {
    TopOpeBRep_HArray1OfVPointInter* GetObject() {
    return (TopOpeBRep_HArray1OfVPointInter*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRep_HArray1OfVPointInter::~Handle_TopOpeBRep_HArray1OfVPointInter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRep_HArray1OfVPointInter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRep_Hctxee2d;
class TopOpeBRep_Hctxee2d : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_Hctxee2d;
		 TopOpeBRep_Hctxee2d ();
		%feature("autodoc", "Args:
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	BAS1(BRepAdaptor_Surface)
	BAS2(BRepAdaptor_Surface)

Returns:
	None

No detailed docstring for this function.") SetEdges;
		void SetEdges (const TopoDS_Edge & E1,const TopoDS_Edge & E2,const BRepAdaptor_Surface & BAS1,const BRepAdaptor_Surface & BAS2);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Edge;
		const TopoDS_Shape & Edge (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Geom2dAdaptor_Curve

No detailed docstring for this function.") Curve;
		const Geom2dAdaptor_Curve & Curve (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	IntRes2d_Domain

No detailed docstring for this function.") Domain;
		const IntRes2d_Domain & Domain (const Standard_Integer I);
};


%feature("shadow") TopOpeBRep_Hctxee2d::~TopOpeBRep_Hctxee2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_Hctxee2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRep_Hctxee2d {
	Handle_TopOpeBRep_Hctxee2d GetHandle() {
	return *(Handle_TopOpeBRep_Hctxee2d*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRep_Hctxee2d;
class Handle_TopOpeBRep_Hctxee2d : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopOpeBRep_Hctxee2d();
        Handle_TopOpeBRep_Hctxee2d(const Handle_TopOpeBRep_Hctxee2d &aHandle);
        Handle_TopOpeBRep_Hctxee2d(const TopOpeBRep_Hctxee2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRep_Hctxee2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRep_Hctxee2d {
    TopOpeBRep_Hctxee2d* GetObject() {
    return (TopOpeBRep_Hctxee2d*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRep_Hctxee2d::~Handle_TopOpeBRep_Hctxee2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRep_Hctxee2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRep_Hctxff2d;
class TopOpeBRep_Hctxff2d : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_Hctxff2d;
		 TopOpeBRep_Hctxff2d ();
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") SetFaces;
		void SetFaces (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "Args:
	S1(Handle_BRepAdaptor_HSurface)
	S2(Handle_BRepAdaptor_HSurface)

Returns:
	None

No detailed docstring for this function.") SetHSurfaces;
		void SetHSurfaces (const Handle_BRepAdaptor_HSurface & S1,const Handle_BRepAdaptor_HSurface & S2);
		%feature("autodoc", "Args:
	Tol1(Standard_Real)
	Tol2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerances;
		void SetTolerances (const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "Args:
	Tol1(Standard_Real)
	Tol2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GetTolerances;
		void GetTolerances (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetMaxTolerance;
		Standard_Real GetMaxTolerance ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Face

No detailed docstring for this function.") Face;
		const TopoDS_Face & Face (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Handle_BRepAdaptor_HSurface

No detailed docstring for this function.") HSurface;
		Handle_BRepAdaptor_HSurface HSurface (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") SurfacesSameOriented;
		Standard_Boolean SurfacesSameOriented ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") FacesSameOriented;
		Standard_Boolean FacesSameOriented ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") FaceSameOrientedWithRef;
		Standard_Boolean FaceSameOrientedWithRef (const Standard_Integer I);
};


%feature("shadow") TopOpeBRep_Hctxff2d::~TopOpeBRep_Hctxff2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_Hctxff2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRep_Hctxff2d {
	Handle_TopOpeBRep_Hctxff2d GetHandle() {
	return *(Handle_TopOpeBRep_Hctxff2d*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRep_Hctxff2d;
class Handle_TopOpeBRep_Hctxff2d : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopOpeBRep_Hctxff2d();
        Handle_TopOpeBRep_Hctxff2d(const Handle_TopOpeBRep_Hctxff2d &aHandle);
        Handle_TopOpeBRep_Hctxff2d(const TopOpeBRep_Hctxff2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRep_Hctxff2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRep_Hctxff2d {
    TopOpeBRep_Hctxff2d* GetObject() {
    return (TopOpeBRep_Hctxff2d*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRep_Hctxff2d::~Handle_TopOpeBRep_Hctxff2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRep_Hctxff2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRep_LineInter;
class TopOpeBRep_LineInter {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_LineInter;
		 TopOpeBRep_LineInter ();
		%feature("autodoc", "Args:
	L(Handle_IntPatch_Line)
	S1(BRepAdaptor_Surface)
	S2(BRepAdaptor_Surface)

Returns:
	None

No detailed docstring for this function.") SetLine;
		void SetLine (const Handle_IntPatch_Line & L,const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2);
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") SetFaces;
		void SetFaces (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_TypeLineCurve

No detailed docstring for this function.") TypeLineCurve;
		TopOpeBRep_TypeLineCurve TypeLineCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVPoint;
		Standard_Integer NbVPoint ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRep_VPointInter

No detailed docstring for this function.") VPoint;
		const TopOpeBRep_VPointInter & VPoint (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRep_VPointInter

No detailed docstring for this function.") ChangeVPoint;
		TopOpeBRep_VPointInter & ChangeVPoint (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetINL;
		void SetINL ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") INL;
		Standard_Boolean INL ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetIsVClosed;
		void SetIsVClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetOK;
		void SetOK (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") OK;
		Standard_Boolean OK ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetHasVPonR;
		void SetHasVPonR ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasVPonR;
		Standard_Boolean HasVPonR ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetVPBounds;
		void SetVPBounds ();
		%feature("autodoc", "Args:
	f(Standard_Integer)
	l(Standard_Integer)
	n(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") VPBounds;
		void VPBounds (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Period;
		Standard_Real Period ();
		%feature("autodoc", "Args:
	f(Standard_Real)
	l(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasVInternal;
		Standard_Boolean HasVInternal ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbWPoint;
		Standard_Integer NbWPoint ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRep_WPointInter

No detailed docstring for this function.") WPoint;
		const TopOpeBRep_WPointInter & WPoint (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_TypeTrans

No detailed docstring for this function.") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_TypeTrans

No detailed docstring for this function.") TransitionOnS2;
		IntSurf_TypeTrans TransitionOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_Situation

No detailed docstring for this function.") SituationS1;
		IntSurf_Situation SituationS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_Situation

No detailed docstring for this function.") SituationS2;
		IntSurf_Situation SituationS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") Curve;
		Handle_Geom_Curve Curve ();
		%feature("autodoc", "Args:
	parmin(Standard_Real)
	parmax(Standard_Real)

Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") Curve;
		Handle_Geom_Curve Curve (const Standard_Real parmin,const Standard_Real parmax);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

returns the edge of a RESTRICTION line (or a null edge).") Arc;
		const TopoDS_Shape & Arc ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

returns true if Arc() edge (of a RESTRICTION line) is  
         an edge of the original face <Index> (1 or 2).") ArcIsEdge;
		Standard_Boolean ArcIsEdge (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IntPatch_WLine

No detailed docstring for this function.") LineW;
		const Handle_IntPatch_WLine & LineW ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IntPatch_GLine

No detailed docstring for this function.") LineG;
		const Handle_IntPatch_GLine & LineG ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IntPatch_RLine

No detailed docstring for this function.") LineR;
		const Handle_IntPatch_RLine & LineR ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ComputeFaceFaceTransition;
		void ComputeFaceFaceTransition ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Transition

No detailed docstring for this function.") FaceFaceTransition;
		const TopOpeBRepDS_Transition & FaceFaceTransition (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Index;
		void Index (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") DumpType;
		void DumpType ();
		%feature("autodoc", "Args:
	I(Standard_Integer)
	s1(TCollection_AsciiString)
	s2(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") DumpVPoint;
		void DumpVPoint (const Standard_Integer I,const TCollection_AsciiString & s1,const TCollection_AsciiString & s2);
		%feature("autodoc", "Args:
	B(TopOpeBRep_Bipoint)
	s1(TCollection_AsciiString)
	s2(TCollection_AsciiString)

Returns:
	None

No detailed docstring for this function.") DumpBipoint;
		void DumpBipoint (const TopOpeBRep_Bipoint & B,const TCollection_AsciiString & s1,const TCollection_AsciiString & s2);
		%feature("autodoc", "Args:
	exF1(Standard_Integer)
	exF2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetTraceIndex;
		void SetTraceIndex (const Standard_Integer exF1,const Standard_Integer exF2);
		%feature("autodoc", "Args:
	exF1(Standard_Integer)
	exF2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GetTraceIndex;
		void GetTraceIndex (Standard_Integer &OutValue,Standard_Integer &OutValue);

        %feature("autodoc", "1");
        %extend{
            std::string DumpLineTransitionsToString() {
            std::stringstream s;
            self->DumpLineTransitions(s);
            return s.str();}
        };
        };


%feature("shadow") TopOpeBRep_LineInter::~TopOpeBRep_LineInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_LineInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_ListIteratorOfListOfBipoint;
class TopOpeBRep_ListIteratorOfListOfBipoint {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_ListIteratorOfListOfBipoint;
		 TopOpeBRep_ListIteratorOfListOfBipoint ();
		%feature("autodoc", "Args:
	L(TopOpeBRep_ListOfBipoint)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_ListIteratorOfListOfBipoint;
		 TopOpeBRep_ListIteratorOfListOfBipoint (const TopOpeBRep_ListOfBipoint & L);
		%feature("autodoc", "Args:
	L(TopOpeBRep_ListOfBipoint)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopOpeBRep_ListOfBipoint & L);
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
	TopOpeBRep_Bipoint

No detailed docstring for this function.") Value;
		TopOpeBRep_Bipoint & Value ();
};


%feature("shadow") TopOpeBRep_ListIteratorOfListOfBipoint::~TopOpeBRep_ListIteratorOfListOfBipoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_ListIteratorOfListOfBipoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_ListNodeOfListOfBipoint;
class TopOpeBRep_ListNodeOfListOfBipoint : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(TopOpeBRep_Bipoint)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_ListNodeOfListOfBipoint;
		 TopOpeBRep_ListNodeOfListOfBipoint (const TopOpeBRep_Bipoint & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_Bipoint

No detailed docstring for this function.") Value;
		TopOpeBRep_Bipoint & Value ();
};


%feature("shadow") TopOpeBRep_ListNodeOfListOfBipoint::~TopOpeBRep_ListNodeOfListOfBipoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_ListNodeOfListOfBipoint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRep_ListNodeOfListOfBipoint {
	Handle_TopOpeBRep_ListNodeOfListOfBipoint GetHandle() {
	return *(Handle_TopOpeBRep_ListNodeOfListOfBipoint*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRep_ListNodeOfListOfBipoint;
class Handle_TopOpeBRep_ListNodeOfListOfBipoint : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopOpeBRep_ListNodeOfListOfBipoint();
        Handle_TopOpeBRep_ListNodeOfListOfBipoint(const Handle_TopOpeBRep_ListNodeOfListOfBipoint &aHandle);
        Handle_TopOpeBRep_ListNodeOfListOfBipoint(const TopOpeBRep_ListNodeOfListOfBipoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRep_ListNodeOfListOfBipoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRep_ListNodeOfListOfBipoint {
    TopOpeBRep_ListNodeOfListOfBipoint* GetObject() {
    return (TopOpeBRep_ListNodeOfListOfBipoint*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRep_ListNodeOfListOfBipoint::~Handle_TopOpeBRep_ListNodeOfListOfBipoint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRep_ListNodeOfListOfBipoint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRep_ListOfBipoint;
class TopOpeBRep_ListOfBipoint {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_ListOfBipoint;
		 TopOpeBRep_ListOfBipoint ();
		%feature("autodoc", "Args:
	Other(TopOpeBRep_ListOfBipoint)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TopOpeBRep_ListOfBipoint & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRep_ListOfBipoint)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TopOpeBRep_ListOfBipoint & Other);
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
	I(TopOpeBRep_Bipoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopOpeBRep_Bipoint & I);
		%feature("autodoc", "Args:
	I(TopOpeBRep_Bipoint)
	theIt(TopOpeBRep_ListIteratorOfListOfBipoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopOpeBRep_Bipoint & I,TopOpeBRep_ListIteratorOfListOfBipoint & theIt);
		%feature("autodoc", "Args:
	Other(TopOpeBRep_ListOfBipoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TopOpeBRep_ListOfBipoint & Other);
		%feature("autodoc", "Args:
	I(TopOpeBRep_Bipoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopOpeBRep_Bipoint & I);
		%feature("autodoc", "Args:
	I(TopOpeBRep_Bipoint)
	theIt(TopOpeBRep_ListIteratorOfListOfBipoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopOpeBRep_Bipoint & I,TopOpeBRep_ListIteratorOfListOfBipoint & theIt);
		%feature("autodoc", "Args:
	Other(TopOpeBRep_ListOfBipoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TopOpeBRep_ListOfBipoint & Other);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_Bipoint

No detailed docstring for this function.") First;
		TopOpeBRep_Bipoint & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_Bipoint

No detailed docstring for this function.") Last;
		TopOpeBRep_Bipoint & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TopOpeBRep_ListIteratorOfListOfBipoint)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TopOpeBRep_ListIteratorOfListOfBipoint & It);
		%feature("autodoc", "Args:
	I(TopOpeBRep_Bipoint)
	It(TopOpeBRep_ListIteratorOfListOfBipoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const TopOpeBRep_Bipoint & I,TopOpeBRep_ListIteratorOfListOfBipoint & It);
		%feature("autodoc", "Args:
	Other(TopOpeBRep_ListOfBipoint)
	It(TopOpeBRep_ListIteratorOfListOfBipoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TopOpeBRep_ListOfBipoint & Other,TopOpeBRep_ListIteratorOfListOfBipoint & It);
		%feature("autodoc", "Args:
	I(TopOpeBRep_Bipoint)
	It(TopOpeBRep_ListIteratorOfListOfBipoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const TopOpeBRep_Bipoint & I,TopOpeBRep_ListIteratorOfListOfBipoint & It);
		%feature("autodoc", "Args:
	Other(TopOpeBRep_ListOfBipoint)
	It(TopOpeBRep_ListIteratorOfListOfBipoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (TopOpeBRep_ListOfBipoint & Other,TopOpeBRep_ListIteratorOfListOfBipoint & It);
};


%feature("shadow") TopOpeBRep_ListOfBipoint::~TopOpeBRep_ListOfBipoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_ListOfBipoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_Point2d;
class TopOpeBRep_Point2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_Point2d;
		 TopOpeBRep_Point2d ();
		%feature("autodoc", "Args:
	ie1(Standard_Integer)=0
	ie2(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump (const Standard_Integer ie1 = 0,const Standard_Integer ie2 = 0);
		%feature("autodoc", "Args:
	P(IntRes2d_IntersectionPoint)

Returns:
	None

No detailed docstring for this function.") SetPint;
		void SetPint (const IntRes2d_IntersectionPoint & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasPint;
		Standard_Boolean HasPint ();
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_IntersectionPoint

No detailed docstring for this function.") Pint;
		const IntRes2d_IntersectionPoint & Pint ();
		%feature("autodoc", "Args:
	I(Standard_Integer)
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetIsVertex;
		void SetIsVertex (const Standard_Integer I,const Standard_Boolean B);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVertex;
		Standard_Boolean IsVertex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	V(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") SetVertex;
		void SetVertex (const Standard_Integer I,const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Vertex

No detailed docstring for this function.") Vertex;
		const TopoDS_Vertex & Vertex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	T(TopOpeBRepDS_Transition)

Returns:
	None

No detailed docstring for this function.") SetTransition;
		void SetTransition (const Standard_Integer I,const TopOpeBRepDS_Transition & T);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Transition

No detailed docstring for this function.") Transition;
		const TopOpeBRepDS_Transition & Transition (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopOpeBRepDS_Transition

No detailed docstring for this function.") ChangeTransition;
		TopOpeBRepDS_Transition & ChangeTransition (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	P(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetParameter;
		void SetParameter (const Standard_Integer I,const Standard_Real P);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter (const Standard_Integer I);
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetIsPointOfSegment;
		void SetIsPointOfSegment (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsPointOfSegment;
		Standard_Boolean IsPointOfSegment ();
		%feature("autodoc", "Args:
	IP1(Standard_Integer)
	IP2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetSegmentAncestors;
		void SetSegmentAncestors (const Standard_Integer IP1,const Standard_Integer IP2);
		%feature("autodoc", "Args:
	IP1(Standard_Integer)
	IP2(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") SegmentAncestors;
		Standard_Boolean SegmentAncestors (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	S(TopOpeBRep_P2Dstatus)

Returns:
	None

No detailed docstring for this function.") SetStatus;
		void SetStatus (const TopOpeBRep_P2Dstatus S);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_P2Dstatus

No detailed docstring for this function.") Status;
		TopOpeBRep_P2Dstatus Status ();
		%feature("autodoc", "Args:
	X(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetIndex;
		void SetIndex (const Standard_Integer X);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") SetValue2d;
		void SetValue2d (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") Value2d;
		const gp_Pnt2d & Value2d ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetKeep;
		void SetKeep (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Keep;
		Standard_Boolean Keep ();
		%feature("autodoc", "Args:
	C(TopOpeBRepDS_Config)

Returns:
	None

No detailed docstring for this function.") SetEdgesConfig;
		void SetEdgesConfig (const TopOpeBRepDS_Config C);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepDS_Config

No detailed docstring for this function.") EdgesConfig;
		TopOpeBRepDS_Config EdgesConfig ();
		%feature("autodoc", "Args:
	T(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real T);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	ff2d(Handle_TopOpeBRep_Hctxff2d)

Returns:
	None

No detailed docstring for this function.") SetHctxff2d;
		void SetHctxff2d (const Handle_TopOpeBRep_Hctxff2d & ff2d);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRep_Hctxff2d

No detailed docstring for this function.") Hctxff2d;
		Handle_TopOpeBRep_Hctxff2d Hctxff2d ();
		%feature("autodoc", "Args:
	ee2d(Handle_TopOpeBRep_Hctxee2d)

Returns:
	None

No detailed docstring for this function.") SetHctxee2d;
		void SetHctxee2d (const Handle_TopOpeBRep_Hctxee2d & ee2d);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopOpeBRep_Hctxee2d

No detailed docstring for this function.") Hctxee2d;
		Handle_TopOpeBRep_Hctxee2d Hctxee2d ();
};


%feature("shadow") TopOpeBRep_Point2d::~TopOpeBRep_Point2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_Point2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_PointClassifier;
class TopOpeBRep_PointClassifier {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_PointClassifier;
		 TopOpeBRep_PointClassifier ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Init;
		void Init ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	P(gp_Pnt2d)
	Tol(Standard_Real)

Returns:
	TopAbs_State

compute position of point <P> regarding with the face <F>.") Classify;
		TopAbs_State Classify (const TopoDS_Face & F,const gp_Pnt2d & P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") State;
		TopAbs_State State ();
};


%feature("shadow") TopOpeBRep_PointClassifier::~TopOpeBRep_PointClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_PointClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_PointGeomTool;
class TopOpeBRep_PointGeomTool {
	public:
		%feature("autodoc", "Args:
	IP(TopOpeBRep_VPointInter)

Returns:
	static TopOpeBRepDS_Point

No detailed docstring for this function.") MakePoint;
		static TopOpeBRepDS_Point MakePoint (const TopOpeBRep_VPointInter & IP);
		%feature("autodoc", "Args:
	P2D(TopOpeBRep_Point2d)

Returns:
	static TopOpeBRepDS_Point

No detailed docstring for this function.") MakePoint;
		static TopOpeBRepDS_Point MakePoint (const TopOpeBRep_Point2d & P2D);
		%feature("autodoc", "Args:
	FEI(TopOpeBRep_FaceEdgeIntersector)

Returns:
	static TopOpeBRepDS_Point

No detailed docstring for this function.") MakePoint;
		static TopOpeBRepDS_Point MakePoint (const TopOpeBRep_FaceEdgeIntersector & FEI);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static TopOpeBRepDS_Point

No detailed docstring for this function.") MakePoint;
		static TopOpeBRepDS_Point MakePoint (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	DSP1(TopOpeBRepDS_Point)
	DSP2(TopOpeBRepDS_Point)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
		static Standard_Boolean IsEqual (const TopOpeBRepDS_Point & DSP1,const TopOpeBRepDS_Point & DSP2);
};


%feature("shadow") TopOpeBRep_PointGeomTool::~TopOpeBRep_PointGeomTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_PointGeomTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_SequenceNodeOfSequenceOfPoint2d;
class TopOpeBRep_SequenceNodeOfSequenceOfPoint2d : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(TopOpeBRep_Point2d)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_SequenceNodeOfSequenceOfPoint2d;
		 TopOpeBRep_SequenceNodeOfSequenceOfPoint2d (const TopOpeBRep_Point2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_Point2d

No detailed docstring for this function.") Value;
		TopOpeBRep_Point2d & Value ();
};


%feature("shadow") TopOpeBRep_SequenceNodeOfSequenceOfPoint2d::~TopOpeBRep_SequenceNodeOfSequenceOfPoint2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_SequenceNodeOfSequenceOfPoint2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopOpeBRep_SequenceNodeOfSequenceOfPoint2d {
	Handle_TopOpeBRep_SequenceNodeOfSequenceOfPoint2d GetHandle() {
	return *(Handle_TopOpeBRep_SequenceNodeOfSequenceOfPoint2d*) &$self;
	}
};

%nodefaultctor Handle_TopOpeBRep_SequenceNodeOfSequenceOfPoint2d;
class Handle_TopOpeBRep_SequenceNodeOfSequenceOfPoint2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TopOpeBRep_SequenceNodeOfSequenceOfPoint2d();
        Handle_TopOpeBRep_SequenceNodeOfSequenceOfPoint2d(const Handle_TopOpeBRep_SequenceNodeOfSequenceOfPoint2d &aHandle);
        Handle_TopOpeBRep_SequenceNodeOfSequenceOfPoint2d(const TopOpeBRep_SequenceNodeOfSequenceOfPoint2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopOpeBRep_SequenceNodeOfSequenceOfPoint2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopOpeBRep_SequenceNodeOfSequenceOfPoint2d {
    TopOpeBRep_SequenceNodeOfSequenceOfPoint2d* GetObject() {
    return (TopOpeBRep_SequenceNodeOfSequenceOfPoint2d*)$self->Access();
    }
};
%feature("shadow") Handle_TopOpeBRep_SequenceNodeOfSequenceOfPoint2d::~Handle_TopOpeBRep_SequenceNodeOfSequenceOfPoint2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopOpeBRep_SequenceNodeOfSequenceOfPoint2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopOpeBRep_SequenceOfPoint2d;
class TopOpeBRep_SequenceOfPoint2d : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_SequenceOfPoint2d;
		 TopOpeBRep_SequenceOfPoint2d ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TopOpeBRep_SequenceOfPoint2d)

Returns:
	TopOpeBRep_SequenceOfPoint2d

No detailed docstring for this function.") Assign;
		const TopOpeBRep_SequenceOfPoint2d & Assign (const TopOpeBRep_SequenceOfPoint2d & Other);
		%feature("autodoc", "Args:
	Other(TopOpeBRep_SequenceOfPoint2d)

Returns:
	TopOpeBRep_SequenceOfPoint2d

No detailed docstring for this function.") operator=;
		const TopOpeBRep_SequenceOfPoint2d & operator = (const TopOpeBRep_SequenceOfPoint2d & Other);
		%feature("autodoc", "Args:
	T(TopOpeBRep_Point2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopOpeBRep_Point2d & T);
		%feature("autodoc", "Args:
	S(TopOpeBRep_SequenceOfPoint2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TopOpeBRep_SequenceOfPoint2d & S);
		%feature("autodoc", "Args:
	T(TopOpeBRep_Point2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopOpeBRep_Point2d & T);
		%feature("autodoc", "Args:
	S(TopOpeBRep_SequenceOfPoint2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TopOpeBRep_SequenceOfPoint2d & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TopOpeBRep_Point2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TopOpeBRep_Point2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TopOpeBRep_SequenceOfPoint2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TopOpeBRep_SequenceOfPoint2d & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TopOpeBRep_Point2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TopOpeBRep_Point2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TopOpeBRep_SequenceOfPoint2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TopOpeBRep_SequenceOfPoint2d & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_Point2d

No detailed docstring for this function.") First;
		const TopOpeBRep_Point2d & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_Point2d

No detailed docstring for this function.") Last;
		const TopOpeBRep_Point2d & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TopOpeBRep_SequenceOfPoint2d)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TopOpeBRep_SequenceOfPoint2d & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopOpeBRep_Point2d

No detailed docstring for this function.") Value;
		const TopOpeBRep_Point2d & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(TopOpeBRep_Point2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TopOpeBRep_Point2d & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopOpeBRep_Point2d

No detailed docstring for this function.") ChangeValue;
		TopOpeBRep_Point2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") TopOpeBRep_SequenceOfPoint2d::~TopOpeBRep_SequenceOfPoint2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_SequenceOfPoint2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_ShapeIntersector;
class TopOpeBRep_ShapeIntersector {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_ShapeIntersector;
		 TopOpeBRep_ShapeIntersector ();
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

Initialize the intersection of shapes S1,S2.") InitIntersection;
		void InitIntersection (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)
	F1(TopoDS_Face)
	F2(TopoDS_Face)

Returns:
	None

Initialize the intersection of shapes S1,S2.") InitIntersection;
		void InitIntersection (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

return  the shape  <Index> ( = 1 or 2) given to  
         InitIntersection().  
         Index = 1 will return S1, Index = 2 will return S2.") Shape;
		const TopoDS_Shape & Shape (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True if there are more intersection  
         between two the shapes.") MoreIntersection;
		Standard_Boolean MoreIntersection ();
		%feature("autodoc", "Args:
	None
Returns:
	None

search for the next intersection between the two shapes.") NextIntersection;
		void NextIntersection ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_FacesIntersector

return the current intersection of two Faces.") ChangeFacesIntersector;
		TopOpeBRep_FacesIntersector & ChangeFacesIntersector ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_EdgesIntersector

return the current intersection of two Edges.") ChangeEdgesIntersector;
		TopOpeBRep_EdgesIntersector & ChangeEdgesIntersector ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_FaceEdgeIntersector

return the current intersection of a Face and an Edge.") ChangeFaceEdgeIntersector;
		TopOpeBRep_FaceEdgeIntersector & ChangeFaceEdgeIntersector ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

return  geometric  shape <Index> ( = 1 or 2 )  of  
         current intersection.") CurrentGeomShape;
		const TopoDS_Shape & CurrentGeomShape (const Standard_Integer Index);
		%feature("autodoc", "Args:
	tol1(Standard_Real)
	tol2(Standard_Real)

Returns:
	None

return  MAX of intersection tolerances with  
         which FacesIntersector from TopOpeBRep was working.") GetTolerances;
		void GetTolerances (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") DumpCurrent;
		void DumpCurrent (const Standard_Integer K);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index (const Standard_Integer K);
		%feature("autodoc", "Args:
	anObj(TopoDS_Shape)
	aReference(TopoDS_Shape)
	aListOfShape(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") RejectedFaces;
		void RejectedFaces (const TopoDS_Shape & anObj,const TopoDS_Shape & aReference,TopTools_ListOfShape & aListOfShape);
};


%feature("shadow") TopOpeBRep_ShapeIntersector::~TopOpeBRep_ShapeIntersector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_ShapeIntersector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_ShapeIntersector2d;
class TopOpeBRep_ShapeIntersector2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_ShapeIntersector2d;
		 TopOpeBRep_ShapeIntersector2d ();
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	None

Initialize the intersection of shapes S1,S2.") InitIntersection;
		void InitIntersection (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

return  the shape  <Index> ( = 1 or 2) given to  
         InitIntersection().  
         Index = 1 will return S1, Index = 2 will return S2.") Shape;
		const TopoDS_Shape & Shape (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True if there are more intersection  
         between two the shapes.") MoreIntersection;
		Standard_Boolean MoreIntersection ();
		%feature("autodoc", "Args:
	None
Returns:
	None

search for the next intersection between the two shapes.") NextIntersection;
		void NextIntersection ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_EdgesIntersector

return the current intersection of two Edges.") ChangeEdgesIntersector;
		TopOpeBRep_EdgesIntersector & ChangeEdgesIntersector ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

return  geometric  shape <Index> ( = 1 or 2 )  of  
         current intersection.") CurrentGeomShape;
		const TopoDS_Shape & CurrentGeomShape (const Standard_Integer Index);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") DumpCurrent;
		void DumpCurrent (const Standard_Integer K);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index (const Standard_Integer K);
};


%feature("shadow") TopOpeBRep_ShapeIntersector2d::~TopOpeBRep_ShapeIntersector2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_ShapeIntersector2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_ShapeScanner;
class TopOpeBRep_ShapeScanner {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_ShapeScanner;
		 TopOpeBRep_ShapeScanner ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	TS(TopAbs_ShapeEnum)
	TA(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	None

No detailed docstring for this function.") AddBoxesMakeCOB;
		void AddBoxesMakeCOB (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	E(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & E);
		%feature("autodoc", "Args:
	X(TopOpeBRepTool_ShapeExplorer)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (TopOpeBRepTool_ShapeExplorer & X);
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
	TopoDS_Shape

No detailed docstring for this function.") Current;
		const TopoDS_Shape & Current ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_BoxSort

No detailed docstring for this function.") BoxSort;
		const TopOpeBRepTool_BoxSort & BoxSort ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRepTool_BoxSort

No detailed docstring for this function.") ChangeBoxSort;
		TopOpeBRepTool_BoxSort & ChangeBoxSort ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpCurrentToString() {
            std::stringstream s;
            self->DumpCurrent(s);
            return s.str();}
        };
        };


%feature("shadow") TopOpeBRep_ShapeScanner::~TopOpeBRep_ShapeScanner %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_ShapeScanner {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_VPointInter;
class TopOpeBRep_VPointInter {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_VPointInter;
		 TopOpeBRep_VPointInter ();
		%feature("autodoc", "Args:
	P(IntPatch_Point)

Returns:
	None

No detailed docstring for this function.") SetPoint;
		void SetPoint (const IntPatch_Point & P);
		%feature("autodoc", "Args:
	I1(Standard_Integer)
	I2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetShapes;
		void SetShapes (const Standard_Integer I1,const Standard_Integer I2);
		%feature("autodoc", "Args:
	I1(Standard_Integer)
	I2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GetShapes;
		void GetShapes (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_Transition

No detailed docstring for this function.") TransitionOnS1;
		IntSurf_Transition TransitionOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_Transition

No detailed docstring for this function.") TransitionOnS2;
		IntSurf_Transition TransitionOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_Transition

No detailed docstring for this function.") TransitionLineArc1;
		IntSurf_Transition TransitionLineArc1 ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_Transition

No detailed docstring for this function.") TransitionLineArc2;
		IntSurf_Transition TransitionLineArc2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOnDomS1;
		Standard_Boolean IsOnDomS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOnDomS2;
		Standard_Boolean IsOnDomS2 ();
		%feature("autodoc", "Args:
	u(Standard_Real)
	v(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ParametersOnS1;
		void ParametersOnS1 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	u(Standard_Real)
	v(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ParametersOnS2;
		void ParametersOnS2 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") ArcOnS1;
		const TopoDS_Shape & ArcOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") ArcOnS2;
		const TopoDS_Shape & ArcOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParameterOnLine;
		Standard_Real ParameterOnLine ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParameterOnArc1;
		Standard_Real ParameterOnArc1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the point is a vertex on the initial  
         restriction facet of the first surface.") IsVertexOnS1;
		Standard_Boolean IsVertexOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the information about the point when it is  
         on the domain of the first patch, i-e when the function  
         IsVertexOnS1 returns True.  
         Otherwise, an exception is raised.") VertexOnS1;
		const TopoDS_Shape & VertexOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParameterOnArc2;
		Standard_Real ParameterOnArc2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the point is a vertex on the initial  
         restriction facet of the second surface.") IsVertexOnS2;
		Standard_Boolean IsVertexOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the information about the point when it is  
         on the domain of the second patch, i-e when the function  
         IsVertexOnS2 returns True.  
         Otherwise, an exception is raised.") VertexOnS2;
		const TopoDS_Shape & VertexOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsInternal;
		Standard_Boolean IsInternal ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the point belongs to several intersection  
         lines.") IsMultiple;
		Standard_Boolean IsMultiple ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopAbs_State

get state of VPoint within the domain of geometric shape  
         domain <I> (= 1 or 2).") State;
		TopAbs_State State (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopAbs_State)
	I(Standard_Integer)

Returns:
	None

Set the state of VPoint within the  domain of  
         the geometric shape <I> (= 1 or 2).") State;
		void State (const TopAbs_State S,const Standard_Integer I);
		%feature("autodoc", "Args:
	Eon(TopoDS_Shape)
	Par(Standard_Real)
	I(Standard_Integer)

Returns:
	None

set the shape Eon of shape I (1,2) containing the point,  
         and parameter <Par> of point on <Eon>.") EdgeON;
		void EdgeON (const TopoDS_Shape & Eon,const Standard_Real Par,const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

get the edge of shape I (1,2) containing the point.") EdgeON;
		const TopoDS_Shape & EdgeON (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Real

get the parameter on edge of shape I (1,2) containing the point.") EdgeONParameter;
		Standard_Real EdgeONParameter (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns value of filed myShapeIndex = 0,1,2,3  
         0 means the VPoint is on no restriction  
         1 means the VPoint is on the restriction 1  
         2 means the VPoint is on the restriction 2  
         3 means the VPoint is on the restrictions 1 and 2") ShapeIndex;
		Standard_Integer ShapeIndex ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

set value of shape supporting me (0,1,2,3).") ShapeIndex;
		void ShapeIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

get the edge of shape I (1,2) containing the point.  
         Returned shape is null if the VPoint is not on an edge  
         of shape I (1,2).") Edge;
		const TopoDS_Shape & Edge (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Real

get the parameter on edge of shape I (1,2) containing the point") EdgeParameter;
		Standard_Real EdgeParameter (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	gp_Pnt2d

get the parameter on surface of shape I (1,2) containing the point") SurfaceParameters;
		gp_Pnt2d SurfaceParameters (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVertex;
		Standard_Boolean IsVertex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Vertex;
		const TopoDS_Shape & Vertex (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	None

set myKeep value according to current states.") UpdateKeep;
		void UpdateKeep ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns value of myKeep (does not evaluate states)  
False at creation of VPoint.  
Updated by State(State from TopAbs,Integer from Standard)") Keep;
		Standard_Boolean Keep ();
		%feature("autodoc", "Args:
	keep(Standard_Boolean)

Returns:
	None

updates VPointInter flag 'keep' with <keep>.") ChangeKeep;
		void ChangeKeep (const Standard_Boolean keep);
		%feature("autodoc", "Args:
	VP(TopOpeBRep_VPointInter)

Returns:
	Standard_Boolean

returns <True> if the 3d points and the parameters of the  
         VPoints are same") EqualpP;
		Standard_Boolean EqualpP (const TopOpeBRep_VPointInter & VP);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	par(Standard_Real)

Returns:
	Standard_Boolean

returns <false> if the vpoint is not given on arc <E>,  
         else returns <par> parameter on <E>") ParonE;
		Standard_Boolean ParonE (const TopoDS_Edge & E,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Index;
		void Index (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	I(Standard_Integer)
	F(TopoDS_Face)
	OS(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") Dump;
		Standard_OStream & Dump (const Standard_Integer I,const TopoDS_Face & F,Standard_OStream & OS);
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)
	OS(Standard_OStream)

Returns:
	Standard_OStream

No detailed docstring for this function.") Dump;
		Standard_OStream & Dump (const TopoDS_Face & F1,const TopoDS_Face & F2,Standard_OStream & OS);
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_PThePointOfIntersection

No detailed docstring for this function.") PThePointOfIntersectionDummy;
		TopOpeBRep_PThePointOfIntersection PThePointOfIntersectionDummy ();
};


%feature("shadow") TopOpeBRep_VPointInter::~TopOpeBRep_VPointInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_VPointInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_VPointInterClassifier;
class TopOpeBRep_VPointInterClassifier {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_VPointInterClassifier;
		 TopOpeBRep_VPointInterClassifier ();
		%feature("autodoc", "Args:
	F(TopoDS_Shape)
	VP(TopOpeBRep_VPointInter)
	ShapeIndex(Standard_Integer)
	PC(TopOpeBRep_PointClassifier)
	AssumeINON(Standard_Boolean)
	Tol(Standard_Real)

Returns:
	TopAbs_State

compute position of VPoint <VP> regarding with face <F>.  
<ShapeIndex> (= 1,2) indicates which (u,v) point of <VP> is used.  
when state is ON, set VP.EdgeON() with the edge containing <VP>  
and associated parameter.  
returns state of VP on ShapeIndex.") VPointPosition;
		TopAbs_State VPointPosition (const TopoDS_Shape & F,TopOpeBRep_VPointInter & VP,const Standard_Integer ShapeIndex,TopOpeBRep_PointClassifier & PC,const Standard_Boolean AssumeINON,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

returns the edge containing the VPoint <VP> used in the  
last VPointPosition() call. Edge is defined if the state previously  
computed is ON, else Edge is a null shape.") Edge;
		const TopoDS_Shape & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the parameter of the VPoint <VP> on Edge()") EdgeParameter;
		Standard_Real EdgeParameter ();
};


%feature("shadow") TopOpeBRep_VPointInterClassifier::~TopOpeBRep_VPointInterClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_VPointInterClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_VPointInterIterator;
class TopOpeBRep_VPointInterIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_VPointInterIterator;
		 TopOpeBRep_VPointInterIterator ();
		%feature("autodoc", "Args:
	LI(TopOpeBRep_LineInter)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_VPointInterIterator;
		 TopOpeBRep_VPointInterIterator (const TopOpeBRep_LineInter & LI);
		%feature("autodoc", "Args:
	LI(TopOpeBRep_LineInter)
	checkkeep(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopOpeBRep_LineInter & LI,const Standard_Boolean checkkeep = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Init;
		void Init ();
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
	TopOpeBRep_VPointInter

No detailed docstring for this function.") CurrentVP;
		const TopOpeBRep_VPointInter & CurrentVP ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") CurrentVPIndex;
		Standard_Integer CurrentVPIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_VPointInter

No detailed docstring for this function.") ChangeCurrentVP;
		TopOpeBRep_VPointInter & ChangeCurrentVP ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_PLineInter

No detailed docstring for this function.") PLineInterDummy;
		TopOpeBRep_PLineInter PLineInterDummy ();
};


%feature("shadow") TopOpeBRep_VPointInterIterator::~TopOpeBRep_VPointInterIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_VPointInterIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_WPointInter;
class TopOpeBRep_WPointInter {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_WPointInter;
		 TopOpeBRep_WPointInter ();
		%feature("autodoc", "Args:
	P(IntSurf_PntOn2S)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const IntSurf_PntOn2S & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ParametersOnS1;
		void ParametersOnS1 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ParametersOnS2;
		void ParametersOnS2 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") ValueOnS1;
		gp_Pnt2d ValueOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") ValueOnS2;
		gp_Pnt2d ValueOnS2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_PPntOn2S

No detailed docstring for this function.") PPntOn2SDummy;
		TopOpeBRep_PPntOn2S PPntOn2SDummy ();
};


%feature("shadow") TopOpeBRep_WPointInter::~TopOpeBRep_WPointInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_WPointInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopOpeBRep_WPointInterIterator;
class TopOpeBRep_WPointInterIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopOpeBRep_WPointInterIterator;
		 TopOpeBRep_WPointInterIterator ();
		%feature("autodoc", "Args:
	LI(TopOpeBRep_LineInter)

Returns:
	None

No detailed docstring for this function.") TopOpeBRep_WPointInterIterator;
		 TopOpeBRep_WPointInterIterator (const TopOpeBRep_LineInter & LI);
		%feature("autodoc", "Args:
	LI(TopOpeBRep_LineInter)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopOpeBRep_LineInter & LI);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Init;
		void Init ();
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
	TopOpeBRep_WPointInter

No detailed docstring for this function.") CurrentWP;
		const TopOpeBRep_WPointInter & CurrentWP ();
		%feature("autodoc", "Args:
	None
Returns:
	TopOpeBRep_PLineInter

No detailed docstring for this function.") PLineInterDummy;
		TopOpeBRep_PLineInter PLineInterDummy ();
};


%feature("shadow") TopOpeBRep_WPointInterIterator::~TopOpeBRep_WPointInterIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopOpeBRep_WPointInterIterator {
	void _kill_pointed() {
		delete $self;
	}
};
