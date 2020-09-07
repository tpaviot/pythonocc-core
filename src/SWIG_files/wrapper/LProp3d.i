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
%define LPROP3DDOCSTRING
"LProp3d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_lprop3d.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
* class LProp3d_CLProps *
************************/
class LProp3d_CLProps {
	public:
		/****************** LProp3d_CLProps ******************/
		/**** md5 signature: 72c8030382cd0143389eb5f868e97fea ****/
		%feature("compactdefaultargs") LProp3d_CLProps;
		%feature("autodoc", "Initializes the local properties of the curve <c> the current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <n> indicates the maximum number of derivations to be done (0, 1, 2 or 3). for example, to compute only the tangent, n should be equal to 1. <resolution> is the linear tolerance (it is used to test if a vector is null).

Parameters
----------
C: Adaptor3d_HCurve
N: int
Resolution: float

Returns
-------
None
") LProp3d_CLProps;
		 LProp3d_CLProps(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Integer N, const Standard_Real Resolution);

		/****************** LProp3d_CLProps ******************/
		/**** md5 signature: 9175d7a560f2f0a5e53df59d2bac7edf ****/
		%feature("compactdefaultargs") LProp3d_CLProps;
		%feature("autodoc", "Same as previous constructor but here the parameter is set to the value <u>. all the computations done will be related to <c> and <u>.

Parameters
----------
C: Adaptor3d_HCurve
U: float
N: int
Resolution: float

Returns
-------
None
") LProp3d_CLProps;
		 LProp3d_CLProps(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real U, const Standard_Integer N, const Standard_Real Resolution);

		/****************** LProp3d_CLProps ******************/
		/**** md5 signature: 7f3ee4ee884748be05d5efbac5962e75 ****/
		%feature("compactdefaultargs") LProp3d_CLProps;
		%feature("autodoc", "Same as previous constructor but here the parameter is set to the value <u> and the curve is set with setcurve. the curve can have a empty constructor all the computations done will be related to <c> and <u> when the functions 'set' will be done.

Parameters
----------
N: int
Resolution: float

Returns
-------
None
") LProp3d_CLProps;
		 LProp3d_CLProps(const Standard_Integer N, const Standard_Real Resolution);

		/****************** CentreOfCurvature ******************/
		/**** md5 signature: 62d176ce7c370b0aaf979899c5c8c8ed ****/
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
		/**** md5 signature: 4886f38d109c8344d719e9973cfea7e1 ****/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Returns the curvature.

Returns
-------
float
") Curvature;
		Standard_Real Curvature();

		/****************** D1 ******************/
		/**** md5 signature: 0b334102acda4d3b92a2badfa14b3be9 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the first derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D1;
		const gp_Vec D1();

		/****************** D2 ******************/
		/**** md5 signature: 46fd60fbfe8cc806f27ca68c1234907f ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the second derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D2;
		const gp_Vec D2();

		/****************** D3 ******************/
		/**** md5 signature: 941f449454d8f26edc70e5f1f599e44c ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the third derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D3;
		const gp_Vec D3();

		/****************** IsTangentDefined ******************/
		/**** md5 signature: 96b1d1e7ead0e227ec7d76f9ad798ae8 ****/
		%feature("compactdefaultargs") IsTangentDefined;
		%feature("autodoc", "Returns true if the tangent is defined. for example, the tangent is not defined if the three first derivatives are all null.

Returns
-------
bool
") IsTangentDefined;
		Standard_Boolean IsTangentDefined();

		/****************** Normal ******************/
		/**** md5 signature: 03cb2acf0c09b71a9b7b3d5cbd0efe88 ****/
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
		/**** md5 signature: 0aa2e16ff2d1289512b39f87ba1d546d ****/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "Initializes the local properties of the curve for the new curve.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
None
") SetCurve;
		void SetCurve(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** SetParameter ******************/
		/**** md5 signature: 6d7d0a8f07175b76bb327cfdc33d2266 ****/
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
		/**** md5 signature: 0e5f1db5e09f49610a019ac45223943c ****/
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
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point.

Returns
-------
gp_Pnt
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
		/****************** Continuity ******************/
		/**** md5 signature: f74282d576193a8a4468c05bd37aebd4 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the order of continuity of the hcurve <c>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable. returns 3 : first, second and third are computable.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
int
") Continuity;
		static Standard_Integer Continuity(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** D1 ******************/
		/**** md5 signature: ca717eb422034c7a68c51607382fb7ff ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point <p> and first derivative <v1> of parameter <u> on the hcurve <c>.

Parameters
----------
C: Adaptor3d_HCurve
U: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		static void D1(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****************** D2 ******************/
		/**** md5 signature: c09529dc7b635a906884c36fc27e6614 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the point <p>, the first derivative <v1> and second derivative <v2> of parameter <u> on the hcurve <c>.

Parameters
----------
C: Adaptor3d_HCurve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		static void D2(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		/**** md5 signature: 3bf35cb48a03694dcf006305239f076f ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes the point <p>, the first derivative <v1>, the second derivative <v2> and third derivative <v3> of parameter <u> on the hcurve <c>.

Parameters
----------
C: Adaptor3d_HCurve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		static void D3(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** FirstParameter ******************/
		/**** md5 signature: d9e1f13e76e33ca8ffa49bead51ff742 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the first parameter bound of the hcurve.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** LastParameter ******************/
		/**** md5 signature: cc67fdec2ebae09fe338337b96bbe757 ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the last parameter bound of the hcurve. firstparameter must be less than lastparamenter.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Value ******************/
		/**** md5 signature: 1a099d297657fc72fa3fb3465137d6c6 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point <p> of parameter <u> on the hcurve <c>.

Parameters
----------
C: Adaptor3d_HCurve
U: float
P: gp_Pnt

Returns
-------
None
") Value;
		static void Value(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real U, gp_Pnt & P);

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
		/****************** LProp3d_SLProps ******************/
		/**** md5 signature: ca57cd9bd4ea585a715e66900220457d ****/
		%feature("compactdefaultargs") LProp3d_SLProps;
		%feature("autodoc", "Initializes the local properties of the surface <s> for the parameter values (<u>, <v>). the current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <n> indicates the maximum number of derivations to be done (0, 1, or 2). for example, to compute only the tangent, n should be equal to 1. <resolution> is the linear tolerance (it is used to test if a vector is null).

Parameters
----------
S: Adaptor3d_HSurface
U: float
V: float
N: int
Resolution: float

Returns
-------
None
") LProp3d_SLProps;
		 LProp3d_SLProps(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real U, const Standard_Real V, const Standard_Integer N, const Standard_Real Resolution);

		/****************** LProp3d_SLProps ******************/
		/**** md5 signature: 23e46a1e42fa8c20a0abbfbb2c4a3a90 ****/
		%feature("compactdefaultargs") LProp3d_SLProps;
		%feature("autodoc", "Idem as previous constructor but without setting the value of parameters <u> and <v>.

Parameters
----------
S: Adaptor3d_HSurface
N: int
Resolution: float

Returns
-------
None
") LProp3d_SLProps;
		 LProp3d_SLProps(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Integer N, const Standard_Real Resolution);

		/****************** LProp3d_SLProps ******************/
		/**** md5 signature: 4665210bb798bfd8a1be71399d0323f0 ****/
		%feature("compactdefaultargs") LProp3d_SLProps;
		%feature("autodoc", "Idem as previous constructor but without setting the value of parameters <u> and <v> and the surface. the surface can have an empty constructor.

Parameters
----------
N: int
Resolution: float

Returns
-------
None
") LProp3d_SLProps;
		 LProp3d_SLProps(const Standard_Integer N, const Standard_Real Resolution);

		/****************** CurvatureDirections ******************/
		/**** md5 signature: dce4de0944d73f0923cc57f1cae010ce ****/
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
		/**** md5 signature: 7fcd61e774b6033eceefa61e3338377a ****/
		%feature("compactdefaultargs") D1U;
		%feature("autodoc", "Returns the first u derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D1U;
		const gp_Vec D1U();

		/****************** D1V ******************/
		/**** md5 signature: ad864d52b93c95482f9a3644c7fe473c ****/
		%feature("compactdefaultargs") D1V;
		%feature("autodoc", "Returns the first v derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D1V;
		const gp_Vec D1V();

		/****************** D2U ******************/
		/**** md5 signature: 0472ef4d94574816aeb47829a66bdbae ****/
		%feature("compactdefaultargs") D2U;
		%feature("autodoc", "Returns the second u derivatives the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D2U;
		const gp_Vec D2U();

		/****************** D2V ******************/
		/**** md5 signature: c70c5cc9b31ef0a3470d3c29498b5305 ****/
		%feature("compactdefaultargs") D2V;
		%feature("autodoc", "Returns the second v derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D2V;
		const gp_Vec D2V();

		/****************** DUV ******************/
		/**** md5 signature: 93a293abda31f525f2bff5034aabc11a ****/
		%feature("compactdefaultargs") DUV;
		%feature("autodoc", "Returns the second uv cross-derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") DUV;
		const gp_Vec DUV();

		/****************** GaussianCurvature ******************/
		/**** md5 signature: 6f1ed6a8aa49074ec45c7600ff9ed9ad ****/
		%feature("compactdefaultargs") GaussianCurvature;
		%feature("autodoc", "Returns the gaussian curvature.

Returns
-------
float
") GaussianCurvature;
		Standard_Real GaussianCurvature();

		/****************** IsCurvatureDefined ******************/
		/**** md5 signature: 24d1c4dc0bb5e5b3cd3acab3d6b3723c ****/
		%feature("compactdefaultargs") IsCurvatureDefined;
		%feature("autodoc", "Returns true if the curvature is defined.

Returns
-------
bool
") IsCurvatureDefined;
		Standard_Boolean IsCurvatureDefined();

		/****************** IsNormalDefined ******************/
		/**** md5 signature: b4faa90626237a62ab1311b7cb7ad450 ****/
		%feature("compactdefaultargs") IsNormalDefined;
		%feature("autodoc", "Tells if the normal is defined.

Returns
-------
bool
") IsNormalDefined;
		Standard_Boolean IsNormalDefined();

		/****************** IsTangentUDefined ******************/
		/**** md5 signature: 92ed6ca4fade225cd5464af6490033b3 ****/
		%feature("compactdefaultargs") IsTangentUDefined;
		%feature("autodoc", "Returns true if the u tangent is defined. for example, the tangent is not defined if the two first u derivatives are null.

Returns
-------
bool
") IsTangentUDefined;
		Standard_Boolean IsTangentUDefined();

		/****************** IsTangentVDefined ******************/
		/**** md5 signature: 53c94c0bb0d39a933984467e0683397e ****/
		%feature("compactdefaultargs") IsTangentVDefined;
		%feature("autodoc", "Returns if the v tangent is defined. for example, the tangent is not defined if the two first v derivatives are null.

Returns
-------
bool
") IsTangentVDefined;
		Standard_Boolean IsTangentVDefined();

		/****************** IsUmbilic ******************/
		/**** md5 signature: a045467d1ec2cad50bd2dfbeab29b8fd ****/
		%feature("compactdefaultargs") IsUmbilic;
		%feature("autodoc", "Returns true if the point is umbilic (i.e. if the curvature is constant).

Returns
-------
bool
") IsUmbilic;
		Standard_Boolean IsUmbilic();

		/****************** MaxCurvature ******************/
		/**** md5 signature: 42c5b0c05da3040d5856fffc987ed742 ****/
		%feature("compactdefaultargs") MaxCurvature;
		%feature("autodoc", "Returns the maximum curvature.

Returns
-------
float
") MaxCurvature;
		Standard_Real MaxCurvature();

		/****************** MeanCurvature ******************/
		/**** md5 signature: 5c7a78b552e4ca890e50b485026f52f3 ****/
		%feature("compactdefaultargs") MeanCurvature;
		%feature("autodoc", "Returns the mean curvature.

Returns
-------
float
") MeanCurvature;
		Standard_Real MeanCurvature();

		/****************** MinCurvature ******************/
		/**** md5 signature: 9c5c8915c2ccf5b49a49ab2765ec946f ****/
		%feature("compactdefaultargs") MinCurvature;
		%feature("autodoc", "Returns the minimum curvature.

Returns
-------
float
") MinCurvature;
		Standard_Real MinCurvature();

		/****************** Normal ******************/
		/**** md5 signature: 24a2507aa20216689971a0ec1fd83f76 ****/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Returns the normal direction.

Returns
-------
gp_Dir
") Normal;
		const gp_Dir Normal();

		/****************** SetParameters ******************/
		/**** md5 signature: 766228d61435cf9eaba866b58733ed73 ****/
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
		/**** md5 signature: c0f9085198ca86e592bdb1756098ae53 ****/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "Initializes the local properties of the surface s for the new surface.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
None
") SetSurface;
		void SetSurface(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** TangentU ******************/
		/**** md5 signature: ff20f7d1d23e153974b932d55fa30a7f ****/
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
		/**** md5 signature: 8241dc858e42533746e4d61351ceccd4 ****/
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
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point.

Returns
-------
gp_Pnt
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
		/****************** Bounds ******************/
		/**** md5 signature: b78317c028597566c368a993cf1c448c ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the bounds of the hsurface.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
U1: float
V1: float
U2: float
V2: float
") Bounds;
		static void Bounds(const opencascade::handle<Adaptor3d_HSurface> & S, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Continuity ******************/
		/**** md5 signature: 6fd78900dd50afbdc96d50e1e159ee93 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the order of continuity of the hsurface <s>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
int
") Continuity;
		static Standard_Integer Continuity(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** D1 ******************/
		/**** md5 signature: d1d64a7b4d697015545621cd8dfff2d0 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point <p> and first derivative <d1*> of parameter <u> and <v> on the hsurface <s>.

Parameters
----------
S: Adaptor3d_HSurface
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		static void D1(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		/**** md5 signature: 5049459f17910ae762d2b23d7dddba6d ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the point <p>, the first derivative <d1*> and second derivative <d2*> of parameter <u> and <v> on the hsurface <s>.

Parameters
----------
S: Adaptor3d_HSurface
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
		static void D2(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & DUV);

		/****************** DN ******************/
		/**** md5 signature: b1a239f1b3763bed60166997fbba9bb0 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
U: float
V: float
IU: int
IV: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real U, const Standard_Real V, const Standard_Integer IU, const Standard_Integer IV);

		/****************** Value ******************/
		/**** md5 signature: 44050e1becf438b9389ef3cc59c41b3f ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point <p> of parameter <u> and <v> on the hsurface <s>.

Parameters
----------
S: Adaptor3d_HSurface
U: float
V: float
P: gp_Pnt

Returns
-------
None
") Value;
		static void Value(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P);

};


%extend LProp3d_SurfaceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
