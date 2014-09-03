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
%module (package="OCC") BRepCheck

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

%include BRepCheck_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum BRepCheck_Status {
	BRepCheck_NoError = 0,
	BRepCheck_InvalidPointOnCurve = 1,
	BRepCheck_InvalidPointOnCurveOnSurface = 2,
	BRepCheck_InvalidPointOnSurface = 3,
	BRepCheck_No3DCurve = 4,
	BRepCheck_Multiple3DCurve = 5,
	BRepCheck_Invalid3DCurve = 6,
	BRepCheck_NoCurveOnSurface = 7,
	BRepCheck_InvalidCurveOnSurface = 8,
	BRepCheck_InvalidCurveOnClosedSurface = 9,
	BRepCheck_InvalidSameRangeFlag = 10,
	BRepCheck_InvalidSameParameterFlag = 11,
	BRepCheck_InvalidDegeneratedFlag = 12,
	BRepCheck_FreeEdge = 13,
	BRepCheck_InvalidMultiConnexity = 14,
	BRepCheck_InvalidRange = 15,
	BRepCheck_EmptyWire = 16,
	BRepCheck_RedundantEdge = 17,
	BRepCheck_SelfIntersectingWire = 18,
	BRepCheck_NoSurface = 19,
	BRepCheck_InvalidWire = 20,
	BRepCheck_RedundantWire = 21,
	BRepCheck_IntersectingWires = 22,
	BRepCheck_InvalidImbricationOfWires = 23,
	BRepCheck_EmptyShell = 24,
	BRepCheck_RedundantFace = 25,
	BRepCheck_UnorientableShape = 26,
	BRepCheck_NotClosed = 27,
	BRepCheck_NotConnected = 28,
	BRepCheck_SubshapeNotInShape = 29,
	BRepCheck_BadOrientation = 30,
	BRepCheck_BadOrientationOfSubshape = 31,
	BRepCheck_InvalidToleranceValue = 32,
	BRepCheck_CheckFail = 33,
};

/* end public enums declaration */

%rename(brepcheck) BRepCheck;
%nodefaultctor BRepCheck;
class BRepCheck {
	public:
		%feature("autodoc", "Args:
	List(BRepCheck_ListOfStatus)
	Stat(BRepCheck_Status)

Returns:
	static void

No detailed docstring for this function.") Add;
		static void Add (BRepCheck_ListOfStatus & List,const BRepCheck_Status Stat);
		%feature("autodoc", "Args:
	Stat(BRepCheck_Status)
	OS(Standard_OStream)

Returns:
	static void

No detailed docstring for this function.") Print;
		static void Print (const BRepCheck_Status Stat,Standard_OStream & OS);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	F(TopoDS_Face)
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") SelfIntersection;
		static Standard_Boolean SelfIntersection (const TopoDS_Wire & W,const TopoDS_Face & F,TopoDS_Edge & E1,TopoDS_Edge & E2);
};


%feature("shadow") BRepCheck::~BRepCheck %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepCheck_Analyzer;
class BRepCheck_Analyzer {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	GeomControls(Standard_Boolean)=Standard_True

Returns:
	None

Constructs a shape validation object defined by the shape S.  
   <S> is the  shape  to control.  <GeomControls>  If  
         False   only topological informaions  are checked.  
         The geometricals controls are  
         For a Vertex :  
         BRepCheck_InvalidToleranceValue  NYI  
         For an Edge :  
         BRepCheck_InvalidCurveOnClosedSurface,  
         BRepCheck_InvalidCurveOnSurface,  
         BRepCheck_InvalidSameParameterFlag,  
         BRepCheck_InvalidToleranceValue  NYI  
         For a face :  
         BRepCheck_UnorientableShape,  
         BRepCheck_IntersectingWires,  
         BRepCheck_InvalidToleranceValue  NYI  
         For a wire :  
         BRepCheck_SelfIntersectingWire") BRepCheck_Analyzer;
		 BRepCheck_Analyzer (const TopoDS_Shape & S,const Standard_Boolean GeomControls = Standard_True);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	GeomControls(Standard_Boolean)=Standard_True

Returns:
	None

<S> is the  shape  to control.  <GeomControls>  If  
         False   only topological informaions  are checked.  
         The geometricals controls are  
         For a Vertex :  
         BRepCheck_InvalidTolerance  NYI  
         For an Edge :  
         BRepCheck_InvalidCurveOnClosedSurface,  
         BRepCheck_InvalidCurveOnSurface,  
         BRepCheck_InvalidSameParameterFlag,  
         BRepCheck_InvalidTolerance  NYI  
         For a face :  
         BRepCheck_UnorientableShape,  
         BRepCheck_IntersectingWires,  
         BRepCheck_InvalidTolerance  NYI  
         For a wire :  
         BRepCheck_SelfIntersectingWire") Init;
		void Init (const TopoDS_Shape & S,const Standard_Boolean GeomControls = Standard_True);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Boolean

<S> is a  subshape of the  original shape. Returns  
         <STandard_True> if no default has been detected on  
         <S> and any of its subshape.") IsValid;
		Standard_Boolean IsValid (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if no defect is  
detected on the shape S or any of its subshapes.  
Returns true if the shape S is valid.  
This function checks whether a given shape is valid by checking that:  
-      the topology is correct  
-      parameterization of edges in particular is correct.  
For the topology to be correct, the following conditions must be satisfied:  
-      edges should have at least two vertices if they are not  
   degenerate edges. The vertices should be within the range of  
 the bounding edges at the tolerance specified in the vertex,  
-      edges should share at least one face. The representation of  
 the edges should be within the tolerance criterion assigned to them.  
-      wires defining a face should not self-intersect and should be closed,  
- there should be one wire which contains all other wires inside a face,  
-      wires should be correctly oriented with respect to each of the edges,  
-      faces should be correctly oriented, in particular with  
   respect to adjacent faces if these faces define a solid,  
-      shells defining a solid should be closed. There should  
   be one enclosing shell if the shape is a solid;  
   To check parameterization of edge, there are 2 approaches depending on  
   the edge?s contextual situation.  
-      if the edge is either single, or it is in the context  
   of a wire or a compound, its parameterization is defined by  
   the parameterization of its 3D curve and is considered as    valid.  
-      If the edge is in the context of a face, it should  
   have SameParameter and SameRange flags set to Standard_True. To  
   check these flags, you should call the function  
   BRep_Tool::SameParameter and BRep_Tool::SameRange for an  
   edge. If at least one of these flags is set to Standard_False,  
   the edge is considered as invalid without any additional check.  
   If the edge is contained by a face, and it has SameParameter and  
   SameRange flags set to Standard_True, IsValid checks  
   whether representation of the edge on face, in context of which the  
   edge is considered, has the same parameterization up to the  
   tolerance value coded on the edge. For a given parameter t on the edge  
   having C as a 3D curve and one PCurve P on a surface S (base  
   surface of the reference face), this checks that |C(t) - S(P(t))|  
   is less than or equal to tolerance, where tolerance is the tolerance  
   value coded on the edge.") IsValid;
		Standard_Boolean IsValid ();
		%feature("autodoc", "Args:
	SubS(TopoDS_Shape)

Returns:
	Handle_BRepCheck_Result

No detailed docstring for this function.") Result;
		const Handle_BRepCheck_Result & Result (const TopoDS_Shape & SubS);
};


%feature("shadow") BRepCheck_Analyzer::~BRepCheck_Analyzer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck_Analyzer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus;
class BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus;
		 BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus ();
		%feature("autodoc", "Args:
	aMap(BRepCheck_DataMapOfShapeListOfStatus)

Returns:
	None

No detailed docstring for this function.") BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus;
		 BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus (const BRepCheck_DataMapOfShapeListOfStatus & aMap);
		%feature("autodoc", "Args:
	aMap(BRepCheck_DataMapOfShapeListOfStatus)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepCheck_DataMapOfShapeListOfStatus & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepCheck_ListOfStatus

No detailed docstring for this function.") Value;
		const BRepCheck_ListOfStatus & Value ();
};


%feature("shadow") BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus::~BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepCheck_DataMapIteratorOfDataMapOfShapeResult;
class BRepCheck_DataMapIteratorOfDataMapOfShapeResult : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepCheck_DataMapIteratorOfDataMapOfShapeResult;
		 BRepCheck_DataMapIteratorOfDataMapOfShapeResult ();
		%feature("autodoc", "Args:
	aMap(BRepCheck_DataMapOfShapeResult)

Returns:
	None

No detailed docstring for this function.") BRepCheck_DataMapIteratorOfDataMapOfShapeResult;
		 BRepCheck_DataMapIteratorOfDataMapOfShapeResult (const BRepCheck_DataMapOfShapeResult & aMap);
		%feature("autodoc", "Args:
	aMap(BRepCheck_DataMapOfShapeResult)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepCheck_DataMapOfShapeResult & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepCheck_Result

No detailed docstring for this function.") Value;
		const Handle_BRepCheck_Result & Value ();
};


%feature("shadow") BRepCheck_DataMapIteratorOfDataMapOfShapeResult::~BRepCheck_DataMapIteratorOfDataMapOfShapeResult %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck_DataMapIteratorOfDataMapOfShapeResult {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus;
class BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(BRepCheck_ListOfStatus)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus;
		 BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus (const TopoDS_Shape & K,const BRepCheck_ListOfStatus & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepCheck_ListOfStatus

No detailed docstring for this function.") Value;
		BRepCheck_ListOfStatus & Value ();
};


%feature("shadow") BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus::~BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus {
	Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus GetHandle() {
	return *(Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus*) &$self;
	}
};

%nodefaultctor Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus;
class Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus();
        Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus(const Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus &aHandle);
        Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus(const BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus {
    BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus* GetObject() {
    return (BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus*)$self->Access();
    }
};
%feature("shadow") Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus::~Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepCheck_DataMapNodeOfDataMapOfShapeResult;
class BRepCheck_DataMapNodeOfDataMapOfShapeResult : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Handle_BRepCheck_Result)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepCheck_DataMapNodeOfDataMapOfShapeResult;
		 BRepCheck_DataMapNodeOfDataMapOfShapeResult (const TopoDS_Shape & K,const Handle_BRepCheck_Result & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepCheck_Result

No detailed docstring for this function.") Value;
		Handle_BRepCheck_Result & Value ();
};


%feature("shadow") BRepCheck_DataMapNodeOfDataMapOfShapeResult::~BRepCheck_DataMapNodeOfDataMapOfShapeResult %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck_DataMapNodeOfDataMapOfShapeResult {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepCheck_DataMapNodeOfDataMapOfShapeResult {
	Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult GetHandle() {
	return *(Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult*) &$self;
	}
};

%nodefaultctor Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult;
class Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult();
        Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult(const Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult &aHandle);
        Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult(const BRepCheck_DataMapNodeOfDataMapOfShapeResult *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult {
    BRepCheck_DataMapNodeOfDataMapOfShapeResult* GetObject() {
    return (BRepCheck_DataMapNodeOfDataMapOfShapeResult*)$self->Access();
    }
};
%feature("shadow") Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult::~Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepCheck_DataMapOfShapeListOfStatus;
class BRepCheck_DataMapOfShapeListOfStatus : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepCheck_DataMapOfShapeListOfStatus;
		 BRepCheck_DataMapOfShapeListOfStatus (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepCheck_DataMapOfShapeListOfStatus)

Returns:
	BRepCheck_DataMapOfShapeListOfStatus

No detailed docstring for this function.") Assign;
		BRepCheck_DataMapOfShapeListOfStatus & Assign (const BRepCheck_DataMapOfShapeListOfStatus & Other);
		%feature("autodoc", "Args:
	Other(BRepCheck_DataMapOfShapeListOfStatus)

Returns:
	BRepCheck_DataMapOfShapeListOfStatus

No detailed docstring for this function.") operator=;
		BRepCheck_DataMapOfShapeListOfStatus & operator = (const BRepCheck_DataMapOfShapeListOfStatus & Other);
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
	I(BRepCheck_ListOfStatus)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const BRepCheck_ListOfStatus & I);
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
	BRepCheck_ListOfStatus

No detailed docstring for this function.") Find;
		const BRepCheck_ListOfStatus & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	BRepCheck_ListOfStatus

No detailed docstring for this function.") ChangeFind;
		BRepCheck_ListOfStatus & ChangeFind (const TopoDS_Shape & K);
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


%feature("shadow") BRepCheck_DataMapOfShapeListOfStatus::~BRepCheck_DataMapOfShapeListOfStatus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck_DataMapOfShapeListOfStatus {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepCheck_DataMapOfShapeResult;
class BRepCheck_DataMapOfShapeResult : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepCheck_DataMapOfShapeResult;
		 BRepCheck_DataMapOfShapeResult (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepCheck_DataMapOfShapeResult)

Returns:
	BRepCheck_DataMapOfShapeResult

No detailed docstring for this function.") Assign;
		BRepCheck_DataMapOfShapeResult & Assign (const BRepCheck_DataMapOfShapeResult & Other);
		%feature("autodoc", "Args:
	Other(BRepCheck_DataMapOfShapeResult)

Returns:
	BRepCheck_DataMapOfShapeResult

No detailed docstring for this function.") operator=;
		BRepCheck_DataMapOfShapeResult & operator = (const BRepCheck_DataMapOfShapeResult & Other);
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
	I(Handle_BRepCheck_Result)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Handle_BRepCheck_Result & I);
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
	Handle_BRepCheck_Result

No detailed docstring for this function.") Find;
		const Handle_BRepCheck_Result & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Handle_BRepCheck_Result

No detailed docstring for this function.") ChangeFind;
		Handle_BRepCheck_Result & ChangeFind (const TopoDS_Shape & K);
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


%feature("shadow") BRepCheck_DataMapOfShapeResult::~BRepCheck_DataMapOfShapeResult %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck_DataMapOfShapeResult {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepCheck_ListIteratorOfListOfStatus;
class BRepCheck_ListIteratorOfListOfStatus {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepCheck_ListIteratorOfListOfStatus;
		 BRepCheck_ListIteratorOfListOfStatus ();
		%feature("autodoc", "Args:
	L(BRepCheck_ListOfStatus)

Returns:
	None

No detailed docstring for this function.") BRepCheck_ListIteratorOfListOfStatus;
		 BRepCheck_ListIteratorOfListOfStatus (const BRepCheck_ListOfStatus & L);
		%feature("autodoc", "Args:
	L(BRepCheck_ListOfStatus)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepCheck_ListOfStatus & L);
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
	BRepCheck_Status

No detailed docstring for this function.") Value;
		BRepCheck_Status & Value ();
};


%feature("shadow") BRepCheck_ListIteratorOfListOfStatus::~BRepCheck_ListIteratorOfListOfStatus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck_ListIteratorOfListOfStatus {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepCheck_ListNodeOfListOfStatus;
class BRepCheck_ListNodeOfListOfStatus : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(BRepCheck_Status)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepCheck_ListNodeOfListOfStatus;
		 BRepCheck_ListNodeOfListOfStatus (const BRepCheck_Status & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	BRepCheck_Status

No detailed docstring for this function.") Value;
		BRepCheck_Status & Value ();
};


%feature("shadow") BRepCheck_ListNodeOfListOfStatus::~BRepCheck_ListNodeOfListOfStatus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck_ListNodeOfListOfStatus {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepCheck_ListNodeOfListOfStatus {
	Handle_BRepCheck_ListNodeOfListOfStatus GetHandle() {
	return *(Handle_BRepCheck_ListNodeOfListOfStatus*) &$self;
	}
};

%nodefaultctor Handle_BRepCheck_ListNodeOfListOfStatus;
class Handle_BRepCheck_ListNodeOfListOfStatus : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepCheck_ListNodeOfListOfStatus();
        Handle_BRepCheck_ListNodeOfListOfStatus(const Handle_BRepCheck_ListNodeOfListOfStatus &aHandle);
        Handle_BRepCheck_ListNodeOfListOfStatus(const BRepCheck_ListNodeOfListOfStatus *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_ListNodeOfListOfStatus DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_ListNodeOfListOfStatus {
    BRepCheck_ListNodeOfListOfStatus* GetObject() {
    return (BRepCheck_ListNodeOfListOfStatus*)$self->Access();
    }
};
%feature("shadow") Handle_BRepCheck_ListNodeOfListOfStatus::~Handle_BRepCheck_ListNodeOfListOfStatus %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepCheck_ListNodeOfListOfStatus {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepCheck_ListOfStatus;
class BRepCheck_ListOfStatus {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepCheck_ListOfStatus;
		 BRepCheck_ListOfStatus ();
		%feature("autodoc", "Args:
	Other(BRepCheck_ListOfStatus)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const BRepCheck_ListOfStatus & Other);
		%feature("autodoc", "Args:
	Other(BRepCheck_ListOfStatus)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const BRepCheck_ListOfStatus & Other);
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
	I(BRepCheck_Status)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const BRepCheck_Status & I);
		%feature("autodoc", "Args:
	I(BRepCheck_Status)
	theIt(BRepCheck_ListIteratorOfListOfStatus)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const BRepCheck_Status & I,BRepCheck_ListIteratorOfListOfStatus & theIt);
		%feature("autodoc", "Args:
	Other(BRepCheck_ListOfStatus)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRepCheck_ListOfStatus & Other);
		%feature("autodoc", "Args:
	I(BRepCheck_Status)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const BRepCheck_Status & I);
		%feature("autodoc", "Args:
	I(BRepCheck_Status)
	theIt(BRepCheck_ListIteratorOfListOfStatus)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const BRepCheck_Status & I,BRepCheck_ListIteratorOfListOfStatus & theIt);
		%feature("autodoc", "Args:
	Other(BRepCheck_ListOfStatus)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRepCheck_ListOfStatus & Other);
		%feature("autodoc", "Args:
	None
Returns:
	BRepCheck_Status

No detailed docstring for this function.") First;
		BRepCheck_Status & First ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepCheck_Status

No detailed docstring for this function.") Last;
		BRepCheck_Status & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(BRepCheck_ListIteratorOfListOfStatus)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (BRepCheck_ListIteratorOfListOfStatus & It);
		%feature("autodoc", "Args:
	I(BRepCheck_Status)
	It(BRepCheck_ListIteratorOfListOfStatus)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const BRepCheck_Status & I,BRepCheck_ListIteratorOfListOfStatus & It);
		%feature("autodoc", "Args:
	Other(BRepCheck_ListOfStatus)
	It(BRepCheck_ListIteratorOfListOfStatus)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (BRepCheck_ListOfStatus & Other,BRepCheck_ListIteratorOfListOfStatus & It);
		%feature("autodoc", "Args:
	I(BRepCheck_Status)
	It(BRepCheck_ListIteratorOfListOfStatus)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const BRepCheck_Status & I,BRepCheck_ListIteratorOfListOfStatus & It);
		%feature("autodoc", "Args:
	Other(BRepCheck_ListOfStatus)
	It(BRepCheck_ListIteratorOfListOfStatus)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (BRepCheck_ListOfStatus & Other,BRepCheck_ListIteratorOfListOfStatus & It);
};


%feature("shadow") BRepCheck_ListOfStatus::~BRepCheck_ListOfStatus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck_ListOfStatus {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepCheck_Result;
class BRepCheck_Result : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	ContextShape(TopoDS_Shape)

Returns:
	virtual void

No detailed docstring for this function.") InContext;
		virtual void InContext (const TopoDS_Shape & ContextShape);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Minimum;
		virtual void Minimum ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Blind;
		virtual void Blind ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetFailStatus;
		void SetFailStatus (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	BRepCheck_ListOfStatus

No detailed docstring for this function.") Status;
		const BRepCheck_ListOfStatus & Status ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMinimum;
		Standard_Boolean IsMinimum ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBlind;
		Standard_Boolean IsBlind ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	BRepCheck_ListOfStatus

If  not  already   done,  performs the   InContext  
         control and returns the list of status.") StatusOnShape;
		const BRepCheck_ListOfStatus & StatusOnShape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitContextIterator;
		void InitContextIterator ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreShapeInContext;
		Standard_Boolean MoreShapeInContext ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") ContextualShape;
		const TopoDS_Shape & ContextualShape ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepCheck_ListOfStatus

No detailed docstring for this function.") StatusOnShape;
		const BRepCheck_ListOfStatus & StatusOnShape ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextShapeInContext;
		void NextShapeInContext ();
};


%feature("shadow") BRepCheck_Result::~BRepCheck_Result %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck_Result {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepCheck_Result {
	Handle_BRepCheck_Result GetHandle() {
	return *(Handle_BRepCheck_Result*) &$self;
	}
};

%nodefaultctor Handle_BRepCheck_Result;
class Handle_BRepCheck_Result : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepCheck_Result();
        Handle_BRepCheck_Result(const Handle_BRepCheck_Result &aHandle);
        Handle_BRepCheck_Result(const BRepCheck_Result *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_Result DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Result {
    BRepCheck_Result* GetObject() {
    return (BRepCheck_Result*)$self->Access();
    }
};
%feature("shadow") Handle_BRepCheck_Result::~Handle_BRepCheck_Result %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepCheck_Result {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepCheck_Edge;
class BRepCheck_Edge : public BRepCheck_Result {
	public:
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") BRepCheck_Edge;
		 BRepCheck_Edge (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	ContextShape(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") InContext;
		void InContext (const TopoDS_Shape & ContextShape);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Minimum;
		void Minimum ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Blind;
		void Blind ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") GeometricControls;
		Standard_Boolean GeometricControls ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") GeometricControls;
		void GeometricControls (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
};


%feature("shadow") BRepCheck_Edge::~BRepCheck_Edge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck_Edge {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepCheck_Edge {
	Handle_BRepCheck_Edge GetHandle() {
	return *(Handle_BRepCheck_Edge*) &$self;
	}
};

%nodefaultctor Handle_BRepCheck_Edge;
class Handle_BRepCheck_Edge : public Handle_BRepCheck_Result {

    public:
        // constructors
        Handle_BRepCheck_Edge();
        Handle_BRepCheck_Edge(const Handle_BRepCheck_Edge &aHandle);
        Handle_BRepCheck_Edge(const BRepCheck_Edge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_Edge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Edge {
    BRepCheck_Edge* GetObject() {
    return (BRepCheck_Edge*)$self->Access();
    }
};
%feature("shadow") Handle_BRepCheck_Edge::~Handle_BRepCheck_Edge %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepCheck_Edge {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepCheck_Face;
class BRepCheck_Face : public BRepCheck_Result {
	public:
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") BRepCheck_Face;
		 BRepCheck_Face (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	ContextShape(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") InContext;
		void InContext (const TopoDS_Shape & ContextShape);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Minimum;
		void Minimum ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Blind;
		void Blind ();
		%feature("autodoc", "Args:
	Update(Standard_Boolean)=Standard_False

Returns:
	BRepCheck_Status

No detailed docstring for this function.") IntersectWires;
		BRepCheck_Status IntersectWires (const Standard_Boolean Update = Standard_False);
		%feature("autodoc", "Args:
	Update(Standard_Boolean)=Standard_False

Returns:
	BRepCheck_Status

No detailed docstring for this function.") ClassifyWires;
		BRepCheck_Status ClassifyWires (const Standard_Boolean Update = Standard_False);
		%feature("autodoc", "Args:
	Update(Standard_Boolean)=Standard_False

Returns:
	BRepCheck_Status

No detailed docstring for this function.") OrientationOfWires;
		BRepCheck_Status OrientationOfWires (const Standard_Boolean Update = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetUnorientable;
		void SetUnorientable ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsUnorientable;
		Standard_Boolean IsUnorientable ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") GeometricControls;
		Standard_Boolean GeometricControls ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") GeometricControls;
		void GeometricControls (const Standard_Boolean B);
};


%feature("shadow") BRepCheck_Face::~BRepCheck_Face %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck_Face {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepCheck_Face {
	Handle_BRepCheck_Face GetHandle() {
	return *(Handle_BRepCheck_Face*) &$self;
	}
};

%nodefaultctor Handle_BRepCheck_Face;
class Handle_BRepCheck_Face : public Handle_BRepCheck_Result {

    public:
        // constructors
        Handle_BRepCheck_Face();
        Handle_BRepCheck_Face(const Handle_BRepCheck_Face &aHandle);
        Handle_BRepCheck_Face(const BRepCheck_Face *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_Face DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Face {
    BRepCheck_Face* GetObject() {
    return (BRepCheck_Face*)$self->Access();
    }
};
%feature("shadow") Handle_BRepCheck_Face::~Handle_BRepCheck_Face %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepCheck_Face {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepCheck_Shell;
class BRepCheck_Shell : public BRepCheck_Result {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shell)

Returns:
	None

No detailed docstring for this function.") BRepCheck_Shell;
		 BRepCheck_Shell (const TopoDS_Shell & S);
		%feature("autodoc", "Args:
	ContextShape(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") InContext;
		void InContext (const TopoDS_Shape & ContextShape);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Minimum;
		void Minimum ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Blind;
		void Blind ();
		%feature("autodoc", "Args:
	Update(Standard_Boolean)=Standard_False

Returns:
	BRepCheck_Status

Checks if the oriented  faces of the shell  give a  
         closed shell.    If the  wire is  closed,  returns  
         BRepCheck_NoError.If      <Update>     is  set  to  
         Standard_True, registers the status in the list.") Closed;
		BRepCheck_Status Closed (const Standard_Boolean Update = Standard_False);
		%feature("autodoc", "Args:
	Update(Standard_Boolean)=Standard_False

Returns:
	BRepCheck_Status

Checks if the   oriented faces  of  the shell  are  
         correctly oriented.  An internal  call is  made to  
         the  method  Closed.   If  <Update>    is set   to  
         Standard_True, registers the status in the list.") Orientation;
		BRepCheck_Status Orientation (const Standard_Boolean Update = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetUnorientable;
		void SetUnorientable ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsUnorientable;
		Standard_Boolean IsUnorientable ();
		%feature("autodoc", "Args:
	theSets(TopTools_ListOfShape)

Returns:
	Standard_Integer

No detailed docstring for this function.") NbConnectedSet;
		Standard_Integer NbConnectedSet (TopTools_ListOfShape & theSets);
};


%feature("shadow") BRepCheck_Shell::~BRepCheck_Shell %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck_Shell {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepCheck_Shell {
	Handle_BRepCheck_Shell GetHandle() {
	return *(Handle_BRepCheck_Shell*) &$self;
	}
};

%nodefaultctor Handle_BRepCheck_Shell;
class Handle_BRepCheck_Shell : public Handle_BRepCheck_Result {

    public:
        // constructors
        Handle_BRepCheck_Shell();
        Handle_BRepCheck_Shell(const Handle_BRepCheck_Shell &aHandle);
        Handle_BRepCheck_Shell(const BRepCheck_Shell *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_Shell DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Shell {
    BRepCheck_Shell* GetObject() {
    return (BRepCheck_Shell*)$self->Access();
    }
};
%feature("shadow") Handle_BRepCheck_Shell::~Handle_BRepCheck_Shell %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepCheck_Shell {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepCheck_Vertex;
class BRepCheck_Vertex : public BRepCheck_Result {
	public:
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BRepCheck_Vertex;
		 BRepCheck_Vertex (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	ContextShape(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") InContext;
		void InContext (const TopoDS_Shape & ContextShape);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Minimum;
		void Minimum ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Blind;
		void Blind ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
};


%feature("shadow") BRepCheck_Vertex::~BRepCheck_Vertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck_Vertex {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepCheck_Vertex {
	Handle_BRepCheck_Vertex GetHandle() {
	return *(Handle_BRepCheck_Vertex*) &$self;
	}
};

%nodefaultctor Handle_BRepCheck_Vertex;
class Handle_BRepCheck_Vertex : public Handle_BRepCheck_Result {

    public:
        // constructors
        Handle_BRepCheck_Vertex();
        Handle_BRepCheck_Vertex(const Handle_BRepCheck_Vertex &aHandle);
        Handle_BRepCheck_Vertex(const BRepCheck_Vertex *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_Vertex DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Vertex {
    BRepCheck_Vertex* GetObject() {
    return (BRepCheck_Vertex*)$self->Access();
    }
};
%feature("shadow") Handle_BRepCheck_Vertex::~Handle_BRepCheck_Vertex %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepCheck_Vertex {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepCheck_Wire;
class BRepCheck_Wire : public BRepCheck_Result {
	public:
		%feature("autodoc", "Args:
	W(TopoDS_Wire)

Returns:
	None

No detailed docstring for this function.") BRepCheck_Wire;
		 BRepCheck_Wire (const TopoDS_Wire & W);
		%feature("autodoc", "Args:
	ContextShape(TopoDS_Shape)

Returns:
	None

if <ContextShape> is  a  face, consequently checks  
         SelfIntersect(),   Closed(),   Orientation()   and  
         Closed2d until faulty is found") InContext;
		void InContext (const TopoDS_Shape & ContextShape);
		%feature("autodoc", "Args:
	None
Returns:
	None

checks that the  wire  is  not empty and 'connex'.  
         Called by constructor") Minimum;
		void Minimum ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Does nothing") Blind;
		void Blind ();
		%feature("autodoc", "Args:
	Update(Standard_Boolean)=Standard_False

Returns:
	BRepCheck_Status

Checks if the  oriented  edges of the wire  give a  
         closed  wire.   If the  wire   is closed,  returns  
         BRepCheck_NoError.    Warning :  if the first  and  
         last  edge   are  infinite,   the  wire   will  be  
         considered as a closed one.  If <Update> is set to  
         Standard_True, registers the status in the list.  
         May return (and registers):  
         **BRepCheck_NotConnected,   if    wire    is   not  
         topologically closed  
         **BRepCheck_RedundantEdge, if an  edge  is in wire  
         more than 3 times  or  in  case of 2 occurences if  
         not with FORWARD and REVERSED orientation.  
         **BRepCheck_NoError") Closed;
		BRepCheck_Status Closed (const Standard_Boolean Update = Standard_False);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Update(Standard_Boolean)=Standard_False

Returns:
	BRepCheck_Status

Checks if edges of the  wire give a wire closed in  
         2d space.  
         Returns BRepCheck_NoError,  or BRepCheck_NotClosed  
         If <Update> is set to Standard_True, registers the  
         status in the list.") Closed2d;
		BRepCheck_Status Closed2d (const TopoDS_Face & F,const Standard_Boolean Update = Standard_False);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Update(Standard_Boolean)=Standard_False

Returns:
	BRepCheck_Status

Checks   if  the oriented edges   of  the wire are  
         correctly oriented.  An  internal call is made  to  
         the  method Closed.   If no face  exists, call the  
         method with   a  null  face  (TopoDS_face()).   If  
         <Update> is  set  to Standard_True,  registers the  
         status in the list.  
         May return (and registers):  
         BRepCheck_InvalidDegeneratedFlag,  
         BRepCheck_BadOrientationOfSubshape,  
         BRepCheck_NotClosed,  
         BRepCheck_NoError") Orientation;
		BRepCheck_Status Orientation (const TopoDS_Face & F,const Standard_Boolean Update = Standard_False);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	Update(Standard_Boolean)=Standard_False

Returns:
	BRepCheck_Status

Checks if  the wire intersect   itself on the face  
         <F>.  <E1>  and <E2>   are the first  intersecting  
         edges  found.  <E2>  may  be a  null  edge when  a  
         self-intersecting edge is found.If <Update> is set  
         to Standard_True,   registers  the  status in  the  
         list.  
         May return (and register):  
         BRepCheck_EmptyWire,  
         BRepCheck_SelfIntersectingWire,  
         BRepCheck_NoCurveOnSurface,  
         BRepCheck_NoError") SelfIntersect;
		BRepCheck_Status SelfIntersect (const TopoDS_Face & F,TopoDS_Edge & E1,TopoDS_Edge & E2,const Standard_Boolean Update = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

report SelfIntersect() check would be (is) done") GeometricControls;
		Standard_Boolean GeometricControls ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

set SelfIntersect() to be checked") GeometricControls;
		void GeometricControls (const Standard_Boolean B);
};


%feature("shadow") BRepCheck_Wire::~BRepCheck_Wire %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepCheck_Wire {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepCheck_Wire {
	Handle_BRepCheck_Wire GetHandle() {
	return *(Handle_BRepCheck_Wire*) &$self;
	}
};

%nodefaultctor Handle_BRepCheck_Wire;
class Handle_BRepCheck_Wire : public Handle_BRepCheck_Result {

    public:
        // constructors
        Handle_BRepCheck_Wire();
        Handle_BRepCheck_Wire(const Handle_BRepCheck_Wire &aHandle);
        Handle_BRepCheck_Wire(const BRepCheck_Wire *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepCheck_Wire DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Wire {
    BRepCheck_Wire* GetObject() {
    return (BRepCheck_Wire*)$self->Access();
    }
};
%feature("shadow") Handle_BRepCheck_Wire::~Handle_BRepCheck_Wire %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepCheck_Wire {
    void _kill_pointed() {
        delete $self;
    }
};

