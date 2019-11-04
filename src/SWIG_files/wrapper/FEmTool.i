/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define FEMTOOLDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=FEMTOOLDOCSTRING) FEmTool

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%include FEmTool_headers.i

/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(FEmTool_Curve)
%wrap_handle(FEmTool_ElementaryCriterion)
%wrap_handle(FEmTool_SparseMatrix)
%wrap_handle(FEmTool_LinearFlexion)
%wrap_handle(FEmTool_LinearJerk)
%wrap_handle(FEmTool_LinearTension)
%wrap_handle(FEmTool_ProfileMatrix)
/* end handles declaration */

/* templates */
%template(FEmTool_AssemblyTable) NCollection_Array2 <opencascade::handle <TColStd_HArray1OfInteger>>;
%template(FEmTool_SeqOfLinConstr) NCollection_Sequence <FEmTool_ListOfVectors>;
%template(FEmTool_ListOfVectors) NCollection_List <opencascade::handle <TColStd_HArray1OfReal>>;
%template(FEmTool_ListIteratorOfListOfVectors) NCollection_TListIterator<opencascade::handle<TColStd_HArray1OfReal>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array2 <opencascade::handle <TColStd_HArray1OfInteger>> FEmTool_AssemblyTable;
typedef NCollection_Sequence <FEmTool_ListOfVectors> FEmTool_SeqOfLinConstr;
typedef NCollection_List <opencascade::handle <TColStd_HArray1OfReal>> FEmTool_ListOfVectors;
typedef NCollection_List <opencascade::handle <TColStd_HArray1OfReal>>::Iterator FEmTool_ListIteratorOfListOfVectors;
/* end typedefs declaration */

%nodefaultctor FEmTool_Assembly;
class FEmTool_Assembly {
	public:
		%feature("compactdefaultargs") AddConstraint;
		%feature("autodoc", "	:param IndexofConstraint:
	:type IndexofConstraint: int
	:param Element:
	:type Element: int
	:param Dimension:
	:type Dimension: int
	:param LinearForm:
	:type LinearForm: math_Vector &
	:param Value:
	:type Value: float
	:rtype: None
") AddConstraint;
		void AddConstraint (const Standard_Integer IndexofConstraint,const Standard_Integer Element,const Standard_Integer Dimension,const math_Vector & LinearForm,const Standard_Real Value);
		%feature("compactdefaultargs") AddMatrix;
		%feature("autodoc", "	* Add an elementary Matrix in the assembly Matrix if Dependence(Dimension1,Dimension2) is False

	:param Element:
	:type Element: int
	:param Dimension1:
	:type Dimension1: int
	:param Dimension2:
	:type Dimension2: int
	:param Mat:
	:type Mat: math_Matrix &
	:rtype: None
") AddMatrix;
		void AddMatrix (const Standard_Integer Element,const Standard_Integer Dimension1,const Standard_Integer Dimension2,const math_Matrix & Mat);
		%feature("compactdefaultargs") AddVector;
		%feature("autodoc", "	* Add an elementary Vector in the assembly Vector (second member)

	:param Element:
	:type Element: int
	:param Dimension:
	:type Dimension: int
	:param Vec:
	:type Vec: math_Vector &
	:rtype: None
") AddVector;
		void AddVector (const Standard_Integer Element,const Standard_Integer Dimension,const math_Vector & Vec);
		%feature("compactdefaultargs") FEmTool_Assembly;
		%feature("autodoc", "	:param Dependence:
	:type Dependence: TColStd_Array2OfInteger &
	:param Table:
	:type Table: opencascade::handle<FEmTool_HAssemblyTable> &
	:rtype: None
") FEmTool_Assembly;
		 FEmTool_Assembly (const TColStd_Array2OfInteger & Dependence,const opencascade::handle<FEmTool_HAssemblyTable> & Table);
		%feature("compactdefaultargs") GetAssemblyTable;
		%feature("autodoc", "	:param AssTable:
	:type AssTable: opencascade::handle<FEmTool_HAssemblyTable> &
	:rtype: None
") GetAssemblyTable;
		void GetAssemblyTable (opencascade::handle<FEmTool_HAssemblyTable> & AssTable);
		%feature("compactdefaultargs") NbGlobVar;
		%feature("autodoc", "	:rtype: int
") NbGlobVar;
		Standard_Integer NbGlobVar ();
		%feature("compactdefaultargs") NullifyConstraint;
		%feature("autodoc", "	* Nullify all Constraints.

	:rtype: None
") NullifyConstraint;
		void NullifyConstraint ();
		%feature("compactdefaultargs") NullifyMatrix;
		%feature("autodoc", "	* Nullify all Matrix 's Coefficient

	:rtype: None
") NullifyMatrix;
		void NullifyMatrix ();
		%feature("compactdefaultargs") NullifyVector;
		%feature("autodoc", "	* Nullify all Coordinate of assembly Vector (second member)

	:rtype: None
") NullifyVector;
		void NullifyVector ();
		%feature("compactdefaultargs") ResetConstraint;
		%feature("autodoc", "	* Delete all Constraints.

	:rtype: None
") ResetConstraint;
		void ResetConstraint ();
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "	:param Solution:
	:type Solution: math_Vector &
	:rtype: None
") Solution;
		void Solution (math_Vector & Solution);
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "	* Solve the assembly system Returns Standard_False if the computation failed.

	:rtype: bool
") Solve;
		Standard_Boolean Solve ();
};


%extend FEmTool_Assembly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FEmTool_Curve;
class FEmTool_Curve : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Base;
		%feature("autodoc", "	:rtype: opencascade::handle<PLib_Base>
") Base;
		opencascade::handle<PLib_Base> Base ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pnt:
	:type Pnt: TColStd_Array1OfReal &
	:rtype: None
") D0;
		void D0 (const Standard_Real U,TColStd_Array1OfReal & Pnt);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Vec:
	:type Vec: TColStd_Array1OfReal &
	:rtype: None
") D1;
		void D1 (const Standard_Real U,TColStd_Array1OfReal & Vec);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Vec:
	:type Vec: TColStd_Array1OfReal &
	:rtype: None
") D2;
		void D2 (const Standard_Real U,TColStd_Array1OfReal & Vec);
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:param IndexOfElement:
	:type IndexOfElement: int
	:rtype: int
") Degree;
		Standard_Integer Degree (const Standard_Integer IndexOfElement);
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "	:rtype: int
") Dimension;
		Standard_Integer Dimension ();
		%feature("compactdefaultargs") FEmTool_Curve;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param NbElements:
	:type NbElements: int
	:param TheBase:
	:type TheBase: opencascade::handle<PLib_Base> &
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") FEmTool_Curve;
		 FEmTool_Curve (const Standard_Integer Dimension,const Standard_Integer NbElements,const opencascade::handle<PLib_Base> & TheBase,const Standard_Real Tolerance);
		%feature("compactdefaultargs") GetElement;
		%feature("autodoc", "	:param IndexOfElement:
	:type IndexOfElement: int
	:param Coeffs:
	:type Coeffs: TColStd_Array2OfReal &
	:rtype: None
") GetElement;
		void GetElement (const Standard_Integer IndexOfElement,TColStd_Array2OfReal & Coeffs);
		%feature("compactdefaultargs") GetPolynom;
		%feature("autodoc", "	* returns coefficients of all elements in canonical base.

	:param Coeffs:
	:type Coeffs: TColStd_Array1OfReal &
	:rtype: None
") GetPolynom;
		void GetPolynom (TColStd_Array1OfReal & Coeffs);
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") Knots;
		TColStd_Array1OfReal & Knots ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:param FirstU:
	:type FirstU: float
	:param LastU:
	:type LastU: float
	:param Length:
	:type Length: float &
	:rtype: None
") Length;
		void Length (const Standard_Real FirstU,const Standard_Real LastU,Standard_Real &OutValue);
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "	:rtype: int
") NbElements;
		Standard_Integer NbElements ();
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "	:param IndexOfElement:
	:type IndexOfElement: int
	:param Tol:
	:type Tol: float
	:param NewDegree:
	:type NewDegree: int &
	:param MaxError:
	:type MaxError: float &
	:rtype: None
") ReduceDegree;
		void ReduceDegree (const Standard_Integer IndexOfElement,const Standard_Real Tol,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetDegree;
		%feature("autodoc", "	:param IndexOfElement:
	:type IndexOfElement: int
	:param Degree:
	:type Degree: int
	:rtype: None
") SetDegree;
		void SetDegree (const Standard_Integer IndexOfElement,const Standard_Integer Degree);
		%feature("compactdefaultargs") SetElement;
		%feature("autodoc", "	:param IndexOfElement:
	:type IndexOfElement: int
	:param Coeffs:
	:type Coeffs: TColStd_Array2OfReal &
	:rtype: None
") SetElement;
		void SetElement (const Standard_Integer IndexOfElement,const TColStd_Array2OfReal & Coeffs);
};


%make_alias(FEmTool_Curve)

%extend FEmTool_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FEmTool_ElementaryCriterion;
class FEmTool_ElementaryCriterion : public Standard_Transient {
	public:
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "	* To know if two dimension are independent.

	:rtype: opencascade::handle<TColStd_HArray2OfInteger>
") DependenceTable;
		virtual opencascade::handle<TColStd_HArray2OfInteger> DependenceTable ();
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	* To Compute the coefficients in the dimension <dim> of the J(E)'s Gradient where E is the current Element

	:param Dim:
	:type Dim: int
	:param G:
	:type G: math_Vector &
	:rtype: void
") Gradient;
		virtual void Gradient (const Standard_Integer Dim,math_Vector & G);
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", "	* To Compute J(E) the coefficients of Hessian matrix of J(E) wich are crossed derivatives in dimensions <Dim1> and <Dim2>. If DependenceTable(Dimension1,Dimension2) is False

	:param Dim1:
	:type Dim1: int
	:param Dim2:
	:type Dim2: int
	:param H:
	:type H: math_Matrix &
	:rtype: void
") Hessian;
		virtual void Hessian (const Standard_Integer Dim1,const Standard_Integer Dim2,math_Matrix & H);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set the coefficient of the Element (the Curve)

	:param Coeff:
	:type Coeff: opencascade::handle<TColStd_HArray2OfReal> &
	:rtype: None
") Set;
		void Set (const opencascade::handle<TColStd_HArray2OfReal> & Coeff);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set the definition interval of the Element

	:param FirstKnot:
	:type FirstKnot: float
	:param LastKnot:
	:type LastKnot: float
	:rtype: void
") Set;
		virtual void Set (const Standard_Real FirstKnot,const Standard_Real LastKnot);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* To Compute J(E) where E is the current Element

	:rtype: float
") Value;
		virtual Standard_Real Value ();
};


%make_alias(FEmTool_ElementaryCriterion)

%extend FEmTool_ElementaryCriterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FEmTool_ElementsOfRefMatrix;
class FEmTool_ElementsOfRefMatrix : public math_FunctionSet {
	public:
		%feature("compactdefaultargs") FEmTool_ElementsOfRefMatrix;
		%feature("autodoc", "	:param TheBase:
	:type TheBase: opencascade::handle<PLib_Base> &
	:param DerOrder:
	:type DerOrder: int
	:rtype: None
") FEmTool_ElementsOfRefMatrix;
		 FEmTool_ElementsOfRefMatrix (const opencascade::handle<PLib_Base> & TheBase,const Standard_Integer DerOrder);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* returns the number of variables of the function. It is supposed that NbVariables = 1.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the functions for the variable <X>. returns True if the computation was done successfully, False otherwise. F contains results only for i<=j in following order: P0*P0, P0*P1, P0*P2... P1*P1, P1*P2,... (upper triangle of matrix {PiPj})

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
};


%extend FEmTool_ElementsOfRefMatrix {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FEmTool_SparseMatrix;
class FEmTool_SparseMatrix : public Standard_Transient {
	public:
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param I:
	:type I: int
	:param J:
	:type J: int
	:rtype: float
") ChangeValue;
		virtual Standard_Real & ChangeValue (const Standard_Integer I,const Standard_Integer J);
		%feature("compactdefaultargs") ColNumber;
		%feature("autodoc", "	* returns the column range of the matrix.

	:rtype: int
") ColNumber;
		virtual Standard_Integer ColNumber ();
		%feature("compactdefaultargs") Decompose;
		%feature("autodoc", "	* To make a Factorization of <self>

	:rtype: bool
") Decompose;
		virtual Standard_Boolean Decompose ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Value:
	:type Value: float
	:rtype: void
") Init;
		virtual void Init (const Standard_Real Value);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* returns the product of a SparseMatrix by a vector. An exception is raised if the dimensions are different

	:param X:
	:type X: math_Vector &
	:param MX:
	:type MX: math_Vector &
	:rtype: void
") Multiplied;
		virtual void Multiplied (const math_Vector & X,math_Vector & MX);
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "	* Make Preparation to iterative solve

	:rtype: bool
") Prepare;
		virtual Standard_Boolean Prepare ();
		%feature("compactdefaultargs") RowNumber;
		%feature("autodoc", "	* returns the row range of a matrix.

	:rtype: int
") RowNumber;
		virtual Standard_Integer RowNumber ();
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "	* Direct Solve of AX = B

	:param B:
	:type B: math_Vector &
	:param X:
	:type X: math_Vector &
	:rtype: void
") Solve;
		virtual void Solve (const math_Vector & B,math_Vector & X);
		%feature("compactdefaultargs") Solve;
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
	:type NbIterations: int
	:rtype: void
") Solve;
		virtual void Solve (const math_Vector & B,const math_Vector & Init,math_Vector & X,math_Vector & Residual,const Standard_Real Tolerance = 1.0e-8,const Standard_Integer NbIterations = 50);
};


%make_alias(FEmTool_SparseMatrix)

%extend FEmTool_SparseMatrix {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FEmTool_LinearFlexion;
class FEmTool_LinearFlexion : public FEmTool_ElementaryCriterion {
	public:
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray2OfInteger>
") DependenceTable;
		virtual opencascade::handle<TColStd_HArray2OfInteger> DependenceTable ();
		%feature("compactdefaultargs") FEmTool_LinearFlexion;
		%feature("autodoc", "	:param WorkDegree:
	:type WorkDegree: int
	:param ConstraintOrder:
	:type ConstraintOrder: GeomAbs_Shape
	:rtype: None
") FEmTool_LinearFlexion;
		 FEmTool_LinearFlexion (const Standard_Integer WorkDegree,const GeomAbs_Shape ConstraintOrder);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param G:
	:type G: math_Vector &
	:rtype: void
") Gradient;
		virtual void Gradient (const Standard_Integer Dimension,math_Vector & G);
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", "	:param Dimension1:
	:type Dimension1: int
	:param Dimension2:
	:type Dimension2: int
	:param H:
	:type H: math_Matrix &
	:rtype: void
") Hessian;
		virtual void Hessian (const Standard_Integer Dimension1,const Standard_Integer Dimension2,math_Matrix & H);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: float
") Value;
		virtual Standard_Real Value ();
};


%make_alias(FEmTool_LinearFlexion)

%extend FEmTool_LinearFlexion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FEmTool_LinearJerk;
class FEmTool_LinearJerk : public FEmTool_ElementaryCriterion {
	public:
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray2OfInteger>
") DependenceTable;
		virtual opencascade::handle<TColStd_HArray2OfInteger> DependenceTable ();
		%feature("compactdefaultargs") FEmTool_LinearJerk;
		%feature("autodoc", "	:param WorkDegree:
	:type WorkDegree: int
	:param ConstraintOrder:
	:type ConstraintOrder: GeomAbs_Shape
	:rtype: None
") FEmTool_LinearJerk;
		 FEmTool_LinearJerk (const Standard_Integer WorkDegree,const GeomAbs_Shape ConstraintOrder);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param G:
	:type G: math_Vector &
	:rtype: void
") Gradient;
		virtual void Gradient (const Standard_Integer Dimension,math_Vector & G);
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", "	:param Dimension1:
	:type Dimension1: int
	:param Dimension2:
	:type Dimension2: int
	:param H:
	:type H: math_Matrix &
	:rtype: void
") Hessian;
		virtual void Hessian (const Standard_Integer Dimension1,const Standard_Integer Dimension2,math_Matrix & H);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: float
") Value;
		virtual Standard_Real Value ();
};


%make_alias(FEmTool_LinearJerk)

%extend FEmTool_LinearJerk {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FEmTool_LinearTension;
class FEmTool_LinearTension : public FEmTool_ElementaryCriterion {
	public:
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray2OfInteger>
") DependenceTable;
		virtual opencascade::handle<TColStd_HArray2OfInteger> DependenceTable ();
		%feature("compactdefaultargs") FEmTool_LinearTension;
		%feature("autodoc", "	:param WorkDegree:
	:type WorkDegree: int
	:param ConstraintOrder:
	:type ConstraintOrder: GeomAbs_Shape
	:rtype: None
") FEmTool_LinearTension;
		 FEmTool_LinearTension (const Standard_Integer WorkDegree,const GeomAbs_Shape ConstraintOrder);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param G:
	:type G: math_Vector &
	:rtype: void
") Gradient;
		virtual void Gradient (const Standard_Integer Dimension,math_Vector & G);
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", "	:param Dimension1:
	:type Dimension1: int
	:param Dimension2:
	:type Dimension2: int
	:param H:
	:type H: math_Matrix &
	:rtype: void
") Hessian;
		virtual void Hessian (const Standard_Integer Dimension1,const Standard_Integer Dimension2,math_Matrix & H);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: float
") Value;
		virtual Standard_Real Value ();
};


%make_alias(FEmTool_LinearTension)

%extend FEmTool_LinearTension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor FEmTool_ProfileMatrix;
class FEmTool_ProfileMatrix : public FEmTool_SparseMatrix {
	public:
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param I:
	:type I: int
	:param J:
	:type J: int
	:rtype: float
") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer I,const Standard_Integer J);
		%feature("compactdefaultargs") ColNumber;
		%feature("autodoc", "	* returns the column range of the matrix.

	:rtype: int
") ColNumber;
		Standard_Integer ColNumber ();
		%feature("compactdefaultargs") Decompose;
		%feature("autodoc", "	* To make a Factorization of <self>

	:rtype: bool
") Decompose;
		Standard_Boolean Decompose ();
		%feature("compactdefaultargs") FEmTool_ProfileMatrix;
		%feature("autodoc", "	:param FirstIndexes:
	:type FirstIndexes: TColStd_Array1OfInteger &
	:rtype: None
") FEmTool_ProfileMatrix;
		 FEmTool_ProfileMatrix (const TColStd_Array1OfInteger & FirstIndexes);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Value:
	:type Value: float
	:rtype: None
") Init;
		void Init (const Standard_Real Value);
		%feature("compactdefaultargs") IsInProfile;
		%feature("autodoc", "	:param i:
	:type i: int
	:param j:
	:type j: int
	:rtype: bool
") IsInProfile;
		Standard_Boolean IsInProfile (const Standard_Integer i,const Standard_Integer j);
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	* returns the product of a SparseMatrix by a vector. An exception is raised if the dimensions are different

	:param X:
	:type X: math_Vector &
	:param MX:
	:type MX: math_Vector &
	:rtype: None
") Multiplied;
		void Multiplied (const math_Vector & X,math_Vector & MX);
		%feature("compactdefaultargs") OutM;
		%feature("autodoc", "	:rtype: None
") OutM;
		void OutM ();
		%feature("compactdefaultargs") OutS;
		%feature("autodoc", "	:rtype: None
") OutS;
		void OutS ();
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "	* Make Preparation to iterative solve

	:rtype: bool
") Prepare;
		Standard_Boolean Prepare ();
		%feature("compactdefaultargs") RowNumber;
		%feature("autodoc", "	* returns the row range of a matrix.

	:rtype: int
") RowNumber;
		Standard_Integer RowNumber ();
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "	* Direct Solve of AX = B

	:param B:
	:type B: math_Vector &
	:param X:
	:type X: math_Vector &
	:rtype: None
") Solve;
		void Solve (const math_Vector & B,math_Vector & X);
		%feature("compactdefaultargs") Solve;
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
	:type NbIterations: int
	:rtype: None
") Solve;
		void Solve (const math_Vector & B,const math_Vector & Init,math_Vector & X,math_Vector & Residual,const Standard_Real Tolerance = 1.0e-8,const Standard_Integer NbIterations = 50);
};


%make_alias(FEmTool_ProfileMatrix)

%extend FEmTool_ProfileMatrix {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
%wrap_handle(FEmTool_HAssemblyTable)
class FEmTool_HAssemblyTable : public  FEmTool_AssemblyTable, public Standard_Transient {
  public:
    FEmTool_HAssemblyTable(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    FEmTool_HAssemblyTable(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  FEmTool_AssemblyTable::value_type& theValue);
    FEmTool_HAssemblyTable(const  FEmTool_AssemblyTable& theOther);
    const  FEmTool_AssemblyTable& Array2 ();
     FEmTool_AssemblyTable& ChangeArray2 (); 
};
%make_alias(FEmTool_HAssemblyTable)


/* harray2 class */
