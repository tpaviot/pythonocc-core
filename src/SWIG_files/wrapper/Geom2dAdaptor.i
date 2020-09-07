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
%define GEOM2DADAPTORDOCSTRING
"Geom2dAdaptor module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geom2dadaptor.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DADAPTORDOCSTRING) Geom2dAdaptor


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
#include<Geom2dAdaptor_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor2d.i
%import Geom2d.i
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
%wrap_handle(Geom2dAdaptor_GHCurve)
%wrap_handle(Geom2dAdaptor_HCurve)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**********************
* class Geom2dAdaptor *
**********************/
%rename(geom2dadaptor) Geom2dAdaptor;
class Geom2dAdaptor {
	public:
		/****************** MakeCurve ******************/
		/**** md5 signature: c72e8d90e9cff395d1b9d0b5bc484109 ****/
		%feature("compactdefaultargs") MakeCurve;
		%feature("autodoc", "Inherited from ghcurve. provides a curve handled by reference. creates a 2d curve from a hcurve2d. this cannot process the othercurves.

Parameters
----------
HC: Adaptor2d_Curve2d

Returns
-------
opencascade::handle<Geom2d_Curve>
") MakeCurve;
		static opencascade::handle<Geom2d_Curve> MakeCurve(const Adaptor2d_Curve2d & HC);

};


%extend Geom2dAdaptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom2dAdaptor_Curve *
****************************/
class Geom2dAdaptor_Curve : public Adaptor2d_Curve2d {
	public:
		/****************** Geom2dAdaptor_Curve ******************/
		/**** md5 signature: 2791dbc26639b96186559159a2815b29 ****/
		%feature("compactdefaultargs") Geom2dAdaptor_Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve();

		/****************** Geom2dAdaptor_Curve ******************/
		/**** md5 signature: e0e393202c576f2801d7e2429a622a66 ****/
		%feature("compactdefaultargs") Geom2dAdaptor_Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Geom2dAdaptor_Curve ******************/
		/**** md5 signature: 68f15594f006f79ed7f5d7313c319ebe ****/
		%feature("compactdefaultargs") Geom2dAdaptor_Curve;
		%feature("autodoc", "Constructionerror is raised if ufirst>ulast.

Parameters
----------
C: Geom2d_Curve
UFirst: float
ULast: float

Returns
-------
None
") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real UFirst, const Standard_Real ULast);

		/****************** BSpline ******************/
		/**** md5 signature: 9439c331c4f14f299277aa5a4ff16cec ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		/**** md5 signature: cabcbe9e94c679dcfc142972b20ab60b ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****************** Circle ******************/
		/**** md5 signature: 031880777795958cc554fa5739cb3a95 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ2d
") Circle;
		gp_Circ2d Circle();

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
		/**** md5 signature: ddf7a75e69fe58663e31cac16bd20e3b ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") Curve;
		const opencascade::handle<Geom2d_Curve> & Curve();

		/****************** D0 ******************/
		/**** md5 signature: 01a5234aae6db090351bac35b3718fd9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 79a293d0b91ab6d1359881075119fb56 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
U: float
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		/**** md5 signature: acc8c0955596bb0bf809102736ad1124 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: 5ce473e72cc7bb935a667f4c839dab09 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** Ellipse ******************/
		/**** md5 signature: 57e9088d9546fb79032102b676477b62 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips2d
") Ellipse;
		gp_Elips2d Ellipse();

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
		/**** md5 signature: 951e1971b5974627f011740e5c4c9ecb ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr2d
") Hyperbola;
		gp_Hypr2d Hyperbola();

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
		%feature("autodoc", "No available documentation.

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
		/**** md5 signature: d41344e9c3febf8a7347a9e78e837373 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin2d
") Line;
		gp_Lin2d Line();

		/****************** Load ******************/
		/**** md5 signature: fdcf9322cc527774508b69d52c733d85 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Load ******************/
		/**** md5 signature: e53bb00b8959a1147c6b209edebcdf9d ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Constructionerror is raised if ufirst>ulast.

Parameters
----------
C: Geom2d_Curve
UFirst: float
ULast: float

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real UFirst, const Standard_Real ULast);

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the curve in intervals of continuity <s>. and returns the number of intervals.

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
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		/**** md5 signature: 52e5fadf897540545847ef59cc0ba942 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** NbSamples ******************/
		/**** md5 signature: b50a2e2af8c6f92fd1d1eba428d764af ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSamples;
		virtual Standard_Integer NbSamples();

		/****************** Parabola ******************/
		/**** md5 signature: 38729705f952495154cecf7cf9964648 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab2d
") Parabola;
		gp_Parab2d Parabola();

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
		/**** md5 signature: 1c5e768832095b165fef245795734120 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution.

Parameters
----------
Ruv: float

Returns
-------
float
") Resolution;
		Standard_Real Resolution(const Standard_Real Ruv);

		/****************** Trim ******************/
		/**** md5 signature: e1eef64565323d75c47ee19ca861de8d ****/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a curve equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Trim;
		opencascade::handle<Adaptor2d_HCurve2d> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: 91dcf5c5229f25c64d3a714347090b29 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float

Returns
-------
gp_Pnt2d
") Value;
		gp_Pnt2d Value(const Standard_Real U);

};


%extend Geom2dAdaptor_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Geom2dAdaptor_GHCurve *
******************************/
class Geom2dAdaptor_GHCurve : public Adaptor2d_HCurve2d {
	public:
		/****************** Geom2dAdaptor_GHCurve ******************/
		/**** md5 signature: 072a27b96ff59badfe117194272d84ef ****/
		%feature("compactdefaultargs") Geom2dAdaptor_GHCurve;
		%feature("autodoc", "Creates an empty genhcurve2d.

Returns
-------
None
") Geom2dAdaptor_GHCurve;
		 Geom2dAdaptor_GHCurve();

		/****************** Geom2dAdaptor_GHCurve ******************/
		/**** md5 signature: 7c7fc9f77e7805886189b20b8c2739c8 ****/
		%feature("compactdefaultargs") Geom2dAdaptor_GHCurve;
		%feature("autodoc", "Creates a genhcurve2d from a curve.

Parameters
----------
C: Geom2dAdaptor_Curve

Returns
-------
None
") Geom2dAdaptor_GHCurve;
		 Geom2dAdaptor_GHCurve(const Geom2dAdaptor_Curve & C);

		/****************** ChangeCurve2d ******************/
		/**** md5 signature: 2140fe22e7b7d159cfd1852d556180a2 ****/
		%feature("compactdefaultargs") ChangeCurve2d;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
Geom2dAdaptor_Curve
") ChangeCurve2d;
		Geom2dAdaptor_Curve & ChangeCurve2d();

		/****************** Curve2d ******************/
		/**** md5 signature: 87546edb35f2000a54f99255bb8c94db ****/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Returns the curve used to create the genhcurve2d. this is redefined from hcurve2d, cannot be inline.

Returns
-------
Adaptor2d_Curve2d
") Curve2d;
		const Adaptor2d_Curve2d & Curve2d();

		/****************** Set ******************/
		/**** md5 signature: d491bd141bf3f5da75523d4d4b7f3963 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the field of the genhcurve2d.

Parameters
----------
C: Geom2dAdaptor_Curve

Returns
-------
None
") Set;
		void Set(const Geom2dAdaptor_Curve & C);

};


%make_alias(Geom2dAdaptor_GHCurve)

%extend Geom2dAdaptor_GHCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Geom2dAdaptor_HCurve *
*****************************/
class Geom2dAdaptor_HCurve : public Geom2dAdaptor_GHCurve {
	public:
		/****************** Geom2dAdaptor_HCurve ******************/
		/**** md5 signature: 28a68b1bba9232a7107bed887b344ce3 ****/
		%feature("compactdefaultargs") Geom2dAdaptor_HCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve();

		/****************** Geom2dAdaptor_HCurve ******************/
		/**** md5 signature: 76fd083adc9318ad2d733c03244a4eb2 ****/
		%feature("compactdefaultargs") Geom2dAdaptor_HCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
AS: Geom2dAdaptor_Curve

Returns
-------
None
") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve(const Geom2dAdaptor_Curve & AS);

		/****************** Geom2dAdaptor_HCurve ******************/
		/**** md5 signature: 119924484c2907c195d5fb93400a3ddf ****/
		%feature("compactdefaultargs") Geom2dAdaptor_HCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom2d_Curve

Returns
-------
None
") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve(const opencascade::handle<Geom2d_Curve> & S);

		/****************** Geom2dAdaptor_HCurve ******************/
		/**** md5 signature: 2dc2ff6c60097225fbf5a6294824e18b ****/
		%feature("compactdefaultargs") Geom2dAdaptor_HCurve;
		%feature("autodoc", "Constructionerror is raised if ufirst>ulast or vfirst>vlast.

Parameters
----------
S: Geom2d_Curve
UFirst: float
ULast: float

Returns
-------
None
") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve(const opencascade::handle<Geom2d_Curve> & S, const Standard_Real UFirst, const Standard_Real ULast);

};


%make_alias(Geom2dAdaptor_HCurve)

%extend Geom2dAdaptor_HCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
