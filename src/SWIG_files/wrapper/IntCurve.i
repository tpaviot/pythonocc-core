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
%define INTCURVEDOCSTRING
"IntCurve module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_intcurve.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** IntCurve_IConicTool ******************/
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntCurve_IConicTool;
		 IntCurve_IConicTool();

		/****************** IntCurve_IConicTool ******************/
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
IT: IntCurve_IConicTool

Returns
-------
None
") IntCurve_IConicTool;
		 IntCurve_IConicTool(const IntCurve_IConicTool & IT);

		/****************** IntCurve_IConicTool ******************/
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: gp_Elips2d

Returns
-------
None
") IntCurve_IConicTool;
		 IntCurve_IConicTool(const gp_Elips2d & E);

		/****************** IntCurve_IConicTool ******************/
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin2d

Returns
-------
None
") IntCurve_IConicTool;
		 IntCurve_IConicTool(const gp_Lin2d & L);

		/****************** IntCurve_IConicTool ******************/
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ2d

Returns
-------
None
") IntCurve_IConicTool;
		 IntCurve_IConicTool(const gp_Circ2d & C);

		/****************** IntCurve_IConicTool ******************/
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Parab2d

Returns
-------
None
") IntCurve_IConicTool;
		 IntCurve_IConicTool(const gp_Parab2d & P);

		/****************** IntCurve_IConicTool ******************/
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
H: gp_Hypr2d

Returns
-------
None
") IntCurve_IConicTool;
		 IntCurve_IConicTool(const gp_Hypr2d & H);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
T: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & T);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
T: gp_Vec2d
N: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & T, gp_Vec2d & N);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the value of the signed distance between the point p and the implicit curve.

Parameters
----------
P: gp_Pnt2d

Returns
-------
float
") Distance;
		Standard_Real Distance(const gp_Pnt2d & P);

		/****************** FindParameter ******************/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "Returns the parameter u of the point on the implicit curve corresponding to the point p. the correspondance between p and the point p(u) on the implicit curve must be coherent with the way of determination of the signed distance.

Parameters
----------
P: gp_Pnt2d

Returns
-------
float
") FindParameter;
		Standard_Real FindParameter(const gp_Pnt2d & P);

		/****************** GradDistance ******************/
		%feature("compactdefaultargs") GradDistance;
		%feature("autodoc", "Computes the gradient of the signed distance between a point and the implicit curve, at the point p.

Parameters
----------
P: gp_Pnt2d

Returns
-------
gp_Vec2d
") GradDistance;
		gp_Vec2d GradDistance(const gp_Pnt2d & P);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
gp_Pnt2d
") Value;
		gp_Pnt2d Value(const Standard_Real X);

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
		/****************** IntCurve_IntConicConic ******************/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic();

		/****************** IntCurve_IntConicConic ******************/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Intersection between 2 lines from gp.

Parameters
----------
L1: gp_Lin2d
D1: IntRes2d_Domain
L2: gp_Lin2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Lin2d & L1, const IntRes2d_Domain & D1, const gp_Lin2d & L2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** IntCurve_IntConicConic ******************/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Intersection between a line and a circle. the exception constructionerror is raised if the method isclosed of the domain of the circle returns false.

Parameters
----------
L: gp_Lin2d
DL: IntRes2d_Domain
C: gp_Circ2d
DC: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Lin2d & L, const IntRes2d_Domain & DL, const gp_Circ2d & C, const IntRes2d_Domain & DC, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** IntCurve_IntConicConic ******************/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Intersection between a line and an ellipse. the exception constructionerror is raised if the method isclosed of the domain of the ellipse returns false.

Parameters
----------
L: gp_Lin2d
DL: IntRes2d_Domain
E: gp_Elips2d
DE: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Lin2d & L, const IntRes2d_Domain & DL, const gp_Elips2d & E, const IntRes2d_Domain & DE, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** IntCurve_IntConicConic ******************/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Intersection between a line and a parabola from gp.

Parameters
----------
L: gp_Lin2d
DL: IntRes2d_Domain
P: gp_Parab2d
DP: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Lin2d & L, const IntRes2d_Domain & DL, const gp_Parab2d & P, const IntRes2d_Domain & DP, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** IntCurve_IntConicConic ******************/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Intersection between a line and an hyperbola.

Parameters
----------
L: gp_Lin2d
DL: IntRes2d_Domain
H: gp_Hypr2d
DH: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Lin2d & L, const IntRes2d_Domain & DL, const gp_Hypr2d & H, const IntRes2d_Domain & DH, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** IntCurve_IntConicConic ******************/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Intersection between 2 circles from gp. the exception constructionerror is raised if the method isclosed of one of the domain returns false.

Parameters
----------
C1: gp_Circ2d
D1: IntRes2d_Domain
C2: gp_Circ2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Circ2d & C1, const IntRes2d_Domain & D1, const gp_Circ2d & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** IntCurve_IntConicConic ******************/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Intersection between a circle and an ellipse. the exception constructionerror is raised if the method isclosed of one the domain returns false.

Parameters
----------
C: gp_Circ2d
DC: IntRes2d_Domain
E: gp_Elips2d
DE: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Circ2d & C, const IntRes2d_Domain & DC, const gp_Elips2d & E, const IntRes2d_Domain & DE, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** IntCurve_IntConicConic ******************/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Intersection between a circle and a parabola. the exception constructionerror is raised if the method isclosed of the domain of the circle returns false.

Parameters
----------
C: gp_Circ2d
DC: IntRes2d_Domain
P: gp_Parab2d
DP: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Circ2d & C, const IntRes2d_Domain & DC, const gp_Parab2d & P, const IntRes2d_Domain & DP, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** IntCurve_IntConicConic ******************/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Intersection between a circle and an hyperbola. the exception constructionerror is raised if the method isclosed of the domain of the circle returns false.

Parameters
----------
C: gp_Circ2d
DC: IntRes2d_Domain
H: gp_Hypr2d
DH: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Circ2d & C, const IntRes2d_Domain & DC, const gp_Hypr2d & H, const IntRes2d_Domain & DH, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** IntCurve_IntConicConic ******************/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Intersection between 2 ellipses. the exception constructionerror is raised if the method isclosed of one of the domain returns false.

Parameters
----------
E1: gp_Elips2d
D1: IntRes2d_Domain
E2: gp_Elips2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Elips2d & E1, const IntRes2d_Domain & D1, const gp_Elips2d & E2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** IntCurve_IntConicConic ******************/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Intersection between an ellipse and a parabola. the exception constructionerror is raised if the method isclosed of the domain of the ellipse returns false.

Parameters
----------
E: gp_Elips2d
DE: IntRes2d_Domain
P: gp_Parab2d
DP: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Elips2d & E, const IntRes2d_Domain & DE, const gp_Parab2d & P, const IntRes2d_Domain & DP, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** IntCurve_IntConicConic ******************/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Intersection between an ellipse and an hyperbola. the exception constructionerror is raised if the method isclosed of the domain of the ellipse returns false.

Parameters
----------
E: gp_Elips2d
DE: IntRes2d_Domain
H: gp_Hypr2d
DH: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Elips2d & E, const IntRes2d_Domain & DE, const gp_Hypr2d & H, const IntRes2d_Domain & DH, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** IntCurve_IntConicConic ******************/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Intersection between 2 parabolas.

Parameters
----------
P1: gp_Parab2d
D1: IntRes2d_Domain
P2: gp_Parab2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Parab2d & P1, const IntRes2d_Domain & D1, const gp_Parab2d & P2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** IntCurve_IntConicConic ******************/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Intersection between a parabola and an hyperbola.

Parameters
----------
P: gp_Parab2d
DP: IntRes2d_Domain
H: gp_Hypr2d
DH: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Parab2d & P, const IntRes2d_Domain & DP, const gp_Hypr2d & H, const IntRes2d_Domain & DH, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** IntCurve_IntConicConic ******************/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Intersection between 2 hyperbolas.

Parameters
----------
H1: gp_Hypr2d
D1: IntRes2d_Domain
H2: gp_Hypr2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic(const gp_Hypr2d & H1, const IntRes2d_Domain & D1, const gp_Hypr2d & H2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 lines from gp.

Parameters
----------
L1: gp_Lin2d
D1: IntRes2d_Domain
L2: gp_Lin2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Lin2d & L1, const IntRes2d_Domain & D1, const gp_Lin2d & L2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and a circle. the exception constructionerror is raised if the method isclosed of the domain of the circle returns false.

Parameters
----------
L: gp_Lin2d
DL: IntRes2d_Domain
C: gp_Circ2d
DC: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & DL, const gp_Circ2d & C, const IntRes2d_Domain & DC, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and an ellipse. the exception constructionerror is raised if the method isclosed of the domain of the ellipse returns false.

Parameters
----------
L: gp_Lin2d
DL: IntRes2d_Domain
E: gp_Elips2d
DE: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & DL, const gp_Elips2d & E, const IntRes2d_Domain & DE, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and a parabola from gp.

Parameters
----------
L: gp_Lin2d
DL: IntRes2d_Domain
P: gp_Parab2d
DP: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & DL, const gp_Parab2d & P, const IntRes2d_Domain & DP, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and an hyperbola.

Parameters
----------
L: gp_Lin2d
DL: IntRes2d_Domain
H: gp_Hypr2d
DH: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & DL, const gp_Hypr2d & H, const IntRes2d_Domain & DH, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 circles from gp. the exception constructionerror is raised if the method isclosed of the domain of one of the circle returns false.

Parameters
----------
C1: gp_Circ2d
D1: IntRes2d_Domain
C2: gp_Circ2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Circ2d & C1, const IntRes2d_Domain & D1, const gp_Circ2d & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a circle and an ellipse. the exception constructionerror is raised if the method isclosed of one the domain returns false.

Parameters
----------
C: gp_Circ2d
DC: IntRes2d_Domain
E: gp_Elips2d
DE: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & DC, const gp_Elips2d & E, const IntRes2d_Domain & DE, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a circle and a parabola. the exception constructionerror is raised if the method isclosed of the domain of the circle returns false.

Parameters
----------
C: gp_Circ2d
DC: IntRes2d_Domain
P: gp_Parab2d
DP: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & DC, const gp_Parab2d & P, const IntRes2d_Domain & DP, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a circle and an hyperbola. the exception constructionerror is raised if the method isclosed of the domain of the circle returns false.

Parameters
----------
C: gp_Circ2d
DC: IntRes2d_Domain
H: gp_Hypr2d
DH: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & DC, const gp_Hypr2d & H, const IntRes2d_Domain & DH, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 ellipses. the exception constructionerror is raised if the method isclosed of one of the domain returns false.

Parameters
----------
E1: gp_Elips2d
D1: IntRes2d_Domain
E2: gp_Elips2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Elips2d & E1, const IntRes2d_Domain & D1, const gp_Elips2d & E2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between an ellipse and a parabola. the exception constructionerror is raised if the method isclosed of the domain of the ellipse returns false.

Parameters
----------
E: gp_Elips2d
DE: IntRes2d_Domain
P: gp_Parab2d
DP: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & DE, const gp_Parab2d & P, const IntRes2d_Domain & DP, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between an ellipse and an hyperbola. the exception constructionerror is raised if the method isclosed of the domain of the ellipse returns false.

Parameters
----------
E: gp_Elips2d
DE: IntRes2d_Domain
H: gp_Hypr2d
DH: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & DE, const gp_Hypr2d & H, const IntRes2d_Domain & DH, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 parabolas.

Parameters
----------
P1: gp_Parab2d
D1: IntRes2d_Domain
P2: gp_Parab2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Parab2d & P1, const IntRes2d_Domain & D1, const gp_Parab2d & P2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a parabola and an hyperbola.

Parameters
----------
P: gp_Parab2d
DP: IntRes2d_Domain
H: gp_Hypr2d
DH: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Parab2d & P, const IntRes2d_Domain & DP, const gp_Hypr2d & H, const IntRes2d_Domain & DH, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 hyperbolas.

Parameters
----------
H1: gp_Hypr2d
D1: IntRes2d_Domain
H2: gp_Hypr2d
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Hypr2d & H1, const IntRes2d_Domain & D1, const gp_Hypr2d & H2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

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
		/****************** IntCurve_IntImpConicParConic ******************/
		%feature("compactdefaultargs") IntCurve_IntImpConicParConic;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntCurve_IntImpConicParConic;
		 IntCurve_IntImpConicParConic();

		/****************** IntCurve_IntImpConicParConic ******************/
		%feature("compactdefaultargs") IntCurve_IntImpConicParConic;
		%feature("autodoc", "Intersection between an implicit curve and a parametrised curve. the exception constructionerror is raised if the domain of the parametrised curve does not verify hasfirstpoint and haslastpoint return true.

Parameters
----------
ITool: IntCurve_IConicTool
Dom1: IntRes2d_Domain
PCurve: IntCurve_PConic
Dom2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") IntCurve_IntImpConicParConic;
		 IntCurve_IntImpConicParConic(const IntCurve_IConicTool & ITool, const IntRes2d_Domain & Dom1, const IntCurve_PConic & PCurve, const IntRes2d_Domain & Dom2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** And_Domaine_Objet1_Intersections ******************/
		%feature("compactdefaultargs") And_Domaine_Objet1_Intersections;
		%feature("autodoc", "No available documentation.

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
EpsNul: float

Returns
-------
NbResultats: int
") And_Domaine_Objet1_Intersections;
		void And_Domaine_Objet1_Intersections(const IntCurve_IConicTool & TheImpTool, const IntCurve_PConic & TheParCurve, const IntRes2d_Domain & TheImpCurveDomain, const IntRes2d_Domain & TheParCurveDomain, Standard_Integer &OutValue, TColStd_Array1OfReal & Inter2_And_Domain2, TColStd_Array1OfReal & Inter1, TColStd_Array1OfReal & Resultat1, TColStd_Array1OfReal & Resultat2, const Standard_Real EpsNul);

		/****************** FindU ******************/
		%feature("compactdefaultargs") FindU;
		%feature("autodoc", "No available documentation.

Parameters
----------
parameter: float
point: gp_Pnt2d
TheParCurev: IntCurve_PConic
TheImpTool: IntCurve_IConicTool

Returns
-------
float
") FindU;
		Standard_Real FindU(const Standard_Real parameter, gp_Pnt2d & point, const IntCurve_PConic & TheParCurev, const IntCurve_IConicTool & TheImpTool);

		/****************** FindV ******************/
		%feature("compactdefaultargs") FindV;
		%feature("autodoc", "No available documentation.

Parameters
----------
parameter: float
point: gp_Pnt2d
TheImpTool: IntCurve_IConicTool
ParCurve: IntCurve_PConic
TheParCurveDomain: IntRes2d_Domain
V0: float
V1: float
Tolerance: float

Returns
-------
float
") FindV;
		Standard_Real FindV(const Standard_Real parameter, gp_Pnt2d & point, const IntCurve_IConicTool & TheImpTool, const IntCurve_PConic & ParCurve, const IntRes2d_Domain & TheParCurveDomain, const Standard_Real V0, const Standard_Real V1, const Standard_Real Tolerance);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between an implicit curve and a parametrised curve. the exception constructionerror is raised if the domain of the parametrised curve does not verify hasfirstpoint and haslastpoint return true.

Parameters
----------
ITool: IntCurve_IConicTool
Dom1: IntRes2d_Domain
PCurve: IntCurve_PConic
Dom2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const IntCurve_IConicTool & ITool, const IntRes2d_Domain & Dom1, const IntCurve_PConic & PCurve, const IntRes2d_Domain & Dom2, const Standard_Real TolConf, const Standard_Real Tol);

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
		/****************** IntCurve_MyImpParToolOfIntImpConicParConic ******************/
		%feature("compactdefaultargs") IntCurve_MyImpParToolOfIntImpConicParConic;
		%feature("autodoc", "Constructor of the class.

Parameters
----------
IT: IntCurve_IConicTool
PC: IntCurve_PConic

Returns
-------
None
") IntCurve_MyImpParToolOfIntImpConicParConic;
		 IntCurve_MyImpParToolOfIntImpConicParConic(const IntCurve_IConicTool & IT, const IntCurve_PConic & PC);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Computes the derivative of the previous function at parameter param.

Parameters
----------
Param: float

Returns
-------
D: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real Param, Standard_Real &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value of the signed distance between the implicit curve and the point at parameter param on the parametrised curve.

Parameters
----------
Param: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real Param, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value and the derivative of the function.

Parameters
----------
Param: float

Returns
-------
F: float
D: float
") Values;
		Standard_Boolean Values(const Standard_Real Param, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****************** IntCurve_PConic ******************/
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: IntCurve_PConic

Returns
-------
None
") IntCurve_PConic;
		 IntCurve_PConic(const IntCurve_PConic & PC);

		/****************** IntCurve_PConic ******************/
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: gp_Elips2d

Returns
-------
None
") IntCurve_PConic;
		 IntCurve_PConic(const gp_Elips2d & E);

		/****************** IntCurve_PConic ******************/
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ2d

Returns
-------
None
") IntCurve_PConic;
		 IntCurve_PConic(const gp_Circ2d & C);

		/****************** IntCurve_PConic ******************/
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Parab2d

Returns
-------
None
") IntCurve_PConic;
		 IntCurve_PConic(const gp_Parab2d & P);

		/****************** IntCurve_PConic ******************/
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "No available documentation.

Parameters
----------
H: gp_Hypr2d

Returns
-------
None
") IntCurve_PConic;
		 IntCurve_PConic(const gp_Hypr2d & H);

		/****************** IntCurve_PConic ******************/
		%feature("compactdefaultargs") IntCurve_PConic;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin2d

Returns
-------
None
") IntCurve_PConic;
		 IntCurve_PConic(const gp_Lin2d & L);

		/****************** Accuracy ******************/
		%feature("compactdefaultargs") Accuracy;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Accuracy;
		Standard_Integer Accuracy();

		/****************** Axis2 ******************/
		%feature("compactdefaultargs") Axis2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Ax22d
") Axis2;
		const gp_Ax22d Axis2();

		/****************** EpsX ******************/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") EpsX;
		Standard_Real EpsX();

		/****************** Param1 ******************/
		%feature("compactdefaultargs") Param1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Param1;
		Standard_Real Param1();

		/****************** Param2 ******************/
		%feature("compactdefaultargs") Param2;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Param2;
		Standard_Real Param2();

		/****************** SetAccuracy ******************/
		%feature("compactdefaultargs") SetAccuracy;
		%feature("autodoc", "Accuracy is the number of samples used to approximate the parametric curve on its domain.

Parameters
----------
Nb: int

Returns
-------
None
") SetAccuracy;
		void SetAccuracy(const Standard_Integer Nb);

		/****************** SetEpsX ******************/
		%feature("compactdefaultargs") SetEpsX;
		%feature("autodoc", "Epsx is a internal tolerance used in math algorithms, usually about 1e-10 (see functionallroots for more details).

Parameters
----------
EpsDist: float

Returns
-------
None
") SetEpsX;
		void SetEpsX(const Standard_Real EpsDist);

		/****************** TypeCurve ******************/
		%feature("compactdefaultargs") TypeCurve;
		%feature("autodoc", "The conics are manipulated as objects which only depend on three parameters : axis and two real from standards. type curve is used to select the correct conic.

Returns
-------
GeomAbs_CurveType
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
		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: IntCurve_PConic
U: float
P: gp_Pnt2d
T: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const IntCurve_PConic & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & T);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: IntCurve_PConic
U: float
P: gp_Pnt2d
T: gp_Vec2d
N: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const IntCurve_PConic & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & T, gp_Vec2d & N);

		/****************** EpsX ******************/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: IntCurve_PConic

Returns
-------
float
") EpsX;
		static Standard_Real EpsX(const IntCurve_PConic & C);

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: IntCurve_PConic

Returns
-------
int
") NbSamples;
		static Standard_Integer NbSamples(const IntCurve_PConic & C);

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: IntCurve_PConic
U0: float
U1: float

Returns
-------
int
") NbSamples;
		static Standard_Integer NbSamples(const IntCurve_PConic & C, const Standard_Real U0, const Standard_Real U1);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: IntCurve_PConic
X: float

Returns
-------
gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const IntCurve_PConic & C, const Standard_Real X);

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
		/****************** FindParameter ******************/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "Returns the parameter v of the point on the parametric curve corresponding to the point pnt. the correspondance between pnt and the point p(v) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. tol is the tolerance on the distance between a point and the parametrised curve. in that case, no bounds are given. the research of the rigth parameter has to be made on the natural parametric domain of the curve.

Parameters
----------
C: IntCurve_PConic
Pnt: gp_Pnt2d
Tol: float

Returns
-------
float
") FindParameter;
		static Standard_Real FindParameter(const IntCurve_PConic & C, const gp_Pnt2d & Pnt, const Standard_Real Tol);

		/****************** FindParameter ******************/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "Returns the parameter v of the point on the parametric curve corresponding to the point pnt. the correspondance between pnt and the point p(v) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. tol is the tolerance on the distance between a point and the parametrised curve. lowparameter and highparameter give the boundaries of the interval in wich the parameter certainly lies. these parameters are given to implement a more efficient algoritm. so, it is not necessary to check that the returned value verifies lowparameter <= value <= highparameter.

Parameters
----------
C: IntCurve_PConic
Pnt: gp_Pnt2d
LowParameter: float
HighParameter: float
Tol: float

Returns
-------
float
") FindParameter;
		static Standard_Real FindParameter(const IntCurve_PConic & C, const gp_Pnt2d & Pnt, const Standard_Real LowParameter, const Standard_Real HighParameter, const Standard_Real Tol);

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
