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
%module (package="OCC") IntTools

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

%include IntTools_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(inttools) IntTools;
%nodefaultctor IntTools;
class IntTools {
	public:
		%feature("autodoc", "	* returns the length of the edge;

	:param E:
	:type E: TopoDS_Edge &
	:rtype: float
") Length;
		static Standard_Real Length (const TopoDS_Edge & E);
		%feature("autodoc", "	* Remove from the sequence aSeq the Roots that have values ti and tj such as |ti-tj] < anEpsT.

	:param aSeq:
	:type aSeq: IntTools_SequenceOfRoots &
	:param anEpsT:
	:type anEpsT: float
	:rtype: void
") RemoveIdenticalRoots;
		static void RemoveIdenticalRoots (IntTools_SequenceOfRoots & aSeq,const Standard_Real anEpsT);
		%feature("autodoc", "	* Sort the sequence aSeq of the Roots to arrange the Roons in increasing order

	:param aSeq:
	:type aSeq: IntTools_SequenceOfRoots &
	:param anEpsT:
	:type anEpsT: float
	:rtype: void
") SortRoots;
		static void SortRoots (IntTools_SequenceOfRoots & aSeq,const Standard_Real anEpsT);
		%feature("autodoc", "	* Find the states (before and after) for each Root from the sequence aSeq

	:param aSeq:
	:type aSeq: IntTools_SequenceOfRoots &
	:param anEpsNull:
	:type anEpsNull: float
	:rtype: void
") FindRootStates;
		static void FindRootStates (IntTools_SequenceOfRoots & aSeq,const Standard_Real anEpsNull);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Curve:
	:type Curve: Handle_Geom_Curve &
	:param aParm:
	:type aParm: float &
	:rtype: int
") Parameter;
		static Standard_Integer Parameter (const gp_Pnt & P,const Handle_Geom_Curve & Curve,Standard_Real &OutValue);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:param t1:
	:type t1: float
	:param t3:
	:type t3: float
	:param R:
	:type R: float &
	:rtype: int
") GetRadius;
		static Standard_Integer GetRadius (const BRepAdaptor_Curve & C,const Standard_Real t1,const Standard_Real t3,Standard_Real &OutValue);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:param tMax:
	:type tMax: float
	:param tMin:
	:type tMin: float
	:param Discret:
	:type Discret: Standard_Integer
	:param Deflect:
	:type Deflect: float
	:param anArgs:
	:type anArgs: IntTools_CArray1OfReal &
	:rtype: int
") PrepareArgs;
		static Standard_Integer PrepareArgs (BRepAdaptor_Curve & C,const Standard_Real tMax,const Standard_Real tMin,const Standard_Integer Discret,const Standard_Real Deflect,IntTools_CArray1OfReal & anArgs);
};


%feature("shadow") IntTools::~IntTools %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_Array1OfRange;
class IntTools_Array1OfRange {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") IntTools_Array1OfRange;
		 IntTools_Array1OfRange (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: IntTools_Range &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") IntTools_Array1OfRange;
		 IntTools_Array1OfRange (const IntTools_Range & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: IntTools_Range &
	:rtype: None
") Init;
		void Init (const IntTools_Range & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_Array1OfRange &
	:rtype: IntTools_Array1OfRange
") Assign;
		const IntTools_Array1OfRange & Assign (const IntTools_Array1OfRange & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_Array1OfRange &
	:rtype: IntTools_Array1OfRange
") operator=;
		const IntTools_Array1OfRange & operator = (const IntTools_Array1OfRange & Other);
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
	:type Value: IntTools_Range &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntTools_Range & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntTools_Range
") Value;
		const IntTools_Range & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntTools_Range
") ChangeValue;
		IntTools_Range & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") IntTools_Array1OfRange::~IntTools_Array1OfRange %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_Array1OfRange {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_Array1OfRoots;
class IntTools_Array1OfRoots {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") IntTools_Array1OfRoots;
		 IntTools_Array1OfRoots (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: IntTools_Root &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") IntTools_Array1OfRoots;
		 IntTools_Array1OfRoots (const IntTools_Root & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: IntTools_Root &
	:rtype: None
") Init;
		void Init (const IntTools_Root & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_Array1OfRoots &
	:rtype: IntTools_Array1OfRoots
") Assign;
		const IntTools_Array1OfRoots & Assign (const IntTools_Array1OfRoots & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_Array1OfRoots &
	:rtype: IntTools_Array1OfRoots
") operator=;
		const IntTools_Array1OfRoots & operator = (const IntTools_Array1OfRoots & Other);
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
	:type Value: IntTools_Root &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntTools_Root & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntTools_Root
") Value;
		const IntTools_Root & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntTools_Root
") ChangeValue;
		IntTools_Root & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") IntTools_Array1OfRoots::~IntTools_Array1OfRoots %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_Array1OfRoots {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_BaseRangeSample;
class IntTools_BaseRangeSample {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_BaseRangeSample;
		 IntTools_BaseRangeSample ();
		%feature("autodoc", "	:param theDepth:
	:type theDepth: Standard_Integer
	:rtype: None
") IntTools_BaseRangeSample;
		 IntTools_BaseRangeSample (const Standard_Integer theDepth);
		%feature("autodoc", "	:param theDepth:
	:type theDepth: Standard_Integer
	:rtype: None
") SetDepth;
		void SetDepth (const Standard_Integer theDepth);
		%feature("autodoc", "	:rtype: int
") GetDepth;
		Standard_Integer GetDepth ();
};


%feature("shadow") IntTools_BaseRangeSample::~IntTools_BaseRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_BaseRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_BeanFaceIntersector;
class IntTools_BeanFaceIntersector {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector ();
		%feature("autodoc", "	* Initializes the algorithm Warning: The parts of the edge which are on the surface of the face and belong to the whole in the face (if there is) is considered as result

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theFace:
	:type theFace: TopoDS_Face &
	:rtype: None
") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace);
		%feature("autodoc", "	* Initializes the algorithm

	:param theCurve:
	:type theCurve: BRepAdaptor_Curve &
	:param theSurface:
	:type theSurface: BRepAdaptor_Surface &
	:param theBeanTolerance:
	:type theBeanTolerance: float
	:param theFaceTolerance:
	:type theFaceTolerance: float
	:rtype: None
") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector (const BRepAdaptor_Curve & theCurve,const BRepAdaptor_Surface & theSurface,const Standard_Real theBeanTolerance,const Standard_Real theFaceTolerance);
		%feature("autodoc", "	* Initializes the algorithm theUMinParameter, ... are used for optimization purposes

	:param theCurve:
	:type theCurve: BRepAdaptor_Curve &
	:param theSurface:
	:type theSurface: BRepAdaptor_Surface &
	:param theFirstParOnCurve:
	:type theFirstParOnCurve: float
	:param theLastParOnCurve:
	:type theLastParOnCurve: float
	:param theUMinParameter:
	:type theUMinParameter: float
	:param theUMaxParameter:
	:type theUMaxParameter: float
	:param theVMinParameter:
	:type theVMinParameter: float
	:param theVMaxParameter:
	:type theVMaxParameter: float
	:param theBeanTolerance:
	:type theBeanTolerance: float
	:param theFaceTolerance:
	:type theFaceTolerance: float
	:rtype: None
") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector (const BRepAdaptor_Curve & theCurve,const BRepAdaptor_Surface & theSurface,const Standard_Real theFirstParOnCurve,const Standard_Real theLastParOnCurve,const Standard_Real theUMinParameter,const Standard_Real theUMaxParameter,const Standard_Real theVMinParameter,const Standard_Real theVMaxParameter,const Standard_Real theBeanTolerance,const Standard_Real theFaceTolerance);
		%feature("autodoc", "	* Initializes the algorithm Warning: The parts of the edge which are on the surface of the face and belong to the whole in the face (if there is) is considered as result

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theFace:
	:type theFace: TopoDS_Face &
	:rtype: None
") Init;
		void Init (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace);
		%feature("autodoc", "	* Initializes the algorithm

	:param theCurve:
	:type theCurve: BRepAdaptor_Curve &
	:param theSurface:
	:type theSurface: BRepAdaptor_Surface &
	:param theBeanTolerance:
	:type theBeanTolerance: float
	:param theFaceTolerance:
	:type theFaceTolerance: float
	:rtype: None
") Init;
		void Init (const BRepAdaptor_Curve & theCurve,const BRepAdaptor_Surface & theSurface,const Standard_Real theBeanTolerance,const Standard_Real theFaceTolerance);
		%feature("autodoc", "	* Initializes the algorithm theUMinParameter, ... are used for optimization purposes

	:param theCurve:
	:type theCurve: BRepAdaptor_Curve &
	:param theSurface:
	:type theSurface: BRepAdaptor_Surface &
	:param theFirstParOnCurve:
	:type theFirstParOnCurve: float
	:param theLastParOnCurve:
	:type theLastParOnCurve: float
	:param theUMinParameter:
	:type theUMinParameter: float
	:param theUMaxParameter:
	:type theUMaxParameter: float
	:param theVMinParameter:
	:type theVMinParameter: float
	:param theVMaxParameter:
	:type theVMaxParameter: float
	:param theBeanTolerance:
	:type theBeanTolerance: float
	:param theFaceTolerance:
	:type theFaceTolerance: float
	:rtype: None
") Init;
		void Init (const BRepAdaptor_Curve & theCurve,const BRepAdaptor_Surface & theSurface,const Standard_Real theFirstParOnCurve,const Standard_Real theLastParOnCurve,const Standard_Real theUMinParameter,const Standard_Real theUMaxParameter,const Standard_Real theVMinParameter,const Standard_Real theVMaxParameter,const Standard_Real theBeanTolerance,const Standard_Real theFaceTolerance);
		%feature("autodoc", "	* Sets the intersecton context

	:param theContext:
	:type theContext: Handle_BOPInt_Context &
	:rtype: None
") SetContext;
		void SetContext (const Handle_BOPInt_Context & theContext);
		%feature("autodoc", "	* Gets the intersecton context

	:rtype: Handle_BOPInt_Context
") Context;
		const Handle_BOPInt_Context & Context ();
		%feature("autodoc", "	* Set restrictions for curve

	:param theFirstParOnCurve:
	:type theFirstParOnCurve: float
	:param theLastParOnCurve:
	:type theLastParOnCurve: float
	:rtype: None
") SetBeanParameters;
		void SetBeanParameters (const Standard_Real theFirstParOnCurve,const Standard_Real theLastParOnCurve);
		%feature("autodoc", "	* Set restrictions for surface

	:param theUMinParameter:
	:type theUMinParameter: float
	:param theUMaxParameter:
	:type theUMaxParameter: float
	:param theVMinParameter:
	:type theVMinParameter: float
	:param theVMaxParameter:
	:type theVMaxParameter: float
	:rtype: None
") SetSurfaceParameters;
		void SetSurfaceParameters (const Standard_Real theUMinParameter,const Standard_Real theUMaxParameter,const Standard_Real theVMinParameter,const Standard_Real theVMaxParameter);
		%feature("autodoc", "	* Launches the algorithm

	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: IntTools_SequenceOfRanges
") Result;
		const IntTools_SequenceOfRanges & Result ();
		%feature("autodoc", "	:param theResults:
	:type theResults: IntTools_SequenceOfRanges &
	:rtype: None
") Result;
		void Result (IntTools_SequenceOfRanges & theResults);
};


%feature("shadow") IntTools_BeanFaceIntersector::~IntTools_BeanFaceIntersector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_BeanFaceIntersector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_CommonPrt;
class IntTools_CommonPrt {
	public:
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") IntTools_CommonPrt;
		 IntTools_CommonPrt ();
		%feature("autodoc", "	* Copy constructor

	:param aCPrt:
	:type aCPrt: IntTools_CommonPrt &
	:rtype: None
") IntTools_CommonPrt;
		 IntTools_CommonPrt (const IntTools_CommonPrt & aCPrt);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_CommonPrt &
	:rtype: IntTools_CommonPrt
") Assign;
		IntTools_CommonPrt & Assign (const IntTools_CommonPrt & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_CommonPrt &
	:rtype: IntTools_CommonPrt
") operator=;
		IntTools_CommonPrt & operator = (const IntTools_CommonPrt & Other);
		%feature("autodoc", "	* Sets the first edge.

	:param anE:
	:type anE: TopoDS_Edge &
	:rtype: None
") SetEdge1;
		void SetEdge1 (const TopoDS_Edge & anE);
		%feature("autodoc", "	* Sets the second edge.

	:param anE:
	:type anE: TopoDS_Edge &
	:rtype: None
") SetEdge2;
		void SetEdge2 (const TopoDS_Edge & anE);
		%feature("autodoc", "	* Sets the type of the common part Vertex or Edge

	:param aType:
	:type aType: TopAbs_ShapeEnum
	:rtype: None
") SetType;
		void SetType (const TopAbs_ShapeEnum aType);
		%feature("autodoc", "	* Sets the range of first edge.

	:param aR:
	:type aR: IntTools_Range &
	:rtype: None
") SetRange1;
		void SetRange1 (const IntTools_Range & aR);
		%feature("autodoc", "	* Sets the range of first edge.

	:param tf:
	:type tf: float
	:param tl:
	:type tl: float
	:rtype: None
") SetRange1;
		void SetRange1 (const Standard_Real tf,const Standard_Real tl);
		%feature("autodoc", "	* Appends the range of second edge.

	:param aR:
	:type aR: IntTools_Range &
	:rtype: None
") AppendRange2;
		void AppendRange2 (const IntTools_Range & aR);
		%feature("autodoc", "	* Appends the range of second edge.

	:param tf:
	:type tf: float
	:param tl:
	:type tl: float
	:rtype: None
") AppendRange2;
		void AppendRange2 (const Standard_Real tf,const Standard_Real tl);
		%feature("autodoc", "	* Sets a parameter of first vertex

	:param tV:
	:type tV: float
	:rtype: None
") SetVertexParameter1;
		void SetVertexParameter1 (const Standard_Real tV);
		%feature("autodoc", "	* Sets a parameter of second vertex

	:param tV:
	:type tV: float
	:rtype: None
") SetVertexParameter2;
		void SetVertexParameter2 (const Standard_Real tV);
		%feature("autodoc", "	* Returns the first edge.

	:rtype: TopoDS_Edge
") Edge1;
		const TopoDS_Edge  Edge1 ();
		%feature("autodoc", "	* Returns the second edge

	:rtype: TopoDS_Edge
") Edge2;
		const TopoDS_Edge  Edge2 ();
		%feature("autodoc", "	* Returns the type of the common part

	:rtype: TopAbs_ShapeEnum
") Type;
		TopAbs_ShapeEnum Type ();
		%feature("autodoc", "	* Returns the range of first edge

	:rtype: IntTools_Range
") Range1;
		const IntTools_Range & Range1 ();
		%feature("autodoc", "	* Returns the range of first edge.

	:param tf:
	:type tf: float &
	:param tl:
	:type tl: float &
	:rtype: None
") Range1;
		void Range1 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the ranges of second edge.

	:rtype: IntTools_SequenceOfRanges
") Ranges2;
		const IntTools_SequenceOfRanges & Ranges2 ();
		%feature("autodoc", "	* Returns the ranges of second edge.

	:rtype: IntTools_SequenceOfRanges
") ChangeRanges2;
		IntTools_SequenceOfRanges & ChangeRanges2 ();
		%feature("autodoc", "	* Returns parameter of first vertex

	:rtype: float
") VertexParameter1;
		Standard_Real VertexParameter1 ();
		%feature("autodoc", "	* Returns parameter of second vertex

	:rtype: float
") VertexParameter2;
		Standard_Real VertexParameter2 ();
		%feature("autodoc", "	* Copies me to anOther

	:param anOther:
	:type anOther: IntTools_CommonPrt &
	:rtype: None
") Copy;
		void Copy (IntTools_CommonPrt & anOther);
		%feature("autodoc", "	* Modifier

	:rtype: bool
") AllNullFlag;
		Standard_Boolean AllNullFlag ();
		%feature("autodoc", "	* Selector

	:param aFlag:
	:type aFlag: bool
	:rtype: None
") SetAllNullFlag;
		void SetAllNullFlag (const Standard_Boolean aFlag);
		%feature("autodoc", "	* Modifier

	:param aP1:
	:type aP1: gp_Pnt
	:param aP2:
	:type aP2: gp_Pnt
	:rtype: None
") SetBoundingPoints;
		void SetBoundingPoints (const gp_Pnt & aP1,const gp_Pnt & aP2);
		%feature("autodoc", "	* Selector

	:param aP1:
	:type aP1: gp_Pnt
	:param aP2:
	:type aP2: gp_Pnt
	:rtype: None
") BoundingPoints;
		void BoundingPoints (gp_Pnt & aP1,gp_Pnt & aP2);
};


%feature("shadow") IntTools_CommonPrt::~IntTools_CommonPrt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_CommonPrt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_Compare;
class IntTools_Compare {
	public:
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") IntTools_Compare;
		 IntTools_Compare ();
		%feature("autodoc", "	* Initializes me by tolerance

	:param aTol:
	:type aTol: float
	:rtype: None
") IntTools_Compare;
		 IntTools_Compare (const Standard_Real aTol);
		%feature("autodoc", "	* Returns True if <Left> is lower than <Right>.

	:param Left:
	:type Left: IntTools_Root &
	:param Right:
	:type Right: IntTools_Root &
	:rtype: bool
") IsLower;
		Standard_Boolean IsLower (const IntTools_Root & Left,const IntTools_Root & Right);
		%feature("autodoc", "	* Returns True if <Left> is greater than <Right>.

	:param Left:
	:type Left: IntTools_Root &
	:param Right:
	:type Right: IntTools_Root &
	:rtype: bool
") IsGreater;
		Standard_Boolean IsGreater (const IntTools_Root & Left,const IntTools_Root & Right);
		%feature("autodoc", "	* Returns True when <Right> and <Left> are equal.

	:param Left:
	:type Left: IntTools_Root &
	:param Right:
	:type Right: IntTools_Root &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const IntTools_Root & Left,const IntTools_Root & Right);
};


%feature("shadow") IntTools_Compare::~IntTools_Compare %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_Compare {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_CompareRange;
class IntTools_CompareRange {
	public:
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") IntTools_CompareRange;
		 IntTools_CompareRange ();
		%feature("autodoc", "	* Initializes me by tolerance

	:param aTol:
	:type aTol: float
	:rtype: None
") IntTools_CompareRange;
		 IntTools_CompareRange (const Standard_Real aTol);
		%feature("autodoc", "	* Returns True if <Left> is lower than <Right>.

	:param Left:
	:type Left: IntTools_Range &
	:param Right:
	:type Right: IntTools_Range &
	:rtype: bool
") IsLower;
		Standard_Boolean IsLower (const IntTools_Range & Left,const IntTools_Range & Right);
		%feature("autodoc", "	* Returns True if <Left> is greater than <Right>.

	:param Left:
	:type Left: IntTools_Range &
	:param Right:
	:type Right: IntTools_Range &
	:rtype: bool
") IsGreater;
		Standard_Boolean IsGreater (const IntTools_Range & Left,const IntTools_Range & Right);
		%feature("autodoc", "	* Returns True when <Right> and <Left> are equal.

	:param Left:
	:type Left: IntTools_Range &
	:param Right:
	:type Right: IntTools_Range &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const IntTools_Range & Left,const IntTools_Range & Right);
};


%feature("shadow") IntTools_CompareRange::~IntTools_CompareRange %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_CompareRange {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_Curve;
class IntTools_Curve {
	public:
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") IntTools_Curve;
		 IntTools_Curve ();
		%feature("autodoc", "	* Initializes me by a 3d curve and two 2d curves

	:param Curve3d:
	:type Curve3d: Handle_Geom_Curve &
	:param FirstCurve2d:
	:type FirstCurve2d: Handle_Geom2d_Curve &
	:param SecondCurve2d:
	:type SecondCurve2d: Handle_Geom2d_Curve &
	:rtype: None
") IntTools_Curve;
		 IntTools_Curve (const Handle_Geom_Curve & Curve3d,const Handle_Geom2d_Curve & FirstCurve2d,const Handle_Geom2d_Curve & SecondCurve2d);
		%feature("autodoc", "	* Modifier

	:param Curve3d:
	:type Curve3d: Handle_Geom_Curve &
	:param FirstCurve2d:
	:type FirstCurve2d: Handle_Geom2d_Curve &
	:param SecondCurve2d:
	:type SecondCurve2d: Handle_Geom2d_Curve &
	:rtype: None
") SetCurves;
		void SetCurves (const Handle_Geom_Curve & Curve3d,const Handle_Geom2d_Curve & FirstCurve2d,const Handle_Geom2d_Curve & SecondCurve2d);
		%feature("autodoc", "	* Modifier

	:param Curve3d:
	:type Curve3d: Handle_Geom_Curve &
	:rtype: None
") SetCurve;
		void SetCurve (const Handle_Geom_Curve & Curve3d);
		%feature("autodoc", "	* Modifier

	:param FirstCurve2d:
	:type FirstCurve2d: Handle_Geom2d_Curve &
	:rtype: None
") SetFirstCurve2d;
		void SetFirstCurve2d (const Handle_Geom2d_Curve & FirstCurve2d);
		%feature("autodoc", "	* Modifier

	:param SecondCurve2d:
	:type SecondCurve2d: Handle_Geom2d_Curve &
	:rtype: None
") SetSecondCurve2d;
		void SetSecondCurve2d (const Handle_Geom2d_Curve & SecondCurve2d);
		%feature("autodoc", "	* Selector

	:rtype: Handle_Geom_Curve
") Curve;
		const Handle_Geom_Curve & Curve ();
		%feature("autodoc", "	* Selector

	:rtype: Handle_Geom2d_Curve
") FirstCurve2d;
		const Handle_Geom2d_Curve & FirstCurve2d ();
		%feature("autodoc", "	* Selector

	:rtype: Handle_Geom2d_Curve
") SecondCurve2d;
		const Handle_Geom2d_Curve & SecondCurve2d ();
		%feature("autodoc", "	* Returns true if 3d curve is BoundedCurve from Geom

	:rtype: bool
") HasBounds;
		Standard_Boolean HasBounds ();
		%feature("autodoc", "	* Returns boundary parameters and corresponded 3d point. Warning: If HasBounds returns false the returned parameters are equal to zero.

	:param aT1:
	:type aT1: float &
	:param aT2:
	:type aT2: float &
	:param aP1:
	:type aP1: gp_Pnt
	:param aP2:
	:type aP2: gp_Pnt
	:rtype: None
") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & aP1,gp_Pnt & aP2);
		%feature("autodoc", "	* Computes 3d point corresponded to parameter aT1 Returns true if given parameter aT1 is inside the boundaries of the curve

	:param aT1:
	:type aT1: float &
	:param aP1:
	:type aP1: gp_Pnt
	:rtype: bool
") D0;
		Standard_Boolean D0 (Standard_Real &OutValue,gp_Pnt & aP1);
		%feature("autodoc", "	* Returns the type of 3d curve

	:rtype: GeomAbs_CurveType
") Type;
		GeomAbs_CurveType Type ();
};


%feature("shadow") IntTools_Curve::~IntTools_Curve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_Curve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_CurveRangeLocalizeData;
class IntTools_CurveRangeLocalizeData {
	public:
		%feature("autodoc", "	:param theNbSample:
	:type theNbSample: Standard_Integer
	:param theMinRange:
	:type theMinRange: float
	:rtype: None
") IntTools_CurveRangeLocalizeData;
		 IntTools_CurveRangeLocalizeData (const Standard_Integer theNbSample,const Standard_Real theMinRange);
		%feature("autodoc", "	:rtype: int
") GetNbSample;
		Standard_Integer GetNbSample ();
		%feature("autodoc", "	:rtype: float
") GetMinRange;
		Standard_Real GetMinRange ();
		%feature("autodoc", "	:param theRange:
	:type theRange: IntTools_CurveRangeSample &
	:rtype: None
") AddOutRange;
		void AddOutRange (const IntTools_CurveRangeSample & theRange);
		%feature("autodoc", "	:param theRange:
	:type theRange: IntTools_CurveRangeSample &
	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: None
") AddBox;
		void AddBox (const IntTools_CurveRangeSample & theRange,const Bnd_Box & theBox);
		%feature("autodoc", "	:param theRange:
	:type theRange: IntTools_CurveRangeSample &
	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: bool
") FindBox;
		Standard_Boolean FindBox (const IntTools_CurveRangeSample & theRange,Bnd_Box & theBox);
		%feature("autodoc", "	:param theRange:
	:type theRange: IntTools_CurveRangeSample &
	:rtype: bool
") IsRangeOut;
		Standard_Boolean IsRangeOut (const IntTools_CurveRangeSample & theRange);
		%feature("autodoc", "	:param theList:
	:type theList: IntTools_ListOfCurveRangeSample &
	:rtype: None
") ListRangeOut;
		void ListRangeOut (IntTools_ListOfCurveRangeSample & theList);
};


%feature("shadow") IntTools_CurveRangeLocalizeData::~IntTools_CurveRangeLocalizeData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_CurveRangeLocalizeData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_CurveRangeSampleMapHasher;
class IntTools_CurveRangeSampleMapHasher {
	public:
		%feature("autodoc", "	* Returns a HasCode value for the Key <K> in the range 0..Upper.

	:param K:
	:type K: IntTools_CurveRangeSample &
	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const IntTools_CurveRangeSample & K,const Standard_Integer Upper);
		%feature("autodoc", "	* Returns True when the two keys are the same. Two same keys must have the same hashcode, the contrary is not necessary.

	:param S1:
	:type S1: IntTools_CurveRangeSample &
	:param S2:
	:type S2: IntTools_CurveRangeSample &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const IntTools_CurveRangeSample & S1,const IntTools_CurveRangeSample & S2);
};


%feature("shadow") IntTools_CurveRangeSampleMapHasher::~IntTools_CurveRangeSampleMapHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_CurveRangeSampleMapHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_DataMapIteratorOfDataMapOfCurveSampleBox;
class IntTools_DataMapIteratorOfDataMapOfCurveSampleBox : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_DataMapIteratorOfDataMapOfCurveSampleBox;
		 IntTools_DataMapIteratorOfDataMapOfCurveSampleBox ();
		%feature("autodoc", "	:param aMap:
	:type aMap: IntTools_DataMapOfCurveSampleBox &
	:rtype: None
") IntTools_DataMapIteratorOfDataMapOfCurveSampleBox;
		 IntTools_DataMapIteratorOfDataMapOfCurveSampleBox (const IntTools_DataMapOfCurveSampleBox & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: IntTools_DataMapOfCurveSampleBox &
	:rtype: None
") Initialize;
		void Initialize (const IntTools_DataMapOfCurveSampleBox & aMap);
		%feature("autodoc", "	:rtype: IntTools_CurveRangeSample
") Key;
		const IntTools_CurveRangeSample & Key ();
		%feature("autodoc", "	:rtype: Bnd_Box
") Value;
		const Bnd_Box & Value ();
};


%feature("shadow") IntTools_DataMapIteratorOfDataMapOfCurveSampleBox::~IntTools_DataMapIteratorOfDataMapOfCurveSampleBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_DataMapIteratorOfDataMapOfCurveSampleBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox;
class IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox;
		 IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox ();
		%feature("autodoc", "	:param aMap:
	:type aMap: IntTools_DataMapOfSurfaceSampleBox &
	:rtype: None
") IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox;
		 IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox (const IntTools_DataMapOfSurfaceSampleBox & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: IntTools_DataMapOfSurfaceSampleBox &
	:rtype: None
") Initialize;
		void Initialize (const IntTools_DataMapOfSurfaceSampleBox & aMap);
		%feature("autodoc", "	:rtype: IntTools_SurfaceRangeSample
") Key;
		const IntTools_SurfaceRangeSample & Key ();
		%feature("autodoc", "	:rtype: Bnd_Box
") Value;
		const Bnd_Box & Value ();
};


%feature("shadow") IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox::~IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_DataMapNodeOfDataMapOfCurveSampleBox;
class IntTools_DataMapNodeOfDataMapOfCurveSampleBox : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: IntTools_CurveRangeSample &
	:param I:
	:type I: Bnd_Box &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") IntTools_DataMapNodeOfDataMapOfCurveSampleBox;
		 IntTools_DataMapNodeOfDataMapOfCurveSampleBox (const IntTools_CurveRangeSample & K,const Bnd_Box & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: IntTools_CurveRangeSample
") Key;
		IntTools_CurveRangeSample & Key ();
		%feature("autodoc", "	:rtype: Bnd_Box
") Value;
		Bnd_Box & Value ();
};


%feature("shadow") IntTools_DataMapNodeOfDataMapOfCurveSampleBox::~IntTools_DataMapNodeOfDataMapOfCurveSampleBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_DataMapNodeOfDataMapOfCurveSampleBox {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_DataMapNodeOfDataMapOfCurveSampleBox {
	Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox GetHandle() {
	return *(Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox*) &$self;
	}
};

%nodefaultctor Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox;
class Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox();
        Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox(const Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox &aHandle);
        Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox(const IntTools_DataMapNodeOfDataMapOfCurveSampleBox *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox {
    IntTools_DataMapNodeOfDataMapOfCurveSampleBox* GetObject() {
    return (IntTools_DataMapNodeOfDataMapOfCurveSampleBox*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox::~Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_DataMapNodeOfDataMapOfCurveSampleBox {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox;
class IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: IntTools_SurfaceRangeSample &
	:param I:
	:type I: Bnd_Box &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox;
		 IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox (const IntTools_SurfaceRangeSample & K,const Bnd_Box & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: IntTools_SurfaceRangeSample
") Key;
		IntTools_SurfaceRangeSample & Key ();
		%feature("autodoc", "	:rtype: Bnd_Box
") Value;
		Bnd_Box & Value ();
};


%feature("shadow") IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox::~IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox {
	Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox GetHandle() {
	return *(Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox*) &$self;
	}
};

%nodefaultctor Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox;
class Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox();
        Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox(const Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox &aHandle);
        Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox(const IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox {
    IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox* GetObject() {
    return (IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox::~Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_DataMapNodeOfDataMapOfSurfaceSampleBox {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_DataMapOfCurveSampleBox;
class IntTools_DataMapOfCurveSampleBox : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") IntTools_DataMapOfCurveSampleBox;
		 IntTools_DataMapOfCurveSampleBox (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_DataMapOfCurveSampleBox &
	:rtype: IntTools_DataMapOfCurveSampleBox
") Assign;
		IntTools_DataMapOfCurveSampleBox & Assign (const IntTools_DataMapOfCurveSampleBox & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_DataMapOfCurveSampleBox &
	:rtype: IntTools_DataMapOfCurveSampleBox
") operator=;
		IntTools_DataMapOfCurveSampleBox & operator = (const IntTools_DataMapOfCurveSampleBox & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: IntTools_CurveRangeSample &
	:param I:
	:type I: Bnd_Box &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const IntTools_CurveRangeSample & K,const Bnd_Box & I);
		%feature("autodoc", "	:param K:
	:type K: IntTools_CurveRangeSample &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const IntTools_CurveRangeSample & K);
		%feature("autodoc", "	:param K:
	:type K: IntTools_CurveRangeSample &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const IntTools_CurveRangeSample & K);
		%feature("autodoc", "	:param K:
	:type K: IntTools_CurveRangeSample &
	:rtype: Bnd_Box
") Find;
		const Bnd_Box & Find (const IntTools_CurveRangeSample & K);
		%feature("autodoc", "	:param K:
	:type K: IntTools_CurveRangeSample &
	:rtype: Bnd_Box
") ChangeFind;
		Bnd_Box & ChangeFind (const IntTools_CurveRangeSample & K);
		%feature("autodoc", "	:param K:
	:type K: IntTools_CurveRangeSample &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const IntTools_CurveRangeSample & K);
		%feature("autodoc", "	:param K:
	:type K: IntTools_CurveRangeSample &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const IntTools_CurveRangeSample & K);
};


%feature("shadow") IntTools_DataMapOfCurveSampleBox::~IntTools_DataMapOfCurveSampleBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_DataMapOfCurveSampleBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_DataMapOfSurfaceSampleBox;
class IntTools_DataMapOfSurfaceSampleBox : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") IntTools_DataMapOfSurfaceSampleBox;
		 IntTools_DataMapOfSurfaceSampleBox (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_DataMapOfSurfaceSampleBox &
	:rtype: IntTools_DataMapOfSurfaceSampleBox
") Assign;
		IntTools_DataMapOfSurfaceSampleBox & Assign (const IntTools_DataMapOfSurfaceSampleBox & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_DataMapOfSurfaceSampleBox &
	:rtype: IntTools_DataMapOfSurfaceSampleBox
") operator=;
		IntTools_DataMapOfSurfaceSampleBox & operator = (const IntTools_DataMapOfSurfaceSampleBox & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: IntTools_SurfaceRangeSample &
	:param I:
	:type I: Bnd_Box &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const IntTools_SurfaceRangeSample & K,const Bnd_Box & I);
		%feature("autodoc", "	:param K:
	:type K: IntTools_SurfaceRangeSample &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const IntTools_SurfaceRangeSample & K);
		%feature("autodoc", "	:param K:
	:type K: IntTools_SurfaceRangeSample &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const IntTools_SurfaceRangeSample & K);
		%feature("autodoc", "	:param K:
	:type K: IntTools_SurfaceRangeSample &
	:rtype: Bnd_Box
") Find;
		const Bnd_Box & Find (const IntTools_SurfaceRangeSample & K);
		%feature("autodoc", "	:param K:
	:type K: IntTools_SurfaceRangeSample &
	:rtype: Bnd_Box
") ChangeFind;
		Bnd_Box & ChangeFind (const IntTools_SurfaceRangeSample & K);
		%feature("autodoc", "	:param K:
	:type K: IntTools_SurfaceRangeSample &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const IntTools_SurfaceRangeSample & K);
		%feature("autodoc", "	:param K:
	:type K: IntTools_SurfaceRangeSample &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const IntTools_SurfaceRangeSample & K);
};


%feature("shadow") IntTools_DataMapOfSurfaceSampleBox::~IntTools_DataMapOfSurfaceSampleBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_DataMapOfSurfaceSampleBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_EdgeEdge;
class IntTools_EdgeEdge {
	public:
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") IntTools_EdgeEdge;
		 IntTools_EdgeEdge ();
		%feature("autodoc", "	* Contructor

	:param theEdge1:
	:type theEdge1: TopoDS_Edge &
	:param theEdge2:
	:type theEdge2: TopoDS_Edge &
	:rtype: None
") IntTools_EdgeEdge;
		 IntTools_EdgeEdge (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2);
		%feature("autodoc", "	* Contructor

	:param theEdge1:
	:type theEdge1: TopoDS_Edge &
	:param aT11:
	:type aT11: float
	:param aT12:
	:type aT12: float
	:param theEdge2:
	:type theEdge2: TopoDS_Edge &
	:param aT21:
	:type aT21: float
	:param aT22:
	:type aT22: float
	:rtype: None
") IntTools_EdgeEdge;
		 IntTools_EdgeEdge (const TopoDS_Edge & theEdge1,const Standard_Real aT11,const Standard_Real aT12,const TopoDS_Edge & theEdge2,const Standard_Real aT21,const Standard_Real aT22);
		%feature("autodoc", "	* Sets the first edge

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:rtype: None
") SetEdge1;
		void SetEdge1 (const TopoDS_Edge & theEdge);
		%feature("autodoc", "	* Sets the first edge and its range

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:rtype: None
") SetEdge1;
		void SetEdge1 (const TopoDS_Edge & theEdge,const Standard_Real aT1,const Standard_Real aT2);
		%feature("autodoc", "	* Sets the range for the first edge

	:param theRange1:
	:type theRange1: IntTools_Range &
	:rtype: None
") SetRange1;
		void SetRange1 (const IntTools_Range & theRange1);
		%feature("autodoc", "	* Sets the range for the first edge

	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:rtype: None
") SetRange1;
		void SetRange1 (const Standard_Real aT1,const Standard_Real aT2);
		%feature("autodoc", "	* Sets the second edge

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:rtype: None
") SetEdge2;
		void SetEdge2 (const TopoDS_Edge & theEdge);
		%feature("autodoc", "	* Sets the first edge and its range

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:rtype: None
") SetEdge2;
		void SetEdge2 (const TopoDS_Edge & theEdge,const Standard_Real aT1,const Standard_Real aT2);
		%feature("autodoc", "	* Sets the range for the second edge

	:param theRange:
	:type theRange: IntTools_Range &
	:rtype: None
") SetRange2;
		void SetRange2 (const IntTools_Range & theRange);
		%feature("autodoc", "	* Sets the range for the second edge

	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:rtype: None
") SetRange2;
		void SetRange2 (const Standard_Real aT1,const Standard_Real aT2);
		%feature("autodoc", "	* Performs the intersection between edges

	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	* Returns True if common part(s) is(are) found

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns common parts

	:rtype: IntTools_SequenceOfCommonPrts
") CommonParts;
		const IntTools_SequenceOfCommonPrts & CommonParts ();
};


%feature("shadow") IntTools_EdgeEdge::~IntTools_EdgeEdge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_EdgeEdge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_EdgeFace;
class IntTools_EdgeFace {
	public:
		%feature("autodoc", "	* Empty Constructor

	:rtype: None
") IntTools_EdgeFace;
		 IntTools_EdgeFace ();
		%feature("autodoc", "	* Initializes algorithm by the edge anEdge

	:param anEdge:
	:type anEdge: TopoDS_Edge &
	:rtype: None
") SetEdge;
		void SetEdge (const TopoDS_Edge & anEdge);
		%feature("autodoc", "	* Initializes algorithm by edge tolerance

	:param aTolEdge1:
	:type aTolEdge1: float
	:rtype: None
") SetTolE;
		void SetTolE (const Standard_Real aTolEdge1);
		%feature("autodoc", "	* Initializes algorithm by the face aFace

	:param aFace:
	:type aFace: TopoDS_Face &
	:rtype: None
") SetFace;
		void SetFace (const TopoDS_Face & aFace);
		%feature("autodoc", "	* Initializes algorithm by face tolerance

	:param aTolFace:
	:type aTolFace: float
	:rtype: None
") SetTolF;
		void SetTolF (const Standard_Real aTolFace);
		%feature("autodoc", "	* Initializes algorithm by discretization value

	:param aDiscret:
	:type aDiscret: Standard_Integer
	:rtype: None
") SetDiscretize;
		void SetDiscretize (const Standard_Integer aDiscret);
		%feature("autodoc", "	* Initializes algorithm by deflection value

	:param aDeflection:
	:type aDeflection: float
	:rtype: None
") SetDeflection;
		void SetDeflection (const Standard_Real aDeflection);
		%feature("autodoc", "	* Initializes algorithm by parameter tolerance

	:param anEpsT:
	:type anEpsT: float
	:rtype: None
") SetEpsilonT;
		void SetEpsilonT (const Standard_Real anEpsT);
		%feature("autodoc", "	* Initializes algorithm by distance tolerance

	:param anEpsNull:
	:type anEpsNull: float
	:rtype: None
") SetEpsilonNull;
		void SetEpsilonNull (const Standard_Real anEpsNull);
		%feature("autodoc", "	* Sets boundaries for edge. The algorithm processes edge inside these boundaries.

	:param aRange:
	:type aRange: IntTools_Range &
	:rtype: None
") SetRange;
		void SetRange (const IntTools_Range & aRange);
		%feature("autodoc", "	* Sets boundaries for edge. The algorithm processes edge inside these boundaries.

	:param aFirst:
	:type aFirst: float
	:param aLast:
	:type aLast: float
	:rtype: None
") SetRange;
		void SetRange (const Standard_Real aFirst,const Standard_Real aLast);
		%feature("autodoc", "	* Sets the intersecton context

	:param theContext:
	:type theContext: Handle_BOPInt_Context &
	:rtype: None
") SetContext;
		void SetContext (const Handle_BOPInt_Context & theContext);
		%feature("autodoc", "	* Gets the intersecton context

	:rtype: Handle_BOPInt_Context
") Context;
		const Handle_BOPInt_Context & Context ();
		%feature("autodoc", "	* Launches the process

	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	* Returns true if computation was done successfully, otherwise returns false

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns code of completion 0 - means successful completion 1 - the process was not started 2,3,4,5 - invalid source data for the algorithm 6 - discretization failed 7 - no projectable ranges found 11 - distance computing error

	:rtype: int
") ErrorStatus;
		Standard_Integer ErrorStatus ();
		%feature("autodoc", "	* Returns results

	:rtype: IntTools_SequenceOfCommonPrts
") CommonParts;
		const IntTools_SequenceOfCommonPrts & CommonParts ();
		%feature("autodoc", "	* Returns boundaries for edge

	:rtype: IntTools_Range
") Range;
		const IntTools_Range & Range ();
		%feature("autodoc", "	* 

	:param aP:
	:type aP: gp_Pnt
	:param aS:
	:type aS: BRepAdaptor_Surface &
	:param aT:
	:type aT: float
	:param aD:
	:type aD: float &
	:rtype: bool
") IsEqDistance;
		static Standard_Boolean IsEqDistance (const gp_Pnt & aP,const BRepAdaptor_Surface & aS,const Standard_Real aT,Standard_Real &OutValue);
};


%feature("shadow") IntTools_EdgeFace::~IntTools_EdgeFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_EdgeFace {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_FClass2d;
class IntTools_FClass2d {
	public:
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") IntTools_FClass2d;
		 IntTools_FClass2d ();
		%feature("autodoc", "	* Initializes algorithm by the face F and tolerance Tol

	:param F:
	:type F: TopoDS_Face &
	:param Tol:
	:type Tol: float
	:rtype: None
") IntTools_FClass2d;
		 IntTools_FClass2d (const TopoDS_Face & F,const Standard_Real Tol);
		%feature("autodoc", "	* Initializes algorithm by the face F and tolerance Tol

	:param F:
	:type F: TopoDS_Face &
	:param Tol:
	:type Tol: float
	:rtype: None
") Init;
		void Init (const TopoDS_Face & F,const Standard_Real Tol);
		%feature("autodoc", "	* Returns state of infinite 2d point relatively to (0, 0)

	:rtype: TopAbs_State
") PerformInfinitePoint;
		TopAbs_State PerformInfinitePoint ();
		%feature("autodoc", "	* Returns state of the 2d point Puv. If RecadreOnPeriodic is true (defalut value), for the periodic surface 2d point, adjusted to period, is classified.

	:param Puv:
	:type Puv: gp_Pnt2d
	:param RecadreOnPeriodic: default value is Standard_True
	:type RecadreOnPeriodic: bool
	:rtype: TopAbs_State
") Perform;
		TopAbs_State Perform (const gp_Pnt2d & Puv,const Standard_Boolean RecadreOnPeriodic = Standard_True);
		%feature("autodoc", "	* Destructor

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	* Test a point with +- an offset (Tol) and returns On if some points are OUT an some are IN (Caution: Internal use . see the code for more details)

	:param Puv:
	:type Puv: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:param RecadreOnPeriodic: default value is Standard_True
	:type RecadreOnPeriodic: bool
	:rtype: TopAbs_State
") TestOnRestriction;
		TopAbs_State TestOnRestriction (const gp_Pnt2d & Puv,const Standard_Real Tol,const Standard_Boolean RecadreOnPeriodic = Standard_True);
		%feature("autodoc", "	:rtype: bool
") IsHole;
		Standard_Boolean IsHole ();
};


%feature("shadow") IntTools_FClass2d::~IntTools_FClass2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_FClass2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_FaceFace;
class IntTools_FaceFace {
	public:
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") IntTools_FaceFace;
		 IntTools_FaceFace ();
		%feature("autodoc", "	* Modifier

	:param ApproxCurves:
	:type ApproxCurves: bool
	:param ComputeCurveOnS1:
	:type ComputeCurveOnS1: bool
	:param ComputeCurveOnS2:
	:type ComputeCurveOnS2: bool
	:param ApproximationTolerance:
	:type ApproximationTolerance: float
	:rtype: None
") SetParameters;
		void SetParameters (const Standard_Boolean ApproxCurves,const Standard_Boolean ComputeCurveOnS1,const Standard_Boolean ComputeCurveOnS2,const Standard_Real ApproximationTolerance);
		%feature("autodoc", "	* Intersects underliing surfaces of F1 and F2 Use sum of tolerance of F1 and F2 as intersection criteria

	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:rtype: None
") Perform;
		void Perform (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "	* Returns True if the intersection was successful

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns sequence of 3d curves as result of intersection

	:rtype: IntTools_SequenceOfCurves
") Lines;
		const IntTools_SequenceOfCurves & Lines ();
		%feature("autodoc", "	* Returns sequence of 3d curves as result of intersection

	:rtype: IntTools_SequenceOfPntOn2Faces
") Points;
		const IntTools_SequenceOfPntOn2Faces & Points ();
		%feature("autodoc", "	* Returns tolerance reached during approximation. If approximation was not done, returns zero.

	:rtype: float
") TolReached3d;
		Standard_Real TolReached3d ();
		%feature("autodoc", "	* Returns tolerance reached during approximation. If approximation was not done, returns zero.

	:rtype: float
") TolReached2d;
		Standard_Real TolReached2d ();
		%feature("autodoc", "	* Returns first of processed faces

	:rtype: TopoDS_Face
") Face1;
		const TopoDS_Face  Face1 ();
		%feature("autodoc", "	* Returns second of processed faces

	:rtype: TopoDS_Face
") Face2;
		const TopoDS_Face  Face2 ();
		%feature("autodoc", "	* Returns True if faces are tangent

	:rtype: bool
") TangentFaces;
		Standard_Boolean TangentFaces ();
		%feature("autodoc", "	* Provides post-processing the result lines. <bToSplit> - the flag. In case of <bToSplit> is true the closed 3D-curves will be splitted on parts. In case of <bToSplit> is false the closed 3D-curves remain untouched.

	:param bToSplit: default value is Standard_True
	:type bToSplit: bool
	:rtype: None
") PrepareLines3D;
		void PrepareLines3D (const Standard_Boolean bToSplit = Standard_True);
		%feature("autodoc", "	:param ListOfPnts:
	:type ListOfPnts: IntSurf_ListOfPntOn2S &
	:rtype: None
") SetList;
		void SetList (IntSurf_ListOfPntOn2S & ListOfPnts);
		%feature("autodoc", "	* Sets the intersecton context

	:param aContext:
	:type aContext: Handle_BOPInt_Context &
	:rtype: None
") SetContext;
		void SetContext (const Handle_BOPInt_Context & aContext);
		%feature("autodoc", "	* Gets the intersecton context

	:rtype: Handle_BOPInt_Context
") Context;
		const Handle_BOPInt_Context & Context ();
};


%feature("shadow") IntTools_FaceFace::~IntTools_FaceFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_FaceFace {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress;
class IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K1:
	:type K1: Handle_Standard_Transient &
	:param K2:
	:type K2: Standard_Integer
	:param I:
	:type I: Standard_Address &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress;
		 IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress (const Handle_Standard_Transient & K1,const Standard_Integer K2,const Standard_Address & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Key1;
		Handle_Standard_Transient & Key1 ();

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
            		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address & Value ();
};


%feature("shadow") IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress::~IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress {
	Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress GetHandle() {
	return *(Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress*) &$self;
	}
};

%nodefaultctor Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress;
class Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress();
        Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress(const Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress &aHandle);
        Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress(const IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress {
    IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress* GetObject() {
    return (IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress::~Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_IndexedDataMapNodeOfIndexedDataMapOfTransientAddress {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_IndexedDataMapOfTransientAddress;
class IntTools_IndexedDataMapOfTransientAddress : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") IntTools_IndexedDataMapOfTransientAddress;
		 IntTools_IndexedDataMapOfTransientAddress (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_IndexedDataMapOfTransientAddress &
	:rtype: IntTools_IndexedDataMapOfTransientAddress
") Assign;
		IntTools_IndexedDataMapOfTransientAddress & Assign (const IntTools_IndexedDataMapOfTransientAddress & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_IndexedDataMapOfTransientAddress &
	:rtype: IntTools_IndexedDataMapOfTransientAddress
") operator=;
		IntTools_IndexedDataMapOfTransientAddress & operator = (const IntTools_IndexedDataMapOfTransientAddress & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:param I:
	:type I: Standard_Address &
	:rtype: int
") Add;
		Standard_Integer Add (const Handle_Standard_Transient & K,const Standard_Address & I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param K:
	:type K: Handle_Standard_Transient &
	:param T:
	:type T: Standard_Address &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const Handle_Standard_Transient & K,const Standard_Address & T);
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_Standard_Transient & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: Handle_Standard_Transient
") FindKey;
		const Handle_Standard_Transient & FindKey (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: Standard_Address
") FindFromIndex;
		const Standard_Address & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: Standard_Address
") ChangeFromIndex;
		Standard_Address & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const Handle_Standard_Transient & K);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Standard_Address
") FindFromKey;
		const Standard_Address & FindFromKey (const Handle_Standard_Transient & K);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Standard_Address
") ChangeFromKey;
		Standard_Address & ChangeFromKey (const Handle_Standard_Transient & K);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const Handle_Standard_Transient & K);
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Transient &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const Handle_Standard_Transient & K);
};


%feature("shadow") IntTools_IndexedDataMapOfTransientAddress::~IntTools_IndexedDataMapOfTransientAddress %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_IndexedDataMapOfTransientAddress {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_ListIteratorOfListOfBox;
class IntTools_ListIteratorOfListOfBox {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_ListIteratorOfListOfBox;
		 IntTools_ListIteratorOfListOfBox ();
		%feature("autodoc", "	:param L:
	:type L: IntTools_ListOfBox &
	:rtype: None
") IntTools_ListIteratorOfListOfBox;
		 IntTools_ListIteratorOfListOfBox (const IntTools_ListOfBox & L);
		%feature("autodoc", "	:param L:
	:type L: IntTools_ListOfBox &
	:rtype: None
") Initialize;
		void Initialize (const IntTools_ListOfBox & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Bnd_Box
") Value;
		Bnd_Box & Value ();
};


%feature("shadow") IntTools_ListIteratorOfListOfBox::~IntTools_ListIteratorOfListOfBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListIteratorOfListOfBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_ListIteratorOfListOfCurveRangeSample;
class IntTools_ListIteratorOfListOfCurveRangeSample {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_ListIteratorOfListOfCurveRangeSample;
		 IntTools_ListIteratorOfListOfCurveRangeSample ();
		%feature("autodoc", "	:param L:
	:type L: IntTools_ListOfCurveRangeSample &
	:rtype: None
") IntTools_ListIteratorOfListOfCurveRangeSample;
		 IntTools_ListIteratorOfListOfCurveRangeSample (const IntTools_ListOfCurveRangeSample & L);
		%feature("autodoc", "	:param L:
	:type L: IntTools_ListOfCurveRangeSample &
	:rtype: None
") Initialize;
		void Initialize (const IntTools_ListOfCurveRangeSample & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: IntTools_CurveRangeSample
") Value;
		IntTools_CurveRangeSample & Value ();
};


%feature("shadow") IntTools_ListIteratorOfListOfCurveRangeSample::~IntTools_ListIteratorOfListOfCurveRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListIteratorOfListOfCurveRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_ListIteratorOfListOfSurfaceRangeSample;
class IntTools_ListIteratorOfListOfSurfaceRangeSample {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_ListIteratorOfListOfSurfaceRangeSample;
		 IntTools_ListIteratorOfListOfSurfaceRangeSample ();
		%feature("autodoc", "	:param L:
	:type L: IntTools_ListOfSurfaceRangeSample &
	:rtype: None
") IntTools_ListIteratorOfListOfSurfaceRangeSample;
		 IntTools_ListIteratorOfListOfSurfaceRangeSample (const IntTools_ListOfSurfaceRangeSample & L);
		%feature("autodoc", "	:param L:
	:type L: IntTools_ListOfSurfaceRangeSample &
	:rtype: None
") Initialize;
		void Initialize (const IntTools_ListOfSurfaceRangeSample & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: IntTools_SurfaceRangeSample
") Value;
		IntTools_SurfaceRangeSample & Value ();
};


%feature("shadow") IntTools_ListIteratorOfListOfSurfaceRangeSample::~IntTools_ListIteratorOfListOfSurfaceRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListIteratorOfListOfSurfaceRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_ListNodeOfListOfBox;
class IntTools_ListNodeOfListOfBox : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") IntTools_ListNodeOfListOfBox;
		 IntTools_ListNodeOfListOfBox (const Bnd_Box & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Bnd_Box
") Value;
		Bnd_Box & Value ();
};


%feature("shadow") IntTools_ListNodeOfListOfBox::~IntTools_ListNodeOfListOfBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListNodeOfListOfBox {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_ListNodeOfListOfBox {
	Handle_IntTools_ListNodeOfListOfBox GetHandle() {
	return *(Handle_IntTools_ListNodeOfListOfBox*) &$self;
	}
};

%nodefaultctor Handle_IntTools_ListNodeOfListOfBox;
class Handle_IntTools_ListNodeOfListOfBox : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntTools_ListNodeOfListOfBox();
        Handle_IntTools_ListNodeOfListOfBox(const Handle_IntTools_ListNodeOfListOfBox &aHandle);
        Handle_IntTools_ListNodeOfListOfBox(const IntTools_ListNodeOfListOfBox *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_ListNodeOfListOfBox DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_ListNodeOfListOfBox {
    IntTools_ListNodeOfListOfBox* GetObject() {
    return (IntTools_ListNodeOfListOfBox*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_ListNodeOfListOfBox::~Handle_IntTools_ListNodeOfListOfBox %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_ListNodeOfListOfBox {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_ListNodeOfListOfCurveRangeSample;
class IntTools_ListNodeOfListOfCurveRangeSample : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: IntTools_CurveRangeSample &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") IntTools_ListNodeOfListOfCurveRangeSample;
		 IntTools_ListNodeOfListOfCurveRangeSample (const IntTools_CurveRangeSample & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: IntTools_CurveRangeSample
") Value;
		IntTools_CurveRangeSample & Value ();
};


%feature("shadow") IntTools_ListNodeOfListOfCurveRangeSample::~IntTools_ListNodeOfListOfCurveRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListNodeOfListOfCurveRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_ListNodeOfListOfCurveRangeSample {
	Handle_IntTools_ListNodeOfListOfCurveRangeSample GetHandle() {
	return *(Handle_IntTools_ListNodeOfListOfCurveRangeSample*) &$self;
	}
};

%nodefaultctor Handle_IntTools_ListNodeOfListOfCurveRangeSample;
class Handle_IntTools_ListNodeOfListOfCurveRangeSample : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntTools_ListNodeOfListOfCurveRangeSample();
        Handle_IntTools_ListNodeOfListOfCurveRangeSample(const Handle_IntTools_ListNodeOfListOfCurveRangeSample &aHandle);
        Handle_IntTools_ListNodeOfListOfCurveRangeSample(const IntTools_ListNodeOfListOfCurveRangeSample *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_ListNodeOfListOfCurveRangeSample DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_ListNodeOfListOfCurveRangeSample {
    IntTools_ListNodeOfListOfCurveRangeSample* GetObject() {
    return (IntTools_ListNodeOfListOfCurveRangeSample*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_ListNodeOfListOfCurveRangeSample::~Handle_IntTools_ListNodeOfListOfCurveRangeSample %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_ListNodeOfListOfCurveRangeSample {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_ListNodeOfListOfSurfaceRangeSample;
class IntTools_ListNodeOfListOfSurfaceRangeSample : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: IntTools_SurfaceRangeSample &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") IntTools_ListNodeOfListOfSurfaceRangeSample;
		 IntTools_ListNodeOfListOfSurfaceRangeSample (const IntTools_SurfaceRangeSample & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: IntTools_SurfaceRangeSample
") Value;
		IntTools_SurfaceRangeSample & Value ();
};


%feature("shadow") IntTools_ListNodeOfListOfSurfaceRangeSample::~IntTools_ListNodeOfListOfSurfaceRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListNodeOfListOfSurfaceRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_ListNodeOfListOfSurfaceRangeSample {
	Handle_IntTools_ListNodeOfListOfSurfaceRangeSample GetHandle() {
	return *(Handle_IntTools_ListNodeOfListOfSurfaceRangeSample*) &$self;
	}
};

%nodefaultctor Handle_IntTools_ListNodeOfListOfSurfaceRangeSample;
class Handle_IntTools_ListNodeOfListOfSurfaceRangeSample : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntTools_ListNodeOfListOfSurfaceRangeSample();
        Handle_IntTools_ListNodeOfListOfSurfaceRangeSample(const Handle_IntTools_ListNodeOfListOfSurfaceRangeSample &aHandle);
        Handle_IntTools_ListNodeOfListOfSurfaceRangeSample(const IntTools_ListNodeOfListOfSurfaceRangeSample *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_ListNodeOfListOfSurfaceRangeSample DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_ListNodeOfListOfSurfaceRangeSample {
    IntTools_ListNodeOfListOfSurfaceRangeSample* GetObject() {
    return (IntTools_ListNodeOfListOfSurfaceRangeSample*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_ListNodeOfListOfSurfaceRangeSample::~Handle_IntTools_ListNodeOfListOfSurfaceRangeSample %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_ListNodeOfListOfSurfaceRangeSample {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_ListOfBox;
class IntTools_ListOfBox {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_ListOfBox;
		 IntTools_ListOfBox ();
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfBox &
	:rtype: None
") Assign;
		void Assign (const IntTools_ListOfBox & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfBox &
	:rtype: None
") operator=;
		void operator = (const IntTools_ListOfBox & Other);
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
	:type I: Bnd_Box &
	:rtype: None
") Prepend;
		void Prepend (const Bnd_Box & I);
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box &
	:param theIt:
	:type theIt: IntTools_ListIteratorOfListOfBox &
	:rtype: None
") Prepend;
		void Prepend (const Bnd_Box & I,IntTools_ListIteratorOfListOfBox & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfBox &
	:rtype: None
") Prepend;
		void Prepend (IntTools_ListOfBox & Other);
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box &
	:rtype: None
") Append;
		void Append (const Bnd_Box & I);
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box &
	:param theIt:
	:type theIt: IntTools_ListIteratorOfListOfBox &
	:rtype: None
") Append;
		void Append (const Bnd_Box & I,IntTools_ListIteratorOfListOfBox & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfBox &
	:rtype: None
") Append;
		void Append (IntTools_ListOfBox & Other);
		%feature("autodoc", "	:rtype: Bnd_Box
") First;
		Bnd_Box & First ();
		%feature("autodoc", "	:rtype: Bnd_Box
") Last;
		Bnd_Box & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: IntTools_ListIteratorOfListOfBox &
	:rtype: None
") Remove;
		void Remove (IntTools_ListIteratorOfListOfBox & It);
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box &
	:param It:
	:type It: IntTools_ListIteratorOfListOfBox &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Bnd_Box & I,IntTools_ListIteratorOfListOfBox & It);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfBox &
	:param It:
	:type It: IntTools_ListIteratorOfListOfBox &
	:rtype: None
") InsertBefore;
		void InsertBefore (IntTools_ListOfBox & Other,IntTools_ListIteratorOfListOfBox & It);
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box &
	:param It:
	:type It: IntTools_ListIteratorOfListOfBox &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Bnd_Box & I,IntTools_ListIteratorOfListOfBox & It);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfBox &
	:param It:
	:type It: IntTools_ListIteratorOfListOfBox &
	:rtype: None
") InsertAfter;
		void InsertAfter (IntTools_ListOfBox & Other,IntTools_ListIteratorOfListOfBox & It);
};


%feature("shadow") IntTools_ListOfBox::~IntTools_ListOfBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListOfBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_ListOfCurveRangeSample;
class IntTools_ListOfCurveRangeSample {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_ListOfCurveRangeSample;
		 IntTools_ListOfCurveRangeSample ();
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfCurveRangeSample &
	:rtype: None
") Assign;
		void Assign (const IntTools_ListOfCurveRangeSample & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfCurveRangeSample &
	:rtype: None
") operator=;
		void operator = (const IntTools_ListOfCurveRangeSample & Other);
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
	:type I: IntTools_CurveRangeSample &
	:rtype: None
") Prepend;
		void Prepend (const IntTools_CurveRangeSample & I);
		%feature("autodoc", "	:param I:
	:type I: IntTools_CurveRangeSample &
	:param theIt:
	:type theIt: IntTools_ListIteratorOfListOfCurveRangeSample &
	:rtype: None
") Prepend;
		void Prepend (const IntTools_CurveRangeSample & I,IntTools_ListIteratorOfListOfCurveRangeSample & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfCurveRangeSample &
	:rtype: None
") Prepend;
		void Prepend (IntTools_ListOfCurveRangeSample & Other);
		%feature("autodoc", "	:param I:
	:type I: IntTools_CurveRangeSample &
	:rtype: None
") Append;
		void Append (const IntTools_CurveRangeSample & I);
		%feature("autodoc", "	:param I:
	:type I: IntTools_CurveRangeSample &
	:param theIt:
	:type theIt: IntTools_ListIteratorOfListOfCurveRangeSample &
	:rtype: None
") Append;
		void Append (const IntTools_CurveRangeSample & I,IntTools_ListIteratorOfListOfCurveRangeSample & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfCurveRangeSample &
	:rtype: None
") Append;
		void Append (IntTools_ListOfCurveRangeSample & Other);
		%feature("autodoc", "	:rtype: IntTools_CurveRangeSample
") First;
		IntTools_CurveRangeSample & First ();
		%feature("autodoc", "	:rtype: IntTools_CurveRangeSample
") Last;
		IntTools_CurveRangeSample & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: IntTools_ListIteratorOfListOfCurveRangeSample &
	:rtype: None
") Remove;
		void Remove (IntTools_ListIteratorOfListOfCurveRangeSample & It);
		%feature("autodoc", "	:param I:
	:type I: IntTools_CurveRangeSample &
	:param It:
	:type It: IntTools_ListIteratorOfListOfCurveRangeSample &
	:rtype: None
") InsertBefore;
		void InsertBefore (const IntTools_CurveRangeSample & I,IntTools_ListIteratorOfListOfCurveRangeSample & It);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfCurveRangeSample &
	:param It:
	:type It: IntTools_ListIteratorOfListOfCurveRangeSample &
	:rtype: None
") InsertBefore;
		void InsertBefore (IntTools_ListOfCurveRangeSample & Other,IntTools_ListIteratorOfListOfCurveRangeSample & It);
		%feature("autodoc", "	:param I:
	:type I: IntTools_CurveRangeSample &
	:param It:
	:type It: IntTools_ListIteratorOfListOfCurveRangeSample &
	:rtype: None
") InsertAfter;
		void InsertAfter (const IntTools_CurveRangeSample & I,IntTools_ListIteratorOfListOfCurveRangeSample & It);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfCurveRangeSample &
	:param It:
	:type It: IntTools_ListIteratorOfListOfCurveRangeSample &
	:rtype: None
") InsertAfter;
		void InsertAfter (IntTools_ListOfCurveRangeSample & Other,IntTools_ListIteratorOfListOfCurveRangeSample & It);
};


%feature("shadow") IntTools_ListOfCurveRangeSample::~IntTools_ListOfCurveRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListOfCurveRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_ListOfSurfaceRangeSample;
class IntTools_ListOfSurfaceRangeSample {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_ListOfSurfaceRangeSample;
		 IntTools_ListOfSurfaceRangeSample ();
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfSurfaceRangeSample &
	:rtype: None
") Assign;
		void Assign (const IntTools_ListOfSurfaceRangeSample & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfSurfaceRangeSample &
	:rtype: None
") operator=;
		void operator = (const IntTools_ListOfSurfaceRangeSample & Other);
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
	:type I: IntTools_SurfaceRangeSample &
	:rtype: None
") Prepend;
		void Prepend (const IntTools_SurfaceRangeSample & I);
		%feature("autodoc", "	:param I:
	:type I: IntTools_SurfaceRangeSample &
	:param theIt:
	:type theIt: IntTools_ListIteratorOfListOfSurfaceRangeSample &
	:rtype: None
") Prepend;
		void Prepend (const IntTools_SurfaceRangeSample & I,IntTools_ListIteratorOfListOfSurfaceRangeSample & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfSurfaceRangeSample &
	:rtype: None
") Prepend;
		void Prepend (IntTools_ListOfSurfaceRangeSample & Other);
		%feature("autodoc", "	:param I:
	:type I: IntTools_SurfaceRangeSample &
	:rtype: None
") Append;
		void Append (const IntTools_SurfaceRangeSample & I);
		%feature("autodoc", "	:param I:
	:type I: IntTools_SurfaceRangeSample &
	:param theIt:
	:type theIt: IntTools_ListIteratorOfListOfSurfaceRangeSample &
	:rtype: None
") Append;
		void Append (const IntTools_SurfaceRangeSample & I,IntTools_ListIteratorOfListOfSurfaceRangeSample & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfSurfaceRangeSample &
	:rtype: None
") Append;
		void Append (IntTools_ListOfSurfaceRangeSample & Other);
		%feature("autodoc", "	:rtype: IntTools_SurfaceRangeSample
") First;
		IntTools_SurfaceRangeSample & First ();
		%feature("autodoc", "	:rtype: IntTools_SurfaceRangeSample
") Last;
		IntTools_SurfaceRangeSample & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: IntTools_ListIteratorOfListOfSurfaceRangeSample &
	:rtype: None
") Remove;
		void Remove (IntTools_ListIteratorOfListOfSurfaceRangeSample & It);
		%feature("autodoc", "	:param I:
	:type I: IntTools_SurfaceRangeSample &
	:param It:
	:type It: IntTools_ListIteratorOfListOfSurfaceRangeSample &
	:rtype: None
") InsertBefore;
		void InsertBefore (const IntTools_SurfaceRangeSample & I,IntTools_ListIteratorOfListOfSurfaceRangeSample & It);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfSurfaceRangeSample &
	:param It:
	:type It: IntTools_ListIteratorOfListOfSurfaceRangeSample &
	:rtype: None
") InsertBefore;
		void InsertBefore (IntTools_ListOfSurfaceRangeSample & Other,IntTools_ListIteratorOfListOfSurfaceRangeSample & It);
		%feature("autodoc", "	:param I:
	:type I: IntTools_SurfaceRangeSample &
	:param It:
	:type It: IntTools_ListIteratorOfListOfSurfaceRangeSample &
	:rtype: None
") InsertAfter;
		void InsertAfter (const IntTools_SurfaceRangeSample & I,IntTools_ListIteratorOfListOfSurfaceRangeSample & It);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_ListOfSurfaceRangeSample &
	:param It:
	:type It: IntTools_ListIteratorOfListOfSurfaceRangeSample &
	:rtype: None
") InsertAfter;
		void InsertAfter (IntTools_ListOfSurfaceRangeSample & Other,IntTools_ListIteratorOfListOfSurfaceRangeSample & It);
};


%feature("shadow") IntTools_ListOfSurfaceRangeSample::~IntTools_ListOfSurfaceRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_ListOfSurfaceRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_MapIteratorOfMapOfCurveSample;
class IntTools_MapIteratorOfMapOfCurveSample : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_MapIteratorOfMapOfCurveSample;
		 IntTools_MapIteratorOfMapOfCurveSample ();
		%feature("autodoc", "	:param aMap:
	:type aMap: IntTools_MapOfCurveSample &
	:rtype: None
") IntTools_MapIteratorOfMapOfCurveSample;
		 IntTools_MapIteratorOfMapOfCurveSample (const IntTools_MapOfCurveSample & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: IntTools_MapOfCurveSample &
	:rtype: None
") Initialize;
		void Initialize (const IntTools_MapOfCurveSample & aMap);
		%feature("autodoc", "	:rtype: IntTools_CurveRangeSample
") Key;
		const IntTools_CurveRangeSample & Key ();
};


%feature("shadow") IntTools_MapIteratorOfMapOfCurveSample::~IntTools_MapIteratorOfMapOfCurveSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_MapIteratorOfMapOfCurveSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_MapIteratorOfMapOfSurfaceSample;
class IntTools_MapIteratorOfMapOfSurfaceSample : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_MapIteratorOfMapOfSurfaceSample;
		 IntTools_MapIteratorOfMapOfSurfaceSample ();
		%feature("autodoc", "	:param aMap:
	:type aMap: IntTools_MapOfSurfaceSample &
	:rtype: None
") IntTools_MapIteratorOfMapOfSurfaceSample;
		 IntTools_MapIteratorOfMapOfSurfaceSample (const IntTools_MapOfSurfaceSample & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: IntTools_MapOfSurfaceSample &
	:rtype: None
") Initialize;
		void Initialize (const IntTools_MapOfSurfaceSample & aMap);
		%feature("autodoc", "	:rtype: IntTools_SurfaceRangeSample
") Key;
		const IntTools_SurfaceRangeSample & Key ();
};


%feature("shadow") IntTools_MapIteratorOfMapOfSurfaceSample::~IntTools_MapIteratorOfMapOfSurfaceSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_MapIteratorOfMapOfSurfaceSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_MapOfCurveSample;
class IntTools_MapOfCurveSample : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") IntTools_MapOfCurveSample;
		 IntTools_MapOfCurveSample (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_MapOfCurveSample &
	:rtype: IntTools_MapOfCurveSample
") Assign;
		IntTools_MapOfCurveSample & Assign (const IntTools_MapOfCurveSample & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_MapOfCurveSample &
	:rtype: IntTools_MapOfCurveSample
") operator=;
		IntTools_MapOfCurveSample & operator = (const IntTools_MapOfCurveSample & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param aKey:
	:type aKey: IntTools_CurveRangeSample &
	:rtype: bool
") Add;
		Standard_Boolean Add (const IntTools_CurveRangeSample & aKey);
		%feature("autodoc", "	:param aKey:
	:type aKey: IntTools_CurveRangeSample &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const IntTools_CurveRangeSample & aKey);
		%feature("autodoc", "	:param aKey:
	:type aKey: IntTools_CurveRangeSample &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const IntTools_CurveRangeSample & aKey);
};


%feature("shadow") IntTools_MapOfCurveSample::~IntTools_MapOfCurveSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_MapOfCurveSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_MapOfSurfaceSample;
class IntTools_MapOfSurfaceSample : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") IntTools_MapOfSurfaceSample;
		 IntTools_MapOfSurfaceSample (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_MapOfSurfaceSample &
	:rtype: IntTools_MapOfSurfaceSample
") Assign;
		IntTools_MapOfSurfaceSample & Assign (const IntTools_MapOfSurfaceSample & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_MapOfSurfaceSample &
	:rtype: IntTools_MapOfSurfaceSample
") operator=;
		IntTools_MapOfSurfaceSample & operator = (const IntTools_MapOfSurfaceSample & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param aKey:
	:type aKey: IntTools_SurfaceRangeSample &
	:rtype: bool
") Add;
		Standard_Boolean Add (const IntTools_SurfaceRangeSample & aKey);
		%feature("autodoc", "	:param aKey:
	:type aKey: IntTools_SurfaceRangeSample &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const IntTools_SurfaceRangeSample & aKey);
		%feature("autodoc", "	:param aKey:
	:type aKey: IntTools_SurfaceRangeSample &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const IntTools_SurfaceRangeSample & aKey);
};


%feature("shadow") IntTools_MapOfSurfaceSample::~IntTools_MapOfSurfaceSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_MapOfSurfaceSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_MarkedRangeSet;
class IntTools_MarkedRangeSet {
	public:
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet ();
		%feature("autodoc", "	* build set of ranges which consists of one range with boundary values theFirstBoundary and theLastBoundary

	:param theFirstBoundary:
	:type theFirstBoundary: float
	:param theLastBoundary:
	:type theLastBoundary: float
	:param theInitFlag:
	:type theInitFlag: Standard_Integer
	:rtype: None
") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet (const Standard_Real theFirstBoundary,const Standard_Real theLastBoundary,const Standard_Integer theInitFlag);
		%feature("autodoc", "	* Build set of ranges based on the array of progressive sorted values Warning: The constructor do not check if the values of array are not sorted It should be checked before function invocation

	:param theSortedArray:
	:type theSortedArray: IntTools_CArray1OfReal &
	:param theInitFlag:
	:type theInitFlag: Standard_Integer
	:rtype: None
") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet (const IntTools_CArray1OfReal & theSortedArray,const Standard_Integer theInitFlag);
		%feature("autodoc", "	* build set of ranges which consists of one range with boundary values theFirstBoundary and theLastBoundary

	:param theFirstBoundary:
	:type theFirstBoundary: float
	:param theLastBoundary:
	:type theLastBoundary: float
	:param theInitFlag:
	:type theInitFlag: Standard_Integer
	:rtype: None
") SetBoundaries;
		void SetBoundaries (const Standard_Real theFirstBoundary,const Standard_Real theLastBoundary,const Standard_Integer theInitFlag);
		%feature("autodoc", "	* Build set of ranges based on the array of progressive sorted values Warning: The function do not check if the values of array are not sorted It should be checked before function invocation

	:param theSortedArray:
	:type theSortedArray: IntTools_CArray1OfReal &
	:param theInitFlag:
	:type theInitFlag: Standard_Integer
	:rtype: None
") SetRanges;
		void SetRanges (const IntTools_CArray1OfReal & theSortedArray,const Standard_Integer theInitFlag);
		%feature("autodoc", "	* Inserts a new range marked with flag theFlag It replace the existing ranges or parts of ranges and their flags. Returns True if the range is inside the initial boundaries, otherwise or in case of some error returns False

	:param theFirstBoundary:
	:type theFirstBoundary: float
	:param theLastBoundary:
	:type theLastBoundary: float
	:param theFlag:
	:type theFlag: Standard_Integer
	:rtype: bool
") InsertRange;
		Standard_Boolean InsertRange (const Standard_Real theFirstBoundary,const Standard_Real theLastBoundary,const Standard_Integer theFlag);
		%feature("autodoc", "	* Inserts a new range marked with flag theFlag It replace the existing ranges or parts of ranges and their flags. Returns True if the range is inside the initial boundaries, otherwise or in case of some error returns False

	:param theRange:
	:type theRange: IntTools_Range &
	:param theFlag:
	:type theFlag: Standard_Integer
	:rtype: bool
") InsertRange;
		Standard_Boolean InsertRange (const IntTools_Range & theRange,const Standard_Integer theFlag);
		%feature("autodoc", "	* Inserts a new range marked with flag theFlag It replace the existing ranges or parts of ranges and their flags. The index theIndex is a position where the range will be inserted. Returns True if the range is inside the initial boundaries, otherwise or in case of some error returns False

	:param theFirstBoundary:
	:type theFirstBoundary: float
	:param theLastBoundary:
	:type theLastBoundary: float
	:param theFlag:
	:type theFlag: Standard_Integer
	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: bool
") InsertRange;
		Standard_Boolean InsertRange (const Standard_Real theFirstBoundary,const Standard_Real theLastBoundary,const Standard_Integer theFlag,const Standard_Integer theIndex);
		%feature("autodoc", "	* Inserts a new range marked with flag theFlag It replace the existing ranges or parts of ranges and their flags. The index theIndex is a position where the range will be inserted. Returns True if the range is inside the initial boundaries, otherwise or in case of some error returns False

	:param theRange:
	:type theRange: IntTools_Range &
	:param theFlag:
	:type theFlag: Standard_Integer
	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: bool
") InsertRange;
		Standard_Boolean InsertRange (const IntTools_Range & theRange,const Standard_Integer theFlag,const Standard_Integer theIndex);
		%feature("autodoc", "	* Set flag theFlag for range with index theIndex

	:param theIndex:
	:type theIndex: Standard_Integer
	:param theFlag:
	:type theFlag: Standard_Integer
	:rtype: None
") SetFlag;
		void SetFlag (const Standard_Integer theIndex,const Standard_Integer theFlag);
		%feature("autodoc", "	* Returns flag of the range with index theIndex

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: int
") Flag;
		Standard_Integer Flag (const Standard_Integer theIndex);
		%feature("autodoc", "	* Returns index of range which contains theValue. If theValue do not belong any range returns 0.

	:param theValue:
	:type theValue: float
	:rtype: int
") GetIndex;
		Standard_Integer GetIndex (const Standard_Real theValue);
		%feature("autodoc", "	:param theValue:
	:type theValue: float
	:rtype: TColStd_SequenceOfInteger
") GetIndices;
		const TColStd_SequenceOfInteger & GetIndices (const Standard_Real theValue);
		%feature("autodoc", "	* Returns index of range which contains theValue If theValue do not belong any range returns 0. If UseLower is Standard_True then lower boundary of the range can be equal to theValue, otherwise upper boundary of the range can be equal to theValue.

	:param theValue:
	:type theValue: float
	:param UseLower:
	:type UseLower: bool
	:rtype: int
") GetIndex;
		Standard_Integer GetIndex (const Standard_Real theValue,const Standard_Boolean UseLower);
		%feature("autodoc", "	* Returns number of ranges

	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	* Returns the range with index theIndex. the Index can be from 1 to Length()

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: IntTools_Range
") Range;
		IntTools_Range Range (const Standard_Integer theIndex);
};


%feature("shadow") IntTools_MarkedRangeSet::~IntTools_MarkedRangeSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_MarkedRangeSet {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_PntOn2Faces;
class IntTools_PntOn2Faces {
	public:
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") IntTools_PntOn2Faces;
		 IntTools_PntOn2Faces ();
		%feature("autodoc", "	* Initializes me by two points aP1 and aP2

	:param aP1:
	:type aP1: IntTools_PntOnFace &
	:param aP2:
	:type aP2: IntTools_PntOnFace &
	:rtype: None
") IntTools_PntOn2Faces;
		 IntTools_PntOn2Faces (const IntTools_PntOnFace & aP1,const IntTools_PntOnFace & aP2);
		%feature("autodoc", "	* Modifier

	:param aP1:
	:type aP1: IntTools_PntOnFace &
	:rtype: None
") SetP1;
		void SetP1 (const IntTools_PntOnFace & aP1);
		%feature("autodoc", "	* Modifier

	:param aP2:
	:type aP2: IntTools_PntOnFace &
	:rtype: None
") SetP2;
		void SetP2 (const IntTools_PntOnFace & aP2);
		%feature("autodoc", "	* Modifier

	:param bF:
	:type bF: bool
	:rtype: None
") SetValid;
		void SetValid (const Standard_Boolean bF);
		%feature("autodoc", "	* Selector

	:rtype: IntTools_PntOnFace
") P1;
		const IntTools_PntOnFace & P1 ();
		%feature("autodoc", "	* Selector

	:rtype: IntTools_PntOnFace
") P2;
		const IntTools_PntOnFace & P2 ();
		%feature("autodoc", "	* Selector

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
};


%feature("shadow") IntTools_PntOn2Faces::~IntTools_PntOn2Faces %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_PntOn2Faces {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_PntOnFace;
class IntTools_PntOnFace {
	public:
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") IntTools_PntOnFace;
		 IntTools_PntOnFace ();
		%feature("autodoc", "	* Initializes me by aFace, a 3d point and it's UV parameters on face

	:param aF:
	:type aF: TopoDS_Face &
	:param aP:
	:type aP: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") Init;
		void Init (const TopoDS_Face & aF,const gp_Pnt & aP,const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "	* Modifier

	:param aF:
	:type aF: TopoDS_Face &
	:rtype: None
") SetFace;
		void SetFace (const TopoDS_Face & aF);
		%feature("autodoc", "	* Modifier

	:param aP:
	:type aP: gp_Pnt
	:rtype: None
") SetPnt;
		void SetPnt (const gp_Pnt & aP);
		%feature("autodoc", "	* Modifier

	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") SetParameters;
		void SetParameters (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "	* Modifier

	:param bF:
	:type bF: bool
	:rtype: None
") SetValid;
		void SetValid (const Standard_Boolean bF);
		%feature("autodoc", "	* Selector

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("autodoc", "	* Selector

	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt ();
		%feature("autodoc", "	* Selector

	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") IntTools_PntOnFace::~IntTools_PntOnFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_PntOnFace {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_QuickSort;
class IntTools_QuickSort {
	public:
		%feature("autodoc", "	:param TheArray:
	:type TheArray: IntTools_Array1OfRoots &
	:param Comp:
	:type Comp: IntTools_Compare &
	:rtype: void
") Sort;
		static void Sort (IntTools_Array1OfRoots & TheArray,const IntTools_Compare & Comp);
};


%feature("shadow") IntTools_QuickSort::~IntTools_QuickSort %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_QuickSort {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_QuickSortRange;
class IntTools_QuickSortRange {
	public:
		%feature("autodoc", "	:param TheArray:
	:type TheArray: IntTools_Array1OfRange &
	:param Comp:
	:type Comp: IntTools_CompareRange &
	:rtype: void
") Sort;
		static void Sort (IntTools_Array1OfRange & TheArray,const IntTools_CompareRange & Comp);
};


%feature("shadow") IntTools_QuickSortRange::~IntTools_QuickSortRange %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_QuickSortRange {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_Range;
class IntTools_Range {
	public:
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") IntTools_Range;
		 IntTools_Range ();
		%feature("autodoc", "	* Initialize me by range boundaries

	:param aFirst:
	:type aFirst: float
	:param aLast:
	:type aLast: float
	:rtype: None
") IntTools_Range;
		 IntTools_Range (const Standard_Real aFirst,const Standard_Real aLast);
		%feature("autodoc", "	* Modifier

	:param aFirst:
	:type aFirst: float
	:rtype: None
") SetFirst;
		void SetFirst (const Standard_Real aFirst);
		%feature("autodoc", "	* Modifier

	:param aLast:
	:type aLast: float
	:rtype: None
") SetLast;
		void SetLast (const Standard_Real aLast);
		%feature("autodoc", "	* Selector

	:rtype: float
") First;
		Standard_Real First ();
		%feature("autodoc", "	* Selector

	:rtype: float
") Last;
		Standard_Real Last ();
		%feature("autodoc", "	* Selector

	:param aFirst:
	:type aFirst: float &
	:param aLast:
	:type aLast: float &
	:rtype: None
") Range;
		void Range (Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") IntTools_Range::~IntTools_Range %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_Range {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_Root;
class IntTools_Root {
	public:
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") IntTools_Root;
		 IntTools_Root ();
		%feature("autodoc", "	* Initializes my by range of parameters and type of root

	:param aRoot:
	:type aRoot: float
	:param aType:
	:type aType: Standard_Integer
	:rtype: None
") IntTools_Root;
		 IntTools_Root (const Standard_Real aRoot,const Standard_Integer aType);
		%feature("autodoc", "	* Sets the Root's value

	:param aRoot:
	:type aRoot: float
	:rtype: None
") SetRoot;
		void SetRoot (const Standard_Real aRoot);
		%feature("autodoc", "	* Sets the Root's Type

	:param aType:
	:type aType: Standard_Integer
	:rtype: None
") SetType;
		void SetType (const Standard_Integer aType);
		%feature("autodoc", "	* Set the value of the state before the root (at t=Root-dt)

	:param aState:
	:type aState: TopAbs_State
	:rtype: None
") SetStateBefore;
		void SetStateBefore (const TopAbs_State aState);
		%feature("autodoc", "	* Set the value of the state after the root (at t=Root-dt)

	:param aState:
	:type aState: TopAbs_State
	:rtype: None
") SetStateAfter;
		void SetStateAfter (const TopAbs_State aState);
		%feature("autodoc", "	* Not used in Edge/Edge algorithm

	:param aHeight:
	:type aHeight: float
	:rtype: None
") SetLayerHeight;
		void SetLayerHeight (const Standard_Real aHeight);
		%feature("autodoc", "	* Sets the interval from which the Root was found [t1,t2] and the corresponding values of the function on the bounds f(t1), f(t2).

	:param t1:
	:type t1: float
	:param t2:
	:type t2: float
	:param f1:
	:type f1: float
	:param f2:
	:type f2: float
	:rtype: None
") SetInterval;
		void SetInterval (const Standard_Real t1,const Standard_Real t2,const Standard_Real f1,const Standard_Real f2);
		%feature("autodoc", "	* Returns the Root value

	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("autodoc", "	* Returns the type of the root =0 - Simple (was found by bisection method); =2 - Smart when f1=0, f2!=0 or vice versa (was found by Fibbonacci method); =1 - Pure (pure zero for all t [t1,t2] );

	:rtype: int
") Type;
		Standard_Integer Type ();
		%feature("autodoc", "	* Returns the state before the root

	:rtype: TopAbs_State
") StateBefore;
		TopAbs_State StateBefore ();
		%feature("autodoc", "	* Returns the state after the root

	:rtype: TopAbs_State
") StateAfter;
		TopAbs_State StateAfter ();
		%feature("autodoc", "	* Not used in Edge/Edge algorithm

	:rtype: float
") LayerHeight;
		Standard_Real LayerHeight ();
		%feature("autodoc", "	* Returns the validity flag for the root, True if myStateBefore==TopAbs_OUT && myStateAfter==TopAbs_IN or myStateBefore==TopAbs_OUT && myStateAfter==TopAbs_ON or myStateBefore==TopAbs_ON && myStateAfter==TopAbs_OUT or myStateBefore==TopAbs_IN && myStateAfter==TopAbs_OUT . For other cases it returns False.

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
		%feature("autodoc", "	* Returns the values of interval from which the Root was found [t1,t2] and the corresponding values of the function on the bounds f(t1), f(t2).

	:param t1:
	:type t1: float &
	:param t2:
	:type t2: float &
	:param f1:
	:type f1: float &
	:param f2:
	:type f2: float &
	:rtype: None
") Interval;
		void Interval (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") IntTools_Root::~IntTools_Root %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_Root {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_SequenceNodeOfSequenceOfCommonPrts;
class IntTools_SequenceNodeOfSequenceOfCommonPrts : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: IntTools_CommonPrt &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntTools_SequenceNodeOfSequenceOfCommonPrts;
		 IntTools_SequenceNodeOfSequenceOfCommonPrts (const IntTools_CommonPrt & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: IntTools_CommonPrt
") Value;
		IntTools_CommonPrt & Value ();
};


%feature("shadow") IntTools_SequenceNodeOfSequenceOfCommonPrts::~IntTools_SequenceNodeOfSequenceOfCommonPrts %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceNodeOfSequenceOfCommonPrts {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_SequenceNodeOfSequenceOfCommonPrts {
	Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts GetHandle() {
	return *(Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts*) &$self;
	}
};

%nodefaultctor Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts;
class Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts();
        Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts(const Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts &aHandle);
        Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts(const IntTools_SequenceNodeOfSequenceOfCommonPrts *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts {
    IntTools_SequenceNodeOfSequenceOfCommonPrts* GetObject() {
    return (IntTools_SequenceNodeOfSequenceOfCommonPrts*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts::~Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_SequenceNodeOfSequenceOfCommonPrts {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_SequenceNodeOfSequenceOfCurves;
class IntTools_SequenceNodeOfSequenceOfCurves : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: IntTools_Curve &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntTools_SequenceNodeOfSequenceOfCurves;
		 IntTools_SequenceNodeOfSequenceOfCurves (const IntTools_Curve & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: IntTools_Curve
") Value;
		IntTools_Curve & Value ();
};


%feature("shadow") IntTools_SequenceNodeOfSequenceOfCurves::~IntTools_SequenceNodeOfSequenceOfCurves %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceNodeOfSequenceOfCurves {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_SequenceNodeOfSequenceOfCurves {
	Handle_IntTools_SequenceNodeOfSequenceOfCurves GetHandle() {
	return *(Handle_IntTools_SequenceNodeOfSequenceOfCurves*) &$self;
	}
};

%nodefaultctor Handle_IntTools_SequenceNodeOfSequenceOfCurves;
class Handle_IntTools_SequenceNodeOfSequenceOfCurves : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntTools_SequenceNodeOfSequenceOfCurves();
        Handle_IntTools_SequenceNodeOfSequenceOfCurves(const Handle_IntTools_SequenceNodeOfSequenceOfCurves &aHandle);
        Handle_IntTools_SequenceNodeOfSequenceOfCurves(const IntTools_SequenceNodeOfSequenceOfCurves *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_SequenceNodeOfSequenceOfCurves DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_SequenceNodeOfSequenceOfCurves {
    IntTools_SequenceNodeOfSequenceOfCurves* GetObject() {
    return (IntTools_SequenceNodeOfSequenceOfCurves*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_SequenceNodeOfSequenceOfCurves::~Handle_IntTools_SequenceNodeOfSequenceOfCurves %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_SequenceNodeOfSequenceOfCurves {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_SequenceNodeOfSequenceOfPntOn2Faces;
class IntTools_SequenceNodeOfSequenceOfPntOn2Faces : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: IntTools_PntOn2Faces &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntTools_SequenceNodeOfSequenceOfPntOn2Faces;
		 IntTools_SequenceNodeOfSequenceOfPntOn2Faces (const IntTools_PntOn2Faces & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: IntTools_PntOn2Faces
") Value;
		IntTools_PntOn2Faces & Value ();
};


%feature("shadow") IntTools_SequenceNodeOfSequenceOfPntOn2Faces::~IntTools_SequenceNodeOfSequenceOfPntOn2Faces %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceNodeOfSequenceOfPntOn2Faces {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_SequenceNodeOfSequenceOfPntOn2Faces {
	Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces GetHandle() {
	return *(Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces*) &$self;
	}
};

%nodefaultctor Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces;
class Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces();
        Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces(const Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces &aHandle);
        Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces(const IntTools_SequenceNodeOfSequenceOfPntOn2Faces *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces {
    IntTools_SequenceNodeOfSequenceOfPntOn2Faces* GetObject() {
    return (IntTools_SequenceNodeOfSequenceOfPntOn2Faces*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces::~Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_SequenceNodeOfSequenceOfPntOn2Faces {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_SequenceNodeOfSequenceOfRanges;
class IntTools_SequenceNodeOfSequenceOfRanges : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: IntTools_Range &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntTools_SequenceNodeOfSequenceOfRanges;
		 IntTools_SequenceNodeOfSequenceOfRanges (const IntTools_Range & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: IntTools_Range
") Value;
		IntTools_Range & Value ();
};


%feature("shadow") IntTools_SequenceNodeOfSequenceOfRanges::~IntTools_SequenceNodeOfSequenceOfRanges %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceNodeOfSequenceOfRanges {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_SequenceNodeOfSequenceOfRanges {
	Handle_IntTools_SequenceNodeOfSequenceOfRanges GetHandle() {
	return *(Handle_IntTools_SequenceNodeOfSequenceOfRanges*) &$self;
	}
};

%nodefaultctor Handle_IntTools_SequenceNodeOfSequenceOfRanges;
class Handle_IntTools_SequenceNodeOfSequenceOfRanges : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntTools_SequenceNodeOfSequenceOfRanges();
        Handle_IntTools_SequenceNodeOfSequenceOfRanges(const Handle_IntTools_SequenceNodeOfSequenceOfRanges &aHandle);
        Handle_IntTools_SequenceNodeOfSequenceOfRanges(const IntTools_SequenceNodeOfSequenceOfRanges *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_SequenceNodeOfSequenceOfRanges DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_SequenceNodeOfSequenceOfRanges {
    IntTools_SequenceNodeOfSequenceOfRanges* GetObject() {
    return (IntTools_SequenceNodeOfSequenceOfRanges*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_SequenceNodeOfSequenceOfRanges::~Handle_IntTools_SequenceNodeOfSequenceOfRanges %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_SequenceNodeOfSequenceOfRanges {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_SequenceNodeOfSequenceOfRoots;
class IntTools_SequenceNodeOfSequenceOfRoots : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: IntTools_Root &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntTools_SequenceNodeOfSequenceOfRoots;
		 IntTools_SequenceNodeOfSequenceOfRoots (const IntTools_Root & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: IntTools_Root
") Value;
		IntTools_Root & Value ();
};


%feature("shadow") IntTools_SequenceNodeOfSequenceOfRoots::~IntTools_SequenceNodeOfSequenceOfRoots %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceNodeOfSequenceOfRoots {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_SequenceNodeOfSequenceOfRoots {
	Handle_IntTools_SequenceNodeOfSequenceOfRoots GetHandle() {
	return *(Handle_IntTools_SequenceNodeOfSequenceOfRoots*) &$self;
	}
};

%nodefaultctor Handle_IntTools_SequenceNodeOfSequenceOfRoots;
class Handle_IntTools_SequenceNodeOfSequenceOfRoots : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntTools_SequenceNodeOfSequenceOfRoots();
        Handle_IntTools_SequenceNodeOfSequenceOfRoots(const Handle_IntTools_SequenceNodeOfSequenceOfRoots &aHandle);
        Handle_IntTools_SequenceNodeOfSequenceOfRoots(const IntTools_SequenceNodeOfSequenceOfRoots *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_SequenceNodeOfSequenceOfRoots DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_SequenceNodeOfSequenceOfRoots {
    IntTools_SequenceNodeOfSequenceOfRoots* GetObject() {
    return (IntTools_SequenceNodeOfSequenceOfRoots*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_SequenceNodeOfSequenceOfRoots::~Handle_IntTools_SequenceNodeOfSequenceOfRoots %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_SequenceNodeOfSequenceOfRoots {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_SequenceOfCommonPrts;
class IntTools_SequenceOfCommonPrts : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_SequenceOfCommonPrts;
		 IntTools_SequenceOfCommonPrts ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SequenceOfCommonPrts &
	:rtype: IntTools_SequenceOfCommonPrts
") Assign;
		const IntTools_SequenceOfCommonPrts & Assign (const IntTools_SequenceOfCommonPrts & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SequenceOfCommonPrts &
	:rtype: IntTools_SequenceOfCommonPrts
") operator=;
		const IntTools_SequenceOfCommonPrts & operator = (const IntTools_SequenceOfCommonPrts & Other);
		%feature("autodoc", "	:param T:
	:type T: IntTools_CommonPrt &
	:rtype: None
") Append;
		void Append (const IntTools_CommonPrt & T);
		%feature("autodoc", "	:param S:
	:type S: IntTools_SequenceOfCommonPrts &
	:rtype: None
") Append;
		void Append (IntTools_SequenceOfCommonPrts & S);
		%feature("autodoc", "	:param T:
	:type T: IntTools_CommonPrt &
	:rtype: None
") Prepend;
		void Prepend (const IntTools_CommonPrt & T);
		%feature("autodoc", "	:param S:
	:type S: IntTools_SequenceOfCommonPrts &
	:rtype: None
") Prepend;
		void Prepend (IntTools_SequenceOfCommonPrts & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntTools_CommonPrt &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntTools_CommonPrt & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntTools_SequenceOfCommonPrts &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntTools_SequenceOfCommonPrts & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntTools_CommonPrt &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntTools_CommonPrt & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntTools_SequenceOfCommonPrts &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntTools_SequenceOfCommonPrts & S);
		%feature("autodoc", "	:rtype: IntTools_CommonPrt
") First;
		const IntTools_CommonPrt & First ();
		%feature("autodoc", "	:rtype: IntTools_CommonPrt
") Last;
		const IntTools_CommonPrt & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: IntTools_SequenceOfCommonPrts &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntTools_SequenceOfCommonPrts & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntTools_CommonPrt
") Value;
		const IntTools_CommonPrt & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: IntTools_CommonPrt &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntTools_CommonPrt & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntTools_CommonPrt
") ChangeValue;
		IntTools_CommonPrt & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IntTools_SequenceOfCommonPrts::~IntTools_SequenceOfCommonPrts %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceOfCommonPrts {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_SequenceOfCurves;
class IntTools_SequenceOfCurves : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_SequenceOfCurves;
		 IntTools_SequenceOfCurves ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SequenceOfCurves &
	:rtype: IntTools_SequenceOfCurves
") Assign;
		const IntTools_SequenceOfCurves & Assign (const IntTools_SequenceOfCurves & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SequenceOfCurves &
	:rtype: IntTools_SequenceOfCurves
") operator=;
		const IntTools_SequenceOfCurves & operator = (const IntTools_SequenceOfCurves & Other);
		%feature("autodoc", "	:param T:
	:type T: IntTools_Curve &
	:rtype: None
") Append;
		void Append (const IntTools_Curve & T);
		%feature("autodoc", "	:param S:
	:type S: IntTools_SequenceOfCurves &
	:rtype: None
") Append;
		void Append (IntTools_SequenceOfCurves & S);
		%feature("autodoc", "	:param T:
	:type T: IntTools_Curve &
	:rtype: None
") Prepend;
		void Prepend (const IntTools_Curve & T);
		%feature("autodoc", "	:param S:
	:type S: IntTools_SequenceOfCurves &
	:rtype: None
") Prepend;
		void Prepend (IntTools_SequenceOfCurves & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntTools_Curve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntTools_Curve & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntTools_SequenceOfCurves &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntTools_SequenceOfCurves & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntTools_Curve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntTools_Curve & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntTools_SequenceOfCurves &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntTools_SequenceOfCurves & S);
		%feature("autodoc", "	:rtype: IntTools_Curve
") First;
		const IntTools_Curve & First ();
		%feature("autodoc", "	:rtype: IntTools_Curve
") Last;
		const IntTools_Curve & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: IntTools_SequenceOfCurves &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntTools_SequenceOfCurves & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntTools_Curve
") Value;
		const IntTools_Curve & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: IntTools_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntTools_Curve & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntTools_Curve
") ChangeValue;
		IntTools_Curve & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IntTools_SequenceOfCurves::~IntTools_SequenceOfCurves %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceOfCurves {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_SequenceOfPntOn2Faces;
class IntTools_SequenceOfPntOn2Faces : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_SequenceOfPntOn2Faces;
		 IntTools_SequenceOfPntOn2Faces ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SequenceOfPntOn2Faces &
	:rtype: IntTools_SequenceOfPntOn2Faces
") Assign;
		const IntTools_SequenceOfPntOn2Faces & Assign (const IntTools_SequenceOfPntOn2Faces & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SequenceOfPntOn2Faces &
	:rtype: IntTools_SequenceOfPntOn2Faces
") operator=;
		const IntTools_SequenceOfPntOn2Faces & operator = (const IntTools_SequenceOfPntOn2Faces & Other);
		%feature("autodoc", "	:param T:
	:type T: IntTools_PntOn2Faces &
	:rtype: None
") Append;
		void Append (const IntTools_PntOn2Faces & T);
		%feature("autodoc", "	:param S:
	:type S: IntTools_SequenceOfPntOn2Faces &
	:rtype: None
") Append;
		void Append (IntTools_SequenceOfPntOn2Faces & S);
		%feature("autodoc", "	:param T:
	:type T: IntTools_PntOn2Faces &
	:rtype: None
") Prepend;
		void Prepend (const IntTools_PntOn2Faces & T);
		%feature("autodoc", "	:param S:
	:type S: IntTools_SequenceOfPntOn2Faces &
	:rtype: None
") Prepend;
		void Prepend (IntTools_SequenceOfPntOn2Faces & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntTools_PntOn2Faces &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntTools_PntOn2Faces & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntTools_SequenceOfPntOn2Faces &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntTools_SequenceOfPntOn2Faces & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntTools_PntOn2Faces &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntTools_PntOn2Faces & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntTools_SequenceOfPntOn2Faces &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntTools_SequenceOfPntOn2Faces & S);
		%feature("autodoc", "	:rtype: IntTools_PntOn2Faces
") First;
		const IntTools_PntOn2Faces & First ();
		%feature("autodoc", "	:rtype: IntTools_PntOn2Faces
") Last;
		const IntTools_PntOn2Faces & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: IntTools_SequenceOfPntOn2Faces &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntTools_SequenceOfPntOn2Faces & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntTools_PntOn2Faces
") Value;
		const IntTools_PntOn2Faces & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: IntTools_PntOn2Faces &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntTools_PntOn2Faces & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntTools_PntOn2Faces
") ChangeValue;
		IntTools_PntOn2Faces & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IntTools_SequenceOfPntOn2Faces::~IntTools_SequenceOfPntOn2Faces %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceOfPntOn2Faces {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_SequenceOfRanges;
class IntTools_SequenceOfRanges : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_SequenceOfRanges;
		 IntTools_SequenceOfRanges ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SequenceOfRanges &
	:rtype: IntTools_SequenceOfRanges
") Assign;
		const IntTools_SequenceOfRanges & Assign (const IntTools_SequenceOfRanges & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SequenceOfRanges &
	:rtype: IntTools_SequenceOfRanges
") operator=;
		const IntTools_SequenceOfRanges & operator = (const IntTools_SequenceOfRanges & Other);
		%feature("autodoc", "	:param T:
	:type T: IntTools_Range &
	:rtype: None
") Append;
		void Append (const IntTools_Range & T);
		%feature("autodoc", "	:param S:
	:type S: IntTools_SequenceOfRanges &
	:rtype: None
") Append;
		void Append (IntTools_SequenceOfRanges & S);
		%feature("autodoc", "	:param T:
	:type T: IntTools_Range &
	:rtype: None
") Prepend;
		void Prepend (const IntTools_Range & T);
		%feature("autodoc", "	:param S:
	:type S: IntTools_SequenceOfRanges &
	:rtype: None
") Prepend;
		void Prepend (IntTools_SequenceOfRanges & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntTools_Range &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntTools_Range & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntTools_SequenceOfRanges &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntTools_SequenceOfRanges & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntTools_Range &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntTools_Range & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntTools_SequenceOfRanges &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntTools_SequenceOfRanges & S);
		%feature("autodoc", "	:rtype: IntTools_Range
") First;
		const IntTools_Range & First ();
		%feature("autodoc", "	:rtype: IntTools_Range
") Last;
		const IntTools_Range & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: IntTools_SequenceOfRanges &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntTools_SequenceOfRanges & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntTools_Range
") Value;
		const IntTools_Range & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: IntTools_Range &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntTools_Range & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntTools_Range
") ChangeValue;
		IntTools_Range & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IntTools_SequenceOfRanges::~IntTools_SequenceOfRanges %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceOfRanges {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_SequenceOfRoots;
class IntTools_SequenceOfRoots : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_SequenceOfRoots;
		 IntTools_SequenceOfRoots ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SequenceOfRoots &
	:rtype: IntTools_SequenceOfRoots
") Assign;
		const IntTools_SequenceOfRoots & Assign (const IntTools_SequenceOfRoots & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SequenceOfRoots &
	:rtype: IntTools_SequenceOfRoots
") operator=;
		const IntTools_SequenceOfRoots & operator = (const IntTools_SequenceOfRoots & Other);
		%feature("autodoc", "	:param T:
	:type T: IntTools_Root &
	:rtype: None
") Append;
		void Append (const IntTools_Root & T);
		%feature("autodoc", "	:param S:
	:type S: IntTools_SequenceOfRoots &
	:rtype: None
") Append;
		void Append (IntTools_SequenceOfRoots & S);
		%feature("autodoc", "	:param T:
	:type T: IntTools_Root &
	:rtype: None
") Prepend;
		void Prepend (const IntTools_Root & T);
		%feature("autodoc", "	:param S:
	:type S: IntTools_SequenceOfRoots &
	:rtype: None
") Prepend;
		void Prepend (IntTools_SequenceOfRoots & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntTools_Root &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntTools_Root & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntTools_SequenceOfRoots &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntTools_SequenceOfRoots & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntTools_Root &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntTools_Root & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntTools_SequenceOfRoots &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntTools_SequenceOfRoots & S);
		%feature("autodoc", "	:rtype: IntTools_Root
") First;
		const IntTools_Root & First ();
		%feature("autodoc", "	:rtype: IntTools_Root
") Last;
		const IntTools_Root & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: IntTools_SequenceOfRoots &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntTools_SequenceOfRoots & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntTools_Root
") Value;
		const IntTools_Root & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: IntTools_Root &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntTools_Root & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntTools_Root
") ChangeValue;
		IntTools_Root & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IntTools_SequenceOfRoots::~IntTools_SequenceOfRoots %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SequenceOfRoots {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_StdMapNodeOfMapOfCurveSample;
class IntTools_StdMapNodeOfMapOfCurveSample : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: IntTools_CurveRangeSample &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") IntTools_StdMapNodeOfMapOfCurveSample;
		 IntTools_StdMapNodeOfMapOfCurveSample (const IntTools_CurveRangeSample & K,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: IntTools_CurveRangeSample
") Key;
		IntTools_CurveRangeSample & Key ();
};


%feature("shadow") IntTools_StdMapNodeOfMapOfCurveSample::~IntTools_StdMapNodeOfMapOfCurveSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_StdMapNodeOfMapOfCurveSample {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_StdMapNodeOfMapOfCurveSample {
	Handle_IntTools_StdMapNodeOfMapOfCurveSample GetHandle() {
	return *(Handle_IntTools_StdMapNodeOfMapOfCurveSample*) &$self;
	}
};

%nodefaultctor Handle_IntTools_StdMapNodeOfMapOfCurveSample;
class Handle_IntTools_StdMapNodeOfMapOfCurveSample : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntTools_StdMapNodeOfMapOfCurveSample();
        Handle_IntTools_StdMapNodeOfMapOfCurveSample(const Handle_IntTools_StdMapNodeOfMapOfCurveSample &aHandle);
        Handle_IntTools_StdMapNodeOfMapOfCurveSample(const IntTools_StdMapNodeOfMapOfCurveSample *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_StdMapNodeOfMapOfCurveSample DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_StdMapNodeOfMapOfCurveSample {
    IntTools_StdMapNodeOfMapOfCurveSample* GetObject() {
    return (IntTools_StdMapNodeOfMapOfCurveSample*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_StdMapNodeOfMapOfCurveSample::~Handle_IntTools_StdMapNodeOfMapOfCurveSample %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_StdMapNodeOfMapOfCurveSample {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_StdMapNodeOfMapOfSurfaceSample;
class IntTools_StdMapNodeOfMapOfSurfaceSample : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: IntTools_SurfaceRangeSample &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") IntTools_StdMapNodeOfMapOfSurfaceSample;
		 IntTools_StdMapNodeOfMapOfSurfaceSample (const IntTools_SurfaceRangeSample & K,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: IntTools_SurfaceRangeSample
") Key;
		IntTools_SurfaceRangeSample & Key ();
};


%feature("shadow") IntTools_StdMapNodeOfMapOfSurfaceSample::~IntTools_StdMapNodeOfMapOfSurfaceSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_StdMapNodeOfMapOfSurfaceSample {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_StdMapNodeOfMapOfSurfaceSample {
	Handle_IntTools_StdMapNodeOfMapOfSurfaceSample GetHandle() {
	return *(Handle_IntTools_StdMapNodeOfMapOfSurfaceSample*) &$self;
	}
};

%nodefaultctor Handle_IntTools_StdMapNodeOfMapOfSurfaceSample;
class Handle_IntTools_StdMapNodeOfMapOfSurfaceSample : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntTools_StdMapNodeOfMapOfSurfaceSample();
        Handle_IntTools_StdMapNodeOfMapOfSurfaceSample(const Handle_IntTools_StdMapNodeOfMapOfSurfaceSample &aHandle);
        Handle_IntTools_StdMapNodeOfMapOfSurfaceSample(const IntTools_StdMapNodeOfMapOfSurfaceSample *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_StdMapNodeOfMapOfSurfaceSample DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_StdMapNodeOfMapOfSurfaceSample {
    IntTools_StdMapNodeOfMapOfSurfaceSample* GetObject() {
    return (IntTools_StdMapNodeOfMapOfSurfaceSample*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_StdMapNodeOfMapOfSurfaceSample::~Handle_IntTools_StdMapNodeOfMapOfSurfaceSample %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_StdMapNodeOfMapOfSurfaceSample {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_SurfaceRangeLocalizeData;
class IntTools_SurfaceRangeLocalizeData {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData ();
		%feature("autodoc", "	:param theNbSampleU:
	:type theNbSampleU: Standard_Integer
	:param theNbSampleV:
	:type theNbSampleV: Standard_Integer
	:param theMinRangeU:
	:type theMinRangeU: float
	:param theMinRangeV:
	:type theMinRangeV: float
	:rtype: None
") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData (const Standard_Integer theNbSampleU,const Standard_Integer theNbSampleV,const Standard_Real theMinRangeU,const Standard_Real theMinRangeV);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SurfaceRangeLocalizeData &
	:rtype: None
") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData (const IntTools_SurfaceRangeLocalizeData & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SurfaceRangeLocalizeData &
	:rtype: IntTools_SurfaceRangeLocalizeData
") Assign;
		IntTools_SurfaceRangeLocalizeData & Assign (const IntTools_SurfaceRangeLocalizeData & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SurfaceRangeLocalizeData &
	:rtype: IntTools_SurfaceRangeLocalizeData
") operator=;
		IntTools_SurfaceRangeLocalizeData & operator = (const IntTools_SurfaceRangeLocalizeData & Other);
		%feature("autodoc", "	:rtype: int
") GetNbSampleU;
		Standard_Integer GetNbSampleU ();
		%feature("autodoc", "	:rtype: int
") GetNbSampleV;
		Standard_Integer GetNbSampleV ();
		%feature("autodoc", "	:rtype: float
") GetMinRangeU;
		Standard_Real GetMinRangeU ();
		%feature("autodoc", "	:rtype: float
") GetMinRangeV;
		Standard_Real GetMinRangeV ();
		%feature("autodoc", "	:param theRange:
	:type theRange: IntTools_SurfaceRangeSample &
	:rtype: None
") AddOutRange;
		void AddOutRange (const IntTools_SurfaceRangeSample & theRange);
		%feature("autodoc", "	:param theRange:
	:type theRange: IntTools_SurfaceRangeSample &
	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: None
") AddBox;
		void AddBox (const IntTools_SurfaceRangeSample & theRange,const Bnd_Box & theBox);
		%feature("autodoc", "	:param theRange:
	:type theRange: IntTools_SurfaceRangeSample &
	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: bool
") FindBox;
		Standard_Boolean FindBox (const IntTools_SurfaceRangeSample & theRange,Bnd_Box & theBox);
		%feature("autodoc", "	:param theRange:
	:type theRange: IntTools_SurfaceRangeSample &
	:rtype: bool
") IsRangeOut;
		Standard_Boolean IsRangeOut (const IntTools_SurfaceRangeSample & theRange);
		%feature("autodoc", "	:param theList:
	:type theList: IntTools_ListOfSurfaceRangeSample &
	:rtype: None
") ListRangeOut;
		void ListRangeOut (IntTools_ListOfSurfaceRangeSample & theList);
		%feature("autodoc", "	:rtype: None
") RemoveRangeOutAll;
		void RemoveRangeOutAll ();
		%feature("autodoc", "	* Set the grid deflection.

	:param theDeflection:
	:type theDeflection: float
	:rtype: None
") SetGridDeflection;
		void SetGridDeflection (const Standard_Real theDeflection);
		%feature("autodoc", "	* Query the grid deflection.

	:rtype: float
") GetGridDeflection;
		Standard_Real GetGridDeflection ();
		%feature("autodoc", "	* Set the range U of the grid of points.

	:param theNbUGrid:
	:type theNbUGrid: Standard_Integer
	:rtype: None
") SetRangeUGrid;
		void SetRangeUGrid (const Standard_Integer theNbUGrid);
		%feature("autodoc", "	* Query the range U of the grid of points.

	:rtype: int
") GetRangeUGrid;
		Standard_Integer GetRangeUGrid ();
		%feature("autodoc", "	* Set the U parameter of the grid points at that index.

	:param theIndex:
	:type theIndex: Standard_Integer
	:param theUParam:
	:type theUParam: float
	:rtype: None
") SetUParam;
		void SetUParam (const Standard_Integer theIndex,const Standard_Real theUParam);
		%feature("autodoc", "	* Query the U parameter of the grid points at that index.

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: float
") GetUParam;
		Standard_Real GetUParam (const Standard_Integer theIndex);
		%feature("autodoc", "	* Set the range V of the grid of points.

	:param theNbVGrid:
	:type theNbVGrid: Standard_Integer
	:rtype: None
") SetRangeVGrid;
		void SetRangeVGrid (const Standard_Integer theNbVGrid);
		%feature("autodoc", "	* Query the range V of the grid of points.

	:rtype: int
") GetRangeVGrid;
		Standard_Integer GetRangeVGrid ();
		%feature("autodoc", "	* Set the V parameter of the grid points at that index.

	:param theIndex:
	:type theIndex: Standard_Integer
	:param theVParam:
	:type theVParam: float
	:rtype: None
") SetVParam;
		void SetVParam (const Standard_Integer theIndex,const Standard_Real theVParam);
		%feature("autodoc", "	* Query the V parameter of the grid points at that index.

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: float
") GetVParam;
		Standard_Real GetVParam (const Standard_Integer theIndex);
		%feature("autodoc", "	* Set the grid point.

	:param theUIndex:
	:type theUIndex: Standard_Integer
	:param theVIndex:
	:type theVIndex: Standard_Integer
	:param thePoint:
	:type thePoint: gp_Pnt
	:rtype: None
") SetGridPoint;
		void SetGridPoint (const Standard_Integer theUIndex,const Standard_Integer theVIndex,const gp_Pnt & thePoint);
		%feature("autodoc", "	* Set the grid point.

	:param theUIndex:
	:type theUIndex: Standard_Integer
	:param theVIndex:
	:type theVIndex: Standard_Integer
	:rtype: gp_Pnt
") GetGridPoint;
		const gp_Pnt  GetGridPoint (const Standard_Integer theUIndex,const Standard_Integer theVIndex);
		%feature("autodoc", "	* Sets the frame area. Used to work with grid points.

	:param theUMin:
	:type theUMin: float
	:param theUMax:
	:type theUMax: float
	:param theVMin:
	:type theVMin: float
	:param theVMax:
	:type theVMax: float
	:rtype: None
") SetFrame;
		void SetFrame (const Standard_Real theUMin,const Standard_Real theUMax,const Standard_Real theVMin,const Standard_Real theVMax);
		%feature("autodoc", "	* Returns the number of grid points on U direction in frame.

	:rtype: int
") GetNBUPointsInFrame;
		Standard_Integer GetNBUPointsInFrame ();
		%feature("autodoc", "	* Returns the number of grid points on V direction in frame.

	:rtype: int
") GetNBVPointsInFrame;
		Standard_Integer GetNBVPointsInFrame ();
		%feature("autodoc", "	* Returns the grid point in frame.

	:param theUIndex:
	:type theUIndex: Standard_Integer
	:param theVIndex:
	:type theVIndex: Standard_Integer
	:rtype: gp_Pnt
") GetPointInFrame;
		const gp_Pnt  GetPointInFrame (const Standard_Integer theUIndex,const Standard_Integer theVIndex);
		%feature("autodoc", "	* Query the U parameter of the grid points at that index in frame.

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: float
") GetUParamInFrame;
		Standard_Real GetUParamInFrame (const Standard_Integer theIndex);
		%feature("autodoc", "	* Query the V parameter of the grid points at that index in frame.

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: float
") GetVParamInFrame;
		Standard_Real GetVParamInFrame (const Standard_Integer theIndex);
		%feature("autodoc", "	* Clears the grid of points.

	:rtype: None
") ClearGrid;
		void ClearGrid ();
};


%feature("shadow") IntTools_SurfaceRangeLocalizeData::~IntTools_SurfaceRangeLocalizeData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SurfaceRangeLocalizeData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_SurfaceRangeSample;
class IntTools_SurfaceRangeSample {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample ();
		%feature("autodoc", "	:param theIndexU:
	:type theIndexU: Standard_Integer
	:param theDepthU:
	:type theDepthU: Standard_Integer
	:param theIndexV:
	:type theIndexV: Standard_Integer
	:param theDepthV:
	:type theDepthV: Standard_Integer
	:rtype: None
") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample (const Standard_Integer theIndexU,const Standard_Integer theDepthU,const Standard_Integer theIndexV,const Standard_Integer theDepthV);
		%feature("autodoc", "	:param theRangeU:
	:type theRangeU: IntTools_CurveRangeSample &
	:param theRangeV:
	:type theRangeV: IntTools_CurveRangeSample &
	:rtype: None
") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample (const IntTools_CurveRangeSample & theRangeU,const IntTools_CurveRangeSample & theRangeV);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SurfaceRangeSample &
	:rtype: None
") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample (const IntTools_SurfaceRangeSample & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SurfaceRangeSample &
	:rtype: IntTools_SurfaceRangeSample
") Assign;
		IntTools_SurfaceRangeSample & Assign (const IntTools_SurfaceRangeSample & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SurfaceRangeSample &
	:rtype: IntTools_SurfaceRangeSample
") operator=;
		IntTools_SurfaceRangeSample & operator = (const IntTools_SurfaceRangeSample & Other);
		%feature("autodoc", "	:param theRangeU:
	:type theRangeU: IntTools_CurveRangeSample &
	:param theRangeV:
	:type theRangeV: IntTools_CurveRangeSample &
	:rtype: None
") SetRanges;
		void SetRanges (const IntTools_CurveRangeSample & theRangeU,const IntTools_CurveRangeSample & theRangeV);
		%feature("autodoc", "	:param theRangeU:
	:type theRangeU: IntTools_CurveRangeSample &
	:param theRangeV:
	:type theRangeV: IntTools_CurveRangeSample &
	:rtype: None
") GetRanges;
		void GetRanges (IntTools_CurveRangeSample & theRangeU,IntTools_CurveRangeSample & theRangeV);
		%feature("autodoc", "	:param theIndexU:
	:type theIndexU: Standard_Integer
	:param theIndexV:
	:type theIndexV: Standard_Integer
	:rtype: None
") SetIndexes;
		void SetIndexes (const Standard_Integer theIndexU,const Standard_Integer theIndexV);
		%feature("autodoc", "	:param theIndexU:
	:type theIndexU: Standard_Integer &
	:param theIndexV:
	:type theIndexV: Standard_Integer &
	:rtype: None
") GetIndexes;
		void GetIndexes (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param theDepthU:
	:type theDepthU: Standard_Integer &
	:param theDepthV:
	:type theDepthV: Standard_Integer &
	:rtype: None
") GetDepths;
		void GetDepths (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param theRangeSampleU:
	:type theRangeSampleU: IntTools_CurveRangeSample &
	:rtype: None
") SetSampleRangeU;
		void SetSampleRangeU (const IntTools_CurveRangeSample & theRangeSampleU);
		%feature("autodoc", "	:rtype: IntTools_CurveRangeSample
") GetSampleRangeU;
		const IntTools_CurveRangeSample & GetSampleRangeU ();
		%feature("autodoc", "	:param theRangeSampleV:
	:type theRangeSampleV: IntTools_CurveRangeSample &
	:rtype: None
") SetSampleRangeV;
		void SetSampleRangeV (const IntTools_CurveRangeSample & theRangeSampleV);
		%feature("autodoc", "	:rtype: IntTools_CurveRangeSample
") GetSampleRangeV;
		const IntTools_CurveRangeSample & GetSampleRangeV ();
		%feature("autodoc", "	:param theIndexU:
	:type theIndexU: Standard_Integer
	:rtype: None
") SetIndexU;
		void SetIndexU (const Standard_Integer theIndexU);
		%feature("autodoc", "	:rtype: int
") GetIndexU;
		Standard_Integer GetIndexU ();
		%feature("autodoc", "	:param theIndexV:
	:type theIndexV: Standard_Integer
	:rtype: None
") SetIndexV;
		void SetIndexV (const Standard_Integer theIndexV);
		%feature("autodoc", "	:rtype: int
") GetIndexV;
		Standard_Integer GetIndexV ();
		%feature("autodoc", "	:param theDepthU:
	:type theDepthU: Standard_Integer
	:rtype: None
") SetDepthU;
		void SetDepthU (const Standard_Integer theDepthU);
		%feature("autodoc", "	:rtype: int
") GetDepthU;
		Standard_Integer GetDepthU ();
		%feature("autodoc", "	:param theDepthV:
	:type theDepthV: Standard_Integer
	:rtype: None
") SetDepthV;
		void SetDepthV (const Standard_Integer theDepthV);
		%feature("autodoc", "	:rtype: int
") GetDepthV;
		Standard_Integer GetDepthV ();
		%feature("autodoc", "	:param theFirstU:
	:type theFirstU: float
	:param theLastU:
	:type theLastU: float
	:param theNbSampleU:
	:type theNbSampleU: Standard_Integer
	:rtype: IntTools_Range
") GetRangeU;
		IntTools_Range GetRangeU (const Standard_Real theFirstU,const Standard_Real theLastU,const Standard_Integer theNbSampleU);
		%feature("autodoc", "	:param theFirstV:
	:type theFirstV: float
	:param theLastV:
	:type theLastV: float
	:param theNbSampleV:
	:type theNbSampleV: Standard_Integer
	:rtype: IntTools_Range
") GetRangeV;
		IntTools_Range GetRangeV (const Standard_Real theFirstV,const Standard_Real theLastV,const Standard_Integer theNbSampleV);
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_SurfaceRangeSample &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const IntTools_SurfaceRangeSample & Other);
		%feature("autodoc", "	:param theNbSampleU:
	:type theNbSampleU: Standard_Integer
	:rtype: int
") GetRangeIndexUDeeper;
		Standard_Integer GetRangeIndexUDeeper (const Standard_Integer theNbSampleU);
		%feature("autodoc", "	:param theNbSampleV:
	:type theNbSampleV: Standard_Integer
	:rtype: int
") GetRangeIndexVDeeper;
		Standard_Integer GetRangeIndexVDeeper (const Standard_Integer theNbSampleV);
};


%feature("shadow") IntTools_SurfaceRangeSample::~IntTools_SurfaceRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SurfaceRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_SurfaceRangeSampleMapHasher;
class IntTools_SurfaceRangeSampleMapHasher {
	public:
		%feature("autodoc", "	* Returns a HasCode value for the Key <K> in the range 0..Upper.

	:param K:
	:type K: IntTools_SurfaceRangeSample &
	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const IntTools_SurfaceRangeSample & K,const Standard_Integer Upper);
		%feature("autodoc", "	* Returns True when the two keys are the same. Two same keys must have the same hashcode, the contrary is not necessary.

	:param S1:
	:type S1: IntTools_SurfaceRangeSample &
	:param S2:
	:type S2: IntTools_SurfaceRangeSample &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const IntTools_SurfaceRangeSample & S1,const IntTools_SurfaceRangeSample & S2);
};


%feature("shadow") IntTools_SurfaceRangeSampleMapHasher::~IntTools_SurfaceRangeSampleMapHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_SurfaceRangeSampleMapHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_Tools;
class IntTools_Tools {
	public:
		%feature("autodoc", "	* Computes distance between vertex V1 and vertex V2, if the distance is less than sum of vertex tolerances returns zero, otherwise returns negative value

	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: int
") ComputeVV;
		static Standard_Integer ComputeVV (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	* Returns True if wire aW contains edges with INTERNAL orientation

	:param aW:
	:type aW: TopoDS_Wire &
	:rtype: bool
") HasInternalEdge;
		static Standard_Boolean HasInternalEdge (const TopoDS_Wire & aW);
		%feature("autodoc", "	* Build a face based on surface of given face aF and bounded by wire aW

	:param aW:
	:type aW: TopoDS_Wire &
	:param aF:
	:type aF: TopoDS_Face &
	:param aFNew:
	:type aFNew: TopoDS_Face &
	:rtype: void
") MakeFaceFromWireAndFace;
		static void MakeFaceFromWireAndFace (const TopoDS_Wire & aW,const TopoDS_Face & aF,TopoDS_Face & aFNew);
		%feature("autodoc", "	* 

	:param aF:
	:type aF: TopoDS_Face &
	:param P:
	:type P: gp_Pnt2d
	:rtype: TopAbs_State
") ClassifyPointByFace;
		static TopAbs_State ClassifyPointByFace (const TopoDS_Face & aF,const gp_Pnt2d & P);
		%feature("autodoc", "	* Computes square distance between a point on the edge E corresponded to parameter t and vertices of edge E. Returns True if this distance is less than square tolerance of vertex, otherwise returns false.

	:param E:
	:type E: TopoDS_Edge &
	:param t:
	:type t: float
	:rtype: bool
") IsVertex;
		static Standard_Boolean IsVertex (const TopoDS_Edge & E,const Standard_Real t);
		%feature("autodoc", "	* Returns True if square distance between vertex V and a point on the edge E corresponded to parameter t is less than square tolerance of V

	:param E:
	:type E: TopoDS_Edge &
	:param V:
	:type V: TopoDS_Vertex &
	:param t:
	:type t: float
	:rtype: bool
") IsVertex;
		static Standard_Boolean IsVertex (const TopoDS_Edge & E,const TopoDS_Vertex & V,const Standard_Real t);
		%feature("autodoc", "	* Returns True if IsVertx for middle parameter of fist range and first edge returns True and if IsVertex for middle parameter of second range and second range returns True, otherwise returns False

	:param aCmnPrt:
	:type aCmnPrt: IntTools_CommonPrt &
	:rtype: bool
") IsVertex;
		static Standard_Boolean IsVertex (const IntTools_CommonPrt & aCmnPrt);
		%feature("autodoc", "	* Gets boundary of parameters of E1 and E2. Computes 3d points on each corresponded to average parameters. Returns True if distance between computed points is less than sum of edge tolerance, otherwise returns False.

	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:rtype: bool
") IsMiddlePointsEqual;
		static Standard_Boolean IsMiddlePointsEqual (const TopoDS_Edge & E1,const TopoDS_Edge & E2);
		%feature("autodoc", "	* Returns True if the distance between point aP and vertex aV is less or equal to sum of aTolPV and vertex tolerance, otherwise returns False

	:param aP:
	:type aP: gp_Pnt
	:param aTolPV:
	:type aTolPV: float
	:param aV:
	:type aV: TopoDS_Vertex &
	:rtype: bool
") IsVertex;
		static Standard_Boolean IsVertex (const gp_Pnt & aP,const Standard_Real aTolPV,const TopoDS_Vertex & aV);
		%feature("autodoc", "	* Returns some value between aFirst and aLast

	:param aFirst:
	:type aFirst: float
	:param aLast:
	:type aLast: float
	:rtype: float
") IntermediatePoint;
		static Standard_Real IntermediatePoint (const Standard_Real aFirst,const Standard_Real aLast);
		%feature("autodoc", "	* Split aC by average parameter if aC is closed in 3D. Returns positive value if splitting has been done, otherwise returns zero.

	:param aC:
	:type aC: IntTools_Curve &
	:param aS:
	:type aS: IntTools_SequenceOfCurves &
	:rtype: int
") SplitCurve;
		static Standard_Integer SplitCurve (const IntTools_Curve & aC,IntTools_SequenceOfCurves & aS);
		%feature("autodoc", "	* Puts curves from aSIn to aSOut except those curves that are coincide with first curve from aSIn.

	:param aSIn:
	:type aSIn: IntTools_SequenceOfCurves &
	:param aSOut:
	:type aSOut: IntTools_SequenceOfCurves &
	:rtype: void
") RejectLines;
		static void RejectLines (const IntTools_SequenceOfCurves & aSIn,IntTools_SequenceOfCurves & aSOut);
		%feature("autodoc", "	* Returns True if D1 and D2 coinside

	:param D1:
	:type D1: gp_Dir
	:param D2:
	:type D2: gp_Dir
	:rtype: bool
") IsDirsCoinside;
		static Standard_Boolean IsDirsCoinside (const gp_Dir & D1,const gp_Dir & D2);
		%feature("autodoc", "	* Returns True if D1 and D2 coinside with given tolerance

	:param D1:
	:type D1: gp_Dir
	:param D2:
	:type D2: gp_Dir
	:param aTol:
	:type aTol: float
	:rtype: bool
") IsDirsCoinside;
		static Standard_Boolean IsDirsCoinside (const gp_Dir & D1,const gp_Dir & D2,const Standard_Real aTol);
		%feature("autodoc", "	* Returns True if aC is BoundedCurve from Geom and the distance between first point of the curve aC and last point is less than 1.e-12

	:param aC:
	:type aC: Handle_Geom_Curve &
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const Handle_Geom_Curve & aC);
		%feature("autodoc", "	* Returns adaptive tolerance for given aTolBase if aC is trimmed curve and basis curve is parabola, otherwise returns value of aTolBase

	:param aC:
	:type aC: Handle_Geom_Curve &
	:param aTolBase:
	:type aTolBase: float
	:rtype: float
") CurveTolerance;
		static Standard_Real CurveTolerance (const Handle_Geom_Curve & aC,const Standard_Real aTolBase);
};


%feature("shadow") IntTools_Tools::~IntTools_Tools %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_Tools {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntTools_TopolTool;
class IntTools_TopolTool : public Adaptor3d_TopolTool {
	public:
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") IntTools_TopolTool;
		 IntTools_TopolTool ();
		%feature("autodoc", "	* Initializes me by surface

	:param theSurface:
	:type theSurface: Handle_Adaptor3d_HSurface &
	:rtype: None
") IntTools_TopolTool;
		 IntTools_TopolTool (const Handle_Adaptor3d_HSurface & theSurface);
		%feature("autodoc", "	* Redefined empty initializer Warning: Raises the exception NotImplemented

	:rtype: void
") Initialize;
		virtual void Initialize ();
		%feature("autodoc", "	* Initializes me by surface

	:param theSurface:
	:type theSurface: Handle_Adaptor3d_HSurface &
	:rtype: void
") Initialize;
		virtual void Initialize (const Handle_Adaptor3d_HSurface & theSurface);
		%feature("autodoc", "	* 

	:rtype: void
") ComputeSamplePoints;
		virtual void ComputeSamplePoints ();
		%feature("autodoc", "	* Computes the sample-points for the intersections algorithms

	:rtype: int
") NbSamplesU;
		virtual Standard_Integer NbSamplesU ();
		%feature("autodoc", "	* Computes the sample-points for the intersections algorithms

	:rtype: int
") NbSamplesV;
		virtual Standard_Integer NbSamplesV ();
		%feature("autodoc", "	* Computes the sample-points for the intersections algorithms

	:rtype: int
") NbSamples;
		virtual Standard_Integer NbSamples ();
		%feature("autodoc", "	* Returns a 2d point from surface myS and a corresponded 3d point for given index. The index should be from 1 to NbSamples()

	:param Index:
	:type Index: Standard_Integer
	:param P2d:
	:type P2d: gp_Pnt2d
	:param P3d:
	:type P3d: gp_Pnt
	:rtype: void
") SamplePoint;
		virtual void SamplePoint (const Standard_Integer Index,gp_Pnt2d & P2d,gp_Pnt & P3d);
		%feature("autodoc", "	* compute the sample-points for the intersections algorithms by adaptive algorithm for BSpline surfaces. For other surfaces algorithm is the same as in method ComputeSamplePoints(), but only fill arrays of U and V sample parameters; theDefl is a requred deflection theNUmin, theNVmin are minimal nb points for U and V.

	:param theDefl:
	:type theDefl: float
	:param theNUmin:
	:type theNUmin: Standard_Integer
	:param theNVmin:
	:type theNVmin: Standard_Integer
	:rtype: void
") SamplePnts;
		virtual void SamplePnts (const Standard_Real theDefl,const Standard_Integer theNUmin,const Standard_Integer theNVmin);
};


%feature("shadow") IntTools_TopolTool::~IntTools_TopolTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_TopolTool {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntTools_TopolTool {
	Handle_IntTools_TopolTool GetHandle() {
	return *(Handle_IntTools_TopolTool*) &$self;
	}
};

%nodefaultctor Handle_IntTools_TopolTool;
class Handle_IntTools_TopolTool : public Handle_Adaptor3d_TopolTool {

    public:
        // constructors
        Handle_IntTools_TopolTool();
        Handle_IntTools_TopolTool(const Handle_IntTools_TopolTool &aHandle);
        Handle_IntTools_TopolTool(const IntTools_TopolTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntTools_TopolTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntTools_TopolTool {
    IntTools_TopolTool* GetObject() {
    return (IntTools_TopolTool*)$self->Access();
    }
};
%feature("shadow") Handle_IntTools_TopolTool::~Handle_IntTools_TopolTool %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntTools_TopolTool {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntTools_CurveRangeSample;
class IntTools_CurveRangeSample : public IntTools_BaseRangeSample {
	public:
		%feature("autodoc", "	:rtype: None
") IntTools_CurveRangeSample;
		 IntTools_CurveRangeSample ();
		%feature("autodoc", "	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: None
") IntTools_CurveRangeSample;
		 IntTools_CurveRangeSample (const Standard_Integer theIndex);
		%feature("autodoc", "	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: None
") SetRangeIndex;
		void SetRangeIndex (const Standard_Integer theIndex);
		%feature("autodoc", "	:rtype: int
") GetRangeIndex;
		Standard_Integer GetRangeIndex ();
		%feature("autodoc", "	:param Other:
	:type Other: IntTools_CurveRangeSample &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const IntTools_CurveRangeSample & Other);
		%feature("autodoc", "	:param theFirst:
	:type theFirst: float
	:param theLast:
	:type theLast: float
	:param theNbSample:
	:type theNbSample: Standard_Integer
	:rtype: IntTools_Range
") GetRange;
		IntTools_Range GetRange (const Standard_Real theFirst,const Standard_Real theLast,const Standard_Integer theNbSample);
		%feature("autodoc", "	:param theNbSample:
	:type theNbSample: Standard_Integer
	:rtype: int
") GetRangeIndexDeeper;
		Standard_Integer GetRangeIndexDeeper (const Standard_Integer theNbSample);
};


%feature("shadow") IntTools_CurveRangeSample::~IntTools_CurveRangeSample %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntTools_CurveRangeSample {
	void _kill_pointed() {
		delete $self;
	}
};
