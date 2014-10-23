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
%module (package="OCC") FEmTool

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

%include FEmTool_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor FEmTool_Assembly;
class FEmTool_Assembly {
	public:
		%feature("autodoc", "	:param Dependence:
	:type Dependence: TColStd_Array2OfInteger &
	:param Table:
	:type Table: Handle_FEmTool_HAssemblyTable &
	:rtype: None
") FEmTool_Assembly;
		 FEmTool_Assembly (const TColStd_Array2OfInteger & Dependence,const Handle_FEmTool_HAssemblyTable & Table);
		%feature("autodoc", "	* Nullify all Matrix 's Coefficient

	:rtype: None
") NullifyMatrix;
		void NullifyMatrix ();
		%feature("autodoc", "	* Add an elementary Matrix in the assembly Matrix if Dependence(Dimension1,Dimension2) is False

	:param Element:
	:type Element: Standard_Integer
	:param Dimension1:
	:type Dimension1: Standard_Integer
	:param Dimension2:
	:type Dimension2: Standard_Integer
	:param Mat:
	:type Mat: math_Matrix &
	:rtype: None
") AddMatrix;
		void AddMatrix (const Standard_Integer Element,const Standard_Integer Dimension1,const Standard_Integer Dimension2,const math_Matrix & Mat);
		%feature("autodoc", "	* Nullify all Coordinate of assembly Vector (second member)

	:rtype: None
") NullifyVector;
		void NullifyVector ();
		%feature("autodoc", "	* Add an elementary Vector in the assembly Vector (second member)

	:param Element:
	:type Element: Standard_Integer
	:param Dimension:
	:type Dimension: Standard_Integer
	:param Vec:
	:type Vec: math_Vector &
	:rtype: None
") AddVector;
		void AddVector (const Standard_Integer Element,const Standard_Integer Dimension,const math_Vector & Vec);
		%feature("autodoc", "	* Delete all Constraints.

	:rtype: None
") ResetConstraint;
		void ResetConstraint ();
		%feature("autodoc", "	* Nullify all Constraints.

	:rtype: None
") NullifyConstraint;
		void NullifyConstraint ();
		%feature("autodoc", "	:param IndexofConstraint:
	:type IndexofConstraint: Standard_Integer
	:param Element:
	:type Element: Standard_Integer
	:param Dimension:
	:type Dimension: Standard_Integer
	:param LinearForm:
	:type LinearForm: math_Vector &
	:param Value:
	:type Value: float
	:rtype: None
") AddConstraint;
		void AddConstraint (const Standard_Integer IndexofConstraint,const Standard_Integer Element,const Standard_Integer Dimension,const math_Vector & LinearForm,const Standard_Real Value);
		%feature("autodoc", "	* Solve the assembly system Returns Standard_False if the computation failed.

	:rtype: bool
") Solve;
		Standard_Boolean Solve ();
		%feature("autodoc", "	:param Solution:
	:type Solution: math_Vector &
	:rtype: None
") Solution;
		void Solution (math_Vector & Solution);
		%feature("autodoc", "	:rtype: int
") NbGlobVar;
		Standard_Integer NbGlobVar ();
		%feature("autodoc", "	:param AssTable:
	:type AssTable: Handle_FEmTool_HAssemblyTable &
	:rtype: None
") GetAssemblyTable;
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
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") FEmTool_AssemblyTable;
		 FEmTool_AssemblyTable (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_TColStd_HArray1OfInteger &
	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") FEmTool_AssemblyTable;
		 FEmTool_AssemblyTable (const Handle_TColStd_HArray1OfInteger & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param V:
	:type V: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") Init;
		void Init (const Handle_TColStd_HArray1OfInteger & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:param Other:
	:type Other: FEmTool_AssemblyTable &
	:rtype: FEmTool_AssemblyTable
") Assign;
		const FEmTool_AssemblyTable & Assign (const FEmTool_AssemblyTable & Other);
		%feature("autodoc", "	:param Other:
	:type Other: FEmTool_AssemblyTable &
	:rtype: FEmTool_AssemblyTable
") operator=;
		const FEmTool_AssemblyTable & operator = (const FEmTool_AssemblyTable & Other);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_TColStd_HArray1OfInteger & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_TColStd_HArray1OfInteger
") Value;
		const Handle_TColStd_HArray1OfInteger & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_TColStd_HArray1OfInteger
") ChangeValue;
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
		%feature("autodoc", "	:param Dimension:
	:type Dimension: Standard_Integer
	:param NbElements:
	:type NbElements: Standard_Integer
	:param TheBase:
	:type TheBase: Handle_PLib_Base &
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") FEmTool_Curve;
		 FEmTool_Curve (const Standard_Integer Dimension,const Standard_Integer NbElements,const Handle_PLib_Base & TheBase,const Standard_Real Tolerance);
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") Knots;
		TColStd_Array1OfReal & Knots ();
		%feature("autodoc", "	:param IndexOfElement:
	:type IndexOfElement: Standard_Integer
	:param Coeffs:
	:type Coeffs: TColStd_Array2OfReal &
	:rtype: None
") SetElement;
		void SetElement (const Standard_Integer IndexOfElement,const TColStd_Array2OfReal & Coeffs);
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pnt:
	:type Pnt: TColStd_Array1OfReal &
	:rtype: None
") D0;
		void D0 (const Standard_Real U,TColStd_Array1OfReal & Pnt);
		%feature("autodoc", "	:param U:
	:type U: float
	:param Vec:
	:type Vec: TColStd_Array1OfReal &
	:rtype: None
") D1;
		void D1 (const Standard_Real U,TColStd_Array1OfReal & Vec);
		%feature("autodoc", "	:param U:
	:type U: float
	:param Vec:
	:type Vec: TColStd_Array1OfReal &
	:rtype: None
") D2;
		void D2 (const Standard_Real U,TColStd_Array1OfReal & Vec);
		%feature("autodoc", "	:param FirstU:
	:type FirstU: float
	:param LastU:
	:type LastU: float
	:param Length:
	:type Length: float &
	:rtype: None
") Length;
		void Length (const Standard_Real FirstU,const Standard_Real LastU,Standard_Real &OutValue);
		%feature("autodoc", "	:param IndexOfElement:
	:type IndexOfElement: Standard_Integer
	:param Coeffs:
	:type Coeffs: TColStd_Array2OfReal &
	:rtype: None
") GetElement;
		void GetElement (const Standard_Integer IndexOfElement,TColStd_Array2OfReal & Coeffs);
		%feature("autodoc", "	* returns coefficients of all elements in canonical base.

	:param Coeffs:
	:type Coeffs: TColStd_Array1OfReal &
	:rtype: None
") GetPolynom;
		void GetPolynom (TColStd_Array1OfReal & Coeffs);
		%feature("autodoc", "	:rtype: int
") NbElements;
		Standard_Integer NbElements ();
		%feature("autodoc", "	:rtype: int
") Dimension;
		Standard_Integer Dimension ();
		%feature("autodoc", "	:rtype: Handle_PLib_Base
") Base;
		Handle_PLib_Base Base ();
		%feature("autodoc", "	:param IndexOfElement:
	:type IndexOfElement: Standard_Integer
	:rtype: int
") Degree;
		Standard_Integer Degree (const Standard_Integer IndexOfElement);
		%feature("autodoc", "	:param IndexOfElement:
	:type IndexOfElement: Standard_Integer
	:param Degree:
	:type Degree: Standard_Integer
	:rtype: None
") SetDegree;
		void SetDegree (const Standard_Integer IndexOfElement,const Standard_Integer Degree);
		%feature("autodoc", "	:param IndexOfElement:
	:type IndexOfElement: Standard_Integer
	:param Tol:
	:type Tol: float
	:param NewDegree:
	:type NewDegree: Standard_Integer &
	:param MaxError:
	:type MaxError: float &
	:rtype: None
") ReduceDegree;
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
		%feature("autodoc", "	* Set the coefficient of the Element (the Curve)

	:param Coeff:
	:type Coeff: Handle_TColStd_HArray2OfReal &
	:rtype: None
") Set;
		void Set (const Handle_TColStd_HArray2OfReal & Coeff);
		%feature("autodoc", "	* Set the definition interval of the Element

	:param FirstKnot:
	:type FirstKnot: float
	:param LastKnot:
	:type LastKnot: float
	:rtype: void
") Set;
		virtual void Set (const Standard_Real FirstKnot,const Standard_Real LastKnot);
		%feature("autodoc", "	* To know if two dimension are independent.

	:rtype: Handle_TColStd_HArray2OfInteger
") DependenceTable;
		virtual Handle_TColStd_HArray2OfInteger DependenceTable ();
		%feature("autodoc", "	* To Compute J(E) where E is the current Element

	:rtype: float
") Value;
		virtual Standard_Real Value ();
		%feature("autodoc", "	* To Compute J(E) the coefficients of Hessian matrix of J(E) wich are crossed derivatives in dimensions <Dim1> and <Dim2>. If DependenceTable(Dimension1,Dimension2) is False

	:param Dim1:
	:type Dim1: Standard_Integer
	:param Dim2:
	:type Dim2: Standard_Integer
	:param H:
	:type H: math_Matrix &
	:rtype: void
") Hessian;
		virtual void Hessian (const Standard_Integer Dim1,const Standard_Integer Dim2,math_Matrix & H);
		%feature("autodoc", "	* To Compute the coefficients in the dimension <dim> of the J(E)'s Gradient where E is the current Element

	:param Dim:
	:type Dim: Standard_Integer
	:param G:
	:type G: math_Vector &
	:rtype: void
") Gradient;
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
		%feature("autodoc", "	:param TheBase:
	:type TheBase: Handle_PLib_Base &
	:param DerOrder:
	:type DerOrder: Standard_Integer
	:rtype: None
") FEmTool_ElementsOfRefMatrix;
		 FEmTool_ElementsOfRefMatrix (const Handle_PLib_Base & TheBase,const Standard_Integer DerOrder);
		%feature("autodoc", "	* returns the number of variables of the function. It is supposed that NbVariables = 1.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	* computes the values <F> of the functions for the variable <X>. returns True if the computation was done successfully, False otherwise. F contains results only for i<=j in following order: P0*P0, P0*P1, P0*P2... P1*P1, P1*P2,... (upper triangle of matrix {PiPj})

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
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
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") FEmTool_HAssemblyTable;
		 FEmTool_HAssemblyTable (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:param V:
	:type V: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") FEmTool_HAssemblyTable;
		 FEmTool_HAssemblyTable (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_TColStd_HArray1OfInteger & V);
		%feature("autodoc", "	:param V:
	:type V: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") Init;
		void Init (const Handle_TColStd_HArray1OfInteger & V);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_TColStd_HArray1OfInteger & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_TColStd_HArray1OfInteger
") Value;
		const Handle_TColStd_HArray1OfInteger & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_TColStd_HArray1OfInteger
") ChangeValue;
		Handle_TColStd_HArray1OfInteger & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:rtype: FEmTool_AssemblyTable
") Array2;
		const FEmTool_AssemblyTable & Array2 ();
		%feature("autodoc", "	:rtype: FEmTool_AssemblyTable
") ChangeArray2;
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
		%feature("autodoc", "	:rtype: None
") FEmTool_ListIteratorOfListOfVectors;
		 FEmTool_ListIteratorOfListOfVectors ();
		%feature("autodoc", "	:param L:
	:type L: FEmTool_ListOfVectors &
	:rtype: None
") FEmTool_ListIteratorOfListOfVectors;
		 FEmTool_ListIteratorOfListOfVectors (const FEmTool_ListOfVectors & L);
		%feature("autodoc", "	:param L:
	:type L: FEmTool_ListOfVectors &
	:rtype: None
") Initialize;
		void Initialize (const FEmTool_ListOfVectors & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: Handle_TColStd_HArray1OfReal &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") FEmTool_ListNodeOfListOfVectors;
		 FEmTool_ListNodeOfListOfVectors (const Handle_TColStd_HArray1OfReal & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Value;
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
		%feature("autodoc", "	:rtype: None
") FEmTool_ListOfVectors;
		 FEmTool_ListOfVectors ();
		%feature("autodoc", "	:param Other:
	:type Other: FEmTool_ListOfVectors &
	:rtype: None
") Assign;
		void Assign (const FEmTool_ListOfVectors & Other);
		%feature("autodoc", "	:param Other:
	:type Other: FEmTool_ListOfVectors &
	:rtype: None
") operator=;
		void operator = (const FEmTool_ListOfVectors & Other);
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
	:type I: Handle_TColStd_HArray1OfReal &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColStd_HArray1OfReal & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_TColStd_HArray1OfReal &
	:param theIt:
	:type theIt: FEmTool_ListIteratorOfListOfVectors &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColStd_HArray1OfReal & I,FEmTool_ListIteratorOfListOfVectors & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: FEmTool_ListOfVectors &
	:rtype: None
") Prepend;
		void Prepend (FEmTool_ListOfVectors & Other);
		%feature("autodoc", "	:param I:
	:type I: Handle_TColStd_HArray1OfReal &
	:rtype: None
") Append;
		void Append (const Handle_TColStd_HArray1OfReal & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_TColStd_HArray1OfReal &
	:param theIt:
	:type theIt: FEmTool_ListIteratorOfListOfVectors &
	:rtype: None
") Append;
		void Append (const Handle_TColStd_HArray1OfReal & I,FEmTool_ListIteratorOfListOfVectors & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: FEmTool_ListOfVectors &
	:rtype: None
") Append;
		void Append (FEmTool_ListOfVectors & Other);
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") First;
		Handle_TColStd_HArray1OfReal & First ();
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Last;
		Handle_TColStd_HArray1OfReal & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: FEmTool_ListIteratorOfListOfVectors &
	:rtype: None
") Remove;
		void Remove (FEmTool_ListIteratorOfListOfVectors & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_TColStd_HArray1OfReal &
	:param It:
	:type It: FEmTool_ListIteratorOfListOfVectors &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_TColStd_HArray1OfReal & I,FEmTool_ListIteratorOfListOfVectors & It);
		%feature("autodoc", "	:param Other:
	:type Other: FEmTool_ListOfVectors &
	:param It:
	:type It: FEmTool_ListIteratorOfListOfVectors &
	:rtype: None
") InsertBefore;
		void InsertBefore (FEmTool_ListOfVectors & Other,FEmTool_ListIteratorOfListOfVectors & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_TColStd_HArray1OfReal &
	:param It:
	:type It: FEmTool_ListIteratorOfListOfVectors &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_TColStd_HArray1OfReal & I,FEmTool_ListIteratorOfListOfVectors & It);
		%feature("autodoc", "	:param Other:
	:type Other: FEmTool_ListOfVectors &
	:param It:
	:type It: FEmTool_ListIteratorOfListOfVectors &
	:rtype: None
") InsertAfter;
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
		%feature("autodoc", "	:rtype: None
") FEmTool_SeqOfLinConstr;
		 FEmTool_SeqOfLinConstr ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: FEmTool_SeqOfLinConstr &
	:rtype: FEmTool_SeqOfLinConstr
") Assign;
		const FEmTool_SeqOfLinConstr & Assign (const FEmTool_SeqOfLinConstr & Other);
		%feature("autodoc", "	:param Other:
	:type Other: FEmTool_SeqOfLinConstr &
	:rtype: FEmTool_SeqOfLinConstr
") operator=;
		const FEmTool_SeqOfLinConstr & operator = (const FEmTool_SeqOfLinConstr & Other);
		%feature("autodoc", "	:param T:
	:type T: FEmTool_ListOfVectors &
	:rtype: None
") Append;
		void Append (const FEmTool_ListOfVectors & T);
		%feature("autodoc", "	:param S:
	:type S: FEmTool_SeqOfLinConstr &
	:rtype: None
") Append;
		void Append (FEmTool_SeqOfLinConstr & S);
		%feature("autodoc", "	:param T:
	:type T: FEmTool_ListOfVectors &
	:rtype: None
") Prepend;
		void Prepend (const FEmTool_ListOfVectors & T);
		%feature("autodoc", "	:param S:
	:type S: FEmTool_SeqOfLinConstr &
	:rtype: None
") Prepend;
		void Prepend (FEmTool_SeqOfLinConstr & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: FEmTool_ListOfVectors &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const FEmTool_ListOfVectors & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: FEmTool_SeqOfLinConstr &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,FEmTool_SeqOfLinConstr & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: FEmTool_ListOfVectors &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const FEmTool_ListOfVectors & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: FEmTool_SeqOfLinConstr &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,FEmTool_SeqOfLinConstr & S);
		%feature("autodoc", "	:rtype: FEmTool_ListOfVectors
") First;
		const FEmTool_ListOfVectors & First ();
		%feature("autodoc", "	:rtype: FEmTool_ListOfVectors
") Last;
		const FEmTool_ListOfVectors & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: FEmTool_SeqOfLinConstr &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,FEmTool_SeqOfLinConstr & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: FEmTool_ListOfVectors
") Value;
		const FEmTool_ListOfVectors & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: FEmTool_ListOfVectors &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const FEmTool_ListOfVectors & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: FEmTool_ListOfVectors
") ChangeValue;
		FEmTool_ListOfVectors & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	:param I:
	:type I: FEmTool_ListOfVectors &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") FEmTool_SequenceNodeOfSeqOfLinConstr;
		 FEmTool_SequenceNodeOfSeqOfLinConstr (const FEmTool_ListOfVectors & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: FEmTool_ListOfVectors
") Value;
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
		%feature("autodoc", "	:param Value:
	:type Value: float
	:rtype: void
") Init;
		virtual void Init (const Standard_Real Value);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param J:
	:type J: Standard_Integer
	:rtype: float
") ChangeValue;
		virtual Standard_Real & ChangeValue (const Standard_Integer I,const Standard_Integer J);
		%feature("autodoc", "	* To make a Factorization of <self>

	:rtype: bool
") Decompose;
		virtual Standard_Boolean Decompose ();
		%feature("autodoc", "	* Direct Solve of AX = B

	:param B:
	:type B: math_Vector &
	:param X:
	:type X: math_Vector &
	:rtype: void
") Solve;
		virtual void Solve (const math_Vector & B,math_Vector & X);
		%feature("autodoc", "	* Make Preparation to iterative solve

	:rtype: bool
") Prepare;
		virtual Standard_Boolean Prepare ();
		%feature("autodoc", "	* Iterative solve of AX = B

	:param B:
	:type B: math_Vector &
	:param Init:
	:type Init: math_Vector &
	:param X:
	:type X: math_Vector &
	:param Residual:
	:type Residual: math_Vector &
	:param Tolerance: default value is 1.0e-8
	:type Tolerance: float
	:param NbIterations: default value is 50
	:type NbIterations: Standard_Integer
	:rtype: void
") Solve;
		virtual void Solve (const math_Vector & B,const math_Vector & Init,math_Vector & X,math_Vector & Residual,const Standard_Real Tolerance = 1.0e-8,const Standard_Integer NbIterations = 50);
		%feature("autodoc", "	* returns the product of a SparseMatrix by a vector. An exception is raised if the dimensions are different

	:param X:
	:type X: math_Vector &
	:param MX:
	:type MX: math_Vector &
	:rtype: void
") Multiplied;
		virtual void Multiplied (const math_Vector & X,math_Vector & MX);
		%feature("autodoc", "	* returns the row range of a matrix.

	:rtype: int
") RowNumber;
		virtual Standard_Integer RowNumber ();
		%feature("autodoc", "	* returns the column range of the matrix.

	:rtype: int
") ColNumber;
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
		%feature("autodoc", "	:param WorkDegree:
	:type WorkDegree: Standard_Integer
	:param ConstraintOrder:
	:type ConstraintOrder: GeomAbs_Shape
	:rtype: None
") FEmTool_LinearFlexion;
		 FEmTool_LinearFlexion (const Standard_Integer WorkDegree,const GeomAbs_Shape ConstraintOrder);
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray2OfInteger
") DependenceTable;
		virtual Handle_TColStd_HArray2OfInteger DependenceTable ();
		%feature("autodoc", "	:rtype: float
") Value;
		virtual Standard_Real Value ();
		%feature("autodoc", "	:param Dimension1:
	:type Dimension1: Standard_Integer
	:param Dimension2:
	:type Dimension2: Standard_Integer
	:param H:
	:type H: math_Matrix &
	:rtype: void
") Hessian;
		virtual void Hessian (const Standard_Integer Dimension1,const Standard_Integer Dimension2,math_Matrix & H);
		%feature("autodoc", "	:param Dimension:
	:type Dimension: Standard_Integer
	:param G:
	:type G: math_Vector &
	:rtype: void
") Gradient;
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
		%feature("autodoc", "	:param WorkDegree:
	:type WorkDegree: Standard_Integer
	:param ConstraintOrder:
	:type ConstraintOrder: GeomAbs_Shape
	:rtype: None
") FEmTool_LinearJerk;
		 FEmTool_LinearJerk (const Standard_Integer WorkDegree,const GeomAbs_Shape ConstraintOrder);
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray2OfInteger
") DependenceTable;
		virtual Handle_TColStd_HArray2OfInteger DependenceTable ();
		%feature("autodoc", "	:rtype: float
") Value;
		virtual Standard_Real Value ();
		%feature("autodoc", "	:param Dimension1:
	:type Dimension1: Standard_Integer
	:param Dimension2:
	:type Dimension2: Standard_Integer
	:param H:
	:type H: math_Matrix &
	:rtype: void
") Hessian;
		virtual void Hessian (const Standard_Integer Dimension1,const Standard_Integer Dimension2,math_Matrix & H);
		%feature("autodoc", "	:param Dimension:
	:type Dimension: Standard_Integer
	:param G:
	:type G: math_Vector &
	:rtype: void
") Gradient;
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
		%feature("autodoc", "	:param WorkDegree:
	:type WorkDegree: Standard_Integer
	:param ConstraintOrder:
	:type ConstraintOrder: GeomAbs_Shape
	:rtype: None
") FEmTool_LinearTension;
		 FEmTool_LinearTension (const Standard_Integer WorkDegree,const GeomAbs_Shape ConstraintOrder);
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray2OfInteger
") DependenceTable;
		virtual Handle_TColStd_HArray2OfInteger DependenceTable ();
		%feature("autodoc", "	:rtype: float
") Value;
		virtual Standard_Real Value ();
		%feature("autodoc", "	:param Dimension1:
	:type Dimension1: Standard_Integer
	:param Dimension2:
	:type Dimension2: Standard_Integer
	:param H:
	:type H: math_Matrix &
	:rtype: void
") Hessian;
		virtual void Hessian (const Standard_Integer Dimension1,const Standard_Integer Dimension2,math_Matrix & H);
		%feature("autodoc", "	:param Dimension:
	:type Dimension: Standard_Integer
	:param G:
	:type G: math_Vector &
	:rtype: void
") Gradient;
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
		%feature("autodoc", "	:param FirstIndexes:
	:type FirstIndexes: TColStd_Array1OfInteger &
	:rtype: None
") FEmTool_ProfileMatrix;
		 FEmTool_ProfileMatrix (const TColStd_Array1OfInteger & FirstIndexes);
		%feature("autodoc", "	:param Value:
	:type Value: float
	:rtype: None
") Init;
		void Init (const Standard_Real Value);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param J:
	:type J: Standard_Integer
	:rtype: float
") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer I,const Standard_Integer J);
		%feature("autodoc", "	* To make a Factorization of <self>

	:rtype: bool
") Decompose;
		Standard_Boolean Decompose ();
		%feature("autodoc", "	* Direct Solve of AX = B

	:param B:
	:type B: math_Vector &
	:param X:
	:type X: math_Vector &
	:rtype: None
") Solve;
		void Solve (const math_Vector & B,math_Vector & X);
		%feature("autodoc", "	* Make Preparation to iterative solve

	:rtype: bool
") Prepare;
		Standard_Boolean Prepare ();
		%feature("autodoc", "	* Iterative solve of AX = B

	:param B:
	:type B: math_Vector &
	:param Init:
	:type Init: math_Vector &
	:param X:
	:type X: math_Vector &
	:param Residual:
	:type Residual: math_Vector &
	:param Tolerance: default value is 1.0e-8
	:type Tolerance: float
	:param NbIterations: default value is 50
	:type NbIterations: Standard_Integer
	:rtype: None
") Solve;
		void Solve (const math_Vector & B,const math_Vector & Init,math_Vector & X,math_Vector & Residual,const Standard_Real Tolerance = 1.0e-8,const Standard_Integer NbIterations = 50);
		%feature("autodoc", "	* returns the product of a SparseMatrix by a vector. An exception is raised if the dimensions are different

	:param X:
	:type X: math_Vector &
	:param MX:
	:type MX: math_Vector &
	:rtype: None
") Multiplied;
		void Multiplied (const math_Vector & X,math_Vector & MX);
		%feature("autodoc", "	* returns the row range of a matrix.

	:rtype: int
") RowNumber;
		Standard_Integer RowNumber ();
		%feature("autodoc", "	* returns the column range of the matrix.

	:rtype: int
") ColNumber;
		Standard_Integer ColNumber ();
		%feature("autodoc", "	:param i:
	:type i: Standard_Integer
	:param j:
	:type j: Standard_Integer
	:rtype: bool
") IsInProfile;
		Standard_Boolean IsInProfile (const Standard_Integer i,const Standard_Integer j);
		%feature("autodoc", "	:rtype: None
") OutM;
		void OutM ();
		%feature("autodoc", "	:rtype: None
") OutS;
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

