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
%define GEOMADAPTORDOCSTRING
"GeomAdaptor module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geomadaptor.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(GeomAdaptor_GHCurve)
%wrap_handle(GeomAdaptor_GHSurface)
%wrap_handle(GeomAdaptor_HSurfaceOfLinearExtrusion)
%wrap_handle(GeomAdaptor_HSurfaceOfRevolution)
%wrap_handle(GeomAdaptor_HCurve)
%wrap_handle(GeomAdaptor_HSurface)
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
		/****************** MakeCurve ******************/
		/**** md5 signature: b2a0867e843655f110e2f5dd5ef19022 ****/
		%feature("compactdefaultargs") MakeCurve;
		%feature("autodoc", "Inherited from ghcurve. provides a curve handled by reference. build a geom_curve using the informations from the curve from adaptor3d.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
opencascade::handle<Geom_Curve>
") MakeCurve;
		static opencascade::handle<Geom_Curve> MakeCurve(const Adaptor3d_Curve & C);

		/****************** MakeSurface ******************/
		/**** md5 signature: e2d97ddab298fadfa35fcf5d3da46eb5 ****/
		%feature("compactdefaultargs") MakeSurface;
		%feature("autodoc", "Build a geom_surface using the informations from the surface from adaptor3d @param thes - surface adaptor to convert. @param thetrimflag - true if perform trim surface values by adaptor and false otherwise.

Parameters
----------
theS: Adaptor3d_Surface
theTrimFlag: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Geom_Surface>
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
		/****************** GeomAdaptor_Curve ******************/
		/**** md5 signature: 2e3639f153333a8265adcebe4a8aaee3 ****/
		%feature("compactdefaultargs") GeomAdaptor_Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomAdaptor_Curve;
		 GeomAdaptor_Curve();

		/****************** GeomAdaptor_Curve ******************/
		/**** md5 signature: 1cf8518026dc83d09b39472a54f58c4c ****/
		%feature("compactdefaultargs") GeomAdaptor_Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve

Returns
-------
None
") GeomAdaptor_Curve;
		 GeomAdaptor_Curve(const opencascade::handle<Geom_Curve> & C);

		/****************** GeomAdaptor_Curve ******************/
		/**** md5 signature: ecf089bdf6152ef66a45b9ee30f39cb5 ****/
		%feature("compactdefaultargs") GeomAdaptor_Curve;
		%feature("autodoc", "Constructionerror is raised if ufirst>ulast.

Parameters
----------
C: Geom_Curve
UFirst: float
ULast: float

Returns
-------
None
") GeomAdaptor_Curve;
		 GeomAdaptor_Curve(const opencascade::handle<Geom_Curve> & C, const Standard_Real UFirst, const Standard_Real ULast);

		/****************** BSpline ******************/
		/**** md5 signature: 3ccc0d851302bffb5de6344e3eb3e58d ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "This will not make a copy of the bspline curve : if you want to modify the curve please make a copy yourself also it will not trim the surface to myfirst/last.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		/**** md5 signature: 092280fc6ee0e7104fbbe3460d73e83c ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "This will not make a copy of the bezier curve : if you want to modify the curve please make a copy yourself also it will not trim the surface to myfirst/last.

Returns
-------
opencascade::handle<Geom_BezierCurve>
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****************** Circle ******************/
		/**** md5 signature: 5f382e7a6af009845ea6e16d54814298 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle();

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Curve ******************/
		/**** md5 signature: 976a03829ec92d091e0b58dd7f58e869 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Provides a curve inherited from hcurve from adaptor. this is inherited to provide easy to use constructors.

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****************** D0 ******************/
		/**** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: 1dc830ec49a945a61cde5e5c027b78d7 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. //! warning : on the specific case of bsplinecurve: if the curve is cut in interval of continuity at least c1, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve.

Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** D2 ******************/
		/**** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. //! warning : on the specific case of bsplinecurve: if the curve is cut in interval of continuity at least c2, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		/**** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. //! warning : on the specific case of bsplinecurve: if the curve is cut in interval of continuity at least c3, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		/**** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. warning : on the specific case of bsplinecurve: if the curve is cut in interval of continuity cn, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve. raised if n < 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: 5ce473e72cc7bb935a667f4c839dab09 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "This should never make a copy of the underlying curve to read the relevant information.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** Ellipse ******************/
		/**** md5 signature: e9a77f14e9bbca29370202de404ea9c1 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips
") Ellipse;
		gp_Elips Ellipse();

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetType ******************/
		/**** md5 signature: 0ad61dcbb5497908c1b536e766f0fcb9 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		/**** md5 signature: a96ca49b2ad017b35bb09d0b86cb690d ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola();

		/****************** Intervals ******************/
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "This should never make a copy of the underlying curve to read the relevant information.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Line ******************/
		/**** md5 signature: cf28f5541e4e744dd8038e2a9ac75a8f ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") Line;
		gp_Lin Line();

		/****************** Load ******************/
		/**** md5 signature: 899eefc9d66620ea5d2dc41c69ab5bc1 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Geom_Curve> & C);

		/****************** Load ******************/
		/**** md5 signature: d8ca48df01d7825d5d8f75cada300511 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Constructionerror is raised if ufirst>ulast.

Parameters
----------
C: Geom_Curve
UFirst: float
ULast: float

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Geom_Curve> & C, const Standard_Real UFirst, const Standard_Real ULast);

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		/**** md5 signature: 841663cbf96bec3b939f307c52df6c7c ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "This should never make a copy of the underlying curve to read the relevant information.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		/**** md5 signature: 52e5fadf897540545847ef59cc0ba942 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "This should never make a copy of the underlying curve to read the relevant information.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** OffsetCurve ******************/
		/**** md5 signature: c9712770a031ed315e762ca33ff3eddd ****/
		%feature("compactdefaultargs") OffsetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_OffsetCurve>
") OffsetCurve;
		opencascade::handle<Geom_OffsetCurve> OffsetCurve();

		/****************** Parabola ******************/
		/**** md5 signature: 68860abab63fd184ea5c7eb97f0762c1 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab
") Parabola;
		gp_Parab Parabola();

		/****************** Period ******************/
		/**** md5 signature: 88909a321398632744c0d6841580c626 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** Reset ******************/
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Reset currently loaded curve (undone load()).

Returns
-------
None
") Reset;
		void Reset();

		/****************** Resolution ******************/
		/**** md5 signature: cc4a4d9111fadd20ad48e62bc4df1579 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution.

Parameters
----------
R3d: float

Returns
-------
float
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****************** Trim ******************/
		/**** md5 signature: 113944489c8ce9efcb5cb2d44fff51d7 ****/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a curve equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") Trim;
		opencascade::handle<Adaptor3d_HCurve> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: d7f310c73762cbaa285ace0a141bc7bf ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real U);

};


%extend GeomAdaptor_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomAdaptor_GHCurve *
****************************/
class GeomAdaptor_GHCurve : public Adaptor3d_HCurve {
	public:
		/****************** GeomAdaptor_GHCurve ******************/
		/**** md5 signature: 66df95bfdb5af02bb57cff21584ceac1 ****/
		%feature("compactdefaultargs") GeomAdaptor_GHCurve;
		%feature("autodoc", "Creates an empty genhcurve.

Returns
-------
None
") GeomAdaptor_GHCurve;
		 GeomAdaptor_GHCurve();

		/****************** GeomAdaptor_GHCurve ******************/
		/**** md5 signature: a7b31df0246ff5de418101f37544ca21 ****/
		%feature("compactdefaultargs") GeomAdaptor_GHCurve;
		%feature("autodoc", "Creates a genhcurve from a curve.

Parameters
----------
C: GeomAdaptor_Curve

Returns
-------
None
") GeomAdaptor_GHCurve;
		 GeomAdaptor_GHCurve(const GeomAdaptor_Curve & C);

		/****************** ChangeCurve ******************/
		/**** md5 signature: 56ba926d853c1f7e3f37e0d13025a6d9 ****/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
GeomAdaptor_Curve
") ChangeCurve;
		GeomAdaptor_Curve & ChangeCurve();

		/****************** Curve ******************/
		/**** md5 signature: a89f0959dbb9c3c030843720c3636148 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the curve used to create the genhcurve. this is redefined from hcurve, cannot be inline.

Returns
-------
Adaptor3d_Curve
") Curve;
		const Adaptor3d_Curve & Curve();

		/****************** GetCurve ******************/
		/**** md5 signature: 73b397b3522011e6948956523664e20c ****/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Returns the curve used to create the genhcurve. this is redefined from hcurve, cannot be inline.

Returns
-------
Adaptor3d_Curve
") GetCurve;
		Adaptor3d_Curve & GetCurve();

		/****************** Set ******************/
		/**** md5 signature: 364f648c603a50c8ec85f59fb2e2db78 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the field of the genhcurve.

Parameters
----------
C: GeomAdaptor_Curve

Returns
-------
None
") Set;
		void Set(const GeomAdaptor_Curve & C);

};


%make_alias(GeomAdaptor_GHCurve)

%extend GeomAdaptor_GHCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomAdaptor_GHSurface *
******************************/
class GeomAdaptor_GHSurface : public Adaptor3d_HSurface {
	public:
		/****************** GeomAdaptor_GHSurface ******************/
		/**** md5 signature: 1f20037030cf86b14b3f31a0835aa53d ****/
		%feature("compactdefaultargs") GeomAdaptor_GHSurface;
		%feature("autodoc", "Creates an empty genhsurface.

Returns
-------
None
") GeomAdaptor_GHSurface;
		 GeomAdaptor_GHSurface();

		/****************** GeomAdaptor_GHSurface ******************/
		/**** md5 signature: aaa0ec5b0bd11c34dd24dc2d97071a39 ****/
		%feature("compactdefaultargs") GeomAdaptor_GHSurface;
		%feature("autodoc", "Creates a genhsurface from a surface.

Parameters
----------
S: GeomAdaptor_Surface

Returns
-------
None
") GeomAdaptor_GHSurface;
		 GeomAdaptor_GHSurface(const GeomAdaptor_Surface & S);

		/****************** ChangeSurface ******************/
		/**** md5 signature: ead718e69fe53e8fd677c1b9c64ff5a3 ****/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "Returns the surface used to create the genhsurface.

Returns
-------
GeomAdaptor_Surface
") ChangeSurface;
		GeomAdaptor_Surface & ChangeSurface();

		/****************** Set ******************/
		/**** md5 signature: fa7596577a6a4647ffbc512e7051e359 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the field of the genhsurface.

Parameters
----------
S: GeomAdaptor_Surface

Returns
-------
None
") Set;
		void Set(const GeomAdaptor_Surface & S);

		/****************** Surface ******************/
		/**** md5 signature: 87b43b57a8dc79c19df787e8ef796cad ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns a reference to the surface inside the hsurface. this is redefined from hsurface, cannot be inline.

Returns
-------
Adaptor3d_Surface
") Surface;
		const Adaptor3d_Surface & Surface();

};


%make_alias(GeomAdaptor_GHSurface)

%extend GeomAdaptor_GHSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class GeomAdaptor_HSurfaceOfLinearExtrusion *
**********************************************/
class GeomAdaptor_HSurfaceOfLinearExtrusion : public Adaptor3d_HSurface {
	public:
		/****************** GeomAdaptor_HSurfaceOfLinearExtrusion ******************/
		/**** md5 signature: 29c21f93981f5a9e384e8c2e7e8ccbfd ****/
		%feature("compactdefaultargs") GeomAdaptor_HSurfaceOfLinearExtrusion;
		%feature("autodoc", "Creates an empty genhsurface.

Returns
-------
None
") GeomAdaptor_HSurfaceOfLinearExtrusion;
		 GeomAdaptor_HSurfaceOfLinearExtrusion();

		/****************** GeomAdaptor_HSurfaceOfLinearExtrusion ******************/
		/**** md5 signature: 3fc98513baf1a28f33c8f95e1425a7c7 ****/
		%feature("compactdefaultargs") GeomAdaptor_HSurfaceOfLinearExtrusion;
		%feature("autodoc", "Creates a genhsurface from a surface.

Parameters
----------
S: GeomAdaptor_SurfaceOfLinearExtrusion

Returns
-------
None
") GeomAdaptor_HSurfaceOfLinearExtrusion;
		 GeomAdaptor_HSurfaceOfLinearExtrusion(const GeomAdaptor_SurfaceOfLinearExtrusion & S);

		/****************** ChangeSurface ******************/
		/**** md5 signature: 88f6234b60f7b94be962df5f60d9c3bb ****/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "Returns the surface used to create the genhsurface.

Returns
-------
GeomAdaptor_SurfaceOfLinearExtrusion
") ChangeSurface;
		GeomAdaptor_SurfaceOfLinearExtrusion & ChangeSurface();

		/****************** Set ******************/
		/**** md5 signature: a47de1aa7f251202af0223a81a688836 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the field of the genhsurface.

Parameters
----------
S: GeomAdaptor_SurfaceOfLinearExtrusion

Returns
-------
None
") Set;
		void Set(const GeomAdaptor_SurfaceOfLinearExtrusion & S);

		/****************** Surface ******************/
		/**** md5 signature: 87b43b57a8dc79c19df787e8ef796cad ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns a reference to the surface inside the hsurface. this is redefined from hsurface, cannot be inline.

Returns
-------
Adaptor3d_Surface
") Surface;
		const Adaptor3d_Surface & Surface();

};


%make_alias(GeomAdaptor_HSurfaceOfLinearExtrusion)

%extend GeomAdaptor_HSurfaceOfLinearExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class GeomAdaptor_HSurfaceOfRevolution *
*****************************************/
class GeomAdaptor_HSurfaceOfRevolution : public Adaptor3d_HSurface {
	public:
		/****************** GeomAdaptor_HSurfaceOfRevolution ******************/
		/**** md5 signature: 2b25fa58fed2cfb834be68dbae4fd6a9 ****/
		%feature("compactdefaultargs") GeomAdaptor_HSurfaceOfRevolution;
		%feature("autodoc", "Creates an empty genhsurface.

Returns
-------
None
") GeomAdaptor_HSurfaceOfRevolution;
		 GeomAdaptor_HSurfaceOfRevolution();

		/****************** GeomAdaptor_HSurfaceOfRevolution ******************/
		/**** md5 signature: cf0bba20d36d67f32e6dc52e0a69aa68 ****/
		%feature("compactdefaultargs") GeomAdaptor_HSurfaceOfRevolution;
		%feature("autodoc", "Creates a genhsurface from a surface.

Parameters
----------
S: GeomAdaptor_SurfaceOfRevolution

Returns
-------
None
") GeomAdaptor_HSurfaceOfRevolution;
		 GeomAdaptor_HSurfaceOfRevolution(const GeomAdaptor_SurfaceOfRevolution & S);

		/****************** ChangeSurface ******************/
		/**** md5 signature: e08ac869ef99885c0dc21e7ab1f36098 ****/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "Returns the surface used to create the genhsurface.

Returns
-------
GeomAdaptor_SurfaceOfRevolution
") ChangeSurface;
		GeomAdaptor_SurfaceOfRevolution & ChangeSurface();

		/****************** Set ******************/
		/**** md5 signature: 4b0b3067c9317fc23cf46f719a7594fd ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the field of the genhsurface.

Parameters
----------
S: GeomAdaptor_SurfaceOfRevolution

Returns
-------
None
") Set;
		void Set(const GeomAdaptor_SurfaceOfRevolution & S);

		/****************** Surface ******************/
		/**** md5 signature: 87b43b57a8dc79c19df787e8ef796cad ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns a reference to the surface inside the hsurface. this is redefined from hsurface, cannot be inline.

Returns
-------
Adaptor3d_Surface
") Surface;
		const Adaptor3d_Surface & Surface();

};


%make_alias(GeomAdaptor_HSurfaceOfRevolution)

%extend GeomAdaptor_HSurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomAdaptor_Surface *
****************************/
class GeomAdaptor_Surface : public Adaptor3d_Surface {
	public:
		/****************** GeomAdaptor_Surface ******************/
		/**** md5 signature: 21ab546b646fdc58756459205ecf38d7 ****/
		%feature("compactdefaultargs") GeomAdaptor_Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomAdaptor_Surface;
		 GeomAdaptor_Surface();

		/****************** GeomAdaptor_Surface ******************/
		/**** md5 signature: 60491b015be1a7a3c5e273da96f802bc ****/
		%feature("compactdefaultargs") GeomAdaptor_Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Surface

Returns
-------
None
") GeomAdaptor_Surface;
		 GeomAdaptor_Surface(const opencascade::handle<Geom_Surface> & S);

		/****************** GeomAdaptor_Surface ******************/
		/**** md5 signature: 4d2cb33c30cf8f5255802589a9e34500 ****/
		%feature("compactdefaultargs") GeomAdaptor_Surface;
		%feature("autodoc", "Constructionerror is raised if ufirst>ulast or vfirst>vlast.

Parameters
----------
S: Geom_Surface
UFirst: float
ULast: float
VFirst: float
VLast: float
TolU: float,optional
	default value is 0.0
TolV: float,optional
	default value is 0.0

Returns
-------
None
") GeomAdaptor_Surface;
		 GeomAdaptor_Surface(const opencascade::handle<Geom_Surface> & S, const Standard_Real UFirst, const Standard_Real ULast, const Standard_Real VFirst, const Standard_Real VLast, const Standard_Real TolU = 0.0, const Standard_Real TolV = 0.0);

		/****************** AxeOfRevolution ******************/
		/**** md5 signature: ba4a8d5fbd6cead47ee1b295e5469d5d ****/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Ax1
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution();

		/****************** BSpline ******************/
		/**** md5 signature: 7edfedec29b3e090d1dbb1c560f9218f ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "This will not make a copy of the bspline surface : if you want to modify the surface please make a copy yourself also it will not trim the surface to myu/vfirst/last.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline();

		/****************** BasisCurve ******************/
		/**** md5 signature: 649d212d15fc34b20cfbf05abf61b226 ****/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") BasisCurve;
		opencascade::handle<Adaptor3d_HCurve> BasisCurve();

		/****************** BasisSurface ******************/
		/**** md5 signature: 421ea038c6d9bcc3b023d9c1239bea84 ****/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") BasisSurface;
		opencascade::handle<Adaptor3d_HSurface> BasisSurface();

		/****************** Bezier ******************/
		/**** md5 signature: 98b7293dc91af28a1a57c0bfbd1e467a ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "This will not make a copy of the bezier surface : if you want to modify the surface please make a copy yourself also it will not trim the surface to myu/vfirst/last.

Returns
-------
opencascade::handle<Geom_BezierSurface>
") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier();

		/****************** Cone ******************/
		/**** md5 signature: 3ce87f79e83a129f74e88ef746e3e34b ****/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cone
") Cone;
		gp_Cone Cone();

		/****************** Cylinder ******************/
		/**** md5 signature: fdc0e133b47b8d299b834e1b65638963 ****/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder();

		/****************** D0 ******************/
		/**** md5 signature: 909f7ecc223d561155c9c3ba4b8e7b64 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameters u,v on the surface.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: 0868b105367e01c443402a5728aa3395 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point and the first derivatives on the surface. //! warning : on the specific case of bsplinesurface: if the surface is cut in interval of continuity at least c1, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		/**** md5 signature: 5bdb029d3f1561c55d7ab1d1b0b0282a ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the point, the first and second derivatives on the surface. //! warning : on the specific case of bsplinesurface: if the surface is cut in interval of continuity at least c2, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface.

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

Returns
-------
None
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		/**** md5 signature: 2fbd4d1b6bb5f19034b05b5a6e0ddec0 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes the point, the first, second and third derivatives on the surface. //! warning : on the specific case of bsplinesurface: if the surface is cut in interval of continuity at least c3, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface.

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

Returns
-------
None
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		/**** md5 signature: 78200f5fa5a4060f4022c2e3d9d8ac0e ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Computes the derivative of order nu in the direction u and nv in the direction v at the point p(u, v). //! warning : on the specific case of bsplinesurface: if the surface is cut in interval of continuity cn, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface. raised if nu + nv < 1 or nu < 0 or nv < 0.

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** Direction ******************/
		/**** md5 signature: 701909e88752dfbf540944de6bad9f3a ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") Direction;
		gp_Dir Direction();

		/****************** FirstUParameter ******************/
		/**** md5 signature: 62341804d7e1ffc3de87fae2bf43b512 ****/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstUParameter;
		Standard_Real FirstUParameter();

		/****************** FirstVParameter ******************/
		/**** md5 signature: 982af8f353fd309c87f6c3698af95089 ****/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstVParameter;
		Standard_Real FirstVParameter();

		/****************** GetType ******************/
		/**** md5 signature: 96aa962fbb94c2c631f870283212b1d3 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the surface : plane, cylinder, cone, sphere, torus, beziersurface, bsplinesurface, surfaceofrevolution, surfaceofextrusion, othersurface.

Returns
-------
GeomAbs_SurfaceType
") GetType;
		GeomAbs_SurfaceType GetType();

		/****************** IsUClosed ******************/
		/**** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ****/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		/**** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ****/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsURational ******************/
		/**** md5 signature: 503a5a81658ea54283ba1b83fd4c4159 ****/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsURational;
		Standard_Boolean IsURational();

		/****************** IsVClosed ******************/
		/**** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ****/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		/**** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ****/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** IsVRational ******************/
		/**** md5 signature: 43ab877f92028162dd9780a1e61ecdd7 ****/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVRational;
		Standard_Boolean IsVRational();

		/****************** LastUParameter ******************/
		/**** md5 signature: 1d079dee0cfc1756347bcb2471c5c822 ****/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastUParameter;
		Standard_Real LastUParameter();

		/****************** LastVParameter ******************/
		/**** md5 signature: 2b4acdfbc345aaeedbb1d34eef2873f2 ****/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastVParameter;
		Standard_Real LastVParameter();

		/****************** Load ******************/
		/**** md5 signature: d0b9098abc9bc3f25b7f5df94bc1cfa0 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Surface

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Geom_Surface> & S);

		/****************** Load ******************/
		/**** md5 signature: 44185344f9f3393fe225f4f93b554724 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Constructionerror is raised if ufirst>ulast or vfirst>vlast.

Parameters
----------
S: Geom_Surface
UFirst: float
ULast: float
VFirst: float
VLast: float
TolU: float,optional
	default value is 0.0
TolV: float,optional
	default value is 0.0

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Geom_Surface> & S, const Standard_Real UFirst, const Standard_Real ULast, const Standard_Real VFirst, const Standard_Real VLast, const Standard_Real TolU = 0.0, const Standard_Real TolV = 0.0);

		/****************** NbUIntervals ******************/
		/**** md5 signature: 36290e0c805f559fce0d4de0d4d51789 ****/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "Returns the number of u intervals for continuity <s>. may be one if ucontinuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbUIntervals;
		Standard_Integer NbUIntervals(const GeomAbs_Shape S);

		/****************** NbUKnots ******************/
		/**** md5 signature: b3d8ce13e5341877d4ffaaf0b52ec603 ****/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbUKnots;
		Standard_Integer NbUKnots();

		/****************** NbUPoles ******************/
		/**** md5 signature: 5c5f4e3c3fe024076b4fb29a46558ec0 ****/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbUPoles;
		Standard_Integer NbUPoles();

		/****************** NbVIntervals ******************/
		/**** md5 signature: 1386a357acacae70889de04788135ce2 ****/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "Returns the number of v intervals for continuity <s>. may be one if vcontinuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbVIntervals;
		Standard_Integer NbVIntervals(const GeomAbs_Shape S);

		/****************** NbVKnots ******************/
		/**** md5 signature: b1cd06ae6e3ff5f29ab4140934f12d0a ****/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVKnots;
		Standard_Integer NbVKnots();

		/****************** NbVPoles ******************/
		/**** md5 signature: d1321a0d34d7aaceadde41cd3444173f ****/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVPoles;
		Standard_Integer NbVPoles();

		/****************** OffsetValue ******************/
		/**** md5 signature: ae23f5f41fc62b65137ff41b8ee27c47 ****/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") OffsetValue;
		Standard_Real OffsetValue();

		/****************** Plane ******************/
		/**** md5 signature: 38bd3e56cdca70a78cd998154292a430 ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pln
") Plane;
		gp_Pln Plane();

		/****************** Sphere ******************/
		/**** md5 signature: d13f3935ec312564a2f8ef1b299ecf9a ****/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Sphere
") Sphere;
		gp_Sphere Sphere();

		/****************** Surface ******************/
		/**** md5 signature: a469e18cbceeb351572a461f96ff0f4d ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

		/****************** Torus ******************/
		/**** md5 signature: 13ce946397b0f1bcfd3f38f215bbadac ****/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Torus
") Torus;
		gp_Torus Torus();

		/****************** UContinuity ******************/
		/**** md5 signature: 734a4ef77d0d03bc93d92e10bda465e4 ****/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") UContinuity;
		GeomAbs_Shape UContinuity();

		/****************** UDegree ******************/
		/**** md5 signature: fe5d6f101c0706d20343b36865ccf566 ****/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** UIntervals ******************/
		/**** md5 signature: 5a653f364681c4a5c1065b7e92c5d659 ****/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "Returns the intervals with the requested continuity in the u direction.

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") UIntervals;
		void UIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** UPeriod ******************/
		/**** md5 signature: a3dec1a81b623affa1d3ea1e9e49c97e ****/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") UPeriod;
		Standard_Real UPeriod();

		/****************** UResolution ******************/
		/**** md5 signature: 449c7efbd4cbc4136589973c1bc1500b ****/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "Returns the parametric u resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") UResolution;
		Standard_Real UResolution(const Standard_Real R3d);

		/****************** UTrim ******************/
		/**** md5 signature: 2f1effe4b247d770d76c6bb7e909f894 ****/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "Returns a surface trimmed in the u direction equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") UTrim;
		opencascade::handle<Adaptor3d_HSurface> UTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** VContinuity ******************/
		/**** md5 signature: 147ea173efc6a600ed241c35c98936ea ****/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") VContinuity;
		GeomAbs_Shape VContinuity();

		/****************** VDegree ******************/
		/**** md5 signature: b7875d48d80bf8a6fde9c47500038fd4 ****/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VDegree;
		Standard_Integer VDegree();

		/****************** VIntervals ******************/
		/**** md5 signature: bf8bef8286fec18f81beea299dd5cb6d ****/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "Returns the intervals with the requested continuity in the v direction.

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") VIntervals;
		void VIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** VPeriod ******************/
		/**** md5 signature: e6f079a3e4e62dbf708e1ce56dfd23b6 ****/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") VPeriod;
		Standard_Real VPeriod();

		/****************** VResolution ******************/
		/**** md5 signature: a2dfdb6521f339dcde6811097088d560 ****/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "Returns the parametric v resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") VResolution;
		Standard_Real VResolution(const Standard_Real R3d);

		/****************** VTrim ******************/
		/**** md5 signature: acb52a48cbc4aa80908911477b02f7f4 ****/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "Returns a surface trimmed in the v direction between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") VTrim;
		opencascade::handle<Adaptor3d_HSurface> VTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: bc01a119296408176c75cc0dfb0636ae ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameters u,v on the surface.

Parameters
----------
U: float
V: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real U, const Standard_Real V);

};


%extend GeomAdaptor_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GeomAdaptor_HCurve *
***************************/
class GeomAdaptor_HCurve : public GeomAdaptor_GHCurve {
	public:
		/****************** GeomAdaptor_HCurve ******************/
		/**** md5 signature: dcb8b3078ce766051e9b0d1fd01109c9 ****/
		%feature("compactdefaultargs") GeomAdaptor_HCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve();

		/****************** GeomAdaptor_HCurve ******************/
		/**** md5 signature: 2cc1b5bdee121aaef79597be486db881 ****/
		%feature("compactdefaultargs") GeomAdaptor_HCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
AS: GeomAdaptor_Curve

Returns
-------
None
") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve(const GeomAdaptor_Curve & AS);

		/****************** GeomAdaptor_HCurve ******************/
		/**** md5 signature: 16638445fd6ef9090e72a296a1b36f15 ****/
		%feature("compactdefaultargs") GeomAdaptor_HCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Curve

Returns
-------
None
") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve(const opencascade::handle<Geom_Curve> & S);

		/****************** GeomAdaptor_HCurve ******************/
		/**** md5 signature: c424d26828bf38d6da26c4e5dc5e5cc5 ****/
		%feature("compactdefaultargs") GeomAdaptor_HCurve;
		%feature("autodoc", "Constructionerror is raised if ufirst>ulast or vfirst>vlast.

Parameters
----------
S: Geom_Curve
UFirst: float
ULast: float

Returns
-------
None
") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve(const opencascade::handle<Geom_Curve> & S, const Standard_Real UFirst, const Standard_Real ULast);

};


%make_alias(GeomAdaptor_HCurve)

%extend GeomAdaptor_HCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomAdaptor_HSurface *
*****************************/
class GeomAdaptor_HSurface : public GeomAdaptor_GHSurface {
	public:
		/****************** GeomAdaptor_HSurface ******************/
		/**** md5 signature: d0a5881b3295693d6a0cec0575104ca5 ****/
		%feature("compactdefaultargs") GeomAdaptor_HSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface();

		/****************** GeomAdaptor_HSurface ******************/
		/**** md5 signature: a8d76e380bea089f3cedb726bec0876e ****/
		%feature("compactdefaultargs") GeomAdaptor_HSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
AS: GeomAdaptor_Surface

Returns
-------
None
") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface(const GeomAdaptor_Surface & AS);

		/****************** GeomAdaptor_HSurface ******************/
		/**** md5 signature: 8b911ff5dd9b2d885482b29fbc85d279 ****/
		%feature("compactdefaultargs") GeomAdaptor_HSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Surface

Returns
-------
None
") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface(const opencascade::handle<Geom_Surface> & S);

		/****************** GeomAdaptor_HSurface ******************/
		/**** md5 signature: 96e2719c9293ae2c2e0f4c80cca57fd1 ****/
		%feature("compactdefaultargs") GeomAdaptor_HSurface;
		%feature("autodoc", "Constructionerror is raised if ufirst>ulast or vfirst>vlast.

Parameters
----------
S: Geom_Surface
UFirst: float
ULast: float
VFirst: float
VLast: float
TolU: float,optional
	default value is 0.0
TolV: float,optional
	default value is 0.0

Returns
-------
None
") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface(const opencascade::handle<Geom_Surface> & S, const Standard_Real UFirst, const Standard_Real ULast, const Standard_Real VFirst, const Standard_Real VLast, const Standard_Real TolU = 0.0, const Standard_Real TolV = 0.0);

};


%make_alias(GeomAdaptor_HSurface)

%extend GeomAdaptor_HSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class GeomAdaptor_SurfaceOfLinearExtrusion *
*********************************************/
class GeomAdaptor_SurfaceOfLinearExtrusion : public GeomAdaptor_Surface {
	public:
		/****************** GeomAdaptor_SurfaceOfLinearExtrusion ******************/
		/**** md5 signature: 4d6f4e5730660e62b31b9569c8638275 ****/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfLinearExtrusion;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomAdaptor_SurfaceOfLinearExtrusion;
		 GeomAdaptor_SurfaceOfLinearExtrusion();

		/****************** GeomAdaptor_SurfaceOfLinearExtrusion ******************/
		/**** md5 signature: 4c65062dd46aedac697341c979041789 ****/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfLinearExtrusion;
		%feature("autodoc", "The curve is loaded.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
None
") GeomAdaptor_SurfaceOfLinearExtrusion;
		 GeomAdaptor_SurfaceOfLinearExtrusion(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** GeomAdaptor_SurfaceOfLinearExtrusion ******************/
		/**** md5 signature: 1aeea78225d0ffee9431607880f2bd98 ****/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfLinearExtrusion;
		%feature("autodoc", "Thew curve and the direction are loaded.

Parameters
----------
C: Adaptor3d_HCurve
V: gp_Dir

Returns
-------
None
") GeomAdaptor_SurfaceOfLinearExtrusion;
		 GeomAdaptor_SurfaceOfLinearExtrusion(const opencascade::handle<Adaptor3d_HCurve> & C, const gp_Dir & V);

		/****************** AxeOfRevolution ******************/
		/**** md5 signature: ba4a8d5fbd6cead47ee1b295e5469d5d ****/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Ax1
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution();

		/****************** BSpline ******************/
		/**** md5 signature: 7edfedec29b3e090d1dbb1c560f9218f ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline();

		/****************** BasisCurve ******************/
		/**** md5 signature: 649d212d15fc34b20cfbf05abf61b226 ****/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") BasisCurve;
		opencascade::handle<Adaptor3d_HCurve> BasisCurve();

		/****************** Bezier ******************/
		/**** md5 signature: 98b7293dc91af28a1a57c0bfbd1e467a ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BezierSurface>
") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier();

		/****************** Cone ******************/
		/**** md5 signature: 3ce87f79e83a129f74e88ef746e3e34b ****/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cone
") Cone;
		gp_Cone Cone();

		/****************** Cylinder ******************/
		/**** md5 signature: fdc0e133b47b8d299b834e1b65638963 ****/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder();

		/****************** Direction ******************/
		/**** md5 signature: 701909e88752dfbf540944de6bad9f3a ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") Direction;
		gp_Dir Direction();

		/****************** FirstUParameter ******************/
		/**** md5 signature: 62341804d7e1ffc3de87fae2bf43b512 ****/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstUParameter;
		Standard_Real FirstUParameter();

		/****************** FirstVParameter ******************/
		/**** md5 signature: 982af8f353fd309c87f6c3698af95089 ****/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstVParameter;
		Standard_Real FirstVParameter();

		/****************** GetType ******************/
		/**** md5 signature: 96aa962fbb94c2c631f870283212b1d3 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the surface : plane, cylinder, cone, sphere, torus, beziersurface, bsplinesurface, surfaceofrevolution, surfaceofextrusion, othersurface.

Returns
-------
GeomAbs_SurfaceType
") GetType;
		GeomAbs_SurfaceType GetType();

		/****************** IsUClosed ******************/
		/**** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ****/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		/**** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ****/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsURational ******************/
		/**** md5 signature: 503a5a81658ea54283ba1b83fd4c4159 ****/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsURational;
		Standard_Boolean IsURational();

		/****************** IsVClosed ******************/
		/**** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ****/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		/**** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ****/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** IsVRational ******************/
		/**** md5 signature: 43ab877f92028162dd9780a1e61ecdd7 ****/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVRational;
		Standard_Boolean IsVRational();

		/****************** LastUParameter ******************/
		/**** md5 signature: 1d079dee0cfc1756347bcb2471c5c822 ****/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastUParameter;
		Standard_Real LastUParameter();

		/****************** LastVParameter ******************/
		/**** md5 signature: 2b4acdfbc345aaeedbb1d34eef2873f2 ****/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastVParameter;
		Standard_Real LastVParameter();

		/****************** Load ******************/
		/**** md5 signature: 7ec2d3d2173b0cd6b7f2097ff67dfa81 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Changes the curve.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Load ******************/
		/**** md5 signature: 62bf4c300fca896dad63b0ed0af0b96a ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Changes the direction.

Parameters
----------
V: gp_Dir

Returns
-------
None
") Load;
		void Load(const gp_Dir & V);

		/****************** NbUIntervals ******************/
		/**** md5 signature: 36290e0c805f559fce0d4de0d4d51789 ****/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "Returns the number of u intervals for continuity <s>. may be one if ucontinuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbUIntervals;
		Standard_Integer NbUIntervals(const GeomAbs_Shape S);

		/****************** NbUPoles ******************/
		/**** md5 signature: 5c5f4e3c3fe024076b4fb29a46558ec0 ****/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbUPoles;
		Standard_Integer NbUPoles();

		/****************** NbVIntervals ******************/
		/**** md5 signature: 1386a357acacae70889de04788135ce2 ****/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "Returns the number of v intervals for continuity <s>. may be one if vcontinuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbVIntervals;
		Standard_Integer NbVIntervals(const GeomAbs_Shape S);

		/****************** Plane ******************/
		/**** md5 signature: 38bd3e56cdca70a78cd998154292a430 ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pln
") Plane;
		gp_Pln Plane();

		/****************** Sphere ******************/
		/**** md5 signature: d13f3935ec312564a2f8ef1b299ecf9a ****/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Sphere
") Sphere;
		gp_Sphere Sphere();

		/****************** Torus ******************/
		/**** md5 signature: 13ce946397b0f1bcfd3f38f215bbadac ****/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Torus
") Torus;
		gp_Torus Torus();

		/****************** UContinuity ******************/
		/**** md5 signature: 734a4ef77d0d03bc93d92e10bda465e4 ****/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") UContinuity;
		GeomAbs_Shape UContinuity();

		/****************** UDegree ******************/
		/**** md5 signature: fe5d6f101c0706d20343b36865ccf566 ****/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** UIntervals ******************/
		/**** md5 signature: 5a653f364681c4a5c1065b7e92c5d659 ****/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "Returns the intervals with the requested continuity in the u direction.

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") UIntervals;
		void UIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** UPeriod ******************/
		/**** md5 signature: a3dec1a81b623affa1d3ea1e9e49c97e ****/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") UPeriod;
		Standard_Real UPeriod();

		/****************** UResolution ******************/
		/**** md5 signature: 449c7efbd4cbc4136589973c1bc1500b ****/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "Returns the parametric u resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") UResolution;
		Standard_Real UResolution(const Standard_Real R3d);

		/****************** UTrim ******************/
		/**** md5 signature: 2f1effe4b247d770d76c6bb7e909f894 ****/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "Returns a surface trimmed in the u direction equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") UTrim;
		opencascade::handle<Adaptor3d_HSurface> UTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** VContinuity ******************/
		/**** md5 signature: 147ea173efc6a600ed241c35c98936ea ****/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "Return cn.

Returns
-------
GeomAbs_Shape
") VContinuity;
		GeomAbs_Shape VContinuity();

		/****************** VIntervals ******************/
		/**** md5 signature: bf8bef8286fec18f81beea299dd5cb6d ****/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "Returns the intervals with the requested continuity in the v direction.

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") VIntervals;
		void VIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** VPeriod ******************/
		/**** md5 signature: e6f079a3e4e62dbf708e1ce56dfd23b6 ****/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") VPeriod;
		Standard_Real VPeriod();

		/****************** VResolution ******************/
		/**** md5 signature: a2dfdb6521f339dcde6811097088d560 ****/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "Returns the parametric v resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") VResolution;
		Standard_Real VResolution(const Standard_Real R3d);

		/****************** VTrim ******************/
		/**** md5 signature: acb52a48cbc4aa80908911477b02f7f4 ****/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "Returns a surface trimmed in the v direction between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") VTrim;
		opencascade::handle<Adaptor3d_HSurface> VTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

};


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
		/****************** GeomAdaptor_SurfaceOfRevolution ******************/
		/**** md5 signature: 7714658d5b11638666c740dfc82e9020 ****/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfRevolution;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomAdaptor_SurfaceOfRevolution;
		 GeomAdaptor_SurfaceOfRevolution();

		/****************** GeomAdaptor_SurfaceOfRevolution ******************/
		/**** md5 signature: bf5d6561180f2d31f1a5a85f0a6318bf ****/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfRevolution;
		%feature("autodoc", "The curve is loaded.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
None
") GeomAdaptor_SurfaceOfRevolution;
		 GeomAdaptor_SurfaceOfRevolution(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** GeomAdaptor_SurfaceOfRevolution ******************/
		/**** md5 signature: 47a0cec0a7bf1264c273ea0232ea616e ****/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfRevolution;
		%feature("autodoc", "The curve and the direction are loaded.

Parameters
----------
C: Adaptor3d_HCurve
V: gp_Ax1

Returns
-------
None
") GeomAdaptor_SurfaceOfRevolution;
		 GeomAdaptor_SurfaceOfRevolution(const opencascade::handle<Adaptor3d_HCurve> & C, const gp_Ax1 & V);

		/****************** AxeOfRevolution ******************/
		/**** md5 signature: ba4a8d5fbd6cead47ee1b295e5469d5d ****/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Ax1
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution();

		/****************** Axis ******************/
		/**** md5 signature: 5eb12dfbd1523dca9fb2e75633562b4c ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Ax3
") Axis;
		const gp_Ax3 Axis();

		/****************** BSpline ******************/
		/**** md5 signature: 7edfedec29b3e090d1dbb1c560f9218f ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline();

		/****************** BasisCurve ******************/
		/**** md5 signature: 649d212d15fc34b20cfbf05abf61b226 ****/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") BasisCurve;
		opencascade::handle<Adaptor3d_HCurve> BasisCurve();

		/****************** Bezier ******************/
		/**** md5 signature: 98b7293dc91af28a1a57c0bfbd1e467a ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BezierSurface>
") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier();

		/****************** Cone ******************/
		/**** md5 signature: 3ce87f79e83a129f74e88ef746e3e34b ****/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "Apex of the cone = cone.position().location() ==> referenceradius = 0.

Returns
-------
gp_Cone
") Cone;
		gp_Cone Cone();

		/****************** Cylinder ******************/
		/**** md5 signature: fdc0e133b47b8d299b834e1b65638963 ****/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder();

		/****************** FirstUParameter ******************/
		/**** md5 signature: 62341804d7e1ffc3de87fae2bf43b512 ****/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstUParameter;
		Standard_Real FirstUParameter();

		/****************** FirstVParameter ******************/
		/**** md5 signature: 982af8f353fd309c87f6c3698af95089 ****/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstVParameter;
		Standard_Real FirstVParameter();

		/****************** GetType ******************/
		/**** md5 signature: 96aa962fbb94c2c631f870283212b1d3 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the surface : plane, cylinder, cone, sphere, torus, beziersurface, bsplinesurface, surfaceofrevolution, surfaceofextrusion, othersurface.

Returns
-------
GeomAbs_SurfaceType
") GetType;
		GeomAbs_SurfaceType GetType();

		/****************** IsUClosed ******************/
		/**** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ****/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		/**** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ****/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsURational ******************/
		/**** md5 signature: 503a5a81658ea54283ba1b83fd4c4159 ****/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsURational;
		Standard_Boolean IsURational();

		/****************** IsVClosed ******************/
		/**** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ****/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		/**** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ****/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** IsVRational ******************/
		/**** md5 signature: 43ab877f92028162dd9780a1e61ecdd7 ****/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVRational;
		Standard_Boolean IsVRational();

		/****************** LastUParameter ******************/
		/**** md5 signature: 1d079dee0cfc1756347bcb2471c5c822 ****/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastUParameter;
		Standard_Real LastUParameter();

		/****************** LastVParameter ******************/
		/**** md5 signature: 2b4acdfbc345aaeedbb1d34eef2873f2 ****/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastVParameter;
		Standard_Real LastVParameter();

		/****************** Load ******************/
		/**** md5 signature: 7ec2d3d2173b0cd6b7f2097ff67dfa81 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Changes the curve.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Load ******************/
		/**** md5 signature: 4064dc62b92d8ef68aed2949a77022a0 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Changes the direction.

Parameters
----------
V: gp_Ax1

Returns
-------
None
") Load;
		void Load(const gp_Ax1 & V);

		/****************** NbUIntervals ******************/
		/**** md5 signature: 36290e0c805f559fce0d4de0d4d51789 ****/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "Returns the number of u intervals for continuity <s>. may be one if ucontinuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbUIntervals;
		Standard_Integer NbUIntervals(const GeomAbs_Shape S);

		/****************** NbVIntervals ******************/
		/**** md5 signature: 1386a357acacae70889de04788135ce2 ****/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "Returns the number of v intervals for continuity <s>. may be one if vcontinuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbVIntervals;
		Standard_Integer NbVIntervals(const GeomAbs_Shape S);

		/****************** NbVKnots ******************/
		/**** md5 signature: b1cd06ae6e3ff5f29ab4140934f12d0a ****/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVKnots;
		Standard_Integer NbVKnots();

		/****************** NbVPoles ******************/
		/**** md5 signature: d1321a0d34d7aaceadde41cd3444173f ****/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVPoles;
		Standard_Integer NbVPoles();

		/****************** Plane ******************/
		/**** md5 signature: 38bd3e56cdca70a78cd998154292a430 ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pln
") Plane;
		gp_Pln Plane();

		/****************** Sphere ******************/
		/**** md5 signature: d13f3935ec312564a2f8ef1b299ecf9a ****/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Sphere
") Sphere;
		gp_Sphere Sphere();

		/****************** Torus ******************/
		/**** md5 signature: 13ce946397b0f1bcfd3f38f215bbadac ****/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Torus
") Torus;
		gp_Torus Torus();

		/****************** UContinuity ******************/
		/**** md5 signature: 734a4ef77d0d03bc93d92e10bda465e4 ****/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") UContinuity;
		GeomAbs_Shape UContinuity();

		/****************** UIntervals ******************/
		/**** md5 signature: 5a653f364681c4a5c1065b7e92c5d659 ****/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "Returns the intervals with the requested continuity in the u direction.

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") UIntervals;
		void UIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** UPeriod ******************/
		/**** md5 signature: a3dec1a81b623affa1d3ea1e9e49c97e ****/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") UPeriod;
		Standard_Real UPeriod();

		/****************** UResolution ******************/
		/**** md5 signature: 449c7efbd4cbc4136589973c1bc1500b ****/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "Returns the parametric u resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") UResolution;
		Standard_Real UResolution(const Standard_Real R3d);

		/****************** UTrim ******************/
		/**** md5 signature: 2f1effe4b247d770d76c6bb7e909f894 ****/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "Returns a surface trimmed in the u direction equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") UTrim;
		opencascade::handle<Adaptor3d_HSurface> UTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** VContinuity ******************/
		/**** md5 signature: 147ea173efc6a600ed241c35c98936ea ****/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "Return cn.

Returns
-------
GeomAbs_Shape
") VContinuity;
		GeomAbs_Shape VContinuity();

		/****************** VDegree ******************/
		/**** md5 signature: b7875d48d80bf8a6fde9c47500038fd4 ****/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VDegree;
		Standard_Integer VDegree();

		/****************** VIntervals ******************/
		/**** md5 signature: bf8bef8286fec18f81beea299dd5cb6d ****/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "Returns the intervals with the requested continuity in the v direction.

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") VIntervals;
		void VIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** VPeriod ******************/
		/**** md5 signature: e6f079a3e4e62dbf708e1ce56dfd23b6 ****/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") VPeriod;
		Standard_Real VPeriod();

		/****************** VResolution ******************/
		/**** md5 signature: a2dfdb6521f339dcde6811097088d560 ****/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "Returns the parametric v resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") VResolution;
		Standard_Real VResolution(const Standard_Real R3d);

		/****************** VTrim ******************/
		/**** md5 signature: acb52a48cbc4aa80908911477b02f7f4 ****/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "Returns a surface trimmed in the v direction between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") VTrim;
		opencascade::handle<Adaptor3d_HSurface> VTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

};


%extend GeomAdaptor_SurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
