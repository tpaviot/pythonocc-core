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
%define INTPATCHDOCSTRING
"IntPatch module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_intpatch.html"
%enddef
%module (package="OCC.Core", docstring=INTPATCHDOCSTRING) IntPatch


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
#include<IntPatch_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Intf_module.hxx>
#include<Adaptor3d_module.hxx>
#include<math_module.hxx>
#include<Adaptor2d_module.hxx>
#include<gp_module.hxx>
#include<IntSurf_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
#include<IntAna_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Intf.i
%import Adaptor3d.i
%import math.i
%import Adaptor2d.i
%import gp.i
%import IntSurf.i
%import Geom2d.i
%import GeomAbs.i
%import TColStd.i
%import Bnd.i
%import IntAna.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum IntPatch_SpecPntType {
	IntPatch_SPntNone = 0,
	IntPatch_SPntSeamU = 1,
	IntPatch_SPntSeamV = 2,
	IntPatch_SPntSeamUV = 3,
	IntPatch_SPntPoleSeamU = 4,
	IntPatch_SPntPole = 5,
};

enum IntPatch_IType {
	IntPatch_Lin = 0,
	IntPatch_Circle = 1,
	IntPatch_Ellipse = 2,
	IntPatch_Parabola = 3,
	IntPatch_Hyperbola = 4,
	IntPatch_Analytic = 5,
	IntPatch_Walking = 6,
	IntPatch_Restriction = 7,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class IntPatch_SpecPntType(IntEnum):
	IntPatch_SPntNone = 0
	IntPatch_SPntSeamU = 1
	IntPatch_SPntSeamV = 2
	IntPatch_SPntSeamUV = 3
	IntPatch_SPntPoleSeamU = 4
	IntPatch_SPntPole = 5
IntPatch_SPntNone = IntPatch_SpecPntType.IntPatch_SPntNone
IntPatch_SPntSeamU = IntPatch_SpecPntType.IntPatch_SPntSeamU
IntPatch_SPntSeamV = IntPatch_SpecPntType.IntPatch_SPntSeamV
IntPatch_SPntSeamUV = IntPatch_SpecPntType.IntPatch_SPntSeamUV
IntPatch_SPntPoleSeamU = IntPatch_SpecPntType.IntPatch_SPntPoleSeamU
IntPatch_SPntPole = IntPatch_SpecPntType.IntPatch_SPntPole

class IntPatch_IType(IntEnum):
	IntPatch_Lin = 0
	IntPatch_Circle = 1
	IntPatch_Ellipse = 2
	IntPatch_Parabola = 3
	IntPatch_Hyperbola = 4
	IntPatch_Analytic = 5
	IntPatch_Walking = 6
	IntPatch_Restriction = 7
IntPatch_Lin = IntPatch_IType.IntPatch_Lin
IntPatch_Circle = IntPatch_IType.IntPatch_Circle
IntPatch_Ellipse = IntPatch_IType.IntPatch_Ellipse
IntPatch_Parabola = IntPatch_IType.IntPatch_Parabola
IntPatch_Hyperbola = IntPatch_IType.IntPatch_Hyperbola
IntPatch_Analytic = IntPatch_IType.IntPatch_Analytic
IntPatch_Walking = IntPatch_IType.IntPatch_Walking
IntPatch_Restriction = IntPatch_IType.IntPatch_Restriction
};
/* end python proxy for enums */

/* handles */
%wrap_handle(IntPatch_Line)
%wrap_handle(IntPatch_TheIWLineOfTheIWalking)
%wrap_handle(IntPatch_ALine)
%wrap_handle(IntPatch_GLine)
%wrap_handle(IntPatch_PointLine)
%wrap_handle(IntPatch_RLine)
%wrap_handle(IntPatch_WLine)
/* end handles declaration */

/* templates */
%template(IntPatch_SequenceOfIWLineOfTheIWalking) NCollection_Sequence<opencascade::handle<IntPatch_TheIWLineOfTheIWalking>>;

%extend NCollection_Sequence<opencascade::handle<IntPatch_TheIWLineOfTheIWalking>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntPatch_SequenceOfLine) NCollection_Sequence<opencascade::handle<IntPatch_Line>>;

%extend NCollection_Sequence<opencascade::handle<IntPatch_Line>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntPatch_SequenceOfPathPointOfTheSOnBounds) NCollection_Sequence<IntPatch_ThePathPointOfTheSOnBounds>;

%extend NCollection_Sequence<IntPatch_ThePathPointOfTheSOnBounds> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntPatch_SequenceOfPoint) NCollection_Sequence<IntPatch_Point>;

%extend NCollection_Sequence<IntPatch_Point> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntPatch_SequenceOfSegmentOfTheSOnBounds) NCollection_Sequence<IntPatch_TheSegmentOfTheSOnBounds>;

%extend NCollection_Sequence<IntPatch_TheSegmentOfTheSOnBounds> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef Intf_InterferencePolygon2d IntPatch_SearchPnt;
typedef NCollection_Sequence<opencascade::handle<IntPatch_TheIWLineOfTheIWalking>> IntPatch_SequenceOfIWLineOfTheIWalking;
typedef NCollection_Sequence<opencascade::handle<IntPatch_Line>> IntPatch_SequenceOfLine;
typedef NCollection_Sequence<IntPatch_ThePathPointOfTheSOnBounds> IntPatch_SequenceOfPathPointOfTheSOnBounds;
typedef NCollection_Sequence<IntPatch_Point> IntPatch_SequenceOfPoint;
typedef NCollection_Sequence<IntPatch_TheSegmentOfTheSOnBounds> IntPatch_SequenceOfSegmentOfTheSOnBounds;
/* end typedefs declaration */

/******************************
* class IntPatch_ALineToWLine *
******************************/
class IntPatch_ALineToWLine {
	public:
		/****************** IntPatch_ALineToWLine ******************/
		/**** md5 signature: 477cc3fd330252da9e528955dfe46d84 ****/
		%feature("compactdefaultargs") IntPatch_ALineToWLine;
		%feature("autodoc", "Constructor.

Parameters
----------
theS1: Adaptor3d_HSurface
theS2: Adaptor3d_HSurface
theNbPoints: int,optional
	default value is 200

Returns
-------
None
") IntPatch_ALineToWLine;
		 IntPatch_ALineToWLine(const opencascade::handle<Adaptor3d_HSurface> & theS1, const opencascade::handle<Adaptor3d_HSurface> & theS2, const Standard_Integer theNbPoints = 200);

		/****************** MakeWLine ******************/
		/**** md5 signature: 6b47b07a444cb68ac061bd9dc0d6098b ****/
		%feature("compactdefaultargs") MakeWLine;
		%feature("autodoc", "Converts aline to the set of walking-lines and adds them in thelines.

Parameters
----------
aline: IntPatch_ALine
theLines: IntPatch_SequenceOfLine

Returns
-------
None
") MakeWLine;
		void MakeWLine(const opencascade::handle<IntPatch_ALine> & aline, IntPatch_SequenceOfLine & theLines);

		/****************** MakeWLine ******************/
		/**** md5 signature: 10f46e5d7e2085cbf19dde3ab0e3d1d7 ****/
		%feature("compactdefaultargs") MakeWLine;
		%feature("autodoc", "Converts aline (limitted by paraminf and paramsup) to the set of walking-lines and adds them in thelines.

Parameters
----------
aline: IntPatch_ALine
paraminf: float
paramsup: float
theLines: IntPatch_SequenceOfLine

Returns
-------
None
") MakeWLine;
		void MakeWLine(const opencascade::handle<IntPatch_ALine> & aline, const Standard_Real paraminf, const Standard_Real paramsup, IntPatch_SequenceOfLine & theLines);

		/****************** SetTol3D ******************/
		/**** md5 signature: 880c2e2c72950aa6453ef901b91f71f5 ****/
		%feature("compactdefaultargs") SetTol3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
aT: float

Returns
-------
None
") SetTol3D;
		void SetTol3D(const Standard_Real aT);

		/****************** SetTolOpenDomain ******************/
		/**** md5 signature: aa60c72e6f01340a2ea156680d570064 ****/
		%feature("compactdefaultargs") SetTolOpenDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
aT: float

Returns
-------
None
") SetTolOpenDomain;
		void SetTolOpenDomain(const Standard_Real aT);

		/****************** SetTolTransition ******************/
		/**** md5 signature: f8660409573cc8eb24509f9765e262c9 ****/
		%feature("compactdefaultargs") SetTolTransition;
		%feature("autodoc", "No available documentation.

Parameters
----------
aT: float

Returns
-------
None
") SetTolTransition;
		void SetTolTransition(const Standard_Real aT);

		/****************** Tol3D ******************/
		/**** md5 signature: 0c721fa385f74a0241e7db7704f9176b ****/
		%feature("compactdefaultargs") Tol3D;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tol3D;
		Standard_Real Tol3D();

		/****************** TolOpenDomain ******************/
		/**** md5 signature: 12e25334e78796bee366d6bf308a8b84 ****/
		%feature("compactdefaultargs") TolOpenDomain;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TolOpenDomain;
		Standard_Real TolOpenDomain();

		/****************** TolTransition ******************/
		/**** md5 signature: d6465ab9e0260f5ae5ec775eca328745 ****/
		%feature("compactdefaultargs") TolTransition;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TolTransition;
		Standard_Real TolTransition();

};


%extend IntPatch_ALineToWLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntPatch_ArcFunction *
*****************************/
class IntPatch_ArcFunction : public math_FunctionWithDerivative {
	public:
		/****************** IntPatch_ArcFunction ******************/
		/**** md5 signature: 3c48209a96a54328182da5862a3c6930 ****/
		%feature("compactdefaultargs") IntPatch_ArcFunction;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_ArcFunction;
		 IntPatch_ArcFunction();

		/****************** Arc ******************/
		/**** md5 signature: b2e2a2b000ebbda9cef9186aeead5385 ****/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc();

		/****************** Derivative ******************/
		/**** md5 signature: 99d758c6c475cdb086620552a67d08e7 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
D: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** LastComputedPoint ******************/
		/**** md5 signature: 151ab65e948ef31dff9bbbd66f058a30 ****/
		%feature("compactdefaultargs") LastComputedPoint;
		%feature("autodoc", "Returns the point, which has been computed while the last calling value() method.

Returns
-------
gp_Pnt
") LastComputedPoint;
		const gp_Pnt LastComputedPoint();

		/****************** NbSamples ******************/
		/**** md5 signature: 1e61299a12ab2ebed2590e1021ec4bae ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSamples;
		Standard_Integer NbSamples();

		/****************** Quadric ******************/
		/**** md5 signature: 412540fe449bd77bf89b8085f1fe1701 ****/
		%feature("compactdefaultargs") Quadric;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Quadric
") Quadric;
		const IntSurf_Quadric & Quadric();

		/****************** Set ******************/
		/**** md5 signature: 39b28571bbfbb9613c66992d83b4c72e ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** Set ******************/
		/**** md5 signature: c9230f42bb12d45a693a7ae3204732ab ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** SetQuadric ******************/
		/**** md5 signature: d5b0476ad1478596d5971650634ac6de ****/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "No available documentation.

Parameters
----------
Q: IntSurf_Quadric

Returns
-------
None
") SetQuadric;
		void SetQuadric(const IntSurf_Quadric & Q);

		/****************** Surface ******************/
		/**** md5 signature: 81999f08eca68bee259ba395fdac1a30 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") Surface;
		const opencascade::handle<Adaptor3d_HSurface> & Surface();

		/****************** Valpoint ******************/
		/**** md5 signature: 3a2ceb97db1e39a13d0a9061e49cb920 ****/
		%feature("compactdefaultargs") Valpoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") Valpoint;
		const gp_Pnt Valpoint(const Standard_Integer Index);

		/****************** Value ******************/
		/**** md5 signature: af675141386b20e819be1017ca5afac2 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: 3835d085291235e285cceabd6d1dd2b9 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
F: float
D: float
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend IntPatch_ArcFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IntPatch_CSFunction *
****************************/
class IntPatch_CSFunction : public math_FunctionSetWithDerivatives {
	public:
		/****************** IntPatch_CSFunction ******************/
		/**** md5 signature: 694bdc63f29d3dcde2199bbe422df2df ****/
		%feature("compactdefaultargs") IntPatch_CSFunction;
		%feature("autodoc", "S1 is the surface on which the intersection is searched. c is a curve on the surface s2.

Parameters
----------
S1: Adaptor3d_HSurface
C: Adaptor2d_HCurve2d
S2: Adaptor3d_HSurface

Returns
-------
None
") IntPatch_CSFunction;
		 IntPatch_CSFunction(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor2d_HCurve2d> & C, const opencascade::handle<Adaptor3d_HSurface> & S2);

		/****************** AuxillarCurve ******************/
		/**** md5 signature: 7e09159e35505ab62a9e65c6846deea3 ****/
		%feature("compactdefaultargs") AuxillarCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") AuxillarCurve;
		const opencascade::handle<Adaptor2d_HCurve2d> & AuxillarCurve();

		/****************** AuxillarSurface ******************/
		/**** md5 signature: eebc6d437c971dfbfb481a3fe1861466 ****/
		%feature("compactdefaultargs") AuxillarSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") AuxillarSurface;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface();

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Point ******************/
		/**** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

		/****************** Root ******************/
		/**** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ****/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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


%extend IntPatch_CSFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntPatch_CurvIntSurf *
*****************************/
class IntPatch_CurvIntSurf {
	public:
		/****************** IntPatch_CurvIntSurf ******************/
		/**** md5 signature: eee762a61380ee26870107a7d7083331 ****/
		%feature("compactdefaultargs") IntPatch_CurvIntSurf;
		%feature("autodoc", "Compute the solution point with the close point margincoef is the coefficient for extension of uv bounds. ex., ufirst -= margincoef*(ulast-ufirst).

Parameters
----------
U: float
V: float
W: float
F: IntPatch_CSFunction
TolTangency: float
MarginCoef: float,optional
	default value is 0.0

Returns
-------
None
") IntPatch_CurvIntSurf;
		 IntPatch_CurvIntSurf(const Standard_Real U, const Standard_Real V, const Standard_Real W, const IntPatch_CSFunction & F, const Standard_Real TolTangency, const Standard_Real MarginCoef = 0.0);

		/****************** IntPatch_CurvIntSurf ******************/
		/**** md5 signature: 3882a9005a40ad3530a606e0414e642e ****/
		%feature("compactdefaultargs") IntPatch_CurvIntSurf;
		%feature("autodoc", "Initialize the parameters to compute the solution.

Parameters
----------
F: IntPatch_CSFunction
TolTangency: float

Returns
-------
None
") IntPatch_CurvIntSurf;
		 IntPatch_CurvIntSurf(const IntPatch_CSFunction & F, const Standard_Real TolTangency);

		/****************** Function ******************/
		/**** md5 signature: 14b4caa41fcc22a8994bca1ef859d9cb ****/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return the math function which is used to compute the intersection.

Returns
-------
IntPatch_CSFunction
") Function;
		IntPatch_CSFunction & Function();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the creation completed without failure.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** ParameterOnCurve ******************/
		/**** md5 signature: ac81682b4b1f0988f8f73835e37144bf ****/
		%feature("compactdefaultargs") ParameterOnCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnCurve;
		Standard_Real ParameterOnCurve();

		/****************** ParameterOnSurface ******************/
		/**** md5 signature: b1ff2b42bc6096157075c8f0a6c1b6a5 ****/
		%feature("compactdefaultargs") ParameterOnSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
U: float
V: float
") ParameterOnSurface;
		void ParameterOnSurface(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: 193bc13b7dd6d13fbf6a72a44d7ddd7b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute the solution it's possible to write to optimize: intimp_intcs inter(s1,c1,toltangency) math_functionsetroot rsnld(inter.function()) while ...{ u=... v=... w=... inter.perform(u,v,w,rsnld) } or intimp_intcs inter(toltangency) inter.setsurface(s); math_functionsetroot rsnld(inter.function()) while ...{ c=... inter.setcurve(c); u=... v=... w=... inter.perform(u,v,w,rsnld) }.

Parameters
----------
U: float
V: float
W: float
Rsnld: math_FunctionSetRoot
u0: float
v0: float
u1: float
v1: float
w0: float
w1: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Real U, const Standard_Real V, const Standard_Real W, math_FunctionSetRoot & Rsnld, const Standard_Real u0, const Standard_Real v0, const Standard_Real u1, const Standard_Real v1, const Standard_Real w0, const Standard_Real w1);

		/****************** Point ******************/
		/**** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point the exception notdone is raised if isdone is false. the exception domainerror is raised if isempty is true.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

};


%extend IntPatch_CurvIntSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IntPatch_HCurve2dTool *
******************************/
class IntPatch_HCurve2dTool {
	public:
		/****************** BSpline ******************/
		/**** md5 signature: 51c6af526482fdefe22b195f9e7f642b ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Bezier ******************/
		/**** md5 signature: f3f25a1b425466642d5538101f636952 ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Circle ******************/
		/**** md5 signature: 25cca94b6abda39a58f3572d7e1269e1 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Circ2d
") Circle;
		static gp_Circ2d Circle(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Continuity ******************/
		/**** md5 signature: c3f4e05ac1409417c3a49b2ba86768c1 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** D0 ******************/
		/**** md5 signature: 46487cddba3993af60eac47b2d9fb4ec ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		static void D0(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 47f0ee388b0110afd0acc19f4f31143b ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		/**** md5 signature: 67bd4dfba43285ed3ba3fa4db342511d ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: a12143246ff3c675c374e091b8bb4126 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		static void D3(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: b51d40fcc387fcff2c771e816a837a26 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		static gp_Vec2d DN(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, const Standard_Integer N);

		/****************** Ellipse ******************/
		/**** md5 signature: f3a29109984a1143a6cb5514fa451f90 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** FirstParameter ******************/
		/**** md5 signature: eaf98bddee98d43872dfec9b2cd68150 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** GetType ******************/
		/**** md5 signature: ec77b3306d37c7299568c0a36686922d ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Hyperbola ******************/
		/**** md5 signature: 164051c7a5f0ff11dadb1050a2b5196c ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Intervals ******************/
		/**** md5 signature: 3b05031b8de1688bfd3ab21d174798f0 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
C: Adaptor2d_HCurve2d
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		static void Intervals(const opencascade::handle<Adaptor2d_HCurve2d> & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: 0e22a421e5652f2d44cc8cf1dd94b7c3 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** IsPeriodic ******************/
		/**** md5 signature: 4aba8b2dd73d6a9faa95857fea2fa1c8 ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** LastParameter ******************/
		/**** md5 signature: c7ee808a0daf7f6c32882e5c11459a8d ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Line ******************/
		/**** md5 signature: 5add7292d5bf7b9e27a7ab736f1e7435 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Lin2d
") Line;
		static gp_Lin2d Line(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** NbIntervals ******************/
		/**** md5 signature: 042b8a87b181044ce642f6e33059fda9 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(myclass) >= <s>.

Parameters
----------
C: Adaptor2d_HCurve2d
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		static Standard_Integer NbIntervals(const opencascade::handle<Adaptor2d_HCurve2d> & C, const GeomAbs_Shape S);

		/****************** NbSamples ******************/
		/**** md5 signature: 9c572bc378ed84a8420fac29109ee0cc ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d
U0: float
U1: float

Returns
-------
int
") NbSamples;
		static Standard_Integer NbSamples(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U0, const Standard_Real U1);

		/****************** Parabola ******************/
		/**** md5 signature: aa68878e794db72dae1959cec7bf2f61 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Period ******************/
		/**** md5 signature: 7aa66d879cd9e56bcd3f2e6f17863699 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
float
") Period;
		static Standard_Real Period(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Resolution ******************/
		/**** md5 signature: 76c8a3dbf7f89f06f48d44960220ce20 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
C: Adaptor2d_HCurve2d
R3d: float

Returns
-------
float
") Resolution;
		static Standard_Real Resolution(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real R3d);

		/****************** Value ******************/
		/**** md5 signature: ca7870ae23348f83eb576a5911436760 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float

Returns
-------
gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U);

};


%extend IntPatch_HCurve2dTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IntPatch_HInterTool *
****************************/
class IntPatch_HInterTool {
	public:
		/****************** IntPatch_HInterTool ******************/
		/**** md5 signature: a36982be4506681216df42cd27bbd921 ****/
		%feature("compactdefaultargs") IntPatch_HInterTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_HInterTool;
		 IntPatch_HInterTool();

		/****************** Bounds ******************/
		/**** md5 signature: 9d7011a3f7bf9140e97d4cca3a13d459 ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric limits on the arc c. these limits must be finite : they are either the real limits of the arc, for a finite arc, or a bounding box for an infinite arc.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
Ufirst: float
Ulast: float
") Bounds;
		static void Bounds(const opencascade::handle<Adaptor2d_HCurve2d> & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** HasBeenSeen ******************/
		/**** md5 signature: c459516f806b782c6912d96e17f167c2 ****/
		%feature("compactdefaultargs") HasBeenSeen;
		%feature("autodoc", "Returns true if all the intersection point and edges are known on the arc. the intersection point are given as vertices. the intersection edges are given as intervals between two vertices.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
bool
") HasBeenSeen;
		static Standard_Boolean HasBeenSeen(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** HasFirstPoint ******************/
		/**** md5 signature: 21dbd03b2bfe6401a9ae58a73e3b9d1c ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true when the segment of range index is not open at the left side. in that case, indfirst is the range in the list intersection points (see nbpoints) of the one which defines the left bound of the segment. otherwise, the method has to return false, and indfirst has no meaning.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int

Returns
-------
IndFirst: int
") HasFirstPoint;
		static Standard_Boolean HasFirstPoint(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index, Standard_Integer &OutValue);

		/****************** HasLastPoint ******************/
		/**** md5 signature: a4dadcf8bd34f0f89f5ae609438fa233 ****/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true when the segment of range index is not open at the right side. in that case, indlast is the range in the list intersection points (see nbpoints) of the one which defines the right bound of the segment. otherwise, the method has to return false, and indlast has no meaning.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int

Returns
-------
IndLast: int
") HasLastPoint;
		static Standard_Boolean HasLastPoint(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index, Standard_Integer &OutValue);

		/****************** IsAllSolution ******************/
		/**** md5 signature: 0c6c1768ff2598386bae6ed220465e90 ****/
		%feature("compactdefaultargs") IsAllSolution;
		%feature("autodoc", "Returns true when the whole restriction is solution of the intersection problem.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
bool
") IsAllSolution;
		static Standard_Boolean IsAllSolution(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** IsVertex ******************/
		/**** md5 signature: be51c8dbf9d3585b6d3eab81b6b976ce ****/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Returns true if the intersection point of range index corresponds with a vertex on the arc a.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int

Returns
-------
bool
") IsVertex;
		static Standard_Boolean IsVertex(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index);

		/****************** NbPoints ******************/
		/**** md5 signature: 17b706dc3883e4250f166019ea7dae25 ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of intersection points on the arc a.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
int
") NbPoints;
		static Standard_Integer NbPoints(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** NbSamplePoints ******************/
		/**** md5 signature: b2117c359ea392249089151a8353a788 ****/
		%feature("compactdefaultargs") NbSamplePoints;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
int
") NbSamplePoints;
		Standard_Integer NbSamplePoints(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** NbSamplesOnArc ******************/
		/**** md5 signature: 5d5251a65ac23da48e83da611222dcfc ****/
		%feature("compactdefaultargs") NbSamplesOnArc;
		%feature("autodoc", "Returns the number of points which is used to make a sample on the arc. this number is a function of the surface and the curveonsurface complexity.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
int
") NbSamplesOnArc;
		static Standard_Integer NbSamplesOnArc(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** NbSamplesU ******************/
		/**** md5 signature: 97232a7a843cb20e7362e1978825fb60 ****/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
u1: float
u2: float

Returns
-------
int
") NbSamplesU;
		static Standard_Integer NbSamplesU(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real u1, const Standard_Real u2);

		/****************** NbSamplesV ******************/
		/**** md5 signature: 3cd7a5ede88f3424fd1fcf0d55b10994 ****/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
v1: float
v2: float

Returns
-------
int
") NbSamplesV;
		static Standard_Integer NbSamplesV(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real v1, const Standard_Real v2);

		/****************** NbSegments ******************/
		/**** md5 signature: 0ae6c2f8194d2736e98ab44bdf7746bf ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of part of a solution of the of intersection problem.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
int
") NbSegments;
		static Standard_Integer NbSegments(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Parameter ******************/
		/**** md5 signature: 4bd4573724cb995d25117b32c6301dbf ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter of the vertex v on the arc a.

Parameters
----------
V: Adaptor3d_HVertex
C: Adaptor2d_HCurve2d

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Project ******************/
		/**** md5 signature: c906bf41c5c252a3dc2813aa763bf1d4 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "Projects the point p on the arc c. if the methods returns standard_true, the projection is successful, and paramproj is the parameter on the arc of the projected point, ptproj is the projected point. if the method returns standard_false, param proj and ptproj are not significant.

Parameters
----------
C: Adaptor2d_HCurve2d
P: gp_Pnt2d
Ptproj: gp_Pnt2d

Returns
-------
Paramproj: float
") Project;
		static Standard_Boolean Project(const opencascade::handle<Adaptor2d_HCurve2d> & C, const gp_Pnt2d & P, Standard_Real &OutValue, gp_Pnt2d & Ptproj);

		/****************** SamplePoint ******************/
		/**** md5 signature: f05ea8d395bc4d9fc498d71b738e3e67 ****/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
Index: int

Returns
-------
U: float
V: float
") SamplePoint;
		void SamplePoint(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SingularOnUMax ******************/
		/**** md5 signature: 8fa5e0f319821099d2a06e819c6a018a ****/
		%feature("compactdefaultargs") SingularOnUMax;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
bool
") SingularOnUMax;
		static Standard_Boolean SingularOnUMax(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** SingularOnUMin ******************/
		/**** md5 signature: 3dc2f725cee7fa53926efd3afcb116ec ****/
		%feature("compactdefaultargs") SingularOnUMin;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
bool
") SingularOnUMin;
		static Standard_Boolean SingularOnUMin(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** SingularOnVMax ******************/
		/**** md5 signature: 2722360f546bc165747c55a266707a6a ****/
		%feature("compactdefaultargs") SingularOnVMax;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
bool
") SingularOnVMax;
		static Standard_Boolean SingularOnVMax(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** SingularOnVMin ******************/
		/**** md5 signature: bf8d485c724c61494d35cc30ea1ad436 ****/
		%feature("compactdefaultargs") SingularOnVMin;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
bool
") SingularOnVMin;
		static Standard_Boolean SingularOnVMin(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Tolerance ******************/
		/**** md5 signature: 3a8783bb4f0487b28d64a7cbca026b23 ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the parametric tolerance used to consider that the vertex and another point meet, i-e if abs(parameter(vertex) - parameter(otherpnt))<= tolerance, the points are 'merged'.

Parameters
----------
V: Adaptor3d_HVertex
C: Adaptor2d_HCurve2d

Returns
-------
float
") Tolerance;
		static Standard_Real Tolerance(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Value ******************/
		/**** md5 signature: 18b3b6d81fbdc955a12ee74b07f30c25 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value (pt), the tolerance (tol), and the parameter (u) on the arc a , of the intersection point of range index.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int
Pt: gp_Pnt

Returns
-------
Tol: float
U: float
") Value;
		static void Value(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index, gp_Pnt & Pt, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Vertex ******************/
		/**** md5 signature: 6f27b126d27d77cd929cf0d82a6331b7 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "When isvertex returns true, this method returns the vertex on the arc a.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int
V: Adaptor3d_HVertex

Returns
-------
None
") Vertex;
		static void Vertex(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index, opencascade::handle<Adaptor3d_HVertex> & V);

};


%extend IntPatch_HInterTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IntPatch_ImpImpIntersection *
************************************/
class IntPatch_ImpImpIntersection {
	public:
/* public enums */
enum IntStatus {
	IntStatus_OK = 0,
	IntStatus_InfiniteSectionCurve = 1,
	IntStatus_Fail = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class IntStatus(IntEnum):
	IntStatus_OK = 0
	IntStatus_InfiniteSectionCurve = 1
	IntStatus_Fail = 2
IntStatus_OK = IntStatus.IntStatus_OK
IntStatus_InfiniteSectionCurve = IntStatus.IntStatus_InfiniteSectionCurve
IntStatus_Fail = IntStatus.IntStatus_Fail
};
/* end python proxy for enums */

		/****************** IntPatch_ImpImpIntersection ******************/
		/**** md5 signature: 7be4587ea1735d9431b285e164d246f4 ****/
		%feature("compactdefaultargs") IntPatch_ImpImpIntersection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_ImpImpIntersection;
		 IntPatch_ImpImpIntersection();

		/****************** IntPatch_ImpImpIntersection ******************/
		/**** md5 signature: d7d9807a8a807a779c98af6ca41313c4 ****/
		%feature("compactdefaultargs") IntPatch_ImpImpIntersection;
		%feature("autodoc", "Flag theisreqtokeeprline has been entered only for compatibility with topopebrep package. it shall be deleted after deleting topopebrep. when intersection result returns intpatch_rline and another intpatch_line (not restriction) we (in case of theisreqtokeeprline==true) will always keep both lines even if they are coincided.

Parameters
----------
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
theIsReqToKeepRLine: bool,optional
	default value is Standard_False

Returns
-------
None
") IntPatch_ImpImpIntersection;
		 IntPatch_ImpImpIntersection(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Boolean theIsReqToKeepRLine = Standard_False);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the calculus was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the is no intersection.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Line ******************/
		/**** md5 signature: 0f19f87d200154ef5932a127697b505b ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the line of range index. an exception is raised if index<=0 or index>nbline.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IntPatch_Line>
") Line;
		const opencascade::handle<IntPatch_Line> & Line(const Standard_Integer Index);

		/****************** NbLines ******************/
		/**** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ****/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the number of intersection lines.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NbPnts ******************/
		/**** md5 signature: 11421df812eef5f47a644a70b75ab60a ****/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Returns the number of 'single' points.

Returns
-------
int
") NbPnts;
		Standard_Integer NbPnts();

		/****************** OppositeFaces ******************/
		/**** md5 signature: 1103bf0485006c89d11ed86313182eb1 ****/
		%feature("compactdefaultargs") OppositeFaces;
		%feature("autodoc", "Returns true when the tangentfaces returns true and the normal vectors evaluated at a point on the first and the second surface are opposite. the exception domainerror is raised if tangentfaces returns false.

Returns
-------
bool
") OppositeFaces;
		Standard_Boolean OppositeFaces();

		/****************** Perform ******************/
		/**** md5 signature: 541ec0af12dc52d41f7dc37b22986970 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Flag theisreqtokeeprline has been entered only for compatibility with topopebrep package. it shall be deleted after deleting topopebrep. when intersection result returns intpatch_rline and another intpatch_line (not restriction) we (in case of theisreqtokeeprline==true) will always keep both lines even if they are coincided.

Parameters
----------
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
theIsReqToKeepRLine: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Boolean theIsReqToKeepRLine = Standard_False);

		/****************** Point ******************/
		/**** md5 signature: a380f33017a5aaa3320d09b1b9dc85e1 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of range index. an exception is raised if index<=0 or index>nbpnt.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") Point;
		const IntPatch_Point & Point(const Standard_Integer Index);

		/****************** TangentFaces ******************/
		/**** md5 signature: 1bd0aa400de87da796d429cdd88c31ea ****/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "Returns true if the two patches are considered as entirely tangent, i.e every restriction arc of one patch is inside the geometric base of the other patch.

Returns
-------
bool
") TangentFaces;
		Standard_Boolean TangentFaces();

};


%extend IntPatch_ImpImpIntersection {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def GetStatus(self):
		pass
	}
};

/************************************
* class IntPatch_ImpPrmIntersection *
************************************/
class IntPatch_ImpPrmIntersection {
	public:
		/****************** IntPatch_ImpPrmIntersection ******************/
		/**** md5 signature: f4cbcc97498f2df01053a929c676a290 ****/
		%feature("compactdefaultargs") IntPatch_ImpPrmIntersection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_ImpPrmIntersection;
		 IntPatch_ImpPrmIntersection();

		/****************** IntPatch_ImpPrmIntersection ******************/
		/**** md5 signature: 1f7dcf87ec31ff53927ccda395499ce2 ****/
		%feature("compactdefaultargs") IntPatch_ImpPrmIntersection;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
Surf2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
Fleche: float
Pas: float

Returns
-------
None
") IntPatch_ImpPrmIntersection;
		 IntPatch_ImpPrmIntersection(const opencascade::handle<Adaptor3d_HSurface> & Surf1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & Surf2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Real Fleche, const Standard_Real Pas);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the calculus was succesfull.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the is no intersection.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Line ******************/
		/**** md5 signature: 0f19f87d200154ef5932a127697b505b ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the line of range index. an exception is raised if index<=0 or index>nbline.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IntPatch_Line>
") Line;
		const opencascade::handle<IntPatch_Line> & Line(const Standard_Integer Index);

		/****************** NbLines ******************/
		/**** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ****/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the number of intersection lines.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NbPnts ******************/
		/**** md5 signature: 11421df812eef5f47a644a70b75ab60a ****/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Returns the number of 'single' points.

Returns
-------
int
") NbPnts;
		Standard_Integer NbPnts();

		/****************** Perform ******************/
		/**** md5 signature: 3845fafb392932a68d032618a76acc4f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
Surf2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
Fleche: float
Pas: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Surf1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & Surf2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Real Fleche, const Standard_Real Pas);

		/****************** Point ******************/
		/**** md5 signature: a380f33017a5aaa3320d09b1b9dc85e1 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of range index. an exception is raised if index<=0 or index>nbpnt.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") Point;
		const IntPatch_Point & Point(const Standard_Integer Index);

		/****************** SetStartPoint ******************/
		/**** md5 signature: 2f7695fecc55d8936b3b12959027e262 ****/
		%feature("compactdefaultargs") SetStartPoint;
		%feature("autodoc", "To search for solution from the given point.

Parameters
----------
U: float
V: float

Returns
-------
None
") SetStartPoint;
		void SetStartPoint(const Standard_Real U, const Standard_Real V);

};


%extend IntPatch_ImpPrmIntersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IntPatch_InterferencePolyhedron *
****************************************/
class IntPatch_InterferencePolyhedron : public Intf_Interference {
	public:
		/****************** IntPatch_InterferencePolyhedron ******************/
		/**** md5 signature: bcee18160a018abbc7ca10edfe73faa4 ****/
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "Constructs an empty interference of polyhedron.

Returns
-------
None
") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron();

		/****************** IntPatch_InterferencePolyhedron ******************/
		/**** md5 signature: ed21209d5e9fc41ef785686ba9b5f4bb ****/
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "Constructs and computes an interference between the two polyhedra.

Parameters
----------
Obje1: IntPatch_Polyhedron
Obje2: IntPatch_Polyhedron

Returns
-------
None
") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron(const IntPatch_Polyhedron & Obje1, const IntPatch_Polyhedron & Obje2);

		/****************** IntPatch_InterferencePolyhedron ******************/
		/**** md5 signature: 89cc662e47a55daf2f93f54136eca955 ****/
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "Constructs and computes the self interference of a polyhedron.

Parameters
----------
Obje: IntPatch_Polyhedron

Returns
-------
None
") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron(const IntPatch_Polyhedron & Obje);

		/****************** Perform ******************/
		/**** md5 signature: d26a979a3b5dc9db5e86d919e93c0744 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the interference between the two polyhedra.

Parameters
----------
Obje1: IntPatch_Polyhedron
Obje2: IntPatch_Polyhedron

Returns
-------
None
") Perform;
		void Perform(const IntPatch_Polyhedron & Obje1, const IntPatch_Polyhedron & Obje2);

		/****************** Perform ******************/
		/**** md5 signature: 6767f6104458aca7d72b27f1876ffecf ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the self interference of a polyhedron.

Parameters
----------
Obje: IntPatch_Polyhedron

Returns
-------
None
") Perform;
		void Perform(const IntPatch_Polyhedron & Obje);

};


%extend IntPatch_InterferencePolyhedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IntPatch_Intersection *
******************************/
class IntPatch_Intersection {
	public:
		/****************** IntPatch_Intersection ******************/
		/**** md5 signature: b7b64295e34218cccd078e59a46a390e ****/
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_Intersection;
		 IntPatch_Intersection();

		/****************** IntPatch_Intersection ******************/
		/**** md5 signature: a85a3b0f0e6ce461f6dbf5a1b5d98f5d ****/
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float

Returns
-------
None
") IntPatch_Intersection;
		 IntPatch_Intersection(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang);

		/****************** IntPatch_Intersection ******************/
		/**** md5 signature: f9a6c62211c96a7f49d9256dd903134d ****/
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
TolArc: float
TolTang: float

Returns
-------
None
") IntPatch_Intersection;
		 IntPatch_Intersection(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const Standard_Real TolArc, const Standard_Real TolTang);

		/****************** Dump ******************/
		/**** md5 signature: 40fd8e2f06ba7098298ee81d3bf643bc ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump of each result line. mode for more accurate dumps.

Parameters
----------
Mode: int
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer Mode, const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the calculus was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the is no intersection.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Line ******************/
		/**** md5 signature: 0f19f87d200154ef5932a127697b505b ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the line of range index. an exception is raised if index<=0 or index>nbline.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IntPatch_Line>
") Line;
		const opencascade::handle<IntPatch_Line> & Line(const Standard_Integer Index);

		/****************** NbLines ******************/
		/**** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ****/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the number of intersection lines.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NbPnts ******************/
		/**** md5 signature: 11421df812eef5f47a644a70b75ab60a ****/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Returns the number of 'single' points.

Returns
-------
int
") NbPnts;
		Standard_Integer NbPnts();

		/****************** OppositeFaces ******************/
		/**** md5 signature: 1103bf0485006c89d11ed86313182eb1 ****/
		%feature("compactdefaultargs") OppositeFaces;
		%feature("autodoc", "Returns true when the tangentfaces returns true and the normal vectors evaluated at a point on the first and the second surface are opposite. the exception domainerror is raised if tangentfaces returns false.

Returns
-------
bool
") OppositeFaces;
		Standard_Boolean OppositeFaces();

		/****************** Perform ******************/
		/**** md5 signature: 64035566bd08a233ecb5546ff940a855 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Flag theisreqtokeeprline has been entered only for compatibility with topopebrep package. it shall be deleted after deleting topopebrep. when intersection result returns intpatch_rline and another intpatch_line (not restriction) we (in case of theisreqtokeeprline==true) will always keep both lines even if they are coincided. flag theisreqtopostwlproc has been entered only for compatibility with topopebrep package. it shall be deleted after deleting topopebrep. if theisreqtopostwlproc == false, then we will work with walking-line obtained after intersection algorithm directly (wothout any post-processing). .

Parameters
----------
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
isGeomInt: bool,optional
	default value is Standard_True
theIsReqToKeepRLine: bool,optional
	default value is Standard_False
theIsReqToPostWLProc: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Boolean isGeomInt = Standard_True, const Standard_Boolean theIsReqToKeepRLine = Standard_False, const Standard_Boolean theIsReqToPostWLProc = Standard_True);

		/****************** Perform ******************/
		/**** md5 signature: f4f20fcdd48468271f83597c0197e4c4 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "If isgeomint == standard_false, then method param-param intersection will be used. flag theisreqtokeeprline has been entered only for compatibility with topopebrep package. it shall be deleted after deleting topopebrep. when intersection result returns intpatch_rline and another intpatch_line (not restriction) we (in case of theisreqtokeeprline==true) will always keep both lines even if they are coincided. flag theisreqtopostwlproc has been entered only for compatibility with topopebrep package. it shall be deleted after deleting topopebrep. if theisreqtopostwlproc == false, then we will work with walking-line obtained after intersection algorithm directly (without any post-processing). .

Parameters
----------
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
LOfPnts: IntSurf_ListOfPntOn2S
isGeomInt: bool,optional
	default value is Standard_True
theIsReqToKeepRLine: bool,optional
	default value is Standard_False
theIsReqToPostWLProc: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, IntSurf_ListOfPntOn2S & LOfPnts, const Standard_Boolean isGeomInt = Standard_True, const Standard_Boolean theIsReqToKeepRLine = Standard_False, const Standard_Boolean theIsReqToPostWLProc = Standard_True);

		/****************** Perform ******************/
		/**** md5 signature: 6aa09eb24dd4bc5222efbef027b91011 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Perform with start point.

Parameters
----------
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
U1: float
V1: float
U2: float
V2: float
TolArc: float
TolTang: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real TolArc, const Standard_Real TolTang);

		/****************** Perform ******************/
		/**** md5 signature: 5a0d1e917941576d8c5e9c947eff219f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Uses for finding self-intersected surfaces.

Parameters
----------
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
TolArc: float
TolTang: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const Standard_Real TolArc, const Standard_Real TolTang);

		/****************** Point ******************/
		/**** md5 signature: a380f33017a5aaa3320d09b1b9dc85e1 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of range index. an exception is raised if index<=0 or index>nbpnt.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") Point;
		const IntPatch_Point & Point(const Standard_Integer Index);

		/****************** SequenceOfLine ******************/
		/**** md5 signature: 7663267a72cef685d6565935e73efb0a ****/
		%feature("compactdefaultargs") SequenceOfLine;
		%feature("autodoc", "No available documentation.

Returns
-------
IntPatch_SequenceOfLine
") SequenceOfLine;
		const IntPatch_SequenceOfLine & SequenceOfLine();

		/****************** SetTolerances ******************/
		/**** md5 signature: 8670d77050325f4c865f123b09128a08 ****/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "Set the tolerances used by the algorithms: --- implicit - parametric --- parametric - parametric --- implicit - implicit //! tolarc is used to compute the intersections between the restrictions of a surface and a walking line. //! toltang is used to compute the points on a walking line, and in geometric algorithms. //! fleche is a parameter used in the walking algorithms to provide small curvatures on a line. //! uvmaxstep is a parameter used in the walking algorithms to compute the distance between to points in their respective parametric spaces.

Parameters
----------
TolArc: float
TolTang: float
UVMaxStep: float
Fleche: float

Returns
-------
None
") SetTolerances;
		void SetTolerances(const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Real UVMaxStep, const Standard_Real Fleche);

		/****************** TangentFaces ******************/
		/**** md5 signature: 1bd0aa400de87da796d429cdd88c31ea ****/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "Returns true if the two patches are considered as entirely tangent, i-e every restriction arc of one patch is inside the geometric base of the other patch.

Returns
-------
bool
") TangentFaces;
		Standard_Boolean TangentFaces();

};


%extend IntPatch_Intersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class IntPatch_Line *
**********************/
%nodefaultctor IntPatch_Line;
class IntPatch_Line : public Standard_Transient {
	public:
		/****************** ArcType ******************/
		/**** md5 signature: 0a7455aa9cc33046fb13baf1f25a2b19 ****/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Returns the type of geometry 3d (line, circle, parabola, hyperbola, ellipse, analytic, walking, restriction).

Returns
-------
IntPatch_IType
") ArcType;
		IntPatch_IType ArcType();

		/****************** IsTangent ******************/
		/**** md5 signature: 16a7964bb24e34f80fabc93e5a65aedc ****/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Returns true if the intersection is a line of tangency between the 2 patches.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** IsUIsoOnS1 ******************/
		/**** md5 signature: 1aad8dcfd2c807aee9ae90657010709a ****/
		%feature("compactdefaultargs") IsUIsoOnS1;
		%feature("autodoc", "Returns true if the intersection is a u isoparametric curve on the first patch.

Returns
-------
bool
") IsUIsoOnS1;
		Standard_Boolean IsUIsoOnS1();

		/****************** IsUIsoOnS2 ******************/
		/**** md5 signature: c53a03daf11a34ad64c7147e99af671f ****/
		%feature("compactdefaultargs") IsUIsoOnS2;
		%feature("autodoc", "Returns true if the intersection is a u isoparametric curve on the second patch.

Returns
-------
bool
") IsUIsoOnS2;
		Standard_Boolean IsUIsoOnS2();

		/****************** IsVIsoOnS1 ******************/
		/**** md5 signature: b7ebebcc5a2c9f24c052636dca3c8dfb ****/
		%feature("compactdefaultargs") IsVIsoOnS1;
		%feature("autodoc", "Returns true if the intersection is a v isoparametric curve on the first patch.

Returns
-------
bool
") IsVIsoOnS1;
		Standard_Boolean IsVIsoOnS1();

		/****************** IsVIsoOnS2 ******************/
		/**** md5 signature: 3cfd95d8a0b0b88a42724611ce1bb80f ****/
		%feature("compactdefaultargs") IsVIsoOnS2;
		%feature("autodoc", "Returns true if the intersection is a v isoparametric curve on the second patch.

Returns
-------
bool
") IsVIsoOnS2;
		Standard_Boolean IsVIsoOnS2();

		/****************** SetValue ******************/
		/**** md5 signature: 12fc0194bc89d950f208a974a1599707 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "To set the values returned by isuisos1,.... the default values are false.

Parameters
----------
Uiso1: bool
Viso1: bool
Uiso2: bool
Viso2: bool

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Boolean Uiso1, const Standard_Boolean Viso1, const Standard_Boolean Uiso2, const Standard_Boolean Viso2);

		/****************** SituationS1 ******************/
		/**** md5 signature: af2d2dd713ae3b820482546cf4a82d7b ****/
		%feature("compactdefaultargs") SituationS1;
		%feature("autodoc", "Returns the situation (inside/outside/unknown) of the first patch compared to the second one, when transitionons1 or transitionons2 returns touch. otherwise, an exception is raised.

Returns
-------
IntSurf_Situation
") SituationS1;
		IntSurf_Situation SituationS1();

		/****************** SituationS2 ******************/
		/**** md5 signature: da9cc8795913744eb08fbe6bf499827b ****/
		%feature("compactdefaultargs") SituationS2;
		%feature("autodoc", "Returns the situation (inside/outside/unknown) of the second patch compared to the first one, when transitionons1 or transitionons2 returns touch. otherwise, an exception is raised.

Returns
-------
IntSurf_Situation
") SituationS2;
		IntSurf_Situation SituationS2();

		/****************** TransitionOnS1 ******************/
		/**** md5 signature: 9de184f3b47c2902be7de5eb10743898 ****/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "Returns the type of the transition of the line for the first surface. the transition is 'constant' along the line. the transition is in if the line is oriented in such a way that the system of vector (n1,n2,t) is right-handed, where n1 is the normal to the first surface at a point p, n2 is the normal to the second surface at a point p, t is the tangent to the intersection line at p. if the system of vector is left-handed, the transition is out. when n1 and n2 are colinear all along the intersection line, the transition will be - touch, if it is possible to use the 2nd derivatives to determine the position of one surafce compared to the other (see situation) - undecided otherwise. //! if one of the transition is touch or undecided, the other one has got the same value.

Returns
-------
IntSurf_TypeTrans
") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1();

		/****************** TransitionOnS2 ******************/
		/**** md5 signature: aafa064949332278d0d49be3da4c6df2 ****/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "Returns the type of the transition of the line for the second surface. the transition is 'constant' along the line.

Returns
-------
IntSurf_TypeTrans
") TransitionOnS2;
		IntSurf_TypeTrans TransitionOnS2();

};


%make_alias(IntPatch_Line)

%extend IntPatch_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IntPatch_LineConstructor *
*********************************/
class IntPatch_LineConstructor {
	public:
		/****************** IntPatch_LineConstructor ******************/
		/**** md5 signature: d9260de2e6fb6254e056b6313ba23011 ****/
		%feature("compactdefaultargs") IntPatch_LineConstructor;
		%feature("autodoc", "No available documentation.

Parameters
----------
mode: int

Returns
-------
None
") IntPatch_LineConstructor;
		 IntPatch_LineConstructor(const Standard_Integer mode);

		/****************** Line ******************/
		/**** md5 signature: a2403e2fa130e6fe0b80560f075cc3fd ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
index: int

Returns
-------
opencascade::handle<IntPatch_Line>
") Line;
		opencascade::handle<IntPatch_Line> Line(const Standard_Integer index);

		/****************** NbLines ******************/
		/**** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ****/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** Perform ******************/
		/**** md5 signature: eff3053702208adc7f4e74664498a5e4 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
SL: IntPatch_SequenceOfLine
L: IntPatch_Line
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
Tol: float

Returns
-------
None
") Perform;
		void Perform(const IntPatch_SequenceOfLine & SL, const opencascade::handle<IntPatch_Line> & L, const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real Tol);

};


%extend IntPatch_LineConstructor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntPatch_Point *
***********************/
class IntPatch_Point {
	public:
		/****************** IntPatch_Point ******************/
		/**** md5 signature: 03a05de988af7a0fed88ace5649e482b ****/
		%feature("compactdefaultargs") IntPatch_Point;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntPatch_Point;
		 IntPatch_Point();

		/****************** ArcOnS1 ******************/
		/**** md5 signature: c1826d461dcc6af4b9af182756306c57 ****/
		%feature("compactdefaultargs") ArcOnS1;
		%feature("autodoc", "Returns the arc of restriction containing the vertex. the exception domainerror is raised if isondoms1 returns false.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") ArcOnS1;
		const opencascade::handle<Adaptor2d_HCurve2d> & ArcOnS1();

		/****************** ArcOnS2 ******************/
		/**** md5 signature: 2d1e0215316a36f73794dfb2b77e51c1 ****/
		%feature("compactdefaultargs") ArcOnS2;
		%feature("autodoc", "Returns the arc of restriction containing the vertex. the exception domainerror is raised if isondoms2 returns false.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") ArcOnS2;
		const opencascade::handle<Adaptor2d_HCurve2d> & ArcOnS2();

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** IsMultiple ******************/
		/**** md5 signature: d5ff9ea3f75ee3e6e0efda5814b9e44e ****/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Returns true if the point belongs to several intersection lines.

Returns
-------
bool
") IsMultiple;
		Standard_Boolean IsMultiple();

		/****************** IsOnDomS1 ******************/
		/**** md5 signature: 73bb79eb09813ce2f78b4a234c9e417b ****/
		%feature("compactdefaultargs") IsOnDomS1;
		%feature("autodoc", "Returns true if the point is on a boundary of the domain of the first patch.

Returns
-------
bool
") IsOnDomS1;
		Standard_Boolean IsOnDomS1();

		/****************** IsOnDomS2 ******************/
		/**** md5 signature: 93e8adde96351fec102c7bd4f10efa11 ****/
		%feature("compactdefaultargs") IsOnDomS2;
		%feature("autodoc", "Returns true if the point is on a boundary of the domain of the second patch.

Returns
-------
bool
") IsOnDomS2;
		Standard_Boolean IsOnDomS2();

		/****************** IsTangencyPoint ******************/
		/**** md5 signature: a9c9faea523a7d80ff8416e04b887e70 ****/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Returns true if the point is a tangency point between the surfaces. if the point is on one of the domain (isondoms1 returns true or isondoms2 returns true), an exception is raised.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** IsVertexOnS1 ******************/
		/**** md5 signature: f69812d2258e171cd6e9220af4bdf9a7 ****/
		%feature("compactdefaultargs") IsVertexOnS1;
		%feature("autodoc", "Returns true if the point is a vertex on the initial restriction facet of the first surface.

Returns
-------
bool
") IsVertexOnS1;
		Standard_Boolean IsVertexOnS1();

		/****************** IsVertexOnS2 ******************/
		/**** md5 signature: 2bca687752d3b31cff59a696d6463475 ****/
		%feature("compactdefaultargs") IsVertexOnS2;
		%feature("autodoc", "Returns true if the point is a vertex on the initial restriction facet of the first surface.

Returns
-------
bool
") IsVertexOnS2;
		Standard_Boolean IsVertexOnS2();

		/****************** ParameterOnArc1 ******************/
		/**** md5 signature: fd3d8eb9ed7668171a21e22983def6f0 ****/
		%feature("compactdefaultargs") ParameterOnArc1;
		%feature("autodoc", "Returns the parameter of the point on the arc returned by the method arcons2. the exception domainerror is raised if isondoms1 returns false.

Returns
-------
float
") ParameterOnArc1;
		Standard_Real ParameterOnArc1();

		/****************** ParameterOnArc2 ******************/
		/**** md5 signature: aa992bbe43a517a3ff131f0c53ce4d8a ****/
		%feature("compactdefaultargs") ParameterOnArc2;
		%feature("autodoc", "Returns the parameter of the point on the arc returned by the method arcons2. the exception domainerror is raised if isondoms2 returns false.

Returns
-------
float
") ParameterOnArc2;
		Standard_Real ParameterOnArc2();

		/****************** ParameterOnLine ******************/
		/**** md5 signature: 737a2a57e32e63a1ba587dea488e9583 ****/
		%feature("compactdefaultargs") ParameterOnLine;
		%feature("autodoc", "This method returns the parameter of the point on the intersection line. if the points does not belong to an intersection line, the value returned does not have any sens.

Returns
-------
float
") ParameterOnLine;
		Standard_Real ParameterOnLine();

		/****************** Parameters ******************/
		/**** md5 signature: 30bdd599088f74dedd5979b152a07fd4 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters on the first and on the second surface of the point.

Parameters
----------

Returns
-------
U1: float
V1: float
U2: float
V2: float
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParametersOnS1 ******************/
		/**** md5 signature: 64f6fb4c23b753a8ae110d855799d804 ****/
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "Returns the parameters on the first surface of the point.

Parameters
----------

Returns
-------
U1: float
V1: float
") ParametersOnS1;
		void ParametersOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParametersOnS2 ******************/
		/**** md5 signature: a037f950d5c09fdf632c55b7efba040b ****/
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "Returns the parameters on the second surface of the point.

Parameters
----------

Returns
-------
U2: float
V2: float
") ParametersOnS2;
		void ParametersOnS2(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** PntOn2S ******************/
		/**** md5 signature: 2088ec360d33e9af1c8275f7d5a12197 ****/
		%feature("compactdefaultargs") PntOn2S;
		%feature("autodoc", "Returns the pnton2s (geometric point and the parameters).

Returns
-------
IntSurf_PntOn2S
") PntOn2S;
		const IntSurf_PntOn2S & PntOn2S();

		/****************** ReverseTransition ******************/
		/**** md5 signature: e7f43ebc9ca8b3b75df4b5e0a05c5e52 ****/
		%feature("compactdefaultargs") ReverseTransition;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ReverseTransition;
		void ReverseTransition();

		/****************** SetArc ******************/
		/**** md5 signature: 72b2c126deaa24ced71cc8f8bf22eab6 ****/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "Sets the values of a point which is on one of the domain, when both surfaces are implicit ones. if onfirst is true, the point is on the domain of the first patch, otherwise the point is on the domain of the second surface.

Parameters
----------
OnFirst: bool
A: Adaptor2d_HCurve2d
Param: float
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Returns
-------
None
") SetArc;
		void SetArc(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****************** SetMultiple ******************/
		/**** md5 signature: ba432831fdf3206e67c99f5a09c82c20 ****/
		%feature("compactdefaultargs") SetMultiple;
		%feature("autodoc", "Sets (or unsets) the point as a point on several intersection line.

Parameters
----------
IsMult: bool

Returns
-------
None
") SetMultiple;
		void SetMultiple(const Standard_Boolean IsMult);

		/****************** SetParameter ******************/
		/**** md5 signature: 9c20628bfb58eb45593287ce353000c6 ****/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "Set the value of the parameter on the intersection line.

Parameters
----------
Para: float

Returns
-------
None
") SetParameter;
		void SetParameter(const Standard_Real Para);

		/****************** SetParameters ******************/
		/**** md5 signature: 755b8f6dd45d6eff6cc745c4eabd14f0 ****/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "Sets the values of the parameters of the point on each surface.

Parameters
----------
U1: float
V1: float
U2: float
V2: float

Returns
-------
None
") SetParameters;
		void SetParameters(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2);

		/****************** SetTolerance ******************/
		/**** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ****/
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

		/****************** SetValue ******************/
		/**** md5 signature: e8dc59ed3fac2d4ba87ce4256618e8a0 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the values of a point which is on no domain, when both surfaces are implicit ones. if tangent is true, the point is a point of tangency between the surfaces.

Parameters
----------
Pt: gp_Pnt
Tol: float
Tangent: bool

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pt, const Standard_Real Tol, const Standard_Boolean Tangent);

		/****************** SetValue ******************/
		/**** md5 signature: 030ac1eb59faa7b90801ff6c52fc9800 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pt: gp_Pnt

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pt);

		/****************** SetValue ******************/
		/**** md5 signature: 0b319b299a0494678d536a27e164845b ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the value of <pt> member.

Parameters
----------
thePOn2S: IntSurf_PntOn2S

Returns
-------
None
") SetValue;
		void SetValue(const IntSurf_PntOn2S & thePOn2S);

		/****************** SetVertex ******************/
		/**** md5 signature: d6a1bcb9791834d88ec5b6eb34aa5dcf ****/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "Sets the values of a point which is a vertex on the initial facet of restriction of one of the surface. if onfirst is true, the point is on the domain of the first patch, otherwise the point is on the domain of the second surface.

Parameters
----------
OnFirst: bool
V: Adaptor3d_HVertex

Returns
-------
None
") SetVertex;
		void SetVertex(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "This method returns the fuzziness on the point.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** TransitionLineArc1 ******************/
		/**** md5 signature: 3c2f51f861994ac2130670399f843948 ****/
		%feature("compactdefaultargs") TransitionLineArc1;
		%feature("autodoc", "Returns the transition of the point on the intersection line with the arc on s1. the exception domainerror is raised if isondoms1 returns false.

Returns
-------
IntSurf_Transition
") TransitionLineArc1;
		const IntSurf_Transition & TransitionLineArc1();

		/****************** TransitionLineArc2 ******************/
		/**** md5 signature: f951568f311bcb1309847a661eb86a91 ****/
		%feature("compactdefaultargs") TransitionLineArc2;
		%feature("autodoc", "Returns the transition of the point on the intersection line with the arc on s2. the exception domainerror is raised if isondoms2 returns false.

Returns
-------
IntSurf_Transition
") TransitionLineArc2;
		const IntSurf_Transition & TransitionLineArc2();

		/****************** TransitionOnS1 ******************/
		/**** md5 signature: 8cb3d24c0def4cc671eb54590466ee5c ****/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "Returns the transition between the intersection line returned by the method line and the arc on s1 returned by arcons1(). the exception domainerror is raised if isondoms1 returns false.

Returns
-------
IntSurf_Transition
") TransitionOnS1;
		const IntSurf_Transition & TransitionOnS1();

		/****************** TransitionOnS2 ******************/
		/**** md5 signature: a2716413c981c4ee8338310413d27dd3 ****/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "Returns the transition between the intersection line returned by the method line and the arc on s2 returned by arcons2. the exception domainerror is raised if isondoms2 returns false.

Returns
-------
IntSurf_Transition
") TransitionOnS2;
		const IntSurf_Transition & TransitionOnS2();

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the intersection point (geometric information).

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** VertexOnS1 ******************/
		/**** md5 signature: 6e7ddd3a0f44dd6dcb5d598d6d8b56dc ****/
		%feature("compactdefaultargs") VertexOnS1;
		%feature("autodoc", "Returns the information about the point when it is on the domain of the first patch, i-e when the function isvertexons1 returns true. otherwise, an exception is raised.

Returns
-------
opencascade::handle<Adaptor3d_HVertex>
") VertexOnS1;
		const opencascade::handle<Adaptor3d_HVertex> & VertexOnS1();

		/****************** VertexOnS2 ******************/
		/**** md5 signature: e810e40154fb388d3f47ab3204e900a0 ****/
		%feature("compactdefaultargs") VertexOnS2;
		%feature("autodoc", "Returns the information about the point when it is on the domain of the second patch, i-e when the function isvertexons2 returns true. otherwise, an exception is raised.

Returns
-------
opencascade::handle<Adaptor3d_HVertex>
") VertexOnS2;
		const opencascade::handle<Adaptor3d_HVertex> & VertexOnS2();

};


%extend IntPatch_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IntPatch_Polygo *
************************/
%nodefaultctor IntPatch_Polygo;
class IntPatch_Polygo : public Intf_Polygon2d {
	public:
		/****************** DeflectionOverEstimation ******************/
		/**** md5 signature: 43f4e747867c1147de91dcc2fd648827 ****/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Returns the tolerance of the polygon.

Returns
-------
float
") DeflectionOverEstimation;
		virtual Standard_Real DeflectionOverEstimation();

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Error ******************/
		/**** md5 signature: 585075c65a8681dedf24240dbb90f7f4 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Error;
		Standard_Real Error();

		/****************** NbPoints ******************/
		/**** md5 signature: f447cbc80238739e4af5e7bf8698afd4 ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		virtual Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		/**** md5 signature: 3964cbfa1f20d4814234f7fc3d204bbb ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of segments in the polyline.

Returns
-------
int
") NbSegments;
		virtual Standard_Integer NbSegments();

		/****************** Point ******************/
		/**** md5 signature: 3ab9edca994a69ca9424e287150bc2eb ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
gp_Pnt2d
") Point;
		virtual gp_Pnt2d Point(const Standard_Integer Index);

		/****************** Segment ******************/
		/**** md5 signature: 86ed8dcd5c63b8c7622186f373e5af81 ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns the points of the segment <index> in the polygon.

Parameters
----------
theIndex: int
theBegin: gp_Pnt2d
theEnd: gp_Pnt2d

Returns
-------
None
") Segment;
		virtual void Segment(const Standard_Integer theIndex, gp_Pnt2d & theBegin, gp_Pnt2d & theEnd);

};


%extend IntPatch_Polygo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IntPatch_Polyhedron *
****************************/
/********************************
* class IntPatch_PolyhedronTool *
********************************/
class IntPatch_PolyhedronTool {
	public:
		/****************** Bounding ******************/
		/**** md5 signature: 62cea57f62e90f1f59dd4f0461684e2c ****/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "Give the bounding box of the polyhedron.

Parameters
----------
thePolyh: IntPatch_Polyhedron

Returns
-------
Bnd_Box
") Bounding;
		static const Bnd_Box & Bounding(const IntPatch_Polyhedron & thePolyh);

		/****************** ComponentsBounding ******************/
		/**** md5 signature: 3be44beddefd5df8ebca7137f8bc4df5 ****/
		%feature("compactdefaultargs") ComponentsBounding;
		%feature("autodoc", "Give the array of boxes. the box <n> corresponding to the triangle <n>.

Parameters
----------
thePolyh: IntPatch_Polyhedron

Returns
-------
opencascade::handle<Bnd_HArray1OfBox>
") ComponentsBounding;
		static const opencascade::handle<Bnd_HArray1OfBox> & ComponentsBounding(const IntPatch_Polyhedron & thePolyh);

		/****************** DeflectionOverEstimation ******************/
		/**** md5 signature: c343bf3337861a156b50bb1071bddd97 ****/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Give the tolerance of the polygon.

Parameters
----------
thePolyh: IntPatch_Polyhedron

Returns
-------
float
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation(const IntPatch_Polyhedron & thePolyh);

		/****************** NbTriangles ******************/
		/**** md5 signature: bc1f65765f28cccf3319726eaa730a95 ****/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "Give the number of triangles in this polyedral surface.

Parameters
----------
thePolyh: IntPatch_Polyhedron

Returns
-------
int
") NbTriangles;
		static Standard_Integer NbTriangles(const IntPatch_Polyhedron & thePolyh);

		/****************** Point ******************/
		/**** md5 signature: 109f06f2e5b9dfa60d8906454215fca0 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Give the point of index i in the polyedral surface.

Parameters
----------
thePolyh: IntPatch_Polyhedron
Index: int

Returns
-------
gp_Pnt
") Point;
		static const gp_Pnt Point(const IntPatch_Polyhedron & thePolyh, const Standard_Integer Index);

		/****************** TriConnex ******************/
		/**** md5 signature: d9916b13eb8aa9e0d0f6bda2bcb34cbb ****/
		%feature("compactdefaultargs") TriConnex;
		%feature("autodoc", "Gives the addresse tricon of the triangle connexe to the triangle of address triang by the edge pivot pedge and the third point of this connexe triangle. when we are on a free edge tricon==0 but the function return the value of the triangle in the other side of pivot on the free edge. used to turn around a vertex.

Parameters
----------
thePolyh: IntPatch_Polyhedron
Triang: int
Pivot: int
Pedge: int

Returns
-------
TriCon: int
OtherP: int
") TriConnex;
		static Standard_Integer TriConnex(const IntPatch_Polyhedron & thePolyh, const Standard_Integer Triang, const Standard_Integer Pivot, const Standard_Integer Pedge, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Triangle ******************/
		/**** md5 signature: e7579fd54115d4e98a4349222adfe06d ****/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "Give the indices of the 3 points of the triangle of address index in the polyhedron.

Parameters
----------
thePolyh: IntPatch_Polyhedron
Index: int

Returns
-------
P1: int
P2: int
P3: int
") Triangle;
		static void Triangle(const IntPatch_Polyhedron & thePolyh, const Standard_Integer Index, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

};


%extend IntPatch_PolyhedronTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IntPatch_PrmPrmIntersection *
************************************/
class IntPatch_PrmPrmIntersection {
	public:
		/****************** IntPatch_PrmPrmIntersection ******************/
		/**** md5 signature: 13ca72c86a53df35245b2d4f1d1237d8 ****/
		%feature("compactdefaultargs") IntPatch_PrmPrmIntersection;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntPatch_PrmPrmIntersection;
		 IntPatch_PrmPrmIntersection();

		/****************** CodeReject ******************/
		/**** md5 signature: 2eddbed03b0012efdbeaa323b24365a6 ****/
		%feature("compactdefaultargs") CodeReject;
		%feature("autodoc", "No available documentation.

Parameters
----------
x1: float
y1: float
z1: float
x2: float
y2: float
z2: float
x3: float
y3: float
z3: float

Returns
-------
int
") CodeReject;
		Standard_Integer CodeReject(const Standard_Real x1, const Standard_Real y1, const Standard_Real z1, const Standard_Real x2, const Standard_Real y2, const Standard_Real z2, const Standard_Real x3, const Standard_Real y3, const Standard_Real z3);

		/****************** DansGrille ******************/
		/**** md5 signature: 63fc7618edcef43ccb613725c0abf121 ****/
		%feature("compactdefaultargs") DansGrille;
		%feature("autodoc", "No available documentation.

Parameters
----------
t: int

Returns
-------
int
") DansGrille;
		Standard_Integer DansGrille(const Standard_Integer t);

		/****************** GrilleInteger ******************/
		/**** md5 signature: 6101cd196dae74940af7e5ba51962a3e ****/
		%feature("compactdefaultargs") GrilleInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
ix: int
iy: int
iz: int

Returns
-------
int
") GrilleInteger;
		Standard_Integer GrilleInteger(const Standard_Integer ix, const Standard_Integer iy, const Standard_Integer iz);

		/****************** IntegerGrille ******************/
		/**** md5 signature: 7040ab40d31d200cf9a68de48f8e0e4f ****/
		%feature("compactdefaultargs") IntegerGrille;
		%feature("autodoc", "No available documentation.

Parameters
----------
t: int

Returns
-------
ix: int
iy: int
iz: int
") IntegerGrille;
		void IntegerGrille(const Standard_Integer t, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the calculus was succesfull.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the is no intersection.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Line ******************/
		/**** md5 signature: 0f19f87d200154ef5932a127697b505b ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the line of range index. an exception is raised if index<=0 or index>nbline.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IntPatch_Line>
") Line;
		const opencascade::handle<IntPatch_Line> & Line(const Standard_Integer Index);

		/****************** NbLines ******************/
		/**** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ****/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the number of intersection lines.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NbPointsGrille ******************/
		/**** md5 signature: bc59d1c5f80d095cb3ac55a785ead7d6 ****/
		%feature("compactdefaultargs") NbPointsGrille;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPointsGrille;
		Standard_Integer NbPointsGrille();

		/****************** NewLine ******************/
		/**** md5 signature: c3b4d7e05c34095434ba9f0105ed01c7 ****/
		%feature("compactdefaultargs") NewLine;
		%feature("autodoc", "Computes about <nbpoints> intersection points on the line <indexline> between the points of index <lowpoint> and <highpoint>. //! all the points of the line of index <indexline> with an index between <lowpoint> and <highpoint> are in the returned line. new points are inserted between existing points if those points are not too closed. //! an exception is raised if index<=0 or index>nbline. or if isdone returns false.

Parameters
----------
Caro1: Adaptor3d_HSurface
Caro2: Adaptor3d_HSurface
IndexLine: int
LowPoint: int
HighPoint: int
NbPoints: int

Returns
-------
opencascade::handle<IntPatch_Line>
") NewLine;
		opencascade::handle<IntPatch_Line> NewLine(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const opencascade::handle<Adaptor3d_HSurface> & Caro2, const Standard_Integer IndexLine, const Standard_Integer LowPoint, const Standard_Integer HighPoint, const Standard_Integer NbPoints);

		/****************** Perform ******************/
		/**** md5 signature: d79a5e1f02ec0619e64118958e4ae398 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between <caro1> and <caro2>. associated polyhedrons <polyhedron1> and <polyhedron2> are given.

Parameters
----------
Caro1: Adaptor3d_HSurface
Polyhedron1: IntPatch_Polyhedron
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_HSurface
Polyhedron2: IntPatch_Polyhedron
Domain2: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const IntPatch_Polyhedron & Polyhedron1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_HSurface> & Caro2, const IntPatch_Polyhedron & Polyhedron2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****************** Perform ******************/
		/**** md5 signature: b94c648f4f6fb9533fc4f308cb8f656d ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Caro1: Adaptor3d_HSurface
Polyhedron1: IntPatch_Polyhedron
Domain1: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const IntPatch_Polyhedron & Polyhedron1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****************** Perform ******************/
		/**** md5 signature: beaf3fadf554fe1e47d0cae76e83bd2b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between <caro1> and <caro2>. the method computes the polyhedron on each surface.

Parameters
----------
Caro1: Adaptor3d_HSurface
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_HSurface
Domain2: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float
ClearFlag: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_HSurface> & Caro2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment, const Standard_Boolean ClearFlag = Standard_True);

		/****************** Perform ******************/
		/**** md5 signature: fb223b6e0c5990f0c36944370a139ebd ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between <caro1> and <caro2>. the method computes the polyhedron on each surface.

Parameters
----------
Caro1: Adaptor3d_HSurface
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_HSurface
Domain2: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float
ListOfPnts: IntSurf_ListOfPntOn2S

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_HSurface> & Caro2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment, IntSurf_ListOfPntOn2S & ListOfPnts);

		/****************** Perform ******************/
		/**** md5 signature: 0959c17f9569527c4e1d94957577b433 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between <caro1> and <caro2>. the method computes the polyhedron on each surface.

Parameters
----------
Caro1: Adaptor3d_HSurface
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_HSurface
Domain2: Adaptor3d_TopolTool
U1: float
V1: float
U2: float
V2: float
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_HSurface> & Caro2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****************** Perform ******************/
		/**** md5 signature: 7679607b76574a665722e163c741abe7 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between <caro1> and <caro2>. the method computes the polyhedron on each surface.

Parameters
----------
Caro1: Adaptor3d_HSurface
Domain1: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****************** Perform ******************/
		/**** md5 signature: f7e7a3d0535b9288f512bf9a69a16807 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between <caro1> and <caro2>. //! the polyhedron which approximates <caro2>, <polyhedron2> is given. the other one is computed.

Parameters
----------
Caro1: Adaptor3d_HSurface
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_HSurface
Polyhedron2: IntPatch_Polyhedron
Domain2: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_HSurface> & Caro2, const IntPatch_Polyhedron & Polyhedron2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****************** Perform ******************/
		/**** md5 signature: f65c7aae7207831feebde976cf8a4e55 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between <caro1> and <caro2>. //! the polyhedron which approximates <caro1>, <polyhedron1> is given. the other one is computed.

Parameters
----------
Caro1: Adaptor3d_HSurface
Polyhedron1: IntPatch_Polyhedron
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_HSurface
Domain2: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const IntPatch_Polyhedron & Polyhedron1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_HSurface> & Caro2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****************** PointDepart ******************/
		/**** md5 signature: ec883cdf89df7946ca5cb25911e27297 ****/
		%feature("compactdefaultargs") PointDepart;
		%feature("autodoc", "No available documentation.

Parameters
----------
LineOn2S: IntSurf_LineOn2S
S1: Adaptor3d_HSurface
SU1: int
SV1: int
S2: Adaptor3d_HSurface
SU2: int
SV2: int

Returns
-------
None
") PointDepart;
		void PointDepart(opencascade::handle<IntSurf_LineOn2S> & LineOn2S, const opencascade::handle<Adaptor3d_HSurface> & S1, const Standard_Integer SU1, const Standard_Integer SV1, const opencascade::handle<Adaptor3d_HSurface> & S2, const Standard_Integer SU2, const Standard_Integer SV2);

		/****************** Remplit ******************/
		/**** md5 signature: fbf915009d30635235aad52fdc09392b ****/
		%feature("compactdefaultargs") Remplit;
		%feature("autodoc", "No available documentation.

Parameters
----------
a: int
b: int
c: int
Map: IntPatch_PrmPrmIntersection_T3Bits

Returns
-------
None
") Remplit;
		void Remplit(const Standard_Integer a, const Standard_Integer b, const Standard_Integer c, IntPatch_PrmPrmIntersection_T3Bits & Map);

		/****************** RemplitLin ******************/
		/**** md5 signature: 10383209f342d5bdfa6a9e2f83be207e ****/
		%feature("compactdefaultargs") RemplitLin;
		%feature("autodoc", "No available documentation.

Parameters
----------
x1: int
y1: int
z1: int
x2: int
y2: int
z2: int
Map: IntPatch_PrmPrmIntersection_T3Bits

Returns
-------
None
") RemplitLin;
		void RemplitLin(const Standard_Integer x1, const Standard_Integer y1, const Standard_Integer z1, const Standard_Integer x2, const Standard_Integer y2, const Standard_Integer z2, IntPatch_PrmPrmIntersection_T3Bits & Map);

		/****************** RemplitTri ******************/
		/**** md5 signature: c82dcb51cafb529d6032e747280eca0a ****/
		%feature("compactdefaultargs") RemplitTri;
		%feature("autodoc", "No available documentation.

Parameters
----------
x1: int
y1: int
z1: int
x2: int
y2: int
z2: int
x3: int
y3: int
z3: int
Map: IntPatch_PrmPrmIntersection_T3Bits

Returns
-------
None
") RemplitTri;
		void RemplitTri(const Standard_Integer x1, const Standard_Integer y1, const Standard_Integer z1, const Standard_Integer x2, const Standard_Integer y2, const Standard_Integer z2, const Standard_Integer x3, const Standard_Integer y3, const Standard_Integer z3, IntPatch_PrmPrmIntersection_T3Bits & Map);

};


%extend IntPatch_PrmPrmIntersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class IntPatch_PrmPrmIntersection_T3Bits *
*******************************************/
class IntPatch_PrmPrmIntersection_T3Bits {
	public:
		/****************** IntPatch_PrmPrmIntersection_T3Bits ******************/
		/**** md5 signature: 1e59c69bab7a66c87344b2cef83f47ee ****/
		%feature("compactdefaultargs") IntPatch_PrmPrmIntersection_T3Bits;
		%feature("autodoc", "No available documentation.

Parameters
----------
size: int

Returns
-------
None
") IntPatch_PrmPrmIntersection_T3Bits;
		 IntPatch_PrmPrmIntersection_T3Bits(const Standard_Integer size);

		/****************** Add ******************/
		/**** md5 signature: 7fcd2e77783b4e419caaef9da01cf583 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
t: int

Returns
-------
None
") Add;
		void Add(const Standard_Integer t);

		/****************** And ******************/
		/**** md5 signature: ec685a34548ff8895d0278e132c334bf ****/
		%feature("compactdefaultargs") And;
		%feature("autodoc", "No available documentation.

Parameters
----------
Oth: IntPatch_PrmPrmIntersection_T3Bits

Returns
-------
indiceprecedent: int
") And;
		Standard_Integer And(IntPatch_PrmPrmIntersection_T3Bits & Oth, Standard_Integer &OutValue);

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Raz ******************/
		/**** md5 signature: 10fdcbd6b16160ecdc7ab829747b0020 ****/
		%feature("compactdefaultargs") Raz;
		%feature("autodoc", "No available documentation.

Parameters
----------
t: int

Returns
-------
None
") Raz;
		void Raz(const Standard_Integer t);

		/****************** ResetAnd ******************/
		/**** md5 signature: 54dfe31b09e5a3c02e8155e330083c1c ****/
		%feature("compactdefaultargs") ResetAnd;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ResetAnd;
		void ResetAnd();

		/****************** Val ******************/
		/**** md5 signature: a89797def7979fa7c11e3672212a8ca6 ****/
		%feature("compactdefaultargs") Val;
		%feature("autodoc", "No available documentation.

Parameters
----------
t: int

Returns
-------
int
") Val;
		Standard_Integer Val(const Standard_Integer t);

};


%extend IntPatch_PrmPrmIntersection_T3Bits {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IntPatch_RstInt *
************************/
class IntPatch_RstInt {
	public:
		/****************** PutVertexOnLine ******************/
		/**** md5 signature: fb077e30c445c5ad8be050ac55673631 ****/
		%feature("compactdefaultargs") PutVertexOnLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: IntPatch_Line
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool
OtherSurf: Adaptor3d_HSurface
OnFirst: bool
Tol: float

Returns
-------
None
") PutVertexOnLine;
		static void PutVertexOnLine(const opencascade::handle<IntPatch_Line> & L, const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const opencascade::handle<Adaptor3d_HSurface> & OtherSurf, const Standard_Boolean OnFirst, const Standard_Real Tol);

};


%extend IntPatch_RstInt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IntPatch_SpecialPoints *
*******************************/
class IntPatch_SpecialPoints {
	public:
		/****************** AddCrossUVIsoPoint ******************/
		/**** md5 signature: 79fc93941f943d6cfa7045d63c6f4ea0 ****/
		%feature("compactdefaultargs") AddCrossUVIsoPoint;
		%feature("autodoc", "Adds the point defined as intersection of two isolines (u = 0 and v = 0) on theqsurf in theline. therefpt is used to correct adjusting parameters. if theisreversed is true then theqsurf correspond to the second (otherwise, the first) surface while forming intersection point intsurf_pnton2s.

Parameters
----------
theQSurf: Adaptor3d_HSurface
thePSurf: Adaptor3d_HSurface
theRefPt: IntSurf_PntOn2S
theTol3d: float
theAddedPoint: IntSurf_PntOn2S
theIsReversed: bool,optional
	default value is Standard_False

Returns
-------
bool
") AddCrossUVIsoPoint;
		static Standard_Boolean AddCrossUVIsoPoint(const opencascade::handle<Adaptor3d_HSurface> & theQSurf, const opencascade::handle<Adaptor3d_HSurface> & thePSurf, const IntSurf_PntOn2S & theRefPt, const Standard_Real theTol3d, IntSurf_PntOn2S & theAddedPoint, const Standard_Boolean theIsReversed = Standard_False);

		/****************** AddPointOnUorVIso ******************/
		/**** md5 signature: 65b3dbac4bb80d6b11d43fe6834cbe2c ****/
		%feature("compactdefaultargs") AddPointOnUorVIso;
		%feature("autodoc", "Adds the point lain strictly in the isoline u = 0 or v = 0 of theqsurf, in theline. therefpt is used to correct adjusting parameters. if theisreversed is true then theqsurf corresponds to the second (otherwise, the first) surface while forming intersection point intsurf_pnton2s. all math_vector-objects must be filled as follows: [1] - u-parameter of thepsurf; [2] - v-parameter of thepsurf; [3] - u- (if v-isoline is considered) or v-parameter (if u-isoline is considered) of theqsurf.

Parameters
----------
theQSurf: Adaptor3d_HSurface
thePSurf: Adaptor3d_HSurface
theRefPt: IntSurf_PntOn2S
theIsU: bool
theIsoParameter: float
theToler: math_Vector
theInitPoint: math_Vector
theInfBound: math_Vector
theSupBound: math_Vector
theAddedPoint: IntSurf_PntOn2S
theIsReversed: bool,optional
	default value is Standard_False

Returns
-------
bool
") AddPointOnUorVIso;
		static Standard_Boolean AddPointOnUorVIso(const opencascade::handle<Adaptor3d_HSurface> & theQSurf, const opencascade::handle<Adaptor3d_HSurface> & thePSurf, const IntSurf_PntOn2S & theRefPt, const Standard_Boolean theIsU, const Standard_Real theIsoParameter, const math_Vector & theToler, const math_Vector & theInitPoint, const math_Vector & theInfBound, const math_Vector & theSupBound, IntSurf_PntOn2S & theAddedPoint, const Standard_Boolean theIsReversed = Standard_False);

		/****************** AddSingularPole ******************/
		/**** md5 signature: cc1fca7b20c3f0f79338650e6b0a4a91 ****/
		%feature("compactdefaultargs") AddSingularPole;
		%feature("autodoc", "Computes the pole of sphere to add it in the intersection line. stores the result in theaddedpoint variable (does not add in the line). at that, cone and sphere (with singularity) must be set in theqsurf parameter. by default (if theisreversed == false), theqsurf is the first surface of the walking line. if it is not, theisreversed parameter must be set to true. theisreqrefcheck is true if and only if 3d-point of therefpt must be pole or apex for check (e.g. if it is vertex). theptiso is the reference point for obtaining isoline where must be placed the apex/pole. //! attention!!! thevertex must be initialized before calling the method .

Parameters
----------
theQSurf: Adaptor3d_HSurface
thePSurf: Adaptor3d_HSurface
thePtIso: IntSurf_PntOn2S
theVertex: IntPatch_Point
theAddedPoint: IntSurf_PntOn2S
theIsReversed: bool,optional
	default value is Standard_False
theIsReqRefCheck: bool,optional
	default value is Standard_False

Returns
-------
bool
") AddSingularPole;
		static Standard_Boolean AddSingularPole(const opencascade::handle<Adaptor3d_HSurface> & theQSurf, const opencascade::handle<Adaptor3d_HSurface> & thePSurf, const IntSurf_PntOn2S & thePtIso, IntPatch_Point & theVertex, IntSurf_PntOn2S & theAddedPoint, const Standard_Boolean theIsReversed = Standard_False, const Standard_Boolean theIsReqRefCheck = Standard_False);

		/****************** AdjustPointAndVertex ******************/
		/**** md5 signature: 96a980073d3c92eb4aeb14d968555344 ****/
		%feature("compactdefaultargs") AdjustPointAndVertex;
		%feature("autodoc", "Sets thenewpoint parameters in 2d-space the closest to therefpoint with help of adding/subtracting corresponding periods. thearrperiods must be filled as follows: {<u-period of 1st surface>, <v-period of 1st surface>, <u-period of 2nd surface>, <v-period of 2nd surface>}. if thevertex != 0 then its parameters will be filled as corresponding parameters of thenewpoint. //! attention!!! thenewpoint is not only output parameter. it is input/output one. i.e. thenewpoint is reference point together with therefpt.

Parameters
----------
theRefPoint: IntSurf_PntOn2S
theArrPeriods: float
theNewPoint: IntSurf_PntOn2S
theVertex: IntPatch_Point *,optional
	default value is 0

Returns
-------
None
") AdjustPointAndVertex;
		static void AdjustPointAndVertex(const IntSurf_PntOn2S & theRefPoint, const Standard_Real theArrPeriods[4], IntSurf_PntOn2S & theNewPoint, IntPatch_Point * const theVertex = 0);

		/****************** ContinueAfterSpecialPoint ******************/
		/**** md5 signature: 0cd20b47a8b87518ab06914f226393cf ****/
		%feature("compactdefaultargs") ContinueAfterSpecialPoint;
		%feature("autodoc", "Special point has already been added in the line. now, we need in correct prolongation of the line or in start new line. this function returns new point. //! attention!!! thenewpoint is not only output parameter. it is input/output one. i.e. thenewpoint is reference point together with therefpt.

Parameters
----------
theQSurf: Adaptor3d_HSurface
thePSurf: Adaptor3d_HSurface
theRefPt: IntSurf_PntOn2S
theSPType: IntPatch_SpecPntType
theTol2D: float
theNewPoint: IntSurf_PntOn2S
theIsReversed: bool,optional
	default value is Standard_False

Returns
-------
bool
") ContinueAfterSpecialPoint;
		static Standard_Boolean ContinueAfterSpecialPoint(const opencascade::handle<Adaptor3d_HSurface> & theQSurf, const opencascade::handle<Adaptor3d_HSurface> & thePSurf, const IntSurf_PntOn2S & theRefPt, const IntPatch_SpecPntType theSPType, const Standard_Real theTol2D, IntSurf_PntOn2S & theNewPoint, const Standard_Boolean theIsReversed = Standard_False);

};


%extend IntPatch_SpecialPoints {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IntPatch_TheIWLineOfTheIWalking *
****************************************/
class IntPatch_TheIWLineOfTheIWalking : public Standard_Transient {
	public:
		/****************** IntPatch_TheIWLineOfTheIWalking ******************/
		/**** md5 signature: f30aa79b0d1c6bd12da4bab53a0ab6c8 ****/
		%feature("compactdefaultargs") IntPatch_TheIWLineOfTheIWalking;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAllocator: IntSurf_Allocator,optional
	default value is 0

Returns
-------
None
") IntPatch_TheIWLineOfTheIWalking;
		 IntPatch_TheIWLineOfTheIWalking(const IntSurf_Allocator & theAllocator = 0);

		/****************** AddIndexPassing ******************/
		/**** md5 signature: 5211f3a2dbfeb4744c3451bde1b6a45c ****/
		%feature("compactdefaultargs") AddIndexPassing;
		%feature("autodoc", "Associer a l 'indice du point sur la ligne l'indice du point passant dans l'iterateur de depart.

Parameters
----------
Index: int

Returns
-------
None
") AddIndexPassing;
		void AddIndexPassing(const Standard_Integer Index);

		/****************** AddPoint ******************/
		/**** md5 signature: 806b6da489848ff70e42ef52b8d76d5c ****/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Add a point in the line.

Parameters
----------
P: IntSurf_PntOn2S

Returns
-------
None
") AddPoint;
		void AddPoint(const IntSurf_PntOn2S & P);

		/****************** AddStatusFirst ******************/
		/**** md5 signature: 57c24fab44c44bc9f08fb80e64391777 ****/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "No available documentation.

Parameters
----------
Closed: bool
HasFirst: bool

Returns
-------
None
") AddStatusFirst;
		void AddStatusFirst(const Standard_Boolean Closed, const Standard_Boolean HasFirst);

		/****************** AddStatusFirst ******************/
		/**** md5 signature: 3bcc39dd9b427e47834d54029a984cdb ****/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "No available documentation.

Parameters
----------
Closed: bool
HasLast: bool
Index: int
P: IntSurf_PathPoint

Returns
-------
None
") AddStatusFirst;
		void AddStatusFirst(const Standard_Boolean Closed, const Standard_Boolean HasLast, const Standard_Integer Index, const IntSurf_PathPoint & P);

		/****************** AddStatusFirstLast ******************/
		/**** md5 signature: 9b5b9adcff3655cf97dda89c630e8677 ****/
		%feature("compactdefaultargs") AddStatusFirstLast;
		%feature("autodoc", "No available documentation.

Parameters
----------
Closed: bool
HasFirst: bool
HasLast: bool

Returns
-------
None
") AddStatusFirstLast;
		void AddStatusFirstLast(const Standard_Boolean Closed, const Standard_Boolean HasFirst, const Standard_Boolean HasLast);

		/****************** AddStatusLast ******************/
		/**** md5 signature: 9df59b95ec4c6ad4a61e31770913147d ****/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "No available documentation.

Parameters
----------
HasLast: bool

Returns
-------
None
") AddStatusLast;
		void AddStatusLast(const Standard_Boolean HasLast);

		/****************** AddStatusLast ******************/
		/**** md5 signature: 9af95226c154f17c39d5609cdec7266e ****/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "No available documentation.

Parameters
----------
HasLast: bool
Index: int
P: IntSurf_PathPoint

Returns
-------
None
") AddStatusLast;
		void AddStatusLast(const Standard_Boolean HasLast, const Standard_Integer Index, const IntSurf_PathPoint & P);

		/****************** Cut ******************/
		/**** md5 signature: f0e9f7dd0e1c0316cdc67bc759be51c9 ****/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "Cut the line at the point of rank index.

Parameters
----------
Index: int

Returns
-------
None
") Cut;
		void Cut(const Standard_Integer Index);

		/****************** FirstPoint ******************/
		/**** md5 signature: e0c1dbe8c28165db2dbe2ecf721fcc02 ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first point of the line when it is a marching point. an exception is raised if hasfirstpoint returns false.

Returns
-------
IntSurf_PathPoint
") FirstPoint;
		const IntSurf_PathPoint & FirstPoint();

		/****************** FirstPointIndex ******************/
		/**** md5 signature: 286ccb2e16a94010c49f690b00f54ac3 ****/
		%feature("compactdefaultargs") FirstPointIndex;
		%feature("autodoc", "Returns the index of first point of the line when it is a marching point.this index is the index in the pointstartiterator. an exception is raised if hasfirstpoint returns false.

Returns
-------
int
") FirstPointIndex;
		Standard_Integer FirstPointIndex();

		/****************** HasFirstPoint ******************/
		/**** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if the first point of the line is a marching point . when is hasfirstpoint==false ,the line begins on the natural bound of the surface.the line can be too long.

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		/**** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ****/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if the end point of the line is a marching point (point from intws). when is hasfirstpoint==false ,the line ends on the natural bound of the surface.the line can be too long.

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** IsClosed ******************/
		/**** md5 signature: 29709d02fadc9fcb79a766bc9679271b ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the line is closed.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsTangentAtBegining ******************/
		/**** md5 signature: a56d1f9469c98eadc8b6f319bc216c7b ****/
		%feature("compactdefaultargs") IsTangentAtBegining;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangentAtBegining;
		Standard_Boolean IsTangentAtBegining();

		/****************** IsTangentAtEnd ******************/
		/**** md5 signature: 105311500b205bba41fd4ab317165070 ****/
		%feature("compactdefaultargs") IsTangentAtEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangentAtEnd;
		Standard_Boolean IsTangentAtEnd();

		/****************** LastPoint ******************/
		/**** md5 signature: 7876841b5cf564c633cdd87a1ac1e722 ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the last point of the line when it is a marching point. an exception is raised if haslastpoint returns false.

Returns
-------
IntSurf_PathPoint
") LastPoint;
		const IntSurf_PathPoint & LastPoint();

		/****************** LastPointIndex ******************/
		/**** md5 signature: 03702a2b3ccf8f424cd597daef257efb ****/
		%feature("compactdefaultargs") LastPointIndex;
		%feature("autodoc", "Returns the index of last point of the line when it is a marching point.this index is the index in the pointstartiterator. an exception is raised if haslastpoint returns false.

Returns
-------
int
") LastPointIndex;
		Standard_Integer LastPointIndex();

		/****************** Line ******************/
		/**** md5 signature: d5c2cd917d9e773fdb8b23c68d6a1fdc ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the lineon2s contained in the walking line.

Returns
-------
opencascade::handle<IntSurf_LineOn2S>
") Line;
		const opencascade::handle<IntSurf_LineOn2S> & Line();

		/****************** NbPassingPoint ******************/
		/**** md5 signature: d0f6265bbd27e7d9360e0b1105cff054 ****/
		%feature("compactdefaultargs") NbPassingPoint;
		%feature("autodoc", "Returns the number of points belonging to pnts1 which are passing point.

Returns
-------
int
") NbPassingPoint;
		Standard_Integer NbPassingPoint();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points of the line (including first point and end point : see haslastpoint and hasfirstpoint).

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** PassingPoint ******************/
		/**** md5 signature: 1ecf07ef770669b4329e847aa98917ae ****/
		%feature("compactdefaultargs") PassingPoint;
		%feature("autodoc", "Returns the index of the point belonging to the line which is associated to the passing point belonging to pnts1 an exception is raised if index > nbpassingpoint().

Parameters
----------
Index: int

Returns
-------
IndexLine: int
IndexPnts: int
") PassingPoint;
		void PassingPoint(const Standard_Integer Index, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Reverse ******************/
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverse the points in the line. hasfirst, haslast are kept.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** SetTangencyAtBegining ******************/
		/**** md5 signature: ea533706f2c44ba6eebb50b37aa11bce ****/
		%feature("compactdefaultargs") SetTangencyAtBegining;
		%feature("autodoc", "No available documentation.

Parameters
----------
IsTangent: bool

Returns
-------
None
") SetTangencyAtBegining;
		void SetTangencyAtBegining(const Standard_Boolean IsTangent);

		/****************** SetTangencyAtEnd ******************/
		/**** md5 signature: e69c7af21e7cb5c30f8431e2a8de655b ****/
		%feature("compactdefaultargs") SetTangencyAtEnd;
		%feature("autodoc", "No available documentation.

Parameters
----------
IsTangent: bool

Returns
-------
None
") SetTangencyAtEnd;
		void SetTangencyAtEnd(const Standard_Boolean IsTangent);

		/****************** SetTangentVector ******************/
		/**** md5 signature: 0e32ea065ed79437c3090e852108262e ****/
		%feature("compactdefaultargs") SetTangentVector;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec
Index: int

Returns
-------
None
") SetTangentVector;
		void SetTangentVector(const gp_Vec & V, const Standard_Integer Index);

		/****************** TangentVector ******************/
		/**** md5 signature: e2d9d7aae22a66c0f8d3bfaf92d891c0 ****/
		%feature("compactdefaultargs") TangentVector;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Index: int
") TangentVector;
		const gp_Vec TangentVector(Standard_Integer &OutValue);

		/****************** Value ******************/
		/**** md5 signature: 8dd9e41f579d9d6e26d29bbd4f60e2b9 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point of range index. if index <= 0 or index > nbpoints, an exception is raised.

Parameters
----------
Index: int

Returns
-------
IntSurf_PntOn2S
") Value;
		const IntSurf_PntOn2S & Value(const Standard_Integer Index);

};


%make_alias(IntPatch_TheIWLineOfTheIWalking)

%extend IntPatch_TheIWLineOfTheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntPatch_TheIWalking *
*****************************/
class IntPatch_TheIWalking {
	public:
		/****************** IntPatch_TheIWalking ******************/
		/**** md5 signature: 6f94467f9684116584972e1e886af7fd ****/
		%feature("compactdefaultargs") IntPatch_TheIWalking;
		%feature("autodoc", "Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. step is the maximum increment admitted between two consecutive points (in 2d space). epsilon is the tolerance beyond which 2 points are confused. thetofillholes is the flag defining whether possible holes between resulting curves are filled or not in case of intpatch walking thetofillholes is false.

Parameters
----------
Epsilon: float
Deflection: float
Step: float
theToFillHoles: bool,optional
	default value is Standard_False

Returns
-------
None
") IntPatch_TheIWalking;
		 IntPatch_TheIWalking(const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Step, const Standard_Boolean theToFillHoles = Standard_False);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the calculus was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbLines ******************/
		/**** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ****/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the number of resulting polylines. an exception is raised if isdone returns false.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NbSinglePnts ******************/
		/**** md5 signature: 8a33644475ee84e2750fa4624ebcf8c0 ****/
		%feature("compactdefaultargs") NbSinglePnts;
		%feature("autodoc", "Returns the number of points belonging to pnts on which no line starts or ends. an exception is raised if isdone returns false.

Returns
-------
int
") NbSinglePnts;
		Standard_Integer NbSinglePnts();

		/****************** Perform ******************/
		/**** md5 signature: cad6b6480b175ccf3db399e002a8bc41 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Searches a set of polylines starting on a point of pnts1 or pnts2. each point on a resulting polyline verifies f(u,v)=0.

Parameters
----------
Pnts1: IntSurf_SequenceOfPathPoint
Pnts2: IntSurf_SequenceOfInteriorPoint
Func: IntPatch_TheSurfFunction
S: Adaptor3d_HSurface
Reversed: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const IntSurf_SequenceOfPathPoint & Pnts1, const IntSurf_SequenceOfInteriorPoint & Pnts2, IntPatch_TheSurfFunction & Func, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Boolean Reversed = Standard_False);

		/****************** Perform ******************/
		/**** md5 signature: 417a602969992161139e6761e3da7fe2 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Searches a set of polylines starting on a point of pnts1. each point on a resulting polyline verifies f(u,v)=0.

Parameters
----------
Pnts1: IntSurf_SequenceOfPathPoint
Func: IntPatch_TheSurfFunction
S: Adaptor3d_HSurface
Reversed: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const IntSurf_SequenceOfPathPoint & Pnts1, IntPatch_TheSurfFunction & Func, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Boolean Reversed = Standard_False);

		/****************** SetTolerance ******************/
		/**** md5 signature: 081b0efb39976d786ea1e8e9992511b4 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. step is the maximum increment admitted between two consecutive points (in 2d space). epsilon is the tolerance beyond which 2 points are confused.

Parameters
----------
Epsilon: float
Deflection: float
Step: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Step);

		/****************** SinglePnt ******************/
		/**** md5 signature: 6dd92e40051e4e916aa83e976db4a997 ****/
		%feature("compactdefaultargs") SinglePnt;
		%feature("autodoc", "Returns the point of range index . an exception is raised if isdone returns false. an exception is raised if index<=0 or index > nbsinglepnts.

Parameters
----------
Index: int

Returns
-------
IntSurf_PathPoint
") SinglePnt;
		const IntSurf_PathPoint & SinglePnt(const Standard_Integer Index);

		/****************** Value ******************/
		/**** md5 signature: eaff6613753683678464590adc4e2ab3 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the polyline of range index. an exception is raised if isdone is false. an exception is raised if index<=0 or index>nblines.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IntPatch_TheIWLineOfTheIWalking>
") Value;
		const opencascade::handle<IntPatch_TheIWLineOfTheIWalking> & Value(const Standard_Integer Index);

};


%extend IntPatch_TheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class IntPatch_ThePathPointOfTheSOnBounds *
********************************************/
class IntPatch_ThePathPointOfTheSOnBounds {
	public:
		/****************** IntPatch_ThePathPointOfTheSOnBounds ******************/
		/**** md5 signature: 950e45efbf1ebe13417c7e23de45ae8a ****/
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds();

		/****************** IntPatch_ThePathPointOfTheSOnBounds ******************/
		/**** md5 signature: 53b1fd7ac46ee97ab640f5cb3316120b ****/
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Tol: float
V: Adaptor3d_HVertex
A: Adaptor2d_HCurve2d
Parameter: float

Returns
-------
None
") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Parameter);

		/****************** IntPatch_ThePathPointOfTheSOnBounds ******************/
		/**** md5 signature: 6245cbc7b4dfb008d2e7c677945fb140 ****/
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Tol: float
A: Adaptor2d_HCurve2d
Parameter: float

Returns
-------
None
") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Parameter);

		/****************** Arc ******************/
		/**** md5 signature: b2e2a2b000ebbda9cef9186aeead5385 ****/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc();

		/****************** IsNew ******************/
		/**** md5 signature: 3a3a8bc6ebd2fc2c25f224ff9e99af70 ****/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsNew;
		Standard_Boolean IsNew();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** SetValue ******************/
		/**** md5 signature: afb7aa5124d314f5c392641b53c1d492 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Tol: float
V: Adaptor3d_HVertex
A: Adaptor2d_HCurve2d
Parameter: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Parameter);

		/****************** SetValue ******************/
		/**** md5 signature: 703f4ebe5bc0f77377a3392165fd60e0 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Tol: float
A: Adaptor2d_HCurve2d
Parameter: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Parameter);

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** Vertex ******************/
		/**** md5 signature: 7213fb18dc3be1f48818ab739bb98dfa ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HVertex>
") Vertex;
		const opencascade::handle<Adaptor3d_HVertex> & Vertex();

};


%extend IntPatch_ThePathPointOfTheSOnBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IntPatch_TheSOnBounds *
******************************/
class IntPatch_TheSOnBounds {
	public:
		/****************** IntPatch_TheSOnBounds ******************/
		/**** md5 signature: 35ed78ed5dc90e5bd58bf2c0beb9f5c1 ****/
		%feature("compactdefaultargs") IntPatch_TheSOnBounds;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntPatch_TheSOnBounds;
		 IntPatch_TheSOnBounds();

		/****************** AllArcSolution ******************/
		/**** md5 signature: fd074d16584452fef4f16b506eae3de1 ****/
		%feature("compactdefaultargs") AllArcSolution;
		%feature("autodoc", "Returns true if all arc of the arcs are solution (inside the surface). an exception is raised if isdone returns false.

Returns
-------
bool
") AllArcSolution;
		Standard_Boolean AllArcSolution();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the calculus was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of resulting points. an exception is raised if isdone returns false (notdone).

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		/**** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of the resulting segments. an exception is raised if isdone returns false (notdone).

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** Perform ******************/
		/**** md5 signature: f1a389776ccbaa0d15b4ffb273c416d3 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Algorithm to find the points and parts of curves of domain (domain of of restriction of a surface) which verify f = 0. tolboundary defines if a curve is on q. toltangency defines if a point is on q.

Parameters
----------
F: IntPatch_ArcFunction
Domain: Adaptor3d_TopolTool
TolBoundary: float
TolTangency: float
RecheckOnRegularity: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(IntPatch_ArcFunction & F, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const Standard_Real TolBoundary, const Standard_Real TolTangency, const Standard_Boolean RecheckOnRegularity = Standard_False);

		/****************** Point ******************/
		/**** md5 signature: ff9c6059b609788e3ae3b35c70d8a120 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the resulting point of range index. the exception notdone is raised if isdone() returns false. the exception outofrange is raised if index <= 0 or index > nbpoints.

Parameters
----------
Index: int

Returns
-------
IntPatch_ThePathPointOfTheSOnBounds
") Point;
		const IntPatch_ThePathPointOfTheSOnBounds & Point(const Standard_Integer Index);

		/****************** Segment ******************/
		/**** md5 signature: 582451d247e2ffd669ea7baa5a82f527 ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns the resulting segment of range index. the exception notdone is raised if isdone() returns false. the exception outofrange is raised if index <= 0 or index > nbpoints.

Parameters
----------
Index: int

Returns
-------
IntPatch_TheSegmentOfTheSOnBounds
") Segment;
		const IntPatch_TheSegmentOfTheSOnBounds & Segment(const Standard_Integer Index);

};


%extend IntPatch_TheSOnBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IntPatch_TheSearchInside *
*********************************/
class IntPatch_TheSearchInside {
	public:
		/****************** IntPatch_TheSearchInside ******************/
		/**** md5 signature: 3b61b92a1141071fba4f10fc8dd2190d ****/
		%feature("compactdefaultargs") IntPatch_TheSearchInside;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_TheSearchInside;
		 IntPatch_TheSearchInside();

		/****************** IntPatch_TheSearchInside ******************/
		/**** md5 signature: 15f6f53c7a442715dfb9ae960df54e0b ****/
		%feature("compactdefaultargs") IntPatch_TheSearchInside;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: IntPatch_TheSurfFunction
Surf: Adaptor3d_HSurface
T: Adaptor3d_TopolTool
Epsilon: float

Returns
-------
None
") IntPatch_TheSearchInside;
		 IntPatch_TheSearchInside(IntPatch_TheSurfFunction & F, const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & T, const Standard_Real Epsilon);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points. the exception notdone if raised if isdone returns false.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Perform ******************/
		/**** md5 signature: 751395fe3213952e6d5d17ee0c3c374b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: IntPatch_TheSurfFunction
Surf: Adaptor3d_HSurface
T: Adaptor3d_TopolTool
Epsilon: float

Returns
-------
None
") Perform;
		void Perform(IntPatch_TheSurfFunction & F, const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & T, const Standard_Real Epsilon);

		/****************** Perform ******************/
		/**** md5 signature: 8e4ae13144ab4b8fb5c388cf1c9637fc ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: IntPatch_TheSurfFunction
Surf: Adaptor3d_HSurface
UStart: float
VStart: float

Returns
-------
None
") Perform;
		void Perform(IntPatch_TheSurfFunction & F, const opencascade::handle<Adaptor3d_HSurface> & Surf, const Standard_Real UStart, const Standard_Real VStart);

		/****************** Value ******************/
		/**** md5 signature: 32b603bd5d3112334230c3e7fbb789a7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point of range index. the exception notdone if raised if isdone returns false. the exception outofrange if raised if index <= 0 or index > nbpoints.

Parameters
----------
Index: int

Returns
-------
IntSurf_InteriorPoint
") Value;
		const IntSurf_InteriorPoint & Value(const Standard_Integer Index);

};


%extend IntPatch_TheSearchInside {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class IntPatch_TheSegmentOfTheSOnBounds *
******************************************/
class IntPatch_TheSegmentOfTheSOnBounds {
	public:
		/****************** IntPatch_TheSegmentOfTheSOnBounds ******************/
		/**** md5 signature: a1aa63a1b06aae0ebd5e08e7d83b3d14 ****/
		%feature("compactdefaultargs") IntPatch_TheSegmentOfTheSOnBounds;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntPatch_TheSegmentOfTheSOnBounds;
		 IntPatch_TheSegmentOfTheSOnBounds();

		/****************** Curve ******************/
		/**** md5 signature: f5519de5cf0d739f28ebd5b0ec724522 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the geometric curve on the surface 's domain which is solution.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Curve;
		const opencascade::handle<Adaptor2d_HCurve2d> & Curve();

		/****************** FirstPoint ******************/
		/**** md5 signature: 04ae1a5baa94ab3c05537203f1b7c1f4 ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first point.

Returns
-------
IntPatch_ThePathPointOfTheSOnBounds
") FirstPoint;
		const IntPatch_ThePathPointOfTheSOnBounds & FirstPoint();

		/****************** HasFirstPoint ******************/
		/**** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if there is a vertex (thepathpoint) defining the lowest valid parameter on the arc.

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		/**** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ****/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if there is a vertex (thepathpoint) defining the greatest valid parameter on the arc.

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** LastPoint ******************/
		/**** md5 signature: 8b2eedd3d014003b00e96501ee48e8db ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the last point.

Returns
-------
IntPatch_ThePathPointOfTheSOnBounds
") LastPoint;
		const IntPatch_ThePathPointOfTheSOnBounds & LastPoint();

		/****************** SetLimitPoint ******************/
		/**** md5 signature: 5d976ff1fe4e523ed518edb448dc6859 ****/
		%feature("compactdefaultargs") SetLimitPoint;
		%feature("autodoc", "Defines the first point or the last point, depending on the value of the boolean first.

Parameters
----------
V: IntPatch_ThePathPointOfTheSOnBounds
First: bool

Returns
-------
None
") SetLimitPoint;
		void SetLimitPoint(const IntPatch_ThePathPointOfTheSOnBounds & V, const Standard_Boolean First);

		/****************** SetValue ******************/
		/**** md5 signature: 54e9174a5a70b6567ab6ab5b478e8d12 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Defines the concerned arc.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") SetValue;
		void SetValue(const opencascade::handle<Adaptor2d_HCurve2d> & A);

};


%extend IntPatch_TheSegmentOfTheSOnBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IntPatch_TheSurfFunction *
*********************************/
class IntPatch_TheSurfFunction : public math_FunctionSetWithDerivatives {
	public:
		/****************** IntPatch_TheSurfFunction ******************/
		/**** md5 signature: 70806a35bf79fc7e6c702df06ecac7e3 ****/
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction();

		/****************** IntPatch_TheSurfFunction ******************/
		/**** md5 signature: af8f0a63b0108146caa7719a62628edd ****/
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", "No available documentation.

Parameters
----------
PS: Adaptor3d_HSurface
IS: IntSurf_Quadric

Returns
-------
None
") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction(const opencascade::handle<Adaptor3d_HSurface> & PS, const IntSurf_Quadric & IS);

		/****************** IntPatch_TheSurfFunction ******************/
		/**** md5 signature: 42bc39952a8bf10567de705f8fa66081 ****/
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", "No available documentation.

Parameters
----------
IS: IntSurf_Quadric

Returns
-------
None
") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction(const IntSurf_Quadric & IS);

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** Direction2d ******************/
		/**** md5 signature: e46e583c3b745511fb8654831bfa19d7 ****/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") Direction2d;
		const gp_Dir2d Direction2d();

		/****************** Direction3d ******************/
		/**** md5 signature: ceda05eba57d20f6f3ce262f42faf157 ****/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Direction3d;
		const gp_Vec Direction3d();

		/****************** ISurface ******************/
		/**** md5 signature: 0401f703cbd4484a6014535602bb165f ****/
		%feature("compactdefaultargs") ISurface;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Quadric
") ISurface;
		const IntSurf_Quadric & ISurface();

		/****************** IsTangent ******************/
		/**** md5 signature: 52337431677eb50512a9391c1db95a81 ****/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** NbEquations ******************/
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** PSurface ******************/
		/**** md5 signature: 0a40ce1f5ad8ff1450f2b3c7ab3a7140 ****/
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") PSurface;
		const opencascade::handle<Adaptor3d_HSurface> & PSurface();

		/****************** Point ******************/
		/**** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

		/****************** Root ******************/
		/**** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ****/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** Set ******************/
		/**** md5 signature: 9ecb67ee9b893e382519f5f1648548ac ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
PS: Adaptor3d_HSurface

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor3d_HSurface> & PS);

		/****************** Set ******************/
		/**** md5 signature: 7e3e1092ebe5da1f71e965a1091893e3 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Tolerance);

		/****************** SetImplicitSurface ******************/
		/**** md5 signature: 0ad3b55688a2be8e3aa7ec9c9bcbd283 ****/
		%feature("compactdefaultargs") SetImplicitSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
IS: IntSurf_Quadric

Returns
-------
None
") SetImplicitSurface;
		void SetImplicitSurface(const IntSurf_Quadric & IS);

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the value tol so that if abs(func.root())<tol the function is considered null.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

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


%extend IntPatch_TheSurfFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntPatch_WLineTool *
***************************/
class IntPatch_WLineTool {
	public:
		/****************** ComputePurgedWLine ******************/
		/**** md5 signature: 40f54c668ad75fc77a3f4d86178f21b3 ****/
		%feature("compactdefaultargs") ComputePurgedWLine;
		%feature("autodoc", "I removes equal points (leave one of equal points) from thewline and recompute vertex parameters. //! ii removes point out of borders in case of non periodic surfaces. //! iii removes exceed points using tube criteria: delete 7d point if it lies near to expected lines in 2d and 3d. each task (2d, 2d, 3d) have its own tolerance and checked separately. //! returns new wline or null wline if the number of the points is less than 2.

Parameters
----------
theWLine: IntPatch_WLine
theS1: Adaptor3d_HSurface
theS2: Adaptor3d_HSurface
theDom1: Adaptor3d_TopolTool
theDom2: Adaptor3d_TopolTool

Returns
-------
opencascade::handle<IntPatch_WLine>
") ComputePurgedWLine;
		static opencascade::handle<IntPatch_WLine> ComputePurgedWLine(const opencascade::handle<IntPatch_WLine> & theWLine, const opencascade::handle<Adaptor3d_HSurface> & theS1, const opencascade::handle<Adaptor3d_HSurface> & theS2, const opencascade::handle<Adaptor3d_TopolTool> & theDom1, const opencascade::handle<Adaptor3d_TopolTool> & theDom2);

		/****************** ExtendTwoWLines ******************/
		/**** md5 signature: 32fe11b1ba526cde8a23f588a88d832c ****/
		%feature("compactdefaultargs") ExtendTwoWLines;
		%feature("autodoc", "Extends every line from theslin (if it is possible) to be started/finished in strictly determined point (in the place of joint of two lines). as result, some gaps between two lines will vanish. the walking lines are supposed (algorithm will do nothing for not-walking line) to be computed as a result of intersection. both thes1 and thes2 must be quadrics. other cases are not supported. thearrperiods must be filled as follows (every value must not be negative; if the surface is not periodic the period must be equal to 0.0 strictly): {<u-period of 1st surface>, <v-period of 1st surface>, <u-period of 2nd surface>, <v-period of 2nd surface>}. thelistofcriticalpoints must contain 3d-points where joining is disabled.

Parameters
----------
theSlin: IntPatch_SequenceOfLine
theS1: Adaptor3d_HSurface
theS2: Adaptor3d_HSurface
theToler3D: float
theArrPeriods: float *
theBoxS1: Bnd_Box2d
theBoxS2: Bnd_Box2d
theListOfCriticalPoints: NCollection_List<gp_Pnt>

Returns
-------
None
") ExtendTwoWLines;
		static void ExtendTwoWLines(IntPatch_SequenceOfLine & theSlin, const opencascade::handle<Adaptor3d_HSurface> & theS1, const opencascade::handle<Adaptor3d_HSurface> & theS2, const Standard_Real theToler3D, const Standard_Real * const theArrPeriods, const Bnd_Box2d & theBoxS1, const Bnd_Box2d & theBoxS2, const NCollection_List<gp_Pnt> & theListOfCriticalPoints);

		/****************** JoinWLines ******************/
		/**** md5 signature: ea577885b333cb1cc43e2b65c21692f6 ****/
		%feature("compactdefaultargs") JoinWLines;
		%feature("autodoc", "Joins all wlines from theslin to one if it is possible and records the result into theslin again. lines will be kept to be split if: a) they are separated (has no common points); b) resulted line (after joining) go through seam-edges or surface boundaries. //! in addition, if points in thespnt lies at least in one of the line in theslin, this point will be deleted.

Parameters
----------
theSlin: IntPatch_SequenceOfLine
theSPnt: IntPatch_SequenceOfPoint
theS1: Adaptor3d_HSurface
theS2: Adaptor3d_HSurface
theTol3D: float

Returns
-------
None
") JoinWLines;
		static void JoinWLines(IntPatch_SequenceOfLine & theSlin, IntPatch_SequenceOfPoint & theSPnt, opencascade::handle<Adaptor3d_HSurface > theS1, opencascade::handle<Adaptor3d_HSurface > theS2, const Standard_Real theTol3D);

};


%extend IntPatch_WLineTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntPatch_ALine *
***********************/
class IntPatch_ALine : public IntPatch_Line {
	public:
		/****************** IntPatch_ALine ******************/
		/**** md5 signature: 9010f93f8c4e698d62bb7523b8820b85 ****/
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "Creates an analytic intersection line when the transitions are in or out.

Parameters
----------
C: IntAna_Curve
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Returns
-------
None
") IntPatch_ALine;
		 IntPatch_ALine(const IntAna_Curve & C, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_ALine ******************/
		/**** md5 signature: 571e66e0ef24dae21f5212d6d8ba5d14 ****/
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "Creates an analytic intersection line when the transitions are touch.

Parameters
----------
C: IntAna_Curve
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Returns
-------
None
") IntPatch_ALine;
		 IntPatch_ALine(const IntAna_Curve & C, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****************** IntPatch_ALine ******************/
		/**** md5 signature: 9b1b615709dab30b09144f781621aaff ****/
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "Creates an analytic intersection line when the transitions are undecided.

Parameters
----------
C: IntAna_Curve
Tang: bool

Returns
-------
None
") IntPatch_ALine;
		 IntPatch_ALine(const IntAna_Curve & C, const Standard_Boolean Tang);

		/****************** AddVertex ******************/
		/**** md5 signature: 4576312baa80d87344c656c8730d3075 ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "To add a vertex in the list.

Parameters
----------
Pnt: IntPatch_Point

Returns
-------
None
") AddVertex;
		void AddVertex(const IntPatch_Point & Pnt);

		/****************** ChangeVertex ******************/
		/**** md5 signature: 02d71b47e92bf61c55ec22617897065a ****/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "Allows modifying the vertex with index theindex on the line.

Parameters
----------
theIndex: int

Returns
-------
IntPatch_Point
") ChangeVertex;
		IntPatch_Point & ChangeVertex(const Standard_Integer theIndex);

		/****************** ComputeVertexParameters ******************/
		/**** md5 signature: 77c91f07a2cb487df3310057933c84f5 ****/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.

Parameters
----------
Tol: float

Returns
-------
None
") ComputeVertexParameters;
		void ComputeVertexParameters(const Standard_Real Tol);

		/****************** Curve ******************/
		/**** md5 signature: 70d603d1367b2d334bdbbd7b0a4fd912 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
IntAna_Curve
") Curve;
		const IntAna_Curve & Curve();

		/****************** D1 ******************/
		/**** md5 signature: ba74a6b24051c3de7f090b0e159de939 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns standard_true when the derivative at parameter u is defined on the analytic intersection line. in that case, du is the derivative. returns standard_false when it is not possible to evaluate the derivative. in both cases, p is the point at parameter u on the intersection.

Parameters
----------
U: float
P: gp_Pnt
Du: gp_Vec

Returns
-------
bool
") D1;
		Standard_Boolean D1(const Standard_Real U, gp_Pnt & P, gp_Vec & Du);

		/****************** FindParameter ******************/
		/**** md5 signature: dab72e39e175512eaf3620eb76e16397 ****/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "Tries to find the parameters of the point p on the curve. if the method returns false, the 'projection' is impossible. if the method returns true at least one parameter has been found. theparams is always sorted in ascending order.

Parameters
----------
P: gp_Pnt
theParams: TColStd_ListOfReal

Returns
-------
None
") FindParameter;
		void FindParameter(const gp_Pnt & P, TColStd_ListOfReal & theParams);

		/****************** FirstParameter ******************/
		/**** md5 signature: 1cbadcff1f685cbfc099ecc8fcd9ea27 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the first parameter on the intersection line. if isincluded returns true, value and d1 methods can be call with a parameter equal to firstparamater. otherwise, the parameter must be greater than firstparameter.

Parameters
----------

Returns
-------
IsIncluded: bool
") FirstParameter;
		Standard_Real FirstParameter(Standard_Boolean &OutValue);

		/****************** FirstPoint ******************/
		/**** md5 signature: a9cf472622afe53ffedbf93049e1ae87 ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the intpoint corresponding to the firstpoint. an exception is raised when hasfirstpoint returns false.

Returns
-------
IntPatch_Point
") FirstPoint;
		const IntPatch_Point & FirstPoint();

		/****************** HasFirstPoint ******************/
		/**** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if the line has a known first point. this point is given by the method firstpoint().

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		/**** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ****/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if the line has a known last point. this point is given by the method lastpoint().

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** LastParameter ******************/
		/**** md5 signature: 3ecbcdc3f6497c567ff2f9adb0493aed ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the last parameter on the intersection line. if isincluded returns true, value and d1 methods can be call with a parameter equal to lastparamater. otherwise, the parameter must be less than lastparameter.

Parameters
----------

Returns
-------
IsIncluded: bool
") LastParameter;
		Standard_Real LastParameter(Standard_Boolean &OutValue);

		/****************** LastPoint ******************/
		/**** md5 signature: f1c788d8502e367e84924ee37d5745d2 ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the intpoint corresponding to the lastpoint. an exception is raised when haslastpoint returns false.

Returns
-------
IntPatch_Point
") LastPoint;
		const IntPatch_Point & LastPoint();

		/****************** NbVertex ******************/
		/**** md5 signature: b2d226bac64a106c7941ef45ff4e07f1 ****/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVertex;
		Standard_Integer NbVertex();

		/****************** Replace ******************/
		/**** md5 signature: 26f627e400d5ec4fd796489f34c68a92 ****/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replaces the element of range index in the list of points.

Parameters
----------
Index: int
Pnt: IntPatch_Point

Returns
-------
None
") Replace;
		void Replace(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****************** SetFirstPoint ******************/
		/**** md5 signature: 25fa45b5d9bd6687fb9b3e0c731bb2c5 ****/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndFirst: int

Returns
-------
None
") SetFirstPoint;
		void SetFirstPoint(const Standard_Integer IndFirst);

		/****************** SetLastPoint ******************/
		/**** md5 signature: e92f18b207577df6b281f4b27f093c31 ****/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndLast: int

Returns
-------
None
") SetLastPoint;
		void SetLastPoint(const Standard_Integer IndLast);

		/****************** Value ******************/
		/**** md5 signature: a9175f1b48e8e645db80a520f3e4e7b9 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point of parameter u on the analytic intersection line.

Parameters
----------
U: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real U);

		/****************** Vertex ******************/
		/**** md5 signature: f9aa0b5079416f21b4a58d4398d2657e ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the vertex of range index on the line.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") Vertex;
		const IntPatch_Point & Vertex(const Standard_Integer Index);

};


%make_alias(IntPatch_ALine)

%extend IntPatch_ALine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntPatch_GLine *
***********************/
class IntPatch_GLine : public IntPatch_Line {
	public:
		/****************** IntPatch_GLine ******************/
		/**** md5 signature: cee0fcb79d8ec8c0385770c29c4b2931 ****/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a line as intersection line when the transitions are in or out.

Parameters
----------
L: gp_Lin
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Lin & L, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_GLine ******************/
		/**** md5 signature: d6edb6ee8ca225bcca4c0697bfc4208d ****/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a line as intersection line when the transitions are touch.

Parameters
----------
L: gp_Lin
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Lin & L, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****************** IntPatch_GLine ******************/
		/**** md5 signature: 63fa5a02a355e9f6a27245fa94bc6c1d ****/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a line as intersection line when the transitions are undecided.

Parameters
----------
L: gp_Lin
Tang: bool

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Lin & L, const Standard_Boolean Tang);

		/****************** IntPatch_GLine ******************/
		/**** md5 signature: 0300931498617ce1be00cbed11578735 ****/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a circle as intersection line when the transitions are in or out.

Parameters
----------
C: gp_Circ
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Circ & C, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_GLine ******************/
		/**** md5 signature: 807601abc0604326fec764e246f8fa12 ****/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a circle as intersection line when the transitions are touch.

Parameters
----------
C: gp_Circ
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Circ & C, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****************** IntPatch_GLine ******************/
		/**** md5 signature: 69870093fcf25b4b4b2d8ec25eb6cea4 ****/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a circle as intersection line when the transitions are undecided.

Parameters
----------
C: gp_Circ
Tang: bool

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Circ & C, const Standard_Boolean Tang);

		/****************** IntPatch_GLine ******************/
		/**** md5 signature: 2778cdac18226c2f39966574508f7e80 ****/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates an ellipse as intersection line when the transitions are in or out.

Parameters
----------
E: gp_Elips
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Elips & E, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_GLine ******************/
		/**** md5 signature: 4af53faedffea99bf074576d3cb431d8 ****/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates an ellispe as intersection line when the transitions are touch.

Parameters
----------
E: gp_Elips
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Elips & E, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****************** IntPatch_GLine ******************/
		/**** md5 signature: 0826d594e29e4665070255413f6fd851 ****/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates an ellipse as intersection line when the transitions are undecided.

Parameters
----------
E: gp_Elips
Tang: bool

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Elips & E, const Standard_Boolean Tang);

		/****************** IntPatch_GLine ******************/
		/**** md5 signature: f0a5eb49cee40837a0487507ddf0eb94 ****/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a parabola as intersection line when the transitions are in or out.

Parameters
----------
P: gp_Parab
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Parab & P, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_GLine ******************/
		/**** md5 signature: b381d5912911ecff277552d3e4f781af ****/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a parabola as intersection line when the transitions are touch.

Parameters
----------
P: gp_Parab
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Parab & P, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****************** IntPatch_GLine ******************/
		/**** md5 signature: c456d7449b6cada23c52beaf2155c2fd ****/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a parabola as intersection line when the transitions are undecided.

Parameters
----------
P: gp_Parab
Tang: bool

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Parab & P, const Standard_Boolean Tang);

		/****************** IntPatch_GLine ******************/
		/**** md5 signature: 374dd2610a878442d4661568daa57537 ****/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates an hyperbola as intersection line when the transitions are in or out.

Parameters
----------
H: gp_Hypr
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Hypr & H, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_GLine ******************/
		/**** md5 signature: d02fb4628988052e518850db601c47f4 ****/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates an hyperbola as intersection line when the transitions are touch.

Parameters
----------
H: gp_Hypr
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Hypr & H, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****************** IntPatch_GLine ******************/
		/**** md5 signature: 480cd4b5b8def2abfec686c81bb2d644 ****/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates an hyperbola as intersection line when the transitions are undecided.

Parameters
----------
H: gp_Hypr
Tang: bool

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Hypr & H, const Standard_Boolean Tang);

		/****************** AddVertex ******************/
		/**** md5 signature: 4576312baa80d87344c656c8730d3075 ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "To add a vertex in the list.

Parameters
----------
Pnt: IntPatch_Point

Returns
-------
None
") AddVertex;
		void AddVertex(const IntPatch_Point & Pnt);

		/****************** Circle ******************/
		/**** md5 signature: cab8b08988d177bd7107adbbccc4ef89 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Returns the circ from gp corrsponding to the intersection when arctype returns intpatch_circle.

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle();

		/****************** ComputeVertexParameters ******************/
		/**** md5 signature: 77c91f07a2cb487df3310057933c84f5 ****/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.

Parameters
----------
Tol: float

Returns
-------
None
") ComputeVertexParameters;
		void ComputeVertexParameters(const Standard_Real Tol);

		/****************** Ellipse ******************/
		/**** md5 signature: b6da2657e61960166cfe0f18dac79c1f ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Returns the elips from gp corrsponding to the intersection when arctype returns intpatch_ellipse.

Returns
-------
gp_Elips
") Ellipse;
		gp_Elips Ellipse();

		/****************** FirstPoint ******************/
		/**** md5 signature: a9cf472622afe53ffedbf93049e1ae87 ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the intpoint corresponding to the firstpoint. an exception is raised when hasfirstpoint returns false.

Returns
-------
IntPatch_Point
") FirstPoint;
		const IntPatch_Point & FirstPoint();

		/****************** HasFirstPoint ******************/
		/**** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if the line has a known first point. this point is given by the method firstpoint().

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		/**** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ****/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if the line has a known last point. this point is given by the method lastpoint().

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** Hyperbola ******************/
		/**** md5 signature: 766d3e1ddfb79a4ee7d6daea9d3565cd ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Returns the hypr from gp corrsponding to the intersection when arctype returns intpatch_hyperbola.

Returns
-------
gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola();

		/****************** LastPoint ******************/
		/**** md5 signature: f1c788d8502e367e84924ee37d5745d2 ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the intpoint corresponding to the lastpoint. an exception is raised when haslastpoint returns false.

Returns
-------
IntPatch_Point
") LastPoint;
		const IntPatch_Point & LastPoint();

		/****************** Line ******************/
		/**** md5 signature: 63e1fa189ca3bcfdb401241217a93bfb ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the lin from gp corresponding to the intersection when arctype returns intpatch_line.

Returns
-------
gp_Lin
") Line;
		gp_Lin Line();

		/****************** NbVertex ******************/
		/**** md5 signature: b2d226bac64a106c7941ef45ff4e07f1 ****/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVertex;
		Standard_Integer NbVertex();

		/****************** Parabola ******************/
		/**** md5 signature: 44bd09c360bea3d33e8c3aa19668649c ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Returns the parab from gp corrsponding to the intersection when arctype returns intpatch_parabola.

Returns
-------
gp_Parab
") Parabola;
		gp_Parab Parabola();

		/****************** Replace ******************/
		/**** md5 signature: 26f627e400d5ec4fd796489f34c68a92 ****/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "To replace the element of range index in the list of points.

Parameters
----------
Index: int
Pnt: IntPatch_Point

Returns
-------
None
") Replace;
		void Replace(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****************** SetFirstPoint ******************/
		/**** md5 signature: 25fa45b5d9bd6687fb9b3e0c731bb2c5 ****/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndFirst: int

Returns
-------
None
") SetFirstPoint;
		void SetFirstPoint(const Standard_Integer IndFirst);

		/****************** SetLastPoint ******************/
		/**** md5 signature: e92f18b207577df6b281f4b27f093c31 ****/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndLast: int

Returns
-------
None
") SetLastPoint;
		void SetLastPoint(const Standard_Integer IndLast);

		/****************** Vertex ******************/
		/**** md5 signature: f9aa0b5079416f21b4a58d4398d2657e ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the vertex of range index on the line.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") Vertex;
		const IntPatch_Point & Vertex(const Standard_Integer Index);

};


%make_alias(IntPatch_GLine)

%extend IntPatch_GLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntPatch_PointLine *
***************************/
%nodefaultctor IntPatch_PointLine;
class IntPatch_PointLine : public IntPatch_Line {
	public:
		/****************** AddVertex ******************/
		/**** md5 signature: 55529d1530ffb71aa077a7f37a458483 ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertex in the list. if theisprepend == true the new vertex will be added before the first element of vertices sequence. otherwise, to the end of the sequence.

Parameters
----------
Pnt: IntPatch_Point
theIsPrepend: bool,optional
	default value is Standard_False

Returns
-------
None
") AddVertex;
		virtual void AddVertex(const IntPatch_Point & Pnt, const Standard_Boolean theIsPrepend = Standard_False);

		/****************** ChangeVertex ******************/
		/**** md5 signature: 0817fe5027f9e400d6b1cb56fa0520ec ****/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "Returns the vertex of range index on the line.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") ChangeVertex;
		virtual IntPatch_Point & ChangeVertex(const Standard_Integer Index);

		/****************** ClearVertexes ******************/
		/**** md5 signature: e553b210f8fd2c05d701b415328660d6 ****/
		%feature("compactdefaultargs") ClearVertexes;
		%feature("autodoc", "Removes vertices from the line.

Returns
-------
None
") ClearVertexes;
		virtual void ClearVertexes();

		/****************** CurvatureRadiusOfIntersLine ******************/
		/**** md5 signature: 958e1c4af766e468e662580b09eb25a8 ****/
		%feature("compactdefaultargs") CurvatureRadiusOfIntersLine;
		%feature("autodoc", "Returns the radius of curvature of the intersection line in given point. returns negative value if computation is not possible.

Parameters
----------
theS1: Adaptor3d_HSurface
theS2: Adaptor3d_HSurface
theUVPoint: IntSurf_PntOn2S

Returns
-------
float
") CurvatureRadiusOfIntersLine;
		static Standard_Real CurvatureRadiusOfIntersLine(const opencascade::handle<Adaptor3d_HSurface> & theS1, const opencascade::handle<Adaptor3d_HSurface> & theS2, const IntSurf_PntOn2S & theUVPoint);

		/****************** Curve ******************/
		/**** md5 signature: fd1c616d11a26155c96378983fd082eb ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns set of intersection points.

Returns
-------
opencascade::handle<IntSurf_LineOn2S>
") Curve;
		virtual opencascade::handle<IntSurf_LineOn2S> Curve();

		/****************** IsOutBox ******************/
		/**** md5 signature: ac73c0eb3228f5b54eb6f00873ef9985 ****/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "Returns true if p is out of the box built from 3d-points.

Parameters
----------
P: gp_Pnt

Returns
-------
bool
") IsOutBox;
		virtual Standard_Boolean IsOutBox(const gp_Pnt & P);

		/****************** IsOutSurf1Box ******************/
		/**** md5 signature: 6c738336718e5dceea69c92ad3423c6d ****/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "Returns true if p1 is out of the box built from the points on 1st surface.

Parameters
----------
P1: gp_Pnt2d

Returns
-------
bool
") IsOutSurf1Box;
		virtual Standard_Boolean IsOutSurf1Box(const gp_Pnt2d & P1);

		/****************** IsOutSurf2Box ******************/
		/**** md5 signature: efbf01679be78d99442a6da31833da91 ****/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "Returns true if p2 is out of the box built from the points on 2nd surface.

Parameters
----------
P2: gp_Pnt2d

Returns
-------
bool
") IsOutSurf2Box;
		virtual Standard_Boolean IsOutSurf2Box(const gp_Pnt2d & P2);

		/****************** NbPnts ******************/
		/**** md5 signature: c5514ce0e6327bd31ea1966935900a95 ****/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Returns the number of intersection points.

Returns
-------
int
") NbPnts;
		virtual Standard_Integer NbPnts();

		/****************** NbVertex ******************/
		/**** md5 signature: dc10ac56e6d323bf20c133e93ae395c2 ****/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Returns number of vertices (intpatch_point) of the line.

Returns
-------
int
") NbVertex;
		virtual Standard_Integer NbVertex();

		/****************** Point ******************/
		/**** md5 signature: dc729d221ade3b0d9d552601988516c8 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point of range index.

Parameters
----------
Index: int

Returns
-------
IntSurf_PntOn2S
") Point;
		virtual const IntSurf_PntOn2S & Point(const Standard_Integer Index);

		/****************** RemoveVertex ******************/
		/**** md5 signature: 3022c4df19172007ce6a2e59e9384369 ****/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "Removes single vertex from the line.

Parameters
----------
theIndex: int

Returns
-------
None
") RemoveVertex;
		virtual void RemoveVertex(const Standard_Integer theIndex);

		/****************** Vertex ******************/
		/**** md5 signature: bd5ed6f12cf05dc5205d92f5b9da74da ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the vertex of range index on the line.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") Vertex;
		virtual const IntPatch_Point & Vertex(const Standard_Integer Index);

};


%make_alias(IntPatch_PointLine)

%extend IntPatch_PointLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class IntPatch_PolyArc *
*************************/
class IntPatch_PolyArc : public IntPatch_Polygo {
	public:
		/****************** IntPatch_PolyArc ******************/
		/**** md5 signature: c29c75611958c60b3dd6fbf969b9303e ****/
		%feature("compactdefaultargs") IntPatch_PolyArc;
		%feature("autodoc", "Creates the polygon of the arc a on the surface s. the arc is limited by the parameters pfirst and plast. none of these parameters can be infinite.

Parameters
----------
A: Adaptor2d_HCurve2d
NbSample: int
Pfirst: float
Plast: float
BoxOtherPolygon: Bnd_Box2d

Returns
-------
None
") IntPatch_PolyArc;
		 IntPatch_PolyArc(const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Integer NbSample, const Standard_Real Pfirst, const Standard_Real Plast, const Bnd_Box2d & BoxOtherPolygon);

		/****************** Closed ******************/
		/**** md5 signature: d59fdedf4c3161ce15be68a68c704b63 ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Closed;
		virtual Standard_Boolean Closed();

		/****************** NbPoints ******************/
		/**** md5 signature: 3e3d3343473673427df8cf1f8a38ad57 ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Parameter ******************/
		/**** md5 signature: 82ceab80f2b18ab921fa91f907001d9f ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const Standard_Integer Index);

		/****************** Point ******************/
		/**** md5 signature: 4c06f92dbe0eb485c456f37c7e794ace ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
gp_Pnt2d
") Point;
		gp_Pnt2d Point(const Standard_Integer Index);

		/****************** SetOffset ******************/
		/**** md5 signature: 15728cf6068c3aed0a1524961cca7295 ****/
		%feature("compactdefaultargs") SetOffset;
		%feature("autodoc", "No available documentation.

Parameters
----------
OffsetX: float
OffsetY: float

Returns
-------
None
") SetOffset;
		void SetOffset(const Standard_Real OffsetX, const Standard_Real OffsetY);

};


%extend IntPatch_PolyArc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IntPatch_PolyLine *
**************************/
class IntPatch_PolyLine : public IntPatch_Polygo {
	public:
		/****************** IntPatch_PolyLine ******************/
		/**** md5 signature: 8212f213bf80b9c977f1aa379030ec1f ****/
		%feature("compactdefaultargs") IntPatch_PolyLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_PolyLine;
		 IntPatch_PolyLine();

		/****************** IntPatch_PolyLine ******************/
		/**** md5 signature: acc134664e751cd2230d541e5f2b089f ****/
		%feature("compactdefaultargs") IntPatch_PolyLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
InitDefle: float

Returns
-------
None
") IntPatch_PolyLine;
		 IntPatch_PolyLine(const Standard_Real InitDefle);

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		/**** md5 signature: dfa31b44e58975a6577c15284df2704c ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
gp_Pnt2d
") Point;
		gp_Pnt2d Point(const Standard_Integer Index);

		/****************** ResetError ******************/
		/**** md5 signature: 4d627cbc12d8ebadf8a1332c52bcc8f0 ****/
		%feature("compactdefaultargs") ResetError;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ResetError;
		void ResetError();

		/****************** SetRLine ******************/
		/**** md5 signature: f8272f934b6cf922209a3ba0d869d5b8 ****/
		%feature("compactdefaultargs") SetRLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
OnFirst: bool
Line: IntPatch_RLine

Returns
-------
None
") SetRLine;
		void SetRLine(const Standard_Boolean OnFirst, const opencascade::handle<IntPatch_RLine> & Line);

		/****************** SetWLine ******************/
		/**** md5 signature: 220619f38a5eea001899d134cf1ba3a9 ****/
		%feature("compactdefaultargs") SetWLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
OnFirst: bool
Line: IntPatch_WLine

Returns
-------
None
") SetWLine;
		void SetWLine(const Standard_Boolean OnFirst, const opencascade::handle<IntPatch_WLine> & Line);

};


%extend IntPatch_PolyLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntPatch_RLine *
***********************/
class IntPatch_RLine : public IntPatch_PointLine {
	public:
		/****************** IntPatch_RLine ******************/
		/**** md5 signature: 10ffd30b1811e3763803d8518450f434 ****/
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "Creates a restriction as an intersection line when the transitions are in or out.

Parameters
----------
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Returns
-------
None
") IntPatch_RLine;
		 IntPatch_RLine(const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_RLine ******************/
		/**** md5 signature: 73a9c7999f491c62a065eb84477fd2e5 ****/
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "Creates a restriction as an intersection line when the transitions are touch.

Parameters
----------
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Returns
-------
None
") IntPatch_RLine;
		 IntPatch_RLine(const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****************** IntPatch_RLine ******************/
		/**** md5 signature: 0ef410c1b9df1d0e93a141c862f8ba14 ****/
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "Creates a restriction as an intersection line when the transitions are undecided.

Parameters
----------
Tang: bool

Returns
-------
None
") IntPatch_RLine;
		 IntPatch_RLine(const Standard_Boolean Tang);

		/****************** Add ******************/
		/**** md5 signature: 05c40b60e3b887503ab9a2852dc97f60 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: IntSurf_LineOn2S

Returns
-------
None
") Add;
		void Add(const opencascade::handle<IntSurf_LineOn2S> & L);

		/****************** AddVertex ******************/
		/**** md5 signature: 7e2f16d636115984b93075ab7287900d ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertex in the list. if theisprepend == true the new vertex will be added before the first element of vertices sequence. otherwise, to the end of the sequence.

Parameters
----------
Pnt: IntPatch_Point
theIsPrepend: bool,optional
	default value is Standard_False

Returns
-------
None
") AddVertex;
		virtual void AddVertex(const IntPatch_Point & Pnt, const Standard_Boolean theIsPrepend = Standard_False);

		/****************** ArcOnS1 ******************/
		/**** md5 signature: c1826d461dcc6af4b9af182756306c57 ****/
		%feature("compactdefaultargs") ArcOnS1;
		%feature("autodoc", "Returns the concerned arc.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") ArcOnS1;
		const opencascade::handle<Adaptor2d_HCurve2d> & ArcOnS1();

		/****************** ArcOnS2 ******************/
		/**** md5 signature: 2d1e0215316a36f73794dfb2b77e51c1 ****/
		%feature("compactdefaultargs") ArcOnS2;
		%feature("autodoc", "Returns the concerned arc.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") ArcOnS2;
		const opencascade::handle<Adaptor2d_HCurve2d> & ArcOnS2();

		/****************** ChangeVertex ******************/
		/**** md5 signature: 1e83b5d9880fcd9a98f2804dd7cb6fc4 ****/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "Returns the vertex of range index on the line.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") ChangeVertex;
		virtual IntPatch_Point & ChangeVertex(const Standard_Integer Index);

		/****************** ClearVertexes ******************/
		/**** md5 signature: 8e37b31ec56631f461cdc4e1055bf6e1 ****/
		%feature("compactdefaultargs") ClearVertexes;
		%feature("autodoc", "Removes vertices from the line (i.e. cleans svtx member).

Returns
-------
None
") ClearVertexes;
		virtual void ClearVertexes();

		/****************** ComputeVertexParameters ******************/
		/**** md5 signature: 77c91f07a2cb487df3310057933c84f5 ****/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.

Parameters
----------
Tol: float

Returns
-------
None
") ComputeVertexParameters;
		void ComputeVertexParameters(const Standard_Real Tol);

		/****************** Curve ******************/
		/**** md5 signature: 00a2774cb5170e703dac6867fe8bb651 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns set of intersection points.

Returns
-------
opencascade::handle<IntSurf_LineOn2S>
") Curve;
		virtual opencascade::handle<IntSurf_LineOn2S> Curve();

		/****************** Dump ******************/
		/**** md5 signature: 02aaf609ae95c8e9a60f1190fb33839c ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "If (themode == 0) then prints the information about wline if (themode == 1) then prints the list of 3d-points if (themode == 2) then prints the list of 2d-points on the 1st surface otherwise, prints list of 2d-points on the 2nd surface.

Parameters
----------
theMode: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer theMode);

		/****************** FirstPoint ******************/
		/**** md5 signature: a9cf472622afe53ffedbf93049e1ae87 ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the intpoint corresponding to the firstpoint. an exception is raised when hasfirstpoint returns false.

Returns
-------
IntPatch_Point
") FirstPoint;
		const IntPatch_Point & FirstPoint();

		/****************** HasFirstPoint ******************/
		/**** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if the line has a known first point. this point is given by the method firstpoint().

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		/**** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ****/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if the line has a known last point. this point is given by the method lastpoint().

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** HasPolygon ******************/
		/**** md5 signature: f1b288e08ae8f62501d19cd934eaf0fd ****/
		%feature("compactdefaultargs") HasPolygon;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasPolygon;
		Standard_Boolean HasPolygon();

		/****************** IsArcOnS1 ******************/
		/**** md5 signature: 6119a53b08f37d3de8fd138a94e19614 ****/
		%feature("compactdefaultargs") IsArcOnS1;
		%feature("autodoc", "Returns true if the intersection is on the domain of the first patch. returns false if the intersection is on the domain of the second patch.

Returns
-------
bool
") IsArcOnS1;
		Standard_Boolean IsArcOnS1();

		/****************** IsArcOnS2 ******************/
		/**** md5 signature: c3922ccd61d0375ac5bbd0780008d88d ****/
		%feature("compactdefaultargs") IsArcOnS2;
		%feature("autodoc", "Returns true if the intersection is on the domain of the first patch. returns false if the intersection is on the domain of the second patch.

Returns
-------
bool
") IsArcOnS2;
		Standard_Boolean IsArcOnS2();

		/****************** IsOutBox ******************/
		/**** md5 signature: 4f6fcc13a4ffbd4a01c7bb7bcbd958a3 ****/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "Returns true if thep is out of the box built from 3d-points.

Parameters
----------
theP: gp_Pnt

Returns
-------
bool
") IsOutBox;
		virtual Standard_Boolean IsOutBox(const gp_Pnt & theP);

		/****************** IsOutSurf1Box ******************/
		/**** md5 signature: bc67542a32380859aa385c9f948a1fac ****/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "Returns true if thep is out of the box built from the points on 1st surface.

Parameters
----------
theP: gp_Pnt2d

Returns
-------
bool
") IsOutSurf1Box;
		virtual Standard_Boolean IsOutSurf1Box(const gp_Pnt2d & theP);

		/****************** IsOutSurf2Box ******************/
		/**** md5 signature: 34129bd36f4bb2710c5de5bade625438 ****/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "Returns true if thep is out of the box built from the points on 2nd surface.

Parameters
----------
theP: gp_Pnt2d

Returns
-------
bool
") IsOutSurf2Box;
		virtual Standard_Boolean IsOutSurf2Box(const gp_Pnt2d & theP);

		/****************** LastPoint ******************/
		/**** md5 signature: f1c788d8502e367e84924ee37d5745d2 ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the intpoint corresponding to the lastpoint. an exception is raised when haslastpoint returns false.

Returns
-------
IntPatch_Point
") LastPoint;
		const IntPatch_Point & LastPoint();

		/****************** NbPnts ******************/
		/**** md5 signature: 9b3bac1b760e9cf6c2af2102c55fe59f ****/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Returns the number of intersection points.

Returns
-------
int
") NbPnts;
		virtual Standard_Integer NbPnts();

		/****************** NbVertex ******************/
		/**** md5 signature: 5245ca4f7f52f7737e0d09a36f7eb3f1 ****/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Returns number of vertices (intpatch_point) of the line.

Returns
-------
int
") NbVertex;
		virtual Standard_Integer NbVertex();

		/****************** ParamOnS1 ******************/
		/**** md5 signature: 6999d11b074ba874b5b6add1b45db6be ****/
		%feature("compactdefaultargs") ParamOnS1;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
p1: float
p2: float
") ParamOnS1;
		void ParamOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParamOnS2 ******************/
		/**** md5 signature: 24623c711a2671ef020445e718fbe861 ****/
		%feature("compactdefaultargs") ParamOnS2;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
p1: float
p2: float
") ParamOnS2;
		void ParamOnS2(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Point ******************/
		/**** md5 signature: 71a4eaea066ecd2781a45257516a1d34 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point of range index.

Parameters
----------
Index: int

Returns
-------
IntSurf_PntOn2S
") Point;
		virtual const IntSurf_PntOn2S & Point(const Standard_Integer Index);

		/****************** RemoveVertex ******************/
		/**** md5 signature: 72a5feba37233a6b75ea096f48e3e8a6 ****/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "Removes single vertex from the line.

Parameters
----------
theIndex: int

Returns
-------
None
") RemoveVertex;
		virtual void RemoveVertex(const Standard_Integer theIndex);

		/****************** Replace ******************/
		/**** md5 signature: 26f627e400d5ec4fd796489f34c68a92 ****/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replaces the element of range index in the list of points.

Parameters
----------
Index: int
Pnt: IntPatch_Point

Returns
-------
None
") Replace;
		void Replace(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****************** SetArcOnS1 ******************/
		/**** md5 signature: 5911133648b11654237758516e0fa4cf ****/
		%feature("compactdefaultargs") SetArcOnS1;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") SetArcOnS1;
		void SetArcOnS1(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** SetArcOnS2 ******************/
		/**** md5 signature: fe880f7042c85049688e4dcfcc59882f ****/
		%feature("compactdefaultargs") SetArcOnS2;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") SetArcOnS2;
		void SetArcOnS2(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** SetCurve ******************/
		/**** md5 signature: bf65967bc9e019b213d3c9bd5deadd2f ****/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
theNewCurve: IntSurf_LineOn2S

Returns
-------
None
") SetCurve;
		void SetCurve(const opencascade::handle<IntSurf_LineOn2S> & theNewCurve);

		/****************** SetFirstPoint ******************/
		/**** md5 signature: 25fa45b5d9bd6687fb9b3e0c731bb2c5 ****/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndFirst: int

Returns
-------
None
") SetFirstPoint;
		void SetFirstPoint(const Standard_Integer IndFirst);

		/****************** SetLastPoint ******************/
		/**** md5 signature: e92f18b207577df6b281f4b27f093c31 ****/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndLast: int

Returns
-------
None
") SetLastPoint;
		void SetLastPoint(const Standard_Integer IndLast);

		/****************** SetPoint ******************/
		/**** md5 signature: 67660bb296fa310caa0347f4427366b9 ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Set the point of index <index> in the lineon2s.

Parameters
----------
Index: int
Pnt: IntPatch_Point

Returns
-------
None
") SetPoint;
		void SetPoint(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****************** Vertex ******************/
		/**** md5 signature: b3fd41d3f11681ff4530174231f024bd ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the vertex of range index on the line.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") Vertex;
		virtual const IntPatch_Point & Vertex(const Standard_Integer Index);

};


%make_alias(IntPatch_RLine)

%extend IntPatch_RLine {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def SetParamOnS1(self):
		pass

	@methodnotwrapped
	def SetParamOnS2(self):
		pass
	}
};

/***********************
* class IntPatch_WLine *
***********************/
class IntPatch_WLine : public IntPatch_PointLine {
	public:
/* public enums */
enum IntPatch_WLType {
	IntPatch_WLUnknown = 0,
	IntPatch_WLImpImp = 1,
	IntPatch_WLImpPrm = 2,
	IntPatch_WLPrmPrm = 3,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class IntPatch_WLType(IntEnum):
	IntPatch_WLUnknown = 0
	IntPatch_WLImpImp = 1
	IntPatch_WLImpPrm = 2
	IntPatch_WLPrmPrm = 3
IntPatch_WLUnknown = IntPatch_WLType.IntPatch_WLUnknown
IntPatch_WLImpImp = IntPatch_WLType.IntPatch_WLImpImp
IntPatch_WLImpPrm = IntPatch_WLType.IntPatch_WLImpPrm
IntPatch_WLPrmPrm = IntPatch_WLType.IntPatch_WLPrmPrm
};
/* end python proxy for enums */

		/****************** IntPatch_WLine ******************/
		/**** md5 signature: 18734a8ce1f3e284355493d9c1733d55 ****/
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "Creates a wline as an intersection when the transitions are in or out.

Parameters
----------
Line: IntSurf_LineOn2S
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Returns
-------
None
") IntPatch_WLine;
		 IntPatch_WLine(const opencascade::handle<IntSurf_LineOn2S> & Line, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_WLine ******************/
		/**** md5 signature: 0ba69fcbd0ab83bd69c04103cdb3455d ****/
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "Creates a wline as an intersection when the transitions are touch.

Parameters
----------
Line: IntSurf_LineOn2S
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Returns
-------
None
") IntPatch_WLine;
		 IntPatch_WLine(const opencascade::handle<IntSurf_LineOn2S> & Line, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****************** IntPatch_WLine ******************/
		/**** md5 signature: 336cdfde190a0d8c4b70167a260c0514 ****/
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "Creates a wline as an intersection when the transitions are undecided.

Parameters
----------
Line: IntSurf_LineOn2S
Tang: bool

Returns
-------
None
") IntPatch_WLine;
		 IntPatch_WLine(const opencascade::handle<IntSurf_LineOn2S> & Line, const Standard_Boolean Tang);

		/****************** AddVertex ******************/
		/**** md5 signature: 7e2f16d636115984b93075ab7287900d ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertex in the list. if theisprepend == true the new vertex will be added before the first element of vertices sequence. otherwise, to the end of the sequence.

Parameters
----------
Pnt: IntPatch_Point
theIsPrepend: bool,optional
	default value is Standard_False

Returns
-------
None
") AddVertex;
		virtual void AddVertex(const IntPatch_Point & Pnt, const Standard_Boolean theIsPrepend = Standard_False);

		/****************** ChangeVertex ******************/
		/**** md5 signature: 1e83b5d9880fcd9a98f2804dd7cb6fc4 ****/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "Returns the vertex of range index on the line.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") ChangeVertex;
		virtual IntPatch_Point & ChangeVertex(const Standard_Integer Index);

		/****************** ClearVertexes ******************/
		/**** md5 signature: a0144d82471d6551510ccf26edef3227 ****/
		%feature("compactdefaultargs") ClearVertexes;
		%feature("autodoc", "Removes vertices from the line (i.e. cleans svtx member).

Returns
-------
None
") ClearVertexes;
		virtual void ClearVertexes();

		/****************** ComputeVertexParameters ******************/
		/**** md5 signature: 77c91f07a2cb487df3310057933c84f5 ****/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.

Parameters
----------
Tol: float

Returns
-------
None
") ComputeVertexParameters;
		void ComputeVertexParameters(const Standard_Real Tol);

		/****************** Curve ******************/
		/**** md5 signature: 00a2774cb5170e703dac6867fe8bb651 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns set of intersection points.

Returns
-------
opencascade::handle<IntSurf_LineOn2S>
") Curve;
		virtual opencascade::handle<IntSurf_LineOn2S> Curve();

		/****************** Dump ******************/
		/**** md5 signature: 02aaf609ae95c8e9a60f1190fb33839c ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "If (themode == 0) then prints the information about wline if (themode == 1) then prints the list of 3d-points if (themode == 2) then prints the list of 2d-points on the 1st surface otherwise, prints list of 2d-points on the 2nd surface.

Parameters
----------
theMode: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer theMode);

		/****************** EnablePurging ******************/
		/**** md5 signature: 8bca7b8764264010691efedf6d63c426 ****/
		%feature("compactdefaultargs") EnablePurging;
		%feature("autodoc", "Allows or forbids purging of existing wline.

Parameters
----------
theIsEnabled: bool

Returns
-------
None
") EnablePurging;
		void EnablePurging(const Standard_Boolean theIsEnabled);

		/****************** FirstPoint ******************/
		/**** md5 signature: a9cf472622afe53ffedbf93049e1ae87 ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the point corresponding to the firstpoint.

Returns
-------
IntPatch_Point
") FirstPoint;
		const IntPatch_Point & FirstPoint();

		/****************** FirstPoint ******************/
		/**** md5 signature: 5bed348e2313cd3aea008f0896538065 ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the point corresponding to the firstpoint. indfirst is the index of the first in the list of vertices.

Parameters
----------

Returns
-------
Indfirst: int
") FirstPoint;
		const IntPatch_Point & FirstPoint(Standard_Integer &OutValue);

		/****************** GetArcOnS1 ******************/
		/**** md5 signature: 90bdf7b721f80978f64573ea9d6b6fe7 ****/
		%feature("compactdefaultargs") GetArcOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") GetArcOnS1;
		const opencascade::handle<Adaptor2d_HCurve2d> & GetArcOnS1();

		/****************** GetArcOnS2 ******************/
		/**** md5 signature: af3edb1f98adf86569f78e8fe7263057 ****/
		%feature("compactdefaultargs") GetArcOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") GetArcOnS2;
		const opencascade::handle<Adaptor2d_HCurve2d> & GetArcOnS2();

		/****************** GetCreatingWay ******************/
		/**** md5 signature: f32c6d1c4904acc2c040d4a118a49582 ****/
		%feature("compactdefaultargs") GetCreatingWay;
		%feature("autodoc", "Returns the way of <*this> creation.

Returns
-------
IntPatch_WLine::IntPatch_WLType
") GetCreatingWay;
		IntPatch_WLine::IntPatch_WLType GetCreatingWay();

		/****************** HasArcOnS1 ******************/
		/**** md5 signature: 8868354e4f346cdb153201e572da56df ****/
		%feature("compactdefaultargs") HasArcOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasArcOnS1;
		Standard_Boolean HasArcOnS1();

		/****************** HasArcOnS2 ******************/
		/**** md5 signature: cc105f8269b52a95fe4b70d8c49705d4 ****/
		%feature("compactdefaultargs") HasArcOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasArcOnS2;
		Standard_Boolean HasArcOnS2();

		/****************** HasFirstPoint ******************/
		/**** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if the line has a known first point. this point is given by the method firstpoint().

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		/**** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ****/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if the line has a known last point. this point is given by the method lastpoint().

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** InsertVertexBefore ******************/
		/**** md5 signature: e97c0dec2d7b22854be265d964a2b4d3 ****/
		%feature("compactdefaultargs") InsertVertexBefore;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndex: int
thePnt: IntPatch_Point

Returns
-------
None
") InsertVertexBefore;
		void InsertVertexBefore(const Standard_Integer theIndex, const IntPatch_Point & thePnt);

		/****************** IsOutBox ******************/
		/**** md5 signature: 860544030de6408c828004bbab030531 ****/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "Returns true if thep is out of the box built from 3d-points.

Parameters
----------
theP: gp_Pnt

Returns
-------
bool
") IsOutBox;
		Standard_Boolean IsOutBox(const gp_Pnt & theP);

		/****************** IsOutSurf1Box ******************/
		/**** md5 signature: 51099a21ed98d5d18f27e5111981f7c6 ****/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "Returns true if thep is out of the box built from the points on 1st surface.

Parameters
----------
theP: gp_Pnt2d

Returns
-------
bool
") IsOutSurf1Box;
		Standard_Boolean IsOutSurf1Box(const gp_Pnt2d & theP);

		/****************** IsOutSurf2Box ******************/
		/**** md5 signature: 05073c4f1a83d1988d2cd42479760f97 ****/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "Returns true if thep is out of the box built from the points on 2nd surface.

Parameters
----------
theP: gp_Pnt2d

Returns
-------
bool
") IsOutSurf2Box;
		Standard_Boolean IsOutSurf2Box(const gp_Pnt2d & theP);

		/****************** IsPurgingAllowed ******************/
		/**** md5 signature: 81dfdd92b6d4ef244aa76db0fb30c050 ****/
		%feature("compactdefaultargs") IsPurgingAllowed;
		%feature("autodoc", "Returns true if purging is allowed or forbidden for existing wline.

Returns
-------
bool
") IsPurgingAllowed;
		Standard_Boolean IsPurgingAllowed();

		/****************** LastPoint ******************/
		/**** md5 signature: f1c788d8502e367e84924ee37d5745d2 ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the point corresponding to the lastpoint.

Returns
-------
IntPatch_Point
") LastPoint;
		const IntPatch_Point & LastPoint();

		/****************** LastPoint ******************/
		/**** md5 signature: 0fc90016575e4e649bbc9e962943f393 ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the point corresponding to the lastpoint. indlast is the index of the last in the list of vertices.

Parameters
----------

Returns
-------
Indlast: int
") LastPoint;
		const IntPatch_Point & LastPoint(Standard_Integer &OutValue);

		/****************** NbPnts ******************/
		/**** md5 signature: 9b3bac1b760e9cf6c2af2102c55fe59f ****/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Returns the number of intersection points.

Returns
-------
int
") NbPnts;
		virtual Standard_Integer NbPnts();

		/****************** NbVertex ******************/
		/**** md5 signature: 5245ca4f7f52f7737e0d09a36f7eb3f1 ****/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Returns number of vertices (intpatch_point) of the line.

Returns
-------
int
") NbVertex;
		virtual Standard_Integer NbVertex();

		/****************** Point ******************/
		/**** md5 signature: 71a4eaea066ecd2781a45257516a1d34 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point of range index.

Parameters
----------
Index: int

Returns
-------
IntSurf_PntOn2S
") Point;
		virtual const IntSurf_PntOn2S & Point(const Standard_Integer Index);

		/****************** RemoveVertex ******************/
		/**** md5 signature: 72a5feba37233a6b75ea096f48e3e8a6 ****/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "Removes single vertex from the line.

Parameters
----------
theIndex: int

Returns
-------
None
") RemoveVertex;
		virtual void RemoveVertex(const Standard_Integer theIndex);

		/****************** Replace ******************/
		/**** md5 signature: 26f627e400d5ec4fd796489f34c68a92 ****/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replaces the element of range index in the list of points. the exception outofrange is raised when index <= 0 or index > nbvertex.

Parameters
----------
Index: int
Pnt: IntPatch_Point

Returns
-------
None
") Replace;
		void Replace(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****************** SetArcOnS1 ******************/
		/**** md5 signature: 5911133648b11654237758516e0fa4cf ****/
		%feature("compactdefaultargs") SetArcOnS1;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") SetArcOnS1;
		void SetArcOnS1(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** SetArcOnS2 ******************/
		/**** md5 signature: fe880f7042c85049688e4dcfcc59882f ****/
		%feature("compactdefaultargs") SetArcOnS2;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") SetArcOnS2;
		void SetArcOnS2(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** SetCreatingWayInfo ******************/
		/**** md5 signature: 9b39821f25ff089342ef26192ee163eb ****/
		%feature("compactdefaultargs") SetCreatingWayInfo;
		%feature("autodoc", "Sets the info about the way of <*this> creation.

Parameters
----------
theAlgo: IntPatch_WLType

Returns
-------
None
") SetCreatingWayInfo;
		void SetCreatingWayInfo(IntPatch_WLType theAlgo);

		/****************** SetFirstPoint ******************/
		/**** md5 signature: 25fa45b5d9bd6687fb9b3e0c731bb2c5 ****/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndFirst: int

Returns
-------
None
") SetFirstPoint;
		void SetFirstPoint(const Standard_Integer IndFirst);

		/****************** SetLastPoint ******************/
		/**** md5 signature: e92f18b207577df6b281f4b27f093c31 ****/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndLast: int

Returns
-------
None
") SetLastPoint;
		void SetLastPoint(const Standard_Integer IndLast);

		/****************** SetPeriod ******************/
		/**** md5 signature: ea8b3179a3e6fe9ab48197c9976a9f69 ****/
		%feature("compactdefaultargs") SetPeriod;
		%feature("autodoc", "No available documentation.

Parameters
----------
pu1: float
pv1: float
pu2: float
pv2: float

Returns
-------
None
") SetPeriod;
		void SetPeriod(const Standard_Real pu1, const Standard_Real pv1, const Standard_Real pu2, const Standard_Real pv2);

		/****************** SetPoint ******************/
		/**** md5 signature: 67660bb296fa310caa0347f4427366b9 ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Set the point of index <index> in the lineon2s.

Parameters
----------
Index: int
Pnt: IntPatch_Point

Returns
-------
None
") SetPoint;
		void SetPoint(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****************** U1Period ******************/
		/**** md5 signature: 0f11fe35eebd93b966dafbb618e73345 ****/
		%feature("compactdefaultargs") U1Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") U1Period;
		Standard_Real U1Period();

		/****************** U2Period ******************/
		/**** md5 signature: 2db7353eee7eba45b112cd724e5223b7 ****/
		%feature("compactdefaultargs") U2Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") U2Period;
		Standard_Real U2Period();

		/****************** V1Period ******************/
		/**** md5 signature: 80acb106984e4803007c2f6bfed3c7c6 ****/
		%feature("compactdefaultargs") V1Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") V1Period;
		Standard_Real V1Period();

		/****************** V2Period ******************/
		/**** md5 signature: 30686cd4c572466c5637c6cb316b7c8d ****/
		%feature("compactdefaultargs") V2Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") V2Period;
		Standard_Real V2Period();

		/****************** Vertex ******************/
		/**** md5 signature: b3fd41d3f11681ff4530174231f024bd ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the vertex of range index on the line.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") Vertex;
		virtual const IntPatch_Point & Vertex(const Standard_Integer Index);

};


%make_alias(IntPatch_WLine)

%extend IntPatch_WLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class IntPatch_Polyhedron:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
