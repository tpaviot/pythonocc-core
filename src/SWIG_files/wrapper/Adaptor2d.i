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
%define ADAPTOR2DDOCSTRING
"Adaptor2d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_adaptor2d.html"
%enddef
%module (package="OCC.Core", docstring=ADAPTOR2DDOCSTRING) Adaptor2d


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
#include<Adaptor2d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom2d.i
%import gp.i
%import GeomAbs.i
%import TColStd.i

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
%wrap_handle(Adaptor2d_HCurve2d)
%wrap_handle(Adaptor2d_HLine2d)
%wrap_handle(Adaptor2d_HOffsetCurve)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************************
* class Adaptor2d_Curve2d *
**************************/
class Adaptor2d_Curve2d {
	public:
		/****************** BSpline ******************/
		/**** md5 signature: b2a7a571ebf1b38738b883a277ef794f ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		virtual opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		/**** md5 signature: f8f04b3add4103e9f0350b8ed2285dc4 ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		virtual opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****************** Circle ******************/
		/**** md5 signature: 624ff1e0c75139ee893a5066be1b5a0c ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ2d
") Circle;
		virtual gp_Circ2d Circle();

		/****************** Continuity ******************/
		/**** md5 signature: 8564d2514f3a14a163da9fa2b30a9284 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****************** D0 ******************/
		/**** md5 signature: 032807b33fd2114f83050446452a9d16 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 62f67df0ec10ce52e6bbc3e7f976f93f ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
U: float
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		virtual void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		/**** md5 signature: 7ba7fbaac090150f487dc89b64867507 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		virtual void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: ad3456ec57f07904ba35638d0146d01f ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		virtual void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: f633d1449599e5f52db1c34ec4b27035 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		virtual gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: d442d1b77ae7b1ce10d9531914b14be7 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Degree;
		virtual Standard_Integer Degree();

		/****************** Ellipse ******************/
		/**** md5 signature: ad57dba8c1c2fed98a4ee4d518e5af58 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips2d
") Ellipse;
		virtual gp_Elips2d Ellipse();

		/****************** FirstParameter ******************/
		/**** md5 signature: adaac52a0f2d3263c19caadcbea394a2 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****************** GetType ******************/
		/**** md5 signature: 657f9e3cbd23a069ca4adcba08a9b196 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Returns
-------
GeomAbs_CurveType
") GetType;
		virtual GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		/**** md5 signature: ec5c753a319a89563396073e20a5375e ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr2d
") Hyperbola;
		virtual gp_Hypr2d Hyperbola();

		/****************** Intervals ******************/
		/**** md5 signature: 1b47d9fadea42b0a52e1ad5844faff05 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: d57ef0715a5abf96ea6273eee63d5417 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		virtual Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: aac83d336e26e94b4cd1076ac72ce2c9 ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		virtual Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		/**** md5 signature: 5389f1211fc99cfdcbd6575b8eec7b5c ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** LastParameter ******************/
		/**** md5 signature: 38a37eecbdff8d3a1b5ffdd6b12bf4d9 ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		virtual Standard_Real LastParameter();

		/****************** Line ******************/
		/**** md5 signature: c030f66e64195409bcfc92be438de5d5 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin2d
") Line;
		virtual gp_Lin2d Line();

		/****************** NbIntervals ******************/
		/**** md5 signature: 0b37dc42182e542f53017d0e52c8cd03 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the curve in intervals of continuity <s>. and returns the number of intervals.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		/**** md5 signature: 22b54658d4850824758b23cad1529c2f ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbKnots;
		virtual Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		/**** md5 signature: 1b49ced11f88c6092f4e3b2473fe0460 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoles;
		virtual Standard_Integer NbPoles();

		/****************** NbSamples ******************/
		/**** md5 signature: fa9dfaedc08a9e4459ffebec8ddb6476 ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSamples;
		virtual Standard_Integer NbSamples();

		/****************** Parabola ******************/
		/**** md5 signature: 2bbe5ac6a61b052fd2bae484e8f0313c ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab2d
") Parabola;
		virtual gp_Parab2d Parabola();

		/****************** Period ******************/
		/**** md5 signature: e4913c399f3a0a7037e498c5a9da8e1f ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		virtual Standard_Real Period();

		/****************** Resolution ******************/
		/**** md5 signature: 66fa92ada4ec8706453c0525abd4ecd6 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") Resolution;
		virtual Standard_Real Resolution(const Standard_Real R3d);

		/****************** Trim ******************/
		/**** md5 signature: b00e7319c95fdc2964d9791c57ace928 ****/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a curve equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Trim;
		virtual opencascade::handle<Adaptor2d_HCurve2d> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: af409c62c74a5e93d7c7e76240b9de9b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float

Returns
-------
gp_Pnt2d
") Value;
		virtual gp_Pnt2d Value(const Standard_Real U);

};


%extend Adaptor2d_Curve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Adaptor2d_HCurve2d *
***************************/
%nodefaultctor Adaptor2d_HCurve2d;
class Adaptor2d_HCurve2d : public Standard_Transient {
	public:
		/****************** BSpline ******************/
		/**** md5 signature: b2a7a571ebf1b38738b883a277ef794f ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		virtual opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		/**** md5 signature: 41032442357596356ca52db8dddd69b1 ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****************** Circle ******************/
		/**** md5 signature: 3db788e83f60e9102eb4d18e49dde44e ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ2d
") Circle;
		gp_Circ2d Circle();

		/****************** Continuity ******************/
		/**** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Curve2d ******************/
		/**** md5 signature: 80beb5a704afff9d2021bd4f524db9cb ****/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Returns a reference to the curve2d inside the hcurve2d.

Returns
-------
Adaptor2d_Curve2d
") Curve2d;
		virtual const Adaptor2d_Curve2d & Curve2d();

		/****************** D0 ******************/
		/**** md5 signature: 85d1e98e1313be6e4d71518a7016009f ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 857bb09c503ab50c52904dfc4cdc1a50 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		/**** md5 signature: 8574226eb2474fe793edb28b9a188341 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 30bd0f2c5f6642dfece94c3612cd0e2f ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: 0932075ca22fa86aeae3a5a4650fb0ff ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: e3276df1ce733e2c8e940db548a26d03 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** Ellipse ******************/
		/**** md5 signature: 4d2fb3c954fc20d00e7fb670cc75b8c5 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips2d
") Ellipse;
		gp_Elips2d Ellipse();

		/****************** FirstParameter ******************/
		/**** md5 signature: 4ccedbaad83be904f510b4760c75f69c ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetType ******************/
		/**** md5 signature: 6d4e6ae7972633971ba343e8afc91aa1 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		/**** md5 signature: 0bf75fd35e804f23a63a4cf957882adb ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr2d
") Hyperbola;
		gp_Hypr2d Hyperbola();

		/****************** Intervals ******************/
		/**** md5 signature: c7a2f17df7514293a67a56baae0afb68 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: 29709d02fadc9fcb79a766bc9679271b ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		/**** md5 signature: fd4212ffa7bc30cde420e74a2c539434 ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** LastParameter ******************/
		/**** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Line ******************/
		/**** md5 signature: 8f714dea9190d608a011f61fa588b4f4 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin2d
") Line;
		gp_Lin2d Line();

		/****************** NbIntervals ******************/
		/**** md5 signature: a9cec7e4e6cb5b355a27e6de1f3fc9d9 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		/**** md5 signature: ccda669299f8eba1ba0d3387af4c950e ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		/**** md5 signature: 9a7d6d5f8a21c5833786e951bce99604 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** Parabola ******************/
		/**** md5 signature: b95e4eaba6ed0e103a45829a8ad74d91 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab2d
") Parabola;
		gp_Parab2d Parabola();

		/****************** Period ******************/
		/**** md5 signature: 0270204961d3b0052ffe029cbcdbacd9 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** Resolution ******************/
		/**** md5 signature: 955dbc498c06516d62e17e1e8d38cba7 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
R3d: float

Returns
-------
float
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****************** Trim ******************/
		/**** md5 signature: bffd31b1526dffa3669fe68d7477ad60 ****/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "If <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Trim;
		opencascade::handle<Adaptor2d_HCurve2d> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: 1105e8ccba0b18e6fe7169aa8e376b83 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float

Returns
-------
gp_Pnt2d
") Value;
		gp_Pnt2d Value(const Standard_Real U);

};


%make_alias(Adaptor2d_HCurve2d)

%extend Adaptor2d_HCurve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Adaptor2d_HLine2d *
**************************/
class Adaptor2d_HLine2d : public Adaptor2d_HCurve2d {
	public:
		/****************** Adaptor2d_HLine2d ******************/
		/**** md5 signature: bb5e89d0552ec46ae15a9c98c3e2dca2 ****/
		%feature("compactdefaultargs") Adaptor2d_HLine2d;
		%feature("autodoc", "Creates an empty genhcurve2d.

Returns
-------
None
") Adaptor2d_HLine2d;
		 Adaptor2d_HLine2d();

		/****************** Adaptor2d_HLine2d ******************/
		/**** md5 signature: 046602de20e8904427b18584962efeb5 ****/
		%feature("compactdefaultargs") Adaptor2d_HLine2d;
		%feature("autodoc", "Creates a genhcurve2d from a curve.

Parameters
----------
C: Adaptor2d_Line2d

Returns
-------
None
") Adaptor2d_HLine2d;
		 Adaptor2d_HLine2d(const Adaptor2d_Line2d & C);

		/****************** ChangeCurve2d ******************/
		/**** md5 signature: 73f0e1ef4f5c40bc001736631c9a4752 ****/
		%feature("compactdefaultargs") ChangeCurve2d;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
Adaptor2d_Line2d
") ChangeCurve2d;
		Adaptor2d_Line2d & ChangeCurve2d();

		/****************** Curve2d ******************/
		/**** md5 signature: 87546edb35f2000a54f99255bb8c94db ****/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Returns the curve used to create the genhcurve2d. this is redefined from hcurve2d, cannot be inline.

Returns
-------
Adaptor2d_Curve2d
") Curve2d;
		const Adaptor2d_Curve2d & Curve2d();

		/****************** Set ******************/
		/**** md5 signature: 83a2d11d0840652cd510c132d33f7cef ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the field of the genhcurve2d.

Parameters
----------
C: Adaptor2d_Line2d

Returns
-------
None
") Set;
		void Set(const Adaptor2d_Line2d & C);

};


%make_alias(Adaptor2d_HLine2d)

%extend Adaptor2d_HLine2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Adaptor2d_HOffsetCurve *
*******************************/
class Adaptor2d_HOffsetCurve : public Adaptor2d_HCurve2d {
	public:
		/****************** Adaptor2d_HOffsetCurve ******************/
		/**** md5 signature: 25491c0f4f175db6f52163695140eee9 ****/
		%feature("compactdefaultargs") Adaptor2d_HOffsetCurve;
		%feature("autodoc", "Creates an empty genhcurve2d.

Returns
-------
None
") Adaptor2d_HOffsetCurve;
		 Adaptor2d_HOffsetCurve();

		/****************** Adaptor2d_HOffsetCurve ******************/
		/**** md5 signature: d050b963ffed31a899bd970e3b8d00a6 ****/
		%feature("compactdefaultargs") Adaptor2d_HOffsetCurve;
		%feature("autodoc", "Creates a genhcurve2d from a curve.

Parameters
----------
C: Adaptor2d_OffsetCurve

Returns
-------
None
") Adaptor2d_HOffsetCurve;
		 Adaptor2d_HOffsetCurve(const Adaptor2d_OffsetCurve & C);

		/****************** ChangeCurve2d ******************/
		/**** md5 signature: 9d8ed054df51d67ca2a36626dc87b6da ****/
		%feature("compactdefaultargs") ChangeCurve2d;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
Adaptor2d_OffsetCurve
") ChangeCurve2d;
		Adaptor2d_OffsetCurve & ChangeCurve2d();

		/****************** Curve2d ******************/
		/**** md5 signature: 87546edb35f2000a54f99255bb8c94db ****/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Returns the curve used to create the genhcurve2d. this is redefined from hcurve2d, cannot be inline.

Returns
-------
Adaptor2d_Curve2d
") Curve2d;
		const Adaptor2d_Curve2d & Curve2d();

		/****************** Set ******************/
		/**** md5 signature: f4a03234be9ba1c2342db8164bd1c6ee ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the field of the genhcurve2d.

Parameters
----------
C: Adaptor2d_OffsetCurve

Returns
-------
None
") Set;
		void Set(const Adaptor2d_OffsetCurve & C);

};


%make_alias(Adaptor2d_HOffsetCurve)

%extend Adaptor2d_HOffsetCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Adaptor2d_Line2d *
*************************/
class Adaptor2d_Line2d : public Adaptor2d_Curve2d {
	public:
		/****************** Adaptor2d_Line2d ******************/
		/**** md5 signature: a217d4c2f1a39c468576f503c72e4282 ****/
		%feature("compactdefaultargs") Adaptor2d_Line2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Adaptor2d_Line2d;
		 Adaptor2d_Line2d();

		/****************** Adaptor2d_Line2d ******************/
		/**** md5 signature: b3b555011ccd08a69e1a951ee36e4ce2 ****/
		%feature("compactdefaultargs") Adaptor2d_Line2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
D: gp_Dir2d
UFirst: float
ULast: float

Returns
-------
None
") Adaptor2d_Line2d;
		 Adaptor2d_Line2d(const gp_Pnt2d & P, const gp_Dir2d & D, const Standard_Real UFirst, const Standard_Real ULast);

		/****************** BSpline ******************/
		/**** md5 signature: 9439c331c4f14f299277aa5a4ff16cec ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		/**** md5 signature: cabcbe9e94c679dcfc142972b20ab60b ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****************** Circle ******************/
		/**** md5 signature: 031880777795958cc554fa5739cb3a95 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ2d
") Circle;
		gp_Circ2d Circle();

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** D0 ******************/
		/**** md5 signature: 93720dcd9f9e8e8980602530da337c79 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real X, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 423f97f4cd493b4f6cf5b9cd8bc9c101 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real X, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		/**** md5 signature: fe409137f7ff4361ef92efcdab935654 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real X, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 802e53b731cc18884f89925d02e1d5fb ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real X, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: 5ce473e72cc7bb935a667f4c839dab09 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** Ellipse ******************/
		/**** md5 signature: 57e9088d9546fb79032102b676477b62 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips2d
") Ellipse;
		gp_Elips2d Ellipse();

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetType ******************/
		/**** md5 signature: 0ad61dcbb5497908c1b536e766f0fcb9 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		/**** md5 signature: 951e1971b5974627f011740e5c4c9ecb ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr2d
") Hyperbola;
		gp_Hypr2d Hyperbola();

		/****************** Intervals ******************/
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Line ******************/
		/**** md5 signature: d41344e9c3febf8a7347a9e78e837373 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin2d
") Line;
		gp_Lin2d Line();

		/****************** Load ******************/
		/**** md5 signature: 7620a23c09d16846209666736fe05b85 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin2d

Returns
-------
None
") Load;
		void Load(const gp_Lin2d & L);

		/****************** Load ******************/
		/**** md5 signature: 3737a9da343db0c1813b6fdf3bdda8e1 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin2d
UFirst: float
ULast: float

Returns
-------
None
") Load;
		void Load(const gp_Lin2d & L, const Standard_Real UFirst, const Standard_Real ULast);

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the curve in intervals of continuity <s>. and returns the number of intervals.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		/**** md5 signature: 841663cbf96bec3b939f307c52df6c7c ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		/**** md5 signature: 52e5fadf897540545847ef59cc0ba942 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** Parabola ******************/
		/**** md5 signature: 38729705f952495154cecf7cf9964648 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab2d
") Parabola;
		gp_Parab2d Parabola();

		/****************** Period ******************/
		/**** md5 signature: 88909a321398632744c0d6841580c626 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** Resolution ******************/
		/**** md5 signature: cc4a4d9111fadd20ad48e62bc4df1579 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
R3d: float

Returns
-------
float
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****************** Trim ******************/
		/**** md5 signature: e1eef64565323d75c47ee19ca861de8d ****/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a curve equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Trim;
		opencascade::handle<Adaptor2d_HCurve2d> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: 98884cb0e60eec266d8c9645d817f1b5 ****/
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


%extend Adaptor2d_Line2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Adaptor2d_OffsetCurve *
******************************/
class Adaptor2d_OffsetCurve : public Adaptor2d_Curve2d {
	public:
		/****************** Adaptor2d_OffsetCurve ******************/
		/**** md5 signature: 451c0a1cc0af1792697a4f563e2766d2 ****/
		%feature("compactdefaultargs") Adaptor2d_OffsetCurve;
		%feature("autodoc", "The offset is set to 0.

Returns
-------
None
") Adaptor2d_OffsetCurve;
		 Adaptor2d_OffsetCurve();

		/****************** Adaptor2d_OffsetCurve ******************/
		/**** md5 signature: 2092489fd56ad30e5d0310fbc081109f ****/
		%feature("compactdefaultargs") Adaptor2d_OffsetCurve;
		%feature("autodoc", "The curve is loaded. the offset is set to 0.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
None
") Adaptor2d_OffsetCurve;
		 Adaptor2d_OffsetCurve(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Adaptor2d_OffsetCurve ******************/
		/**** md5 signature: da34b132e75ca6b9fc87b2085685e26a ****/
		%feature("compactdefaultargs") Adaptor2d_OffsetCurve;
		%feature("autodoc", "Creates an offsetcurve curve. the offset is set to offset.

Parameters
----------
C: Adaptor2d_HCurve2d
Offset: float

Returns
-------
None
") Adaptor2d_OffsetCurve;
		 Adaptor2d_OffsetCurve(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real Offset);

		/****************** Adaptor2d_OffsetCurve ******************/
		/**** md5 signature: 292811072e2428d6f8a963b44c425f71 ****/
		%feature("compactdefaultargs") Adaptor2d_OffsetCurve;
		%feature("autodoc", "Create an offset curve. wfirst,wlast define the bounds of the offset curve.

Parameters
----------
C: Adaptor2d_HCurve2d
Offset: float
WFirst: float
WLast: float

Returns
-------
None
") Adaptor2d_OffsetCurve;
		 Adaptor2d_OffsetCurve(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real Offset, const Standard_Real WFirst, const Standard_Real WLast);

		/****************** BSpline ******************/
		/**** md5 signature: 9439c331c4f14f299277aa5a4ff16cec ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		/**** md5 signature: cabcbe9e94c679dcfc142972b20ab60b ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****************** Circle ******************/
		/**** md5 signature: 031880777795958cc554fa5739cb3a95 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ2d
") Circle;
		gp_Circ2d Circle();

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Curve ******************/
		/**** md5 signature: f5519de5cf0d739f28ebd5b0ec724522 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Curve;
		const opencascade::handle<Adaptor2d_HCurve2d> & Curve();

		/****************** D0 ******************/
		/**** md5 signature: 01a5234aae6db090351bac35b3718fd9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 79a293d0b91ab6d1359881075119fb56 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
U: float
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		/**** md5 signature: acc8c0955596bb0bf809102736ad1124 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 28315b7efe2f6c64fe9497aa5c5ddaf6 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: a05d2f76912764cef5ac7bb40ebda3d7 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: 5ce473e72cc7bb935a667f4c839dab09 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** Ellipse ******************/
		/**** md5 signature: 57e9088d9546fb79032102b676477b62 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips2d
") Ellipse;
		gp_Elips2d Ellipse();

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetType ******************/
		/**** md5 signature: 0ad61dcbb5497908c1b536e766f0fcb9 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		/**** md5 signature: 951e1971b5974627f011740e5c4c9ecb ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr2d
") Hyperbola;
		gp_Hypr2d Hyperbola();

		/****************** Intervals ******************/
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Line ******************/
		/**** md5 signature: d41344e9c3febf8a7347a9e78e837373 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin2d
") Line;
		gp_Lin2d Line();

		/****************** Load ******************/
		/**** md5 signature: 4da8ce5b01ac5268a3dc1c0fb87edcf6 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Changes the curve. the offset is reset to 0.

Parameters
----------
S: Adaptor2d_HCurve2d

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Adaptor2d_HCurve2d> & S);

		/****************** Load ******************/
		/**** md5 signature: 9a0b0df619b9827b4c54ec1608be65ca ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Changes the offset on the current curve.

Parameters
----------
Offset: float

Returns
-------
None
") Load;
		void Load(const Standard_Real Offset);

		/****************** Load ******************/
		/**** md5 signature: 3322ee7ce92e3dcbd7a1a9bc1c56530c ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Changes the offset curve on the current curve.

Parameters
----------
Offset: float
WFirst: float
WLast: float

Returns
-------
None
") Load;
		void Load(const Standard_Real Offset, const Standard_Real WFirst, const Standard_Real WLast);

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the curve in intervals of continuity <s>. and returns the number of intervals.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		/**** md5 signature: 841663cbf96bec3b939f307c52df6c7c ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		/**** md5 signature: 52e5fadf897540545847ef59cc0ba942 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** NbSamples ******************/
		/**** md5 signature: 4121a3c2901a01f0443f1a396ebcd6f7 ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSamples;
		Standard_Integer NbSamples();

		/****************** Offset ******************/
		/**** md5 signature: 02d05c913be85cd7a6e18ff06a18b8e7 ****/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Offset;
		Standard_Real Offset();

		/****************** Parabola ******************/
		/**** md5 signature: 38729705f952495154cecf7cf9964648 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab2d
") Parabola;
		gp_Parab2d Parabola();

		/****************** Period ******************/
		/**** md5 signature: 88909a321398632744c0d6841580c626 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** Resolution ******************/
		/**** md5 signature: cc4a4d9111fadd20ad48e62bc4df1579 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****************** Trim ******************/
		/**** md5 signature: e1eef64565323d75c47ee19ca861de8d ****/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a curve equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Trim;
		opencascade::handle<Adaptor2d_HCurve2d> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: 91dcf5c5229f25c64d3a714347090b29 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float

Returns
-------
gp_Pnt2d
") Value;
		gp_Pnt2d Value(const Standard_Real U);

};


%extend Adaptor2d_OffsetCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
