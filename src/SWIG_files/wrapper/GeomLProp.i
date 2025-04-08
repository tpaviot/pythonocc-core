/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_geomlprop.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/******************
* class GeomLProp *
******************/
%rename(geomlprop) GeomLProp;
class GeomLProp {
	public:
		/****** GeomLProp::Continuity ******/
		/****** md5 signature: 7713aed15d69a1cad2fb88fc954ffae2 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
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

Return
-------
GeomAbs_Shape

Description
-----------
Computes the regularity at the junction between C1 and C2. The booleans r1 and r2 are true if the curves must be taken reversed. The point u1 on C1 and the point u2 on C2 must be confused. tl and ta are the linear and angular tolerance used two compare the derivative.
") Continuity;
		static GeomAbs_Shape Continuity(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2, const Standard_Real u1, const Standard_Real u2, const Standard_Boolean r1, const Standard_Boolean r2, const Standard_Real tl, const Standard_Real ta);

		/****** GeomLProp::Continuity ******/
		/****** md5 signature: 6fa4bcc756438bbc69c0c6e99919c3f8 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C1: Geom_Curve
C2: Geom_Curve
u1: float
u2: float
r1: bool
r2: bool

Return
-------
GeomAbs_Shape

Description
-----------
The same as preceding but using the standard tolerances from package Precision.
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
		/****** GeomLProp_CLProps::GeomLProp_CLProps ******/
		/****** md5 signature: ddc0ca6927ea854355497824a7383072 ******/
		%feature("compactdefaultargs") GeomLProp_CLProps;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
N: int
Resolution: float

Return
-------
None

Description
-----------
Initializes the local properties of the curve <C> The current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <N> indicates the maximum number of derivations to be done (0, 1, 2 or 3). For example, to compute only the tangent, N should be equal to 1. <Resolution> is the linear tolerance (it is used to test if a vector is null).
") GeomLProp_CLProps;
		 GeomLProp_CLProps(const opencascade::handle<Geom_Curve> & C, const Standard_Integer N, const Standard_Real Resolution);

		/****** GeomLProp_CLProps::GeomLProp_CLProps ******/
		/****** md5 signature: 82f98a63fe562c97b8f438ab3b34ced2 ******/
		%feature("compactdefaultargs") GeomLProp_CLProps;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
U: float
N: int
Resolution: float

Return
-------
None

Description
-----------
Same as previous constructor but here the parameter is set to the value <U>. All the computations done will be related to <C> and <U>.
") GeomLProp_CLProps;
		 GeomLProp_CLProps(const opencascade::handle<Geom_Curve> & C, const Standard_Real U, const Standard_Integer N, const Standard_Real Resolution);

		/****** GeomLProp_CLProps::GeomLProp_CLProps ******/
		/****** md5 signature: 2a4052a98ffa27654f48721cca274e38 ******/
		%feature("compactdefaultargs") GeomLProp_CLProps;
		%feature("autodoc", "
Parameters
----------
N: int
Resolution: float

Return
-------
None

Description
-----------
Same as previous constructor but here the parameter is set to the value <U> and the curve is set with SetCurve. the curve can have a empty constructor All the computations done will be related to <C> and <U> when the functions 'set' will be done.
") GeomLProp_CLProps;
		 GeomLProp_CLProps(const Standard_Integer N, const Standard_Real Resolution);

		/****** GeomLProp_CLProps::CentreOfCurvature ******/
		/****** md5 signature: 62d176ce7c370b0aaf979899c5c8c8ed ******/
		%feature("compactdefaultargs") CentreOfCurvature;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Returns the centre of curvature <P>.
") CentreOfCurvature;
		void CentreOfCurvature(gp_Pnt & P);

		/****** GeomLProp_CLProps::Curvature ******/
		/****** md5 signature: 4886f38d109c8344d719e9973cfea7e1 ******/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the curvature.
") Curvature;
		Standard_Real Curvature();

		/****** GeomLProp_CLProps::D1 ******/
		/****** md5 signature: 0b334102acda4d3b92a2badfa14b3be9 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the first derivative. The derivative is computed if it has not been yet.
") D1;
		const gp_Vec D1();

		/****** GeomLProp_CLProps::D2 ******/
		/****** md5 signature: 46fd60fbfe8cc806f27ca68c1234907f ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the second derivative. The derivative is computed if it has not been yet.
") D2;
		const gp_Vec D2();

		/****** GeomLProp_CLProps::D3 ******/
		/****** md5 signature: 941f449454d8f26edc70e5f1f599e44c ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the third derivative. The derivative is computed if it has not been yet.
") D3;
		const gp_Vec D3();

		/****** GeomLProp_CLProps::IsTangentDefined ******/
		/****** md5 signature: 96b1d1e7ead0e227ec7d76f9ad798ae8 ******/
		%feature("compactdefaultargs") IsTangentDefined;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the tangent is defined. For example, the tangent is not defined if the three first derivatives are all null.
") IsTangentDefined;
		Standard_Boolean IsTangentDefined();

		/****** GeomLProp_CLProps::Normal ******/
		/****** md5 signature: 03cb2acf0c09b71a9b7b3d5cbd0efe88 ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
N: gp_Dir

Return
-------
None

Description
-----------
Returns the normal direction <N>.
") Normal;
		void Normal(gp_Dir & N);

		/****** GeomLProp_CLProps::SetCurve ******/
		/****** md5 signature: 33a6119977a9c465ffe7769b5dc4e7f5 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
None

Description
-----------
Initializes the local properties of the curve for the new curve.
") SetCurve;
		void SetCurve(const opencascade::handle<Geom_Curve> & C);

		/****** GeomLProp_CLProps::SetParameter ******/
		/****** md5 signature: 6d7d0a8f07175b76bb327cfdc33d2266 ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
None

Description
-----------
Initializes the local properties of the curve for the parameter value <U>.
") SetParameter;
		void SetParameter(const Standard_Real U);

		/****** GeomLProp_CLProps::Tangent ******/
		/****** md5 signature: 0e5f1db5e09f49610a019ac45223943c ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
Parameters
----------
D: gp_Dir

Return
-------
None

Description
-----------
output the tangent direction <D>.
") Tangent;
		void Tangent(gp_Dir & D);

		/****** GeomLProp_CLProps::Value ******/
		/****** md5 signature: eddd2908948849b73f6d8aacab318652 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the Point.
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
		/****** GeomLProp_CurveTool::Continuity ******/
		/****** md5 signature: 5c33cd00fc0698fba2415f41a7db95be ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
int

Description
-----------
returns the order of continuity of the curve <C>. returns 1: first derivative only is computable returns 2: first and second derivative only are computable. returns 3: first, second and third are computable.
") Continuity;
		static Standard_Integer Continuity(const opencascade::handle<Geom_Curve> & C);

		/****** GeomLProp_CurveTool::D1 ******/
		/****** md5 signature: b053f89e6a1bbe787ac190d0bf4b3701 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
U: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
Computes the point <P> and first derivative <V1> of parameter <U> on the curve <C>.
") D1;
		static void D1(const opencascade::handle<Geom_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****** GeomLProp_CurveTool::D2 ******/
		/****** md5 signature: 2e37ca5e4571967b5aa97fc240977eb3 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Computes the point <P>, the first derivative <V1> and second derivative <V2> of parameter <U> on the curve <C>.
") D2;
		static void D2(const opencascade::handle<Geom_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** GeomLProp_CurveTool::D3 ******/
		/****** md5 signature: 1ad50fe1fef34de5c128477595135887 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Computes the point <P>, the first derivative <V1>, the second derivative <V2> and third derivative <V3> of parameter <U> on the curve <C>.
") D3;
		static void D3(const opencascade::handle<Geom_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** GeomLProp_CurveTool::FirstParameter ******/
		/****** md5 signature: 3950ddd08ee3b45b576e4b5f361e6521 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
float

Description
-----------
returns the first parameter bound of the curve.
") FirstParameter;
		static Standard_Real FirstParameter(const opencascade::handle<Geom_Curve> & C);

		/****** GeomLProp_CurveTool::LastParameter ******/
		/****** md5 signature: 4279a006e768d45357ac0405e96269cc ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
float

Description
-----------
returns the last parameter bound of the curve. FirstParameter must be less than LastParamenter.
") LastParameter;
		static Standard_Real LastParameter(const opencascade::handle<Geom_Curve> & C);

		/****** GeomLProp_CurveTool::Value ******/
		/****** md5 signature: 6a7d06930a30cfec4194e02ac4f8c376 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point <P> of parameter <U> on the curve <C>.
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
		/****** GeomLProp_SLProps::GeomLProp_SLProps ******/
		/****** md5 signature: bf1027bdd92b745728dd6e7de37a2681 ******/
		%feature("compactdefaultargs") GeomLProp_SLProps;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
U: float
V: float
N: int
Resolution: float

Return
-------
None

Description
-----------
Initializes the local properties of the surface <S> for the parameter values (<U>, <V>). The current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <N> indicates the maximum number of derivations to be done (0, 1, or 2). For example, to compute only the tangent, N should be equal to 1. <Resolution> is the linear tolerance (it is used to test if a vector is null).
") GeomLProp_SLProps;
		 GeomLProp_SLProps(const opencascade::handle<Geom_Surface> & S, const Standard_Real U, const Standard_Real V, const Standard_Integer N, const Standard_Real Resolution);

		/****** GeomLProp_SLProps::GeomLProp_SLProps ******/
		/****** md5 signature: a4e1406e0d6992d1d03ae4749dce4455 ******/
		%feature("compactdefaultargs") GeomLProp_SLProps;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
N: int
Resolution: float

Return
-------
None

Description
-----------
idem as previous constructor but without setting the value of parameters <U> and <V>.
") GeomLProp_SLProps;
		 GeomLProp_SLProps(const opencascade::handle<Geom_Surface> & S, const Standard_Integer N, const Standard_Real Resolution);

		/****** GeomLProp_SLProps::GeomLProp_SLProps ******/
		/****** md5 signature: 44e6aed6061e68c82886e9d043d1ed91 ******/
		%feature("compactdefaultargs") GeomLProp_SLProps;
		%feature("autodoc", "
Parameters
----------
N: int
Resolution: float

Return
-------
None

Description
-----------
idem as previous constructor but without setting the value of parameters <U> and <V> and the surface. the surface can have an empty constructor.
") GeomLProp_SLProps;
		 GeomLProp_SLProps(const Standard_Integer N, const Standard_Real Resolution);

		/****** GeomLProp_SLProps::CurvatureDirections ******/
		/****** md5 signature: dce4de0944d73f0923cc57f1cae010ce ******/
		%feature("compactdefaultargs") CurvatureDirections;
		%feature("autodoc", "
Parameters
----------
MaxD: gp_Dir
MinD: gp_Dir

Return
-------
None

Description
-----------
Returns the direction of the maximum and minimum curvature <MaxD> and <MinD>.
") CurvatureDirections;
		void CurvatureDirections(gp_Dir & MaxD, gp_Dir & MinD);

		/****** GeomLProp_SLProps::D1U ******/
		/****** md5 signature: 7fcd61e774b6033eceefa61e3338377a ******/
		%feature("compactdefaultargs") D1U;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the first U derivative. The derivative is computed if it has not been yet.
") D1U;
		const gp_Vec D1U();

		/****** GeomLProp_SLProps::D1V ******/
		/****** md5 signature: ad864d52b93c95482f9a3644c7fe473c ******/
		%feature("compactdefaultargs") D1V;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the first V derivative. The derivative is computed if it has not been yet.
") D1V;
		const gp_Vec D1V();

		/****** GeomLProp_SLProps::D2U ******/
		/****** md5 signature: 0472ef4d94574816aeb47829a66bdbae ******/
		%feature("compactdefaultargs") D2U;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the second U derivatives The derivative is computed if it has not been yet.
") D2U;
		const gp_Vec D2U();

		/****** GeomLProp_SLProps::D2V ******/
		/****** md5 signature: c70c5cc9b31ef0a3470d3c29498b5305 ******/
		%feature("compactdefaultargs") D2V;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the second V derivative. The derivative is computed if it has not been yet.
") D2V;
		const gp_Vec D2V();

		/****** GeomLProp_SLProps::DUV ******/
		/****** md5 signature: 93a293abda31f525f2bff5034aabc11a ******/
		%feature("compactdefaultargs") DUV;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the second UV cross-derivative. The derivative is computed if it has not been yet.
") DUV;
		const gp_Vec DUV();

		/****** GeomLProp_SLProps::GaussianCurvature ******/
		/****** md5 signature: 6f1ed6a8aa49074ec45c7600ff9ed9ad ******/
		%feature("compactdefaultargs") GaussianCurvature;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Gaussian curvature.
") GaussianCurvature;
		Standard_Real GaussianCurvature();

		/****** GeomLProp_SLProps::IsCurvatureDefined ******/
		/****** md5 signature: 24d1c4dc0bb5e5b3cd3acab3d6b3723c ******/
		%feature("compactdefaultargs") IsCurvatureDefined;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the curvature is defined.
") IsCurvatureDefined;
		Standard_Boolean IsCurvatureDefined();

		/****** GeomLProp_SLProps::IsNormalDefined ******/
		/****** md5 signature: b4faa90626237a62ab1311b7cb7ad450 ******/
		%feature("compactdefaultargs") IsNormalDefined;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if the normal is defined.
") IsNormalDefined;
		Standard_Boolean IsNormalDefined();

		/****** GeomLProp_SLProps::IsTangentUDefined ******/
		/****** md5 signature: 92ed6ca4fade225cd5464af6490033b3 ******/
		%feature("compactdefaultargs") IsTangentUDefined;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the U tangent is defined. For example, the tangent is not defined if the two first U derivatives are null.
") IsTangentUDefined;
		Standard_Boolean IsTangentUDefined();

		/****** GeomLProp_SLProps::IsTangentVDefined ******/
		/****** md5 signature: 53c94c0bb0d39a933984467e0683397e ******/
		%feature("compactdefaultargs") IsTangentVDefined;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns if the V tangent is defined. For example, the tangent is not defined if the two first V derivatives are null.
") IsTangentVDefined;
		Standard_Boolean IsTangentVDefined();

		/****** GeomLProp_SLProps::IsUmbilic ******/
		/****** md5 signature: a045467d1ec2cad50bd2dfbeab29b8fd ******/
		%feature("compactdefaultargs") IsUmbilic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the point is umbilic (i.e. if the curvature is constant).
") IsUmbilic;
		Standard_Boolean IsUmbilic();

		/****** GeomLProp_SLProps::MaxCurvature ******/
		/****** md5 signature: 42c5b0c05da3040d5856fffc987ed742 ******/
		%feature("compactdefaultargs") MaxCurvature;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the maximum curvature.
") MaxCurvature;
		Standard_Real MaxCurvature();

		/****** GeomLProp_SLProps::MeanCurvature ******/
		/****** md5 signature: 5c7a78b552e4ca890e50b485026f52f3 ******/
		%feature("compactdefaultargs") MeanCurvature;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the mean curvature.
") MeanCurvature;
		Standard_Real MeanCurvature();

		/****** GeomLProp_SLProps::MinCurvature ******/
		/****** md5 signature: 9c5c8915c2ccf5b49a49ab2765ec946f ******/
		%feature("compactdefaultargs") MinCurvature;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimum curvature.
") MinCurvature;
		Standard_Real MinCurvature();

		/****** GeomLProp_SLProps::Normal ******/
		/****** md5 signature: 24a2507aa20216689971a0ec1fd83f76 ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the normal direction.
") Normal;
		const gp_Dir Normal();

		/****** GeomLProp_SLProps::SetParameters ******/
		/****** md5 signature: 766228d61435cf9eaba866b58733ed73 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
U: float
V: float

Return
-------
None

Description
-----------
Initializes the local properties of the surface S for the new parameter values (<U>, <V>).
") SetParameters;
		void SetParameters(const Standard_Real U, const Standard_Real V);

		/****** GeomLProp_SLProps::SetSurface ******/
		/****** md5 signature: 04c71d5ed70fe6360be3e4fadc33ab5a ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
None

Description
-----------
Initializes the local properties of the surface S for the new surface.
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_Surface> & S);

		/****** GeomLProp_SLProps::TangentU ******/
		/****** md5 signature: ff20f7d1d23e153974b932d55fa30a7f ******/
		%feature("compactdefaultargs") TangentU;
		%feature("autodoc", "
Parameters
----------
D: gp_Dir

Return
-------
None

Description
-----------
Returns the tangent direction <D> on the iso-V.
") TangentU;
		void TangentU(gp_Dir & D);

		/****** GeomLProp_SLProps::TangentV ******/
		/****** md5 signature: 8241dc858e42533746e4d61351ceccd4 ******/
		%feature("compactdefaultargs") TangentV;
		%feature("autodoc", "
Parameters
----------
D: gp_Dir

Return
-------
None

Description
-----------
Returns the tangent direction <D> on the iso-V.
") TangentV;
		void TangentV(gp_Dir & D);

		/****** GeomLProp_SLProps::Value ******/
		/****** md5 signature: eddd2908948849b73f6d8aacab318652 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point.
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
		/****** GeomLProp_SurfaceTool::Bounds ******/
		/****** md5 signature: ad40dbb1912a286f60c719476c91d5f7 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
U1: float
V1: float
U2: float
V2: float

Description
-----------
returns the bounds of the Surface.
") Bounds;
		static void Bounds(const opencascade::handle<Geom_Surface> & S, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomLProp_SurfaceTool::Continuity ******/
		/****** md5 signature: 475d64b09367a76b06ab784da0066e40 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
int

Description
-----------
returns the order of continuity of the Surface <S>. returns 1: first derivative only is computable returns 2: first and second derivative only are computable.
") Continuity;
		static Standard_Integer Continuity(const opencascade::handle<Geom_Surface> & S);

		/****** GeomLProp_SurfaceTool::D1 ******/
		/****** md5 signature: af5588d8cf010b51509fe1547a864edb ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
Computes the point <P> and first derivative <D1*> of parameter <U> and <V> on the Surface <S>.
") D1;
		static void D1(const opencascade::handle<Geom_Surface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** GeomLProp_SurfaceTool::D2 ******/
		/****** md5 signature: f4f3a58f7be8401c3eb6a5e32beecc69 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the point <P>, the first derivative <D1*> and second derivative <D2*> of parameter <U> and <V> on the Surface <S>.
") D2;
		static void D2(const opencascade::handle<Geom_Surface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & DUV);

		/****** GeomLProp_SurfaceTool::DN ******/
		/****** md5 signature: 9f0a5c7a5c5f9db06881d514137505cd ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
U: float
V: float
IU: int
IV: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const opencascade::handle<Geom_Surface> & S, const Standard_Real U, const Standard_Real V, const Standard_Integer IU, const Standard_Integer IV);

		/****** GeomLProp_SurfaceTool::Value ******/
		/****** md5 signature: 53bb25a046bf9d26d8db0b907d8cd8b6 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point <P> of parameter <U> and <V> on the Surface <S>.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def geomlprop_Continuity(*args):
	return geomlprop.Continuity(*args)

@deprecated
def geomlprop_Continuity(*args):
	return geomlprop.Continuity(*args)

@deprecated
def GeomLProp_CurveTool_Continuity(*args):
	return GeomLProp_CurveTool.Continuity(*args)

@deprecated
def GeomLProp_CurveTool_D1(*args):
	return GeomLProp_CurveTool.D1(*args)

@deprecated
def GeomLProp_CurveTool_D2(*args):
	return GeomLProp_CurveTool.D2(*args)

@deprecated
def GeomLProp_CurveTool_D3(*args):
	return GeomLProp_CurveTool.D3(*args)

@deprecated
def GeomLProp_CurveTool_FirstParameter(*args):
	return GeomLProp_CurveTool.FirstParameter(*args)

@deprecated
def GeomLProp_CurveTool_LastParameter(*args):
	return GeomLProp_CurveTool.LastParameter(*args)

@deprecated
def GeomLProp_CurveTool_Value(*args):
	return GeomLProp_CurveTool.Value(*args)

@deprecated
def GeomLProp_SurfaceTool_Bounds(*args):
	return GeomLProp_SurfaceTool.Bounds(*args)

@deprecated
def GeomLProp_SurfaceTool_Continuity(*args):
	return GeomLProp_SurfaceTool.Continuity(*args)

@deprecated
def GeomLProp_SurfaceTool_D1(*args):
	return GeomLProp_SurfaceTool.D1(*args)

@deprecated
def GeomLProp_SurfaceTool_D2(*args):
	return GeomLProp_SurfaceTool.D2(*args)

@deprecated
def GeomLProp_SurfaceTool_DN(*args):
	return GeomLProp_SurfaceTool.DN(*args)

@deprecated
def GeomLProp_SurfaceTool_Value(*args):
	return GeomLProp_SurfaceTool.Value(*args)

}
