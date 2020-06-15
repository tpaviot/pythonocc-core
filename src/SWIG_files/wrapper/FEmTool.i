/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
%define FEMTOOLDOCSTRING
"FEmTool module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_femtool.html"
%enddef
%module (package="OCC.Core", docstring=FEMTOOLDOCSTRING) FEmTool


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


%{
#include<FEmTool_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<math_module.hxx>
#include<PLib_module.hxx>
#include<GeomAbs_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import math.i
%import PLib.i
%import GeomAbs.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(FEmTool_Curve)
%wrap_handle(FEmTool_ElementaryCriterion)
%wrap_handle(FEmTool_SparseMatrix)
%wrap_handle(FEmTool_LinearFlexion)
%wrap_handle(FEmTool_LinearJerk)
%wrap_handle(FEmTool_LinearTension)
%wrap_handle(FEmTool_ProfileMatrix)
%wrap_handle(FEmTool_HAssemblyTable)
/* end handles declaration */

/* templates */
%template(FEmTool_AssemblyTable) NCollection_Array2<opencascade::handle<TColStd_HArray1OfInteger>>;
%template(FEmTool_ListIteratorOfListOfVectors) NCollection_TListIterator<opencascade::handle<TColStd_HArray1OfReal>>;
%template(FEmTool_ListOfVectors) NCollection_List<opencascade::handle<TColStd_HArray1OfReal>>;

%extend NCollection_List<opencascade::handle<TColStd_HArray1OfReal>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(FEmTool_SeqOfLinConstr) NCollection_Sequence<FEmTool_ListOfVectors>;

%extend NCollection_Sequence<FEmTool_ListOfVectors> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array2<opencascade::handle<TColStd_HArray1OfInteger>> FEmTool_AssemblyTable;
typedef NCollection_List<opencascade::handle<TColStd_HArray1OfReal>>::Iterator FEmTool_ListIteratorOfListOfVectors;
typedef NCollection_List<opencascade::handle<TColStd_HArray1OfReal>> FEmTool_ListOfVectors;
typedef NCollection_Sequence<FEmTool_ListOfVectors> FEmTool_SeqOfLinConstr;
/* end typedefs declaration */

/*************************
* class FEmTool_Assembly *
*************************/
class FEmTool_Assembly {
	public:
		/****************** FEmTool_Assembly ******************/
		%feature("compactdefaultargs") FEmTool_Assembly;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dependence: TColStd_Array2OfInteger
Table: FEmTool_HAssemblyTable

Returns
-------
None
") FEmTool_Assembly;
		 FEmTool_Assembly(const TColStd_Array2OfInteger & Dependence, const opencascade::handle<FEmTool_HAssemblyTable> & Table);

		/****************** AddConstraint ******************/
		%feature("compactdefaultargs") AddConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexofConstraint: int
Element: int
Dimension: int
LinearForm: math_Vector
Value: float

Returns
-------
None
") AddConstraint;
		void AddConstraint(const Standard_Integer IndexofConstraint, const Standard_Integer Element, const Standard_Integer Dimension, const math_Vector & LinearForm, const Standard_Real Value);

		/****************** AddMatrix ******************/
		%feature("compactdefaultargs") AddMatrix;
		%feature("autodoc", "Add an elementary matrix in the assembly matrix if dependence(dimension1,dimension2) is false.

Parameters
----------
Element: int
Dimension1: int
Dimension2: int
Mat: math_Matrix

Returns
-------
None
") AddMatrix;
		void AddMatrix(const Standard_Integer Element, const Standard_Integer Dimension1, const Standard_Integer Dimension2, const math_Matrix & Mat);

		/****************** AddVector ******************/
		%feature("compactdefaultargs") AddVector;
		%feature("autodoc", "Add an elementary vector in the assembly vector (second member).

Parameters
----------
Element: int
Dimension: int
Vec: math_Vector

Returns
-------
None
") AddVector;
		void AddVector(const Standard_Integer Element, const Standard_Integer Dimension, const math_Vector & Vec);

		/****************** GetAssemblyTable ******************/
		%feature("compactdefaultargs") GetAssemblyTable;
		%feature("autodoc", "No available documentation.

Parameters
----------
AssTable: FEmTool_HAssemblyTable

Returns
-------
None
") GetAssemblyTable;
		void GetAssemblyTable(opencascade::handle<FEmTool_HAssemblyTable> & AssTable);

		/****************** NbGlobVar ******************/
		%feature("compactdefaultargs") NbGlobVar;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbGlobVar;
		Standard_Integer NbGlobVar();

		/****************** NullifyConstraint ******************/
		%feature("compactdefaultargs") NullifyConstraint;
		%feature("autodoc", "Nullify all constraints.

Returns
-------
None
") NullifyConstraint;
		void NullifyConstraint();

		/****************** NullifyMatrix ******************/
		%feature("compactdefaultargs") NullifyMatrix;
		%feature("autodoc", "Nullify all matrix 's coefficient.

Returns
-------
None
") NullifyMatrix;
		void NullifyMatrix();

		/****************** NullifyVector ******************/
		%feature("compactdefaultargs") NullifyVector;
		%feature("autodoc", "Nullify all coordinate of assembly vector (second member).

Returns
-------
None
") NullifyVector;
		void NullifyVector();

		/****************** ResetConstraint ******************/
		%feature("compactdefaultargs") ResetConstraint;
		%feature("autodoc", "Delete all constraints.

Returns
-------
None
") ResetConstraint;
		void ResetConstraint();

		/****************** Solution ******************/
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "No available documentation.

Parameters
----------
Solution: math_Vector

Returns
-------
None
") Solution;
		void Solution(math_Vector & Solution);

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "Solve the assembly system returns standard_false if the computation failed.

Returns
-------
bool
") Solve;
		Standard_Boolean Solve();

};


%extend FEmTool_Assembly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class FEmTool_Curve *
**********************/
class FEmTool_Curve : public Standard_Transient {
	public:
		/****************** FEmTool_Curve ******************/
		%feature("compactdefaultargs") FEmTool_Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension: int
NbElements: int
TheBase: PLib_Base
Tolerance: float

Returns
-------
None
") FEmTool_Curve;
		 FEmTool_Curve(const Standard_Integer Dimension, const Standard_Integer NbElements, const opencascade::handle<PLib_Base> & TheBase, const Standard_Real Tolerance);

		/****************** Base ******************/
		%feature("compactdefaultargs") Base;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<PLib_Base>
") Base;
		opencascade::handle<PLib_Base> Base();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Pnt: TColStd_Array1OfReal

Returns
-------
None
") D0;
		void D0(const Standard_Real U, TColStd_Array1OfReal & Pnt);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Vec: TColStd_Array1OfReal

Returns
-------
None
") D1;
		void D1(const Standard_Real U, TColStd_Array1OfReal & Vec);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
Vec: TColStd_Array1OfReal

Returns
-------
None
") D2;
		void D2(const Standard_Real U, TColStd_Array1OfReal & Vec);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexOfElement: int

Returns
-------
int
") Degree;
		Standard_Integer Degree(const Standard_Integer IndexOfElement);

		/****************** Dimension ******************/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Dimension;
		Standard_Integer Dimension();

		/****************** GetElement ******************/
		%feature("compactdefaultargs") GetElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexOfElement: int
Coeffs: TColStd_Array2OfReal

Returns
-------
None
") GetElement;
		void GetElement(const Standard_Integer IndexOfElement, TColStd_Array2OfReal & Coeffs);

		/****************** GetPolynom ******************/
		%feature("compactdefaultargs") GetPolynom;
		%feature("autodoc", "Returns coefficients of all elements in canonical base.

Parameters
----------
Coeffs: TColStd_Array1OfReal

Returns
-------
None
") GetPolynom;
		void GetPolynom(TColStd_Array1OfReal & Coeffs);

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") Knots;
		TColStd_Array1OfReal & Knots();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "No available documentation.

Parameters
----------
FirstU: float
LastU: float

Returns
-------
Length: float
") Length;
		void Length(const Standard_Real FirstU, const Standard_Real LastU, Standard_Real &OutValue);

		/****************** NbElements ******************/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbElements;
		Standard_Integer NbElements();

		/****************** ReduceDegree ******************/
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexOfElement: int
Tol: float

Returns
-------
NewDegree: int
MaxError: float
") ReduceDegree;
		void ReduceDegree(const Standard_Integer IndexOfElement, const Standard_Real Tol, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** SetDegree ******************/
		%feature("compactdefaultargs") SetDegree;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexOfElement: int
Degree: int

Returns
-------
None
") SetDegree;
		void SetDegree(const Standard_Integer IndexOfElement, const Standard_Integer Degree);

		/****************** SetElement ******************/
		%feature("compactdefaultargs") SetElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexOfElement: int
Coeffs: TColStd_Array2OfReal

Returns
-------
None
") SetElement;
		void SetElement(const Standard_Integer IndexOfElement, const TColStd_Array2OfReal & Coeffs);

};


%make_alias(FEmTool_Curve)

%extend FEmTool_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class FEmTool_ElementaryCriterion *
************************************/
%nodefaultctor FEmTool_ElementaryCriterion;
class FEmTool_ElementaryCriterion : public Standard_Transient {
	public:
		/****************** DependenceTable ******************/
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "To know if two dimension are independent.

Returns
-------
opencascade::handle<TColStd_HArray2OfInteger>
") DependenceTable;
		virtual opencascade::handle<TColStd_HArray2OfInteger> DependenceTable();

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "To compute the coefficients in the dimension <dim> of the j(e)'s gradient where e is the current element.

Parameters
----------
Dim: int
G: math_Vector

Returns
-------
None
") Gradient;
		virtual void Gradient(const Standard_Integer Dim, math_Vector & G);

		/****************** Hessian ******************/
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", "To compute j(e) the coefficients of hessian matrix of j(e) wich are crossed derivatives in dimensions <dim1> and <dim2>. if dependencetable(dimension1,dimension2) is false.

Parameters
----------
Dim1: int
Dim2: int
H: math_Matrix

Returns
-------
None
") Hessian;
		virtual void Hessian(const Standard_Integer Dim1, const Standard_Integer Dim2, math_Matrix & H);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set the coefficient of the element (the curve).

Parameters
----------
Coeff: TColStd_HArray2OfReal

Returns
-------
None
") Set;
		void Set(const opencascade::handle<TColStd_HArray2OfReal> & Coeff);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set the definition interval of the element.

Parameters
----------
FirstKnot: float
LastKnot: float

Returns
-------
None
") Set;
		virtual void Set(const Standard_Real FirstKnot, const Standard_Real LastKnot);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "To compute j(e) where e is the current element.

Returns
-------
float
") Value;
		virtual Standard_Real Value();

};


%make_alias(FEmTool_ElementaryCriterion)

%extend FEmTool_ElementaryCriterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class FEmTool_ElementsOfRefMatrix *
************************************/
class FEmTool_ElementsOfRefMatrix : public math_FunctionSet {
	public:
		/****************** FEmTool_ElementsOfRefMatrix ******************/
		%feature("compactdefaultargs") FEmTool_ElementsOfRefMatrix;
		%feature("autodoc", "No available documentation.

Parameters
----------
TheBase: PLib_Base
DerOrder: int

Returns
-------
None
") FEmTool_ElementsOfRefMatrix;
		 FEmTool_ElementsOfRefMatrix(const opencascade::handle<PLib_Base> & TheBase, const Standard_Integer DerOrder);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function. it is supposed that nbvariables = 1.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise. f contains results only for i<=j in following order: p0*p0, p0*p1, p0*p2... p1*p1, p1*p2,... (upper triangle of matrix {pipj}).

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

};


%extend FEmTool_ElementsOfRefMatrix {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class FEmTool_SparseMatrix *
*****************************/
%nodefaultctor FEmTool_SparseMatrix;
class FEmTool_SparseMatrix : public Standard_Transient {
	public:
		/****************** ChangeValue ******************/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
J: int

Returns
-------
float
") ChangeValue;
		virtual Standard_Real & ChangeValue(const Standard_Integer I, const Standard_Integer J);

		/****************** ColNumber ******************/
		%feature("compactdefaultargs") ColNumber;
		%feature("autodoc", "Returns the column range of the matrix.

Returns
-------
int
") ColNumber;
		virtual Standard_Integer ColNumber();

		/****************** Decompose ******************/
		%feature("compactdefaultargs") Decompose;
		%feature("autodoc", "To make a factorization of <self>.

Returns
-------
bool
") Decompose;
		virtual Standard_Boolean Decompose();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Value: float

Returns
-------
None
") Init;
		virtual void Init(const Standard_Real Value);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Returns the product of a sparsematrix by a vector. an exception is raised if the dimensions are different.

Parameters
----------
X: math_Vector
MX: math_Vector

Returns
-------
None
") Multiplied;
		virtual void Multiplied(const math_Vector & X, math_Vector & MX);

		/****************** Prepare ******************/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "Make preparation to iterative solve.

Returns
-------
bool
") Prepare;
		virtual Standard_Boolean Prepare();

		/****************** RowNumber ******************/
		%feature("compactdefaultargs") RowNumber;
		%feature("autodoc", "Returns the row range of a matrix.

Returns
-------
int
") RowNumber;
		virtual Standard_Integer RowNumber();

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "Direct solve of ax = b.

Parameters
----------
B: math_Vector
X: math_Vector

Returns
-------
None
") Solve;
		virtual void Solve(const math_Vector & B, math_Vector & X);

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "Iterative solve of ax = b.

Parameters
----------
B: math_Vector
Init: math_Vector
X: math_Vector
Residual: math_Vector
Tolerance: float,optional
	default value is 1.0e-8
NbIterations: int,optional
	default value is 50

Returns
-------
None
") Solve;
		virtual void Solve(const math_Vector & B, const math_Vector & Init, math_Vector & X, math_Vector & Residual, const Standard_Real Tolerance = 1.0e-8, const Standard_Integer NbIterations = 50);

};


%make_alias(FEmTool_SparseMatrix)

%extend FEmTool_SparseMatrix {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class FEmTool_LinearFlexion *
******************************/
class FEmTool_LinearFlexion : public FEmTool_ElementaryCriterion {
	public:
		/****************** FEmTool_LinearFlexion ******************/
		%feature("compactdefaultargs") FEmTool_LinearFlexion;
		%feature("autodoc", "No available documentation.

Parameters
----------
WorkDegree: int
ConstraintOrder: GeomAbs_Shape

Returns
-------
None
") FEmTool_LinearFlexion;
		 FEmTool_LinearFlexion(const Standard_Integer WorkDegree, const GeomAbs_Shape ConstraintOrder);

		/****************** DependenceTable ******************/
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray2OfInteger>
") DependenceTable;
		virtual opencascade::handle<TColStd_HArray2OfInteger> DependenceTable();

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension: int
G: math_Vector

Returns
-------
None
") Gradient;
		virtual void Gradient(const Standard_Integer Dimension, math_Vector & G);

		/****************** Hessian ******************/
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension1: int
Dimension2: int
H: math_Matrix

Returns
-------
None
") Hessian;
		virtual void Hessian(const Standard_Integer Dimension1, const Standard_Integer Dimension2, math_Matrix & H);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Value;
		virtual Standard_Real Value();

};


%make_alias(FEmTool_LinearFlexion)

%extend FEmTool_LinearFlexion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class FEmTool_LinearJerk *
***************************/
class FEmTool_LinearJerk : public FEmTool_ElementaryCriterion {
	public:
		/****************** FEmTool_LinearJerk ******************/
		%feature("compactdefaultargs") FEmTool_LinearJerk;
		%feature("autodoc", "No available documentation.

Parameters
----------
WorkDegree: int
ConstraintOrder: GeomAbs_Shape

Returns
-------
None
") FEmTool_LinearJerk;
		 FEmTool_LinearJerk(const Standard_Integer WorkDegree, const GeomAbs_Shape ConstraintOrder);

		/****************** DependenceTable ******************/
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray2OfInteger>
") DependenceTable;
		virtual opencascade::handle<TColStd_HArray2OfInteger> DependenceTable();

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension: int
G: math_Vector

Returns
-------
None
") Gradient;
		virtual void Gradient(const Standard_Integer Dimension, math_Vector & G);

		/****************** Hessian ******************/
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension1: int
Dimension2: int
H: math_Matrix

Returns
-------
None
") Hessian;
		virtual void Hessian(const Standard_Integer Dimension1, const Standard_Integer Dimension2, math_Matrix & H);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Value;
		virtual Standard_Real Value();

};


%make_alias(FEmTool_LinearJerk)

%extend FEmTool_LinearJerk {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class FEmTool_LinearTension *
******************************/
class FEmTool_LinearTension : public FEmTool_ElementaryCriterion {
	public:
		/****************** FEmTool_LinearTension ******************/
		%feature("compactdefaultargs") FEmTool_LinearTension;
		%feature("autodoc", "No available documentation.

Parameters
----------
WorkDegree: int
ConstraintOrder: GeomAbs_Shape

Returns
-------
None
") FEmTool_LinearTension;
		 FEmTool_LinearTension(const Standard_Integer WorkDegree, const GeomAbs_Shape ConstraintOrder);

		/****************** DependenceTable ******************/
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HArray2OfInteger>
") DependenceTable;
		virtual opencascade::handle<TColStd_HArray2OfInteger> DependenceTable();

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension: int
G: math_Vector

Returns
-------
None
") Gradient;
		virtual void Gradient(const Standard_Integer Dimension, math_Vector & G);

		/****************** Hessian ******************/
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dimension1: int
Dimension2: int
H: math_Matrix

Returns
-------
None
") Hessian;
		virtual void Hessian(const Standard_Integer Dimension1, const Standard_Integer Dimension2, math_Matrix & H);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Value;
		virtual Standard_Real Value();

};


%make_alias(FEmTool_LinearTension)

%extend FEmTool_LinearTension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class FEmTool_ProfileMatrix *
******************************/
class FEmTool_ProfileMatrix : public FEmTool_SparseMatrix {
	public:
		/****************** FEmTool_ProfileMatrix ******************/
		%feature("compactdefaultargs") FEmTool_ProfileMatrix;
		%feature("autodoc", "No available documentation.

Parameters
----------
FirstIndexes: TColStd_Array1OfInteger

Returns
-------
None
") FEmTool_ProfileMatrix;
		 FEmTool_ProfileMatrix(const TColStd_Array1OfInteger & FirstIndexes);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeValue(const Standard_Integer I,const Standard_Integer J) {
            return (Standard_Real) $self->ChangeValue(I,J);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeValue(const Standard_Integer I,const Standard_Integer J,Standard_Real value) {
            $self->ChangeValue(I,J)=value;
            }
        };
		/****************** ColNumber ******************/
		%feature("compactdefaultargs") ColNumber;
		%feature("autodoc", "Returns the column range of the matrix.

Returns
-------
int
") ColNumber;
		Standard_Integer ColNumber();

		/****************** Decompose ******************/
		%feature("compactdefaultargs") Decompose;
		%feature("autodoc", "To make a factorization of <self>.

Returns
-------
bool
") Decompose;
		Standard_Boolean Decompose();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Value: float

Returns
-------
None
") Init;
		void Init(const Standard_Real Value);

		/****************** IsInProfile ******************/
		%feature("compactdefaultargs") IsInProfile;
		%feature("autodoc", "No available documentation.

Parameters
----------
i: int
j: int

Returns
-------
bool
") IsInProfile;
		Standard_Boolean IsInProfile(const Standard_Integer i, const Standard_Integer j);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Returns the product of a sparsematrix by a vector. an exception is raised if the dimensions are different.

Parameters
----------
X: math_Vector
MX: math_Vector

Returns
-------
None
") Multiplied;
		void Multiplied(const math_Vector & X, math_Vector & MX);

		/****************** OutM ******************/
		%feature("compactdefaultargs") OutM;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") OutM;
		void OutM();

		/****************** OutS ******************/
		%feature("compactdefaultargs") OutS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") OutS;
		void OutS();

		/****************** Prepare ******************/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "Make preparation to iterative solve.

Returns
-------
bool
") Prepare;
		Standard_Boolean Prepare();

		/****************** RowNumber ******************/
		%feature("compactdefaultargs") RowNumber;
		%feature("autodoc", "Returns the row range of a matrix.

Returns
-------
int
") RowNumber;
		Standard_Integer RowNumber();

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "Direct solve of ax = b.

Parameters
----------
B: math_Vector
X: math_Vector

Returns
-------
None
") Solve;
		void Solve(const math_Vector & B, math_Vector & X);

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "Iterative solve of ax = b.

Parameters
----------
B: math_Vector
Init: math_Vector
X: math_Vector
Residual: math_Vector
Tolerance: float,optional
	default value is 1.0e-8
NbIterations: int,optional
	default value is 50

Returns
-------
None
") Solve;
		void Solve(const math_Vector & B, const math_Vector & Init, math_Vector & X, math_Vector & Residual, const Standard_Real Tolerance = 1.0e-8, const Standard_Integer NbIterations = 50);

};


%make_alias(FEmTool_ProfileMatrix)

%extend FEmTool_ProfileMatrix {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
class FEmTool_HAssemblyTable : public FEmTool_AssemblyTable, public Standard_Transient {
  public:
    FEmTool_HAssemblyTable(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    FEmTool_HAssemblyTable(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const FEmTool_AssemblyTable::value_type& theValue);
    FEmTool_HAssemblyTable(const FEmTool_AssemblyTable& theOther);
    const FEmTool_AssemblyTable& Array2 ();
    FEmTool_AssemblyTable& ChangeArray2 (); 
};
%make_alias(FEmTool_HAssemblyTable)


/* hsequence classes */
