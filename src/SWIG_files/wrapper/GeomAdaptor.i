/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geomadaptor.html"
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
%wrap_handle(GeomAdaptor_TransformedCurve)
%wrap_handle(GeomAdaptor_TransformedSurface)
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
Inherited from GHCurve. Provides a curve handled by reference. Build a Geom_Curve using the information from the Curve from Adaptor3d.
") MakeCurve;
		static opencascade::handle<Geom_Curve> MakeCurve(const Adaptor3d_Curve & C);

		/****** GeomAdaptor::MakeSurface ******/
		/****** md5 signature: 5d21e78a69c7cc3759237f4e58ff95c9 ******/
		%feature("compactdefaultargs") MakeSurface;
		%feature("autodoc", "
Parameters
----------
theS: Adaptor3d_Surface
theTrimFlag: bool (optional, default to true)

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Build a Geom_Surface using the information from the Surface from Adaptor3d 
Parameter theS - Surface adaptor to convert. 
Parameter theTrimFlag - True if perform trim surface values by adaptor and false otherwise.
") MakeSurface;
		static opencascade::handle<Geom_Surface> MakeSurface(const Adaptor3d_Surface & theS, const bool theTrimFlag = true);

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
		class OffsetData {};
		class BezierData {};
		class BSplineData {};
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
		/****** md5 signature: 2695a6212695c4bcbaefc951703ae5a7 ******/
		%feature("compactdefaultargs") GeomAdaptor_Curve;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_Curve
theUFirst: double
theULast: double

Return
-------
None

Description
-----------
Standard_ConstructionError is raised if theUFirst > theULast + Precision::PConfusion().
") GeomAdaptor_Curve;
		 GeomAdaptor_Curve(const opencascade::handle<Geom_Curve> & theCurve, const double theUFirst, const double theULast);

		/****** GeomAdaptor_Curve::BSpline ******/
		/****** md5 signature: 7bed4aa4788773a8c748371dea2999b6 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
this will NOT make a copy of the BSpline Curve: If you want to modify the Curve please make a copy yourself Also it will NOT trim the surface to myFirst/Last.
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****** GeomAdaptor_Curve::Bezier ******/
		/****** md5 signature: 18c746ed347d210e28744f5b1c7eb527 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
this will NOT make a copy of the Bezier Curve: If you want to modify the Curve please make a copy yourself Also it will NOT trim the surface to myFirst/Last.
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****** GeomAdaptor_Curve::Circle ******/
		/****** md5 signature: 7475f3d2915ecc09ceb3114f02b43080 ******/
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
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
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
Provides a curve inherited from Hcurve from Adaptor. This is inherited to provide easy to use constructors.
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****** GeomAdaptor_Curve::Degree ******/
		/****** md5 signature: 6a99b61f429058b67ffcdab561815cfb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
this should NEVER make a copy of the underlying curve to read the relevant information.
") Degree;
		int Degree();

		/****** GeomAdaptor_Curve::Ellipse ******/
		/****** md5 signature: b7cf7020e3992d6d2378fd2118e8d198 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips Ellipse();

		/****** GeomAdaptor_Curve::EvalD0 ******/
		/****** md5 signature: 534d5bf2fd8e92a6dcc7c1d53e829bc3 ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
gp_Pnt

Description
-----------
Point evaluation. Raises an exception on failure.
") EvalD0;
		gp_Pnt EvalD0(const double theU);

		/****** GeomAdaptor_Curve::EvalD1 ******/
		/****** md5 signature: 7afa7a9bd3f5047a6ef303b4732e48db ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD1

Description
-----------
D1 evaluation. Raises an exception on failure.
") EvalD1;
		Geom_Curve::ResD1 EvalD1(const double theU);

		/****** GeomAdaptor_Curve::EvalD2 ******/
		/****** md5 signature: bdf34f9b5fb078dabb16e072337b36b5 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD2

Description
-----------
D2 evaluation. Raises an exception on failure.
") EvalD2;
		Geom_Curve::ResD2 EvalD2(const double theU);

		/****** GeomAdaptor_Curve::EvalD3 ******/
		/****** md5 signature: a6e2ea19f102d61c7a916bef9a895bcb ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD3

Description
-----------
D3 evaluation. Raises an exception on failure.
") EvalD3;
		Geom_Curve::ResD3 EvalD3(const double theU);

		/****** GeomAdaptor_Curve::EvalDN ******/
		/****** md5 signature: 77005f048bbfcdbbddaf4af5a7b6cef4 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
theU: double
theN: int

Return
-------
gp_Vec

Description
-----------
DN evaluation. Raises an exception on failure.
") EvalDN;
		gp_Vec EvalDN(const double theU, const int theN);

		/****** GeomAdaptor_Curve::FirstParameter ******/
		/****** md5 signature: dc78d2d12bb932c87a4c14a5c9c0d19a ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		double FirstParameter();

		/****** GeomAdaptor_Curve::GetType ******/
		/****** md5 signature: e8702ba2a9b67d9bf1a9f4972b71ea7a ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
No available documentation.
") GetType;
		GeomAbs_CurveType GetType();

		/****** GeomAdaptor_Curve::Hyperbola ******/
		/****** md5 signature: 308d3b34f3aaba706261ba7e6cb1678e ******/
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
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomAdaptor_Curve::IsClosed ******/
		/****** md5 signature: e10ee7204b25ff2ff849146f37c83359 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		bool IsClosed();

		/****** GeomAdaptor_Curve::IsPeriodic ******/
		/****** md5 signature: c33341d130b25859848a016acbcaf4dd ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** GeomAdaptor_Curve::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
this should NEVER make a copy of the underlying curve to read the relevant information.
") IsRational;
		bool IsRational();

		/****** GeomAdaptor_Curve::LastParameter ******/
		/****** md5 signature: 9b49916bc4bf24d69a406e677dabf205 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		double LastParameter();

		/****** GeomAdaptor_Curve::Line ******/
		/****** md5 signature: acdc8f5fc99e967530fe196307d05538 ******/
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
		/****** md5 signature: 4c0bb4e6e7a2fdd6f5c521660b1cc11f ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_Curve
theUFirst: double
theULast: double

Return
-------
None

Description
-----------
Standard_ConstructionError is raised if theUFirst > theULast + Precision::PConfusion().
") Load;
		void Load(const opencascade::handle<Geom_Curve> & theCurve, const double theUFirst, const double theULast);

		/****** GeomAdaptor_Curve::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomAdaptor_Curve::NbKnots ******/
		/****** md5 signature: d6bff4f2a244b781cf7c609ff1cddaf1 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
this should NEVER make a copy of the underlying curve to read the relevant information.
") NbKnots;
		int NbKnots();

		/****** GeomAdaptor_Curve::NbPoles ******/
		/****** md5 signature: bdb1092e5fcaeae9c85a332311d7f069 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
this should NEVER make a copy of the underlying curve to read the relevant information.
") NbPoles;
		int NbPoles();

		/****** GeomAdaptor_Curve::OffsetCurve ******/
		/****** md5 signature: 1e87aabad8756a087f230feb50c541bc ******/
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
		/****** md5 signature: de70ebd3fa2d227512b9d0058ee94ca5 ******/
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
		/****** md5 signature: 1f089b3595450d6c97092473e379f329 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Period;
		double Period();

		/****** GeomAdaptor_Curve::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset currently loaded curve (undone Load()).
") Reset;
		void Reset();

		/****** GeomAdaptor_Curve::Resolution ******/
		/****** md5 signature: 7cb383c1a004c01dc3f51b7088c4d899 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
returns the parametric resolution.
") Resolution;
		double Resolution(const double R3d);

		/****** GeomAdaptor_Curve::ShallowCopy ******/
		/****** md5 signature: 20e70b6ba2d95db55811b68454eb9003 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		opencascade::handle<Adaptor3d_Curve> ShallowCopy();

		/****** GeomAdaptor_Curve::Trim ******/
		/****** md5 signature: 91538b497dfbccd564dbd54083e8e395 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") Trim;
		opencascade::handle<Adaptor3d_Curve> Trim(const double First, const double Last, const double Tol);

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
		class ExtrusionData {};
		class RevolutionData {};
		class OffsetData {};
		class BezierData {};
		class BSplineData {};
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
		/****** md5 signature: d2b2b12f5ae173db4ef7622a26640b11 ******/
		%feature("compactdefaultargs") GeomAdaptor_Surface;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_Surface
theUFirst: double
theULast: double
theVFirst: double
theVLast: double
theTolU: double (optional, default to 0.0)
theTolV: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Standard_ConstructionError is raised if UFirst>ULast or VFirst>VLast.
") GeomAdaptor_Surface;
		 GeomAdaptor_Surface(const opencascade::handle<Geom_Surface> & theSurf, const double theUFirst, const double theULast, const double theVFirst, const double theVLast, const double theTolU = 0.0, const double theTolV = 0.0);

		/****** GeomAdaptor_Surface::AxeOfRevolution ******/
		/****** md5 signature: d1efe882bcb9f42b1937beb2fb773ec6 ******/
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
		/****** md5 signature: 8fde07817a4bc7940e9febcd357d3f61 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
This will NOT make a copy of the BSpline Surface: If you want to modify the Surface please make a copy yourself Also it will NOT trim the surface to myU/VFirst/Last.
") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline();

		/****** GeomAdaptor_Surface::BasisCurve ******/
		/****** md5 signature: 5b4605e53987d121f30b9516d7561fb1 ******/
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
		/****** md5 signature: f8144cf04b9828f1299d0b447e023a32 ******/
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
		/****** md5 signature: d3c3048c9ceead5583877ee745b6f3b3 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierSurface>

Description
-----------
This will NOT make a copy of the Bezier Surface: If you want to modify the Surface please make a copy yourself Also it will NOT trim the surface to myU/VFirst/Last.
") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier();

		/****** GeomAdaptor_Surface::Bounds ******/
		/****** md5 signature: 5f4d765abcfec97bff0d7706ad34037a ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
theU1: double
theU2: double
theV1: double
theV2: double

Description
-----------
Returns the parametric bounds of the surface. @param[out] theU1 minimum U parameter @param[out] theU2 maximum U parameter @param[out] theV1 minimum V parameter @param[out] theV2 maximum V parameter.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomAdaptor_Surface::Cone ******/
		/****** md5 signature: f0efa0c0c395b3d1aaec8b678ed3fd71 ******/
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
		/****** md5 signature: f4b3244c5a78bd7cd9f7c60b7f2b75e6 ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "Return
-------
gp_Cylinder

Description
-----------
No available documentation.
") Cylinder;
		gp_Cylinder Cylinder();

		/****** GeomAdaptor_Surface::Direction ******/
		/****** md5 signature: e82225d5d4e09b88b8ad039d354130e5 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		gp_Dir Direction();

		/****** GeomAdaptor_Surface::EvalD0 ******/
		/****** md5 signature: 6ae9a3a500564237b621fd4f196eba74 ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double

Return
-------
gp_Pnt

Description
-----------
Point evaluation. Raises an exception on failure.
") EvalD0;
		gp_Pnt EvalD0(const double theU, const double theV);

		/****** GeomAdaptor_Surface::EvalD1 ******/
		/****** md5 signature: 7ee30f985df48bfdd6167fd3ac9b0ac0 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double

Return
-------
Geom_Surface::ResD1

Description
-----------
D1 evaluation. Raises an exception on failure.
") EvalD1;
		Geom_Surface::ResD1 EvalD1(const double theU, const double theV);

		/****** GeomAdaptor_Surface::EvalD2 ******/
		/****** md5 signature: c229ce24fe9d69a5d26f837aa4938d55 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double

Return
-------
Geom_Surface::ResD2

Description
-----------
D2 evaluation. Raises an exception on failure.
") EvalD2;
		Geom_Surface::ResD2 EvalD2(const double theU, const double theV);

		/****** GeomAdaptor_Surface::EvalD3 ******/
		/****** md5 signature: 60d093ede0ac1d132fbeca3192fa6132 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double

Return
-------
Geom_Surface::ResD3

Description
-----------
D3 evaluation. Raises an exception on failure.
") EvalD3;
		Geom_Surface::ResD3 EvalD3(const double theU, const double theV);

		/****** GeomAdaptor_Surface::EvalDN ******/
		/****** md5 signature: a887ee7f3e724bf66be4d7951087d3ec ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double
theNu: int
theNv: int

Return
-------
gp_Vec

Description
-----------
DN evaluation. Raises an exception on failure.
") EvalDN;
		gp_Vec EvalDN(const double theU, const double theV, const int theNu, const int theNv);

		/****** GeomAdaptor_Surface::FirstUParameter ******/
		/****** md5 signature: 75d5fede1e3df60e6b25fc207601e5e5 ******/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstUParameter;
		double FirstUParameter();

		/****** GeomAdaptor_Surface::FirstVParameter ******/
		/****** md5 signature: ca83c9b14a103eca8f40b01e4b58b6e2 ******/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstVParameter;
		double FirstVParameter();

		/****** GeomAdaptor_Surface::GetType ******/
		/****** md5 signature: 86e3e543a6e2d6f3f0b532be8e8ff523 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_SurfaceType

Description
-----------
Returns the type of the surface: Plane, Cylinder, Cone, Sphere, Torus, BezierSurface, BSplineSurface, SurfaceOfRevolution, SurfaceOfExtrusion, OtherSurface.
") GetType;
		GeomAbs_SurfaceType GetType();

		/****** GeomAdaptor_Surface::IsUClosed ******/
		/****** md5 signature: 91c191879c9b39e0c4f123772c17dbd2 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUClosed;
		bool IsUClosed();

		/****** GeomAdaptor_Surface::IsUPeriodic ******/
		/****** md5 signature: 7236661160e2b4989ea98f769e60fafb ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUPeriodic;
		bool IsUPeriodic();

		/****** GeomAdaptor_Surface::IsURational ******/
		/****** md5 signature: a2496b20d14d31a116825513bae2afcd ******/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsURational;
		bool IsURational();

		/****** GeomAdaptor_Surface::IsVClosed ******/
		/****** md5 signature: b42d07343ce292533f9bd94d419cf3f6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVClosed;
		bool IsVClosed();

		/****** GeomAdaptor_Surface::IsVPeriodic ******/
		/****** md5 signature: 0654a6d88753f46bfbed67995e913efa ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** GeomAdaptor_Surface::IsVRational ******/
		/****** md5 signature: a372cfe96ee85490dfdd8a9905fccc55 ******/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVRational;
		bool IsVRational();

		/****** GeomAdaptor_Surface::LastUParameter ******/
		/****** md5 signature: 0338cd13904e2a1635d8dad15e486bfc ******/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastUParameter;
		double LastUParameter();

		/****** GeomAdaptor_Surface::LastVParameter ******/
		/****** md5 signature: b9bfd4676801b418d9bbc8e2ddee2e27 ******/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastVParameter;
		double LastVParameter();

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
		/****** md5 signature: ae0413c2e6315842349aef6d3a67f403 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theSurf: Geom_Surface
theUFirst: double
theULast: double
theVFirst: double
theVLast: double
theTolU: double (optional, default to 0.0)
theTolV: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Standard_ConstructionError is raised if theUFirst>theULast or theVFirst>theVLast.
") Load;
		void Load(const opencascade::handle<Geom_Surface> & theSurf, const double theUFirst, const double theULast, const double theVFirst, const double theVLast, const double theTolU = 0.0, const double theTolV = 0.0);

		/****** GeomAdaptor_Surface::NbUIntervals ******/
		/****** md5 signature: 4a0e99d191f66cbed14931fc697354f3 ******/
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
Returns the number of U intervals for continuity <S>. May be one if UContinuity(me) >= <S>.
") NbUIntervals;
		int NbUIntervals(const GeomAbs_Shape S);

		/****** GeomAdaptor_Surface::NbUKnots ******/
		/****** md5 signature: e8948433ba47c7becc94d85d8e770339 ******/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUKnots;
		int NbUKnots();

		/****** GeomAdaptor_Surface::NbUPoles ******/
		/****** md5 signature: 5011752e7f57399068c3e11d28ac4d8a ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUPoles;
		int NbUPoles();

		/****** GeomAdaptor_Surface::NbVIntervals ******/
		/****** md5 signature: ec7c8eea10888bbaeb74f56a34fc6af1 ******/
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
Returns the number of V intervals for continuity <S>. May be one if VContinuity(me) >= <S>.
") NbVIntervals;
		int NbVIntervals(const GeomAbs_Shape S);

		/****** GeomAdaptor_Surface::NbVKnots ******/
		/****** md5 signature: 48a662c9885a4cfafb3aee6695bc8b14 ******/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVKnots;
		int NbVKnots();

		/****** GeomAdaptor_Surface::NbVPoles ******/
		/****** md5 signature: bc79fcef9984de53f249da2e7edfb93b ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVPoles;
		int NbVPoles();

		/****** GeomAdaptor_Surface::OffsetValue ******/
		/****** md5 signature: 432da7a67ccf3a0dbaba9e39e592a2e4 ******/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") OffsetValue;
		double OffsetValue();

		/****** GeomAdaptor_Surface::Plane ******/
		/****** md5 signature: 60fc0b62d6b3f27638f11ea963b523f7 ******/
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
		/****** md5 signature: 7aa156a18d0b7bf72bf05655ccd9ffff ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		opencascade::handle<Adaptor3d_Surface> ShallowCopy();

		/****** GeomAdaptor_Surface::Sphere ******/
		/****** md5 signature: 2ad96025b6f047093038a616d097ceae ******/
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

		/****** GeomAdaptor_Surface::ToleranceU ******/
		/****** md5 signature: ffab08eebc650a4644bafb288883a76a ******/
		%feature("compactdefaultargs") ToleranceU;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns tolerance in U direction.
") ToleranceU;
		double ToleranceU();

		/****** GeomAdaptor_Surface::ToleranceV ******/
		/****** md5 signature: 0db48bd95023f8e22b120c4806977d4f ******/
		%feature("compactdefaultargs") ToleranceV;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns tolerance in V direction.
") ToleranceV;
		double ToleranceV();

		/****** GeomAdaptor_Surface::Torus ******/
		/****** md5 signature: e3d8b3166c4d170ce4f0eb64ffeae486 ******/
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
		/****** md5 signature: ade4d04439e04c72cc7414c0ec4a29a8 ******/
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
		/****** md5 signature: fca90e3f2f4c1ba6e7bc9cbc04110d23 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		int UDegree();

		/****** GeomAdaptor_Surface::UIntervals ******/
		/****** md5 signature: 6994811896db22ce8af785fb3194a1dc ******/
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
Returns the intervals with the requested continuity in the U direction.
") UIntervals;
		void UIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomAdaptor_Surface::UPeriod ******/
		/****** md5 signature: 0ac7288e2577dfedb94dacb3d9a60302 ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") UPeriod;
		double UPeriod();

		/****** GeomAdaptor_Surface::UResolution ******/
		/****** md5 signature: 8db9b159a7bf4bfe0753b953109a6bbd ******/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
Returns the parametric U resolution corresponding to the real space resolution <R3d>.
") UResolution;
		double UResolution(const double R3d);

		/****** GeomAdaptor_Surface::UTrim ******/
		/****** md5 signature: d065f303d0a2948f4ff7102b479c7aa6 ******/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns a surface trimmed in the U direction equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") UTrim;
		opencascade::handle<Adaptor3d_Surface> UTrim(const double First, const double Last, const double Tol);

		/****** GeomAdaptor_Surface::VContinuity ******/
		/****** md5 signature: 7db46254d043ce61da12775dc816a925 ******/
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
		/****** md5 signature: c793f94fb8ca1e7cdd3fc97529f675d2 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		int VDegree();

		/****** GeomAdaptor_Surface::VIntervals ******/
		/****** md5 signature: a2cbea5fb0c66ee7a577bf7b7a8aa6ea ******/
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
Returns the intervals with the requested continuity in the V direction.
") VIntervals;
		void VIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomAdaptor_Surface::VPeriod ******/
		/****** md5 signature: 59a61c3d75ffd436a26d1e119e233654 ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") VPeriod;
		double VPeriod();

		/****** GeomAdaptor_Surface::VResolution ******/
		/****** md5 signature: 7d4c767dc5a3559454fc0c9681d327c0 ******/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
Returns the parametric V resolution corresponding to the real space resolution <R3d>.
") VResolution;
		double VResolution(const double R3d);

		/****** GeomAdaptor_Surface::VTrim ******/
		/****** md5 signature: d4060f4796d31b403a0bbdb7b3c4cc96 ******/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns a surface trimmed in the V direction between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") VTrim;
		opencascade::handle<Adaptor3d_Surface> VTrim(const double First, const double Last, const double Tol);

};


%make_alias(GeomAdaptor_Surface)

%extend GeomAdaptor_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class GeomAdaptor_TransformedCurve *
*************************************/
class GeomAdaptor_TransformedCurve : public Adaptor3d_Curve {
	public:
		/****** GeomAdaptor_TransformedCurve::GeomAdaptor_TransformedCurve ******/
		/****** md5 signature: d0802327e3c02481d6faed4a1a8eabec ******/
		%feature("compactdefaultargs") GeomAdaptor_TransformedCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an undefined curve with identity transformation.
") GeomAdaptor_TransformedCurve;
		 GeomAdaptor_TransformedCurve();

		/****** GeomAdaptor_TransformedCurve::GeomAdaptor_TransformedCurve ******/
		/****** md5 signature: 1119a6211c96d86a4866444a9c58049b ******/
		%feature("compactdefaultargs") GeomAdaptor_TransformedCurve;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_Curve
theTrsf: gp_Trsf

Return
-------
None

Description
-----------
Creates a curve adaptor with transformation. 
Parameter theCurve underlying geometry 
Parameter theTrsf transformation to apply.
") GeomAdaptor_TransformedCurve;
		 GeomAdaptor_TransformedCurve(const opencascade::handle<Geom_Curve> & theCurve, const gp_Trsf & theTrsf);

		/****** GeomAdaptor_TransformedCurve::GeomAdaptor_TransformedCurve ******/
		/****** md5 signature: 9ccac8d7c350a80e5c7630a55d619def ******/
		%feature("compactdefaultargs") GeomAdaptor_TransformedCurve;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_Curve
theFirst: double
theLast: double
theTrsf: gp_Trsf

Return
-------
None

Description
-----------
Creates a curve adaptor with transformation and parameter bounds. 
Parameter theCurve underlying geometry 
Parameter theFirst minimum parameter 
Parameter theLast maximum parameter 
Parameter theTrsf transformation to apply.
") GeomAdaptor_TransformedCurve;
		 GeomAdaptor_TransformedCurve(const opencascade::handle<Geom_Curve> & theCurve, const double theFirst, const double theLast, const gp_Trsf & theTrsf);

		/****** GeomAdaptor_TransformedCurve::BSpline ******/
		/****** md5 signature: 7bed4aa4788773a8c748371dea2999b6 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****** GeomAdaptor_TransformedCurve::Bezier ******/
		/****** md5 signature: 18c746ed347d210e28744f5b1c7eb527 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****** GeomAdaptor_TransformedCurve::ChangeCurve ******/
		/****** md5 signature: b118739e4660ff86c2bcb1f9857a6112 ******/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Return
-------
GeomAdaptor_Curve

Description
-----------
Returns the underlying GeomAdaptor_Curve for modification.
") ChangeCurve;
		GeomAdaptor_Curve & ChangeCurve();

		/****** GeomAdaptor_TransformedCurve::Circle ******/
		/****** md5 signature: 7475f3d2915ecc09ceb3114f02b43080 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		gp_Circ Circle();

		/****** GeomAdaptor_TransformedCurve::Continuity ******/
		/****** md5 signature: 04700f24cebb43a08144b5f6f180e4f9 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** GeomAdaptor_TransformedCurve::Curve ******/
		/****** md5 signature: ff7dedad8526761c9df2a87ef909e6fc ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
GeomAdaptor_Curve

Description
-----------
Returns the underlying GeomAdaptor_Curve.
") Curve;
		GeomAdaptor_Curve Curve();

		/****** GeomAdaptor_TransformedCurve::CurveOnSurface ******/
		/****** md5 signature: 762fc32e84a418551a7c5abbf7a90df3 ******/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "Return
-------
Adaptor3d_CurveOnSurface

Description
-----------
Returns the CurveOnSurface adaptor.
") CurveOnSurface;
		Adaptor3d_CurveOnSurface CurveOnSurface();

		/****** GeomAdaptor_TransformedCurve::Degree ******/
		/****** md5 signature: 614805e14ec51874c2f55b971b256d50 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		int Degree();

		/****** GeomAdaptor_TransformedCurve::Ellipse ******/
		/****** md5 signature: b7cf7020e3992d6d2378fd2118e8d198 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips Ellipse();

		/****** GeomAdaptor_TransformedCurve::EvalD0 ******/
		/****** md5 signature: 534d5bf2fd8e92a6dcc7c1d53e829bc3 ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
gp_Pnt

Description
-----------
Point evaluation. Applies transformation after evaluation.
") EvalD0;
		gp_Pnt EvalD0(const double theU);

		/****** GeomAdaptor_TransformedCurve::EvalD1 ******/
		/****** md5 signature: 7afa7a9bd3f5047a6ef303b4732e48db ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD1

Description
-----------
D1 evaluation. Applies transformation after evaluation.
") EvalD1;
		Geom_Curve::ResD1 EvalD1(const double theU);

		/****** GeomAdaptor_TransformedCurve::EvalD2 ******/
		/****** md5 signature: bdf34f9b5fb078dabb16e072337b36b5 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD2

Description
-----------
D2 evaluation. Applies transformation after evaluation.
") EvalD2;
		Geom_Curve::ResD2 EvalD2(const double theU);

		/****** GeomAdaptor_TransformedCurve::EvalD3 ******/
		/****** md5 signature: a6e2ea19f102d61c7a916bef9a895bcb ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD3

Description
-----------
D3 evaluation. Applies transformation after evaluation.
") EvalD3;
		Geom_Curve::ResD3 EvalD3(const double theU);

		/****** GeomAdaptor_TransformedCurve::EvalDN ******/
		/****** md5 signature: 77005f048bbfcdbbddaf4af5a7b6cef4 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
theU: double
theN: int

Return
-------
gp_Vec

Description
-----------
DN evaluation. Applies transformation after evaluation.
") EvalDN;
		gp_Vec EvalDN(const double theU, const int theN);

		/****** GeomAdaptor_TransformedCurve::FirstParameter ******/
		/****** md5 signature: dc78d2d12bb932c87a4c14a5c9c0d19a ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		double FirstParameter();

		/****** GeomAdaptor_TransformedCurve::GeomCurve ******/
		/****** md5 signature: aee8daa0fe639cc5fc37a05d96843ef6 ******/
		%feature("compactdefaultargs") GeomCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Returns the underlying Geom_Curve.
") GeomCurve;
		const opencascade::handle<Geom_Curve> & GeomCurve();

		/****** GeomAdaptor_TransformedCurve::GetType ******/
		/****** md5 signature: e8702ba2a9b67d9bf1a9f4972b71ea7a ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
No available documentation.
") GetType;
		GeomAbs_CurveType GetType();

		/****** GeomAdaptor_TransformedCurve::Hyperbola ******/
		/****** md5 signature: 308d3b34f3aaba706261ba7e6cb1678e ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Hyperbola;
		gp_Hypr Hyperbola();

		/****** GeomAdaptor_TransformedCurve::Intervals ******/
		/****** md5 signature: dcf70287d04e93a83ccf46dc9dc96eb9 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
theT: TColStd_Array1OfReal
theS: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") Intervals;
		void Intervals(TColStd_Array1OfReal & theT, const GeomAbs_Shape theS);

		/****** GeomAdaptor_TransformedCurve::Is3DCurve ******/
		/****** md5 signature: f1070732b28dee63f6628d9eef4869ce ******/
		%feature("compactdefaultargs") Is3DCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the geometry is a 3D curve (not curve on surface).
") Is3DCurve;
		bool Is3DCurve();

		/****** GeomAdaptor_TransformedCurve::IsClosed ******/
		/****** md5 signature: 594ce92d890baf7ffab43133187a0672 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		bool IsClosed();

		/****** GeomAdaptor_TransformedCurve::IsCurveOnSurface ******/
		/****** md5 signature: e5a6a0125779453dd5ff55e0a5acd31b ******/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the geometry is a curve on surface.
") IsCurveOnSurface;
		bool IsCurveOnSurface();

		/****** GeomAdaptor_TransformedCurve::IsPeriodic ******/
		/****** md5 signature: 3716e8aa9b894dac4aa0c284c6bfe4b0 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** GeomAdaptor_TransformedCurve::IsRational ******/
		/****** md5 signature: f30c7725220ba7b7214110e5715c3d99 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		bool IsRational();

		/****** GeomAdaptor_TransformedCurve::LastParameter ******/
		/****** md5 signature: 9b49916bc4bf24d69a406e677dabf205 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		double LastParameter();

		/****** GeomAdaptor_TransformedCurve::Line ******/
		/****** md5 signature: acdc8f5fc99e967530fe196307d05538 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		gp_Lin Line();

		/****** GeomAdaptor_TransformedCurve::Load ******/
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
Loads the curve geometry. 
Parameter theCurve underlying geometry.
") Load;
		void Load(const opencascade::handle<Geom_Curve> & theCurve);

		/****** GeomAdaptor_TransformedCurve::Load ******/
		/****** md5 signature: 4e5d30292d6c9e71f092f5f58600d75c ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom_Curve
theFirst: double
theLast: double

Return
-------
None

Description
-----------
Loads the curve geometry with parameter bounds. 
Parameter theCurve underlying geometry 
Parameter theFirst minimum parameter 
Parameter theLast maximum parameter.
") Load;
		void Load(const opencascade::handle<Geom_Curve> & theCurve, const double theFirst, const double theLast);

		/****** GeomAdaptor_TransformedCurve::LoadCurveOnSurface ******/
		/****** md5 signature: 3b725d2bd19f31ffdd001e6d36511ff0 ******/
		%feature("compactdefaultargs") LoadCurveOnSurface;
		%feature("autodoc", "
Parameters
----------
theConSurf: Adaptor3d_CurveOnSurface

Return
-------
None

Description
-----------
Sets the curve on surface adaptor. 
Parameter theConSurf curve on surface adaptor.
") LoadCurveOnSurface;
		void LoadCurveOnSurface(const opencascade::handle<Adaptor3d_CurveOnSurface> & theConSurf);

		/****** GeomAdaptor_TransformedCurve::NbIntervals ******/
		/****** md5 signature: 86d20aece993b222833023cd29aae702 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
theS: GeomAbs_Shape

Return
-------
int

Description
-----------
No available documentation.
") NbIntervals;
		int NbIntervals(const GeomAbs_Shape theS);

		/****** GeomAdaptor_TransformedCurve::NbKnots ******/
		/****** md5 signature: f7928e3ab81f5d59bf00aef695917623 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		int NbKnots();

		/****** GeomAdaptor_TransformedCurve::NbPoles ******/
		/****** md5 signature: 5994111f5b843f8ad0ad2ec53c77affa ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		int NbPoles();

		/****** GeomAdaptor_TransformedCurve::OffsetCurve ******/
		/****** md5 signature: 1e87aabad8756a087f230feb50c541bc ******/
		%feature("compactdefaultargs") OffsetCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_OffsetCurve>

Description
-----------
No available documentation.
") OffsetCurve;
		opencascade::handle<Geom_OffsetCurve> OffsetCurve();

		/****** GeomAdaptor_TransformedCurve::Parabola ******/
		/****** md5 signature: de70ebd3fa2d227512b9d0058ee94ca5 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
No available documentation.
") Parabola;
		gp_Parab Parabola();

		/****** GeomAdaptor_TransformedCurve::Period ******/
		/****** md5 signature: 1d58794363180279185ced631d60afb1 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Period;
		double Period();

		/****** GeomAdaptor_TransformedCurve::Resolution ******/
		/****** md5 signature: 9ba49d77ce77795403075d5825b70dde ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
theR3d: double

Return
-------
double

Description
-----------
No available documentation.
") Resolution;
		double Resolution(const double theR3d);

		/****** GeomAdaptor_TransformedCurve::SetTrsf ******/
		/****** md5 signature: 1a91030a3a81f641a81466daaf5c0c2f ******/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "
Parameters
----------
theTrsf: gp_Trsf

Return
-------
None

Description
-----------
Sets the transformation. 
Parameter theTrsf transformation to apply.
") SetTrsf;
		void SetTrsf(const gp_Trsf & theTrsf);

		/****** GeomAdaptor_TransformedCurve::ShallowCopy ******/
		/****** md5 signature: 20e70b6ba2d95db55811b68454eb9003 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		opencascade::handle<Adaptor3d_Curve> ShallowCopy();

		/****** GeomAdaptor_TransformedCurve::Trim ******/
		/****** md5 signature: 78db5965fb403b477d6addb384e075bf ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
theFirst: double
theLast: double
theTol: double

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") Trim;
		opencascade::handle<Adaptor3d_Curve> Trim(const double theFirst, const double theLast, const double theTol);

		/****** GeomAdaptor_TransformedCurve::Trsf ******/
		/****** md5 signature: 994369af5cf027a69090540425b26b58 ******/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the transformation.
") Trsf;
		const gp_Trsf Trsf();

};


%make_alias(GeomAdaptor_TransformedCurve)

%extend GeomAdaptor_TransformedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class GeomAdaptor_TransformedSurface *
***************************************/
class GeomAdaptor_TransformedSurface : public Adaptor3d_Surface {
	public:
		/****** GeomAdaptor_TransformedSurface::GeomAdaptor_TransformedSurface ******/
		/****** md5 signature: 7d2b8e0b5faa7478058131f8bdd8eb04 ******/
		%feature("compactdefaultargs") GeomAdaptor_TransformedSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an undefined surface with identity transformation.
") GeomAdaptor_TransformedSurface;
		 GeomAdaptor_TransformedSurface();

		/****** GeomAdaptor_TransformedSurface::GeomAdaptor_TransformedSurface ******/
		/****** md5 signature: 3fec3bb29ac4e103ed778d3fbca406c1 ******/
		%feature("compactdefaultargs") GeomAdaptor_TransformedSurface;
		%feature("autodoc", "
Parameters
----------
theSurface: Geom_Surface
theTrsf: gp_Trsf

Return
-------
None

Description
-----------
Creates a surface adaptor with transformation. 
Parameter theSurface underlying geometry 
Parameter theTrsf transformation to apply.
") GeomAdaptor_TransformedSurface;
		 GeomAdaptor_TransformedSurface(const opencascade::handle<Geom_Surface> & theSurface, const gp_Trsf & theTrsf);

		/****** GeomAdaptor_TransformedSurface::GeomAdaptor_TransformedSurface ******/
		/****** md5 signature: 6d729bc08a55b0b0c1541205502c4b38 ******/
		%feature("compactdefaultargs") GeomAdaptor_TransformedSurface;
		%feature("autodoc", "
Parameters
----------
theSurface: Geom_Surface
theUFirst: double
theULast: double
theVFirst: double
theVLast: double
theTrsf: gp_Trsf
theTolU: double (optional, default to 0.0)
theTolV: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Creates a surface adaptor with transformation and parameter bounds. 
Parameter theSurface underlying geometry 
Parameter theUFirst minimum U parameter 
Parameter theULast maximum U parameter 
Parameter theVFirst minimum V parameter 
Parameter theVLast maximum V parameter 
Parameter theTrsf transformation to apply 
Parameter theTolU tolerance in U direction 
Parameter theTolV tolerance in V direction.
") GeomAdaptor_TransformedSurface;
		 GeomAdaptor_TransformedSurface(const opencascade::handle<Geom_Surface> & theSurface, const double theUFirst, const double theULast, const double theVFirst, const double theVLast, const gp_Trsf & theTrsf, const double theTolU = 0.0, const double theTolV = 0.0);

		/****** GeomAdaptor_TransformedSurface::AdaptorSurfaceOriginal ******/
		/****** md5 signature: 97a99513aa9654e818bf6a45619a07c6 ******/
		%feature("compactdefaultargs") AdaptorSurfaceOriginal;
		%feature("autodoc", "Return
-------
GeomAdaptor_Surface

Description
-----------
Returns the underlying original GeomAdaptor_Surface without transformation applied.
") AdaptorSurfaceOriginal;
		GeomAdaptor_Surface AdaptorSurfaceOriginal();

		/****** GeomAdaptor_TransformedSurface::AdaptorSurfaceTransformed ******/
		/****** md5 signature: 855f7280ad8904742d293826098ffdb7 ******/
		%feature("compactdefaultargs") AdaptorSurfaceTransformed;
		%feature("autodoc", "Return
-------
GeomAdaptor_Surface

Description
-----------
Returns an adaptor for the transformed surface state. Uses the original adaptor for identity transformation to preserve existing trimming.
") AdaptorSurfaceTransformed;
		GeomAdaptor_Surface AdaptorSurfaceTransformed();

		/****** GeomAdaptor_TransformedSurface::AxeOfRevolution ******/
		/****** md5 signature: d1efe882bcb9f42b1937beb2fb773ec6 ******/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
No available documentation.
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution();

		/****** GeomAdaptor_TransformedSurface::BSpline ******/
		/****** md5 signature: 8fde07817a4bc7940e9febcd357d3f61 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
No available documentation.
") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline();

		/****** GeomAdaptor_TransformedSurface::BasisCurve ******/
		/****** md5 signature: 5b4605e53987d121f30b9516d7561fb1 ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") BasisCurve;
		opencascade::handle<Adaptor3d_Curve> BasisCurve();

		/****** GeomAdaptor_TransformedSurface::BasisSurface ******/
		/****** md5 signature: f8144cf04b9828f1299d0b447e023a32 ******/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") BasisSurface;
		opencascade::handle<Adaptor3d_Surface> BasisSurface();

		/****** GeomAdaptor_TransformedSurface::Bezier ******/
		/****** md5 signature: d3c3048c9ceead5583877ee745b6f3b3 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierSurface>

Description
-----------
No available documentation.
") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier();

		/****** GeomAdaptor_TransformedSurface::Cone ******/
		/****** md5 signature: f0efa0c0c395b3d1aaec8b678ed3fd71 ******/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "Return
-------
gp_Cone

Description
-----------
No available documentation.
") Cone;
		gp_Cone Cone();

		/****** GeomAdaptor_TransformedSurface::Cylinder ******/
		/****** md5 signature: f4b3244c5a78bd7cd9f7c60b7f2b75e6 ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "Return
-------
gp_Cylinder

Description
-----------
No available documentation.
") Cylinder;
		gp_Cylinder Cylinder();

		/****** GeomAdaptor_TransformedSurface::Direction ******/
		/****** md5 signature: e82225d5d4e09b88b8ad039d354130e5 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		gp_Dir Direction();

		/****** GeomAdaptor_TransformedSurface::EvalD0 ******/
		/****** md5 signature: 6ae9a3a500564237b621fd4f196eba74 ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double

Return
-------
gp_Pnt

Description
-----------
Point evaluation. Applies transformation after evaluation.
") EvalD0;
		gp_Pnt EvalD0(const double theU, const double theV);

		/****** GeomAdaptor_TransformedSurface::EvalD1 ******/
		/****** md5 signature: 7ee30f985df48bfdd6167fd3ac9b0ac0 ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double

Return
-------
Geom_Surface::ResD1

Description
-----------
D1 evaluation. Applies transformation after evaluation.
") EvalD1;
		Geom_Surface::ResD1 EvalD1(const double theU, const double theV);

		/****** GeomAdaptor_TransformedSurface::EvalD2 ******/
		/****** md5 signature: c229ce24fe9d69a5d26f837aa4938d55 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double

Return
-------
Geom_Surface::ResD2

Description
-----------
D2 evaluation. Applies transformation after evaluation.
") EvalD2;
		Geom_Surface::ResD2 EvalD2(const double theU, const double theV);

		/****** GeomAdaptor_TransformedSurface::EvalD3 ******/
		/****** md5 signature: 60d093ede0ac1d132fbeca3192fa6132 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double

Return
-------
Geom_Surface::ResD3

Description
-----------
D3 evaluation. Applies transformation after evaluation.
") EvalD3;
		Geom_Surface::ResD3 EvalD3(const double theU, const double theV);

		/****** GeomAdaptor_TransformedSurface::EvalDN ******/
		/****** md5 signature: a887ee7f3e724bf66be4d7951087d3ec ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double
theNu: int
theNv: int

Return
-------
gp_Vec

Description
-----------
DN evaluation. Applies transformation after evaluation.
") EvalDN;
		gp_Vec EvalDN(const double theU, const double theV, const int theNu, const int theNv);

		/****** GeomAdaptor_TransformedSurface::FirstUParameter ******/
		/****** md5 signature: 75d5fede1e3df60e6b25fc207601e5e5 ******/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstUParameter;
		double FirstUParameter();

		/****** GeomAdaptor_TransformedSurface::FirstVParameter ******/
		/****** md5 signature: ca83c9b14a103eca8f40b01e4b58b6e2 ******/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstVParameter;
		double FirstVParameter();

		/****** GeomAdaptor_TransformedSurface::GeomSurface ******/
		/****** md5 signature: 683ed3269791e2f0ac37f01eef575e3e ******/
		%feature("compactdefaultargs") GeomSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") GeomSurface;
		const opencascade::handle<Geom_Surface> & GeomSurface();

		/****** GeomAdaptor_TransformedSurface::GeomSurfaceOriginal ******/
		/****** md5 signature: cd29fc5e5ecaa7b78e38539ce4d1ef77 ******/
		%feature("compactdefaultargs") GeomSurfaceOriginal;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns the underlying original Geom_Surface without transformation applied.
") GeomSurfaceOriginal;
		const opencascade::handle<Geom_Surface> & GeomSurfaceOriginal();

		/****** GeomAdaptor_TransformedSurface::GeomSurfaceTransformed ******/
		/****** md5 signature: 9d2936a62fe35d26b823331d208defd0 ******/
		%feature("compactdefaultargs") GeomSurfaceTransformed;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns the transformed Geom_Surface cached for current state.
") GeomSurfaceTransformed;
		const opencascade::handle<Geom_Surface> & GeomSurfaceTransformed();

		/****** GeomAdaptor_TransformedSurface::GetType ******/
		/****** md5 signature: 86e3e543a6e2d6f3f0b532be8e8ff523 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_SurfaceType

Description
-----------
No available documentation.
") GetType;
		GeomAbs_SurfaceType GetType();

		/****** GeomAdaptor_TransformedSurface::HasTrsf ******/
		/****** md5 signature: 921928f2ca87d3fd5ddec907942a96b7 ******/
		%feature("compactdefaultargs") HasTrsf;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if non-identity transformation is applied.
") HasTrsf;
		bool HasTrsf();

		/****** GeomAdaptor_TransformedSurface::IsUClosed ******/
		/****** md5 signature: 3651b4d7c09c8cce21ca5beb1c9663aa ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUClosed;
		bool IsUClosed();

		/****** GeomAdaptor_TransformedSurface::IsUPeriodic ******/
		/****** md5 signature: 2276026a8ccbe2a25cf61c18474bcee1 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUPeriodic;
		bool IsUPeriodic();

		/****** GeomAdaptor_TransformedSurface::IsURational ******/
		/****** md5 signature: 39076b1a8f0d81f39c8079a95d3bac29 ******/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsURational;
		bool IsURational();

		/****** GeomAdaptor_TransformedSurface::IsVClosed ******/
		/****** md5 signature: 0d710811959b989a9f490c49b2e586fc ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVClosed;
		bool IsVClosed();

		/****** GeomAdaptor_TransformedSurface::IsVPeriodic ******/
		/****** md5 signature: 115f1398e0e539df496eb92e60b6b191 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** GeomAdaptor_TransformedSurface::IsVRational ******/
		/****** md5 signature: 9e5c79a42dbd2e1b896e1acba3fdc3b9 ******/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVRational;
		bool IsVRational();

		/****** GeomAdaptor_TransformedSurface::LastUParameter ******/
		/****** md5 signature: 0338cd13904e2a1635d8dad15e486bfc ******/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastUParameter;
		double LastUParameter();

		/****** GeomAdaptor_TransformedSurface::LastVParameter ******/
		/****** md5 signature: b9bfd4676801b418d9bbc8e2ddee2e27 ******/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastVParameter;
		double LastVParameter();

		/****** GeomAdaptor_TransformedSurface::Load ******/
		/****** md5 signature: dfe6efd136cdbd2d73f532d77145132b ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theSurface: Geom_Surface
theTrsf: gp_Trsf

Return
-------
None

Description
-----------
Loads the surface geometry. 
Parameter theSurface underlying geometry 
Parameter theTrsf transformation to apply.
") Load;
		void Load(const opencascade::handle<Geom_Surface> & theSurface, const gp_Trsf & theTrsf);

		/****** GeomAdaptor_TransformedSurface::Load ******/
		/****** md5 signature: ca218faf9901e55a0845136261728d19 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theSurface: Geom_Surface
theUFirst: double
theULast: double
theVFirst: double
theVLast: double
theTrsf: gp_Trsf
theTolU: double (optional, default to 0.0)
theTolV: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Loads the surface geometry with parameter bounds. 
Parameter theSurface underlying geometry 
Parameter theUFirst minimum U parameter 
Parameter theULast maximum U parameter 
Parameter theVFirst minimum V parameter 
Parameter theVLast maximum V parameter 
Parameter theTrsf transformation to apply 
Parameter theTolU tolerance in U direction 
Parameter theTolV tolerance in V direction.
") Load;
		void Load(const opencascade::handle<Geom_Surface> & theSurface, const double theUFirst, const double theULast, const double theVFirst, const double theVLast, const gp_Trsf & theTrsf, const double theTolU = 0.0, const double theTolV = 0.0);

		/****** GeomAdaptor_TransformedSurface::NbUIntervals ******/
		/****** md5 signature: c116fe7ebfe4f31cf9841ef4e3738973 ******/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "
Parameters
----------
theS: GeomAbs_Shape

Return
-------
int

Description
-----------
No available documentation.
") NbUIntervals;
		int NbUIntervals(const GeomAbs_Shape theS);

		/****** GeomAdaptor_TransformedSurface::NbUKnots ******/
		/****** md5 signature: 53862e690bacaf38a350728e42fc2a40 ******/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUKnots;
		int NbUKnots();

		/****** GeomAdaptor_TransformedSurface::NbUPoles ******/
		/****** md5 signature: 9fa03df5e5ab5f4dcfe5dd653dae5721 ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUPoles;
		int NbUPoles();

		/****** GeomAdaptor_TransformedSurface::NbVIntervals ******/
		/****** md5 signature: 0c1d53bf75d3ba86691bbb1e478c702d ******/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "
Parameters
----------
theS: GeomAbs_Shape

Return
-------
int

Description
-----------
No available documentation.
") NbVIntervals;
		int NbVIntervals(const GeomAbs_Shape theS);

		/****** GeomAdaptor_TransformedSurface::NbVKnots ******/
		/****** md5 signature: 78a01e825cc1bd8ca2083a583d5b5b1c ******/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVKnots;
		int NbVKnots();

		/****** GeomAdaptor_TransformedSurface::NbVPoles ******/
		/****** md5 signature: ffc54dfa22985539cf30e51564c2bcac ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVPoles;
		int NbVPoles();

		/****** GeomAdaptor_TransformedSurface::OffsetValue ******/
		/****** md5 signature: 432da7a67ccf3a0dbaba9e39e592a2e4 ******/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") OffsetValue;
		double OffsetValue();

		/****** GeomAdaptor_TransformedSurface::Plane ******/
		/****** md5 signature: 60fc0b62d6b3f27638f11ea963b523f7 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
gp_Pln

Description
-----------
No available documentation.
") Plane;
		gp_Pln Plane();

		/****** GeomAdaptor_TransformedSurface::SetTrsf ******/
		/****** md5 signature: f1c59d26b8a6d180bcbd9fa2ab73c120 ******/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "
Parameters
----------
theTrsf: gp_Trsf

Return
-------
None

Description
-----------
Sets the transformation. 
Parameter theTrsf transformation to apply.
") SetTrsf;
		void SetTrsf(const gp_Trsf & theTrsf);

		/****** GeomAdaptor_TransformedSurface::ShallowCopy ******/
		/****** md5 signature: 7aa156a18d0b7bf72bf05655ccd9ffff ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		opencascade::handle<Adaptor3d_Surface> ShallowCopy();

		/****** GeomAdaptor_TransformedSurface::Sphere ******/
		/****** md5 signature: 2ad96025b6f047093038a616d097ceae ******/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "Return
-------
gp_Sphere

Description
-----------
No available documentation.
") Sphere;
		gp_Sphere Sphere();

		/****** GeomAdaptor_TransformedSurface::Surface ******/
		/****** md5 signature: d8b3a71336a26596a7e105e13d0649c7 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
GeomAdaptor_Surface

Description
-----------
No available documentation.
") Surface;
		GeomAdaptor_Surface Surface();

		/****** GeomAdaptor_TransformedSurface::ToleranceU ******/
		/****** md5 signature: ffab08eebc650a4644bafb288883a76a ******/
		%feature("compactdefaultargs") ToleranceU;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns tolerance in U direction.
") ToleranceU;
		double ToleranceU();

		/****** GeomAdaptor_TransformedSurface::ToleranceV ******/
		/****** md5 signature: 0db48bd95023f8e22b120c4806977d4f ******/
		%feature("compactdefaultargs") ToleranceV;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns tolerance in V direction.
") ToleranceV;
		double ToleranceV();

		/****** GeomAdaptor_TransformedSurface::Torus ******/
		/****** md5 signature: e3d8b3166c4d170ce4f0eb64ffeae486 ******/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "Return
-------
gp_Torus

Description
-----------
No available documentation.
") Torus;
		gp_Torus Torus();

		/****** GeomAdaptor_TransformedSurface::Trsf ******/
		/****** md5 signature: 994369af5cf027a69090540425b26b58 ******/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the transformation.
") Trsf;
		const gp_Trsf Trsf();

		/****** GeomAdaptor_TransformedSurface::UContinuity ******/
		/****** md5 signature: 5fe24fda67de3496914b1f45d9455993 ******/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") UContinuity;
		GeomAbs_Shape UContinuity();

		/****** GeomAdaptor_TransformedSurface::UDegree ******/
		/****** md5 signature: e5aabe332dc5ea702c49bae40cf3033c ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		int UDegree();

		/****** GeomAdaptor_TransformedSurface::UIntervals ******/
		/****** md5 signature: e5375e5f4826c45c8abfaad8d491e3c8 ******/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "
Parameters
----------
theT: TColStd_Array1OfReal
theS: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") UIntervals;
		void UIntervals(TColStd_Array1OfReal & theT, const GeomAbs_Shape theS);

		/****** GeomAdaptor_TransformedSurface::UPeriod ******/
		/****** md5 signature: 854c1aa98247d2787cc5da76dc45ec1b ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") UPeriod;
		double UPeriod();

		/****** GeomAdaptor_TransformedSurface::UResolution ******/
		/****** md5 signature: 3c9bb661a9b274fdd921f72e6e9d92d1 ******/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "
Parameters
----------
theR3d: double

Return
-------
double

Description
-----------
No available documentation.
") UResolution;
		double UResolution(const double theR3d);

		/****** GeomAdaptor_TransformedSurface::UTrim ******/
		/****** md5 signature: 529a95ece33d99c4cef6f188cdd1ead8 ******/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "
Parameters
----------
theFirst: double
theLast: double
theTol: double

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") UTrim;
		opencascade::handle<Adaptor3d_Surface> UTrim(const double theFirst, const double theLast, const double theTol);

		/****** GeomAdaptor_TransformedSurface::VContinuity ******/
		/****** md5 signature: efa372739a9c7d719d52c7ebdceb796b ******/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") VContinuity;
		GeomAbs_Shape VContinuity();

		/****** GeomAdaptor_TransformedSurface::VDegree ******/
		/****** md5 signature: 86bb6b1c4f5ef25f80a37a1d6d0dbdd2 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		int VDegree();

		/****** GeomAdaptor_TransformedSurface::VIntervals ******/
		/****** md5 signature: d70831ad9ab83cb8c1879d7550324ccd ******/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "
Parameters
----------
theT: TColStd_Array1OfReal
theS: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") VIntervals;
		void VIntervals(TColStd_Array1OfReal & theT, const GeomAbs_Shape theS);

		/****** GeomAdaptor_TransformedSurface::VPeriod ******/
		/****** md5 signature: 63247bfa2687417edd488574d34e561a ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") VPeriod;
		double VPeriod();

		/****** GeomAdaptor_TransformedSurface::VResolution ******/
		/****** md5 signature: d402c782af432e52fd7078a68e171e15 ******/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "
Parameters
----------
theR3d: double

Return
-------
double

Description
-----------
No available documentation.
") VResolution;
		double VResolution(const double theR3d);

		/****** GeomAdaptor_TransformedSurface::VTrim ******/
		/****** md5 signature: 15aecb223ba0881ad72a33a8523c26e8 ******/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "
Parameters
----------
theFirst: double
theLast: double
theTol: double

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") VTrim;
		opencascade::handle<Adaptor3d_Surface> VTrim(const double theFirst, const double theLast, const double theTol);

};


%make_alias(GeomAdaptor_TransformedSurface)

%extend GeomAdaptor_TransformedSurface {
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
The Curve is loaded.
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
Thew Curve and the Direction are loaded.
") GeomAdaptor_SurfaceOfLinearExtrusion;
		 GeomAdaptor_SurfaceOfLinearExtrusion(const opencascade::handle<Adaptor3d_Curve> & C, const gp_Dir & V);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::AxeOfRevolution ******/
		/****** md5 signature: d1efe882bcb9f42b1937beb2fb773ec6 ******/
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
		/****** md5 signature: 8fde07817a4bc7940e9febcd357d3f61 ******/
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
		/****** md5 signature: 5b4605e53987d121f30b9516d7561fb1 ******/
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
		/****** md5 signature: d3c3048c9ceead5583877ee745b6f3b3 ******/
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
		/****** md5 signature: f0efa0c0c395b3d1aaec8b678ed3fd71 ******/
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
		/****** md5 signature: f4b3244c5a78bd7cd9f7c60b7f2b75e6 ******/
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
		/****** md5 signature: e82225d5d4e09b88b8ad039d354130e5 ******/
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
		/****** md5 signature: 3b34797cc85f1b510a0affa8833b42d9 ******/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstUParameter;
		double FirstUParameter();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::FirstVParameter ******/
		/****** md5 signature: 04e2fd0b31fdb9ccd9a2db3ea0033b44 ******/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstVParameter;
		double FirstVParameter();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::GetType ******/
		/****** md5 signature: 449da8b3405f13374cd8d9f66145c751 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_SurfaceType

Description
-----------
Returns the type of the surface: Plane, Cylinder, Cone, Sphere, Torus, BezierSurface, BSplineSurface, SurfaceOfRevolution, SurfaceOfExtrusion, OtherSurface.
") GetType;
		GeomAbs_SurfaceType GetType();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::IsUClosed ******/
		/****** md5 signature: 91c191879c9b39e0c4f123772c17dbd2 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUClosed;
		bool IsUClosed();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::IsUPeriodic ******/
		/****** md5 signature: 7236661160e2b4989ea98f769e60fafb ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUPeriodic;
		bool IsUPeriodic();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::IsURational ******/
		/****** md5 signature: a2496b20d14d31a116825513bae2afcd ******/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsURational;
		bool IsURational();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::IsVClosed ******/
		/****** md5 signature: b42d07343ce292533f9bd94d419cf3f6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVClosed;
		bool IsVClosed();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::IsVPeriodic ******/
		/****** md5 signature: 0654a6d88753f46bfbed67995e913efa ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::IsVRational ******/
		/****** md5 signature: a372cfe96ee85490dfdd8a9905fccc55 ******/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVRational;
		bool IsVRational();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::LastUParameter ******/
		/****** md5 signature: e92217a3f489afcceae09778713fa6ea ******/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastUParameter;
		double LastUParameter();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::LastVParameter ******/
		/****** md5 signature: 264cb783d4e8de6c30b6d8102f4caa8c ******/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastVParameter;
		double LastVParameter();

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
Changes the Curve.
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
Changes the Direction.
") Load;
		void Load(const gp_Dir & V);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::NbUIntervals ******/
		/****** md5 signature: 4a0e99d191f66cbed14931fc697354f3 ******/
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
Returns the number of U intervals for continuity <S>. May be one if UContinuity(me) >= <S>.
") NbUIntervals;
		int NbUIntervals(const GeomAbs_Shape S);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::NbUPoles ******/
		/****** md5 signature: 5011752e7f57399068c3e11d28ac4d8a ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUPoles;
		int NbUPoles();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::NbVIntervals ******/
		/****** md5 signature: ec7c8eea10888bbaeb74f56a34fc6af1 ******/
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
Returns the number of V intervals for continuity <S>. May be one if VContinuity(me) >= <S>.
") NbVIntervals;
		int NbVIntervals(const GeomAbs_Shape S);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::Plane ******/
		/****** md5 signature: 60fc0b62d6b3f27638f11ea963b523f7 ******/
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
		/****** md5 signature: 7aa156a18d0b7bf72bf05655ccd9ffff ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		opencascade::handle<Adaptor3d_Surface> ShallowCopy();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::Sphere ******/
		/****** md5 signature: 2ad96025b6f047093038a616d097ceae ******/
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
		/****** md5 signature: e3d8b3166c4d170ce4f0eb64ffeae486 ******/
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
		/****** md5 signature: ade4d04439e04c72cc7414c0ec4a29a8 ******/
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
		/****** md5 signature: fca90e3f2f4c1ba6e7bc9cbc04110d23 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		int UDegree();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::UIntervals ******/
		/****** md5 signature: 6994811896db22ce8af785fb3194a1dc ******/
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
Returns the intervals with the requested continuity in the U direction.
") UIntervals;
		void UIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::UPeriod ******/
		/****** md5 signature: 0ac7288e2577dfedb94dacb3d9a60302 ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") UPeriod;
		double UPeriod();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::UResolution ******/
		/****** md5 signature: 8db9b159a7bf4bfe0753b953109a6bbd ******/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
Returns the parametric U resolution corresponding to the real space resolution <R3d>.
") UResolution;
		double UResolution(const double R3d);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::UTrim ******/
		/****** md5 signature: d065f303d0a2948f4ff7102b479c7aa6 ******/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns a surface trimmed in the U direction equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") UTrim;
		opencascade::handle<Adaptor3d_Surface> UTrim(const double First, const double Last, const double Tol);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::VContinuity ******/
		/****** md5 signature: 7db46254d043ce61da12775dc816a925 ******/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Return CN.
") VContinuity;
		GeomAbs_Shape VContinuity();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::VIntervals ******/
		/****** md5 signature: a2cbea5fb0c66ee7a577bf7b7a8aa6ea ******/
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
Returns the intervals with the requested continuity in the V direction.
") VIntervals;
		void VIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::VPeriod ******/
		/****** md5 signature: 59a61c3d75ffd436a26d1e119e233654 ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") VPeriod;
		double VPeriod();

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::VResolution ******/
		/****** md5 signature: 7d4c767dc5a3559454fc0c9681d327c0 ******/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
Returns the parametric V resolution corresponding to the real space resolution <R3d>.
") VResolution;
		double VResolution(const double R3d);

		/****** GeomAdaptor_SurfaceOfLinearExtrusion::VTrim ******/
		/****** md5 signature: d4060f4796d31b403a0bbdb7b3c4cc96 ******/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns a surface trimmed in the V direction between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") VTrim;
		opencascade::handle<Adaptor3d_Surface> VTrim(const double First, const double Last, const double Tol);

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
The Curve is loaded.
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
The Curve and the Direction are loaded.
") GeomAdaptor_SurfaceOfRevolution;
		 GeomAdaptor_SurfaceOfRevolution(const opencascade::handle<Adaptor3d_Curve> & C, const gp_Ax1 & V);

		/****** GeomAdaptor_SurfaceOfRevolution::AxeOfRevolution ******/
		/****** md5 signature: d1efe882bcb9f42b1937beb2fb773ec6 ******/
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
		/****** md5 signature: 8fde07817a4bc7940e9febcd357d3f61 ******/
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
		/****** md5 signature: 5b4605e53987d121f30b9516d7561fb1 ******/
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
		/****** md5 signature: d3c3048c9ceead5583877ee745b6f3b3 ******/
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
		/****** md5 signature: f0efa0c0c395b3d1aaec8b678ed3fd71 ******/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "Return
-------
gp_Cone

Description
-----------
Apex of the Cone = Cone.Position().Location() ==> ReferenceRadius = 0.
") Cone;
		gp_Cone Cone();

		/****** GeomAdaptor_SurfaceOfRevolution::Cylinder ******/
		/****** md5 signature: f4b3244c5a78bd7cd9f7c60b7f2b75e6 ******/
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
		/****** md5 signature: 3b34797cc85f1b510a0affa8833b42d9 ******/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstUParameter;
		double FirstUParameter();

		/****** GeomAdaptor_SurfaceOfRevolution::FirstVParameter ******/
		/****** md5 signature: 04e2fd0b31fdb9ccd9a2db3ea0033b44 ******/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstVParameter;
		double FirstVParameter();

		/****** GeomAdaptor_SurfaceOfRevolution::GetType ******/
		/****** md5 signature: 449da8b3405f13374cd8d9f66145c751 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_SurfaceType

Description
-----------
Returns the type of the surface: Plane, Cylinder, Cone, Sphere, Torus, BezierSurface, BSplineSurface, SurfaceOfRevolution, SurfaceOfExtrusion, OtherSurface.
") GetType;
		GeomAbs_SurfaceType GetType();

		/****** GeomAdaptor_SurfaceOfRevolution::IsUClosed ******/
		/****** md5 signature: 91c191879c9b39e0c4f123772c17dbd2 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUClosed;
		bool IsUClosed();

		/****** GeomAdaptor_SurfaceOfRevolution::IsUPeriodic ******/
		/****** md5 signature: 7236661160e2b4989ea98f769e60fafb ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUPeriodic;
		bool IsUPeriodic();

		/****** GeomAdaptor_SurfaceOfRevolution::IsURational ******/
		/****** md5 signature: a2496b20d14d31a116825513bae2afcd ******/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsURational;
		bool IsURational();

		/****** GeomAdaptor_SurfaceOfRevolution::IsVClosed ******/
		/****** md5 signature: b42d07343ce292533f9bd94d419cf3f6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVClosed;
		bool IsVClosed();

		/****** GeomAdaptor_SurfaceOfRevolution::IsVPeriodic ******/
		/****** md5 signature: 0654a6d88753f46bfbed67995e913efa ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** GeomAdaptor_SurfaceOfRevolution::IsVRational ******/
		/****** md5 signature: a372cfe96ee85490dfdd8a9905fccc55 ******/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVRational;
		bool IsVRational();

		/****** GeomAdaptor_SurfaceOfRevolution::LastUParameter ******/
		/****** md5 signature: e92217a3f489afcceae09778713fa6ea ******/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastUParameter;
		double LastUParameter();

		/****** GeomAdaptor_SurfaceOfRevolution::LastVParameter ******/
		/****** md5 signature: 264cb783d4e8de6c30b6d8102f4caa8c ******/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastVParameter;
		double LastVParameter();

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
Changes the Curve.
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
Changes the Direction.
") Load;
		void Load(const gp_Ax1 & V);

		/****** GeomAdaptor_SurfaceOfRevolution::NbUIntervals ******/
		/****** md5 signature: 4a0e99d191f66cbed14931fc697354f3 ******/
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
Returns the number of U intervals for continuity <S>. May be one if UContinuity(me) >= <S>.
") NbUIntervals;
		int NbUIntervals(const GeomAbs_Shape S);

		/****** GeomAdaptor_SurfaceOfRevolution::NbVIntervals ******/
		/****** md5 signature: ec7c8eea10888bbaeb74f56a34fc6af1 ******/
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
Returns the number of V intervals for continuity <S>. May be one if VContinuity(me) >= <S>.
") NbVIntervals;
		int NbVIntervals(const GeomAbs_Shape S);

		/****** GeomAdaptor_SurfaceOfRevolution::NbVKnots ******/
		/****** md5 signature: 48a662c9885a4cfafb3aee6695bc8b14 ******/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVKnots;
		int NbVKnots();

		/****** GeomAdaptor_SurfaceOfRevolution::NbVPoles ******/
		/****** md5 signature: bc79fcef9984de53f249da2e7edfb93b ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVPoles;
		int NbVPoles();

		/****** GeomAdaptor_SurfaceOfRevolution::Plane ******/
		/****** md5 signature: 60fc0b62d6b3f27638f11ea963b523f7 ******/
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
		/****** md5 signature: 7aa156a18d0b7bf72bf05655ccd9ffff ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		opencascade::handle<Adaptor3d_Surface> ShallowCopy();

		/****** GeomAdaptor_SurfaceOfRevolution::Sphere ******/
		/****** md5 signature: 2ad96025b6f047093038a616d097ceae ******/
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
		/****** md5 signature: e3d8b3166c4d170ce4f0eb64ffeae486 ******/
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
		/****** md5 signature: ade4d04439e04c72cc7414c0ec4a29a8 ******/
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
		/****** md5 signature: 6994811896db22ce8af785fb3194a1dc ******/
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
Returns the intervals with the requested continuity in the U direction.
") UIntervals;
		void UIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomAdaptor_SurfaceOfRevolution::UPeriod ******/
		/****** md5 signature: 0ac7288e2577dfedb94dacb3d9a60302 ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") UPeriod;
		double UPeriod();

		/****** GeomAdaptor_SurfaceOfRevolution::UResolution ******/
		/****** md5 signature: 8db9b159a7bf4bfe0753b953109a6bbd ******/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
Returns the parametric U resolution corresponding to the real space resolution <R3d>.
") UResolution;
		double UResolution(const double R3d);

		/****** GeomAdaptor_SurfaceOfRevolution::UTrim ******/
		/****** md5 signature: d065f303d0a2948f4ff7102b479c7aa6 ******/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns a surface trimmed in the U direction equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") UTrim;
		opencascade::handle<Adaptor3d_Surface> UTrim(const double First, const double Last, const double Tol);

		/****** GeomAdaptor_SurfaceOfRevolution::VContinuity ******/
		/****** md5 signature: 7db46254d043ce61da12775dc816a925 ******/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Return CN.
") VContinuity;
		GeomAbs_Shape VContinuity();

		/****** GeomAdaptor_SurfaceOfRevolution::VDegree ******/
		/****** md5 signature: c793f94fb8ca1e7cdd3fc97529f675d2 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		int VDegree();

		/****** GeomAdaptor_SurfaceOfRevolution::VIntervals ******/
		/****** md5 signature: a2cbea5fb0c66ee7a577bf7b7a8aa6ea ******/
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
Returns the intervals with the requested continuity in the V direction.
") VIntervals;
		void VIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomAdaptor_SurfaceOfRevolution::VPeriod ******/
		/****** md5 signature: 59a61c3d75ffd436a26d1e119e233654 ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") VPeriod;
		double VPeriod();

		/****** GeomAdaptor_SurfaceOfRevolution::VResolution ******/
		/****** md5 signature: 7d4c767dc5a3559454fc0c9681d327c0 ******/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
Returns the parametric V resolution corresponding to the real space resolution <R3d>.
") VResolution;
		double VResolution(const double R3d);

		/****** GeomAdaptor_SurfaceOfRevolution::VTrim ******/
		/****** md5 signature: d4060f4796d31b403a0bbdb7b3c4cc96 ******/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns a surface trimmed in the V direction between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") VTrim;
		opencascade::handle<Adaptor3d_Surface> VTrim(const double First, const double Last, const double Tol);

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
