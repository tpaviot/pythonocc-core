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
%define GCDOCSTRING
"GC module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_gc.html"
%enddef
%module (package="OCC.Core", docstring=GCDOCSTRING) GC


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
#include<GC_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<gce_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import Geom.i
%import gce.i

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

/**********************
* class GC_MakeMirror *
**********************/
class GC_MakeMirror {
	public:
		/****************** GC_MakeMirror ******************/
		/**** md5 signature: 4311459e0214c0a7b53c35f9337a2309 ****/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
Point: gp_Pnt

Returns
-------
None
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Pnt & Point);

		/****************** GC_MakeMirror ******************/
		/**** md5 signature: da6c4c63d585c2342d618c33b07a24b5 ****/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
Axis: gp_Ax1

Returns
-------
None
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Ax1 & Axis);

		/****************** GC_MakeMirror ******************/
		/**** md5 signature: e4b11ea90cbc9c91d8a1311be35fe6c9 ****/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "No available documentation.

Parameters
----------
Line: gp_Lin

Returns
-------
None
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Lin & Line);

		/****************** GC_MakeMirror ******************/
		/**** md5 signature: 82477fa581c9380b0d7767eaecc42a9e ****/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "Make a symetry transformation af axis defined by <point> and <direc>.

Parameters
----------
Point: gp_Pnt
Direc: gp_Dir

Returns
-------
None
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Pnt & Point, const gp_Dir & Direc);

		/****************** GC_MakeMirror ******************/
		/**** md5 signature: 9c37a175b190c4d1aab7333ace288f71 ****/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "Make a symetry transformation of plane <plane>.

Parameters
----------
Plane: gp_Pln

Returns
-------
None
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Pln & Plane);

		/****************** GC_MakeMirror ******************/
		/**** md5 signature: 766d8b90ffc81811b7dc77c2db8faa2a ****/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "Make a symetry transformation of plane <plane>.

Parameters
----------
Plane: gp_Ax2

Returns
-------
None
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Ax2 & Plane);

		/****************** Value ******************/
		/**** md5 signature: 1a83265d766adbc039817098a76cd59b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed transformation.

Returns
-------
opencascade::handle<Geom_Transformation>
") Value;
		const opencascade::handle<Geom_Transformation> & Value();

};


%extend GC_MakeMirror {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class GC_MakeRotation *
************************/
class GC_MakeRotation {
	public:
		/****************** GC_MakeRotation ******************/
		/**** md5 signature: 1765104abd0cdd0afa27aafed65a0dfc ****/
		%feature("compactdefaultargs") GC_MakeRotation;
		%feature("autodoc", "Constructs a rotation through angle angle about the axis defined by the line line.

Parameters
----------
Line: gp_Lin
Angle: float

Returns
-------
None
") GC_MakeRotation;
		 GC_MakeRotation(const gp_Lin & Line, const Standard_Real Angle);

		/****************** GC_MakeRotation ******************/
		/**** md5 signature: 7c0f63046d3b37a345929b4b6b54b691 ****/
		%feature("compactdefaultargs") GC_MakeRotation;
		%feature("autodoc", "Constructs a rotation through angle angle about the axis defined by the axis axis.

Parameters
----------
Axis: gp_Ax1
Angle: float

Returns
-------
None
") GC_MakeRotation;
		 GC_MakeRotation(const gp_Ax1 & Axis, const Standard_Real Angle);

		/****************** GC_MakeRotation ******************/
		/**** md5 signature: 3668684ecffcd705e86f1f5c5d8c1a53 ****/
		%feature("compactdefaultargs") GC_MakeRotation;
		%feature("autodoc", "Constructs a rotation through angle angle about the axis defined by the point point and the unit vector direc.

Parameters
----------
Point: gp_Pnt
Direc: gp_Dir
Angle: float

Returns
-------
None
") GC_MakeRotation;
		 GC_MakeRotation(const gp_Pnt & Point, const gp_Dir & Direc, const Standard_Real Angle);

		/****************** Value ******************/
		/**** md5 signature: 1a83265d766adbc039817098a76cd59b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed transformation.

Returns
-------
opencascade::handle<Geom_Transformation>
") Value;
		const opencascade::handle<Geom_Transformation> & Value();

};


%extend GC_MakeRotation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class GC_MakeScale *
*********************/
class GC_MakeScale {
	public:
		/****************** GC_MakeScale ******************/
		/**** md5 signature: b4a315c5bb69b1cddb4e9375300fc81f ****/
		%feature("compactdefaultargs") GC_MakeScale;
		%feature("autodoc", "Constructs a scaling transformation with - point as the center of the transformation, and - scale as the scale factor.

Parameters
----------
Point: gp_Pnt
Scale: float

Returns
-------
None
") GC_MakeScale;
		 GC_MakeScale(const gp_Pnt & Point, const Standard_Real Scale);

		/****************** Value ******************/
		/**** md5 signature: 1a83265d766adbc039817098a76cd59b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed transformation.

Returns
-------
opencascade::handle<Geom_Transformation>
") Value;
		const opencascade::handle<Geom_Transformation> & Value();

};


%extend GC_MakeScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GC_MakeTranslation *
***************************/
class GC_MakeTranslation {
	public:
		/****************** GC_MakeTranslation ******************/
		/**** md5 signature: 2ecafa69e0feb6eb9807638e7ae093e5 ****/
		%feature("compactdefaultargs") GC_MakeTranslation;
		%feature("autodoc", "Constructs a translation along the vector ' vect '.

Parameters
----------
Vect: gp_Vec

Returns
-------
None
") GC_MakeTranslation;
		 GC_MakeTranslation(const gp_Vec & Vect);

		/****************** GC_MakeTranslation ******************/
		/**** md5 signature: cf623b294dad005de8d58dc719b5e33a ****/
		%feature("compactdefaultargs") GC_MakeTranslation;
		%feature("autodoc", "Constructs a translation along the vector (point1,point2) defined from the point point1 to the point point2.

Parameters
----------
Point1: gp_Pnt
Point2: gp_Pnt

Returns
-------
None
") GC_MakeTranslation;
		 GC_MakeTranslation(const gp_Pnt & Point1, const gp_Pnt & Point2);

		/****************** Value ******************/
		/**** md5 signature: 1a83265d766adbc039817098a76cd59b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed transformation.

Returns
-------
opencascade::handle<Geom_Transformation>
") Value;
		const opencascade::handle<Geom_Transformation> & Value();

};


%extend GC_MakeTranslation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class GC_Root *
****************/
class GC_Root {
	public:
		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the construction is successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Status ******************/
		/**** md5 signature: 40beeec4d25ee1f3f94752c410640458 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the status of the construction: - gce_done, if the construction is successful, or - another value of the gce_errortype enumeration indicating why the construction failed.

Returns
-------
gce_ErrorType
") Status;
		gce_ErrorType Status();

};


%extend GC_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GC_MakeArcOfCircle *
***************************/
class GC_MakeArcOfCircle : public GC_Root {
	public:
		/****************** GC_MakeArcOfCircle ******************/
		/**** md5 signature: 30e8a9ca82703ba5154ffd7bf27cee70 ****/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "Make an arc of circle (trimmedcurve from geom) from a circle between two angles alpha1 and alpha2 given in radiians.

Parameters
----------
Circ: gp_Circ
Alpha1: float
Alpha2: float
Sense: bool

Returns
-------
None
") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle(const gp_Circ & Circ, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Boolean Sense);

		/****************** GC_MakeArcOfCircle ******************/
		/**** md5 signature: e6312b97d8ad17e1f4e9acd1c11f7c06 ****/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "Make an arc of circle (trimmedcurve from geom) from a circle between point <p> and the angle alpha given in radians.

Parameters
----------
Circ: gp_Circ
P: gp_Pnt
Alpha: float
Sense: bool

Returns
-------
None
") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle(const gp_Circ & Circ, const gp_Pnt & P, const Standard_Real Alpha, const Standard_Boolean Sense);

		/****************** GC_MakeArcOfCircle ******************/
		/**** md5 signature: ba4088e1b0aa2e46be5e35d94effcfe4 ****/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "Make an arc of circle (trimmedcurve from geom) from a circle between two points p1 and p2.

Parameters
----------
Circ: gp_Circ
P1: gp_Pnt
P2: gp_Pnt
Sense: bool

Returns
-------
None
") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle(const gp_Circ & Circ, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Boolean Sense);

		/****************** GC_MakeArcOfCircle ******************/
		/**** md5 signature: 574e8d8f067835a7e74a7f96dc77747f ****/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "Make an arc of circle (trimmedcurve from geom) from three points p1,p2,p3 between two points p1 and p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt

Returns
-------
None
") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****************** GC_MakeArcOfCircle ******************/
		/**** md5 signature: 8245008bc55947236ffc2c9ef009f69d ****/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "Make an arc of circle (trimmedcurve from geom) from two points p1,p2 and the tangente to the solution at the point p1. the orientation of the arc is: - the sense determined by the order of the points p1, p3 and p2; - the sense defined by the vector v; or - for other syntaxes: - the sense of circ if sense is true, or - the opposite sense if sense is false. note: alpha1, alpha2 and alpha are angle values, given in radians. warning if an error occurs (that is, when isdone returns false), the status function returns: - gce_confusedpoints if: - any 2 of the 3 points p1, p2 and p3 are coincident, or - p1 and p2 are coincident; or - gce_intersectionerror if: - p1, p2 and p3 are collinear and not coincident, or - the vector defined by the points p1 and p2 is collinear with the vector v.

Parameters
----------
P1: gp_Pnt
V: gp_Vec
P2: gp_Pnt

Returns
-------
None
") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle(const gp_Pnt & P1, const gp_Vec & V, const gp_Pnt & P2);

		/****************** Value ******************/
		/**** md5 signature: d45b23dd256c842f7b4edfb35b6253b1 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed arc of circle. exceptions stdfail_notdone if no arc of circle is constructed.

Returns
-------
opencascade::handle<Geom_TrimmedCurve>
") Value;
		const opencascade::handle<Geom_TrimmedCurve> & Value();

};


%extend GC_MakeArcOfCircle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GC_MakeArcOfEllipse *
****************************/
class GC_MakeArcOfEllipse : public GC_Root {
	public:
		/****************** GC_MakeArcOfEllipse ******************/
		/**** md5 signature: bc818a82cbde6e9b174a657b1c67ecd5 ****/
		%feature("compactdefaultargs") GC_MakeArcOfEllipse;
		%feature("autodoc", "Constructs an arc of ellipse (trimmedcurve from geom) from a ellipse between two parameters alpha1 and alpha2.

Parameters
----------
Elips: gp_Elips
Alpha1: float
Alpha2: float
Sense: bool

Returns
-------
None
") GC_MakeArcOfEllipse;
		 GC_MakeArcOfEllipse(const gp_Elips & Elips, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Boolean Sense);

		/****************** GC_MakeArcOfEllipse ******************/
		/**** md5 signature: 4b511d828d8843fe955c104fe9db98b7 ****/
		%feature("compactdefaultargs") GC_MakeArcOfEllipse;
		%feature("autodoc", "Constructs an arc of ellipse (trimmedcurve from geom) from a ellipse between point <p> and the angle alpha given in radians.

Parameters
----------
Elips: gp_Elips
P: gp_Pnt
Alpha: float
Sense: bool

Returns
-------
None
") GC_MakeArcOfEllipse;
		 GC_MakeArcOfEllipse(const gp_Elips & Elips, const gp_Pnt & P, const Standard_Real Alpha, const Standard_Boolean Sense);

		/****************** GC_MakeArcOfEllipse ******************/
		/**** md5 signature: a50ac9698484354ba153b97e864a0d8b ****/
		%feature("compactdefaultargs") GC_MakeArcOfEllipse;
		%feature("autodoc", "Constructs an arc of ellipse (trimmedcurve from geom) from a ellipse between two points p1 and p2. the orientation of the arc of ellipse is: - the sense of elips if sense is true, or - the opposite sense if sense is false. notes: - alpha1, alpha2 and alpha are angle values, given in radians. - isdone always returns true.

Parameters
----------
Elips: gp_Elips
P1: gp_Pnt
P2: gp_Pnt
Sense: bool

Returns
-------
None
") GC_MakeArcOfEllipse;
		 GC_MakeArcOfEllipse(const gp_Elips & Elips, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Boolean Sense);

		/****************** Value ******************/
		/**** md5 signature: d45b23dd256c842f7b4edfb35b6253b1 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed arc of ellipse.

Returns
-------
opencascade::handle<Geom_TrimmedCurve>
") Value;
		const opencascade::handle<Geom_TrimmedCurve> & Value();

};


%extend GC_MakeArcOfEllipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GC_MakeArcOfHyperbola *
******************************/
class GC_MakeArcOfHyperbola : public GC_Root {
	public:
		/****************** GC_MakeArcOfHyperbola ******************/
		/**** md5 signature: 3e0efa2a82bd4f5bf226f1afb70fb36d ****/
		%feature("compactdefaultargs") GC_MakeArcOfHyperbola;
		%feature("autodoc", "Creates an arc of hyperbola (trimmedcurve from geom) from a hyperbola between two parameters alpha1 and alpha2 (given in radians).

Parameters
----------
Hypr: gp_Hypr
Alpha1: float
Alpha2: float
Sense: bool

Returns
-------
None
") GC_MakeArcOfHyperbola;
		 GC_MakeArcOfHyperbola(const gp_Hypr & Hypr, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Boolean Sense);

		/****************** GC_MakeArcOfHyperbola ******************/
		/**** md5 signature: a451983b0e51ea5828e265132a233542 ****/
		%feature("compactdefaultargs") GC_MakeArcOfHyperbola;
		%feature("autodoc", "Creates an arc of hyperbola (trimmedcurve from geom) from a hyperbola between point <p> and the parameter alpha (given in radians).

Parameters
----------
Hypr: gp_Hypr
P: gp_Pnt
Alpha: float
Sense: bool

Returns
-------
None
") GC_MakeArcOfHyperbola;
		 GC_MakeArcOfHyperbola(const gp_Hypr & Hypr, const gp_Pnt & P, const Standard_Real Alpha, const Standard_Boolean Sense);

		/****************** GC_MakeArcOfHyperbola ******************/
		/**** md5 signature: 87149aba63ae1ff0790f39bd6fac5ae7 ****/
		%feature("compactdefaultargs") GC_MakeArcOfHyperbola;
		%feature("autodoc", "Creates an arc of hyperbola (trimmedcurve from geom) from a hyperbola between two points p1 and p2. the orientation of the arc of hyperbola is: - the sense of hypr if sense is true, or - the opposite sense if sense is false.

Parameters
----------
Hypr: gp_Hypr
P1: gp_Pnt
P2: gp_Pnt
Sense: bool

Returns
-------
None
") GC_MakeArcOfHyperbola;
		 GC_MakeArcOfHyperbola(const gp_Hypr & Hypr, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Boolean Sense);

		/****************** Value ******************/
		/**** md5 signature: d45b23dd256c842f7b4edfb35b6253b1 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed arc of hyperbola.

Returns
-------
opencascade::handle<Geom_TrimmedCurve>
") Value;
		const opencascade::handle<Geom_TrimmedCurve> & Value();

};


%extend GC_MakeArcOfHyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GC_MakeArcOfParabola *
*****************************/
class GC_MakeArcOfParabola : public GC_Root {
	public:
		/****************** GC_MakeArcOfParabola ******************/
		/**** md5 signature: 66fdb4d30102127cd02ffcff5bcca44c ****/
		%feature("compactdefaultargs") GC_MakeArcOfParabola;
		%feature("autodoc", "Creates an arc of parabola (trimmedcurve from geom) from a parabola between two parameters alpha1 and alpha2 (given in radians).

Parameters
----------
Parab: gp_Parab
Alpha1: float
Alpha2: float
Sense: bool

Returns
-------
None
") GC_MakeArcOfParabola;
		 GC_MakeArcOfParabola(const gp_Parab & Parab, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Boolean Sense);

		/****************** GC_MakeArcOfParabola ******************/
		/**** md5 signature: 287fa288d9f59b7da052bfc850bb72de ****/
		%feature("compactdefaultargs") GC_MakeArcOfParabola;
		%feature("autodoc", "Creates an arc of parabola (trimmedcurve from geom) from a parabola between point <p> and the parameter alpha (given in radians).

Parameters
----------
Parab: gp_Parab
P: gp_Pnt
Alpha: float
Sense: bool

Returns
-------
None
") GC_MakeArcOfParabola;
		 GC_MakeArcOfParabola(const gp_Parab & Parab, const gp_Pnt & P, const Standard_Real Alpha, const Standard_Boolean Sense);

		/****************** GC_MakeArcOfParabola ******************/
		/**** md5 signature: e72defc0c6d3d7bafcc006bd2ca1003f ****/
		%feature("compactdefaultargs") GC_MakeArcOfParabola;
		%feature("autodoc", "Creates an arc of parabola (trimmedcurve from geom) from a parabola between two points p1 and p2.

Parameters
----------
Parab: gp_Parab
P1: gp_Pnt
P2: gp_Pnt
Sense: bool

Returns
-------
None
") GC_MakeArcOfParabola;
		 GC_MakeArcOfParabola(const gp_Parab & Parab, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Boolean Sense);

		/****************** Value ******************/
		/**** md5 signature: d45b23dd256c842f7b4edfb35b6253b1 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed arc of parabola.

Returns
-------
opencascade::handle<Geom_TrimmedCurve>
") Value;
		const opencascade::handle<Geom_TrimmedCurve> & Value();

};


%extend GC_MakeArcOfParabola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class GC_MakeCircle *
**********************/
class GC_MakeCircle : public GC_Root {
	public:
		/****************** GC_MakeCircle ******************/
		/**** md5 signature: bf1d9b54e186c9b8b436e33de033e771 ****/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "Creates a circle from a non persistent circle c by its conversion.

Parameters
----------
C: gp_Circ

Returns
-------
None
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Circ & C);

		/****************** GC_MakeCircle ******************/
		/**** md5 signature: 9c55b4ab7f72a76ac6e9254ced8b490d ****/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "A2 is the local coordinates system of the circle. it is not forbidden to create a circle with radius = 0.0 status is 'negativeradius' if radius < 0.

Parameters
----------
A2: gp_Ax2
Radius: float

Returns
-------
None
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Ax2 & A2, const Standard_Real Radius);

		/****************** GC_MakeCircle ******************/
		/**** md5 signature: 21e84db06da749ac9abd5d8fad8435bb ****/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "Make a circle from geom <thecirc> parallel to another circ <circ> with a distance <dist>. if dist is greater than zero the result is enclosing the circle <circ>, else the result is enclosed by the circle <circ>.

Parameters
----------
Circ: gp_Circ
Dist: float

Returns
-------
None
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Circ & Circ, const Standard_Real Dist);

		/****************** GC_MakeCircle ******************/
		/**** md5 signature: 2ff08626b4fe5d90a6c735fe8e4f4979 ****/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "Make a circle from geom <thecirc> parallel to another circ <circ> and passing through a pnt <point>.

Parameters
----------
Circ: gp_Circ
Point: gp_Pnt

Returns
-------
None
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Circ & Circ, const gp_Pnt & Point);

		/****************** GC_MakeCircle ******************/
		/**** md5 signature: 8f5645e1e1c74cef187d3abe3d016533 ****/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "Make a circ from gp <thecirc> passing through 3 pnt2d <p1>,<p2>,<p3>.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt

Returns
-------
None
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****************** GC_MakeCircle ******************/
		/**** md5 signature: 030732eacfec23e3a7bb821045dee1b5 ****/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "Make a circle from geom <thecirc> with its center <center> and the normal of its plane <norm> and its radius <radius>.

Parameters
----------
Center: gp_Pnt
Norm: gp_Dir
Radius: float

Returns
-------
None
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Pnt & Center, const gp_Dir & Norm, const Standard_Real Radius);

		/****************** GC_MakeCircle ******************/
		/**** md5 signature: 1f91d718891e58d456fd714ae6aee2b9 ****/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "Make a circle from geom <thecirc> with its center <center> and the normal of its plane defined by the two points <center> and <ptaxis> and its radius <radius>.

Parameters
----------
Center: gp_Pnt
PtAxis: gp_Pnt
Radius: float

Returns
-------
None
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Pnt & Center, const gp_Pnt & PtAxis, const Standard_Real Radius);

		/****************** GC_MakeCircle ******************/
		/**** md5 signature: a828fca3b2a6e5cfef246c0b7a642706 ****/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "Make a circle from geom <thecirc> with its center <center> and its radius <radius>.

Parameters
----------
Axis: gp_Ax1
Radius: float

Returns
-------
None
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Ax1 & Axis, const Standard_Real Radius);

		/****************** Value ******************/
		/**** md5 signature: 77b780fd65868a33ad4a6d8ee9ea9e45 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed circle. exceptions stdfail_notdone if no circle is constructed.

Returns
-------
opencascade::handle<Geom_Circle>
") Value;
		const opencascade::handle<Geom_Circle> & Value();

};


%extend GC_MakeCircle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GC_MakeConicalSurface *
******************************/
class GC_MakeConicalSurface : public GC_Root {
	public:
		/****************** GC_MakeConicalSurface ******************/
		/**** md5 signature: cfb9674f81e2288d7b44b7d4eae667ee ****/
		%feature("compactdefaultargs") GC_MakeConicalSurface;
		%feature("autodoc", "A2 defines the local coordinate system of the conical surface. ang is the conical surface semi-angle ]0, pi/2[. radius is the radius of the circle viso in the placement plane of the conical surface defined with 'xaxis' and 'yaxis'. the 'zdirection' of a2 defines the direction of the surface's axis of symmetry. if the location point of a2 is the apex of the surface radius = 0 . at the creation the parametrization of the surface is defined such that the normal vector (n = d1u ^ d1v) is oriented towards the 'outside region' of the surface. status is 'negativeradius' if radius < 0.0 or 'badangle' if ang < resolution from gp or ang >= pi/ - resolution.

Parameters
----------
A2: gp_Ax2
Ang: float
Radius: float

Returns
-------
None
") GC_MakeConicalSurface;
		 GC_MakeConicalSurface(const gp_Ax2 & A2, const Standard_Real Ang, const Standard_Real Radius);

		/****************** GC_MakeConicalSurface ******************/
		/**** md5 signature: 63f26b85de46e7fd7463b2976b75566a ****/
		%feature("compactdefaultargs") GC_MakeConicalSurface;
		%feature("autodoc", "Creates a conicalsurface from a non persistent cone from package gp.

Parameters
----------
C: gp_Cone

Returns
-------
None
") GC_MakeConicalSurface;
		 GC_MakeConicalSurface(const gp_Cone & C);

		/****************** GC_MakeConicalSurface ******************/
		/**** md5 signature: c00bebc8a821a4bc8009bae5d4e76b24 ****/
		%feature("compactdefaultargs") GC_MakeConicalSurface;
		%feature("autodoc", "Make a conicalsurface from geom <thecone> passing through 3 pnt <p1>,<p2>,<p3>. its axis is <p1p2> and the radius of its base is the distance between <p3> and <p1p2>. the distance between <p4> and <p1p2> is the radius of the section passing through <p4>. an error iss raised if <p1>,<p2>,<p3>,<p4> are colinear or if <p3p4> is perpendicular to <p1p2> or <p3p4> is colinear to <p1p2>.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt
P4: gp_Pnt

Returns
-------
None
") GC_MakeConicalSurface;
		 GC_MakeConicalSurface(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const gp_Pnt & P4);

		/****************** GC_MakeConicalSurface ******************/
		/**** md5 signature: 95accac2de950972779691b2d0f9b0a0 ****/
		%feature("compactdefaultargs") GC_MakeConicalSurface;
		%feature("autodoc", "Make a conicalsurface with two points and two radius. the axis of the solution is the line passing through <p1> and <p2>. <r1> is the radius of the section passing through <p1> and <r2> the radius of the section passing through <p2>.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
R1: float
R2: float

Returns
-------
None
") GC_MakeConicalSurface;
		 GC_MakeConicalSurface(const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real R1, const Standard_Real R2);

		/****************** Value ******************/
		/**** md5 signature: f76b9d8ce2fb13effc98c77c09194361 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed cone. exceptions stdfail_notdone if no cone is constructed.

Returns
-------
opencascade::handle<Geom_ConicalSurface>
") Value;
		const opencascade::handle<Geom_ConicalSurface> & Value();

};


%extend GC_MakeConicalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GC_MakeCylindricalSurface *
**********************************/
class GC_MakeCylindricalSurface : public GC_Root {
	public:
		/****************** GC_MakeCylindricalSurface ******************/
		/**** md5 signature: 9d6564a69da63d5aad643855b3a14cb5 ****/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "A2 defines the local coordinate system of the cylindrical surface. the 'zdirection' of a2 defines the direction of the surface's axis of symmetry. at the creation the parametrization of the surface is defined such that the normal vector (n = d1u ^ d1v) is oriented towards the 'outside region' of the surface. warnings : it is not forbidden to create a cylindrical surface with radius = 0.0 status is 'negativeradius' if radius < 0.0.

Parameters
----------
A2: gp_Ax2
Radius: float

Returns
-------
None
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Ax2 & A2, const Standard_Real Radius);

		/****************** GC_MakeCylindricalSurface ******************/
		/**** md5 signature: c3a3ce94b3937ca6164e66579c13560f ****/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "Creates a cylindricalsurface from a non persistent cylinder from package gp.

Parameters
----------
C: gp_Cylinder

Returns
-------
None
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Cylinder & C);

		/****************** GC_MakeCylindricalSurface ******************/
		/**** md5 signature: 032b9f0c7a3695d93dba75f2475721cb ****/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "Make a cylindricalsurface from geom <thecylinder> parallel to another cylindricalsurface <cylinder> and passing through a pnt <point>.

Parameters
----------
Cyl: gp_Cylinder
Point: gp_Pnt

Returns
-------
None
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Cylinder & Cyl, const gp_Pnt & Point);

		/****************** GC_MakeCylindricalSurface ******************/
		/**** md5 signature: 7c05efbce55a2940aafb508e1e8bdfb2 ****/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "Make a cylindricalsurface from geom <thecylinder> parallel to another cylindricalsurface <cylinder> at the distance <dist> which can be greater or lower than zero. the radius of the result is the absolute value of the radius of <cyl> plus <dist>.

Parameters
----------
Cyl: gp_Cylinder
Dist: float

Returns
-------
None
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Cylinder & Cyl, const Standard_Real Dist);

		/****************** GC_MakeCylindricalSurface ******************/
		/**** md5 signature: cc01067acc2874528a6fde4ebf7f24bd ****/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "Make a cylindricalsurface from geom <thecylinder> passing through 3 pnt <p1>,<p2>,<p3>. its axis is <p1p2> and its radius is the distance between <p3> and <p1p2>.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt

Returns
-------
None
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****************** GC_MakeCylindricalSurface ******************/
		/**** md5 signature: cb7506cb7b97b13f417dc69f32d2281e ****/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "Make a cylindricalsurface by its axis <axis> and radius <radius>.

Parameters
----------
Axis: gp_Ax1
Radius: float

Returns
-------
None
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Ax1 & Axis, const Standard_Real Radius);

		/****************** GC_MakeCylindricalSurface ******************/
		/**** md5 signature: 419948e40d3ee771cbcd4acea450f00f ****/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "Make a cylindricalsurface by its circular base.

Parameters
----------
Circ: gp_Circ

Returns
-------
None
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Circ & Circ);

		/****************** Value ******************/
		/**** md5 signature: 30dd9d137690c70664962cf877a84f99 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed cylinder. exceptions stdfail_notdone if no cylinder is constructed.

Returns
-------
opencascade::handle<Geom_CylindricalSurface>
") Value;
		const opencascade::handle<Geom_CylindricalSurface> & Value();

};


%extend GC_MakeCylindricalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class GC_MakeEllipse *
***********************/
class GC_MakeEllipse : public GC_Root {
	public:
		/****************** GC_MakeEllipse ******************/
		/**** md5 signature: 672721cf4b0b74836f8f38bc560d4bc4 ****/
		%feature("compactdefaultargs") GC_MakeEllipse;
		%feature("autodoc", "Creates an ellipse from a non persistent ellipse e from package gp by its conversion.

Parameters
----------
E: gp_Elips

Returns
-------
None
") GC_MakeEllipse;
		 GC_MakeEllipse(const gp_Elips & E);

		/****************** GC_MakeEllipse ******************/
		/**** md5 signature: 23e9e1b201d3ff1f63c11bceaf464a35 ****/
		%feature("compactdefaultargs") GC_MakeEllipse;
		%feature("autodoc", "Constructs an ellipse with major and minor radii majorradius and minorradius, and located in the plane defined by the 'x axis' and 'y axis' of the coordinate system a2, where: - its center is the origin of a2, and - its major axis is the 'x axis' of a2; warnings : the makeellipse class does not prevent the construction of an ellipse where majorradius is equal to minorradius. if an error occurs (that is, when isdone returns false), the status function returns: - gce_invertradius if majorradius is less than minorradius; - gce_negativeradius if minorradius is less than 0.0; - gce_nullaxis if the points s1 and center are coincident; or - gce_invertaxis if: - the major radius computed with center and s1 is less than the minor radius computed with center, s1 and s2, or - center, s1 and s2 are collinear.

Parameters
----------
A2: gp_Ax2
MajorRadius: float
MinorRadius: float

Returns
-------
None
") GC_MakeEllipse;
		 GC_MakeEllipse(const gp_Ax2 & A2, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** GC_MakeEllipse ******************/
		/**** md5 signature: cbf116c8e2d3fd951305a96b4b370863 ****/
		%feature("compactdefaultargs") GC_MakeEllipse;
		%feature("autodoc", "Constructs an ellipse centered on the point center, where - the plane of the ellipse is defined by center, s1 and s2, - its major axis is defined by center and s1, - its major radius is the distance between center and s1, and - its minor radius is the distance between s2 and the major axis.

Parameters
----------
S1: gp_Pnt
S2: gp_Pnt
Center: gp_Pnt

Returns
-------
None
") GC_MakeEllipse;
		 GC_MakeEllipse(const gp_Pnt & S1, const gp_Pnt & S2, const gp_Pnt & Center);

		/****************** Value ******************/
		/**** md5 signature: fe3b3117138e75351b7c9f5b2c0c513e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed ellipse. exceptions stdfail_notdone if no ellipse is constructed.

Returns
-------
opencascade::handle<Geom_Ellipse>
") Value;
		const opencascade::handle<Geom_Ellipse> & Value();

};


%extend GC_MakeEllipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GC_MakeHyperbola *
*************************/
class GC_MakeHyperbola : public GC_Root {
	public:
		/****************** GC_MakeHyperbola ******************/
		/**** md5 signature: 37b62891883cf3372ff78a36b8ddec46 ****/
		%feature("compactdefaultargs") GC_MakeHyperbola;
		%feature("autodoc", "Creates an hyperbola from a non persistent hyperbola from package gp by conversion.

Parameters
----------
H: gp_Hypr

Returns
-------
None
") GC_MakeHyperbola;
		 GC_MakeHyperbola(const gp_Hypr & H);

		/****************** GC_MakeHyperbola ******************/
		/**** md5 signature: 0b321cdf4f8f9dd49e42da4298b504b0 ****/
		%feature("compactdefaultargs") GC_MakeHyperbola;
		%feature("autodoc", "Constructs a hyperbola centered on the origin of the coordinate system a2, with major and minor radii majorradius and minorradius, where: the plane of the hyperbola is defined by the 'x axis' and 'y axis' of a2, - its major axis is the 'x axis' of a2.

Parameters
----------
A2: gp_Ax2
MajorRadius: float
MinorRadius: float

Returns
-------
None
") GC_MakeHyperbola;
		 GC_MakeHyperbola(const gp_Ax2 & A2, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** GC_MakeHyperbola ******************/
		/**** md5 signature: 0c8177d10f741371b63960948615b7f9 ****/
		%feature("compactdefaultargs") GC_MakeHyperbola;
		%feature("autodoc", "Constructs a hyperbola centered on the point center, where - the plane of the hyperbola is defined by center, s1 and s2, - its major axis is defined by center and s1, - its major radius is the distance between center and s1, and - its minor radius is the distance between s2 and the major axis;.

Parameters
----------
S1: gp_Pnt
S2: gp_Pnt
Center: gp_Pnt

Returns
-------
None
") GC_MakeHyperbola;
		 GC_MakeHyperbola(const gp_Pnt & S1, const gp_Pnt & S2, const gp_Pnt & Center);

		/****************** Value ******************/
		/**** md5 signature: 7d3e15d3ad54c1125b9d13b5ee20322c ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed hyperbola. exceptions stdfail_notdone if no hyperbola is constructed.

Returns
-------
opencascade::handle<Geom_Hyperbola>
") Value;
		const opencascade::handle<Geom_Hyperbola> & Value();

};


%extend GC_MakeHyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class GC_MakeLine *
********************/
class GC_MakeLine : public GC_Root {
	public:
		/****************** GC_MakeLine ******************/
		/**** md5 signature: 229d3736e310eb22ccb2a4eda71492ef ****/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "Creates a line located in 3d space with the axis placement a1. the location of a1 is the origin of the line.

Parameters
----------
A1: gp_Ax1

Returns
-------
None
") GC_MakeLine;
		 GC_MakeLine(const gp_Ax1 & A1);

		/****************** GC_MakeLine ******************/
		/**** md5 signature: c62480762270d5c69ffb0534a5b6fce5 ****/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "Creates a line from a non persistent line from package gp.

Parameters
----------
L: gp_Lin

Returns
-------
None
") GC_MakeLine;
		 GC_MakeLine(const gp_Lin & L);

		/****************** GC_MakeLine ******************/
		/**** md5 signature: 9555b5e9e4e29e1e6f3718a6632ee21f ****/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "P is the origin and v is the direction of the line.

Parameters
----------
P: gp_Pnt
V: gp_Dir

Returns
-------
None
") GC_MakeLine;
		 GC_MakeLine(const gp_Pnt & P, const gp_Dir & V);

		/****************** GC_MakeLine ******************/
		/**** md5 signature: 52b54a0bcb566d2e6ab1ffe6a82acad0 ****/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "Make a line from geom <thelin> parallel to another lin <lin> and passing through a pnt <point>.

Parameters
----------
Lin: gp_Lin
Point: gp_Pnt

Returns
-------
None
") GC_MakeLine;
		 GC_MakeLine(const gp_Lin & Lin, const gp_Pnt & Point);

		/****************** GC_MakeLine ******************/
		/**** md5 signature: 6802d12afd883cd3d264cfc3e6ccdfb6 ****/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "Make a line from geom <thelin> passing through 2 pnt <p1>,<p2>. it returns false if <p1> and <p2> are confused. warning if the points p1 and p2 are coincident (that is, when isdone returns false), the status function returns gce_confusedpoints.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") GC_MakeLine;
		 GC_MakeLine(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** Value ******************/
		/**** md5 signature: 5995492bfc97e37ea24602cdfa25a85a ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed line. exceptions stdfail_notdone if no line is constructed.

Returns
-------
opencascade::handle<Geom_Line>
") Value;
		const opencascade::handle<Geom_Line> & Value();

};


%extend GC_MakeLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class GC_MakePlane *
*********************/
class GC_MakePlane : public GC_Root {
	public:
		/****************** GC_MakePlane ******************/
		/**** md5 signature: 4844e6a6d04660e270d526c482e052ac ****/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "Creates a plane from a non persistent plane from package gp.

Parameters
----------
Pl: gp_Pln

Returns
-------
None
") GC_MakePlane;
		 GC_MakePlane(const gp_Pln & Pl);

		/****************** GC_MakePlane ******************/
		/**** md5 signature: ab9fdf2640e0dd0889170a94c3414c8f ****/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "P is the 'location' point or origin of the plane. v is the direction normal to the plane.

Parameters
----------
P: gp_Pnt
V: gp_Dir

Returns
-------
None
") GC_MakePlane;
		 GC_MakePlane(const gp_Pnt & P, const gp_Dir & V);

		/****************** GC_MakePlane ******************/
		/**** md5 signature: 193d69ec1e6408c28a5024023be7c83c ****/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "Creates a plane from its cartesian equation : ax + by + cz + d = 0.0 status is 'badequation' if sqrt (a*a + b*b + c*c) <= resolution from gp.

Parameters
----------
A: float
B: float
C: float
D: float

Returns
-------
None
") GC_MakePlane;
		 GC_MakePlane(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D);

		/****************** GC_MakePlane ******************/
		/**** md5 signature: f12935a136028087a678092a96ca9532 ****/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "Make a plane from geom <theplane> parallel to another pln <pln> and passing through a pnt <point>.

Parameters
----------
Pln: gp_Pln
Point: gp_Pnt

Returns
-------
None
") GC_MakePlane;
		 GC_MakePlane(const gp_Pln & Pln, const gp_Pnt & Point);

		/****************** GC_MakePlane ******************/
		/**** md5 signature: c2a22654c060500d6d24ceefed764443 ****/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "Make a plane from geom <theplane> parallel to another pln <pln> at the distance <dist> which can be greater or lower than zero. in the first case the result is at the distance <dist> to the plane <pln> in the direction of the normal to <pln>. otherwize it is in the oposite direction.

Parameters
----------
Pln: gp_Pln
Dist: float

Returns
-------
None
") GC_MakePlane;
		 GC_MakePlane(const gp_Pln & Pln, const Standard_Real Dist);

		/****************** GC_MakePlane ******************/
		/**** md5 signature: f818b56489b3255c4acbea51511cb4ec ****/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "Make a plane from geom <theplane> passing through 3 pnt <p1>,<p2>,<p3>. it returns false if <p1> <p2> <p3> are confused.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt

Returns
-------
None
") GC_MakePlane;
		 GC_MakePlane(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****************** GC_MakePlane ******************/
		/**** md5 signature: 0f00eef9a9169412fc8912ab7ab6491e ****/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "Make a plane passing through the location of <axis>and normal to the direction of <axis>.

Parameters
----------
Axis: gp_Ax1

Returns
-------
None
") GC_MakePlane;
		 GC_MakePlane(const gp_Ax1 & Axis);

		/****************** Value ******************/
		/**** md5 signature: 2bfa538a32a02e39c814ddb436054f45 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed plane. exceptions stdfail_notdone if no plane is constructed.

Returns
-------
opencascade::handle<Geom_Plane>
") Value;
		const opencascade::handle<Geom_Plane> & Value();

};


%extend GC_MakePlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class GC_MakeSegment *
***********************/
class GC_MakeSegment : public GC_Root {
	public:
		/****************** GC_MakeSegment ******************/
		/**** md5 signature: 9b395bcb8545fc82062801355a3e8819 ****/
		%feature("compactdefaultargs") GC_MakeSegment;
		%feature("autodoc", "Make a segment of line from the 2 points <p1> and <p2>. it returns nullobject if <p1> and <p2> are confused.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") GC_MakeSegment;
		 GC_MakeSegment(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** GC_MakeSegment ******************/
		/**** md5 signature: 76b02f066e95296cf20f26752b97184d ****/
		%feature("compactdefaultargs") GC_MakeSegment;
		%feature("autodoc", "Make a segment of line from the line <line1> between the two parameters u1 and u2. it returns nullobject if <u1> is equal <u2>.

Parameters
----------
Line: gp_Lin
U1: float
U2: float

Returns
-------
None
") GC_MakeSegment;
		 GC_MakeSegment(const gp_Lin & Line, const Standard_Real U1, const Standard_Real U2);

		/****************** GC_MakeSegment ******************/
		/**** md5 signature: 829552b203d5956d86936fcc4dbf875d ****/
		%feature("compactdefaultargs") GC_MakeSegment;
		%feature("autodoc", "Make a segment of line from the line <line1> between the point <point> and the parameter ulast. it returns nullobject if <u1> is equal <u2>.

Parameters
----------
Line: gp_Lin
Point: gp_Pnt
Ulast: float

Returns
-------
None
") GC_MakeSegment;
		 GC_MakeSegment(const gp_Lin & Line, const gp_Pnt & Point, const Standard_Real Ulast);

		/****************** GC_MakeSegment ******************/
		/**** md5 signature: 0aed52f842514f4c8c02d52e88e79195 ****/
		%feature("compactdefaultargs") GC_MakeSegment;
		%feature("autodoc", "Make a segment of line from the line <line1> between the two points <p1> and <p2>. it returns nullobject if <u1> is equal <u2>.

Parameters
----------
Line: gp_Lin
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
None
") GC_MakeSegment;
		 GC_MakeSegment(const gp_Lin & Line, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** Value ******************/
		/**** md5 signature: d45b23dd256c842f7b4edfb35b6253b1 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed line segment.

Returns
-------
opencascade::handle<Geom_TrimmedCurve>
") Value;
		const opencascade::handle<Geom_TrimmedCurve> & Value();

};


%extend GC_MakeSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GC_MakeTrimmedCone *
***************************/
class GC_MakeTrimmedCone : public GC_Root {
	public:
		/****************** GC_MakeTrimmedCone ******************/
		/**** md5 signature: 2fe57e5995bd5d4e8300a1fb92843a49 ****/
		%feature("compactdefaultargs") GC_MakeTrimmedCone;
		%feature("autodoc", "Make a rectangulartrimmedsurface <thecone> from geom it is trimmed by p3 and p4. its axis is <p1p2> and the radius of its base is the distance between <p3> and <p1p2>. the distance between <p4> and <p1p2> is the radius of the section passing through <p4>. an error iss raised if <p1>,<p2>,<p3>,<p4> are colinear or if <p3p4> is perpendicular to <p1p2> or <p3p4> is colinear to <p1p2>.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt
P4: gp_Pnt

Returns
-------
None
") GC_MakeTrimmedCone;
		 GC_MakeTrimmedCone(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const gp_Pnt & P4);

		/****************** GC_MakeTrimmedCone ******************/
		/**** md5 signature: a8a3c8b25092c4c82c44472bf8d190e4 ****/
		%feature("compactdefaultargs") GC_MakeTrimmedCone;
		%feature("autodoc", "Make a rectangulartrimmedsurface from geom <thecone> from a cone and trimmed by two points p1 and p2 and the two radius <r1> and <r2> of the sections passing through <p1> an <p2>. warning if an error occurs (that is, when isdone returns false), the status function returns: - gce_confusedpoints if points p1 and p2, or p3 and p4, are coincident; - gce_nullangle if: - the lines joining p1 to p2 and p3 to p4 are parallel, or - r1 and r2 are equal (i.e. their difference is less than gp::resolution()); - gce_nullradius if: - the line joining p1 to p2 is perpendicular to the line joining p3 to p4, or - the points p1, p2, p3 and p4 are collinear; - gce_negativeradius if r1 or r2 is negative; or - gce_nullaxis if points p1 and p2 are coincident (2nd syntax only).

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
R1: float
R2: float

Returns
-------
None
") GC_MakeTrimmedCone;
		 GC_MakeTrimmedCone(const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real R1, const Standard_Real R2);

		/****************** Value ******************/
		/**** md5 signature: f107db51d7a8f6cc0f22e8dcf1ab2f34 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed trimmed cone. stdfail_notdone if no trimmed cone is constructed.

Returns
-------
opencascade::handle<Geom_RectangularTrimmedSurface>
") Value;
		const opencascade::handle<Geom_RectangularTrimmedSurface> & Value();

};


%extend GC_MakeTrimmedCone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GC_MakeTrimmedCylinder *
*******************************/
class GC_MakeTrimmedCylinder : public GC_Root {
	public:
		/****************** GC_MakeTrimmedCylinder ******************/
		/**** md5 signature: 4a35a8293ea23e9fd492e2bbf18ea8e6 ****/
		%feature("compactdefaultargs") GC_MakeTrimmedCylinder;
		%feature("autodoc", "Make a cylindricalsurface <cyl> from geom its axis is is <p1p2> and its radius is the distance between <p3> and <p1p2>. the height is the distance between p1 and p2.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt

Returns
-------
None
") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****************** GC_MakeTrimmedCylinder ******************/
		/**** md5 signature: 141c9a4e19ce270deff340295d2976db ****/
		%feature("compactdefaultargs") GC_MakeTrimmedCylinder;
		%feature("autodoc", "Make a cylindricalsurface <cyl> from gp by its base <circ>. its axis is the normal to the plane defined bi <circ>. <height> can be greater than zero or lower than zero. in the first case the v parametric direction of the result has the same orientation as the normal to <circ>. in the other case it has the opposite orientation.

Parameters
----------
Circ: gp_Circ
Height: float

Returns
-------
None
") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder(const gp_Circ & Circ, const Standard_Real Height);

		/****************** GC_MakeTrimmedCylinder ******************/
		/**** md5 signature: fb55ef061aaa9ab5bafd04308d80bfbb ****/
		%feature("compactdefaultargs") GC_MakeTrimmedCylinder;
		%feature("autodoc", "Make a cylindricalsurface <cyl> from gp by its axis <a1> and its radius <radius>. it returns nullobject if <radius> is lower than zero. <height> can be greater than zero or lower than zero. in the first case the v parametric direction of the result has the same orientation as <a1>. in the other case it has the opposite orientation.

Parameters
----------
A1: gp_Ax1
Radius: float
Height: float

Returns
-------
None
") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder(const gp_Ax1 & A1, const Standard_Real Radius, const Standard_Real Height);

		/****************** Value ******************/
		/**** md5 signature: f107db51d7a8f6cc0f22e8dcf1ab2f34 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the constructed trimmed cylinder. exceptions stdfail_notdone if no trimmed cylinder is constructed.

Returns
-------
opencascade::handle<Geom_RectangularTrimmedSurface>
") Value;
		const opencascade::handle<Geom_RectangularTrimmedSurface> & Value();

};


%extend GC_MakeTrimmedCylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
