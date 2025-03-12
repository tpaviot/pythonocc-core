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
%define LPROP3DDOCSTRING
"LProp3d module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_lprop3d.html"
%enddef
%module (package="OCC.Core", docstring=LPROP3DDOCSTRING) LProp3d


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
#include<LProp3d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<gp_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
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

/************************
* class LProp3d_CLProps *
************************/
class LProp3d_CLProps {
	public:
		/****** LProp3d_CLProps::LProp3d_CLProps ******/
		/****** md5 signature: 55346d22164284569aa322c86d4ed2e9 ******/
		%feature("compactdefaultargs") LProp3d_CLProps;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
N: int
Resolution: float

Return
-------
None

Description
-----------
Initializes the local properties of the curve <C> The current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <N> indicates the maximum number of derivations to be done (0, 1, 2 or 3). For example, to compute only the tangent, N should be equal to 1. <Resolution> is the linear tolerance (it is used to test if a vector is null).
") LProp3d_CLProps;
		 LProp3d_CLProps(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Integer N, const Standard_Real Resolution);

		/****** LProp3d_CLProps::LProp3d_CLProps ******/
		/****** md5 signature: 0322c52bac5bb9e9cc7b748c91d91215 ******/
		%feature("compactdefaultargs") LProp3d_CLProps;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
N: int
Resolution: float

Return
-------
None

Description
-----------
Same as previous constructor but here the parameter is set to the value <U>. All the computations done will be related to <C> and <U>.
") LProp3d_CLProps;
		 LProp3d_CLProps(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, const Standard_Integer N, const Standard_Real Resolution);

		/****** LProp3d_CLProps::LProp3d_CLProps ******/
		/****** md5 signature: 7f3ee4ee884748be05d5efbac5962e75 ******/
		%feature("compactdefaultargs") LProp3d_CLProps;
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
") LProp3d_CLProps;
		 LProp3d_CLProps(const Standard_Integer N, const Standard_Real Resolution);

		/****** LProp3d_CLProps::CentreOfCurvature ******/
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

		/****** LProp3d_CLProps::Curvature ******/
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

		/****** LProp3d_CLProps::D1 ******/
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

		/****** LProp3d_CLProps::D2 ******/
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

		/****** LProp3d_CLProps::D3 ******/
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

		/****** LProp3d_CLProps::IsTangentDefined ******/
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

		/****** LProp3d_CLProps::Normal ******/
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

		/****** LProp3d_CLProps::SetCurve ******/
		/****** md5 signature: c10d16ef149061e06174e6a21df7d6fd ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
Initializes the local properties of the curve for the new curve.
") SetCurve;
		void SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** LProp3d_CLProps::SetParameter ******/
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

		/****** LProp3d_CLProps::Tangent ******/
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

		/****** LProp3d_CLProps::Value ******/
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


%extend LProp3d_CLProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class LProp3d_CurveTool *
**************************/
class LProp3d_CurveTool {
	public:
		/****** LProp3d_CurveTool::Continuity ******/
		/****** md5 signature: 67ad52ef2db0c9cf038f39663725f559 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
int

Description
-----------
returns the order of continuity of the HCurve <C>. returns 1: first derivative only is computable returns 2: first and second derivative only are computable. returns 3: first, second and third are computable.
") Continuity;
		static Standard_Integer Continuity(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** LProp3d_CurveTool::D1 ******/
		/****** md5 signature: 64701d22c465e4adc06f3de193348692 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V1: gp_Vec

Return
-------
None

Description
-----------
Computes the point <P> and first derivative <V1> of parameter <U> on the HCurve <C>.
") D1;
		static void D1(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****** LProp3d_CurveTool::D2 ******/
		/****** md5 signature: a03fec54dc9fb384b49128be1eeb6ab5 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Computes the point <P>, the first derivative <V1> and second derivative <V2> of parameter <U> on the HCurve <C>.
") D2;
		static void D2(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** LProp3d_CurveTool::D3 ******/
		/****** md5 signature: daf7fd27ce53952002a95005add4c7db ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
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
Computes the point <P>, the first derivative <V1>, the second derivative <V2> and third derivative <V3> of parameter <U> on the HCurve <C>.
") D3;
		static void D3(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** LProp3d_CurveTool::FirstParameter ******/
		/****** md5 signature: 25c42492a02c6ff0b57c4cf91fb40f86 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
float

Description
-----------
returns the first parameter bound of the HCurve.
") FirstParameter;
		static Standard_Real FirstParameter(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** LProp3d_CurveTool::LastParameter ******/
		/****** md5 signature: c00409255c9efae31d007ea0f35327b6 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
float

Description
-----------
returns the last parameter bound of the HCurve. FirstParameter must be less than LastParamenter.
") LastParameter;
		static Standard_Real LastParameter(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** LProp3d_CurveTool::Value ******/
		/****** md5 signature: c9166e787eb6dba49df04f09341196b6 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point <P> of parameter <U> on the HCurve <C>.
") Value;
		static void Value(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, gp_Pnt & P);

};


%extend LProp3d_CurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class LProp3d_SLProps *
************************/
class LProp3d_SLProps {
	public:
		/****** LProp3d_SLProps::LProp3d_SLProps ******/
		/****** md5 signature: 8e26364dfa92e188c2d1b9bdfa61d9d0 ******/
		%feature("compactdefaultargs") LProp3d_SLProps;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
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
") LProp3d_SLProps;
		 LProp3d_SLProps(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real U, const Standard_Real V, const Standard_Integer N, const Standard_Real Resolution);

		/****** LProp3d_SLProps::LProp3d_SLProps ******/
		/****** md5 signature: 551b173d5b0f247fb20f33862006b68e ******/
		%feature("compactdefaultargs") LProp3d_SLProps;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
N: int
Resolution: float

Return
-------
None

Description
-----------
idem as previous constructor but without setting the value of parameters <U> and <V>.
") LProp3d_SLProps;
		 LProp3d_SLProps(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Integer N, const Standard_Real Resolution);

		/****** LProp3d_SLProps::LProp3d_SLProps ******/
		/****** md5 signature: 4665210bb798bfd8a1be71399d0323f0 ******/
		%feature("compactdefaultargs") LProp3d_SLProps;
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
") LProp3d_SLProps;
		 LProp3d_SLProps(const Standard_Integer N, const Standard_Real Resolution);

		/****** LProp3d_SLProps::CurvatureDirections ******/
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

		/****** LProp3d_SLProps::D1U ******/
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

		/****** LProp3d_SLProps::D1V ******/
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

		/****** LProp3d_SLProps::D2U ******/
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

		/****** LProp3d_SLProps::D2V ******/
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

		/****** LProp3d_SLProps::DUV ******/
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

		/****** LProp3d_SLProps::GaussianCurvature ******/
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

		/****** LProp3d_SLProps::IsCurvatureDefined ******/
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

		/****** LProp3d_SLProps::IsNormalDefined ******/
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

		/****** LProp3d_SLProps::IsTangentUDefined ******/
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

		/****** LProp3d_SLProps::IsTangentVDefined ******/
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

		/****** LProp3d_SLProps::IsUmbilic ******/
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

		/****** LProp3d_SLProps::MaxCurvature ******/
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

		/****** LProp3d_SLProps::MeanCurvature ******/
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

		/****** LProp3d_SLProps::MinCurvature ******/
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

		/****** LProp3d_SLProps::Normal ******/
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

		/****** LProp3d_SLProps::SetParameters ******/
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

		/****** LProp3d_SLProps::SetSurface ******/
		/****** md5 signature: 31b5f8e96962760e8ffab10ebcefd535 ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
Initializes the local properties of the surface S for the new surface.
") SetSurface;
		void SetSurface(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** LProp3d_SLProps::TangentU ******/
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

		/****** LProp3d_SLProps::TangentV ******/
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

		/****** LProp3d_SLProps::Value ******/
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


%extend LProp3d_SLProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class LProp3d_SurfaceTool *
****************************/
class LProp3d_SurfaceTool {
	public:
		/****** LProp3d_SurfaceTool::Bounds ******/
		/****** md5 signature: 2f47c789bea86a8d768de90521a99be5 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
U1: float
V1: float
U2: float
V2: float

Description
-----------
returns the bounds of the HSurface.
") Bounds;
		static void Bounds(const opencascade::handle<Adaptor3d_Surface> & S, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** LProp3d_SurfaceTool::Continuity ******/
		/****** md5 signature: 0fa75bd197e4456fe4ae2b28cfedb774 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
int

Description
-----------
returns the order of continuity of the HSurface <S>. returns 1: first derivative only is computable returns 2: first and second derivative only are computable.
") Continuity;
		static Standard_Integer Continuity(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** LProp3d_SurfaceTool::D1 ******/
		/****** md5 signature: 0ed65c587f44222a126bf3c8a594165d ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
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
Computes the point <P> and first derivative <D1*> of parameter <U> and <V> on the HSurface <S>.
") D1;
		static void D1(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** LProp3d_SurfaceTool::D2 ******/
		/****** md5 signature: a2a0e00ba5339b2afc6c2cca9361278c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
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
Computes the point <P>, the first derivative <D1*> and second derivative <D2*> of parameter <U> and <V> on the HSurface <S>.
") D2;
		static void D2(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & DUV);

		/****** LProp3d_SurfaceTool::DN ******/
		/****** md5 signature: bcc30853ace75615fb49f72515a4abb1 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
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
		static gp_Vec DN(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real U, const Standard_Real V, const Standard_Integer IU, const Standard_Integer IV);

		/****** LProp3d_SurfaceTool::Value ******/
		/****** md5 signature: 8c6567385008e24d9a3e3cf268ab3933 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point <P> of parameter <U> and <V> on the HSurface <S>.
") Value;
		static void Value(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P);

};


%extend LProp3d_SurfaceTool {
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
def LProp3d_CurveTool_Continuity(*args):
	return LProp3d_CurveTool.Continuity(*args)

@deprecated
def LProp3d_CurveTool_D1(*args):
	return LProp3d_CurveTool.D1(*args)

@deprecated
def LProp3d_CurveTool_D2(*args):
	return LProp3d_CurveTool.D2(*args)

@deprecated
def LProp3d_CurveTool_D3(*args):
	return LProp3d_CurveTool.D3(*args)

@deprecated
def LProp3d_CurveTool_FirstParameter(*args):
	return LProp3d_CurveTool.FirstParameter(*args)

@deprecated
def LProp3d_CurveTool_LastParameter(*args):
	return LProp3d_CurveTool.LastParameter(*args)

@deprecated
def LProp3d_CurveTool_Value(*args):
	return LProp3d_CurveTool.Value(*args)

@deprecated
def LProp3d_SurfaceTool_Bounds(*args):
	return LProp3d_SurfaceTool.Bounds(*args)

@deprecated
def LProp3d_SurfaceTool_Continuity(*args):
	return LProp3d_SurfaceTool.Continuity(*args)

@deprecated
def LProp3d_SurfaceTool_D1(*args):
	return LProp3d_SurfaceTool.D1(*args)

@deprecated
def LProp3d_SurfaceTool_D2(*args):
	return LProp3d_SurfaceTool.D2(*args)

@deprecated
def LProp3d_SurfaceTool_DN(*args):
	return LProp3d_SurfaceTool.DN(*args)

@deprecated
def LProp3d_SurfaceTool_Value(*args):
	return LProp3d_SurfaceTool.Value(*args)

}
