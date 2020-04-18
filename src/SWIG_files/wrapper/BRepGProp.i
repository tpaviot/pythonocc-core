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
		%feature("compactdefaultargs") BRepGProp_Cinert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepGProp_Cinert;
		 BRepGProp_Cinert();

		/****************** BRepGProp_Cinert ******************/
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
		%feature("compactdefaultargs") BRepGProp_Domain;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepGProp_Domain;
		 BRepGProp_Domain();

		/****************** BRepGProp_Domain ******************/
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
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the exploration with the face already set.

Returns
-------
None
") Init;
		void Init();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is another arc of curve in the list.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Sets the index of the arc iterator to the next arc of curve.

Returns
-------
None
") Next;
		void Next();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the parametric value of the start point of the current arc of curve.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetFace ******************/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "Returns the topods face.

Returns
-------
TopoDS_Face
") GetFace;
		const TopoDS_Face GetFace();

		/****************** GetTKnots ******************/
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
		%feature("compactdefaultargs") IntegrationOrder;
		%feature("autodoc", "Returns the number of points required to do the integration along the parameter of curve.

Returns
-------
int
") IntegrationOrder;
		Standard_Integer IntegrationOrder();

		/****************** LIntOrder ******************/
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
		%feature("compactdefaultargs") LIntSubs;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") LIntSubs;
		Standard_Integer LIntSubs();

		/****************** LKnots ******************/
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
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the parametric value of the end point of the current arc of curve.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Load ******************/
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
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", "Returns standard_true if the face is not trimmed.

Returns
-------
bool
") NaturalRestriction;
		Standard_Boolean NaturalRestriction();

		/****************** Normal ******************/
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
		%feature("compactdefaultargs") SUIntSubs;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") SUIntSubs;
		Standard_Integer SUIntSubs();

		/****************** SVIntSubs ******************/
		%feature("compactdefaultargs") SVIntSubs;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") SVIntSubs;
		Standard_Integer SVIntSubs();

		/****************** UIntegrationOrder ******************/
		%feature("compactdefaultargs") UIntegrationOrder;
		%feature("autodoc", "Returns the number of points required to do the integration in the u parametric direction with a good accuracy.

Returns
-------
int
") UIntegrationOrder;
		Standard_Integer UIntegrationOrder();

		/****************** UKnots ******************/
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
		%feature("compactdefaultargs") VIntegrationOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VIntegrationOrder;
		Standard_Integer VIntegrationOrder();

		/****************** VKnots ******************/
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
		%feature("compactdefaultargs") BRepGProp_MeshCinert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepGProp_MeshCinert;
		 BRepGProp_MeshCinert();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") BRepGProp_Sinert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepGProp_Sinert;
		 BRepGProp_Sinert();

		/****************** BRepGProp_Sinert ******************/
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
		%feature("compactdefaultargs") GetEpsilon;
		%feature("autodoc", "If previously used method contained eps parameter get actual relative error of the computation, else return 1.0.

Returns
-------
float
") GetEpsilon;
		Standard_Real GetEpsilon();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") AbsolutError;
		%feature("autodoc", "Returns the absolut reached error of all values computation since the last call of getstatenumber method.

Returns
-------
float
") AbsolutError;
		Standard_Real AbsolutError();

		/****************** ErrorReached ******************/
		%feature("compactdefaultargs") ErrorReached;
		%feature("autodoc", "Returns the relative reached error of all values computation since the last call of getstatenumber method.

Returns
-------
float
") ErrorReached;
		Standard_Real ErrorReached();

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Redefined method. remembers the error reached during computation of integral values since the object creation or the last call of getstatenumber. it is invoked in each algorithm from the package math. particularly in the algorithm math_kronrodsingleintegration that is used to compute the integral of tfunction.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** SetNbKronrodPoints ******************/
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
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepGProp_Vinert;
		 BRepGProp_Vinert();

		/****************** BRepGProp_Vinert ******************/
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
		%feature("compactdefaultargs") GetEpsilon;
		%feature("autodoc", "If previously used methods containe eps parameter gets actual relative error of the computation, else returns 1.0.

Returns
-------
float
") GetEpsilon;
		Standard_Real GetEpsilon();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK();

		/****************** BRepGProp_VinertGK ******************/
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
		%feature("compactdefaultargs") GetErrorReached;
		%feature("autodoc", "Returns the relative reached computation error.

Returns
-------
float
") GetErrorReached;
		Standard_Real GetErrorReached();

		/****************** Perform ******************/
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
