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
%define APPCONTDOCSTRING
"AppCont module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_appcont.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<AppCont_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<AppParCurves_module.hxx>
#include<math_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import AppParCurves.i
%import math.i

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
		/****************** D1 ******************/
		/**** md5 signature: d74f1ada11c5cab4d59bf5506c4d986e ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the derivative at parameter <theu>.

Parameters
----------
theU: float
theVec2d: NCollection_Array1<gp_Vec2d>
theVec: NCollection_Array1<gp_Vec>

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real theU, NCollection_Array1<gp_Vec2d> & theVec2d, NCollection_Array1<gp_Vec> & theVec);

		/****************** FirstParameter ******************/
		/**** md5 signature: d1641ead93c23610f9b5155af230348d ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the first parameter of the function.

Returns
-------
float
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****************** GetNbOf2dPoints ******************/
		/**** md5 signature: 3f7ada48633b9454e96b6c14faaaa97b ****/
		%feature("compactdefaultargs") GetNbOf2dPoints;
		%feature("autodoc", "Get number of 2d points returned by 'value' and 'd1' functions.

Returns
-------
int
") GetNbOf2dPoints;
		Standard_Integer GetNbOf2dPoints();

		/****************** GetNbOf3dPoints ******************/
		/**** md5 signature: 34417cccd11cb70858a56fd546f2c85d ****/
		%feature("compactdefaultargs") GetNbOf3dPoints;
		%feature("autodoc", "Get number of 3d points returned by 'value' and 'd1' functions.

Returns
-------
int
") GetNbOf3dPoints;
		Standard_Integer GetNbOf3dPoints();

		/****************** GetNumberOfPoints ******************/
		/**** md5 signature: f86c4c0754a51bf0afa2e9f149bdf2e0 ****/
		%feature("compactdefaultargs") GetNumberOfPoints;
		%feature("autodoc", "Get number of 3d and 2d points returned by 'value' and 'd1' functions.

Parameters
----------

Returns
-------
theNbPnt: int
theNbPnt2d: int
") GetNumberOfPoints;
		void GetNumberOfPoints(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** LastParameter ******************/
		/**** md5 signature: 78c346d133438e913e50667c32977882 ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the last parameter of the function.

Returns
-------
float
") LastParameter;
		virtual Standard_Real LastParameter();

		/****************** PeriodInformation ******************/
		/**** md5 signature: 2ec0eaf4e71d35192917d14baaa1c237 ****/
		%feature("compactdefaultargs") PeriodInformation;
		%feature("autodoc", "Return information about peridicity in output paramateters space. @param thedimidx defines index in output parameters space. 1 <= thedimidx <= 3 * mynbpnt + 2 * mynbpnt2d.

Parameters
----------
Standard_Integer: 

Returns
-------
IsPeriodic: bool
thePeriod: float
") PeriodInformation;
		virtual void PeriodInformation(const Standard_Integer, Standard_Boolean &OutValue, Standard_Real &OutValue);

		/****************** Value ******************/
		/**** md5 signature: f5048d9ba7a2a644fd22ab0a87e61896 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point at parameter <theu>.

Parameters
----------
theU: float
thePnt2d: NCollection_Array1<gp_Pnt2d>
thePnt: NCollection_Array1<gp_Pnt>

Returns
-------
bool
") Value;
		virtual Standard_Boolean Value(const Standard_Real theU, NCollection_Array1<gp_Pnt2d> & thePnt2d, NCollection_Array1<gp_Pnt> & thePnt);

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
		/****************** AppCont_LeastSquare ******************/
		/**** md5 signature: bef4a7f12a53a8a2686f96d5313108c8 ****/
		%feature("compactdefaultargs") AppCont_LeastSquare;
		%feature("autodoc", "No available documentation.

Parameters
----------
SSP: AppCont_Function
U0: float
U1: float
FirstCons: AppParCurves_Constraint
LastCons: AppParCurves_Constraint
Deg: int
NbPoints: int

Returns
-------
None
") AppCont_LeastSquare;
		 AppCont_LeastSquare(const AppCont_Function & SSP, const Standard_Real U0, const Standard_Real U1, const AppParCurves_Constraint FirstCons, const AppParCurves_Constraint LastCons, const Standard_Integer Deg, const Standard_Integer NbPoints);

		/****************** Error ******************/
		/**** md5 signature: 6cc4f4a7927f2c0b4ca37a4d45ee7075 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
F: float
MaxE3d: float
MaxE2d: float
") Error;
		void Error(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Value ******************/
		/**** md5 signature: 59eb7b43f630b0afdd94fa8f4898fb6d ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
AppParCurves_MultiCurve
") Value;
		const AppParCurves_MultiCurve & Value();

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
