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
%define APPROXINTDOCSTRING
"ApproxInt module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_approxint.html"
%enddef
%module (package="OCC.Core", docstring=APPROXINTDOCSTRING) ApproxInt


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
#include<ApproxInt_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<math_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<IntPatch_module.hxx>
#include<Approx_module.hxx>
#include<gp_module.hxx>
#include<IntSurf_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<AppParCurves_module.hxx>
#include<Bnd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import math.i
%import TColStd.i
%import TColgp.i
%import IntPatch.i
%import Approx.i
%import gp.i
%import IntSurf.i

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

/****************************
* class ApproxInt_KnotTools *
****************************/
class ApproxInt_KnotTools {
	public:
		/****** ApproxInt_KnotTools::BuildCurvature ******/
		/****** md5 signature: e62e1bc1a3a35879e66976b48bdc2cb5 ******/
		%feature("compactdefaultargs") BuildCurvature;
		%feature("autodoc", "
Parameters
----------
theCoords: NCollection_LocalArray<double>
theDim: int
thePars: math_Vector
theCurv: TColStd_Array1OfReal

Return
-------
theMaxCurv: double

Description
-----------
Builds discrete curvature.
") BuildCurvature;
		static void BuildCurvature(const NCollection_LocalArray<double> & theCoords, const int theDim, const math_Vector & thePars, TColStd_Array1OfReal & theCurv, Standard_Real &OutValue);

		/****** ApproxInt_KnotTools::BuildKnots ******/
		/****** md5 signature: 6fe93cfd23aaa1c104da24c416f43ae6 ******/
		%feature("compactdefaultargs") BuildKnots;
		%feature("autodoc", "
Parameters
----------
thePntsXYZ: TColgp_Array1OfPnt
thePntsU1V1: TColgp_Array1OfPnt2d
thePntsU2V2: TColgp_Array1OfPnt2d
thePars: math_Vector
theApproxXYZ: bool
theApproxU1V1: bool
theApproxU2V2: bool
theMinNbPnts: int
theKnots: NCollection_DynamicArray<int>

Return
-------
None

Description
-----------
Main function to build optimal knot sequence. At least one set from (thePntsXYZ, thePntsU1V1, thePntsU2V2) should exist. 
Parameter thePntsXYZ - Set of 3d points. 
Parameter thePntsU1V1 - Set of 2d points. 
Parameter thePntsU2V2 - Set of 2d points. 
Parameter thePars - Expected parameters associated with set. 
Parameter theApproxXYZ - Flag, existence of 3d set. 
Parameter theApproxU1V1 - Flag existence of first 2d set. 
Parameter theApproxU2V2 - Flag existence of second 2d set. 
Parameter theMinNbPnts - Minimal number of points per knot interval. 
Parameter theKnots - output knots sequence.
") BuildKnots;
		static void BuildKnots(const TColgp_Array1OfPnt & thePntsXYZ, const TColgp_Array1OfPnt2d & thePntsU1V1, const TColgp_Array1OfPnt2d & thePntsU2V2, const math_Vector & thePars, const bool theApproxXYZ, const bool theApproxU1V1, const bool theApproxU2V2, const int theMinNbPnts, NCollection_DynamicArray<int> & theKnots);

		/****** ApproxInt_KnotTools::DefineParType ******/
		/****** md5 signature: 84a1f9fd732595cddc9bf44e00a619f4 ******/
		%feature("compactdefaultargs") DefineParType;
		%feature("autodoc", "
Parameters
----------
theWL: IntPatch_WLine
theFpar: int
theLpar: int
theApproxXYZ: bool
theApproxU1V1: bool
theApproxU2V2: bool

Return
-------
Approx_ParametrizationType

Description
-----------
Defines preferable parametrization type for theWL.
") DefineParType;
		static Approx_ParametrizationType DefineParType(const opencascade::handle<IntPatch_WLine> & theWL, const int theFpar, const int theLpar, const bool theApproxXYZ, const bool theApproxU1V1, const bool theApproxU2V2);

};


%extend ApproxInt_KnotTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class ApproxInt_SvSurfaces *
*****************************/
%nodefaultctor ApproxInt_SvSurfaces;
class ApproxInt_SvSurfaces {
	public:
		/****** ApproxInt_SvSurfaces::Compute ******/
		/****** md5 signature: e8a29e5fa5bcbaf0b3c712d8cab905d5 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
Pt: gp_Pnt
Tg: gp_Vec
Tguv1: gp_Vec2d
Tguv2: gp_Vec2d

Return
-------
u1: double
v1: double
u2: double
v2: double

Description
-----------
returns True if Tg,Tguv1 Tguv2 can be computed.
") Compute;
		virtual bool Compute(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & Pt, gp_Vec & Tg, gp_Vec2d & Tguv1, gp_Vec2d & Tguv2);

		/****** ApproxInt_SvSurfaces::GetUseSolver ******/
		/****** md5 signature: 591ee37bc36144b8f2fdfd238213a052 ******/
		%feature("compactdefaultargs") GetUseSolver;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetUseSolver;
		virtual bool GetUseSolver();

		/****** ApproxInt_SvSurfaces::Pnt ******/
		/****** md5 signature: 0bdd226b1382137e1b968d44eb877974 ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "
Parameters
----------
u1: double
v1: double
u2: double
v2: double
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Pnt;
		virtual void Pnt(const double u1, const double v1, const double u2, const double v2, gp_Pnt & P);

		/****** ApproxInt_SvSurfaces::SeekPoint ******/
		/****** md5 signature: b25e7e808bb47a73e17d0322fc79f93b ******/
		%feature("compactdefaultargs") SeekPoint;
		%feature("autodoc", "
Parameters
----------
u1: double
v1: double
u2: double
v2: double
Point: IntSurf_PntOn2S

Return
-------
bool

Description
-----------
computes point on curve and parameters on the surfaces.
") SeekPoint;
		virtual bool SeekPoint(const double u1, const double v1, const double u2, const double v2, IntSurf_PntOn2S & Point);

		/****** ApproxInt_SvSurfaces::SetUseSolver ******/
		/****** md5 signature: decca3869173df3549e7abc154c8fe24 ******/
		%feature("compactdefaultargs") SetUseSolver;
		%feature("autodoc", "
Parameters
----------
theUseSol: bool

Return
-------
None

Description
-----------
No available documentation.
") SetUseSolver;
		void SetUseSolver(const bool theUseSol);

		/****** ApproxInt_SvSurfaces::Tangency ******/
		/****** md5 signature: 070b6018847864b6169c23784ad17a62 ******/
		%feature("compactdefaultargs") Tangency;
		%feature("autodoc", "
Parameters
----------
u1: double
v1: double
u2: double
v2: double
Tg: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") Tangency;
		virtual bool Tangency(const double u1, const double v1, const double u2, const double v2, gp_Vec & Tg);

		/****** ApproxInt_SvSurfaces::TangencyOnSurf1 ******/
		/****** md5 signature: 09e334341c6d678208fd6270f0f48b04 ******/
		%feature("compactdefaultargs") TangencyOnSurf1;
		%feature("autodoc", "
Parameters
----------
u1: double
v1: double
u2: double
v2: double
Tg: gp_Vec2d

Return
-------
bool

Description
-----------
No available documentation.
") TangencyOnSurf1;
		virtual bool TangencyOnSurf1(const double u1, const double v1, const double u2, const double v2, gp_Vec2d & Tg);

		/****** ApproxInt_SvSurfaces::TangencyOnSurf2 ******/
		/****** md5 signature: 5fe4595ea0802f3761de3a4c14f55db6 ******/
		%feature("compactdefaultargs") TangencyOnSurf2;
		%feature("autodoc", "
Parameters
----------
u1: double
v1: double
u2: double
v2: double
Tg: gp_Vec2d

Return
-------
bool

Description
-----------
No available documentation.
") TangencyOnSurf2;
		virtual bool TangencyOnSurf2(const double u1, const double v1, const double u2, const double v2, gp_Vec2d & Tg);

};


%extend ApproxInt_SvSurfaces {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def ApproxInt_KnotTools_BuildCurvature(*args):
	return ApproxInt_KnotTools.BuildCurvature(*args)

@deprecated
def ApproxInt_KnotTools_BuildKnots(*args):
	return ApproxInt_KnotTools.BuildKnots(*args)

@deprecated
def ApproxInt_KnotTools_DefineParType(*args):
	return ApproxInt_KnotTools.DefineParType(*args)

}
