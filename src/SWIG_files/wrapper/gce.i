/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") gce

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include gce_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum gce_ErrorType {
	gce_Done = 0,
	gce_ConfusedPoints = 1,
	gce_NegativeRadius = 2,
	gce_ColinearPoints = 3,
	gce_IntersectionError = 4,
	gce_NullAxis = 5,
	gce_NullAngle = 6,
	gce_NullRadius = 7,
	gce_InvertAxis = 8,
	gce_BadAngle = 9,
	gce_InvertRadius = 10,
	gce_NullFocusLength = 11,
	gce_NullVector = 12,
	gce_BadEquation = 13,
};

/* end public enums declaration */

%nodefaultctor gce_MakeMirror;
class gce_MakeMirror {
	public:
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "	:param Point:
	:type Point: gp_Pnt
	:rtype: None
") gce_MakeMirror;
		 gce_MakeMirror (const gp_Pnt & Point);
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "	:param Axis:
	:type Axis: gp_Ax1
	:rtype: None
") gce_MakeMirror;
		 gce_MakeMirror (const gp_Ax1 & Axis);
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "	:param Line:
	:type Line: gp_Lin
	:rtype: None
") gce_MakeMirror;
		 gce_MakeMirror (const gp_Lin & Line);
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "	* Makes a symmetry transformation af axis defined by <Point> and <Direc>.

	:param Point:
	:type Point: gp_Pnt
	:param Direc:
	:type Direc: gp_Dir
	:rtype: None
") gce_MakeMirror;
		 gce_MakeMirror (const gp_Pnt & Point,const gp_Dir & Direc);
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "	* Makes a symmetry transformation of plane <Plane>.

	:param Plane:
	:type Plane: gp_Pln
	:rtype: None
") gce_MakeMirror;
		 gce_MakeMirror (const gp_Pln & Plane);
		%feature("compactdefaultargs") gce_MakeMirror;
		%feature("autodoc", "	* Makes a symmetry transformation of plane <Plane>.

	:param Plane:
	:type Plane: gp_Ax2
	:rtype: None
") gce_MakeMirror;
		 gce_MakeMirror (const gp_Ax2 & Plane);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed transformation.

	:rtype: gp_Trsf
") Value;
		const gp_Trsf  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Trsf
") Operator;
		const gp_Trsf  Operator ();
		%feature("compactdefaultargs") operator gp_Trsf;
		%feature("autodoc", "	:rtype: 
") operator gp_Trsf;
		 operator gp_Trsf ();
};


%extend gce_MakeMirror {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeMirror2d;
class gce_MakeMirror2d {
	public:
		%feature("compactdefaultargs") gce_MakeMirror2d;
		%feature("autodoc", "	:param Point:
	:type Point: gp_Pnt2d
	:rtype: None
") gce_MakeMirror2d;
		 gce_MakeMirror2d (const gp_Pnt2d & Point);
		%feature("compactdefaultargs") gce_MakeMirror2d;
		%feature("autodoc", "	:param Axis:
	:type Axis: gp_Ax2d
	:rtype: None
") gce_MakeMirror2d;
		 gce_MakeMirror2d (const gp_Ax2d & Axis);
		%feature("compactdefaultargs") gce_MakeMirror2d;
		%feature("autodoc", "	:param Line:
	:type Line: gp_Lin2d
	:rtype: None
") gce_MakeMirror2d;
		 gce_MakeMirror2d (const gp_Lin2d & Line);
		%feature("compactdefaultargs") gce_MakeMirror2d;
		%feature("autodoc", "	* Makes a symmetry transformation af axis defined by <Point> and <Direc>.

	:param Point:
	:type Point: gp_Pnt2d
	:param Direc:
	:type Direc: gp_Dir2d
	:rtype: None
") gce_MakeMirror2d;
		 gce_MakeMirror2d (const gp_Pnt2d & Point,const gp_Dir2d & Direc);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed transformation.

	:rtype: gp_Trsf2d
") Value;
		const gp_Trsf2d  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Trsf2d
") Operator;
		const gp_Trsf2d  Operator ();
		%feature("compactdefaultargs") operator gp_Trsf2d;
		%feature("autodoc", "	:rtype: 
") operator gp_Trsf2d;
		 operator gp_Trsf2d ();
};


%extend gce_MakeMirror2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeRotation;
class gce_MakeRotation {
	public:
		%feature("compactdefaultargs") gce_MakeRotation;
		%feature("autodoc", "	* Constructs a rotation through angle Angle about the axis defined by the line Line.

	:param Line:
	:type Line: gp_Lin
	:param Angle:
	:type Angle: float
	:rtype: None
") gce_MakeRotation;
		 gce_MakeRotation (const gp_Lin & Line,const Standard_Real Angle);
		%feature("compactdefaultargs") gce_MakeRotation;
		%feature("autodoc", "	* Constructs a rotation through angle Angle about the axis defined by the axis Axis.

	:param Axis:
	:type Axis: gp_Ax1
	:param Angle:
	:type Angle: float
	:rtype: None
") gce_MakeRotation;
		 gce_MakeRotation (const gp_Ax1 & Axis,const Standard_Real Angle);
		%feature("compactdefaultargs") gce_MakeRotation;
		%feature("autodoc", "	* Constructs a rotation through angle Angle about the axis defined by: the point Point and the unit vector Direc.

	:param Point:
	:type Point: gp_Pnt
	:param Direc:
	:type Direc: gp_Dir
	:param Angle:
	:type Angle: float
	:rtype: None
") gce_MakeRotation;
		 gce_MakeRotation (const gp_Pnt & Point,const gp_Dir & Direc,const Standard_Real Angle);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed transformation.

	:rtype: gp_Trsf
") Value;
		const gp_Trsf  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Trsf
") Operator;
		const gp_Trsf  Operator ();
		%feature("compactdefaultargs") operator gp_Trsf;
		%feature("autodoc", "	:rtype: 
") operator gp_Trsf;
		 operator gp_Trsf ();
};


%extend gce_MakeRotation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeRotation2d;
class gce_MakeRotation2d {
	public:
		%feature("compactdefaultargs") gce_MakeRotation2d;
		%feature("autodoc", "	* Constructs a rotation through angle Angle about the center Point.

	:param Point:
	:type Point: gp_Pnt2d
	:param Angle:
	:type Angle: float
	:rtype: None
") gce_MakeRotation2d;
		 gce_MakeRotation2d (const gp_Pnt2d & Point,const Standard_Real Angle);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed transformation.

	:rtype: gp_Trsf2d
") Value;
		const gp_Trsf2d  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Trsf2d
") Operator;
		const gp_Trsf2d  Operator ();
		%feature("compactdefaultargs") operator gp_Trsf2d;
		%feature("autodoc", "	:rtype: 
") operator gp_Trsf2d;
		 operator gp_Trsf2d ();
};


%extend gce_MakeRotation2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeScale;
class gce_MakeScale {
	public:
		%feature("compactdefaultargs") gce_MakeScale;
		%feature("autodoc", "	* Constructs a scaling transformation with - Point as the center of the transformation, and - Scale as the scale factor.

	:param Point:
	:type Point: gp_Pnt
	:param Scale:
	:type Scale: float
	:rtype: None
") gce_MakeScale;
		 gce_MakeScale (const gp_Pnt & Point,const Standard_Real Scale);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed transformation.

	:rtype: gp_Trsf
") Value;
		const gp_Trsf  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Trsf
") Operator;
		const gp_Trsf  Operator ();
		%feature("compactdefaultargs") operator gp_Trsf;
		%feature("autodoc", "	:rtype: 
") operator gp_Trsf;
		 operator gp_Trsf ();
};


%extend gce_MakeScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeScale2d;
class gce_MakeScale2d {
	public:
		%feature("compactdefaultargs") gce_MakeScale2d;
		%feature("autodoc", "	* Constructs a scaling transformation with: - Point as the center of the transformation, and - Scale as the scale factor.

	:param Point:
	:type Point: gp_Pnt2d
	:param Scale:
	:type Scale: float
	:rtype: None
") gce_MakeScale2d;
		 gce_MakeScale2d (const gp_Pnt2d & Point,const Standard_Real Scale);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed transformation.

	:rtype: gp_Trsf2d
") Value;
		const gp_Trsf2d  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Trsf2d
") Operator;
		const gp_Trsf2d  Operator ();
		%feature("compactdefaultargs") operator gp_Trsf2d;
		%feature("autodoc", "	:rtype: 
") operator gp_Trsf2d;
		 operator gp_Trsf2d ();
};


%extend gce_MakeScale2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeTranslation;
class gce_MakeTranslation {
	public:
		%feature("compactdefaultargs") gce_MakeTranslation;
		%feature("autodoc", "	* Constructs a translation along the vector ' Vect'

	:param Vect:
	:type Vect: gp_Vec
	:rtype: None
") gce_MakeTranslation;
		 gce_MakeTranslation (const gp_Vec & Vect);
		%feature("compactdefaultargs") gce_MakeTranslation;
		%feature("autodoc", "	* Constructs a translation along the vector (Point1,Point2) defined from the point Point1 to the point Point2.

	:param Point1:
	:type Point1: gp_Pnt
	:param Point2:
	:type Point2: gp_Pnt
	:rtype: None
") gce_MakeTranslation;
		 gce_MakeTranslation (const gp_Pnt & Point1,const gp_Pnt & Point2);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed transformation.

	:rtype: gp_Trsf
") Value;
		const gp_Trsf  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Trsf
") Operator;
		const gp_Trsf  Operator ();
		%feature("compactdefaultargs") operator gp_Trsf;
		%feature("autodoc", "	:rtype: 
") operator gp_Trsf;
		 operator gp_Trsf ();
};


%extend gce_MakeTranslation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeTranslation2d;
class gce_MakeTranslation2d {
	public:
		%feature("compactdefaultargs") gce_MakeTranslation2d;
		%feature("autodoc", "	* Constructs a translation along the vector Vect.

	:param Vect:
	:type Vect: gp_Vec2d
	:rtype: None
") gce_MakeTranslation2d;
		 gce_MakeTranslation2d (const gp_Vec2d & Vect);
		%feature("compactdefaultargs") gce_MakeTranslation2d;
		%feature("autodoc", "	* Constructs a translation along the vector (Point1,Point2) defined from the point Point1 to the point Point2.

	:param Point1:
	:type Point1: gp_Pnt2d
	:param Point2:
	:type Point2: gp_Pnt2d
	:rtype: None
") gce_MakeTranslation2d;
		 gce_MakeTranslation2d (const gp_Pnt2d & Point1,const gp_Pnt2d & Point2);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed transformation.

	:rtype: gp_Trsf2d
") Value;
		const gp_Trsf2d  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Trsf2d
") Operator;
		const gp_Trsf2d  Operator ();
		%feature("compactdefaultargs") operator gp_Trsf2d;
		%feature("autodoc", "	:rtype: 
") operator gp_Trsf2d;
		 operator gp_Trsf2d ();
};


%extend gce_MakeTranslation2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class gce_Root {
	public:
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the construction is successful.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns the status of the construction: - gce_Done, if the construction is successful, or - another value of the gce_ErrorType enumeration indicating why the construction failed.

	:rtype: gce_ErrorType
") Status;
		gce_ErrorType Status ();
};


%extend gce_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeCirc;
class gce_MakeCirc : public gce_Root {
	public:
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "	* A2 locates the circle and gives its orientation in 3D space. Warnings : It is not forbidden to create a circle with Radius = 0.0 The status is 'NegativeRadius' if Radius < 0.0

	:param A2:
	:type A2: gp_Ax2
	:param Radius:
	:type Radius: float
	:rtype: None
") gce_MakeCirc;
		 gce_MakeCirc (const gp_Ax2 & A2,const Standard_Real Radius);
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "	* Makes a Circ from gp <TheCirc> coaxial to another Circ <Circ> at a distance <Dist>. If Dist is greater than zero the result is encloses the circle <Circ>, else the result is enclosed by the circle <Circ>.

	:param Circ:
	:type Circ: gp_Circ
	:param Dist:
	:type Dist: float
	:rtype: None
") gce_MakeCirc;
		 gce_MakeCirc (const gp_Circ & Circ,const Standard_Real Dist);
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "	* Makes a Circ from gp <TheCirc> coaxial to another Circ <Circ> and passing through a Pnt2d <Point>.

	:param Circ:
	:type Circ: gp_Circ
	:param Point:
	:type Point: gp_Pnt
	:rtype: None
") gce_MakeCirc;
		 gce_MakeCirc (const gp_Circ & Circ,const gp_Pnt & Point);
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "	* Makes a Circ from gp <TheCirc> passing through 3 Pnt2d <P1>,<P2>,<P3>.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:rtype: None
") gce_MakeCirc;
		 gce_MakeCirc (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3);
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "	* Makes a Circ from gp <TheCirc> with its center <Center> and the normal of its plane <Norm> and its radius <Radius>.

	:param Center:
	:type Center: gp_Pnt
	:param Norm:
	:type Norm: gp_Dir
	:param Radius:
	:type Radius: float
	:rtype: None
") gce_MakeCirc;
		 gce_MakeCirc (const gp_Pnt & Center,const gp_Dir & Norm,const Standard_Real Radius);
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "	* Makes a Circ from gp <TheCirc> with its center <Center> and the normal of its plane <Plane> and its radius <Radius>.

	:param Center:
	:type Center: gp_Pnt
	:param Plane:
	:type Plane: gp_Pln
	:param Radius:
	:type Radius: float
	:rtype: None
") gce_MakeCirc;
		 gce_MakeCirc (const gp_Pnt & Center,const gp_Pln & Plane,const Standard_Real Radius);
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "	* Makes a Circ from gp <TheCirc> with its center <Center> and a point <Ptaxis> giving the normal of its plane <Plane> and its radius <Radius>.

	:param Center:
	:type Center: gp_Pnt
	:param Ptaxis:
	:type Ptaxis: gp_Pnt
	:param Radius:
	:type Radius: float
	:rtype: None
") gce_MakeCirc;
		 gce_MakeCirc (const gp_Pnt & Center,const gp_Pnt & Ptaxis,const Standard_Real Radius);
		%feature("compactdefaultargs") gce_MakeCirc;
		%feature("autodoc", "	* Makes a Circ from gp <TheCirc> with its center <Center> and its radius <Radius>. Warning The MakeCirc class does not prevent the construction of a circle with a null radius. If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_Negative Radius if: - Radius is less than 0.0, or - Dist is less than 0.0 and the absolute value of Dist is greater than the radius of Circ; - gce_IntersectionError if the points P1, P2 and P3 are collinear, and the three are not coincident; - gce_ConfusedPoints if two of the three points P1, P2 and P3 are coincident; or - gce_NullAxis if Center and Ptaxis are coincident.

	:param Axis:
	:type Axis: gp_Ax1
	:param Radius:
	:type Radius: float
	:rtype: None
") gce_MakeCirc;
		 gce_MakeCirc (const gp_Ax1 & Axis,const Standard_Real Radius);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed circle. Exceptions StdFail_NotDone if no circle is constructed.

	:rtype: gp_Circ
") Value;
		const gp_Circ  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Circ
") Operator;
		const gp_Circ  Operator ();
		%feature("compactdefaultargs") operator gp_Circ;
		%feature("autodoc", "	:rtype: 
") operator gp_Circ;
		 operator gp_Circ ();
};


%extend gce_MakeCirc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeCirc2d;
class gce_MakeCirc2d : public gce_Root {
	public:
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "	* The location point of XAxis is the center of the circle. Warnings : It is not forbidden to create a circle with Radius = 0.0 If Sense is true the local coordinate system of the solution is direct and non direct in the other case. The status is 'NegativeRadius' if Radius < 0.0.

	:param XAxis:
	:type XAxis: gp_Ax2d
	:param Radius:
	:type Radius: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") gce_MakeCirc2d;
		 gce_MakeCirc2d (const gp_Ax2d & XAxis,const Standard_Real Radius,const Standard_Boolean Sense = Standard_True);
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "	* The location point of Axis is the center of the circle. Warnings : It is not forbidden to create a circle with Radius = 0.0

	:param Axis:
	:type Axis: gp_Ax22d
	:param Radius:
	:type Radius: float
	:rtype: None
") gce_MakeCirc2d;
		 gce_MakeCirc2d (const gp_Ax22d & Axis,const Standard_Real Radius);
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "	* Makes a Circ2d from gp <TheCirc> concentric with another circ2d <Circ> with a distance <Dist>. If Dist is greater than zero the result encloses the circle <Circ>, else the result is enclosed by the circle <Circ>. The local coordinate system of the solution is the same as Circ.

	:param Circ:
	:type Circ: gp_Circ2d
	:param Dist:
	:type Dist: float
	:rtype: None
") gce_MakeCirc2d;
		 gce_MakeCirc2d (const gp_Circ2d & Circ,const Standard_Real Dist);
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "	* Makes a Circ2d from gp <TheCirc> concentric with another circ2d <Circ> and passing through a Pnt2d <Point>. The local coordinate system of the solution is the same as Circ.

	:param Circ:
	:type Circ: gp_Circ2d
	:param Point:
	:type Point: gp_Pnt2d
	:rtype: None
") gce_MakeCirc2d;
		 gce_MakeCirc2d (const gp_Circ2d & Circ,const gp_Pnt2d & Point);
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "	* Makes a Circ2d from gp <TheCirc> passing through 3 Pnt2d <P1>,<P2>,<P3>. The local coordinate system of the solution is given by the three points P1, P2, P3.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:param P3:
	:type P3: gp_Pnt2d
	:rtype: None
") gce_MakeCirc2d;
		 gce_MakeCirc2d (const gp_Pnt2d & P1,const gp_Pnt2d & P2,const gp_Pnt2d & P3);
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "	* Makes a Circ2d from gp <TheCirc> with its center <Center> and its radius <Radius>. If Sense is true the local coordinate system of the solution is direct and non direct in the other case.

	:param Center:
	:type Center: gp_Pnt2d
	:param Radius:
	:type Radius: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") gce_MakeCirc2d;
		 gce_MakeCirc2d (const gp_Pnt2d & Center,const Standard_Real Radius,const Standard_Boolean Sense = Standard_True);
		%feature("compactdefaultargs") gce_MakeCirc2d;
		%feature("autodoc", "	* Makes a Circ2d from gp <TheCirc> with its center <Center> and a point giving the radius. If Sense is true the local coordinate system of the solution is direct and non direct in the other case.

	:param Center:
	:type Center: gp_Pnt2d
	:param Point:
	:type Point: gp_Pnt2d
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") gce_MakeCirc2d;
		 gce_MakeCirc2d (const gp_Pnt2d & Center,const gp_Pnt2d & Point,const Standard_Boolean Sense = Standard_True);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed circle. Exceptions StdFail_NotDone if no circle is constructed.

	:rtype: gp_Circ2d
") Value;
		const gp_Circ2d  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Circ2d
") Operator;
		const gp_Circ2d  Operator ();
		%feature("compactdefaultargs") operator gp_Circ2d;
		%feature("autodoc", "	:rtype: 
") operator gp_Circ2d;
		 operator gp_Circ2d ();
};


%extend gce_MakeCirc2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeCone;
class gce_MakeCone : public gce_Root {
	public:
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "	* Creates an infinite conical surface. A2 locates the cone in the space and defines the reference plane of the surface. Ang is the conical surface semi-angle between 0 and PI/2 radians. Radius is the radius of the circle in the reference plane of the cone. If Radius is lower than 0.0 the status is ' If Ang < Resolution from gp or Ang >= (PI/2) - Resolution.

	:param A2:
	:type A2: gp_Ax2
	:param Ang:
	:type Ang: float
	:param Radius:
	:type Radius: float
	:rtype: None
") gce_MakeCone;
		 gce_MakeCone (const gp_Ax2 & A2,const Standard_Real Ang,const Standard_Real Radius);
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "	* Makes a Cone from gp <TheCone> coaxial to another Cone <Cone> and passing through a Pnt <Point>.

	:param Cone:
	:type Cone: gp_Cone
	:param Point:
	:type Point: gp_Pnt
	:rtype: None
") gce_MakeCone;
		 gce_MakeCone (const gp_Cone & Cone,const gp_Pnt & Point);
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "	* Makes a Cone from gp <TheCone> coaxial to another Cone <Cone> at the distance <Dist> which can be greater or lower than zero.

	:param Cone:
	:type Cone: gp_Cone
	:param Dist:
	:type Dist: float
	:rtype: None
") gce_MakeCone;
		 gce_MakeCone (const gp_Cone & Cone,const Standard_Real Dist);
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "	* Makes a Cone from gp <TheCone> by four points <P1>, <P2>,<P3> and <P4>. Its axis is <P1P2> and the radius of its base is the distance between <P3> and <P1P2>. The distance between <P4> and <P1P2> is the radius of the section passing through <P4>. If <P1> and <P2> are confused or <P3> and <P4> are confused we have the status 'ConfusedPoints' if <P1>,<P2>,<P3>,<P4> are colinear we have the status 'ColinearPoints' If <P3P4> is perpendicular to <P1P2> we have the status 'NullAngle'. <P3P4> is colinear to <P1P2> we have the status 'NullAngle'.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:param P4:
	:type P4: gp_Pnt
	:rtype: None
") gce_MakeCone;
		 gce_MakeCone (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const gp_Pnt & P4);
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "	* Makes a Cone by its axis <Axis> and and two points. The distance between <P1> and the axis is the radius of the section passing through <P1>. The distance between <P2> and the axis is the radius of the section passing through <P2>. If <P1P2> is colinear to <Axis> we have the status 'NullAngle' If <P3P4> is perpendicular to <Axis> we have the status 'NullAngle' If <P1> and <P2> are confused we have the status 'ConfusedPoints'

	:param Axis:
	:type Axis: gp_Ax1
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") gce_MakeCone;
		 gce_MakeCone (const gp_Ax1 & Axis,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "	* Makes a Cone by its axis <Axis> and and two points. The distance between <P1> and the axis is the radius of the section passing through <P1> The distance between <P2> and the axis is the radius of the section passing through <P2> If <P1P2> is colinear to <Axis> we have the status 'NullAngle' If <P3P4> is perpendicular to <Axis> we have the status 'NullAngle' If <P1> and <P2> are confused we have the status 'ConfusedPoints'

	:param Axis:
	:type Axis: gp_Lin
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") gce_MakeCone;
		 gce_MakeCone (const gp_Lin & Axis,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") gce_MakeCone;
		%feature("autodoc", "	* Makes a Cone with two points and two radius. The axis of the solution is the line passing through <P1> and <P2>. <R1> is the radius of the section passing through <P1> and <R2> the radius of the section passing through <P2>. If <P1> and <P2> are confused we have the status 'NullAxis'. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_NegativeRadius if Radius, R1 or R2 is less than 0.0; - gce_BadAngle if Ang is less than gp::Resolution() or greater than Pi/2.- gp::Resolution(); - gce_ConfusedPoints if P1 and P2 or P3 and P4 are coincident; - gce_NullAxis if the points P1 and P2, are coincident (5th syntax only); - gce_NullAngle if: - the vector joining P1 to P2 is parallel to either Axis or the line joining P3 to P4, or - R1 and R2 are equal, (that is, their difference is less than gp::Resolution()); or - gce_NullRadius if: - the vector joining P1 to P2 is perpendicular to the line joining P3 to P4, - the vector joining P1 to P2 is perpendicular to Axis, or - P1, P2, P3, and P4 are collinear.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:rtype: None
") gce_MakeCone;
		 gce_MakeCone (const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real R1,const Standard_Real R2);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed cone. Exceptions StdFail_NotDone if no cone is constructed.

	:rtype: gp_Cone
") Value;
		const gp_Cone  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Cone
") Operator;
		const gp_Cone  Operator ();
		%feature("compactdefaultargs") operator gp_Cone;
		%feature("autodoc", "	:rtype: 
") operator gp_Cone;
		 operator gp_Cone ();
};


%extend gce_MakeCone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeCylinder;
class gce_MakeCylinder : public gce_Root {
	public:
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "	* <A2> is the local cartesian coordinate system of <self>. The status is 'NegativeRadius' if R < 0.0

	:param A2:
	:type A2: gp_Ax2
	:param Radius:
	:type Radius: float
	:rtype: None
") gce_MakeCylinder;
		 gce_MakeCylinder (const gp_Ax2 & A2,const Standard_Real Radius);
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "	* Makes a Cylinder from gp <TheCylinder> coaxial to another Cylinder <Cylinder> and passing through a Pnt <Point>.

	:param Cyl:
	:type Cyl: gp_Cylinder
	:param Point:
	:type Point: gp_Pnt
	:rtype: None
") gce_MakeCylinder;
		 gce_MakeCylinder (const gp_Cylinder & Cyl,const gp_Pnt & Point);
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "	* Makes a Cylinder from gp <TheCylinder> coaxial to another Cylinder <Cylinder> at the distance <Dist> which can be greater or lower than zero. The radius of the result is the absolute value of the radius of <Cyl> plus <Dist>

	:param Cyl:
	:type Cyl: gp_Cylinder
	:param Dist:
	:type Dist: float
	:rtype: None
") gce_MakeCylinder;
		 gce_MakeCylinder (const gp_Cylinder & Cyl,const Standard_Real Dist);
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "	* Makes a Cylinder from gp <TheCylinder> with 3 points <P1>,<P2>,<P3>. Its axis is <P1P2> and its radius is the distance between <P3> and <P1P2>

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:rtype: None
") gce_MakeCylinder;
		 gce_MakeCylinder (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3);
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "	* Makes a Cylinder by its axis <Axis> and radius <Radius>.

	:param Axis:
	:type Axis: gp_Ax1
	:param Radius:
	:type Radius: float
	:rtype: None
") gce_MakeCylinder;
		 gce_MakeCylinder (const gp_Ax1 & Axis,const Standard_Real Radius);
		%feature("compactdefaultargs") gce_MakeCylinder;
		%feature("autodoc", "	* Makes a Cylinder by its circular base. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_NegativeRadius if: - Radius is less than 0.0, or - Dist is negative and has an absolute value which is greater than the radius of Cyl; or - gce_ConfusedPoints if points P1 and P2 are coincident.

	:param Circ:
	:type Circ: gp_Circ
	:rtype: None
") gce_MakeCylinder;
		 gce_MakeCylinder (const gp_Circ & Circ);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed cylinder. Exceptions StdFail_NotDone if no cylinder is constructed.

	:rtype: gp_Cylinder
") Value;
		const gp_Cylinder  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Cylinder
") Operator;
		const gp_Cylinder  Operator ();
		%feature("compactdefaultargs") operator gp_Cylinder;
		%feature("autodoc", "	:rtype: 
") operator gp_Cylinder;
		 operator gp_Cylinder ();
};


%extend gce_MakeCylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeDir;
class gce_MakeDir : public gce_Root {
	public:
		%feature("compactdefaultargs") gce_MakeDir;
		%feature("autodoc", "	* Normalizes the vector V and creates a direction. Status is 'NullVector' if V.Magnitude() <= Resolution.

	:param V:
	:type V: gp_Vec
	:rtype: None
") gce_MakeDir;
		 gce_MakeDir (const gp_Vec & V);
		%feature("compactdefaultargs") gce_MakeDir;
		%feature("autodoc", "	* Creates a direction from a triplet of coordinates. Status is 'NullVector' if Coord.Modulus() <= Resolution from gp.

	:param Coord:
	:type Coord: gp_XYZ
	:rtype: None
") gce_MakeDir;
		 gce_MakeDir (const gp_XYZ & Coord);
		%feature("compactdefaultargs") gce_MakeDir;
		%feature("autodoc", "	* Creates a direction with its 3 cartesian coordinates. Status is 'NullVector' if Sqrt(Xv*Xv + Yv*Yv + Zv*Zv) <= Resolution

	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:param Zv:
	:type Zv: float
	:rtype: None
") gce_MakeDir;
		 gce_MakeDir (const Standard_Real Xv,const Standard_Real Yv,const Standard_Real Zv);
		%feature("compactdefaultargs") gce_MakeDir;
		%feature("autodoc", "	* Make a Dir from gp <TheDir> passing through 2 Pnt <P1>,<P2>. Status is 'ConfusedPoints' if <p1> and <P2> are confused. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_ConfusedPoints if points P1 and P2 are coincident, or - gce_NullVector if one of the following is less than or equal to gp::Resolution(): - the magnitude of vector V, - the modulus of Coord, - Sqrt(Xv*Xv + Yv*Yv + Zv*Zv).

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") gce_MakeDir;
		 gce_MakeDir (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed unit vector. Exceptions StdFail_NotDone if no unit vector is constructed.

	:rtype: gp_Dir
") Value;
		const gp_Dir  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Dir
") Operator;
		const gp_Dir  Operator ();
		%feature("compactdefaultargs") operator gp_Dir;
		%feature("autodoc", "	:rtype: 
") operator gp_Dir;
		 operator gp_Dir ();
};


%extend gce_MakeDir {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeDir2d;
class gce_MakeDir2d : public gce_Root {
	public:
		%feature("compactdefaultargs") gce_MakeDir2d;
		%feature("autodoc", "	* Normalizes the vector V and creates a direction. Status is 'NullVector' if V.Magnitude() <= Resolution.

	:param V:
	:type V: gp_Vec2d
	:rtype: None
") gce_MakeDir2d;
		 gce_MakeDir2d (const gp_Vec2d & V);
		%feature("compactdefaultargs") gce_MakeDir2d;
		%feature("autodoc", "	* Creates a direction from a triplet of coordinates. Status is 'NullVector' if Coord.Modulus() <= Resolution from gp.

	:param Coord:
	:type Coord: gp_XY
	:rtype: None
") gce_MakeDir2d;
		 gce_MakeDir2d (const gp_XY & Coord);
		%feature("compactdefaultargs") gce_MakeDir2d;
		%feature("autodoc", "	* Creates a direction with its 3 cartesian coordinates. Status is 'NullVector' if Sqrt(Xv*Xv + Yv*Yv ) <= Resolution

	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:rtype: None
") gce_MakeDir2d;
		 gce_MakeDir2d (const Standard_Real Xv,const Standard_Real Yv);
		%feature("compactdefaultargs") gce_MakeDir2d;
		%feature("autodoc", "	* Make a Dir2d from gp <TheDir> passing through 2 Pnt <P1>,<P2>. Status is 'ConfusedPoints' if <P1> and <P2> are confused. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_ConfusedPoints if points P1 and P2 are coincident, or - gce_NullVector if one of the following is less than or equal to gp::Resolution(): - the magnitude of vector V, - the modulus of Coord, - Sqrt(Xv*Xv + Yv*Yv).

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") gce_MakeDir2d;
		 gce_MakeDir2d (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed unit vector. Exceptions StdFail_NotDone if no unit vector is constructed.

	:rtype: gp_Dir2d
") Value;
		const gp_Dir2d  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Dir2d
") Operator;
		const gp_Dir2d  Operator ();
		%feature("compactdefaultargs") operator gp_Dir2d;
		%feature("autodoc", "	:rtype: 
") operator gp_Dir2d;
		 operator gp_Dir2d ();
};


%extend gce_MakeDir2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeElips;
class gce_MakeElips : public gce_Root {
	public:
		%feature("compactdefaultargs") gce_MakeElips;
		%feature("autodoc", "	* The major radius of the ellipse is on the 'XAxis' and the minor radius is on the 'YAxis' of the ellipse. The 'XAxis' is defined with the 'XDirection' of A2 and the 'YAxis' is defined with the 'YDirection' of A2. Warnings : It is not forbidden to create an ellipse with MajorRadius = MinorRadius.

	:param A2:
	:type A2: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") gce_MakeElips;
		 gce_MakeElips (const gp_Ax2 & A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("compactdefaultargs") gce_MakeElips;
		%feature("autodoc", "	* Make an ellipse with its center and two points. Warning The MakeElips class does not prevent the construction of an ellipse where the MajorRadius is equal to the MinorRadius. If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_InvertRadius if MajorRadius is less than MinorRadius; - gce_NegativeRadius if MinorRadius is less than 0.0; - gce_NullAxis if the points S1 and Center are coincident; or - gce_InvertAxis if: - the major radius computed with Center and S1 is less than the minor radius computed with Center, S1 and S2, or - Center, S1 and S2 are collinear.

	:param S1:
	:type S1: gp_Pnt
	:param S2:
	:type S2: gp_Pnt
	:param Center:
	:type Center: gp_Pnt
	:rtype: None
") gce_MakeElips;
		 gce_MakeElips (const gp_Pnt & S1,const gp_Pnt & S2,const gp_Pnt & Center);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed ellipse. Exceptions StdFail_NotDone if no ellipse is constructed.

	:rtype: gp_Elips
") Value;
		const gp_Elips  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Elips
") Operator;
		const gp_Elips  Operator ();
		%feature("compactdefaultargs") operator gp_Elips;
		%feature("autodoc", "	:rtype: 
") operator gp_Elips;
		 operator gp_Elips ();
};


%extend gce_MakeElips {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeElips2d;
class gce_MakeElips2d : public gce_Root {
	public:
		%feature("compactdefaultargs") gce_MakeElips2d;
		%feature("autodoc", "	* Creates an ellipse with the major axis, the major and the minor radius. The location of the MajorAxis is the center of the ellipse. The sense of parametrization is given by Sense. It is possible to create an ellipse with MajorRadius = MinorRadius. the status is 'InvertRadius' if MajorRadius < MinorRadius or 'NegativeRadius' if MinorRadius < 0.0

	:param MajorAxis:
	:type MajorAxis: gp_Ax2d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") gce_MakeElips2d;
		 gce_MakeElips2d (const gp_Ax2d & MajorAxis,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Boolean Sense = Standard_True);
		%feature("compactdefaultargs") gce_MakeElips2d;
		%feature("autodoc", "	* Axis defines the Xaxis and Yaxis of the ellipse which defines the origin and the sense of parametrization. Creates an ellipse with the AxisPlacement the major and the minor radius. The location of Axis is the center of the ellipse. It is possible to create an ellipse with MajorRadius = MinorRadius. the status is 'InvertRadius' if MajorRadius < MinorRadius or 'NegativeRadius' if MinorRadius < 0.0

	:param A:
	:type A: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") gce_MakeElips2d;
		 gce_MakeElips2d (const gp_Ax22d & A,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("compactdefaultargs") gce_MakeElips2d;
		%feature("autodoc", "	* Makes an Elips2d with its center and two points. The sense of parametrization is given by S1, S2, and Center. Depending on the constructor, the implicit orientation of the ellipse is: - the sense defined by A, - the sense defined by points Center, S1 and S2, - the trigonometric sense if Sense is not given or is true, or - the opposite if Sense is false. It is possible to construct an ellipse where the major and minor radii are equal. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_InvertRadius if MajorRadius is less than MinorRadius, - gce_NegativeRadius if MajorRadius or MinorRadius is less than 0.0, - gce_NullAxis if points S1, S2 and Center are collinear, or - gce_InvertAxis if the major radius computed with Center and S1 is less than the minor radius computed with Center, S1 and S2.

	:param S1:
	:type S1: gp_Pnt2d
	:param S2:
	:type S2: gp_Pnt2d
	:param Center:
	:type Center: gp_Pnt2d
	:rtype: None
") gce_MakeElips2d;
		 gce_MakeElips2d (const gp_Pnt2d & S1,const gp_Pnt2d & S2,const gp_Pnt2d & Center);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed ellipse. Exceptions StdFail_NotDone if no ellipse is constructed.

	:rtype: gp_Elips2d
") Value;
		const gp_Elips2d  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Elips2d
") Operator;
		const gp_Elips2d  Operator ();
		%feature("compactdefaultargs") operator gp_Elips2d;
		%feature("autodoc", "	:rtype: 
") operator gp_Elips2d;
		 operator gp_Elips2d ();
};


%extend gce_MakeElips2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeHypr;
class gce_MakeHypr : public gce_Root {
	public:
		%feature("compactdefaultargs") gce_MakeHypr;
		%feature("autodoc", "	* A2 is the local coordinate system of the hyperbola. In the local coordinates system A2 the equation of the hyperbola is : X*X / MajorRadius*MajorRadius - Y*Y / MinorRadius*MinorRadius = 1.0 It is not forbidden to create an Hyperbola with MajorRadius = MinorRadius. For the hyperbola the MajorRadius can be lower than the MinorRadius. The status is 'NegativeRadius' if MajorRadius < 0.0 and 'InvertRadius' if MinorRadius > MajorRadius.

	:param A2:
	:type A2: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") gce_MakeHypr;
		 gce_MakeHypr (const gp_Ax2 & A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("compactdefaultargs") gce_MakeHypr;
		%feature("autodoc", "	* Constructs a hyperbola - centered on the point Center, where: - the plane of the hyperbola is defined by Center, S1 and S2, - its major axis is defined by Center and S1, - its major radius is the distance between Center and S1, and - its minor radius is the distance between S2 and the major axis. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_NegativeRadius if MajorRadius is less than 0.0; - gce_InvertRadius if: - the major radius (computed with Center, S1) is less than the minor radius (computed with Center, S1 and S2), or - MajorRadius is less than MinorRadius; or - gce_ColinearPoints if S1, S2 and Center are collinear.

	:param S1:
	:type S1: gp_Pnt
	:param S2:
	:type S2: gp_Pnt
	:param Center:
	:type Center: gp_Pnt
	:rtype: None
") gce_MakeHypr;
		 gce_MakeHypr (const gp_Pnt & S1,const gp_Pnt & S2,const gp_Pnt & Center);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed hyperbola. Exceptions StdFail_NotDone if no hyperbola is constructed.

	:rtype: gp_Hypr
") Value;
		const gp_Hypr  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Hypr
") Operator;
		const gp_Hypr  Operator ();
		%feature("compactdefaultargs") operator gp_Hypr;
		%feature("autodoc", "	:rtype: 
") operator gp_Hypr;
		 operator gp_Hypr ();
};


%extend gce_MakeHypr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeHypr2d;
class gce_MakeHypr2d : public gce_Root {
	public:
		%feature("compactdefaultargs") gce_MakeHypr2d;
		%feature("autodoc", "	* Constructs a hyperbola centered on the point Center, where: - the major axis of the hyperbola is defined by Center and point S1, - the major radius is the distance between Center and S1, and - the minor radius is the distance between point S2 and the major axis.

	:param S1:
	:type S1: gp_Pnt2d
	:param S2:
	:type S2: gp_Pnt2d
	:param Center:
	:type Center: gp_Pnt2d
	:rtype: None
") gce_MakeHypr2d;
		 gce_MakeHypr2d (const gp_Pnt2d & S1,const gp_Pnt2d & S2,const gp_Pnt2d & Center);
		%feature("compactdefaultargs") gce_MakeHypr2d;
		%feature("autodoc", "	* Constructs a hyperbola with major and minor radii MajorRadius and MinorRadius, where: - the center of the hyperbola is the origin of the axis MajorAxis, and - the major axis is defined by MajorAxis if Sense is true, or the opposite axis to MajorAxis if Sense is false; or - centered on the origin of the coordinate system A, with major and minor radii MajorRadius and MinorRadius, where its major axis is the 'X Axis' of A (A is the local coordinate system of the hyperbola).

	:param MajorAxis:
	:type MajorAxis: gp_Ax2d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param Sense:
	:type Sense: bool
	:rtype: None
") gce_MakeHypr2d;
		 gce_MakeHypr2d (const gp_Ax2d & MajorAxis,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Boolean Sense);
		%feature("compactdefaultargs") gce_MakeHypr2d;
		%feature("autodoc", "	* Creates a Hypr2d centered on the origin of the coordinate system A, with major and minor radii MajorRadius and MinorRadius, where its major axis is the 'X Axis' of A (A is the local coordinate system of the hyperbola).

	:param A:
	:type A: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") gce_MakeHypr2d;
		 gce_MakeHypr2d (const gp_Ax22d & A,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed hyperbola. Exceptions StdFail_NotDone if no hyperbola is constructed.

	:rtype: gp_Hypr2d
") Value;
		const gp_Hypr2d  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Hypr2d
") Operator;
		const gp_Hypr2d  Operator ();
		%feature("compactdefaultargs") operator gp_Hypr2d;
		%feature("autodoc", "	:rtype: 
") operator gp_Hypr2d;
		 operator gp_Hypr2d ();
};


%extend gce_MakeHypr2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeLin;
class gce_MakeLin : public gce_Root {
	public:
		%feature("compactdefaultargs") gce_MakeLin;
		%feature("autodoc", "	* Creates a line located along the axis A1.

	:param A1:
	:type A1: gp_Ax1
	:rtype: None
") gce_MakeLin;
		 gce_MakeLin (const gp_Ax1 & A1);
		%feature("compactdefaultargs") gce_MakeLin;
		%feature("autodoc", "	* <P> is the location point (origin) of the line and <V> is the direction of the line.

	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Dir
	:rtype: None
") gce_MakeLin;
		 gce_MakeLin (const gp_Pnt & P,const gp_Dir & V);
		%feature("compactdefaultargs") gce_MakeLin;
		%feature("autodoc", "	* Make a Lin from gp <TheLin> parallel to another Lin <Lin> and passing through a Pnt <Point>.

	:param Lin:
	:type Lin: gp_Lin
	:param Point:
	:type Point: gp_Pnt
	:rtype: None
") gce_MakeLin;
		 gce_MakeLin (const gp_Lin & Lin,const gp_Pnt & Point);
		%feature("compactdefaultargs") gce_MakeLin;
		%feature("autodoc", "	* Make a Lin from gp <TheLin> passing through 2 Pnt <P1>,<P2>. It returns false if <p1> and <P2> are confused.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") gce_MakeLin;
		 gce_MakeLin (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed line. Exceptions StdFail_NotDone is raised if no line is constructed.

	:rtype: gp_Lin
") Value;
		const gp_Lin  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Lin
") Operator;
		const gp_Lin  Operator ();
		%feature("compactdefaultargs") operator gp_Lin;
		%feature("autodoc", "	:rtype: 
") operator gp_Lin;
		 operator gp_Lin ();
};


%extend gce_MakeLin {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeLin2d;
class gce_MakeLin2d : public gce_Root {
	public:
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "	* Creates a line located with A.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") gce_MakeLin2d;
		 gce_MakeLin2d (const gp_Ax2d & A);
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "	* <P> is the location point (origin) of the line and <V> is the direction of the line.

	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Dir2d
	:rtype: None
") gce_MakeLin2d;
		 gce_MakeLin2d (const gp_Pnt2d & P,const gp_Dir2d & V);
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "	* Creates the line from the equation A*X + B*Y + C = 0.0 the status is 'NullAxis'if Sqrt(A*A + B*B) <= Resolution from gp.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:rtype: None
") gce_MakeLin2d;
		 gce_MakeLin2d (const Standard_Real A,const Standard_Real B,const Standard_Real C);
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "	* Make a Lin2d from gp <TheLin> parallel to another Lin2d <Lin> at a distance <Dist>. If Dist is greater than zero the result is on the right of the Line <Lin>, else the result is on the left of the Line <Lin>.

	:param Lin:
	:type Lin: gp_Lin2d
	:param Dist:
	:type Dist: float
	:rtype: None
") gce_MakeLin2d;
		 gce_MakeLin2d (const gp_Lin2d & Lin,const Standard_Real Dist);
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "	* Make a Lin2d from gp <TheLin> parallel to another Lin2d <Lin> and passing through a Pnt2d <Point>.

	:param Lin:
	:type Lin: gp_Lin2d
	:param Point:
	:type Point: gp_Pnt2d
	:rtype: None
") gce_MakeLin2d;
		 gce_MakeLin2d (const gp_Lin2d & Lin,const gp_Pnt2d & Point);
		%feature("compactdefaultargs") gce_MakeLin2d;
		%feature("autodoc", "	* Make a Lin2d from gp <TheLin> passing through 2 Pnt2d <P1>,<P2>. It returns false if <P1> and <P2> are confused. Warning If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_NullAxis if Sqrt(A*A + B*B) is less than or equal to gp::Resolution(), or - gce_ConfusedPoints if points P1 and P2 are coincident.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") gce_MakeLin2d;
		 gce_MakeLin2d (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed line. Exceptions StdFail_NotDone if no line is constructed.

	:rtype: gp_Lin2d
") Value;
		gp_Lin2d Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Lin2d
") Operator;
		gp_Lin2d Operator ();
		%feature("compactdefaultargs") operator gp_Lin2d;
		%feature("autodoc", "	:rtype: 
") operator gp_Lin2d;
		 operator gp_Lin2d ();
};


%extend gce_MakeLin2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeParab;
class gce_MakeParab : public gce_Root {
	public:
		%feature("compactdefaultargs") gce_MakeParab;
		%feature("autodoc", "	* --- Purpose ; Creates a parabola with its local coordinate system 'A2' and it's focal length 'Focal'. The XDirection of A2 defines the axis of symmetry of the parabola. The YDirection of A2 is parallel to the directrix of the parabola. The Location point of A2 is the vertex of the parabola The status is 'NullFocusLength' if Focal < 0.0

	:param A2:
	:type A2: gp_Ax2
	:param Focal:
	:type Focal: float
	:rtype: None
") gce_MakeParab;
		 gce_MakeParab (const gp_Ax2 & A2,const Standard_Real Focal);
		%feature("compactdefaultargs") gce_MakeParab;
		%feature("autodoc", "	* D is the directrix of the parabola and F the focus point. The symmetry axis (XAxis) of the parabola is normal to the directrix and pass through the focus point F, but its location point is the vertex of the parabola. The YAxis of the parabola is parallel to D and its location point is the vertex of the parabola. The normal to the plane of the parabola is the cross product between the XAxis and the YAxis.

	:param D:
	:type D: gp_Ax1
	:param F:
	:type F: gp_Pnt
	:rtype: None
") gce_MakeParab;
		 gce_MakeParab (const gp_Ax1 & D,const gp_Pnt & F);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed parabola. Exceptions StdFail_NotDone if no parabola is constructed.

	:rtype: gp_Parab
") Value;
		const gp_Parab  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Parab
") Operator;
		const gp_Parab  Operator ();
		%feature("compactdefaultargs") operator gp_Parab;
		%feature("autodoc", "	:rtype: 
") operator gp_Parab;
		 operator gp_Parab ();
};


%extend gce_MakeParab {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakeParab2d;
class gce_MakeParab2d : public gce_Root {
	public:
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "	* Creates a parabola with its axis of symmetry ('MirrorAxis') and its focal length. Warnings : It is possible to have Focal = 0. The status is 'NullFocalLength' Raised if Focal < 0.0

	:param MirrorAxis:
	:type MirrorAxis: gp_Ax2d
	:param Focal:
	:type Focal: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") gce_MakeParab2d;
		 gce_MakeParab2d (const gp_Ax2d & MirrorAxis,const Standard_Real Focal,const Standard_Boolean Sense = Standard_True);
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "	* Creates a parabola with its local coordinate system <A> and its focal length. Warnings : It is possible to have Focal = 0. The status is 'NullFocalLength' Raised if Focal < 0.0

	:param A:
	:type A: gp_Ax22d
	:param Focal:
	:type Focal: float
	:rtype: None
") gce_MakeParab2d;
		 gce_MakeParab2d (const gp_Ax22d & A,const Standard_Real Focal);
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "	* Creates a parabola with the directrix and the focus point. The sense of parametrization is given by Sense.

	:param D:
	:type D: gp_Ax2d
	:param F:
	:type F: gp_Pnt2d
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") gce_MakeParab2d;
		 gce_MakeParab2d (const gp_Ax2d & D,const gp_Pnt2d & F,const Standard_Boolean Sense = Standard_True);
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "	* Creates a parabola with the local coordinate system and the focus point. The sense of parametrization is given by Sense.

	:param D:
	:type D: gp_Ax22d
	:param F:
	:type F: gp_Pnt2d
	:rtype: None
") gce_MakeParab2d;
		 gce_MakeParab2d (const gp_Ax22d & D,const gp_Pnt2d & F);
		%feature("compactdefaultargs") gce_MakeParab2d;
		%feature("autodoc", "	* Make an Parab2d with S1 as the Focal point and Center as the apex of the parabola Warning The MakeParab2d class does not prevent the construction of a parabola with a null focal distance. If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_NullFocusLength if Focal is less than 0.0, or - gce_NullAxis if S1 and Center are coincident.

	:param S1:
	:type S1: gp_Pnt2d
	:param Center:
	:type Center: gp_Pnt2d
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") gce_MakeParab2d;
		 gce_MakeParab2d (const gp_Pnt2d & S1,const gp_Pnt2d & Center,const Standard_Boolean Sense = Standard_True);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed parabola. Exceptions StdFail_NotDone if no parabola is constructed.

	:rtype: gp_Parab2d
") Value;
		const gp_Parab2d  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Parab2d
") Operator;
		const gp_Parab2d  Operator ();
		%feature("compactdefaultargs") operator gp_Parab2d;
		%feature("autodoc", "	:rtype: 
") operator gp_Parab2d;
		 operator gp_Parab2d ();
};


%extend gce_MakeParab2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor gce_MakePln;
class gce_MakePln : public gce_Root {
	public:
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "	* The coordinate system of the plane is defined with the axis placement A2. The 'Direction' of A2 defines the normal to the plane. The 'Location' of A2 defines the location (origin) of the plane. The 'XDirection' and 'YDirection' of A2 define the 'XAxis' and the 'YAxis' of the plane used to parametrize the plane.

	:param A2:
	:type A2: gp_Ax2
	:rtype: None
") gce_MakePln;
		 gce_MakePln (const gp_Ax2 & A2);
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "	* Creates a plane with the 'Location' point <P> and the normal direction <V>.

	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Dir
	:rtype: None
") gce_MakePln;
		 gce_MakePln (const gp_Pnt & P,const gp_Dir & V);
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "	* Creates a plane from its cartesian equation : A * X + B * Y + C * Z + D = 0.0 //! the status is 'BadEquation' if Sqrt (A*A + B*B + C*C) <= Resolution from gp.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:param D:
	:type D: float
	:rtype: None
") gce_MakePln;
		 gce_MakePln (const Standard_Real A,const Standard_Real B,const Standard_Real C,const Standard_Real D);
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "	* Make a Pln from gp <ThePln> parallel to another Pln <Pln> and passing through a Pnt <Point>.

	:param Pln:
	:type Pln: gp_Pln
	:param Point:
	:type Point: gp_Pnt
	:rtype: None
") gce_MakePln;
		 gce_MakePln (const gp_Pln & Pln,const gp_Pnt & Point);
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "	* Make a Pln from gp <ThePln> parallel to another Pln <Pln> at the distance <Dist> which can be greater or less than zero. In the first case the result is at the distance <Dist> to the plane <Pln> in the direction of the normal to <Pln>. Otherwize it is in the opposite direction.

	:param Pln:
	:type Pln: gp_Pln
	:param Dist:
	:type Dist: float
	:rtype: None
") gce_MakePln;
		 gce_MakePln (const gp_Pln & Pln,const Standard_Real Dist);
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "	* Make a Pln from gp <ThePln> passing through 3 Pnt <P1>,<P2>,<P3>. It returns false if <P1> <P2> <P3> are confused.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:rtype: None
") gce_MakePln;
		 gce_MakePln (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3);
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "	* Make a Pln from gp <ThePln> perpendicular to the line passing through <P1>,<P2>. The status is 'ConfusedPoints' if <P1> <P2> are confused.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") gce_MakePln;
		 gce_MakePln (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("compactdefaultargs") gce_MakePln;
		%feature("autodoc", "	* Make a pln passing through the location of <Axis>and normal to the Direction of <Axis>. Warning - If an error occurs (that is, when IsDone returns false), the Status function returns: - gce_BadEquation if Sqrt(A*A + B*B + C*C) is less than or equal to gp::Resolution(), - gce_ConfusedPoints if P1 and P2 are coincident, or - gce_ColinearPoints if P1, P2 and P3 are collinear.

	:param Axis:
	:type Axis: gp_Ax1
	:rtype: None
") gce_MakePln;
		 gce_MakePln (const gp_Ax1 & Axis);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the constructed plane. Exceptions StdFail_NotDone if no plane is constructed.

	:rtype: gp_Pln
") Value;
		const gp_Pln  Value ();
		%feature("compactdefaultargs") Operator;
		%feature("autodoc", "	:rtype: gp_Pln
") Operator;
		const gp_Pln  Operator ();
		%feature("compactdefaultargs") operator gp_Pln;
		%feature("autodoc", "	:rtype: 
") operator gp_Pln;
		 operator gp_Pln ();
};


%extend gce_MakePln {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
