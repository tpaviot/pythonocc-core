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
%define BREPGPROPDOCSTRING
"BRepGProp module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_brepgprop.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
* class BRepGProp *
******************/
%rename(brepgprop) BRepGProp;
class BRepGProp {
	public:
		/****** BRepGProp::LinearProperties ******/
		/****** md5 signature: a063d5e771c7cceda8fc1f79fdc01d30 ******/
		%feature("compactdefaultargs") LinearProperties;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
LProps: GProp_GProps
SkipShared: bool (optional, default to Standard_False)
UseTriangulation: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Computes the linear global properties of the shape S, i.e. the global properties induced by each edge of the shape S, and brings them together with the global properties still retained by the framework LProps. If the current system of LProps was empty, its global properties become equal to the linear global properties of S. For this computation no linear density is attached to the edges. So, for example, the added mass corresponds to the sum of the lengths of the edges of S. The density of the composed systems, i.e. that of each component of the current system of LProps, and that of S which is considered to be equal to 1, must be coherent. Note that this coherence cannot be checked. You are advised to use a separate framework for each density, and then to bring these frameworks together into a global one. The point relative to which the inertia of the system is computed is the reference point of the framework LProps. Note: if your programming ensures that the framework LProps retains only linear global properties (brought together for example, by the function LinearProperties) for objects the density of which is equal to 1 (or is not defined), the function Mass will return the total length of edges of the system analysed by LProps. Warning No check is performed to verify that the shape S retains truly linear properties. If S is simply a vertex, it is not considered to present any additional global properties. SkipShared is a special flag, which allows taking in calculation shared topological entities or not. For ex., if SkipShared = True, edges, shared by two or more faces, are taken into calculation only once. If we have cube with sizes 1, 1, 1, its linear properties = 12 for SkipEdges = true and 24 for SkipEdges = false. UseTriangulation is a special flag, which defines preferable source of geometry data. If UseTriangulation = Standard_False, exact geometry objects (curves) are used, otherwise polygons of triangulation are used first.
") LinearProperties;
		static void LinearProperties(const TopoDS_Shape & S, GProp_GProps & LProps, const Standard_Boolean SkipShared = Standard_False, const Standard_Boolean UseTriangulation = Standard_False);

		/****** BRepGProp::SurfaceProperties ******/
		/****** md5 signature: de09a2b35153022287aa2a8431deaef5 ******/
		%feature("compactdefaultargs") SurfaceProperties;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
SProps: GProp_GProps
SkipShared: bool (optional, default to Standard_False)
UseTriangulation: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Computes the surface global properties of the shape S, i.e. the global properties induced by each face of the shape S, and brings them together with the global properties still retained by the framework SProps. If the current system of SProps was empty, its global properties become equal to the surface global properties of S. For this computation, no surface density is attached to the faces. Consequently, the added mass corresponds to the sum of the areas of the faces of S. The density of the component systems, i.e. that of each component of the current system of SProps, and that of S which is considered to be equal to 1, must be coherent. Note that this coherence cannot be checked. You are advised to use a framework for each different value of density, and then to bring these frameworks together into a global one. The point relative to which the inertia of the system is computed is the reference point of the framework SProps. Note: if your programming ensures that the framework SProps retains only surface global properties, brought together, for example, by the function SurfaceProperties, for objects the density of which is equal to 1 (or is not defined), the function Mass will return the total area of faces of the system analysed by SProps. Warning No check is performed to verify that the shape S retains truly surface properties. If S is simply a vertex, an edge or a wire, it is not considered to present any additional global properties. SkipShared is a special flag, which allows taking in calculation shared topological entities or not. For ex., if SkipShared = True, faces, shared by two or more shells, are taken into calculation only once. UseTriangulation is a special flag, which defines preferable source of geometry data. If UseTriangulation = Standard_False, exact geometry objects (surfaces) are used, otherwise face triangulations are used first.
") SurfaceProperties;
		static void SurfaceProperties(const TopoDS_Shape & S, GProp_GProps & SProps, const Standard_Boolean SkipShared = Standard_False, const Standard_Boolean UseTriangulation = Standard_False);

		/****** BRepGProp::SurfaceProperties ******/
		/****** md5 signature: 98c472661263186b1d30e4379dd9db78 ******/
		%feature("compactdefaultargs") SurfaceProperties;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
SProps: GProp_GProps
Eps: float
SkipShared: bool (optional, default to Standard_False)

Return
-------
float

Description
-----------
Updates <SProps> with the shape <S>, that contains its principal properties. The surface properties of all the faces in <S> are computed. Adaptive 2D Gauss integration is used. Parameter Eps sets maximal relative error of computed mass (area) for each face. Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values for two successive steps of adaptive integration. Method returns estimation of relative error reached for whole shape. WARNING: if Eps > 0.001 algorithm performs non-adaptive integration. SkipShared is a special flag, which allows taking in calculation shared topological entities or not For ex., if SkipShared = True, faces, shared by two or more shells, are taken into calculation only once.
") SurfaceProperties;
		static Standard_Real SurfaceProperties(const TopoDS_Shape & S, GProp_GProps & SProps, const Standard_Real Eps, const Standard_Boolean SkipShared = Standard_False);

		/****** BRepGProp::VolumeProperties ******/
		/****** md5 signature: 33909e093cf59347d7db0b4d010a93f5 ******/
		%feature("compactdefaultargs") VolumeProperties;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
VProps: GProp_GProps
OnlyClosed: bool (optional, default to Standard_False)
SkipShared: bool (optional, default to Standard_False)
UseTriangulation: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
//! Computes the global volume properties of the solid S, and brings them together with the global properties still retained by the framework VProps. If the current system of VProps was empty, its global properties become equal to the global properties of S for volume. For this computation, no volume density is attached to the solid. Consequently, the added mass corresponds to the volume of S. The density of the component systems, i.e. that of each component of the current system of VProps, and that of S which is considered to be equal to 1, must be coherent to each other. Note that this coherence cannot be checked. You are advised to use a separate framework for each density, and then to bring these frameworks together into a global one. The point relative to which the inertia of the system is computed is the reference point of the framework VProps. Note: if your programming ensures that the framework VProps retains only global properties of volume (brought together for example, by the function VolumeProperties) for objects the density of which is equal to 1 (or is not defined), the function Mass will return the total volume of the solids of the system analysed by VProps. Warning The shape S must represent an object whose global volume properties can be computed. It may be a finite solid, or a series of finite solids all oriented in a coherent way. Nonetheless, S must be exempt of any free boundary. Note that these conditions of coherence are not checked by this algorithm, and results will be false if they are not respected. SkipShared a is special flag, which allows taking in calculation shared topological entities or not. For ex., if SkipShared = True, the volumes formed by the equal (the same TShape, location and orientation) faces are taken into calculation only once. UseTriangulation is a special flag, which defines preferable source of geometry data. If UseTriangulation = Standard_False, exact geometry objects (surfaces) are used, otherwise face triangulations are used first.
") VolumeProperties;
		static void VolumeProperties(const TopoDS_Shape & S, GProp_GProps & VProps, const Standard_Boolean OnlyClosed = Standard_False, const Standard_Boolean SkipShared = Standard_False, const Standard_Boolean UseTriangulation = Standard_False);

		/****** BRepGProp::VolumeProperties ******/
		/****** md5 signature: 04af0768aae13f233016a52d30fcfdbb ******/
		%feature("compactdefaultargs") VolumeProperties;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
VProps: GProp_GProps
Eps: float
OnlyClosed: bool (optional, default to Standard_False)
SkipShared: bool (optional, default to Standard_False)

Return
-------
float

Description
-----------
Updates <VProps> with the shape <S>, that contains its principal properties. The volume properties of all the FORWARD and REVERSED faces in <S> are computed. If OnlyClosed is True then computed faces must belong to closed Shells. Adaptive 2D Gauss integration is used. Parameter Eps sets maximal relative error of computed mass (volume) for each face. Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values for two successive steps of adaptive integration. Method returns estimation of relative error reached for whole shape. WARNING: if Eps > 0.001 algorithm performs non-adaptive integration. SkipShared is a special flag, which allows taking in calculation shared topological entities or not. For ex., if SkipShared = True, the volumes formed by the equal (the same TShape, location and orientation) faces are taken into calculation only once.
") VolumeProperties;
		static Standard_Real VolumeProperties(const TopoDS_Shape & S, GProp_GProps & VProps, const Standard_Real Eps, const Standard_Boolean OnlyClosed = Standard_False, const Standard_Boolean SkipShared = Standard_False);

		/****** BRepGProp::VolumePropertiesGK ******/
		/****** md5 signature: 350eb5f7ad614101e55a9b0c0afcdb22 ******/
		%feature("compactdefaultargs") VolumePropertiesGK;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
VProps: GProp_GProps
Eps: float (optional, default to 0.001)
OnlyClosed: bool (optional, default to Standard_False)
IsUseSpan: bool (optional, default to Standard_False)
CGFlag: bool (optional, default to Standard_False)
IFlag: bool (optional, default to Standard_False)
SkipShared: bool (optional, default to Standard_False)

Return
-------
float

Description
-----------
Updates <VProps> with the shape <S>, that contains its principal properties. The volume properties of all the FORWARD and REVERSED faces in <S> are computed. If OnlyClosed is True then computed faces must belong to closed Shells. Adaptive 2D Gauss integration is used. Parameter IsUseSpan says if it is necessary to define spans on a face. This option has an effect only for BSpline faces. Parameter Eps sets maximal relative error of computed property for each face. Error is delivered by the adaptive Gauss-Kronrod method of integral computation that is used for properties computation. Method returns estimation of relative error reached for whole shape. Returns negative value if the computation is failed. SkipShared is a special flag, which allows taking in calculation shared topological entities or not. For ex., if SkipShared = True, the volumes formed by the equal (the same TShape, location and orientation) faces are taken into calculation only once.
") VolumePropertiesGK;
		static Standard_Real VolumePropertiesGK(const TopoDS_Shape & S, GProp_GProps & VProps, const Standard_Real Eps = 0.001, const Standard_Boolean OnlyClosed = Standard_False, const Standard_Boolean IsUseSpan = Standard_False, const Standard_Boolean CGFlag = Standard_False, const Standard_Boolean IFlag = Standard_False, const Standard_Boolean SkipShared = Standard_False);

		/****** BRepGProp::VolumePropertiesGK ******/
		/****** md5 signature: 79b57301830c4c31a5b43904d7943185 ******/
		%feature("compactdefaultargs") VolumePropertiesGK;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
VProps: GProp_GProps
thePln: gp_Pln
Eps: float (optional, default to 0.001)
OnlyClosed: bool (optional, default to Standard_False)
IsUseSpan: bool (optional, default to Standard_False)
CGFlag: bool (optional, default to Standard_False)
IFlag: bool (optional, default to Standard_False)
SkipShared: bool (optional, default to Standard_False)

Return
-------
float

Description
-----------
No available documentation.
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
		/****** BRepGProp_Cinert::BRepGProp_Cinert ******/
		/****** md5 signature: ad62a1230096650569eb6d35241343b0 ******/
		%feature("compactdefaultargs") BRepGProp_Cinert;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepGProp_Cinert;
		 BRepGProp_Cinert();

		/****** BRepGProp_Cinert::BRepGProp_Cinert ******/
		/****** md5 signature: 40e8a04c04175d96e9078dec540e1699 ******/
		%feature("compactdefaultargs") BRepGProp_Cinert;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
CLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") BRepGProp_Cinert;
		 BRepGProp_Cinert(const BRepAdaptor_Curve & C, const gp_Pnt & CLocation);

		/****** BRepGProp_Cinert::Perform ******/
		/****** md5 signature: b1a2ad101c61982e2656809aff72ca36 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const BRepAdaptor_Curve & C);

		/****** BRepGProp_Cinert::SetLocation ******/
		/****** md5 signature: 5ed92b27e15802cdea187cf4e43b346a ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
CLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
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
		/****** BRepGProp_Domain::BRepGProp_Domain ******/
		/****** md5 signature: 7986cd2cf79fcfafe2e1c074b6ca854d ******/
		%feature("compactdefaultargs") BRepGProp_Domain;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepGProp_Domain;
		 BRepGProp_Domain();

		/****** BRepGProp_Domain::BRepGProp_Domain ******/
		/****** md5 signature: 3c6bdfefe3d3a9f2a2d3d47449b74a3b ******/
		%feature("compactdefaultargs") BRepGProp_Domain;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Constructor. Initializes the domain with the face.
") BRepGProp_Domain;
		 BRepGProp_Domain(const TopoDS_Face & F);

		/****** BRepGProp_Domain::Init ******/
		/****** md5 signature: a8dfaa68079e743e08190fe58d950a9a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Initializes the domain with the face.
") Init;
		void Init(const TopoDS_Face & F);

		/****** BRepGProp_Domain::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the exploration with the face already set.
") Init;
		void Init();

		/****** BRepGProp_Domain::More ******/
		/****** md5 signature: f2144011648ae849666b28430a27a0ea ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is another arc of curve in the list.
") More;
		Standard_Boolean More();

		/****** BRepGProp_Domain::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the index of the arc iterator to the next arc of curve.
") Next;
		void Next();

		/****** BRepGProp_Domain::Value ******/
		/****** md5 signature: 908df29e834e8aebb610870c9cea1651 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the current edge.
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
		/****** BRepGProp_EdgeTool::D1 ******/
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
Returns the point of parameter U and the first derivative at this point.
") D1;
		static void D1(const BRepAdaptor_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1);

		/****** BRepGProp_EdgeTool::FirstParameter ******/
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
Returns the parametric value of the start point of the curve. The curve is oriented from the start point to the end point.
") FirstParameter;
		static Standard_Real FirstParameter(const BRepAdaptor_Curve & C);

		/****** BRepGProp_EdgeTool::IntegrationOrder ******/
		/****** md5 signature: 7daceb790afa0c813f14f4153aca3dd9 ******/
		%feature("compactdefaultargs") IntegrationOrder;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
int

Description
-----------
Returns the number of Gauss points required to do the integration with a good accuracy using the Gauss method. For a polynomial curve of degree n the maxima of accuracy is obtained with an order of integration equal to 2*n-1.
") IntegrationOrder;
		static Standard_Integer IntegrationOrder(const BRepAdaptor_Curve & C);

		/****** BRepGProp_EdgeTool::Intervals ******/
		/****** md5 signature: f429463d75cd548af36c429f480bc438 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		static void Intervals(const BRepAdaptor_Curve & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** BRepGProp_EdgeTool::LastParameter ******/
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
Returns the parametric value of the end point of the curve. The curve is oriented from the start point to the end point.
") LastParameter;
		static Standard_Real LastParameter(const BRepAdaptor_Curve & C);

		/****** BRepGProp_EdgeTool::NbIntervals ******/
		/****** md5 signature: c4391d4034556532fdf723807037192a ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		static Standard_Integer NbIntervals(const BRepAdaptor_Curve & C, const GeomAbs_Shape S);

		/****** BRepGProp_EdgeTool::Value ******/
		/****** md5 signature: 23b56266cc1e7b195b61ae726893d32f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U: float

Return
-------
gp_Pnt

Description
-----------
Returns the point of parameter U on the loaded curve.
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
		/****** BRepGProp_Face::BRepGProp_Face ******/
		/****** md5 signature: bc73a426a381f81aa03dcc1823778dd2 ******/
		%feature("compactdefaultargs") BRepGProp_Face;
		%feature("autodoc", "
Parameters
----------
IsUseSpan: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructor. Initializes the object with a flag IsUseSpan that says if it is necessary to define spans on a face. This option has an effect only for BSpline faces. Spans are returned by the methods GetUKnots and GetTKnots.
") BRepGProp_Face;
		 BRepGProp_Face(const Standard_Boolean IsUseSpan = Standard_False);

		/****** BRepGProp_Face::BRepGProp_Face ******/
		/****** md5 signature: 85e85a5b8783b4d37ef3421a4493b8bf ******/
		%feature("compactdefaultargs") BRepGProp_Face;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
IsUseSpan: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructor. Initializes the object with the face and the flag IsUseSpan that says if it is necessary to define spans on a face. This option has an effect only for BSpline faces. Spans are returned by the methods GetUKnots and GetTKnots.
") BRepGProp_Face;
		 BRepGProp_Face(const TopoDS_Face & F, const Standard_Boolean IsUseSpan = Standard_False);

		/****** BRepGProp_Face::Bounds ******/
		/****** md5 signature: f30c35e741e636532fbff37cccb741f7 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float
V1: float
V2: float

Description
-----------
Returns the parametric bounds of the Face.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepGProp_Face::D12d ******/
		/****** md5 signature: 93778e4127f5c48e81f47d36c5a6f892 ******/
		%feature("compactdefaultargs") D12d;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point of parameter U and the first derivative at this point of a boundary curve.
") D12d;
		void D12d(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** BRepGProp_Face::FirstParameter ******/
		/****** md5 signature: 4ccedbaad83be904f510b4760c75f69c ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parametric value of the start point of the current arc of curve.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** BRepGProp_Face::GetFace ******/
		/****** md5 signature: 24f8605987955c9a8fdd14219215e9a9 ******/
		%feature("compactdefaultargs") GetFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the TopoDS face.
") GetFace;
		const TopoDS_Face GetFace();

		/****** BRepGProp_Face::GetTKnots ******/
		/****** md5 signature: 4b2a2cee8551d61043503150f4f516ad ******/
		%feature("compactdefaultargs") GetTKnots;
		%feature("autodoc", "
Parameters
----------
theTMin: float
theTMax: float
theTKnots: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Returns an array of combination of T knots of the arc and V knots of the face. The first and last elements of the array will be theTMin and theTMax. The middle elements will be the Knots of the arc and the values of parameters of arc on which the value points have V coordinates close to V knots of face. All the parameter will be greater then theTMin and lower then theTMax in increasing order. If the face is not a BSpline, the array initialized with theTMin and theTMax only.
") GetTKnots;
		void GetTKnots(const Standard_Real theTMin, const Standard_Real theTMax, opencascade::handle<TColStd_HArray1OfReal> & theTKnots);

		/****** BRepGProp_Face::GetUKnots ******/
		/****** md5 signature: 2b537a9010295a9da0b784859dd3d427 ******/
		%feature("compactdefaultargs") GetUKnots;
		%feature("autodoc", "
Parameters
----------
theUMin: float
theUMax: float
theUKnots: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Returns an array of U knots of the face. The first and last elements of the array will be theUMin and theUMax. The middle elements will be the U Knots of the face greater then theUMin and lower then theUMax in increasing order. If the face is not a BSpline, the array initialized with theUMin and theUMax only.
") GetUKnots;
		void GetUKnots(const Standard_Real theUMin, const Standard_Real theUMax, opencascade::handle<TColStd_HArray1OfReal> & theUKnots);

		/****** BRepGProp_Face::IntegrationOrder ******/
		/****** md5 signature: 9d941348f9e90be3833675d84fa7e21c ******/
		%feature("compactdefaultargs") IntegrationOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points required to do the integration along the parameter of curve.
") IntegrationOrder;
		Standard_Integer IntegrationOrder();

		/****** BRepGProp_Face::LIntOrder ******/
		/****** md5 signature: 582e14b0c3c2657678510ec5664dbbb0 ******/
		%feature("compactdefaultargs") LIntOrder;
		%feature("autodoc", "
Parameters
----------
Eps: float

Return
-------
int

Description
-----------
No available documentation.
") LIntOrder;
		Standard_Integer LIntOrder(const Standard_Real Eps);

		/****** BRepGProp_Face::LIntSubs ******/
		/****** md5 signature: 16c426ad00e717ef57398a45ebfc358f ******/
		%feature("compactdefaultargs") LIntSubs;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") LIntSubs;
		Standard_Integer LIntSubs();

		/****** BRepGProp_Face::LKnots ******/
		/****** md5 signature: 07b04b3724b0b2fbe94f59381afd67f8 ******/
		%feature("compactdefaultargs") LKnots;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") LKnots;
		void LKnots(TColStd_Array1OfReal & Knots);

		/****** BRepGProp_Face::LastParameter ******/
		/****** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parametric value of the end point of the current arc of curve.
") LastParameter;
		Standard_Real LastParameter();

		/****** BRepGProp_Face::Load ******/
		/****** md5 signature: 1d17d2edcb9829efe827b1a9573fcbcc ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const TopoDS_Face & F);

		/****** BRepGProp_Face::Load ******/
		/****** md5 signature: a134b46b97307c985b809bb67244f2bb ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
bool

Description
-----------
Loading the boundary arc. Returns False if edge has no P-Curve.
") Load;
		bool Load(const TopoDS_Edge & E);

		/****** BRepGProp_Face::Load ******/
		/****** md5 signature: ffd6e58ac396ac9b7d7e4df3c0deaa4f ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
IsFirstParam: bool
theIsoType: GeomAbs_IsoType

Return
-------
None

Description
-----------
Loading the boundary arc. This arc is either a top, bottom, left or right bound of a UV rectangle in which the parameters of surface are defined. If IsFirstParam is equal to Standard_True, the face is initialized by either left of bottom bound. Otherwise it is initialized by the top or right one. If theIsoType is equal to GeomAbs_IsoU, the face is initialized with either left or right bound. Otherwise - with either top or bottom one.
") Load;
		void Load(const Standard_Boolean IsFirstParam, const GeomAbs_IsoType theIsoType);

		/****** BRepGProp_Face::NaturalRestriction ******/
		/****** md5 signature: 6d92e56f229bd8624f08e276baf74517 ******/
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns Standard_True if the face is not trimmed.
") NaturalRestriction;
		Standard_Boolean NaturalRestriction();

		/****** BRepGProp_Face::Normal ******/
		/****** md5 signature: 9745e642c531c846aa947dd9b97ad423 ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
VNor: gp_Vec

Return
-------
None

Description
-----------
Computes the point of parameter U, V on the Face <S> and the normal to the face at this point.
") Normal;
		void Normal(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & VNor);

		/****** BRepGProp_Face::SIntOrder ******/
		/****** md5 signature: 36292a47be4c367eb9dd3ca5f7273d94 ******/
		%feature("compactdefaultargs") SIntOrder;
		%feature("autodoc", "
Parameters
----------
Eps: float

Return
-------
int

Description
-----------
No available documentation.
") SIntOrder;
		Standard_Integer SIntOrder(const Standard_Real Eps);

		/****** BRepGProp_Face::SUIntSubs ******/
		/****** md5 signature: bc04bb78232627d9fab2105fd2ec9a4e ******/
		%feature("compactdefaultargs") SUIntSubs;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") SUIntSubs;
		Standard_Integer SUIntSubs();

		/****** BRepGProp_Face::SVIntSubs ******/
		/****** md5 signature: f41bbeaf2802182d7d4f7ed8d1b07918 ******/
		%feature("compactdefaultargs") SVIntSubs;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") SVIntSubs;
		Standard_Integer SVIntSubs();

		/****** BRepGProp_Face::UIntegrationOrder ******/
		/****** md5 signature: 4cad12b0505b12eb0d45277d3a20b18a ******/
		%feature("compactdefaultargs") UIntegrationOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points required to do the integration in the U parametric direction with a good accuracy.
") UIntegrationOrder;
		Standard_Integer UIntegrationOrder();

		/****** BRepGProp_Face::UKnots ******/
		/****** md5 signature: 7bdd1f4e1d034b241c5401d5734966da ******/
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") UKnots;
		void UKnots(TColStd_Array1OfReal & Knots);

		/****** BRepGProp_Face::VIntegrationOrder ******/
		/****** md5 signature: 66cfa3ec86dcabc0824b4974d0d2ad4b ******/
		%feature("compactdefaultargs") VIntegrationOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VIntegrationOrder;
		Standard_Integer VIntegrationOrder();

		/****** BRepGProp_Face::VKnots ******/
		/****** md5 signature: 10545876365ec66fe3480d5137c1d815 ******/
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") VKnots;
		void VKnots(TColStd_Array1OfReal & Knots);

		/****** BRepGProp_Face::Value2d ******/
		/****** md5 signature: 1a87b688d0ec3774db81418d79b79935 ******/
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Pnt2d

Description
-----------
Returns the value of the boundary curve of the face.
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

/* python proxy classes for enums */
%pythoncode {

class BRepGProp_GaussType(IntEnum):
	Vinert = 0
	Sinert = 1
Vinert = BRepGProp_GaussType.Vinert
Sinert = BRepGProp_GaussType.Sinert
};
/* end python proxy for enums */

		/****** BRepGProp_Gauss::BRepGProp_Gauss ******/
		/****** md5 signature: 4283597bc19e7ea4dfb5f08dc8fe2240 ******/
		%feature("compactdefaultargs") BRepGProp_Gauss;
		%feature("autodoc", "
Parameters
----------
theType: BRepGProp_GaussType

Return
-------
None

Description
-----------
Constructor.
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
		/****** BRepGProp_MeshCinert::BRepGProp_MeshCinert ******/
		/****** md5 signature: 4168f86123ec390b74beda6034b261f9 ******/
		%feature("compactdefaultargs") BRepGProp_MeshCinert;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepGProp_MeshCinert;
		 BRepGProp_MeshCinert();

		/****** BRepGProp_MeshCinert::Perform ******/
		/****** md5 signature: 46c6f3603ea512468eace177c45e5d6b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theNodes: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Computes the global properties of of polylines represented by set of points.
") Perform;
		void Perform(const TColgp_Array1OfPnt & theNodes);

		/****** BRepGProp_MeshCinert::PreparePolygon ******/
		/****** md5 signature: 192567ee3ab19fdaa0db914f60c7fde9 ******/
		%feature("compactdefaultargs") PreparePolygon;
		%feature("autodoc", "
Parameters
----------
theE: TopoDS_Edge
thePolyg: TColgp_HArray1OfPnt

Return
-------
None

Description
-----------
Prepare set of 3d points on base of any available edge polygons: 3D polygon, polygon on triangulation, 2d polygon on surface If edge has no polygons, array thePolyg is left unchanged.
") PreparePolygon;
		static void PreparePolygon(const TopoDS_Edge & theE, opencascade::handle<TColgp_HArray1OfPnt> & thePolyg);

		/****** BRepGProp_MeshCinert::SetLocation ******/
		/****** md5 signature: 5ed92b27e15802cdea187cf4e43b346a ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
CLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
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
		/****** BRepGProp_Sinert::BRepGProp_Sinert ******/
		/****** md5 signature: 30a453e8dacad302931072d4b523dd24 ******/
		%feature("compactdefaultargs") BRepGProp_Sinert;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepGProp_Sinert;
		 BRepGProp_Sinert();

		/****** BRepGProp_Sinert::BRepGProp_Sinert ******/
		/****** md5 signature: b82fc330e2f8068a37939fb7a1d44b4e ******/
		%feature("compactdefaultargs") BRepGProp_Sinert;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
SLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") BRepGProp_Sinert;
		 BRepGProp_Sinert(const BRepGProp_Face & S, const gp_Pnt & SLocation);

		/****** BRepGProp_Sinert::BRepGProp_Sinert ******/
		/****** md5 signature: 10b645adb9e1d14109d3264defc257f1 ******/
		%feature("compactdefaultargs") BRepGProp_Sinert;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
SLocation: gp_Pnt

Return
-------
None

Description
-----------
Builds a Sinert to evaluate the global properties of the face <S>. If isNaturalRestriction is true the domain of S is defined with the natural bounds, else it defined with an iterator of Edge from TopoDS (see DomainTool from GProp).
") BRepGProp_Sinert;
		 BRepGProp_Sinert(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pnt & SLocation);

		/****** BRepGProp_Sinert::BRepGProp_Sinert ******/
		/****** md5 signature: 74ce3ffece3e8a1edd918b0dd45da546 ******/
		%feature("compactdefaultargs") BRepGProp_Sinert;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
SLocation: gp_Pnt
Eps: float

Return
-------
None

Description
-----------
No available documentation.
") BRepGProp_Sinert;
		 BRepGProp_Sinert(BRepGProp_Face & S, const gp_Pnt & SLocation, const Standard_Real Eps);

		/****** BRepGProp_Sinert::BRepGProp_Sinert ******/
		/****** md5 signature: a08ec0516fd40a598790191badfd6a24 ******/
		%feature("compactdefaultargs") BRepGProp_Sinert;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
SLocation: gp_Pnt
Eps: float

Return
-------
None

Description
-----------
No available documentation.
") BRepGProp_Sinert;
		 BRepGProp_Sinert(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pnt & SLocation, const Standard_Real Eps);

		/****** BRepGProp_Sinert::GetEpsilon ******/
		/****** md5 signature: 70053d03d9c27b2171a20b75ca67dc00 ******/
		%feature("compactdefaultargs") GetEpsilon;
		%feature("autodoc", "Return
-------
float

Description
-----------
If previously used method contained Eps parameter get actual relative error of the computation, else return 1.0.
") GetEpsilon;
		Standard_Real GetEpsilon();

		/****** BRepGProp_Sinert::Perform ******/
		/****** md5 signature: 287766d0387e8a92bd6fd7efea57304a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const BRepGProp_Face & S);

		/****** BRepGProp_Sinert::Perform ******/
		/****** md5 signature: 2a40161e06229ca1640ab336b74b37cd ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(BRepGProp_Face & S, BRepGProp_Domain & D);

		/****** BRepGProp_Sinert::Perform ******/
		/****** md5 signature: 9f27bb8deb5f9df42810f2abd51c6026 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
Eps: float

Return
-------
float

Description
-----------
No available documentation.
") Perform;
		Standard_Real Perform(BRepGProp_Face & S, const Standard_Real Eps);

		/****** BRepGProp_Sinert::Perform ******/
		/****** md5 signature: a7c77e80349f9dd440598643ec9aae4a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
Eps: float

Return
-------
float

Description
-----------
No available documentation.
") Perform;
		Standard_Real Perform(BRepGProp_Face & S, BRepGProp_Domain & D, const Standard_Real Eps);

		/****** BRepGProp_Sinert::SetLocation ******/
		/****** md5 signature: 21f84731f7ae4a935b732f676863a0d9 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
SLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
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
		/****** BRepGProp_TFunction::BRepGProp_TFunction ******/
		/****** md5 signature: 660069516fa3db7a124db5fda3b09b0e ******/
		%feature("compactdefaultargs") BRepGProp_TFunction;
		%feature("autodoc", "
Parameters
----------
theSurface: BRepGProp_Face
theVertex: gp_Pnt
IsByPoint: bool
theCoeffs: float *
theUMin: float
theTolerance: float

Return
-------
None

Description
-----------
Constructor. Initializes the function with the face, the location point, the flag IsByPoint, the coefficients theCoeff that have different meaning depending on the value of IsByPoint. The last two parameters are theUMin - the lower bound of the inner integral. This value is fixed for any integral. And the value of tolerance of inner integral computation. If IsByPoint is equal to Standard_True, the number of the coefficients is equal to 3 and they represent X, Y and Z coordinates (theCoeff[0], theCoeff[1] and theCoeff[2] correspondingly) of the shift if the inertia is computed with respect to the point different then the location. If IsByPoint is equal to Standard_False, the number of the coefficients is 4 and they represent the combination of plane parameters and shift values.
") BRepGProp_TFunction;
		 BRepGProp_TFunction(const BRepGProp_Face & theSurface, const gp_Pnt & theVertex, const Standard_Boolean IsByPoint, const Standard_Real * theCoeffs, const Standard_Real theUMin, const Standard_Real theTolerance);

		/****** BRepGProp_TFunction::AbsolutError ******/
		/****** md5 signature: 12eadedd827c6f2cfdee466e4014e7d9 ******/
		%feature("compactdefaultargs") AbsolutError;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the absolut reached error of all values computation since the last call of GetStateNumber method.
") AbsolutError;
		Standard_Real AbsolutError();

		/****** BRepGProp_TFunction::ErrorReached ******/
		/****** md5 signature: a07cf8273fa0f4cf4aae707ac80776ec ******/
		%feature("compactdefaultargs") ErrorReached;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the relative reached error of all values computation since the last call of GetStateNumber method.
") ErrorReached;
		Standard_Real ErrorReached();

		/****** BRepGProp_TFunction::GetStateNumber ******/
		/****** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Redefined method. Remembers the error reached during computation of integral values since the object creation or the last call of GetStateNumber. It is invoked in each algorithm from the package math. Particularly in the algorithm math_KronrodSingleIntegration that is used to compute the integral of TFunction.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** BRepGProp_TFunction::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****** BRepGProp_TFunction::SetNbKronrodPoints ******/
		/****** md5 signature: 2388e1a76b29ff88e9dd10198003e6b8 ******/
		%feature("compactdefaultargs") SetNbKronrodPoints;
		%feature("autodoc", "
Parameters
----------
theNbPoints: int

Return
-------
None

Description
-----------
Setting the expected number of Kronrod points for the outer integral computation. This number is required for computation of a value of tolerance for inner integral computation. After GetStateNumber method call, this number is recomputed by the same law as in math_KronrodSingleIntegration, i.e. next number of points is equal to the current number plus a square root of the current number. If the law in math_KronrodSingleIntegration is changed, the modification algo should be modified accordingly.
") SetNbKronrodPoints;
		void SetNbKronrodPoints(const Standard_Integer theNbPoints);

		/****** BRepGProp_TFunction::SetTolerance ******/
		/****** md5 signature: cbe94a7292bcea72785e79a4eafde5ea ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
aTol: float

Return
-------
None

Description
-----------
Setting the tolerance for inner integration.
") SetTolerance;
		void SetTolerance(const Standard_Real aTol);

		/****** BRepGProp_TFunction::SetValueType ******/
		/****** md5 signature: e50d5f7e32a617f0c0c33c6617861546 ******/
		%feature("compactdefaultargs") SetValueType;
		%feature("autodoc", "
Parameters
----------
aType: GProp_ValueType

Return
-------
None

Description
-----------
Setting the type of the value to be returned. This parameter is directly passed to the UFunction.
") SetValueType;
		void SetValueType(const GProp_ValueType aType);

		/****** BRepGProp_TFunction::Value ******/
		/****** md5 signature: 15617dca721c4472bfb7ee7933f04bce ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float

Description
-----------
Returns a value of the function. The value represents an integral of UFunction. It is computed with the predefined tolerance using the adaptive Gauss-Kronrod method.
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
		/****** BRepGProp_UFunction::BRepGProp_UFunction ******/
		/****** md5 signature: f53c91a3d00c6205c8aeda4203c886d7 ******/
		%feature("compactdefaultargs") BRepGProp_UFunction;
		%feature("autodoc", "
Parameters
----------
theSurface: BRepGProp_Face
theVertex: gp_Pnt
IsByPoint: bool
theCoeffs: float *

Return
-------
None

Description
-----------
Constructor. Initializes the function with the face, the location point, the flag IsByPoint and the coefficients theCoeff that have different meaning depending on the value of IsByPoint. If IsByPoint is equal to Standard_True, the number of the coefficients is equal to 3 and they represent X, Y and Z coordinates (theCoeff[0], theCoeff[1] and theCoeff[2] correspondingly) of the shift, if the inertia is computed with respect to the point different then the location. If IsByPoint is equal to Standard_False, the number of the coefficients is 4 and they represent the combination of plane parameters and shift values.
") BRepGProp_UFunction;
		 BRepGProp_UFunction(const BRepGProp_Face & theSurface, const gp_Pnt & theVertex, const Standard_Boolean IsByPoint, const Standard_Real * theCoeffs);

		/****** BRepGProp_UFunction::SetVParam ******/
		/****** md5 signature: 65557cc70db507c03b9e102c112375ed ******/
		%feature("compactdefaultargs") SetVParam;
		%feature("autodoc", "
Parameters
----------
theVParam: float

Return
-------
None

Description
-----------
Setting the V parameter that is constant during the integral computation.
") SetVParam;
		void SetVParam(const Standard_Real theVParam);

		/****** BRepGProp_UFunction::SetValueType ******/
		/****** md5 signature: f560b8c5b982b75a196f946bfdc77fcb ******/
		%feature("compactdefaultargs") SetValueType;
		%feature("autodoc", "
Parameters
----------
theType: GProp_ValueType

Return
-------
None

Description
-----------
Setting the type of the value to be returned.
") SetValueType;
		void SetValueType(const GProp_ValueType theType);

		/****** BRepGProp_UFunction::Value ******/
		/****** md5 signature: 15617dca721c4472bfb7ee7933f04bce ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float

Description
-----------
Returns a value of the function.
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
		/****** BRepGProp_Vinert::BRepGProp_Vinert ******/
		/****** md5 signature: 4d03c85dfc1aa38496efd1cd67dfb041 ******/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepGProp_Vinert;
		 BRepGProp_Vinert();

		/****** BRepGProp_Vinert::BRepGProp_Vinert ******/
		/****** md5 signature: 1414a74187b929e713ff870c0e037149 ******/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
VLocation: gp_Pnt

Return
-------
None

Description
-----------
Computes the global properties of a region of 3D space delimited with the surface <S> and the point VLocation. S can be closed The method is quick and its precision is enough for many cases of analytical surfaces. Non-adaptive 2D Gauss integration with predefined numbers of Gauss points is used. Numbers of points depend on types of surfaces and curves. Error of the computation is not calculated.
") BRepGProp_Vinert;
		 BRepGProp_Vinert(const BRepGProp_Face & S, const gp_Pnt & VLocation);

		/****** BRepGProp_Vinert::BRepGProp_Vinert ******/
		/****** md5 signature: 13a616469cff283670358262ff91dcf9 ******/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
VLocation: gp_Pnt
Eps: float

Return
-------
None

Description
-----------
Computes the global properties of a region of 3D space delimited with the surface <S> and the point VLocation. S can be closed Adaptive 2D Gauss integration is used. Parameter Eps sets maximal relative error of computed mass (volume) for face. Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values for two successive steps of adaptive integration.
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, const gp_Pnt & VLocation, const Standard_Real Eps);

		/****** BRepGProp_Vinert::BRepGProp_Vinert ******/
		/****** md5 signature: 5c8c9fce1d68c04b255a76edd33c2c5d ******/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
O: gp_Pnt
VLocation: gp_Pnt

Return
-------
None

Description
-----------
Computes the global properties of the region of 3D space delimited with the surface <S> and the point VLocation. The method is quick and its precision is enough for many cases of analytical surfaces. Non-adaptive 2D Gauss integration with predefined numbers of Gauss points is used. Numbers of points depend on types of surfaces and curves. Error of the computation is not calculated.
") BRepGProp_Vinert;
		 BRepGProp_Vinert(const BRepGProp_Face & S, const gp_Pnt & O, const gp_Pnt & VLocation);

		/****** BRepGProp_Vinert::BRepGProp_Vinert ******/
		/****** md5 signature: df85730af0638f29c218a6be2ab7aecc ******/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
O: gp_Pnt
VLocation: gp_Pnt
Eps: float

Return
-------
None

Description
-----------
Computes the global properties of the region of 3D space delimited with the surface <S> and the point VLocation. Adaptive 2D Gauss integration is used. Parameter Eps sets maximal relative error of computed mass (volume) for face. Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values for two successive steps of adaptive integration. WARNING: if Eps > 0.001 algorithm performs non-adaptive integration.
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, const gp_Pnt & O, const gp_Pnt & VLocation, const Standard_Real Eps);

		/****** BRepGProp_Vinert::BRepGProp_Vinert ******/
		/****** md5 signature: 7f48df0c9e63f4ccad77f35c8ead2e18 ******/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
Pl: gp_Pln
VLocation: gp_Pnt

Return
-------
None

Description
-----------
Computes the global properties of the region of 3D space delimited with the surface <S> and the plane Pln. The method is quick and its precision is enough for many cases of analytical surfaces. Non-adaptive 2D Gauss integration with predefined numbers of Gauss points is used. Numbers of points depend on types of surfaces and curves. Error of the computation is not calculated.
") BRepGProp_Vinert;
		 BRepGProp_Vinert(const BRepGProp_Face & S, const gp_Pln & Pl, const gp_Pnt & VLocation);

		/****** BRepGProp_Vinert::BRepGProp_Vinert ******/
		/****** md5 signature: c7ffc413b9031d515f8311697c9bc6b3 ******/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
Pl: gp_Pln
VLocation: gp_Pnt
Eps: float

Return
-------
None

Description
-----------
Computes the global properties of the region of 3D space delimited with the surface <S> and the plane Pln. Adaptive 2D Gauss integration is used. Parameter Eps sets maximal relative error of computed mass (volume) for face. Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values for two successive steps of adaptive integration. WARNING: if Eps > 0.001 algorithm performs non-adaptive integration.
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, const gp_Pln & Pl, const gp_Pnt & VLocation, const Standard_Real Eps);

		/****** BRepGProp_Vinert::BRepGProp_Vinert ******/
		/****** md5 signature: bd59787cdd3504146a2e59074662acc7 ******/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
VLocation: gp_Pnt

Return
-------
None

Description
-----------
Computes the global properties of a region of 3D space delimited with the surface <S> and the point VLocation. S can be closed The method is quick and its precision is enough for many cases of analytical surfaces. Non-adaptive 2D Gauss integration with predefined numbers of Gauss points is used. Numbers of points depend on types of surfaces and curves. Error of the computation is not calculated.
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pnt & VLocation);

		/****** BRepGProp_Vinert::BRepGProp_Vinert ******/
		/****** md5 signature: d280d056ab61286ffa7e329635e8adc4 ******/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
VLocation: gp_Pnt
Eps: float

Return
-------
None

Description
-----------
Computes the global properties of a region of 3D space delimited with the surface <S> and the point VLocation. S can be closed Adaptive 2D Gauss integration is used. Parameter Eps sets maximal relative error of computed mass (volume) for face. Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values for two successive steps of adaptive integration.
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pnt & VLocation, const Standard_Real Eps);

		/****** BRepGProp_Vinert::BRepGProp_Vinert ******/
		/****** md5 signature: f3a262fb64cb9de88ea729596d32dfa8 ******/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
O: gp_Pnt
VLocation: gp_Pnt

Return
-------
None

Description
-----------
Computes the global properties of the region of 3D space delimited with the surface <S> and the point VLocation. The method is quick and its precision is enough for many cases of analytical surfaces. Non-adaptive 2D Gauss integration with predefined numbers of Gauss points is used. Numbers of points depend on types of surfaces and curves. Error of the computation is not calculated.
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pnt & O, const gp_Pnt & VLocation);

		/****** BRepGProp_Vinert::BRepGProp_Vinert ******/
		/****** md5 signature: 0fb97e514eb1305a85cb6f202d0ca710 ******/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
O: gp_Pnt
VLocation: gp_Pnt
Eps: float

Return
-------
None

Description
-----------
Computes the global properties of the region of 3D space delimited with the surface <S> and the point VLocation. Adaptive 2D Gauss integration is used. Parameter Eps sets maximal relative error of computed mass (volume) for face. Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values for two successive steps of adaptive integration. WARNING: if Eps > 0.001 algorithm performs non-adaptive integration.
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pnt & O, const gp_Pnt & VLocation, const Standard_Real Eps);

		/****** BRepGProp_Vinert::BRepGProp_Vinert ******/
		/****** md5 signature: 4d4d2889b5f4db0e01ce23afa5532b52 ******/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
Pl: gp_Pln
VLocation: gp_Pnt

Return
-------
None

Description
-----------
Computes the global properties of the region of 3D space delimited with the surface <S> and the plane Pln. The method is quick and its precision is enough for many cases of analytical surfaces. Non-adaptive 2D Gauss integration with predefined numbers of Gauss points is used. Numbers of points depend on types of surfaces and curves. Error of the computation is not calculated.
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pln & Pl, const gp_Pnt & VLocation);

		/****** BRepGProp_Vinert::BRepGProp_Vinert ******/
		/****** md5 signature: f45f2cd07c17c648e1699a791da66461 ******/
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
Pl: gp_Pln
VLocation: gp_Pnt
Eps: float

Return
-------
None

Description
-----------
Computes the global properties of the region of 3D space delimited with the surface <S> and the plane Pln. Adaptive 2D Gauss integration is used. Parameter Eps sets maximal relative error of computed mass (volume) for face. Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values for two successive steps of adaptive integration. WARNING: if Eps > 0.001 algorithm performs non-adaptive integration.
") BRepGProp_Vinert;
		 BRepGProp_Vinert(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pln & Pl, const gp_Pnt & VLocation, const Standard_Real Eps);

		/****** BRepGProp_Vinert::GetEpsilon ******/
		/****** md5 signature: 70053d03d9c27b2171a20b75ca67dc00 ******/
		%feature("compactdefaultargs") GetEpsilon;
		%feature("autodoc", "Return
-------
float

Description
-----------
If previously used methods containe Eps parameter gets actual relative error of the computation, else returns 1.0.
") GetEpsilon;
		Standard_Real GetEpsilon();

		/****** BRepGProp_Vinert::Perform ******/
		/****** md5 signature: 287766d0387e8a92bd6fd7efea57304a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const BRepGProp_Face & S);

		/****** BRepGProp_Vinert::Perform ******/
		/****** md5 signature: 9f27bb8deb5f9df42810f2abd51c6026 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
Eps: float

Return
-------
float

Description
-----------
No available documentation.
") Perform;
		Standard_Real Perform(BRepGProp_Face & S, const Standard_Real Eps);

		/****** BRepGProp_Vinert::Perform ******/
		/****** md5 signature: e894591640d6f840f3181c73a396ac73 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
O: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const BRepGProp_Face & S, const gp_Pnt & O);

		/****** BRepGProp_Vinert::Perform ******/
		/****** md5 signature: 3557a52fecea80979634ca485366f4ce ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
O: gp_Pnt
Eps: float

Return
-------
float

Description
-----------
No available documentation.
") Perform;
		Standard_Real Perform(BRepGProp_Face & S, const gp_Pnt & O, const Standard_Real Eps);

		/****** BRepGProp_Vinert::Perform ******/
		/****** md5 signature: 00372c2d834eb3c1d978ec6bfb1f027f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
Pl: gp_Pln

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const BRepGProp_Face & S, const gp_Pln & Pl);

		/****** BRepGProp_Vinert::Perform ******/
		/****** md5 signature: 648e9947f4302031d12bd0a17b5fbe0f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
Pl: gp_Pln
Eps: float

Return
-------
float

Description
-----------
No available documentation.
") Perform;
		Standard_Real Perform(BRepGProp_Face & S, const gp_Pln & Pl, const Standard_Real Eps);

		/****** BRepGProp_Vinert::Perform ******/
		/****** md5 signature: 2a40161e06229ca1640ab336b74b37cd ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(BRepGProp_Face & S, BRepGProp_Domain & D);

		/****** BRepGProp_Vinert::Perform ******/
		/****** md5 signature: a7c77e80349f9dd440598643ec9aae4a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
Eps: float

Return
-------
float

Description
-----------
No available documentation.
") Perform;
		Standard_Real Perform(BRepGProp_Face & S, BRepGProp_Domain & D, const Standard_Real Eps);

		/****** BRepGProp_Vinert::Perform ******/
		/****** md5 signature: 51bda88f4b6e7d3e15825d1a104b74c9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
O: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pnt & O);

		/****** BRepGProp_Vinert::Perform ******/
		/****** md5 signature: 933e01d497a5ae64a162e32137b481fb ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
O: gp_Pnt
Eps: float

Return
-------
float

Description
-----------
No available documentation.
") Perform;
		Standard_Real Perform(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pnt & O, const Standard_Real Eps);

		/****** BRepGProp_Vinert::Perform ******/
		/****** md5 signature: 751b530e05960276e54a63742e074cc1 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
Pl: gp_Pln

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pln & Pl);

		/****** BRepGProp_Vinert::Perform ******/
		/****** md5 signature: 1acf8519ff5d34431bd836b7af497b0a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepGProp_Face
D: BRepGProp_Domain
Pl: gp_Pln
Eps: float

Return
-------
float

Description
-----------
No available documentation.
") Perform;
		Standard_Real Perform(BRepGProp_Face & S, BRepGProp_Domain & D, const gp_Pln & Pl, const Standard_Real Eps);

		/****** BRepGProp_Vinert::SetLocation ******/
		/****** md5 signature: 13648852ef1c389d29559ab743f5f9e2 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
VLocation: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
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
		/****** BRepGProp_VinertGK::BRepGProp_VinertGK ******/
		/****** md5 signature: 2b4ec0003b8c134168e48daf41971b72 ******/
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK();

		/****** BRepGProp_VinertGK::BRepGProp_VinertGK ******/
		/****** md5 signature: 8c95cbab67ec10c708d18427bfedfaaa ******/
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "
Parameters
----------
theSurface: BRepGProp_Face
theLocation: gp_Pnt
theTolerance: float (optional, default to 0.001)
theCGFlag: bool (optional, default to Standard_False)
theIFlag: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructor. Computes the global properties of a region of 3D space delimited with the naturally restricted surface and the point VLocation.
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK(BRepGProp_Face & theSurface, const gp_Pnt & theLocation, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****** BRepGProp_VinertGK::BRepGProp_VinertGK ******/
		/****** md5 signature: 8d65b075f239d772811f6e7cd57131e1 ******/
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "
Parameters
----------
theSurface: BRepGProp_Face
thePoint: gp_Pnt
theLocation: gp_Pnt
theTolerance: float (optional, default to 0.001)
theCGFlag: bool (optional, default to Standard_False)
theIFlag: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructor. Computes the global properties of a region of 3D space delimited with the naturally restricted surface and the point VLocation. The inertia is computed with respect to thePoint.
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK(BRepGProp_Face & theSurface, const gp_Pnt & thePoint, const gp_Pnt & theLocation, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****** BRepGProp_VinertGK::BRepGProp_VinertGK ******/
		/****** md5 signature: 92192b1666bb702876fdd35bd985cf10 ******/
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "
Parameters
----------
theSurface: BRepGProp_Face
theDomain: BRepGProp_Domain
theLocation: gp_Pnt
theTolerance: float (optional, default to 0.001)
theCGFlag: bool (optional, default to Standard_False)
theIFlag: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructor. Computes the global properties of a region of 3D space delimited with the surface bounded by the domain and the point VLocation.
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK(BRepGProp_Face & theSurface, BRepGProp_Domain & theDomain, const gp_Pnt & theLocation, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****** BRepGProp_VinertGK::BRepGProp_VinertGK ******/
		/****** md5 signature: e075379e488804335fc45904b5e86b1d ******/
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "
Parameters
----------
theSurface: BRepGProp_Face
theDomain: BRepGProp_Domain
thePoint: gp_Pnt
theLocation: gp_Pnt
theTolerance: float (optional, default to 0.001)
theCGFlag: bool (optional, default to Standard_False)
theIFlag: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructor. Computes the global properties of a region of 3D space delimited with the surface bounded by the domain and the point VLocation. The inertia is computed with respect to thePoint.
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK(BRepGProp_Face & theSurface, BRepGProp_Domain & theDomain, const gp_Pnt & thePoint, const gp_Pnt & theLocation, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****** BRepGProp_VinertGK::BRepGProp_VinertGK ******/
		/****** md5 signature: 6867b4fa1afaa445bfbfbaf96b8446eb ******/
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "
Parameters
----------
theSurface: BRepGProp_Face
thePlane: gp_Pln
theLocation: gp_Pnt
theTolerance: float (optional, default to 0.001)
theCGFlag: bool (optional, default to Standard_False)
theIFlag: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructor. Computes the global properties of a region of 3D space delimited with the naturally restricted surface and the plane.
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK(BRepGProp_Face & theSurface, const gp_Pln & thePlane, const gp_Pnt & theLocation, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****** BRepGProp_VinertGK::BRepGProp_VinertGK ******/
		/****** md5 signature: 648a50ab357462085f5dfb351879b539 ******/
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "
Parameters
----------
theSurface: BRepGProp_Face
theDomain: BRepGProp_Domain
thePlane: gp_Pln
theLocation: gp_Pnt
theTolerance: float (optional, default to 0.001)
theCGFlag: bool (optional, default to Standard_False)
theIFlag: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructor. Computes the global properties of a region of 3D space delimited with the surface bounded by the domain and the plane.
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK(BRepGProp_Face & theSurface, BRepGProp_Domain & theDomain, const gp_Pln & thePlane, const gp_Pnt & theLocation, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****** BRepGProp_VinertGK::GetErrorReached ******/
		/****** md5 signature: 41776af72d3d1a9138d3f5f33aa13fdd ******/
		%feature("compactdefaultargs") GetErrorReached;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the relative reached computation error.
") GetErrorReached;
		Standard_Real GetErrorReached();

		/****** BRepGProp_VinertGK::Perform ******/
		/****** md5 signature: d570fe8ddab01258ba30702a3483ec6f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theSurface: BRepGProp_Face
theTolerance: float (optional, default to 0.001)
theCGFlag: bool (optional, default to Standard_False)
theIFlag: bool (optional, default to Standard_False)

Return
-------
float

Description
-----------
Computes the global properties of a region of 3D space delimited with the naturally restricted surface and the point VLocation.
") Perform;
		Standard_Real Perform(BRepGProp_Face & theSurface, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****** BRepGProp_VinertGK::Perform ******/
		/****** md5 signature: b4af8c130cc28d347e5136c66efe2e2b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theSurface: BRepGProp_Face
thePoint: gp_Pnt
theTolerance: float (optional, default to 0.001)
theCGFlag: bool (optional, default to Standard_False)
theIFlag: bool (optional, default to Standard_False)

Return
-------
float

Description
-----------
Computes the global properties of a region of 3D space delimited with the naturally restricted surface and the point VLocation. The inertia is computed with respect to thePoint.
") Perform;
		Standard_Real Perform(BRepGProp_Face & theSurface, const gp_Pnt & thePoint, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****** BRepGProp_VinertGK::Perform ******/
		/****** md5 signature: b40034b46e1dbb701f4a74e5c0f074dc ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theSurface: BRepGProp_Face
theDomain: BRepGProp_Domain
theTolerance: float (optional, default to 0.001)
theCGFlag: bool (optional, default to Standard_False)
theIFlag: bool (optional, default to Standard_False)

Return
-------
float

Description
-----------
Computes the global properties of a region of 3D space delimited with the surface bounded by the domain and the point VLocation.
") Perform;
		Standard_Real Perform(BRepGProp_Face & theSurface, BRepGProp_Domain & theDomain, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****** BRepGProp_VinertGK::Perform ******/
		/****** md5 signature: e2709a20d48918e9084b81ceae2afbce ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theSurface: BRepGProp_Face
theDomain: BRepGProp_Domain
thePoint: gp_Pnt
theTolerance: float (optional, default to 0.001)
theCGFlag: bool (optional, default to Standard_False)
theIFlag: bool (optional, default to Standard_False)

Return
-------
float

Description
-----------
Computes the global properties of a region of 3D space delimited with the surface bounded by the domain and the point VLocation. The inertia is computed with respect to thePoint.
") Perform;
		Standard_Real Perform(BRepGProp_Face & theSurface, BRepGProp_Domain & theDomain, const gp_Pnt & thePoint, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****** BRepGProp_VinertGK::Perform ******/
		/****** md5 signature: c7217d0c046ee96a7a7100e2a76bbce3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theSurface: BRepGProp_Face
thePlane: gp_Pln
theTolerance: float (optional, default to 0.001)
theCGFlag: bool (optional, default to Standard_False)
theIFlag: bool (optional, default to Standard_False)

Return
-------
float

Description
-----------
Computes the global properties of a region of 3D space delimited with the naturally restricted surface and the plane.
") Perform;
		Standard_Real Perform(BRepGProp_Face & theSurface, const gp_Pln & thePlane, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****** BRepGProp_VinertGK::Perform ******/
		/****** md5 signature: 59e16d24d1aae57294bc90cb8d6007e5 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theSurface: BRepGProp_Face
theDomain: BRepGProp_Domain
thePlane: gp_Pln
theTolerance: float (optional, default to 0.001)
theCGFlag: bool (optional, default to Standard_False)
theIFlag: bool (optional, default to Standard_False)

Return
-------
float

Description
-----------
Computes the global properties of a region of 3D space delimited with the surface bounded by the domain and the plane.
") Perform;
		Standard_Real Perform(BRepGProp_Face & theSurface, BRepGProp_Domain & theDomain, const gp_Pln & thePlane, const Standard_Real theTolerance = 0.001, const Standard_Boolean theCGFlag = Standard_False, const Standard_Boolean theIFlag = Standard_False);

		/****** BRepGProp_VinertGK::SetLocation ******/
		/****** md5 signature: 49b73879adebd078faa244b518af4276 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theLocation: gp_Pnt

Return
-------
None

Description
-----------
Sets the vertex that delimit 3D closed region of space.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def brepgprop_LinearProperties(*args):
	return brepgprop.LinearProperties(*args)

@deprecated
def brepgprop_SurfaceProperties(*args):
	return brepgprop.SurfaceProperties(*args)

@deprecated
def brepgprop_SurfaceProperties(*args):
	return brepgprop.SurfaceProperties(*args)

@deprecated
def brepgprop_VolumeProperties(*args):
	return brepgprop.VolumeProperties(*args)

@deprecated
def brepgprop_VolumeProperties(*args):
	return brepgprop.VolumeProperties(*args)

@deprecated
def brepgprop_VolumePropertiesGK(*args):
	return brepgprop.VolumePropertiesGK(*args)

@deprecated
def brepgprop_VolumePropertiesGK(*args):
	return brepgprop.VolumePropertiesGK(*args)

@deprecated
def BRepGProp_EdgeTool_D1(*args):
	return BRepGProp_EdgeTool.D1(*args)

@deprecated
def BRepGProp_EdgeTool_FirstParameter(*args):
	return BRepGProp_EdgeTool.FirstParameter(*args)

@deprecated
def BRepGProp_EdgeTool_IntegrationOrder(*args):
	return BRepGProp_EdgeTool.IntegrationOrder(*args)

@deprecated
def BRepGProp_EdgeTool_Intervals(*args):
	return BRepGProp_EdgeTool.Intervals(*args)

@deprecated
def BRepGProp_EdgeTool_LastParameter(*args):
	return BRepGProp_EdgeTool.LastParameter(*args)

@deprecated
def BRepGProp_EdgeTool_NbIntervals(*args):
	return BRepGProp_EdgeTool.NbIntervals(*args)

@deprecated
def BRepGProp_EdgeTool_Value(*args):
	return BRepGProp_EdgeTool.Value(*args)

@deprecated
def BRepGProp_MeshCinert_PreparePolygon(*args):
	return BRepGProp_MeshCinert.PreparePolygon(*args)

}
