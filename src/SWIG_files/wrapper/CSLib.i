/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define CSLIBDOCSTRING
"CSLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_cslib.html"
%enddef
%module (package="OCC.Core", docstring=CSLIBDOCSTRING) CSLib


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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<CSLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<math_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import math.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum CSLib_DerivativeStatus {
	CSLib_Done = 0,
	CSLib_D1uIsNull = 1,
	CSLib_D1vIsNull = 2,
	CSLib_D1IsNull = 3,
	CSLib_D1uD1vRatioIsNull = 4,
	CSLib_D1vD1uRatioIsNull = 5,
	CSLib_D1uIsParallelD1v = 6,
};

enum CSLib_NormalStatus {
	CSLib_Singular = 0,
	CSLib_Defined = 1,
	CSLib_InfinityOfSolutions = 2,
	CSLib_D1NuIsNull = 3,
	CSLib_D1NvIsNull = 4,
	CSLib_D1NIsNull = 5,
	CSLib_D1NuNvRatioIsNull = 6,
	CSLib_D1NvNuRatioIsNull = 7,
	CSLib_D1NuIsParallelD1Nv = 8,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class CSLib_DerivativeStatus(IntEnum):
	CSLib_Done = 0
	CSLib_D1uIsNull = 1
	CSLib_D1vIsNull = 2
	CSLib_D1IsNull = 3
	CSLib_D1uD1vRatioIsNull = 4
	CSLib_D1vD1uRatioIsNull = 5
	CSLib_D1uIsParallelD1v = 6
CSLib_Done = CSLib_DerivativeStatus.CSLib_Done
CSLib_D1uIsNull = CSLib_DerivativeStatus.CSLib_D1uIsNull
CSLib_D1vIsNull = CSLib_DerivativeStatus.CSLib_D1vIsNull
CSLib_D1IsNull = CSLib_DerivativeStatus.CSLib_D1IsNull
CSLib_D1uD1vRatioIsNull = CSLib_DerivativeStatus.CSLib_D1uD1vRatioIsNull
CSLib_D1vD1uRatioIsNull = CSLib_DerivativeStatus.CSLib_D1vD1uRatioIsNull
CSLib_D1uIsParallelD1v = CSLib_DerivativeStatus.CSLib_D1uIsParallelD1v

class CSLib_NormalStatus(IntEnum):
	CSLib_Singular = 0
	CSLib_Defined = 1
	CSLib_InfinityOfSolutions = 2
	CSLib_D1NuIsNull = 3
	CSLib_D1NvIsNull = 4
	CSLib_D1NIsNull = 5
	CSLib_D1NuNvRatioIsNull = 6
	CSLib_D1NvNuRatioIsNull = 7
	CSLib_D1NuIsParallelD1Nv = 8
CSLib_Singular = CSLib_NormalStatus.CSLib_Singular
CSLib_Defined = CSLib_NormalStatus.CSLib_Defined
CSLib_InfinityOfSolutions = CSLib_NormalStatus.CSLib_InfinityOfSolutions
CSLib_D1NuIsNull = CSLib_NormalStatus.CSLib_D1NuIsNull
CSLib_D1NvIsNull = CSLib_NormalStatus.CSLib_D1NvIsNull
CSLib_D1NIsNull = CSLib_NormalStatus.CSLib_D1NIsNull
CSLib_D1NuNvRatioIsNull = CSLib_NormalStatus.CSLib_D1NuNvRatioIsNull
CSLib_D1NvNuRatioIsNull = CSLib_NormalStatus.CSLib_D1NvNuRatioIsNull
CSLib_D1NuIsParallelD1Nv = CSLib_NormalStatus.CSLib_D1NuIsParallelD1Nv
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************
* class CSLib *
**************/
%rename(cslib) CSLib;
class CSLib {
	public:
		/****** CSLib::DNNUV ******/
		/****** md5 signature: 5f88b5415c5b50fb4d576270637c41e3 ******/
		%feature("compactdefaultargs") DNNUV;
		%feature("autodoc", "
Parameters
----------
theNu: int
theNv: int
theDerSurf: NCollection_Array2<gp_Vec>

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order (theNu, theNv) of the non-normalized normal vector. //! The non-normalized normal is N = dS/du ^ dS/dv. This function computes d^(Nu+Nv)N / (du^Nu * dv^Nv). //! 
Input parameter: theNu Derivative order in U direction 
Input parameter: theNv Derivative order in V direction 
Input parameter: theDerSurf Surface derivatives array where theDerSurf(i,j) = d^(i+j)S/(du^i * dv^j)  for i = 0..theNu+1, j = 0..theNv+1 
Return: The derivative vector d^(Nu+Nv)N / (du^Nu * dv^Nv).
") DNNUV;
		static gp_Vec DNNUV(int theNu, int theNv, const NCollection_Array2<gp_Vec> & theDerSurf);

		/****** CSLib::DNNUV ******/
		/****** md5 signature: ff29703c046f8d709f008f9df70c2882 ******/
		%feature("compactdefaultargs") DNNUV;
		%feature("autodoc", "
Parameters
----------
theNu: int
theNv: int
theDerSurf1: NCollection_Array2<gp_Vec>
theDerSurf2: NCollection_Array2<gp_Vec>

Return
-------
gp_Vec

Description
-----------
Computes the derivative of the non-normalized vector N = dS1/du ^ dS2/dv. //! This variant is used for osculating surfaces where the normal is computed from derivatives of two different surfaces. //! 
Input parameter: theNu Derivative order in U direction 
Input parameter: theNv Derivative order in V direction 
Input parameter: theDerSurf1 Derivatives of the first surface S1 
Input parameter: theDerSurf2 Derivatives of the second surface S2 
Return: The derivative vector.
") DNNUV;
		static gp_Vec DNNUV(int theNu, int theNv, const NCollection_Array2<gp_Vec> & theDerSurf1, const NCollection_Array2<gp_Vec> & theDerSurf2);

		/****** CSLib::DNNormal ******/
		/****** md5 signature: 706ff335bdfa8797055675f2b13c7751 ******/
		%feature("compactdefaultargs") DNNormal;
		%feature("autodoc", "
Parameters
----------
theNu: int
theNv: int
theDerNUV: NCollection_Array2<gp_Vec>
theIduref: int (optional, default to 0)
theIdvref: int (optional, default to 0)

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order (theNu, theNv) of the normalized normal vector. //! 
Input parameter: theNu Derivative order in U direction 
Input parameter: theNv Derivative order in V direction 
Input parameter: theDerNUV Array of derivatives of the non-normalized normal.  Contains derivatives d^(i+j)(D1U^D1V)/(du^i * dv^j)  for i = theIduref..theNu+theIduref, j = theIdvref..theNv+theIdvref 
Input parameter: theIduref Reference index offset in U (default 0 for regular cases) 
Input parameter: theIdvref Reference index offset in V (default 0 for regular cases) 
Return: The derivative of the normalized normal vector.
") DNNormal;
		static gp_Vec DNNormal(int theNu, int theNv, const NCollection_Array2<gp_Vec> & theDerNUV, int theIduref = 0, int theIdvref = 0);

		/****** CSLib::Normal ******/
		/****** md5 signature: b8b357e3301f598d80fd10f9e63dd4fe ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
theD1U: gp_Vec
theD1V: gp_Vec
theSinTol: double
theNormal: gp_Dir

Return
-------
theStatus: CSLib_DerivativeStatus

Description
-----------
Computes the normal direction of a surface as the cross product D1U ^ D1V. //! The normal is undefined if: - D1U has null length, or - D1V has null length, or - D1U and D1V are parallel. //! To check parallelism, the sine of the angle between D1U and D1V is computed and compared with theSinTol. //! 
Input parameter: theD1U First derivative in U direction 
Input parameter: theD1V First derivative in V direction 
Input parameter: theSinTol Sine tolerance for parallelism check @param[out] theStatus Result status indicating success or failure reason @param[out] theNormal Computed normal direction (valid only if theStatus == CSLib_Done).
") Normal;
		static void Normal(const gp_Vec & theD1U, const gp_Vec & theD1V, double theSinTol, CSLib_DerivativeStatus &OutValue, gp_Dir & theNormal);

		/****** CSLib::Normal ******/
		/****** md5 signature: 8a25728b254b5b46229c3974575fb2d6 ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
theD1U: gp_Vec
theD1V: gp_Vec
theD2U: gp_Vec
theD2V: gp_Vec
theD2UV: gp_Vec
theSinTol: double
theNormal: gp_Dir

Return
-------
theDone: bool
theStatus: CSLib_NormalStatus

Description
-----------
Computes an approximate normal direction at a singular point using second derivatives. //! When the standard method cannot compute the normal (D1U ^ D1V is null or too small), this method uses a limited Taylor expansion: N(u0+du, v0+dv) = N0 + dN/du * du + dN/dv * dv + O(du^2, dv^2) //! The normal is approximated from dN/du and dN/dv where N = D1U ^ D1V. //! 
Input parameter: theD1U First derivative in U direction 
Input parameter: theD1V First derivative in V direction 
Input parameter: theD2U Second derivative in U direction (d^2S/du^2) 
Input parameter: theD2V Second derivative in V direction (d^2S/dv^2) 
Input parameter: theD2UV Mixed second derivative (d^2S/dudv) 
Input parameter: theSinTol Sine tolerance for parallelism check @param[out] theDone True if normal was successfully computed @param[out] theStatus Result status with detailed information @param[out] theNormal Computed normal direction (valid only if theDone is true).
") Normal;
		static void Normal(const gp_Vec & theD1U, const gp_Vec & theD1V, const gp_Vec & theD2U, const gp_Vec & theD2V, const gp_Vec & theD2UV, double theSinTol, Standard_Boolean &OutValue, CSLib_NormalStatus &OutValue, gp_Dir & theNormal);

		/****** CSLib::Normal ******/
		/****** md5 signature: 1ce4d111f59166230b9bab3198af9cf4 ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
theD1U: gp_Vec
theD1V: gp_Vec
theMagTol: double
theNormal: gp_Dir

Return
-------
theStatus: CSLib_NormalStatus

Description
-----------
Computes the normal direction using magnitude tolerance. //! A simpler version that checks if the cross product magnitude and derivative magnitudes exceed the given tolerance. //! 
Input parameter: theD1U First derivative in U direction 
Input parameter: theD1V First derivative in V direction 
Input parameter: theMagTol Magnitude tolerance for singularity detection @param[out] theStatus Result status (CSLib_Defined or CSLib_Singular) @param[out] theNormal Computed normal direction (valid only if theStatus == CSLib_Defined).
") Normal;
		static void Normal(const gp_Vec & theD1U, const gp_Vec & theD1V, double theMagTol, CSLib_NormalStatus &OutValue, gp_Dir & theNormal);

		/****** CSLib::Normal ******/
		/****** md5 signature: 5ba1047854e527f1752c67e3268165d6 ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
theMaxOrder: int
theDerNUV: NCollection_Array2<gp_Vec>
theMagTol: double
theU: double
theV: double
theUmin: double
theUmax: double
theVmin: double
theVmax: double
theNormal: gp_Dir

Return
-------
theStatus: CSLib_NormalStatus
theOrderU: int
theOrderV: int

Description
-----------
Computes the normal at a singular point using higher-order derivatives. //! Finds the first order k0 where the derivatives of N = D1U ^ D1V become non-null and collinear, ensuring a unique normal direction. //! 
Input parameter: theMaxOrder Maximum derivative order to examine 
Input parameter: theDerNUV Array of derivatives of N (indices correspond to derivative orders) 
Input parameter: theMagTol Magnitude tolerance 
Input parameter: theU, theV Current parameter values 
Input parameter: theUmin, theUmax, theVmin, theVmax Parameter bounds @param[out] theStatus Result status @param[out] theNormal Computed normal direction @param[out] theOrderU, theOrderV Orders of the first non-null derivative used.
") Normal;
		static void Normal(int theMaxOrder, const NCollection_Array2<gp_Vec> & theDerNUV, double theMagTol, double theU, double theV, double theUmin, double theUmax, double theVmin, double theVmax, CSLib_NormalStatus &OutValue, gp_Dir & theNormal, Standard_Integer &OutValue, Standard_Integer &OutValue);

};


%extend CSLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class CSLib_Class2d *
**********************/
/****************************
* class CSLib_NormalPolyDef *
****************************/
class CSLib_NormalPolyDef : public math_FunctionWithDerivative {
	public:
		/****** CSLib_NormalPolyDef::CSLib_NormalPolyDef ******/
		/****** md5 signature: d24990439eb59c8986cead707b74c56d ******/
		%feature("compactdefaultargs") CSLib_NormalPolyDef;
		%feature("autodoc", "
Parameters
----------
theK0: int
theLi: NCollection_Array1<double>

Return
-------
None

Description
-----------
Constructs a polynomial definition for normal computation. //! 
Input parameter: theK0 Polynomial degree (must be >= 0) 
Input parameter: theLi Array of coefficients with indices 0 to theK0.
") CSLib_NormalPolyDef;
		 CSLib_NormalPolyDef(int theK0, const NCollection_Array1<double> & theLi);

		/****** CSLib_NormalPolyDef::Derivative ******/
		/****** md5 signature: 13782f68cfbdc3f0d4811bf36276435a ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
theX: double

Return
-------
theD: double

Description
-----------
Computes the derivative of the function for the given variable. //! Evaluates dF/dX using the chain rule on the trigonometric polynomial. //! 
Input parameter: theX Input variable (angle in radians) @param[out] theD Computed derivative value 
Return: true if calculation was successful, false otherwise.
") Derivative;
		bool Derivative(const double theX, Standard_Real &OutValue);

		/****** CSLib_NormalPolyDef::Value ******/
		/****** md5 signature: d7c9c97d8afa0d99c856c0c155c21d1d ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theX: double

Return
-------
theF: double

Description
-----------
Computes the value of the function for the given variable. //! Evaluates F(X) = Sum_{i=0}^{k0} C(k0,i) * cos^i(X) * sin^(k0-i)(X) * li(i) //! 
Input parameter: theX Input variable (angle in radians) @param[out] theF Computed function value 
Return: true if calculation was successful, false otherwise.
") Value;
		bool Value(const double theX, Standard_Real &OutValue);

		/****** CSLib_NormalPolyDef::Values ******/
		/****** md5 signature: 284d5f300b6b56fa75e7198b614b2df6 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
theX: double

Return
-------
theF: double
theD: double

Description
-----------
Computes both the value and derivative of the function. //! More efficient than calling Value() and Derivative() separately as common subexpressions are computed only once. //! 
Input parameter: theX Input variable (angle in radians) @param[out] theF Computed function value @param[out] theD Computed derivative value 
Return: true if calculation was successful, false otherwise.
") Values;
		bool Values(const double theX, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend CSLib_NormalPolyDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class CSLib_Class2d:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def cslib_DNNUV(*args):
	return cslib.DNNUV(*args)

@deprecated
def cslib_DNNUV(*args):
	return cslib.DNNUV(*args)

@deprecated
def cslib_DNNormal(*args):
	return cslib.DNNormal(*args)

@deprecated
def cslib_Normal(*args):
	return cslib.Normal(*args)

@deprecated
def cslib_Normal(*args):
	return cslib.Normal(*args)

@deprecated
def cslib_Normal(*args):
	return cslib.Normal(*args)

@deprecated
def cslib_Normal(*args):
	return cslib.Normal(*args)

}
