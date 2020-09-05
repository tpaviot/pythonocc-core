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
		/**** md5 signature: 2af2a96e4f36037108c7a715a6a910a6 ****/
		%feature("compactdefaultargs") IntCurve_IConicTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntCurve_IConicTool;
		 IntCurve_IConicTool();

		/****************** IntCurve_IConicTool ******************/
		/**** md5 signature: 0ffb645c5a536dfdf34a7231eb4c4401 ****/
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
		/**** md5 signature: cf0b9f06360ba43725e959e5438ccee1 ****/
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
		/**** md5 signature: 5033f84f85ab623824628b5944ad71d6 ****/
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
		/**** md5 signature: b4c8ae55350ac9ed279c3f1549a8e5d4 ****/
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
		/**** md5 signature: 5e3401a480facafdb510791c9bf54b76 ****/
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
		/**** md5 signature: d31a9f2e3755842ee99ff69ef63e33d7 ****/
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
		/**** md5 signature: 0301175cb275239cd38bde26aa7fb356 ****/
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
		/**** md5 signature: 53aa05f4072428bdb8f24e370971bdad ****/
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
		/**** md5 signature: eafbc4fbb17061433dcb80a2bf868650 ****/
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
		/**** md5 signature: 096fb3de7d235570ab80208eeea6a6c8 ****/
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
		/**** md5 signature: 15b8e50fef88e1b1b6566cb5b0954bf6 ****/
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
		/**** md5 signature: 5c3456b2d3cbc53c1638b25ddf79bc7d ****/
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
		/**** md5 signature: 3e05c245cd3d446017ed5bbdf6bed00b ****/
		%feature("compactdefaultargs") IntCurve_IntConicConic;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntCurve_IntConicConic;
		 IntCurve_IntConicConic();

		/****************** IntCurve_IntConicConic ******************/
		/**** md5 signature: e3dc0166a6d5557fca96a06383b99d70 ****/
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
		/**** md5 signature: 776b631ba2eb2b3db91afbbef3fb3e40 ****/
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
		/**** md5 signature: 4b83ab802e0461d9b16455021e72f55e ****/
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
		/**** md5 signature: bbd1f761b867e66e08d0f3043bae81bd ****/
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
		/**** md5 signature: 82e6bc67383eb51785d5e51dda145a56 ****/
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
		/**** md5 signature: 03ffdf02a221b0824d22c6134a72fdb6 ****/
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
		/**** md5 signature: 2cc6bb0641c2c6bb742cdec11df85570 ****/
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
		/**** md5 signature: b3784a69df71b567f6d9d9072fe3cad4 ****/
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
		/**** md5 signature: e08508088ca0cd52a2a7e409d744e9c5 ****/
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
		/**** md5 signature: 08471f8934657eb81296fdcad3615a49 ****/
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
		/**** md5 signature: 34dd7d2b15ea7decb8ad74010a4d627f ****/
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
		/**** md5 signature: cda4a6ce7f8733984b70c7397f4a0216 ****/
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
		/**** md5 signature: c7267ae44b56bc0d59bc533401f7b964 ****/
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
		/**** md5 signature: 6f0859aa9804ea6d5a5b90781bdb2b44 ****/
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
		/**** md5 signature: 6c4e28c236e53237c7e11904ae89620f ****/
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
		/**** md5 signature: a14ce1fd03012a447c1b6b2fe4482779 ****/
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
		/**** md5 signature: 0ff434410a0f56b24f2a6a82daec3e2e ****/
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
		/**** md5 signature: 479ee6f5555ba3c46ca52a354ed920b1 ****/
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
		/**** md5 signature: 2400526dae6ba4f619ed6b88541450b5 ****/
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
		/**** md5 signature: f2c5c79a3603c5eb52caae167e5bdec3 ****/
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
		/**** md5 signature: 1729e7db4e2fbaeec6c9884590e09e4d ****/
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
		/**** md5 signature: 07ca23baec93d8e00be26b8fa65f866c ****/
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
		/**** md5 signature: 6ae139a77ccd077e2fdfbe0e8c96ea87 ****/
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
		/**** md5 signature: 95083a8d8c3df7d738b06ed2f7086b83 ****/
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
		/**** md5 signature: 055e80de39bb0cf433995a04fddaeba1 ****/
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
		/**** md5 signature: c138536882221fb8796915a1e64fc707 ****/
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
		/**** md5 signature: 056fca9c2935a0f33ccf7df0627171ec ****/
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
		/**** md5 signature: ae3e6ca1b9fd612ccd671b4c0b7a1fd4 ****/
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
		/**** md5 signature: d1b1e7babf8016c385559df08d8cd1a8 ****/
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
		/**** md5 signature: e59aa6878917394e7a28eeb872d910c6 ****/
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
		/**** md5 signature: 9860523eef48fd38db7a184ac6bd9ec3 ****/
		%feature("compactdefaultargs") IntCurve_IntImpConicParConic;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntCurve_IntImpConicParConic;
		 IntCurve_IntImpConicParConic();

		/****************** IntCurve_IntImpConicParConic ******************/
		/**** md5 signature: 133fe2fa08845fbe9f95095c45063de2 ****/
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
		/**** md5 signature: 178e616fbdac2a892674893a70a2f153 ****/
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
		/**** md5 signature: 6d10fbab5f9a5773a151224692391c25 ****/
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
		/**** md5 signature: 932acb59f53ad5bca830f8991bd1a653 ****/
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
		/**** md5 signature: 95d309ffde53cdc110d3a0c5ad56c923 ****/
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
		/**** md5 signature: 4433df7bba31dec8a454031a0d2609dc ****/
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
		/**** md5 signature: f61c873331fa555e182f1973e95f59da ****/
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
		/**** md5 signature: 96999dda9fe43560f6ec0c3dc2a0f930 ****/
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
		/**** md5 signature: 30b6c9e0ecc359e02c44e042b54e6b7c ****/
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
		/**** md5 signature: 5dab6cab4d7e7a7fe633a02033b6aad8 ****/
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
		/**** md5 signature: 8fe4f819897a9e0c3cf2afbc11d1b81b ****/
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
		/**** md5 signature: 54508df0aaa3603bc250b365d80b3013 ****/
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
		/**** md5 signature: a86e4bd14de6e5019e14ff2662d016e3 ****/
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
		/**** md5 signature: 8717ac575dc4f230eb6eee25db4395d2 ****/
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
		/**** md5 signature: 6bdfda89953e08e5960a15c26392e5c6 ****/
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
		/**** md5 signature: 6403d54ba8021d5f2680d4cc2760c686 ****/
		%feature("compactdefaultargs") Accuracy;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Accuracy;
		Standard_Integer Accuracy();

		/****************** Axis2 ******************/
		/**** md5 signature: eb95ccdfec5da4dc648b684ba2a0e1e1 ****/
		%feature("compactdefaultargs") Axis2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Ax22d
") Axis2;
		const gp_Ax22d Axis2();

		/****************** EpsX ******************/
		/**** md5 signature: aeec72344926f6fdc72b7e82c3498cb5 ****/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") EpsX;
		Standard_Real EpsX();

		/****************** Param1 ******************/
		/**** md5 signature: b32a0cda1f3fa79783094342b9ed7630 ****/
		%feature("compactdefaultargs") Param1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Param1;
		Standard_Real Param1();

		/****************** Param2 ******************/
		/**** md5 signature: f67fb27325014626a3c9c881222c819a ****/
		%feature("compactdefaultargs") Param2;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Param2;
		Standard_Real Param2();

		/****************** SetAccuracy ******************/
		/**** md5 signature: 8dc3a6ed13c37b0a43345926056bc9f8 ****/
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
		/**** md5 signature: d7ef2bf8a1d3e785eba4c8e50e8760cf ****/
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
		/**** md5 signature: f067825570356c7fc20577704769d60d ****/
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
		/**** md5 signature: 6bac2a4602dcda5bd7e4136947e44d6b ****/
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
		/**** md5 signature: a7a4bd3079d6144949e0ff14fb5db439 ****/
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
		/**** md5 signature: 9dee76c192a4fe75acc6e81da71eded5 ****/
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
		/**** md5 signature: b41e1fe2f72cc65600ee0487a80978d4 ****/
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
		/**** md5 signature: 05efc726df4d752c8796c54936283dbf ****/
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
		/**** md5 signature: b5b7964d44d69e22d4ef561a4b7180a4 ****/
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
		/**** md5 signature: b3ff9d781501a95779dcbe1748529594 ****/
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
		/**** md5 signature: 9e46f77742bf8dcfba587637b406a059 ****/
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
