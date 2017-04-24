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
%module (package="OCC") GeomAdaptor

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


%include GeomAdaptor_headers.i


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

%rename(geomadaptor) GeomAdaptor;
class GeomAdaptor {
	public:
		%feature("compactdefaultargs") MakeCurve;
		%feature("autodoc", "	* Inherited from GHCurve. Provides a curve handled by reference. Build a Geom_Curve using the informations from the Curve from Adaptor3d

	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: Handle_Geom_Curve
") MakeCurve;
		static Handle_Geom_Curve MakeCurve (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") MakeSurface;
		%feature("autodoc", "	* Build a Geom_Surface using the informations from the Surface from Adaptor3d @param theS - Surface adaptor to convert. @param theTrimFlag - True if perform trim surface values by adaptor and false otherwise.

	:param S:
	:type S: Adaptor3d_Surface &
	:param theTrimFlag: default value is Standard_True
	:type theTrimFlag: bool
	:rtype: Handle_Geom_Surface
") MakeSurface;
		static Handle_Geom_Surface MakeSurface (const Adaptor3d_Surface & S,const Standard_Boolean theTrimFlag = Standard_True);
};


%extend GeomAdaptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomAdaptor_Curve;
class GeomAdaptor_Curve : public Adaptor3d_Curve {
	public:
		%feature("compactdefaultargs") GeomAdaptor_Curve;
		%feature("autodoc", "	:rtype: None
") GeomAdaptor_Curve;
		 GeomAdaptor_Curve ();
		%feature("compactdefaultargs") GeomAdaptor_Curve;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: None
") GeomAdaptor_Curve;
		 GeomAdaptor_Curve (const Handle_Geom_Curve & C);
		%feature("compactdefaultargs") GeomAdaptor_Curve;
		%feature("autodoc", "	* ConstructionError is raised if Ufirst>Ulast

	:param C:
	:type C: Handle_Geom_Curve &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None
") GeomAdaptor_Curve;
		 GeomAdaptor_Curve (const Handle_Geom_Curve & C,const Standard_Real UFirst,const Standard_Real ULast);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: None
") Load;
		void Load (const Handle_Geom_Curve & C);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* ConstructionError is raised if Ufirst>Ulast

	:param C:
	:type C: Handle_Geom_Curve &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None
") Load;
		void Load (const Handle_Geom_Curve & C,const Standard_Real UFirst,const Standard_Real ULast);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* Provides a curve inherited from Hcurve from Adaptor. This is inherited to provide easy to use constructors.

	:rtype: Handle_Geom_Curve
") Curve;
		Handle_Geom_Curve Curve ();
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
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

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
		%feature("autodoc", "	* Computes the point of parameter U on the curve

	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. //! Warning : On the specific case of BSplineCurve: if the curve is cut in interval of continuity at least C1, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve.

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
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. //! Warning : On the specific case of BSplineCurve: if the curve is cut in interval of continuity at least C2, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve.

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
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. //! Warning : On the specific case of BSplineCurve: if the curve is cut in interval of continuity at least C3, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve.

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
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Warning : On the specific case of BSplineCurve: if the curve is cut in interval of continuity CN, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve. Raised if N < 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* returns the parametric resolution

	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: GeomAbs_CurveType
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
		%feature("autodoc", "	* this should NEVER make a copy of the underlying curve to read the relevant information

	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* this should NEVER make a copy of the underlying curve to read the relevant information

	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	* this should NEVER make a copy of the underlying curve to read the relevant information

	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	* this should NEVER make a copy of the underlying curve to read the relevant information

	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	* this will NOT make a copy of the Bezier Curve : If you want to modify the Curve please make a copy yourself Also it will NOT trim the surface to myFirst/Last.

	:rtype: Handle_Geom_BezierCurve
") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	* this will NOT make a copy of the BSpline Curve : If you want to modify the Curve please make a copy yourself Also it will NOT trim the surface to myFirst/Last.

	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%extend GeomAdaptor_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomAdaptor_GHCurve;
class GeomAdaptor_GHCurve : public Adaptor3d_HCurve {
	public:
		%feature("compactdefaultargs") GeomAdaptor_GHCurve;
		%feature("autodoc", "	:rtype: None
") GeomAdaptor_GHCurve;
		 GeomAdaptor_GHCurve ();
		%feature("compactdefaultargs") GeomAdaptor_GHCurve;
		%feature("autodoc", "	:param C:
	:type C: GeomAdaptor_Curve &
	:rtype: None
") GeomAdaptor_GHCurve;
		 GeomAdaptor_GHCurve (const GeomAdaptor_Curve & C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param C:
	:type C: GeomAdaptor_Curve &
	:rtype: None
") Set;
		void Set (const GeomAdaptor_Curve & C);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") Curve;
		const Adaptor3d_Curve & Curve ();
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") GetCurve;
		Adaptor3d_Curve & GetCurve ();
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "	:rtype: GeomAdaptor_Curve
") ChangeCurve;
		GeomAdaptor_Curve & ChangeCurve ();
};


%extend GeomAdaptor_GHCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_GeomAdaptor_GHCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_GeomAdaptor_GHCurve::Handle_GeomAdaptor_GHCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_GeomAdaptor_GHCurve;
class Handle_GeomAdaptor_GHCurve : public Handle_Adaptor3d_HCurve {

    public:
        // constructors
        Handle_GeomAdaptor_GHCurve();
        Handle_GeomAdaptor_GHCurve(const Handle_GeomAdaptor_GHCurve &aHandle);
        Handle_GeomAdaptor_GHCurve(const GeomAdaptor_GHCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomAdaptor_GHCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomAdaptor_GHCurve {
    GeomAdaptor_GHCurve* _get_reference() {
    return (GeomAdaptor_GHCurve*)$self->Access();
    }
};

%extend Handle_GeomAdaptor_GHCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend GeomAdaptor_GHCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomAdaptor_GHSurface;
class GeomAdaptor_GHSurface : public Adaptor3d_HSurface {
	public:
		%feature("compactdefaultargs") GeomAdaptor_GHSurface;
		%feature("autodoc", "	:rtype: None
") GeomAdaptor_GHSurface;
		 GeomAdaptor_GHSurface ();
		%feature("compactdefaultargs") GeomAdaptor_GHSurface;
		%feature("autodoc", "	:param S:
	:type S: GeomAdaptor_Surface &
	:rtype: None
") GeomAdaptor_GHSurface;
		 GeomAdaptor_GHSurface (const GeomAdaptor_Surface & S);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param S:
	:type S: GeomAdaptor_Surface &
	:rtype: None
") Set;
		void Set (const GeomAdaptor_Surface & S);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	:rtype: Adaptor3d_Surface
") Surface;
		const Adaptor3d_Surface & Surface ();
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "	:rtype: GeomAdaptor_Surface
") ChangeSurface;
		GeomAdaptor_Surface & ChangeSurface ();
};


%extend GeomAdaptor_GHSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_GeomAdaptor_GHSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_GeomAdaptor_GHSurface::Handle_GeomAdaptor_GHSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_GeomAdaptor_GHSurface;
class Handle_GeomAdaptor_GHSurface : public Handle_Adaptor3d_HSurface {

    public:
        // constructors
        Handle_GeomAdaptor_GHSurface();
        Handle_GeomAdaptor_GHSurface(const Handle_GeomAdaptor_GHSurface &aHandle);
        Handle_GeomAdaptor_GHSurface(const GeomAdaptor_GHSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomAdaptor_GHSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomAdaptor_GHSurface {
    GeomAdaptor_GHSurface* _get_reference() {
    return (GeomAdaptor_GHSurface*)$self->Access();
    }
};

%extend Handle_GeomAdaptor_GHSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend GeomAdaptor_GHSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomAdaptor_Surface;
class GeomAdaptor_Surface : public Adaptor3d_Surface {
	public:
		%feature("compactdefaultargs") GeomAdaptor_Surface;
		%feature("autodoc", "	:rtype: None
") GeomAdaptor_Surface;
		 GeomAdaptor_Surface ();
		%feature("compactdefaultargs") GeomAdaptor_Surface;
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") GeomAdaptor_Surface;
		 GeomAdaptor_Surface (const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") GeomAdaptor_Surface;
		%feature("autodoc", "	* ConstructionError is raised if UFirst>ULast or VFirst>VLast

	:param S:
	:type S: Handle_Geom_Surface &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:param VFirst:
	:type VFirst: float
	:param VLast:
	:type VLast: float
	:param TolU: default value is 0.0
	:type TolU: float
	:param TolV: default value is 0.0
	:type TolV: float
	:rtype: None
") GeomAdaptor_Surface;
		 GeomAdaptor_Surface (const Handle_Geom_Surface & S,const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real VFirst,const Standard_Real VLast,const Standard_Real TolU = 0.0,const Standard_Real TolV = 0.0);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") Load;
		void Load (const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* ConstructionError is raised if UFirst>ULast or VFirst>VLast

	:param S:
	:type S: Handle_Geom_Surface &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:param VFirst:
	:type VFirst: float
	:param VLast:
	:type VLast: float
	:param TolU: default value is 0.0
	:type TolU: float
	:param TolV: default value is 0.0
	:type TolV: float
	:rtype: None
") Load;
		void Load (const Handle_Geom_Surface & S,const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real VFirst,const Standard_Real VLast,const Standard_Real TolU = 0.0,const Standard_Real TolV = 0.0);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	:rtype: Handle_Geom_Surface
") Surface;
		Handle_Geom_Surface Surface ();
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "	:rtype: float
") FirstUParameter;
		Standard_Real FirstUParameter ();
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "	:rtype: float
") LastUParameter;
		Standard_Real LastUParameter ();
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "	:rtype: float
") FirstVParameter;
		Standard_Real FirstVParameter ();
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "	:rtype: float
") LastVParameter;
		Standard_Real LastVParameter ();
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") UContinuity;
		GeomAbs_Shape UContinuity ();
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") VContinuity;
		GeomAbs_Shape VContinuity ();
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "	* Returns the number of U intervals for continuity <S>. May be one if UContinuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbUIntervals;
		Standard_Integer NbUIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "	* Returns the number of V intervals for continuity <S>. May be one if VContinuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbVIntervals;
		Standard_Integer NbVIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "	* Returns the intervals with the requested continuity in the U direction.

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") UIntervals;
		void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "	* Returns the intervals with the requested continuity in the V direction.

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") VIntervals;
		void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "	* Returns a surface trimmed in the U direction equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HSurface
") UTrim;
		Handle_Adaptor3d_HSurface UTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "	* Returns a surface trimmed in the V direction between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HSurface
") VTrim;
		Handle_Adaptor3d_HSurface VTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "	:rtype: bool
") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "	:rtype: bool
") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "	:rtype: float
") UPeriod;
		Standard_Real UPeriod ();
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "	:rtype: float
") VPeriod;
		Standard_Real VPeriod ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameters U,V on the surface.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameters U,V on the surface.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point and the first derivatives on the surface. //! Warning : On the specific case of BSplineSurface: if the surface is cut in interval of continuity at least C1, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Computes the point, the first and second derivatives on the surface. //! Warning : On the specific case of BSplineSurface: if the surface is cut in interval of continuity at least C2, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:rtype: None
") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Computes the point, the first, second and third derivatives on the surface. //! Warning : On the specific case of BSplineSurface: if the surface is cut in interval of continuity at least C3, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:param D3U:
	:type D3U: gp_Vec
	:param D3V:
	:type D3V: gp_Vec
	:param D3UUV:
	:type D3UUV: gp_Vec
	:param D3UVV:
	:type D3UVV: gp_Vec
	:rtype: None
") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V). //! Warning : On the specific case of BSplineSurface: if the surface is cut in interval of continuity CN, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "	* Returns the parametric U resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") UResolution;
		Standard_Real UResolution (const Standard_Real R3d);
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "	* Returns the parametric V resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") VResolution;
		Standard_Real VResolution (const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the surface : Plane, Cylinder, Cone, Sphere, Torus, BezierSurface, BSplineSurface, SurfaceOfRevolution, SurfaceOfExtrusion, OtherSurface

	:rtype: GeomAbs_SurfaceType
") GetType;
		GeomAbs_SurfaceType GetType ();
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	:rtype: gp_Pln
") Plane;
		gp_Pln Plane ();
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "	:rtype: gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder ();
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "	:rtype: gp_Cone
") Cone;
		gp_Cone Cone ();
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "	:rtype: gp_Sphere
") Sphere;
		gp_Sphere Sphere ();
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "	:rtype: gp_Torus
") Torus;
		gp_Torus Torus ();
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "	:rtype: int
") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "	:rtype: int
") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "	:rtype: int
") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "	:rtype: int
") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "	:rtype: bool
") IsURational;
		Standard_Boolean IsURational ();
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "	:rtype: bool
") IsVRational;
		Standard_Boolean IsVRational ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	* This will NOT make a copy of the Bezier Surface : If you want to modify the Surface please make a copy yourself Also it will NOT trim the surface to myU/VFirst/Last.

	:rtype: Handle_Geom_BezierSurface
") Bezier;
		Handle_Geom_BezierSurface Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	* This will NOT make a copy of the BSpline Surface : If you want to modify the Surface please make a copy yourself Also it will NOT trim the surface to myU/VFirst/Last.

	:rtype: Handle_Geom_BSplineSurface
") BSpline;
		Handle_Geom_BSplineSurface BSpline ();
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "	:rtype: gp_Ax1
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:rtype: gp_Dir
") Direction;
		gp_Dir Direction ();
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HCurve
") BasisCurve;
		Handle_Adaptor3d_HCurve BasisCurve ();
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") BasisSurface;
		Handle_Adaptor3d_HSurface BasisSurface ();
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "	:rtype: float
") OffsetValue;
		Standard_Real OffsetValue ();
};


%extend GeomAdaptor_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomAdaptor_HCurve;
class GeomAdaptor_HCurve : public GeomAdaptor_GHCurve {
	public:
		%feature("compactdefaultargs") GeomAdaptor_HCurve;
		%feature("autodoc", "	:rtype: None
") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve ();
		%feature("compactdefaultargs") GeomAdaptor_HCurve;
		%feature("autodoc", "	:param AS:
	:type AS: GeomAdaptor_Curve &
	:rtype: None
") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve (const GeomAdaptor_Curve & AS);
		%feature("compactdefaultargs") GeomAdaptor_HCurve;
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Curve &
	:rtype: None
") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve (const Handle_Geom_Curve & S);
		%feature("compactdefaultargs") GeomAdaptor_HCurve;
		%feature("autodoc", "	* ConstructionError is raised if UFirst>ULast or VFirst>VLast

	:param S:
	:type S: Handle_Geom_Curve &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None
") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve (const Handle_Geom_Curve & S,const Standard_Real UFirst,const Standard_Real ULast);
};


%extend GeomAdaptor_HCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_GeomAdaptor_HCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_GeomAdaptor_HCurve::Handle_GeomAdaptor_HCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_GeomAdaptor_HCurve;
class Handle_GeomAdaptor_HCurve : public Handle_GeomAdaptor_GHCurve {

    public:
        // constructors
        Handle_GeomAdaptor_HCurve();
        Handle_GeomAdaptor_HCurve(const Handle_GeomAdaptor_HCurve &aHandle);
        Handle_GeomAdaptor_HCurve(const GeomAdaptor_HCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomAdaptor_HCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomAdaptor_HCurve {
    GeomAdaptor_HCurve* _get_reference() {
    return (GeomAdaptor_HCurve*)$self->Access();
    }
};

%extend Handle_GeomAdaptor_HCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend GeomAdaptor_HCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomAdaptor_HSurface;
class GeomAdaptor_HSurface : public GeomAdaptor_GHSurface {
	public:
		%feature("compactdefaultargs") GeomAdaptor_HSurface;
		%feature("autodoc", "	:rtype: None
") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface ();
		%feature("compactdefaultargs") GeomAdaptor_HSurface;
		%feature("autodoc", "	:param AS:
	:type AS: GeomAdaptor_Surface &
	:rtype: None
") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface (const GeomAdaptor_Surface & AS);
		%feature("compactdefaultargs") GeomAdaptor_HSurface;
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface (const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") GeomAdaptor_HSurface;
		%feature("autodoc", "	* ConstructionError is raised if UFirst>ULast or VFirst>VLast

	:param S:
	:type S: Handle_Geom_Surface &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:param VFirst:
	:type VFirst: float
	:param VLast:
	:type VLast: float
	:param TolU: default value is 0.0
	:type TolU: float
	:param TolV: default value is 0.0
	:type TolV: float
	:rtype: None
") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface (const Handle_Geom_Surface & S,const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real VFirst,const Standard_Real VLast,const Standard_Real TolU = 0.0,const Standard_Real TolV = 0.0);
};


%extend GeomAdaptor_HSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_GeomAdaptor_HSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_GeomAdaptor_HSurface::Handle_GeomAdaptor_HSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_GeomAdaptor_HSurface;
class Handle_GeomAdaptor_HSurface : public Handle_GeomAdaptor_GHSurface {

    public:
        // constructors
        Handle_GeomAdaptor_HSurface();
        Handle_GeomAdaptor_HSurface(const Handle_GeomAdaptor_HSurface &aHandle);
        Handle_GeomAdaptor_HSurface(const GeomAdaptor_HSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomAdaptor_HSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomAdaptor_HSurface {
    GeomAdaptor_HSurface* _get_reference() {
    return (GeomAdaptor_HSurface*)$self->Access();
    }
};

%extend Handle_GeomAdaptor_HSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend GeomAdaptor_HSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
