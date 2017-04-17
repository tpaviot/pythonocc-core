/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") ProjLib

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include ProjLib_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(projlib) ProjLib;
class ProjLib {
	public:
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param Pl:
	:type Pl: gp_Pln
	:param P:
	:type P: gp_Pnt
	:rtype: gp_Pnt2d
") Project;
		static gp_Pnt2d Project (const gp_Pln & Pl,const gp_Pnt & P);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param Pl:
	:type Pl: gp_Pln
	:param L:
	:type L: gp_Lin
	:rtype: gp_Lin2d
") Project;
		static gp_Lin2d Project (const gp_Pln & Pl,const gp_Lin & L);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param Pl:
	:type Pl: gp_Pln
	:param C:
	:type C: gp_Circ
	:rtype: gp_Circ2d
") Project;
		static gp_Circ2d Project (const gp_Pln & Pl,const gp_Circ & C);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param Pl:
	:type Pl: gp_Pln
	:param E:
	:type E: gp_Elips
	:rtype: gp_Elips2d
") Project;
		static gp_Elips2d Project (const gp_Pln & Pl,const gp_Elips & E);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param Pl:
	:type Pl: gp_Pln
	:param P:
	:type P: gp_Parab
	:rtype: gp_Parab2d
") Project;
		static gp_Parab2d Project (const gp_Pln & Pl,const gp_Parab & P);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param Pl:
	:type Pl: gp_Pln
	:param H:
	:type H: gp_Hypr
	:rtype: gp_Hypr2d
") Project;
		static gp_Hypr2d Project (const gp_Pln & Pl,const gp_Hypr & H);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param Cy:
	:type Cy: gp_Cylinder
	:param P:
	:type P: gp_Pnt
	:rtype: gp_Pnt2d
") Project;
		static gp_Pnt2d Project (const gp_Cylinder & Cy,const gp_Pnt & P);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param Cy:
	:type Cy: gp_Cylinder
	:param L:
	:type L: gp_Lin
	:rtype: gp_Lin2d
") Project;
		static gp_Lin2d Project (const gp_Cylinder & Cy,const gp_Lin & L);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param Cy:
	:type Cy: gp_Cylinder
	:param Ci:
	:type Ci: gp_Circ
	:rtype: gp_Lin2d
") Project;
		static gp_Lin2d Project (const gp_Cylinder & Cy,const gp_Circ & Ci);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param Co:
	:type Co: gp_Cone
	:param P:
	:type P: gp_Pnt
	:rtype: gp_Pnt2d
") Project;
		static gp_Pnt2d Project (const gp_Cone & Co,const gp_Pnt & P);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param Co:
	:type Co: gp_Cone
	:param L:
	:type L: gp_Lin
	:rtype: gp_Lin2d
") Project;
		static gp_Lin2d Project (const gp_Cone & Co,const gp_Lin & L);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param Co:
	:type Co: gp_Cone
	:param Ci:
	:type Ci: gp_Circ
	:rtype: gp_Lin2d
") Project;
		static gp_Lin2d Project (const gp_Cone & Co,const gp_Circ & Ci);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param Sp:
	:type Sp: gp_Sphere
	:param P:
	:type P: gp_Pnt
	:rtype: gp_Pnt2d
") Project;
		static gp_Pnt2d Project (const gp_Sphere & Sp,const gp_Pnt & P);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param Sp:
	:type Sp: gp_Sphere
	:param Ci:
	:type Ci: gp_Circ
	:rtype: gp_Lin2d
") Project;
		static gp_Lin2d Project (const gp_Sphere & Sp,const gp_Circ & Ci);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param To:
	:type To: gp_Torus
	:param P:
	:type P: gp_Pnt
	:rtype: gp_Pnt2d
") Project;
		static gp_Pnt2d Project (const gp_Torus & To,const gp_Pnt & P);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param To:
	:type To: gp_Torus
	:param Ci:
	:type Ci: gp_Circ
	:rtype: gp_Lin2d
") Project;
		static gp_Lin2d Project (const gp_Torus & To,const gp_Circ & Ci);
};


%extend ProjLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_CompProjectedCurve;
class ProjLib_CompProjectedCurve : public Adaptor2d_Curve2d {
	public:
		%feature("compactdefaultargs") ProjLib_CompProjectedCurve;
		%feature("autodoc", "	:rtype: None
") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve ();
		%feature("compactdefaultargs") ProjLib_CompProjectedCurve;
		%feature("autodoc", "	* try to find all solutions

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") ProjLib_CompProjectedCurve;
		%feature("autodoc", "	* this constructor tries to optimize the search using the assamption that maximum distance between surface and curve less or equal then MaxDist. if MaxDist < 0 then algorithm works as above.

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:param MaxDist:
	:type MaxDist: float
	:rtype: None
") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C,const Standard_Real TolU,const Standard_Real TolV,const Standard_Real MaxDist);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* computes a set of projected point and determine the continuous parts of the projected curves. The points corresponding to a projection on the bounds of the surface are included in this set of points.

	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Changes the surface.

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: None
") Load;
		void Load (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Changes the curve.

	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") Load;
		void Load (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") GetSurface;
		Handle_Adaptor3d_HSurface GetSurface ();
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HCurve
") GetCurve;
		Handle_Adaptor3d_HCurve GetCurve ();
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	:param TolU:
	:type TolU: float &
	:param TolV:
	:type TolV: float &
	:rtype: None
") GetTolerance;
		void GetTolerance (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "	* returns the number of continuous part of the projected curve

	:rtype: int
") NbCurves;
		Standard_Integer NbCurves ();
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	* returns the bounds of the continuous part corresponding to Index

	:param Index:
	:type Index: int
	:param Udeb:
	:type Udeb: float &
	:param Ufin:
	:type Ufin: float &
	:rtype: None
") Bounds;
		void Bounds (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsSinglePnt;
		%feature("autodoc", "	* returns True if part of projection with number Index is a single point and writes its coordinats in P

	:param Index:
	:type Index: int
	:param P:
	:type P: gp_Pnt2d
	:rtype: bool
") IsSinglePnt;
		Standard_Boolean IsSinglePnt (const Standard_Integer Index,gp_Pnt2d & P);
		%feature("compactdefaultargs") IsUIso;
		%feature("autodoc", "	* returns True if part of projection with number Index is an u-isoparametric curve of input surface

	:param Index:
	:type Index: int
	:param U:
	:type U: float &
	:rtype: bool
") IsUIso;
		Standard_Boolean IsUIso (const Standard_Integer Index,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsVIso;
		%feature("autodoc", "	* returns True if part of projection with number Index is an v-isoparametric curve of input surface

	:param Index:
	:type Index: int
	:param V:
	:type V: float &
	:rtype: bool
") IsVIso;
		Standard_Boolean IsVIso (const Standard_Integer Index,Standard_Real &OutValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		gp_Pnt2d Value (const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt2d & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if N < 1. Raised if N > 2.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	* Returns the first parameter of the curve C which has a projection on S.

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	* Returns the last parameter of the curve C which has a projection on S.

	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals which define an S continuous part of the projected curve

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 2d points confusion. If <First> >= <Last>

	:param FirstParam:
	:type FirstParam: float
	:param LastParam:
	:type LastParam: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor2d_HCurve2d
") Trim;
		Handle_Adaptor2d_HCurve2d Trim (const Standard_Real FirstParam,const Standard_Real LastParam,const Standard_Real Tol);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Returns the parameters corresponding to S discontinuities. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") MaxDistance;
		%feature("autodoc", "	* returns the maximum distance between curve to project and surface

	:param Index:
	:type Index: int
	:rtype: float
") MaxDistance;
		Standard_Real MaxDistance (const Standard_Integer Index);
		%feature("compactdefaultargs") GetSequence;
		%feature("autodoc", "	:rtype: Handle_ProjLib_HSequenceOfHSequenceOfPnt
") GetSequence;
		Handle_ProjLib_HSequenceOfHSequenceOfPnt GetSequence ();
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
};


%extend ProjLib_CompProjectedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_ComputeApprox;
class ProjLib_ComputeApprox {
	public:
		%feature("compactdefaultargs") ProjLib_ComputeApprox;
		%feature("autodoc", "	* <Tol> is the tolerance with which the approximation is performed.

	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Tol:
	:type Tol: float
	:rtype: None
") ProjLib_ComputeApprox;
		 ProjLib_ComputeApprox (const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HSurface & S,const Standard_Real Tol);
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:rtype: Handle_Geom2d_BSplineCurve
") BSpline;
		Handle_Geom2d_BSplineCurve BSpline ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:rtype: Handle_Geom2d_BezierCurve
") Bezier;
		Handle_Geom2d_BezierCurve Bezier ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* returns the reached Tolerance.

	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
};


%extend ProjLib_ComputeApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_ComputeApproxOnPolarSurface;
class ProjLib_ComputeApproxOnPolarSurface {
	public:
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "	:rtype: None
") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface ();
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Tol: default value is 1.0e-4
	:type Tol: float
	:rtype: None
") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface (const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HSurface & S,const Standard_Real Tol = 1.0e-4);
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "	:param InitCurve2d:
	:type InitCurve2d: Handle_Adaptor2d_HCurve2d &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Tol:
	:type Tol: float
	:rtype: None
") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface (const Handle_Adaptor2d_HCurve2d & InitCurve2d,const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HSurface & S,const Standard_Real Tol);
		%feature("compactdefaultargs") ProjLib_ComputeApproxOnPolarSurface;
		%feature("autodoc", "	:param InitCurve2d:
	:type InitCurve2d: Handle_Adaptor2d_HCurve2d &
	:param InitCurve2dBis:
	:type InitCurve2dBis: Handle_Adaptor2d_HCurve2d &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Tol:
	:type Tol: float
	:rtype: None
") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface (const Handle_Adaptor2d_HCurve2d & InitCurve2d,const Handle_Adaptor2d_HCurve2d & InitCurve2dBis,const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HSurface & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param InitCurve2d:
	:type InitCurve2d: Handle_Adaptor2d_HCurve2d &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: Handle_Geom2d_BSplineCurve
") Perform;
		Handle_Geom2d_BSplineCurve Perform (const Handle_Adaptor2d_HCurve2d & InitCurve2d,const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") BuildInitialCurve2d;
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: Handle_Adaptor2d_HCurve2d
") BuildInitialCurve2d;
		Handle_Adaptor2d_HCurve2d BuildInitialCurve2d (const Handle_Adaptor3d_HCurve & Curve,const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") ProjectUsingInitialCurve2d;
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param InitCurve2d:
	:type InitCurve2d: Handle_Adaptor2d_HCurve2d &
	:rtype: Handle_Geom2d_BSplineCurve
") ProjectUsingInitialCurve2d;
		Handle_Geom2d_BSplineCurve ProjectUsingInitialCurve2d (const Handle_Adaptor3d_HCurve & Curve,const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor2d_HCurve2d & InitCurve2d);
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:rtype: Handle_Geom2d_BSplineCurve
") BSpline;
		Handle_Geom2d_BSplineCurve BSpline ();
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") Curve2d;
		Handle_Geom2d_Curve Curve2d ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
};


%extend ProjLib_ComputeApproxOnPolarSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_HCompProjectedCurve;
class ProjLib_HCompProjectedCurve : public Adaptor2d_HCurve2d {
	public:
		%feature("compactdefaultargs") ProjLib_HCompProjectedCurve;
		%feature("autodoc", "	:rtype: None
") ProjLib_HCompProjectedCurve;
		 ProjLib_HCompProjectedCurve ();
		%feature("compactdefaultargs") ProjLib_HCompProjectedCurve;
		%feature("autodoc", "	:param C:
	:type C: ProjLib_CompProjectedCurve &
	:rtype: None
") ProjLib_HCompProjectedCurve;
		 ProjLib_HCompProjectedCurve (const ProjLib_CompProjectedCurve & C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param C:
	:type C: ProjLib_CompProjectedCurve &
	:rtype: None
") Set;
		void Set (const ProjLib_CompProjectedCurve & C);
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	:rtype: Adaptor2d_Curve2d
") Curve2d;
		const Adaptor2d_Curve2d & Curve2d ();
		%feature("compactdefaultargs") ChangeCurve2d;
		%feature("autodoc", "	:rtype: ProjLib_CompProjectedCurve
") ChangeCurve2d;
		ProjLib_CompProjectedCurve & ChangeCurve2d ();
};


%extend ProjLib_HCompProjectedCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ProjLib_HCompProjectedCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ProjLib_HCompProjectedCurve::Handle_ProjLib_HCompProjectedCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ProjLib_HCompProjectedCurve;
class Handle_ProjLib_HCompProjectedCurve : public Handle_Adaptor2d_HCurve2d {

    public:
        // constructors
        Handle_ProjLib_HCompProjectedCurve();
        Handle_ProjLib_HCompProjectedCurve(const Handle_ProjLib_HCompProjectedCurve &aHandle);
        Handle_ProjLib_HCompProjectedCurve(const ProjLib_HCompProjectedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ProjLib_HCompProjectedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ProjLib_HCompProjectedCurve {
    ProjLib_HCompProjectedCurve* _get_reference() {
    return (ProjLib_HCompProjectedCurve*)$self->Access();
    }
};

%extend Handle_ProjLib_HCompProjectedCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ProjLib_HCompProjectedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_HProjectedCurve;
class ProjLib_HProjectedCurve : public Adaptor2d_HCurve2d {
	public:
		%feature("compactdefaultargs") ProjLib_HProjectedCurve;
		%feature("autodoc", "	:rtype: None
") ProjLib_HProjectedCurve;
		 ProjLib_HProjectedCurve ();
		%feature("compactdefaultargs") ProjLib_HProjectedCurve;
		%feature("autodoc", "	:param C:
	:type C: ProjLib_ProjectedCurve &
	:rtype: None
") ProjLib_HProjectedCurve;
		 ProjLib_HProjectedCurve (const ProjLib_ProjectedCurve & C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param C:
	:type C: ProjLib_ProjectedCurve &
	:rtype: None
") Set;
		void Set (const ProjLib_ProjectedCurve & C);
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	:rtype: Adaptor2d_Curve2d
") Curve2d;
		const Adaptor2d_Curve2d & Curve2d ();
		%feature("compactdefaultargs") ChangeCurve2d;
		%feature("autodoc", "	:rtype: ProjLib_ProjectedCurve
") ChangeCurve2d;
		ProjLib_ProjectedCurve & ChangeCurve2d ();
};


%extend ProjLib_HProjectedCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ProjLib_HProjectedCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ProjLib_HProjectedCurve::Handle_ProjLib_HProjectedCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ProjLib_HProjectedCurve;
class Handle_ProjLib_HProjectedCurve : public Handle_Adaptor2d_HCurve2d {

    public:
        // constructors
        Handle_ProjLib_HProjectedCurve();
        Handle_ProjLib_HProjectedCurve(const Handle_ProjLib_HProjectedCurve &aHandle);
        Handle_ProjLib_HProjectedCurve(const ProjLib_HProjectedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ProjLib_HProjectedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ProjLib_HProjectedCurve {
    ProjLib_HProjectedCurve* _get_reference() {
    return (ProjLib_HProjectedCurve*)$self->Access();
    }
};

%extend Handle_ProjLib_HProjectedCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ProjLib_HProjectedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_HSequenceOfHSequenceOfPnt;
class ProjLib_HSequenceOfHSequenceOfPnt : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ProjLib_HSequenceOfHSequenceOfPnt;
		%feature("autodoc", "	:rtype: None
") ProjLib_HSequenceOfHSequenceOfPnt;
		 ProjLib_HSequenceOfHSequenceOfPnt ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_TColgp_HSequenceOfPnt
	:rtype: None
") Append;
		void Append (const Handle_TColgp_HSequenceOfPnt & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_ProjLib_HSequenceOfHSequenceOfPnt &
	:rtype: None
") Append;
		void Append (const Handle_ProjLib_HSequenceOfHSequenceOfPnt & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_TColgp_HSequenceOfPnt
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColgp_HSequenceOfPnt & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_ProjLib_HSequenceOfHSequenceOfPnt &
	:rtype: None
") Prepend;
		void Prepend (const Handle_ProjLib_HSequenceOfHSequenceOfPnt & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_TColgp_HSequenceOfPnt
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfPnt & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_ProjLib_HSequenceOfHSequenceOfPnt &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_ProjLib_HSequenceOfHSequenceOfPnt & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_TColgp_HSequenceOfPnt
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfPnt & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_ProjLib_HSequenceOfHSequenceOfPnt &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_ProjLib_HSequenceOfHSequenceOfPnt & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_ProjLib_HSequenceOfHSequenceOfPnt
") Split;
		Handle_ProjLib_HSequenceOfHSequenceOfPnt Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_TColgp_HSequenceOfPnt
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfPnt & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColgp_HSequenceOfPnt
") Value;
		Handle_TColgp_HSequenceOfPnt Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TColgp_HSequenceOfPnt
") ChangeValue;
		Handle_TColgp_HSequenceOfPnt ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: ProjLib_SequenceOfHSequenceOfPnt
") Sequence;
		const ProjLib_SequenceOfHSequenceOfPnt & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: ProjLib_SequenceOfHSequenceOfPnt
") ChangeSequence;
		ProjLib_SequenceOfHSequenceOfPnt & ChangeSequence ();
};


%extend ProjLib_HSequenceOfHSequenceOfPnt {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ProjLib_HSequenceOfHSequenceOfPnt(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ProjLib_HSequenceOfHSequenceOfPnt::Handle_ProjLib_HSequenceOfHSequenceOfPnt %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ProjLib_HSequenceOfHSequenceOfPnt;
class Handle_ProjLib_HSequenceOfHSequenceOfPnt : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ProjLib_HSequenceOfHSequenceOfPnt();
        Handle_ProjLib_HSequenceOfHSequenceOfPnt(const Handle_ProjLib_HSequenceOfHSequenceOfPnt &aHandle);
        Handle_ProjLib_HSequenceOfHSequenceOfPnt(const ProjLib_HSequenceOfHSequenceOfPnt *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ProjLib_HSequenceOfHSequenceOfPnt DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ProjLib_HSequenceOfHSequenceOfPnt {
    ProjLib_HSequenceOfHSequenceOfPnt* _get_reference() {
    return (ProjLib_HSequenceOfHSequenceOfPnt*)$self->Access();
    }
};

%extend Handle_ProjLib_HSequenceOfHSequenceOfPnt {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ProjLib_HSequenceOfHSequenceOfPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_PrjFunc;
class ProjLib_PrjFunc : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") ProjLib_PrjFunc;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_CurvePtr &
	:param FixVal:
	:type FixVal: float
	:param S:
	:type S: Adaptor3d_SurfacePtr &
	:param Fix:
	:type Fix: int
	:rtype: None
") ProjLib_PrjFunc;
		 ProjLib_PrjFunc (const Adaptor3d_CurvePtr & C,const Standard_Real FixVal,const Adaptor3d_SurfacePtr & S,const Standard_Integer Fix);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* returns the number of variables of the function.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "	* returns point on surface

	:rtype: gp_Pnt2d
") Solution;
		gp_Pnt2d Solution ();
};


%extend ProjLib_PrjFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_PrjResolve;
class ProjLib_PrjResolve {
	public:
		%feature("compactdefaultargs") ProjLib_PrjResolve;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param Fix:
	:type Fix: int
	:rtype: None
") ProjLib_PrjResolve;
		 ProjLib_PrjResolve (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Integer Fix);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Calculates the ort from C(t) to S with a close point. The close point is defined by the parameter values U0 and V0. The function F(u,v)=distance(S(u,v),C(t)) has an extremum when gradient(F)=0. The algorithm searchs a zero near the close point.

	:param t:
	:type t: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Tol:
	:type Tol: gp_Pnt2d
	:param Inf:
	:type Inf: gp_Pnt2d
	:param Sup:
	:type Sup: gp_Pnt2d
	:param FTol: default value is -1
	:type FTol: float
	:param StrictInside: default value is Standard_False
	:type StrictInside: bool
	:rtype: None
") Perform;
		void Perform (const Standard_Real t,const Standard_Real U,const Standard_Real V,const gp_Pnt2d & Tol,const gp_Pnt2d & Inf,const gp_Pnt2d & Sup,const Standard_Real FTol = -1,const Standard_Boolean StrictInside = Standard_False);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Solution;
		%feature("autodoc", "	* Returns the point of the extremum distance.

	:rtype: gp_Pnt2d
") Solution;
		gp_Pnt2d Solution ();
};


%extend ProjLib_PrjResolve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_ProjectOnPlane;
class ProjLib_ProjectOnPlane : public Adaptor3d_Curve {
	public:
		%feature("compactdefaultargs") ProjLib_ProjectOnPlane;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") ProjLib_ProjectOnPlane;
		 ProjLib_ProjectOnPlane ();
		%feature("compactdefaultargs") ProjLib_ProjectOnPlane;
		%feature("autodoc", "	* The projection will be normal to the Plane defined by the Ax3 <Pl>.

	:param Pl:
	:type Pl: gp_Ax3
	:rtype: None
") ProjLib_ProjectOnPlane;
		 ProjLib_ProjectOnPlane (const gp_Ax3 & Pl);
		%feature("compactdefaultargs") ProjLib_ProjectOnPlane;
		%feature("autodoc", "	* The projection will be along the direction <D> on the plane defined by the Ax3 <Pl>. raises if the direction <D> is parallel to the plane <Pl>.

	:param Pl:
	:type Pl: gp_Ax3
	:param D:
	:type D: gp_Dir
	:rtype: None
") ProjLib_ProjectOnPlane;
		 ProjLib_ProjectOnPlane (const gp_Ax3 & Pl,const gp_Dir & D);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Sets the Curve and perform the projection. if <KeepParametrization> is true, the parametrization of the Projected Curve <PC> will be the same as the parametrization of the initial curve <C>. It meens: proj(C(u)) = PC(u) for each u. Otherwize, the parametrization may change.

	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param Tolerance:
	:type Tolerance: float
	:param KeepParametrization: default value is Standard_True
	:type KeepParametrization: bool
	:rtype: None
") Load;
		void Load (const Handle_Adaptor3d_HCurve & C,const Standard_Real Tolerance,const Standard_Boolean KeepParametrization = Standard_True);
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "	:rtype: gp_Ax3
") GetPlane;
		const gp_Ax3  GetPlane ();
		%feature("compactdefaultargs") GetDirection;
		%feature("autodoc", "	:rtype: gp_Dir
") GetDirection;
		const gp_Dir  GetDirection ();
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HCurve
") GetCurve;
		Handle_Adaptor3d_HCurve GetCurve ();
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HCurve
") Trim;
		Handle_Adaptor3d_HCurve Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:rtype: float
") Period;
		Standard_Real Period ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: None
") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the parametric resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: gp_Lin
") Line;
		gp_Lin Line ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:rtype: gp_Elips
") Ellipse;
		gp_Elips Ellipse ();
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:rtype: gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:rtype: gp_Parab
") Parabola;
		gp_Parab Parabola ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	* Warning ! this will NOT make a copy of the Bezier Curve : If you want to modify the Curve please make a copy yourself Also it will NOT trim the surface to myFirst/Last.

	:rtype: Handle_Geom_BezierCurve
") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	* Warning ! this will NOT make a copy of the BSpline Curve : If you want to modify the Curve please make a copy yourself Also it will NOT trim the surface to myFirst/Last.

	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%extend ProjLib_ProjectOnPlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_ProjectOnSurface;
class ProjLib_ProjectOnSurface {
	public:
		%feature("compactdefaultargs") ProjLib_ProjectOnSurface;
		%feature("autodoc", "	* Create an empty projector.

	:rtype: None
") ProjLib_ProjectOnSurface;
		 ProjLib_ProjectOnSurface ();
		%feature("compactdefaultargs") ProjLib_ProjectOnSurface;
		%feature("autodoc", "	* Create a projector normaly to the surface <S>.

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: None
") ProjLib_ProjectOnSurface;
		 ProjLib_ProjectOnSurface (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%extend ProjLib_ProjectOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_ProjectedCurve;
class ProjLib_ProjectedCurve : public Adaptor2d_Curve2d {
	public:
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
		%feature("autodoc", "	:rtype: None
") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve ();
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: None
") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") ProjLib_ProjectedCurve;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param Tol:
	:type Tol: float
	:rtype: None
") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C,const Standard_Real Tol);
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") GetSurface;
		Handle_Adaptor3d_HSurface GetSurface ();
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HCurve
") GetCurve;
		Handle_Adaptor3d_HCurve GetCurve ();
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* returns the tolerance reached if an approximation is Done.

	:rtype: float
") GetTolerance;
		Standard_Real GetTolerance ();
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor2d_HCurve2d
") Trim;
		Handle_Adaptor2d_HCurve2d Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:rtype: float
") Period;
		Standard_Real Period ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		gp_Pnt2d Value (const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt2d & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		void D3 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the parametric resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: gp_Lin2d
") Line;
		gp_Lin2d Line ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:rtype: gp_Circ2d
") Circle;
		gp_Circ2d Circle ();
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:rtype: gp_Elips2d
") Ellipse;
		gp_Elips2d Ellipse ();
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:rtype: gp_Hypr2d
") Hyperbola;
		gp_Hypr2d Hyperbola ();
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:rtype: gp_Parab2d
") Parabola;
		gp_Parab2d Parabola ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	* Warning ! This will NOT make a copy of the -- Bezier Curve - If you want to modify -- the Curve please make a copy yourself -- Also it will NOT trim the surface to -- myFirst/Last.

	:rtype: Handle_Geom2d_BezierCurve
") Bezier;
		Handle_Geom2d_BezierCurve Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	* Warning ! This will NOT make a copy of the BSpline Curve - If you want to modify the Curve please make a copy yourself Also it will NOT trim the surface to myFirst/Last.

	:rtype: Handle_Geom2d_BSplineCurve
") BSpline;
		Handle_Geom2d_BSplineCurve BSpline ();
};


%extend ProjLib_ProjectedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_Projector;
class ProjLib_Projector {
	public:
		%feature("compactdefaultargs") ProjLib_Projector;
		%feature("autodoc", "	* Sets the type to OtherCurve

	:rtype: None
") ProjLib_Projector;
		 ProjLib_Projector ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Done;
		%feature("autodoc", "	* Set isDone = Standard_True;

	:rtype: None
") Done;
		void Done ();
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
		%feature("compactdefaultargs") SetBSpline;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_BSplineCurve &
	:rtype: None
") SetBSpline;
		void SetBSpline (const Handle_Geom2d_BSplineCurve & C);
		%feature("compactdefaultargs") SetBezier;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_BezierCurve &
	:rtype: None
") SetBezier;
		void SetBezier (const Handle_Geom2d_BezierCurve & C);
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "	:param Type:
	:type Type: GeomAbs_CurveType
	:rtype: None
") SetType;
		void SetType (const GeomAbs_CurveType Type);
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "	:rtype: None
") SetPeriodic;
		void SetPeriodic ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: gp_Lin2d
") Line;
		const gp_Lin2d  Line ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:rtype: gp_Circ2d
") Circle;
		const gp_Circ2d  Circle ();
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:rtype: gp_Elips2d
") Ellipse;
		const gp_Elips2d  Ellipse ();
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:rtype: gp_Hypr2d
") Hyperbola;
		const gp_Hypr2d  Hyperbola ();
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:rtype: gp_Parab2d
") Parabola;
		const gp_Parab2d  Parabola ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:rtype: Handle_Geom2d_BezierCurve
") Bezier;
		Handle_Geom2d_BezierCurve Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:rtype: Handle_Geom2d_BSplineCurve
") BSpline;
		Handle_Geom2d_BSplineCurve BSpline ();
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:rtype: void
") Project;
		virtual void Project (const gp_Lin & L);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:rtype: void
") Project;
		virtual void Project (const gp_Circ & C);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param E:
	:type E: gp_Elips
	:rtype: void
") Project;
		virtual void Project (const gp_Elips & E);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param P:
	:type P: gp_Parab
	:rtype: void
") Project;
		virtual void Project (const gp_Parab & P);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr
	:rtype: void
") Project;
		virtual void Project (const gp_Hypr & H);
		%feature("compactdefaultargs") UFrame;
		%feature("autodoc", "	* Translates the 2d curve to set the part of the curve [CFirst, CLast] in the range [ UFirst, UFirst + Period [

	:param CFirst:
	:type CFirst: float
	:param CLast:
	:type CLast: float
	:param UFirst:
	:type UFirst: float
	:param Period:
	:type Period: float
	:rtype: None
") UFrame;
		void UFrame (const Standard_Real CFirst,const Standard_Real CLast,const Standard_Real UFirst,const Standard_Real Period);
		%feature("compactdefaultargs") VFrame;
		%feature("autodoc", "	* Translates the 2d curve to set the part of the curve [CFirst, CLast] in the range [ VFirst, VFirst + Period [

	:param CFirst:
	:type CFirst: float
	:param CLast:
	:type CLast: float
	:param VFirst:
	:type VFirst: float
	:param Period:
	:type Period: float
	:rtype: None
") VFrame;
		void VFrame (const Standard_Real CFirst,const Standard_Real CLast,const Standard_Real VFirst,const Standard_Real Period);
};


%extend ProjLib_Projector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt;
class ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt;
		%feature("autodoc", "	:param I:
	:type I: Handle_TColgp_HSequenceOfPnt
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt;
		 ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt (const Handle_TColgp_HSequenceOfPnt & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TColgp_HSequenceOfPnt
") Value;
		Handle_TColgp_HSequenceOfPnt Value ();
};


%extend ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt::Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt;
class Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt();
        Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt(const Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt &aHandle);
        Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt(const ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt {
    ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt* _get_reference() {
    return (ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt*)$self->Access();
    }
};

%extend Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_SequenceOfHSequenceOfPnt;
class ProjLib_SequenceOfHSequenceOfPnt : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") ProjLib_SequenceOfHSequenceOfPnt;
		%feature("autodoc", "	:rtype: None
") ProjLib_SequenceOfHSequenceOfPnt;
		 ProjLib_SequenceOfHSequenceOfPnt ();
		%feature("compactdefaultargs") ProjLib_SequenceOfHSequenceOfPnt;
		%feature("autodoc", "	:param Other:
	:type Other: ProjLib_SequenceOfHSequenceOfPnt &
	:rtype: None
") ProjLib_SequenceOfHSequenceOfPnt;
		 ProjLib_SequenceOfHSequenceOfPnt (const ProjLib_SequenceOfHSequenceOfPnt & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ProjLib_SequenceOfHSequenceOfPnt &
	:rtype: ProjLib_SequenceOfHSequenceOfPnt
") Assign;
		const ProjLib_SequenceOfHSequenceOfPnt & Assign (const ProjLib_SequenceOfHSequenceOfPnt & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ProjLib_SequenceOfHSequenceOfPnt &
	:rtype: ProjLib_SequenceOfHSequenceOfPnt
") operator =;
		const ProjLib_SequenceOfHSequenceOfPnt & operator = (const ProjLib_SequenceOfHSequenceOfPnt & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_TColgp_HSequenceOfPnt
	:rtype: None
") Append;
		void Append (const Handle_TColgp_HSequenceOfPnt & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: ProjLib_SequenceOfHSequenceOfPnt &
	:rtype: None
") Append;
		void Append (ProjLib_SequenceOfHSequenceOfPnt & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_TColgp_HSequenceOfPnt
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColgp_HSequenceOfPnt & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: ProjLib_SequenceOfHSequenceOfPnt &
	:rtype: None
") Prepend;
		void Prepend (ProjLib_SequenceOfHSequenceOfPnt & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TColgp_HSequenceOfPnt
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TColgp_HSequenceOfPnt & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: ProjLib_SequenceOfHSequenceOfPnt &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,ProjLib_SequenceOfHSequenceOfPnt & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_TColgp_HSequenceOfPnt
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TColgp_HSequenceOfPnt & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: ProjLib_SequenceOfHSequenceOfPnt &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,ProjLib_SequenceOfHSequenceOfPnt & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TColgp_HSequenceOfPnt
") First;
		Handle_TColgp_HSequenceOfPnt First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TColgp_HSequenceOfPnt
") Last;
		Handle_TColgp_HSequenceOfPnt Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: ProjLib_SequenceOfHSequenceOfPnt &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,ProjLib_SequenceOfHSequenceOfPnt & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TColgp_HSequenceOfPnt
") Value;
		Handle_TColgp_HSequenceOfPnt Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_TColgp_HSequenceOfPnt
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TColgp_HSequenceOfPnt & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_TColgp_HSequenceOfPnt
") ChangeValue;
		Handle_TColgp_HSequenceOfPnt ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend ProjLib_SequenceOfHSequenceOfPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_Cone;
class ProjLib_Cone : public ProjLib_Projector {
	public:
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "	* Undefined projection.

	:rtype: None
") ProjLib_Cone;
		 ProjLib_Cone ();
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "	* Projection on the cone <Co>.

	:param Co:
	:type Co: gp_Cone
	:rtype: None
") ProjLib_Cone;
		 ProjLib_Cone (const gp_Cone & Co);
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "	* Projection of the line <L> on the cone <Co>.

	:param Co:
	:type Co: gp_Cone
	:param L:
	:type L: gp_Lin
	:rtype: None
") ProjLib_Cone;
		 ProjLib_Cone (const gp_Cone & Co,const gp_Lin & L);
		%feature("compactdefaultargs") ProjLib_Cone;
		%feature("autodoc", "	* Projection of the circle <C> on the cone <Co>.

	:param Co:
	:type Co: gp_Cone
	:param C:
	:type C: gp_Circ
	:rtype: None
") ProjLib_Cone;
		 ProjLib_Cone (const gp_Cone & Co,const gp_Circ & C);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Co:
	:type Co: gp_Cone
	:rtype: None
") Init;
		void Init (const gp_Cone & Co);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:rtype: void
") Project;
		virtual void Project (const gp_Lin & L);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:rtype: void
") Project;
		virtual void Project (const gp_Circ & C);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param E:
	:type E: gp_Elips
	:rtype: void
") Project;
		virtual void Project (const gp_Elips & E);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param P:
	:type P: gp_Parab
	:rtype: void
") Project;
		virtual void Project (const gp_Parab & P);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr
	:rtype: void
") Project;
		virtual void Project (const gp_Hypr & H);
};


%extend ProjLib_Cone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_Cylinder;
class ProjLib_Cylinder : public ProjLib_Projector {
	public:
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "	* Undefined projection.

	:rtype: None
") ProjLib_Cylinder;
		 ProjLib_Cylinder ();
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "	* Projection on the cylinder <Cyl>.

	:param Cyl:
	:type Cyl: gp_Cylinder
	:rtype: None
") ProjLib_Cylinder;
		 ProjLib_Cylinder (const gp_Cylinder & Cyl);
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "	* Projection of the line <L> on the cylinder <Cyl>.

	:param Cyl:
	:type Cyl: gp_Cylinder
	:param L:
	:type L: gp_Lin
	:rtype: None
") ProjLib_Cylinder;
		 ProjLib_Cylinder (const gp_Cylinder & Cyl,const gp_Lin & L);
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "	* Projection of the circle <C> on the cylinder <Cyl>.

	:param Cyl:
	:type Cyl: gp_Cylinder
	:param C:
	:type C: gp_Circ
	:rtype: None
") ProjLib_Cylinder;
		 ProjLib_Cylinder (const gp_Cylinder & Cyl,const gp_Circ & C);
		%feature("compactdefaultargs") ProjLib_Cylinder;
		%feature("autodoc", "	* Projection of the ellipse <E> on the cylinder <Cyl>.

	:param Cyl:
	:type Cyl: gp_Cylinder
	:param E:
	:type E: gp_Elips
	:rtype: None
") ProjLib_Cylinder;
		 ProjLib_Cylinder (const gp_Cylinder & Cyl,const gp_Elips & E);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Cyl:
	:type Cyl: gp_Cylinder
	:rtype: None
") Init;
		void Init (const gp_Cylinder & Cyl);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:rtype: void
") Project;
		virtual void Project (const gp_Lin & L);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:rtype: void
") Project;
		virtual void Project (const gp_Circ & C);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param E:
	:type E: gp_Elips
	:rtype: void
") Project;
		virtual void Project (const gp_Elips & E);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param P:
	:type P: gp_Parab
	:rtype: void
") Project;
		virtual void Project (const gp_Parab & P);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr
	:rtype: void
") Project;
		virtual void Project (const gp_Hypr & H);
};


%extend ProjLib_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_Plane;
class ProjLib_Plane : public ProjLib_Projector {
	public:
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "	* Undefined projection.

	:rtype: None
") ProjLib_Plane;
		 ProjLib_Plane ();
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "	* Projection on the plane <Pl>.

	:param Pl:
	:type Pl: gp_Pln
	:rtype: None
") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl);
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "	* Projection of the line <L> on the plane <Pl>.

	:param Pl:
	:type Pl: gp_Pln
	:param L:
	:type L: gp_Lin
	:rtype: None
") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl,const gp_Lin & L);
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "	* Projection of the circle <C> on the plane <Pl>.

	:param Pl:
	:type Pl: gp_Pln
	:param C:
	:type C: gp_Circ
	:rtype: None
") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl,const gp_Circ & C);
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "	* Projection of the ellipse <E> on the plane <Pl>.

	:param Pl:
	:type Pl: gp_Pln
	:param E:
	:type E: gp_Elips
	:rtype: None
") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl,const gp_Elips & E);
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "	* Projection of the parabola <P> on the plane <Pl>.

	:param Pl:
	:type Pl: gp_Pln
	:param P:
	:type P: gp_Parab
	:rtype: None
") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl,const gp_Parab & P);
		%feature("compactdefaultargs") ProjLib_Plane;
		%feature("autodoc", "	* Projection of the hyperbola <H> on the plane <Pl>.

	:param Pl:
	:type Pl: gp_Pln
	:param H:
	:type H: gp_Hypr
	:rtype: None
") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl,const gp_Hypr & H);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Pl:
	:type Pl: gp_Pln
	:rtype: None
") Init;
		void Init (const gp_Pln & Pl);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:rtype: void
") Project;
		virtual void Project (const gp_Lin & L);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:rtype: void
") Project;
		virtual void Project (const gp_Circ & C);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param E:
	:type E: gp_Elips
	:rtype: void
") Project;
		virtual void Project (const gp_Elips & E);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param P:
	:type P: gp_Parab
	:rtype: void
") Project;
		virtual void Project (const gp_Parab & P);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr
	:rtype: void
") Project;
		virtual void Project (const gp_Hypr & H);
};


%extend ProjLib_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_Sphere;
class ProjLib_Sphere : public ProjLib_Projector {
	public:
		%feature("compactdefaultargs") ProjLib_Sphere;
		%feature("autodoc", "	* Undefined projection.

	:rtype: None
") ProjLib_Sphere;
		 ProjLib_Sphere ();
		%feature("compactdefaultargs") ProjLib_Sphere;
		%feature("autodoc", "	* Projection on the sphere <Sp>.

	:param Sp:
	:type Sp: gp_Sphere
	:rtype: None
") ProjLib_Sphere;
		 ProjLib_Sphere (const gp_Sphere & Sp);
		%feature("compactdefaultargs") ProjLib_Sphere;
		%feature("autodoc", "	* Projection of the circle <C> on the sphere <Sp>.

	:param Sp:
	:type Sp: gp_Sphere
	:param C:
	:type C: gp_Circ
	:rtype: None
") ProjLib_Sphere;
		 ProjLib_Sphere (const gp_Sphere & Sp,const gp_Circ & C);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Sp:
	:type Sp: gp_Sphere
	:rtype: None
") Init;
		void Init (const gp_Sphere & Sp);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:rtype: void
") Project;
		virtual void Project (const gp_Lin & L);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:rtype: void
") Project;
		virtual void Project (const gp_Circ & C);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param E:
	:type E: gp_Elips
	:rtype: void
") Project;
		virtual void Project (const gp_Elips & E);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param P:
	:type P: gp_Parab
	:rtype: void
") Project;
		virtual void Project (const gp_Parab & P);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr
	:rtype: void
") Project;
		virtual void Project (const gp_Hypr & H);
		%feature("compactdefaultargs") SetInBounds;
		%feature("autodoc", "	* Set the point of parameter U on C in the natural restrictions of the sphere.

	:param U:
	:type U: float
	:rtype: None
") SetInBounds;
		void SetInBounds (const Standard_Real U);
};


%extend ProjLib_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ProjLib_Torus;
class ProjLib_Torus : public ProjLib_Projector {
	public:
		%feature("compactdefaultargs") ProjLib_Torus;
		%feature("autodoc", "	* Undefined projection.

	:rtype: None
") ProjLib_Torus;
		 ProjLib_Torus ();
		%feature("compactdefaultargs") ProjLib_Torus;
		%feature("autodoc", "	* Projection on the torus <To>.

	:param To:
	:type To: gp_Torus
	:rtype: None
") ProjLib_Torus;
		 ProjLib_Torus (const gp_Torus & To);
		%feature("compactdefaultargs") ProjLib_Torus;
		%feature("autodoc", "	* Projection of the circle <C> on the torus <To>.

	:param To:
	:type To: gp_Torus
	:param C:
	:type C: gp_Circ
	:rtype: None
") ProjLib_Torus;
		 ProjLib_Torus (const gp_Torus & To,const gp_Circ & C);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param To:
	:type To: gp_Torus
	:rtype: None
") Init;
		void Init (const gp_Torus & To);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:rtype: void
") Project;
		virtual void Project (const gp_Lin & L);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:rtype: void
") Project;
		virtual void Project (const gp_Circ & C);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param E:
	:type E: gp_Elips
	:rtype: void
") Project;
		virtual void Project (const gp_Elips & E);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param P:
	:type P: gp_Parab
	:rtype: void
") Project;
		virtual void Project (const gp_Parab & P);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr
	:rtype: void
") Project;
		virtual void Project (const gp_Hypr & H);
};


%extend ProjLib_Torus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
