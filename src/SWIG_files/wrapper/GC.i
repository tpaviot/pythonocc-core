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
%define GCDOCSTRING
"GC module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_gc.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/**********************
* class GC_MakeMirror *
**********************/
class GC_MakeMirror {
	public:
		/****** GC_MakeMirror::GC_MakeMirror ******/
		/****** md5 signature: 4311459e0214c0a7b53c35f9337a2309 ******/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Pnt & Point);

		/****** GC_MakeMirror::GC_MakeMirror ******/
		/****** md5 signature: da6c4c63d585c2342d618c33b07a24b5 ******/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Ax1 & Axis);

		/****** GC_MakeMirror::GC_MakeMirror ******/
		/****** md5 signature: e4b11ea90cbc9c91d8a1311be35fe6c9 ******/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "
Parameters
----------
Line: gp_Lin

Return
-------
None

Description
-----------
No available documentation.
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Lin & Line);

		/****** GC_MakeMirror::GC_MakeMirror ******/
		/****** md5 signature: 82477fa581c9380b0d7767eaecc42a9e ******/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt
Direc: gp_Dir

Return
-------
None

Description
-----------
Make a symmetry transformation af axis defined by <Point> and <Direc>.
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Pnt & Point, const gp_Dir & Direc);

		/****** GC_MakeMirror::GC_MakeMirror ******/
		/****** md5 signature: 9c37a175b190c4d1aab7333ace288f71 ******/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "
Parameters
----------
Plane: gp_Pln

Return
-------
None

Description
-----------
Make a symmetry transformation of plane <Plane>.
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Pln & Plane);

		/****** GC_MakeMirror::GC_MakeMirror ******/
		/****** md5 signature: 766d8b90ffc81811b7dc77c2db8faa2a ******/
		%feature("compactdefaultargs") GC_MakeMirror;
		%feature("autodoc", "
Parameters
----------
Plane: gp_Ax2

Return
-------
None

Description
-----------
Make a symmetry transformation of plane <Plane>.
") GC_MakeMirror;
		 GC_MakeMirror(const gp_Ax2 & Plane);

		/****** GC_MakeMirror::Value ******/
		/****** md5 signature: 1a83265d766adbc039817098a76cd59b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Transformation>

Description
-----------
Returns the constructed transformation.
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
		/****** GC_MakeRotation::GC_MakeRotation ******/
		/****** md5 signature: 1765104abd0cdd0afa27aafed65a0dfc ******/
		%feature("compactdefaultargs") GC_MakeRotation;
		%feature("autodoc", "
Parameters
----------
Line: gp_Lin
Angle: float

Return
-------
None

Description
-----------
Constructs a rotation through angle Angle about the axis defined by the line Line.
") GC_MakeRotation;
		 GC_MakeRotation(const gp_Lin & Line, const Standard_Real Angle);

		/****** GC_MakeRotation::GC_MakeRotation ******/
		/****** md5 signature: 7c0f63046d3b37a345929b4b6b54b691 ******/
		%feature("compactdefaultargs") GC_MakeRotation;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1
Angle: float

Return
-------
None

Description
-----------
Constructs a rotation through angle Angle about the axis defined by the axis Axis.
") GC_MakeRotation;
		 GC_MakeRotation(const gp_Ax1 & Axis, const Standard_Real Angle);

		/****** GC_MakeRotation::GC_MakeRotation ******/
		/****** md5 signature: 3668684ecffcd705e86f1f5c5d8c1a53 ******/
		%feature("compactdefaultargs") GC_MakeRotation;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt
Direc: gp_Dir
Angle: float

Return
-------
None

Description
-----------
Constructs a rotation through angle Angle about the axis defined by the point Point and the unit vector Direc.
") GC_MakeRotation;
		 GC_MakeRotation(const gp_Pnt & Point, const gp_Dir & Direc, const Standard_Real Angle);

		/****** GC_MakeRotation::Value ******/
		/****** md5 signature: 1a83265d766adbc039817098a76cd59b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Transformation>

Description
-----------
Returns the constructed transformation.
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
		/****** GC_MakeScale::GC_MakeScale ******/
		/****** md5 signature: b4a315c5bb69b1cddb4e9375300fc81f ******/
		%feature("compactdefaultargs") GC_MakeScale;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt
Scale: float

Return
-------
None

Description
-----------
Constructs a scaling transformation with - Point as the center of the transformation, and - Scale as the scale factor.
") GC_MakeScale;
		 GC_MakeScale(const gp_Pnt & Point, const Standard_Real Scale);

		/****** GC_MakeScale::Value ******/
		/****** md5 signature: 1a83265d766adbc039817098a76cd59b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Transformation>

Description
-----------
Returns the constructed transformation.
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
		/****** GC_MakeTranslation::GC_MakeTranslation ******/
		/****** md5 signature: 2ecafa69e0feb6eb9807638e7ae093e5 ******/
		%feature("compactdefaultargs") GC_MakeTranslation;
		%feature("autodoc", "
Parameters
----------
Vect: gp_Vec

Return
-------
None

Description
-----------
Constructs a translation along the vector ' Vect '.
") GC_MakeTranslation;
		 GC_MakeTranslation(const gp_Vec & Vect);

		/****** GC_MakeTranslation::GC_MakeTranslation ******/
		/****** md5 signature: cf623b294dad005de8d58dc719b5e33a ******/
		%feature("compactdefaultargs") GC_MakeTranslation;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt
Point2: gp_Pnt

Return
-------
None

Description
-----------
Constructs a translation along the vector (Point1,Point2) defined from the point Point1 to the point Point2.
") GC_MakeTranslation;
		 GC_MakeTranslation(const gp_Pnt & Point1, const gp_Pnt & Point2);

		/****** GC_MakeTranslation::Value ******/
		/****** md5 signature: 1a83265d766adbc039817098a76cd59b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Transformation>

Description
-----------
Returns the constructed transformation.
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
		/****** GC_Root::IsDone ******/
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

		/****** GC_Root::Status ******/
		/****** md5 signature: 40beeec4d25ee1f3f94752c410640458 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
gce_ErrorType

Description
-----------
Returns the status of the construction: - gce_Done, if the construction is successful, or - another value of the gce_ErrorType enumeration indicating why the construction failed.
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
		/****** GC_MakeArcOfCircle::GC_MakeArcOfCircle ******/
		/****** md5 signature: 30e8a9ca82703ba5154ffd7bf27cee70 ******/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ
Alpha1: float
Alpha2: float
Sense: bool

Return
-------
None

Description
-----------
Make an arc of circle (TrimmedCurve from Geom) from a circle between two angles Alpha1 and Alpha2 given in radiians.
") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle(const gp_Circ & Circ, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Boolean Sense);

		/****** GC_MakeArcOfCircle::GC_MakeArcOfCircle ******/
		/****** md5 signature: e6312b97d8ad17e1f4e9acd1c11f7c06 ******/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ
P: gp_Pnt
Alpha: float
Sense: bool

Return
-------
None

Description
-----------
Make an arc of circle (TrimmedCurve from Geom) from a circle between point <P> and the angle Alpha given in radians.
") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle(const gp_Circ & Circ, const gp_Pnt & P, const Standard_Real Alpha, const Standard_Boolean Sense);

		/****** GC_MakeArcOfCircle::GC_MakeArcOfCircle ******/
		/****** md5 signature: ba4088e1b0aa2e46be5e35d94effcfe4 ******/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ
P1: gp_Pnt
P2: gp_Pnt
Sense: bool

Return
-------
None

Description
-----------
Make an arc of circle (TrimmedCurve from Geom) from a circle between two points P1 and P2.
") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle(const gp_Circ & Circ, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Boolean Sense);

		/****** GC_MakeArcOfCircle::GC_MakeArcOfCircle ******/
		/****** md5 signature: 574e8d8f067835a7e74a7f96dc77747f ******/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt

Return
-------
None

Description
-----------
Make an arc of circle (TrimmedCurve from Geom) from three points P1,P2,P3 between two points P1 and P2.
") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****** GC_MakeArcOfCircle::GC_MakeArcOfCircle ******/
		/****** md5 signature: 8245008bc55947236ffc2c9ef009f69d ******/
		%feature("compactdefaultargs") GC_MakeArcOfCircle;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
V: gp_Vec
P2: gp_Pnt

Return
-------
None

Description
-----------
Make an arc of circle (TrimmedCurve from Geom) from two points P1,P2 and the tangente to the solution at the point P1. The orientation of the arc is: - the sense determined by the order of the points P1, P3 and P2; - the sense defined by the vector V; or - for other syntaxes: - the sense of Circ if Sense is true, or - the opposite sense if Sense is false. Note: Alpha1, Alpha2 and Alpha are angle values, given in radians. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_ConfusedPoints if: - any 2 of the 3 points P1, P2 and P3 are coincident, or - P1 and P2 are coincident; or - gce_IntersectionError if: - P1, P2 and P3 are collinear and not coincident, or - the vector defined by the points P1 and P2 is collinear with the vector V.
") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle(const gp_Pnt & P1, const gp_Vec & V, const gp_Pnt & P2);

		/****** GC_MakeArcOfCircle::Value ******/
		/****** md5 signature: d45b23dd256c842f7b4edfb35b6253b1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_TrimmedCurve>

Description
-----------
Returns the constructed arc of circle. Exceptions StdFail_NotDone if no arc of circle is constructed.
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
		/****** GC_MakeArcOfEllipse::GC_MakeArcOfEllipse ******/
		/****** md5 signature: bc818a82cbde6e9b174a657b1c67ecd5 ******/
		%feature("compactdefaultargs") GC_MakeArcOfEllipse;
		%feature("autodoc", "
Parameters
----------
Elips: gp_Elips
Alpha1: float
Alpha2: float
Sense: bool

Return
-------
None

Description
-----------
Constructs an arc of Ellipse (TrimmedCurve from Geom) from a Ellipse between two parameters Alpha1 and Alpha2.
") GC_MakeArcOfEllipse;
		 GC_MakeArcOfEllipse(const gp_Elips & Elips, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Boolean Sense);

		/****** GC_MakeArcOfEllipse::GC_MakeArcOfEllipse ******/
		/****** md5 signature: 4b511d828d8843fe955c104fe9db98b7 ******/
		%feature("compactdefaultargs") GC_MakeArcOfEllipse;
		%feature("autodoc", "
Parameters
----------
Elips: gp_Elips
P: gp_Pnt
Alpha: float
Sense: bool

Return
-------
None

Description
-----------
Constructs an arc of Ellipse (TrimmedCurve from Geom) from a Ellipse between point <P> and the angle Alpha given in radians.
") GC_MakeArcOfEllipse;
		 GC_MakeArcOfEllipse(const gp_Elips & Elips, const gp_Pnt & P, const Standard_Real Alpha, const Standard_Boolean Sense);

		/****** GC_MakeArcOfEllipse::GC_MakeArcOfEllipse ******/
		/****** md5 signature: a50ac9698484354ba153b97e864a0d8b ******/
		%feature("compactdefaultargs") GC_MakeArcOfEllipse;
		%feature("autodoc", "
Parameters
----------
Elips: gp_Elips
P1: gp_Pnt
P2: gp_Pnt
Sense: bool

Return
-------
None

Description
-----------
Constructs an arc of Ellipse (TrimmedCurve from Geom) from a Ellipse between two points P1 and P2. The orientation of the arc of ellipse is: - the sense of Elips if Sense is true, or - the opposite sense if Sense is false. Notes: - Alpha1, Alpha2 and Alpha are angle values, given in radians. - IsDone always returns true.
") GC_MakeArcOfEllipse;
		 GC_MakeArcOfEllipse(const gp_Elips & Elips, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Boolean Sense);

		/****** GC_MakeArcOfEllipse::Value ******/
		/****** md5 signature: d45b23dd256c842f7b4edfb35b6253b1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_TrimmedCurve>

Description
-----------
Returns the constructed arc of ellipse.
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
		/****** GC_MakeArcOfHyperbola::GC_MakeArcOfHyperbola ******/
		/****** md5 signature: 3e0efa2a82bd4f5bf226f1afb70fb36d ******/
		%feature("compactdefaultargs") GC_MakeArcOfHyperbola;
		%feature("autodoc", "
Parameters
----------
Hypr: gp_Hypr
Alpha1: float
Alpha2: float
Sense: bool

Return
-------
None

Description
-----------
Creates an arc of Hyperbola (TrimmedCurve from Geom) from a Hyperbola between two parameters Alpha1 and Alpha2 (given in radians).
") GC_MakeArcOfHyperbola;
		 GC_MakeArcOfHyperbola(const gp_Hypr & Hypr, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Boolean Sense);

		/****** GC_MakeArcOfHyperbola::GC_MakeArcOfHyperbola ******/
		/****** md5 signature: a451983b0e51ea5828e265132a233542 ******/
		%feature("compactdefaultargs") GC_MakeArcOfHyperbola;
		%feature("autodoc", "
Parameters
----------
Hypr: gp_Hypr
P: gp_Pnt
Alpha: float
Sense: bool

Return
-------
None

Description
-----------
Creates an arc of Hyperbola (TrimmedCurve from Geom) from a Hyperbola between point <P> and the parameter Alpha (given in radians).
") GC_MakeArcOfHyperbola;
		 GC_MakeArcOfHyperbola(const gp_Hypr & Hypr, const gp_Pnt & P, const Standard_Real Alpha, const Standard_Boolean Sense);

		/****** GC_MakeArcOfHyperbola::GC_MakeArcOfHyperbola ******/
		/****** md5 signature: 87149aba63ae1ff0790f39bd6fac5ae7 ******/
		%feature("compactdefaultargs") GC_MakeArcOfHyperbola;
		%feature("autodoc", "
Parameters
----------
Hypr: gp_Hypr
P1: gp_Pnt
P2: gp_Pnt
Sense: bool

Return
-------
None

Description
-----------
Creates an arc of Hyperbola (TrimmedCurve from Geom) from a Hyperbola between two points P1 and P2. The orientation of the arc of hyperbola is: - the sense of Hypr if Sense is true, or - the opposite sense if Sense is false.
") GC_MakeArcOfHyperbola;
		 GC_MakeArcOfHyperbola(const gp_Hypr & Hypr, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Boolean Sense);

		/****** GC_MakeArcOfHyperbola::Value ******/
		/****** md5 signature: d45b23dd256c842f7b4edfb35b6253b1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_TrimmedCurve>

Description
-----------
Returns the constructed arc of hyperbola.
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
		/****** GC_MakeArcOfParabola::GC_MakeArcOfParabola ******/
		/****** md5 signature: 66fdb4d30102127cd02ffcff5bcca44c ******/
		%feature("compactdefaultargs") GC_MakeArcOfParabola;
		%feature("autodoc", "
Parameters
----------
Parab: gp_Parab
Alpha1: float
Alpha2: float
Sense: bool

Return
-------
None

Description
-----------
Creates an arc of Parabola (TrimmedCurve from Geom) from a Parabola between two parameters Alpha1 and Alpha2 (given in radians).
") GC_MakeArcOfParabola;
		 GC_MakeArcOfParabola(const gp_Parab & Parab, const Standard_Real Alpha1, const Standard_Real Alpha2, const Standard_Boolean Sense);

		/****** GC_MakeArcOfParabola::GC_MakeArcOfParabola ******/
		/****** md5 signature: 287fa288d9f59b7da052bfc850bb72de ******/
		%feature("compactdefaultargs") GC_MakeArcOfParabola;
		%feature("autodoc", "
Parameters
----------
Parab: gp_Parab
P: gp_Pnt
Alpha: float
Sense: bool

Return
-------
None

Description
-----------
Creates an arc of Parabola (TrimmedCurve from Geom) from a Parabola between point <P> and the parameter Alpha (given in radians).
") GC_MakeArcOfParabola;
		 GC_MakeArcOfParabola(const gp_Parab & Parab, const gp_Pnt & P, const Standard_Real Alpha, const Standard_Boolean Sense);

		/****** GC_MakeArcOfParabola::GC_MakeArcOfParabola ******/
		/****** md5 signature: e72defc0c6d3d7bafcc006bd2ca1003f ******/
		%feature("compactdefaultargs") GC_MakeArcOfParabola;
		%feature("autodoc", "
Parameters
----------
Parab: gp_Parab
P1: gp_Pnt
P2: gp_Pnt
Sense: bool

Return
-------
None

Description
-----------
Creates an arc of Parabola (TrimmedCurve from Geom) from a Parabola between two points P1 and P2.
") GC_MakeArcOfParabola;
		 GC_MakeArcOfParabola(const gp_Parab & Parab, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Boolean Sense);

		/****** GC_MakeArcOfParabola::Value ******/
		/****** md5 signature: d45b23dd256c842f7b4edfb35b6253b1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_TrimmedCurve>

Description
-----------
Returns the constructed arc of parabola.
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
		/****** GC_MakeCircle::GC_MakeCircle ******/
		/****** md5 signature: bf1d9b54e186c9b8b436e33de033e771 ******/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ

Return
-------
None

Description
-----------
creates a circle from a non persistent circle C by its conversion.
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Circ & C);

		/****** GC_MakeCircle::GC_MakeCircle ******/
		/****** md5 signature: 9c55b4ab7f72a76ac6e9254ced8b490d ******/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
Radius: float

Return
-------
None

Description
-----------
A2 is the local coordinates system of the circle. It is not forbidden to create a circle with Radius = 0.0 Status is 'NegativeRadius' if Radius < 0.
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Ax2 & A2, const Standard_Real Radius);

		/****** GC_MakeCircle::GC_MakeCircle ******/
		/****** md5 signature: 21e84db06da749ac9abd5d8fad8435bb ******/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ
Dist: float

Return
-------
None

Description
-----------
Make a Circle from Geom <TheCirc> parallel to another Circ <Circ> with a distance <Dist>. If Dist is greater than zero the result is enclosing the circle <Circ>, else the result is enclosed by the circle <Circ>.
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Circ & Circ, const Standard_Real Dist);

		/****** GC_MakeCircle::GC_MakeCircle ******/
		/****** md5 signature: 2ff08626b4fe5d90a6c735fe8e4f4979 ******/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ
Point: gp_Pnt

Return
-------
None

Description
-----------
Make a Circle from Geom <TheCirc> parallel to another Circ <Circ> and passing through a Pnt <Point>.
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Circ & Circ, const gp_Pnt & Point);

		/****** GC_MakeCircle::GC_MakeCircle ******/
		/****** md5 signature: 8f5645e1e1c74cef187d3abe3d016533 ******/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt

Return
-------
None

Description
-----------
Make a Circ from gp <TheCirc> passing through 3 Pnt2d <P1>,<P2>,<P3>.
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****** GC_MakeCircle::GC_MakeCircle ******/
		/****** md5 signature: 030732eacfec23e3a7bb821045dee1b5 ******/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
Norm: gp_Dir
Radius: float

Return
-------
None

Description
-----------
Make a Circle from Geom <TheCirc> with its center <Center> and the normal of its plane <Norm> and its radius <Radius>.
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Pnt & Center, const gp_Dir & Norm, const Standard_Real Radius);

		/****** GC_MakeCircle::GC_MakeCircle ******/
		/****** md5 signature: 1f91d718891e58d456fd714ae6aee2b9 ******/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt
PtAxis: gp_Pnt
Radius: float

Return
-------
None

Description
-----------
Make a Circle from Geom <TheCirc> with its center <Center> and the normal of its plane defined by the two points <Center> and <PtAxis> and its radius <Radius>.
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Pnt & Center, const gp_Pnt & PtAxis, const Standard_Real Radius);

		/****** GC_MakeCircle::GC_MakeCircle ******/
		/****** md5 signature: a828fca3b2a6e5cfef246c0b7a642706 ******/
		%feature("compactdefaultargs") GC_MakeCircle;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1
Radius: float

Return
-------
None

Description
-----------
Make a Circle from Geom <TheCirc> with its center <Center> and its radius <Radius>.
") GC_MakeCircle;
		 GC_MakeCircle(const gp_Ax1 & Axis, const Standard_Real Radius);

		/****** GC_MakeCircle::Value ******/
		/****** md5 signature: 77b780fd65868a33ad4a6d8ee9ea9e45 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Circle>

Description
-----------
Returns the constructed circle. Exceptions StdFail_NotDone if no circle is constructed.
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
		/****** GC_MakeConicalSurface::GC_MakeConicalSurface ******/
		/****** md5 signature: cfb9674f81e2288d7b44b7d4eae667ee ******/
		%feature("compactdefaultargs") GC_MakeConicalSurface;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
Ang: float
Radius: float

Return
-------
None

Description
-----------
A2 defines the local coordinate system of the conical surface. Ang is the conical surface semi-angle ]0, PI/2[. Radius is the radius of the circle Viso in the placement plane of the conical surface defined with 'XAxis' and 'YAxis'. The 'ZDirection' of A2 defines the direction of the surface's axis of symmetry. If the location point of A2 is the apex of the surface Radius = 0 . At the creation the parametrization of the surface is defined such that the normal Vector (N = D1U ^ D1V) is oriented towards the 'outside region' of the surface. Status is 'NegativeRadius' if Radius < 0.0 or 'BadAngle' if Ang < Resolution from gp or Ang >= PI/ - Resolution.
") GC_MakeConicalSurface;
		 GC_MakeConicalSurface(const gp_Ax2 & A2, const Standard_Real Ang, const Standard_Real Radius);

		/****** GC_MakeConicalSurface::GC_MakeConicalSurface ******/
		/****** md5 signature: 63f26b85de46e7fd7463b2976b75566a ******/
		%feature("compactdefaultargs") GC_MakeConicalSurface;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone

Return
-------
None

Description
-----------
Creates a ConicalSurface from a non persistent Cone from package gp.
") GC_MakeConicalSurface;
		 GC_MakeConicalSurface(const gp_Cone & C);

		/****** GC_MakeConicalSurface::GC_MakeConicalSurface ******/
		/****** md5 signature: c00bebc8a821a4bc8009bae5d4e76b24 ******/
		%feature("compactdefaultargs") GC_MakeConicalSurface;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt
P4: gp_Pnt

Return
-------
None

Description
-----------
Make a ConicalSurface from Geom <TheCone> passing through 3 Pnt <P1>,<P2>,<P3>. Its axis is <P1P2> and the radius of its base is the distance between <P3> and <P1P2>. The distance between <P4> and <P1P2> is the radius of the section passing through <P4>. An error iss raised if <P1>,<P2>,<P3>,<P4> are colinear or if <P3P4> is perpendicular to <P1P2> or <P3P4> is colinear to <P1P2>.
") GC_MakeConicalSurface;
		 GC_MakeConicalSurface(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const gp_Pnt & P4);

		/****** GC_MakeConicalSurface::GC_MakeConicalSurface ******/
		/****** md5 signature: 95accac2de950972779691b2d0f9b0a0 ******/
		%feature("compactdefaultargs") GC_MakeConicalSurface;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
R1: float
R2: float

Return
-------
None

Description
-----------
Make a ConicalSurface with two points and two radius. The axis of the solution is the line passing through <P1> and <P2>. <R1> is the radius of the section passing through <P1> and <R2> the radius of the section passing through <P2>.
") GC_MakeConicalSurface;
		 GC_MakeConicalSurface(const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real R1, const Standard_Real R2);

		/****** GC_MakeConicalSurface::Value ******/
		/****** md5 signature: f76b9d8ce2fb13effc98c77c09194361 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_ConicalSurface>

Description
-----------
Returns the constructed cone. Exceptions StdFail_NotDone if no cone is constructed.
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
		/****** GC_MakeCylindricalSurface::GC_MakeCylindricalSurface ******/
		/****** md5 signature: 9d6564a69da63d5aad643855b3a14cb5 ******/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
Radius: float

Return
-------
None

Description
-----------
A2 defines the local coordinate system of the cylindrical surface. The 'ZDirection' of A2 defines the direction of the surface's axis of symmetry. At the creation the parametrization of the surface is defined such that the normal Vector (N = D1U ^ D1V) is oriented towards the 'outside region' of the surface. Warnings: It is not forbidden to create a cylindrical surface with Radius = 0.0 Status is 'NegativeRadius' if Radius < 0.0.
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Ax2 & A2, const Standard_Real Radius);

		/****** GC_MakeCylindricalSurface::GC_MakeCylindricalSurface ******/
		/****** md5 signature: c3a3ce94b3937ca6164e66579c13560f ******/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder

Return
-------
None

Description
-----------
Creates a CylindricalSurface from a non persistent Cylinder from package gp.
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Cylinder & C);

		/****** GC_MakeCylindricalSurface::GC_MakeCylindricalSurface ******/
		/****** md5 signature: 032b9f0c7a3695d93dba75f2475721cb ******/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Point: gp_Pnt

Return
-------
None

Description
-----------
Make a CylindricalSurface from Geom <TheCylinder> parallel to another CylindricalSurface <Cylinder> and passing through a Pnt <Point>.
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Cylinder & Cyl, const gp_Pnt & Point);

		/****** GC_MakeCylindricalSurface::GC_MakeCylindricalSurface ******/
		/****** md5 signature: 7c05efbce55a2940aafb508e1e8bdfb2 ******/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
Cyl: gp_Cylinder
Dist: float

Return
-------
None

Description
-----------
Make a CylindricalSurface from Geom <TheCylinder> parallel to another CylindricalSurface <Cylinder> at the distance <Dist> which can be greater or lower than zero. The radius of the result is the absolute value of the radius of <Cyl> plus <Dist>.
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Cylinder & Cyl, const Standard_Real Dist);

		/****** GC_MakeCylindricalSurface::GC_MakeCylindricalSurface ******/
		/****** md5 signature: cc01067acc2874528a6fde4ebf7f24bd ******/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt

Return
-------
None

Description
-----------
Make a CylindricalSurface from Geom <TheCylinder> passing through 3 Pnt <P1>,<P2>,<P3>. Its axis is <P1P2> and its radius is the distance between <P3> and <P1P2>.
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****** GC_MakeCylindricalSurface::GC_MakeCylindricalSurface ******/
		/****** md5 signature: cb7506cb7b97b13f417dc69f32d2281e ******/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1
Radius: float

Return
-------
None

Description
-----------
Make a CylindricalSurface by its axis <Axis> and radius <Radius>.
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Ax1 & Axis, const Standard_Real Radius);

		/****** GC_MakeCylindricalSurface::GC_MakeCylindricalSurface ******/
		/****** md5 signature: 419948e40d3ee771cbcd4acea450f00f ******/
		%feature("compactdefaultargs") GC_MakeCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ

Return
-------
None

Description
-----------
Make a CylindricalSurface by its circular base.
") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface(const gp_Circ & Circ);

		/****** GC_MakeCylindricalSurface::Value ******/
		/****** md5 signature: 30dd9d137690c70664962cf877a84f99 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_CylindricalSurface>

Description
-----------
Returns the constructed cylinder. Exceptions StdFail_NotDone if no cylinder is constructed.
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
		/****** GC_MakeEllipse::GC_MakeEllipse ******/
		/****** md5 signature: 672721cf4b0b74836f8f38bc560d4bc4 ******/
		%feature("compactdefaultargs") GC_MakeEllipse;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips

Return
-------
None

Description
-----------
Creates an ellipse from a non persistent ellipse E from package gp by its conversion.
") GC_MakeEllipse;
		 GC_MakeEllipse(const gp_Elips & E);

		/****** GC_MakeEllipse::GC_MakeEllipse ******/
		/****** md5 signature: 23e9e1b201d3ff1f63c11bceaf464a35 ******/
		%feature("compactdefaultargs") GC_MakeEllipse;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
MajorRadius: float
MinorRadius: float

Return
-------
None

Description
-----------
Constructs an ellipse with major and minor radii MajorRadius and MinorRadius, and located in the plane defined by the 'X Axis' and 'Y Axis' of the coordinate system A2, where: - its center is the origin of A2, and - its major axis is the 'X Axis' of A2; Warnings: The MakeEllipse class does not prevent the construction of an ellipse where MajorRadius is equal to MinorRadius. If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_InvertRadius if MajorRadius is less than MinorRadius; - gce_NegativeRadius if MinorRadius is less than 0.0; - gce_NullAxis if the points S1 and Center are coincident; or - gce_InvertAxis if: - the major radius computed with Center and S1 is less than the minor radius computed with Center, S1 and S2, or - Center, S1 and S2 are collinear.
") GC_MakeEllipse;
		 GC_MakeEllipse(const gp_Ax2 & A2, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****** GC_MakeEllipse::GC_MakeEllipse ******/
		/****** md5 signature: cbf116c8e2d3fd951305a96b4b370863 ******/
		%feature("compactdefaultargs") GC_MakeEllipse;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pnt
S2: gp_Pnt
Center: gp_Pnt

Return
-------
None

Description
-----------
Constructs an ellipse centered on the point Center, where - the plane of the ellipse is defined by Center, S1 and S2, - its major axis is defined by Center and S1, - its major radius is the distance between Center and S1, and - its minor radius is the distance between S2 and the major axis.
") GC_MakeEllipse;
		 GC_MakeEllipse(const gp_Pnt & S1, const gp_Pnt & S2, const gp_Pnt & Center);

		/****** GC_MakeEllipse::Value ******/
		/****** md5 signature: fe3b3117138e75351b7c9f5b2c0c513e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Ellipse>

Description
-----------
Returns the constructed ellipse. Exceptions StdFail_NotDone if no ellipse is constructed.
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
		/****** GC_MakeHyperbola::GC_MakeHyperbola ******/
		/****** md5 signature: 37b62891883cf3372ff78a36b8ddec46 ******/
		%feature("compactdefaultargs") GC_MakeHyperbola;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr

Return
-------
None

Description
-----------
Creates an Hyperbola from a non persistent hyperbola from package gp by conversion.
") GC_MakeHyperbola;
		 GC_MakeHyperbola(const gp_Hypr & H);

		/****** GC_MakeHyperbola::GC_MakeHyperbola ******/
		/****** md5 signature: 0b321cdf4f8f9dd49e42da4298b504b0 ******/
		%feature("compactdefaultargs") GC_MakeHyperbola;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2
MajorRadius: float
MinorRadius: float

Return
-------
None

Description
-----------
Constructs a hyperbola centered on the origin of the coordinate system A2, with major and minor radii MajorRadius and MinorRadius, where: the plane of the hyperbola is defined by the 'X Axis' and 'Y Axis' of A2, - its major axis is the 'X Axis' of A2.
") GC_MakeHyperbola;
		 GC_MakeHyperbola(const gp_Ax2 & A2, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****** GC_MakeHyperbola::GC_MakeHyperbola ******/
		/****** md5 signature: 0c8177d10f741371b63960948615b7f9 ******/
		%feature("compactdefaultargs") GC_MakeHyperbola;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pnt
S2: gp_Pnt
Center: gp_Pnt

Return
-------
None

Description
-----------
Constructs a hyperbola centered on the point Center, where - the plane of the hyperbola is defined by Center, S1 and S2, - its major axis is defined by Center and S1, - its major radius is the distance between Center and S1, and - its minor radius is the distance between S2 and the major axis;.
") GC_MakeHyperbola;
		 GC_MakeHyperbola(const gp_Pnt & S1, const gp_Pnt & S2, const gp_Pnt & Center);

		/****** GC_MakeHyperbola::Value ******/
		/****** md5 signature: 7d3e15d3ad54c1125b9d13b5ee20322c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Hyperbola>

Description
-----------
Returns the constructed hyperbola. Exceptions StdFail_NotDone if no hyperbola is constructed.
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
		/****** GC_MakeLine::GC_MakeLine ******/
		/****** md5 signature: 229d3736e310eb22ccb2a4eda71492ef ******/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1

Return
-------
None

Description
-----------
Creates a line located in 3D space with the axis placement A1. The Location of A1 is the origin of the line.
") GC_MakeLine;
		 GC_MakeLine(const gp_Ax1 & A1);

		/****** GC_MakeLine::GC_MakeLine ******/
		/****** md5 signature: c62480762270d5c69ffb0534a5b6fce5 ******/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin

Return
-------
None

Description
-----------
Creates a line from a non persistent line from package gp.
") GC_MakeLine;
		 GC_MakeLine(const gp_Lin & L);

		/****** GC_MakeLine::GC_MakeLine ******/
		/****** md5 signature: 9555b5e9e4e29e1e6f3718a6632ee21f ******/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
V: gp_Dir

Return
-------
None

Description
-----------
P is the origin and V is the direction of the line.
") GC_MakeLine;
		 GC_MakeLine(const gp_Pnt & P, const gp_Dir & V);

		/****** GC_MakeLine::GC_MakeLine ******/
		/****** md5 signature: 52b54a0bcb566d2e6ab1ffe6a82acad0 ******/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "
Parameters
----------
Lin: gp_Lin
Point: gp_Pnt

Return
-------
None

Description
-----------
Make a Line from Geom <TheLin> parallel to another Lin <Lin> and passing through a Pnt <Point>.
") GC_MakeLine;
		 GC_MakeLine(const gp_Lin & Lin, const gp_Pnt & Point);

		/****** GC_MakeLine::GC_MakeLine ******/
		/****** md5 signature: 6802d12afd883cd3d264cfc3e6ccdfb6 ******/
		%feature("compactdefaultargs") GC_MakeLine;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Make a Line from Geom <TheLin> passing through 2 Pnt <P1>,<P2>. It returns false if <p1> and <P2> are confused. Warning If the points P1 and P2 are coincident (that is, when IsDone returns false), the Status function returns gce_ConfusedPoints.
") GC_MakeLine;
		 GC_MakeLine(const gp_Pnt & P1, const gp_Pnt & P2);

		/****** GC_MakeLine::Value ******/
		/****** md5 signature: 5995492bfc97e37ea24602cdfa25a85a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Line>

Description
-----------
Returns the constructed line. Exceptions StdFail_NotDone if no line is constructed.
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
		/****** GC_MakePlane::GC_MakePlane ******/
		/****** md5 signature: 4844e6a6d04660e270d526c482e052ac ******/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "
Parameters
----------
Pl: gp_Pln

Return
-------
None

Description
-----------
Creates a plane from a non persistent plane from package gp.
") GC_MakePlane;
		 GC_MakePlane(const gp_Pln & Pl);

		/****** GC_MakePlane::GC_MakePlane ******/
		/****** md5 signature: ab9fdf2640e0dd0889170a94c3414c8f ******/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
V: gp_Dir

Return
-------
None

Description
-----------
P is the 'Location' point or origin of the plane. V is the direction normal to the plane.
") GC_MakePlane;
		 GC_MakePlane(const gp_Pnt & P, const gp_Dir & V);

		/****** GC_MakePlane::GC_MakePlane ******/
		/****** md5 signature: 193d69ec1e6408c28a5024023be7c83c ******/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "
Parameters
----------
A: float
B: float
C: float
D: float

Return
-------
None

Description
-----------
Creates a plane from its cartesian equation: Ax + By + Cz + D = 0.0 Status is 'BadEquation' if Sqrt (A*A + B*B + C*C) <= Resolution from gp.
") GC_MakePlane;
		 GC_MakePlane(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D);

		/****** GC_MakePlane::GC_MakePlane ******/
		/****** md5 signature: f12935a136028087a678092a96ca9532 ******/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "
Parameters
----------
Pln: gp_Pln
Point: gp_Pnt

Return
-------
None

Description
-----------
Make a Plane from Geom <ThePlane> parallel to another Pln <Pln> and passing through a Pnt <Point>.
") GC_MakePlane;
		 GC_MakePlane(const gp_Pln & Pln, const gp_Pnt & Point);

		/****** GC_MakePlane::GC_MakePlane ******/
		/****** md5 signature: c2a22654c060500d6d24ceefed764443 ******/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "
Parameters
----------
Pln: gp_Pln
Dist: float

Return
-------
None

Description
-----------
Make a Plane from Geom <ThePlane> parallel to another Pln <Pln> at the distance <Dist> which can be greater or lower than zero. In the first case the result is at the distance <Dist> to the plane <Pln> in the direction of the normal to <Pln>. Otherwise it is in the opposite direction.
") GC_MakePlane;
		 GC_MakePlane(const gp_Pln & Pln, const Standard_Real Dist);

		/****** GC_MakePlane::GC_MakePlane ******/
		/****** md5 signature: f818b56489b3255c4acbea51511cb4ec ******/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt

Return
-------
None

Description
-----------
Make a Plane from Geom <ThePlane> passing through 3 Pnt <P1>,<P2>,<P3>. It returns false if <P1> <P2> <P3> are confused.
") GC_MakePlane;
		 GC_MakePlane(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****** GC_MakePlane::GC_MakePlane ******/
		/****** md5 signature: 0f00eef9a9169412fc8912ab7ab6491e ******/
		%feature("compactdefaultargs") GC_MakePlane;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1

Return
-------
None

Description
-----------
Make a Plane passing through the location of <Axis>and normal to the Direction of <Axis>.
") GC_MakePlane;
		 GC_MakePlane(const gp_Ax1 & Axis);

		/****** GC_MakePlane::Value ******/
		/****** md5 signature: 2bfa538a32a02e39c814ddb436054f45 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Plane>

Description
-----------
Returns the constructed plane. Exceptions StdFail_NotDone if no plane is constructed.
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
		/****** GC_MakeSegment::GC_MakeSegment ******/
		/****** md5 signature: 9b395bcb8545fc82062801355a3e8819 ******/
		%feature("compactdefaultargs") GC_MakeSegment;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Make a segment of Line from the 2 points <P1> and <P2>. It returns NullObject if <P1> and <P2> are confused.
") GC_MakeSegment;
		 GC_MakeSegment(const gp_Pnt & P1, const gp_Pnt & P2);

		/****** GC_MakeSegment::GC_MakeSegment ******/
		/****** md5 signature: 76b02f066e95296cf20f26752b97184d ******/
		%feature("compactdefaultargs") GC_MakeSegment;
		%feature("autodoc", "
Parameters
----------
Line: gp_Lin
U1: float
U2: float

Return
-------
None

Description
-----------
Make a segment of Line from the line <Line1> between the two parameters U1 and U2. It returns NullObject if <U1> is equal <U2>.
") GC_MakeSegment;
		 GC_MakeSegment(const gp_Lin & Line, const Standard_Real U1, const Standard_Real U2);

		/****** GC_MakeSegment::GC_MakeSegment ******/
		/****** md5 signature: 829552b203d5956d86936fcc4dbf875d ******/
		%feature("compactdefaultargs") GC_MakeSegment;
		%feature("autodoc", "
Parameters
----------
Line: gp_Lin
Point: gp_Pnt
Ulast: float

Return
-------
None

Description
-----------
Make a segment of Line from the line <Line1> between the point <Point> and the parameter Ulast. It returns NullObject if <U1> is equal <U2>.
") GC_MakeSegment;
		 GC_MakeSegment(const gp_Lin & Line, const gp_Pnt & Point, const Standard_Real Ulast);

		/****** GC_MakeSegment::GC_MakeSegment ******/
		/****** md5 signature: 0aed52f842514f4c8c02d52e88e79195 ******/
		%feature("compactdefaultargs") GC_MakeSegment;
		%feature("autodoc", "
Parameters
----------
Line: gp_Lin
P1: gp_Pnt
P2: gp_Pnt

Return
-------
None

Description
-----------
Make a segment of Line from the line <Line1> between the two points <P1> and <P2>. It returns NullObject if <U1> is equal <U2>.
") GC_MakeSegment;
		 GC_MakeSegment(const gp_Lin & Line, const gp_Pnt & P1, const gp_Pnt & P2);

		/****** GC_MakeSegment::Value ******/
		/****** md5 signature: d45b23dd256c842f7b4edfb35b6253b1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_TrimmedCurve>

Description
-----------
Returns the constructed line segment.
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
		/****** GC_MakeTrimmedCone::GC_MakeTrimmedCone ******/
		/****** md5 signature: 2fe57e5995bd5d4e8300a1fb92843a49 ******/
		%feature("compactdefaultargs") GC_MakeTrimmedCone;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt
P4: gp_Pnt

Return
-------
None

Description
-----------
Make a RectangularTrimmedSurface <TheCone> from Geom It is trimmed by P3 and P4. Its axis is <P1P2> and the radius of its base is the distance between <P3> and <P1P2>. The distance between <P4> and <P1P2> is the radius of the section passing through <P4>. An error iss raised if <P1>,<P2>,<P3>,<P4> are colinear or if <P3P4> is perpendicular to <P1P2> or <P3P4> is colinear to <P1P2>.
") GC_MakeTrimmedCone;
		 GC_MakeTrimmedCone(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const gp_Pnt & P4);

		/****** GC_MakeTrimmedCone::GC_MakeTrimmedCone ******/
		/****** md5 signature: a8a3c8b25092c4c82c44472bf8d190e4 ******/
		%feature("compactdefaultargs") GC_MakeTrimmedCone;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
R1: float
R2: float

Return
-------
None

Description
-----------
Make a RectangularTrimmedSurface from Geom <TheCone> from a cone and trimmed by two points P1 and P2 and the two radius <R1> and <R2> of the sections passing through <P1> an <P2>. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_ConfusedPoints if points P1 and P2, or P3 and P4, are coincident; - gce_NullAngle if: - the lines joining P1 to P2 and P3 to P4 are parallel, or - R1 and R2 are equal (i.e. their difference is less than gp::Resolution()); - gce_NullRadius if: - the line joining P1 to P2 is perpendicular to the line joining P3 to P4, or - the points P1, P2, P3 and P4 are collinear; - gce_NegativeRadius if R1 or R2 is negative; or - gce_NullAxis if points P1 and P2 are coincident (2nd syntax only).
") GC_MakeTrimmedCone;
		 GC_MakeTrimmedCone(const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real R1, const Standard_Real R2);

		/****** GC_MakeTrimmedCone::Value ******/
		/****** md5 signature: f107db51d7a8f6cc0f22e8dcf1ab2f34 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_RectangularTrimmedSurface>

Description
-----------
Returns the constructed trimmed cone. StdFail_NotDone if no trimmed cone is constructed.
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
		/****** GC_MakeTrimmedCylinder::GC_MakeTrimmedCylinder ******/
		/****** md5 signature: 4a35a8293ea23e9fd492e2bbf18ea8e6 ******/
		%feature("compactdefaultargs") GC_MakeTrimmedCylinder;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt

Return
-------
None

Description
-----------
Make a cylindricalSurface <Cyl> from Geom Its axis is <P1P2> and its radius is the distance between <P3> and <P1P2>. The height is the distance between P1 and P2.
") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3);

		/****** GC_MakeTrimmedCylinder::GC_MakeTrimmedCylinder ******/
		/****** md5 signature: 141c9a4e19ce270deff340295d2976db ******/
		%feature("compactdefaultargs") GC_MakeTrimmedCylinder;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ
Height: float

Return
-------
None

Description
-----------
Make a cylindricalSurface <Cyl> from gp by its base <Circ>. Its axis is the normal to the plane defined bi <Circ>. <Height> can be greater than zero or lower than zero. In the first case the V parametric direction of the result has the same orientation as the normal to <Circ>. In the other case it has the opposite orientation.
") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder(const gp_Circ & Circ, const Standard_Real Height);

		/****** GC_MakeTrimmedCylinder::GC_MakeTrimmedCylinder ******/
		/****** md5 signature: fb55ef061aaa9ab5bafd04308d80bfbb ******/
		%feature("compactdefaultargs") GC_MakeTrimmedCylinder;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1
Radius: float
Height: float

Return
-------
None

Description
-----------
Make a cylindricalSurface <Cyl> from gp by its axis <A1> and its radius <Radius>. It returns NullObject if <Radius> is lower than zero. <Height> can be greater than zero or lower than zero. In the first case the V parametric direction of the result has the same orientation as <A1>. In the other case it has the opposite orientation.
") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder(const gp_Ax1 & A1, const Standard_Real Radius, const Standard_Real Height);

		/****** GC_MakeTrimmedCylinder::Value ******/
		/****** md5 signature: f107db51d7a8f6cc0f22e8dcf1ab2f34 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_RectangularTrimmedSurface>

Description
-----------
Returns the constructed trimmed cylinder. Exceptions StdFail_NotDone if no trimmed cylinder is constructed.
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
/* class aliases */
%pythoncode {
}
