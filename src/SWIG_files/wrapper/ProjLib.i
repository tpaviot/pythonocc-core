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
		%feature("compactdefaultargs") ProjLib_CompProjectedCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve();

		/****************** ProjLib_CompProjectedCurve ******************/
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
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the first parameter of the curve c which has a projection on s.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		const opencascade::handle<Adaptor3d_HCurve> & GetCurve();

		/****************** GetSequence ******************/
		%feature("compactdefaultargs") GetSequence;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<ProjLib_HSequenceOfHSequenceOfPnt>
") GetSequence;
		const opencascade::handle<ProjLib_HSequenceOfHSequenceOfPnt> & GetSequence();

		/****************** GetSurface ******************/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") GetSurface;
		const opencascade::handle<Adaptor3d_HSurface> & GetSurface();

		/****************** GetTolerance ******************/
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
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Computes a set of projected point and determine the continuous parts of the projected curves. the points corresponding to a projection on the bounds of the surface are included in this set of points.

Returns
-------
None
") Init;
		void Init();

		/****************** Intervals ******************/
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
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the last parameter of the curve c which has a projection on s.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Load ******************/
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
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Returns the number of continuous part of the projected curve.

Returns
-------
int
") NbCurves;
		Standard_Integer NbCurves();

		/****************** NbIntervals ******************/
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
		%feature("compactdefaultargs") ProjLib_ComputeApprox;
		%feature("autodoc", "Empty constructor, it only sets some initial values for class fields.

Returns
-------
None
") ProjLib_ComputeApprox;
		 ProjLib_ComputeApprox();

		/****************** ProjLib_ComputeApprox ******************/
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
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "Empty constructor, it only sets some initial values for class fields.

Returns
-------
None
") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface();

		/****************** ProjLib_ComputeApproxOnPolarSurface ******************/
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
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Returns result curve 2d.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****************** BuildInitialCurve2d ******************/
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
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Returns second 2d curve.

Returns
-------
opencascade::handle<Geom2d_Curve>
") Curve2d;
		opencascade::handle<Geom2d_Curve> Curve2d();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") ProjLib_HCompProjectedCurve;
		%feature("autodoc", "Creates an empty genhcurve2d.

Returns
-------
None
") ProjLib_HCompProjectedCurve;
		 ProjLib_HCompProjectedCurve();

		/****************** ProjLib_HCompProjectedCurve ******************/
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
		%feature("compactdefaultargs") ChangeCurve2d;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
ProjLib_CompProjectedCurve
") ChangeCurve2d;
		ProjLib_CompProjectedCurve & ChangeCurve2d();

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Returns the curve used to create the genhcurve2d. this is redefined from hcurve2d, cannot be inline.

Returns
-------
Adaptor2d_Curve2d
") Curve2d;
		const Adaptor2d_Curve2d & Curve2d();

		/****************** Set ******************/
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
		%feature("compactdefaultargs") ProjLib_HProjectedCurve;
		%feature("autodoc", "Creates an empty genhcurve2d.

Returns
-------
None
") ProjLib_HProjectedCurve;
		 ProjLib_HProjectedCurve();

		/****************** ProjLib_HProjectedCurve ******************/
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
		%feature("compactdefaultargs") ChangeCurve2d;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
ProjLib_ProjectedCurve
") ChangeCurve2d;
		ProjLib_ProjectedCurve & ChangeCurve2d();

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Returns the curve used to create the genhcurve2d. this is redefined from hcurve2d, cannot be inline.

Returns
-------
Adaptor2d_Curve2d
") Curve2d;
		const Adaptor2d_Curve2d & Curve2d();

		/****************** Set ******************/
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
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Solution ******************/
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "Returns point on surface.

Returns
-------
gp_Pnt2d
") Solution;
		gp_Pnt2d Solution();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") ProjLib_ProjectOnPlane;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ProjLib_ProjectOnPlane;
		 ProjLib_ProjectOnPlane();

		/****************** ProjLib_ProjectOnPlane ******************/
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
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Warning ! this will not make a copy of the bspline curve : if you want to modify the curve please make a copy yourself also it will not trim the surface to myfirst/last.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Warning ! this will not make a copy of the bezier curve : if you want to modify the curve please make a copy yourself also it will not trim the surface to myfirst/last.

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

		/****************** D0 ******************/
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
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

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

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		const opencascade::handle<Adaptor3d_HCurve> & GetCurve();

		/****************** GetDirection ******************/
		%feature("compactdefaultargs") GetDirection;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") GetDirection;
		const gp_Dir GetDirection();

		/****************** GetPlane ******************/
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Ax3
") GetPlane;
		const gp_Ax3 GetPlane();

		/****************** GetResult ******************/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomAdaptor_HCurve>
") GetResult;
		const opencascade::handle<GeomAdaptor_HCurve> & GetResult();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

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
		%feature("autodoc", "No available documentation.

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
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

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

		/****************** Resolution ******************/
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
		%feature("compactdefaultargs") ProjLib_ProjectOnSurface;
		%feature("autodoc", "Create an empty projector.

Returns
-------
None
") ProjLib_ProjectOnSurface;
		 ProjLib_ProjectOnSurface();

		/****************** ProjLib_ProjectOnSurface ******************/
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
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****************** IsDone ******************/
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
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
		%feature("autodoc", "Empty constructor, it only sets some initial values for class fields.

Returns
-------
None
") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve();

		/****************** ProjLib_ProjectedCurve ******************/
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
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Warning ! this will not make a copy of the bspline curve - if you want to modify the curve please make a copy yourself also it will not trim the surface to myfirst/last.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Warning ! this will not make a copy of the -- bezier curve - if you want to modify -- the curve please make a copy yourself -- also it will not trim the surface to -- myfirst/last.

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ2d
") Circle;
		gp_Circ2d Circle();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** D0 ******************/
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
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

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
gp_Elips2d
") Ellipse;
		gp_Elips2d Ellipse();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		const opencascade::handle<Adaptor3d_HCurve> & GetCurve();

		/****************** GetSurface ******************/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") GetSurface;
		const opencascade::handle<Adaptor3d_HSurface> & GetSurface();

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance reached if an approximation is done.

Returns
-------
float
") GetTolerance;
		Standard_Real GetTolerance();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

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
gp_Hypr2d
") Hyperbola;
		gp_Hypr2d Hyperbola();

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
		%feature("autodoc", "No available documentation.

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
gp_Lin2d
") Line;
		gp_Lin2d Line();

		/****************** NbIntervals ******************/
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
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab2d
") Parabola;
		gp_Parab2d Parabola();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** Resolution ******************/
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
		%feature("compactdefaultargs") ProjLib_Projector;
		%feature("autodoc", "Sets the type to othercurve.

Returns
-------
None
") ProjLib_Projector;
		 ProjLib_Projector();

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ2d
") Circle;
		const gp_Circ2d Circle();

		/****************** Done ******************/
		%feature("compactdefaultargs") Done;
		%feature("autodoc", "Set isdone = standard_true;.

Returns
-------
None
") Done;
		void Done();

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips2d
") Ellipse;
		const gp_Elips2d Ellipse();

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
gp_Hypr2d
") Hyperbola;
		const gp_Hypr2d Hyperbola();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin2d
") Line;
		const gp_Lin2d Line();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab2d
") Parabola;
		const gp_Parab2d Parabola();

		/****************** Project ******************/
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
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetPeriodic;
		void SetPeriodic();

		/****************** SetType ******************/
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
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "Undefined projection.

Returns
-------
None
") ProjLib_Cone;
		 ProjLib_Cone();

		/****************** ProjLib_Cone ******************/
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
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "Undefined projection.

Returns
-------
None
") ProjLib_Cylinder;
		 ProjLib_Cylinder();

		/****************** ProjLib_Cylinder ******************/
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
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "Undefined projection.

Returns
-------
None
") ProjLib_Plane;
		 ProjLib_Plane();

		/****************** ProjLib_Plane ******************/
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
		%feature("compactdefaultargs") ProjLib_Sphere;
		%feature("autodoc", "Undefined projection.

Returns
-------
None
") ProjLib_Sphere;
		 ProjLib_Sphere();

		/****************** ProjLib_Sphere ******************/
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
		%feature("compactdefaultargs") ProjLib_Torus;
		%feature("autodoc", "Undefined projection.

Returns
-------
None
") ProjLib_Torus;
		 ProjLib_Torus();

		/****************** ProjLib_Torus ******************/
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


