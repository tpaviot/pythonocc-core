/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
/* public enums */
/* end public enums declaration */

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
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", ":param Point:
	:type Point: gp_Pnt
	:rtype: None") GC_MakeMirror;
		 GC_MakeMirror (const gp_Pnt & Point);

		/****************** GC_MakeMirror ******************/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", ":param Axis:
	:type Axis: gp_Ax1
	:rtype: None") GC_MakeMirror;
		 GC_MakeMirror (const gp_Ax1 & Axis);

		/****************** GC_MakeMirror ******************/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", ":param Line:
	:type Line: gp_Lin
	:rtype: None") GC_MakeMirror;
		 GC_MakeMirror (const gp_Lin & Line);

		/****************** GC_MakeMirror ******************/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "* Make a symetry transformation af axis defined by <Point> and <Direc>.
	:param Point:
	:type Point: gp_Pnt
	:param Direc:
	:type Direc: gp_Dir
	:rtype: None") GC_MakeMirror;
		 GC_MakeMirror (const gp_Pnt & Point,const gp_Dir & Direc);

		/****************** GC_MakeMirror ******************/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "* Make a symetry transformation of plane <Plane>.
	:param Plane:
	:type Plane: gp_Pln
	:rtype: None") GC_MakeMirror;
		 GC_MakeMirror (const gp_Pln & Plane);

		/****************** GC_MakeMirror ******************/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "* Make a symetry transformation of plane <Plane>.
	:param Plane:
	:type Plane: gp_Ax2
	:rtype: None") GC_MakeMirror;
		 GC_MakeMirror (const gp_Ax2 & Plane);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed transformation.
	:rtype: opencascade::handle<Geom_Transformation>") Value;
		const opencascade::handle<Geom_Transformation> & Value ();

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
		%feature("compactdefaultargs") GC_MakeRotation;
		%feature("autodoc", "* Constructs a rotation through angle Angle about the axis defined by the line Line.
	:param Line:
	:type Line: gp_Lin
	:param Angle:
	:type Angle: float
	:rtype: None") GC_MakeRotation;
		 GC_MakeRotation (const gp_Lin & Line,const Standard_Real Angle);

		/****************** GC_MakeRotation ******************/
		%feature("compactdefaultargs") GC_MakeRotation;
		%feature("autodoc", "* Constructs a rotation through angle Angle about the axis defined by the axis Axis.
	:param Axis:
	:type Axis: gp_Ax1
	:param Angle:
	:type Angle: float
	:rtype: None") GC_MakeRotation;
		 GC_MakeRotation (const gp_Ax1 & Axis,const Standard_Real Angle);

		/****************** GC_MakeRotation ******************/
		%feature("compactdefaultargs") GC_MakeRotation;
		%feature("autodoc", "* Constructs a rotation through angle Angle about the axis defined by the point Point and the unit vector Direc.
	:param Point:
	:type Point: gp_Pnt
	:param Direc:
	:type Direc: gp_Dir
	:param Angle:
	:type Angle: float
	:rtype: None") GC_MakeRotation;
		 GC_MakeRotation (const gp_Pnt & Point,const gp_Dir & Direc,const Standard_Real Angle);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed transformation.
	:rtype: opencascade::handle<Geom_Transformation>") Value;
		const opencascade::handle<Geom_Transformation> & Value ();

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
		%feature("compactdefaultargs") GC_MakeScale;
		%feature("autodoc", "* Constructs a scaling transformation with - Point as the center of the transformation, and - Scale as the scale factor.
	:param Point:
	:type Point: gp_Pnt
	:param Scale:
	:type Scale: float
	:rtype: None") GC_MakeScale;
		 GC_MakeScale (const gp_Pnt & Point,const Standard_Real Scale);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed transformation.
	:rtype: opencascade::handle<Geom_Transformation>") Value;
		const opencascade::handle<Geom_Transformation> & Value ();

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
		%feature("compactdefaultargs") GC_MakeTranslation;
		%feature("autodoc", "* Constructs a translation along the vector ' Vect '
	:param Vect:
	:type Vect: gp_Vec
	:rtype: None") GC_MakeTranslation;
		 GC_MakeTranslation (const gp_Vec & Vect);

		/****************** GC_MakeTranslation ******************/
		%feature("compactdefaultargs") GC_MakeTranslation;
		%feature("autodoc", "* Constructs a translation along the vector (Point1,Point2) defined from the point Point1 to the point Point2.
	:param Point1:
	:type Point1: gp_Pnt
	:param Point2:
	:type Point2: gp_Pnt
	:rtype: None") GC_MakeTranslation;
		 GC_MakeTranslation (const gp_Pnt & Point1,const gp_Pnt & Point2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed transformation.
	:rtype: opencascade::handle<Geom_Transformation>") Value;
		const opencascade::handle<Geom_Transformation> & Value ();

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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns true if the construction is successful.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns the status of the construction: - gce_Done, if the construction is successful, or - another value of the gce_ErrorType enumeration indicating why the construction failed.
	:rtype: gce_ErrorType") Status;
		gce_ErrorType Status ();

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
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "* Make an arc of circle (TrimmedCurve from Geom) from a circle between two angles Alpha1 and Alpha2 given in radiians.
	:param Circ:
	:type Circ: gp_Circ
	:param Alpha1:
	:type Alpha1: float
	:param Alpha2:
	:type Alpha2: float
	:param Sense:
	:type Sense: bool
	:rtype: None") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle (const gp_Circ & Circ,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Boolean Sense);

		/****************** GC_MakeArcOfCircle ******************/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "* Make an arc of circle (TrimmedCurve from Geom) from a circle between point <P> and the angle Alpha given in radians.
	:param Circ:
	:type Circ: gp_Circ
	:param P:
	:type P: gp_Pnt
	:param Alpha:
	:type Alpha: float
	:param Sense:
	:type Sense: bool
	:rtype: None") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle (const gp_Circ & Circ,const gp_Pnt & P,const Standard_Real Alpha,const Standard_Boolean Sense);

		/****************** GC_MakeArcOfCircle ******************/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "* Make an arc of circle (TrimmedCurve from Geom) from a circle between two points P1 and P2.
	:param Circ:
	:type Circ: gp_Circ
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param Sense:
	:type Sense: bool
	:rtype: None") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle (const gp_Circ & Circ,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Boolean Sense);

		/****************** GC_MakeArcOfCircle ******************/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "* Make an arc of circle (TrimmedCurve from Geom) from three points P1,P2,P3 between two points P1 and P2.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:rtype: None") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3);

		/****************** GC_MakeArcOfCircle ******************/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "* Make an arc of circle (TrimmedCurve from Geom) from two points P1,P2 and the tangente to the solution at the point P1. The orientation of the arc is: - the sense determined by the order of the points P1, P3 and P2; - the sense defined by the vector V; or - for other syntaxes: - the sense of Circ if Sense is true, or - the opposite sense if Sense is false. Note: Alpha1, Alpha2 and Alpha are angle values, given in radians. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_ConfusedPoints if: - any 2 of the 3 points P1, P2 and P3 are coincident, or - P1 and P2 are coincident; or - gce_IntersectionError if: - P1, P2 and P3 are collinear and not coincident, or - the vector defined by the points P1 and P2 is collinear with the vector V.
	:param P1:
	:type P1: gp_Pnt
	:param V:
	:type V: gp_Vec
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle (const gp_Pnt & P1,const gp_Vec & V,const gp_Pnt & P2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed arc of circle. Exceptions StdFail_NotDone if no arc of circle is constructed.
	:rtype: opencascade::handle<Geom_TrimmedCurve>") Value;
		const opencascade::handle<Geom_TrimmedCurve> & Value ();

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
		%feature("compactdefaultargs") GC_MakeArcOfEllipse;
		%feature("autodoc", "* Constructs an arc of Ellipse (TrimmedCurve from Geom) from a Ellipse between two parameters Alpha1 and Alpha2.
	:param Elips:
	:type Elips: gp_Elips
	:param Alpha1:
	:type Alpha1: float
	:param Alpha2:
	:type Alpha2: float
	:param Sense:
	:type Sense: bool
	:rtype: None") GC_MakeArcOfEllipse;
		 GC_MakeArcOfEllipse (const gp_Elips & Elips,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Boolean Sense);

		/****************** GC_MakeArcOfEllipse ******************/
		%feature("compactdefaultargs") GC_MakeArcOfEllipse;
		%feature("autodoc", "* Constructs an arc of Ellipse (TrimmedCurve from Geom) from a Ellipse between point <P> and the angle Alpha given in radians.
	:param Elips:
	:type Elips: gp_Elips
	:param P:
	:type P: gp_Pnt
	:param Alpha:
	:type Alpha: float
	:param Sense:
	:type Sense: bool
	:rtype: None") GC_MakeArcOfEllipse;
		 GC_MakeArcOfEllipse (const gp_Elips & Elips,const gp_Pnt & P,const Standard_Real Alpha,const Standard_Boolean Sense);

		/****************** GC_MakeArcOfEllipse ******************/
		%feature("compactdefaultargs") GC_MakeArcOfEllipse;
		%feature("autodoc", "* Constructs an arc of Ellipse (TrimmedCurve from Geom) from a Ellipse between two points P1 and P2. The orientation of the arc of ellipse is: - the sense of Elips if Sense is true, or - the opposite sense if Sense is false. Notes: - Alpha1, Alpha2 and Alpha are angle values, given in radians. - IsDone always returns true.
	:param Elips:
	:type Elips: gp_Elips
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param Sense:
	:type Sense: bool
	:rtype: None") GC_MakeArcOfEllipse;
		 GC_MakeArcOfEllipse (const gp_Elips & Elips,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Boolean Sense);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed arc of ellipse.
	:rtype: opencascade::handle<Geom_TrimmedCurve>") Value;
		const opencascade::handle<Geom_TrimmedCurve> & Value ();

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
		%feature("compactdefaultargs") GC_MakeArcOfHyperbola;
		%feature("autodoc", "* Creates an arc of Hyperbola (TrimmedCurve from Geom) from a Hyperbola between two parameters Alpha1 and Alpha2 (given in radians).
	:param Hypr:
	:type Hypr: gp_Hypr
	:param Alpha1:
	:type Alpha1: float
	:param Alpha2:
	:type Alpha2: float
	:param Sense:
	:type Sense: bool
	:rtype: None") GC_MakeArcOfHyperbola;
		 GC_MakeArcOfHyperbola (const gp_Hypr & Hypr,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Boolean Sense);

		/****************** GC_MakeArcOfHyperbola ******************/
		%feature("compactdefaultargs") GC_MakeArcOfHyperbola;
		%feature("autodoc", "* Creates an arc of Hyperbola (TrimmedCurve from Geom) from a Hyperbola between point <P> and the parameter Alpha (given in radians).
	:param Hypr:
	:type Hypr: gp_Hypr
	:param P:
	:type P: gp_Pnt
	:param Alpha:
	:type Alpha: float
	:param Sense:
	:type Sense: bool
	:rtype: None") GC_MakeArcOfHyperbola;
		 GC_MakeArcOfHyperbola (const gp_Hypr & Hypr,const gp_Pnt & P,const Standard_Real Alpha,const Standard_Boolean Sense);

		/****************** GC_MakeArcOfHyperbola ******************/
		%feature("compactdefaultargs") GC_MakeArcOfHyperbola;
		%feature("autodoc", "* Creates an arc of Hyperbola (TrimmedCurve from Geom) from a Hyperbola between two points P1 and P2. The orientation of the arc of hyperbola is: - the sense of Hypr if Sense is true, or - the opposite sense if Sense is false.
	:param Hypr:
	:type Hypr: gp_Hypr
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param Sense:
	:type Sense: bool
	:rtype: None") GC_MakeArcOfHyperbola;
		 GC_MakeArcOfHyperbola (const gp_Hypr & Hypr,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Boolean Sense);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed arc of hyperbola.
	:rtype: opencascade::handle<Geom_TrimmedCurve>") Value;
		const opencascade::handle<Geom_TrimmedCurve> & Value ();

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
		%feature("compactdefaultargs") GC_MakeArcOfParabola;
		%feature("autodoc", "* Creates an arc of Parabola (TrimmedCurve from Geom) from a Parabola between two parameters Alpha1 and Alpha2 (given in radians).
	:param Parab:
	:type Parab: gp_Parab
	:param Alpha1:
	:type Alpha1: float
	:param Alpha2:
	:type Alpha2: float
	:param Sense:
	:type Sense: bool
	:rtype: None") GC_MakeArcOfParabola;
		 GC_MakeArcOfParabola (const gp_Parab & Parab,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Boolean Sense);

		/****************** GC_MakeArcOfParabola ******************/
		%feature("compactdefaultargs") GC_MakeArcOfParabola;
		%feature("autodoc", "* Creates an arc of Parabola (TrimmedCurve from Geom) from a Parabola between point <P> and the parameter Alpha (given in radians).
	:param Parab:
	:type Parab: gp_Parab
	:param P:
	:type P: gp_Pnt
	:param Alpha:
	:type Alpha: float
	:param Sense:
	:type Sense: bool
	:rtype: None") GC_MakeArcOfParabola;
		 GC_MakeArcOfParabola (const gp_Parab & Parab,const gp_Pnt & P,const Standard_Real Alpha,const Standard_Boolean Sense);

		/****************** GC_MakeArcOfParabola ******************/
		%feature("compactdefaultargs") GC_MakeArcOfParabola;
		%feature("autodoc", "* Creates an arc of Parabola (TrimmedCurve from Geom) from a Parabola between two points P1 and P2.
	:param Parab:
	:type Parab: gp_Parab
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param Sense:
	:type Sense: bool
	:rtype: None") GC_MakeArcOfParabola;
		 GC_MakeArcOfParabola (const gp_Parab & Parab,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Boolean Sense);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed arc of parabola.
	:rtype: opencascade::handle<Geom_TrimmedCurve>") Value;
		const opencascade::handle<Geom_TrimmedCurve> & Value ();

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
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "* creates a circle from a non persistent circle C by its conversion.
	:param C:
	:type C: gp_Circ
	:rtype: None") GC_MakeCircle;
		 GC_MakeCircle (const gp_Circ & C);

		/****************** GC_MakeCircle ******************/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "* A2 is the local coordinates system of the circle. It is not forbidden to create a circle with Radius = 0.0 Status is 'NegativeRadius' if Radius < 0.
	:param A2:
	:type A2: gp_Ax2
	:param Radius:
	:type Radius: float
	:rtype: None") GC_MakeCircle;
		 GC_MakeCircle (const gp_Ax2 & A2,const Standard_Real Radius);

		/****************** GC_MakeCircle ******************/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "* Make a Circle from Geom <TheCirc> parallel to another Circ <Circ> with a distance <Dist>. If Dist is greater than zero the result is enclosing the circle <Circ>, else the result is enclosed by the circle <Circ>.
	:param Circ:
	:type Circ: gp_Circ
	:param Dist:
	:type Dist: float
	:rtype: None") GC_MakeCircle;
		 GC_MakeCircle (const gp_Circ & Circ,const Standard_Real Dist);

		/****************** GC_MakeCircle ******************/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "* Make a Circle from Geom <TheCirc> parallel to another Circ <Circ> and passing through a Pnt <Point>.
	:param Circ:
	:type Circ: gp_Circ
	:param Point:
	:type Point: gp_Pnt
	:rtype: None") GC_MakeCircle;
		 GC_MakeCircle (const gp_Circ & Circ,const gp_Pnt & Point);

		/****************** GC_MakeCircle ******************/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "* Make a Circ from gp <TheCirc> passing through 3 Pnt2d <P1>,<P2>,<P3>.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:rtype: None") GC_MakeCircle;
		 GC_MakeCircle (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3);

		/****************** GC_MakeCircle ******************/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "* Make a Circle from Geom <TheCirc> with its center <Center> and the normal of its plane <Norm> and its radius <Radius>.
	:param Center:
	:type Center: gp_Pnt
	:param Norm:
	:type Norm: gp_Dir
	:param Radius:
	:type Radius: float
	:rtype: None") GC_MakeCircle;
		 GC_MakeCircle (const gp_Pnt & Center,const gp_Dir & Norm,const Standard_Real Radius);

		/****************** GC_MakeCircle ******************/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "* Make a Circle from Geom <TheCirc> with its center <Center> and the normal of its plane defined by the two points <Center> and <PtAxis> and its radius <Radius>.
	:param Center:
	:type Center: gp_Pnt
	:param PtAxis:
	:type PtAxis: gp_Pnt
	:param Radius:
	:type Radius: float
	:rtype: None") GC_MakeCircle;
		 GC_MakeCircle (const gp_Pnt & Center,const gp_Pnt & PtAxis,const Standard_Real Radius);

		/****************** GC_MakeCircle ******************/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "* Make a Circle from Geom <TheCirc> with its center <Center> and its radius <Radius>.
	:param Axis:
	:type Axis: gp_Ax1
	:param Radius:
	:type Radius: float
	:rtype: None") GC_MakeCircle;
		 GC_MakeCircle (const gp_Ax1 & Axis,const Standard_Real Radius);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed circle. Exceptions StdFail_NotDone if no circle is constructed.
	:rtype: opencascade::handle<Geom_Circle>") Value;
		const opencascade::handle<Geom_Circle> & Value ();

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
		%feature("compactdefaultargs") GC_MakeConicalSurface;
		%feature("autodoc", "* A2 defines the local coordinate system of the conical surface. Ang is the conical surface semi-angle ]0, PI/2[. Radius is the radius of the circle Viso in the placement plane of the conical surface defined with 'XAxis' and 'YAxis'. The 'ZDirection' of A2 defines the direction of the surface's axis of symmetry. If the location point of A2 is the apex of the surface Radius = 0 . At the creation the parametrization of the surface is defined such that the normal Vector (N = D1U ^ D1V) is oriented towards the 'outside region' of the surface. Status is 'NegativeRadius' if Radius < 0.0 or 'BadAngle' if Ang < Resolution from gp or Ang >= PI/ - Resolution
	:param A2:
	:type A2: gp_Ax2
	:param Ang:
	:type Ang: float
	:param Radius:
	:type Radius: float
	:rtype: None") GC_MakeConicalSurface;
		 GC_MakeConicalSurface (const gp_Ax2 & A2,const Standard_Real Ang,const Standard_Real Radius);

		/****************** GC_MakeConicalSurface ******************/
		%feature("compactdefaultargs") GC_MakeConicalSurface;
		%feature("autodoc", "* Creates a ConicalSurface from a non persistent Cone from package gp.
	:param C:
	:type C: gp_Cone
	:rtype: None") GC_MakeConicalSurface;
		 GC_MakeConicalSurface (const gp_Cone & C);

		/****************** GC_MakeConicalSurface ******************/
		%feature("compactdefaultargs") GC_MakeConicalSurface;
		%feature("autodoc", "* Make a ConicalSurface from Geom <TheCone> passing through 3 Pnt <P1>,<P2>,<P3>. Its axis is <P1P2> and the radius of its base is the distance between <P3> and <P1P2>. The distance between <P4> and <P1P2> is the radius of the section passing through <P4>. An error iss raised if <P1>,<P2>,<P3>,<P4> are colinear or if <P3P4> is perpendicular to <P1P2> or <P3P4> is colinear to <P1P2>.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:param P4:
	:type P4: gp_Pnt
	:rtype: None") GC_MakeConicalSurface;
		 GC_MakeConicalSurface (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const gp_Pnt & P4);

		/****************** GC_MakeConicalSurface ******************/
		%feature("compactdefaultargs") GC_MakeConicalSurface;
		%feature("autodoc", "* Make a ConicalSurface with two points and two radius. The axis of the solution is the line passing through <P1> and <P2>. <R1> is the radius of the section passing through <P1> and <R2> the radius of the section passing through <P2>.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:rtype: None") GC_MakeConicalSurface;
		 GC_MakeConicalSurface (const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real R1,const Standard_Real R2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed cone. Exceptions StdFail_NotDone if no cone is constructed.
	:rtype: opencascade::handle<Geom_ConicalSurface>") Value;
		const opencascade::handle<Geom_ConicalSurface> & Value ();

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
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "* A2 defines the local coordinate system of the cylindrical surface. The 'ZDirection' of A2 defines the direction of the surface's axis of symmetry. At the creation the parametrization of the surface is defined such that the normal Vector (N = D1U ^ D1V) is oriented towards the 'outside region' of the surface. Warnings : It is not forbidden to create a cylindrical surface with Radius = 0.0 Status is 'NegativeRadius' if Radius < 0.0
	:param A2:
	:type A2: gp_Ax2
	:param Radius:
	:type Radius: float
	:rtype: None") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface (const gp_Ax2 & A2,const Standard_Real Radius);

		/****************** GC_MakeCylindricalSurface ******************/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "* Creates a CylindricalSurface from a non persistent Cylinder from package gp.
	:param C:
	:type C: gp_Cylinder
	:rtype: None") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface (const gp_Cylinder & C);

		/****************** GC_MakeCylindricalSurface ******************/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "* Make a CylindricalSurface from Geom <TheCylinder> parallel to another CylindricalSurface <Cylinder> and passing through a Pnt <Point>.
	:param Cyl:
	:type Cyl: gp_Cylinder
	:param Point:
	:type Point: gp_Pnt
	:rtype: None") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface (const gp_Cylinder & Cyl,const gp_Pnt & Point);

		/****************** GC_MakeCylindricalSurface ******************/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "* Make a CylindricalSurface from Geom <TheCylinder> parallel to another CylindricalSurface <Cylinder> at the distance <Dist> which can be greater or lower than zero. The radius of the result is the absolute value of the radius of <Cyl> plus <Dist>
	:param Cyl:
	:type Cyl: gp_Cylinder
	:param Dist:
	:type Dist: float
	:rtype: None") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface (const gp_Cylinder & Cyl,const Standard_Real Dist);

		/****************** GC_MakeCylindricalSurface ******************/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "* Make a CylindricalSurface from Geom <TheCylinder> passing through 3 Pnt <P1>,<P2>,<P3>. Its axis is <P1P2> and its radius is the distance between <P3> and <P1P2>
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:rtype: None") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3);

		/****************** GC_MakeCylindricalSurface ******************/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "* Make a CylindricalSurface by its axis <Axis> and radius <Radius>.
	:param Axis:
	:type Axis: gp_Ax1
	:param Radius:
	:type Radius: float
	:rtype: None") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface (const gp_Ax1 & Axis,const Standard_Real Radius);

		/****************** GC_MakeCylindricalSurface ******************/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "* Make a CylindricalSurface by its circular base.
	:param Circ:
	:type Circ: gp_Circ
	:rtype: None") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface (const gp_Circ & Circ);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed cylinder. Exceptions StdFail_NotDone if no cylinder is constructed.
	:rtype: opencascade::handle<Geom_CylindricalSurface>") Value;
		const opencascade::handle<Geom_CylindricalSurface> & Value ();

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
		%feature("compactdefaultargs") GC_MakeEllipse;
		%feature("autodoc", "* Creates an ellipse from a non persistent ellipse E from package gp by its conversion.
	:param E:
	:type E: gp_Elips
	:rtype: None") GC_MakeEllipse;
		 GC_MakeEllipse (const gp_Elips & E);

		/****************** GC_MakeEllipse ******************/
		%feature("compactdefaultargs") GC_MakeEllipse;
		%feature("autodoc", "* Constructs an ellipse with major and minor radii MajorRadius and MinorRadius, and located in the plane defined by the 'X Axis' and 'Y Axis' of the coordinate system A2, where: - its center is the origin of A2, and - its major axis is the 'X Axis' of A2; Warnings : The MakeEllipse class does not prevent the construction of an ellipse where MajorRadius is equal to MinorRadius. If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_InvertRadius if MajorRadius is less than MinorRadius; - gce_NegativeRadius if MinorRadius is less than 0.0; - gce_NullAxis if the points S1 and Center are coincident; or - gce_InvertAxis if: - the major radius computed with Center and S1 is less than the minor radius computed with Center, S1 and S2, or - Center, S1 and S2 are collinear.
	:param A2:
	:type A2: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None") GC_MakeEllipse;
		 GC_MakeEllipse (const gp_Ax2 & A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);

		/****************** GC_MakeEllipse ******************/
		%feature("compactdefaultargs") GC_MakeEllipse;
		%feature("autodoc", "* Constructs an ellipse centered on the point Center, where - the plane of the ellipse is defined by Center, S1 and S2, - its major axis is defined by Center and S1, - its major radius is the distance between Center and S1, and - its minor radius is the distance between S2 and the major axis.
	:param S1:
	:type S1: gp_Pnt
	:param S2:
	:type S2: gp_Pnt
	:param Center:
	:type Center: gp_Pnt
	:rtype: None") GC_MakeEllipse;
		 GC_MakeEllipse (const gp_Pnt & S1,const gp_Pnt & S2,const gp_Pnt & Center);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed ellipse. Exceptions StdFail_NotDone if no ellipse is constructed.
	:rtype: opencascade::handle<Geom_Ellipse>") Value;
		const opencascade::handle<Geom_Ellipse> & Value ();

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
		%feature("compactdefaultargs") GC_MakeHyperbola;
		%feature("autodoc", "* Creates an Hyperbola from a non persistent hyperbola from package gp by conversion.
	:param H:
	:type H: gp_Hypr
	:rtype: None") GC_MakeHyperbola;
		 GC_MakeHyperbola (const gp_Hypr & H);

		/****************** GC_MakeHyperbola ******************/
		%feature("compactdefaultargs") GC_MakeHyperbola;
		%feature("autodoc", "* Constructs a hyperbola centered on the origin of the coordinate system A2, with major and minor radii MajorRadius and MinorRadius, where: the plane of the hyperbola is defined by the 'X Axis' and 'Y Axis' of A2, - its major axis is the 'X Axis' of A2.
	:param A2:
	:type A2: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None") GC_MakeHyperbola;
		 GC_MakeHyperbola (const gp_Ax2 & A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);

		/****************** GC_MakeHyperbola ******************/
		%feature("compactdefaultargs") GC_MakeHyperbola;
		%feature("autodoc", "* Constructs a hyperbola centered on the point Center, where - the plane of the hyperbola is defined by Center, S1 and S2, - its major axis is defined by Center and S1, - its major radius is the distance between Center and S1, and - its minor radius is the distance between S2 and the major axis;
	:param S1:
	:type S1: gp_Pnt
	:param S2:
	:type S2: gp_Pnt
	:param Center:
	:type Center: gp_Pnt
	:rtype: None") GC_MakeHyperbola;
		 GC_MakeHyperbola (const gp_Pnt & S1,const gp_Pnt & S2,const gp_Pnt & Center);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed hyperbola. Exceptions StdFail_NotDone if no hyperbola is constructed.
	:rtype: opencascade::handle<Geom_Hyperbola>") Value;
		const opencascade::handle<Geom_Hyperbola> & Value ();

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
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "* Creates a line located in 3D space with the axis placement A1. The Location of A1 is the origin of the line.
	:param A1:
	:type A1: gp_Ax1
	:rtype: None") GC_MakeLine;
		 GC_MakeLine (const gp_Ax1 & A1);

		/****************** GC_MakeLine ******************/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "* Creates a line from a non persistent line from package gp.
	:param L:
	:type L: gp_Lin
	:rtype: None") GC_MakeLine;
		 GC_MakeLine (const gp_Lin & L);

		/****************** GC_MakeLine ******************/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "* P is the origin and V is the direction of the line.
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Dir
	:rtype: None") GC_MakeLine;
		 GC_MakeLine (const gp_Pnt & P,const gp_Dir & V);

		/****************** GC_MakeLine ******************/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "* Make a Line from Geom <TheLin> parallel to another Lin <Lin> and passing through a Pnt <Point>.
	:param Lin:
	:type Lin: gp_Lin
	:param Point:
	:type Point: gp_Pnt
	:rtype: None") GC_MakeLine;
		 GC_MakeLine (const gp_Lin & Lin,const gp_Pnt & Point);

		/****************** GC_MakeLine ******************/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "* Make a Line from Geom <TheLin> passing through 2 Pnt <P1>,<P2>. It returns false if <p1> and <P2> are confused. Warning If the points P1 and P2 are coincident (that is, when IsDone returns false), the Status function returns gce_ConfusedPoints.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") GC_MakeLine;
		 GC_MakeLine (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed line. Exceptions StdFail_NotDone if no line is constructed.
	:rtype: opencascade::handle<Geom_Line>") Value;
		const opencascade::handle<Geom_Line> & Value ();

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
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "* Creates a plane from a non persistent plane from package gp.
	:param Pl:
	:type Pl: gp_Pln
	:rtype: None") GC_MakePlane;
		 GC_MakePlane (const gp_Pln & Pl);

		/****************** GC_MakePlane ******************/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "* P is the 'Location' point or origin of the plane. V is the direction normal to the plane.
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Dir
	:rtype: None") GC_MakePlane;
		 GC_MakePlane (const gp_Pnt & P,const gp_Dir & V);

		/****************** GC_MakePlane ******************/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "* Creates a plane from its cartesian equation : Ax + By + Cz + D = 0.0 Status is 'BadEquation' if Sqrt (A*A + B*B + C*C) <= Resolution from gp
	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:param D:
	:type D: float
	:rtype: None") GC_MakePlane;
		 GC_MakePlane (const Standard_Real A,const Standard_Real B,const Standard_Real C,const Standard_Real D);

		/****************** GC_MakePlane ******************/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "* Make a Plane from Geom <ThePlane> parallel to another Pln <Pln> and passing through a Pnt <Point>.
	:param Pln:
	:type Pln: gp_Pln
	:param Point:
	:type Point: gp_Pnt
	:rtype: None") GC_MakePlane;
		 GC_MakePlane (const gp_Pln & Pln,const gp_Pnt & Point);

		/****************** GC_MakePlane ******************/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "* Make a Plane from Geom <ThePlane> parallel to another Pln <Pln> at the distance <Dist> which can be greater or lower than zero. In the first case the result is at the distance <Dist> to the plane <Pln> in the direction of the normal to <Pln>. Otherwize it is in the oposite direction.
	:param Pln:
	:type Pln: gp_Pln
	:param Dist:
	:type Dist: float
	:rtype: None") GC_MakePlane;
		 GC_MakePlane (const gp_Pln & Pln,const Standard_Real Dist);

		/****************** GC_MakePlane ******************/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "* Make a Plane from Geom <ThePlane> passing through 3 Pnt <P1>,<P2>,<P3>. It returns false if <P1> <P2> <P3> are confused.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:rtype: None") GC_MakePlane;
		 GC_MakePlane (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3);

		/****************** GC_MakePlane ******************/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "* Make a Plane passing through the location of <Axis>and normal to the Direction of <Axis>.
	:param Axis:
	:type Axis: gp_Ax1
	:rtype: None") GC_MakePlane;
		 GC_MakePlane (const gp_Ax1 & Axis);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed plane. Exceptions StdFail_NotDone if no plane is constructed.
	:rtype: opencascade::handle<Geom_Plane>") Value;
		const opencascade::handle<Geom_Plane> & Value ();

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
		%feature("compactdefaultargs") GC_MakeSegment;
		%feature("autodoc", "* Make a segment of Line from the 2 points <P1> and <P2>. It returns NullObject if <P1> and <P2> are confused.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") GC_MakeSegment;
		 GC_MakeSegment (const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** GC_MakeSegment ******************/
		%feature("compactdefaultargs") GC_MakeSegment;
		%feature("autodoc", "* Make a segment of Line from the line <Line1> between the two parameters U1 and U2. It returns NullObject if <U1> is equal <U2>.
	:param Line:
	:type Line: gp_Lin
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None") GC_MakeSegment;
		 GC_MakeSegment (const gp_Lin & Line,const Standard_Real U1,const Standard_Real U2);

		/****************** GC_MakeSegment ******************/
		%feature("compactdefaultargs") GC_MakeSegment;
		%feature("autodoc", "* Make a segment of Line from the line <Line1> between the point <Point> and the parameter Ulast. It returns NullObject if <U1> is equal <U2>.
	:param Line:
	:type Line: gp_Lin
	:param Point:
	:type Point: gp_Pnt
	:param Ulast:
	:type Ulast: float
	:rtype: None") GC_MakeSegment;
		 GC_MakeSegment (const gp_Lin & Line,const gp_Pnt & Point,const Standard_Real Ulast);

		/****************** GC_MakeSegment ******************/
		%feature("compactdefaultargs") GC_MakeSegment;
		%feature("autodoc", "* Make a segment of Line from the line <Line1> between the two points <P1> and <P2>. It returns NullObject if <U1> is equal <U2>.
	:param Line:
	:type Line: gp_Lin
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None") GC_MakeSegment;
		 GC_MakeSegment (const gp_Lin & Line,const gp_Pnt & P1,const gp_Pnt & P2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed line segment.
	:rtype: opencascade::handle<Geom_TrimmedCurve>") Value;
		const opencascade::handle<Geom_TrimmedCurve> & Value ();

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
		%feature("compactdefaultargs") GC_MakeTrimmedCone;
		%feature("autodoc", "* Make a RectangularTrimmedSurface <TheCone> from Geom It is trimmed by P3 and P4. Its axis is <P1P2> and the radius of its base is the distance between <P3> and <P1P2>. The distance between <P4> and <P1P2> is the radius of the section passing through <P4>. An error iss raised if <P1>,<P2>,<P3>,<P4> are colinear or if <P3P4> is perpendicular to <P1P2> or <P3P4> is colinear to <P1P2>.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:param P4:
	:type P4: gp_Pnt
	:rtype: None") GC_MakeTrimmedCone;
		 GC_MakeTrimmedCone (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const gp_Pnt & P4);

		/****************** GC_MakeTrimmedCone ******************/
		%feature("compactdefaultargs") GC_MakeTrimmedCone;
		%feature("autodoc", "* Make a RectangularTrimmedSurface from Geom <TheCone> from a cone and trimmed by two points P1 and P2 and the two radius <R1> and <R2> of the sections passing through <P1> an <P2>. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_ConfusedPoints if points P1 and P2, or P3 and P4, are coincident; - gce_NullAngle if: - the lines joining P1 to P2 and P3 to P4 are parallel, or - R1 and R2 are equal (i.e. their difference is less than gp::Resolution()); - gce_NullRadius if: - the line joining P1 to P2 is perpendicular to the line joining P3 to P4, or - the points P1, P2, P3 and P4 are collinear; - gce_NegativeRadius if R1 or R2 is negative; or - gce_NullAxis if points P1 and P2 are coincident (2nd syntax only).
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:rtype: None") GC_MakeTrimmedCone;
		 GC_MakeTrimmedCone (const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real R1,const Standard_Real R2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed trimmed cone. StdFail_NotDone if no trimmed cone is constructed.
	:rtype: opencascade::handle<Geom_RectangularTrimmedSurface>") Value;
		const opencascade::handle<Geom_RectangularTrimmedSurface> & Value ();

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
		%feature("compactdefaultargs") GC_MakeTrimmedCylinder;
		%feature("autodoc", "* Make a cylindricalSurface <Cyl> from Geom Its axis is is <P1P2> and its radius is the distance between <P3> and <P1P2>. The height is the distance between P1 and P2.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:rtype: None") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3);

		/****************** GC_MakeTrimmedCylinder ******************/
		%feature("compactdefaultargs") GC_MakeTrimmedCylinder;
		%feature("autodoc", "* Make a cylindricalSurface <Cyl> from gp by its base <Circ>. Its axis is the normal to the plane defined bi <Circ>. <Height> can be greater than zero or lower than zero. In the first case the V parametric direction of the result has the same orientation as the normal to <Circ>. In the other case it has the opposite orientation.
	:param Circ:
	:type Circ: gp_Circ
	:param Height:
	:type Height: float
	:rtype: None") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder (const gp_Circ & Circ,const Standard_Real Height);

		/****************** GC_MakeTrimmedCylinder ******************/
		%feature("compactdefaultargs") GC_MakeTrimmedCylinder;
		%feature("autodoc", "* Make a cylindricalSurface <Cyl> from gp by its axis <A1> and its radius <Radius>. It returns NullObject if <Radius> is lower than zero. <Height> can be greater than zero or lower than zero. In the first case the V parametric direction of the result has the same orientation as <A1>. In the other case it has the opposite orientation.
	:param A1:
	:type A1: gp_Ax1
	:param Radius:
	:type Radius: float
	:param Height:
	:type Height: float
	:rtype: None") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder (const gp_Ax1 & A1,const Standard_Real Radius,const Standard_Real Height);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the constructed trimmed cylinder. Exceptions StdFail_NotDone if no trimmed cylinder is constructed.
	:rtype: opencascade::handle<Geom_RectangularTrimmedSurface>") Value;
		const opencascade::handle<Geom_RectangularTrimmedSurface> & Value ();

};


%extend GC_MakeTrimmedCylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
