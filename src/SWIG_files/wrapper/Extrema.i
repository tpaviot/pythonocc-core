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
%define EXTREMADOCSTRING
"Extrema module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_extrema.html"
%enddef
%module (package="OCC.Core", docstring=EXTREMADOCSTRING) Extrema


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
#include<Message_module.hxx>
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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class Extrema_ExtAlgo(IntEnum):
	Extrema_ExtAlgo_Grad = 0
	Extrema_ExtAlgo_Tree = 1
Extrema_ExtAlgo_Grad = Extrema_ExtAlgo.Extrema_ExtAlgo_Grad
Extrema_ExtAlgo_Tree = Extrema_ExtAlgo.Extrema_ExtAlgo_Tree

class Extrema_ExtFlag(IntEnum):
	Extrema_ExtFlag_MIN = 0
	Extrema_ExtFlag_MAX = 1
	Extrema_ExtFlag_MINMAX = 2
Extrema_ExtFlag_MIN = Extrema_ExtFlag.Extrema_ExtFlag_MIN
Extrema_ExtFlag_MAX = Extrema_ExtFlag.Extrema_ExtFlag_MAX
Extrema_ExtFlag_MINMAX = Extrema_ExtFlag.Extrema_ExtFlag_MINMAX

class Extrema_ElementType(IntEnum):
	Extrema_Node = 0
	Extrema_UIsoEdge = 1
	Extrema_VIsoEdge = 2
	Extrema_Face = 3
Extrema_Node = Extrema_ElementType.Extrema_Node
Extrema_UIsoEdge = Extrema_ElementType.Extrema_UIsoEdge
Extrema_VIsoEdge = Extrema_ElementType.Extrema_VIsoEdge
Extrema_Face = Extrema_ElementType.Extrema_Face
};
/* end python proxy for enums */

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
%template(Extrema_Array1OfPOnCurv) NCollection_Array1<Extrema_POnCurv>;

%extend NCollection_Array1<Extrema_POnCurv> {
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
%template(Extrema_Array1OfPOnCurv2d) NCollection_Array1<Extrema_POnCurv2d>;

%extend NCollection_Array1<Extrema_POnCurv2d> {
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
%template(Extrema_Array1OfPOnSurf) NCollection_Array1<Extrema_POnSurf>;

%extend NCollection_Array1<Extrema_POnSurf> {
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
%template(Extrema_Array2OfPOnCurv) NCollection_Array2<Extrema_POnCurv>;
%template(Extrema_Array2OfPOnCurv2d) NCollection_Array2<Extrema_POnCurv2d>;
%template(Extrema_Array2OfPOnSurf) NCollection_Array2<Extrema_POnSurf>;
%template(Extrema_Array2OfPOnSurfParams) NCollection_Array2<Extrema_POnSurfParams>;
%template(Extrema_SequenceOfPOnCurv) NCollection_Sequence<Extrema_POnCurv>;
%template(Extrema_SequenceOfPOnCurv2d) NCollection_Sequence<Extrema_POnCurv2d>;
%template(Extrema_SequenceOfPOnSurf) NCollection_Sequence<Extrema_POnSurf>;
%template(Extrema_UBTreeFillerOfSphere) NCollection_UBTreeFiller<Standard_Integer,Bnd_Sphere>;
%template(Extrema_UBTreeOfSphere) NCollection_UBTree<Standard_Integer,Bnd_Sphere>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<Extrema_POnCurv> Extrema_Array1OfPOnCurv;
typedef NCollection_Array1<Extrema_POnCurv2d> Extrema_Array1OfPOnCurv2d;
typedef NCollection_Array1<Extrema_POnSurf> Extrema_Array1OfPOnSurf;
typedef NCollection_Array2<Extrema_POnCurv> Extrema_Array2OfPOnCurv;
typedef NCollection_Array2<Extrema_POnCurv2d> Extrema_Array2OfPOnCurv2d;
typedef NCollection_Array2<Extrema_POnSurf> Extrema_Array2OfPOnSurf;
typedef NCollection_Array2<Extrema_POnSurfParams> Extrema_Array2OfPOnSurfParams;
typedef NCollection_Handle<Extrema_UBTreeOfSphere> Extrema_HUBTreeOfSphere;
typedef NCollection_Sequence<Extrema_POnCurv> Extrema_SequenceOfPOnCurv;
typedef NCollection_Sequence<Extrema_POnCurv2d> Extrema_SequenceOfPOnCurv2d;
typedef NCollection_Sequence<Extrema_POnSurf> Extrema_SequenceOfPOnSurf;
typedef NCollection_UBTreeFiller<Standard_Integer, Bnd_Sphere> Extrema_UBTreeFillerOfSphere;
typedef NCollection_UBTree<Standard_Integer, Bnd_Sphere> Extrema_UBTreeOfSphere;
/* end typedefs declaration */

/*******************************
* class Extrema_CCLocFOfLocECC *
*******************************/
class Extrema_CCLocFOfLocECC : public math_FunctionSetWithDerivatives {
	public:
		/****************** Extrema_CCLocFOfLocECC ******************/
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC;
		%feature("autodoc", "No available documentation.

Parameters
----------
thetol: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_CCLocFOfLocECC;
		 Extrema_CCLocFOfLocECC(const Standard_Real thetol = 1.0e-10);

		/****************** Extrema_CCLocFOfLocECC ******************/
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
thetol: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_CCLocFOfLocECC;
		 Extrema_CCLocFOfLocECC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real thetol = 1.0e-10);

		/****************** CurvePtr ******************/
		%feature("compactdefaultargs") CurvePtr;
		%feature("autodoc", "Returns a pointer to the curve specified in the constructor or in setcurve() method.

Parameters
----------
theRank: int

Returns
-------
Standard_Address
") CurvePtr;
		Standard_Address CurvePtr(const Standard_Integer theRank);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Calculate fi'(u,v).

Parameters
----------
UV: math_Vector
DF: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the number of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return the points of the nth extreme distance.

Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****************** SearchOfTolerance ******************/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Parameters
----------
C: Standard_Address

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance(const Standard_Address C);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRank: int
C1: Adaptor3d_Curve

Returns
-------
None
") SetCurve;
		void SetCurve(const Standard_Integer theRank, const Adaptor3d_Curve & C1);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
theTol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theTol);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return the value of the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines of boundaries of subinterval for find of root.

Parameters
----------
theUfirst: math_Vector
theUlast: math_Vector

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const math_Vector & theUfirst, const math_Vector & theUlast);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns a tolerance specified in the constructor or in settolerance() method.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculate fi(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		virtual Standard_Boolean Value(const math_Vector & UV, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculate fi(u,v) and fi'(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & UV, math_Vector & F, math_Matrix & DF);

};


%extend Extrema_CCLocFOfLocECC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Extrema_CCLocFOfLocECC2d *
*********************************/
class Extrema_CCLocFOfLocECC2d : public math_FunctionSetWithDerivatives {
	public:
		/****************** Extrema_CCLocFOfLocECC2d ******************/
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
thetol: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_CCLocFOfLocECC2d;
		 Extrema_CCLocFOfLocECC2d(const Standard_Real thetol = 1.0e-10);

		/****************** Extrema_CCLocFOfLocECC2d ******************/
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
thetol: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_CCLocFOfLocECC2d;
		 Extrema_CCLocFOfLocECC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real thetol = 1.0e-10);

		/****************** CurvePtr ******************/
		%feature("compactdefaultargs") CurvePtr;
		%feature("autodoc", "Returns a pointer to the curve specified in the constructor or in setcurve() method.

Parameters
----------
theRank: int

Returns
-------
Standard_Address
") CurvePtr;
		Standard_Address CurvePtr(const Standard_Integer theRank);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Calculate fi'(u,v).

Parameters
----------
UV: math_Vector
DF: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the number of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return the points of the nth extreme distance.

Parameters
----------
N: int
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****************** SearchOfTolerance ******************/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Parameters
----------
C: Standard_Address

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance(const Standard_Address C);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRank: int
C1: Adaptor2d_Curve2d

Returns
-------
None
") SetCurve;
		void SetCurve(const Standard_Integer theRank, const Adaptor2d_Curve2d & C1);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
theTol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theTol);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return the value of the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines of boundaries of subinterval for find of root.

Parameters
----------
theUfirst: math_Vector
theUlast: math_Vector

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const math_Vector & theUfirst, const math_Vector & theUlast);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns a tolerance specified in the constructor or in settolerance() method.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculate fi(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		virtual Standard_Boolean Value(const math_Vector & UV, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculate fi(u,v) and fi'(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & UV, math_Vector & F, math_Matrix & DF);

};


%extend Extrema_CCLocFOfLocECC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Extrema_Curve2dTool *
****************************/
class Extrema_Curve2dTool {
	public:
		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline(const Adaptor2d_Curve2d & C);

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier(const Adaptor2d_Curve2d & C);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
gp_Circ2d
") Circle;
		static gp_Circ2d Circle(const Adaptor2d_Curve2d & C);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity(const Adaptor2d_Curve2d & C);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		static void D0(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative.

Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2.

Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative.

Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		static void D3(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n.

Parameters
----------
C: Adaptor2d_Curve2d
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		static gp_Vec2d DN(const Adaptor2d_Curve2d & C, const Standard_Real U, const Standard_Integer N);

		/****************** DeflCurvIntervals ******************/
		%feature("compactdefaultargs") DeflCurvIntervals;
		%feature("autodoc", "Returns the parameters bounding the intervals of subdivision of curve according to curvature deflection. value of deflection is defined in method. //!.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") DeflCurvIntervals;
		static opencascade::handle<TColStd_HArray1OfReal> DeflCurvIntervals(const Adaptor2d_Curve2d & C);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
int
") Degree;
		static Standard_Integer Degree(const Adaptor2d_Curve2d & C);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse(const Adaptor2d_Curve2d & C);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const Adaptor2d_Curve2d & C);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType(const Adaptor2d_Curve2d & C);

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola(const Adaptor2d_Curve2d & C);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>.

Parameters
----------
C: Adaptor2d_Curve2d
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		static void Intervals(const Adaptor2d_Curve2d & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const Adaptor2d_Curve2d & C);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const Adaptor2d_Curve2d & C);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
bool
") IsRational;
		static Standard_Boolean IsRational(const Adaptor2d_Curve2d & C);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const Adaptor2d_Curve2d & C);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
gp_Lin2d
") Line;
		static gp_Lin2d Line(const Adaptor2d_Curve2d & C);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the curve in intervals of continuity <s>. and returns the number of intervals.

Parameters
----------
C: Adaptor2d_Curve2d
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		static Standard_Integer NbIntervals(const Adaptor2d_Curve2d & C, const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
int
") NbKnots;
		static Standard_Integer NbKnots(const Adaptor2d_Curve2d & C);

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
int
") NbPoles;
		static Standard_Integer NbPoles(const Adaptor2d_Curve2d & C);

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola(const Adaptor2d_Curve2d & C);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
float
") Period;
		static Standard_Real Period(const Adaptor2d_Curve2d & C);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
C: Adaptor2d_Curve2d
R3d: float

Returns
-------
float
") Resolution;
		static Standard_Real Resolution(const Adaptor2d_Curve2d & C, const Standard_Real R3d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: Adaptor2d_Curve2d
U: float

Returns
-------
gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const Adaptor2d_Curve2d & C, const Standard_Real U);

};


%extend Extrema_Curve2dTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Extrema_CurveTool *
**************************/
class Extrema_CurveTool {
	public:
		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		static opencascade::handle<Geom_BSplineCurve> BSpline(const Adaptor3d_Curve & C);

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
opencascade::handle<Geom_BezierCurve>
") Bezier;
		static opencascade::handle<Geom_BezierCurve> Bezier(const Adaptor3d_Curve & C);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
gp_Circ
") Circle;
		static gp_Circ Circle(const Adaptor3d_Curve & C);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity(const Adaptor3d_Curve & C);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		static void D0(const Adaptor3d_Curve & C, const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		static void D1(const Adaptor3d_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		static void D2(const Adaptor3d_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		static void D3(const Adaptor3d_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
U: float
N: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const Adaptor3d_Curve & C, const Standard_Real U, const Standard_Integer N);

		/****************** DeflCurvIntervals ******************/
		%feature("compactdefaultargs") DeflCurvIntervals;
		%feature("autodoc", "Returns the parameters bounding the intervals of subdivision of curve according to curvature deflection. value of deflection is defined in method. //!.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") DeflCurvIntervals;
		static opencascade::handle<TColStd_HArray1OfReal> DeflCurvIntervals(const Adaptor3d_Curve & C);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
int
") Degree;
		static Standard_Integer Degree(const Adaptor3d_Curve & C);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
gp_Elips
") Ellipse;
		static gp_Elips Ellipse(const Adaptor3d_Curve & C);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const Adaptor3d_Curve & C);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType(const Adaptor3d_Curve & C);

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
gp_Hypr
") Hyperbola;
		static gp_Hypr Hyperbola(const Adaptor3d_Curve & C);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
C: Adaptor3d_Curve
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		static void Intervals(Adaptor3d_Curve & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const Adaptor3d_Curve & C);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
bool
") IsRational;
		static Standard_Boolean IsRational(const Adaptor3d_Curve & C);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const Adaptor3d_Curve & C);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
gp_Lin
") Line;
		static gp_Lin Line(const Adaptor3d_Curve & C);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
C: Adaptor3d_Curve
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		static Standard_Integer NbIntervals(Adaptor3d_Curve & C, const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
int
") NbKnots;
		static Standard_Integer NbKnots(const Adaptor3d_Curve & C);

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
int
") NbPoles;
		static Standard_Integer NbPoles(const Adaptor3d_Curve & C);

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
gp_Parab
") Parabola;
		static gp_Parab Parabola(const Adaptor3d_Curve & C);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
float
") Period;
		static Standard_Real Period(const Adaptor3d_Curve & C);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
R3d: float

Returns
-------
float
") Resolution;
		static Standard_Real Resolution(const Adaptor3d_Curve & C, const Standard_Real R3d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
U: float

Returns
-------
gp_Pnt
") Value;
		static gp_Pnt Value(const Adaptor3d_Curve & C, const Standard_Real U);

};


%extend Extrema_CurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Extrema_ECC *
********************/
class Extrema_ECC {
	public:
		/****************** Extrema_ECC ******************/
		%feature("compactdefaultargs") Extrema_ECC;
		%feature("autodoc", "Calculates all the distances as above between uinf and usup for c1 and between vinf and vsup for c2.

Returns
-------
None
") Extrema_ECC;
		 Extrema_ECC();

		/****************** Extrema_ECC ******************/
		%feature("compactdefaultargs") Extrema_ECC;
		%feature("autodoc", "It calculates all the distances. the function f(u,v)=distance(c1(u),c2(v)) has an extremum when gradient(f)=0. the algorithm uses evtushenko's global optimization solver.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve

Returns
-------
None
") Extrema_ECC;
		 Extrema_ECC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2);

		/****************** Extrema_ECC ******************/
		%feature("compactdefaultargs") Extrema_ECC;
		%feature("autodoc", "Calculates all the distances as above between uinf and usup for c1 and between vinf and vsup for c2.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
Uinf: float
Usup: float
Vinf: float
Vsup: float

Returns
-------
None
") Extrema_ECC;
		 Extrema_ECC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup);

		/****************** GetSingleSolutionFlag ******************/
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "Get flag for single extrema computation. works on parametric solver only.

Returns
-------
bool
") GetSingleSolutionFlag;
		Standard_Boolean GetSingleSolutionFlag();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns state of myparallel flag.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs calculations.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points of the nth extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****************** SetParams ******************/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "Set params in case of empty constructor is usage.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
Uinf: float
Usup: float
Vinf: float
Vsup: float

Returns
-------
None
") SetParams;
		void SetParams(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup);

		/****************** SetSingleSolutionFlag ******************/
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "Set flag for single extrema computation. works on parametric solver only.

Parameters
----------
theSingleSolutionFlag: bool

Returns
-------
None
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag(const Standard_Boolean theSingleSolutionFlag);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth square extremum distance.

Parameters
----------
N: int,optional
	default value is 1

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

};


%extend Extrema_ECC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Extrema_ECC2d *
**********************/
class Extrema_ECC2d {
	public:
		/****************** Extrema_ECC2d ******************/
		%feature("compactdefaultargs") Extrema_ECC2d;
		%feature("autodoc", "Calculates all the distances as above between uinf and usup for c1 and between vinf and vsup for c2.

Returns
-------
None
") Extrema_ECC2d;
		 Extrema_ECC2d();

		/****************** Extrema_ECC2d ******************/
		%feature("compactdefaultargs") Extrema_ECC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u,v)=distance(c1(u),c2(v)) has an extremum when gradient(f)=0. the algorithm uses evtushenko's global optimization solver.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d

Returns
-------
None
") Extrema_ECC2d;
		 Extrema_ECC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2);

		/****************** Extrema_ECC2d ******************/
		%feature("compactdefaultargs") Extrema_ECC2d;
		%feature("autodoc", "Calculates all the distances as above between uinf and usup for c1 and between vinf and vsup for c2.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
Uinf: float
Usup: float
Vinf: float
Vsup: float

Returns
-------
None
") Extrema_ECC2d;
		 Extrema_ECC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup);

		/****************** GetSingleSolutionFlag ******************/
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "Get flag for single extrema computation. works on parametric solver only.

Returns
-------
bool
") GetSingleSolutionFlag;
		Standard_Boolean GetSingleSolutionFlag();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns state of myparallel flag.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs calculations.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points of the nth extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
N: int
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****************** SetParams ******************/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "Set params in case of empty constructor is usage.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
Uinf: float
Usup: float
Vinf: float
Vsup: float

Returns
-------
None
") SetParams;
		void SetParams(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup);

		/****************** SetSingleSolutionFlag ******************/
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "Set flag for single extrema computation. works on parametric solver only.

Parameters
----------
theSingleSolutionFlag: bool

Returns
-------
None
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag(const Standard_Boolean theSingleSolutionFlag);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth square extremum distance.

Parameters
----------
N: int,optional
	default value is 1

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

};


%extend Extrema_ECC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Extrema_ELPCOfLocateExtPC *
**********************************/
class Extrema_ELPCOfLocateExtPC {
	public:
		/****************** Extrema_ELPCOfLocateExtPC ******************/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC();

		/****************** Extrema_ELPCOfLocateExtPC ******************/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. zeros are searched between uinf and usup. tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
Uinf: float
Usup: float
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****************** Extrema_ELPCOfLocateExtPC ******************/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real TolF = 1.0e-10);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve
Uinf: float
Usup: float
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the <n>th extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "An exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the <n>th extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the <n>th extremum square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** TrimmedSquareDistances ******************/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "If the curve is a trimmed curve, dist1 is a square distance between <p> and the point of parameter firstparameter <p1> and dist2 is a square distance between <p> and the point of parameter lastparameter <p2>.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
dist1: float
dist2: float
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & P1, gp_Pnt & P2);

};


%extend Extrema_ELPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Extrema_ELPCOfLocateExtPC2d *
************************************/
class Extrema_ELPCOfLocateExtPC2d {
	public:
		/****************** Extrema_ELPCOfLocateExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d();

		/****************** Extrema_ELPCOfLocateExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. zeros are searched between uinf and usup. tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
Uinf: float
Usup: float
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****************** Extrema_ELPCOfLocateExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real TolF = 1.0e-10);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
Uinf: float
Usup: float
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the <n>th extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "An exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the <n>th extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the <n>th extremum square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** TrimmedSquareDistances ******************/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "If the curve is a trimmed curve, dist1 is a square distance between <p> and the point of parameter firstparameter <p1> and dist2 is a square distance between <p> and the point of parameter lastparameter <p2>.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
dist1: float
dist2: float
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & P1, gp_Pnt2d & P2);

};


%extend Extrema_ELPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class Extrema_EPCOfELPCOfLocateExtPC *
***************************************/
class Extrema_EPCOfELPCOfLocateExtPC {
	public:
		/****************** Extrema_EPCOfELPCOfLocateExtPC ******************/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC();

		/****************** Extrema_EPCOfELPCOfLocateExtPC ******************/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. nbu is used to locate the close points to find the zeros. tol and tolu are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(un-un-1) < tolu and abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
NbU: int
TolU: float
TolF: float

Returns
-------
None
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Extrema_EPCOfELPCOfLocateExtPC ******************/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. nbu is used to locate the close points to find the zeros. zeros are searched between umin and usup. tol and tolu are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(un-un-1) < tolu and abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve
NbU: int
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the nth extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_EPCOfELPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class Extrema_EPCOfELPCOfLocateExtPC2d *
*****************************************/
class Extrema_EPCOfELPCOfLocateExtPC2d {
	public:
		/****************** Extrema_EPCOfELPCOfLocateExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d();

		/****************** Extrema_EPCOfELPCOfLocateExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. nbu is used to locate the close points to find the zeros. tol and tolu are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(un-un-1) < tolu and abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
NbU: int
TolU: float
TolF: float

Returns
-------
None
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Extrema_EPCOfELPCOfLocateExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. nbu is used to locate the close points to find the zeros. zeros are searched between umin and usup. tol and tolu are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(un-un-1) < tolu and abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
NbU: int
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the nth extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_EPCOfELPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Extrema_EPCOfExtPC *
***************************/
class Extrema_EPCOfExtPC {
	public:
		/****************** Extrema_EPCOfExtPC ******************/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC();

		/****************** Extrema_EPCOfExtPC ******************/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. nbu is used to locate the close points to find the zeros. tol and tolu are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(un-un-1) < tolu and abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
NbU: int
TolU: float
TolF: float

Returns
-------
None
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Extrema_EPCOfExtPC ******************/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. nbu is used to locate the close points to find the zeros. zeros are searched between umin and usup. tol and tolu are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(un-un-1) < tolu and abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve
NbU: int
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the nth extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_EPCOfExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Extrema_EPCOfExtPC2d *
*****************************/
class Extrema_EPCOfExtPC2d {
	public:
		/****************** Extrema_EPCOfExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d();

		/****************** Extrema_EPCOfExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. nbu is used to locate the close points to find the zeros. tol and tolu are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(un-un-1) < tolu and abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
NbU: int
TolU: float
TolF: float

Returns
-------
None
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Extrema_EPCOfExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. nbu is used to locate the close points to find the zeros. zeros are searched between umin and usup. tol and tolu are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(un-un-1) < tolu and abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
NbU: int
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the nth extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_EPCOfExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Extrema_ExtCC *
**********************/
class Extrema_ExtCC {
	public:
		/****************** Extrema_ExtCC ******************/
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "No available documentation.

Parameters
----------
TolC1: float,optional
	default value is 1.0e-10
TolC2: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtCC;
		 Extrema_ExtCC(const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****************** Extrema_ExtCC ******************/
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "It calculates all the distances.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
TolC1: float,optional
	default value is 1.0e-10
TolC2: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtCC;
		 Extrema_ExtCC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****************** Extrema_ExtCC ******************/
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "It calculates all the distances.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
U1: float
U2: float
V1: float
V2: float
TolC1: float,optional
	default value is 1.0e-10
TolC2: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtCC;
		 Extrema_ExtCC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****************** GetSingleSolutionFlag ******************/
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "Get flag for single extrema computation. works on parametric solver only.

Returns
-------
bool
") GetSingleSolutionFlag;
		Standard_Boolean GetSingleSolutionFlag();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the two curves are parallel.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points of the nth extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRank: int
C: Adaptor3d_Curve

Returns
-------
None
") SetCurve;
		void SetCurve(const Standard_Integer theRank, const Adaptor3d_Curve & C);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRank: int
C: Adaptor3d_Curve
Uinf: float
Usup: float

Returns
-------
None
") SetCurve;
		void SetCurve(const Standard_Integer theRank, const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** SetRange ******************/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRank: int
Uinf: float
Usup: float

Returns
-------
None
") SetRange;
		void SetRange(const Standard_Integer theRank, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** SetSingleSolutionFlag ******************/
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "Set flag for single extrema computation. works on parametric solver only.

Parameters
----------
theSingleSolutionFlag: bool

Returns
-------
None
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag(const Standard_Boolean theSingleSolutionFlag);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRank: int
Tol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Integer theRank, const Standard_Real Tol);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int,optional
	default value is 1

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

		/****************** TrimmedSquareDistances ******************/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "If the curve is a trimmed curve, dist11 is a square distance between the point on c1 of parameter firstparameter and the point of parameter firstparameter on c2.

Parameters
----------
P11: gp_Pnt
P12: gp_Pnt
P21: gp_Pnt
P22: gp_Pnt

Returns
-------
dist11: float
distP12: float
distP21: float
distP22: float
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & P11, gp_Pnt & P12, gp_Pnt & P21, gp_Pnt & P22);

};


%extend Extrema_ExtCC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtCC2d *
************************/
class Extrema_ExtCC2d {
	public:
		/****************** Extrema_ExtCC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d();

		/****************** Extrema_ExtCC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "It calculates all the distances.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
TolC1: float,optional
	default value is 1.0e-10
TolC2: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****************** Extrema_ExtCC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "It calculates all the distances.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
U1: float
U2: float
V1: float
V2: float
TolC1: float,optional
	default value is 1.0e-10
TolC2: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****************** GetSingleSolutionFlag ******************/
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "Get flag for single extrema computation. works on parametric solver only.

Returns
-------
bool
") GetSingleSolutionFlag;
		Standard_Boolean GetSingleSolutionFlag();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields.

Parameters
----------
C2: Adaptor2d_Curve2d
V1: float
V2: float
TolC1: float,optional
	default value is 1.0e-10
TolC2: float,optional
	default value is 1.0e-10

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C2, const Standard_Real V1, const Standard_Real V2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the two curves are parallel.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor2d_Curve2d
U1: float
U2: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const Standard_Real U1, const Standard_Real U2);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points of the nth extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
N: int
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****************** SetSingleSolutionFlag ******************/
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "Set flag for single extrema computation. works on parametric solver only.

Parameters
----------
theSingleSolutionFlag: bool

Returns
-------
None
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag(const Standard_Boolean theSingleSolutionFlag);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int,optional
	default value is 1

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

		/****************** TrimmedSquareDistances ******************/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "If the curve is a trimmed curve, dist11 is a square distance between the point on c1 of parameter firstparameter and the point of parameter firstparameter on c2.

Parameters
----------
P11: gp_Pnt2d
P12: gp_Pnt2d
P21: gp_Pnt2d
P22: gp_Pnt2d

Returns
-------
dist11: float
distP12: float
distP21: float
distP22: float
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & P11, gp_Pnt2d & P12, gp_Pnt2d & P21, gp_Pnt2d & P22);

};


%extend Extrema_ExtCC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Extrema_ExtCS *
**********************/
class Extrema_ExtCS {
	public:
		/****************** Extrema_ExtCS ******************/
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtCS;
		 Extrema_ExtCS();

		/****************** Extrema_ExtCS ******************/
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "It calculates all the distances between c and s.

Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
TolC: float
TolS: float

Returns
-------
None
") Extrema_ExtCS;
		 Extrema_ExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Real TolC, const Standard_Real TolS);

		/****************** Extrema_ExtCS ******************/
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "It calculates all the distances between c and s. ucinf and ucmax are the start and end parameters of the curve.

Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
UCinf: float
UCsup: float
Uinf: float
Usup: float
Vinf: float
Vsup: float
TolC: float
TolS: float

Returns
-------
None
") Extrema_ExtCS;
		 Extrema_ExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Real UCinf, const Standard_Real UCsup, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup, const Standard_Real TolC, const Standard_Real TolS);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
S: Adaptor3d_Surface
Uinf: float
Usup: float
Vinf: float
Vsup: float
TolC: float
TolS: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup, const Standard_Real TolC, const Standard_Real TolS);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the curve is on a parallel surface.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the distances. an exception is raised if the fieds have not been initialized.

Parameters
----------
C: Adaptor3d_Curve
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnSurf

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnSurf & P2);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_ExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Extrema_ExtElC *
***********************/
class Extrema_ExtElC {
	public:
		/****************** Extrema_ExtElC ******************/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtElC;
		 Extrema_ExtElC();

		/****************** Extrema_ExtElC ******************/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "Calculates the distance between two lines. angtol is used to test if the lines are parallel: angle(c1,c2) < angtol.

Parameters
----------
C1: gp_Lin
C2: gp_Lin
AngTol: float

Returns
-------
None
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Lin & C2, const Standard_Real AngTol);

		/****************** Extrema_ExtElC ******************/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "Calculates the distance between a line and a circle.

Parameters
----------
C1: gp_Lin
C2: gp_Circ
Tol: float

Returns
-------
None
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Circ & C2, const Standard_Real Tol);

		/****************** Extrema_ExtElC ******************/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "Calculates the distance between a line and an elipse.

Parameters
----------
C1: gp_Lin
C2: gp_Elips

Returns
-------
None
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Elips & C2);

		/****************** Extrema_ExtElC ******************/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "Calculates the distance between a line and a hyperbola.

Parameters
----------
C1: gp_Lin
C2: gp_Hypr

Returns
-------
None
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Hypr & C2);

		/****************** Extrema_ExtElC ******************/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "Calculates the distance between a line and a parabola.

Parameters
----------
C1: gp_Lin
C2: gp_Parab

Returns
-------
None
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Parab & C2);

		/****************** Extrema_ExtElC ******************/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "Calculates the distance between two circles. the circles can be parallel or identical.

Parameters
----------
C1: gp_Circ
C2: gp_Circ

Returns
-------
None
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Circ & C1, const gp_Circ & C2);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the two curves are parallel.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points of the nth extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int,optional
	default value is 1

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

};


%extend Extrema_ExtElC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_ExtElC2d *
*************************/
class Extrema_ExtElC2d {
	public:
		/****************** Extrema_ExtElC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d();

		/****************** Extrema_ExtElC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between two lines. angtol is used to test if the lines are parallel: angle(c1,c2) < angtol.

Parameters
----------
C1: gp_Lin2d
C2: gp_Lin2d
AngTol: float

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Lin2d & C2, const Standard_Real AngTol);

		/****************** Extrema_ExtElC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between a line and a circle.

Parameters
----------
C1: gp_Lin2d
C2: gp_Circ2d
Tol: float

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Circ2d & C2, const Standard_Real Tol);

		/****************** Extrema_ExtElC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between a line and an elipse.

Parameters
----------
C1: gp_Lin2d
C2: gp_Elips2d

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Elips2d & C2);

		/****************** Extrema_ExtElC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between a line and a hyperbola.

Parameters
----------
C1: gp_Lin2d
C2: gp_Hypr2d

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Hypr2d & C2);

		/****************** Extrema_ExtElC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between a line and a parabola.

Parameters
----------
C1: gp_Lin2d
C2: gp_Parab2d

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Parab2d & C2);

		/****************** Extrema_ExtElC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between two circles. the circles can be parallel or identical.

Parameters
----------
C1: gp_Circ2d
C2: gp_Circ2d

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Circ2d & C1, const gp_Circ2d & C2);

		/****************** Extrema_ExtElC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between a circle and an elipse.

Parameters
----------
C1: gp_Circ2d
C2: gp_Elips2d

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Circ2d & C1, const gp_Elips2d & C2);

		/****************** Extrema_ExtElC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between a circle and a hyperbola.

Parameters
----------
C1: gp_Circ2d
C2: gp_Hypr2d

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Circ2d & C1, const gp_Hypr2d & C2);

		/****************** Extrema_ExtElC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between a circle and a parabola.

Parameters
----------
C1: gp_Circ2d
C2: gp_Parab2d

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Circ2d & C1, const gp_Parab2d & C2);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the two curves are parallel.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points of the nth extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
N: int
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int,optional
	default value is 1

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

};


%extend Extrema_ExtElC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtElCS *
************************/
class Extrema_ExtElCS {
	public:
		/****************** Extrema_ExtElCS ******************/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS();

		/****************** Extrema_ExtElCS ******************/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a line and a plane. the line can be on the plane or on a parallel plane.

Parameters
----------
C: gp_Lin
S: gp_Pln

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Pln & S);

		/****************** Extrema_ExtElCS ******************/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a line and a cylinder.

Parameters
----------
C: gp_Lin
S: gp_Cylinder

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Cylinder & S);

		/****************** Extrema_ExtElCS ******************/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a line and a cone.

Parameters
----------
C: gp_Lin
S: gp_Cone

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Cone & S);

		/****************** Extrema_ExtElCS ******************/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a line and a sphere.

Parameters
----------
C: gp_Lin
S: gp_Sphere

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Sphere & S);

		/****************** Extrema_ExtElCS ******************/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a line and a torus.

Parameters
----------
C: gp_Lin
S: gp_Torus

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Torus & S);

		/****************** Extrema_ExtElCS ******************/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a circle and a plane.

Parameters
----------
C: gp_Circ
S: gp_Pln

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Pln & S);

		/****************** Extrema_ExtElCS ******************/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a circle and a cylinder.

Parameters
----------
C: gp_Circ
S: gp_Cylinder

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Cylinder & S);

		/****************** Extrema_ExtElCS ******************/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a circle and a cone.

Parameters
----------
C: gp_Circ
S: gp_Cone

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Cone & S);

		/****************** Extrema_ExtElCS ******************/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a circle and a sphere.

Parameters
----------
C: gp_Circ
S: gp_Sphere

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Sphere & S);

		/****************** Extrema_ExtElCS ******************/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a circle and a torus.

Parameters
----------
C: gp_Circ
S: gp_Torus

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Torus & S);

		/****************** Extrema_ExtElCS ******************/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a hyperbola and a plane.

Parameters
----------
C: gp_Hypr
S: gp_Pln

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Hypr & C, const gp_Pln & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the curve is on a parallel surface.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
S: gp_Pln

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & C, const gp_Pln & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
S: gp_Cylinder

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & C, const gp_Cylinder & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
S: gp_Cone

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & C, const gp_Cone & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
S: gp_Sphere

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & C, const gp_Sphere & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
S: gp_Torus

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & C, const gp_Torus & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ
S: gp_Pln

Returns
-------
None
") Perform;
		void Perform(const gp_Circ & C, const gp_Pln & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ
S: gp_Cylinder

Returns
-------
None
") Perform;
		void Perform(const gp_Circ & C, const gp_Cylinder & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ
S: gp_Cone

Returns
-------
None
") Perform;
		void Perform(const gp_Circ & C, const gp_Cone & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ
S: gp_Sphere

Returns
-------
None
") Perform;
		void Perform(const gp_Circ & C, const gp_Sphere & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ
S: gp_Torus

Returns
-------
None
") Perform;
		void Perform(const gp_Circ & C, const gp_Torus & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Hypr
S: gp_Pln

Returns
-------
None
") Perform;
		void Perform(const gp_Hypr & C, const gp_Pln & S);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points of the nth extremum distance. p1 is on the curve, p2 on the surface.

Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnSurf

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnSurf & P2);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int,optional
	default value is 1

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

};


%extend Extrema_ExtElCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtElSS *
************************/
class Extrema_ExtElSS {
	public:
		/****************** Extrema_ExtElSS ******************/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtElSS;
		 Extrema_ExtElSS();

		/****************** Extrema_ExtElSS ******************/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "Calculates the distances between 2 planes. these planes can be parallel.

Parameters
----------
S1: gp_Pln
S2: gp_Pln

Returns
-------
None
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Pln & S1, const gp_Pln & S2);

		/****************** Extrema_ExtElSS ******************/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "Calculates the distances between a plane and a sphere.

Parameters
----------
S1: gp_Pln
S2: gp_Sphere

Returns
-------
None
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Pln & S1, const gp_Sphere & S2);

		/****************** Extrema_ExtElSS ******************/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "Calculates the distances between 2 spheres. these spheres can be parallel.

Parameters
----------
S1: gp_Sphere
S2: gp_Sphere

Returns
-------
None
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Sphere & S1, const gp_Sphere & S2);

		/****************** Extrema_ExtElSS ******************/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "Calculates the distances between a sphere and a cylinder.

Parameters
----------
S1: gp_Sphere
S2: gp_Cylinder

Returns
-------
None
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Sphere & S1, const gp_Cylinder & S2);

		/****************** Extrema_ExtElSS ******************/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "Calculates the distances between a sphere and a cone.

Parameters
----------
S1: gp_Sphere
S2: gp_Cone

Returns
-------
None
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Sphere & S1, const gp_Cone & S2);

		/****************** Extrema_ExtElSS ******************/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "Calculates the distances between a sphere and a torus.

Parameters
----------
S1: gp_Sphere
S2: gp_Torus

Returns
-------
None
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Sphere & S1, const gp_Torus & S2);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the two surfaces are parallel.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: gp_Pln
S2: gp_Pln

Returns
-------
None
") Perform;
		void Perform(const gp_Pln & S1, const gp_Pln & S2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: gp_Pln
S2: gp_Sphere

Returns
-------
None
") Perform;
		void Perform(const gp_Pln & S1, const gp_Sphere & S2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: gp_Sphere
S2: gp_Sphere

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & S1, const gp_Sphere & S2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: gp_Sphere
S2: gp_Cylinder

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & S1, const gp_Cylinder & S2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: gp_Sphere
S2: gp_Cone

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & S1, const gp_Cone & S2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: gp_Sphere
S2: gp_Torus

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & S1, const gp_Torus & S2);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points for the nth resulting distance. p1 is on the first surface, p2 on the second one.

Parameters
----------
N: int
P1: Extrema_POnSurf
P2: Extrema_POnSurf

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnSurf & P1, Extrema_POnSurf & P2);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int,optional
	default value is 1

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

};


%extend Extrema_ExtElSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Extrema_ExtPC *
**********************/
class Extrema_ExtPC {
	public:
		/****************** Extrema_ExtPC ******************/
		%feature("compactdefaultargs") Extrema_ExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtPC;
		 Extrema_ExtPC();

		/****************** Extrema_ExtPC ******************/
		%feature("compactdefaultargs") Extrema_ExtPC;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. zeros are searched between uinf and usup. tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
Uinf: float
Usup: float
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtPC;
		 Extrema_ExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****************** Extrema_ExtPC ******************/
		%feature("compactdefaultargs") Extrema_ExtPC;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtPC;
		 Extrema_ExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real TolF = 1.0e-10);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve
Uinf: float
Usup: float
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the <n>th extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "An exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the <n>th extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the <n>th extremum square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** TrimmedSquareDistances ******************/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "If the curve is a trimmed curve, dist1 is a square distance between <p> and the point of parameter firstparameter <p1> and dist2 is a square distance between <p> and the point of parameter lastparameter <p2>.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
dist1: float
dist2: float
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & P1, gp_Pnt & P2);

};


%extend Extrema_ExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtPC2d *
************************/
class Extrema_ExtPC2d {
	public:
		/****************** Extrema_ExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d();

		/****************** Extrema_ExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtPC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. zeros are searched between uinf and usup. tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
Uinf: float
Usup: float
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****************** Extrema_ExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtPC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real TolF = 1.0e-10);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
Uinf: float
Usup: float
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the <n>th extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "An exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the <n>th extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the <n>th extremum square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** TrimmedSquareDistances ******************/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "If the curve is a trimmed curve, dist1 is a square distance between <p> and the point of parameter firstparameter <p1> and dist2 is a square distance between <p> and the point of parameter lastparameter <p2>.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
dist1: float
dist2: float
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & P1, gp_Pnt2d & P2);

};


%extend Extrema_ExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtPElC *
************************/
class Extrema_ExtPElC {
	public:
		/****************** Extrema_ExtPElC ******************/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtPElC;
		 Extrema_ExtPElC();

		/****************** Extrema_ExtPElC ******************/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "Calculates the extremum distance between the point p and the segment [uinf,usup] of the line c.

Parameters
----------
P: gp_Pnt
C: gp_Lin
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Lin & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Extrema_ExtPElC ******************/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "Calculates the 2 extremum distances between the point p and the segment [uinf,usup] of the circle c. tol is used to determine if p is on the axis of the circle or if an extremum is on an endpoint of the segment. if p is on the axis of the circle, there are infinite solution then isdone(me)=false. the conditions on the uinf and usup are: 0. <= uinf <= 2.*pi and usup > uinf. if usup > uinf + 2.*pi, then only the solutions in the range [uinf,uinf+2.*pi[ are computed.

Parameters
----------
P: gp_Pnt
C: gp_Circ
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Circ & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Extrema_ExtPElC ******************/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "Calculates the 4 extremum distances between the point p and the segment [uinf,usup] of the elipse c. tol is used to determine if the point is on the axis of the elipse and if the major radius is equal to the minor radius or if an extremum is on an endpoint of the segment. if p is on the axis of the elipse, there are infinite solution then isdone(me)=false. the conditions on the uinf and usup are: 0. <= uinf <= 2.*pi and usup > uinf. if usup > uinf + 2.*pi, then only the solutions in the range [uinf,uinf+2.*pi[ are computed.

Parameters
----------
P: gp_Pnt
C: gp_Elips
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Elips & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Extrema_ExtPElC ******************/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "Calculates the extremum distances between the point p and the segment [uinf,usup] of the hyperbola c. tol is used to determine if two solutions u and v are identical; the condition is: dist(c(u),c(v)) < tol.

Parameters
----------
P: gp_Pnt
C: gp_Hypr
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Hypr & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Extrema_ExtPElC ******************/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "Calculates the 4 extremum distances between the point p and the segment [uinf,usup] of the parabola c. tol is used to determine if two solutions u and v are identical; the condition is: dist(c(u),c(v)) < tol.

Parameters
----------
P: gp_Pnt
C: gp_Parab
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Parab & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the nth extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
C: gp_Lin
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Lin & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
C: gp_Circ
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Circ & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
C: gp_Elips
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Elips & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
C: gp_Hypr
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Hypr & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
C: gp_Parab
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Parab & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_ExtPElC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Extrema_ExtPElC2d *
**************************/
class Extrema_ExtPElC2d {
	public:
		/****************** Extrema_ExtPElC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d();

		/****************** Extrema_ExtPElC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "Calculates the extremum distance between the point p and the segment [uinf,usup] of the line l.

Parameters
----------
P: gp_Pnt2d
C: gp_Lin2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Lin2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Extrema_ExtPElC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "Calculates the 2 extremum distances between the point p and the segment [uinf,usup] of the circle c. tol is used to determine if p is on the axis of the circle or if an extremum is on an endpoint of the segment. if p is on the axis of the circle, there are infinite solution then isdone(me)=false. the conditions on the uinf and usup are: 0. <= uinf <= 2.*pi and usup > uinf. if usup > uinf + 2.*pi, then only the solutions in the range [uinf,uinf+2.*pi[ are computed.

Parameters
----------
P: gp_Pnt2d
C: gp_Circ2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Circ2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Extrema_ExtPElC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "Calculates the 4 extremum distances between the point p and the segment [uinf,usup] of the elipse c. tol is used to determine if the point is on the axis of the elipse and if the major radius is equal to the minor radius or if an extremum is on an endpoint of the segment. if p is on the axis of the elipse, there are infinite solution then isdone(me)=false. the conditions on the uinf and usup are: 0. <= uinf <= 2.*pi and usup > uinf. if usup > uinf + 2.*pi, then only the solutions in the range [uinf,uinf+2.*pi[ are computed.

Parameters
----------
P: gp_Pnt2d
C: gp_Elips2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Elips2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Extrema_ExtPElC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "Calculates the extremum distances between the point p and the segment [uinf,usup] of the hyperbola c. tol is used to determine if two solutions u and v are identical; the condition is: dist(c(u),c(v)) < tol.

Parameters
----------
P: gp_Pnt2d
C: gp_Hypr2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Hypr2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Extrema_ExtPElC2d ******************/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "Calculates the 4 extremum distances between the point p and the segment [uinf,usup] of the parabola c. tol is used to determine if two solutions u and v are identical; the condition is: dist(c(u),c(v)) < tol.

Parameters
----------
P: gp_Pnt2d
C: gp_Parab2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Parab2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the nth extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
L: gp_Lin2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Lin2d & L, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
C: gp_Circ2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Circ2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
C: gp_Elips2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Elips2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
C: gp_Hypr2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Hypr2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
C: gp_Parab2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Parab2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_ExtPElC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtPElS *
************************/
class Extrema_ExtPElS {
	public:
		/****************** Extrema_ExtPElS ******************/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtPElS;
		 Extrema_ExtPElS();

		/****************** Extrema_ExtPElS ******************/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "It calculates all the distances between a point and a cylinder from gp. tol is used to test if the point is on the axis.

Parameters
----------
P: gp_Pnt
S: gp_Cylinder
Tol: float

Returns
-------
None
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Cylinder & S, const Standard_Real Tol);

		/****************** Extrema_ExtPElS ******************/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "It calculates all the distances between a point and a plane from gp. tol is used to test if the point is on the plane.

Parameters
----------
P: gp_Pnt
S: gp_Pln
Tol: float

Returns
-------
None
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Pln & S, const Standard_Real Tol);

		/****************** Extrema_ExtPElS ******************/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "It calculates all the distances between a point and a cone from gp. tol is used to test if the point is at the apex or on the axis.

Parameters
----------
P: gp_Pnt
S: gp_Cone
Tol: float

Returns
-------
None
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Cone & S, const Standard_Real Tol);

		/****************** Extrema_ExtPElS ******************/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "It calculates all the distances between a point and a torus from gp. tol is used to test if the point is on the axis.

Parameters
----------
P: gp_Pnt
S: gp_Torus
Tol: float

Returns
-------
None
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Torus & S, const Standard_Real Tol);

		/****************** Extrema_ExtPElS ******************/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "It calculates all the distances between a point and a sphere from gp. tol is used to test if the point is at the center.

Parameters
----------
P: gp_Pnt
S: gp_Sphere
Tol: float

Returns
-------
None
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Sphere & S, const Standard_Real Tol);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
S: gp_Cylinder
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Cylinder & S, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
S: gp_Pln
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Pln & S, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
S: gp_Cone
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Cone & S, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
S: gp_Torus
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Torus & S, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
S: gp_Sphere
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Sphere & S, const Standard_Real Tol);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_ExtPElS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_ExtPExtS *
*************************/
class Extrema_ExtPExtS : public Standard_Transient {
	public:
		/****************** Extrema_ExtPExtS ******************/
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS();

		/****************** Extrema_ExtPExtS ******************/
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "It calculates all the distances between a point from gp and a surface.

Parameters
----------
P: gp_Pnt
S: GeomAdaptor_HSurfaceOfLinearExtrusion
Umin: float
Usup: float
Vmin: float
Vsup: float
TolU: float
TolV: float

Returns
-------
None
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS(const gp_Pnt & P, const opencascade::handle<GeomAdaptor_HSurfaceOfLinearExtrusion> & S, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****************** Extrema_ExtPExtS ******************/
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "It calculates all the distances between a point from gp and a surface.

Parameters
----------
P: gp_Pnt
S: GeomAdaptor_HSurfaceOfLinearExtrusion
TolU: float
TolV: float

Returns
-------
None
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS(const gp_Pnt & P, const opencascade::handle<GeomAdaptor_HSurfaceOfLinearExtrusion> & S, const Standard_Real TolU, const Standard_Real TolV);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
S: GeomAdaptor_HSurfaceOfLinearExtrusion
Uinf: float
Usup: float
Vinf: float
Vsup: float
TolU: float
TolV: float

Returns
-------
None
") Initialize;
		void Initialize(const opencascade::handle<GeomAdaptor_HSurfaceOfLinearExtrusion> & S, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%make_alias(Extrema_ExtPExtS)

%extend Extrema_ExtPExtS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_ExtPRevS *
*************************/
class Extrema_ExtPRevS : public Standard_Transient {
	public:
		/****************** Extrema_ExtPRevS ******************/
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS();

		/****************** Extrema_ExtPRevS ******************/
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "It calculates all the distances between a point from gp and a surfaceptr from adaptor3d.

Parameters
----------
P: gp_Pnt
S: GeomAdaptor_HSurfaceOfRevolution
Umin: float
Usup: float
Vmin: float
Vsup: float
TolU: float
TolV: float

Returns
-------
None
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS(const gp_Pnt & P, const opencascade::handle<GeomAdaptor_HSurfaceOfRevolution> & S, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****************** Extrema_ExtPRevS ******************/
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "It calculates all the distances between a point from gp and a surfaceptr from adaptor3d.

Parameters
----------
P: gp_Pnt
S: GeomAdaptor_HSurfaceOfRevolution
TolU: float
TolV: float

Returns
-------
None
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS(const gp_Pnt & P, const opencascade::handle<GeomAdaptor_HSurfaceOfRevolution> & S, const Standard_Real TolU, const Standard_Real TolV);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: GeomAdaptor_HSurfaceOfRevolution
Umin: float
Usup: float
Vmin: float
Vsup: float
TolU: float
TolV: float

Returns
-------
None
") Initialize;
		void Initialize(const opencascade::handle<GeomAdaptor_HSurfaceOfRevolution> & S, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%make_alias(Extrema_ExtPRevS)

%extend Extrema_ExtPRevS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Extrema_ExtPS *
**********************/
class Extrema_ExtPS {
	public:
		/****************** Extrema_ExtPS ******************/
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtPS;
		 Extrema_ExtPS();

		/****************** Extrema_ExtPS ******************/
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "It calculates all the distances. nbu and nbv are used to locate the close points to find the zeros. they must be great enough such that if there is n extrema, there will be n extrema between p and the grid. tolu et tolv are used to determine the conditions to stop the iterations; at the iteration number n: (un - un-1) < tolu and (vn - vn-1) < tolv .

Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface
TolU: float
TolV: float
F: Extrema_ExtFlag,optional
	default value is Extrema_ExtFlag_MINMAX
A: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") Extrema_ExtPS;
		 Extrema_ExtPS(const gp_Pnt & P, const Adaptor3d_Surface & S, const Standard_Real TolU, const Standard_Real TolV, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****************** Extrema_ExtPS ******************/
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "It calculates all the distances. nbu and nbv are used to locate the close points to find the zeros. they must be great enough such that if there is n extrema, there will be n extrema between p and the grid. tolu et tolv are used to determine the conditions to stop the iterations; at the iteration number n: (un - un-1) < tolu and (vn - vn-1) < tolv .

Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface
Uinf: float
Usup: float
Vinf: float
Vsup: float
TolU: float
TolV: float
F: Extrema_ExtFlag,optional
	default value is Extrema_ExtFlag_MINMAX
A: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") Extrema_ExtPS;
		 Extrema_ExtPS(const gp_Pnt & P, const Adaptor3d_Surface & S, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
S: Adaptor3d_Surface
Uinf: float
Usup: float
Vinf: float
Vsup: float
TolU: float
TolV: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the distances. an exception is raised if the fieds have not been initialized.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****************** SetAlgo ******************/
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Extrema_ExtAlgo

Returns
-------
None
") SetAlgo;
		void SetAlgo(const Extrema_ExtAlgo A);

		/****************** SetFlag ******************/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Extrema_ExtFlag

Returns
-------
None
") SetFlag;
		void SetFlag(const Extrema_ExtFlag F);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** TrimmedSquareDistances ******************/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "If the surface is a trimmed surface, dufvf is a square distance between <p> and the point of parameter firstuparameter and firstvparameter <pufvf>. dufvl is a square distance between <p> and the point of parameter firstuparameter and lastvparameter <pufvl>. dulvf is a square distance between <p> and the point of parameter lastuparameter and firstvparameter <pulvf>. dulvl is a square distance between <p> and the point of parameter lastuparameter and lastvparameter <pulvl>.

Parameters
----------
PUfVf: gp_Pnt
PUfVl: gp_Pnt
PUlVf: gp_Pnt
PUlVl: gp_Pnt

Returns
-------
dUfVf: float
dUfVl: float
dUlVf: float
dUlVl: float
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & PUfVf, gp_Pnt & PUfVl, gp_Pnt & PUlVf, gp_Pnt & PUlVl);

};


%extend Extrema_ExtPS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Extrema_ExtSS *
**********************/
class Extrema_ExtSS {
	public:
		/****************** Extrema_ExtSS ******************/
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtSS;
		 Extrema_ExtSS();

		/****************** Extrema_ExtSS ******************/
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "It calculates all the distances between s1 and s2.

Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
TolS1: float
TolS2: float

Returns
-------
None
") Extrema_ExtSS;
		 Extrema_ExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Real TolS1, const Standard_Real TolS2);

		/****************** Extrema_ExtSS ******************/
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "It calculates all the distances between s1 and s2.

Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
Uinf1: float
Usup1: float
Vinf1: float
Vsup1: float
Uinf2: float
Usup2: float
Vinf2: float
Vsup2: float
TolS1: float
TolS2: float

Returns
-------
None
") Extrema_ExtSS;
		 Extrema_ExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Real Uinf1, const Standard_Real Usup1, const Standard_Real Vinf1, const Standard_Real Vsup1, const Standard_Real Uinf2, const Standard_Real Usup2, const Standard_Real Vinf2, const Standard_Real Vsup2, const Standard_Real TolS1, const Standard_Real TolS2);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
S2: Adaptor3d_Surface
Uinf2: float
Usup2: float
Vinf2: float
Vsup2: float
TolS1: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S2, const Standard_Real Uinf2, const Standard_Real Usup2, const Standard_Real Vinf2, const Standard_Real Vsup2, const Standard_Real TolS1);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the curve is on a parallel surface.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the distances. an exception is raised if the fieds have not been initialized.

Parameters
----------
S1: Adaptor3d_Surface
Uinf1: float
Usup1: float
Vinf1: float
Vsup1: float
TolS1: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor3d_Surface & S1, const Standard_Real Uinf1, const Standard_Real Usup1, const Standard_Real Vinf1, const Standard_Real Vsup1, const Standard_Real TolS1);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int
P1: Extrema_POnSurf
P2: Extrema_POnSurf

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnSurf & P1, Extrema_POnSurf & P2);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_ExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Extrema_FuncExtCS *
**************************/
class Extrema_FuncExtCS : public math_FunctionSetWithDerivatives {
	public:
		/****************** Extrema_FuncExtCS ******************/
		%feature("compactdefaultargs") Extrema_FuncExtCS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_FuncExtCS;
		 Extrema_FuncExtCS();

		/****************** Extrema_FuncExtCS ******************/
		%feature("compactdefaultargs") Extrema_FuncExtCS;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface

Returns
-------
None
") Extrema_FuncExtCS;
		 Extrema_FuncExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Calculation of fi'(u,v).

Parameters
----------
UV: math_Vector
DF: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mysurf of the function.

Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the number of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** PointOnCurve ******************/
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "Returns the nth extremum on c.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve(const Standard_Integer N);

		/****************** PointOnSurface ******************/
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "Return the nth extremum on s.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return the value of the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of fi(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & UV, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of fi(u,v) and fi'(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & UV, math_Vector & F, math_Matrix & DF);

};


%extend Extrema_FuncExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Extrema_FuncExtSS *
**************************/
class Extrema_FuncExtSS : public math_FunctionSetWithDerivatives {
	public:
		/****************** Extrema_FuncExtSS ******************/
		%feature("compactdefaultargs") Extrema_FuncExtSS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_FuncExtSS;
		 Extrema_FuncExtSS();

		/****************** Extrema_FuncExtSS ******************/
		%feature("compactdefaultargs") Extrema_FuncExtSS;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface

Returns
-------
None
") Extrema_FuncExtSS;
		 Extrema_FuncExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Calculate fi'(u,v).

Parameters
----------
UV: math_Vector
DF: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mysurf of the function.

Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the number of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** PointOnS1 ******************/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Return the nth extremum on s1.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") PointOnS1;
		const Extrema_POnSurf & PointOnS1(const Standard_Integer N);

		/****************** PointOnS2 ******************/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Renvoie le nieme extremum sur s2.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") PointOnS2;
		const Extrema_POnSurf & PointOnS2(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return the value of the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculate fi(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & UV, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculate fi(u,v) and fi'(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & UV, math_Vector & F, math_Matrix & DF);

};


%extend Extrema_FuncExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Extrema_FuncPSDist *
***************************/
class Extrema_FuncPSDist : public math_MultipleVarFunctionWithGradient {
	public:
		/****************** Extrema_FuncPSDist ******************/
		%feature("compactdefaultargs") Extrema_FuncPSDist;
		%feature("autodoc", "Constructor.

Parameters
----------
theS: Adaptor3d_Surface
theP: gp_Pnt

Returns
-------
None
") Extrema_FuncPSDist;
		 Extrema_FuncPSDist(const Adaptor3d_Surface & theS, const gp_Pnt & theP);

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Gradient.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
bool
") Gradient;
		Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Number of variables.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Value.

Parameters
----------
X: math_Vector

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Value and gradient.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
F: float
") Values;
		Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

};


%extend Extrema_FuncPSDist {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Extrema_FuncPSNorm *
***************************/
class Extrema_FuncPSNorm : public math_FunctionSetWithDerivatives {
	public:
		/****************** Extrema_FuncPSNorm ******************/
		%feature("compactdefaultargs") Extrema_FuncPSNorm;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_FuncPSNorm;
		 Extrema_FuncPSNorm();

		/****************** Extrema_FuncPSNorm ******************/
		%feature("compactdefaultargs") Extrema_FuncPSNorm;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface

Returns
-------
None
") Extrema_FuncPSNorm;
		 Extrema_FuncPSNorm(const gp_Pnt & P, const Adaptor3d_Surface & S);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Calculate fi'(u,v).

Parameters
----------
UV: math_Vector
DF: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mysurf of the function.

Parameters
----------
S: Adaptor3d_Surface

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the number of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field mysurf of the function.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt & P);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return the value of the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculate fi(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & UV, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculate fi(u,v) and fi'(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & UV, math_Vector & F, math_Matrix & DF);

};


%extend Extrema_FuncPSNorm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_GenExtCS *
*************************/
class Extrema_GenExtCS {
	public:
		/****************** Extrema_GenExtCS ******************/
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_GenExtCS;
		 Extrema_GenExtCS();

		/****************** Extrema_GenExtCS ******************/
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "It calculates all the distances. the function f(u,v)=distance(s1(u1,v1),s2(u2,v2)) has an extremum when gradient(f)=0. the algorithm searchs all the zeros inside the definition ranges of the surfaces. nbu and nbv are used to locate the close points on the surface and nbt on the curve to find the zeros.

Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
NbT: int
NbU: int
NbV: int
Tol1: float
Tol2: float

Returns
-------
None
") Extrema_GenExtCS;
		 Extrema_GenExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Integer NbT, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Tol1, const Standard_Real Tol2);

		/****************** Extrema_GenExtCS ******************/
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "It calculates all the distances. the function f(u,v)=distance(p,s(u,v)) has an extremum when gradient(f)=0. the algorithm searchs all the zeros inside the definition ranges of the surface. nbt,nbu and nbv are used to locate the close points to find the zeros.

Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
NbT: int
NbU: int
NbV: int
tmin: float
tsup: float
Umin: float
Usup: float
Vmin: float
Vsup: float
Tol1: float
Tol2: float

Returns
-------
None
") Extrema_GenExtCS;
		 Extrema_GenExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Integer NbT, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real tmin, const Standard_Real tsup, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real Tol1, const Standard_Real Tol2);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_Surface
NbU: int
NbV: int
Tol2: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Tol2);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_Surface
NbU: int
NbV: int
Umin: float
Usup: float
Vmin: float
Vsup: float
Tol2: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real Tol2);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with s an exception is raised if the fields have not been initialized.

Parameters
----------
C: Adaptor3d_Curve
NbT: int
Tol1: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor3d_Curve & C, const Standard_Integer NbT, const Standard_Real Tol1);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with c an exception is raised if the fields have not been initialized.

Parameters
----------
C: Adaptor3d_Curve
NbT: int
tmin: float
tsup: float
Tol1: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor3d_Curve & C, const Standard_Integer NbT, const Standard_Real tmin, const Standard_Real tsup, const Standard_Real Tol1);

		/****************** PointOnCurve ******************/
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve(const Standard_Integer N);

		/****************** PointOnSurface ******************/
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_GenExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_GenExtPS *
*************************/
class Extrema_GenExtPS {
	public:
		/****************** Extrema_GenExtPS ******************/
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_GenExtPS;
		 Extrema_GenExtPS();

		/****************** Extrema_GenExtPS ******************/
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "It calculates all the distances. the function f(u,v)=distance(p,s(u,v)) has an extremum when gradient(f)=0. the algorithm searchs all the zeros inside the definition ranges of the surface. nbu and nbv are used to locate the close points to find the zeros. they must be great enough such that if there is n extrema, there will be n extrema between p and the grid. tolu et tolv are used to determine the conditions to stop the iterations; at the iteration number n: (un - un-1) < tolu and (vn - vn-1) < tolv .

Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface
NbU: int
NbV: int
TolU: float
TolV: float
F: Extrema_ExtFlag,optional
	default value is Extrema_ExtFlag_MINMAX
A: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") Extrema_GenExtPS;
		 Extrema_GenExtPS(const gp_Pnt & P, const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real TolU, const Standard_Real TolV, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****************** Extrema_GenExtPS ******************/
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "It calculates all the distances. the function f(u,v)=distance(p,s(u,v)) has an extremum when gradient(f)=0. the algorithm searchs all the zeros inside the definition ranges of the surface. nbu and nbv are used to locate the close points to find the zeros. they must be great enough such that if there is n extrema, there will be n extrema between p and the grid. tolu et tolv are used to determine the conditions to stop the iterations; at the iteration number n: (un - un-1) < tolu and (vn - vn-1) < tolv .

Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface
NbU: int
NbV: int
Umin: float
Usup: float
Vmin: float
Vsup: float
TolU: float
TolV: float
F: Extrema_ExtFlag,optional
	default value is Extrema_ExtFlag_MINMAX
A: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") Extrema_GenExtPS;
		 Extrema_GenExtPS(const gp_Pnt & P, const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_Surface
NbU: int
NbV: int
TolU: float
TolV: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real TolU, const Standard_Real TolV);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_Surface
NbU: int
NbV: int
Umin: float
Usup: float
Vmin: float
Vsup: float
TolU: float
TolV: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****************** SetAlgo ******************/
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Extrema_ExtAlgo

Returns
-------
None
") SetAlgo;
		void SetAlgo(const Extrema_ExtAlgo A);

		/****************** SetFlag ******************/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Extrema_ExtFlag

Returns
-------
None
") SetFlag;
		void SetFlag(const Extrema_ExtFlag F);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_GenExtPS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_GenExtSS *
*************************/
class Extrema_GenExtSS {
	public:
		/****************** Extrema_GenExtSS ******************/
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_GenExtSS;
		 Extrema_GenExtSS();

		/****************** Extrema_GenExtSS ******************/
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "It calculates all the distances. the function f(u,v)=distance(s1(u1,v1),s2(u2,v2)) has an extremum when gradient(f)=0. the algorithm searchs all the zeros inside the definition ranges of the surfaces. nbu and nbv are used to locate the close points to find the zeros.

Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
NbU: int
NbV: int
Tol1: float
Tol2: float

Returns
-------
None
") Extrema_GenExtSS;
		 Extrema_GenExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Tol1, const Standard_Real Tol2);

		/****************** Extrema_GenExtSS ******************/
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "It calculates all the distances. the function f(u,v)=distance(p,s(u,v)) has an extremum when gradient(f)=0. the algorithm searchs all the zeros inside the definition ranges of the surface. nbu and nbv are used to locate the close points to find the zeros.

Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
NbU: int
NbV: int
U1min: float
U1sup: float
V1min: float
V1sup: float
U2min: float
U2sup: float
V2min: float
V2sup: float
Tol1: float
Tol2: float

Returns
-------
None
") Extrema_GenExtSS;
		 Extrema_GenExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real U1min, const Standard_Real U1sup, const Standard_Real V1min, const Standard_Real V1sup, const Standard_Real U2min, const Standard_Real U2sup, const Standard_Real V2min, const Standard_Real V2sup, const Standard_Real Tol1, const Standard_Real Tol2);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
S2: Adaptor3d_Surface
NbU: int
NbV: int
Tol2: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S2, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Tol2);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
S2: Adaptor3d_Surface
NbU: int
NbV: int
U2min: float
U2sup: float
V2min: float
V2sup: float
Tol2: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S2, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real U2min, const Standard_Real U2sup, const Standard_Real V2min, const Standard_Real V2sup, const Standard_Real Tol2);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with s1 an exception is raised if the fields have not been initialized.

Parameters
----------
S1: Adaptor3d_Surface
Tol1: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor3d_Surface & S1, const Standard_Real Tol1);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done withs1 an exception is raised if the fields have not been initialized.

Parameters
----------
S1: Adaptor3d_Surface
U1min: float
U1sup: float
V1min: float
V1sup: float
Tol1: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor3d_Surface & S1, const Standard_Real U1min, const Standard_Real U1sup, const Standard_Real V1min, const Standard_Real V1sup, const Standard_Real Tol1);

		/****************** PointOnS1 ******************/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") PointOnS1;
		const Extrema_POnSurf & PointOnS1(const Standard_Integer N);

		/****************** PointOnS2 ******************/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") PointOnS2;
		const Extrema_POnSurf & PointOnS2(const Standard_Integer N);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_GenExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Extrema_GenLocateExtCS *
*******************************/
class Extrema_GenLocateExtCS {
	public:
		/****************** Extrema_GenLocateExtCS ******************/
		%feature("compactdefaultargs") Extrema_GenLocateExtCS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_GenLocateExtCS;
		 Extrema_GenLocateExtCS();

		/****************** Extrema_GenLocateExtCS ******************/
		%feature("compactdefaultargs") Extrema_GenLocateExtCS;
		%feature("autodoc", "Calculates the distance with two close points. the close points are defined by the parameter values t for c and (u,v) for s. the function f(t,u,v)=distance(c(t),s(u,v)) has an extremun when gradient(f)=0. the algorithm searchs a zero near the close points.

Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
T: float
U: float
V: float
Tol1: float
Tol2: float

Returns
-------
None
") Extrema_GenLocateExtCS;
		 Extrema_GenLocateExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Real T, const Standard_Real U, const Standard_Real V, const Standard_Real Tol1, const Standard_Real Tol2);

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
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
T: float
U: float
V: float
Tol1: float
Tol2: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Real T, const Standard_Real U, const Standard_Real V, const Standard_Real Tol1, const Standard_Real Tol2);

		/****************** PointOnCurve ******************/
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "Returns the point of the extremum distance on c.

Returns
-------
Extrema_POnCurv
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve();

		/****************** PointOnSurface ******************/
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "Returns the point of the extremum distance on s.

Returns
-------
Extrema_POnSurf
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface();

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_GenLocateExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Extrema_GenLocateExtPS *
*******************************/
class Extrema_GenLocateExtPS {
	public:
		/****************** Extrema_GenLocateExtPS ******************/
		%feature("compactdefaultargs") Extrema_GenLocateExtPS;
		%feature("autodoc", "Constructor.

Parameters
----------
theS: Adaptor3d_Surface
theTolU: float,optional
	default value is Precision::PConfusion()
theTolV: float,optional
	default value is Precision::PConfusion()

Returns
-------
None
") Extrema_GenLocateExtPS;
		 Extrema_GenLocateExtPS(const Adaptor3d_Surface & theS, const Standard_Real theTolU = Precision::PConfusion(), const Standard_Real theTolV = Precision::PConfusion());

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
		%feature("autodoc", "Calculates the extrema between the point and the surface using a close point. the close point is defined by the parameter values theu0 and thev0. type of the algorithm depends on the isdistancecriteria flag. if flag value is false - normal projection criteria will be used. if flag value is true - distance criteria will be used.

Parameters
----------
theP: gp_Pnt
theU0: float
theV0: float
isDistanceCriteria: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & theP, const Standard_Real theU0, const Standard_Real theV0, const Standard_Boolean isDistanceCriteria = Standard_False);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the extremum distance.

Returns
-------
Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point();

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_GenLocateExtPS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Extrema_GenLocateExtSS *
*******************************/
class Extrema_GenLocateExtSS {
	public:
		/****************** Extrema_GenLocateExtSS ******************/
		%feature("compactdefaultargs") Extrema_GenLocateExtSS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_GenLocateExtSS;
		 Extrema_GenLocateExtSS();

		/****************** Extrema_GenLocateExtSS ******************/
		%feature("compactdefaultargs") Extrema_GenLocateExtSS;
		%feature("autodoc", "Calculates the distance with two close points. the close points are defined by the parameter values (u1,v1) for s1 and (u2,v2) for s2. the function f(u1,v1,u2,v2)=distance(s1(u1,v1),s2(u2,v2)) has an extremun when gradient(f)=0. the algorithm searchs a zero near the close points.

Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
U1: float
V1: float
U2: float
V2: float
Tol1: float
Tol2: float

Returns
-------
None
") Extrema_GenLocateExtSS;
		 Extrema_GenLocateExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real Tol1, const Standard_Real Tol2);

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
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
U1: float
V1: float
U2: float
V2: float
Tol1: float
Tol2: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real Tol1, const Standard_Real Tol2);

		/****************** PointOnS1 ******************/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Returns the point of the extremum distance on s1.

Returns
-------
Extrema_POnSurf
") PointOnS1;
		const Extrema_POnSurf & PointOnS1();

		/****************** PointOnS2 ******************/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Returns the point of the extremum distance on s2.

Returns
-------
Extrema_POnSurf
") PointOnS2;
		const Extrema_POnSurf & PointOnS2();

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_GenLocateExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Extrema_GlobOptFuncCCC0 *
********************************/
class Extrema_GlobOptFuncCCC0 : public math_MultipleVarFunction {
	public:
		/****************** Extrema_GlobOptFuncCCC0 ******************/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC0;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve

Returns
-------
None
") Extrema_GlobOptFuncCCC0;
		 Extrema_GlobOptFuncCCC0(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2);

		/****************** Extrema_GlobOptFuncCCC0 ******************/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC0;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d

Returns
-------
None
") Extrema_GlobOptFuncCCC0;
		 Extrema_GlobOptFuncCCC0(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector

Returns
-------
F: float
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

};


%extend Extrema_GlobOptFuncCCC0 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Extrema_GlobOptFuncCCC1 *
********************************/
class Extrema_GlobOptFuncCCC1 : public math_MultipleVarFunctionWithGradient {
	public:
		/****************** Extrema_GlobOptFuncCCC1 ******************/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC1;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve

Returns
-------
None
") Extrema_GlobOptFuncCCC1;
		 Extrema_GlobOptFuncCCC1(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2);

		/****************** Extrema_GlobOptFuncCCC1 ******************/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC1;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d

Returns
-------
None
") Extrema_GlobOptFuncCCC1;
		 Extrema_GlobOptFuncCCC1(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2);

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
bool
") Gradient;
		virtual Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector

Returns
-------
F: float
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
F: float
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

};


%extend Extrema_GlobOptFuncCCC1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Extrema_GlobOptFuncCCC2 *
********************************/
class Extrema_GlobOptFuncCCC2 : public math_MultipleVarFunctionWithHessian {
	public:
		/****************** Extrema_GlobOptFuncCCC2 ******************/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC2;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve

Returns
-------
None
") Extrema_GlobOptFuncCCC2;
		 Extrema_GlobOptFuncCCC2(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2);

		/****************** Extrema_GlobOptFuncCCC2 ******************/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC2;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d

Returns
-------
None
") Extrema_GlobOptFuncCCC2;
		 Extrema_GlobOptFuncCCC2(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2);

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
bool
") Gradient;
		virtual Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector

Returns
-------
F: float
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
F: float
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
G: math_Vector
H: math_Matrix

Returns
-------
F: float
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G, math_Matrix & H);

};


%extend Extrema_GlobOptFuncCCC2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Extrema_GlobOptFuncCS *
******************************/
class Extrema_GlobOptFuncCS : public math_MultipleVarFunctionWithHessian {
	public:
		/****************** Extrema_GlobOptFuncCS ******************/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCS;
		%feature("autodoc", "Curve and surface should exist during all the lifetime of extrema_globoptfunccs.

Parameters
----------
C: Adaptor3d_Curve *
S: Adaptor3d_Surface *

Returns
-------
None
") Extrema_GlobOptFuncCS;
		 Extrema_GlobOptFuncCS(const Adaptor3d_Curve * C, const Adaptor3d_Surface * S);

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "No available documentation.

Parameters
----------
theX: math_Vector
theG: math_Vector

Returns
-------
bool
") Gradient;
		virtual Standard_Boolean Gradient(const math_Vector & theX, math_Vector & theG);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
theX: math_Vector

Returns
-------
theF: float
") Value;
		virtual Standard_Boolean Value(const math_Vector & theX, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
theX: math_Vector
theG: math_Vector

Returns
-------
theF: float
") Values;
		virtual Standard_Boolean Values(const math_Vector & theX, Standard_Real &OutValue, math_Vector & theG);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
theX: math_Vector
theG: math_Vector
theH: math_Matrix

Returns
-------
theF: float
") Values;
		virtual Standard_Boolean Values(const math_Vector & theX, Standard_Real &OutValue, math_Vector & theG, math_Matrix & theH);

};


%extend Extrema_GlobOptFuncCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Extrema_LocECC *
***********************/
class Extrema_LocECC {
	public:
		/****************** Extrema_LocECC ******************/
		%feature("compactdefaultargs") Extrema_LocECC;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by a parameter value on each curve. the function f(u,v)=distance(c1(u),c2(v)) has an extremun when gradient(f)=0. the algorithm searchs the zero near the close point.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
U0: float
V0: float
TolU: float
TolV: float

Returns
-------
None
") Extrema_LocECC;
		 Extrema_LocECC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real U0, const Standard_Real V0, const Standard_Real TolU, const Standard_Real TolV);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the points of the extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Returns
-------
None
") Point;
		void Point(Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_LocECC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_LocECC2d *
*************************/
class Extrema_LocECC2d {
	public:
		/****************** Extrema_LocECC2d ******************/
		%feature("compactdefaultargs") Extrema_LocECC2d;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by a parameter value on each curve. the function f(u,v)=distance(c1(u),c2(v)) has an extremun when gradient(f)=0. the algorithm searchs the zero near the close point.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
U0: float
V0: float
TolU: float
TolV: float

Returns
-------
None
") Extrema_LocECC2d;
		 Extrema_LocECC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real U0, const Standard_Real V0, const Standard_Real TolU, const Standard_Real TolV);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the points of the extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Returns
-------
None
") Point;
		void Point(Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_LocECC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Extrema_LocEPCOfLocateExtPC *
************************************/
class Extrema_LocEPCOfLocateExtPC {
	public:
		/****************** Extrema_LocEPCOfLocateExtPC ******************/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC();

		/****************** Extrema_LocEPCOfLocateExtPC ******************/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. tolu is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolu.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
U0: float
TolU: float

Returns
-------
None
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real U0, const Standard_Real TolU);

		/****************** Extrema_LocEPCOfLocateExtPC ******************/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. zeros are searched between umin et usup. tolu is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolu.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
U0: float
Umin: float
Usup: float
TolU: float

Returns
-------
None
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve
Umin: float
Usup: float
TolU: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the extremum distance is a minimum.

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt
U0: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const Standard_Real U0);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the extremum distance.

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point();

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_LocEPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class Extrema_LocEPCOfLocateExtPC2d *
**************************************/
class Extrema_LocEPCOfLocateExtPC2d {
	public:
		/****************** Extrema_LocEPCOfLocateExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d();

		/****************** Extrema_LocEPCOfLocateExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC2d;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. tolu is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolu.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
U0: float
TolU: float

Returns
-------
None
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real TolU);

		/****************** Extrema_LocEPCOfLocateExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC2d;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. zeros are searched between umin et usup. tolu is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolu.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
U0: float
Umin: float
Usup: float
TolU: float

Returns
-------
None
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
Umin: float
Usup: float
TolU: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the extremum distance is a minimum.

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt2d
U0: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P, const Standard_Real U0);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the extremum distance.

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point();

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_LocEPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Extrema_LocateExtCC *
****************************/
class Extrema_LocateExtCC {
	public:
		/****************** Extrema_LocateExtCC ******************/
		%feature("compactdefaultargs") Extrema_LocateExtCC;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by a parameter value on each curve. the function f(u,v)=distance(c1(u),c2(v)) has an extremun when gradient(f)=0. the algorithm searchs the zero near the close point.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
U0: float
V0: float

Returns
-------
None
") Extrema_LocateExtCC;
		 Extrema_LocateExtCC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real U0, const Standard_Real V0);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the points of the extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Returns
-------
None
") Point;
		void Point(Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_LocateExtCC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Extrema_LocateExtCC2d *
******************************/
class Extrema_LocateExtCC2d {
	public:
		/****************** Extrema_LocateExtCC2d ******************/
		%feature("compactdefaultargs") Extrema_LocateExtCC2d;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by a parameter value on each curve. the function f(u,v)=distance(c1(u),c2(v)) has an extremun when gradient(f)=0. the algorithm searchs the zero near the close point.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
U0: float
V0: float

Returns
-------
None
") Extrema_LocateExtCC2d;
		 Extrema_LocateExtCC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real U0, const Standard_Real V0);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the points of the extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Returns
-------
None
") Point;
		void Point(Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_LocateExtCC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Extrema_LocateExtPC *
****************************/
class Extrema_LocateExtPC {
	public:
		/****************** Extrema_LocateExtPC ******************/
		%feature("compactdefaultargs") Extrema_LocateExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC();

		/****************** Extrema_LocateExtPC ******************/
		%feature("compactdefaultargs") Extrema_LocateExtPC;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. tolf is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolf.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
U0: float
TolF: float

Returns
-------
None
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real U0, const Standard_Real TolF);

		/****************** Extrema_LocateExtPC ******************/
		%feature("compactdefaultargs") Extrema_LocateExtPC;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. zeros are searched between umin et usup. tolf is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolf.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
U0: float
Umin: float
Usup: float
TolF: float

Returns
-------
None
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolF);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve
Umin: float
Usup: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolF);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the extremum distance is a minimum.

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
U0: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const Standard_Real U0);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the extremum distance.

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point();

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_LocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Extrema_LocateExtPC2d *
******************************/
class Extrema_LocateExtPC2d {
	public:
		/****************** Extrema_LocateExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_LocateExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d();

		/****************** Extrema_LocateExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_LocateExtPC2d;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. tolf is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolf.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
U0: float
TolF: float

Returns
-------
None
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real TolF);

		/****************** Extrema_LocateExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_LocateExtPC2d;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. zeros are searched between umin et usup. tolf is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolf.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
U0: float
Umin: float
Usup: float
TolF: float

Returns
-------
None
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolF);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
Umin: float
Usup: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolF);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the extremum distance is a minimum.

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
U0: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P, const Standard_Real U0);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the extremum distance.

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point();

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_LocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class Extrema_PCFOfEPCOfELPCOfLocateExtPC *
********************************************/
class Extrema_PCFOfEPCOfELPCOfLocateExtPC : public math_FunctionWithDerivative {
	public:
		/****************** Extrema_PCFOfEPCOfELPCOfLocateExtPC ******************/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC();

		/****************** Extrema_PCFOfEPCOfELPCOfLocateExtPC ******************/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve

Returns
-------
None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Calculation of f'(u).

Parameters
----------
U: float

Returns
-------
DF: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mycurve of the function.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C);

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Shows if the nth distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****************** SearchOfTolerance ******************/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field p of the function.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt & P);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines boundaries of subinterval for find of root.

Parameters
----------
theUfirst: float
theUlast: float

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of f(u).

Parameters
----------
U: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of f(u) and f'(u).

Parameters
----------
U: float

Returns
-------
F: float
DF: float
") Values;
		Standard_Boolean Values(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Extrema_PCFOfEPCOfELPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class Extrema_PCFOfEPCOfELPCOfLocateExtPC2d *
**********************************************/
class Extrema_PCFOfEPCOfELPCOfLocateExtPC2d : public math_FunctionWithDerivative {
	public:
		/****************** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC2d();

		/****************** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d

Returns
-------
None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Calculation of f'(u).

Parameters
----------
U: float

Returns
-------
DF: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mycurve of the function.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Shows if the nth distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SearchOfTolerance ******************/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field p of the function.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt2d & P);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines boundaries of subinterval for find of root.

Parameters
----------
theUfirst: float
theUlast: float

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of f(u).

Parameters
----------
U: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of f(u) and f'(u).

Parameters
----------
U: float

Returns
-------
F: float
DF: float
") Values;
		Standard_Boolean Values(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Extrema_PCFOfEPCOfELPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Extrema_PCFOfEPCOfExtPC *
********************************/
class Extrema_PCFOfEPCOfExtPC : public math_FunctionWithDerivative {
	public:
		/****************** Extrema_PCFOfEPCOfExtPC ******************/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_PCFOfEPCOfExtPC;
		 Extrema_PCFOfEPCOfExtPC();

		/****************** Extrema_PCFOfEPCOfExtPC ******************/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve

Returns
-------
None
") Extrema_PCFOfEPCOfExtPC;
		 Extrema_PCFOfEPCOfExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Calculation of f'(u).

Parameters
----------
U: float

Returns
-------
DF: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mycurve of the function.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C);

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Shows if the nth distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****************** SearchOfTolerance ******************/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field p of the function.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt & P);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines boundaries of subinterval for find of root.

Parameters
----------
theUfirst: float
theUlast: float

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of f(u).

Parameters
----------
U: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of f(u) and f'(u).

Parameters
----------
U: float

Returns
-------
F: float
DF: float
") Values;
		Standard_Boolean Values(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Extrema_PCFOfEPCOfExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Extrema_PCFOfEPCOfExtPC2d *
**********************************/
class Extrema_PCFOfEPCOfExtPC2d : public math_FunctionWithDerivative {
	public:
		/****************** Extrema_PCFOfEPCOfExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_PCFOfEPCOfExtPC2d;
		 Extrema_PCFOfEPCOfExtPC2d();

		/****************** Extrema_PCFOfEPCOfExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d

Returns
-------
None
") Extrema_PCFOfEPCOfExtPC2d;
		 Extrema_PCFOfEPCOfExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Calculation of f'(u).

Parameters
----------
U: float

Returns
-------
DF: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mycurve of the function.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Shows if the nth distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SearchOfTolerance ******************/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field p of the function.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt2d & P);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines boundaries of subinterval for find of root.

Parameters
----------
theUfirst: float
theUlast: float

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of f(u).

Parameters
----------
U: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of f(u) and f'(u).

Parameters
----------
U: float

Returns
-------
F: float
DF: float
") Values;
		Standard_Boolean Values(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Extrema_PCFOfEPCOfExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class Extrema_PCLocFOfLocEPCOfLocateExtPC *
********************************************/
class Extrema_PCLocFOfLocEPCOfLocateExtPC : public math_FunctionWithDerivative {
	public:
		/****************** Extrema_PCLocFOfLocEPCOfLocateExtPC ******************/
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC();

		/****************** Extrema_PCLocFOfLocEPCOfLocateExtPC ******************/
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve

Returns
-------
None
") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Calculation of f'(u).

Parameters
----------
U: float

Returns
-------
DF: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mycurve of the function.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C);

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Shows if the nth distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****************** SearchOfTolerance ******************/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field p of the function.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt & P);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines boundaries of subinterval for find of root.

Parameters
----------
theUfirst: float
theUlast: float

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of f(u).

Parameters
----------
U: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of f(u) and f'(u).

Parameters
----------
U: float

Returns
-------
F: float
DF: float
") Values;
		Standard_Boolean Values(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Extrema_PCLocFOfLocEPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class Extrema_PCLocFOfLocEPCOfLocateExtPC2d *
**********************************************/
class Extrema_PCLocFOfLocEPCOfLocateExtPC2d : public math_FunctionWithDerivative {
	public:
		/****************** Extrema_PCLocFOfLocEPCOfLocateExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC2d();

		/****************** Extrema_PCLocFOfLocEPCOfLocateExtPC2d ******************/
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d

Returns
-------
None
") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Calculation of f'(u).

Parameters
----------
U: float

Returns
-------
DF: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mycurve of the function.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Shows if the nth distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SearchOfTolerance ******************/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field p of the function.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt2d & P);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines boundaries of subinterval for find of root.

Parameters
----------
theUfirst: float
theUlast: float

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of f(u).

Parameters
----------
U: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of f(u) and f'(u).

Parameters
----------
U: float

Returns
-------
F: float
DF: float
") Values;
		Standard_Boolean Values(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Extrema_PCLocFOfLocEPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_POnCurv *
************************/
class Extrema_POnCurv {
	public:
		/****************** Extrema_POnCurv ******************/
		%feature("compactdefaultargs") Extrema_POnCurv;
		%feature("autodoc", "Creation of an indefinite point on curve.

Returns
-------
None
") Extrema_POnCurv;
		 Extrema_POnCurv();

		/****************** Extrema_POnCurv ******************/
		%feature("compactdefaultargs") Extrema_POnCurv;
		%feature("autodoc", "Creation of a point on curve with a parameter value on the curve and a pnt from gp.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") Extrema_POnCurv;
		 Extrema_POnCurv(const Standard_Real U, const gp_Pnt & P);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter on the curve.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** SetValues ******************/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Sets the point and parameter values.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") SetValues;
		void SetValues(const Standard_Real U, const gp_Pnt & P);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

};


%extend Extrema_POnCurv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Extrema_POnCurv2d *
**************************/
class Extrema_POnCurv2d {
	public:
		/****************** Extrema_POnCurv2d ******************/
		%feature("compactdefaultargs") Extrema_POnCurv2d;
		%feature("autodoc", "Creation of an indefinite point on curve.

Returns
-------
None
") Extrema_POnCurv2d;
		 Extrema_POnCurv2d();

		/****************** Extrema_POnCurv2d ******************/
		%feature("compactdefaultargs") Extrema_POnCurv2d;
		%feature("autodoc", "Creation of a point on curve with a parameter value on the curve and a pnt from gp.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") Extrema_POnCurv2d;
		 Extrema_POnCurv2d(const Standard_Real U, const gp_Pnt2d & P);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter on the curve.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** SetValues ******************/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Sets the point and parameter values.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") SetValues;
		void SetValues(const Standard_Real U, const gp_Pnt2d & P);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point.

Returns
-------
gp_Pnt2d
") Value;
		const gp_Pnt2d Value();

};


%extend Extrema_POnCurv2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_POnSurf *
************************/
class Extrema_POnSurf {
	public:
		/****************** Extrema_POnSurf ******************/
		%feature("compactdefaultargs") Extrema_POnSurf;
		%feature("autodoc", "Creation of an indefinite point on surface.

Returns
-------
None
") Extrema_POnSurf;
		 Extrema_POnSurf();

		/****************** Extrema_POnSurf ******************/
		%feature("compactdefaultargs") Extrema_POnSurf;
		%feature("autodoc", "Creation of a point on surface with parameter values on the surface and a pnt from gp.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") Extrema_POnSurf;
		 Extrema_POnSurf(const Standard_Real U, const Standard_Real V, const gp_Pnt & P);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter values on the surface.

Parameters
----------

Returns
-------
U: float
V: float
") Parameter;
		void Parameter(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "Sets the params of current ponsurf instance. (e.g. to the point to be projected).

Parameters
----------
theU: float
theV: float
thePnt: gp_Pnt

Returns
-------
None
") SetParameters;
		void SetParameters(const Standard_Real theU, const Standard_Real theV, const gp_Pnt & thePnt);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the 3d point.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

};


%extend Extrema_POnSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Extrema_POnSurfParams *
******************************/
class Extrema_POnSurfParams : public Extrema_POnSurf {
	public:
		/****************** Extrema_POnSurfParams ******************/
		%feature("compactdefaultargs") Extrema_POnSurfParams;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Extrema_POnSurfParams;
		 Extrema_POnSurfParams();

		/****************** Extrema_POnSurfParams ******************/
		%feature("compactdefaultargs") Extrema_POnSurfParams;
		%feature("autodoc", "Creation of a point on surface with parameter values on the surface and a pnt from gp.

Parameters
----------
theU: float
theV: float
thePnt: gp_Pnt

Returns
-------
None
") Extrema_POnSurfParams;
		 Extrema_POnSurfParams(const Standard_Real theU, const Standard_Real theV, const gp_Pnt & thePnt);

		/****************** GetElementType ******************/
		%feature("compactdefaultargs") GetElementType;
		%feature("autodoc", "Query the element type on which this point is situated.

Returns
-------
Extrema_ElementType
") GetElementType;
		Extrema_ElementType GetElementType();

		/****************** GetIndices ******************/
		%feature("compactdefaultargs") GetIndices;
		%feature("autodoc", "Query the u and v indices of an element that contains this point.

Parameters
----------

Returns
-------
theIndexU: int
theIndexV: int
") GetIndices;
		void GetIndices(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetSqrDistance ******************/
		%feature("compactdefaultargs") GetSqrDistance;
		%feature("autodoc", "Query the square distance from this point to another one.

Returns
-------
float
") GetSqrDistance;
		Standard_Real GetSqrDistance();

		/****************** SetElementType ******************/
		%feature("compactdefaultargs") SetElementType;
		%feature("autodoc", "Sets the element type on which this point is situated.

Parameters
----------
theElementType: Extrema_ElementType

Returns
-------
None
") SetElementType;
		void SetElementType(const Extrema_ElementType theElementType);

		/****************** SetIndices ******************/
		%feature("compactdefaultargs") SetIndices;
		%feature("autodoc", "Sets the u and v indices of an element that contains this point.

Parameters
----------
theIndexU: int
theIndexV: int

Returns
-------
None
") SetIndices;
		void SetIndices(const Standard_Integer theIndexU, const Standard_Integer theIndexV);

		/****************** SetSqrDistance ******************/
		%feature("compactdefaultargs") SetSqrDistance;
		%feature("autodoc", "Sets the square distance from this point to another one (e.g. to the point to be projected).

Parameters
----------
theSqrDistance: float

Returns
-------
None
") SetSqrDistance;
		void SetSqrDistance(const Standard_Real theSqrDistance);

};


%extend Extrema_POnSurfParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class Extrema_HArray1OfPOnSurf : public Extrema_Array1OfPOnSurf, public Standard_Transient {
  public:
    Extrema_HArray1OfPOnSurf(const Standard_Integer theLower, const Standard_Integer theUpper);
    Extrema_HArray1OfPOnSurf(const Standard_Integer theLower, const Standard_Integer theUpper, const Extrema_Array1OfPOnSurf::value_type& theValue);
    Extrema_HArray1OfPOnSurf(const Extrema_Array1OfPOnSurf& theOther);
    const Extrema_Array1OfPOnSurf& Array1();
    Extrema_Array1OfPOnSurf& ChangeArray1();
};
%make_alias(Extrema_HArray1OfPOnSurf)


class Extrema_HArray1OfPOnCurv : public Extrema_Array1OfPOnCurv, public Standard_Transient {
  public:
    Extrema_HArray1OfPOnCurv(const Standard_Integer theLower, const Standard_Integer theUpper);
    Extrema_HArray1OfPOnCurv(const Standard_Integer theLower, const Standard_Integer theUpper, const Extrema_Array1OfPOnCurv::value_type& theValue);
    Extrema_HArray1OfPOnCurv(const Extrema_Array1OfPOnCurv& theOther);
    const Extrema_Array1OfPOnCurv& Array1();
    Extrema_Array1OfPOnCurv& ChangeArray1();
};
%make_alias(Extrema_HArray1OfPOnCurv)


class Extrema_HArray1OfPOnCurv2d : public Extrema_Array1OfPOnCurv2d, public Standard_Transient {
  public:
    Extrema_HArray1OfPOnCurv2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    Extrema_HArray1OfPOnCurv2d(const Standard_Integer theLower, const Standard_Integer theUpper, const Extrema_Array1OfPOnCurv2d::value_type& theValue);
    Extrema_HArray1OfPOnCurv2d(const Extrema_Array1OfPOnCurv2d& theOther);
    const Extrema_Array1OfPOnCurv2d& Array1();
    Extrema_Array1OfPOnCurv2d& ChangeArray1();
};
%make_alias(Extrema_HArray1OfPOnCurv2d)

/* harray2 classes */
class Extrema_HArray2OfPOnCurv2d : public Extrema_Array2OfPOnCurv2d, public Standard_Transient {
  public:
    Extrema_HArray2OfPOnCurv2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    Extrema_HArray2OfPOnCurv2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const Extrema_Array2OfPOnCurv2d::value_type& theValue);
    Extrema_HArray2OfPOnCurv2d(const Extrema_Array2OfPOnCurv2d& theOther);
    const Extrema_Array2OfPOnCurv2d& Array2 ();
    Extrema_Array2OfPOnCurv2d& ChangeArray2 (); 
};
%make_alias(Extrema_HArray2OfPOnCurv2d)


class Extrema_HArray2OfPOnCurv : public Extrema_Array2OfPOnCurv, public Standard_Transient {
  public:
    Extrema_HArray2OfPOnCurv(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    Extrema_HArray2OfPOnCurv(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const Extrema_Array2OfPOnCurv::value_type& theValue);
    Extrema_HArray2OfPOnCurv(const Extrema_Array2OfPOnCurv& theOther);
    const Extrema_Array2OfPOnCurv& Array2 ();
    Extrema_Array2OfPOnCurv& ChangeArray2 (); 
};
%make_alias(Extrema_HArray2OfPOnCurv)


class Extrema_HArray2OfPOnSurf : public Extrema_Array2OfPOnSurf, public Standard_Transient {
  public:
    Extrema_HArray2OfPOnSurf(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    Extrema_HArray2OfPOnSurf(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const Extrema_Array2OfPOnSurf::value_type& theValue);
    Extrema_HArray2OfPOnSurf(const Extrema_Array2OfPOnSurf& theOther);
    const Extrema_Array2OfPOnSurf& Array2 ();
    Extrema_Array2OfPOnSurf& ChangeArray2 (); 
};
%make_alias(Extrema_HArray2OfPOnSurf)


class Extrema_HArray2OfPOnSurfParams : public Extrema_Array2OfPOnSurfParams, public Standard_Transient {
  public:
    Extrema_HArray2OfPOnSurfParams(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    Extrema_HArray2OfPOnSurfParams(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const Extrema_Array2OfPOnSurfParams::value_type& theValue);
    Extrema_HArray2OfPOnSurfParams(const Extrema_Array2OfPOnSurfParams& theOther);
    const Extrema_Array2OfPOnSurfParams& Array2 ();
    Extrema_Array2OfPOnSurfParams& ChangeArray2 (); 
};
%make_alias(Extrema_HArray2OfPOnSurfParams)


/* hsequence classes */
