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
%define GEOMLPROPDOCSTRING
"GeomLProp module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geomlprop.html"
%enddef
%module (package="OCC.Core", docstring=GEOMLPROPDOCSTRING) GeomLProp


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
#include<GeomLProp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<GeomAbs_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import GeomAbs.i
%import gp.i

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

/******************
* class GeomLProp *
******************/
%rename(geomlprop) GeomLProp;
class GeomLProp {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Computes the regularity at the junction between c1 and c2. the booleans r1 and r2 are true if the curves must be taken reversed. the point u1 on c1 and the point u2 on c2 must be confused. tl and ta are the linear and angular tolerance used two compare the derivative.

Parameters
----------
C1: Geom_Curve
C2: Geom_Curve
u1: float
u2: float
r1: bool
r2: bool
tl: float
ta: float

Returns
-------
GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2, const Standard_Real u1, const Standard_Real u2, const Standard_Boolean r1, const Standard_Boolean r2, const Standard_Real tl, const Standard_Real ta);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "The same as preciding but using the standard tolerances from package precision.

Parameters
----------
C1: Geom_Curve
C2: Geom_Curve
u1: float
u2: float
r1: bool
r2: bool

Returns
-------
GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2, const Standard_Real u1, const Standard_Real u2, const Standard_Boolean r1, const Standard_Boolean r2);

};


%extend GeomLProp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomLProp_CLProps *
**************************/
class GeomLProp_CLProps {
	public:
		/****************** GeomLProp_CLProps ******************/
		%feature("compactdefaultargs") GeomLProp_CLProps;
		%feature("autodoc", "Initializes the local properties of the curve <c> the current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <n> indicates the maximum number of derivations to be done (0, 1, 2 or 3). for example, to compute only the tangent, n should be equal to 1. <resolution> is the linear tolerance (it is used to test if a vector is null).

Parameters
----------
C: Geom_Curve
N: int
Resolution: float

Returns
-------
None
") GeomLProp_CLProps;
		 GeomLProp_CLProps(const opencascade::handle<Geom_Curve> & C, const Standard_Integer N, const Standard_Real Resolution);

		/****************** GeomLProp_CLProps ******************/
		%feature("compactdefaultargs") GeomLProp_CLProps;
		%feature("autodoc", "Same as previous constructor but here the parameter is set to the value <u>. all the computations done will be related to <c> and <u>.

Parameters
----------
C: Geom_Curve
U: float
N: int
Resolution: float

Returns
-------
None
") GeomLProp_CLProps;
		 GeomLProp_CLProps(const opencascade::handle<Geom_Curve> & C, const Standard_Real U, const Standard_Integer N, const Standard_Real Resolution);

		/****************** GeomLProp_CLProps ******************/
		%feature("compactdefaultargs") GeomLProp_CLProps;
		%feature("autodoc", "Same as previous constructor but here the parameter is set to the value <u> and the curve is set with setcurve. the curve can have a empty constructor all the computations done will be related to <c> and <u> when the functions 'set' will be done.

Parameters
----------
N: int
Resolution: float

Returns
-------
None
") GeomLProp_CLProps;
		 GeomLProp_CLProps(const Standard_Integer N, const Standard_Real Resolution);

		/****************** CentreOfCurvature ******************/
		%feature("compactdefaultargs") CentreOfCurvature;
		%feature("autodoc", "Returns the centre of curvature <p>.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") CentreOfCurvature;
		void CentreOfCurvature(gp_Pnt & P);

		/****************** Curvature ******************/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Returns the curvature.

Returns
-------
float
") Curvature;
		Standard_Real Curvature();

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the first derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D1;
		const gp_Vec D1();

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the second derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D2;
		const gp_Vec D2();

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the third derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D3;
		const gp_Vec D3();

		/****************** IsTangentDefined ******************/
		%feature("compactdefaultargs") IsTangentDefined;
		%feature("autodoc", "Returns true if the tangent is defined. for example, the tangent is not defined if the three first derivatives are all null.

Returns
-------
bool
") IsTangentDefined;
		Standard_Boolean IsTangentDefined();

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Returns the normal direction <n>.

Parameters
----------
N: gp_Dir

Returns
-------
None
") Normal;
		void Normal(gp_Dir & N);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "Initializes the local properties of the curve for the new curve.

Parameters
----------
C: Geom_Curve

Returns
-------
None
") SetCurve;
		void SetCurve(const opencascade::handle<Geom_Curve> & C);

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "Initializes the local properties of the curve for the parameter value <u>.

Parameters
----------
U: float

Returns
-------
None
") SetParameter;
		void SetParameter(const Standard_Real U);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "Output the tangent direction <d>.

Parameters
----------
D: gp_Dir

Returns
-------
None
") Tangent;
		void Tangent(gp_Dir & D);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

};


%extend GeomLProp_CLProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomLProp_CurveTool *
****************************/
class GeomLProp_CurveTool {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the order of continuity of the curve <c>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable. returns 3 : first, second and third are computable.

Parameters
----------
C: Geom_Curve

Returns
-------
int
") Continuity;
		static Standard_Integer Continuity(const opencascade::handle<Geom_Curve> & C);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point <p> and first derivative <v1> of parameter <u> on the curve <c>.

Parameters
----------
C: Geom_Curve
U: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		static void D1(const opencascade::handle<Geom_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the point <p>, the first derivative <v1> and second derivative <v2> of parameter <u> on the curve <c>.

Parameters
----------
C: Geom_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		static void D2(const opencascade::handle<Geom_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes the point <p>, the first derivative <v1>, the second derivative <v2> and third derivative <v3> of parameter <u> on the curve <c>.

Parameters
----------
C: Geom_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		static void D3(const opencascade::handle<Geom_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the first parameter bound of the curve.

Parameters
----------
C: Geom_Curve

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const opencascade::handle<Geom_Curve> & C);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the last parameter bound of the curve. firstparameter must be less than lastparamenter.

Parameters
----------
C: Geom_Curve

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const opencascade::handle<Geom_Curve> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point <p> of parameter <u> on the curve <c>.

Parameters
----------
C: Geom_Curve
U: float
P: gp_Pnt

Returns
-------
None
") Value;
		static void Value(const opencascade::handle<Geom_Curve> & C, const Standard_Real U, gp_Pnt & P);

};


%extend GeomLProp_CurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomLProp_SLProps *
**************************/
class GeomLProp_SLProps {
	public:
		/****************** GeomLProp_SLProps ******************/
		%feature("compactdefaultargs") GeomLProp_SLProps;
		%feature("autodoc", "Initializes the local properties of the surface <s> for the parameter values (<u>, <v>). the current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <n> indicates the maximum number of derivations to be done (0, 1, or 2). for example, to compute only the tangent, n should be equal to 1. <resolution> is the linear tolerance (it is used to test if a vector is null).

Parameters
----------
S: Geom_Surface
U: float
V: float
N: int
Resolution: float

Returns
-------
None
") GeomLProp_SLProps;
		 GeomLProp_SLProps(const opencascade::handle<Geom_Surface> & S, const Standard_Real U, const Standard_Real V, const Standard_Integer N, const Standard_Real Resolution);

		/****************** GeomLProp_SLProps ******************/
		%feature("compactdefaultargs") GeomLProp_SLProps;
		%feature("autodoc", "Idem as previous constructor but without setting the value of parameters <u> and <v>.

Parameters
----------
S: Geom_Surface
N: int
Resolution: float

Returns
-------
None
") GeomLProp_SLProps;
		 GeomLProp_SLProps(const opencascade::handle<Geom_Surface> & S, const Standard_Integer N, const Standard_Real Resolution);

		/****************** GeomLProp_SLProps ******************/
		%feature("compactdefaultargs") GeomLProp_SLProps;
		%feature("autodoc", "Idem as previous constructor but without setting the value of parameters <u> and <v> and the surface. the surface can have an empty constructor.

Parameters
----------
N: int
Resolution: float

Returns
-------
None
") GeomLProp_SLProps;
		 GeomLProp_SLProps(const Standard_Integer N, const Standard_Real Resolution);

		/****************** CurvatureDirections ******************/
		%feature("compactdefaultargs") CurvatureDirections;
		%feature("autodoc", "Returns the direction of the maximum and minimum curvature <maxd> and <mind>.

Parameters
----------
MaxD: gp_Dir
MinD: gp_Dir

Returns
-------
None
") CurvatureDirections;
		void CurvatureDirections(gp_Dir & MaxD, gp_Dir & MinD);

		/****************** D1U ******************/
		%feature("compactdefaultargs") D1U;
		%feature("autodoc", "Returns the first u derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D1U;
		const gp_Vec D1U();

		/****************** D1V ******************/
		%feature("compactdefaultargs") D1V;
		%feature("autodoc", "Returns the first v derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D1V;
		const gp_Vec D1V();

		/****************** D2U ******************/
		%feature("compactdefaultargs") D2U;
		%feature("autodoc", "Returns the second u derivatives the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D2U;
		const gp_Vec D2U();

		/****************** D2V ******************/
		%feature("compactdefaultargs") D2V;
		%feature("autodoc", "Returns the second v derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D2V;
		const gp_Vec D2V();

		/****************** DUV ******************/
		%feature("compactdefaultargs") DUV;
		%feature("autodoc", "Returns the second uv cross-derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") DUV;
		const gp_Vec DUV();

		/****************** GaussianCurvature ******************/
		%feature("compactdefaultargs") GaussianCurvature;
		%feature("autodoc", "Returns the gaussian curvature.

Returns
-------
float
") GaussianCurvature;
		Standard_Real GaussianCurvature();

		/****************** IsCurvatureDefined ******************/
		%feature("compactdefaultargs") IsCurvatureDefined;
		%feature("autodoc", "Returns true if the curvature is defined.

Returns
-------
bool
") IsCurvatureDefined;
		Standard_Boolean IsCurvatureDefined();

		/****************** IsNormalDefined ******************/
		%feature("compactdefaultargs") IsNormalDefined;
		%feature("autodoc", "Tells if the normal is defined.

Returns
-------
bool
") IsNormalDefined;
		Standard_Boolean IsNormalDefined();

		/****************** IsTangentUDefined ******************/
		%feature("compactdefaultargs") IsTangentUDefined;
		%feature("autodoc", "Returns true if the u tangent is defined. for example, the tangent is not defined if the two first u derivatives are null.

Returns
-------
bool
") IsTangentUDefined;
		Standard_Boolean IsTangentUDefined();

		/****************** IsTangentVDefined ******************/
		%feature("compactdefaultargs") IsTangentVDefined;
		%feature("autodoc", "Returns if the v tangent is defined. for example, the tangent is not defined if the two first v derivatives are null.

Returns
-------
bool
") IsTangentVDefined;
		Standard_Boolean IsTangentVDefined();

		/****************** IsUmbilic ******************/
		%feature("compactdefaultargs") IsUmbilic;
		%feature("autodoc", "Returns true if the point is umbilic (i.e. if the curvature is constant).

Returns
-------
bool
") IsUmbilic;
		Standard_Boolean IsUmbilic();

		/****************** MaxCurvature ******************/
		%feature("compactdefaultargs") MaxCurvature;
		%feature("autodoc", "Returns the maximum curvature.

Returns
-------
float
") MaxCurvature;
		Standard_Real MaxCurvature();

		/****************** MeanCurvature ******************/
		%feature("compactdefaultargs") MeanCurvature;
		%feature("autodoc", "Returns the mean curvature.

Returns
-------
float
") MeanCurvature;
		Standard_Real MeanCurvature();

		/****************** MinCurvature ******************/
		%feature("compactdefaultargs") MinCurvature;
		%feature("autodoc", "Returns the minimum curvature.

Returns
-------
float
") MinCurvature;
		Standard_Real MinCurvature();

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Returns the normal direction.

Returns
-------
gp_Dir
") Normal;
		const gp_Dir Normal();

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "Initializes the local properties of the surface s for the new parameter values (<u>, <v>).

Parameters
----------
U: float
V: float

Returns
-------
None
") SetParameters;
		void SetParameters(const Standard_Real U, const Standard_Real V);

		/****************** SetSurface ******************/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "Initializes the local properties of the surface s for the new surface.

Parameters
----------
S: Geom_Surface

Returns
-------
None
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & S);

		/****************** TangentU ******************/
		%feature("compactdefaultargs") TangentU;
		%feature("autodoc", "Returns the tangent direction <d> on the iso-v.

Parameters
----------
D: gp_Dir

Returns
-------
None
") TangentU;
		void TangentU(gp_Dir & D);

		/****************** TangentV ******************/
		%feature("compactdefaultargs") TangentV;
		%feature("autodoc", "Returns the tangent direction <d> on the iso-v.

Parameters
----------
D: gp_Dir

Returns
-------
None
") TangentV;
		void TangentV(gp_Dir & D);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

};


%extend GeomLProp_SLProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomLProp_SurfaceTool *
******************************/
class GeomLProp_SurfaceTool {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the bounds of the surface.

Parameters
----------
S: Geom_Surface

Returns
-------
U1: float
V1: float
U2: float
V2: float
") Bounds;
		static void Bounds(const opencascade::handle<Geom_Surface> & S, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the order of continuity of the surface <s>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable.

Parameters
----------
S: Geom_Surface

Returns
-------
int
") Continuity;
		static Standard_Integer Continuity(const opencascade::handle<Geom_Surface> & S);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point <p> and first derivative <d1*> of parameter <u> and <v> on the surface <s>.

Parameters
----------
S: Geom_Surface
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		static void D1(const opencascade::handle<Geom_Surface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the point <p>, the first derivative <d1*> and second derivative <d2*> of parameter <u> and <v> on the surface <s>.

Parameters
----------
S: Geom_Surface
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
DUV: gp_Vec

Returns
-------
None
") D2;
		static void D2(const opencascade::handle<Geom_Surface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & DUV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Surface
U: float
V: float
IU: int
IV: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const opencascade::handle<Geom_Surface> & S, const Standard_Real U, const Standard_Real V, const Standard_Integer IU, const Standard_Integer IV);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point <p> of parameter <u> and <v> on the surface <s>.

Parameters
----------
S: Geom_Surface
U: float
V: float
P: gp_Pnt

Returns
-------
None
") Value;
		static void Value(const opencascade::handle<Geom_Surface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P);

};


%extend GeomLProp_SurfaceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
