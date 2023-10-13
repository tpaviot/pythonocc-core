/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.7.0/refman/html/package_femtool.html"
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
%include ../common/EnumTemplates.i
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

/* python proxy classes for enums */
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
		/**** md5 signature: 96158227d814599b3ae02105b166f5e2 ****/
		%feature("compactdefaultargs") FEmTool_Assembly;
		%feature("autodoc", "
Parameters
----------
Dependence: TColStd_Array2OfInteger
Table: FEmTool_HAssemblyTable

Return
-------
None

Description
-----------
No available documentation.
") FEmTool_Assembly;
		 FEmTool_Assembly(const TColStd_Array2OfInteger & Dependence, const opencascade::handle<FEmTool_HAssemblyTable> & Table);

		/****************** AddConstraint ******************/
		/**** md5 signature: fe883dd81a9c291c56ac1a29315527a8 ****/
		%feature("compactdefaultargs") AddConstraint;
		%feature("autodoc", "
Parameters
----------
IndexofConstraint: int
Element: int
Dimension: int
LinearForm: math_Vector
Value: float

Return
-------
None

Description
-----------
No available documentation.
") AddConstraint;
		void AddConstraint(const Standard_Integer IndexofConstraint, const Standard_Integer Element, const Standard_Integer Dimension, const math_Vector & LinearForm, const Standard_Real Value);

		/****************** AddMatrix ******************/
		/**** md5 signature: 8b037ebf1f406ea6c4b7327cc705fbd8 ****/
		%feature("compactdefaultargs") AddMatrix;
		%feature("autodoc", "
Parameters
----------
Element: int
Dimension1: int
Dimension2: int
Mat: math_Matrix

Return
-------
None

Description
-----------
Add an elementary matrix in the assembly matrix if dependence(dimension1,dimension2) is false.
") AddMatrix;
		void AddMatrix(const Standard_Integer Element, const Standard_Integer Dimension1, const Standard_Integer Dimension2, const math_Matrix & Mat);

		/****************** AddVector ******************/
		/**** md5 signature: 1675a62ff93b728407cced1b0f033e74 ****/
		%feature("compactdefaultargs") AddVector;
		%feature("autodoc", "
Parameters
----------
Element: int
Dimension: int
Vec: math_Vector

Return
-------
None

Description
-----------
Add an elementary vector in the assembly vector (second member).
") AddVector;
		void AddVector(const Standard_Integer Element, const Standard_Integer Dimension, const math_Vector & Vec);

		/****************** GetAssemblyTable ******************/
		/**** md5 signature: b5866dc87b64fa0dc5b97604a67c6735 ****/
		%feature("compactdefaultargs") GetAssemblyTable;
		%feature("autodoc", "
Parameters
----------
AssTable: FEmTool_HAssemblyTable

Return
-------
None

Description
-----------
No available documentation.
") GetAssemblyTable;
		void GetAssemblyTable(opencascade::handle<FEmTool_HAssemblyTable> & AssTable);

		/****************** NbGlobVar ******************/
		/**** md5 signature: 77043715953538130b36cdac7f06debd ****/
		%feature("compactdefaultargs") NbGlobVar;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbGlobVar;
		Standard_Integer NbGlobVar();

		/****************** NullifyConstraint ******************/
		/**** md5 signature: 8a02cc6f24f02ea8b5980766fb0ed3c6 ****/
		%feature("compactdefaultargs") NullifyConstraint;
		%feature("autodoc", "Return
-------
None

Description
-----------
Nullify all constraints.
") NullifyConstraint;
		void NullifyConstraint();

		/****************** NullifyMatrix ******************/
		/**** md5 signature: 5c4b35bdd7a2222da7a43900236d464a ****/
		%feature("compactdefaultargs") NullifyMatrix;
		%feature("autodoc", "Return
-------
None

Description
-----------
Nullify all matrix 's coefficient.
") NullifyMatrix;
		void NullifyMatrix();

		/****************** NullifyVector ******************/
		/**** md5 signature: 6a2b113ced1eaa545dd17b600364545a ****/
		%feature("compactdefaultargs") NullifyVector;
		%feature("autodoc", "Return
-------
None

Description
-----------
Nullify all coordinate of assembly vector (second member).
") NullifyVector;
		void NullifyVector();

		/****************** ResetConstraint ******************/
		/**** md5 signature: 2f92b87d7e89be6b0033f11bdbdf7ac9 ****/
		%feature("compactdefaultargs") ResetConstraint;
		%feature("autodoc", "Return
-------
None

Description
-----------
Delete all constraints.
") ResetConstraint;
		void ResetConstraint();

		/****************** Solution ******************/
		/**** md5 signature: ccfe70d0030a1bcbffd9a7eee2ad8c39 ****/
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "
Parameters
----------
Solution: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") Solution;
		void Solution(math_Vector & Solution);

		/****************** Solve ******************/
		/**** md5 signature: 63b2aae3177e0f0ac1d5888b4a317c9e ****/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Solve the assembly system returns standard_false if the computation failed.
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
		/**** md5 signature: 036d699d11ca2c4b38b3954a971b2bf0 ****/
		%feature("compactdefaultargs") FEmTool_Curve;
		%feature("autodoc", "
Parameters
----------
Dimension: int
NbElements: int
TheBase: PLib_Base
Tolerance: float

Return
-------
None

Description
-----------
No available documentation.
") FEmTool_Curve;
		 FEmTool_Curve(const Standard_Integer Dimension, const Standard_Integer NbElements, const opencascade::handle<PLib_Base> & TheBase, const Standard_Real Tolerance);

		/****************** Base ******************/
		/**** md5 signature: 5e8735568e5cf4110e1444491c884633 ****/
		%feature("compactdefaultargs") Base;
		%feature("autodoc", "Return
-------
opencascade::handle<PLib_Base>

Description
-----------
No available documentation.
") Base;
		opencascade::handle<PLib_Base> Base();

		/****************** D0 ******************/
		/**** md5 signature: 9bcc691693e727a0fff20cf1285d9d8f ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
Pnt: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(const Standard_Real U, TColStd_Array1OfReal & Pnt);

		/****************** D1 ******************/
		/**** md5 signature: b6c1a087dc7557cc306803b19b81818f ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
Vec: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const Standard_Real U, TColStd_Array1OfReal & Vec);

		/****************** D2 ******************/
		/**** md5 signature: 918a75093a3b29c9bcd0227f26273523 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
Vec: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") D2;
		void D2(const Standard_Real U, TColStd_Array1OfReal & Vec);

		/****************** Degree ******************/
		/**** md5 signature: b4ef83894b79cff3b5925ccd3bfa0d9e ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "
Parameters
----------
IndexOfElement: int

Return
-------
int

Description
-----------
No available documentation.
") Degree;
		Standard_Integer Degree(const Standard_Integer IndexOfElement);

		/****************** Dimension ******************/
		/**** md5 signature: e4bdde894007391dd45dcb2fa38eb0af ****/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Dimension;
		Standard_Integer Dimension();

		/****************** GetElement ******************/
		/**** md5 signature: 6a80c458a643b77ade4b5622b1c1171e ****/
		%feature("compactdefaultargs") GetElement;
		%feature("autodoc", "
Parameters
----------
IndexOfElement: int
Coeffs: TColStd_Array2OfReal

Return
-------
None

Description
-----------
No available documentation.
") GetElement;
		void GetElement(const Standard_Integer IndexOfElement, TColStd_Array2OfReal & Coeffs);

		/****************** GetPolynom ******************/
		/**** md5 signature: f58deb6dd62e944d51b7487019f57fc6 ****/
		%feature("compactdefaultargs") GetPolynom;
		%feature("autodoc", "
Parameters
----------
Coeffs: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns coefficients of all elements in canonical base.
") GetPolynom;
		void GetPolynom(TColStd_Array1OfReal & Coeffs);

		/****************** Knots ******************/
		/**** md5 signature: fd96f5eb5fd759af9a801dddcaa133ac ****/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") Knots;
		TColStd_Array1OfReal & Knots();

		/****************** Length ******************/
		/**** md5 signature: 9ef39fbde69fcafa47832d47f14a7dc7 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
FirstU: float
LastU: float

Return
-------
Length: float

Description
-----------
No available documentation.
") Length;
		void Length(const Standard_Real FirstU, const Standard_Real LastU, Standard_Real &OutValue);

		/****************** NbElements ******************/
		/**** md5 signature: bda4abdd1e5bc28bcadae491494177fe ****/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbElements;
		Standard_Integer NbElements();

		/****************** ReduceDegree ******************/
		/**** md5 signature: 245851b83c4b2416c782eefdaf5f0600 ****/
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "
Parameters
----------
IndexOfElement: int
Tol: float

Return
-------
NewDegree: int
MaxError: float

Description
-----------
No available documentation.
") ReduceDegree;
		void ReduceDegree(const Standard_Integer IndexOfElement, const Standard_Real Tol, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** SetDegree ******************/
		/**** md5 signature: 54389e06937c1eb92c44f6d8ba7d04ed ****/
		%feature("compactdefaultargs") SetDegree;
		%feature("autodoc", "
Parameters
----------
IndexOfElement: int
Degree: int

Return
-------
None

Description
-----------
No available documentation.
") SetDegree;
		void SetDegree(const Standard_Integer IndexOfElement, const Standard_Integer Degree);

		/****************** SetElement ******************/
		/**** md5 signature: 7297777fe2f03bdaab85331cd948fca5 ****/
		%feature("compactdefaultargs") SetElement;
		%feature("autodoc", "
Parameters
----------
IndexOfElement: int
Coeffs: TColStd_Array2OfReal

Return
-------
None

Description
-----------
No available documentation.
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
		/**** md5 signature: c016d827aafaa774489e50229cf20da6 ****/
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfInteger>

Description
-----------
To know if two dimension are independent.
") DependenceTable;
		virtual opencascade::handle<TColStd_HArray2OfInteger> DependenceTable();

		/****************** Gradient ******************/
		/**** md5 signature: f7e2f4e4cbb2f3a1b60cabcc3ea6a2a2 ****/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
Dim: int
G: math_Vector

Return
-------
None

Description
-----------
To compute the coefficients in the dimension <dim> of the j(e)'s gradient where e is the current element.
") Gradient;
		virtual void Gradient(const Standard_Integer Dim, math_Vector & G);

		/****************** Hessian ******************/
		/**** md5 signature: afd9ce62ebfa0d84f7d2055f5de32ffd ****/
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", "
Parameters
----------
Dim1: int
Dim2: int
H: math_Matrix

Return
-------
None

Description
-----------
To compute j(e) the coefficients of hessian matrix of j(e) which are crossed derivatives in dimensions <dim1> and <dim2>. if dependencetable(dimension1,dimension2) is false.
") Hessian;
		virtual void Hessian(const Standard_Integer Dim1, const Standard_Integer Dim2, math_Matrix & H);

		/****************** Set ******************/
		/**** md5 signature: f291e68d252e2fa2d735922af9a10404 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Coeff: TColStd_HArray2OfReal

Return
-------
None

Description
-----------
Set the coefficient of the element (the curve).
") Set;
		void Set(const opencascade::handle<TColStd_HArray2OfReal> & Coeff);

		/****************** Set ******************/
		/**** md5 signature: 49c62dfc093e2f429d1422e9197e0f4a ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
FirstKnot: float
LastKnot: float

Return
-------
None

Description
-----------
Set the definition interval of the element.
") Set;
		virtual void Set(const Standard_Real FirstKnot, const Standard_Real LastKnot);

		/****************** Value ******************/
		/**** md5 signature: 6c8c41ee5ba5de549c3f50aa67613a94 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
To compute j(e) where e is the current element.
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
		/**** md5 signature: a440bdf11d4bef87b2c5a20125b17f87 ****/
		%feature("compactdefaultargs") FEmTool_ElementsOfRefMatrix;
		%feature("autodoc", "
Parameters
----------
TheBase: PLib_Base
DerOrder: int

Return
-------
None

Description
-----------
No available documentation.
") FEmTool_ElementsOfRefMatrix;
		 FEmTool_ElementsOfRefMatrix(const opencascade::handle<PLib_Base> & TheBase, const Standard_Integer DerOrder);

		/****************** NbEquations ******************/
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of equations of the function.
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of variables of the function. it is supposed that nbvariables = 1.
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise. f contains results only for i<=j in following order: p0*p0, p0*p1, p0*p2... p1*p1, p1*p2,... (upper triangle of matrix {pipj}).
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
		/**** md5 signature: 60190ec9f89d0f92be80ff89b41ab886 ****/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "
Parameters
----------
I: int
J: int

Return
-------
float

Description
-----------
No available documentation.
") ChangeValue;
		virtual Standard_Real & ChangeValue(const Standard_Integer I, const Standard_Integer J);

		/****************** ColNumber ******************/
		/**** md5 signature: 9199b384a5ac34cf234bbacc411828a9 ****/
		%feature("compactdefaultargs") ColNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the column range of the matrix.
") ColNumber;
		virtual Standard_Integer ColNumber();

		/****************** Decompose ******************/
		/**** md5 signature: c0a915c8fce68c1ae5c34262cf409e91 ****/
		%feature("compactdefaultargs") Decompose;
		%feature("autodoc", "Return
-------
bool

Description
-----------
To make a factorization of <self>.
") Decompose;
		virtual Standard_Boolean Decompose();

		/****************** Init ******************/
		/**** md5 signature: f3944f0e4b8afce50ed3f816b0c7fc58 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Value: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		virtual void Init(const Standard_Real Value);

		/****************** Multiplied ******************/
		/**** md5 signature: e2ecea8cb0f8e4dcb1808f8de3164f0c ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
MX: math_Vector

Return
-------
None

Description
-----------
Returns the product of a sparsematrix by a vector. an exception is raised if the dimensions are different.
") Multiplied;
		virtual void Multiplied(const math_Vector & X, math_Vector & MX);

		/****************** Prepare ******************/
		/**** md5 signature: 4e61eb6dd1d4aaab0b208edaf791c652 ****/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Make preparation to iterative solve.
") Prepare;
		virtual Standard_Boolean Prepare();

		/****************** RowNumber ******************/
		/**** md5 signature: 5019db809302667b5b261386638c73f7 ****/
		%feature("compactdefaultargs") RowNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the row range of a matrix.
") RowNumber;
		virtual Standard_Integer RowNumber();

		/****************** Solve ******************/
		/**** md5 signature: 664f6f787732ee0d185a9637206fc9e5 ****/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
B: math_Vector
X: math_Vector

Return
-------
None

Description
-----------
Direct solve of ax = b.
") Solve;
		virtual void Solve(const math_Vector & B, math_Vector & X);

		/****************** Solve ******************/
		/**** md5 signature: c0aa6353624cc667da06209e69715b7e ****/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
B: math_Vector
Init: math_Vector
X: math_Vector
Residual: math_Vector
Tolerance: float (optional, default to 1.0e-8)
NbIterations: int (optional, default to 50)

Return
-------
None

Description
-----------
Iterative solve of ax = b.
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
		/**** md5 signature: debd63e824b7d5551dbcb2f97560d688 ****/
		%feature("compactdefaultargs") FEmTool_LinearFlexion;
		%feature("autodoc", "
Parameters
----------
WorkDegree: int
ConstraintOrder: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") FEmTool_LinearFlexion;
		 FEmTool_LinearFlexion(const Standard_Integer WorkDegree, const GeomAbs_Shape ConstraintOrder);

		/****************** DependenceTable ******************/
		/**** md5 signature: 0752ec015464359dc6004796aed10eec ****/
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfInteger>

Description
-----------
No available documentation.
") DependenceTable;
		virtual opencascade::handle<TColStd_HArray2OfInteger> DependenceTable();

		/****************** Gradient ******************/
		/**** md5 signature: c0aba8dece3dba473a7ac4e2f3784d13 ****/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
Dimension: int
G: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") Gradient;
		virtual void Gradient(const Standard_Integer Dimension, math_Vector & G);

		/****************** Hessian ******************/
		/**** md5 signature: 874b143891a07798655bd7015200046a ****/
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", "
Parameters
----------
Dimension1: int
Dimension2: int
H: math_Matrix

Return
-------
None

Description
-----------
No available documentation.
") Hessian;
		virtual void Hessian(const Standard_Integer Dimension1, const Standard_Integer Dimension2, math_Matrix & H);

		/****************** Value ******************/
		/**** md5 signature: e502c3097b1969f1c34a7e76a839ac8b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
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
		/**** md5 signature: a63d1a8fafe3e1f87598a4a4f0810ae1 ****/
		%feature("compactdefaultargs") FEmTool_LinearJerk;
		%feature("autodoc", "
Parameters
----------
WorkDegree: int
ConstraintOrder: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") FEmTool_LinearJerk;
		 FEmTool_LinearJerk(const Standard_Integer WorkDegree, const GeomAbs_Shape ConstraintOrder);

		/****************** DependenceTable ******************/
		/**** md5 signature: 0752ec015464359dc6004796aed10eec ****/
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfInteger>

Description
-----------
No available documentation.
") DependenceTable;
		virtual opencascade::handle<TColStd_HArray2OfInteger> DependenceTable();

		/****************** Gradient ******************/
		/**** md5 signature: c0aba8dece3dba473a7ac4e2f3784d13 ****/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
Dimension: int
G: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") Gradient;
		virtual void Gradient(const Standard_Integer Dimension, math_Vector & G);

		/****************** Hessian ******************/
		/**** md5 signature: 874b143891a07798655bd7015200046a ****/
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", "
Parameters
----------
Dimension1: int
Dimension2: int
H: math_Matrix

Return
-------
None

Description
-----------
No available documentation.
") Hessian;
		virtual void Hessian(const Standard_Integer Dimension1, const Standard_Integer Dimension2, math_Matrix & H);

		/****************** Value ******************/
		/**** md5 signature: e502c3097b1969f1c34a7e76a839ac8b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
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
		/**** md5 signature: af4392b5b0da4abbc0fbcfd532d1e3bd ****/
		%feature("compactdefaultargs") FEmTool_LinearTension;
		%feature("autodoc", "
Parameters
----------
WorkDegree: int
ConstraintOrder: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") FEmTool_LinearTension;
		 FEmTool_LinearTension(const Standard_Integer WorkDegree, const GeomAbs_Shape ConstraintOrder);

		/****************** DependenceTable ******************/
		/**** md5 signature: 0752ec015464359dc6004796aed10eec ****/
		%feature("compactdefaultargs") DependenceTable;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfInteger>

Description
-----------
No available documentation.
") DependenceTable;
		virtual opencascade::handle<TColStd_HArray2OfInteger> DependenceTable();

		/****************** Gradient ******************/
		/**** md5 signature: c0aba8dece3dba473a7ac4e2f3784d13 ****/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
Dimension: int
G: math_Vector

Return
-------
None

Description
-----------
No available documentation.
") Gradient;
		virtual void Gradient(const Standard_Integer Dimension, math_Vector & G);

		/****************** Hessian ******************/
		/**** md5 signature: 874b143891a07798655bd7015200046a ****/
		%feature("compactdefaultargs") Hessian;
		%feature("autodoc", "
Parameters
----------
Dimension1: int
Dimension2: int
H: math_Matrix

Return
-------
None

Description
-----------
No available documentation.
") Hessian;
		virtual void Hessian(const Standard_Integer Dimension1, const Standard_Integer Dimension2, math_Matrix & H);

		/****************** Value ******************/
		/**** md5 signature: e502c3097b1969f1c34a7e76a839ac8b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
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
		/**** md5 signature: bc2f20075f7d7bc70e2fe7993b5149da ****/
		%feature("compactdefaultargs") FEmTool_ProfileMatrix;
		%feature("autodoc", "
Parameters
----------
FirstIndexes: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
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
		/**** md5 signature: 4bc4d89ce77beff94380a0a337894f80 ****/
		%feature("compactdefaultargs") ColNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the column range of the matrix.
") ColNumber;
		Standard_Integer ColNumber();

		/****************** Decompose ******************/
		/**** md5 signature: d359c0fb13839fc630dd774822bd449a ****/
		%feature("compactdefaultargs") Decompose;
		%feature("autodoc", "Return
-------
bool

Description
-----------
To make a factorization of <self>.
") Decompose;
		Standard_Boolean Decompose();

		/****************** Init ******************/
		/**** md5 signature: da86c6439d962bb56684d7ee024ea3ba ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Value: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Real Value);

		/****************** IsInProfile ******************/
		/**** md5 signature: 215884c12360c85645932da398e25891 ****/
		%feature("compactdefaultargs") IsInProfile;
		%feature("autodoc", "
Parameters
----------
i: int
j: int

Return
-------
bool

Description
-----------
No available documentation.
") IsInProfile;
		Standard_Boolean IsInProfile(const Standard_Integer i, const Standard_Integer j);

		/****************** Multiplied ******************/
		/**** md5 signature: 7df2604400224ca12c6e2b7669eebf52 ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
MX: math_Vector

Return
-------
None

Description
-----------
Returns the product of a sparsematrix by a vector. an exception is raised if the dimensions are different.
") Multiplied;
		void Multiplied(const math_Vector & X, math_Vector & MX);

		/****************** OutM ******************/
		/**** md5 signature: b0cb8109100bf4db2c14cc074b61b717 ****/
		%feature("compactdefaultargs") OutM;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") OutM;
		void OutM();

		/****************** OutS ******************/
		/**** md5 signature: ce362500a2cd63849a85260491dd46e6 ****/
		%feature("compactdefaultargs") OutS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") OutS;
		void OutS();

		/****************** Prepare ******************/
		/**** md5 signature: 980761b67c7a0b5bba03444f30b973d0 ****/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Make preparation to iterative solve.
") Prepare;
		Standard_Boolean Prepare();

		/****************** RowNumber ******************/
		/**** md5 signature: 165e3865ececf7b6bf1dbb8ad5afba49 ****/
		%feature("compactdefaultargs") RowNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the row range of a matrix.
") RowNumber;
		Standard_Integer RowNumber();

		/****************** Solve ******************/
		/**** md5 signature: 2d99f08a635594c7a8aa7f456cfc775a ****/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
B: math_Vector
X: math_Vector

Return
-------
None

Description
-----------
Direct solve of ax = b.
") Solve;
		void Solve(const math_Vector & B, math_Vector & X);

		/****************** Solve ******************/
		/**** md5 signature: 69d3a27f7cc289852f6ebd67497cf1dc ****/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
B: math_Vector
Init: math_Vector
X: math_Vector
Residual: math_Vector
Tolerance: float (optional, default to 1.0e-8)
NbIterations: int (optional, default to 50)

Return
-------
None

Description
-----------
Iterative solve of ax = b.
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
/* class aliases */
%pythoncode {
}
