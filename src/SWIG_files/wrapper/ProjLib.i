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
%define PROJLIBDOCSTRING
"ProjLib module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_projlib.html"
%enddef
%module (package="OCC.Core", docstring=PROJLIBDOCSTRING) ProjLib


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
#include<ProjLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<AppParCurves_module.hxx>
#include<math_module.hxx>
#include<Geom_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColgp.i
%import Adaptor3d.i
%import Geom2d.i
%import gp.i
%import Adaptor2d.i
%import GeomAbs.i
%import TColStd.i
%import AppParCurves.i
%import math.i
%import Geom.i
%import GeomAdaptor.i

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
%wrap_handle(ProjLib_HCompProjectedCurve)
%wrap_handle(ProjLib_HProjectedCurve)
%wrap_handle(ProjLib_HSequenceOfHSequenceOfPnt)
/* end handles declaration */

/* templates */
%template(ProjLib_SequenceOfHSequenceOfPnt) NCollection_Sequence<opencascade::handle<TColgp_HSequenceOfPnt>>;

%extend NCollection_Sequence<opencascade::handle<TColgp_HSequenceOfPnt>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<opencascade::handle<TColgp_HSequenceOfPnt>> ProjLib_SequenceOfHSequenceOfPnt;
/* end typedefs declaration */

/****************
* class ProjLib *
****************/
%rename(projlib) ProjLib;
class ProjLib {
	public:
		/****************** IsAnaSurf ******************/
		/**** md5 signature: 4ea8d0e9af36abaf035c27a554ceb7fa ****/
		%feature("compactdefaultargs") IsAnaSurf;
		%feature("autodoc", "Returns 'true' if surface is analytical, that is it can be plane, cylinder, cone, sphere, torus. for all other types of surface method returns 'false'.

Parameters
----------
theAS: Adaptor3d_HSurface

Returns
-------
bool
") IsAnaSurf;
		static Standard_Boolean IsAnaSurf(const opencascade::handle<Adaptor3d_HSurface> & theAS);

		/****************** MakePCurveOfType ******************/
		/**** md5 signature: 874915f47cdfd90614a48c32012a43ce ****/
		%feature("compactdefaultargs") MakePCurveOfType;
		%feature("autodoc", "Make empty p-curve <ac> of relevant to <pc> type.

Parameters
----------
PC: ProjLib_ProjectedCurve
aC: Geom2d_Curve

Returns
-------
None
") MakePCurveOfType;
		static void MakePCurveOfType(const ProjLib_ProjectedCurve & PC, opencascade::handle<Geom2d_Curve> & aC);

		/****************** Project ******************/
		/**** md5 signature: 949c33d58d58c76d4868cb60c2ab256e ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pl: gp_Pln
P: gp_Pnt

Returns
-------
gp_Pnt2d
") Project;
		static gp_Pnt2d Project(const gp_Pln & Pl, const gp_Pnt & P);

		/****************** Project ******************/
		/**** md5 signature: eca1016506f177503ec785690587dc69 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pl: gp_Pln
L: gp_Lin

Returns
-------
gp_Lin2d
") Project;
		static gp_Lin2d Project(const gp_Pln & Pl, const gp_Lin & L);

		/****************** Project ******************/
		/**** md5 signature: 3f74e50ee12a439644b147fcfa0bc16d ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pl: gp_Pln
C: gp_Circ

Returns
-------
gp_Circ2d
") Project;
		static gp_Circ2d Project(const gp_Pln & Pl, const gp_Circ & C);

		/****************** Project ******************/
		/**** md5 signature: 551df2158f2317754ff71e6035467a92 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pl: gp_Pln
E: gp_Elips

Returns
-------
gp_Elips2d
") Project;
		static gp_Elips2d Project(const gp_Pln & Pl, const gp_Elips & E);

		/****************** Project ******************/
		/**** md5 signature: 973bf3782261f3d9d3b89aaf9fa4e866 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pl: gp_Pln
P: gp_Parab

Returns
-------
gp_Parab2d
") Project;
		static gp_Parab2d Project(const gp_Pln & Pl, const gp_Parab & P);

		/****************** Project ******************/
		/**** md5 signature: fb027387de49af77632b9ec27c52d6d4 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pl: gp_Pln
H: gp_Hypr

Returns
-------
gp_Hypr2d
") Project;
		static gp_Hypr2d Project(const gp_Pln & Pl, const gp_Hypr & H);

		/****************** Project ******************/
		/**** md5 signature: 7ebfddafd09602e7079b732d33848049 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
Cy: gp_Cylinder
P: gp_Pnt

Returns
-------
gp_Pnt2d
") Project;
		static gp_Pnt2d Project(const gp_Cylinder & Cy, const gp_Pnt & P);

		/****************** Project ******************/
		/**** md5 signature: 3eb41f5296065715c9e98e5ceb5020b8 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
Cy: gp_Cylinder
L: gp_Lin

Returns
-------
gp_Lin2d
") Project;
		static gp_Lin2d Project(const gp_Cylinder & Cy, const gp_Lin & L);

		/****************** Project ******************/
		/**** md5 signature: 135324ba07a47358fbcb648c5d8c8874 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
Cy: gp_Cylinder
Ci: gp_Circ

Returns
-------
gp_Lin2d
") Project;
		static gp_Lin2d Project(const gp_Cylinder & Cy, const gp_Circ & Ci);

		/****************** Project ******************/
		/**** md5 signature: 8a8c39fd3c683267379509e086c7ff0c ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
Co: gp_Cone
P: gp_Pnt

Returns
-------
gp_Pnt2d
") Project;
		static gp_Pnt2d Project(const gp_Cone & Co, const gp_Pnt & P);

		/****************** Project ******************/
		/**** md5 signature: 8068f828d68058faafd1b05d85dd3688 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
Co: gp_Cone
L: gp_Lin

Returns
-------
gp_Lin2d
") Project;
		static gp_Lin2d Project(const gp_Cone & Co, const gp_Lin & L);

		/****************** Project ******************/
		/**** md5 signature: 13aa56d871d7506e0ec67ae1867a3def ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
Co: gp_Cone
Ci: gp_Circ

Returns
-------
gp_Lin2d
") Project;
		static gp_Lin2d Project(const gp_Cone & Co, const gp_Circ & Ci);

		/****************** Project ******************/
		/**** md5 signature: b2c2b1472acdbe031769f69dccc727f1 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sp: gp_Sphere
P: gp_Pnt

Returns
-------
gp_Pnt2d
") Project;
		static gp_Pnt2d Project(const gp_Sphere & Sp, const gp_Pnt & P);

		/****************** Project ******************/
		/**** md5 signature: f88c8dc389e17089da68568facc54b4a ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sp: gp_Sphere
Ci: gp_Circ

Returns
-------
gp_Lin2d
") Project;
		static gp_Lin2d Project(const gp_Sphere & Sp, const gp_Circ & Ci);

		/****************** Project ******************/
		/**** md5 signature: 054ff1e48949731e2a6487b89c2d4440 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
To: gp_Torus
P: gp_Pnt

Returns
-------
gp_Pnt2d
") Project;
		static gp_Pnt2d Project(const gp_Torus & To, const gp_Pnt & P);

		/****************** Project ******************/
		/**** md5 signature: 7fb7ca184b19a3fdf92d7f8f67ee6de5 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
To: gp_Torus
Ci: gp_Circ

Returns
-------
gp_Lin2d
") Project;
		static gp_Lin2d Project(const gp_Torus & To, const gp_Circ & Ci);

};


%extend ProjLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class ProjLib_CompProjectedCurve *
***********************************/
class ProjLib_CompProjectedCurve : public Adaptor2d_Curve2d {
	public:
		/****************** ProjLib_CompProjectedCurve ******************/
		/**** md5 signature: f94fb89bf12d8a43fd90a7811e0cf449 ****/
		%feature("compactdefaultargs") ProjLib_CompProjectedCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve();

		/****************** ProjLib_CompProjectedCurve ******************/
		/**** md5 signature: a7e3e034951b8cd0d4ce3b91b069b3d9 ****/
		%feature("compactdefaultargs") ProjLib_CompProjectedCurve;
		%feature("autodoc", "Try to find all solutions.

Parameters
----------
S: Adaptor3d_HSurface
C: Adaptor3d_HCurve
TolU: float
TolV: float

Returns
-------
None
") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve(const opencascade::handle<Adaptor3d_HSurface> & S, const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real TolU, const Standard_Real TolV);

		/****************** ProjLib_CompProjectedCurve ******************/
		/**** md5 signature: a16b7212abfd4e7d3504b464616d2397 ****/
		%feature("compactdefaultargs") ProjLib_CompProjectedCurve;
		%feature("autodoc", "This constructor tries to optimize the search using the assumption that maximum distance between surface and curve less or equal then maxdist. if maxdist < 0 then algorithm works as above.

Parameters
----------
S: Adaptor3d_HSurface
C: Adaptor3d_HCurve
TolU: float
TolV: float
MaxDist: float

Returns
-------
None
") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve(const opencascade::handle<Adaptor3d_HSurface> & S, const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real TolU, const Standard_Real TolV, const Standard_Real MaxDist);

		/****************** Bounds ******************/
		/**** md5 signature: 24282d415a0402b2ddb398db6e27be97 ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the bounds of the continuous part corresponding to index.

Parameters
----------
Index: int

Returns
-------
Udeb: float
Ufin: float
") Bounds;
		void Bounds(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D0 ******************/
		/**** md5 signature: 01a5234aae6db090351bac35b3718fd9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

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

		/****************** DN ******************/
		/**** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if n < 1. raised if n > 2.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the first parameter of the curve c which has a projection on s.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetCurve ******************/
		/**** md5 signature: 2dafd2c1a86bd5912cda3a4f5114b0ca ****/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		const opencascade::handle<Adaptor3d_HCurve> & GetCurve();

		/****************** GetSequence ******************/
		/**** md5 signature: e9bad1b71015b635dfab48628ac28803 ****/
		%feature("compactdefaultargs") GetSequence;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ProjLib_HSequenceOfHSequenceOfPnt>
") GetSequence;
		const opencascade::handle<ProjLib_HSequenceOfHSequenceOfPnt> & GetSequence();

		/****************** GetSurface ******************/
		/**** md5 signature: a4a1c7c92c718762dc89945deb151cb7 ****/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") GetSurface;
		const opencascade::handle<Adaptor3d_HSurface> & GetSurface();

		/****************** GetTolerance ******************/
		/**** md5 signature: f8936a6db95965d7ff78da376cdea110 ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
TolU: float
TolV: float
") GetTolerance;
		void GetTolerance(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetType ******************/
		/**** md5 signature: 0ad61dcbb5497908c1b536e766f0fcb9 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Computes a set of projected point and determine the continuous parts of the projected curves. the points corresponding to a projection on the bounds of the surface are included in this set of points.

Returns
-------
None
") Init;
		void Init();

		/****************** Intervals ******************/
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Returns the parameters corresponding to s discontinuities. //! the array must provide enough room to accommodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsSinglePnt ******************/
		/**** md5 signature: 70383fe20b1486dc33c916506522c29c ****/
		%feature("compactdefaultargs") IsSinglePnt;
		%feature("autodoc", "Returns true if part of projection with number index is a single point and writes its coordinates in p.

Parameters
----------
Index: int
P: gp_Pnt2d

Returns
-------
bool
") IsSinglePnt;
		Standard_Boolean IsSinglePnt(const Standard_Integer Index, gp_Pnt2d & P);

		/****************** IsUIso ******************/
		/**** md5 signature: 0da8c4d53f3c9094e5e1b4e09fe114bf ****/
		%feature("compactdefaultargs") IsUIso;
		%feature("autodoc", "Returns true if part of projection with number index is an u-isoparametric curve of input surface.

Parameters
----------
Index: int

Returns
-------
U: float
") IsUIso;
		Standard_Boolean IsUIso(const Standard_Integer Index, Standard_Real &OutValue);

		/****************** IsVIso ******************/
		/**** md5 signature: 6a215f05da42b246ea3bd3ec9c13a2bc ****/
		%feature("compactdefaultargs") IsVIso;
		%feature("autodoc", "Returns true if part of projection with number index is an v-isoparametric curve of input surface.

Parameters
----------
Index: int

Returns
-------
V: float
") IsVIso;
		Standard_Boolean IsVIso(const Standard_Integer Index, Standard_Real &OutValue);

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the last parameter of the curve c which has a projection on s.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Load ******************/
		/**** md5 signature: 4e28ad4f267fb2bf6f257a9658f019ac ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Changes the surface.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Adaptor3d_HSurface> & S);

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

		/****************** MaxDistance ******************/
		/**** md5 signature: 2482e25dc8d2cba55f7f64c41a0160e5 ****/
		%feature("compactdefaultargs") MaxDistance;
		%feature("autodoc", "Returns the maximum distance between curve to project and surface.

Parameters
----------
Index: int

Returns
-------
float
") MaxDistance;
		Standard_Real MaxDistance(const Standard_Integer Index);

		/****************** NbCurves ******************/
		/**** md5 signature: f7f6dbd981df076443155a5a87b5c223 ****/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Returns the number of continuous part of the projected curve.

Returns
-------
int
") NbCurves;
		Standard_Integer NbCurves();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals which define an s continuous part of the projected curve.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Trim ******************/
		/**** md5 signature: 623ded740078dacb8936ca103506ad99 ****/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a curve equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 2d points confusion. if <first> >= <last>.

Parameters
----------
FirstParam: float
LastParam: float
Tol: float

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Trim;
		opencascade::handle<Adaptor2d_HCurve2d> Trim(const Standard_Real FirstParam, const Standard_Real LastParam, const Standard_Real Tol);

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


%extend ProjLib_CompProjectedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class ProjLib_ComputeApprox *
******************************/
class ProjLib_ComputeApprox {
	public:
		/****************** ProjLib_ComputeApprox ******************/
		/**** md5 signature: 95b9f22fbf7194a43c851f03bd43f05d ****/
		%feature("compactdefaultargs") ProjLib_ComputeApprox;
		%feature("autodoc", "Empty constructor, it only sets some initial values for class fields.

Returns
-------
None
") ProjLib_ComputeApprox;
		 ProjLib_ComputeApprox();

		/****************** ProjLib_ComputeApprox ******************/
		/**** md5 signature: 7c4894bf0bb138d2510fbc65a69a6a10 ****/
		%feature("compactdefaultargs") ProjLib_ComputeApprox;
		%feature("autodoc", "<tol> is the tolerance with which the approximation is performed. other parameters for approximation have default values.

Parameters
----------
C: Adaptor3d_HCurve
S: Adaptor3d_HSurface
Tol: float

Returns
-------
None
") ProjLib_ComputeApprox;
		 ProjLib_ComputeApprox(const opencascade::handle<Adaptor3d_HCurve> & C, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real Tol);

		/****************** BSpline ******************/
		/**** md5 signature: 990ef8e312bcecfd89dc4fcce5384c7d ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		/**** md5 signature: 41032442357596356ca52db8dddd69b1 ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****************** Perform ******************/
		/**** md5 signature: d446ecbf3a39591baf4f9c1dc6ae542d ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs projecting. in case of approximation current values of parameters are used: default values or set by corresponding methods set...

Parameters
----------
C: Adaptor3d_HCurve
S: Adaptor3d_HSurface

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HCurve> & C, const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** SetBndPnt ******************/
		/**** md5 signature: 83e95ddb03e3f36471306d61ee8ca703 ****/
		%feature("compactdefaultargs") SetBndPnt;
		%feature("autodoc", "Set the parameter, which defines type of boundary condition between segments during approximation. it can be appparcurves_passpoint or appparcurves_tangencypoint. default value is appparcurves_tangencypoint;.

Parameters
----------
theBndPnt: AppParCurves_Constraint

Returns
-------
None
") SetBndPnt;
		void SetBndPnt(const AppParCurves_Constraint theBndPnt);

		/****************** SetDegree ******************/
		/**** md5 signature: ffcf5e6cbd874da2728e3f4a3cf72725 ****/
		%feature("compactdefaultargs") SetDegree;
		%feature("autodoc", "Set min and max possible degree of result bspline curve2d, which is got by approximation. if thedegmin/max < 0, algorithm uses values that are chosen depending of types curve 3d and surface.

Parameters
----------
theDegMin: int
theDegMax: int

Returns
-------
None
") SetDegree;
		void SetDegree(const Standard_Integer theDegMin, const Standard_Integer theDegMax);

		/****************** SetMaxSegments ******************/
		/**** md5 signature: 649dded305ab339e1c7f2a819b32eedd ****/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "Set the parameter, which defines maximal value of parametric intervals the projected curve can be cut for approximation. if themaxsegments < 0, algorithm uses default value = 1000.

Parameters
----------
theMaxSegments: int

Returns
-------
None
") SetMaxSegments;
		void SetMaxSegments(const Standard_Integer theMaxSegments);

		/****************** SetTolerance ******************/
		/**** md5 signature: 7d5c8334324448b9b7e55a6a6128b57c ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Set tolerance of approximation. default value is precision::confusion().

Parameters
----------
theTolerance: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theTolerance);

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the reached tolerance.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

};


%extend ProjLib_ComputeApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class ProjLib_ComputeApproxOnPolarSurface *
********************************************/
class ProjLib_ComputeApproxOnPolarSurface {
	public:
		/****************** ProjLib_ComputeApproxOnPolarSurface ******************/
		/**** md5 signature: 1ba35999e81175262f23f0c0f4654329 ****/
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "Empty constructor, it only sets some initial values for class fields.

Returns
-------
None
") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface();

		/****************** ProjLib_ComputeApproxOnPolarSurface ******************/
		/**** md5 signature: b7e66678196ac14f3227b34265a75e1f ****/
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "Constructor, which performs projecting.

Parameters
----------
C: Adaptor3d_HCurve
S: Adaptor3d_HSurface
Tol: float,optional
	default value is 1.0e-4

Returns
-------
None
") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface(const opencascade::handle<Adaptor3d_HCurve> & C, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real Tol = 1.0e-4);

		/****************** ProjLib_ComputeApproxOnPolarSurface ******************/
		/**** md5 signature: 900fa8ca5834433b6602044e5be38c2e ****/
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "Constructor, which performs projecting, using initial curve 2d initcurve2d, which is any rough approximation of result curve. parameter tol is 3d tolerance of approximation.

Parameters
----------
InitCurve2d: Adaptor2d_HCurve2d
C: Adaptor3d_HCurve
S: Adaptor3d_HSurface
Tol: float

Returns
-------
None
") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface(const opencascade::handle<Adaptor2d_HCurve2d> & InitCurve2d, const opencascade::handle<Adaptor3d_HCurve> & C, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real Tol);

		/****************** ProjLib_ComputeApproxOnPolarSurface ******************/
		/**** md5 signature: 845e5d8bb0f9f41dd87c48de8e627404 ****/
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "Constructor, which performs projecting, using two initial curves 2d: initcurve2d and initcurve2dbis that are any rough approximations of result curves. this constructor is used to get two pcurves for seem edge. parameter tol is 3d tolerance of approximation.

Parameters
----------
InitCurve2d: Adaptor2d_HCurve2d
InitCurve2dBis: Adaptor2d_HCurve2d
C: Adaptor3d_HCurve
S: Adaptor3d_HSurface
Tol: float

Returns
-------
None
") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface(const opencascade::handle<Adaptor2d_HCurve2d> & InitCurve2d, const opencascade::handle<Adaptor2d_HCurve2d> & InitCurve2dBis, const opencascade::handle<Adaptor3d_HCurve> & C, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real Tol);

		/****************** BSpline ******************/
		/**** md5 signature: 990ef8e312bcecfd89dc4fcce5384c7d ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Returns result curve 2d.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****************** BuildInitialCurve2d ******************/
		/**** md5 signature: 9fdb01557bf42e018e26c2897d17d64e ****/
		%feature("compactdefaultargs") BuildInitialCurve2d;
		%feature("autodoc", "Builds initial 2d curve as bspline with degree = 1 using extrema algoritm. method is used in method perform(...).

Parameters
----------
Curve: Adaptor3d_HCurve
S: Adaptor3d_HSurface

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") BuildInitialCurve2d;
		opencascade::handle<Adaptor2d_HCurve2d> BuildInitialCurve2d(const opencascade::handle<Adaptor3d_HCurve> & Curve, const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Curve2d ******************/
		/**** md5 signature: 2238084fe0748f28af09927c40970ede ****/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Returns second 2d curve.

Returns
-------
opencascade::handle<Geom2d_Curve>
") Curve2d;
		opencascade::handle<Geom2d_Curve> Curve2d();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		/**** md5 signature: d446ecbf3a39591baf4f9c1dc6ae542d ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Method, which performs projecting, using default values of parameters or they must be set by corresponding methods before using.

Parameters
----------
C: Adaptor3d_HCurve
S: Adaptor3d_HSurface

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HCurve> & C, const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Perform ******************/
		/**** md5 signature: 5a33a0b48c117d0ce48bbbe01744bca5 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Method, which performs projecting, using default values of parameters or they must be set by corresponding methods before using. parameter initcurve2d is any rough estimation of 2d result curve.

Parameters
----------
InitCurve2d: Adaptor2d_HCurve2d
C: Adaptor3d_HCurve
S: Adaptor3d_HSurface

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Perform;
		opencascade::handle<Geom2d_BSplineCurve> Perform(const opencascade::handle<Adaptor2d_HCurve2d> & InitCurve2d, const opencascade::handle<Adaptor3d_HCurve> & C, const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** ProjectUsingInitialCurve2d ******************/
		/**** md5 signature: 3e39f2136c785561c6394b72b31783b1 ****/
		%feature("compactdefaultargs") ProjectUsingInitialCurve2d;
		%feature("autodoc", "Method, which performs projecting. method is used in method perform(...).

Parameters
----------
Curve: Adaptor3d_HCurve
S: Adaptor3d_HSurface
InitCurve2d: Adaptor2d_HCurve2d

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") ProjectUsingInitialCurve2d;
		opencascade::handle<Geom2d_BSplineCurve> ProjectUsingInitialCurve2d(const opencascade::handle<Adaptor3d_HCurve> & Curve, const opencascade::handle<Adaptor3d_HSurface> & S, const opencascade::handle<Adaptor2d_HCurve2d> & InitCurve2d);

		/****************** SetBndPnt ******************/
		/**** md5 signature: 83e95ddb03e3f36471306d61ee8ca703 ****/
		%feature("compactdefaultargs") SetBndPnt;
		%feature("autodoc", "Set the parameter, which defines type of boundary condition between segments during approximation. it can be appparcurves_passpoint or appparcurves_tangencypoint. default value is appparcurves_tangencypoint.

Parameters
----------
theBndPnt: AppParCurves_Constraint

Returns
-------
None
") SetBndPnt;
		void SetBndPnt(const AppParCurves_Constraint theBndPnt);

		/****************** SetDegree ******************/
		/**** md5 signature: ffcf5e6cbd874da2728e3f4a3cf72725 ****/
		%feature("compactdefaultargs") SetDegree;
		%feature("autodoc", "Set min and max possible degree of result bspline curve2d, which is got by approximation. if thedegmin/max < 0, algorithm uses values min = 2, max = 8.

Parameters
----------
theDegMin: int
theDegMax: int

Returns
-------
None
") SetDegree;
		void SetDegree(const Standard_Integer theDegMin, const Standard_Integer theDegMax);

		/****************** SetMaxDist ******************/
		/**** md5 signature: 42d3e5302e76e2f097ff4b175c4b2803 ****/
		%feature("compactdefaultargs") SetMaxDist;
		%feature("autodoc", "Set the parameter, which defines maximal possible distance between projected curve and surface. it is used only for projecting on not analytical surfaces. if themaxdist < 0, algoritm uses default value 100.*tolerance. if real distance between curve and surface more then themaxdist, algorithm stops working.

Parameters
----------
theMaxDist: float

Returns
-------
None
") SetMaxDist;
		void SetMaxDist(const Standard_Real theMaxDist);

		/****************** SetMaxSegments ******************/
		/**** md5 signature: 649dded305ab339e1c7f2a819b32eedd ****/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "Set the parameter, which defines maximal value of parametric intervals the projected curve can be cut for approximation. if themaxsegments < 0, algorithm uses default value = 1000.

Parameters
----------
theMaxSegments: int

Returns
-------
None
") SetMaxSegments;
		void SetMaxSegments(const Standard_Integer theMaxSegments);

		/****************** SetTolerance ******************/
		/**** md5 signature: 7d5c8334324448b9b7e55a6a6128b57c ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Set the tolerance used to project the curve on the surface. default value is precision::approximation().

Parameters
----------
theTolerance: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theTolerance);

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the reached tolerance.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

};


%extend ProjLib_ComputeApproxOnPolarSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class ProjLib_HCompProjectedCurve *
************************************/
class ProjLib_HCompProjectedCurve : public Adaptor2d_HCurve2d {
	public:
		/****************** ProjLib_HCompProjectedCurve ******************/
		/**** md5 signature: 3ecaa2ad5d82bf2aa9ff327aab54cf2d ****/
		%feature("compactdefaultargs") ProjLib_HCompProjectedCurve;
		%feature("autodoc", "Creates an empty genhcurve2d.

Returns
-------
None
") ProjLib_HCompProjectedCurve;
		 ProjLib_HCompProjectedCurve();

		/****************** ProjLib_HCompProjectedCurve ******************/
		/**** md5 signature: 9bf654b49337e561275b4a580c472f55 ****/
		%feature("compactdefaultargs") ProjLib_HCompProjectedCurve;
		%feature("autodoc", "Creates a genhcurve2d from a curve.

Parameters
----------
C: ProjLib_CompProjectedCurve

Returns
-------
None
") ProjLib_HCompProjectedCurve;
		 ProjLib_HCompProjectedCurve(const ProjLib_CompProjectedCurve & C);

		/****************** ChangeCurve2d ******************/
		/**** md5 signature: f7f86956c0ba637a0f9c6048de02ef31 ****/
		%feature("compactdefaultargs") ChangeCurve2d;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
ProjLib_CompProjectedCurve
") ChangeCurve2d;
		ProjLib_CompProjectedCurve & ChangeCurve2d();

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
		/**** md5 signature: 8ba622ae759f2a7bf42e2d500d284b8f ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the field of the genhcurve2d.

Parameters
----------
C: ProjLib_CompProjectedCurve

Returns
-------
None
") Set;
		void Set(const ProjLib_CompProjectedCurve & C);

};


%make_alias(ProjLib_HCompProjectedCurve)

%extend ProjLib_HCompProjectedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class ProjLib_HProjectedCurve *
********************************/
class ProjLib_HProjectedCurve : public Adaptor2d_HCurve2d {
	public:
		/****************** ProjLib_HProjectedCurve ******************/
		/**** md5 signature: 88449fe224eecf8f7bbfc5569769b3e9 ****/
		%feature("compactdefaultargs") ProjLib_HProjectedCurve;
		%feature("autodoc", "Creates an empty genhcurve2d.

Returns
-------
None
") ProjLib_HProjectedCurve;
		 ProjLib_HProjectedCurve();

		/****************** ProjLib_HProjectedCurve ******************/
		/**** md5 signature: f04ab940032efcce7bc9fe8d490e5954 ****/
		%feature("compactdefaultargs") ProjLib_HProjectedCurve;
		%feature("autodoc", "Creates a genhcurve2d from a curve.

Parameters
----------
C: ProjLib_ProjectedCurve

Returns
-------
None
") ProjLib_HProjectedCurve;
		 ProjLib_HProjectedCurve(const ProjLib_ProjectedCurve & C);

		/****************** ChangeCurve2d ******************/
		/**** md5 signature: 686f86de8b255b7ca668d5dbaf4b03c6 ****/
		%feature("compactdefaultargs") ChangeCurve2d;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
ProjLib_ProjectedCurve
") ChangeCurve2d;
		ProjLib_ProjectedCurve & ChangeCurve2d();

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
		/**** md5 signature: 785fe0defe0ffbf47b4e01938ce190e7 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the field of the genhcurve2d.

Parameters
----------
C: ProjLib_ProjectedCurve

Returns
-------
None
") Set;
		void Set(const ProjLib_ProjectedCurve & C);

};


%make_alias(ProjLib_HProjectedCurve)

%extend ProjLib_HProjectedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class ProjLib_PrjFunc *
************************/
class ProjLib_PrjFunc : public math_FunctionSetWithDerivatives {
	public:
		/****************** ProjLib_PrjFunc ******************/
		/**** md5 signature: 120b7bc7b0254663e57deac550cc038c ****/
		%feature("compactdefaultargs") ProjLib_PrjFunc;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_CurvePtr
FixVal: float
S: Adaptor3d_SurfacePtr
Fix: int

Returns
-------
None
") ProjLib_PrjFunc;
		 ProjLib_PrjFunc(const Adaptor3d_CurvePtr & C, const Standard_Real FixVal, const Adaptor3d_SurfacePtr & S, const Standard_Integer Fix);

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** NbEquations ******************/
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Solution ******************/
		/**** md5 signature: 8e8f6cfa580b1ef36024e535e8e73ad6 ****/
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "Returns point on surface.

Returns
-------
gp_Pnt2d
") Solution;
		gp_Pnt2d Solution();

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend ProjLib_PrjFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class ProjLib_PrjResolve *
***************************/
class ProjLib_PrjResolve {
	public:
		/****************** ProjLib_PrjResolve ******************/
		/**** md5 signature: 1bab33bfda3e63dc0e1c3c4ad3fb18fc ****/
		%feature("compactdefaultargs") ProjLib_PrjResolve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
Fix: int

Returns
-------
None
") ProjLib_PrjResolve;
		 ProjLib_PrjResolve(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Integer Fix);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		/**** md5 signature: 3e6c7ef4ff8082da8be8b1588435d3c7 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Calculates the ort from c(t) to s with a close point. the close point is defined by the parameter values u0 and v0. the function f(u,v)=distance(s(u,v),c(t)) has an extremum when gradient(f)=0. the algorithm searchs a zero near the close point.

Parameters
----------
t: float
U: float
V: float
Tol: gp_Pnt2d
Inf: gp_Pnt2d
Sup: gp_Pnt2d
FTol: float,optional
	default value is -1
StrictInside: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const Standard_Real t, const Standard_Real U, const Standard_Real V, const gp_Pnt2d & Tol, const gp_Pnt2d & Inf, const gp_Pnt2d & Sup, const Standard_Real FTol = -1, const Standard_Boolean StrictInside = Standard_False);

		/****************** Solution ******************/
		/**** md5 signature: 8e8f6cfa580b1ef36024e535e8e73ad6 ****/
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "Returns the point of the extremum distance.

Returns
-------
gp_Pnt2d
") Solution;
		gp_Pnt2d Solution();

};


%extend ProjLib_PrjResolve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class ProjLib_ProjectOnPlane *
*******************************/
class ProjLib_ProjectOnPlane : public Adaptor3d_Curve {
	public:
		/****************** ProjLib_ProjectOnPlane ******************/
		/**** md5 signature: 9201f86bd4d28811ce8d433e700e3f47 ****/
		%feature("compactdefaultargs") ProjLib_ProjectOnPlane;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ProjLib_ProjectOnPlane;
		 ProjLib_ProjectOnPlane();

		/****************** ProjLib_ProjectOnPlane ******************/
		/**** md5 signature: 85fcf50ca50f2d204cae89c14211254f ****/
		%feature("compactdefaultargs") ProjLib_ProjectOnPlane;
		%feature("autodoc", "The projection will be normal to the plane defined by the ax3 <pl>.

Parameters
----------
Pl: gp_Ax3

Returns
-------
None
") ProjLib_ProjectOnPlane;
		 ProjLib_ProjectOnPlane(const gp_Ax3 & Pl);

		/****************** ProjLib_ProjectOnPlane ******************/
		/**** md5 signature: b5fcc3f652b391960127c8513c231cd6 ****/
		%feature("compactdefaultargs") ProjLib_ProjectOnPlane;
		%feature("autodoc", "The projection will be along the direction <d> on the plane defined by the ax3 <pl>. raises if the direction <d> is parallel to the plane <pl>.

Parameters
----------
Pl: gp_Ax3
D: gp_Dir

Returns
-------
None
") ProjLib_ProjectOnPlane;
		 ProjLib_ProjectOnPlane(const gp_Ax3 & Pl, const gp_Dir & D);

		/****************** BSpline ******************/
		/**** md5 signature: 3ccc0d851302bffb5de6344e3eb3e58d ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Warning ! this will not make a copy of the bspline curve : if you want to modify the curve please make a copy yourself also it will not trim the surface to myfirst/last.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		/**** md5 signature: 092280fc6ee0e7104fbbe3460d73e83c ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Warning ! this will not make a copy of the bezier curve : if you want to modify the curve please make a copy yourself also it will not trim the surface to myfirst/last.

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

		/****************** D0 ******************/
		/**** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

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
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

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
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

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
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

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
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

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
		%feature("autodoc", "No available documentation.

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

		/****************** GetCurve ******************/
		/**** md5 signature: 2dafd2c1a86bd5912cda3a4f5114b0ca ****/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		const opencascade::handle<Adaptor3d_HCurve> & GetCurve();

		/****************** GetDirection ******************/
		/**** md5 signature: b6eb17b51f95e3e399a1271a423f3532 ****/
		%feature("compactdefaultargs") GetDirection;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") GetDirection;
		const gp_Dir GetDirection();

		/****************** GetPlane ******************/
		/**** md5 signature: 692d7c62e51fa3fab33cb1c73afb8b79 ****/
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Ax3
") GetPlane;
		const gp_Ax3 GetPlane();

		/****************** GetResult ******************/
		/**** md5 signature: 10a0abdf9d7ceafa53273593232c8ed6 ****/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomAdaptor_HCurve>
") GetResult;
		const opencascade::handle<GeomAdaptor_HCurve> & GetResult();

		/****************** GetType ******************/
		/**** md5 signature: 0ad61dcbb5497908c1b536e766f0fcb9 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

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
		/**** md5 signature: cf28f5541e4e744dd8038e2a9ac75a8f ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") Line;
		gp_Lin Line();

		/****************** Load ******************/
		/**** md5 signature: f65c8de6d296dca9a6b80f037128bc37 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Sets the curve and perform the projection. if <keepparametrization> is true, the parametrization of the projected curve <pc> will be the same as the parametrization of the initial curve <c>. it meens: proj(c(u)) = pc(u) for each u. otherwize, the parametrization may change.

Parameters
----------
C: Adaptor3d_HCurve
Tolerance: float
KeepParametrization: bool,optional
	default value is Standard_True

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real Tolerance, const Standard_Boolean KeepParametrization = Standard_True);

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

		/****************** Resolution ******************/
		/**** md5 signature: cc4a4d9111fadd20ad48e62bc4df1579 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

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


%extend ProjLib_ProjectOnPlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class ProjLib_ProjectOnSurface *
*********************************/
class ProjLib_ProjectOnSurface {
	public:
		/****************** ProjLib_ProjectOnSurface ******************/
		/**** md5 signature: 0431a0901693272252901143109bd19e ****/
		%feature("compactdefaultargs") ProjLib_ProjectOnSurface;
		%feature("autodoc", "Create an empty projector.

Returns
-------
None
") ProjLib_ProjectOnSurface;
		 ProjLib_ProjectOnSurface();

		/****************** ProjLib_ProjectOnSurface ******************/
		/**** md5 signature: 7ee7d94f2665b6bd5dce8b0872213d02 ****/
		%feature("compactdefaultargs") ProjLib_ProjectOnSurface;
		%feature("autodoc", "Create a projector normaly to the surface <s>.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
None
") ProjLib_ProjectOnSurface;
		 ProjLib_ProjectOnSurface(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** BSpline ******************/
		/**** md5 signature: 496d8648e54b9bba1acabb31d1b7a380 ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

};


%extend ProjLib_ProjectOnSurface {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Load(self):
		pass
	}
};

/*******************************
* class ProjLib_ProjectedCurve *
*******************************/
class ProjLib_ProjectedCurve : public Adaptor2d_Curve2d {
	public:
		/****************** ProjLib_ProjectedCurve ******************/
		/**** md5 signature: ca7ef66025d5e35be37e8ddcf00640a5 ****/
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
		%feature("autodoc", "Empty constructor, it only sets some initial values for class fields.

Returns
-------
None
") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve();

		/****************** ProjLib_ProjectedCurve ******************/
		/**** md5 signature: 6e3d07889a90aa7da697f1d58ace3ab4 ****/
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
		%feature("autodoc", "Constructor with initialisation field mysurface.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
None
") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** ProjLib_ProjectedCurve ******************/
		/**** md5 signature: 10684abd3bdd6a4eb971f33f58b2fcd6 ****/
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
		%feature("autodoc", "Constructor, which performs projecting. if projecting uses approximation, default parameters are used, in particular, 3d tolerance of approximation is precision::confusion().

Parameters
----------
S: Adaptor3d_HSurface
C: Adaptor3d_HCurve

Returns
-------
None
") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve(const opencascade::handle<Adaptor3d_HSurface> & S, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** ProjLib_ProjectedCurve ******************/
		/**** md5 signature: 8a39bf49a3c66e0c953d638824602b0c ****/
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
		%feature("autodoc", "Constructor, which performs projecting. if projecting uses approximation, 3d tolerance is tol, default parameters are used, .

Parameters
----------
S: Adaptor3d_HSurface
C: Adaptor3d_HCurve
Tol: float

Returns
-------
None
") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve(const opencascade::handle<Adaptor3d_HSurface> & S, const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real Tol);

		/****************** BSpline ******************/
		/**** md5 signature: 9439c331c4f14f299277aa5a4ff16cec ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Warning ! this will not make a copy of the bspline curve - if you want to modify the curve please make a copy yourself also it will not trim the surface to myfirst/last.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		/**** md5 signature: cabcbe9e94c679dcfc142972b20ab60b ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Warning ! this will not make a copy of the -- bezier curve - if you want to modify -- the curve please make a copy yourself -- also it will not trim the surface to -- myfirst/last.

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

		/****************** D0 ******************/
		/**** md5 signature: 01a5234aae6db090351bac35b3718fd9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

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

		/****************** GetCurve ******************/
		/**** md5 signature: 2dafd2c1a86bd5912cda3a4f5114b0ca ****/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		const opencascade::handle<Adaptor3d_HCurve> & GetCurve();

		/****************** GetSurface ******************/
		/**** md5 signature: a4a1c7c92c718762dc89945deb151cb7 ****/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") GetSurface;
		const opencascade::handle<Adaptor3d_HSurface> & GetSurface();

		/****************** GetTolerance ******************/
		/**** md5 signature: 0b68579e68d60bdd102d14afab21387e ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance reached if an approximation is done.

Returns
-------
float
") GetTolerance;
		Standard_Real GetTolerance();

		/****************** GetType ******************/
		/**** md5 signature: 0ad61dcbb5497908c1b536e766f0fcb9 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

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

		/****************** Parabola ******************/
		/**** md5 signature: 38729705f952495154cecf7cf9964648 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab2d
") Parabola;
		gp_Parab2d Parabola();

		/****************** Perform ******************/
		/**** md5 signature: b16044d0b6ab4a0f0ebe4930b8cca351 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs projecting for given curve. if projecting uses approximation, approximation parameters can be set before by corresponding methods setdegree(...), setmaxsegmets(...), setbndpnt(...), setmaxdist(...).

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Period ******************/
		/**** md5 signature: 88909a321398632744c0d6841580c626 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** Resolution ******************/
		/**** md5 signature: cc4a4d9111fadd20ad48e62bc4df1579 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****************** SetBndPnt ******************/
		/**** md5 signature: 83e95ddb03e3f36471306d61ee8ca703 ****/
		%feature("compactdefaultargs") SetBndPnt;
		%feature("autodoc", "Set the parameter, which defines type of boundary condition between segments during approximation. it can be appparcurves_passpoint or appparcurves_tangencypoint. default value is appparcurves_tangencypoint;.

Parameters
----------
theBndPnt: AppParCurves_Constraint

Returns
-------
None
") SetBndPnt;
		void SetBndPnt(const AppParCurves_Constraint theBndPnt);

		/****************** SetDegree ******************/
		/**** md5 signature: ffcf5e6cbd874da2728e3f4a3cf72725 ****/
		%feature("compactdefaultargs") SetDegree;
		%feature("autodoc", "Set min and max possible degree of result bspline curve2d, which is got by approximation. if thedegmin/max < 0, algorithm uses values that are chosen depending of types curve 3d and surface.

Parameters
----------
theDegMin: int
theDegMax: int

Returns
-------
None
") SetDegree;
		void SetDegree(const Standard_Integer theDegMin, const Standard_Integer theDegMax);

		/****************** SetMaxDist ******************/
		/**** md5 signature: 42d3e5302e76e2f097ff4b175c4b2803 ****/
		%feature("compactdefaultargs") SetMaxDist;
		%feature("autodoc", "Set the parameter, which degines maximal possible distance between projected curve and surface. it uses only for projecting on not analytical surfaces. if themaxdist < 0, algoritm uses default value 100.*tolerance. if real distance between curve and surface more then themaxdist, algorithm stops working.

Parameters
----------
theMaxDist: float

Returns
-------
None
") SetMaxDist;
		void SetMaxDist(const Standard_Real theMaxDist);

		/****************** SetMaxSegments ******************/
		/**** md5 signature: 649dded305ab339e1c7f2a819b32eedd ****/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "Set the parameter, which defines maximal value of parametric intervals the projected curve can be cut for approximation. if themaxsegments < 0, algorithm uses default value = 1000.

Parameters
----------
theMaxSegments: int

Returns
-------
None
") SetMaxSegments;
		void SetMaxSegments(const Standard_Integer theMaxSegments);

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


%extend ProjLib_ProjectedCurve {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Load(self):
		pass
	}
};

/**************************
* class ProjLib_Projector *
**************************/
class ProjLib_Projector {
	public:
		/****************** ProjLib_Projector ******************/
		/**** md5 signature: ef9da8370e275855405698ebc84a82bc ****/
		%feature("compactdefaultargs") ProjLib_Projector;
		%feature("autodoc", "Sets the type to othercurve.

Returns
-------
None
") ProjLib_Projector;
		 ProjLib_Projector();

		/****************** BSpline ******************/
		/**** md5 signature: 990ef8e312bcecfd89dc4fcce5384c7d ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		/**** md5 signature: 41032442357596356ca52db8dddd69b1 ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****************** Circle ******************/
		/**** md5 signature: 09c4f90c70c84d6b1770b97835f72183 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ2d
") Circle;
		const gp_Circ2d Circle();

		/****************** Done ******************/
		/**** md5 signature: af7f5634e847c127c6559337ee40c13f ****/
		%feature("compactdefaultargs") Done;
		%feature("autodoc", "Set isdone = standard_true;.

Returns
-------
None
") Done;
		void Done();

		/****************** Ellipse ******************/
		/**** md5 signature: 2afc5e25fd4a7ce70b625443ebc99b1f ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips2d
") Ellipse;
		const gp_Elips2d Ellipse();

		/****************** GetType ******************/
		/**** md5 signature: 6d4e6ae7972633971ba343e8afc91aa1 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		/**** md5 signature: c7404a34ed25db31394b937efbc73c1e ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr2d
") Hyperbola;
		const gp_Hypr2d Hyperbola();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** Line ******************/
		/**** md5 signature: 7beff572f0aed8d7624f49352434b697 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin2d
") Line;
		const gp_Lin2d Line();

		/****************** Parabola ******************/
		/**** md5 signature: 3bb16ea93f13d5d8141b24e8b39a2eac ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab2d
") Parabola;
		const gp_Parab2d Parabola();

		/****************** Project ******************/
		/**** md5 signature: 589ee44f7bf5a85e88204a0bb711cba7 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin

Returns
-------
None
") Project;
		virtual void Project(const gp_Lin & L);

		/****************** Project ******************/
		/**** md5 signature: 101c13716847ea1058a04e9f0da7a7cd ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ

Returns
-------
None
") Project;
		virtual void Project(const gp_Circ & C);

		/****************** Project ******************/
		/**** md5 signature: e59d9bb51202167c4dcadc0195d09266 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: gp_Elips

Returns
-------
None
") Project;
		virtual void Project(const gp_Elips & E);

		/****************** Project ******************/
		/**** md5 signature: 2f0881cd62edab08bd6dcfa095671634 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Parab

Returns
-------
None
") Project;
		virtual void Project(const gp_Parab & P);

		/****************** Project ******************/
		/**** md5 signature: a8352b07b98c3f92ec5b8d139e4a20a9 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
H: gp_Hypr

Returns
-------
None
") Project;
		virtual void Project(const gp_Hypr & H);

		/****************** SetBSpline ******************/
		/**** md5 signature: 0a607edf94dcc9dee6e9ff6ca93aa898 ****/
		%feature("compactdefaultargs") SetBSpline;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_BSplineCurve

Returns
-------
None
") SetBSpline;
		void SetBSpline(const opencascade::handle<Geom2d_BSplineCurve> & C);

		/****************** SetBezier ******************/
		/**** md5 signature: fc2d8fbf79e9e332676e8288abb4a245 ****/
		%feature("compactdefaultargs") SetBezier;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_BezierCurve

Returns
-------
None
") SetBezier;
		void SetBezier(const opencascade::handle<Geom2d_BezierCurve> & C);

		/****************** SetPeriodic ******************/
		/**** md5 signature: 3d498279f2dd83a2ab9aa88181da253f ****/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetPeriodic;
		void SetPeriodic();

		/****************** SetType ******************/
		/**** md5 signature: 394a28550243cb94c4f5414ac7dd76ff ****/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "No available documentation.

Parameters
----------
Type: GeomAbs_CurveType

Returns
-------
None
") SetType;
		void SetType(const GeomAbs_CurveType Type);

		/****************** UFrame ******************/
		/**** md5 signature: 6be8a5e627feaa4a0582c6c70d304526 ****/
		%feature("compactdefaultargs") UFrame;
		%feature("autodoc", "Translates the 2d curve to set the part of the curve [cfirst, clast] in the range [ ufirst, ufirst + period [.

Parameters
----------
CFirst: float
CLast: float
UFirst: float
Period: float

Returns
-------
None
") UFrame;
		void UFrame(const Standard_Real CFirst, const Standard_Real CLast, const Standard_Real UFirst, const Standard_Real Period);

		/****************** VFrame ******************/
		/**** md5 signature: 909aff0356641e788f34769e1a980bc7 ****/
		%feature("compactdefaultargs") VFrame;
		%feature("autodoc", "Translates the 2d curve to set the part of the curve [cfirst, clast] in the range [ vfirst, vfirst + period [.

Parameters
----------
CFirst: float
CLast: float
VFirst: float
Period: float

Returns
-------
None
") VFrame;
		void VFrame(const Standard_Real CFirst, const Standard_Real CLast, const Standard_Real VFirst, const Standard_Real Period);

};


%extend ProjLib_Projector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class ProjLib_Cone *
*********************/
class ProjLib_Cone : public ProjLib_Projector {
	public:
		/****************** ProjLib_Cone ******************/
		/**** md5 signature: 318441d137ac11496333e1f29935a8b9 ****/
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "Undefined projection.

Returns
-------
None
") ProjLib_Cone;
		 ProjLib_Cone();

		/****************** ProjLib_Cone ******************/
		/**** md5 signature: d1916293f69e698db2b1374de22255c0 ****/
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "Projection on the cone <co>.

Parameters
----------
Co: gp_Cone

Returns
-------
None
") ProjLib_Cone;
		 ProjLib_Cone(const gp_Cone & Co);

		/****************** ProjLib_Cone ******************/
		/**** md5 signature: f16d11de7ba5bb03904ee6ec5fcac21d ****/
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "Projection of the line <l> on the cone <co>.

Parameters
----------
Co: gp_Cone
L: gp_Lin

Returns
-------
None
") ProjLib_Cone;
		 ProjLib_Cone(const gp_Cone & Co, const gp_Lin & L);

		/****************** ProjLib_Cone ******************/
		/**** md5 signature: e180f918316453d58a071452a85cafec ****/
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "Projection of the circle <c> on the cone <co>.

Parameters
----------
Co: gp_Cone
C: gp_Circ

Returns
-------
None
") ProjLib_Cone;
		 ProjLib_Cone(const gp_Cone & Co, const gp_Circ & C);

		/****************** Init ******************/
		/**** md5 signature: c1043f134b1073d147138470ac71ee4e ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Co: gp_Cone

Returns
-------
None
") Init;
		void Init(const gp_Cone & Co);

		/****************** Project ******************/
		/**** md5 signature: 4885fc811646ec2cdf7ac927e06e0c63 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin

Returns
-------
None
") Project;
		virtual void Project(const gp_Lin & L);

		/****************** Project ******************/
		/**** md5 signature: 6fbe1029080ce340da91ff8531b665f3 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ

Returns
-------
None
") Project;
		virtual void Project(const gp_Circ & C);

		/****************** Project ******************/
		/**** md5 signature: 14b36b707cac7782c568b50dfa48429a ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: gp_Elips

Returns
-------
None
") Project;
		virtual void Project(const gp_Elips & E);

		/****************** Project ******************/
		/**** md5 signature: 1804b2ebae0f4a73301c6766ae516cdd ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Parab

Returns
-------
None
") Project;
		virtual void Project(const gp_Parab & P);

		/****************** Project ******************/
		/**** md5 signature: 5738fc67fc444aa25b8fbb52fc984455 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
H: gp_Hypr

Returns
-------
None
") Project;
		virtual void Project(const gp_Hypr & H);

};


%extend ProjLib_Cone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class ProjLib_Cylinder *
*************************/
class ProjLib_Cylinder : public ProjLib_Projector {
	public:
		/****************** ProjLib_Cylinder ******************/
		/**** md5 signature: 8c9fb4119d72abe235c2c21571c25c2c ****/
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "Undefined projection.

Returns
-------
None
") ProjLib_Cylinder;
		 ProjLib_Cylinder();

		/****************** ProjLib_Cylinder ******************/
		/**** md5 signature: 522351ff432f6c61e373b02c95a99bd4 ****/
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "Projection on the cylinder <cyl>.

Parameters
----------
Cyl: gp_Cylinder

Returns
-------
None
") ProjLib_Cylinder;
		 ProjLib_Cylinder(const gp_Cylinder & Cyl);

		/****************** ProjLib_Cylinder ******************/
		/**** md5 signature: 4335f013c8ebbe6bf2a1aed7e6ced877 ****/
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "Projection of the line <l> on the cylinder <cyl>.

Parameters
----------
Cyl: gp_Cylinder
L: gp_Lin

Returns
-------
None
") ProjLib_Cylinder;
		 ProjLib_Cylinder(const gp_Cylinder & Cyl, const gp_Lin & L);

		/****************** ProjLib_Cylinder ******************/
		/**** md5 signature: a5b4913fb36bb8d49020c1a5e52ef4cf ****/
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "Projection of the circle <c> on the cylinder <cyl>.

Parameters
----------
Cyl: gp_Cylinder
C: gp_Circ

Returns
-------
None
") ProjLib_Cylinder;
		 ProjLib_Cylinder(const gp_Cylinder & Cyl, const gp_Circ & C);

		/****************** ProjLib_Cylinder ******************/
		/**** md5 signature: c4c73ec14dd4e897e4e5bca2656e1bfa ****/
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "Projection of the ellipse <e> on the cylinder <cyl>.

Parameters
----------
Cyl: gp_Cylinder
E: gp_Elips

Returns
-------
None
") ProjLib_Cylinder;
		 ProjLib_Cylinder(const gp_Cylinder & Cyl, const gp_Elips & E);

		/****************** Init ******************/
		/**** md5 signature: 02301c42dd428bd83e333d3008036049 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Cyl: gp_Cylinder

Returns
-------
None
") Init;
		void Init(const gp_Cylinder & Cyl);

		/****************** Project ******************/
		/**** md5 signature: 4885fc811646ec2cdf7ac927e06e0c63 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin

Returns
-------
None
") Project;
		virtual void Project(const gp_Lin & L);

		/****************** Project ******************/
		/**** md5 signature: 6fbe1029080ce340da91ff8531b665f3 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ

Returns
-------
None
") Project;
		virtual void Project(const gp_Circ & C);

		/****************** Project ******************/
		/**** md5 signature: 14b36b707cac7782c568b50dfa48429a ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: gp_Elips

Returns
-------
None
") Project;
		virtual void Project(const gp_Elips & E);

		/****************** Project ******************/
		/**** md5 signature: 1804b2ebae0f4a73301c6766ae516cdd ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Parab

Returns
-------
None
") Project;
		virtual void Project(const gp_Parab & P);

		/****************** Project ******************/
		/**** md5 signature: 5738fc67fc444aa25b8fbb52fc984455 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
H: gp_Hypr

Returns
-------
None
") Project;
		virtual void Project(const gp_Hypr & H);

};


%extend ProjLib_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class ProjLib_Plane *
**********************/
class ProjLib_Plane : public ProjLib_Projector {
	public:
		/****************** ProjLib_Plane ******************/
		/**** md5 signature: 2123655f29cdbd03fd79704583d969ca ****/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "Undefined projection.

Returns
-------
None
") ProjLib_Plane;
		 ProjLib_Plane();

		/****************** ProjLib_Plane ******************/
		/**** md5 signature: c5cb47712f425c642927a0e685db5552 ****/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "Projection on the plane <pl>.

Parameters
----------
Pl: gp_Pln

Returns
-------
None
") ProjLib_Plane;
		 ProjLib_Plane(const gp_Pln & Pl);

		/****************** ProjLib_Plane ******************/
		/**** md5 signature: c9ffa4b372c0fe04dedd2d1d0add0c56 ****/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "Projection of the line <l> on the plane <pl>.

Parameters
----------
Pl: gp_Pln
L: gp_Lin

Returns
-------
None
") ProjLib_Plane;
		 ProjLib_Plane(const gp_Pln & Pl, const gp_Lin & L);

		/****************** ProjLib_Plane ******************/
		/**** md5 signature: 0aa6dba36aa81c32c0d583b64d3e12f4 ****/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "Projection of the circle <c> on the plane <pl>.

Parameters
----------
Pl: gp_Pln
C: gp_Circ

Returns
-------
None
") ProjLib_Plane;
		 ProjLib_Plane(const gp_Pln & Pl, const gp_Circ & C);

		/****************** ProjLib_Plane ******************/
		/**** md5 signature: 45b7d50f09033271bfa01a9245642943 ****/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "Projection of the ellipse <e> on the plane <pl>.

Parameters
----------
Pl: gp_Pln
E: gp_Elips

Returns
-------
None
") ProjLib_Plane;
		 ProjLib_Plane(const gp_Pln & Pl, const gp_Elips & E);

		/****************** ProjLib_Plane ******************/
		/**** md5 signature: 73fb37b85d9e1eb8a4bc32262ab9b40e ****/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "Projection of the parabola <p> on the plane <pl>.

Parameters
----------
Pl: gp_Pln
P: gp_Parab

Returns
-------
None
") ProjLib_Plane;
		 ProjLib_Plane(const gp_Pln & Pl, const gp_Parab & P);

		/****************** ProjLib_Plane ******************/
		/**** md5 signature: 4c8c2c1ab0154ba5dafc68eab0104929 ****/
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "Projection of the hyperbola <h> on the plane <pl>.

Parameters
----------
Pl: gp_Pln
H: gp_Hypr

Returns
-------
None
") ProjLib_Plane;
		 ProjLib_Plane(const gp_Pln & Pl, const gp_Hypr & H);

		/****************** Init ******************/
		/**** md5 signature: d22fb3f7cf80633a3c6360581c6658a8 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pl: gp_Pln

Returns
-------
None
") Init;
		void Init(const gp_Pln & Pl);

		/****************** Project ******************/
		/**** md5 signature: 4885fc811646ec2cdf7ac927e06e0c63 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin

Returns
-------
None
") Project;
		virtual void Project(const gp_Lin & L);

		/****************** Project ******************/
		/**** md5 signature: 6fbe1029080ce340da91ff8531b665f3 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ

Returns
-------
None
") Project;
		virtual void Project(const gp_Circ & C);

		/****************** Project ******************/
		/**** md5 signature: 14b36b707cac7782c568b50dfa48429a ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: gp_Elips

Returns
-------
None
") Project;
		virtual void Project(const gp_Elips & E);

		/****************** Project ******************/
		/**** md5 signature: 1804b2ebae0f4a73301c6766ae516cdd ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Parab

Returns
-------
None
") Project;
		virtual void Project(const gp_Parab & P);

		/****************** Project ******************/
		/**** md5 signature: 5738fc67fc444aa25b8fbb52fc984455 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
H: gp_Hypr

Returns
-------
None
") Project;
		virtual void Project(const gp_Hypr & H);

};


%extend ProjLib_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class ProjLib_Sphere *
***********************/
class ProjLib_Sphere : public ProjLib_Projector {
	public:
		/****************** ProjLib_Sphere ******************/
		/**** md5 signature: 65d87ab72fb51cc0df6824780c1120a9 ****/
		%feature("compactdefaultargs") ProjLib_Sphere;
		%feature("autodoc", "Undefined projection.

Returns
-------
None
") ProjLib_Sphere;
		 ProjLib_Sphere();

		/****************** ProjLib_Sphere ******************/
		/**** md5 signature: 0c808274c7ddfa25b7f11b70978a0869 ****/
		%feature("compactdefaultargs") ProjLib_Sphere;
		%feature("autodoc", "Projection on the sphere <sp>.

Parameters
----------
Sp: gp_Sphere

Returns
-------
None
") ProjLib_Sphere;
		 ProjLib_Sphere(const gp_Sphere & Sp);

		/****************** ProjLib_Sphere ******************/
		/**** md5 signature: b3d4cc0ab23ea2a057043d19aa5bb8f7 ****/
		%feature("compactdefaultargs") ProjLib_Sphere;
		%feature("autodoc", "Projection of the circle <c> on the sphere <sp>.

Parameters
----------
Sp: gp_Sphere
C: gp_Circ

Returns
-------
None
") ProjLib_Sphere;
		 ProjLib_Sphere(const gp_Sphere & Sp, const gp_Circ & C);

		/****************** Init ******************/
		/**** md5 signature: 13641f8402e5ca70065d5b7d4a856df4 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sp: gp_Sphere

Returns
-------
None
") Init;
		void Init(const gp_Sphere & Sp);

		/****************** Project ******************/
		/**** md5 signature: 4885fc811646ec2cdf7ac927e06e0c63 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin

Returns
-------
None
") Project;
		virtual void Project(const gp_Lin & L);

		/****************** Project ******************/
		/**** md5 signature: 6fbe1029080ce340da91ff8531b665f3 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ

Returns
-------
None
") Project;
		virtual void Project(const gp_Circ & C);

		/****************** Project ******************/
		/**** md5 signature: 14b36b707cac7782c568b50dfa48429a ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: gp_Elips

Returns
-------
None
") Project;
		virtual void Project(const gp_Elips & E);

		/****************** Project ******************/
		/**** md5 signature: 1804b2ebae0f4a73301c6766ae516cdd ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Parab

Returns
-------
None
") Project;
		virtual void Project(const gp_Parab & P);

		/****************** Project ******************/
		/**** md5 signature: 5738fc67fc444aa25b8fbb52fc984455 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
H: gp_Hypr

Returns
-------
None
") Project;
		virtual void Project(const gp_Hypr & H);

		/****************** SetInBounds ******************/
		/**** md5 signature: e622abd4d460adf734da3fec4ac7a77d ****/
		%feature("compactdefaultargs") SetInBounds;
		%feature("autodoc", "Set the point of parameter u on c in the natural restrictions of the sphere.

Parameters
----------
U: float

Returns
-------
None
") SetInBounds;
		void SetInBounds(const Standard_Real U);

};


%extend ProjLib_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class ProjLib_Torus *
**********************/
class ProjLib_Torus : public ProjLib_Projector {
	public:
		/****************** ProjLib_Torus ******************/
		/**** md5 signature: cd200df51ee199b49c6916e42c2c52cb ****/
		%feature("compactdefaultargs") ProjLib_Torus;
		%feature("autodoc", "Undefined projection.

Returns
-------
None
") ProjLib_Torus;
		 ProjLib_Torus();

		/****************** ProjLib_Torus ******************/
		/**** md5 signature: ec9ba76805e326a9bce5e3bb7d0c380d ****/
		%feature("compactdefaultargs") ProjLib_Torus;
		%feature("autodoc", "Projection on the torus <to>.

Parameters
----------
To: gp_Torus

Returns
-------
None
") ProjLib_Torus;
		 ProjLib_Torus(const gp_Torus & To);

		/****************** ProjLib_Torus ******************/
		/**** md5 signature: ed940f0fba038b71db3618a86248ad96 ****/
		%feature("compactdefaultargs") ProjLib_Torus;
		%feature("autodoc", "Projection of the circle <c> on the torus <to>.

Parameters
----------
To: gp_Torus
C: gp_Circ

Returns
-------
None
") ProjLib_Torus;
		 ProjLib_Torus(const gp_Torus & To, const gp_Circ & C);

		/****************** Init ******************/
		/**** md5 signature: a4e11b0f0f83959461719dc81f54474b ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
To: gp_Torus

Returns
-------
None
") Init;
		void Init(const gp_Torus & To);

		/****************** Project ******************/
		/**** md5 signature: 4885fc811646ec2cdf7ac927e06e0c63 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin

Returns
-------
None
") Project;
		virtual void Project(const gp_Lin & L);

		/****************** Project ******************/
		/**** md5 signature: 6fbe1029080ce340da91ff8531b665f3 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ

Returns
-------
None
") Project;
		virtual void Project(const gp_Circ & C);

		/****************** Project ******************/
		/**** md5 signature: 14b36b707cac7782c568b50dfa48429a ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: gp_Elips

Returns
-------
None
") Project;
		virtual void Project(const gp_Elips & E);

		/****************** Project ******************/
		/**** md5 signature: 1804b2ebae0f4a73301c6766ae516cdd ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Parab

Returns
-------
None
") Project;
		virtual void Project(const gp_Parab & P);

		/****************** Project ******************/
		/**** md5 signature: 5738fc67fc444aa25b8fbb52fc984455 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
H: gp_Hypr

Returns
-------
None
") Project;
		virtual void Project(const gp_Hypr & H);

};


%extend ProjLib_Torus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class ProjLib_HSequenceOfHSequenceOfPnt : public ProjLib_SequenceOfHSequenceOfPnt, public Standard_Transient {
  public:
    ProjLib_HSequenceOfHSequenceOfPnt();
    ProjLib_HSequenceOfHSequenceOfPnt(const ProjLib_SequenceOfHSequenceOfPnt& theOther);
    const ProjLib_SequenceOfHSequenceOfPnt& Sequence();
    void Append (const ProjLib_SequenceOfHSequenceOfPnt::value_type& theItem);
    void Append (ProjLib_SequenceOfHSequenceOfPnt& theSequence);
    ProjLib_SequenceOfHSequenceOfPnt& ChangeSequence();
};
%make_alias(ProjLib_HSequenceOfHSequenceOfPnt)


