/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_bndlib.html"
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
		/****** md5 signature: 5c0875af73df61a6e67694f1682e180f ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
P1: double
P2: double
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
Bounding box for a surface trimmed or not Adds the segment of the line L limited by the two parameter values P1 and P2, to the bounding box B, and then enlarges B by the tolerance value Tol. Tol is the tolerance value to enlarge the minimum and maximum dimension P1 and P2 may represent infinite values. Exceptions Standard_Failure if P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const gp_Lin & L, const double P1, const double P2, const double Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 7cce3328a557772fe3336538f0e95429 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
P1: double
P2: double
Tol: double
B: Bnd_Box2d

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Lin2d & L, const double P1, const double P2, const double Tol, Bnd_Box2d & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 66b9b36183639733e168db3578a30fb9 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Circ & C, const double Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 0d364eae891deb43ecc3387bea0292e8 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
P1: double
P2: double
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
P2-P1 can be in [0,2*pi].
") Add;
		static void Add(const gp_Circ & C, const double P1, const double P2, const double Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: a8176f0cbb9366a3690a2a27102aad96 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
Tol: double
B: Bnd_Box2d

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Circ2d & C, const double Tol, Bnd_Box2d & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 7d38ea672093e7a6eef953fa35289f27 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
P1: double
P2: double
Tol: double
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds the circle C, or the arc of the circle C limited by the two parameter values P1 and P2, to the bounding box B, and then enlarges B by the tolerance value Tol. P2-P1 can be in [0,2*pi].
") Add;
		static void Add(const gp_Circ2d & C, const double P1, const double P2, const double Tol, Bnd_Box2d & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 0c24ae07de9732de3347cae2ccf9a33f ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: gp_Elips
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Elips & C, const double Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 99b4694bedba29bbe3bad736d7496369 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: gp_Elips
P1: double
P2: double
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
P2-P1 can be in [0,2*pi].
") Add;
		static void Add(const gp_Elips & C, const double P1, const double P2, const double Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 976ae74d22f0734beba02e99708506bc ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: gp_Elips2d
Tol: double
B: Bnd_Box2d

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Elips2d & C, const double Tol, Bnd_Box2d & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 09de057278ea0244de6622d297efc7bd ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: gp_Elips2d
P1: double
P2: double
Tol: double
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds the ellipse E, or the arc of the ellipse E limited by the two parameter values P1 and P2, to the bounding box B, and then enlarges B by the tolerance value Tol. P2-P1 can be in [0,2*pi].
") Add;
		static void Add(const gp_Elips2d & C, const double P1, const double P2, const double Tol, Bnd_Box2d & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 872afcd3d378d2ab2e3987a14f167e98 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab
P1: double
P2: double
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Parab & P, const double P1, const double P2, const double Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: c12cf632c8470c4801810f981e1ae26e ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab2d
P1: double
P2: double
Tol: double
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds the arc of the parabola P limited by the two parameter values P1 and P2, to the bounding box B, and then enlarges B by the tolerance value Tol. P1 and P2 may represent infinite values. Exceptions Standard_Failure if P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const gp_Parab2d & P, const double P1, const double P2, const double Tol, Bnd_Box2d & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 03484fabcaaf864412224d0240356812 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr
P1: double
P2: double
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Hypr & H, const double P1, const double P2, const double Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 40dfd9eabc4f27a3f7ec1c4c796d3dfa ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
P1: double
P2: double
Tol: double
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds the arc of the branch of hyperbola H limited by the two parameter values P1 and P2, to the bounding box B, and then enlarges B by the tolerance value Tol. P1 and P2 may represent infinite values. Exceptions Standard_Failure if P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const gp_Hypr2d & H, const double P1, const double P2, const double Tol, Bnd_Box2d & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 0642001cac4bfc25a577da0025b01f27 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: gp_Cylinder
UMin: double
UMax: double
VMin: double
VMax: double
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
UMax -UMin can be in [0,2*pi].
") Add;
		static void Add(const gp_Cylinder & S, const double UMin, const double UMax, const double VMin, const double VMax, const double Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 83923ee27a88e0e9fcb995237a1cd8f8 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: gp_Cylinder
VMin: double
VMax: double
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B, the patch of the cylinder S limited - in the v parametric direction, by the two parameter values VMin and VMax - and optionally in the u parametric direction, by the two parameter values UMin and UMax. B is then enlarged by the tolerance value Tol. VMin and VMax may represent infinite values. Exceptions Standard_Failure if VMin and VMax are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const gp_Cylinder & S, const double VMin, const double VMax, const double Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 7bd7c51f67e8047b99147f4335eb6d92 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: gp_Cone
UMin: double
UMax: double
VMin: double
VMax: double
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
UMax-UMin can be in [0,2*pi].
") Add;
		static void Add(const gp_Cone & S, const double UMin, const double UMax, const double VMin, const double VMax, const double Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 51a0543d39767c7d880279dec1428b56 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: gp_Cone
VMin: double
VMax: double
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B, the patch of the cone S limited - in the v parametric direction, by the two parameter values VMin and VMax - and optionally in the u parametric direction, by the two parameter values UMin and UMax, B is then enlarged by the tolerance value Tol. VMin and VMax may represent infinite values. Exceptions Standard_Failure if VMin and VMax are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const gp_Cone & S, const double VMin, const double VMax, const double Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: d4bc8994a3eacadd97deb134c8e7c4cc ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Sphere & S, const double Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 92828026de5e96a9bda9788befb3979d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
UMin: double
UMax: double
VMin: double
VMax: double
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B the sphere S, or - the patch of the sphere S, limited in the u parametric direction, by the two parameter values UMin and UMax, and in the v parametric direction, by the two parameter values VMin and VMax. B is then enlarged by the tolerance value Tol. UMax-UMin can be in [0,2*pi] VMin,VMax can be [-pi/2,pi/2].
") Add;
		static void Add(const gp_Sphere & S, const double UMin, const double UMax, const double VMin, const double VMax, const double Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: 21aaddc1c063fa9a48af2df57951cdad ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
P: gp_Torus
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(const gp_Torus & P, const double Tol, Bnd_Box & B);

		/****** BndLib::Add ******/
		/****** md5 signature: b0c2f7a0a4a4060724722023c8d950c1 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
P: gp_Torus
UMin: double
UMax: double
VMin: double
VMax: double
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B - the torus S, or - the patch of the torus S, limited in the u parametric direction, by the two parameter values UMin and UMax, and in the v parametric direction, by the two parameter values VMin and VMax. B is then enlarged by the tolerance value Tol. UMax-UMin can be in [0,2*pi], VMin,VMax can be [-pi/2,pi/2].
") Add;
		static void Add(const gp_Torus & P, const double UMin, const double UMax, const double VMin, const double VMax, const double Tol, Bnd_Box & B);

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
		/****** md5 signature: cc20ab82d02a5f68785f5615df818ea3 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Tol: double
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds to the bounding box B the curve C B is then enlarged by the tolerance value Tol. Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, - if not, the points of an approximation of the curve C. Warning C is an adapted curve, that is, an object which is an interface between: - the services provided by a 2D curve from the package Geom2d - and those required of the curve by the computation algorithm. The adapted curve is created in the following way: opencascade::handle<Geom2d_Curve> mycurve = ... ; Geom2dAdaptor_Curve C(mycurve); The bounding box B is then enlarged by adding it: Bnd_Box2d B; // ... double Tol = ... ; Add2dCurve::Add ( C, Tol, B ); Exceptions Standard_Failure if the curve is built from: - a Geom_Line, or - a Geom_Parabola, or - a Geom_Hyperbola, and P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const Adaptor2d_Curve2d & C, const double Tol, Bnd_Box2d & B);

		/****** BndLib_Add2dCurve::Add ******/
		/****** md5 signature: 2f26a1257e09898e6df03512ab4f89e5 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U1: double
U2: double
Tol: double
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds to the bounding box Bthe arc of the curve C limited by the two parameter values P1 and P2. B is then enlarged by the tolerance value Tol. Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, - if not, the points of an approximation of the curve C. Warning C is an adapted curve, that is, an object which is an interface between: - the services provided by a 2D curve from the package Geom2d - and those required of the curve by the computation algorithm. The adapted curve is created in the following way: opencascade::handle<Geom2d_Curve> mycurve = ... ; Geom2dAdaptor_Curve C(mycurve); The bounding box B is then enlarged by adding it: Bnd_Box2d B; // ... double Tol = ... ; Add2dCurve::Add ( C, Tol, B ); Exceptions Standard_Failure if the curve is built from: - a Geom_Line, or - a Geom_Parabola, or - a Geom_Hyperbola, and P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const Adaptor2d_Curve2d & C, const double U1, const double U2, const double Tol, Bnd_Box2d & B);

		/****** BndLib_Add2dCurve::Add ******/
		/****** md5 signature: dde0606b1a42a8488f44f0334e84cecb ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
Tol: double
Box: Bnd_Box2d

Return
-------
None

Description
-----------
Adds to the bounding box B the curve C B is then enlarged by the tolerance value Tol. Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, - if not, the points of an approximation of the curve C.
") Add;
		static void Add(const opencascade::handle<Geom2d_Curve> & C, const double Tol, Bnd_Box2d & Box);

		/****** BndLib_Add2dCurve::Add ******/
		/****** md5 signature: 012ea3d233ed824b5ffaaa74f899f014 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
U1: double
U2: double
Tol: double
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds to the bounding box B the part of curve C B is then enlarged by the tolerance value Tol. U1, U2 - the parametric range to compute the bounding box; Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, - if not, the points of an approximation of the curve C.
") Add;
		static void Add(const opencascade::handle<Geom2d_Curve> & C, const double U1, const double U2, const double Tol, Bnd_Box2d & B);

		/****** BndLib_Add2dCurve::AddOptimal ******/
		/****** md5 signature: 6e98f0ee90711c0c96e51808e3f636a5 ******/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
U1: double
U2: double
Tol: double
B: Bnd_Box2d

Return
-------
None

Description
-----------
Adds to the bounding box B the part of curve C B is then enlarged by the tolerance value Tol. U1, U2 - the parametric range to compute the bounding box; Note: depending on the type of curve, one of the following algorithms is used to include it in the bounding box B: - an exact analytical if C is built from a line, a circle or a conic curve, - numerical calculation of bounding box sizes, based on minimization algorithm, for other types of curve If Tol = < Precision::PConfusion(), Precision::PConfusion is used as tolerance for calculation.
") AddOptimal;
		static void AddOptimal(const opencascade::handle<Geom2d_Curve> & C, const double U1, const double U2, const double Tol, Bnd_Box2d & B);

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
		/****** md5 signature: 6622cba588e3aaceaaa086e1ccc44a25 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B the curve C B is then enlarged by the tolerance value Tol. Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, if not, the points of an approximation of the curve C. Warning C is an adapted curve, that is, an object which is an interface between: - the services provided by a 3D curve from the package Geom - and those required of the curve by the computation algorithm. The adapted curve is created in the following way: opencascade::handle<Geom_Curve> mycurve = ... ; GeomAdaptor_Curve C(mycurve); The bounding box B is then enlarged by adding it: Bnd_Box B; // ... double Tol = ... ; Add3dCurve::Add ( C, Tol, B ); Exceptions Standard_Failure if the curve is built from: - a Geom_Line, or - a Geom_Parabola, or - a Geom_Hyperbola, and P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const Adaptor3d_Curve & C, const double Tol, Bnd_Box & B);

		/****** BndLib_Add3dCurve::Add ******/
		/****** md5 signature: cdcb8587920d3aea73bb133289647909 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U1: double
U2: double
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B the curve C the arc of the curve C limited by the two parameter values P1 and P2. Note: depending on the type of curve, one of the following representations of the curve C is used to include it in the bounding box B: - an exact representation if C is built from a line, a circle or a conic curve, - the poles of the curve if C is built from a Bezier curve or a BSpline curve, if not, the points of an approximation of the curve C. Warning C is an adapted curve, that is, an object which is an interface between: - the services provided by a 3D curve from the package Geom - and those required of the curve by the computation algorithm. The adapted curve is created in the following way: opencascade::handle<Geom_Curve> mycurve = ... ; GeomAdaptor_Curve C(mycurve); The bounding box B is then enlarged by adding it: Bnd_Box B; // ... double Tol = ... ; Add3dCurve::Add ( C, Tol, B ); Exceptions Standard_Failure if the curve is built from: - a Geom_Line, or - a Geom_Parabola, or - a Geom_Hyperbola, and P1 and P2 are either two negative infinite real numbers, or two positive infinite real numbers.
") Add;
		static void Add(const Adaptor3d_Curve & C, const double U1, const double U2, const double Tol, Bnd_Box & B);

		/****** BndLib_Add3dCurve::AddOptimal ******/
		/****** md5 signature: d3f0ec279cda0fd12262644ebf7d0f62 ******/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B the curve C These methods use more precise algorithms for building bnd box then methods Add(...).
") AddOptimal;
		static void AddOptimal(const Adaptor3d_Curve & C, const double Tol, Bnd_Box & B);

		/****** BndLib_Add3dCurve::AddOptimal ******/
		/****** md5 signature: 04a240174649addfed38227052b57294 ******/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U1: double
U2: double
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") AddOptimal;
		static void AddOptimal(const Adaptor3d_Curve & C, const double U1, const double U2, const double Tol, Bnd_Box & B);

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
		/****** md5 signature: c6a46a6919b26503d14c772b03d8ac0a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B the surface S B is then enlarged by the tolerance value Tol. Note: depending on the type of curve, one of the following representations of the surface S is used to include it in the bounding box B: - an exact representation if S is built from a plane, a cylinder, a cone, a sphere or a torus, - the poles of the surface if S is built from a Bezier surface or a BSpline surface, - the points of an approximation of the surface S in cases other than offset surfaces; - in the case of an offset surface, the basis surface is first included according to the previous rules; then the bounding box is enlarged by the offset value. Warning Do not use these functions to add a non-finite surface to the bounding box B. If UMin, UMax, VMin or VMax is an infinite value B will become WholeSpace. S is an adapted surface, that is, an object which is an interface between: - the services provided by a surface from the package Geom - and those required of the surface by the computation algorithm. The adapted surface is created in the following way: opencascade::handle<Geom_Surface> mysurface = ... ; GeomAdaptor_Surface S(mysurface); The bounding box B is then enlarged by adding this surface: Bnd_Box B; // ... double Tol = ... ; AddSurface::Add ( S, Tol, B );.
") Add;
		static void Add(const Adaptor3d_Surface & S, const double Tol, Bnd_Box & B);

		/****** BndLib_AddSurface::Add ******/
		/****** md5 signature: a270bc6a1943bfe54446b327d040087f ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
UMin: double
UMax: double
VMin: double
VMax: double
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
Adds to the bounding box B the surface S the patch of the surface S limited in the u parametric direction by the two parameter values UMin, UMax, and in the v parametric direction by the two parameter values VMin, VMax. Note: depending on the type of curve, one of the following representations of the surface S is used to include it in the bounding box B: - an exact representation if S is built from a plane, a cylinder, a cone, a sphere or a torus, - the poles of the surface if S is built from a Bezier surface or a BSpline surface, - the points of an approximation of the surface S in cases other than offset surfaces; - in the case of an offset surface, the basis surface is first included according to the previous rules; then the bounding box is enlarged by the offset value. Warning Do not use these functions to add a non-finite surface to the bounding box B. If UMin, UMax, VMin or VMax is an infinite value B will become WholeSpace. S is an adapted surface, that is, an object which is an interface between: - the services provided by a surface from the package Geom - and those required of the surface by the computation algorithm. The adapted surface is created in the following way: opencascade::handle<Geom_Surface> mysurface = ... ; GeomAdaptor_Surface S(mysurface); The bounding box B is then enlarged by adding this surface: Bnd_Box B; // ... double Tol = ... ; AddSurface::Add ( S, Tol, B );.
") Add;
		static void Add(const Adaptor3d_Surface & S, const double UMin, const double UMax, const double VMin, const double VMax, const double Tol, Bnd_Box & B);

		/****** BndLib_AddSurface::AddOptimal ******/
		/****** md5 signature: 9ec494e7f4737cd3e87d89bd6395a92f ******/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") AddOptimal;
		static void AddOptimal(const Adaptor3d_Surface & S, const double Tol, Bnd_Box & B);

		/****** BndLib_AddSurface::AddOptimal ******/
		/****** md5 signature: 27ae7c8573697bd0524640eb5c1fff8a ******/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
UMin: double
UMax: double
VMin: double
VMax: double
Tol: double
B: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") AddOptimal;
		static void AddOptimal(const Adaptor3d_Surface & S, const double UMin, const double UMax, const double VMin, const double VMax, const double Tol, Bnd_Box & B);

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
def BndLib_AddSurface_AddOptimal(*args):
	return BndLib_AddSurface.AddOptimal(*args)

@deprecated
def BndLib_AddSurface_AddOptimal(*args):
	return BndLib_AddSurface.AddOptimal(*args)

}
