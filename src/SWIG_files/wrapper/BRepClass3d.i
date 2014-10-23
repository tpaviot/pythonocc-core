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
		%feature("autodoc", "	* Returns the outer most shell of <S>. Returns a Null shell if <S> has no outer shell. If <S> has only one shell, then it will return, without checking orientation.

	:param S:
	:type S: TopoDS_Solid &
	:rtype: TopoDS_Shell
") OuterShell;
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
		%feature("autodoc", "	:rtype: None
") BRepClass3d_DataMapIteratorOfMapOfInter;
		 BRepClass3d_DataMapIteratorOfMapOfInter ();
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepClass3d_MapOfInter &
	:rtype: None
") BRepClass3d_DataMapIteratorOfMapOfInter;
		 BRepClass3d_DataMapIteratorOfMapOfInter (const BRepClass3d_MapOfInter & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepClass3d_MapOfInter &
	:rtype: None
") Initialize;
		void Initialize (const BRepClass3d_MapOfInter & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Standard_Address &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepClass3d_DataMapNodeOfMapOfInter;
		 BRepClass3d_DataMapNodeOfMapOfInter (const TopoDS_Shape & K,const Standard_Address & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
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
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") BRepClass3d_Intersector3d;
		 BRepClass3d_Intersector3d ();
		%feature("autodoc", "	* Perform the intersection between the segment L(0) ... L(Prm) and the Shape <Sh>.  Only the point with the smallest parameter on the line is returned.  The Tolerance <Tol> is used to determine if the first point of the segment is near the face. In that case, the parameter of the intersection point on the line can be a negative value (greater than -Tol).

	:param L:
	:type L: gp_Lin
	:param Prm:
	:type Prm: float
	:param Tol:
	:type Tol: float
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Perform;
		void Perform (const gp_Lin & L,const Standard_Real Prm,const Standard_Real Tol,const TopoDS_Face & F);
		%feature("autodoc", "	* True is returned when the intersection have been computed.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* True is returned if a point has been found.

	:rtype: bool
") HasAPoint;
		Standard_Boolean HasAPoint ();
		%feature("autodoc", "	* Returns the U parameter of the intersection point on the surface.

	:rtype: float
") UParameter;
		Standard_Real UParameter ();
		%feature("autodoc", "	* Returns the V parameter of the intersection point on the surface.

	:rtype: float
") VParameter;
		Standard_Real VParameter ();
		%feature("autodoc", "	* Returns the parameter of the intersection point on the line.

	:rtype: float
") WParameter;
		Standard_Real WParameter ();
		%feature("autodoc", "	* Returns the geometric point of the intersection between the line and the surface.

	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt ();
		%feature("autodoc", "	* Returns the transition of the line on the surface.

	:rtype: IntCurveSurface_TransitionOnCurve
") Transition;
		IntCurveSurface_TransitionOnCurve Transition ();
		%feature("autodoc", "	* Returns the state of the point on the face. The values can be either TopAbs_IN ( the point is in the face) or TopAbs_ON ( the point is on a boudary of the face).

	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("autodoc", "	* Returns the significant face used to determine the intersection.

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") BRepClass3d_MapOfInter;
		 BRepClass3d_MapOfInter (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: BRepClass3d_MapOfInter &
	:rtype: BRepClass3d_MapOfInter
") Assign;
		BRepClass3d_MapOfInter & Assign (const BRepClass3d_MapOfInter & Other);
		%feature("autodoc", "	:param Other:
	:type Other: BRepClass3d_MapOfInter &
	:rtype: BRepClass3d_MapOfInter
") operator=;
		BRepClass3d_MapOfInter & operator = (const BRepClass3d_MapOfInter & Other);
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
	:type I: Standard_Address &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Standard_Address & I);
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
	:rtype: Standard_Address
") Find;
		const Standard_Address & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind;
		Standard_Address & ChangeFind (const TopoDS_Shape & K);
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
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") BRepClass3d_SClassifier;
		 BRepClass3d_SClassifier ();
		%feature("autodoc", "	* Constructor to classify the point P with the tolerance Tol on the solid S.

	:param S:
	:type S: BRepClass3d_SolidExplorer &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: None
") BRepClass3d_SClassifier;
		 BRepClass3d_SClassifier (BRepClass3d_SolidExplorer & S,const gp_Pnt & P,const Standard_Real Tol);
		%feature("autodoc", "	* Classify the point P with the tolerance Tol on the solid S.

	:param S:
	:type S: BRepClass3d_SolidExplorer &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (BRepClass3d_SolidExplorer & S,const gp_Pnt & P,const Standard_Real Tol);
		%feature("autodoc", "	* Classify an infinite point with the tolerance Tol on the solid S.

	:param S:
	:type S: BRepClass3d_SolidExplorer &
	:param Tol:
	:type Tol: float
	:rtype: None
") PerformInfinitePoint;
		void PerformInfinitePoint (BRepClass3d_SolidExplorer & S,const Standard_Real Tol);
		%feature("autodoc", "	* Returns True if the classification has been computed by rejection. The State is then OUT.

	:rtype: bool
") Rejected;
		Standard_Boolean Rejected ();
		%feature("autodoc", "	* Returns the result of the classification.

	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("autodoc", "	* Returns True when the point is a point of a face.

	:rtype: bool
") IsOnAFace;
		Standard_Boolean IsOnAFace ();
		%feature("autodoc", "	* Returns the face used to determine the classification. When the state is ON, this is the face containing the point.  When Rejected() returns True, Face() has no signification.

	:rtype: TopoDS_Face
") Face;
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
		%feature("autodoc", "	:rtype: None
") BRepClass3d_SolidExplorer;
		 BRepClass3d_SolidExplorer ();
		%feature("autodoc", "	* Raise if called.

	:param Oth:
	:type Oth: BRepClass3d_SolidExplorer &
	:rtype: None
") BRepClass3d_SolidExplorer;
		 BRepClass3d_SolidExplorer (const BRepClass3d_SolidExplorer & Oth);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") BRepClass3d_SolidExplorer;
		 BRepClass3d_SolidExplorer (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") InitShape;
		void InitShape (const TopoDS_Shape & S);
		%feature("autodoc", "	* Should return True if P outside of bounding vol. of the shape

	:param P:
	:type P: gp_Pnt
	:rtype: bool
") Reject;
		virtual Standard_Boolean Reject (const gp_Pnt & P);
		%feature("autodoc", "	* compute a point P in the face F. Param is a Real in  ]0,1[ and is used to initialise the algorithm. For  different values , different points are returned.

	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt
	:param Param:
	:type Param: float &
	:rtype: bool
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:param Param:
	:type Param: float &
	:rtype: bool
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:param Param:
	:type Param: float &
	:param theVecD1U:
	:type theVecD1U: gp_Vec
	:param theVecD1V:
	:type theVecD1V: gp_Vec
	:rtype: bool
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Vec & theVecD1U,gp_Vec & theVecD1V);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:rtype: bool
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt
	:rtype: bool
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,gp_Pnt & P);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:rtype: bool
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:param Param:
	:type Param: float &
	:param Index:
	:type Index: Standard_Integer &
	:rtype: bool
") PointInTheFace;
		Standard_Boolean PointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:param Param:
	:type Param: float &
	:param Index:
	:type Index: Standard_Integer &
	:param surf:
	:type surf: Handle_BRepAdaptor_HSurface &
	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:rtype: bool
") PointInTheFace;
		Standard_Boolean PointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,const Handle_BRepAdaptor_HSurface & surf,const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2);
		%feature("autodoc", "	* <Index> gives point index to search from and returns point index of succeseful search

	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:param Param:
	:type Param: float &
	:param Index:
	:type Index: Standard_Integer &
	:param surf:
	:type surf: Handle_BRepAdaptor_HSurface &
	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param theVecD1U:
	:type theVecD1U: gp_Vec
	:param theVecD1V:
	:type theVecD1V: gp_Vec
	:rtype: bool
") PointInTheFace;
		Standard_Boolean PointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,const Handle_BRepAdaptor_HSurface & surf,const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec & theVecD1U,gp_Vec & theVecD1V);
		%feature("autodoc", "	* Starts an exploration of the shells.

	:rtype: None
") InitShell;
		void InitShell ();
		%feature("autodoc", "	* Returns True if there is a current shell.

	:rtype: bool
") MoreShell;
		Standard_Boolean MoreShell ();
		%feature("autodoc", "	* Sets the explorer to the next shell.

	:rtype: None
") NextShell;
		void NextShell ();
		%feature("autodoc", "	* Returns the current shell.

	:rtype: TopoDS_Shell
") CurrentShell;
		TopoDS_Shell CurrentShell ();
		%feature("autodoc", "	* Returns True if the Shell is rejected.

	:param L:
	:type L: gp_Lin
	:rtype: bool
") RejectShell;
		virtual Standard_Boolean RejectShell (const gp_Lin & L);
		%feature("autodoc", "	* Starts an exploration of the faces of the current shell.

	:rtype: None
") InitFace;
		void InitFace ();
		%feature("autodoc", "	* Returns True if current face in current shell.

	:rtype: bool
") MoreFace;
		Standard_Boolean MoreFace ();
		%feature("autodoc", "	* Sets the explorer to the next Face of the current shell.

	:rtype: None
") NextFace;
		void NextFace ();
		%feature("autodoc", "	* Returns the current face.

	:rtype: TopoDS_Face
") CurrentFace;
		TopoDS_Face CurrentFace ();
		%feature("autodoc", "	* returns True if the face is rejected.

	:param L:
	:type L: gp_Lin
	:rtype: bool
") RejectFace;
		virtual Standard_Boolean RejectFace (const gp_Lin & L);
		%feature("autodoc", "	* Returns in <L>, <Par> a segment having at least one intersection with the shape boundary to compute intersections.

	:param P:
	:type P: gp_Pnt
	:param L:
	:type L: gp_Lin
	:param Par:
	:type Par: float &
	:rtype: int
") Segment;
		Standard_Integer Segment (const gp_Pnt & P,gp_Lin & L,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns in <L>, <Par> a segment having at least one intersection with the shape boundary to compute intersections.  The First Call to this method returns a line which point to a point of the first face of the shape. The Second Call provide a line to the second face and so on.

	:param P:
	:type P: gp_Pnt
	:param L:
	:type L: gp_Lin
	:param Par:
	:type Par: float &
	:rtype: int
") OtherSegment;
		Standard_Integer OtherSegment (const gp_Pnt & P,gp_Lin & L,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the index of face for which last segment is calculated.

	:rtype: int
") GetFaceSegmentIndex;
		Standard_Integer GetFaceSegmentIndex ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param L:
	:type L: gp_Lin
	:param Par:
	:type Par: float
	:param S:
	:type S: TopAbs_State
	:rtype: void
") DumpSegment;
		virtual void DumpSegment (const gp_Pnt & P,const gp_Lin & L,const Standard_Real Par,const TopAbs_State S);
		%feature("autodoc", "	:rtype: Bnd_Box
") Box;
		const Bnd_Box & Box ();
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: IntCurvesFace_Intersector
") Intersector;
		IntCurvesFace_Intersector & Intersector (const TopoDS_Face & F);
		%feature("autodoc", "	:rtype: None
") Destroy;
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
		%feature("autodoc", "	:rtype: None
") BRepClass3d_SolidPassiveClassifier;
		 BRepClass3d_SolidPassiveClassifier ();
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Reset;
		void Reset (const gp_Lin & L,const Standard_Real P,const Standard_Real Tol);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None
") Compare;
		void Compare (const TopoDS_Face & F,const TopAbs_Orientation Or);
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "	:rtype: bool
") HasIntersection;
		Standard_Boolean HasIntersection ();
		%feature("autodoc", "	:rtype: BRepClass3d_Intersector3d
") Intersector;
		BRepClass3d_Intersector3d & Intersector ();
		%feature("autodoc", "	:rtype: TopAbs_State
") State;
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
		%feature("autodoc", "	* empty constructor

	:rtype: None
") BRepClass3d_SolidClassifier;
		 BRepClass3d_SolidClassifier ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Load;
		void Load (const TopoDS_Shape & S);
		%feature("autodoc", "	* Constructor from a Shape.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") BRepClass3d_SolidClassifier;
		 BRepClass3d_SolidClassifier (const TopoDS_Shape & S);
		%feature("autodoc", "	* Constructor to classify the point P with the tolerance Tol on the solid S.

	:param S:
	:type S: TopoDS_Shape &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: None
") BRepClass3d_SolidClassifier;
		 BRepClass3d_SolidClassifier (const TopoDS_Shape & S,const gp_Pnt & P,const Standard_Real Tol);
		%feature("autodoc", "	* Classify the point P with the tolerance Tol on the solid S.

	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const Standard_Real Tol);
		%feature("autodoc", "	* Classify an infinite point with the tolerance Tol on the solid S. Useful for compute the orientation of a solid.

	:param Tol:
	:type Tol: float
	:rtype: None
") PerformInfinitePoint;
		void PerformInfinitePoint (const Standard_Real Tol);
		%feature("autodoc", "	:rtype: None
") Destroy;
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
