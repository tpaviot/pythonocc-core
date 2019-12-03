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
/* public enums */
/* end public enums declaration */

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
		%feature("autodoc", ":param Index:
	:type Index: int
	:param TPoles:
	:type TPoles: TColgp_Array1OfPnt2d
	:param TKnots:
	:type TKnots: TColStd_Array1OfReal
	:param TMults:
	:type TMults: TColStd_Array1OfInteger
	:rtype: void") Curve2d;
		virtual void Curve2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & TPoles,TColStd_Array1OfReal & TKnots,TColStd_Array1OfInteger & TMults);

		/****************** Curve2dPoles ******************/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: TColgp_Array1OfPnt2d") Curve2dPoles;
		virtual const TColgp_Array1OfPnt2d & Curve2dPoles (const Standard_Integer Index);

		/****************** Curves2dDegree ******************/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", ":rtype: int") Curves2dDegree;
		virtual Standard_Integer Curves2dDegree ();

		/****************** Curves2dKnots ******************/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", ":rtype: TColStd_Array1OfReal") Curves2dKnots;
		virtual const TColStd_Array1OfReal & Curves2dKnots ();

		/****************** Curves2dMults ******************/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", ":rtype: TColStd_Array1OfInteger") Curves2dMults;
		virtual const TColStd_Array1OfInteger & Curves2dMults ();

		/****************** Curves2dShape ******************/
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", ":param Degree:
	:type Degree: int
	:param NbPoles:
	:type NbPoles: int
	:param NbKnots:
	:type NbKnots: int
	:rtype: void") Curves2dShape;
		virtual void Curves2dShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		virtual Standard_Boolean IsDone ();

		/****************** NbCurves2d ******************/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", ":rtype: int") NbCurves2d;
		virtual Standard_Integer NbCurves2d ();

		/****************** SurfPoles ******************/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", ":rtype: TColgp_Array2OfPnt") SurfPoles;
		virtual const TColgp_Array2OfPnt & SurfPoles ();

		/****************** SurfShape ******************/
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", ":param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param NbUPoles:
	:type NbUPoles: int
	:param NbVPoles:
	:type NbVPoles: int
	:param NbUKnots:
	:type NbUKnots: int
	:param NbVKnots:
	:type NbVKnots: int
	:rtype: void") SurfShape;
		virtual void SurfShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** SurfUKnots ******************/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", ":rtype: TColStd_Array1OfReal") SurfUKnots;
		virtual const TColStd_Array1OfReal & SurfUKnots ();

		/****************** SurfUMults ******************/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", ":rtype: TColStd_Array1OfInteger") SurfUMults;
		virtual const TColStd_Array1OfInteger & SurfUMults ();

		/****************** SurfVKnots ******************/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", ":rtype: TColStd_Array1OfReal") SurfVKnots;
		virtual const TColStd_Array1OfReal & SurfVKnots ();

		/****************** SurfVMults ******************/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", ":rtype: TColStd_Array1OfInteger") SurfVMults;
		virtual const TColStd_Array1OfInteger & SurfVMults ();

		/****************** SurfWeights ******************/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", ":rtype: TColStd_Array2OfReal") SurfWeights;
		virtual const TColStd_Array2OfReal & SurfWeights ();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":param TPoles:
	:type TPoles: TColgp_Array2OfPnt
	:param TWeights:
	:type TWeights: TColStd_Array2OfReal
	:param TUKnots:
	:type TUKnots: TColStd_Array1OfReal
	:param TVKnots:
	:type TVKnots: TColStd_Array1OfReal
	:param TUMults:
	:type TUMults: TColStd_Array1OfInteger
	:param TVMults:
	:type TVMults: TColStd_Array1OfInteger
	:rtype: void") Surface;
		virtual void Surface (TColgp_Array2OfPnt & TPoles,TColStd_Array2OfReal & TWeights,TColStd_Array1OfReal & TUKnots,TColStd_Array1OfReal & TVKnots,TColStd_Array1OfInteger & TUMults,TColStd_Array1OfInteger & TVMults);

		/****************** TolCurveOnSurf ******************/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: float") TolCurveOnSurf;
		virtual Standard_Real TolCurveOnSurf (const Standard_Integer Index);

		/****************** TolReached ******************/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", ":param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:rtype: void") TolReached;
		virtual void TolReached (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", ":rtype: int") UDegree;
		virtual Standard_Integer UDegree ();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", ":rtype: int") VDegree;
		virtual Standard_Integer VDegree ();

};


%extend AppBlend_Approx {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
