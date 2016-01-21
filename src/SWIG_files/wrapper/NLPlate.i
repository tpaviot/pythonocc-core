/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") NLPlate

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

%pythoncode {
import OCC.GarbageCollector
};

%include NLPlate_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor NLPlate_HGPPConstraint;
class NLPlate_HGPPConstraint : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") SetUVFreeSliding;
		%feature("autodoc", "	:param UVFree:
	:type UVFree: bool
	:rtype: void
") SetUVFreeSliding;
		virtual void SetUVFreeSliding (const Standard_Boolean UVFree);
		%feature("compactdefaultargs") SetIncrementalLoadAllowed;
		%feature("autodoc", "	:param ILA:
	:type ILA: bool
	:rtype: void
") SetIncrementalLoadAllowed;
		virtual void SetIncrementalLoadAllowed (const Standard_Boolean ILA);
		%feature("compactdefaultargs") SetActiveOrder;
		%feature("autodoc", "	:param ActiveOrder:
	:type ActiveOrder: int
	:rtype: void
") SetActiveOrder;
		virtual void SetActiveOrder (const Standard_Integer ActiveOrder);
		%feature("compactdefaultargs") SetUV;
		%feature("autodoc", "	:param UV:
	:type UV: gp_XY
	:rtype: void
") SetUV;
		virtual void SetUV (const gp_XY & UV);
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	:param Orient: default value is 0
	:type Orient: int
	:rtype: void
") SetOrientation;
		virtual void SetOrientation (const Standard_Integer Orient = 0);
		%feature("compactdefaultargs") SetG0Criterion;
		%feature("autodoc", "	:param TolDist:
	:type TolDist: float
	:rtype: void
") SetG0Criterion;
		virtual void SetG0Criterion (const Standard_Real TolDist);
		%feature("compactdefaultargs") SetG1Criterion;
		%feature("autodoc", "	:param TolAng:
	:type TolAng: float
	:rtype: void
") SetG1Criterion;
		virtual void SetG1Criterion (const Standard_Real TolAng);
		%feature("compactdefaultargs") SetG2Criterion;
		%feature("autodoc", "	:param TolCurv:
	:type TolCurv: float
	:rtype: void
") SetG2Criterion;
		virtual void SetG2Criterion (const Standard_Real TolCurv);
		%feature("compactdefaultargs") SetG3Criterion;
		%feature("autodoc", "	:param TolG3:
	:type TolG3: float
	:rtype: void
") SetG3Criterion;
		virtual void SetG3Criterion (const Standard_Real TolG3);
		%feature("compactdefaultargs") UVFreeSliding;
		%feature("autodoc", "	:rtype: bool
") UVFreeSliding;
		virtual Standard_Boolean UVFreeSliding ();
		%feature("compactdefaultargs") IncrementalLoadAllowed;
		%feature("autodoc", "	:rtype: bool
") IncrementalLoadAllowed;
		virtual Standard_Boolean IncrementalLoadAllowed ();
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "	:rtype: int
") ActiveOrder;
		virtual Standard_Integer ActiveOrder ();
		%feature("compactdefaultargs") UV;
		%feature("autodoc", "	:rtype: gp_XY
") UV;
		virtual const gp_XY  UV ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: int
") Orientation;
		virtual Standard_Integer Orientation ();
		%feature("compactdefaultargs") IsG0;
		%feature("autodoc", "	:rtype: bool
") IsG0;
		virtual Standard_Boolean IsG0 ();
		%feature("compactdefaultargs") G0Target;
		%feature("autodoc", "	:rtype: gp_XYZ
") G0Target;
		virtual const gp_XYZ  G0Target ();
		%feature("compactdefaultargs") G1Target;
		%feature("autodoc", "	:rtype: Plate_D1
") G1Target;
		virtual const Plate_D1 & G1Target ();
		%feature("compactdefaultargs") G2Target;
		%feature("autodoc", "	:rtype: Plate_D2
") G2Target;
		virtual const Plate_D2 & G2Target ();
		%feature("compactdefaultargs") G3Target;
		%feature("autodoc", "	:rtype: Plate_D3
") G3Target;
		virtual const Plate_D3 & G3Target ();
		%feature("compactdefaultargs") G0Criterion;
		%feature("autodoc", "	:rtype: float
") G0Criterion;
		virtual Standard_Real G0Criterion ();
		%feature("compactdefaultargs") G1Criterion;
		%feature("autodoc", "	:rtype: float
") G1Criterion;
		virtual Standard_Real G1Criterion ();
		%feature("compactdefaultargs") G2Criterion;
		%feature("autodoc", "	:rtype: float
") G2Criterion;
		virtual Standard_Real G2Criterion ();
		%feature("compactdefaultargs") G3Criterion;
		%feature("autodoc", "	:rtype: float
") G3Criterion;
		virtual Standard_Real G3Criterion ();
};


%feature("shadow") NLPlate_HGPPConstraint::~NLPlate_HGPPConstraint %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend NLPlate_HGPPConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend NLPlate_HGPPConstraint {
	Handle_NLPlate_HGPPConstraint GetHandle() {
	return *(Handle_NLPlate_HGPPConstraint*) &$self;
	}
};

%nodefaultctor Handle_NLPlate_HGPPConstraint;
class Handle_NLPlate_HGPPConstraint : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_NLPlate_HGPPConstraint();
        Handle_NLPlate_HGPPConstraint(const Handle_NLPlate_HGPPConstraint &aHandle);
        Handle_NLPlate_HGPPConstraint(const NLPlate_HGPPConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NLPlate_HGPPConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NLPlate_HGPPConstraint {
    NLPlate_HGPPConstraint* GetObject() {
    return (NLPlate_HGPPConstraint*)$self->Access();
    }
};
%feature("shadow") Handle_NLPlate_HGPPConstraint::~Handle_NLPlate_HGPPConstraint %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_NLPlate_HGPPConstraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor NLPlate_NLPlate;
class NLPlate_NLPlate {
	public:
		%feature("compactdefaultargs") NLPlate_NLPlate;
		%feature("autodoc", "	:param InitialSurface:
	:type InitialSurface: Handle_Geom_Surface &
	:rtype: None
") NLPlate_NLPlate;
		 NLPlate_NLPlate (const Handle_Geom_Surface & InitialSurface);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param GConst:
	:type GConst: Handle_NLPlate_HGPPConstraint &
	:rtype: None
") Load;
		void Load (const Handle_NLPlate_HGPPConstraint & GConst);
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "	:param ord: default value is 2
	:type ord: int
	:param InitialConsraintOrder: default value is 1
	:type InitialConsraintOrder: int
	:rtype: None
") Solve;
		void Solve (const Standard_Integer ord = 2,const Standard_Integer InitialConsraintOrder = 1);
		%feature("compactdefaultargs") Solve2;
		%feature("autodoc", "	:param ord: default value is 2
	:type ord: int
	:param InitialConsraintOrder: default value is 1
	:type InitialConsraintOrder: int
	:rtype: None
") Solve2;
		void Solve2 (const Standard_Integer ord = 2,const Standard_Integer InitialConsraintOrder = 1);
		%feature("compactdefaultargs") IncrementalSolve;
		%feature("autodoc", "	:param ord: default value is 2
	:type ord: int
	:param InitialConsraintOrder: default value is 1
	:type InitialConsraintOrder: int
	:param NbIncrements: default value is 4
	:type NbIncrements: int
	:param UVSliding: default value is Standard_False
	:type UVSliding: bool
	:rtype: None
") IncrementalSolve;
		void IncrementalSolve (const Standard_Integer ord = 2,const Standard_Integer InitialConsraintOrder = 1,const Standard_Integer NbIncrements = 4,const Standard_Boolean UVSliding = Standard_False);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns True if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") destroy;
		%feature("autodoc", "	:rtype: None
") destroy;
		void destroy ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* reset the Plate in the initial state ( same as after Create((Surface))

	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:rtype: gp_XYZ
") Evaluate;
		gp_XYZ Evaluate (const gp_XY & point2d);
		%feature("compactdefaultargs") EvaluateDerivative;
		%feature("autodoc", "	:param point2d:
	:type point2d: gp_XY
	:param iu:
	:type iu: int
	:param iv:
	:type iv: int
	:rtype: gp_XYZ
") EvaluateDerivative;
		gp_XYZ EvaluateDerivative (const gp_XY & point2d,const Standard_Integer iu,const Standard_Integer iv);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: int
") Continuity;
		Standard_Integer Continuity ();
		%feature("compactdefaultargs") ConstraintsSliding;
		%feature("autodoc", "	:param NbIterations: default value is 3
	:type NbIterations: int
	:rtype: None
") ConstraintsSliding;
		void ConstraintsSliding (const Standard_Integer NbIterations = 3);
		%feature("compactdefaultargs") MaxActiveConstraintOrder;
		%feature("autodoc", "	:rtype: int
") MaxActiveConstraintOrder;
		Standard_Integer MaxActiveConstraintOrder ();
};


%feature("shadow") NLPlate_NLPlate::~NLPlate_NLPlate %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend NLPlate_NLPlate {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor NLPlate_SequenceNodeOfSequenceOfHGPPConstraint;
class NLPlate_SequenceNodeOfSequenceOfHGPPConstraint : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") NLPlate_SequenceNodeOfSequenceOfHGPPConstraint;
		%feature("autodoc", "	:param I:
	:type I: Handle_NLPlate_HGPPConstraint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") NLPlate_SequenceNodeOfSequenceOfHGPPConstraint;
		 NLPlate_SequenceNodeOfSequenceOfHGPPConstraint (const Handle_NLPlate_HGPPConstraint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_NLPlate_HGPPConstraint
") Value;
		Handle_NLPlate_HGPPConstraint & Value ();
};


%feature("shadow") NLPlate_SequenceNodeOfSequenceOfHGPPConstraint::~NLPlate_SequenceNodeOfSequenceOfHGPPConstraint %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend NLPlate_SequenceNodeOfSequenceOfHGPPConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend NLPlate_SequenceNodeOfSequenceOfHGPPConstraint {
	Handle_NLPlate_SequenceNodeOfSequenceOfHGPPConstraint GetHandle() {
	return *(Handle_NLPlate_SequenceNodeOfSequenceOfHGPPConstraint*) &$self;
	}
};

%nodefaultctor Handle_NLPlate_SequenceNodeOfSequenceOfHGPPConstraint;
class Handle_NLPlate_SequenceNodeOfSequenceOfHGPPConstraint : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_NLPlate_SequenceNodeOfSequenceOfHGPPConstraint();
        Handle_NLPlate_SequenceNodeOfSequenceOfHGPPConstraint(const Handle_NLPlate_SequenceNodeOfSequenceOfHGPPConstraint &aHandle);
        Handle_NLPlate_SequenceNodeOfSequenceOfHGPPConstraint(const NLPlate_SequenceNodeOfSequenceOfHGPPConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NLPlate_SequenceNodeOfSequenceOfHGPPConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NLPlate_SequenceNodeOfSequenceOfHGPPConstraint {
    NLPlate_SequenceNodeOfSequenceOfHGPPConstraint* GetObject() {
    return (NLPlate_SequenceNodeOfSequenceOfHGPPConstraint*)$self->Access();
    }
};
%feature("shadow") Handle_NLPlate_SequenceNodeOfSequenceOfHGPPConstraint::~Handle_NLPlate_SequenceNodeOfSequenceOfHGPPConstraint %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_NLPlate_SequenceNodeOfSequenceOfHGPPConstraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor NLPlate_SequenceOfHGPPConstraint;
class NLPlate_SequenceOfHGPPConstraint : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") NLPlate_SequenceOfHGPPConstraint;
		%feature("autodoc", "	:rtype: None
") NLPlate_SequenceOfHGPPConstraint;
		 NLPlate_SequenceOfHGPPConstraint ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: NLPlate_SequenceOfHGPPConstraint &
	:rtype: NLPlate_SequenceOfHGPPConstraint
") Assign;
		const NLPlate_SequenceOfHGPPConstraint & Assign (const NLPlate_SequenceOfHGPPConstraint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: NLPlate_SequenceOfHGPPConstraint &
	:rtype: NLPlate_SequenceOfHGPPConstraint
") operator=;
		const NLPlate_SequenceOfHGPPConstraint & operator = (const NLPlate_SequenceOfHGPPConstraint & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_NLPlate_HGPPConstraint &
	:rtype: None
") Append;
		void Append (const Handle_NLPlate_HGPPConstraint & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: NLPlate_SequenceOfHGPPConstraint &
	:rtype: None
") Append;
		void Append (NLPlate_SequenceOfHGPPConstraint & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_NLPlate_HGPPConstraint &
	:rtype: None
") Prepend;
		void Prepend (const Handle_NLPlate_HGPPConstraint & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: NLPlate_SequenceOfHGPPConstraint &
	:rtype: None
") Prepend;
		void Prepend (NLPlate_SequenceOfHGPPConstraint & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_NLPlate_HGPPConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_NLPlate_HGPPConstraint & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: NLPlate_SequenceOfHGPPConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,NLPlate_SequenceOfHGPPConstraint & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_NLPlate_HGPPConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_NLPlate_HGPPConstraint & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: NLPlate_SequenceOfHGPPConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,NLPlate_SequenceOfHGPPConstraint & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_NLPlate_HGPPConstraint
") First;
		const Handle_NLPlate_HGPPConstraint & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_NLPlate_HGPPConstraint
") Last;
		const Handle_NLPlate_HGPPConstraint & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: NLPlate_SequenceOfHGPPConstraint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,NLPlate_SequenceOfHGPPConstraint & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_NLPlate_HGPPConstraint
") Value;
		const Handle_NLPlate_HGPPConstraint & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_NLPlate_HGPPConstraint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_NLPlate_HGPPConstraint & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_NLPlate_HGPPConstraint
") ChangeValue;
		Handle_NLPlate_HGPPConstraint & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") NLPlate_SequenceOfHGPPConstraint::~NLPlate_SequenceOfHGPPConstraint %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend NLPlate_SequenceOfHGPPConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor NLPlate_StackIteratorOfStackOfPlate;
class NLPlate_StackIteratorOfStackOfPlate {
	public:
		%feature("compactdefaultargs") NLPlate_StackIteratorOfStackOfPlate;
		%feature("autodoc", "	:rtype: None
") NLPlate_StackIteratorOfStackOfPlate;
		 NLPlate_StackIteratorOfStackOfPlate ();
		%feature("compactdefaultargs") NLPlate_StackIteratorOfStackOfPlate;
		%feature("autodoc", "	:param S:
	:type S: NLPlate_StackOfPlate &
	:rtype: None
") NLPlate_StackIteratorOfStackOfPlate;
		 NLPlate_StackIteratorOfStackOfPlate (const NLPlate_StackOfPlate & S);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: NLPlate_StackOfPlate &
	:rtype: None
") Initialize;
		void Initialize (const NLPlate_StackOfPlate & S);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Plate_Plate
") Value;
		const Plate_Plate & Value ();
};


%feature("shadow") NLPlate_StackIteratorOfStackOfPlate::~NLPlate_StackIteratorOfStackOfPlate %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend NLPlate_StackIteratorOfStackOfPlate {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor NLPlate_StackNodeOfStackOfPlate;
class NLPlate_StackNodeOfStackOfPlate : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") NLPlate_StackNodeOfStackOfPlate;
		%feature("autodoc", "	:param I:
	:type I: Plate_Plate &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") NLPlate_StackNodeOfStackOfPlate;
		 NLPlate_StackNodeOfStackOfPlate (const Plate_Plate & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Plate_Plate
") Value;
		Plate_Plate & Value ();
};


%feature("shadow") NLPlate_StackNodeOfStackOfPlate::~NLPlate_StackNodeOfStackOfPlate %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend NLPlate_StackNodeOfStackOfPlate {
	void _kill_pointed() {
		delete $self;
	}
};
%extend NLPlate_StackNodeOfStackOfPlate {
	Handle_NLPlate_StackNodeOfStackOfPlate GetHandle() {
	return *(Handle_NLPlate_StackNodeOfStackOfPlate*) &$self;
	}
};

%nodefaultctor Handle_NLPlate_StackNodeOfStackOfPlate;
class Handle_NLPlate_StackNodeOfStackOfPlate : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_NLPlate_StackNodeOfStackOfPlate();
        Handle_NLPlate_StackNodeOfStackOfPlate(const Handle_NLPlate_StackNodeOfStackOfPlate &aHandle);
        Handle_NLPlate_StackNodeOfStackOfPlate(const NLPlate_StackNodeOfStackOfPlate *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NLPlate_StackNodeOfStackOfPlate DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NLPlate_StackNodeOfStackOfPlate {
    NLPlate_StackNodeOfStackOfPlate* GetObject() {
    return (NLPlate_StackNodeOfStackOfPlate*)$self->Access();
    }
};
%feature("shadow") Handle_NLPlate_StackNodeOfStackOfPlate::~Handle_NLPlate_StackNodeOfStackOfPlate %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_NLPlate_StackNodeOfStackOfPlate {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor NLPlate_StackOfPlate;
class NLPlate_StackOfPlate {
	public:
		%feature("compactdefaultargs") NLPlate_StackOfPlate;
		%feature("autodoc", "	:rtype: None
") NLPlate_StackOfPlate;
		 NLPlate_StackOfPlate ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: NLPlate_StackOfPlate &
	:rtype: NLPlate_StackOfPlate
") Assign;
		const NLPlate_StackOfPlate & Assign (const NLPlate_StackOfPlate & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: NLPlate_StackOfPlate &
	:rtype: NLPlate_StackOfPlate
") operator=;
		const NLPlate_StackOfPlate & operator = (const NLPlate_StackOfPlate & Other);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	:rtype: int
") Depth;
		Standard_Integer Depth ();
		%feature("compactdefaultargs") Top;
		%feature("autodoc", "	:rtype: Plate_Plate
") Top;
		const Plate_Plate & Top ();
		%feature("compactdefaultargs") Push;
		%feature("autodoc", "	:param I:
	:type I: Plate_Plate &
	:rtype: None
") Push;
		void Push (const Plate_Plate & I);
		%feature("compactdefaultargs") Pop;
		%feature("autodoc", "	:rtype: None
") Pop;
		void Pop ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") ChangeTop;
		%feature("autodoc", "	:rtype: Plate_Plate
") ChangeTop;
		Plate_Plate & ChangeTop ();
};


%feature("shadow") NLPlate_StackOfPlate::~NLPlate_StackOfPlate %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend NLPlate_StackOfPlate {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor NLPlate_HPG0Constraint;
class NLPlate_HPG0Constraint : public NLPlate_HGPPConstraint {
	public:
		%feature("compactdefaultargs") NLPlate_HPG0Constraint;
		%feature("autodoc", "	:param UV:
	:type UV: gp_XY
	:param Value:
	:type Value: gp_XYZ
	:rtype: None
") NLPlate_HPG0Constraint;
		 NLPlate_HPG0Constraint (const gp_XY & UV,const gp_XYZ & Value);
		%feature("compactdefaultargs") SetUVFreeSliding;
		%feature("autodoc", "	:param UVFree:
	:type UVFree: bool
	:rtype: void
") SetUVFreeSliding;
		virtual void SetUVFreeSliding (const Standard_Boolean UVFree);
		%feature("compactdefaultargs") SetIncrementalLoadAllowed;
		%feature("autodoc", "	:param ILA:
	:type ILA: bool
	:rtype: void
") SetIncrementalLoadAllowed;
		virtual void SetIncrementalLoadAllowed (const Standard_Boolean ILA);
		%feature("compactdefaultargs") UVFreeSliding;
		%feature("autodoc", "	:rtype: bool
") UVFreeSliding;
		virtual Standard_Boolean UVFreeSliding ();
		%feature("compactdefaultargs") IncrementalLoadAllowed;
		%feature("autodoc", "	:rtype: bool
") IncrementalLoadAllowed;
		virtual Standard_Boolean IncrementalLoadAllowed ();
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "	:rtype: int
") ActiveOrder;
		virtual Standard_Integer ActiveOrder ();
		%feature("compactdefaultargs") IsG0;
		%feature("autodoc", "	:rtype: bool
") IsG0;
		virtual Standard_Boolean IsG0 ();
		%feature("compactdefaultargs") G0Target;
		%feature("autodoc", "	:rtype: gp_XYZ
") G0Target;
		virtual const gp_XYZ  G0Target ();
};


%feature("shadow") NLPlate_HPG0Constraint::~NLPlate_HPG0Constraint %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend NLPlate_HPG0Constraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend NLPlate_HPG0Constraint {
	Handle_NLPlate_HPG0Constraint GetHandle() {
	return *(Handle_NLPlate_HPG0Constraint*) &$self;
	}
};

%nodefaultctor Handle_NLPlate_HPG0Constraint;
class Handle_NLPlate_HPG0Constraint : public Handle_NLPlate_HGPPConstraint {

    public:
        // constructors
        Handle_NLPlate_HPG0Constraint();
        Handle_NLPlate_HPG0Constraint(const Handle_NLPlate_HPG0Constraint &aHandle);
        Handle_NLPlate_HPG0Constraint(const NLPlate_HPG0Constraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NLPlate_HPG0Constraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NLPlate_HPG0Constraint {
    NLPlate_HPG0Constraint* GetObject() {
    return (NLPlate_HPG0Constraint*)$self->Access();
    }
};
%feature("shadow") Handle_NLPlate_HPG0Constraint::~Handle_NLPlate_HPG0Constraint %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_NLPlate_HPG0Constraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor NLPlate_HPG1Constraint;
class NLPlate_HPG1Constraint : public NLPlate_HGPPConstraint {
	public:
		%feature("compactdefaultargs") NLPlate_HPG1Constraint;
		%feature("autodoc", "	:param UV:
	:type UV: gp_XY
	:param D1T:
	:type D1T: Plate_D1 &
	:rtype: None
") NLPlate_HPG1Constraint;
		 NLPlate_HPG1Constraint (const gp_XY & UV,const Plate_D1 & D1T);
		%feature("compactdefaultargs") SetIncrementalLoadAllowed;
		%feature("autodoc", "	:param ILA:
	:type ILA: bool
	:rtype: void
") SetIncrementalLoadAllowed;
		virtual void SetIncrementalLoadAllowed (const Standard_Boolean ILA);
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	:param Orient: default value is 0
	:type Orient: int
	:rtype: void
") SetOrientation;
		virtual void SetOrientation (const Standard_Integer Orient = 0);
		%feature("compactdefaultargs") IncrementalLoadAllowed;
		%feature("autodoc", "	:rtype: bool
") IncrementalLoadAllowed;
		virtual Standard_Boolean IncrementalLoadAllowed ();
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "	:rtype: int
") ActiveOrder;
		virtual Standard_Integer ActiveOrder ();
		%feature("compactdefaultargs") IsG0;
		%feature("autodoc", "	:rtype: bool
") IsG0;
		virtual Standard_Boolean IsG0 ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: int
") Orientation;
		virtual Standard_Integer Orientation ();
		%feature("compactdefaultargs") G1Target;
		%feature("autodoc", "	:rtype: Plate_D1
") G1Target;
		virtual const Plate_D1 & G1Target ();
};


%feature("shadow") NLPlate_HPG1Constraint::~NLPlate_HPG1Constraint %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend NLPlate_HPG1Constraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend NLPlate_HPG1Constraint {
	Handle_NLPlate_HPG1Constraint GetHandle() {
	return *(Handle_NLPlate_HPG1Constraint*) &$self;
	}
};

%nodefaultctor Handle_NLPlate_HPG1Constraint;
class Handle_NLPlate_HPG1Constraint : public Handle_NLPlate_HGPPConstraint {

    public:
        // constructors
        Handle_NLPlate_HPG1Constraint();
        Handle_NLPlate_HPG1Constraint(const Handle_NLPlate_HPG1Constraint &aHandle);
        Handle_NLPlate_HPG1Constraint(const NLPlate_HPG1Constraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NLPlate_HPG1Constraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NLPlate_HPG1Constraint {
    NLPlate_HPG1Constraint* GetObject() {
    return (NLPlate_HPG1Constraint*)$self->Access();
    }
};
%feature("shadow") Handle_NLPlate_HPG1Constraint::~Handle_NLPlate_HPG1Constraint %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_NLPlate_HPG1Constraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor NLPlate_HPG0G1Constraint;
class NLPlate_HPG0G1Constraint : public NLPlate_HPG0Constraint {
	public:
		%feature("compactdefaultargs") NLPlate_HPG0G1Constraint;
		%feature("autodoc", "	:param UV:
	:type UV: gp_XY
	:param Value:
	:type Value: gp_XYZ
	:param D1T:
	:type D1T: Plate_D1 &
	:rtype: None
") NLPlate_HPG0G1Constraint;
		 NLPlate_HPG0G1Constraint (const gp_XY & UV,const gp_XYZ & Value,const Plate_D1 & D1T);
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	:param Orient: default value is 0
	:type Orient: int
	:rtype: void
") SetOrientation;
		virtual void SetOrientation (const Standard_Integer Orient = 0);
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "	:rtype: int
") ActiveOrder;
		virtual Standard_Integer ActiveOrder ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: int
") Orientation;
		virtual Standard_Integer Orientation ();
		%feature("compactdefaultargs") G1Target;
		%feature("autodoc", "	:rtype: Plate_D1
") G1Target;
		virtual const Plate_D1 & G1Target ();
};


%feature("shadow") NLPlate_HPG0G1Constraint::~NLPlate_HPG0G1Constraint %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend NLPlate_HPG0G1Constraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend NLPlate_HPG0G1Constraint {
	Handle_NLPlate_HPG0G1Constraint GetHandle() {
	return *(Handle_NLPlate_HPG0G1Constraint*) &$self;
	}
};

%nodefaultctor Handle_NLPlate_HPG0G1Constraint;
class Handle_NLPlate_HPG0G1Constraint : public Handle_NLPlate_HPG0Constraint {

    public:
        // constructors
        Handle_NLPlate_HPG0G1Constraint();
        Handle_NLPlate_HPG0G1Constraint(const Handle_NLPlate_HPG0G1Constraint &aHandle);
        Handle_NLPlate_HPG0G1Constraint(const NLPlate_HPG0G1Constraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NLPlate_HPG0G1Constraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NLPlate_HPG0G1Constraint {
    NLPlate_HPG0G1Constraint* GetObject() {
    return (NLPlate_HPG0G1Constraint*)$self->Access();
    }
};
%feature("shadow") Handle_NLPlate_HPG0G1Constraint::~Handle_NLPlate_HPG0G1Constraint %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_NLPlate_HPG0G1Constraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor NLPlate_HPG2Constraint;
class NLPlate_HPG2Constraint : public NLPlate_HPG1Constraint {
	public:
		%feature("compactdefaultargs") NLPlate_HPG2Constraint;
		%feature("autodoc", "	:param UV:
	:type UV: gp_XY
	:param D1T:
	:type D1T: Plate_D1 &
	:param D2T:
	:type D2T: Plate_D2 &
	:rtype: None
") NLPlate_HPG2Constraint;
		 NLPlate_HPG2Constraint (const gp_XY & UV,const Plate_D1 & D1T,const Plate_D2 & D2T);
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "	:rtype: int
") ActiveOrder;
		virtual Standard_Integer ActiveOrder ();
		%feature("compactdefaultargs") G2Target;
		%feature("autodoc", "	:rtype: Plate_D2
") G2Target;
		virtual const Plate_D2 & G2Target ();
};


%feature("shadow") NLPlate_HPG2Constraint::~NLPlate_HPG2Constraint %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend NLPlate_HPG2Constraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend NLPlate_HPG2Constraint {
	Handle_NLPlate_HPG2Constraint GetHandle() {
	return *(Handle_NLPlate_HPG2Constraint*) &$self;
	}
};

%nodefaultctor Handle_NLPlate_HPG2Constraint;
class Handle_NLPlate_HPG2Constraint : public Handle_NLPlate_HPG1Constraint {

    public:
        // constructors
        Handle_NLPlate_HPG2Constraint();
        Handle_NLPlate_HPG2Constraint(const Handle_NLPlate_HPG2Constraint &aHandle);
        Handle_NLPlate_HPG2Constraint(const NLPlate_HPG2Constraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NLPlate_HPG2Constraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NLPlate_HPG2Constraint {
    NLPlate_HPG2Constraint* GetObject() {
    return (NLPlate_HPG2Constraint*)$self->Access();
    }
};
%feature("shadow") Handle_NLPlate_HPG2Constraint::~Handle_NLPlate_HPG2Constraint %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_NLPlate_HPG2Constraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor NLPlate_HPG0G2Constraint;
class NLPlate_HPG0G2Constraint : public NLPlate_HPG0G1Constraint {
	public:
		%feature("compactdefaultargs") NLPlate_HPG0G2Constraint;
		%feature("autodoc", "	:param UV:
	:type UV: gp_XY
	:param Value:
	:type Value: gp_XYZ
	:param D1T:
	:type D1T: Plate_D1 &
	:param D2T:
	:type D2T: Plate_D2 &
	:rtype: None
") NLPlate_HPG0G2Constraint;
		 NLPlate_HPG0G2Constraint (const gp_XY & UV,const gp_XYZ & Value,const Plate_D1 & D1T,const Plate_D2 & D2T);
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "	:rtype: int
") ActiveOrder;
		virtual Standard_Integer ActiveOrder ();
		%feature("compactdefaultargs") G2Target;
		%feature("autodoc", "	:rtype: Plate_D2
") G2Target;
		virtual const Plate_D2 & G2Target ();
};


%feature("shadow") NLPlate_HPG0G2Constraint::~NLPlate_HPG0G2Constraint %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend NLPlate_HPG0G2Constraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend NLPlate_HPG0G2Constraint {
	Handle_NLPlate_HPG0G2Constraint GetHandle() {
	return *(Handle_NLPlate_HPG0G2Constraint*) &$self;
	}
};

%nodefaultctor Handle_NLPlate_HPG0G2Constraint;
class Handle_NLPlate_HPG0G2Constraint : public Handle_NLPlate_HPG0G1Constraint {

    public:
        // constructors
        Handle_NLPlate_HPG0G2Constraint();
        Handle_NLPlate_HPG0G2Constraint(const Handle_NLPlate_HPG0G2Constraint &aHandle);
        Handle_NLPlate_HPG0G2Constraint(const NLPlate_HPG0G2Constraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NLPlate_HPG0G2Constraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NLPlate_HPG0G2Constraint {
    NLPlate_HPG0G2Constraint* GetObject() {
    return (NLPlate_HPG0G2Constraint*)$self->Access();
    }
};
%feature("shadow") Handle_NLPlate_HPG0G2Constraint::~Handle_NLPlate_HPG0G2Constraint %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_NLPlate_HPG0G2Constraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor NLPlate_HPG3Constraint;
class NLPlate_HPG3Constraint : public NLPlate_HPG2Constraint {
	public:
		%feature("compactdefaultargs") NLPlate_HPG3Constraint;
		%feature("autodoc", "	:param UV:
	:type UV: gp_XY
	:param D1T:
	:type D1T: Plate_D1 &
	:param D2T:
	:type D2T: Plate_D2 &
	:param D3T:
	:type D3T: Plate_D3 &
	:rtype: None
") NLPlate_HPG3Constraint;
		 NLPlate_HPG3Constraint (const gp_XY & UV,const Plate_D1 & D1T,const Plate_D2 & D2T,const Plate_D3 & D3T);
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "	:rtype: int
") ActiveOrder;
		virtual Standard_Integer ActiveOrder ();
		%feature("compactdefaultargs") G3Target;
		%feature("autodoc", "	:rtype: Plate_D3
") G3Target;
		virtual const Plate_D3 & G3Target ();
};


%feature("shadow") NLPlate_HPG3Constraint::~NLPlate_HPG3Constraint %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend NLPlate_HPG3Constraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend NLPlate_HPG3Constraint {
	Handle_NLPlate_HPG3Constraint GetHandle() {
	return *(Handle_NLPlate_HPG3Constraint*) &$self;
	}
};

%nodefaultctor Handle_NLPlate_HPG3Constraint;
class Handle_NLPlate_HPG3Constraint : public Handle_NLPlate_HPG2Constraint {

    public:
        // constructors
        Handle_NLPlate_HPG3Constraint();
        Handle_NLPlate_HPG3Constraint(const Handle_NLPlate_HPG3Constraint &aHandle);
        Handle_NLPlate_HPG3Constraint(const NLPlate_HPG3Constraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NLPlate_HPG3Constraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NLPlate_HPG3Constraint {
    NLPlate_HPG3Constraint* GetObject() {
    return (NLPlate_HPG3Constraint*)$self->Access();
    }
};
%feature("shadow") Handle_NLPlate_HPG3Constraint::~Handle_NLPlate_HPG3Constraint %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_NLPlate_HPG3Constraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor NLPlate_HPG0G3Constraint;
class NLPlate_HPG0G3Constraint : public NLPlate_HPG0G2Constraint {
	public:
		%feature("compactdefaultargs") NLPlate_HPG0G3Constraint;
		%feature("autodoc", "	:param UV:
	:type UV: gp_XY
	:param Value:
	:type Value: gp_XYZ
	:param D1T:
	:type D1T: Plate_D1 &
	:param D2T:
	:type D2T: Plate_D2 &
	:param D3T:
	:type D3T: Plate_D3 &
	:rtype: None
") NLPlate_HPG0G3Constraint;
		 NLPlate_HPG0G3Constraint (const gp_XY & UV,const gp_XYZ & Value,const Plate_D1 & D1T,const Plate_D2 & D2T,const Plate_D3 & D3T);
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "	:rtype: int
") ActiveOrder;
		virtual Standard_Integer ActiveOrder ();
		%feature("compactdefaultargs") G3Target;
		%feature("autodoc", "	:rtype: Plate_D3
") G3Target;
		virtual const Plate_D3 & G3Target ();
};


%feature("shadow") NLPlate_HPG0G3Constraint::~NLPlate_HPG0G3Constraint %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend NLPlate_HPG0G3Constraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend NLPlate_HPG0G3Constraint {
	Handle_NLPlate_HPG0G3Constraint GetHandle() {
	return *(Handle_NLPlate_HPG0G3Constraint*) &$self;
	}
};

%nodefaultctor Handle_NLPlate_HPG0G3Constraint;
class Handle_NLPlate_HPG0G3Constraint : public Handle_NLPlate_HPG0G2Constraint {

    public:
        // constructors
        Handle_NLPlate_HPG0G3Constraint();
        Handle_NLPlate_HPG0G3Constraint(const Handle_NLPlate_HPG0G3Constraint &aHandle);
        Handle_NLPlate_HPG0G3Constraint(const NLPlate_HPG0G3Constraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_NLPlate_HPG0G3Constraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_NLPlate_HPG0G3Constraint {
    NLPlate_HPG0G3Constraint* GetObject() {
    return (NLPlate_HPG0G3Constraint*)$self->Access();
    }
};
%feature("shadow") Handle_NLPlate_HPG0G3Constraint::~Handle_NLPlate_HPG0G3Constraint %{
def __del__(self):
    try:
        self.thisown = False
        OCC.GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_NLPlate_HPG0G3Constraint {
    void _kill_pointed() {
        delete $self;
    }
};

