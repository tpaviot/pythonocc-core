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
%define BREPLPROPDOCSTRING
"BRepLProp module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_breplprop.html"
%enddef
%module (package="OCC.Core", docstring=BREPLPROPDOCSTRING) BRepLProp


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
#include<BRepLProp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<GeomAbs_module.hxx>
#include<gp_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<TopLoc_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TopoDS_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRepAdaptor.i
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
* class BRepLProp *
******************/
%rename(breplprop) BRepLProp;
class BRepLProp {
	public:
		/****** BRepLProp::Continuity ******/
		/****** md5 signature: baccdbebcd7cbea6bbd8e829a9341d66 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C1: BRepAdaptor_Curve
C2: BRepAdaptor_Curve
u1: float
u2: float
tl: float
ta: float

Return
-------
GeomAbs_Shape

Description
-----------
Computes the regularity at the junction between C1 and C2. The point u1 on C1 and the point u2 on C2 must be confused. tl and ta are the linear and angular tolerance used two compare the derivative.
") Continuity;
		static GeomAbs_Shape Continuity(const BRepAdaptor_Curve & C1, const BRepAdaptor_Curve & C2, const Standard_Real u1, const Standard_Real u2, const Standard_Real tl, const Standard_Real ta);

		/****** BRepLProp::Continuity ******/
		/****** md5 signature: 6e2749f77e1b8216030c4a38b7461152 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C1: BRepAdaptor_Curve
C2: BRepAdaptor_Curve
u1: float
u2: float

Return
-------
GeomAbs_Shape

Description
-----------
The same as preceding but using the standard tolerances from package Precision.
") Continuity;
		static GeomAbs_Shape Continuity(const BRepAdaptor_Curve & C1, const BRepAdaptor_Curve & C2, const Standard_Real u1, const Standard_Real u2);

};


%extend BRepLProp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepLProp_CLProps *
**************************/
class BRepLProp_CLProps {
	public:
		/****** BRepLProp_CLProps::BRepLProp_CLProps ******/
		/****** md5 signature: 1a49643bc4e2821082b45de7b9f24a4a ******/
		%feature("compactdefaultargs") BRepLProp_CLProps;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
N: int
Resolution: float

Return
-------
None

Description
-----------
Initializes the local properties of the curve <C> The current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <N> indicates the maximum number of derivations to be done (0, 1, 2 or 3). For example, to compute only the tangent, N should be equal to 1. <Resolution> is the linear tolerance (it is used to test if a vector is null).
") BRepLProp_CLProps;
		 BRepLProp_CLProps(const BRepAdaptor_Curve & C, const Standard_Integer N, const Standard_Real Resolution);

		/****** BRepLProp_CLProps::BRepLProp_CLProps ******/
		/****** md5 signature: f031debf6f0c1f6721a87e44c73e9f4a ******/
		%feature("compactdefaultargs") BRepLProp_CLProps;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U: float
N: int
Resolution: float

Return
-------
None

Description
-----------
Same as previous constructor but here the parameter is set to the value <U>. All the computations done will be related to <C> and <U>.
") BRepLProp_CLProps;
		 BRepLProp_CLProps(const BRepAdaptor_Curve & C, const Standard_Real U, const Standard_Integer N, const Standard_Real Resolution);

		/****** BRepLProp_CLProps::BRepLProp_CLProps ******/
		/****** md5 signature: 504921f37298616b340c5e5255b73e44 ******/
		%feature("compactdefaultargs") BRepLProp_CLProps;
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
") BRepLProp_CLProps;
		 BRepLProp_CLProps(const Standard_Integer N, const Standard_Real Resolution);

		/****** BRepLProp_CLProps::CentreOfCurvature ******/
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

		/****** BRepLProp_CLProps::Curvature ******/
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

		/****** BRepLProp_CLProps::D1 ******/
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

		/****** BRepLProp_CLProps::D2 ******/
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

		/****** BRepLProp_CLProps::D3 ******/
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

		/****** BRepLProp_CLProps::IsTangentDefined ******/
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

		/****** BRepLProp_CLProps::Normal ******/
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

		/****** BRepLProp_CLProps::SetCurve ******/
		/****** md5 signature: 16ffbdd576b192e6cef9ed8bb4f0155f ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
None

Description
-----------
Initializes the local properties of the curve for the new curve.
") SetCurve;
		void SetCurve(const BRepAdaptor_Curve & C);

		/****** BRepLProp_CLProps::SetParameter ******/
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

		/****** BRepLProp_CLProps::Tangent ******/
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

		/****** BRepLProp_CLProps::Value ******/
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


%extend BRepLProp_CLProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepLProp_CurveTool *
****************************/
class BRepLProp_CurveTool {
	public:
		/****** BRepLProp_CurveTool::Continuity ******/
		/****** md5 signature: deb6372304bc5f5551cfce8b2afe343b ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
int

Description
-----------
returns the order of continuity of the curve <C>. returns 1: first derivative only is computable returns 2: first and second derivative only are computable. returns 3: first, second and third are computable.
") Continuity;
		static Standard_Integer Continuity(const BRepAdaptor_Curve & C);

		/****** BRepLProp_CurveTool::D1 ******/
		/****** md5 signature: 5556be7cd9882922dfddd95e3b9c9ecf ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
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
		static void D1(const BRepAdaptor_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****** BRepLProp_CurveTool::D2 ******/
		/****** md5 signature: b2ec4e844fab19ed2485d22a8745268f ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
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
		static void D2(const BRepAdaptor_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** BRepLProp_CurveTool::D3 ******/
		/****** md5 signature: 77f327d302e5c58bef64f7dabd80585e ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
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
		static void D3(const BRepAdaptor_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** BRepLProp_CurveTool::FirstParameter ******/
		/****** md5 signature: 1757779ac38cb6ed7a7fc48dc2248f69 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
float

Description
-----------
returns the first parameter bound of the curve.
") FirstParameter;
		static Standard_Real FirstParameter(const BRepAdaptor_Curve & C);

		/****** BRepLProp_CurveTool::LastParameter ******/
		/****** md5 signature: e697bafb03d659fa87fd20dbec7f562b ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
float

Description
-----------
returns the last parameter bound of the curve. FirstParameter must be less than LastParamenter.
") LastParameter;
		static Standard_Real LastParameter(const BRepAdaptor_Curve & C);

		/****** BRepLProp_CurveTool::Value ******/
		/****** md5 signature: 65d38628809f38415a32a1ec24fc6507 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point <P> of parameter <U> on the curve <C>.
") Value;
		static void Value(const BRepAdaptor_Curve & C, const Standard_Real U, gp_Pnt & P);

};


%extend BRepLProp_CurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepLProp_SLProps *
**************************/
class BRepLProp_SLProps {
	public:
		/****** BRepLProp_SLProps::BRepLProp_SLProps ******/
		/****** md5 signature: 0c538cfe6a82c86c790f840f0386d6b1 ******/
		%feature("compactdefaultargs") BRepLProp_SLProps;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
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
") BRepLProp_SLProps;
		 BRepLProp_SLProps(const BRepAdaptor_Surface & S, const Standard_Real U, const Standard_Real V, const Standard_Integer N, const Standard_Real Resolution);

		/****** BRepLProp_SLProps::BRepLProp_SLProps ******/
		/****** md5 signature: f3d887c52ee6619edb5ff58343950716 ******/
		%feature("compactdefaultargs") BRepLProp_SLProps;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
N: int
Resolution: float

Return
-------
None

Description
-----------
idem as previous constructor but without setting the value of parameters <U> and <V>.
") BRepLProp_SLProps;
		 BRepLProp_SLProps(const BRepAdaptor_Surface & S, const Standard_Integer N, const Standard_Real Resolution);

		/****** BRepLProp_SLProps::BRepLProp_SLProps ******/
		/****** md5 signature: c7ec334fa138f1ff8f4638fc2305ddd2 ******/
		%feature("compactdefaultargs") BRepLProp_SLProps;
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
") BRepLProp_SLProps;
		 BRepLProp_SLProps(const Standard_Integer N, const Standard_Real Resolution);

		/****** BRepLProp_SLProps::CurvatureDirections ******/
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

		/****** BRepLProp_SLProps::D1U ******/
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

		/****** BRepLProp_SLProps::D1V ******/
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

		/****** BRepLProp_SLProps::D2U ******/
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

		/****** BRepLProp_SLProps::D2V ******/
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

		/****** BRepLProp_SLProps::DUV ******/
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

		/****** BRepLProp_SLProps::GaussianCurvature ******/
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

		/****** BRepLProp_SLProps::IsCurvatureDefined ******/
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

		/****** BRepLProp_SLProps::IsNormalDefined ******/
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

		/****** BRepLProp_SLProps::IsTangentUDefined ******/
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

		/****** BRepLProp_SLProps::IsTangentVDefined ******/
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

		/****** BRepLProp_SLProps::IsUmbilic ******/
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

		/****** BRepLProp_SLProps::MaxCurvature ******/
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

		/****** BRepLProp_SLProps::MeanCurvature ******/
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

		/****** BRepLProp_SLProps::MinCurvature ******/
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

		/****** BRepLProp_SLProps::Normal ******/
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

		/****** BRepLProp_SLProps::SetParameters ******/
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

		/****** BRepLProp_SLProps::SetSurface ******/
		/****** md5 signature: 41e768e2032242489b7e47453e532b38 ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
None

Description
-----------
Initializes the local properties of the surface S for the new surface.
") SetSurface;
		void SetSurface(const BRepAdaptor_Surface & S);

		/****** BRepLProp_SLProps::TangentU ******/
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

		/****** BRepLProp_SLProps::TangentV ******/
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

		/****** BRepLProp_SLProps::Value ******/
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


%extend BRepLProp_SLProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepLProp_SurfaceTool *
******************************/
class BRepLProp_SurfaceTool {
	public:
		/****** BRepLProp_SurfaceTool::Bounds ******/
		/****** md5 signature: 9f222222d1abc0624ca035e2237c12e9 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

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
		static void Bounds(const BRepAdaptor_Surface & S, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepLProp_SurfaceTool::Continuity ******/
		/****** md5 signature: 1abb71ed0bc5bcb3851914dafde6a11a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface

Return
-------
int

Description
-----------
returns the order of continuity of the Surface <S>. returns 1: first derivative only is computable returns 2: first and second derivative only are computable.
") Continuity;
		static Standard_Integer Continuity(const BRepAdaptor_Surface & S);

		/****** BRepLProp_SurfaceTool::D1 ******/
		/****** md5 signature: 592559bc5aad46ba1e187df1e73ad838 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
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
		static void D1(const BRepAdaptor_Surface & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** BRepLProp_SurfaceTool::D2 ******/
		/****** md5 signature: de4e2652f2ad0c2c1311b2378022ff48 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
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
		static void D2(const BRepAdaptor_Surface & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & DUV);

		/****** BRepLProp_SurfaceTool::DN ******/
		/****** md5 signature: 1825dd18a8c364e4f7501ee91f1451c8 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
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
		static gp_Vec DN(const BRepAdaptor_Surface & S, const Standard_Real U, const Standard_Real V, const Standard_Integer IU, const Standard_Integer IV);

		/****** BRepLProp_SurfaceTool::Value ******/
		/****** md5 signature: 9a6a14f79920621cefc6c72b5af26b36 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
S: BRepAdaptor_Surface
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
		static void Value(const BRepAdaptor_Surface & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P);

};


%extend BRepLProp_SurfaceTool {
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
def breplprop_Continuity(*args):
	return breplprop.Continuity(*args)

@deprecated
def breplprop_Continuity(*args):
	return breplprop.Continuity(*args)

@deprecated
def BRepLProp_CurveTool_Continuity(*args):
	return BRepLProp_CurveTool.Continuity(*args)

@deprecated
def BRepLProp_CurveTool_D1(*args):
	return BRepLProp_CurveTool.D1(*args)

@deprecated
def BRepLProp_CurveTool_D2(*args):
	return BRepLProp_CurveTool.D2(*args)

@deprecated
def BRepLProp_CurveTool_D3(*args):
	return BRepLProp_CurveTool.D3(*args)

@deprecated
def BRepLProp_CurveTool_FirstParameter(*args):
	return BRepLProp_CurveTool.FirstParameter(*args)

@deprecated
def BRepLProp_CurveTool_LastParameter(*args):
	return BRepLProp_CurveTool.LastParameter(*args)

@deprecated
def BRepLProp_CurveTool_Value(*args):
	return BRepLProp_CurveTool.Value(*args)

@deprecated
def BRepLProp_SurfaceTool_Bounds(*args):
	return BRepLProp_SurfaceTool.Bounds(*args)

@deprecated
def BRepLProp_SurfaceTool_Continuity(*args):
	return BRepLProp_SurfaceTool.Continuity(*args)

@deprecated
def BRepLProp_SurfaceTool_D1(*args):
	return BRepLProp_SurfaceTool.D1(*args)

@deprecated
def BRepLProp_SurfaceTool_D2(*args):
	return BRepLProp_SurfaceTool.D2(*args)

@deprecated
def BRepLProp_SurfaceTool_DN(*args):
	return BRepLProp_SurfaceTool.DN(*args)

@deprecated
def BRepLProp_SurfaceTool_Value(*args):
	return BRepLProp_SurfaceTool.Value(*args)

}
