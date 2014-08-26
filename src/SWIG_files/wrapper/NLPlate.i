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
%module NLPlate

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

%include NLPlate_required_python_modules.i
%include NLPlate_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor NLPlate_HGPPConstraint;
class NLPlate_HGPPConstraint : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	UVFree(Standard_Boolean)

Returns:
	virtual void

No detailed docstring for this function.") SetUVFreeSliding;
		virtual void SetUVFreeSliding (const Standard_Boolean UVFree);
		%feature("autodoc", "Args:
	ILA(Standard_Boolean)

Returns:
	virtual void

No detailed docstring for this function.") SetIncrementalLoadAllowed;
		virtual void SetIncrementalLoadAllowed (const Standard_Boolean ILA);
		%feature("autodoc", "Args:
	ActiveOrder(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") SetActiveOrder;
		virtual void SetActiveOrder (const Standard_Integer ActiveOrder);
		%feature("autodoc", "Args:
	UV(gp_XY)

Returns:
	virtual void

No detailed docstring for this function.") SetUV;
		virtual void SetUV (const gp_XY & UV);
		%feature("autodoc", "Args:
	Orient(Standard_Integer)=0

Returns:
	virtual void

No detailed docstring for this function.") SetOrientation;
		virtual void SetOrientation (const Standard_Integer Orient = 0);
		%feature("autodoc", "Args:
	TolDist(Standard_Real)

Returns:
	virtual void

No detailed docstring for this function.") SetG0Criterion;
		virtual void SetG0Criterion (const Standard_Real TolDist);
		%feature("autodoc", "Args:
	TolAng(Standard_Real)

Returns:
	virtual void

No detailed docstring for this function.") SetG1Criterion;
		virtual void SetG1Criterion (const Standard_Real TolAng);
		%feature("autodoc", "Args:
	TolCurv(Standard_Real)

Returns:
	virtual void

No detailed docstring for this function.") SetG2Criterion;
		virtual void SetG2Criterion (const Standard_Real TolCurv);
		%feature("autodoc", "Args:
	TolG3(Standard_Real)

Returns:
	virtual void

No detailed docstring for this function.") SetG3Criterion;
		virtual void SetG3Criterion (const Standard_Real TolG3);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") UVFreeSliding;
		virtual Standard_Boolean UVFreeSliding ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IncrementalLoadAllowed;
		virtual Standard_Boolean IncrementalLoadAllowed ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") ActiveOrder;
		virtual Standard_Integer ActiveOrder ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_XY

No detailed docstring for this function.") UV;
		virtual const gp_XY & UV ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") Orientation;
		virtual Standard_Integer Orientation ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsG0;
		virtual Standard_Boolean IsG0 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_XYZ

No detailed docstring for this function.") G0Target;
		virtual const gp_XYZ & G0Target ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Plate_D1

No detailed docstring for this function.") G1Target;
		virtual const Plate_D1 & G1Target ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Plate_D2

No detailed docstring for this function.") G2Target;
		virtual const Plate_D2 & G2Target ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Plate_D3

No detailed docstring for this function.") G3Target;
		virtual const Plate_D3 & G3Target ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") G0Criterion;
		virtual Standard_Real G0Criterion ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") G1Criterion;
		virtual Standard_Real G1Criterion ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") G2Criterion;
		virtual Standard_Real G2Criterion ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") G3Criterion;
		virtual Standard_Real G3Criterion ();
};


%feature("shadow") NLPlate_HGPPConstraint::~NLPlate_HGPPConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	InitialSurface(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") NLPlate_NLPlate;
		 NLPlate_NLPlate (const Handle_Geom_Surface & InitialSurface);
		%feature("autodoc", "Args:
	GConst(Handle_NLPlate_HGPPConstraint)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const Handle_NLPlate_HGPPConstraint & GConst);
		%feature("autodoc", "Args:
	ord(Standard_Integer)=2
	InitialConsraintOrder(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") Solve;
		void Solve (const Standard_Integer ord = 2,const Standard_Integer InitialConsraintOrder = 1);
		%feature("autodoc", "Args:
	ord(Standard_Integer)=2
	InitialConsraintOrder(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") Solve2;
		void Solve2 (const Standard_Integer ord = 2,const Standard_Integer InitialConsraintOrder = 1);
		%feature("autodoc", "Args:
	ord(Standard_Integer)=2
	InitialConsraintOrder(Standard_Integer)=1
	NbIncrements(Standard_Integer)=4
	UVSliding(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") IncrementalSolve;
		void IncrementalSolve (const Standard_Integer ord = 2,const Standard_Integer InitialConsraintOrder = 1,const Standard_Integer NbIncrements = 4,const Standard_Boolean UVSliding = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True if all has been correctly done.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") destroy;
		void destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	None

reset the Plate in the initial state  
          ( same as after Create((Surface))") Init;
		void Init ();
		%feature("autodoc", "Args:
	point2d(gp_XY)

Returns:
	gp_XYZ

No detailed docstring for this function.") Evaluate;
		gp_XYZ Evaluate (const gp_XY & point2d);
		%feature("autodoc", "Args:
	point2d(gp_XY)
	iu(Standard_Integer)
	iv(Standard_Integer)

Returns:
	gp_XYZ

No detailed docstring for this function.") EvaluateDerivative;
		gp_XYZ EvaluateDerivative (const gp_XY & point2d,const Standard_Integer iu,const Standard_Integer iv);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Continuity;
		Standard_Integer Continuity ();
		%feature("autodoc", "Args:
	NbIterations(Standard_Integer)=3

Returns:
	None

No detailed docstring for this function.") ConstraintsSliding;
		void ConstraintsSliding (const Standard_Integer NbIterations = 3);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") MaxActiveConstraintOrder;
		Standard_Integer MaxActiveConstraintOrder ();
};


%feature("shadow") NLPlate_NLPlate::~NLPlate_NLPlate %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	I(Handle_NLPlate_HGPPConstraint)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") NLPlate_SequenceNodeOfSequenceOfHGPPConstraint;
		 NLPlate_SequenceNodeOfSequenceOfHGPPConstraint (const Handle_NLPlate_HGPPConstraint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_NLPlate_HGPPConstraint

No detailed docstring for this function.") Value;
		Handle_NLPlate_HGPPConstraint & Value ();
};


%feature("shadow") NLPlate_SequenceNodeOfSequenceOfHGPPConstraint::~NLPlate_SequenceNodeOfSequenceOfHGPPConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NLPlate_SequenceOfHGPPConstraint;
		 NLPlate_SequenceOfHGPPConstraint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(NLPlate_SequenceOfHGPPConstraint)

Returns:
	NLPlate_SequenceOfHGPPConstraint

No detailed docstring for this function.") Assign;
		const NLPlate_SequenceOfHGPPConstraint & Assign (const NLPlate_SequenceOfHGPPConstraint & Other);
		%feature("autodoc", "Args:
	Other(NLPlate_SequenceOfHGPPConstraint)

Returns:
	NLPlate_SequenceOfHGPPConstraint

No detailed docstring for this function.") operator=;
		const NLPlate_SequenceOfHGPPConstraint & operator = (const NLPlate_SequenceOfHGPPConstraint & Other);
		%feature("autodoc", "Args:
	T(Handle_NLPlate_HGPPConstraint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_NLPlate_HGPPConstraint & T);
		%feature("autodoc", "Args:
	S(NLPlate_SequenceOfHGPPConstraint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (NLPlate_SequenceOfHGPPConstraint & S);
		%feature("autodoc", "Args:
	T(Handle_NLPlate_HGPPConstraint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_NLPlate_HGPPConstraint & T);
		%feature("autodoc", "Args:
	S(NLPlate_SequenceOfHGPPConstraint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (NLPlate_SequenceOfHGPPConstraint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_NLPlate_HGPPConstraint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_NLPlate_HGPPConstraint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(NLPlate_SequenceOfHGPPConstraint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,NLPlate_SequenceOfHGPPConstraint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_NLPlate_HGPPConstraint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_NLPlate_HGPPConstraint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(NLPlate_SequenceOfHGPPConstraint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,NLPlate_SequenceOfHGPPConstraint & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_NLPlate_HGPPConstraint

No detailed docstring for this function.") First;
		const Handle_NLPlate_HGPPConstraint & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_NLPlate_HGPPConstraint

No detailed docstring for this function.") Last;
		const Handle_NLPlate_HGPPConstraint & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(NLPlate_SequenceOfHGPPConstraint)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,NLPlate_SequenceOfHGPPConstraint & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_NLPlate_HGPPConstraint

No detailed docstring for this function.") Value;
		const Handle_NLPlate_HGPPConstraint & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_NLPlate_HGPPConstraint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_NLPlate_HGPPConstraint & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_NLPlate_HGPPConstraint

No detailed docstring for this function.") ChangeValue;
		Handle_NLPlate_HGPPConstraint & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") NLPlate_SequenceOfHGPPConstraint::~NLPlate_SequenceOfHGPPConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NLPlate_StackIteratorOfStackOfPlate;
		 NLPlate_StackIteratorOfStackOfPlate ();
		%feature("autodoc", "Args:
	S(NLPlate_StackOfPlate)

Returns:
	None

No detailed docstring for this function.") NLPlate_StackIteratorOfStackOfPlate;
		 NLPlate_StackIteratorOfStackOfPlate (const NLPlate_StackOfPlate & S);
		%feature("autodoc", "Args:
	S(NLPlate_StackOfPlate)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const NLPlate_StackOfPlate & S);
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
	Plate_Plate

No detailed docstring for this function.") Value;
		const Plate_Plate & Value ();
};


%feature("shadow") NLPlate_StackIteratorOfStackOfPlate::~NLPlate_StackIteratorOfStackOfPlate %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	I(Plate_Plate)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") NLPlate_StackNodeOfStackOfPlate;
		 NLPlate_StackNodeOfStackOfPlate (const Plate_Plate & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Plate_Plate

No detailed docstring for this function.") Value;
		Plate_Plate & Value ();
};


%feature("shadow") NLPlate_StackNodeOfStackOfPlate::~NLPlate_StackNodeOfStackOfPlate %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NLPlate_StackOfPlate;
		 NLPlate_StackOfPlate ();
		%feature("autodoc", "Args:
	Other(NLPlate_StackOfPlate)

Returns:
	NLPlate_StackOfPlate

No detailed docstring for this function.") Assign;
		const NLPlate_StackOfPlate & Assign (const NLPlate_StackOfPlate & Other);
		%feature("autodoc", "Args:
	Other(NLPlate_StackOfPlate)

Returns:
	NLPlate_StackOfPlate

No detailed docstring for this function.") operator=;
		const NLPlate_StackOfPlate & operator = (const NLPlate_StackOfPlate & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Depth;
		Standard_Integer Depth ();
		%feature("autodoc", "Args:
	None
Returns:
	Plate_Plate

No detailed docstring for this function.") Top;
		const Plate_Plate & Top ();
		%feature("autodoc", "Args:
	I(Plate_Plate)

Returns:
	None

No detailed docstring for this function.") Push;
		void Push (const Plate_Plate & I);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Pop;
		void Pop ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Plate_Plate

No detailed docstring for this function.") ChangeTop;
		Plate_Plate & ChangeTop ();
};


%feature("shadow") NLPlate_StackOfPlate::~NLPlate_StackOfPlate %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	UV(gp_XY)
	Value(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") NLPlate_HPG0Constraint;
		 NLPlate_HPG0Constraint (const gp_XY & UV,const gp_XYZ & Value);
		%feature("autodoc", "Args:
	UVFree(Standard_Boolean)

Returns:
	virtual void

No detailed docstring for this function.") SetUVFreeSliding;
		virtual void SetUVFreeSliding (const Standard_Boolean UVFree);
		%feature("autodoc", "Args:
	ILA(Standard_Boolean)

Returns:
	virtual void

No detailed docstring for this function.") SetIncrementalLoadAllowed;
		virtual void SetIncrementalLoadAllowed (const Standard_Boolean ILA);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") UVFreeSliding;
		virtual Standard_Boolean UVFreeSliding ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IncrementalLoadAllowed;
		virtual Standard_Boolean IncrementalLoadAllowed ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") ActiveOrder;
		virtual Standard_Integer ActiveOrder ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsG0;
		virtual Standard_Boolean IsG0 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  gp_XYZ

No detailed docstring for this function.") G0Target;
		virtual const gp_XYZ & G0Target ();
};


%feature("shadow") NLPlate_HPG0Constraint::~NLPlate_HPG0Constraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	UV(gp_XY)
	D1T(Plate_D1)

Returns:
	None

No detailed docstring for this function.") NLPlate_HPG1Constraint;
		 NLPlate_HPG1Constraint (const gp_XY & UV,const Plate_D1 & D1T);
		%feature("autodoc", "Args:
	ILA(Standard_Boolean)

Returns:
	virtual void

No detailed docstring for this function.") SetIncrementalLoadAllowed;
		virtual void SetIncrementalLoadAllowed (const Standard_Boolean ILA);
		%feature("autodoc", "Args:
	Orient(Standard_Integer)=0

Returns:
	virtual void

No detailed docstring for this function.") SetOrientation;
		virtual void SetOrientation (const Standard_Integer Orient = 0);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IncrementalLoadAllowed;
		virtual Standard_Boolean IncrementalLoadAllowed ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") ActiveOrder;
		virtual Standard_Integer ActiveOrder ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsG0;
		virtual Standard_Boolean IsG0 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") Orientation;
		virtual Standard_Integer Orientation ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Plate_D1

No detailed docstring for this function.") G1Target;
		virtual const Plate_D1 & G1Target ();
};


%feature("shadow") NLPlate_HPG1Constraint::~NLPlate_HPG1Constraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	UV(gp_XY)
	Value(gp_XYZ)
	D1T(Plate_D1)

Returns:
	None

No detailed docstring for this function.") NLPlate_HPG0G1Constraint;
		 NLPlate_HPG0G1Constraint (const gp_XY & UV,const gp_XYZ & Value,const Plate_D1 & D1T);
		%feature("autodoc", "Args:
	Orient(Standard_Integer)=0

Returns:
	virtual void

No detailed docstring for this function.") SetOrientation;
		virtual void SetOrientation (const Standard_Integer Orient = 0);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") ActiveOrder;
		virtual Standard_Integer ActiveOrder ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") Orientation;
		virtual Standard_Integer Orientation ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Plate_D1

No detailed docstring for this function.") G1Target;
		virtual const Plate_D1 & G1Target ();
};


%feature("shadow") NLPlate_HPG0G1Constraint::~NLPlate_HPG0G1Constraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	UV(gp_XY)
	D1T(Plate_D1)
	D2T(Plate_D2)

Returns:
	None

No detailed docstring for this function.") NLPlate_HPG2Constraint;
		 NLPlate_HPG2Constraint (const gp_XY & UV,const Plate_D1 & D1T,const Plate_D2 & D2T);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") ActiveOrder;
		virtual Standard_Integer ActiveOrder ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Plate_D2

No detailed docstring for this function.") G2Target;
		virtual const Plate_D2 & G2Target ();
};


%feature("shadow") NLPlate_HPG2Constraint::~NLPlate_HPG2Constraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	UV(gp_XY)
	Value(gp_XYZ)
	D1T(Plate_D1)
	D2T(Plate_D2)

Returns:
	None

No detailed docstring for this function.") NLPlate_HPG0G2Constraint;
		 NLPlate_HPG0G2Constraint (const gp_XY & UV,const gp_XYZ & Value,const Plate_D1 & D1T,const Plate_D2 & D2T);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") ActiveOrder;
		virtual Standard_Integer ActiveOrder ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Plate_D2

No detailed docstring for this function.") G2Target;
		virtual const Plate_D2 & G2Target ();
};


%feature("shadow") NLPlate_HPG0G2Constraint::~NLPlate_HPG0G2Constraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	UV(gp_XY)
	D1T(Plate_D1)
	D2T(Plate_D2)
	D3T(Plate_D3)

Returns:
	None

No detailed docstring for this function.") NLPlate_HPG3Constraint;
		 NLPlate_HPG3Constraint (const gp_XY & UV,const Plate_D1 & D1T,const Plate_D2 & D2T,const Plate_D3 & D3T);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") ActiveOrder;
		virtual Standard_Integer ActiveOrder ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Plate_D3

No detailed docstring for this function.") G3Target;
		virtual const Plate_D3 & G3Target ();
};


%feature("shadow") NLPlate_HPG3Constraint::~NLPlate_HPG3Constraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
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
		%feature("autodoc", "Args:
	UV(gp_XY)
	Value(gp_XYZ)
	D1T(Plate_D1)
	D2T(Plate_D2)
	D3T(Plate_D3)

Returns:
	None

No detailed docstring for this function.") NLPlate_HPG0G3Constraint;
		 NLPlate_HPG0G3Constraint (const gp_XY & UV,const gp_XYZ & Value,const Plate_D1 & D1T,const Plate_D2 & D2T,const Plate_D3 & D3T);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") ActiveOrder;
		virtual Standard_Integer ActiveOrder ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Plate_D3

No detailed docstring for this function.") G3Target;
		virtual const Plate_D3 & G3Target ();
};


%feature("shadow") NLPlate_HPG0G3Constraint::~NLPlate_HPG0G3Constraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
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
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_NLPlate_HPG0G3Constraint {
    void _kill_pointed() {
        delete $self;
    }
};

