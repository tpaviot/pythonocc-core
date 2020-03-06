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
%define GCE2DDOCSTRING
"GCE2d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_gce2d.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/*************************
* class GCE2d_MakeMirror *
*************************/
class GCE2d_MakeMirror {
	public:
		/****************** GCE2d_MakeMirror ******************/
		%feature("compactdefaultargs") GCE2d_MakeMirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
Point: gp_Pnt2d

Returns
-------
None
") GCE2d_MakeMirror;
		 GCE2d_MakeMirror(const gp_Pnt2d & Point);

		/****************** GCE2d_MakeMirror ******************/
		%feature("compactdefaultargs") GCE2d_MakeMirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
Axis: gp_Ax2d

Returns
-------
None
") GCE2d_MakeMirror;
		 GCE2d_MakeMirror(const gp_Ax2d & Axis);

		/****************** GCE2d_MakeMirror ******************/
		%feature("compactdefaultargs") GCE2d_MakeMirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
Line: gp_Lin2d

Returns
-------
None
") GCE2d_MakeMirror;
		 GCE2d_MakeMirror(const gp_Lin2d & Line);

		/****************** GCE2d_MakeMirror ******************/
		%feature("compactdefaultargs") GCE2d_MakeMirror;
		%feature("autodoc", "Make a symetry transformation af axis defined by <point> and <direc>.

Parameters
----------
Point: gp_Pnt2d
Direc: gp_Dir2d

Returns
-------
None
") GCE2d_MakeMirror;
		 GCE2d_MakeMirror(const gp_Pnt2d & Point, const gp_Dir2d & Direc);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed transformation.

Returns
-------
opencascade::handle<Geom2d_Transformation>
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
		/****************** GCE2d_MakeRotation ******************/
		%feature("compactdefaultargs") GCE2d_MakeRotation;
		%feature("autodoc", "Constructs a rotation through angle angle about the center point.

Parameters
----------
Point: gp_Pnt2d
Angle: float

Returns
-------
None
") GCE2d_MakeRotation;
		 GCE2d_MakeRotation(const gp_Pnt2d & Point, const Standard_Real Angle);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed transformation.

Returns
-------
opencascade::handle<Geom2d_Transformation>
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
		/****************** GCE2d_MakeScale ******************/
		%feature("compactdefaultargs") GCE2d_MakeScale;
		%feature("autodoc", "Constructs a scaling transformation with - point as the center of the transformation, and - scale as the scale factor.

Parameters
----------
Point: gp_Pnt2d
Scale: float

Returns
-------
None
") GCE2d_MakeScale;
		 GCE2d_MakeScale(const gp_Pnt2d & Point, const Standard_Real Scale);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed transformation.

Returns
-------
opencascade::handle<Geom2d_Transformation>
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
		/****************** GCE2d_MakeTranslation ******************/
		%feature("compactdefaultargs") GCE2d_MakeTranslation;
		%feature("autodoc", "Constructs a translation along the vector vect.

Parameters
----------
Vect: gp_Vec2d

Returns
-------
None
") GCE2d_MakeTranslation;
		 GCE2d_MakeTranslation(const gp_Vec2d & Vect);

		/****************** GCE2d_MakeTranslation ******************/
		%feature("compactdefaultargs") GCE2d_MakeTranslation;
		%feature("autodoc", "Constructs a translation along the vector (point1,point2) defined from the point point1 to the point point2.

Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d

Returns
-------
None
") GCE2d_MakeTranslation;
		 GCE2d_MakeTranslation(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed transformation.

Returns
-------
opencascade::handle<Geom2d_Transformation>
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
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the construction is successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the status of the construction - gce_done, if the construction is successful, or - another value of the gce_errortype enumeration indicating why the construction failed.

Returns
-------
gce_ErrorType
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
		/****************** GCE2d_MakeArcOfCircle ******************/
		%feature("compactdefaultargs") GCE2d_MakeArcOfCircle;
		%feature("autodoc", "Makes an arc of circle (trimmedcurve from geom2d) from a circle between two parameters alpha1 and alpha2. the two parameters are angles. the parameters are in radians.

Parameters
----------
Circ: gp_Circ2d
Alpha1: float
Alpha2: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeArcOfCircle;
		 GCE2d_MakeArcOfCircle(const gp_Circ2d & Circ, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Boolean Sense = Standard_True);

		/****************** GCE2d_MakeArcOfCircle ******************/
		%feature("compactdefaultargs") GCE2d_MakeArcOfCircle;
		%feature("autodoc", "Makes an arc of circle (trimmedcurve from geom2d) from a circle between point <p> and the parameter alpha. alpha is given in radians.

Parameters
----------
Circ: gp_Circ2d
P: gp_Pnt2d
Alpha: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeArcOfCircle;
		 GCE2d_MakeArcOfCircle(const gp_Circ2d & Circ, const gp_Pnt2d & P, const Standard_Real Alpha, const Standard_Boolean Sense = Standard_True);

		/****************** GCE2d_MakeArcOfCircle ******************/
		%feature("compactdefaultargs") GCE2d_MakeArcOfCircle;
		%feature("autodoc", "Makes an arc of circle (trimmedcurve from geom2d) from a circle between two points p1 and p2.

Parameters
----------
Circ: gp_Circ2d
P1: gp_Pnt2d
P2: gp_Pnt2d
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeArcOfCircle;
		 GCE2d_MakeArcOfCircle(const gp_Circ2d & Circ, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Boolean Sense = Standard_True);

		/****************** GCE2d_MakeArcOfCircle ******************/
		%feature("compactdefaultargs") GCE2d_MakeArcOfCircle;
		%feature("autodoc", "Makes an arc of circle (trimmedcurve from geom2d) from three points p1,p2,p3 between two points p1 and p3, and passing through the point p2.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d
P3: gp_Pnt2d

Returns
-------
None
") GCE2d_MakeArcOfCircle;
		 GCE2d_MakeArcOfCircle(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const gp_Pnt2d & P3);

		/****************** GCE2d_MakeArcOfCircle ******************/
		%feature("compactdefaultargs") GCE2d_MakeArcOfCircle;
		%feature("autodoc", "Makes an arc of circle (trimmedcurve from geom2d) from two points p1,p2 and the tangente to the solution at the point p1.

Parameters
----------
P1: gp_Pnt2d
V: gp_Vec2d
P2: gp_Pnt2d

Returns
-------
None
") GCE2d_MakeArcOfCircle;
		 GCE2d_MakeArcOfCircle(const gp_Pnt2d & P1, const gp_Vec2d & V, const gp_Pnt2d & P2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed arc of circle. exceptions stdfail_notdone if no arc of circle is constructed.

Returns
-------
opencascade::handle<Geom2d_TrimmedCurve>
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
		/****************** GCE2d_MakeArcOfEllipse ******************/
		%feature("compactdefaultargs") GCE2d_MakeArcOfEllipse;
		%feature("autodoc", "Make an arc of ellipse (trimmedcurve from geom2d) from a ellipse between two parameters alpha1 and alpha2.

Parameters
----------
Elips: gp_Elips2d
Alpha1: float
Alpha2: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeArcOfEllipse;
		 GCE2d_MakeArcOfEllipse(const gp_Elips2d & Elips, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Boolean Sense = Standard_True);

		/****************** GCE2d_MakeArcOfEllipse ******************/
		%feature("compactdefaultargs") GCE2d_MakeArcOfEllipse;
		%feature("autodoc", "Make an arc of ellipse (trimmedcurve from geom2d) from a ellipse between point <p> and the parameter alpha.

Parameters
----------
Elips: gp_Elips2d
P: gp_Pnt2d
Alpha: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeArcOfEllipse;
		 GCE2d_MakeArcOfEllipse(const gp_Elips2d & Elips, const gp_Pnt2d & P, const Standard_Real Alpha, const Standard_Boolean Sense = Standard_True);

		/****************** GCE2d_MakeArcOfEllipse ******************/
		%feature("compactdefaultargs") GCE2d_MakeArcOfEllipse;
		%feature("autodoc", "Make an arc of ellipse (trimmedcurve from geom2d) from a ellipse between two points p1 and p2. please, note: the orientation of the arc is: - the trigonometric sense if sense is not defined or is true (default value), or - the opposite sense if sense is false. - alpha1, alpha2 and alpha are angle values, given in radians. - isdone always returns true.

Parameters
----------
Elips: gp_Elips2d
P1: gp_Pnt2d
P2: gp_Pnt2d
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeArcOfEllipse;
		 GCE2d_MakeArcOfEllipse(const gp_Elips2d & Elips, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Boolean Sense = Standard_True);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed arc of ellipse.

Returns
-------
opencascade::handle<Geom2d_TrimmedCurve>
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
		/****************** GCE2d_MakeArcOfHyperbola ******************/
		%feature("compactdefaultargs") GCE2d_MakeArcOfHyperbola;
		%feature("autodoc", "Makes an arc of hyperbola (trimmedcurve from geom2d) from a hyperbola between two parameters alpha1 and alpha2.

Parameters
----------
Hypr: gp_Hypr2d
Alpha1: float
Alpha2: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeArcOfHyperbola;
		 GCE2d_MakeArcOfHyperbola(const gp_Hypr2d & Hypr, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Boolean Sense = Standard_True);

		/****************** GCE2d_MakeArcOfHyperbola ******************/
		%feature("compactdefaultargs") GCE2d_MakeArcOfHyperbola;
		%feature("autodoc", "Makes an arc of hyperbola (trimmedcurve from geom2d) from a hyperbola between point <p> and the parameter alpha.

Parameters
----------
Hypr: gp_Hypr2d
P: gp_Pnt2d
Alpha: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeArcOfHyperbola;
		 GCE2d_MakeArcOfHyperbola(const gp_Hypr2d & Hypr, const gp_Pnt2d & P, const Standard_Real Alpha, const Standard_Boolean Sense = Standard_True);

		/****************** GCE2d_MakeArcOfHyperbola ******************/
		%feature("compactdefaultargs") GCE2d_MakeArcOfHyperbola;
		%feature("autodoc", "Makes an arc of hyperbola (trimmedcurve from geom2d) from a hyperbola between two points p1 and p2. note: the orientation of the arc of hyperbola is: - the trigonometric sense if sense is not defined or is true (default value), or - the opposite sense if sense is false. - isdone always returns true.

Parameters
----------
Hypr: gp_Hypr2d
P1: gp_Pnt2d
P2: gp_Pnt2d
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeArcOfHyperbola;
		 GCE2d_MakeArcOfHyperbola(const gp_Hypr2d & Hypr, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Boolean Sense = Standard_True);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed arc of hyperbola.

Returns
-------
opencascade::handle<Geom2d_TrimmedCurve>
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
		/****************** GCE2d_MakeArcOfParabola ******************/
		%feature("compactdefaultargs") GCE2d_MakeArcOfParabola;
		%feature("autodoc", "Make an arc of parabola (trimmedcurve from geom2d) from a parabola between two parameters alpha1 and alpha2.

Parameters
----------
Parab: gp_Parab2d
Alpha1: float
Alpha2: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeArcOfParabola;
		 GCE2d_MakeArcOfParabola(const gp_Parab2d & Parab, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Boolean Sense = Standard_True);

		/****************** GCE2d_MakeArcOfParabola ******************/
		%feature("compactdefaultargs") GCE2d_MakeArcOfParabola;
		%feature("autodoc", "Make an arc of parabola (trimmedcurve from geom2d) from a parabola between point <p> and the parameter alpha.

Parameters
----------
Parab: gp_Parab2d
P: gp_Pnt2d
Alpha: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeArcOfParabola;
		 GCE2d_MakeArcOfParabola(const gp_Parab2d & Parab, const gp_Pnt2d & P, const Standard_Real Alpha, const Standard_Boolean Sense = Standard_True);

		/****************** GCE2d_MakeArcOfParabola ******************/
		%feature("compactdefaultargs") GCE2d_MakeArcOfParabola;
		%feature("autodoc", "Make an arc of parabola (trimmedcurve from geom2d) from a parabola between two points p1 and p2. please, note: the orientation of the arc of parabola is: - the trigonometric sense if sense is not defined or is true (default value), or - the opposite sense if sense is false. - isdone always returns true.

Parameters
----------
Parab: gp_Parab2d
P1: gp_Pnt2d
P2: gp_Pnt2d
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeArcOfParabola;
		 GCE2d_MakeArcOfParabola(const gp_Parab2d & Parab, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Boolean Sense = Standard_True);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed arc of parabola.

Returns
-------
opencascade::handle<Geom2d_TrimmedCurve>
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
		/****************** GCE2d_MakeCircle ******************/
		%feature("compactdefaultargs") GCE2d_MakeCircle;
		%feature("autodoc", "Creates a circle from a non persistent one.

Parameters
----------
C: gp_Circ2d

Returns
-------
None
") GCE2d_MakeCircle;
		 GCE2d_MakeCircle(const gp_Circ2d & C);

		/****************** GCE2d_MakeCircle ******************/
		%feature("compactdefaultargs") GCE2d_MakeCircle;
		%feature("autodoc", "A is the 'xaxis' of the circle which defines the origin of parametrization. it is not forbidden to create a circle with radius = 0.0 the status is 'negativeradius' if radius < 0.

Parameters
----------
A: gp_Ax2d
Radius: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeCircle;
		 GCE2d_MakeCircle(const gp_Ax2d & A, const Standard_Real Radius, const Standard_Boolean Sense = Standard_True);

		/****************** GCE2d_MakeCircle ******************/
		%feature("compactdefaultargs") GCE2d_MakeCircle;
		%feature("autodoc", "A is the local coordinate system of the circle which defines the origin of parametrization. it is not forbidden to create a circle with radius = 0.0 the status is 'negativeradius' if radius < 0.

Parameters
----------
A: gp_Ax22d
Radius: float

Returns
-------
None
") GCE2d_MakeCircle;
		 GCE2d_MakeCircle(const gp_Ax22d & A, const Standard_Real Radius);

		/****************** GCE2d_MakeCircle ******************/
		%feature("compactdefaultargs") GCE2d_MakeCircle;
		%feature("autodoc", "Make a circle from geom2d <thecirc> parallel to another circ <circ> with a distance <dist>. if dist is greater than zero the result is enclosing the circle <circ>, else the result is enclosed by the circle <circ>.

Parameters
----------
Circ: gp_Circ2d
Dist: float

Returns
-------
None
") GCE2d_MakeCircle;
		 GCE2d_MakeCircle(const gp_Circ2d & Circ, const Standard_Real Dist);

		/****************** GCE2d_MakeCircle ******************/
		%feature("compactdefaultargs") GCE2d_MakeCircle;
		%feature("autodoc", "Make a circle from geom2d <thecirc> parallel to another circ <circ> and passing through a pnt <point>.

Parameters
----------
Circ: gp_Circ2d
Point: gp_Pnt2d

Returns
-------
None
") GCE2d_MakeCircle;
		 GCE2d_MakeCircle(const gp_Circ2d & Circ, const gp_Pnt2d & Point);

		/****************** GCE2d_MakeCircle ******************/
		%feature("compactdefaultargs") GCE2d_MakeCircle;
		%feature("autodoc", "Make a circ from gp <thecirc> passing through 3 pnt2d <p1>,<p2>,<p3>.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d
P3: gp_Pnt2d

Returns
-------
None
") GCE2d_MakeCircle;
		 GCE2d_MakeCircle(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const gp_Pnt2d & P3);

		/****************** GCE2d_MakeCircle ******************/
		%feature("compactdefaultargs") GCE2d_MakeCircle;
		%feature("autodoc", "Make a circ from geom2d <thecirc> by its center an radius.

Parameters
----------
P: gp_Pnt2d
Radius: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeCircle;
		 GCE2d_MakeCircle(const gp_Pnt2d & P, const Standard_Real Radius, const Standard_Boolean Sense = Standard_True);

		/****************** GCE2d_MakeCircle ******************/
		%feature("compactdefaultargs") GCE2d_MakeCircle;
		%feature("autodoc", "Makes a circle from geom2d <thecirc> with its center <center> and a point giving the radius. if sense is true the local coordinate system of the solution is direct and non direct in the other case. warning the makecircle class does not prevent the construction of a circle with a null radius. if an error occurs (that is, when isdone returns false), the status function returns: - gce_negativeradius if radius is less than 0.0, or - gce_intersectionerror if points p1, p2 and p3 are collinear and the three are not coincident.

Parameters
----------
Center: gp_Pnt2d
Point: gp_Pnt2d
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeCircle;
		 GCE2d_MakeCircle(const gp_Pnt2d & Center, const gp_Pnt2d & Point, const Standard_Boolean Sense = Standard_True);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed circle. exceptions stdfail_notdone if no circle is constructed.

Returns
-------
opencascade::handle<Geom2d_Circle>
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
		/****************** GCE2d_MakeEllipse ******************/
		%feature("compactdefaultargs") GCE2d_MakeEllipse;
		%feature("autodoc", "Creates an ellipse from a non persistent one from package gp.

Parameters
----------
E: gp_Elips2d

Returns
-------
None
") GCE2d_MakeEllipse;
		 GCE2d_MakeEllipse(const gp_Elips2d & E);

		/****************** GCE2d_MakeEllipse ******************/
		%feature("compactdefaultargs") GCE2d_MakeEllipse;
		%feature("autodoc", "Majoraxis is the local coordinate system of the ellipse. it is the 'xaxis'. the minor axis is the yaxis of the ellipse. sense give the sense of parametrization of the ellipse. it is not forbidden to create an ellipse with majorradius = minorradius. the status is 'invertradius' if majorradius < minorradius or 'negativeradius' if minorradius < 0.

Parameters
----------
MajorAxis: gp_Ax2d
MajorRadius: float
MinorRadius: float
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeEllipse;
		 GCE2d_MakeEllipse(const gp_Ax2d & MajorAxis, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Boolean Sense = Standard_True);

		/****************** GCE2d_MakeEllipse ******************/
		%feature("compactdefaultargs") GCE2d_MakeEllipse;
		%feature("autodoc", "Axis is the local coordinate system of the ellipse. it is not forbidden to create an ellipse with majorradius = minorradius. the status is 'invertradius' if majorradius < minorradius or 'negativeradius' if minorradius < 0.

Parameters
----------
Axis: gp_Ax22d
MajorRadius: float
MinorRadius: float

Returns
-------
None
") GCE2d_MakeEllipse;
		 GCE2d_MakeEllipse(const gp_Ax22d & Axis, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** GCE2d_MakeEllipse ******************/
		%feature("compactdefaultargs") GCE2d_MakeEllipse;
		%feature("autodoc", "Make an ellipse centered on the point center, where - the major axis of the ellipse is defined by center and s1, - its major radius is the distance between center and s1, and - its minor radius is the distance between s2 and the major axis. the implicit orientation of the ellipse is: - the sense defined by axis or e, - the sense defined by points center, s1 and s2, - the trigonometric sense if sense is not given or is true, or - the opposite sense if sense is false.

Parameters
----------
S1: gp_Pnt2d
S2: gp_Pnt2d
Center: gp_Pnt2d

Returns
-------
None
") GCE2d_MakeEllipse;
		 GCE2d_MakeEllipse(const gp_Pnt2d & S1, const gp_Pnt2d & S2, const gp_Pnt2d & Center);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed ellipse. exceptions stdfail_notdone if no ellipse is constructed.

Returns
-------
opencascade::handle<Geom2d_Ellipse>
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
		/****************** GCE2d_MakeHyperbola ******************/
		%feature("compactdefaultargs") GCE2d_MakeHyperbola;
		%feature("autodoc", "Creates an hyperbola from a non persistent one from package gp.

Parameters
----------
H: gp_Hypr2d

Returns
-------
None
") GCE2d_MakeHyperbola;
		 GCE2d_MakeHyperbola(const gp_Hypr2d & H);

		/****************** GCE2d_MakeHyperbola ******************/
		%feature("compactdefaultargs") GCE2d_MakeHyperbola;
		%feature("autodoc", "Majoraxis is the 'xaxis' of the hyperbola. the major radius of the hyperbola is on this 'xaxis' and the minor radius is on the 'yaxis' of the hyperbola. the status is 'negativeradius' if majorradius < 0.0 or if minorradius < 0.0.

Parameters
----------
MajorAxis: gp_Ax2d
MajorRadius: float
MinorRadius: float
Sense: bool

Returns
-------
None
") GCE2d_MakeHyperbola;
		 GCE2d_MakeHyperbola(const gp_Ax2d & MajorAxis, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Boolean Sense);

		/****************** GCE2d_MakeHyperbola ******************/
		%feature("compactdefaultargs") GCE2d_MakeHyperbola;
		%feature("autodoc", "Axis is the local coordinate system of the hyperbola. the major radius of the hyperbola is on this 'xaxis' and the minor radius is on the 'yaxis' of the hyperbola. the status is 'negativeradius' if majorradius < 0.0 or if minorradius < 0.0.

Parameters
----------
Axis: gp_Ax22d
MajorRadius: float
MinorRadius: float

Returns
-------
None
") GCE2d_MakeHyperbola;
		 GCE2d_MakeHyperbola(const gp_Ax22d & Axis, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** GCE2d_MakeHyperbola ******************/
		%feature("compactdefaultargs") GCE2d_MakeHyperbola;
		%feature("autodoc", "Creates a hyperbol centered on the origin of the coordinate system axis, with major and minor radii majorradius and minorradius, where the major axis is the 'x axis' of axis (axis is the local coordinate system of the hyperbola). the implicit orientation of the ellipse is: - the sense defined by axis or h, - the sense defined by points center, s1 and s2, - the trigonometric sense if sense is not given or is true, or - the opposite sense if sense is false. warning if an error occurs (that is, when isdone returns false), the status function returns: - gce_negativeradius if majorradius or minorradius is less than 0.0, or - gce_invertaxis if the major radius defined by center and s1 is less than the minor radius defined by center, s1 and s2.make an hyperbola with its center and two apexes.

Parameters
----------
S1: gp_Pnt2d
S2: gp_Pnt2d
Center: gp_Pnt2d

Returns
-------
None
") GCE2d_MakeHyperbola;
		 GCE2d_MakeHyperbola(const gp_Pnt2d & S1, const gp_Pnt2d & S2, const gp_Pnt2d & Center);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed hyperbola. exceptions: stdfail_notdone if no hyperbola is constructed.

Returns
-------
opencascade::handle<Geom2d_Hyperbola>
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
		/****************** GCE2d_MakeLine ******************/
		%feature("compactdefaultargs") GCE2d_MakeLine;
		%feature("autodoc", "Creates a line located in 2d space with the axis placement a. the location of a is the origin of the line.

Parameters
----------
A: gp_Ax2d

Returns
-------
None
") GCE2d_MakeLine;
		 GCE2d_MakeLine(const gp_Ax2d & A);

		/****************** GCE2d_MakeLine ******************/
		%feature("compactdefaultargs") GCE2d_MakeLine;
		%feature("autodoc", "Creates a line from a non persistent line from package gp.

Parameters
----------
L: gp_Lin2d

Returns
-------
None
") GCE2d_MakeLine;
		 GCE2d_MakeLine(const gp_Lin2d & L);

		/****************** GCE2d_MakeLine ******************/
		%feature("compactdefaultargs") GCE2d_MakeLine;
		%feature("autodoc", "P is the origin and v is the direction of the line.

Parameters
----------
P: gp_Pnt2d
V: gp_Dir2d

Returns
-------
None
") GCE2d_MakeLine;
		 GCE2d_MakeLine(const gp_Pnt2d & P, const gp_Dir2d & V);

		/****************** GCE2d_MakeLine ******************/
		%feature("compactdefaultargs") GCE2d_MakeLine;
		%feature("autodoc", "Make a line from geom2d <thelin> parallel to another lin <lin> and passing through a pnt <point>.

Parameters
----------
Lin: gp_Lin2d
Point: gp_Pnt2d

Returns
-------
None
") GCE2d_MakeLine;
		 GCE2d_MakeLine(const gp_Lin2d & Lin, const gp_Pnt2d & Point);

		/****************** GCE2d_MakeLine ******************/
		%feature("compactdefaultargs") GCE2d_MakeLine;
		%feature("autodoc", "Make a line from geom2d <thelin> parallel to another lin <lin> at a distance <dist>.

Parameters
----------
Lin: gp_Lin2d
Dist: float

Returns
-------
None
") GCE2d_MakeLine;
		 GCE2d_MakeLine(const gp_Lin2d & Lin, const Standard_Real Dist);

		/****************** GCE2d_MakeLine ******************/
		%feature("compactdefaultargs") GCE2d_MakeLine;
		%feature("autodoc", "Make a line from geom2d <thelin> passing through 2 pnt <p1>,<p2>. it returns false if <p1> and <p2> are confused. warning if points p1 and p2 coincident (that is, when isdone returns false), the status function returns gce_confusedpoints.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") GCE2d_MakeLine;
		 GCE2d_MakeLine(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed line. exceptions stdfail_notdone if no line is constructed.

Returns
-------
opencascade::handle<Geom2d_Line>
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
		/****************** GCE2d_MakeParabola ******************/
		%feature("compactdefaultargs") GCE2d_MakeParabola;
		%feature("autodoc", "Creates a parabola from a non persistent one.

Parameters
----------
Prb: gp_Parab2d

Returns
-------
None
") GCE2d_MakeParabola;
		 GCE2d_MakeParabola(const gp_Parab2d & Prb);

		/****************** GCE2d_MakeParabola ******************/
		%feature("compactdefaultargs") GCE2d_MakeParabola;
		%feature("autodoc", "Creates a parabola with its local coordinate system and it's focal length 'focal'. the 'location' point of 'axis' is the vertex of the parabola status is 'negativefocuslength' if focal < 0.0.

Parameters
----------
Axis: gp_Ax22d
Focal: float

Returns
-------
None
") GCE2d_MakeParabola;
		 GCE2d_MakeParabola(const gp_Ax22d & Axis, const Standard_Real Focal);

		/****************** GCE2d_MakeParabola ******************/
		%feature("compactdefaultargs") GCE2d_MakeParabola;
		%feature("autodoc", "Creates a parabola with its 'mirroraxis' and it's focal length 'focal'. mirroraxis is the axis of symmetry of the curve, it is the 'xaxis'. the 'yaxis' is parallel to the directrix of the parabola. the 'location' point of 'mirroraxis' is the vertex of the parabola status is 'negativefocuslength' if focal < 0.0.

Parameters
----------
MirrorAxis: gp_Ax2d
Focal: float
Sense: bool

Returns
-------
None
") GCE2d_MakeParabola;
		 GCE2d_MakeParabola(const gp_Ax2d & MirrorAxis, const Standard_Real Focal, const Standard_Boolean Sense);

		/****************** GCE2d_MakeParabola ******************/
		%feature("compactdefaultargs") GCE2d_MakeParabola;
		%feature("autodoc", "D is the directrix of the parabola and f the focus point. the symmetry axis 'xaxis' of the parabola is normal to the directrix and pass through the focus point f, but its 'location' point is the vertex of the parabola. the 'yaxis' of the parabola is parallel to d and its 'location' point is the vertex of the parabola.

Parameters
----------
D: gp_Ax2d
F: gp_Pnt2d
Sense: bool,optional
	default value is Standard_True

Returns
-------
None
") GCE2d_MakeParabola;
		 GCE2d_MakeParabola(const gp_Ax2d & D, const gp_Pnt2d & F, const Standard_Boolean Sense = Standard_True);

		/****************** GCE2d_MakeParabola ******************/
		%feature("compactdefaultargs") GCE2d_MakeParabola;
		%feature("autodoc", "Make a parabola with focal point s1 and center o the branch of the parabola returned will have <s1> as focal point the implicit orientation of the parabola is: - the same one as the parabola prb, - the sense defined by the coordinate system axis or the directrix d, - the trigonometric sense if sense is not given or is true, or - the opposite sense if sense is false. warning the makeparabola class does not prevent the construction of a parabola with a null focal distance. if an error occurs (that is, when isdone returns false), the status function returns: - gce_nullfocuslength if focal is less than 0.0, or - gce_nullaxis if points s1 and o are coincident.

Parameters
----------
S1: gp_Pnt2d
O: gp_Pnt2d

Returns
-------
None
") GCE2d_MakeParabola;
		 GCE2d_MakeParabola(const gp_Pnt2d & S1, const gp_Pnt2d & O);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed parabola. exceptions stdfail_notdone if no parabola is constructed.

Returns
-------
opencascade::handle<Geom2d_Parabola>
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
		/****************** GCE2d_MakeSegment ******************/
		%feature("compactdefaultargs") GCE2d_MakeSegment;
		%feature("autodoc", "Make a segment of line from the 2 points <p1> and <p2>. status is 'confusedpoints' if <p1> and <p2> are confused.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") GCE2d_MakeSegment;
		 GCE2d_MakeSegment(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** GCE2d_MakeSegment ******************/
		%feature("compactdefaultargs") GCE2d_MakeSegment;
		%feature("autodoc", "Make a segment of line from the point <p1> with the direction <p> and ended by the projection of <p2> on the line <p1,v>. status is 'confusedpoints' if <p1> and <p2> are confused.

Parameters
----------
P1: gp_Pnt2d
V: gp_Dir2d
P2: gp_Pnt2d

Returns
-------
None
") GCE2d_MakeSegment;
		 GCE2d_MakeSegment(const gp_Pnt2d & P1, const gp_Dir2d & V, const gp_Pnt2d & P2);

		/****************** GCE2d_MakeSegment ******************/
		%feature("compactdefaultargs") GCE2d_MakeSegment;
		%feature("autodoc", "Make a segment of line from the line <line> between the two parameters u1 and u2. status is 'sameparamters' if <u1> is equal <u2>.

Parameters
----------
Line: gp_Lin2d
U1: float
U2: float

Returns
-------
None
") GCE2d_MakeSegment;
		 GCE2d_MakeSegment(const gp_Lin2d & Line, const Standard_Real U1, const Standard_Real U2);

		/****************** GCE2d_MakeSegment ******************/
		%feature("compactdefaultargs") GCE2d_MakeSegment;
		%feature("autodoc", "Make a segment of line from the line <line> between the point <point> and the parameter ulast. it returns nullobject if <u1> is equal <u2>.

Parameters
----------
Line: gp_Lin2d
Point: gp_Pnt2d
Ulast: float

Returns
-------
None
") GCE2d_MakeSegment;
		 GCE2d_MakeSegment(const gp_Lin2d & Line, const gp_Pnt2d & Point, const Standard_Real Ulast);

		/****************** GCE2d_MakeSegment ******************/
		%feature("compactdefaultargs") GCE2d_MakeSegment;
		%feature("autodoc", "Make a segment of line from the line <line> between the two points <p1> and <p2>. it returns nullobject if <p1> and <p2> are confused. warning if the points which limit the segment are coincident for given points or for the projection of given points on the line which supports the line segment (that is, when isdone returns false), the status function returns gce_confusedpoints. this warning only concerns the first two constructors.

Parameters
----------
Line: gp_Lin2d
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") GCE2d_MakeSegment;
		 GCE2d_MakeSegment(const gp_Lin2d & Line, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed line segment. exceptions stdfail_notdone if no line segment is constructed.

Returns
-------
opencascade::handle<Geom2d_TrimmedCurve>
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
