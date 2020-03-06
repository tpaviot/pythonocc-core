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
		%feature("compactdefaultargs") GeomAdaptor_Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomAdaptor_Curve;
		 GeomAdaptor_Curve();

		/****************** GeomAdaptor_Curve ******************/
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
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "This will not make a copy of the bspline curve : if you want to modify the curve please make a copy yourself also it will not trim the surface to myfirst/last.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "This will not make a copy of the bezier curve : if you want to modify the curve please make a copy yourself also it will not trim the surface to myfirst/last.

Returns
-------
opencascade::handle<Geom_BezierCurve>
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Provides a curve inherited from hcurve from adaptor. this is inherited to provide easy to use constructors.

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****************** D0 ******************/
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
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "This should never make a copy of the underlying curve to read the relevant information.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips
") Ellipse;
		gp_Elips Ellipse();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola();

		/****************** Intervals ******************/
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
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "This should never make a copy of the underlying curve to read the relevant information.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") Line;
		gp_Lin Line();

		/****************** Load ******************/
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
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "This should never make a copy of the underlying curve to read the relevant information.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "This should never make a copy of the underlying curve to read the relevant information.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** OffsetCurve ******************/
		%feature("compactdefaultargs") OffsetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_OffsetCurve>
") OffsetCurve;
		opencascade::handle<Geom_OffsetCurve> OffsetCurve();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab
") Parabola;
		gp_Parab Parabola();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Reset currently loaded curve (undone load()).

Returns
-------
None
") Reset;
		void Reset();

		/****************** Resolution ******************/
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
		%feature("compactdefaultargs") GeomAdaptor_GHCurve;
		%feature("autodoc", "Creates an empty genhcurve.

Returns
-------
None
") GeomAdaptor_GHCurve;
		 GeomAdaptor_GHCurve();

		/****************** GeomAdaptor_GHCurve ******************/
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
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
GeomAdaptor_Curve
") ChangeCurve;
		GeomAdaptor_Curve & ChangeCurve();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the curve used to create the genhcurve. this is redefined from hcurve, cannot be inline.

Returns
-------
Adaptor3d_Curve
") Curve;
		const Adaptor3d_Curve & Curve();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Returns the curve used to create the genhcurve. this is redefined from hcurve, cannot be inline.

Returns
-------
Adaptor3d_Curve
") GetCurve;
		Adaptor3d_Curve & GetCurve();

		/****************** Set ******************/
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
		%feature("compactdefaultargs") GeomAdaptor_GHSurface;
		%feature("autodoc", "Creates an empty genhsurface.

Returns
-------
None
") GeomAdaptor_GHSurface;
		 GeomAdaptor_GHSurface();

		/****************** GeomAdaptor_GHSurface ******************/
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
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "Returns the surface used to create the genhsurface.

Returns
-------
GeomAdaptor_Surface
") ChangeSurface;
		GeomAdaptor_Surface & ChangeSurface();

		/****************** Set ******************/
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
		%feature("compactdefaultargs") GeomAdaptor_HSurfaceOfLinearExtrusion;
		%feature("autodoc", "Creates an empty genhsurface.

Returns
-------
None
") GeomAdaptor_HSurfaceOfLinearExtrusion;
		 GeomAdaptor_HSurfaceOfLinearExtrusion();

		/****************** GeomAdaptor_HSurfaceOfLinearExtrusion ******************/
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
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "Returns the surface used to create the genhsurface.

Returns
-------
GeomAdaptor_SurfaceOfLinearExtrusion
") ChangeSurface;
		GeomAdaptor_SurfaceOfLinearExtrusion & ChangeSurface();

		/****************** Set ******************/
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
		%feature("compactdefaultargs") GeomAdaptor_HSurfaceOfRevolution;
		%feature("autodoc", "Creates an empty genhsurface.

Returns
-------
None
") GeomAdaptor_HSurfaceOfRevolution;
		 GeomAdaptor_HSurfaceOfRevolution();

		/****************** GeomAdaptor_HSurfaceOfRevolution ******************/
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
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "Returns the surface used to create the genhsurface.

Returns
-------
GeomAdaptor_SurfaceOfRevolution
") ChangeSurface;
		GeomAdaptor_SurfaceOfRevolution & ChangeSurface();

		/****************** Set ******************/
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
		%feature("compactdefaultargs") GeomAdaptor_Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomAdaptor_Surface;
		 GeomAdaptor_Surface();

		/****************** GeomAdaptor_Surface ******************/
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
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Ax1
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution();

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "This will not make a copy of the bspline surface : if you want to modify the surface please make a copy yourself also it will not trim the surface to myu/vfirst/last.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline();

		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") BasisCurve;
		opencascade::handle<Adaptor3d_HCurve> BasisCurve();

		/****************** BasisSurface ******************/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") BasisSurface;
		opencascade::handle<Adaptor3d_HSurface> BasisSurface();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "This will not make a copy of the bezier surface : if you want to modify the surface please make a copy yourself also it will not trim the surface to myu/vfirst/last.

Returns
-------
opencascade::handle<Geom_BezierSurface>
") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier();

		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cone
") Cone;
		gp_Cone Cone();

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder();

		/****************** D0 ******************/
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
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") Direction;
		gp_Dir Direction();

		/****************** FirstUParameter ******************/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstUParameter;
		Standard_Real FirstUParameter();

		/****************** FirstVParameter ******************/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstVParameter;
		Standard_Real FirstVParameter();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the surface : plane, cylinder, cone, sphere, torus, beziersurface, bsplinesurface, surfaceofrevolution, surfaceofextrusion, othersurface.

Returns
-------
GeomAbs_SurfaceType
") GetType;
		GeomAbs_SurfaceType GetType();

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsURational ******************/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsURational;
		Standard_Boolean IsURational();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** IsVRational ******************/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVRational;
		Standard_Boolean IsVRational();

		/****************** LastUParameter ******************/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastUParameter;
		Standard_Real LastUParameter();

		/****************** LastVParameter ******************/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastVParameter;
		Standard_Real LastVParameter();

		/****************** Load ******************/
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
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbUKnots;
		Standard_Integer NbUKnots();

		/****************** NbUPoles ******************/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbUPoles;
		Standard_Integer NbUPoles();

		/****************** NbVIntervals ******************/
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
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVKnots;
		Standard_Integer NbVKnots();

		/****************** NbVPoles ******************/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVPoles;
		Standard_Integer NbVPoles();

		/****************** OffsetValue ******************/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") OffsetValue;
		Standard_Real OffsetValue();

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pln
") Plane;
		gp_Pln Plane();

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Sphere
") Sphere;
		gp_Sphere Sphere();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Torus
") Torus;
		gp_Torus Torus();

		/****************** UContinuity ******************/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") UContinuity;
		GeomAbs_Shape UContinuity();

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** UIntervals ******************/
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
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") UPeriod;
		Standard_Real UPeriod();

		/****************** UResolution ******************/
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
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") VContinuity;
		GeomAbs_Shape VContinuity();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VDegree;
		Standard_Integer VDegree();

		/****************** VIntervals ******************/
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
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") VPeriod;
		Standard_Real VPeriod();

		/****************** VResolution ******************/
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
		%feature("compactdefaultargs") GeomAdaptor_HCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve();

		/****************** GeomAdaptor_HCurve ******************/
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
		%feature("compactdefaultargs") GeomAdaptor_HSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface();

		/****************** GeomAdaptor_HSurface ******************/
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
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfLinearExtrusion;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomAdaptor_SurfaceOfLinearExtrusion;
		 GeomAdaptor_SurfaceOfLinearExtrusion();

		/****************** GeomAdaptor_SurfaceOfLinearExtrusion ******************/
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
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Ax1
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution();

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline();

		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") BasisCurve;
		opencascade::handle<Adaptor3d_HCurve> BasisCurve();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BezierSurface>
") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier();

		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cone
") Cone;
		gp_Cone Cone();

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") Direction;
		gp_Dir Direction();

		/****************** FirstUParameter ******************/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstUParameter;
		Standard_Real FirstUParameter();

		/****************** FirstVParameter ******************/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstVParameter;
		Standard_Real FirstVParameter();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the surface : plane, cylinder, cone, sphere, torus, beziersurface, bsplinesurface, surfaceofrevolution, surfaceofextrusion, othersurface.

Returns
-------
GeomAbs_SurfaceType
") GetType;
		GeomAbs_SurfaceType GetType();

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsURational ******************/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsURational;
		Standard_Boolean IsURational();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** IsVRational ******************/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVRational;
		Standard_Boolean IsVRational();

		/****************** LastUParameter ******************/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastUParameter;
		Standard_Real LastUParameter();

		/****************** LastVParameter ******************/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastVParameter;
		Standard_Real LastVParameter();

		/****************** Load ******************/
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
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbUPoles;
		Standard_Integer NbUPoles();

		/****************** NbVIntervals ******************/
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
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pln
") Plane;
		gp_Pln Plane();

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Sphere
") Sphere;
		gp_Sphere Sphere();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Torus
") Torus;
		gp_Torus Torus();

		/****************** UContinuity ******************/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") UContinuity;
		GeomAbs_Shape UContinuity();

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** UIntervals ******************/
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
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") UPeriod;
		Standard_Real UPeriod();

		/****************** UResolution ******************/
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
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "Return cn.

Returns
-------
GeomAbs_Shape
") VContinuity;
		GeomAbs_Shape VContinuity();

		/****************** VIntervals ******************/
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
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") VPeriod;
		Standard_Real VPeriod();

		/****************** VResolution ******************/
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
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfRevolution;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomAdaptor_SurfaceOfRevolution;
		 GeomAdaptor_SurfaceOfRevolution();

		/****************** GeomAdaptor_SurfaceOfRevolution ******************/
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
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Ax1
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Ax3
") Axis;
		const gp_Ax3 Axis();

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline();

		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") BasisCurve;
		opencascade::handle<Adaptor3d_HCurve> BasisCurve();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BezierSurface>
") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier();

		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "Apex of the cone = cone.position().location() ==> referenceradius = 0.

Returns
-------
gp_Cone
") Cone;
		gp_Cone Cone();

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder();

		/****************** FirstUParameter ******************/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstUParameter;
		Standard_Real FirstUParameter();

		/****************** FirstVParameter ******************/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstVParameter;
		Standard_Real FirstVParameter();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the surface : plane, cylinder, cone, sphere, torus, beziersurface, bsplinesurface, surfaceofrevolution, surfaceofextrusion, othersurface.

Returns
-------
GeomAbs_SurfaceType
") GetType;
		GeomAbs_SurfaceType GetType();

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsURational ******************/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsURational;
		Standard_Boolean IsURational();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** IsVRational ******************/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVRational;
		Standard_Boolean IsVRational();

		/****************** LastUParameter ******************/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastUParameter;
		Standard_Real LastUParameter();

		/****************** LastVParameter ******************/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastVParameter;
		Standard_Real LastVParameter();

		/****************** Load ******************/
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
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVKnots;
		Standard_Integer NbVKnots();

		/****************** NbVPoles ******************/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVPoles;
		Standard_Integer NbVPoles();

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pln
") Plane;
		gp_Pln Plane();

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Sphere
") Sphere;
		gp_Sphere Sphere();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Torus
") Torus;
		gp_Torus Torus();

		/****************** UContinuity ******************/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") UContinuity;
		GeomAbs_Shape UContinuity();

		/****************** UIntervals ******************/
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
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") UPeriod;
		Standard_Real UPeriod();

		/****************** UResolution ******************/
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
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "Return cn.

Returns
-------
GeomAbs_Shape
") VContinuity;
		GeomAbs_Shape VContinuity();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VDegree;
		Standard_Integer VDegree();

		/****************** VIntervals ******************/
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
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") VPeriod;
		Standard_Real VPeriod();

		/****************** VResolution ******************/
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
