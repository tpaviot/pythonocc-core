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
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	OnF(TopoDS_Face)

Returns:
	static Standard_Boolean

Returns Standard_True  when the wire <W> is closed  
         on the face <OnF>.") Closed;
		static Standard_Boolean Closed (const TopoDS_Wire & W,const TopoDS_Face & OnF);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	OnF(TopoDS_Face)

Returns:
	static Standard_Boolean

Returns Standard_True  when the edge <E> is closed  
         on the face <OnF>.") Closed;
		static Standard_Boolean Closed (const TopoDS_Edge & E,const TopoDS_Face & OnF);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F1(TopoDS_Face)
	F2(TopoDS_Face)

Returns:
	static Standard_Boolean

Returns Standard_True  when the faces are tangent") TgtFaces;
		static Standard_Boolean TgtFaces (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Pt(TColgp_SequenceOfPnt)

Returns:
	static void

No detailed docstring for this function.") SampleEdges;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LocOpe_BuildShape;
		 LocOpe_BuildShape ();
		%feature("autodoc", "Args:
	L(TopTools_ListOfShape)

Returns:
	None

Builds shape(s) from  the list <L>.  Uses only the  
         faces of <L>.") LocOpe_BuildShape;
		 LocOpe_BuildShape (const TopTools_ListOfShape & L);
		%feature("autodoc", "Args:
	L(TopTools_ListOfShape)

Returns:
	None

Builds shape(s) from  the list <L>.  Uses only the  
         faces of <L>.") Perform;
		void Perform (const TopTools_ListOfShape & L);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape ();
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LocOpe_BuildWires;
		 LocOpe_BuildWires ();
		%feature("autodoc", "Args:
	Ledges(TopTools_ListOfShape)
	PW(Handle_LocOpe_ProjectedWires)

Returns:
	None

No detailed docstring for this function.") LocOpe_BuildWires;
		 LocOpe_BuildWires (const TopTools_ListOfShape & Ledges,const Handle_LocOpe_ProjectedWires & PW);
		%feature("autodoc", "Args:
	Ledges(TopTools_ListOfShape)
	PW(Handle_LocOpe_ProjectedWires)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopTools_ListOfShape & Ledges,const Handle_LocOpe_ProjectedWires & PW);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Result;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") LocOpe_CSIntersector;
		 LocOpe_CSIntersector ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Creates  and performs the intersection     betwwen  
         <Ax1> and <S>.") LocOpe_CSIntersector;
		 LocOpe_CSIntersector (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Performs the intersection between <Ax1 and <S>.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	Slin(LocOpe_SequenceOfLin)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const LocOpe_SequenceOfLin & Slin);
		%feature("autodoc", "Args:
	Scir(LocOpe_SequenceOfCirc)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const LocOpe_SequenceOfCirc & Scir);
		%feature("autodoc", "Args:
	Scur(TColGeom_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TColGeom_SequenceOfCurve & Scur);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns <Standard_True>  if the  intersection  has  
         been done.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Integer

Returns  the number of   intersection point on the  
         element of range <I>.") NbPoints;
		Standard_Integer NbPoints (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	Index(Standard_Integer)

Returns:
	LocOpe_PntFace

Returns the intersection point of range <Index> on  
         element of range   <I>. The points   are sorted in  
         increasing order of parameter along the axis.") Point;
		const LocOpe_PntFace & Point (const Standard_Integer I,const Standard_Integer Index);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	From(Standard_Real)
	Tol(Standard_Real)
	Or(TopAbs_Orientation)
	IndFrom(Standard_Integer)
	IndTo(Standard_Integer)

Returns:
	Standard_Boolean

On  the element of range   <I>, searches the first  
         intersection   point  located after  the parameter  
         <From>,   wich orientation is not TopAbs_EXTERNAL.  
         If  found, returns <Standard_True>.  <Or> contains  
         the orientation    of  the  point,  <IndFrom>  and  
         <IndTo> represents  the interval  of index in  the  
         sequence  of intersection  point corresponding  to  
         the  point. (IndFrom <=   IndTo). <Tol> is used to  
         determine if 2 parameters are equal.  
 
         Otherwise, returns <Standard_False>.") LocalizeAfter;
		Standard_Boolean LocalizeAfter (const Standard_Integer I,const Standard_Real From,const Standard_Real Tol,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	From(Standard_Real)
	Tol(Standard_Real)
	Or(TopAbs_Orientation)
	IndFrom(Standard_Integer)
	IndTo(Standard_Integer)

Returns:
	Standard_Boolean

On the element  of range  <I>, searches the  first  
         intersection point   located before  the parameter  
         <From>,  wich orientation  is not TopAbs_EXTERNAL.  
         If found,  returns <Standard_True>.  <Or> contains  
         the   orientation  of   the point,  <IndFrom>  and  
         <IndTo> represents the interval   of index in  the  
         sequence of  intersection  point corresponding  to  
         the point (IndFrom  <=  IndTo). <Tol> is   used to  
         determine if 2 parameters are equal.  
 
         Otherwise, returns <Standard_False>.") LocalizeBefore;
		Standard_Boolean LocalizeBefore (const Standard_Integer I,const Standard_Real From,const Standard_Real Tol,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	FromInd(Standard_Integer)
	Tol(Standard_Real)
	Or(TopAbs_Orientation)
	IndFrom(Standard_Integer)
	IndTo(Standard_Integer)

Returns:
	Standard_Boolean

On the  element of  range <I>, searches  the first  
         intersection      point  located after the   index  
         <FromInd> ( >=  FromInd + 1), wich  orientation is  
         not    TopAbs_EXTERNAL.      If    found,  returns  
         <Standard_True>.  <Or> contains the orientation of  
         the  point, <IndFrom>  and <IndTo> represents  the  
         interval of index in  the sequence of intersection  
         point corresponding   to the  point.  (IndFrom  <=  
         IndTo). <Tol> is used to determine if 2 parameters  
         are equal.  
 
         Otherwise, returns <Standard_False>.") LocalizeAfter;
		Standard_Boolean LocalizeAfter (const Standard_Integer I,const Standard_Integer FromInd,const Standard_Real Tol,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	FromInd(Standard_Integer)
	Tol(Standard_Real)
	Or(TopAbs_Orientation)
	IndFrom(Standard_Integer)
	IndTo(Standard_Integer)

Returns:
	Standard_Boolean

On  the element of  range  <I>, searches the first  
         intersection  point    located  before  the  index  
         <FromInd>  (  <= FromInd -1),  wich orientation is  
         not   TopAbs_EXTERNAL.  If    found,       returns  
         <Standard_True>.  <Or> contains the orientation of  
         the  point, <IndFrom>  and  <IndTo> represents the  
         interval of  index in the sequence of intersection  
         point  corresponding to   the  point  (IndFrom  <=  
         IndTo). <Tol> is used to determine if 2 parameters  
         are equal.  
 
         Otherwise, returns <Standard_False>.") LocalizeBefore;
		Standard_Boolean LocalizeBefore (const Standard_Integer I,const Standard_Integer FromInd,const Standard_Real Tol,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector ();
		%feature("autodoc", "Args:
	Axis(gp_Ax1)
	S(TopoDS_Shape)

Returns:
	None

Creates  and performs the intersection     betwwen  
         <Ax1> and <S>.") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector (const gp_Ax1 & Axis,const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	C(gp_Circ)
	S(TopoDS_Shape)

Returns:
	None

Creates  and performs yte intersection     betwwen  
         <C> and <S>.") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector (const gp_Circ & C,const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	Axis(gp_Ax1)
	S(TopoDS_Shape)

Returns:
	None

Performs the intersection between <Ax1 and <S>.") Init;
		void Init (const gp_Ax1 & Axis,const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	C(gp_Circ)
	S(TopoDS_Shape)

Returns:
	None

Performs the intersection between <Ax1 and <S>.") Init;
		void Init (const gp_Circ & C,const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns <Standard_True>  if the  intersection  has  
         been done.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of intersection point.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	LocOpe_PntFace

Returns the intersection  point  of range <Index>.  
         The points  are   sorted in increasing  order   of  
         parameter along the axis.") Point;
		const LocOpe_PntFace & Point (const Standard_Integer Index);
		%feature("autodoc", "Args:
	From(Standard_Real)
	Or(TopAbs_Orientation)
	IndFrom(Standard_Integer)
	IndTo(Standard_Integer)

Returns:
	Standard_Boolean

Searches the   first intersection  point   located  
         after the  parameter  <From>, wich  orientation is  
         not       TopAbs_EXTERNAL.      If found,  returns  
         <Standard_True>.  <Or> contains the orientation of  
         the  point, <IndFrom>  and  <IndTo> represents the  
         interval of index  in the sequence of intersection  
         point  corresponding  to   the point. (IndFrom  <=  
         IndTo).  
 
         Otherwise, returns <Standard_False>.") LocalizeAfter;
		Standard_Boolean LocalizeAfter (const Standard_Real From,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	From(Standard_Real)
	Or(TopAbs_Orientation)
	IndFrom(Standard_Integer)
	IndTo(Standard_Integer)

Returns:
	Standard_Boolean

Searches  the first intersection point     located  
         before  the parameter <From>,  wich orientation is  
         not      TopAbs_EXTERNAL.      If  found,  returns  
         <Standard_True>.  <Or> contains the orientation of  
         the point,  <IndFrom>  and <IndTo>  represents the  
         interval of index  in the sequence of intersection  
         point  corresponding   to the point   (IndFrom  <=  
         IndTo).  
 
         Otherwise, returns <Standard_False>.") LocalizeBefore;
		Standard_Boolean LocalizeBefore (const Standard_Real From,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	FromInd(Standard_Integer)
	Or(TopAbs_Orientation)
	IndFrom(Standard_Integer)
	IndTo(Standard_Integer)

Returns:
	Standard_Boolean

Searches  the first intersection point     located  
         after the index <FromInd>  ( >= FromInd + 1), wich  
         orientation   is   not TopAbs_EXTERNAL.   If found,  
         returns   <Standard_True>.   <Or>  contains    the  
         orientation of the  point, <IndFrom>  and  <IndTo>  
         represents the interval  of index in  the sequence  
         of  intersection  point     corresponding to   the  
         point. (IndFrom <= IndTo).  
 
         Otherwise, returns <Standard_False>.") LocalizeAfter;
		Standard_Boolean LocalizeAfter (const Standard_Integer FromInd,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	FromInd(Standard_Integer)
	Or(TopAbs_Orientation)
	IndFrom(Standard_Integer)
	IndTo(Standard_Integer)

Returns:
	Standard_Boolean

Searches the  first  intersection   point  located  
         before the index <FromInd>  ( <= FromInd -1), wich  
         orientation is   not TopAbs_EXTERNAL.   If   found,  
         returns   <Standard_True>.  <Or>  contains     the  
         orientation  of the  point,  <IndFrom> and <IndTo>  
         represents the interval  of index  in the sequence  
         of  intersection  point corresponding to the point  
         (IndFrom <= IndTo).  
 
         Otherwise, returns <Standard_False>.") LocalizeBefore;
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
		%feature("autodoc", "Args:
	Spine(TopoDS_Face)
	Height1(Standard_Real)
	Height2(Standard_Real)
	Angle(Standard_Real)

Returns:
	None

No detailed docstring for this function.") LocOpe_DPrism;
		 LocOpe_DPrism (const TopoDS_Face & Spine,const Standard_Real Height1,const Standard_Real Height2,const Standard_Real Angle);
		%feature("autodoc", "Args:
	Spine(TopoDS_Face)
	Height(Standard_Real)
	Angle(Standard_Real)

Returns:
	None

No detailed docstring for this function.") LocOpe_DPrism;
		 LocOpe_DPrism (const TopoDS_Face & Spine,const Standard_Real Height,const Standard_Real Angle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Spine;
		const TopoDS_Shape & Spine ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Profile;
		const TopoDS_Shape & Profile ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") FirstShape;
		const TopoDS_Shape & FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") LastShape;
		const TopoDS_Shape & LastShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Shapes;
		const TopTools_ListOfShape & Shapes (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	SCurves(TColGeom_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Curves;
		void Curves (TColGeom_SequenceOfCurve & SCurves);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") BarycCurve;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LocOpe_DataMapIteratorOfDataMapOfShapePnt;
		 LocOpe_DataMapIteratorOfDataMapOfShapePnt ();
		%feature("autodoc", "Args:
	aMap(LocOpe_DataMapOfShapePnt)

Returns:
	None

No detailed docstring for this function.") LocOpe_DataMapIteratorOfDataMapOfShapePnt;
		 LocOpe_DataMapIteratorOfDataMapOfShapePnt (const LocOpe_DataMapOfShapePnt & aMap);
		%feature("autodoc", "Args:
	aMap(LocOpe_DataMapOfShapePnt)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const LocOpe_DataMapOfShapePnt & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		const gp_Pnt & Value ();
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
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(gp_Pnt)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") LocOpe_DataMapNodeOfDataMapOfShapePnt;
		 LocOpe_DataMapNodeOfDataMapOfShapePnt (const TopoDS_Shape & K,const gp_Pnt & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		gp_Pnt & Value ();
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") LocOpe_DataMapOfShapePnt;
		 LocOpe_DataMapOfShapePnt (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(LocOpe_DataMapOfShapePnt)

Returns:
	LocOpe_DataMapOfShapePnt

No detailed docstring for this function.") Assign;
		LocOpe_DataMapOfShapePnt & Assign (const LocOpe_DataMapOfShapePnt & Other);
		%feature("autodoc", "Args:
	Other(LocOpe_DataMapOfShapePnt)

Returns:
	LocOpe_DataMapOfShapePnt

No detailed docstring for this function.") operator=;
		LocOpe_DataMapOfShapePnt & operator = (const LocOpe_DataMapOfShapePnt & Other);
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
	I(gp_Pnt)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const gp_Pnt & I);
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
	gp_Pnt

No detailed docstring for this function.") Find;
		const gp_Pnt & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	gp_Pnt

No detailed docstring for this function.") ChangeFind;
		gp_Pnt & ChangeFind (const TopoDS_Shape & K);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LocOpe_FindEdges;
		 LocOpe_FindEdges ();
		%feature("autodoc", "Args:
	FFrom(TopoDS_Shape)
	FTo(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") LocOpe_FindEdges;
		 LocOpe_FindEdges (const TopoDS_Shape & FFrom,const TopoDS_Shape & FTo);
		%feature("autodoc", "Args:
	FFrom(TopoDS_Shape)
	FTo(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const TopoDS_Shape & FFrom,const TopoDS_Shape & FTo);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitIterator;
		void InitIterator ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") EdgeFrom;
		const TopoDS_Edge & EdgeFrom ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") EdgeTo;
		const TopoDS_Edge & EdgeTo ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LocOpe_FindEdgesInFace;
		 LocOpe_FindEdgesInFace ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") LocOpe_FindEdgesInFace;
		 LocOpe_FindEdgesInFace (const TopoDS_Shape & S,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const TopoDS_Shape & S,const TopoDS_Face & F);
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
	TopoDS_Edge

No detailed docstring for this function.") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
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
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TopTools_ListOfShape

No detailed docstring for this function.") GeneratingEdges;
		virtual const TopTools_ListOfShape & GeneratingEdges ();
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	virtual TopoDS_Edge

Returns the  edge  created by  the  vertex <V>. If  
         none, must return a null shape.") Generated;
		virtual TopoDS_Edge Generated (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	virtual TopoDS_Face

Returns the face created by the edge <E>. If none,  
         must return a null shape.") Generated;
		virtual TopoDS_Face Generated (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TopTools_ListOfShape

Returns  the  list of correctly oriented generated  
         faces.") OrientedFaces;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") LocOpe_Generator;
		 LocOpe_Generator ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Creates the algorithm on the shape <S>.") LocOpe_Generator;
		 LocOpe_Generator (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initializes the algorithm on the shape <S>.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	G(Handle_LocOpe_GeneratedShape)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Handle_LocOpe_GeneratedShape & G);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the new shape") ResultingShape;
		const TopoDS_Shape & ResultingShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the initial shape") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	TopTools_ListOfShape

Returns  the  descendant  face  of <F>.    <F> may  
         belong to the original shape or to the 'generated'  
         shape.  The returned    face may be   a null shape  
         (when <F> disappears).") DescendantFace;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LocOpe_Gluer;
		 LocOpe_Gluer ();
		%feature("autodoc", "Args:
	Sbase(TopoDS_Shape)
	Snew(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") LocOpe_Gluer;
		 LocOpe_Gluer (const TopoDS_Shape & Sbase,const TopoDS_Shape & Snew);
		%feature("autodoc", "Args:
	Sbase(TopoDS_Shape)
	Snew(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Shape & Snew);
		%feature("autodoc", "Args:
	Fnew(TopoDS_Face)
	Fbase(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Bind;
		void Bind (const TopoDS_Face & Fnew,const TopoDS_Face & Fbase);
		%feature("autodoc", "Args:
	Enew(TopoDS_Edge)
	Ebase(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") Bind;
		void Bind (const TopoDS_Edge & Enew,const TopoDS_Edge & Ebase);
		%feature("autodoc", "Args:
	None
Returns:
	LocOpe_Operation

No detailed docstring for this function.") OpeType;
		LocOpe_Operation OpeType ();
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
	TopoDS_Shape

No detailed docstring for this function.") ResultingShape;
		const TopoDS_Shape & ResultingShape ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") DescendantFaces;
		const TopTools_ListOfShape & DescendantFaces (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") BasisShape;
		const TopoDS_Shape & BasisShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") GluedShape;
		const TopoDS_Shape & GluedShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Edges;
		const TopTools_ListOfShape & Edges ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") TgtEdges;
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
		%feature("autodoc", "Args:
	BT(TopOpeBRepDS_BuildTool)

Returns:
	None

No detailed docstring for this function.") LocOpe_HBuilder;
		 LocOpe_HBuilder (const TopOpeBRepDS_BuildTool & BT);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Classify;
		Standard_Boolean Classify ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Classify;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LocOpe_LinearForm;
		 LocOpe_LinearForm ();
		%feature("autodoc", "Args:
	Base(TopoDS_Shape)
	V(gp_Vec)
	Pnt1(gp_Pnt)
	Pnt2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") LocOpe_LinearForm;
		 LocOpe_LinearForm (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Pnt & Pnt1,const gp_Pnt & Pnt2);
		%feature("autodoc", "Args:
	Base(TopoDS_Shape)
	V(gp_Vec)
	Vectra(gp_Vec)
	Pnt1(gp_Pnt)
	Pnt2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") LocOpe_LinearForm;
		 LocOpe_LinearForm (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Vec & Vectra,const gp_Pnt & Pnt1,const gp_Pnt & Pnt2);
		%feature("autodoc", "Args:
	Base(TopoDS_Shape)
	V(gp_Vec)
	Pnt1(gp_Pnt)
	Pnt2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Pnt & Pnt1,const gp_Pnt & Pnt2);
		%feature("autodoc", "Args:
	Base(TopoDS_Shape)
	V(gp_Vec)
	Vectra(gp_Vec)
	Pnt1(gp_Pnt)
	Pnt2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Vec & Vectra,const gp_Pnt & Pnt1,const gp_Pnt & Pnt2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") FirstShape;
		const TopoDS_Shape & FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") LastShape;
		const TopoDS_Shape & LastShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Shapes;
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
		%feature("autodoc", "Args:
	Spine(TopoDS_Wire)
	Profile(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") LocOpe_Pipe;
		 LocOpe_Pipe (const TopoDS_Wire & Spine,const TopoDS_Shape & Profile);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Spine;
		const TopoDS_Shape & Spine ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Profile;
		const TopoDS_Shape & Profile ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") FirstShape;
		const TopoDS_Shape & FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") LastShape;
		const TopoDS_Shape & LastShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Shapes;
		const TopTools_ListOfShape & Shapes (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	Spt(TColgp_SequenceOfPnt)

Returns:
	TColGeom_SequenceOfCurve

No detailed docstring for this function.") Curves;
		const TColGeom_SequenceOfCurve & Curves (const TColgp_SequenceOfPnt & Spt);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") BarycCurve;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor. Useful only for the list.") LocOpe_PntFace;
		 LocOpe_PntFace ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	F(TopoDS_Face)
	Or(TopAbs_Orientation)
	Param(Standard_Real)
	UPar(Standard_Real)
	VPar(Standard_Real)

Returns:
	None

No detailed docstring for this function.") LocOpe_PntFace;
		 LocOpe_PntFace (const gp_Pnt & P,const TopoDS_Face & F,const TopAbs_Orientation Or,const Standard_Real Param,const Standard_Real UPar,const Standard_Real VPar);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Pnt;
		const gp_Pnt & Pnt ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Face;
		const TopoDS_Face & Face ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") ChangeOrientation;
		TopAbs_Orientation & ChangeOrientation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") UParameter;
		Standard_Real UParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") VParameter;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LocOpe_Prism;
		 LocOpe_Prism ();
		%feature("autodoc", "Args:
	Base(TopoDS_Shape)
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") LocOpe_Prism;
		 LocOpe_Prism (const TopoDS_Shape & Base,const gp_Vec & V);
		%feature("autodoc", "Args:
	Base(TopoDS_Shape)
	V(gp_Vec)
	Vectra(gp_Vec)

Returns:
	None

No detailed docstring for this function.") LocOpe_Prism;
		 LocOpe_Prism (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Vec & Vectra);
		%feature("autodoc", "Args:
	Base(TopoDS_Shape)
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopoDS_Shape & Base,const gp_Vec & V);
		%feature("autodoc", "Args:
	Base(TopoDS_Shape)
	V(gp_Vec)
	Vtra(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Vec & Vtra);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") FirstShape;
		const TopoDS_Shape & FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") LastShape;
		const TopoDS_Shape & LastShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Shapes;
		const TopTools_ListOfShape & Shapes (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	SCurves(TColGeom_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Curves;
		void Curves (TColGeom_SequenceOfCurve & SCurves);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") BarycCurve;
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
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") InitEdgeIterator;
		virtual void InitEdgeIterator ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") MoreEdge;
		virtual Standard_Boolean MoreEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopoDS_Edge

No detailed docstring for this function.") Edge;
		virtual TopoDS_Edge Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopoDS_Face

Returns the face of the shape on which the current  
         edge is projected.") OnFace;
		virtual TopoDS_Face OnFace ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	virtual Standard_Boolean

If the   current  edge is  projected  on  an edge,  
         returns <Standard_True> and sets the value of <E>.  
         Otherwise, returns <Standard_False>.") OnEdge;
		virtual Standard_Boolean OnEdge (TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") NextEdge;
		virtual void NextEdge ();
		%feature("autodoc", "Args:
	Vwire(TopoDS_Vertex)
	Vshape(TopoDS_Vertex)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") OnVertex;
		virtual Standard_Boolean OnVertex (const TopoDS_Vertex & Vwire,TopoDS_Vertex & Vshape);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	E(TopoDS_Edge)
	P(Standard_Real)

Returns:
	virtual Standard_Boolean

If the vertex <V> lies on  an edge of the original  
         shape,  returns     <Standard_True> and   sets the  
         concerned edge in  <E>,  and the parameter on  the  
         edge in <P>.  
         Else returns <Standard_False>.") OnEdge;
		virtual Standard_Boolean OnEdge (const TopoDS_Vertex & V,TopoDS_Edge & E,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aFace(TopoDS_Shape)

Returns:
	virtual Standard_Boolean

tells is the face to be split by section or not") IsFaceWithSection;
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
		%feature("autodoc", "Args:
	I(gp_Circ)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") LocOpe_SequenceNodeOfSequenceOfCirc;
		 LocOpe_SequenceNodeOfSequenceOfCirc (const gp_Circ & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

No detailed docstring for this function.") Value;
		gp_Circ & Value ();
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
		%feature("autodoc", "Args:
	I(gp_Lin)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") LocOpe_SequenceNodeOfSequenceOfLin;
		 LocOpe_SequenceNodeOfSequenceOfLin (const gp_Lin & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin

No detailed docstring for this function.") Value;
		gp_Lin & Value ();
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
		%feature("autodoc", "Args:
	I(LocOpe_PntFace)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") LocOpe_SequenceNodeOfSequenceOfPntFace;
		 LocOpe_SequenceNodeOfSequenceOfPntFace (const LocOpe_PntFace & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	LocOpe_PntFace

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LocOpe_SequenceOfCirc;
		 LocOpe_SequenceOfCirc ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(LocOpe_SequenceOfCirc)

Returns:
	LocOpe_SequenceOfCirc

No detailed docstring for this function.") Assign;
		const LocOpe_SequenceOfCirc & Assign (const LocOpe_SequenceOfCirc & Other);
		%feature("autodoc", "Args:
	Other(LocOpe_SequenceOfCirc)

Returns:
	LocOpe_SequenceOfCirc

No detailed docstring for this function.") operator=;
		const LocOpe_SequenceOfCirc & operator = (const LocOpe_SequenceOfCirc & Other);
		%feature("autodoc", "Args:
	T(gp_Circ)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const gp_Circ & T);
		%feature("autodoc", "Args:
	S(LocOpe_SequenceOfCirc)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (LocOpe_SequenceOfCirc & S);
		%feature("autodoc", "Args:
	T(gp_Circ)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const gp_Circ & T);
		%feature("autodoc", "Args:
	S(LocOpe_SequenceOfCirc)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (LocOpe_SequenceOfCirc & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(gp_Circ)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const gp_Circ & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(LocOpe_SequenceOfCirc)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,LocOpe_SequenceOfCirc & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(gp_Circ)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const gp_Circ & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(LocOpe_SequenceOfCirc)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,LocOpe_SequenceOfCirc & S);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

No detailed docstring for this function.") First;
		const gp_Circ & First ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

No detailed docstring for this function.") Last;
		const gp_Circ & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(LocOpe_SequenceOfCirc)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,LocOpe_SequenceOfCirc & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Circ

No detailed docstring for this function.") Value;
		const gp_Circ & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(gp_Circ)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Circ & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Circ

No detailed docstring for this function.") ChangeValue;
		gp_Circ & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LocOpe_SequenceOfLin;
		 LocOpe_SequenceOfLin ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(LocOpe_SequenceOfLin)

Returns:
	LocOpe_SequenceOfLin

No detailed docstring for this function.") Assign;
		const LocOpe_SequenceOfLin & Assign (const LocOpe_SequenceOfLin & Other);
		%feature("autodoc", "Args:
	Other(LocOpe_SequenceOfLin)

Returns:
	LocOpe_SequenceOfLin

No detailed docstring for this function.") operator=;
		const LocOpe_SequenceOfLin & operator = (const LocOpe_SequenceOfLin & Other);
		%feature("autodoc", "Args:
	T(gp_Lin)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const gp_Lin & T);
		%feature("autodoc", "Args:
	S(LocOpe_SequenceOfLin)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (LocOpe_SequenceOfLin & S);
		%feature("autodoc", "Args:
	T(gp_Lin)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const gp_Lin & T);
		%feature("autodoc", "Args:
	S(LocOpe_SequenceOfLin)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (LocOpe_SequenceOfLin & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(gp_Lin)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const gp_Lin & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(LocOpe_SequenceOfLin)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,LocOpe_SequenceOfLin & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(gp_Lin)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const gp_Lin & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(LocOpe_SequenceOfLin)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,LocOpe_SequenceOfLin & S);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin

No detailed docstring for this function.") First;
		const gp_Lin & First ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin

No detailed docstring for this function.") Last;
		const gp_Lin & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(LocOpe_SequenceOfLin)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,LocOpe_SequenceOfLin & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Lin

No detailed docstring for this function.") Value;
		const gp_Lin & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(gp_Lin)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Lin & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Lin

No detailed docstring for this function.") ChangeValue;
		gp_Lin & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LocOpe_SequenceOfPntFace;
		 LocOpe_SequenceOfPntFace ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(LocOpe_SequenceOfPntFace)

Returns:
	LocOpe_SequenceOfPntFace

No detailed docstring for this function.") Assign;
		const LocOpe_SequenceOfPntFace & Assign (const LocOpe_SequenceOfPntFace & Other);
		%feature("autodoc", "Args:
	Other(LocOpe_SequenceOfPntFace)

Returns:
	LocOpe_SequenceOfPntFace

No detailed docstring for this function.") operator=;
		const LocOpe_SequenceOfPntFace & operator = (const LocOpe_SequenceOfPntFace & Other);
		%feature("autodoc", "Args:
	T(LocOpe_PntFace)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const LocOpe_PntFace & T);
		%feature("autodoc", "Args:
	S(LocOpe_SequenceOfPntFace)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (LocOpe_SequenceOfPntFace & S);
		%feature("autodoc", "Args:
	T(LocOpe_PntFace)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const LocOpe_PntFace & T);
		%feature("autodoc", "Args:
	S(LocOpe_SequenceOfPntFace)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (LocOpe_SequenceOfPntFace & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(LocOpe_PntFace)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const LocOpe_PntFace & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(LocOpe_SequenceOfPntFace)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,LocOpe_SequenceOfPntFace & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(LocOpe_PntFace)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const LocOpe_PntFace & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(LocOpe_SequenceOfPntFace)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,LocOpe_SequenceOfPntFace & S);
		%feature("autodoc", "Args:
	None
Returns:
	LocOpe_PntFace

No detailed docstring for this function.") First;
		const LocOpe_PntFace & First ();
		%feature("autodoc", "Args:
	None
Returns:
	LocOpe_PntFace

No detailed docstring for this function.") Last;
		const LocOpe_PntFace & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(LocOpe_SequenceOfPntFace)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,LocOpe_SequenceOfPntFace & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	LocOpe_PntFace

No detailed docstring for this function.") Value;
		const LocOpe_PntFace & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(LocOpe_PntFace)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const LocOpe_PntFace & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	LocOpe_PntFace

No detailed docstring for this function.") ChangeValue;
		LocOpe_PntFace & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") LocOpe_SplitDrafts;
		 LocOpe_SplitDrafts ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Creates the algoritm on the shape <S>.") LocOpe_SplitDrafts;
		 LocOpe_SplitDrafts (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initializes the algoritm with the shape <S>.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	W(TopoDS_Wire)
	Extractg(gp_Dir)
	NPlg(gp_Pln)
	Angleg(Standard_Real)
	Extractd(gp_Dir)
	NPld(gp_Pln)
	Angled(Standard_Real)
	ModifyLeft(Standard_Boolean)=Standard_True
	ModifyRight(Standard_Boolean)=Standard_True

Returns:
	None

Splits the face <F> of the former given shape with  
         the wire  <W>.  The wire is  assumed to lie on the  
         face.    Puts a draft  angle on  both parts of the  
         wire.    <Extractg>,  <Nplg>, <Angleg> define  the  
         arguments  for   the   left  part   of the   wire.  
         <Extractd>,  <Npld>, <Angled> define the arguments  
         for the right part of the wire. The draft angle is  
         measured    with the  direction  <Extract>.  <Npl>  
         defines the neutral plane (points belonging to the  
         neutral plane are not  modified).  <Angle> is  the  
         value of the draft  angle.  If <ModifyLeft> is set  
         to <Standard_False>, no draft  angle is applied to  
         the left part of the wire. If <ModifyRight> is set  
         to <Standard_False>,no draft  angle  is applied to  
         the right part of the wire.") Perform;
		void Perform (const TopoDS_Face & F,const TopoDS_Wire & W,const gp_Dir & Extractg,const gp_Pln & NPlg,const Standard_Real Angleg,const gp_Dir & Extractd,const gp_Pln & NPld,const Standard_Real Angled,const Standard_Boolean ModifyLeft = Standard_True,const Standard_Boolean ModifyRight = Standard_True);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	W(TopoDS_Wire)
	Extract(gp_Dir)
	NPl(gp_Pln)
	Angle(Standard_Real)

Returns:
	None

Splits the face <F> of the former given shape with  
         the  wire <W>.  The wire is  assumed to lie on the  
         face.  Puts a draft angle  on the left part of the  
         wire.   The draft    angle is   measured  with the  
         direction  <Extract>.   <Npl> defines the  neutral  
         plane (points belonging  to the neutral plane  are  
         not modified). <Angle> is  the value of  the draft  
         angle.") Perform;
		void Perform (const TopoDS_Face & F,const TopoDS_Wire & W,const gp_Dir & Extract,const gp_Pln & NPl,const Standard_Real Angle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns <Standard_True>  if the  modification  has  
         been succesfully performed.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") OriginalShape;
		const TopoDS_Shape & OriginalShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the modified shape.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Manages the descendant shapes.") ShapesFromShape;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") LocOpe_SplitShape;
		 LocOpe_SplitShape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Creates the process  with the shape <S>.") LocOpe_SplitShape;
		 LocOpe_SplitShape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initializes the process on the shape <S>.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	Standard_Boolean

Tests if it is possible to split the edge <E>.") CanSplit;
		Standard_Boolean CanSplit (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	P(Standard_Real)
	E(TopoDS_Edge)

Returns:
	None

Adds the vertex <V> on the edge <E>, at parameter <P>.") Add;
		void Add (const TopoDS_Vertex & V,const Standard_Real P,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	F(TopoDS_Face)

Returns:
	None

Adds the wire <W> on the face <F>.") Add;
		void Add (const TopoDS_Wire & W,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	Lwires(TopTools_ListOfShape)
	F(TopoDS_Face)

Returns:
	None

Adds the list of wires <Lwires> on the face <F>.") Add;
		void Add (const TopTools_ListOfShape & Lwires,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the 'original' shape.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns the list of descendant shapes of <S>.") DescendantShapes;
		const TopTools_ListOfShape & DescendantShapes (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	F(TopoDS_Face)

Returns:
	TopTools_ListOfShape

Returns the 'left' part defined by the wire <W> on  
         the face <F>.   The  returned list of shape  is in  
         fact  a list of faces. The  face <F> is considered  
         with its topological  orientation  in the original  
         shape.  <W> is considered with its orientation.") LeftOf;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") LocOpe_Spliter;
		 LocOpe_Spliter ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Creates the algorithm on the shape <S>.") LocOpe_Spliter;
		 LocOpe_Spliter (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initializes the algorithm on the shape <S>.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	PW(Handle_LocOpe_ProjectedWires)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Handle_LocOpe_ProjectedWires & PW);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the new shape") ResultingShape;
		const TopoDS_Shape & ResultingShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the initial shape") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns  the faces   which  are the  left of   the  
         projected wires and which are") DirectLeft;
		const TopTools_ListOfShape & DirectLeft ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns the faces of the 'left' part on the shape.  
         (It  is build   from  DirectLeft,  with  the faces  
         connected to this set, and so on...).") Left;
		const TopTools_ListOfShape & Left ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns the list of descendant shapes of <S>.") DescendantShapes;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LocOpe_GluedShape;
		 LocOpe_GluedShape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") LocOpe_GluedShape;
		 LocOpe_GluedShape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") GlueOnFace;
		void GlueOnFace (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") GeneratingEdges;
		const TopTools_ListOfShape & GeneratingEdges ();
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	TopoDS_Edge

Returns the  edge  created by  the  vertex <V>. If  
         none, must return a null shape.") Generated;
		TopoDS_Edge Generated (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	TopoDS_Face

Returns the face created by the edge <E>. If none,  
         must return a null shape.") Generated;
		TopoDS_Face Generated (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns  the  list of correctly oriented generated  
         faces.") OrientedFaces;
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
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") LocOpe_WiresOnShape;
		 LocOpe_WiresOnShape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	ToCheckInterior(Standard_Boolean)

Returns:
	None

Set the flag of check internal intersections  
         default value is True (to check)") SetCheckInterior;
		void SetCheckInterior (const Standard_Boolean ToCheckInterior);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Bind;
		void Bind (const TopoDS_Wire & W,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	Comp(TopoDS_Compound)
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Bind;
		void Bind (const TopoDS_Compound & Comp,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Bind;
		void Bind (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	EfromW(TopoDS_Edge)
	EonFace(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") Bind;
		void Bind (const TopoDS_Edge & EfromW,const TopoDS_Edge & EonFace);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BindAll;
		void BindAll ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitEdgeIterator;
		void InitEdgeIterator ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") Edge;
		TopoDS_Edge Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns the face of the shape on which the current  
         edge is projected.") OnFace;
		TopoDS_Face OnFace ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	Standard_Boolean

If the   current  edge is  projected  on  an edge,  
         returns <Standard_True> and sets the value of <E>.  
         Otherwise, returns <Standard_False>.") OnEdge;
		Standard_Boolean OnEdge (TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextEdge;
		void NextEdge ();
		%feature("autodoc", "Args:
	Vwire(TopoDS_Vertex)
	Vshape(TopoDS_Vertex)

Returns:
	Standard_Boolean

No detailed docstring for this function.") OnVertex;
		Standard_Boolean OnVertex (const TopoDS_Vertex & Vwire,TopoDS_Vertex & Vshape);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	E(TopoDS_Edge)
	P(Standard_Real)

Returns:
	Standard_Boolean

If the vertex <V> lies on  an edge of the original  
         shape,  returns     <Standard_True> and   sets the  
         concerned edge in  <E>,  and the parameter on  the  
         edge in <P>.  
         Else returns <Standard_False>.") OnEdge;
		Standard_Boolean OnEdge (const TopoDS_Vertex & V,TopoDS_Edge & E,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aFace(TopoDS_Shape)

Returns:
	Standard_Boolean

tells is the face to be split by section or not") IsFaceWithSection;
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

