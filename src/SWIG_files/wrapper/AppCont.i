/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
%define APPCONTDOCSTRING
"AppCont module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_appcont.html"
%enddef
%module (package="OCC.Core", docstring=APPCONTDOCSTRING) AppCont


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
#include<AppCont_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<AppParCurves_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColgp.i
%import AppParCurves.i

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
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*************************
* class AppCont_Function *
*************************/
%nodefaultctor AppCont_Function;
class AppCont_Function {
	public:
		/****** AppCont_Function::D1 ******/
		/****** md5 signature: ac8922c27ae63da087f7893c373ece5c ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theU: double
theVec2d: TColgp_Array1OfVec2d
theVec: TColgp_Array1OfVec

Return
-------
bool

Description
-----------
Returns the derivative at parameter <theU>.
") D1;
		virtual bool D1(const double theU, TColgp_Array1OfVec2d & theVec2d, TColgp_Array1OfVec & theVec);

		/****** AppCont_Function::FirstParameter ******/
		/****** md5 signature: a78bafc15480770b071a253f06828586 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the first parameter of the function.
") FirstParameter;
		virtual double FirstParameter();

		/****** AppCont_Function::GetNbOf2dPoints ******/
		/****** md5 signature: 717030f6580424e29aebc9166dcf7f96 ******/
		%feature("compactdefaultargs") GetNbOf2dPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Get number of 2d points returned by 'Value' and 'D1' functions.
") GetNbOf2dPoints;
		int GetNbOf2dPoints();

		/****** AppCont_Function::GetNbOf3dPoints ******/
		/****** md5 signature: 42af6fcfbd1a149d3923122dff2b6069 ******/
		%feature("compactdefaultargs") GetNbOf3dPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Get number of 3d points returned by 'Value' and 'D1' functions.
") GetNbOf3dPoints;
		int GetNbOf3dPoints();

		/****** AppCont_Function::GetNumberOfPoints ******/
		/****** md5 signature: 098163c36364fed7cea019a7bc3b6da5 ******/
		%feature("compactdefaultargs") GetNumberOfPoints;
		%feature("autodoc", "
Parameters
----------

Return
-------
theNbPnt: int
theNbPnt2d: int

Description
-----------
Get number of 3d and 2d points returned by 'Value' and 'D1' functions.
") GetNumberOfPoints;
		void GetNumberOfPoints(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** AppCont_Function::LastParameter ******/
		/****** md5 signature: 8158738d773dc87261105cbfc8f7b45a ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the last parameter of the function.
") LastParameter;
		virtual double LastParameter();

		/****** AppCont_Function::PeriodInformation ******/
		/****** md5 signature: a005312d9c3bec7d67f80e72aa036cb3 ******/
		%feature("compactdefaultargs") PeriodInformation;
		%feature("autodoc", "
Parameters
----------
: int

Return
-------
IsPeriodic: bool
thePeriod: double

Description
-----------
Return information about peridicity in output paramateters space. 
Parameter theDimIdx Defines index in output parameters space. 1 <= theDimIdx <= 3 * myNbPnt + 2 * myNbPnt2d.
") PeriodInformation;
		virtual void PeriodInformation(const int , Standard_Boolean &OutValue, Standard_Real &OutValue);

		/****** AppCont_Function::Value ******/
		/****** md5 signature: 75aa31c650b6a1003b7c94bbdc7e401d ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theU: double
thePnt2d: TColgp_Array1OfPnt2d
thePnt: TColgp_Array1OfPnt

Return
-------
bool

Description
-----------
Returns the point at parameter <theU>.
") Value;
		virtual bool Value(const double theU, TColgp_Array1OfPnt2d & thePnt2d, TColgp_Array1OfPnt & thePnt);

};


%extend AppCont_Function {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class AppCont_LeastSquare *
****************************/
class AppCont_LeastSquare {
	public:
		/****** AppCont_LeastSquare::AppCont_LeastSquare ******/
		/****** md5 signature: f53556bd9f0b70c88b80815d0ca2d18c ******/
		%feature("compactdefaultargs") AppCont_LeastSquare;
		%feature("autodoc", "
Parameters
----------
SSP: AppCont_Function
U0: double
U1: double
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Deg: int
NbPoints: int

Return
-------
None

Description
-----------
No available documentation.
") AppCont_LeastSquare;
		 AppCont_LeastSquare(const AppCont_Function & SSP, const double U0, const double U1, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const int Deg, const int NbPoints);

		/****** AppCont_LeastSquare::Error ******/
		/****** md5 signature: 75fafd66063edafbff7888b39a25338c ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------

Return
-------
F: double
MaxE3d: double
MaxE2d: double

Description
-----------
No available documentation.
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppCont_LeastSquare::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** AppCont_LeastSquare::Value ******/
		/****** md5 signature: 59eb7b43f630b0afdd94fa8f4898fb6d ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
AppParCurves_MultiCurve

Description
-----------
No available documentation.
") Value;
		AppParCurves_MultiCurve Value();

};


%extend AppCont_LeastSquare {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class PeriodicityInfo *
************************/
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
