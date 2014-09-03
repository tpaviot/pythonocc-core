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
%module (package="OCC") BRepClass3d

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

%include BRepClass3d_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(brepclass3d) BRepClass3d;
%nodefaultctor BRepClass3d;
class BRepClass3d {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Solid)

Returns:
	static TopoDS_Shell

Returns the outer most shell of <S>. Returns a Null  
         shell if <S> has no outer shell.  
         If <S> has only one shell, then it will return, without checking orientation.") OuterShell;
		static TopoDS_Shell OuterShell (const TopoDS_Solid & S);
};


%feature("shadow") BRepClass3d::~BRepClass3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepClass3d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepClass3d_DataMapIteratorOfMapOfInter;
class BRepClass3d_DataMapIteratorOfMapOfInter : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepClass3d_DataMapIteratorOfMapOfInter;
		 BRepClass3d_DataMapIteratorOfMapOfInter ();
		%feature("autodoc", "Args:
	aMap(BRepClass3d_MapOfInter)

Returns:
	None

No detailed docstring for this function.") BRepClass3d_DataMapIteratorOfMapOfInter;
		 BRepClass3d_DataMapIteratorOfMapOfInter (const BRepClass3d_MapOfInter & aMap);
		%feature("autodoc", "Args:
	aMap(BRepClass3d_MapOfInter)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepClass3d_MapOfInter & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Value;
		const Standard_Address & Value ();
};


%feature("shadow") BRepClass3d_DataMapIteratorOfMapOfInter::~BRepClass3d_DataMapIteratorOfMapOfInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepClass3d_DataMapIteratorOfMapOfInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepClass3d_DataMapNodeOfMapOfInter;
class BRepClass3d_DataMapNodeOfMapOfInter : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Standard_Address)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepClass3d_DataMapNodeOfMapOfInter;
		 BRepClass3d_DataMapNodeOfMapOfInter (const TopoDS_Shape & K,const Standard_Address & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Value;
		Standard_Address & Value ();
};


%feature("shadow") BRepClass3d_DataMapNodeOfMapOfInter::~BRepClass3d_DataMapNodeOfMapOfInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepClass3d_DataMapNodeOfMapOfInter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepClass3d_DataMapNodeOfMapOfInter {
	Handle_BRepClass3d_DataMapNodeOfMapOfInter GetHandle() {
	return *(Handle_BRepClass3d_DataMapNodeOfMapOfInter*) &$self;
	}
};

%nodefaultctor Handle_BRepClass3d_DataMapNodeOfMapOfInter;
class Handle_BRepClass3d_DataMapNodeOfMapOfInter : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepClass3d_DataMapNodeOfMapOfInter();
        Handle_BRepClass3d_DataMapNodeOfMapOfInter(const Handle_BRepClass3d_DataMapNodeOfMapOfInter &aHandle);
        Handle_BRepClass3d_DataMapNodeOfMapOfInter(const BRepClass3d_DataMapNodeOfMapOfInter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepClass3d_DataMapNodeOfMapOfInter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepClass3d_DataMapNodeOfMapOfInter {
    BRepClass3d_DataMapNodeOfMapOfInter* GetObject() {
    return (BRepClass3d_DataMapNodeOfMapOfInter*)$self->Access();
    }
};
%feature("shadow") Handle_BRepClass3d_DataMapNodeOfMapOfInter::~Handle_BRepClass3d_DataMapNodeOfMapOfInter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepClass3d_DataMapNodeOfMapOfInter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepClass3d_Intersector3d;
class BRepClass3d_Intersector3d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") BRepClass3d_Intersector3d;
		 BRepClass3d_Intersector3d ();
		%feature("autodoc", "Args:
	L(gp_Lin)
	Prm(Standard_Real)
	Tol(Standard_Real)
	F(TopoDS_Face)

Returns:
	None

Perform the intersection between the  
         segment L(0) ... L(Prm) and the Shape <Sh>.  
 
         Only the point with the smallest parameter on the  
         line is returned.  
 
         The Tolerance <Tol> is used to determine if the  
         first point of the segment is near the face. In  
         that case, the parameter of the intersection point  
         on the line can be a negative value (greater than -Tol).") Perform;
		void Perform (const gp_Lin & L,const Standard_Real Prm,const Standard_Real Tol,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True is returned when the intersection have been computed.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True is returned if a point has been found.") HasAPoint;
		Standard_Boolean HasAPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the U parameter of the intersection point  
         on the surface.") UParameter;
		Standard_Real UParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the V parameter of the intersection point  
         on the surface.") VParameter;
		Standard_Real VParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the parameter of the intersection point  
         on the line.") WParameter;
		Standard_Real WParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the geometric point of the intersection  
         between the line and the surface.") Pnt;
		const gp_Pnt & Pnt ();
		%feature("autodoc", "Args:
	None
Returns:
	IntCurveSurface_TransitionOnCurve

Returns the transition of the line on the surface.") Transition;
		IntCurveSurface_TransitionOnCurve Transition ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

Returns the state of the point on the face.  
         The values can be either TopAbs_IN  
            ( the point is in the face)  
          or TopAbs_ON  
            ( the point is on a boudary of the face).") State;
		TopAbs_State State ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns the significant face used to determine  
         the intersection.") Face;
		const TopoDS_Face & Face ();
};


%feature("shadow") BRepClass3d_Intersector3d::~BRepClass3d_Intersector3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepClass3d_Intersector3d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepClass3d_MapOfInter;
class BRepClass3d_MapOfInter : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepClass3d_MapOfInter;
		 BRepClass3d_MapOfInter (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepClass3d_MapOfInter)

Returns:
	BRepClass3d_MapOfInter

No detailed docstring for this function.") Assign;
		BRepClass3d_MapOfInter & Assign (const BRepClass3d_MapOfInter & Other);
		%feature("autodoc", "Args:
	Other(BRepClass3d_MapOfInter)

Returns:
	BRepClass3d_MapOfInter

No detailed docstring for this function.") operator=;
		BRepClass3d_MapOfInter & operator = (const BRepClass3d_MapOfInter & Other);
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
	I(Standard_Address)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Standard_Address & I);
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
	Standard_Address

No detailed docstring for this function.") Find;
		const Standard_Address & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind;
		Standard_Address & ChangeFind (const TopoDS_Shape & K);
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


%feature("shadow") BRepClass3d_MapOfInter::~BRepClass3d_MapOfInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepClass3d_MapOfInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepClass3d_SClassifier;
class BRepClass3d_SClassifier {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") BRepClass3d_SClassifier;
		 BRepClass3d_SClassifier ();
		%feature("autodoc", "Args:
	S(BRepClass3d_SolidExplorer)
	P(gp_Pnt)
	Tol(Standard_Real)

Returns:
	None

Constructor to classify the point P with the  
         tolerance Tol on the solid S.") BRepClass3d_SClassifier;
		 BRepClass3d_SClassifier (BRepClass3d_SolidExplorer & S,const gp_Pnt & P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	S(BRepClass3d_SolidExplorer)
	P(gp_Pnt)
	Tol(Standard_Real)

Returns:
	None

Classify the point P with the  
         tolerance Tol on the solid S.") Perform;
		void Perform (BRepClass3d_SolidExplorer & S,const gp_Pnt & P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	S(BRepClass3d_SolidExplorer)
	Tol(Standard_Real)

Returns:
	None

Classify an infinite point with the  
         tolerance Tol on the solid S.") PerformInfinitePoint;
		void PerformInfinitePoint (BRepClass3d_SolidExplorer & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the classification has been  
         computed by rejection.  
         The State is then OUT.") Rejected;
		Standard_Boolean Rejected ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

Returns the result of the classification.") State;
		TopAbs_State State ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True when the point is a point of a face.") IsOnAFace;
		Standard_Boolean IsOnAFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns the face used to determine the  
         classification. When the state is ON, this is the  
         face containing the point.  
 
         When Rejected() returns True, Face() has no signification.") Face;
		TopoDS_Face Face ();
};


%feature("shadow") BRepClass3d_SClassifier::~BRepClass3d_SClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepClass3d_SClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepClass3d_SolidExplorer;
class BRepClass3d_SolidExplorer {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepClass3d_SolidExplorer;
		 BRepClass3d_SolidExplorer ();
		%feature("autodoc", "Args:
	Oth(BRepClass3d_SolidExplorer)

Returns:
	None

Raise if called.") BRepClass3d_SolidExplorer;
		 BRepClass3d_SolidExplorer (const BRepClass3d_SolidExplorer & Oth);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") BRepClass3d_SolidExplorer;
		 BRepClass3d_SolidExplorer (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") InitShape;
		void InitShape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	virtual Standard_Boolean

Should return True if P outside of bounding vol. of the shape") Reject;
		virtual Standard_Boolean Reject (const gp_Pnt & P);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	P(gp_Pnt)
	Param(Standard_Real)

Returns:
	static Standard_Boolean

compute a point P in the face  F. Param is a Real in  
        ]0,1[ and   is  used to  initialise  the algorithm. For  
        different values , different points are returned.") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	P(gp_Pnt)
	u(Standard_Real)
	v(Standard_Real)
	Param(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	P(gp_Pnt)
	u(Standard_Real)
	v(Standard_Real)
	Param(Standard_Real)
	theVecD1U(gp_Vec)
	theVecD1V(gp_Vec)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Vec & theVecD1U,gp_Vec & theVecD1V);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	P(gp_Pnt)
	u(Standard_Real)
	v(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	P(gp_Pnt)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,gp_Pnt & P);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	u(Standard_Real)
	v(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	P(gp_Pnt)
	u(Standard_Real)
	v(Standard_Real)
	Param(Standard_Real)
	Index(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") PointInTheFace;
		Standard_Boolean PointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	P(gp_Pnt)
	u(Standard_Real)
	v(Standard_Real)
	Param(Standard_Real)
	Index(Standard_Integer)
	surf(Handle_BRepAdaptor_HSurface)
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") PointInTheFace;
		Standard_Boolean PointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,const Handle_BRepAdaptor_HSurface & surf,const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	P(gp_Pnt)
	u(Standard_Real)
	v(Standard_Real)
	Param(Standard_Real)
	Index(Standard_Integer)
	surf(Handle_BRepAdaptor_HSurface)
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	theVecD1U(gp_Vec)
	theVecD1V(gp_Vec)

Returns:
	Standard_Boolean

<Index> gives point index  to  search from and returns  
         point index of succeseful search") PointInTheFace;
		Standard_Boolean PointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,const Handle_BRepAdaptor_HSurface & surf,const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec & theVecD1U,gp_Vec & theVecD1V);
		%feature("autodoc", "Args:
	None
Returns:
	None

Starts an exploration of the shells.") InitShell;
		void InitShell ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there is a current shell.") MoreShell;
		Standard_Boolean MoreShell ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the explorer to the next shell.") NextShell;
		void NextShell ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shell

Returns the current shell.") CurrentShell;
		TopoDS_Shell CurrentShell ();
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	virtual Standard_Boolean

Returns True if the Shell is rejected.") RejectShell;
		virtual Standard_Boolean RejectShell (const gp_Lin & L);
		%feature("autodoc", "Args:
	None
Returns:
	None

Starts an exploration of the faces of the current shell.") InitFace;
		void InitFace ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if current face in current shell.") MoreFace;
		Standard_Boolean MoreFace ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the explorer to the next Face of the current shell.") NextFace;
		void NextFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns the current face.") CurrentFace;
		TopoDS_Face CurrentFace ();
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	virtual Standard_Boolean

returns True if the face is rejected.") RejectFace;
		virtual Standard_Boolean RejectFace (const gp_Lin & L);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	L(gp_Lin)
	Par(Standard_Real)

Returns:
	Standard_Integer

Returns  in <L>, <Par>  a segment having at least  
         one  intersection  with  the  shape  boundary  to  
         compute  intersections.") Segment;
		Standard_Integer Segment (const gp_Pnt & P,gp_Lin & L,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	L(gp_Lin)
	Par(Standard_Real)

Returns:
	Standard_Integer

Returns  in <L>, <Par>  a segment having at least  
         one  intersection  with  the  shape  boundary  to  
         compute  intersections.  
 
         The First Call to this method returns a line which  
         point to a point of the first face of the shape.  
         The Second Call provide a line to the second face  
         and so on.") OtherSegment;
		Standard_Integer OtherSegment (const gp_Pnt & P,gp_Lin & L,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the index of face for which  
         last segment is calculated.") GetFaceSegmentIndex;
		Standard_Integer GetFaceSegmentIndex ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	L(gp_Lin)
	Par(Standard_Real)
	S(TopAbs_State)

Returns:
	virtual void

No detailed docstring for this function.") DumpSegment;
		virtual void DumpSegment (const gp_Pnt & P,const gp_Lin & L,const Standard_Real Par,const TopAbs_State S);
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") Box;
		const Bnd_Box & Box ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	IntCurvesFace_Intersector

No detailed docstring for this function.") Intersector;
		IntCurvesFace_Intersector & Intersector (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
};


%feature("shadow") BRepClass3d_SolidExplorer::~BRepClass3d_SolidExplorer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepClass3d_SolidExplorer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepClass3d_SolidPassiveClassifier;
class BRepClass3d_SolidPassiveClassifier {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepClass3d_SolidPassiveClassifier;
		 BRepClass3d_SolidPassiveClassifier ();
		%feature("autodoc", "Args:
	L(gp_Lin)
	P(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Reset;
		void Reset (const gp_Lin & L,const Standard_Real P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Or(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") Compare;
		void Compare (const TopoDS_Face & F,const TopAbs_Orientation Or);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasIntersection;
		Standard_Boolean HasIntersection ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepClass3d_Intersector3d

No detailed docstring for this function.") Intersector;
		BRepClass3d_Intersector3d & Intersector ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") State;
		TopAbs_State State ();
};


%feature("shadow") BRepClass3d_SolidPassiveClassifier::~BRepClass3d_SolidPassiveClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepClass3d_SolidPassiveClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepClass3d_SolidClassifier;
class BRepClass3d_SolidClassifier : public BRepClass3d_SClassifier {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

empty constructor") BRepClass3d_SolidClassifier;
		 BRepClass3d_SolidClassifier ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Constructor from a Shape.") BRepClass3d_SolidClassifier;
		 BRepClass3d_SolidClassifier (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	P(gp_Pnt)
	Tol(Standard_Real)

Returns:
	None

Constructor to classify the point P with the  
         tolerance Tol on the solid S.") BRepClass3d_SolidClassifier;
		 BRepClass3d_SolidClassifier (const TopoDS_Shape & S,const gp_Pnt & P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Tol(Standard_Real)

Returns:
	None

Classify the point P with the  
         tolerance Tol on the solid S.") Perform;
		void Perform (const gp_Pnt & P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

Classify an infinite point with the  
         tolerance Tol on the solid S.  
         Useful for compute the orientation of a solid.") PerformInfinitePoint;
		void PerformInfinitePoint (const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
};


%feature("shadow") BRepClass3d_SolidClassifier::~BRepClass3d_SolidClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepClass3d_SolidClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
