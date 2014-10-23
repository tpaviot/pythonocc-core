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
%module (package="OCC") LocOpe

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

%include LocOpe_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum LocOpe_Operation {
	LocOpe_FUSE = 0,
	LocOpe_CUT = 1,
	LocOpe_INVALID = 2,
};

/* end public enums declaration */

%rename(locope) LocOpe;
%nodefaultctor LocOpe;
class LocOpe {
	public:
		%feature("autodoc", "	* Returns Standard_True when the wire <W> is closed on the face <OnF>.

	:param W:
	:type W: TopoDS_Wire &
	:param OnF:
	:type OnF: TopoDS_Face &
	:rtype: bool
") Closed;
		static Standard_Boolean Closed (const TopoDS_Wire & W,const TopoDS_Face & OnF);
		%feature("autodoc", "	* Returns Standard_True when the edge <E> is closed on the face <OnF>.

	:param E:
	:type E: TopoDS_Edge &
	:param OnF:
	:type OnF: TopoDS_Face &
	:rtype: bool
") Closed;
		static Standard_Boolean Closed (const TopoDS_Edge & E,const TopoDS_Face & OnF);
		%feature("autodoc", "	* Returns Standard_True when the faces are tangent

	:param E:
	:type E: TopoDS_Edge &
	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:rtype: bool
") TgtFaces;
		static Standard_Boolean TgtFaces (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Pt:
	:type Pt: TColgp_SequenceOfPnt
	:rtype: void
") SampleEdges;
		static void SampleEdges (const TopoDS_Shape & S,TColgp_SequenceOfPnt & Pt);
};


%feature("shadow") LocOpe::~LocOpe %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_BuildShape;
class LocOpe_BuildShape {
	public:
		%feature("autodoc", "	:rtype: None
") LocOpe_BuildShape;
		 LocOpe_BuildShape ();
		%feature("autodoc", "	* Builds shape(s) from the list <L>. Uses only the faces of <L>.

	:param L:
	:type L: TopTools_ListOfShape &
	:rtype: None
") LocOpe_BuildShape;
		 LocOpe_BuildShape (const TopTools_ListOfShape & L);
		%feature("autodoc", "	* Builds shape(s) from the list <L>. Uses only the faces of <L>.

	:param L:
	:type L: TopTools_ListOfShape &
	:rtype: None
") Perform;
		void Perform (const TopTools_ListOfShape & L);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
};


%feature("shadow") LocOpe_BuildShape::~LocOpe_BuildShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_BuildShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_BuildWires;
class LocOpe_BuildWires {
	public:
		%feature("autodoc", "	:rtype: None
") LocOpe_BuildWires;
		 LocOpe_BuildWires ();
		%feature("autodoc", "	:param Ledges:
	:type Ledges: TopTools_ListOfShape &
	:param PW:
	:type PW: Handle_LocOpe_ProjectedWires &
	:rtype: None
") LocOpe_BuildWires;
		 LocOpe_BuildWires (const TopTools_ListOfShape & Ledges,const Handle_LocOpe_ProjectedWires & PW);
		%feature("autodoc", "	:param Ledges:
	:type Ledges: TopTools_ListOfShape &
	:param PW:
	:type PW: Handle_LocOpe_ProjectedWires &
	:rtype: None
") Perform;
		void Perform (const TopTools_ListOfShape & Ledges,const Handle_LocOpe_ProjectedWires & PW);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Result;
		const TopTools_ListOfShape & Result ();
};


%feature("shadow") LocOpe_BuildWires::~LocOpe_BuildWires %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_BuildWires {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_CSIntersector;
class LocOpe_CSIntersector {
	public:
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") LocOpe_CSIntersector;
		 LocOpe_CSIntersector ();
		%feature("autodoc", "	* Creates and performs the intersection betwwen <Ax1> and <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") LocOpe_CSIntersector;
		 LocOpe_CSIntersector (const TopoDS_Shape & S);
		%feature("autodoc", "	* Performs the intersection between <Ax1 and <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "	:param Slin:
	:type Slin: LocOpe_SequenceOfLin &
	:rtype: None
") Perform;
		void Perform (const LocOpe_SequenceOfLin & Slin);
		%feature("autodoc", "	:param Scir:
	:type Scir: LocOpe_SequenceOfCirc &
	:rtype: None
") Perform;
		void Perform (const LocOpe_SequenceOfCirc & Scir);
		%feature("autodoc", "	:param Scur:
	:type Scur: TColGeom_SequenceOfCurve &
	:rtype: None
") Perform;
		void Perform (const TColGeom_SequenceOfCurve & Scur);
		%feature("autodoc", "	* Returns <Standard_True> if the intersection has been done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the number of intersection point on the element of range <I>.

	:param I:
	:type I: Standard_Integer
	:rtype: int
") NbPoints;
		Standard_Integer NbPoints (const Standard_Integer I);
		%feature("autodoc", "	* Returns the intersection point of range <Index> on element of range <I>. The points are sorted in increasing order of parameter along the axis.

	:param I:
	:type I: Standard_Integer
	:param Index:
	:type Index: Standard_Integer
	:rtype: LocOpe_PntFace
") Point;
		const LocOpe_PntFace & Point (const Standard_Integer I,const Standard_Integer Index);
		%feature("autodoc", "	* On the element of range <I>, searches the first intersection point located after the parameter <From>, wich orientation is not TopAbs_EXTERNAL. If found, returns <Standard_True>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point. (IndFrom <= IndTo). <Tol> is used to determine if 2 parameters are equal.  Otherwise, returns <Standard_False>.

	:param I:
	:type I: Standard_Integer
	:param From:
	:type From: float
	:param Tol:
	:type Tol: float
	:param Or:
	:type Or: TopAbs_Orientation &
	:param IndFrom:
	:type IndFrom: Standard_Integer &
	:param IndTo:
	:type IndTo: Standard_Integer &
	:rtype: bool
") LocalizeAfter;
		Standard_Boolean LocalizeAfter (const Standard_Integer I,const Standard_Real From,const Standard_Real Tol,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* On the element of range <I>, searches the first intersection point located before the parameter <From>, wich orientation is not TopAbs_EXTERNAL. If found, returns <Standard_True>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point (IndFrom <= IndTo). <Tol> is used to determine if 2 parameters are equal.  Otherwise, returns <Standard_False>.

	:param I:
	:type I: Standard_Integer
	:param From:
	:type From: float
	:param Tol:
	:type Tol: float
	:param Or:
	:type Or: TopAbs_Orientation &
	:param IndFrom:
	:type IndFrom: Standard_Integer &
	:param IndTo:
	:type IndTo: Standard_Integer &
	:rtype: bool
") LocalizeBefore;
		Standard_Boolean LocalizeBefore (const Standard_Integer I,const Standard_Real From,const Standard_Real Tol,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* On the element of range <I>, searches the first intersection point located after the index <FromInd> ( >= FromInd + 1), wich orientation is not TopAbs_EXTERNAL. If found, returns <Standard_True>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point. (IndFrom <= IndTo). <Tol> is used to determine if 2 parameters are equal.  Otherwise, returns <Standard_False>.

	:param I:
	:type I: Standard_Integer
	:param FromInd:
	:type FromInd: Standard_Integer
	:param Tol:
	:type Tol: float
	:param Or:
	:type Or: TopAbs_Orientation &
	:param IndFrom:
	:type IndFrom: Standard_Integer &
	:param IndTo:
	:type IndTo: Standard_Integer &
	:rtype: bool
") LocalizeAfter;
		Standard_Boolean LocalizeAfter (const Standard_Integer I,const Standard_Integer FromInd,const Standard_Real Tol,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* On the element of range <I>, searches the first intersection point located before the index <FromInd> ( <= FromInd -1), wich orientation is not TopAbs_EXTERNAL. If found, returns <Standard_True>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point (IndFrom <= IndTo). <Tol> is used to determine if 2 parameters are equal.  Otherwise, returns <Standard_False>.

	:param I:
	:type I: Standard_Integer
	:param FromInd:
	:type FromInd: Standard_Integer
	:param Tol:
	:type Tol: float
	:param Or:
	:type Or: TopAbs_Orientation &
	:param IndFrom:
	:type IndFrom: Standard_Integer &
	:param IndTo:
	:type IndTo: Standard_Integer &
	:rtype: bool
") LocalizeBefore;
		Standard_Boolean LocalizeBefore (const Standard_Integer I,const Standard_Integer FromInd,const Standard_Real Tol,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};


%feature("shadow") LocOpe_CSIntersector::~LocOpe_CSIntersector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_CSIntersector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_CurveShapeIntersector;
class LocOpe_CurveShapeIntersector {
	public:
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector ();
		%feature("autodoc", "	* Creates and performs the intersection betwwen <Ax1> and <S>.

	:param Axis:
	:type Axis: gp_Ax1
	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector (const gp_Ax1 & Axis,const TopoDS_Shape & S);
		%feature("autodoc", "	* Creates and performs yte intersection betwwen <C> and <S>.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector (const gp_Circ & C,const TopoDS_Shape & S);
		%feature("autodoc", "	* Performs the intersection between <Ax1 and <S>.

	:param Axis:
	:type Axis: gp_Ax1
	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const gp_Ax1 & Axis,const TopoDS_Shape & S);
		%feature("autodoc", "	* Performs the intersection between <Ax1 and <S>.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const gp_Circ & C,const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns <Standard_True> if the intersection has been done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the number of intersection point.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "	* Returns the intersection point of range <Index>. The points are sorted in increasing order of parameter along the axis.

	:param Index:
	:type Index: Standard_Integer
	:rtype: LocOpe_PntFace
") Point;
		const LocOpe_PntFace & Point (const Standard_Integer Index);
		%feature("autodoc", "	* Searches the first intersection point located after the parameter <From>, wich orientation is not TopAbs_EXTERNAL. If found, returns <Standard_True>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point. (IndFrom <= IndTo).  Otherwise, returns <Standard_False>.

	:param From:
	:type From: float
	:param Or:
	:type Or: TopAbs_Orientation &
	:param IndFrom:
	:type IndFrom: Standard_Integer &
	:param IndTo:
	:type IndTo: Standard_Integer &
	:rtype: bool
") LocalizeAfter;
		Standard_Boolean LocalizeAfter (const Standard_Real From,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Searches the first intersection point located before the parameter <From>, wich orientation is not TopAbs_EXTERNAL. If found, returns <Standard_True>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point (IndFrom <= IndTo).  Otherwise, returns <Standard_False>.

	:param From:
	:type From: float
	:param Or:
	:type Or: TopAbs_Orientation &
	:param IndFrom:
	:type IndFrom: Standard_Integer &
	:param IndTo:
	:type IndTo: Standard_Integer &
	:rtype: bool
") LocalizeBefore;
		Standard_Boolean LocalizeBefore (const Standard_Real From,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Searches the first intersection point located after the index <FromInd> ( >= FromInd + 1), wich orientation is not TopAbs_EXTERNAL. If found, returns <Standard_True>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point. (IndFrom <= IndTo).  Otherwise, returns <Standard_False>.

	:param FromInd:
	:type FromInd: Standard_Integer
	:param Or:
	:type Or: TopAbs_Orientation &
	:param IndFrom:
	:type IndFrom: Standard_Integer &
	:param IndTo:
	:type IndTo: Standard_Integer &
	:rtype: bool
") LocalizeAfter;
		Standard_Boolean LocalizeAfter (const Standard_Integer FromInd,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Searches the first intersection point located before the index <FromInd> ( <= FromInd -1), wich orientation is not TopAbs_EXTERNAL. If found, returns <Standard_True>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point (IndFrom <= IndTo).  Otherwise, returns <Standard_False>.

	:param FromInd:
	:type FromInd: Standard_Integer
	:param Or:
	:type Or: TopAbs_Orientation &
	:param IndFrom:
	:type IndFrom: Standard_Integer &
	:param IndTo:
	:type IndTo: Standard_Integer &
	:rtype: bool
") LocalizeBefore;
		Standard_Boolean LocalizeBefore (const Standard_Integer FromInd,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%feature("shadow") LocOpe_CurveShapeIntersector::~LocOpe_CurveShapeIntersector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_CurveShapeIntersector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_DPrism;
class LocOpe_DPrism {
	public:
		%feature("autodoc", "	:param Spine:
	:type Spine: TopoDS_Face &
	:param Height1:
	:type Height1: float
	:param Height2:
	:type Height2: float
	:param Angle:
	:type Angle: float
	:rtype: None
") LocOpe_DPrism;
		 LocOpe_DPrism (const TopoDS_Face & Spine,const Standard_Real Height1,const Standard_Real Height2,const Standard_Real Angle);
		%feature("autodoc", "	:param Spine:
	:type Spine: TopoDS_Face &
	:param Height:
	:type Height: float
	:param Angle:
	:type Angle: float
	:rtype: None
") LocOpe_DPrism;
		 LocOpe_DPrism (const TopoDS_Face & Spine,const Standard_Real Height,const Standard_Real Angle);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Spine;
		const TopoDS_Shape  Spine ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Profile;
		const TopoDS_Shape  Profile ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") FirstShape;
		const TopoDS_Shape  FirstShape ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") LastShape;
		const TopoDS_Shape  LastShape ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Shapes;
		const TopTools_ListOfShape & Shapes (const TopoDS_Shape & S);
		%feature("autodoc", "	:param SCurves:
	:type SCurves: TColGeom_SequenceOfCurve &
	:rtype: None
") Curves;
		void Curves (TColGeom_SequenceOfCurve & SCurves);
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") BarycCurve;
		Handle_Geom_Curve BarycCurve ();
};


%feature("shadow") LocOpe_DPrism::~LocOpe_DPrism %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_DPrism {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_DataMapIteratorOfDataMapOfShapePnt;
class LocOpe_DataMapIteratorOfDataMapOfShapePnt : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") LocOpe_DataMapIteratorOfDataMapOfShapePnt;
		 LocOpe_DataMapIteratorOfDataMapOfShapePnt ();
		%feature("autodoc", "	:param aMap:
	:type aMap: LocOpe_DataMapOfShapePnt &
	:rtype: None
") LocOpe_DataMapIteratorOfDataMapOfShapePnt;
		 LocOpe_DataMapIteratorOfDataMapOfShapePnt (const LocOpe_DataMapOfShapePnt & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: LocOpe_DataMapOfShapePnt &
	:rtype: None
") Initialize;
		void Initialize (const LocOpe_DataMapOfShapePnt & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
};


%feature("shadow") LocOpe_DataMapIteratorOfDataMapOfShapePnt::~LocOpe_DataMapIteratorOfDataMapOfShapePnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_DataMapIteratorOfDataMapOfShapePnt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_DataMapNodeOfDataMapOfShapePnt;
class LocOpe_DataMapNodeOfDataMapOfShapePnt : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: gp_Pnt
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") LocOpe_DataMapNodeOfDataMapOfShapePnt;
		 LocOpe_DataMapNodeOfDataMapOfShapePnt (const TopoDS_Shape & K,const gp_Pnt & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		gp_Pnt  Value ();
};


%feature("shadow") LocOpe_DataMapNodeOfDataMapOfShapePnt::~LocOpe_DataMapNodeOfDataMapOfShapePnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_DataMapNodeOfDataMapOfShapePnt {
	void _kill_pointed() {
		delete $self;
	}
};
%extend LocOpe_DataMapNodeOfDataMapOfShapePnt {
	Handle_LocOpe_DataMapNodeOfDataMapOfShapePnt GetHandle() {
	return *(Handle_LocOpe_DataMapNodeOfDataMapOfShapePnt*) &$self;
	}
};

%nodefaultctor Handle_LocOpe_DataMapNodeOfDataMapOfShapePnt;
class Handle_LocOpe_DataMapNodeOfDataMapOfShapePnt : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_LocOpe_DataMapNodeOfDataMapOfShapePnt();
        Handle_LocOpe_DataMapNodeOfDataMapOfShapePnt(const Handle_LocOpe_DataMapNodeOfDataMapOfShapePnt &aHandle);
        Handle_LocOpe_DataMapNodeOfDataMapOfShapePnt(const LocOpe_DataMapNodeOfDataMapOfShapePnt *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_LocOpe_DataMapNodeOfDataMapOfShapePnt DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_LocOpe_DataMapNodeOfDataMapOfShapePnt {
    LocOpe_DataMapNodeOfDataMapOfShapePnt* GetObject() {
    return (LocOpe_DataMapNodeOfDataMapOfShapePnt*)$self->Access();
    }
};
%feature("shadow") Handle_LocOpe_DataMapNodeOfDataMapOfShapePnt::~Handle_LocOpe_DataMapNodeOfDataMapOfShapePnt %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_LocOpe_DataMapNodeOfDataMapOfShapePnt {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor LocOpe_DataMapOfShapePnt;
class LocOpe_DataMapOfShapePnt : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") LocOpe_DataMapOfShapePnt;
		 LocOpe_DataMapOfShapePnt (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: LocOpe_DataMapOfShapePnt &
	:rtype: LocOpe_DataMapOfShapePnt
") Assign;
		LocOpe_DataMapOfShapePnt & Assign (const LocOpe_DataMapOfShapePnt & Other);
		%feature("autodoc", "	:param Other:
	:type Other: LocOpe_DataMapOfShapePnt &
	:rtype: LocOpe_DataMapOfShapePnt
") operator=;
		LocOpe_DataMapOfShapePnt & operator = (const LocOpe_DataMapOfShapePnt & Other);
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
	:type I: gp_Pnt
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const gp_Pnt & I);
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
	:rtype: gp_Pnt
") Find;
		const gp_Pnt  Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: gp_Pnt
") ChangeFind;
		gp_Pnt  ChangeFind (const TopoDS_Shape & K);
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


%feature("shadow") LocOpe_DataMapOfShapePnt::~LocOpe_DataMapOfShapePnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_DataMapOfShapePnt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_FindEdges;
class LocOpe_FindEdges {
	public:
		%feature("autodoc", "	:rtype: None
") LocOpe_FindEdges;
		 LocOpe_FindEdges ();
		%feature("autodoc", "	:param FFrom:
	:type FFrom: TopoDS_Shape &
	:param FTo:
	:type FTo: TopoDS_Shape &
	:rtype: None
") LocOpe_FindEdges;
		 LocOpe_FindEdges (const TopoDS_Shape & FFrom,const TopoDS_Shape & FTo);
		%feature("autodoc", "	:param FFrom:
	:type FFrom: TopoDS_Shape &
	:param FTo:
	:type FTo: TopoDS_Shape &
	:rtype: None
") Set;
		void Set (const TopoDS_Shape & FFrom,const TopoDS_Shape & FTo);
		%feature("autodoc", "	:rtype: None
") InitIterator;
		void InitIterator ();
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") EdgeFrom;
		const TopoDS_Edge  EdgeFrom ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") EdgeTo;
		const TopoDS_Edge  EdgeTo ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
};


%feature("shadow") LocOpe_FindEdges::~LocOpe_FindEdges %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_FindEdges {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_FindEdgesInFace;
class LocOpe_FindEdgesInFace {
	public:
		%feature("autodoc", "	:rtype: None
") LocOpe_FindEdgesInFace;
		 LocOpe_FindEdgesInFace ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") LocOpe_FindEdgesInFace;
		 LocOpe_FindEdgesInFace (const TopoDS_Shape & S,const TopoDS_Face & F);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Set;
		void Set (const TopoDS_Shape & S,const TopoDS_Face & F);
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
};


%feature("shadow") LocOpe_FindEdgesInFace::~LocOpe_FindEdgesInFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_FindEdgesInFace {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_GeneratedShape;
class LocOpe_GeneratedShape : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") GeneratingEdges;
		virtual const TopTools_ListOfShape & GeneratingEdges ();
		%feature("autodoc", "	* Returns the edge created by the vertex <V>. If none, must return a null shape.

	:param V:
	:type V: TopoDS_Vertex &
	:rtype: TopoDS_Edge
") Generated;
		virtual TopoDS_Edge Generated (const TopoDS_Vertex & V);
		%feature("autodoc", "	* Returns the face created by the edge <E>. If none, must return a null shape.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopoDS_Face
") Generated;
		virtual TopoDS_Face Generated (const TopoDS_Edge & E);
		%feature("autodoc", "	* Returns the list of correctly oriented generated faces.

	:rtype: TopTools_ListOfShape
") OrientedFaces;
		virtual const TopTools_ListOfShape & OrientedFaces ();
};


%feature("shadow") LocOpe_GeneratedShape::~LocOpe_GeneratedShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_GeneratedShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend LocOpe_GeneratedShape {
	Handle_LocOpe_GeneratedShape GetHandle() {
	return *(Handle_LocOpe_GeneratedShape*) &$self;
	}
};

%nodefaultctor Handle_LocOpe_GeneratedShape;
class Handle_LocOpe_GeneratedShape : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_LocOpe_GeneratedShape();
        Handle_LocOpe_GeneratedShape(const Handle_LocOpe_GeneratedShape &aHandle);
        Handle_LocOpe_GeneratedShape(const LocOpe_GeneratedShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_LocOpe_GeneratedShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_LocOpe_GeneratedShape {
    LocOpe_GeneratedShape* GetObject() {
    return (LocOpe_GeneratedShape*)$self->Access();
    }
};
%feature("shadow") Handle_LocOpe_GeneratedShape::~Handle_LocOpe_GeneratedShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_LocOpe_GeneratedShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor LocOpe_Generator;
class LocOpe_Generator {
	public:
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") LocOpe_Generator;
		 LocOpe_Generator ();
		%feature("autodoc", "	* Creates the algorithm on the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") LocOpe_Generator;
		 LocOpe_Generator (const TopoDS_Shape & S);
		%feature("autodoc", "	* Initializes the algorithm on the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "	:param G:
	:type G: Handle_LocOpe_GeneratedShape &
	:rtype: None
") Perform;
		void Perform (const Handle_LocOpe_GeneratedShape & G);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the new shape

	:rtype: TopoDS_Shape
") ResultingShape;
		const TopoDS_Shape  ResultingShape ();
		%feature("autodoc", "	* Returns the initial shape

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("autodoc", "	* Returns the descendant face of <F>. <F> may belong to the original shape or to the 'generated' shape. The returned face may be a null shape (when <F> disappears).

	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") DescendantFace;
		const TopTools_ListOfShape & DescendantFace (const TopoDS_Face & F);
};


%feature("shadow") LocOpe_Generator::~LocOpe_Generator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_Generator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_Gluer;
class LocOpe_Gluer {
	public:
		%feature("autodoc", "	:rtype: None
") LocOpe_Gluer;
		 LocOpe_Gluer ();
		%feature("autodoc", "	:param Sbase:
	:type Sbase: TopoDS_Shape &
	:param Snew:
	:type Snew: TopoDS_Shape &
	:rtype: None
") LocOpe_Gluer;
		 LocOpe_Gluer (const TopoDS_Shape & Sbase,const TopoDS_Shape & Snew);
		%feature("autodoc", "	:param Sbase:
	:type Sbase: TopoDS_Shape &
	:param Snew:
	:type Snew: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Shape & Snew);
		%feature("autodoc", "	:param Fnew:
	:type Fnew: TopoDS_Face &
	:param Fbase:
	:type Fbase: TopoDS_Face &
	:rtype: None
") Bind;
		void Bind (const TopoDS_Face & Fnew,const TopoDS_Face & Fbase);
		%feature("autodoc", "	:param Enew:
	:type Enew: TopoDS_Edge &
	:param Ebase:
	:type Ebase: TopoDS_Edge &
	:rtype: None
") Bind;
		void Bind (const TopoDS_Edge & Enew,const TopoDS_Edge & Ebase);
		%feature("autodoc", "	:rtype: LocOpe_Operation
") OpeType;
		LocOpe_Operation OpeType ();
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") ResultingShape;
		const TopoDS_Shape  ResultingShape ();
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") DescendantFaces;
		const TopTools_ListOfShape & DescendantFaces (const TopoDS_Face & F);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") BasisShape;
		const TopoDS_Shape  BasisShape ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") GluedShape;
		const TopoDS_Shape  GluedShape ();
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Edges;
		const TopTools_ListOfShape & Edges ();
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") TgtEdges;
		const TopTools_ListOfShape & TgtEdges ();
};


%feature("shadow") LocOpe_Gluer::~LocOpe_Gluer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_Gluer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_HBuilder;
class LocOpe_HBuilder : public TopOpeBRepBuild_HBuilder {
	public:
		%feature("autodoc", "	:param BT:
	:type BT: TopOpeBRepDS_BuildTool &
	:rtype: None
") LocOpe_HBuilder;
		 LocOpe_HBuilder (const TopOpeBRepDS_BuildTool & BT);
		%feature("autodoc", "	:rtype: bool
") Classify;
		Standard_Boolean Classify ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Classify;
		void Classify (const Standard_Boolean B);
};


%feature("shadow") LocOpe_HBuilder::~LocOpe_HBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_HBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%extend LocOpe_HBuilder {
	Handle_LocOpe_HBuilder GetHandle() {
	return *(Handle_LocOpe_HBuilder*) &$self;
	}
};

%nodefaultctor Handle_LocOpe_HBuilder;
class Handle_LocOpe_HBuilder : public Handle_TopOpeBRepBuild_HBuilder {

    public:
        // constructors
        Handle_LocOpe_HBuilder();
        Handle_LocOpe_HBuilder(const Handle_LocOpe_HBuilder &aHandle);
        Handle_LocOpe_HBuilder(const LocOpe_HBuilder *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_LocOpe_HBuilder DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_LocOpe_HBuilder {
    LocOpe_HBuilder* GetObject() {
    return (LocOpe_HBuilder*)$self->Access();
    }
};
%feature("shadow") Handle_LocOpe_HBuilder::~Handle_LocOpe_HBuilder %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_LocOpe_HBuilder {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor LocOpe_LinearForm;
class LocOpe_LinearForm {
	public:
		%feature("autodoc", "	:rtype: None
") LocOpe_LinearForm;
		 LocOpe_LinearForm ();
		%feature("autodoc", "	:param Base:
	:type Base: TopoDS_Shape &
	:param V:
	:type V: gp_Vec
	:param Pnt1:
	:type Pnt1: gp_Pnt
	:param Pnt2:
	:type Pnt2: gp_Pnt
	:rtype: None
") LocOpe_LinearForm;
		 LocOpe_LinearForm (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Pnt & Pnt1,const gp_Pnt & Pnt2);
		%feature("autodoc", "	:param Base:
	:type Base: TopoDS_Shape &
	:param V:
	:type V: gp_Vec
	:param Vectra:
	:type Vectra: gp_Vec
	:param Pnt1:
	:type Pnt1: gp_Pnt
	:param Pnt2:
	:type Pnt2: gp_Pnt
	:rtype: None
") LocOpe_LinearForm;
		 LocOpe_LinearForm (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Vec & Vectra,const gp_Pnt & Pnt1,const gp_Pnt & Pnt2);
		%feature("autodoc", "	:param Base:
	:type Base: TopoDS_Shape &
	:param V:
	:type V: gp_Vec
	:param Pnt1:
	:type Pnt1: gp_Pnt
	:param Pnt2:
	:type Pnt2: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Pnt & Pnt1,const gp_Pnt & Pnt2);
		%feature("autodoc", "	:param Base:
	:type Base: TopoDS_Shape &
	:param V:
	:type V: gp_Vec
	:param Vectra:
	:type Vectra: gp_Vec
	:param Pnt1:
	:type Pnt1: gp_Pnt
	:param Pnt2:
	:type Pnt2: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Vec & Vectra,const gp_Pnt & Pnt1,const gp_Pnt & Pnt2);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") FirstShape;
		const TopoDS_Shape  FirstShape ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") LastShape;
		const TopoDS_Shape  LastShape ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Shapes;
		const TopTools_ListOfShape & Shapes (const TopoDS_Shape & S);
};


%feature("shadow") LocOpe_LinearForm::~LocOpe_LinearForm %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_LinearForm {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_Pipe;
class LocOpe_Pipe {
	public:
		%feature("autodoc", "	:param Spine:
	:type Spine: TopoDS_Wire &
	:param Profile:
	:type Profile: TopoDS_Shape &
	:rtype: None
") LocOpe_Pipe;
		 LocOpe_Pipe (const TopoDS_Wire & Spine,const TopoDS_Shape & Profile);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Spine;
		const TopoDS_Shape  Spine ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Profile;
		const TopoDS_Shape  Profile ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") FirstShape;
		const TopoDS_Shape  FirstShape ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") LastShape;
		const TopoDS_Shape  LastShape ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Shapes;
		const TopTools_ListOfShape & Shapes (const TopoDS_Shape & S);
		%feature("autodoc", "	:param Spt:
	:type Spt: TColgp_SequenceOfPnt
	:rtype: TColGeom_SequenceOfCurve
") Curves;
		const TColGeom_SequenceOfCurve & Curves (const TColgp_SequenceOfPnt & Spt);
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") BarycCurve;
		Handle_Geom_Curve BarycCurve ();
};


%feature("shadow") LocOpe_Pipe::~LocOpe_Pipe %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_Pipe {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_PntFace;
class LocOpe_PntFace {
	public:
		%feature("autodoc", "	* Empty constructor. Useful only for the list.

	:rtype: None
") LocOpe_PntFace;
		 LocOpe_PntFace ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param F:
	:type F: TopoDS_Face &
	:param Or:
	:type Or: TopAbs_Orientation
	:param Param:
	:type Param: float
	:param UPar:
	:type UPar: float
	:param VPar:
	:type VPar: float
	:rtype: None
") LocOpe_PntFace;
		 LocOpe_PntFace (const gp_Pnt & P,const TopoDS_Face & F,const TopAbs_Orientation Or,const Standard_Real Param,const Standard_Real UPar,const Standard_Real VPar);
		%feature("autodoc", "	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt ();
		%feature("autodoc", "	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") ChangeOrientation;
		TopAbs_Orientation & ChangeOrientation ();
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "	:rtype: float
") UParameter;
		Standard_Real UParameter ();
		%feature("autodoc", "	:rtype: float
") VParameter;
		Standard_Real VParameter ();
};


%feature("shadow") LocOpe_PntFace::~LocOpe_PntFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_PntFace {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_Prism;
class LocOpe_Prism {
	public:
		%feature("autodoc", "	:rtype: None
") LocOpe_Prism;
		 LocOpe_Prism ();
		%feature("autodoc", "	:param Base:
	:type Base: TopoDS_Shape &
	:param V:
	:type V: gp_Vec
	:rtype: None
") LocOpe_Prism;
		 LocOpe_Prism (const TopoDS_Shape & Base,const gp_Vec & V);
		%feature("autodoc", "	:param Base:
	:type Base: TopoDS_Shape &
	:param V:
	:type V: gp_Vec
	:param Vectra:
	:type Vectra: gp_Vec
	:rtype: None
") LocOpe_Prism;
		 LocOpe_Prism (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Vec & Vectra);
		%feature("autodoc", "	:param Base:
	:type Base: TopoDS_Shape &
	:param V:
	:type V: gp_Vec
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & Base,const gp_Vec & V);
		%feature("autodoc", "	:param Base:
	:type Base: TopoDS_Shape &
	:param V:
	:type V: gp_Vec
	:param Vtra:
	:type Vtra: gp_Vec
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Vec & Vtra);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") FirstShape;
		const TopoDS_Shape  FirstShape ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") LastShape;
		const TopoDS_Shape  LastShape ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Shapes;
		const TopTools_ListOfShape & Shapes (const TopoDS_Shape & S);
		%feature("autodoc", "	:param SCurves:
	:type SCurves: TColGeom_SequenceOfCurve &
	:rtype: None
") Curves;
		void Curves (TColGeom_SequenceOfCurve & SCurves);
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") BarycCurve;
		Handle_Geom_Curve BarycCurve ();
};


%feature("shadow") LocOpe_Prism::~LocOpe_Prism %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_Prism {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_ProjectedWires;
class LocOpe_ProjectedWires : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: void
") InitEdgeIterator;
		virtual void InitEdgeIterator ();
		%feature("autodoc", "	:rtype: bool
") MoreEdge;
		virtual Standard_Boolean MoreEdge ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		virtual TopoDS_Edge Edge ();
		%feature("autodoc", "	* Returns the face of the shape on which the current edge is projected.

	:rtype: TopoDS_Face
") OnFace;
		virtual TopoDS_Face OnFace ();
		%feature("autodoc", "	* If the current edge is projected on an edge, returns <Standard_True> and sets the value of <E>. Otherwise, returns <Standard_False>.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") OnEdge;
		virtual Standard_Boolean OnEdge (TopoDS_Edge & E);
		%feature("autodoc", "	:rtype: void
") NextEdge;
		virtual void NextEdge ();
		%feature("autodoc", "	:param Vwire:
	:type Vwire: TopoDS_Vertex &
	:param Vshape:
	:type Vshape: TopoDS_Vertex &
	:rtype: bool
") OnVertex;
		virtual Standard_Boolean OnVertex (const TopoDS_Vertex & Vwire,TopoDS_Vertex & Vshape);
		%feature("autodoc", "	* If the vertex <V> lies on an edge of the original shape, returns <Standard_True> and sets the concerned edge in <E>, and the parameter on the edge in <P>. Else returns <Standard_False>.

	:param V:
	:type V: TopoDS_Vertex &
	:param E:
	:type E: TopoDS_Edge &
	:param P:
	:type P: float &
	:rtype: bool
") OnEdge;
		virtual Standard_Boolean OnEdge (const TopoDS_Vertex & V,TopoDS_Edge & E,Standard_Real &OutValue);
		%feature("autodoc", "	* tells is the face to be split by section or not

	:param aFace:
	:type aFace: TopoDS_Shape &
	:rtype: bool
") IsFaceWithSection;
		virtual Standard_Boolean IsFaceWithSection (const TopoDS_Shape & aFace);
};


%feature("shadow") LocOpe_ProjectedWires::~LocOpe_ProjectedWires %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_ProjectedWires {
	void _kill_pointed() {
		delete $self;
	}
};
%extend LocOpe_ProjectedWires {
	Handle_LocOpe_ProjectedWires GetHandle() {
	return *(Handle_LocOpe_ProjectedWires*) &$self;
	}
};

%nodefaultctor Handle_LocOpe_ProjectedWires;
class Handle_LocOpe_ProjectedWires : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_LocOpe_ProjectedWires();
        Handle_LocOpe_ProjectedWires(const Handle_LocOpe_ProjectedWires &aHandle);
        Handle_LocOpe_ProjectedWires(const LocOpe_ProjectedWires *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_LocOpe_ProjectedWires DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_LocOpe_ProjectedWires {
    LocOpe_ProjectedWires* GetObject() {
    return (LocOpe_ProjectedWires*)$self->Access();
    }
};
%feature("shadow") Handle_LocOpe_ProjectedWires::~Handle_LocOpe_ProjectedWires %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_LocOpe_ProjectedWires {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor LocOpe_SequenceNodeOfSequenceOfCirc;
class LocOpe_SequenceNodeOfSequenceOfCirc : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: gp_Circ
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") LocOpe_SequenceNodeOfSequenceOfCirc;
		 LocOpe_SequenceNodeOfSequenceOfCirc (const gp_Circ & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: gp_Circ
") Value;
		gp_Circ  Value ();
};


%feature("shadow") LocOpe_SequenceNodeOfSequenceOfCirc::~LocOpe_SequenceNodeOfSequenceOfCirc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_SequenceNodeOfSequenceOfCirc {
	void _kill_pointed() {
		delete $self;
	}
};
%extend LocOpe_SequenceNodeOfSequenceOfCirc {
	Handle_LocOpe_SequenceNodeOfSequenceOfCirc GetHandle() {
	return *(Handle_LocOpe_SequenceNodeOfSequenceOfCirc*) &$self;
	}
};

%nodefaultctor Handle_LocOpe_SequenceNodeOfSequenceOfCirc;
class Handle_LocOpe_SequenceNodeOfSequenceOfCirc : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_LocOpe_SequenceNodeOfSequenceOfCirc();
        Handle_LocOpe_SequenceNodeOfSequenceOfCirc(const Handle_LocOpe_SequenceNodeOfSequenceOfCirc &aHandle);
        Handle_LocOpe_SequenceNodeOfSequenceOfCirc(const LocOpe_SequenceNodeOfSequenceOfCirc *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_LocOpe_SequenceNodeOfSequenceOfCirc DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_LocOpe_SequenceNodeOfSequenceOfCirc {
    LocOpe_SequenceNodeOfSequenceOfCirc* GetObject() {
    return (LocOpe_SequenceNodeOfSequenceOfCirc*)$self->Access();
    }
};
%feature("shadow") Handle_LocOpe_SequenceNodeOfSequenceOfCirc::~Handle_LocOpe_SequenceNodeOfSequenceOfCirc %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_LocOpe_SequenceNodeOfSequenceOfCirc {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor LocOpe_SequenceNodeOfSequenceOfLin;
class LocOpe_SequenceNodeOfSequenceOfLin : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: gp_Lin
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") LocOpe_SequenceNodeOfSequenceOfLin;
		 LocOpe_SequenceNodeOfSequenceOfLin (const gp_Lin & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: gp_Lin
") Value;
		gp_Lin  Value ();
};


%feature("shadow") LocOpe_SequenceNodeOfSequenceOfLin::~LocOpe_SequenceNodeOfSequenceOfLin %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_SequenceNodeOfSequenceOfLin {
	void _kill_pointed() {
		delete $self;
	}
};
%extend LocOpe_SequenceNodeOfSequenceOfLin {
	Handle_LocOpe_SequenceNodeOfSequenceOfLin GetHandle() {
	return *(Handle_LocOpe_SequenceNodeOfSequenceOfLin*) &$self;
	}
};

%nodefaultctor Handle_LocOpe_SequenceNodeOfSequenceOfLin;
class Handle_LocOpe_SequenceNodeOfSequenceOfLin : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_LocOpe_SequenceNodeOfSequenceOfLin();
        Handle_LocOpe_SequenceNodeOfSequenceOfLin(const Handle_LocOpe_SequenceNodeOfSequenceOfLin &aHandle);
        Handle_LocOpe_SequenceNodeOfSequenceOfLin(const LocOpe_SequenceNodeOfSequenceOfLin *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_LocOpe_SequenceNodeOfSequenceOfLin DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_LocOpe_SequenceNodeOfSequenceOfLin {
    LocOpe_SequenceNodeOfSequenceOfLin* GetObject() {
    return (LocOpe_SequenceNodeOfSequenceOfLin*)$self->Access();
    }
};
%feature("shadow") Handle_LocOpe_SequenceNodeOfSequenceOfLin::~Handle_LocOpe_SequenceNodeOfSequenceOfLin %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_LocOpe_SequenceNodeOfSequenceOfLin {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor LocOpe_SequenceNodeOfSequenceOfPntFace;
class LocOpe_SequenceNodeOfSequenceOfPntFace : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: LocOpe_PntFace &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") LocOpe_SequenceNodeOfSequenceOfPntFace;
		 LocOpe_SequenceNodeOfSequenceOfPntFace (const LocOpe_PntFace & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: LocOpe_PntFace
") Value;
		LocOpe_PntFace & Value ();
};


%feature("shadow") LocOpe_SequenceNodeOfSequenceOfPntFace::~LocOpe_SequenceNodeOfSequenceOfPntFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_SequenceNodeOfSequenceOfPntFace {
	void _kill_pointed() {
		delete $self;
	}
};
%extend LocOpe_SequenceNodeOfSequenceOfPntFace {
	Handle_LocOpe_SequenceNodeOfSequenceOfPntFace GetHandle() {
	return *(Handle_LocOpe_SequenceNodeOfSequenceOfPntFace*) &$self;
	}
};

%nodefaultctor Handle_LocOpe_SequenceNodeOfSequenceOfPntFace;
class Handle_LocOpe_SequenceNodeOfSequenceOfPntFace : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_LocOpe_SequenceNodeOfSequenceOfPntFace();
        Handle_LocOpe_SequenceNodeOfSequenceOfPntFace(const Handle_LocOpe_SequenceNodeOfSequenceOfPntFace &aHandle);
        Handle_LocOpe_SequenceNodeOfSequenceOfPntFace(const LocOpe_SequenceNodeOfSequenceOfPntFace *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_LocOpe_SequenceNodeOfSequenceOfPntFace DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_LocOpe_SequenceNodeOfSequenceOfPntFace {
    LocOpe_SequenceNodeOfSequenceOfPntFace* GetObject() {
    return (LocOpe_SequenceNodeOfSequenceOfPntFace*)$self->Access();
    }
};
%feature("shadow") Handle_LocOpe_SequenceNodeOfSequenceOfPntFace::~Handle_LocOpe_SequenceNodeOfSequenceOfPntFace %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_LocOpe_SequenceNodeOfSequenceOfPntFace {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor LocOpe_SequenceOfCirc;
class LocOpe_SequenceOfCirc : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") LocOpe_SequenceOfCirc;
		 LocOpe_SequenceOfCirc ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: LocOpe_SequenceOfCirc &
	:rtype: LocOpe_SequenceOfCirc
") Assign;
		const LocOpe_SequenceOfCirc & Assign (const LocOpe_SequenceOfCirc & Other);
		%feature("autodoc", "	:param Other:
	:type Other: LocOpe_SequenceOfCirc &
	:rtype: LocOpe_SequenceOfCirc
") operator=;
		const LocOpe_SequenceOfCirc & operator = (const LocOpe_SequenceOfCirc & Other);
		%feature("autodoc", "	:param T:
	:type T: gp_Circ
	:rtype: None
") Append;
		void Append (const gp_Circ & T);
		%feature("autodoc", "	:param S:
	:type S: LocOpe_SequenceOfCirc &
	:rtype: None
") Append;
		void Append (LocOpe_SequenceOfCirc & S);
		%feature("autodoc", "	:param T:
	:type T: gp_Circ
	:rtype: None
") Prepend;
		void Prepend (const gp_Circ & T);
		%feature("autodoc", "	:param S:
	:type S: LocOpe_SequenceOfCirc &
	:rtype: None
") Prepend;
		void Prepend (LocOpe_SequenceOfCirc & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: gp_Circ
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const gp_Circ & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: LocOpe_SequenceOfCirc &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,LocOpe_SequenceOfCirc & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: gp_Circ
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const gp_Circ & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: LocOpe_SequenceOfCirc &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,LocOpe_SequenceOfCirc & S);
		%feature("autodoc", "	:rtype: gp_Circ
") First;
		const gp_Circ  First ();
		%feature("autodoc", "	:rtype: gp_Circ
") Last;
		const gp_Circ  Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: LocOpe_SequenceOfCirc &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,LocOpe_SequenceOfCirc & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Circ
") Value;
		const gp_Circ  Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: gp_Circ
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Circ & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Circ
") ChangeValue;
		gp_Circ  ChangeValue (const Standard_Integer Index);
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


%feature("shadow") LocOpe_SequenceOfCirc::~LocOpe_SequenceOfCirc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_SequenceOfCirc {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_SequenceOfLin;
class LocOpe_SequenceOfLin : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") LocOpe_SequenceOfLin;
		 LocOpe_SequenceOfLin ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: LocOpe_SequenceOfLin &
	:rtype: LocOpe_SequenceOfLin
") Assign;
		const LocOpe_SequenceOfLin & Assign (const LocOpe_SequenceOfLin & Other);
		%feature("autodoc", "	:param Other:
	:type Other: LocOpe_SequenceOfLin &
	:rtype: LocOpe_SequenceOfLin
") operator=;
		const LocOpe_SequenceOfLin & operator = (const LocOpe_SequenceOfLin & Other);
		%feature("autodoc", "	:param T:
	:type T: gp_Lin
	:rtype: None
") Append;
		void Append (const gp_Lin & T);
		%feature("autodoc", "	:param S:
	:type S: LocOpe_SequenceOfLin &
	:rtype: None
") Append;
		void Append (LocOpe_SequenceOfLin & S);
		%feature("autodoc", "	:param T:
	:type T: gp_Lin
	:rtype: None
") Prepend;
		void Prepend (const gp_Lin & T);
		%feature("autodoc", "	:param S:
	:type S: LocOpe_SequenceOfLin &
	:rtype: None
") Prepend;
		void Prepend (LocOpe_SequenceOfLin & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: gp_Lin
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const gp_Lin & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: LocOpe_SequenceOfLin &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,LocOpe_SequenceOfLin & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: gp_Lin
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const gp_Lin & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: LocOpe_SequenceOfLin &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,LocOpe_SequenceOfLin & S);
		%feature("autodoc", "	:rtype: gp_Lin
") First;
		const gp_Lin  First ();
		%feature("autodoc", "	:rtype: gp_Lin
") Last;
		const gp_Lin  Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: LocOpe_SequenceOfLin &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,LocOpe_SequenceOfLin & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Lin
") Value;
		const gp_Lin  Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: gp_Lin
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Lin & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Lin
") ChangeValue;
		gp_Lin  ChangeValue (const Standard_Integer Index);
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


%feature("shadow") LocOpe_SequenceOfLin::~LocOpe_SequenceOfLin %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_SequenceOfLin {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_SequenceOfPntFace;
class LocOpe_SequenceOfPntFace : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") LocOpe_SequenceOfPntFace;
		 LocOpe_SequenceOfPntFace ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: LocOpe_SequenceOfPntFace &
	:rtype: LocOpe_SequenceOfPntFace
") Assign;
		const LocOpe_SequenceOfPntFace & Assign (const LocOpe_SequenceOfPntFace & Other);
		%feature("autodoc", "	:param Other:
	:type Other: LocOpe_SequenceOfPntFace &
	:rtype: LocOpe_SequenceOfPntFace
") operator=;
		const LocOpe_SequenceOfPntFace & operator = (const LocOpe_SequenceOfPntFace & Other);
		%feature("autodoc", "	:param T:
	:type T: LocOpe_PntFace &
	:rtype: None
") Append;
		void Append (const LocOpe_PntFace & T);
		%feature("autodoc", "	:param S:
	:type S: LocOpe_SequenceOfPntFace &
	:rtype: None
") Append;
		void Append (LocOpe_SequenceOfPntFace & S);
		%feature("autodoc", "	:param T:
	:type T: LocOpe_PntFace &
	:rtype: None
") Prepend;
		void Prepend (const LocOpe_PntFace & T);
		%feature("autodoc", "	:param S:
	:type S: LocOpe_SequenceOfPntFace &
	:rtype: None
") Prepend;
		void Prepend (LocOpe_SequenceOfPntFace & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: LocOpe_PntFace &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const LocOpe_PntFace & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: LocOpe_SequenceOfPntFace &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,LocOpe_SequenceOfPntFace & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: LocOpe_PntFace &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const LocOpe_PntFace & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: LocOpe_SequenceOfPntFace &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,LocOpe_SequenceOfPntFace & S);
		%feature("autodoc", "	:rtype: LocOpe_PntFace
") First;
		const LocOpe_PntFace & First ();
		%feature("autodoc", "	:rtype: LocOpe_PntFace
") Last;
		const LocOpe_PntFace & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: LocOpe_SequenceOfPntFace &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,LocOpe_SequenceOfPntFace & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: LocOpe_PntFace
") Value;
		const LocOpe_PntFace & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: LocOpe_PntFace &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const LocOpe_PntFace & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: LocOpe_PntFace
") ChangeValue;
		LocOpe_PntFace & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") LocOpe_SequenceOfPntFace::~LocOpe_SequenceOfPntFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_SequenceOfPntFace {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_SplitDrafts;
class LocOpe_SplitDrafts {
	public:
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") LocOpe_SplitDrafts;
		 LocOpe_SplitDrafts ();
		%feature("autodoc", "	* Creates the algoritm on the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") LocOpe_SplitDrafts;
		 LocOpe_SplitDrafts (const TopoDS_Shape & S);
		%feature("autodoc", "	* Initializes the algoritm with the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "	* Splits the face <F> of the former given shape with the wire <W>. The wire is assumed to lie on the face. Puts a draft angle on both parts of the wire. <Extractg>, <Nplg>, <Angleg> define the arguments for the left part of the wire. <Extractd>, <Npld>, <Angled> define the arguments for the right part of the wire. The draft angle is measured with the direction <Extract>. <Npl> defines the neutral plane (points belonging to the neutral plane are not modified). <Angle> is the value of the draft angle. If <ModifyLeft> is set to <Standard_False>, no draft angle is applied to the left part of the wire. If <ModifyRight> is set to <Standard_False>,no draft angle is applied to the right part of the wire.

	:param F:
	:type F: TopoDS_Face &
	:param W:
	:type W: TopoDS_Wire &
	:param Extractg:
	:type Extractg: gp_Dir
	:param NPlg:
	:type NPlg: gp_Pln
	:param Angleg:
	:type Angleg: float
	:param Extractd:
	:type Extractd: gp_Dir
	:param NPld:
	:type NPld: gp_Pln
	:param Angled:
	:type Angled: float
	:param ModifyLeft: default value is Standard_True
	:type ModifyLeft: bool
	:param ModifyRight: default value is Standard_True
	:type ModifyRight: bool
	:rtype: None
") Perform;
		void Perform (const TopoDS_Face & F,const TopoDS_Wire & W,const gp_Dir & Extractg,const gp_Pln & NPlg,const Standard_Real Angleg,const gp_Dir & Extractd,const gp_Pln & NPld,const Standard_Real Angled,const Standard_Boolean ModifyLeft = Standard_True,const Standard_Boolean ModifyRight = Standard_True);
		%feature("autodoc", "	* Splits the face <F> of the former given shape with the wire <W>. The wire is assumed to lie on the face. Puts a draft angle on the left part of the wire. The draft angle is measured with the direction <Extract>. <Npl> defines the neutral plane (points belonging to the neutral plane are not modified). <Angle> is the value of the draft angle.

	:param F:
	:type F: TopoDS_Face &
	:param W:
	:type W: TopoDS_Wire &
	:param Extract:
	:type Extract: gp_Dir
	:param NPl:
	:type NPl: gp_Pln
	:param Angle:
	:type Angle: float
	:rtype: None
") Perform;
		void Perform (const TopoDS_Face & F,const TopoDS_Wire & W,const gp_Dir & Extract,const gp_Pln & NPl,const Standard_Real Angle);
		%feature("autodoc", "	* Returns <Standard_True> if the modification has been succesfully performed.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") OriginalShape;
		const TopoDS_Shape  OriginalShape ();
		%feature("autodoc", "	* Returns the modified shape.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("autodoc", "	* Manages the descendant shapes.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") ShapesFromShape;
		const TopTools_ListOfShape & ShapesFromShape (const TopoDS_Shape & S);
};


%feature("shadow") LocOpe_SplitDrafts::~LocOpe_SplitDrafts %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_SplitDrafts {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_SplitShape;
class LocOpe_SplitShape {
	public:
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") LocOpe_SplitShape;
		 LocOpe_SplitShape ();
		%feature("autodoc", "	* Creates the process with the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") LocOpe_SplitShape;
		 LocOpe_SplitShape (const TopoDS_Shape & S);
		%feature("autodoc", "	* Initializes the process on the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "	* Tests if it is possible to split the edge <E>.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") CanSplit;
		Standard_Boolean CanSplit (const TopoDS_Edge & E);
		%feature("autodoc", "	* Adds the vertex <V> on the edge <E>, at parameter <P>.

	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: float
	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") Add;
		void Add (const TopoDS_Vertex & V,const Standard_Real P,const TopoDS_Edge & E);
		%feature("autodoc", "	* Adds the wire <W> on the face <F>.

	:param W:
	:type W: TopoDS_Wire &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Add;
		void Add (const TopoDS_Wire & W,const TopoDS_Face & F);
		%feature("autodoc", "	* Adds the list of wires <Lwires> on the face <F>.

	:param Lwires:
	:type Lwires: TopTools_ListOfShape &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Add;
		void Add (const TopTools_ListOfShape & Lwires,const TopoDS_Face & F);
		%feature("autodoc", "	* Returns the 'original' shape.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("autodoc", "	* Returns the list of descendant shapes of <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") DescendantShapes;
		const TopTools_ListOfShape & DescendantShapes (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns the 'left' part defined by the wire <W> on the face <F>. The returned list of shape is in fact a list of faces. The face <F> is considered with its topological orientation in the original shape. <W> is considered with its orientation.

	:param W:
	:type W: TopoDS_Wire &
	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") LeftOf;
		const TopTools_ListOfShape & LeftOf (const TopoDS_Wire & W,const TopoDS_Face & F);
};


%feature("shadow") LocOpe_SplitShape::~LocOpe_SplitShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_SplitShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_Spliter;
class LocOpe_Spliter {
	public:
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") LocOpe_Spliter;
		 LocOpe_Spliter ();
		%feature("autodoc", "	* Creates the algorithm on the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") LocOpe_Spliter;
		 LocOpe_Spliter (const TopoDS_Shape & S);
		%feature("autodoc", "	* Initializes the algorithm on the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "	:param PW:
	:type PW: Handle_LocOpe_ProjectedWires &
	:rtype: None
") Perform;
		void Perform (const Handle_LocOpe_ProjectedWires & PW);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the new shape

	:rtype: TopoDS_Shape
") ResultingShape;
		const TopoDS_Shape  ResultingShape ();
		%feature("autodoc", "	* Returns the initial shape

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("autodoc", "	* Returns the faces which are the left of the projected wires and which are

	:rtype: TopTools_ListOfShape
") DirectLeft;
		const TopTools_ListOfShape & DirectLeft ();
		%feature("autodoc", "	* Returns the faces of the 'left' part on the shape. (It is build from DirectLeft, with the faces connected to this set, and so on...).

	:rtype: TopTools_ListOfShape
") Left;
		const TopTools_ListOfShape & Left ();
		%feature("autodoc", "	* Returns the list of descendant shapes of <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") DescendantShapes;
		const TopTools_ListOfShape & DescendantShapes (const TopoDS_Shape & S);
};


%feature("shadow") LocOpe_Spliter::~LocOpe_Spliter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_Spliter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LocOpe_GluedShape;
class LocOpe_GluedShape : public LocOpe_GeneratedShape {
	public:
		%feature("autodoc", "	:rtype: None
") LocOpe_GluedShape;
		 LocOpe_GluedShape ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") LocOpe_GluedShape;
		 LocOpe_GluedShape (const TopoDS_Shape & S);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") GlueOnFace;
		void GlueOnFace (const TopoDS_Face & F);
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") GeneratingEdges;
		const TopTools_ListOfShape & GeneratingEdges ();
		%feature("autodoc", "	* Returns the edge created by the vertex <V>. If none, must return a null shape.

	:param V:
	:type V: TopoDS_Vertex &
	:rtype: TopoDS_Edge
") Generated;
		TopoDS_Edge Generated (const TopoDS_Vertex & V);
		%feature("autodoc", "	* Returns the face created by the edge <E>. If none, must return a null shape.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopoDS_Face
") Generated;
		TopoDS_Face Generated (const TopoDS_Edge & E);
		%feature("autodoc", "	* Returns the list of correctly oriented generated faces.

	:rtype: TopTools_ListOfShape
") OrientedFaces;
		const TopTools_ListOfShape & OrientedFaces ();
};


%feature("shadow") LocOpe_GluedShape::~LocOpe_GluedShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_GluedShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend LocOpe_GluedShape {
	Handle_LocOpe_GluedShape GetHandle() {
	return *(Handle_LocOpe_GluedShape*) &$self;
	}
};

%nodefaultctor Handle_LocOpe_GluedShape;
class Handle_LocOpe_GluedShape : public Handle_LocOpe_GeneratedShape {

    public:
        // constructors
        Handle_LocOpe_GluedShape();
        Handle_LocOpe_GluedShape(const Handle_LocOpe_GluedShape &aHandle);
        Handle_LocOpe_GluedShape(const LocOpe_GluedShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_LocOpe_GluedShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_LocOpe_GluedShape {
    LocOpe_GluedShape* GetObject() {
    return (LocOpe_GluedShape*)$self->Access();
    }
};
%feature("shadow") Handle_LocOpe_GluedShape::~Handle_LocOpe_GluedShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_LocOpe_GluedShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor LocOpe_WiresOnShape;
class LocOpe_WiresOnShape : public LocOpe_ProjectedWires {
	public:
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") LocOpe_WiresOnShape;
		 LocOpe_WiresOnShape (const TopoDS_Shape & S);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "	* Set the flag of check internal intersections default value is True (to check)

	:param ToCheckInterior:
	:type ToCheckInterior: bool
	:rtype: None
") SetCheckInterior;
		void SetCheckInterior (const Standard_Boolean ToCheckInterior);
		%feature("autodoc", "	:param W:
	:type W: TopoDS_Wire &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Bind;
		void Bind (const TopoDS_Wire & W,const TopoDS_Face & F);
		%feature("autodoc", "	:param Comp:
	:type Comp: TopoDS_Compound &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Bind;
		void Bind (const TopoDS_Compound & Comp,const TopoDS_Face & F);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Bind;
		void Bind (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "	:param EfromW:
	:type EfromW: TopoDS_Edge &
	:param EonFace:
	:type EonFace: TopoDS_Edge &
	:rtype: None
") Bind;
		void Bind (const TopoDS_Edge & EfromW,const TopoDS_Edge & EonFace);
		%feature("autodoc", "	:rtype: None
") BindAll;
		void BindAll ();
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: None
") InitEdgeIterator;
		void InitEdgeIterator ();
		%feature("autodoc", "	:rtype: bool
") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		TopoDS_Edge Edge ();
		%feature("autodoc", "	* Returns the face of the shape on which the current edge is projected.

	:rtype: TopoDS_Face
") OnFace;
		TopoDS_Face OnFace ();
		%feature("autodoc", "	* If the current edge is projected on an edge, returns <Standard_True> and sets the value of <E>. Otherwise, returns <Standard_False>.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") OnEdge;
		Standard_Boolean OnEdge (TopoDS_Edge & E);
		%feature("autodoc", "	:rtype: None
") NextEdge;
		void NextEdge ();
		%feature("autodoc", "	:param Vwire:
	:type Vwire: TopoDS_Vertex &
	:param Vshape:
	:type Vshape: TopoDS_Vertex &
	:rtype: bool
") OnVertex;
		Standard_Boolean OnVertex (const TopoDS_Vertex & Vwire,TopoDS_Vertex & Vshape);
		%feature("autodoc", "	* If the vertex <V> lies on an edge of the original shape, returns <Standard_True> and sets the concerned edge in <E>, and the parameter on the edge in <P>. Else returns <Standard_False>.

	:param V:
	:type V: TopoDS_Vertex &
	:param E:
	:type E: TopoDS_Edge &
	:param P:
	:type P: float &
	:rtype: bool
") OnEdge;
		Standard_Boolean OnEdge (const TopoDS_Vertex & V,TopoDS_Edge & E,Standard_Real &OutValue);
		%feature("autodoc", "	* tells is the face to be split by section or not

	:param aFace:
	:type aFace: TopoDS_Shape &
	:rtype: bool
") IsFaceWithSection;
		Standard_Boolean IsFaceWithSection (const TopoDS_Shape & aFace);
};


%feature("shadow") LocOpe_WiresOnShape::~LocOpe_WiresOnShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LocOpe_WiresOnShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend LocOpe_WiresOnShape {
	Handle_LocOpe_WiresOnShape GetHandle() {
	return *(Handle_LocOpe_WiresOnShape*) &$self;
	}
};

%nodefaultctor Handle_LocOpe_WiresOnShape;
class Handle_LocOpe_WiresOnShape : public Handle_LocOpe_ProjectedWires {

    public:
        // constructors
        Handle_LocOpe_WiresOnShape();
        Handle_LocOpe_WiresOnShape(const Handle_LocOpe_WiresOnShape &aHandle);
        Handle_LocOpe_WiresOnShape(const LocOpe_WiresOnShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_LocOpe_WiresOnShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_LocOpe_WiresOnShape {
    LocOpe_WiresOnShape* GetObject() {
    return (LocOpe_WiresOnShape*)$self->Access();
    }
};
%feature("shadow") Handle_LocOpe_WiresOnShape::~Handle_LocOpe_WiresOnShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_LocOpe_WiresOnShape {
    void _kill_pointed() {
        delete $self;
    }
};

