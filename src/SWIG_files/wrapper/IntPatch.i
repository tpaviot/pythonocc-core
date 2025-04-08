/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_intpatch.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

enum IntPatch_SpecPntType {
	IntPatch_SPntNone = 0,
	IntPatch_SPntSeamU = 1,
	IntPatch_SPntSeamV = 2,
	IntPatch_SPntSeamUV = 3,
	IntPatch_SPntPoleSeamU = 4,
	IntPatch_SPntPole = 5,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

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
		/****** IntPatch_ALineToWLine::IntPatch_ALineToWLine ******/
		/****** md5 signature: 2f42631433ded37863a3c2e22963c3ab ******/
		%feature("compactdefaultargs") IntPatch_ALineToWLine;
		%feature("autodoc", "
Parameters
----------
theS1: Adaptor3d_Surface
theS2: Adaptor3d_Surface
theNbPoints: int (optional, default to 200)

Return
-------
None

Description
-----------
Constructor.
") IntPatch_ALineToWLine;
		 IntPatch_ALineToWLine(const opencascade::handle<Adaptor3d_Surface> & theS1, const opencascade::handle<Adaptor3d_Surface> & theS2, const Standard_Integer theNbPoints = 200);

		/****** IntPatch_ALineToWLine::MakeWLine ******/
		/****** md5 signature: 6b47b07a444cb68ac061bd9dc0d6098b ******/
		%feature("compactdefaultargs") MakeWLine;
		%feature("autodoc", "
Parameters
----------
aline: IntPatch_ALine
theLines: IntPatch_SequenceOfLine

Return
-------
None

Description
-----------
Converts aline to the set of Walking-lines and adds them in theLines.
") MakeWLine;
		void MakeWLine(const opencascade::handle<IntPatch_ALine> & aline, IntPatch_SequenceOfLine & theLines);

		/****** IntPatch_ALineToWLine::MakeWLine ******/
		/****** md5 signature: 10f46e5d7e2085cbf19dde3ab0e3d1d7 ******/
		%feature("compactdefaultargs") MakeWLine;
		%feature("autodoc", "
Parameters
----------
aline: IntPatch_ALine
paraminf: float
paramsup: float
theLines: IntPatch_SequenceOfLine

Return
-------
None

Description
-----------
Converts aline (limited by paraminf and paramsup) to the set of Walking-lines and adds them in theLines.
") MakeWLine;
		void MakeWLine(const opencascade::handle<IntPatch_ALine> & aline, const Standard_Real paraminf, const Standard_Real paramsup, IntPatch_SequenceOfLine & theLines);

		/****** IntPatch_ALineToWLine::SetTol3D ******/
		/****** md5 signature: 880c2e2c72950aa6453ef901b91f71f5 ******/
		%feature("compactdefaultargs") SetTol3D;
		%feature("autodoc", "
Parameters
----------
aT: float

Return
-------
None

Description
-----------
No available documentation.
") SetTol3D;
		void SetTol3D(const Standard_Real aT);

		/****** IntPatch_ALineToWLine::SetTolOpenDomain ******/
		/****** md5 signature: aa60c72e6f01340a2ea156680d570064 ******/
		%feature("compactdefaultargs") SetTolOpenDomain;
		%feature("autodoc", "
Parameters
----------
aT: float

Return
-------
None

Description
-----------
No available documentation.
") SetTolOpenDomain;
		void SetTolOpenDomain(const Standard_Real aT);

		/****** IntPatch_ALineToWLine::SetTolTransition ******/
		/****** md5 signature: f8660409573cc8eb24509f9765e262c9 ******/
		%feature("compactdefaultargs") SetTolTransition;
		%feature("autodoc", "
Parameters
----------
aT: float

Return
-------
None

Description
-----------
No available documentation.
") SetTolTransition;
		void SetTolTransition(const Standard_Real aT);

		/****** IntPatch_ALineToWLine::Tol3D ******/
		/****** md5 signature: 0c721fa385f74a0241e7db7704f9176b ******/
		%feature("compactdefaultargs") Tol3D;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tol3D;
		Standard_Real Tol3D();

		/****** IntPatch_ALineToWLine::TolOpenDomain ******/
		/****** md5 signature: 12e25334e78796bee366d6bf308a8b84 ******/
		%feature("compactdefaultargs") TolOpenDomain;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") TolOpenDomain;
		Standard_Real TolOpenDomain();

		/****** IntPatch_ALineToWLine::TolTransition ******/
		/****** md5 signature: d6465ab9e0260f5ae5ec775eca328745 ******/
		%feature("compactdefaultargs") TolTransition;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
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
		/****** IntPatch_ArcFunction::IntPatch_ArcFunction ******/
		/****** md5 signature: 3c48209a96a54328182da5862a3c6930 ******/
		%feature("compactdefaultargs") IntPatch_ArcFunction;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_ArcFunction;
		 IntPatch_ArcFunction();

		/****** IntPatch_ArcFunction::Arc ******/
		/****** md5 signature: de8e47510fc50811ee5a3e0bc98029e6 ******/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") Arc;
		const opencascade::handle<Adaptor2d_Curve2d> & Arc();

		/****** IntPatch_ArcFunction::Derivative ******/
		/****** md5 signature: 99d758c6c475cdb086620552a67d08e7 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
D: float

Description
-----------
No available documentation.
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****** IntPatch_ArcFunction::GetStateNumber ******/
		/****** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** IntPatch_ArcFunction::LastComputedPoint ******/
		/****** md5 signature: 151ab65e948ef31dff9bbbd66f058a30 ******/
		%feature("compactdefaultargs") LastComputedPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point, which has been computed while the last calling Value() method.
") LastComputedPoint;
		const gp_Pnt LastComputedPoint();

		/****** IntPatch_ArcFunction::NbSamples ******/
		/****** md5 signature: 1e61299a12ab2ebed2590e1021ec4bae ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		Standard_Integer NbSamples();

		/****** IntPatch_ArcFunction::Quadric ******/
		/****** md5 signature: 412540fe449bd77bf89b8085f1fe1701 ******/
		%feature("compactdefaultargs") Quadric;
		%feature("autodoc", "Return
-------
IntSurf_Quadric

Description
-----------
No available documentation.
") Quadric;
		const IntSurf_Quadric & Quadric();

		/****** IntPatch_ArcFunction::Set ******/
		/****** md5 signature: 70ab888f546bf04b92c8032f862436af ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****** IntPatch_ArcFunction::Set ******/
		/****** md5 signature: fe1f4e54b6d838c88f545f7975616591 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** IntPatch_ArcFunction::SetQuadric ******/
		/****** md5 signature: d5b0476ad1478596d5971650634ac6de ******/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "
Parameters
----------
Q: IntSurf_Quadric

Return
-------
None

Description
-----------
No available documentation.
") SetQuadric;
		void SetQuadric(const IntSurf_Quadric & Q);

		/****** IntPatch_ArcFunction::Surface ******/
		/****** md5 signature: d36dc8d293d03901e5a1cace2e167115 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") Surface;
		const opencascade::handle<Adaptor3d_Surface> & Surface();

		/****** IntPatch_ArcFunction::Valpoint ******/
		/****** md5 signature: 3a2ceb97db1e39a13d0a9061e49cb920 ******/
		%feature("compactdefaultargs") Valpoint;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Valpoint;
		const gp_Pnt Valpoint(const Standard_Integer Index);

		/****** IntPatch_ArcFunction::Value ******/
		/****** md5 signature: af675141386b20e819be1017ca5afac2 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float

Description
-----------
No available documentation.
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****** IntPatch_ArcFunction::Values ******/
		/****** md5 signature: 3835d085291235e285cceabd6d1dd2b9 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float

Description
-----------
No available documentation.
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
		/****** IntPatch_CSFunction::IntPatch_CSFunction ******/
		/****** md5 signature: 9e70dc8abfeefce3aafed780da3fdb0b ******/
		%feature("compactdefaultargs") IntPatch_CSFunction;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
C: Adaptor2d_Curve2d
S2: Adaptor3d_Surface

Return
-------
None

Description
-----------
S1 is the surface on which the intersection is searched. C is a curve on the surface S2.
") IntPatch_CSFunction;
		 IntPatch_CSFunction(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor2d_Curve2d> & C, const opencascade::handle<Adaptor3d_Surface> & S2);

		/****** IntPatch_CSFunction::AuxillarCurve ******/
		/****** md5 signature: 147cf00266b63350d4a9e7d2edb61e1b ******/
		%feature("compactdefaultargs") AuxillarCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") AuxillarCurve;
		const opencascade::handle<Adaptor2d_Curve2d> & AuxillarCurve();

		/****** IntPatch_CSFunction::AuxillarSurface ******/
		/****** md5 signature: b291a5935dc6f37ed5922990c14f0acd ******/
		%feature("compactdefaultargs") AuxillarSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") AuxillarSurface;
		const opencascade::handle<Adaptor3d_Surface> & AuxillarSurface();

		/****** IntPatch_CSFunction::Derivatives ******/
		/****** md5 signature: 80ee5f16e62731c095910ad60228848b ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
No available documentation.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** IntPatch_CSFunction::NbEquations ******/
		/****** md5 signature: 42be0dc2e32c8e563393e8490171707e ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		Standard_Integer NbEquations();

		/****** IntPatch_CSFunction::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		Standard_Integer NbVariables();

		/****** IntPatch_CSFunction::Point ******/
		/****** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Point;
		const gp_Pnt Point();

		/****** IntPatch_CSFunction::Root ******/
		/****** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Root;
		Standard_Real Root();

		/****** IntPatch_CSFunction::Value ******/
		/****** md5 signature: 31f6ba581b8fae503400d98976418349 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
No available documentation.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** IntPatch_CSFunction::Values ******/
		/****** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
No available documentation.
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
		/****** IntPatch_CurvIntSurf::IntPatch_CurvIntSurf ******/
		/****** md5 signature: eee762a61380ee26870107a7d7083331 ******/
		%feature("compactdefaultargs") IntPatch_CurvIntSurf;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
W: float
F: IntPatch_CSFunction
TolTangency: float
MarginCoef: float (optional, default to 0.0)

Return
-------
None

Description
-----------
compute the solution point with the close point MarginCoef is the coefficient for extension of UV bounds. Ex., UFirst -= MarginCoef*(ULast-UFirst).
") IntPatch_CurvIntSurf;
		 IntPatch_CurvIntSurf(const Standard_Real U, const Standard_Real V, const Standard_Real W, const IntPatch_CSFunction & F, const Standard_Real TolTangency, const Standard_Real MarginCoef = 0.0);

		/****** IntPatch_CurvIntSurf::IntPatch_CurvIntSurf ******/
		/****** md5 signature: 3882a9005a40ad3530a606e0414e642e ******/
		%feature("compactdefaultargs") IntPatch_CurvIntSurf;
		%feature("autodoc", "
Parameters
----------
F: IntPatch_CSFunction
TolTangency: float

Return
-------
None

Description
-----------
initialize the parameters to compute the solution.
") IntPatch_CurvIntSurf;
		 IntPatch_CurvIntSurf(const IntPatch_CSFunction & F, const Standard_Real TolTangency);

		/****** IntPatch_CurvIntSurf::Function ******/
		/****** md5 signature: 14b4caa41fcc22a8994bca1ef859d9cb ******/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return
-------
IntPatch_CSFunction

Description
-----------
return the math function which is used to compute the intersection.
") Function;
		IntPatch_CSFunction & Function();

		/****** IntPatch_CurvIntSurf::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the creation completed without failure.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntPatch_CurvIntSurf::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** IntPatch_CurvIntSurf::ParameterOnCurve ******/
		/****** md5 signature: ac81682b4b1f0988f8f73835e37144bf ******/
		%feature("compactdefaultargs") ParameterOnCurve;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParameterOnCurve;
		Standard_Real ParameterOnCurve();

		/****** IntPatch_CurvIntSurf::ParameterOnSurface ******/
		/****** md5 signature: b1ff2b42bc6096157075c8f0a6c1b6a5 ******/
		%feature("compactdefaultargs") ParameterOnSurface;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

Description
-----------
No available documentation.
") ParameterOnSurface;
		void ParameterOnSurface(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_CurvIntSurf::Perform ******/
		/****** md5 signature: 193bc13b7dd6d13fbf6a72a44d7ddd7b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
compute the solution it's possible to write to optimize: IntImp_IntCS inter(S1,C1,Toltangency) math_FunctionSetRoot rsnld(Inter.function()) while ...{ u=... v=... w=... inter.Perform(u,v,w,rsnld) } or IntImp_IntCS inter(Toltangency) inter.SetSurface(S); math_FunctionSetRoot rsnld(Inter.function()) while ...{ C=... inter.SetCurve(C); u=... v=... w=... inter.Perform(u,v,w,rsnld) }.
") Perform;
		void Perform(const Standard_Real U, const Standard_Real V, const Standard_Real W, math_FunctionSetRoot & Rsnld, const Standard_Real u0, const Standard_Real v0, const Standard_Real u1, const Standard_Real v1, const Standard_Real w0, const Standard_Real w1);

		/****** IntPatch_CurvIntSurf::Point ******/
		/****** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
returns the intersection point The exception NotDone is raised if IsDone is false. The exception DomainError is raised if IsEmpty is true.
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
		/****** IntPatch_HCurve2dTool::BSpline ******/
		/****** md5 signature: 1151b84776305bc0a5c8aaee6f50252d ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::Bezier ******/
		/****** md5 signature: 55afc4c0fc79e07de6077214558af461 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
opencascade::handle<Geom2d_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::Circle ******/
		/****** md5 signature: 3e4b216e090c5747e712418f4fa66d2c ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Circ2d

Description
-----------
No available documentation.
") Circle;
		static gp_Circ2d Circle(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::Continuity ******/
		/****** md5 signature: 93cd5f75c1ce867aba7a7f12421275f0 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		static GeomAbs_Shape Continuity(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::D0 ******/
		/****** md5 signature: 54c6bd0c456279db2610c0ff0808eb84 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		static void D0(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U, gp_Pnt2d & P);

		/****** IntPatch_HCurve2dTool::D1 ******/
		/****** md5 signature: 918bee38d3c31b02180315ab8bd4beb7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		static void D1(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****** IntPatch_HCurve2dTool::D2 ******/
		/****** md5 signature: d9e326efa98865a213fce49a3626a678 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
") D2;
		static void D2(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** IntPatch_HCurve2dTool::D3 ******/
		/****** md5 signature: 4951d7379750f8dbc9e426361fa2b365 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		static void D3(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** IntPatch_HCurve2dTool::DN ******/
		/****** md5 signature: edb6f0f7cc5bdd7864a248db788f4d84 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
N: int

Return
-------
gp_Vec2d

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		static gp_Vec2d DN(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U, const Standard_Integer N);

		/****** IntPatch_HCurve2dTool::Ellipse ******/
		/****** md5 signature: 9ddecf68838c4598b17a43e7ee186e6e ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Ellipse;
		static gp_Elips2d Ellipse(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::FirstParameter ******/
		/****** md5 signature: a4d9a6241f0c3cafc57f60a68d9c9127 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		static Standard_Real FirstParameter(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::GetType ******/
		/****** md5 signature: 29ec5067d7e913f214c553444ec99b6a ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		static GeomAbs_CurveType GetType(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::Hyperbola ******/
		/****** md5 signature: d710d90c07a9bd6c6e8e1ba3fc1c92bf ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Hypr2d

Description
-----------
No available documentation.
") Hyperbola;
		static gp_Hypr2d Hyperbola(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::Intervals ******/
		/****** md5 signature: 7f25b6c48f712ccc9ec416d83eb97ef8 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		static void Intervals(const opencascade::handle<Adaptor2d_Curve2d> & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** IntPatch_HCurve2dTool::IsClosed ******/
		/****** md5 signature: e2e4c5d0ae21ac59c815ef761d7e7eb0 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		static Standard_Boolean IsClosed(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::IsPeriodic ******/
		/****** md5 signature: 343c2522f84a0271d505fb5a7b6123ee ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::LastParameter ******/
		/****** md5 signature: a84c73d5efee27b935b3bc64eba5e8ab ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		static Standard_Real LastParameter(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::Line ******/
		/****** md5 signature: cc50bf5bbcfff1340d1951ad804f481d ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Line;
		static gp_Lin2d Line(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::NbIntervals ******/
		/****** md5 signature: 296d2d406ae6365ab4187665e47f6beb ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>.
") NbIntervals;
		static Standard_Integer NbIntervals(const opencascade::handle<Adaptor2d_Curve2d> & C, const GeomAbs_Shape S);

		/****** IntPatch_HCurve2dTool::NbSamples ******/
		/****** md5 signature: 4846c46ec026f7e5cf2080eb1601445a ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U0: float
U1: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static Standard_Integer NbSamples(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U0, const Standard_Real U1);

		/****** IntPatch_HCurve2dTool::Parabola ******/
		/****** md5 signature: 638d7ecde6dd9f67180eadf45347f22e ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Parab2d

Description
-----------
No available documentation.
") Parabola;
		static gp_Parab2d Parabola(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::Period ******/
		/****** md5 signature: 2a78d8fc20cccabaa0fb7d52397ae7ba ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
float

Description
-----------
No available documentation.
") Period;
		static Standard_Real Period(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::Resolution ******/
		/****** md5 signature: 1567f92dacdcdb24e1f4d21710c525e2 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
R3d: float

Return
-------
float

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		static Standard_Real Resolution(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real R3d);

		/****** IntPatch_HCurve2dTool::Value ******/
		/****** md5 signature: f88e121e984f9cbec46065eb86a1e379 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		static gp_Pnt2d Value(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U);

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
		/****** IntPatch_HInterTool::IntPatch_HInterTool ******/
		/****** md5 signature: a36982be4506681216df42cd27bbd921 ******/
		%feature("compactdefaultargs") IntPatch_HInterTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_HInterTool;
		 IntPatch_HInterTool();

		/****** IntPatch_HInterTool::Bounds ******/
		/****** md5 signature: 14979ddc3175e995d5548477ac5bcd4b ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
Ufirst: float
Ulast: float

Description
-----------
Returns the parametric limits on the arc C. These limits must be finite: they are either the real limits of the arc, for a finite arc, or a bounding box for an infinite arc.
") Bounds;
		static void Bounds(const opencascade::handle<Adaptor2d_Curve2d> & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_HInterTool::HasBeenSeen ******/
		/****** md5 signature: 52a722c5d4a9984d26ad321cf3630b48 ******/
		%feature("compactdefaultargs") HasBeenSeen;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
Returns True if all the intersection point and edges are known on the Arc. The intersection point are given as vertices. The intersection edges are given as intervals between two vertices.
") HasBeenSeen;
		static Standard_Boolean HasBeenSeen(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HInterTool::HasFirstPoint ******/
		/****** md5 signature: af276ff6ae83b4e53affd31093f8bfdc ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int

Return
-------
IndFirst: int

Description
-----------
Returns True when the segment of range Index is not open at the left side. In that case, IndFirst is the range in the list intersection points (see NbPoints) of the one which defines the left bound of the segment. Otherwise, the method has to return False, and IndFirst has no meaning.
") HasFirstPoint;
		static Standard_Boolean HasFirstPoint(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Integer Index, Standard_Integer &OutValue);

		/****** IntPatch_HInterTool::HasLastPoint ******/
		/****** md5 signature: a28a12263a39eecc4acc9708fdf256c7 ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int

Return
-------
IndLast: int

Description
-----------
Returns True when the segment of range Index is not open at the right side. In that case, IndLast is the range in the list intersection points (see NbPoints) of the one which defines the right bound of the segment. Otherwise, the method has to return False, and IndLast has no meaning.
") HasLastPoint;
		static Standard_Boolean HasLastPoint(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Integer Index, Standard_Integer &OutValue);

		/****** IntPatch_HInterTool::IsAllSolution ******/
		/****** md5 signature: a0e5f5bbe827235fe1ddb52793e5eb42 ******/
		%feature("compactdefaultargs") IsAllSolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
Returns True when the whole restriction is solution of the intersection problem.
") IsAllSolution;
		static Standard_Boolean IsAllSolution(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HInterTool::IsVertex ******/
		/****** md5 signature: ffecad0cdf7d56d3c7a670cde7e75bc2 ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int

Return
-------
bool

Description
-----------
Returns True if the intersection point of range Index corresponds with a vertex on the arc A.
") IsVertex;
		static Standard_Boolean IsVertex(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Integer Index);

		/****** IntPatch_HInterTool::NbPoints ******/
		/****** md5 signature: 54aec07f3b6dd332421dfbc4dec3568c ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
Returns the number of intersection points on the arc A.
") NbPoints;
		static Standard_Integer NbPoints(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HInterTool::NbSamplePoints ******/
		/****** md5 signature: 0e8230bae32bc82ea05cbafa64c2af61 ******/
		%feature("compactdefaultargs") NbSamplePoints;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
int

Description
-----------
No available documentation.
") NbSamplePoints;
		Standard_Integer NbSamplePoints(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** IntPatch_HInterTool::NbSamplesOnArc ******/
		/****** md5 signature: 99a1330c1c671d353c2bee9fd23c27cc ******/
		%feature("compactdefaultargs") NbSamplesOnArc;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
returns the number of points which is used to make a sample on the arc. this number is a function of the Surface and the CurveOnSurface complexity.
") NbSamplesOnArc;
		static Standard_Integer NbSamplesOnArc(const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****** IntPatch_HInterTool::NbSamplesU ******/
		/****** md5 signature: 7ffe816252db97bdbf2950cea2ca2037 ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
u1: float
u2: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesU;
		static Standard_Integer NbSamplesU(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real u1, const Standard_Real u2);

		/****** IntPatch_HInterTool::NbSamplesV ******/
		/****** md5 signature: 183861bdb84cb1597bd3a1324a097e8e ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
v1: float
v2: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesV;
		static Standard_Integer NbSamplesV(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real v1, const Standard_Real v2);

		/****** IntPatch_HInterTool::NbSegments ******/
		/****** md5 signature: 2689aa0fe05c64574e603c4eb512caa4 ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
returns the number of part of A solution of the of intersection problem.
") NbSegments;
		static Standard_Integer NbSegments(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HInterTool::Parameter ******/
		/****** md5 signature: f5a937c546746bb35bafec928fdc442d ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex
C: Adaptor2d_Curve2d

Return
-------
float

Description
-----------
Returns the parameter of the vertex V on the arc A.
") Parameter;
		static Standard_Real Parameter(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HInterTool::Project ******/
		/****** md5 signature: b602a334ba1cfcdefae0bd304b479ee8 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
P: gp_Pnt2d
Ptproj: gp_Pnt2d

Return
-------
Paramproj: float

Description
-----------
Projects the point P on the arc C. If the methods returns Standard_True, the projection is successful, and Paramproj is the parameter on the arc of the projected point, Ptproj is the projected Point. If the method returns Standard_False, Param proj and Ptproj are not significant.
") Project;
		static Standard_Boolean Project(const opencascade::handle<Adaptor2d_Curve2d> & C, const gp_Pnt2d & P, Standard_Real &OutValue, gp_Pnt2d & Ptproj);

		/****** IntPatch_HInterTool::SamplePoint ******/
		/****** md5 signature: e5df4c7ba0cea61bfd2ea610530d7dbd ******/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
Index: int

Return
-------
U: float
V: float

Description
-----------
No available documentation.
") SamplePoint;
		void SamplePoint(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_HInterTool::SingularOnUMax ******/
		/****** md5 signature: d3ce7701aebe6c17d8a630ca024b7a67 ******/
		%feature("compactdefaultargs") SingularOnUMax;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
bool

Description
-----------
No available documentation.
") SingularOnUMax;
		static Standard_Boolean SingularOnUMax(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** IntPatch_HInterTool::SingularOnUMin ******/
		/****** md5 signature: d59a1ea9f83cedfe3b3c10bf7d368a33 ******/
		%feature("compactdefaultargs") SingularOnUMin;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
bool

Description
-----------
No available documentation.
") SingularOnUMin;
		static Standard_Boolean SingularOnUMin(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** IntPatch_HInterTool::SingularOnVMax ******/
		/****** md5 signature: 5f37482ceddffdf31349f166be64affd ******/
		%feature("compactdefaultargs") SingularOnVMax;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
bool

Description
-----------
No available documentation.
") SingularOnVMax;
		static Standard_Boolean SingularOnVMax(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** IntPatch_HInterTool::SingularOnVMin ******/
		/****** md5 signature: 25ae497959e941075dff65a069de3c75 ******/
		%feature("compactdefaultargs") SingularOnVMin;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
bool

Description
-----------
No available documentation.
") SingularOnVMin;
		static Standard_Boolean SingularOnVMin(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** IntPatch_HInterTool::Tolerance ******/
		/****** md5 signature: 35f5531e9c358e20c7f5723f26e0a7ba ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex
C: Adaptor2d_Curve2d

Return
-------
float

Description
-----------
Returns the parametric tolerance used to consider that the vertex and another point meet, i-e if Abs(parameter(Vertex) - parameter(OtherPnt))<= Tolerance, the points are 'merged'.
") Tolerance;
		static Standard_Real Tolerance(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HInterTool::Value ******/
		/****** md5 signature: ba54f1e0e4e6802571668cb2c0638480 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int
Pt: gp_Pnt

Return
-------
Tol: float
U: float

Description
-----------
Returns the value (Pt), the tolerance (Tol), and the parameter (U) on the arc A , of the intersection point of range Index.
") Value;
		static void Value(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Integer Index, gp_Pnt & Pt, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_HInterTool::Vertex ******/
		/****** md5 signature: f58ee2175cbc1af1161d7220a9c11ff1 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int
V: Adaptor3d_HVertex

Return
-------
None

Description
-----------
When IsVertex returns True, this method returns the vertex on the arc A.
") Vertex;
		static void Vertex(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Integer Index, opencascade::handle<Adaptor3d_HVertex> & V);

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

/* python proxy classes for enums */
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

		/****** IntPatch_ImpImpIntersection::IntPatch_ImpImpIntersection ******/
		/****** md5 signature: 7be4587ea1735d9431b285e164d246f4 ******/
		%feature("compactdefaultargs") IntPatch_ImpImpIntersection;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_ImpImpIntersection;
		 IntPatch_ImpImpIntersection();

		/****** IntPatch_ImpImpIntersection::IntPatch_ImpImpIntersection ******/
		/****** md5 signature: 03ac7a4946d10cf1316728228e8bd885 ******/
		%feature("compactdefaultargs") IntPatch_ImpImpIntersection;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
theIsReqToKeepRLine: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Flag theIsReqToKeepRLine has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. When intersection result returns IntPatch_RLine and another IntPatch_Line (not restriction) we (in case of theIsReqToKeepRLine==True) will always keep both lines even if they are coincided.
") IntPatch_ImpImpIntersection;
		 IntPatch_ImpImpIntersection(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Boolean theIsReqToKeepRLine = Standard_False);

		/****** IntPatch_ImpImpIntersection::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the calculus was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntPatch_ImpImpIntersection::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the is no intersection.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** IntPatch_ImpImpIntersection::Line ******/
		/****** md5 signature: 0f19f87d200154ef5932a127697b505b ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<IntPatch_Line>

Description
-----------
Returns the line of range Index. An exception is raised if Index<=0 or Index>NbLine.
") Line;
		const opencascade::handle<IntPatch_Line> & Line(const Standard_Integer Index);

		/****** IntPatch_ImpImpIntersection::NbLines ******/
		/****** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection lines.
") NbLines;
		Standard_Integer NbLines();

		/****** IntPatch_ImpImpIntersection::NbPnts ******/
		/****** md5 signature: 11421df812eef5f47a644a70b75ab60a ******/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of 'single' points.
") NbPnts;
		Standard_Integer NbPnts();

		/****** IntPatch_ImpImpIntersection::OppositeFaces ******/
		/****** md5 signature: 1103bf0485006c89d11ed86313182eb1 ******/
		%feature("compactdefaultargs") OppositeFaces;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the TangentFaces returns True and the normal vectors evaluated at a point on the first and the second surface are opposite. The exception DomainError is raised if TangentFaces returns False.
") OppositeFaces;
		Standard_Boolean OppositeFaces();

		/****** IntPatch_ImpImpIntersection::Perform ******/
		/****** md5 signature: 8daf2c0173ee7beeb6250f8c01e20567 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
theIsReqToKeepRLine: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Flag theIsReqToKeepRLine has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. When intersection result returns IntPatch_RLine and another IntPatch_Line (not restriction) we (in case of theIsReqToKeepRLine==True) will always keep both lines even if they are coincided.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Boolean theIsReqToKeepRLine = Standard_False);

		/****** IntPatch_ImpImpIntersection::Point ******/
		/****** md5 signature: a380f33017a5aaa3320d09b1b9dc85e1 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the point of range Index. An exception is raised if Index<=0 or Index>NbPnt.
") Point;
		const IntPatch_Point & Point(const Standard_Integer Index);

		/****** IntPatch_ImpImpIntersection::TangentFaces ******/
		/****** md5 signature: 1bd0aa400de87da796d429cdd88c31ea ******/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the two patches are considered as entirely tangent, i.e every restriction arc of one patch is inside the geometric base of the other patch.
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
		/****** IntPatch_ImpPrmIntersection::IntPatch_ImpPrmIntersection ******/
		/****** md5 signature: f4cbcc97498f2df01053a929c676a290 ******/
		%feature("compactdefaultargs") IntPatch_ImpPrmIntersection;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_ImpPrmIntersection;
		 IntPatch_ImpPrmIntersection();

		/****** IntPatch_ImpPrmIntersection::IntPatch_ImpPrmIntersection ******/
		/****** md5 signature: f6b18857420728a54f2881ebe6ac6acd ******/
		%feature("compactdefaultargs") IntPatch_ImpPrmIntersection;
		%feature("autodoc", "
Parameters
----------
Surf1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
Surf2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
Fleche: float
Pas: float

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_ImpPrmIntersection;
		 IntPatch_ImpPrmIntersection(const opencascade::handle<Adaptor3d_Surface> & Surf1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & Surf2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Real Fleche, const Standard_Real Pas);

		/****** IntPatch_ImpPrmIntersection::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the calculus was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntPatch_ImpPrmIntersection::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the is no intersection.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** IntPatch_ImpPrmIntersection::Line ******/
		/****** md5 signature: 0f19f87d200154ef5932a127697b505b ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<IntPatch_Line>

Description
-----------
Returns the line of range Index. An exception is raised if Index<=0 or Index>NbLine.
") Line;
		const opencascade::handle<IntPatch_Line> & Line(const Standard_Integer Index);

		/****** IntPatch_ImpPrmIntersection::NbLines ******/
		/****** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection lines.
") NbLines;
		Standard_Integer NbLines();

		/****** IntPatch_ImpPrmIntersection::NbPnts ******/
		/****** md5 signature: 11421df812eef5f47a644a70b75ab60a ******/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of 'single' points.
") NbPnts;
		Standard_Integer NbPnts();

		/****** IntPatch_ImpPrmIntersection::Perform ******/
		/****** md5 signature: b8c905aeb6dfe98e5d2ee6b901613b38 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Surf1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
Surf2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
Fleche: float
Pas: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Surf1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & Surf2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Real Fleche, const Standard_Real Pas);

		/****** IntPatch_ImpPrmIntersection::Point ******/
		/****** md5 signature: a380f33017a5aaa3320d09b1b9dc85e1 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the point of range Index. An exception is raised if Index<=0 or Index>NbPnt.
") Point;
		const IntPatch_Point & Point(const Standard_Integer Index);

		/****** IntPatch_ImpPrmIntersection::SetStartPoint ******/
		/****** md5 signature: 2f7695fecc55d8936b3b12959027e262 ******/
		%feature("compactdefaultargs") SetStartPoint;
		%feature("autodoc", "
Parameters
----------
U: float
V: float

Return
-------
None

Description
-----------
to search for solution from the given point.
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
		/****** IntPatch_InterferencePolyhedron::IntPatch_InterferencePolyhedron ******/
		/****** md5 signature: bcee18160a018abbc7ca10edfe73faa4 ******/
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty interference of Polyhedron.
") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron();

		/****** IntPatch_InterferencePolyhedron::IntPatch_InterferencePolyhedron ******/
		/****** md5 signature: ed21209d5e9fc41ef785686ba9b5f4bb ******/
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "
Parameters
----------
Obje1: IntPatch_Polyhedron
Obje2: IntPatch_Polyhedron

Return
-------
None

Description
-----------
Constructs and computes an interference between the two Polyhedra.
") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron(const IntPatch_Polyhedron & Obje1, const IntPatch_Polyhedron & Obje2);

		/****** IntPatch_InterferencePolyhedron::IntPatch_InterferencePolyhedron ******/
		/****** md5 signature: 89cc662e47a55daf2f93f54136eca955 ******/
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "
Parameters
----------
Obje: IntPatch_Polyhedron

Return
-------
None

Description
-----------
Constructs and computes the self interference of a Polyhedron.
") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron(const IntPatch_Polyhedron & Obje);

		/****** IntPatch_InterferencePolyhedron::Perform ******/
		/****** md5 signature: d26a979a3b5dc9db5e86d919e93c0744 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Obje1: IntPatch_Polyhedron
Obje2: IntPatch_Polyhedron

Return
-------
None

Description
-----------
Computes the interference between the two Polyhedra.
") Perform;
		void Perform(const IntPatch_Polyhedron & Obje1, const IntPatch_Polyhedron & Obje2);

		/****** IntPatch_InterferencePolyhedron::Perform ******/
		/****** md5 signature: 6767f6104458aca7d72b27f1876ffecf ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Obje: IntPatch_Polyhedron

Return
-------
None

Description
-----------
Computes the self interference of a Polyhedron.
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
		/****** IntPatch_Intersection::IntPatch_Intersection ******/
		/****** md5 signature: b7b64295e34218cccd078e59a46a390e ******/
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_Intersection;
		 IntPatch_Intersection();

		/****** IntPatch_Intersection::IntPatch_Intersection ******/
		/****** md5 signature: 8cb955eb3bc846ae555e6ba075574dfc ******/
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_Intersection;
		 IntPatch_Intersection(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang);

		/****** IntPatch_Intersection::IntPatch_Intersection ******/
		/****** md5 signature: 44093133de38c447f56c4f2446535fbc ******/
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
TolArc: float
TolTang: float

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_Intersection;
		 IntPatch_Intersection(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const Standard_Real TolArc, const Standard_Real TolTang);

		/****** IntPatch_Intersection::CheckSingularPoints ******/
		/****** md5 signature: 82524fc63e41c5bd324fc8781eba7164 ******/
		%feature("compactdefaultargs") CheckSingularPoints;
		%feature("autodoc", "
Parameters
----------
theS1: Adaptor3d_Surface
theD1: Adaptor3d_TopolTool
theS2: Adaptor3d_Surface

Return
-------
theDist: float

Description
-----------
Checks if surface theS1 has degenerated boundary (dS/du or dS/dv = 0) and calculates minimal distance between corresponding singular points and surface theS2 If singular point exists the method returns 'true' and stores minimal distance in theDist.
") CheckSingularPoints;
		static Standard_Boolean CheckSingularPoints(const opencascade::handle<Adaptor3d_Surface> & theS1, const opencascade::handle<Adaptor3d_TopolTool> & theD1, const opencascade::handle<Adaptor3d_Surface> & theS2, Standard_Real &OutValue);

		/****** IntPatch_Intersection::DefineUVMaxStep ******/
		/****** md5 signature: f6a4ba92c83b751825d3a7abc18a44cc ******/
		%feature("compactdefaultargs") DefineUVMaxStep;
		%feature("autodoc", "
Parameters
----------
theS1: Adaptor3d_Surface
theD1: Adaptor3d_TopolTool
theS2: Adaptor3d_Surface
theD2: Adaptor3d_TopolTool

Return
-------
float

Description
-----------
Calculates recommended value for myUVMaxStep depending on surfaces and their domains.
") DefineUVMaxStep;
		static Standard_Real DefineUVMaxStep(const opencascade::handle<Adaptor3d_Surface> & theS1, const opencascade::handle<Adaptor3d_TopolTool> & theD1, const opencascade::handle<Adaptor3d_Surface> & theS2, const opencascade::handle<Adaptor3d_TopolTool> & theD2);

		/****** IntPatch_Intersection::Dump ******/
		/****** md5 signature: b8dcb65f3dda1a981da840cad536cd1b ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
Mode: int
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool

Return
-------
None

Description
-----------
Dump of each result line. Mode for more accurate dumps.
") Dump;
		void Dump(const Standard_Integer Mode, const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2);

		/****** IntPatch_Intersection::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the calculus was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntPatch_Intersection::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the is no intersection.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** IntPatch_Intersection::Line ******/
		/****** md5 signature: 0f19f87d200154ef5932a127697b505b ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<IntPatch_Line>

Description
-----------
Returns the line of range Index. An exception is raised if Index<=0 or Index>NbLine.
") Line;
		const opencascade::handle<IntPatch_Line> & Line(const Standard_Integer Index);

		/****** IntPatch_Intersection::NbLines ******/
		/****** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection lines.
") NbLines;
		Standard_Integer NbLines();

		/****** IntPatch_Intersection::NbPnts ******/
		/****** md5 signature: 11421df812eef5f47a644a70b75ab60a ******/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of 'single' points.
") NbPnts;
		Standard_Integer NbPnts();

		/****** IntPatch_Intersection::OppositeFaces ******/
		/****** md5 signature: 1103bf0485006c89d11ed86313182eb1 ******/
		%feature("compactdefaultargs") OppositeFaces;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the TangentFaces returns True and the normal vectors evaluated at a point on the first and the second surface are opposite. The exception DomainError is raised if TangentFaces returns False.
") OppositeFaces;
		Standard_Boolean OppositeFaces();

		/****** IntPatch_Intersection::Perform ******/
		/****** md5 signature: b269e7ee1d80b0a360103090a9937e8f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
isGeomInt: bool (optional, default to Standard_True)
theIsReqToKeepRLine: bool (optional, default to Standard_False)
theIsReqToPostWLProc: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Flag theIsReqToKeepRLine has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. When intersection result returns IntPatch_RLine and another IntPatch_Line (not restriction) we (in case of theIsReqToKeepRLine==True) will always keep both lines even if they are coincided. Flag theIsReqToPostWLProc has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. If theIsReqToPostWLProc == False, then we will work with Walking-line obtained after intersection algorithm directly (without any post-processing).
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Boolean isGeomInt = Standard_True, const Standard_Boolean theIsReqToKeepRLine = Standard_False, const Standard_Boolean theIsReqToPostWLProc = Standard_True);

		/****** IntPatch_Intersection::Perform ******/
		/****** md5 signature: 3f213f8ce247f43c16e4ac42a99c1683 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
LOfPnts: IntSurf_ListOfPntOn2S
isGeomInt: bool (optional, default to Standard_True)
theIsReqToKeepRLine: bool (optional, default to Standard_False)
theIsReqToPostWLProc: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
If isGeomInt == Standard_False, then method Param-Param intersection will be used. Flag theIsReqToKeepRLine has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. When intersection result returns IntPatch_RLine and another IntPatch_Line (not restriction) we (in case of theIsReqToKeepRLine==True) will always keep both lines even if they are coincided. Flag theIsReqToPostWLProc has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. If theIsReqToPostWLProc == False, then we will work with Walking-line obtained after intersection algorithm directly (without any post-processing).
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, IntSurf_ListOfPntOn2S & LOfPnts, const Standard_Boolean isGeomInt = Standard_True, const Standard_Boolean theIsReqToKeepRLine = Standard_False, const Standard_Boolean theIsReqToPostWLProc = Standard_True);

		/****** IntPatch_Intersection::Perform ******/
		/****** md5 signature: a90fea01d3487c7f986a9eaa1dbaa115 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
U1: float
V1: float
U2: float
V2: float
TolArc: float
TolTang: float

Return
-------
None

Description
-----------
Perform with start point.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real TolArc, const Standard_Real TolTang);

		/****** IntPatch_Intersection::Perform ******/
		/****** md5 signature: 2527f02f395cf07b204ccbcfa04ab9da ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
TolArc: float
TolTang: float

Return
-------
None

Description
-----------
Uses for finding self-intersected surfaces.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const Standard_Real TolArc, const Standard_Real TolTang);

		/****** IntPatch_Intersection::Point ******/
		/****** md5 signature: a380f33017a5aaa3320d09b1b9dc85e1 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the point of range Index. An exception is raised if Index<=0 or Index>NbPnt.
") Point;
		const IntPatch_Point & Point(const Standard_Integer Index);

		/****** IntPatch_Intersection::PrepareSurfaces ******/
		/****** md5 signature: 930cc378463b1ab18da60a0e1184a4b4 ******/
		%feature("compactdefaultargs") PrepareSurfaces;
		%feature("autodoc", "
Parameters
----------
theS1: Adaptor3d_Surface
theD1: Adaptor3d_TopolTool
theS2: Adaptor3d_Surface
theD2: Adaptor3d_TopolTool
Tol: float
theSeqHS1: Adaptor3d_Surface
theSeqHS2: Adaptor3d_Surface

Return
-------
None

Description
-----------
Prepares surfaces for intersection.
") PrepareSurfaces;
		static void PrepareSurfaces(const opencascade::handle<Adaptor3d_Surface> & theS1, const opencascade::handle<Adaptor3d_TopolTool> & theD1, const opencascade::handle<Adaptor3d_Surface> & theS2, const opencascade::handle<Adaptor3d_TopolTool> & theD2, const Standard_Real Tol, NCollection_Vector<opencascade::handle<Adaptor3d_Surface> > & theSeqHS1, NCollection_Vector<opencascade::handle<Adaptor3d_Surface> > & theSeqHS2);

		/****** IntPatch_Intersection::SequenceOfLine ******/
		/****** md5 signature: 7663267a72cef685d6565935e73efb0a ******/
		%feature("compactdefaultargs") SequenceOfLine;
		%feature("autodoc", "Return
-------
IntPatch_SequenceOfLine

Description
-----------
No available documentation.
") SequenceOfLine;
		const IntPatch_SequenceOfLine & SequenceOfLine();

		/****** IntPatch_Intersection::SetTolerances ******/
		/****** md5 signature: 8670d77050325f4c865f123b09128a08 ******/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "
Parameters
----------
TolArc: float
TolTang: float
UVMaxStep: float
Fleche: float

Return
-------
None

Description
-----------
Set the tolerances used by the algorithms: --- Implicit - Parametric --- Parametric - Parametric --- Implicit - Implicit //! TolArc is used to compute the intersections between the restrictions of a surface and a walking line. //! TolTang is used to compute the points on a walking line, and in geometric algorithms. //! Fleche is a parameter used in the walking algorithms to provide small curvatures on a line. //! UVMaxStep is a parameter used in the walking algorithms to compute the distance between to points in their respective parametric spaces.
") SetTolerances;
		void SetTolerances(const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Real UVMaxStep, const Standard_Real Fleche);

		/****** IntPatch_Intersection::TangentFaces ******/
		/****** md5 signature: 1bd0aa400de87da796d429cdd88c31ea ******/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the two patches are considered as entirely tangent, i-e every restriction arc of one patch is inside the geometric base of the other patch.
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
		/****** IntPatch_Line::ArcType ******/
		/****** md5 signature: 0a7455aa9cc33046fb13baf1f25a2b19 ******/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Return
-------
IntPatch_IType

Description
-----------
Returns the type of geometry 3d (Line, Circle, Parabola, Hyperbola, Ellipse, Analytic, Walking, Restriction).
") ArcType;
		IntPatch_IType ArcType();

		/****** IntPatch_Line::IsTangent ******/
		/****** md5 signature: 16a7964bb24e34f80fabc93e5a65aedc ******/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection is a line of tangency between the 2 patches.
") IsTangent;
		Standard_Boolean IsTangent();

		/****** IntPatch_Line::IsUIsoOnS1 ******/
		/****** md5 signature: 1aad8dcfd2c807aee9ae90657010709a ******/
		%feature("compactdefaultargs") IsUIsoOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection is a U isoparametric curve on the first patch.
") IsUIsoOnS1;
		Standard_Boolean IsUIsoOnS1();

		/****** IntPatch_Line::IsUIsoOnS2 ******/
		/****** md5 signature: c53a03daf11a34ad64c7147e99af671f ******/
		%feature("compactdefaultargs") IsUIsoOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection is a U isoparametric curve on the second patch.
") IsUIsoOnS2;
		Standard_Boolean IsUIsoOnS2();

		/****** IntPatch_Line::IsVIsoOnS1 ******/
		/****** md5 signature: b7ebebcc5a2c9f24c052636dca3c8dfb ******/
		%feature("compactdefaultargs") IsVIsoOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection is a V isoparametric curve on the first patch.
") IsVIsoOnS1;
		Standard_Boolean IsVIsoOnS1();

		/****** IntPatch_Line::IsVIsoOnS2 ******/
		/****** md5 signature: 3cfd95d8a0b0b88a42724611ce1bb80f ******/
		%feature("compactdefaultargs") IsVIsoOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection is a V isoparametric curve on the second patch.
") IsVIsoOnS2;
		Standard_Boolean IsVIsoOnS2();

		/****** IntPatch_Line::SetValue ******/
		/****** md5 signature: 12fc0194bc89d950f208a974a1599707 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Uiso1: bool
Viso1: bool
Uiso2: bool
Viso2: bool

Return
-------
None

Description
-----------
To set the values returned by IsUIsoS1,.... The default values are False.
") SetValue;
		void SetValue(const Standard_Boolean Uiso1, const Standard_Boolean Viso1, const Standard_Boolean Uiso2, const Standard_Boolean Viso2);

		/****** IntPatch_Line::SituationS1 ******/
		/****** md5 signature: af2d2dd713ae3b820482546cf4a82d7b ******/
		%feature("compactdefaultargs") SituationS1;
		%feature("autodoc", "Return
-------
IntSurf_Situation

Description
-----------
Returns the situation (INSIDE/OUTSIDE/UNKNOWN) of the first patch compared to the second one, when TransitionOnS1 or TransitionOnS2 returns TOUCH. Otherwise, an exception is raised.
") SituationS1;
		IntSurf_Situation SituationS1();

		/****** IntPatch_Line::SituationS2 ******/
		/****** md5 signature: da9cc8795913744eb08fbe6bf499827b ******/
		%feature("compactdefaultargs") SituationS2;
		%feature("autodoc", "Return
-------
IntSurf_Situation

Description
-----------
Returns the situation (INSIDE/OUTSIDE/UNKNOWN) of the second patch compared to the first one, when TransitionOnS1 or TransitionOnS2 returns TOUCH. Otherwise, an exception is raised.
") SituationS2;
		IntSurf_Situation SituationS2();

		/****** IntPatch_Line::TransitionOnS1 ******/
		/****** md5 signature: 9de184f3b47c2902be7de5eb10743898 ******/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "Return
-------
IntSurf_TypeTrans

Description
-----------
Returns the type of the transition of the line for the first surface. The transition is 'constant' along the line. The transition is IN if the line is oriented in such a way that the system of vector (N1,N2,T) is right-handed, where N1 is the normal to the first surface at a point P, N2 is the normal to the second surface at a point P, T is the tangent to the intersection line at P. If the system of vector is left-handed, the transition is OUT. When N1 and N2 are colinear all along the intersection line, the transition will be - TOUCH, if it is possible to use the 2nd derivatives to determine the position of one surafce compared to the other (see Situation) - UNDECIDED otherwise. //! If one of the transition is TOUCH or UNDECIDED, the other one has got the same value.
") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1();

		/****** IntPatch_Line::TransitionOnS2 ******/
		/****** md5 signature: aafa064949332278d0d49be3da4c6df2 ******/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "Return
-------
IntSurf_TypeTrans

Description
-----------
Returns the type of the transition of the line for the second surface. The transition is 'constant' along the line.
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
		/****** IntPatch_LineConstructor::IntPatch_LineConstructor ******/
		/****** md5 signature: d9260de2e6fb6254e056b6313ba23011 ******/
		%feature("compactdefaultargs") IntPatch_LineConstructor;
		%feature("autodoc", "
Parameters
----------
mode: int

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_LineConstructor;
		 IntPatch_LineConstructor(const Standard_Integer mode);

		/****** IntPatch_LineConstructor::Line ******/
		/****** md5 signature: a2403e2fa130e6fe0b80560f075cc3fd ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
opencascade::handle<IntPatch_Line>

Description
-----------
No available documentation.
") Line;
		opencascade::handle<IntPatch_Line> Line(const Standard_Integer index);

		/****** IntPatch_LineConstructor::NbLines ******/
		/****** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbLines;
		Standard_Integer NbLines();

		/****** IntPatch_LineConstructor::Perform ******/
		/****** md5 signature: 3ce959cc744a727f88718a272bc634d9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
SL: IntPatch_SequenceOfLine
L: IntPatch_Line
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const IntPatch_SequenceOfLine & SL, const opencascade::handle<IntPatch_Line> & L, const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real Tol);

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
		/****** IntPatch_Point::IntPatch_Point ******/
		/****** md5 signature: 03a05de988af7a0fed88ace5649e482b ******/
		%feature("compactdefaultargs") IntPatch_Point;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntPatch_Point;
		 IntPatch_Point();

		/****** IntPatch_Point::ArcOnS1 ******/
		/****** md5 signature: 85135db99004c68167f0f6d4c3e12e08 ******/
		%feature("compactdefaultargs") ArcOnS1;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the arc of restriction containing the vertex. The exception DomainError is raised if IsOnDomS1 returns False.
") ArcOnS1;
		const opencascade::handle<Adaptor2d_Curve2d> & ArcOnS1();

		/****** IntPatch_Point::ArcOnS2 ******/
		/****** md5 signature: 8bdcf3526697d60e43350266dbc562b1 ******/
		%feature("compactdefaultargs") ArcOnS2;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the arc of restriction containing the vertex. The exception DomainError is raised if IsOnDomS2 returns False.
") ArcOnS2;
		const opencascade::handle<Adaptor2d_Curve2d> & ArcOnS2();

		/****** IntPatch_Point::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** IntPatch_Point::IsMultiple ******/
		/****** md5 signature: d5ff9ea3f75ee3e6e0efda5814b9e44e ******/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point belongs to several intersection lines.
") IsMultiple;
		Standard_Boolean IsMultiple();

		/****** IntPatch_Point::IsOnDomS1 ******/
		/****** md5 signature: 73bb79eb09813ce2f78b4a234c9e417b ******/
		%feature("compactdefaultargs") IsOnDomS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point is on a boundary of the domain of the first patch.
") IsOnDomS1;
		Standard_Boolean IsOnDomS1();

		/****** IntPatch_Point::IsOnDomS2 ******/
		/****** md5 signature: 93e8adde96351fec102c7bd4f10efa11 ******/
		%feature("compactdefaultargs") IsOnDomS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point is on a boundary of the domain of the second patch.
") IsOnDomS2;
		Standard_Boolean IsOnDomS2();

		/****** IntPatch_Point::IsTangencyPoint ******/
		/****** md5 signature: a9c9faea523a7d80ff8416e04b887e70 ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the Point is a tangency point between the surfaces. If the Point is on one of the domain (IsOnDomS1 returns True or IsOnDomS2 returns True), an exception is raised.
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****** IntPatch_Point::IsVertexOnS1 ******/
		/****** md5 signature: f69812d2258e171cd6e9220af4bdf9a7 ******/
		%feature("compactdefaultargs") IsVertexOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point is a vertex on the initial restriction facet of the first surface.
") IsVertexOnS1;
		Standard_Boolean IsVertexOnS1();

		/****** IntPatch_Point::IsVertexOnS2 ******/
		/****** md5 signature: 2bca687752d3b31cff59a696d6463475 ******/
		%feature("compactdefaultargs") IsVertexOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point is a vertex on the initial restriction facet of the first surface.
") IsVertexOnS2;
		Standard_Boolean IsVertexOnS2();

		/****** IntPatch_Point::ParameterOnArc1 ******/
		/****** md5 signature: fd3d8eb9ed7668171a21e22983def6f0 ******/
		%feature("compactdefaultargs") ParameterOnArc1;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter of the point on the arc returned by the method ArcOnS2. The exception DomainError is raised if IsOnDomS1 returns False.
") ParameterOnArc1;
		Standard_Real ParameterOnArc1();

		/****** IntPatch_Point::ParameterOnArc2 ******/
		/****** md5 signature: aa992bbe43a517a3ff131f0c53ce4d8a ******/
		%feature("compactdefaultargs") ParameterOnArc2;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter of the point on the arc returned by the method ArcOnS2. The exception DomainError is raised if IsOnDomS2 returns False.
") ParameterOnArc2;
		Standard_Real ParameterOnArc2();

		/****** IntPatch_Point::ParameterOnLine ******/
		/****** md5 signature: 737a2a57e32e63a1ba587dea488e9583 ******/
		%feature("compactdefaultargs") ParameterOnLine;
		%feature("autodoc", "Return
-------
float

Description
-----------
This method returns the parameter of the point on the intersection line. If the points does not belong to an intersection line, the value returned does not have any sens.
") ParameterOnLine;
		Standard_Real ParameterOnLine();

		/****** IntPatch_Point::Parameters ******/
		/****** md5 signature: 30bdd599088f74dedd5979b152a07fd4 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
V1: float
U2: float
V2: float

Description
-----------
Returns the parameters on the first and on the second surface of the point.
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_Point::ParametersOnS1 ******/
		/****** md5 signature: 64f6fb4c23b753a8ae110d855799d804 ******/
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
V1: float

Description
-----------
Returns the parameters on the first surface of the point.
") ParametersOnS1;
		void ParametersOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_Point::ParametersOnS2 ******/
		/****** md5 signature: a037f950d5c09fdf632c55b7efba040b ******/
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "
Parameters
----------

Return
-------
U2: float
V2: float

Description
-----------
Returns the parameters on the second surface of the point.
") ParametersOnS2;
		void ParametersOnS2(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_Point::PntOn2S ******/
		/****** md5 signature: 2088ec360d33e9af1c8275f7d5a12197 ******/
		%feature("compactdefaultargs") PntOn2S;
		%feature("autodoc", "Return
-------
IntSurf_PntOn2S

Description
-----------
Returns the PntOn2S (geometric Point and the parameters).
") PntOn2S;
		const IntSurf_PntOn2S & PntOn2S();

		/****** IntPatch_Point::ReverseTransition ******/
		/****** md5 signature: e7f43ebc9ca8b3b75df4b5e0a05c5e52 ******/
		%feature("compactdefaultargs") ReverseTransition;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ReverseTransition;
		void ReverseTransition();

		/****** IntPatch_Point::SetArc ******/
		/****** md5 signature: b35cf70b8135224173a7500e8bfb6d70 ******/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "
Parameters
----------
OnFirst: bool
A: Adaptor2d_Curve2d
Param: float
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Return
-------
None

Description
-----------
Sets the values of a point which is on one of the domain, when both surfaces are implicit ones. If OnFirst is True, the point is on the domain of the first patch, otherwise the point is on the domain of the second surface.
") SetArc;
		void SetArc(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor2d_Curve2d> & A, const Standard_Real Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****** IntPatch_Point::SetMultiple ******/
		/****** md5 signature: ba432831fdf3206e67c99f5a09c82c20 ******/
		%feature("compactdefaultargs") SetMultiple;
		%feature("autodoc", "
Parameters
----------
IsMult: bool

Return
-------
None

Description
-----------
Sets (or unsets) the point as a point on several intersection line.
") SetMultiple;
		void SetMultiple(const Standard_Boolean IsMult);

		/****** IntPatch_Point::SetParameter ******/
		/****** md5 signature: 9c20628bfb58eb45593287ce353000c6 ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
Para: float

Return
-------
None

Description
-----------
Set the value of the parameter on the intersection line.
") SetParameter;
		void SetParameter(const Standard_Real Para);

		/****** IntPatch_Point::SetParameters ******/
		/****** md5 signature: 755b8f6dd45d6eff6cc745c4eabd14f0 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
U1: float
V1: float
U2: float
V2: float

Return
-------
None

Description
-----------
Sets the values of the parameters of the point on each surface.
") SetParameters;
		void SetParameters(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2);

		/****** IntPatch_Point::SetTolerance ******/
		/****** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****** IntPatch_Point::SetValue ******/
		/****** md5 signature: e8dc59ed3fac2d4ba87ce4256618e8a0 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt: gp_Pnt
Tol: float
Tangent: bool

Return
-------
None

Description
-----------
Sets the values of a point which is on no domain, when both surfaces are implicit ones. If Tangent is True, the point is a point of tangency between the surfaces.
") SetValue;
		void SetValue(const gp_Pnt & Pt, const Standard_Real Tol, const Standard_Boolean Tangent);

		/****** IntPatch_Point::SetValue ******/
		/****** md5 signature: 030ac1eb59faa7b90801ff6c52fc9800 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Pnt & Pt);

		/****** IntPatch_Point::SetValue ******/
		/****** md5 signature: 0b319b299a0494678d536a27e164845b ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
thePOn2S: IntSurf_PntOn2S

Return
-------
None

Description
-----------
Sets the value of <pt> member.
") SetValue;
		void SetValue(const IntSurf_PntOn2S & thePOn2S);

		/****** IntPatch_Point::SetVertex ******/
		/****** md5 signature: d6a1bcb9791834d88ec5b6eb34aa5dcf ******/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "
Parameters
----------
OnFirst: bool
V: Adaptor3d_HVertex

Return
-------
None

Description
-----------
Sets the values of a point which is a vertex on the initial facet of restriction of one of the surface. If OnFirst is True, the point is on the domain of the first patch, otherwise the point is on the domain of the second surface.
") SetVertex;
		void SetVertex(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor3d_HVertex> & V);

		/****** IntPatch_Point::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
This method returns the fuzziness on the point.
") Tolerance;
		Standard_Real Tolerance();

		/****** IntPatch_Point::TransitionLineArc1 ******/
		/****** md5 signature: 3c2f51f861994ac2130670399f843948 ******/
		%feature("compactdefaultargs") TransitionLineArc1;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
Returns the transition of the point on the intersection line with the arc on S1. The exception DomainError is raised if IsOnDomS1 returns False.
") TransitionLineArc1;
		const IntSurf_Transition & TransitionLineArc1();

		/****** IntPatch_Point::TransitionLineArc2 ******/
		/****** md5 signature: f951568f311bcb1309847a661eb86a91 ******/
		%feature("compactdefaultargs") TransitionLineArc2;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
Returns the transition of the point on the intersection line with the arc on S2. The exception DomainError is raised if IsOnDomS2 returns False.
") TransitionLineArc2;
		const IntSurf_Transition & TransitionLineArc2();

		/****** IntPatch_Point::TransitionOnS1 ******/
		/****** md5 signature: 8cb3d24c0def4cc671eb54590466ee5c ******/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
Returns the transition between the intersection line returned by the method Line and the arc on S1 returned by ArcOnS1(). The exception DomainError is raised if IsOnDomS1 returns False.
") TransitionOnS1;
		const IntSurf_Transition & TransitionOnS1();

		/****** IntPatch_Point::TransitionOnS2 ******/
		/****** md5 signature: a2716413c981c4ee8338310413d27dd3 ******/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
Returns the transition between the intersection line returned by the method Line and the arc on S2 returned by ArcOnS2. The exception DomainError is raised if IsOnDomS2 returns False.
") TransitionOnS2;
		const IntSurf_Transition & TransitionOnS2();

		/****** IntPatch_Point::Value ******/
		/****** md5 signature: eddd2908948849b73f6d8aacab318652 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the intersection point (geometric information).
") Value;
		const gp_Pnt Value();

		/****** IntPatch_Point::VertexOnS1 ******/
		/****** md5 signature: 6e7ddd3a0f44dd6dcb5d598d6d8b56dc ******/
		%feature("compactdefaultargs") VertexOnS1;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_HVertex>

Description
-----------
Returns the information about the point when it is on the domain of the first patch, i-e when the function IsVertexOnS1 returns True. Otherwise, an exception is raised.
") VertexOnS1;
		const opencascade::handle<Adaptor3d_HVertex> & VertexOnS1();

		/****** IntPatch_Point::VertexOnS2 ******/
		/****** md5 signature: e810e40154fb388d3f47ab3204e900a0 ******/
		%feature("compactdefaultargs") VertexOnS2;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_HVertex>

Description
-----------
Returns the information about the point when it is on the domain of the second patch, i-e when the function IsVertexOnS2 returns True. Otherwise, an exception is raised.
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
		/****** IntPatch_Polygo::DeflectionOverEstimation ******/
		/****** md5 signature: 43f4e747867c1147de91dcc2fd648827 ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the tolerance of the polygon.
") DeflectionOverEstimation;
		virtual Standard_Real DeflectionOverEstimation();

		/****** IntPatch_Polygo::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** IntPatch_Polygo::Error ******/
		/****** md5 signature: 585075c65a8681dedf24240dbb90f7f4 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Error;
		Standard_Real Error();

		/****** IntPatch_Polygo::NbPoints ******/
		/****** md5 signature: f447cbc80238739e4af5e7bf8698afd4 ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		virtual Standard_Integer NbPoints();

		/****** IntPatch_Polygo::NbSegments ******/
		/****** md5 signature: 3964cbfa1f20d4814234f7fc3d204bbb ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of Segments in the polyline.
") NbSegments;
		virtual Standard_Integer NbSegments();

		/****** IntPatch_Polygo::Point ******/
		/****** md5 signature: 3ab9edca994a69ca9424e287150bc2eb ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Point;
		virtual gp_Pnt2d Point(const Standard_Integer Index);

		/****** IntPatch_Polygo::Segment ******/
		/****** md5 signature: 86ed8dcd5c63b8c7622186f373e5af81 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theBegin: gp_Pnt2d
theEnd: gp_Pnt2d

Return
-------
None

Description
-----------
Returns the points of the segment <Index> in the Polygon.
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
		/****** IntPatch_PolyhedronTool::Bounding ******/
		/****** md5 signature: 62cea57f62e90f1f59dd4f0461684e2c ******/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntPatch_Polyhedron

Return
-------
Bnd_Box

Description
-----------
Give the bounding box of the Polyhedron.
") Bounding;
		static const Bnd_Box & Bounding(const IntPatch_Polyhedron & thePolyh);

		/****** IntPatch_PolyhedronTool::ComponentsBounding ******/
		/****** md5 signature: 3be44beddefd5df8ebca7137f8bc4df5 ******/
		%feature("compactdefaultargs") ComponentsBounding;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntPatch_Polyhedron

Return
-------
opencascade::handle<Bnd_HArray1OfBox>

Description
-----------
Give the array of boxes. The box <n> corresponding to the triangle <n>.
") ComponentsBounding;
		static const opencascade::handle<Bnd_HArray1OfBox> & ComponentsBounding(const IntPatch_Polyhedron & thePolyh);

		/****** IntPatch_PolyhedronTool::DeflectionOverEstimation ******/
		/****** md5 signature: c343bf3337861a156b50bb1071bddd97 ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntPatch_Polyhedron

Return
-------
float

Description
-----------
Give the tolerance of the polygon.
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation(const IntPatch_Polyhedron & thePolyh);

		/****** IntPatch_PolyhedronTool::NbTriangles ******/
		/****** md5 signature: bc1f65765f28cccf3319726eaa730a95 ******/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntPatch_Polyhedron

Return
-------
int

Description
-----------
Give the number of triangles in this polyhedral surface.
") NbTriangles;
		static Standard_Integer NbTriangles(const IntPatch_Polyhedron & thePolyh);

		/****** IntPatch_PolyhedronTool::Point ******/
		/****** md5 signature: 109f06f2e5b9dfa60d8906454215fca0 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntPatch_Polyhedron
Index: int

Return
-------
gp_Pnt

Description
-----------
Give the point of index i in the polyhedral surface.
") Point;
		static const gp_Pnt Point(const IntPatch_Polyhedron & thePolyh, const Standard_Integer Index);

		/****** IntPatch_PolyhedronTool::TriConnex ******/
		/****** md5 signature: d9916b13eb8aa9e0d0f6bda2bcb34cbb ******/
		%feature("compactdefaultargs") TriConnex;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntPatch_Polyhedron
Triang: int
Pivot: int
Pedge: int

Return
-------
TriCon: int
OtherP: int

Description
-----------
Gives the address Tricon of the triangle connexe to the triangle of address Triang by the edge Pivot Pedge and the third point of this connexe triangle. When we are on a free edge TriCon==0 but the function return the value of the triangle in the other side of Pivot on the free edge. Used to turn around a vertex.
") TriConnex;
		static Standard_Integer TriConnex(const IntPatch_Polyhedron & thePolyh, const Standard_Integer Triang, const Standard_Integer Pivot, const Standard_Integer Pedge, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** IntPatch_PolyhedronTool::Triangle ******/
		/****** md5 signature: e7579fd54115d4e98a4349222adfe06d ******/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntPatch_Polyhedron
Index: int

Return
-------
P1: int
P2: int
P3: int

Description
-----------
Give the indices of the 3 points of the triangle of address Index in the Polyhedron.
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
		/****** IntPatch_PrmPrmIntersection::IntPatch_PrmPrmIntersection ******/
		/****** md5 signature: 13ca72c86a53df35245b2d4f1d1237d8 ******/
		%feature("compactdefaultargs") IntPatch_PrmPrmIntersection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty Constructor.
") IntPatch_PrmPrmIntersection;
		 IntPatch_PrmPrmIntersection();

		/****** IntPatch_PrmPrmIntersection::CodeReject ******/
		/****** md5 signature: 2eddbed03b0012efdbeaa323b24365a6 ******/
		%feature("compactdefaultargs") CodeReject;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
No available documentation.
") CodeReject;
		Standard_Integer CodeReject(const Standard_Real x1, const Standard_Real y1, const Standard_Real z1, const Standard_Real x2, const Standard_Real y2, const Standard_Real z2, const Standard_Real x3, const Standard_Real y3, const Standard_Real z3);

		/****** IntPatch_PrmPrmIntersection::DansGrille ******/
		/****** md5 signature: 63fc7618edcef43ccb613725c0abf121 ******/
		%feature("compactdefaultargs") DansGrille;
		%feature("autodoc", "
Parameters
----------
t: int

Return
-------
int

Description
-----------
No available documentation.
") DansGrille;
		Standard_Integer DansGrille(const Standard_Integer t);

		/****** IntPatch_PrmPrmIntersection::GrilleInteger ******/
		/****** md5 signature: 6101cd196dae74940af7e5ba51962a3e ******/
		%feature("compactdefaultargs") GrilleInteger;
		%feature("autodoc", "
Parameters
----------
ix: int
iy: int
iz: int

Return
-------
int

Description
-----------
No available documentation.
") GrilleInteger;
		Standard_Integer GrilleInteger(const Standard_Integer ix, const Standard_Integer iy, const Standard_Integer iz);

		/****** IntPatch_PrmPrmIntersection::IntegerGrille ******/
		/****** md5 signature: 7040ab40d31d200cf9a68de48f8e0e4f ******/
		%feature("compactdefaultargs") IntegerGrille;
		%feature("autodoc", "
Parameters
----------
t: int

Return
-------
ix: int
iy: int
iz: int

Description
-----------
No available documentation.
") IntegerGrille;
		void IntegerGrille(const Standard_Integer t, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** IntPatch_PrmPrmIntersection::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the calculus was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntPatch_PrmPrmIntersection::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the is no intersection.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** IntPatch_PrmPrmIntersection::Line ******/
		/****** md5 signature: 0f19f87d200154ef5932a127697b505b ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<IntPatch_Line>

Description
-----------
Returns the line of range Index. An exception is raised if Index<=0 or Index>NbLine.
") Line;
		const opencascade::handle<IntPatch_Line> & Line(const Standard_Integer Index);

		/****** IntPatch_PrmPrmIntersection::NbLines ******/
		/****** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection lines.
") NbLines;
		Standard_Integer NbLines();

		/****** IntPatch_PrmPrmIntersection::NbPointsGrille ******/
		/****** md5 signature: bc59d1c5f80d095cb3ac55a785ead7d6 ******/
		%feature("compactdefaultargs") NbPointsGrille;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPointsGrille;
		Standard_Integer NbPointsGrille();

		/****** IntPatch_PrmPrmIntersection::NewLine ******/
		/****** md5 signature: 0d0c288fdd13a6a3a1c09201bf95a263 ******/
		%feature("compactdefaultargs") NewLine;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Caro2: Adaptor3d_Surface
IndexLine: int
LowPoint: int
HighPoint: int
NbPoints: int

Return
-------
opencascade::handle<IntPatch_Line>

Description
-----------
Computes about <NbPoints> Intersection Points on the Line <IndexLine> between the Points of Index <LowPoint> and <HighPoint>. //! All the points of the line of index <IndexLine> with an index between <LowPoint> and <HighPoint> are in the returned line. New Points are inserted between existing points if those points are not too closed. //! An exception is raised if Index<=0 or Index>NbLine. or if IsDone returns False.
") NewLine;
		opencascade::handle<IntPatch_Line> NewLine(const opencascade::handle<Adaptor3d_Surface> & Caro1, const opencascade::handle<Adaptor3d_Surface> & Caro2, const Standard_Integer IndexLine, const Standard_Integer LowPoint, const Standard_Integer HighPoint, const Standard_Integer NbPoints);

		/****** IntPatch_PrmPrmIntersection::Perform ******/
		/****** md5 signature: 0d9200f0b25095571291a45a9c7403a2 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Polyhedron1: IntPatch_Polyhedron
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_Surface
Polyhedron2: IntPatch_Polyhedron
Domain2: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Return
-------
None

Description
-----------
Performs the intersection between <Caro1> and <Caro2>. Associated Polyhedrons <Polyhedron1> and <Polyhedron2> are given.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Caro1, const IntPatch_Polyhedron & Polyhedron1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_Surface> & Caro2, const IntPatch_Polyhedron & Polyhedron2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****** IntPatch_PrmPrmIntersection::Perform ******/
		/****** md5 signature: 7c74c9aaaafb20bfa5724b3dd1491869 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Polyhedron1: IntPatch_Polyhedron
Domain1: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Caro1, const IntPatch_Polyhedron & Polyhedron1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****** IntPatch_PrmPrmIntersection::Perform ******/
		/****** md5 signature: a95441f01743bd42dc32ec486f64850b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_Surface
Domain2: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float
ClearFlag: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs the intersection between <Caro1> and <Caro2>. The method computes the polyhedron on each surface.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_Surface> & Caro2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment, const Standard_Boolean ClearFlag = Standard_True);

		/****** IntPatch_PrmPrmIntersection::Perform ******/
		/****** md5 signature: 1d681c5285df25502789e22bc030d7b6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_Surface
Domain2: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float
ListOfPnts: IntSurf_ListOfPntOn2S

Return
-------
None

Description
-----------
Performs the intersection between <Caro1> and <Caro2>. The method computes the polyhedron on each surface.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_Surface> & Caro2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment, IntSurf_ListOfPntOn2S & ListOfPnts);

		/****** IntPatch_PrmPrmIntersection::Perform ******/
		/****** md5 signature: 7671a04ed73f34934394c3c9667adea4 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_Surface
Domain2: Adaptor3d_TopolTool
U1: float
V1: float
U2: float
V2: float
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Return
-------
None

Description
-----------
Performs the intersection between <Caro1> and <Caro2>. The method computes the polyhedron on each surface.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_Surface> & Caro2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****** IntPatch_PrmPrmIntersection::Perform ******/
		/****** md5 signature: 3de3a2163094b14e56c1965bd94d3889 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Domain1: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Return
-------
None

Description
-----------
Performs the intersection between <Caro1> and <Caro2>. The method computes the polyhedron on each surface.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****** IntPatch_PrmPrmIntersection::Perform ******/
		/****** md5 signature: 1a44cb9c6eac192791cde5e27abf00ff ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_Surface
Polyhedron2: IntPatch_Polyhedron
Domain2: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Return
-------
None

Description
-----------
Performs the intersection between <Caro1> and <Caro2>. //! The polyhedron which approximates <Caro2>, <Polyhedron2> is given. The other one is computed.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_Surface> & Caro2, const IntPatch_Polyhedron & Polyhedron2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****** IntPatch_PrmPrmIntersection::Perform ******/
		/****** md5 signature: 011ce5fc4af5d367de8a18aaf3292ac1 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Polyhedron1: IntPatch_Polyhedron
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_Surface
Domain2: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Return
-------
None

Description
-----------
Performs the intersection between <Caro1> and <Caro2>. //! The polyhedron which approximates <Caro1>, <Polyhedron1> is given. The other one is computed.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Caro1, const IntPatch_Polyhedron & Polyhedron1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_Surface> & Caro2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****** IntPatch_PrmPrmIntersection::PointDepart ******/
		/****** md5 signature: 6c8cb83ae36d684cea6c78729ba31477 ******/
		%feature("compactdefaultargs") PointDepart;
		%feature("autodoc", "
Parameters
----------
LineOn2S: IntSurf_LineOn2S
S1: Adaptor3d_Surface
SU1: int
SV1: int
S2: Adaptor3d_Surface
SU2: int
SV2: int

Return
-------
None

Description
-----------
No available documentation.
") PointDepart;
		void PointDepart(opencascade::handle<IntSurf_LineOn2S> & LineOn2S, const opencascade::handle<Adaptor3d_Surface> & S1, const Standard_Integer SU1, const Standard_Integer SV1, const opencascade::handle<Adaptor3d_Surface> & S2, const Standard_Integer SU2, const Standard_Integer SV2);

		/****** IntPatch_PrmPrmIntersection::Remplit ******/
		/****** md5 signature: fbf915009d30635235aad52fdc09392b ******/
		%feature("compactdefaultargs") Remplit;
		%feature("autodoc", "
Parameters
----------
a: int
b: int
c: int
Map: IntPatch_PrmPrmIntersection_T3Bits

Return
-------
None

Description
-----------
No available documentation.
") Remplit;
		void Remplit(const Standard_Integer a, const Standard_Integer b, const Standard_Integer c, IntPatch_PrmPrmIntersection_T3Bits & Map);

		/****** IntPatch_PrmPrmIntersection::RemplitLin ******/
		/****** md5 signature: 10383209f342d5bdfa6a9e2f83be207e ******/
		%feature("compactdefaultargs") RemplitLin;
		%feature("autodoc", "
Parameters
----------
x1: int
y1: int
z1: int
x2: int
y2: int
z2: int
Map: IntPatch_PrmPrmIntersection_T3Bits

Return
-------
None

Description
-----------
No available documentation.
") RemplitLin;
		void RemplitLin(const Standard_Integer x1, const Standard_Integer y1, const Standard_Integer z1, const Standard_Integer x2, const Standard_Integer y2, const Standard_Integer z2, IntPatch_PrmPrmIntersection_T3Bits & Map);

		/****** IntPatch_PrmPrmIntersection::RemplitTri ******/
		/****** md5 signature: c82dcb51cafb529d6032e747280eca0a ******/
		%feature("compactdefaultargs") RemplitTri;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
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
		/****** IntPatch_PrmPrmIntersection_T3Bits::IntPatch_PrmPrmIntersection_T3Bits ******/
		/****** md5 signature: 1e59c69bab7a66c87344b2cef83f47ee ******/
		%feature("compactdefaultargs") IntPatch_PrmPrmIntersection_T3Bits;
		%feature("autodoc", "
Parameters
----------
size: int

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_PrmPrmIntersection_T3Bits;
		 IntPatch_PrmPrmIntersection_T3Bits(const Standard_Integer size);

		/****** IntPatch_PrmPrmIntersection_T3Bits::Add ******/
		/****** md5 signature: 98a402f6290d04fce66e9880a2a7b7b2 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
t: int

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const Standard_Integer t);

		/****** IntPatch_PrmPrmIntersection_T3Bits::And ******/
		/****** md5 signature: ec685a34548ff8895d0278e132c334bf ******/
		%feature("compactdefaultargs") And;
		%feature("autodoc", "
Parameters
----------
Oth: IntPatch_PrmPrmIntersection_T3Bits

Return
-------
indiceprecedent: int

Description
-----------
No available documentation.
") And;
		Standard_Integer And(IntPatch_PrmPrmIntersection_T3Bits & Oth, Standard_Integer &OutValue);

		/****** IntPatch_PrmPrmIntersection_T3Bits::Raz ******/
		/****** md5 signature: 56a9b96c08122998b97c1ac996af72b6 ******/
		%feature("compactdefaultargs") Raz;
		%feature("autodoc", "
Parameters
----------
t: int

Return
-------
None

Description
-----------
No available documentation.
") Raz;
		void Raz(const Standard_Integer t);

		/****** IntPatch_PrmPrmIntersection_T3Bits::ResetAnd ******/
		/****** md5 signature: 54dfe31b09e5a3c02e8155e330083c1c ******/
		%feature("compactdefaultargs") ResetAnd;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ResetAnd;
		void ResetAnd();

		/****** IntPatch_PrmPrmIntersection_T3Bits::Val ******/
		/****** md5 signature: 34f3d3ac041e2803382c64f8c722c400 ******/
		%feature("compactdefaultargs") Val;
		%feature("autodoc", "
Parameters
----------
t: int

Return
-------
int

Description
-----------
No available documentation.
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
		/****** IntPatch_RstInt::PutVertexOnLine ******/
		/****** md5 signature: 231b47a86513b11ff9a7cc4a051a50ca ******/
		%feature("compactdefaultargs") PutVertexOnLine;
		%feature("autodoc", "
Parameters
----------
L: IntPatch_Line
Surf: Adaptor3d_Surface
Domain: Adaptor3d_TopolTool
OtherSurf: Adaptor3d_Surface
OnFirst: bool
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") PutVertexOnLine;
		static void PutVertexOnLine(const opencascade::handle<IntPatch_Line> & L, const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const opencascade::handle<Adaptor3d_Surface> & OtherSurf, const Standard_Boolean OnFirst, const Standard_Real Tol);

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
		/****** IntPatch_SpecialPoints::AddCrossUVIsoPoint ******/
		/****** md5 signature: a319edea5078259423e23fd24fb3d186 ******/
		%feature("compactdefaultargs") AddCrossUVIsoPoint;
		%feature("autodoc", "
Parameters
----------
theQSurf: Adaptor3d_Surface
thePSurf: Adaptor3d_Surface
theRefPt: IntSurf_PntOn2S
theTol3d: float
theAddedPoint: IntSurf_PntOn2S
theIsReversed: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Adds the point defined as intersection of two isolines (U = 0 and V = 0) on theQSurf in theLine. theRefPt is used to correct adjusting parameters. If theIsReversed is True then theQSurf correspond to the second (otherwise, the first) surface while forming intersection point IntSurf_PntOn2S.
") AddCrossUVIsoPoint;
		static Standard_Boolean AddCrossUVIsoPoint(const opencascade::handle<Adaptor3d_Surface> & theQSurf, const opencascade::handle<Adaptor3d_Surface> & thePSurf, const IntSurf_PntOn2S & theRefPt, const Standard_Real theTol3d, IntSurf_PntOn2S & theAddedPoint, const Standard_Boolean theIsReversed = Standard_False);

		/****** IntPatch_SpecialPoints::AddPointOnUorVIso ******/
		/****** md5 signature: 6d7f1b0b3a8049412346caa7b5338111 ******/
		%feature("compactdefaultargs") AddPointOnUorVIso;
		%feature("autodoc", "
Parameters
----------
theQSurf: Adaptor3d_Surface
thePSurf: Adaptor3d_Surface
theRefPt: IntSurf_PntOn2S
theIsU: bool
theIsoParameter: float
theToler: math_VectorBase<double >
theInitPoint: math_VectorBase<double >
theInfBound: math_VectorBase<double >
theSupBound: math_VectorBase<double >
theAddedPoint: IntSurf_PntOn2S
theIsReversed: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Adds the point lain strictly in the isoline U = 0 or V = 0 of theQSurf, in theLine. theRefPt is used to correct adjusting parameters. If theIsReversed is True then theQSurf corresponds to the second (otherwise, the first) surface while forming intersection point IntSurf_PntOn2S. All math_Vector-objects must be filled as follows: [1] - U-parameter of thePSurf; [2] - V-parameter of thePSurf; [3] - U- (if V-isoline is considered) or V-parameter (if U-isoline is considered) of theQSurf.
") AddPointOnUorVIso;
		static Standard_Boolean AddPointOnUorVIso(const opencascade::handle<Adaptor3d_Surface> & theQSurf, const opencascade::handle<Adaptor3d_Surface> & thePSurf, const IntSurf_PntOn2S & theRefPt, const Standard_Boolean theIsU, const Standard_Real theIsoParameter, math_VectorBase<double > theToler, math_VectorBase<double > theInitPoint, math_VectorBase<double > theInfBound, math_VectorBase<double > theSupBound, IntSurf_PntOn2S & theAddedPoint, const Standard_Boolean theIsReversed = Standard_False);

		/****** IntPatch_SpecialPoints::AddSingularPole ******/
		/****** md5 signature: 73120d8dbfbdfee3c4c757432a86b338 ******/
		%feature("compactdefaultargs") AddSingularPole;
		%feature("autodoc", "
Parameters
----------
theQSurf: Adaptor3d_Surface
thePSurf: Adaptor3d_Surface
thePtIso: IntSurf_PntOn2S
theVertex: IntPatch_Point
theAddedPoint: IntSurf_PntOn2S
theIsReversed: bool (optional, default to Standard_False)
theIsReqRefCheck: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Computes the pole of sphere to add it in the intersection line. Stores the result in theAddedPoint variable (does not add in the line). At that, cone and sphere (with singularity) must be set in theQSurf parameter. By default (if theIsReversed == False), theQSurf is the first surface of the Walking line. If it is not, theIsReversed parameter must be set to True. theIsReqRefCheck is True if and only if 3D-point of theRefPt must be pole or apex for check (e.g. if it is vertex). thePtIso is the reference point for obtaining isoline where must be placed the Apex/Pole. //! ATTENTION!!! theVertex must be initialized before calling the method .
") AddSingularPole;
		static Standard_Boolean AddSingularPole(const opencascade::handle<Adaptor3d_Surface> & theQSurf, const opencascade::handle<Adaptor3d_Surface> & thePSurf, const IntSurf_PntOn2S & thePtIso, IntPatch_Point & theVertex, IntSurf_PntOn2S & theAddedPoint, const Standard_Boolean theIsReversed = Standard_False, const Standard_Boolean theIsReqRefCheck = Standard_False);

		/****** IntPatch_SpecialPoints::AdjustPointAndVertex ******/
		/****** md5 signature: 96a980073d3c92eb4aeb14d968555344 ******/
		%feature("compactdefaultargs") AdjustPointAndVertex;
		%feature("autodoc", "
Parameters
----------
theRefPoint: IntSurf_PntOn2S
theArrPeriods: float
theNewPoint: IntSurf_PntOn2S
theVertex: IntPatch_Point * (optional, default to 0)

Return
-------
None

Description
-----------
Sets theNewPoint parameters in 2D-space the closest to theRefPoint with help of adding/subtracting corresponding periods. theArrPeriods must be filled as follows: {<U-period of 1st surface>, <V-period of 1st surface>, <U-period of 2nd surface>, <V-period of 2nd surface>}. If theVertex != 0 then its parameters will be filled as corresponding parameters of theNewPoint. //! ATTENTION!!! theNewPoint is not only Output parameter. It is Input/Output one. I.e. theNewPoint is reference point together with theRefPt.
") AdjustPointAndVertex;
		static void AdjustPointAndVertex(const IntSurf_PntOn2S & theRefPoint, const Standard_Real theArrPeriods[4], IntSurf_PntOn2S & theNewPoint, IntPatch_Point * const theVertex = 0);

		/****** IntPatch_SpecialPoints::ContinueAfterSpecialPoint ******/
		/****** md5 signature: 6252d001f2605c004c9cc3c4c7f0001f ******/
		%feature("compactdefaultargs") ContinueAfterSpecialPoint;
		%feature("autodoc", "
Parameters
----------
theQSurf: Adaptor3d_Surface
thePSurf: Adaptor3d_Surface
theRefPt: IntSurf_PntOn2S
theSPType: IntPatch_SpecPntType
theTol2D: float
theNewPoint: IntSurf_PntOn2S
theIsReversed: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Special point has already been added in the line. Now, we need in correct prolongation of the line or in start new line. This function returns new point. //! ATTENTION!!! theNewPoint is not only Output parameter. It is Input/Output one. I.e. theNewPoint is reference point together with theRefPt.
") ContinueAfterSpecialPoint;
		static Standard_Boolean ContinueAfterSpecialPoint(const opencascade::handle<Adaptor3d_Surface> & theQSurf, const opencascade::handle<Adaptor3d_Surface> & thePSurf, const IntSurf_PntOn2S & theRefPt, const IntPatch_SpecPntType theSPType, const Standard_Real theTol2D, IntSurf_PntOn2S & theNewPoint, const Standard_Boolean theIsReversed = Standard_False);

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
		/****** IntPatch_TheIWLineOfTheIWalking::IntPatch_TheIWLineOfTheIWalking ******/
		/****** md5 signature: f30aa79b0d1c6bd12da4bab53a0ab6c8 ******/
		%feature("compactdefaultargs") IntPatch_TheIWLineOfTheIWalking;
		%feature("autodoc", "
Parameters
----------
theAllocator: IntSurf_Allocator (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_TheIWLineOfTheIWalking;
		 IntPatch_TheIWLineOfTheIWalking(const IntSurf_Allocator & theAllocator = 0);

		/****** IntPatch_TheIWLineOfTheIWalking::AddIndexPassing ******/
		/****** md5 signature: 5211f3a2dbfeb4744c3451bde1b6a45c ******/
		%feature("compactdefaultargs") AddIndexPassing;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
associer a l 'indice du point sur la ligne l'indice du point passant dans l'iterateur de depart.
") AddIndexPassing;
		void AddIndexPassing(const Standard_Integer Index);

		/****** IntPatch_TheIWLineOfTheIWalking::AddPoint ******/
		/****** md5 signature: 806b6da489848ff70e42ef52b8d76d5c ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
P: IntSurf_PntOn2S

Return
-------
None

Description
-----------
Add a point in the line.
") AddPoint;
		void AddPoint(const IntSurf_PntOn2S & P);

		/****** IntPatch_TheIWLineOfTheIWalking::AddStatusFirst ******/
		/****** md5 signature: 57c24fab44c44bc9f08fb80e64391777 ******/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "
Parameters
----------
Closed: bool
HasFirst: bool

Return
-------
None

Description
-----------
No available documentation.
") AddStatusFirst;
		void AddStatusFirst(const Standard_Boolean Closed, const Standard_Boolean HasFirst);

		/****** IntPatch_TheIWLineOfTheIWalking::AddStatusFirst ******/
		/****** md5 signature: 3bcc39dd9b427e47834d54029a984cdb ******/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "
Parameters
----------
Closed: bool
HasLast: bool
Index: int
P: IntSurf_PathPoint

Return
-------
None

Description
-----------
No available documentation.
") AddStatusFirst;
		void AddStatusFirst(const Standard_Boolean Closed, const Standard_Boolean HasLast, const Standard_Integer Index, const IntSurf_PathPoint & P);

		/****** IntPatch_TheIWLineOfTheIWalking::AddStatusFirstLast ******/
		/****** md5 signature: 9b5b9adcff3655cf97dda89c630e8677 ******/
		%feature("compactdefaultargs") AddStatusFirstLast;
		%feature("autodoc", "
Parameters
----------
Closed: bool
HasFirst: bool
HasLast: bool

Return
-------
None

Description
-----------
No available documentation.
") AddStatusFirstLast;
		void AddStatusFirstLast(const Standard_Boolean Closed, const Standard_Boolean HasFirst, const Standard_Boolean HasLast);

		/****** IntPatch_TheIWLineOfTheIWalking::AddStatusLast ******/
		/****** md5 signature: 9df59b95ec4c6ad4a61e31770913147d ******/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "
Parameters
----------
HasLast: bool

Return
-------
None

Description
-----------
No available documentation.
") AddStatusLast;
		void AddStatusLast(const Standard_Boolean HasLast);

		/****** IntPatch_TheIWLineOfTheIWalking::AddStatusLast ******/
		/****** md5 signature: 9af95226c154f17c39d5609cdec7266e ******/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "
Parameters
----------
HasLast: bool
Index: int
P: IntSurf_PathPoint

Return
-------
None

Description
-----------
No available documentation.
") AddStatusLast;
		void AddStatusLast(const Standard_Boolean HasLast, const Standard_Integer Index, const IntSurf_PathPoint & P);

		/****** IntPatch_TheIWLineOfTheIWalking::Cut ******/
		/****** md5 signature: f0e9f7dd0e1c0316cdc67bc759be51c9 ******/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
Cut the line at the point of rank Index.
") Cut;
		void Cut(const Standard_Integer Index);

		/****** IntPatch_TheIWLineOfTheIWalking::FirstPoint ******/
		/****** md5 signature: e0c1dbe8c28165db2dbe2ecf721fcc02 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntSurf_PathPoint

Description
-----------
Returns the first point of the line when it is a marching point. An exception is raised if HasFirstPoint returns False.
") FirstPoint;
		const IntSurf_PathPoint & FirstPoint();

		/****** IntPatch_TheIWLineOfTheIWalking::FirstPointIndex ******/
		/****** md5 signature: 286ccb2e16a94010c49f690b00f54ac3 ******/
		%feature("compactdefaultargs") FirstPointIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Index of first point of the line when it is a marching point.This index is the index in the PointStartIterator. An exception is raised if HasFirstPoint returns False.
") FirstPointIndex;
		Standard_Integer FirstPointIndex();

		/****** IntPatch_TheIWLineOfTheIWalking::HasFirstPoint ******/
		/****** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the first point of the line is a marching point . when is HasFirstPoint==False ,the line begins on the natural bound of the surface.the line can be too long.
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****** IntPatch_TheIWLineOfTheIWalking::HasLastPoint ******/
		/****** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the end point of the line is a marching point (Point from IntWS). when is HasFirstPoint==False ,the line ends on the natural bound of the surface.the line can be too long.
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****** IntPatch_TheIWLineOfTheIWalking::IsClosed ******/
		/****** md5 signature: 29709d02fadc9fcb79a766bc9679271b ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line is closed.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** IntPatch_TheIWLineOfTheIWalking::IsTangentAtBegining ******/
		/****** md5 signature: a56d1f9469c98eadc8b6f319bc216c7b ******/
		%feature("compactdefaultargs") IsTangentAtBegining;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangentAtBegining;
		Standard_Boolean IsTangentAtBegining();

		/****** IntPatch_TheIWLineOfTheIWalking::IsTangentAtEnd ******/
		/****** md5 signature: 105311500b205bba41fd4ab317165070 ******/
		%feature("compactdefaultargs") IsTangentAtEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangentAtEnd;
		Standard_Boolean IsTangentAtEnd();

		/****** IntPatch_TheIWLineOfTheIWalking::LastPoint ******/
		/****** md5 signature: 7876841b5cf564c633cdd87a1ac1e722 ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
IntSurf_PathPoint

Description
-----------
Returns the last point of the line when it is a marching point. An exception is raised if HasLastPoint returns False.
") LastPoint;
		const IntSurf_PathPoint & LastPoint();

		/****** IntPatch_TheIWLineOfTheIWalking::LastPointIndex ******/
		/****** md5 signature: 03702a2b3ccf8f424cd597daef257efb ******/
		%feature("compactdefaultargs") LastPointIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index of last point of the line when it is a marching point.This index is the index in the PointStartIterator. An exception is raised if HasLastPoint returns False.
") LastPointIndex;
		Standard_Integer LastPointIndex();

		/****** IntPatch_TheIWLineOfTheIWalking::Line ******/
		/****** md5 signature: d5c2cd917d9e773fdb8b23c68d6a1fdc ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
opencascade::handle<IntSurf_LineOn2S>

Description
-----------
Returns the LineOn2S contained in the walking line.
") Line;
		const opencascade::handle<IntSurf_LineOn2S> & Line();

		/****** IntPatch_TheIWLineOfTheIWalking::NbPassingPoint ******/
		/****** md5 signature: d0f6265bbd27e7d9360e0b1105cff054 ******/
		%feature("compactdefaultargs") NbPassingPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of points belonging to Pnts1 which are passing point.
") NbPassingPoint;
		Standard_Integer NbPassingPoint();

		/****** IntPatch_TheIWLineOfTheIWalking::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points of the line (including first point and end point: see HasLastPoint and HasFirstPoint).
") NbPoints;
		Standard_Integer NbPoints();

		/****** IntPatch_TheIWLineOfTheIWalking::PassingPoint ******/
		/****** md5 signature: 1ecf07ef770669b4329e847aa98917ae ******/
		%feature("compactdefaultargs") PassingPoint;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IndexLine: int
IndexPnts: int

Description
-----------
returns the index of the point belonging to the line which is associated to the passing point belonging to Pnts1 an exception is raised if Index > NbPassingPoint().
") PassingPoint;
		void PassingPoint(const Standard_Integer Index, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** IntPatch_TheIWLineOfTheIWalking::Reverse ******/
		/****** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
reverse the points in the line. Hasfirst, HasLast are kept.
") Reverse;
		void Reverse();

		/****** IntPatch_TheIWLineOfTheIWalking::SetTangencyAtBegining ******/
		/****** md5 signature: ea533706f2c44ba6eebb50b37aa11bce ******/
		%feature("compactdefaultargs") SetTangencyAtBegining;
		%feature("autodoc", "
Parameters
----------
IsTangent: bool

Return
-------
None

Description
-----------
No available documentation.
") SetTangencyAtBegining;
		void SetTangencyAtBegining(const Standard_Boolean IsTangent);

		/****** IntPatch_TheIWLineOfTheIWalking::SetTangencyAtEnd ******/
		/****** md5 signature: e69c7af21e7cb5c30f8431e2a8de655b ******/
		%feature("compactdefaultargs") SetTangencyAtEnd;
		%feature("autodoc", "
Parameters
----------
IsTangent: bool

Return
-------
None

Description
-----------
No available documentation.
") SetTangencyAtEnd;
		void SetTangencyAtEnd(const Standard_Boolean IsTangent);

		/****** IntPatch_TheIWLineOfTheIWalking::SetTangentVector ******/
		/****** md5 signature: 0e32ea065ed79437c3090e852108262e ******/
		%feature("compactdefaultargs") SetTangentVector;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec
Index: int

Return
-------
None

Description
-----------
No available documentation.
") SetTangentVector;
		void SetTangentVector(const gp_Vec & V, const Standard_Integer Index);

		/****** IntPatch_TheIWLineOfTheIWalking::TangentVector ******/
		/****** md5 signature: e2d9d7aae22a66c0f8d3bfaf92d891c0 ******/
		%feature("compactdefaultargs") TangentVector;
		%feature("autodoc", "
Parameters
----------

Return
-------
Index: int

Description
-----------
No available documentation.
") TangentVector;
		const gp_Vec TangentVector(Standard_Integer &OutValue);

		/****** IntPatch_TheIWLineOfTheIWalking::Value ******/
		/****** md5 signature: 8dd9e41f579d9d6e26d29bbd4f60e2b9 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_PntOn2S

Description
-----------
Returns the point of range Index. If index <= 0 or Index > NbPoints, an exception is raised.
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
		/****** IntPatch_TheIWalking::IntPatch_TheIWalking ******/
		/****** md5 signature: 6f94467f9684116584972e1e886af7fd ******/
		%feature("compactdefaultargs") IntPatch_TheIWalking;
		%feature("autodoc", "
Parameters
----------
Epsilon: float
Deflection: float
Step: float
theToFillHoles: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. Step is the maximum increment admitted between two consecutive points (in 2d space). Epsilon is the tolerance beyond which 2 points are confused. theToFillHoles is the flag defining whether possible holes between resulting curves are filled or not in case of IntPatch walking theToFillHoles is False.
") IntPatch_TheIWalking;
		 IntPatch_TheIWalking(const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Step, const Standard_Boolean theToFillHoles = Standard_False);

		/****** IntPatch_TheIWalking::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the calculus was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntPatch_TheIWalking::NbLines ******/
		/****** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of resulting polylines. An exception is raised if IsDone returns False.
") NbLines;
		Standard_Integer NbLines();

		/****** IntPatch_TheIWalking::NbSinglePnts ******/
		/****** md5 signature: 8a33644475ee84e2750fa4624ebcf8c0 ******/
		%feature("compactdefaultargs") NbSinglePnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points belonging to Pnts on which no line starts or ends. An exception is raised if IsDone returns False.
") NbSinglePnts;
		Standard_Integer NbSinglePnts();

		/****** IntPatch_TheIWalking::Perform ******/
		/****** md5 signature: 40fe650d607cd4b7d88a29bb07739141 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pnts1: IntSurf_SequenceOfPathPoint
Pnts2: IntSurf_SequenceOfInteriorPoint
Func: IntPatch_TheSurfFunction
S: Adaptor3d_Surface
Reversed: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Searches a set of polylines starting on a point of Pnts1 or Pnts2. Each point on a resulting polyline verifies F(u,v)=0.
") Perform;
		void Perform(const IntSurf_SequenceOfPathPoint & Pnts1, const IntSurf_SequenceOfInteriorPoint & Pnts2, IntPatch_TheSurfFunction & Func, const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Boolean Reversed = Standard_False);

		/****** IntPatch_TheIWalking::Perform ******/
		/****** md5 signature: 0171c85bf1c87c32db5515adeeba845f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pnts1: IntSurf_SequenceOfPathPoint
Func: IntPatch_TheSurfFunction
S: Adaptor3d_Surface
Reversed: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Searches a set of polylines starting on a point of Pnts1. Each point on a resulting polyline verifies F(u,v)=0.
") Perform;
		void Perform(const IntSurf_SequenceOfPathPoint & Pnts1, IntPatch_TheSurfFunction & Func, const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Boolean Reversed = Standard_False);

		/****** IntPatch_TheIWalking::SetTolerance ******/
		/****** md5 signature: 081b0efb39976d786ea1e8e9992511b4 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Epsilon: float
Deflection: float
Step: float

Return
-------
None

Description
-----------
Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. Step is the maximum increment admitted between two consecutive points (in 2d space). Epsilon is the tolerance beyond which 2 points are confused.
") SetTolerance;
		void SetTolerance(const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Step);

		/****** IntPatch_TheIWalking::SinglePnt ******/
		/****** md5 signature: 6dd92e40051e4e916aa83e976db4a997 ******/
		%feature("compactdefaultargs") SinglePnt;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_PathPoint

Description
-----------
Returns the point of range Index . An exception is raised if IsDone returns False. An exception is raised if Index<=0 or Index > NbSinglePnts.
") SinglePnt;
		const IntSurf_PathPoint & SinglePnt(const Standard_Integer Index);

		/****** IntPatch_TheIWalking::Value ******/
		/****** md5 signature: eaff6613753683678464590adc4e2ab3 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<IntPatch_TheIWLineOfTheIWalking>

Description
-----------
Returns the polyline of range Index. An exception is raised if IsDone is False. An exception is raised if Index<=0 or Index>NbLines.
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
		/****** IntPatch_ThePathPointOfTheSOnBounds::IntPatch_ThePathPointOfTheSOnBounds ******/
		/****** md5 signature: 950e45efbf1ebe13417c7e23de45ae8a ******/
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds();

		/****** IntPatch_ThePathPointOfTheSOnBounds::IntPatch_ThePathPointOfTheSOnBounds ******/
		/****** md5 signature: 5f22f988780e8fe44f3b2edda6da02ef ******/
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: float
V: Adaptor3d_HVertex
A: Adaptor2d_Curve2d
Parameter: float

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & A, const Standard_Real Parameter);

		/****** IntPatch_ThePathPointOfTheSOnBounds::IntPatch_ThePathPointOfTheSOnBounds ******/
		/****** md5 signature: bf31864b4b9346e0320580a8f4cf891b ******/
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: float
A: Adaptor2d_Curve2d
Parameter: float

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor2d_Curve2d> & A, const Standard_Real Parameter);

		/****** IntPatch_ThePathPointOfTheSOnBounds::Arc ******/
		/****** md5 signature: de8e47510fc50811ee5a3e0bc98029e6 ******/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") Arc;
		const opencascade::handle<Adaptor2d_Curve2d> & Arc();

		/****** IntPatch_ThePathPointOfTheSOnBounds::IsNew ******/
		/****** md5 signature: 3a3a8bc6ebd2fc2c25f224ff9e99af70 ******/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsNew;
		Standard_Boolean IsNew();

		/****** IntPatch_ThePathPointOfTheSOnBounds::Parameter ******/
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter();

		/****** IntPatch_ThePathPointOfTheSOnBounds::SetValue ******/
		/****** md5 signature: 03dce41028774d848e3e96d2ef0ca499 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: float
V: Adaptor3d_HVertex
A: Adaptor2d_Curve2d
Parameter: float

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & A, const Standard_Real Parameter);

		/****** IntPatch_ThePathPointOfTheSOnBounds::SetValue ******/
		/****** md5 signature: a4bb4cd1b8bb6bbe4fb31de340a9931c ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: float
A: Adaptor2d_Curve2d
Parameter: float

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor2d_Curve2d> & A, const Standard_Real Parameter);

		/****** IntPatch_ThePathPointOfTheSOnBounds::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		Standard_Real Tolerance();

		/****** IntPatch_ThePathPointOfTheSOnBounds::Value ******/
		/****** md5 signature: eddd2908948849b73f6d8aacab318652 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		const gp_Pnt Value();

		/****** IntPatch_ThePathPointOfTheSOnBounds::Vertex ******/
		/****** md5 signature: 7213fb18dc3be1f48818ab739bb98dfa ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_HVertex>

Description
-----------
No available documentation.
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
		/****** IntPatch_TheSOnBounds::IntPatch_TheSOnBounds ******/
		/****** md5 signature: 35ed78ed5dc90e5bd58bf2c0beb9f5c1 ******/
		%feature("compactdefaultargs") IntPatch_TheSOnBounds;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntPatch_TheSOnBounds;
		 IntPatch_TheSOnBounds();

		/****** IntPatch_TheSOnBounds::AllArcSolution ******/
		/****** md5 signature: fd074d16584452fef4f16b506eae3de1 ******/
		%feature("compactdefaultargs") AllArcSolution;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if all arc of the Arcs are solution (inside the surface). An exception is raised if IsDone returns False.
") AllArcSolution;
		Standard_Boolean AllArcSolution();

		/****** IntPatch_TheSOnBounds::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the calculus was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntPatch_TheSOnBounds::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of resulting points. An exception is raised if IsDone returns False (NotDone).
") NbPoints;
		Standard_Integer NbPoints();

		/****** IntPatch_TheSOnBounds::NbSegments ******/
		/****** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of the resulting segments. An exception is raised if IsDone returns False (NotDone).
") NbSegments;
		Standard_Integer NbSegments();

		/****** IntPatch_TheSOnBounds::Perform ******/
		/****** md5 signature: f1a389776ccbaa0d15b4ffb273c416d3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: IntPatch_ArcFunction
Domain: Adaptor3d_TopolTool
TolBoundary: float
TolTangency: float
RecheckOnRegularity: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Algorithm to find the points and parts of curves of Domain (domain of of restriction of a surface) which verify F = 0. TolBoundary defines if a curve is on Q. TolTangency defines if a point is on Q.
") Perform;
		void Perform(IntPatch_ArcFunction & F, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const Standard_Real TolBoundary, const Standard_Real TolTangency, const Standard_Boolean RecheckOnRegularity = Standard_False);

		/****** IntPatch_TheSOnBounds::Point ******/
		/****** md5 signature: ff9c6059b609788e3ae3b35c70d8a120 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_ThePathPointOfTheSOnBounds

Description
-----------
Returns the resulting point of range Index. The exception NotDone is raised if IsDone() returns False. The exception OutOfRange is raised if Index <= 0 or Index > NbPoints.
") Point;
		const IntPatch_ThePathPointOfTheSOnBounds & Point(const Standard_Integer Index);

		/****** IntPatch_TheSOnBounds::Segment ******/
		/****** md5 signature: 582451d247e2ffd669ea7baa5a82f527 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_TheSegmentOfTheSOnBounds

Description
-----------
Returns the resulting segment of range Index. The exception NotDone is raised if IsDone() returns False. The exception OutOfRange is raised if Index <= 0 or Index > NbPoints.
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
		/****** IntPatch_TheSearchInside::IntPatch_TheSearchInside ******/
		/****** md5 signature: 3b61b92a1141071fba4f10fc8dd2190d ******/
		%feature("compactdefaultargs") IntPatch_TheSearchInside;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_TheSearchInside;
		 IntPatch_TheSearchInside();

		/****** IntPatch_TheSearchInside::IntPatch_TheSearchInside ******/
		/****** md5 signature: 87893971a4666fabad1d2aeb00a43c8e ******/
		%feature("compactdefaultargs") IntPatch_TheSearchInside;
		%feature("autodoc", "
Parameters
----------
F: IntPatch_TheSurfFunction
Surf: Adaptor3d_Surface
T: Adaptor3d_TopolTool
Epsilon: float

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_TheSearchInside;
		 IntPatch_TheSearchInside(IntPatch_TheSurfFunction & F, const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & T, const Standard_Real Epsilon);

		/****** IntPatch_TheSearchInside::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntPatch_TheSearchInside::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points. The exception NotDone if raised if IsDone returns False.
") NbPoints;
		Standard_Integer NbPoints();

		/****** IntPatch_TheSearchInside::Perform ******/
		/****** md5 signature: 7da10d84bc509179e35ba7d3e51c23a3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: IntPatch_TheSurfFunction
Surf: Adaptor3d_Surface
T: Adaptor3d_TopolTool
Epsilon: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(IntPatch_TheSurfFunction & F, const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & T, const Standard_Real Epsilon);

		/****** IntPatch_TheSearchInside::Perform ******/
		/****** md5 signature: a3f915532ac931f167d00f9fbf0f6f3e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: IntPatch_TheSurfFunction
Surf: Adaptor3d_Surface
UStart: float
VStart: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(IntPatch_TheSurfFunction & F, const opencascade::handle<Adaptor3d_Surface> & Surf, const Standard_Real UStart, const Standard_Real VStart);

		/****** IntPatch_TheSearchInside::Value ******/
		/****** md5 signature: 32b603bd5d3112334230c3e7fbb789a7 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_InteriorPoint

Description
-----------
Returns the point of range Index. The exception NotDone if raised if IsDone returns False. The exception OutOfRange if raised if Index <= 0 or Index > NbPoints.
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
		/****** IntPatch_TheSegmentOfTheSOnBounds::IntPatch_TheSegmentOfTheSOnBounds ******/
		/****** md5 signature: a1aa63a1b06aae0ebd5e08e7d83b3d14 ******/
		%feature("compactdefaultargs") IntPatch_TheSegmentOfTheSOnBounds;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntPatch_TheSegmentOfTheSOnBounds;
		 IntPatch_TheSegmentOfTheSOnBounds();

		/****** IntPatch_TheSegmentOfTheSOnBounds::Curve ******/
		/****** md5 signature: 7869036a594a0e406162d60b4f92dc85 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the geometric curve on the surface 's domain which is solution.
") Curve;
		const opencascade::handle<Adaptor2d_Curve2d> & Curve();

		/****** IntPatch_TheSegmentOfTheSOnBounds::FirstPoint ******/
		/****** md5 signature: 04ae1a5baa94ab3c05537203f1b7c1f4 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntPatch_ThePathPointOfTheSOnBounds

Description
-----------
Returns the first point.
") FirstPoint;
		const IntPatch_ThePathPointOfTheSOnBounds & FirstPoint();

		/****** IntPatch_TheSegmentOfTheSOnBounds::HasFirstPoint ******/
		/****** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a vertex (ThePathPoint) defining the lowest valid parameter on the arc.
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****** IntPatch_TheSegmentOfTheSOnBounds::HasLastPoint ******/
		/****** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a vertex (ThePathPoint) defining the greatest valid parameter on the arc.
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****** IntPatch_TheSegmentOfTheSOnBounds::LastPoint ******/
		/****** md5 signature: 8b2eedd3d014003b00e96501ee48e8db ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
IntPatch_ThePathPointOfTheSOnBounds

Description
-----------
Returns the last point.
") LastPoint;
		const IntPatch_ThePathPointOfTheSOnBounds & LastPoint();

		/****** IntPatch_TheSegmentOfTheSOnBounds::SetLimitPoint ******/
		/****** md5 signature: 5d976ff1fe4e523ed518edb448dc6859 ******/
		%feature("compactdefaultargs") SetLimitPoint;
		%feature("autodoc", "
Parameters
----------
V: IntPatch_ThePathPointOfTheSOnBounds
First: bool

Return
-------
None

Description
-----------
Defines the first point or the last point, depending on the value of the boolean First.
") SetLimitPoint;
		void SetLimitPoint(const IntPatch_ThePathPointOfTheSOnBounds & V, const Standard_Boolean First);

		/****** IntPatch_TheSegmentOfTheSOnBounds::SetValue ******/
		/****** md5 signature: 53ce9238106071febf6db57a0ff8a99c ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
Defines the concerned arc.
") SetValue;
		void SetValue(const opencascade::handle<Adaptor2d_Curve2d> & A);

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
		/****** IntPatch_TheSurfFunction::IntPatch_TheSurfFunction ******/
		/****** md5 signature: 70806a35bf79fc7e6c702df06ecac7e3 ******/
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction();

		/****** IntPatch_TheSurfFunction::IntPatch_TheSurfFunction ******/
		/****** md5 signature: 68ea5aefe5ff7d84cafb3f65b5ce0042 ******/
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", "
Parameters
----------
PS: Adaptor3d_Surface
IS: IntSurf_Quadric

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction(const opencascade::handle<Adaptor3d_Surface> & PS, const IntSurf_Quadric & IS);

		/****** IntPatch_TheSurfFunction::IntPatch_TheSurfFunction ******/
		/****** md5 signature: 42bc39952a8bf10567de705f8fa66081 ******/
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", "
Parameters
----------
IS: IntSurf_Quadric

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction(const IntSurf_Quadric & IS);

		/****** IntPatch_TheSurfFunction::Derivatives ******/
		/****** md5 signature: 80ee5f16e62731c095910ad60228848b ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
No available documentation.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** IntPatch_TheSurfFunction::Direction2d ******/
		/****** md5 signature: e46e583c3b745511fb8654831bfa19d7 ******/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
No available documentation.
") Direction2d;
		const gp_Dir2d Direction2d();

		/****** IntPatch_TheSurfFunction::Direction3d ******/
		/****** md5 signature: ceda05eba57d20f6f3ce262f42faf157 ******/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") Direction3d;
		const gp_Vec Direction3d();

		/****** IntPatch_TheSurfFunction::ISurface ******/
		/****** md5 signature: 0401f703cbd4484a6014535602bb165f ******/
		%feature("compactdefaultargs") ISurface;
		%feature("autodoc", "Return
-------
IntSurf_Quadric

Description
-----------
No available documentation.
") ISurface;
		const IntSurf_Quadric & ISurface();

		/****** IntPatch_TheSurfFunction::IsTangent ******/
		/****** md5 signature: 52337431677eb50512a9391c1db95a81 ******/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangent;
		Standard_Boolean IsTangent();

		/****** IntPatch_TheSurfFunction::NbEquations ******/
		/****** md5 signature: 42be0dc2e32c8e563393e8490171707e ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		Standard_Integer NbEquations();

		/****** IntPatch_TheSurfFunction::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		Standard_Integer NbVariables();

		/****** IntPatch_TheSurfFunction::PSurface ******/
		/****** md5 signature: ba545ec7900073a2f2c5530d5104284d ******/
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") PSurface;
		const opencascade::handle<Adaptor3d_Surface> & PSurface();

		/****** IntPatch_TheSurfFunction::Point ******/
		/****** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Point;
		const gp_Pnt Point();

		/****** IntPatch_TheSurfFunction::Root ******/
		/****** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Root;
		Standard_Real Root();

		/****** IntPatch_TheSurfFunction::Set ******/
		/****** md5 signature: 9ddb344b11924e5532d547145d17d9e5 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
PS: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<Adaptor3d_Surface> & PS);

		/****** IntPatch_TheSurfFunction::Set ******/
		/****** md5 signature: 7e3e1092ebe5da1f71e965a1091893e3 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Tolerance: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Tolerance);

		/****** IntPatch_TheSurfFunction::SetImplicitSurface ******/
		/****** md5 signature: 0ad3b55688a2be8e3aa7ec9c9bcbd283 ******/
		%feature("compactdefaultargs") SetImplicitSurface;
		%feature("autodoc", "
Parameters
----------
IS: IntSurf_Quadric

Return
-------
None

Description
-----------
No available documentation.
") SetImplicitSurface;
		void SetImplicitSurface(const IntSurf_Quadric & IS);

		/****** IntPatch_TheSurfFunction::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value Tol so that if Abs(Func.Root())<Tol the function is considered null.
") Tolerance;
		Standard_Real Tolerance();

		/****** IntPatch_TheSurfFunction::Value ******/
		/****** md5 signature: 31f6ba581b8fae503400d98976418349 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
No available documentation.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** IntPatch_TheSurfFunction::Values ******/
		/****** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
No available documentation.
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
		/****** IntPatch_WLineTool::ComputePurgedWLine ******/
		/****** md5 signature: 067a504e7ac00975f92ff99c161406ec ******/
		%feature("compactdefaultargs") ComputePurgedWLine;
		%feature("autodoc", "
Parameters
----------
theWLine: IntPatch_WLine
theS1: Adaptor3d_Surface
theS2: Adaptor3d_Surface
theDom1: Adaptor3d_TopolTool
theDom2: Adaptor3d_TopolTool

Return
-------
opencascade::handle<IntPatch_WLine>

Description
-----------
I Removes equal points (leave one of equal points) from theWLine and recompute vertex parameters. //! II Removes point out of borders in case of non periodic surfaces. //! III Removes exceed points using tube criteria: delete 7D point if it lies near to expected lines in 2d and 3d. Each task (2d, 2d, 3d) have its own tolerance and checked separately. //! Returns new WLine or null WLine if the number of the points is less than 2.
") ComputePurgedWLine;
		static opencascade::handle<IntPatch_WLine> ComputePurgedWLine(const opencascade::handle<IntPatch_WLine> & theWLine, const opencascade::handle<Adaptor3d_Surface> & theS1, const opencascade::handle<Adaptor3d_Surface> & theS2, const opencascade::handle<Adaptor3d_TopolTool> & theDom1, const opencascade::handle<Adaptor3d_TopolTool> & theDom2);

		/****** IntPatch_WLineTool::ExtendTwoWLines ******/
		/****** md5 signature: 372061cab2579d8a7ec5a10a5bae33ed ******/
		%feature("compactdefaultargs") ExtendTwoWLines;
		%feature("autodoc", "
Parameters
----------
theSlin: IntPatch_SequenceOfLine
theS1: Adaptor3d_Surface
theS2: Adaptor3d_Surface
theToler3D: float
theArrPeriods: float *
theBoxS1: Bnd_Box2d
theBoxS2: Bnd_Box2d
theListOfCriticalPoints: NCollection_List<gp_Pnt>

Return
-------
None

Description
-----------
Extends every line from theSlin (if it is possible) to be started/finished in strictly determined point (in the place of joint of two lines). As result, some gaps between two lines will vanish. The Walking lines are supposed (algorithm will do nothing for not-Walking line) to be computed as a result of intersection. Both theS1 and theS2 must be quadrics. Other cases are not supported. theArrPeriods must be filled as follows (every value must not be negative; if the surface is not periodic the period must be equal to 0.0 strictly): {<U-period of 1st surface>, <V-period of 1st surface>, <U-period of 2nd surface>, <V-period of 2nd surface>}. theListOfCriticalPoints must contain 3D-points where joining is disabled.
") ExtendTwoWLines;
		static void ExtendTwoWLines(IntPatch_SequenceOfLine & theSlin, const opencascade::handle<Adaptor3d_Surface> & theS1, const opencascade::handle<Adaptor3d_Surface> & theS2, const Standard_Real theToler3D, const Standard_Real * const theArrPeriods, const Bnd_Box2d & theBoxS1, const Bnd_Box2d & theBoxS2, const NCollection_List<gp_Pnt> & theListOfCriticalPoints);

		/****** IntPatch_WLineTool::JoinWLines ******/
		/****** md5 signature: 4222436c6469c078ffbed1ef478238db ******/
		%feature("compactdefaultargs") JoinWLines;
		%feature("autodoc", "
Parameters
----------
theSlin: IntPatch_SequenceOfLine
theSPnt: IntPatch_SequenceOfPoint
theS1: Adaptor3d_Surface
theS2: Adaptor3d_Surface
theTol3D: float

Return
-------
None

Description
-----------
Joins all WLines from theSlin to one if it is possible and records the result into theSlin again. Lines will be kept to be split if: a) they are separated (has no common points); b) resulted line (after joining) go through seam-edges or surface boundaries. //! In addition, if points in theSPnt lies at least in one of the line in theSlin, this point will be deleted.
") JoinWLines;
		static void JoinWLines(IntPatch_SequenceOfLine & theSlin, IntPatch_SequenceOfPoint & theSPnt, opencascade::handle<Adaptor3d_Surface > theS1, opencascade::handle<Adaptor3d_Surface > theS2, const Standard_Real theTol3D);

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
		/****** IntPatch_ALine::IntPatch_ALine ******/
		/****** md5 signature: 9010f93f8c4e698d62bb7523b8820b85 ******/
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "
Parameters
----------
C: IntAna_Curve
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Creates an analytic intersection line when the transitions are In or Out.
") IntPatch_ALine;
		 IntPatch_ALine(const IntAna_Curve & C, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****** IntPatch_ALine::IntPatch_ALine ******/
		/****** md5 signature: 571e66e0ef24dae21f5212d6d8ba5d14 ******/
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "
Parameters
----------
C: IntAna_Curve
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Return
-------
None

Description
-----------
Creates an analytic intersection line when the transitions are Touch.
") IntPatch_ALine;
		 IntPatch_ALine(const IntAna_Curve & C, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****** IntPatch_ALine::IntPatch_ALine ******/
		/****** md5 signature: 9b1b615709dab30b09144f781621aaff ******/
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "
Parameters
----------
C: IntAna_Curve
Tang: bool

Return
-------
None

Description
-----------
Creates an analytic intersection line when the transitions are Undecided.
") IntPatch_ALine;
		 IntPatch_ALine(const IntAna_Curve & C, const Standard_Boolean Tang);

		/****** IntPatch_ALine::AddVertex ******/
		/****** md5 signature: 4576312baa80d87344c656c8730d3075 ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
Pnt: IntPatch_Point

Return
-------
None

Description
-----------
To add a vertex in the list.
") AddVertex;
		void AddVertex(const IntPatch_Point & Pnt);

		/****** IntPatch_ALine::ChangeVertex ******/
		/****** md5 signature: 02d71b47e92bf61c55ec22617897065a ******/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
IntPatch_Point

Description
-----------
Allows modifying the vertex with index theIndex on the line.
") ChangeVertex;
		IntPatch_Point & ChangeVertex(const Standard_Integer theIndex);

		/****** IntPatch_ALine::ComputeVertexParameters ******/
		/****** md5 signature: 77c91f07a2cb487df3310057933c84f5 ******/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.
") ComputeVertexParameters;
		void ComputeVertexParameters(const Standard_Real Tol);

		/****** IntPatch_ALine::Curve ******/
		/****** md5 signature: 70d603d1367b2d334bdbbd7b0a4fd912 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
IntAna_Curve

Description
-----------
No available documentation.
") Curve;
		IntAna_Curve Curve();

		/****** IntPatch_ALine::D1 ******/
		/****** md5 signature: ba74a6b24051c3de7f090b0e159de939 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
Du: gp_Vec

Return
-------
bool

Description
-----------
Returns Standard_True when the derivative at parameter U is defined on the analytic intersection line. In that case, Du is the derivative. Returns Standard_False when it is not possible to evaluate the derivative. In both cases, P is the point at parameter U on the intersection.
") D1;
		Standard_Boolean D1(const Standard_Real U, gp_Pnt & P, gp_Vec & Du);

		/****** IntPatch_ALine::FindParameter ******/
		/****** md5 signature: dab72e39e175512eaf3620eb76e16397 ******/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
theParams: TColStd_ListOfReal

Return
-------
None

Description
-----------
Tries to find the parameters of the point P on the curve. If the method returns False, the 'projection' is impossible. If the method returns True at least one parameter has been found. theParams is always sorted in ascending order.
") FindParameter;
		void FindParameter(const gp_Pnt & P, TColStd_ListOfReal & theParams);

		/****** IntPatch_ALine::FirstParameter ******/
		/****** md5 signature: 1cbadcff1f685cbfc099ecc8fcd9ea27 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------

Return
-------
IsIncluded: bool

Description
-----------
Returns the first parameter on the intersection line. If IsIncluded returns True, Value and D1 methods can be call with a parameter equal to FirstParameter. Otherwise, the parameter must be greater than FirstParameter.
") FirstParameter;
		Standard_Real FirstParameter(Standard_Boolean &OutValue);

		/****** IntPatch_ALine::FirstPoint ******/
		/****** md5 signature: a9cf472622afe53ffedbf93049e1ae87 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntPatch_Point

Description
-----------
Returns the IntPoint corresponding to the FirstPoint. An exception is raised when HasFirstPoint returns False.
") FirstPoint;
		const IntPatch_Point & FirstPoint();

		/****** IntPatch_ALine::HasFirstPoint ******/
		/****** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line has a known First point. This point is given by the method FirstPoint().
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****** IntPatch_ALine::HasLastPoint ******/
		/****** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line has a known Last point. This point is given by the method LastPoint().
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****** IntPatch_ALine::LastParameter ******/
		/****** md5 signature: 3ecbcdc3f6497c567ff2f9adb0493aed ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------

Return
-------
IsIncluded: bool

Description
-----------
Returns the last parameter on the intersection line. If IsIncluded returns True, Value and D1 methods can be call with a parameter equal to LastParameter. Otherwise, the parameter must be less than LastParameter.
") LastParameter;
		Standard_Real LastParameter(Standard_Boolean &OutValue);

		/****** IntPatch_ALine::LastPoint ******/
		/****** md5 signature: f1c788d8502e367e84924ee37d5745d2 ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
IntPatch_Point

Description
-----------
Returns the IntPoint corresponding to the LastPoint. An exception is raised when HasLastPoint returns False.
") LastPoint;
		const IntPatch_Point & LastPoint();

		/****** IntPatch_ALine::NbVertex ******/
		/****** md5 signature: b2d226bac64a106c7941ef45ff4e07f1 ******/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVertex;
		Standard_Integer NbVertex();

		/****** IntPatch_ALine::Replace ******/
		/****** md5 signature: 26f627e400d5ec4fd796489f34c68a92 ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
Index: int
Pnt: IntPatch_Point

Return
-------
None

Description
-----------
Replaces the element of range Index in the list of points.
") Replace;
		void Replace(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****** IntPatch_ALine::SetFirstPoint ******/
		/****** md5 signature: 25fa45b5d9bd6687fb9b3e0c731bb2c5 ******/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "
Parameters
----------
IndFirst: int

Return
-------
None

Description
-----------
No available documentation.
") SetFirstPoint;
		void SetFirstPoint(const Standard_Integer IndFirst);

		/****** IntPatch_ALine::SetLastPoint ******/
		/****** md5 signature: e92f18b207577df6b281f4b27f093c31 ******/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "
Parameters
----------
IndLast: int

Return
-------
None

Description
-----------
No available documentation.
") SetLastPoint;
		void SetLastPoint(const Standard_Integer IndLast);

		/****** IntPatch_ALine::Value ******/
		/****** md5 signature: a9175f1b48e8e645db80a520f3e4e7b9 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Pnt

Description
-----------
Returns the point of parameter U on the analytic intersection line.
") Value;
		gp_Pnt Value(const Standard_Real U);

		/****** IntPatch_ALine::Vertex ******/
		/****** md5 signature: f9aa0b5079416f21b4a58d4398d2657e ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the vertex of range Index on the line.
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
		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: cee0fcb79d8ec8c0385770c29c4b2931 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Creates a Line as intersection line when the transitions are In or Out.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Lin & L, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: d6edb6ee8ca225bcca4c0697bfc4208d ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Return
-------
None

Description
-----------
Creates a Line as intersection line when the transitions are Touch.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Lin & L, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 63fa5a02a355e9f6a27245fa94bc6c1d ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
Tang: bool

Return
-------
None

Description
-----------
Creates a Line as intersection line when the transitions are Undecided.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Lin & L, const Standard_Boolean Tang);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 0300931498617ce1be00cbed11578735 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Creates a circle as intersection line when the transitions are In or Out.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Circ & C, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 807601abc0604326fec764e246f8fa12 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Return
-------
None

Description
-----------
Creates a circle as intersection line when the transitions are Touch.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Circ & C, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 69870093fcf25b4b4b2d8ec25eb6cea4 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
Tang: bool

Return
-------
None

Description
-----------
Creates a circle as intersection line when the transitions are Undecided.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Circ & C, const Standard_Boolean Tang);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 2778cdac18226c2f39966574508f7e80 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Creates an ellipse as intersection line when the transitions are In or Out.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Elips & E, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 4af53faedffea99bf074576d3cb431d8 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Return
-------
None

Description
-----------
Creates an ellispe as intersection line when the transitions are Touch.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Elips & E, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 0826d594e29e4665070255413f6fd851 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips
Tang: bool

Return
-------
None

Description
-----------
Creates an ellipse as intersection line when the transitions are Undecided.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Elips & E, const Standard_Boolean Tang);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: f0a5eb49cee40837a0487507ddf0eb94 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Creates a parabola as intersection line when the transitions are In or Out.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Parab & P, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: b381d5912911ecff277552d3e4f781af ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Return
-------
None

Description
-----------
Creates a parabola as intersection line when the transitions are Touch.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Parab & P, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: c456d7449b6cada23c52beaf2155c2fd ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab
Tang: bool

Return
-------
None

Description
-----------
Creates a parabola as intersection line when the transitions are Undecided.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Parab & P, const Standard_Boolean Tang);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 374dd2610a878442d4661568daa57537 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Creates an hyperbola as intersection line when the transitions are In or Out.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Hypr & H, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: d02fb4628988052e518850db601c47f4 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Return
-------
None

Description
-----------
Creates an hyperbola as intersection line when the transitions are Touch.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Hypr & H, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 480cd4b5b8def2abfec686c81bb2d644 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr
Tang: bool

Return
-------
None

Description
-----------
Creates an hyperbola as intersection line when the transitions are Undecided.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Hypr & H, const Standard_Boolean Tang);

		/****** IntPatch_GLine::AddVertex ******/
		/****** md5 signature: 4576312baa80d87344c656c8730d3075 ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
Pnt: IntPatch_Point

Return
-------
None

Description
-----------
To add a vertex in the list.
") AddVertex;
		void AddVertex(const IntPatch_Point & Pnt);

		/****** IntPatch_GLine::Circle ******/
		/****** md5 signature: cab8b08988d177bd7107adbbccc4ef89 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
Returns the Circ from gp corresponding to the intersection when ArcType returns IntPatch_Circle.
") Circle;
		gp_Circ Circle();

		/****** IntPatch_GLine::ComputeVertexParameters ******/
		/****** md5 signature: 77c91f07a2cb487df3310057933c84f5 ******/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.
") ComputeVertexParameters;
		void ComputeVertexParameters(const Standard_Real Tol);

		/****** IntPatch_GLine::Ellipse ******/
		/****** md5 signature: b6da2657e61960166cfe0f18dac79c1f ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
Returns the Elips from gp corresponding to the intersection when ArcType returns IntPatch_Ellipse.
") Ellipse;
		gp_Elips Ellipse();

		/****** IntPatch_GLine::FirstPoint ******/
		/****** md5 signature: a9cf472622afe53ffedbf93049e1ae87 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntPatch_Point

Description
-----------
Returns the IntPoint corresponding to the FirstPoint. An exception is raised when HasFirstPoint returns False.
") FirstPoint;
		const IntPatch_Point & FirstPoint();

		/****** IntPatch_GLine::HasFirstPoint ******/
		/****** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line has a known First point. This point is given by the method FirstPoint().
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****** IntPatch_GLine::HasLastPoint ******/
		/****** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line has a known Last point. This point is given by the method LastPoint().
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****** IntPatch_GLine::Hyperbola ******/
		/****** md5 signature: 766d3e1ddfb79a4ee7d6daea9d3565cd ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
Returns the Hypr from gp corresponding to the intersection when ArcType returns IntPatch_Hyperbola.
") Hyperbola;
		gp_Hypr Hyperbola();

		/****** IntPatch_GLine::LastPoint ******/
		/****** md5 signature: f1c788d8502e367e84924ee37d5745d2 ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
IntPatch_Point

Description
-----------
Returns the IntPoint corresponding to the LastPoint. An exception is raised when HasLastPoint returns False.
") LastPoint;
		const IntPatch_Point & LastPoint();

		/****** IntPatch_GLine::Line ******/
		/****** md5 signature: 63e1fa189ca3bcfdb401241217a93bfb ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
Returns the Lin from gp corresponding to the intersection when ArcType returns IntPatch_Line.
") Line;
		gp_Lin Line();

		/****** IntPatch_GLine::NbVertex ******/
		/****** md5 signature: b2d226bac64a106c7941ef45ff4e07f1 ******/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVertex;
		Standard_Integer NbVertex();

		/****** IntPatch_GLine::Parabola ******/
		/****** md5 signature: 44bd09c360bea3d33e8c3aa19668649c ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
Returns the Parab from gp corresponding to the intersection when ArcType returns IntPatch_Parabola.
") Parabola;
		gp_Parab Parabola();

		/****** IntPatch_GLine::Replace ******/
		/****** md5 signature: 26f627e400d5ec4fd796489f34c68a92 ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
Index: int
Pnt: IntPatch_Point

Return
-------
None

Description
-----------
To replace the element of range Index in the list of points.
") Replace;
		void Replace(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****** IntPatch_GLine::SetFirstPoint ******/
		/****** md5 signature: 25fa45b5d9bd6687fb9b3e0c731bb2c5 ******/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "
Parameters
----------
IndFirst: int

Return
-------
None

Description
-----------
No available documentation.
") SetFirstPoint;
		void SetFirstPoint(const Standard_Integer IndFirst);

		/****** IntPatch_GLine::SetLastPoint ******/
		/****** md5 signature: e92f18b207577df6b281f4b27f093c31 ******/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "
Parameters
----------
IndLast: int

Return
-------
None

Description
-----------
No available documentation.
") SetLastPoint;
		void SetLastPoint(const Standard_Integer IndLast);

		/****** IntPatch_GLine::Vertex ******/
		/****** md5 signature: f9aa0b5079416f21b4a58d4398d2657e ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the vertex of range Index on the line.
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
		/****** IntPatch_PointLine::AddVertex ******/
		/****** md5 signature: 55529d1530ffb71aa077a7f37a458483 ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
Pnt: IntPatch_Point
theIsPrepend: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Adds a vertex in the list. If theIsPrepend == True the new vertex will be added before the first element of vertices sequence. Otherwise, to the end of the sequence.
") AddVertex;
		virtual void AddVertex(const IntPatch_Point & Pnt, const Standard_Boolean theIsPrepend = Standard_False);

		/****** IntPatch_PointLine::ChangeVertex ******/
		/****** md5 signature: 0817fe5027f9e400d6b1cb56fa0520ec ******/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the vertex of range Index on the line.
") ChangeVertex;
		virtual IntPatch_Point & ChangeVertex(const Standard_Integer Index);

		/****** IntPatch_PointLine::ClearVertexes ******/
		/****** md5 signature: e553b210f8fd2c05d701b415328660d6 ******/
		%feature("compactdefaultargs") ClearVertexes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes vertices from the line.
") ClearVertexes;
		virtual void ClearVertexes();

		/****** IntPatch_PointLine::CurvatureRadiusOfIntersLine ******/
		/****** md5 signature: 63cace9f55b02ed46e45f51c0a879a64 ******/
		%feature("compactdefaultargs") CurvatureRadiusOfIntersLine;
		%feature("autodoc", "
Parameters
----------
theS1: Adaptor3d_Surface
theS2: Adaptor3d_Surface
theUVPoint: IntSurf_PntOn2S

Return
-------
float

Description
-----------
Returns the radius of curvature of the intersection line in given point. Returns negative value if computation is not possible.
") CurvatureRadiusOfIntersLine;
		static Standard_Real CurvatureRadiusOfIntersLine(const opencascade::handle<Adaptor3d_Surface> & theS1, const opencascade::handle<Adaptor3d_Surface> & theS2, const IntSurf_PntOn2S & theUVPoint);

		/****** IntPatch_PointLine::Curve ******/
		/****** md5 signature: fd1c616d11a26155c96378983fd082eb ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<IntSurf_LineOn2S>

Description
-----------
Returns set of intersection points.
") Curve;
		virtual opencascade::handle<IntSurf_LineOn2S> Curve();

		/****** IntPatch_PointLine::IsOutBox ******/
		/****** md5 signature: ac73c0eb3228f5b54eb6f00873ef9985 ******/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
bool

Description
-----------
Returns True if P is out of the box built from 3D-points.
") IsOutBox;
		virtual Standard_Boolean IsOutBox(const gp_Pnt & P);

		/****** IntPatch_PointLine::IsOutSurf1Box ******/
		/****** md5 signature: 6c738336718e5dceea69c92ad3423c6d ******/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if P1 is out of the box built from the points on 1st surface.
") IsOutSurf1Box;
		virtual Standard_Boolean IsOutSurf1Box(const gp_Pnt2d & P1);

		/****** IntPatch_PointLine::IsOutSurf2Box ******/
		/****** md5 signature: efbf01679be78d99442a6da31833da91 ******/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "
Parameters
----------
P2: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if P2 is out of the box built from the points on 2nd surface.
") IsOutSurf2Box;
		virtual Standard_Boolean IsOutSurf2Box(const gp_Pnt2d & P2);

		/****** IntPatch_PointLine::NbPnts ******/
		/****** md5 signature: c5514ce0e6327bd31ea1966935900a95 ******/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection points.
") NbPnts;
		virtual Standard_Integer NbPnts();

		/****** IntPatch_PointLine::NbVertex ******/
		/****** md5 signature: dc10ac56e6d323bf20c133e93ae395c2 ******/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of vertices (IntPatch_Point) of the line.
") NbVertex;
		virtual Standard_Integer NbVertex();

		/****** IntPatch_PointLine::Point ******/
		/****** md5 signature: dc729d221ade3b0d9d552601988516c8 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_PntOn2S

Description
-----------
Returns the intersection point of range Index.
") Point;
		virtual const IntSurf_PntOn2S & Point(const Standard_Integer Index);

		/****** IntPatch_PointLine::RemoveVertex ******/
		/****** md5 signature: 3022c4df19172007ce6a2e59e9384369 ******/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Removes single vertex from the line.
") RemoveVertex;
		virtual void RemoveVertex(const Standard_Integer theIndex);

		/****** IntPatch_PointLine::Vertex ******/
		/****** md5 signature: bd5ed6f12cf05dc5205d92f5b9da74da ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the vertex of range Index on the line.
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
		/****** IntPatch_PolyArc::IntPatch_PolyArc ******/
		/****** md5 signature: 62e5cd5c939388a333bbd41ca63e5258 ******/
		%feature("compactdefaultargs") IntPatch_PolyArc;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d
NbSample: int
Pfirst: float
Plast: float
BoxOtherPolygon: Bnd_Box2d

Return
-------
None

Description
-----------
Creates the polygon of the arc A on the surface S. The arc is limited by the parameters Pfirst and Plast. None of these parameters can be infinite.
") IntPatch_PolyArc;
		 IntPatch_PolyArc(const opencascade::handle<Adaptor2d_Curve2d> & A, const Standard_Integer NbSample, const Standard_Real Pfirst, const Standard_Real Plast, const Bnd_Box2d & BoxOtherPolygon);

		/****** IntPatch_PolyArc::Closed ******/
		/****** md5 signature: d59fdedf4c3161ce15be68a68c704b63 ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Closed;
		virtual Standard_Boolean Closed();

		/****** IntPatch_PolyArc::NbPoints ******/
		/****** md5 signature: 3e3d3343473673427df8cf1f8a38ad57 ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		Standard_Integer NbPoints();

		/****** IntPatch_PolyArc::Parameter ******/
		/****** md5 signature: 82ceab80f2b18ab921fa91f907001d9f ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter(const Standard_Integer Index);

		/****** IntPatch_PolyArc::Point ******/
		/****** md5 signature: 4c06f92dbe0eb485c456f37c7e794ace ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Point;
		gp_Pnt2d Point(const Standard_Integer Index);

		/****** IntPatch_PolyArc::SetOffset ******/
		/****** md5 signature: 15728cf6068c3aed0a1524961cca7295 ******/
		%feature("compactdefaultargs") SetOffset;
		%feature("autodoc", "
Parameters
----------
OffsetX: float
OffsetY: float

Return
-------
None

Description
-----------
No available documentation.
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
		/****** IntPatch_PolyLine::IntPatch_PolyLine ******/
		/****** md5 signature: 8212f213bf80b9c977f1aa379030ec1f ******/
		%feature("compactdefaultargs") IntPatch_PolyLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_PolyLine;
		 IntPatch_PolyLine();

		/****** IntPatch_PolyLine::IntPatch_PolyLine ******/
		/****** md5 signature: acc134664e751cd2230d541e5f2b089f ******/
		%feature("compactdefaultargs") IntPatch_PolyLine;
		%feature("autodoc", "
Parameters
----------
InitDefle: float

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_PolyLine;
		 IntPatch_PolyLine(const Standard_Real InitDefle);

		/****** IntPatch_PolyLine::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		Standard_Integer NbPoints();

		/****** IntPatch_PolyLine::Point ******/
		/****** md5 signature: dfa31b44e58975a6577c15284df2704c ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Point;
		gp_Pnt2d Point(const Standard_Integer Index);

		/****** IntPatch_PolyLine::ResetError ******/
		/****** md5 signature: 4d627cbc12d8ebadf8a1332c52bcc8f0 ******/
		%feature("compactdefaultargs") ResetError;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ResetError;
		void ResetError();

		/****** IntPatch_PolyLine::SetRLine ******/
		/****** md5 signature: f8272f934b6cf922209a3ba0d869d5b8 ******/
		%feature("compactdefaultargs") SetRLine;
		%feature("autodoc", "
Parameters
----------
OnFirst: bool
Line: IntPatch_RLine

Return
-------
None

Description
-----------
No available documentation.
") SetRLine;
		void SetRLine(const Standard_Boolean OnFirst, const opencascade::handle<IntPatch_RLine> & Line);

		/****** IntPatch_PolyLine::SetWLine ******/
		/****** md5 signature: 220619f38a5eea001899d134cf1ba3a9 ******/
		%feature("compactdefaultargs") SetWLine;
		%feature("autodoc", "
Parameters
----------
OnFirst: bool
Line: IntPatch_WLine

Return
-------
None

Description
-----------
No available documentation.
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
		/****** IntPatch_RLine::IntPatch_RLine ******/
		/****** md5 signature: 10ffd30b1811e3763803d8518450f434 ******/
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "
Parameters
----------
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Creates a restriction as an intersection line when the transitions are In or Out.
") IntPatch_RLine;
		 IntPatch_RLine(const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****** IntPatch_RLine::IntPatch_RLine ******/
		/****** md5 signature: 73a9c7999f491c62a065eb84477fd2e5 ******/
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "
Parameters
----------
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Return
-------
None

Description
-----------
Creates a restriction as an intersection line when the transitions are Touch.
") IntPatch_RLine;
		 IntPatch_RLine(const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****** IntPatch_RLine::IntPatch_RLine ******/
		/****** md5 signature: 0ef410c1b9df1d0e93a141c862f8ba14 ******/
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "
Parameters
----------
Tang: bool

Return
-------
None

Description
-----------
Creates a restriction as an intersection line when the transitions are Undecided.
") IntPatch_RLine;
		 IntPatch_RLine(const Standard_Boolean Tang);

		/****** IntPatch_RLine::Add ******/
		/****** md5 signature: 05c40b60e3b887503ab9a2852dc97f60 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
L: IntSurf_LineOn2S

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const opencascade::handle<IntSurf_LineOn2S> & L);

		/****** IntPatch_RLine::AddVertex ******/
		/****** md5 signature: 7e2f16d636115984b93075ab7287900d ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
Pnt: IntPatch_Point
theIsPrepend: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Adds a vertex in the list. If theIsPrepend == True the new vertex will be added before the first element of vertices sequence. Otherwise, to the end of the sequence.
") AddVertex;
		virtual void AddVertex(const IntPatch_Point & Pnt, const Standard_Boolean theIsPrepend = Standard_False);

		/****** IntPatch_RLine::ArcOnS1 ******/
		/****** md5 signature: 85135db99004c68167f0f6d4c3e12e08 ******/
		%feature("compactdefaultargs") ArcOnS1;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the concerned arc.
") ArcOnS1;
		const opencascade::handle<Adaptor2d_Curve2d> & ArcOnS1();

		/****** IntPatch_RLine::ArcOnS2 ******/
		/****** md5 signature: 8bdcf3526697d60e43350266dbc562b1 ******/
		%feature("compactdefaultargs") ArcOnS2;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the concerned arc.
") ArcOnS2;
		const opencascade::handle<Adaptor2d_Curve2d> & ArcOnS2();

		/****** IntPatch_RLine::ChangeVertex ******/
		/****** md5 signature: 1e83b5d9880fcd9a98f2804dd7cb6fc4 ******/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the vertex of range Index on the line.
") ChangeVertex;
		virtual IntPatch_Point & ChangeVertex(const Standard_Integer Index);

		/****** IntPatch_RLine::ClearVertexes ******/
		/****** md5 signature: 8e37b31ec56631f461cdc4e1055bf6e1 ******/
		%feature("compactdefaultargs") ClearVertexes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes vertices from the line (i.e. cleans svtx member).
") ClearVertexes;
		virtual void ClearVertexes();

		/****** IntPatch_RLine::ComputeVertexParameters ******/
		/****** md5 signature: 77c91f07a2cb487df3310057933c84f5 ******/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.
") ComputeVertexParameters;
		void ComputeVertexParameters(const Standard_Real Tol);

		/****** IntPatch_RLine::Curve ******/
		/****** md5 signature: 00a2774cb5170e703dac6867fe8bb651 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<IntSurf_LineOn2S>

Description
-----------
Returns set of intersection points.
") Curve;
		virtual opencascade::handle<IntSurf_LineOn2S> Curve();

		/****** IntPatch_RLine::Dump ******/
		/****** md5 signature: 02aaf609ae95c8e9a60f1190fb33839c ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
if (theMode == 0) then prints the information about WLine if (theMode == 1) then prints the list of 3d-points if (theMode == 2) then prints the list of 2d-points on the 1st surface Otherwise, prints list of 2d-points on the 2nd surface.
") Dump;
		void Dump(const Standard_Integer theMode);

		/****** IntPatch_RLine::FirstPoint ******/
		/****** md5 signature: a9cf472622afe53ffedbf93049e1ae87 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntPatch_Point

Description
-----------
Returns the IntPoint corresponding to the FirstPoint. An exception is raised when HasFirstPoint returns False.
") FirstPoint;
		const IntPatch_Point & FirstPoint();

		/****** IntPatch_RLine::HasFirstPoint ******/
		/****** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line has a known First point. This point is given by the method FirstPoint().
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****** IntPatch_RLine::HasLastPoint ******/
		/****** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line has a known Last point. This point is given by the method LastPoint().
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****** IntPatch_RLine::HasPolygon ******/
		/****** md5 signature: f1b288e08ae8f62501d19cd934eaf0fd ******/
		%feature("compactdefaultargs") HasPolygon;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasPolygon;
		Standard_Boolean HasPolygon();

		/****** IntPatch_RLine::IsArcOnS1 ******/
		/****** md5 signature: 6119a53b08f37d3de8fd138a94e19614 ******/
		%feature("compactdefaultargs") IsArcOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection is on the domain of the first patch. Returns False if the intersection is on the domain of the second patch.
") IsArcOnS1;
		Standard_Boolean IsArcOnS1();

		/****** IntPatch_RLine::IsArcOnS2 ******/
		/****** md5 signature: c3922ccd61d0375ac5bbd0780008d88d ******/
		%feature("compactdefaultargs") IsArcOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection is on the domain of the first patch. Returns False if the intersection is on the domain of the second patch.
") IsArcOnS2;
		Standard_Boolean IsArcOnS2();

		/****** IntPatch_RLine::IsOutBox ******/
		/****** md5 signature: 4f6fcc13a4ffbd4a01c7bb7bcbd958a3 ******/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
bool

Description
-----------
Returns True if theP is out of the box built from 3D-points.
") IsOutBox;
		virtual Standard_Boolean IsOutBox(const gp_Pnt & theP);

		/****** IntPatch_RLine::IsOutSurf1Box ******/
		/****** md5 signature: bc67542a32380859aa385c9f948a1fac ******/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if theP is out of the box built from the points on 1st surface.
") IsOutSurf1Box;
		virtual Standard_Boolean IsOutSurf1Box(const gp_Pnt2d & theP);

		/****** IntPatch_RLine::IsOutSurf2Box ******/
		/****** md5 signature: 34129bd36f4bb2710c5de5bade625438 ******/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if theP is out of the box built from the points on 2nd surface.
") IsOutSurf2Box;
		virtual Standard_Boolean IsOutSurf2Box(const gp_Pnt2d & theP);

		/****** IntPatch_RLine::LastPoint ******/
		/****** md5 signature: f1c788d8502e367e84924ee37d5745d2 ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
IntPatch_Point

Description
-----------
Returns the IntPoint corresponding to the LastPoint. An exception is raised when HasLastPoint returns False.
") LastPoint;
		const IntPatch_Point & LastPoint();

		/****** IntPatch_RLine::NbPnts ******/
		/****** md5 signature: 9b3bac1b760e9cf6c2af2102c55fe59f ******/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection points.
") NbPnts;
		virtual Standard_Integer NbPnts();

		/****** IntPatch_RLine::NbVertex ******/
		/****** md5 signature: 5245ca4f7f52f7737e0d09a36f7eb3f1 ******/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of vertices (IntPatch_Point) of the line.
") NbVertex;
		virtual Standard_Integer NbVertex();

		/****** IntPatch_RLine::ParamOnS1 ******/
		/****** md5 signature: 6999d11b074ba874b5b6add1b45db6be ******/
		%feature("compactdefaultargs") ParamOnS1;
		%feature("autodoc", "
Parameters
----------

Return
-------
p1: float
p2: float

Description
-----------
No available documentation.
") ParamOnS1;
		void ParamOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_RLine::ParamOnS2 ******/
		/****** md5 signature: 24623c711a2671ef020445e718fbe861 ******/
		%feature("compactdefaultargs") ParamOnS2;
		%feature("autodoc", "
Parameters
----------

Return
-------
p1: float
p2: float

Description
-----------
No available documentation.
") ParamOnS2;
		void ParamOnS2(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_RLine::Point ******/
		/****** md5 signature: 71a4eaea066ecd2781a45257516a1d34 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_PntOn2S

Description
-----------
Returns the intersection point of range Index.
") Point;
		virtual const IntSurf_PntOn2S & Point(const Standard_Integer Index);

		/****** IntPatch_RLine::RemoveVertex ******/
		/****** md5 signature: 72a5feba37233a6b75ea096f48e3e8a6 ******/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Removes single vertex from the line.
") RemoveVertex;
		virtual void RemoveVertex(const Standard_Integer theIndex);

		/****** IntPatch_RLine::Replace ******/
		/****** md5 signature: 26f627e400d5ec4fd796489f34c68a92 ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
Index: int
Pnt: IntPatch_Point

Return
-------
None

Description
-----------
Replaces the element of range Index in the list of points.
") Replace;
		void Replace(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****** IntPatch_RLine::SetArcOnS1 ******/
		/****** md5 signature: 16396892957c40b9d06bd8ad24545a99 ******/
		%feature("compactdefaultargs") SetArcOnS1;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") SetArcOnS1;
		void SetArcOnS1(const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****** IntPatch_RLine::SetArcOnS2 ******/
		/****** md5 signature: c6efc090e240adb6cf7df64d0f88353c ******/
		%feature("compactdefaultargs") SetArcOnS2;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") SetArcOnS2;
		void SetArcOnS2(const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****** IntPatch_RLine::SetCurve ******/
		/****** md5 signature: bf65967bc9e019b213d3c9bd5deadd2f ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
theNewCurve: IntSurf_LineOn2S

Return
-------
None

Description
-----------
No available documentation.
") SetCurve;
		void SetCurve(const opencascade::handle<IntSurf_LineOn2S> & theNewCurve);

		/****** IntPatch_RLine::SetFirstPoint ******/
		/****** md5 signature: 25fa45b5d9bd6687fb9b3e0c731bb2c5 ******/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "
Parameters
----------
IndFirst: int

Return
-------
None

Description
-----------
No available documentation.
") SetFirstPoint;
		void SetFirstPoint(const Standard_Integer IndFirst);

		/****** IntPatch_RLine::SetLastPoint ******/
		/****** md5 signature: e92f18b207577df6b281f4b27f093c31 ******/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "
Parameters
----------
IndLast: int

Return
-------
None

Description
-----------
No available documentation.
") SetLastPoint;
		void SetLastPoint(const Standard_Integer IndLast);

		/****** IntPatch_RLine::SetPoint ******/
		/****** md5 signature: 67660bb296fa310caa0347f4427366b9 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
Index: int
Pnt: IntPatch_Point

Return
-------
None

Description
-----------
Set the Point of index <Index> in the LineOn2S.
") SetPoint;
		void SetPoint(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****** IntPatch_RLine::Vertex ******/
		/****** md5 signature: b3fd41d3f11681ff4530174231f024bd ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the vertex of range Index on the line.
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

/* python proxy classes for enums */
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

		/****** IntPatch_WLine::IntPatch_WLine ******/
		/****** md5 signature: 18734a8ce1f3e284355493d9c1733d55 ******/
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "
Parameters
----------
Line: IntSurf_LineOn2S
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Creates a WLine as an intersection when the transitions are In or Out.
") IntPatch_WLine;
		 IntPatch_WLine(const opencascade::handle<IntSurf_LineOn2S> & Line, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****** IntPatch_WLine::IntPatch_WLine ******/
		/****** md5 signature: 0ba69fcbd0ab83bd69c04103cdb3455d ******/
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "
Parameters
----------
Line: IntSurf_LineOn2S
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Return
-------
None

Description
-----------
Creates a WLine as an intersection when the transitions are Touch.
") IntPatch_WLine;
		 IntPatch_WLine(const opencascade::handle<IntSurf_LineOn2S> & Line, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****** IntPatch_WLine::IntPatch_WLine ******/
		/****** md5 signature: 336cdfde190a0d8c4b70167a260c0514 ******/
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "
Parameters
----------
Line: IntSurf_LineOn2S
Tang: bool

Return
-------
None

Description
-----------
Creates a WLine as an intersection when the transitions are Undecided.
") IntPatch_WLine;
		 IntPatch_WLine(const opencascade::handle<IntSurf_LineOn2S> & Line, const Standard_Boolean Tang);

		/****** IntPatch_WLine::AddVertex ******/
		/****** md5 signature: 7e2f16d636115984b93075ab7287900d ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
Pnt: IntPatch_Point
theIsPrepend: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Adds a vertex in the list. If theIsPrepend == True the new vertex will be added before the first element of vertices sequence. Otherwise, to the end of the sequence.
") AddVertex;
		virtual void AddVertex(const IntPatch_Point & Pnt, const Standard_Boolean theIsPrepend = Standard_False);

		/****** IntPatch_WLine::ChangeVertex ******/
		/****** md5 signature: 1e83b5d9880fcd9a98f2804dd7cb6fc4 ******/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the vertex of range Index on the line.
") ChangeVertex;
		virtual IntPatch_Point & ChangeVertex(const Standard_Integer Index);

		/****** IntPatch_WLine::ClearVertexes ******/
		/****** md5 signature: a0144d82471d6551510ccf26edef3227 ******/
		%feature("compactdefaultargs") ClearVertexes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes vertices from the line (i.e. cleans svtx member).
") ClearVertexes;
		virtual void ClearVertexes();

		/****** IntPatch_WLine::ComputeVertexParameters ******/
		/****** md5 signature: 77c91f07a2cb487df3310057933c84f5 ******/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.
") ComputeVertexParameters;
		void ComputeVertexParameters(const Standard_Real Tol);

		/****** IntPatch_WLine::Curve ******/
		/****** md5 signature: 00a2774cb5170e703dac6867fe8bb651 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<IntSurf_LineOn2S>

Description
-----------
Returns set of intersection points.
") Curve;
		virtual opencascade::handle<IntSurf_LineOn2S> Curve();

		/****** IntPatch_WLine::Dump ******/
		/****** md5 signature: 02aaf609ae95c8e9a60f1190fb33839c ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
if (theMode == 0) then prints the information about WLine if (theMode == 1) then prints the list of 3d-points if (theMode == 2) then prints the list of 2d-points on the 1st surface Otherwise, prints list of 2d-points on the 2nd surface.
") Dump;
		void Dump(const Standard_Integer theMode);

		/****** IntPatch_WLine::EnablePurging ******/
		/****** md5 signature: 8bca7b8764264010691efedf6d63c426 ******/
		%feature("compactdefaultargs") EnablePurging;
		%feature("autodoc", "
Parameters
----------
theIsEnabled: bool

Return
-------
None

Description
-----------
Allows or forbids purging of existing WLine.
") EnablePurging;
		void EnablePurging(const Standard_Boolean theIsEnabled);

		/****** IntPatch_WLine::FirstPoint ******/
		/****** md5 signature: a9cf472622afe53ffedbf93049e1ae87 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntPatch_Point

Description
-----------
Returns the Point corresponding to the FirstPoint.
") FirstPoint;
		const IntPatch_Point & FirstPoint();

		/****** IntPatch_WLine::FirstPoint ******/
		/****** md5 signature: 5bed348e2313cd3aea008f0896538065 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "
Parameters
----------

Return
-------
Indfirst: int

Description
-----------
Returns the Point corresponding to the FirstPoint. Indfirst is the index of the first in the list of vertices.
") FirstPoint;
		const IntPatch_Point & FirstPoint(Standard_Integer &OutValue);

		/****** IntPatch_WLine::GetArcOnS1 ******/
		/****** md5 signature: 12cfec6cf09f5a397a70c92db1e276de ******/
		%feature("compactdefaultargs") GetArcOnS1;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") GetArcOnS1;
		const opencascade::handle<Adaptor2d_Curve2d> & GetArcOnS1();

		/****** IntPatch_WLine::GetArcOnS2 ******/
		/****** md5 signature: e65c0208cec5f2bddfacbd4718d88472 ******/
		%feature("compactdefaultargs") GetArcOnS2;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") GetArcOnS2;
		const opencascade::handle<Adaptor2d_Curve2d> & GetArcOnS2();

		/****** IntPatch_WLine::GetCreatingWay ******/
		/****** md5 signature: f32c6d1c4904acc2c040d4a118a49582 ******/
		%feature("compactdefaultargs") GetCreatingWay;
		%feature("autodoc", "Return
-------
IntPatch_WLine::IntPatch_WLType

Description
-----------
Returns the way of <*this> creation.
") GetCreatingWay;
		IntPatch_WLine::IntPatch_WLType GetCreatingWay();

		/****** IntPatch_WLine::HasArcOnS1 ******/
		/****** md5 signature: 8868354e4f346cdb153201e572da56df ******/
		%feature("compactdefaultargs") HasArcOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasArcOnS1;
		Standard_Boolean HasArcOnS1();

		/****** IntPatch_WLine::HasArcOnS2 ******/
		/****** md5 signature: cc105f8269b52a95fe4b70d8c49705d4 ******/
		%feature("compactdefaultargs") HasArcOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasArcOnS2;
		Standard_Boolean HasArcOnS2();

		/****** IntPatch_WLine::HasFirstPoint ******/
		/****** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line has a known First point. This point is given by the method FirstPoint().
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****** IntPatch_WLine::HasLastPoint ******/
		/****** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line has a known Last point. This point is given by the method LastPoint().
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****** IntPatch_WLine::InsertVertexBefore ******/
		/****** md5 signature: e97c0dec2d7b22854be265d964a2b4d3 ******/
		%feature("compactdefaultargs") InsertVertexBefore;
		%feature("autodoc", "
Parameters
----------
theIndex: int
thePnt: IntPatch_Point

Return
-------
None

Description
-----------
No available documentation.
") InsertVertexBefore;
		void InsertVertexBefore(const Standard_Integer theIndex, const IntPatch_Point & thePnt);

		/****** IntPatch_WLine::IsOutBox ******/
		/****** md5 signature: 860544030de6408c828004bbab030531 ******/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
bool

Description
-----------
Returns True if theP is out of the box built from 3D-points.
") IsOutBox;
		Standard_Boolean IsOutBox(const gp_Pnt & theP);

		/****** IntPatch_WLine::IsOutSurf1Box ******/
		/****** md5 signature: 51099a21ed98d5d18f27e5111981f7c6 ******/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if theP is out of the box built from the points on 1st surface.
") IsOutSurf1Box;
		Standard_Boolean IsOutSurf1Box(const gp_Pnt2d & theP);

		/****** IntPatch_WLine::IsOutSurf2Box ******/
		/****** md5 signature: 05073c4f1a83d1988d2cd42479760f97 ******/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if theP is out of the box built from the points on 2nd surface.
") IsOutSurf2Box;
		Standard_Boolean IsOutSurf2Box(const gp_Pnt2d & theP);

		/****** IntPatch_WLine::IsPurgingAllowed ******/
		/****** md5 signature: 81dfdd92b6d4ef244aa76db0fb30c050 ******/
		%feature("compactdefaultargs") IsPurgingAllowed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if purging is allowed or forbidden for existing WLine.
") IsPurgingAllowed;
		Standard_Boolean IsPurgingAllowed();

		/****** IntPatch_WLine::LastPoint ******/
		/****** md5 signature: f1c788d8502e367e84924ee37d5745d2 ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
IntPatch_Point

Description
-----------
Returns the Point corresponding to the LastPoint.
") LastPoint;
		const IntPatch_Point & LastPoint();

		/****** IntPatch_WLine::LastPoint ******/
		/****** md5 signature: 0fc90016575e4e649bbc9e962943f393 ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "
Parameters
----------

Return
-------
Indlast: int

Description
-----------
Returns the Point corresponding to the LastPoint. Indlast is the index of the last in the list of vertices.
") LastPoint;
		const IntPatch_Point & LastPoint(Standard_Integer &OutValue);

		/****** IntPatch_WLine::NbPnts ******/
		/****** md5 signature: 9b3bac1b760e9cf6c2af2102c55fe59f ******/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection points.
") NbPnts;
		virtual Standard_Integer NbPnts();

		/****** IntPatch_WLine::NbVertex ******/
		/****** md5 signature: 5245ca4f7f52f7737e0d09a36f7eb3f1 ******/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of vertices (IntPatch_Point) of the line.
") NbVertex;
		virtual Standard_Integer NbVertex();

		/****** IntPatch_WLine::Point ******/
		/****** md5 signature: 71a4eaea066ecd2781a45257516a1d34 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_PntOn2S

Description
-----------
Returns the intersection point of range Index.
") Point;
		virtual const IntSurf_PntOn2S & Point(const Standard_Integer Index);

		/****** IntPatch_WLine::RemoveVertex ******/
		/****** md5 signature: 72a5feba37233a6b75ea096f48e3e8a6 ******/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Removes single vertex from the line.
") RemoveVertex;
		virtual void RemoveVertex(const Standard_Integer theIndex);

		/****** IntPatch_WLine::Replace ******/
		/****** md5 signature: 26f627e400d5ec4fd796489f34c68a92 ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
Index: int
Pnt: IntPatch_Point

Return
-------
None

Description
-----------
Replaces the element of range Index in the list of points. The exception OutOfRange is raised when Index <= 0 or Index > NbVertex.
") Replace;
		void Replace(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****** IntPatch_WLine::SetArcOnS1 ******/
		/****** md5 signature: 16396892957c40b9d06bd8ad24545a99 ******/
		%feature("compactdefaultargs") SetArcOnS1;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") SetArcOnS1;
		void SetArcOnS1(const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****** IntPatch_WLine::SetArcOnS2 ******/
		/****** md5 signature: c6efc090e240adb6cf7df64d0f88353c ******/
		%feature("compactdefaultargs") SetArcOnS2;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") SetArcOnS2;
		void SetArcOnS2(const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****** IntPatch_WLine::SetCreatingWayInfo ******/
		/****** md5 signature: 9b39821f25ff089342ef26192ee163eb ******/
		%feature("compactdefaultargs") SetCreatingWayInfo;
		%feature("autodoc", "
Parameters
----------
theAlgo: IntPatch_WLType

Return
-------
None

Description
-----------
Sets the info about the way of <*this> creation.
") SetCreatingWayInfo;
		void SetCreatingWayInfo(IntPatch_WLType theAlgo);

		/****** IntPatch_WLine::SetFirstPoint ******/
		/****** md5 signature: 25fa45b5d9bd6687fb9b3e0c731bb2c5 ******/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "
Parameters
----------
IndFirst: int

Return
-------
None

Description
-----------
No available documentation.
") SetFirstPoint;
		void SetFirstPoint(const Standard_Integer IndFirst);

		/****** IntPatch_WLine::SetLastPoint ******/
		/****** md5 signature: e92f18b207577df6b281f4b27f093c31 ******/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "
Parameters
----------
IndLast: int

Return
-------
None

Description
-----------
No available documentation.
") SetLastPoint;
		void SetLastPoint(const Standard_Integer IndLast);

		/****** IntPatch_WLine::SetPeriod ******/
		/****** md5 signature: ea8b3179a3e6fe9ab48197c9976a9f69 ******/
		%feature("compactdefaultargs") SetPeriod;
		%feature("autodoc", "
Parameters
----------
pu1: float
pv1: float
pu2: float
pv2: float

Return
-------
None

Description
-----------
No available documentation.
") SetPeriod;
		void SetPeriod(const Standard_Real pu1, const Standard_Real pv1, const Standard_Real pu2, const Standard_Real pv2);

		/****** IntPatch_WLine::SetPoint ******/
		/****** md5 signature: 67660bb296fa310caa0347f4427366b9 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
Index: int
Pnt: IntPatch_Point

Return
-------
None

Description
-----------
Set the Point of index <Index> in the LineOn2S.
") SetPoint;
		void SetPoint(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****** IntPatch_WLine::U1Period ******/
		/****** md5 signature: 0f11fe35eebd93b966dafbb618e73345 ******/
		%feature("compactdefaultargs") U1Period;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") U1Period;
		Standard_Real U1Period();

		/****** IntPatch_WLine::U2Period ******/
		/****** md5 signature: 2db7353eee7eba45b112cd724e5223b7 ******/
		%feature("compactdefaultargs") U2Period;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") U2Period;
		Standard_Real U2Period();

		/****** IntPatch_WLine::V1Period ******/
		/****** md5 signature: 80acb106984e4803007c2f6bfed3c7c6 ******/
		%feature("compactdefaultargs") V1Period;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") V1Period;
		Standard_Real V1Period();

		/****** IntPatch_WLine::V2Period ******/
		/****** md5 signature: 30686cd4c572466c5637c6cb316b7c8d ******/
		%feature("compactdefaultargs") V2Period;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") V2Period;
		Standard_Real V2Period();

		/****** IntPatch_WLine::Vertex ******/
		/****** md5 signature: b3fd41d3f11681ff4530174231f024bd ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the vertex of range Index on the line.
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
/* class aliases */
%pythoncode {
IntPatch_SearchPnt=OCC.Core.Intf.Intf_InterferencePolygon2d
}
/* deprecated methods */
%pythoncode {
@deprecated
def IntPatch_HCurve2dTool_BSpline(*args):
	return IntPatch_HCurve2dTool.BSpline(*args)

@deprecated
def IntPatch_HCurve2dTool_Bezier(*args):
	return IntPatch_HCurve2dTool.Bezier(*args)

@deprecated
def IntPatch_HCurve2dTool_Circle(*args):
	return IntPatch_HCurve2dTool.Circle(*args)

@deprecated
def IntPatch_HCurve2dTool_Continuity(*args):
	return IntPatch_HCurve2dTool.Continuity(*args)

@deprecated
def IntPatch_HCurve2dTool_D0(*args):
	return IntPatch_HCurve2dTool.D0(*args)

@deprecated
def IntPatch_HCurve2dTool_D1(*args):
	return IntPatch_HCurve2dTool.D1(*args)

@deprecated
def IntPatch_HCurve2dTool_D2(*args):
	return IntPatch_HCurve2dTool.D2(*args)

@deprecated
def IntPatch_HCurve2dTool_D3(*args):
	return IntPatch_HCurve2dTool.D3(*args)

@deprecated
def IntPatch_HCurve2dTool_DN(*args):
	return IntPatch_HCurve2dTool.DN(*args)

@deprecated
def IntPatch_HCurve2dTool_Ellipse(*args):
	return IntPatch_HCurve2dTool.Ellipse(*args)

@deprecated
def IntPatch_HCurve2dTool_FirstParameter(*args):
	return IntPatch_HCurve2dTool.FirstParameter(*args)

@deprecated
def IntPatch_HCurve2dTool_GetType(*args):
	return IntPatch_HCurve2dTool.GetType(*args)

@deprecated
def IntPatch_HCurve2dTool_Hyperbola(*args):
	return IntPatch_HCurve2dTool.Hyperbola(*args)

@deprecated
def IntPatch_HCurve2dTool_Intervals(*args):
	return IntPatch_HCurve2dTool.Intervals(*args)

@deprecated
def IntPatch_HCurve2dTool_IsClosed(*args):
	return IntPatch_HCurve2dTool.IsClosed(*args)

@deprecated
def IntPatch_HCurve2dTool_IsPeriodic(*args):
	return IntPatch_HCurve2dTool.IsPeriodic(*args)

@deprecated
def IntPatch_HCurve2dTool_LastParameter(*args):
	return IntPatch_HCurve2dTool.LastParameter(*args)

@deprecated
def IntPatch_HCurve2dTool_Line(*args):
	return IntPatch_HCurve2dTool.Line(*args)

@deprecated
def IntPatch_HCurve2dTool_NbIntervals(*args):
	return IntPatch_HCurve2dTool.NbIntervals(*args)

@deprecated
def IntPatch_HCurve2dTool_NbSamples(*args):
	return IntPatch_HCurve2dTool.NbSamples(*args)

@deprecated
def IntPatch_HCurve2dTool_Parabola(*args):
	return IntPatch_HCurve2dTool.Parabola(*args)

@deprecated
def IntPatch_HCurve2dTool_Period(*args):
	return IntPatch_HCurve2dTool.Period(*args)

@deprecated
def IntPatch_HCurve2dTool_Resolution(*args):
	return IntPatch_HCurve2dTool.Resolution(*args)

@deprecated
def IntPatch_HCurve2dTool_Value(*args):
	return IntPatch_HCurve2dTool.Value(*args)

@deprecated
def IntPatch_HInterTool_Bounds(*args):
	return IntPatch_HInterTool.Bounds(*args)

@deprecated
def IntPatch_HInterTool_HasBeenSeen(*args):
	return IntPatch_HInterTool.HasBeenSeen(*args)

@deprecated
def IntPatch_HInterTool_HasFirstPoint(*args):
	return IntPatch_HInterTool.HasFirstPoint(*args)

@deprecated
def IntPatch_HInterTool_HasLastPoint(*args):
	return IntPatch_HInterTool.HasLastPoint(*args)

@deprecated
def IntPatch_HInterTool_IsAllSolution(*args):
	return IntPatch_HInterTool.IsAllSolution(*args)

@deprecated
def IntPatch_HInterTool_IsVertex(*args):
	return IntPatch_HInterTool.IsVertex(*args)

@deprecated
def IntPatch_HInterTool_NbPoints(*args):
	return IntPatch_HInterTool.NbPoints(*args)

@deprecated
def IntPatch_HInterTool_NbSamplesOnArc(*args):
	return IntPatch_HInterTool.NbSamplesOnArc(*args)

@deprecated
def IntPatch_HInterTool_NbSamplesU(*args):
	return IntPatch_HInterTool.NbSamplesU(*args)

@deprecated
def IntPatch_HInterTool_NbSamplesV(*args):
	return IntPatch_HInterTool.NbSamplesV(*args)

@deprecated
def IntPatch_HInterTool_NbSegments(*args):
	return IntPatch_HInterTool.NbSegments(*args)

@deprecated
def IntPatch_HInterTool_Parameter(*args):
	return IntPatch_HInterTool.Parameter(*args)

@deprecated
def IntPatch_HInterTool_Project(*args):
	return IntPatch_HInterTool.Project(*args)

@deprecated
def IntPatch_HInterTool_SingularOnUMax(*args):
	return IntPatch_HInterTool.SingularOnUMax(*args)

@deprecated
def IntPatch_HInterTool_SingularOnUMin(*args):
	return IntPatch_HInterTool.SingularOnUMin(*args)

@deprecated
def IntPatch_HInterTool_SingularOnVMax(*args):
	return IntPatch_HInterTool.SingularOnVMax(*args)

@deprecated
def IntPatch_HInterTool_SingularOnVMin(*args):
	return IntPatch_HInterTool.SingularOnVMin(*args)

@deprecated
def IntPatch_HInterTool_Tolerance(*args):
	return IntPatch_HInterTool.Tolerance(*args)

@deprecated
def IntPatch_HInterTool_Value(*args):
	return IntPatch_HInterTool.Value(*args)

@deprecated
def IntPatch_HInterTool_Vertex(*args):
	return IntPatch_HInterTool.Vertex(*args)

@deprecated
def IntPatch_Intersection_CheckSingularPoints(*args):
	return IntPatch_Intersection.CheckSingularPoints(*args)

@deprecated
def IntPatch_Intersection_DefineUVMaxStep(*args):
	return IntPatch_Intersection.DefineUVMaxStep(*args)

@deprecated
def IntPatch_Intersection_PrepareSurfaces(*args):
	return IntPatch_Intersection.PrepareSurfaces(*args)

@deprecated
def IntPatch_PolyhedronTool_Bounding(*args):
	return IntPatch_PolyhedronTool.Bounding(*args)

@deprecated
def IntPatch_PolyhedronTool_ComponentsBounding(*args):
	return IntPatch_PolyhedronTool.ComponentsBounding(*args)

@deprecated
def IntPatch_PolyhedronTool_DeflectionOverEstimation(*args):
	return IntPatch_PolyhedronTool.DeflectionOverEstimation(*args)

@deprecated
def IntPatch_PolyhedronTool_NbTriangles(*args):
	return IntPatch_PolyhedronTool.NbTriangles(*args)

@deprecated
def IntPatch_PolyhedronTool_Point(*args):
	return IntPatch_PolyhedronTool.Point(*args)

@deprecated
def IntPatch_PolyhedronTool_TriConnex(*args):
	return IntPatch_PolyhedronTool.TriConnex(*args)

@deprecated
def IntPatch_PolyhedronTool_Triangle(*args):
	return IntPatch_PolyhedronTool.Triangle(*args)

@deprecated
def IntPatch_RstInt_PutVertexOnLine(*args):
	return IntPatch_RstInt.PutVertexOnLine(*args)

@deprecated
def IntPatch_SpecialPoints_AddCrossUVIsoPoint(*args):
	return IntPatch_SpecialPoints.AddCrossUVIsoPoint(*args)

@deprecated
def IntPatch_SpecialPoints_AddPointOnUorVIso(*args):
	return IntPatch_SpecialPoints.AddPointOnUorVIso(*args)

@deprecated
def IntPatch_SpecialPoints_AddSingularPole(*args):
	return IntPatch_SpecialPoints.AddSingularPole(*args)

@deprecated
def IntPatch_SpecialPoints_AdjustPointAndVertex(*args):
	return IntPatch_SpecialPoints.AdjustPointAndVertex(*args)

@deprecated
def IntPatch_SpecialPoints_ContinueAfterSpecialPoint(*args):
	return IntPatch_SpecialPoints.ContinueAfterSpecialPoint(*args)

@deprecated
def IntPatch_WLineTool_ComputePurgedWLine(*args):
	return IntPatch_WLineTool.ComputePurgedWLine(*args)

@deprecated
def IntPatch_WLineTool_ExtendTwoWLines(*args):
	return IntPatch_WLineTool.ExtendTwoWLines(*args)

@deprecated
def IntPatch_WLineTool_JoinWLines(*args):
	return IntPatch_WLineTool.JoinWLines(*args)

@deprecated
def IntPatch_PointLine_CurvatureRadiusOfIntersLine(*args):
	return IntPatch_PointLine.CurvatureRadiusOfIntersLine(*args)

}
