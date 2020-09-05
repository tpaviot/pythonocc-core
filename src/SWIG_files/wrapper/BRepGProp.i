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
%define BREPGPROPDOCSTRING
"BRepGProp module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepgprop.html"
%enddef
%module (package="OCC.Core", docstring=BREPGPROPDOCSTRING) BRepGProp


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
#include<BRepGProp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<GProp_module.hxx>
#include<gp_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColgp_module.hxx>
#include<math_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Message_module.hxx>
#include<Bnd_module.hxx>
#include<TShort_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import GProp.i
%import gp.i
%import BRepAdaptor.i
%import TColStd.i
%import GeomAbs.i
%import TColgp.i
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

/******************
* class BRepGProp *
******************/
%rename(brepgprop) BRepGProp;
class BRepGProp {
	public:
		/****************** LinearProperties ******************/
		/**** md5 signature: a063d5e771c7cceda8fc1f79fdc01d30 ****/
		%feature("compactdefaultargs") LinearProperties;
		%feature("autodoc", "Computes the linear global properties of the shape s, i.e. the global properties induced by each edge of the shape s, and brings them together with the global properties still retained by the framework lprops. if the current system of lprops was empty, its global properties become equal to the linear global properties of s. for this computation no linear density is attached to the edges. so, for example, the added mass corresponds to the sum of the lengths of the edges of s. the density of the composed systems, i.e. that of each component of the current system of lprops, and that of s which is considered to be equal to 1, must be coherent. note that this coherence cannot be checked. you are advised to use a separate framework for each density, and then to bring these frameworks together into a global one. the point relative to which the inertia of the system is computed is the reference point of the framework lprops. note: if your programming ensures that the framework lprops retains only linear global properties (brought together for example, by the function linearproperties) for objects the density of which is equal to 1 (or is not defined), the function mass will return the total length of edges of the system analysed by lprops. warning no check is performed to verify that the shape s retains truly linear properties. if s is simply a vertex, it is not considered to present any additional global properties. skipshared is a special flag, which allows taking in calculation shared topological entities or not. for ex., if skipshared = true, edges, shared by two or more faces, are taken into calculation only once. if we have cube with sizes 1, 1, 1, its linear properties = 12 for skipedges = true and 24 for skipedges = false. usetriangulation is a special flag, which defines preferable source of geometry data. if usetriangulation = standard_false, exact geometry objects (curves) are used, otherwise polygons of triangulation are used first.

Parameters
----------
S: TopoDS_Shape
LProps: GProp_GProps
SkipShared: bool,optional
	default value is Standard_False
UseTriangulation: bool,optional
	default value is Standard_False

Returns
-------
None
") LinearProperties;
		static void LinearProperties(const TopoDS_Shape & S, GProp_GProps & LProps, const Standard_Boolean SkipShared = Standard_False, const Standard_Boolean UseTriangulation = Standard_False);

		/****************** SurfaceProperties ******************/
		/**** md5 signature: de09a2b35153022287aa2a8431deaef5 ****/
		%feature("compactdefaultargs") SurfaceProperties;
		%feature("autodoc", "Computes the surface global properties of the shape s, i.e. the global properties induced by each face of the shape s, and brings them together with the global properties still retained by the framework sprops. if the current system of sprops was empty, its global properties become equal to the surface global properties of s. for this computation, no surface density is attached to the faces. consequently, the added mass corresponds to the sum of the areas of the faces of s. the density of the component systems, i.e. that of each component of the current system of sprops, and that of s which is considered to be equal to 1, must be coherent. note that this coherence cannot be checked. you are advised to use a framework for each different value of density, and then to bring these frameworks together into a global one. the point relative to which the inertia of the system is computed is the reference point of the framework sprops. note : if your programming ensures that the framework sprops retains only surface global properties, brought together, for example, by the function surfaceproperties, for objects the density of which is equal to 1 (or is not defined), the function mass will return the total area of faces of the system analysed by sprops. warning no check is performed to verify that the shape s retains truly surface properties. if s is simply a vertex, an edge or a wire, it is not considered to present any additional global properties. skipshared is a special flag, which allows taking in calculation shared topological entities or not. for ex., if skipshared = true, faces, shared by two or more shells, are taken into calculation only once. usetriangulation is a special flag, which defines preferable source of geometry data. if usetriangulation = standard_false, exact geometry objects (surfaces) are used, otherwise face triangulations are used first.

Parameters
----------
S: TopoDS_Shape
SProps: GProp_GProps
SkipShared: bool,optional
	default value is Standard_False
UseTriangulation: bool,optional
	default value is Standard_False

Returns
-------
None
") SurfaceProperties;
		static void SurfaceProperties(const TopoDS_Shape & S, GProp_GProps & SProps, const Standard_Boolean SkipShared = Standard_False, const Standard_Boolean UseTriangulation = Standard_False);

		/****************** SurfaceProperties ******************/
		/**** md5 signature: 98c472661263186b1d30e4379dd9db78 ****/
		%feature("compactdefaultargs") SurfaceProperties;
		%feature("autodoc", "Updates <sprops> with the shape <s>, that contains its pricipal properties. the surface properties of all the faces in <s> are computed. adaptive 2d gauss integration is used. parameter eps sets maximal relative error of computed mass (area) for each face. error is calculated as abs((m(i+1)-m(i))/m(i+1)), m(i+1) and m(i) are values for two successive steps of adaptive integration. method returns estimation of relative error reached for whole shape. warning: if eps > 0.001 algorithm performs non-adaptive integration. skipshared is a special flag, which allows taking in calculation shared topological entities or not for ex., if skipshared = true, faces, shared by two or more shells, are taken into calculation only once.

Parameters
----------
S: TopoDS_Shape
SProps: GProp_GProps
Eps: float
SkipShared: bool,optional
	default value is Standard_False

Returns
-------
float
") SurfaceProperties;
		static Standard_Real SurfaceProperties(const TopoDS_Shape & S, GProp_GProps & SProps, const Standard_Real Eps, const Standard_Boolean SkipShared = Standard_False);

		/****************** VolumeProperties ******************/
		/**** md5 signature: 33909e093cf59347d7db0b4d010a93f5 ****/
		%feature("compactdefaultargs") VolumeProperties;
		%feature("autodoc", "//! computes the global volume properties of the solid s, and brings them together with the global properties still retained by the framework vprops. if the current system of vprops was empty, its global properties become equal to the global properties of s for volume. for this computation, no volume density is attached to the solid. consequently, the added mass corresponds to the volume of s. the density of the component systems, i.e. that of each component of the current system of vprops, and that of s which is considered to be equal to 1, must be coherent to each other. note that this coherence cannot be checked. you are advised to use a separate framework for each density, and then to bring these frameworks together into a global one. the point relative to which the inertia of the system is computed is the reference point of the framework vprops. note: if your programming ensures that the framework vprops retains only global properties of volume (brought together for example, by the function volumeproperties) for objects the density of which is equal to 1 (or is not defined), the function mass will return the total volume of the solids of the system analysed by vprops. warning the shape s must represent an object whose global volume properties can be computed. it may be a finite solid, or a series of finite solids all oriented in a coherent way. nonetheless, s must be exempt of any free boundary. note that these conditions of coherence are not checked by this algorithm, and results will be false if they are not respected. skipshared a is special flag, which allows taking in calculation shared topological entities or not. for ex., if skipshared = true, the volumes formed by the equal (the same tshape, location and orientation) faces are taken into calculation only once. usetriangulation is a special flag, which defines preferable source of geometry data. if usetriangulation = standard_false, exact geometry objects (surfaces) are used, otherwise face triangulations are used first.

Parameters
----------
S: TopoDS_Shape
VProps: GProp_GProps
OnlyClosed: bool,optional
	default value is Standard_False
SkipShared: bool,optional
	default value is Standard_False
UseTriangulation: bool,optional
	default value is Standard_False

Returns
-------
None
") VolumeProperties;
		static void VolumeProperties(const TopoDS_Shape & S, GProp_GProps & VProps, const Standard_Boolean OnlyClosed = Standard_False, const Standard_Boolean SkipShared = Standard_False, const Standard_Boolean UseTriangulation = Standard_False);

		/****************** VolumeProperties ******************/
		/**** md5 signature: 04af0768aae13f233016a52d30fcfdbb ****/
		%feature("compactdefaultargs") VolumeProperties;
		%feature("autodoc", "Updates <vprops> with the shape <s>, that contains its pricipal properties. the volume properties of all the forward and reversed faces in <s> are computed. if onlyclosed is true then computed faces must belong to closed shells. adaptive 2d gauss integration is used. parameter eps sets maximal relative error of computed mass (volume) for each face. error is calculated as abs((m(i+1)-m(i))/m(i+1)), m(i+1) and m(i) are values for two successive steps of adaptive integration. method returns estimation of relative error reached for whole shape. warning: if eps > 0.001 algorithm performs non-adaptive integration. skipshared is a special flag, which allows taking in calculation shared topological entities or not. for ex., if skipshared = true, the volumes formed by the equal (the same tshape, location and orientation) faces are taken into calculation only once.

Parameters
----------
S: TopoDS_Shape
VProps: GProp_GProps
Eps: float
OnlyClosed: bool,optional
	default value is Standard_False
SkipShared: bool,optional
	default value is Standard_False

Returns
-------
float
") VolumeProperties;
		static Standard_Real VolumeProperties(const TopoDS_Shape & S, GProp_GProps & VProps, const Standard_Real Eps, const Standard_Boolean OnlyClosed = Standard_False, const Standard_Boolean SkipShared = Standard_False);

		/****************** VolumePropertiesGK ******************/
		/**** md5 signature: 350eb5f7ad614101e55a9b0c0afcdb22 ****/
		%feature("compactdefaultargs") VolumePropertiesGK;
		%feature("autodoc", "Updates <vprops> with the shape <s>, that contains its pricipal properties. the volume properties of all the forward and reversed faces in <s> are computed. if onlyclosed is true then computed faces must belong to closed shells. adaptive 2d gauss integration is used. parameter isusespan says if it is necessary to define spans on a face. this option has an effect only for bspline faces. parameter eps sets maximal relative error of computed property for each face. error is delivered by the adaptive gauss-kronrod method of integral computation that is used for properties computation. method returns estimation of relative error reached for whole shape. returns negative value if the computation is failed. skipshared is a special flag, which allows taking in calculation shared topological entities or not. for ex., if skipshared = true, the volumes formed by the equal (the same tshape, location and orientation) faces are taken into calculation only once.

Parameters
----------
S: TopoDS_Shape
VProps: GProp_GProps
Eps: float,optional
	default value is 0.001
OnlyClosed: bool,optional
	default value is Standard_False
IsUseSpan: bool,optional
	default value is Standard_False
CGFlag: bool,optional
	default value is Standard_False
IFlag: bool,optional
	default value is Standard_False
SkipShared: bool,optional
	default value is Standard_False

Returns
-------
float
") VolumePropertiesGK;
		static Standard_Real VolumePropertiesGK(const TopoDS_Shape & S, GProp_GProps & VProps, const Standard_Real Eps = 0.001, const Standard_Boolean OnlyClosed = Standard_False, const Standard_Boolean IsUseSpan = Standard_False, const Standard_Boolean CGFlag = Standard_False, const Standard_Boolean IFlag = Standard_False, const Standard_Boolean SkipShared = Standard_False);

		/****************** VolumePropertiesGK ******************/
		/**** md5 signature: 79b57301830c4c31a5b43904d7943185 ****/
		%feature("compactdefaultargs") VolumePropertiesGK;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
VProps: GProp_GProps
thePln: gp_Pln
Eps: float,optional
	default value is 0.001
OnlyClosed: bool,optional
	default value is Standard_False
IsUseSpan: bool,optional
	default value is Standard_False
CGFlag: bool,optional
	default value is Standard_False
IFlag: bool,optional
	default value is Standard_False
SkipShared: bool,optional
	default value is Standard_False

Returns
-------
float
") VolumePropertiesGK;
		static Standard_Real VolumePropertiesGK(const TopoDS_Shape & S, GProp_GProps & VProps, const gp_Pln & thePln, const Standard_Real Eps = 0.001, const Standard_Boolean OnlyClosed = Standard_False, const Standard_Boolean IsUseSpan = Standard_False, const Standard_Boolean CGFlag = Standard_False, const Standard_Boolean IFlag = Standard_False, const Standard_Boolean SkipShared = Standard_False);

};


%extend BRepGProp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepGProp_Cinert *
*************************/
class BRepGProp_Cinert : public GProp_GProps {
	public:
		/****************** BRepGProp_Cinert ******************/
		/**** md5 signature: ad62a1230096650569eb6d35241343b0 ****/
		%feature("compactdefaultargs") BRepGProp_Cinert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepGProp_Cinert;
		 BRepGProp_Cinert();

		/****************** BRepGProp_Cinert ******************/
		/**** md5 signature: 40e8a04c04175d96e9078dec540e1699 ****/
		%feature("compactdefaultargs") BRepGProp_Cinert;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve
CLocation: gp_Pnt

Returns
-------
None
") BRepGProp_Cinert;
		 BRepGProp_Cinert(const BRepAdaptor_Curve & C, const gp_Pnt & CLocation);

		/****************** Perform ******************/
		/**** md5 signature: b1a2ad101c61982e2656809aff72ca36 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
None
") Perform;
		void Perform(const BRepAdaptor_Curve & C);

		/****************** SetLocation ******************/
		/**** md5 signature: 5ed92b27e15802cdea187cf4e43b346a ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "No available documentation.

Parameters
----------
CLocation: gp_Pnt

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt & CLocation);

};


%extend BRepGProp_Cinert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepGProp_Domain *
*************************/
class BRepGProp_Domain {
	public:
		/****************** BRepGProp_Domain ******************/
		/**** md5 signature: 7986cd2cf79fcfafe2e1c074b6ca854d ****/
		%feature("compactdefaultargs") BRepGProp_Domain;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepGProp_Domain;
		 BRepGProp_Domain();

		/****************** BRepGProp_Domain ******************/
		/**** md5 signature: 3c6bdfefe3d3a9f2a2d3d47449b74a3b ****/
		%feature("compactdefaultargs") BRepGProp_Domain;
		%feature("autodoc", "Constructor. initializes the domain with the face.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") BRepGProp_Domain;
		 BRepGProp_Domain(const TopoDS_Face & F);

		/****************** Init ******************/
		/**** md5 signature: a8dfaa68079e743e08190fe58d950a9a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the domain with the face.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & F);

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the exploration with the face already set.

Returns
-------
None
") Init;
		void Init();

		/****************** More ******************/
		/**** md5 signature: f2144011648ae849666b28430a27a0ea ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is another arc of curve in the list.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Sets the index of the arc iterator to the next arc of curve.

Returns
-------
None
") Next;
		void Next();

		/****************** Value ******************/
		/**** md5 signature: 908df29e834e8aebb610870c9cea1651 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current edge.

Returns
-------
TopoDS_Edge
") Value;
		const TopoDS_Edge Value();

};


%extend BRepGProp_Domain {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepGProp_EdgeTool *
***************************/
class BRepGProp_EdgeTool {
	public:
		/****************** D1 ******************/
		/**** md5 signature: 5556be7cd9882922dfddd95e3b9c9ecf ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the point of parameter u and the first derivative at this point.

Parameters
----------
C: BRepAdaptor_Curve
U: float
P: gp_Pnt
V1: gp_Vec

Returns
-------
None
") D1;
		static void D1(const BRepAdaptor_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****************** FirstParameter ******************/
		/**** md5 signature: 1757779ac38cb6ed7a7fc48dc2248f69 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the parametric value of the start point of the curve. the curve is oriented from the start point to the end point.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const BRepAdaptor_Curve & C);

		/****************** IntegrationOrder ******************/
		/**** md5 signature: 7daceb790afa0c813f14f4153aca3dd9 ****/
		%feature("compactdefaultargs") IntegrationOrder;
		%feature("autodoc", "Returns the number of gauss points required to do the integration with a good accuracy using the gauss method. for a polynomial curve of degree n the maxima of accuracy is obtained with an order of integration equal to 2*n-1.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
int
") IntegrationOrder;
		static Standard_Integer IntegrationOrder(const BRepAdaptor_Curve & C);

		/****************** Intervals ******************/
		/**** md5 signature: f429463d75cd548af36c429f480bc438 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
C: BRepAdaptor_Curve
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		static void Intervals(const BRepAdaptor_Curve & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** LastParameter ******************/
		/**** md5 signature: e697bafb03d659fa87fd20dbec7f562b ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the parametric value of the end point of the curve. the curve is oriented from the start point to the end point.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const BRepAdaptor_Curve & C);

		/****************** NbIntervals ******************/
		/**** md5 signature: c4391d4034556532fdf723807037192a ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
C: BRepAdaptor_Curve
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		static Standard_Integer NbIntervals(const BRepAdaptor_Curve & C, const GeomAbs_Shape S);

		/****************** Value ******************/
		/**** md5 signature: 23b56266cc1e7b195b61ae726893d32f ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point of parameter u on the loaded curve.

Parameters
----------
C: BRepAdaptor_Curve
U: float

Returns
-------
gp_Pnt
") Value;
		static gp_Pnt Value(const BRepAdaptor_Curve & C, const Standard_Real U);

};


%extend BRepGProp_EdgeTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepGProp_Face *
***********************/
class BRepGProp_Face {
	public:
		/****************** BRepGProp_Face ******************/
		/**** md5 signature: bc73a426a381f81aa03dcc1823778dd2 ****/
		%feature("compactdefaultargs") BRepGProp_Face;
		%feature("autodoc", "Constructor. initializes the object with a flag isusespan that says if it is necessary to define spans on a face. this option has an effect only for bspline faces. spans are returned by the methods getuknots and gettknots.

Parameters
----------
IsUseSpan: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepGProp_Face;
		 BRepGProp_Face(const Standard_Boolean IsUseSpan = Standard_False);

		/****************** BRepGProp_Face ******************/
		/**** md5 signature: 85e85a5b8783b4d37ef3421a4493b8bf ****/
		%feature("compactdefaultargs") BRepGProp_Face;
		%feature("autodoc", "Constructor. initializes the object with the face and the flag isusespan that says if it is necessary to define spans on a face. this option has an effect only for bspline faces. spans are returned by the methods getuknots and gettknots.

Parameters
----------
F: TopoDS_Face
IsUseSpan: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepGProp_Face;
		 BRepGProp_Face(const TopoDS_Face & F, const Standard_Boolean IsUseSpan = Standard_False);

		/****************** Bounds ******************/
		/**** md5 signature: f30c35e741e636532fbff37cccb741f7 ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric bounds of the face.

Parameters
----------

Returns
-------
U1: float
U2: float
V1: float
V2: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D12d ******************/
		/**** md5 signature: 93778e4127f5c48e81f47d36c5a6f892 ****/
		%feature("compactdefaultargs") D12d;
		%feature("autodoc", "Returns the point of parameter u and the first derivative at this point of a boundary curve.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D12d;
		void D12d(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** FirstParameter ******************/
		/**** md5 signature: 4ccedbaad83be904f510b4760c75f69c ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the parametric value of the start point of the current arc of curve.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetFace ******************/
		/**** md5 signature: 24f8605987955c9a8fdd14219215e9a9 ****/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "Returns the topods face.

Returns
-------
TopoDS_Face
") GetFace;
		const TopoDS_Face GetFace();

		/****************** GetTKnots ******************/
		/**** md5 signature: 4b2a2cee8551d61043503150f4f516ad ****/
		%feature("compactdefaultargs") GetTKnots;
		%feature("autodoc", "Returns an array of combination of t knots of the arc and v knots of the face. the first and last elements of the array will be thetmin and thetmax. the middle elements will be the knots of the arc and the values of parameters of arc on which the value points have v coordinates close to v knots of face. all the parameter will be greater then thetmin and lower then thetmax in increasing order. if the face is not a bspline, the array initialized with thetmin and thetmax only.

Parameters
----------
theTMin: float
theTMax: float
theTKnots: TColStd_HArray1OfReal

Returns
-------
None
") GetTKnots;
		void GetTKnots(const Standard_Real theTMin, const Standard_Real theTMax, opencascade::handle<TColStd_HArray1OfReal> & theTKnots);

		/****************** GetUKnots ******************/
		/**** md5 signature: 2b537a9010295a9da0b784859dd3d427 ****/
		%feature("compactdefaultargs") GetUKnots;
		%feature("autodoc", "Returns an array of u knots of the face. the first and last elements of the array will be theumin and theumax. the middle elements will be the u knots of the face greater then theumin and lower then theumax in increasing order. if the face is not a bspline, the array initialized with theumin and theumax only.

Parameters
----------
theUMin: float
theUMax: float
theUKnots: TColStd_HArray1OfReal

Returns
-------
None
") GetUKnots;
		void GetUKnots(const Standard_Real theUMin, const Standard_Real theUMax, opencascade::handle<TColStd_HArray1OfReal> & theUKnots);

		/****************** IntegrationOrder ******************/
		/**** md5 signature: 9d941348f9e90be3833675d84fa7e21c ****/
		%feature("compactdefaultargs") IntegrationOrder;
		%feature("autodoc", "Returns the number of points required to do the integration along the parameter of curve.

Returns
-------
int
") IntegrationOrder;
		Standard_Integer IntegrationOrder();

		/****************** LIntOrder ******************/
		/**** md5 signature: 582e14b0c3c2657678510ec5664dbbb0 ****/
		%feature("compactdefaultargs") LIntOrder;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eps: float

Returns
-------
int
") LIntOrder;
		Standard_Integer LIntOrder(const Standard_Real Eps);

		/****************** LIntSubs ******************/
		/**** md5 signature: 16c426ad00e717ef57398a45ebfc358f ****/
		%feature("compactdefaultargs") LIntSubs;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") LIntSubs;
		Standard_Integer LIntSubs();

		/****************** LKnots ******************/
		/**** md5 signature: 07b04b3724b0b2fbe94f59381afd67f8 ****/
		%feature("compactdefaultargs") LKnots;
		%feature("autodoc", "No available documentation.

Parameters
----------
Knots: TColStd_Array1OfReal

Returns
-------
None
") LKnots;
		void LKnots(TColStd_Array1OfReal & Knots);

		/****************** LastParameter ******************/
		/**** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the parametric value of the end point of the current arc of curve.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Load ******************/
		/**** md5 signature: 1d17d2edcb9829efe827b1a9573fcbcc ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") Load;
		void Load(const TopoDS_Face & F);

		/****************** Load ******************/
		/**** md5 signature: a134b46b97307c985b809bb67244f2bb ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Loading the boundary arc. returns false if edge has no p-curve.

Parameters
----------
E: TopoDS_Edge

Returns
-------
bool
") Load;
		bool Load(const TopoDS_Edge & E);

		/****************** Load ******************/
		/**** md5 signature: ffd6e58ac396ac9b7d7e4df3c0deaa4f ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Loading the boundary arc. this arc is either a top, bottom, left or right bound of a uv rectangle in which the parameters of surface are defined. if isfirstparam is equal to standard_true, the face is initialized by either left of bottom bound. otherwise it is initialized by the top or right one. if theisotype is equal to geomabs_isou, the face is initialized with either left or right bound. otherwise - with either top or bottom one.

Parameters
----------
IsFirstParam: bool
theIsoType: GeomAbs_IsoType

Returns
-------
None
") Load;
		void Load(const Standard_Boolean IsFirstParam, const GeomAbs_IsoType theIsoType);

		/****************** NaturalRestriction ******************/
		/**** md5 signature: 6d92e56f229bd8624f08e276baf74517 ****/
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", "Returns standard_true if the face is not trimmed.

Returns
-------
bool
") NaturalRestriction;
		Standard_Boolean NaturalRestriction();

		/****************** Normal ******************/
		/**** md5 signature: 9745e642c531c846aa947dd9b97ad423 ****/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Computes the point of parameter u, v on the face <s> and the normal to the face at this point.

Parameters
----------
U: float
V: float
P: gp_Pnt
VNor: gp_Vec

Returns
-------
None
") Normal;
		void Normal(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & VNor);

		/****************** SIntOrder ******************/
		/**** md5 signature: 36292a47be4c367eb9dd3ca5f7273d94 ****/
		%feature("compactdefaultargs") SIntOrder;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eps: float

Returns
-------
int
") SIntOrder;
		Standard_Integer SIntOrder(const Standard_Real Eps);

		/****************** SUIntSubs ******************/
		/**** md5 signature: bc04bb78232627d9fab2105fd2ec9a4e ****/
		%feature("compactdefaultargs") SUIntSubs;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") SUIntSubs;
		Standard_Integer SUIntSubs();

		/****************** SVIntSubs ******************/
		/**** md5 signature: f41bbeaf2802182d7d4f7ed8d1b07918 ****/
		%feature("compactdefaultargs") SVIntSubs;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") SVIntSubs;
		Standard_Integer SVIntSubs();

		/****************** UIntegrationOrder ******************/
		/**** md5 signature: 4cad12b0505b12eb0d45277d3a20b18a ****/
		%feature("compactdefaultargs") UIntegrationOrder;
		%feature("autodoc", "Returns the number of points required to do the integration in the u parametric direction with a good accuracy.

Returns
-------
int
") UIntegrationOrder;
		Standard_Integer UIntegrationOrder();

		/****************** UKnots ******************/
		/**** md5 signature: 7bdd1f4e1d034b241c5401d5734966da ****/
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "No available documentation.

Parameters
----------
Knots: TColStd_Array1OfReal

Returns
-------
None
") UKnots;
		void UKnots(TColStd_Array1OfReal & Knots);

		/****************** VIntegrationOrder ******************/
		/**** md5 signature: 66cfa3ec86dcabc0824b4974d0d2ad4b ****/
		%feature("compactdefaultargs") VIntegrationOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VIntegrationOrder;
		Standard_Integer VIntegrationOrder();

		/****************** VKnots ******************/
		/**** md5 signature: 10545876365ec66fe3480d5137c1d815 ****/
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "No available documentation.

Parameters
----------
Knots: TColStd_Array1OfReal

Returns
-------
None
") VKnots;
		void VKnots(TColStd_Array1OfReal & Knots);

		/****************** Value2d ******************/
		/**** md5 signature: 1a87b688d0ec3774db81418d79b79935 ****/
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "Returns the value of the boundary curve of the face.

Parameters
----------
U: float

Returns
-------
gp_Pnt2d
") Value2d;
		gp_Pnt2d Value2d(const Standard_Real U);

};


%extend BRepGProp_Face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepGProp_Gauss *
************************/
class BRepGProp_Gauss {
	public:
		class Inertia {};
/* public enums */
enum BRepGProp_GaussType {
	Vinert = 0,
	Sinert = 1,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class BRepGProp_GaussType(IntEnum):
	Vinert = 0
	Sinert = 1
Vinert = BRepGProp_GaussType.Vinert
Sinert = BRepGProp_GaussType.Sinert
};
/* end python proxy for enums */

		/****************** BRepGProp_Gauss ******************/
		/**** md5 signature: 4283597bc19e7ea4dfb5f08dc8fe2240 ****/
		%feature("compactdefaultargs") BRepGProp_Gauss;
		%feature("autodoc", "Constructor.

Parameters
----------
theType: BRepGProp_GaussType

Returns
-------
None
") BRepGProp_Gauss;
		 BRepGProp_Gauss(BRepGProp_GaussType theType);

};


%extend BRepGProp_Gauss {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Compute(self):
		pass
	}
};

/*****************************
* class BRepGProp_MeshCinert *
*****************************/
class BRepGProp_MeshCinert : public GProp_GProps {
	public:
		/****************** BRepGProp_MeshCinert ******************/
		/**** md5 signature: 4168f86123ec390b74beda6034b261f9 ****/
		%feature("compactdefaultargs") BRepGProp_MeshCinert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepGProp_MeshCinert;
		 BRepGProp_MeshCinert();

		/****************** Perform ******************/
		/**** md5 signature: 46c6f3603ea512468eace177c45e5d6b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the global properties of of polylines represented by set of points.

Parameters
----------
theNodes: TColgp_Array1OfPnt

Returns
-------
None
") Perform;
		void Perform(const TColgp_Array1OfPnt & theNodes);

		/****************** PreparePolygon ******************/
		/**** md5 signature: 192567ee3ab19fdaa0db914f60c7fde9 ****/
		%feature("compactdefaultargs") PreparePolygon;
		%feature("autodoc", "Prepare set of 3d points on base of any available edge polygons: 3d polygon, polygon on triangulation, 2d polygon on surface if edge has no polygons, array thepolyg is left unchanged.

Parameters
----------
theE: TopoDS_Edge
thePolyg: TColgp_HArray1OfPnt

Returns
-------
None
") PreparePolygon;
		static void PreparePolygon(const TopoDS_Edge & theE, opencascade::handle<TColgp_HArray1OfPnt> & thePolyg);

		/****************** SetLocation ******************/
		/**** md5 signature: 5ed92b27e15802cdea187cf4e43b346a ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "No available documentation.

Parameters
----------
CLocation: gp_Pnt

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt & CLocation);

};


%extend BRepGProp_MeshCinert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepGProp_MeshProps *
****************************/
/*************************
* class BRepGProp_Sinert *
*************************/
class BRepGProp_Sinert : public GProp_GProps {
	public:
		/****************** BRepGProp_Sinert ******************/
		/**** md5 signature: 30a453e8dacad302931072d4b523dd24 ****/
		%feature("compactdefaultargs") BRepGProp_Sinert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepGProp_Sinert;
		 BRepGProp_Sinert();

		/****************** BRepGProp_Sinert ******************/
		/**** md5 signature: b82fc330e2f8068a37939fb7a1d44b4e ****/
		%feature("compactdefaultargs") BRepGProp_Sinert;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
SLocation: gp_Pnt

Returns
-------
None
") BRepGProp_Sinert;
		 BRepGProp_Sinert(const BRepGProp_Face & S, const gp_Pnt & SLocation);

		/****************** BRepGProp_Sinert ******************/
		/**** md5 signature: 10b645adb9e1d14109d3264defc257f1 ****/
		%feature("compactdefaultargs") BRepGProp_Sinert;
		%feature("autodoc", "Builds a sinert to evaluate the global properties of the face <s>. if isnaturalrestriction is true the domain of s is defined with the natural bounds, else it defined with an iterator of edge from topods (see domaintool from gprop).

Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
SLocation: gp_Pnt

Returns
-------
None
") BRepGProp_Sinert;
		 BRepGProp_Sinert(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pnt & SLocation);

		/****************** BRepGProp_Sinert ******************/
		/**** md5 signature: 74ce3ffece3e8a1edd918b0dd45da546 ****/
		%feature("compactdefaultargs") BRepGProp_Sinert;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
SLocation: gp_Pnt
Eps: float

Returns
-------
None
") BRepGProp_Sinert;
		 BRepGProp_Sinert(BRepGProp_Face & S, const gp_Pnt & SLocation, const Standard_Real Eps);

		/****************** BRepGProp_Sinert ******************/
		/**** md5 signature: a08ec0516fd40a598790191badfd6a24 ****/
		%feature("compactdefaultargs") BRepGProp_Sinert;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
SLocation: gp_Pnt
Eps: float

Returns
-------
None
") BRepGProp_Sinert;
		 BRepGProp_Sinert(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pnt & SLocation, const Standard_Real Eps);

		/****************** GetEpsilon ******************/
		/**** md5 signature: 70053d03d9c27b2171a20b75ca67dc00 ****/
		%feature("compactdefaultargs") GetEpsilon;
		%feature("autodoc", "If previously used method contained eps parameter get actual relative error of the computation, else return 1.0.

Returns
-------
float
") GetEpsilon;
		Standard_Real GetEpsilon();

		/****************** Perform ******************/
		/**** md5 signature: 287766d0387e8a92bd6fd7efea57304a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face

Returns
-------
None
") Perform;
		void Perform(const BRepGProp_Face & S);

		/****************** Perform ******************/
		/**** md5 signature: 2a40161e06229ca1640ab336b74b37cd ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain

Returns
-------
None
") Perform;
		void Perform(BRepGProp_Face & S, BRepGProp_Domain & D);

		/****************** Perform ******************/
		/**** md5 signature: 9f27bb8deb5f9df42810f2abd51c6026 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
Eps: float

Returns
-------
float
") Perform;
		Standard_Real Perform(BRepGProp_Face & S, const Standard_Real Eps);

		/****************** Perform ******************/
		/**** md5 signature: a7c77e80349f9dd440598643ec9aae4a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
Eps: float

Returns
-------
float
") Perform;
		Standard_Real Perform(BRepGProp_Face & S, BRepGProp_Domain & D, const Standard_Real Eps);

		/****************** SetLocation ******************/
		/**** md5 signature: 21f84731f7ae4a935b732f676863a0d9 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "No available documentation.

Parameters
----------
SLocation: gp_Pnt

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt & SLocation);

};


%extend BRepGProp_Sinert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepGProp_TFunction *
****************************/
class BRepGProp_TFunction : public math_Function {
	public:
		/****************** BRepGProp_TFunction ******************/
		/**** md5 signature: 6fb8eac28a2b05c26eb62cc235a75bda ****/
		%feature("compactdefaultargs") BRepGProp_TFunction;
		%feature("autodoc", "Constructor. initializes the function with the face, the location point, the flag isbypoint, the coefficients thecoeff that have different meaning depending on the value of isbypoint. the last two parameters are theumin - the lower bound of the inner integral. this value is fixed for any integral. and the value of tolerance of inner integral computation. if isbypoint is equal to standard_true, the number of the coefficients is equal to 3 and they represent x, y and z coordinates (thecoeff[0], thecoeff[1] and thecoeff[2] correspondingly) of the shift if the inertia is computed with respect to the point different then the location. if isbypoint is equal to standard_false, the number of the coefficients is 4 and they represent the compbination of plane parameters and shift values.

Parameters
----------
theSurface: BRepGProp_Face
theVertex: gp_Pnt
IsByPoint: bool
theCoeffs: Standard_Address
theUMin: float
theTolerance: float

Returns
-------
None
") BRepGProp_TFunction;
		 BRepGProp_TFunction(const BRepGProp_Face & theSurface, const gp_Pnt & theVertex, const Standard_Boolean IsByPoint, const Standard_Address theCoeffs, const Standard_Real theUMin, const Standard_Real theTolerance);

		/****************** AbsolutError ******************/
		/**** md5 signature: 12eadedd827c6f2cfdee466e4014e7d9 ****/
		%feature("compactdefaultargs") AbsolutError;
		%feature("autodoc", "Returns the absolut reached error of all values computation since the last call of getstatenumber method.

Returns
-------
float
") AbsolutError;
		Standard_Real AbsolutError();

		/****************** ErrorReached ******************/
		/**** md5 signature: a07cf8273fa0f4cf4aae707ac80776ec ****/
		%feature("compactdefaultargs") ErrorReached;
		%feature("autodoc", "Returns the relative reached error of all values computation since the last call of getstatenumber method.

Returns
-------
float
") ErrorReached;
		Standard_Real ErrorReached();

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Redefined method. remembers the error reached during computation of integral values since the object creation or the last call of getstatenumber. it is invoked in each algorithm from the package math. particularly in the algorithm math_kronrodsingleintegration that is used to compute the integral of tfunction.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** SetNbKronrodPoints ******************/
		/**** md5 signature: 2388e1a76b29ff88e9dd10198003e6b8 ****/
		%feature("compactdefaultargs") SetNbKronrodPoints;
		%feature("autodoc", "Setting the expected number of kronrod points for the outer integral computation. this number is required for computation of a value of tolerance for inner integral computation. after getstatenumber method call, this number is recomputed by the same law as in math_kronrodsingleintegration, i.e. next number of points is equal to the current number plus a square root of the current number. if the law in math_kronrodsingleintegration is changed, the modification algo should be modified accordingly.

Parameters
----------
theNbPoints: int

Returns
-------
None
") SetNbKronrodPoints;
		void SetNbKronrodPoints(const Standard_Integer theNbPoints);

		/****************** SetTolerance ******************/
		/**** md5 signature: cbe94a7292bcea72785e79a4eafde5ea ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Setting the tolerance for inner integration.

Parameters
----------
aTol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real aTol);

		/****************** SetValueType ******************/
		/**** md5 signature: e50d5f7e32a617f0c0c33c6617861546 ****/
		%feature("compactdefaultargs") SetValueType;
		%feature("autodoc", "Setting the type of the value to be returned. this parameter is directly passed to the ufunction.

Parameters
----------
aType: GProp_ValueType

Returns
-------
None
") SetValueType;
		void SetValueType(const GProp_ValueType aType);

		/****************** Value ******************/
		/**** md5 signature: 15617dca721c4472bfb7ee7933f04bce ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns a value of the function. the value represents an integral of ufunction. it is computed with the predefined tolerance using the adaptive gauss-kronrod method.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		virtual Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

};


%extend BRepGProp_TFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepGProp_UFunction *
****************************/
class BRepGProp_UFunction : public math_Function {
	public:
		/****************** BRepGProp_UFunction ******************/
		/**** md5 signature: b338266c4100743d61bda90c43090930 ****/
		%feature("compactdefaultargs") BRepGProp_UFunction;
		%feature("autodoc", "Constructor. initializes the function with the face, the location point, the flag isbypoint and the coefficients thecoeff that have different meaning depending on the value of isbypoint. if isbypoint is equal to standard_true, the number of the coefficients is equal to 3 and they represent x, y and z coordinates (thecoeff[0], thecoeff[1] and thecoeff[2] correspondingly) of the shift, if the inertia is computed with respect to the point different then the location. if isbypoint is equal to standard_false, the number of the coefficients is 4 and they represent the combination of plane parameters and shift values.

Parameters
----------
theSurface: BRepGProp_Face
theVertex: gp_Pnt
IsByPoint: bool
theCoeffs: Standard_Address

Returns
-------
None
") BRepGProp_UFunction;
		 BRepGProp_UFunction(const BRepGProp_Face & theSurface, const gp_Pnt & theVertex, const Standard_Boolean IsByPoint, const Standard_Address theCoeffs);

		/****************** SetVParam ******************/
		/**** md5 signature: 65557cc70db507c03b9e102c112375ed ****/
		%feature("compactdefaultargs") SetVParam;
		%feature("autodoc", "Setting the v parameter that is constant during the integral computation.

Parameters
----------
theVParam: float

Returns
-------
None
") SetVParam;
		void SetVParam(const Standard_Real theVParam);

		/****************** SetValueType ******************/
		/**** md5 signature: f560b8c5b982b75a196f946bfdc77fcb ****/
		%feature("compactdefaultargs") SetValueType;
		%feature("autodoc", "Setting the type of the value to be returned.

Parameters
----------
theType: GProp_ValueType

Returns
-------
None
") SetValueType;
		void SetValueType(const GProp_ValueType theType);

		/****************** Value ******************/
		/**** md5 signature: 15617dca721c4472bfb7ee7933f04bce ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns a value of the function.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		virtual Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

};


%extend BRepGProp_UFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepGProp_Vinert *
*************************/
class BRepGProp_Vinert : public GProp_GProps {
	public:
		/****************** BRepGProp_Vinert ******************/
		/**** md5 signature: 4d03c85dfc1aa38496efd1cd67dfb041 ****/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepGProp_Vinert;
		 BRepGProp_Vinert();

		/****************** BRepGProp_Vinert ******************/
		/**** md5 signature: 1414a74187b929e713ff870c0e037149 ****/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "Computes the global properties of a region of 3d space delimited with the surface <s> and the point vlocation. s can be closed the method is quick and its precision is enough for many cases of analytical surfaces. non-adaptive 2d gauss integration with predefined numbers of gauss points is used. numbers of points depend on types of surfaces and curves. errror of the computation is not calculated.

Parameters
----------
S: BRepGProp_Face
VLocation: gp_Pnt

Returns
-------
None
") BRepGProp_Vinert;
		 BRepGProp_Vinert(const BRepGProp_Face & S, const gp_Pnt & VLocation);

		/****************** BRepGProp_Vinert ******************/
		/**** md5 signature: 13a616469cff283670358262ff91dcf9 ****/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "Computes the global properties of a region of 3d space delimited with the surface <s> and the point vlocation. s can be closed adaptive 2d gauss integration is used. parameter eps sets maximal relative error of computed mass (volume) for face. error is calculated as abs((m(i+1)-m(i))/m(i+1)), m(i+1) and m(i) are values for two successive steps of adaptive integration.

Parameters
----------
S: BRepGProp_Face
VLocation: gp_Pnt
Eps: float

Returns
-------
None
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, const gp_Pnt & VLocation, const Standard_Real Eps);

		/****************** BRepGProp_Vinert ******************/
		/**** md5 signature: 5c8c9fce1d68c04b255a76edd33c2c5d ****/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "Computes the global properties of the region of 3d space delimited with the surface <s> and the point vlocation. the method is quick and its precision is enough for many cases of analytical surfaces. non-adaptive 2d gauss integration with predefined numbers of gauss points is used. numbers of points depend on types of surfaces and curves. error of the computation is not calculated.

Parameters
----------
S: BRepGProp_Face
O: gp_Pnt
VLocation: gp_Pnt

Returns
-------
None
") BRepGProp_Vinert;
		 BRepGProp_Vinert(const BRepGProp_Face & S, const gp_Pnt & O, const gp_Pnt & VLocation);

		/****************** BRepGProp_Vinert ******************/
		/**** md5 signature: df85730af0638f29c218a6be2ab7aecc ****/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "Computes the global properties of the region of 3d space delimited with the surface <s> and the point vlocation. adaptive 2d gauss integration is used. parameter eps sets maximal relative error of computed mass (volume) for face. error is calculated as abs((m(i+1)-m(i))/m(i+1)), m(i+1) and m(i) are values for two successive steps of adaptive integration. warning: if eps > 0.001 algorithm performs non-adaptive integration.

Parameters
----------
S: BRepGProp_Face
O: gp_Pnt
VLocation: gp_Pnt
Eps: float

Returns
-------
None
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, const gp_Pnt & O, const gp_Pnt & VLocation, const Standard_Real Eps);

		/****************** BRepGProp_Vinert ******************/
		/**** md5 signature: 7f48df0c9e63f4ccad77f35c8ead2e18 ****/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "Computes the global properties of the region of 3d space delimited with the surface <s> and the plane pln. the method is quick and its precision is enough for many cases of analytical surfaces. non-adaptive 2d gauss integration with predefined numbers of gauss points is used. numbers of points depend on types of surfaces and curves. error of the computation is not calculated.

Parameters
----------
S: BRepGProp_Face
Pl: gp_Pln
VLocation: gp_Pnt

Returns
-------
None
") BRepGProp_Vinert;
		 BRepGProp_Vinert(const BRepGProp_Face & S, const gp_Pln & Pl, const gp_Pnt & VLocation);

		/****************** BRepGProp_Vinert ******************/
		/**** md5 signature: c7ffc413b9031d515f8311697c9bc6b3 ****/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "Computes the global properties of the region of 3d space delimited with the surface <s> and the plane pln. adaptive 2d gauss integration is used. parameter eps sets maximal relative error of computed mass (volume) for face. error is calculated as abs((m(i+1)-m(i))/m(i+1)), m(i+1) and m(i) are values for two successive steps of adaptive integration. warning: if eps > 0.001 algorithm performs non-adaptive integration.

Parameters
----------
S: BRepGProp_Face
Pl: gp_Pln
VLocation: gp_Pnt
Eps: float

Returns
-------
None
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, const gp_Pln & Pl, const gp_Pnt & VLocation, const Standard_Real Eps);

		/****************** BRepGProp_Vinert ******************/
		/**** md5 signature: bd59787cdd3504146a2e59074662acc7 ****/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "Computes the global properties of a region of 3d space delimited with the surface <s> and the point vlocation. s can be closed the method is quick and its precision is enough for many cases of analytical surfaces. non-adaptive 2d gauss integration with predefined numbers of gauss points is used. numbers of points depend on types of surfaces and curves. errror of the computation is not calculated.

Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
VLocation: gp_Pnt

Returns
-------
None
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pnt & VLocation);

		/****************** BRepGProp_Vinert ******************/
		/**** md5 signature: d280d056ab61286ffa7e329635e8adc4 ****/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "Computes the global properties of a region of 3d space delimited with the surface <s> and the point vlocation. s can be closed adaptive 2d gauss integration is used. parameter eps sets maximal relative error of computed mass (volume) for face. error is calculated as abs((m(i+1)-m(i))/m(i+1)), m(i+1) and m(i) are values for two successive steps of adaptive integration.

Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
VLocation: gp_Pnt
Eps: float

Returns
-------
None
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pnt & VLocation, const Standard_Real Eps);

		/****************** BRepGProp_Vinert ******************/
		/**** md5 signature: f3a262fb64cb9de88ea729596d32dfa8 ****/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "Computes the global properties of the region of 3d space delimited with the surface <s> and the point vlocation. the method is quick and its precision is enough for many cases of analytical surfaces. non-adaptive 2d gauss integration with predefined numbers of gauss points is used. numbers of points depend on types of surfaces and curves. error of the computation is not calculated.

Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
O: gp_Pnt
VLocation: gp_Pnt

Returns
-------
None
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pnt & O, const gp_Pnt & VLocation);

		/****************** BRepGProp_Vinert ******************/
		/**** md5 signature: 0fb97e514eb1305a85cb6f202d0ca710 ****/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "Computes the global properties of the region of 3d space delimited with the surface <s> and the point vlocation. adaptive 2d gauss integration is used. parameter eps sets maximal relative error of computed mass (volume) for face. error is calculated as abs((m(i+1)-m(i))/m(i+1)), m(i+1) and m(i) are values for two successive steps of adaptive integration. warning: if eps > 0.001 algorithm performs non-adaptive integration.

Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
O: gp_Pnt
VLocation: gp_Pnt
Eps: float

Returns
-------
None
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pnt & O, const gp_Pnt & VLocation, const Standard_Real Eps);

		/****************** BRepGProp_Vinert ******************/
		/**** md5 signature: 4d4d2889b5f4db0e01ce23afa5532b52 ****/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "Computes the global properties of the region of 3d space delimited with the surface <s> and the plane pln. the method is quick and its precision is enough for many cases of analytical surfaces. non-adaptive 2d gauss integration with predefined numbers of gauss points is used. numbers of points depend on types of surfaces and curves. error of the computation is not calculated.

Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
Pl: gp_Pln
VLocation: gp_Pnt

Returns
-------
None
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pln & Pl, const gp_Pnt & VLocation);

		/****************** BRepGProp_Vinert ******************/
		/**** md5 signature: f45f2cd07c17c648e1699a791da66461 ****/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "Computes the global properties of the region of 3d space delimited with the surface <s> and the plane pln. adaptive 2d gauss integration is used. parameter eps sets maximal relative error of computed mass (volume) for face. error is calculated as abs((m(i+1)-m(i))/m(i+1)), m(i+1) and m(i) are values for two successive steps of adaptive integration. warning: if eps > 0.001 algorithm performs non-adaptive integration.

Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
Pl: gp_Pln
VLocation: gp_Pnt
Eps: float

Returns
-------
None
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pln & Pl, const gp_Pnt & VLocation, const Standard_Real Eps);

		/****************** GetEpsilon ******************/
		/**** md5 signature: 70053d03d9c27b2171a20b75ca67dc00 ****/
		%feature("compactdefaultargs") GetEpsilon;
		%feature("autodoc", "If previously used methods containe eps parameter gets actual relative error of the computation, else returns 1.0.

Returns
-------
float
") GetEpsilon;
		Standard_Real GetEpsilon();

		/****************** Perform ******************/
		/**** md5 signature: 287766d0387e8a92bd6fd7efea57304a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face

Returns
-------
None
") Perform;
		void Perform(const BRepGProp_Face & S);

		/****************** Perform ******************/
		/**** md5 signature: 9f27bb8deb5f9df42810f2abd51c6026 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
Eps: float

Returns
-------
float
") Perform;
		Standard_Real Perform(BRepGProp_Face & S, const Standard_Real Eps);

		/****************** Perform ******************/
		/**** md5 signature: e894591640d6f840f3181c73a396ac73 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
O: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const BRepGProp_Face & S, const gp_Pnt & O);

		/****************** Perform ******************/
		/**** md5 signature: 3557a52fecea80979634ca485366f4ce ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
O: gp_Pnt
Eps: float

Returns
-------
float
") Perform;
		Standard_Real Perform(BRepGProp_Face & S, const gp_Pnt & O, const Standard_Real Eps);

		/****************** Perform ******************/
		/**** md5 signature: 00372c2d834eb3c1d978ec6bfb1f027f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
Pl: gp_Pln

Returns
-------
None
") Perform;
		void Perform(const BRepGProp_Face & S, const gp_Pln & Pl);

		/****************** Perform ******************/
		/**** md5 signature: 648e9947f4302031d12bd0a17b5fbe0f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
Pl: gp_Pln
Eps: float

Returns
-------
float
") Perform;
		Standard_Real Perform(BRepGProp_Face & S, const gp_Pln & Pl, const Standard_Real Eps);

		/****************** Perform ******************/
		/**** md5 signature: 2a40161e06229ca1640ab336b74b37cd ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain

Returns
-------
None
") Perform;
		void Perform(BRepGProp_Face & S, BRepGProp_Domain & D);

		/****************** Perform ******************/
		/**** md5 signature: a7c77e80349f9dd440598643ec9aae4a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
Eps: float

Returns
-------
float
") Perform;
		Standard_Real Perform(BRepGProp_Face & S, BRepGProp_Domain & D, const Standard_Real Eps);

		/****************** Perform ******************/
		/**** md5 signature: 51bda88f4b6e7d3e15825d1a104b74c9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
O: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pnt & O);

		/****************** Perform ******************/
		/**** md5 signature: 933e01d497a5ae64a162e32137b481fb ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
O: gp_Pnt
Eps: float

Returns
-------
float
") Perform;
		Standard_Real Perform(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pnt & O, const Standard_Real Eps);

		/****************** Perform ******************/
		/**** md5 signature: 751b530e05960276e54a63742e074cc1 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
Pl: gp_Pln

Returns
-------
None
") Perform;
		void Perform(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pln & Pl);

		/****************** Perform ******************/
		/**** md5 signature: 1acf8519ff5d34431bd836b7af497b0a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
Pl: gp_Pln
Eps: float

Returns
-------
float
") Perform;
		Standard_Real Perform(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pln & Pl, const Standard_Real Eps);

		/****************** SetLocation ******************/
		/**** md5 signature: 13648852ef1c389d29559ab743f5f9e2 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "No available documentation.

Parameters
----------
VLocation: gp_Pnt

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt & VLocation);

};


%extend BRepGProp_Vinert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepGProp_VinertGK *
***************************/
class BRepGProp_VinertGK : public GProp_GProps {
	public:
		/****************** BRepGProp_VinertGK ******************/
		/**** md5 signature: 2b4ec0003b8c134168e48daf41971b72 ****/
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK();

		/****************** BRepGProp_VinertGK ******************/
		/**** md5 signature: 8c95cbab67ec10c708d18427bfedfaaa ****/
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "Constructor. computes the global properties of a region of 3d space delimited with the naturally restricted surface and the point vlocation.

Parameters
----------
theSurface: BRepGProp_Face
theLocation: gp_Pnt
theTolerance: float,optional
	default value is 0.001
theCGFlag: bool,optional
	default value is Standard_False
theIFlag: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK(BRepGProp_Face & theSurface, const gp_Pnt & theLocation, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****************** BRepGProp_VinertGK ******************/
		/**** md5 signature: 8d65b075f239d772811f6e7cd57131e1 ****/
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "Constructor. computes the global properties of a region of 3d space delimited with the naturally restricted surface and the point vlocation. the inertia is computed with respect to thepoint.

Parameters
----------
theSurface: BRepGProp_Face
thePoint: gp_Pnt
theLocation: gp_Pnt
theTolerance: float,optional
	default value is 0.001
theCGFlag: bool,optional
	default value is Standard_False
theIFlag: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK(BRepGProp_Face & theSurface, const gp_Pnt & thePoint, const gp_Pnt & theLocation, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****************** BRepGProp_VinertGK ******************/
		/**** md5 signature: 92192b1666bb702876fdd35bd985cf10 ****/
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "Constructor. computes the global properties of a region of 3d space delimited with the surface bounded by the domain and the point vlocation.

Parameters
----------
theSurface: BRepGProp_Face
theDomain: BRepGProp_Domain
theLocation: gp_Pnt
theTolerance: float,optional
	default value is 0.001
theCGFlag: bool,optional
	default value is Standard_False
theIFlag: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK(BRepGProp_Face & theSurface, BRepGProp_Domain & theDomain, const gp_Pnt & theLocation, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****************** BRepGProp_VinertGK ******************/
		/**** md5 signature: e075379e488804335fc45904b5e86b1d ****/
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "Constructor. computes the global properties of a region of 3d space delimited with the surface bounded by the domain and the point vlocation. the inertia is computed with respect to thepoint.

Parameters
----------
theSurface: BRepGProp_Face
theDomain: BRepGProp_Domain
thePoint: gp_Pnt
theLocation: gp_Pnt
theTolerance: float,optional
	default value is 0.001
theCGFlag: bool,optional
	default value is Standard_False
theIFlag: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK(BRepGProp_Face & theSurface, BRepGProp_Domain & theDomain, const gp_Pnt & thePoint, const gp_Pnt & theLocation, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****************** BRepGProp_VinertGK ******************/
		/**** md5 signature: 6867b4fa1afaa445bfbfbaf96b8446eb ****/
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "Constructor. computes the global properties of a region of 3d space delimited with the naturally restricted surface and the plane.

Parameters
----------
theSurface: BRepGProp_Face
thePlane: gp_Pln
theLocation: gp_Pnt
theTolerance: float,optional
	default value is 0.001
theCGFlag: bool,optional
	default value is Standard_False
theIFlag: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK(BRepGProp_Face & theSurface, const gp_Pln & thePlane, const gp_Pnt & theLocation, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****************** BRepGProp_VinertGK ******************/
		/**** md5 signature: 648a50ab357462085f5dfb351879b539 ****/
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "Constructor. computes the global properties of a region of 3d space delimited with the surface bounded by the domain and the plane.

Parameters
----------
theSurface: BRepGProp_Face
theDomain: BRepGProp_Domain
thePlane: gp_Pln
theLocation: gp_Pnt
theTolerance: float,optional
	default value is 0.001
theCGFlag: bool,optional
	default value is Standard_False
theIFlag: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK(BRepGProp_Face & theSurface, BRepGProp_Domain & theDomain, const gp_Pln & thePlane, const gp_Pnt & theLocation, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****************** GetErrorReached ******************/
		/**** md5 signature: 41776af72d3d1a9138d3f5f33aa13fdd ****/
		%feature("compactdefaultargs") GetErrorReached;
		%feature("autodoc", "Returns the relative reached computation error.

Returns
-------
float
") GetErrorReached;
		Standard_Real GetErrorReached();

		/****************** Perform ******************/
		/**** md5 signature: d570fe8ddab01258ba30702a3483ec6f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the global properties of a region of 3d space delimited with the naturally restricted surface and the point vlocation.

Parameters
----------
theSurface: BRepGProp_Face
theTolerance: float,optional
	default value is 0.001
theCGFlag: bool,optional
	default value is Standard_False
theIFlag: bool,optional
	default value is Standard_False

Returns
-------
float
") Perform;
		Standard_Real Perform(BRepGProp_Face & theSurface, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****************** Perform ******************/
		/**** md5 signature: b4af8c130cc28d347e5136c66efe2e2b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the global properties of a region of 3d space delimited with the naturally restricted surface and the point vlocation. the inertia is computed with respect to thepoint.

Parameters
----------
theSurface: BRepGProp_Face
thePoint: gp_Pnt
theTolerance: float,optional
	default value is 0.001
theCGFlag: bool,optional
	default value is Standard_False
theIFlag: bool,optional
	default value is Standard_False

Returns
-------
float
") Perform;
		Standard_Real Perform(BRepGProp_Face & theSurface, const gp_Pnt & thePoint, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****************** Perform ******************/
		/**** md5 signature: b40034b46e1dbb701f4a74e5c0f074dc ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the global properties of a region of 3d space delimited with the surface bounded by the domain and the point vlocation.

Parameters
----------
theSurface: BRepGProp_Face
theDomain: BRepGProp_Domain
theTolerance: float,optional
	default value is 0.001
theCGFlag: bool,optional
	default value is Standard_False
theIFlag: bool,optional
	default value is Standard_False

Returns
-------
float
") Perform;
		Standard_Real Perform(BRepGProp_Face & theSurface, BRepGProp_Domain & theDomain, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****************** Perform ******************/
		/**** md5 signature: e2709a20d48918e9084b81ceae2afbce ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the global properties of a region of 3d space delimited with the surface bounded by the domain and the point vlocation. the inertia is computed with respect to thepoint.

Parameters
----------
theSurface: BRepGProp_Face
theDomain: BRepGProp_Domain
thePoint: gp_Pnt
theTolerance: float,optional
	default value is 0.001
theCGFlag: bool,optional
	default value is Standard_False
theIFlag: bool,optional
	default value is Standard_False

Returns
-------
float
") Perform;
		Standard_Real Perform(BRepGProp_Face & theSurface, BRepGProp_Domain & theDomain, const gp_Pnt & thePoint, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****************** Perform ******************/
		/**** md5 signature: c7217d0c046ee96a7a7100e2a76bbce3 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the global properties of a region of 3d space delimited with the naturally restricted surface and the plane.

Parameters
----------
theSurface: BRepGProp_Face
thePlane: gp_Pln
theTolerance: float,optional
	default value is 0.001
theCGFlag: bool,optional
	default value is Standard_False
theIFlag: bool,optional
	default value is Standard_False

Returns
-------
float
") Perform;
		Standard_Real Perform(BRepGProp_Face & theSurface, const gp_Pln & thePlane, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****************** Perform ******************/
		/**** md5 signature: 59e16d24d1aae57294bc90cb8d6007e5 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the global properties of a region of 3d space delimited with the surface bounded by the domain and the plane.

Parameters
----------
theSurface: BRepGProp_Face
theDomain: BRepGProp_Domain
thePlane: gp_Pln
theTolerance: float,optional
	default value is 0.001
theCGFlag: bool,optional
	default value is Standard_False
theIFlag: bool,optional
	default value is Standard_False

Returns
-------
float
") Perform;
		Standard_Real Perform(BRepGProp_Face & theSurface, BRepGProp_Domain & theDomain, const gp_Pln & thePlane, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****************** SetLocation ******************/
		/**** md5 signature: 49b73879adebd078faa244b518af4276 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Sets the vertex that delimit 3d closed region of space.

Parameters
----------
theLocation: gp_Pnt

Returns
-------
None
") SetLocation;
		void SetLocation(const gp_Pnt & theLocation);

};


%extend BRepGProp_VinertGK {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def GetAbsolutError(self):
		pass
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BRepGProp_MeshProps:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
