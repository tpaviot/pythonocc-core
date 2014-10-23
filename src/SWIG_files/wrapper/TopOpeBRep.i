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
		%feature("autodoc", "	* Prints the name of <TLC> as a String on the Stream <S> and returns <S>.

	:param TLC:
	:type TLC: TopOpeBRep_TypeLineCurve
	:param OS:
	:type OS: Standard_OStream &
	:rtype: Standard_OStream
") Print;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TopOpeBRep_Array1OfLineInter;
		 TopOpeBRep_Array1OfLineInter (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: TopOpeBRep_LineInter &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TopOpeBRep_Array1OfLineInter;
		 TopOpeBRep_Array1OfLineInter (const TopOpeBRep_LineInter & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: TopOpeBRep_LineInter &
	:rtype: None
") Init;
		void Init (const TopOpeBRep_LineInter & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRep_Array1OfLineInter &
	:rtype: TopOpeBRep_Array1OfLineInter
") Assign;
		const TopOpeBRep_Array1OfLineInter & Assign (const TopOpeBRep_Array1OfLineInter & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRep_Array1OfLineInter &
	:rtype: TopOpeBRep_Array1OfLineInter
") operator=;
		const TopOpeBRep_Array1OfLineInter & operator = (const TopOpeBRep_Array1OfLineInter & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: TopOpeBRep_LineInter &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopOpeBRep_LineInter & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopOpeBRep_LineInter
") Value;
		const TopOpeBRep_LineInter & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopOpeBRep_LineInter
") ChangeValue;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TopOpeBRep_Array1OfVPointInter;
		 TopOpeBRep_Array1OfVPointInter (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: TopOpeBRep_VPointInter &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TopOpeBRep_Array1OfVPointInter;
		 TopOpeBRep_Array1OfVPointInter (const TopOpeBRep_VPointInter & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: TopOpeBRep_VPointInter &
	:rtype: None
") Init;
		void Init (const TopOpeBRep_VPointInter & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRep_Array1OfVPointInter &
	:rtype: TopOpeBRep_Array1OfVPointInter
") Assign;
		const TopOpeBRep_Array1OfVPointInter & Assign (const TopOpeBRep_Array1OfVPointInter & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRep_Array1OfVPointInter &
	:rtype: TopOpeBRep_Array1OfVPointInter
") operator=;
		const TopOpeBRep_Array1OfVPointInter & operator = (const TopOpeBRep_Array1OfVPointInter & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: TopOpeBRep_VPointInter &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopOpeBRep_VPointInter & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopOpeBRep_VPointInter
") Value;
		const TopOpeBRep_VPointInter & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopOpeBRep_VPointInter
") ChangeValue;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_Bipoint;
		 TopOpeBRep_Bipoint ();
		%feature("autodoc", "	:param I1:
	:type I1: Standard_Integer
	:param I2:
	:type I2: Standard_Integer
	:rtype: None
") TopOpeBRep_Bipoint;
		 TopOpeBRep_Bipoint (const Standard_Integer I1,const Standard_Integer I2);
		%feature("autodoc", "	:rtype: int
") I1;
		Standard_Integer I1 ();
		%feature("autodoc", "	:rtype: int
") I2;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_DSFiller;
		 TopOpeBRep_DSFiller ();
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	* return field myPShapeClassifier. set field myPShapeClassifier.

	:rtype: TopOpeBRepTool_PShapeClassifier
") PShapeClassifier;
		TopOpeBRepTool_PShapeClassifier PShapeClassifier ();
		%feature("autodoc", "	* Stores in <DS> the intersections of <S1> and <S2>. if orientFORWARD = True  S FORWARD,REVERSED --> FORWARD  S EXTERNAL,INTERNAL --> EXTERNAL,INTERNAL

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:param orientFORWARD: default value is Standard_True
	:type orientFORWARD: bool
	:rtype: None
") Insert;
		void Insert (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Handle_TopOpeBRepDS_HDataStructure & HDS,const Standard_Boolean orientFORWARD = Standard_True);
		%feature("autodoc", "	* Stores in <DS> the intersections of <S1> and <S2>. if orientFORWARD = True  S FORWAR,REVERSED --> FORWARD  S EXTERNAL,INTERNAL --> EXTERNAL,INTERNAL

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:param orientFORWARD: default value is Standard_True
	:type orientFORWARD: bool
	:rtype: None
") InsertIntersection;
		void InsertIntersection (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Handle_TopOpeBRepDS_HDataStructure & HDS,const Standard_Boolean orientFORWARD = Standard_True);
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") Complete;
		void Complete (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "	* Stores in <DS> the intersections of <S1> and <S2>. S1 et S2 contain only SameDomain Face

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") Insert2d;
		void Insert2d (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "	* S1, S2 set of tangent face lance les intersections 2d pour coder correctement les faces SameDomain.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") InsertIntersection2d;
		void InsertIntersection2d (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") IsMadeOf1d;
		Standard_Boolean IsMadeOf1d (const TopoDS_Shape & S);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") IsContext1d;
		Standard_Boolean IsContext1d (const TopoDS_Shape & S);
		%feature("autodoc", "	* Stores in <DS> the intersections of <S1> and <S2>. S1 and S2 are edges or wires. S1 edges have a 2d representation in face F1 S2 edges have a 2d representation in face F2 F1 is the face which surface is taken as reference for 2d description of S1 and S2 edges. if orientFORWARD = True  S FORWARD,REVERSED --> FORWARD  S EXTERNAL,INTERNAL --> EXTERNAL,INTERNAL

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:param orientFORWARD: default value is Standard_False
	:type orientFORWARD: bool
	:rtype: None
") Insert1d;
		void Insert1d (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const TopoDS_Face & F1,const TopoDS_Face & F2,const Handle_TopOpeBRepDS_HDataStructure & HDS,const Standard_Boolean orientFORWARD = Standard_False);
		%feature("autodoc", "	:rtype: TopOpeBRep_ShapeIntersector
") ChangeShapeIntersector;
		TopOpeBRep_ShapeIntersector & ChangeShapeIntersector ();
		%feature("autodoc", "	:rtype: TopOpeBRep_ShapeIntersector2d
") ChangeShapeIntersector2d;
		TopOpeBRep_ShapeIntersector2d & ChangeShapeIntersector2d ();
		%feature("autodoc", "	:rtype: TopOpeBRep_FacesFiller
") ChangeFacesFiller;
		TopOpeBRep_FacesFiller & ChangeFacesFiller ();
		%feature("autodoc", "	:rtype: TopOpeBRep_EdgesFiller
") ChangeEdgesFiller;
		TopOpeBRep_EdgesFiller & ChangeEdgesFiller ();
		%feature("autodoc", "	:rtype: TopOpeBRep_FaceEdgeFiller
") ChangeFaceEdgeFiller;
		TopOpeBRep_FaceEdgeFiller & ChangeFaceEdgeFiller ();
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") GapFiller;
		void GapFiller (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "	* Update the data structure with relevant informations deduced from the intersections.  Shells containing an intersected face. Wires containing an intersected edge.

	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") CompleteDS;
		void CompleteDS (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") Filter;
		void Filter (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") Reducer;
		void Reducer (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") RemoveUnsharedGeometry;
		void RemoveUnsharedGeometry (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") Checker;
		void Checker (const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "	* Update the data structure with relevant informations deduced from the intersections 2d.  Shells containing an intersected face. Wires containing an intersected edge. search for interference identity using edge connexity //NYI

	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") CompleteDS2d;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_DataMapIteratorOfDataMapOfTopolTool;
		 TopOpeBRep_DataMapIteratorOfDataMapOfTopolTool ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRep_DataMapOfTopolTool &
	:rtype: None
") TopOpeBRep_DataMapIteratorOfDataMapOfTopolTool;
		 TopOpeBRep_DataMapIteratorOfDataMapOfTopolTool (const TopOpeBRep_DataMapOfTopolTool & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopOpeBRep_DataMapOfTopolTool &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRep_DataMapOfTopolTool & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: Handle_BRepTopAdaptor_TopolTool
") Value;
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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Handle_BRepTopAdaptor_TopolTool &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRep_DataMapNodeOfDataMapOfTopolTool;
		 TopOpeBRep_DataMapNodeOfDataMapOfTopolTool (const TopoDS_Shape & K,const Handle_BRepTopAdaptor_TopolTool & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: Handle_BRepTopAdaptor_TopolTool
") Value;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopOpeBRep_DataMapOfTopolTool;
		 TopOpeBRep_DataMapOfTopolTool (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRep_DataMapOfTopolTool &
	:rtype: TopOpeBRep_DataMapOfTopolTool
") Assign;
		TopOpeBRep_DataMapOfTopolTool & Assign (const TopOpeBRep_DataMapOfTopolTool & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRep_DataMapOfTopolTool &
	:rtype: TopOpeBRep_DataMapOfTopolTool
") operator=;
		TopOpeBRep_DataMapOfTopolTool & operator = (const TopOpeBRep_DataMapOfTopolTool & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Handle_BRepTopAdaptor_TopolTool &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Handle_BRepTopAdaptor_TopolTool & I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Handle_BRepTopAdaptor_TopolTool
") Find;
		const Handle_BRepTopAdaptor_TopolTool & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Handle_BRepTopAdaptor_TopolTool
") ChangeFind;
		Handle_BRepTopAdaptor_TopolTool & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_EdgesFiller;
		 TopOpeBRep_EdgesFiller ();
		%feature("autodoc", "	:param E1:
	:type E1: TopoDS_Shape &
	:param E2:
	:type E2: TopoDS_Shape &
	:param EI:
	:type EI: TopOpeBRep_EdgesIntersector &
	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") Insert;
		void Insert (const TopoDS_Shape & E1,const TopoDS_Shape & E2,TopOpeBRep_EdgesIntersector & EI,const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param F:
	:type F: TopoDS_Shape &
	:rtype: None
") Face;
		void Face (const Standard_Integer I,const TopoDS_Shape & F);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") Face;
		const TopoDS_Shape  Face (const Standard_Integer I);
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_EdgesIntersector;
		 TopOpeBRep_EdgesIntersector ();
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Shape &
	:param F2:
	:type F2: TopoDS_Shape &
	:rtype: None
") SetFaces;
		void SetFaces (const TopoDS_Shape & F1,const TopoDS_Shape & F2);
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Shape &
	:param F2:
	:type F2: TopoDS_Shape &
	:param B1:
	:type B1: Bnd_Box &
	:param B2:
	:type B2: Bnd_Box &
	:rtype: None
") SetFaces;
		void SetFaces (const TopoDS_Shape & F1,const TopoDS_Shape & F2,const Bnd_Box & B1,const Bnd_Box & B2);
		%feature("autodoc", "	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") ForceTolerances;
		void ForceTolerances (const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "	:param D:
	:type D: Standard_Integer
	:rtype: None
") Dimension;
		void Dimension (const Standard_Integer D);
		%feature("autodoc", "	* set working space dimension D = 1 for E &|| W, 2 for E in F

	:rtype: int
") Dimension;
		Standard_Integer Dimension ();
		%feature("autodoc", "	:param E1:
	:type E1: TopoDS_Shape &
	:param E2:
	:type E2: TopoDS_Shape &
	:param ReduceSegments: default value is Standard_True
	:type ReduceSegments: bool
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & E1,const TopoDS_Shape & E2,const Standard_Boolean ReduceSegments = Standard_True);
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	* true if at least one intersection segment.

	:rtype: bool
") HasSegment;
		Standard_Boolean HasSegment ();
		%feature("autodoc", "	* = mySameDomain.

	:rtype: bool
") SameDomain;
		Standard_Boolean SameDomain ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Shape
") Edge;
		const TopoDS_Shape  Edge (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Geom2dAdaptor_Curve
") Curve;
		const Geom2dAdaptor_Curve & Curve (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Shape
") Face;
		const TopoDS_Shape  Face (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: BRepAdaptor_Surface
") Surface;
		const BRepAdaptor_Surface & Surface (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: bool
") SurfacesSameOriented;
		Standard_Boolean SurfacesSameOriented ();
		%feature("autodoc", "	:rtype: bool
") FacesSameOriented;
		Standard_Boolean FacesSameOriented ();
		%feature("autodoc", "	:rtype: float
") ToleranceMax;
		Standard_Real ToleranceMax ();
		%feature("autodoc", "	:param tol1:
	:type tol1: float &
	:param tol2:
	:type tol2: float &
	:rtype: None
") Tolerances;
		void Tolerances (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "	:param str:
	:type str: TCollection_AsciiString &
	:param ie1: default value is 0
	:type ie1: Standard_Integer
	:param ie2: default value is 0
	:type ie2: Standard_Integer
	:rtype: None
") Dump;
		void Dump (const TCollection_AsciiString & str,const Standard_Integer ie1 = 0,const Standard_Integer ie2 = 0);
		%feature("autodoc", "	:param selectkeep: default value is Standard_True
	:type selectkeep: bool
	:rtype: None
") InitPoint;
		void InitPoint (const Standard_Boolean selectkeep = Standard_True);
		%feature("autodoc", "	:rtype: bool
") MorePoint;
		Standard_Boolean MorePoint ();
		%feature("autodoc", "	:rtype: None
") NextPoint;
		void NextPoint ();
		%feature("autodoc", "	:rtype: TopOpeBRep_SequenceOfPoint2d
") Points;
		const TopOpeBRep_SequenceOfPoint2d & Points ();
		%feature("autodoc", "	:rtype: TopOpeBRep_Point2d
") Point;
		const TopOpeBRep_Point2d & Point ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopOpeBRep_Point2d
") Point;
		const TopOpeBRep_Point2d & Point (const Standard_Integer I);
		%feature("autodoc", "	:param P1:
	:type P1: TopOpeBRep_Point2d &
	:param P2:
	:type P2: TopOpeBRep_Point2d &
	:param Pn:
	:type Pn: TopOpeBRep_Point2d &
	:rtype: bool
") ReduceSegment;
		virtual Standard_Boolean ReduceSegment (TopOpeBRep_Point2d & P1,TopOpeBRep_Point2d & P2,TopOpeBRep_Point2d & Pn);
		%feature("autodoc", "	:rtype: TopOpeBRep_P2Dstatus
") Status1;
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
		%feature("autodoc", "	:param PFF:
	:type PFF: TopOpeBRep_PFacesFiller &
	:rtype: None
") TopOpeBRep_FFDumper;
		 TopOpeBRep_FFDumper (const TopOpeBRep_PFacesFiller & PFF);
		%feature("autodoc", "	:param PFF:
	:type PFF: TopOpeBRep_PFacesFiller &
	:rtype: None
") Init;
		void Init (const TopOpeBRep_PFacesFiller & PFF);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: None
") DumpLine;
		void DumpLine (const Standard_Integer I);
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRep_LineInter &
	:rtype: None
") DumpLine;
		void DumpLine (const TopOpeBRep_LineInter & L);
		%feature("autodoc", "	:param VP:
	:type VP: TopOpeBRep_VPointInter &
	:rtype: None
") DumpVP;
		void DumpVP (const TopOpeBRep_VPointInter & VP);
		%feature("autodoc", "	:param VP:
	:type VP: TopOpeBRep_VPointInter &
	:param ISI:
	:type ISI: Standard_Integer
	:rtype: None
") DumpVP;
		void DumpVP (const TopOpeBRep_VPointInter & VP,const Standard_Integer ISI);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param ISI:
	:type ISI: Standard_Integer
	:rtype: int
") ExploreIndex;
		Standard_Integer ExploreIndex (const TopoDS_Shape & S,const Standard_Integer ISI);
		%feature("autodoc", "	:param VP:
	:type VP: TopOpeBRep_VPointInter &
	:param GK:
	:type GK: TopOpeBRepDS_Kind
	:param G:
	:type G: Standard_Integer
	:param newinDS:
	:type newinDS: bool
	:rtype: None
") DumpDSP;
		void DumpDSP (const TopOpeBRep_VPointInter & VP,const TopOpeBRepDS_Kind GK,const Standard_Integer G,const Standard_Boolean newinDS);
		%feature("autodoc", "	:rtype: TopOpeBRep_PFacesFiller
") PFacesFillerDummy;
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
		%feature("autodoc", "	:param P:
	:type P: TopOpeBRep_VPointInter &
	:param Index:
	:type Index: Standard_Integer
	:param EdgeOrientation:
	:type EdgeOrientation: TopAbs_Orientation
	:rtype: TopOpeBRepDS_Transition
") ProcessLineTransition;
		static TopOpeBRepDS_Transition ProcessLineTransition (const TopOpeBRep_VPointInter & P,const Standard_Integer Index,const TopAbs_Orientation EdgeOrientation);
		%feature("autodoc", "	:param P:
	:type P: TopOpeBRep_VPointInter &
	:param L:
	:type L: TopOpeBRep_LineInter &
	:rtype: TopOpeBRepDS_Transition
") ProcessLineTransition;
		static TopOpeBRepDS_Transition ProcessLineTransition (const TopOpeBRep_VPointInter & P,const TopOpeBRep_LineInter & L);
		%feature("autodoc", "	:param P:
	:type P: TopOpeBRep_VPointInter &
	:param Index:
	:type Index: Standard_Integer
	:param LineOrientation:
	:type LineOrientation: TopAbs_Orientation
	:rtype: TopOpeBRepDS_Transition
") ProcessEdgeTransition;
		static TopOpeBRepDS_Transition ProcessEdgeTransition (const TopOpeBRep_VPointInter & P,const Standard_Integer Index,const TopAbs_Orientation LineOrientation);
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRep_LineInter &
	:param Index:
	:type Index: Standard_Integer
	:param FaceOrientation:
	:type FaceOrientation: TopAbs_Orientation
	:rtype: TopOpeBRepDS_Transition
") ProcessFaceTransition;
		static TopOpeBRepDS_Transition ProcessFaceTransition (const TopOpeBRep_LineInter & L,const Standard_Integer Index,const TopAbs_Orientation FaceOrientation);
		%feature("autodoc", "	* compute transition on 'IntPatch_Restriction line' edge <R> when crossing edge <E> of face <F> at point <VP>. VP is given on edge <E> of face <F> of index <Index> (1 or 2). <VP> has been classified by FacesFiller as TopAbs_ON an edge <R> of the other face than <F> of current (face/face) intersection. Transition depends on the orientation of E in F. This method should be provided by IntPatch_Line (NYI)

	:param VP:
	:type VP: TopOpeBRep_VPointInter &
	:param Index:
	:type Index: Standard_Integer
	:param R:
	:type R: TopoDS_Shape &
	:param E:
	:type E: TopoDS_Shape &
	:param F:
	:type F: TopoDS_Shape &
	:rtype: TopOpeBRepDS_Transition
") ProcessEdgeONTransition;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_FaceEdgeFiller;
		 TopOpeBRep_FaceEdgeFiller ();
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Shape &
	:param E:
	:type E: TopoDS_Shape &
	:param FEINT:
	:type FEINT: TopOpeBRep_FaceEdgeIntersector &
	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") Insert;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_FaceEdgeIntersector;
		 TopOpeBRep_FaceEdgeIntersector ();
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Shape &
	:param E:
	:type E: TopoDS_Shape &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & F,const TopoDS_Shape & E);
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	* returns intersected face or edge according to value of <Index> = 1 or 2

	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape (const Standard_Integer Index);
		%feature("autodoc", "	* Force the tolerance values used by the next Perform(S1,S2) call.

	:param tol:
	:type tol: float
	:rtype: None
") ForceTolerance;
		void ForceTolerance (const Standard_Real tol);
		%feature("autodoc", "	* Return the tolerance value used in the last Perform() call If ForceTolerance() has been called, return the given value. If not, return value extracted from shapes.

	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "	:rtype: None
") InitPoint;
		void InitPoint ();
		%feature("autodoc", "	:rtype: bool
") MorePoint;
		Standard_Boolean MorePoint ();
		%feature("autodoc", "	:rtype: None
") NextPoint;
		void NextPoint ();
		%feature("autodoc", "	* return the 3D point of the current intersection point.

	:rtype: gp_Pnt
") Value;
		gp_Pnt Value ();
		%feature("autodoc", "	* parametre de Value() sur l'arete

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "	* parametre de Value() sur la face

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") UVPoint;
		void UVPoint (gp_Pnt2d & P);
		%feature("autodoc", "	* IN ou ON / a la face. Les points OUT ne sont pas retournes.

	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("autodoc", "	* Index = 1 transition par rapport a la face, en cheminant sur l'arete

	:param Index:
	:type Index: Standard_Integer
	:param FaceOrientation:
	:type FaceOrientation: TopAbs_Orientation
	:rtype: TopOpeBRepDS_Transition
") Transition;
		TopOpeBRepDS_Transition Transition (const Standard_Integer Index,const TopAbs_Orientation FaceOrientation);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param V:
	:type V: TopoDS_Vertex &
	:rtype: bool
") IsVertex;
		Standard_Boolean IsVertex (const TopoDS_Shape & S,const gp_Pnt & P,const Standard_Real Tol,TopoDS_Vertex & V);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param V:
	:type V: TopoDS_Vertex &
	:rtype: bool
") IsVertex;
		Standard_Boolean IsVertex (const Standard_Integer I,TopoDS_Vertex & V);
		%feature("autodoc", "	* trace only

	:rtype: int
") Index;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_FacesFiller;
		 TopOpeBRep_FacesFiller ();
		%feature("autodoc", "	* Stores in <DS> the intersections of <S1> and <S2>.

	:param F1:
	:type F1: TopoDS_Shape &
	:param F2:
	:type F2: TopoDS_Shape &
	:param FACINT:
	:type FACINT: TopOpeBRep_FacesIntersector &
	:param HDS:
	:type HDS: Handle_TopOpeBRepDS_HDataStructure &
	:rtype: None
") Insert;
		void Insert (const TopoDS_Shape & F1,const TopoDS_Shape & F2,TopOpeBRep_FacesIntersector & FACINT,const Handle_TopOpeBRepDS_HDataStructure & HDS);
		%feature("autodoc", "	:rtype: None
") ProcessSectionEdges;
		void ProcessSectionEdges ();
		%feature("autodoc", "	:rtype: TopOpeBRep_PointClassifier
") ChangePointClassifier;
		TopOpeBRep_PointClassifier & ChangePointClassifier ();
		%feature("autodoc", "	* return field myPShapeClassifier.

	:rtype: TopOpeBRepTool_PShapeClassifier
") PShapeClassifier;
		TopOpeBRepTool_PShapeClassifier PShapeClassifier ();
		%feature("autodoc", "	* set field myPShapeClassifier.

	:param PSC:
	:type PSC: TopOpeBRepTool_PShapeClassifier &
	:rtype: None
") SetPShapeClassifier;
		void SetPShapeClassifier (const TopOpeBRepTool_PShapeClassifier & PSC);
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRep_LineInter &
	:rtype: None
") LoadLine;
		void LoadLine (TopOpeBRep_LineInter & L);
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRep_LineInter &
	:rtype: bool
") CheckLine;
		Standard_Boolean CheckLine (TopOpeBRep_LineInter & L);
		%feature("autodoc", "	* compute position of VPoints of lines

	:param FACINT:
	:type FACINT: TopOpeBRep_FacesIntersector &
	:rtype: None
") VP_Position;
		void VP_Position (TopOpeBRep_FacesIntersector & FACINT);
		%feature("autodoc", "	* compute position of VPoints of line L

	:param L:
	:type L: TopOpeBRep_LineInter &
	:rtype: None
") VP_Position;
		void VP_Position (TopOpeBRep_LineInter & L);
		%feature("autodoc", "	* compute position of VPoints of non-restriction line L.

	:param L:
	:type L: TopOpeBRep_LineInter &
	:rtype: None
") VP_PositionOnL;
		void VP_PositionOnL (TopOpeBRep_LineInter & L);
		%feature("autodoc", "	* compute position of VPoints of restriction line L.

	:param L:
	:type L: TopOpeBRep_LineInter &
	:rtype: None
") VP_PositionOnR;
		void VP_PositionOnR (TopOpeBRep_LineInter & L);
		%feature("autodoc", "	* compute position of VP with current faces, according to VP.ShapeIndex() .

	:param VP:
	:type VP: TopOpeBRep_VPointInter &
	:param VPC:
	:type VPC: TopOpeBRep_VPointInterClassifier &
	:rtype: None
") VP_Position;
		void VP_Position (TopOpeBRep_VPointInter & VP,TopOpeBRep_VPointInterClassifier & VPC);
		%feature("autodoc", "	* Process current intersection line (set by LoadLine)

	:rtype: None
") ProcessLine;
		void ProcessLine ();
		%feature("autodoc", "	:rtype: None
") ResetDSC;
		void ResetDSC ();
		%feature("autodoc", "	* Process current restriction line, adding restriction edge and computing face/edge interference.

	:rtype: None
") ProcessRLine;
		void ProcessRLine ();
		%feature("autodoc", "	* VP processing for restriction line and line sharing same domain with section edges :  - if restriction :  Adds restriction edges as section edges and compute face/edge interference.  - if same domain :  If line share same domain with section edges, compute parts of line IN/IN the two faces, and compute curve/point interference for VP boundaries.

	:rtype: None
") FillLineVPonR;
		void FillLineVPonR ();
		%feature("autodoc", "	:rtype: None
") FillLine;
		void FillLine ();
		%feature("autodoc", "	* compute 3d curve, pcurves and face/curve interferences for current NDSC. Add them to the DS.

	:rtype: None
") AddShapesLine;
		void AddShapesLine ();
		%feature("autodoc", "	* Get map <mapES > of restriction edges having parts IN one of the 2 faces.

	:param LES:
	:type LES: TopTools_ListOfShape &
	:rtype: None
") GetESL;
		void GetESL (TopTools_ListOfShape & LES);
		%feature("autodoc", "	* calling the followings ProcessVPIonR and ProcessVPonR.

	:param FF:
	:type FF: TopOpeBRep_FacesFiller &
	:param VP:
	:type VP: TopOpeBRep_VPointInter &
	:rtype: None
") ProcessVPR;
		void ProcessVPR (TopOpeBRep_FacesFiller & FF,const TopOpeBRep_VPointInter & VP);
		%feature("autodoc", "	* processing ProcessVPonR for VPI.

	:param VPI:
	:type VPI: TopOpeBRep_VPointInterIterator &
	:param trans1:
	:type trans1: TopOpeBRepDS_Transition &
	:param F1:
	:type F1: TopoDS_Shape &
	:param ShapeIndex:
	:type ShapeIndex: Standard_Integer
	:rtype: None
") ProcessVPIonR;
		void ProcessVPIonR (TopOpeBRep_VPointInterIterator & VPI,const TopOpeBRepDS_Transition & trans1,const TopoDS_Shape & F1,const Standard_Integer ShapeIndex);
		%feature("autodoc", "	* adds <VP>'s geometric point (if not stored) and computes (curve or edge)/(point or vertex) interference.

	:param VP:
	:type VP: TopOpeBRep_VPointInter &
	:param trans1:
	:type trans1: TopOpeBRepDS_Transition &
	:param F1:
	:type F1: TopoDS_Shape &
	:param ShapeIndex:
	:type ShapeIndex: Standard_Integer
	:rtype: None
") ProcessVPonR;
		void ProcessVPonR (const TopOpeBRep_VPointInter & VP,const TopOpeBRepDS_Transition & trans1,const TopoDS_Shape & F1,const Standard_Integer ShapeIndex);
		%feature("autodoc", "	* VP processing on closing arc.

	:param VP:
	:type VP: TopOpeBRep_VPointInter &
	:param F1:
	:type F1: TopoDS_Shape &
	:param ShapeIndex:
	:type ShapeIndex: Standard_Integer
	:param transEdge:
	:type transEdge: TopOpeBRepDS_Transition &
	:param PVKind:
	:type PVKind: TopOpeBRepDS_Kind
	:param PVIndex:
	:type PVIndex: Standard_Integer
	:param EPIfound:
	:type EPIfound: bool
	:param IEPI:
	:type IEPI: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") ProcessVPonclosingR;
		void ProcessVPonclosingR (const TopOpeBRep_VPointInter & VP,const TopoDS_Shape & F1,const Standard_Integer ShapeIndex,const TopOpeBRepDS_Transition & transEdge,const TopOpeBRepDS_Kind PVKind,const Standard_Integer PVIndex,const Standard_Boolean EPIfound,const Handle_TopOpeBRepDS_Interference & IEPI);
		%feature("autodoc", "	* VP processing on degenerated arc.

	:param VP:
	:type VP: TopOpeBRep_VPointInter &
	:param ShapeIndex:
	:type ShapeIndex: Standard_Integer
	:param PVKind:
	:type PVKind: TopOpeBRepDS_Kind &
	:param PVIndex:
	:type PVIndex: Standard_Integer &
	:param EPIfound:
	:type EPIfound: bool
	:param IEPI:
	:type IEPI: Handle_TopOpeBRepDS_Interference &
	:param CPIfound:
	:type CPIfound: bool
	:param ICPI:
	:type ICPI: Handle_TopOpeBRepDS_Interference &
	:rtype: bool
") ProcessVPondgE;
		Standard_Boolean ProcessVPondgE (const TopOpeBRep_VPointInter & VP,const Standard_Integer ShapeIndex,TopOpeBRepDS_Kind & PVKind,Standard_Integer &OutValue,Standard_Boolean & EPIfound,Handle_TopOpeBRepDS_Interference & IEPI,Standard_Boolean & CPIfound,Handle_TopOpeBRepDS_Interference & ICPI);
		%feature("autodoc", "	* processing ProcessVPnotonR for VPI.

	:param VPI:
	:type VPI: TopOpeBRep_VPointInterIterator &
	:rtype: None
") ProcessVPInotonR;
		void ProcessVPInotonR (TopOpeBRep_VPointInterIterator & VPI);
		%feature("autodoc", "	* adds <VP>'s geometrical point to the DS (if not stored) and computes curve point interference.

	:param VP:
	:type VP: TopOpeBRep_VPointInter &
	:rtype: None
") ProcessVPnotonR;
		void ProcessVPnotonR (const TopOpeBRep_VPointInter & VP);
		%feature("autodoc", "	* Get the geometry of a DS point <DSP>. Search for it with ScanInterfList (previous method). if found, set <G> to the geometry of the interference found. else, add the point <DSP> in the <DS> and set <G> to the value of the new geometry such created. returns the value of ScanInterfList().

	:param IT:
	:type IT: TopOpeBRepDS_ListIteratorOfListOfInterference &
	:param VP:
	:type VP: TopOpeBRep_VPointInter &
	:param G:
	:type G: Standard_Integer &
	:param K:
	:type K: TopOpeBRepDS_Kind &
	:rtype: bool
") GetGeometry;
		Standard_Boolean GetGeometry (TopOpeBRepDS_ListIteratorOfListOfInterference & IT,const TopOpeBRep_VPointInter & VP,Standard_Integer &OutValue,TopOpeBRepDS_Kind & K);
		%feature("autodoc", "	:param VP:
	:type VP: TopOpeBRep_VPointInter &
	:param ShapeIndex:
	:type ShapeIndex: Standard_Integer
	:param K:
	:type K: TopOpeBRepDS_Kind &
	:rtype: int
") MakeGeometry;
		Standard_Integer MakeGeometry (const TopOpeBRep_VPointInter & VP,const Standard_Integer ShapeIndex,TopOpeBRepDS_Kind & K);
		%feature("autodoc", "	* Add interference <I> to list myDSCIL. on a given line, at first call, add a new DS curve.

	:param I:
	:type I: Handle_TopOpeBRepDS_Interference &
	:rtype: None
") StoreCurveInterference;
		void StoreCurveInterference (const Handle_TopOpeBRepDS_Interference & I);
		%feature("autodoc", "	* search for G = geometry of Point which is identical to <DSP> among the DS Points created in the CURRENT face/face intersection ( current Insert() call).

	:param DSP:
	:type DSP: TopOpeBRepDS_Point &
	:param K:
	:type K: TopOpeBRepDS_Kind &
	:param G:
	:type G: Standard_Integer &
	:rtype: bool
") GetFFGeometry;
		Standard_Boolean GetFFGeometry (const TopOpeBRepDS_Point & DSP,TopOpeBRepDS_Kind & K,Standard_Integer &OutValue);
		%feature("autodoc", "	* search for G = geometry of Point which is identical to <VP> among the DS Points created in the CURRENT face/face intersection ( current Insert() call).

	:param VP:
	:type VP: TopOpeBRep_VPointInter &
	:param K:
	:type K: TopOpeBRepDS_Kind &
	:param G:
	:type G: Standard_Integer &
	:rtype: bool
") GetFFGeometry;
		Standard_Boolean GetFFGeometry (const TopOpeBRep_VPointInter & VP,TopOpeBRepDS_Kind & K,Standard_Integer &OutValue);
		%feature("autodoc", "	:rtype: TopOpeBRep_FacesIntersector
") ChangeFacesIntersector;
		TopOpeBRep_FacesIntersector & ChangeFacesIntersector ();
		%feature("autodoc", "	:rtype: Handle_TopOpeBRepDS_HDataStructure
") HDataStructure;
		Handle_TopOpeBRepDS_HDataStructure HDataStructure ();
		%feature("autodoc", "	:rtype: TopOpeBRepDS_DataStructure
") ChangeDataStructure;
		TopOpeBRepDS_DataStructure & ChangeDataStructure ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face (const Standard_Integer I);
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRep_LineInter &
	:param I:
	:type I: Standard_Integer
	:rtype: TopOpeBRepDS_Transition
") FaceFaceTransition;
		const TopOpeBRepDS_Transition & FaceFaceTransition (const TopOpeBRep_LineInter & L,const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopOpeBRepDS_Transition
") FaceFaceTransition;
		const TopOpeBRepDS_Transition & FaceFaceTransition (const Standard_Integer I);
		%feature("autodoc", "	:rtype: TopOpeBRep_PFacesIntersector
") PFacesIntersectorDummy;
		TopOpeBRep_PFacesIntersector PFacesIntersectorDummy ();
		%feature("autodoc", "	:rtype: TopOpeBRepDS_PDataStructure
") PDataStructureDummy;
		TopOpeBRepDS_PDataStructure PDataStructureDummy ();
		%feature("autodoc", "	:rtype: TopOpeBRep_PLineInter
") PLineInterDummy;
		TopOpeBRep_PLineInter PLineInterDummy ();
		%feature("autodoc", "	:param exF1:
	:type exF1: Standard_Integer
	:param exF2:
	:type exF2: Standard_Integer
	:rtype: None
") SetTraceIndex;
		void SetTraceIndex (const Standard_Integer exF1,const Standard_Integer exF2);
		%feature("autodoc", "	:param exF1:
	:type exF1: Standard_Integer &
	:param exF2:
	:type exF2: Standard_Integer &
	:rtype: None
") GetTraceIndex;
		void GetTraceIndex (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Computes <pmin> and <pmax> the upper and lower bounds of <L> enclosing all vpoints.

	:param L:
	:type L: TopOpeBRep_LineInter &
	:param pmin:
	:type pmin: float &
	:param pmax:
	:type pmax: float &
	:rtype: void
") Lminmax;
		static void Lminmax (const TopOpeBRep_LineInter & L,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns <True> if <L> shares a same geometric domain with at least one of the section edges of <ERL>.

	:param L:
	:type L: TopOpeBRep_LineInter &
	:param ERL:
	:type ERL: TopTools_ListOfShape &
	:rtype: bool
") LSameDomainERL;
		static Standard_Boolean LSameDomainERL (const TopOpeBRep_LineInter & L,const TopTools_ListOfShape & ERL);
		%feature("autodoc", "	* Computes the transition <T> of the VPoint <iVP> on the edge of <SI12>. Returns <False> if the status is unknown.

	:param L:
	:type L: TopOpeBRep_LineInter &
	:param iVP:
	:type iVP: Standard_Integer
	:param SI12:
	:type SI12: Standard_Integer
	:param T:
	:type T: TopOpeBRepDS_Transition &
	:rtype: bool
") IsVPtransLok;
		static Standard_Boolean IsVPtransLok (const TopOpeBRep_LineInter & L,const Standard_Integer iVP,const Standard_Integer SI12,TopOpeBRepDS_Transition & T);
		%feature("autodoc", "	* Computes transition on line for VP<iVP> on edge restriction of <SI>. If <isINOUT> : returns <true> if transition computed is IN/OUT else : returns <true> if transition computed is OUT/IN.

	:param L:
	:type L: TopOpeBRep_LineInter &
	:param iVP:
	:type iVP: Standard_Integer
	:param SI:
	:type SI: Standard_Integer
	:param isINOUT:
	:type isINOUT: bool
	:rtype: bool
") TransvpOK;
		static Standard_Boolean TransvpOK (const TopOpeBRep_LineInter & L,const Standard_Integer iVP,const Standard_Integer SI,const Standard_Boolean isINOUT);
		%feature("autodoc", "	* Returns parameter u of vp on the restriction edge.

	:param vp:
	:type vp: TopOpeBRep_VPointInter &
	:param Lrest:
	:type Lrest: TopOpeBRep_LineInter &
	:rtype: float
") VPParamOnER;
		static Standard_Real VPParamOnER (const TopOpeBRep_VPointInter & vp,const TopOpeBRep_LineInter & Lrest);
		%feature("autodoc", "	:param Lrest:
	:type Lrest: TopOpeBRep_LineInter &
	:param VP1:
	:type VP1: TopOpeBRep_VPointInter &
	:param VP2:
	:type VP2: TopOpeBRep_VPointInter &
	:rtype: bool
") EqualpPonR;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_FacesIntersector;
		 TopOpeBRep_FacesIntersector ();
		%feature("autodoc", "	* Computes the intersection of faces S1 and S2.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "	* Computes the intersection of faces S1 and S2.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param B1:
	:type B1: Bnd_Box &
	:param B2:
	:type B2: Bnd_Box &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Bnd_Box & B1,const Bnd_Box & B2);
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns True if Perform() arguments are two faces with the same surface.

	:rtype: bool
") SameDomain;
		Standard_Boolean SameDomain ();
		%feature("autodoc", "	* returns first or second intersected face.

	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Shape
") Face;
		const TopoDS_Shape  Face (const Standard_Integer Index);
		%feature("autodoc", "	* Returns True if Perform() arguments are two faces SameDomain() and normals on both side. Raise if SameDomain is False

	:rtype: bool
") SurfacesSameOriented;
		Standard_Boolean SurfacesSameOriented ();
		%feature("autodoc", "	* returns true if edge <E> is found as same as the edge associated with a RESTRICTION line.

	:param E:
	:type E: TopoDS_Shape &
	:rtype: bool
") IsRestriction;
		Standard_Boolean IsRestriction (const TopoDS_Shape & E);
		%feature("autodoc", "	* returns the map of edges found as TopeBRepBRep_RESTRICTION

	:rtype: TopTools_IndexedMapOfShape
") Restrictions;
		const TopTools_IndexedMapOfShape & Restrictions ();
		%feature("autodoc", "	:rtype: None
") PrepareLines;
		void PrepareLines ();
		%feature("autodoc", "	:rtype: Handle_TopOpeBRep_HArray1OfLineInter
") Lines;
		Handle_TopOpeBRep_HArray1OfLineInter Lines ();
		%feature("autodoc", "	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("autodoc", "	:rtype: None
") InitLine;
		void InitLine ();
		%feature("autodoc", "	:rtype: bool
") MoreLine;
		Standard_Boolean MoreLine ();
		%feature("autodoc", "	:rtype: None
") NextLine;
		void NextLine ();
		%feature("autodoc", "	:rtype: TopOpeBRep_LineInter
") CurrentLine;
		TopOpeBRep_LineInter & CurrentLine ();
		%feature("autodoc", "	:rtype: int
") CurrentLineIndex;
		Standard_Integer CurrentLineIndex ();
		%feature("autodoc", "	:param IL:
	:type IL: Standard_Integer
	:rtype: TopOpeBRep_LineInter
") ChangeLine;
		TopOpeBRep_LineInter & ChangeLine (const Standard_Integer IL);
		%feature("autodoc", "	* Force the tolerance values used by the next Perform(S1,S2) call.

	:param tolarc:
	:type tolarc: float
	:param toltang:
	:type toltang: float
	:rtype: None
") ForceTolerances;
		void ForceTolerances (const Standard_Real tolarc,const Standard_Real toltang);
		%feature("autodoc", "	* Return the tolerance values used in the last Perform() call If ForceTolerances() has been called, return the given values. If not, return values extracted from shapes.

	:param tolarc:
	:type tolarc: float &
	:param toltang:
	:type toltang: float &
	:rtype: None
") GetTolerances;
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
		%feature("autodoc", "	* Make the DS curve <C> and the pcurves <PC1,PC2> from intersection line <L> lying on shapes <S1,S2>. <min,max> = <L> bounds

	:param min:
	:type min: float
	:param max:
	:type max: float
	:param L:
	:type L: TopOpeBRep_LineInter &
	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param C:
	:type C: TopOpeBRepDS_Curve &
	:param PC1:
	:type PC1: Handle_Geom2d_Curve &
	:param PC2:
	:type PC2: Handle_Geom2d_Curve &
	:rtype: void
") MakeCurves;
		static void MakeCurves (const Standard_Real min,const Standard_Real max,const TopOpeBRep_LineInter & L,const TopoDS_Shape & S1,const TopoDS_Shape & S2,TopOpeBRepDS_Curve & C,Handle_Geom2d_Curve & PC1,Handle_Geom2d_Curve & PC2);
		%feature("autodoc", "	:param min:
	:type min: float
	:param max:
	:type max: float
	:param L:
	:type L: TopOpeBRep_LineInter &
	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: void
") MakeCurve;
		static void MakeCurve (const Standard_Real min,const Standard_Real max,const TopOpeBRep_LineInter & L,Handle_Geom_Curve & C);
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRep_LineInter &
	:rtype: Handle_Geom_Curve
") MakeBSpline1fromWALKING3d;
		static Handle_Geom_Curve MakeBSpline1fromWALKING3d (const TopOpeBRep_LineInter & L);
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRep_LineInter &
	:param SI:
	:type SI: Standard_Integer
	:rtype: Handle_Geom2d_Curve
") MakeBSpline1fromWALKING2d;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TopOpeBRep_HArray1OfLineInter;
		 TopOpeBRep_HArray1OfLineInter (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: TopOpeBRep_LineInter &
	:rtype: None
") TopOpeBRep_HArray1OfLineInter;
		 TopOpeBRep_HArray1OfLineInter (const Standard_Integer Low,const Standard_Integer Up,const TopOpeBRep_LineInter & V);
		%feature("autodoc", "	:param V:
	:type V: TopOpeBRep_LineInter &
	:rtype: None
") Init;
		void Init (const TopOpeBRep_LineInter & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: TopOpeBRep_LineInter &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopOpeBRep_LineInter & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopOpeBRep_LineInter
") Value;
		const TopOpeBRep_LineInter & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopOpeBRep_LineInter
") ChangeValue;
		TopOpeBRep_LineInter & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TopOpeBRep_Array1OfLineInter
") Array1;
		const TopOpeBRep_Array1OfLineInter & Array1 ();
		%feature("autodoc", "	:rtype: TopOpeBRep_Array1OfLineInter
") ChangeArray1;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TopOpeBRep_HArray1OfVPointInter;
		 TopOpeBRep_HArray1OfVPointInter (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: TopOpeBRep_VPointInter &
	:rtype: None
") TopOpeBRep_HArray1OfVPointInter;
		 TopOpeBRep_HArray1OfVPointInter (const Standard_Integer Low,const Standard_Integer Up,const TopOpeBRep_VPointInter & V);
		%feature("autodoc", "	:param V:
	:type V: TopOpeBRep_VPointInter &
	:rtype: None
") Init;
		void Init (const TopOpeBRep_VPointInter & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: TopOpeBRep_VPointInter &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopOpeBRep_VPointInter & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopOpeBRep_VPointInter
") Value;
		const TopOpeBRep_VPointInter & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopOpeBRep_VPointInter
") ChangeValue;
		TopOpeBRep_VPointInter & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TopOpeBRep_Array1OfVPointInter
") Array1;
		const TopOpeBRep_Array1OfVPointInter & Array1 ();
		%feature("autodoc", "	:rtype: TopOpeBRep_Array1OfVPointInter
") ChangeArray1;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_Hctxee2d;
		 TopOpeBRep_Hctxee2d ();
		%feature("autodoc", "	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:param BAS1:
	:type BAS1: BRepAdaptor_Surface &
	:param BAS2:
	:type BAS2: BRepAdaptor_Surface &
	:rtype: None
") SetEdges;
		void SetEdges (const TopoDS_Edge & E1,const TopoDS_Edge & E2,const BRepAdaptor_Surface & BAS1,const BRepAdaptor_Surface & BAS2);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") Edge;
		const TopoDS_Shape  Edge (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: Geom2dAdaptor_Curve
") Curve;
		const Geom2dAdaptor_Curve & Curve (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: IntRes2d_Domain
") Domain;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_Hctxff2d;
		 TopOpeBRep_Hctxff2d ();
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:rtype: None
") SetFaces;
		void SetFaces (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "	:param S1:
	:type S1: Handle_BRepAdaptor_HSurface &
	:param S2:
	:type S2: Handle_BRepAdaptor_HSurface &
	:rtype: None
") SetHSurfaces;
		void SetHSurfaces (const Handle_BRepAdaptor_HSurface & S1,const Handle_BRepAdaptor_HSurface & S2);
		%feature("autodoc", "	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") SetTolerances;
		void SetTolerances (const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "	:param Tol1:
	:type Tol1: float &
	:param Tol2:
	:type Tol2: float &
	:rtype: None
") GetTolerances;
		void GetTolerances (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: float
") GetMaxTolerance;
		Standard_Real GetMaxTolerance ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: Handle_BRepAdaptor_HSurface
") HSurface;
		Handle_BRepAdaptor_HSurface HSurface (const Standard_Integer I);
		%feature("autodoc", "	:rtype: bool
") SurfacesSameOriented;
		Standard_Boolean SurfacesSameOriented ();
		%feature("autodoc", "	:rtype: bool
") FacesSameOriented;
		Standard_Boolean FacesSameOriented ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: bool
") FaceSameOrientedWithRef;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_LineInter;
		 TopOpeBRep_LineInter ();
		%feature("autodoc", "	:param L:
	:type L: Handle_IntPatch_Line &
	:param S1:
	:type S1: BRepAdaptor_Surface &
	:param S2:
	:type S2: BRepAdaptor_Surface &
	:rtype: None
") SetLine;
		void SetLine (const Handle_IntPatch_Line & L,const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2);
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:rtype: None
") SetFaces;
		void SetFaces (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "	:rtype: TopOpeBRep_TypeLineCurve
") TypeLineCurve;
		TopOpeBRep_TypeLineCurve TypeLineCurve ();
		%feature("autodoc", "	:rtype: int
") NbVPoint;
		Standard_Integer NbVPoint ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopOpeBRep_VPointInter
") VPoint;
		const TopOpeBRep_VPointInter & VPoint (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopOpeBRep_VPointInter
") ChangeVPoint;
		TopOpeBRep_VPointInter & ChangeVPoint (const Standard_Integer I);
		%feature("autodoc", "	:rtype: None
") SetINL;
		void SetINL ();
		%feature("autodoc", "	:rtype: bool
") INL;
		Standard_Boolean INL ();
		%feature("autodoc", "	:rtype: None
") SetIsVClosed;
		void SetIsVClosed ();
		%feature("autodoc", "	:rtype: bool
") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") SetOK;
		void SetOK (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") OK;
		Standard_Boolean OK ();
		%feature("autodoc", "	:rtype: None
") SetHasVPonR;
		void SetHasVPonR ();
		%feature("autodoc", "	:rtype: bool
") HasVPonR;
		Standard_Boolean HasVPonR ();
		%feature("autodoc", "	:rtype: None
") SetVPBounds;
		void SetVPBounds ();
		%feature("autodoc", "	:param f:
	:type f: Standard_Integer &
	:param l:
	:type l: Standard_Integer &
	:param n:
	:type n: Standard_Integer &
	:rtype: None
") VPBounds;
		void VPBounds (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "	:rtype: float
") Period;
		Standard_Real Period ();
		%feature("autodoc", "	:param f:
	:type f: float &
	:param l:
	:type l: float &
	:rtype: None
") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: bool
") HasVInternal;
		Standard_Boolean HasVInternal ();
		%feature("autodoc", "	:rtype: int
") NbWPoint;
		Standard_Integer NbWPoint ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopOpeBRep_WPointInter
") WPoint;
		const TopOpeBRep_WPointInter & WPoint (const Standard_Integer I);
		%feature("autodoc", "	:rtype: IntSurf_TypeTrans
") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1 ();
		%feature("autodoc", "	:rtype: IntSurf_TypeTrans
") TransitionOnS2;
		IntSurf_TypeTrans TransitionOnS2 ();
		%feature("autodoc", "	:rtype: IntSurf_Situation
") SituationS1;
		IntSurf_Situation SituationS1 ();
		%feature("autodoc", "	:rtype: IntSurf_Situation
") SituationS2;
		IntSurf_Situation SituationS2 ();
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") Curve;
		Handle_Geom_Curve Curve ();
		%feature("autodoc", "	:param parmin:
	:type parmin: float
	:param parmax:
	:type parmax: float
	:rtype: Handle_Geom_Curve
") Curve;
		Handle_Geom_Curve Curve (const Standard_Real parmin,const Standard_Real parmax);
		%feature("autodoc", "	* returns the edge of a RESTRICTION line (or a null edge).

	:rtype: TopoDS_Shape
") Arc;
		const TopoDS_Shape  Arc ();
		%feature("autodoc", "	* returns true if Arc() edge (of a RESTRICTION line) is an edge of the original face <Index> (1 or 2).

	:param I:
	:type I: Standard_Integer
	:rtype: bool
") ArcIsEdge;
		Standard_Boolean ArcIsEdge (const Standard_Integer I);
		%feature("autodoc", "	:rtype: Handle_IntPatch_WLine
") LineW;
		const Handle_IntPatch_WLine & LineW ();
		%feature("autodoc", "	:rtype: Handle_IntPatch_GLine
") LineG;
		const Handle_IntPatch_GLine & LineG ();
		%feature("autodoc", "	:rtype: Handle_IntPatch_RLine
") LineR;
		const Handle_IntPatch_RLine & LineR ();
		%feature("autodoc", "	:rtype: bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("autodoc", "	:rtype: bool
") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("autodoc", "	:rtype: None
") ComputeFaceFaceTransition;
		void ComputeFaceFaceTransition ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopOpeBRepDS_Transition
") FaceFaceTransition;
		const TopOpeBRepDS_Transition & FaceFaceTransition (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: None
") Index;
		void Index (const Standard_Integer I);
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	:rtype: None
") DumpType;
		void DumpType ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param s1:
	:type s1: TCollection_AsciiString &
	:param s2:
	:type s2: TCollection_AsciiString &
	:rtype: None
") DumpVPoint;
		void DumpVPoint (const Standard_Integer I,const TCollection_AsciiString & s1,const TCollection_AsciiString & s2);
		%feature("autodoc", "	:param B:
	:type B: TopOpeBRep_Bipoint &
	:param s1:
	:type s1: TCollection_AsciiString &
	:param s2:
	:type s2: TCollection_AsciiString &
	:rtype: None
") DumpBipoint;
		void DumpBipoint (const TopOpeBRep_Bipoint & B,const TCollection_AsciiString & s1,const TCollection_AsciiString & s2);
		%feature("autodoc", "	:param exF1:
	:type exF1: Standard_Integer
	:param exF2:
	:type exF2: Standard_Integer
	:rtype: None
") SetTraceIndex;
		void SetTraceIndex (const Standard_Integer exF1,const Standard_Integer exF2);
		%feature("autodoc", "	:param exF1:
	:type exF1: Standard_Integer &
	:param exF2:
	:type exF2: Standard_Integer &
	:rtype: None
") GetTraceIndex;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_ListIteratorOfListOfBipoint;
		 TopOpeBRep_ListIteratorOfListOfBipoint ();
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRep_ListOfBipoint &
	:rtype: None
") TopOpeBRep_ListIteratorOfListOfBipoint;
		 TopOpeBRep_ListIteratorOfListOfBipoint (const TopOpeBRep_ListOfBipoint & L);
		%feature("autodoc", "	:param L:
	:type L: TopOpeBRep_ListOfBipoint &
	:rtype: None
") Initialize;
		void Initialize (const TopOpeBRep_ListOfBipoint & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: TopOpeBRep_Bipoint
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRep_Bipoint &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopOpeBRep_ListNodeOfListOfBipoint;
		 TopOpeBRep_ListNodeOfListOfBipoint (const TopOpeBRep_Bipoint & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopOpeBRep_Bipoint
") Value;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_ListOfBipoint;
		 TopOpeBRep_ListOfBipoint ();
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRep_ListOfBipoint &
	:rtype: None
") Assign;
		void Assign (const TopOpeBRep_ListOfBipoint & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRep_ListOfBipoint &
	:rtype: None
") operator=;
		void operator = (const TopOpeBRep_ListOfBipoint & Other);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRep_Bipoint &
	:rtype: None
") Prepend;
		void Prepend (const TopOpeBRep_Bipoint & I);
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRep_Bipoint &
	:param theIt:
	:type theIt: TopOpeBRep_ListIteratorOfListOfBipoint &
	:rtype: None
") Prepend;
		void Prepend (const TopOpeBRep_Bipoint & I,TopOpeBRep_ListIteratorOfListOfBipoint & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRep_ListOfBipoint &
	:rtype: None
") Prepend;
		void Prepend (TopOpeBRep_ListOfBipoint & Other);
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRep_Bipoint &
	:rtype: None
") Append;
		void Append (const TopOpeBRep_Bipoint & I);
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRep_Bipoint &
	:param theIt:
	:type theIt: TopOpeBRep_ListIteratorOfListOfBipoint &
	:rtype: None
") Append;
		void Append (const TopOpeBRep_Bipoint & I,TopOpeBRep_ListIteratorOfListOfBipoint & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRep_ListOfBipoint &
	:rtype: None
") Append;
		void Append (TopOpeBRep_ListOfBipoint & Other);
		%feature("autodoc", "	:rtype: TopOpeBRep_Bipoint
") First;
		TopOpeBRep_Bipoint & First ();
		%feature("autodoc", "	:rtype: TopOpeBRep_Bipoint
") Last;
		TopOpeBRep_Bipoint & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: TopOpeBRep_ListIteratorOfListOfBipoint &
	:rtype: None
") Remove;
		void Remove (TopOpeBRep_ListIteratorOfListOfBipoint & It);
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRep_Bipoint &
	:param It:
	:type It: TopOpeBRep_ListIteratorOfListOfBipoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const TopOpeBRep_Bipoint & I,TopOpeBRep_ListIteratorOfListOfBipoint & It);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRep_ListOfBipoint &
	:param It:
	:type It: TopOpeBRep_ListIteratorOfListOfBipoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (TopOpeBRep_ListOfBipoint & Other,TopOpeBRep_ListIteratorOfListOfBipoint & It);
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRep_Bipoint &
	:param It:
	:type It: TopOpeBRep_ListIteratorOfListOfBipoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const TopOpeBRep_Bipoint & I,TopOpeBRep_ListIteratorOfListOfBipoint & It);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRep_ListOfBipoint &
	:param It:
	:type It: TopOpeBRep_ListIteratorOfListOfBipoint &
	:rtype: None
") InsertAfter;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_Point2d;
		 TopOpeBRep_Point2d ();
		%feature("autodoc", "	:param ie1: default value is 0
	:type ie1: Standard_Integer
	:param ie2: default value is 0
	:type ie2: Standard_Integer
	:rtype: None
") Dump;
		void Dump (const Standard_Integer ie1 = 0,const Standard_Integer ie2 = 0);
		%feature("autodoc", "	:param P:
	:type P: IntRes2d_IntersectionPoint &
	:rtype: None
") SetPint;
		void SetPint (const IntRes2d_IntersectionPoint & P);
		%feature("autodoc", "	:rtype: bool
") HasPint;
		Standard_Boolean HasPint ();
		%feature("autodoc", "	:rtype: IntRes2d_IntersectionPoint
") Pint;
		const IntRes2d_IntersectionPoint & Pint ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param B:
	:type B: bool
	:rtype: None
") SetIsVertex;
		void SetIsVertex (const Standard_Integer I,const Standard_Boolean B);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: bool
") IsVertex;
		Standard_Boolean IsVertex (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") SetVertex;
		void SetVertex (const Standard_Integer I,const TopoDS_Vertex & V);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex  Vertex (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param T:
	:type T: TopOpeBRepDS_Transition &
	:rtype: None
") SetTransition;
		void SetTransition (const Standard_Integer I,const TopOpeBRepDS_Transition & T);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopOpeBRepDS_Transition
") Transition;
		const TopOpeBRepDS_Transition & Transition (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopOpeBRepDS_Transition
") ChangeTransition;
		TopOpeBRepDS_Transition & ChangeTransition (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param P:
	:type P: float
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Integer I,const Standard_Real P);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: float
") Parameter;
		Standard_Real Parameter (const Standard_Integer I);
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") SetIsPointOfSegment;
		void SetIsPointOfSegment (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") IsPointOfSegment;
		Standard_Boolean IsPointOfSegment ();
		%feature("autodoc", "	:param IP1:
	:type IP1: Standard_Integer
	:param IP2:
	:type IP2: Standard_Integer
	:rtype: None
") SetSegmentAncestors;
		void SetSegmentAncestors (const Standard_Integer IP1,const Standard_Integer IP2);
		%feature("autodoc", "	:param IP1:
	:type IP1: Standard_Integer &
	:param IP2:
	:type IP2: Standard_Integer &
	:rtype: bool
") SegmentAncestors;
		Standard_Boolean SegmentAncestors (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param S:
	:type S: TopOpeBRep_P2Dstatus
	:rtype: None
") SetStatus;
		void SetStatus (const TopOpeBRep_P2Dstatus S);
		%feature("autodoc", "	:rtype: TopOpeBRep_P2Dstatus
") Status;
		TopOpeBRep_P2Dstatus Status ();
		%feature("autodoc", "	:param X:
	:type X: Standard_Integer
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer X);
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & P);
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetValue2d;
		void SetValue2d (const gp_Pnt2d & P);
		%feature("autodoc", "	:rtype: gp_Pnt2d
") Value2d;
		const gp_Pnt2d  Value2d ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") SetKeep;
		void SetKeep (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Keep;
		Standard_Boolean Keep ();
		%feature("autodoc", "	:param C:
	:type C: TopOpeBRepDS_Config
	:rtype: None
") SetEdgesConfig;
		void SetEdgesConfig (const TopOpeBRepDS_Config C);
		%feature("autodoc", "	:rtype: TopOpeBRepDS_Config
") EdgesConfig;
		TopOpeBRepDS_Config EdgesConfig ();
		%feature("autodoc", "	:param T:
	:type T: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real T);
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	:param ff2d:
	:type ff2d: Handle_TopOpeBRep_Hctxff2d &
	:rtype: None
") SetHctxff2d;
		void SetHctxff2d (const Handle_TopOpeBRep_Hctxff2d & ff2d);
		%feature("autodoc", "	:rtype: Handle_TopOpeBRep_Hctxff2d
") Hctxff2d;
		Handle_TopOpeBRep_Hctxff2d Hctxff2d ();
		%feature("autodoc", "	:param ee2d:
	:type ee2d: Handle_TopOpeBRep_Hctxee2d &
	:rtype: None
") SetHctxee2d;
		void SetHctxee2d (const Handle_TopOpeBRep_Hctxee2d & ee2d);
		%feature("autodoc", "	:rtype: Handle_TopOpeBRep_Hctxee2d
") Hctxee2d;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_PointClassifier;
		 TopOpeBRep_PointClassifier ();
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Load;
		void Load (const TopoDS_Face & F);
		%feature("autodoc", "	* compute position of point <P> regarding with the face <F>.

	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: TopAbs_State
") Classify;
		TopAbs_State Classify (const TopoDS_Face & F,const gp_Pnt2d & P,const Standard_Real Tol);
		%feature("autodoc", "	:rtype: TopAbs_State
") State;
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
		%feature("autodoc", "	:param IP:
	:type IP: TopOpeBRep_VPointInter &
	:rtype: TopOpeBRepDS_Point
") MakePoint;
		static TopOpeBRepDS_Point MakePoint (const TopOpeBRep_VPointInter & IP);
		%feature("autodoc", "	:param P2D:
	:type P2D: TopOpeBRep_Point2d &
	:rtype: TopOpeBRepDS_Point
") MakePoint;
		static TopOpeBRepDS_Point MakePoint (const TopOpeBRep_Point2d & P2D);
		%feature("autodoc", "	:param FEI:
	:type FEI: TopOpeBRep_FaceEdgeIntersector &
	:rtype: TopOpeBRepDS_Point
") MakePoint;
		static TopOpeBRepDS_Point MakePoint (const TopOpeBRep_FaceEdgeIntersector & FEI);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopOpeBRepDS_Point
") MakePoint;
		static TopOpeBRepDS_Point MakePoint (const TopoDS_Shape & S);
		%feature("autodoc", "	:param DSP1:
	:type DSP1: TopOpeBRepDS_Point &
	:param DSP2:
	:type DSP2: TopOpeBRepDS_Point &
	:rtype: bool
") IsEqual;
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
		%feature("autodoc", "	:param I:
	:type I: TopOpeBRep_Point2d &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TopOpeBRep_SequenceNodeOfSequenceOfPoint2d;
		 TopOpeBRep_SequenceNodeOfSequenceOfPoint2d (const TopOpeBRep_Point2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: TopOpeBRep_Point2d
") Value;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_SequenceOfPoint2d;
		 TopOpeBRep_SequenceOfPoint2d ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRep_SequenceOfPoint2d &
	:rtype: TopOpeBRep_SequenceOfPoint2d
") Assign;
		const TopOpeBRep_SequenceOfPoint2d & Assign (const TopOpeBRep_SequenceOfPoint2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopOpeBRep_SequenceOfPoint2d &
	:rtype: TopOpeBRep_SequenceOfPoint2d
") operator=;
		const TopOpeBRep_SequenceOfPoint2d & operator = (const TopOpeBRep_SequenceOfPoint2d & Other);
		%feature("autodoc", "	:param T:
	:type T: TopOpeBRep_Point2d &
	:rtype: None
") Append;
		void Append (const TopOpeBRep_Point2d & T);
		%feature("autodoc", "	:param S:
	:type S: TopOpeBRep_SequenceOfPoint2d &
	:rtype: None
") Append;
		void Append (TopOpeBRep_SequenceOfPoint2d & S);
		%feature("autodoc", "	:param T:
	:type T: TopOpeBRep_Point2d &
	:rtype: None
") Prepend;
		void Prepend (const TopOpeBRep_Point2d & T);
		%feature("autodoc", "	:param S:
	:type S: TopOpeBRep_SequenceOfPoint2d &
	:rtype: None
") Prepend;
		void Prepend (TopOpeBRep_SequenceOfPoint2d & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: TopOpeBRep_Point2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TopOpeBRep_Point2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: TopOpeBRep_SequenceOfPoint2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TopOpeBRep_SequenceOfPoint2d & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: TopOpeBRep_Point2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TopOpeBRep_Point2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: TopOpeBRep_SequenceOfPoint2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TopOpeBRep_SequenceOfPoint2d & S);
		%feature("autodoc", "	:rtype: TopOpeBRep_Point2d
") First;
		const TopOpeBRep_Point2d & First ();
		%feature("autodoc", "	:rtype: TopOpeBRep_Point2d
") Last;
		const TopOpeBRep_Point2d & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: TopOpeBRep_SequenceOfPoint2d &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TopOpeBRep_SequenceOfPoint2d & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopOpeBRep_Point2d
") Value;
		const TopOpeBRep_Point2d & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: TopOpeBRep_Point2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopOpeBRep_Point2d & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopOpeBRep_Point2d
") ChangeValue;
		TopOpeBRep_Point2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_ShapeIntersector;
		 TopOpeBRep_ShapeIntersector ();
		%feature("autodoc", "	* Initialize the intersection of shapes S1,S2.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") InitIntersection;
		void InitIntersection (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "	* Initialize the intersection of shapes S1,S2.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:rtype: None
") InitIntersection;
		void InitIntersection (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "	* return the shape <Index> ( = 1 or 2) given to InitIntersection(). Index = 1 will return S1, Index = 2 will return S2.

	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape (const Standard_Integer Index);
		%feature("autodoc", "	* returns True if there are more intersection between two the shapes.

	:rtype: bool
") MoreIntersection;
		Standard_Boolean MoreIntersection ();
		%feature("autodoc", "	* search for the next intersection between the two shapes.

	:rtype: None
") NextIntersection;
		void NextIntersection ();
		%feature("autodoc", "	* return the current intersection of two Faces.

	:rtype: TopOpeBRep_FacesIntersector
") ChangeFacesIntersector;
		TopOpeBRep_FacesIntersector & ChangeFacesIntersector ();
		%feature("autodoc", "	* return the current intersection of two Edges.

	:rtype: TopOpeBRep_EdgesIntersector
") ChangeEdgesIntersector;
		TopOpeBRep_EdgesIntersector & ChangeEdgesIntersector ();
		%feature("autodoc", "	* return the current intersection of a Face and an Edge.

	:rtype: TopOpeBRep_FaceEdgeIntersector
") ChangeFaceEdgeIntersector;
		TopOpeBRep_FaceEdgeIntersector & ChangeFaceEdgeIntersector ();
		%feature("autodoc", "	* return geometric shape <Index> ( = 1 or 2 ) of current intersection.

	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Shape
") CurrentGeomShape;
		const TopoDS_Shape  CurrentGeomShape (const Standard_Integer Index);
		%feature("autodoc", "	* return MAX of intersection tolerances with which FacesIntersector from TopOpeBRep was working.

	:param tol1:
	:type tol1: float &
	:param tol2:
	:type tol2: float &
	:rtype: None
") GetTolerances;
		void GetTolerances (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer
	:rtype: None
") DumpCurrent;
		void DumpCurrent (const Standard_Integer K);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer
	:rtype: int
") Index;
		Standard_Integer Index (const Standard_Integer K);
		%feature("autodoc", "	:param anObj:
	:type anObj: TopoDS_Shape &
	:param aReference:
	:type aReference: TopoDS_Shape &
	:param aListOfShape:
	:type aListOfShape: TopTools_ListOfShape &
	:rtype: None
") RejectedFaces;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_ShapeIntersector2d;
		 TopOpeBRep_ShapeIntersector2d ();
		%feature("autodoc", "	* Initialize the intersection of shapes S1,S2.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") InitIntersection;
		void InitIntersection (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "	* return the shape <Index> ( = 1 or 2) given to InitIntersection(). Index = 1 will return S1, Index = 2 will return S2.

	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape (const Standard_Integer Index);
		%feature("autodoc", "	* returns True if there are more intersection between two the shapes.

	:rtype: bool
") MoreIntersection;
		Standard_Boolean MoreIntersection ();
		%feature("autodoc", "	* search for the next intersection between the two shapes.

	:rtype: None
") NextIntersection;
		void NextIntersection ();
		%feature("autodoc", "	* return the current intersection of two Edges.

	:rtype: TopOpeBRep_EdgesIntersector
") ChangeEdgesIntersector;
		TopOpeBRep_EdgesIntersector & ChangeEdgesIntersector ();
		%feature("autodoc", "	* return geometric shape <Index> ( = 1 or 2 ) of current intersection.

	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Shape
") CurrentGeomShape;
		const TopoDS_Shape  CurrentGeomShape (const Standard_Integer Index);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer
	:rtype: None
") DumpCurrent;
		void DumpCurrent (const Standard_Integer K);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer
	:rtype: int
") Index;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_ShapeScanner;
		 TopOpeBRep_ShapeScanner ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param TS:
	:type TS: TopAbs_ShapeEnum
	:param TA: default value is TopAbs_SHAPE
	:type TA: TopAbs_ShapeEnum
	:rtype: None
") AddBoxesMakeCOB;
		void AddBoxesMakeCOB (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & E);
		%feature("autodoc", "	:param X:
	:type X: TopOpeBRepTool_ShapeExplorer &
	:rtype: None
") Init;
		void Init (TopOpeBRepTool_ShapeExplorer & X);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Current;
		const TopoDS_Shape  Current ();
		%feature("autodoc", "	:rtype: TopOpeBRepTool_BoxSort
") BoxSort;
		const TopOpeBRepTool_BoxSort & BoxSort ();
		%feature("autodoc", "	:rtype: TopOpeBRepTool_BoxSort
") ChangeBoxSort;
		TopOpeBRepTool_BoxSort & ChangeBoxSort ();
		%feature("autodoc", "	:rtype: int
") Index;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_VPointInter;
		 TopOpeBRep_VPointInter ();
		%feature("autodoc", "	:param P:
	:type P: IntPatch_Point &
	:rtype: None
") SetPoint;
		void SetPoint (const IntPatch_Point & P);
		%feature("autodoc", "	:param I1:
	:type I1: Standard_Integer
	:param I2:
	:type I2: Standard_Integer
	:rtype: None
") SetShapes;
		void SetShapes (const Standard_Integer I1,const Standard_Integer I2);
		%feature("autodoc", "	:param I1:
	:type I1: Standard_Integer &
	:param I2:
	:type I2: Standard_Integer &
	:rtype: None
") GetShapes;
		void GetShapes (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:rtype: IntSurf_Transition
") TransitionOnS1;
		IntSurf_Transition TransitionOnS1 ();
		%feature("autodoc", "	:rtype: IntSurf_Transition
") TransitionOnS2;
		IntSurf_Transition TransitionOnS2 ();
		%feature("autodoc", "	:rtype: IntSurf_Transition
") TransitionLineArc1;
		IntSurf_Transition TransitionLineArc1 ();
		%feature("autodoc", "	:rtype: IntSurf_Transition
") TransitionLineArc2;
		IntSurf_Transition TransitionLineArc2 ();
		%feature("autodoc", "	:rtype: bool
") IsOnDomS1;
		Standard_Boolean IsOnDomS1 ();
		%feature("autodoc", "	:rtype: bool
") IsOnDomS2;
		Standard_Boolean IsOnDomS2 ();
		%feature("autodoc", "	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:rtype: None
") ParametersOnS1;
		void ParametersOnS1 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:rtype: None
") ParametersOnS2;
		void ParametersOnS2 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") ArcOnS1;
		const TopoDS_Shape  ArcOnS1 ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") ArcOnS2;
		const TopoDS_Shape  ArcOnS2 ();
		%feature("autodoc", "	:rtype: float
") ParameterOnLine;
		Standard_Real ParameterOnLine ();
		%feature("autodoc", "	:rtype: float
") ParameterOnArc1;
		Standard_Real ParameterOnArc1 ();
		%feature("autodoc", "	* Returns True if the point is a vertex on the initial restriction facet of the first surface.

	:rtype: bool
") IsVertexOnS1;
		Standard_Boolean IsVertexOnS1 ();
		%feature("autodoc", "	* Returns the information about the point when it is on the domain of the first patch, i-e when the function IsVertexOnS1 returns True. Otherwise, an exception is raised.

	:rtype: TopoDS_Shape
") VertexOnS1;
		const TopoDS_Shape  VertexOnS1 ();
		%feature("autodoc", "	:rtype: float
") ParameterOnArc2;
		Standard_Real ParameterOnArc2 ();
		%feature("autodoc", "	* Returns True if the point is a vertex on the initial restriction facet of the second surface.

	:rtype: bool
") IsVertexOnS2;
		Standard_Boolean IsVertexOnS2 ();
		%feature("autodoc", "	* Returns the information about the point when it is on the domain of the second patch, i-e when the function IsVertexOnS2 returns True. Otherwise, an exception is raised.

	:rtype: TopoDS_Shape
") VertexOnS2;
		const TopoDS_Shape  VertexOnS2 ();
		%feature("autodoc", "	:rtype: bool
") IsInternal;
		Standard_Boolean IsInternal ();
		%feature("autodoc", "	* Returns True if the point belongs to several intersection lines.

	:rtype: bool
") IsMultiple;
		Standard_Boolean IsMultiple ();
		%feature("autodoc", "	* get state of VPoint within the domain of geometric shape domain <I> (= 1 or 2).

	:param I:
	:type I: Standard_Integer
	:rtype: TopAbs_State
") State;
		TopAbs_State State (const Standard_Integer I);
		%feature("autodoc", "	* Set the state of VPoint within the domain of the geometric shape <I> (= 1 or 2).

	:param S:
	:type S: TopAbs_State
	:param I:
	:type I: Standard_Integer
	:rtype: None
") State;
		void State (const TopAbs_State S,const Standard_Integer I);
		%feature("autodoc", "	* set the shape Eon of shape I (1,2) containing the point, and parameter <Par> of point on <Eon>.

	:param Eon:
	:type Eon: TopoDS_Shape &
	:param Par:
	:type Par: float
	:param I:
	:type I: Standard_Integer
	:rtype: None
") EdgeON;
		void EdgeON (const TopoDS_Shape & Eon,const Standard_Real Par,const Standard_Integer I);
		%feature("autodoc", "	* get the edge of shape I (1,2) containing the point.

	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") EdgeON;
		const TopoDS_Shape  EdgeON (const Standard_Integer I);
		%feature("autodoc", "	* get the parameter on edge of shape I (1,2) containing the point.

	:param I:
	:type I: Standard_Integer
	:rtype: float
") EdgeONParameter;
		Standard_Real EdgeONParameter (const Standard_Integer I);
		%feature("autodoc", "	* returns value of filed myShapeIndex = 0,1,2,3 0 means the VPoint is on no restriction 1 means the VPoint is on the restriction 1 2 means the VPoint is on the restriction 2 3 means the VPoint is on the restrictions 1 and 2

	:rtype: int
") ShapeIndex;
		Standard_Integer ShapeIndex ();
		%feature("autodoc", "	* set value of shape supporting me (0,1,2,3).

	:param I:
	:type I: Standard_Integer
	:rtype: None
") ShapeIndex;
		void ShapeIndex (const Standard_Integer I);
		%feature("autodoc", "	* get the edge of shape I (1,2) containing the point. Returned shape is null if the VPoint is not on an edge of shape I (1,2).

	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") Edge;
		const TopoDS_Shape  Edge (const Standard_Integer I);
		%feature("autodoc", "	* get the parameter on edge of shape I (1,2) containing the point

	:param I:
	:type I: Standard_Integer
	:rtype: float
") EdgeParameter;
		Standard_Real EdgeParameter (const Standard_Integer I);
		%feature("autodoc", "	* get the parameter on surface of shape I (1,2) containing the point

	:param I:
	:type I: Standard_Integer
	:rtype: gp_Pnt2d
") SurfaceParameters;
		gp_Pnt2d SurfaceParameters (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: bool
") IsVertex;
		Standard_Boolean IsVertex (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") Vertex;
		const TopoDS_Shape  Vertex (const Standard_Integer I);
		%feature("autodoc", "	* set myKeep value according to current states.

	:rtype: None
") UpdateKeep;
		void UpdateKeep ();
		%feature("autodoc", "	* Returns value of myKeep (does not evaluate states) False at creation of VPoint. Updated by State(State from TopAbs,Integer from Standard)

	:rtype: bool
") Keep;
		Standard_Boolean Keep ();
		%feature("autodoc", "	* updates VPointInter flag 'keep' with <keep>.

	:param keep:
	:type keep: bool
	:rtype: None
") ChangeKeep;
		void ChangeKeep (const Standard_Boolean keep);
		%feature("autodoc", "	* returns <True> if the 3d points and the parameters of the VPoints are same

	:param VP:
	:type VP: TopOpeBRep_VPointInter &
	:rtype: bool
") EqualpP;
		Standard_Boolean EqualpP (const TopOpeBRep_VPointInter & VP);
		%feature("autodoc", "	* returns <false> if the vpoint is not given on arc <E>, else returns <par> parameter on <E>

	:param E:
	:type E: TopoDS_Edge &
	:param par:
	:type par: float &
	:rtype: bool
") ParonE;
		Standard_Boolean ParonE (const TopoDS_Edge & E,Standard_Real &OutValue);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: None
") Index;
		void Index (const Standard_Integer I);
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param F:
	:type F: TopoDS_Face &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: Standard_OStream
") Dump;
		Standard_OStream & Dump (const Standard_Integer I,const TopoDS_Face & F,Standard_OStream & OS);
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: Standard_OStream
") Dump;
		Standard_OStream & Dump (const TopoDS_Face & F1,const TopoDS_Face & F2,Standard_OStream & OS);
		%feature("autodoc", "	:rtype: TopOpeBRep_PThePointOfIntersection
") PThePointOfIntersectionDummy;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_VPointInterClassifier;
		 TopOpeBRep_VPointInterClassifier ();
		%feature("autodoc", "	* compute position of VPoint <VP> regarding with face <F>. <ShapeIndex> (= 1,2) indicates which (u,v) point of <VP> is used. when state is ON, set VP.EdgeON() with the edge containing <VP> and associated parameter. returns state of VP on ShapeIndex.

	:param F:
	:type F: TopoDS_Shape &
	:param VP:
	:type VP: TopOpeBRep_VPointInter &
	:param ShapeIndex:
	:type ShapeIndex: Standard_Integer
	:param PC:
	:type PC: TopOpeBRep_PointClassifier &
	:param AssumeINON:
	:type AssumeINON: bool
	:param Tol:
	:type Tol: float
	:rtype: TopAbs_State
") VPointPosition;
		TopAbs_State VPointPosition (const TopoDS_Shape & F,TopOpeBRep_VPointInter & VP,const Standard_Integer ShapeIndex,TopOpeBRep_PointClassifier & PC,const Standard_Boolean AssumeINON,const Standard_Real Tol);
		%feature("autodoc", "	* returns the edge containing the VPoint <VP> used in the last VPointPosition() call. Edge is defined if the state previously computed is ON, else Edge is a null shape.

	:rtype: TopoDS_Shape
") Edge;
		const TopoDS_Shape  Edge ();
		%feature("autodoc", "	* returns the parameter of the VPoint <VP> on Edge()

	:rtype: float
") EdgeParameter;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_VPointInterIterator;
		 TopOpeBRep_VPointInterIterator ();
		%feature("autodoc", "	:param LI:
	:type LI: TopOpeBRep_LineInter &
	:rtype: None
") TopOpeBRep_VPointInterIterator;
		 TopOpeBRep_VPointInterIterator (const TopOpeBRep_LineInter & LI);
		%feature("autodoc", "	:param LI:
	:type LI: TopOpeBRep_LineInter &
	:param checkkeep: default value is Standard_False
	:type checkkeep: bool
	:rtype: None
") Init;
		void Init (const TopOpeBRep_LineInter & LI,const Standard_Boolean checkkeep = Standard_False);
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: TopOpeBRep_VPointInter
") CurrentVP;
		const TopOpeBRep_VPointInter & CurrentVP ();
		%feature("autodoc", "	:rtype: int
") CurrentVPIndex;
		Standard_Integer CurrentVPIndex ();
		%feature("autodoc", "	:rtype: TopOpeBRep_VPointInter
") ChangeCurrentVP;
		TopOpeBRep_VPointInter & ChangeCurrentVP ();
		%feature("autodoc", "	:rtype: TopOpeBRep_PLineInter
") PLineInterDummy;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_WPointInter;
		 TopOpeBRep_WPointInter ();
		%feature("autodoc", "	:param P:
	:type P: IntSurf_PntOn2S &
	:rtype: None
") Set;
		void Set (const IntSurf_PntOn2S & P);
		%feature("autodoc", "	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") ParametersOnS1;
		void ParametersOnS1 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") ParametersOnS2;
		void ParametersOnS2 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param U1:
	:type U1: float &
	:param V1:
	:type V1: float &
	:param U2:
	:type U2: float &
	:param V2:
	:type V2: float &
	:rtype: None
") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: gp_Pnt2d
") ValueOnS1;
		gp_Pnt2d ValueOnS1 ();
		%feature("autodoc", "	:rtype: gp_Pnt2d
") ValueOnS2;
		gp_Pnt2d ValueOnS2 ();
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("autodoc", "	:rtype: TopOpeBRep_PPntOn2S
") PPntOn2SDummy;
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
		%feature("autodoc", "	:rtype: None
") TopOpeBRep_WPointInterIterator;
		 TopOpeBRep_WPointInterIterator ();
		%feature("autodoc", "	:param LI:
	:type LI: TopOpeBRep_LineInter &
	:rtype: None
") TopOpeBRep_WPointInterIterator;
		 TopOpeBRep_WPointInterIterator (const TopOpeBRep_LineInter & LI);
		%feature("autodoc", "	:param LI:
	:type LI: TopOpeBRep_LineInter &
	:rtype: None
") Init;
		void Init (const TopOpeBRep_LineInter & LI);
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: TopOpeBRep_WPointInter
") CurrentWP;
		const TopOpeBRep_WPointInter & CurrentWP ();
		%feature("autodoc", "	:rtype: TopOpeBRep_PLineInter
") PLineInterDummy;
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
