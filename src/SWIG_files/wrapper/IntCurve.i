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
%define INTCURVEDOCSTRING
"IntCurve module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_intcurve.html"
%enddef
%module (package="OCC.Core", docstring=INTCURVEDOCSTRING) IntCurve


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
#include<IntCurve_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<IntRes2d_module.hxx>
#include<TColStd_module.hxx>
#include<math_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import IntRes2d.i
%import TColStd.i
%import math.i
%import GeomAbs.i

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
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************************
* class IntCurve_IConicTool *
****************************/
class IntCurve_IConicTool {
	public:
		/****** IntCurve_IConicTool::IntCurve_IConicTool ******/
		/****** md5 signature: 2af2a96e4f36037108c7a715a6a910a6 ******/
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntCurve_IConicTool;
		 IntCurve_IConicTool();

		/****** IntCurve_IConicTool::IntCurve_IConicTool ******/
		/****** md5 signature: 0ffb645c5a536dfdf34a7231eb4c4401 ******/
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "
Parameters
----------
IT: IntCurve_IConicTool

Return
-------
None

Description
-----------
No available documentation.
") IntCurve_IConicTool;
		 IntCurve_IConicTool(const IntCurve_IConicTool & IT);

		/****** IntCurve_IConicTool::IntCurve_IConicTool ******/
		/****** md5 signature: cf0b9f06360ba43725e959e5438ccee1 ******/
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d

Return
-------
None

Description
-----------
No available documentation.
") IntCurve_IConicTool;
		 IntCurve_IConicTool(const gp_Elips2d & E);

		/****** IntCurve_IConicTool::IntCurve_IConicTool ******/
		/****** md5 signature: 5033f84f85ab623824628b5944ad71d6 ******/
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d

Return
-------
None

Description
-----------
No available documentation.
") IntCurve_IConicTool;
		 IntCurve_IConicTool(const gp_Lin2d & L);

		/****** IntCurve_IConicTool::IntCurve_IConicTool ******/
		/****** md5 signature: b4c8ae55350ac9ed279c3f1549a8e5d4 ******/
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d

Return
-------
None

Description
-----------
No available documentation.
") IntCurve_IConicTool;
		 IntCurve_IConicTool(const gp_Circ2d & C);

		/****** IntCurve_IConicTool::IntCurve_IConicTool ******/
		/****** md5 signature: 5e3401a480facafdb510791c9bf54b76 ******/
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab2d

Return
-------
None

Description
-----------
No available documentation.
") IntCurve_IConicTool;
		 IntCurve_IConicTool(const gp_Parab2d & P);

		/****** IntCurve_IConicTool::IntCurve_IConicTool ******/
		/****** md5 signature: d31a9f2e3755842ee99ff69ef63e33d7 ******/
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d

Return
-------
None

Description
-----------
No available documentation.
") IntCurve_IConicTool;
		 IntCurve_IConicTool(const gp_Hypr2d & H);

		/****** IntCurve_IConicTool::D1 ******/
		/****** md5 signature: d806c4fc8a6721f7cb9a0a32b479df5c ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d
T: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const double U, gp_Pnt2d & P, gp_Vec2d & T);

		/****** IntCurve_IConicTool::D2 ******/
		/****** md5 signature: 3e051808c5e2d8267ec2e988a0ca6b56 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d
T: gp_Vec2d
N: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D2;
		void D2(const double U, gp_Pnt2d & P, gp_Vec2d & T, gp_Vec2d & N);

		/****** IntCurve_IConicTool::Distance ******/
		/****** md5 signature: f54a4432a8cfc2ca33c2afb3297c5457 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
double

Description
-----------
Computes the value of the signed distance between the point P and the implicit curve.
") Distance;
		double Distance(const gp_Pnt2d & P);

		/****** IntCurve_IConicTool::FindParameter ******/
		/****** md5 signature: aef71464fc996f50b9152853f5da8b6a ******/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
double

Description
-----------
Returns the parameter U of the point on the implicit curve corresponding to the point P. The correspondence between P and the point P(U) on the implicit curve must be coherent with the way of determination of the signed distance.
") FindParameter;
		double FindParameter(const gp_Pnt2d & P);

		/****** IntCurve_IConicTool::GradDistance ******/
		/****** md5 signature: 15b8e50fef88e1b1b6566cb5b0954bf6 ******/
		%feature("compactdefaultargs") GradDistance;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
gp_Vec2d

Description
-----------
Computes the Gradient of the Signed Distance between a point and the implicit curve, at the point P.
") GradDistance;
		gp_Vec2d GradDistance(const gp_Pnt2d & P);

		/****** IntCurve_IConicTool::Value ******/
		/****** md5 signature: 7dc578b751324735984e5d3c17c576e4 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		gp_Pnt2d Value(const double X);

};


%extend IntCurve_IConicTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IntCurve_IntConicConic *
*******************************/
class IntCurve_IntConicConic : public IntRes2d_Intersection {
	public:
		/****** IntCurve_IntConicConic::IntCurve_IntConicConic ******/
		/****** md5 signature: 3e05c245cd3d446017ed5bbdf6bed00b ******/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty Constructor.
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic();

		/****** IntCurve_IntConicConic::IntCurve_IntConicConic ******/
		/****** md5 signature: 890567fd2a9ab4bb2d96779e1eb74da9 ******/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "
Parameters
----------
L1: gp_Lin2d
D1: IntRes2d_Domain
L2: gp_Lin2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 lines from gp.
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Lin2d & L1, const IntRes2d_Domain & D1, const gp_Lin2d & L2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::IntCurve_IntConicConic ******/
		/****** md5 signature: 6e248d0772b1312974e6ae1e68e889ce ******/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
DL: IntRes2d_Domain
C: gp_Circ2d
DC: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a circle. The exception ConstructionError is raised if the method IsClosed of the domain of the circle returns False.
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Lin2d & L, const IntRes2d_Domain & DL, const gp_Circ2d & C, const IntRes2d_Domain & DC, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::IntCurve_IntConicConic ******/
		/****** md5 signature: 472aee11bf5acd5fd8c1f63c92c7d417 ******/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
DL: IntRes2d_Domain
E: gp_Elips2d
DE: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and an ellipse. The exception ConstructionError is raised if the method IsClosed of the domain of the ellipse returns False.
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Lin2d & L, const IntRes2d_Domain & DL, const gp_Elips2d & E, const IntRes2d_Domain & DE, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::IntCurve_IntConicConic ******/
		/****** md5 signature: 53871e9a18df9217c63295650c7b2bef ******/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
DL: IntRes2d_Domain
P: gp_Parab2d
DP: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parabola from gp.
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Lin2d & L, const IntRes2d_Domain & DL, const gp_Parab2d & P, const IntRes2d_Domain & DP, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::IntCurve_IntConicConic ******/
		/****** md5 signature: b90ede29e747583af241f1adefd43909 ******/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
DL: IntRes2d_Domain
H: gp_Hypr2d
DH: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and an hyperbola.
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Lin2d & L, const IntRes2d_Domain & DL, const gp_Hypr2d & H, const IntRes2d_Domain & DH, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::IntCurve_IntConicConic ******/
		/****** md5 signature: 3dfad8b9ab77d8563996d8bea83e15a0 ******/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ2d
D1: IntRes2d_Domain
C2: gp_Circ2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 circles from gp. The exception ConstructionError is raised if the method IsClosed of one of the domain returns False.
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Circ2d & C1, const IntRes2d_Domain & D1, const gp_Circ2d & C2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::IntCurve_IntConicConic ******/
		/****** md5 signature: 41317627fb09429f991551486a15dc10 ******/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
DC: IntRes2d_Domain
E: gp_Elips2d
DE: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a circle and an ellipse. The exception ConstructionError is raised if the method IsClosed of one the domain returns False.
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Circ2d & C, const IntRes2d_Domain & DC, const gp_Elips2d & E, const IntRes2d_Domain & DE, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::IntCurve_IntConicConic ******/
		/****** md5 signature: c9baef3f262d5cdf5b830efdf8f183aa ******/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
DC: IntRes2d_Domain
P: gp_Parab2d
DP: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a circle and a parabola. The exception ConstructionError is raised if the method IsClosed of the domain of the circle returns False.
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Circ2d & C, const IntRes2d_Domain & DC, const gp_Parab2d & P, const IntRes2d_Domain & DP, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::IntCurve_IntConicConic ******/
		/****** md5 signature: 220745d60ec8b94f04bf2f8cd3b16c12 ******/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
DC: IntRes2d_Domain
H: gp_Hypr2d
DH: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a circle and an hyperbola. The exception ConstructionError is raised if the method IsClosed of the domain of the circle returns False.
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Circ2d & C, const IntRes2d_Domain & DC, const gp_Hypr2d & H, const IntRes2d_Domain & DH, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::IntCurve_IntConicConic ******/
		/****** md5 signature: c58443e74e39b7c2ddeda866142606ba ******/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "
Parameters
----------
E1: gp_Elips2d
D1: IntRes2d_Domain
E2: gp_Elips2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 ellipses. The exception ConstructionError is raised if the method IsClosed of one of the domain returns False.
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Elips2d & E1, const IntRes2d_Domain & D1, const gp_Elips2d & E2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::IntCurve_IntConicConic ******/
		/****** md5 signature: f915f5c2a7ce6f4a803ee30edf054868 ******/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
DE: IntRes2d_Domain
P: gp_Parab2d
DP: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an ellipse and a parabola. The exception ConstructionError is raised if the method IsClosed of the domain of the ellipse returns False.
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Elips2d & E, const IntRes2d_Domain & DE, const gp_Parab2d & P, const IntRes2d_Domain & DP, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::IntCurve_IntConicConic ******/
		/****** md5 signature: 8de91fe126b934642cd499d71c57194f ******/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
DE: IntRes2d_Domain
H: gp_Hypr2d
DH: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an ellipse and an hyperbola. The exception ConstructionError is raised if the method IsClosed of the domain of the ellipse returns False.
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Elips2d & E, const IntRes2d_Domain & DE, const gp_Hypr2d & H, const IntRes2d_Domain & DH, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::IntCurve_IntConicConic ******/
		/****** md5 signature: 675c62ae2d4853b92c6ceffcf31f7c2b ******/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "
Parameters
----------
P1: gp_Parab2d
D1: IntRes2d_Domain
P2: gp_Parab2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 parabolas.
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Parab2d & P1, const IntRes2d_Domain & D1, const gp_Parab2d & P2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::IntCurve_IntConicConic ******/
		/****** md5 signature: c6c4bc046448d6dd036daffd31b1e0f1 ******/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab2d
DP: IntRes2d_Domain
H: gp_Hypr2d
DH: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a parabola and an hyperbola.
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Parab2d & P, const IntRes2d_Domain & DP, const gp_Hypr2d & H, const IntRes2d_Domain & DH, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::IntCurve_IntConicConic ******/
		/****** md5 signature: 70e3cb61743b2a57908c5f69e6e5ba9c ******/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "
Parameters
----------
H1: gp_Hypr2d
D1: IntRes2d_Domain
H2: gp_Hypr2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 hyperbolas.
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Hypr2d & H1, const IntRes2d_Domain & D1, const gp_Hypr2d & H2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::Perform ******/
		/****** md5 signature: 02e149ef7945ff30a9b07863d2037771 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L1: gp_Lin2d
D1: IntRes2d_Domain
L2: gp_Lin2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 lines from gp.
") Perform;
		void Perform(const gp_Lin2d & L1, const IntRes2d_Domain & D1, const gp_Lin2d & L2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::Perform ******/
		/****** md5 signature: 1b2209a55a961b4cecd178353475276e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
DL: IntRes2d_Domain
C: gp_Circ2d
DC: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a circle. The exception ConstructionError is raised if the method IsClosed of the domain of the circle returns False.
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & DL, const gp_Circ2d & C, const IntRes2d_Domain & DC, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::Perform ******/
		/****** md5 signature: 2180849c47e4efed4a88860005363d7a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
DL: IntRes2d_Domain
E: gp_Elips2d
DE: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and an ellipse. The exception ConstructionError is raised if the method IsClosed of the domain of the ellipse returns False.
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & DL, const gp_Elips2d & E, const IntRes2d_Domain & DE, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::Perform ******/
		/****** md5 signature: 921a0c31f45a01c86f5cd48e8a7b45a2 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
DL: IntRes2d_Domain
P: gp_Parab2d
DP: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parabola from gp.
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & DL, const gp_Parab2d & P, const IntRes2d_Domain & DP, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::Perform ******/
		/****** md5 signature: 01779216fe4f5a845ec031d78eaf656f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
DL: IntRes2d_Domain
H: gp_Hypr2d
DH: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and an hyperbola.
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & DL, const gp_Hypr2d & H, const IntRes2d_Domain & DH, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::Perform ******/
		/****** md5 signature: 417a20d7ff33d029aa3c95800566f4d0 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ2d
D1: IntRes2d_Domain
C2: gp_Circ2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 circles from gp. The exception ConstructionError is raised if the method IsClosed of the domain of one of the circle returns False.
") Perform;
		void Perform(const gp_Circ2d & C1, const IntRes2d_Domain & D1, const gp_Circ2d & C2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::Perform ******/
		/****** md5 signature: 1d68a95dcfdf084a3e3f3793de5afd4c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
DC: IntRes2d_Domain
E: gp_Elips2d
DE: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a circle and an ellipse. The exception ConstructionError is raised if the method IsClosed of one the domain returns False.
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & DC, const gp_Elips2d & E, const IntRes2d_Domain & DE, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::Perform ******/
		/****** md5 signature: 30f5c12211803aff29e1c502262a53c8 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
DC: IntRes2d_Domain
P: gp_Parab2d
DP: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a circle and a parabola. The exception ConstructionError is raised if the method IsClosed of the domain of the circle returns False.
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & DC, const gp_Parab2d & P, const IntRes2d_Domain & DP, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::Perform ******/
		/****** md5 signature: bee450ff7766e8f36cf1bfa94a224225 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
DC: IntRes2d_Domain
H: gp_Hypr2d
DH: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a circle and an hyperbola. The exception ConstructionError is raised if the method IsClosed of the domain of the circle returns False.
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & DC, const gp_Hypr2d & H, const IntRes2d_Domain & DH, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::Perform ******/
		/****** md5 signature: 90324d53adf0c0d2085297e80491b7f5 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E1: gp_Elips2d
D1: IntRes2d_Domain
E2: gp_Elips2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 ellipses. The exception ConstructionError is raised if the method IsClosed of one of the domain returns False.
") Perform;
		void Perform(const gp_Elips2d & E1, const IntRes2d_Domain & D1, const gp_Elips2d & E2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::Perform ******/
		/****** md5 signature: ac16001c1aeda43af9fba4f8c65240fc ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
DE: IntRes2d_Domain
P: gp_Parab2d
DP: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an ellipse and a parabola. The exception ConstructionError is raised if the method IsClosed of the domain of the ellipse returns False.
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & DE, const gp_Parab2d & P, const IntRes2d_Domain & DP, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::Perform ******/
		/****** md5 signature: ad003a7d2370f76e8ee287868aff2d94 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
DE: IntRes2d_Domain
H: gp_Hypr2d
DH: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an ellipse and an hyperbola. The exception ConstructionError is raised if the method IsClosed of the domain of the ellipse returns False.
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & DE, const gp_Hypr2d & H, const IntRes2d_Domain & DH, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::Perform ******/
		/****** md5 signature: 0a2d43d9d085dd5fd40f0ae981a889a0 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P1: gp_Parab2d
D1: IntRes2d_Domain
P2: gp_Parab2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 parabolas.
") Perform;
		void Perform(const gp_Parab2d & P1, const IntRes2d_Domain & D1, const gp_Parab2d & P2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::Perform ******/
		/****** md5 signature: 0dc2cb0c7bd9f6e27ce4a86d33be68d1 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab2d
DP: IntRes2d_Domain
H: gp_Hypr2d
DH: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a parabola and an hyperbola.
") Perform;
		void Perform(const gp_Parab2d & P, const IntRes2d_Domain & DP, const gp_Hypr2d & H, const IntRes2d_Domain & DH, const double TolConf, const double Tol);

		/****** IntCurve_IntConicConic::Perform ******/
		/****** md5 signature: 995dcd5f5f55fb953a8b6110a9d30b42 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
H1: gp_Hypr2d
D1: IntRes2d_Domain
H2: gp_Hypr2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 hyperbolas.
") Perform;
		void Perform(const gp_Hypr2d & H1, const IntRes2d_Domain & D1, const gp_Hypr2d & H2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

};


%extend IntCurve_IntConicConic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IntCurve_IntImpConicParConic *
*************************************/
class IntCurve_IntImpConicParConic : public IntRes2d_Intersection {
	public:
		/****** IntCurve_IntImpConicParConic::IntCurve_IntImpConicParConic ******/
		/****** md5 signature: 9860523eef48fd38db7a184ac6bd9ec3 ******/
		%feature("compactdefaultargs") IntCurve_IntImpConicParConic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntCurve_IntImpConicParConic;
		 IntCurve_IntImpConicParConic();

		/****** IntCurve_IntImpConicParConic::IntCurve_IntImpConicParConic ******/
		/****** md5 signature: 1ebc0921c9dfed621eab3ea6b08b38f6 ******/
		%feature("compactdefaultargs") IntCurve_IntImpConicParConic;
		%feature("autodoc", "
Parameters
----------
ITool: IntCurve_IConicTool
Dom1: IntRes2d_Domain
PCurve: IntCurve_PConic
Dom2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an implicit curve and a parametrised curve. The exception ConstructionError is raised if the domain of the parametrised curve does not verify HasFirstPoint and HasLastPoint return True.
") IntCurve_IntImpConicParConic;
		 IntCurve_IntImpConicParConic(const IntCurve_IConicTool & ITool, const IntRes2d_Domain & Dom1, const IntCurve_PConic & PCurve, const IntRes2d_Domain & Dom2, const double TolConf, const double Tol);

		/****** IntCurve_IntImpConicParConic::And_Domaine_Objet1_Intersections ******/
		/****** md5 signature: 5cd2f15deb4b1236d7eba61b1ad1cc7a ******/
		%feature("compactdefaultargs") And_Domaine_Objet1_Intersections;
		%feature("autodoc", "
Parameters
----------
TheImpTool: IntCurve_IConicTool
TheParCurve: IntCurve_PConic
TheImpCurveDomain: IntRes2d_Domain
TheParCurveDomain: IntRes2d_Domain
Inter2_And_Domain2: TColStd_Array1OfReal
Inter1: TColStd_Array1OfReal
Resultat1: TColStd_Array1OfReal
Resultat2: TColStd_Array1OfReal
EpsNul: double

Return
-------
NbResultats: int

Description
-----------
No available documentation.
") And_Domaine_Objet1_Intersections;
		void And_Domaine_Objet1_Intersections(const IntCurve_IConicTool & TheImpTool, const IntCurve_PConic & TheParCurve, const IntRes2d_Domain & TheImpCurveDomain, const IntRes2d_Domain & TheParCurveDomain, Standard_Integer &OutValue, TColStd_Array1OfReal & Inter2_And_Domain2, TColStd_Array1OfReal & Inter1, TColStd_Array1OfReal & Resultat1, TColStd_Array1OfReal & Resultat2, const double EpsNul);

		/****** IntCurve_IntImpConicParConic::FindU ******/
		/****** md5 signature: 8cd30139bfd736d6ce37e175ef38ede4 ******/
		%feature("compactdefaultargs") FindU;
		%feature("autodoc", "
Parameters
----------
parameter: double
point: gp_Pnt2d
TheParCurev: IntCurve_PConic
TheImpTool: IntCurve_IConicTool

Return
-------
double

Description
-----------
No available documentation.
") FindU;
		double FindU(const double parameter, gp_Pnt2d & point, const IntCurve_PConic & TheParCurev, const IntCurve_IConicTool & TheImpTool);

		/****** IntCurve_IntImpConicParConic::FindV ******/
		/****** md5 signature: eddac0584d725adcd5b74f74fbf04018 ******/
		%feature("compactdefaultargs") FindV;
		%feature("autodoc", "
Parameters
----------
parameter: double
point: gp_Pnt2d
TheImpTool: IntCurve_IConicTool
ParCurve: IntCurve_PConic
TheParCurveDomain: IntRes2d_Domain
V0: double
V1: double
Tolerance: double

Return
-------
double

Description
-----------
No available documentation.
") FindV;
		double FindV(const double parameter, gp_Pnt2d & point, const IntCurve_IConicTool & TheImpTool, const IntCurve_PConic & ParCurve, const IntRes2d_Domain & TheParCurveDomain, const double V0, const double V1, const double Tolerance);

		/****** IntCurve_IntImpConicParConic::Perform ******/
		/****** md5 signature: fe95a46dfa866149522c90c08cfa2045 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
ITool: IntCurve_IConicTool
Dom1: IntRes2d_Domain
PCurve: IntCurve_PConic
Dom2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an implicit curve and a parametrised curve. The exception ConstructionError is raised if the domain of the parametrised curve does not verify HasFirstPoint and HasLastPoint return True.
") Perform;
		void Perform(const IntCurve_IConicTool & ITool, const IntRes2d_Domain & Dom1, const IntCurve_PConic & PCurve, const IntRes2d_Domain & Dom2, const double TolConf, const double Tol);

};


%extend IntCurve_IntImpConicParConic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class IntCurve_MyImpParToolOfIntImpConicParConic *
***************************************************/
class IntCurve_MyImpParToolOfIntImpConicParConic : public math_FunctionWithDerivative {
	public:
		/****** IntCurve_MyImpParToolOfIntImpConicParConic::IntCurve_MyImpParToolOfIntImpConicParConic ******/
		/****** md5 signature: 4433df7bba31dec8a454031a0d2609dc ******/
		%feature("compactdefaultargs") IntCurve_MyImpParToolOfIntImpConicParConic;
		%feature("autodoc", "
Parameters
----------
IT: IntCurve_IConicTool
PC: IntCurve_PConic

Return
-------
None

Description
-----------
Constructor of the class.
") IntCurve_MyImpParToolOfIntImpConicParConic;
		 IntCurve_MyImpParToolOfIntImpConicParConic(const IntCurve_IConicTool & IT, const IntCurve_PConic & PC);

		/****** IntCurve_MyImpParToolOfIntImpConicParConic::Derivative ******/
		/****** md5 signature: 9056fc5f695c62612651effc85cb18ad ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
D: double

Description
-----------
Computes the derivative of the previous function at parameter Param.
") Derivative;
		bool Derivative(const double Param, Standard_Real &OutValue);

		/****** IntCurve_MyImpParToolOfIntImpConicParConic::Value ******/
		/****** md5 signature: 92dd35931de1aecdc8277d063de13ec7 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
F: double

Description
-----------
Computes the value of the signed distance between the implicit curve and the point at parameter Param on the parametrised curve.
") Value;
		bool Value(const double Param, Standard_Real &OutValue);

		/****** IntCurve_MyImpParToolOfIntImpConicParConic::Values ******/
		/****** md5 signature: 03dca4b59c48db2ee672dd2d7904db60 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
F: double
D: double

Description
-----------
Computes the value and the derivative of the function.
") Values;
		bool Values(const double Param, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend IntCurve_MyImpParToolOfIntImpConicParConic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IntCurve_PConic *
************************/
class IntCurve_PConic {
	public:
		/****** IntCurve_PConic::IntCurve_PConic ******/
		/****** md5 signature: 5dab6cab4d7e7a7fe633a02033b6aad8 ******/
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "
Parameters
----------
PC: IntCurve_PConic

Return
-------
None

Description
-----------
No available documentation.
") IntCurve_PConic;
		 IntCurve_PConic(const IntCurve_PConic & PC);

		/****** IntCurve_PConic::IntCurve_PConic ******/
		/****** md5 signature: 8fe4f819897a9e0c3cf2afbc11d1b81b ******/
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d

Return
-------
None

Description
-----------
No available documentation.
") IntCurve_PConic;
		 IntCurve_PConic(const gp_Elips2d & E);

		/****** IntCurve_PConic::IntCurve_PConic ******/
		/****** md5 signature: 54508df0aaa3603bc250b365d80b3013 ******/
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d

Return
-------
None

Description
-----------
No available documentation.
") IntCurve_PConic;
		 IntCurve_PConic(const gp_Circ2d & C);

		/****** IntCurve_PConic::IntCurve_PConic ******/
		/****** md5 signature: a86e4bd14de6e5019e14ff2662d016e3 ******/
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab2d

Return
-------
None

Description
-----------
No available documentation.
") IntCurve_PConic;
		 IntCurve_PConic(const gp_Parab2d & P);

		/****** IntCurve_PConic::IntCurve_PConic ******/
		/****** md5 signature: 8717ac575dc4f230eb6eee25db4395d2 ******/
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d

Return
-------
None

Description
-----------
No available documentation.
") IntCurve_PConic;
		 IntCurve_PConic(const gp_Hypr2d & H);

		/****** IntCurve_PConic::IntCurve_PConic ******/
		/****** md5 signature: 6bdfda89953e08e5960a15c26392e5c6 ******/
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d

Return
-------
None

Description
-----------
No available documentation.
") IntCurve_PConic;
		 IntCurve_PConic(const gp_Lin2d & L);

		/****** IntCurve_PConic::Accuracy ******/
		/****** md5 signature: 2d097fa64d719821aa0d1298449749a2 ******/
		%feature("compactdefaultargs") Accuracy;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Accuracy;
		int Accuracy();

		/****** IntCurve_PConic::Axis2 ******/
		/****** md5 signature: eb95ccdfec5da4dc648b684ba2a0e1e1 ******/
		%feature("compactdefaultargs") Axis2;
		%feature("autodoc", "Return
-------
gp_Ax22d

Description
-----------
No available documentation.
") Axis2;
		const gp_Ax22d Axis2();

		/****** IntCurve_PConic::EpsX ******/
		/****** md5 signature: 87646de807acd1e4c5f5313522872472 ******/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") EpsX;
		double EpsX();

		/****** IntCurve_PConic::Param1 ******/
		/****** md5 signature: f65d4f825a89b33971c8c667ed1225a4 ******/
		%feature("compactdefaultargs") Param1;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Param1;
		double Param1();

		/****** IntCurve_PConic::Param2 ******/
		/****** md5 signature: dcdcce076330fe9e592f25d42805cec6 ******/
		%feature("compactdefaultargs") Param2;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Param2;
		double Param2();

		/****** IntCurve_PConic::SetAccuracy ******/
		/****** md5 signature: 5a0b9ce17c4ca8f75545fbafa6bfe70d ******/
		%feature("compactdefaultargs") SetAccuracy;
		%feature("autodoc", "
Parameters
----------
Nb: int

Return
-------
None

Description
-----------
Accuracy is the number of samples used to approximate the parametric curve on its domain.
") SetAccuracy;
		void SetAccuracy(const int Nb);

		/****** IntCurve_PConic::SetEpsX ******/
		/****** md5 signature: 2c45b4bd99743259dbe705b468016699 ******/
		%feature("compactdefaultargs") SetEpsX;
		%feature("autodoc", "
Parameters
----------
EpsDist: double

Return
-------
None

Description
-----------
EpsX is a internal tolerance used in math algorithms, usually about 1e-10 (See FunctionAllRoots for more details).
") SetEpsX;
		void SetEpsX(const double EpsDist);

		/****** IntCurve_PConic::TypeCurve ******/
		/****** md5 signature: f067825570356c7fc20577704769d60d ******/
		%feature("compactdefaultargs") TypeCurve;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
The Conics are manipulated as objects which only depend on three parameters: Axis and two Real from Standards. Type Curve is used to select the correct Conic.
") TypeCurve;
		GeomAbs_CurveType TypeCurve();

};


%extend IntCurve_PConic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IntCurve_PConicTool *
****************************/
class IntCurve_PConicTool {
	public:
		/****** IntCurve_PConicTool::D1 ******/
		/****** md5 signature: 22f5ef4061eae5412e01e3e678b15527 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: IntCurve_PConic
U: double
P: gp_Pnt2d
T: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const IntCurve_PConic & C, const double U, gp_Pnt2d & P, gp_Vec2d & T);

		/****** IntCurve_PConicTool::D2 ******/
		/****** md5 signature: 62745e095467e1be2835cf73e0439b9b ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: IntCurve_PConic
U: double
P: gp_Pnt2d
T: gp_Vec2d
N: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const IntCurve_PConic & C, const double U, gp_Pnt2d & P, gp_Vec2d & T, gp_Vec2d & N);

		/****** IntCurve_PConicTool::EpsX ******/
		/****** md5 signature: b67251850cbe79a86e5a643c93e289d5 ******/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "
Parameters
----------
C: IntCurve_PConic

Return
-------
double

Description
-----------
No available documentation.
") EpsX;
		static double EpsX(const IntCurve_PConic & C);

		/****** IntCurve_PConicTool::NbSamples ******/
		/****** md5 signature: f4d7083c831908d372f4270f653aa57d ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: IntCurve_PConic

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static int NbSamples(const IntCurve_PConic & C);

		/****** IntCurve_PConicTool::NbSamples ******/
		/****** md5 signature: eaf0368df0b4af1677715a283af4e5de ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: IntCurve_PConic
U0: double
U1: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static int NbSamples(const IntCurve_PConic & C, const double U0, const double U1);

		/****** IntCurve_PConicTool::Value ******/
		/****** md5 signature: a22944cdd1d83c829db6f3abca6f266c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: IntCurve_PConic
X: double

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		static gp_Pnt2d Value(const IntCurve_PConic & C, const double X);

};


%extend IntCurve_PConicTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IntCurve_ProjectOnPConicTool *
*************************************/
class IntCurve_ProjectOnPConicTool {
	public:
		/****** IntCurve_ProjectOnPConicTool::FindParameter ******/
		/****** md5 signature: 086db884d4f70ee9d1564f10beab56fd ******/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "
Parameters
----------
C: IntCurve_PConic
Pnt: gp_Pnt2d
Tol: double

Return
-------
double

Description
-----------
Returns the parameter V of the point on the parametric curve corresponding to the Point Pnt. The Correspondence between Pnt and the point P(V) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. Tol is the tolerance on the distance between a point and the parametrised curve. In that case, no bounds are given. The research of the right parameter has to be made on the natural parametric domain of the curve.
") FindParameter;
		static double FindParameter(const IntCurve_PConic & C, const gp_Pnt2d & Pnt, const double Tol);

		/****** IntCurve_ProjectOnPConicTool::FindParameter ******/
		/****** md5 signature: 866360ee95c4887b4a3ae544d9ee2b6d ******/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "
Parameters
----------
C: IntCurve_PConic
Pnt: gp_Pnt2d
LowParameter: double
HighParameter: double
Tol: double

Return
-------
double

Description
-----------
Returns the parameter V of the point on the parametric curve corresponding to the Point Pnt. The Correspondence between Pnt and the point P(V) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. Tol is the tolerance on the distance between a point and the parametrised curve. LowParameter and HighParameter give the boundaries of the interval in which the parameter certainly lies. These parameters are given to implement a more efficient algorithm. So, it is not necessary to check that the returned value verifies LowParameter <= Value <= HighParameter.
") FindParameter;
		static double FindParameter(const IntCurve_PConic & C, const gp_Pnt2d & Pnt, const double LowParameter, const double HighParameter, const double Tol);

};


%extend IntCurve_ProjectOnPConicTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class Interval *
*****************/
/*************************
* class PeriodicInterval *
*************************/
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def IntCurve_PConicTool_D1(*args):
	return IntCurve_PConicTool.D1(*args)

@deprecated
def IntCurve_PConicTool_D2(*args):
	return IntCurve_PConicTool.D2(*args)

@deprecated
def IntCurve_PConicTool_EpsX(*args):
	return IntCurve_PConicTool.EpsX(*args)

@deprecated
def IntCurve_PConicTool_NbSamples(*args):
	return IntCurve_PConicTool.NbSamples(*args)

@deprecated
def IntCurve_PConicTool_NbSamples(*args):
	return IntCurve_PConicTool.NbSamples(*args)

@deprecated
def IntCurve_PConicTool_Value(*args):
	return IntCurve_PConicTool.Value(*args)

@deprecated
def IntCurve_ProjectOnPConicTool_FindParameter(*args):
	return IntCurve_ProjectOnPConicTool.FindParameter(*args)

@deprecated
def IntCurve_ProjectOnPConicTool_FindParameter(*args):
	return IntCurve_ProjectOnPConicTool.FindParameter(*args)

}
