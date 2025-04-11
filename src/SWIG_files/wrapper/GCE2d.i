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
%define GCE2DDOCSTRING
"GCE2d module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_gce2d.html"
%enddef
%module (package="OCC.Core", docstring=GCE2DDOCSTRING) GCE2d


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
#include<GCE2d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<Geom2d_module.hxx>
#include<gce_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import Geom2d.i
%import gce.i

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

/*************************
* class GCE2d_MakeMirror *
*************************/
class GCE2d_MakeMirror {
	public:
		/****** GCE2d_MakeMirror::GCE2d_MakeMirror ******/
		/****** md5 signature: 52fadd1c08f1b3a8afdfd9d3da7a50d4 ******/
		%feature("compactdefaultargs") GCE2d_MakeMirror;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") GCE2d_MakeMirror;
		 GCE2d_MakeMirror(const gp_Pnt2d & Point);

		/****** GCE2d_MakeMirror::GCE2d_MakeMirror ******/
		/****** md5 signature: e9ef0142106d043115f54598496011bd ******/
		%feature("compactdefaultargs") GCE2d_MakeMirror;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") GCE2d_MakeMirror;
		 GCE2d_MakeMirror(const gp_Ax2d & Axis);

		/****** GCE2d_MakeMirror::GCE2d_MakeMirror ******/
		/****** md5 signature: eb0dbda288094c087c8c47c9f30dd907 ******/
		%feature("compactdefaultargs") GCE2d_MakeMirror;
		%feature("autodoc", "
Parameters
----------
Line: gp_Lin2d

Return
-------
None

Description
-----------
No available documentation.
") GCE2d_MakeMirror;
		 GCE2d_MakeMirror(const gp_Lin2d & Line);

		/****** GCE2d_MakeMirror::GCE2d_MakeMirror ******/
		/****** md5 signature: 85ef46a2c1cffef606a4e9650e4feea1 ******/
		%feature("compactdefaultargs") GCE2d_MakeMirror;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt2d
Direc: gp_Dir2d

Return
-------
None

Description
-----------
Make a symmetry transformation af axis defined by <Point> and <Direc>.
") GCE2d_MakeMirror;
		 GCE2d_MakeMirror(const gp_Pnt2d & Point, const gp_Dir2d & Direc);

		/****** GCE2d_MakeMirror::Value ******/
		/****** md5 signature: ee1994e59e5f8ef53f4ff7a6a35b819c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Transformation>

Description
-----------
Returns the constructed transformation.
") Value;
		const opencascade::handle<Geom2d_Transformation> & Value();

};


%extend GCE2d_MakeMirror {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GCE2d_MakeRotation *
***************************/
class GCE2d_MakeRotation {
	public:
		/****** GCE2d_MakeRotation::GCE2d_MakeRotation ******/
		/****** md5 signature: db316a87d61d2942ab2d573df1335097 ******/
		%feature("compactdefaultargs") GCE2d_MakeRotation;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt2d
Angle: float

Return
-------
None

Description
-----------
Constructs a rotation through angle Angle about the center Point.
") GCE2d_MakeRotation;
		 GCE2d_MakeRotation(const gp_Pnt2d & Point, const Standard_Real Angle);

		/****** GCE2d_MakeRotation::Value ******/
		/****** md5 signature: ee1994e59e5f8ef53f4ff7a6a35b819c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Transformation>

Description
-----------
Returns the constructed transformation.
") Value;
		const opencascade::handle<Geom2d_Transformation> & Value();

};


%extend GCE2d_MakeRotation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class GCE2d_MakeScale *
************************/
class GCE2d_MakeScale {
	public:
		/****** GCE2d_MakeScale::GCE2d_MakeScale ******/
		/****** md5 signature: cc5be58ca97302ecc5564b14862c4bb6 ******/
		%feature("compactdefaultargs") GCE2d_MakeScale;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt2d
Scale: float

Return
-------
None

Description
-----------
Constructs a scaling transformation with - Point as the center of the transformation, and - Scale as the scale factor.
") GCE2d_MakeScale;
		 GCE2d_MakeScale(const gp_Pnt2d & Point, const Standard_Real Scale);

		/****** GCE2d_MakeScale::Value ******/
		/****** md5 signature: ee1994e59e5f8ef53f4ff7a6a35b819c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Transformation>

Description
-----------
Returns the constructed transformation.
") Value;
		const opencascade::handle<Geom2d_Transformation> & Value();

};


%extend GCE2d_MakeScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GCE2d_MakeTranslation *
******************************/
class GCE2d_MakeTranslation {
	public:
		/****** GCE2d_MakeTranslation::GCE2d_MakeTranslation ******/
		/****** md5 signature: 30fffbb54ac2ac4b8621d9cfdd4dd1a2 ******/
		%feature("compactdefaultargs") GCE2d_MakeTranslation;
		%feature("autodoc", "
Parameters
----------
Vect: gp_Vec2d

Return
-------
None

Description
-----------
Constructs a translation along the vector Vect.
") GCE2d_MakeTranslation;
		 GCE2d_MakeTranslation(const gp_Vec2d & Vect);

		/****** GCE2d_MakeTranslation::GCE2d_MakeTranslation ******/
		/****** md5 signature: 989eae0c13fc86cc0181d85bd7d44908 ******/
		%feature("compactdefaultargs") GCE2d_MakeTranslation;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d

Return
-------
None

Description
-----------
Constructs a translation along the vector (Point1,Point2) defined from the point Point1 to the point Point2.
") GCE2d_MakeTranslation;
		 GCE2d_MakeTranslation(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2);

		/****** GCE2d_MakeTranslation::Value ******/
		/****** md5 signature: ee1994e59e5f8ef53f4ff7a6a35b819c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Transformation>

Description
-----------
Returns the constructed transformation.
") Value;
		const opencascade::handle<Geom2d_Transformation> & Value();

};


%extend GCE2d_MakeTranslation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class GCE2d_Root *
*******************/
class GCE2d_Root {
	public:
		/****** GCE2d_Root::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the construction is successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** GCE2d_Root::Status ******/
		/****** md5 signature: 40beeec4d25ee1f3f94752c410640458 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
gce_ErrorType

Description
-----------
Returns the status of the construction - gce_Done, if the construction is successful, or - another value of the gce_ErrorType enumeration indicating why the construction failed.
") Status;
		gce_ErrorType Status();

};


%extend GCE2d_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GCE2d_MakeArcOfCircle *
******************************/
class GCE2d_MakeArcOfCircle : public GCE2d_Root {
	public:
		/****** GCE2d_MakeArcOfCircle::GCE2d_MakeArcOfCircle ******/
		/****** md5 signature: 726efb612eb6e4c4240c76ccf27a67c2 ******/
		%feature("compactdefaultargs") GCE2d_MakeArcOfCircle;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ2d
Alpha1: float
Alpha2: float
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Makes an arc of circle (TrimmedCurve from Geom2d) from a circle between two parameters Alpha1 and Alpha2. The two parameters are angles. The parameters are in radians.
") GCE2d_MakeArcOfCircle;
		 GCE2d_MakeArcOfCircle(const gp_Circ2d & Circ, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeArcOfCircle::GCE2d_MakeArcOfCircle ******/
		/****** md5 signature: 450387aeb8e13ed7bc2fb8e8459acbd4 ******/
		%feature("compactdefaultargs") GCE2d_MakeArcOfCircle;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ2d
P: gp_Pnt2d
Alpha: float
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Makes an arc of circle (TrimmedCurve from Geom2d) from a circle between point <P> and the parameter Alpha. Alpha is given in radians.
") GCE2d_MakeArcOfCircle;
		 GCE2d_MakeArcOfCircle(const gp_Circ2d & Circ, const gp_Pnt2d & P, const Standard_Real Alpha, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeArcOfCircle::GCE2d_MakeArcOfCircle ******/
		/****** md5 signature: 076a67ba124e3b4f224cdda296df55a1 ******/
		%feature("compactdefaultargs") GCE2d_MakeArcOfCircle;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ2d
P1: gp_Pnt2d
P2: gp_Pnt2d
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Makes an arc of circle (TrimmedCurve from Geom2d) from a circle between two points P1 and P2.
") GCE2d_MakeArcOfCircle;
		 GCE2d_MakeArcOfCircle(const gp_Circ2d & Circ, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeArcOfCircle::GCE2d_MakeArcOfCircle ******/
		/****** md5 signature: dc953b2e3bab6d646883169a389b60ad ******/
		%feature("compactdefaultargs") GCE2d_MakeArcOfCircle;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d
P3: gp_Pnt2d

Return
-------
None

Description
-----------
Makes an arc of circle (TrimmedCurve from Geom2d) from three points P1,P2,P3 between two points P1 and P3, and passing through the point P2.
") GCE2d_MakeArcOfCircle;
		 GCE2d_MakeArcOfCircle(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const gp_Pnt2d & P3);

		/****** GCE2d_MakeArcOfCircle::GCE2d_MakeArcOfCircle ******/
		/****** md5 signature: 6e5ff8b4a84c6717d370db593844490a ******/
		%feature("compactdefaultargs") GCE2d_MakeArcOfCircle;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
V: gp_Vec2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
Makes an arc of circle (TrimmedCurve from Geom2d) from two points P1,P2 and the tangente to the solution at the point P1.
") GCE2d_MakeArcOfCircle;
		 GCE2d_MakeArcOfCircle(const gp_Pnt2d & P1, const gp_Vec2d & V, const gp_Pnt2d & P2);

		/****** GCE2d_MakeArcOfCircle::Value ******/
		/****** md5 signature: c4acd9e5da9de118f672d33c6f39b3b0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_TrimmedCurve>

Description
-----------
Returns the constructed arc of circle. Exceptions StdFail_NotDone if no arc of circle is constructed.
") Value;
		const opencascade::handle<Geom2d_TrimmedCurve> & Value();

};


%extend GCE2d_MakeArcOfCircle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GCE2d_MakeArcOfEllipse *
*******************************/
class GCE2d_MakeArcOfEllipse : public GCE2d_Root {
	public:
		/****** GCE2d_MakeArcOfEllipse::GCE2d_MakeArcOfEllipse ******/
		/****** md5 signature: b69d085a15004fc18e5088c8d93f10a7 ******/
		%feature("compactdefaultargs") GCE2d_MakeArcOfEllipse;
		%feature("autodoc", "
Parameters
----------
Elips: gp_Elips2d
Alpha1: float
Alpha2: float
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Make an arc of Ellipse (TrimmedCurve from Geom2d) from a Ellipse between two parameters Alpha1 and Alpha2.
") GCE2d_MakeArcOfEllipse;
		 GCE2d_MakeArcOfEllipse(const gp_Elips2d & Elips, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeArcOfEllipse::GCE2d_MakeArcOfEllipse ******/
		/****** md5 signature: 10a44c513eae036100f5624237e29a2b ******/
		%feature("compactdefaultargs") GCE2d_MakeArcOfEllipse;
		%feature("autodoc", "
Parameters
----------
Elips: gp_Elips2d
P: gp_Pnt2d
Alpha: float
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Make an arc of Ellipse (TrimmedCurve from Geom2d) from a Ellipse between point <P> and the parameter Alpha.
") GCE2d_MakeArcOfEllipse;
		 GCE2d_MakeArcOfEllipse(const gp_Elips2d & Elips, const gp_Pnt2d & P, const Standard_Real Alpha, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeArcOfEllipse::GCE2d_MakeArcOfEllipse ******/
		/****** md5 signature: 48c17fe1527652370c08601f3c96c4c8 ******/
		%feature("compactdefaultargs") GCE2d_MakeArcOfEllipse;
		%feature("autodoc", "
Parameters
----------
Elips: gp_Elips2d
P1: gp_Pnt2d
P2: gp_Pnt2d
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Make an arc of Ellipse (TrimmedCurve from Geom2d) from a Ellipse between two points P1 and P2. Please, note: The orientation of the arc is: - the trigonometric sense if Sense is not defined or is true (default value), or - the opposite sense if Sense is false. - Alpha1, Alpha2 and Alpha are angle values, given in radians. - IsDone always returns true.
") GCE2d_MakeArcOfEllipse;
		 GCE2d_MakeArcOfEllipse(const gp_Elips2d & Elips, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeArcOfEllipse::Value ******/
		/****** md5 signature: c4acd9e5da9de118f672d33c6f39b3b0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_TrimmedCurve>

Description
-----------
Returns the constructed arc of ellipse.
") Value;
		const opencascade::handle<Geom2d_TrimmedCurve> & Value();

};


%extend GCE2d_MakeArcOfEllipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class GCE2d_MakeArcOfHyperbola *
*********************************/
class GCE2d_MakeArcOfHyperbola : public GCE2d_Root {
	public:
		/****** GCE2d_MakeArcOfHyperbola::GCE2d_MakeArcOfHyperbola ******/
		/****** md5 signature: 9cc56d79fad4f294a4b6d3a965c98342 ******/
		%feature("compactdefaultargs") GCE2d_MakeArcOfHyperbola;
		%feature("autodoc", "
Parameters
----------
Hypr: gp_Hypr2d
Alpha1: float
Alpha2: float
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Makes an arc of Hyperbola (TrimmedCurve from Geom2d) from a Hyperbola between two parameters Alpha1 and Alpha2.
") GCE2d_MakeArcOfHyperbola;
		 GCE2d_MakeArcOfHyperbola(const gp_Hypr2d & Hypr, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeArcOfHyperbola::GCE2d_MakeArcOfHyperbola ******/
		/****** md5 signature: 4d378c43ddbcc2aeaf77f43a22707724 ******/
		%feature("compactdefaultargs") GCE2d_MakeArcOfHyperbola;
		%feature("autodoc", "
Parameters
----------
Hypr: gp_Hypr2d
P: gp_Pnt2d
Alpha: float
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Makes an arc of Hyperbola (TrimmedCurve from Geom2d) from a Hyperbola between point <P> and the parameter Alpha.
") GCE2d_MakeArcOfHyperbola;
		 GCE2d_MakeArcOfHyperbola(const gp_Hypr2d & Hypr, const gp_Pnt2d & P, const Standard_Real Alpha, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeArcOfHyperbola::GCE2d_MakeArcOfHyperbola ******/
		/****** md5 signature: f79691c5780cbf7a7610831156c9782e ******/
		%feature("compactdefaultargs") GCE2d_MakeArcOfHyperbola;
		%feature("autodoc", "
Parameters
----------
Hypr: gp_Hypr2d
P1: gp_Pnt2d
P2: gp_Pnt2d
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Makes an arc of Hyperbola (TrimmedCurve from Geom2d) from a Hyperbola between two points P1 and P2. Note: the orientation of the arc of hyperbola is: - the trigonometric sense if Sense is not defined or is true (default value), or - the opposite sense if Sense is false. - IsDone always returns true.
") GCE2d_MakeArcOfHyperbola;
		 GCE2d_MakeArcOfHyperbola(const gp_Hypr2d & Hypr, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeArcOfHyperbola::Value ******/
		/****** md5 signature: c4acd9e5da9de118f672d33c6f39b3b0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_TrimmedCurve>

Description
-----------
Returns the constructed arc of hyperbola.
") Value;
		const opencascade::handle<Geom2d_TrimmedCurve> & Value();

};


%extend GCE2d_MakeArcOfHyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GCE2d_MakeArcOfParabola *
********************************/
class GCE2d_MakeArcOfParabola : public GCE2d_Root {
	public:
		/****** GCE2d_MakeArcOfParabola::GCE2d_MakeArcOfParabola ******/
		/****** md5 signature: abd1c614aa272627f2898ddd4205ee40 ******/
		%feature("compactdefaultargs") GCE2d_MakeArcOfParabola;
		%feature("autodoc", "
Parameters
----------
Parab: gp_Parab2d
Alpha1: float
Alpha2: float
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Make an arc of Parabola (TrimmedCurve from Geom2d) from a Parabola between two parameters Alpha1 and Alpha2.
") GCE2d_MakeArcOfParabola;
		 GCE2d_MakeArcOfParabola(const gp_Parab2d & Parab, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeArcOfParabola::GCE2d_MakeArcOfParabola ******/
		/****** md5 signature: 561e4ed9d99302f635b2da104684c83f ******/
		%feature("compactdefaultargs") GCE2d_MakeArcOfParabola;
		%feature("autodoc", "
Parameters
----------
Parab: gp_Parab2d
P: gp_Pnt2d
Alpha: float
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Make an arc of Parabola (TrimmedCurve from Geom2d) from a Parabola between point <P> and the parameter Alpha.
") GCE2d_MakeArcOfParabola;
		 GCE2d_MakeArcOfParabola(const gp_Parab2d & Parab, const gp_Pnt2d & P, const Standard_Real Alpha, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeArcOfParabola::GCE2d_MakeArcOfParabola ******/
		/****** md5 signature: 256d715707c33c7ab98bd2ac8bc8ff40 ******/
		%feature("compactdefaultargs") GCE2d_MakeArcOfParabola;
		%feature("autodoc", "
Parameters
----------
Parab: gp_Parab2d
P1: gp_Pnt2d
P2: gp_Pnt2d
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Make an arc of Parabola (TrimmedCurve from Geom2d) from a Parabola between two points P1 and P2. Please, note: the orientation of the arc of parabola is: - the trigonometric sense if Sense is not defined or is true (default value), or - the opposite sense if Sense is false. - IsDone always returns true.
") GCE2d_MakeArcOfParabola;
		 GCE2d_MakeArcOfParabola(const gp_Parab2d & Parab, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeArcOfParabola::Value ******/
		/****** md5 signature: c4acd9e5da9de118f672d33c6f39b3b0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_TrimmedCurve>

Description
-----------
Returns the constructed arc of parabola.
") Value;
		const opencascade::handle<Geom2d_TrimmedCurve> & Value();

};


%extend GCE2d_MakeArcOfParabola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GCE2d_MakeCircle *
*************************/
class GCE2d_MakeCircle : public GCE2d_Root {
	public:
		/****** GCE2d_MakeCircle::GCE2d_MakeCircle ******/
		/****** md5 signature: a5f78b534ccd39944a78cb9f6d0116d4 ******/
		%feature("compactdefaultargs") GCE2d_MakeCircle;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d

Return
-------
None

Description
-----------
creates a circle from a non persistent one.
") GCE2d_MakeCircle;
		 GCE2d_MakeCircle(const gp_Circ2d & C);

		/****** GCE2d_MakeCircle::GCE2d_MakeCircle ******/
		/****** md5 signature: a567364a0fd2b29b78e3c2687bd978c7 ******/
		%feature("compactdefaultargs") GCE2d_MakeCircle;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2d
Radius: float
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
A is the 'XAxis' of the circle which defines the origin of parametrization. It is not forbidden to create a circle with Radius = 0.0 The status is 'NegativeRadius' if Radius < 0.
") GCE2d_MakeCircle;
		 GCE2d_MakeCircle(const gp_Ax2d & A, const Standard_Real Radius, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeCircle::GCE2d_MakeCircle ******/
		/****** md5 signature: 924167a8f30a4e80ed28d00a4fa578cb ******/
		%feature("compactdefaultargs") GCE2d_MakeCircle;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax22d
Radius: float

Return
-------
None

Description
-----------
A is the local coordinate system of the circle which defines the origin of parametrization. It is not forbidden to create a circle with Radius = 0.0 The status is 'NegativeRadius' if Radius < 0.
") GCE2d_MakeCircle;
		 GCE2d_MakeCircle(const gp_Ax22d & A, const Standard_Real Radius);

		/****** GCE2d_MakeCircle::GCE2d_MakeCircle ******/
		/****** md5 signature: 09841fdff13f59e0e70995f413aa3987 ******/
		%feature("compactdefaultargs") GCE2d_MakeCircle;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ2d
Dist: float

Return
-------
None

Description
-----------
Make a Circle from Geom2d <TheCirc> parallel to another Circ <Circ> with a distance <Dist>. If Dist is greater than zero the result is enclosing the circle <Circ>, else the result is enclosed by the circle <Circ>.
") GCE2d_MakeCircle;
		 GCE2d_MakeCircle(const gp_Circ2d & Circ, const Standard_Real Dist);

		/****** GCE2d_MakeCircle::GCE2d_MakeCircle ******/
		/****** md5 signature: c360d2d1b77059e00402d243e858b584 ******/
		%feature("compactdefaultargs") GCE2d_MakeCircle;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ2d
Point: gp_Pnt2d

Return
-------
None

Description
-----------
Make a Circle from Geom2d <TheCirc> parallel to another Circ <Circ> and passing through a Pnt <Point>.
") GCE2d_MakeCircle;
		 GCE2d_MakeCircle(const gp_Circ2d & Circ, const gp_Pnt2d & Point);

		/****** GCE2d_MakeCircle::GCE2d_MakeCircle ******/
		/****** md5 signature: 2c9cf90ffbf799cbf98bfb7d045fd8a7 ******/
		%feature("compactdefaultargs") GCE2d_MakeCircle;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d
P3: gp_Pnt2d

Return
-------
None

Description
-----------
Make a Circ from gp <TheCirc> passing through 3 Pnt2d <P1>,<P2>,<P3>.
") GCE2d_MakeCircle;
		 GCE2d_MakeCircle(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const gp_Pnt2d & P3);

		/****** GCE2d_MakeCircle::GCE2d_MakeCircle ******/
		/****** md5 signature: b9a3e01a6e0b7aed59d92dcc53973501 ******/
		%feature("compactdefaultargs") GCE2d_MakeCircle;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Radius: float
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Make a Circ from geom2d <TheCirc> by its center an radius.
") GCE2d_MakeCircle;
		 GCE2d_MakeCircle(const gp_Pnt2d & P, const Standard_Real Radius, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeCircle::GCE2d_MakeCircle ******/
		/****** md5 signature: b3bc318971484379a98b8faa8f08bb08 ******/
		%feature("compactdefaultargs") GCE2d_MakeCircle;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt2d
Point: gp_Pnt2d
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Makes a Circle from geom2d <TheCirc> with its center <Center> and a point giving the radius. If Sense is true the local coordinate system of the solution is direct and non direct in the other case. Warning The MakeCircle class does not prevent the construction of a circle with a null radius. If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_NegativeRadius if Radius is less than 0.0, or - gce_IntersectionError if points P1, P2 and P3 are collinear and the three are not coincident.
") GCE2d_MakeCircle;
		 GCE2d_MakeCircle(const gp_Pnt2d & Center, const gp_Pnt2d & Point, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeCircle::Value ******/
		/****** md5 signature: 1f53c76cb56b10f031a04e080a4edcd4 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Circle>

Description
-----------
Returns the constructed circle. Exceptions StdFail_NotDone if no circle is constructed.
") Value;
		const opencascade::handle<Geom2d_Circle> & Value();

};


%extend GCE2d_MakeCircle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GCE2d_MakeEllipse *
**************************/
class GCE2d_MakeEllipse : public GCE2d_Root {
	public:
		/****** GCE2d_MakeEllipse::GCE2d_MakeEllipse ******/
		/****** md5 signature: 781c220bdc8f0fa1361d89c0deab60bf ******/
		%feature("compactdefaultargs") GCE2d_MakeEllipse;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d

Return
-------
None

Description
-----------
Creates an ellipse from a non persistent one from package gp.
") GCE2d_MakeEllipse;
		 GCE2d_MakeEllipse(const gp_Elips2d & E);

		/****** GCE2d_MakeEllipse::GCE2d_MakeEllipse ******/
		/****** md5 signature: a005765f82ecff74127d7d9d76e6a9f7 ******/
		%feature("compactdefaultargs") GCE2d_MakeEllipse;
		%feature("autodoc", "
Parameters
----------
MajorAxis: gp_Ax2d
MajorRadius: float
MinorRadius: float
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
MajorAxis is the local coordinate system of the ellipse. It is the 'XAxis'. The minor axis is the YAxis of the ellipse. Sense give the sense of parametrization of the Ellipse. It is not forbidden to create an ellipse with MajorRadius = MinorRadius. The status is 'InvertRadius' if MajorRadius < MinorRadius or 'NegativeRadius' if MinorRadius < 0.
") GCE2d_MakeEllipse;
		 GCE2d_MakeEllipse(const gp_Ax2d & MajorAxis, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeEllipse::GCE2d_MakeEllipse ******/
		/****** md5 signature: 4f0725501a4788cea8be3f03d732bcbc ******/
		%feature("compactdefaultargs") GCE2d_MakeEllipse;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax22d
MajorRadius: float
MinorRadius: float

Return
-------
None

Description
-----------
Axis is the local coordinate system of the ellipse. It is not forbidden to create an ellipse with MajorRadius = MinorRadius. The status is 'InvertRadius' if MajorRadius < MinorRadius or 'NegativeRadius' if MinorRadius < 0.
") GCE2d_MakeEllipse;
		 GCE2d_MakeEllipse(const gp_Ax22d & Axis, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****** GCE2d_MakeEllipse::GCE2d_MakeEllipse ******/
		/****** md5 signature: 4646e026dd9b05a1c7d87693ec5ecac4 ******/
		%feature("compactdefaultargs") GCE2d_MakeEllipse;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pnt2d
S2: gp_Pnt2d
Center: gp_Pnt2d

Return
-------
None

Description
-----------
Make an Ellipse centered on the point Center, where - the major axis of the ellipse is defined by Center and S1, - its major radius is the distance between Center and S1, and - its minor radius is the distance between S2 and the major axis. The implicit orientation of the ellipse is: - the sense defined by Axis or E, - the sense defined by points Center, S1 and S2, - the trigonometric sense if Sense is not given or is true, or - the opposite sense if Sense is false.
") GCE2d_MakeEllipse;
		 GCE2d_MakeEllipse(const gp_Pnt2d & S1, const gp_Pnt2d & S2, const gp_Pnt2d & Center);

		/****** GCE2d_MakeEllipse::Value ******/
		/****** md5 signature: 2d10ec11666004d739fc242682345a05 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Ellipse>

Description
-----------
Returns the constructed ellipse. Exceptions StdFail_NotDone if no ellipse is constructed.
") Value;
		const opencascade::handle<Geom2d_Ellipse> & Value();

};


%extend GCE2d_MakeEllipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GCE2d_MakeHyperbola *
****************************/
class GCE2d_MakeHyperbola : public GCE2d_Root {
	public:
		/****** GCE2d_MakeHyperbola::GCE2d_MakeHyperbola ******/
		/****** md5 signature: fb6aa2c870361ab00ab9d44ad40f09f7 ******/
		%feature("compactdefaultargs") GCE2d_MakeHyperbola;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d

Return
-------
None

Description
-----------
Creates an Hyperbola from a non persistent one from package gp.
") GCE2d_MakeHyperbola;
		 GCE2d_MakeHyperbola(const gp_Hypr2d & H);

		/****** GCE2d_MakeHyperbola::GCE2d_MakeHyperbola ******/
		/****** md5 signature: bc91bbb4be40eb29d6d45ea4cf5c1e99 ******/
		%feature("compactdefaultargs") GCE2d_MakeHyperbola;
		%feature("autodoc", "
Parameters
----------
MajorAxis: gp_Ax2d
MajorRadius: float
MinorRadius: float
Sense: bool

Return
-------
None

Description
-----------
MajorAxis is the 'XAxis' of the hyperbola. The major radius of the hyperbola is on this 'XAxis' and the minor radius is on the 'YAxis' of the hyperbola. The status is 'NegativeRadius' if MajorRadius < 0.0 or if MinorRadius < 0.0.
") GCE2d_MakeHyperbola;
		 GCE2d_MakeHyperbola(const gp_Ax2d & MajorAxis, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Boolean Sense);

		/****** GCE2d_MakeHyperbola::GCE2d_MakeHyperbola ******/
		/****** md5 signature: 8ce5d4c62ca5c9e5e59afee4d2e9245c ******/
		%feature("compactdefaultargs") GCE2d_MakeHyperbola;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax22d
MajorRadius: float
MinorRadius: float

Return
-------
None

Description
-----------
Axis is the local coordinate system of the hyperbola. The major radius of the hyperbola is on this 'XAxis' and the minor radius is on the 'YAxis' of the hyperbola. The status is 'NegativeRadius' if MajorRadius < 0.0 or if MinorRadius < 0.0.
") GCE2d_MakeHyperbola;
		 GCE2d_MakeHyperbola(const gp_Ax22d & Axis, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****** GCE2d_MakeHyperbola::GCE2d_MakeHyperbola ******/
		/****** md5 signature: 571551d50b0fe125972ef4be30567452 ******/
		%feature("compactdefaultargs") GCE2d_MakeHyperbola;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pnt2d
S2: gp_Pnt2d
Center: gp_Pnt2d

Return
-------
None

Description
-----------
Creates a hyperbol centered on the origin of the coordinate system Axis, with major and minor radii MajorRadius and MinorRadius, where the major axis is the 'X Axis' of Axis (Axis is the local coordinate system of the hyperbola). The implicit orientation of the ellipse is: - the sense defined by Axis or H, - the sense defined by points Center, S1 and S2, - the trigonometric sense if Sense is not given or is true, or - the opposite sense if Sense is false. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_NegativeRadius if MajorRadius or MinorRadius is less than 0.0, or - gce_InvertAxis if the major radius defined by Center and S1 is less than the minor radius defined by Center, S1 and S2.Make an Hyperbola with its center and two apexes.
") GCE2d_MakeHyperbola;
		 GCE2d_MakeHyperbola(const gp_Pnt2d & S1, const gp_Pnt2d & S2, const gp_Pnt2d & Center);

		/****** GCE2d_MakeHyperbola::Value ******/
		/****** md5 signature: dd7449388b2bb54bca5d492fce5b636d ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Hyperbola>

Description
-----------
Returns the constructed hyperbola. Exceptions: StdFail_NotDone if no hyperbola is constructed.
") Value;
		const opencascade::handle<Geom2d_Hyperbola> & Value();

};


%extend GCE2d_MakeHyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class GCE2d_MakeLine *
***********************/
class GCE2d_MakeLine : public GCE2d_Root {
	public:
		/****** GCE2d_MakeLine::GCE2d_MakeLine ******/
		/****** md5 signature: 12989c59eb43a71e4c51000247ace58d ******/
		%feature("compactdefaultargs") GCE2d_MakeLine;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2d

Return
-------
None

Description
-----------
Creates a line located in 2D space with the axis placement A. The Location of A is the origin of the line.
") GCE2d_MakeLine;
		 GCE2d_MakeLine(const gp_Ax2d & A);

		/****** GCE2d_MakeLine::GCE2d_MakeLine ******/
		/****** md5 signature: 4a867d8683b357fb423ae8a1e9fd0277 ******/
		%feature("compactdefaultargs") GCE2d_MakeLine;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d

Return
-------
None

Description
-----------
Creates a line from a non persistent line from package gp.
") GCE2d_MakeLine;
		 GCE2d_MakeLine(const gp_Lin2d & L);

		/****** GCE2d_MakeLine::GCE2d_MakeLine ******/
		/****** md5 signature: d3f69376216de51fd410cc212322dc76 ******/
		%feature("compactdefaultargs") GCE2d_MakeLine;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
V: gp_Dir2d

Return
-------
None

Description
-----------
P is the origin and V is the direction of the line.
") GCE2d_MakeLine;
		 GCE2d_MakeLine(const gp_Pnt2d & P, const gp_Dir2d & V);

		/****** GCE2d_MakeLine::GCE2d_MakeLine ******/
		/****** md5 signature: c390a1b7e4e0f36451f3b35ce6f3c0b7 ******/
		%feature("compactdefaultargs") GCE2d_MakeLine;
		%feature("autodoc", "
Parameters
----------
Lin: gp_Lin2d
Point: gp_Pnt2d

Return
-------
None

Description
-----------
Make a Line from Geom2d <TheLin> parallel to another Lin <Lin> and passing through a Pnt <Point>.
") GCE2d_MakeLine;
		 GCE2d_MakeLine(const gp_Lin2d & Lin, const gp_Pnt2d & Point);

		/****** GCE2d_MakeLine::GCE2d_MakeLine ******/
		/****** md5 signature: 20ce75a7a5fa0ec52cfaf6b4ea73f6d6 ******/
		%feature("compactdefaultargs") GCE2d_MakeLine;
		%feature("autodoc", "
Parameters
----------
Lin: gp_Lin2d
Dist: float

Return
-------
None

Description
-----------
Make a Line from Geom2d <TheLin> parallel to another Lin <Lin> at a distance <Dist>.
") GCE2d_MakeLine;
		 GCE2d_MakeLine(const gp_Lin2d & Lin, const Standard_Real Dist);

		/****** GCE2d_MakeLine::GCE2d_MakeLine ******/
		/****** md5 signature: ab429c73e6ce7ba0a32afbf6be309364 ******/
		%feature("compactdefaultargs") GCE2d_MakeLine;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
Make a Line from Geom2d <TheLin> passing through 2 Pnt <P1>,<P2>. It returns false if <p1> and <P2> are confused. Warning If points P1 and P2 coincident (that is, when IsDone returns false), the Status function returns gce_ConfusedPoints.
") GCE2d_MakeLine;
		 GCE2d_MakeLine(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** GCE2d_MakeLine::Value ******/
		/****** md5 signature: b2bd7ed650b8a6f010f325e80f90f0cf ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Line>

Description
-----------
Returns the constructed line. Exceptions StdFail_NotDone if no line is constructed.
") Value;
		const opencascade::handle<Geom2d_Line> & Value();

};


%extend GCE2d_MakeLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GCE2d_MakeParabola *
***************************/
class GCE2d_MakeParabola : public GCE2d_Root {
	public:
		/****** GCE2d_MakeParabola::GCE2d_MakeParabola ******/
		/****** md5 signature: 440be90c6545cdd1fb294d810818427f ******/
		%feature("compactdefaultargs") GCE2d_MakeParabola;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d

Return
-------
None

Description
-----------
Creates a parabola from a non persistent one.
") GCE2d_MakeParabola;
		 GCE2d_MakeParabola(const gp_Parab2d & Prb);

		/****** GCE2d_MakeParabola::GCE2d_MakeParabola ******/
		/****** md5 signature: 06fbd3cf5e1136511df494d14ba42b21 ******/
		%feature("compactdefaultargs") GCE2d_MakeParabola;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax22d
Focal: float

Return
-------
None

Description
-----------
Creates a parabola with its local coordinate system and it's focal length 'Focal'. The 'Location' point of 'Axis' is the vertex of the parabola Status is 'NegativeFocusLength' if Focal < 0.0.
") GCE2d_MakeParabola;
		 GCE2d_MakeParabola(const gp_Ax22d & Axis, const Standard_Real Focal);

		/****** GCE2d_MakeParabola::GCE2d_MakeParabola ******/
		/****** md5 signature: a1b75ff7d5c6d9a4304cdf116878cf6c ******/
		%feature("compactdefaultargs") GCE2d_MakeParabola;
		%feature("autodoc", "
Parameters
----------
MirrorAxis: gp_Ax2d
Focal: float
Sense: bool

Return
-------
None

Description
-----------
Creates a parabola with its 'MirrorAxis' and it's focal length 'Focal'. MirrorAxis is the axis of symmetry of the curve, it is the 'XAxis'. The 'YAxis' is parallel to the directrix of the parabola. The 'Location' point of 'MirrorAxis' is the vertex of the parabola Status is 'NegativeFocusLength' if Focal < 0.0.
") GCE2d_MakeParabola;
		 GCE2d_MakeParabola(const gp_Ax2d & MirrorAxis, const Standard_Real Focal, const Standard_Boolean Sense);

		/****** GCE2d_MakeParabola::GCE2d_MakeParabola ******/
		/****** md5 signature: 9639dc3e6c3cf8f1690481c98d007024 ******/
		%feature("compactdefaultargs") GCE2d_MakeParabola;
		%feature("autodoc", "
Parameters
----------
D: gp_Ax2d
F: gp_Pnt2d
Sense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
D is the directrix of the parabola and F the focus point. The symmetry axis 'XAxis' of the parabola is normal to the directrix and pass through the focus point F, but its 'Location' point is the vertex of the parabola. The 'YAxis' of the parabola is parallel to D and its 'Location' point is the vertex of the parabola.
") GCE2d_MakeParabola;
		 GCE2d_MakeParabola(const gp_Ax2d & D, const gp_Pnt2d & F, const Standard_Boolean Sense = Standard_True);

		/****** GCE2d_MakeParabola::GCE2d_MakeParabola ******/
		/****** md5 signature: d64445e763c2ff24d2e85a790ecfdda4 ******/
		%feature("compactdefaultargs") GCE2d_MakeParabola;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pnt2d
O: gp_Pnt2d

Return
-------
None

Description
-----------
Make a parabola with focal point S1 and center O The branch of the parabola returned will have <S1> as focal point The implicit orientation of the parabola is: - the same one as the parabola Prb, - the sense defined by the coordinate system Axis or the directrix D, - the trigonometric sense if Sense is not given or is true, or - the opposite sense if Sense is false. Warning The MakeParabola class does not prevent the construction of a parabola with a null focal distance. If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_NullFocusLength if Focal is less than 0.0, or - gce_NullAxis if points S1 and O are coincident.
") GCE2d_MakeParabola;
		 GCE2d_MakeParabola(const gp_Pnt2d & S1, const gp_Pnt2d & O);

		/****** GCE2d_MakeParabola::Value ******/
		/****** md5 signature: 67a8e074f7eb71ab61c9917c17ace1e8 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Parabola>

Description
-----------
Returns the constructed parabola. Exceptions StdFail_NotDone if no parabola is constructed.
") Value;
		const opencascade::handle<Geom2d_Parabola> & Value();

};


%extend GCE2d_MakeParabola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GCE2d_MakeSegment *
**************************/
class GCE2d_MakeSegment : public GCE2d_Root {
	public:
		/****** GCE2d_MakeSegment::GCE2d_MakeSegment ******/
		/****** md5 signature: 927ab00b46a319e7e6e93eba8766ed39 ******/
		%feature("compactdefaultargs") GCE2d_MakeSegment;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
Make a segment of Line from the 2 points <P1> and <P2>. Status is 'ConfusedPoints' if <P1> and <P2> are confused.
") GCE2d_MakeSegment;
		 GCE2d_MakeSegment(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** GCE2d_MakeSegment::GCE2d_MakeSegment ******/
		/****** md5 signature: 73c0fac6061adc36cfb7587bfebb3ff1 ******/
		%feature("compactdefaultargs") GCE2d_MakeSegment;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
V: gp_Dir2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
Make a segment of Line from the point <P1> with the direction <P> and ended by the projection of <P2> on the line <P1,V>. Status is 'ConfusedPoints' if <P1> and <P2> are confused.
") GCE2d_MakeSegment;
		 GCE2d_MakeSegment(const gp_Pnt2d & P1, const gp_Dir2d & V, const gp_Pnt2d & P2);

		/****** GCE2d_MakeSegment::GCE2d_MakeSegment ******/
		/****** md5 signature: ff0b4f2ad6a142afbb18a36fe5176f14 ******/
		%feature("compactdefaultargs") GCE2d_MakeSegment;
		%feature("autodoc", "
Parameters
----------
Line: gp_Lin2d
U1: float
U2: float

Return
-------
None

Description
-----------
Make a segment of Line from the line <Line> between the two parameters U1 and U2. Status is 'SameParameters' if <U1> is equal <U2>.
") GCE2d_MakeSegment;
		 GCE2d_MakeSegment(const gp_Lin2d & Line, const Standard_Real U1, const Standard_Real U2);

		/****** GCE2d_MakeSegment::GCE2d_MakeSegment ******/
		/****** md5 signature: 18da33f024e1e323a39942fe20eef836 ******/
		%feature("compactdefaultargs") GCE2d_MakeSegment;
		%feature("autodoc", "
Parameters
----------
Line: gp_Lin2d
Point: gp_Pnt2d
Ulast: float

Return
-------
None

Description
-----------
Make a segment of Line from the line <Line> between the point <Point> and the parameter Ulast. It returns NullObject if <U1> is equal <U2>.
") GCE2d_MakeSegment;
		 GCE2d_MakeSegment(const gp_Lin2d & Line, const gp_Pnt2d & Point, const Standard_Real Ulast);

		/****** GCE2d_MakeSegment::GCE2d_MakeSegment ******/
		/****** md5 signature: d755168002938d30baddaef3dfe2f3aa ******/
		%feature("compactdefaultargs") GCE2d_MakeSegment;
		%feature("autodoc", "
Parameters
----------
Line: gp_Lin2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
Make a segment of Line from the line <Line> between the two points <P1> and <P2>. It returns NullObject if <P1> and <P2> are confused. Warning If the points which limit the segment are coincident for given points or for the projection of given points on the line which supports the line segment (that is, when IsDone returns false), the Status function returns gce_ConfusedPoints. This warning only concerns the first two constructors.
") GCE2d_MakeSegment;
		 GCE2d_MakeSegment(const gp_Lin2d & Line, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** GCE2d_MakeSegment::Value ******/
		/****** md5 signature: c4acd9e5da9de118f672d33c6f39b3b0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_TrimmedCurve>

Description
-----------
Returns the constructed line segment. Exceptions StdFail_NotDone if no line segment is constructed.
") Value;
		const opencascade::handle<Geom2d_TrimmedCurve> & Value();

};


%extend GCE2d_MakeSegment {
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
