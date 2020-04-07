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
%define APPBLENDDOCSTRING
"AppBlend module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_appblend.html"
%enddef
%module (package="OCC.Core", docstring=APPBLENDDOCSTRING) AppBlend


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
#include<AppBlend_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColgp.i
%import TColStd.i

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

/************************
* class AppBlend_Approx *
************************/
%nodefaultctor AppBlend_Approx;
class AppBlend_Approx {
	public:
		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
TPoles: TColgp_Array1OfPnt2d
TKnots: TColStd_Array1OfReal
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Curve2d;
		virtual void Curve2d(const Standard_Integer Index, TColgp_Array1OfPnt2d & TPoles, TColStd_Array1OfReal & TKnots, TColStd_Array1OfInteger & TMults);

		/****************** Curve2dPoles ******************/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
TColgp_Array1OfPnt2d
") Curve2dPoles;
		virtual const TColgp_Array1OfPnt2d & Curve2dPoles(const Standard_Integer Index);

		/****************** Curves2dDegree ******************/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Curves2dDegree;
		virtual Standard_Integer Curves2dDegree();

		/****************** Curves2dKnots ******************/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") Curves2dKnots;
		virtual const TColStd_Array1OfReal & Curves2dKnots();

		/****************** Curves2dMults ******************/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") Curves2dMults;
		virtual const TColStd_Array1OfInteger & Curves2dMults();

		/****************** Curves2dShape ******************/
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Degree: int
NbPoles: int
NbKnots: int
") Curves2dShape;
		virtual void Curves2dShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		virtual Standard_Boolean IsDone();

		/****************** NbCurves2d ******************/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCurves2d;
		virtual Standard_Integer NbCurves2d();

		/****************** SurfPoles ******************/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
TColgp_Array2OfPnt
") SurfPoles;
		virtual const TColgp_Array2OfPnt & SurfPoles();

		/****************** SurfShape ******************/
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
UDegree: int
VDegree: int
NbUPoles: int
NbVPoles: int
NbUKnots: int
NbVKnots: int
") SurfShape;
		virtual void SurfShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SurfUKnots ******************/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfUKnots;
		virtual const TColStd_Array1OfReal & SurfUKnots();

		/****************** SurfUMults ******************/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfUMults;
		virtual const TColStd_Array1OfInteger & SurfUMults();

		/****************** SurfVKnots ******************/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfVKnots;
		virtual const TColStd_Array1OfReal & SurfVKnots();

		/****************** SurfVMults ******************/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfVMults;
		virtual const TColStd_Array1OfInteger & SurfVMults();

		/****************** SurfWeights ******************/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array2OfReal
") SurfWeights;
		virtual const TColStd_Array2OfReal & SurfWeights();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
TPoles: TColgp_Array2OfPnt
TWeights: TColStd_Array2OfReal
TUKnots: TColStd_Array1OfReal
TVKnots: TColStd_Array1OfReal
TUMults: TColStd_Array1OfInteger
TVMults: TColStd_Array1OfInteger

Returns
-------
None
") Surface;
		virtual void Surface(TColgp_Array2OfPnt & TPoles, TColStd_Array2OfReal & TWeights, TColStd_Array1OfReal & TUKnots, TColStd_Array1OfReal & TVKnots, TColStd_Array1OfInteger & TUMults, TColStd_Array1OfInteger & TVMults);

		/****************** TolCurveOnSurf ******************/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
float
") TolCurveOnSurf;
		virtual Standard_Real TolCurveOnSurf(const Standard_Integer Index);

		/****************** TolReached ******************/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Tol3d: float
Tol2d: float
") TolReached;
		virtual void TolReached(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		virtual Standard_Integer UDegree();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VDegree;
		virtual Standard_Integer VDegree();

};


%extend AppBlend_Approx {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
