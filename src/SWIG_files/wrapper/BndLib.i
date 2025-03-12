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
%define BNDLIBDOCSTRING
"BndLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_bndlib.html"
%enddef
%module (package="OCC.Core", docstring=BNDLIBDOCSTRING) BndLib


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
#include<BndLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<Bnd_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import Bnd.i
%import Adaptor2d.i
%import Geom2d.i
%import Adaptor3d.i

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

/***************
* class BndLib *
***************/
%rename(bndlib) BndLib;
class BndLib {
	public:
		/****** BndLib::Add ******/
		/****** md5 signature: 9e863879ef8ae6ec63335c0c92f20f7b ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
P1: float
P2: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
Bounding box for a surface trimmed or not Adds the segment of the line L limited by the two parameter values P1 and P2, to the bounding box B, and then enlarges B by the tolerance value Tol. Tol is the tolerance value to enlarge the minimum and maximum dimension P1 and P2 may represent infinite values. Exceptions Standard_Failure if P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const gp_Lin & L, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 23242c6543bab1a14b6154ff3697b979 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
P1: float
P2: float
Tol: float
B: Bnd_Box2d

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Lin2d & L, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box2d & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 753571845c48cb9251f86d609d2a89ca ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Circ & C, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 1efdca2670db70fa6a2871b88bab74b4 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
P1: float
P2: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
P2-P1 can be in [0,2*pi].
") Add;
		static void Add(const gp_Circ & C, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 8837ea6283b5c8754ea403c115415767 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
Tol: float
B: Bnd_Box2d

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Circ2d & C, const Standard_Real Tol, Bnd_Box2d & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 6db3619ed210691eb9ab660e55d2db14 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
P1: float
P2: float
Tol: float
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds the circle C, or the arc of the circle C limited by the two parameter values P1 and P2, to the bounding box B, and then enlarges B by the tolerance value Tol. P2-P1 can be in [0,2*pi].
") Add;
		static void Add(const gp_Circ2d & C, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box2d & B);

		/****** BndLib::Add ******/
		/****** md5 signature: cb7aaeb4b7002b79e968d392d8e00c7d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: gp_Elips
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Elips & C, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: bc333447be55ac79ebc2a052fb825ec5 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: gp_Elips
P1: float
P2: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
P2-P1 can be in [0,2*pi].
") Add;
		static void Add(const gp_Elips & C, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: d6fcbe939ee0e34ebf1192f8621954bf ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: gp_Elips2d
Tol: float
B: Bnd_Box2d

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Elips2d & C, const Standard_Real Tol, Bnd_Box2d & B);

		/****** BndLib::Add ******/
		/****** md5 signature: f804f0a213c11c017f412d35ab696701 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: gp_Elips2d
P1: float
P2: float
Tol: float
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds the ellipse E, or the arc of the ellipse E limited by the two parameter values P1 and P2, to the bounding box B, and then enlarges B by the tolerance value Tol. P2-P1 can be in [0,2*pi].
") Add;
		static void Add(const gp_Elips2d & C, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box2d & B);

		/****** BndLib::Add ******/
		/****** md5 signature: c9a99ceb4a019c07e9c40c77ed28e6c0 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab
P1: float
P2: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Parab & P, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 3cce29a85482026eb4c7eeea20837f22 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab2d
P1: float
P2: float
Tol: float
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds the arc of the parabola P limited by the two parameter values P1 and P2, to the bounding box B, and then enlarges B by the tolerance value Tol. P1 and P2 may represent infinite values. Exceptions Standard_Failure if P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const gp_Parab2d & P, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box2d & B);

		/****** BndLib::Add ******/
		/****** md5 signature: b684391ac023124c9da0c3e41193c63d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr
P1: float
P2: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Hypr & H, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: ec0e75237003f2d23d26e6b7e90d83dc ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
P1: float
P2: float
Tol: float
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds the arc of the branch of hyperbola H limited by the two parameter values P1 and P2, to the bounding box B, and then enlarges B by the tolerance value Tol. P1 and P2 may represent infinite values. Exceptions Standard_Failure if P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const gp_Hypr2d & H, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box2d & B);

		/****** BndLib::Add ******/
		/****** md5 signature: e0a1ce63019468c2b8490dabeb0bad71 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: gp_Cylinder
UMin: float
UMax: float
VMin: float
VMax: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
UMax -UMin can be in [0,2*pi].
") Add;
		static void Add(const gp_Cylinder & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: aab8c9916d1ceda6b0efb646a4117ebd ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: gp_Cylinder
VMin: float
VMax: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B, the patch of the cylinder S limited - in the v parametric direction, by the two parameter values VMin and VMax - and optionally in the u parametric direction, by the two parameter values UMin and UMax. B is then enlarged by the tolerance value Tol. VMin and VMax may represent infinite values. Exceptions Standard_Failure if VMin and VMax are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const gp_Cylinder & S, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 52017d305dc6b6b7d30a7d1995a06376 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: gp_Cone
UMin: float
UMax: float
VMin: float
VMax: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
UMax-UMin can be in [0,2*pi].
") Add;
		static void Add(const gp_Cone & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: e2e2228fc1fdd5275af97416214161a9 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: gp_Cone
VMin: float
VMax: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B, the patch of the cone S limited - in the v parametric direction, by the two parameter values VMin and VMax - and optionally in the u parametric direction, by the two parameter values UMin and UMax, B is then enlarged by the tolerance value Tol. VMin and VMax may represent infinite values. Exceptions Standard_Failure if VMin and VMax are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const gp_Cone & S, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 0a24fd63fa0454b7f2f51a783d6507be ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Sphere & S, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 2fb2aa38bcd30008a28df565d3d4d05c ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
UMin: float
UMax: float
VMin: float
VMax: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B the sphere S, or - the patch of the sphere S, limited in the u parametric direction, by the two parameter values UMin and UMax, and in the v parametric direction, by the two parameter values VMin and VMax. B is then enlarged by the tolerance value Tol. UMax-UMin can be in [0,2*pi] VMin,VMax can be [-pi/2,pi/2].
") Add;
		static void Add(const gp_Sphere & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 6fff0fb723f01427006c4572caa954e0 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
P: gp_Torus
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Torus & P, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: b9c657fe7b6d0e95c04873218635802b ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
P: gp_Torus
UMin: float
UMax: float
VMin: float
VMax: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B - the torus S, or - the patch of the torus S, limited in the u parametric direction, by the two parameter values UMin and UMax, and in the v parametric direction, by the two parameter values VMin and VMax. B is then enlarged by the tolerance value Tol. UMax-UMin can be in [0,2*pi], VMin,VMax can be [-pi/2,pi/2].
") Add;
		static void Add(const gp_Torus & P, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

};


%extend BndLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BndLib_Add2dCurve *
**************************/
class BndLib_Add2dCurve {
	public:
		/****** BndLib_Add2dCurve::Add ******/
		/****** md5 signature: 24ba478f5e879db98be904c511fd4dd5 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Tol: float
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds to the bounding box B the curve C B is then enlarged by the tolerance value Tol. Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, - if not, the points of an approximation of the curve C. Warning C is an adapted curve, that is, an object which is an interface between: - the services provided by a 2D curve from the package Geom2d - and those required of the curve by the computation algorithm. The adapted curve is created in the following way: opencascade::handle<Geom2d_Curve> mycurve = ... ; Geom2dAdaptor_Curve C(mycurve); The bounding box B is then enlarged by adding it: Bnd_Box2d B; // ... Standard_Real Tol = ... ; Add2dCurve::Add ( C, Tol, B ); Exceptions Standard_Failure if the curve is built from: - a Geom_Line, or - a Geom_Parabola, or - a Geom_Hyperbola, and P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const Adaptor2d_Curve2d & C, const Standard_Real Tol, Bnd_Box2d & B);

		/****** BndLib_Add2dCurve::Add ******/
		/****** md5 signature: 7534a60c213292f46585ce5a36173676 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U1: float
U2: float
Tol: float
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds to the bounding box Bthe arc of the curve C limited by the two parameter values P1 and P2. B is then enlarged by the tolerance value Tol. Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, - if not, the points of an approximation of the curve C. Warning C is an adapted curve, that is, an object which is an interface between: - the services provided by a 2D curve from the package Geom2d - and those required of the curve by the computation algorithm. The adapted curve is created in the following way: opencascade::handle<Geom2d_Curve> mycurve = ... ; Geom2dAdaptor_Curve C(mycurve); The bounding box B is then enlarged by adding it: Bnd_Box2d B; // ... Standard_Real Tol = ... ; Add2dCurve::Add ( C, Tol, B ); Exceptions Standard_Failure if the curve is built from: - a Geom_Line, or - a Geom_Parabola, or - a Geom_Hyperbola, and P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const Adaptor2d_Curve2d & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol, Bnd_Box2d & B);

		/****** BndLib_Add2dCurve::Add ******/
		/****** md5 signature: 50b9721fa8ed9d9c41295d649bdd32af ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
Tol: float
Box: Bnd_Box2d

Return
-------
None

Description
-----------
Adds to the bounding box B the curve C B is then enlarged by the tolerance value Tol. Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, - if not, the points of an approximation of the curve C.
") Add;
		static void Add(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real Tol, Bnd_Box2d & Box);

		/****** BndLib_Add2dCurve::Add ******/
		/****** md5 signature: eedfe68de0380d5f37d16bc918c0d037 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
U1: float
U2: float
Tol: float
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds to the bounding box B the part of curve C B is then enlarged by the tolerance value Tol. U1, U2 - the parametric range to compute the bounding box; Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, - if not, the points of an approximation of the curve C.
") Add;
		static void Add(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol, Bnd_Box2d & B);

		/****** BndLib_Add2dCurve::AddOptimal ******/
		/****** md5 signature: bd6bfafd3a4edaae34079bdd6693208f ******/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
U1: float
U2: float
Tol: float
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds to the bounding box B the part of curve C B is then enlarged by the tolerance value Tol. U1, U2 - the parametric range to compute the bounding box; Note: depending on the type of curve, one of the following algorithms is used to include it in the bounding box B: - an exact analytical if C is built from a line, a circle or a conic curve, - numerical calculation of bounding box sizes, based on minimization algorithm, for other types of curve If Tol = < Precision::PConfusion(), Precision::PConfusion is used as tolerance for calculation.
") AddOptimal;
		static void AddOptimal(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol, Bnd_Box2d & B);

};


%extend BndLib_Add2dCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BndLib_Add3dCurve *
**************************/
class BndLib_Add3dCurve {
	public:
		/****** BndLib_Add3dCurve::Add ******/
		/****** md5 signature: feeae1972ee1704fc60fe0fe7da1239b ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B the curve C B is then enlarged by the tolerance value Tol. Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, if not, the points of an approximation of the curve C. Warning C is an adapted curve, that is, an object which is an interface between: - the services provided by a 3D curve from the package Geom - and those required of the curve by the computation algorithm. The adapted curve is created in the following way: opencascade::handle<Geom_Curve> mycurve = ... ; GeomAdaptor_Curve C(mycurve); The bounding box B is then enlarged by adding it: Bnd_Box B; // ... Standard_Real Tol = ... ; Add3dCurve::Add ( C, Tol, B ); Exceptions Standard_Failure if the curve is built from: - a Geom_Line, or - a Geom_Parabola, or - a Geom_Hyperbola, and P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const Adaptor3d_Curve & C, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib_Add3dCurve::Add ******/
		/****** md5 signature: 47adc866a9340ea705f29d3eda6a5159 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U1: float
U2: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B the curve C the arc of the curve C limited by the two parameter values P1 and P2. Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, if not, the points of an approximation of the curve C. Warning C is an adapted curve, that is, an object which is an interface between: - the services provided by a 3D curve from the package Geom - and those required of the curve by the computation algorithm. The adapted curve is created in the following way: opencascade::handle<Geom_Curve> mycurve = ... ; GeomAdaptor_Curve C(mycurve); The bounding box B is then enlarged by adding it: Bnd_Box B; // ... Standard_Real Tol = ... ; Add3dCurve::Add ( C, Tol, B ); Exceptions Standard_Failure if the curve is built from: - a Geom_Line, or - a Geom_Parabola, or - a Geom_Hyperbola, and P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const Adaptor3d_Curve & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib_Add3dCurve::AddGenCurv ******/
		/****** md5 signature: 8eff7d11e8817d862d3149011310b4d0 ******/
		%feature("compactdefaultargs") AddGenCurv;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
UMin: float
UMax: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B the curve C using numerical minimization algorithms This method is used in AddOptimal for not analytical curves. if Tol < Precision::Confusion(), Precision:;Confusion is used as computation tolerance.
") AddGenCurv;
		static void AddGenCurv(const Adaptor3d_Curve & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib_Add3dCurve::AddOptimal ******/
		/****** md5 signature: eb89dbca3787f6245593b68962baf91d ******/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B the curve C These methods use more precise algorithms for building bnd box then methods Add(...).
") AddOptimal;
		static void AddOptimal(const Adaptor3d_Curve & C, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib_Add3dCurve::AddOptimal ******/
		/****** md5 signature: 0140fcda0ee2d13032232592e46f42c8 ******/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U1: float
U2: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") AddOptimal;
		static void AddOptimal(const Adaptor3d_Curve & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol, Bnd_Box & B);

};


%extend BndLib_Add3dCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BndLib_AddSurface *
**************************/
class BndLib_AddSurface {
	public:
		/****** BndLib_AddSurface::Add ******/
		/****** md5 signature: 57d43d60c64d1900d9b7cf8d3c4c9d65 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B the surface S B is then enlarged by the tolerance value Tol. Note: depending on the type of curve, one of the following representations of the surface S is used to include it in the bounding box B: - an exact representation if S is built from a plane, a cylinder, a cone, a sphere or a torus, - the poles of the surface if S is built from a Bezier surface or a BSpline surface, - the points of an approximation of the surface S in cases other than offset surfaces; - in the case of an offset surface, the basis surface is first included according to the previous rules; then the bounding box is enlarged by the offset value. Warning Do not use these functions to add a non-finite surface to the bounding box B. If UMin, UMax, VMin or VMax is an infinite value B will become WholeSpace. S is an adapted surface, that is, an object which is an interface between: - the services provided by a surface from the package Geom - and those required of the surface by the computation algorithm. The adapted surface is created in the following way: opencascade::handle<Geom_Surface> mysurface = ... ; GeomAdaptor_Surface S(mysurface); The bounding box B is then enlarged by adding this surface: Bnd_Box B; // ... Standard_Real Tol = ... ; AddSurface::Add ( S, Tol, B );.
") Add;
		static void Add(const Adaptor3d_Surface & S, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib_AddSurface::Add ******/
		/****** md5 signature: 6eeef39d1ef98304142d45b0bdfeebb3 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
UMin: float
UMax: float
VMin: float
VMax: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B the surface S the patch of the surface S limited in the u parametric direction by the two parameter values UMin, UMax, and in the v parametric direction by the two parameter values VMin, VMax. Note: depending on the type of curve, one of the following representations of the surface S is used to include it in the bounding box B: - an exact representation if S is built from a plane, a cylinder, a cone, a sphere or a torus, - the poles of the surface if S is built from a Bezier surface or a BSpline surface, - the points of an approximation of the surface S in cases other than offset surfaces; - in the case of an offset surface, the basis surface is first included according to the previous rules; then the bounding box is enlarged by the offset value. Warning Do not use these functions to add a non-finite surface to the bounding box B. If UMin, UMax, VMin or VMax is an infinite value B will become WholeSpace. S is an adapted surface, that is, an object which is an interface between: - the services provided by a surface from the package Geom - and those required of the surface by the computation algorithm. The adapted surface is created in the following way: opencascade::handle<Geom_Surface> mysurface = ... ; GeomAdaptor_Surface S(mysurface); The bounding box B is then enlarged by adding this surface: Bnd_Box B; // ... Standard_Real Tol = ... ; AddSurface::Add ( S, Tol, B );.
") Add;
		static void Add(const Adaptor3d_Surface & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib_AddSurface::AddGenSurf ******/
		/****** md5 signature: b14f5e9ed365aa271c910dd838bef5ec ******/
		%feature("compactdefaultargs") AddGenSurf;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
UMin: float
UMax: float
VMin: float
VMax: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B the surface S using numerical minimization algorithms This method is used in AddOptimal for not analytical surfaces and torus. if Tol < Precision::Confusion(), Precision::Confusion is used as computation tolerance.
") AddGenSurf;
		static void AddGenSurf(const Adaptor3d_Surface & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib_AddSurface::AddOptimal ******/
		/****** md5 signature: 8a4f780b04453b509615616b28d119e2 ******/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") AddOptimal;
		static void AddOptimal(const Adaptor3d_Surface & S, const Standard_Real Tol, Bnd_Box & B);

		/****** BndLib_AddSurface::AddOptimal ******/
		/****** md5 signature: e93fe299fd887a5aea45a80df9482141 ******/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
UMin: float
UMax: float
VMin: float
VMax: float
Tol: float
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") AddOptimal;
		static void AddOptimal(const Adaptor3d_Surface & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

};


%extend BndLib_AddSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def bndlib_Add(*args):
	return bndlib.Add(*args)

@deprecated
def BndLib_Add2dCurve_Add(*args):
	return BndLib_Add2dCurve.Add(*args)

@deprecated
def BndLib_Add2dCurve_Add(*args):
	return BndLib_Add2dCurve.Add(*args)

@deprecated
def BndLib_Add2dCurve_Add(*args):
	return BndLib_Add2dCurve.Add(*args)

@deprecated
def BndLib_Add2dCurve_Add(*args):
	return BndLib_Add2dCurve.Add(*args)

@deprecated
def BndLib_Add2dCurve_AddOptimal(*args):
	return BndLib_Add2dCurve.AddOptimal(*args)

@deprecated
def BndLib_Add3dCurve_Add(*args):
	return BndLib_Add3dCurve.Add(*args)

@deprecated
def BndLib_Add3dCurve_Add(*args):
	return BndLib_Add3dCurve.Add(*args)

@deprecated
def BndLib_Add3dCurve_AddGenCurv(*args):
	return BndLib_Add3dCurve.AddGenCurv(*args)

@deprecated
def BndLib_Add3dCurve_AddOptimal(*args):
	return BndLib_Add3dCurve.AddOptimal(*args)

@deprecated
def BndLib_Add3dCurve_AddOptimal(*args):
	return BndLib_Add3dCurve.AddOptimal(*args)

@deprecated
def BndLib_AddSurface_Add(*args):
	return BndLib_AddSurface.Add(*args)

@deprecated
def BndLib_AddSurface_Add(*args):
	return BndLib_AddSurface.Add(*args)

@deprecated
def BndLib_AddSurface_AddGenSurf(*args):
	return BndLib_AddSurface.AddGenSurf(*args)

@deprecated
def BndLib_AddSurface_AddOptimal(*args):
	return BndLib_AddSurface.AddOptimal(*args)

@deprecated
def BndLib_AddSurface_AddOptimal(*args):
	return BndLib_AddSurface.AddOptimal(*args)

}
