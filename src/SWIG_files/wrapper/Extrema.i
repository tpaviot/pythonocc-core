/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
%define EXTREMADOCSTRING
"Extrema module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_Extrema.html"
%enddef
%module (package="OCC.Core", docstring=EXTREMADOCSTRING) Extrema

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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
#include<Extrema_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<math_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<Geom_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Precision_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import math.i
%import Adaptor3d.i
%import Adaptor2d.i
%import Geom2d.i
%import gp.i
%import GeomAbs.i
%import TColStd.i
%import Geom.i
%import GeomAdaptor.i
/* public enums */
enum Extrema_ExtAlgo {
	Extrema_ExtAlgo_Grad = 0,
	Extrema_ExtAlgo_Tree = 1,
};

enum Extrema_ExtFlag {
	Extrema_ExtFlag_MIN = 0,
	Extrema_ExtFlag_MAX = 1,
	Extrema_ExtFlag_MINMAX = 2,
};

enum Extrema_ElementType {
	Extrema_Node = 0,
	Extrema_UIsoEdge = 1,
	Extrema_VIsoEdge = 2,
	Extrema_Face = 3,
};

/* end public enums declaration */

/* handles */
%wrap_handle(Extrema_ExtPExtS)
%wrap_handle(Extrema_ExtPRevS)
%wrap_handle(Extrema_HArray1OfPOnSurf)
%wrap_handle(Extrema_HArray1OfPOnCurv)
%wrap_handle(Extrema_HArray1OfPOnCurv2d)
%wrap_handle(Extrema_HArray2OfPOnCurv2d)
%wrap_handle(Extrema_HArray2OfPOnCurv)
%wrap_handle(Extrema_HArray2OfPOnSurf)
%wrap_handle(Extrema_HArray2OfPOnSurfParams)
/* end handles declaration */

/* templates */
%template(Extrema_SequenceOfPOnSurf) NCollection_Sequence <Extrema_POnSurf>;
%template(Extrema_Array2OfPOnSurfParams) NCollection_Array2 <Extrema_POnSurfParams>;
%template(Extrema_Array1OfPOnCurv) NCollection_Array1 <Extrema_POnCurv>;

%extend NCollection_Array1 <Extrema_POnCurv> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Extrema_Array2OfPOnSurf) NCollection_Array2 <Extrema_POnSurf>;
%template(Extrema_Array2OfPOnCurv2d) NCollection_Array2 <Extrema_POnCurv2d>;
%template(Extrema_Array1OfPOnCurv2d) NCollection_Array1 <Extrema_POnCurv2d>;

%extend NCollection_Array1 <Extrema_POnCurv2d> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Extrema_SequenceOfPOnCurv) NCollection_Sequence <Extrema_POnCurv>;
%template(Extrema_SequenceOfPOnCurv2d) NCollection_Sequence <Extrema_POnCurv2d>;
%template(Extrema_UBTreeOfSphere) NCollection_UBTree <Standard_Integer , Bnd_Sphere>;
%template(Extrema_UBTreeFillerOfSphere) NCollection_UBTreeFiller <Standard_Integer , Bnd_Sphere>;
%template(Extrema_Array2OfPOnCurv) NCollection_Array2 <Extrema_POnCurv>;
%template(Extrema_Array1OfPOnSurf) NCollection_Array1 <Extrema_POnSurf>;

%extend NCollection_Array1 <Extrema_POnSurf> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <Extrema_POnSurf> Extrema_SequenceOfPOnSurf;
typedef NCollection_Array2 <Extrema_POnSurfParams> Extrema_Array2OfPOnSurfParams;
typedef NCollection_Array1 <Extrema_POnCurv> Extrema_Array1OfPOnCurv;
typedef NCollection_Array2 <Extrema_POnSurf> Extrema_Array2OfPOnSurf;
typedef NCollection_Array2 <Extrema_POnCurv2d> Extrema_Array2OfPOnCurv2d;
typedef NCollection_Array1 <Extrema_POnCurv2d> Extrema_Array1OfPOnCurv2d;
typedef NCollection_Sequence <Extrema_POnCurv> Extrema_SequenceOfPOnCurv;
typedef NCollection_Sequence <Extrema_POnCurv2d> Extrema_SequenceOfPOnCurv2d;
typedef NCollection_UBTree <Standard_Integer , Bnd_Sphere> Extrema_UBTreeOfSphere;
typedef NCollection_UBTreeFiller <Standard_Integer , Bnd_Sphere> Extrema_UBTreeFillerOfSphere;
typedef NCollection_Handle <Extrema_UBTreeOfSphere> Extrema_HUBTreeOfSphere;
typedef NCollection_Array2 <Extrema_POnCurv> Extrema_Array2OfPOnCurv;
typedef NCollection_Array1 <Extrema_POnSurf> Extrema_Array1OfPOnSurf;
/* end typedefs declaration */

%nodefaultctor Extrema_CCLocFOfLocECC;
class Extrema_CCLocFOfLocECC : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") CurvePtr;
		%feature("autodoc", "	* Returns a pointer to the curve specified in the constructor or in SetCurve() method.

	:param theRank:
	:type theRank: int
	:rtype: Standard_Address
") CurvePtr;
		Standard_Address CurvePtr (const Standard_Integer theRank);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* Calculate Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC;
		%feature("autodoc", "	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCLocFOfLocECC;
		 Extrema_CCLocFOfLocECC (const Standard_Real thetol = 1.0e-10);
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCLocFOfLocECC;
		 Extrema_CCLocFOfLocECC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real thetol = 1.0e-10);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Return the number of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Return the points of the Nth extreme distance.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	* Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.

	:param C:
	:type C: Standard_Address
	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance (const Standard_Address C);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param theRank:
	:type theRank: int
	:param C1:
	:type C1: Adaptor3d_Curve &
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor3d_Curve & C1);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param theTol:
	:type theTol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Return the value of the Nth distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	* Determines of boundaries of subinterval for find of root.

	:param theUfirst:
	:type theUfirst: math_Vector &
	:param theUlast:
	:type theUlast: math_Vector &
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const math_Vector & theUfirst,const math_Vector & theUlast);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* Returns a tolerance specified in the constructor or in SetTolerance() method.

	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Calculate Fi(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Calculate Fi(U,V) and Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
};


%extend Extrema_CCLocFOfLocECC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_CCLocFOfLocECC2d;
class Extrema_CCLocFOfLocECC2d : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") CurvePtr;
		%feature("autodoc", "	* Returns a pointer to the curve specified in the constructor or in SetCurve() method.

	:param theRank:
	:type theRank: int
	:rtype: Standard_Address
") CurvePtr;
		Standard_Address CurvePtr (const Standard_Integer theRank);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* Calculate Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC2d;
		%feature("autodoc", "	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCLocFOfLocECC2d;
		 Extrema_CCLocFOfLocECC2d (const Standard_Real thetol = 1.0e-10);
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC2d;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param thetol: default value is 1.0e-10
	:type thetol: float
	:rtype: None
") Extrema_CCLocFOfLocECC2d;
		 Extrema_CCLocFOfLocECC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real thetol = 1.0e-10);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Return the number of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Return the points of the Nth extreme distance.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	* Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.

	:param C:
	:type C: Standard_Address
	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance (const Standard_Address C);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param theRank:
	:type theRank: int
	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor2d_Curve2d & C1);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param theTol:
	:type theTol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Return the value of the Nth distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	* Determines of boundaries of subinterval for find of root.

	:param theUfirst:
	:type theUfirst: math_Vector &
	:param theUlast:
	:type theUlast: math_Vector &
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const math_Vector & theUfirst,const math_Vector & theUlast);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* Returns a tolerance specified in the constructor or in SetTolerance() method.

	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Calculate Fi(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Calculate Fi(U,V) and Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
};


%extend Extrema_CCLocFOfLocECC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Extrema_Curve2dTool {
	public:
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Circ2d
") Circle;
		static gp_Circ2d Circle (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		static void D0 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None
") D1;
		static void D1 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2.

	:param C:
	:type C: Adaptor2d_Curve2d &
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
		static void D2 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative.

	:param C:
	:type C: Adaptor2d_Curve2d &
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
		static void D3 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN (const Adaptor2d_Curve2d & C,const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") DeflCurvIntervals;
		%feature("autodoc", "	* Returns the parameters bounding the intervals of subdivision of curve according to Curvature deflection. Value of deflection is defined in method. //!

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: opencascade::handle<TColStd_HArray1OfReal>
") DeflCurvIntervals;
		static opencascade::handle<TColStd_HArray1OfReal> DeflCurvIntervals (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: int
") Degree;
		static Standard_Integer Degree (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		static void Intervals (const Adaptor2d_Curve2d & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: bool
") IsRational;
		static Standard_Boolean IsRational (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Lin2d
") Line;
		static gp_Lin2d Line (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (const Adaptor2d_Curve2d & C,const GeomAbs_Shape S);
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: int
") NbKnots;
		static Standard_Integer NbKnots (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: int
") NbPoles;
		static Standard_Integer NbPoles (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float
") Period;
		static Standard_Real Period (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the parametric resolution corresponding to the real space resolution <R3d>.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const Adaptor2d_Curve2d & C,const Standard_Real R3d);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Adaptor2d_Curve2d & C,const Standard_Real U);
};


%extend Extrema_Curve2dTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Extrema_CurveTool {
	public:
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: opencascade::handle<Geom_BSplineCurve>
") BSpline;
		static opencascade::handle<Geom_BSplineCurve> BSpline (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: opencascade::handle<Geom_BezierCurve>
") Bezier;
		static opencascade::handle<Geom_BezierCurve> Bezier (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: gp_Circ
") Circle;
		static gp_Circ Circle (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		static void D0 (const Adaptor3d_Curve & C,const Standard_Real U,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None
") D1;
		static void D1 (const Adaptor3d_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
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
		static void D2 (const Adaptor3d_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
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
		static void D3 (const Adaptor3d_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Adaptor3d_Curve & C,const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") DeflCurvIntervals;
		%feature("autodoc", "	* Returns the parameters bounding the intervals of subdivision of curve according to Curvature deflection. Value of deflection is defined in method. //!

	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: opencascade::handle<TColStd_HArray1OfReal>
") DeflCurvIntervals;
		static opencascade::handle<TColStd_HArray1OfReal> DeflCurvIntervals (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: int
") Degree;
		static Standard_Integer Degree (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: gp_Elips
") Ellipse;
		static gp_Elips Ellipse (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: gp_Hypr
") Hyperbola;
		static gp_Hypr Hyperbola (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param C:
	:type C: Adaptor3d_Curve &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		static void Intervals (Adaptor3d_Curve & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: bool
") IsRational;
		static Standard_Boolean IsRational (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: gp_Lin
") Line;
		static gp_Lin Line (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (Adaptor3d_Curve & C,const GeomAbs_Shape S);
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: int
") NbKnots;
		static Standard_Integer NbKnots (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: int
") NbPoles;
		static Standard_Integer NbPoles (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: gp_Parab
") Parabola;
		static gp_Parab Parabola (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: float
") Period;
		static Standard_Real Period (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const Adaptor3d_Curve & C,const Standard_Real R3d);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Adaptor3d_Curve & C,const Standard_Real U);
};


%extend Extrema_CurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ECC;
class Extrema_ECC {
	public:
		%feature("compactdefaultargs") Extrema_ECC;
		%feature("autodoc", "	* Calculates all the distances as above between Uinf and Usup for C1 and between Vinf and Vsup for C2.

	:rtype: None
") Extrema_ECC;
		 Extrema_ECC ();
		%feature("compactdefaultargs") Extrema_ECC;
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(C1(u),C2(v)) has an extremum when gradient(f)=0. The algorithm uses Evtushenko's global optimization solver.

	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:rtype: None
") Extrema_ECC;
		 Extrema_ECC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2);
		%feature("compactdefaultargs") Extrema_ECC;
		%feature("autodoc", "	* Calculates all the distances as above between Uinf and Usup for C1 and between Vinf and Vsup for C2.

	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:rtype: None
") Extrema_ECC;
		 Extrema_ECC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup);
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "	* Get flag for single extrema computation. Works on parametric solver only.

	:rtype: bool
") GetSingleSolutionFlag;
		Standard_Boolean GetSingleSolutionFlag ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns state of myParallel flag.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs calculations.

	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "	* Set params in case of empty constructor is usage.

	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:rtype: None
") SetParams;
		void SetParams (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup);
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "	* Set flag for single extrema computation. Works on parametric solver only.

	:param theSingleSolutionFlag:
	:type theSingleSolutionFlag: bool
	:rtype: None
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag (const Standard_Boolean theSingleSolutionFlag);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth square extremum distance.

	:param N: default value is 1
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
};


%extend Extrema_ECC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ECC2d;
class Extrema_ECC2d {
	public:
		%feature("compactdefaultargs") Extrema_ECC2d;
		%feature("autodoc", "	* Calculates all the distances as above between Uinf and Usup for C1 and between Vinf and Vsup for C2.

	:rtype: None
") Extrema_ECC2d;
		 Extrema_ECC2d ();
		%feature("compactdefaultargs") Extrema_ECC2d;
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(C1(u),C2(v)) has an extremum when gradient(f)=0. The algorithm uses Evtushenko's global optimization solver.

	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_ECC2d;
		 Extrema_ECC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2);
		%feature("compactdefaultargs") Extrema_ECC2d;
		%feature("autodoc", "	* Calculates all the distances as above between Uinf and Usup for C1 and between Vinf and Vsup for C2.

	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:rtype: None
") Extrema_ECC2d;
		 Extrema_ECC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup);
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "	* Get flag for single extrema computation. Works on parametric solver only.

	:rtype: bool
") GetSingleSolutionFlag;
		Standard_Boolean GetSingleSolutionFlag ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns state of myParallel flag.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs calculations.

	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "	* Set params in case of empty constructor is usage.

	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:rtype: None
") SetParams;
		void SetParams (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup);
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "	* Set flag for single extrema computation. Works on parametric solver only.

	:param theSingleSolutionFlag:
	:type theSingleSolutionFlag: bool
	:rtype: None
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag (const Standard_Boolean theSingleSolutionFlag);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth square extremum distance.

	:param N: default value is 1
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
};


%extend Extrema_ECC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ELPCOfLocateExtPC;
class Extrema_ELPCOfLocateExtPC {
	public:
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC ();
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC;
		%feature("autodoc", "	* It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs all the zeros inside the definition range of the curve. Zeros are searched between uinf and usup. Tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(F(Un)-F(Un-1)) < Tol.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC;
		%feature("autodoc", "	* It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs all the zeros inside the definition range of the curve. Tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(F(Un)-F(Un-1)) < Tol.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* initializes the fields of the algorithm.

	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the <N>th extremum distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* An exception is raised if the fields have not been initialized.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the <N>th extremum distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the <N>th extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "	* if the curve is a trimmed curve, dist1 is a square distance between <P> and the point of parameter FirstParameter <P1> and dist2 is a square distance between <P> and the point of parameter LastParameter <P2>.

	:param dist1:
	:type dist1: float &
	:param dist2:
	:type dist2: float &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & P1,gp_Pnt & P2);
};


%extend Extrema_ELPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ELPCOfLocateExtPC2d;
class Extrema_ELPCOfLocateExtPC2d {
	public:
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d ();
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC2d;
		%feature("autodoc", "	* It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs all the zeros inside the definition range of the curve. Zeros are searched between uinf and usup. Tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(F(Un)-F(Un-1)) < Tol.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC2d;
		%feature("autodoc", "	* It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs all the zeros inside the definition range of the curve. Tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(F(Un)-F(Un-1)) < Tol.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* initializes the fields of the algorithm.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the <N>th extremum distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* An exception is raised if the fields have not been initialized.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the <N>th extremum distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the <N>th extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "	* if the curve is a trimmed curve, dist1 is a square distance between <P> and the point of parameter FirstParameter <P1> and dist2 is a square distance between <P> and the point of parameter LastParameter <P2>.

	:param dist1:
	:type dist1: float &
	:param dist2:
	:type dist2: float &
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & P1,gp_Pnt2d & P2);
};


%extend Extrema_ELPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_EPCOfELPCOfLocateExtPC;
class Extrema_EPCOfELPCOfLocateExtPC {
	public:
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC ();
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC;
		%feature("autodoc", "	* It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs all the zeros inside the definition range of the curve. NbU is used to locate the close points to find the zeros. Tol and TolU are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(Un-Un-1) < TolU and abs(F(Un)-F(Un-1)) < Tol.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: int
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC;
		%feature("autodoc", "	* It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs all the zeros inside the definition range of the curve. NbU is used to locate the close points to find the zeros. Zeros are searched between umin and usup. Tol and TolU are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(Un-Un-1) < TolU and abs(F(Un)-F(Un-1)) < Tol.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: int
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the Nth extremum distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done with the point P. An exception is raised if the fields have not been initialized.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth extremum distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
};


%extend Extrema_EPCOfELPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_EPCOfELPCOfLocateExtPC2d;
class Extrema_EPCOfELPCOfLocateExtPC2d {
	public:
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d ();
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "	* It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs all the zeros inside the definition range of the curve. NbU is used to locate the close points to find the zeros. Tol and TolU are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(Un-Un-1) < TolU and abs(F(Un)-F(Un-1)) < Tol.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: int
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "	* It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs all the zeros inside the definition range of the curve. NbU is used to locate the close points to find the zeros. Zeros are searched between umin and usup. Tol and TolU are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(Un-Un-1) < TolU and abs(F(Un)-F(Un-1)) < Tol.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: int
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the Nth extremum distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done with the point P. An exception is raised if the fields have not been initialized.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth extremum distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
};


%extend Extrema_EPCOfELPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_EPCOfExtPC;
class Extrema_EPCOfExtPC {
	public:
		%feature("compactdefaultargs") Extrema_EPCOfExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC ();
		%feature("compactdefaultargs") Extrema_EPCOfExtPC;
		%feature("autodoc", "	* It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs all the zeros inside the definition range of the curve. NbU is used to locate the close points to find the zeros. Tol and TolU are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(Un-Un-1) < TolU and abs(F(Un)-F(Un-1)) < Tol.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: int
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Extrema_EPCOfExtPC;
		%feature("autodoc", "	* It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs all the zeros inside the definition range of the curve. NbU is used to locate the close points to find the zeros. Zeros are searched between umin and usup. Tol and TolU are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(Un-Un-1) < TolU and abs(F(Un)-F(Un-1)) < Tol.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: int
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the Nth extremum distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done with the point P. An exception is raised if the fields have not been initialized.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth extremum distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
};


%extend Extrema_EPCOfExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_EPCOfExtPC2d;
class Extrema_EPCOfExtPC2d {
	public:
		%feature("compactdefaultargs") Extrema_EPCOfExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d ();
		%feature("compactdefaultargs") Extrema_EPCOfExtPC2d;
		%feature("autodoc", "	* It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs all the zeros inside the definition range of the curve. NbU is used to locate the close points to find the zeros. Tol and TolU are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(Un-Un-1) < TolU and abs(F(Un)-F(Un-1)) < Tol.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: int
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Extrema_EPCOfExtPC2d;
		%feature("autodoc", "	* It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs all the zeros inside the definition range of the curve. NbU is used to locate the close points to find the zeros. Zeros are searched between umin and usup. Tol and TolU are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(Un-Un-1) < TolU and abs(F(Un)-F(Un-1)) < Tol.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: int
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param NbU:
	:type NbU: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the Nth extremum distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done with the point P. An exception is raised if the fields have not been initialized.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth extremum distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
};


%extend Extrema_EPCOfExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtCC;
class Extrema_ExtCC {
	public:
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Extrema_ExtCC;
		 Extrema_ExtCC (const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "	* It calculates all the distances.

	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Extrema_ExtCC;
		 Extrema_ExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "	* It calculates all the distances.

	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Extrema_ExtCC;
		 Extrema_ExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "	* Get flag for single extrema computation. Works on parametric solver only.

	:rtype: bool
") GetSingleSolutionFlag;
		Standard_Boolean GetSingleSolutionFlag ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the two curves are parallel.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param theRank:
	:type theRank: int
	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param theRank:
	:type theRank: int
	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "	:param theRank:
	:type theRank: int
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") SetRange;
		void SetRange (const Standard_Integer theRank,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "	* Set flag for single extrema computation. Works on parametric solver only.

	:param theSingleSolutionFlag:
	:type theSingleSolutionFlag: bool
	:rtype: None
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag (const Standard_Boolean theSingleSolutionFlag);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param theRank:
	:type theRank: int
	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Integer theRank,const Standard_Real Tol);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N: default value is 1
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "	* if the curve is a trimmed curve, dist11 is a square distance between the point on C1 of parameter FirstParameter and the point of parameter FirstParameter on C2.

	:param dist11:
	:type dist11: float &
	:param distP12:
	:type distP12: float &
	:param distP21:
	:type distP21: float &
	:param distP22:
	:type distP22: float &
	:param P11:
	:type P11: gp_Pnt
	:param P12:
	:type P12: gp_Pnt
	:param P21:
	:type P21: gp_Pnt
	:param P22:
	:type P22: gp_Pnt
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & P11,gp_Pnt & P12,gp_Pnt & P21,gp_Pnt & P22);
};


%extend Extrema_ExtCC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtCC2d;
class Extrema_ExtCC2d {
	public:
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d ();
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "	* It calculates all the distances.

	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "	* It calculates all the distances.

	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "	* Get flag for single extrema computation. Works on parametric solver only.

	:rtype: bool
") GetSingleSolutionFlag;
		Standard_Boolean GetSingleSolutionFlag ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* initializes the fields.

	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:param TolC1: default value is 1.0e-10
	:type TolC1: float
	:param TolC2: default value is 1.0e-10
	:type TolC2: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C2,const Standard_Real V1,const Standard_Real V2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the two curves are parallel.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const Standard_Real U1,const Standard_Real U2);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "	* Set flag for single extrema computation. Works on parametric solver only.

	:param theSingleSolutionFlag:
	:type theSingleSolutionFlag: bool
	:rtype: None
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag (const Standard_Boolean theSingleSolutionFlag);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N: default value is 1
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "	* if the curve is a trimmed curve, dist11 is a square distance between the point on C1 of parameter FirstParameter and the point of parameter FirstParameter on C2.

	:param dist11:
	:type dist11: float &
	:param distP12:
	:type distP12: float &
	:param distP21:
	:type distP21: float &
	:param distP22:
	:type distP22: float &
	:param P11:
	:type P11: gp_Pnt2d
	:param P12:
	:type P12: gp_Pnt2d
	:param P21:
	:type P21: gp_Pnt2d
	:param P22:
	:type P22: gp_Pnt2d
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & P11,gp_Pnt2d & P12,gp_Pnt2d & P21,gp_Pnt2d & P22);
};


%extend Extrema_ExtCC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtCS;
class Extrema_ExtCS {
	public:
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtCS;
		 Extrema_ExtCS ();
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "	* It calculates all the distances between C and S.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param TolC:
	:type TolC: float
	:param TolS:
	:type TolS: float
	:rtype: None
") Extrema_ExtCS;
		 Extrema_ExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Real TolC,const Standard_Real TolS);
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "	* It calculates all the distances between C and S. UCinf and UCmax are the start and end parameters of the curve.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param UCinf:
	:type UCinf: float
	:param UCsup:
	:type UCsup: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param TolC:
	:type TolC: float
	:param TolS:
	:type TolS: float
	:rtype: None
") Extrema_ExtCS;
		 Extrema_ExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Real UCinf,const Standard_Real UCsup,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolC,const Standard_Real TolS);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes the fields of the algorithm.

	:param S:
	:type S: Adaptor3d_Surface &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param TolC:
	:type TolC: float
	:param TolS:
	:type TolS: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolC,const Standard_Real TolS);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the curve is on a parallel surface.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the distances. An exception is raised if the fieds have not been initialized.

	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnSurf &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnSurf & P2);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
};


%extend Extrema_ExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtElC;
class Extrema_ExtElC {
	public:
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC ();
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between two lines. AngTol is used to test if the lines are parallel: Angle(C1,C2) < AngTol.

	:param C1:
	:type C1: gp_Lin
	:param C2:
	:type C2: gp_Lin
	:param AngTol:
	:type AngTol: float
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Lin & C2,const Standard_Real AngTol);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between a line and a circle.

	:param C1:
	:type C1: gp_Lin
	:param C2:
	:type C2: gp_Circ
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Circ & C2,const Standard_Real Tol);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between a line and an elipse.

	:param C1:
	:type C1: gp_Lin
	:param C2:
	:type C2: gp_Elips
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Elips & C2);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between a line and a hyperbola.

	:param C1:
	:type C1: gp_Lin
	:param C2:
	:type C2: gp_Hypr
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Hypr & C2);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between a line and a parabola.

	:param C1:
	:type C1: gp_Lin
	:param C2:
	:type C2: gp_Parab
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Parab & C2);
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "	* Calculates the distance between two circles. The circles can be parallel or identical.

	:param C1:
	:type C1: gp_Circ
	:param C2:
	:type C2: gp_Circ
	:rtype: None
") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Circ & C1,const gp_Circ & C2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the two curves are parallel.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N: default value is 1
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
};


%extend Extrema_ExtElC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtElC2d;
class Extrema_ExtElC2d {
	public:
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d ();
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between two lines. AngTol is used to test if the lines are parallel: Angle(C1,C2) < AngTol.

	:param C1:
	:type C1: gp_Lin2d
	:param C2:
	:type C2: gp_Lin2d
	:param AngTol:
	:type AngTol: float
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Lin2d & C2,const Standard_Real AngTol);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between a line and a circle.

	:param C1:
	:type C1: gp_Lin2d
	:param C2:
	:type C2: gp_Circ2d
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Circ2d & C2,const Standard_Real Tol);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between a line and an elipse.

	:param C1:
	:type C1: gp_Lin2d
	:param C2:
	:type C2: gp_Elips2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Elips2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between a line and a hyperbola.

	:param C1:
	:type C1: gp_Lin2d
	:param C2:
	:type C2: gp_Hypr2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Hypr2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between a line and a parabola.

	:param C1:
	:type C1: gp_Lin2d
	:param C2:
	:type C2: gp_Parab2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Parab2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between two circles. The circles can be parallel or identical.

	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: gp_Circ2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Circ2d & C1,const gp_Circ2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between a circle and an elipse.

	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: gp_Elips2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Circ2d & C1,const gp_Elips2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between a circle and a hyperbola.

	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: gp_Hypr2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Circ2d & C1,const gp_Hypr2d & C2);
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "	* Calculates the distance between a circle and a parabola.

	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: gp_Parab2d
	:rtype: None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Circ2d & C1,const gp_Parab2d & C2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the two curves are parallel.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N: default value is 1
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
};


%extend Extrema_ExtElC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtElCS;
class Extrema_ExtElCS {
	public:
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS ();
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a line and a plane. The line can be on the plane or on a parallel plane.

	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Pln
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Pln & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a line and a cylinder.

	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Cylinder
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Cylinder & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a line and a cone.

	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Cone
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Cone & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a line and a sphere.

	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Sphere
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Sphere & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a line and a torus.

	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Torus
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Torus & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a circle and a plane.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Pln
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Pln & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a circle and a cylinder.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Cylinder
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Cylinder & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a circle and a cone.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Cone
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Cone & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a circle and a sphere.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Sphere
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Sphere & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a circle and a torus.

	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Torus
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Torus & S);
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "	* Calculates the distances between a hyperbola and a plane.

	:param C:
	:type C: gp_Hypr
	:param S:
	:type S: gp_Pln
	:rtype: None
") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Hypr & C,const gp_Pln & S);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the curve is on a parallel surface.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Pln
	:rtype: None
") Perform;
		void Perform (const gp_Lin & C,const gp_Pln & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Cylinder
	:rtype: None
") Perform;
		void Perform (const gp_Lin & C,const gp_Cylinder & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Cone
	:rtype: None
") Perform;
		void Perform (const gp_Lin & C,const gp_Cone & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Sphere
	:rtype: None
") Perform;
		void Perform (const gp_Lin & C,const gp_Sphere & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param S:
	:type S: gp_Torus
	:rtype: None
") Perform;
		void Perform (const gp_Lin & C,const gp_Torus & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Pln
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const gp_Pln & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Cylinder
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const gp_Cylinder & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Cone
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const gp_Cone & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Sphere
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const gp_Sphere & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param S:
	:type S: gp_Torus
	:rtype: None
") Perform;
		void Perform (const gp_Circ & C,const gp_Torus & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Hypr
	:param S:
	:type S: gp_Pln
	:rtype: None
") Perform;
		void Perform (const gp_Hypr & C,const gp_Pln & S);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points of the Nth extremum distance. P1 is on the curve, P2 on the surface.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnSurf &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnSurf & P2);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N: default value is 1
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
};


%extend Extrema_ExtElCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtElSS;
class Extrema_ExtElSS {
	public:
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS ();
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "	* Calculates the distances between 2 planes. These planes can be parallel.

	:param S1:
	:type S1: gp_Pln
	:param S2:
	:type S2: gp_Pln
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Pln & S1,const gp_Pln & S2);
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "	* Calculates the distances between a plane and a sphere.

	:param S1:
	:type S1: gp_Pln
	:param S2:
	:type S2: gp_Sphere
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Pln & S1,const gp_Sphere & S2);
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "	* Calculates the distances between 2 spheres. These spheres can be parallel.

	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Sphere
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Sphere & S1,const gp_Sphere & S2);
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "	* Calculates the distances between a sphere and a cylinder.

	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Cylinder
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Sphere & S1,const gp_Cylinder & S2);
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "	* Calculates the distances between a sphere and a cone.

	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Cone
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Sphere & S1,const gp_Cone & S2);
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "	* Calculates the distances between a sphere and a torus.

	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Torus
	:rtype: None
") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Sphere & S1,const gp_Torus & S2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the two surfaces are parallel.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S1:
	:type S1: gp_Pln
	:param S2:
	:type S2: gp_Pln
	:rtype: None
") Perform;
		void Perform (const gp_Pln & S1,const gp_Pln & S2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S1:
	:type S1: gp_Pln
	:param S2:
	:type S2: gp_Sphere
	:rtype: None
") Perform;
		void Perform (const gp_Pln & S1,const gp_Sphere & S2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Sphere
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S1,const gp_Sphere & S2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Cylinder
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S1,const gp_Cylinder & S2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Cone
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S1,const gp_Cone & S2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S1:
	:type S1: gp_Sphere
	:param S2:
	:type S2: gp_Torus
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S1,const gp_Torus & S2);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the points for the Nth resulting distance. P1 is on the first surface, P2 on the second one.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnSurf &
	:param P2:
	:type P2: Extrema_POnSurf &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnSurf & P1,Extrema_POnSurf & P2);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N: default value is 1
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
};


%extend Extrema_ExtElSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtPC;
class Extrema_ExtPC {
	public:
		%feature("compactdefaultargs") Extrema_ExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPC;
		 Extrema_ExtPC ();
		%feature("compactdefaultargs") Extrema_ExtPC;
		%feature("autodoc", "	* It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs all the zeros inside the definition range of the curve. Zeros are searched between uinf and usup. Tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(F(Un)-F(Un-1)) < Tol.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ExtPC;
		 Extrema_ExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Extrema_ExtPC;
		%feature("autodoc", "	* It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs all the zeros inside the definition range of the curve. Tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(F(Un)-F(Un-1)) < Tol.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ExtPC;
		 Extrema_ExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* initializes the fields of the algorithm.

	:param C:
	:type C: Adaptor3d_Curve &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the <N>th extremum distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* An exception is raised if the fields have not been initialized.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the <N>th extremum distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the <N>th extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "	* if the curve is a trimmed curve, dist1 is a square distance between <P> and the point of parameter FirstParameter <P1> and dist2 is a square distance between <P> and the point of parameter LastParameter <P2>.

	:param dist1:
	:type dist1: float &
	:param dist2:
	:type dist2: float &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & P1,gp_Pnt & P2);
};


%extend Extrema_ExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtPC2d;
class Extrema_ExtPC2d {
	public:
		%feature("compactdefaultargs") Extrema_ExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d ();
		%feature("compactdefaultargs") Extrema_ExtPC2d;
		%feature("autodoc", "	* It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs all the zeros inside the definition range of the curve. Zeros are searched between uinf and usup. Tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(F(Un)-F(Un-1)) < Tol.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Extrema_ExtPC2d;
		%feature("autodoc", "	* It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs all the zeros inside the definition range of the curve. Tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(F(Un)-F(Un-1)) < Tol.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* initializes the fields of the algorithm.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param TolF: default value is 1.0e-10
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the <N>th extremum distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* An exception is raised if the fields have not been initialized.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the <N>th extremum distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the <N>th extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "	* if the curve is a trimmed curve, dist1 is a square distance between <P> and the point of parameter FirstParameter <P1> and dist2 is a square distance between <P> and the point of parameter LastParameter <P2>.

	:param dist1:
	:type dist1: float &
	:param dist2:
	:type dist2: float &
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & P1,gp_Pnt2d & P2);
};


%extend Extrema_ExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtPElC;
class Extrema_ExtPElC {
	public:
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC ();
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "	* Calculates the extremum distance between the point P and the segment [Uinf,Usup] of the line C.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Lin
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Lin & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "	* Calculates the 2 extremum distances between the point P and the segment [Uinf,Usup] of the circle C. Tol is used to determine if P is on the axis of the circle or if an extremum is on an endpoint of the segment. If P is on the axis of the circle, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are: 0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Circ
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Circ & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "	* Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the elipse C. Tol is used to determine if the point is on the axis of the elipse and if the major radius is equal to the minor radius or if an extremum is on an endpoint of the segment. If P is on the axis of the elipse, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are: 0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Elips
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Elips & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "	* Calculates the extremum distances between the point P and the segment [Uinf,Usup] of the hyperbola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Hypr
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Hypr & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "	* Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the parabola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Parab
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Parab & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the Nth extremum distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Lin
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Lin & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Circ
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Circ & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Elips
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Elips & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Hypr
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Hypr & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: gp_Parab
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Parab & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth extremum distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
};


%extend Extrema_ExtPElC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtPElC2d;
class Extrema_ExtPElC2d {
	public:
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d ();
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "	* Calculates the extremum distance between the point P and the segment [Uinf,Usup] of the line L.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Lin2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Lin2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "	* Calculates the 2 extremum distances between the point P and the segment [Uinf,Usup] of the circle C. Tol is used to determine if P is on the axis of the circle or if an extremum is on an endpoint of the segment. If P is on the axis of the circle, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are: 0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Circ2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Circ2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "	* Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the elipse C. Tol is used to determine if the point is on the axis of the elipse and if the major radius is equal to the minor radius or if an extremum is on an endpoint of the segment. If P is on the axis of the elipse, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are: 0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Elips2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Elips2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "	* Calculates the extremum distances between the point P and the segment [Uinf,Usup] of the hyperbola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Hypr2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Hypr2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "	* Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the parabola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Parab2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Parab2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the Nth extremum distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param L:
	:type L: gp_Lin2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Lin2d & L,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Circ2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Circ2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Elips2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Elips2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Hypr2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Hypr2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: gp_Parab2d
	:param Tol:
	:type Tol: float
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Parab2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth extremum distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth extremum square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
};


%extend Extrema_ExtPElC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtPElS;
class Extrema_ExtPElS {
	public:
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS ();
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "	* It calculates all the distances between a point and a cylinder from gp. Tol is used to test if the point is on the axis.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Cylinder
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Cylinder & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "	* It calculates all the distances between a point and a plane from gp. Tol is used to test if the point is on the plane.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Pln
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Pln & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "	* It calculates all the distances between a point and a cone from gp. Tol is used to test if the point is at the apex or on the axis.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Cone & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "	* It calculates all the distances between a point and a torus from gp. Tol is used to test if the point is on the axis.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Torus & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "	* It calculates all the distances between a point and a sphere from gp. Tol is used to test if the point is at the center.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Sphere
	:param Tol:
	:type Tol: float
	:rtype: None
") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Sphere & S,const Standard_Real Tol);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Cylinder
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Cylinder & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Pln
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Pln & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Cone
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Cone & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Torus
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Torus & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: gp_Sphere
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const gp_Sphere & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
};


%extend Extrema_ExtPElS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtPExtS;
class Extrema_ExtPExtS : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS ();
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "	* It calculates all the distances between a point from gp and a Surface.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: opencascade::handle<GeomAdaptor_HSurfaceOfLinearExtrusion> &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS (const gp_Pnt & P,const opencascade::handle<GeomAdaptor_HSurfaceOfLinearExtrusion> & S,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "	* It calculates all the distances between a point from gp and a Surface.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: opencascade::handle<GeomAdaptor_HSurfaceOfLinearExtrusion> &
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS (const gp_Pnt & P,const opencascade::handle<GeomAdaptor_HSurfaceOfLinearExtrusion> & S,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes the fields of the algorithm.

	:param S:
	:type S: opencascade::handle<GeomAdaptor_HSurfaceOfLinearExtrusion> &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Initialize;
		void Initialize (const opencascade::handle<GeomAdaptor_HSurfaceOfLinearExtrusion> & S,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
};


%make_alias(Extrema_ExtPExtS)

%extend Extrema_ExtPExtS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtPRevS;
class Extrema_ExtPRevS : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS ();
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "	* It calculates all the distances between a point from gp and a SurfacePtr from Adaptor3d.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: opencascade::handle<GeomAdaptor_HSurfaceOfRevolution> &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS (const gp_Pnt & P,const opencascade::handle<GeomAdaptor_HSurfaceOfRevolution> & S,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "	* It calculates all the distances between a point from gp and a SurfacePtr from Adaptor3d.

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: opencascade::handle<GeomAdaptor_HSurfaceOfRevolution> &
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS (const gp_Pnt & P,const opencascade::handle<GeomAdaptor_HSurfaceOfRevolution> & S,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: opencascade::handle<GeomAdaptor_HSurfaceOfRevolution> &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Initialize;
		void Initialize (const opencascade::handle<GeomAdaptor_HSurfaceOfRevolution> & S,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
};


%make_alias(Extrema_ExtPRevS)

%extend Extrema_ExtPRevS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtPS;
class Extrema_ExtPS {
	public:
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtPS;
		 Extrema_ExtPS ();
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "	* It calculates all the distances. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:param F: default value is Extrema_ExtFlag_MINMAX
	:type F: Extrema_ExtFlag
	:param A: default value is Extrema_ExtAlgo_Grad
	:type A: Extrema_ExtAlgo
	:rtype: None
") Extrema_ExtPS;
		 Extrema_ExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Real TolU,const Standard_Real TolV,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "	* It calculates all the distances. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:param F: default value is Extrema_ExtFlag_MINMAX
	:type F: Extrema_ExtFlag
	:param A: default value is Extrema_ExtAlgo_Grad
	:type A: Extrema_ExtAlgo
	:rtype: None
") Extrema_ExtPS;
		 Extrema_ExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes the fields of the algorithm.

	:param S:
	:type S: Adaptor3d_Surface &
	:param Uinf:
	:type Uinf: float
	:param Usup:
	:type Usup: float
	:param Vinf:
	:type Vinf: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the distances. An exception is raised if the fieds have not been initialized.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "	:param A:
	:type A: Extrema_ExtAlgo
	:rtype: None
") SetAlgo;
		void SetAlgo (const Extrema_ExtAlgo A);
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "	:param F:
	:type F: Extrema_ExtFlag
	:rtype: None
") SetFlag;
		void SetFlag (const Extrema_ExtFlag F);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "	* if the surface is a trimmed surface, dUfVf is a square distance between <P> and the point of parameter FirstUParameter and FirstVParameter <PUfVf>. dUfVl is a square distance between <P> and the point of parameter FirstUParameter and LastVParameter <PUfVl>. dUlVf is a square distance between <P> and the point of parameter LastUParameter and FirstVParameter <PUlVf>. dUlVl is a square distance between <P> and the point of parameter LastUParameter and LastVParameter <PUlVl>.

	:param dUfVf:
	:type dUfVf: float &
	:param dUfVl:
	:type dUfVl: float &
	:param dUlVf:
	:type dUlVf: float &
	:param dUlVl:
	:type dUlVl: float &
	:param PUfVf:
	:type PUfVf: gp_Pnt
	:param PUfVl:
	:type PUfVl: gp_Pnt
	:param PUlVf:
	:type PUlVf: gp_Pnt
	:param PUlVl:
	:type PUlVl: gp_Pnt
	:rtype: None
") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & PUfVf,gp_Pnt & PUfVl,gp_Pnt & PUlVf,gp_Pnt & PUlVl);
};


%extend Extrema_ExtPS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_ExtSS;
class Extrema_ExtSS {
	public:
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "	:rtype: None
") Extrema_ExtSS;
		 Extrema_ExtSS ();
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "	* It calculates all the distances between S1 and S2.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param TolS1:
	:type TolS1: float
	:param TolS2:
	:type TolS2: float
	:rtype: None
") Extrema_ExtSS;
		 Extrema_ExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Real TolS1,const Standard_Real TolS2);
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "	* It calculates all the distances between S1 and S2.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param Uinf1:
	:type Uinf1: float
	:param Usup1:
	:type Usup1: float
	:param Vinf1:
	:type Vinf1: float
	:param Vsup1:
	:type Vsup1: float
	:param Uinf2:
	:type Uinf2: float
	:param Usup2:
	:type Usup2: float
	:param Vinf2:
	:type Vinf2: float
	:param Vsup2:
	:type Vsup2: float
	:param TolS1:
	:type TolS1: float
	:param TolS2:
	:type TolS2: float
	:rtype: None
") Extrema_ExtSS;
		 Extrema_ExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Real Uinf1,const Standard_Real Usup1,const Standard_Real Vinf1,const Standard_Real Vsup1,const Standard_Real Uinf2,const Standard_Real Usup2,const Standard_Real Vinf2,const Standard_Real Vsup2,const Standard_Real TolS1,const Standard_Real TolS2);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes the fields of the algorithm.

	:param S2:
	:type S2: Adaptor3d_Surface &
	:param Uinf2:
	:type Uinf2: float
	:param Usup2:
	:type Usup2: float
	:param Vinf2:
	:type Vinf2: float
	:param Vsup2:
	:type Vsup2: float
	:param TolS1:
	:type TolS1: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S2,const Standard_Real Uinf2,const Standard_Real Usup2,const Standard_Real Vinf2,const Standard_Real Vsup2,const Standard_Real TolS1);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns True if the curve is on a parallel surface.

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the distances. An exception is raised if the fieds have not been initialized.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param Uinf1:
	:type Uinf1: float
	:param Usup1:
	:type Usup1: float
	:param Vinf1:
	:type Vinf1: float
	:param Vsup1:
	:type Vsup1: float
	:param TolS1:
	:type TolS1: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Surface & S1,const Standard_Real Uinf1,const Standard_Real Usup1,const Standard_Real Vinf1,const Standard_Real Vsup1,const Standard_Real TolS1);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:param P1:
	:type P1: Extrema_POnSurf &
	:param P2:
	:type P2: Extrema_POnSurf &
	:rtype: None
") Points;
		void Points (const Standard_Integer N,Extrema_POnSurf & P1,Extrema_POnSurf & P2);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
};


%extend Extrema_ExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_FuncExtCS;
class Extrema_FuncExtCS : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* Calculation of Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("compactdefaultargs") Extrema_FuncExtCS;
		%feature("autodoc", "	:rtype: None
") Extrema_FuncExtCS;
		 Extrema_FuncExtCS ();
		%feature("compactdefaultargs") Extrema_FuncExtCS;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:rtype: None
") Extrema_FuncExtCS;
		 Extrema_FuncExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the field mysurf of the function.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Return the number of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "	* Returns the Nth extremum on C.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "	* Return the Nth extremum on S.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Return the value of the Nth distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Calculation of Fi(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Calculation of Fi(U,V) and Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
};


%extend Extrema_FuncExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_FuncExtSS;
class Extrema_FuncExtSS : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* Calculate Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("compactdefaultargs") Extrema_FuncExtSS;
		%feature("autodoc", "	:rtype: None
") Extrema_FuncExtSS;
		 Extrema_FuncExtSS ();
		%feature("compactdefaultargs") Extrema_FuncExtSS;
		%feature("autodoc", "	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:rtype: None
") Extrema_FuncExtSS;
		 Extrema_FuncExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the field mysurf of the function.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Return the number of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "	* Return the Nth extremum on S1.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") PointOnS1;
		const Extrema_POnSurf & PointOnS1 (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "	* Renvoie le Nieme extremum sur S2.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") PointOnS2;
		const Extrema_POnSurf & PointOnS2 (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Return the value of the Nth distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Calculate Fi(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Calculate Fi(U,V) and Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
};


%extend Extrema_FuncExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_FuncPSDist;
class Extrema_FuncPSDist : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("compactdefaultargs") Extrema_FuncPSDist;
		%feature("autodoc", "	* Constructor.

	:param theS:
	:type theS: Adaptor3d_Surface &
	:param theP:
	:type theP: gp_Pnt
	:rtype: None
") Extrema_FuncPSDist;
		 Extrema_FuncPSDist (const Adaptor3d_Surface & theS,const gp_Pnt & theP);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	* Gradient.

	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Number of variables.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Value.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Value and gradient.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
};


%extend Extrema_FuncPSDist {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_FuncPSNorm;
class Extrema_FuncPSNorm : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* Calculate Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("compactdefaultargs") Extrema_FuncPSNorm;
		%feature("autodoc", "	:rtype: None
") Extrema_FuncPSNorm;
		 Extrema_FuncPSNorm ();
		%feature("compactdefaultargs") Extrema_FuncPSNorm;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:rtype: None
") Extrema_FuncPSNorm;
		 Extrema_FuncPSNorm (const gp_Pnt & P,const Adaptor3d_Surface & S);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the field mysurf of the function.

	:param S:
	:type S: Adaptor3d_Surface &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Return the number of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the Nth extremum.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* sets the field mysurf of the function.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt & P);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Return the value of the Nth distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Calculate Fi(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Calculate Fi(U,V) and Fi'(U,V).

	:param UV:
	:type UV: math_Vector &
	:param F:
	:type F: math_Vector &
	:param DF:
	:type DF: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
};


%extend Extrema_FuncPSNorm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GenExtCS;
class Extrema_GenExtCS {
	public:
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "	:rtype: None
") Extrema_GenExtCS;
		 Extrema_GenExtCS ();
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(S1(u1,v1),S2(u2,v2)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surfaces. NbU and NbV are used to locate the close points on the surface and NbT on the curve to find the zeros.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param NbT:
	:type NbT: int
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenExtCS;
		 Extrema_GenExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Integer NbT,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surface. NbT,NbU and NbV are used to locate the close points to find the zeros.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param NbT:
	:type NbT: int
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param tmin:
	:type tmin: float
	:param tsup:
	:type tsup: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenExtCS;
		 Extrema_GenExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Integer NbT,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real tmin,const Standard_Real tsup,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Tol2);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real Tol2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done with S An exception is raised if the fields have not been initialized.

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbT:
	:type NbT: int
	:param Tol1:
	:type Tol1: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Curve & C,const Standard_Integer NbT,const Standard_Real Tol1);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done with C An exception is raised if the fields have not been initialized.

	:param C:
	:type C: Adaptor3d_Curve &
	:param NbT:
	:type NbT: int
	:param tmin:
	:type tmin: float
	:param tsup:
	:type tsup: float
	:param Tol1:
	:type Tol1: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Curve & C,const Standard_Integer NbT,const Standard_Real tmin,const Standard_Real tsup,const Standard_Real Tol1);
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
};


%extend Extrema_GenExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GenExtPS;
class Extrema_GenExtPS {
	public:
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "	:rtype: None
") Extrema_GenExtPS;
		 Extrema_GenExtPS ();
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surface. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:param F: default value is Extrema_ExtFlag_MINMAX
	:type F: Extrema_ExtFlag
	:param A: default value is Extrema_ExtAlgo_Grad
	:type A: Extrema_ExtAlgo
	:rtype: None
") Extrema_GenExtPS;
		 Extrema_GenExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surface. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .

	:param P:
	:type P: gp_Pnt
	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:param F: default value is Extrema_ExtFlag_MINMAX
	:type F: Extrema_ExtFlag
	:param A: default value is Extrema_ExtAlgo_Grad
	:type A: Extrema_ExtAlgo
	:rtype: None
") Extrema_GenExtPS;
		 Extrema_GenExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done with the point P. An exception is raised if the fields have not been initialized.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "	:param A:
	:type A: Extrema_ExtAlgo
	:rtype: None
") SetAlgo;
		void SetAlgo (const Extrema_ExtAlgo A);
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "	:param F:
	:type F: Extrema_ExtFlag
	:rtype: None
") SetFlag;
		void SetFlag (const Extrema_ExtFlag F);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
};


%extend Extrema_GenExtPS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GenExtSS;
class Extrema_GenExtSS {
	public:
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "	:rtype: None
") Extrema_GenExtSS;
		 Extrema_GenExtSS ();
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(S1(u1,v1),S2(u2,v2)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surfaces. NbU and NbV are used to locate the close points to find the zeros.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenExtSS;
		 Extrema_GenExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "	* It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searchs all the zeros inside the definition ranges of the surface. NbU and NbV are used to locate the close points to find the zeros.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param U1min:
	:type U1min: float
	:param U1sup:
	:type U1sup: float
	:param V1min:
	:type V1min: float
	:param V1sup:
	:type V1sup: float
	:param U2min:
	:type U2min: float
	:param U2sup:
	:type U2sup: float
	:param V2min:
	:type V2min: float
	:param V2sup:
	:type V2sup: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenExtSS;
		 Extrema_GenExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real U1min,const Standard_Real U1sup,const Standard_Real V1min,const Standard_Real V1sup,const Standard_Real U2min,const Standard_Real U2sup,const Standard_Real V2min,const Standard_Real V2sup,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S2:
	:type S2: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Tol2);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S2:
	:type S2: Adaptor3d_Surface &
	:param NbU:
	:type NbU: int
	:param NbV:
	:type NbV: int
	:param U2min:
	:type U2min: float
	:param U2sup:
	:type U2sup: float
	:param V2min:
	:type V2min: float
	:param V2sup:
	:type V2sup: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Surface & S2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real U2min,const Standard_Real U2sup,const Standard_Real V2min,const Standard_Real V2sup,const Standard_Real Tol2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distances are found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Returns the number of extremum distances.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done with S1 An exception is raised if the fields have not been initialized.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param Tol1:
	:type Tol1: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Surface & S1,const Standard_Real Tol1);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done withS1 An exception is raised if the fields have not been initialized.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param U1min:
	:type U1min: float
	:param U1sup:
	:type U1sup: float
	:param V1min:
	:type V1min: float
	:param V1sup:
	:type V1sup: float
	:param Tol1:
	:type Tol1: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Surface & S1,const Standard_Real U1min,const Standard_Real U1sup,const Standard_Real V1min,const Standard_Real V1sup,const Standard_Real Tol1);
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") PointOnS1;
		const Extrema_POnSurf & PointOnS1 (const Standard_Integer N);
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "	* Returns the point of the Nth resulting distance.

	:param N:
	:type N: int
	:rtype: Extrema_POnSurf
") PointOnS2;
		const Extrema_POnSurf & PointOnS2 (const Standard_Integer N);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the Nth resulting square distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
};


%extend Extrema_GenExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GenLocateExtCS;
class Extrema_GenLocateExtCS {
	public:
		%feature("compactdefaultargs") Extrema_GenLocateExtCS;
		%feature("autodoc", "	:rtype: None
") Extrema_GenLocateExtCS;
		 Extrema_GenLocateExtCS ();
		%feature("compactdefaultargs") Extrema_GenLocateExtCS;
		%feature("autodoc", "	* Calculates the distance with two close points. The close points are defined by the parameter values T for C and (U,V) for S. The function F(t,u,v)=distance(C(t),S(u,v)) has an extremun when gradient(F)=0. The algorithm searchs a zero near the close points.

	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param T:
	:type T: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenLocateExtCS;
		 Extrema_GenLocateExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Real T,const Standard_Real U,const Standard_Real V,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve &
	:param S:
	:type S: Adaptor3d_Surface &
	:param T:
	:type T: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Real T,const Standard_Real U,const Standard_Real V,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "	* Returns the point of the extremum distance on C.

	:rtype: Extrema_POnCurv
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve ();
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "	* Returns the point of the extremum distance on S.

	:rtype: Extrema_POnSurf
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
};


%extend Extrema_GenLocateExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GenLocateExtPS;
class Extrema_GenLocateExtPS {
	public:
		%feature("compactdefaultargs") Extrema_GenLocateExtPS;
		%feature("autodoc", "	* Constructor.

	:param theS:
	:type theS: Adaptor3d_Surface &
	:param theTolU: default value is Precision::Confusion()
	:type theTolU: float
	:param theTolV: default value is Precision::Confusion()
	:type theTolV: float
	:rtype: None
") Extrema_GenLocateExtPS;
		 Extrema_GenLocateExtPS (const Adaptor3d_Surface & theS,const Standard_Real theTolU = Precision::Confusion(),const Standard_Real theTolV = Precision::Confusion());
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Calculates the extrema between the point and the surface using a close point. The close point is defined by the parameter values theU0 and theV0. Type of the algorithm depends on the isDistanceCriteria flag. If flag value is false - normal projection criteria will be used. If flag value is true - distance criteria will be used.

	:param theP:
	:type theP: gp_Pnt
	:param theU0:
	:type theU0: float
	:param theV0:
	:type theV0: float
	:param isDistanceCriteria: default value is Standard_False
	:type isDistanceCriteria: bool
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & theP,const Standard_Real theU0,const Standard_Real theV0,const Standard_Boolean isDistanceCriteria = Standard_False);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the extremum distance.

	:rtype: Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
};


%extend Extrema_GenLocateExtPS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GenLocateExtSS;
class Extrema_GenLocateExtSS {
	public:
		%feature("compactdefaultargs") Extrema_GenLocateExtSS;
		%feature("autodoc", "	:rtype: None
") Extrema_GenLocateExtSS;
		 Extrema_GenLocateExtSS ();
		%feature("compactdefaultargs") Extrema_GenLocateExtSS;
		%feature("autodoc", "	* Calculates the distance with two close points. The close points are defined by the parameter values (U1,V1) for S1 and (U2,V2) for S2. The function F(u1,v1,u2,v2)=distance(S1(u1,v1),S2(u2,v2)) has an extremun when gradient(F)=0. The algorithm searchs a zero near the close points.

	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Extrema_GenLocateExtSS;
		 Extrema_GenLocateExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S1:
	:type S1: Adaptor3d_Surface &
	:param S2:
	:type S2: Adaptor3d_Surface &
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param Tol1:
	:type Tol1: float
	:param Tol2:
	:type Tol2: float
	:rtype: None
") Perform;
		void Perform (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "	* Returns the point of the extremum distance on S1.

	:rtype: Extrema_POnSurf
") PointOnS1;
		const Extrema_POnSurf & PointOnS1 ();
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "	* Returns the point of the extremum distance on S2.

	:rtype: Extrema_POnSurf
") PointOnS2;
		const Extrema_POnSurf & PointOnS2 ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
};


%extend Extrema_GenLocateExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GlobOptFuncCCC0;
class Extrema_GlobOptFuncCCC0 : public math_MultipleVarFunction {
	public:
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC0;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:rtype: None
") Extrema_GlobOptFuncCCC0;
		 Extrema_GlobOptFuncCCC0 (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2);
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC0;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_GlobOptFuncCCC0;
		 Extrema_GlobOptFuncCCC0 (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
};


%extend Extrema_GlobOptFuncCCC0 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GlobOptFuncCCC1;
class Extrema_GlobOptFuncCCC1 : public math_MultipleVarFunctionWithGradient {
	public:
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC1;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:rtype: None
") Extrema_GlobOptFuncCCC1;
		 Extrema_GlobOptFuncCCC1 (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2);
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC1;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_GlobOptFuncCCC1;
		 Extrema_GlobOptFuncCCC1 (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		virtual Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
};


%extend Extrema_GlobOptFuncCCC1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GlobOptFuncCCC2;
class Extrema_GlobOptFuncCCC2 : public math_MultipleVarFunctionWithHessian {
	public:
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC2;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:rtype: None
") Extrema_GlobOptFuncCCC2;
		 Extrema_GlobOptFuncCCC2 (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2);
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC2;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_GlobOptFuncCCC2;
		 Extrema_GlobOptFuncCCC2 (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Gradient;
		virtual Standard_Boolean Gradient (const math_Vector & X,math_Vector & G);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: float &
	:param G:
	:type G: math_Vector &
	:param H:
	:type H: math_Matrix &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & X,Standard_Real &OutValue,math_Vector & G,math_Matrix & H);
};


%extend Extrema_GlobOptFuncCCC2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_GlobOptFuncCS;
class Extrema_GlobOptFuncCS : public math_MultipleVarFunctionWithHessian {
	public:
		%feature("compactdefaultargs") Extrema_GlobOptFuncCS;
		%feature("autodoc", "	* Curve and surface should exist during all the lifetime of Extrema_GlobOptFuncCS.

	:param C:
	:type C: Adaptor3d_Curve *
	:param S:
	:type S: Adaptor3d_Surface *
	:rtype: None
") Extrema_GlobOptFuncCS;
		 Extrema_GlobOptFuncCS (const Adaptor3d_Curve * C,const Adaptor3d_Surface * S);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	:param theX:
	:type theX: math_Vector &
	:param theG:
	:type theG: math_Vector &
	:rtype: bool
") Gradient;
		virtual Standard_Boolean Gradient (const math_Vector & theX,math_Vector & theG);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param theX:
	:type theX: math_Vector &
	:param theF:
	:type theF: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & theX,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param theX:
	:type theX: math_Vector &
	:param theF:
	:type theF: float &
	:param theG:
	:type theG: math_Vector &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & theX,Standard_Real &OutValue,math_Vector & theG);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param theX:
	:type theX: math_Vector &
	:param theF:
	:type theF: float &
	:param theG:
	:type theG: math_Vector &
	:param theH:
	:type theH: math_Matrix &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & theX,Standard_Real &OutValue,math_Vector & theG,math_Matrix & theH);
};


%extend Extrema_GlobOptFuncCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_LocECC;
class Extrema_LocECC {
	public:
		%feature("compactdefaultargs") Extrema_LocECC;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by a parameter value on each curve. The function F(u,v)=distance(C1(u),C2(v)) has an extremun when gradient(f)=0. The algorithm searchs the zero near the close point.

	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param V0:
	:type V0: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_LocECC;
		 Extrema_LocECC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real U0,const Standard_Real V0,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the points of the extremum distance. P1 is on the first curve, P2 on the second one.

	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Point;
		void Point (Extrema_POnCurv & P1,Extrema_POnCurv & P2);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
};


%extend Extrema_LocECC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_LocECC2d;
class Extrema_LocECC2d {
	public:
		%feature("compactdefaultargs") Extrema_LocECC2d;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by a parameter value on each curve. The function F(u,v)=distance(C1(u),C2(v)) has an extremun when gradient(f)=0. The algorithm searchs the zero near the close point.

	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param V0:
	:type V0: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") Extrema_LocECC2d;
		 Extrema_LocECC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real U0,const Standard_Real V0,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the points of the extremum distance. P1 is on the first curve, P2 on the second one.

	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Point;
		void Point (Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
};


%extend Extrema_LocECC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_LocEPCOfLocateExtPC;
class Extrema_LocEPCOfLocateExtPC {
	public:
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC ();
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs a zero near the close point. TolU is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolU.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real U0,const Standard_Real TolU);
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs a zero near the close point. Zeros are searched between Umin et Usup. TolU is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolU.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
	:type C: Adaptor3d_Curve &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the extremum distance is a minimum.

	:rtype: bool
") IsMin;
		Standard_Boolean IsMin ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done with the point P. An exception is raised if the fields have not been initialized.

	:param P:
	:type P: gp_Pnt
	:param U0:
	:type U0: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const Standard_Real U0);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the extremum distance.

	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
};


%extend Extrema_LocEPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_LocEPCOfLocateExtPC2d;
class Extrema_LocEPCOfLocateExtPC2d {
	public:
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d ();
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC2d;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs a zero near the close point. TolU is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolU.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real TolU);
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC2d;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs a zero near the close point. Zeros are searched between Umin et Usup. TolU is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolU.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the extremum distance is a minimum.

	:rtype: bool
") IsMin;
		Standard_Boolean IsMin ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done with the point P. An exception is raised if the fields have not been initialized.

	:param P:
	:type P: gp_Pnt2d
	:param U0:
	:type U0: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const Standard_Real U0);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the extremum distance.

	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
};


%extend Extrema_LocEPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_LocateExtCC;
class Extrema_LocateExtCC {
	public:
		%feature("compactdefaultargs") Extrema_LocateExtCC;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by a parameter value on each curve. The function F(u,v)=distance(C1(u),C2(v)) has an extremun when gradient(f)=0. The algorithm searchs the zero near the close point.

	:param C1:
	:type C1: Adaptor3d_Curve &
	:param C2:
	:type C2: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param V0:
	:type V0: float
	:rtype: None
") Extrema_LocateExtCC;
		 Extrema_LocateExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real U0,const Standard_Real V0);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the points of the extremum distance. P1 is on the first curve, P2 on the second one.

	:param P1:
	:type P1: Extrema_POnCurv &
	:param P2:
	:type P2: Extrema_POnCurv &
	:rtype: None
") Point;
		void Point (Extrema_POnCurv & P1,Extrema_POnCurv & P2);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
};


%extend Extrema_LocateExtCC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_LocateExtCC2d;
class Extrema_LocateExtCC2d {
	public:
		%feature("compactdefaultargs") Extrema_LocateExtCC2d;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by a parameter value on each curve. The function F(u,v)=distance(C1(u),C2(v)) has an extremun when gradient(f)=0. The algorithm searchs the zero near the close point.

	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param V0:
	:type V0: float
	:rtype: None
") Extrema_LocateExtCC2d;
		 Extrema_LocateExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real U0,const Standard_Real V0);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the points of the extremum distance. P1 is on the first curve, P2 on the second one.

	:param P1:
	:type P1: Extrema_POnCurv2d &
	:param P2:
	:type P2: Extrema_POnCurv2d &
	:rtype: None
") Point;
		void Point (Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
};


%extend Extrema_LocateExtCC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_LocateExtPC;
class Extrema_LocateExtPC {
	public:
		%feature("compactdefaultargs") Extrema_LocateExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC ();
		%feature("compactdefaultargs") Extrema_LocateExtPC;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs a zero near the close point. TolF is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolF.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real U0,const Standard_Real TolF);
		%feature("compactdefaultargs") Extrema_LocateExtPC;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs a zero near the close point. Zeros are searched between Umin et Usup. TolF is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolF.

	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:param U0:
	:type U0: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
	:type C: Adaptor3d_Curve &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolF);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the extremum distance is a minimum.

	:rtype: bool
") IsMin;
		Standard_Boolean IsMin ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param U0:
	:type U0: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const Standard_Real U0);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the extremum distance.

	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
};


%extend Extrema_LocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_LocateExtPC2d;
class Extrema_LocateExtPC2d {
	public:
		%feature("compactdefaultargs") Extrema_LocateExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d ();
		%feature("compactdefaultargs") Extrema_LocateExtPC2d;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs a zero near the close point. TolF is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolF.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real TolF);
		%feature("compactdefaultargs") Extrema_LocateExtPC2d;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs a zero near the close point. Zeros are searched between Umin et Usup. TolF is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolF.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolF);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolF:
	:type TolF: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolF);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the extremum distance is a minimum.

	:rtype: bool
") IsMin;
		Standard_Boolean IsMin ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param U0:
	:type U0: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const Standard_Real U0);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the extremum distance.

	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
};


%extend Extrema_LocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_PCFOfEPCOfELPCOfLocateExtPC;
class Extrema_PCFOfEPCOfELPCOfLocateExtPC : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Calculation of F'(U).

	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC ();
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the field mycurve of the function.

	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Shows if the Nth distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Return the nunber of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the Nth extremum.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	* Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.

	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* sets the field P of the function.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt & P);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the Nth distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	* Determines boundaries of subinterval for find of root.

	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Calculation of F(U).

	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Calculation of F(U) and F'(U).

	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Extrema_PCFOfEPCOfELPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
class Extrema_PCFOfEPCOfELPCOfLocateExtPC2d : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Calculation of F'(U).

	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC2d ();
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the field mycurve of the function.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Shows if the Nth distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Return the nunber of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the Nth extremum.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	* Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.

	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* sets the field P of the function.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the Nth distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	* Determines boundaries of subinterval for find of root.

	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Calculation of F(U).

	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Calculation of F(U) and F'(U).

	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Extrema_PCFOfEPCOfELPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_PCFOfEPCOfExtPC;
class Extrema_PCFOfEPCOfExtPC : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Calculation of F'(U).

	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_PCFOfEPCOfExtPC;
		 Extrema_PCFOfEPCOfExtPC ();
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Extrema_PCFOfEPCOfExtPC;
		 Extrema_PCFOfEPCOfExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the field mycurve of the function.

	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Shows if the Nth distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Return the nunber of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the Nth extremum.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	* Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.

	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* sets the field P of the function.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt & P);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the Nth distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	* Determines boundaries of subinterval for find of root.

	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Calculation of F(U).

	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Calculation of F(U) and F'(U).

	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Extrema_PCFOfEPCOfExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_PCFOfEPCOfExtPC2d;
class Extrema_PCFOfEPCOfExtPC2d : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Calculation of F'(U).

	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_PCFOfEPCOfExtPC2d;
		 Extrema_PCFOfEPCOfExtPC2d ();
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_PCFOfEPCOfExtPC2d;
		 Extrema_PCFOfEPCOfExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the field mycurve of the function.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Shows if the Nth distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Return the nunber of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the Nth extremum.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	* Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.

	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* sets the field P of the function.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the Nth distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	* Determines boundaries of subinterval for find of root.

	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Calculation of F(U).

	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Calculation of F(U) and F'(U).

	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Extrema_PCFOfEPCOfExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_PCLocFOfLocEPCOfLocateExtPC;
class Extrema_PCLocFOfLocEPCOfLocateExtPC : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Calculation of F'(U).

	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		%feature("autodoc", "	:rtype: None
") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC ();
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the field mycurve of the function.

	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Shows if the Nth distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Return the nunber of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the Nth extremum.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	* Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.

	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* sets the field P of the function.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt & P);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the Nth distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	* Determines boundaries of subinterval for find of root.

	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Calculation of F(U).

	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Calculation of F(U) and F'(U).

	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Extrema_PCLocFOfLocEPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
class Extrema_PCLocFOfLocEPCOfLocateExtPC2d : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Calculation of F'(U).

	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		%feature("autodoc", "	:rtype: None
") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC2d ();
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the field mycurve of the function.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Shows if the Nth distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Return the nunber of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the Nth extremum.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	* Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.

	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* sets the field P of the function.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the Nth distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	* Determines boundaries of subinterval for find of root.

	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Calculation of F(U).

	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Calculation of F(U) and F'(U).

	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Extrema_PCLocFOfLocEPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_POnCurv;
class Extrema_POnCurv {
	public:
		%feature("compactdefaultargs") Extrema_POnCurv;
		%feature("autodoc", "	* Creation of an indefinite point on curve.

	:rtype: None
") Extrema_POnCurv;
		 Extrema_POnCurv ();
		%feature("compactdefaultargs") Extrema_POnCurv;
		%feature("autodoc", "	* Creation of a point on curve with a parameter value on the curve and a Pnt from gp.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") Extrema_POnCurv;
		 Extrema_POnCurv (const Standard_Real U,const gp_Pnt & P);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter on the curve.

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	* sets the point and parameter values.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") SetValues;
		void SetValues (const Standard_Real U,const gp_Pnt & P);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the point.

	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
};


%extend Extrema_POnCurv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_POnCurv2d;
class Extrema_POnCurv2d {
	public:
		%feature("compactdefaultargs") Extrema_POnCurv2d;
		%feature("autodoc", "	* Creation of an indefinite point on curve.

	:rtype: None
") Extrema_POnCurv2d;
		 Extrema_POnCurv2d ();
		%feature("compactdefaultargs") Extrema_POnCurv2d;
		%feature("autodoc", "	* Creation of a point on curve with a parameter value on the curve and a Pnt from gp.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Extrema_POnCurv2d;
		 Extrema_POnCurv2d (const Standard_Real U,const gp_Pnt2d & P);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter on the curve.

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	* sets the point and parameter values.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetValues;
		void SetValues (const Standard_Real U,const gp_Pnt2d & P);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the point.

	:rtype: gp_Pnt2d
") Value;
		const gp_Pnt2d  Value ();
};


%extend Extrema_POnCurv2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_POnSurf;
class Extrema_POnSurf {
	public:
		%feature("compactdefaultargs") Extrema_POnSurf;
		%feature("autodoc", "	* Creation of an indefinite point on surface.

	:rtype: None
") Extrema_POnSurf;
		 Extrema_POnSurf ();
		%feature("compactdefaultargs") Extrema_POnSurf;
		%feature("autodoc", "	* Creation of a point on surface with parameter values on the surface and a Pnt from gp.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") Extrema_POnSurf;
		 Extrema_POnSurf (const Standard_Real U,const Standard_Real V,const gp_Pnt & P);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter values on the surface.

	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") Parameter;
		void Parameter (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	* Sets the params of current POnSurf instance. (e.g. to the point to be projected).

	:param theU:
	:type theU: float
	:param theV:
	:type theV: float
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None
") SetParameters;
		void SetParameters (const Standard_Real theU,const Standard_Real theV,const gp_Pnt & thePnt);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the 3d point.

	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
};


%extend Extrema_POnSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Extrema_POnSurfParams;
class Extrema_POnSurfParams : public Extrema_POnSurf {
	public:
		%feature("compactdefaultargs") Extrema_POnSurfParams;
		%feature("autodoc", "	* empty constructor

	:rtype: None
") Extrema_POnSurfParams;
		 Extrema_POnSurfParams ();
		%feature("compactdefaultargs") Extrema_POnSurfParams;
		%feature("autodoc", "	* Creation of a point on surface with parameter values on the surface and a Pnt from gp.

	:param theU:
	:type theU: float
	:param theV:
	:type theV: float
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None
") Extrema_POnSurfParams;
		 Extrema_POnSurfParams (const Standard_Real theU,const Standard_Real theV,const gp_Pnt & thePnt);
		%feature("compactdefaultargs") GetElementType;
		%feature("autodoc", "	* Query the element type on which this point is situated.

	:rtype: Extrema_ElementType
") GetElementType;
		Extrema_ElementType GetElementType ();
		%feature("compactdefaultargs") GetIndices;
		%feature("autodoc", "	* Query the U and V indices of an element that contains this point.

	:param theIndexU:
	:type theIndexU: int &
	:param theIndexV:
	:type theIndexV: int &
	:rtype: None
") GetIndices;
		void GetIndices (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetSqrDistance;
		%feature("autodoc", "	* Query the square distance from this point to another one.

	:rtype: float
") GetSqrDistance;
		Standard_Real GetSqrDistance ();
		%feature("compactdefaultargs") SetElementType;
		%feature("autodoc", "	* Sets the element type on which this point is situated.

	:param theElementType:
	:type theElementType: Extrema_ElementType
	:rtype: None
") SetElementType;
		void SetElementType (const Extrema_ElementType theElementType);
		%feature("compactdefaultargs") SetIndices;
		%feature("autodoc", "	* Sets the U and V indices of an element that contains this point.

	:param theIndexU:
	:type theIndexU: int
	:param theIndexV:
	:type theIndexV: int
	:rtype: None
") SetIndices;
		void SetIndices (const Standard_Integer theIndexU,const Standard_Integer theIndexV);
		%feature("compactdefaultargs") SetSqrDistance;
		%feature("autodoc", "	* Sets the square distance from this point to another one (e.g. to the point to be projected).

	:param theSqrDistance:
	:type theSqrDistance: float
	:rtype: None
") SetSqrDistance;
		void SetSqrDistance (const Standard_Real theSqrDistance);
};


%extend Extrema_POnSurfParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
class Extrema_HArray1OfPOnSurf : public  Extrema_Array1OfPOnSurf, public Standard_Transient {
  public:
    Extrema_HArray1OfPOnSurf(const Standard_Integer theLower, const Standard_Integer theUpper);
    Extrema_HArray1OfPOnSurf(const Standard_Integer theLower, const Standard_Integer theUpper, const  Extrema_Array1OfPOnSurf::value_type& theValue);
    Extrema_HArray1OfPOnSurf(const  Extrema_Array1OfPOnSurf& theOther);
    const  Extrema_Array1OfPOnSurf& Array1();
     Extrema_Array1OfPOnSurf& ChangeArray1();
};
%make_alias(Extrema_HArray1OfPOnSurf)


class Extrema_HArray1OfPOnCurv : public  Extrema_Array1OfPOnCurv, public Standard_Transient {
  public:
    Extrema_HArray1OfPOnCurv(const Standard_Integer theLower, const Standard_Integer theUpper);
    Extrema_HArray1OfPOnCurv(const Standard_Integer theLower, const Standard_Integer theUpper, const  Extrema_Array1OfPOnCurv::value_type& theValue);
    Extrema_HArray1OfPOnCurv(const  Extrema_Array1OfPOnCurv& theOther);
    const  Extrema_Array1OfPOnCurv& Array1();
     Extrema_Array1OfPOnCurv& ChangeArray1();
};
%make_alias(Extrema_HArray1OfPOnCurv)


class Extrema_HArray1OfPOnCurv2d : public  Extrema_Array1OfPOnCurv2d, public Standard_Transient {
  public:
    Extrema_HArray1OfPOnCurv2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    Extrema_HArray1OfPOnCurv2d(const Standard_Integer theLower, const Standard_Integer theUpper, const  Extrema_Array1OfPOnCurv2d::value_type& theValue);
    Extrema_HArray1OfPOnCurv2d(const  Extrema_Array1OfPOnCurv2d& theOther);
    const  Extrema_Array1OfPOnCurv2d& Array1();
     Extrema_Array1OfPOnCurv2d& ChangeArray1();
};
%make_alias(Extrema_HArray1OfPOnCurv2d)


/* harray2 class */
class Extrema_HArray2OfPOnCurv2d : public  Extrema_Array2OfPOnCurv2d, public Standard_Transient {
  public:
    Extrema_HArray2OfPOnCurv2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    Extrema_HArray2OfPOnCurv2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  Extrema_Array2OfPOnCurv2d::value_type& theValue);
    Extrema_HArray2OfPOnCurv2d(const  Extrema_Array2OfPOnCurv2d& theOther);
    const  Extrema_Array2OfPOnCurv2d& Array2 ();
     Extrema_Array2OfPOnCurv2d& ChangeArray2 (); 
};
%make_alias(Extrema_HArray2OfPOnCurv2d)


class Extrema_HArray2OfPOnCurv : public  Extrema_Array2OfPOnCurv, public Standard_Transient {
  public:
    Extrema_HArray2OfPOnCurv(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    Extrema_HArray2OfPOnCurv(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  Extrema_Array2OfPOnCurv::value_type& theValue);
    Extrema_HArray2OfPOnCurv(const  Extrema_Array2OfPOnCurv& theOther);
    const  Extrema_Array2OfPOnCurv& Array2 ();
     Extrema_Array2OfPOnCurv& ChangeArray2 (); 
};
%make_alias(Extrema_HArray2OfPOnCurv)


class Extrema_HArray2OfPOnSurf : public  Extrema_Array2OfPOnSurf, public Standard_Transient {
  public:
    Extrema_HArray2OfPOnSurf(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    Extrema_HArray2OfPOnSurf(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  Extrema_Array2OfPOnSurf::value_type& theValue);
    Extrema_HArray2OfPOnSurf(const  Extrema_Array2OfPOnSurf& theOther);
    const  Extrema_Array2OfPOnSurf& Array2 ();
     Extrema_Array2OfPOnSurf& ChangeArray2 (); 
};
%make_alias(Extrema_HArray2OfPOnSurf)


class Extrema_HArray2OfPOnSurfParams : public  Extrema_Array2OfPOnSurfParams, public Standard_Transient {
  public:
    Extrema_HArray2OfPOnSurfParams(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    Extrema_HArray2OfPOnSurfParams(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  Extrema_Array2OfPOnSurfParams::value_type& theValue);
    Extrema_HArray2OfPOnSurfParams(const  Extrema_Array2OfPOnSurfParams& theOther);
    const  Extrema_Array2OfPOnSurfParams& Array2 ();
     Extrema_Array2OfPOnSurfParams& ChangeArray2 (); 
};
%make_alias(Extrema_HArray2OfPOnSurfParams)


/* harray2 class */
