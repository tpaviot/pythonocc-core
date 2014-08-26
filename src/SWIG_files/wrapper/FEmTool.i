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
%module FEmTool

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

%include FEmTool_required_python_modules.i
%include FEmTool_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor FEmTool_Assembly;
class FEmTool_Assembly {
	public:
		%feature("autodoc", "Args:
	Dependence(TColStd_Array2OfInteger)
	Table(Handle_FEmTool_HAssemblyTable)

Returns:
	None

No detailed docstring for this function.") FEmTool_Assembly;
		 FEmTool_Assembly (const TColStd_Array2OfInteger & Dependence,const Handle_FEmTool_HAssemblyTable & Table);
		%feature("autodoc", "Args:
	None
Returns:
	None

Nullify all Matrix 's Coefficient") NullifyMatrix;
		void NullifyMatrix ();
		%feature("autodoc", "Args:
	Element(Standard_Integer)
	Dimension1(Standard_Integer)
	Dimension2(Standard_Integer)
	Mat(math_Matrix)

Returns:
	None

Add an elementary Matrix in the assembly Matrix  
 if  Dependence(Dimension1,Dimension2)  is  False") AddMatrix;
		void AddMatrix (const Standard_Integer Element,const Standard_Integer Dimension1,const Standard_Integer Dimension2,const math_Matrix & Mat);
		%feature("autodoc", "Args:
	None
Returns:
	None

Nullify  all  Coordinate of  assembly  Vector (second member)") NullifyVector;
		void NullifyVector ();
		%feature("autodoc", "Args:
	Element(Standard_Integer)
	Dimension(Standard_Integer)
	Vec(math_Vector)

Returns:
	None

Add an elementary Vector in the assembly Vector (second member)") AddVector;
		void AddVector (const Standard_Integer Element,const Standard_Integer Dimension,const math_Vector & Vec);
		%feature("autodoc", "Args:
	None
Returns:
	None

Delete all Constraints.") ResetConstraint;
		void ResetConstraint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Nullify all Constraints.") NullifyConstraint;
		void NullifyConstraint ();
		%feature("autodoc", "Args:
	IndexofConstraint(Standard_Integer)
	Element(Standard_Integer)
	Dimension(Standard_Integer)
	LinearForm(math_Vector)
	Value(Standard_Real)

Returns:
	None

No detailed docstring for this function.") AddConstraint;
		void AddConstraint (const Standard_Integer IndexofConstraint,const Standard_Integer Element,const Standard_Integer Dimension,const math_Vector & LinearForm,const Standard_Real Value);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Solve the assembly system  
         Returns Standard_False if the computation failed.") Solve;
		Standard_Boolean Solve ();
		%feature("autodoc", "Args:
	Solution(math_Vector)

Returns:
	None

No detailed docstring for this function.") Solution;
		void Solution (math_Vector & Solution);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbGlobVar;
		Standard_Integer NbGlobVar ();
		%feature("autodoc", "Args:
	AssTable(Handle_FEmTool_HAssemblyTable)

Returns:
	None

No detailed docstring for this function.") GetAssemblyTable;
		void GetAssemblyTable (Handle_FEmTool_HAssemblyTable & AssTable);
};


%feature("shadow") FEmTool_Assembly::~FEmTool_Assembly %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FEmTool_Assembly {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FEmTool_AssemblyTable;
class FEmTool_AssemblyTable {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") FEmTool_AssemblyTable;
		 FEmTool_AssemblyTable (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Handle_TColStd_HArray1OfInteger)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") FEmTool_AssemblyTable;
		 FEmTool_AssemblyTable (const Handle_TColStd_HArray1OfInteger & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Handle_TColStd_HArray1OfInteger)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_TColStd_HArray1OfInteger & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(FEmTool_AssemblyTable)

Returns:
	FEmTool_AssemblyTable

No detailed docstring for this function.") Assign;
		const FEmTool_AssemblyTable & Assign (const FEmTool_AssemblyTable & Other);
		%feature("autodoc", "Args:
	Other(FEmTool_AssemblyTable)

Returns:
	FEmTool_AssemblyTable

No detailed docstring for this function.") operator=;
		const FEmTool_AssemblyTable & operator = (const FEmTool_AssemblyTable & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Handle_TColStd_HArray1OfInteger)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_TColStd_HArray1OfInteger & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_TColStd_HArray1OfInteger

No detailed docstring for this function.") Value;
		const Handle_TColStd_HArray1OfInteger & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_TColStd_HArray1OfInteger

No detailed docstring for this function.") ChangeValue;
		Handle_TColStd_HArray1OfInteger & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") FEmTool_AssemblyTable::~FEmTool_AssemblyTable %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FEmTool_AssemblyTable {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FEmTool_Curve;
class FEmTool_Curve : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	NbElements(Standard_Integer)
	TheBase(Handle_PLib_Base)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") FEmTool_Curve;
		 FEmTool_Curve (const Standard_Integer Dimension,const Standard_Integer NbElements,const Handle_PLib_Base & TheBase,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfReal

No detailed docstring for this function.") Knots;
		TColStd_Array1OfReal & Knots ();
		%feature("autodoc", "Args:
	IndexOfElement(Standard_Integer)
	Coeffs(TColStd_Array2OfReal)

Returns:
	None

No detailed docstring for this function.") SetElement;
		void SetElement (const Standard_Integer IndexOfElement,const TColStd_Array2OfReal & Coeffs);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Pnt(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") D0;
		void D0 (const Standard_Real U,TColStd_Array1OfReal & Pnt);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Vec(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") D1;
		void D1 (const Standard_Real U,TColStd_Array1OfReal & Vec);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Vec(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") D2;
		void D2 (const Standard_Real U,TColStd_Array1OfReal & Vec);
		%feature("autodoc", "Args:
	FirstU(Standard_Real)
	LastU(Standard_Real)
	Length(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Length;
		void Length (const Standard_Real FirstU,const Standard_Real LastU,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	IndexOfElement(Standard_Integer)
	Coeffs(TColStd_Array2OfReal)

Returns:
	None

No detailed docstring for this function.") GetElement;
		void GetElement (const Standard_Integer IndexOfElement,TColStd_Array2OfReal & Coeffs);
		%feature("autodoc", "Args:
	Coeffs(TColStd_Array1OfReal)

Returns:
	None

returns  coefficients  of  all  elements  in  canonical  base.") GetPolynom;
		void GetPolynom (TColStd_Array1OfReal & Coeffs);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbElements;
		Standard_Integer NbElements ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Dimension;
		Standard_Integer Dimension ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_PLib_Base

No detailed docstring for this function.") Base;
		Handle_PLib_Base Base ();
		%feature("autodoc", "Args:
	IndexOfElement(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") Degree;
		Standard_Integer Degree (const Standard_Integer IndexOfElement);
		%feature("autodoc", "Args:
	IndexOfElement(Standard_Integer)
	Degree(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetDegree;
		void SetDegree (const Standard_Integer IndexOfElement,const Standard_Integer Degree);
		%feature("autodoc", "Args:
	IndexOfElement(Standard_Integer)
	Tol(Standard_Real)
	NewDegree(Standard_Integer)
	MaxError(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ReduceDegree;
		void ReduceDegree (const Standard_Integer IndexOfElement,const Standard_Real Tol,Standard_Integer &OutValue,Standard_Real &OutValue);
};


%feature("shadow") FEmTool_Curve::~FEmTool_Curve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FEmTool_Curve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend FEmTool_Curve {
	Handle_FEmTool_Curve GetHandle() {
	return *(Handle_FEmTool_Curve*) &$self;
	}
};

%nodefaultctor Handle_FEmTool_Curve;
class Handle_FEmTool_Curve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_FEmTool_Curve();
        Handle_FEmTool_Curve(const Handle_FEmTool_Curve &aHandle);
        Handle_FEmTool_Curve(const FEmTool_Curve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_FEmTool_Curve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_FEmTool_Curve {
    FEmTool_Curve* GetObject() {
    return (FEmTool_Curve*)$self->Access();
    }
};
%feature("shadow") Handle_FEmTool_Curve::~Handle_FEmTool_Curve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_FEmTool_Curve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor FEmTool_ElementaryCriterion;
class FEmTool_ElementaryCriterion : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Coeff(Handle_TColStd_HArray2OfReal)

Returns:
	None

Set the coefficient of the Element (the  Curve)") Set;
		void Set (const Handle_TColStd_HArray2OfReal & Coeff);
		%feature("autodoc", "Args:
	FirstKnot(Standard_Real)
	LastKnot(Standard_Real)

Returns:
	virtual void

Set the definition interval of the Element") Set;
		virtual void Set (const Standard_Real FirstKnot,const Standard_Real LastKnot);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_TColStd_HArray2OfInteger

To know if two dimension are independent.") DependenceTable;
		virtual Handle_TColStd_HArray2OfInteger DependenceTable ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

To Compute J(E) where E  is the current Element") Value;
		virtual Standard_Real Value ();
		%feature("autodoc", "Args:
	Dim1(Standard_Integer)
	Dim2(Standard_Integer)
	H(math_Matrix)

Returns:
	virtual void

To Compute J(E)  the coefficients of Hessian matrix of  
         J(E) wich are crossed derivatives in dimensions <Dim1>  
         and  <Dim2>.  
If DependenceTable(Dimension1,Dimension2) is False") Hessian;
		virtual void Hessian (const Standard_Integer Dim1,const Standard_Integer Dim2,math_Matrix & H);
		%feature("autodoc", "Args:
	Dim(Standard_Integer)
	G(math_Vector)

Returns:
	virtual void

To Compute the  coefficients in the dimension <dim>  
         of  the  J(E)'s  Gradient where E  is  the current  Element") Gradient;
		virtual void Gradient (const Standard_Integer Dim,math_Vector & G);
};


%feature("shadow") FEmTool_ElementaryCriterion::~FEmTool_ElementaryCriterion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FEmTool_ElementaryCriterion {
	void _kill_pointed() {
		delete $self;
	}
};
%extend FEmTool_ElementaryCriterion {
	Handle_FEmTool_ElementaryCriterion GetHandle() {
	return *(Handle_FEmTool_ElementaryCriterion*) &$self;
	}
};

%nodefaultctor Handle_FEmTool_ElementaryCriterion;
class Handle_FEmTool_ElementaryCriterion : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_FEmTool_ElementaryCriterion();
        Handle_FEmTool_ElementaryCriterion(const Handle_FEmTool_ElementaryCriterion &aHandle);
        Handle_FEmTool_ElementaryCriterion(const FEmTool_ElementaryCriterion *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_FEmTool_ElementaryCriterion DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_FEmTool_ElementaryCriterion {
    FEmTool_ElementaryCriterion* GetObject() {
    return (FEmTool_ElementaryCriterion*)$self->Access();
    }
};
%feature("shadow") Handle_FEmTool_ElementaryCriterion::~Handle_FEmTool_ElementaryCriterion %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_FEmTool_ElementaryCriterion {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor FEmTool_ElementsOfRefMatrix;
class FEmTool_ElementsOfRefMatrix : public math_FunctionSet {
	public:
		%feature("autodoc", "Args:
	TheBase(Handle_PLib_Base)
	DerOrder(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") FEmTool_ElementsOfRefMatrix;
		 FEmTool_ElementsOfRefMatrix (const Handle_PLib_Base & TheBase,const Standard_Integer DerOrder);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of variables of the function.  
 It  is  supposed  that  NbVariables  =  1.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of equations of the function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

computes the values <F> of the functions for the  
         variable <X>.  
         returns True if the computation was done successfully,  
         False otherwise.  
         F  contains  results  only  for  i<=j  in  following  order:  
         P0*P0,  P0*P1,  P0*P2...  P1*P1,  P1*P2,...  (upper  triangle of  
         matrix  {PiPj})") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
};


%feature("shadow") FEmTool_ElementsOfRefMatrix::~FEmTool_ElementsOfRefMatrix %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FEmTool_ElementsOfRefMatrix {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FEmTool_HAssemblyTable;
class FEmTool_HAssemblyTable : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") FEmTool_HAssemblyTable;
		 FEmTool_HAssemblyTable (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(Handle_TColStd_HArray1OfInteger)

Returns:
	None

No detailed docstring for this function.") FEmTool_HAssemblyTable;
		 FEmTool_HAssemblyTable (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_TColStd_HArray1OfInteger & V);
		%feature("autodoc", "Args:
	V(Handle_TColStd_HArray1OfInteger)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_TColStd_HArray1OfInteger & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Handle_TColStd_HArray1OfInteger)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_TColStd_HArray1OfInteger & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_TColStd_HArray1OfInteger

No detailed docstring for this function.") Value;
		const Handle_TColStd_HArray1OfInteger & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_TColStd_HArray1OfInteger

No detailed docstring for this function.") ChangeValue;
		Handle_TColStd_HArray1OfInteger & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	FEmTool_AssemblyTable

No detailed docstring for this function.") Array2;
		const FEmTool_AssemblyTable & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	FEmTool_AssemblyTable

No detailed docstring for this function.") ChangeArray2;
		FEmTool_AssemblyTable & ChangeArray2 ();
};


%feature("shadow") FEmTool_HAssemblyTable::~FEmTool_HAssemblyTable %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FEmTool_HAssemblyTable {
	void _kill_pointed() {
		delete $self;
	}
};
%extend FEmTool_HAssemblyTable {
	Handle_FEmTool_HAssemblyTable GetHandle() {
	return *(Handle_FEmTool_HAssemblyTable*) &$self;
	}
};

%nodefaultctor Handle_FEmTool_HAssemblyTable;
class Handle_FEmTool_HAssemblyTable : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_FEmTool_HAssemblyTable();
        Handle_FEmTool_HAssemblyTable(const Handle_FEmTool_HAssemblyTable &aHandle);
        Handle_FEmTool_HAssemblyTable(const FEmTool_HAssemblyTable *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_FEmTool_HAssemblyTable DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_FEmTool_HAssemblyTable {
    FEmTool_HAssemblyTable* GetObject() {
    return (FEmTool_HAssemblyTable*)$self->Access();
    }
};
%feature("shadow") Handle_FEmTool_HAssemblyTable::~Handle_FEmTool_HAssemblyTable %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_FEmTool_HAssemblyTable {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor FEmTool_ListIteratorOfListOfVectors;
class FEmTool_ListIteratorOfListOfVectors {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") FEmTool_ListIteratorOfListOfVectors;
		 FEmTool_ListIteratorOfListOfVectors ();
		%feature("autodoc", "Args:
	L(FEmTool_ListOfVectors)

Returns:
	None

No detailed docstring for this function.") FEmTool_ListIteratorOfListOfVectors;
		 FEmTool_ListIteratorOfListOfVectors (const FEmTool_ListOfVectors & L);
		%feature("autodoc", "Args:
	L(FEmTool_ListOfVectors)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const FEmTool_ListOfVectors & L);
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
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") Value;
		Handle_TColStd_HArray1OfReal & Value ();
};


%feature("shadow") FEmTool_ListIteratorOfListOfVectors::~FEmTool_ListIteratorOfListOfVectors %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FEmTool_ListIteratorOfListOfVectors {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FEmTool_ListNodeOfListOfVectors;
class FEmTool_ListNodeOfListOfVectors : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_TColStd_HArray1OfReal)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") FEmTool_ListNodeOfListOfVectors;
		 FEmTool_ListNodeOfListOfVectors (const Handle_TColStd_HArray1OfReal & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") Value;
		Handle_TColStd_HArray1OfReal & Value ();
};


%feature("shadow") FEmTool_ListNodeOfListOfVectors::~FEmTool_ListNodeOfListOfVectors %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FEmTool_ListNodeOfListOfVectors {
	void _kill_pointed() {
		delete $self;
	}
};
%extend FEmTool_ListNodeOfListOfVectors {
	Handle_FEmTool_ListNodeOfListOfVectors GetHandle() {
	return *(Handle_FEmTool_ListNodeOfListOfVectors*) &$self;
	}
};

%nodefaultctor Handle_FEmTool_ListNodeOfListOfVectors;
class Handle_FEmTool_ListNodeOfListOfVectors : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_FEmTool_ListNodeOfListOfVectors();
        Handle_FEmTool_ListNodeOfListOfVectors(const Handle_FEmTool_ListNodeOfListOfVectors &aHandle);
        Handle_FEmTool_ListNodeOfListOfVectors(const FEmTool_ListNodeOfListOfVectors *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_FEmTool_ListNodeOfListOfVectors DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_FEmTool_ListNodeOfListOfVectors {
    FEmTool_ListNodeOfListOfVectors* GetObject() {
    return (FEmTool_ListNodeOfListOfVectors*)$self->Access();
    }
};
%feature("shadow") Handle_FEmTool_ListNodeOfListOfVectors::~Handle_FEmTool_ListNodeOfListOfVectors %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_FEmTool_ListNodeOfListOfVectors {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor FEmTool_ListOfVectors;
class FEmTool_ListOfVectors {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") FEmTool_ListOfVectors;
		 FEmTool_ListOfVectors ();
		%feature("autodoc", "Args:
	Other(FEmTool_ListOfVectors)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const FEmTool_ListOfVectors & Other);
		%feature("autodoc", "Args:
	Other(FEmTool_ListOfVectors)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const FEmTool_ListOfVectors & Other);
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
	I(Handle_TColStd_HArray1OfReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColStd_HArray1OfReal & I);
		%feature("autodoc", "Args:
	I(Handle_TColStd_HArray1OfReal)
	theIt(FEmTool_ListIteratorOfListOfVectors)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColStd_HArray1OfReal & I,FEmTool_ListIteratorOfListOfVectors & theIt);
		%feature("autodoc", "Args:
	Other(FEmTool_ListOfVectors)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (FEmTool_ListOfVectors & Other);
		%feature("autodoc", "Args:
	I(Handle_TColStd_HArray1OfReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColStd_HArray1OfReal & I);
		%feature("autodoc", "Args:
	I(Handle_TColStd_HArray1OfReal)
	theIt(FEmTool_ListIteratorOfListOfVectors)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColStd_HArray1OfReal & I,FEmTool_ListIteratorOfListOfVectors & theIt);
		%feature("autodoc", "Args:
	Other(FEmTool_ListOfVectors)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (FEmTool_ListOfVectors & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") First;
		Handle_TColStd_HArray1OfReal & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") Last;
		Handle_TColStd_HArray1OfReal & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(FEmTool_ListIteratorOfListOfVectors)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (FEmTool_ListIteratorOfListOfVectors & It);
		%feature("autodoc", "Args:
	I(Handle_TColStd_HArray1OfReal)
	It(FEmTool_ListIteratorOfListOfVectors)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_TColStd_HArray1OfReal & I,FEmTool_ListIteratorOfListOfVectors & It);
		%feature("autodoc", "Args:
	Other(FEmTool_ListOfVectors)
	It(FEmTool_ListIteratorOfListOfVectors)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (FEmTool_ListOfVectors & Other,FEmTool_ListIteratorOfListOfVectors & It);
		%feature("autodoc", "Args:
	I(Handle_TColStd_HArray1OfReal)
	It(FEmTool_ListIteratorOfListOfVectors)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_TColStd_HArray1OfReal & I,FEmTool_ListIteratorOfListOfVectors & It);
		%feature("autodoc", "Args:
	Other(FEmTool_ListOfVectors)
	It(FEmTool_ListIteratorOfListOfVectors)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (FEmTool_ListOfVectors & Other,FEmTool_ListIteratorOfListOfVectors & It);
};


%feature("shadow") FEmTool_ListOfVectors::~FEmTool_ListOfVectors %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FEmTool_ListOfVectors {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FEmTool_SeqOfLinConstr;
class FEmTool_SeqOfLinConstr : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") FEmTool_SeqOfLinConstr;
		 FEmTool_SeqOfLinConstr ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(FEmTool_SeqOfLinConstr)

Returns:
	FEmTool_SeqOfLinConstr

No detailed docstring for this function.") Assign;
		const FEmTool_SeqOfLinConstr & Assign (const FEmTool_SeqOfLinConstr & Other);
		%feature("autodoc", "Args:
	Other(FEmTool_SeqOfLinConstr)

Returns:
	FEmTool_SeqOfLinConstr

No detailed docstring for this function.") operator=;
		const FEmTool_SeqOfLinConstr & operator = (const FEmTool_SeqOfLinConstr & Other);
		%feature("autodoc", "Args:
	T(FEmTool_ListOfVectors)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const FEmTool_ListOfVectors & T);
		%feature("autodoc", "Args:
	S(FEmTool_SeqOfLinConstr)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (FEmTool_SeqOfLinConstr & S);
		%feature("autodoc", "Args:
	T(FEmTool_ListOfVectors)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const FEmTool_ListOfVectors & T);
		%feature("autodoc", "Args:
	S(FEmTool_SeqOfLinConstr)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (FEmTool_SeqOfLinConstr & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(FEmTool_ListOfVectors)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const FEmTool_ListOfVectors & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(FEmTool_SeqOfLinConstr)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,FEmTool_SeqOfLinConstr & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(FEmTool_ListOfVectors)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const FEmTool_ListOfVectors & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(FEmTool_SeqOfLinConstr)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,FEmTool_SeqOfLinConstr & S);
		%feature("autodoc", "Args:
	None
Returns:
	FEmTool_ListOfVectors

No detailed docstring for this function.") First;
		const FEmTool_ListOfVectors & First ();
		%feature("autodoc", "Args:
	None
Returns:
	FEmTool_ListOfVectors

No detailed docstring for this function.") Last;
		const FEmTool_ListOfVectors & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(FEmTool_SeqOfLinConstr)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,FEmTool_SeqOfLinConstr & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	FEmTool_ListOfVectors

No detailed docstring for this function.") Value;
		const FEmTool_ListOfVectors & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(FEmTool_ListOfVectors)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const FEmTool_ListOfVectors & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	FEmTool_ListOfVectors

No detailed docstring for this function.") ChangeValue;
		FEmTool_ListOfVectors & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") FEmTool_SeqOfLinConstr::~FEmTool_SeqOfLinConstr %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FEmTool_SeqOfLinConstr {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FEmTool_SequenceNodeOfSeqOfLinConstr;
class FEmTool_SequenceNodeOfSeqOfLinConstr : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(FEmTool_ListOfVectors)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") FEmTool_SequenceNodeOfSeqOfLinConstr;
		 FEmTool_SequenceNodeOfSeqOfLinConstr (const FEmTool_ListOfVectors & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	FEmTool_ListOfVectors

No detailed docstring for this function.") Value;
		FEmTool_ListOfVectors & Value ();
};


%feature("shadow") FEmTool_SequenceNodeOfSeqOfLinConstr::~FEmTool_SequenceNodeOfSeqOfLinConstr %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FEmTool_SequenceNodeOfSeqOfLinConstr {
	void _kill_pointed() {
		delete $self;
	}
};
%extend FEmTool_SequenceNodeOfSeqOfLinConstr {
	Handle_FEmTool_SequenceNodeOfSeqOfLinConstr GetHandle() {
	return *(Handle_FEmTool_SequenceNodeOfSeqOfLinConstr*) &$self;
	}
};

%nodefaultctor Handle_FEmTool_SequenceNodeOfSeqOfLinConstr;
class Handle_FEmTool_SequenceNodeOfSeqOfLinConstr : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_FEmTool_SequenceNodeOfSeqOfLinConstr();
        Handle_FEmTool_SequenceNodeOfSeqOfLinConstr(const Handle_FEmTool_SequenceNodeOfSeqOfLinConstr &aHandle);
        Handle_FEmTool_SequenceNodeOfSeqOfLinConstr(const FEmTool_SequenceNodeOfSeqOfLinConstr *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_FEmTool_SequenceNodeOfSeqOfLinConstr DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_FEmTool_SequenceNodeOfSeqOfLinConstr {
    FEmTool_SequenceNodeOfSeqOfLinConstr* GetObject() {
    return (FEmTool_SequenceNodeOfSeqOfLinConstr*)$self->Access();
    }
};
%feature("shadow") Handle_FEmTool_SequenceNodeOfSeqOfLinConstr::~Handle_FEmTool_SequenceNodeOfSeqOfLinConstr %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_FEmTool_SequenceNodeOfSeqOfLinConstr {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor FEmTool_SparseMatrix;
class FEmTool_SparseMatrix : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Value(Standard_Real)

Returns:
	virtual void

No detailed docstring for this function.") Init;
		virtual void Init (const Standard_Real Value);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	J(Standard_Integer)

Returns:
	virtual Standard_Real

No detailed docstring for this function.") ChangeValue;
		virtual Standard_Real & ChangeValue (const Standard_Integer I,const Standard_Integer J);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

To make a Factorization of <self>") Decompose;
		virtual Standard_Boolean Decompose ();
		%feature("autodoc", "Args:
	B(math_Vector)
	X(math_Vector)

Returns:
	virtual void

Direct Solve of AX = B") Solve;
		virtual void Solve (const math_Vector & B,math_Vector & X);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Make Preparation to iterative solve") Prepare;
		virtual Standard_Boolean Prepare ();
		%feature("autodoc", "Args:
	B(math_Vector)
	Init(math_Vector)
	X(math_Vector)
	Residual(math_Vector)
	Tolerance(Standard_Real)=1.0e-8
	NbIterations(Standard_Integer)=50

Returns:
	virtual void

Iterative solve  of AX = B") Solve;
		virtual void Solve (const math_Vector & B,const math_Vector & Init,math_Vector & X,math_Vector & Residual,const Standard_Real Tolerance = 1.0e-8,const Standard_Integer NbIterations = 50);
		%feature("autodoc", "Args:
	X(math_Vector)
	MX(math_Vector)

Returns:
	virtual void

returns the product of a SparseMatrix by a vector.  
         An exception is raised if the dimensions are different") Multiplied;
		virtual void Multiplied (const math_Vector & X,math_Vector & MX);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the row range of a matrix.") RowNumber;
		virtual Standard_Integer RowNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

returns the column range of the matrix.") ColNumber;
		virtual Standard_Integer ColNumber ();
};


%feature("shadow") FEmTool_SparseMatrix::~FEmTool_SparseMatrix %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FEmTool_SparseMatrix {
	void _kill_pointed() {
		delete $self;
	}
};
%extend FEmTool_SparseMatrix {
	Handle_FEmTool_SparseMatrix GetHandle() {
	return *(Handle_FEmTool_SparseMatrix*) &$self;
	}
};

%nodefaultctor Handle_FEmTool_SparseMatrix;
class Handle_FEmTool_SparseMatrix : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_FEmTool_SparseMatrix();
        Handle_FEmTool_SparseMatrix(const Handle_FEmTool_SparseMatrix &aHandle);
        Handle_FEmTool_SparseMatrix(const FEmTool_SparseMatrix *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_FEmTool_SparseMatrix DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_FEmTool_SparseMatrix {
    FEmTool_SparseMatrix* GetObject() {
    return (FEmTool_SparseMatrix*)$self->Access();
    }
};
%feature("shadow") Handle_FEmTool_SparseMatrix::~Handle_FEmTool_SparseMatrix %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_FEmTool_SparseMatrix {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor FEmTool_LinearFlexion;
class FEmTool_LinearFlexion : public FEmTool_ElementaryCriterion {
	public:
		%feature("autodoc", "Args:
	WorkDegree(Standard_Integer)
	ConstraintOrder(GeomAbs_Shape)

Returns:
	None

No detailed docstring for this function.") FEmTool_LinearFlexion;
		 FEmTool_LinearFlexion (const Standard_Integer WorkDegree,const GeomAbs_Shape ConstraintOrder);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_TColStd_HArray2OfInteger

No detailed docstring for this function.") DependenceTable;
		virtual Handle_TColStd_HArray2OfInteger DependenceTable ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") Value;
		virtual Standard_Real Value ();
		%feature("autodoc", "Args:
	Dimension1(Standard_Integer)
	Dimension2(Standard_Integer)
	H(math_Matrix)

Returns:
	virtual void

No detailed docstring for this function.") Hessian;
		virtual void Hessian (const Standard_Integer Dimension1,const Standard_Integer Dimension2,math_Matrix & H);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	G(math_Vector)

Returns:
	virtual void

No detailed docstring for this function.") Gradient;
		virtual void Gradient (const Standard_Integer Dimension,math_Vector & G);
};


%feature("shadow") FEmTool_LinearFlexion::~FEmTool_LinearFlexion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FEmTool_LinearFlexion {
	void _kill_pointed() {
		delete $self;
	}
};
%extend FEmTool_LinearFlexion {
	Handle_FEmTool_LinearFlexion GetHandle() {
	return *(Handle_FEmTool_LinearFlexion*) &$self;
	}
};

%nodefaultctor Handle_FEmTool_LinearFlexion;
class Handle_FEmTool_LinearFlexion : public Handle_FEmTool_ElementaryCriterion {

    public:
        // constructors
        Handle_FEmTool_LinearFlexion();
        Handle_FEmTool_LinearFlexion(const Handle_FEmTool_LinearFlexion &aHandle);
        Handle_FEmTool_LinearFlexion(const FEmTool_LinearFlexion *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_FEmTool_LinearFlexion DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_FEmTool_LinearFlexion {
    FEmTool_LinearFlexion* GetObject() {
    return (FEmTool_LinearFlexion*)$self->Access();
    }
};
%feature("shadow") Handle_FEmTool_LinearFlexion::~Handle_FEmTool_LinearFlexion %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_FEmTool_LinearFlexion {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor FEmTool_LinearJerk;
class FEmTool_LinearJerk : public FEmTool_ElementaryCriterion {
	public:
		%feature("autodoc", "Args:
	WorkDegree(Standard_Integer)
	ConstraintOrder(GeomAbs_Shape)

Returns:
	None

No detailed docstring for this function.") FEmTool_LinearJerk;
		 FEmTool_LinearJerk (const Standard_Integer WorkDegree,const GeomAbs_Shape ConstraintOrder);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_TColStd_HArray2OfInteger

No detailed docstring for this function.") DependenceTable;
		virtual Handle_TColStd_HArray2OfInteger DependenceTable ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") Value;
		virtual Standard_Real Value ();
		%feature("autodoc", "Args:
	Dimension1(Standard_Integer)
	Dimension2(Standard_Integer)
	H(math_Matrix)

Returns:
	virtual void

No detailed docstring for this function.") Hessian;
		virtual void Hessian (const Standard_Integer Dimension1,const Standard_Integer Dimension2,math_Matrix & H);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	G(math_Vector)

Returns:
	virtual void

No detailed docstring for this function.") Gradient;
		virtual void Gradient (const Standard_Integer Dimension,math_Vector & G);
};


%feature("shadow") FEmTool_LinearJerk::~FEmTool_LinearJerk %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FEmTool_LinearJerk {
	void _kill_pointed() {
		delete $self;
	}
};
%extend FEmTool_LinearJerk {
	Handle_FEmTool_LinearJerk GetHandle() {
	return *(Handle_FEmTool_LinearJerk*) &$self;
	}
};

%nodefaultctor Handle_FEmTool_LinearJerk;
class Handle_FEmTool_LinearJerk : public Handle_FEmTool_ElementaryCriterion {

    public:
        // constructors
        Handle_FEmTool_LinearJerk();
        Handle_FEmTool_LinearJerk(const Handle_FEmTool_LinearJerk &aHandle);
        Handle_FEmTool_LinearJerk(const FEmTool_LinearJerk *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_FEmTool_LinearJerk DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_FEmTool_LinearJerk {
    FEmTool_LinearJerk* GetObject() {
    return (FEmTool_LinearJerk*)$self->Access();
    }
};
%feature("shadow") Handle_FEmTool_LinearJerk::~Handle_FEmTool_LinearJerk %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_FEmTool_LinearJerk {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor FEmTool_LinearTension;
class FEmTool_LinearTension : public FEmTool_ElementaryCriterion {
	public:
		%feature("autodoc", "Args:
	WorkDegree(Standard_Integer)
	ConstraintOrder(GeomAbs_Shape)

Returns:
	None

No detailed docstring for this function.") FEmTool_LinearTension;
		 FEmTool_LinearTension (const Standard_Integer WorkDegree,const GeomAbs_Shape ConstraintOrder);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_TColStd_HArray2OfInteger

No detailed docstring for this function.") DependenceTable;
		virtual Handle_TColStd_HArray2OfInteger DependenceTable ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") Value;
		virtual Standard_Real Value ();
		%feature("autodoc", "Args:
	Dimension1(Standard_Integer)
	Dimension2(Standard_Integer)
	H(math_Matrix)

Returns:
	virtual void

No detailed docstring for this function.") Hessian;
		virtual void Hessian (const Standard_Integer Dimension1,const Standard_Integer Dimension2,math_Matrix & H);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	G(math_Vector)

Returns:
	virtual void

No detailed docstring for this function.") Gradient;
		virtual void Gradient (const Standard_Integer Dimension,math_Vector & G);
};


%feature("shadow") FEmTool_LinearTension::~FEmTool_LinearTension %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FEmTool_LinearTension {
	void _kill_pointed() {
		delete $self;
	}
};
%extend FEmTool_LinearTension {
	Handle_FEmTool_LinearTension GetHandle() {
	return *(Handle_FEmTool_LinearTension*) &$self;
	}
};

%nodefaultctor Handle_FEmTool_LinearTension;
class Handle_FEmTool_LinearTension : public Handle_FEmTool_ElementaryCriterion {

    public:
        // constructors
        Handle_FEmTool_LinearTension();
        Handle_FEmTool_LinearTension(const Handle_FEmTool_LinearTension &aHandle);
        Handle_FEmTool_LinearTension(const FEmTool_LinearTension *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_FEmTool_LinearTension DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_FEmTool_LinearTension {
    FEmTool_LinearTension* GetObject() {
    return (FEmTool_LinearTension*)$self->Access();
    }
};
%feature("shadow") Handle_FEmTool_LinearTension::~Handle_FEmTool_LinearTension %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_FEmTool_LinearTension {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor FEmTool_ProfileMatrix;
class FEmTool_ProfileMatrix : public FEmTool_SparseMatrix {
	public:
		%feature("autodoc", "Args:
	FirstIndexes(TColStd_Array1OfInteger)

Returns:
	None

No detailed docstring for this function.") FEmTool_ProfileMatrix;
		 FEmTool_ProfileMatrix (const TColStd_Array1OfInteger & FirstIndexes);
		%feature("autodoc", "Args:
	Value(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_Real Value);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	J(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer I,const Standard_Integer J);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

To make a Factorization of <self>") Decompose;
		Standard_Boolean Decompose ();
		%feature("autodoc", "Args:
	B(math_Vector)
	X(math_Vector)

Returns:
	None

Direct Solve of AX = B") Solve;
		void Solve (const math_Vector & B,math_Vector & X);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Make Preparation to iterative solve") Prepare;
		Standard_Boolean Prepare ();
		%feature("autodoc", "Args:
	B(math_Vector)
	Init(math_Vector)
	X(math_Vector)
	Residual(math_Vector)
	Tolerance(Standard_Real)=1.0e-8
	NbIterations(Standard_Integer)=50

Returns:
	None

Iterative solve  of AX = B") Solve;
		void Solve (const math_Vector & B,const math_Vector & Init,math_Vector & X,math_Vector & Residual,const Standard_Real Tolerance = 1.0e-8,const Standard_Integer NbIterations = 50);
		%feature("autodoc", "Args:
	X(math_Vector)
	MX(math_Vector)

Returns:
	None

returns the product of a SparseMatrix by a vector.  
         An exception is raised if the dimensions are different") Multiplied;
		void Multiplied (const math_Vector & X,math_Vector & MX);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the row range of a matrix.") RowNumber;
		Standard_Integer RowNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the column range of the matrix.") ColNumber;
		Standard_Integer ColNumber ();
		%feature("autodoc", "Args:
	i(Standard_Integer)
	j(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsInProfile;
		Standard_Boolean IsInProfile (const Standard_Integer i,const Standard_Integer j);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") OutM;
		void OutM ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") OutS;
		void OutS ();
};


%feature("shadow") FEmTool_ProfileMatrix::~FEmTool_ProfileMatrix %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FEmTool_ProfileMatrix {
	void _kill_pointed() {
		delete $self;
	}
};
%extend FEmTool_ProfileMatrix {
	Handle_FEmTool_ProfileMatrix GetHandle() {
	return *(Handle_FEmTool_ProfileMatrix*) &$self;
	}
};

%nodefaultctor Handle_FEmTool_ProfileMatrix;
class Handle_FEmTool_ProfileMatrix : public Handle_FEmTool_SparseMatrix {

    public:
        // constructors
        Handle_FEmTool_ProfileMatrix();
        Handle_FEmTool_ProfileMatrix(const Handle_FEmTool_ProfileMatrix &aHandle);
        Handle_FEmTool_ProfileMatrix(const FEmTool_ProfileMatrix *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_FEmTool_ProfileMatrix DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_FEmTool_ProfileMatrix {
    FEmTool_ProfileMatrix* GetObject() {
    return (FEmTool_ProfileMatrix*)$self->Access();
    }
};
%feature("shadow") Handle_FEmTool_ProfileMatrix::~Handle_FEmTool_ProfileMatrix %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_FEmTool_ProfileMatrix {
    void _kill_pointed() {
        delete $self;
    }
};

