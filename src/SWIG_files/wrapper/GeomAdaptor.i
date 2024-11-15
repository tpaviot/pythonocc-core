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
%define GEOMADAPTORDOCSTRING
"GeomAdaptor module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_geomadaptor.html"
%enddef
%module (package="OCC.Core", docstring=GEOMADAPTORDOCSTRING) GeomAdaptor


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
#include<GeomAdaptor_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
%import Geom.i
%import gp.i
%import GeomAbs.i
%import TColStd.i

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
%wrap_handle(GeomAdaptor_Curve)
%wrap_handle(GeomAdaptor_Surface)
%wrap_handle(GeomAdaptor_SurfaceOfLinearExtrusion)
%wrap_handle(GeomAdaptor_SurfaceOfRevolution)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/********************
* class GeomAdaptor *
********************/
%rename(geomadaptor) GeomAdaptor;
class GeomAdaptor {
	public:
		/****** GeomAdaptor::MakeCurve ******/
		/****** md5 signature: b2a0867e843655f110e2f5dd5ef19022 ******/
		%feature("compactdefaultargs") MakeCurve;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Inherited from ghcurve. provides a curve handled by reference. build a geom_curve using the information from the curve from adaptor3d.
") MakeCurve;
		static opencascade::handle<Geom_Curve> MakeCurve(const Adaptor3d_Curve & C);

		/****** GeomAdaptor::MakeSurface ******/
		/****** md5 signature: e2d97ddab298fadfa35fcf5d3da46eb5 ******/
		%feature("compactdefaultargs") MakeSurface;
		%feature("autodoc", "
Parameters
----------
theS: Adaptor3d_Surface
theTrimFlag: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Build a geom_surface using the information from the surface from adaptor3d @param thes - surface adaptor to convert. @param thetrimflag - true if perform trim surface values by adaptor and false otherwise.
") MakeSurface;
		static opencascade::handle<Geom_Surface> MakeSurface(const Adaptor3d_Surface & theS, const Standard_Boolean theTrimFlag = Standard_True);

};


%extend GeomAdaptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomAdaptor_Curve *
**************************/
class GeomAdaptor_Curve : public Adaptor3d_Curve {
	public:
		/****** GeomAdaptor_Curve::GeomAdaptor_Curve ******/
		/****** md5 signature: ccb204f3ef4733cff0b86e86ac3d5f12 ******/
		%feature("compactdefaultargs") GeomAdaptor_Curve;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomAdaptor_Curve;
		 GeomAdaptor_Curve();

		/****** GeomAdaptor_Curve::GeomAdaptor_Curve ******/
		/****** md5 signature: 649b37dd8045d083fefebcda0e3e12fb ******/
		%feature("compactdefaultargs") GeomAdaptor_Curve;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") GeomAdaptor_Curve;
		 GeomAdaptor_Curve(const opencascade::handle<Geom_Curve> & theCurve);

		/****** GeomAdaptor_Curve::GeomAdaptor_Curve ******/
		/****** md5 signature: 1a10d0efcbd8197e53d90228c15a2809 ******/
		%feature("compactdefaultargs") GeomAdaptor_Curve;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_Curve
theUFirst: float
theULast: float

Return
-------
None

Description
-----------
Standard_constructionerror is raised if theufirst>theulast.
") GeomAdaptor_Curve;
		 GeomAdaptor_Curve(const opencascade::handle<Geom_Curve> & theCurve, const Standard_Real theUFirst, const Standard_Real theULast);

		/****** GeomAdaptor_Curve::BSpline ******/
		/****** md5 signature: 3ccc0d851302bffb5de6344e3eb3e58d ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
This will not make a copy of the bspline curve: if you want to modify the curve please make a copy yourself also it will not trim the surface to myfirst/last.
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****** GeomAdaptor_Curve::Bezier ******/
		/****** md5 signature: 092280fc6ee0e7104fbbe3460d73e83c ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
This will not make a copy of the bezier curve: if you want to modify the curve please make a copy yourself also it will not trim the surface to myfirst/last.
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****** GeomAdaptor_Curve::Circle ******/
		/****** md5 signature: 5f382e7a6af009845ea6e16d54814298 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		gp_Circ Circle();

		/****** GeomAdaptor_Curve::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** GeomAdaptor_Curve::Curve ******/
		/****** md5 signature: 62a16889fb975efa1b2de012099c169b ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Provides a curve inherited from hcurve from adaptor. this is inherited to provide easy to use constructors.
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****** GeomAdaptor_Curve::D0 ******/
		/****** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameter u.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** GeomAdaptor_Curve::D1 ******/
		/****** md5 signature: 1dc830ec49a945a61cde5e5c027b78d7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
Computes the point of parameter u on the curve with its first derivative. //! warning: on the specific case of bsplinecurve: if the curve is cut in interval of continuity at least c1, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****** GeomAdaptor_Curve::D2 ******/
		/****** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Returns the point p of parameter u, the first and second derivatives v1 and v2. //! warning: on the specific case of bsplinecurve: if the curve is cut in interval of continuity at least c2, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve.
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** GeomAdaptor_Curve::D3 ******/
		/****** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
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
Returns the point p of parameter u, the first, the second and the third derivative. //! warning: on the specific case of bsplinecurve: if the curve is cut in interval of continuity at least c3, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve.
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** GeomAdaptor_Curve::DN ******/
		/****** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation n. warning: on the specific case of bsplinecurve: if the curve is cut in interval of continuity cn, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve. raised if n < 1.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****** GeomAdaptor_Curve::Degree ******/
		/****** md5 signature: 5ce473e72cc7bb935a667f4c839dab09 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
This should never make a copy of the underlying curve to read the relevant information.
") Degree;
		Standard_Integer Degree();

		/****** GeomAdaptor_Curve::Ellipse ******/
		/****** md5 signature: e9a77f14e9bbca29370202de404ea9c1 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips Ellipse();

		/****** GeomAdaptor_Curve::FirstParameter ******/
		/****** md5 signature: 93c381754667baab23468a195644e410 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****** GeomAdaptor_Curve::GetType ******/
		/****** md5 signature: eaef05bb051ab4b74eda73aca8930d16 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
No available documentation.
") GetType;
		virtual GeomAbs_CurveType GetType();

		/****** GeomAdaptor_Curve::Hyperbola ******/
		/****** md5 signature: a96ca49b2ad017b35bb09d0b86cb690d ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Hyperbola;
		gp_Hypr Hyperbola();

		/****** GeomAdaptor_Curve::Intervals ******/
		/****** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accommodate for the parameters. i.e. t.length() > nbintervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomAdaptor_Curve::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** GeomAdaptor_Curve::IsPeriodic ******/
		/****** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** GeomAdaptor_Curve::IsRational ******/
		/****** md5 signature: 82ca56fad113156125f40128b25c0d8e ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This should never make a copy of the underlying curve to read the relevant information.
") IsRational;
		Standard_Boolean IsRational();

		/****** GeomAdaptor_Curve::LastParameter ******/
		/****** md5 signature: a2893a92f9c4af09acb0cd59d959d964 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		virtual Standard_Real LastParameter();

		/****** GeomAdaptor_Curve::Line ******/
		/****** md5 signature: cf28f5541e4e744dd8038e2a9ac75a8f ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		gp_Lin Line();

		/****** GeomAdaptor_Curve::Load ******/
		/****** md5 signature: e05559f93c046e47a8be3d9ab64ebec8 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const opencascade::handle<Geom_Curve> & theCurve);

		/****** GeomAdaptor_Curve::Load ******/
		/****** md5 signature: 870dfd0d647afc03a8ecd96c1d9b3367 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_Curve
theUFirst: float
theULast: float

Return
-------
None

Description
-----------
Standard_constructionerror is raised if theufirst>theulast.
") Load;
		void Load(const opencascade::handle<Geom_Curve> & theCurve, const Standard_Real theUFirst, const Standard_Real theULast);

		/****** GeomAdaptor_Curve::NbIntervals ******/
		/****** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomAdaptor_Curve::NbKnots ******/
		/****** md5 signature: 841663cbf96bec3b939f307c52df6c7c ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
This should never make a copy of the underlying curve to read the relevant information.
") NbKnots;
		Standard_Integer NbKnots();

		/****** GeomAdaptor_Curve::NbPoles ******/
		/****** md5 signature: 52e5fadf897540545847ef59cc0ba942 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
This should never make a copy of the underlying curve to read the relevant information.
") NbPoles;
		Standard_Integer NbPoles();

		/****** GeomAdaptor_Curve::OffsetCurve ******/
		/****** md5 signature: c9712770a031ed315e762ca33ff3eddd ******/
		%feature("compactdefaultargs") OffsetCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_OffsetCurve>

Description
-----------
No available documentation.
") OffsetCurve;
		opencascade::handle<Geom_OffsetCurve> OffsetCurve();

		/****** GeomAdaptor_Curve::Parabola ******/
		/****** md5 signature: 68860abab63fd184ea5c7eb97f0762c1 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
No available documentation.
") Parabola;
		gp_Parab Parabola();

		/****** GeomAdaptor_Curve::Period ******/
		/****** md5 signature: 88909a321398632744c0d6841580c626 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Period;
		Standard_Real Period();

		/****** GeomAdaptor_Curve::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset currently loaded curve (undone load()).
") Reset;
		void Reset();

		/****** GeomAdaptor_Curve::Resolution ******/
		/****** md5 signature: cc4a4d9111fadd20ad48e62bc4df1579 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
R3d: float

Return
-------
float

Description
-----------
Returns the parametric resolution.
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****** GeomAdaptor_Curve::ShallowCopy ******/
		/****** md5 signature: 1b6b0927543eab9d05e2c875c0c3efb6 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		virtual opencascade::handle<Adaptor3d_Curve> ShallowCopy();

		/****** GeomAdaptor_Curve::Trim ******/
		/****** md5 signature: 40a46ffe7379c6d919968b501b8343a5 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Returns a curve equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.
") Trim;
		opencascade::handle<Adaptor3d_Curve> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** GeomAdaptor_Curve::Value ******/
		/****** md5 signature: d7f310c73762cbaa285ace0a141bc7bf ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter u on the curve.
") Value;
		gp_Pnt Value(const Standard_Real U);

};


%make_alias(GeomAdaptor_Curve)

%extend GeomAdaptor_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomAdaptor_Surface *
****************************/
class GeomAdaptor_Surface : public Adaptor3d_Surface {
	public:
		/****** GeomAdaptor_Surface::GeomAdaptor_Surface ******/
		/****** md5 signature: e4d8f69fd067a07f447e80b193ed4e6d ******/
		%feature("compactdefaultargs") GeomAdaptor_Surface;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomAdaptor_Surface;
		 GeomAdaptor_Surface();

		/****** GeomAdaptor_Surface::GeomAdaptor_Surface ******/
		/****** md5 signature: 10dc0d4a45b263adcecf88a448666f99 ******/
		%feature("compactdefaultargs") GeomAdaptor_Surface;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_Surface

Return
-------
None

Description
-----------
No available documentation.
") GeomAdaptor_Surface;
		 GeomAdaptor_Surface(const opencascade::handle<Geom_Surface> & theSurf);

		/****** GeomAdaptor_Surface::GeomAdaptor_Surface ******/
		/****** md5 signature: bd6e4cc11ebb04ed69b2ff924099da48 ******/
		%feature("compactdefaultargs") GeomAdaptor_Surface;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_Surface
theUFirst: float
theULast: float
theVFirst: float
theVLast: float
theTolU: float (optional, default to 0.0)
theTolV: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Standard_constructionerror is raised if ufirst>ulast or vfirst>vlast.
") GeomAdaptor_Surface;
		 GeomAdaptor_Surface(const opencascade::handle<Geom_Surface> & theSurf, const Standard_Real theUFirst, const Standard_Real theULast, const Standard_Real theVFirst, const Standard_Real theVLast, const Standard_Real theTolU = 0.0, const Standard_Real theTolV = 0.0);

		/****** GeomAdaptor_Surface::AxeOfRevolution ******/
		/****** md5 signature: ba4a8d5fbd6cead47ee1b295e5469d5d ******/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
No available documentation.
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution();

		/****** GeomAdaptor_Surface::BSpline ******/
		/****** md5 signature: 7edfedec29b3e090d1dbb1c560f9218f ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
This will not make a copy of the bspline surface: if you want to modify the surface please make a copy yourself also it will not trim the surface to myu/vfirst/last.
") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline();

		/****** GeomAdaptor_Surface::BasisCurve ******/
		/****** md5 signature: 3da13dd15bd6f8a74a4a076b13266260 ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") BasisCurve;
		opencascade::handle<Adaptor3d_Curve> BasisCurve();

		/****** GeomAdaptor_Surface::BasisSurface ******/
		/****** md5 signature: de63a8a43356a45f5d395e828ec0014c ******/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") BasisSurface;
		opencascade::handle<Adaptor3d_Surface> BasisSurface();

		/****** GeomAdaptor_Surface::Bezier ******/
		/****** md5 signature: 98b7293dc91af28a1a57c0bfbd1e467a ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierSurface>

Description
-----------
This will not make a copy of the bezier surface: if you want to modify the surface please make a copy yourself also it will not trim the surface to myu/vfirst/last.
") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier();

		/****** GeomAdaptor_Surface::Cone ******/
		/****** md5 signature: 3ce87f79e83a129f74e88ef746e3e34b ******/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "Return
-------
gp_Cone

Description
-----------
No available documentation.
") Cone;
		gp_Cone Cone();

		/****** GeomAdaptor_Surface::Cylinder ******/
		/****** md5 signature: fdc0e133b47b8d299b834e1b65638963 ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "Return
-------
gp_Cylinder

Description
-----------
No available documentation.
") Cylinder;
		gp_Cylinder Cylinder();

		/****** GeomAdaptor_Surface::D0 ******/
		/****** md5 signature: 909f7ecc223d561155c9c3ba4b8e7b64 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameters u,v on the surface.
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****** GeomAdaptor_Surface::D1 ******/
		/****** md5 signature: 0868b105367e01c443402a5728aa3395 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
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
Computes the point and the first derivatives on the surface. //! warning: on the specific case of bsplinesurface: if the surface is cut in interval of continuity at least c1, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface.
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** GeomAdaptor_Surface::D2 ******/
		/****** md5 signature: 5bdb029d3f1561c55d7ab1d1b0b0282a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Return
-------
None

Description
-----------
Computes the point, the first and second derivatives on the surface. //! warning: on the specific case of bsplinesurface: if the surface is cut in interval of continuity at least c2, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface.
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** GeomAdaptor_Surface::D3 ******/
		/****** md5 signature: 2fbd4d1b6bb5f19034b05b5a6e0ddec0 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Return
-------
None

Description
-----------
Computes the point, the first, second and third derivatives on the surface. //! warning: on the specific case of bsplinesurface: if the surface is cut in interval of continuity at least c3, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface.
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** GeomAdaptor_Surface::DN ******/
		/****** md5 signature: 78200f5fa5a4060f4022c2e3d9d8ac0e ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order nu in the direction u and nv in the direction v at the point p(u, v). //! warning: on the specific case of bsplinesurface: if the surface is cut in interval of continuity cn, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface. raised if nu + nv < 1 or nu < 0 or nv < 0.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****** GeomAdaptor_Surface::Direction ******/
		/****** md5 signature: 701909e88752dfbf540944de6bad9f3a ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		gp_Dir Direction();

		/****** GeomAdaptor_Surface::FirstUParameter ******/
		/****** md5 signature: 9f6a318ef39f30d9051cc243f6edc9ac ******/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstUParameter;
		virtual Standard_Real FirstUParameter();

		/****** GeomAdaptor_Surface::FirstVParameter ******/
		/****** md5 signature: 026c8b687e22be56263a275efcb1a191 ******/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstVParameter;
		virtual Standard_Real FirstVParameter();

		/****** GeomAdaptor_Surface::GetType ******/
		/****** md5 signature: 936170b269276a5a12605a71a86272c0 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_SurfaceType

Description
-----------
Returns the type of the surface: plane, cylinder, cone, sphere, torus, beziersurface, bsplinesurface, surfaceofrevolution, surfaceofextrusion, othersurface.
") GetType;
		virtual GeomAbs_SurfaceType GetType();

		/****** GeomAdaptor_Surface::IsUClosed ******/
		/****** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****** GeomAdaptor_Surface::IsUPeriodic ******/
		/****** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****** GeomAdaptor_Surface::IsURational ******/
		/****** md5 signature: 503a5a81658ea54283ba1b83fd4c4159 ******/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsURational;
		Standard_Boolean IsURational();

		/****** GeomAdaptor_Surface::IsVClosed ******/
		/****** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** GeomAdaptor_Surface::IsVPeriodic ******/
		/****** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****** GeomAdaptor_Surface::IsVRational ******/
		/****** md5 signature: 43ab877f92028162dd9780a1e61ecdd7 ******/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVRational;
		Standard_Boolean IsVRational();

		/****** GeomAdaptor_Surface::LastUParameter ******/
		/****** md5 signature: 3133997e2ee3ea09c0b46a884e833ca4 ******/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastUParameter;
		virtual Standard_Real LastUParameter();

		/****** GeomAdaptor_Surface::LastVParameter ******/
		/****** md5 signature: f1f64233932dd0768276d78ffb537717 ******/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastVParameter;
		virtual Standard_Real LastVParameter();

		/****** GeomAdaptor_Surface::Load ******/
		/****** md5 signature: 9ae80bb85601d8887024ee162e816c42 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_Surface

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const opencascade::handle<Geom_Surface> & theSurf);

		/****** GeomAdaptor_Surface::Load ******/
		/****** md5 signature: ad45ae5b785f93959bfca62c6c7fcaca ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_Surface
theUFirst: float
theULast: float
theVFirst: float
theVLast: float
theTolU: float (optional, default to 0.0)
theTolV: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Standard_constructionerror is raised if theufirst>theulast or thevfirst>thevlast.
") Load;
		void Load(const opencascade::handle<Geom_Surface> & theSurf, const Standard_Real theUFirst, const Standard_Real theULast, const Standard_Real theVFirst, const Standard_Real theVLast, const Standard_Real theTolU = 0.0, const Standard_Real theTolV = 0.0);

		/****** GeomAdaptor_Surface::NbUIntervals ******/
		/****** md5 signature: 36290e0c805f559fce0d4de0d4d51789 ******/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of u intervals for continuity <s>. may be one if ucontinuity(me) >= <s>.
") NbUIntervals;
		Standard_Integer NbUIntervals(const GeomAbs_Shape S);

		/****** GeomAdaptor_Surface::NbUKnots ******/
		/****** md5 signature: b3d8ce13e5341877d4ffaaf0b52ec603 ******/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUKnots;
		Standard_Integer NbUKnots();

		/****** GeomAdaptor_Surface::NbUPoles ******/
		/****** md5 signature: 5c5f4e3c3fe024076b4fb29a46558ec0 ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUPoles;
		Standard_Integer NbUPoles();

		/****** GeomAdaptor_Surface::NbVIntervals ******/
		/****** md5 signature: 1386a357acacae70889de04788135ce2 ******/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of v intervals for continuity <s>. may be one if vcontinuity(me) >= <s>.
") NbVIntervals;
		Standard_Integer NbVIntervals(const GeomAbs_Shape S);

		/****** GeomAdaptor_Surface::NbVKnots ******/
		/****** md5 signature: b1cd06ae6e3ff5f29ab4140934f12d0a ******/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVKnots;
		Standard_Integer NbVKnots();

		/****** GeomAdaptor_Surface::NbVPoles ******/
		/****** md5 signature: d1321a0d34d7aaceadde41cd3444173f ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVPoles;
		Standard_Integer NbVPoles();

		/****** GeomAdaptor_Surface::OffsetValue ******/
		/****** md5 signature: ae23f5f41fc62b65137ff41b8ee27c47 ******/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") OffsetValue;
		Standard_Real OffsetValue();

		/****** GeomAdaptor_Surface::Plane ******/
		/****** md5 signature: 38bd3e56cdca70a78cd998154292a430 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
gp_Pln

Description
-----------
No available documentation.
") Plane;
		gp_Pln Plane();

		/****** GeomAdaptor_Surface::ShallowCopy ******/
		/****** md5 signature: 0f1e5e5cc4137678a63b6cdf38f07462 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		virtual opencascade::handle<Adaptor3d_Surface> ShallowCopy();

		/****** GeomAdaptor_Surface::Sphere ******/
		/****** md5 signature: d13f3935ec312564a2f8ef1b299ecf9a ******/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "Return
-------
gp_Sphere

Description
-----------
No available documentation.
") Sphere;
		gp_Sphere Sphere();

		/****** GeomAdaptor_Surface::Surface ******/
		/****** md5 signature: 3aa31a6d63da8a25f018cf96599c0928 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

		/****** GeomAdaptor_Surface::Torus ******/
		/****** md5 signature: 13ce946397b0f1bcfd3f38f215bbadac ******/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "Return
-------
gp_Torus

Description
-----------
No available documentation.
") Torus;
		gp_Torus Torus();

		/****** GeomAdaptor_Surface::UContinuity ******/
		/****** md5 signature: 734a4ef77d0d03bc93d92e10bda465e4 ******/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") UContinuity;
		GeomAbs_Shape UContinuity();

		/****** GeomAdaptor_Surface::UDegree ******/
		/****** md5 signature: fe5d6f101c0706d20343b36865ccf566 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		Standard_Integer UDegree();

		/****** GeomAdaptor_Surface::UIntervals ******/
		/****** md5 signature: 5a653f364681c4a5c1065b7e92c5d659 ******/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Returns the intervals with the requested continuity in the u direction.
") UIntervals;
		void UIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomAdaptor_Surface::UPeriod ******/
		/****** md5 signature: a3dec1a81b623affa1d3ea1e9e49c97e ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") UPeriod;
		Standard_Real UPeriod();

		/****** GeomAdaptor_Surface::UResolution ******/
		/****** md5 signature: 449c7efbd4cbc4136589973c1bc1500b ******/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "
Parameters
----------
R3d: float

Return
-------
float

Description
-----------
Returns the parametric u resolution corresponding to the real space resolution <r3d>.
") UResolution;
		Standard_Real UResolution(const Standard_Real R3d);

		/****** GeomAdaptor_Surface::UTrim ******/
		/****** md5 signature: 3604326125cf753b2a6722a946fb54be ******/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns a surface trimmed in the u direction equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.
") UTrim;
		opencascade::handle<Adaptor3d_Surface> UTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** GeomAdaptor_Surface::VContinuity ******/
		/****** md5 signature: 147ea173efc6a600ed241c35c98936ea ******/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") VContinuity;
		GeomAbs_Shape VContinuity();

		/****** GeomAdaptor_Surface::VDegree ******/
		/****** md5 signature: b7875d48d80bf8a6fde9c47500038fd4 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		Standard_Integer VDegree();

		/****** GeomAdaptor_Surface::VIntervals ******/
		/****** md5 signature: bf8bef8286fec18f81beea299dd5cb6d ******/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Returns the intervals with the requested continuity in the v direction.
") VIntervals;
		void VIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomAdaptor_Surface::VPeriod ******/
		/****** md5 signature: e6f079a3e4e62dbf708e1ce56dfd23b6 ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") VPeriod;
		Standard_Real VPeriod();

		/****** GeomAdaptor_Surface::VResolution ******/
		/****** md5 signature: a2dfdb6521f339dcde6811097088d560 ******/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "
Parameters
----------
R3d: float

Return
-------
float

Description
-----------
Returns the parametric v resolution corresponding to the real space resolution <r3d>.
") VResolution;
		Standard_Real VResolution(const Standard_Real R3d);

		/****** GeomAdaptor_Surface::VTrim ******/
		/****** md5 signature: d094345261a4439c6edc98b200ea4e3d ******/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns a surface trimmed in the v direction between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.
") VTrim;
		opencascade::handle<Adaptor3d_Surface> VTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** GeomAdaptor_Surface::Value ******/
		/****** md5 signature: bc01a119296408176c75cc0dfb0636ae ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float
V: float

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameters u,v on the surface.
") Value;
		gp_Pnt Value(const Standard_Real U, const Standard_Real V);

};


%make_alias(GeomAdaptor_Surface)

%extend GeomAdaptor_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class GeomAdaptor_SurfaceOfLinearExtrusion *
*********************************************/
class GeomAdaptor_SurfaceOfLinearExtrusion : public GeomAdaptor_Surface {
	public:
		/****** GeomAdaptor_SurfaceOfLinearExtrusion::GeomAdaptor_SurfaceOfLinearExtrusion ******/
		/****** md5 signature: 4d6f4e5730660e62b31b9569c8638275 ******/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfLinearExtrusion;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomAdaptor_SurfaceOfLinearExtrusion;
		 GeomAdaptor_SurfaceOfLinearExtrusion();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::GeomAdaptor_SurfaceOfLinearExtrusion ******/
		/****** md5 signature: 6fc0bf3ff5b9ed8b1c76db7c0d314a74 ******/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfLinearExtrusion;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
The curve is loaded.
") GeomAdaptor_SurfaceOfLinearExtrusion;
		 GeomAdaptor_SurfaceOfLinearExtrusion(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::GeomAdaptor_SurfaceOfLinearExtrusion ******/
		/****** md5 signature: 1314165a9ad1384da79bfc20a35c4df2 ******/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfLinearExtrusion;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
V: gp_Dir

Return
-------
None

Description
-----------
Thew curve and the direction are loaded.
") GeomAdaptor_SurfaceOfLinearExtrusion;
		 GeomAdaptor_SurfaceOfLinearExtrusion(const opencascade::handle<Adaptor3d_Curve> & C, const gp_Dir & V);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::AxeOfRevolution ******/
		/****** md5 signature: ba4a8d5fbd6cead47ee1b295e5469d5d ******/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
No available documentation.
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::BSpline ******/
		/****** md5 signature: 7edfedec29b3e090d1dbb1c560f9218f ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
No available documentation.
") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::BasisCurve ******/
		/****** md5 signature: 3da13dd15bd6f8a74a4a076b13266260 ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") BasisCurve;
		opencascade::handle<Adaptor3d_Curve> BasisCurve();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::Bezier ******/
		/****** md5 signature: 98b7293dc91af28a1a57c0bfbd1e467a ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierSurface>

Description
-----------
No available documentation.
") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::Cone ******/
		/****** md5 signature: 3ce87f79e83a129f74e88ef746e3e34b ******/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "Return
-------
gp_Cone

Description
-----------
No available documentation.
") Cone;
		gp_Cone Cone();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::Cylinder ******/
		/****** md5 signature: fdc0e133b47b8d299b834e1b65638963 ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "Return
-------
gp_Cylinder

Description
-----------
No available documentation.
") Cylinder;
		gp_Cylinder Cylinder();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::Direction ******/
		/****** md5 signature: 701909e88752dfbf540944de6bad9f3a ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		gp_Dir Direction();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::FirstUParameter ******/
		/****** md5 signature: 62341804d7e1ffc3de87fae2bf43b512 ******/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstUParameter;
		Standard_Real FirstUParameter();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::FirstVParameter ******/
		/****** md5 signature: 982af8f353fd309c87f6c3698af95089 ******/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstVParameter;
		Standard_Real FirstVParameter();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::GetType ******/
		/****** md5 signature: 96aa962fbb94c2c631f870283212b1d3 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_SurfaceType

Description
-----------
Returns the type of the surface: plane, cylinder, cone, sphere, torus, beziersurface, bsplinesurface, surfaceofrevolution, surfaceofextrusion, othersurface.
") GetType;
		GeomAbs_SurfaceType GetType();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::IsUClosed ******/
		/****** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::IsUPeriodic ******/
		/****** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::IsURational ******/
		/****** md5 signature: 503a5a81658ea54283ba1b83fd4c4159 ******/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsURational;
		Standard_Boolean IsURational();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::IsVClosed ******/
		/****** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::IsVPeriodic ******/
		/****** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::IsVRational ******/
		/****** md5 signature: 43ab877f92028162dd9780a1e61ecdd7 ******/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVRational;
		Standard_Boolean IsVRational();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::LastUParameter ******/
		/****** md5 signature: 1d079dee0cfc1756347bcb2471c5c822 ******/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastUParameter;
		Standard_Real LastUParameter();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::LastVParameter ******/
		/****** md5 signature: 2b4acdfbc345aaeedbb1d34eef2873f2 ******/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastVParameter;
		Standard_Real LastVParameter();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::Load ******/
		/****** md5 signature: 01185c022b32d6c381a2144e2963295b ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
Changes the curve.
") Load;
		void Load(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::Load ******/
		/****** md5 signature: 62bf4c300fca896dad63b0ed0af0b96a ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
V: gp_Dir

Return
-------
None

Description
-----------
Changes the direction.
") Load;
		void Load(const gp_Dir & V);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::NbUIntervals ******/
		/****** md5 signature: 36290e0c805f559fce0d4de0d4d51789 ******/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of u intervals for continuity <s>. may be one if ucontinuity(me) >= <s>.
") NbUIntervals;
		Standard_Integer NbUIntervals(const GeomAbs_Shape S);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::NbUPoles ******/
		/****** md5 signature: 5c5f4e3c3fe024076b4fb29a46558ec0 ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUPoles;
		Standard_Integer NbUPoles();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::NbVIntervals ******/
		/****** md5 signature: 1386a357acacae70889de04788135ce2 ******/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of v intervals for continuity <s>. may be one if vcontinuity(me) >= <s>.
") NbVIntervals;
		Standard_Integer NbVIntervals(const GeomAbs_Shape S);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::Plane ******/
		/****** md5 signature: 38bd3e56cdca70a78cd998154292a430 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
gp_Pln

Description
-----------
No available documentation.
") Plane;
		gp_Pln Plane();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::ShallowCopy ******/
		/****** md5 signature: 0f1e5e5cc4137678a63b6cdf38f07462 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		virtual opencascade::handle<Adaptor3d_Surface> ShallowCopy();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::Sphere ******/
		/****** md5 signature: d13f3935ec312564a2f8ef1b299ecf9a ******/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "Return
-------
gp_Sphere

Description
-----------
No available documentation.
") Sphere;
		gp_Sphere Sphere();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::Torus ******/
		/****** md5 signature: 13ce946397b0f1bcfd3f38f215bbadac ******/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "Return
-------
gp_Torus

Description
-----------
No available documentation.
") Torus;
		gp_Torus Torus();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::UContinuity ******/
		/****** md5 signature: 734a4ef77d0d03bc93d92e10bda465e4 ******/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") UContinuity;
		GeomAbs_Shape UContinuity();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::UDegree ******/
		/****** md5 signature: fe5d6f101c0706d20343b36865ccf566 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		Standard_Integer UDegree();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::UIntervals ******/
		/****** md5 signature: 5a653f364681c4a5c1065b7e92c5d659 ******/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Returns the intervals with the requested continuity in the u direction.
") UIntervals;
		void UIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::UPeriod ******/
		/****** md5 signature: a3dec1a81b623affa1d3ea1e9e49c97e ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") UPeriod;
		Standard_Real UPeriod();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::UResolution ******/
		/****** md5 signature: 449c7efbd4cbc4136589973c1bc1500b ******/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "
Parameters
----------
R3d: float

Return
-------
float

Description
-----------
Returns the parametric u resolution corresponding to the real space resolution <r3d>.
") UResolution;
		Standard_Real UResolution(const Standard_Real R3d);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::UTrim ******/
		/****** md5 signature: 3604326125cf753b2a6722a946fb54be ******/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns a surface trimmed in the u direction equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.
") UTrim;
		opencascade::handle<Adaptor3d_Surface> UTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::VContinuity ******/
		/****** md5 signature: 147ea173efc6a600ed241c35c98936ea ******/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Return cn.
") VContinuity;
		GeomAbs_Shape VContinuity();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::VIntervals ******/
		/****** md5 signature: bf8bef8286fec18f81beea299dd5cb6d ******/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Returns the intervals with the requested continuity in the v direction.
") VIntervals;
		void VIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::VPeriod ******/
		/****** md5 signature: e6f079a3e4e62dbf708e1ce56dfd23b6 ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") VPeriod;
		Standard_Real VPeriod();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::VResolution ******/
		/****** md5 signature: a2dfdb6521f339dcde6811097088d560 ******/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "
Parameters
----------
R3d: float

Return
-------
float

Description
-----------
Returns the parametric v resolution corresponding to the real space resolution <r3d>.
") VResolution;
		Standard_Real VResolution(const Standard_Real R3d);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::VTrim ******/
		/****** md5 signature: d094345261a4439c6edc98b200ea4e3d ******/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns a surface trimmed in the v direction between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.
") VTrim;
		opencascade::handle<Adaptor3d_Surface> VTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

};


%make_alias(GeomAdaptor_SurfaceOfLinearExtrusion)

%extend GeomAdaptor_SurfaceOfLinearExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class GeomAdaptor_SurfaceOfRevolution *
****************************************/
class GeomAdaptor_SurfaceOfRevolution : public GeomAdaptor_Surface {
	public:
		/****** GeomAdaptor_SurfaceOfRevolution::GeomAdaptor_SurfaceOfRevolution ******/
		/****** md5 signature: 7714658d5b11638666c740dfc82e9020 ******/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfRevolution;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomAdaptor_SurfaceOfRevolution;
		 GeomAdaptor_SurfaceOfRevolution();

		/****** GeomAdaptor_SurfaceOfRevolution::GeomAdaptor_SurfaceOfRevolution ******/
		/****** md5 signature: 33135053ae058233a68d69faed20e511 ******/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfRevolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
The curve is loaded.
") GeomAdaptor_SurfaceOfRevolution;
		 GeomAdaptor_SurfaceOfRevolution(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomAdaptor_SurfaceOfRevolution::GeomAdaptor_SurfaceOfRevolution ******/
		/****** md5 signature: 5fe135ade63c133d688341669e4f605a ******/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfRevolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
V: gp_Ax1

Return
-------
None

Description
-----------
The curve and the direction are loaded.
") GeomAdaptor_SurfaceOfRevolution;
		 GeomAdaptor_SurfaceOfRevolution(const opencascade::handle<Adaptor3d_Curve> & C, const gp_Ax1 & V);

		/****** GeomAdaptor_SurfaceOfRevolution::AxeOfRevolution ******/
		/****** md5 signature: ba4a8d5fbd6cead47ee1b295e5469d5d ******/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
No available documentation.
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution();

		/****** GeomAdaptor_SurfaceOfRevolution::Axis ******/
		/****** md5 signature: 5eb12dfbd1523dca9fb2e75633562b4c ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
No available documentation.
") Axis;
		const gp_Ax3 Axis();

		/****** GeomAdaptor_SurfaceOfRevolution::BSpline ******/
		/****** md5 signature: 7edfedec29b3e090d1dbb1c560f9218f ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
No available documentation.
") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline();

		/****** GeomAdaptor_SurfaceOfRevolution::BasisCurve ******/
		/****** md5 signature: 3da13dd15bd6f8a74a4a076b13266260 ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") BasisCurve;
		opencascade::handle<Adaptor3d_Curve> BasisCurve();

		/****** GeomAdaptor_SurfaceOfRevolution::Bezier ******/
		/****** md5 signature: 98b7293dc91af28a1a57c0bfbd1e467a ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierSurface>

Description
-----------
No available documentation.
") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier();

		/****** GeomAdaptor_SurfaceOfRevolution::Cone ******/
		/****** md5 signature: 3ce87f79e83a129f74e88ef746e3e34b ******/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "Return
-------
gp_Cone

Description
-----------
Apex of the cone = cone.position().location() ==> referenceradius = 0.
") Cone;
		gp_Cone Cone();

		/****** GeomAdaptor_SurfaceOfRevolution::Cylinder ******/
		/****** md5 signature: fdc0e133b47b8d299b834e1b65638963 ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "Return
-------
gp_Cylinder

Description
-----------
No available documentation.
") Cylinder;
		gp_Cylinder Cylinder();

		/****** GeomAdaptor_SurfaceOfRevolution::FirstUParameter ******/
		/****** md5 signature: 62341804d7e1ffc3de87fae2bf43b512 ******/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstUParameter;
		Standard_Real FirstUParameter();

		/****** GeomAdaptor_SurfaceOfRevolution::FirstVParameter ******/
		/****** md5 signature: 982af8f353fd309c87f6c3698af95089 ******/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstVParameter;
		Standard_Real FirstVParameter();

		/****** GeomAdaptor_SurfaceOfRevolution::GetType ******/
		/****** md5 signature: 96aa962fbb94c2c631f870283212b1d3 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_SurfaceType

Description
-----------
Returns the type of the surface: plane, cylinder, cone, sphere, torus, beziersurface, bsplinesurface, surfaceofrevolution, surfaceofextrusion, othersurface.
") GetType;
		GeomAbs_SurfaceType GetType();

		/****** GeomAdaptor_SurfaceOfRevolution::IsUClosed ******/
		/****** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****** GeomAdaptor_SurfaceOfRevolution::IsUPeriodic ******/
		/****** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****** GeomAdaptor_SurfaceOfRevolution::IsURational ******/
		/****** md5 signature: 503a5a81658ea54283ba1b83fd4c4159 ******/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsURational;
		Standard_Boolean IsURational();

		/****** GeomAdaptor_SurfaceOfRevolution::IsVClosed ******/
		/****** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** GeomAdaptor_SurfaceOfRevolution::IsVPeriodic ******/
		/****** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****** GeomAdaptor_SurfaceOfRevolution::IsVRational ******/
		/****** md5 signature: 43ab877f92028162dd9780a1e61ecdd7 ******/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVRational;
		Standard_Boolean IsVRational();

		/****** GeomAdaptor_SurfaceOfRevolution::LastUParameter ******/
		/****** md5 signature: 1d079dee0cfc1756347bcb2471c5c822 ******/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastUParameter;
		Standard_Real LastUParameter();

		/****** GeomAdaptor_SurfaceOfRevolution::LastVParameter ******/
		/****** md5 signature: 2b4acdfbc345aaeedbb1d34eef2873f2 ******/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastVParameter;
		Standard_Real LastVParameter();

		/****** GeomAdaptor_SurfaceOfRevolution::Load ******/
		/****** md5 signature: 01185c022b32d6c381a2144e2963295b ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
Changes the curve.
") Load;
		void Load(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomAdaptor_SurfaceOfRevolution::Load ******/
		/****** md5 signature: 4064dc62b92d8ef68aed2949a77022a0 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
V: gp_Ax1

Return
-------
None

Description
-----------
Changes the direction.
") Load;
		void Load(const gp_Ax1 & V);

		/****** GeomAdaptor_SurfaceOfRevolution::NbUIntervals ******/
		/****** md5 signature: 36290e0c805f559fce0d4de0d4d51789 ******/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of u intervals for continuity <s>. may be one if ucontinuity(me) >= <s>.
") NbUIntervals;
		Standard_Integer NbUIntervals(const GeomAbs_Shape S);

		/****** GeomAdaptor_SurfaceOfRevolution::NbVIntervals ******/
		/****** md5 signature: 1386a357acacae70889de04788135ce2 ******/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of v intervals for continuity <s>. may be one if vcontinuity(me) >= <s>.
") NbVIntervals;
		Standard_Integer NbVIntervals(const GeomAbs_Shape S);

		/****** GeomAdaptor_SurfaceOfRevolution::NbVKnots ******/
		/****** md5 signature: b1cd06ae6e3ff5f29ab4140934f12d0a ******/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVKnots;
		Standard_Integer NbVKnots();

		/****** GeomAdaptor_SurfaceOfRevolution::NbVPoles ******/
		/****** md5 signature: d1321a0d34d7aaceadde41cd3444173f ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVPoles;
		Standard_Integer NbVPoles();

		/****** GeomAdaptor_SurfaceOfRevolution::Plane ******/
		/****** md5 signature: 38bd3e56cdca70a78cd998154292a430 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
gp_Pln

Description
-----------
No available documentation.
") Plane;
		gp_Pln Plane();

		/****** GeomAdaptor_SurfaceOfRevolution::ShallowCopy ******/
		/****** md5 signature: 0f1e5e5cc4137678a63b6cdf38f07462 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		virtual opencascade::handle<Adaptor3d_Surface> ShallowCopy();

		/****** GeomAdaptor_SurfaceOfRevolution::Sphere ******/
		/****** md5 signature: d13f3935ec312564a2f8ef1b299ecf9a ******/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "Return
-------
gp_Sphere

Description
-----------
No available documentation.
") Sphere;
		gp_Sphere Sphere();

		/****** GeomAdaptor_SurfaceOfRevolution::Torus ******/
		/****** md5 signature: 13ce946397b0f1bcfd3f38f215bbadac ******/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "Return
-------
gp_Torus

Description
-----------
No available documentation.
") Torus;
		gp_Torus Torus();

		/****** GeomAdaptor_SurfaceOfRevolution::UContinuity ******/
		/****** md5 signature: 734a4ef77d0d03bc93d92e10bda465e4 ******/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") UContinuity;
		GeomAbs_Shape UContinuity();

		/****** GeomAdaptor_SurfaceOfRevolution::UIntervals ******/
		/****** md5 signature: 5a653f364681c4a5c1065b7e92c5d659 ******/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Returns the intervals with the requested continuity in the u direction.
") UIntervals;
		void UIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomAdaptor_SurfaceOfRevolution::UPeriod ******/
		/****** md5 signature: a3dec1a81b623affa1d3ea1e9e49c97e ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") UPeriod;
		Standard_Real UPeriod();

		/****** GeomAdaptor_SurfaceOfRevolution::UResolution ******/
		/****** md5 signature: 449c7efbd4cbc4136589973c1bc1500b ******/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "
Parameters
----------
R3d: float

Return
-------
float

Description
-----------
Returns the parametric u resolution corresponding to the real space resolution <r3d>.
") UResolution;
		Standard_Real UResolution(const Standard_Real R3d);

		/****** GeomAdaptor_SurfaceOfRevolution::UTrim ******/
		/****** md5 signature: 3604326125cf753b2a6722a946fb54be ******/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns a surface trimmed in the u direction equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.
") UTrim;
		opencascade::handle<Adaptor3d_Surface> UTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** GeomAdaptor_SurfaceOfRevolution::VContinuity ******/
		/****** md5 signature: 147ea173efc6a600ed241c35c98936ea ******/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Return cn.
") VContinuity;
		GeomAbs_Shape VContinuity();

		/****** GeomAdaptor_SurfaceOfRevolution::VDegree ******/
		/****** md5 signature: b7875d48d80bf8a6fde9c47500038fd4 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		Standard_Integer VDegree();

		/****** GeomAdaptor_SurfaceOfRevolution::VIntervals ******/
		/****** md5 signature: bf8bef8286fec18f81beea299dd5cb6d ******/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Returns the intervals with the requested continuity in the v direction.
") VIntervals;
		void VIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomAdaptor_SurfaceOfRevolution::VPeriod ******/
		/****** md5 signature: e6f079a3e4e62dbf708e1ce56dfd23b6 ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") VPeriod;
		Standard_Real VPeriod();

		/****** GeomAdaptor_SurfaceOfRevolution::VResolution ******/
		/****** md5 signature: a2dfdb6521f339dcde6811097088d560 ******/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "
Parameters
----------
R3d: float

Return
-------
float

Description
-----------
Returns the parametric v resolution corresponding to the real space resolution <r3d>.
") VResolution;
		Standard_Real VResolution(const Standard_Real R3d);

		/****** GeomAdaptor_SurfaceOfRevolution::VTrim ******/
		/****** md5 signature: d094345261a4439c6edc98b200ea4e3d ******/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns a surface trimmed in the v direction between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.
") VTrim;
		opencascade::handle<Adaptor3d_Surface> VTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

};


%make_alias(GeomAdaptor_SurfaceOfRevolution)

%extend GeomAdaptor_SurfaceOfRevolution {
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
def geomadaptor_MakeCurve(*args):
	return geomadaptor.MakeCurve(*args)

@deprecated
def geomadaptor_MakeSurface(*args):
	return geomadaptor.MakeSurface(*args)

}
